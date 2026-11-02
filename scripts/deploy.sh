#!/usr/bin/env bash
set -euo pipefail

IMAGE_TAG="$1"
REGION="eu-central-1"
REGISTRY="890828112175.dkr.ecr.eu-central-1.amazonaws.com"

export PATH="$PATH:/snap/bin"
export HOME="/root"

cd /opt/devops-practice

echo "IMAGE_TAG=${IMAGE_TAG}" > .env

aws ecr get-login-password --region "$REGION" \
  | docker login --username AWS --password-stdin "$REGISTRY"

docker compose pull
docker compose up -d --remove-orphans
docker image prune -f

docker compose ps