@interface NUImageCacheNode
- (BOOL)tryLoadPersistentURL:(id)a3 error:(id *)a4;
- (id)newRenderRequestWithOriginalRequest:(id)a3 error:(id *)a4;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)persistentURL;
@end

@implementation NUImageCacheNode

- (id)newRenderRequestWithOriginalRequest:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v22 = NUAssertLogger_14000();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "originalRequest != nil");
      *(_DWORD *)buf = 138543362;
      v40 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v25 = NUAssertLogger_14000();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        v32 = [v30 callStackSymbols];
        v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v40 = v29;
        __int16 v41 = 2114;
        v42 = v33;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v40 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageCacheNode newRenderRequestWithOriginalRequest:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 760, @"Invalid parameter not satisfying: %s", v34, v35, v36, v37, (uint64_t)"originalRequest != nil");
  }
  v7 = v6;
  v8 = [(NUCacheNode *)self temporaryURLPrefix];
  v9 = [v8 URLByAppendingPathExtension:@"jpg"];

  v10 = [(NUCacheNode *)self inputNode];
  v11 = [v10 imageProperties:a4];

  if (v11)
  {
    v12 = objc_alloc_init(NUImageExportFormatJPEG);
    +[NUGlobalSettings cacheNodeImageCompression];
    -[NUImageExportFormatJPEG setCompressionQuality:](v12, "setCompressionQuality:");
    v13 = [NUImageExportRequest alloc];
    v14 = [v7 composition];
    v15 = [(NUImageExportRequest *)v13 initWithComposition:v14 exportFormat:v12];

    [(NUExportRequest *)v15 setDestinationURL:v9];
    v16 = [v7 name];
    if ([v16 length])
    {
      v17 = [v7 name];
      [(NURenderRequest *)v15 setName:v17];
    }
    else
    {
      [(NURenderRequest *)v15 setName:@"NUImageCacheNode-new"];
    }

    v18 = [v11 colorSpace];
    [(NUImageExportRequest *)v15 setColorSpace:v18];

    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("NUImageCacheNode", v19);
    [(NURenderRequest *)v15 setResponseQueue:v20];

    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __62__NUImageCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke;
    v38[3] = &unk_1E5D95DF0;
    v38[4] = self;
    [(NURenderRequest *)v15 setCompletionBlock:v38];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __62__NUImageCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) resolveSourceWithResponse:a2];
}

- (id)persistentURL
{
  v2 = [(NUCacheNode *)self persistentURLPrefix];
  v3 = [v2 URLByAppendingPathExtension:@"jpg"];

  return v3;
}

- (BOOL)tryLoadPersistentURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [NUCGImageSourceNode alloc];
  v8 = [(id)*MEMORY[0x1E4F44410] identifier];
  v9 = [(NUCGImageSourceNode *)v7 initWithURL:v6 UTI:v8 identifier:@"cache"];

  BOOL v10 = [(NUCGImageSourceNode *)v9 load:a4];
  if (v10) {
    [(NUCacheNode *)self resolveWithSourceNode:v9 error:0];
  }

  return v10;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    v23 = NUAssertLogger_14000();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      __int16 v41 = v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v26 = NUAssertLogger_14000();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        v33 = [v31 callStackSymbols];
        uint64_t v34 = [v33 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v41 = v30;
        __int16 v42 = 2114;
        uint64_t v43 = v34;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v41 = v29;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageCacheNode nodeByReplayingAgainstCache:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 722, @"Invalid parameter not satisfying: %s", v35, v36, v37, v38, (uint64_t)"error != NULL");
  }
  BOOL v10 = v9;
  if ([v9 evaluationMode] == 1 || !objc_msgSend(v10, "evaluationMode"))
  {
    v39.receiver = self;
    v39.super_class = (Class)NUImageCacheNode;
    v12 = [(NUCacheNode *)&v39 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];
    if (v12)
    {
      uint64_t v13 = [v10 scale];
      uint64_t v15 = NUScaleDivide(v13, v14, 1, [v12 subsampleFactor]);
      uint64_t v17 = v16;
      v18 = [NUScaleNode alloc];
      uint64_t v19 = [v10 scale];
      v21 = -[NUScaleNode initWithTargetScale:effectiveScale:sampleMode:input:](v18, "initWithTargetScale:effectiveScale:sampleMode:input:", v19, v20, v15, v17, [v10 sampleMode], v12);
      v11 = +[NURenderNode nodeFromCache:v21 cache:v8];

      objc_msgSend(v11, "setEvaluatedForMode:", objc_msgSend(v10, "evaluationMode"));
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    +[NUError invalidError:@"Cannot evaluate cache node" object:self];
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

@end