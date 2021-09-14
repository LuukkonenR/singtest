FROM nvcr.io/nvidia/pytorch:21.08-py3

ENV LANG='C.UTF-8' LC_ALL='C.UTF-8'DS_BUILD_CPU_ADAM=1 DS_BUILD_FUSED_ADAM=1 DS_BUILD_FUSED_LAMB=1 \
DS_BUILD_SPARSE_ATTN=1 DS_BUILD_TRANSFORMER=1 \
DS_BUILD_TRANSFORMER_INFERENCE=0 DS_BUILD_STOCHASTIC_TRANSFORMER=1 DS_BUILD_UTILS=1 DS_BUILD_AIO=0 # no libaio

RUN echo $(which python)

RUN python3 -m pip install --upgrade pip \ 

   pip3 install transformers datasets \
   pip3 install deepspeed --global-option="build_ext"

  rm -rf /root/.cache


RUN ds_report
