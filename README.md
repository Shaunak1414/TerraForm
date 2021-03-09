# TerraForm Installation on Ubuntu and Simple codes.

## Repository Configuration
The Terraform packages are signed using a private key controlled by HashiCorp, 
so in most situations the first step would be to configure your system to trust that HashiCorp key for package authentication. 
For example:

`curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -`

After registering the key, you can add the official HashiCorp repository to your system:

`sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"`

The above command line uses the following sub-shell commands:

* `dpkg --print-architecture` to determine your system's primary APT architecture/ABI, such as `amd64`.
* `lsb_release -cs` to find the distribution release codename for your current system, such as buster, groovy, or sid.

`apt-add-repository` usually automatically runs `apt update` as part of its work in order to fetch the new package indices, but if it does not then you will need to so manually before the packages will be available.

To install Terraform from the new repository:

`sudo apt install terraform`

## Starting with Terraform on Visual Studio Code

clone this repository in your VSC terminal:

`git clone https://github.com/Shaunak1414/TerraForm.git`

Switch to the directory:

`cd .\TerraForm`

Run the following command:

`code .`

This will open a new VSCode window. You will see a file called main.tf . This is the main Terraform configuration.

Update the file with:

* The vCenter password
* The vCenter IP address
* Your user_name

The configuration above will create a folder.

Run the following commands:

* `terraform init` to initialize the provider. Did you see "provider vsphere" in the configuration earlier? This tells Terraform to download a Terraform 'plugin' to let    interact with vSphere. There are also providers for NSX-T, VMC, vRA, vCD, etc... 
* `terraform validate` to validate the syntax of your Terraform config file
* `terraform plan` to work out which resources Terraform will create, modify or delete on your behalf
* `terraform apply` to execute the plan.

This is a very simple example. But imagine you add not just folders, but resources pools, clusters, tags, networks and security rules (using Terraform for NSX-T); you could define your entire VMware infrastructure as code.

If you're enjoying Terraform and want to do something a bit more sophisticated, you could try to create vSphere tags and categories also in the `main.tf` file.

As you expand your code and your configuration, you can see how you could describe your entire infrastructure as code - not just compute but also security, networking, automation, cloud, migration, SD-WAN when you include providers for AWS, NSX, SD-WAN, HCX, vRA, etc.... You could then version it, repeat it, patch it, etc...

If you want to see a very advanced example, go through : https://github.com/gchek/VMworld2020





