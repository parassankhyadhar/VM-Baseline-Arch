resource "azurerm_application_gateway" "app-gateway" {
  name                = var.app_gateway_name
  resource_group_name = var.resource_group_name
  location            = var.location
  dynamic "backend_address_pool" {
    for_each = var.backend_address_pool
    content {
      name = backend_address_pool.value.name
    }
  }
  dynamic "backend_http_settings" {
    for_each = var.backend_address_pool
    content {
      cookie_based_affinity = backend_http_settings.value.cookie_based_affinity
      name                  = backend_http_settings.value.name
      port                  = backend_http_settings.value.port
      protocol              = backend_http_settings.value.protocol
    }
  }
  dynamic "frontend_ip_configuration" {
    for_each = var.frontend_ip_configuration
    content {
      name = frontend_ip_configuration.value.name
    }
  }
  dynamic "frontend_port" {
    for_each = var.frontend_port
    content {
      name = frontend_port.value.name
      port = frontend_port.value.port
    }
  }
  dynamic "gateway_ip_configuration" {
    for_each = var.gateway_ip_configuration
    content {
      name      = gateway_ip_configuration.value.name
      subnet_id = gateway_ip_configuration.value.subnet_id
    }
  }
  dynamic "http_listener" {
    for_each = var.http_listener
    content {
      name                           = http_listener.value.name
      frontend_ip_configuration_name = http_listener.value.frontend_ip_configuration_name
      frontend_port_name             = http_listener.value.frontend_port_name
      protocol                       = http_listener.value.protocol
    }
  }
  dynamic "request_routing_rule" {
    for_each = var.request_routing_rule
    content {
      name               = http_listener.value.name
      rule_type          = http_listener.value.rule_type
      http_listener_name = http_listener.value.http_listener_name
    }
  }
  sku {
    name = var.sku.name
    tier = var.sku.tier
  }
}
