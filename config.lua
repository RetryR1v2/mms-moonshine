Config = {}

--Setup as many places as you want Brennerei
Config.brennerei = {
    { 
        lable = 'Lagras Brennerei',
        name = 'Brennerei Lagras',
        coords = vector3(1910.41, -719.21, 42.17),  --- Maischer Lagras
        showblip = true,
        blipName = 'Brennerei Lagras',
        blipSprite = 'blip_mg_drinking',
        blipScale = 4.5
    },
    
    -- add more as required
}


Config.maischer = {
    { 
        lable = 'Maischer Manzanita',
        name = 'Manzanita Maischer',
        coords = vector3(-1986.09, -1643.12, 117.18),  --- Maischer Manzanita Post
        showblip = true,
        blipName = 'Maischer Manzanita',
        blipSprite = 'blip_summer_feed',
        blipScale = 4.5
    },
    
    -- add more as required
}

---- Rezept 1 ----

Config.rezept1maischenname = 'Weizen Maische'
Config.rezept1whiskeyname = 'Weizen Whiskey'

Config.rezept1active = true
Config.rezept1maischertime = 6000    -- 10000 = 10 Sekunden  Zeit für die Herstellung der Maische Wird mit  input   Multipliziert
Config.rezept1brennertime = 6000     -- 10000 = 10 Sekunden  Zeit für die Herstellung des Whiskeys Wird mit  input  Multipliziert

Config.maische1item1 = 'bread'   -- Zutat 1
Config.maische1anzahl1 = 3

Config.maische1item2 = 'water'   -- Zutat 2
Config.maische1anzahl2 = 3

Config.maische1item3 = 'water'   -- Zutat 3
Config.maische1anzahl3 = 3

Config.rewardmaische1item = 'weizenmaische'    ---- Maische 
Config.rewardmaische1anzahl = 1

Config.brenner1anzahl = 5
Config.brenner1item = 'weizenmaische'
Config.brenner1reward = 'weizenwhiskey'     ---- Whiskey
Config.brenner1rewardanzahl = 1     ---- Whiskey Anzahl

---- Rezept 2 ----

Config.rezept2maischenname = 'Weizen Maische'
Config.rezept2whiskeyname = 'Weizen Whiskey'

Config.rezept2active = true
Config.rezept2maischertime = 10000    -- 10000 = 10 Sekunden  Zeit für die Herstellung der Maische Wird mit  input   Multipliziert
Config.rezept2brennertime = 10000     -- 10000 = 10 Sekunden  Zeit für die Herstellung des Whiskeys Wird mit  input  Multipliziert

Config.maische2item1 = 'bread'   -- Zutat 1
Config.maische2anzahl1 = 3

Config.maische2item2 = 'water'   -- Zutat 2
Config.maische2anzahl2 = 3

Config.maische2item3 = 'water'   -- Zutat 3
Config.maische2anzahl3 = 3

Config.rewardmaische2item = 'weizenmaische'    ---- Maische 
Config.rewardmaische2anzahl = 1

Config.brenner2anzahl = 5
Config.brenner2item = 'weizenmaische'
Config.brenner2reward = 'weizenwhiskey'     ---- Whiskey
Config.brenner2rewardanzahl = 1     ---- Whiskey Anzahl
