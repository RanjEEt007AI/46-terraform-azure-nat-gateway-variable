# Resource Group
resource "azurerm_resource_group" "ranjeet-rg" {
  name     = var.resource_group_name
  location = var.location
}

# Virtual Network
resource "azurerm_virtual_network" "ranjeet-vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.ranjeet-rg.location
  resource_group_name = azurerm_resource_group.ranjeet-rg.name
  address_space       = var.vnet_address_space
}

# Subnet
resource "azurerm_subnet" "ranjeet-subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.ranjeet-rg.name
  virtual_network_name = azurerm_virtual_network.ranjeet-vnet.name
  address_prefixes     = var.subnet_prefix
}

# Public IP for NAT Gateway
resource "azurerm_public_ip" "ranjeet-nat-ip" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.ranjeet-rg.location
  resource_group_name = azurerm_resource_group.ranjeet-rg.name

  allocation_method = "Static"
  sku               = "Standard"
}

# NAT Gateway
resource "azurerm_nat_gateway" "ranjeet-nat" {
  name                    = var.nat_gateway_name
  location                = azurerm_resource_group.ranjeet-rg.location
  resource_group_name     = azurerm_resource_group.ranjeet-rg.name
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10
}

# Associate Public IP with NAT Gateway
resource "azurerm_nat_gateway_public_ip_association" "association" {
  nat_gateway_id       = azurerm_nat_gateway.ranjeet-nat.id
  public_ip_address_id = azurerm_public_ip.ranjeet-nat-ip.id
}

# Associate NAT Gateway with subnet
resource "azurerm_subnet_nat_gateway_association" "subnet_association" {
  subnet_id      = azurerm_subnet.ranjeet-subnet.id
  nat_gateway_id = azurerm_nat_gateway.ranjeet-nat.id
}