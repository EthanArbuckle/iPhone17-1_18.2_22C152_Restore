@interface NUSetting
+ (BOOL)serializeSettings:(id)a3 intoDictionary:(id)a4 key:(id)a5 error:(id *)a6;
+ (id)deserializeAttributesFromDictionary:(id)a3 error:(id *)a4;
+ (id)deserializeFromDictionary:(id)a3 error:(id *)a4;
+ (id)deserializeSettingsFromDictionary:(id)a3 key:(id)a4 error:(id *)a5;
+ (id)supportedAttributes;
- (BOOL)isRequired;
- (BOOL)serializeAttributesIntoDictionary:(id)a3 error:(id *)a4;
- (BOOL)validateAttribute:(id)a3 value:(id)a4 error:(id *)a5;
- (id)copy:(id)a3;
- (id)defaultValue;
- (id)description;
- (id)deserialize:(id)a3 error:(id *)a4;
- (id)serialize:(id)a3 error:(id *)a4;
- (int64_t)type;
@end

@implementation NUSetting

- (BOOL)serializeAttributesIntoDictionary:(id)a3 error:(id *)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v16 = NUAssertLogger_22888();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      v54 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v19 = NUAssertLogger_22888();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        v33 = [v31 callStackSymbols];
        v34 = [v33 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v54 = v30;
        __int16 v55 = 2114;
        v56 = v34;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v54 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSetting serializeAttributesIntoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 178, @"Invalid parameter not satisfying: %s", v35, v36, v37, v38, (uint64_t)"dictionary != nil");
  }
  if (!a4)
  {
    v23 = NUAssertLogger_22888();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v54 = v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v26 = NUAssertLogger_22888();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v25)
    {
      if (v27)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = (void *)MEMORY[0x1E4F29060];
        id v41 = v39;
        v42 = [v40 callStackSymbols];
        v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v54 = v39;
        __int16 v55 = 2114;
        v56 = v43;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v54 = v29;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSetting serializeAttributesIntoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 179, @"Invalid parameter not satisfying: %s", v44, v45, v46, v47, (uint64_t)"error != NULL");
  }
  v7 = v6;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v8 = [(id)objc_opt_class() supportedAttributes];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v49 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        v14 = [(NSDictionary *)self->super._attributes objectForKeyedSubscript:v13];
        if (v14) {
          [v7 setObject:v14 forKeyedSubscript:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v10);
  }

  return 1;
}

- (id)deserialize:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v10 = NUAssertLogger_22888();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      v43 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v13 = NUAssertLogger_22888();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        BOOL v27 = [v25 callStackSymbols];
        v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v43 = v24;
        __int16 v44 = 2114;
        uint64_t v45 = v28;
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
    _NUAssertFailHandler((uint64_t)"-[NUSetting deserialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 115, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    v17 = NUAssertLogger_22888();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v43 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v20 = NUAssertLogger_22888();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v21)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        uint64_t v36 = [v34 callStackSymbols];
        uint64_t v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v43 = v33;
        __int16 v44 = 2114;
        uint64_t v45 = v37;
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
    _NUAssertFailHandler((uint64_t)"-[NUSetting deserialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 116, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"error != NULL");
  }
  v7 = v6;
  if ([(NUModel *)self validate:v6 error:a4]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (id)serialize:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v10 = NUAssertLogger_22888();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      v43 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v13 = NUAssertLogger_22888();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        BOOL v27 = [v25 callStackSymbols];
        v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v43 = v24;
        __int16 v44 = 2114;
        uint64_t v45 = v28;
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
    _NUAssertFailHandler((uint64_t)"-[NUSetting serialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 102, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    v17 = NUAssertLogger_22888();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v43 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v20 = NUAssertLogger_22888();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v21)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        uint64_t v36 = [v34 callStackSymbols];
        uint64_t v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v43 = v33;
        __int16 v44 = 2114;
        uint64_t v45 = v37;
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
    _NUAssertFailHandler((uint64_t)"-[NUSetting serialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 103, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"error != NULL");
  }
  v7 = v6;
  if ([(NUModel *)self validate:v6 error:a4]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (id)copy:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id result = a3;
  if (!result)
  {
    v4 = NUAssertLogger_22888();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      BOOL v21 = v5;
      _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v7 = NUAssertLogger_22888();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        uint64_t v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v12 = (void *)MEMORY[0x1E4F29060];
        id v13 = v11;
        BOOL v14 = [v12 callStackSymbols];
        v15 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v21 = v11;
        __int16 v22 = 2114;
        v23 = v15;
        _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v10 = [v9 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v21 = v10;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSetting copy:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 95, @"Invalid parameter not satisfying: %s", v16, v17, v18, v19, (uint64_t)"object != nil");
  }
  return result;
}

- (BOOL)validateAttribute:(id)a3 value:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (([v8 isEqualToString:@"default"] & 1) == 0
    && ![v8 isEqualToString:@"identity"])
  {
    if (![v8 isEqualToString:@"required"])
    {
      v15.receiver = self;
      v15.super_class = (Class)NUSetting;
      BOOL v10 = [(NUModel *)&v15 validateAttribute:v8 value:v9 error:a5];
      goto LABEL_11;
    }
    uint64_t v16 = 0;
    if (+[NUModel validateBool:v9 error:&v16]) {
      goto LABEL_4;
    }
    uint64_t v11 = v16;
LABEL_6:
    id v12 = v11;
    id v13 = +[NUError errorWithCode:2 reason:@"Invalid attribute value" object:v8 underlyingError:v12];

    BOOL v10 = 0;
    *a5 = v13;
    goto LABEL_11;
  }
  uint64_t v17 = 0;
  if (![(NUModel *)self validate:v9 error:&v17])
  {
    uint64_t v11 = v17;
    goto LABEL_6;
  }
LABEL_4:
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NUModel *)self attributes];
  id v6 = [v3 stringWithFormat:@"<%@ attributes:%@>", v4, v5];

  return v6;
}

- (BOOL)isRequired
{
  v2 = [(NUModel *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"required"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (id)defaultValue
{
  v2 = [(NUModel *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"default"];

  return v3;
}

- (int64_t)type
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_22906);
  }
  v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v3 = NSString;
    char v4 = v2;
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    v7 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v6];
    *(_DWORD *)buf = 138543362;
    BOOL v27 = v7;
    _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_22906);
      }
      goto LABEL_8;
    }
    if (v8 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_22906);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    id v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    BOOL v10 = (void *)MEMORY[0x1E4F29060];
    uint64_t v11 = v9;
    id v12 = [v10 callStackSymbols];
    id v13 = [v12 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    BOOL v27 = v13;
    _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  BOOL v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v16 = (void *)MEMORY[0x1E4F29060];
  id v17 = specific;
  uint64_t v11 = v14;
  uint64_t v18 = [v16 callStackSymbols];
  uint64_t v19 = [v18 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  BOOL v27 = specific;
  __int16 v28 = 2114;
  uint64_t v29 = v19;
  _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  BOOL v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  _NUAssertFailHandler((uint64_t)"-[NUSetting type]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 40, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v22, v23, v24, v25, v21);
}

+ (id)deserializeSettingsFromDictionary:(id)a3 key:(id)a4 error:(id *)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    id v26 = NUAssertLogger_22888();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      BOOL v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      v72 = v27;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v29 = NUAssertLogger_22888();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v30)
      {
        uint64_t v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        v43 = [v41 callStackSymbols];
        __int16 v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v72 = v40;
        __int16 v73 = 2114;
        v74 = v44;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      uint64_t v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v72 = v32;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSetting deserializeSettingsFromDictionary:key:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 237, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"dictionary != nil");
  }
  if (!a5)
  {
    v33 = NUAssertLogger_22888();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v72 = v34;
      _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v36 = NUAssertLogger_22888();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v35)
    {
      if (v37)
      {
        long long v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v50 = (void *)MEMORY[0x1E4F29060];
        id v51 = v49;
        v52 = [v50 callStackSymbols];
        v53 = [v52 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v72 = v49;
        __int16 v73 = 2114;
        v74 = v53;
        _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v37)
    {
      uint64_t v38 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v39 = [v38 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v72 = v39;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSetting deserializeSettingsFromDictionary:key:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 238, @"Invalid parameter not satisfying: %s", v54, v55, v56, v57, (uint64_t)"error != NULL");
  }
  BOOL v10 = v9;
  id v69 = 0;
  uint64_t v11 = [a1 deserializeDictionaryFromDictionary:v8 key:v9 error:&v69];
  id v12 = v69;
  if (v11)
  {
    id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v11, "count"));
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v14 = v11;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v65 objects:v70 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      v58 = a5;
      v59 = v11;
      uint64_t v17 = *(void *)v66;
      v60 = v10;
      id v61 = v8;
      v62 = v13;
LABEL_6:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v66 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v65 + 1) + 8 * v18);
        id v64 = 0;
        char v20 = [a1 validateString:v19 error:&v64];
        id v21 = v64;

        if ((v20 & 1) == 0) {
          break;
        }
        uint64_t v22 = [v14 objectForKeyedSubscript:v19];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id *v58 = +[NUError missingError:@"Malformed setting" object:v19];

          goto LABEL_19;
        }
        id v63 = 0;
        uint64_t v23 = +[NUSetting deserializeFromDictionary:v22 error:&v63];
        id v12 = v63;

        if (!v23)
        {
          id *v58 = +[NUError errorWithCode:1 reason:@"Failed to deserialized setting" object:v19 underlyingError:v12];

          id v21 = v12;
          goto LABEL_19;
        }
        [v62 setObject:v23 forKeyedSubscript:v19];

        if (v16 == ++v18)
        {
          uint64_t v16 = [v14 countByEnumeratingWithState:&v65 objects:v70 count:16];
          BOOL v10 = v60;
          id v8 = v61;
          uint64_t v11 = v59;
          id v13 = v62;
          if (v16) {
            goto LABEL_6;
          }
          goto LABEL_14;
        }
      }
      id *v58 = +[NUError errorWithCode:2 reason:@"Invalid setting name" object:v19 underlyingError:v21];
LABEL_19:

      id v24 = 0;
      id v12 = v21;
      BOOL v10 = v60;
      id v8 = v61;
      uint64_t v11 = v59;
      id v13 = v62;
      goto LABEL_20;
    }
LABEL_14:

    id v24 = v13;
LABEL_20:
  }
  else
  {
    +[NUError errorWithCode:2 reason:@"Invalid settings dictionary" object:v8 underlyingError:v12];
    id v24 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

+ (BOOL)serializeSettings:(id)a3 intoDictionary:(id)a4 key:(id)a5 error:(id *)a6
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    id v26 = NUAssertLogger_22888();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      BOOL v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "settings != nil");
      *(_DWORD *)buf = 138543362;
      long long v67 = v27;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v29 = NUAssertLogger_22888();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v30)
      {
        uint64_t v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        v43 = [v41 callStackSymbols];
        __int16 v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v67 = v40;
        __int16 v68 = 2114;
        id v69 = v44;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      uint64_t v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v67 = v32;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSetting serializeSettings:intoDictionary:key:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 212, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"settings != nil");
  }
  if (!a6)
  {
    v33 = NUAssertLogger_22888();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      long long v67 = v34;
      _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v36 = NUAssertLogger_22888();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v35)
    {
      if (v37)
      {
        long long v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v50 = (void *)MEMORY[0x1E4F29060];
        id v51 = v49;
        v52 = [v50 callStackSymbols];
        v53 = [v52 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v67 = v49;
        __int16 v68 = 2114;
        id v69 = v53;
        _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v37)
    {
      uint64_t v38 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v39 = [v38 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v67 = v39;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSetting serializeSettings:intoDictionary:key:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 213, @"Invalid parameter not satisfying: %s", v54, v55, v56, v57, (uint64_t)"error != NULL");
  }
  id v58 = v11;
  v59 = v10;
  id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v62;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v62 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v61 + 1) + 8 * i);
        uint64_t v19 = [v13 objectForKeyedSubscript:v18];
        id v60 = 0;
        char v20 = [v19 serializeAsDictionary:&v60];
        id v21 = v60;
        if (!v20)
        {
          *a6 = +[NUError errorWithCode:1 reason:@"Failed to serialized setting" object:v18 underlyingError:v21];

          BOOL v24 = 0;
          uint64_t v23 = v58;
          uint64_t v22 = v59;
          goto LABEL_13;
        }
        [v12 setObject:v20 forKeyedSubscript:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v61 objects:v65 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  uint64_t v23 = v58;
  uint64_t v22 = v59;
  [v59 setObject:v12 forKeyedSubscript:v58];
  BOOL v24 = 1;
LABEL_13:

  return v24;
}

+ (id)deserializeAttributesFromDictionary:(id)a3 error:(id *)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v17 = NUAssertLogger_22888();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v55 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    char v20 = NUAssertLogger_22888();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        uint64_t v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        v34 = [v32 callStackSymbols];
        id v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v55 = v31;
        __int16 v56 = 2114;
        uint64_t v57 = v35;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      uint64_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v55 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSetting deserializeAttributesFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 196, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"dictionary != nil");
  }
  if (!a4)
  {
    BOOL v24 = NUAssertLogger_22888();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v55 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v27 = NUAssertLogger_22888();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        uint64_t v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        v43 = [v41 callStackSymbols];
        __int16 v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v55 = v40;
        __int16 v56 = 2114;
        uint64_t v57 = v44;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      uint64_t v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v55 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSetting deserializeAttributesFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 197, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"error != NULL");
  }
  v7 = v6;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v9 = [a1 supportedAttributes];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v50 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v15 = [v7 objectForKeyedSubscript:v14];
        [v8 setObject:v15 forKeyedSubscript:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v11);
  }

  return v8;
}

+ (id)deserializeFromDictionary:(id)a3 error:(id *)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v13 = NUAssertLogger_22888();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v46 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v16 = NUAssertLogger_22888();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        BOOL v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        BOOL v30 = [v28 callStackSymbols];
        uint64_t v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v46 = v27;
        __int16 v47 = 2114;
        uint64_t v48 = v31;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      uint64_t v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v46 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSetting deserializeFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 128, @"Invalid parameter not satisfying: %s", v32, v33, v34, v35, (uint64_t)"dictionary != nil");
  }
  if (!a4)
  {
    char v20 = NUAssertLogger_22888();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      BOOL v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v46 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v23 = NUAssertLogger_22888();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (v22)
    {
      if (v24)
      {
        uint64_t v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v37 = (void *)MEMORY[0x1E4F29060];
        id v38 = v36;
        uint64_t v39 = [v37 callStackSymbols];
        uint64_t v40 = [v39 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v46 = v36;
        __int16 v47 = 2114;
        uint64_t v48 = v40;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      uint64_t v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v46 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSetting deserializeFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 129, @"Invalid parameter not satisfying: %s", v41, v42, v43, v44, (uint64_t)"error != NULL");
  }
  id v6 = v5;
  v7 = [v5 objectForKeyedSubscript:@"isa"];
  if (!v7)
  {
    uint64_t v10 = +[NUError missingError:@"Missing setting type" object:v6];
LABEL_9:
    uint64_t v11 = 0;
    *a4 = v10;
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v10 = +[NUError invalidError:@"Invalid setting type" object:v7];
    goto LABEL_9;
  }
  id v8 = v7;
  if ([v8 isEqualToString:@"BOOL"])
  {
    id v9 = NUBoolSetting;
  }
  else if ([v8 isEqualToString:@"number"])
  {
    id v9 = NUNumberSetting;
  }
  else if ([v8 isEqualToString:@"enum"])
  {
    id v9 = NUEnumSetting;
  }
  else if ([v8 isEqualToString:@"compound"])
  {
    id v9 = NUCompoundSetting;
  }
  else if ([v8 isEqualToString:@"array"])
  {
    id v9 = NUArraySetting;
  }
  else
  {
    if (![v8 isEqualToString:@"opaque"])
    {
      +[NUError unknownError:@"Unknown setting type" object:v8];
      uint64_t v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    id v9 = NUOpaqueSetting;
  }
  uint64_t v11 = [(__objc2_class *)v9 deserializeFromDictionary:v6 error:a4];
LABEL_21:

LABEL_22:

  return v11;
}

+ (id)supportedAttributes
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"default";
  v4[1] = @"identity";
  v4[2] = @"required";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

@end