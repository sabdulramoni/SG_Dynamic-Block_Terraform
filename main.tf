provider "aws" {
    region = "us-east-2"
  
}

resource "aws_security_group" "web" {
    name = "webserver"
    description = "security group for web"
  
}

dynamic "ingress" {
    for_each = ["80", "8080", "8443"]
    content {
        description = "Allow port HTTP"
        from_port = ingress.value
        to_port = ingress.value
        protocol = "tcp"
        cidr_block = ["0.0.0.0/0"]
    }

    }
ingress {
    description = "Allow port SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_block = ["0.0.0.0/0"]
}
ingress {
    description = "Allow port SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_block = ["0.0.0.0/0"]

}

egress {
    description = "Allow all ports"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_block = ["0.0.0.0/0"]

}