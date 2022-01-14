data "alicloud_images" "default_images" {
    name_regex = "${var.image_regex}"
    most_recent = true
    owners = "system"
}

data "alicloud_security_groups" "primary_security_groups" {
    name_regex = "${var.sg_name}"
    vpc_id = "${var.vpc_id}"
}

data "alicloud_vswitches" "default_vsw" {
    name_regex = "${var.vsw_name}"
    vpc_id = "${var.vpc_id}"
}

data "alicloud_instance_types" "type" {
    instance_type_family = "ecs.t5"
    cpu_core_count = 1
    memory_size = 2
}

data "alicloud_ecs_key_pairs" "default_key" {
    name_regex = "${var.key_pair}"
}

# data "alicloud_kms_keys" "kms_key_disk" {
#     description_regex = "${var.kms_regex}"
# }