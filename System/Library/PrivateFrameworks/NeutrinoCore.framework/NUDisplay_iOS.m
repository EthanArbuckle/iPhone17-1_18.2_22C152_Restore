@interface NUDisplay_iOS
+ (id)displays;
+ (id)mainDisplay;
- ($0AC6E346AE4835514AAA8AC86D8F4844)size;
- (BOOL)wideColor;
- (CADisplay)display;
- (NSString)description;
- (NSString)name;
- (NUColorSpace)colorSpace;
- (NUDisplay_iOS)init;
- (NUDisplay_iOS)initWithCADisplay:(id)a3;
- (NUPixelFormat)pixelFormat;
- (id)identifier;
@end

@implementation NUDisplay_iOS

- (void).cxx_destruct
{
}

- (CADisplay)display
{
  return self->_display;
}

- (NUColorSpace)colorSpace
{
  if (+[NUGlobalSettings displayForceDeepColor])
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_98);
    }
    v3 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A9892000, v3, OS_LOG_TYPE_INFO, "Deep color is forcibly enabled", v6, 2u);
    }
    v4 = +[NUColorSpace itur2100HLGColorSpace];
  }
  else
  {
    if ([(NUDisplay_iOS *)self wideColor]) {
      +[NUColorSpace displayP3ColorSpace];
    }
    else {
    v4 = +[NUColorSpace sRGBColorSpace];
    }
  }

  return (NUColorSpace *)v4;
}

- (NUPixelFormat)pixelFormat
{
  if ([(NUDisplay_iOS *)self wideColor]) {
    +[NUPixelFormat A2RGB10];
  }
  else {
  v2 = +[NUPixelFormat BGRA8];
  }

  return (NUPixelFormat *)v2;
}

- (BOOL)wideColor
{
  char v2 = [(CADisplay *)self->_display supportsExtendedColors];
  if (+[NUGlobalSettings displayDisableDeepColor])
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_98);
    }
    v3 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9892000, v3, OS_LOG_TYPE_INFO, "Deep color is disabled", buf, 2u);
    }
    return 0;
  }
  else if (+[NUGlobalSettings displayForceDeepColor])
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_98);
    }
    v4 = _NULogger;
    char v2 = 1;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A9892000, v4, OS_LOG_TYPE_INFO, "Deep color is forcibly enabled", v6, 2u);
    }
  }
  return v2;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  char v2 = [(CADisplay *)self->_display currentMode];
  uint64_t v3 = [v2 width];
  uint64_t v4 = [v2 height];

  int64_t v5 = v3;
  int64_t v6 = v4;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (id)identifier
{
  return (id)[(CADisplay *)self->_display uniqueId];
}

- (NSString)name
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(CADisplay *)self->_display name];
  int64_t v5 = [(CADisplay *)self->_display deviceName];
  int64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (NSString)description
{
  uint64_t v3 = [(NUDisplay_iOS *)self size];
  uint64_t v5 = v4;
  int64_t v6 = NSString;
  uint64_t v7 = objc_opt_class();
  v8 = [(NUDisplay_iOS *)self identifier];
  v9 = [(NUDisplay_iOS *)self name];
  v10 = [(NUDisplay_iOS *)self pixelFormat];
  v11 = [(NUDisplay_iOS *)self colorSpace];
  v12 = [v11 name];
  v13 = [v6 stringWithFormat:@"<%@:%p id=%@ name=%@ size=%dx%d format: %@ space: %@>", v7, self, v8, v9, v3, v5, v10, v12];

  return (NSString *)v13;
}

- (NUDisplay_iOS)initWithCADisplay:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (CADisplay *)a3;
  if (!v4)
  {
    v9 = NUAssertLogger_10624();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "display != nil");
      *(_DWORD *)buf = 138543362;
      v27 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v12 = NUAssertLogger_10624();
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
        v27 = v16;
        __int16 v28 = 2114;
        v29 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v27 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUDisplay_iOS initWithCADisplay:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUDisplay_iOS.m", 44, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"display != nil");
  }
  uint64_t v5 = v4;
  v25.receiver = self;
  v25.super_class = (Class)NUDisplay_iOS;
  int64_t v6 = [(NUDisplay_iOS *)&v25 init];
  display = v6->_display;
  v6->_display = v5;

  return v6;
}

- (NUDisplay_iOS)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_10639);
  }
  uint64_t v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = NSString;
    uint64_t v5 = v3;
    int64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    v8 = NSStringFromSelector(a2);
    v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_10639);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_10639);
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
  id v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  BOOL v13 = v16;
  v20 = [v18 callStackSymbols];
  uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  __int16 v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUDisplay_iOS init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUDisplay_iOS.m", 39, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

+ (id)mainDisplay
{
  char v2 = [NUDisplay_iOS alloc];
  uint64_t v3 = [MEMORY[0x1E4F39B60] mainDisplay];
  uint64_t v4 = [(NUDisplay_iOS *)v2 initWithCADisplay:v3];

  return v4;
}

+ (id)displays
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F39B60], "displays", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [[NUDisplay_iOS alloc] initWithCADisplay:*(void *)(*((void *)&v10 + 1) + 8 * i)];
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

@end