<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="network.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String name = request.getParameter("name");
	String pass = request.getParameter("password");
	String skey = request.getParameter("skey");
	Connection con = DbConnection.getConnection();
	Statement st = con.createStatement();
	ResultSet rs = null;
	try {
		rs = st.executeQuery("select * from oreg where name='" + name
				+ "' and password='" + pass + "' and skey='" + skey
				+ "'");
		if (rs.next()) {
			session.setAttribute("oid", rs.getString("id"));
			session.setAttribute("omail", rs.getString("email"));
			session.setAttribute("oname", rs.getString("name"));
			System.out.println("Sucess");
			response.sendRedirect("ohome.jsp?msg=sucess");
		} else {
			response.sendRedirect("olog.jsp?msgg=failed");
		}

	} catch (Exception e) {
		e.printStackTrace();

	}
%>
