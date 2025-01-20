@interface PIParallaxGreenScreenGraphicStyle
+ (id)styleWithColorAnalysis:(id)a3;
+ (id)styleWithParameters:(id)a3 colorSuggestions:(id)a4;
- (BOOL)configureForCategory:(id)a3;
- (BOOL)hasColorParameter;
- (PFParallaxColor)color;
- (PIParallaxGreenScreenGraphicStyle)initWithColor:(id)a3 clockColor:(id)a4 colorSuggestions:(id)a5;
- (id)kind;
- (id)parameters;
- (id)recipeIdentifier;
- (void)setColor:(id)a3;
@end

@implementation PIParallaxGreenScreenGraphicStyle

- (void).cxx_destruct
{
}

- (void)setColor:(id)a3
{
}

- (PFParallaxColor)color
{
  return self->_color;
}

- (BOOL)hasColorParameter
{
  return 1;
}

- (BOOL)configureForCategory:(id)a3
{
  v4 = [(PIParallaxStyle *)self colorSuggestionForCategory:a3];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 primaryColor];
    [(PIParallaxGreenScreenGraphicStyle *)self setColor:v6];
  }
  return v5 != 0;
}

- (id)recipeIdentifier
{
  return @"GreenScreenMono";
}

- (id)kind
{
  return (id)*MEMORY[0x1E4F8D010];
}

- (id)parameters
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = *MEMORY[0x1E4F8D040];
  v3 = [(PIParallaxStyle *)self clockColor];
  v8[0] = v3;
  v7[1] = *MEMORY[0x1E4F8D058];
  v4 = [(PIParallaxGreenScreenGraphicStyle *)self color];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (PIParallaxGreenScreenGraphicStyle)initWithColor:(id)a3 clockColor:(id)a4 colorSuggestions:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v8 = (PFParallaxColor *)a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v15 = NUAssertLogger_3803();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "color != nil");
      *(_DWORD *)buf = 138543362;
      v30 = v16;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v17 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v19 = NUAssertLogger_3803();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v23 = dispatch_get_specific(*v17);
        v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        v26 = [v24 callStackSymbols];
        v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v30 = v23;
        __int16 v31 = 2114;
        v32 = v27;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v30 = v22;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v11 = v10;
  v28.receiver = self;
  v28.super_class = (Class)PIParallaxGreenScreenGraphicStyle;
  v12 = [(PIParallaxStyle *)&v28 initWithClockColor:v9 colorSuggestions:v10];
  color = v12->_color;
  v12->_color = v8;

  return v12;
}

+ (id)styleWithParameters:(id)a3 colorSuggestions:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F8D058];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 objectForKeyedSubscript:v6];
  id v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F8D040]];

  if (v10)
  {
    id v11 = v10;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F8CC78] blackColor];
  }
  v12 = v11;

  v13 = (void *)[objc_alloc((Class)a1) initWithColor:v9 clockColor:v12 colorSuggestions:v7];
  return v13;
}

+ (id)styleWithColorAnalysis:(id)a3
{
  id v4 = a3;
  v5 = [[PIParallaxColorSuggester alloc] initWithColorAnalysis:v4];
  uint64_t v6 = [v4 backgroundColors];

  id v7 = +[PIParallaxColorPalette greenScreenVibrantPalette];
  id v8 = [(PIParallaxColorSuggester *)v5 suggestedColorsForColors:v6 fromColorPalette:v7];

  id v9 = PFMap();
  id v10 = [v9 firstObject];
  id v11 = [v10 primaryColor];

  id v12 = objc_alloc(MEMORY[0x1E4F8CC78]);
  [v11 hue];
  double v14 = v13;
  [v11 chroma];
  v16 = (void *)[v12 initWithLuma:0.75 hue:v14 chroma:v15];
  id v17 = objc_alloc((Class)a1);
  v18 = [MEMORY[0x1E4F8CC78] blackColor];
  v19 = (void *)[v17 initWithColor:v16 clockColor:v18 colorSuggestions:MEMORY[0x1E4F1CBF0]];

  return v19;
}

id __60__PIParallaxGreenScreenGraphicStyle_styleWithColorAnalysis___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F8CCD0];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithPrimaryColor:v3 secondaryColor:0];

  return v4;
}

@end