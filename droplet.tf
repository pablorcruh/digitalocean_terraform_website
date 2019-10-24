resource "digitalocean_droplet" "home" {
	image = "ubuntu-18-04-x64"
	name = "HomeWebsite"
	region = "nyc1"
	size = "1gb"
	private_networking = true
	user_data = "${file("userdata.yaml")}"
	ssh_keys = ["${digitalocean_ssh_key.pablo.fingerprint}"]

    connection {
        type = "ssh"
        host = "${digitalocean_droplet.home.ipv4_address}"
        private_key = "${file("mykey")}"
        port = 22
        timeout = "3m"
        user = "root"
    }

    provisioner "remote-exec" {
      inline = [
        "cd /home",
        "mkdir blog"
      ]
    }

	provisioner "file" {
        source = "${var.file_path}/docker-compose.yml"
        destination = "/home/blog/docker-compose.yml"
    }

    provisioner "file" {
        source = "${var.file_path}/www"
        destination = "/home/blog/www"
  }

}

output "ip" {
    value = "${digitalocean_droplet.home.ipv4_address}"
}
