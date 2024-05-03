###############################################
## EC2 Input Variable
###############################################
variable "ami_id" {
  description = "rhel 8.8 ami id"
}


variable "EC2-Parameter" {
  description = "Linux ec2 arguments"
  type = map(object({
    name          = string
    instance_type = string
    /* interface_id  = string */
  }))
}
