/*
 Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.


Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id.
 Note that you are supposed to write a DELETE statement and not a SELECT one.

After running your script, the answer shown is the Person table.
 The driver will first compile and run your piece of code and then show the Person table.
 The final order of the Person table does not matter.
 */

--Please write a DELETE statement and DO NOT write a SELECT statement.
--Write your MySQL query statement below
DELETE FROM Person
WHERE id IN (
    SELECT * FROM (
        SELECT p1.id
        FROM Person p1
        JOIN (
            SELECT email, MIN(id) AS min_id
            FROM Person
            GROUP BY email
            )
            p2 ON p1.email = p2.email
            AND p1.id > p2.min_id
        )
    temp
);