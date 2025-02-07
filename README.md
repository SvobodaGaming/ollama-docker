
# Ollama-docker with NVIDIA CUDA Support 🤖🐳
[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-20)

This Docker container provides a GPU-accelerated environment for running Ollama, leveraging NVIDIA CUDA and cuDNN. Designed to resolve compatibility issue with [openweb-ui](#) ([#9012](https://github.com/open-webui/open-webui/issues/9012)), it enables seamless AI model execution on NVIDIA GPUs.

## Features ✨
- Full NVIDIA GPU acceleration via CUDA/cuDNN
- Pre-configured Ollama server environment
- Automatic container restarts and network isolation
- Compatibility with modern NVIDIA GPUs

## Prerequisites 🚀
- NVIDIA GPU with [CUDA Compute Capability 3.5+](https://developer.nvidia.com/cuda-gpus)
- [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html) installed
- [Docker Engine]((https://docs.docker.com/engine/install/)) 19.03+

## Installation 🛠️

### 1. Set Up NVIDIA Container Toolkit

- Follow official [installation guide](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html) for your distribution


### 2. Create Attachable Network
```sh
sudo docker network create --attachable ollama-net
```

## Usage 💻

### Run the Container
```sh
sudo docker run -d \
  --gpus all \
  --network ollama-net \
  --name ollama-docker \
  -e OLLAMA_HOST=0.0.0.0:11434 \
  --restart always \
  -p 11434:11434 \
  svobodayt/ollama-docker
```

### Verify GPU Access
```sh
sudo docker exec ollama-docker nvidia-smi
```

## Configuration ⚙️
| Environment Variable | Default          | Description                |
|-----------------------|------------------|----------------------------|
| `OLLAMA_HOST`         | 0.0.0.0:11434    | Ollama server binding      |

## Project Structure 📂
- **Base Image:** `nvidia/cuda:12.6.0-cudnn-runtime-ubuntu24.04`
- **Preinstalled:** CUDA 12.6, cuDNN 8.9, Ollama
- **Port:** `11434` (Exposed for Ollama API)

## License 📜
Licensed under Apache-2.0 [LICENSE](LICENSE)
