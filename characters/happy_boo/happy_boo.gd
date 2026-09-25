extends Node2D


func play_idle_animation():
	if(%AnimationPlayer.current_animation != "hurt"):
		%AnimationPlayer.play("idle")


func play_walk_animation():
	if(%AnimationPlayer.current_animation != "hurt"):
		%AnimationPlayer.play("walk")
	
func play_hurt_animation():
	%AnimationPlayer.play("hurt")
