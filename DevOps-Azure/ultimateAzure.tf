# Configure the Azure Provider
provider "azurerm" {
subscription_id = "c8398dc1-b671-4b68-b6fd-481c72a4d32f"
   tenant_id       = "6e643e51-3436-4010-8738-c72b490ef060"
   client_id       = "0f3e800c-5ec0-4255-8984-00ea9b3b9f74"
   client_secret   = "Cdt@12345678"
}
# Create a virtual network within the resource group
resource "azurerm_virtual_network" "network" {
  name                = "cdtlab-network"
  address_space       = ["10.0.0.0/16"]
  location            = "eastus"
  //Setando o Grupo de Recurso da Azure
  resource_group_name = "terraform"
  

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  }

  subnet {
    name           = "subnet3"
    address_prefix = "10.0.3.0/24"
  }
}
