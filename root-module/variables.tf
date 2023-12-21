variable region {
type = string
}

variable ec2_image_id {
    type =string
}
variable  ec2_instance_type {
    type =string
}
variable ec2_key_pair {
    type =string
}

variable vpc_id {
type = string
}

variable vpc_cidr {
type = string
}

variable public_subnet_cidr {
type = string
}

variable private_subnet_cidr {
type = string
}


variable public_subnet_id {
type = string
}

variable public_route_table_id {
type = string
}

variable private_subnet_id {
type = string
}

variable private_route_table_id {
type = string
}

variable sec_grp_name {
    type = string
}

variable description {
    type = string
}

variable allocation_id {
    type = string
    
}



/*
variable vpc_security_group_id {
  type        = list(string)
  default     = null

}

variable cidr_block {
    type = string
    default = "0.0.0.0/0"
}
*/
