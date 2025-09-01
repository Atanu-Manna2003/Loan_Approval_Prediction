FROM python:3.8-slim-buster

# Install required system packages (only if needed)
RUN apt update -y && apt install -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy project files
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port for Render
EXPOSE 8080

# Start the app
CMD ["python", "app.py"]
