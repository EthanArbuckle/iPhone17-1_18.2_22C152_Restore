@interface PIParallaxStudioStyle
+ (id)styleWithColorAnalysis:(id)a3;
+ (id)styleWithParameters:(id)a3 colorSuggestions:(id)a4;
- (BOOL)configureForCategory:(id)a3;
- (BOOL)hasTonalityMode;
- (id)kind;
- (id)parameters;
- (id)recipeIdentifier;
- (int64_t)tonality;
- (void)setTonality:(int64_t)a3;
@end

@implementation PIParallaxStudioStyle

- (void)setTonality:(int64_t)a3
{
  self->tonality = a3;
}

- (int64_t)tonality
{
  return self->tonality;
}

- (BOOL)hasTonalityMode
{
  return 1;
}

- (BOOL)configureForCategory:(id)a3
{
  return [a3 isEqualToString:*MEMORY[0x1E4F8D0D0]];
}

- (id)recipeIdentifier
{
  if ([(PIParallaxStudioStyle *)self tonality] == 3) {
    v2 = @"StudioBright";
  }
  else {
    v2 = @"StudioDark";
  }
  return v2;
}

- (id)kind
{
  return (id)*MEMORY[0x1E4F8D028];
}

- (id)parameters
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = *MEMORY[0x1E4F8D040];
  v3 = [(PIParallaxStyle *)self clockColor];
  v8[0] = v3;
  v7[1] = *MEMORY[0x1E4F8D078];
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[PIParallaxStudioStyle tonality](self, "tonality"));
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)styleWithParameters:(id)a3 colorSuggestions:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v19 = NUAssertLogger_3803();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "parameters != nil");
      *(_DWORD *)buf = 138543362;
      v33 = v20;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v21 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v23 = NUAssertLogger_3803();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific(*v21);
        v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        v30 = [v28 callStackSymbols];
        v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v33 = v27;
        __int16 v34 = 2114;
        v35 = v31;
        _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v33 = v26;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
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

  uint64_t v13 = *MEMORY[0x1E4F8D078];
  v14 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8D078]];

  if (v14)
  {
    v15 = [v6 objectForKeyedSubscript:v13];
    uint64_t v16 = [v15 integerValue];
  }
  else
  {
    uint64_t v16 = 3;
  }
  v17 = (void *)[objc_alloc((Class)a1) initWithClockColor:v12 colorSuggestions:v8];
  [v17 setTonality:v16];

  return v17;
}

+ (id)styleWithColorAnalysis:(id)a3
{
  [a3 backgroundLuminance];
  if (v4 < 0.35)
  {
    v5 = [MEMORY[0x1E4F8CC78] whiteColor];
    uint64_t v6 = 1;
  }
  else
  {
    v5 = [MEMORY[0x1E4F8CC78] blackColor];
    uint64_t v6 = 3;
  }
  id v7 = objc_alloc((Class)a1);
  v8 = (void *)[v7 initWithClockColor:v5 colorSuggestions:MEMORY[0x1E4F1CBF0]];
  [v8 setTonality:v6];

  return v8;
}

@end