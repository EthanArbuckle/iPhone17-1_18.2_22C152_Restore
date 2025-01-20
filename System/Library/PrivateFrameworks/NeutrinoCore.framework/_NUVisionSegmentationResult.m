@interface _NUVisionSegmentationResult
- (NSString)description;
- (NUImageBuffer)confidenceMapBuffer;
- (NUImageBuffer)matteImageBuffer;
- (_NUVisionSegmentationResult)init;
- (_NUVisionSegmentationResult)initWithSegmentedMatteBuffer:(id)a3 confidenceMapBuffer:(id)a4;
- (int64_t)segmentationType;
- (void)setSegmentationType:(int64_t)a3;
@end

@implementation _NUVisionSegmentationResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidenceBuffer, 0);

  objc_storeStrong((id *)&self->_buffer, 0);
}

- (void)setSegmentationType:(int64_t)a3
{
  self->_segmentationType = a3;
}

- (int64_t)segmentationType
{
  return self->_segmentationType;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(_NUVisionSegmentationResult *)self segmentationType];
  if ((unint64_t)(v5 - 1) > 2) {
    v6 = @"Unknown";
  }
  else {
    v6 = off_1E5D95400[v5 - 1];
  }
  return (NSString *)[v3 stringWithFormat:@"<%@: %p; type = %@>", v4, self, v6];
}

- (NUImageBuffer)confidenceMapBuffer
{
  return self->_confidenceBuffer;
}

- (NUImageBuffer)matteImageBuffer
{
  return self->_buffer;
}

- (_NUVisionSegmentationResult)initWithSegmentedMatteBuffer:(id)a3 confidenceMapBuffer:(id)a4
{
  v6 = (NUImageBuffer *)a3;
  v7 = (NUImageBuffer *)a4;
  v13.receiver = self;
  v13.super_class = (Class)_NUVisionSegmentationResult;
  v8 = [(_NUVisionSegmentationResult *)&v13 init];
  buffer = v8->_buffer;
  v8->_buffer = v6;
  v10 = v6;

  confidenceBuffer = v8->_confidenceBuffer;
  v8->_confidenceBuffer = v7;

  return v8;
}

- (_NUVisionSegmentationResult)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_20160);
  }
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = NSString;
    int64_t v5 = v3;
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_20160);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_20160);
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
    objc_super v13 = v11;
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
  objc_super v13 = v16;
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
  _NUAssertFailHandler((uint64_t)"-[_NUVisionSegmentationResult init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVisionSegmentationRequest.m", 73, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

@end