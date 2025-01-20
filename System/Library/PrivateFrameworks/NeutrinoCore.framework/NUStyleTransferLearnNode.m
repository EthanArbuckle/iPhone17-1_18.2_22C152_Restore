@interface NUStyleTransferLearnNode
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (id)_evaluateImage:(id *)a3;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
@end

@implementation NUStyleTransferLearnNode

- (id)_evaluateImage:(id *)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NUStyleTransferNode *)self thumbnailNode];
  if (!v5)
  {
    v22 = NUAssertLogger_27648();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = [NSString stringWithFormat:@"Missing input thumbnail node"];
      *(_DWORD *)buf = 138543362;
      v60 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v25 = NUAssertLogger_27648();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v37 = (void *)MEMORY[0x1E4F29060];
        id v38 = v36;
        v39 = [v37 callStackSymbols];
        v40 = [v39 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v60 = v36;
        __int16 v61 = 2114;
        v62 = v40;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v60 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferLearnNode _evaluateImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1140, @"Missing input thumbnail node", v41, v42, v43, v44, v54);
  }
  v6 = (void *)v5;
  uint64_t v7 = [(NUStyleTransferNode *)self targetNode];
  if (!v7)
  {
    v29 = NUAssertLogger_27648();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = [NSString stringWithFormat:@"Missing output thumbnail node"];
      *(_DWORD *)buf = 138543362;
      v60 = v30;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v32 = NUAssertLogger_27648();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (v31)
    {
      if (v33)
      {
        v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v46 = (void *)MEMORY[0x1E4F29060];
        id v47 = v45;
        v48 = [v46 callStackSymbols];
        v49 = [v48 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v60 = v45;
        __int16 v61 = 2114;
        v62 = v49;
        _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v33)
    {
      v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      v35 = [v34 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v60 = v35;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferLearnNode _evaluateImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1143, @"Missing output thumbnail node", v50, v51, v52, v53, v54);
  }
  v8 = (void *)v7;
  id v58 = 0;
  v9 = [v6 outputImage:&v58];
  id v10 = v58;
  if (v9)
  {
    id v57 = 0;
    v11 = [v8 outputImage:&v57];
    id v12 = v57;

    if (v11)
    {
      v13 = [(NUStyleTransferNode *)self configuration];
      v14 = (void *)[v13 mutableCopy];

      [v14 setObject:&unk_1F004A268 forKeyedSubscript:@"useFloat16"];
      v15 = [(NUStyleTransferNode *)self tuningParameters];
      v16 = [(NUStyleTransferNode *)self targetColorSpace];
      id v56 = 0;
      v17 = +[_NUStyleTransferLearnProcessor learnStyleFromInputThumbnail:v9 targetThumbnail:v11 colorSpace:v16 configuration:v14 tuningParameters:v15 error:&v56];
      id v55 = v56;

      if ([(NUStyleTransferNode *)self shouldCache])
      {
        v18 = [[NUProcessorCache alloc] initWithImage:v17];
        [(NUProcessorCache *)v18 setLabel:@"NUStyleTransferLearnNode.Provider"];
        v19 = +[NUPixelFormat R16h];
        [(NUProcessorCache *)v18 setPixelFormat:v19];

        uint64_t v20 = [(NUProcessorCache *)v18 outputImage];

        v17 = (void *)v20;
      }

      id v12 = v55;
    }
    else
    {
      +[NUError errorWithCode:1 reason:@"Invalid target thumbnail" object:v6 underlyingError:v12];
      v17 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    id v10 = v12;
  }
  else
  {
    +[NUError errorWithCode:1 reason:@"Invalid input thumbnail" object:v6 underlyingError:v10];
    v17 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v8.receiver = self;
  v8.super_class = (Class)NUStyleTransferLearnNode;
  v6 = [(NUStyleTransferNode *)&v8 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];

  return v6;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return 1;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v9 auxiliaryImageType] != 1)
  {
    v23 = NUAssertLogger_27648();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = [NSString stringWithFormat:@"%@ cannot be applied to aux images", objc_opt_class()];
      *(_DWORD *)buf = 138543362;
      v59 = v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v26 = NUAssertLogger_27648();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v38 = (void *)MEMORY[0x1E4F29060];
        id v39 = v37;
        v40 = [v38 callStackSymbols];
        uint64_t v41 = [v40 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v59 = v37;
        __int16 v60 = 2114;
        __int16 v61 = v41;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v59 = v29;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v42 = objc_opt_class();
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferLearnNode nodeByReplayingAgainstCache:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1079, @"%@ cannot be applied to aux images", v43, v44, v45, v46, v42);
  }
  if ([v9 evaluationMode] == 2)
  {
    v30 = NUAssertLogger_27648();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = [NSString stringWithFormat:@"%@ cannot be evaluated for video", objc_opt_class()];
      *(_DWORD *)buf = 138543362;
      v59 = v31;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v33 = NUAssertLogger_27648();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (v32)
    {
      if (v34)
      {
        id v47 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v48 = (void *)MEMORY[0x1E4F29060];
        id v49 = v47;
        uint64_t v50 = [v48 callStackSymbols];
        uint64_t v51 = [v50 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v59 = v47;
        __int16 v60 = 2114;
        __int16 v61 = v51;
        _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v34)
    {
      v35 = [MEMORY[0x1E4F29060] callStackSymbols];
      v36 = [v35 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v59 = v36;
      _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v52 = objc_opt_class();
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferLearnNode nodeByReplayingAgainstCache:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1080, @"%@ cannot be evaluated for video", v53, v54, v55, v56, v52);
  }
  if ([v9 evaluationMode])
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    v11 = [NUStyleTransferThumbnailNode alloc];
    id v12 = [(NUStyleTransferNode *)self inputNode];
    v13 = [(NURenderNode *)self settings];
    v14 = [(NUStyleTransferThumbnailNode *)v11 initWithInput:v12 settings:v13];

    v15 = [(NUStyleTransferThumbnailNode *)v14 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];

    if (v15)
    {
      [v10 setObject:v15 forKeyedSubscript:@"thumbnail"];
      v16 = [NUStyleTransferThumbnailNode alloc];
      v17 = [(NUStyleTransferNode *)self targetNode];
      v18 = [(NURenderNode *)self settings];
      v19 = [(NUStyleTransferThumbnailNode *)v16 initWithInput:v17 settings:v18];

      uint64_t v20 = [(NUStyleTransferThumbnailNode *)v19 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];

      if (v20)
      {
        [v10 setObject:v20 forKeyedSubscript:@"target"];
        v21 = [(NURenderNode *)self resolvedNodeWithCachedInputs:v10 cache:v8 pipelineState:v9 error:a5];
      }
      else
      {
        v21 = 0;
      }
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v57.receiver = self;
    v57.super_class = (Class)NUStyleTransferLearnNode;
    v21 = [(NUStyleTransferNode *)&v57 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];
  }

  return v21;
}

@end