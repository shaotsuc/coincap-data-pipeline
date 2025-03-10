# Base image
FROM apache/airflow:2.7.1

ENV AIRFLOW_HOME=/opt/airflow

# Switch to the airflow user
USER airflow

WORKDIR $AIRFLOW_HOME

USER $AIRFLOW_UID

# Copy the files into the container and package dependencies
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
RUN chmod +x ./entrypoint.sh
