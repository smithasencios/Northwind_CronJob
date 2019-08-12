import os
import sys
import logging
import pymysql

try:

    # Open database connection
    db = pymysql.connect(os.environ['DATABASE_HOST'],os.environ['NORTHWIND_DB_USER'],os.environ['NORTHWIND_DB_PASSWORD'],os.environ['NORTHWIND_DB_DATABASE'] )

    # prepare a cursor object using cursor() method
    cursor = db.cursor()

    # Prepare SQL query to INSERT a record into the database.
    sql = "SELECT id,order_date,status_id,shipped_date FROM orders \
            WHERE status_id = 2 AND shipped_date <= date_sub(curdate(),interval 2 day)" 
    # Execute the SQL command
    cursor.execute(sql)
    # Fetch all the rows in a list of lists.
    results = cursor.fetchall()

    for row in results:
        order_id = row[0]
        order_date = row[1]
        status_id = row[2]
        shipped_date = row[3]
        # Now print fetched result
        print ("order_id = %s,order_date = %s,status_id = %d,shipped_date = %s" % \
            (order_id, order_date,status_id,shipped_date))

    # disconnect from server
    db.close()

except Exception as e:
    logging.error(e.message)
    sys.exit(4)

sys.exit(0)