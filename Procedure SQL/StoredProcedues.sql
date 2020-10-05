
--This procedure is to add the jewelry to the database.
CREATE OR REPLACE PROCEDURE AddJewelry(JY_id IN VARCHAR, Inventory_id IN DECIMAL, 
Item_desc IN VARCHAR, P_diamond_type IN VARCHAR, P_diamond_color IN VARCHAR, P_diamond_cut IN VARCHAR, 
P_diamond_clarity IN VARCHAR, P_diamond_weight IN DECIMAL, s_diamond_type IN VARCHAR, 
s_diamond_color IN VARCHAR, s_diamond_cut IN VARCHAR, s_diamond_clarity IN VARCHAR, s_diamond_weight IN DECIMAL,
P_stone_type IN VARCHAR, P_stone_weight IN DECIMAL, S_stone_type IN VARCHAR, S_Stone_weight IN DECIMAL,
JY_Material IN VARCHAR, JY_Mat_weight IN DECIMAL, JY_Gender IN VARCHAR, JY_Price IN DECIMAL,
JY_Cost IN DECIMAL, JY_Qoh IN DECIMAL, Sup_id VARCHAR)
AS
BEGIN
 INSERT INTO Jewelry(JY_id, Inventory_id, Item_Desc, P_Diamond_type, P_Diamond_Color, 
P_Diamond_Cut, P_Diamond_Clarity, P_Diamond_Weight, S_Diamond_type, S_Diamond_Color, 
S_Diamond_Cut, S_Diamond_Clarity, S_Diamond_Weight, P_Stone_Type, P_Stone_Weight, S_Stone_type, S_Stone_weight, 
JY_Material, JY_Mat_Weight, JY_Gender, JY_Price, JY_Cost, JY_QOH, Sup_id)
 VALUES(JY_id, Inventory_id, Item_Desc, P_Diamond_type, P_Diamond_Color, 
P_Diamond_Cut, P_Diamond_Clarity, P_Diamond_Weight, S_Diamond_type, S_Diamond_Color, 
S_Diamond_Cut, S_Diamond_Clarity, S_Diamond_Weight, P_Stone_Type, P_Stone_Weight, S_Stone_type, S_Stone_weight, 
JY_Material, JY_Mat_Weight, JY_Gender, JY_Price, JY_Cost, JY_QOH, Sup_id);
END;

BEGIN
 AddJewelry('JY100002', 1, '10 carat Emerald Bracelet in Silver', 
NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
'Emerald', 10, NULL, NULL,'Silver',7.23, 'Female', 2199.99, 1199.99, 2, 'Heramoti');
COMMIT;
END;


--This procedure is to add a new employee to the database
CREATE OR REPLACE PROCEDURE AddEmployee(employee_id IN DECIMAL, employee_fname IN VARCHAR, 
employee_lname IN VARCHAR, employee_address IN VARCHAR, employee_phone IN VARCHAR, 
employee_email IN VARCHAR)
AS
BEGIN
INSERT INTO Employee (employee_id, employee_fname, employee_lname, employee_address, employee_phone, employee_email)
VALUES (employee_id, employee_fname, employee_lname, employee_address, employee_phone, employee_email);
End;

BEGIN
AddEmployee (998, 'Eddy', 'Murphy','439 Zellar Street, Cranberry, PA 16066', '4126534847', 'EMurphy65@gmail.com');
COMMIT;
End;


