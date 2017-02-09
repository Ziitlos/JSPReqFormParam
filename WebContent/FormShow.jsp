<%@ page import="java.util.*" %>
<%
    final String s1 = "<tr bgcolor='#EBEEEE'><td>";
    final String s2 = "</td><td>";
    final String s3 = "</td></tr>\n";
    StringBuffer sb = new StringBuffer();
    Enumeration parameterList = request.getParameterNames();
    while (parameterList.hasMoreElements()) {
        String sName = parameterList.nextElement().toString();
        String[] sMultiple = request.getParameterValues(sName);
        if (1 >= sMultiple.length)
            sb.append(s1 + sName + s2 + request.getParameter(sName) + s3);
        else
            for (int i = 0; i < sMultiple.length; i++) {
                sb.append(s1 + sName + "[" + i + "]" + s2 + sMultiple[i] + s3);
            }
    }
    if (0 < sb.length())
        sb.insert(0, "<table border=0 cellspacing=3 cellpadding=3>\n"
                + "<tr bgcolor='#EBEEEE'><th colspan='2'>"
                + "<big>Erhaltene Parameter</big></th></tr>\n")
                .append("</table>\n");
%>

<html>
<body>
<nav><a href="index.jsp">index.jsp</a> / <a href="FormShow.jsp">FormShow.jsp</a></nav>
<form action="FormShow.jsp?urlParm=seeUrl#Scroll" method="post">
    <input type="hidden" name="hidden" value="versteckt">
    <table border=0 cellspacing=3 cellpadding=3>
        <tr bgcolor='#EBEEEE'>
            <th colspan='2'>
                <big>Formular</big><br>
                Bitte Eingaben ändern und Submit betätigen
            </th>
        </tr>
        <tr bgcolor="#EBEEEE">
            <td>SelectDropDown</td>
            <td>
                <select name="SelectDropDown" size=1>
                    <option value="1">Opt. 1</option>
                    <option value="2" selected>Opt. 2</option>
                    <option value="3">Opt. 3</option>
                    <option value="4">Opt. 4</option>
                </select>
            </td>
        </tr>
        <tr bgcolor="#EBEEEE">
            <td>SelectMultiple</td>
            <td>
                <select name="SelectMultiple" size=3 multiple>
                    <option value="1">Opt. 1</option>
                    <option value="2">Opt. 2</option>
                    <option value="3" selected>Opt. 3</option>
                    <option value="4" selected>Opt. 4</option>
                </select>
            </td>
        </tr>
        <tr bgcolor="#EBEEEE">
            <td>Textarea</td>
            <td>
                <textarea name="Textarea" cols=20 rows=3>Text ...</textarea>
            </td>
        </tr>
        <tr bgcolor="#EBEEEE">
            <td>Textfeld</td>
            <td>
                <input type="text" name="Textfeld" value="Text ..." size=20 maxlength=50>
            </td>
        </tr>
        <tr bgcolor="#EBEEEE">
            <td>Passwort</td>
            <td>
                <input type="password" name="Passwort" value="xx" size=20 maxlength=10>
            </td>
        </tr>
        <tr bgcolor="#EBEEEE">
            <td>Checkboxen cb1...cb3</td>
            <td>
                <input type="checkbox" name="cb1">
                <input type="checkbox" name="cb2" checked>
                <input type="checkbox" name="cb3">
            </td>
        </tr>
        <tr bgcolor="#EBEEEE">
            <td>Radiobuttons ra</td>
            <td>
                <input type="radio" name="ra" value="1">
                <input type="radio" name="ra" value="2" checked>
                <input type="radio" name="ra" value="3">
            </td>
        </tr>
        <tr bgcolor="#EBEEEE">
            <td>Submit</td>
            <td>
                <button type="submit" name="Submit" value="SubmitImg">
                    <img src="http://www.torsten-horn.de/logo.gif" alt="Submit">
                </button>
                <input type="submit" name="Submit" value="Submit1">
                <input type="submit" name="Submit" value="Submit2">
            </td>
        </tr>
    </table>
</form>

<a name="Scroll"></a>
<%= sb.toString() %>

</body>
</html>