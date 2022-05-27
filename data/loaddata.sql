-- Include your INSERT SQL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the INSERT statements for the tables with foreign key references
--    ONLY AFTER the parent tables!

-- This is only an example of how you add INSERT statements to this file.
--   You may remove it.
INSERT INTO MYTEST01 (id, value) VALUES(4, 1300);
-- A more complex syntax that saves you typing effort.
INSERT INTO MYTEST01 (id, value) VALUES
 (7, 5144)
,(3, 73423)
,(6, -1222)
;




--Institution
INSERT INTO Institution (instid,instname,instaddr,instphonenum,instemail,instwebsite) VALUES
                                                                                          ('i1b-537366','11premier bcenter','4014 Crest Line Terrace','+1 (619) 920-3693','premierbcenter0@google.com.au','http://google.it/ped'),
                                                                                          ('i2b-281699','W Birth Center','99163 Stardew Valley','+0 (735) 257-0014','wbirthcenter@hexun.com','http://symantec.com'),
                                                                                          ('i3b-786460','popular preg-birth center','756 Kropf Avenue','+62 (705) 321-5876','poppreg@buzzfeed.com','https://sun.com/cum/sociis'),
                                                                                          ('i4b-353510','mybaby bcenter','8 Sugar Terrace','+86 (343) 358-2520','mybabybcenter@addtoany.com','http://dell.com'),
                                                                                          ('i5b-699001','prettybabies bcenter','809 Hintze Point','+62 (610) 438-1583','prettybabies@eepurl.com','https://yolasite.com'),
                                                                                          ('i6c-578396','harmony-community clin','5952 Everett Rue','+62 (111) 910-2632','harmonyclin@wordpress.com','http://fivee.la'),
                                                                                          ('i7c-686701','happy-preg clin','014 Hanover Boul','+86 (912) 665-8676','happypregclin@illinois.edu','https://xing.com/sit/ame'),
                                                                                          ('i8c-949287','goood-comm clinn','169 Prairieview Alley','+52 (294) 871-9779','gooodcommclinn@xing.com','https://miitbeian.gov.cn/gravi'),
                                                                                          ('i9c-567273','quartier clin','9991 Butternut Center','+60 (250) 886-6420','quartierclin@theatlantic.com','https://friendfeed.com'),
                                                                                          ('i10c-60503','Lac-Saint-Louis','4 Lerdahl Avenue','+86 (806) 875-0335','lacsaintlouis@senate.gov','http://qq.com')
;


--Midwife
INSERT INTO Midwife (practitionerid,mwfname,mwfemail,mwfphonenum,instid) VALUES
                                                                             ('mw1a-24428','Airry','airry1@tiny.cc','+52 (296) 211-2749','i10c-60503'),
                                                                             ('mw2a-51586','Benny','benny2@biglobe.ne.jp','+86 (600) 695-1278','i10c-60503'),
                                                                             ('mw3a-19614','Cindy','cindy3@npr.org','+28 (295) 968-7360','i10c-60503'),
                                                                             ('mw4a-47220','Debby','debby4@bbc.co.uk','+46 (603) 307-2122','i10c-60503'),
                                                                             ('mw5a-03860','Emily','emily5@amazon.co.uk','+1 (336) 721-8926','i3b-786460'),
                                                                             ('mw6a-56690','Marion Girard','mgirard6@blogs.com','+59 (900) 700-0421','i10c-60503'),
                                                                             ('mw7a-75704','Gigi','gigi7@reuters.com','+86 (606) 314-8894','i3b-786460'),
                                                                             ('mw8a-84122','Hillary','hillary8@dailymail.co.uk','+1 (814) 959-0534','i7c-686701'),
                                                                             ('mw9a-29524','Fessy','fessy9@gmaail.com','+52 (188) 288-8866','i7c-686701')
;


--Mother
INSERT INTO Mother (mcardid,expbirthframe,mname,mbirth,maddr,mphonenum,memail,mprof,mblood) VALUES
                                                                                                ('m1c-597704','2022-07','Miranda','1991-01-19','66287 Crest Line Way','+55 (719) 913-7822','miranda@myspace.com','Cost Accountant',''),
                                                                                                ('m2c-317227','2022-11','Mia','1992-02-21','10692 Oriole Parkway','+373 (563) 906-9118','mia@irs.gov','Mechanical Systems Engineer','B'),
                                                                                                ('m3c-116798','2022-05','Molly','1993-03-11','6742 Mesta Lane','+62 (807) 823-8721','molly@ehow.com','Professor','A'),
                                                                                                ('m4c-765800','2021-02','Mary','1994-04-01','78 6th Junction','+20 (140) 606-7020','mary@hc360.com','Research Associate','O'),
                                                                                                ('m5c-015597','2022-06','Maria','1995-06-02','106 Arapahoe Avenue','+234 (465) 310-5903','maria@nsw.gov.au','Operator','AB'),
                                                                                                ('m6c-682102','2022-07','Victoria Gutierrez','1996-05-28','9 Kedzie Terrace','+255 (160) 212-2513','victoriag@cargocollective.com','VP Marketing','O')
;


--Father
INSERT INTO Father (fatherid,fname,fbirth,fphonenum,fprof,fcardid,faddr,femail,fblood) VALUES
                                                                                           ('f1a-420029','Frank','1981-01-27','+86 (615) 400-6419','Web Designer III','f1c-425122','398 Holy Crosse Circle','frank@google.nl','AB'),
                                                                                           ('f2a-190860','Fred','1982-02-09','+46 (113) 415-0855','Computer Systems Analyst II','f2c-248033','20594 Cherokee Place','fred@tuttocitta.it','A'),
                                                                                           ('f3a-663105','Finnick','1983-03-03','+33 (964) 777-4929','Structural Engineer','f3c-687008','774 High Crossing Passe','finnick@skype.com','O'),
                                                                                           ('f4a-494921','Fontan','1984-04-18','+7 (492) 618-3405','Sales Representative','','','',''),
                                                                                           ('f5a-390764','Flan','1985-05-14','+62 (454) 753-8596','Accounting Assistant I','f5c-801626','48 Dawn Terrace','flan@scribd.com','B')
;


--RegParent
INSERT INTO RegParent (parentid,mcardid,fatherid) VALUES
                                                      ('pt1a-62247','m1c-597704','f1a-420029'),
                                                      ('pt2a-23154','m2c-317227','f2a-190860'),
                                                      ('pt3a-59660','m3c-116798','f3a-663105'),
                                                      ('pt4a-15881','m4c-765800','f4a-494921'),
                                                      ('pt5a-03590','m5c-015597','f5a-390764'),
                                                      ('pt6a-39023','m6c-682102','f5a-390764')
;

--Pregnancy
INSERT INTO Pregnancy (pregid,interested,pregnumtime,parentid,instid,primary_pracid,backup_pracid,fir_duedate,sec_duedate,final_duedate,birthlocation,babynum) VALUES
                                                                                                                                                                   ('pg1a-56242',TRUE,1,'pt1a-62247','i10c-60503','mw2a-51586','mw3a-19614','2022-07-28','2022-08-03','2022-07-30','11premier bcenter',2),
                                                                                                                                                                   ('pg2a-20836',TRUE,1,'pt2a-23154','i10c-60503','mw1a-24428',NULL,'2022-11-12','2022-11-16',NULL,'',1),
                                                                                                                                                                   ('pg3a-42001',TRUE,1,'pt3a-59660','i10c-60503','mw4a-47220','mw6a-56690','2022-05-16','2022-05-20','2022-05-21','W Birth Center',2),
                                                                                                                                                                   ('pg4a-71915',TRUE,1,'pt4a-15881','i10c-60503','mw6a-56690','mw2a-51586','2022-07-02','2022-07-05','2022-07-09','mybaby bcenter',2),
                                                                                                                                                                   ('pg5a-63061',TRUE,1,'pt6a-39023','i3b-786460','mw5a-03860','mw7a-75704','2021-02-20','2021-02-13','2021-02-13','popular preg-birth center',1),
                                                                                                                                                                   ('pg6a-52098',TRUE,2,'pt6a-39023','i7c-686701','mw8a-84122','mw9a-29524','2022-07-30','2022-08-01',NULL,'',2)
;


--Appointment
INSERT INTO Appointment (apptid,apptdate,appttime,practitionerid,pregid) VALUES
                                                                             ('ap1-13690','2022-03-24','14:30:00','mw2a-51586','pg1a-56242'),
                                                                             ('ap2-27788','2022-03-21','14:15:00','mw1a-24428','pg2a-20836'),
                                                                             ('ap3-41771','2022-03-21','15:45:00','mw6a-56690','pg3a-42001'),
                                                                             ('ap4-20301','2022-03-25','16:30:00','mw6a-56690','pg3a-42001'),
                                                                             ('ap5-90482','2022-03-22','09:40:00','mw6a-56690','pg4a-71915'),
                                                                             ('ap6-71005','2022-02-20','10:16:00','mw9a-29524','pg6a-52098'),
                                                                             ('ap7-90781','2022-03-23','11:35:00','mw8a-84122','pg6a-52098'),
                                                                             ('ap8-07634','2022-04-22','10:02:00','mw8a-84122','pg6a-52098')
;


--Technician
INSERT INTO Technician (techid,techname,techphonenum) VALUES
                                                          ('tec1-58809','Tim','+90 (269) 684-1154'),
                                                          ('tec2-72001','Tiffany','+86 (898) 205-1932'),
                                                          ('tec3-29465','Tracy','+63 (921) 661-1852'),
                                                          ('tec4-62802','Terry','+54 (269) 874-6626'),
                                                          ('tec5-16590','Tommie','+86 (836) 497-9493')
;


--MedActions
INSERT INTO MedActions (testid,apptid,testtype,prescrdate,sampledate,techid,result,labdate) VALUES
                                                                                                ('tst1-89612','ap6-71005','blood iron','2022-02-20','2022-02-20','tec1-58809','20220223bloodironlevel high','2022-02-23'),
                                                                                                ('tst2-30213','ap1-13690','ultrasound','2022-03-24',NULL,NULL,'',NULL),
                                                                                                ('tst3-85290','ap3-41771','blood iron','2022-03-21','2022-03-21','tec2-72001','20220312bloodiron normal','2022-03-22'),
                                                                                                ('tst4-68788','ap7-90781','blood iron','2022-03-23','2021-03-23','tec3-29465','20220325bloodironlevel normal','2022-03-25'),
                                                                                                ('tst5-42961','ap2-27788','bloodtype','2022-03-21','2022-03-21','tec4-62802','20220322bloodtype A','2022-03-22'),
                                                                                                ('tst6-36987','ap8-07634','blood iron','2022-04-22','2022-04-22','tec5-16590','20220422bloodironlevel low','2022-04-25')
;


--Clinic
INSERT INTO Clinic (instid) VALUES
                                ('i6c-578396'),
                                ('i7c-686701'),
                                ('i8c-949287'),
                                ('i9c-567273'),
                                ('i10c-60503')
;

--BirthCenter
INSERT INTO BirthCenter (instid) VALUES
                                     ('i1b-537366'),
                                     ('i2b-281699'),
                                     ('i3b-786460'),
                                     ('i4b-353510'),
                                     ('i5b-699001')
;


--Baby
INSERT INTO Baby (babyid,pregid,babygender,babybdate,babybtime,babyname,babyblood) VALUES
                                                                                       ('b1a-502512','pg1a-56242','Female',NULL,NULL,'Brandy','O'),
                                                                                       ('b2a-184434','pg2a-20836','',NULL,NULL,'',''),
                                                                                       ('b3a-684370','pg3a-42001','Male',NULL,NULL,'Bob','AB'),
                                                                                       ('b4a-548683','pg3a-42001','Female',NULL,NULL,'Bea','B'),
                                                                                       ('b5a-330429','pg4a-71915','Male',NULL,NULL,'Billy','A'),
                                                                                       ('b6a-823263','pg4a-71915','Male',NULL,NULL,'Boris','AB'),
                                                                                       ('b7a-372056','pg5a-63061','Male','2021-02-11','6:59:50','Brad','O'),
                                                                                       ('b8a-636291','pg1a-56242','Female',NULL,NULL,'Betty','O'),
                                                                                       ('b9a-138970','pg6a-52098','Female',NULL,NULL,'','A'),
                                                                                       ('b10a-03632','pg6a-52098','Male',NULL,NULL,'','AB')
;


--InfoSession
INSERT INTO InfoSession (practitionerid,infodate,infotime,lang) VALUES
                                                                    ('mw2a-51586','2021-12-20','10:30:00','Chinese'),
                                                                    ('mw3a-19614','2021-12-20','10:30:00','English'),
                                                                    ('mw4a-47220','2021-12-20','10:30:00','French'),
                                                                    ('mw7a-75704','2022-02-05','09:30:00','English'),
                                                                    ('mw8a-84122','2021-10-18','15:10:00','French')
;


--Attend
INSERT INTO Attend (parentid,practitionerid,infodate,infotime,attended) VALUES
                                                                            ('pt1a-62247','mw2a-51586','2021-12-20','10:30:00',TRUE),
                                                                            ('pt6a-39023','mw3a-19614','2021-12-20','10:30:00',TRUE),
                                                                            ('pt3a-59660','mw4a-47220','2021-12-20','10:30:00',TRUE),
                                                                            ('pt2a-23154','mw7a-75704','2022-02-05','09:30:00',TRUE),
                                                                            ('pt4a-15881','mw8a-84122','2021-10-18','15:10:00',TRUE)
;


--Notes
INSERT INTO Notes (apptid,timestmp,content) VALUES
                                                ('ap1-13690','2022-03-24-14.21.35.000000000','20220310 Prescribed ultrasound.'),
                                                ('ap5-90482','2022-03-22-10.02.43.000000000','20220322Healthy. Instruction: take more Vc'),
                                                ('ap6-71005','2022-02-20-10.38.57.000000000','20220220Healthy. Prescribed blood iron test.'),
                                                ('ap7-90781','2022-03-23-11.56.37.000000000','20220323Healthy. Prescribed blood iron test.'),
                                                ('ap8-07634','2022-04-22-10.40.55.000000000','20220422Healthy. Prescribed blood iron test.')
;



