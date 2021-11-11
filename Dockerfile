FROM python:3.7
# Best practice to send output to the terminal window without buffering
ENV PYTHONUNBUFFERED 1

# Relatively boilerplate Python Dockerfile, includes downloading the spacy small English library
WORKDIR /app 
COPY requirements.txt ./requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt
RUN python -m spacy download en_core_web_sm
COPY . /app

# Create non-root user for Docker
RUN groupadd -g 9901 docker-usr
# This user has no shell and no home directory
RUN useradd docker-usr -s /bin/false -u 9901 -g docker-usr
# Change user to non-root and give permissions to where .streamlit will be created
RUN mkdir /home/docker-usr/
RUN chmod 755 /home/docker-usr/
RUN chown -R docker-usr:docker-usr /home/docker-usr/
USER docker-usr

# Expose appropriate port for Streamlit and run 
EXPOSE 8501 
ENTRYPOINT [ "streamlit", "run" ]
CMD ["app.py"]