
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%

    if (request.getParameter("submit") != null) {

        //burada biz form-dan gelen datalari elde edirik.
        String name = request.getParameter("sname");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");

        //burada database ile elaqe yaradiriq
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/schooll", "user16", "1234");
        PreparedStatement pst = con.prepareStatement("insert into records(stname, course, fee) values(?, ?, ?)");
        pst.setString(1, name);
        pst.setString(2, course);
        pst.setString(3, fee);
        pst.executeUpdate();

        ResultSet rs;

%>

<script>
    alert("Records was added");
</script>

<% } %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index Page</title>
        <link rel="stylesheet" href="assets/css/style.css"/>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container">
            <h1>Student Registration System CRUD using jsp</h1>


            <form method="POST" action="#">
                <div style="align: left;">
                    <label class="form-label">Student Name</label>
                    <input type="text" class="form-control" placeholder="Student NAme" name="sname" id="sname" required=""/>
                </div>

                <div style="align: left;">
                    <label class="form-label">Course</label>
                    <input type="text" class="form-control" placeholder="Course" name="course" id="course" required=""/>
                </div>

                <div style="align: left;">
                    <label class="form-label">Fee</label>
                    <input type="text" class="form-control" placeholder="Fee" name="fee" id="fee" required=""/>
                </div><br><br>

                <div style="align: right;">

                    <input type="submit" class="btn btn-info"  name="submit" id="submit" value="Submit"/>
                    <input type="reset" class="btn btn-warning"  name="reset" id="reset" value="Reset"/>
                </div>
            </form><br><br>

            <table id="tbl-student" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                <thead>
                    <tr>
                        <th>Student Name</th>
                        <th>Course</th>
                        <th>Fee</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>

                    <%

                        //burada database-de olan melumatlari alib table tag-i daxilinde yazdiraciq
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/schooll", "user16", "1234");
                        PreparedStatement pst = con.prepareStatement("insert into records(stname, course, fee) values(?, ?, ?)");

                        String query = "select * from records";
                        Statement st = con.createStatement();
                        
                        ResultSet rs = st.executeQuery(query);
                        
                        while(rs.next()){
                        
                            String id = rs.getString("id");
                        
                    %>

                    <tr>
                        <td><%=rs.getString("stname")%></td>
                        <td><%=rs.getString("course")%></td>
                        <td><%=rs.getString("fee")%></td>
                        <td><a href="update.jsp?id=<%=id%>">Edit</a></td>
                        <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
                    </tr>
                    
                    
                    <% } %>
                    
                </thead>
            </table>

        </div>


    </body>
</html>
