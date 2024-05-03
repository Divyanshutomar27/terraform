locals {

  tags = {
    Project   = "Project-Jenkins"
  }

}

data "aws_vpc" "jenkins_vpc" {
  id = "vpc-0aaa17710b8b41240"
}

## gift private subnet in az1 and az2 ##

data "aws_subnet" "private_subnet1" {
  id = "subnet-027d10f254c98a079"
}

data "aws_subnet" "private_subnet2" {
  id = "subnet-0b7d67538b5932cf0"
}

##################################
## EC2 Resources
##################################


resource "aws_instance" "linux-ec2" {
  for_each = var.EC2-Parameter
  ami                  = var.ami_id
  /* user_data = file("vm1.sh") */
  subnet_id = data.aws_subnet.private_subnet1.id
  instance_type        = each.value.instance_type
  iam_instance_profile = "ssm-ec2-role"

  tags = merge({
    Name = each.value.name
  }, local.tags)

  ebs_block_device {
    device_name           = "/dev/sdh"
    volume_size           = 10
    volume_type           = "gp3"
    delete_on_termination = true
    /* encrypted             = true
    kms_key_id            = data.aws_kms_alias.kms_ebs_key.name */
  }

}