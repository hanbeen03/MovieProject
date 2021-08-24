<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<link rel="stylesheet" href="../movieui/css/mstyles.css" />
<link rel="stylesheet" href="../MovieProject/movieui/css/mstyles.css" />
<style>
#contents {
	/* 	 	display: flex;  */
	justify-content: center;
	text-align: center;
	margin: 20px auto 20px auto;
}

.listPage {
	
}
</style>
<meta charset="UTF-8">
<title>리뷰 디테일</title>
</head>
<body>
	<!--main 화면 header start-->
	<div class="main-bar">
		<div class="main-bar__column">
			<span><a href="/MovieProject/moviemain.do"><img
					src="<%=request.getContextPath()%>/movieui/css/screen/images/logo.png" /></a></span>
		</div>
		<div class="main-bar__column">
			<span> <a class="main-bar__movie"
				href="/MovieProject/movieselect.do">영화정보</a> <a
				class="main-bar__movie" href="#">다운로드</a>
			</span>
		</div>
		<c:if test="${session_id == null }">
			<div class="main-bar__column">
				<span><a class="main-bar__btn"
					href="/MovieProject/userjoin.do">로그인</a></span> <span>|</span> <span><a
					class="main-bar__btn" href="/MovieProject/requserjoin.do">회원가입</a></span>
			</div>
		</c:if>
		<c:if test="${session_id != null }">
			<div class="main-bar__column">
				<span><a class="main-bar__btn">${session_id } 님 환영합니다!</a></span> <span>|</span>
				<c:if test="${session_admin == 1 }">
					<span><a class="main-bar__btn"
						href="/MovieProject/userselect.do">관리자페이지</a></span>
				</c:if>
				<c:if test="${session_admin == 0 }">
					<form class="main-bar__btn" action="/MovieProject/userdetail.do"
						method="post">
						<input type="hidden" name="uId" value="${session_id }" /> <input
							type="submit" value="마이페이지" />
					</form>
				</c:if>
				<span>|</span> <span><a class="main-bar__btn"
					href="/MovieProject/userlogout.do">로그아웃</a></span>
			</div>
		</c:if>
	</div>
	<!-- main 화면 header end-->
	<!-- main 화면 body start-->
	<div class="main-body">
		<div class="main-sidebar"></div>
		<div class="main-contents">
			<div id="contents">

				<form action="/MovieProject/moviereviewinsert.do" method="post">
					<input type="hidden" name="mId" value="${movie.mid }"> <input
						type="hidden" name="uId" value="${uId}">
					<table class="table table-striped table-hover">

						<c:if test="${uId != null }">
							<tr>
								<td>영화제목</td>
								<td><input type="text" name="mTitle"
									value="${movie.mtitle }" readonly>
								<td><select name="rRate"
									style="background: activeborder; color: black;">
										<option style="background: gray; color: black;">평점</option>
										<option style="background: gray;" value="1">1</option>
										<option style="background: gray;" value="2">2</option>
										<option style="background: gray;" value="3">3</option>
										<option style="background: gray;" value="4">4</option>
										<option style="background: gray;" value="5">5</option>
								</select></td>
							</tr>
							<td>글쓴이</td>
							<td><input type="text" name="uId" value="${uId }" readonly></td>
							<tr>
								<td></td>
								<td><textarea rows="10" cols="50" name="rContent">${review.rContent}</textarea>
								</td>

								<td><input type="submit" value="등록" class="btn btn-light">
							</tr>
							<tr>
							</tr>
						</c:if>
					</table>
				</form>


				<!-- 리뷰 디테일 목록 -->
				<!-- 			<form action="/MovieProject/moviereviewwrite.do" method="post"> -->
				<%-- 				<input type="hidden" name="mId" value="${movie.mid }"> --%>
				<%-- 				<input type="hidden" name="uId" value="${uId }"> --%>
				<!-- 				 <input  -->
				<!-- 					type="submit" value="리뷰작성"> -->
				<!-- 			</form> -->


				<%-- 				<a href="/MovieProject/moviedetail.do?mId=${movie.mid }"> <input --%>
				<!-- 					type="button" class="btn btn-light" value="영화정보"> -->
				<!-- 				</a> -->
				<c:set var="review" value="${reviewDetail }"></c:set>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>리뷰번호</th>
							<th>회원아이디</th>
							<th>영화 제목</th>
							<th>평점</th>
							<th>리뷰내용</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="review" items="${reviewList }">
							<tr>
								<td>${review.rNum }</td>
								<td>${review.uId }</td>
								<td>${review.mTitle }</td>
								<td>${review.rRate }</td>
								<td>${review.rContent }</td>
								<td>${review.rDate }</td>
								<c:if test="${review.uId == uId }">
									<td>
										<!-- 
										<form action="/MovieProject/moviereviewupdate.do" method="post">
											<input type="hidden" name="rNum" value="${review.rNum }]">
											<input type="hidden" name="uId" value="${uId }">
											<input type="hidden" name="rRate" value="${review.rRate }">
											<input type="hidden" name="rContent" value="${review.rContent }">
											<input type="submit" value="수정">
										</form>
										 -->
										<form action="/MovieProject/moviereviewdelete.do"
											method="post">
											<input type="hidden" name="rNum" value="${review.rNum }">
											<input type="hidden" name="mId" value="${movie.mid }">
											<input type="submit" value="삭제"
												class="btn btn-outline-secondary btn-sm">
										</form>
									</td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>

				</table>

				<%-- 페이징 버튼 만들기 
	표현할 글이 있는 경우에만 버튼을 표시함--%>

				<c:if test="${pageDTO.hasBoard()}">
					<ul class="pagination justify-content-center pagination-sm">
						<%-- 						

						<%-- 뒤로가기 버튼을 표시할지 말지 결정하는 부분 --%>
						<c:if test="${pageDTO.startPage > 10}">
							<form
								action="/MovieProject/moviereviewdetail.do?page=${pageDTO.startPage - 10}"
								method="post">
								<input type="hidden" name="mId" value="${movie.mid }"> <input
									type="submit" class="btn btn-gray" value="<<">
							</form>
							<!-- 							<li class="page-item"><a class="page-link" -->
							<%-- 								href="/MovieProject/moviereviewdetail.do?page=${pageDTO.startPage - 10}">«</a></li> --%>
						</c:if>

						<%-- 페이지 번호 10개 묶음을 깔아주는 부분 --%>
						<c:forEach var="pNo" begin="${pageDTO.startPage}"
							end="${pageDTO.endPage}">
							<form action="/MovieProject/moviereviewdetail.do?page=${pNo}"
								method="post">
								<input type="hidden" name="mId" value="${movie.mid }"> <input
									type="submit" class="btn btn-gray" value="${pNo }">
							</form>
						</c:forEach>

						<%-- 다음으로 가기 버튼을 표시할지 말지 결정하는 부분 --%>
						<c:if test="${pageDTO.endPage < pageDTO.totalPages}">
							<form
								action="/MovieProject/moviereviewdetail.do?page=${pageDTO.startPage + 10}"
								method="post">
								<input type="hidden" name="mId" value="${movie.mid }"> <input
									type="submit" class="btn btn-gray" value=">>">
							</form>
							<!-- 							<li class="page-item"><a class="page-link" -->
							<%-- 								href="/MovieProject/moviereviewdetail.do?page=${pageDTO.startPage + 10}"> --%>
							<!-- 									» </a> -->
						</c:if>

					</ul>
				</c:if>
			</div>
		</div>
		<%-- 페이징 부분 끝 --%>
	</div>

	<div class="main-sidebar"></div>

	<!-- main 화면 body end-->
	<!-- foot start -->
	<div id="footer">
		<p>
			<b>Creators</b>&nbsp;&nbsp;김지우 , 최재인 , 이한빈 , 김영훈
		</p>
		<p>
			<b>Contact </b>&nbsp;&nbsp;<a href="https://github.com/GITJIWOO">https://github.com/GITJIWOO</a>
		</p>
		<hr>
		<p id="copyright">
			<b>ⓒ MOVING Corp.</b>
		</p>
	</div>
	<!-- foot end -->


	<script type="text/javascript">
		function ddd(locationParam, rnum) {
			location.href = locationParam + "?rNum=" + rnum;
		}
	</script>
</body>
</html>
