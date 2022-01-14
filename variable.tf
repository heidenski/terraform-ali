variable "vpc_id" {
    type = string
    default = ""
}

variable "image_regex" {
    type = string
    default = ""
}

# variable "kms_regex" {
#     type = string
#     default = "None"
# }

variable "sg_name" {
    type = string
    default = ""
}

variable "ecs_name" {
    type = string
    default = ""
}

variable "system_disk_type" {
    type = string
    default = ""
}

variable "vsw_name" {
    type = string
    default = ""
}

variable "region" {
    type = string
    default = ""
}

variable "zone" {
    type = string
    default = ""
}

variable "key_pair" {
    type = string
    default = ""
}

variable "ACCESS_KEY" {
    type = string
    default = ""
}

variable "SECRET_KEY" {
    type = string
    default = ""
}

variable "ecs_tags" {
    type = map(string)
    default = {
        "Env" : "Test"
    }
}

variable "system_size" {
    type = number
    default = 40
}

variable "data_size" {
    type = number
    default = 40
}