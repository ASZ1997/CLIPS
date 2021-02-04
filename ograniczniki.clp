(deffacts dane
(osoba Marcin blond niebieskie)
(osoba Ania rude niebieskie)
(osoba Jacek blond piwne)
(osoba Dorota czarne piwne)
(osoba Asia blond niebieskie)
)

; koniunkcja warto�ci pola
; -------------------------

; koniunkcja dla sta�ych

(defrule blond-rude
(osoba ?im blond&rude ?) ; UWAGA!!! B��D!!!
=>
(assert (pasemka ?im)))

; koniunkcja ze zmienn�

(defrule para-blond
(osoba ?im1 blond ?ko)
(osoba ?im2 blond ?ko&~piwne)  ; blond w�osy ale kolor oczu ten i nie piwne!!!
=>
(assert (parka-blond ?im1 ?im2)))
/////////////////////////////////
(deffacts dane
(osoba Marcin blond niebieskie)
(osoba Ania rude niebieskie)
(osoba Jacek blond piwne)
(osoba Dorota czarne piwne)
(osoba Asia blond niebieskie)
)

; kilka ogranicznik�w
; -------------------

(defrule para-blond
(osoba ?im1 blond ?ko)
(osoba ?im2&~?im1 blond ?ko)  ; osoba ?im2 NA PEWNO inna niz ?im1
=>
(assert (parka-blond ?im1 ?im2)))

/////////////////////////////////
(deffacts dane
(osoba Marcin blond niebieskie)
(osoba Ania rude niebieskie)
(osoba Jacek blond piwne)
(osoba Dorota czarne piwne)
(osoba Asia blond niebieskie)
)

; negacja warto�ci pola
; ---------------------

; negacja sta�ej
(defrule para-blond1
(osoba ?im1 blond ?)
(osoba ?im2 ~blond ?)  ; kolor w�os�w inny ni� blond!
=>
(assert (parka-blond1 ?im1 ?im2)))

; negacja zmiennej
(defrule para-blond2
(osoba ?im1 blond ?ko)
(osoba ?im2 blond ~?ko)  ; blond w�osy ale kolor oczu r�ny!!!
=>
(assert (parka-blond2 ?im1 ?im2)))
//////////////////////////////////
(deffacts dane
(osoba Marcin blond niebieskie)
(osoba Ania rude niebieskie)
(osoba Jacek blond piwne)
(osoba Dorota czarne piwne)
(osoba Asia blond niebieskie)
)

; alternatywa warto�ci pola
; -------------------------

; alternatywa dla sta�ych

(defrule blond-lub-rude
(osoba ?im blond|rude ?)  ; kolor w�os�w blond lub rude
=>
(assert (jasne-wlosy ?im)))

; alternatywa ze zmienn�

(defrule para-blond
(osoba ?im1 blond ?ko)
(osoba ?im2 blond ?ko|piwne)  ; blond w�osy ale kolor oczu ten sam lub kto�ma piwne!!!
=>
(assert (parka-blond ?im1 ?im2)))
////////////////////////////////
