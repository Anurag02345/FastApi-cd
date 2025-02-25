# Use Ubuntu as the base image
FROM ubuntu:latest

# Set environment variables to prevent prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install Python, pip, and the venv module
RUN apt update && \
    apt install -y python3 python3-pip python3-venv && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy application files (excluding the local venv via .dockerignore)
COPY . /app

# Create a virtual environment and install dependencies using the venv's python
RUN python3 -m venv venv && \
    venv/bin/python -m pip install --upgrade pip && \
    venv/bin/python -m pip install -r requirements.txt

# Expose the port FastAPI runs on
EXPOSE 8000

# Run the application using the venv's python
CMD ["venv/bin/python", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
