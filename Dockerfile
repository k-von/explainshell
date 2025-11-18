FROM openshift/python:2.7

USER root
RUN yum update \
&& yum install man-db -y \
&& yum clean

# USER 1001
ADD ./requirements.txt /tmp/requirements.txt

RUN pip install --upgrade pip \
  && python --version \
  && pip install -r /tmp/requirements.txt \
  && rm -rf ~/.cache/pip/*

ADD ./ /opt/webapp/
WORKDIR /opt/webapp
EXPOSE 5000

CMD ["make", "serve"]
