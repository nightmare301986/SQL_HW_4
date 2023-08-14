-- Вывести на экран, сколько машин каждого цвета  для машин марок BMW и LADA

SELECT COLOR, count(MARK) AS "Кол-во авто (BMW + LADA) данного цвета"
FROM auto
WHERE MARK IN ("BMW", "LADA")
GROUP BY COLOR;

-- Вывести на экран марку авто и количество AUTO ЭТОЙ марки
SELECT MARK, count(MARK)  FROM auto
GROUP BY MARK;

-- Вывести на экран марку авто и количество AUTO НЕ ЭТОЙ марки (1)
SELECT t2.MARK AS 'Марка авто', count(t2.MARK)AS 'Кол-во авто данной марки', 9 - count(t2.MARK)AS 'Кол-во других марок'
FROM AUTO t2 
GROUP BY MARK
UNION 
SELECT 'Всего', count(*), NULL
FROM AUTO t1;

-- Вывести на экран марку авто и количество AUTO НЕ ЭТОЙ марки (2)
SELECT 'Марки', @total := COUNT(*) AS 'Кол-во авто данной марки', 'Кол-во остальных марок' 
FROM AUTO
UNION
SELECT t2.MARK AS 'Марка авто', count(t2.MARK)AS 'Кол-во авто данной марки', @total - count(t2.MARK)
FROM AUTO t2 
GROUP BY MARK;

-- Вывести на экран марку авто и количество AUTO НЕ ЭТОЙ марки (3)
SELECT a1.MARK, count(a2.MARK) AS "Кол-во авто остальных марок"
FROM (
	SELECT DISTINCT MARK
    FROM auto
    ) a1
RIGHT JOIN auto a2 
ON a1.MARK != a2.MARK
GROUP BY a1.MARK
