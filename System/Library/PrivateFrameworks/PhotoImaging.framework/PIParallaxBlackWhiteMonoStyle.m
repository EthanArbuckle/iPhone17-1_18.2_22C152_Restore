@interface PIParallaxBlackWhiteMonoStyle
+ (id)styleWithColorAnalysis:(id)a3;
+ (id)styleWithParameters:(id)a3 colorSuggestions:(id)a4;
- (BOOL)configureForCategory:(id)a3;
- (BOOL)hasHeadroomLook;
- (id)defaultDominantColorWithAnalysis:(id)a3;
- (id)kind;
- (id)parameters;
- (id)recipeIdentifier;
- (int64_t)headroomLook;
- (void)setHeadroomLook:(int64_t)a3;
@end

@implementation PIParallaxBlackWhiteMonoStyle

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

- (id)defaultDominantColorWithAnalysis:(id)a3
{
  [a3 luminance];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F8CC78]) initWithRed:v3 green:v3 blue:v3];
  return v4;
}

- (BOOL)configureForCategory:(id)a3
{
  return [a3 isEqualToString:*MEMORY[0x1E4F8D0C0]];
}

- (id)recipeIdentifier
{
  return @"BlackWhiteMono";
}

- (id)kind
{
  return (id)*MEMORY[0x1E4F8CFD0];
}

- (id)parameters
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = *MEMORY[0x1E4F8D040];
  double v3 = [(PIParallaxStyle *)self clockColor];
  v8[0] = v3;
  v7[1] = *MEMORY[0x1E4F8D060];
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[PIParallaxBlackWhiteMonoStyle headroomLook](self, "headroomLook"));
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)styleWithParameters:(id)a3 colorSuggestions:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v20 = NUAssertLogger_3803();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "parameters != nil");
      *(_DWORD *)buf = 138543362;
      v34 = v21;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v22 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v24 = NUAssertLogger_3803();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v28 = dispatch_get_specific(*v22);
        v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        v31 = [v29 callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v34 = v28;
        __int16 v35 = 2114;
        v36 = v32;
        _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v34 = v27;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
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

  id v13 = objc_alloc((Class)a1);
  v14 = (void *)[v13 initWithClockColor:v12 colorSuggestions:MEMORY[0x1E4F1CBF0]];
  uint64_t v15 = *MEMORY[0x1E4F8D060];
  v16 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8D060]];

  if (v16)
  {
    v17 = [v6 objectForKeyedSubscript:v15];
    uint64_t v18 = [v17 integerValue];
  }
  else
  {
    uint64_t v18 = 1;
  }
  [v14 setHeadroomLook:v18];

  return v14;
}

+ (id)styleWithColorAnalysis:(id)a3
{
  [a3 backgroundLuminance];
  if (v4 < 0.35) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  id v6 = objc_alloc((Class)a1);
  id v7 = [MEMORY[0x1E4F8CC78] whiteColor];
  v8 = (void *)[v6 initWithClockColor:v7 colorSuggestions:MEMORY[0x1E4F1CBF0]];

  [v8 setHeadroomLook:v5];
  return v8;
}

@end