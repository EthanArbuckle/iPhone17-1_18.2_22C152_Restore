@interface PIParallaxOriginalStyle
+ (id)styleWithColorAnalysis:(id)a3;
+ (id)styleWithParameters:(id)a3 colorSuggestions:(id)a4;
- (BOOL)configureForCategory:(id)a3;
- (BOOL)hasHeadroomLook;
- (PIParallaxOriginalStyle)initWithColorAnalysis:(id)a3;
- (id)kind;
- (id)parameters;
- (id)recipeIdentifier;
- (int64_t)headroomLook;
- (void)setHeadroomLook:(int64_t)a3;
@end

@implementation PIParallaxOriginalStyle

- (void)setHeadroomLook:(int64_t)a3
{
  self->headroomLook = a3;
}

- (int64_t)headroomLook
{
  return self->headroomLook;
}

- (BOOL)hasHeadroomLook
{
  return 1;
}

- (BOOL)configureForCategory:(id)a3
{
  return [a3 isEqualToString:*MEMORY[0x1E4F8D0D0]];
}

- (id)recipeIdentifier
{
  return @"Original";
}

- (id)kind
{
  return (id)*MEMORY[0x1E4F8D020];
}

- (id)parameters
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9[0] = *MEMORY[0x1E4F8D040];
  v3 = [(PIParallaxStyle *)self clockColor];
  v10[0] = v3;
  v9[1] = *MEMORY[0x1E4F8D050];
  v4 = NSNumber;
  [(PIParallaxStyle *)self clockVibrancy];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  v10[1] = v5;
  v9[2] = *MEMORY[0x1E4F8D060];
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[PIParallaxOriginalStyle headroomLook](self, "headroomLook"));
  v10[2] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

- (PIParallaxOriginalStyle)initWithColorAnalysis:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() styleWithColorAnalysis:v4];

  return v5;
}

+ (id)styleWithParameters:(id)a3 colorSuggestions:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v26 = NUAssertLogger_3803();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "parameters != nil");
      *(_DWORD *)buf = 138543362;
      v40 = v27;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v28 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v30 = NUAssertLogger_3803();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        v34 = dispatch_get_specific(*v28);
        v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        v37 = [v35 callStackSymbols];
        v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v40 = v34;
        __int16 v41 = 2114;
        v42 = v38;
        _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v31)
    {
      v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v40 = v33;
      _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v8 = v7;
  v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8D040]];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F8CC78] whiteColor];
  }
  v12 = v11;

  uint64_t v13 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8D050]];
  v14 = (void *)v13;
  v15 = &unk_1F000A1B8;
  if (v13) {
    v15 = (void *)v13;
  }
  id v16 = v15;

  id v17 = objc_alloc((Class)a1);
  [v16 doubleValue];
  double v19 = v18;

  v20 = (void *)[v17 initWithClockColor:v12 vibrancy:v8 colorSuggestions:v19];
  uint64_t v21 = *MEMORY[0x1E4F8D060];
  v22 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8D060]];

  if (v22)
  {
    v23 = [v6 objectForKeyedSubscript:v21];
    uint64_t v24 = [v23 integerValue];
  }
  else
  {
    uint64_t v24 = 1;
  }
  [v20 setHeadroomLook:v24];

  return v20;
}

+ (id)styleWithColorAnalysis:(id)a3
{
  id v4 = a3;
  [v4 backgroundLuminance];
  if (v5 < 0.35) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  id v7 = objc_alloc((Class)a1);
  v8 = [MEMORY[0x1E4F8CC78] whiteColor];
  v9 = (void *)[v7 initWithClockColor:v8 colorSuggestions:MEMORY[0x1E4F1CBF0]];

  [v9 setHeadroomLook:v6];
  if (PFPosterEnableSmartTextColor())
  {
    v10 = [v4 foregroundColors];
    id v11 = PFFilter();

    if ([v11 count])
    {
      v12 = [v4 clockAreaColors];
      uint64_t v13 = [v12 firstObject];

      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __50__PIParallaxOriginalStyle_styleWithColorAnalysis___block_invoke_2;
      v24[3] = &unk_1E5D7F018;
      id v14 = v13;
      id v25 = v14;
      v15 = [v11 sortedArrayUsingComparator:v24];

      id v16 = [v15 firstObject];
      id v17 = v16;
      if (v14)
      {
        [v16 deltaE94DistanceToColor:v14];
        double v19 = 0.0;
        if (v18 >= 2.0)
        {
          if (v18 >= 4.0)
          {
            if (v18 >= 30.0)
            {
              [v17 luma];
              if (v23 >= 0.5) {
                double v19 = 0.85;
              }
              else {
                double v19 = 1.0;
              }
            }
            else
            {
              double v19 = 0.6;
            }
          }
          else
          {
            double v19 = 0.1;
          }
        }
      }
      else
      {
        double v19 = 0.8;
      }
      id v21 = objc_alloc((Class)a1);
      id v20 = (id)[v21 initWithClockColor:v17 vibrancy:MEMORY[0x1E4F1CBF0] colorSuggestions:v19];
      [v20 setHeadroomLook:v6];

      id v11 = v15;
    }
    else
    {
      id v20 = v9;
    }
  }
  else
  {
    id v20 = v9;
  }

  return v20;
}

uint64_t __50__PIParallaxOriginalStyle_styleWithColorAnalysis___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  [a2 deltaE94DistanceToColor:v5];
  double v8 = v7;
  [v6 deltaE94DistanceToColor:*(void *)(a1 + 32)];
  double v10 = v9;

  if (v8 > v10) {
    return -1;
  }
  else {
    return v8 < v10;
  }
}

BOOL __50__PIParallaxOriginalStyle_styleWithColorAnalysis___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 hue];
  if (v3 >= 30.0)
  {
    [v2 hue];
    BOOL v4 = v5 > 100.0;
  }
  else
  {
    BOOL v4 = 1;
  }
  [v2 chroma];
  double v7 = v6;
  [v2 luma];
  BOOL v9 = v7 > 0.3 && v4;
  BOOL v10 = v8 > 0.25 && v9;

  return v10;
}

@end