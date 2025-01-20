@interface PIParallaxGreenScreenMonoStyle
+ (id)styleWithColorAnalysis:(id)a3;
- (id)kind;
- (id)recipeIdentifier;
@end

@implementation PIParallaxGreenScreenMonoStyle

- (id)recipeIdentifier
{
  return @"GreenScreenGradientMono";
}

- (id)kind
{
  return (id)*MEMORY[0x1E4F8D018];
}

+ (id)styleWithColorAnalysis:(id)a3
{
  id v4 = a3;
  v5 = [[PIParallaxColorSuggester alloc] initWithColorAnalysis:v4];
  v6 = [v4 backgroundColors];

  v7 = +[PIParallaxColorPalette greenScreenVibrantPalette];
  v8 = [(PIParallaxColorSuggester *)v5 suggestedColorsForColors:v6 fromColorPalette:v7];

  v9 = PFMap();
  v10 = [v9 firstObject];
  v11 = [v10 primaryColor];

  id v12 = objc_alloc((Class)a1);
  v13 = [MEMORY[0x1E4F8CC78] whiteColor];
  v14 = (void *)[v12 initWithColor:v11 clockColor:v13 colorSuggestions:v9];

  return v14;
}

id __57__PIParallaxGreenScreenMonoStyle_styleWithColorAnalysis___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F8CCD0];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithPrimaryColor:v3 secondaryColor:0];

  return v4;
}

@end