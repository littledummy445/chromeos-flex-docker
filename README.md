# ChromeOS Flex Docker Emulator

Run a full ChromeOS Flex environment inside a Docker container with QEMU and KVM acceleration, accessible right through your browser.

## Features
* **Web-Based Interface**: Access the virtual machine directly via port `8006`.
* **Persistent Storage**: Mounts a local directory (`/storage`) to keep your virtual disk intact.
* **Hardware Acceleration**: Utilizes `/dev/kvm` and `/dev/dri` for smoother performance.

---

## Quick Start Guide

### 1. Prerequisites
Ensure your host environment or Codespace supports hardware acceleration (`/dev/kvm` must be available).

### 2. Run the Container
Execute the following Docker command in your terminal:

```bash
docker run -it --rm --name chromeos -e "VERSION=stable" -p 8006:8006 --device=/dev/kvm --device=/dev/net/tun --device-cgroup-rule="c 226:* rwm" --cap-add NET_ADMIN -v "${PWD:-.}/chromeos:/storage" -v /dev/dri:/dev/dri --stop-timeout 120 docker.io/forkymcforkface/chromeos
```

### 3. Access the Desktop
1. Open your browser and go to port `8006` (or check your Codespaces forwarded ports tab).
2. Follow the setup wizard to complete initialization.

3. [![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=littledummy445/chromeos-flex-docker)

---

## Resource Note
Running an entire operating system emulator requires significant disk space (roughly 15 GB for the virtual disk image). Ensure your host environment has adequate storage capacity before starting the container.
