@interface NUVideoDataSourceDefinition
- (NSData)videoData;
- (NUVideoDataSourceDefinition)init;
- (NUVideoDataSourceDefinition)initWithVideoData:(id)a3 orientation:(int64_t)a4;
- (id)generateSourceNodeWithIdentifier:(id)a3 error:(id *)a4;
- (int64_t)mediaType;
- (int64_t)orientation;
@end

@implementation NUVideoDataSourceDefinition

- (id)generateSourceNodeWithIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [NUVideoSourceNode alloc];
  v7 = [(NUVideoDataSourceDefinition *)self videoData];
  v8 = [(NUSourceDefinition *)self sourceOptions];
  v9 = [(NUVideoSourceNode *)v6 initWithVideoData:v7 identifier:v5 options:v8];

  v10 = [(NUSingleSourceDefinition *)self sourceDerivation];
  [(NUSourceNode *)v9 setSourceDerivation:v10];

  return v9;
}

- (void).cxx_destruct
{
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (NSData)videoData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)mediaType
{
  return 2;
}

- (NUVideoDataSourceDefinition)initWithVideoData:(id)a3 orientation:(int64_t)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v6 = (NSData *)a3;
  if (!v6)
  {
    v11 = NUAssertLogger_7993();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "videoData != nil");
      *(_DWORD *)buf = 138543362;
      v29 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v14 = NUAssertLogger_7993();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        v21 = [v19 callStackSymbols];
        v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v29 = v18;
        __int16 v30 = 2114;
        v31 = v22;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v29 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoDataSourceDefinition initWithVideoData:orientation:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUSource.m", 245, @"Invalid parameter not satisfying: %s", v23, v24, v25, v26, (uint64_t)"videoData != nil");
  }
  v7 = v6;
  v27.receiver = self;
  v27.super_class = (Class)NUVideoDataSourceDefinition;
  v8 = [(NUSingleSourceDefinition *)&v27 init];
  videoData = v8->_videoData;
  v8->_videoData = v7;

  v8->_orientation = a4;
  return v8;
}

- (NUVideoDataSourceDefinition)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_8007);
  }
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = NSString;
    id v5 = v3;
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
    BOOL v15 = [v14 componentsJoinedByString:@"\n"];
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
  id v20 = [v18 callStackSymbols];
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
  _NUAssertFailHandler((uint64_t)"-[NUVideoDataSourceDefinition init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUSource.m", 240, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

@end