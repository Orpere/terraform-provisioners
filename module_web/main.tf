
resource "null_resource" "web" {
  count = "${var.instance_count}"
  connection {
    host = "${null_resource.web.public_ip}"


    tags = {
      Name = "web ${var.instance_count.index + 1}/${var.instance_count}"
    }
    provisioner "local-exec" {
      command = "echo ${null_resource.web.public_ip} >> ./my_infrastructure.txt" # this will add the ip to the terrafom local machine
    }
  }
}