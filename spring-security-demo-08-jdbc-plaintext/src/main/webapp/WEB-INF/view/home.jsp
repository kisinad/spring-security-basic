<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Luv2Code Home page</title>
</head>
<body>
	<h2>Luv2Code company Home page</h2>
	<p>Welcome to the luv2code company Home Page</p>

	<!-- Display user name and role -->

	<p>
		User:
		<security:authentication property="principal.username" />
		<br> <br> Role(s):
		<security:authentication property="principal.authorities" />

	</p>

	<hr>

	<security:authorize access="hasRole('MANAGER')">
		<!-- Add a link to point to /leaders .. this is for the managers -->
		<p>
			<a href="${pageContext.request.contextPath}/leaders">LeaderShip
				Meeting</a> (Only for Manager peeps)

		</p>

	</security:authorize>


	<security:authorize access="hasRole('ADMIN')">
		<!-- Add a link to point to /systems .. this is for admins -->

		<p>
			<a href="${pageContext.request.contextPath}/systems">IT Systems
				Meeting</a> (Only for ADMIN peeps)

		</p>
	</security:authorize>
	<!-- add logout button -->
	<form:form action="${pageContext.request.contextPath}/logout"
		method="POST">
		<input type="submit" value="Logout" />
	</form:form>
</body>
</html>