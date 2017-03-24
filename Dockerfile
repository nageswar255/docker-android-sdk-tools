# From latest bitrise docker

FROM bitriseio/docker-android-alpha:latest

# Install python 2.7 for systrace

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    build-essential \
    ca-certificates \
    gcc \
    git \
    libpq-dev \
    make \
    python-pip \
    python2.7 \
    python2.7-dev \
    ssh \
    && apt-get autoremove \
    && apt-get clean

RUN pip install -U "setuptools==3.4.1"
RUN pip install -U "pip==1.5.4"
RUN pip install -U "Mercurial==2.9.1"
RUN pip install -U "virtualenv==1.11.4"
RUN pip install -U pyserial

# Install system images & create avd device

RUN echo "y" | android update sdk -a --no-ui --filter sys-img-armeabi-v7a-android-22,sys-img-x86_64-android-22
RUN echo "no" | android create avd -n testdevice -t "android-24" --abi "default/armeabi-v7a" -f -s "HVGA"

# Create dir for android project

RUN mkdir /var/android

