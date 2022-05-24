terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {
  type = string
  description = "api token for digital ocean"
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

# Create the vpn server
resource "digitalocean_droplet" "passbolt" {
    image  = "ubuntu-20-04-x64"
    name   = "passbolt01"
    region = "nyc3"
    size   = "s-1vcpu-1gb"
    ssh_keys = [32690924, 32843241]
}

# output ipv4 address
output "dev_instance_ip_addr" {
  value = digitalocean_droplet.passbolt.ipv4_address
}
