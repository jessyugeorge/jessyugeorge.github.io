--LIBRARY MANAGEMENT--

--CREATE TABLES--

CREATE TABLE Location(
locationID NUMBER NOT NULL ,
  address VARCHAR2(50),
  CONSTRAINT Location_PK PRIMARY KEY (locationID));
  
CREATE TABLE Card(
  cardID NUMBER,
  status VARCHAR2(1) CHECK ((status = 'A') OR (status = 'B')),
  fines NUMBER,
  CONSTRAINT Card_PK PRIMARY KEY (cardID));
  
CREATE TABLE Branch(
  branchID NUMBER,
  name VARCHAR2(40),
  locationID NUMBER,
  phone NUMBER(9),
  CONSTRAINT Branch_PK PRIMARY KEY (branchID),
  CONSTRAINT Branch_FK FOREIGN KEY (locationID) REFERENCES Location(locationID)
);
  
CREATE TABLE Book(
  bookID NUMBER,
  ISBN VARCHAR2(4),
  state VARCHAR2(10),
  avalability VARCHAR2(1) CHECK ((avalability = 'A') OR (avalability = 'O')),
  debyCost NUMBER(10,2),
  lostCost NUMBER(10,2),
  locationID NUMBER,
  CONSTRAINT Book_PK PRIMARY KEY (bookID),
  CONSTRAINT Book_FK FOREIGN KEY (locationID)REFERENCES Location(locationID)
);

CREATE TABLE Rent(
rentID NUMBER,
  cardID NUMBER,
  bookID NUMBER,
  apporpriationDate DATE,
  returnDate DATE,
  CONSTRAINT Rent_PK PRIMARY KEY (rentID),
  CONSTRAINT Rent_FK_Card FOREIGN KEY (cardID) REFERENCES Card(cardID),
  CONSTRAINT Rent_FK_book FOREIGN KEY (bookID) REFERENCES Book(bookID)
);
  
CREATE TABLE Customer(
  customerID NUMBER,
  name VARCHAR2(40),
  customerAddress VARCHAR2(50),
  phone NUMBER(9),
  password VARCHAR2(20),
  userName VARCHAR2(10),
  dateSignUp DATE,
  cardNumber NUMBER,
  CONSTRAINT Customer_PK PRIMARY KEY (customerID),
  CONSTRAINT Customer_FK FOREIGN KEY (cardNumber) REFERENCES Card(cardID)
  );

CREATE TABLE Employee(
  employeeID NUMBER,
  name VARCHAR2(40),
  employeeAddress VARCHAR2(50),
  phone NUMBER(9),
  password VARCHAR2(20),
  userName VARCHAR2(10),
  paycheck NUMBER (8, 2),
  branchID NUMBER,
  cardNumber NUMBER,
  CONSTRAINT Employee_PK PRIMARY KEY (employeeID),
  CONSTRAINT Employee_FK_Card FOREIGN KEY (cardNumber) REFERENCES Card(cardID),
  CONSTRAINT Employee_FK_Branch FOREIGN KEY (branchID) REFERENCES Branch(branchID)
  );

--SELECT--


SELECT * FROM Customer;
SELECT * FROM Employee;
SELECT * FROM Book;
SELECT * FROM Rent;
SELECT * FROM Branch;
SELECT * FROM Location;

--DROP TABLES--
DROP TABLE Customer;
DROP TABLE Employee;
DROP TABLE Rent;
DROP TABLE Book;
DROP TABLE Branch;
DROP TABLE Location;
DROP TABLE Card;

--INSERTS--
INSERT INTO Location VALUES (1,'NEHRU ROAD');
INSERT INTO Location VALUES (2,'GANDHI ROAD');
INSERT INTO Location VALUES (3,'NAIK ROAD');
INSERT INTO Location VALUES (4,'RAJMOHAN ROAD');

INSERT INTO Branch VALUES (1,'ARCHEOLOGY', 1, 645645645);
INSERT INTO Branch VALUES (2,'CHEMISTRY', 2, 622622622);
INSERT INTO Branch VALUES (3,'COMPUTING', 3, 644644644);
INSERT INTO Branch VALUES (4,'PHYSICS', 4, 666666666);

INSERT INTO Book VALUES ('123', 'A412', 'GOOD', 'A', 5, 20, 1);
INSERT INTO Book VALUES ('124', 'B512', 'NEW', 'O', 6, 30, 1);
INSERT INTO Book VALUES ('125', 'C423', 'NEW', 'A', 2, 15, 3);
INSERT INTO Book VALUES ('126', 'D532', 'BAD', 'A', 1, 10, 3);
INSERT INTO Book VALUES ('127', 'E612', 'GOOD', 'A', 3, 15, 4);
INSERT INTO Book VALUES ('128', 'F712', 'GOOD', 'O', 4, 20, 2);
INSERT INTO Book VALUES ('129', 'G632', 'NEW', 'O', 4, 20, 2);
INSERT INTO Book VALUES ('130', 'H732', 'USED', 'A', 2, 12, 4);

INSERT INTO Card VALUES (101,'A',0);
INSERT INTO Card VALUES (102,'A',0);
INSERT INTO Card VALUES (103,'A',0);
INSERT INTO Card VALUES (104,'A',0);
INSERT INTO Card VALUES (105,'A',0);
INSERT INTO Card VALUES (106,'A',0);
INSERT INTO Card VALUES (107,'B',50);
INSERT INTO Card VALUES (108,'B',10);
INSERT INTO Card VALUES (109,'B',25.5);
INSERT INTO Card VALUES (110,'B',15.25);
INSERT INTO Card VALUES (151,'A',0);
INSERT INTO Card VALUES (152,'A',0);
INSERT INTO Card VALUES (153,'A',0);
INSERT INTO Card VALUES (154,'A',0);
INSERT INTO Card VALUES (155,'A',0);

INSERT INTO Rent VALUES (1,101, '123', '10-05-2018', '20-05-2018');
INSERT INTO Rent VALUES (2,102, '125', '10-05-2018', '25-05-2018');
INSERT INTO Rent VALUES (3,104, '127', '01-05-2018', '21-05-2018');
INSERT INTO Rent VALUES (4,105, '124', '02-05-2018', '25-05-2018');
INSERT INTO Rent VALUES (5, 154, '126', '04-05-2018', '26-05-2018');
INSERT INTO Rent VALUES (6,155, '128', '29-04-2018', '29-05-2018');

INSERT INTO Customer VALUES (1, 'ALFRED', 'BACON STREET', 623623623, 'alfred123', 'al1', '12-05-2018', 101);
INSERT INTO Customer VALUES (2, 'JAMES', 'DOWNTOWN ABBEY', 659659659, 'james123', 'ja2', '10-05-2018', 102);
INSERT INTO Customer VALUES (3, 'GEORGE', 'DETROIT CITY', 654654654, 'george123', 'ge3', '21-06-2017', 103);
INSERT INTO Customer VALUES (4, 'TOM', 'WASHINGTON DC.', 658658658, 'tom123', 'tom4', '05-12-2016', 104);
INSERT INTO Customer VALUES (5, 'PETER', 'CASTERLY ROCK', 652652652, 'peter123', 'pe5', '09-08-2016', 105);
INSERT INTO Customer VALUES (6, 'JENNY', 'TERRAKOTA', 651651651, 'jenny123', 'je6', '30-04-2017', 106);
INSERT INTO Customer VALUES (7, 'ROSE', 'SWEET HOME ALABAMA', 657657657, 'rose123', 'ro7', '28-02-2018', 107);
INSERT INTO Customer VALUES (8, 'MONICA', 'FAKE STREET 123', 639639639, 'monica123', 'mo8', '15-01-2016', 108);
INSERT INTO Customer VALUES (9, 'PHOEBE', 'CENTRAL PERK', 678678678, 'phoebe123', 'pho9', '25-03-2016', 109);
INSERT INTO Customer VALUES (10, 'RACHEL', 'WHEREVER', 687687687, 'rachel123', 'ra10', '01-09-2017', 110);

INSERT INTO Employee VALUES (211, 'ROSS', 'HIS HOUSE', 671671671, 'ross123', 'ro11', 1200, 1, 151);
INSERT INTO Employee VALUES (212, 'CHANDLER', 'OUR HEARTHS', 688688688, 'chandler123', 'chand12', 1150.50, 1, 152);
INSERT INTO Employee VALUES (213, 'JOEY', 'LITTLE ITAYLY', 628628628, 'joey123', 'jo13', 975.75, 1, 153);
INSERT INTO Employee VALUES (214, 'VICTOR', 'SANTA FE', 654321987, 'victor123', 'vic14', 2200, 2, 154);
INSERT INTO Employee VALUES (215, 'JAIRO', 'ARMILLA', 698754321, 'jairo123', 'ja15', 2200.50, 3, 155);


--FUNCTIONS--
--1--
--CUSTOMER--
CREATE OR REPLACE PROCEDURE loginCustomerlibrary(user1 IN VARCHAR2, pass IN VARCHAR2)
IS
  passAux customer.password%TYPE;
  incorrect_password EXCEPTION;
BEGIN 
  SELECT password INTO passAux
  FROM customer
  WHERE username LIKE user1;
  
  IF passAux LIKE pass THEN
    DBMS_OUTPUT.PUT_LINE('User ' || user1 || ' log in succesfull');
  ELSE
    RAISE incorrect_password;
  END IF;
  
  EXCEPTION
  WHEN no_data_found OR incorrect_password THEN 
       DBMS_OUTPUT.PUT_LINE('Incorrect username or password');
                                   
END;

SET SERVEROUTPUT ON;
DECLARE
  user1 customer.username%TYPE;
  pass customer.password%TYPE;
BEGIN
  user1:= '&Username';
  pass:= '&Password';
  loginCustomerlibrary(user1,pass);
END;




--EMPLOYEE-
CREATE OR REPLACE PROCEDURE loginEmployee_library(user2 IN VARCHAR2, pass IN VARCHAR2)
IS
  passAux employee.password%TYPE;
  incorrect_password EXCEPTION;
BEGIN
  SELECT password INTO passAux
  FROM employee
  WHERE username LIKE user2;
  
  IF passAux LIKE pass THEN
    DBMS_OUTPUT.PUT_LINE('User ' || user2 || ' log in succesfull');
  ELSE
    RAISE incorrect_password;
  END IF;
  
  EXCEPTION
  WHEN no_data_found OR incorrect_password THEN 
       DBMS_OUTPUT.PUT_LINE('Incorrect username or password');
END;

SET SERVEROUTPUT ON;
DECLARE
  user2 employee.username%TYPE;
  pass employee.password%TYPE;
BEGIN
  user2 := '&Username';
  pass := '&Password';
  loginemployee_library(user2,pass);
END;



--2--
CREATE OR REPLACE PROCEDURE viewItem_library(auxItemID IN VARCHAR2)
IS
  auxISBN VARCHAR2(4);
  auxTitle VARCHAR2(50);
  auxYear NUMBER;
  auxState VARCHAR2(10);
  auxDebyCost NUMBER(10,2);
  auxLostCost NUMBER(10,2);
  auxAddress NUMBER;
  auxAbala VARCHAR2(1);
  auxBook NUMBER;
BEGIN
  
  SELECT COUNT(*) INTO auxBook
  FROM book
  WHERE bookid LIKE auxItemID;
  
  IF auxBook > 0 THEN
    SELECT isbn, state, avalability, debycost, lostcost, locationID
    INTO auxISBN, auxState, auxAbala, auxDebyCost, auxLostCost, auxAddress
    FROM book
    WHERE bookid LIKE auxItemID;
  
    DBMS_OUTPUT.PUT_LINE('BOOK ' || auxItemID || ' INFO');
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('ISBN: ' || auxISBN);
    DBMS_OUTPUT.PUT_LINE('STATE: ' || auxState);
    DBMS_OUTPUT.PUT_LINE('AVALABILITY: ' || auxAbala);
    DBMS_OUTPUT.PUT_LINE('DEBY COST: ' || auxDebyCost);
    DBMS_OUTPUT.PUT_LINE('LOST COST: ' || auxLostCost);
    DBMS_OUTPUT.PUT_LINE('ADDRESS: ' || auxAddress);
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
  END IF;
END;

SET SERVEROUTPUT ON;
DECLARE
  auxItemID VARCHAR2(10);
BEGIN
  auxItemID := &Item_ID;
  viewItem_library(auxItemID);
END;



--3--
--CUSTOMER--
CREATE OR REPLACE PROCEDURE customerAccount_library(custoID IN customer.customerid%TYPE)
IS
  auxCard NUMBER;
  auxFines NUMBER;
  auxItem VARCHAR(6);
  rented number := 0;
BEGIN
  SELECT cardnumber INTO auxCard
  FROM customer
  WHERE customerid LIKE custoID;
  
  SELECT COUNT(*) INTO rented
  FROM rent
  WHERE rent.cardid LIKE auxcard;
  
  DBMS_OUTPUT.PUT_LINE('The user card is ' || auxCard);  
  IF (rented > 0) THEN
    SELECT rent.bookid INTO auxItem
    FROM rent,card
    WHERE card.cardid = rent.cardid
    AND card.cardid LIKE auxCard;    
    
    DBMS_OUTPUT.PUT_LINE('The user has ' || auxItem || ' rented');
  ELSE    
    DBMS_OUTPUT.PUT_LINE('This user has no rents'); 
  END IF;
  
  SELECT fines INTO auxFines
  FROM card
  WHERE cardid LIKE auxcard;
  
  DBMS_OUTPUT.PUT_LINE('The user fines are ' || auxFines);
    
  EXCEPTION WHEN no_data_found THEN 
  DBMS_OUTPUT.PUT_LINE('NOT DATA FOUND');
END;

SET SERVEROUTPUT ON;
DECLARE
  custoID customer.customerid%TYPE;
BEGIN
  custoID := &Customer_ID;
  customerAccount_library(custoID);
END;


--EMPLOYEE--
CREATE OR REPLACE PROCEDURE employeeAccount_library(emploID IN employee.employeeid%TYPE)
IS
  auxCard NUMBER;
  auxFines NUMBER;
  auxItem VARCHAR(6);
  rented number := 0;
BEGIN
  SELECT cardnumber INTO auxCard
  FROM employee
  WHERE employeeid LIKE emploID;
  
  SELECT COUNT(*) INTO rented
  FROM rent
  WHERE rent.cardid LIKE auxcard;
  
  DBMS_OUTPUT.PUT_LINE('The user card is ' || auxCard);  
  IF (rented > 0) THEN
    SELECT rent.bookid INTO auxItem
    FROM rent,card
    WHERE card.cardid = rent.cardid
    AND card.cardid LIKE auxCard;    
    
    DBMS_OUTPUT.PUT_LINE('The user has ' || auxItem || ' rented');
  ELSE    
    DBMS_OUTPUT.PUT_LINE('This user has no rents'); 
  END IF;
  
  SELECT fines INTO auxFines
  FROM card
  WHERE cardid LIKE auxcard;
  
  DBMS_OUTPUT.PUT_LINE('The user fines are ' || auxFines);
    
  EXCEPTION WHEN no_data_found THEN 
  DBMS_OUTPUT.PUT_LINE('NOT DATA FOUND');
END;

SET SERVEROUTPUT ON;
DECLARE
  emploID employee.employeeid%TYPE;
BEGIN
  emploID := &Employee_ID;
  employeeAccount_library(emploID);
END;



--4--
CREATE OR REPLACE PROCEDURE rentItem_library(auxCard IN NUMBER, auxItemID IN VARCHAR2, itemType IN VARCHAR2, auxDate IN DATE)
IS
  statusAux VARCHAR2(1);
  itemStatus VARCHAR2(1);
  maxID NUMBER;
BEGIN
  
  SELECT status INTO statusAux
  FROM card
  WHERE cardid LIKE auxCard;
  
  IF statusAux LIKE 'A' THEN
    IF itemType LIKE 'book' THEN
      SELECT avalability INTO itemStatus
      FROM book
      WHERE bookid LIKE auxItemID;
      
      IF itemStatus LIKE 'A' THEN
        UPDATE book
        SET avalability = 'O'
        WHERE bookid LIKE auxItemID;
        
        SELECT MAX(rentID) INTO maxID
        FROM rent;
        
        INSERT INTO rent
        VALUES (maxID,auxCard,auxItemID,sysdate,auxDate);
        DBMS_OUTPUT.PUT_LINE('Item ' || auxItemID || ' rented');
      ELSE
        DBMS_OUTPUT.PUT_LINE('The item is already rented');
      END IF;
      
    
  ELSE
    DBMS_OUTPUT.PUT_LINE('The user is blocked');
  END IF;
  END IF;
END;

SET SERVEROUTPUT ON;
DECLARE
  auxCard NUMBER;
  auxItemID VARCHAR2(10);
  itemType VARCHAR2(20);
  auxDate DATE;
BEGIN
  auxCard := &Card_ID;
  itemType := '&Item_Type_book_or_video';  
  auxItemID := &ID_Item;  
  auxDate := '&Return_date';
  rentItem_library(auxCard,auxItemID,itemType,auxDate);
END;

--5--
CREATE OR REPLACE PROCEDURE payFines_library(auxCard IN card.cardid%TYPE, money IN NUMBER)
IS
  finesAmount NUMBER;
  total NUMBER;
BEGIN
  SELECT fines INTO finesAmount
  FROM card
  WHERE cardid LIKE auxCard;
  
  IF finesAmount < money THEN
    total := money - finesAmount;
    DBMS_OUTPUT.PUT_LINE('YOU PAY ALL YOUR FINES AND YOU HAVE ' || total || ' MONEY BACK');
    
    UPDATE card
    SET status = 'A', fines = 0
    WHERE cardid = auxCard;
    
  ELSIF finesAmount = money THEN
    total := money - finesAmount;
    DBMS_OUTPUT.PUT_LINE('YOU PAY ALL YOUR FINES');
    
    UPDATE card
    SET status = 'A', fines = 0
    WHERE cardid = auxCard;
  
  ELSE
    total := finesAmount - money;
    DBMS_OUTPUT.PUT_LINE('YOU WILL NEED TO PAY ' || total || ' MORE RUPEES TO UNLOCK YOUR CARD');
    
    UPDATE card
    SET fines = total
    WHERE cardid = auxCard;
  END IF;
END;

SET SERVEROUTPUT ON;
DECLARE
  auxCard card.cardid%TYPE;
  money NUMBER;
BEGIN
  auxCard := &Card_ID;
  money := &Money_To_Pay;
  payFines_library(auxCard,money);
END;



--6--
--CUSTOMER--
CREATE OR REPLACE PROCEDURE updateInfoCusto_library(auxCustomer IN customer.customerid%TYPE, pNumber NUMBER, address VARCHAR2, newPass VARCHAR2)
IS
BEGIN
  UPDATE customer
  SET phone = pNumber, customeraddress = address, password = newPass
  WHERE customerid = auxCustomer;
END;

SET SERVEROUTPUT ON;
DECLARE
  auxCustomer customer.customerid%TYPE;
  pNumber NUMBER;
  address VARCHAR2(50);
  newPass VARCHAR2(20);
BEGIN
  auxCustomer := &Customer_ID;
  pNumber := &Write_your_new_phone_number_or_the_old_one_if_you_do_not_want_to_change_it;
  address := '&Write_your_new_address_or_the_old_one_if_you_do_not_want_to_change_it';
  newPass := '&Write_your_new_password_or_the_old_one_if_you_do_not_want_to_change_it';
  updateInfoCusto_library(auxCustomer,pNumber,address,newPass);
END;


--EMPLOYEE--
CREATE OR REPLACE PROCEDURE updateInfoEmp_library(auxEmployee IN employee.employeeid%TYPE, pNumber NUMBER, address VARCHAR2, newPass VARCHAR2, newPayCheck NUMBER,
newBranch NUMBER)
IS
BEGIN
  UPDATE employee
  SET phone = pNumber, employeeaddress = address, password = newPass, paycheck = auxEmployee, branchID = newBranch
  WHERE employeeid = auxEmployee;
END;

SET SERVEROUTPUT ON;
DECLARE
  auxEmployee employee.employeeid%TYPE;
  pNumber NUMBER;
  address VARCHAR2(50);
  newPass VARCHAR2(20);
  newPayCheck NUMBER;
  newBranch NUMBER;
BEGIN
  auxEmployee := &Customer_ID;
  pNumber := &Write_your_new_phone_number_or_the_old_one_if_you_do_not_want_to_change_it;
  address := '&Write_your_new_address_or_the_old_one_if_you_do_not_want_to_change_it';
  newPass := '&Write_your_new_password_or_the_old_one_if_you_do_not_want_to_change_it';
  newPayCheck := '&Write_your_new_paycheck_or_the_old_one_if_you_do_not_want_to_change_it';
  newBranch := &Write_your_new_branch_or_the_old_one_if_you_do_not_want_to_change_it;
  updateInfoEmp_library(auxEmployee,pNumber,address,newPass,newPayCheck,newBranch);
END;


--7--
--CUSTOMER--
CREATE OR REPLACE TRIGGER addCardCusto_library
AFTER INSERT
ON customer
FOR EACH ROW
DECLARE
BEGIN
  INSERT INTO card
  VALUES (:new.cardnumber,'A',0);
  
  DBMS_OUTPUT.PUT_LINE('Card created');
END;
--8--
CREATE OR REPLACE PROCEDURE addCustomer_library(auxCustomerId IN NUMBER, auxName IN VARCHAR2, auxCustomerAddress IN VARCHAR2, auxPhone IN NUMBER,
auxPass IN VARCHAR2, auxUserName IN VARCHAR2, auxCardNumber IN NUMBER)
IS
BEGIN
  INSERT INTO customer
  VALUES (auxCustomerId,auxName,auxCustomerAddress,auxPhone,auxPass,auxUserName,sysdate,auxCardNumber);
END;

SET SERVEROUTPUT ON;
DECLARE
  auxCustomerId NUMBER;
  auxName VARCHAR2(20);
  auxCustomerAddress VARCHAR2(20);
  auxPhone NUMBER;
  auxPass VARCHAR2(20);
  auxUserName VARCHAR2(20);
  auxCardNumber NUMBER;
BEGIN
  auxCustomerId := &Customer_ID;
  auxName := '&Name';
  auxCustomerAddress := '&Address';
  auxPhone := &Phone;
  auxPass := '&Password';
  auxUserName := '&User_Name';
  auxCardNumber := &Card_Number;
  addCustomer_library(auxCustomerId,auxName,auxCustomerAddress,auxPhone,auxPass,auxUserName,auxCardNumber);
END;


--9--
CREATE OR REPLACE PROCEDURE allMedia_library(mediaType VARCHAR2)

IS
  CURSOR cBooks
  IS
    SELECT *
    FROM book;
    
  xBooks cBooks%ROWTYPE;
 
BEGIN
  IF mediaType LIKE 'books' THEN
    OPEN cBooks;
    
    DBMS_OUTPUT.PUT_LINE('ISBN     ID     STATE     AVALABILITY     DEBY_COST     LOST_COST    LOCATION');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------');
    
    LOOP
      FETCH cBooks
      INTO xBooks;
      EXIT WHEN cBooks%NOTFOUND;
      
      DBMS_OUTPUT.PUT_LINE(xBooks.isbn || '     ' || xBooks.bookid || '     ' || xBooks.state || '     ' || xBooks.avalability || '     ' || xBooks.debycost || '     ' ||
      xBooks.lostcost || '     ' || xBooks.locationid);
    END LOOP;
  
  ELSE
    DBMS_OUTPUT.PUT_LINE('TYPE INCORRECT, you must choose  books ');
  END IF;
END;

SET SERVEROUTPUT ON;
DECLARE
  typeItem VARCHAR2(10);
BEGIN
  typeItem := '&Select_between_books_or_videos';
  allMedia_library(typeItem);
END;

CREATE OR REPLACE PROCEDURE handleReturns_library(auxItemID IN VARCHAR2)
IS
  auxRented NUMBER;
  auxBook NUMBER;
 
BEGIN
  SELECT COUNT(*) INTO auxRented
  FROM rent
  WHERE bookid LIKE auxItemID;
  
  SELECT COUNT(*) INTO auxBook
  FROM book
  WHERE bookid LIKE auxItemID;
  
  
  
  IF auxRented > 0 THEN
    DELETE FROM rent
    WHERE bookid = auxItemID;
    IF auxBook > 0 THEN
      UPDATE book
      SET avalability = 'A'
      WHERE bookid LIKE auxItemID;
      DBMS_OUTPUT.PUT_LINE('The book ' || auxItemID || ' is now avaible.');
   END IF;
  ELSE
    DBMS_OUTPUT.PUT_LINE('This item is not rented at the moment');
  END IF;
  EXCEPTION WHEN no_data_found THEN 
  DBMS_OUTPUT.PUT_LINE('Item ID incorrect');    
END;

SET SERVEROUTPUT ON;
DECLARE
  auxItemID VARCHAR2(10);
BEGIN
  auxItemID := '&ItemID_to_return';
  handleReturns_library(auxItemID);
END;
