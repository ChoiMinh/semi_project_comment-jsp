package com.example;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class CommentController {

    private List<String> comments = new ArrayList<>();
    private int likeCount = 0;

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("comments", comments);
        model.addAttribute("likeCount", likeCount);
        return "index"; // JSP 파일 반환
    }

    @PostMapping("/comment")
    public String addComment(@RequestParam("comment") String comment) {
        comments.add(comment);
        return "redirect:/";
    }

    @PostMapping("/like")
    @ResponseBody
    public void addLike(@RequestBody LikeRequest likeRequest) {
        likeCount = likeRequest.getLikeCount();
    }

    static class LikeRequest {
        private int likeCount;

        public int getLikeCount() {
            return likeCount;
        }

        public void setLikeCount(int likeCount) {
            this.likeCount = likeCount;
        }
    }
}
