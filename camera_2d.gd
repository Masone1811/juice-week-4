extends Camera2D

@export var swayAmount := Vector2(4, 3)
@export var swayRotation := 0.03
@export var swaySpeed := 25.0
@export var strengthDecay:= 3.0

var strength := 0.0
var t := 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func BeginSway(amount := 1):
	strength = min(strength + amount, 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if strength <= 0:
		return
	t += delta * swaySpeed
	strength = max(strength - strengthDecay*delta, 0.0)
	var s = strength * strength
	offset = Vector2(sin(t) * swayAmount.x, sin(t * 1.3) * swayAmount.y) * s
	rotation = sin(t * 0.8) * swayRotation * s
	if strength == 0.0:
		offset = Vector2.ZERO
		rotation = 0.0
