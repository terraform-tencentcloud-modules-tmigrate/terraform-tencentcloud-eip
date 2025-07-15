variable "eips" {
  type        = any
  default     = {}
  description = "Map of eips to create. Eip name is the map key.see `tencentcloud_eip` "
}

variable "create" {
  default = true
  type = bool
}