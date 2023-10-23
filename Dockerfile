# Use the official Ubuntu base image
FROM ubuntu:20.04

# Update package lists and install necessary packages
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get install -y \
    python3.9 \
    python3-pip \
    git \
    && apt-get clean

# Install Ansible
RUN apt-get install -y ansible

# Set the working directory in the container
# WORKDIR /app

# Copy your application files to the container
# COPY . /app

# You can run any commands you need here to set up your application

# Expose any ports your application may use (replace 80 with the actual port)
EXPOSE 80

# Define the command to start your application
# CMD ["/bin/bash"]
