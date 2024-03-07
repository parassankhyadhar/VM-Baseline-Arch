variable "app_gateway_name" {
  description = "value"
  type        = string
}

variable "resource_group_name" {
  description = "value"
  type        = string
}

variable "location" {
  description = "value"
  type        = string
}

variable "backend_address_pool" {
  description = "value"
  type = list(object({
    name = string
  }))
}

variable "backend_http_settings" {
  description = "value"
  type = list(object({
    cookie_based_affinity = string
    name                  = string
    port                  = number
    protocol              = string
  }))
}

variable "frontend_ip_configuration" {
  description = "value"
  type = list(object({
    name = string
  }))
}

variable "frontend_port" {
  description = "value"
  type = list(object({
    name = string
    port = number
  }))
}

variable "gateway_ip_configuration" {
  description = "value"
  type = list(object({
    name      = string
    subnet_id = string
  }))
}


variable "http_listener" {
  description = "value"
  type = list(object({
    name                           = string
    frontend_ip_configuration_name = string
    frontend_port_name             = string
    protocol                       = string
  }))
}


variable "request_routing_rule" {
  description = "value"
  type = list(object({
    name               = string
    rule_type          = string
    http_listener_name = string
  }))
}

variable "sku" {
  description = "value"
  type = object({
    name = string
    tier = string
  })
}

variable "waf_configuration" {
  description = "value"
  type = object({
    enabled          = bool
    firewall_mode    = string
    rule_set_version = string
  })
}

