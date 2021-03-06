FROM stlouisn/ubuntu:rolling

RUN \

    export DEBIAN_FRONTEND=noninteractive && \

    # Update apt-cache
    apt-get update && \

    # Install Python
    apt-get install -y --no-install-recommends \
        python3 \
        python3-distutils && \
        
    # Install PIP
    curl -ksSL https://bootstrap.pypa.io/get-pip.py | python3 - --no-cache-dir && \

    # Clean apt-cache
    apt-get autoremove -y --purge && \
    apt-get autoclean -y && \

    # Cleanup temporary folders
    rm -rf \
        /root/.cache \
        /root/.wget-hsts \
        /tmp/* \
        /var/lib/apt/lists/*
