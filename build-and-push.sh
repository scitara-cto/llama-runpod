#!/bin/bash

# Load environment variables from .env file
set -a
source .env
set +a

# Define a valid repository name
REPOSITORY_NAME="llama-server-$MODEL_NAME"  # Ensure it conforms to ECR naming rules
REPOSITORY_NAME=${REPOSITORY_NAME,,}  # Convert to lowercase

# Define the full image name
FULL_IMAGE_NAME="${REGISTRY}/${REPOSITORY_NAME}:latest"

# Log in to ECR
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 393783582607.dkr.ecr.us-east-2.amazonaws.com

# Check if the ECR repository exists
if ! aws ecr describe-repositories --repository-names "$REPOSITORY_NAME" --region us-east-2 > /dev/null 2>&1; then
    echo "Creating ECR repository: $REPOSITORY_NAME"
    aws ecr create-repository --repository-name "$REPOSITORY_NAME" --region us-east-2
else
    echo "ECR repository already exists: $REPOSITORY_NAME"
fi

# Build the Docker image
echo "Building Docker image: $FULL_IMAGE_NAME"
docker build --build-arg MODEL_URI="$MODEL_URI" -t "$FULL_IMAGE_NAME" .

# Push the Docker image to the registry
echo "Pushing Docker image: $FULL_IMAGE_NAME"
docker push "$FULL_IMAGE_NAME"

echo "Build and push completed successfully."
echo "Repository name: $REPOSITORY_NAME"
