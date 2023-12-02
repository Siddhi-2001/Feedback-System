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
  height: 200px;
  width: 400px;
  border-radius: 20px;
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
<a href="home.jsp">View</a>
<a href="logout.jsp">Logout</a>
</div>
<script>
  function confirmLogout() {
    return confirm("Are you sure you want to logout?");
  }
</script>
<%
String un=(String)session.getAttribute("un");
if(un==null)
{
response.sendRedirect("index.jsp");
}
%>
<br>
<form>
<input type="submit" value="Logout" name="btn" onclick="return confirmLogout()" class="button"/>
</form>
<%
if(request.getParameter("btn")!=null)
{
session.invalidate();
response.sendRedirect("index.jsp");
}
%>
</center>
</body>
</html>

