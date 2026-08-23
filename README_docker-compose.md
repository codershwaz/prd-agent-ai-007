# Docker Compose Commands Reference Guide

A comprehensive cheat sheet and reference guide for **Docker Compose** (`docker compose` V2 syntax).

---

## 📋 Table of Contents
1. [Lifecycle & Container Management](#1-lifecycle--container-management)
2. [Building & Image Management](#2-building--image-management)
3. [Monitoring & Logs](#3-monitoring--logs)
4. [Execution & Interactive Commands](#4-execution--interactive-commands)
5. [Configuration & Verification](#5-configuration--verification)
6. [Cleanup & Maintenance](#6-cleanup--maintenance)
7. [Global Options & Custom Configurations](#7-global-options--custom-configurations)
8. [Project Quickstart Example (`deploy-ai-agent`)](#8-project-quickstart-example-deploy-ai-agent)

---

## 1. Lifecycle & Container Management

| Command | Description |
| :--- | :--- |
| `docker compose up` | Build, create, start, and attach to containers for all services in `compose.yaml`. |
| `docker compose up -d` | Start containers in detached mode (runs in background). |
| `docker compose up --build` | Build/rebuild images before starting containers. |
| `docker compose up -d --build` | Rebuild images and run containers in the background. |
| `docker compose up --force-recreate` | Recreate containers even if configuration and images haven't changed. |
| `docker compose up --no-deps <service>` | Start a service without starting its dependent services. |
| `docker compose up --remove-orphans` | Start services and remove containers for services not defined in current Compose file. |
| `docker compose up -d --scale <service>=<count>` | Scale a service to multiple container instances (e.g., `docker compose up -d --scale app=3`). |
| `docker compose down` | Stop and remove containers and networks created by `up`. |
| `docker compose down -v` | Stop containers and remove named/anonymous volumes. |
| `docker compose down --rmi all` | Stop containers, remove volumes, and delete all images used by services. |
| `docker compose down --rmi local` | Stop containers and delete only locally built images. |
| `docker compose down --remove-orphans` | Stop stack and remove containers for services no longer in `compose.yaml`. |
| `docker compose start [service]` | Start existing stopped containers for all or specified services. |
| `docker compose stop [service]` | Stop running containers without removing them. |
| `docker compose restart [service]` | Restart running or stopped service containers. |
| `docker compose pause [service]` | Pause execution of processes within containers. |
| `docker compose unpause [service]` | Unpause processes within paused containers. |
| `docker compose create` | Create containers for services without starting them. |
| `docker compose kill [service]` | Forcefully stop service containers using `SIGKILL` (or custom signal `-s`). |
| `docker compose rm [service]` | Remove stopped service containers. |

---

## 2. Building & Image Management

| Command | Description |
| :--- | :--- |
| `docker compose build [service]` | Build or rebuild service images defined with a `build` section. |
| `docker compose build --no-cache` | Build images from scratch without using layer cache. |
| `docker compose build --pull` | Pull latest base images before building. |
| `docker compose build --build-arg KEY=VAL` | Pass build-time arguments to Dockerfile. |
| `docker compose pull [service]` | Pull service images from container registries. |
| `docker compose push [service]` | Push service images to container registries. |
| `docker compose images` | List images used by the current Compose project. |

---

## 3. Monitoring & Logs

| Command | Description |
| :--- | :--- |
| `docker compose ps` | List running containers in the current Compose project. |
| `docker compose ps -a` | List all containers (running and stopped). |
| `docker compose ps --services` | Print service names defined in the Compose configuration. |
| `docker compose logs` | View logs from all running service containers. |
| `docker compose logs -f` | Follow live log output from all services in real time. |
| `docker compose logs -f <service>` | Follow live log output for a specific service (e.g., `docker compose logs -f app`). |
| `docker compose logs --tail=100 <service>` | Display only the last 100 lines of logs for a service. |
| `docker compose logs -t` | Show timestamps in log outputs. |
| `docker compose top [service]` | Display active processes running inside containers. |
| `docker compose events` | Stream real-time container events from the stack. |

---

## 4. Execution & Interactive Commands

| Command | Description |
| :--- | :--- |
| `docker compose exec <service> <command>` | Execute a command inside a running container (e.g., `docker compose exec app sh`). |
| `docker compose exec -it <service> bash` | Open an interactive terminal shell inside a running container. |
| `docker compose exec -e KEY=VAL <service> <cmd>` | Execute a command with environment variable overrides. |
| `docker compose run --rm <service> <command>` | Run a one-off command in a new container and auto-delete container on exit. |
| `docker compose port <service> <private-port>` | Print public port mapped to container port (e.g., `docker compose port app 8000`). |
| `docker compose cp <service>:<src_path> <dest_path>` | Copy files/folders between service container and local host filesystem. |

---

## 5. Configuration & Verification

| Command | Description |
| :--- | :--- |
| `docker compose config` | Validate and render the resolved Compose configuration (merged YAML). |
| `docker compose config --services` | Output list of service names in the Compose file. |
| `docker compose config --volumes` | Output list of volume names in the Compose file. |
| `docker compose config --profiles` | Output list of active profiles. |
| `docker compose config --quiet` | Silently validate Compose file syntax (exit code 0 if valid). |
| `docker compose ls` | List running Compose projects across the system. |
| `docker compose version` | Show Docker Compose version information. |

---

## 6. Cleanup & Maintenance

| Command | Description |
| :--- | :--- |
| `docker compose down -v --rmi all --remove-orphans` | Complete cleanup: stops containers, deletes volumes, removes images, and purges orphaned containers. |
| `docker compose rm -f -s -v` | Stop, force remove containers, and purge associated volumes for stopped services. |

---

## 7. Global Options & Custom Configurations

| Command / Option | Description |
| :--- | :--- |
| `docker compose -f custom.yaml up -d` | Use a custom Compose file instead of default `compose.yaml`. |
| `docker compose -f compose.yaml -f compose.override.yaml up -d` | Combine multiple Compose files (base + overrides). |
| `docker compose -p my_project up -d` | Specify custom project name (prefixes container names & network names). |
| `docker compose --env-file .env.prod up -d` | Specify custom environment file for variable substitution. |
| `docker compose --project-directory ./deploy-ai-agent up -d` | Run Compose command targeting a specific project directory. |

---

## 8. Project Quickstart Example (`deploy-ai-agent`)

Commands tailored for working with the local [deploy-ai-agent](file:///d:/DockerImages/deploy-ai-agent) service:

```bash
# Navigate to project folder
cd deploy-ai-agent

# 1. Build & start container stack in detached mode
docker compose up -d --build

# 2. Verify status of running services
docker compose ps

# 3. View live streaming logs for the 'app' service
docker compose logs -f app

# 4. Execute an interactive shell session inside container
docker compose exec app sh

# 5. Stop and clean up containers and volumes
docker compose down -v
```
