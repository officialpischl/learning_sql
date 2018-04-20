----------------------------
# ARITHMETIC OPERATORS
----------------------------

# Quiz: Average Electricity Bill
# It's time to try a calculation in Python!
# My electricity bills for the last three months have been $23, $32 and $64. What is the average monthly electricity bill over the three month period? Write an expression to calculate the mean, and use print() to view the result.
# Write an expression that calculates the average of 23, 32 and 64.
# Place the expression in this print statement.

avg_bill = (23+32+64)/3
print(avg_bill)

~~~~~~
# Quiz: Calculate
# In this quiz you're going to do some calculations for a tiler. Two parts of a floor need tiling. One part is 9 tiles wide by 7 tiles long, the other is 5 tiles wide by 7 tiles long. Tiles come in packages of 6.

# How many tiles are needed?
# You buy 17 packages of tiles containing 6 tiles each. How many tiles will be left over?

# Fill this in with an expression that calculates how many tiles are needed.
area = (9*7) + (5*7)
print(area)

# Fill this in with an expression that calculates how many tiles will be left over.
leftover = (17*6) % area
print(leftover)

----------------------------
# VARIABLES AND ASSIGNMENT OPERATORS
----------------------------
# Quiz: Assign and Modify Variables
# Now it's your turn to work with variables. The comments in this quiz (the lines that begin with #) have instructions for creating and modifying variables. After each comment write a line of code that implements the instruction.
# Note that this code uses scientific notation to define large numbers. 4.445e8 is equal to 4.445 * 10 ** 8 which is equal to 444500000.0.
# The current volume of a water reservoir (in cubic metres)

reservoir_volume = 4.445e8
# The amount of rainfall from a storm (in cubic metres)
rainfall = 5e6

# decrease the rainfall variable by 10% to account for runoff
rainfall = (rainfall * 0.9)

# add the rainfall variable to the reservoir_volume variable
reservoire_volume = (rainfall + reservoir_volume)

# increase reservoir_volume by 5% to account for stormwater that flows
# into the reservoir in the days following the storm
reservoire_volume = (1.05 * reservoire_volume)

# decrease reservoir_volume by 5% to account for evaporation
reservoire_volume = (.95 * reservoire_volume)

# subtract 2.5e5 cubic metres from reservoir_volume to account for water
# that's piped to arid regions.
reservoire_volume = reservoire_volume - 2.5e5


# print the new value of the reservoir_volume variable
print(reservoire_volume)

----------------------------
# INTEGERS AND FLOATS
----------------------------
# nothing to code

----------------------------
# BOOLEANS, COMPARISON OPERATORS, AND LOGICAL OPERATORS
----------------------------
# Quiz: Which is denser, Rio or San Francisco?
# Try comparison operators in this quiz! This code calculates the population densities of Rio de Janeiro and San Francisco.
# Write code to compare these densities. Is the population of San Francisco more dense than that of Rio de Janeiro? Print True if it is and False if not.

sf_population, sf_area = 864816, 231.89
rio_population, rio_area = 6453682, 486.5

san_francisco_pop_density = sf_population/sf_area
rio_de_janeiro_pop_density = rio_population/rio_area

# Write code that prints True if San Francisco is denser than Rio, and False otherwise
sf_density = sf_population / sf_area
rio_density = rio_population / rio_area
x = sf_density > rio_density
print(x)

----------------------------
# STRINGS
----------------------------
# Quiz: Fix the Quote
# The line of code in the following quiz will cause a SyntaxError, thanks to the misuse of quotation marks. First run it with Test Run to view the error message. Then resolve the problem so that the quote (from Henry Ford) is correctly assigned to the variable ford_quote.
# TODO: Fix this string!
ford_quote = 'Whether you think you can, or you think you can\'t--you\'re right.'
# OR
ford_quote = "Whether you think you can, or you think you can't--you're right."

coconut_count = "34"
mango_count = "15"
tropical_fruit_count = coconut_count + mango_count
print(tropical_fruit_count)

~~~~~~
# Quiz: Write a Server Log Message
# In this programming quiz, you’re going to use what you’ve learned about strings to write a logging message for a server.
# You’ll be provided with example data for a user, the time of their visit and the site they accessed. You should use the variables provided and the techniques you’ve learned to print a log message like this one (with the username, url, and timestamp replaced with values from the appropriate variables):
# Yogesh accessed the site http://petshop.com/pets/reptiles/pythons at 16:20.
# Use the Test Run button to see your results as you work on coding this piece by piece.

print (username + " accessed the site " + url + " at " + timestamp + ".")
# OR
message = username + " accessed the site " + url + " at " + timestamp + "."
print(message)

~~~~~~
# Quiz: len
#Use string concatenation and the len function to find the length of a certain movie star's actual full name. Store that length in the name_length variable. Don't forget that there are spaces in between the different parts of a name!
given_name = "William"
middle_names = "Bradley"
family_name = "Pitt"

name_length = len(given_name) + len(middle_names) + len(family_name) + 2

#todo: calculate how long this name is

# Now we check to make sure that the name fits within the driving license character limit
# Nothing you need to do here

driving_license_character_limit = 28
print(name_length <= driving_license_character_limit)

----------------------------
# TYPE AND TYPE CONVERSIONS
----------------------------
# Quiz: Total Sales
# In this quiz, you’ll need to change the types of the input and output data in order to get the result you want.
# Calculate and print the total sales for the week from the data provided. Print out a string of the form "This week's total sales: xxx", where xxx will be the actual total of all the numbers. You’ll need to change the type of the input data in order to calculate that total.
mon_sales = "121"
tues_sales = "105"
wed_sales = "110"
thurs_sales = "98"
fri_sales = "95"

#TODO: Print a string with this format: This week's total sales: xxx
# You will probably need to write some lines of code before the print statement.

weekly_sales = int(mon_sales) + int(tues_sales) + int(wed_sales) + int(thurs_sales) + int(fri_sales)
weekly_sales = str(weekly_sales)
print("This week's total sales: " + weekly_sales)

----------------------------
# LISTS AND MEMBERSHIP OPERATORS
----------------------------
# Quiz: List Indexing
# Use list indexing to determine how many days are in a particular month based on the integer variable month, and store that value in the integer variable num_days. For example, if month is 8, num_days should be set to 31, since the eighth month, August, has 31 days.
# Remember to account for zero-based indexing!

month = 8
days_in_month = [31,28,31,30,31,30,31,31,30,31,30,31]

# use list indexing to determine the number of days in month
num_days = days_in_month[7]
print(num_days)
num_days = days_in_month[month - 1]
print(num_days)

~~~~~~
# Quiz: Slicing Lists
# Select the three most recent dates from this list using list slicing notation. Hint: negative indexes work in slices!
eclipse_dates = ['June 21, 2001', 'December 4, 2002', 'November 23, 2003',
                 'March 29, 2006', 'August 1, 2008', 'July 22, 2009',
                 'July 11, 2010', 'November 13, 2012', 'March 20, 2015',
                 'March 9, 2016']


# TODO: Modify this line so it prints the last three elements of the list
print(eclipse_dates[-3:])
