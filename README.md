# 🌟 MySQL-Python Docker Integration

## 📖 Overview
This project demonstrates how to integrate **MySQL** with **Python** using **Docker**. The project includes:

1. 🛠️ Running a MySQL database inside a Docker container.
2. 🔗 Connecting to this MySQL container from a Python application.
3. 📦 Using Docker to build and run a Python container that interacts with MySQL.

Follow this guide to set up and execute the project successfully.

---

## ✅ Prerequisites
Before starting, ensure you have the following installed:

- **🐳 Docker**: Required to create containers for both MySQL and Python.
- **Git** (optional): Needed if you wish to clone the repository.
- **🐍 Python 3.x**: For the Python application to interact with the MySQL container.

---

## 🚀 Steps to Set Up

### 1. 📂 Clone the Repository
First, clone the repository to your local machine:

```bash
git clone https://github.com/yourusername/your-repo-name.git
cd your-repo-name
```

---

### 2. 📥 Pull MySQL Docker Image
To run MySQL in a container, pull the official MySQL image from Docker Hub:

```bash
docker pull mysql
```

This command downloads the MySQL image, which we'll use to create the MySQL container.

---

### 3. 🛠️ Build and Run the MySQL Container
Start a MySQL container by running the following command:

```bash
docker run -d \
  --env MYSQL_ROOT_PASSWORD="root" \
  --env MYSQL_DATABASE="userinfo" \
  --name mysql_container \
  mysql
```

Here’s what each part of the command does:

- `-d`: Runs the container in detached mode (background).
- `--env MYSQL_ROOT_PASSWORD="root"`: Sets the root password for MySQL to `root`.
- `--env MYSQL_DATABASE="userinfo"`: Creates a database named `userinfo`.
- `--name mysql_container`: Names the container `mysql_container`.
- `mysql`: Specifies the MySQL image to use.

This will start the MySQL container and create a database named `userinfo`.

---

### 4. 🔍 Get the MySQL Container IP Address
To get the IP address of the running MySQL container, run:

```bash
docker inspect mysql_container
```

Look for the `NetworkSettings` section and copy the IP address. Update your `demo_sql.py` file to use this IP in the `host` parameter of the `create_connection()` function:

```python
host="mysql_container_ip"  # Replace with the actual IP
```

---

### 5. 📄 Create a Dockerfile for the Python Application
Create a `Dockerfile` for your Python application with the necessary configuration. Once the Dockerfile is ready, build the Python image using the following command:

```bash
docker build -t pyapp .
```

---

### 6. ▶️ Run the Python Application Container
After building the image, run the Python container with the following command:

```bash
docker run -it --rm pyapp
```

The script will now run, connect to the MySQL container, and perform database operations.

---

### 7. 🌐 Optional: Pull Prebuilt Python Application Image
If you prefer not to build the Python image yourself, you can directly pull the prebuilt image from Docker Hub:

```bash
docker pull badal07/pyapp
docker run -it --rm badal07/pyapp
```

The application will now connect to the MySQL container, and you can start interacting with it.

---

## 📝 Application Features
When the Python application starts, you’ll be presented with the following options:

1. **➕ Add a Name**
   - Choose `1` to add a name to the MySQL database.
   - The application will prompt you to enter a name, and it will be inserted into the `usernames` table in the `userinfo` database.

2. **📋 Show All Usernames**
   - Choose `2` to display all the names stored in the MySQL database.
   - The application will fetch and display all usernames from the database.

3. **❌ Quit**
   - Choose `3` to exit the application.

---

## 🎯 Summary
This project showcases the integration of MySQL and Python using Docker, making it easy to run a portable, containerized application. Follow the steps above to set up the environment and start exploring the application’s features.

---

🎉 **Happy Coding!** 🚀

