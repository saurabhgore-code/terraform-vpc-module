/*
resource "aws_vpc" "dnt-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "dnt-vpc"
  }
}

resource "aws_subnet" "public" {
vpc_id      = var.vpc_id
cidr_block  = var.public_subnet_cidr
tags = {
    Name = "dnt-public-subnet"
  }
}

resource "aws_subnet" "private" {
vpc_id      = var.vpc_id
cidr_block = var.private_subnet_cidr
tags = {
    Name = "dnt-private-subnet"
  }
}
*/

resource "aws_route_table" "public" {
vpc_id           = var.vpc_id
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-0396e5bda0651e991"
}
 
tags = {
    Name = "dnt-public-rt"
  }
}
/*
resource "aws_route_table" "private" {
vpc_id           = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "nat-0dbcd96126e259c53"
}
tags = {
    Name = "dnt-private-rt"
  }
 }
 */

resource "aws_internet_gateway" "dnt-igw" {
vpc_id                = var.vpc_id
tags = {
    Name = "dnt-igw"
  }
}

resource "aws_route_table_association" "public" {

 subnet_id      = var.public_subnet_id
 route_table_id = var.public_route_table_id
}
/*
resource "aws_route_table_association" "private" {

 subnet_id      = var.private_subnet_id
 route_table_id = var.private_route_table_id
}


// creates a vpc security group
resource "aws_security_group" "vpc_sec_grp" {
  name                   = var.sec_grp_name
  description            = var.description
  vpc_id                 = var.vpc_id
  
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
} 
}

//creates a ec2 instance in the vpc public subnet
resource "aws_instance" "sagore_server" {
  ami                    = var.ec2_image_id
  key_name               = var.ec2_key_pair
  instance_type          = var.ec2_instance_type
  subnet_id              = var.public_subnet_id
 vpc_security_group_ids =  ["${aws_security_group.vpc_sec_grp.id}"]
tags = {
    Name = "my-terraform-instance"
  }
}

// creates an ec2 instance in the private subnet
resource "aws_instance" "aws_server" {
  ami                    = var.ec2_image_id
  key_name               = var.ec2_key_pair
  instance_type          = var.ec2_instance_type
  subnet_id              = var.private_subnet_id
 vpc_security_group_ids =  ["${aws_security_group.vpc_sec_grp.id}"]
tags = {
    Name = "sagore-terraform-instance"
  }
}


resource "aws_nat_gateway" "example" {
  allocation_id = var.allocation_id
  subnet_id     = var.public_subnet_id
tags = {
    Name = "dnt-natgw"
  }
}
*/