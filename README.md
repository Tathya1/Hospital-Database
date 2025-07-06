---

# Hospital Management System - Database Setup

This repository contains the SQL script and setup instructions for creating and populating a database for a simple Hospital Management System. It also includes guidance on common issues when building an application to interact with this database.

## Prerequisites

Before you begin, ensure you have the following installed:

*   **MySQL Server**: The database system used for this project.
*   **Python 3**: For running application scripts that interact with the database.
*   **Python MySQL Connector**: A library to connect Python to MySQL. Install it via pip:
    ```bash
    pip install mysql-connector-python
    pip install colorama
    pip install pymysql
    ```

## Setup Instructions

Follow these steps to set up the database on your local machine.

### Step 1: MySQL User Authentication (First-Time Only)

On some systems (especially modern Ubuntu/Debian), the `root` user authenticates via `auth_socket` instead of a password, which can cause issues with application connectors. These commands set a password for the `root` user.

1.  Log in to MySQL with sudo privileges:
    ```bash
    sudo mysql
    ```

2.  Run the following SQL commands to set a password for the `root` user. **Replace `'devjk'` with your own secure password.**
    ```sql
    ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'devjk';
    FLUSH PRIVILEGES;
    EXIT;
    ```
    You will now be able to log in using the password you just set.

### Step 2: Creating and Populating the Database

The `database.sql` script is designed to be self-contained. It will automatically drop the database if it exists, create a new one, and then create all the tables and insert the sample data.

1.  Navigate to the project directory in your terminal.

2.  Run the following command to execute the script. You will be prompted to enter the MySQL `root` password you set in Step 1.
    ```bash
    mysql -u root -p < database.sql
    ```
    *Note: You do not need to specify the database name in the command, as the script itself contains the `CREATE DATABASE` and `USE` statements.*

### Step 3: Verification (Optional)

You can verify that the database was created successfully.

1.  Log in to MySQL:
    ```bash
    mysql -u root -p
    ```

2.  Once logged in, switch to the new database and view its tables:
    ```sql
    USE Hospital_Management_System;
    SHOW TABLES;
    ```

3.  You can also query a table to see if the data was inserted correctly:
    ```sql
    SELECT * FROM Doctor LIMIT 5;
    ```

## Running the Python Application

When building a Python application to interact with this database, you might encounter issues with user input, especially for optional fields.

#### Common Issue: Handling `NULL` Input

**Problem:** The database `Doctor` table allows `Supervisor_Id` to be `NULL`. If your Python script asks for this ID and the user just presses Enter, the program receives an empty string (`''`). Trying to convert this empty string to a number with `int('')` will crash the program with an error like: `ValueError: invalid literal for int() with base 10: ''`.

**Solution:** The code must check for empty input *before* attempting the conversion and translate it to Python's `None` object, which the database driver will correctly interpret as SQL `NULL`.


## Troubleshooting & Common Commands

*   **To quickly reset the database (drop and recreate an empty one):**
    This is useful if you want a clean slate without re-importing all the data.
    ```bash
    mysql -u root -p -e "DROP DATABASE IF EXISTS Hospital_Management_System; CREATE DATABASE Hospital_Management_System;"
    ```

*   **To re-run the full import process (if something went wrong):**
    This is the main command from Step 2.
    ```bash
    mysql -u root -p < database.sql
    ```

*   **To log in to the MySQL command-line interface:**
    ```bash
    mysql -u root -p
    ```
