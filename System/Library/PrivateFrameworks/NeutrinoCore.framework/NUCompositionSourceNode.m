@interface NUCompositionSourceNode
- ($0AC6E346AE4835514AAA8AC86D8F4844)pixelSizeWithSourceOptions:(id)a3;
- (BOOL)load:(id *)a3;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NUCompositionSourceNode)initWithComposition:(id)a3 renderPipeline:(id)a4 settings:(id)a5;
- (NUCompositionSourceNode)initWithSettings:(id)a3;
- (id)_compositionRenderNodeForPipelineState:(id)a3 error:(id *)a4;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateImageGeometryWithSourceOptions:(id)a3 error:(id *)a4;
- (id)_evaluateImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4;
- (id)preparedNodeWithSourceContainer:(id)a3 pipelineState:(id)a4 pipelineSettings:(id)a5 sourceSettings:(id)a6 error:(id *)a7;
@end

@implementation NUCompositionSourceNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composition, 0);

  objc_storeStrong((id *)&self->_renderPipeline, 0);
}

- (id)_evaluateImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4
{
  v6 = objc_alloc_init(NURenderPipelineState);
  [(NURenderPipelineState *)v6 setEvaluationMode:0];
  [(NURenderPipelineState *)v6 setMediaComponentType:1];
  v7 = [(NUCompositionSourceNode *)self _compositionRenderNodeForPipelineState:v6 error:a4];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 imageProperties:a4];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_evaluateImageGeometryWithSourceOptions:(id)a3 error:(id *)a4
{
  v6 = objc_alloc_init(NURenderPipelineState);
  [(NURenderPipelineState *)v6 setEvaluationMode:0];
  [(NURenderPipelineState *)v6 setMediaComponentType:1];
  v7 = [(NUCompositionSourceNode *)self _compositionRenderNodeForPipelineState:v6 error:a4];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 outputImageGeometry:a4];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)preparedNodeWithSourceContainer:(id)a3 pipelineState:(id)a4 pipelineSettings:(id)a5 sourceSettings:(id)a6 error:(id *)a7
{
  return -[NUCompositionSourceNode _compositionRenderNodeForPipelineState:error:](self, "_compositionRenderNodeForPipelineState:error:", a4, a7, a5, a6);
}

- (id)_compositionRenderNodeForPipelineState:(id)a3 error:(id *)a4
{
  v6 = (void *)[a3 copy];
  [v6 resetRenderTagGroups];
  v7 = [(NURenderPipeline *)self->_renderPipeline processedRenderNodeForComposition:self->_composition pipelineState:v6 error:a4];

  return v7;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)pixelSizeWithSourceOptions:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t width = self->_pixelSize.width;
  int64_t height = self->_pixelSize.height;
  if (width) {
    BOOL v7 = height == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v10 = NUAssertLogger_19996();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = [NSString stringWithFormat:@"%@ not loaded", self];
      *(_DWORD *)buf = 138543362;
      v27 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v13 = NUAssertLogger_19996();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        v20 = [v18 callStackSymbols];
        v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v27 = v17;
        __int16 v28 = 2114;
        v29 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v27 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSourceNode pixelSizeWithSourceOptions:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Composition.m", 89, @"%@ not loaded", v22, v23, v24, v25, (uint64_t)self);
  }

  int64_t v8 = width;
  int64_t v9 = height;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (BOOL)load:(id *)a3
{
  p_pixelSize = &self->_pixelSize;
  if (self->_pixelSize.width) {
    BOOL v4 = self->_pixelSize.height == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    return 1;
  }
  id v13 = 0;
  BOOL v7 = [(NURenderNode *)self outputImageGeometry:&v13];
  if (v7)
  {
    int64_t v8 = v7;
    p_pixelSize->int64_t width = [v7 scaledSize];
    p_pixelSize->int64_t height = v9;

    return 1;
  }
  id v11 = v13;
  id v12 = +[NUError errorWithCode:1 reason:@"Failed to compute image geometry" object:self underlyingError:v11];

  BOOL result = 0;
  *a3 = v12;
  return result;
}

- (id)_evaluateImage:(id *)a3
{
  if (a3)
  {
    *a3 = +[NUError errorWithCode:9 reason:@"NUCompositionSourceNode does not provide images directly" object:self];
  }
  return 0;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return 1;
}

- (NUCompositionSourceNode)initWithSettings:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_20009);
  }
  v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v6 = NSString;
    BOOL v7 = v5;
    int64_t v8 = (objc_class *)objc_opt_class();
    int64_t v9 = NSStringFromClass(v8);
    v10 = NSStringFromSelector(a2);
    id v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
    *(_DWORD *)buf = 138543362;
    v31 = v11;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_20009);
      }
      goto LABEL_8;
    }
    if (v12 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_20009);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    id v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    BOOL v14 = (void *)MEMORY[0x1E4F29060];
    v15 = v13;
    v16 = [v14 callStackSymbols];
    v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v31 = v17;
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
  uint64_t v22 = [v20 callStackSymbols];
  uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v31 = specific;
  __int16 v32 = 2114;
  v33 = v23;
  _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v24 = (objc_class *)objc_opt_class();
  uint64_t v25 = NSStringFromClass(v24);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUCompositionSourceNode initWithSettings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Composition.m", 53, @"Initializer not available: -[%@ %@], use designated initializer instead.", v26, v27, v28, v29, v25);
}

- (NUCompositionSourceNode)initWithComposition:(id)a3 renderPipeline:(id)a4 settings:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  int64_t v8 = (NUComposition *)a3;
  int64_t v9 = (NURenderPipeline *)a4;
  id v10 = a5;
  if (!v8)
  {
    v17 = NUAssertLogger_19996();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "composition != nil");
      *(_DWORD *)buf = 138543362;
      v51 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v20 = NUAssertLogger_19996();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __int16 v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        uint64_t v34 = [v32 callStackSymbols];
        v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v51 = v31;
        __int16 v52 = 2114;
        v53 = v35;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      uint64_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v51 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSourceNode initWithComposition:renderPipeline:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Composition.m", 40, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"composition != nil");
  }
  if (!v9)
  {
    uint64_t v24 = NUAssertLogger_19996();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pipeline != nil");
      *(_DWORD *)buf = 138543362;
      v51 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v27 = NUAssertLogger_19996();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        v43 = [v41 callStackSymbols];
        v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v51 = v40;
        __int16 v52 = 2114;
        v53 = v44;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      uint64_t v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v51 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSourceNode initWithComposition:renderPipeline:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Composition.m", 41, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"pipeline != nil");
  }
  id v11 = v10;
  v49.receiver = self;
  v49.super_class = (Class)NUCompositionSourceNode;
  uint64_t v12 = [(NUSourceNode *)&v49 initWithSettings:v10];
  composition = v12->_composition;
  v12->_composition = v8;
  BOOL v14 = v8;

  renderPipeline = v12->_renderPipeline;
  v12->_renderPipeline = v9;

  return v12;
}

@end