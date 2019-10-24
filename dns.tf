resource "digitalocean_domain" "blog" {
  name = "${var.domain}"
}

resource "digitalocean_record" "www" {
  domain = "${digitalocean_domain.blog.name}"
  name = "blog"
  type = "A"
  value = "${digitalocean_droplet.home.ipv4_address}"
}