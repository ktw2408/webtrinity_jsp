<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../config/config.jsp" %>
<%@ page import="java.util.*, java.text.*" %>
<%@ page import="org.apache.commons.lang3.*" %>
<%
request.setCharacterEncoding("UTF-8");
//=========================== 파라메터 분석 영역 [ 시작 ]
String pMenu      = request.getParameter("menu");	      //게시판 구분 
String pCategory  = request.getParameter("category");	  //검색 범위 
String pSearchKey = request.getParameter("searchKey");    //검색어
String pPageno    = request.getParameter("pageno");	      //페이지 수
String pTitle     = request.getParameter("title");	      //제목
String pContent   = request.getParameter("content");      //내용
String pYourID    = request.getParameter("id");           //다른 사람의 게시물 작성 ID
String pID        = (String)session.getAttribute("s_id"); //아이디	
String pNO        = request.getParameter("no");;          //게시물 번호
String pReCont    = request.getParameter("replyText");    //댓글 내용
//=========================== 파라메터 분석 영역 [ 종료 ]

//=========================== 페이징 처리를 위한 변수 선언 영역 [ 시작 ]
String mPageParam  = "";//페이징 처리용 파라메터
String mSQL        = "";
//=========================== 페이징 처리를 위한 변수 선언 영역 [ 종료 ]

//=========================== 파라메터를 검증 및 처리한다. [ 시작 ]
if(pCategory == null)
{
	pCategory = "";
}
if(pSearchKey == null)
{
	pSearchKey = "";
}
if(pPageno == null)
{
	pPageno = "0";
}
mPageParam = "menu=" + pMenu + "&category=" + pCategory + "&searchKey=" + pSearchKey + "&pageno=" + pPageno + "&no=" + pNO + "&id=" + pYourID;
//=========================== 파라메터를 검증 및 처리한다. [ 종료 ]

//=========================== 특수문자 치환 [ 시작 ]
pReCont = pReCont.replaceAll("'","′");
pReCont = StringEscapeUtils.escapeHtml4(pReCont);
//=========================== 특수문자 치환 [ 종료 ]

myBoard.DBOpen();

mSQL += "insert into reply (bdno,id, recont) ";
mSQL += "values ('" + pNO + "','" + pID + "','" + pReCont + "') ";
myBoard.Execute(mSQL);

myBoard.CloseQuery();
myBoard.DBClose();

%>
<script language="javascript">
	
	alert("댓글을 등록하였습니다.");
	
	document.location = "<%= m_BaseURL %>/view.jsp?<%= mPageParam %>";

</script>