#** Booking Database Script
#** This script creates a database named 'booking' and performs various operations on it.
#**It includes creating views for analyzing booking data, such as successful bookings, canceled rides, customer ratings, and more.
###################################################################################################################################


create database booking;
use booking;
SELECT * FROM booking.booking;


#1*.*********Retrieve all successful bookings:************
create view SuccessFul_Booking AS 
SELECT *
FROM booking.booking
WHERE Booking_Status = 'Success';

#2*********.Find the average ride distance for each vehicle type:************
create view Ride_Distance_for_each_vehicle as
SELECT Vehicle_Type, 
       AVG(Ride_Distance) AS Average_Ride_Distance
FROM booking.booking
GROUP BY Vehicle_Type;

#3.********* Get the total number of cancelled rides by customers:********
Create view cancelled_rides_by_customers as
 SELECT count(*) from booking.booking where Booking_Status='Canceled by Customer';
 
#4. *********List the top 5 customers who booked the highest number of rides:*********
CREATE VIEW Top_5_Customers AS
SELECT Customer_ID, COUNT(Booking_ID) AS total_rides
FROM booking.booking
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;

#5.*********Get the number of rides canceled by drivers due to personal and car-related issues:******
CREATE VIEW Rides_Canceled_By_Drivers AS
SELECT COUNT(*) AS cancelled_count
FROM booking.booking
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';


#6********* Create a view for the maximum and minimum driver ratings for Prime Sedan bookings:*******
CREATE VIEW prime_sedan_ratings AS
SELECT MAX(Driver_Ratings) AS max_rating, MIN(Driver_Ratings) AS min_rating
FROM booking.booking
WHERE Vehicle_Type = 'Prime Sedan';

#7 *******Create a view for all rides where payment was made using UPI:*******
CREATE VIEW rides_paid_by_upi AS
    SELECT *FROM booking.booking WHERE Payment_Method = 'UPI';
    
    
#8 *******Create a view for the average customer rating per vehicle type:********
CREATE VIEW avg_customer_rating_per_vehicle AS
SELECT Vehicle_Type, AVG(Customer_Rating) AS avg_customer_rating
FROM booking.booking
GROUP BY Vehicle_Type;


#9*********** Create a view for the total booking value of rides completed successfully:*****
CREATE VIEW total_successful_booking_value AS
SELECT SUM(Booking_Value) AS total_successful_value
FROM booking.booking
WHERE Booking_Status = 'Success';


#10**************Create a view for listing all incomplete rides along with the reason:**********
CREATE VIEW incomplete_rides AS
SELECT Booking_ID, Incomplete_Rides_Reason
FROM booking.booking
WHERE Incomplete_Rides = 'Yes';




#*********Display the output of all views*************

SELECT * FROM SuccessFul_Booking;
SELECT * FROM Ride_Distance_for_each_vehicle;
SELECT * FROM canceled_rides_by_customers;
SELECT * FROM Top_5_Customers;
SELECT * FROM Rides_Canceled_By_Drivers;
SELECT * FROM prime_sedan_ratings;
SELECT * FROM rides_paid_by_upi;
SELECT * FROM avg_customer_rating_per_vehicle;
SELECT * FROM total_successful_booking_value;
SELECT * FROM incomplete_rides;