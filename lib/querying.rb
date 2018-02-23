def select_books_titles_and_years_in_first_series_order_by_year
  %w[
    SELECT books.title, year
    FROM books
    LEFT JOIN series
    ON books.series_id = series.id
    WHERE series.id = 1
    ORDER BY year ASC
  ].join(' ')
end

def select_name_and_motto_of_char_with_longest_motto
  %w[
    SELECT name, motto
    FROM characters
    ORDER BY LENGTH(motto) DESC
    LIMIT 1
  ].join(' ')
end


def select_value_and_count_of_most_prolific_species
  %w[
    SELECT species, COUNT(species)
    FROM characters
    GROUP BY species
    ORDER BY COUNT(species) DESC
    LIMIT 1
  ].join(' ')
end

def select_name_and_series_subgenres_of_authors
  %w[
    SELECT authors.name, subgenres.name
    FROM series
    LEFT JOIN authors
    ON series.author_id = authors.id
    LEFT JOIN subgenres
    ON series.subgenre_id = subgenres.id
  ].join(' ')
end

def select_series_title_with_most_human_characters
  %w[
    SELECT series.title
    FROM characters
    LEFT JOIN series
    ON characters.series_id = series.id
    GROUP BY series.title
    ORDER BY COUNT((SELECT species WHERE species = "HUMAN")) DESC
    LIMIT 1
  ].join(' ')
end

def select_character_names_and_number_of_books_they_are_in
  %w[
    SELECT characters.name, COUNT(characters.name)
    FROM character_books
    LEFT JOIN characters
    ON character_id = characters.id
    GROUP BY characters.name
    ORDER BY COUNT(characters.name) DESC
  ].join(' ')
end
