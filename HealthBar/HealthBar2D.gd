extends TextureProgress

var bar_red = preload("res://HealthBar/barHorizontal_red_mid 200.png")
var bar_green = preload("res://HealthBar/barHorizontal_green_mid 200.png")
var bar_yellow = preload("res://HealthBar/barHorizontal_yellow_mid 200.png")
				
#func _ready():
#	hide()
	
func update_bar(amount, full):
	texture_progress = bar_green
	if amount < 0.75 * full:
		texture_progress = bar_yellow
	if amount < 0.45 * full:
		texture_progress = bar_red
	value = amount
