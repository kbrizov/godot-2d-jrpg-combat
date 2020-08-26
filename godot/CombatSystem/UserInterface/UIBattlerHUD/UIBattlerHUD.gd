class_name UIBattlerHUD
extends TextureRect

onready var life_bar: TextureProgress = $UILifeBar
onready var energy_bar := $UIEnergyBar


func setup(stats: BattlerStats) -> void:
	life_bar.max_value = stats.max_health
	life_bar.value = stats.health
	energy_bar.max_value = stats.max_energy
	energy_bar.value = stats.energy
	stats.connect("health_changed", self, "_on_BattlerStats_health_changed")
	stats.connect("energy_changed", self, "_on_BattlerStats_energy_changed")


func _on_BattlerStats_health_changed(old_value: float, new_value: float) -> void:
	life_bar.target_value = new_value


func _on_BattlerStats_energy_changed(old_value: float, new_value: float) -> void:
	energy_bar.value = new_value