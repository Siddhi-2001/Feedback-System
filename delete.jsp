<%@ page import="java.sql.*"%>
<%
try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url="jdbc:mysql://localhost:3306/FB_20july23";
Connection con = DriverManager.getConnection(url,"root","abc123");
String email = request.getParameter("email");
String sql = "delete from feedback where email=(?)";
PreparedStatement pst = con.prepareStatement(sql);
pst.setString(1,email);
int rowsAffected = pst.executeUpdate();
con.close();

if (rowsAffected>0){
response.sendRedirect("home.jsp");
} else{
out.println("record does not exists");
}

}
catch(SQLException e)
{
out.println("issue"+e);
}

%>


