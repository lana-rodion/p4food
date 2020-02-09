USE `p4food_v5`;

INSERT INTO `client` 
(`first_name`,	`last_name`, 	`phone`, 		`password`, 		`email`) 
VALUES 
('James', 		'Bond', 		'0145637896', 	'j.bond121220', 	'j.bond@gmail.com'),
('Elisabeth', 	'Jolie', 		'0145637899', 	'ejolie75bravo', 	'ejolie@outlook.com'),
('Kelly', 		'Brace', 		'0324897563', 	'brace_kelly06', 	'grace_kelly@live.fr'),
('Johny', 		'Weep', 		'0124897564', 	'johnyWeep2020', 	'jd_pirate@live.com');


INSERT INTO `supplier` 
(`first_name`, 	`last_name`, 	`phone`, 		`password`, 		`email`, 				`available`, 	`latitude`, 	`longitude`) 
VALUES 
('Alex', 		'Grand', 		'0135637890', 	'alexGrand75', 		'alex.grand@yahoo.fr', 		1,			48.856614, 		2.352221),
('Eliot', 		'Dupont', 		'0135637899', 	'eliot81dupont', 	'eliot81@wanadoo.fr', 		1,			18.856514, 		13.352221),
('Pierre', 		'Lepetit', 		'0674897563', 	'pp_Rrrr99', 		'p.lepetit99@live.fr', 		0,			48.856214, 		2.352242),
('Yann', 		'Mont', 		'0634897564', 	'20yannMont20', 	'yann_mont@gmail.com', 		1,			48.836614, 		2.350222);

INSERT INTO `address`
(`building`, 	`street`,					`address_details`, 			`postcode`, 	`city`, 	`billing_address`, 		`client_id`)
VALUES 
('14 A', 		'Avenue de Paradis', 		'2 étage, interphone 14', 	'75011', 		'Paris', 	0, 						1),
('141', 	    'Rue des Anges', 			'Résidence Étoile', 		'75013', 		'Paris', 	0, 						2),
('27', 	    	'Boulevard des Carmorans', 	'Agence Candy', 			'75015', 		'Paris', 	1, 						3),
('19', 	    	'Impasse de voie Verte', 	'Hôtel Régeant', 			'75005', 		'Paris', 	1, 						4);

INSERT INTO `creditcard`
(`card_number`,		`expiry_date`, 		`first_name`, 		`last_name`, 			`client_id`)
VALUES 
(4560145637896, 	'2022-12-07', 		'James', 			'Bond', 		 		1),
(8230145637896, 	'2021-08-25', 		'Elisabeth', 		'Jolie', 		 		2),
(4940145637896, 	'2022-05-11', 		'Kelly', 			'Brace', 		 		3),
(5210145637896, 	'2022-11-04', 		'Johny', 			'Weep', 		 		4);

INSERT INTO `payment`
(`payment_date`, 	`pre-payment`, 	`validated`)
VALUES 
('2020-01-09', 		1, 				1),
('2020-01-09', 		0, 				0);

INSERT INTO `order`
(`order_date`, 	`delivery`, 			`delivery_status`, 	`price_totalTTC`, 	`client_id`, 	`payment_id`, `supplier_id`)
VALUES 
('2020-01-09', 	'2020-01-09 15:00', 	1, 					58.73, 			1, 				1,				1),
('2020-01-09', 	'2020-01-09 15:00', 	1, 					41.36, 			2, 				2,				2);

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
(2, 			1, 			1),
(4, 			2, 			1),
(2, 			3, 			1),
(3, 			2, 			2),
(3, 			4, 			2);

INSERT INTO `stockdish`
(`quantity`, `supplier_id`,	`dish_id`)
VALUES 
(12, 			1, 			1),
(14, 			2, 			2),
(22, 			3, 			3),
(13, 			4, 			4);




