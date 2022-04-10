(*1*)
fun is_older(date1 : (int * int * int), date2 : (int * int * int)) =
    if #1 date1 < #1 date2
    then true
    else 
	if #2 date1 < #2 date2 andalso #1 date1 = #1 date2
	then true
	else
	    if #3 date1 < #3 date2 andalso #1 date1 = #1 date2 andalso #2 date1 = #2 date2
	    then true
	    else
		false

        fun task1_test() =
  if is_older((2003, 11, 10),(2004, 3, 15)) <> true
  then raise Fail "Test 1 failed."
  else

  if is_older((2004, 10, 10),(2004, 11, 15)) <> true
  then raise Fail "Test 2 failed"
  else
  print("Test of task1 passed.");

  task1_test();

(*2*)
fun number_in_month(date : (int * int * int) list, month : int) =
    if null date
    then 0
    else 
	if #2 (hd date) = month
	then 1 + number_in_month(tl date, month)
	else 0 + number_in_month(tl date, month);

     fun task2_test() =
  if  number_in_month([(11,34,4),(11,34,4)], 34) <> 2
  then raise Fail "Test 1 failed."
  else

  if number_in_month([(11,34,4),(11,32,4)], 34) <> 1
  then raise Fail"Test 2 failed"
  else
  print("Test of task2 passed.");

  task2_test();

(*3*)


 fun number_in_month(date : (int * int * int) list, month : int list) =
    if null month
    then 0
    else if  null date
    then 0
	else if #2 (hd date) = (hd month)
	then 1 + number_in_month(tl date, month)
	else 0 + number_in_month( date, tl month);

     val ans = number_in_month([(11,34,4),(11,34,4),(11,3,4)],[34,12,3]);

        fun task3_test() =
  if   number_in_month([(11,34,4),(11,34,4),(11,3,4)],[34,12,3]) <> 3
  then raise Fail "Test 1 failed."
  else

  if number_in_month([(11,34,4),(11,34,4),(11,3,4)],[34,12,4]) <> 2
  then raise Fail "Test 2 failed"
  else
  print("Test of task3 passed.");

  task3_test();


(*4*)
fun dates_in_month(dates : (int * int * int) list, months : int) =
    if null dates
    then []
    else 
	if #2 (hd dates) = months
	then (hd dates)::dates_in_month(tl dates, months)
	else dates_in_month(tl dates, months);

         

         fun task4_test() =
  if  dates_in_month([(11,34,4),(11,34,5),(11,3,4)],34) <> [(11,34,4),(11,34,5)]
  then raise Fail "Test 1 failed."
  else

  if dates_in_month([(11,34,4),(11,34,5),(11,3,4)],3) <> [(11,3,4)]
  then raise Fail "Test 2 failed"
  else
  print("Test of task4 passed.");

  task4_test();

(*5*)
fun is_date_in_month(date : int, month : int list) = 
if null month
then false
else if date = (hd month)
then true
else is_date_in_month(date , tl month);


fun dates_in_months(dates : (int * int * int) list, months : int list) =
 if  null dates
then []
else if is_date_in_month(#2 (hd dates),months)
then (hd dates) :: dates_in_months(tl dates,months)
else dates_in_months(tl dates,months);

val ans =  dates_in_months([(11,34,4),(11,5,5),(11,3,10)],[34,12,3]);

 fun task5_test() =
  if  dates_in_months([(11,34,4),(11,5,5),(11,3,10)],[34,12,3]) <> [(11,34,4),(11,3,10)]
  then raise Fail "Test 1 failed."
  else

  if dates_in_months([(11,34,4),(11,5,5),(11,3,10)],[34,5,3]) <> [(11,34,4),(11,5,5),(11,3,10)]
  then raise Fail "Test 2 failed"
  else
  print("Test of task5 passed.");

  task5_test();

(*6*)
fun get_nth(list_of_words : string list, number : int) =
    if number = 1
    then hd list_of_words
    else get_nth(tl list_of_words, number-1)

     fun task6_test() =
  if  get_nth(["sdfvdc","vsv","fyuf"],1) <> "sdfvdc"
  then raise Fail "Test 1 failed."
  else

  if get_nth(["sdfvdc","vsv","fyuf"],2) <> "vsv"
  then raise Fail"Test 2 failed"
  else
  print("Test of task6 passed.");

  task6_test();

(*7*)
fun date_to_string(date : (int * int * int) ) =
    get_nth(["January", "February", "March", "April", "May", "June", "July",
             "August", "September", "October", "November"], #2 date) 
             ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)


 fun task7_test() =
  if  date_to_string(2002,2,28) <> "February 28, 2002"
  then raise Fail "Test 1 failed."
  else

  if date_to_string(2003,1,28) <> "January 28, 2003"
  then raise Fail "Test 2 failed"
  else
  print("Test of task7 passed.");

  task7_test();

(*8*)
fun number_before_reaching_sum(sum : int, newlist : int list) =
    let
	fun number_before_helper(amount : int, counter : int, newlist : int list) =
	    if (hd newlist + counter) >= sum
	    then amount
	    else number_before_helper(amount + 1, counter + hd newlist, tl newlist)
    in
	number_before_helper(0, 0, newlist)
    end

     fun task8_test() =
  if  number_before_reaching_sum( 1,[1, 2, 3]) <> 0 
  then raise Fail "Test 1 failed."
  else

  if number_before_reaching_sum(30,[25, 40, 2]) <> 1
  then raise Fail "Test 2 failed"
  else
  print("Test of task8 passed.");

  task8_test();

(*9*)
fun what_month(day : int) =
    number_before_reaching_sum(day, [31, 28, 31, 30, 31, 30, 31,31, 30, 31, 30, 31]) + 1;

 fun task9_test() =
  if  what_month(250) <> 9
  then raise Fail "Test 1 failed."
  else

  if what_month(144) <> 5
  then raise Fail "Test 2 failed"
  else
  print("Test of task9 passed.");

  task9_test();

(*10*)
fun month_range(day1 : int, day2 : int) =
    if day1 > day2
    then []
    else what_month(day1)::month_range(day1+1, day2)

    val ans = month_range(250,255);

    fun task10_test() =
  if  month_range(30,32) <> [1,1,2]
  then raise Fail "Test 1 failed."
  else

  if  month_range(250,255) <> [9,9,9,9,9,9]
  then raise Fail "Test 2 failed"
  else
  print("Test of task10 passed.");

  task10_test();

(*11*)
fun oldest(newlist : (int * int * int) list ) =
    if null newlist
    then NONE
    else
	let
	    fun oldest_helper(newlist : (int * int * int) list, date : (int * int * int)) =
		if null newlist
		then true
		else 
		    if is_older(date, hd newlist)
		    then oldest_helper(tl newlist, date)
		    else false
	    fun oldest_helper_2(newlist : (int * int * int) list) =
		if oldest_helper(tl newlist, hd newlist)
		then hd newlist
		else oldest_helper_2(tl newlist)
	in
	    SOME (oldest_helper_2(newlist))
	end

    val ans = oldest([(2003,1,4),(2002,10,4)]);

     fun task11_test() =
  if  oldest([(2003,1,4),(2002,10,4)]) <> SOME (2002,10,4)
  then raise Fail "Test 1 failed."
  else

  if  oldest([]) <> NONE
  then raise Fail "Test 2 failed"
  else
  print("Test of task11 passed.");

  task11_test();

