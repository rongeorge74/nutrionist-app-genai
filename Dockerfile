FROM python:3.9-slim

# Install system dependencies for building packages
# RUN apt-get update && apt-get install -y \
#     python3-dev

# Set working directory
WORKDIR /app

# Copy requirements file first (to cache dependencies in Docker)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Set the command to run your application
CMD ["streamlit", "run", "main.py"]
