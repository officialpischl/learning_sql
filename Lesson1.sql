### Limits
/*
PRACTICE

Try it yourself below by writing a query that limits the response to only the
first 15 rows and includes the occurred_at, account_id, and channel fields in
the web_events table.
*/
SELECT occurred_at, account_id, channel
FROM web_events
LIMIT 15;


### OrderBy
/*
The ORDER BY statement allows us to order our table by any row.
The ORDER BY statement is always after the SELECT and FROM statements.
LIMIT statement is always last.
Default is sort ascending ASC
To sort descening need to add DESC
~~~~~~~~~~~~~~~~~

PRACTICE

1. Write a query to return the 10 earliest orders in the orders table.
Include the id, occurred_at, and total_amt_usd.
*/
SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at
LIMIT 10;

/*
2. Write a query to return the top 5 orders in terms of largest total_amt_usd.
Include the id, account_id, and total_amt_usd.
*/
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5;

/*
3. Write a query to return the bottom 20 orders in terms of least total.
Include the id, account_id, and total.
*/
SELECT id, account_id, total
FROM orders
ORDER BY total
LIMIT 20;

### whereStatements
/*
Using the WHERE statement, we can subset out tables based on conditions that
must be met. Common symbols used within WHERE statements include:

> (greater than)
< (less than)
>= (greater than or equal to)
<= (less than or equal to)
= (equal to)
!= (not equal to)
~~~~~~~~~~~~~~~~~

PRACTICE

1. Pull the first 5 rows and all columns from the orders table that have a
dollar amount of gloss_amt_usd greater than or equal to 1000.
*/
SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;

/*
2. Pull the first 10 rows and all columns from the orders table that have a
total_amt_usd less than 500.
*/
SELECT *
FROM orders
WHERE total_amt_usd < 500
LIMIT 10;

/*
The WHERE statement with non-numerical data.
Use the = and != operators.
Use single quotes
~~~~~~~~~~~~~~~~~

3. Filter the accounts table to include the company name, website, and the primary
point of contact (primary_poc) for Exxon Mobil in the accounts table.
*/
SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';

### arithmeticOperators

/*
Derived Columns: Creating a new column that is a combination of existing columns

Common operators include:
* (Multiplication)
+ (Addition)
- (Subtraction)
/ (Division)
~~~~~~~~~~~~~~~~~

PRACTICE

1. Create a column that divides the standard_amt_usd by the standard_qty to
find the unit price for standard paper for each order. Limit the results to the
first 10 orders, and include the id and account_id fields.
*/

SELECT  id,
		    account_id,
        standard_amt_usd,
		    standard_qty,
        (standard_amt_usd / standard_qty) AS standard_unit_p
FROM orders
LIMIT 10;

/*
2. Write a query that finds the percentage of revenue that comes from poster
paper for each order. You will need to use only the columns that end with _usd.
(Try to do this without using the total column). Include the id and account_id
fields. NOTE - you will be thrown an error with the correct solution to this
question. This is for a division by zero. You will learn how to get a solution
without an error to this query when you learn about CASE statements in a later
section. For now, you might just add some very small value to your denominator
as a work around. */

SELECT  id, account_id,
        standard_amt_usd,
        gloss_amt_usd,
        poster_amt_usd,
        (poster_amt_usd)/(standard_amt_usd + gloss_amt_usd + poster_amt_usd +.01)
        AS poster_percentage_usd
FROM orders;

### likeOperator
/*
Use LIKE operator with text, within a WHERE clause.
Frequently used with %.
  The % tells us that we might want any number of characters leading up to a
  particular set of characters or following a certain set of characters
~~~~~~~~~~~~~~~~~

PRACTICE

1. All the companies whose names start with 'C'.
*/
SELECT name
FROM accounts
WHERE name LIKE 'C%';

/*
2. All companies whose names contain the string 'one' somewhere in the name.
*/
SELECT name
FROM accounts
WHERE name LIKE '%one%';

/*
3. All companies whose names end with 's'.
*/
SELECT name
FROM accounts
WHERE name LIKE '%s';


### inOperator
/*
Use IN operator for both numeric and text columns.
Allows us to use =, but for more than one item of that particular column.
Can do with OR, but IN operator is a cleaner way to write these queries.

Expert Tip
In most SQL environments, you can use single or double quotation marks -
you may NEED double quotation marks if apostrophe within text attempting to pull
In classroom, use two single quotes together for aposthrophe --> 'Macy''s'
~~~~~~~~~~~~~~~~~

PRACTICE

1. Use the accounts table to find the account name, primary_poc, and
sales_rep_id for Walmart, Target, and Nordstrom.
*/
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');

/*
2. Use the web_events table to find all information regarding individuals who
were contacted via the channel of organic or adwords.
*/
SELECT id, account_id, channel
FROM web_events
WHERE channel IN ('organic', 'adwords');

### notOperator
/*
NOT LIKE or NOT IN grabs all rows that do not meet a particular criteria.
~~~~~~~~~~~~~~~~~

PRACTICE

1. Use the accounts table to find the account name, primary poc, and sales rep
id for all stores except Walmart, Target, and Nordstrom.
*/
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom');

/*
2. Use the web_events table to find all information regarding individuals who
were contacted via any method except using organic or adwords methods.
*/
SELECT id, account_id, channel
FROM web_events
WHERE channel NOT IN ('organic', 'adwords');

/*
3. All the companies whose names do not start with 'C'.
*/
SELECT name
FROM accounts
WHERE name NOT LIKE 'C%'
ORDER BY name;

/*
4. All companies whose names do not contain the string 'one' somewhere in the
name.
*/
SELECT name
FROM accounts
WHERE name NOT LIKE '%one%'
ORDER BY name;

/*
5. All companies whose names do not end with 's'.
*/
SELECT name
FROM accounts
WHERE name NOT LIKE '%s'
ORDER BY name;

### and_between
/*
The AND operator -- is used within a WHERE statement to consider more than one
logical clause at a time.

BETWEEN Operator --  Instead of writing :
-- WHERE column >= 6 AND column <= 10
we can instead write, equivalently:
-- WHERE column BETWEEN 6 AND 10
~~~~~~~~~~~~~~~~~

PRACTICE

1. Write a query that returns all the orders where the standard_qty is over
1000, the poster_qty is 0, and the gloss_qty is 0.

*/
SELECT standard_qty, poster_qty, gloss_qty
FROM orders
WHERE standard_qty > 1000 AND poster_qty = 0 AND gloss_qty = 0;

/*
2. Using the accounts table find all the companies whose names do not start with
'C' and end with 's'.
*/
SELECT name
FROM accounts
WHERE name NOT LIKE 'C%' AND name LIKE '%s';

/*
3. Use the web_events table to find all information regarding individuals who
were contacted via organic or adwords and started their account at any point in
2016 sorted from newest to oldest.
*/
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords') AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at DESC;

###orOperator
/*
OR operator can combine multiple statements.
Need to specify the column each time you link a new statement
~~~~~~~~~~~~~~~~~

PRACTICE

1. Find list of orders ids where either gloss_qty or poster_qty is greater than
4000. Only include the id field in the resulting table.

*/
SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;

/*
2. Write a query that returns a list of orders where the standard_qty is zero
and either the gloss_qty or poster_qty is over 1000.
*/
SELECT *
FROM orders
WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);

/*
3. Find all the company names that start with a 'C' or 'W', and the primary
contact contains 'ana' or 'Ana', but it doesn't contain 'eana'.
*/
SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%')
AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%')
AND primary_poc NOT LIKE '%eana%');

### RECAP

/*
Statement	How to Use It	Other Details
SELECT    SELECT Col1, Col2, ...        Provide the columns you want
FROM      FROM Table                    Provide the table where the columns exist
LIMIT     LIMIT 10                      Limits based number of rows returned
ORDER BY  ORDER BY Col                  Orders table based on the column. Used with DESC.
WHERE     WHERE Col > 5                 A conditional statement to filter your results
LIKE      WHERE Col LIKE '%me%          Only pulls rows where column has 'me' within the text
IN        WHERE Col IN ('Y', 'N')       A filter for only rows with column of 'Y' or 'N'
NOT       WHERE Col NOT IN ('Y', "N')   NOT is frequently used with LIKE and IN
AND       WHERE Col1 > 5 AND Col2 < 3   Filter rows where two or more conditions must be true
OR        WHERE Col1 > 5 OR Col2 < 3    Filter rows where at least one condition must be true
BETWEEN   WHERE Col BETWEEN 3 AND 5     Often easier syntax than using an AND

Other Tips
SQL not case sensitive
But order matters. Best practice:

SELECT col1, col2
FROM table1
WHERE col3  > 5 AND col4 LIKE '%os%'
ORDER BY col5
LIMIT 10;
Notice, you can retrieve different columns than those being used in the ORDER BY
 and WHERE statements. Assuming all of these column names existed in this way
 (col1, col2, col3, col4, col5) within a table called table1
