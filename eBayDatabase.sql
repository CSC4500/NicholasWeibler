DROP DATABASE IF EXISTS eBay;
CREATE DATABASE eBay;

USE eBay;

CREATE TABLE Employee
(
	Emp_ID          INT                NOT NULL UNIQUE		AUTO_INCREMENT,
    Emp_FName       CHAR(25)           NOT NULL,
    Emp_LName       CHAR(25)           NOT NULL,
    Emp_Type        CHAR(25)           NOT NULL,
    Emp_Schedule    CHAR(25)           NOT NULL,
    Emp_Email       VARCHAR(25)        NOT NULL,
    Emp_PhoneNum    INT                NOT NULL,
    CONSTRAINT      Emp_PK	           PRIMARY KEY( Emp_ID )
);

CREATE TABLE Supplier
(
	Supp_ID			INT 			  NOT NULL UNIQUE		AUTO_INCREMENT,
    Supp_Name		CHAR(25)		  NOT NULL,
    Supp_Address	VARCHAR(50)		  NOT NULL,
    Supp_Email		VARCHAR(25)		  NOT NULL,
    Supp_PhoneNum	INT 			  NOT NULL,
    Ship_Date		DATE 			  NOT NULL,
    Cost			DECIMAL(9,2) 	  NOT NULL,
    CONSTRAINT      Supp_PK	          PRIMARY KEY( Supp_ID )
);

CREATE TABLE Product
(
	Prod_ID			INT 			  NOT NULL UNIQUE,
    Prod_Name		CHAR(25)		  NOT NULL,
    Prod_Price		DECIMAL(9,2)	  NOT NULL,
    Supp_ID			INT 		      NOT NULL,
    Prod_Brand      CHAR(25)		  NOT NULL,
    Prod_Category   CHAR(25)		  NOT NULL,
    Prod_Qty		INT				  NOT NULL,
    CONSTRAINT      Prod_PK    	      PRIMARY KEY( Prod_ID ),
	CONSTRAINT      Prod_Supp_FK      FOREIGN KEY( Supp_ID ) 
					REFERENCES        Supplier( Supp_ID) 
);

CREATE TABLE Orders
(
	Order_Num		INT 			  NOT NULL UNIQUE		AUTO_INCREMENT,
    Prod_ID			INT 			  NOT NULL,
    Order_Date 		DATE 			  NOT NULL,
    Order_Time		TIME 			  NOT NULL,
    Order_Qty		INT				  NOT NULL,
    Order_Price		DECIMAL(9,2)	  NOT NULL,
    CONSTRAINT      Orders_PK	      PRIMARY KEY( Order_Num ),
	CONSTRAINT      Orders_Prod_FK    FOREIGN KEY( Prod_ID ) 
					REFERENCES        Product( Prod_ID)    
);
CREATE TABLE Customer
(
	Cust_ID			INT                NOT NULL UNIQUE		AUTO_INCREMENT,
    Cust_LName      CHAR(25)           NOT NULL,
    Cust_FName		CHAR(25)		   NOT NULL,
    Cust_Email		VARCHAR(25)		   NOT NULL,
    Cust_Address    VARCHAR(50)		   NOT NULL,
    Cust_Username   CHAR(25)           NOT NULL,
    Order_Num       INT 			   NOT NULL,
    CONSTRAINT      Cust_PK	           PRIMARY KEY( Cust_ID ),
	CONSTRAINT      Cust_Order_FK      FOREIGN KEY( Order_Num ) 
					REFERENCES         Orders( Order_Num )    
);

CREATE TABLE Store
(
	Store_ID        INT            UNIQUE NOT NULL,
	Cust_ID         INT            UNIQUE NOT NULL,
	Emp_ID          INT            UNIQUE NOT NULL,
	Supp_ID         INT            UNIQUE NOT NULL,
    CONSTRAINT      Store_PK	   PRIMARY KEY( Store_ID ),
    CONSTRAINT      Store_Cust_FK  FOREIGN KEY( Cust_ID ) 
					REFERENCES     Customer( Cust_ID),
    CONSTRAINT      Store_Emp_FK   FOREIGN KEY( Emp_ID ) 
					REFERENCES     Employee( Emp_ID),
    CONSTRAINT      Store_Supp_FK  FOREIGN KEY( Supp_ID ) 
					REFERENCES     Supplier( Supp_ID)    
);
    