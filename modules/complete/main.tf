
locals {
  eips = { for k, v in var.eips: k => v if var.create}
}

resource "tencentcloud_eip" "eips" {
  for_each = local.eips
  name     = each.value.name
  internet_charge_type = (
    try(each.value.bandwidth_package_id, "") != "" ?
    "BANDWIDTH_PACKAGE" :
    try(each.value.internet_charge_type, "TRAFFIC_POSTPAID_BY_HOUR")
  )
  internet_max_bandwidth_out = try(each.value.internet_max_bandwidth_out, 100)
  type                       = try(each.value.type, "EIP")
  internet_service_provider  = try(each.value.internet_service_provider, "BGP")
  bandwidth_package_id = (
    try(each.value.bandwidth_package_id, "") != "" ?
    try(each.value.bandwidth_package_id, null) :
    null
  )
  tags = try(each.value.tags, {})
}