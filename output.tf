output "sg_id" {
    value = "${data.alicloud_security_groups.primary_security_groups.groups.0.id}"
}

output "image_id" {
    value = "${data.alicloud_images.default_images.images.0.id}"
}

output "vsw_id" {
    value = "${data.alicloud_vswitches.default_vsw.vswitches.0.id}"
}

output "instance_type" {
    value = "${data.alicloud_instance_types.type.instance_types.0.id}"
}

output "key_pair" {
    value = "${data.alicloud_ecs_key_pairs.default_key.pairs.0.id}"
}

# output "kms_id" {
#     value = "${data.alicloud_kms_keys.kms_key_disk.keys.0.id}"
# }

output "ecs_id" {
    value = "${alicloud_instance.instance.id}"
}