# Use the official Ubuntu base image
FROM ubuntu:focal AS base
# Set the working directory in the container
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install necessary packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install sudo && \
# Install Ansible
    apt-get install -y curl git ansible build-essential && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS sromero
ARG TAGS
RUN addgroup --gid 1000 sromero
RUN adduser --gecos sromero --uid 1000 --gid 1000 --disabled-password sromero
RUN usermod -aG sudo sromero
RUN echo 'sromero ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER sromero
WORKDIR /home/sromero

FROM sromero
# Copy ansible files to the container
COPY . .
# Expose any ports your application may use (replace 80 with the actual port)
EXPOSE 80
# Define the command to start your application
# CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
