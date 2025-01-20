@interface PIParallaxStyleFilterStackDefinition
- (BOOL)isEqualToParallaxStyleDefinition:(id)a3;
- (BOOL)isEqualToParallaxStyleFilterStackDefinition:(id)a3;
- (NSArray)filters;
- (NSString)stackName;
- (PIParallaxStyleFilterStackDefinition)init;
- (PIParallaxStyleFilterStackDefinition)initWithStackName:(id)a3 filters:(id)a4;
- (id)description;
- (id)evaluateWithContext:(id)a3 error:(id *)a4;
- (id)type;
@end

@implementation PIParallaxStyleFilterStackDefinition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_stackName, 0);
}

- (NSArray)filters
{
  return self->_filters;
}

- (NSString)stackName
{
  return self->_stackName;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PIParallaxStyleFilterStackDefinition *)self stackName];
  v6 = [(PIParallaxStyleFilterStackDefinition *)self filters];
  v7 = [v3 stringWithFormat:@"<%@:%p stack:%@ filters:%@>", v4, self, v5, v6];

  return v7;
}

- (id)evaluateWithContext:(id)a3 error:(id *)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v30 = NUAssertLogger_14042();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "context != nil");
      v31 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v31;
      _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v32 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v34 = NUAssertLogger_14042();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v35)
      {
        v43 = dispatch_get_specific(*v32);
        v44 = (void *)MEMORY[0x1E4F29060];
        id v45 = v43;
        v32 = [v44 callStackSymbols];
        v46 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v60 = (const void **)v43;
        __int16 v61 = 2114;
        id v62 = v46;
        _os_log_error_impl(&dword_1A9680000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v35)
    {
      v36 = [MEMORY[0x1E4F29060] callStackSymbols];
      v32 = [v36 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v60 = v32;
      _os_log_error_impl(&dword_1A9680000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v40 = _NUAssertFailHandler();
    goto LABEL_32;
  }
  if (!a4)
  {
    v37 = NUAssertLogger_14042();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      v38 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v38;
      _os_log_error_impl(&dword_1A9680000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v32 = (const void **)MEMORY[0x1E4F7A308];
    v39 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v34 = NUAssertLogger_14042();
    int v40 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (!v39)
    {
      if (v40)
      {
        v41 = [MEMORY[0x1E4F29060] callStackSymbols];
        v42 = [v41 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v60 = v42;
        _os_log_error_impl(&dword_1A9680000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_34;
    }
LABEL_32:
    if (v40)
    {
      v47 = dispatch_get_specific(*v32);
      v48 = (void *)MEMORY[0x1E4F29060];
      id v49 = v47;
      v50 = [v48 callStackSymbols];
      v51 = [v50 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v60 = (const void **)v47;
      __int16 v61 = 2114;
      id v62 = v51;
      _os_log_error_impl(&dword_1A9680000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_34:

    _NUAssertFailHandler();
  }
  v7 = v6;
  v52 = [v6 inputImage];
  [v52 extent];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [v7 outputImage];
  v17 = objc_msgSend(v16, "imageByCroppingToRect:", v9, v11, v13, v15);
  [v7 setInputImage:v17];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v18 = [(PIParallaxStyleFilterStackDefinition *)self filters];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    v21 = (dispatch_once_t *)MEMORY[0x1E4F7A750];
    uint64_t v22 = *(void *)v55;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v55 != v22) {
          objc_enumerationMutation(v18);
        }
        v24 = *(void **)(*((void *)&v54 + 1) + 8 * v23);
        id v53 = 0;
        v25 = [v24 evaluateWithContext:v7 error:&v53];
        id v26 = v53;
        if (v25)
        {
          [v7 setOutputImage:v25];
        }
        else
        {
          if (*v21 != -1) {
            dispatch_once(v21, &__block_literal_global_418);
          }
          v27 = *MEMORY[0x1E4F7A758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v60 = (const void **)v24;
            __int16 v61 = 2112;
            id v62 = v26;
            _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Error evaluating filter definition: %@, error: %@", buf, 0x16u);
          }
        }

        ++v23;
      }
      while (v20 != v23);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v54 objects:v58 count:16];
    }
    while (v20);
  }

  [v7 setInputImage:v52];
  v28 = [v7 outputImage];

  return v28;
}

- (BOOL)isEqualToParallaxStyleFilterStackDefinition:(id)a3
{
  id v4 = a3;
  v5 = [(PIParallaxStyleFilterStackDefinition *)self stackName];
  id v6 = [v4 stackName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    double v8 = [(PIParallaxStyleFilterStackDefinition *)self filters];
    double v9 = [v4 filters];
    char v10 = [v8 isEqualToArray:v9];
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
  int v6 = [v5 isEqualToString:@"stack"];

  if (v6) {
    BOOL v7 = [(PIParallaxStyleFilterStackDefinition *)self isEqualToParallaxStyleFilterStackDefinition:v4];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)type
{
  return @"stack";
}

- (PIParallaxStyleFilterStackDefinition)initWithStackName:(id)a3 filters:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)PIParallaxStyleFilterStackDefinition;
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = [(PIParallaxStyleFilterStackDefinition *)&v13 init];
  uint64_t v8 = objc_msgSend(v6, "copy", v13.receiver, v13.super_class);

  stackName = v7->_stackName;
  v7->_stackName = (NSString *)v8;

  uint64_t v10 = [v5 copy];
  filters = v7->_filters;
  v7->_filters = (NSArray *)v10;

  return v7;
}

- (PIParallaxStyleFilterStackDefinition)init
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
      double v9 = NSStringFromClass(v8);
      uint64_t v10 = NSStringFromSelector(a2);
      double v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
      *(_DWORD *)buf = 138543362;
      id v26 = v11;
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
          double v14 = (void *)MEMORY[0x1E4F29060];
          double v15 = v13;
          v16 = [v14 callStackSymbols];
          v17 = [v16 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          id v26 = v17;
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
      uint64_t v20 = (void *)MEMORY[0x1E4F29060];
      id v21 = specific;
      double v15 = v18;
      uint64_t v22 = [v20 callStackSymbols];
      uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      id v26 = specific;
      __int16 v27 = 2114;
      v28 = v23;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v24 = (objc_class *)objc_opt_class();
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