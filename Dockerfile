FROM python:3

# Update system packages and install necessary dependencies
RUN apt-get update && apt-get install -y \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages using pip
RUN pip install --upgrade pip setuptools

WORKDIR /data

RUN pip install Django==5.1.6


COPY . .

RUN python manage.py migrate

EXPOSE 8003

CMD ["python","manage.py","runserver","0.0.0.0:8003"]


