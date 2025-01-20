@interface NUFixedScalePolicy
+ (id)oneToOneScalePolicy;
- ($0AC6E346AE4835514AAA8AC86D8F4844)scale;
- ($0AC6E346AE4835514AAA8AC86D8F4844)scaleForImageSize:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NUFixedScalePolicy)init;
- (NUFixedScalePolicy)initWithScale:(id)a3;
- (unint64_t)hash;
@end

@implementation NUFixedScalePolicy

- ($0AC6E346AE4835514AAA8AC86D8F4844)scale
{
  objc_copyStruct(v4, &self->_scale, 16, 1, 0);
  int64_t v2 = v4[0];
  int64_t v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (NSString)description
{
  int64_t v2 = NSString;
  int64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%ld:%ld", self->_scale.numerator, self->_scale.denominator);
  v4 = [v2 stringWithFormat:@"{scale=%@}", v3];

  return (NSString *)v4;
}

- (NSString)debugDescription
{
  int64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%ld:%ld", self->_scale.numerator, self->_scale.denominator);
  v6 = [v3 stringWithFormat:@"<%@:%p> scale=%@", v4, self, v5];

  return (NSString *)v6;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)scaleForImageSize:(id)a3
{
  int64_t denominator = self->_scale.denominator;
  int64_t numerator = self->_scale.numerator;
  result.var1 = denominator;
  result.var0 = numerator;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (NUFixedScalePolicy *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(NUFixedScalePolicy *)v4 scale];
      BOOL v7 = NUScaleEqual(v5, v6, self->_scale.numerator, self->_scale.denominator);
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return (0x140882F66A61D9 * self->_scale.denominator) ^ (0x42D179A95A067 * self->_scale.numerator);
}

- (NUFixedScalePolicy)initWithScale:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  v6.receiver = self;
  v6.super_class = (Class)NUFixedScalePolicy;
  $0AC6E346AE4835514AAA8AC86D8F4844 result = [(NUFixedScalePolicy *)&v6 init];
  result->_scale.int64_t numerator = var0;
  result->_scale.int64_t denominator = var1;
  return result;
}

- (NUFixedScalePolicy)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_24595);
  }
  int64_t v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = NSString;
    uint64_t v5 = v3;
    objc_super v6 = (objc_class *)objc_opt_class();
    BOOL v7 = NSStringFromClass(v6);
    v8 = NSStringFromSelector(a2);
    v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
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
    v14 = [v12 callStackSymbols];
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
  v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  v13 = v16;
  v20 = [v18 callStackSymbols];
  v21 = [v20 componentsJoinedByString:@"\n"];
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
  _NUAssertFailHandler((uint64_t)"-[NUFixedScalePolicy init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUScalePolicy.m", 19, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

+ (id)oneToOneScalePolicy
{
  id v2 = objc_alloc((Class)a1);
  int64_t v3 = (void *)[v2 initWithScale:NUScaleOne];

  return v3;
}

@end