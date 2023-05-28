-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными

DROP DATABASE IF EXISTS workhome_2;
CREATE DATABASE workhome_2;
USE workhome_2;
CREATE TABLE sales (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	order_date DATE NOT NULL,
	order_cnt INT NOT NULL);
INSERT sales(order_date, order_cnt) 
VALUES 	("2022-04-08", 148), 
		("2023-02-21", 348), 
		("2022-03-07", 31), 
		("2022-05-04", 385), 
		("2021-08-05", 75);    
SELECT * FROM sales;

-- 2. Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : меньше 100 - "Маленький заказ"; от 100 до 300 - "Средний заказ"; больше 300 - "Большой заказ";

SELECT id, order_date,
CASE 
	WHEN order_cnt < 100 THEN 'Маленький заказ'
	WHEN order_cnt >= 100 AND order_cnt <= 300 THEN 'Средний заказ'
	ELSE 'Большой заказ'
END AS Тип
FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями

CREATE TABLE orders (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	employee_id VARCHAR(5) NOT NULL UNIQUE DEFAULT 'e00',
	amount FLOAT(7,2) NOT NULL DEFAULT '0.00',
    order_status VARCHAR(15) NOT NULL DEFAULT 'OPEN'
);

INSERT INTO `orders` (employee_id, amount, order_status)
VALUES 
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');

SELECT * FROM orders;
 -- Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
-- OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED - «Order is cancelled»
SELECT employee_id,	amount,
    CASE order_status 
		WHEN 'OPEN' THEN 'Order is in open state'
		WHEN 'CLOSED' THEN 'Order is closed'
		WHEN 'CANCELLED' THEN 'Order is cancelled'
	END AS 'full_order_status'	
FROM orders;
