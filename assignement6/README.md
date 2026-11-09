#attempt to insert a duplicate lesson for the same class, day, and period
INSERT INTO lessons (class_id, weekday, period, subject_id, teacher_id, room_id)
VALUES (1, 1, 1, 3, 2, 2);
#error:
ERROR:  duplicate key value violates unique constraint "uq_class_slot"
Key (class_id, weekday, period)=(1, 1, 1) already exists. 

SQL state: 23505
Detail: Key (class_id, weekday, period)=(1, 1, 1) already exists.

#Attempting to insert a lesson for non-existent class_id = 999:
-- Attempting to insert a lesson for non-existent class_id = 999:
INSERT INTO lessons (class_id, weekday, period, subject_id, teacher_id, room_id)
VALUES (999, 4, 1, 1, 1, 1);
#error:
ERROR:  insert or update on table "lessons" violates foreign key constraint "lessons_class_id_fkey"
Key (class_id)=(999) is not present in table "classes". 

SQL state: 23503
Detail: Key (class_id)=(999) is not present in table "classes".

Decisions i made and why:
I separated classes, subjects, teachers, and rooms into their own lookup tables referenced by foreign keys in lessons so names and room numbers are not duplicated across every lesson row.
Every table uses SERIAL PRIMARY KEY, while the lessons table uses three UNIQUE constraints—(class_id, weekday, period), (teacher_id, weekday, period), and (room_id, weekday, period)—so the database automatically blocks double-booking a class, teacher, or room.
I stored weekday (1–5) and period (1–7) as SMALLINT with CHECK constraints so the database rejects invalid days/periods and sorts days chronologically.
I do not store specific calendar dates since the timetable repeats every week.
