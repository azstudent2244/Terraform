terraform {
  backend "azurerm" {
    subscription_id      = "a7a3308e-c28a-43f6-a448-4f39379cc15a"
    resource_group_name  = "Test_RG"
    storage_account_name = "testalbstrg001"
    container_name       = "terraform-state"
    }

  required_version = "~> 1.11.1"
  required_providers {
    azurerm = {
      "source" = "hashicorp/azurerm"
      version  = ">=3.43.0"
    }
  }
}

provider "azurerm" {
  tenant_id       = "3b56b6b5-f370-4e2e-a46b-70e86e1f77ec"
  subscription_id = "a7a3308e-c28a-43f6-a448-4f39379cc15a"
  features {}
}


resource "azurerm_resource_group" "rg" {
  name     = "Test_RG"
  location = "East US"
}

resource "azurerm_storage_account" "str1" {
  name                = testalbstrg001
  resource_group_name = azurerm_resource_group.rg.name
  account_tier = "Standard"
  account_replication_type = "LRS"
  location = azurerm_resource_group.rg.location
}

resource "azurerm_virtual_network" "vnet111" {
  name                = "vnet111"
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
}
