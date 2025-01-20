@interface NUMaskProperties
- ($0AC6E346AE4835514AAA8AC86D8F4844)size;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)bounds;
- (NUMaskProperties)init;
- (NUMaskProperties)initWithDensity:(double)a3 bounds:(id *)a4 size:(id)a5;
- (double)density;
@end

@implementation NUMaskProperties

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t height = self->_size.height;
  int64_t width = self->_size.width;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)bounds
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = self[1].var1;
  retstr->var0 = self[1].var0;
  retstr->$0AC6E346AE4835514AAA8AC86D8F4844 var1 = var1;
  return self;
}

- (double)density
{
  return self->_density;
}

- (NUMaskProperties)initWithDensity:(double)a3 bounds:(id *)a4 size:(id)a5
{
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  v11.receiver = self;
  v11.super_class = (Class)NUMaskProperties;
  $0AC6E346AE4835514AAA8AC86D8F4844 result = [(NUMaskProperties *)&v11 init];
  result->_density = a3;
  $0AC6E346AE4835514AAA8AC86D8F4844 v10 = a4->var1;
  result->_bounds.origin = ($86B46DF249C2B4242DBB096758D29184)a4->var0;
  result->_bounds.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)v10;
  result->_size.int64_t width = var0;
  result->_size.int64_t height = var1;
  return result;
}

- (NUMaskProperties)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_2769);
  }
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = NSString;
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = NSStringFromSelector(a2);
    v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_2769);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_2769);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    objc_super v11 = (void *)_NUAssertLogger;
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
  _NUAssertFailHandler((uint64_t)"-[NUMaskProperties init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUMaskUtilities.m", 16, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

@end