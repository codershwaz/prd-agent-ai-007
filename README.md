# Comprehensive Docker & Docker Compose Commands Reference Guide

A complete cheatsheet and practical reference guide for essential **Docker CLI** and **Docker Compose** commands.

---
## *Prepare for Production*

## 📋 Table of Contents
1. [Image Management & Building](#1-image-management--building)
2. [Container Lifecycle & Management](#2-container-lifecycle--management)
3. [Container Monitoring & Debugging](#3-container-monitoring--debugging)
4. [Registry & Image Publishing](#4-registry--image-publishing)
5. [Volumes & Storage Management](#5-volumes--storage-management)
6. [Network Management](#6-network-management)
7. [System Cleanup & Maintenance](#7-system-cleanup--maintenance)
8. [Docker Compose Quick Reference](#8-docker-compose-quick-reference)
9. [Project Quickstart Example (`deploy-ai-agent`)](#9-project-quickstart-example-deploy-ai-agent)

---

## 1. Image Management & Building

| Command | Description |
| :--- | :--- |
| `docker build -t <image_name>:<tag> .` | Build an image from a `Dockerfile` in the current directory. |
| `docker build -f <file_path> -t <name>:<tag> .` | Build an image using a specific Dockerfile path. |
| `docker build --no-cache -t <name>:<tag> .` | Build an image from scratch without using cached layers. |
| `docker build --build-arg KEY=VALUE -t <name> .` | Pass build-time arguments to the Dockerfile. |
| `docker images` *(or `docker image ls`)* | List all locally available Docker images. |
| `docker image history <image_name>` | Display history and layers of an image. |
| `docker tag <source_image> <target_image>:<tag>` | Tag an existing local image with a new target repository/tag. |
| `docker rmi <image_id_or_name>` | Remove one or more local images. |
| `docker rmi -f <image_id_or_name>` | Force remove an image (even if referenced by stopped containers). |
| `docker image prune` | Remove unused/dangling images. |
| `docker image prune -a` | Remove all unused images (not just dangling ones). |

---

## 2. Container Lifecycle & Management

| Command | Description |
| :--- | :--- |
| `docker run -d -p <host_port>:<container_port> --name <name> <image>` | Run container in background (detached mode) with port forwarding. |
| `docker run -it --name <name> <image> sh` | Run container interactively with a terminal shell (`sh` or `bash`). |
| `docker run --rm -p <host_port>:<container_port> <image>` | Run container and automatically remove it when it stops. |
| `docker run -v <host_path>:<container_path> <image>` | Mount a host directory/file into the container. |
| `docker run -e KEY=VALUE <image>` | Run container with environment variables set. |
| `docker run --env-file .env <image>` | Run container using environment variables from a file. |
| `docker ps` | List currently running containers. |
| `docker ps -a` | List all containers (running, stopped, and exited). |
| `docker start <container_id_or_name>` | Start one or more stopped containers. |
| `docker stop <container_id_or_name>` | Stop a running container gracefully (`SIGTERM`). |
| `docker stop -t <seconds> <container>` | Stop container waiting given seconds before killing. |
| `docker restart <container_id_or_name>` | Restart a running or stopped container. |
| `docker kill <container_id_or_name>` | Forcefully terminate a running container immediately (`SIGKILL`). |
| `docker rm <container_id_or_name>` | Remove a stopped container. |
| `docker rm -f <container_id_or_name>` | Force remove a running container. |
| `docker container prune` | Remove all stopped containers. |

---

## 3. Container Monitoring & Debugging

| Command | Description |
| :--- | :--- |
| `docker logs <container_name>` | Fetch and display logs of a container. |
| `docker logs -f <container_name>` | Follow live log output in real time. |
| `docker logs --tail=100 -f <container_name>` | View the last 100 log lines and stream new ones. |
| `docker logs -t <container_name>` | Display logs with timestamps. |
| `docker exec -it <container_name> sh` | Open an interactive terminal inside a running container. |
| `docker exec -it <container_name> bash` | Open interactive Bash shell inside a running container. |
| `docker exec <container_name> <command>` | Run a single command inside a running container. |
| `docker inspect <container_or_image>` | Display detailed JSON configuration and status of container/image. |
| `docker stats` | Stream live resource usage statistics (CPU, Memory, Network I/O). |
| `docker top <container_name>` | Display running processes inside a container. |
| `docker port <container_name>` | Print port mappings for a container. |
| `docker cp <host_path> <container>:<dest_path>` | Copy files/folders from host machine to container. |
| `docker cp <container>:<src_path> <host_path>` | Copy files/folders from container to host machine. |
| `docker diff <container_name>` | Inspect changes to files or directories on a container's filesystem. |

---

## 4. Registry & Image Publishing

| Command | Description |
| :--- | :--- |
| `docker login` | Authenticate with Docker Hub or a private registry. |
| `docker login <registry_url>` | Log in to a custom private container registry (e.g., `ghcr.io`). |
| `docker logout` | Log out from a Docker registry. |
| `docker pull <image_name>:<tag>` | Pull an image from Docker Hub or registry. |
| `docker push <username>/<repo>:<tag>` | Push a tagged image to Docker Hub or registry. |
| `docker search <term>` | Search Docker Hub for public images. |

---

## 5. Volumes & Storage Management

| Command | Description |
| :--- | :--- |
| `docker volume ls` | List all local persistent volumes. |
| `docker volume create <vol_name>` | Create a named storage volume. |
| `docker volume inspect <vol_name>` | View volume details (mount path, driver, options). |
| `docker volume rm <vol_name>` | Remove a specific unused volume. |
| `docker volume prune` | Delete all unused local persistent volumes. |

---

## 6. Network Management

| Command | Description |
| :--- | :--- |
| `docker network ls` | List all Docker networks on the host. |
| `docker network create <net_name>` | Create a user-defined bridge network. |
| `docker network inspect <net_name>` | View detailed info about a network and connected containers. |
| `docker network connect <net_name> <container>` | Connect a running container to a network. |
| `docker network disconnect <net_name> <container>` | Disconnect a container from a network. |
| `docker network rm <net_name>` | Remove an unused network. |
| `docker network prune` | Delete all unused networks. |

---

## 7. System Cleanup & Maintenance

| Command | Description |
| :--- | :--- |
| `docker system df` | Display disk usage breakdown by images, containers, and volumes. |
| `docker system prune` | Remove all unused containers, networks, images (dangling). |
| `docker system prune -a --volumes` | Deep purge: remove all stopped containers, unused networks, images, and volumes. |
| `docker info` | Display system-wide Docker configuration and engine information. |
| `docker version` | Show Docker client and server engine versions. |

---

## 8. Docker Compose Quick Reference

> 💡 *For a dedicated Compose guide, see [`README_docker-compose.md`](file:///d:/DockerImages/README_docker-compose.md).*

| Command | Description |
| :--- | :--- |
| `docker compose up -d` | Build, create, and start service containers in background. |
| `docker compose up -d --build` | Rebuild images and restart containers in background. |
| `docker compose down` | Stop and remove containers and networks created by Compose. |
| `docker compose down -v` | Stop containers and remove named/anonymous volumes. |
| `docker compose ps` | List running containers in the current Compose project. |
| `docker compose logs -f [service]` | Follow live streaming logs for all or specified services. |
| `docker compose exec <service> sh` | Execute an interactive shell inside a running service container. |

---

## 9. Project Quickstart Example (`deploy-ai-agent`)

Commands specifically configured for the [`deploy-ai-agent`](file:///d:/DockerImages/deploy-ai-agent) project:

### Using Docker CLI

```bash
# Navigate to project directory
cd deploy-ai-agent

# 1. Build the Docker image
docker build -f Dockerfile -t shubhamketu/ai-agent-prod:latest .

# 2. Run the container locally (mapped port 8080 host -> 8000 container)
docker run -d -p 8080:8000 --name ai-agent-app shubhamketu/ai-agent-prod:latest

# 3. Check running status
docker ps

# 4. View container logs
docker logs -f ai-agent-app

# 5. Push image to registry
docker push shubhamketu/ai-agent-prod:latest

# 6. Stop and remove container
docker stop ai-agent-app
docker rm ai-agent-app
```

### Using Docker Compose

```bash
# Navigate to project directory
cd deploy-ai-agent

# 1. Build and run stack in background (services defined in compose.yaml)
docker compose up -d --build

# 2. Inspect running stack
docker compose ps

# 3. Stream logs
docker compose logs -f app

# 4. Stop stack and cleanup volumes
docker compose down -v
```
