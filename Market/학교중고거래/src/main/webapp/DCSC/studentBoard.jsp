<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.board.Dao" %>
<%@page import="com.board.Dto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
   // 함수 호출 
   Dao dao = new Dao();
   ArrayList<Dto> dtos = dao.list();
   String studentNumber = request.getParameter("studentNumber");

%>


<!DOCTYPE html>
<html>
<head>
<title>DCSC</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/NavFooter.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
	 h1 {
	 	color: #fcfcfc;
	 }
	 
	 a {
			text-decoration-line: none;
			color: black;
	  }
		
	  a:hover { 
			text-decoration:none !important;
			color: black;
	  }
		
	  .user-img {
			min-height: 80px;
			min-width: 80px;
			max-height: 80px;
			max-width: 80px;
			border-radius: 10%;
	  }
	
	  .btn-custom-color {
	    background-color: #8754ff;
	    border-color: #8754ff;
	    color: #fff;
	    margin-bottom: 25px;
	  }
	  
	  .btn-custom-color:hover {
	    background-color: #ff2667;
	    border-color: #ff2667;
	  }

	  .user-topik {
	  	background-color:#F0F6FA;
	  	padding: 6px;
	    border-radius: 10px;
	  	color: #8AB9E8;
	  }
	  
	  .content:hover {
	  	color: #96c9ff !important;
	  }
	  
</style>
<script>
    function w3_open() {
        document.getElementById("main").style.marginLeft = "25%";
        document.getElementById("mySidebar").style.width = "25%";
        document.getElementById("mySidebar").style.display = "block";
        document.getElementById("openNav").style.display = 'none';
    }
    function w3_close() {
        document.getElementById("main").style.marginLeft = "0%";
        document.getElementById("mySidebar").style.display = "none";
        document.getElementById("openNav").style.display = "inline-block";
    }


</script>

<body>
         <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a href="main.jsp"><img src="images/dit.png" alt="" class="dit-img"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="free.jsp">자유게시판</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="studentBoard.jsp">학생게시판</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="shop.jsp">중고장터</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="announcement.jsp">공지사항</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link nav-job" href="job.jsp">|&nbsp; &nbsp; &nbsp; 채용공고 &nbsp; &nbsp; &nbsp;|</a>
                    </li>
                </ul>
               
                <ul class="navbar-nav mb-lg-1 mb-lg-0">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            정보
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="profile.jsp">프로필</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="logout.jsp">로그아웃</a></li>
                            <li><a class="dropdown-item" href="admin_pass.jsp">관리자메뉴</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="mx-5pricing-header p-5 pb-md-4 text-start"
        style="background-image: linear-gradient(120deg, #8754ff 0%, #404040 100%);border-radius: 20px; margin: 35px 100px 35px 100px;">
        <h1 class=" fw-normal">학생게시판</h1>
        <p class="fs-5 text-white m-lg-3">
            <strong>컴퓨터소프트웨어학과</strong>에 소속된 학생들과 함께 정보를 나누세요.
        </p>
    </div>
    
	<div class="container d-flex justify-content-center">
	  <div class="row">
	    <div class="col-6">
	      <a href="studentWriting.jsp">
	        <button class="btn btn-custom-color btn-lg btn-block" style="width: 250px;">
	          <i class="bi bi-pencil-fill"></i> 작성하기
	        </button>
	      </a>
	    </div>
	  </div>
	</div>
	
    <hr>

        <%
            for(Dto dto : dtos) {
        %>
		<ul class="container">
		  <li>
		    <a href="studentWritingInfo.jsp?num=<%=dto.getnum()%>">
		      <div class="d-flex align-items-start">
		        <img class="user-img" src="<%= dto.getuserimg() %>"/>
		        <div class="ms-3">
		          <div class="user-info" style="display: inline; margin-top: -20px; width: 200px;">
    					<span class="user-name"><%=dto.getwriter() %> · </span>             
				<span class="user-date text-muted"><%=dto.getdate() %></span>
		          </div>
		        </div>
		      </div>
		      <div style="margin-top: 35px; margin-left: 0px;">
		        <h4 class="content"><%=dto.gettitle()%></h4>
		        <p class="text-muted content"><%=dto.getcontent() %></p>
		      </div>
		      <div class="text-end">
		        <span class="user-topik"><%=dto.gettopik() %></span>
		      </div>
		      <hr>
		    </a>
		  </li>
		</ul>


    <% } %>

    <hr>
        <footer class="py-3 my-4">
        <img src="images/dit.png" alt="" class="dit-img">
        <ul>
            <li class="nav-item">
                <a class="nav-link" href="https://github.com/kimsinyoung2" target="_blank"> <i class="bi bi-github"></i>
                    김신영</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="https://github.com/K1mHyoM1n" target="_blank"> <i class="bi bi-github"></i>
                    김효민</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="https://github.com/SeungJin051" target="_blank"> <i class="bi bi-github"></i>
                    임승진</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="https://github.com/wjsrudals411" target="_blank"> <i class="bi bi-github"></i>
                    전경민</a>
            </li>
        </ul>
        <br>
        <br>
        <br>
        <div class="footer-info">
            <p class="text-center text-muted">주소 | (47230) 부산광역시 부산진구 양지로 54
                TEL : 051-852-0011~3 FAX : 051-860-3270</p>
            <p class="text-center text-muted">&copy; 2023 DONG-EUI INSTITUTE OF TECHNOLOGY. ALL RIGHTS RESERVED.
            </p>
        </div>
    </footer>
</body>

</html>