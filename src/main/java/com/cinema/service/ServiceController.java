package com.cinema.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ServiceController {

    @Autowired
    private FAQDAO faqDAO;
    @Autowired
    private NewsDAO newsDAO;

    @GetMapping("/serviceHome")
    public String getServiceHome(@RequestParam(value = "id", defaultValue = "1") int id, Model model) {
        ServiceHomeDTO serviceHome = new ServiceHomeDTO("고객센터", "아직아직아직");
        model.addAttribute("serviceHome", serviceHome);
        return "service/ServiceHome";
    }

    @GetMapping("/faq")
    public String showFAQPage(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "10") int size,
            Model model) {

        int offset = (page - 1) * size;
        List<FAQDTO> faqList = faqDAO.getAllFAQs(size, offset);
        int totalFAQCount = faqDAO.getTotalFAQCount();
        int totalPages = (int) Math.ceil((double) totalFAQCount / size);

        model.addAttribute("faqList", faqList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("size", size);
        return "service/FAQ";
    }

    @GetMapping("/FAQdetail")
    public String showFAQDetailPage(@RequestParam(value = "id") Long id, Model model) {
        FAQDTO faqDetail = faqDAO.getFAQById(id);
        faqDetail.setViews(faqDetail.getViews() + 1);
        faqDAO.updateFAQ(faqDetail);
        model.addAttribute("faqDetail", faqDetail);
        return "service/FAQdetail";
    }

    @GetMapping("/FAQedit")
    public String showFAQEditPage(@RequestParam("id") Long id, Model model) {
        FAQDTO faqDetail = faqDAO.getFAQById(id);
        model.addAttribute("faqDetail", faqDetail);
        return "service/FAQedit";
    }

    @PostMapping("/FAQupdate")
    public String updateFAQ(@ModelAttribute FAQDTO faqDTO) {
        faqDAO.updateFAQ(faqDTO);
        return "redirect:/faq";
    }

    @GetMapping("/FAQdelete")
    public String deleteFAQ(@RequestParam("id") Long id) {
        faqDAO.deleteFAQ(id);
        return "redirect:/faq";
    }

    @GetMapping("/news")
    public String showNewsPage(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "10") int size,
            Model model) {

        int offset = (page - 1) * size;
        List<NewsDTO> newsList = newsDAO.getAllNews(size, offset);
        int totalNewsCount = newsDAO.getTotalNewsCount();
        int totalPages = (int) Math.ceil((double) totalNewsCount / size);

        model.addAttribute("newsList", newsList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("size", size);
        return "service/News";
    }

    @GetMapping("/newsDetail")
    public String showNewsDetailPage(@RequestParam(value = "id") Long id, Model model) {
        newsDAO.incrementViewCount(id);
        NewsDTO newsDetail = newsDAO.getNewsById(id);
        model.addAttribute("newsDetail", newsDetail);
        return "service/Newsdetail";
    }

    @GetMapping("/eaq")
    public String showEAQPage(Model model) {
        List<EAQDTO> eaqList = List.of(
            new EAQDTO(1L, "EAQ 제목 1", "EAQ 내용 1", 100)
        );
        model.addAttribute("eaqList", eaqList);
        return "service/EAQ";
    }
}
