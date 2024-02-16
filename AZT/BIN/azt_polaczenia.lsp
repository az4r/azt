(defun c:azt_polaczenie_zakladkowe_start()
  (setq azt_aktualne_polaczenie_zakladkowe_rodzaj_sruby "12")
  (setq azt_aktualne_polaczenie_zakladkowe_ilosc_srub_w_poziomie "2")
  (setq azt_aktualne_polaczenie_zakladkowe_ilosc_srub_w_pionie "2")
  (princ)
)

(defun azt_polaczenie_zal_parametry_m12 ()
  (setq azt_polaczenie_zal_parametr_s "30")
  (setq azt_polaczenie_zal_parametr_p "35")
  (setq azt_polaczenie_zal_parametr_e "20")
)

(defun azt_polaczenie_zal_parametry_m16 ()
  (setq azt_polaczenie_zal_parametr_s "35")
  (setq azt_polaczenie_zal_parametr_p "45")
  (setq azt_polaczenie_zal_parametr_e "25")
)

(defun azt_polaczenie_zal_parametry_m20 ()
  (setq azt_polaczenie_zal_parametr_s "35")
  (setq azt_polaczenie_zal_parametr_p "45")
  (setq azt_polaczenie_zal_parametr_e "25")
)

(defun azt_polaczenie_zal_parametry_m24 ()
  (setq azt_polaczenie_zal_parametr_s "50")
  (setq azt_polaczenie_zal_parametr_p "60")
  (setq azt_polaczenie_zal_parametr_e "35")
)

(defun azt_polaczenie_zal_parametry_m30 ()
  (setq azt_polaczenie_zal_parametr_s "60")
  (setq azt_polaczenie_zal_parametr_p "80")
  (setq azt_polaczenie_zal_parametr_e "45")
)

(defun azt_polaczenie_zakladkowe_parametry ()
  (setq azt_polaczenie_zakladkowe_rodzaj_sruby (getstring (strcat "\nPodaj srednice trzpienia sruby (MXX) [12/16/20/24/30]: <" azt_aktualne_polaczenie_zakladkowe_rodzaj_sruby ">")))
  (if (equal azt_polaczenie_zakladkowe_rodzaj_sruby "")
      (setq azt_polaczenie_zakladkowe_rodzaj_sruby azt_aktualne_polaczenie_zakladkowe_rodzaj_sruby)
      (princ)
  )
  (if (equal azt_polaczenie_zakladkowe_rodzaj_sruby "12")
      (azt_polaczenie_zal_parametry_m12)
      (princ)
  )
  (if (equal azt_polaczenie_zakladkowe_rodzaj_sruby "16")
      (azt_polaczenie_zal_parametry_m16)
      (princ)
  )
    (if (equal azt_polaczenie_zakladkowe_rodzaj_sruby "20")
      (azt_polaczenie_zal_parametry_m20)
      (princ)
  )
  (if (equal azt_polaczenie_zakladkowe_rodzaj_sruby "24")
      (azt_polaczenie_zal_parametry_m24)
      (princ)
  )
  (if (equal azt_azt_polaczenie_zakladkowe_rodzaj_sruby "30")
      (azt_polaczenie_zal_parametry_m30)
      (princ)
  )
  
  (setq azt_polaczenie_parametr_p (getstring (strcat "\nPodaj rozstaw srub: <" azt_polaczenie_zal_parametr_p ">")))
  (if (equal azt_polaczenie_parametr_p "")
      (setq azt_polaczenie_parametr_p azt_polaczenie_zal_parametr_p)
      (princ)
  )

  (setq azt_polaczenie_parametr_s (getstring (strcat "\nPodaj odleglosc od lica elementu: <" azt_polaczenie_zal_parametr_s ">")))
  (if (equal azt_polaczenie_parametr_s "")
      (setq azt_polaczenie_parametr_s azt_polaczenie_zal_parametr_s)
      (princ)
  )
  
  (setq azt_polaczenie_parametr_e (getstring (strcat "\nPodaj odleglosc od krawedzi blachy: <" azt_polaczenie_zal_parametr_e ">")))
  (if (equal azt_polaczenie_parametr_e "")
      (setq azt_polaczenie_parametr_e azt_polaczenie_zal_parametr_e)
      (princ)
  )
  (princ)
)

(defun c:azt_polaczenie_zakladkowe_widok ()
  (azt_polaczenie_zakladkowe_parametry)
  
  (setq azt_polaczenie_zakladkowe_ilosc_srub_w_poziomie (getstring (strcat "\nPodaj ilosc srub w polaczeniu poziomo: <" azt_aktualne_polaczenie_zakladkowe_ilosc_srub_w_poziomie ">")))
  (if (equal azt_polaczenie_zakladkowe_ilosc_srub_w_poziomie "")
      (setq azt_polaczenie_zakladkowe_ilosc_srub_w_poziomie azt_aktualne_polaczenie_zakladkowe_ilosc_srub_w_poziomie)
      (princ)
  )
  
  (setq azt_polaczenie_zakladkowe_ilosc_srub_w_pionie (getstring (strcat "\nPodaj ilosc srub w polaczeniu pionowo: <" azt_aktualne_polaczenie_zakladkowe_ilosc_srub_w_pionie ">")))
  (if (equal azt_polaczenie_zakladkowe_ilosc_srub_w_pionie "")
      (setq azt_polaczenie_zakladkowe_ilosc_srub_w_pionie azt_aktualne_polaczenie_zakladkowe_ilosc_srub_w_pionie)
      (princ)
  )
  
  ;######### OTWORY #########
  (command "_ZOOM" "_SCALE" "10000X")
  (command "_layer" "_S" "S_AXIS" "")
  (setq azt_polaczenie_zakladkowe_aktualny_punktx "0")
  (setq azt_polaczenie_zakladkowe_aktualny_punkty "0")
  (repeat (atoi azt_polaczenie_zakladkowe_ilosc_srub_w_pionie)
    (setq azt_polaczenie_zakladkowe_aktualny_punktx "0")
    (repeat (atoi azt_polaczenie_zakladkowe_ilosc_srub_w_poziomie)
      (command "_point" (list (atoi azt_polaczenie_zakladkowe_aktualny_punktx) (atoi azt_polaczenie_zakladkowe_aktualny_punkty)))
      (setq azt_polaczenie_zakladkowe_aktualny_punktx (itoa (+ (atoi azt_polaczenie_zakladkowe_aktualny_punktx) (atoi azt_polaczenie_parametr_p))))
    )
    (setq azt_polaczenie_zakladkowe_aktualny_punkty (itoa (+ (atoi azt_polaczenie_zakladkowe_aktualny_punkty) (atoi azt_polaczenie_parametr_p))))
  )
  
  ;######### KRAWEDZ ELEMENTU #########
  (command "_layer" "_S" "S_VIEW SECTION" "")
  (setq azt_polaczenie_zakladkowe_aktualny_punktx1 "0")
  (setq azt_polaczenie_zakladkowe_aktualny_punkty1 "0")
  (setq azt_polaczenie_zakladkowe_aktualny_punktx2 "0")
  (setq azt_polaczenie_zakladkowe_aktualny_punkty2 "0")
  (setq azt_polaczenie_zakladkowe_aktualny_punktx1 (itoa (- (atoi azt_polaczenie_zakladkowe_aktualny_punktx1) (atoi azt_polaczenie_parametr_s))))
  (setq azt_polaczenie_zakladkowe_aktualny_punkty1 (itoa (- (atoi azt_polaczenie_zakladkowe_aktualny_punkty1) (atoi azt_polaczenie_parametr_s))))
  (setq azt_polaczenie_zakladkowe_aktualny_punktx2 (itoa (+ (* (+ (atoi azt_polaczenie_zakladkowe_aktualny_punktx2) (atoi azt_polaczenie_parametr_p)) (1- (atoi azt_polaczenie_zakladkowe_ilosc_srub_w_poziomie))) (atoi azt_polaczenie_parametr_s))))
  (setq azt_polaczenie_zakladkowe_aktualny_punkty2 (itoa (+ (* (+ (atoi azt_polaczenie_zakladkowe_aktualny_punkty2) (atoi azt_polaczenie_parametr_p)) (1- (atoi azt_polaczenie_zakladkowe_ilosc_srub_w_pionie))) (atoi azt_polaczenie_parametr_s))))
  (command "_rectang" (list (atoi azt_polaczenie_zakladkowe_aktualny_punktx1) (atoi azt_polaczenie_zakladkowe_aktualny_punkty1)) (list (atoi azt_polaczenie_zakladkowe_aktualny_punktx2) (atoi azt_polaczenie_zakladkowe_aktualny_punkty2)))


;######### KRAWEDZ BLACHY #########
  (command "_layer" "_S" "S_VIEW" "")
  (setq azt_polaczenie_zakladkowe_aktualny_punktx1 "0")
  (setq azt_polaczenie_zakladkowe_aktualny_punkty1 "0")
  (setq azt_polaczenie_zakladkowe_aktualny_punktx2 "0")
  (setq azt_polaczenie_zakladkowe_aktualny_punkty2 "0")
  (setq azt_polaczenie_zakladkowe_aktualny_punktx1 (itoa (- (atoi azt_polaczenie_zakladkowe_aktualny_punktx1) (atoi azt_polaczenie_parametr_e))))
  (setq azt_polaczenie_zakladkowe_aktualny_punkty1 (itoa (- (atoi azt_polaczenie_zakladkowe_aktualny_punkty1) (atoi azt_polaczenie_parametr_e))))
  (setq azt_polaczenie_zakladkowe_aktualny_punktx2 (itoa (+ (* (+ (atoi azt_polaczenie_zakladkowe_aktualny_punktx2) (atoi azt_polaczenie_parametr_p)) (1- (atoi azt_polaczenie_zakladkowe_ilosc_srub_w_poziomie))) (atoi azt_polaczenie_parametr_e))))
  (setq azt_polaczenie_zakladkowe_aktualny_punkty2 (itoa (+ (* (+ (atoi azt_polaczenie_zakladkowe_aktualny_punkty2) (atoi azt_polaczenie_parametr_p)) (1- (atoi azt_polaczenie_zakladkowe_ilosc_srub_w_pionie))) (atoi azt_polaczenie_parametr_e))))
  (command "_rectang" (list (atoi azt_polaczenie_zakladkowe_aktualny_punktx1) (atoi azt_polaczenie_zakladkowe_aktualny_punkty1)) (list (atoi azt_polaczenie_zakladkowe_aktualny_punktx2) (atoi azt_polaczenie_zakladkowe_aktualny_punkty2)))
(command "_ZOOM" "_SCALE" "0.0001X")
)
(c:azt_polaczenie_zakladkowe_start)
(c:azt_polaczenie_zakladkowe_widok)