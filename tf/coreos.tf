# Create a new droplet of CoreOS
# This droplet is used for gate for dnsimple
resource "digitalocean_droplet" "lb" {
  name = "lb"
  image = "coreos-stable"
  private_networking = true
  region = "sgp1"
  size = "512mb"
  ssh_keys = ["${var.ssh_key_id}"]
  user_data = "${file("cloud-config-lb.yml")}"
}

resource "digitalocean_droplet" "web1" {
  name = "web1"
  image = "coreos-stable"
  private_networking = true
  region = "sgp1"
  size = "512mb"
  ssh_keys = ["${var.ssh_key_id}"]
  user_data = "${file("cloud-config-web.yml")}"
}

resource "digitalocean_droplet" "web2" {
  name = "web2"
  image = "coreos-stable"
  private_networking = true
  region = "sgp1"
  size = "512mb"
  ssh_keys = ["${var.ssh_key_id}"]
  user_data = "${file("cloud-config-web.yml")}"
}




