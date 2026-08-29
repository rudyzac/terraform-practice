resource "aws_instance" "ubuntu" {
  ami           = "ami-0ba4fb1abfec5c5ce"
  instance_type = "t3.micro"
  user_data     = <<-EOF
    #!/bin/bash
    echo "Hello, World!" > index.html
    nohup busybox httpd -f -p 8080 &
  EOF
}
