SELECT 
	se.exam_attempt_id,
    se.student_id,
    se.exam_id,
    ei.exam_category,
    exam_passed,
    se.date_exam_completed AS date_exam_completed
FROM 
	student_exams se 
JOIN exam_info ei USING(exam_id); 


select * from exam_info;


