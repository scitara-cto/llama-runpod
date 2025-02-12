
# Llama RunPod

This repository contains the setup for deploying a Llama model using `llama-cpp-python` on RunPod. Follow the instructions below to configure your environment, build the Docker image, and deploy it.

## Prerequisites

- Docker installed on your machine
- Access to a RunPod account
- An API key from RunPod

## Setup

### Step 1: Create the `.env` File

Create a `.env` file in the root of your project directory. This file will store the necessary environment variables for your deployment. Here’s an example of what your `.env` file should look like:

```
# Model URI for the Llama model
MODEL_URI=hf.co/Nekuromento/watt-tool-8B-Q5_K_M-GGUF

# API Key for RunPod
API_KEY=your_api_key_here

# Docker Registry URL
REGISTRY=393783582607.dkr.ecr.us-east-2.amazonaws.com
```

Make sure to replace `your_api_key_here` with your actual API key.

### Step 2: Build the Docker Image

Once you have your `.env` file set up, you can build the Docker image. Use the provided `build-and-push.sh` script to automate this process. Run the following command in your terminal:

```bash
./build-and-push.sh
```

This script will:

- Load the environment variables from the `.env` file.
- Extract the model name from the `MODEL_URI`.
- Build the Docker image and push it to the specified Docker registry.

### Step 3: Deploy the Image on RunPod

After successfully pushing the Docker image, you can deploy it on RunPod. Follow these steps:

1. Log in to your RunPod account.
2. Navigate to the "Deployments" section.
3. Click on "Create New Deployment."
4. Select the Docker image you just pushed (it should be in the format `your_registry/llama-server-model_name:latest`).
5. Configure any additional settings as needed (e.g., resource allocation, environment variables).
6. Click "Deploy" to start the deployment.

### Step 4: Access the API

Once the deployment is complete, you can access the API using the endpoint provided by RunPod. Make sure to include your API key in your requests for authentication.

## Conclusion

You have successfully set up your environment, built the Docker image, and deployed it on RunPod. If you have any questions or need further assistance, feel free to reach out.
