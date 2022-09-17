resource "aws_instance" "group9" {
    ami = var.ami_id
    instance_type = var.aws_instance
    tags = {
      "Name" = var.ec2_name_tag
    }
  
}

resource "aws_ebs_volume" "test" {
  availability_zone = "us-east-1b"
  size              = 20
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.test.id
  instance_id = aws_instance.group9.id
}
