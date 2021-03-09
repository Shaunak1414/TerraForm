provider "vsphere" {
  user                 = "cloudadmin@vmc.local"
  password             = ""
  vsphere_server       = "vcenter.sddc-A-B-C-D.vmwarevmc.com"
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "SDDC-Datacenter"
}

# Creating Folder
resource "vsphere_folder" "folder" {
  path          = "your_user_name_terraform_folder"
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.dc.id
}

# For creating Tag Category
resource "vsphere_tag_category" "user" {
    name        = "your_user_name"
    cardinality = "SINGLE"

    associable_types = [
        "VirtualMachine"
    ]
}

# Creating tag which is in above category.
resource "vsphere_tag" "last_name" {
    name         = "your_last_name"
    category_id = vsphere_tag_category.user.id
}
