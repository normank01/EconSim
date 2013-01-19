<<<<<<< HEAD:econsim.nlogo
breed [person persons]
breed [corporation corporations]
breed [bank banks]
turtles-own [capital funding workers wage price state inflation gov_spending bank_rate firm_spent person_spent]
=======
breed [persons person]
breed [corporations corporation]
breed [bank banks]
turtles-own [capital funding workers wage price state inflation bank_rate firm_spent person_spent]
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
globals[fed]

to startup ;special procedure in netlogo that runs whatever code you put here automatically when the .nlogo file is opened
end

to setup
  ca
  set fed [1]
<<<<<<< HEAD:econsim.nlogo
  create-person 50 
=======
  reset-timer
  create-persons 50 
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
         [set shape "person"
          set capital 100
          set_wage
         ]
  create-corporations 10
         [set shape "corporation"
          set funding 100
          ;set_funding
          set workers 4
          set size 5
          setxy random-xcor random-ycor
          set price 5.00
         ]
   create-bank 2
         [set shape "bank"
<<<<<<< HEAD:econsim.nlogo
          set funding ((capital * ((count person) / 2)) / 10)
=======
          set funding ((capital * ((count persons) / 2)) / 10)
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
          set size 5
          setxy random-xcor random-ycor
          set bank_rate 2
         ]
   ask turtles[setup-plots]

   
end
to free_bank
  set corporate_tax_rates 0 
end
to abolish_fed
  set fed []
end

to-report supply
  report 1
  ;report (sum [wage] of turtles) * workers
end
to-report demand
  report price
end
to wiggle
  fd 5
  rt 15
  lt 15
end
to go
  ask persons[wiggle]
  ask turtles[setup-plots]
end
to stimulus
<<<<<<< HEAD:econsim.nlogo
  ask turtles[reset-timer
    if timer < 7[set capital capital + 5
                 set price price + 1
                 set entitlement_spending entitlement_spending + 10
    ]
    if timer >= 7[set capital capital - 4
=======
  ask turtles[
    if timer < 7[set capital capital + (set_stimulus)
                 set price price + 1
                 set entitlement_spending entitlement_spending + 10
    ]
    if timer >= 7[set capital capital - (set_stimulus / 2.5)
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
                  set price price - 2
                  set entitlement_spending entitlement_spending - 10
    ]
  ]
  ;add: increases the inflation rate to 5%, and increases capital, along with workers. But lowers wage and after 7 seconds inflation and worker increase stops and GDP goes down.
end
to gold
  if timer <= 4[set inflation inflation_rate + 0.25 set price price + 0.25]
  
  ;reduces inflation rate/increase in percentage of capital to 0.25% from 2%
end
to austerity
<<<<<<< HEAD:econsim.nlogo
=======
   ask turtles[
    if timer < 7[set capital capital - 5
                 set price price - 1
                 set entitlement_spending entitlement_spending - 10
    ]
    if timer >= 7[set capital capital + 6
                  set price price + 2
                  set entitlement_spending entitlement_spending + 4
    ]
  ]
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
  ;lowers government spending and raises tax rates
end
to nit
  ;10% of person turtles have no income tax 10% gain capital and 80% lose by the amount determined by the slider 
end
to deregulate
  ;lowers corporate tax 2% every year for 10 years and gets rid of cap on recapitalization limits and lowers mininum wage to $5.50
end
to regulate
  ;hightens corporate tax 2% every year for 10 years sets limit to 1 company and has a mininum wage of $10
end
to recapitalize
 ; ask corporations[if funding <= 1000[set state "bankrupt"]
 ;   if state = "bankrupt"[
 ;     wait 2
 ;     die 
 ;   ask corporation 0[
 ;     set funding funding + 1000
 ;  ]
 ; ]
 ; ]
end
to-report unemployment_rate
<<<<<<< HEAD:econsim.nlogo
     report ((count person with[ wage = 0]) / (count turtles) * 100)
=======
     report ((count persons with[ wage = 0]) / (count turtles) * 100)
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
end
to set_wage
  ifelse random(50) > 40
     [set capital 30]
     [ifelse random(50) > 5
<<<<<<< HEAD:econsim.nlogo
       [set capital 10]
=======
       [set capital mininum_wage]
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
       [set capital 0]
     ]
end
to-report number_lb_people
<<<<<<< HEAD:econsim.nlogo
  report count person with[ wage < lb_threshold]
end
to-report number_mb_people
  report count person with[ wage > mb_threshold and wage < hb_threshold]
end
to-report number_hb_people
  report count person with[ wage > hb_threshold]
end
to-report tax_revenue
  report (lb_income_tax_rates * number_lb_people) + (mb_income_tax_rates * number_mb_people) + (hb_income_tax_rates * number_hb_people) + (corporate_tax_rates * count corporation)
=======
  report count persons with[ wage < lb_threshold]
end
to-report number_mb_people
  report count persons with[ wage > mb_threshold and wage < hb_threshold]
end
to-report number_hb_people
  report count persons with[ wage > hb_threshold]
end
to-report tax_revenue
  report (lb_income_tax_rates * number_lb_people) + (mb_income_tax_rates * number_mb_people) + (hb_income_tax_rates * number_hb_people) + (corporate_tax_rates * count corporations)
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
end
to-report deficit
  let q 0
  set q (entitlement_spending - tax_revenue)
  report q
end
to-report debt
  let q 0
  let h 0
  set q deficit * h
  report q
end
to-report inflation_rate
<<<<<<< HEAD:econsim.nlogo
  let A 5; price
  let B 6; CPI
  report ((( B - A) / A) * 100)
end
to-report CPI ;Consumer_Price_Index
  report 500; not correct value
end
to-report aggregate_capital
  report ((capital * count person) - (((lb_income_tax_rates * number_lb_people) + (mb_income_tax_rates * number_mb_people) + (hb_income_tax_rates * number_hb_people))))
end     

to-report C ;private_consumption or C = C0 + C1((y)^d) where c0 is autonomous spending if income levels were zero c1 is the marginal propensity to consume
  report ((total_saving - total_borrowing) * count person) + (MPC * aggregate_capital)
=======
  let A price; price
  let B price + 2; CPI
  report ((( B - A) / (A + 1.01)) * 100)
end
to-report CPI ;Consumer_Price_Index
  report price + 2; not correct value
end
to-report aggregate_capital
  report ((capital * count persons) - (((lb_income_tax_rates * number_lb_people) - (mb_income_tax_rates * number_mb_people) - (hb_income_tax_rates * number_hb_people))))
end     

to-report C ;private_consumption or C = C0 + C1((y)^d) where c0 is autonomous spending if income levels were zero c1 is the marginal propensity to consume
  report ((total_saving - total_borrowing) * count persons) + (MPC * aggregate_capital)
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
end
to-report M
  report (100 * 50)
end  
<<<<<<< HEAD:econsim.nlogo
to-report G
=======
to-report Government_spending
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
    report entitlement_spending 
end
to-report L ; labor effort
  report 0.6
end
to-report kappa
  report ((inflation_rate / 100) / 4)
end
to-report chi
  report 1
end
to-report p
  report 1
end
to-report v
  report 1
end
to-report beta
  report 0.1
end
<<<<<<< HEAD:econsim.nlogo
;to-report intertemporal_utility_function
;report (((beta ^ 0) * ((ln (C)) + (chi * ln ((M) / (P))) + (v * (G) - (kappa * ((l) ^ 2))))))
=======
;to-report intertemporal_utility_function 
;report (((beta ^ 0) * ((ln (C)) + (chi * ln ((M) / (P))) + (v * (government_spending) - (kappa * ((l) ^ 2))))))
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
;end
to-report total_borrowing
  report capital
end
to-report total_saving
  report capital / 50
end
to-report total_income
  report aggregate_capital
end
;to-report MPC ;marginal propensity to consume
;   report change_in_consumption / change_in_income
;end
;to-report change_in_consumption
;  let h ((aggregate_capital) / (5 * 50))
;  report h
;end
to-report change_in_savings
<<<<<<< HEAD:econsim.nlogo
  reset-timer
  let h (total_saving * ((count person) + 1))
  if timer <= 4[
     report h]
  
  if timer > 5[let z ((total_saving * ((count person) + 1)) - h)
    report z]
  if timer > 10[reset-timer]
end
to-report change_in_income
  reset-timer
  let h (aggregate_capital * ((count person) + 1))
  if timer <= 4[
     report h]
  
  if timer > 5[let z ((aggregate_capital * ((count person) + 1)) - h)
    report z]
  if timer > 10[reset-timer]
=======
  let h (total_saving * ((count persons) + 1))
  if timer <= 4[
     report h]
  
  if timer > 5[let z ((total_saving * ((count persons) + 1)) - h)
    report z]
  let z (total_saving * ((((count persons) + 1)) - h))
    report z
end
to-report change_in_income
  let h (aggregate_capital * ((count persons) + 1))
  if timer <= 5[
     report h]
  
  if timer > 5[let z ((aggregate_capital * ((count persons) + 1)) - h)
    report z]
  let z (total_saving * (((aggregate_capital * ((count persons) + 1)) - h)))
    report z
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
end
to-report MPS; slope of savings schedule
  report change_in_savings / (change_in_income + .000000001)
end
to-report MPC; slope of consumption schedule
  report (1 - MPS)
end
;to-report GDP
to-report aggregate_firm_spent
<<<<<<< HEAD:econsim.nlogo
  report ((capital * count corporation) + 1) / 40
end
to-report aggregate_person_spent
  report ((capital * count person) + 1) / 40
=======
  report ((capital * count corporations) + 1) / 40
end
to-report aggregate_person_spent
  report ((capital * count persons) + 1) / 40
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
end
to-report invest_per_person
  report random(capital)
end
to-report I
  report aggregate_firm_spent + aggregate_person_spent + invest_per_person
end
<<<<<<< HEAD:econsim.nlogo
to-report Gv
  report entitlement_spending
end 
=======
to-report G
  report entitlement_spending
end 
to set_funding
   ifelse random(50) > 40
     [set funding 100000]
     [ifelse random(50) > 5
       [set capital 50000]
       [set capital 10000]
     ]
end
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
@#$#@#$#@
GRAPHICS-WINDOW
210
10
649
470
16
16
13.0
1
10
1
1
1
0
1
1
1
-16
16
-16
16
0
0
1
ticks
30.0

BUTTON
685
246
839
279
Nationalize the Banks!
stimulus
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
51
271
115
304
NIL
Setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
51
321
114
354
NIL
Go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

TEXTBOX
684
204
833
253
Keynesian:\nRemember, in the long run we're all dead!
11
0.0
1

TEXTBOX
896
208
1046
236
Monetarist:\nInvest in Gold!
11
0.0
1

BUTTON
894
248
1006
281
Hard Currency
ask turtles[gold]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

PLOT
827
332
1027
482
Phillips Curve
Unemployment Rate
Inflation Rate
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"unemployment_rate" 1.0 0 -16777216 true "ask turtles[plot unemployment_rate]" "plot unemployment_rate"
"inflation_rate" 1.0 0 -7500403 true "ask turtles[plot inflation_rate]" "ask turtles[plot inflation_rate]"

PLOT
1119
14
1319
164
IS/LM
GDP
Interest Rates
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"interest_rates" 1.0 0 -16777216 true "plot fed_interest_rates" "plot fed_interest_rates"
<<<<<<< HEAD:econsim.nlogo
"GDP" 1.0 0 -7500403 true "ask turtles[plot C + Gv + I]" "ask turtles[plot C + Gv + I]"
=======
"GDP" 1.0 0 -7500403 true "ask turtles[plot C + G + I]" "ask turtles[plot C + G + I]"
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo

SLIDER
16
159
188
192
corporate_tax_rates
corporate_tax_rates
0
100
0
1
1
NIL
HORIZONTAL

TEXTBOX
1090
190
1240
246
Austrians\nDon't pay attention to the graphs above! They're just black magic.
11
0.0
1

TEXTBOX
689
346
839
402
Reaganomist\nYour public appeal automatically boosts supply and lowers tax rates 10%\n
11
0.0
1

PLOT
1041
332
1241
482
Laffer Curve
Tax Revenue
Tax Rate
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"tax_revenue" 1.0 0 -16777216 true "plot tax_revenue" "plot tax_revenue"
"tax_rate" 1.0 0 -7500403 true "plot 100" "plot 100"

BUTTON
686
290
822
325
Austerity
austerity
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
894
291
1043
324
Negative Income Tax
nit
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
686
408
779
441
NIL
Deregulate
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
1088
249
1185
282
NIL
Recapitalize
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
1261
185
1318
230
Deficit
deficit
17
1
11

MONITOR
1261
255
1319
300
Debt
debt
17
1
11

PLOT
664
13
864
163
Price
NIL
NIL
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"demand" 1.0 0 -16777216 true "ask turtles[plot demand]" "ask turtles[plot demand]"

PLOT
885
14
1085
164
Quantity
NIL
NIL
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"Supply" 1.0 0 -16777216 true "plot supply" "plot supply"

SLIDER
15
53
187
86
fed_interest_rates
fed_interest_rates
0
15
<<<<<<< HEAD:econsim.nlogo
0
=======
15
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
0.1
1
NIL
HORIZONTAL

BUTTON
1087
289
1190
322
Free Banking
free_bank
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
686
450
782
483
Abolish FED
abolish_fed
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
16
205
188
238
capital_gains_tax_rates
capital_gains_tax_rates
0
25
<<<<<<< HEAD:econsim.nlogo
0
=======
4.5
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
0.5
1
NIL
HORIZONTAL

SWITCH
6
375
205
408
regressive_tax_rate
regressive_tax_rate
1
1
-1000

SLIDER
88
530
284
563
lb_income_tax_rates
lb_income_tax_rates
0
100
<<<<<<< HEAD:econsim.nlogo
22
=======
38
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
1
1
NIL
HORIZONTAL

SLIDER
320
530
527
563
mb_income_tax_rates
mb_income_tax_rates
0
100
<<<<<<< HEAD:econsim.nlogo
0
=======
45
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
1
1
NIL
HORIZONTAL

SLIDER
564
530
766
563
hb_income_tax_rates
hb_income_tax_rates
0
100
<<<<<<< HEAD:econsim.nlogo
0
=======
41
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
1
1
NIL
HORIZONTAL

TEXTBOX
<<<<<<< HEAD:econsim.nlogo
352
590
502
650
=======
349
564
499
624
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
lb = lower bracket\nmb = middle bracket\nhb = high bracket\n
16
0.0
1

SLIDER
<<<<<<< HEAD:econsim.nlogo
85
690
280
723
=======
88
629
283
662
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
lb_threshold
lb_threshold
0
100
1
1
1
NIL
HORIZONTAL

SLIDER
<<<<<<< HEAD:econsim.nlogo
318
690
525
723
=======
314
629
521
662
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
mb_threshold
mb_threshold
0
100
<<<<<<< HEAD:econsim.nlogo
12
=======
8
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
1
1
NIL
HORIZONTAL

SLIDER
<<<<<<< HEAD:econsim.nlogo
566
690
770
723
=======
564
629
768
662
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
hb_threshold
hb_threshold
0
100
25
1
1
NIL
HORIZONTAL

TEXTBOX
40
419
190
479
Puts a ceiling cap on what salary income tax can go up to
16
0.0
1

TEXTBOX
1344
121
1494
160
GDP = private consumption + gross investment + government spending + (exports − imports)
10
0.0
1

SLIDER
210
482
445
515
entitlement_spending
entitlement_spending
0
100000
<<<<<<< HEAD:econsim.nlogo
15909
=======
29545
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
1
1
NIL
HORIZONTAL

TEXTBOX
897
514
1047
534
NIL
16
0.0
1

PLOT
1255
332
1455
482
Income Inequality
Aggregate Pop.
Aggregate Wealth
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
<<<<<<< HEAD:econsim.nlogo
"aggregate_pop" 1.0 0 -16777216 true "ask person[plot count turtles]" "ask person[plot count turtles]"
=======
"aggregate_pop" 1.0 0 -16777216 true "ask persons[plot count turtles]" "ask persons[plot count turtles]"
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
"aggregate_wealth" 1.0 0 -7500403 true "ask turtles[plot aggregate_capital]" "ask turtles[plot aggregate_capital]"

TEXTBOX
1343
83
1493
111
Since sim. is closed system (exports - imports) = 0.
11
0.0
1

TEXTBOX
463
485
613
513
Money Gov. spends on social services
11
0.0
1

SLIDER
677
168
842
201
set_stimulus
set_stimulus
0
100000
<<<<<<< HEAD:econsim.nlogo
0
=======
34000
1
1
NIL
HORIZONTAL

SLIDER
17
579
203
612
mininum_wage
mininum_wage
0
100
50
>>>>>>> bc88590ac48c5f3f9629ceb1bb30c4f8d01eb7fb:econsim.nlogo
1
1
NIL
HORIZONTAL

@#$#@#$#@
## Instructions

A simulation of a rudimentary network of markets. Consumers and Producers are simulated along with the affects of certain few governmental regulations on those agents.


Using the law of supply and demand along with various other recorded economic phenomena, closed market output is simulated.



The user simply plays around with the income tax rate and corporate tax rate sliders, and the buttons under certain brances of macroeconomic theory which dictate certain patterns to follow when some action is taken by the buttons. The user will learn various phenomena proposed by those schools of thought by playing around with the rules in a simulated market and seeing what happens to the market's well-being. 

## Changelog

Crowding out effect


##LearnMore
http://jsher.myclassupdates.com/sitebuildercontent/sitebuilderfiles/feng.pdf
Interesting phenomena to observe:
- Balanced Budget Multiplier; 
    Doubling both government spending and tax rates doubles GDP as well
- Stagflation;
    Too much inflation will always cause unemployment to stay steady as more inflation       is introduced
- Crowding Out Effect;
    If the gov. finances its deficits(invests in private market) investment spending         decreases, which slow down aggregate expenditures(GDP + unplanned investments)
- Multiplier Effect:
    Changes in aggregate expenditures can increase GDP since the money entering the          market is used over many times
## Credits

Norman 
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

bank
true
0
Rectangle -13840069 true false 90 135 210 195
Rectangle -6459832 true false 120 90 180 135
Rectangle -955883 true false 135 165 165 195
Rectangle -2674135 true false 135 150 165 165

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

corporation
true
0
Rectangle -2674135 true false 60 135 240 180
Rectangle -6459832 true false 90 90 210 135
Rectangle -1184463 true false 120 60 180 90
Line -2674135 false 150 60 150 30
Rectangle -13345367 true false 150 30 165 45
Rectangle -16777216 true false 135 150 165 180

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270

@#$#@#$#@
NetLogo 5.0.3
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 1.0 0.0
0.0 1 1.0 0.0
0.2 0 1.0 0.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180

@#$#@#$#@
0
@#$#@#$#@