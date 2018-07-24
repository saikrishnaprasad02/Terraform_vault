resource "aws_instance" "terraform-vault" {
  # Amazon Linux AMI 2017.09.1 (HVM), SSD Volume Type
  ami                    = "ami-a9d09ed1"
  key_name               = "23"
  instance_type          = "t2.micro"
  subnet_id              = "${aws_subnet.public.id}"
  vpc_security_group_ids = ["${aws_security_group.sgroup.id}"]
  user_data              = "${var.user_data}"
 }
