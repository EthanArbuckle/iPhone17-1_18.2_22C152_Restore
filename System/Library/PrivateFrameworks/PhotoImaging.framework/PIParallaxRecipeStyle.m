@interface PIParallaxRecipeStyle
- (BOOL)isEqual:(id)a3;
- (PIParallaxRecipeStyle)initWithIdentifier:(id)a3 recipe:(id)a4;
- (id)clockFont;
- (id)description;
- (id)filter;
- (id)kind;
- (id)parameters;
- (id)recipe;
- (id)recipeIdentifier;
@end

@implementation PIParallaxRecipeStyle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)filter
{
  v2 = [[PIParallaxRecipeFilter alloc] initWithRecipe:self->_recipe];
  return v2;
}

- (id)recipe
{
  return self->_recipe;
}

- (id)recipeIdentifier
{
  return self->_identifier;
}

- (id)clockFont
{
  v2 = [(PIParallaxRecipeStyle *)self recipe];
  v3 = [v2 parameters];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F8D048]];

  v5 = [v4 type];
  LODWORD(v3) = [v5 isEqualToString:@"mode"];

  if (v3)
  {
    v6 = [v4 modeValue];
  }
  else
  {
    v6 = @"SF Soft Time";
  }

  return v6;
}

- (id)kind
{
  return (id)*MEMORY[0x1E4F8D030];
}

- (id)parameters
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PIParallaxRecipeStyle *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(PIParallaxRecipeStyle *)self recipe];
      v7 = [(PIParallaxRecipeStyle *)v5 recipe];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; identifier = %@, recipe = %@>",
               objc_opt_class(),
               self,
               self->_identifier,
               self->_recipe);
}

- (PIParallaxRecipeStyle)initWithIdentifier:(id)a3 recipe:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (PIParallaxStyleRecipe *)a4;
  if (!v6)
  {
    v29 = NUAssertLogger_3803();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      v30 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v30;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v31 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v33 = NUAssertLogger_3803();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v34)
      {
        v42 = dispatch_get_specific(*v31);
        v43 = (void *)MEMORY[0x1E4F29060];
        id v44 = v42;
        v31 = [v43 callStackSymbols];
        v45 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v53 = (const void **)v42;
        __int16 v54 = 2114;
        v55 = v45;
        _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v34)
    {
      v35 = [MEMORY[0x1E4F29060] callStackSymbols];
      v31 = [v35 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v53 = v31;
      _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v39 = _NUAssertFailHandler();
    goto LABEL_19;
  }
  char v8 = v7;
  if (!v7)
  {
    v36 = NUAssertLogger_3803();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "recipe != nil");
      v37 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v37;
      _os_log_error_impl(&dword_1A9680000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v31 = (const void **)MEMORY[0x1E4F7A308];
    v38 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v33 = NUAssertLogger_3803();
    int v39 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (!v38)
    {
      if (v39)
      {
        v40 = [MEMORY[0x1E4F29060] callStackSymbols];
        v41 = [v40 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v53 = v41;
        _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_21;
    }
LABEL_19:
    if (v39)
    {
      v46 = dispatch_get_specific(*v31);
      v47 = (void *)MEMORY[0x1E4F29060];
      id v48 = v46;
      v49 = [v47 callStackSymbols];
      v50 = [v49 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v53 = (const void **)v46;
      __int16 v54 = 2114;
      v55 = v50;
      _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_21:

    _NUAssertFailHandler();
  }
  v9 = [MEMORY[0x1E4F8CC78] whiteColor];
  v10 = [(PIParallaxStyleRecipe *)v8 parameters];
  v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F8D040]];

  v12 = [v11 type];
  int v13 = [v12 isEqualToString:@"color"];

  if (v13)
  {
    v14 = [v11 redValue];
    v15 = [v11 greenValue];
    v16 = [v11 blueValue];
    id v17 = objc_alloc(MEMORY[0x1E4F8CC78]);
    [v14 doubleValue];
    double v19 = v18;
    [v15 doubleValue];
    double v21 = v20;
    [v16 doubleValue];
    uint64_t v23 = [v17 initWithRed:v19 green:v21 blue:v22];

    v9 = (void *)v23;
  }
  v51.receiver = self;
  v51.super_class = (Class)PIParallaxRecipeStyle;
  v24 = [(PIParallaxStyle *)&v51 initWithClockColor:v9 colorSuggestions:MEMORY[0x1E4F1CBF0]];
  uint64_t v25 = [v6 copy];
  identifier = v24->_identifier;
  v24->_identifier = (NSString *)v25;

  recipe = v24->_recipe;
  v24->_recipe = v8;

  return v24;
}

@end