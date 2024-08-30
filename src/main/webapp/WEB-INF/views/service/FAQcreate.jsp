<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ 생성</title>
    <link rel="stylesheet" href="/styles.css"> <!-- 스타일 시트 링크 -->
</head>
<body>
    <header>
        <h1>FAQ 생성</h1>
        <a href="/service/faq">목록으로 돌아가기</a>
    </header>
    
    <form action="/service/faq/create" method="post">
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" required>
        <label for="content">내용:</label>
        <textarea id="content" name="content" rows="4" required></textarea>
        <label for="views">조회수:</label>
        <input type="number" id="views" name="views" min="0" value="0">
        <button type="submit">저장</button>
    </form>
    
    <footer>
        <p>MG Cinema &copy; 2024</p>
    </footer>
</body>
</html>
