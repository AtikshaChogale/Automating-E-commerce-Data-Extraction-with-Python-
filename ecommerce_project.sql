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

SELECT title, reviews, stock
FROM products
WHERE stock<10 ;

UPDATE products
SET reviews = REPLACE(reviews, '''', '"')
WHERE reviews LIKE '%''%';

SELECT title,
	JSON_EXTRACT(reviews, '$[0].rating') AS Rating,
    stock
FROM products
WHERE stock < 10
AND Rating>4.5;