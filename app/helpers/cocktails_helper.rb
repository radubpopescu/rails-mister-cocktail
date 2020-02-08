module CocktailsHelper
  def cocktail_url(cocktail)
    if cocktail.photo.attached?
      cl_image_path(cocktail.photo.key)
    else
      "https://source.unsplash.com/2000x1000/?#{cocktail.name.gsub(/\s/, '+')}"
    end
  end
end
