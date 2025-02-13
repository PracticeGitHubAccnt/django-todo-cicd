FROM python:3

# Install distutils package
RUN apt-get update && apt-get install -y pip install setuptools
RUN sudo apt-get install python3-setuptools

WORKDIR /data

RUN pip install Django==5.1.6


COPY . .

RUN python manage.py migrate

EXPOSE 8000

CMD ["python","manage.py","runserver","0.0.0.0:8000"]


