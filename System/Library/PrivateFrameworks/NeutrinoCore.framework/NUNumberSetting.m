@interface NUNumberSetting
+ (id)deserializeFromDictionary:(id)a3 error:(id *)a4;
- (BOOL)isValid:(id *)a3;
- (BOOL)serializeIntoDictionary:(id)a3 error:(id *)a4;
- (BOOL)validateNumber:(id)a3 error:(id *)a4;
- (NSNumber)defaultValue;
- (NSNumber)identityValue;
- (NSNumber)maximumValue;
- (NSNumber)minimumValue;
- (NSNumber)ui_maximumValue;
- (NSNumber)ui_minimumValue;
- (NUNumberSetting)init;
- (NUNumberSetting)initWithAttributes:(id)a3;
- (NUNumberSetting)initWithMinimum:(id)a3 maximum:(id)a4 attributes:(id)a5;
- (NUNumberSetting)initWithMinimum:(id)a3 maximum:(id)a4 uiMinimum:(id)a5 uiMaximum:(id)a6 attributes:(id)a7;
- (id)description;
- (int64_t)type;
@end

@implementation NUNumberSetting

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ui_maximumValue, 0);
  objc_storeStrong((id *)&self->_ui_minimumValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);

  objc_storeStrong((id *)&self->_minimumValue, 0);
}

- (NSNumber)ui_maximumValue
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)ui_minimumValue
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)maximumValue
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)minimumValue
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)serializeIntoDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [v6 setObject:@"number" forKeyedSubscript:@"isa"];
  v7 = [(NUNumberSetting *)self minimumValue];
  [v6 setObject:v7 forKeyedSubscript:@"minimum"];

  v8 = [(NUNumberSetting *)self maximumValue];
  [v6 setObject:v8 forKeyedSubscript:@"maximum"];

  v9 = [(NUNumberSetting *)self ui_minimumValue];

  if (v9)
  {
    v10 = [(NUNumberSetting *)self ui_minimumValue];
    [v6 setObject:v10 forKeyedSubscript:@"ui_minimum"];
  }
  v11 = [(NUNumberSetting *)self ui_maximumValue];

  if (v11)
  {
    v12 = [(NUNumberSetting *)self ui_maximumValue];
    [v6 setObject:v12 forKeyedSubscript:@"ui_maximum"];
  }
  BOOL v13 = [(NUSetting *)self serializeAttributesIntoDictionary:v6 error:a4];

  return v13;
}

- (BOOL)isValid:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v14 = NUAssertLogger_22888();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v33 = v15;
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
        v33 = v21;
        __int16 v34 = 2114;
        v35 = v25;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v33 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUNumberSetting isValid:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 428, @"Invalid parameter not satisfying: %s", v26, v27, v28, v29, (uint64_t)"error != NULL");
  }
  minimumValue = self->_minimumValue;
  if (!minimumValue)
  {
    v8 = @"Missing minimum value";
LABEL_11:
    v7 = +[NUError missingError:v8 object:self];
    goto LABEL_12;
  }
  id v31 = 0;
  if (!+[NUModel validateNumber:minimumValue error:&v31])
  {
    id v9 = v31;
    v10 = @"Invalid minimum value";
LABEL_14:
    id v13 = +[NUError invalidError:v10 object:self];

    BOOL result = 0;
    *a3 = v13;
    return result;
  }
  maximumValue = self->_maximumValue;
  if (!maximumValue)
  {
    v8 = @"Missing maximum value";
    goto LABEL_11;
  }
  id v30 = 0;
  if (!+[NUModel validateNumber:maximumValue error:&v30])
  {
    id v9 = v30;
    v10 = @"Invalid maximum value";
    goto LABEL_14;
  }
  if ([(NSNumber *)self->_minimumValue compare:self->_maximumValue] == NSOrderedDescending)
  {
    v7 = +[NUError rangeError:@"invalid value range" object:self];
LABEL_12:
    id v11 = v7;
    BOOL result = 0;
    *a3 = v11;
    return result;
  }
  return [(NUModel *)self validateAttributes:a3];
}

- (BOOL)validateNumber:(id)a3 error:(id *)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v20 = NUAssertLogger_22888();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      v53 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v23 = NUAssertLogger_22888();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        __int16 v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        v37 = [v35 callStackSymbols];
        v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v53 = v34;
        __int16 v54 = 2114;
        v55 = v38;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v53 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUNumberSetting validateNumber:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 397, @"Invalid parameter not satisfying: %s", v39, v40, v41, v42, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    uint64_t v27 = NUAssertLogger_22888();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v53 = v28;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v30 = NUAssertLogger_22888();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (v29)
    {
      if (v31)
      {
        v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v44 = (void *)MEMORY[0x1E4F29060];
        id v45 = v43;
        v46 = [v44 callStackSymbols];
        v47 = [v46 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v53 = v43;
        __int16 v54 = 2114;
        v55 = v47;
        _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v31)
    {
      v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v53 = v33;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUNumberSetting validateNumber:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 398, @"Invalid parameter not satisfying: %s", v48, v49, v50, v51, (uint64_t)"error != NULL");
  }
  v7 = v6;
  if (+[NUModel validateNumber:v6 error:a4])
  {
    id v8 = v7;
    [v8 doubleValue];
    double v10 = v9;
    id v11 = [(NUNumberSetting *)self minimumValue];
    [v11 doubleValue];
    double v13 = v12;

    v14 = [(NUNumberSetting *)self maximumValue];
    [v14 doubleValue];
    double v16 = v15;

    if (v10 >= v13)
    {
      if (v10 <= v16)
      {
        BOOL v17 = 1;
        goto LABEL_11;
      }
      [NSString stringWithFormat:@"Number (%.2f) is greater than maximum (%.2f)", *(void *)&v10, *(void *)&v16];
    }
    else
    {
      [NSString stringWithFormat:@"Number (%.2f) is less than minimum (%.2f)", *(void *)&v10, *(void *)&v13];
    BOOL v18 = };
    *a4 = +[NUError rangeError:v18 object:v8];

    BOOL v17 = 0;
LABEL_11:

    goto LABEL_12;
  }
  BOOL v17 = 0;
LABEL_12:

  return v17;
}

- (NSNumber)identityValue
{
  return (NSNumber *)[(NSDictionary *)self->super.super._attributes objectForKeyedSubscript:@"identity"];
}

- (NSNumber)defaultValue
{
  return (NSNumber *)[(NSDictionary *)self->super.super._attributes objectForKeyedSubscript:@"default"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NUNumberSetting *)self minimumValue];
  id v6 = [(NUNumberSetting *)self maximumValue];
  v7 = [(NUModel *)self attributes];
  id v8 = [v3 stringWithFormat:@"<%@ min:%@ max:%@ attributes:%@>", v4, v5, v6, v7];

  return v8;
}

- (NUNumberSetting)initWithMinimum:(id)a3 maximum:(id)a4 uiMinimum:(id)a5 uiMaximum:(id)a6 attributes:(id)a7
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  double v12 = (NSNumber *)a3;
  double v13 = (NSNumber *)a4;
  v14 = (NSNumber *)a5;
  double v15 = (NSNumber *)a6;
  id v16 = a7;
  if (!v12)
  {
    uint64_t v27 = NUAssertLogger_22888();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "minValue != nil");
      *(_DWORD *)buf = 138543362;
      v61 = v28;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v30 = NUAssertLogger_22888();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        uint64_t v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v42 = (void *)MEMORY[0x1E4F29060];
        id v43 = v41;
        v44 = [v42 callStackSymbols];
        id v45 = [v44 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v61 = v41;
        __int16 v62 = 2114;
        v63 = v45;
        _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v31)
    {
      v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v61 = v33;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUNumberSetting initWithMinimum:maximum:uiMinimum:uiMaximum:attributes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 362, @"Invalid parameter not satisfying: %s", v46, v47, v48, v49, (uint64_t)"minValue != nil");
  }
  if (!v13)
  {
    __int16 v34 = NUAssertLogger_22888();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "maxValue != nil");
      *(_DWORD *)buf = 138543362;
      v61 = v35;
      _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v37 = NUAssertLogger_22888();
    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
    if (v36)
    {
      if (v38)
      {
        uint64_t v50 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v51 = (void *)MEMORY[0x1E4F29060];
        id v52 = v50;
        v53 = [v51 callStackSymbols];
        __int16 v54 = [v53 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v61 = v50;
        __int16 v62 = 2114;
        v63 = v54;
        _os_log_error_impl(&dword_1A9892000, v37, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v38)
    {
      uint64_t v39 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v40 = [v39 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v61 = v40;
      _os_log_error_impl(&dword_1A9892000, v37, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUNumberSetting initWithMinimum:maximum:uiMinimum:uiMaximum:attributes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 363, @"Invalid parameter not satisfying: %s", v55, v56, v57, v58, (uint64_t)"maxValue != nil");
  }
  BOOL v17 = v16;
  v59.receiver = self;
  v59.super_class = (Class)NUNumberSetting;
  BOOL v18 = [(NUModel *)&v59 initWithAttributes:v16];
  minimumValue = v18->_minimumValue;
  v18->_minimumValue = v12;
  v20 = v12;

  maximumValue = v18->_maximumValue;
  v18->_maximumValue = v13;
  v22 = v13;

  ui_minimumValue = v18->_ui_minimumValue;
  v18->_ui_minimumValue = v14;
  BOOL v24 = v14;

  ui_maximumValue = v18->_ui_maximumValue;
  v18->_ui_maximumValue = v15;

  return v18;
}

- (NUNumberSetting)initWithMinimum:(id)a3 maximum:(id)a4 attributes:(id)a5
{
  return [(NUNumberSetting *)self initWithMinimum:a3 maximum:a4 uiMinimum:0 uiMaximum:0 attributes:a5];
}

- (NUNumberSetting)initWithAttributes:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_22906);
  }
  v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSString;
    v7 = v5;
    id v8 = (objc_class *)objc_opt_class();
    double v9 = NSStringFromClass(v8);
    double v10 = NSStringFromSelector(a2);
    id v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
    *(_DWORD *)buf = 138543362;
    BOOL v31 = v11;
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
    double v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v14 = (void *)MEMORY[0x1E4F29060];
    double v15 = v13;
    id v16 = [v14 callStackSymbols];
    BOOL v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    BOOL v31 = v17;
    _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  BOOL v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v20 = (void *)MEMORY[0x1E4F29060];
  id v21 = specific;
  double v15 = v18;
  v22 = [v20 callStackSymbols];
  id v23 = [v22 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  BOOL v31 = specific;
  __int16 v32 = 2114;
  v33 = v23;
  _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  BOOL v24 = (objc_class *)objc_opt_class();
  uint64_t v25 = NSStringFromClass(v24);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUNumberSetting initWithAttributes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 351, @"Initializer not available: -[%@ %@], use designated initializer instead.", v26, v27, v28, v29, v25);
}

- (NUNumberSetting)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_22906);
  }
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSString;
    v5 = v3;
    id v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    double v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
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
    id v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F29060];
    double v13 = v11;
    v14 = [v12 callStackSymbols];
    double v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  id v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  BOOL v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  double v13 = v16;
  v20 = [v18 callStackSymbols];
  id v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v29 = specific;
  __int16 v30 = 2114;
  BOOL v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUNumberSetting init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 346, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

- (int64_t)type
{
  return 3;
}

+ (id)deserializeFromDictionary:(id)a3 error:(id *)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v19 = NUAssertLogger_22888();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      v53 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v22 = NUAssertLogger_22888();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        id v36 = [v34 callStackSymbols];
        v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v53 = v33;
        __int16 v54 = 2114;
        uint64_t v55 = v37;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      uint64_t v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v53 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUNumberSetting deserializeFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 483, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"dictionary != nil");
  }
  if (!a4)
  {
    uint64_t v26 = NUAssertLogger_22888();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v53 = v27;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v29 = NUAssertLogger_22888();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        uint64_t v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v43 = (void *)MEMORY[0x1E4F29060];
        id v44 = v42;
        id v45 = [v43 callStackSymbols];
        uint64_t v46 = [v45 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v53 = v42;
        __int16 v54 = 2114;
        uint64_t v55 = v46;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      BOOL v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v53 = v32;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUNumberSetting deserializeFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSetting.m", 484, @"Invalid parameter not satisfying: %s", v47, v48, v49, v50, (uint64_t)"error != NULL");
  }
  v7 = v6;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"minimum"];
  if (v8)
  {
    double v9 = (void *)v8;
    if (+[NUModel validateNumber:v8 error:a4])
    {
      uint64_t v10 = [v7 objectForKeyedSubscript:@"maximum"];
      if (v10)
      {
        id v11 = (void *)v10;
        if (+[NUModel validateNumber:v10 error:a4])
        {
          uint64_t v12 = [v7 objectForKeyedSubscript:@"ui_minimum"];
          if (v12 && !+[NUModel validateNumber:v12 error:a4])
          {
            +[NUError invalidError:@"Invalid ui_minimum value" object:v12];
            BOOL v17 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            double v13 = v12;
          }
          else
          {
            double v13 = [v7 objectForKeyedSubscript:@"ui_maximum"];
            if (v13 && !+[NUModel validateNumber:v13 error:a4])
            {
              +[NUError invalidError:@"Invalid ui_maximum value" object:v13];
              BOOL v17 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              id v14 = v13;
              id v51 = 0;
              double v15 = [a1 deserializeAttributesFromDictionary:v7 error:&v51];
              id v16 = v51;
              if (v15)
              {
                BOOL v17 = (void *)[objc_alloc((Class)a1) initWithMinimum:v9 maximum:v11 uiMinimum:v12 uiMaximum:v14 attributes:v15];
              }
              else
              {
                +[NUError errorWithCode:1 reason:@"Failed to deserialized attributes" object:v7 underlyingError:v16];
                BOOL v17 = 0;
                *a4 = (id)objc_claimAutoreleasedReturnValue();
              }
            }
          }
        }
        else
        {
          *a4 = +[NUError invalidError:@"Invalid maximum value" object:v11];

          BOOL v17 = 0;
        }
      }
      else
      {
        +[NUError missingError:@"Missing maximum value" object:v7];
        BOOL v17 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      *a4 = +[NUError invalidError:@"Invalid minimum value" object:v9];

      BOOL v17 = 0;
    }
  }
  else
  {
    +[NUError missingError:@"Missing minimum value" object:v7];
    BOOL v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

@end