resource "aws_instance" "ubuntu" {
  ami           = "ami-0ba4fb1abfec5c5ce"
  instance_type = "t3.micro"
}

