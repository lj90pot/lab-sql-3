use sakila;
/*_____________________*/
/*This is the lab sql 3*/
/*---Luis in da Hause--*/
/*_____________________*/
 
 /*-- Q1 --*/
 select count(distinct last_name) as number_of_actor_last_names from actor;
 
 /*-- Q2 --*/
 select count(distinct language_id) as number_of_languages from film;
 
 /*-- Q3 --*/
 select count(*) as films_with_PG13 from film where rating = "PG-13";
 
 /*-- Q4 --*/
 select * from film where release_year = "2006" order by length desc limit 10;
 
  /*-- Q5 --*/
  select datediff(max(rental_date),min(rental_date)) as Operating_days from rental;
  
  /*-- Q6 --*/
  select *, 
	date_format(rental_date,"%a") as Rental_weekday, 
    date_format(rental_date,"%m") as Rental_month,
	date_format(return_date,"%a") as Return_weekday, 
    date_format(return_date,"%m") as Return_month
  from rental 
  limit 20; 
  
  /*-- Q7 --*/
  select * ,
  /*This part is from the activities during class*/
  CASE
	WHEN (DAYNAME(rental_date) = "Saturday" or DAYNAME(rental_date) = "Sunday" ) THEN "Weekend"
	ELSE "Weekday"
    END as rental_day_type
  from rental;
  
    /*-- Q8 --*/
	select date_format(rental_date,"%Y%m") as last_month
    from rental 
    order by rental_date desc limit 1;
    
    /* Thanks to Sabine :)*/
    SELECT * FROM rental
    WHERE DATE_FORMAT(rental_date, "%Y%m") = 
    (
		select date_format(rental_date,"%Y%m") as last_month
		from rental 
		order by rental_date desc limit 1
    );