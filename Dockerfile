# Use an official Python image
FROM python:3.11-slim

# Maintainer and metadata
LABEL maintainer="alinepangoup@gmail.com"
LABEL description="Flask app running inside Docker"
LABEL version="1.0"

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app/s3aline

# Copy project files into the container
COPY . /app/s3aline

# Install dependencies
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# Add a non-root user and switch to it
RUN adduser --disabled-password --gecos '' s3aline
USER s3aline

# Expose port 5000 for Flask
EXPOSE 5000

# Default command to run the Flask app
CMD ["python", "app.py"]
