<!--
		File : Header.html
		Purpose : Displaying header section
-->

<html>
<HEAD>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<Body class="SC">
<IMG SRC="Images/eWheelzLogo.jpg" WIDTH="321" HEIGHT="90" BORDER="0" ALT="">
</body>
<HTML>

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<head>

	<LINK href="styles.css" type="text/css" rel="stylesheet">
</head>
<BODY onload="document.LOGIN.Name.focus();" CLASS="SC">
<HR>
<center><a href="Login.jsp"><B><FONT size="5" COLOR="#CC00CC" face='verdana'><h3>SRTC Employees </FONT></B></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="ULogin.jsp"><B><FONT  size="5"COLOR="#CC00CC" face='verdana'>Travellers </FONT></B></a>&nbsp;
</center><HR>
<BR><BR>
<FORM NAME='LOGIN' ACTION="Validate.jsp">

<TABLE align='left' width="60%" cellspacing=0 cellpadding=0>
<br><br><center><img src="G:\Acadimic Projects\Major Project\Images\first.jpg" width="700" height="430" border="0" alt=""></center>
</TR>
</TABLE>

</FORM>
</BODY>
</HTML>


</html>