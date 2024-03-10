CREATE DATABASE SQL_ASSESSMENT100320242;

USE SQL_ASSESSMENT100320242;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(255) NOT NULL
);

INSERT INTO users (user_id, username) VALUES
(1, 'John Doe'),
(2, 'Jane Doe'),
(3, 'Alice Jones'),
(4, 'Lisa Romero');

CREATE TABLE training_details (
    user_training_id INT PRIMARY KEY,
    user_id INT,
    training_id INT,
    training_date DATE
);

INSERT INTO training_details (user_training_id, user_id, training_id, training_date) VALUES
(1, 1, 1, '2015-08-02'),
(2, 2, 1, '2015-08-03'),
(3, 3, 2, '2015-08-02'),
(4, 4, 2, '2015-08-04'),
(5, 2, 2, '2015-08-03'),
(6, 1, 1, '2015-08-02'),
(7, 3, 2, '2015-08-04'),
(8, 4, 3, '2015-08-03'),
(9, 1, 4, '2015-05-03'),
(10, 3, 1, '2015-08-02'),
(11, 4, 2, '2015-08-04'),
(12, 3, 2, '2015-08-02'),
(13, 1, 1, '2015-08-02'),
(14, 4, 3, '2015-08-03');


SELECT
    u.user_id,
    u.username,
    td.training_id,
    td.training_date,
    COUNT(*) AS lesson_count
FROM
    users u
JOIN
    training_details td ON u.user_id = td.user_id
GROUP BY
    u.user_id,
    u.username,
    td.training_id,
    td.training_date
HAVING
    COUNT(*) > 1
ORDER BY
    td.training_date DESC;