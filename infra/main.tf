terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "~> 3.6.2"
        }
    }
}

resource "docker_image" "nginx_image" {
    name = "nginx:latest"
}

resource "docker_container" "nginx_container" {
    image = docker_image.nginx_image.image_id
    name = "web-server-nginx"

    ports {
        internal = 80
        external = 8080
    }
}