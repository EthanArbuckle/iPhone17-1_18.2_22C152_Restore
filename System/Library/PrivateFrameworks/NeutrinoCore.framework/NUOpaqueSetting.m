@interface NUOpaqueSetting
+ (id)deserializeFromDictionary:(id)a3 error:(id *)a4;
+ (id)supportedAttributes;
- (BOOL)serializeIntoDictionary:(id)a3 error:(id *)a4;
- (BOOL)validateAttribute:(id)a3 value:(id)a4 error:(id *)a5;
- (BOOL)validatePlistCompatibility:(id)a3 error:(id *)a4;
- (id)deserialize:(id)a3 error:(id *)a4;
- (id)serialize:(id)a3 error:(id *)a4;
- (int64_t)type;
@end

@implementation NUOpaqueSetting

- (BOOL)serializeIntoDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [v6 setObject:@"opaque" forKeyedSubscript:@"isa"];
  LOBYTE(a4) = [(NUSetting *)self serializeAttributesIntoDictionary:v6 error:a4];

  return (char)a4;
}

- (id)deserialize:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v7 = NUAssertLogger_22888();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      v40 = v8;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v10 = NUAssertLogger_22888();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        v24 = [v22 callStackSymbols];
        v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v40 = v21;
        __int16 v41 = 2114;
        v42 = v25;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v40 = v13;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUOpaqueSetting deserialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 1307, @"Invalid parameter not satisfying: %s", v26, v27, v28, v29, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    v14 = NUAssertLogger_22888();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v40 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v17 = NUAssertLogger_22888();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (v16)
    {
      if (v18)
      {
        v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        v33 = [v31 callStackSymbols];
        v34 = [v33 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v40 = v30;
        __int16 v41 = 2114;
        v42 = v34;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v40 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUOpaqueSetting deserialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 1308, @"Invalid parameter not satisfying: %s", v35, v36, v37, v38, (uint64_t)"error != NULL");
  }

  return v5;
}

- (id)serialize:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(NUOpaqueSetting *)self validatePlistCompatibility:v6 error:a4]) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)validateAttribute:(id)a3 value:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"required"])
  {
    id v16 = 0;
    BOOL v10 = +[NUModel validateBool:v9 error:&v16];

    if (v10)
    {
      BOOL v11 = 1;
    }
    else
    {
      id v12 = v16;
      id v13 = +[NUError errorWithCode:2 reason:@"Invalid attribute value" object:v8 underlyingError:v12];

      BOOL v11 = 0;
      *a5 = v13;
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NUOpaqueSetting;
    BOOL v11 = [(NUSetting *)&v15 validateAttribute:v8 value:v9 error:a5];
  }
  return v11;
}

- (BOOL)validatePlistCompatibility:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v9 = NUAssertLogger_22888();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      BOOL v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      v42 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v12 = NUAssertLogger_22888();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        id v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        uint64_t v26 = [v24 callStackSymbols];
        uint64_t v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v42 = v23;
        __int16 v43 = 2114;
        v44 = v27;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      objc_super v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v42 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUOpaqueSetting validatePlistCompatibility:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 1257, @"Invalid parameter not satisfying: %s", v28, v29, v30, v31, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    id v16 = NUAssertLogger_22888();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v42 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v19 = NUAssertLogger_22888();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v20)
      {
        id v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        uint64_t v35 = [v33 callStackSymbols];
        uint64_t v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v42 = v32;
        __int16 v43 = 2114;
        v44 = v36;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v42 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUOpaqueSetting validatePlistCompatibility:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 1258, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"error != NULL");
  }
  id v6 = v5;
  char v7 = [MEMORY[0x1E4F28F98] propertyList:v5 isValidForFormat:100];
  if ((v7 & 1) == 0)
  {
    *a4 = +[NUError invalidError:@"Object is not plist-compatible" object:v6];
  }

  return v7;
}

- (int64_t)type
{
  return 6;
}

+ (id)deserializeFromDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v11 = 0;
  char v7 = [a1 deserializeAttributesFromDictionary:v6 error:&v11];
  id v8 = v11;
  if (v7)
  {
    id v9 = (void *)[objc_alloc((Class)a1) initWithAttributes:v7];
  }
  else
  {
    +[NUError errorWithCode:1 reason:@"Failed to deserialized attributes" object:v6 underlyingError:v8];
    id v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)supportedAttributes
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"required";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

@end