@interface NUSubsampleNode
+ (int64_t)subsampleFactorForScale:(id)a3 additionalScale:(id *)a4;
- (NSDictionary)pipelineSettings;
- (NSDictionary)sourceOptions;
- (NUSourceContainerNode)sourceContainer;
- (NUSubsampleNode)initWithInput:(id)a3 settings:(id)a4;
- (NUSubsampleNode)initWithPreparedSource:(id)a3 container:(id)a4 pipelineSettings:(id)a5 sourceOptions:(id)a6;
- (NUSubsampleNode)initWithSubsampleFactor:(int64_t)a3 source:(id)a4 container:(id)a5 pipelineSettings:(id)a6 sourceOptions:(id)a7;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateImageGeometry:(id *)a3;
- (id)_evaluateImageProperties:(id *)a3;
- (id)_evaluateVideoComposition:(id *)a3;
- (id)_evaluateVideoProperties:(id *)a3;
- (id)debugQuickLookObject;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (int64_t)appliedSubsampleFactor;
- (int64_t)resolveSubsampleFactorForPipelineState:(id)a3 error:(id *)a4;
- (int64_t)resolveSubsampleFactorForPipelineState:(id)a3 sourceScale:(id)a4;
- (int64_t)subsampleFactor;
- (void)setAppliedSubsampleFactor:(int64_t)a3;
@end

@implementation NUSubsampleNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceOptions, 0);
  objc_storeStrong((id *)&self->_pipelineSettings, 0);

  objc_storeStrong((id *)&self->_sourceContainer, 0);
}

- (NSDictionary)sourceOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 200, 1);
}

- (NSDictionary)pipelineSettings
{
  return (NSDictionary *)objc_getProperty(self, a2, 192, 1);
}

- (NUSourceContainerNode)sourceContainer
{
  return (NUSourceContainerNode *)objc_getProperty(self, a2, 184, 1);
}

- (void)setAppliedSubsampleFactor:(int64_t)a3
{
  self->_appliedSubsampleFactor = a3;
}

- (int64_t)appliedSubsampleFactor
{
  return self->_appliedSubsampleFactor;
}

- (int64_t)subsampleFactor
{
  return self->_subsampleFactor;
}

- (id)_evaluateVideoComposition:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NUSubsampleNode *)self _sourceNode];
  if (!v5)
  {
    v10 = NUAssertLogger_11920();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = [NSString stringWithFormat:@"Unable to resolve source: %@", self];
      *(_DWORD *)buf = 138543362;
      v27 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v13 = NUAssertLogger_11920();
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
    _NUAssertFailHandler((uint64_t)"-[NUSubsampleNode _evaluateVideoComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 527, @"Unable to resolve source: %@", v22, v23, v24, v25, (uint64_t)self);
  }
  v6 = (void *)v5;
  v7 = [(NUSubsampleNode *)self sourceOptions];
  v8 = [v6 _evaluateVideoCompositionWithSourceOptions:v7 error:a3];

  return v8;
}

- (id)_evaluateVideoProperties:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NUSubsampleNode *)self _sourceNode];
  if (!v5)
  {
    v10 = NUAssertLogger_11920();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = [NSString stringWithFormat:@"Unable to resolve source: %@", self];
      *(_DWORD *)buf = 138543362;
      v27 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v13 = NUAssertLogger_11920();
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
    _NUAssertFailHandler((uint64_t)"-[NUSubsampleNode _evaluateVideoProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 518, @"Unable to resolve source: %@", v22, v23, v24, v25, (uint64_t)self);
  }
  v6 = (void *)v5;
  v7 = [(NUSubsampleNode *)self sourceOptions];
  v8 = [v6 _evaluateVideoPropertiesWithSourceOptions:v7 error:a3];

  return v8;
}

- (id)_evaluateImageProperties:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NUSubsampleNode *)self _sourceNode];
  if (!v5)
  {
    v10 = NUAssertLogger_11920();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = [NSString stringWithFormat:@"Unable to resolve source: %@", self];
      *(_DWORD *)buf = 138543362;
      v27 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v13 = NUAssertLogger_11920();
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
    _NUAssertFailHandler((uint64_t)"-[NUSubsampleNode _evaluateImageProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 509, @"Unable to resolve source: %@", v22, v23, v24, v25, (uint64_t)self);
  }
  v6 = (void *)v5;
  v7 = [(NUSubsampleNode *)self sourceOptions];
  v8 = [v6 _evaluateImagePropertiesWithSourceOptions:v7 error:a3];

  return v8;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NUSubsampleNode *)self _sourceNode];
  if (!v5)
  {
    v10 = NUAssertLogger_11920();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = [NSString stringWithFormat:@"Unable to resolve source: %@", self];
      *(_DWORD *)buf = 138543362;
      v27 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v13 = NUAssertLogger_11920();
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
    _NUAssertFailHandler((uint64_t)"-[NUSubsampleNode _evaluateImageGeometry:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 500, @"Unable to resolve source: %@", v22, v23, v24, v25, (uint64_t)self);
  }
  v6 = (void *)v5;
  v7 = [(NUSubsampleNode *)self sourceOptions];
  v8 = [v6 _evaluateImageGeometryWithSourceOptions:v7 error:a3];

  return v8;
}

- (id)_evaluateImage:(id *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NUSubsampleNode *)self _sourceNode];
  if (!v5)
  {
    v10 = NUAssertLogger_11920();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = [NSString stringWithFormat:@"Unable to resolve source: %@", self];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v13 = NUAssertLogger_11920();
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
        *(void *)&uint8_t buf[4] = v17;
        __int16 v27 = 2114;
        __int16 v28 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSubsampleNode _evaluateImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 481, @"Unable to resolve source: %@", v22, v23, v24, v25, (uint64_t)self);
  }
  v6 = (void *)v5;
  *(void *)buf = [(NUSubsampleNode *)self subsampleFactor];
  v7 = [(NUSubsampleNode *)self sourceOptions];
  v8 = [v6 _evaluateImageWithSourceOptions:v7 subsampleFactor:buf error:a3];

  if (v8) {
    [(NUSubsampleNode *)self setAppliedSubsampleFactor:*(void *)buf];
  }

  return v8;
}

- (id)debugQuickLookObject
{
  uint64_t v9 = 0;
  v3 = [(NURenderNode *)self outputImage:&v9];
  v4 = v3;
  if (!v3 || v9)
  {
    v8.receiver = self;
    v8.super_class = (Class)NUSubsampleNode;
    id v5 = [(NURenderNode *)&v8 debugQuickLookObject];
  }
  else
  {
    id v5 = v3;
  }
  v6 = v5;

  return v6;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v9 scale] < 1 || v10 <= 0)
  {
    uint64_t v24 = NUAssertLogger_11920();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = [NSString stringWithFormat:@"Invalid render scale"];
      *(_DWORD *)v40 = 138543362;
      *(void *)&v40[4] = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v40, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    __int16 v27 = NUAssertLogger_11920();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        v34 = [v32 callStackSymbols];
        v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)v40 = 138543618;
        *(void *)&v40[4] = v31;
        *(_WORD *)&v40[12] = 2114;
        *(void *)&v40[14] = v35;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v40, 0x16u);
      }
    }
    else if (v28)
    {
      uint64_t v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)v40 = 138543362;
      *(void *)&v40[4] = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v40, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSubsampleNode nodeByReplayingAgainstCache:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 381, @"Invalid render scale", v36, v37, v38, v39, *(uint64_t *)v40);
  }
  v11 = (void *)[v9 copy];

  if ([v11 applyPipelineSettings:self->_pipelineSettings error:a5])
  {
    *(_OWORD *)v40 = NUScaleUnknown;
    v12 = [(NUSourceContainerNode *)self->_sourceContainer resolveSourceNodeForPipelineState:v11 foundScale:v40 error:a5];
    v13 = v12;
    if (v12)
    {
      BOOL v14 = [v12 nodeByReplayingAgainstCache:v8 pipelineState:v11 error:a5];
      if (v14)
      {
        v15 = [(NUSubsampleNode *)self sourceOptions];
        v16 = [v14 _evaluateImageGeometryWithSourceOptions:v15 error:a5];

        if (v16)
        {
          uint64_t v17 = [v16 renderScale];
          int64_t v19 = -[NUSubsampleNode resolveSubsampleFactorForPipelineState:sourceScale:](self, "resolveSubsampleFactorForPipelineState:sourceScale:", v11, v17, v18);
          if ([v14 isPlaceholderNode]
            || ![(NUAbstractScaleNode *)self shouldCacheNodeForPipelineState:v11])
          {
            id v22 = v14;
          }
          else
          {
            v20 = [v13 pipelineOptionsForPipelineState:v11 error:a5];
            if (v20)
            {
              v21 = -[NUSubsampleNode initWithSubsampleFactor:source:container:pipelineSettings:sourceOptions:]([NUSubsampleNode alloc], "initWithSubsampleFactor:source:container:pipelineSettings:sourceOptions:", [v14 normalizeSubsampleFactor:v19], v14, self->_sourceContainer, v20, self->_sourceOptions);
              id v22 = +[NURenderNode nodeFromCache:v21 cache:v8];

              objc_msgSend(v22, "setEvaluatedForMode:", objc_msgSend(v11, "evaluationMode"));
            }
            else
            {
              id v22 = 0;
            }
          }
        }
        else
        {
          id v22 = 0;
        }
      }
      else
      {
        id v22 = 0;
      }
    }
    else
    {
      id v22 = 0;
    }
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (int64_t)resolveSubsampleFactorForPipelineState:(id)a3 sourceScale:(id)a4
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (var0 < 1 || var1 <= 0)
  {
    BOOL v14 = NUAssertLogger_11920();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUScaleIsValid(sourceScale)");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v17 = NUAssertLogger_11920();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        uint64_t v24 = [v22 callStackSymbols];
        uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v21;
        *(_WORD *)&unsigned char buf[12] = 2114;
        *(void *)&buf[14] = v25;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      int64_t v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSubsampleNode resolveSubsampleFactorForPipelineState:sourceScale:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 370, @"Invalid parameter not satisfying: %s", v26, v27, v28, v29, (uint64_t)"NUScaleIsValid(sourceScale)");
  }
  v7 = v6;
  uint64_t v8 = [v6 scale];
  uint64_t v10 = NUScaleDivide(v8, v9, var0, var1);
  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  int64_t v12 = +[NUSubsampleNode subsampleFactorForScale:additionalScale:](NUSubsampleNode, "subsampleFactorForScale:additionalScale:", v10, v11, buf);

  return v12;
}

- (int64_t)resolveSubsampleFactorForPipelineState:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(NUAbstractScaleNode *)self inputNode];
  uint64_t v8 = [v7 outputImageGeometry:a4];

  if (v8)
  {
    uint64_t v9 = [v8 renderScale];
    int64_t v11 = -[NUSubsampleNode resolveSubsampleFactorForPipelineState:sourceScale:](self, "resolveSubsampleFactorForPipelineState:sourceScale:", v6, v9, v10);
  }
  else
  {
    int64_t v11 = 0;
  }

  return v11;
}

- (NUSubsampleNode)initWithSubsampleFactor:(int64_t)a3 source:(id)a4 container:(id)a5 pipelineSettings:(id)a6 sourceOptions:(id)a7
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  v13 = (NUSourceContainerNode *)a5;
  BOOL v14 = (NSDictionary *)a6;
  v15 = (NSDictionary *)a7;
  if (a3 < 0)
  {
    uint64_t v26 = NUAssertLogger_11920();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "subsampleFactor >= 0");
      *(_DWORD *)buf = 138543362;
      v110 = v27;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v29 = NUAssertLogger_11920();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v30)
      {
        v61 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v62 = (void *)MEMORY[0x1E4F29060];
        id v63 = v61;
        v64 = [v62 callStackSymbols];
        v65 = [v64 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v110 = v61;
        __int16 v111 = 2114;
        v112 = v65;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      uint64_t v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v110 = v32;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSubsampleNode initWithSubsampleFactor:source:container:pipelineSettings:sourceOptions:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 334, @"Invalid parameter not satisfying: %s", v66, v67, v68, v69, (uint64_t)"subsampleFactor >= 0");
  }
  if (!v13)
  {
    id v33 = NUAssertLogger_11920();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "sourceContainer != nil");
      *(_DWORD *)buf = 138543362;
      v110 = v34;
      _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v36 = NUAssertLogger_11920();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v35)
    {
      if (v37)
      {
        v70 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v71 = (void *)MEMORY[0x1E4F29060];
        id v72 = v70;
        v73 = [v71 callStackSymbols];
        v74 = [v73 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v110 = v70;
        __int16 v111 = 2114;
        v112 = v74;
        _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v37)
    {
      uint64_t v38 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v39 = [v38 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v110 = v39;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSubsampleNode initWithSubsampleFactor:source:container:pipelineSettings:sourceOptions:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 335, @"Invalid parameter not satisfying: %s", v75, v76, v77, v78, (uint64_t)"sourceContainer != nil");
  }
  if (!v12)
  {
    v40 = NUAssertLogger_11920();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      uint64_t v41 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "source != nil");
      *(_DWORD *)buf = 138543362;
      v110 = v41;
      _os_log_error_impl(&dword_1A9892000, v40, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v43 = NUAssertLogger_11920();
    BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
    if (v42)
    {
      if (v44)
      {
        v79 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v80 = (void *)MEMORY[0x1E4F29060];
        id v81 = v79;
        v82 = [v80 callStackSymbols];
        v83 = [v82 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v110 = v79;
        __int16 v111 = 2114;
        v112 = v83;
        _os_log_error_impl(&dword_1A9892000, v43, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v44)
    {
      v45 = [MEMORY[0x1E4F29060] callStackSymbols];
      v46 = [v45 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v110 = v46;
      _os_log_error_impl(&dword_1A9892000, v43, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSubsampleNode initWithSubsampleFactor:source:container:pipelineSettings:sourceOptions:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 336, @"Invalid parameter not satisfying: %s", v84, v85, v86, v87, (uint64_t)"source != nil");
  }
  if (!v14)
  {
    v47 = NUAssertLogger_11920();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      v48 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pipelineSettings != nil");
      *(_DWORD *)buf = 138543362;
      v110 = v48;
      _os_log_error_impl(&dword_1A9892000, v47, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v50 = NUAssertLogger_11920();
    BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);
    if (v49)
    {
      if (v51)
      {
        v88 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v89 = (void *)MEMORY[0x1E4F29060];
        id v90 = v88;
        v91 = [v89 callStackSymbols];
        v92 = [v91 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v110 = v88;
        __int16 v111 = 2114;
        v112 = v92;
        _os_log_error_impl(&dword_1A9892000, v50, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v51)
    {
      v52 = [MEMORY[0x1E4F29060] callStackSymbols];
      v53 = [v52 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v110 = v53;
      _os_log_error_impl(&dword_1A9892000, v50, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSubsampleNode initWithSubsampleFactor:source:container:pipelineSettings:sourceOptions:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 337, @"Invalid parameter not satisfying: %s", v93, v94, v95, v96, (uint64_t)"pipelineSettings != nil");
  }
  v16 = v15;
  if (!v15)
  {
    v54 = NUAssertLogger_11920();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      v55 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "sourceOptions != nil");
      *(_DWORD *)buf = 138543362;
      v110 = v55;
      _os_log_error_impl(&dword_1A9892000, v54, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v56 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v57 = NUAssertLogger_11920();
    BOOL v58 = os_log_type_enabled(v57, OS_LOG_TYPE_ERROR);
    if (v56)
    {
      if (v58)
      {
        v97 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v98 = (void *)MEMORY[0x1E4F29060];
        id v99 = v97;
        v100 = [v98 callStackSymbols];
        v101 = [v100 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v110 = v97;
        __int16 v111 = 2114;
        v112 = v101;
        _os_log_error_impl(&dword_1A9892000, v57, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v58)
    {
      v59 = [MEMORY[0x1E4F29060] callStackSymbols];
      v60 = [v59 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v110 = v60;
      _os_log_error_impl(&dword_1A9892000, v57, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSubsampleNode initWithSubsampleFactor:source:container:pipelineSettings:sourceOptions:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 338, @"Invalid parameter not satisfying: %s", v102, v103, v104, v105, (uint64_t)"sourceOptions != nil");
  }
  v107[0] = @"subsampleFactor";
  uint64_t v17 = [NSNumber numberWithInteger:a3];
  v108[0] = v17;
  v108[1] = v14;
  v107[1] = @"pipelineSettings";
  v107[2] = @"sourceOptions";
  v108[2] = v16;
  BOOL v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:v107 count:3];

  v106.receiver = self;
  v106.super_class = (Class)NUSubsampleNode;
  int64_t v19 = [(NUAbstractScaleNode *)&v106 initWithInput:v12 settings:v18];
  sourceContainer = v19->_sourceContainer;
  v19->_sourceContainer = v13;
  v21 = v13;

  v19->_subsampleFactor = a3;
  pipelineSettings = v19->_pipelineSettings;
  v19->_pipelineSettings = v14;
  id v23 = v14;

  sourceOptions = v19->_sourceOptions;
  v19->_sourceOptions = v16;

  return v19;
}

- (NUSubsampleNode)initWithPreparedSource:(id)a3 container:(id)a4 pipelineSettings:(id)a5 sourceOptions:(id)a6
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  int64_t v11 = (NUSourceContainerNode *)a4;
  id v12 = (NSDictionary *)a5;
  v13 = (NSDictionary *)a6;
  if (!v11)
  {
    id v23 = NUAssertLogger_11920();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "sourceContainer != nil");
      *(_DWORD *)buf = 138543362;
      v91 = v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v26 = NUAssertLogger_11920();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        BOOL v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v52 = (void *)MEMORY[0x1E4F29060];
        id v53 = v51;
        v54 = [v52 callStackSymbols];
        v55 = [v54 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v91 = v51;
        __int16 v92 = 2114;
        uint64_t v93 = v55;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      uint64_t v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v91 = v29;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSubsampleNode initWithPreparedSource:container:pipelineSettings:sourceOptions:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 314, @"Invalid parameter not satisfying: %s", v56, v57, v58, v59, (uint64_t)"sourceContainer != nil");
  }
  if (!v10)
  {
    BOOL v30 = NUAssertLogger_11920();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "source != nil");
      *(_DWORD *)buf = 138543362;
      v91 = v31;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v33 = NUAssertLogger_11920();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (v32)
    {
      if (v34)
      {
        v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v61 = (void *)MEMORY[0x1E4F29060];
        id v62 = v60;
        id v63 = [v61 callStackSymbols];
        v64 = [v63 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v91 = v60;
        __int16 v92 = 2114;
        uint64_t v93 = v64;
        _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v34)
    {
      v35 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v36 = [v35 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v91 = v36;
      _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSubsampleNode initWithPreparedSource:container:pipelineSettings:sourceOptions:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 315, @"Invalid parameter not satisfying: %s", v65, v66, v67, v68, (uint64_t)"source != nil");
  }
  if (!v12)
  {
    BOOL v37 = NUAssertLogger_11920();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      uint64_t v38 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pipelineSettings != nil");
      *(_DWORD *)buf = 138543362;
      v91 = v38;
      _os_log_error_impl(&dword_1A9892000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v40 = NUAssertLogger_11920();
    BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
    if (v39)
    {
      if (v41)
      {
        uint64_t v69 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v70 = (void *)MEMORY[0x1E4F29060];
        id v71 = v69;
        id v72 = [v70 callStackSymbols];
        v73 = [v72 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v91 = v69;
        __int16 v92 = 2114;
        uint64_t v93 = v73;
        _os_log_error_impl(&dword_1A9892000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v41)
    {
      v42 = [MEMORY[0x1E4F29060] callStackSymbols];
      v43 = [v42 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v91 = v43;
      _os_log_error_impl(&dword_1A9892000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSubsampleNode initWithPreparedSource:container:pipelineSettings:sourceOptions:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 316, @"Invalid parameter not satisfying: %s", v74, v75, v76, v77, (uint64_t)"pipelineSettings != nil");
  }
  BOOL v14 = v13;
  if (!v13)
  {
    BOOL v44 = NUAssertLogger_11920();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "sourceOptions != nil");
      *(_DWORD *)buf = 138543362;
      v91 = v45;
      _os_log_error_impl(&dword_1A9892000, v44, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v46 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v47 = NUAssertLogger_11920();
    BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
    if (v46)
    {
      if (v48)
      {
        uint64_t v78 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v79 = (void *)MEMORY[0x1E4F29060];
        id v80 = v78;
        id v81 = [v79 callStackSymbols];
        v82 = [v81 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v91 = v78;
        __int16 v92 = 2114;
        uint64_t v93 = v82;
        _os_log_error_impl(&dword_1A9892000, v47, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v48)
    {
      v49 = [MEMORY[0x1E4F29060] callStackSymbols];
      v50 = [v49 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v91 = v50;
      _os_log_error_impl(&dword_1A9892000, v47, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSubsampleNode initWithPreparedSource:container:pipelineSettings:sourceOptions:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 317, @"Invalid parameter not satisfying: %s", v83, v84, v85, v86, (uint64_t)"sourceOptions != nil");
  }
  v88[0] = @"pipelineSettings";
  v88[1] = @"sourceOptions";
  v89[0] = v12;
  v89[1] = v13;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:2];
  v87.receiver = self;
  v87.super_class = (Class)NUSubsampleNode;
  v16 = [(NUAbstractScaleNode *)&v87 initWithInput:v10 settings:v15];
  sourceContainer = v16->_sourceContainer;
  v16->_sourceContainer = v11;
  BOOL v18 = v11;

  pipelineSettings = v16->_pipelineSettings;
  v16->_pipelineSettings = v12;
  v20 = v12;

  sourceOptions = v16->_sourceOptions;
  v16->_sourceOptions = v14;

  return v16;
}

- (NUSubsampleNode)initWithInput:(id)a3 settings:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11937);
  }
  uint64_t v8 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = NSString;
    id v10 = v8;
    int64_t v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    v13 = NSStringFromSelector(a2);
    BOOL v14 = [v9 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v12, v13];
    *(_DWORD *)buf = 138543362;
    BOOL v34 = v14;
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
    v16 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F29060];
    BOOL v18 = v16;
    int64_t v19 = [v17 callStackSymbols];
    v20 = [v19 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    BOOL v34 = v20;
    _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v21 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  id v23 = (void *)MEMORY[0x1E4F29060];
  id v24 = specific;
  BOOL v18 = v21;
  uint64_t v25 = [v23 callStackSymbols];
  uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  BOOL v34 = specific;
  __int16 v35 = 2114;
  uint64_t v36 = v26;
  _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  BOOL v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUSubsampleNode initWithInput:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 308, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

+ (int64_t)subsampleFactorForScale:(id)a3 additionalScale:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a3.var0 < 1 || (int64_t var1 = a3.var1, a3.var1 <= 0))
  {
    id v12 = NUAssertLogger_11920();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUScaleIsValid(scale)");
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v15 = NUAssertLogger_11920();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        int64_t v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        id v22 = [v20 callStackSymbols];
        id v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = v19;
        __int16 v30 = 2114;
        uint64_t v31 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      uint64_t v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSubsampleNode subsampleFactorForScale:additionalScale:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 441, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"NUScaleIsValid(scale)");
  }
  int64_t var0 = a3.var0;
  long double v7 = NUScaleToDouble(a3.var0, a3.var1);
  uint64_t v8 = 1;
  if (v7 <= 0.5)
  {
    int v9 = 1 << (uint64_t)-ceil(log2(v7));
    if (v9 <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v9;
    }
  }
  a4->int64_t var0 = NUScaleMultiply(var0, var1, v8, 1);
  a4->int64_t var1 = v10;
  return v8;
}

@end