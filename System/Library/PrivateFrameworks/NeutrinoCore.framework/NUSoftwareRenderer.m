@interface NUSoftwareRenderer
- (NUSoftwareRenderer)init;
- (NUSoftwareRenderer)initWithCIContext:(id)a3 priority:(int64_t)a4;
- (id)name;
@end

@implementation NUSoftwareRenderer

- (id)name
{
  return @"Software renderer";
}

- (NUSoftwareRenderer)init
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *MEMORY[0x1E4F1E238];
  v10[0] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v4 = +[NURenderer _renderContextOptionsWithOptions:v3 nameSuffix:@"Software"];

  v5 = [MEMORY[0x1E4F1E018] contextWithOptions:v4];
  v8.receiver = self;
  v8.super_class = (Class)NUSoftwareRenderer;
  v6 = [(NURenderer *)&v8 initWithCIContext:v5 priority:2];

  return v6;
}

- (NUSoftwareRenderer)initWithCIContext:(id)a3 priority:(int64_t)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_21171);
  }
  v6 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v7 = NSString;
    objc_super v8 = v6;
    uint64_t v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = NSStringFromSelector(a2);
    v12 = [v7 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v10, v11];
    *(_DWORD *)buf = 138543362;
    v32 = v12;
    _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v13 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v13 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_21171);
      }
      goto LABEL_8;
    }
    if (v13 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_21171);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v14 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v15 = (void *)MEMORY[0x1E4F29060];
    v16 = v14;
    v17 = [v15 callStackSymbols];
    v18 = [v17 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v32 = v18;
    _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v19 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v21 = (void *)MEMORY[0x1E4F29060];
  id v22 = specific;
  v16 = v19;
  v23 = [v21 callStackSymbols];
  v24 = [v23 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v32 = specific;
  __int16 v33 = 2114;
  v34 = v24;
  _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v25 = (objc_class *)objc_opt_class();
  uint64_t v26 = NSStringFromClass(v25);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUSoftwareRenderer initWithCIContext:priority:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 308, @"Initializer not available: -[%@ %@], use designated initializer instead.", v27, v28, v29, v30, v26);
}

@end