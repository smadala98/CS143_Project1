<! DOCTYPE html>

<html>

<h1>CS 143 Project 1 - Building a Web Query Interface</h1>
<h2>Authors: Eric Chen, Subhodh Madala</h2>

<body>
Below is a text box for you to input a SQL SELECT Query.<br>
 After your submission, results will display!
<br><b>For example: <i>SELECT * FROM Actor WHERE id < 20;</i></b> <br><br>We entrust that you will only submit valid queries! >:D</body>






 <body>
<form action="query.php" method="GET"> <!-- When the form is submitted, send form data to this php script for processing -->
	<textarea name="query" rows="10" cols="100"></textarea> <br>
	<input type="submit"  value="Submit"/>
</form>




<?php
	$db_connection = mysql_connect("localhost", "cs143", ""); #Open that thang, didnt specify error handling.



	mysql_select_db("CS143",$db_connection);# We'll use the CS143 Database- Production

	$query= $_GET["query"];

	$result= mysql_query($query, $db_connection); #run the query and get the result

	echo '<h1> Results From Query: </h1>';
?>

<table border='1'>

	<tr> <!--This is for the column names of the query--->
	<?php
		for($i=0; $i <mysql_num_fields($result); $i+=1){
			echo '<td><b>', mysql_field_name($result,$i), '</b></td>';
		}


	?>
	</tr>

	
	<?php
	#Time to print all the data by row
		$number_fields=mysql_num_fields($result);
		while($row=mysql_fetch_row($result)){
			$index=0;
			echo '<tr>';
			while($index <$number_fields){ #for every field display it in one TR tag.
				

				if (is_null($row[$index])==True)
					echo '<td>','N/A','<td>';
				
				else
					echo'<td>',$row[$index], '</td>';
				

				$index+=1;
			}
			echo '</tr>';
		}

	?>
</table>



<?php
	mysql_close($db_connection); #CLOSE HER!

?>



</body>
</html>