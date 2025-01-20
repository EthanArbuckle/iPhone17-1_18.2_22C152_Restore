@interface NUPixelCountScalePolicy
- ($0AC6E346AE4835514AAA8AC86D8F4844)scaleForImageSize:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NUPixelCountScalePolicy)init;
- (NUPixelCountScalePolicy)initWithTargetPixelCount:(int64_t)a3;
@end

@implementation NUPixelCountScalePolicy

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"{pixelCount=%ld}", self->_totalPixelCount);
}

- (NSString)debugDescription
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p> totalPixelCount=%ld", objc_opt_class(), self, self->_totalPixelCount];
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)scaleForImageSize:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a3.var0 < 1 || a3.var1 <= 0)
  {
    v19 = NUAssertLogger_24625();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "imageSize.width > 0 && imageSize.height > 0");
      *(_DWORD *)buf = 138543362;
      v36 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v22 = NUAssertLogger_24625();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        v29 = [v27 callStackSymbols];
        v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v36 = v26;
        __int16 v37 = 2114;
        v38 = v30;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v36 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUPixelCountScalePolicy scaleForImageSize:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUScalePolicy.m", 248, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)"imageSize.width > 0 && imageSize.height > 0");
  }
  int64_t totalPixelCount = self->_totalPixelCount;
  double v4 = (double)a3.var0 / (double)a3.var1;
  double v5 = sqrt((double)totalPixelCount / v4);
  unint64_t v6 = vcvtmd_s64_f64(v5);
  unint64_t v7 = vcvtpd_s64_f64(v4 * (double)(uint64_t)floor(v5));
  double v8 = sqrt(v4 * (double)totalPixelCount);
  unint64_t v9 = vcvtmd_s64_f64(v8);
  int64_t v10 = v7 * v6;
  int64_t v11 = vcvtpd_s64_f64((double)(uint64_t)floor(v8) / v4) * v9;
  if (v11 <= totalPixelCount) {
    unint64_t v12 = v9;
  }
  else {
    unint64_t v12 = v6;
  }
  if (v11 <= totalPixelCount) {
    int64_t var0 = a3.var0;
  }
  else {
    int64_t var0 = a3.var1;
  }
  BOOL v14 = v10 <= totalPixelCount;
  if (v10 <= totalPixelCount) {
    int64_t v15 = v6;
  }
  else {
    int64_t v15 = v9;
  }
  if (v14) {
    int64_t var1 = a3.var1;
  }
  else {
    int64_t var1 = a3.var0;
  }
  if (v10 < v11)
  {
    int64_t v15 = v12;
    int64_t var1 = var0;
  }
  if (v15 <= var1) {
    int64_t v17 = var1;
  }
  else {
    int64_t v17 = *((void *)&NUScaleOne + 1);
  }
  if (v15 <= var1) {
    int64_t v18 = v15;
  }
  else {
    int64_t v18 = NUScaleOne;
  }
  result.int64_t var1 = v17;
  result.int64_t var0 = v18;
  return result;
}

- (NUPixelCountScalePolicy)initWithTargetPixelCount:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a3 <= 0)
  {
    double v5 = NUAssertLogger_24625();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      unint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "targetPixelCount > 0");
      *(_DWORD *)buf = 138543362;
      BOOL v23 = v6;
      _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    double v8 = NUAssertLogger_24625();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
      {
        unint64_t v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v13 = (void *)MEMORY[0x1E4F29060];
        id v14 = v12;
        int64_t v15 = [v13 callStackSymbols];
        v16 = [v15 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v23 = v12;
        __int16 v24 = 2114;
        v25 = v16;
        _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v9)
    {
      int64_t v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      int64_t v11 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v23 = v11;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUPixelCountScalePolicy initWithTargetPixelCount:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUScalePolicy.m", 223, @"Invalid parameter not satisfying: %s", v17, v18, v19, v20, (uint64_t)"targetPixelCount > 0");
  }
  v21.receiver = self;
  v21.super_class = (Class)NUPixelCountScalePolicy;
  $0AC6E346AE4835514AAA8AC86D8F4844 result = [(NUPixelCountScalePolicy *)&v21 init];
  result->_int64_t totalPixelCount = a3;
  return result;
}

- (NUPixelCountScalePolicy)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_24595);
  }
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    double v4 = NSString;
    double v5 = v3;
    unint64_t v6 = (objc_class *)objc_opt_class();
    unint64_t v7 = NSStringFromClass(v6);
    double v8 = NSStringFromSelector(a2);
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
    int64_t v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    unint64_t v12 = (void *)MEMORY[0x1E4F29060];
    v13 = v11;
    id v14 = [v12 callStackSymbols];
    int64_t v15 = [v14 componentsJoinedByString:@"\n"];
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
  uint64_t v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUPixelCountScalePolicy init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUScalePolicy.m", 218, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

@end