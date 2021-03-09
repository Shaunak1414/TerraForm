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

clone this repository:

`git clone https://github.com/nvibert/terraform-hacknite-lab1.git`



