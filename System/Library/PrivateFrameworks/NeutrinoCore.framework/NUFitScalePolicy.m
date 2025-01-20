@interface NUFitScalePolicy
- ($0AC6E346AE4835514AAA8AC86D8F4844)scaleForImageSize:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NUFitScalePolicy)init;
- (NUFitScalePolicy)initWithTargetPixelSize:(id)a3;
- (NUFitScalePolicy)initWithTargetSize:(CGSize)a3;
@end

@implementation NUFitScalePolicy

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"{fit: %ldx%ld}", self->_size.width, self->_size.height);
}

- (NSString)debugDescription
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%p> fitInSize=(%ld, %ld)", objc_opt_class(), self, self->_size.width, self->_size.height];
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)scaleForImageSize:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a3.var0 || !a3.var1)
  {
    v9 = NUAssertLogger_24625();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "!NUPixelSizeIsEmpty(imageSize)");
      *(_DWORD *)buf = 138543362;
      v26 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v12 = NUAssertLogger_24625();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        v19 = [v17 callStackSymbols];
        v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v26 = v16;
        __int16 v27 = 2114;
        v28 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v26 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUFitScalePolicy scaleForImageSize:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUScalePolicy.m", 102, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"!NUPixelSizeIsEmpty(imageSize)");
  }
  uint64_t v3 = NUScaleToFitSizeInSize(a3.var0, a3.var1, self->_size.width, self->_size.height);
  int64_t v5 = v4;
  uint64_t v6 = NUScaleCompare(v3, v4, NUScaleOne, *((uint64_t *)&NUScaleOne + 1));
  if (v6 >= 0) {
    int64_t v7 = *((void *)&NUScaleOne + 1);
  }
  else {
    int64_t v7 = v5;
  }
  if (v6 >= 0) {
    int64_t v8 = NUScaleOne;
  }
  else {
    int64_t v8 = v3;
  }
  result.var1 = v7;
  result.var0 = v8;
  return result;
}

- (NUFitScalePolicy)initWithTargetPixelSize:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a3.var0 || (int64_t var1 = a3.var1) == 0)
  {
    uint64_t v6 = NUAssertLogger_24625();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "!NUPixelSizeIsEmpty(size)");
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v9 = NUAssertLogger_24625();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        BOOL v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        v16 = [v14 callStackSymbols];
        v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v24 = v13;
        __int16 v25 = 2114;
        v26 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUFitScalePolicy initWithTargetPixelSize:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUScalePolicy.m", 91, @"Invalid parameter not satisfying: %s", v18, v19, v20, v21, (uint64_t)"!NUPixelSizeIsEmpty(size)");
  }
  int64_t var0 = a3.var0;
  v22.receiver = self;
  v22.super_class = (Class)NUFitScalePolicy;
  $0AC6E346AE4835514AAA8AC86D8F4844 result = [(NUFitScalePolicy *)&v22 init];
  result->_size.width = var0;
  result->_size.height = var1;
  return result;
}

- (NUFitScalePolicy)initWithTargetSize:(CGSize)a3
{
  return -[NUFitScalePolicy initWithTargetPixelSize:](self, "initWithTargetPixelSize:", vcvtpd_s64_f64(a3.width), vcvtpd_s64_f64(a3.height));
}

- (NUFitScalePolicy)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_24595);
  }
  uint64_t v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = NSString;
    int64_t v5 = v3;
    uint64_t v6 = (objc_class *)objc_opt_class();
    int64_t v7 = NSStringFromClass(v6);
    int64_t v8 = NSStringFromSelector(a2);
    v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v9;
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
    BOOL v13 = v11;
    v14 = [v12 callStackSymbols];
    id v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v15;
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
  BOOL v13 = v16;
  uint64_t v20 = [v18 callStackSymbols];
  uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v29 = specific;
  __int16 v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  objc_super v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUFitScalePolicy init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUScalePolicy.m", 81, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

@end