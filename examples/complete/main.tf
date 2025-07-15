module "eips" {
  source = "../../modules/complete"
  eips = {
    eip1 = {
      name                       = "eip1"
      internet_max_bandwidth_out = 10
      type                       = "EIP"
      internet_service_provider  = "BGP"
      bandwidth_package_id       = ""
    }
  }
}

locals {
  bwp_id = "bwp-hf4zo1sy"
  internet_service_provider  = "BGP"
}
module "eip-with-pkg" {
  source = "../../modules/complete"
  eips = {
    bwp = {
      name                       = "bwp"
      internet_max_bandwidth_out = 10
      type                       = "EIP"
      internet_service_provider  = local.internet_service_provider
      bandwidth_package_id       = local.bwp_id
    },
  }
}

resource "tencentcloud_vpc_bandwidth_package_attachment" "attachment" {
  resource_id          = module.eip-with-pkg.ids["bwp"]
  bandwidth_package_id = local.bwp_id
  network_type         = local.internet_service_provider
  resource_type        = "Address"
}