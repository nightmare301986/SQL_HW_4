/*
Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.
*/

SELECT a.*
FROM test_a a
LEFT JOIN test_b b
ON a.id = b.id
WHERE b.id IS NUll;