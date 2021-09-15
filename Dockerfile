FROM ubuntu:20.04

RUN apt-get update -qq -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    	build-essential \
        wget \
        python3-dev \
        python3-pip \
        git && \
    rm -rf /var/lib/apt/lists/*


ENV LANG='C.UTF-8' LC_ALL='C.UTF-8' DS_BUILD_CPU_ADAM=1 DS_BUILD_FUSED_ADAM=1 DS_BUILD_FUSED_LAMB=1 \
  DS_BUILD_SPARSE_ATTN=1 DS_BUILD_TRANSFORMER=1 DS_BUILD_TRANSFORMER_INFERENCE=0 \
  DS_BUILD_STOCHASTIC_TRANSFORMER=1 DS_BUILD_UTILS=1 DS_BUILD_AIO=0 
  
  
  
  
 
RUN pip3 install --upgrade && \ 
    pip3 install --upgrade setuptools && \
    pip3 install --upgrade  wheel && \
    pip3 install torch==1.9.0+cu111 torchvision==0.10.0+cu111 torchaudio==0.9.0 -f https://download.pytorch.org/whl/torch_stable.html && \
    pip3 install tensorboard scikit-learn matplotlib && \
    pip3 install  git+https://github.com/huggingface/transformers && \
    pip3 install  datasets ninja triton && \
    pip3 install deepspeed --global-option="build_ext"
    rm -rf /root/.cache
    
RUN ln -sf /usr/bin/python3 /usr/bin/python

