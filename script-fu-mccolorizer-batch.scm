(define (script-fu-mccolorizer-batch img drawmain dirPath prefix numbered)
	(let* 
		(
			(i 0)
            (vS (vector "79c05a" "8ab689" "bfb755" "59c93c" "55c93f" "88bb66" "86b87f" "64c73f" "86b783" "83b593" "80b497" "91bd59" "90814d" "8eb971" "6a7039" "507a32"))
        )
        (if (char-alphabetic? (car (string->list dirPath)))
        	(set! dirPath (string-append dirPath "\\" prefix)) 
        	(set! dirPath (string-append dirPath "/" prefix))
        )
		(while (< i 16)
			(let* 
				(
					(vR (string->number (list->string (list (string-ref (aref vS i) 0) (string-ref (aref vS i) 1))) 16)) ; 
					(vG (string->number (list->string (list (string-ref (aref vS i) 2) (string-ref (aref vS i) 3))) 16)) ; convert hex to RGB
					(vB (string->number (list->string (list (string-ref (aref vS i) 4) (string-ref (aref vS i) 5))) 16)) ;
					(imgDupe (car (gimp-image-duplicate img)))
					(inColor1 (list vR vG vB))
					(fullpath "")
				)
				(if (= numbered TRUE) 
					(set! fullpath (string-append dirPath (list->string (cdr (string->list (number->string (+ i 101) 10)))) "-" (aref vS i) ".png"))
					(set! fullpath (string-append dirPath (aref vS i) ".png"))
				)						
				(mccolorizer-func imgDupe inColor1)
            	(file-png-save RUN-NONINTERACTIVE imgDupe (car (gimp-image-get-active-drawable imgDupe)) fullpath fullpath FALSE 0 FALSE FALSE FALSE FALSE FALSE)
            	(gimp-image-delete imgDupe)
            )
			(set! i (+ i 1))
		)
	)
)
(define (mccolorizer-func img2 srcColor)
	(let* 
		(
			(pos 0) (x 0) (y 0)
			(srcR (car srcColor)) 
			(srcG (cadr srcColor)) 
			(srcB (caddr srcColor))
			(inR 0) (inG 0) (inB 0) (alpha 255)
			(outColor (make-vector 4 0))
			(inColor `())
			(draw1 (car (gimp-image-get-active-drawable img2)))
		)
		(while (< pos 256)
			(set! x (- pos (* 16 (floor (/ pos 16)))))
			(set! y (floor (/ pos 16)))
			(set! inColor (cadr (gimp-drawable-get-pixel draw1 x y)))
			(set! inR (car (vector->list inColor)))
			(set! inG (cadr (vector->list inColor)))
			(set! inB (caddr (vector->list inColor)))
			(set! outColor (vector (floor (/ (* inR srcR) 255)) (floor (/ (* inG srcG) 255)) (floor (/ (* inB srcB) 255)) (cadddr (vector->list inColor))))
			(gimp-drawable-set-pixel draw1 x y 4 outColor)
			(set! pos (+ pos 1))
		)
		(gimp-image-merge-down img2 draw1 0)
	)	
	(gimp-selection-none img2)
)
(script-fu-register
"script-fu-mccolorizer-batch"
"Batch MC-Colorizer"
"Automatically creates a texture for each grass color,\nand colorizes them like Minecraft."
"SeveringHams"
"GNU General Public License v3.0"
"August 30, 2024"
"RGBA"
SF-IMAGE "Image" 0
SF-DRAWABLE "Drawable" 0
SF-DIRNAME "Output Directory" ""
SF-STRING "File name prefix (optional)" "grass_block_side_"
SF-TOGGLE "Number output textures 01-16" FALSE)
(script-fu-menu-register "script-fu-mccolorizer-batch" "<Image>/Colors/MC-Colorizer-Batch")
