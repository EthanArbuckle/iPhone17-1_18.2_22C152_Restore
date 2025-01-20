@interface PIParallaxColorPalette
+ (id)_loadColorsFromValues:(id)a3 mode:(id)a4 space:(id)a5 error:(id *)a6;
+ (id)_paletteWithConfigurationDictionary:(id)a3 error:(id *)a4;
+ (id)_serializeColors:(id)a3 mode:(id)a4;
+ (id)colorBGPalette;
+ (id)colorWashDuotonePalette;
+ (id)colorWashSinglePalette;
+ (id)customPalette;
+ (id)greenScreenMutedPalette;
+ (id)greenScreenVibrantPalette;
+ (id)loadPaletteFromURL:(id)a3 error:(id *)a4;
+ (id)loadPaletteWithName:(id)a3;
- (BOOL)writeToURL:(id)a3 mode:(id)a4 space:(id)a5 error:(id *)a6;
- (NSArray)primaryColors;
- (NSArray)secondaryColors;
- (NSIndexSet)suggestionIndices;
- (PIParallaxColorPalette)initWithColors:(id)a3;
- (PIParallaxColorPalette)initWithPrimaryColors:(id)a3 secondaryColors:(id)a4;
- (PIParallaxColorPalette)initWithPrimaryColors:(id)a3 secondaryColors:(id)a4 suggestionIndices:(id)a5;
- (id)paletteColorForColor:(id)a3;
- (id)suggestionAtIndex:(unint64_t)a3;
- (id)suggestionForColor:(id)a3;
- (unint64_t)_lookupColor:(id)a3 withPredicate:(id)a4;
- (unint64_t)indexOfColor:(id)a3;
@end

@implementation PIParallaxColorPalette

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionIndices, 0);
  objc_storeStrong((id *)&self->_secondaryColors, 0);
  objc_storeStrong((id *)&self->_primaryColors, 0);
}

- (NSIndexSet)suggestionIndices
{
  return self->_suggestionIndices;
}

- (NSArray)secondaryColors
{
  return self->_secondaryColors;
}

- (NSArray)primaryColors
{
  return self->_primaryColors;
}

- (id)suggestionAtIndex:(unint64_t)a3
{
  v5 = [(PIParallaxColorPalette *)self primaryColors];
  v6 = [v5 objectAtIndexedSubscript:a3];

  v7 = [(PIParallaxColorPalette *)self secondaryColors];
  if ([v7 count] <= a3)
  {
    v9 = 0;
  }
  else
  {
    v8 = [(PIParallaxColorPalette *)self secondaryColors];
    v9 = [v8 objectAtIndexedSubscript:a3];
  }
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F8CCD0]) initWithPrimaryColor:v6 secondaryColor:v9];

  return v10;
}

- (unint64_t)indexOfColor:(id)a3
{
  return [(PIParallaxColorPalette *)self _lookupColor:a3 withPredicate:&__block_literal_global_1213];
}

uint64_t __39__PIParallaxColorPalette_indexOfColor___block_invoke()
{
  return 1;
}

- (id)paletteColorForColor:(id)a3
{
  unint64_t v4 = [(PIParallaxColorPalette *)self indexOfColor:a3];
  v5 = [(PIParallaxColorPalette *)self primaryColors];
  v6 = [v5 objectAtIndexedSubscript:v4];

  return v6;
}

- (unint64_t)_lookupColor:(id)a3 withPredicate:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (unsigned int (**)(id, unint64_t))a4;
  v8 = [(PIParallaxColorPalette *)self primaryColors];
  if ([v8 count])
  {
    if ([v8 count])
    {
      unint64_t v9 = 0;
      unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      double v11 = 1.79769313e308;
      do
      {
        if (v7[2](v7, v9))
        {
          v12 = [v8 objectAtIndexedSubscript:v9];
          [v12 distanceToColor:v6];
          if (v11 > v13)
          {
            double v11 = v13;
            unint64_t v10 = v9;
          }
        }
        ++v9;
      }
      while (v9 < [v8 count]);
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {

        return v10;
      }
    }
  }
  else
  {
    v15 = NUAssertLogger_1215();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = [NSString stringWithFormat:@"The palette can't be empty"];
      int v41 = 138543362;
      v42 = v16;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v41, 0xCu);
    }
    v17 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v19 = NUAssertLogger_1215();
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
        int v41 = 138543618;
        v42 = v23;
        __int16 v43 = 2114;
        v44 = v27;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v41, 0x16u);
      }
    }
    else if (v20)
    {
      v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      v22 = [v21 componentsJoinedByString:@"\n"];
      int v41 = 138543362;
      v42 = v22;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v41, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v28 = NUAssertLogger_1215();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    v29 = [NSString stringWithFormat:@"Failed to find a nearest color"];
    int v41 = 138543362;
    v42 = v29;
    _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v41, 0xCu);
  }
  v30 = (const void **)MEMORY[0x1E4F7A308];
  v31 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
  v32 = NUAssertLogger_1215();
  BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
  if (v31)
  {
    if (v33)
    {
      v36 = dispatch_get_specific(*v30);
      v37 = (void *)MEMORY[0x1E4F29060];
      id v38 = v36;
      v39 = [v37 callStackSymbols];
      v40 = [v39 componentsJoinedByString:@"\n"];
      int v41 = 138543618;
      v42 = v36;
      __int16 v43 = 2114;
      v44 = v40;
      _os_log_error_impl(&dword_1A9680000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v41, 0x16u);
    }
  }
  else if (v33)
  {
    v34 = [MEMORY[0x1E4F29060] callStackSymbols];
    v35 = [v34 componentsJoinedByString:@"\n"];
    int v41 = 138543362;
    v42 = v35;
    _os_log_error_impl(&dword_1A9680000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v41, 0xCu);
  }
  _NUAssertFailHandler();
  return (unint64_t)NUAssertLogger_1215();
}

- (id)suggestionForColor:(id)a3
{
  id v4 = a3;
  v5 = [(PIParallaxColorPalette *)self suggestionIndices];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__PIParallaxColorPalette_suggestionForColor___block_invoke;
  v10[3] = &unk_1E5D7EE08;
  id v11 = v5;
  id v6 = v5;
  unint64_t v7 = [(PIParallaxColorPalette *)self _lookupColor:v4 withPredicate:v10];

  v8 = [(PIParallaxColorPalette *)self suggestionAtIndex:v7];

  return v8;
}

uint64_t __45__PIParallaxColorPalette_suggestionForColor___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsIndex:a2];
}

- (PIParallaxColorPalette)initWithPrimaryColors:(id)a3 secondaryColors:(id)a4 suggestionIndices:(id)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v22 = NUAssertLogger_1215();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "primaryColors != nil");
      v23 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v23;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v24 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v26 = NUAssertLogger_1215();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v50 = dispatch_get_specific(*v24);
        v51 = (void *)MEMORY[0x1E4F29060];
        id v52 = v50;
        v24 = [v51 callStackSymbols];
        v53 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v73 = (const void **)v50;
        __int16 v74 = 2114;
        v75 = v53;
        _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v73 = v24;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v32 = _NUAssertFailHandler();
    goto LABEL_36;
  }
  if (!v9)
  {
    v29 = NUAssertLogger_1215();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "secondaryColors != nil");
      v30 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v30;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v24 = (const void **)MEMORY[0x1E4F7A308];
    v31 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v26 = NUAssertLogger_1215();
    int v32 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (!v31)
    {
      if (v32)
      {
        BOOL v33 = [MEMORY[0x1E4F29060] callStackSymbols];
        v24 = [v33 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v73 = v24;
        _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_38:

      int v37 = _NUAssertFailHandler();
      goto LABEL_39;
    }
LABEL_36:
    if (v32)
    {
      v54 = dispatch_get_specific(*v24);
      v55 = (void *)MEMORY[0x1E4F29060];
      id v56 = v54;
      v24 = [v55 callStackSymbols];
      v57 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v73 = (const void **)v54;
      __int16 v74 = 2114;
      v75 = v57;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_38;
  }
  id v11 = v10;
  if (!v10)
  {
    v34 = NUAssertLogger_1215();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "suggestionIndices != nil");
      v35 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v35;
      _os_log_error_impl(&dword_1A9680000, v34, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v24 = (const void **)MEMORY[0x1E4F7A308];
    v36 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v26 = NUAssertLogger_1215();
    int v37 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (!v36)
    {
      if (v37)
      {
        id v38 = [MEMORY[0x1E4F29060] callStackSymbols];
        v24 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v73 = v24;
        _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_41:

      int v42 = _NUAssertFailHandler();
      goto LABEL_42;
    }
LABEL_39:
    if (v37)
    {
      v58 = dispatch_get_specific(*v24);
      v59 = (void *)MEMORY[0x1E4F29060];
      id v60 = v58;
      v24 = [v59 callStackSymbols];
      v61 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v73 = (const void **)v58;
      __int16 v74 = 2114;
      v75 = v61;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_41;
  }
  unint64_t v12 = [v10 lastIndex];
  if (v12 >= [v8 count])
  {
    v39 = NUAssertLogger_1215();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "suggestionIndices.lastIndex < primaryColors.count");
      v40 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v40;
      _os_log_error_impl(&dword_1A9680000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v24 = (const void **)MEMORY[0x1E4F7A308];
    int v41 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v26 = NUAssertLogger_1215();
    int v42 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (!v41)
    {
      if (v42)
      {
        __int16 v43 = [MEMORY[0x1E4F29060] callStackSymbols];
        v24 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v73 = v24;
        _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_44:

      int v47 = _NUAssertFailHandler();
      goto LABEL_45;
    }
LABEL_42:
    if (v42)
    {
      v62 = dispatch_get_specific(*v24);
      v63 = (void *)MEMORY[0x1E4F29060];
      id v64 = v62;
      v24 = [v63 callStackSymbols];
      v65 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v73 = (const void **)v62;
      __int16 v74 = 2114;
      v75 = v65;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_44;
  }
  if ([v9 count])
  {
    uint64_t v13 = [v9 count];
    if (v13 != [v8 count])
    {
      v44 = NUAssertLogger_1215();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        uint64_t v45 = [NSString stringWithFormat:@"Secondary color palette should be empty or equal in size to the primary palette"];
        *(_DWORD *)buf = 138543362;
        v73 = v45;
        _os_log_error_impl(&dword_1A9680000, v44, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      v24 = (const void **)MEMORY[0x1E4F7A308];
      v46 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v26 = NUAssertLogger_1215();
      int v47 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
      if (!v46)
      {
        if (v47)
        {
          v48 = [MEMORY[0x1E4F29060] callStackSymbols];
          v49 = [v48 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v73 = v49;
          _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
        }
        goto LABEL_47;
      }
LABEL_45:
      if (v47)
      {
        v66 = dispatch_get_specific(*v24);
        v67 = (void *)MEMORY[0x1E4F29060];
        id v68 = v66;
        v69 = [v67 callStackSymbols];
        v70 = [v69 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v73 = (const void **)v66;
        __int16 v74 = 2114;
        v75 = v70;
        _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
LABEL_47:

      _NUAssertFailHandler();
    }
  }
  v71.receiver = self;
  v71.super_class = (Class)PIParallaxColorPalette;
  v14 = [(PIParallaxColorPalette *)&v71 init];
  uint64_t v15 = [v8 copy];
  primaryColors = v14->_primaryColors;
  v14->_primaryColors = (NSArray *)v15;

  uint64_t v17 = [v9 copy];
  secondaryColors = v14->_secondaryColors;
  v14->_secondaryColors = (NSArray *)v17;

  uint64_t v19 = [v11 copy];
  suggestionIndices = v14->_suggestionIndices;
  v14->_suggestionIndices = (NSIndexSet *)v19;

  return v14;
}

- (PIParallaxColorPalette)initWithPrimaryColors:(id)a3 secondaryColors:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F28D60];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_msgSend([v6 alloc], "initWithIndexesInRange:", 0, objc_msgSend(v8, "count"));
  id v10 = [(PIParallaxColorPalette *)self initWithPrimaryColors:v8 secondaryColors:v7 suggestionIndices:v9];

  return v10;
}

- (PIParallaxColorPalette)initWithColors:(id)a3
{
  return [(PIParallaxColorPalette *)self initWithPrimaryColors:a3 secondaryColors:MEMORY[0x1E4F1CBF0]];
}

- (BOOL)writeToURL:(id)a3 mode:(id)a4 space:(id)a5 error:(id *)a6
{
  v31[6] = *MEMORY[0x1E4F143B8];
  id v10 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v10 alloc];
  uint64_t v15 = [(PIParallaxColorPalette *)self suggestionIndices];
  v16 = objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "count"));

  uint64_t v17 = [(PIParallaxColorPalette *)self suggestionIndices];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  BOOL v27 = __54__PIParallaxColorPalette_writeToURL_mode_space_error___block_invoke;
  v28 = &unk_1E5D7EDE0;
  id v29 = v16;
  id v18 = v16;
  [v17 enumerateIndexesUsingBlock:&v25];

  v30[0] = @"version";
  v30[1] = @"mode";
  v31[0] = &unk_1F0009758;
  v31[1] = v12;
  v31[2] = v11;
  v30[2] = @"space";
  v30[3] = @"primaryColors";
  uint64_t v19 = [(PIParallaxColorPalette *)self primaryColors];
  BOOL v20 = +[PIParallaxColorPalette _serializeColors:v19 mode:v12];
  v31[3] = v20;
  v30[4] = @"secondaryColors";
  v21 = [(PIParallaxColorPalette *)self secondaryColors];
  v22 = +[PIParallaxColorPalette _serializeColors:v21 mode:v12];
  v30[5] = @"suggestionIndices";
  v31[4] = v22;
  v31[5] = v18;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:6];

  LOBYTE(a6) = [v23 writeToURL:v13 error:a6];
  return (char)a6;
}

void __54__PIParallaxColorPalette_writeToURL_mode_space_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInteger:a2];
  [v2 addObject:v3];
}

+ (id)customPalette
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (uint64_t i = 0; i != 10; ++i)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    for (uint64_t j = 0; j != 12; ++j)
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F8CC78]) initWithHue:(double)j * 30.0 tone:(double)i / 10.0];
      [v5 addObject:v7];
    }
    NSLog(&cfstr_TonalColors.isa, v5);
    [v3 addObjectsFromArray:v5];
  }
  id v8 = objc_alloc((Class)a1);
  id v9 = (void *)[v8 initWithPrimaryColors:v3 secondaryColors:MEMORY[0x1E4F1CBF0]];

  return v9;
}

+ (id)loadPaletteWithName:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = (const void **)a3;
  id v4 = +[PIGlobalSettings globalSettings];
  int v5 = [v4 useStyleRecipeConfigDirectory];

  id v6 = (void *)0x1E5D7D000;
  if (!v5) {
    goto LABEL_8;
  }
  id v7 = +[PIGlobalSettings globalSettings];
  id v8 = [v7 styleRecipeConfigDirectoryPath];

  if (!v8) {
    goto LABEL_8;
  }
  id v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
  id v10 = [v9 URLByAppendingPathComponent:v3];
  id v11 = [v10 URLByAppendingPathExtension:@"plist"];

  id v26 = 0;
  id v12 = +[PIParallaxColorPalette loadPaletteFromURL:v11 error:&v26];
  id v13 = v26;
  if (!v12)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      goto LABEL_20;
    }
    while (1)
    {
      id v14 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v3;
        __int16 v29 = 2112;
        v30 = v13;
        _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Failed to load user palette '%@', error: %@", buf, 0x16u);
      }

LABEL_8:
      id v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v11 = [v8 URLForResource:v3 withExtension:@"plist"];
      uint64_t v15 = (void *)v6[435];
      id v25 = 0;
      id v12 = [v15 loadPaletteFromURL:v11 error:&v25];
      id v13 = v25;
      if (v12) {
        break;
      }
      uint64_t v17 = NUAssertLogger_1215();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = [NSString stringWithFormat:@"Failed to load color palette '%@', error: %@", v3, v13];
        *(_DWORD *)buf = 138543362;
        v28 = v18;
        _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      id v11 = (const void **)MEMORY[0x1E4F7A308];
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      id v8 = NUAssertLogger_1215();
      BOOL v20 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v20)
        {
          v22 = dispatch_get_specific(*v11);
          v23 = (void *)MEMORY[0x1E4F29060];
          id v24 = v22;
          id v11 = [v23 callStackSymbols];
          id v6 = [v11 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v28 = (const void **)v22;
          __int16 v29 = 2114;
          v30 = v6;
          _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v20)
      {
        v21 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v11 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v28 = v11;
        _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler();
LABEL_20:
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_193);
    }
  }

  return v12;
}

+ (id)greenScreenVibrantPalette
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PIParallaxColorPalette_greenScreenVibrantPalette__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (greenScreenVibrantPalette_onceToken != -1) {
    dispatch_once(&greenScreenVibrantPalette_onceToken, block);
  }
  v2 = (void *)greenScreenVibrantPalette_palette;
  return v2;
}

uint64_t __51__PIParallaxColorPalette_greenScreenVibrantPalette__block_invoke(uint64_t a1)
{
  greenScreenVibrantPalette_palette = [*(id *)(a1 + 32) loadPaletteWithName:@"GreenScreenVibrantPalette"];
  return MEMORY[0x1F41817F8]();
}

+ (id)greenScreenMutedPalette
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PIParallaxColorPalette_greenScreenMutedPalette__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (greenScreenMutedPalette_onceToken != -1) {
    dispatch_once(&greenScreenMutedPalette_onceToken, block);
  }
  v2 = (void *)greenScreenMutedPalette_palette;
  return v2;
}

uint64_t __49__PIParallaxColorPalette_greenScreenMutedPalette__block_invoke(uint64_t a1)
{
  greenScreenMutedPalette_palette = [*(id *)(a1 + 32) loadPaletteWithName:@"GreenScreenMutedPalette"];
  return MEMORY[0x1F41817F8]();
}

+ (id)colorWashDuotonePalette
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PIParallaxColorPalette_colorWashDuotonePalette__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (colorWashDuotonePalette_onceToken != -1) {
    dispatch_once(&colorWashDuotonePalette_onceToken, block);
  }
  v2 = (void *)colorWashDuotonePalette_palette;
  return v2;
}

uint64_t __49__PIParallaxColorPalette_colorWashDuotonePalette__block_invoke(uint64_t a1)
{
  colorWashDuotonePalette_palette = [*(id *)(a1 + 32) loadPaletteWithName:@"ColorWashDuotonePalette"];
  return MEMORY[0x1F41817F8]();
}

+ (id)colorWashSinglePalette
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PIParallaxColorPalette_colorWashSinglePalette__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (colorWashSinglePalette_onceToken != -1) {
    dispatch_once(&colorWashSinglePalette_onceToken, block);
  }
  v2 = (void *)colorWashSinglePalette_palette;
  return v2;
}

uint64_t __48__PIParallaxColorPalette_colorWashSinglePalette__block_invoke(uint64_t a1)
{
  colorWashSinglePalette_palette = [*(id *)(a1 + 32) loadPaletteWithName:@"ColorWashSinglePalette"];
  return MEMORY[0x1F41817F8]();
}

+ (id)colorBGPalette
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__PIParallaxColorPalette_colorBGPalette__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (colorBGPalette_onceToken != -1) {
    dispatch_once(&colorBGPalette_onceToken, block);
  }
  v2 = (void *)colorBGPalette_palette;
  return v2;
}

uint64_t __40__PIParallaxColorPalette_colorBGPalette__block_invoke(uint64_t a1)
{
  colorBGPalette_palette = [*(id *)(a1 + 32) loadPaletteWithName:@"ColorBGPalette"];
  return MEMORY[0x1F41817F8]();
}

+ (id)_loadColorsFromValues:(id)a3 mode:(id)a4 space:(id)a5 error:(id *)a6
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v53 = NUAssertLogger_1215();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      v54 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "colorValues != nil");
      *(_DWORD *)components = 138543362;
      *(void *)&components[4] = v54;
      _os_log_error_impl(&dword_1A9680000, v53, OS_LOG_TYPE_ERROR, "Fail: %{public}@", components, 0xCu);
    }
    v55 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v57 = NUAssertLogger_1215();
    BOOL v58 = os_log_type_enabled(v57, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v58)
      {
        v66 = dispatch_get_specific(*v55);
        v67 = (void *)MEMORY[0x1E4F29060];
        id v68 = v66;
        v55 = [v67 callStackSymbols];
        v69 = [v55 componentsJoinedByString:@"\n"];
        *(_DWORD *)components = 138543618;
        *(void *)&components[4] = v66;
        *(_WORD *)&components[12] = 2114;
        *(void *)&components[14] = v69;
        _os_log_error_impl(&dword_1A9680000, v57, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", components, 0x16u);
      }
    }
    else if (v58)
    {
      v59 = [MEMORY[0x1E4F29060] callStackSymbols];
      v55 = [v59 componentsJoinedByString:@"\n"];
      *(_DWORD *)components = 138543362;
      *(void *)&components[4] = v55;
      _os_log_error_impl(&dword_1A9680000, v57, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", components, 0xCu);
    }
    int v63 = _NUAssertFailHandler();
    goto LABEL_59;
  }
  if (!a6)
  {
    id v60 = NUAssertLogger_1215();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      v61 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)components = 138543362;
      *(void *)&components[4] = v61;
      _os_log_error_impl(&dword_1A9680000, v60, OS_LOG_TYPE_ERROR, "Fail: %{public}@", components, 0xCu);
    }
    v55 = (const void **)MEMORY[0x1E4F7A308];
    v62 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v57 = NUAssertLogger_1215();
    int v63 = os_log_type_enabled(v57, OS_LOG_TYPE_ERROR);
    if (!v62)
    {
      if (v63)
      {
        id v64 = [MEMORY[0x1E4F29060] callStackSymbols];
        v65 = [v64 componentsJoinedByString:@"\n"];
        *(_DWORD *)components = 138543362;
        *(void *)&components[4] = v65;
        _os_log_error_impl(&dword_1A9680000, v57, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", components, 0xCu);
      }
      goto LABEL_61;
    }
LABEL_59:
    if (v63)
    {
      v70 = dispatch_get_specific(*v55);
      objc_super v71 = (void *)MEMORY[0x1E4F29060];
      id v72 = v70;
      v73 = [v71 callStackSymbols];
      __int16 v74 = [v73 componentsJoinedByString:@"\n"];
      *(_DWORD *)components = 138543618;
      *(void *)&components[4] = v70;
      *(_WORD *)&components[12] = 2114;
      *(void *)&components[14] = v74;
      _os_log_error_impl(&dword_1A9680000, v57, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", components, 0x16u);
    }
LABEL_61:

    _NUAssertFailHandler();
  }
  id v12 = v11;
  if ([v10 isEqualToString:@"HueTone"])
  {
    int v82 = 1;
    uint64_t v13 = 2;
  }
  else
  {
    int v14 = [v10 isEqualToString:@"Hex"];
    int v82 = v14 ^ 1;
    uint64_t v13 = 3;
    if (v14) {
      uint64_t v13 = 1;
    }
  }
  uint64_t v78 = v13;
  uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v16 = v9;
  uint64_t v79 = [v16 countByEnumeratingWithState:&v87 objects:v95 count:16];
  if (v79)
  {
    uint64_t v80 = *(void *)v88;
    CFStringRef name = (const __CFString *)*MEMORY[0x1E4F1DB90];
    uint64_t v76 = a6;
    v77 = v12;
    v81 = v15;
LABEL_9:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v88 != v80) {
        objc_enumerationMutation(v16);
      }
      id v18 = *(id *)(*((void *)&v87 + 1) + 8 * v17);
      if (v82)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || [v18 count] != v78)
        {
          *uint64_t v76 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid color values" object:v18];
          goto LABEL_41;
        }
        long long v85 = 0u;
        long long v86 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v83 objects:v94 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v84;
LABEL_17:
          uint64_t v23 = 0;
          while (1)
          {
            if (*(void *)v84 != v22) {
              objc_enumerationMutation(v19);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            if (v21 == ++v23)
            {
              uint64_t v21 = [v19 countByEnumeratingWithState:&v83 objects:v94 count:16];
              if (v21) {
                goto LABEL_17;
              }
              goto LABEL_23;
            }
          }
LABEL_40:
          *uint64_t v76 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid color values" object:v19];

          id v18 = v19;
LABEL_41:
          id v12 = v77;
          uint64_t v15 = v81;

          id v51 = 0;
          goto LABEL_42;
        }
LABEL_23:
      }
      if ([v10 isEqualToString:@"HueTone"])
      {
        id v24 = objc_alloc(MEMORY[0x1E4F8CC78]);
        id v25 = [v18 objectAtIndexedSubscript:0];
        [v25 doubleValue];
        double v27 = v26;
        v28 = [v18 objectAtIndexedSubscript:1];
        [v28 doubleValue];
        v30 = (void *)[v24 initWithHue:v27 tone:v29];
      }
      else if ([v10 isEqualToString:@"LumaHueChroma"])
      {
        id v31 = objc_alloc(MEMORY[0x1E4F8CC78]);
        int v32 = [v18 objectAtIndexedSubscript:0];
        [v32 doubleValue];
        double v34 = v33;
        v35 = [v18 objectAtIndexedSubscript:1];
        [v35 doubleValue];
        double v37 = v36;
        id v38 = [v18 objectAtIndexedSubscript:2];
        [v38 doubleValue];
        v30 = (void *)[v31 initWithLuma:v34 hue:v37 chroma:v39];
      }
      else
      {
        if ([v10 isEqualToString:@"Hex"])
        {
          id v19 = v18;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_40;
          }
          *(_DWORD *)components = 0;
          uint64_t v91 = 0;
          id v19 = v19;
          v40 = (const char *)[v19 cStringUsingEncoding:1];
          if (!v40 || sscanf(v40, "%02x%02x%02x", components, (char *)&v91 + 4, &v91) != 3) {
            goto LABEL_40;
          }
          double v41 = (double)*(int *)components / 255.0;
          double v42 = (double)SHIDWORD(v91) / 255.0;
          double v43 = (double)(int)v91 / 255.0;
        }
        else
        {
          v44 = [v18 objectAtIndexedSubscript:0];
          [v44 doubleValue];
          double v41 = v45;

          v46 = [v18 objectAtIndexedSubscript:1];
          [v46 doubleValue];
          double v42 = v47;

          id v19 = [v18 objectAtIndexedSubscript:2];
          [v19 doubleValue];
          double v43 = v48;
        }

        if ([v77 isEqualToString:@"P3"])
        {
          v49 = CGColorSpaceCreateWithName(name);
          *(double *)components = v41;
          *(double *)&components[8] = v42;
          *(double *)&components[16] = v43;
          uint64_t v93 = 0x3FF0000000000000;
          v50 = CGColorCreate(v49, (const CGFloat *)components);
          v30 = [MEMORY[0x1E4F8CC78] colorWithCGColor:v50];
          CGColorSpaceRelease(v49);
          CGColorRelease(v50);
        }
        else
        {
          v30 = (void *)[objc_alloc(MEMORY[0x1E4F8CC78]) initWithRed:v41 green:v42 blue:v43];
        }
      }
      [v81 addObject:v30];

      if (++v17 == v79)
      {
        id v12 = v77;
        uint64_t v15 = v81;
        uint64_t v79 = [v16 countByEnumeratingWithState:&v87 objects:v95 count:16];
        if (v79) {
          goto LABEL_9;
        }
        break;
      }
    }
  }

  id v51 = v15;
LABEL_42:

  return v51;
}

+ (id)_serializeColors:(id)a3 mode:(id)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  obuint64_t j = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v61 objects:v72 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v62;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v62 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v61 + 1) + 8 * v11);
        if ([v6 isEqualToString:@"HueTone"])
        {
          uint64_t v13 = NSNumber;
          [v12 hue];
          int v14 = objc_msgSend(v13, "numberWithDouble:");
          v71[0] = v14;
          uint64_t v15 = NSNumber;
          [v12 tone];
          id v16 = objc_msgSend(v15, "numberWithDouble:");
          v71[1] = v16;
          uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
LABEL_10:

          goto LABEL_11;
        }
        if ([v6 isEqualToString:@"LumaHueChroma"])
        {
          id v18 = NSNumber;
          [v12 luma];
          int v14 = objc_msgSend(v18, "numberWithDouble:");
          v70[0] = v14;
          id v19 = NSNumber;
          [v12 hue];
          id v16 = objc_msgSend(v19, "numberWithDouble:");
          v70[1] = v16;
          uint64_t v20 = NSNumber;
          [v12 chroma];
          uint64_t v21 = objc_msgSend(v20, "numberWithDouble:");
          v70[2] = v21;
          uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:3];

          goto LABEL_10;
        }
        if ([v6 isEqualToString:@"RGB"])
        {
          uint64_t v22 = NSNumber;
          [v12 red];
          uint64_t v23 = objc_msgSend(v22, "numberWithDouble:");
          v69[0] = v23;
          id v24 = NSNumber;
          [v12 green];
          id v25 = objc_msgSend(v24, "numberWithDouble:");
          v69[1] = v25;
          double v26 = NSNumber;
          [v12 blue];
          double v27 = objc_msgSend(v26, "numberWithDouble:");
          v69[2] = v27;
          uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:3];
        }
        else
        {
          if (![v6 isEqualToString:@"Hex"])
          {
            double v47 = NUAssertLogger_1215();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              double v48 = [NSString stringWithFormat:@"Unknown color mode: %@", v6];
              *(_DWORD *)buf = 138543362;
              v66 = v48;
              _os_log_error_impl(&dword_1A9680000, v47, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
            }
            v49 = (const void **)MEMORY[0x1E4F7A308];
            specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
            id v51 = NUAssertLogger_1215();
            BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);
            if (specific)
            {
              if (v52)
              {
                v55 = dispatch_get_specific(*v49);
                id v56 = (void *)MEMORY[0x1E4F29060];
                id v57 = v55;
                BOOL v58 = [v56 callStackSymbols];
                v59 = [v58 componentsJoinedByString:@"\n"];
                *(_DWORD *)buf = 138543618;
                v66 = v55;
                __int16 v67 = 2114;
                id v68 = v59;
                _os_log_error_impl(&dword_1A9680000, v51, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
              }
            }
            else if (v52)
            {
              v53 = [MEMORY[0x1E4F29060] callStackSymbols];
              v54 = [v53 componentsJoinedByString:@"\n"];
              *(_DWORD *)buf = 138543362;
              v66 = v54;
              _os_log_error_impl(&dword_1A9680000, v51, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
            }
            _NUAssertFailHandler();
          }
          [v12 red];
          double v29 = v28;
          [v12 green];
          double v31 = v30;
          [v12 blue];
          float v33 = v29;
          float v34 = 255.0;
          float v35 = (float)(v33 * 255.0) + 0.5;
          if (v35 < 255.0) {
            float v36 = v35;
          }
          else {
            float v36 = 255.0;
          }
          LODWORD(v37) = (int)v36;
          float v38 = v31;
          float v39 = (float)(v38 * 255.0) + 0.5;
          if (v39 < 255.0) {
            float v40 = v39;
          }
          else {
            float v40 = 255.0;
          }
          LODWORD(v41) = (int)v40;
          float v42 = v32;
          float v43 = (float)(v42 * 255.0) + 0.5;
          if (v43 < 255.0) {
            float v34 = v43;
          }
          LODWORD(v44) = (int)v34;
          if (v35 >= 0.0) {
            uint64_t v37 = v37;
          }
          else {
            uint64_t v37 = 0;
          }
          if (v39 >= 0.0) {
            uint64_t v41 = v41;
          }
          else {
            uint64_t v41 = 0;
          }
          if (v43 >= 0.0) {
            uint64_t v44 = v44;
          }
          else {
            uint64_t v44 = 0;
          }
          uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%02X%02X%02X", v37, v41, v44);
        }
LABEL_11:
        [v7 addObject:v17];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v45 = [obj countByEnumeratingWithState:&v61 objects:v72 count:16];
      uint64_t v9 = v45;
    }
    while (v45);
  }

  return v7;
}

+ (id)_paletteWithConfigurationDictionary:(id)a3 error:(id *)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    float v34 = NUAssertLogger_1215();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      float v35 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      uint64_t v73 = v35;
      _os_log_error_impl(&dword_1A9680000, v34, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    float v36 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    float v38 = NUAssertLogger_1215();
    BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v39)
      {
        double v47 = dispatch_get_specific(*v36);
        double v48 = (void *)MEMORY[0x1E4F29060];
        id v49 = v47;
        float v36 = [v48 callStackSymbols];
        v50 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v73 = (const void **)v47;
        __int16 v74 = 2114;
        v75 = v50;
        _os_log_error_impl(&dword_1A9680000, v38, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v39)
    {
      float v40 = [MEMORY[0x1E4F29060] callStackSymbols];
      float v36 = [v40 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v73 = v36;
      _os_log_error_impl(&dword_1A9680000, v38, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v44 = _NUAssertFailHandler();
    goto LABEL_70;
  }
  if (!a4)
  {
    uint64_t v41 = NUAssertLogger_1215();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      float v42 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      uint64_t v73 = v42;
      _os_log_error_impl(&dword_1A9680000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    float v36 = (const void **)MEMORY[0x1E4F7A308];
    float v43 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    float v38 = NUAssertLogger_1215();
    int v44 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
    if (!v43)
    {
      if (v44)
      {
        uint64_t v45 = [MEMORY[0x1E4F29060] callStackSymbols];
        v46 = [v45 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        uint64_t v73 = v46;
        _os_log_error_impl(&dword_1A9680000, v38, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_72;
    }
LABEL_70:
    if (v44)
    {
      id v51 = dispatch_get_specific(*v36);
      BOOL v52 = (void *)MEMORY[0x1E4F29060];
      id v53 = v51;
      v54 = [v52 callStackSymbols];
      v55 = [v54 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      uint64_t v73 = (const void **)v51;
      __int16 v74 = 2114;
      v75 = v55;
      _os_log_error_impl(&dword_1A9680000, v38, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_72:

    _NUAssertFailHandler();
  }
  id v7 = v6;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"version"];
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v10 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid version number" object:v8];
      goto LABEL_15;
    }
    uint64_t v9 = [v8 integerValue];
    if (v9 >= 4)
    {
      uint64_t v10 = [MEMORY[0x1E4F7A438] unsupportedError:@"Unsupported palette version" object:v8];
LABEL_15:
      uint64_t v17 = 0;
      *a4 = v10;
      goto LABEL_54;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v11 = [v7 objectForKeyedSubscript:@"mode"];
  id v12 = @"RGB";
  if (!v11)
  {
LABEL_11:
    uint64_t v14 = [v7 objectForKeyedSubscript:@"space"];
    uint64_t v13 = @"sRGB";
    long long v64 = (void *)v14;
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      v70[0] = @"sRGB";
      v70[1] = @"P3";
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
      if (![v16 containsObject:v15])
      {
        uint64_t v21 = (void *)MEMORY[0x1E4F7A438];
        uint64_t v22 = @"Invalid space value";
        uint64_t v23 = v15;
        goto LABEL_26;
      }
      uint64_t v13 = v15;
    }
    id v16 = [v7 objectForKeyedSubscript:@"primaryColors"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = [v7 objectForKeyedSubscript:@"secondaryColors"];
      if (v18)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [MEMORY[0x1E4F7A438] invalidError:@"Invalid secondary color values" object:v18];
          uint64_t v17 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_51:

          goto LABEL_52;
        }
      }
      id v19 = [a1 _loadColorsFromValues:v16 mode:v12 space:v13 error:a4];
      if (!v19)
      {
        uint64_t v17 = 0;
        goto LABEL_50;
      }
      id v61 = v19;
      if (v18)
      {
        uint64_t v20 = [a1 _loadColorsFromValues:v18 mode:v12 space:v13 error:a4];
        if (!v20)
        {
          uint64_t v17 = 0;
          id v19 = v61;
LABEL_50:

          goto LABEL_51;
        }
      }
      else
      {
        uint64_t v20 = MEMORY[0x1E4F1CBF0];
      }
      BOOL v58 = (void *)v20;
      id v57 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, objc_msgSend(v61, "count"));
      uint64_t v24 = [v7 objectForKeyedSubscript:@"suggestionIndices"];
      v59 = (void *)v24;
      if (v24)
      {
        id v25 = (void *)v24;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v56 = v18;
          id v63 = objc_alloc_init(MEMORY[0x1E4F28E60]);
          long long v65 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          obuint64_t j = v25;
          uint64_t v26 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v62 = *(void *)v66;
            while (2)
            {
              for (uint64_t i = 0; i != v27; ++i)
              {
                if (*(void *)v66 != v62) {
                  objc_enumerationMutation(obj);
                }
                double v29 = *(void **)(*((void *)&v65 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  *a4 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid suggestion index" object:v29];

                  uint64_t v17 = 0;
                  id v18 = v56;
                  goto LABEL_45;
                }
                objc_msgSend(v63, "addIndex:", objc_msgSend(v29, "unsignedIntegerValue"));
              }
              uint64_t v27 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
              if (v27) {
                continue;
              }
              break;
            }
          }

          id v30 = v63;
          double v31 = v63;
          id v18 = v56;
          goto LABEL_48;
        }
        [MEMORY[0x1E4F7A438] invalidError:@"Invalid suggestion indices" object:v25];
        uint64_t v17 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        double v32 = v58;
      }
      else
      {
        if (v9 < 2)
        {
          double v31 = v57;
          id v30 = v57;
LABEL_48:
          double v32 = v58;
          uint64_t v17 = [[PIParallaxColorPalette alloc] initWithPrimaryColors:v61 secondaryColors:v58 suggestionIndices:v30];
          goto LABEL_49;
        }
        [MEMORY[0x1E4F7A438] missingError:@"Missing suggestion indices" object:v7];
        uint64_t v17 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_45:
        double v32 = v58;
      }
      double v31 = v57;
LABEL_49:

      id v19 = v61;
      goto LABEL_50;
    }
    uint64_t v21 = (void *)MEMORY[0x1E4F7A438];
    uint64_t v22 = @"Invalid primary color values";
    uint64_t v23 = v16;
LABEL_26:
    [v21 invalidError:v22 object:v23];
    uint64_t v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_52:

    goto LABEL_53;
  }
  v71[0] = @"RGB";
  v71[1] = @"LumaHueChroma";
  void v71[2] = @"HueTone";
  v71[3] = @"Hex";
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:4];
  if ([(__CFString *)v13 containsObject:v11])
  {
    id v12 = v11;

    goto LABEL_11;
  }
  [MEMORY[0x1E4F7A438] invalidError:@"Invalid mode value" object:v11];
  uint64_t v17 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_53:

LABEL_54:
  return v17;
}

+ (id)loadPaletteFromURL:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v11 = NUAssertLogger_1215();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "url != nil");
      id v12 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      float v34 = v12;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v13 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v15 = NUAssertLogger_1215();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        uint64_t v24 = dispatch_get_specific(*v13);
        id v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        uint64_t v13 = [v25 callStackSymbols];
        uint64_t v27 = [v13 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        float v34 = (const void **)v24;
        __int16 v35 = 2114;
        float v36 = v27;
        _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      uint64_t v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v13 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      float v34 = v13;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v21 = _NUAssertFailHandler();
    goto LABEL_22;
  }
  if (!a4)
  {
    id v18 = NUAssertLogger_1215();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      id v19 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      float v34 = v19;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v13 = (const void **)MEMORY[0x1E4F7A308];
    uint64_t v20 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v15 = NUAssertLogger_1215();
    int v21 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!v20)
    {
      if (v21)
      {
        uint64_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        float v34 = v23;
        _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_24;
    }
LABEL_22:
    if (v21)
    {
      double v28 = dispatch_get_specific(*v13);
      double v29 = (void *)MEMORY[0x1E4F29060];
      id v30 = v28;
      double v31 = [v29 callStackSymbols];
      double v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      float v34 = (const void **)v28;
      __int16 v35 = 2114;
      float v36 = v32;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_24:

    _NUAssertFailHandler();
  }
  id v7 = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v6 error:a4];
  if (v8)
  {
    uint64_t v9 = [a1 _paletteWithConfigurationDictionary:v8 error:a4];
  }
  else
  {
    [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to parse color palette plist data" object:v7 underlyingError:*a4];
    uint64_t v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

@end