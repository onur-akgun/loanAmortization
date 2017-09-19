<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mike's Loan Amortization</title>
    </head>
    <body>
        <h1>My Loan</h1>
        
        <form action="loan.jsp" method="post">
		<input type="hidden" name="action" value="calc">
		
		<label>Name:</label>
		<input type="text" autofocus="autofocus" name="name" required><br>
	
                <label>How will the loan be used?</label>  <br>
                <input type="radio" name="type" value="auto" >To purchase an automobile 
                <br>
                <input type="radio" name="type" value="home" >To purchase a home
                <br>
                <input type="radio" name="type" value="personal" >Personal loan
                
                <br> <br>
		<label>Loan Amount:</label>
		<input type="text" name="loanAmount" required><br>
		
		<label>Length of Loan:</label>
		<input type="text" name="loanLengthYears" ><br>
                
                <label>Interest Rate:</label>
		<input type="text" name="intRate" ><br>
                
                <br>
                <br>
                <br>
                <label>&nbsp;</label>
		<input type="submit" value="Calculate Loan Payments" id="submit">
                <input type="reset" value="Clear" id="reset">
	</form>
        
        
        
        
    </body>
</html>
