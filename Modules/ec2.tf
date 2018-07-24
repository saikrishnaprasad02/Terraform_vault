# Script that launches Vault in ec2 instances

resource "aws_instance" "terraform-vault" {
  # Amazon Linux AMI 2017.09.1 (HVM), SSD Volume Type
  ami                    = "ami-a9d09ed1"
  key_name               = "23"
  instance_type          = "t2.micro"
  subnet_id              = "${aws_subnet.public.id}"
  vpc_security_group_ids = ["${aws_security_group.sgroup.id}"]
  user_data              = <<HEREDOC
  #!/usr/bin/env bash
  sudo yum update -y && sudo yum install git -y && sudo yum install python-pip -y
  git clone  https://github.com/hashicorp/terraform-aws-vault.git
  terraform-aws-vault/modules/install-vault/install-vault --version 0.10.0
  cd /home/ec2-user/terraform-aws-vault/modules/install-vault
  ./install-vault --version 0.7.0
 HEREDOC
}
