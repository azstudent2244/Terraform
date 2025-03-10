terraform {
  required_version = "~> 1.9.8"
  required_providers {
    azurerm = {
      "source" = "hashicorp/azurerm"
      version  = ">=3.43.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "a7a3308e-c28a-43f6-a448-4f39379cc15a"
  features {}
}


resource "azurerm_resource_group" "rg" {
  name     = "Test_RG"
  location = "East US"
}

resource "azurerm_virtual_network" "vnet111" {
  name                = "vnet111"
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
}
