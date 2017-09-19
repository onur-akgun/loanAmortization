<%@page import="java.text.NumberFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loan Details</title>
        <link rel="stylesheet" type="text/css" href="./css/stylesheet.css">
    </head>
    <%
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        
        double loanAmount = Integer.parseInt(request.getParameter("loanAmount"));
        int loanLengthYears = Integer.parseInt(request.getParameter("loanLengthYears"));
        double intRate = Integer.parseInt(request.getParameter("intRate"));

        // used to format output
        NumberFormat currencyFormat =  NumberFormat.getCurrencyInstance();
        NumberFormat interestFormat = NumberFormat.getPercentInstance();
        
        intRate /= 100.0; //convert interest rate to a decimal
       
        double monthlyRate = intRate / 12.0; // monthly interest rate is yearly rate / 12
        
        int termInMonths = loanLengthYears * 12; // convert years to months
       
        // Calculate the monthly payment
        // The Math.pow() method is used calculate values raised to a power
        double monthlyPayment = (loanAmount*monthlyRate) / (1-Math.pow(1+monthlyRate, -termInMonths));
 
        
        String amortizationTable = "";
        amortizationTable += "<table class=hor-minimalist-b>";
            
            amortizationTable += "<thead>";
            amortizationTable += "<tr>";
            amortizationTable += "<th>Month</th>";
            amortizationTable += "<th>Montly <br> Payment</th>";
            amortizationTable += "<th>Payment to <br> Principal</th>";
            amortizationTable += "<th>Monthly Interest <br> Payment</th>";
            amortizationTable += "<th>Ending Loan <br> Balanace</th>";
            amortizationTable += "<th>Total Interest <br> Paid</th>";
            amortizationTable += "</tr>";
            amortizationTable += "</thead>";
        
        double monthlyBeginingBalance = loanAmount; //itialize montly beginning balance the same as the loan amount
        double totalInterestPaid = 0; //itialize total interest paid as zero
        
        for(int i=1; i<=termInMonths; i++){  // loop for each month in the loan
        
        // calculate the monthly interest payment    
        double monthlyInterestPayment = monthlyBeginingBalance * monthlyRate; 
        
        // calculate the amount of the monthly payment towards principal
        double principalPayment = monthlyPayment - monthlyInterestPayment;  
        
        //calculate the new monthly loan balance after the payment has been applied
        double monthlyEndingBalance = monthlyBeginingBalance - principalPayment;
        
        
        totalInterestPaid = totalInterestPaid + monthlyInterestPayment; 
        
        amortizationTable += "<tr>";
                
                amortizationTable += "<td>";
                     amortizationTable += i;
                amortizationTable += "</td>";
                
                amortizationTable += "<td>";
                     amortizationTable += currencyFormat.format(monthlyPayment);
                amortizationTable += "</td>";
                
                amortizationTable += "<td>";
                     amortizationTable += currencyFormat.format(principalPayment);
                amortizationTable += "</td>";
                
               amortizationTable += "<td>";
                     amortizationTable += currencyFormat.format(monthlyInterestPayment);
                amortizationTable += "</td>";
                
                amortizationTable += "<td>";
                     amortizationTable += currencyFormat.format(monthlyEndingBalance);
                amortizationTable += "</td>";
                
                amortizationTable += "<td>";
                     amortizationTable += currencyFormat.format(totalInterestPaid);
                amortizationTable += "</td>";
                
         amortizationTable += "</tr>";
        
        // set the new beginning balance equal to this month's new loan balance
        monthlyBeginingBalance = monthlyBeginingBalance;
        
        }

        amortizationTable += "</table>";
           
    %>
    
    <body>
        <h1>Loan Details</h1>
        
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
        
          <%= amortizationTable %>      
                
    </body>
</html>
