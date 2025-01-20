@interface NUZoomFactorScalePolicy
- ($0AC6E346AE4835514AAA8AC86D8F4844)scaleForImageSize:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NUZoomFactorScalePolicy)init;
- (NUZoomFactorScalePolicy)initWithZoomFactor:(double)a3;
@end

@implementation NUZoomFactorScalePolicy

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"{zoomFactor=%0.3f}", *(void *)&self->_zoomFactor);
}

- (NSString)debugDescription
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p> zoomFactor=%0.3f", objc_opt_class(), self, *(void *)&self->_zoomFactor];
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)scaleForImageSize:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  double zoomFactor = self->_zoomFactor;
  uint64_t v6 = vcvtpd_s64_f64(zoomFactor * (double)a3.var0);
  uint64_t v7 = vcvtpd_s64_f64(zoomFactor * (double)a3.var1);
  if ((v6 | v7) < 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = objc_msgSend(NSString, "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
    [v12 handleFailureInFunction:v13, @"NUGeometryPrimitives.h", 38, @"Invalid parameter not satisfying: %@", @"(width >= 0) && (height >= 0)" file lineNumber description];
  }
  uint64_t v8 = NUScaleCompare(v6, var0, v7, var1);
  BOOL v9 = v8 == -1;
  if (v8 == -1) {
    int64_t v10 = v6;
  }
  else {
    int64_t v10 = v7;
  }
  if (v9) {
    int64_t v11 = var0;
  }
  else {
    int64_t v11 = var1;
  }
  result.int64_t var1 = v11;
  result.int64_t var0 = v10;
  return result;
}

- (NUZoomFactorScalePolicy)initWithZoomFactor:(double)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3 <= 0.0)
  {
    uint64_t v6 = NUAssertLogger_24625();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "zoomFactor > 0");
      *(_DWORD *)buf = 138543362;
      v24 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v9 = NUAssertLogger_24625();
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
        v24 = v13;
        __int16 v25 = 2114;
        v26 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      int64_t v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v24 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUZoomFactorScalePolicy initWithZoomFactor:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUScalePolicy.m", 310, @"Invalid parameter not satisfying: %s", v18, v19, v20, v21, (uint64_t)"zoomFactor > 0");
  }
  v22.receiver = self;
  v22.super_class = (Class)NUZoomFactorScalePolicy;
  $0AC6E346AE4835514AAA8AC86D8F4844 result = [(NUZoomFactorScalePolicy *)&v22 init];
  double v5 = 1.0;
  if (a3 <= 1.0) {
    double v5 = a3;
  }
  result->_double zoomFactor = v5;
  return result;
}

- (NUZoomFactorScalePolicy)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_24595);
  }
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = NSString;
    double v5 = v3;
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(a2);
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
    v12 = (void *)MEMORY[0x1E4F29060];
    v13 = v11;
    v14 = [v12 callStackSymbols];
    id v15 = [v14 componentsJoinedByString:@"\n"];
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
  uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  __int16 v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  objc_super v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUZoomFactorScalePolicy init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUScalePolicy.m", 305, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

@end