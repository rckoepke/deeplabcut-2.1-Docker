FROM tensorflow/tensorflow:1.13.2-gpu
MAINTAINER Ross Koepke <koepke@gmail.com>

RUN apt-get update && apt install -y git --fix-missing
RUN git clone https://github.com/AlexEMG/DeepLabCut.git
RUN apt install -y wget
RUN mkdir ~/tmp
RUN cd ~/tmp
RUN wget https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
RUN bash Anaconda3-2019.10-Linux-x86_64.sh
RUN source ../.bashrc
RUN cd ../DeepLabCut/conda-environments/
RUN conda env create -f dlc-ubuntu-GPU.yaml # sometimes long pause after `execute environement : done`
RUN source activate dlc-ubuntu-GPU
RUN cd ~

CMD ["/bin/bash"]
