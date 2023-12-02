<%@ page import="java.sql.*"%>

<html>
<head>
<title>FeedBack System</title>
<style>
*{font-family:Georgia; font-size:40px;}
.nav{background-color:black;}
.nav a{
color:white;
text-decoration:none;
margin:10%;
}
body{background-color:thistle;}

form {
  background: $white;
  padding: 2em;
  height: 220px;
  width:450px;
  border-radius: 25px;
  border-left: 1px solid $white;
  border-top: 1px solid $white;
  backdrop-filter: blur(10px);
  box-shadow: 20px 20px 40px -6px rgba(0,0,0,0.2);
  text-align: center;
  position: relative;
  transition: all 0.2s ease-in-out;
}
.button {background-color:plum;}
</style>

</head>
<body>
<center>
<div class="nav">
<a href="index.jsp">Give FeedBack</a>
<a href="login.jsp">Admin Login</a>
</div>
<br>
<h1>Login Page</h1>
<form>
<input type="text" name="un" placeholder="enter username" required/>
<br><br>
<input type="password" name="pw" placeholder="enter password" required/>
<br><br>
<input type="submit" value="Login" name="btn" class="button"/>
</form>
<%
if(request.getParameter("btn") != null)
{
String un = request.getParameter("un");
String pw = request.getParameter("pw");
try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url = "jdbc:mysql://localhost:3306/FB_20july23";
Connection con = DriverManager.getConnection(url,"root","abc123");
String sql = "select *from user where un=? and pw=?";
PreparedStatement pst = con.prepareStatement(sql);
pst.setString(1,un);
pst.setString(2,pw);
ResultSet rs = pst.executeQuery();
if(rs.next())
{
session.setAttribute("un",un);
response.sendRedirect("home.jsp");
}
else
{
out.println("invalid login");
}
con.close();
}
catch(SQLException e)
{
out.println("sql issue"+e);
}}
%>
</center>
</body>
</html>






