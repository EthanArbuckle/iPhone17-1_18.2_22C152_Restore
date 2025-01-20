@interface PIParallaxGreenScreenBlurStyle
+ (id)styleWithColorAnalysis:(id)a3;
+ (id)styleWithParameters:(id)a3 colorSuggestions:(id)a4;
- (BOOL)configureForCategory:(id)a3;
- (BOOL)hasColorParameter;
- (PFParallaxColor)color;
- (PIParallaxGreenScreenBlurStyle)initWithColor:(id)a3 clockColor:(id)a4 colorSuggestions:(id)a5;
- (id)kind;
- (id)parameters;
- (id)recipeIdentifier;
- (void)setColor:(id)a3;
@end

@implementation PIParallaxGreenScreenBlurStyle

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
    [(PIParallaxGreenScreenBlurStyle *)self setColor:v6];
  }
  return v5 != 0;
}

- (id)recipeIdentifier
{
  return @"GreenScreenBlur";
}

- (id)kind
{
  return (id)*MEMORY[0x1E4F8D008];
}

- (id)parameters
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v3 = [(PIParallaxGreenScreenBlurStyle *)self color];
  v4 = [(PIParallaxGreenScreenBlurStyle *)self color];
  [v4 luma];
  double v6 = v5;

  double v7 = (v6 + -0.2) / 0.6;
  double v8 = fmin(fmax(v7 * -2.0 + 1.0, 0.0), 1.0);
  double v9 = fmin(fmax(v7 * 2.0 + -1.0, 0.0), 1.0);
  v17[0] = *MEMORY[0x1E4F8D040];
  v10 = [(PIParallaxStyle *)self clockColor];
  uint64_t v11 = *MEMORY[0x1E4F8D058];
  v18[0] = v10;
  v18[1] = v3;
  uint64_t v12 = *MEMORY[0x1E4F8D070];
  v17[1] = v11;
  v17[2] = v12;
  v13 = [NSNumber numberWithDouble:v8];
  v18[2] = v13;
  v17[3] = *MEMORY[0x1E4F8D068];
  v14 = [NSNumber numberWithDouble:v9];
  v18[3] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  return v15;
}

- (PIParallaxGreenScreenBlurStyle)initWithColor:(id)a3 clockColor:(id)a4 colorSuggestions:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  double v8 = (PFParallaxColor *)a3;
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
  uint64_t v11 = v10;
  v28.receiver = self;
  v28.super_class = (Class)PIParallaxGreenScreenBlurStyle;
  uint64_t v12 = [(PIParallaxStyle *)&v28 initWithClockColor:v9 colorSuggestions:v10];
  color = v12->_color;
  v12->_color = v8;

  return v12;
}

+ (id)styleWithParameters:(id)a3 colorSuggestions:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F8D070];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 objectForKeyedSubscript:v6];
  [v9 doubleValue];
  double v11 = v10;

  uint64_t v12 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F8D068]];
  [v12 doubleValue];
  double v14 = v13;

  double v15 = -v11;
  if (v14 > 0.0) {
    double v15 = v14;
  }
  double v16 = (v15 + 1.0) * 0.5 * 0.6 + 0.2;
  v17 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F8D058]];
  id v18 = objc_alloc(MEMORY[0x1E4F8CC78]);
  [v17 hue];
  double v20 = v19;
  [v17 chroma];
  v22 = (void *)[v18 initWithLuma:v16 hue:v20 chroma:v21];
  v23 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F8D040]];

  if (v23)
  {
    id v24 = v23;
  }
  else
  {
    id v24 = [MEMORY[0x1E4F8CC78] whiteColor];
  }
  id v25 = v24;

  v26 = (void *)[objc_alloc((Class)a1) initWithColor:v22 clockColor:v25 colorSuggestions:v7];
  return v26;
}

+ (id)styleWithColorAnalysis:(id)a3
{
  v4 = [a3 backgroundColors];
  double v5 = [v4 firstObject];

  id v6 = objc_alloc(MEMORY[0x1E4F8CC78]);
  [v5 hue];
  double v8 = v7;
  [v5 chroma];
  double v10 = (void *)[v6 initWithLuma:0.5 hue:v8 chroma:v9];
  id v11 = objc_alloc((Class)a1);
  uint64_t v12 = [MEMORY[0x1E4F8CC78] whiteColor];
  double v13 = (void *)[v11 initWithColor:v10 clockColor:v12 colorSuggestions:MEMORY[0x1E4F1CBF0]];

  return v13;
}

@end