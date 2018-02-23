UPDATE characters SET species = "Martian" HAVING characters.id = MAX(characters.id)
