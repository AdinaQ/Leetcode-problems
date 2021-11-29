select request_at as Day,round(sum(if(status like 'cancelled%',1,0))/count(*),2) as 'Cancellation Rate' 
	from Trips where client_id in (select users_id from Users where banned='No') and 
	driver_id in (select users_id from Users where banned='No') and 
	request_at between '2013-10-01' and '2013-10-03' group by request_at
