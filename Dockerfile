FROM nvidia/cuda:11.6.2-cudnn8-devel-ubuntu20.04

# prevent interactive dialogue during docker build
ENV LC_ALL=en_US.UTF-8
ARG DEBIAN_FRONTEND=noninteractive

# disable forward compatibility of cuda
RUN echo "ln -sf libcuda.so.470.182.03 /usr/lib/x86_64-linux-gnu/libcuda.so.1" >> ~/.bashrc

RUN apt update && \
apt install -y \
locales \
python3.9 \
python3-pip \
ipython3 \
git \
vim 

RUN locale-gen en_US.UTF-8 && \
update-locale

# specify default python version to be 3.9 and upgrade pip to support python 3.9
RUN update-alternatives --install /usr/local/bin/python3 python3 /usr/bin/python3.9 10 && \
python3 -m pip install --upgrade pip

# install torch v13.1
# ref: https://pytorch.org/get-started/previous-versions/
RUN pip --no-cache-dir install torch==1.13.1+cu116 --extra-index-url https://download.pytorch.org/whl/cu116

# install deepchem and its dependencies (tensorflow, dgl)
RUN pip --no-cache-dir install deepchem==2.7.1
RUN pip --no-cache-dir install  dgl -f https://data.dgl.ai/wheels/cu116/repo.html
RUN pip --no-cache-dir install  dglgo -f https://data.dgl.ai/wheels-test/repo.html
# RUN pip --no-cache-dir install tensorflow==2.11


CMD ["/bin/bash"]