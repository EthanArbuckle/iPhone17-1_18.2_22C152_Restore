@interface PISemanticStyleApplyNode
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NURenderNode)inputNode;
- (NURenderNode)thumbnailNode;
- (PISemanticStyleApplyNode)initWithInput:(id)a3 style:(id)a4 thumbnail:(id)a5;
- (PISemanticStyleApplyNode)initWithSettings:(id)a3 inputs:(id)a4;
- (PISemanticStyleLearnNode)styleNode;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
@end

@implementation PISemanticStyleApplyNode

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (![v9 evaluationMode])
  {
    v69.receiver = self;
    v69.super_class = (Class)PISemanticStyleApplyNode;
    v21 = [(NURenderNode *)&v69 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];
    goto LABEL_28;
  }
  if ([v9 auxiliaryImageType] != 1)
  {
    v22 = [(PISemanticStyleApplyNode *)self inputNode];
    v21 = [v22 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];

    goto LABEL_28;
  }
  v60 = a5;
  v10 = [(PISemanticStyleApplyNode *)self styleNode];
  v11 = [v10 settings];
  v12 = [v11 objectForKeyedSubscript:@"cast"];
  v13 = PISemanticStyleCastFromString(v12);

  v14 = [(PISemanticStyleApplyNode *)self styleNode];
  v15 = [v14 settings];
  v16 = [v15 objectForKeyedSubscript:@"tone"];
  [v16 floatValue];
  v17 = [(PISemanticStyleApplyNode *)self styleNode];
  v18 = [v17 settings];
  v19 = [v18 objectForKeyedSubscript:@"color"];
  [v19 floatValue];
  v59 = v13;
  LODWORD(v13) = [v13 isEqualToString:@"None"];

  if (!v13)
  {
    v23 = [(NURenderNode *)self videoProperties:v60];
    v24 = [v23 videoCorruptionInfo];
    int v25 = PFExists();

    if (v25)
    {
      v26 = [(PISemanticStyleApplyNode *)self inputNode];
LABEL_11:
      v27 = v26;
      v21 = [v26 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:v60];

LABEL_26:
      goto LABEL_27;
    }
    if ([v9 evaluationMode] == 2)
    {
      v26 = [(PISemanticStyleApplyNode *)self styleNode];
      goto LABEL_11;
    }
    if ([v9 evaluationMode] == 1)
    {
      if (v9)
      {
        [v9 time];
        if ((v67 & 0x100000000) != 0)
        {
          v28 = [(PISemanticStyleApplyNode *)self inputNode];
          v29 = [v28 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:v60];

          if (!v29)
          {
            v21 = 0;
LABEL_25:

            goto LABEL_26;
          }
          v30 = [v29 imageProperties:v60];
          v31 = v30;
          if (!v30)
          {
            v21 = 0;
LABEL_43:

            goto LABEL_25;
          }
          v32 = [v30 semanticStyleProperties];
          v33 = v32;
          if (v32)
          {
            [v32 keyTime];
            if (v65)
            {
              v43 = (void *)[v9 copy];
              [v33 keyTime];
              long long v61 = v63;
              uint64_t v62 = v64;
              [v43 setTime:&v61];
              [v43 setMediaComponentType:2];
              [v43 setDoNotOverride:1];
              v44 = [(PISemanticStyleApplyNode *)self styleNode];
              v45 = [v44 nodeByReplayingAgainstCache:v8 pipelineState:v43 error:v60];

              if (v45)
              {
                v58 = v45;
                v46 = [(PISemanticStyleApplyNode *)self thumbnailNode];
                v47 = v46;
                v57 = v43;
                if (v46)
                {
                  v48 = [v46 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:v60];
                }
                else
                {
                  v49 = [(PISemanticStyleApplyNode *)self inputNode];
                  v48 = [v49 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:v60];
                }
                v50 = (void *)MEMORY[0x1E4F7A628];
                v51 = [v58 settings];
                v52 = [v50 styleTransferThumbnailNodeWithInput:v48 settings:v51];

                v53 = [v52 inputs];
                v56 = [v52 resolvedNodeWithCachedInputs:v53 cache:v8 pipelineState:v9 error:v60];

                v45 = v58;
                v54 = [MEMORY[0x1E4F7A628] styleTransferApplyNodeWithInput:v29 thumbnail:v56 target:v58 settings:MEMORY[0x1E4F1CC08]];
                v55 = [v54 inputs];
                v21 = [v54 resolvedNodeWithCachedInputs:v55 cache:v8 pipelineState:v9 error:v60];

                v43 = v57;
              }
              else
              {
                v21 = 0;
              }

              goto LABEL_42;
            }
            v34 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid key time" object:v33];
          }
          else
          {
            v34 = [MEMORY[0x1E4F7A438] missingError:@"Missing semantic style properties" object:v31];
          }
          v21 = 0;
          id *v60 = v34;
LABEL_42:

          goto LABEL_43;
        }
      }
      else
      {
        uint64_t v66 = 0;
        uint64_t v67 = 0;
        uint64_t v68 = 0;
      }
    }
    v35 = [(PISemanticStyleApplyNode *)self thumbnailNode];
    v36 = v35;
    if (v35)
    {
      id v37 = v35;
    }
    else
    {
      id v37 = [(PISemanticStyleApplyNode *)self inputNode];
    }
    v29 = v37;

    v38 = (void *)MEMORY[0x1E4F7A628];
    v39 = [(PISemanticStyleApplyNode *)self inputNode];
    v40 = [(PISemanticStyleApplyNode *)self styleNode];
    v41 = [v38 styleTransferApplyNodeWithInput:v39 thumbnail:v29 target:v40 settings:MEMORY[0x1E4F1CC08]];

    v21 = [v41 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:v60];

    goto LABEL_25;
  }
  v20 = [(PISemanticStyleApplyNode *)self inputNode];
  v21 = [v20 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:v60];

LABEL_27:
LABEL_28:

  return v21;
}

BOOL __76__PISemanticStyleApplyNode_nodeByReplayingAgainstCache_pipelineState_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 1;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v8.receiver = self;
  v8.super_class = (Class)PISemanticStyleApplyNode;
  v6 = [(NURenderNode *)&v8 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];
  return v6;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return [a3 evaluationMode] == 0;
}

- (NURenderNode)thumbnailNode
{
  return (NURenderNode *)[(NURenderNode *)self inputForKey:@"thumbnail"];
}

- (PISemanticStyleLearnNode)styleNode
{
  return (PISemanticStyleLearnNode *)[(NURenderNode *)self inputForKey:@"style"];
}

- (NURenderNode)inputNode
{
  return (NURenderNode *)[(NURenderNode *)self inputForKey:@"input"];
}

- (PISemanticStyleApplyNode)initWithInput:(id)a3 style:(id)a4 thumbnail:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v15 = NUAssertLogger_9921();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      v16 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v16;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v17 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v19 = NUAssertLogger_9921();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v28 = dispatch_get_specific(*v17);
        v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        v17 = [v29 callStackSymbols];
        v31 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v39 = (const void **)v28;
        __int16 v40 = 2114;
        v41 = v31;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v39 = v17;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v25 = _NUAssertFailHandler();
    goto LABEL_17;
  }
  if (!v9)
  {
    v22 = NUAssertLogger_9921();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "style != nil");
      v23 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v23;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v17 = (const void **)MEMORY[0x1E4F7A308];
    v24 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v19 = NUAssertLogger_9921();
    int v25 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!v24)
    {
      if (v25)
      {
        v26 = [MEMORY[0x1E4F29060] callStackSymbols];
        v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v39 = v27;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_19;
    }
LABEL_17:
    if (v25)
    {
      v32 = dispatch_get_specific(*v17);
      v33 = (void *)MEMORY[0x1E4F29060];
      id v34 = v32;
      v35 = [v33 callStackSymbols];
      v36 = [v35 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v39 = (const void **)v32;
      __int16 v40 = 2114;
      v41 = v36;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_19:

    _NUAssertFailHandler();
  }
  v11 = v10;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v12 setObject:v8 forKeyedSubscript:@"input"];
  [v12 setObject:v9 forKeyedSubscript:@"style"];
  [v12 setObject:v11 forKeyedSubscript:@"thumbnail"];
  v37.receiver = self;
  v37.super_class = (Class)PISemanticStyleApplyNode;
  v13 = [(NURenderNode *)&v37 initWithSettings:&unk_1F000AD28 inputs:v12];

  return v13;
}

- (PISemanticStyleApplyNode)initWithSettings:(id)a3 inputs:(id)a4
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
      id v12 = v10;
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      v15 = NSStringFromSelector(a2);
      v16 = [v11 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v14, v15];
      *(_DWORD *)buf = 138543362;
      v31 = v16;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v17 = *v8;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v17 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_255);
        }
LABEL_7:
        os_log_t v18 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          v19 = (void *)MEMORY[0x1E4F29060];
          BOOL v20 = v18;
          v21 = [v19 callStackSymbols];
          v22 = [v21 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v31 = v22;
          _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v17 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_255);
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
      int v25 = (void *)MEMORY[0x1E4F29060];
      id v26 = specific;
      BOOL v20 = v23;
      v27 = [v25 callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v31 = specific;
      __int16 v32 = 2114;
      v33 = v28;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_255);
  }
}

@end