<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="config/config.jsp" %>
<%
	
	String pMenu = request.getParameter("menu");
	if(pMenu == null || pMenu.equals(""))
	{
		pMenu = "about";
	}
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>ABOUT - WebTrinity</title>
		<link rel="stylesheet" type="text/css" href="<%= m_BaseURL %>/style/wt.css">
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
	</head>
	<body>
		<%@ include file="include/leftSide.jsp" %>
		<%
		if(pMenu.equals("about"))
		{
			%>
			<%@ include file="contents/about.jsp" %>
			<%
		}else
		{
			%>
			<%@ include file="contents/board.jsp" %>
			<%
		}
		%>

	</body>
</html>