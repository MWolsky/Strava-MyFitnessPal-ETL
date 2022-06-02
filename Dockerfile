# Use python 3.10.2 slim buster image from Docker Hub as base
# https://hub.docker.com/_/python
FROM python:3.10.2-slim-buster as base

# Swtich off questions/dialog during installs
ENV DEBIAN_FRONTEND noninteractive

# Install Git
RUN apt-get update && apt-get install -y git

# Install virtualenv, poetry
RUN pip install virtualenv poetry

COPY . /

ENV PYTHONPATH "${PYTHONPATH}:/"

WORKDIR /

FROM base as development

ENV ENV_FOR_DYNACONF=development

FROM base as testing

ENV ENV_FOR_DYNACONF=testing
