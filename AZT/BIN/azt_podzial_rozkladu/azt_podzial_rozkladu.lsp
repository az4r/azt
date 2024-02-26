(defun c:azt_podzial_rozkladu ()
  ;(setq podz (vlax-get-property (vlax-ename->vla-object (car  (entsel "Wskaz wymiar: "))) 'ExtLine1Point))
  ;(setq podz(vlax-invoke azt_bz_dane_obiekt 'Getattributes))
  ;(setq podz (vlax-invoke-method (vlax-get-property (vlax-ename->vla-object (car  (entsel "Wskaz wymiar: "))) 'ExtLine1Point)))
  ;(vla-get-textstring (nth 0 podz))
  (setq azt_podzial_rozkladu_rozklad (entget (car (entsel "Wskaz rozklad: "))))
  (setq azt_podzial_rozkladu_rozstaw_pretow (getstring "Podaj rozstaw pretow (mm): "))
  (setq azt_podzial_rozkladu_punkt1 (list (cadr (assoc 13 azt_podzial_rozkladu_rozklad)) (caddr (assoc 13 azt_podzial_rozkladu_rozklad))))
  (setq azt_podzial_rozkladu_punkt2 (list (cadr (assoc 14 azt_podzial_rozkladu_rozklad)) (caddr (assoc 14 azt_podzial_rozkladu_rozklad))))
  (setq azt_podzial_rozkladu_punkt_przeciecia (getpoint "Wskaz punkt przeciecia rozkladu: "))
  (setq azt_podzial_rozkladu_punkt_przeciecia (list (car azt_podzial_rozkladu_punkt_przeciecia) (cadr azt_podzial_rozkladu_punkt_przeciecia)))
  (setq azt_podzial_rozkladu_dlugosc_rozkladu (distance azt_podzial_rozkladu_punkt1 azt_podzial_rozkladu_punkt2))
  (setq azt_podzial_rozkladu_dlugosc_rozkladu1 (distance azt_podzial_rozkladu_punkt1 azt_podzial_rozkladu_punkt_przeciecia))
  (setq azt_podzial_rozkladu_dlugosc_rozkladu1 (* (atoi azt_podzial_rozkladu_rozstaw_pretow) (fix (+ (/ azt_podzial_rozkladu_dlugosc_rozkladu1 (atoi azt_podzial_rozkladu_rozstaw_pretow)) 0.0001))))
  (setq azt_podzial_rozkladu_dlugosc_rozkladu2 (distance azt_podzial_rozkladu_punkt2 azt_podzial_rozkladu_punkt_przeciecia))
  (setq azt_podzial_rozkladu_dlugosc_rozkladu2 (* (atoi azt_podzial_rozkladu_rozstaw_pretow) (fix (+ (/ azt_podzial_rozkladu_dlugosc_rozkladu2 (atoi azt_podzial_rozkladu_rozstaw_pretow)) 0.0001))))
  (setq azt_podzial_rozkladu_stretch_punkt11 (list (+ (car azt_podzial_rozkladu_punkt1) 10) (+ (cadr azt_podzial_rozkladu_punkt1) 10)))
  (setq azt_podzial_rozkladu_stretch_punkt12 (list (*(+ (car azt_podzial_rozkladu_punkt1) 10) -1) (*(+ (cadr azt_podzial_rozkladu_punkt1) 10) -1) ))
  (command "_stretch" "_C" azt_podzial_rozkladu_stretch_punkt11 azt_podzial_rozkladu_stretch_punkt12 "" "D" '(100.0 0.0 0.0))
  (princ)
)