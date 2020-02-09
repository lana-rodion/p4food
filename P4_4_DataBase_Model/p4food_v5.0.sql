-- Sun Feb  9 15:17:26 2020

DROP DATABASE IF EXISTS `p4food_v5`;
CREATE DATABASE `p4food_v5` CHARSET 'utf8'; 
USE `p4food_v5`;
-- -----------------------------------------------------
-- Table `p4food_v5`.`client`
-- -----------------------------------------------------
CREATE TABLE `client`(
  `id` MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `email` VARCHAR(45) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
-- -----------------------------------------------------
-- Table `p4food_v5`.`supplier`
-- -----------------------------------------------------
CREATE TABLE `supplier`(
  `id` TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `available` TINYINT(1) NOT NULL,
  `latitude` DECIMAL(8,6) NOT NULL,
  `longitude` DECIMAL(8,6) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
-- -----------------------------------------------------
-- Table `p4food_v5`.`address`
-- -----------------------------------------------------
CREATE TABLE `address`(
  `id` MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `building` TINYTEXT NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `address_details` VARCHAR(255) NULL,
  `postcode` MEDIUMINT NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `billing_address` TINYINT(1) NOT NULL,
  `client_id` MEDIUMINT UNSIGNED NOT NULL,
  CONSTRAINT `fk_address_client` FOREIGN KEY(`client_id`) REFERENCES `client`(`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
-- -----------------------------------------------------
-- Table `p4food_v5`.`creditcard`
-- -----------------------------------------------------
CREATE TABLE `creditcard` (
  `id` MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `card_number` BIGINT(16) UNSIGNED NOT NULL,
  `expiry_date` DATE NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `client_id` MEDIUMINT UNSIGNED NOT NULL,
  CONSTRAINT `fk_creditcard_client` FOREIGN KEY (`client_id`) REFERENCES `client`(`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
-- -----------------------------------------------------
-- Table `p4food_v5`.`payment`
-- -----------------------------------------------------
CREATE TABLE `payment` (
  `id` MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `payment_date` DATE NOT NULL,
  `pre-payment` TINYINT(1) NOT NULL,
  `validated` TINYINT(1) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
-- -----------------------------------------------------
-- Table `p4food_v5`.`order`
-- -----------------------------------------------------
CREATE TABLE `order` (
  `id` MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `order_date` DATE NOT NULL,
  `delivery` DATETIME NOT NULL,
  `delivery_status` TINYINT(1) NOT NULL,
  `price_totalTTC` DECIMAL(5,2) NOT NULL,
  `client_id` MEDIUMINT UNSIGNED NOT NULL,
  `payment_id` MEDIUMINT UNSIGNED NOT NULL,
  `supplier_id` TINYINT UNSIGNED NOT NULL,
  CONSTRAINT `fk_order_client` FOREIGN KEY (`client_id`) REFERENCES `client`(`id`),
  CONSTRAINT `fk_order_payment` FOREIGN KEY (`payment_id`) REFERENCES `payment`(`id`),
  CONSTRAINT `fk_order_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `supplier`(`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
-- -----------------------------------------------------
-- Table `p4food_v5`.`dish`
-- -----------------------------------------------------
CREATE TABLE `dish` (
  `id` SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `dish_type` ENUM('dish', 'dessert') NOT NULL,
  `dish_name` VARCHAR(45) NOT NULL,
  `dish_description` VARCHAR(255) NOT NULL,
  `added_date` DATE NOT NULL,
  `production_date` DATE NOT NULL,
  `price_unitHT` DECIMAL(5,2) UNSIGNED NOT NULL,
  `taxe_TVA100` DECIMAL(5,2) NOT NULL,
  `dish_picture` VARCHAR(255) NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
-- -----------------------------------------------------
-- Table `p4food_v5`.`quantity`
-- -----------------------------------------------------
CREATE TABLE `quantity` (
  `quantity` TINYINT UNSIGNED NOT NULL,
  `dish_id` SMALLINT UNSIGNED NOT NULL,
  `order_id` MEDIUMINT UNSIGNED NOT NULL,
  CONSTRAINT `fk_quantity_dish` FOREIGN KEY (`dish_id`) REFERENCES `dish`(`id`),
  CONSTRAINT `fk_quantity_order` FOREIGN KEY (`order_id`) REFERENCES `order`(`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
-- -----------------------------------------------------
-- Table `p4food_v5`.`stockdish`
-- -----------------------------------------------------
CREATE TABLE `stockdish` (
  `quantity` TINYINT UNSIGNED NOT NULL,
  `supplier_id` TINYINT UNSIGNED NOT NULL,
  `dish_id` SMALLINT UNSIGNED NOT NULL,
  CONSTRAINT `fk_stockdish_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `supplier`(`id`),
  CONSTRAINT `fk_stockdish_dish` FOREIGN KEY (`dish_id`) REFERENCES `dish`(`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;