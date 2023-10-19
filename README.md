# terraform-vcd-nsxt-ip-set

Terraform module which manages IP-Set ressources on VMWare Cloud Director.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.9 |
| <a name="requirement_vcd"></a> [vcd](#requirement\_vcd) | >= 3.9.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vcd"></a> [vcd](#provider\_vcd) | 3.9.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vcd_nsxt_ip_set.nsxt_ip_set](https://registry.terraform.io/providers/vmware/vcd/latest/docs/resources/nsxt_ip_set) | resource |
| [vcd_nsxt_edgegateway.nsxt_edgegateway](https://registry.terraform.io/providers/vmware/vcd/latest/docs/data-sources/nsxt_edgegateway) | data source |
| [vcd_vdc_group.vdc_group](https://registry.terraform.io/providers/vmware/vcd/latest/docs/data-sources/vdc_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | A name for the IP-Set. | `string` | n/a | yes |
| <a name="input_vdc_edgegateway_name"></a> [vdc\_edgegateway\_name](#input\_vdc\_edgegateway\_name) | The name for the Edge Gateway. | `string` | n/a | yes |
| <a name="input_vdc_group_name"></a> [vdc\_group\_name](#input\_vdc\_group\_name) | The name of the VDC group. | `string` | n/a | yes |
| <a name="input_vdc_org_name"></a> [vdc\_org\_name](#input\_vdc\_org\_name) | The name of the organization to use. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | A description of the IP-Set. | `string` | `null` | no |
| <a name="input_ip_addresses"></a> [ip\_addresses](#input\_ip\_addresses) | A set of IP addresses, subnets or ranges (IPv4 or IPv6). | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the IP-Set. |
| <a name="output_name"></a> [name](#output\_name) | The name of the IP-Set. |
<!-- END_TF_DOCS -->

## Examples

### Single instance

```
module "webserver_ip_set" {
  source               = "git::https://github.com/noris-network/terraform-vcd-nsxt-ip-set?ref=1.0.0"
  name                 = "webserver"
  vdc_org_name         = "myORG"
  vdc_group_name       = "myDC01"
  vdc_edgegateway_name = "T1-myORG"
  ip_addresses         = ["192.168.0.10", "192.168.0.11"]
}
```

### Real world example

```
locals {
  ip_sets = [
    {
      name         = "webserver"
      ip_addresses = ["192.168.0.10", "192.168.0.11"]
    }
  ]
}

module "webserver_ip_set" {
  source               = "git::https://github.com/noris-network/terraform-vcd-nsxt-ip-set?ref=1.0.0"
  for_each             = { for ip_set in locals.ip_sets : ip_set.name => ip_set }
  vdc_org_name         = var.vdc_org_name
  name                 = each.value.name
  vdc_edgegateway_name = var.vdc_edge_gateway_name
  vdc_group_name       = var.vdc_group_name
  ip_addresses         = each.value.ip_addresses
}
```
