# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    POCKETFLOW_DIR=/app

# Set work directory
WORKDIR $POCKETFLOW_DIR

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy project files into the container
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Default command
#CMD ["bash"]
# Replace CMD with this:
ENTRYPOINT ["python", "main.py"]


