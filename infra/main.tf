terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "~> 3.6.2"
        }
    }
}

provider "docker" {
    host = "unix:///run/docker.sock"
}

resource "docker_image" "nginx_image" {
    name = "nginx:latest"
}

resource "docker_container" "web-server-nginx" {
    image = docker_image.nginx_image.image_id
    name = "web-server-nginx"

    ports {
        internal = 80
        external = 8080
    }
}