@interface NUEnumSetting
+ (id)deserializeFromDictionary:(id)a3 error:(id *)a4;
- (BOOL)isValid:(id *)a3;
- (BOOL)serializeIntoDictionary:(id)a3 error:(id *)a4;
- (BOOL)validate:(id)a3 error:(id *)a4;
- (BOOL)validateValues:(id *)a3;
- (NSArray)values;
- (NSString)defaultValue;
- (NSString)identityValue;
- (NUEnumSetting)init;
- (NUEnumSetting)initWithAttributes:(id)a3;
- (NUEnumSetting)initWithValues:(id)a3 attributes:(id)a4;
- (id)description;
- (int64_t)type;
@end

@implementation NUEnumSetting

- (void).cxx_destruct
{
}

- (NSArray)values
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)serializeIntoDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [v6 setObject:@"enum" forKeyedSubscript:@"isa"];
  [v6 setObject:self->_values forKeyedSubscript:@"values"];
  LOBYTE(a4) = [(NUSetting *)self serializeAttributesIntoDictionary:v6 error:a4];

  return (char)a4;
}

- (BOOL)validateValues:(id *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v14 = NUAssertLogger_22888();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v36 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v17 = NUAssertLogger_22888();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        v24 = [v22 callStackSymbols];
        v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v36 = v21;
        __int16 v37 = 2114;
        v38 = v25;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v36 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUEnumSetting validateValues:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 624, @"Invalid parameter not satisfying: %s", v26, v27, v28, v29, (uint64_t)"error != NULL");
  }
  if ([(NSArray *)self->_values count])
  {
    if (+[NUModel validateStringArray:self->_values error:a3])
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v6 = self->_values;
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v31;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v31 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v30 + 1) + 8 * i);
            if ([v5 containsObject:v11])
            {
              +[NUError duplicateError:@"Duplicate value" object:v11];
              BOOL v12 = 0;
              *a3 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_16;
            }
            [v5 addObject:v11];
          }
          uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
      BOOL v12 = 1;
LABEL_16:
    }
    else
    {
      return 0;
    }
  }
  else
  {
    +[NUError missingError:@"Missing values" object:self];
    BOOL v12 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (BOOL)isValid:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v6 = NUAssertLogger_22888();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      id v23 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v9 = NUAssertLogger_22888();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        v16 = [v14 callStackSymbols];
        v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v23 = v13;
        __int16 v24 = 2114;
        v25 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v23 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUEnumSetting isValid:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 612, @"Invalid parameter not satisfying: %s", v18, v19, v20, v21, (uint64_t)"error != NULL");
  }
  if (!-[NUEnumSetting validateValues:](self, "validateValues:")) {
    return 0;
  }

  return [(NUModel *)self validateAttributes:a3];
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    BOOL v12 = NUAssertLogger_22888();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      v45 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v15 = NUAssertLogger_22888();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        uint64_t v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        uint64_t v29 = [v27 callStackSymbols];
        long long v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v45 = v26;
        __int16 v46 = 2114;
        v47 = v30;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v45 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUEnumSetting validate:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 593, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    uint64_t v19 = NUAssertLogger_22888();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v45 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v22 = NUAssertLogger_22888();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v21)
    {
      if (v23)
      {
        v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        v38 = [v36 callStackSymbols];
        uint64_t v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v45 = v35;
        __int16 v46 = 2114;
        v47 = v39;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      __int16 v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v45 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUEnumSetting validate:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 594, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"error != NULL");
  }
  uint64_t v7 = v6;
  if (+[NUModel validateString:v6 error:a4])
  {
    uint64_t v8 = [(NUEnumSetting *)self values];
    char v9 = [v8 containsObject:v7];

    if (v9)
    {
      BOOL v10 = 1;
    }
    else
    {
      +[NUError rangeError:@"Not a possible value" object:v7];
      BOOL v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (NSString)identityValue
{
  return (NSString *)[(NSDictionary *)self->super.super._attributes objectForKeyedSubscript:@"identity"];
}

- (NSString)defaultValue
{
  return (NSString *)[(NSDictionary *)self->super.super._attributes objectForKeyedSubscript:@"default"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(NUEnumSetting *)self values];
  id v6 = [(NUModel *)self attributes];
  uint64_t v7 = [v3 stringWithFormat:@"<%@ values:%@ attributes:%@>", v4, v5, v6];

  return v7;
}

- (NUEnumSetting)initWithValues:(id)a3 attributes:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v13 = NUAssertLogger_22888();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "values != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v16 = NUAssertLogger_22888();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        uint64_t v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        BOOL v23 = [v21 callStackSymbols];
        __int16 v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v20;
        __int16 v32 = 2114;
        uint64_t v33 = v24;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      uint64_t v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUEnumSetting initWithValues:attributes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 567, @"Invalid parameter not satisfying: %s", v25, v26, v27, v28, (uint64_t)"values != nil");
  }
  uint64_t v8 = v7;
  v29.receiver = self;
  v29.super_class = (Class)NUEnumSetting;
  char v9 = [(NUModel *)&v29 initWithAttributes:v7];
  uint64_t v10 = [v6 copy];
  values = v9->_values;
  v9->_values = (NSArray *)v10;

  return v9;
}

- (NUEnumSetting)initWithAttributes:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_22906);
  }
  id v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSString;
    id v7 = v5;
    uint64_t v8 = (objc_class *)objc_opt_class();
    char v9 = NSStringFromClass(v8);
    uint64_t v10 = NSStringFromSelector(a2);
    uint64_t v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
    *(_DWORD *)buf = 138543362;
    uint64_t v31 = v11;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_22906);
      }
      goto LABEL_8;
    }
    if (v12 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_22906);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v14 = (void *)MEMORY[0x1E4F29060];
    id v15 = v13;
    BOOL v16 = [v14 callStackSymbols];
    BOOL v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v31 = v17;
    _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v20 = (void *)MEMORY[0x1E4F29060];
  id v21 = specific;
  id v15 = v18;
  id v22 = [v20 callStackSymbols];
  BOOL v23 = [v22 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v31 = specific;
  __int16 v32 = 2114;
  uint64_t v33 = v23;
  _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  __int16 v24 = (objc_class *)objc_opt_class();
  uint64_t v25 = NSStringFromClass(v24);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUEnumSetting initWithAttributes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 562, @"Initializer not available: -[%@ %@], use designated initializer instead.", v26, v27, v28, v29, v25);
}

- (NUEnumSetting)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_22906);
  }
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSString;
    id v5 = v3;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(a2);
    char v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_22906);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_22906);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    uint64_t v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F29060];
    v13 = v11;
    v14 = [v12 callStackSymbols];
    id v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  BOOL v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  v13 = v16;
  uint64_t v20 = [v18 callStackSymbols];
  id v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v29 = specific;
  __int16 v30 = 2114;
  uint64_t v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  id v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUEnumSetting init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 557, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

- (int64_t)type
{
  return 2;
}

+ (id)deserializeFromDictionary:(id)a3 error:(id *)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v15 = NUAssertLogger_22888();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      BOOL v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      v49 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v18 = NUAssertLogger_22888();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        uint64_t v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __int16 v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        uint64_t v32 = [v30 callStackSymbols];
        uint64_t v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v49 = v29;
        __int16 v50 = 2114;
        v51 = v33;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      uint64_t v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v49 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUEnumSetting deserializeFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 663, @"Invalid parameter not satisfying: %s", v34, v35, v36, v37, (uint64_t)"dictionary != nil");
  }
  if (!a4)
  {
    id v22 = NUAssertLogger_22888();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v49 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v25 = NUAssertLogger_22888();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v24)
    {
      if (v26)
      {
        v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        uint64_t v41 = [v39 callStackSymbols];
        uint64_t v42 = [v41 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v49 = v38;
        __int16 v50 = 2114;
        v51 = v42;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      uint64_t v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v49 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUEnumSetting deserializeFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 664, @"Invalid parameter not satisfying: %s", v43, v44, v45, v46, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"values"];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      id v47 = 0;
      uint64_t v10 = [a1 deserializeAttributesFromDictionary:v7 error:&v47];
      id v11 = v47;
      if (v10)
      {
        uint64_t v12 = (void *)[objc_alloc((Class)a1) initWithValues:v9 attributes:v10];
      }
      else
      {
        +[NUError errorWithCode:1 reason:@"Failed to deserialized attributes" object:v7 underlyingError:v11];
        uint64_t v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_12;
    }
    v13 = +[NUError invalidError:@"Invalid values" object:v8];
  }
  else
  {
    v13 = +[NUError missingError:@"Missing values" object:v7];
  }
  uint64_t v12 = 0;
  *a4 = v13;
LABEL_12:

  return v12;
}

@end