-- =====================================================================
-- Hospital Management System Database Script (v2 - Corrected)
-- =====================================================================

DROP DATABASE IF EXISTS Hospital_Management_System;
CREATE DATABASE Hospital_Management_System;
USE Hospital_Management_System;

-- ####################################################################
-- STEP 1: Create tables with NO foreign key dependencies.
-- ####################################################################

DROP TABLE IF EXISTS Accountant;
CREATE TABLE Accountant (
  Accountant_id int NOT NULL AUTO_INCREMENT,
  FirstName varchar(255) NOT NULL,
  LastName varchar(255) NOT NULL,
  Sex char(1) NOT NULL,
  Date_of_Birth date NOT NULL,
  Paycheck int NOT NULL,
  PRIMARY KEY (Accountant_id),
  CONSTRAINT Accountant_chk_1 CHECK (Sex IN ('M','F'))
);

INSERT INTO Accountant VALUES 
(1,'Alex','Kumar','M','1990-05-15',60000),
(2,'Neha','Pathak','F','1985-08-22',75000),
(3,'Brijesh','Singh','M','1992-11-08',55000),
(4,'Neera','Gupta','F','1988-02-18',70000),
(5,'Arjun','Patel','M','1995-04-25',80000);

DROP TABLE IF EXISTS Patient;
CREATE TABLE Patient (
  Patient_Id int NOT NULL AUTO_INCREMENT,
  Name varchar(255) NOT NULL,
  Sex char(1) NOT NULL,
  Blood_group varchar(255) NOT NULL,
  Phone_no varchar(15) NOT NULL,
  Insurance_Id varchar(255) NOT NULL,
  Age int NOT NULL,
  Diabetic boolean NOT NULL,
  Blood_pressure boolean NOT NULL,
  PRIMARY KEY (Patient_Id),
  CONSTRAINT Patient_chk_1 CHECK (Sex IN ('M', 'F'))
);

INSERT INTO Patient (Patient_Id, Name, Sex, Blood_group, Phone_no, Insurance_Id, Age, Diabetic, Blood_pressure) VALUES 
(12, 'Aarav Kapoor', 'M', 'B+', '9876543210',  'INS123', 30, FALSE, TRUE),
(13, 'Diya Shah', 'F', 'O-', '8765432109',  'INS124', 25, FALSE, FALSE),
(14, 'Kabir Sharma', 'M', 'A+', '7654321098',  'INS125', 40, TRUE, FALSE),
(15, 'Aanya Singh', 'F', 'AB-', '6543210987',  'INS126', 35, TRUE, TRUE),
(16, 'Vihaan Patel', 'M', 'O+', '5432109876',  'INS127', 28, FALSE, FALSE),
(17, 'Anika Joshi', 'F', 'B-', '9876543211',  'INS128', 42, TRUE, TRUE),
(18, 'Advait Verma', 'M', 'A+', '8765432101',  'INS129', 33, TRUE, FALSE),
(19, 'Zara Khan', 'F', 'O-', '7654321092',  'INS130', 22, FALSE, FALSE),
(20, 'Arjun Khanna', 'M', 'AB+', '6543210983',  'INS131', 31, TRUE, TRUE),
(21, 'Ria Sharma', 'F', 'A+', '5432109874',  'INS132', 29, FALSE, TRUE),
(22, 'Vivaan Kapoor', 'M', 'A-', '9876543212', 'INS133', 34, TRUE, TRUE),
(23, 'Kiara Patel', 'F', 'B+', '8765432103',  'INS134', 27, FALSE, FALSE),
(24, 'Reyansh Singh', 'M', 'AB-', '7654321094',  'INS135', 36, TRUE, TRUE),
(25, 'Aaradhya Gupta', 'F', 'O+', '6543210985',  'INS136', 26, FALSE, FALSE),
(26, 'Aarav Malhotra', 'M', 'B-', '5432109876',  'INS137', 39, TRUE, FALSE),
(27, 'Diya Verma', 'F', 'A+', '9876543213',  'INS138', 41, TRUE, TRUE),
(28, 'Kabir Mehta', 'M', 'O-', '8765432104',  'INS139', 32, FALSE, FALSE),
(29, 'Aanya Kapoor', 'F', 'AB+', '7654321095',  'INS140', 38, TRUE, TRUE),
(30, 'Vihaan Sharma', 'M', 'O+', '6543210986',  'INS141', 24, FALSE, FALSE),
(31, 'Anaya Patel', 'F', 'B-', '5432109877',  'INS142', 37, TRUE, TRUE),
(32, 'Divyaraj', 'M', 'A+', '9898778866',  'INS143', 29, FALSE, TRUE);

DROP TABLE IF EXISTS Receptionist;
CREATE TABLE Receptionist (
  Receptionist_id int NOT NULL AUTO_INCREMENT,
  Name varchar(255) NOT NULL,
  Sex char(1) NOT NULL,
  Date_of_Birth date NOT NULL,
  Paycheck int NOT NULL,
  PRIMARY KEY (Receptionist_id),
  CONSTRAINT Receptionist_chk_1 CHECK (Sex IN ('M','F'))
);

INSERT INTO Receptionist VALUES 
(1,'Renu Sharma','F','1992-03-15',60000),
(2,'Vikram Singh','M','1988-07-22',65000),
(3,'Anjali Kapoor','F','1990-11-08',55000),
(4,'Rajesh Patel','M','1985-05-18',70000),
(5,'Neha Gupta','F','1987-09-25',75000);

DROP TABLE IF EXISTS General_Staff;
CREATE TABLE General_Staff (
  Staff_Id int NOT NULL AUTO_INCREMENT,
  Name varchar(255) NOT NULL,
  Sex char(1) NOT NULL,
  Date_of_Birth date NOT NULL,
  Hourly_wage int NOT NULL,
  Shift int NOT NULL,
  Weekly_Hours int NOT NULL,
  Weekly_wage int AS (Hourly_wage * Weekly_Hours) STORED,
  PRIMARY KEY (Staff_Id),
  CONSTRAINT Workers_chk_1 CHECK (Sex IN ('M', 'F'))
);

INSERT INTO General_Staff (Staff_Id, Name, Sex, Date_of_Birth, Hourly_wage, Shift, Weekly_Hours) VALUES
(1, 'Amit Kumar', 'M', '1993-05-15', 200, 1, 40),
(2, 'Sneha Sharma', 'F', '1988-08-22', 250, 2, 35),
(3, 'Rajesh Singh', 'M', '1995-11-08', 180, 1, 38),
(4, 'Pooja Gupta', 'F', '1990-02-18', 220, 2, 30),
(5, 'Arjun Patel', 'M', '1997-04-25', 240, 1, 42);

DROP TABLE IF EXISTS Inventory;
CREATE TABLE Inventory (
  Item_Name varchar(255) NOT NULL,
  Supplier_Phone_No varchar(15) NOT NULL,
  Available_Stock int NOT NULL,
  Min_Stock_Level int NOT NULL,
  Purchase_Date date NOT NULL,
  Expiry_Date date NOT NULL,
  Cost_Per_Unit int NOT NULL,
  PRIMARY KEY (Item_Name),
  CONSTRAINT Inventory_chk_2 CHECK (Available_Stock >= 0 AND Min_Stock_Level >= 0),
  CONSTRAINT Inventory_chk_3 CHECK (Expiry_Date > Purchase_Date)
);

INSERT INTO Inventory (Item_Name, Supplier_Phone_No, Available_Stock, Min_Stock_Level, Purchase_Date, Expiry_Date, Cost_Per_Unit) VALUES
('Paracetamol Tablets', '9876543210', 500, 100, '2024-11-01', '2026-11-01', 2),
('Bandages', '9123456780', 300, 50, '2024-10-20', '2025-10-20', 10),
('Surgical Gloves', '8987654321', 1000, 200, '2024-11-05', '2025-05-05', 5),
('Antiseptic Solution', '8765432190', 150, 20, '2024-10-15', '2025-01-15', 20),
('IV Fluid', '9123487654', 200, 50, '2024-11-10', '2025-04-10', 100),
('Syringes', '8654321098', 1200, 300, '2024-11-12', '2025-11-12', 2),
('Cotton Rolls', '9876123450', 250, 50, '2024-11-15', '2025-11-15', 15),
('Antibiotic Capsules', '8945673210', 400, 100, '2024-11-10', '2026-11-10', 25),
('Thermometers', '8734567890', 80, 10, '2024-10-25', '2026-10-25', 200),
('Face Masks', '9012345678', 5000, 1000, '2024-11-01', '2025-11-01', 1);

-- ####################################################################
-- STEP 2: Resolve the circular dependency between Doctor and Department.
-- ####################################################################

DROP TABLE IF EXISTS Doctor;
CREATE TABLE Doctor (
  Doctor_Id int NOT NULL AUTO_INCREMENT,
  Name varchar(255) NOT NULL,
  Date_of_Birth date NOT NULL,
  Paycheck int NOT NULL,
  Date_of_Joining varchar(255) NOT NULL,
  Age int NOT NULL,
  Sex char(1) NOT NULL,
  Department_Id int DEFAULT NULL,
  Supervisor_Id int DEFAULT NULL,
  Address varchar(255) NOT NULL,
  Phone_no varchar(15) NOT NULL,
  PRIMARY KEY (Doctor_Id)
);

DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
  Department_Id int NOT NULL AUTO_INCREMENT,
  Department_Name varchar(255) NOT NULL,
  Department_Head_Id int DEFAULT NULL,
  Floor_No int NOT NULL,
  Block_Name varchar(255) NOT NULL,
  PRIMARY KEY (Department_Id),
  KEY FK_Department_Head (Department_Head_Id),
  CONSTRAINT FK_Department_Head FOREIGN KEY (Department_Head_Id) REFERENCES Doctor (Doctor_Id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Now, add the missing foreign key to the Doctor table to complete the loop.
ALTER TABLE Doctor ADD CONSTRAINT FK_Doctor_Department FOREIGN KEY (Department_Id) REFERENCES Department (Department_Id) ON DELETE RESTRICT ON UPDATE CASCADE;

-- ####################################################################
-- STEP 3: Insert data for Doctor/Department with the CORRECT ORDER
-- Insert into the PARENT table (Department) FIRST.
-- ####################################################################

INSERT INTO Department (Department_Id, Department_Name, Department_Head_Id, Floor_No, Block_Name) VALUES
(1, 'Cardiology', NULL, 1, 'T-HUB'),
(2, 'Neurology', NULL, 2, 'KCIS'),
(3, 'Dermatology', NULL, 3, 'VINDHYA-A6'),
(4, 'Pathology', NULL, 4, 'VINDHYA-A4'),
(5, 'Ophthalmology', NULL, 5, 'VINDHYA-A3');

-- Insert into the CHILD table (Doctor) SECOND.
INSERT INTO Doctor (Doctor_Id, Name, Date_of_Birth, Paycheck, Date_of_Joining, Age, Sex, Department_Id, Supervisor_Id, Address, Phone_no) VALUES 
(1, 'Dr. John Smith', '1980-01-15', 120000, '2020-05-01', 43, 'M', 1, NULL, '123 Main St, City A', '9876543210'),
(2, 'Dr. Ananya Sharma', '1980-05-15', 1200000, '2021-01-15', 42, 'F', 1, 1, '456 Elm St, City B', '9876543211'),
(3, 'Dr. Rajesh Patel', '1975-08-22', 999999, '2022-03-10', 47, 'M', 2, 1, '789 Pine St, City C', '9876543212'),
(4, 'Dr. Priya Kapoor', '1982-11-08', 1000000, '2020-07-05', 39, 'F', 3, 2, '101 Maple St, City D', '9876543213'),
(5, 'Dr. Arjun Menon', '1978-02-18', 1300000, '2023-02-01', 44, 'M', 4, 1, '202 Birch St, City E', '9876543214'),
(6, 'Dr. Sneha Joshi', '1985-04-25', 1100000, '2021-09-20', 37, 'F', 5, 4, '303 Cedar St, City F', '9876543215'),
(7, 'Dr. Rahul Singh', '1987-06-30', 1600000, '2022-05-12', 35, 'M', 1, 3, '404 Oak St, City G', '9876543216'),
(8, 'Dr. Nisha Reddy', '1983-09-17', 1100000, '2020-11-08', 38, 'F', 2, 3, '505 Spruce St, City H', '9876543217'),
(9, 'Dr. Aryan Kapoor', '1989-12-03', 1400000, '2023-04-15', 32, 'M', 3, 4, '606 Walnut St, City I', '9876543218'),
(10, 'Dr. Neha Verma', '1984-03-20', 1200000, '2021-07-01', 38, 'F', 4, 5, '707 Chestnut St, City J', '9876543219'),
(11, 'Dr. Karthik Rajan', '1986-07-12', 1700000, '2022-08-25', 36, 'M', 5, 6, '808 Cypress St, City K', '9876543220'),
(12, 'Dr. Dev', '2004-12-01', 60000, '2021-12-04', 30, 'M', 2, 7, '909 Beech St, City L', '9876543221');

-- Now, update the Department Heads since the Doctors exist.
UPDATE Department SET Department_Head_Id = 7 WHERE Department_Id = 1;
UPDATE Department SET Department_Head_Id = 3 WHERE Department_Id = 2;
UPDATE Department SET Department_Head_Id = 9 WHERE Department_Id = 3;
UPDATE Department SET Department_Head_Id = 10 WHERE Department_Id = 4;
UPDATE Department SET Department_Head_Id = 11 WHERE Department_Id = 5;

-- ####################################################################
-- STEP 4: Create tables that depend on Doctor, Department, and Patient.
-- ####################################################################

DROP TABLE IF EXISTS Previous_Degrees_Doctor;
CREATE TABLE Previous_Degrees_Doctor (
    Doctor_Id int NOT NULL,
    College varchar(255) NOT NULL,
    `Year` int NOT NULL,
    Degree varchar(255) NOT NULL,
    Field varchar(255) NOT NULL,
    PRIMARY KEY (Doctor_Id, Degree, College, `Year`),
    CONSTRAINT FK_Previous_Degrees_Doctor_Doctor FOREIGN KEY (Doctor_Id) REFERENCES Doctor (Doctor_Id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Previous_Degrees_Doctor VALUES
(2, 'College A', 2010, 'MBBS', 'Medicine'),
(2, 'College B', 2015, 'MD', 'Internal Medicine'),
(3, 'College C', 2012, 'MBBS', 'Medicine'),
(4, 'College D', 2013, 'MBBS', 'Medicine'),
(5, 'College E', 2011, 'DO', 'Osteopathic Medicine'),
(6, 'College F', 2009, 'MBBS', 'Medicine'),
(6, 'College G', 2014, 'DNB', 'Internal Medicine'),
(7, 'College H', 2008, 'MBBS', 'Medicine'),
(7, 'College I', 2018, 'PhD', 'Biomedical Sciences'),
(8, 'College J', 2007, 'MBBS', 'Medicine'),
(8, 'College K', 2016, 'MS', 'Surgery'),
(9, 'College L', 2020, 'MCh', 'Neurosurgery'),
(10, 'College M', 2014, 'MBBS', 'Medicine'),
(12, 'College N', 2015, 'MBBS', 'Medicine');


DROP TABLE IF EXISTS Specialist;
CREATE TABLE Specialist (
  Doctor_Id int NOT NULL,
  Specialization_Area varchar(255) NOT NULL,
  Is_Surgeon boolean NOT NULL,
  PRIMARY KEY (Doctor_Id),
  FOREIGN KEY (Doctor_Id) REFERENCES Doctor(Doctor_Id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Specialist (Doctor_Id, Specialization_Area, Is_Surgeon) VALUES
(1, 'Cardiology', TRUE),
(2, 'Neurology', FALSE),
(3, 'Orthopedics', TRUE),
(4, 'Pediatrics', FALSE),
(5, 'Dermatology', FALSE),
(6, 'Gastroenterology', FALSE),
(7, 'Pulmonology', TRUE),
(8, 'Oncology', TRUE),
(9, 'Nephrology', FALSE),
(10, 'Endocrinology', FALSE),
(11, 'Hematology', TRUE),
(12, 'Pathology', FALSE);


DROP TABLE IF EXISTS Nurse;
CREATE TABLE Nurse (
  Nurse_Id int NOT NULL AUTO_INCREMENT,
  Name varchar(255) NOT NULL,
  Sex char(1) NOT NULL,
  Date_of_Birth date NOT NULL,
  Paycheck int NOT NULL,
  Department_Id int DEFAULT NULL,
  PRIMARY KEY (Nurse_Id),
  CONSTRAINT Nurse_chk_1 CHECK (Sex IN ('M', 'F')),
  KEY FK_Nurse_Department (Department_Id),
  CONSTRAINT FK_Nurse_Department FOREIGN KEY (Department_Id) REFERENCES Department (Department_Id) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO Nurse (Nurse_Id, Name, Sex, Date_of_Birth, Paycheck, Department_Id) VALUES
(1, 'Sakshi Sharma', 'F', '1990-05-15', 55000, 1),
(2, 'Rahul Kumar', 'M', '1985-08-20', 60000, 2),
(3, 'Neha Singh', 'F', '1992-11-10', 50000, 3),
(4, 'Amit Patel', 'M', '1988-04-25', 65000, 4),
(5, 'Priya Gupta', 'F', '1993-03-18', 60000, 5),
(6, 'Archit', 'M', '1995-07-07', 12000, 1);


DROP TABLE IF EXISTS Previous_Degrees_Nurse;
CREATE TABLE Previous_Degrees_Nurse (
    Nurse_Id int NOT NULL,
    College varchar(255) NOT NULL,
    `Year` int NOT NULL,
    Degree varchar(255) NOT NULL,
    Field varchar(255) NOT NULL,
    PRIMARY KEY (Nurse_Id, Degree, College, `Year`),
    CONSTRAINT FK_Previous_Degrees_Nurse_Nurse FOREIGN KEY (Nurse_Id) REFERENCES Nurse (Nurse_Id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Previous_Degrees_Nurse VALUES
(1, 'College A', 2015, 'BSc Nursing', 'Nursing'),
(1, 'College B', 2018, 'MSc Nursing', 'Nursing'),
(2, 'College C', 2012, 'General Nursing Diploma', 'Nursing'),
(3, 'College D', 2016, 'BSc Nursing', 'Nursing'),
(4, 'College E', 2010, 'ANM', 'Nursing'),
(4, 'College F', 2013, 'GNM', 'Nursing'),
(5, 'College G', 2019, 'Post Basic BSc Nursing', 'Nursing'),
(6, 'College H', 2014, 'Diploma in Critical Care Nursing', 'Nursing'),
(6, 'College I', 2017, 'BSc Nursing', 'Nursing');


DROP TABLE IF EXISTS Monitors;
CREATE TABLE Monitors (
  Patient_Id INT NOT NULL,
  Nurse_Id INT NOT NULL,
  PRIMARY KEY (Patient_Id, Nurse_Id),
  FOREIGN KEY (Patient_Id) REFERENCES Patient (Patient_Id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Nurse_Id) REFERENCES Nurse (Nurse_Id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Monitors (Patient_Id, Nurse_Id) VALUES
(12, 1), (13, 2), (14, 3), (15, 4), (16, 5), (17, 1), (18, 2),
(19, 3), (20, 4), (21, 5), (22, 1), (23, 2), (24, 3), (25, 6),
(26, 5), (27, 1), (28, 2), (29, 3), (30, 4), (31, 5), (32, 1);


-- ####################################################################
-- STEP 5: Create the central Medical_Record table.
-- ####################################################################

DROP TABLE IF EXISTS Medical_Record;
CREATE TABLE Medical_Record (
  Case_Id int NOT NULL AUTO_INCREMENT,
  Case_start_date DATE NOT NULL,
  Department_Id int DEFAULT NULL,
  Doctor_Id int DEFAULT NULL,
  Recent_visit DATE NOT NULL,
  Next_Appointment DATE NOT NULL,
  Total_visits int NOT NULL,
  Patient_Id int NOT NULL,
  Status varchar(255) NOT NULL,
  PRIMARY KEY (Case_Id),
  CONSTRAINT FK_Medical_Record_Patient FOREIGN KEY (Patient_Id) REFERENCES Patient (Patient_Id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_Medical_Record_Doctor FOREIGN KEY (Doctor_Id) REFERENCES Doctor (Doctor_Id) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT FK_Medical_Record_Department FOREIGN KEY (Department_Id) REFERENCES Department (Department_Id) ON DELETE SET NULL ON UPDATE CASCADE
);

INSERT INTO Medical_Record (Case_Id, Case_start_date, Department_Id, Doctor_Id, Recent_visit, Next_Appointment, Total_visits, Patient_Id, Status) VALUES
(1, '2023-01-10', 1, 2, '2024-12-10', '2023-04-10', 3, 13, 'In Progress'),
(3, '2023-02-28', 2, 3, '2023-03-01', '2023-04-01', 1, 13, 'SUCCESS'),
(4, '2022-09-20', 3, 4, '2023-12-15', '2023-12-13', 4, 14, 'In Progress'),
(5, '2023-03-01', 4, 5, '2024-12-20', '2024-04-01', 2, 12, 'In Progress'),
(11, '2023-04-15', 1, 1, '2024-12-05', '2024-05-10', 3, 23, 'Scheduled'),
(12, '2023-03-05', 3, 2, '2023-03-10', '2024-12-13', 1, 31, 'SUCCESS'),
(13, '2023-05-20', 4, 3, '2023-12-25', '2023-06-10', 2, 32, 'Scheduled'),
(14, '2023-02-15', 1, 4, '2023-02-20', '2023-03-05', 4, 24, 'Closed'),
(15, '2023-04-10', 1, 5, '2023-04-15', '2023-05-01', 2, 26, 'SUCCESS'),
(16, '2023-06-15', 1, 1, '2024-12-20', '2024-12-13', 3, 30, 'Scheduled'),
(17, '2023-07-05', 3, 2, '2023-12-10', '2023-07-20', 1, 19, 'In Progress'),
(18, '2023-08-20', 4, 3, '2023-08-25', '2023-09-10', 2, 20, 'SUCCESS'),
(19, '2023-05-15', 5, 4, '2023-05-20', '2023-06-05', 4, 18, 'Closed'),
(20, '2023-07-10', 1, 5, '2024-12-01', '2023-12-13', 2, 25, 'In Progress'),
(21, '2023-12-03', 2, 12, '2024-12-10', '2023-12-10', 1, 16, 'Active');


-- ####################################################################
-- STEP 6: Create tables that depend on Medical_Record.
-- ####################################################################

DROP TABLE IF EXISTS Invoice;
CREATE TABLE Invoice (
  Transaction_id int NOT NULL,
  Case_id int NOT NULL,
  Consultating_charges int NOT NULL,
  Operational_charges int DEFAULT NULL,
  Medicinal_charges int DEFAULT NULL,
  PRIMARY KEY (Transaction_id),
  KEY FK_Invoice_Medical_Record (Case_id),
  CONSTRAINT FK_Invoice_Medical_Record FOREIGN KEY (Case_id) REFERENCES Medical_Record (Case_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Invoice (Transaction_id, Case_id, Consultating_charges, Operational_charges, Medicinal_charges) VALUES 
(11, 21, 1234, 123, 90),
(101, 1, 500, 1000, NULL),
(103, 3, 700, 0, NULL),
(104, 4, 800, 1200, 300),
(105, 5, 900, 1500, 400),
(106, 1, 600, 800, 150),
(107, 1, 750, NULL, 200),
(108, 3, 850, 1100, 250),
(109, 4, 900, 1200, 300),
(110, 3, 600, NULL, 200),
(111, 4, 750, 900, 300),
(112, 12, 450, 800, 100),
(113, 14, 700, 1500, 400),
(114, 14, 800, NULL, NULL),
(115, 15, 950, 2000, 500),
(116, 16, 600, 1100, 300),
(117, 17, 550, 900, NULL),
(118, 18, 750, 1400, 200),
(119, 19, 850, NULL, NULL),
(120, 20, 700, 1000, 150),
(212, 21, 500, NULL, NULL),
(213, 5, 1000, 2000, 500),
(214, 1, 450, NULL, 250);


DROP TABLE IF EXISTS Patient_Billing;
CREATE TABLE Patient_Billing (
  Case_Id INT NOT NULL,
  Accountant_Id INT,
  Patient_Id INT NOT NULL,
  PRIMARY KEY (Case_Id),
  FOREIGN KEY (Case_Id) REFERENCES Medical_Record (Case_Id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Accountant_Id) REFERENCES Accountant (Accountant_Id) ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (Patient_Id) REFERENCES Patient (Patient_Id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Patient_Billing (Case_Id, Accountant_Id, Patient_Id) VALUES
(1, 1, 13), (3, 2, 13), (4, 3, 14), (5, 4, 12), (11, 5, 23),
(12, 1, 31), (13, 2, 32), (14, 3, 24), (15, 4, 26), (16, 5, 30),
(17, 1, 19), (18, 2, 20), (19, 3, 18), (20, 4, 25), (21, 5, 16);


DROP TABLE IF EXISTS Prescription;
CREATE TABLE Prescription (
  Prescription_no int NOT NULL,
  Case_id int NOT NULL,
  Medicines varchar(255) NOT NULL,
  PRIMARY KEY (Prescription_no),
  KEY FK_Prescription_Medical_Record (Case_id),
  CONSTRAINT FK_Prescription_Medical_Record FOREIGN KEY (Case_id) REFERENCES Medical_Record (Case_id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO Prescription VALUES 
(101, 1, 'Aspirin, Metoprolol'),
(103, 3, 'Acetaminophen, Amoxicillin'),
(104, 4, 'Atorvastatin, Lisinopril'),
(105, 5, 'Eye Drops, Prednisolone'),
(123, 21, 'DOLO65');


DROP TABLE IF EXISTS Medical_History;
CREATE TABLE Medical_History (
  History_Entry_Id int NOT NULL AUTO_INCREMENT,
  Case_id int NULL,
  Patient_Id int NOT NULL,
  PRIMARY KEY (History_Entry_Id),
  UNIQUE KEY UK_Case_Id (Case_id),
  CONSTRAINT FK_Medical_History_Case FOREIGN KEY (Case_id) REFERENCES Medical_Record (Case_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_Medical_History_Patient FOREIGN KEY (Patient_Id) REFERENCES Patient (Patient_Id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Medical_History (Case_Id, Patient_Id) VALUES
(1, 13), (3, 13), (4, 14), (5, 12), (11, 23), (12, 31),
(13, 32), (14, 24), (15, 26), (16, 30), (17, 19), (18, 20),
(19, 18), (20, 25), (21, 16);


DROP TABLE IF EXISTS Surgery_Assignment;
CREATE TABLE Surgery_Assignment (
    Case_Id INT NOT NULL,
    Doctor_Id INT NOT NULL,
    Patient_Id INT NOT NULL,
    Nurse_Id INT NOT NULL,
    PRIMARY KEY(Case_Id, Doctor_Id),
    FOREIGN KEY (Doctor_Id) REFERENCES Doctor(Doctor_Id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Patient_Id) REFERENCES Patient(Patient_Id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Nurse_Id) REFERENCES Nurse(Nurse_Id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Case_Id) REFERENCES Medical_Record(Case_Id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Surgery_Assignment (Case_Id, Doctor_Id, Patient_Id, Nurse_Id) VALUES
(1, 1, 13, 1), (3, 3, 13, 2), (4, 4, 14, 3), (5, 5, 12, 4),
(11, 7, 23, 5), (12, 6, 31, 6), (13, 8, 32, 1), (14, 9, 24, 2),
(15, 10, 26, 3), (16, 11, 30, 4), (17, 2, 19, 5), (21, 12, 16, 6);


-- ####################################################################
-- STEP 7: Create final tables that depend on Prescription.
-- ####################################################################

DROP TABLE IF EXISTS Medication_Issuance;
CREATE TABLE Medication_Issuance (
  Issuance_Id INT NOT NULL AUTO_INCREMENT,
  Doctor_Id INT NOT NULL,
  Prescription_number INT NOT NULL,
  Patient_Id INT NOT NULL,
  PRIMARY KEY (Issuance_Id),
  UNIQUE KEY UK_Prescription_number (Prescription_number),
  FOREIGN KEY (Doctor_Id) REFERENCES Doctor(Doctor_Id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Prescription_number) REFERENCES Prescription(Prescription_no) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Patient_Id) REFERENCES Patient(Patient_Id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Medication_Issuance (Doctor_Id, Prescription_number, Patient_Id) VALUES
(2, 101, 13),
(3, 103, 13),
(4, 104, 14),
(5, 105, 12),
(12, 123, 16);
