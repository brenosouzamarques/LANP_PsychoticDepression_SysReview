library(brms)
library(tidyverse)
library(ggdist)

mu_1 <- rnorm(n = 10000, mean = 0, sd = 0.5)
tau_1 <- extraDistr::rhcauchy(n = 10000, sigma = 0.5)
theta_1 <- rnorm(n = 10000, mean = mu_1, sd = tau_1)


mu_2 <- rnorm(n = 10000, mean = 0.3, sd = 0.2)
theta_2 <- rnorm(n = 10000, mean = mu_2, sd = tau_1)

mu_3 <- runif(n = 10000, min = -1, max = 1)
theta_3 <- rnorm(n = 10000, mean = mu_3, sd = tau_1)
tribble(~theta, ~value,
        "Weakly Informative", theta_1,
        "Informative", theta_2,
        "Uniform", theta_3) %>% 
            unnest(value) %>% 
            ggplot(aes(x = value,
                       fill = theta,
                       color = theta))+
            geom_density(alpha = .7,
                         show.legend = FALSE)+
            geom_vline(xintercept = 0,
                       linetype = "dashed",
                       color = "grey")+
            facet_grid(cols = vars(theta))+
            scale_x_continuous(limits = c(-3, 3),
                               breaks = seq(-3,
                                            3,
                                            1))+
            scale_fill_brewer(palette = "Dark2")+
            scale_color_brewer(palette = "Dark2")+
            theme_classic()+
            labs(x = element_blank(),
                 fill = expression(paste("Theta", (theta))))+
            theme(axis.title.y = element_text(size = 14, face = "bold"),
                  axis.text.x = element_text(size = 13),
                  text = element_text(family = "serif"))



