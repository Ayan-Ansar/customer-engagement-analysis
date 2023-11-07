SELECT 
	student_id,
    date_watched,
    SUM(minutes_watched) as minutes_watched,
    MAX(paid) as paid
FROM 
	(SELECT 
		sl.student_id,
		sl.date_watched,
		sl.minutes_watched,
		pi.date_start,
		pi.date_end,
		CASE
			WHEN pi.date_start IS NULL AND pi.date_end IS NULL THEN 0
			WHEN sl.date_watched BETWEEN pi.date_start AND pi.date_end THEN 1
			WHEN sl.date_watched NOT BETWEEN pi.date_start AND pi.date_end THEN 0 
		END AS paid
	FROM 
		student_learning sl 
	LEFT JOIN purchases_info pi USING(student_id)) a
GROUP BY student_id, date_watched;






