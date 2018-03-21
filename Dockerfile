# baseimage version.
ARG UBUNTU_BASEIMAGE_VERSION=latest
# ARG UBUNTU_BASEIMAGE_VERSION=v0.10.0

FROM phusion/baseimage:${UBUNTU_BASEIMAGE_VERSION}
FROM python:2.7-slim
MAINTAINER Sameer Mahabole <sameer.mahabole@gmail.com>

# RUN mkdir app && cd app
# RUN git clone https://github.com/samc0de/deep-summarization.git

# Set the working directory to /app.
WORKDIR /app

# Copy the current directory contents into the container at /app.
ADD . /app
RUN cd /app && mkdir extracted_data

# Fix old pip.
RUN pip install --upgrade pip

# Fix deps for freetype and png while installing matplotlib.
# RUN apt-get install libfreetype6-dev

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

RUN python extracter_script.py raw_data/food_raw.txt extracted_data/review_summary.csv
