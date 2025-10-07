# **DevOps Assessment - Next.js Application**
This repository contains a Next.js application containerized with Docker, automated with GitHub Actions, pushed to GitHub Container Registry (GHCR), and deployed on Kubernetes (Minikube).

## **Table of Contents**
- Project Overview
- Prerequisites
- Setup & Running Locally
- Docker
- GitHub Actions & GHCR
- Kubernetes Deployment (Minikube)
- Accessing the Application

## **Project Overview**
This project is part of the DevOps Internship Assessment. The objectives were:
- Containerize a Next.js application using Docker.
- Automate build and push to GitHub Container Registry (GHCR) using GitHub Actions.
- Deploy the containerized app on Kubernetes using Minikube.

## **Prerequisites**
Before running this project, ensure the following are installed:
- Node.js (v18+)
- npm
- Docker
- kubectl
- Minikube
- Git

## **Setup & Running Locally**
1. Clone the repository:
git clone https://github.com/Ameenuddin612/devops-assessment-wexa.git
cd devops-assessment-wexa

2. Install dependencies:
npm install

3. Start the development server:
npm run dev

4. Open your browser at:
http://localhost:3000

**Docker**
1. Build Docker image locally:
docker build -t devops-assessment:local .

2. Run the container:
docker run -p 3000:3000 devops-assessment:local

3. Verify running container:
docker ps

## **GitHub Actions & GHCR**
1. The workflow .github/workflows/docker-publish.yml automates:
- Docker image build on push to main branch.
- Push to GitHub Container Registry (GHCR).

2. Example GHCR image URL:
ghcr.io/ameenuddin612/devops-assessment-wexa:latest

## **Kubernetes Deployment (Minikube)**
1. Start Minikube:
minikube start --driver=docker

2. Create a secret to pull GHCR image:
kubectl create secret docker-registry ghcr-secret \
  --docker-server=ghcr.io \
  --docker-username=your-github-username \
  --docker-password=<GHCR_TOKEN> \
  --docker-email=<example@email.com>

Replace <GHCR_TOKEN> with your GitHub Personal Access Token and <example@gmail.com> with your Email ID.

3. Apply Kubernetes manifests:
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

4. Verify pods and services:
kubectl get all

## **Accessing the Application**
1. Open the service via Minikube tunnel:
minikube service devops-assessment-service

2. The output will give a URL similar to:
http://127.0.0.1:<PORT>

3. Open the URL in a browser to see the running application.
