;Equipo 3
;Pamela Cantu Rodriguez A01285128
;Ana Sofia Ugalde A01702639
;Ricardo Camacho A01654132
;Natalia Gonzalez A0


(defrule MAIN::Stop-car
	=> 
(printout t "Do the brakes stop the car? (yes/no)?" crlf)
	(bind ?a (read))
	(assert (Stop-car ?a)))

;no

(defrule MAIN::Pedal-floor 
	(Stop-car no)
	=>
(printout t "Does the brake pedal go to the floor? (yes/no)" crlf)
	(bind ?a (read))
	(assert (Pedal-floor ?a)))
;no-no

(defrule MAIN::Pedal-linkage 
	(Pedal-floor no)
	=>
(printout t "Pedal linkage, binding, glazed, frozen calipers, pinched lines, booster failure" crlf))

;no-yes

(defrule MAIN::Brake-fluid
	(Pedal-floor yes)
	=>
(printout t "Is the brake fluid level OK? (yes/no)" crlf)
	(bind ?a (read))
	(assert (Brake-fluid ?a)))

;no-yes-no

(defrule MAIN::Fill-to-line 
	(Brake-fluid no)
	=>
(printout t "Fill to line, if brakes soft, bleed lines following order service manual" crlf))

;no-yes-yes

(defrule MAIN::Brake-Warning
	(Brake-fluid yes)
	=>
(printout t "Does a brake warning light come on the instrument panel? (yes/no)" crlf)
	(bind ?a (read))
	(assert (Brake-Warning ?a)))

;no-yes-yes-no

(defrule MAIN::Power 
	(Brake-Warning no)
	=>
(printout t "Likely power assist related, see service manual" crlf))

;no-yes-yes-yes

;RESPUESTA DEFAULT EN EL DIAGRAMA QUE SE OMITE PARA AGREGAR OTRA PREGUNTA
;(defrule MAIN::Parking 
;	(Brake-Warning yes)
;	=>
;(printout t "If parking brake released see service manual for power booster problem or anti-lock failure" crlf))

(defrule MAIN::Brake-Material
	(Brake-Warning yes)
	=>
(printout t "Using right brake material? (yes/no)" crlf)
	(bind ?a (read))
	(assert (Brake-Material ?a)))

;no-yes-yes-yes-no

(defrule MAIN::Inspection 
	(Brake-Material no)
	=>
(printout t "A mechanic should replace wrong material with the right brake material" crlf))

;no-yes-yes-yes-yes

(defrule MAIN::Replace 
	(Brake-Material yes)
	=>
(printout t "A mechanic should inspect your brake system and let you know if you need to replace missing or damaged hardware" crlf))

;yes

(defrule MAIN::Parking-brake 
	(Stop-car yes)
	=>
(printout t "Is this a parking emergency brake failure? (yes/no)" crlf)
	(bind ?a (read))
	(assert (Parking-brake ?a)))

(defrule MAIN::Rear 
	(Parking-brake yes)
	=>
(printout t "Is a rear wheel locked? (yes/no)" crlf)
	(bind ?a (read))
	(assert (Rear ?a)))

(defrule MAIN::Spring 
	(Rear yes)
	=>
(printout t "Spring return failure or cable rusted, bound" crlf))


(defrule MAIN::Ratchets
	(Rear no)
	=>
(printout t "Does the parking brake lever or pedal ratchet or move without force? (yes/no)" crlf)
	(bind ?a (read))
	(assert (Ratchets ?a)))

(defrule MAIN::Cable 
	(Ratchets yes)
	=>
(printout t "Cable stretched or broken, frozen adjuster" crlf))

(defrule MAIN::Shoes 
	(Ratchets no)
	=>
(printout t "Shoes worn out, glazed, fluid in drums" crlf))

;yes-no

(defrule MAIN::Wheels
	(Parking-brake no)
	=>
(printout t "Does one or more wheels drag too much? (yes/no)" crlf)
	(bind ?a (read))
	(assert (Wheels ?a)))

;yes-no-yes

(defrule MAIN::Stuck
	(Wheels yes)
	=>
(printout t "Stuck piston, hydraulic lock, over adjusted drum shoes, warped rotor" crlf))

;yes-no-no

(defrule MAIN::Need
	(Wheels no)
	=>
(printout t "Do you need to pump up brake pedal? (yes/no)" crlf)
	(bind ?a (read))
	(assert (Need ?a)))

;yes-no-no-yes

(defrule MAIN::Only
	(Need yes)
	=>
(printout t "Does the problem only happen after turning? (yes/no)" crlf)
	(bind ?a (read))
	(assert (Only ?a)))

;yes-no-no-yes-no

(defrule MAIN::Air
	(Only no)
	=>
(printout t "Air in system, fluid leak" crlf))

;yes-no-no-yes-yes

(defrule MAIN::Loose
	(Only yes)
	=>
(printout t "Front wheel bearing worn, axle nut loose, wheel lugs loose" crlf))

;yes-no-no-no

(defrule MAIN::Noises
	(Need no)
	=>
(printout t "Are the brakes making noises? (yes/no)" crlf)
	(bind ?a (read))
	(assert (Noises ?a)))

;yes-no-no-no-yes

(defrule MAIN::Squealing
	(Noises yes)
	=>
(printout t "Are the brakes squealing? (yes/no)" crlf)
	(bind ?a (read))
	(assert (Squealing ?a)))

;yes-no-no-no-yes-yes

(defrule MAIN::Pads
	(Squealing yes)
	=>
(printout t "Check pads and shoes for wear, foreign objects" crlf))

;yes-no-no-no-yes-no

(defrule MAIN::Clunks
	(Squealing no)
	=>
(printout t "Do you hear clunks whenever the brakes are applied? (yes/no)" crlf)
	(bind ?a (read))
	(assert (Clunks ?a)))

;yes-no-no-no-yes-no-yes

(defrule MAIN::Caliper
	(Clunks yes)
	=>
(printout t "Caliper bolt loose, suspension problem (see clicking noises diagnostic)" crlf))

;yes-no-no-no-yes-no-no

(defrule MAIN::Scrape
	(Clunks no)
	=>
(printout t "Do the brakes scrape or grind? (yes/no)" crlf)
	(bind ?a (read))
	(assert (Scrape ?a)))

;yes-no-no-no-yes-no-no-yes

(defrule MAIN::Broken
	(Scrape yes)
	=>
(printout t "Broken pad or shoe facing, warning sound for excessive wear" crlf))

;yes-no-no-no-yes-no-no-no

(defrule MAIN::Rattles
	(Scrape no)
	=>
(printout t "Do you get rattles from the brakes when driving on rough pavement? (yes/no)" crlf)
	(bind ?a (read))
	(assert (Rattles ?a)))

;yes-no-no-no-yes-no-no-no-yes

(defrule MAIN::Anti-rattle
	(Rattles yes)
	=>
(printout t "Anti-rattle clips on discs pads missing or installed wrong" crlf))

;yes-no-no-no-yes-no-no-no-no

(defrule MAIN::Chirps
	(Rattles no)
	=>
(printout t "Chirps and ticks that increase with speed due to rotor wrap or run out" crlf))

;yes-no-no-no-no

(defrule MAIN::Brakes-pull
	(Noises no)
	=>
(printout t "Do the brakes pull the steering wheel? (yes/no)" crlf)
	(bind ?a (read))
	(assert (Brakes-pull ?a)))

;yes-no-no-no-no-yes

(defrule MAIN::Front-brake
	(Brakes-pull yes)
	=>
(printout t "Front brake issue, stuck or cocked piston, air or crimp in line, master cylinder problem" crlf))

;yes-no-no-no-no-no

(defrule MAIN::Jerky
	(Brakes-pull no)
	=>
(printout t "Is braking action jerky or pulsing? (yes/no)" crlf)
	(bind ?a (read))
	(assert (Jerky ?a)))

;yes-no-no-no-no-no-yes

;RESPUESTA DEFAULT QUE TENIA EL DIAGRAMA Y SE OMITE PARA AGREGAR OTRA PREGUNTA
;(defrule MAIN::Anti-lock
;	(Jerky yes)
;	=>
;(printout t "Anti-lock brake issue, deformed drum or roto (test with parking brake)" crlf))

(defrule MAIN::ABS
	(Jerky yes)
	=>
(printout t "You see your ABS light turn on when you first start your car and continues like that? (yes/no)" crlf)
	(bind ?a (read))
	(assert (ABS ?a)))

;yes-no-no-no-no-no-yes-yes

(defrule MAIN::Main-Comp
	(ABS yes)
	=>
(printout t "There may be a problem with the main computer or there could be an ABS system malfunction" crlf))

;yes-no-no-no-no-no-yes-no

(defrule MAIN::Main-Compu
	(ABS no)
	=>
(printout t "The main computer is testing the system to make sure it's working properly. Once the system passes the test the light turns  off" crlf))

;yes-no-no-no-no-no-no

(defrule MAIN::Hard
	(Jerky no)
	=>
(printout t "Is it hard braking and bring the car to a halt? (yes/no)" crlf)
	(bind ?a (read))
	(assert (Hard ?a)))

;yes-no-no-no-no-no-no-yes

;RESPUESTA DEFAULT QUE TENIA EL DIAGRAMA Y SE OMITE PARA AGREGAR OTRA PREGUNTA 
;(defrule MAIN::Worn
;	(Hard yes)
;	=>
;(printout t "Worn pads, shoes, bound piston, power boost problem" crlf))

(defrule MAIN::Diff
	(Hard yes)
	=>
(printout t "The brake pedal is difficult to push, higher than normal? (yes/no)" crlf)
	(bind ?a (read))
	(assert (Diff ?a)))

;yes-no-no-no-no-no-no-yes-no

(defrule MAIN::Schedule
	(Diff no)
	=>
(printout t "Schedule Brake System Inspection" crlf))

;yes-no-no-no-no-no-no-yes-yes

(defrule MAIN::BrBoo
	(Diff yes)
	=>
(printout t "Replace your brake booster in a timely manner so you can safely drive your vehicle again" crlf))

;yes-no-no-no-no-no-no-no

(defrule MAIN::Light
	(Hard no)
	=>
(printout t "If brake waring light on and parking brake is released, see service manual for codes" crlf))
