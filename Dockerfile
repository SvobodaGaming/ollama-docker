FROM nvidia/cuda:12.6.0-cudnn-runtime-ubuntu24.04
RUN apt-get update && apt-get install -y curl
ENV NVIDIA_VISIBLE_DEVICES=all

RUN curl -fsSL https://ollama.com/install.sh | sh
CMD ollama serve