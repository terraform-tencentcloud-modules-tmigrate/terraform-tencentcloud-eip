
output "ids" {
  description = "The output here is the instance name and instance ID of the EIP."
  value       = { for eip_name, eip in tencentcloud_eip.eips : eip_name => eip.id }
}
output "public_ips" {
  description = "The output here is the instance name and the EIP address."
  value       = { for eip_name, eip in tencentcloud_eip.eips : eip_name => eip.public_ip }
}