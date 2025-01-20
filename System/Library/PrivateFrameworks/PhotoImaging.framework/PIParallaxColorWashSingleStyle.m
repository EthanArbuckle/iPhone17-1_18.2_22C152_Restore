@interface PIParallaxColorWashSingleStyle
+ (id)styleWithColorAnalysis:(id)a3;
+ (id)styleWithParameters:(id)a3 colorSuggestions:(id)a4;
- (BOOL)configureForCategory:(id)a3;
- (BOOL)hasBackgroundParameter;
- (BOOL)hasColorParameter;
- (BOOL)showsBackground;
- (PFParallaxColor)color;
- (PIParallaxColorWashSingleStyle)initWithColor:(id)a3 background:(BOOL)a4 clockColor:(id)a5 suggestions:(id)a6;
- (id)kind;
- (id)parameters;
- (id)recipeIdentifier;
- (void)setColor:(id)a3;
- (void)setShowsBackground:(BOOL)a3;
@end

@implementation PIParallaxColorWashSingleStyle

- (void).cxx_destruct
{
}

- (void)setShowsBackground:(BOOL)a3
{
  self->_showsBackground = a3;
}

- (BOOL)showsBackground
{
  return self->_showsBackground;
}

- (void)setColor:(id)a3
{
}

- (PFParallaxColor)color
{
  return self->_color;
}

- (BOOL)hasBackgroundParameter
{
  return 1;
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
    [(PIParallaxColorWashSingleStyle *)self setColor:v6];
  }
  return v5 != 0;
}

- (id)recipeIdentifier
{
  return (id)*MEMORY[0x1E4F8CFF8];
}

- (id)kind
{
  return (id)*MEMORY[0x1E4F8CFF8];
}

- (id)parameters
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9[0] = *MEMORY[0x1E4F8D058];
  v3 = [(PIParallaxColorWashSingleStyle *)self color];
  v10[0] = v3;
  v9[1] = *MEMORY[0x1E4F8D040];
  v4 = [(PIParallaxStyle *)self clockColor];
  v10[1] = v4;
  v9[2] = *MEMORY[0x1E4F8D038];
  BOOL v5 = [(PIParallaxColorWashSingleStyle *)self showsBackground];
  v6 = &unk_1F000A1D8;
  if (v5) {
    v6 = &unk_1F000A1C8;
  }
  v10[2] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

- (PIParallaxColorWashSingleStyle)initWithColor:(id)a3 background:(BOOL)a4 clockColor:(id)a5 suggestions:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v10 = (PFParallaxColor *)a3;
  id v11 = a5;
  id v12 = a6;
  if (!v10)
  {
    v17 = NUAssertLogger_3803();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "color != nil");
      *(_DWORD *)buf = 138543362;
      v32 = v18;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v19 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v21 = NUAssertLogger_3803();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v25 = dispatch_get_specific(*v19);
        v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        v28 = [v26 callStackSymbols];
        v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v32 = v25;
        __int16 v33 = 2114;
        v34 = v29;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v32 = v24;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v13 = v12;
  v30.receiver = self;
  v30.super_class = (Class)PIParallaxColorWashSingleStyle;
  v14 = [(PIParallaxStyle *)&v30 initWithClockColor:v11 colorSuggestions:v12];
  color = v14->_color;
  v14->_color = v10;

  v14->_showsBackground = a4;
  return v14;
}

+ (id)styleWithParameters:(id)a3 colorSuggestions:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v17 = NUAssertLogger_3803();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "parameters != nil");
      *(_DWORD *)buf = 138543362;
      v31 = v18;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v19 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v21 = NUAssertLogger_3803();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v25 = dispatch_get_specific(*v19);
        v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        v28 = [v26 callStackSymbols];
        v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v31 = v25;
        __int16 v32 = 2114;
        __int16 v33 = v29;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v31 = v24;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v8 = v7;
  v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8D058]];
  v10 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8D040]];
  id v11 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8D038]];
  id v12 = v11;
  if (v11)
  {
    [v11 doubleValue];
    BOOL v14 = v13 < 1.0;
  }
  else
  {
    BOOL v14 = 1;
  }
  v15 = (void *)[objc_alloc((Class)a1) initWithColor:v9 background:v14 clockColor:v10 suggestions:v8];

  return v15;
}

+ (id)styleWithColorAnalysis:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[PIParallaxColorSuggester alloc] initWithColorAnalysis:v4];
  [(PIParallaxColorSuggester *)v5 addRuleWithHueMin:&__block_literal_global_256 hueMax:50.0 suggestion:110.0];
  id v6 = [v4 backgroundColors];

  id v7 = +[PIGlobalSettings globalSettings];
  int v8 = [v7 parallaxStyleAvoidColorWashBrownOverride];

  if (v8)
  {
    uint64_t v9 = PFMap();

    id v6 = (void *)v9;
  }
  v10 = +[PIParallaxColorPalette colorWashSinglePalette];
  id v11 = [(PIParallaxColorSuggester *)v5 suggestedColorsForColors:v6 fromColorPalette:v10];

  id v12 = PFMap();
  id v13 = objc_alloc((Class)a1);
  BOOL v14 = [v11 firstObject];
  v15 = [MEMORY[0x1E4F8CC78] whiteColor];
  v16 = (void *)[v13 initWithColor:v14 background:1 clockColor:v15 suggestions:v12];

  return v16;
}

id __57__PIParallaxColorWashSingleStyle_styleWithColorAnalysis___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F8CCD0];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithPrimaryColor:v3 secondaryColor:0];

  return v4;
}

id __57__PIParallaxColorWashSingleStyle_styleWithColorAnalysis___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F8CC78];
  id v3 = a2;
  id v4 = [v2 alloc];
  [v3 luma];
  double v6 = v5;
  [v3 hue];
  double v8 = v7 + -30.0;
  [v3 chroma];
  double v10 = v9;

  id v11 = (void *)[v4 initWithLuma:v6 hue:v8 chroma:v10];
  return v11;
}

id __57__PIParallaxColorWashSingleStyle_styleWithColorAnalysis___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  [a3 foregroundLuminance];
  if (v5 < 0.67)
  {
    [v4 hue];
    double v7 = v6;
    [v4 hue];
    double v9 = 30.0;
    if (v7 < 80.0) {
      double v9 = -30.0;
    }
    double v10 = v8 + v9;
    id v11 = objc_alloc(MEMORY[0x1E4F8CC78]);
    [v4 luma];
    double v13 = v12;
    [v4 chroma];
    uint64_t v15 = [v11 initWithLuma:v13 hue:v10 chroma:v14];

    id v4 = (id)v15;
  }
  return v4;
}

@end