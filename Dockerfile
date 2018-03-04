FROM python:3.6


COPY wolsemap/requirements.txt wolsemap/requirements.txt

WORKDIR /wolsemap
RUN pip install -r requirements.txt

COPY wolsemap /wolsemap

RUN adduser --disabled-password --gecos '' myuser
CMD uwsgi --http :8000 --module wolsemap.wsgi