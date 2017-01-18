
/* =====Create the database==== */
CREATE DATABASE Project_Team_Soutik_Kushagra_Final;

/* Use the database */
USE Project_Team_Soutik_Kushagra_Final;

/* ====Create all the tables==== */

/* Accounts and related tables */
CREATE TABLE dbo.Accounts
(AccountID varchar(50) NOT NULL PRIMARY KEY ,    
BranchID varchar(50) NOT NULL,
CustomerID varchar(50) NOT NULL,
TypeID varchar(50) NOT NULL,
Balance int,
Rate int,
Stat varchar(50),
CONSTRAINT Chk_Rate CHECK (Rate >= 0)); /*Constraint Checks*/


CREATE TABLE dbo.BankBranch
(BranchID varchar(50) NOT NULL PRIMARY KEY,
Country varchar(50) NOT NULL,
City varchar(50) NOT NULL,
Phone bigint NOT NULL,
ManagerID varchar(50));


CREATE TABLE dbo.AccountType
(TypeID varchar(50) NOT NULL PRIMARY KEY,
TypeName varchar(50),
Descr varchar(50),
RateRange varchar(50));


CREATE TABLE dbo.Customers
(CustomerID varchar(50) NOT NULL PRIMARY KEY,
PID varchar(50) NOT NULL,
CompanyID varchar(50) NOT NULL,
CustomerType varchar(50));


CREATE TABLE dbo.Companies
(CompanyID varchar(50) NOT NULL PRIMARY KEY,
CompanyName varchar(50),
Phone bigint,
Email varchar(50),
CONSTRAINT Chk_Phone CHECK (Phone != 0));  /*Constraint Checks*/


/* Transactions and related tables */
CREATE TABLE dbo.Transactions
(AccountID varchar(50) NOT NULL
	REFERENCES dbo.Accounts(AccountID),    
TransactionID varchar(50) NOT NULL,
DateNTime datetime NOT NULL,
TransactionType varchar(50),
LoanID varchar(50),
EmployeeID varchar(50) NOT NULL,
CONSTRAINT AccTrans PRIMARY KEY CLUSTERED               
(AccountID, TransactionID));


CREATE TABLE dbo.TransactionType
(TransactionID varchar(50) NOT NULL PRIMARY KEY,
TransactionName varchar(50) NOT NULL,
Descr varchar(50));


CREATE TABLE dbo.Loans
(LoanID varchar(50) NOT NULL PRIMARY KEY,
DurationByMonth int NOT NULL,
StartDate DateTime NOT NULL,
InterestRate int NOT NULL);


/* Employees and related tables */
CREATE TABLE dbo.Employees
(EmployeeID varchar(50) NOT NULL PRIMARY KEY,
BranchID varchar(50) NOT NULL,
TitleID varchar(50) NOT NULL,
DepartmentID varchar(50) NOT NULL,
ManagerID varchar(50),
Salary int NOT NULL,
Pwd varchar(50) NOT NULL,
Lvl varchar(50),
PID varchar(50) NOT NULL,
EmailID varchar(50) NOT NULL,
MonthlySalary AS Salary/12);   /* Computed Column*/


CREATE TABLE dbo.Deparments
(DepartmentID varchar(50) NOT NULL PRIMARY KEY,
DeparmentName varchar(50),
HeadOfDept varchar(50));



CREATE TABLE dbo.JobTitles
(TitleID varchar(50) NOT NULL PRIMARY KEY,
TitleName varchar(50),
TitleDesc varchar(50));



CREATE TABLE dbo.EmailTracking
(EmailID varchar(50) NOT NULL PRIMARY KEY,
EmployeeID varchar(50) NOT NULL
	REFERENCES dbo.Employees(EmployeeID),
SendID varchar(50),
RecievedID varchar(50),
Read1 bit);


CREATE TABLE dbo.Email
(EmailID varchar(50) NOT NULL PRIMARY KEY
	REFERENCES dbo.EmailTracking(EmailID),
SendID varchar(50) NOT NULL,
ReceiveID varchar(50) NOT NULL,
Title varchar(50),
Body varchar(50));


CREATE TABLE dbo.Persons
(PID varchar(50) NOT NULL PRIMARY KEY,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Addr varchar(50),
Email varchar(50),
Phone bigint,
Mobile varchar(50));





/* ====Inserting data into the tables==== */
INSERT INTO dbo.Accounts (AccountID, BranchID, CustomerID, TypeID, Balance, Rate, Stat) values 
('54K6RNTAIM',	'3QDGAY6K8S', 	'zb9ahyzu6z',	'I5V',	278552,	0,	'Open'),
('N57SG5XDSJ',	'2P4ANJZMAG', 	'w2k4cd8v6k', 	'WTO',	276516,	1,	'Open'),
('5S2HN9DY8B',	'GQQEWTUGR9',	'qzqzk9z8vw',	'LB5',	135746,	1,	'Open'),
('86JK7ONW28',	'9L266NQ8Y1',	'60r3n3jedd',	'VF1',	328542,	2,	'Open'),
('RR7XGXZJGI',	'LCYPL52KNO',	'0z11w9ko5z',	'S5X',	90557,	0,	'Open'),
('9GU6EHRARD',	'3QDGAY6K8S',	'xe2abockln',	'0C6',	204931,	0,	'Open'),
('WV63XKPWV1',	'2P4ANJZMAG',	'qp2gebul0g',	'E0Y',	431453,	0,	'Open'),
('534L5BQEFP',	'GQQEWTUGR9',	'bhew8pcpze',	'0T2',	418937,	1,	'Open'),
('UUSN84O2LR',	'9L266NQ8Y1',	'v5zkrjarvz',	'31E',	302457,	2,	'Open'),
('6MEC8BNK4S',	'LCYPL52KNO',	'qdhw0rxyat',	'KKR',	126832,	3,	'Open'),
('N5RTTGCU0W',	'79TWETZECB',	'ictb4ry6m3',	'I5V',	50141,	0,	'Closed'),
('T3EM3VBQ15',	'B5XABFD68H',	'nmlpdyamzl',	'WTO',	440269,	1,	'Open'),
('ODMX4WXUIW',	'TZY26R9L3U',	'six567ebuc',	'LB5',	426089,	1,	'Open'),
('NE5AEXBFS2',	'35KPY4XMIE',	'hsfxlppztu',	'VF1',	67404,	2,	'Open'),
('9W1V5M8B9S',	'44R0NTJHWE',	'rgg0tht7rp',	'S5X',	157336,	0,	'Open'),
('ETCQ4F2AVR',	'TIR0B77TKW',	'10qfonugkf',	'0C6',	148476,	0,	'Open'),
('5W0RRM2W56',	'PRGLPJP1NP',	'iedvxfjapp',	'E0Y',	110994,	0,	'Open'),
('YVE20J1IS5',	'6867PB5CDH',	'zarceqbjcu',	'0T2',	326176,	1,	'Open'),
('0ASVQLBX3K',	'D5RCFMKQS7',	'swu65aqv56',	'31E',	399899,	2,	'Open'),
('P6FN99HSJM',	'N1FBBIO4R6',	'gy258hgkia',	'KKR',	466295,	3,	'Open');



INSERT INTO dbo.BankBranch (BranchID, Country, City, Phone, ManagerID) values
('3QDGAY6K8S',	'USA',		'San Francisco',	7237888587,	'v8mufhbeaw'),
('2P4ANJZMAG',	'USA',		'New York',			4084228399,	'1owts6e1dz'),
('GQQEWTUGR9',	'Canada',	'Torronto',			7447269138,	'5getr7rgu6'),
('9L266NQ8Y1',	'USA',		'Seattle',			9309073606,	'y77864v0g6'),
('LCYPL52KNO',	'USA',		'Portland',			6887622908,	'u3l2lk8net'),
('79TWETZECB',	'USA',		'Los Angeles',		8532983281,	'lz20k3xrqw'),
('B5XABFD68H',	'Canada',	'Vancover BC',		6878052162,	'24zsj4pgkb'),
('TZY26R9L3U',	'USA',		'New Jersey',		2501212931,	'hbp0jnfles'),
('35KPY4XMIE',	'Canada',	'Ottawa',			1753478560,	'wt5iz6xi1p'),
('44R0NTJHWE',	'USA',		'Bloomington',		7649125406,	'8lwtkui7kz'),
('TIR0B77TKW',	'USA',		'Chicago',			4914374254,	'4brqfc6wrd'),
('PRGLPJP1NP',	'USA',		'Pittsburg',		7140946170,	'9d6q88aeqj'),
('6867PB5CDH',	'Canada',	'Edmonton',			7309037893,	'9lbrj8p5y6'),
('D5RCFMKQS7',	'USA',		'Atlanta',			7447411119,	'ovd7wb3pem'),
('N1FBBIO4R6',	'USA',		'Bellevue',			3274779780,	'yn1sv1n0qe');


INSERT INTO dbo.AccountType(TypeID, TypeName, Descr, RateRange) values
('I5V',	'Current Basic',			'Basic Current Account',			'0'),
('WTO',	'Current Choice',			'Current account with interest',	'1-2'),
('LB5',	'Savings Basic',			'Basic Savings account',			'1-1.5'),
('VF1',	'Savings Choicev',			'Savings account with interest',	'1-3'),
('S5X',	'Checking College',			'College Checking Account',			'0'),
('0C6',	'Checking Business',			'Business Checking Account',		'0'),
('E0Y',	'Savings College',			'College Savings Account',			'0'),
('0T2',	'Savings Business',			'Business Savings Account',			'1-2'),
('31E',	'Corporate Corporate Account','',									'1-3'),
('KKR',	'Salary Only for Salary Direct Deposit',		'',				'2-3');



INSERT INTO dbo.Customers (CustomerID, PID, CompanyID, CustomerType) values
('zb9ahyzu6z',	'V0TBRUXH6',	'IIPNMAY46',	'Regular'),
('w2k4cd8v6k',	'VOJ0TPZDK',	'V0ZGME6DA',	'Regular'),
('qzqzk9z8vw',	'C5VUOCD38',	'APOXTYRHE',	'Regular'),
('60r3n3jedd',	'6VQJD8CC7',	'B40I308IQ',	'Regular'),
('0z11w9ko5z',	'2YSX2P6BS',	'81KM5LSHG',	'Regular'),
('xe2abockln',	'NU1R4952C',	'50ITL7F56',	'Premium'),
('qp2gebul0g',	'76M7TP2WG',	'JA4DY0M0Z',	'Regular'),
('bhew8pcpze',	'RIG7HL3Q0',	'FCA56E3BU',	'Regular'),
('v5zkrjarvz',	'GKMVGMK6M',	'IPF6RKUGH',	'Regular'),
('qdhw0rxyat',	'MUWCTG34C',	'GY5P29GCR',	'Regular'),
('ictb4ry6m3',	'OJCC20W9Y',	'M544ZZLCN',	'Premium'),
('nmlpdyamzl',	'YLV6Q0E3A',	'50ITL7F56',	'Regular'),
('six567ebuc',	'XP30FAZT8',	'JA4DY0M0Z',	'Regular'),
('hsfxlppztu',	'SXZIM1DN9',	'YCI0LTK1N',	'Regular'),
('rgg0tht7rp',	'8VLR6DRQY',	'EGTE9K8YK',	'Regular'),
('10qfonugkf',	'3SIBU6JT2',	'APOXTYRHE',	'Regular'),
('iedvxfjapp',	'X0O7UHFSE',	'B40I308IQ',	'Regular'),
('zarceqbjcu',	'NAX8L0TT5',	'81KM5LSHG',	'Regular'),
('swu65aqv56',	'63N0CHLEO',	'EOFXJ239T',	'Premium'),
('gy258hgkia',	'TRC20UEKD',	'QR07KZZ3M',	'Regular');


INSERT INTO dbo.Companies (CompanyID, CompanyName, Phone, Email) values
('IIPNMAY46',	'Apple',			8207952957,	'Apple@Apple.com'),
('V0ZGME6DA',	'Google',			3802381884,	'Google@Google.com'),
('APOXTYRHE',	'Microsoft',		9638623950,	'Microsoft@Microsoft.com'),
('B40I308IQ',	'John Deere',		2385355046,	'John Deere@John Deere.com'),
('81KM5LSHG',	'Payoff',			9894720180,	'Payoff@Payoff.com'),
('50ITL7F56',	'CreditKarma',		7492767762,	'CreditKarma@CreditKarma.com'),
('JA4DY0M0Z',	'MorganStanley',	4353266393,	'MorganStanley@MorganStanley.com'),
('FCA56E3BU',	'JPMorgan',			1844339395,	'JPMorgan@JPMorgan.com'),
('IPF6RKUGH',	'SnapChat',			8754178788,	'SnapChat@SnapChat.com'),
('GY5P29GCR',	'Facebook',			5857304091,	'Facebook@Facebook.com'),
('M544ZZLCN',	'Twitter',			1291520819,	'Twitter@Twitter.com'),
('YCI0LTK1N',	'Paccar',			3249782838,	'Paccar@Paccar.com'),
('EGTE9K8YK',	'Amazon',			1308461045,	'Amazon@Amazon.com'),
('EOFXJ239T',	'Nest',				1464201633,	'Nest@Nest.com'),
('QR07KZZ3M',	'Samsung',			7695266500,	'Samsung@Samsung.com');


INSERT INTO dbo.Transactions (AccountID, TransactionID, DateNTime, TransactionType, LoanID, EmployeeID) values
('54K6RNTAIM',	'DL6GF3LXVE',	'9/23/16',		'Withdraw',	'qujx3yw727',		'nsnu'),
('N57SG5XDSJ',	'3QBKIUYWH5',	'9/27/16',		'Deposit',	'NA',					'qvuov'),
('5S2HN9DY8B',	'UWVISYVUV8',	'10/6/16',		'Withdraw',	'7w4kwb8dh4',		'9gvk9'),
('86JK7ONW28',	'7SDHVWLD6V',	'10/14/16',		'Withdraw',	'NA',					'1dxx1'),
('RR7XGXZJGI',	'MUF65S3DAW',	'10/25/16',		'Withdraw',	'NA',					'r5ygr'),
('9GU6EHRARD',	'LBEFI5NOHI',	'11/3/16',		'Withdraw',	'NA',					'vw8ix'),
('WV63XKPWV1',	'0PF1TMQR8Q',	'11/18/16',		'Deposit',	'NA',					'hrtuu'),
('UUSN84O2LR',	'SNAMMNAJ2D',	'11/21/16',		'Withdraw',	'gqlom720r9',		't5bf1'),
('534L5BQEFP',	'5S4KSNPZ0Z',	'11/28/16',		'Deposit',	'NA',					'oa3xb'),
('6MEC8BNK4S',	'WVOT2XX46X',	'11/29/16',		'Withdraw',	'NA',					'lwspv'),
('NE5AEXBFS2',	'GUWBKGT2GV',	'12/12/16',		'Withdraw',	'NA',					'9gvk9'),
('N5RTTGCU0W',	'51CPST5ABE',	'12/13/16',		'Withdraw',	'NA',					'1dxx1'),
('T3EM3VBQ15',	'24UKAR41SU',	'12/15/16',		'Deposit',	'NA',					'r5ygr'),
('ODMX4WXUIW',	'VJHEVNBP70',	'12/16/16',		'Withdraw',	'9ge019knbl',		'vw8ix');



INSERT INTO dbo.Loans (LoanID, DurationByMonth, StartDate, InterestRate) values
('qujx3yw727',	36,	'7/6/16',		5),
('7w4kwb8dh4',	24,	'7/21/16',		4),
('gqlom720r9',	48,	'8/5/16',		7),
('9ge019knbl',	24,	'9/28/16',		2),
('ympjvo2h67',	48,	'10/10/16',		4),
('5dhdd6wheq',	24,	'10/21/16',		5),
('u11md5ib4o',	48,	'10/26/16',		4),
('cls4ds6eh7',	36,	'11/24/16',		7),
('2ndrh7yi2p',	24,	'11/30/16',		5),
('4hfy8ay0z7',	48,	'12/22/16',		3),
('NA', 			0,   '1/1/15', 		1);


INSERT INTO dbo.TransactionType (TransactionID, TransactionName, Descr) values
('DL6GF3LXVE',	'Withdraw Personal',	'Personal Withdrawal'),
('3QBKIUYWH5',	'Deposit Personal',		''),
('UWVISYVUV8',	'Withdraw Personal',	'Personal Withdrawal'),
('7SDHVWLD6V',	'Withdraw Personal',	'Personal Withdrawal'),
('MUF65S3DAW',	'Withdraw Business',	''),
('LBEFI5NOHI',	'Withdraw Business',	''),
('0PF1TMQR8Q',	'Deposit Personal',		''),
('SNAMMNAJ2D',	'Withdraw Personal',	'Personal Withdrawal'),
('5S4KSNPZ0Z',	'Deposit Personal',		''),
('WVOT2XX46X',	'Withdraw Personal',	'Personal Withdrawal'),
('GUWBKGT2GV',	'Withdraw Personal',	'Personal Withdrawal'),
('51CPST5ABE',	'Withdraw Personal',	'Personal Withdrawal'),
('24UKAR41SU',	'Deposit Personal',		''),
('VJHEVNBP70',	'Withdraw Personal',	'Personal Withdrawal');


INSERT INTO dbo.Employees (EmployeeID, BranchID, TitleID, DepartmentID, ManagerID, Salary, Pwd, Lvl, PID, EmailID) values
('nsnu',	'3QDGAY6K8S',	'MNBJ',	'MERCAC',	'MERCAC',	75000,	'afgdzg',		'II',	'PTH7B51W',	'John@bank.com'),
('qvuov',	'LCYPL52KNO',	'GCAC',	'ZOAZGY',	'ZOAZGY', 	60000,	'zdfgzdfg',		'II',	'I6IWGEGW',	'Mario@bank.com'),
('9gvk9',	'79TWETZECB',	'QEYA',	'HDIHUJ',	'HDIHUJ',	45000,	'zdfgdzg',		'I',	'5A96UE0E',	'Ted@bank.com'),
('1dxx1',	'B5XABFD68H',	'UIQB',	'URYFFC',	'URYFFC',	50000,	'zerw',			'I',	'5JGO0D8L',	'Divya@bank.com'),
('r5ygr',	'LCYPL52KNO',	'WNNZ',	'KNGKCO',	'KNGKCO',	55000,	'wetrydfh',		'I',	'BGII0O70',	'Shreya@bank.com'),
('vw8ix',	'79TWETZECB',	'PAJN',	'LMTRTB',	'LMTRTB',	87000,	'zdyerfsg',		'II',	'1SC2KLXB',	'Abhishek@bank.com'),
('hrtuu',	'B5XABFD68H',	'RSZO',	'ZZRDPM',	'ZZRDPM',	150000,	'dzfhert',		'III',	'MCHKKPW3',	'Colin@bank.com'),
('t5bf1',	'TZY26R9L3U',	'HTLC',	'IJQKAH',	'IJQKAH',	132000,	'zfgsdfw',		'III',	'YPR1JCSX',	'Leon@bank.com'),
('oa3xb',	'LCYPL52KNO',	'MQUN',	'EPPMJE',	'EPPMJE',	54000,	'wertdsg',		'I',	'J6NWR8HM',	'Aston@bank.com'),
('lwspv',	'79TWETZECB',	'LOHC',	'ZFCMQT',	'ZFCMQT',	80000,	'serqer',		'II',	'S74EOURV',	'Martin@bank.com');


INSERT INTO dbo.Persons(PID, FirstName, LastName, Addr, Email, Phone, Mobile) values
('PTH7B51W',	'John',			'Lenon',		'NY',	'John@bank.com',		2498297180,	2498297180),
('I6IWGEGW',	'Mario',		'Gonzales',		'SF',	'Mario@bank.com',		2454957254,	2454957254),
('5A96UE0E',	'Ted',			'Cruz',			'LA',	'Ted@bank.com',			2575558396,	2575558396),
('5JGO0D8L',	'Divya',		'Kothari',		'LV',	'Divya@bank.com',		9359196804,	9359196804),
('BGII0O70',	'Shreya',		'Jain',			'SF',	'Shreya@bank.com',		1562907298,	1562907298),
('1SC2KLXB',	'Abhishek',		'Gupta',		'LA',	'Abhishek@bank.com',	8758116703,	8758116703),
('MCHKKPW3',	'Colin',		'Andre',		'SF',	'Colin@bank.com',		7279700717,	7279700717),
('YPR1JCSX',	'Leon',			'Juon',			'NY',	'Leon@bank.com',		8452619785,	8452619785),
('J6NWR8HM',	'Aston',		'Nu',			'NY',	'Aston@bank.com',		1208227321,	1208227321),
('S74EOURV',	'Martin',		'Jose',			'NY',	'Martin@bank.com',		8886812164,	8886812164),
('V0TBRUXH6',	'Dean',			'Ho',			'LA',	'Dean@gmail.com',		5167584155,	5167584155),
('VOJ0TPZDK', 	'Ajay',			'Kapoor',		'NY',	'Ajay@gmail.com',		4958520875,	4958520875),
('C5VUOCD38',	'Priya',		'Soman',		'NY',	'Priya@gmail.com',		7617556334,	7617556334),
('6VQJD8CC7',	'Nam',			'Jagasia',		'SF',	'Nam@gmail.com',		5854884102,	5854884102),
('2YSX2P6BS',	'Tom',			'Ridey',		'NY',	'Tom@gmail.com',		6022287568,	6022287568),
('NU1R4952C',	'Bon',			'Apetite',		'LA',	'Bon@gmail.com',		2588205369,	2588205369),
('76M7TP2WG',	'Huan',			'Xi',			'NY',	'Huan@gmail.com',		2734027040,	2734027040),
('RIG7HL3Q0',	'Austin',		'S',			'NY',	'Austin@gmail.com',		3644403625,	3644403625),
('GKMVGMK6M',	'Brock',		'Lesnar',		'SF',	'Brock@gmail.com',		9634640321,	9634640321),
('MUWCTG34C',	'Dwayne',		'Johnson',		'NY',	'Dwayne@gmail.com',		4427148917,	4427148917),
('OJCC20W9Y',	'Aditya',		'Kaul',			'SF',	'Aditya@gmail.com',		9930851010,	9930851010),
('YLV6Q0E3A',	'Amol',			'Surve',		'NY',	'Amol@gmail.com',		4519477522,	4519477522),
('XP30FAZT8',	'Steve',		'Jobs',			'LA',	'Steve@gmail.com',		7577636177,	7577636177),
('SXZIM1DN9',	'Jon',			'Lesnar',		'NY',	'Jon@gmail.com',		7176933478,	7176933478),
('8VLR6DRQY',	'Max',			'Carsen',		'SF',	'Max@gmail.com',		3080804797,	3080804797),
('3SIBU6JT2',	'Rex',			'Fernandez',	'LA',	'Rex@gmail.com',		5741632271,	5741632271),
('X0O7UHFSE',	'Lin',			'Fernando',		'NY',	'Lin@gmail.com',		9513788334,	9513788334),
('NAX8L0TT5',	'Zen',			'Zi',			'LA',	'Zen@gmail.com',		3165313396,	3165313396),
('63N0CHLEO',	'Peter',		'Pat',			'NY',	'Peter@gmail.com',		9044153590,	9044153590),
('TRC20UEKD',	'Patrick',		'Stuart',		'SF',	'Patrick@gmail.com',	7788397632,	7788397632);


INSERT INTO dbo.Deparments (DepartmentID, DeparmentName, HeadOfDept) values
('MERCAC',	'Finance',			'Tony Stark'),
('ZOAZGY',	'Software',			'Jon Doe'),
('HDIHUJ',	'Engineering',		'Black Widow'),
('URYFFC',	'Data Science',		'Tarzan'),
('KNGKCO',	'Front Desk',		'Mogli'),
('LMTRTB',	'Customer Service',	'Boyzone'),
('ZZRDPM',	'Staff',			'Mark Zukerburg'),
('IJQKAH',	'Human Resource',	'Stevey Wonder'),
('EPPMJE',	'Services',			'House'),
('ZFCMQT',	'Business',			'Hillary Clinton');


INSERT INTO dbo.JobTitles (TitleID, TitleName, TitleDesc) values
('MNBJ',	'Front Desk Officer',		'Officer at front desk'),
('GCAC',	'Data Scientist',			'Data science person'),
('QEYA',	'Finance Manager',			'Manager in finance dept'),
('UIQB',	'Customer Service', 		''),	
('WNNZ',	'Marketing',				'Marketing personel'),
('PAJN',	'Software Engg',			'Software Engineer person'),
('RSZO',	'Customer Service', 		''),
('HTLC',	'Customer Service', 		''),
('MQUN',	'Service',					''),
('LOHC',	'Software Engg',			'Software Engineer person');


INSERT INTO dbo.EmailTracking (EmailID, EmployeeID, SendID, RecievedID, Read1) values
('John@bank.com',		'nsnu',		'BD6EW',	'WH847',	1),
('Mario@bank.com',		'qvuov',	'NLR0Z',	'CRFTP',	1),
('Ted@bank.com',		'9gvk9',	'TW9N8',	'JI4LX',	0),
('Divya@bank.com',		'1dxx1',	'9NV69',	'VLVY9',	0),
('Shreya@bank.com',		'r5ygr',	'9N7OQ',	'ZSE7Z',	0),
('Abhishek@bank.com',	'vw8ix',	'8U2JA',	'57RP7',	1),
('Colin@bank.com',		'hrtuu',	'Y1NWH',	'KFQN4',	1),
('Leon@bank.com',		't5bf1',	'FPD8O',	'OFF4U',	1),
('Aston@bank.com',		'oa3xb',	'S3N98',	'V49X6',	1),
('Martin@bank.com',		'lwspv',	'6IOO0',	'9EHI3',	1);


INSERT INTO dbo.Email (EmailID, SendID, ReceiveID, Title, Body) values
('John@bank.com',		'BD6EW',	'WH847',	'Hi Hello',					'Hello Im good how are you?'),
('Mario@bank.com',		'NLR0Z',	'CRFTP',	'Where is the money?',		'Why don’t you send me the money?'),
('Ted@bank.com',		'TW9N8',	'JI4LX',	'Who is this?',				'I dont know'),
('Divya@bank.com',		'9NV69',	'VLVY9',	'Why dont you do work!',	'I got swag'),
('Shreya@bank.com',		'9N7OQ',	'ZSE7Z',	'Im good',					'Why don’t you send me the money?'),
('Abhishek@bank.com',	'8U2JA',	'57RP7',	'Got the money',			'Awww Yea'),
('Colin@bank.com',		'Y1NWH',	'KFQN4',	'Interview',				'Thanks'),
('Leon@bank.com',		'FPD8O',	'OFF4U',	'Im rich',					'Woo'),
('Aston@bank.com',		'S3N98',	'V49X6',	'Im broke',					'Damn'),
('Martin@bank.com',		'6IOO0',	'9EHI3',	'Money $$$',				'Why dont you send me the money?');




/* Creating all Foreign Key relations */

ALTER TABLE dbo.Accounts
ADD FOREIGN KEY (BranchID)
		REFERENCES dbo.BankBranch(BranchID),
	FOREIGN KEY (CustomerID)
		REFERENCES dbo.Customers(CustomerID),
	FOREIGN KEY (TypeID)
		REFERENCES dbo.AccountType(TypeID);


ALTER TABLE dbo.Customers
ADD FOREIGN KEY (PID)
		REFERENCES dbo.Persons(PID),
	FOREIGN KEY (CompanyID)
		REFERENCES dbo.Companies(CompanyID);


ALTER TABLE dbo.Transactions
ADD FOREIGN KEY (LoanID)
		REFERENCES dbo.Loans(LoanID),
	FOREIGN KEY (EmployeeID)
		REFERENCES dbo.Employees(EmployeeID);

ALTER TABLE dbo.Employees
ADD FOREIGN KEY (BranchID)
		REFERENCES dbo.BankBranch(BranchID),
	FOREIGN KEY (TitleID)
		REFERENCES dbo.JobTitles(TitleID),
	FOREIGN KEY (DepartmentID)
		REFERENCES dbo.Deparments(DepartmentID),
	FOREIGN KEY (PID)
		REFERENCES dbo.Persons(PID),
	FOREIGN KEY (EmailID)
		REFERENCES dbo.EmailTracking(EmailID);


ALTER TABLE dbo.EmailTracking
ADD FOREIGN KEY (EmployeeID)
	REFERENCES dbo.Employees(EmployeeID);


/* Creating Views */

CREATE VIEW HighBalanceManagers 
AS 
SELECT b.ManagerID, a.Balance
FROM dbo.BankBranch AS b
INNER JOIN dbo.Accounts AS a
ON b.BranchID = a.BranchID
WHERE a.Balance >= 400000;

CREATE VIEW SalaryBelow100k
AS
SELECT jt.TitleName, e.Salary
FROM dbo.Employees AS e
INNER JOIN dbo.JobTitles AS jt
ON jt.TitleID = e.TitleID
WHERE e.Salary <= 100000;