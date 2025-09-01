FROM python:3.8-slim-buster

WORKDIR /app

# Install dependencies to allow apt to work properly
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        unzip \
        less \
        groff \
        python3-pip \
        gcc \
        libffi-dev \
        libssl-dev \
        && rm -rf /var/lib/apt/lists/*

# Install AWS CLI via pip (safer than apt)
RUN pip install awscli --upgrade

COPY . /app
RUN pip install -r requirements.txt

CMD ["python3", "app.py"]
