FROM python:3.11.9-slim-bookworm

LABEL maintainer="Klemens Schueppert <klemens.schueppert@infineon.com>"

# Fix: https://github.com/hadolint/hadolint/wiki/DL4006
# Fix: https://github.com/koalaman/shellcheck/wiki/SC3014
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

# Install all OS dependencies for fully functional notebook server
RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    python3-tk \
    # Common useful utilities
    git \
    nano-tiny \
    tzdata \
    unzip \
    vim-tiny \
    # git-over-ssh
    openssh-client \
    # less is needed to run help in R
    less \
    # Enable clipboard on Linux host systems
    xclip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir \
    paho-mqtt \
    numpy \
    matplotlib \
    scipy \
    numdifftools \
    cvxopt \
    traits \
    shapely \
    h5py \
    influxdb_client

RUN pip install \
        --break-system-packages \
        --no-cache-dir \
        --extra-index-url https://artifactory.intra.infineon.com/artifactory/api/pypi/pypi-pmm-center-virtual/simple \
        sipyco



RUN mkdir /packages
WORKDIR /packages

RUN git clone https://gitlab.intra.infineon.com/tiqc/simulations/ion-traps/electrode-package/electrode.git &&\
    ln -s "/packages/electrode/electrode" "/usr/local/lib/python3.11/site-packages/electrode" &&\
    git clone https://gitlab.intra.infineon.com/tiqc/simulations/ion-traps/electrode-package/simulations-helpers.git &&\
    ln -s "/packages/simulations-helpers" "/usr/local/lib/python3.11/site-packages/simhelp" &&\
    git clone https://gitlab.intra.infineon.com/pss/its/software/artiq/analysis.git &&\
    ln -s "/packages/analysis" "/usr/local/lib/python3.11/site-packages/analysis"

# Create alternative for nano -> nano-tiny
RUN update-alternatives --install /usr/bin/nano nano /bin/nano-tiny 10

WORKDIR /work
