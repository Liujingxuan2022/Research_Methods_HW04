* Read in data: 
insheet using crime-iv.csv

* Question 4 Balance table

global balanceopts "prehead(\begin{tabular}{l*{6}{c}}) postfoot(\end{tabular}) noisily noeqlines nonumbers varlabels(_cons Constant, end("" ) nolast)  starlevels(* 0.1 ** 0.05 *** 0.01)"

estpost ttest severityofcrime, by(republicanjudge) unequal welch

esttab using balance.rtf, cell("mu_1(f(3)) mu_2(f(3)) b(f(3) star) p(f(3))") wide label collabels("Control" "Treatment" "Difference" "P value")

* Question 5 First Stage Regression 

reg monthsinjail republicanjudge severityofcrime

eststo stage1_regression 

global tableoptions "bf(%15.2gc) sfmt(%15.2gc) se label noisily noeqlines nonumbers varlabels(_cons Constant, end("" ) nolast)  starlevels(* 0.1 ** 0.05 *** 0.01) replace r2"

esttab stage1_regression using HW4-reg1.rtf, $tableoptions

* Question 7 

reg recidivates republicanjudge severityofcrime

eststo stage2_regression 

global tableoptions "bf(%15.2gc) sfmt(%15.2gc) se label noisily noeqlines nonumbers varlabels(_cons Constant, end("" ) nolast)  starlevels(* 0.1 ** 0.05 *** 0.01) replace r2"

esttab stage2_regression using HW4-reg2.rtf, $tableoptions

* Question 9

ssc install ivreg2
ivreg2 recidivates (monthsinjail=republicanjudge) severityofcrime  

eststo iv_regression 
esttab iv_regression using HW4-reg3.rtf, $tableoptions
