DROP USER michael IF EXISTS;

CREATE USER IF NOT EXISTS michael
WITH ENCRYPTED PASSWORD 'stonebreaker'

DROP DATABASE todo_app IF EXISTS;

CREATE DATABASE IF NOT EXISTS todo_app;

\c todo_app;

CREATE TABLE IF NOT EXISTS tasks (
  id SERIAL NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  updated_at TIMESTAMP NULL,
  completed BOOLEAN NOT NULL DEFAULT FALSE
);

ALTER TABLE tasks ADD PRIMARY KEY (id);
ALTER TABLE "tasks" DROP COLUMN "completed";



