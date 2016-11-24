<%-- 
    Document   : salir
    Created on : 15/05/2016, 11:30:38 PM
    Author     : Yax
--%>
<%@page import="java.sql.*, java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                    HttpSession sesion = request.getSession();
                    sesion.invalidate();  
                    response.sendRedirect("index.jsp");  
        %>
    </body>
</html>
