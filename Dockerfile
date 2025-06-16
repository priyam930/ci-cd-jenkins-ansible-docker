# Dockerfile
FROM ubuntu:20.04

# Install Python manually
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get install -y curl && \
    apt-get clean

WORKDIR /app

COPY ./app /app

RUN pip3 install -r requirements.txt

CMD ["python3", "app.py"]
