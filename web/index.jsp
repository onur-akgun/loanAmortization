<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mike's Loan Amortization</title>
        <link rel="stylesheet" type="text/css" href="./css/stylesheet.css">
    </head>
    <body>
        
        
        <form action="loan.jsp" method="post">
		<input type="hidden" name="action" value="calc">
                <table>
                    <tr><td class="right"><h1>My Loan</h1></td><td>&nbsp;</td></tr>
                    
                    <tr>
                        <td class="right"><label>Name:</label></td>
                        <td><input type="text" autofocus="autofocus" name="name" required></td>
                    </tr>
		
                    <tr>
                        <td class="right"><label>Loan Amount:</label></td>
                        <td><input type="text" name="loanAmount" required></td>
                    </tr>
                    
                    
                    <tr>
                        <td class="right"><label>Length of Loan:</label></td>
                        <td><input type="text" name="loanLengthYears" required ></td>
                    </tr>
                    
                    <tr>
                        <td class="right"><label>Interest Rate:</label></td>
                        <td><input type="text" name="intRate" required ></td>
                    </tr>
		
                    <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
                    
                    <tr>
                        <td class="right"><label>How will the loan be used?</label></td>
                        <td><input type="radio" name="type" value="auto" >To purchase an automobile 
                            <br>
                            <input type="radio" name="type" value="home" >To purchase a home
                            <br>
                            <input type="radio" name="type" value="personal" >Personal loan
                        </td>
                    </tr>
                    
                    <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
                    
                    <tr>
                        <td class="right"><input type="submit" value="Calculate Loan Payments" id="submit"></td>
                        <td><input type="reset" value="Clear" id="reset"></td></tr>
                </table>
               
	</form>
        
    </body>
</html>
