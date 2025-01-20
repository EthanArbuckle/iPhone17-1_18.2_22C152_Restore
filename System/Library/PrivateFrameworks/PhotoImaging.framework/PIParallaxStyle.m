@interface PIParallaxStyle
+ (PIParallaxStyle)styleWithBakedStyle:(id)a3;
+ (PIParallaxStyle)styleWithColorAnalysis:(id)a3;
+ (PIParallaxStyle)styleWithParameters:(id)a3 colorSuggestions:(id)a4;
+ (id)_filterForRecipeIdentifier:(id)a3;
+ (id)colorPaletteWithStyleKind:(id)a3;
+ (id)defaultOriginalStyle;
+ (id)defaultStyleForKind:(id)a3 colorAnalysis:(id)a4;
- (BOOL)configureForCategory:(id)a3;
- (BOOL)hasBackgroundParameter;
- (BOOL)hasColorParameter;
- (BOOL)hasHeadroomLook;
- (BOOL)hasTonalityMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSegmented;
- (NSArray)colorSuggestions;
- (NSDictionary)parameters;
- (NSString)clockFont;
- (NSString)inactiveRecipeIdentifier;
- (NSString)kind;
- (NSString)recipeIdentifier;
- (PFParallaxColor)clockColor;
- (PIParallaxStyle)init;
- (PIParallaxStyle)initWithClockColor:(id)a3 colorSuggestions:(id)a4;
- (PIParallaxStyle)initWithClockColor:(id)a3 vibrancy:(double)a4 colorSuggestions:(id)a5;
- (PIParallaxStyleRecipe)recipe;
- (double)clockVibrancy;
- (id)bakedStyle;
- (id)colorSuggestionForCategory:(id)a3;
- (id)defaultDominantColorWithAnalysis:(id)a3;
- (id)description;
- (id)filter;
- (id)inactiveFilter;
- (unint64_t)hash;
- (void)setClockColor:(id)a3;
- (void)setColorSuggestions:(id)a3;
@end

@implementation PIParallaxStyle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockColor, 0);
  objc_storeStrong((id *)&self->_colorSuggestions, 0);
}

- (void)setColorSuggestions:(id)a3
{
}

- (NSArray)colorSuggestions
{
  return self->_colorSuggestions;
}

- (double)clockVibrancy
{
  return self->_clockVibrancy;
}

- (void)setClockColor:(id)a3
{
}

- (PFParallaxColor)clockColor
{
  return self->_clockColor;
}

- (id)defaultDominantColorWithAnalysis:(id)a3
{
  v3 = [a3 colors];
  v4 = [v3 firstObject];

  return v4;
}

- (BOOL)configureForCategory:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    v5 = (os_log_t *)MEMORY[0x1E4F7A748];
    v6 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      v7 = NSString;
      v8 = v6;
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      v11 = [v7 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v10];
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v12 = *v4;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v12 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_355_3743);
        }
LABEL_7:
        os_log_t v13 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)MEMORY[0x1E4F29060];
          v15 = v13;
          v16 = [v14 callStackSymbols];
          v17 = [v16 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v25 = v17;
          _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_355_3743);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v20 = (void *)MEMORY[0x1E4F29060];
      id v21 = specific;
      v15 = v18;
      v22 = [v20 callStackSymbols];
      v4 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v25 = specific;
      __int16 v26 = 2114;
      v27 = v4;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_355_3743);
  }
}

- (id)colorSuggestionForCategory:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x1E4F8D0D8]]
    || [v4 isEqualToString:*MEMORY[0x1E4F8D0C8]])
  {
    v5 = [(PIParallaxStyle *)self colorSuggestions];
    v6 = PFFind();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __46__PIParallaxStyle_colorSuggestionForCategory___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 primaryColor];
  uint64_t v3 = [v2 isCool];

  return v3;
}

uint64_t __46__PIParallaxStyle_colorSuggestionForCategory___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 primaryColor];
  uint64_t v3 = [v2 isWarm];

  return v3;
}

- (PIParallaxStyleRecipe)recipe
{
  v2 = [(PIParallaxStyle *)self recipeIdentifier];
  uint64_t v3 = +[PIParallaxStyleRecipeRegistry recipeForIdentifier:v2];

  if (!v3) {
    uint64_t v3 = objc_alloc_init(PIParallaxStyleRecipe);
  }
  return v3;
}

- (id)inactiveFilter
{
  uint64_t v3 = [(PIParallaxStyle *)self inactiveRecipeIdentifier];
  id v4 = +[PIParallaxStyle _filterForRecipeIdentifier:v3];

  v5 = [(PIParallaxStyle *)self parameters];
  [v4 setParameters:v5];

  return v4;
}

- (id)filter
{
  uint64_t v3 = [(PIParallaxStyle *)self recipeIdentifier];
  id v4 = +[PIParallaxStyle _filterForRecipeIdentifier:v3];

  v5 = [(PIParallaxStyle *)self parameters];
  [v4 setParameters:v5];

  return v4;
}

- (BOOL)hasHeadroomLook
{
  return 0;
}

- (BOOL)hasBackgroundParameter
{
  return 0;
}

- (BOOL)hasColorParameter
{
  return 0;
}

- (BOOL)hasTonalityMode
{
  return 0;
}

- (BOOL)isSegmented
{
  v2 = (void *)MEMORY[0x1E4F8CCA8];
  uint64_t v3 = [(PIParallaxStyle *)self kind];
  LOBYTE(v2) = [v2 isSegmentedStyle:v3];

  return (char)v2;
}

- (NSString)clockFont
{
  v2 = [(PIParallaxStyle *)self kind];
  uint64_t v3 = PIParallaxStyleClockFontForKind(v2);

  return (NSString *)v3;
}

- (NSString)inactiveRecipeIdentifier
{
  v2 = [(PIParallaxStyle *)self recipeIdentifier];
  uint64_t v3 = [v2 stringByAppendingString:@"-Inactive"];

  return (NSString *)v3;
}

- (NSString)recipeIdentifier
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    uint64_t v3 = (os_log_t *)MEMORY[0x1E4F7A748];
    id v4 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      v5 = NSString;
      v6 = v4;
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      v9 = [v5 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v8];
      *(_DWORD *)buf = 138543362;
      v23 = v9;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v10 = *v2;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v10 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_355_3743);
        }
LABEL_7:
        os_log_t v11 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
        {
          uint64_t v12 = (void *)MEMORY[0x1E4F29060];
          os_log_t v13 = v11;
          v14 = [v12 callStackSymbols];
          v15 = [v14 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v23 = v15;
          _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v10 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_355_3743);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v16 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      os_log_t v18 = (void *)MEMORY[0x1E4F29060];
      id v19 = specific;
      os_log_t v13 = v16;
      v20 = [v18 callStackSymbols];
      v2 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v23 = specific;
      __int16 v24 = 2114;
      v25 = v2;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    id v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_355_3743);
  }
}

- (NSString)kind
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    uint64_t v3 = (os_log_t *)MEMORY[0x1E4F7A748];
    id v4 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      v5 = NSString;
      v6 = v4;
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      v9 = [v5 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v8];
      *(_DWORD *)buf = 138543362;
      v23 = v9;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v10 = *v2;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v10 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_355_3743);
        }
LABEL_7:
        os_log_t v11 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
        {
          uint64_t v12 = (void *)MEMORY[0x1E4F29060];
          os_log_t v13 = v11;
          v14 = [v12 callStackSymbols];
          v15 = [v14 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v23 = v15;
          _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v10 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_355_3743);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v16 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      os_log_t v18 = (void *)MEMORY[0x1E4F29060];
      id v19 = specific;
      os_log_t v13 = v16;
      v20 = [v18 callStackSymbols];
      v2 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v23 = specific;
      __int16 v24 = 2114;
      v25 = v2;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    id v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_355_3743);
  }
}

- (NSDictionary)parameters
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    uint64_t v3 = (os_log_t *)MEMORY[0x1E4F7A748];
    id v4 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      v5 = NSString;
      v6 = v4;
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      v9 = [v5 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v8];
      *(_DWORD *)buf = 138543362;
      v23 = v9;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v10 = *v2;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v10 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_355_3743);
        }
LABEL_7:
        os_log_t v11 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
        {
          uint64_t v12 = (void *)MEMORY[0x1E4F29060];
          os_log_t v13 = v11;
          v14 = [v12 callStackSymbols];
          v15 = [v14 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v23 = v15;
          _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v10 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_355_3743);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v16 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      os_log_t v18 = (void *)MEMORY[0x1E4F29060];
      id v19 = specific;
      os_log_t v13 = v16;
      v20 = [v18 callStackSymbols];
      v2 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v23 = specific;
      __int16 v24 = 2114;
      v25 = v2;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    id v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_355_3743);
  }
}

- (id)bakedStyle
{
  id v3 = objc_alloc(MEMORY[0x1E4F8CCA8]);
  id v4 = [(PIParallaxStyle *)self kind];
  v5 = [(PIParallaxStyle *)self parameters];
  v6 = [(PIParallaxStyle *)self colorSuggestions];
  v7 = (void *)[v3 initWithKind:v4 parameters:v5 colorSuggestions:v6];

  return v7;
}

- (unint64_t)hash
{
  v2 = [(PIParallaxStyle *)self kind];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PIParallaxStyle *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(PIParallaxStyle *)self kind];
      v7 = [(PIParallaxStyle *)v5 kind];
      int v8 = [v6 isEqualToString:v7];

      if (v8)
      {
        v9 = [(PIParallaxStyle *)self bakedStyle];
        uint64_t v10 = [(PIParallaxStyle *)v5 bakedStyle];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PIParallaxStyle *)self parameters];
  v6 = [v3 stringWithFormat:@"<%@: %p parameters = %@>", v4, self, v5];;

  return v6;
}

- (PIParallaxStyle)initWithClockColor:(id)a3 vibrancy:(double)a4 colorSuggestions:(id)a5
{
  result = [(PIParallaxStyle *)self initWithClockColor:a3 colorSuggestions:a5];
  result->_clockVibrancy = a4;
  return result;
}

- (PIParallaxStyle)initWithClockColor:(id)a3 colorSuggestions:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v6 = (PFParallaxColor *)a3;
  id v7 = a4;
  if (!v6)
  {
    v15 = NUAssertLogger_3803();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "clockColor != nil");
      os_log_t v16 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v16;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v17 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v19 = NUAssertLogger_3803();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        uint64_t v28 = dispatch_get_specific(*v17);
        v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        v17 = [v29 callStackSymbols];
        v31 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v39 = (const void **)v28;
        __int16 v40 = 2114;
        v41 = v31;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      id v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v39 = v17;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v25 = _NUAssertFailHandler();
    goto LABEL_17;
  }
  int v8 = v7;
  if (!v7)
  {
    v22 = NUAssertLogger_3803();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "suggestions != nil");
      v23 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v23;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v17 = (const void **)MEMORY[0x1E4F7A308];
    __int16 v24 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v19 = NUAssertLogger_3803();
    int v25 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!v24)
    {
      if (v25)
      {
        uint64_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
        v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v39 = v27;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_19;
    }
LABEL_17:
    if (v25)
    {
      v32 = dispatch_get_specific(*v17);
      v33 = (void *)MEMORY[0x1E4F29060];
      id v34 = v32;
      v35 = [v33 callStackSymbols];
      v36 = [v35 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v39 = (const void **)v32;
      __int16 v40 = 2114;
      v41 = v36;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_19:

    _NUAssertFailHandler();
  }
  v37.receiver = self;
  v37.super_class = (Class)PIParallaxStyle;
  v9 = [(PIParallaxStyle *)&v37 init];
  clockColor = v9->_clockColor;
  v9->_clockColor = v6;
  char v11 = v6;

  uint64_t v12 = [v8 copy];
  colorSuggestions = v9->_colorSuggestions;
  v9->_colorSuggestions = (NSArray *)v12;

  v9->_clockVibrancy = 0.0;
  return v9;
}

- (PIParallaxStyle)init
{
  unint64_t v3 = [MEMORY[0x1E4F8CC78] whiteColor];
  uint64_t v4 = [(PIParallaxStyle *)self initWithClockColor:v3 colorSuggestions:MEMORY[0x1E4F1CBF0]];

  return v4;
}

+ (id)defaultOriginalStyle
{
  id v2 = objc_alloc((Class)a1);
  unint64_t v3 = [MEMORY[0x1E4F8CC78] whiteColor];
  uint64_t v4 = (void *)[v2 initWithClockColor:v3 colorSuggestions:MEMORY[0x1E4F1CBF0]];

  return v4;
}

+ (id)colorPaletteWithStyleKind:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F8CFE8]]) {
    goto LABEL_2;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F8CFF8]])
  {
    uint64_t v4 = +[PIParallaxColorPalette colorWashSinglePalette];
    goto LABEL_9;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F8CFF0]])
  {
    uint64_t v4 = +[PIParallaxColorPalette colorWashDuotonePalette];
    goto LABEL_9;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F8D000]])
  {
    uint64_t v4 = +[PIParallaxColorPalette greenScreenMutedPalette];
    goto LABEL_9;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F8D018]]
    || [v3 isEqualToString:*MEMORY[0x1E4F8D010]])
  {
LABEL_2:
    uint64_t v4 = +[PIParallaxColorPalette greenScreenVibrantPalette];
LABEL_9:
    v5 = (void *)v4;
    goto LABEL_10;
  }
  v5 = 0;
LABEL_10:

  return v5;
}

+ (PIParallaxStyle)styleWithBakedStyle:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 kind];
  v5 = [v3 parameters];
  v6 = [v3 colorSuggestions];
  if ([v4 isEqualToString:*MEMORY[0x1E4F8D020]])
  {
    id v7 = off_1E5D7DE08;
LABEL_12:
    int v8 = [(__objc2_class *)*v7 styleWithParameters:v5 colorSuggestions:v6];

    return (PIParallaxStyle *)v8;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F8D028]])
  {
LABEL_4:
    id v7 = off_1E5D7DE28;
    goto LABEL_12;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F8CFD8]]) {
    goto LABEL_6;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F8CFD0]])
  {
    id v7 = off_1E5D7DD60;
    goto LABEL_12;
  }
  if (([v4 isEqualToString:*MEMORY[0x1E4F8CFE8]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x1E4F8CFE0]] & 1) != 0)
  {
    id v7 = off_1E5D7DD90;
    goto LABEL_12;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F8CFF8]])
  {
    id v7 = off_1E5D7DDB0;
    goto LABEL_12;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F8CFF0]])
  {
    id v7 = off_1E5D7DDA8;
    goto LABEL_12;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F8D000]])
  {
    id v7 = off_1E5D7DDD8;
    goto LABEL_12;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F8D018]])
  {
    id v7 = off_1E5D7DDD0;
    goto LABEL_12;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F8D008]])
  {
    id v7 = off_1E5D7DDC0;
    goto LABEL_12;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F8D010]])
  {
    id v7 = off_1E5D7DDC8;
    goto LABEL_12;
  }
  if (([v4 isEqualToString:@"StudioBright"] & 1) != 0
    || ([v4 isEqualToString:@"StudioDark"] & 1) != 0)
  {
    goto LABEL_4;
  }
  if (([v4 isEqualToString:@"BlackWhiteHighKey"] & 1) != 0
    || ([v4 isEqualToString:@"BlackWhiteStage"] & 1) != 0)
  {
LABEL_6:
    id v7 = off_1E5D7DD68;
    goto LABEL_12;
  }
  uint64_t v10 = NUAssertLogger_3803();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    char v11 = [NSString stringWithFormat:@"Unknown style kind: %@", v4];
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v11;
    _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  uint64_t v12 = (const void **)MEMORY[0x1E4F7A308];
  specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
  v14 = NUAssertLogger_3803();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
  if (specific)
  {
    if (v15)
    {
      os_log_t v18 = dispatch_get_specific(*v12);
      id v19 = (void *)MEMORY[0x1E4F29060];
      id v20 = v18;
      id v21 = [v19 callStackSymbols];
      v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v18;
      __int16 v27 = 2114;
      uint64_t v28 = v22;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else if (v15)
  {
    os_log_t v16 = [MEMORY[0x1E4F29060] callStackSymbols];
    v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v17;
    _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
  }
  v23 = (PIParallaxGreenScreenGraphicStyle *)_NUAssertFailHandler();
  [(PIParallaxGreenScreenGraphicStyle *)v23 .cxx_destruct];
  return result;
}

+ (PIParallaxStyle)styleWithParameters:(id)a3 colorSuggestions:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    int v8 = (os_log_t *)MEMORY[0x1E4F7A748];
    v9 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = NSString;
      char v11 = v9;
      uint64_t v12 = (objc_class *)objc_opt_class();
      os_log_t v13 = NSStringFromClass(v12);
      v14 = [v10 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v13];
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v14;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v15 = *v7;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v15 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_355_3743);
        }
LABEL_7:
        os_log_t v16 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
        {
          v17 = (void *)MEMORY[0x1E4F29060];
          os_log_t v18 = v16;
          id v19 = [v17 callStackSymbols];
          id v20 = [v19 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          uint64_t v28 = v20;
          _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v15 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_355_3743);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v21 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v23 = (void *)MEMORY[0x1E4F29060];
      id v24 = specific;
      os_log_t v18 = v21;
      int v25 = [v23 callStackSymbols];
      id v7 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = specific;
      __int16 v29 = 2114;
      id v30 = v7;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    uint64_t v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_355_3743);
  }
}

+ (id)defaultStyleForKind:(id)a3 colorAnalysis:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:*MEMORY[0x1E4F8D020]])
  {
    id v7 = off_1E5D7DE08;
LABEL_12:
    int v8 = [(__objc2_class *)*v7 styleWithColorAnalysis:v6];

    return v8;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F8D028]])
  {
    id v7 = off_1E5D7DE28;
    goto LABEL_12;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F8CFD8]])
  {
    id v7 = off_1E5D7DD68;
    goto LABEL_12;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F8CFD0]])
  {
    id v7 = off_1E5D7DD60;
    goto LABEL_12;
  }
  if (([v5 isEqualToString:*MEMORY[0x1E4F8CFE8]] & 1) != 0
    || ([v5 isEqualToString:*MEMORY[0x1E4F8CFE0]] & 1) != 0)
  {
    id v7 = off_1E5D7DD90;
    goto LABEL_12;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F8CFF8]])
  {
    id v7 = off_1E5D7DDB0;
    goto LABEL_12;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F8CFF0]])
  {
    id v7 = off_1E5D7DDA8;
    goto LABEL_12;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F8D000]])
  {
    id v7 = off_1E5D7DDD8;
    goto LABEL_12;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F8D018]])
  {
    id v7 = off_1E5D7DDD0;
    goto LABEL_12;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F8D008]])
  {
    id v7 = off_1E5D7DDC0;
    goto LABEL_12;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F8D010]])
  {
    id v7 = off_1E5D7DDC8;
    goto LABEL_12;
  }
  uint64_t v10 = NUAssertLogger_3803();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    char v11 = [NSString stringWithFormat:@"Unknown style kind: %@", v5];
    *(_DWORD *)buf = 138543362;
    __int16 v27 = v11;
    _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  uint64_t v12 = (const void **)MEMORY[0x1E4F7A308];
  specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
  v14 = NUAssertLogger_3803();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
  if (specific)
  {
    if (v15)
    {
      os_log_t v18 = dispatch_get_specific(*v12);
      id v19 = (void *)MEMORY[0x1E4F29060];
      id v20 = v18;
      os_log_t v21 = [v19 callStackSymbols];
      v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      __int16 v27 = v18;
      __int16 v28 = 2114;
      __int16 v29 = v22;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else if (v15)
  {
    os_log_t v16 = [MEMORY[0x1E4F29060] callStackSymbols];
    v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    __int16 v27 = v17;
    _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
  }
  v23 = (void *)_NUAssertFailHandler();
  return +[PIParallaxStyle _filterForRecipeIdentifier:v25];
}

+ (id)_filterForRecipeIdentifier:(id)a3
{
  id v3 = +[PIParallaxStyleRecipeRegistry recipeForIdentifier:a3];
  if (v3) {
    uint64_t v4 = [[PIParallaxRecipeFilter alloc] initWithRecipe:v3];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (PIParallaxStyle)styleWithColorAnalysis:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    id v5 = (os_log_t *)MEMORY[0x1E4F7A748];
    id v6 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      id v7 = NSString;
      int v8 = v6;
      v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      char v11 = [v7 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v10];
      *(_DWORD *)buf = 138543362;
      id v25 = v11;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v12 = *v4;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v12 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_355_3743);
        }
LABEL_7:
        os_log_t v13 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)MEMORY[0x1E4F29060];
          BOOL v15 = v13;
          os_log_t v16 = [v14 callStackSymbols];
          v17 = [v16 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          id v25 = v17;
          _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_355_3743);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      id v20 = (void *)MEMORY[0x1E4F29060];
      id v21 = specific;
      BOOL v15 = v18;
      v22 = [v20 callStackSymbols];
      uint64_t v4 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      id v25 = specific;
      __int16 v26 = 2114;
      __int16 v27 = v4;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_355_3743);
  }
}

@end