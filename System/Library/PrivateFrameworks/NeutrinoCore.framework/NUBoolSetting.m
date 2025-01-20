@interface NUBoolSetting
+ (id)deserializeFromDictionary:(id)a3 error:(id *)a4;
- (BOOL)serializeIntoDictionary:(id)a3 error:(id *)a4;
- (BOOL)validate:(id)a3 error:(id *)a4;
- (NSNumber)defaultValue;
- (NSNumber)identityValue;
- (int64_t)type;
@end

@implementation NUBoolSetting

- (BOOL)serializeIntoDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [v6 setObject:@"BOOL" forKeyedSubscript:@"isa"];
  LOBYTE(a4) = [(NUSetting *)self serializeAttributesIntoDictionary:v6 error:a4];

  return (char)a4;
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v9 = NUAssertLogger_22888();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      v42 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v12 = NUAssertLogger_22888();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        v26 = [v24 callStackSymbols];
        v27 = [v26 componentsJoinedByString:@"\n"];
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
      v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v42 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUBoolSetting validate:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 301, @"Invalid parameter not satisfying: %s", v28, v29, v30, v31, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    v16 = NUAssertLogger_22888();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v42 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v19 = NUAssertLogger_22888();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v20)
      {
        v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        v35 = [v33 callStackSymbols];
        v36 = [v35 componentsJoinedByString:@"\n"];
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
    _NUAssertFailHandler((uint64_t)"-[NUBoolSetting validate:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 302, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"error != NULL");
  }
  id v6 = v5;
  BOOL v7 = +[NUModel validateBool:v5 error:a4];

  return v7;
}

- (NSNumber)identityValue
{
  return (NSNumber *)[(NSDictionary *)self->super.super._attributes objectForKeyedSubscript:@"identity"];
}

- (NSNumber)defaultValue
{
  return (NSNumber *)[(NSDictionary *)self->super.super._attributes objectForKeyedSubscript:@"default"];
}

- (int64_t)type
{
  return 1;
}

+ (id)deserializeFromDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v11 = 0;
  BOOL v7 = [a1 deserializeAttributesFromDictionary:v6 error:&v11];
  id v8 = v11;
  if (v7)
  {
    v9 = (void *)[objc_alloc((Class)a1) initWithAttributes:v7];
  }
  else
  {
    +[NUError errorWithCode:1 reason:@"Failed to deserialized attributes" object:v6 underlyingError:v8];
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

@end