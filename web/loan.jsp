<%@page import="java.text.NumberFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loan Details</title>
    </head>
    <%
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        
        double loanAmount = Integer.parseInt(request.getParameter("loanAmount"));
        int loanLengthYears = Integer.parseInt(request.getParameter("loanLengthYears"));
        double intRate = Integer.parseInt(request.getParameter("intRate"));

        intRate /= 100.0; //convert interest rate to a decimal
       
        double monthlyRate = intRate / 12.0; // monthly interest rate is yearly rate / 12
        
        int termInMonths = loanLengthYears * 12; // convert years to months
       
        // Calculate the monthly payment
        // The Math.pow() method is used calculate values raised to a power
        double monthlyPayment = (loanAmount*monthlyRate) / (1-Math.pow(1+monthlyRate, -termInMonths));
 
        // used to format output
        NumberFormat currencyFormat =  NumberFormat.getCurrencyInstance();
        NumberFormat interestFormat = NumberFormat.getPercentInstance();
    
    %>
    
    <body>
        <h1>Loan</h1>
        
        <table>
            
                <tr>
                    <td class="second">Name:</td>
                    <td class="second"><%= name %></td> 
                </tr>
                
                <tr>
                    <td class="second">Loan Type:</td>
                    <td class="second" ><%= type %></td> 
                </tr>
                
                <tr>
                    <td class="second">Loan Amount: </td>
                    <td class="second"><%= currencyFormat.format(loanAmount) %></td> 
                </tr>
                
                <tr>
                    <td class="second">Loan Length:</td>
                    <td class="second"><%= termInMonths %> months</td> 
                </tr>
                
                <tr>
                    <td class="second">Interest Rate:</td>
                    <td class="second"><%= interestFormat.format(intRate) %></td> 
                </tr>
                   
                <tr>
                    <td class="second">Monthly Payments:</td>
                    <td class="second"><%= currencyFormat.format(monthlyPayment) %></td> 
                </tr>
                                    
        </table>
        
    </body>
</html>
