provider "aws" {
  region     =  var.region
  access_key = var.access_key
  secret_key =  var.secret_key
  # Configuration options
} 

resource "aws_instance" "webserver" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = "Uma"
    vpc_security_group_ids = [data.aws_security_group.launch-wizard-1.id]

#root disk
root_block_device {
  volume_size = "10"
  volume_type = "gp3"
  delete_on_termination = true
}

#data_disk
ebs_block_device {
  device_name = "/dev/xvdb"
  volume_size = "5"
  volume_type = "gp3"
  delete_on_termination = true
}

tags = {
  "Name" = "Webserver1"
  environment = "dev"
 }

user_data = <<-EOF
      #!/bin/sh
      sudo apt-get update
      sudo apt install -y apache2
      sudo systemctl status apache2
      sudo systemctl start apache2
      sudo chown -R $USER:$USER /var/www/html
      sudo echo "<html><body><h1>Hello this is module-1 at instance id `curl http://169.254.169.254/latest/meta-data/instance-id` </h1></body></html>" > /var/www/html/index.html
      EOF
}