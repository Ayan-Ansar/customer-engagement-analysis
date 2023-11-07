WITH table_overall_minutes AS ( 
	SELECT 
		ci.*,
        ROUND(SUM(sl.minutes_watched),2) AS minutes_watched,
        COUNT(DISTINCT student_id) AS student_watched
    FROM course_info ci 
    JOIN student_learning sl USING(course_id)
    GROUP BY course_id 
),
table_minutes_per_student_and_completion_rate AS (
	SELECT 
		course_id,
        course_title,
        ROUND((minutes_watched/student_watched),2) AS minutes_per_student,
        ROUND(((minutes_watched/student_watched) / course_duration),2) AS completion_rate
	FROM table_overall_minutes 
)

SELECT * FROM table_minutes_per_student_and_completion_rate