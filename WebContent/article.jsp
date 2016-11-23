<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!-- saved from url=(0041)http://v3.bootcss.com/examples/jumbotron/ -->
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="http://v3.bootcss.com/favicon.ico">
<title>Demo</title>
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/jumbotron.css" rel="stylesheet">
</head>

<body>
	<!-- Fixed navbar -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">You can search</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="./topic.jsp">Topic</a></li>
					<li><a href="./word.jsp">Word</a></li>
					<li class="active"><a href="./article.jsp">Article</a></li>
					<li>hidden element</li>
					<a class="navbar-brand" href="#"> More detail in</a>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Charts <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li class="dropdown-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	<!-- Main jumbotron for a primary marketing message or call to action -->
	<div class="jumbotron">
		<div class="container">
			<h1>
				Welcome to our <br> Documents Analysis Platform!
			</h1>
			<p>You can input some words of titles, and see more related
				information about its article!</p>
			<form id="searchform" class="navbar-form  " role="search"
				method="post" action="articleSearch">
				<div class="form-group form-group-lg">
					<input type="text" id="search" name="search" class="form-control"
						data-provide="typeahead" autocomplete="off"
						placeholder="Searching Words">
				</div>
				<input type="text" id="index" name="index" hidden="true">
				<button type="submit" class="btn btn-primary btn-lg" id="searchbtn">
					Search</button>
			</form>
		</div>
	</div>
	<div class="container">
		<%@include file="bottom_part.jsp"%>
	</div>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="./js/Bootstrap-3-Typeahead-master/bootstrap3-typeahead.js"></script>
	<script type="text/javascript">
		$.get('data/title-id.json', function(data) {
			$("#search").typeahead({
				source : data
			});
		}, 'json');

		var $input = $('#search');
		$input.change(function() {
			var current = $input.typeahead("getActive");
			//alert(current.index)
			if (current) {
				document.getElementById("index").value = current.index;
				if (current.name == $input.val()) {
					// This means the exact match is found. Use toLowerCase() if you want case insensitive match.
				} else {
					// This means it is only a partial match, you can either add a new item 
					// or take the active if you don't want new items
				}
			} else {
				// Nothing is active so it is a new value (or maybe empty value)
			}
		});
	</script>
</body>

</html>