-- CREATE EMPLOYEE TIME TRACKING DATABASE

CREATE DATABASE employee_time_tracking;
USE employee_time_tracking;

-- CREATE THE EMPLOYEE TABLE     
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    hire_date DATE,
    position VARCHAR(100),
    status VARCHAR(50)
);
DESCRIBE Employee;

-- CREATE THE TIME SHEET TABLE
CREATE TABLE Timesheet (
    timesheet_id INT PRIMARY KEY,
    employee_id INT,
    date DATE,
    start_time TIME,
    end_time TIME,
    hours_worked DECIMAL(5,2),
    overtime_hours DECIMAL(5,2),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);
DESCRIBE Timesheet

-- CREATE THE ATTENDANCE TABLE
CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    employee_id INT,
    date DATE,
    status VARCHAR(50),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

DESCRIBE Attendance;  

-- CREATE THE EMPLOYEE_SHIFT TABLE
CREATE TABLE Shift (
    shift_id INT PRIMARY KEY,
    shift_name VARCHAR(50),
    start_time TIME,
    end_time TIME
);
DESCRIBE Shift;

CREATE TABLE Employee_Shift (
    employee_id INT,
    shift_id INT,
    shift_date DATE,
    PRIMARY KEY (employee_id, shift_id, shift_date),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (shift_id) REFERENCES Shift(shift_id)
);
DESCRIBE Employee_shift;

SHOW TABLES;



