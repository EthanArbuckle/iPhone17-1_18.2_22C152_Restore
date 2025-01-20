@interface NUTestPatternSourceDefinition
- ($0AC6E346AE4835514AAA8AC86D8F4844)size;
- (NUTestPatternSourceDefinition)init;
- (NUTestPatternSourceDefinition)initWithSize:(id)a3 orientation:(int64_t)a4;
- (id)generateSourceNodeWithIdentifier:(id)a3 error:(id *)a4;
- (int64_t)mediaType;
- (int64_t)orientation;
@end

@implementation NUTestPatternSourceDefinition

- (int64_t)orientation
{
  return self->_orientation;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  int64_t v2 = v4[0];
  int64_t v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (int64_t)mediaType
{
  return 1;
}

- (NUTestPatternSourceDefinition)initWithSize:(id)a3 orientation:(int64_t)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  v8.receiver = self;
  v8.super_class = (Class)NUTestPatternSourceDefinition;
  $0AC6E346AE4835514AAA8AC86D8F4844 result = [(NUSingleSourceDefinition *)&v8 init];
  result->_size.width = var0;
  result->_size.height = var1;
  result->_orientation = a4;
  return result;
}

- (NUTestPatternSourceDefinition)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_8007);
  }
  int64_t v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = NSString;
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    objc_super v8 = NSStringFromSelector(a2);
    v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_8007);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_8007);
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
  _NUAssertFailHandler((uint64_t)"-[NUTestPatternSourceDefinition init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUSource.m", 266, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

- (id)generateSourceNodeWithIdentifier:(id)a3 error:(id *)a4
{
  v5 = [NUTestPatternSourceNode alloc];
  uint64_t v6 = [(NUTestPatternSourceDefinition *)self size];
  objc_super v8 = -[NUTestPatternSourceNode initWithSize:orientation:](v5, "initWithSize:orientation:", v6, v7, [(NUTestPatternSourceDefinition *)self orientation]);
  v9 = [(NUSingleSourceDefinition *)self sourceDerivation];
  [(NUSourceNode *)v8 setSourceDerivation:v9];

  return v8;
}

@end