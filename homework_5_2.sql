-- Добавьте новый столбец под названием «время до следующей станции». Чтобы получить это значение, мы вычитаем время станций для пар смежных станций. 
-- Мы можем вычислить это значение без использования оконной функции SQL, но это может быть очень сложно. Проще это сделать с помощью оконной функции LEAD . 
-- Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить результат. В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.

DROP TABLE train_move;
CREATE TABLE train_move(
id INT,
   station VARCHAR(20),
    station_time TIME
	);
INSERT INTO train_move (id, station, station_time)
VALUES
(110, 'San Francisco', '10:00:00'),
(110, 'Redwood City', '10:54:00'),
(110, 'Palo Alto', '11:02:00'),
(110, 'San Jose', '12:35:00'),
(120, 'San Francisco', '11:00:00'),
(120, 'Palo Alto', '12:49:00'),
(120, 'San Jose', '13:30:00');

ALTER TABLE train_move
ADD time_to_next_station TIME;
UPDATE train_move AS t1
JOIN train_move AS t2 ON t1.id = t2.id AND t1.station_time < t2.station_time
SET t1.time_to_next_station = TIMEDIFF(t2.station_time, t1.station_time);

