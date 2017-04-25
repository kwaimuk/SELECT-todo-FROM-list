DROP USER IF EXISTS michael ;

CREATE USER michael
WITH ENCRYPTED PASSWORD 'stonebreaker'

DROP DATABASE IF EXISTS todo_app ;

CREATE DATABASE todo_app;

\c todo_app;
--6
CREATE TABLE tasks (
  id SERIAL NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT NULL,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE NULL,
  completed BOOLEAN NOT NULL DEFAULT FALSE
);
--7
ALTER TABLE tasks ADD PRIMARY KEY (id);
--9
ALTER TABLE tasks DROP COLUMN completed;
--10
ALTER TABLE tasks ADD completed_at TIMESTAMP DEFAULT NULL;
--11
ALTER TABLE tasks ALTER COLUMN updated_at NOT NULL DEFAULT now();
--12
INSERT INTO tasks (id, title, description, created_at, updated_at, completed_at)
VALUES (DEFAULT, 'Study SQL', 'Complete this exercise', now(), now(), NULL);
--13
INSERT INTO tasks (title, description)
VALUES ('Study PostgreSQL', 'Read all the documentation');
--14
SELECT title
FROM tasks
WHERE 'completed_at' IS NULL;
--15
UPDATE tasks
SET completed_at = now()
WHERE title = 'Study SQL';
--16
SELECT title, description
FROM tasks
WHERE completed_at IS NULL;
--17
SELECT *
FROM tasks
ORDER BY created_at DESC;
--18
INSERT INTO tasks (title, description)
VALUES ('mistake 1', 'a test entry');
--19
INSERT INTO tasks (title, description)
VALUES ('mistake 2', 'another test entry');
--20
INSERT INTO tasks (title, description)
VALUES ('mistake 3', 'another test entry');
--21
SELECT title,
FROM tasks
WHERE title LIKE '%mistake%';
--22
DELETE title
FROM tasks
WHERE title = 'mistake 1';
--23
SELECT title, description
FROM tasks
WHERE title like '%mistake%';
--24
DELETE title
FROM tasks
WHERE title LIKE '%mistake%';
--25
SELECT *
FROM tasks
ORDER BY title ASC;



\c kwaimuk;