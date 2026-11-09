-- Question 1: The timetable of a given class ('11A') for a given day (Monday / weekday = 1), period by period.
-- Returns: period, subject, teacher, and room ordered by period from 1 to 7.
SELECT 
    l.period,
    s.name AS subject,
    t.full_name AS teacher,
    r.room_number AS room
FROM lessons l
JOIN classes c ON l.class_id = c.id
JOIN subjects s ON l.subject_id = s.id
JOIN teachers t ON l.teacher_id = t.id
JOIN rooms r ON l.room_id = r.id
WHERE c.name = '11A' 
  AND l.weekday = 1
ORDER BY l.period;


-- Question 2  When room "204" is taken during the week.
-- Returns: day of the week, period, and the class occupying room "204".
SELECT 
    CASE l.weekday
        WHEN 1 THEN 'Monday'
        WHEN 2 THEN 'Tuesday'
        WHEN 3 THEN 'Wednesday'
        WHEN 4 THEN 'Thursday'
        WHEN 5 THEN 'Friday'
    END AS day,
    l.period,
    c.name AS class
FROM lessons l
JOIN rooms r ON l.room_id = r.id
JOIN classes c ON l.class_id = c.id
WHERE r.room_number = '204'
ORDER BY l.weekday, l.period
