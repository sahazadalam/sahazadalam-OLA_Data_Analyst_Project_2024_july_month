🚖🚖🚖🚖🚖 OLA Data Analyst Project**🚖🚖🚖🚖🚖🚖🚖

📌 Project Overview: This project analyzes OLA ride bookings using SQL and Power BI. The dataset contains 40,000 rows of ride details, cancellations, distances, and ratings. The goal is to extract key insights and visualize them using Power BI dashboards.

📂 Files in This Repository File Name and Description 📊 Bookings-40000-Rows.xlsx ------> Raw dataset containing ride booking details 🛠 booking_database.sql ------------> SQL queries for data analysis 📈 OLA_Daskboard_.pbix ------------>Power BI dashboard for visualization 📄 README.md --------------------->Project documentation

🔍 Dataset Overview The dataset contains various columns, including: ✔️ Booking Status -----> (Success, Canceled, Incomplete) ✔️ Vehicle Type ------->(Auto, Sedan, SUV, Mini, etc.) ✔️ Pickup & Drop Locations --->(Bengaluru areas) ✔️ Cancellation Reasons-----> (By customer/driver) ✔️ Ride Distance & Booking Value ✔️ Customer & Driver Ratings

🛠️ SQL Queries Used Here are some key SQL queries used in the project:

📌 1. Retrieve all successful bookings: SELECT * FROM booking WHERE Booking_Status = 'Success';

📌 2. Find the average ride distance per vehicle type: SELECT Vehicle_Type, AVG(Ride_Distance) AS avg_distance FROM booking GROUP BY Vehicle_Type;

📌 3. Get the top 5 customers who booked the highest rides: SELECT Customer_ID, COUNT(Booking_ID) AS total_rides FROM booking GROUP BY Customer_ID ORDER BY total_rides DESC LIMIT 5;

📌 4. Find the total revenue from successful bookings: SELECT SUM(Booking_Value) AS total_successful_value FROM booking WHERE Booking_Status = 'Success'; (More queries available in booking_database.sql)

📊 Power BI Dashboard Insights Here are some key insights from the Power BI dashboard (ola_.pbix): ✔️ 62% of rides were successful ✔️ Most common cancellation reason → "Driver not moving to pickup" ✔️ Prime Sedan is the most booked vehicle type ✔️ Higher ride demand on weekends & match days ✔️ Peak booking hours: 6 PM - 9 PM

🚀 Power BI Visualizations Include: ✅ Ride Volume Over Time ✅ Booking Status Breakdown ✅ Revenue by Payment Method ✅ Customer & Driver Ratings Comparison ✅ Cancellation Trends & Reasons

🔗 How to Use This Project 1️⃣ Download the dataset (Bookings-40000-Rows.xlsx). 2️⃣ Run the SQL queries in booking_database.sql using MySQL or PostgreSQL. 3️⃣ Open OLA_Daskboard_.pbix in Power BI to explore visualizations. 4️⃣ Modify & analyze data based on new insights!

📢 Connect With Me:
🔗 GitHub: sahazadalam
🔗 LinkedIn: Sahazad Alam Ansiri




def main():
    filename = "data.txt"
    
    # Create file with 10 lines
    with open(filename, "w") as f:
        for i in range(10):
            f.write(f"Line {i}\n")
    
    try:
        pos = int(input("Enter line number (0-9) to read: "))
        if pos < 0 or pos > 9:
            print("Invalid position!")
            return
    except ValueError:
        print("Please enter a valid integer.")
        return

    # Open the file to read the specific line
    with open(filename, "r") as f:
        for _ in range(pos):  # Skip lines up to the desired one
            f.readline()
        line = f.readline()  # Read the target line
        print(f"Line at position {pos}: {line.strip()}")

# Entry point
if __name__ == "__main__":
    main()

