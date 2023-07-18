FROM debian:stable-slim

ADD conf.ini /root/cloudreve/conf.ini
# 付费版需要下载许可证，删除下方的#
ADD key.bin /root/cloudreve/key.bin
ADD run.sh /root/cloudreve/run.sh
ADD cloudreve.db /root/cloudreve/cloudreve.db

RUN apt-get update \
    && apt-get install wget curl  -y

# 使用付费版,删除#号，普通版要加#
RUN wget -qO cloudreve.tar.gz https://family--cloudrevetest.repl.co/f/w0ty/ccloudreve_3.8.0_linux_amd64.tar.gz
# 使用普通版，要使用付费版，普通版前要加#
#RUN wget -qO cloudreve.tar.gz https://github.com/aaro-n/file/raw/master/cloudreve/cloudreve.tar.gz
    
RUN tar -zxvf cloudreve.tar.gz -C /root/cloudreve
RUN chmod +x /root/cloudreve/cloudreve \
    && chmod +x /root/cloudreve/run.sh

CMD /root/cloudreve/run.sh
