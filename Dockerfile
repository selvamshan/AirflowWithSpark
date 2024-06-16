FROM apache/airflow:2.9.2-python3.11
USER root
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  gcc python3-dev openjdk-17-jre-headless \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
USER airflow
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
RUN pip install -U pip --upgrade pip 
# COPY requirements.txt /requirements.txt
# RUN pip install --no-cache-dir --user -r /requirements.txt
RUN pip install --no-cache-dir "apache-airflow==${AIRFLOW_VERSION}" apache-airflow-providers-apache-spark