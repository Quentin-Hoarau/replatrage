<%@ include file="/WEB-INF/views/includes.jsp" %>

<html>
<head>
   
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.png">
    <title>Utilisateur </title>

	
	<!-- Bootstrap core CSS -->
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<!-- bootstrap theme -->
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<!--external css-->
	<!-- font icon -->
	<link href="<c:url value="/resources/css/elegant-icons-style.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet">
	<!-- full calendar css-->
	<link href="<c:url value="/resources/assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/assets/fullcalendar/fullcalendar/fullcalendar.css" />" rel="stylesheet">
	<!-- easy pie chart-->
	<link href="<c:url value="/resources/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" />" rel="stylesheet" type="text/css" media="screen">
	<!-- owl carousel -->
	<link href="<c:url value="/resources/css/owl.carousel.css" />" rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources/css/jquery-jvectormap-1.2.2.css" />" rel="stylesheet">
		<!-- Custom styles for this template -->
	<link href="<c:url value="/resources/css/fullcalendar.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/widgets.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/style-responsive.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/xcharts.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/jquery-ui-1.10.4.min.css" />" rel="stylesheet">
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="<c:url value="/resources/js/html5shiv.js"/>"></script>
	<script src="<c:url value="/resources/js/respond.min.js"/>"></script>
      <script src="<c:url value="/resources/js/lte-ie7.js"/>"></script>
	<![endif]-->
	</head>
<body>
<section id="container" class="">
	<%@ include file="/WEB-INF/views/header.jsp" %>
	<%@ include file="/WEB-INF/views/sidebar.jsp" %>
	
	
	<section id="main-content">
            <section class="wrapper">
					<h3 class="page-header"><i class="fa fa-laptop"></i> Utilisateurs </h3>
			
	<c:if test="${!empty message}">
		<c:if test="${fn:contains(message, 'SUCCES')}">
	        <div class="alert alert-success">${message}</div>
	    </c:if>
	    <c:if test="${fn:contains(message, 'ERREUR')}">
	        <div class="alert alert-danger">${message}</div>
	    </c:if>
	</c:if>
	
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<h2>
		    Ajouter un utilisateur 
		</h2>
		 
		 <c:url var="addAction" value="/User/add" ></c:url>
		 
		<form:form action="${addAction}" commandName="User">
		<table>
		    <c:if test="${!empty User.nom}">
		    <tr>
		        <td>
		            <form:label path="id">
		                <spring:message text="ID"/>
		            </form:label>
		        </td>
		        <td>
		            <form:input path="id" readonly="true" size="8"  disabled="true" />
		            <form:hidden path="id" />
		        </td> 
		    </tr>
		    </c:if>
		    <tr>
		        <td>
		            <form:label path="nom">
		                <spring:message text="nom"/>
		            </form:label>
		        </td>
		        <td>
		            <form:input class="form-control" path="nom" />
		        </td> 
		    </tr>
		    <tr>
		        <td>
		            <form:label path="prenom">
		                <spring:message text="prenom"/>
		            </form:label>
		        </td>
		        <td>
		            <form:input class="form-control" path="prenom" />
		        </td>
		    </tr>
		    <tr>
		        <td>
		            <form:label path="username">
		                <spring:message text="username"/>
		            </form:label>
		        </td>
		        <td>
		            <form:input class="form-control" path="username" />
		        </td>
		    </tr>
		    <tr>
		        <td>
		            <form:label path="password">
		                <spring:message text="password"/>
		            </form:label>
		        </td>
		        <td>
		            <form:password class="form-control" path="password" />
		        </td>
		    </tr>
		    <tr>
		        <td>
		            <form:label path="enabled">
		                <spring:message text="enabled"/>
		            </form:label>
		        </td>
		        <td>
		            <form:checkbox path="enabled" />
		        </td>
		    </tr>
		    <tr>
		        <td colspan="2">
		            <c:if test="${!empty User.nom}">
		                <input class="btn btn-default" type="submit"
		                    value="<spring:message text="Edit User"/>" />
		            </c:if>
		            <c:if test="${empty User.nom}">
		                <input class="btn btn-default" type="submit"
		                    value="<spring:message text="Add User"/>" />
		            </c:if>
		        </td>
		    </tr>
		</table>  
		</form:form>
	</sec:authorize>
	
	<br>
	<h3>Users List</h3>
	<c:if test="${!empty listUsers}">
	    <table class="table table-striped">
	    <tr>
	        <th width="80">User ID</th>
	        <th width="120">User Name</th>
	        <th width="120">User Prenom</th>
	        <sec:authorize access="hasRole('ROLE_ADMIN')">
	        	<th width="60">Edit</th>
	        	<th width="60">Delete</th>
	        </sec:authorize>
	    </tr>
	    <c:forEach items="${listUsers}" var="User">
	        <tr>
	            <td>${User.id}</td>
	            <td>${User.nom}</td>
	            <td>${User.prenom}</td>
	            <sec:authorize access="hasRole('ROLE_ADMIN')">
		            <td><a href="<c:url value='/User/edit/${User.id}' />"class="btn btn-primary" >Edit</a></td>
		            <td><a href="<c:url value='/User/remove/${User.id}' />"class="btn btn-danger">Delete</a></td>
	            </sec:authorize>
	        </tr>
	    </c:forEach>
	    </table>
	</c:if>
            </section>
            </section>
                        </section>
</body>
</html>