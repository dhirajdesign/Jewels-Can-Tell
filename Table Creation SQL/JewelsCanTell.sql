DROP TABLE Sale_detail;
DROP TABLE Sale_header;
DROP TABLE Customer;
DROP TABLE Administrator;
DROP TABLE Employee;
DROP TABLE PriceChange;
DROP TABLE Ring;
DROP TABLE Earring;
DROP TABLE Bracelet;
DROP TABLE Watch;
DROP TABLE Pendant;
DROP TABLE Necklace;
DROP TABLE Jewelry;
DROP TABLE Supplier;
DROP TABLE Inventory;
Drop TABLE Shop;

CREATE TABLE Shop (
Shop_id VARCHAR(24) PRIMARY KEY);

CREATE TABLE Inventory (
Inventory_id DECIMAL(2) PRIMARY KEY,
Shop_id VARCHAR(24)
);

CREATE TABLE Jewelry (
JY_id VARCHAR(56) PRIMARY KEY,
Inventory_id DECIMAL(2),
Item_Desc VARCHAR(200),
P_Diamond_type VARCHAR(56),
P_Diamond_Color VARCHAR(56),
P_Diamond_Cut VARCHAR(56),
P_Diamond_Clarity VARCHAR(12),
P_Diamond_Weight DECIMAL(6,2), 
S_Diamond_type VARCHAR (56),
S_Diamond_Color VARCHAR(56),
S_Diamond_Cut VARCHAR(56),
S_Diamond_Clarity VARCHAR(12),
S_Diamond_Weight DECIMAL(6,2),
P_Stone_type VARCHAR(56),
P_Stone_weight DECIMAL(6,2),
S_Stone_type VARCHAR(56),
S_Stone_weight DECIMAL(6,2),
JY_material VARCHAR(56),
JY_Mat_Weight DECIMAL(8,2),
JY_Gender VARCHAR(12),
JY_Price DECIMAL(14,2),
JY_Cost DECIMAL(14,2),
JY_QOH DECIMAL(12),
Sup_id VARCHAR(56)
);

CREATE TABLE PriceChange (
PriceChangeID DECIMAL(12) NOT NULL PRIMARY KEY,
OldPrice DECIMAL(8,2) NOT NULL,
NewPrice DECIMAL(8,2) NOT NULL,
Jy_ID VARCHAR(56) NOT NULL,
ChangeDate DATE NOT NULL,
FOREIGN KEY (Jy_id) REFERENCES Jewelry(Jy_ID)); 

CREATE TABLE Ring (
JY_ID VARCHAR(12) PRIMARY KEY,
Ring_style VARCHAR (56), 
Ring_Size DECIMAL(4,2),
Occasion VARCHAR (56)
);

CREATE TABLE Bracelet (
JY_ID VARCHAR(12) PRIMARY KEY,
Bracelet_style VARCHAR (56),
Occasion VARCHAR (56)
);

CREATE TABLE Earring (
JY_ID VARCHAR(12) PRIMARY KEY,
Earring_style VARCHAR(56),  
Occasion VARCHAR(56)
);

CREATE TABLE Pendant (
JY_ID VARCHAR(12) PRIMARY KEY,
Pendant_style VARCHAR(56),
Occasion VARCHAR(56)
);

CREATE TABLE Watch (
JY_ID VARCHAR(12) PRIMARY KEY,
Watch_style VARCHAR(56),
Watch_Brand VARCHAR(56), 
Watch_Face VARCHAR(20)
);

CREATE TABLE Necklace (
JY_ID VARCHAR(12) PRIMARY KEY,
Necklace_style VARCHAR(56), 
Necklace_Size DECIMAL(4,2),
Occasion VARCHAR (56)
);

CREATE TABLE Supplier (
Sup_id VARCHAR (56) PRIMARY KEY,
Sup_Fname VARCHAR(56),
Sup_Lname VARCHAR(56),
Sup_Address VARCHAR(360),
Sup_Phone VARCHAR(15),
Sup_Email VARCHAR(254)
);

CREATE TABLE Administrator (
Admin_id DECIMAL(3),
Inventory_id DECIMAL(2),
Employee_id DECIMAL(3)
);

CREATE TABLE Employee (
Employee_id DECIMAL(3) PRIMARY KEY,
Employee_Fname VARCHAR(56),
Employee_Lname VARCHAR(56),
Employee_Address VARCHAR(360),
Employee_Email VARCHAR(254),
Employee_Phone VARCHAR(15)
);

CREATE TABLE Sale_detail (
Sale_detail_id DECIMAL(12) PRIMARY KEY, 
Sale_header_id DECIMAL(24),
Jy_id VARCHAR(56),
Item_Desc VARCHAR(200),
Jy_price DECIMAL(14,2),
Quantity DECIMAL(3)
);

CREATE TABLE Customer (
Cus_id DECIMAL(12) PRIMARY KEY,
Cus_Fname VARCHAR(56),
Cus_Lname VARCHAR(56),
Cus_Email VARCHAR(254),
Cus_Phone VARCHAR(15),
Cus_Address VARCHAR(360)
);

CREATE TABLE Sale_header (
Sale_Header_Id DECIMAL(12) Primary Key,
Sale_Detail_id DECIMAL(12),
Employee_id DECIMAL(3),
Cus_id DECIMAL(12),
Sale_date DATE
);



ALTER TABLE Inventory 
ADD FOREIGN KEY (Shop_id)
REFERENCES Shop(Shop_id);

ALTER TABLE Jewelry
ADD FOREIGN KEY (Inventory_id)
REFERENCES Inventory(Inventory_id);

ALTER TABLE Jewelry
ADD FOREIGN KEY (Sup_id)
REFERENCES Supplier(Sup_id);

ALTER TABLE Earring
ADD FOREIGN KEY (Jy_id)
REFERENCES Jewelry(Jy_id);

ALTER TABLE Ring
ADD FOREIGN KEY (Jy_id)
REFERENCES Jewelry(Jy_id);

ALTER TABLE Bracelet
ADD FOREIGN KEY (Jy_id)
REFERENCES Jewelry(Jy_id);

ALTER TABLE Watch
ADD FOREIGN KEY (Jy_id)
REFERENCES Jewelry(Jy_id);

ALTER TABLE Pendant
ADD FOREIGN KEY (Jy_id)
REFERENCES Jewelry(Jy_id);

ALTER TABLE Necklace
ADD FOREIGN KEY (Jy_id)
REFERENCES Jewelry(Jy_id);

ALTER TABLE Sale_detail
ADD FOREIGN KEY (JY_id)
REFERENCES Jewelry(JY_id); 

ALTER TABLE Sale_detail
ADD FOREIGN KEY (sale_header_id)
REFERENCES Sale_header(Sale_header_id); 

ALTER TABLE Sale_Header 
ADD FOREIGN KEY (Employee_id)
REFERENCES Employee(Employee_id);

ALTER TABLE Sale_Header
ADD FOREIGN KEY (Cus_id)
REFERENCES Customer(Cus_id);

ALTER TABLE Administrator
ADD FOREIGN KEY (Inventory_id)
REFERENCES Inventory(Inventory_id);

ALTER TABLE Administrator
ADD FOREIGN KEY (Employee_id)
REFERENCES Employee(Employee_id);

INSERT INTO supplier (sup_id, sup_fname, sup_lname, sup_address, sup_phone, sup_email) 
VALUES ('Heramoti', 'Parminder','Parimal','Suite 123 New Port, New Jersey, 21212', '878-941-9873', 'sales@heramoti.com');

INSERT INTO supplier (sup_id, sup_fname, sup_lname, sup_address, sup_phone, sup_email) 
VALUES ('Gems and Co', 'Max','Lentel','1172 S Main ST New York, NY 20019', '745-343-5643', 'sales@gemsandco.com');

INSERT INTO Employee (employee_id, employee_fname, employee_lname, employee_address, employee_phone, employee_email)
VALUES (999, 'Billy', 'Bob','123 Main Street, Wexford, PA 15090', '3403234243', 'billybob@gmail.com');

INSERT INTO Shop(Shop_id)
VALUES ('GoldLand');

INSERT INTO Inventory (Shop_id, Inventory_id)
VALUES ('GoldLand', 01);

INSERT INTO Jewelry (JY_id, Inventory_id, Item_Desc, P_Diamond_type, P_Diamond_Color, 
P_Diamond_Cut, P_Diamond_Clarity, P_Diamond_Weight, S_Diamond_type, S_Diamond_Color, 
S_Diamond_Cut, S_Diamond_Clarity, S_Diamond_Weight, P_Stone_Type, P_Stone_Weight, S_Stone_type, S_Stone_weight, 
JY_Material, JY_Mat_Weight, JY_Gender, JY_Price, JY_Cost, JY_QOH, Sup_id)
VALUES ('JY100001', 1, '14k Diamond Ring with a 2 carat Princess Cut Diamond in the center.', 
'White', 'G', 'Princess', 'SI1', 3.37, NULL, NULL, NULL, NULL, NULL, 
NULL, NULL, NULL, NULL,'Gold',5.4, 'Female', 5412.01, 2100.99, 5, 'Heramoti');

INSERT INTO Administrator (Admin_id, Employee_id, Inventory_id)
VALUES (500, 999, 01);

INSERT INTO Customer (cus_id, cus_fname, cus_lname, cus_email, cus_phone, cus_address)
VALUES (100000000001, 'Sam', 'Smith','SmitySam@gmail.com','1234567891','1123 Santa Ave, Somerset, CA 10982'); 

INSERT INTO Sale_header (sale_Header_id, Sale_detail_id, employee_id, cus_id, sale_date)
VALUES (12121212, 3131313131,999,100000000001, TO_DATE('22-DEC-2017', 'DD-MON-YYYY'));--ADD SALE INFORMATION\

INSERT INTO sale_detail (sale_detail_id, Sale_Header_id, JY_id, JY_price, Item_desc, quantity)
VALUES (3131313131, 12121212, 'JY100001', 5412.01, 
'Diamond Ring with 14k Gold with 2 carat Princess Cut Diamond', 1);

INSERT INTO Jewelry (JY_id, Inventory_id, Item_Desc, P_Diamond_type, P_Diamond_Color, 
P_Diamond_Cut, P_Diamond_Clarity, P_Diamond_Weight, S_Diamond_type, S_Diamond_Color, 
S_Diamond_Cut, S_Diamond_Clarity, S_Diamond_Weight, P_Stone_Type, P_Stone_Weight, S_Stone_type, S_Stone_weight, 
JY_Material, JY_Mat_Weight, JY_Gender, JY_Price, JY_Cost, JY_QOH, Sup_id)
VALUES
('JY100002', 1, '10 carat Emerald Bracelet in Silver', 
NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
'Emerald', 10, NULL, NULL,'Silver',7.23, 'Female', 2199.99, 1199.99, 2, 'Heramoti');

INSERT INTO Bracelet(JY_id, Bracelet_style, Occasion)
VALUES ('JY100002', 'Tennis', 'Classy');

INSERT INTO Jewelry (JY_id, Inventory_id, Item_Desc, P_Diamond_type, P_Diamond_Color, 
P_Diamond_Cut, P_Diamond_Clarity, P_Diamond_Weight, S_Diamond_type, S_Diamond_Color, 
S_Diamond_Cut, S_Diamond_Clarity, S_Diamond_Weight, P_Stone_Type, P_Stone_Weight, S_Stone_type, S_Stone_weight, 
JY_Material, JY_Mat_Weight, JY_Gender, JY_Price, JY_Cost, JY_QOH, Sup_id)
VALUES
('JY100003', 1, '4 Carat Total Diamond Earring',  
'Yellow', NULL, 'Round', 'SI2', 4.09, NULL, NULL, NULL, NULL, NULL, 
NULL, NULL, NULL, NULL,'Platinum',6, 'Female', 8747.91, 4199.99, 4, 'Heramoti');

Insert INTO Earring (jy_id, earring_style, occasion)
VALUES ('JY100003','Hoop', 'Fancy');

CREATE INDEX Watchdx
ON Watch (jy_id, watch_brand, watch_face);

Create Index Ringdx
ON Ring (jy_id, ring_style, ring_size, occasion);

Create Index Braceletdx
ON Bracelet (jy_id, bracelet_style);

Create Index Necklacedx
ON Necklace (JY_id, Necklace_style);

CREATE INDEX Pendantdx
ON Pendant(jy_id, pendant_style);

CREATE INDEX SaleHeaderCustomerDX
ON Sale_header(cus_id);

CREATE UNIQUE INDEX SaleHeaderSaleDetaildx
ON Sale_header(sale_detail_id);

CREATE UNIQUE INDEX SaleDetailSaleHeaderdx
ON Sale_detail(Sale_header_id);

CREATE INDEX JewelrySupplierdx
ON Jewelry(sup_id);

CREATE INDEX JewelryInventorydx
ON Jewelry(Inventory_id);

CREATE INDEX Jewelrydx
ON Jewelry(P_diamond_type, P_diamond_color, P_diamond_clarity, P_diamond_weight,
P_stone_weight, P_stone_type, jy_price, Jy_material, jy_mat_weight, Jy_qoh, JY_cost);

Create UNIQUE Index InventoryStoredx
ON Inventory(shop_id);

Create Index Employeeinfodx
ON Employee(employee_fname, employee_lname, employee_email, employee_phone);


-- PRICE CHANGE TRIGGER CREATION--

CREATE OR REPLACE TRIGGER PriceChangeTrigger
BEFORE UPDATE OF jy_price ON Jewelry
FOR EACH ROW
BEGIN
 INSERT INTO PriceChange(PriceChangeID, OldPrice, NewPrice, JY_ID, ChangeDate)
 VALUES(NVL((SELECT MAX(PriceChangeID)+1 FROM PriceChange), 1),
 :OLD.Jy_Price,
 :NEW.Jy_Price,
 :New.Jy_ID,
 trunc(sysdate));
END; 
--Price Change Trigger Test--
Update Jewelry
SET Jy_price =4499.99
WHERE Jy_id = 'JY100003';

Update Jewelry
SET Jy_price =4410.55
WHERE Jy_id = 'JY100003';

Update Jewelry
SET Jy_price =4199.99
WHERE Jy_id = 'JY100003';

SELECT * 
FROM PriceChange;
--Queries for use--

SELECT *
FROM Employee;

SELECT *
FROM Sale_detail;

SELECT *
FROM Jewelry;

