--This query answer this question:
--Do you have any rings with Tennis Bracelets with emerald of 10 carats or less in stock?
--This not only answers the question, but it also provides more info incase
--the customer asks for more info on the price.

SELECT bracelet.bracelet_style, jewelry.jy_id, jewelry.item_desc, jewelry.p_stone_type, jewelry.p_stone_weight, jewelry.jy_price, jewelry.jy_qoh
FROM Bracelet
JOIN Jewelry ON Jewelry.jy_id = Bracelet.jy_id
WHERE P_Stone_type = 'Emerald'  AND P_stone_weight <=10 AND bracelet.bracelet_style = 'Tennis';


--This Query answers this question:
--Sam Smith came back to return the ring because of a defect, and the manager 
--wanted to inquire the purchase date, and which supplier may be responsible for the defect.

SELECT sale_header.sale_header_id, sale_detail.item_desc, sale_header.sale_date, sale_header.cus_id, customer.cus_fname, 
supplier.sup_id, supplier.sup_email, supplier.sup_phone
FROM sale_header
JOIN Customer ON customer.cus_id = sale_header.cus_id
JOIN Sale_detail ON sale_detail.sale_detail_id = sale_header.sale_detail_id
JOIN Jewelry ON Jewelry.jy_id = sale_detail.jy_id
JOIN supplier ON supplier.sup_id = jewelry.sup_id
WHERE customer.cus_id = 100000000001
GROUP BY sale_header.sale_header_id, sale_detail.item_desc, sale_header.sale_date, sale_header.cus_id, customer.cus_fname, 
supplier.sup_id, supplier.sup_email, supplier.sup_phone;