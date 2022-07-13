FROM python:3.9.12

# CMD ["/bin/bash"]

# # remember to expose the port your app'll be exposed on.
EXPOSE 8080

RUN pip install -U pip

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# copy into a directory of its own (so it isn't in the toplevel dir)
RUN mkdir -p /app
COPY app.py app/app.py
WORKDIR /app

# ENTRYPOINT [ "streamlit", "--version" ]

# run it!
ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8080", "--server.address=0.0.0.0"]


# # Expose port you want your app on
# EXPOSE 8080

# # Upgrade pip and install requirements
# COPY requirements.txt requirements.txt
# RUN pip install -U pip
# RUN pip install -r requirements.txt

# # Copy app code and set working directory
# COPY app.py app.py
# WORKDIR .

# # Run
# ENTRYPOINT [“streamlit”, “run”, “app.py”, “–server.port=8080”, “–server.address=0.0.0.0”]