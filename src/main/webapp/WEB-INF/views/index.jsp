<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Comment Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <div class="comment-box">
        <form action="${pageContext.request.contextPath}/comment" method="post">
            <textarea name="comment" class="comment-input" placeholder="댓글을 입력하세요..."></textarea>
            <button type="submit">댓글 달기</button>
        </form>
        <div id="likeSection">
            <div class="like-button" id="likeButton">
                <span class="like-icon">♥</span>
                <span class="like-count" id="likeCount">${likeCount}</span>
            </div>
        </div>
    </div>
    <div class="comments">
        <ul>
            <c:forEach var="comment" items="${comments}" varStatus="status">
                <li>
                    <span>${comment}</span>
                    <c:if test="${status.last}">
                        <a href="#" class="edit-button">수정</a>
                        <a href="#" class="delete-button">삭제</a>
                    </c:if>
                </li>
            </c:forEach>
        </ul>
    </div>
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
    <script>
        document.getElementById('likeButton').addEventListener('click', function() {
            var likeCountSpan = document.getElementById('likeCount');
            var likeCount = parseInt(likeCountSpan.textContent);
            likeCount++;
            likeCountSpan.textContent = likeCount;

            // AJAX 요청 보내기
            var xhr = new XMLHttpRequest();
            xhr.open('POST', '${pageContext.request.contextPath}/like', true);
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.send(JSON.stringify({ likeCount: likeCount }));
        });
    </script>
</body>
</html>
