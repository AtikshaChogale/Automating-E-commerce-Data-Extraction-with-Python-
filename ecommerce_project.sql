CREATE DATABASE Ecommerce;

USE Ecommerce;

SELECT * FROM products;

SELECT id, title, price, stock, brand
FROM products
WHERE price IS NULL
OR stock IS NULL
OR brand IS NULL;

SELECT id, title, price, stock
FROM products
WHERE price <= 0 OR stock <0;

UPDATE products
SET reviews = REPLACE(reviews, '''', '"')
WHERE reviews LIKE '%''%';

SELECT title,
	JSON_EXTRACT(reviews, '$[0].rating') AS Rating,
    stock
FROM products
WHERE stock < 10
AND Rating>4.5;


SELECT category, 
	ROUND(AVG(price),2) AS Avg_price,
    COUNT(*) AS Total_products
FROM products
GROUP BY category
ORDER BY Avg_price;


SELECT category,
	SUM(price*stock) AS Revenue,
    COUNT(*) AS Total
FROM products
GROUP BY category
ORDER BY Revenue DESC;

SELECT category, title, discountPercentage,
	JSON_EXTRACT(reviews, '$[0].rating') AS Rating
FROM products
WHERE discountPercentage>0
ORDER BY discountPercentage DESC;