<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Custom Login Page</title>
<style type="text/css">
	.failed{
		color: red;
	}
</style>

</head>
<body>
	<h3>My Custom Login Page</h3>

	<form:form
		action="${pageContext.request.contextPath}/authenticateTheUser"
		method="POST">
		
		<c:if test="${ param.error != null}">
		
			<i class="failed">Sorry! you entered a wrong username/password</i>
		</c:if>
		<p>
			User Name: <input type="text" name="username">

		</p>

		<p>
			Password: <input type="password" name="password">

		</p>


		<input type="submit" value="Login">



	</form:form>
</body>
</html>