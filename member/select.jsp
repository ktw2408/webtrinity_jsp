<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../config/config.jsp" %>
<%
String mSelectedImg   = request.getParameter("img");
if(mSelectedImg == null)
{
	mSelectedImg = "";
}
%>
<script language="javascript">
	
	function SelectDone()
	{
		if(SelectForm.select.value == null || SelectForm.select.value == "")
		{
			alert("프로필 사진을 선택하세요.");
			return;
		}
		<%
		if(mSelectedImg.equals(""))
		{
			%>
			opener.joinForm.photo.value = SelectForm.select.value;
			opener.photo_img.src = "<%= m_BaseURL %>/images/" + SelectForm.select.value;
			<%
		}else
		{
			%>
			opener.modifyForm.photo.value = SelectForm.select.value;
			opener.m_photo_img.src = "<%= m_BaseURL %>/images/" + SelectForm.select.value;
			<%
		}
		%>
		window.close();		
	}

</script>
<style>
td
{
	text-align: center;
	
}
p.title
{
	font-size:20px;
	text-align:center;
	margin-top: 30px;
}
.button
{
	text-align:center;
	margin-top:50px;
}
</style>
<form id="SelectForm" name="SelectForm">
<p class="title">원하시는 캐릭터 프로필을 골라주세요~!</p>
	<table>
		<tr>
			<td><img src="<%= m_BaseURL %>/images/type_a.png" style="width:130px; height:130px; padding-top:0px; margin:20px 20px 20px 20px;"></td>
			<td><img src="<%= m_BaseURL %>/images/type_b.png" style="width:130px; height:130px; padding-top:0px; margin:20px 20px 20px 20px;"></td>
			<td><img src="<%= m_BaseURL %>/images/type_c.png" style="width:130px; height:130px; padding-top:0px; margin:20px 20px 20px 20px;"></td>
			<td><img src="<%= m_BaseURL %>/images/type_d.png" style="width:130px; height:130px; padding-top:0px; margin:20px 20px 20px 20px;"></td>
		</tr>
		<tr>
			<td><input type="radio" id="select" name="select" value="type_a.png" <% if(mSelectedImg.equals("type_a.png")) out.print("checked"); %>></td>
			<td><input type="radio" id="select" name="select" value="type_b.png" <% if(mSelectedImg.equals("type_b.png")) out.print("checked"); %>></td>
			<td><input type="radio" id="select" name="select" value="type_c.png" <% if(mSelectedImg.equals("type_c.png")) out.print("checked"); %>></td>
			<td><input type="radio" id="select" name="select" value="type_d.png" <% if(mSelectedImg.equals("type_d.png")) out.print("checked"); %>></td>
		</tr>
		<tr>
			<td><img src="<%= m_BaseURL %>/images/type_e.png" style="width:130px; height:130px; padding-top:0px; margin:20px 20px 20px 20px;"></td>
			<td><img src="<%= m_BaseURL %>/images/type_f.png" style="width:130px; height:130px; padding-top:0px; margin:20px 20px 20px 20px;"></td>
			<td><img src="<%= m_BaseURL %>/images/type_g.png" style="width:130px; height:130px; padding-top:0px; margin:20px 20px 20px 20px;"></td>
			<td><img src="<%= m_BaseURL %>/images/type_h.png" style="width:130px; height:130px; padding-top:0px; margin:20px 20px 20px 20px;"></td>
		</tr>
		<tr>
			<td><input type="radio" id="select" name="select" value="type_e.png" <% if(mSelectedImg.equals("type_e.png")) out.print("checked"); %>></td>
			<td><input type="radio" id="select" name="select" value="type_f.png" <% if(mSelectedImg.equals("type_f.png")) out.print("checked"); %>></td>
			<td><input type="radio" id="select" name="select" value="type_g.png" <% if(mSelectedImg.equals("type_g.png")) out.print("checked"); %>></td>
			<td><input type="radio" id="select" name="select" value="type_h.png" <% if(mSelectedImg.equals("type_h.png")) out.print("checked"); %>></td>
		</tr>
	</table>
	<div class="button">
		<button style="height:31px;">
			<a href="javascript:SelectDone();" style="text-decoration: none;">선택완료</a>
		</button>
	</div>
</form>
