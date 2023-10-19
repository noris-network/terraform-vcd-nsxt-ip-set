data "vcd_vdc_group" "vdc_group" {
  name = var.vdc_group_name
}

data "vcd_nsxt_edgegateway" "nsxt_edgegateway" {
  org      = var.vdc_org_name
  owner_id = data.vcd_vdc_group.vdc_group.id
  name     = var.vdc_edgegateway_name
}

resource "vcd_nsxt_ip_set" "nsxt_ip_set" {
  org             = var.vdc_org_name
  edge_gateway_id = data.vcd_nsxt_edgegateway.nsxt_edgegateway.id
  name            = var.name
  ip_addresses    = var.ip_addresses
  description     = var.description

  lifecycle {
    create_before_destroy = true
  }
}
