resource "aws_instance" "ubuntu" {
  ami                         = "ami-0ba4fb1abfec5c5ce"
  instance_type               = "t3.micro"
  user_data                   = <<-EOF
    #!/bin/bash
    echo "Hello, World!" > index.html
    nohup busybox httpd -f -p 8080 &
  EOF
  user_data_replace_on_change = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
}

resource "aws_security_group" "sg" {
  name        = "ubuntu_sg"
  description = "Security group for the Ubuntu EC2 instance"
}

resource "aws_vpc_security_group_ingress_rule" "sg_ingress_rule" {
  security_group_id = aws_security_group.sg.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port   = 8080
  to_port     = 8080
}

