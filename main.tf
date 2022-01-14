provider "alicloud" {
    access_key = "${var.ACCESS_KEY}"
    secret_key = "${var.SECRET_KEY}"
    region = "${var.region}"
}

resource "alicloud_instance" "instance" {
    availability_zone = "${var.region}${var.zone}"
    security_groups = data.alicloud_security_groups.primary_security_groups.ids
    instance_type = data.alicloud_instance_types.type.instance_types.0.id
    system_disk_category = "${var.system_disk_type}"
    system_disk_name = "system-${var.ecs_name}-disk"
    instance_name = "${var.ecs_name}"
    image_id = data.alicloud_images.default_images.images.0.id
    vswitch_id = data.alicloud_vswitches.default_vsw.vswitches.0.id
    system_disk_size = "${var.system_size}"
    key_name = "${var.key_pair}"
    data_disks {
        name = "data-${var.ecs_name}-disk"
        size = "${var.data_size}"
        category = "cloud_efficiency"
        encrypted = false
        # kms_key_id = "${var.kms_regex}" == "None" ? false : data.alicloud_kms_keys.kms_key_disk.keys.0.id
    }
    tags = merge(
        var.ecs_tags,
        {
            Additional = "Value",
            VM_Name = "${var.ecs_name}"
        }
    )
    user_data = <<-EOF
    #!/bin/bash
    sfdisk -d /dev/vda > vda.sfdisk
    sfdisk /dev/vdb < vda.sfdisk
    mkfs.ext4 /dev/vdb1
    sleep3
    vdbblk=`blkid -s UUID -o value /dev/vdb1`
    mkdir /data
    mount /dev/disk/by-uuid/$vdbblk /data
    echo "$vdbblk /data auto defaults,nofail 0 1" >> /etc/fstab
    EOF
}
