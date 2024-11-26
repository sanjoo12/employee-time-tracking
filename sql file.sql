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

INSERT INTO Employee (employee_id, first_name, last_name, email, phone_number, hire_date, position, status)
VALUES 
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '2023-01-15', 'Software Developer', 'Active'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', '2022-05-20', 'Project Manager', 'Active'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '345-678-9012', '2021-07-10', 'UX Designer', 'On Leave');
INSERT INTO Timesheet (timesheet_id, employee_id, date, start_time, end_time, hours_worked, overtime_hours)
VALUES 
(1, 1, '2024-11-25', '08:00:00', '17:00:00', 8.00, 0.00),
(2, 2, '2024-11-25', '09:00:00', '18:00:00', 8.00, 1.00),
(3, 3, '2024-11-25', '10:00:00', '17:00:00', 7.00, 0.00);
INSERT INTO Attendance (attendance_id, employee_id, date, status)
VALUES 
(1, 1, '2024-11-25', 'Present'),
(2, 2, '2024-11-25', 'Present'),
(3, 3, '2024-11-25', 'On Leave');
INSERT INTO Shift (shift_id, shift_name, start_time, end_time)
VALUES 
(1, 'Morning Shift', '08:00:00', '16:00:00'),
(2, 'Afternoon Shift', '12:00:00', '20:00:00'),
(3, 'Night Shift', '22:00:00', '06:00:00');
INSERT INTO Employee_Shift (employee_id, shift_id, shift_date)
VALUES 
(1, 1, '2024-11-25'),
(2, 2, '2024-11-25'),
(3, 1, '2024-11-25');



