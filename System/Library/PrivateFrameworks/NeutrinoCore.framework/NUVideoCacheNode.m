@interface NUVideoCacheNode
- (BOOL)tryLoadPersistentURL:(id)a3 error:(id *)a4;
- (id)_evaluateImageGeometry:(id *)a3;
- (id)newRenderRequestWithOriginalRequest:(id)a3 error:(id *)a4;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)outputSettings:(id *)a3;
- (id)persistentURL;
@end

@implementation NUVideoCacheNode

- (id)newRenderRequestWithOriginalRequest:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v20 = NUAssertLogger_14000();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "originalRequest != nil");
      *(_DWORD *)buf = 138543362;
      v38 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v23 = NUAssertLogger_14000();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        v30 = [v28 callStackSymbols];
        v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v38 = v27;
        __int16 v39 = 2114;
        v40 = v31;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v38 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoCacheNode newRenderRequestWithOriginalRequest:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 1244, @"Invalid parameter not satisfying: %s", v32, v33, v34, v35, (uint64_t)"originalRequest != nil");
  }
  v7 = v6;
  v8 = [(NUCacheNode *)self temporaryURLPrefix];
  v9 = [v8 URLByAppendingPathExtension:@"mov"];

  v10 = [NUVideoExportRequest alloc];
  v11 = [v7 composition];
  v12 = [(NUExportRequest *)v10 initWithComposition:v11 destinationURL:v9];

  v13 = [(NUVideoCacheNode *)self outputSettings:a4];
  if (v13)
  {
    [(NUVideoExportRequest *)v12 setOutputSettings:v13];
    [(NUVideoExportRequest *)v12 setApplyOrientationAsMetadata:0];
    v14 = [v7 name];
    if ([v14 length])
    {
      v15 = [v7 name];
      [(NURenderRequest *)v12 setName:v15];
    }
    else
    {
      [(NURenderRequest *)v12 setName:@"NUVideoCacheNode-new"];
    }

    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("NUVideoCacheNode", v17);
    [(NURenderRequest *)v12 setResponseQueue:v18];

    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __62__NUVideoCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke;
    v36[3] = &unk_1E5D95DF0;
    v36[4] = self;
    [(NURenderRequest *)v12 setCompletionBlock:v36];
    v16 = v12;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __62__NUVideoCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) resolveSourceWithResponse:a2];
}

- (id)persistentURL
{
  v2 = [(NUCacheNode *)self persistentURLPrefix];
  v3 = [v2 URLByAppendingPathExtension:@"mov"];

  return v3;
}

- (id)outputSettings:(id *)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);

  return v3;
}

- (BOOL)tryLoadPersistentURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [[NUVideoSourceNode alloc] initWithURL:v6 identifier:@"cache" options:0];

  BOOL v8 = [(NUVideoSourceNode *)v7 load:a4];
  if (v8) {
    [(NUCacheNode *)self resolveWithSourceNode:v7 error:0];
  }

  return v8;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    v38 = NUAssertLogger_14000();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      __int16 v39 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v59 = v39;
      _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v41 = NUAssertLogger_14000();
    BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v42)
      {
        v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v46 = (void *)MEMORY[0x1E4F29060];
        id v47 = v45;
        v48 = [v46 callStackSymbols];
        v49 = [v48 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v59 = v45;
        __int16 v60 = 2114;
        v61 = v49;
        _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v42)
    {
      v43 = [MEMORY[0x1E4F29060] callStackSymbols];
      v44 = [v43 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v59 = v44;
      _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoCacheNode nodeByReplayingAgainstCache:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 1164, @"Invalid parameter not satisfying: %s", v50, v51, v52, v53, (uint64_t)"error != NULL");
  }
  v10 = v9;
  if ([v9 evaluationMode] == 1)
  {
    v11 = [(NUCacheNode *)self inputNode];
    v12 = [v11 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];
  }
  else
  {
    if ([v10 evaluationMode] != 3)
    {
      v56.receiver = self;
      v56.super_class = (Class)NUVideoCacheNode;
      v12 = [(NUCacheNode *)&v56 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];
      goto LABEL_20;
    }
    v11 = (void *)[v10 copy];
    [v11 setEvaluationMode:2];
    v57.receiver = self;
    v57.super_class = (Class)NUVideoCacheNode;
    v13 = [(NUCacheNode *)&v57 nodeByReplayingAgainstCache:v8 pipelineState:v11 error:a5];
    v14 = v13;
    if (v13)
    {
      v15 = [v13 resolvedSourceNode:a5];
      v16 = v15;
      if (v15)
      {
        v17 = [v15 resolvedNodeWithCachedInputs:MEMORY[0x1E4F1CC08] settings:MEMORY[0x1E4F1CC08] pipelineState:v10 error:a5];
        if (v17)
        {
          dispatch_queue_t v18 = [(NUCacheNode *)self inputNode];
          v19 = [v18 outputImageGeometry:a5];

          if (v19)
          {
            uint64_t v20 = [v10 scale];
            uint64_t v22 = v21;
            uint64_t v23 = [v19 renderScale];
            uint64_t v25 = NUScaleDivide(v20, v22, v23, v24);
            uint64_t v27 = NUScaleDivide(v25, v26, 1, [v14 subsampleFactor]);
            uint64_t v54 = v28;
            uint64_t v55 = v27;
            id v29 = [NUScaleNode alloc];
            v30 = v19;
            uint64_t v31 = [v10 scale];
            uint64_t v33 = v32;
            uint64_t v34 = [v10 sampleMode];
            uint64_t v35 = v31;
            v19 = v30;
            v36 = -[NUScaleNode initWithTargetScale:effectiveScale:sampleMode:input:](v29, "initWithTargetScale:effectiveScale:sampleMode:input:", v35, v33, v55, v54, v34, v17);
            -[NURenderNode setEvaluatedForMode:](v36, "setEvaluatedForMode:", [v10 evaluationMode]);
            v12 = +[NURenderNode nodeFromCache:v36 cache:v8];
          }
          else
          {
            +[NUError errorWithCode:1 reason:@"failed to get self.inputNode geometry" object:v16 underlyingError:*a5];
            v12 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          +[NUError errorWithCode:1 reason:@"Failed to resolve video frame node" object:v16 underlyingError:*a5];
          v12 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
    }
  }
LABEL_20:

  return v12;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)NUVideoCacheNode;
  uint64_t v3 = [(NUCacheNode *)&v14 _evaluateImageGeometry:a3];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [NUImageGeometry alloc];
    [v4 extent];
    uint64_t v6 = [v4 renderScale];
    uint64_t v8 = v7;
    uint64_t v9 = [v4 orientation];
    v10 = [v4 spaceMap];
    v11 = -[NUImageGeometry initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:](v5, "initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:", &v13, v6, v8, v9, v10, 4);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end