USE `p4food_v5`;

INSERT INTO `client` 
(`first_name`,	`last_name`, 	`phone`, 		`password`, 		`email`) 
VALUES 
('Marc', 		'Dupont', 		'0120587123', 	'75Dupont@Marc', 	'm.dupont@outlook.com');

INSERT INTO `address`
(`building`, 	`street`,					`address_details`, 			`postcode`, 	`city`, 	`billing_address`, 		`client_id`)
VALUES 
('19', 	    	'Rue des Platants', 		'Résidence Les Alizés', 	'75011', 		'Paris', 	1, 						5);

INSERT INTO `creditcard`
(`card_number`,		`expiry_date`, 		`first_name`, 		`last_name`, 			`client_id`)
VALUES 
(4710145637896, 	'2022-06-07', 		'Marc', 			'Dupont', 		 		5);

INSERT INTO `payment`
(`payment_date`, 	`pre-payment`, 	`validated`)
VALUES 
('2020-02-02', 		1, 				1);

INSERT INTO `order`
(`order_date`, 	`delivery`, 			`delivery_status`, 	`price_totalTTC`, 	`client_id`, 	`payment_id`, `supplier_id`)
VALUES 
('2020-02-02', 	'2020-02-02 15:00', 	1, 					17.99, 				5, 				3,				2);

INSERT INTO `dish`
(`dish_type`, 	`dish_name`, 			`dish_description`, 								`added_date`, 	`production_date`,		`price_unitHT`, 	`taxe_TVA100`, 	`dish_picture`)
VALUES 
('dish', 		'Salade Ceasar', 		'Salade composée avec des morceaux de poulet', 		'2020-01-07', 	'2020-01-09', 			4.99, 				20, 			'saladeCeasar.jpg'),
('dish', 		'Langue de boeuf', 		'Langue de boeuf à la Madére', 						'2020-01-07', 	'2020-01-09', 			7.99, 				20, 			'langueBoeuf.jpg'),
('dessert', 	'Tartilette au citron', 'Tartilette au citron et méringue',					'2020-01-05', 	'2020-01-09', 			3.50, 				20, 			'tartiletteCitron.jpg'),
('dessert', 	'Mousse au chocolat', 	'Onctueuse mousse au chocolat', 					'2020-01-05', 	'2020-01-09', 			3.50, 				20, 			'mousseChocolat.jpg');


INSERT INTO `quantity`
(`quantity`, `dish_id`, `order_id`)
VALUES 
(1, 			2, 			3),
(1, 			3, 			3),
(1, 			4, 			3);