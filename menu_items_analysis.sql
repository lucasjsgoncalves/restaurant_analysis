use restaurant_db;

-- Analisando a tabela menu_items tenho como objetivo:
-- 1 - Achar a quantidade de itens no menu.
SELECT COUNT(*) FROM menu_items;
-- R: O menu contém 32 itens.

-- 2 - Achar o item mais barato e o mais caro.
SELECT * FROM menu_items
ORDER BY price;
-- R: O prato mais barato é "Edamame" por 5.00

SELECT * FROM menu_items
ORDER BY price DESC;
-- R: O prato mais caro é "Shrimp Scampi" por 19.95

-- 3 - Descobrir a quantidade de pratos italianos.
SELECT 
    COUNT(*)
FROM
    menu_items
WHERE
    category = 'Italian';
-- R: Existem 9 pratos italianos 

-- 4 -  Achar o item mais barato e o mais caro no menu de pratos italianos.
SELECT 
    *
FROM
    menu_items
WHERE
    category = 'Italian'
ORDER BY price;
-- R: O prato italiano mais barato são "Spaghetti" e "Fettuccine Alfredo" ambos por 14.50

SELECT 
    *
FROM
    menu_items
WHERE
    category = 'Italian'
ORDER BY price DESC;
-- R: O prato italiano mais caro é "Shrimp Scampi" por 19.95

-- 5 - Quantos pratos diferentes existem em cada categoria.
SELECT 
    category, COUNT(menu_item_id) AS num_pratos
FROM
    menu_items
GROUP BY category;
-- R: Americano: 6, Asiático: 8, Mexicano: 9, Italiano: 9

-- 6 - Qual a média do preço dos pratos por categoria.
SELECT 
    category, ROUND(AVG(price),2) AS preco_medio
FROM
    menu_items
GROUP BY category;

-- R: Americano: 10.07, Asiático: 13.48, Mexicano: 11.80, Italiano: 16.75












