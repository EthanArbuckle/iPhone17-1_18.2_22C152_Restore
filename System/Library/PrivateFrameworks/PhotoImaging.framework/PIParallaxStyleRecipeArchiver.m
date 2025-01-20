@interface PIParallaxStyleRecipeArchiver
+ (BOOL)writeRecipe:(id)a3 toURL:(id)a4 error:(id *)a5;
+ (id)_deserializeFilterDefinition:(id)a3 version:(unint64_t)a4 error:(id *)a5;
+ (id)_deserializeFilterDefinitions:(id)a3 version:(unint64_t)a4 error:(id *)a5;
+ (id)_deserializeParameter:(id)a3 version:(unint64_t)a4 error:(id *)a5;
+ (id)_deserializeParameters:(id)a3 version:(unint64_t)a4 error:(id *)a5;
+ (id)_serializeDefinition:(id)a3;
+ (id)_serializeFilters:(id)a3;
+ (id)_serializeParameter:(id)a3;
+ (id)_serializeParameters:(id)a3;
+ (id)deserializeRecipe:(id)a3 error:(id *)a4;
+ (id)serializeRecipe:(id)a3;
+ (id)unarchivedStyleRecipeWithURL:(id)a3 error:(id *)a4;
@end

@implementation PIParallaxStyleRecipeArchiver

+ (id)_deserializeFilterDefinition:(id)a3 version:(unint64_t)a4 error:(id *)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8)
  {
    v33 = NUAssertLogger_10331();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      v34 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v34;
      _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v35 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v37 = NUAssertLogger_10331();
    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v38)
      {
        v46 = dispatch_get_specific(*v35);
        v47 = (void *)MEMORY[0x1E4F29060];
        id v48 = v46;
        v35 = [v47 callStackSymbols];
        v49 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v58 = (const void **)v46;
        __int16 v59 = 2114;
        v60 = v49;
        _os_log_error_impl(&dword_1A9680000, v37, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v38)
    {
      v39 = [MEMORY[0x1E4F29060] callStackSymbols];
      v35 = [v39 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v58 = v35;
      _os_log_error_impl(&dword_1A9680000, v37, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v43 = _NUAssertFailHandler();
    goto LABEL_64;
  }
  if (!a5)
  {
    v40 = NUAssertLogger_10331();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      v41 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v41;
      _os_log_error_impl(&dword_1A9680000, v40, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v35 = (const void **)MEMORY[0x1E4F7A308];
    v42 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v37 = NUAssertLogger_10331();
    int v43 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
    if (!v42)
    {
      if (v43)
      {
        v44 = [MEMORY[0x1E4F29060] callStackSymbols];
        v45 = [v44 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v58 = v45;
        _os_log_error_impl(&dword_1A9680000, v37, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_66;
    }
LABEL_64:
    if (v43)
    {
      v50 = dispatch_get_specific(*v35);
      v51 = (void *)MEMORY[0x1E4F29060];
      id v52 = v50;
      v53 = [v51 callStackSymbols];
      v54 = [v53 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v58 = (const void **)v50;
      __int16 v59 = 2114;
      v60 = v54;
      _os_log_error_impl(&dword_1A9680000, v37, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_66:

    _NUAssertFailHandler();
  }
  v9 = v8;
  if (a4)
  {
    uint64_t v10 = [v8 objectForKeyedSubscript:@"type"];
    if (!v10)
    {
      [MEMORY[0x1E4F7A438] missingError:@"Missing definition type" object:v9];
      v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_43;
    }
    v11 = (__CFString *)v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *a5 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid filter definition type" object:v11];

      v16 = 0;
      goto LABEL_43;
    }
    if ([(__CFString *)v11 isEqualToString:@"filter"])
    {
      v12 = @"filter";
LABEL_10:
      v14 = [v9 objectForKeyedSubscript:v12];
      if (v14)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v15 = [v9 objectForKeyedSubscript:@"parameters"];
          if (v15)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v56 = 0;
              v16 = [a1 _deserializeParameters:v15 version:a4 error:&v56];
              id v17 = v56;
              if (v16)
              {
                v18 = [[PIParallaxStyleFilterDefinition alloc] initWithFilterName:v14 parameters:v16];
LABEL_23:
                v19 = v18;
                goto LABEL_49;
              }
              v31 = (void *)MEMORY[0x1E4F7A438];
              v32 = @"Filed to deserialize filter parameters";
              goto LABEL_48;
            }
            v27 = (void *)MEMORY[0x1E4F7A438];
            v28 = @"Invalid filter parameters";
LABEL_39:
            v29 = [v27 invalidError:v28 object:v15];
            goto LABEL_40;
          }
          v25 = (void *)MEMORY[0x1E4F7A438];
          v26 = @"Missing filter parameters";
          goto LABEL_37;
        }
        v22 = (void *)MEMORY[0x1E4F7A438];
        v23 = @"Invalid filter name";
LABEL_32:
        v24 = [v22 invalidError:v23 object:v14];
        goto LABEL_33;
      }
      v20 = (void *)MEMORY[0x1E4F7A438];
      v21 = @"Missing filter name";
      goto LABEL_30;
    }
  }
  else
  {
    v11 = @"filter";
    v13 = @"filter";
    if ([@"filter" isEqualToString:@"filter"])
    {
      v12 = @"filterName";
      goto LABEL_10;
    }
  }
  if ([(__CFString *)v11 isEqualToString:@"stack"])
  {
    v14 = [v9 objectForKeyedSubscript:@"name"];
    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = [v9 objectForKeyedSubscript:@"filters"];
        if (v15)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v55 = 0;
            v16 = [a1 _deserializeFilterDefinitions:v15 version:a4 error:&v55];
            id v17 = v55;
            if (v16)
            {
              v18 = [[PIParallaxStyleFilterStackDefinition alloc] initWithStackName:v14 filters:v16];
              goto LABEL_23;
            }
            v31 = (void *)MEMORY[0x1E4F7A438];
            v32 = @"Failed to deserialize stack filters";
LABEL_48:
            [v31 errorWithCode:1 reason:v32 object:v15 underlyingError:v17];
            v19 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_49:

            if (v16)
            {
              v19 = v19;
              v16 = v19;
            }
            goto LABEL_42;
          }
          v27 = (void *)MEMORY[0x1E4F7A438];
          v28 = @"Invalid stack filters";
          goto LABEL_39;
        }
        v25 = (void *)MEMORY[0x1E4F7A438];
        v26 = @"Missing stack filters";
LABEL_37:
        v29 = [v25 missingError:v26 object:v9];
LABEL_40:
        *a5 = v29;

        goto LABEL_41;
      }
      v22 = (void *)MEMORY[0x1E4F7A438];
      v23 = @"Invalid stack name";
      goto LABEL_32;
    }
    v20 = (void *)MEMORY[0x1E4F7A438];
    v21 = @"Missing stack name";
LABEL_30:
    v24 = [v20 missingError:v21 object:v9];
LABEL_33:
    *a5 = v24;
LABEL_41:

    v19 = 0;
    v16 = 0;
    goto LABEL_42;
  }
  [MEMORY[0x1E4F7A438] invalidError:@"Unrecognized definition type" object:v11];
  v19 = 0;
  v16 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:

LABEL_43:
  return v16;
}

+ (id)_deserializeFilterDefinitions:(id)a3 version:(unint64_t)a4 error:(id *)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8)
  {
    v15 = NUAssertLogger_10331();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "serializedFilters != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v16;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v17 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v19 = NUAssertLogger_10331();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v28 = dispatch_get_specific(*v17);
        v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        v31 = [v29 callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v28;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v32;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
LABEL_18:
      v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v27;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
LABEL_24:

    _NUAssertFailHandler();
    __break(1u);
  }
  if (!a5)
  {
    v21 = NUAssertLogger_10331();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v22;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v23 = (const void **)MEMORY[0x1E4F7A308];
    v24 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v19 = NUAssertLogger_10331();
    BOOL v25 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!v24)
    {
      if (!v25) {
        goto LABEL_24;
      }
      goto LABEL_18;
    }
    if (v25)
    {
      v33 = dispatch_get_specific(*v23);
      v34 = (void *)MEMORY[0x1E4F29060];
      id v35 = v33;
      v36 = [v34 callStackSymbols];
      v37 = [v36 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v33;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v37;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_24;
  }
  v9 = v8;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v44 = __Block_byref_object_copy__10411;
  v45 = __Block_byref_object_dispose__10412;
  id v46 = 0;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __77__PIParallaxStyleRecipeArchiver__deserializeFilterDefinitions_version_error___block_invoke;
  v38[3] = &unk_1E5D7FBA0;
  v40 = buf;
  id v41 = a1;
  unint64_t v42 = a4;
  id v11 = v10;
  id v39 = v11;
  [v9 enumerateObjectsUsingBlock:v38];
  v12 = *(void **)(*(void *)&buf[8] + 40);
  if (v12)
  {
    id v13 = 0;
    *a5 = v12;
  }
  else
  {
    id v13 = v11;
  }

  _Block_object_dispose(buf, 8);
  return v13;
}

void __77__PIParallaxStyleRecipeArchiver__deserializeFilterDefinitions_version_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = *(void **)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    v9 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id obj = 0;
    id v10 = [v7 _deserializeFilterDefinition:v6 version:v8 error:&obj];

    objc_storeStrong(v9, obj);
    if (v10) {
      [*(id *)(a1 + 32) addObject:v10];
    }
    else {
      *a4 = 1;
    }
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid definition dictionary" object:v6];

    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    *a4 = 1;
  }
}

+ (id)_serializeDefinition:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [v4 type];
  [v5 setObject:v6 forKeyedSubscript:@"type"];

  v7 = [v4 type];
  int v8 = [v7 isEqualToString:@"filter"];

  if (v8)
  {
    id v9 = v4;
    id v10 = [v9 filterName];
    [v5 setObject:v10 forKeyedSubscript:@"filter"];

    uint64_t v11 = [v9 parameters];

    uint64_t v12 = [a1 _serializeParameters:v11];
    id v13 = @"parameters";
LABEL_5:
    [v5 setObject:v12 forKeyedSubscript:v13];

    return v5;
  }
  v14 = [v4 type];
  int v15 = [v14 isEqualToString:@"stack"];

  if (v15)
  {
    id v16 = v4;
    id v17 = [v16 stackName];
    [v5 setObject:v17 forKeyedSubscript:@"name"];

    uint64_t v11 = [v16 filters];

    uint64_t v12 = [a1 _serializeFilters:v11];
    id v13 = @"filters";
    goto LABEL_5;
  }
  v19 = NUAssertLogger_10331();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    BOOL v20 = NSString;
    v21 = [v4 type];
    v22 = [v20 stringWithFormat:@"Unknown definition type: %@", v21];
    *(_DWORD *)buf = 138543362;
    BOOL v38 = v22;
    _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  v23 = (const void **)MEMORY[0x1E4F7A308];
  specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
  BOOL v25 = NUAssertLogger_10331();
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
  if (specific)
  {
    if (v26)
    {
      v29 = dispatch_get_specific(*v23);
      id v30 = (void *)MEMORY[0x1E4F29060];
      id v31 = v29;
      v32 = [v30 callStackSymbols];
      v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      BOOL v38 = v29;
      __int16 v39 = 2114;
      v40 = v33;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else if (v26)
  {
    v27 = [MEMORY[0x1E4F29060] callStackSymbols];
    v28 = [v27 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    BOOL v38 = v28;
    _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
  }
  [v4 type];
  objc_claimAutoreleasedReturnValue();
  v34 = (void *)_NUAssertFailHandler();
  return +[PIParallaxStyleRecipeArchiver _serializeFilters:v36];
}

+ (id)_serializeFilters:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__PIParallaxStyleRecipeArchiver__serializeFilters___block_invoke;
  v9[3] = &unk_1E5D7FB78;
  id v11 = a1;
  id v7 = v6;
  id v10 = v7;
  [v5 enumerateObjectsUsingBlock:v9];

  return v7;
}

void __51__PIParallaxStyleRecipeArchiver__serializeFilters___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 40) _serializeDefinition:a2];
  [*(id *)(a1 + 32) addObject:v3];
}

+ (id)_deserializeParameter:(id)a3 version:(unint64_t)a4 error:(id *)a5
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    __int16 v59 = NUAssertLogger_10331();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      v60 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v100 = v60;
      _os_log_error_impl(&dword_1A9680000, v59, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v61 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v63 = NUAssertLogger_10331();
    BOOL v64 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v64)
      {
        v72 = dispatch_get_specific(*v61);
        v73 = (void *)MEMORY[0x1E4F29060];
        id v74 = v72;
        uint64_t v61 = [v73 callStackSymbols];
        v75 = [v61 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v100 = (const void **)v72;
        __int16 v101 = 2114;
        v102 = v75;
        _os_log_error_impl(&dword_1A9680000, v63, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v64)
    {
      v65 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v61 = [v65 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v100 = v61;
      _os_log_error_impl(&dword_1A9680000, v63, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v69 = _NUAssertFailHandler();
    goto LABEL_118;
  }
  if (!a5)
  {
    v66 = NUAssertLogger_10331();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      v67 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v100 = v67;
      _os_log_error_impl(&dword_1A9680000, v66, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v61 = (const void **)MEMORY[0x1E4F7A308];
    v68 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v63 = NUAssertLogger_10331();
    int v69 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);
    if (!v68)
    {
      if (v69)
      {
        v70 = [MEMORY[0x1E4F29060] callStackSymbols];
        v71 = [v70 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v100 = v71;
        _os_log_error_impl(&dword_1A9680000, v63, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_120;
    }
LABEL_118:
    if (v69)
    {
      v76 = dispatch_get_specific(*v61);
      v77 = (void *)MEMORY[0x1E4F29060];
      id v78 = v76;
      v79 = [v77 callStackSymbols];
      v80 = [v79 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v100 = (const void **)v76;
      __int16 v101 = 2114;
      v102 = v80;
      _os_log_error_impl(&dword_1A9680000, v63, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_120:

    _NUAssertFailHandler();
  }
  int v8 = v7;
  id v9 = [v7 objectForKeyedSubscript:@"type"];
  if (!v9)
  {
    id v17 = [MEMORY[0x1E4F7A438] missingError:@"Missing parameter type" object:v8];
LABEL_20:
    id v16 = 0;
    *a5 = v17;
    goto LABEL_97;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = (void *)MEMORY[0x1E4F7A438];
    v19 = @"Invalid parameter type";
LABEL_19:
    id v17 = [v18 invalidError:v19 object:v9];
    goto LABEL_20;
  }
  if ([v9 isEqualToString:@"number"])
  {
    id v10 = [v8 objectForKeyedSubscript:@"value"];
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = @"none";
        uint64_t v12 = @"none";
        if (a4 < 3)
        {
LABEL_14:
          id v16 = [[PIParallaxStyleNumberParameter alloc] initWithNumber:v10 unit:v11];
LABEL_15:

LABEL_16:
          goto LABEL_97;
        }
        id v13 = [v8 objectForKeyedSubscript:@"unit"];
        if (!v13)
        {
LABEL_13:

          goto LABEL_14;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v97[0] = @"none";
          v97[1] = @"pixels";
          v98[0] = @"none";
          v98[1] = @"pixels";
          v97[2] = @"degrees";
          v97[3] = @"count";
          v98[2] = @"degrees";
          v98[3] = @"count";
          v97[4] = @"logic";
          v97[5] = &stru_1EFFD8610;
          v98[4] = @"logic";
          v98[5] = @"none";
          v97[6] = @"px";
          v97[7] = @"deg";
          v98[6] = @"pixels";
          v98[7] = @"degrees";
          v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v97 count:8];
          uint64_t v15 = [(__CFString *)v14 objectForKey:v13];

          if (v15)
          {

            id v11 = (__CFString *)v15;
            goto LABEL_13;
          }
          v50 = [MEMORY[0x1E4F7A438] unknownError:@"Unknown unit value" object:v13];
        }
        else
        {
          v50 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid unit value" object:v13];
          v14 = @"none";
        }
        *a5 = v50;

LABEL_102:
        goto LABEL_95;
      }
      __int16 v39 = (void *)MEMORY[0x1E4F7A438];
      v40 = @"Expected a number value";
      goto LABEL_93;
    }
    v37 = (void *)MEMORY[0x1E4F7A438];
    BOOL v38 = @"Missing number value";
LABEL_91:
    v53 = [v37 missingError:v38 object:v8];
LABEL_94:
    *a5 = v53;
LABEL_95:

    goto LABEL_96;
  }
  if ([v9 isEqualToString:@"color"])
  {
    id v10 = [v8 objectForKeyedSubscript:@"value"];
    if (!v10)
    {
      v37 = (void *)MEMORY[0x1E4F7A438];
      BOOL v38 = @"Missing color values";
      goto LABEL_91;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v20 = [v10 count];
      if (a4 < 5)
      {
        if (v20 == 3)
        {
          long long v88 = 0u;
          long long v89 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          id v13 = v10;
          uint64_t v43 = [v13 countByEnumeratingWithState:&v86 objects:v95 count:16];
          if (v43)
          {
            uint64_t v44 = v43;
            uint64_t v45 = *(void *)v87;
            while (2)
            {
              for (uint64_t i = 0; i != v44; ++i)
              {
                if (*(void *)v87 != v45) {
                  objc_enumerationMutation(v13);
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v51 = (void *)MEMORY[0x1E4F7A438];
                  id v52 = @"Expected 3 numbers";
LABEL_89:
                  *a5 = [v51 mismatchError:v52 object:v8];
                  goto LABEL_102;
                }
              }
              uint64_t v44 = [v13 countByEnumeratingWithState:&v86 objects:v95 count:16];
              if (v44) {
                continue;
              }
              break;
            }
          }

          uint64_t v47 = [PIParallaxStyleColorParameter alloc];
          BOOL v26 = [v13 objectAtIndexedSubscript:0];
          v27 = [v13 objectAtIndexedSubscript:1];
          v28 = [v13 objectAtIndexedSubscript:2];
          id v16 = [(PIParallaxStyleColorParameter *)v47 initWithRed:v26 green:v27 blue:v28 alpha:&unk_1F000A488];
          goto LABEL_74;
        }
        __int16 v39 = (void *)MEMORY[0x1E4F7A438];
        v40 = @"Expected 3 color values";
      }
      else
      {
        if (v20 == 4)
        {
          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          id v13 = v10;
          uint64_t v21 = [v13 countByEnumeratingWithState:&v90 objects:v96 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v91;
            while (2)
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v91 != v23) {
                  objc_enumerationMutation(v13);
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v51 = (void *)MEMORY[0x1E4F7A438];
                  id v52 = @"Expected 4 numbers";
                  goto LABEL_89;
                }
              }
              uint64_t v22 = [v13 countByEnumeratingWithState:&v90 objects:v96 count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }

          BOOL v25 = [PIParallaxStyleColorParameter alloc];
          BOOL v26 = [v13 objectAtIndexedSubscript:0];
          v27 = [v13 objectAtIndexedSubscript:1];
          v28 = [v13 objectAtIndexedSubscript:2];
          v29 = [v13 objectAtIndexedSubscript:3];
          id v16 = [(PIParallaxStyleColorParameter *)v25 initWithRed:v26 green:v27 blue:v28 alpha:v29];

LABEL_74:
          goto LABEL_16;
        }
        __int16 v39 = (void *)MEMORY[0x1E4F7A438];
        v40 = @"Expected 4 color values";
      }
    }
    else
    {
      __int16 v39 = (void *)MEMORY[0x1E4F7A438];
      v40 = @"Expected color values";
    }
LABEL_93:
    v53 = [v39 mismatchError:v40 object:v8];
    goto LABEL_94;
  }
  if (![v9 isEqualToString:@"point"])
  {
    if ([v9 isEqualToString:@"mode"])
    {
      id v10 = [v8 objectForKeyedSubscript:@"value"];
      if (!v10)
      {
        v37 = (void *)MEMORY[0x1E4F7A438];
        BOOL v38 = @"Missing mode value";
        goto LABEL_91;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        __int16 v39 = (void *)MEMORY[0x1E4F7A438];
        v40 = @"Expected mode value";
        goto LABEL_93;
      }
      uint64_t v41 = [[PIParallaxStyleModeParameter alloc] initWithMode:v10];
LABEL_62:
      id v16 = (PIParallaxStyleNumberParameter *)v41;
      goto LABEL_16;
    }
    if ([v9 isEqualToString:@"binding"])
    {
      id v10 = [v8 objectForKeyedSubscript:@"value"];
      if (!v10)
      {
        v37 = (void *)MEMORY[0x1E4F7A438];
        BOOL v38 = @"Missing binding value";
        goto LABEL_91;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        __int16 v39 = (void *)MEMORY[0x1E4F7A438];
        v40 = @"Expected binding value";
        goto LABEL_93;
      }
      uint64_t v41 = [[PIParallaxStyleBindingParameter alloc] initWithVariableName:v10];
      goto LABEL_62;
    }
    v18 = (void *)MEMORY[0x1E4F7A438];
    v19 = @"Unrecognized parameter type";
    goto LABEL_19;
  }
  id v30 = [v8 objectForKeyedSubscript:@"value"];
  if (!v30)
  {
    unint64_t v42 = [MEMORY[0x1E4F7A438] missingError:@"Missing point values" object:v8];
    goto LABEL_82;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v48 = (void *)MEMORY[0x1E4F7A438];
    v49 = @"Expected point values";
LABEL_81:
    unint64_t v42 = [v48 mismatchError:v49 object:v8];
LABEL_82:
    *a5 = v42;
LABEL_83:

    goto LABEL_96;
  }
  if ([v30 count] != 2)
  {
    id v48 = (void *)MEMORY[0x1E4F7A438];
    v49 = @"Expected 2 point values";
    goto LABEL_81;
  }
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obj = v30;
  uint64_t v31 = [obj countByEnumeratingWithState:&v82 objects:v94 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v83;
    while (2)
    {
      for (uint64_t k = 0; k != v32; ++k)
      {
        if (*(void *)v83 != v33) {
          objc_enumerationMutation(obj);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          *a5 = [MEMORY[0x1E4F7A438] mismatchError:@"Expected 2 numbers" object:v8];

          goto LABEL_83;
        }
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v82 objects:v94 count:16];
      if (v32) {
        continue;
      }
      break;
    }
  }

  id v11 = [v8 objectForKeyedSubscript:@"unit"];
  if (!v11)
  {
    id v36 = @"none";
    goto LABEL_104;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v36 = v11;
  if (isKindOfClass)
  {
LABEL_104:
    id v55 = v36;
    id v56 = [PIParallaxStylePointParameter alloc];
    id v10 = obj;
    v57 = [obj objectAtIndexedSubscript:0];
    v58 = [obj objectAtIndexedSubscript:1];
    id v16 = [(PIParallaxStylePointParameter *)v56 initWithX:v57 Y:v58 unit:v55];

    goto LABEL_15;
  }
  *a5 = [MEMORY[0x1E4F7A438] mismatchError:@"Invalid unit value" object:v11];

LABEL_96:
  id v16 = 0;
LABEL_97:

  return v16;
}

+ (id)_deserializeParameters:(id)a3 version:(unint64_t)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!a5)
  {
    uint64_t v15 = NUAssertLogger_10331();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v16;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v17 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v19 = NUAssertLogger_10331();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        uint64_t v23 = dispatch_get_specific(*v17);
        v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        BOOL v26 = [v24 callStackSymbols];
        v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v27;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      uint64_t v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v22;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    __break(1u);
  }
  id v9 = v8;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v34 = __Block_byref_object_copy__10411;
  SEL v35 = __Block_byref_object_dispose__10412;
  id v36 = 0;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __70__PIParallaxStyleRecipeArchiver__deserializeParameters_version_error___block_invoke;
  v28[3] = &unk_1E5D7FB50;
  id v30 = buf;
  id v31 = a1;
  unint64_t v32 = a4;
  id v11 = v10;
  id v29 = v11;
  [v9 enumerateKeysAndObjectsUsingBlock:v28];
  uint64_t v12 = *(void **)(*(void *)&buf[8] + 40);
  if (v12)
  {
    id v13 = 0;
    *a5 = v12;
  }
  else
  {
    id v13 = v11;
  }

  _Block_object_dispose(buf, 8);
  return v13;
}

void __70__PIParallaxStyleRecipeArchiver__deserializeParameters_version_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = (void *)MEMORY[0x1E4F7A438];
    v14 = @"Invalid parameter name";
    id v15 = v7;
LABEL_7:
    uint64_t v16 = [v13 invalidError:v14 object:v15];
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    *a4 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = (void *)MEMORY[0x1E4F7A438];
    v14 = @"Invalid parameter dictionary";
    id v15 = v8;
    goto LABEL_7;
  }
  id v9 = *(void **)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  id v11 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id obj = 0;
  uint64_t v12 = [v9 _deserializeParameter:v8 version:v10 error:&obj];
  objc_storeStrong(v11, obj);
  if (v12) {
    [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v7];
  }
  else {
    *a4 = 1;
  }

LABEL_10:
}

+ (id)_serializeParameter:(id)a3
{
  v53[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = [v3 type];
  [v4 setObject:v5 forKeyedSubscript:@"type"];

  id v6 = [v3 type];
  int v7 = [v6 isEqualToString:@"number"];

  if (v7)
  {
    id v8 = v3;
    id v9 = [v8 numberValue];
    [v4 setObject:v9 forKeyedSubscript:@"value"];
    goto LABEL_7;
  }
  uint64_t v10 = [v3 type];
  int v11 = [v10 isEqualToString:@"color"];

  if (v11)
  {
    id v12 = v3;
    id v8 = [v12 redValue];
    v53[0] = v8;
    id v13 = [v12 greenValue];
    v53[1] = v13;
    v14 = [v12 blueValue];
    v53[2] = v14;
    id v15 = [v12 alphaValue];

    v53[3] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:4];
    [v4 setObject:v16 forKeyedSubscript:@"value"];

LABEL_14:
    return v4;
  }
  uint64_t v17 = [v3 type];
  int v18 = [v17 isEqualToString:@"point"];

  if (v18)
  {
    id v8 = v3;
    id v9 = [v8 xValue];
    v52[0] = v9;
    v19 = [v8 yValue];
    v52[1] = v19;
    BOOL v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
    [v4 setObject:v20 forKeyedSubscript:@"value"];

LABEL_7:
    uint64_t v21 = [v8 unit];
    char v22 = [v21 isEqual:@"none"];

    if ((v22 & 1) == 0)
    {
      uint64_t v23 = [v8 unit];
      [v4 setObject:v23 forKeyedSubscript:@"unit"];
    }
    goto LABEL_14;
  }
  v24 = [v3 type];
  int v25 = [v24 isEqualToString:@"mode"];

  if (v25)
  {
    uint64_t v26 = [v3 modeValue];
LABEL_13:
    id v8 = (id)v26;
    [v4 setObject:v26 forKeyedSubscript:@"value"];
    goto LABEL_14;
  }
  v27 = [v3 type];
  int v28 = [v27 isEqualToString:@"binding"];

  if (v28)
  {
    uint64_t v26 = [v3 variableName];
    goto LABEL_13;
  }
  id v30 = NUAssertLogger_10331();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    id v31 = NSString;
    unint64_t v32 = [v3 type];
    uint64_t v33 = [v31 stringWithFormat:@"Unknown parameter type: %@", v32];
    *(_DWORD *)buf = 138543362;
    v49 = v33;
    _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  v34 = (const void **)MEMORY[0x1E4F7A308];
  specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
  id v36 = NUAssertLogger_10331();
  BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
  if (specific)
  {
    if (v37)
    {
      v40 = dispatch_get_specific(*v34);
      uint64_t v41 = (void *)MEMORY[0x1E4F29060];
      id v42 = v40;
      uint64_t v43 = [v41 callStackSymbols];
      uint64_t v44 = [v43 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v49 = v40;
      __int16 v50 = 2114;
      v51 = v44;
      _os_log_error_impl(&dword_1A9680000, v36, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else if (v37)
  {
    BOOL v38 = [MEMORY[0x1E4F29060] callStackSymbols];
    __int16 v39 = [v38 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v49 = v39;
    _os_log_error_impl(&dword_1A9680000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
  }
  [v3 type];
  objc_claimAutoreleasedReturnValue();
  uint64_t v45 = (void *)_NUAssertFailHandler();
  return +[PIParallaxStyleRecipeArchiver _serializeParameters:v47];
}

+ (id)_serializeParameters:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __54__PIParallaxStyleRecipeArchiver__serializeParameters___block_invoke;
  id v13 = &unk_1E5D7FB28;
  id v14 = v6;
  id v15 = a1;
  id v7 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:&v10];

  id v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);
  return v8;
}

void __54__PIParallaxStyleRecipeArchiver__serializeParameters___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 _serializeParameter:a3];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

+ (id)deserializeRecipe:(id)a3 error:(id *)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = a3;
  if (!a4)
  {
    v27 = NUAssertLogger_10331();
    v19 = "error != NULL";
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      int v28 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v47 = v28;
      _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v16 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v11 = NUAssertLogger_10331();
    BOOL v29 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        specific = dispatch_get_specific(*v16);
        SEL v35 = (void *)MEMORY[0x1E4F29060];
        a4 = specific;
        uint64_t v16 = [v35 callStackSymbols];
        id v4 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v47 = (const void **)specific;
        __int16 v48 = 2114;
        v49 = v4;
        _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      specific = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v16 = [specific componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v47 = v16;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v32 = _NUAssertFailHandler();
    goto LABEL_64;
  }
  uint64_t v11 = v10;
  if (!v10)
  {
    id v30 = NUAssertLogger_10331();
    v19 = "dictionary != nil";
    a4 = (id *)&unk_1A980A000;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      id v31 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v47 = v31;
      _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v16 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v11 = NUAssertLogger_10331();
    int v32 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v32)
      {
        specific = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v16 = [specific componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        id v47 = v16;
        _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_66:

      BOOL v37 = v19;
      _NUAssertFailHandler();
LABEL_67:
      uint64_t v33 = objc_msgSend(MEMORY[0x1E4F7A438], "errorWithCode:reason:object:underlyingError:", 1, @"Failed to deserialize matte filters", v4, a1, v37);
      id v39 = a1;
      goto LABEL_50;
    }
LABEL_64:
    if (v32)
    {
      specific = dispatch_get_specific(*v16);
      id v36 = (void *)MEMORY[0x1E4F29060];
      a4 = specific;
      uint64_t v16 = [v36 callStackSymbols];
      id v4 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      id v47 = (const void **)specific;
      __int16 v48 = 2114;
      v49 = v4;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_66;
  }
  specific = [v10 objectForKeyedSubscript:@"version"];
  if (specific)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v14 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid version info" object:specific];
      goto LABEL_22;
    }
  }
  unint64_t v13 = [specific unsignedIntegerValue];
  if (v13 >= 6)
  {
    id v14 = [MEMORY[0x1E4F7A438] unsupportedError:@"Unsupported version" object:specific];
LABEL_22:
    char v22 = 0;
    *a4 = v14;
    goto LABEL_58;
  }
  unint64_t v15 = v13;
  uint64_t v16 = [v11 objectForKeyedSubscript:@"parameters"];
  if (v16)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v45 = 0;
      uint64_t v17 = [a1 _deserializeParameters:v16 version:v15 error:&v45];
      id v18 = v45;
      if (!v17)
      {
        [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to deserialize recipe parameters" object:v16 underlyingError:v18];
        char v22 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_56:

        goto LABEL_57;
      }
      v19 = [v11 objectForKeyedSubscript:@"foreground"];
      if (v19)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v41 = v17;
          id v44 = 0;
          id v5 = [a1 _deserializeFilterDefinitions:v19 version:v15 error:&v44];
          id v20 = v44;

          v40 = v5;
          if (!v5)
          {
            [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to deserialize foreground filters" object:v19 underlyingError:v20];
            char v22 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            id v5 = 0;
LABEL_54:

            id v18 = v20;
            uint64_t v17 = v41;
            goto LABEL_55;
          }
          id v6 = [v11 objectForKeyedSubscript:@"background"];
          if (v6)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v43 = 0;
              uint64_t v21 = [a1 _deserializeFilterDefinitions:v6 version:v15 error:&v43];
              id v39 = v43;

              BOOL v38 = (void *)v21;
              if (!v21)
              {
                id v20 = v39;
                [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to deserialize background filters" object:v6 underlyingError:v39];
                char v22 = 0;
                *a4 = (id)objc_claimAutoreleasedReturnValue();
                id v5 = v40;
                uint64_t v26 = 0;
LABEL_52:

                goto LABEL_53;
              }
              if (v15 < 2)
              {
                id v7 = (void *)MEMORY[0x1E4F1CBF0];
                id v5 = v40;
                goto LABEL_36;
              }
              id v4 = [v11 objectForKeyedSubscript:@"matte"];
              if (v4)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v42 = 0;
                  id v7 = [a1 _deserializeFilterDefinitions:v4 version:v15 error:&v42];
                  a1 = v42;

                  id v5 = v40;
                  if (v7)
                  {

                    id v39 = a1;
LABEL_36:
                    uint64_t v26 = v38;
                    char v22 = [[PIParallaxStyleRecipe alloc] initWithParameters:v41 foregroundFilters:v5 backgroundFilters:v38 matteFilters:v7];
LABEL_51:

                    id v20 = v39;
                    goto LABEL_52;
                  }
                  goto LABEL_67;
                }
                uint64_t v33 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid matte filters dictionary" object:v4];
              }
              else
              {
                uint64_t v33 = [MEMORY[0x1E4F7A438] missingError:@"Missing matte filters" object:v11];
              }
              id v7 = (void *)MEMORY[0x1E4F1CBF0];
              id v5 = v40;
LABEL_50:
              *a4 = v33;

              char v22 = 0;
              uint64_t v26 = v38;
              goto LABEL_51;
            }
            int v25 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid background filters dictionary" object:v6];
          }
          else
          {
            int v25 = [MEMORY[0x1E4F7A438] missingError:@"Missing background filters" object:v11];
          }
          char v22 = 0;
          *a4 = v25;
LABEL_53:

          goto LABEL_54;
        }
        v24 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid foreground filters dictionary" object:v19];
      }
      else
      {
        v24 = [MEMORY[0x1E4F7A438] missingError:@"Missing foreground filters" object:v11];
      }
      char v22 = 0;
      *a4 = v24;
LABEL_55:

      goto LABEL_56;
    }
    uint64_t v23 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid recipe parameters" object:v16];
  }
  else
  {
    uint64_t v23 = [MEMORY[0x1E4F7A438] missingError:@"Missing recipe parameters" object:v11];
  }
  char v22 = 0;
  *a4 = v23;
LABEL_57:

LABEL_58:
  return v22;
}

+ (id)unarchivedStyleRecipeWithURL:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    unint64_t v13 = NUAssertLogger_10331();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "fileURL != nil");
      id v14 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v36 = v14;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    unint64_t v15 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v17 = NUAssertLogger_10331();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        uint64_t v26 = dispatch_get_specific(*v15);
        v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        unint64_t v15 = [v27 callStackSymbols];
        BOOL v29 = [v15 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v36 = (const void **)v26;
        __int16 v37 = 2114;
        BOOL v38 = v29;
        _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      unint64_t v15 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v36 = v15;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v23 = _NUAssertFailHandler();
    goto LABEL_25;
  }
  if (!a4)
  {
    id v20 = NUAssertLogger_10331();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      uint64_t v21 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v36 = v21;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    unint64_t v15 = (const void **)MEMORY[0x1E4F7A308];
    char v22 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v17 = NUAssertLogger_10331();
    int v23 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (!v22)
    {
      if (v23)
      {
        v24 = [MEMORY[0x1E4F29060] callStackSymbols];
        int v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        id v36 = v25;
        _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_27;
    }
LABEL_25:
    if (v23)
    {
      id v30 = dispatch_get_specific(*v15);
      id v31 = (void *)MEMORY[0x1E4F29060];
      id v32 = v30;
      uint64_t v33 = [v31 callStackSymbols];
      v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      id v36 = (const void **)v30;
      __int16 v37 = 2114;
      BOOL v38 = v34;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_27:

    _NUAssertFailHandler();
  }
  id v7 = v6;
  id v8 = [MEMORY[0x1E4F1CA10] inputStreamWithURL:v6];
  id v9 = v8;
  if (v8)
  {
    [v8 open];
    uint64_t v10 = [MEMORY[0x1E4F28F98] propertyListWithStream:v9 options:0 format:0 error:a4];
    if (v10)
    {
      uint64_t v11 = [a1 deserializeRecipe:v10 error:a4];
    }
    else
    {
      uint64_t v11 = 0;
    }
    [v9 close];
  }
  else
  {
    [MEMORY[0x1E4F7A438] failureError:@"Failed to open recipe source file" object:v7];
    uint64_t v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (id)serializeRecipe:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v16 = NUAssertLogger_10331();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "recipe != nil");
      *(_DWORD *)buf = 138543362;
      id v32 = v17;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v18 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v20 = NUAssertLogger_10331();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific(*v18);
        int v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        v27 = [v25 callStackSymbols];
        id v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v32 = v24;
        __int16 v33 = 2114;
        v34 = v28;
        _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      char v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v32 = v23;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v5 = v4;
  v30[0] = &unk_1F0009B48;
  v29[0] = @"version";
  v29[1] = @"parameters";
  id v6 = [v4 parameters];
  id v7 = [a1 _serializeParameters:v6];
  v30[1] = v7;
  v29[2] = @"foreground";
  id v8 = [v5 foregroundFilters];
  id v9 = [a1 _serializeFilters:v8];
  v30[2] = v9;
  v29[3] = @"background";
  uint64_t v10 = [v5 backgroundFilters];
  uint64_t v11 = [a1 _serializeFilters:v10];
  v30[3] = v11;
  v29[4] = @"matte";
  id v12 = [v5 matteFilters];
  unint64_t v13 = [a1 _serializeFilters:v12];
  v30[4] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:5];

  return v14;
}

+ (BOOL)writeRecipe:(id)a3 toURL:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    uint64_t v17 = NUAssertLogger_10331();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      BOOL v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      id v31 = v18;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v19 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v21 = NUAssertLogger_10331();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        int v25 = dispatch_get_specific(*v19);
        id v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        id v28 = [v26 callStackSymbols];
        BOOL v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v31 = v25;
        __int16 v32 = 2114;
        __int16 v33 = v29;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      int v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v31 = v24;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  uint64_t v10 = v9;
  uint64_t v11 = [a1 serializeRecipe:v8];
  id v12 = [MEMORY[0x1E4F1CAA8] outputStreamWithURL:v10 append:0];
  unint64_t v13 = v12;
  if (v12)
  {
    [v12 open];
    uint64_t v14 = [MEMORY[0x1E4F28F98] writePropertyList:v11 toStream:v13 format:100 options:0 error:a5];
    [v13 close];
    BOOL v15 = v14 > 0;
  }
  else
  {
    [MEMORY[0x1E4F7A438] failureError:@"Failed to open recipe destination file" object:v10];
    BOOL v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

@end