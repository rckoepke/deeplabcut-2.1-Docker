FROM tensorflow/tensorflow:1.13.2-gpu
MAINTAINER Ross Koepke <koepke@gmail.com>

RUN apt-get update && apt install --fix-missing -y git wget
RUN git clone https://github.com/AlexEMG/DeepLabCut.git
RUN mkdir ~/tmp
RUN wget https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh -P /root/tmp/
RUN bash /root/tmp/Anaconda3-2019.10-Linux-x86_64.sh -b -p /root/anaconda3
RUN eval "$(/root/anaconda3/bin/conda shell.bash hook)"
RUN conda init
RUN source /root/.bashrc
RUN conda env create -f /root/DeepLabCut/conda-environments/dlc-ubuntu-GPU.yaml # sometimes long pause after `execute environement : done`
RUN source activate /root/DeepLabCut/conda-environments/dlc-ubuntu-GPU

CMD ["/bin/bash"]
