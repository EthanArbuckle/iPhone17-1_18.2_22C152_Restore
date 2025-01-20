@interface PIParallaxColorWashDuotoneStyle
+ (id)styleWithColorAnalysis:(id)a3;
+ (id)styleWithParameters:(id)a3 colorSuggestions:(id)a4;
- (BOOL)configureForCategory:(id)a3;
- (BOOL)hasBackgroundParameter;
- (BOOL)hasColorParameter;
- (BOOL)showsBackground;
- (PFParallaxColor)primaryColor;
- (PFParallaxColor)secondaryColor;
- (PIParallaxColorWashDuotoneStyle)initWithPrimaryColor:(id)a3 secondaryColor:(id)a4 background:(BOOL)a5 clockColor:(id)a6 colorSuggestions:(id)a7;
- (id)kind;
- (id)parameters;
- (id)recipeIdentifier;
- (void)setPrimaryColor:(id)a3;
- (void)setSecondaryColor:(id)a3;
- (void)setShowsBackground:(BOOL)a3;
@end

@implementation PIParallaxColorWashDuotoneStyle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
}

- (void)setSecondaryColor:(id)a3
{
}

- (PFParallaxColor)secondaryColor
{
  return self->_secondaryColor;
}

- (void)setPrimaryColor:(id)a3
{
}

- (PFParallaxColor)primaryColor
{
  return self->_primaryColor;
}

- (void)setShowsBackground:(BOOL)a3
{
  self->_showsBackground = a3;
}

- (BOOL)showsBackground
{
  return self->_showsBackground;
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
    [(PIParallaxColorWashDuotoneStyle *)self setPrimaryColor:v6];

    v7 = [v5 secondaryColor];
    [(PIParallaxColorWashDuotoneStyle *)self setSecondaryColor:v7];
  }
  return v5 != 0;
}

- (id)recipeIdentifier
{
  return (id)*MEMORY[0x1E4F8CFF0];
}

- (id)kind
{
  return (id)*MEMORY[0x1E4F8CFF0];
}

- (id)parameters
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v10[0] = *MEMORY[0x1E4F8D080];
  v3 = [(PIParallaxColorWashDuotoneStyle *)self primaryColor];
  v11[0] = v3;
  v10[1] = *MEMORY[0x1E4F8D088];
  v4 = [(PIParallaxColorWashDuotoneStyle *)self secondaryColor];
  v11[1] = v4;
  v10[2] = *MEMORY[0x1E4F8D040];
  v5 = [(PIParallaxStyle *)self clockColor];
  v11[2] = v5;
  v10[3] = *MEMORY[0x1E4F8D038];
  BOOL v6 = [(PIParallaxColorWashDuotoneStyle *)self showsBackground];
  v7 = &unk_1F000A1D8;
  if (v6) {
    v7 = &unk_1F000A1C8;
  }
  v11[3] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];

  return v8;
}

- (PIParallaxColorWashDuotoneStyle)initWithPrimaryColor:(id)a3 secondaryColor:(id)a4 background:(BOOL)a5 clockColor:(id)a6 colorSuggestions:(id)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v12 = (PFParallaxColor *)a3;
  v13 = (PFParallaxColor *)a4;
  id v14 = a6;
  id v15 = a7;
  if (!v12)
  {
    v22 = NUAssertLogger_3803();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "primaryColor != nil");
      v23 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v23;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v24 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v26 = NUAssertLogger_3803();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v35 = dispatch_get_specific(*v24);
        v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        v24 = [v36 callStackSymbols];
        v38 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v46 = (const void **)v35;
        __int16 v47 = 2114;
        v48 = v38;
        _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v46 = v24;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v32 = _NUAssertFailHandler();
    goto LABEL_17;
  }
  if (!v13)
  {
    v29 = NUAssertLogger_3803();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "secondaryColor != nil");
      v30 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v30;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v24 = (const void **)MEMORY[0x1E4F7A308];
    v31 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v26 = NUAssertLogger_3803();
    int v32 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (!v31)
    {
      if (v32)
      {
        v33 = [MEMORY[0x1E4F29060] callStackSymbols];
        v34 = [v33 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v46 = v34;
        _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_19;
    }
LABEL_17:
    if (v32)
    {
      v39 = dispatch_get_specific(*v24);
      v40 = (void *)MEMORY[0x1E4F29060];
      id v41 = v39;
      v42 = [v40 callStackSymbols];
      v43 = [v42 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v46 = (const void **)v39;
      __int16 v47 = 2114;
      v48 = v43;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_19:

    _NUAssertFailHandler();
  }
  v16 = v15;
  v44.receiver = self;
  v44.super_class = (Class)PIParallaxColorWashDuotoneStyle;
  v17 = [(PIParallaxStyle *)&v44 initWithClockColor:v14 colorSuggestions:v15];
  primaryColor = v17->_primaryColor;
  v17->_primaryColor = v12;
  v19 = v12;

  secondaryColor = v17->_secondaryColor;
  v17->_secondaryColor = v13;

  v17->_showsBackground = a5;
  return v17;
}

+ (id)styleWithParameters:(id)a3 colorSuggestions:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v18 = NUAssertLogger_3803();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "parameters != nil");
      *(_DWORD *)buf = 138543362;
      int v32 = v19;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v20 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v22 = NUAssertLogger_3803();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific(*v20);
        BOOL v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        v29 = [v27 callStackSymbols];
        v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        int v32 = v26;
        __int16 v33 = 2114;
        v34 = v30;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      int v32 = v25;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v8 = v7;
  v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8D040]];
  v10 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8D080]];
  v11 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8D088]];
  v12 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8D038]];
  v13 = v12;
  if (v12)
  {
    [v12 doubleValue];
    BOOL v15 = v14 < 1.0;
  }
  else
  {
    BOOL v15 = 1;
  }
  v16 = (void *)[objc_alloc((Class)a1) initWithPrimaryColor:v10 secondaryColor:v11 background:v15 clockColor:v9 colorSuggestions:v8];

  return v16;
}

+ (id)styleWithColorAnalysis:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[PIParallaxColorSuggester alloc] initWithColorAnalysis:v4];
  id v6 = [v4 backgroundColors];
  id v7 = PFMap();

  v8 = +[PIParallaxColorPalette colorWashDuotonePalette];
  v9 = [(PIParallaxColorSuggester *)v5 suggestedColorsForColors:v7 fromColorPalette:v8];
  id v10 = v8;
  v11 = PFMap();
  v12 = [v11 firstObject];
  v13 = [v12 primaryColor];
  uint64_t v14 = [v12 secondaryColor];
  if (!v14)
  {
    v21 = NUAssertLogger_3803();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = [NSString stringWithFormat:@"Failed to retrieve secondary color from palette"];
      *(_DWORD *)buf = 138543362;
      v36 = v22;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v23 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v25 = NUAssertLogger_3803();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v29 = dispatch_get_specific(*v23);
        v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        int v32 = [v30 callStackSymbols];
        __int16 v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v36 = v29;
        __int16 v37 = 2114;
        v38 = v33;
        _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      BOOL v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v36 = v28;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  BOOL v15 = (void *)v14;
  id v16 = objc_alloc((Class)a1);
  [MEMORY[0x1E4F8CC78] whiteColor];
  v34 = v4;
  v18 = v17 = v5;
  v19 = (void *)[v16 initWithPrimaryColor:v13 secondaryColor:v15 background:1 clockColor:v18 colorSuggestions:v11];

  return v19;
}

uint64_t __58__PIParallaxColorWashDuotoneStyle_styleWithColorAnalysis___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) suggestionForColor:a2];
}

id __58__PIParallaxColorWashDuotoneStyle_styleWithColorAnalysis___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F8CC78];
  id v3 = a2;
  id v4 = [v2 alloc];
  [v3 luma];
  double v6 = v5;
  [v3 hue];
  double v8 = v7 + 30.0;
  [v3 chroma];
  double v10 = v9;

  v11 = (void *)[v4 initWithLuma:v6 hue:v8 chroma:v10];
  return v11;
}

@end