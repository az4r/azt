(defun c:azt_wstaw_symbol_przekroju ()
  (setq azt_attdia_wartosc_domyslna (getvar "ATTDIA"))
  (setvar "ATTDIA" 0)
  (setq azt_wstaw_symbol_przekroju_punkt1 (getpoint "\nWskaz pierwszy punkt przekroju: "))
  (setq azt_wstaw_symbol_przekroju_punkt2 (getpoint azt_wstaw_symbol_przekroju_punkt1 "\nWskaz drugi punkt przekroju: "))
  (setq azt_wstaw_symbol_przekroju_nazwa_przekroju (getstring "\Podaj pojedynczy symbol przekroju: "))
  (setq azt_wstaw_symbol_przekroju_odleglosc (distance azt_wstaw_symbol_przekroju_punkt1 azt_wstaw_symbol_przekroju_punkt2))
  (setq azt_wstaw_symbol_przekroju_kat (angle azt_wstaw_symbol_przekroju_punkt1 azt_wstaw_symbol_przekroju_punkt2))
  (command "-insert" "s_PRZEKR�J" azt_wstaw_symbol_przekroju_punkt1 azt_aktualna_skala_blokow "" (* 180 (/ azt_wstaw_symbol_przekroju_kat pi)) azt_wstaw_symbol_przekroju_nazwa_przekroju azt_wstaw_symbol_przekroju_nazwa_przekroju)
  (setq azt_znacznik_przekroju (vlax-ename->vla-object (cdr (assoc -1 (entget (entlast))))))
  (vla-put-value (car (vlax-invoke azt_znacznik_przekroju 'getdynamicblockproperties)) (vlax-make-variant azt_wstaw_symbol_przekroju_odleglosc (vlax-variant-type (vla-get-value (car (vlax-invoke azt_znacznik_przekroju 'getdynamicblockproperties))))))
  (setvar "ATTDIA" azt_attdia_wartosc_domyslna)
  (princ)
)
(c:azt_wstaw_symbol_przekroju)