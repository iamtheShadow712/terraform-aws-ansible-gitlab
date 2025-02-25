resource "aws_instance" "webserver" {
  count         = var.instance_count
  ami           = var.instance_ami
  instance_type = var.instance_type
  tags = {
    Name        = "webserver-${count.index}"
    Environment = "dev"
  }
  security_groups = [aws_security_group.allow-http-ssh-https.id]
  subnet_id       = aws_subnet.my-public-subnet.id
  key_name        = aws_key_pair.ec2-key.key_name
}


resource "null_resource" "hosts" {
  depends_on = [aws_instance.webserver]
  triggers = {
    time = "${timestamp()}"
  }
  count = length(aws_instance.webserver)
  provisioner "local-exec" {
    command = "echo ${element(aws_instance.webserver[*].public_ip, count.index)} >> ./hosts"
    when    = create
  }

  provisioner "local-exec" {
    command = "rm -f ./hosts"
    when    = destroy
  }
}
