$scoreboard players set RestartETA RestartETA $(RestartETA)
$execute unless score RestartETA RestartETA matches ..3 run tellraw @a {"text":"THE SERVER WILL RESTART IN $(RestartETA) Minutes","bold":true,"underlined":true,"color":"red"}
#$execute unless score RestartETA RestartETA matches ..3 run return
$execute unless score RestartETA RestartETA matches ..1 run title @a title {"text":"SERVER RESTART IN $(RestartETA) Minutes","bold":true,"underlined":true,"color":"red"}
#$execute unless score RestartETA RestartETA matches ..1 run return
$execute if score RestartETA RestartETA matches ..1 run title @a title {"text":"SERVER RESTART IN $(RestartETA) Minute","bold":true,"underlined":true,"color":"red"}
