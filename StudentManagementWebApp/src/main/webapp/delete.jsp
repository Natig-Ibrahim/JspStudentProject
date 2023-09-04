
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%

        //burada biz form-dan gelen datalari elde edirik.
        String id = request.getParameter("id");

        //burada database ile elaqe yaradiriq ve form-dan aldiqlarimizi database-ye gonderirik
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/schooll", "user16", "1234");
        PreparedStatement pst = con.prepareStatement("delete from records where id = ?");
        pst.setString(1, id);
        pst.executeUpdate();

%>

<script>
    alert("Records was deleted");
</script>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
