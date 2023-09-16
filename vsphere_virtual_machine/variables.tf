variable "vsphere_datacenter" {
  type    = string
  default = "IT Labs"
}

variable "vsphere_resource_pool" {
  type    = string
  default = "Automation"
}

variable "vsphere_host" {
  type    = string
  default = "esxi-e5-2696v4.itlabs.local"
}

variable "vsphere_datastore" {
  type    = string
  default = "Samsung SSD 850 EVO 500 GB"
}

variable "vsphere_network" {
  type    = string
  default = "VM Network"
}

variable "template" {
  type    = string
  default = "Oracle Linux 8.7"
}

variable "name" {
  type    = string
}

variable "firmware" {
  type    = string
  default = "efi"
}

variable "num_cpus" {
  type    = number
  default = 2
}

variable "memory" {
  type    = number
  default = 2048
}

variable "guest_id" {
  type    = string
  default = "oracleLinux8_64Guest"
}

variable "use_static_mac" {
  type    = bool
  default = false
}

variable "mac_address" {
  type    = string
  default = null
}

variable "disk_label" {
  type    = string
  default = "System"
}

variable "disk_size" {
  type    = number
  default = 20
}

variable "host_name" {
  type    = string
  default = "oraclelinux"
}

variable "domain" {
  type    = string
  default = "itlabs.local"
}

variable "ipv4_address" {
  type    = string
  default = "192.168.0.50"
}


variable "ipv4_netmask" {
  type    = number
  default = 24
}


variable "ipv4_gateway" {
  type    = string
  default = "192.168.0.1"
}


variable "dns_server_list" {
  type    = list(string)
  default = ["192.168.0.2"]
}

variable "run_once_command_list" {
  type    = list(string)
  default = null
}
