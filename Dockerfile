# baseimage version.
ARG UBUNTU_BASEIMAGE_VERSION=latest
# ARG UBUNTU_BASEIMAGE_VERSION=v0.10.0

# FROM phusion/baseimage:${UBUNTU_BASEIMAGE_VERSION}
FROM tensorflow/tensorflow
FROM python:2.7-slim
MAINTAINER Sameer Mahabole <sameer.mahabole@gmail.com>

# RUN mkdir app && cd app
# RUN git clone https://github.com/samc0de/deep-summarization.git

# Set the working directory to /app.
WORKDIR /app

# Copy the current directory contents into the container at /app.
ADD . /app

# Needed only if the directory is not already created.
# RUN cd /app && mkdir extracted_data

# Fix old pip.
RUN pip install --upgrade pip

RUN apt-get update && yes | apt-get upgrade

# Fix deps for freetype and png while installing matplotlib.
# Latter is for ft2build.
# RUN set -e; apt-get install --yes libfreetype6-dev vflib3-dev pkg-config
RUN set -e; apt-get install --yes python-matplotlib


# RUN set -e; \
# #         apk add --no-cache --virtual .build-deps \
#         apt-get install \
#                 gcc \
#                 libc-dev \
#                 linux-headers \
# #                 mariadb-dev \
#                 python3-dev \
# #                 postgresql-dev \
#                 freetype-dev \
#                 libpng-dev \
# #                 libxml2-dev \
# #                 libxslt-dev \
# #                 zlib-dev \
#         ;



# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

RUN python extracter_script.py raw_data/food_raw.txt extracted_data/review_summary.csv
