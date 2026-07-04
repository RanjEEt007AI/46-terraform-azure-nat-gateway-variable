variable "resource_group_name" {}

variable "location" {}

variable "vnet_name" {}

variable "vnet_address_space" {
  type = list(string)
}

variable "subnet_name" {}

variable "subnet_prefix" {
  type = list(string)
}

variable "public_ip_name" {}

variable "nat_gateway_name" {}