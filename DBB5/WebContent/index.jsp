<%@page import="java.sql.*"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%
	ResultSet rs = null;
	Connection conn=null;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	try{
	    Class.forName(driver);
	    conn=DriverManager.getConnection(url,"movie","movie"); //�ڽ��� ���̵�� ��й�ȣ
	    out.print("���ῡ �����Ͽ����ϴ�.");
	    
	    Statement stmt = conn.createStatement();        
	    
        String sql = "select * from board order by idx desc";
 
        rs = stmt.executeQuery(sql);
%>
<body>
	<h1>�Խñ� ����Ʈ</h1>
	<table>
		<tr>
			<th>��ȣ</th>
			<th>����</th>
			<th>�ۼ���</th>
			<th>��¥</th>
			<th>��ȸ��</th>
		</tr>

<%
	while(rs.next()){
		 
	    out.print("<tr>");
	
	    out.print("<td>" + rs.getString(1) + "</td>");
	
	    out.print("<td><a href = 'content.jsp?idx="+ rs.getString(1)+"'>" + rs.getString(2) + "</a></td>");
	
	    out.print("<td>" + rs.getString(3) + "</td>");
	
	    out.print("<td>" + rs.getString(4) + "</td>");
	
	    out.print("<td>" + rs.getString(5) + "</td>");
	
	    out.print("</tr>");
	
	}
%>
	</table>
	<a href ="write.jsp">�۾���</a>
<%
		conn.close();
	    
	}catch(Exception e){
	    out.print("���ῡ �����Ͽ����ϴ�.");
	    e.printStackTrace();
	}
			
%>


		
</body>
</html>