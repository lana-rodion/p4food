-- Demo

SELECT `price_totalTTC`, `client_id`, `supplier_id` FROM `order` WHERE `supplier_id` = 2;

SELECT `first_name`, `last_name` FROM `client` WHERE `id` = 3;

SELECT `quantity`, `supplier_id`, `dish_id` FROM `stockdish` WHERE `supplier_id` = 3;