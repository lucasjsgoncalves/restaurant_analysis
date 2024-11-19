-- Agora vou analisar ambas as tabelas juntas

-- 1 - Criar uma nova tabela combinando menu_items e order_details.
SELECT 
    *
FROM
    order_details
        LEFT JOIN
    menu_items ON order_details.item_id = menu_items.menu_item_id;
-- 2 - Quais são os itens mais e menos pedidos e quais são suas categorias.
SELECT 
    item_name, category, COUNT(order_details_id) AS num_compras
FROM
    order_details
        LEFT JOIN
    menu_items ON order_details.item_id = menu_items.menu_item_id
GROUP BY item_name , category
ORDER BY num_compras;
-- R: O item mais pedido é 'Hamburger' da categoria 'American' e o menos pedido é o 'Chicken Tacos' da categoria 'Mexican'

-- 3 - Quais foram os 5 pedidos mais caros.
SELECT 
    order_id, SUM(price) AS total_gasto
FROM
    order_details
        LEFT JOIN
    menu_items ON order_details.item_id = menu_items.menu_item_id
GROUP BY order_id
ORDER BY total_gasto DESC
LIMIT 5;
-- R: Sendo respectivamente id e total gasto no pedido, ('440', '192.15'),('2075', '191.05'), 
-- ('1957', '190.10'), ('330', '189.70'), ('2675', '185.10')


-- 4 - Averiguando em detalhes o maior pedido.
SELECT 
    category, COUNT(item_id) AS num_itens
FROM
    order_details
        LEFT JOIN
    menu_items ON order_details.item_id = menu_items.menu_item_id
WHERE
    order_id = 440
GROUP BY category;
-- R: 
-- category | num_itens
-- Mexican		2
-- American		2
-- Italian		8
-- Asian		2
-- Apesar dos itens mais populares não serem os italianos nesse caso eles foram a maioria.

-- 5 - Averiguando detalhes dos 5 maiores pedidos.

  SELECT 
    order_id, category, COUNT(item_id) AS num_itens
FROM
    order_details
        LEFT JOIN
    menu_items ON order_details.item_id = menu_items.menu_item_id
WHERE
    order_id IN (440 , 2075, 1957, 330, 2675)
GROUP BY order_id , category;

-- R: Os clientes que gastam mais dinheiro tendem a pedir comida italiana, então apesar de naõ ser a mais popular ela deve ser mantida no menu.


