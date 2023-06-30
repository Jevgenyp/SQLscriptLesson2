CREATE TABLE sales (
    id INT PRIMARY KEY,
    order_date DATE,
    count_product INT
);

INSERT INTO sales (id, order_date, count_product)
VALUES 
(1, '2023-01-01', 50),
(2, '2023-01-02', 150),
(3, '2023-01-03', 350),
(4, '2023-01-04', 450),
(5, '2023-01-05', 250);
SELECT id,
       order_date,
       CASE
           WHEN count_product < 100 THEN 'Small'
           WHEN count_product BETWEEN 100 AND 300 THEN 'Medium'
           ELSE 'Big'
       END AS type_order
FROM sales;
CREATE TABLE orders (
    id INT PRIMARY KEY,
    employee_id INT,
    amount INT,
    order_status VARCHAR(255)
);

INSERT INTO orders (id, employee_id, amount, order_status)
VALUES 
(1, 101, 500, 'Delivered'),
(2, 102, 300, 'Processing'),
(3, 103, 200, 'Cancelled'),
(4, 104, 400, 'Delivered'),
(5, 105, 250, 'Processing');
SELECT id,
       employee_id,
       amount,
       CASE
           WHEN order_status = 'Delivered' THEN 'Order Delivered'
           WHEN order_status = 'Processing' THEN 'Order Processing'
           WHEN order_status = 'Cancelled' THEN 'Order Cancelled'
           ELSE 'Unknown Status'
       END AS full_order_status
FROM orders;
