@interface PIInpaintAuxiliaryImageNode
+ (id)styleTransferSettingsForGeometry:(id)a3;
- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NURenderNode)inputNode;
- (NURenderNode)retouchNode;
- (PIInpaintAuxiliaryImageNode)initWithInputs:(id)a3 retouchNode:(id)a4 settings:(id)a5;
- (PIInpaintAuxiliaryImageNode)initWithSettings:(id)a3 inputs:(id)a4;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
@end

@implementation PIInpaintAuxiliaryImageNode

- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3
{
  return 0;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v8.receiver = self;
  v8.super_class = (Class)PIInpaintAuxiliaryImageNode;
  v6 = [(NURenderNode *)&v8 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];
  return v6;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return 1;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  v58[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v9 evaluationMode])
  {
    v10 = [(PIInpaintAuxiliaryImageNode *)self inputNode];
    v11 = [(PIInpaintAuxiliaryImageNode *)self retouchNode];
    v12 = [(NURenderNode *)self inputs];
    v13 = (void *)[v12 mutableCopy];

    [v13 setObject:0 forKeyedSubscript:@"retouch"];
    v54 = a5;
    id v55 = v8;
    if ([v9 auxiliaryImageType] == 7)
    {
      v53 = v13;
      v14 = [v10 outputImageGeometry:a5];
      uint64_t v15 = [v14 size];
      [v14 size];
      uint64_t v51 = v16;
      uint64_t v52 = v15;
      if (v15 < v16)
      {
        v17 = (void *)[objc_alloc(MEMORY[0x1E4F7A5B8]) initWithOrientation:6 input:v10];

        uint64_t v18 = [v17 outputImageGeometry:a5];

        uint64_t v19 = [objc_alloc(MEMORY[0x1E4F7A5B8]) initWithOrientation:6 input:v11];
        v14 = (void *)v18;
        v11 = (void *)v19;
        v10 = v17;
      }
      v57[0] = @"inputPreserveColor";
      v57[1] = @"inputMixFactor";
      v58[0] = MEMORY[0x1E4F1CC38];
      v20 = NSNumber;
      v21 = +[PIGlobalSettings globalSettings];
      [v21 inpaintGainMapMixFactor];
      v22 = objc_msgSend(v20, "numberWithDouble:");
      v58[1] = v22;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];

      uint64_t v24 = [MEMORY[0x1E4F7A628] lightMapFromGainMap:v10 settings:v23];
      v25 = [(id)objc_opt_class() styleTransferSettingsForGeometry:v14];
      v50 = (void *)v24;
      v49 = [MEMORY[0x1E4F7A628] styleTransferLearnNodeWithInput:v10 target:v24 settings:v25];
      v26 = objc_msgSend(MEMORY[0x1E4F7A628], "styleTransferApplyNodeWithInput:thumbnail:target:settings:", v11, 0);
      v27 = [MEMORY[0x1E4F7A628] gainMapFromLightMap:v26 base:v11 settings:v23];

      if (v52 < v51)
      {
        uint64_t v28 = [objc_alloc(MEMORY[0x1E4F7A5B8]) initWithOrientation:8 input:v27];

        uint64_t v29 = [objc_alloc(MEMORY[0x1E4F7A5B8]) initWithOrientation:8 input:v10];
        v27 = (void *)v28;
        v10 = (void *)v29;
      }
      v30 = v53;
      v31 = [PIInpaintCombinedMaskNode alloc];
      v32 = [(NURenderNode *)self settings];
      v33 = [(PIInpaintCombinedMaskNode *)v31 initWithSettings:v32 inputs:v53 mode:11];

      v34 = [[PIInfillCompositeNode alloc] initWithInput:v27 background:v10 matte:v33 settings:&unk_1F000AC88];
    }
    else
    {
      v36 = [PIInpaintCombinedMaskNode alloc];
      v37 = [(NURenderNode *)self settings];
      v38 = [(PIInpaintCombinedMaskNode *)v36 initWithSettings:v37 inputs:v13 mode:5];

      v39 = [[PIInfillFilterNode alloc] initWithInputImage:v10 inputMatte:v38 infillAlgorithm:4];
      v40 = [PIInpaintCombinedMaskNode alloc];
      v41 = [(NURenderNode *)self settings];
      v42 = [(PIInpaintCombinedMaskNode *)v40 initWithSettings:v41 inputs:v13 mode:9];

      v43 = [PIInfillCompositeNode alloc];
      v44 = [(PIInfillCompositeNode *)v43 initWithInput:v39 background:v10 matte:v42 settings:MEMORY[0x1E4F1CC08]];

      v45 = [PIInpaintCombinedMaskNode alloc];
      v46 = [(NURenderNode *)self settings];
      v47 = [(PIInpaintCombinedMaskNode *)v45 initWithSettings:v46 inputs:v13 mode:2];

      v34 = [[PIInfillFilterNode alloc] initWithInputImage:v44 inputMatte:v47 infillAlgorithm:4];
      v30 = v13;
    }
    id v8 = v55;
    v35 = [(NURenderNode *)v34 nodeByReplayingAgainstCache:v55 pipelineState:v9 error:v54];
  }
  else
  {
    v56.receiver = self;
    v56.super_class = (Class)PIInpaintAuxiliaryImageNode;
    v35 = [(NURenderNode *)&v56 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];
  }

  return v35;
}

- (NURenderNode)retouchNode
{
  v2 = [(NURenderNode *)self inputs];
  v3 = [v2 objectForKeyedSubscript:@"retouch"];

  return (NURenderNode *)v3;
}

- (NURenderNode)inputNode
{
  v2 = [(NURenderNode *)self inputs];
  v3 = [v2 objectForKeyedSubscript:@"input"];

  return (NURenderNode *)v3;
}

- (PIInpaintAuxiliaryImageNode)initWithInputs:(id)a3 retouchNode:(id)a4 settings:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    uint64_t v16 = NUAssertLogger_5469();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputs != nil");
      v17 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v17;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v18 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v20 = NUAssertLogger_5469();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v34 = dispatch_get_specific(*v18);
        v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        uint64_t v18 = [v35 callStackSymbols];
        v37 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v49 = (const void **)v34;
        __int16 v50 = 2114;
        uint64_t v51 = v37;
        _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v18 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v49 = v18;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v26 = _NUAssertFailHandler();
    goto LABEL_23;
  }
  v11 = v10;
  if (!v10)
  {
    v23 = NUAssertLogger_5469();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "settings != nil");
      uint64_t v24 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v24;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v18 = (const void **)MEMORY[0x1E4F7A308];
    v25 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v20 = NUAssertLogger_5469();
    int v26 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (!v25)
    {
      if (v26)
      {
        v27 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v18 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v49 = v18;
        _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_25:

      int v31 = _NUAssertFailHandler();
      goto LABEL_26;
    }
LABEL_23:
    if (v26)
    {
      v38 = dispatch_get_specific(*v18);
      v39 = (void *)MEMORY[0x1E4F29060];
      id v40 = v38;
      uint64_t v18 = [v39 callStackSymbols];
      v41 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v49 = (const void **)v38;
      __int16 v50 = 2114;
      uint64_t v51 = v41;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_25;
  }
  if (!v9)
  {
    uint64_t v28 = NUAssertLogger_5469();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "retouchNode != nil");
      uint64_t v29 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v29;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v18 = (const void **)MEMORY[0x1E4F7A308];
    v30 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v20 = NUAssertLogger_5469();
    int v31 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (!v30)
    {
      if (v31)
      {
        v32 = [MEMORY[0x1E4F29060] callStackSymbols];
        v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v49 = v33;
        _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_28;
    }
LABEL_26:
    if (v31)
    {
      v42 = dispatch_get_specific(*v18);
      v43 = (void *)MEMORY[0x1E4F29060];
      id v44 = v42;
      v45 = [v43 callStackSymbols];
      v46 = [v45 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v49 = (const void **)v42;
      __int16 v50 = 2114;
      uint64_t v51 = v46;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_28:

    _NUAssertFailHandler();
  }
  v12 = (void *)[v8 mutableCopy];
  [v12 setObject:v9 forKeyedSubscript:@"retouch"];
  v13 = (void *)[v11 mutableCopy];
  [v13 setObject:@"input" forKeyedSubscript:@"__dominantInputSettingsKey"];
  v47.receiver = self;
  v47.super_class = (Class)PIInpaintAuxiliaryImageNode;
  v14 = [(NURenderNode *)&v47 initWithSettings:v13 inputs:v12];

  return v14;
}

- (PIInpaintAuxiliaryImageNode)initWithSettings:(id)a3 inputs:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    id v9 = (os_log_t *)MEMORY[0x1E4F7A748];
    id v10 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      v11 = NSString;
      v12 = v10;
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      uint64_t v15 = NSStringFromSelector(a2);
      uint64_t v16 = [v11 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v14, v15];
      *(_DWORD *)buf = 138543362;
      int v31 = v16;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v17 = *v8;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v17 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_198_5505);
        }
LABEL_7:
        os_log_t v18 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = (void *)MEMORY[0x1E4F29060];
          v20 = v18;
          BOOL v21 = [v19 callStackSymbols];
          v22 = [v21 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          int v31 = v22;
          _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v17 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_198_5505);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v23 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v25 = (void *)MEMORY[0x1E4F29060];
      id v26 = specific;
      v20 = v23;
      v27 = [v25 callStackSymbols];
      uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      int v31 = specific;
      __int16 v32 = 2114;
      v33 = v28;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    uint64_t v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_198_5505);
  }
}

+ (id)styleTransferSettingsForGeometry:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F7A6B8], "defaultImageSettingsForScale:", *MEMORY[0x1E4F7A338], *(void *)(MEMORY[0x1E4F7A338] + 8));
  v4 = (void *)MEMORY[0x1E4F7A350];
  v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F7A350]];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = (uint64_t *)MEMORY[0x1E4F7A360];
  id v8 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F7A360]];
  [v6 setObject:@"inpaint-aux" forKeyedSubscript:@"usage"];
  uint64_t v9 = *v7;
  v12[0] = *v4;
  v12[1] = v9;
  v13[0] = v6;
  v13[1] = v8;
  v12[2] = *MEMORY[0x1E4F7A358];
  v13[2] = @"displayP3Linear";
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

@end