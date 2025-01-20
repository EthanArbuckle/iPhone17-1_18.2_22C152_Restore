@interface NUStyleTransferThumbnailNode
- ($0AC6E346AE4835514AAA8AC86D8F4844)thumbnailSize;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NUStyleTransferThumbnailNode)initWithInput:(id)a3 settings:(id)a4;
- (NUStyleTransferThumbnailNode)initWithSettings:(id)a3 inputs:(id)a4;
- (id)_evaluateImage:(id *)a3;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
@end

@implementation NUStyleTransferThumbnailNode

- (id)_evaluateImage:(id *)a3
{
  v5 = [(NUStyleTransferNode *)self inputNode];
  v6 = [v5 outputImage:a3];

  if (v6)
  {
    uint64_t v7 = [(NUStyleTransferThumbnailNode *)self thumbnailSize];
    uint64_t v9 = v8;
    [v6 extent];
    if (v7 == (uint64_t)v11 && v9 == (uint64_t)v10)
    {
      id v21 = v6;
    }
    else
    {
      v13 = [(NUStyleTransferNode *)self tuningParameters];
      v14 = [(NUStyleTransferNode *)self configuration];
      v15 = (void *)[v14 mutableCopy];

      v16 = [(NURenderNode *)self settings];
      uint64_t v17 = [v16 objectForKeyedSubscript:@"useFloat16"];
      v18 = (void *)v17;
      if (v17) {
        v19 = (void *)v17;
      }
      else {
        v19 = &unk_1F004A268;
      }
      [v15 setObject:v19 forKeyedSubscript:@"useFloat16"];

      v20 = [(NUStyleTransferNode *)self targetColorSpace];
      +[_NUStyleTransferThumbnailProcessor generateThumbnailForImage:targetSize:colorSpace:configuration:tuningParameters:error:](_NUStyleTransferThumbnailProcessor, "generateThumbnailForImage:targetSize:colorSpace:configuration:tuningParameters:error:", v6, v7, v9, v20, v15, v13, a3);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      if ([(NUStyleTransferNode *)self shouldCache])
      {
        v22 = [[NUProcessorCache alloc] initWithImage:v21];
        [(NUProcessorCache *)v22 setLabel:@"NUStyleTransferThumbnailNode.Provider"];
        uint64_t v23 = [(NUProcessorCache *)v22 outputImage];

        id v21 = (id)v23;
      }
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v13 = [v10 objectForKeyedSubscript:NUStyleTransferNodeConfigurationKey];
  v14 = (void *)[v13 mutableCopy];
  [v14 removeObjectForKey:@"priorMatrix"];
  [v12 setObject:v14 forKeyedSubscript:NUStyleTransferNodeConfigurationKey];
  v15 = [v10 objectForKeyedSubscript:@"thumbnailWidth"];
  if (v15)
  {
    [v12 setObject:v15 forKeyedSubscript:@"thumbnailWidth"];
  }
  else
  {
    v16 = [v13 objectForKeyedSubscript:@"thumbnailWidth"];
    [v12 setObject:v16 forKeyedSubscript:@"thumbnailWidth"];
  }
  uint64_t v17 = [v10 objectForKeyedSubscript:@"thumbnailHeight"];
  if (v17)
  {
    [v12 setObject:v17 forKeyedSubscript:@"thumbnailHeight"];
  }
  else
  {
    [v13 objectForKeyedSubscript:@"thumbnailHeight"];
    id v18 = v9;
    v20 = v19 = a6;
    [v12 setObject:v20 forKeyedSubscript:@"thumbnailHeight"];

    a6 = v19;
    id v9 = v18;
  }

  id v21 = [v10 objectForKeyedSubscript:NUStyleTransferNodeTuningParametersKey];
  [v12 setObject:v21 forKeyedSubscript:NUStyleTransferNodeTuningParametersKey];

  v22 = [v10 objectForKeyedSubscript:NUStyleTransferNodeTargetColorSpaceKey];
  [v12 setObject:v22 forKeyedSubscript:NUStyleTransferNodeTargetColorSpaceKey];

  uint64_t v23 = [v10 objectForKeyedSubscript:@"useFloat16"];
  [v12 setObject:v23 forKeyedSubscript:@"useFloat16"];

  if (([v11 disableIntermediateCaching] & 1) == 0 && objc_msgSend(v11, "evaluationMode") == 1) {
    [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:NUStyleTransferNodeShouldCacheKey];
  }
  v27.receiver = self;
  v27.super_class = (Class)NUStyleTransferThumbnailNode;
  v24 = [(NUStyleTransferNode *)&v27 resolvedNodeWithCachedInputs:v9 settings:v12 pipelineState:v11 error:a6];

  return v24;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return 1;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v9 auxiliaryImageType] == 1)
  {
    id v10 = (void *)[v9 copy];
    uint64_t v11 = [v9 scale];
    if (NUScaleCompare(v11, v12, 1, 4) >= 1 && [v10 mediaComponentType] == 1) {
      objc_msgSend(v10, "setScale:", 1, 4);
    }
    v13 = [(NUStyleTransferNode *)self inputNode];
    v14 = [v13 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];

    if (v14)
    {
      v19 = @"input";
      v20[0] = v14;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      v16 = [(NURenderNode *)self resolvedNodeWithCachedInputs:v15 cache:v8 pipelineState:v9 error:a5];
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    uint64_t v17 = [(NUStyleTransferNode *)self inputNode];
    v16 = [v17 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];
  }

  return v16;
}

- (NUStyleTransferThumbnailNode)initWithSettings:(id)a3 inputs:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_27665);
  }
  id v8 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v9 = NSString;
    id v10 = v8;
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    v13 = NSStringFromSelector(a2);
    v14 = [v9 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v12, v13];
    *(_DWORD *)buf = 138543362;
    v34 = v14;
    _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v15 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v15 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_27665);
      }
      goto LABEL_8;
    }
    if (v15 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_27665);
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
    id v18 = v16;
    v19 = [v17 callStackSymbols];
    v20 = [v19 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v34 = v20;
    _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  id v21 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v23 = (void *)MEMORY[0x1E4F29060];
  id v24 = specific;
  id v18 = v21;
  v25 = [v23 callStackSymbols];
  v26 = [v25 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v34 = specific;
  __int16 v35 = 2114;
  v36 = v26;
  _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  objc_super v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUStyleTransferThumbnailNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 983, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)thumbnailSize
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = [(NURenderNode *)self settings];
  v4 = [v3 objectForKeyedSubscript:NUStyleTransferNodeConfigurationKey];

  v5 = [(NURenderNode *)self settings];
  id v6 = [v5 objectForKeyedSubscript:@"thumbnailWidth"];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 integerValue];
  }
  else
  {
    id v9 = [v4 objectForKeyedSubscript:@"thumbnailWidth"];
    uint64_t v8 = [v9 integerValue];
  }
  id v10 = [(NURenderNode *)self settings];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"thumbnailHeight"];
  uint64_t v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 integerValue];
  }
  else
  {
    v14 = [v4 objectForKeyedSubscript:@"thumbnailHeight"];
    uint64_t v13 = [v14 integerValue];
  }
  if ((v13 | v8) < 0)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    id v18 = objc_msgSend(NSString, "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
    __int16 v35 = @"(width >= 0) && (height >= 0)";
    [v17 handleFailureInFunction:v18 file:@"NUGeometryPrimitives.h" lineNumber:38 description:@"Invalid parameter not satisfying: %@"];

    if (!v8)
    {
LABEL_12:
      v19 = NUAssertLogger_27648();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = [NSString stringWithFormat:@"Invalid thumbnail size"];
        *(_DWORD *)buf = 138543362;
        uint64_t v37 = v20;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v22 = NUAssertLogger_27648();
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v23)
        {
          v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          objc_super v27 = (void *)MEMORY[0x1E4F29060];
          id v28 = v26;
          uint64_t v29 = [v27 callStackSymbols];
          uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          uint64_t v37 = v26;
          __int16 v38 = 2114;
          v39 = v30;
          _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v23)
      {
        id v24 = [MEMORY[0x1E4F29060] callStackSymbols];
        v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        uint64_t v37 = v25;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NUStyleTransferThumbnailNode thumbnailSize]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 978, @"Invalid thumbnail size", v31, v32, v33, v34, (uint64_t)v35);
    }
  }
  else if (!v8)
  {
    goto LABEL_12;
  }
  if (!v13) {
    goto LABEL_12;
  }

  int64_t v15 = v8;
  int64_t v16 = v13;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (NUStyleTransferThumbnailNode)initWithInput:(id)a3 settings:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v12 = NUAssertLogger_27648();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int64_t v15 = NUAssertLogger_27648();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        v22 = [v20 callStackSymbols];
        BOOL v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = v19;
        __int16 v33 = 2114;
        uint64_t v34 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      uint64_t v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferThumbnailNode initWithInput:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 964, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"input != nil");
  }
  uint64_t v8 = v7;
  uint64_t v29 = @"input";
  id v30 = v6;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  v28.receiver = self;
  v28.super_class = (Class)NUStyleTransferThumbnailNode;
  id v10 = [(NURenderNode *)&v28 initWithSettings:v8 inputs:v9];

  return v10;
}

@end