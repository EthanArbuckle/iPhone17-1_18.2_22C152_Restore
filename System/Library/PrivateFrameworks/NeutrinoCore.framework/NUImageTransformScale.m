@interface NUImageTransformScale
- ($0AC6E346AE4835514AAA8AC86D8F4844)scale;
- (BOOL)isIdentityImageTransform;
- (NUImageTransformScale)initWithAffineTransform:(CGAffineTransform *)a3;
- (NUImageTransformScale)initWithScale:(id)a3;
- (id)inverseTransform;
@end

@implementation NUImageTransformScale

- ($0AC6E346AE4835514AAA8AC86D8F4844)scale
{
  objc_copyStruct(v4, &self->_scale, 16, 1, 0);
  int64_t v2 = v4[0];
  int64_t v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (id)inverseTransform
{
  int64_t v2 = -[NUImageTransformScale initWithScale:]([NUImageTransformScale alloc], "initWithScale:", self->_scale.denominator, self->_scale.numerator);

  return v2;
}

- (BOOL)isIdentityImageTransform
{
  return self->_scale.numerator == self->_scale.denominator;
}

- (NUImageTransformScale)initWithScale:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a3.var0 < 1 || (int64_t var1 = a3.var1, a3.var1 <= 0))
  {
    v8 = NUAssertLogger_19081();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUScaleIsValid(scale)");
      *(_DWORD *)buf = 138543362;
      v27 = v9;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v11 = NUAssertLogger_19081();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v16 = (void *)MEMORY[0x1E4F29060];
        id v17 = v15;
        v18 = [v16 callStackSymbols];
        v19 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v27 = v15;
        __int16 v28 = 2114;
        v29 = v19;
        _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
      v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v27 = v14;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageTransformScale initWithScale:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUGeometryTransform.m", 482, @"Invalid parameter not satisfying: %s", v20, v21, v22, v23, (uint64_t)"NUScaleIsValid(scale)");
  }
  int64_t var0 = a3.var0;
  double v6 = NUScaleToDouble(a3.var0, a3.var1);
  CGAffineTransformMakeScale(&v25, v6, v6);
  v24.receiver = self;
  v24.super_class = (Class)NUImageTransformScale;
  $0AC6E346AE4835514AAA8AC86D8F4844 result = [(NUImageTransformAffine *)&v24 initWithAffineTransform:&v25];
  if (result)
  {
    result->_scale.numerator = var0;
    result->_scale.denominator = var1;
  }
  return result;
}

- (NUImageTransformScale)initWithAffineTransform:(CGAffineTransform *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_19038);
  }
  v4 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v5 = NSString;
    double v6 = v4;
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = NSStringFromSelector(a2);
    v10 = [v5 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v8, v9];
    *(_DWORD *)buf = 138543362;
    uint64_t v30 = v10;
    _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v11 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v11 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_19038);
      }
      goto LABEL_8;
    }
    if (v11 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_19038);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    BOOL v12 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v13 = (void *)MEMORY[0x1E4F29060];
    v14 = v12;
    v15 = [v13 callStackSymbols];
    v16 = [v15 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v30 = v16;
    _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  id v17 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v19 = (void *)MEMORY[0x1E4F29060];
  id v20 = specific;
  v14 = v17;
  uint64_t v21 = [v19 callStackSymbols];
  uint64_t v22 = [v21 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v30 = specific;
  __int16 v31 = 2114;
  v32 = v22;
  _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v23 = (objc_class *)objc_opt_class();
  uint64_t v24 = NSStringFromClass(v23);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUImageTransformScale initWithAffineTransform:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUGeometryTransform.m", 477, @"Initializer not available: -[%@ %@], use designated initializer instead.", v25, v26, v27, v28, v24);
}

@end