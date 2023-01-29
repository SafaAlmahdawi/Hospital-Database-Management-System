
--Administration Table:

create table Admin(
adminID int not null primary key,
firstName Varchar2(20) not null,
Lastname varchar2(20) not null,
PhoneNo char(10) not null,
departmentName VARCHAR2(100),
officeNo VARCHAR(3)
);

INSERT INTO admin VALUES(1,'John', 'Dorian','1111111111','General Internal Medicine','112');
INSERT INTO Admin VALUES(2,'Elliot','Reid','2222222222','Cardiology','223');
INSERT INTO Admin VALUES(3,'Christopher','Turk','3333333333','Dermatology','334');
INSERT INTO Admin VALUES(4,'Percival','Cox','4444444444','Oncology','445');
INSERT INTO Admin VALUES(5,'Bob','Kelso','5555555555','Gastroenterology','556');
INSERT INTO Admin VALUES(6,'Todd','Quinlan','6666666666','Endocrinology','667');
INSERT INTO Admin VALUES(7,'John','Wen','7777777777','Pulmonology','778');
INSERT INTO Admin VALUES(8,'Keith','Dudemeiste','8888888888','Pharmacology','889');
INSERT INTO Admin VALUES(9,'Molly','Clock','9999999999','Nephrology','990');

select * from admin;


create table Doctor(
doctor_ID int not null primary key,
firstName Varchar2(20) not null,
Lastname varchar2(20) not null,
departmentName VARCHAR2(100),
officeNo VARCHAR(10),
charge number not null CHECK(charge >= 0),
SSN CHAR(9) NOT NULL,
yearsOfPractice NUMERIC DEFAULT 1
);

INSERT INTO doctor VALUES(1,'Susan', 'Grey','General Internal Medicine','111111111',10,'111',250);
INSERT INTO doctor VALUES(2,'Chris','Billinson','Cardiology','222222222',2,'222',300);
INSERT INTO doctor VALUES(3,'John','Noble','Dermatology','333333333',4,'333',125);
INSERT INTO doctor VALUES(4,'Beth','Rettinger','Oncology','444444444',7,'444',260);
INSERT INTO doctor VALUES(5,'Amy','Cote','Gastroenterology','555555555',1,'555',530);
INSERT INTO doctor VALUES(6,'Phil','Kinsella','Endocrinology','666666666',9,'666',120);
INSERT INTO doctor VALUES(7,'Patricia','Smith','Pulmonology','777777777',8,'777',550);
INSERT INTO doctor VALUES(8,'Jeffrey','Carpenter','Pharmacology','888888888',23,'888',400);
INSERT INTO doctor VALUES(9,'Amanda','Shock','Nephrology','999999999',1,'999',1000);

select * from doctor;

Create table PATIENT(
patient_ID INT NOT NULL PRIMARY KEY,
firstName VARCHAR2(20) NOT NULL,
lastName VARCHAR2(30) NOT NULL,
DOB DATE DEFAULT SYSDATE,
age NUMERIC NOT NULL CHECK(age >= 0),
gender VARCHAR2(2) NOT NULL CHECK(gender IN ('M', 'F')),
streetNo NUMERIC NOT NULL,
streetName VARCHAR2(100) NOT NULL,
city VARCHAR2(30) NOT NULL,
stateName CHAR(2) NOT NULL, -- Two letter abbreviation for stateName
zip NUMERIC(5) NOT NULL,
phoneNo CHAR(10),
doctor_ID INT NOT NULL,
patientType CHAR(1) NOT NULL CHECK(patientType IN ('O','I')),
patientHeight INT CHECK(patientHeight > 0), -- in centimeters (cm)
patientWeight INT CHECK(patientWeight > 0), -- in pounds (lbs)
foreign key (doctor_ID ) REFERENCES doctor
);

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';


INSERT INTO PATIENT VALUES(1,'Timothy','Gamble','1996-10-16',23,'M',123,'Cary Road','Manlius','NY',13104,'3153453651',1,'I',172,180);
INSERT INTO PATIENT VALUES(2,'Chris', 'Richards','1990-11-12',27,'M',234,'Bridge Avenue','Manlius','NY',13104,'3154256157',3,'I',150,164);
INSERT INTO PATIENT VALUES(3,'Chase','Roberts','1986-02-14',33,'M',345,'Lorraine Avenue','Syracuse','NY',16802,'6157267893',2,'I',144,220);
INSERT INTO PATIENT VALUES(4,'Nancy','Frechette','1964-01-19',55,'F',456,'Carrier Drive','Liverpool','NY',16803,'5152620092',5,'I',130,135);
INSERT INTO PATIENT VALUES(5,'Elvira','Robinson','2001-02-13',18,'F',567,'Taft Lane','Fayetteville','NY',22222,'1236728172',4,'I',190,240);
INSERT INTO PATIENT VALUES(6,'Lucy','Puro','2004-02-04',15,'F',678,'Barksdale Lane','Baldwinsville','NY',31215,'3334125263',6,'O',115,100);
INSERT INTO PATIENT VALUES(7,'Jamal','Badger','1997-07-21',22,'M',789,'Trillium Trail','Manlius','NY',13104,'4447267281',9,'O',156,145);
INSERT INTO PATIENT VALUES(8,'Rick','Carlton','1972-01-01',47,'M',890,'Parker Drive','Fayetteville','NY',22222,'7772891827',8,'O',174,210);
INSERT INTO PATIENT VALUES(9,'Sally', 'Baker','1952-04-20',67,'F',012,'Trout Road','Syracuse','NY',16802,'7268880290',7,'O',189,214);

select * from PATIENT;

create table Apporintment
(
appointmentID INT NOT NULL PRIMARY KEY,
patient_ID INT NOT NULL,
doctor_ID INT NOT NULL,
adminID INT NOT NULL,
appointmentDate date DEFAULT sysdate,
FOREIGN KEY (doctor_ID) REFERENCES DOCTOR,
FOREIGN KEY (patient_ID) REFERENCES PATIENT,
FOREIGN KEY (adminID) REFERENCES ADMIN
);

INSERT INTO Apporintment VALUES(100000001,1,1,9,'2019-09-08');
INSERT INTO Apporintment VALUES(100000002,2,3,2,'2019-10-04');
INSERT INTO Apporintment VALUES(100000003,3,6,8,'2019-10-02');
INSERT INTO Apporintment VALUES(100000004,4,5,3,'2019-04-06');
INSERT INTO Apporintment VALUES(100000005,5,4,5,'2019-08-16');
INSERT INTO Apporintment VALUES(100000006,6,2,6,'2019-05-11');
INSERT INTO Apporintment VALUES(100000007,7,8,7,'2019-11-10');
INSERT INTO Apporintment VALUES(100000008,8,7,4,'2019-11-09');
INSERT INTO Apporintment VALUES(100000009,9,9,1,'2019-07-16');


select * from Apporintment;

create table Diagnosis(
diagnosisID INT NOT NULL PRIMARY KEY,
doctor_ID INT NOT NULL,
patient_ID INT NOT NULL,
diagnosisCategory VARCHAR2(100) NOT NULL,
diagnosis VARCHAR2(250),
diagnosisDate DATE not null ,
FOREIGN KEY (doctor_ID) REFERENCES DOCTOR,
FOREIGN KEY (patient_ID) REFERENCES PATIENT
);

INSERT INTO DIAGNOSIS VALUES(100000011,1,1,'Hypertension','High Systolic BP. High Salt Diet, must reduce and take ACE Inhibitors','2019-09-08');
INSERT INTO DIAGNOSIS VALUES(100000022,2,3,'Diabetes','Type II Diabetic, must reduce sugar and intake and take Insulin once daily','2019-10-05');
INSERT INTO DIAGNOSIS VALUES(100000033,3,2,'Back Pain','Fractured L3 Vertebrae, perscribed Oxycontin, recommended 30 mg / daily for one month','2019-10-04');
INSERT INTO DIAGNOSIS VALUES(100000044,4,5,'Anxiety','Reduced levels of Serotonin in the brain, perscribed Alazopram 0.5 mg for three months. Take as needed','2019-08-16');
INSERT INTO DIAGNOSIS VALUES(100000055,5,4,'Allergic rhinitis','Inflamed sinus, stuffy nose for 2 weeks. Take OTC Allegra, Benadryl or Claritin from local pharmacy','2019-04-07');
INSERT INTO DIAGNOSIS VALUES(100000066,6,6,'Obesity','Referred to Dietician. Must reduce sugar intake and exercise regularly','2019-05-11');
INSERT INTO DIAGNOSIS VALUES(100000077,7,9,'Hypothyroidism','Hyperactive thyroid leading to weight gain and lack of hunger. Take Levothyroxine: 10 mg/day for 3 months and schedule an additional appointment within theyear.','2019-11-10');
INSERT INTO DIAGNOSIS VALUES(100000088,8,8,'Osteoarthritis','Joint Pain in left knee following lifting boxes. Take X-Ray of joint and increaseCalcium intake','2019-11-09');
INSERT INTO DIAGNOSIS VALUES(100000099,9,7,'Acute bronchitis','Severe coughing fits. Prescribed inhaler from nearest pharmacy','2019-11-10');

select * from DIAGNOSIS;

create table billing
(
billingID INT NOT NULL PRIMARY KEY,
patient_ID INT NOT NULL,
doctorCharge NUMERIC DEFAULT 0, 
prescriptionCharge NUMERIC DEFAULT 0,
roomCharge NUMERIC DEFAULT 0,
insuranceCoveragePercentage NUMERIC(3) DEFAULT 0,
billingDate DATE NOT NULL,
FOREIGN KEY (patient_ID) REFERENCES PATIENT
);


INSERT INTO billing VALUES(100000111,1,250,40,0,80,'2019-09-09');
INSERT INTO billing VALUES(100000222,2,125,400,100,60,'2019-10-06');
INSERT INTO billing VALUES(100000333,3,300,80,0,40,'2019-10-06');
INSERT INTO billing VALUES(100000444,4,530,0,0,10,'2019-04-08');
INSERT INTO billing VALUES(100000555,5,260,90,100,0,'2019-08-18');
INSERT INTO billing VALUES(100000666,6,120,0,100,55,'2019-05-13');
INSERT INTO billing VALUES(100000777,7,1000,15,100,100,'2019-11-12');
INSERT INTO billing VALUES(100000888,8,400,0,100,15,'2019-11-11');
INSERT INTO billing VALUES(100000999,9,550,100,0,45,'2019-11-11');

Select * from billing;


Create table inpatient
(
inpatientID INT NOT NULL PRIMARY KEY,
admitDate DATE DEFAULT sysdate ,
dischargeDate DATE,
FOREIGN KEY (inpatientID) REFERENCES PATIENT(patient_ID)
);

INSERT INTO inpatient VALUES(1,'2019-10-04','2019-10-05');
INSERT INTO inpatient VALUES(2,'2019-08-16','2019-08-17');
INSERT INTO inpatient VALUES(3,'2019-05-11','2019-05-12');
INSERT INTO inpatient VALUES(4,'2019-11-10','2019-11-11');
INSERT INTO inpatient VALUES(5,'2019-11-09','2019-11-10');

Select * from inpatient;

Create table outpatient
(
outpatientID INT NOT NULL PRIMARY KEY,
lastConsultDate DATE,
FOREIGN KEY (outpatientID) REFERENCES PATIENT(patient_ID)
);

INSERT INTO outpatient VALUES(6,'2019-09-08');
INSERT INTO outpatient VALUES(7,'2019-10-02');
INSERT INTO outpatient VALUES(8,'2019-04-06');
INSERT INTO outpatient VALUES(9,'2019-07-16');

Select * from outpatient;

Create table Room 
(
roomID INT NOT NULL PRIMARY KEY,
roomStatus VARCHAR2(10) NOT NULL CHECK(roomStatus IN ('Vacant','Occupied')),
roomCharge NUMERIC NOT NULL CHECK(roomCharge > 0)
);

INSERT INTO ROOM VALUES(1,'Vacant',100);
INSERT INTO ROOM VALUES(2,'Vacant',100);
INSERT INTO ROOM VALUES(3,'Vacant',100);
INSERT INTO ROOM VALUES(4,'Vacant',100);
INSERT INTO ROOM VALUES(5,'Vacant',100);
INSERT INTO ROOM VALUES(6,'Vacant',100);
INSERT INTO ROOM VALUES(7,'Vacant',100);
INSERT INTO ROOM VALUES(8,'Vacant',100);
INSERT INTO ROOM VALUES(9,'Vacant',100);
INSERT INTO ROOM VALUES(10,'Vacant',100);
INSERT INTO ROOM VALUES(11,'Vacant',100);
INSERT INTO ROOM VALUES(12,'Vacant',100);
INSERT INTO ROOM VALUES(13,'Vacant',100);
INSERT INTO ROOM VALUES(14,'Vacant',100);
INSERT INTO ROOM VALUES(15,'Vacant',100);
INSERT INTO ROOM VALUES(16,'Vacant',100);
INSERT INTO ROOM VALUES(17,'Vacant',100);
INSERT INTO ROOM VALUES(18,'Vacant',100);
INSERT INTO ROOM VALUES(19,'Vacant',100);
INSERT INTO ROOM VALUES(20,'Vacant',100);

Select * from ROOM;


CREATE TABLE ROOM_INPATIENT
(
inpatientID INT NOT NULL, 
roomID INT NOT NULL,
 PRIMARY KEY (inpatientID,roomID),
 FOREIGN KEY (inpatientID) REFERENCES INPATIENT(INpatientID),
 FOREIGN KEY (roomID) REFERENCES ROOM(roomID)
);

INSERT INTO ROOM_INPATIENT VALUES(1,1);
INSERT INTO ROOM_INPATIENT VALUES(2,2);
INSERT INTO ROOM_INPATIENT VALUES(3,3);
INSERT INTO ROOM_INPATIENT VALUES(4,4);
INSERT INTO ROOM_INPATIENT VALUES(5,5);

Select * from ROOM_INPATIENT;


