###############################################
## EC2 TF Variables
###############################################

ami_id = "ami-013e83f579886baeb"

EC2-Parameter = {
  "jenkin-ec2" = {
    name          = "jenkins-lab"
    instance_type = "t2.micro"

    /* interface_id  = "" */

  }
}