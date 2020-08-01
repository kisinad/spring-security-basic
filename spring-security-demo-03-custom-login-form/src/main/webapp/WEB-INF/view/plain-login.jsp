<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Custom Login Page</title>
</head>
<body>
	<h3>My Custom Login Page</h3>

	<form:form
		action="${pageContext.request.contextPath}/authenticateTheUser"
		method="POST">
		<p>
			User Name: <input type="text" name="username">

		</p>

		<p>
			Password: <input type="password" name="password">

		</p>


		<input type="submit" name="Login">



	</form:form>
</body>
</html>