output "lb" {
  value = "${digitalocean_droplet.lb.ipv4_address}"
}

output "web1" {
  value = "${digitalocean_droplet.web1.ipv4_address}"
}

output "web2" {
  value = "${digitalocean_droplet.web2.ipv4_address}"
}

