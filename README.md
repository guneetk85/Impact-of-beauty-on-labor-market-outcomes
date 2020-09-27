# Teaching-Ratings


Several researchers have examined the impact of how beauty affects labor market outcomes,particularly earnings, and have attempted to infer the sources of its effects from the behavior of different economic agents (Hamermesh and Biddle, 1994; Biddle and Hamermesh, 1998).

A substantial amount of research has indicated that academic administrators pay attention to teaching quality in setting salaries (Becker and Watts, 1999). A number of studies (e.g., Katz,1973; Siegfried and White, 1973; Kaun, 1984; Moore et al, 1998) have demonstrated thatteaching quality generates ceteris paribus increases in salary (but see DeLorme et al, 1979). The question is what generates the measured productivity for which the economic rewards are being offered. One possibility is simply that ascriptive characteristics, such as beauty, trigger positive responses by students and lead them to evaluate some teachers more favorably, so that theirbeauty earns them higher economic returns.

In this study, the productivity effects of beauty is examined in the context of undergraduate education and the impact of professors' looks on their instructional ratings (Working Paper 9853 http://www.nber.org/papers/w9853)

Dataset: The classes ranged in size from 8 to 581 students, while the number of students completing the instructional ratings ranged from 5 to 380. Underlying the 463 sample observations are 16,957 completed evaluations from 25,547 registered students


The data was stored in an excel sheet. The data was imported to R-Studio
#variables taken into consideration:
1. age of the professor- integer variable
2. Gender of the professor- male or female
3. Minority status of the professor-yes or no (if the professor was educated in an english speaking country)
4. Tenure status or the faculty member- tenured or not tenured
5. Division of courses- lower division or upper division
6. Native english speaker- yes or no
7. course credit- one or more
8. beauty scores

The following questions were answered:

1. Impact of beauty on teacher ratings
2. Do teaching evaluations depend on minority and tenure status of a professor?
3. Do professors who teach upper division courses receive lower teaching evaluations than those who teach lower division courses?
4. What is the average teaching ratings for male and female professors 

Functions used:
1. table
2. summary
3. tapply and sapply
4. regression models
5. plot, xyplot, ggplot and box plot
6. t test
7. lm

Packages used:
1. Tableone
2. stargazer
3. ggplot2
4. lattice
