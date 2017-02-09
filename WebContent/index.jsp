<%--
  Created by IntelliJ IDEA.
  User: hkfq4
  Date: 07.02.2017
  Time: 09:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>JSPReqFormParam</title>
</head>
<body>
<nav><a href="index.jsp">index.jsp</a> / <a href="FormShow.jsp">FormShow.jsp</a></nav>
<h1>JSPReqFormParam</h1>
<h3>JSP Beispiele mit Form Parameter, HTTP Request Headers und JSP UseBean</h3>

<jsp:useBean id="calcCube" class="ch.ziitlos.web.Calc" />
Bie Berechnung: 5 *  5 *  5 = <%= calcCube.cube(5) %>

<hr>

<jsp:useBean id="sampleBean" class="ch.ziitlos.web.SampleBean">
    <jsp:setProperty name="sampleBean" property="param1" value="value1" />
</jsp:useBean>

---> SampleBean: <%= sampleBean %>
<br>
Param1 <jsp:getProperty name="sampleBean" property="param1" />
<br>
Param2 <jsp:getProperty name="sampleBean" property="param2" />
<br>

<hr>

<%
    String userVorname= "N/A";
    if( request.getParameter("vorname") != null){
        userVorname = request.getParameter("vorname");
    }

    String userNachname= "N/A";
    if( request.getParameter("nachname") != null){
        userVorname = request.getParameter("nachname");
    }
%>

<form name="getForm" action="index.jsp" method="get">
    <input type="text" name="vorname" value="">
    <input type="submit" name="sendenGET" value="Vornamen senden mit GET">
</form>
<br>
<form name="postForm" action="index.jsp" method="post">
    <input type="text" name="nachname" value="">
    <input type="submit" name="sendenPOST" value="Nachnamen senden mit POST">
</form>
<br>
User Vorname: <%= userVorname %><br>
User Nachname: <%= userNachname %>

<hr>

<h1>Form Parameters</h1>
<table border="1" cellpadding="4" cellspacing="0">
    <%
        // you can get an enumeratable list
        // of parameter keys by using request.getParameterNames()
        Enumeration en = request.getParameterNames();

        // enumerate through the keys and extract the values
        // from the keys!
        while (en.hasMoreElements()) {
            String parameterName = (String) en.nextElement();
            String parameterValue = request.getParameter(parameterName);
    %>
    <tr>
      <td><%= parameterName %></td>
      <td><%= parameterValue %></td>
    </tr>
    <%
        }
    %>

</table>

<hr>

<h1>HTTP Request Headers Received</h1>
<table border="1" cellpadding="4" cellspacing="0">
    <%
        Enumeration eNames = request.getHeaderNames();
        while (eNames.hasMoreElements()) {
            String name = (String) eNames.nextElement();
            String value = normalize(request.getHeader(name));
    %>
    <tr>
      <td><%= name %></td>
      <td><%= value %></td>
    </tr>
    <%
        }
    %>
</table>

</body>
</html>

<%!
    private String normalize(String value)
    {
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            sb.append(c);
            if (c == ';')
                sb.append("<br>");
        }
        return sb.toString();
    }
%>

