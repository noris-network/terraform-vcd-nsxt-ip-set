variable "vdc_org_name" {
  description = "The name of the organization to use."
  type        = string
}

variable "name" {
  description = "A name for the IP-Set."
  type        = string
}

variable "description" {
  description = "A description of the IP-Set."
  type        = string
  default     = null
}

variable "vdc_group_name" {
  description = "The name of the VDC group."
  type        = string
}

variable "vdc_edgegateway_name" {
  description = "The name for the Edge Gateway."
  type        = string
}

variable "ip_addresses" {
  description = "A set of IP addresses, subnets or ranges (IPv4 or IPv6)."
  type        = list(string)
  default     = null
}
