@interface NUChannelMediaData
+ (id)mediaDataWithCIImage:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- (BOOL)evaluate:(id *)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NUChannelMediaData)initWithFormat:(id)a3;
- (NUChannelMediaData)initWithNode:(id)a3 format:(id)a4;
- (NUGeometry)geometry;
- (NUPipelineNode)node;
@end

@implementation NUChannelMediaData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_node, 0);

  objc_storeStrong((id *)&self->_geometry, 0);
}

- (NUPipelineNode)node
{
  return self->_node;
}

- (NUGeometry)geometry
{
  return (NUGeometry *)self->_geometry;
}

- (BOOL)evaluate:(id *)a3
{
  v5 = [(NUChannelMediaData *)self node];
  v6 = [v5 outputImageGeometry:a3];
  geometry = self->_geometry;
  self->_geometry = v6;

  return self->_geometry != 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1FA48];
  return self;
}

- (NSString)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NUChannelMediaData *)self node];
  v6 = [(NUChannelData *)self format];
  v7 = [v6 debugDescription];
  v8 = [v3 stringWithFormat:@"<%@:%p node:%@ format:%@>", v4, self, v5, v7];

  return (NSString *)v8;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = [(NUChannelData *)self format];
  v5 = [(NUChannelMediaData *)self node];
  v6 = [v3 stringWithFormat:@"%@=%@", v4, objc_opt_class()];

  return (NSString *)v6;
}

- (NUChannelMediaData)initWithNode:(id)a3 format:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v6 = (NUPipelineNode *)a3;
  id v7 = a4;
  if (!v6)
  {
    v12 = NUAssertLogger_3857();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "node != nil");
      *(_DWORD *)buf = 138543362;
      v30 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v15 = NUAssertLogger_3857();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        v22 = [v20 callStackSymbols];
        v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v30 = v19;
        __int16 v31 = 2114;
        v32 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v30 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUChannelMediaData initWithNode:format:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 629, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"node != nil");
  }
  v8 = v7;
  v28.receiver = self;
  v28.super_class = (Class)NUChannelMediaData;
  v9 = [(NUChannelData *)&v28 initWithFormat:v7];
  node = v9->_node;
  v9->_node = v6;

  return v9;
}

- (NUChannelMediaData)initWithFormat:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3784);
  }
  v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v6 = NSString;
    id v7 = v5;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = NSStringFromSelector(a2);
    v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
    *(_DWORD *)buf = 138543362;
    __int16 v31 = v11;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_3784);
      }
      goto LABEL_8;
    }
    if (v12 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_3784);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v14 = (void *)MEMORY[0x1E4F29060];
    v15 = v13;
    BOOL v16 = [v14 callStackSymbols];
    v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    __int16 v31 = v17;
    _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v20 = (void *)MEMORY[0x1E4F29060];
  id v21 = specific;
  v15 = v18;
  v22 = [v20 callStackSymbols];
  v23 = [v22 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  __int16 v31 = specific;
  __int16 v32 = 2114;
  uint64_t v33 = v23;
  _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v24 = (objc_class *)objc_opt_class();
  uint64_t v25 = NSStringFromClass(v24);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUChannelMediaData initWithFormat:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 625, @"Initializer not available: -[%@ %@], use designated initializer instead.", v26, v27, v28, v29, v25);
}

+ (id)mediaDataWithCIImage:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  v6 = objc_msgSend(v4, "stringWithFormat:", @"%llx", objc_msgSend(v5, "digest"));
  id v7 = [[NUCISourceNode alloc] initWithImage:v5 identifier:v6 orientation:1];

  v8 = [[NUChannelMediaFormat alloc] initWithMediaType:1];
  v9 = (void *)[objc_alloc((Class)a1) initWithNode:v7 format:v8];

  return v9;
}

@end