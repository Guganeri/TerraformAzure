# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider  
  subscription_id  = ""
  tenant_id        = ""
  client_id        = ""  
  client_secret    = "" 
  
}

# Create a resource group
resource "azurerm_resource_group" "Service Fabric" {
  name     = "Testando Terraform" #Grupo de Recursos
  location = "eastus"             #Localização das Maquinas 
  
    tags{
      enviroment = "Terraform Demo"
    }
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "test" {
  name                = "production-network"
  resource_group_name = "${azurerm_resource_group.test.name}"
  location            = "${azurerm_resource_group.test.location}"
  address_space       = ["10.0.0.0/16"]
}

# Upgrade a new version for Service Fabric
resource "azurerm_resource_group" "test" {
  name     = "example-resources"
  location = "West US"
}

resource "azurerm_service_fabric_cluster" "test" {
  name                 = "example-servicefabric"
  resource_group_name  = "${azurerm_resource_group.test.name}"
  location             = "${azurerm_resource_group.test.location}"
  reliability_level    = "Bronze"
  upgrade_mode         = "Manual"
  cluster_code_version = "6.3.176.9494"
  vm_image             = "Windows"
  management_endpoint  = "https://example:80"

  node_type {
    name                 = "first"
    instance_count       = 3
    is_primary           = true
    client_endpoint_port = 2020
    http_endpoint_port   = 80
  }
}