resource "azurerm_resource_group" "terra" {
  name     = "terra"
  location = "East US 2"
}

resource "azurerm_resource_group" "storeterra" {
  name     = "example-resources"
  location = "East US"
}

resource "azurerm_storage_account" "saterra" {
  name                     = "terrastorage890"
  resource_group_name      = azurerm_resource_group.storeterra.name
  location                 = azurerm_resource_group.storeterra.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "sacontainer" {
  name                   = "terra-container"
  storage_account_id     = azurerm_storage_account.saterra.id   # Use storage_account_id here
  container_access_type  = "private"
}
