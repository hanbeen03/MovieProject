<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="../movieui/css/mstyles.css" />
    <link rel="stylesheet" href="../MovieProject/movieui/css/mstyles.css" />
    <style>
	    #content {
	    	display: flex;
	    	justify-content: center;
	    	padding-top: 150px;
	    }
    </style>
<meta charset="UTF-8">
<title>영화 정보</title>
</head>
<body>
	<!--main 화면 header start-->
    <div class="main-bar">
      <div class="main-bar__column">
        <span
          ><a href="/MovieProject/moviemain.do"><img src="../movieui/css/screen/images/logo.png" /></a
        ></span>
      </div>
      <div class="main-bar__column">
        <span>
          <a class="main-bar__movie" href="/MovieProject/moviedetail.do">영화정보</a>
          <a class="main-bar__movie" href="#">다운로드</a>
        </span>
      </div>
      <div class="main-bar__column">
        <span><a class="main-bar__btn" href="/MovieProject/userjoin.do">로그인</a></span>
        <span>|</span>
        <span><a class="main-bar__btn" href="/MovieProject/requserjoin.do">회원가입</a></span>
      </div>
    </div>
    <!-- main 화면 header end-->
    <!-- main 화면 body start-->
    <div class="main-body">
      <div class="main-sidebar"></div>
      <div class="main-contents">
		<div id="content">
			<div class="search">
				<form action="/MovieProject/moviesearch.do" method="post">
					<input type="text" name="keyword" placeholder="검색어"/>
					<input class="" type="submit" value="검색"/>
				</form>
			</div>
			<br/>
			<div class="movie">
				<c:forEach var="movie" items="${movieList}">
					<ul>
						<li><a href="/MovieProject/moviedetail.do?mId=${movie.mid}">
							${movie.mtitle }
						</a></li>
						<li>${movie.mgrade }</li>
						<li>${movie.mpremiere }</li>
					</ul>
				</c:forEach>
			</div>
			<div class="page">
				<!-- 페이징 버튼 -->
				<c:if test="${moviePageDTO.hasMovie()}">
					<!-- 뒤로가기 버튼 여부 -->
					<c:if test="${moviePageDTO.startPage > 10}">
						<a href="/MovieProject/movieselect.do?page=${moviePageDTO.startPage - 10}">
							[이전]
						</a>
					</c:if>
					
					<!-- 페이지 10개 -->
					<c:forEach var="pNo" begin="${moviePageDTO.startPage}" end="${moviePageDTO.endPage}">
						<a href="/MovieProject/movieselect.do?page=${pNo}">
							[${pNo}]
						</a>
					</c:forEach>
					
					<!-- 다음 페이지 여부-->
					<c:if test="${moviePageDTO.endPage < moviePageDTO.totalPages}">
						<a href="/MovieProject/movieselect.do?page=${moviePageDTO.startPage + 10}">
							[다음]
						</a>
					</c:if>
				</c:if>
			</div>
		</div>
      </div>
      <div class="main-sidebar"></div>
    </div>
    <!-- main 화면 body end-->
</body>
</html>