document.addEventListener('DOMContentLoaded', function() {
    var likeButton = document.getElementById('likeButton');
    var likeCount = document.getElementById('likeCount');
    var isLiked = false;

    likeButton.addEventListener('click', function(event) {
        event.preventDefault(); // form의 기본 제출 동작 방지
        if (!isLiked) {
            fetch('/like', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
            })
            .then(response => response.json())
            .then(data => {
                likeCount.textContent = data.likeCount;
                isLiked = true;
                likeButton.classList.add('liked');
            });
        }
    });

    var editButtons = document.querySelectorAll('.edit-button');
    var deleteButtons = document.querySelectorAll('.delete-button');

    editButtons.forEach(function(editButton) {
        editButton.addEventListener('click', function(event) {
            event.preventDefault();
            var comment = this.previousElementSibling.textContent;
            var updatedComment = prompt('수정할 내용을 입력하세요:', comment);
            if (updatedComment && updatedComment.trim() !== '') {
                // 수정된 내용을 서버로 전송하는 코드 추가
            }
        });
    });

    deleteButtons.forEach(function(deleteButton) {
        deleteButton.addEventListener('click', function(event) {
            event.preventDefault();
            if (confirm('정말로 삭제하시겠습니까?')) {
                // 삭제 요청을 서버로 전송하는 코드 추가
            }
        });
    });
});
