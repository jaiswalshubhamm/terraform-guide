provider "aws" {
  #   region     = "ap-south-1"
  region     = var.location
  access_key = var.access_key
  secret_key = var.secret_key
  #   access_key = "XXXXXXXXXXXXXXXXXXXX"
  #   secret_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
}

# # 1. Ami should be of region specific
# resource "aws_instance" "ec2_example" {
#   ami           = "ami-07d5e5458cf1e320e"
#   instance_type = "t2.micro"
#   tags = {
#     Name = "Terraform EC2"
#   }
# }




# # 2. Using terraform variables
# resource "aws_instance" "ec2_example" {
#   ami                         = "ami-07d5e5458cf1e320e"
#   instance_type               = var.instance_type
#   count                       = var.instance_count
#   associate_public_ip_address = var.enable_public_ip
#   tags                        = var.project_environment
# }

# resource "aws_iam_user" "example" {
#   count = length(var.user_names)
#   name  = var.user_names[count.index]
# }

# # String
# variable "instance_type" {
#   description = "Instance type t2.micro"
#   type        = string
#   default     = "t2.micro"
# }
# # Numbers
# variable "instance_count" {
#   description = "EC2 instance count"
#   type        = number
#   default     = 1
# }
# # Booleans
# variable "enable_public_ip" {
#   description = "Enable public IP address"
#   type        = bool
#   default     = true
# }
# # List
# variable "user_names" {
#   description = "IAM usernames"
#   type        = list(string)
#   default     = ["user1", "user2", "user3s"]
# }
# # Map
# variable "project_environment" {
#   description = "project name and environment"
#   type        = map(string)
#   default = {
#     project     = "project-alpha",
#     environment = "dev"
#     Name        = "Terraform EC2"
#   }
# }




# # 3. Using variable.tf file
# resource "aws_instance" "ec2_example" {
#   ami           = "ami-07d5e5458cf1e320e"
#   instance_type = var.instance_type
#   tags          = var.project_environment
# }




# # 4. Using tfvars file
# resource "aws_instance" "ec2_example" {
#   ami           = "ami-07d5e5458cf1e320e"
#   instance_type = var.instance_type
#   tags          = var.project_environment
# }




# # 5. Using Locals
# locals {
#   staging_env = "staging"
# }
# resource "aws_vpc" "staging-vpc" {
#   cidr_block = "10.5.0.0/16"
#   tags = {
#     Name = "${local.staging_env}-vpc-tag"
#   }
# }
# resource "aws_subnet" "staging-subnet" {
#   vpc_id     = aws_vpc.staging-vpc.id
#   cidr_block = "10.5.0.0/16"
#   tags = {
#     Name = "${local.staging_env}-subnet-tag"
#   }
# }
# resource "aws_instance" "ec2_example" {
#   ami           = var.aws_ami
#   instance_type = var.instance_type
#   subnet_id     = aws_subnet.staging-subnet.id
#   tags = {
#     Name = "${local.staging_env} - Terraform EC2"
#   }
# }




# # 6. Output values
# output "my_console_output" {
#   value = aws_instance.ec2_example.public_ip
# }




# # 7. For loop
# resource "aws_instance" "ec2_example" {
#   ami           = var.aws_ami
#   instance_type = var.instance_type
#   count         = var.instance_count
#   tags = {
#     Name = "Terraform EC2"
#   }
# }
# resource "aws_iam_user" "example" {
#   count = length(var.user_names)
#   name  = var.user_names[count.index]
# }
# variable "user_names" {
#   description = "IAM usernames"
#   type        = list(string)
#   default     = ["user1", "user2", "user3"]
# }
# # For each loop
# resource "aws_iam_user" "example" {
#   for_each = var.user_names
#   name     = each.value
# }
# # For loop
# output "print_the_names" {
#   value = [for name in var.user_names : name]
# }
# variable "user_names" {
#   description = "IAM usernames"
#   type        = set(string)
#   default     = ["user1", "user2", "user3"]
# }




# # 8. Terraform remote state
# terraform {
#   backend "s3" {
#     bucket = "my-tf-buckets"
#     key    = "key/terraform.tfstate"
#     region = "eu-central-1"
#   }
# }
# resource "aws_instance" "ec2_example" {
#   ami           = var.aws_ami
#   instance_type = var.instance_type
#   count         = var.instance_count
#   tags = {
#     Name = "Terraform EC2"
#   }
# }




# # 9. Terraform provisioner
# resource "aws_instance" "ec2_example" {
#   ami                    = var.aws_ami
#   instance_type          = var.instance_typei
#   key_name               = var.aws_key
#   vpc_security_group_ids = [aws_security_group.main.id]
#   # file provisioner upload file from source to destination
#   provisioner "file" {
#     source      = "test-file.txt"
#     destination = "/home/ubuntu/test-file.txt"
#   }
#   # run command in local machine
#   provisioner "local-exec" {
#     command = "touch hello-jhooq.txt"
#   }
#   # run command in remote machine 
#   provisioner "remote-exec" {
#     inline = [
#       "touch hello.txt",
#       "echo helloworld remote provisioner >> hello.txt",
#     ]
#   }
#   connection {
#     type        = "ssh"
#     host        = self.public_ip
#     user        = "ubuntu"
#     private_key = file("/Users/shubhamjaiswal/Workspace/cloud/terraform/aws/ec2-variables-and-tfvars/aws_key")
#     timeout     = "4m"
#   }
# }
# # Security Group for EC2
# resource "aws_security_group" "main" {
#   egress = [
#     {
#       cidr_blocks      = ["0.0.0.0/0", ]
#       description      = ""
#       from_port        = 0
#       ipv6_cidr_blocks = []
#       prefix_list_ids  = []
#       protocol         = "-1"
#       security_groups  = []
#       self             = false
#       to_port          = 0
#     }
#   ]
#   # Port 22 for SSH
#   ingress = [
#     {
#       cidr_blocks      = ["0.0.0.0/0", ]
#       description      = ""
#       from_port        = 22
#       ipv6_cidr_blocks = []
#       prefix_list_ids  = []
#       protocol         = "tcp"
#       security_groups  = []
#       self             = false
#       to_port          = 22
#     }
#   ]
# }
# resource "aws_key_pair" "deployer" {
#   key_name   = "aws_key"
#   public_key = var.public_ssh_key
# }




# # 10. Terraform module
# module "jhooq-webserver-1" {
#   source = ".//module-1"
# }
# module "jhooq-webserver-2" {
#   source = ".//module-2"
# }




# # 11. Dynamic Blocks
# locals {
#   ingress_rules = [{
#     port        = 443
#     description = "Ingress rules for port 443"
#     },
#     {
#       port        = 80
#       description = "Ingree rules for port 80"
#   }]
# }
# resource "aws_instance" "ec2_example" {
#   ami                    = var.aws_ami
#   instance_type          = var.instance_type
#   key_name               = var.aws_key
#   vpc_security_group_ids = [aws_security_group.main.id]
# }
# resource "aws_security_group" "main" {
#   name = "resource_with_dynamic_block"
#   egress = [
#     {
#       cidr_blocks      = ["0.0.0.0/0", ]
#       description      = ""
#       from_port        = 0
#       ipv6_cidr_blocks = []
#       prefix_list_ids  = []
#       protocol         = "-1"
#       security_groups  = []
#       self             = false
#       to_port          = 0
#     }
#   ]
#   dynamic "ingress" {
#     for_each = local.ingress_rules
#     content {
#       description = ingress.value.description
#       from_port   = ingress.value.port
#       to_port     = ingress.value.port
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   }
#   tags = {
#     Name = "AWS security group dynamic block"
#   }
# }
# resource "aws_key_pair" "deployer" {
#   key_name   = "aws_key"
#   public_key = var.public_ssh_key
# }




# # 12. Null Resources
# resource "aws_instance" "ec2_example" {
#   ami           = var.aws_ami
#   instance_type = var.instance_type
#   tags = {
#     Name = "Terraform EC2 "
#   }
# }
# # The following null resource has the trigger
# resource "null_resource" "null_resource_simple" {
#   # This trigger will only execute once when it detects the instance id of EC2 instance 
#   triggers = {
#     id = aws_instance.ec2_example.id # to execute it every time replace - id = time()
#   }
#   provisioner "local-exec" {
#     command = "echo Hello World"
#   }
# }




# # 13. Data source
# resource "aws_instance" "ec2_example" {
#   ami           = var.aws_ami
#   instance_type = var.instance_type
#   tags = {
#     Name = "Terraform EC2"
#   }
# }
# data "aws_instance" "myawsinstance" {
#   filter {
#     name   = "tag:Name"
#     values = ["Terraform EC2"]
#   }
#   depends_on = [
#     aws_instance.ec2_example
#   ]
# }




# # 14. Workspace
# locals {
#   instance_name = "${terraform.workspace}-instance"
# }
# resource "aws_instance" "ec2_example" {
#   ami           = var.aws_ami
#   instance_type = var.instance_type
#   tags = {
#     Name = local.instance_name
#   }
# }




# # 15. User-data
# resource "aws_instance" "example" {
#   ami                    = var.aws_ami
#   instance_type          = var.instance_type
#   vpc_security_group_ids = [aws_security_group.main.id]
#   key_name               = var.aws_key
#   user_data              = file("install_apache.sh")
#   # user_data = <<-EOF
#   #                   #!/bin/bash
#   #                   echo "Hello, World!" > hello.txt
#   #                 EOF
# }
# resource "aws_security_group" "main" {
#   egress = [
#     {
#       cidr_blocks      = ["0.0.0.0/0", ]
#       description      = ""
#       from_port        = 0
#       ipv6_cidr_blocks = []
#       prefix_list_ids  = []
#       protocol         = "-1"
#       security_groups  = []
#       self             = false
#       to_port          = 0
#     }
#   ]
#   ingress = [
#     {
#       cidr_blocks      = ["0.0.0.0/0", ]
#       description      = ""
#       from_port        = 22
#       ipv6_cidr_blocks = []
#       prefix_list_ids  = []
#       protocol         = "tcp"
#       security_groups  = []
#       self             = false
#       to_port          = 22
#     },
#     {
#       cidr_blocks      = ["0.0.0.0/0", ]
#       description      = ""
#       from_port        = 443
#       ipv6_cidr_blocks = []
#       prefix_list_ids  = []
#       protocol         = "tcp"
#       security_groups  = []
#       self             = false
#       to_port          = 443
#     }
#   ]
# }
# resource "aws_key_pair" "deployer" {
#   key_name   = "aws_key"
#   public_key = var.public_ssh_key
# }
# output "fetched_info_from_aws" {
#   value = format("%s%s", "ssh -i aws_key ubuntu@", aws_instance.example.public_dns)
# }




# # 16. Depennd-on meta tag
# #Step 1 - Create S3 Bucket first
# resource "aws_s3_bucket" "example_buckettt1" {
#   bucket = "example-buckettt1"
# }

# #Step 2 - Create EC2 instance after S3 Bucket
# resource "aws_instance" "example_instance" {
#   ami           = var.aws_ami
#   instance_type = var.instance_type
#   # Define the dependency on S3 Bucket before creating EC2
#   depends_on = [aws_s3_bucket.example_buckettt1]
# }




# Import
resource "aws_instance" "ec2_example" {
  ami           = "ami-04e601abe3e1a910f"
  instance_type = var.instance_type
  tags = {
    Name = "ec2_example"
  }
}
# terraform import aws_instance.ec2_example	i-05a197740158f809c
