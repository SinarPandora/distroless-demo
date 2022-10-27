package com.kingland.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class ExampleController {
    @ResponseBody
    @GetMapping("test")
    public ExampleResponse helloWorld() {
        return new ExampleResponse(true, "Hello from Distroless!");
    }

    @GetMapping("/")
    public String index() {
        return "index";
    }
}
