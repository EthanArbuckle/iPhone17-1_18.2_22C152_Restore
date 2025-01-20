@interface PIParallaxStyleDefinition
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToParallaxStyleDefinition:(id)a3;
- (NSString)type;
- (id)evaluateWithContext:(id)a3 error:(id *)a4;
@end

@implementation PIParallaxStyleDefinition

- (id)evaluateWithContext:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    v6 = (os_log_t *)MEMORY[0x1E4F7A748];
    v7 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      v8 = NSString;
      v9 = v7;
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      v12 = [v8 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v11];
      *(_DWORD *)buf = 138543362;
      v26 = v12;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v13 = *v5;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v13 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_14004);
        }
LABEL_7:
        os_log_t v14 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
        {
          v15 = (void *)MEMORY[0x1E4F29060];
          v16 = v14;
          v17 = [v15 callStackSymbols];
          v18 = [v17 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v26 = v18;
          _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v13 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_14004);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v19 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v21 = (void *)MEMORY[0x1E4F29060];
      id v22 = specific;
      v16 = v19;
      v23 = [v21 callStackSymbols];
      v5 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v26 = specific;
      __int16 v27 = 2114;
      v28 = v5;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_14004);
  }
}

- (BOOL)isEqualToParallaxStyleDefinition:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F7A750];
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
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_14004);
        }
LABEL_7:
        os_log_t v13 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          os_log_t v14 = (void *)MEMORY[0x1E4F29060];
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
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_14004);
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
      id v22 = [v20 callStackSymbols];
      id v4 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v25 = specific;
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
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_14004);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(PIParallaxStyleDefinition *)self type];
    v7 = [v5 type];
    int v8 = [v6 isEqualToString:v7];

    if (v8) {
      BOOL v9 = [(PIParallaxStyleDefinition *)self isEqualToParallaxStyleDefinition:v5];
    }
    else {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSString)type
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    id v3 = (os_log_t *)MEMORY[0x1E4F7A748];
    id v4 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      id v5 = NSString;
      v6 = v4;
      v7 = (objc_class *)objc_opt_class();
      int v8 = NSStringFromClass(v7);
      BOOL v9 = [v5 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v8];
      *(_DWORD *)buf = 138543362;
      v23 = v9;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v10 = *v2;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v10 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_14004);
        }
LABEL_7:
        os_log_t v11 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
        {
          uint64_t v12 = (void *)MEMORY[0x1E4F29060];
          os_log_t v13 = v11;
          os_log_t v14 = [v12 callStackSymbols];
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
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_14004);
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
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_14004);
  }
}

@end