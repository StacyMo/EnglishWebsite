<%@ page language="java"  pageEncoding="gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>ѧ����Ϣ</title>
    <link href="css/CSS.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="js/Calendar.js"></script>
		<script type="text/javascript" src="js/popup.js"></script>
	  <script type="text/javascript">
	    function up(tt)
	    {
	        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:300,height:50});
            pop.setContent("contentUrl","upload.jsp?Result="+tt);
            pop.setContent("title","�ļ��ϴ�");
            pop.build();
            pop.show();
	    }
		</script>
  </head>
		<script language="javascript">
			function check(){
				if(document.form1.xuehao.value==""){
					alert("������ѧ��");
					document.form1.xuehao.focus();
					return false;
				}
				if(document.form1.xingming.value==""){
					alert("����������");
					document.form1.xingming.focus();
					return false;
				}
				if(document.form1.dianhua.value==""){
					alert("������绰");
					document.form1.dianhua.focus();
					return false;
				}
				if(document.form1.shenfenzheng.value==""){
					alert("����������֤");
					document.form1.shenfenzheng.focus();
					return false;
				}
				if(document.form1.mima.value==""){
					alert("����������");
					document.form1.mima.focus();
					return false;
				}
			}
			function gow()
			{
				document.location.href="xueshengxinxi_add.jsp?jihuabifffanhao="+document.form1.jihuabifffanhao.value;
			}
		</script>
<body >
  <form name="form1" id="form1" method="post" action="xueshengxinxi_add_post.jsp">
  ����ѧ����Ϣ<br><br>
   <table width="60%" border="1" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">    
	   <tr><td align="center">ѧ��</td><td><input name='xuehao' type='text' id='xuehao' value='' />&nbsp;*</td></tr>
	   <tr><td align="center">����</td><td><input name='xingming' type='text' id='xingming' value='' />&nbsp;*</td></tr>
	   <tr><td align="center">�༶</td><td><select name='banji' id='banji'><%String sql="select banji from banjixinxi order by id desc";ResultSet RS_result=connDbBean.executeQuery(sql);while(RS_result.next()){%><option value="<%= RS_result.getString("banji")%>" ><%=RS_result.getString("banji")%></option><%}%></select></td></tr>
	   <tr><td align="center">�Ա�</td><td><select name='xingbie' id='xingbie'><option value="��">��</option><option value="Ů">Ů</option></select></td></tr>
	   <tr><td align="center">�绰</td><td><input name='dianhua' type='text' id='dianhua' value='' />&nbsp;*</td></tr>
	   <tr><td align="center">��Ƭ</td><td><input name='zhaopian' type='text' id='zhaopian' size='50' value='' />&nbsp;<input type='button' value='�ϴ�' onClick="up('zhaopian')"/></td></tr>
	   <tr><td align="center">����֤</td><td><input name='shenfenzheng' type='text' id='shenfenzheng' value='' size='50' />&nbsp;*</td></tr>
	   <tr><td align="center">��ͥסַ</td><td><input name='jiatingzhuzhi' type='text' id='jiatingzhuzhi' value='' size='50' /></td></tr>
	   <tr><td align="center">��ע</td><td><textarea rows="1" cols="60" name="beizhu" onscroll="this.rows++;" id='beizhu'></textarea></td></tr>
	   <tr><td align="center">����</td><td><input name='mima' type='text' id='mima' value='' />&nbsp;*</td></tr>
     <tr align="center">
	     <td colspan="2">
			   <input type="submit" name="Submit" value="�ύ" onclick="return check();" />&nbsp;&nbsp;
			   <input type="reset" name="Submit2" value="����" />
	     </td>
     </tr>
		</table>
	</form>
</body>
</html>
