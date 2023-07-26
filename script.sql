CREATE TABLE `product` (
  `idproduct` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` text,
  `image` longblob,
  `price` double NOT NULL,
  PRIMARY KEY (`idproduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `users` (
  `idusers` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(128) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`idusers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `ordered_items` (
  `idordered_items` int NOT NULL AUTO_INCREMENT,
  `idproduct` int DEFAULT NULL,
  `count` int DEFAULT '1',
  PRIMARY KEY (`idordered_items`),
  KEY `idproduct_idx` (`idproduct`),
  CONSTRAINT `ordered_items_product_id_fk` FOREIGN KEY (`idproduct`) REFERENCES `product` (`idproduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `order` (
  `idorder` int NOT NULL AUTO_INCREMENT,
  `idusers` int DEFAULT NULL,
  `idordered_items` int DEFAULT NULL,
  `order_date` datetime NOT NULL,
  `ordernum` int NOT NULL,
  PRIMARY KEY (`idorder`),
  KEY `order_user_id_fk_idx` (`idusers`),
  KEY `order_ordered_items_id_fk_idx` (`idordered_items`),
  CONSTRAINT `order_ordered_items_id_fk` FOREIGN KEY (`idordered_items`) REFERENCES `ordered_items` (`idordered_items`),
  CONSTRAINT `order_user_id_fk` FOREIGN KEY (`idusers`) REFERENCES `users` (`idusers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci