@interface PIParallaxStyleFilterDefinition
- (BOOL)isEqualToParallaxStyleDefinition:(id)a3;
- (BOOL)isEqualToParallaxStyleFilterDefinition:(id)a3;
- (NSDictionary)parameters;
- (NSString)filterName;
- (PIParallaxStyleFilterDefinition)init;
- (PIParallaxStyleFilterDefinition)initWithFilterName:(id)a3 parameters:(id)a4;
- (id)description;
- (id)evaluateWithContext:(id)a3 error:(id *)a4;
- (id)type;
@end

@implementation PIParallaxStyleFilterDefinition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_filterName, 0);
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (NSString)filterName
{
  return self->_filterName;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PIParallaxStyleFilterDefinition *)self filterName];
  v6 = [(PIParallaxStyleFilterDefinition *)self parameters];
  v7 = [v3 stringWithFormat:@"<%@:%p filter:%@ parameters: %@>", v4, self, v5, v6];

  return v7;
}

- (id)evaluateWithContext:(id)a3 error:(id *)a4
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v64 = NUAssertLogger_14042();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      v65 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "context != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v65;
      _os_log_error_impl(&dword_1A9680000, v64, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v66 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v68 = NUAssertLogger_14042();
    BOOL v69 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v69)
      {
        v77 = dispatch_get_specific(*v66);
        v78 = (void *)MEMORY[0x1E4F29060];
        id v79 = v77;
        v80 = [v78 callStackSymbols];
        v81 = [v80 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v77;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v81;
        _os_log_error_impl(&dword_1A9680000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v69)
    {
LABEL_48:
      v75 = [MEMORY[0x1E4F29060] callStackSymbols];
      v76 = [v75 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v76;
      _os_log_error_impl(&dword_1A9680000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
LABEL_54:

    _NUAssertFailHandler();
    __break(1u);
  }
  if (!a4)
  {
    v70 = NUAssertLogger_14042();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      v71 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v71;
      _os_log_error_impl(&dword_1A9680000, v70, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v72 = (const void **)MEMORY[0x1E4F7A308];
    v73 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v68 = NUAssertLogger_14042();
    BOOL v74 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (!v73)
    {
      if (!v74) {
        goto LABEL_54;
      }
      goto LABEL_48;
    }
    if (v74)
    {
      v82 = dispatch_get_specific(*v72);
      v83 = (void *)MEMORY[0x1E4F29060];
      id v84 = v82;
      v85 = [v83 callStackSymbols];
      v86 = [v85 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v82;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v86;
      _os_log_error_impl(&dword_1A9680000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_54;
  }
  v7 = v6;
  v8 = (void *)MEMORY[0x1E4F1E040];
  v9 = [(PIParallaxStyleFilterDefinition *)self filterName];
  v10 = [v8 filterWithName:v9];

  if (!v10)
  {
    v17 = (void *)MEMORY[0x1E4F7A438];
    v18 = [(PIParallaxStyleFilterDefinition *)self filterName];
    *a4 = [v17 invalidError:@"Unknown filter" object:v18];

    v19 = 0;
    goto LABEL_30;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v92 = __Block_byref_object_copy__14055;
  v93 = __Block_byref_object_dispose__14056;
  id v94 = 0;
  v11 = [(PIParallaxStyleFilterDefinition *)self parameters];
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __61__PIParallaxStyleFilterDefinition_evaluateWithContext_error___block_invoke;
  v87[3] = &unk_1E5D80288;
  id v12 = v10;
  id v88 = v12;
  id v13 = v7;
  id v89 = v13;
  v90 = buf;
  [v11 enumerateKeysAndObjectsUsingBlock:v87];

  if (*(void *)(*(void *)&buf[8] + 40))
  {
    v14 = (void *)MEMORY[0x1E4F7A438];
    id v15 = [(PIParallaxStyleFilterDefinition *)self parameters];
    id v16 = [v14 errorWithCode:1 reason:@"Failed to evaluate filter parameters" object:v15 underlyingError:*(void *)(*(void *)&buf[8] + 40)];
  }
  else
  {
    v20 = [v12 name];
    int v21 = [v20 containsString:@"Local"];

    v22 = [v12 inputKeys];
    uint64_t v23 = *MEMORY[0x1E4F1E480];
    int v24 = [v22 containsObject:*MEMORY[0x1E4F1E480]];

    if (v24)
    {
      v25 = [v13 outputImage];
      if (v21)
      {
        v26 = [v13 inputImage];
        [v26 extent];
        uint64_t v27 = objc_msgSend(v25, "imageByCroppingToRect:");

        v25 = (void *)v27;
      }
      [v12 setValue:v25 forKey:v23];
    }
    v28 = [v12 inputKeys];
    uint64_t v29 = *MEMORY[0x1E4F1E418];
    int v30 = [v28 containsObject:*MEMORY[0x1E4F1E418]];

    if (v30)
    {
      v31 = [v13 inputImage];
      [v12 setValue:v31 forKey:v29];
    }
    v32 = [v12 inputKeys];
    uint64_t v33 = *MEMORY[0x1E4F1E4F8];
    int v34 = [v32 containsObject:*MEMORY[0x1E4F1E4F8]];

    if (v34)
    {
      v35 = [v13 guideImage];
      [v12 setValue:v35 forKey:v33];
    }
    v36 = [v12 inputKeys];
    uint64_t v37 = *MEMORY[0x1E4F1E478];
    int v38 = [v36 containsObject:*MEMORY[0x1E4F1E478]];

    if (v38)
    {
      v39 = (void *)MEMORY[0x1E4F1E080];
      v40 = [v13 inputImage];
      [v40 extent];
      v41 = objc_msgSend(v39, "vectorWithCGRect:");
      [v12 setValue:v41 forKey:v37];
    }
    v42 = [v12 inputKeys];
    uint64_t v43 = *MEMORY[0x1E4F1E4A0];
    int v44 = [v42 containsObject:*MEMORY[0x1E4F1E4A0]];

    if (v44)
    {
      v45 = [v13 matteImage];
      [v12 setValue:v45 forKey:v43];
    }
    v46 = [v12 inputKeys];
    uint64_t v47 = *MEMORY[0x1E4F1E498];
    int v48 = [v46 containsObject:*MEMORY[0x1E4F1E498]];

    if (v48)
    {
      v49 = [v13 matteImage];
      [v12 setValue:v49 forKey:v47];
    }
    v50 = [v12 inputKeys];
    int v51 = [v50 containsObject:@"inputLightMapImage"];

    if (v51)
    {
      v52 = [v13 lightMapImage];
      [v12 setValue:v52 forKey:@"inputLightMapImage"];
    }
    v53 = [v12 inputKeys];
    int v54 = [v53 containsObject:@"inputTargetBackgroundImage"];

    if (v54)
    {
      v55 = [v13 backgroundImage];
      [v12 setValue:v55 forKey:@"inputTargetBackgroundImage"];
    }
    v56 = [v12 outputImage];
    id v15 = v56;
    if (v56)
    {
      [v56 extent];
      if (!CGRectIsEmpty(v97))
      {
        if (v21)
        {
          v58 = [v13 cache];
          if (v58)
          {
            v59 = [v12 name];
            int v60 = [v59 isEqualToString:@"CILocalContrast"];

            if (v60)
            {
              v61 = [v13 cache];
              uint64_t v62 = [v61 cachedImage:v15 forKey:@"LocalContrast"];

              id v15 = (id)v62;
            }
          }
          uint64_t v63 = [v15 imageByClampingToExtent];

          id v15 = (id)v63;
        }
        id v15 = v15;
        v19 = v15;
        goto LABEL_29;
      }
    }
    id v16 = [MEMORY[0x1E4F7A438] invalidError:@"filter produced invalid image" object:v12];
  }
  v19 = 0;
  *a4 = v16;
LABEL_29:

  _Block_object_dispose(buf, 8);
LABEL_30:

  return v19;
}

void __61__PIParallaxStyleFilterDefinition_evaluateWithContext_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  v9 = [*(id *)(a1 + 32) inputKeys];
  int v10 = [v9 containsObject:v7];

  if (v10)
  {
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id obj = 0;
    id v13 = [v8 evaluateWithContext:v11 error:&obj];
    objc_storeStrong(v12, obj);
    if (v13) {
      [*(id *)(a1 + 32) setValue:v13 forKey:v7];
    }
    else {
      *a4 = 1;
    }
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F7A438] unsupportedError:@"Unknown filter parameter" object:v7];
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    *a4 = 1;
  }
}

- (BOOL)isEqualToParallaxStyleFilterDefinition:(id)a3
{
  id v4 = a3;
  v5 = [(PIParallaxStyleFilterDefinition *)self filterName];
  id v6 = [v4 filterName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    id v8 = [(PIParallaxStyleFilterDefinition *)self parameters];
    v9 = [v4 parameters];
    char v10 = [v8 isEqualToDictionary:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isEqualToParallaxStyleDefinition:(id)a3
{
  id v4 = a3;
  v5 = [v4 type];
  int v6 = [v5 isEqualToString:@"filter"];

  if (v6) {
    BOOL v7 = [(PIParallaxStyleFilterDefinition *)self isEqualToParallaxStyleFilterDefinition:v4];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)type
{
  return @"filter";
}

- (PIParallaxStyleFilterDefinition)initWithFilterName:(id)a3 parameters:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)PIParallaxStyleFilterDefinition;
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = [(PIParallaxStyleFilterDefinition *)&v13 init];
  uint64_t v8 = objc_msgSend(v6, "copy", v13.receiver, v13.super_class);

  filterName = v7->_filterName;
  v7->_filterName = (NSString *)v8;

  uint64_t v10 = [v5 copy];
  parameters = v7->_parameters;
  v7->_parameters = (NSDictionary *)v10;

  return v7;
}

- (PIParallaxStyleFilterDefinition)init
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    id v4 = (os_log_t *)MEMORY[0x1E4F7A748];
    id v5 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      id v6 = NSString;
      BOOL v7 = v5;
      uint64_t v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      uint64_t v10 = NSStringFromSelector(a2);
      uint64_t v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_error_impl(&dword_1A9680000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v12 = *v3;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v12 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_14004);
        }
LABEL_7:
        os_log_t v13 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
        {
          uint64_t v14 = (void *)MEMORY[0x1E4F29060];
          uint64_t v15 = v13;
          id v16 = [v14 callStackSymbols];
          v17 = [v16 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v26 = v17;
          _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_14004);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v18 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v20 = (void *)MEMORY[0x1E4F29060];
      id v21 = specific;
      uint64_t v15 = v18;
      v22 = [v20 callStackSymbols];
      uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v26 = specific;
      __int16 v27 = 2114;
      v28 = v23;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    int v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_14004);
  }
}

@end