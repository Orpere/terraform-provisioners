# terraform-provisioners -> repo that I can use to see how provisioners work

This repo has as target to define and show what I have learned about terraform provisioners

how can I use this repository?
You can use this repo as reference or you can clone the repository to your computer using the follow commands

```git
git clone git@github.com:Orpere/terraform-provisioners.git
```

for more instructions to use git you can check the [link](https://rogerdudler.github.io/git-guide/) it will have a much better explanation about all git steps

After clone the repo you can install terraform downloading the adequate version to your OS on [Terraform](https://www.terraform.io/downloads.html) and on your shell:

```bash
cd terraform-provisioners
terraform init #retrieves your modules and dependencies
terraform plan #plans the AWS infrastructure
terraform apply #creates the AWS infrastructure
```

The terraform apply command should return a plan as the follow:

```terraform
An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.module_web.null_resource.web[0] will be created
  + resource "null_resource" "web" {
      + id = (known after apply)
    }

  # module.module_web.null_resource.web[1] will be created
  + resource "null_resource" "web" {
      + id = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value:
```
IF you add yes it should return something as:

```terraform 
module.module_web.null_resource.web[0]: Creating...
module.module_web.null_resource.web[1]: Creating...
module.module_web.null_resource.web[1]: Creation complete after 0s [id=621951717159216442]
module.module_web.null_resource.web[0]: Creation complete after 0s [id=1687665112458622642]
```
install terraform downloading the adequate version to your OS on [Terraform](https://www.terraform.io/downloads.html).

Terraform most used commands are:

- terraform fmt - cleans up your code formatting
- terraform init - retrieves your modules and dependencies
- terraform plan - plans the AWS infrastructure
- terraform apply - creates the AWS infrastructure

## Terraform provisioners

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
 provisioner "local-exec" {
      command = "echo ${null_resource.web.public_ip} >> my_infrastructure.txt" # this will add the ip to the terrafom local machine
    }
```
