#!/bin/bash

# Set the model path directly from the MODEL_URI
MODEL_PATH="${MODEL_URI##*/}"

# Download the model file if it doesn't exist
if [ ! -f "$MODEL_PATH" ]; then
    echo "Downloading model from ${MODEL_URI}..."
    wget -O "$MODEL_PATH" "$MODEL_URI"
fi

# Start the llama_cpp server
echo "Starting llama_cpp server using API Key: $API_KEY"
exec python3 -m llama_cpp.server --model "$MODEL_PATH"
