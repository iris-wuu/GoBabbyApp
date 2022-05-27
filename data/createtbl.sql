-- Include your create table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the create table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been created.

-- This is only an example of how you add create table ddls to this file.
--   You may remove it.
CREATE TABLE MYTEST01
(
  id INTEGER NOT NULL
 ,value INTEGER
 ,PRIMARY KEY(id)
);




CREATE TABLE Institution
(
    instid VARCHAR(10) NOT NULL,
    instname VARCHAR(30) NOT NULL UNIQUE,
    instaddr VARCHAR(50) NOT NULL,
    instphonenum VARCHAR(30) NOT NULL,
    instemail VARCHAR(30) NOT NULL UNIQUE,
    instwebsite VARCHAR(50),
    PRIMARY KEY (instid)
);



CREATE TABLE Midwife
(
    practitionerid VARCHAR(10) NOT NULL,
    mwfname VARCHAR(30) NOT NULL UNIQUE,
    mwfemail VARCHAR(30) NOT NULL UNIQUE,
    mwfphonenum VARCHAR(30) NOT NULL,
    instid VARCHAR(10) NOT NULL,
    PRIMARY KEY (practitionerid),
    FOREIGN KEY (instid) REFERENCES Institution (instid)
);



CREATE TABLE Mother
(
    mcardid VARCHAR(10) NOT NULL,
    expbirthframe VARCHAR(20) NOT NULL,
    mname VARCHAR(30) NOT NULL,
    mbirth DATE NOT NULL,
    maddr VARCHAR(50) NOT NULL,
    mphonenum VARCHAR(30) NOT NULL,
    memail VARCHAR(30) NOT NULL UNIQUE,
    mprof VARCHAR(50) NOT NULL,
    mblood VARCHAR(10),
    PRIMARY KEY (mcardid)
);



CREATE TABLE Father
(
    fatherid VARCHAR(10) NOT NULL,
    fname VARCHAR(30) NOT NULL,
    fbirth DATE NOT NULL,
    fphonenum VARCHAR(30) NOT NULL,
    fprof VARCHAR(30) NOT NULL,
    fcardid VARCHAR(10),
    faddr VARCHAR(50),
    femail VARCHAR(30),
    fblood VARCHAR(10),
    PRIMARY KEY (fatherid)
);



CREATE TABLE RegParent
(
    parentid VARCHAR(10) NOT NULL,
    mcardid VARCHAR(10) NOT NULL,
    fatherid VARCHAR(10),
    PRIMARY KEY (parentid),
    FOREIGN KEY (mcardid) REFERENCES Mother (mcardid),
    FOREIGN KEY (fatherid) REFERENCES Father (fatherid)
);



CREATE TABLE Pregnancy
(
    pregid VARCHAR(10) NOT NULL,
    interested BOOLEAN NOT NULL,
    pregnumtime INT NOT NULL,
    parentid VARCHAR(10) NOT NULL,
    instid VARCHAR(10) NOT NULL,
    primary_pracid VARCHAR(10) NOT NULL,
    backup_pracid VARCHAR(10),
    fir_duedate DATE,
    sec_duedate DATE,
    final_duedate DATE,
    birthlocation VARCHAR(50),
    babynum INT,
    PRIMARY KEY (pregid),
    FOREIGN KEY (parentid) REFERENCES RegParent (parentid),
    FOREIGN KEY (instid) REFERENCES Institution (instid),
    FOREIGN KEY (primary_pracid) REFERENCES Midwife (practitionerid),
    FOREIGN KEY (backup_pracid) REFERENCES Midwife (practitionerid)
);



CREATE TABLE Appointment
(
    apptid VARCHAR(10) NOT NULL,
    apptdate DATE NOT NULL,
    appttime TIME NOT NULL,
    practitionerid VARCHAR(10) NOT NULL,
    pregid VARCHAR(10) NOT NULL,
    PRIMARY KEY (apptid),
    FOREIGN KEY (practitionerid) REFERENCES Midwife (practitionerid),
    FOREIGN KEY (pregid) REFERENCES Pregnancy (pregid)
);



CREATE TABLE Technician
(
    techid VARCHAR(10) NOT NULL,
    techname VARCHAR(30) NOT NULL,
    techphonenum VARCHAR(30) NOT NULL,
    PRIMARY KEY (techid)
);



CREATE TABLE MedActions
(
    testid VARCHAR(10) NOT NULL,
    apptid VARCHAR(10) NOT NULL,
    testtype VARCHAR(30) NOT NULL,
    prescrdate DATE NOT NULL,
    sampledate DATE,
    techid VARCHAR(10),
    result VARCHAR(30),
    labdate DATE,
    PRIMARY KEY (testid),
    FOREIGN KEY (apptid) REFERENCES Appointment (apptid),
    FOREIGN KEY (techid) REFERENCES Technician (techid)
);



CREATE TABLE Clinic
(
    instid VARCHAR(10) NOT NULL,
    PRIMARY KEY (instid),
    FOREIGN KEY (instid) REFERENCES Institution (instid)
);


CREATE TABLE BirthCenter
(
    instid VARCHAR(10) NOT NULL,
    PRIMARY KEY (instid),
    FOREIGN KEY (instid) REFERENCES Institution (instid)
);



CREATE TABLE Baby
(
    babyid VARCHAR(10) NOT NULL,
    pregid VARCHAR(10) NOT NULL,
    babygender VARCHAR(10),
    babybdate DATE,
    babybtime TIME,
    babyname VARCHAR(30),
    babyblood VARCHAR(10),
    PRIMARY KEY (babyid),
    FOREIGN KEY (pregid) REFERENCES Pregnancy (pregid)
);



CREATE TABLE InfoSession
(
    practitionerid VARCHAR(10) NOT NULL,
    infodate DATE NOT NULL,
    infotime TIME NOT NULL,
    lang VARCHAR(10) NOT NULL,
    PRIMARY KEY (practitionerid, infodate, infotime),
    FOREIGN KEY (practitionerid) REFERENCES Midwife (practitionerid)
);



CREATE TABLE Attend
(
    parentid VARCHAR(10) NOT NULL,
    practitionerid VARCHAR(10) NOT NULL,
    infodate DATE NOT NULL,
    infotime TIME NOT NULL,
    attended BOOLEAN NOT NULL,
    PRIMARY KEY (parentid, practitionerid, infodate, infotime),
    FOREIGN KEY (parentid) REFERENCES RegParent (parentid),
    FOREIGN KEY (practitionerid, infodate, infotime) REFERENCES InfoSession (practitionerid, infodate, infotime)
);



CREATE TABLE Notes
(
    apptid VARCHAR(10) NOT NULL,
    timestmp TIMESTAMP NOT NULL,
    content VARCHAR(50) NOT NULL,
    PRIMARY KEY (apptid, timestmp),
    FOREIGN KEY (apptid) REFERENCES Appointment (apptid)
);




