/* 
=========================================================
SQL PRACTICE: UPDATES, DELETES, TRANSACTIONS, AND DATE/TIME
=========================================================

=========================================================
INSTRUCTIONS
=========================================================
• Run the SETUP section below once to create the database and starter data.
• Then complete each activity by writing SQL beneath each prompt.
• Use SELECT queries to verify results after each task.
• Do NOT run any "danger" prompts unless explicitly instructed by your teacher.

=========================================================
END OF REFERENCE HEADER
=========================================================
*/


/* =======================================================
   SETUP (EXECUTE THIS ONCE)
   ======================================================= */
CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    hourly_pay  DECIMAL(5,2),
    hire_date   DATE
);

INSERT INTO employees (first_name, last_name, hourly_pay, hire_date) VALUES
('Sheldon',   'Plankton',     NULL,   NULL),
('Sandy',     'Cheeks',       15.75,  '2022-06-12'),
('Eugene',    'Krabs',        22.50,  '2010-02-15'),
('Patrick',   'Star',         13.25,  '2021-09-30'),
('SpongeBob', 'SquarePants',  14.00,  '2021-03-20'),
('Squidward', 'Tentacles',    16.50,  '2015-07-10');


/* =======================================================
   SECTION A — UPDATE & DELETE PRACTICE (PROMPTS ONLY)
   ======================================================= */

/*
Activity A1: Update One Field
Prompt: Sheldon Plankton’s hourly pay is missing. Update his hourly_pay to 10.25.
*/

-- Write your SQL here.

update employees set hourly_pay=10.25 where first_name  = "sheldon";
/*
Activity A2: Update Multiple Fields
Prompt: Sheldon was hired on 2023-01-07. Update BOTH hourly_pay to 10.50 AND hire_date to 2023-01-07 in one statement.
*/

-- Write your SQL here.
update employees set hourly_pay=10.50,hire_date="2023-01-07" where first_name  = "sheldon";

/*
Activity A3: Set a Field to NULL
Prompt: Patrick’s hire date is unknown. Set his hire_date to NULL.
*/

-- Write your SQL here.
update employees set hire_date =null where first_name ="patrick" ;

/*
Activity A4: Update All Rows (Intentional Global Change)
Prompt: Give every employee a $1.00 raise (increase hourly_pay by 1 for ALL rows).
Note: This is a valid use of an UPDATE without a WHERE.
*/

-- Write your SQL here.
update employees set hourly_pay=hourly_pay+1 ;

/*
Activity A5: Conditional Update
Prompt: Set hourly_pay to 18.00 for employees hired before 2020-01-01 ONLY.
*/

-- Write your SQL here.
update employees set hourly_pay=18 where hire_date< "2020-01-01";

/*
Activity A6: Delete One Row
Prompt: Sheldon quit. Remove his record from the table.
*/

-- Write your SQL here.
delete from employees where first_name="sheldon";

/*
Activity A7: Conditional Delete
Prompt: Delete all employees hired before 2015-01-01.
*/

-- Write your SQL here.
delete from employees where hire_date< "2015-01-01";

/*
Activity A8: Dangerous Command (DO NOT RUN)
Prompt: Write the command that would delete EVERY row in employees.
Then, in a comment, explain why this is dangerous.
*/

-- Write your SQL here.

-- delete from employees
-- it deletes the whole tables data
/*
Activity A9: Combine Updates and Deletes
Prompt: SpongeBob got a promotion!
  1) Increase his hourly_pay by 25%.
  2) Delete any employees still making less than $15/hour after that.
Write both statements (they should be separate statements).
*/

-- Write your SQL here.
update employees set hourly_pay=hourly_pay+(hourly_pay*.25) where first_name="spongebob";
delete from employees where hourly_pay < 15;

/*
Activity A10: Insert + Delete Challenge
Prompt:
  1) Add a new employee named Karen Plankton earning 19.50/hour, hired today (use CURDATE()).
  2) Remove her record.
  * two statements
*/

-- Write your SQL here.

insert into employees values (7, "Karen","Plankton",19.50,current_date);
delete from employees where first_name = "karen";

/* =======================================================
   SECTION B — TRANSACTIONS: AUTOCOMMIT, COMMIT, ROLLBACK
   (PROMPTS ONLY — DO NOT EXPOSE ANSWERS)
   ======================================================= */



/*
B1: Turn Off Autocommit (Control Your Saves)
Prompt: Turn autocommit OFF for your session so changes are not saved automatically.
*/

-- Write your SQL here.
set autocommit= OFF;

/*
B3: Make a Safe Save Point
Prompt: Explicitly confirm your current state as a checkpoint by committing now.
(You should have autocommit OFF before doing this.)
*/

-- Write your SQL here.
 start transaction ;

/*
B4: Simulate a Mistake (But Be Ready!)
Prompt: Perform a DELETE on employees that accidentally removes ALL rows
      (i.e., omit the WHERE clause ON PURPOSE for practice).
IMPORTANT: Only do this if autocommit is OFF for your session.
*/

-- Write your SQL here.

-- delete from employees

/*
B5: Undo the Mistake
Prompt: Roll back your changes so the table returns to the state at your last COMMIT.
*/

-- Write your SQL here.

rollback;
/*
B6: Verify Recovery
Prompt: Select from employees to confirm the data is back to the checkpoint state.
(Write a SELECT to verify.)
*/

-- Write your SQL here.
select * from employees;

/*
B7: Intentionally Save a Destructive Change (Controlled Practice)
Prompt: For practice, delete all rows from employees and then COMMIT to permanently save that deletion.
*/

-- Write your SQL here.
-- set autocommit=on;
-- delete from employees 



/* =======================================================
   SECTION C — DATE & TIME PRACTICE (PROMPTS ONLY)
   ======================================================= */

/*
C1: Using date intervals 
Prompt: Sandy Cheeks hire_date was wrong by 1 week. Update the employees table so that her hire date is one week later (do not hardcode the date)
*/

-- Write your SQL here.
update employees set hire_date = hire_date+ interval 1 week where first_name="sandy";
/* Using date functions
C2: We just hired Pearl Krabs for 10.17 an hour. Add the record and use the current date for the hire_date
*/

-- Write your SQL here. 

insert into employees values (7, "Pearl","Krabs",10.17,current_date);









select * from employees;