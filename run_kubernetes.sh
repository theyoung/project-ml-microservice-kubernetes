#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath="stevenna/mlmicro"

# Step 2
# Run the Docker Hub container with kubernetes
docker login
kubectl create deployment mlmicro --image=stevenna/mlmicro:latest

# Step 3:
# List kubernetes pods
kubectl get deployments

# Step 4:
# Forward the container port to a host
kubectl port-forward deployment/mlmicro 8000:80
