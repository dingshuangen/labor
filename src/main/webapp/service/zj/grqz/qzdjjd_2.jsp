<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/import.jsp" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="<%=request.getContextPath()%>/styles/css/common.css" rel="stylesheet" type="text/css">
<script>
	function either(item,location){
		if(item.checked){
			document.all(reason.id).style.display="";
			for(var i = 0;i<location.length;i++){
				location[i].checked=false;
			}
		}else{
			document.all(reason.id).style.display="none";
			for(var i = 0;i<location.length;i++){
				location[i].checked=false;
			}

		}
	}
	
	function toBack(){
		window.location.href="<%=request.getContextPath()%>/service/zj/grqz/qzdjjd_1.jsp";
	}
</script>
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	//操作按钮
	$(function(){
		$("#btn_op").click(function(){
			var type=$(":checkbox:checked").val();
			var jobId=$(":checkbox:checked").prop("id");
			if(type=="0"){
				$("#from1").attr("action","freeze/"+jobId);
			}else{
				$("#from1").attr("action","thaw/"+jobId);
			}
			alert("操作成功，返回首页。")
			$("#from1").submit();
		});
		
	});
</script>
</head>
<body>
<form id="from1" method="post" action="" name="form1">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="20" valign="bottom"><img src="<%=request.getContextPath()%>/styles/images/right/now.gif" width="11" height="12">
          当前位置：职业介绍 &gt; 个人求职 &gt; 冻结解冻</td>
        </tr>
        <tr>
          <td valign="bottom" background="<%=request.getContextPath()%>/styles/images/right/dsline.gif" height="8"><img src="<%=request.getContextPath()%>/styles/images/index/spacer.gif"></td>
        </tr>
      </table></td>
  </tr>
   <tr>
    <td align="center" valign="top">
	<table width="98%" border="0" cellpadding="0" cellspacing="0"   class="title">
      <tr>
        <td width="30">
		<table width="30" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td ><img src="<%=request.getContextPath()%>/styles/css/bb_d.gif"></td>
          </tr>
        </table></td>
        <td  valign="bottom">查询结果&nbsp;&nbsp;&nbsp;提示：[点击姓名可以查看详细信息]</td>
      </tr>
    </table>
  <tr>
    <td align="center" valign="top" > 
      <TABLE width="98%" border=1 cellPadding=0 cellSpacing=0 bordercolor="#FFFFFF" class="tablebody">
          <TBODY>
            
            <TR align="center" class="line4"> 
              <TD width="10%">操&nbsp;&nbsp;作</TD>
              <TD width="6%">姓名</TD>
              <TD width="6%">性别</TD>
              <TD width="16%">出生年月日</TD>
              <TD width="20%">居住地址</TD>
              <TD width="10%">联系电话</TD>
              <TD width="13%">登记日期</TD>
              <TD width="6%">状态</TD>
            </TR>  
            <c:forEach items="${info }" var="info">
           		<TR align="center" class="line4"> 
	              <TD width="10%"><input type="checkbox" name="cb" value="${info.status}" id="${info.jobId }" onclick="either(this,form1.cb)">${info.status==0?'冻结':'解冻'}</TD>
	              <TD width="6%"><a href="getDetailInfo?bipId=${info.bip_id}" style="cursor:hand">${info.name}</a></TD>
	              <TD width="6%">${info.sex}</TD>
	              <TD width="16%">${info.birthday}</TD>
	              <TD width="20%">${info.address}</TD>
	              <TD width="10%">${info.mobile}</TD>
	              <TD width="13%">${info.recordTime}</TD>
	         
	              <TD width="6%">${info.status==0?"正常":"冻结"}</TD>
            	</TR>
            </c:forEach>
          </TBODY>
      </TABLE>
 <div id="data" style="display:none" align="center">
		  <table border="0" cellpadding="0" cellspacing="5" bordercolor="#9DCBEC">
			
		  </table>
	  </div>
		 </td>
  </tr>
</table>
<table id="reason" width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" style="display:none">
	<tr><td>&nbsp;</td></tr>
	<tr><td align="center">请输入操作原因：</td></tr>
		<tr>
			<td align="center" valign="top">
				<textarea name="djreason" cols="55" rows="8"></textarea>
			</td>
		</tr>
</table>
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
	<tr><td>&nbsp;</td></tr>
	<tr  align="center" class="line2"> 
		<td> 
		<input name="button1" type="button" id="btn_op" class="BUTTONs3"  value="确定">&nbsp;&nbsp;
		<input name="button2" type="reset" class="BUTTONs3"  value="取消">&nbsp;&nbsp;
		<input name="button3" type="button" class="BUTTONs3"  value="返 回" onclick="toBack()">
		</td>
	</tr>
</table>

</form>	

</body>

</html>
