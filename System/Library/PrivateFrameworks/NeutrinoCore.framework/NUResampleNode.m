@interface NUResampleNode
- ($0AC6E346AE4835514AAA8AC86D8F4844)_additionalScale;
- (BOOL)isGeometryNode;
- (NUResampleNode)initWithInput:(id)a3 settings:(id)a4;
- (NUResampleNode)initWithPreparedInput:(id)a3 subsampleNode:(id)a4;
- (NUResampleNode)initWithSubsampleFactor:(int64_t)a3 sampleMode:(int64_t)a4 source:(id)a5 subsampleNode:(id)a6;
- (NUSubsampleNode)subsampleNode;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateImageGeometry:(id *)a3;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (int64_t)sampleMode;
- (int64_t)subsampleFactor;
@end

@implementation NUResampleNode

- (void).cxx_destruct
{
}

- (NUSubsampleNode)subsampleNode
{
  return (NUSubsampleNode *)objc_getProperty(self, a2, 184, 1);
}

- (int64_t)sampleMode
{
  return self->_sampleMode;
}

- (int64_t)subsampleFactor
{
  return self->_subsampleFactor;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  v5 = [(NUAbstractScaleNode *)self inputNode];
  v6 = [v5 outputImageGeometry:a3];

  if (v6)
  {
    if ([(NUResampleNode *)self subsampleFactor])
    {
      uint64_t v7 = [(NUResampleNode *)self subsampleFactor];
      uint64_t v8 = [v6 renderScale];
      uint64_t v10 = NUScaleMultiply(1, v7, v8, v9);
      uint64_t v12 = v11;
      v13 = [NUImageGeometry alloc];
      [v6 extent];
      v14 = -[NUImageGeometry initWithExtent:renderScale:orientation:](v13, "initWithExtent:renderScale:orientation:", &v17, v10, v12, [v6 orientation]);
    }
    else
    {
      v14 = v6;
    }
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)isGeometryNode
{
  return 1;
}

- (id)_evaluateImage:(id *)a3
{
  v5 = [(NUAbstractScaleNode *)self inputNode];
  v6 = [v5 outputImage:a3];

  if (v6)
  {
    uint64_t v7 = [(NUResampleNode *)self _additionalScale];
    uint64_t v9 = v8;
    if (!NUScaleEqual(v7, v8, NUScaleOne, *((uint64_t *)&NUScaleOne + 1)))
    {
      uint64_t v10 = [(NURenderNode *)self outputImageGeometry:a3];
      if (v10)
      {
        uint64_t v11 = (void *)v10;
        uint64_t v12 = [(NURenderNode *)self resamplingColorSpace];
        int64_t sampleMode = self->_sampleMode;
        [v11 physicalScaledExtent];
        uint64_t v14 = +[NURenderNode resampleImage:by:sampleMode:extent:colorSpace:](NURenderNode, "resampleImage:by:sampleMode:extent:colorSpace:", v6, v7, v9, sampleMode, &v16, v12);

        v6 = v11;
      }
      else
      {
        uint64_t v14 = 0;
      }

      v6 = (void *)v14;
    }
  }

  return v6;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_additionalScale
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NUSubsampleNode *)self->_subsampleNode appliedSubsampleFactor];
  if (v3 <= 0)
  {
    uint64_t v11 = NUAssertLogger_11920();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [NSString stringWithFormat:@"Bad subsample factor"];
      *(_DWORD *)buf = 138543362;
      v45 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v14 = NUAssertLogger_11920();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        v28 = [v26 callStackSymbols];
        v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v45 = v25;
        __int16 v46 = 2114;
        v47 = v29;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      uint64_t v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v45 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUResampleNode _additionalScale]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 628, @"Bad subsample factor", v30, v31, v32, v33, v43);
  }
  uint64_t v4 = v3;
  if (![(NUResampleNode *)self subsampleFactor])
  {
    v18 = NUAssertLogger_11920();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = [NSString stringWithFormat:@"%@: invalid subsample factor", self];
      *(_DWORD *)buf = 138543362;
      v45 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v21 = NUAssertLogger_11920();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v22)
      {
        v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        v37 = [v35 callStackSymbols];
        v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v45 = v34;
        __int16 v46 = 2114;
        v47 = v38;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v45 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUResampleNode _additionalScale]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 631, @"%@: invalid subsample factor", v39, v40, v41, v42, (uint64_t)self);
  }
  uint64_t v5 = [(NUResampleNode *)self subsampleFactor];
  int64_t v7 = *((void *)&NUScaleOne + 1);
  uint64_t v6 = NUScaleOne;
  if (NUScaleCompare(1, v4, 1, v5) >= 1)
  {
    uint64_t v6 = NUScaleDivide(1, v5, 1, v4);
    int64_t v7 = v8;
  }
  int64_t v9 = v6;
  int64_t v10 = v7;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v9 scale] < 1 || v10 <= 0)
  {
    v19 = NUAssertLogger_11920();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = [NSString stringWithFormat:@"Invalid render scale"];
      *(_DWORD *)v35 = 138543362;
      *(void *)&v35[4] = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v35, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v22 = NUAssertLogger_11920();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        v29 = [v27 callStackSymbols];
        uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)v35 = 138543618;
        *(void *)&v35[4] = v26;
        __int16 v36 = 2114;
        v37 = v30;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v35, 0x16u);
      }
    }
    else if (v23)
    {
      v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)v35 = 138543362;
      *(void *)&v35[4] = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v35, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUResampleNode nodeByReplayingAgainstCache:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 584, @"Invalid render scale", v31, v32, v33, v34, *(uint64_t *)v35);
  }
  uint64_t v11 = [(NUAbstractScaleNode *)self inputNode];
  uint64_t v12 = [(NUSubsampleNode *)v11 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];
  v13 = v12;
  if (!v12)
  {
    id v16 = 0;
    goto LABEL_15;
  }
  if ([v12 isPlaceholderNode]
    || ![(NUAbstractScaleNode *)self shouldCacheNodeForPipelineState:v9])
  {
    id v16 = v13;
    goto LABEL_15;
  }
  subsampleNode = self->_subsampleNode;
  if (v11 == subsampleNode)
  {
    id v15 = v13;
LABEL_12:
    id v16 = (id)[v15 resolveSubsampleFactorForPipelineState:v9 error:a5];
    if (v16)
    {
      uint64_t v17 = -[NUResampleNode initWithSubsampleFactor:sampleMode:source:subsampleNode:]([NUResampleNode alloc], "initWithSubsampleFactor:sampleMode:source:subsampleNode:", v16, [v9 sampleMode], v13, v15);
      id v16 = +[NURenderNode nodeFromCache:v17 cache:v8];

      objc_msgSend(v16, "setEvaluatedForMode:", objc_msgSend(v9, "evaluationMode"));
    }
    goto LABEL_14;
  }
  id v15 = [(NUSubsampleNode *)subsampleNode nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];
  if (v15) {
    goto LABEL_12;
  }
  id v16 = 0;
LABEL_14:

LABEL_15:

  return v16;
}

- (NUResampleNode)initWithSubsampleFactor:(int64_t)a3 sampleMode:(int64_t)a4 source:(id)a5 subsampleNode:(id)a6
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  uint64_t v11 = (NUSubsampleNode *)a6;
  if (a3 < 0)
  {
    v19 = NUAssertLogger_11920();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "subsampleFactor >= 0");
      *(_DWORD *)buf = 138543362;
      v71 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v22 = NUAssertLogger_11920();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        uint64_t v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        uint64_t v43 = [v41 callStackSymbols];
        v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v71 = v40;
        __int16 v72 = 2114;
        v73 = v44;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v71 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUResampleNode initWithSubsampleFactor:sampleMode:source:subsampleNode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 555, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"subsampleFactor >= 0");
  }
  if (!a4)
  {
    v26 = NUAssertLogger_11920();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "sampleMode != NUSampleModeDefault");
      *(_DWORD *)buf = 138543362;
      v71 = v27;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v29 = NUAssertLogger_11920();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v50 = (void *)MEMORY[0x1E4F29060];
        id v51 = v49;
        v52 = [v50 callStackSymbols];
        v53 = [v52 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v71 = v49;
        __int16 v72 = 2114;
        v73 = v53;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      uint64_t v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v71 = v32;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUResampleNode initWithSubsampleFactor:sampleMode:source:subsampleNode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 556, @"Invalid parameter not satisfying: %s", v54, v55, v56, v57, (uint64_t)"sampleMode != NUSampleModeDefault");
  }
  uint64_t v12 = v11;
  if (!v11)
  {
    uint64_t v33 = NUAssertLogger_11920();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "subsampleNode != nil");
      *(_DWORD *)buf = 138543362;
      v71 = v34;
      _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    __int16 v36 = NUAssertLogger_11920();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v35)
    {
      if (v37)
      {
        v58 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v59 = (void *)MEMORY[0x1E4F29060];
        id v60 = v58;
        v61 = [v59 callStackSymbols];
        v62 = [v61 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v71 = v58;
        __int16 v72 = 2114;
        v73 = v62;
        _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v37)
    {
      uint64_t v38 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v39 = [v38 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v71 = v39;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUResampleNode initWithSubsampleFactor:sampleMode:source:subsampleNode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 557, @"Invalid parameter not satisfying: %s", v63, v64, v65, v66, (uint64_t)"subsampleNode != nil");
  }
  v68[0] = @"sampleMode";
  v13 = [NSNumber numberWithInteger:a4];
  v68[1] = @"subsampleFactor";
  v69[0] = v13;
  uint64_t v14 = [NSNumber numberWithInteger:a3];
  v69[1] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:2];

  v67.receiver = self;
  v67.super_class = (Class)NUResampleNode;
  id v16 = [(NUAbstractScaleNode *)&v67 initWithInput:v10 settings:v15];
  v16->_subsampleFactor = a3;
  v16->_int64_t sampleMode = a4;
  subsampleNode = v16->_subsampleNode;
  v16->_subsampleNode = v12;

  return v16;
}

- (NUResampleNode)initWithPreparedInput:(id)a3 subsampleNode:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = (NUSubsampleNode *)a4;
  if (!v7)
  {
    uint64_t v12 = NUAssertLogger_11920();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "subsampleNode != nil");
      *(_DWORD *)buf = 138543362;
      BOOL v30 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v15 = NUAssertLogger_11920();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        BOOL v22 = [v20 callStackSymbols];
        BOOL v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v30 = v19;
        __int16 v31 = 2114;
        uint64_t v32 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      uint64_t v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v30 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUResampleNode initWithPreparedInput:subsampleNode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 544, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"subsampleNode != nil");
  }
  id v8 = v7;
  v28.receiver = self;
  v28.super_class = (Class)NUResampleNode;
  id v9 = [(NUAbstractScaleNode *)&v28 initWithInput:v6 settings:MEMORY[0x1E4F1CC08]];
  subsampleNode = v9->_subsampleNode;
  v9->_subsampleNode = v8;

  return v9;
}

- (NUResampleNode)initWithInput:(id)a3 settings:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11937);
  }
  id v8 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v9 = NSString;
    id v10 = v8;
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    v13 = NSStringFromSelector(a2);
    uint64_t v14 = [v9 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v12, v13];
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v14;
    _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v15 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v15 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_11937);
      }
      goto LABEL_8;
    }
    if (v15 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11937);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    BOOL v16 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F29060];
    v18 = v16;
    v19 = [v17 callStackSymbols];
    v20 = [v19 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v20;
    _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  id v21 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  BOOL v23 = (void *)MEMORY[0x1E4F29060];
  id v24 = specific;
  v18 = v21;
  uint64_t v25 = [v23 callStackSymbols];
  uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v34 = specific;
  __int16 v35 = 2114;
  __int16 v36 = v26;
  _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUResampleNode initWithInput:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 539, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

@end