variable "app_name" {}

terraform {
  backend "azurerm" {
    container_name       = "tfstate"
  }
}

provider "azurerm" {
  version = "=1.21.0"
}
data "azurerm_resource_group" "app_prd_rg" {
  name = "${var.app_name}-prd-rg"
}

resource "azurerm_public_ip" "app_rg" {
  name                = "${var.app_name}-pip"
  location            = "${data.azurerm_resource_group.app_prd_rg.location}"
  resource_group_name = "${data.azurerm_resource_group.app_prd_rg.name}"
  allocation_method   = "Static"
}


