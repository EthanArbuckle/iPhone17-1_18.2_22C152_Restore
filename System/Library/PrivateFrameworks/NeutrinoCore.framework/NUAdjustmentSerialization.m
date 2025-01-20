@interface NUAdjustmentSerialization
+ (id)compositionFromPropertyList:(id)a3 error:(id *)a4;
+ (id)propertyListFromComposition:(id)a3 error:(id *)a4;
@end

@implementation NUAdjustmentSerialization

+ (id)compositionFromPropertyList:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v10 = NUAssertLogger_5();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "plist != nil");
      *(_DWORD *)buf = 138543362;
      v43 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v13 = NUAssertLogger_5();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        v27 = [v25 callStackSymbols];
        v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v43 = v24;
        __int16 v44 = 2114;
        v45 = v28;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v43 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUAdjustmentSerialization compositionFromPropertyList:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUAdjustmentSerialization.m", 24, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"plist != nil");
  }
  if (!a4)
  {
    v17 = NUAssertLogger_5();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v43 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v20 = NUAssertLogger_5();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v21)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        v36 = [v34 callStackSymbols];
        v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v43 = v33;
        __int16 v44 = 2114;
        v45 = v37;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v43 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUAdjustmentSerialization compositionFromPropertyList:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUAdjustmentSerialization.m", 25, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"error != NULL");
  }
  v6 = v5;
  v7 = +[NUSchema deserializeIdentifiableItem:v5 error:a4];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
    }
    else
    {
      +[NUError mismatchError:@"Not a composition" object:v7];
      id v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)propertyListFromComposition:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v9 = NUAssertLogger_5();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "composition != nil");
      *(_DWORD *)buf = 138543362;
      v42 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v12 = NUAssertLogger_5();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        id v26 = [v24 callStackSymbols];
        v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v42 = v23;
        __int16 v43 = 2114;
        __int16 v44 = v27;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      BOOL v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v42 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUAdjustmentSerialization propertyListFromComposition:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUAdjustmentSerialization.m", 16, @"Invalid parameter not satisfying: %s", v28, v29, v30, v31, (uint64_t)"composition != nil");
  }
  if (!a4)
  {
    v16 = NUAssertLogger_5();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v42 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v19 = NUAssertLogger_5();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v20)
      {
        uint64_t v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        id v35 = [v33 callStackSymbols];
        v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v42 = v32;
        __int16 v43 = 2114;
        __int16 v44 = v36;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      BOOL v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v42 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUAdjustmentSerialization propertyListFromComposition:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUAdjustmentSerialization.m", 17, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"error != NULL");
  }
  v6 = v5;
  v7 = +[NUSchema serializeIdentifiableItem:v5 error:a4];

  return v7;
}

@end