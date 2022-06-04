FROM ubuntu:latest

# working directory // essential
RUN mkdir /ThinkStats2 && \
    apt -y update && \
    apt install -y python3 python3-dev python3-venv && \
    apt-get -y install wget && \
    wget https://bootstrap.pypa.io/get-pip.py  && \
    python3 get-pip.py && \
    rm -f get-pip.py

# install dependencies
COPY requirements.txt /usr/share/dependencies/requirements.txt
RUN pip install -r /usr/share/dependencies/requirements.txt

WORKDIR /ThinkStats2
EXPOSE 8888
CMD jupyter lab --ip=0.0.0.0 --allow-root --LabApp.token=''