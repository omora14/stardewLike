signal all_coins_collected

extends Node

var total_coins: int = 0
var coins_collected: int = 0

func register_coin():
	total_coins += 1

func collect_coin():
	coins_collected += 1
	print("Coins:", coins_collected, "/", total_coins)

	if coins_collected == total_coins:
		print("ALL COINS COLLECTED!")
		emit_signal("all_coins_collected")
