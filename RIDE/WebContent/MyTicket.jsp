<HTML>

<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>

<%@ page session="true" %>
<% String TicketId = request.getParameter("TicketId");%>

<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC="Images/AjaxCall.js"></script>

<SCRIPT LANGUAGE="JavaScript">
	function setAction(URL,Obj){
		var f = document.forms(0);
		var TicketId = f.TicketId.value;
		var RouteId = f.RouteId.value;
		var BusId = f.BusId.value;
		var PaymentId = f.PaymentId.value;
		var CustomerId = f.CustomerId.value;
		var Seats = f.Seats.value;
		var NoPass = Seats.split(",").length;
		var ParamsList = "?TicketId="+TicketId+"&CustomerId="+CustomerId+"&RouteId="+RouteId+"&BusId="+BusId+"&PaymentId="+PaymentId+"&NoPass="+NoPass;
		Obj.target='ResultFrame';
		Obj.href=URL+ParamsList;
		//fnCancelTicket(URL+ParamsList);
	}
	/*function fnCancelTicket(URL)
	{
		var divObj = document.getElementById("infodiv");
		alert(URL);
		ajaxFunction(URL,divObj);
	}*/
</SCRIPT>
<head>
<body Class='SC'>
<HR>
<B><FONT COLOR="#CC00CC" face='verdana'>My Ticket</FONT></B>
<HR>
<BR><BR>
<FORM ACTION="">
<input type='Hidden' name='TicketId' value="<%=TicketId%>">
<TABLE class='notepad' align='center'>


<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

try
{
	/*Connection to  database is made with JDBC class one driver*/
	
	con = com.ewheelz.ConnectionPool.getConnection();
	stmt =  con.createStatement();
	String Query = "Select * from ticketdetails Where CustomerId='"+session.getAttribute("unm")+"' and Status='Booked'";
	System.out.println(" Qry->"+Query);
	rs = stmt.executeQuery(Query);
	int count=0,NumRows=0;
	%>
			<TR class="row_title">
				<TD>Ticket Id</TD>
				<TD>CustomerId</TD>
				<TD>From</TD>
				<TD>To</TD>
				<TD>Journey Date</TD>
				<TD>Start Time</TD>
				<TD>Reach Time</TD>
				<TD>Seats</TD>
				<TD>Boarding Point</TD>
				<TD>Net Amount</TD>

			</TR>	
		<%
		while(rs.next())
			{
					//Display body
					String RouteId=rs.getString(1);
					String CustomerId=rs.getString(3);
					String rFrom=rs.getString(4);
					String rTo=rs.getString(5);
					String JourneyDate=rs.getString(6);
					String StartTime=rs.getString(7);
					String ReachTime=rs.getString(8);
					String Seats=rs.getString(9);
					String BoardingPoint=rs.getString(10);
					String NetAmount=rs.getString(11);
					String Status=rs.getString(12);
					String PaymentId=rs.getString(13);
					String BusId=rs.getString(14);

					%>
						<TR class="<%=(count%2==0)? "row_odd" : "row_even" %>" >
							<TD><%=RouteId%><INPUT TYPE="hidden" NAME="RouteId" value="<%=RouteId%>"></TD>
							<TD><%=CustomerId%><INPUT TYPE="hidden" NAME="CustomerId" value="<%=CustomerId%>"></TD>
							<TD><%=rFrom%><INPUT TYPE="hidden" NAME="rFrom" value="<%=rFrom%>"></TD>
							<TD><%=rTo%><INPUT TYPE="hidden" NAME="rTo" value="<%=rTo%>"></TD>
							<TD><%=JourneyDate%><INPUT TYPE="hidden" NAME="JourneyDate" value="<%=JourneyDate%>"></TD>
							<TD><%=StartTime%><INPUT TYPE="hidden" NAME="StartTime" value="<%=StartTime%>"></TD>
							<TD><%=ReachTime%><INPUT TYPE="hidden" NAME="ReachTime" value="<%=ReachTime%>"></TD>
							<TD><%=Seats%><INPUT TYPE="hidden" NAME="Seats" value="<%=Seats%>"></TD>
							<TD><%=BoardingPoint%><INPUT TYPE="hidden" NAME="BoardingPoint" value="<%=BoardingPoint%>"></TD>
							<TD><%=NetAmount%><INPUT TYPE="hidden" NAME="NetAmount" value="<%=NetAmount%>"></TD>
							<INPUT TYPE="hidden" NAME="PaymentId" value="<%=PaymentId%>">
							<INPUT TYPE="hidden" NAME="BusId" value="<%=BusId%>">
						</TR>

<div id='infodiv'></div>
<P align=right>
	
</P>
<%
				count++;
			}%>
				</TABLE>
	<%
}
catch(Exception e)
{
	System.out.println("Exception"+e);
}
%>
</FORM>
</BODY>
</HTML>