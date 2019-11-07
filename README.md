# terraform-provisioners -> repo that I can use to see how provisioners work

This repo has as target to define and show what I have learned about terraform provisioners

how can I use this repository?
You can use this repo as reference or you can clone the repository to your computer using the follow commands 

```git
git clone git@github.com:Orpere/terraform-provisioners.git
```

you can also fork this repo using the fork button on top right on github and use it as yours as the follow example:

![fork](fork.png)

like this you can clone and edit the repository and commit your own changes.

you can clone your own repo as:

```git
git clone git@github.com:<YourGitUser>/terraform-provisioners.git
```

and use the commands add, commit and push to your own changes

for more instructions to use git you can check the [link](https://rogerdudler.github.io/git-guide/) it will have a much better explanation about all git steps

# Terraform provisioners

The inspiration for this repository come from the Hashicorp [documentation](https://www.terraform.io/docs/provisioners/index.html)

![terraform](terraform.png)

[Provisioners can be used to model specific actions on the local machine or on a remote machine in order to prepare servers or other infrastructure objects for service.](https://www.terraform.io/docs/provisioners/index.html)

Terraform is a tool to deploy, manage and update infrastructure but there are some software specific to some tasks or some workflows already have some dependencies for that terraform can make use of provisioners which are already built in as you can see below.

As example Terraform has Built-in Provisioners:

  1) [chef Provisioner](https://www.terraform.io/docs/provisioners/chef.html)
  2) [file Provisioner](https://www.terraform.io/docs/provisioners/file.html)
  3) [habitat Provisioner](https://www.terraform.io/docs/provisioners/habitat.html)
  4) [local-exec Provisioner](https://www.terraform.io/docs/provisioners/local-exec.html)
  5) [puppet Provisioner](https://www.terraform.io/docs/provisioners/puppet.html)
  6) [remote-exec Provisioner](https://www.terraform.io/docs/provisioners/remote-exec.html)
  7) [salt-masterless Provisioner](https://www.terraform.io/docs/provisioners/salt-masterless.html)


example: module_web

```terraform
resource "aws_instance" "web" {
  count = "${var.instance_count}"
  # count initiate the default variable count as value 2
}

resource "null_resource" "web" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  connection {
    host = "${aws_instance.web.public_ip}"
  }

  tags = {
    Name = "web ${var.instance_count.index+1}/${var.instance_count}"
  }
   provisioner "local-exec" {
    command = "echo ${aws_instance.web.public_ip} >> my_infrastructure.txt" # this will add the ip to the Terraform local machine
  }
}
```
