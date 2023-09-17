data "vsphere_datacenter" "datacenter" {
  name = var.vsphere_datacenter
}

data "vsphere_host" "host" {
 // name          = var.vsphere_host
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_resource_pool" "main" {
  name          = var.vsphere_resource_pool
  datacenter_id = data.vsphere_datacenter.datacenter.id
}


data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.template
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "vm" {

  name             = var.name

  resource_pool_id = data.vsphere_resource_pool.main.id
  datastore_id     = data.vsphere_datastore.datastore.id
  
  firmware         = var.firmware
  num_cpus         = var.num_cpus
  memory           = var.memory
  guest_id         = var.guest_id

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  #Storage
  disk {
    label            = var.disk_label 
    size             = var.disk_size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {

    template_uuid = data.vsphere_virtual_machine.template.id

    customize {

      linux_options {
        host_name = var.host_name
        domain    = var.domain
       /* script_text = <<EOT
          dnf update -y
          dnf upgrade -y
          dnf install httpd -y
          systemctl start httpd
          systemctl enable --now httpd
          firewall-cmd --permanent --zone=public --add-service=http
          firewall-cmd --reload
          firewall-cmd --list-all --zone=public
          cd /var/www/html
          
        EOT*/
#cat <<EOF | tee index.html\n<html><head><title>Welcome to my test site!</title></head><body>This site is for testing purposes only</body></html>EOF
      }

      network_interface {
        ipv4_address = var.ipv4_address
        ipv4_netmask = var.ipv4_netmask
      }
      ipv4_gateway    = var.ipv4_gateway
      dns_server_list = var.dns_server_list
    }
  }



}/**/
