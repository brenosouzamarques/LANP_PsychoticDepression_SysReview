extraDistr::phcauchy(0.5, sigma = 0.25)
library(tidyverse)
library(ggdist)
prior_tau <- c(prior(cauchy(0, 1), class = sd),
            prior(cauchy(0, 0.5), class = sd),
            prior(cauchy(0, 0.25), class = sd))



prior_tau %>% parse_dist(prior_tau) %>% 
            ggplot(aes(y = prior,
                         dist = .dist,
                         args = .args,
                       fill = prior))+
            stat_dist_halfeye()+
            xlim(0, 3)+
            scale_fill_brewer(palette = "Set2")
