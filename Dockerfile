FROM ubuntu:16.04
MAINTAINER Sameer Mahabole <sameer.mahabole@gmail.com>

# Set the working directory to /app.
WORKDIR /app

# Copy the current directory contents into the container at /app.
ADD . /app

# Needed only if the directory is not already created.
# RUN cd /app && mkdir extracted_data

RUN apt-get update && yes | apt-get upgrade

# Better to install matplotlib and pandas with system package manager for their complex dependencies.
RUN set -e; apt-get install --yes libfreetype6-dev vflib3-dev pkg-config
RUN set -e; apt-get install --yes python-matplotlib python-pandas python-pip

# Fix old pip.
RUN pip install --upgrade pip

# Not sure if this is needed.
RUN set -e; python -m pip install pandas==0.21.0 --force-reinstall --upgrade \
--no-deps --no-cache --find-links \
https://3f23b170c54c2533c070-1c8a9b3114517dc5fe17b7c3f8c63a43.ssl.cf2.rackcdn.com/ \
--no-index

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

RUN python extracter_script.py raw_data/foods.txt extracted_data/review_summary.csv
