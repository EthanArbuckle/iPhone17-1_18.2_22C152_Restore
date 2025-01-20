@interface NUFitHeightScalePolicy
- ($0AC6E346AE4835514AAA8AC86D8F4844)scaleForImageSize:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NUFitHeightScalePolicy)init;
- (NUFitHeightScalePolicy)initWithHeight:(int64_t)a3;
@end

@implementation NUFitHeightScalePolicy

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"{Fit height:%ld}", self->_height);
}

- (NSString)debugDescription
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p> height=%ld", objc_opt_class(), self, self->_height];
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)scaleForImageSize:(id)a3
{
  if (a3.var1) {
    BOOL v3 = a3.var1 <= self->_height;
  }
  else {
    BOOL v3 = 1;
  }
  int v4 = v3;
  if (v4) {
    int64_t height = NUScaleOne;
  }
  else {
    int64_t height = self->_height;
  }
  if (v4) {
    int64_t var1 = *((void *)&NUScaleOne + 1);
  }
  else {
    int64_t var1 = a3.var1;
  }
  result.int64_t var1 = var1;
  result.var0 = height;
  return result;
}

- (NUFitHeightScalePolicy)initWithHeight:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a3 <= 0)
  {
    v5 = NUAssertLogger_24625();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "height > 0");
      *(_DWORD *)buf = 138543362;
      v23 = v6;
      _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v8 = NUAssertLogger_24625();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
      {
        v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v13 = (void *)MEMORY[0x1E4F29060];
        id v14 = v12;
        v15 = [v13 callStackSymbols];
        v16 = [v15 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v23 = v12;
        __int16 v24 = 2114;
        v25 = v16;
        _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v9)
    {
      v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      v11 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v23 = v11;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUFitHeightScalePolicy initWithHeight:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUScalePolicy.m", 367, @"Invalid parameter not satisfying: %s", v17, v18, v19, v20, (uint64_t)"height > 0");
  }
  v21.receiver = self;
  v21.super_class = (Class)NUFitHeightScalePolicy;
  $0AC6E346AE4835514AAA8AC86D8F4844 result = [(NUFitHeightScalePolicy *)&v21 init];
  result->_int64_t height = a3;
  return result;
}

- (NUFitHeightScalePolicy)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_24595);
  }
  BOOL v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    int v4 = NSString;
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = NSStringFromSelector(a2);
    BOOL v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_24595);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_24595);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v12 = (void *)MEMORY[0x1E4F29060];
    v13 = v11;
    id v14 = [v12 callStackSymbols];
    v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  v13 = v16;
  uint64_t v20 = [v18 callStackSymbols];
  objc_super v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  __int16 v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUFitHeightScalePolicy init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUScalePolicy.m", 362, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

@end