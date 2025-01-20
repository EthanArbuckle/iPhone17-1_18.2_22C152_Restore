@interface PILongExposureCacheNode
- (BOOL)tryLoadPersistentURL:(id)a3 error:(id *)a4;
- (PILongExposureCacheNode)initWithAutoLoopCacheNode:(id)a3 urlKey:(id)a4;
- (id)_evaluateImageGeometry:(id *)a3;
- (id)evaluateRenderDependenciesWithRequest:(id)a3 error:(id *)a4;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)persistentURL;
- (id)resolvedSourceNode:(id *)a3;
@end

@implementation PILongExposureCacheNode

- (id)_evaluateImageGeometry:(id *)a3
{
  v4 = [(PILongExposureCacheNode *)self autoLoopCacheNode];
  v5 = [v4 outputImageGeometry:a3];

  return v5;
}

- (id)resolvedSourceNode:(id *)a3
{
  if ([(NUCacheNode *)self isResolved]
    || ([(PILongExposureCacheNode *)self persistentURL],
        v5 = objc_claimAutoreleasedReturnValue(),
        BOOL v6 = [(PILongExposureCacheNode *)self tryLoadPersistentURL:v5 error:a3],
        v5,
        v6))
  {
    v9.receiver = self;
    v9.super_class = (Class)PILongExposureCacheNode;
    v7 = [(NUCacheNode *)&v9 resolvedSourceNode:a3];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)evaluateRenderDependenciesWithRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(PILongExposureCacheNode *)self autoLoopCacheNode];
  v8 = [v7 evaluateRenderDependenciesWithRequest:v6 error:a4];

  return v8;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    v16 = NUAssertLogger_7830();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v31 = v17;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v18 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v20 = NUAssertLogger_7830();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific(*v18);
        v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        v27 = [v25 callStackSymbols];
        v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v31 = v24;
        __int16 v32 = 2114;
        v33 = v28;
        _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v31 = v23;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v10 = v9;
  if ([v9 evaluationMode] == 1 || !objc_msgSend(v10, "evaluationMode"))
  {
    v12 = (void *)[v10 copy];
    [v12 setMediaComponentType:2];
    objc_msgSend(v12, "setScale:", *MEMORY[0x1E4F7A338], *(void *)(MEMORY[0x1E4F7A338] + 8));
    v29.receiver = self;
    v29.super_class = (Class)PILongExposureCacheNode;
    v13 = [(NUCacheNode *)&v29 nodeByReplayingAgainstCache:v8 pipelineState:v12 error:a5];
    v11 = v13;
    if (v13) {
      id v14 = v13;
    }
  }
  else
  {
    [MEMORY[0x1E4F7A438] invalidError:@"Cannot evaluate cache node" object:self];
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (BOOL)tryLoadPersistentURL:(id)a3 error:(id *)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F7A3C0];
  id v7 = a3;
  id v8 = [v6 alloc];
  id v9 = [(id)*MEMORY[0x1E4F44410] identifier];
  v10 = (void *)[v8 initWithURL:v7 UTI:v9 identifier:@"cache"];

  int v11 = [v10 load:a4];
  if (v11) {
    [(NUCacheNode *)self resolveWithSourceNode:v10 error:0];
  }

  return v11;
}

- (id)persistentURL
{
  v3 = [(PILongExposureCacheNode *)self autoLoopCacheNode];
  v4 = [(NURenderNode *)self settings];
  v5 = [v4 objectForKeyedSubscript:@"key"];
  id v6 = [v3 valueForKey:v5];

  return v6;
}

- (PILongExposureCacheNode)initWithAutoLoopCacheNode:(id)a3 urlKey:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v13 = NUAssertLogger_7830();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "cacheNode != nil");
      id v14 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v14;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v15 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v17 = NUAssertLogger_7830();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        id v26 = dispatch_get_specific(*v15);
        v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        v15 = [v27 callStackSymbols];
        objc_super v29 = [v15 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v41 = (const void **)v26;
        __int16 v42 = 2114;
        v43 = v29;
        _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      v15 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v41 = v15;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v23 = _NUAssertFailHandler();
    goto LABEL_17;
  }
  id v8 = v7;
  if (!v7)
  {
    v20 = NUAssertLogger_7830();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "key != nil");
      BOOL v21 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v21;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v15 = (const void **)MEMORY[0x1E4F7A308];
    v22 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v17 = NUAssertLogger_7830();
    int v23 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (!v22)
    {
      if (v23)
      {
        v24 = [MEMORY[0x1E4F29060] callStackSymbols];
        v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v41 = v25;
        _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_19;
    }
LABEL_17:
    if (v23)
    {
      v30 = dispatch_get_specific(*v15);
      v31 = (void *)MEMORY[0x1E4F29060];
      id v32 = v30;
      v33 = [v31 callStackSymbols];
      uint64_t v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v41 = (const void **)v30;
      __int16 v42 = 2114;
      v43 = v34;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_19:

    _NUAssertFailHandler();
  }
  uint64_t v38 = *MEMORY[0x1E4F7A300];
  id v39 = v6;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  v36 = @"key";
  v37 = v8;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  v35.receiver = self;
  v35.super_class = (Class)PILongExposureCacheNode;
  int v11 = [(NUCacheNode *)&v35 initWithInputs:v9 settings:v10 subsampleFactor:1];

  return v11;
}

@end