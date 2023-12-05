SELECT cs.company_name, last_name || ' ' || first_name
FROM orders AS o
JOIN customers AS cs USING(customer_id)
JOIN employees AS e USING(employee_id)
JOIN shippers AS s ON o.ship_via = s.shipper_id
WHERE cs.city = 'London' AND e.city = 'London' 
      AND s.company_name = 'Speedy Express';
	  
SELECT product_name, units_in_stock, contact_name, phone
FROM products
JOIN suppliers USING(supplier_id)
JOIN categories AS c USING(category_id)
WHERE c.category_name IN ('Beverages', 'Seafood') AND  discontinued <> 1
      AND units_in_stock < 20
ORDER BY units_in_stock DESC;

SELECT DISTINCT contact_name, order_id
FROM customers
LEFT JOIN orders USING(customer_id)
WHERE order_id IS NULL;

SELECT DISTINCT contact_name, order_id
FROM orders
RIGHT JOIN customers USING(customer_id)
WHERE order_id IS NULL;