

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    if (request.getParameter("submit") != null) {

        //burada biz form-dan gelen datalari elde edirik.
        String id = request.getParameter("id");
        String name = request.getParameter("sname");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");

        //burada database ile elaqe yaradiriq ve form-dan aldiqlarimizi database-ye gonderirik
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/schooll", "user16", "1234");
        PreparedStatement pst = con.prepareStatement("update records set stname = ?, course = ?, fee = ? where id = ?");
        pst.setString(1, name);
        pst.setString(2, course);
        pst.setString(3, fee);
        pst.setString(4, id);
        pst.executeUpdate();

        ResultSet rs;

%>

<script>
    alert("Records was updated");
</script>

<% } %>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
        <link rel="stylesheet" href="assets/css/style.css"/>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </head>
    <body>
        <h1 class="align-items-center">Update or Edit Data</h1>
        
        <div class="container">
            
            <form method="POST" action="index.jsp">
                
                 <%

                        //burada database-de olan melumatlari alib table tag-i daxilinde yazdiraciq
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/schooll", "user16", "1234");
                        
                        String id = request.getParameter("id");
                        
                        
                        PreparedStatement pst = con.prepareStatement("select * from records where id = ?");

                        pst.setString(1, id);
                        
                        ResultSet rs = pst.executeQuery();
                        
                        while(rs.next()){
                        
                            
                        
                    %>
                
                <div style="align: left;">
                    <label class="form-label">Student Name</label>
                    <input type="text" class="form-control" placeholder="Student NAme" name="sname" value="<%=rs.getString("stname")%>" id="sname" required=""/>
                </div>

                <div style="align: left;">
                    <label class="form-label">Course</label>
                    <input type="text" class="form-control" placeholder="Course" name="course" value="<%=rs.getString("course")%>" id="course" required=""/>
                </div>

                <div style="align: left;">
                    <label class="form-label">Fee</label>
                    <input type="text" class="form-control" placeholder="Fee" name="fee" value="<%=rs.getString("fee")%>" id="fee" required=""/>
                </div><br><br>
                
                <% } %>

                <div style="align: right;">

                    <input type="submit" class="btn btn-info"  name="submit" id="submit" value="Submit"/>
                    <input type="reset" class="btn btn-warning"  name="reset" id="reset" value="Reset"/>
                </div>
            </form><br><br>
            
        </div>
    </body>
</html>
