/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80400 (8.4.0)
 Source Host           : localhost:3306
 Source Schema         : minh

 Target Server Type    : MySQL
 Target Server Version : 80400 (8.4.0)
 File Encoding         : 65001

 Date: 15/05/2024 11:18:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands`  (
  `brand_id` int NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `phone_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `brand_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `manager` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `created_date` datetime NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`brand_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES (3, 'NXB Kim Dong', '0966141566', 'Cau Giay- Ha Noi', 'To Tan Loc', 'Deactive', '2023-04-22 02:49:02', '2023-05-13 15:26:09');
INSERT INTO `brands` VALUES (4, 'NXB Phuong Nam', '0467532198', 'Hoang Mai- Ha Noi', 'Nguyen Van Tai', 'Active', '2023-04-22 02:49:02', NULL);
INSERT INTO `brands` VALUES (5, 'NXB Nha Nam', '19001265', 'Thanh pho Ho Chi Minh', 'Bui Phuong Thanh', 'Active', '2023-04-22 02:49:02', NULL);
INSERT INTO `brands` VALUES (6, 'NXB Tri Viet ', '1234987601', 'Thanh Pho Ho Chi Minh', 'Bui Le Phuong', 'Active', '2023-04-22 02:49:02', NULL);
INSERT INTO `brands` VALUES (7, 'NXB Penguin Random House', '088812567', 'Australian', 'Jolie', 'Active', '2023-04-22 02:49:02', NULL);
INSERT INTO `brands` VALUES (8, 'Tre Publishing House', '0746284624', 'English', 'Do Thu Hien Hien', 'Active', '2023-04-22 02:49:02', NULL);
INSERT INTO `brands` VALUES (9, 'William Morrow', '7543295847', 'USa', 'Bui Q Long', 'Active', '2023-04-22 02:49:02', NULL);

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts`  (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`cart_id`) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `customers` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of carts
-- ----------------------------
INSERT INTO `carts` VALUES (20, 5, 18, 20, '2023-05-13 17:12:58', '2023-05-13 17:13:19');
INSERT INTO `carts` VALUES (21, 2, 18, 19, '2023-05-13 17:12:58', NULL);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `staff_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`) USING BTREE,
  INDEX `staff_id`(`staff_id` ASC) USING BTREE,
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Test', 'test', 15, '2023-03-22 09:26:55', NULL);
INSERT INTO `categories` VALUES (2, '31233', '3123', 15, '2023-03-28 14:31:59', NULL);
INSERT INTO `categories` VALUES (3, 'Children\'s Books', 'Fiction is a genre of long literary books, written according to an imaginary plot with imaginary cha', 15, '2023-04-22 02:49:02', '2023-04-22 17:50:32');
INSERT INTO `categories` VALUES (4, 'Dictionaries & Languages', 'Textbooks are materials used in education and approved by governments or educational institutions. T', 15, '2023-04-22 02:49:02', '2023-04-22 17:50:44');
INSERT INTO `categories` VALUES (5, 'Fiction', 'Comic books are a special genre of books, usually written with pictures and dialogue. Comics cover a', 15, '2023-04-22 02:49:02', '2023-04-22 17:51:02');
INSERT INTO `categories` VALUES (6, 'Personal Development', 'Science fiction books are a genre of books in which the author uses modern science and technology to', 15, '2023-04-22 02:49:02', '2023-04-22 17:51:08');
INSERT INTO `categories` VALUES (7, 'Education & Reference', 'Science books are documents written on science, technology, medicine, mathematics, physics, chemistr', 15, '2023-04-22 02:49:02', '2023-04-22 17:51:18');
INSERT INTO `categories` VALUES (8, 'Health', 'Cookbooks are educational materials about the art of cooking and food preparation. These books can i', 15, '2023-04-22 02:49:02', '2023-04-22 17:51:26');
INSERT INTO `categories` VALUES (9, 'Food & Drink', 'History books are educational documents about human development, events, characters, and culture of ', 15, '2023-04-22 02:49:02', '2023-04-22 17:51:34');
INSERT INTO `categories` VALUES (10, 'Graphic Novels, Anime & Manga', '\"Graphic Novels\", \"Anime\", and \"Manga\" are different genres of comic culture.', 15, '2023-04-22 02:49:02', NULL);
INSERT INTO `categories` VALUES (11, 'Technology & Engineering', 'Technology & Engineering is a field related to engineering science that mainly focuses on applying s', 15, '2023-04-22 02:49:02', NULL);
INSERT INTO `categories` VALUES (12, 'Sport Book', 'Sports are an important area in many people\'s lives, and there are many kinds of books written on th', 15, '2023-04-22 02:49:02', NULL);
INSERT INTO `categories` VALUES (13, 'Business, Finance & Management', 'Books on Business, Finance and Management are rich and varied, covering a wide variety of topics suc', 15, '2023-04-23 09:15:54', NULL);
INSERT INTO `categories` VALUES (14, 'Art & Photography', 'Covers a wide variety of topics such as art history, art analysis, photography techniques, photograp', 15, '2023-04-23 09:15:54', NULL);
INSERT INTO `categories` VALUES (15, 'Humour', 'Books are loved by many people because they bring readers moments of relaxation and fun', 15, '2023-04-23 09:15:54', NULL);
INSERT INTO `categories` VALUES (16, 'Medical', 'Books about medicine and health care are always one of the top topics of interest, especially in thi', 15, '2023-04-23 09:15:54', NULL);

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `first_name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `last_name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `date_of_birth` date NULL DEFAULT NULL,
  `profile_status` tinyint NULL DEFAULT 0,
  `phone` int NULL DEFAULT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `refresh_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `reset_password_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `reset_token_expires` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES (16, '12312', '312', '3123', NULL, 1, 31231231, 'img/1680082858-ancolor.png', '$2b$10$AxU9rCu4pkRuCH3OL08htu5SId8J0PQ/INwVpo7S7CktUJ1Li4Wku', '2023-03-29 09:40:55', '2023-03-29 09:43:53', 'minh', NULL, NULL, NULL, 'female');
INSERT INTO `customers` VALUES (18, 'Cong Minh', 'Minh', 'Cong', NULL, 0, 2147483647, 'img/male.jpg', '$2b$10$AxU9rCu4pkRuCH3OL08htu5SId8J0PQ/INwVpo7S7CktUJ1Li4Wku', '2023-04-19 10:16:30', '2023-05-13 17:23:56', 'minh@gmail.com', NULL, NULL, NULL, 'Male');
INSERT INTO `customers` VALUES (19, '', '312', '3123123', NULL, 0, 2147483647, 'img/male.jpg', '$2b$10$AxU9rCu4pkRuCH3OL08htu5SId8J0PQ/INwVpo7S7CktUJ1Li4Wku', '2023-04-28 15:54:44', NULL, 'minh@gmail.com', NULL, NULL, NULL, 'Male');

-- ----------------------------
-- Table structure for details
-- ----------------------------
DROP TABLE IF EXISTS `details`;
CREATE TABLE `details`  (
  `detail_id` int NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `product_id` int NOT NULL,
  `order_id` int NOT NULL,
  `promotion_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`detail_id`) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  INDEX `order_id`(`order_id` ASC) USING BTREE,
  INDEX `promotion_id`(`promotion_id` ASC) USING BTREE,
  CONSTRAINT `details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `details_ibfk_3` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`promotion_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of details
-- ----------------------------
INSERT INTO `details` VALUES (1, 1, 18, 1, 6, '2023-04-19 17:36:18', NULL);
INSERT INTO `details` VALUES (4, 4, 20, 4, NULL, '2023-04-28 09:55:05', NULL);
INSERT INTO `details` VALUES (6, 200, 17, 4, NULL, '2023-04-28 09:55:05', NULL);
INSERT INTO `details` VALUES (7, 3, 18, 8, NULL, '2023-05-10 14:43:54', NULL);
INSERT INTO `details` VALUES (8, 3, 18, 9, NULL, '2023-05-10 14:44:12', NULL);
INSERT INTO `details` VALUES (9, 4, 23, 9, NULL, '2023-05-10 14:44:12', NULL);
INSERT INTO `details` VALUES (10, 1, 17, 9, NULL, '2023-05-10 14:44:12', NULL);
INSERT INTO `details` VALUES (11, 2, 18, 10, NULL, '2023-05-10 14:45:19', NULL);
INSERT INTO `details` VALUES (12, 0, 17, 11, NULL, '2023-05-11 17:48:18', NULL);
INSERT INTO `details` VALUES (14, 2, 23, 12, NULL, '2023-05-11 17:48:18', NULL);
INSERT INTO `details` VALUES (15, 1, 24, 12, NULL, '2023-05-11 17:48:18', NULL);
INSERT INTO `details` VALUES (16, 1, 24, 13, NULL, '2023-05-11 17:48:18', NULL);
INSERT INTO `details` VALUES (17, 1, 17, 15, NULL, '2023-05-11 17:48:18', NULL);
INSERT INTO `details` VALUES (18, 1, 19, 15, NULL, '2023-05-11 17:48:18', NULL);
INSERT INTO `details` VALUES (19, 1, 17, 18, NULL, '2023-05-11 18:24:24', NULL);
INSERT INTO `details` VALUES (20, 1, 23, 18, NULL, '2023-05-11 18:24:24', NULL);

-- ----------------------------
-- Table structure for favorites
-- ----------------------------
DROP TABLE IF EXISTS `favorites`;
CREATE TABLE `favorites`  (
  `favorite_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`favorite_id`) USING BTREE,
  INDEX `fk_favorite_1`(`user_id` ASC) USING BTREE,
  INDEX `fk_favorite_2`(`product_id` ASC) USING BTREE,
  CONSTRAINT `fk_favorite_1` FOREIGN KEY (`user_id`) REFERENCES `customers` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_favorite_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of favorites
-- ----------------------------
INSERT INTO `favorites` VALUES (4, 18, 23, '2023-05-11 17:48:18');

-- ----------------------------
-- Table structure for imports
-- ----------------------------
DROP TABLE IF EXISTS `imports`;
CREATE TABLE `imports`  (
  `import_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `amount` int NOT NULL,
  `price` int NOT NULL,
  `supplier_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`import_id`) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  INDEX `supplier_id`(`supplier_id` ASC) USING BTREE,
  CONSTRAINT `key1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `key23` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of imports
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  `promotion_id` int NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customers` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 16, '2023-04-19 17:08:34', '2023-04-19 17:29:49', NULL, 'paid');
INSERT INTO `orders` VALUES (3, 16, '2023-04-28 09:55:05', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (4, 16, '2023-04-28 09:55:05', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (8, 18, '2023-05-10 14:43:54', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (9, 18, '2023-05-10 14:44:12', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (10, 18, '2023-05-10 14:45:19', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (11, 18, '2023-05-11 17:48:18', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (12, 18, '2023-05-11 17:48:18', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (13, 18, '2023-05-11 17:48:18', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (14, 18, '2023-05-11 17:48:18', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (15, 18, '2023-05-11 17:48:18', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (16, 18, '2023-05-11 17:48:18', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (17, 18, '2023-05-11 17:48:18', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (18, 18, '2023-05-11 18:24:24', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `permission_id` int NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for product_comments
-- ----------------------------
DROP TABLE IF EXISTS `product_comments`;
CREATE TABLE `product_comments`  (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `comment` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `anonymous` tinyint NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `product_comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customers` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_comments_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_comments
-- ----------------------------
INSERT INTO `product_comments` VALUES (2, 18, 15, 'Hehehee', 0, '2023-04-22 17:29:42', NULL);
INSERT INTO `product_comments` VALUES (3, 18, 15, 'Hehehee', 0, '2023-04-22 17:30:56', NULL);
INSERT INTO `product_comments` VALUES (4, 18, 15, 'Hehehee', 0, '2023-04-22 17:31:23', NULL);
INSERT INTO `product_comments` VALUES (5, 18, 15, 'Hehehee', 0, '2023-04-22 17:31:49', NULL);
INSERT INTO `product_comments` VALUES (6, 18, 15, 'Hehehee', 0, '2023-04-22 17:32:12', NULL);
INSERT INTO `product_comments` VALUES (7, 18, 23, 'he', 0, '2023-05-11 17:48:18', NULL);

-- ----------------------------
-- Table structure for product_documents
-- ----------------------------
DROP TABLE IF EXISTS `product_documents`;
CREATE TABLE `product_documents`  (
  `document_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `document` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `file_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`document_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `product_documents_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_documents_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_documents
-- ----------------------------
INSERT INTO `product_documents` VALUES (12, NULL, 23, '1682187750-8936066694032.jpg', 'jpg', '2023-04-22 02:49:02', NULL);
INSERT INTO `product_documents` VALUES (15, NULL, 22, '1682188000-1_.jpg', 'jpg', '2023-04-22 02:49:02', NULL);
INSERT INTO `product_documents` VALUES (17, NULL, 17, '1682188165-4.png', 'png', '2023-04-22 02:49:02', NULL);
INSERT INTO `product_documents` VALUES (18, NULL, 18, '1682188231-56.jpe', 'jpe', '2023-04-22 02:49:02', NULL);
INSERT INTO `product_documents` VALUES (19, NULL, 19, '1682188354-190423-3.jpg', 'jpg', '2023-04-22 02:49:02', NULL);
INSERT INTO `product_documents` VALUES (20, NULL, 24, '1682188354-6.jfif', 'jfif', '2023-04-22 02:49:02', NULL);
INSERT INTO `product_documents` VALUES (21, NULL, 25, '1682188466-9.jpg', 'jpg', '2023-04-22 02:49:02', NULL);
INSERT INTO `product_documents` VALUES (22, NULL, 26, '1682188742-9781541700437.jpg', 'jpg', '2023-04-22 02:49:02', NULL);
INSERT INTO `product_documents` VALUES (23, NULL, 27, '1682188897-9781108430425.jpg', 'jpg', '2023-04-22 02:49:02', NULL);
INSERT INTO `product_documents` VALUES (24, NULL, 28, '1682260884-children\'s-books0.jpg', 'jpg', '2023-04-23 09:15:54', NULL);
INSERT INTO `product_documents` VALUES (25, NULL, 29, '1682261008-children-book1.jpg', 'jpg', '2023-04-23 09:15:54', NULL);
INSERT INTO `product_documents` VALUES (26, NULL, 30, '1682261195-hida.jpg', 'jpg', '2023-04-23 09:15:54', NULL);
INSERT INTO `product_documents` VALUES (27, NULL, 31, '1682261304-gangjpg.jpg', 'jpg', '2023-04-23 09:15:54', NULL);
INSERT INTO `product_documents` VALUES (28, NULL, 32, '1682263337-190423-6_1.jpg', 'jpg', '2023-04-23 09:15:54', NULL);
INSERT INTO `product_documents` VALUES (29, NULL, 20, '1682263337-190423-6_1.jpg', 'jpg', '2023-05-11 22:17:14', NULL);
INSERT INTO `product_documents` VALUES (31, NULL, 21, '1682188354-6.jfif', 'jfif', '2023-05-11 22:18:04', NULL);
INSERT INTO `product_documents` VALUES (32, NULL, 33, '1715746607-429776152_2105217893187282_4833964181801606333_n.jpg', 'jpg', '2024-05-15 04:00:22', NULL);

-- ----------------------------
-- Table structure for product_votes
-- ----------------------------
DROP TABLE IF EXISTS `product_votes`;
CREATE TABLE `product_votes`  (
  `vote_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `vote` tinyint NOT NULL,
  PRIMARY KEY (`vote_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `product_votes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customers` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_votes_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_votes
-- ----------------------------
INSERT INTO `product_votes` VALUES (17, 16, 18, 1);

-- ----------------------------
-- Table structure for product_watches
-- ----------------------------
DROP TABLE IF EXISTS `product_watches`;
CREATE TABLE `product_watches`  (
  `watch_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`watch_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `product_watches_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customers` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_watches_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_watches
-- ----------------------------
INSERT INTO `product_watches` VALUES (8, 18, 18, '2023-05-11 14:40:44');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `category_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  `price` int NULL DEFAULT NULL,
  `amount` int NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT NULL,
  `brand_id` int NULL DEFAULT NULL,
  `supplier_id` int NULL DEFAULT NULL,
  `brand_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `supplier_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `promotion` int NULL DEFAULT NULL,
  `sold` int NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `category_id`(`category_id` ASC) USING BTREE,
  INDEX `products_ibfk_3`(`supplier_id` ASC) USING BTREE,
  INDEX `products_ibfk_4`(`brand_id` ASC) USING BTREE,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_4` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (17, NULL, 'a book on product design for users, helping readers better understand how product design works and how to improve user experience.', 4, '2023-04-22 02:49:02', NULL, 870000, 2, 'The Design of Everyday Things', NULL, NULL, NULL, 'NXB Phuong Nam', 'Hoa Hoc Tro', NULL, NULL, 'Don Norman');
INSERT INTO `products` VALUES (18, NULL, '“Character design for the new chapter.\r\n\r\nI discussed with Mr. Toriyama countless times before finally finalizing the image of Granola and Heeter, but in the end, the image of Monaito and the planet Sugar still had to rely on Mr. see at the end of this bo', 6, '2023-04-22 02:49:02', NULL, 50000, 0, 'Dragon Ball Super', NULL, NULL, NULL, 'NXB Kim Dong', 'BookStore Plus', NULL, NULL, 'Akira Toriyama, Toyotarou');
INSERT INTO `products` VALUES (19, NULL, 'A magical novel about strange events in the history of a family in Morocco.', 3, '2023-04-22 02:49:02', NULL, 555000, 5, 'One Hundred Years of Solitude', NULL, NULL, NULL, 'NXB Nha Nam', 'Thai Ha Book', NULL, NULL, 'Gabriel Garcia Marquez');
INSERT INTO `products` VALUES (20, NULL, 'Cookbooks are educational materials about the art of cooking and food preparation. These books can include instructions on how to choose ingredients, how to prepare and use cookware, recipes, how to prepare dishes from simple to complex, and how to garnis', 11, '2023-04-22 02:49:02', NULL, 70000, 4, 'How to Cook Everything', NULL, NULL, NULL, 'NXB Tri Viet ', 'Fahasa', NULL, NULL, 'Mark Bittman');
INSERT INTO `products` VALUES (21, NULL, 'The Great Gatsby (Pretty Books - Painted Editions)\r\nOne of literature\'s most decadent stories is now available in an exclusive collector\'s edition, featuring beautiful cover art from artist Laci Fowler and decorative interior pages, making it ideal for fi', 7, '2023-04-22 02:49:02', NULL, 30000, 7, 'The Great Gatsby (Pretty Books - Painted Editions)', NULL, NULL, NULL, 'NXB Penguin Random House', 'Vina Book', NULL, NULL, 'F. Scott Fitzgerald');
INSERT INTO `products` VALUES (22, NULL, '\"The Universe in the Palm of Your Hand\" is a science fiction book by British author Michael Brooks. This book was written to introduce complex scientific concepts of the universe in a simpler and easier to understand way for readers. The author attempts ', 12, '2023-04-22 02:49:02', NULL, 300000, 6, 'Infinity in the Palm of Your Hand', NULL, NULL, NULL, 'William Morrow', 'Nhan Tri Viet BookStore', NULL, NULL, 'Carl Sagan');
INSERT INTO `products` VALUES (23, NULL, '\"Death Note\" is a Japanese manga written and illustrated by Tsugumi Ohba and Takeshi Obata. The story revolves around the main character Light Yagami, an extremely intelligent and lucid student who receives a notebook called \"Death Note\" from a Shinigami ', 6, '2023-04-22 02:49:02', NULL, 99999, 8, 'Death Note', NULL, NULL, NULL, 'NXB Phuong Nam', 'Thai Ha Book', NULL, NULL, 'Anime');
INSERT INTO `products` VALUES (24, NULL, 'Suzume (Japanese: すずめの戸締まり, Hepburn: Suzume no Tojimari, lit. \"Suzume\'s Locking Up\") is a 2022 Japanese animated fantasy adventure film written and directed by Makoto Shinkai, produced by CoMix Wave Films, and distributed by Toho. The film features the vo', 10, '2023-04-22 02:49:02', NULL, 40000, 8, 'Suzume', NULL, NULL, NULL, 'NXB Tri Viet ', 'BookStore Plus', NULL, NULL, 'Masayoshi Tanaka');
INSERT INTO `products` VALUES (25, NULL, 'Doraemon is a robotic cat that comes from the 22nd century. He comes to 20th century and stays with Nobi Family. The Nobis love Doraemon very much. So Doraemon always help the Nobis with the devices from 22nd century.', 12, '2023-04-22 02:49:02', NULL, 15000, 1, 'Doremon', NULL, NULL, NULL, 'NXB Phuong Nam', 'Fahasa', NULL, NULL, ' Fujio F. Fujiko');
INSERT INTO `products` VALUES (26, NULL, 'A Wall Street Journal bestseller\r\n\r\nFrom the CEO and President of the Society for Human Resource Management (SHRM) comes the ultimate book on transforming the way we select, retain and train our employees in a radically changed business environment.\r\n \r\nW', 3, '2023-04-22 02:49:02', NULL, 45000, 1, 'Reset', NULL, NULL, NULL, 'NXB Kim Dong', 'BookStore Plus', NULL, NULL, 'Amokawho');
INSERT INTO `products` VALUES (27, NULL, 'An English book is a book that is written in the English language. It can be a work of fiction, non-fiction, or any other genre, and can cover a wide range of topics. English books can be found in many different formats, including print, digital, and audi', 4, '2023-04-22 02:49:02', NULL, 75000, 1, 'English', NULL, NULL, NULL, 'NXB Phuong Nam', 'Nhan Tri Viet BookStore', NULL, NULL, 'hisubfo');
INSERT INTO `products` VALUES (28, NULL, 'Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, o', 3, '2023-04-23 09:15:54', NULL, 166000, 1, 'Harry Potter and the Philosopher\'s Stone', NULL, NULL, NULL, 'Tre Publishing House', 'Richmond', NULL, NULL, 'J K Rowling');
INSERT INTO `products` VALUES (29, NULL, 'The extraordinary #1 New York Times bestseller that has captivated over 1 million readers and inspired a movement to choose kind. I won\'t describe what I look like. Whatever you\'re thinking, it\'s probably worse. August Pullman was born with a facial diffe', 3, '2023-04-23 09:15:54', NULL, 168000, 1, 'Wonder', NULL, NULL, NULL, 'NXB Penguin Random House', 'Company TNHH Book Ha Giang', NULL, NULL, 'R J Palacio');
INSERT INTO `products` VALUES (30, NULL, '\"Luke Pearson is one of the best cartoonists working today. Hilda is utterly brilliant!\"\r\n—Raina Telgemeier, creator of Smile\r\n\r\nThis brand new paperback edition of Hilda and the Troll offers a fresh chance to read the very first outing in Luke Pearson\'s ', 5, '2023-04-23 09:15:54', NULL, 190000, 1, 'Hilda and the troll', NULL, NULL, NULL, 'NXB Nha Nam', 'Book Point', NULL, NULL, 'Luke Pearson');
INSERT INTO `products` VALUES (31, NULL, 'Gangsta Granny\r\n\r\nAnother hilarious and moving novel from bestselling, critically acclaimed author David Walliams, the natural successor to Roald Dahl. A story of prejudice and acceptance, funny lists and silly words, this new book has all the hallmarks o', 13, '2023-04-23 09:15:54', NULL, 130000, 1, 'Gangsta Granny', NULL, NULL, NULL, 'Tre Publishing House', 'Cambridge University Press', NULL, NULL, 'David Walliams');
INSERT INTO `products` VALUES (32, NULL, 'aaaaaaaaa', 3, '2023-04-23 09:15:54', NULL, 0, 1, 'aaaaaaaa1', NULL, NULL, NULL, 'NXB Nha Nam', 'Hoa Hoc Tro', NULL, NULL, 'aaaaaa');
INSERT INTO `products` VALUES (33, NULL, '3213', 6, '2024-05-15 04:00:22', NULL, 312, 0, '321', NULL, NULL, NULL, 'Tre Publishing House', 'BookStore Plus', NULL, NULL, '3123');

-- ----------------------------
-- Table structure for promotions
-- ----------------------------
DROP TABLE IF EXISTS `promotions`;
CREATE TABLE `promotions`  (
  `promotion_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `discount` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `category_id` int NULL DEFAULT NULL,
  `supplier_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`promotion_id`) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  INDEX `category_id`(`category_id` ASC) USING BTREE,
  INDEX `supplier_id`(`supplier_id` ASC) USING BTREE,
  CONSTRAINT `promotions_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `promotions_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `promotions_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of promotions
-- ----------------------------
INSERT INTO `promotions` VALUES (6, '3123123', '123', '31231', 2, 2, NULL, '2023-04-11 14:59:02', '2023-05-13 16:42:35');
INSERT INTO `promotions` VALUES (7, 'test1', '1002321', 'abc', 3, 3, NULL, '2023-05-13 16:06:12', '2023-05-13 16:45:53');

-- ----------------------------
-- Table structure for role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_permissions`;
CREATE TABLE `role_permissions`  (
  `permission_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `role_id`(`role_id` ASC) USING BTREE,
  CONSTRAINT `role_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`permission_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_permissions_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'staff');
INSERT INTO `roles` VALUES (2, 'admin');
INSERT INTO `roles` VALUES (3, 'qa_coordinator');
INSERT INTO `roles` VALUES (4, 'qa_manager');

-- ----------------------------
-- Table structure for suppliers
-- ----------------------------
DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers`  (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `supplier_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `phone_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `manager` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `created_date` datetime NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`supplier_id`) USING BTREE,
  INDEX `supplier_id`(`supplier_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of suppliers
-- ----------------------------
INSERT INTO `suppliers` VALUES (1, 'Rule 1', '', '096614156', 'Hoang Tuan Hai', 'Active', '2023-03-28 15:09:16', '2023-05-13 15:27:18');
INSERT INTO `suppliers` VALUES (2, '312', '', '3123', '123', '312', '2023-03-28 15:09:16', NULL);
INSERT INTO `suppliers` VALUES (3, 'Fahasa', '', '190006543', 'Chu Thi Thuy', 'Active', '2023-04-22 02:49:02', NULL);
INSERT INTO `suppliers` VALUES (4, 'BookStore Plus', '', '099992134', 'Bui Phuong Le', 'Active', '2023-04-22 02:49:02', NULL);
INSERT INTO `suppliers` VALUES (5, 'Thai Ha Book', '', '077775436', 'LongBQ', 'Active', '2023-04-22 02:49:02', NULL);
INSERT INTO `suppliers` VALUES (6, 'Vina Book', '', '0111169872', 'Thanh Phuong ', 'Active', '2023-04-22 02:49:02', NULL);
INSERT INTO `suppliers` VALUES (7, 'Hoa Hoc Tro', '', '087694532', 'Ngo Khanh Hoa', 'Active', '2023-04-22 02:49:02', NULL);
INSERT INTO `suppliers` VALUES (8, 'Nhan Tri Viet BookStore', '', '0769341221', 'Chi Le', 'Active', '2023-04-22 02:49:02', NULL);
INSERT INTO `suppliers` VALUES (11, 'Random House', '', '0987364132', 'HienDTT', 'Active', '2023-04-23 09:15:54', NULL);
INSERT INTO `suppliers` VALUES (12, 'Book Point', '', '06472945192', 'ThuyTT', 'Active', '2023-04-23 09:15:54', NULL);
INSERT INTO `suppliers` VALUES (13, 'Cambridge University Press', '', '0983199346', 'QuangNH', 'Active', '2023-04-23 09:15:54', NULL);
INSERT INTO `suppliers` VALUES (14, 'Simon And Schuster', '', '083264876', 'PhuongBL', 'Active', '2023-04-23 09:15:54', NULL);
INSERT INTO `suppliers` VALUES (15, 'Brown Watson ', '', '0765243843', 'PhuongDA', 'Active', '2023-04-23 09:15:54', NULL);
INSERT INTO `suppliers` VALUES (16, 'Company TNHH Book Ha Giang', '', '05482769472', 'HuongPTL', 'Active', '2023-04-23 09:15:54', NULL);
INSERT INTO `suppliers` VALUES (17, 'Richmond', '', '0963878991', 'DuyNV', 'Active', '2023-04-23 09:15:54', NULL);

-- ----------------------------
-- Table structure for supports
-- ----------------------------
DROP TABLE IF EXISTS `supports`;
CREATE TABLE `supports`  (
  `support_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`support_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of supports
-- ----------------------------
INSERT INTO `supports` VALUES (1, 'Hienb', '0966141598', 'heinluxuryfi@gmail.com', 'test test', 'received', NULL, '2023-04-19 10:04:25');

-- ----------------------------
-- Table structure for user_addresses
-- ----------------------------
DROP TABLE IF EXISTS `user_addresses`;
CREATE TABLE `user_addresses`  (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`address_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `user_addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_addresses
-- ----------------------------

-- ----------------------------
-- Table structure for user_emails
-- ----------------------------
DROP TABLE IF EXISTS `user_emails`;
CREATE TABLE `user_emails`  (
  `email_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`email_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `user_emails_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_emails
-- ----------------------------

-- ----------------------------
-- Table structure for user_messages
-- ----------------------------
DROP TABLE IF EXISTS `user_messages`;
CREATE TABLE `user_messages`  (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `message` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `sender_id` int NULL DEFAULT NULL,
  `receiver_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`message_id`) USING BTREE,
  INDEX `receiver_id`(`receiver_id` ASC) USING BTREE,
  INDEX `sender_id`(`sender_id` ASC) USING BTREE,
  CONSTRAINT `user_messages_ibfk_1` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_messages_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_messages
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `first_name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `last_name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `date_of_birth` date NULL DEFAULT NULL,
  `profile_status` tinyint NULL DEFAULT 0,
  `phone` int NULL DEFAULT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `role_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `refresh_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `reset_password_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `reset_token_expires` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `role_id`(`role_id` ASC) USING BTREE,
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (15, 'cong minh', 'minh', 'cong', NULL, 0, 966141598, 'img/1679389121-1663922085-clinic-289974754_199470302406974_1479188202197616939_n.jpg', '$2b$10$AxU9rCu4pkRuCH3OL08htu5SId8J0PQ/INwVpo7S7CktUJ1Li4Wku', 2, '2023-03-21 08:57:26', NULL, 'minh', NULL, NULL, NULL, 'female');
INSERT INTO `users` VALUES (19, '312312', '231', '2312', NULL, 0, 312312, 'img/female.jpg', '$2b$10$AxU9rCu4pkRuCH3OL08htu5SId8J0PQ/INwVpo7S7CktUJ1Li4Wku', 1, '2023-05-13 15:21:02', NULL, 'hien123', NULL, NULL, NULL, 'female');
INSERT INTO `users` VALUES (20, 'data.full_name', 'data.first_name', 'data.last_name', NULL, 0, 312312321, 'img/male.jpg', '$2b$10$AxU9rCu4pkRuCH3OL08htu5SId8J0PQ/INwVpo7S7CktUJ1Li4Wku', 2, '2024-02-26 07:02:43', NULL, 'data.username', NULL, NULL, NULL, 'data.gender');
INSERT INTO `users` VALUES (21, 'data.full_name', 'data.first_name', 'data.last_name', NULL, 0, 312312321, 'img/male.jpg', '$2b$10$AxU9rCu4pkRuCH3OL08htu5SId8J0PQ/INwVpo7S7CktUJ1Li4Wku', 2, '2024-02-26 07:02:43', NULL, 'data.username1', NULL, NULL, NULL, 'data.gender');

SET FOREIGN_KEY_CHECKS = 1;
