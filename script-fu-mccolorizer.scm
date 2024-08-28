; SeveringHams' Texture Colorizer Script-Fu Script
; This language sucks!! :D
(define (script-fu-mccolorizer img draw1 srcColor)
	(gimp-image-undo-group-start img)
	(let* 
		(
			(pos 0) (x 0) (y 0)
			(srcR 0) (srcG 0) (srcB 0)
			(inR 0) (inG 0) (inB 0) (alpha 255)
			(outColor (make-vector 4 0))
		)
		(define draw2 (car (gimp-layer-new-from-drawable draw1 img)))	; <-------,
		(gimp-image-insert-layer img draw2 0 -1)						; 		  |
		(set! srcR (car srcColor))										; 		  |
		(set! srcG (cadr srcColor))										; 		  |
		(set! srcB (caddr srcColor))									;		  *
		(while (< pos 256) 												; I have the image create
			(set! x (- pos (* 16 (floor (/ pos 16)))))					; a second layer to write
			(set! y (floor (/ pos 16)))									; to, because 
			(define inColor (cadr (gimp-drawable-get-pixel draw1 x y)))	; apparently direct
			(set! inR (car (vector->list inColor)))						; pixel writes do not
			(set! inG (cadr (vector->list inColor)))					; count as undoable
			(set! inB (caddr (vector->list inColor)))					; operations...
			(vector-set! outColor 0 (floor (/ (* inR srcR) 255)))		;		   ,
			(vector-set! outColor 1 (floor (/ (* inG srcG) 255)))		;		   |
			(vector-set! outColor 2 (floor (/ (* inB srcB) 255)))		;		   |
			(vector-set! outColor 3 (cadddr (vector->list inColor)))	; 		   |
			(gimp-drawable-set-pixel draw2 x y 4 outColor) ; <---------------------|
			(set! pos (+ pos 1))			;									   |
		) 									;									   |
		(gimp-image-merge-down img draw2 0) ; <------------------------------------*
		(gimp-selection-none img)
		(gimp-image-undo-group-end img)
		(gimp-displays-flush)
	)
)
(script-fu-register
"script-fu-mccolorizer"
"MC-Colorizer"
"Colorizes like Minecraft"
"SeveringHams"
"GNU General Public License v3.0"
"August 28, 2024"
"RGBA"
SF-IMAGE "Image" 0
SF-DRAWABLE "Drawable" 0
SF-COLOR "Color" '(0 0 0))
(script-fu-menu-register "script-fu-mccolorizer" "<Image>/Colors/MC-Colorizer")