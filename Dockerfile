# Use an official Python runtime as the base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY pyvi templates/ .

# Change directory to the correct path
WORKDIR /usr/src/app/code

# Copy the HTML file from the code directory
COPY code/ .

# Move back to the app directory
WORKDIR /usr/src/app

# Install any needed dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 8000 to the outside world
EXPOSE 8000

# Define environment variable
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Command to run the Python application
CMD ["python", "app.py"]

# Run app.py when the container launches
CMD ["flask", "run"]

