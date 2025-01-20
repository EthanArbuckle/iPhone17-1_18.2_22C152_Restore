@interface PIParallaxStyleRecipeRegistry
+ (NSArray)supportedIdentifiers;
+ (id)_recipesForIdentifiers:(id)a3 withURLProvider:(id)a4;
+ (id)recipeForIdentifier:(id)a3;
@end

@implementation PIParallaxStyleRecipeRegistry

+ (id)_recipesForIdentifiers:(id)a3 withURLProvider:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v28;
    *(void *)&long long v9 = 138412546;
    long long v23 = v9;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v27 + 1) + 8 * v12);
        v14 = objc_msgSend(v6, "urlForIdentifier:", v13, v23);
        v15 = [v14 path];
        int v16 = [v7 isReadableFileAtPath:v15];

        if (v16)
        {
          id v26 = 0;
          v17 = +[PIParallaxStyleRecipeArchiver unarchivedStyleRecipeWithURL:v14 error:&v26];
          id v18 = v26;
          if (v17)
          {
            [v24 setObject:v17 forKeyedSubscript:v13];
          }
          else
          {
            if (*MEMORY[0x1E4F7A750] != -1) {
              dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_140);
            }
            v20 = *MEMORY[0x1E4F7A758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v23;
              v32 = v13;
              __int16 v33 = 2112;
              id v34 = v18;
              _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Failed to load style recipe for identifier '%@', error: %@", buf, 0x16u);
            }
          }
        }
        else
        {
          if (*MEMORY[0x1E4F7A750] != -1) {
            dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_140);
          }
          v19 = *MEMORY[0x1E4F7A758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138477827;
            v32 = v14;
            _os_log_impl(&dword_1A9680000, v19, OS_LOG_TYPE_INFO, "Missing configuration file '%{private}@'", buf, 0xCu);
          }
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v10);
  }

  v21 = (void *)[v24 copy];
  return v21;
}

+ (id)recipeForIdentifier:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PIParallaxStyleRecipeRegistry_recipeForIdentifier___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (recipeForIdentifier__onceToken != -1) {
    dispatch_once(&recipeForIdentifier__onceToken, block);
  }
  id v5 = +[PIGlobalSettings globalSettings];
  int v6 = [v5 useStyleRecipeConfigDirectory];

  if (!v6
    || ([(id)recipeForIdentifier__sUserRegistry objectForKeyedSubscript:v4],
        (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7 = [(id)recipeForIdentifier__sBundleRegistry objectForKeyedSubscript:v4];
  }

  return v7;
}

void __53__PIParallaxStyleRecipeRegistry_recipeForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) supportedIdentifiers];
  v3 = objc_alloc_init(PIParallaxStyleBundleURLProvider);
  uint64_t v4 = [*(id *)(a1 + 32) _recipesForIdentifiers:v2 withURLProvider:v3];
  id v5 = (void *)recipeForIdentifier__sBundleRegistry;
  recipeForIdentifier__sBundleRegistry = v4;

  uint64_t v6 = [(id)recipeForIdentifier__sBundleRegistry count];
  if (v6 != [v2 count])
  {
    v14 = NUAssertLogger_3595();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = [NSString stringWithFormat:@"The bundle should contain recipes for all known identifiers"];
      int v27 = 138543362;
      long long v28 = v15;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v27, 0xCu);
    }
    int v16 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v18 = NUAssertLogger_3595();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific(*v16);
        long long v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        v25 = [v23 callStackSymbols];
        id v26 = [v25 componentsJoinedByString:@"\n"];
        int v27 = 138543618;
        long long v28 = v22;
        __int16 v29 = 2114;
        long long v30 = v26;
        _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v27, 0x16u);
      }
    }
    else if (v19)
    {
      v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      v21 = [v20 componentsJoinedByString:@"\n"];
      int v27 = 138543362;
      long long v28 = v21;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v27, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v7 = +[PIGlobalSettings globalSettings];
  uint64_t v8 = [v7 styleRecipeConfigDirectoryPath];

  if (v8)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_140);
    }
    long long v9 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
    {
      int v27 = 138543362;
      long long v28 = v8;
      _os_log_impl(&dword_1A9680000, v9, OS_LOG_TYPE_INFO, "Using recipe directory at '%{public}@'", (uint8_t *)&v27, 0xCu);
    }
    uint64_t v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
    uint64_t v11 = [[PIParallaxStyleUserURLProvider alloc] initWithBaseURL:v10];
    uint64_t v12 = [*(id *)(a1 + 32) _recipesForIdentifiers:v2 withURLProvider:v11];
    v13 = (void *)recipeForIdentifier__sUserRegistry;
    recipeForIdentifier__sUserRegistry = v12;
  }
}

+ (NSArray)supportedIdentifiers
{
  return (NSArray *)&unk_1F000AA30;
}

@end