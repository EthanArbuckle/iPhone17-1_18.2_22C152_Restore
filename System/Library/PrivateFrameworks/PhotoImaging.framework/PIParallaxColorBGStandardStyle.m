@interface PIParallaxColorBGStandardStyle
+ (double)highKeyTone;
+ (double)lowKeyTone;
+ (double)neutralTone;
+ (id)styleWithColorAnalysis:(id)a3;
+ (id)styleWithParameters:(id)a3 colorSuggestions:(id)a4;
- (BOOL)configureForCategory:(id)a3;
- (BOOL)hasBackgroundParameter;
- (BOOL)hasColorParameter;
- (BOOL)showsBackground;
- (PFParallaxColor)color;
- (PIParallaxColorBGStandardStyle)initWithColor:(id)a3 background:(BOOL)a4 clockColor:(id)a5 colorSuggestions:(id)a6;
- (id)kind;
- (id)parameters;
- (id)recipeIdentifier;
- (void)setColor:(id)a3;
- (void)setShowsBackground:(BOOL)a3;
@end

@implementation PIParallaxColorBGStandardStyle

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
    [(PIParallaxColorBGStandardStyle *)self setColor:v6];
  }
  return v5 != 0;
}

- (id)recipeIdentifier
{
  return @"ColorBGStandard";
}

- (id)kind
{
  return (id)*MEMORY[0x1E4F8CFE8];
}

- (id)parameters
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F8CC78]);
  v4 = [(PIParallaxColorBGStandardStyle *)self color];
  [v4 hue];
  v5 = objc_msgSend(v3, "initWithHue:tone:");

  v6 = [(PIParallaxColorBGStandardStyle *)self color];
  [v6 tone];
  double v8 = v7;

  double v9 = (v8 + -0.2) / 0.6;
  double v10 = fmax(v9 * -2.0 + 1.0, 0.0);
  double v11 = fmax(v9 * 2.0 + -1.0, 0.0);
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_357);
  }
  double v12 = fmin(v10, 1.0);
  double v13 = fmin(v11, 1.0);
  v14 = (void *)*MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
  {
    v24 = v14;
    v25 = [(PIParallaxColorBGStandardStyle *)self color];
    *(_DWORD *)buf = 138413058;
    v29 = v25;
    __int16 v30 = 2112;
    v31 = v5;
    __int16 v32 = 2048;
    double v33 = v12;
    __int16 v34 = 2048;
    double v35 = v13;
    _os_log_debug_impl(&dword_1A9680000, v24, OS_LOG_TYPE_DEBUG, "ColorBG color: %@ -> neutral: %@ lowKey: %0.3f highKey: %0.3f", buf, 0x2Au);
  }
  v15 = [(PIParallaxStyle *)self clockColor];
  uint64_t v16 = *MEMORY[0x1E4F8D058];
  v27[0] = v15;
  v27[1] = v5;
  uint64_t v17 = *MEMORY[0x1E4F8D070];
  v26[1] = v16;
  v26[2] = v17;
  v18 = [NSNumber numberWithDouble:v12];
  v27[2] = v18;
  v26[3] = *MEMORY[0x1E4F8D068];
  v19 = [NSNumber numberWithDouble:v13];
  v27[3] = v19;
  v26[4] = *MEMORY[0x1E4F8D038];
  BOOL v20 = [(PIParallaxColorBGStandardStyle *)self showsBackground];
  v21 = &unk_1F000A1D8;
  if (v20) {
    v21 = &unk_1F000A1C8;
  }
  v27[4] = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:5];

  return v22;
}

- (PIParallaxColorBGStandardStyle)initWithColor:(id)a3 background:(BOOL)a4 clockColor:(id)a5 colorSuggestions:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  double v10 = (PFParallaxColor *)a3;
  id v11 = a5;
  id v12 = a6;
  if (!v10)
  {
    uint64_t v17 = NUAssertLogger_3803();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "backgroundColor != nil");
      *(_DWORD *)buf = 138543362;
      __int16 v32 = v18;
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
        __int16 v32 = v25;
        __int16 v33 = 2114;
        __int16 v34 = v29;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v32 = v24;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  double v13 = v12;
  v30.receiver = self;
  v30.super_class = (Class)PIParallaxColorBGStandardStyle;
  v14 = [(PIParallaxStyle *)&v30 initWithClockColor:v11 colorSuggestions:v12];
  color = v14->_color;
  v14->_color = v10;

  v14->_showsBackground = a4;
  return v14;
}

+ (id)styleWithParameters:(id)a3 colorSuggestions:(id)a4
{
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F8D058];
  id v8 = a4;
  double v9 = [v6 objectForKeyedSubscript:v7];
  double v10 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8D070]];
  [v10 doubleValue];
  double v12 = v11;

  double v13 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8D068]];
  [v13 doubleValue];
  double v15 = v14;

  double v16 = -v12;
  if (v15 > 0.0) {
    double v16 = v15;
  }
  double v17 = (v16 + 1.0) * 0.5 * 0.6 + 0.2;
  [v9 hue];
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F8CC78]) initWithHue:v18 tone:v17];
  BOOL v20 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8D040]];
  v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    id v22 = [MEMORY[0x1E4F8CC78] whiteColor];
  }
  v23 = v22;

  v24 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8D038]];
  v25 = v24;
  if (v24)
  {
    [v24 doubleValue];
    BOOL v27 = v26 < 1.0;
  }
  else
  {
    BOOL v27 = 1;
  }
  v28 = (void *)[objc_alloc((Class)a1) initWithColor:v19 background:v27 clockColor:v23 colorSuggestions:v8];

  return v28;
}

+ (id)styleWithColorAnalysis:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[PIGlobalSettings globalSettings];
  uint64_t v6 = [v5 parallaxStyleKeyLevelOverride];

  if (!v6)
  {
    [v4 backgroundLuminance];
    uint64_t v8 = 3;
    if (v7 < 0.67) {
      uint64_t v8 = 2;
    }
    if (v7 < 0.33) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v8;
    }
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_357);
    }
    double v10 = (void *)*MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
    {
      id v22 = off_1E5D7F0E0[v9 - 1];
      v23 = v10;
      [v4 backgroundLuminance];
      *(_DWORD *)buf = 138412546;
      double v26 = v22;
      __int16 v27 = 2048;
      uint64_t v28 = v24;
      _os_log_debug_impl(&dword_1A9680000, v23, OS_LOG_TYPE_DEBUG, "ColorBGStandard: suggested %@ for background luminance of %.2f", buf, 0x16u);
    }
  }
  double v11 = [[PIParallaxColorSuggester alloc] initWithColorAnalysis:v4];
  double v12 = [v4 backgroundColors];
  double v13 = +[PIParallaxColorPalette greenScreenVibrantPalette];
  double v14 = [(PIParallaxColorSuggester *)v11 suggestedColorsForColors:v12 fromColorPalette:v13];

  double v15 = PFMap();
  double v16 = [v15 firstObject];
  double v17 = [v16 primaryColor];

  id v18 = objc_alloc((Class)a1);
  v19 = [MEMORY[0x1E4F8CC78] whiteColor];
  BOOL v20 = (void *)[v18 initWithColor:v17 background:1 clockColor:v19 colorSuggestions:v15];

  return v20;
}

id __57__PIParallaxColorBGStandardStyle_styleWithColorAnalysis___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F8CC78];
  id v4 = a2;
  id v5 = [v3 alloc];
  [v4 hue];
  double v7 = v6;

  uint64_t v8 = (void *)[v5 initWithHue:v7 tone:*(double *)(a1 + 32)];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F8CCD0]) initWithPrimaryColor:v8 secondaryColor:0];

  return v9;
}

+ (double)highKeyTone
{
  return 0.8;
}

+ (double)neutralTone
{
  return 0.5;
}

+ (double)lowKeyTone
{
  return 0.2;
}

@end