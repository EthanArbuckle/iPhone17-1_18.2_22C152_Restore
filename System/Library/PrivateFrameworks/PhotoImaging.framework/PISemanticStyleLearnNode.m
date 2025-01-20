@interface PISemanticStyleLearnNode
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (id)styleSettingsForPipelineState:(id)a3;
- (id)thumbnailSettingsWithStyleSettings:(id)a3 thumbnailSize:(id)a4;
@end

@implementation PISemanticStyleLearnNode

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v8.receiver = self;
  v8.super_class = (Class)PISemanticStyleLearnNode;
  v6 = [(PISemanticStyleRenderNode *)&v8 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];
  return v6;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    v31 = NUAssertLogger_9921();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      int buf = 138543362;
      *(void *)buf_4 = v32;
      _os_log_error_impl(&dword_1A9680000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    v33 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v35 = NUAssertLogger_9921();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v36)
      {
        v47 = dispatch_get_specific(*v33);
        v48 = (void *)MEMORY[0x1E4F29060];
        id v49 = v47;
        v50 = [v48 callStackSymbols];
        v51 = [v50 componentsJoinedByString:@"\n"];
        int buf = 138543618;
        *(void *)buf_4 = v47;
        __int16 v68 = 2114;
        v69 = v51;
        _os_log_error_impl(&dword_1A9680000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v36)
    {
      v37 = [MEMORY[0x1E4F29060] callStackSymbols];
      v38 = [v37 componentsJoinedByString:@"\n"];
      int buf = 138543362;
      *(void *)buf_4 = v38;
      _os_log_error_impl(&dword_1A9680000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    _NUAssertFailHandler();
LABEL_38:
    __break(1u);
  }
  v10 = v9;
  if ([v9 auxiliaryImageType] != 1)
  {
    v39 = NUAssertLogger_9921();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = [NSString stringWithFormat:@"%@ cannot be applied to aux images", objc_opt_class()];
      int buf = 138543362;
      *(void *)buf_4 = v40;
      _os_log_error_impl(&dword_1A9680000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    v41 = (const void **)MEMORY[0x1E4F7A308];
    v42 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v43 = NUAssertLogger_9921();
    BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
    if (v42)
    {
      if (v44)
      {
        v52 = dispatch_get_specific(*v41);
        v53 = (void *)MEMORY[0x1E4F29060];
        id v54 = v52;
        v55 = [v53 callStackSymbols];
        v56 = [v55 componentsJoinedByString:@"\n"];
        int buf = 138543618;
        *(void *)buf_4 = v52;
        __int16 v68 = 2114;
        v69 = v56;
        _os_log_error_impl(&dword_1A9680000, v43, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v44)
    {
      v45 = [MEMORY[0x1E4F29060] callStackSymbols];
      v46 = [v45 componentsJoinedByString:@"\n"];
      int buf = 138543362;
      *(void *)buf_4 = v46;
      _os_log_error_impl(&dword_1A9680000, v43, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    objc_opt_class();
    _NUAssertFailHandler();
    goto LABEL_38;
  }
  if ([v10 evaluationMode])
  {
    v11 = [PISemanticStyleRenderNode alloc];
    v12 = [(PISemanticStyleRenderNode *)self input];
    v13 = [(NURenderNode *)self settings];
    v14 = [(PISemanticStyleRenderNode *)v11 initWithInput:v12 settings:v13];

    v60 = v14;
    if ([v10 evaluationMode] == 2)
    {
      v15 = [(PISemanticStyleRenderNode *)v14 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];
    }
    else
    {
      v59 = [(PISemanticStyleLearnNode *)self styleSettingsForPipelineState:v10];
      v16 = [(NURenderNode *)self settings];
      v17 = (void *)[v16 mutableCopy];

      v58 = v17;
      [v17 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"useStyleEngine"];
      if ([v10 evaluationMode] == 3)
      {
        uint64_t v62 = 0;
        uint64_t v63 = 0;
        uint64_t v64 = 0;
        if (v10) {
          [v10 time];
        }
        [MEMORY[0x1E4F7A438] invalidError:@"invalid frame time" object:v10];
        v15 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else if ([v10 evaluationMode] == 1)
      {
        v18 = [(PISemanticStyleRenderNode *)self input];
        v57 = [v18 imageProperties:a5];

        v19 = [v57 auxiliaryImagePropertiesForType:10];
        v20 = v19;
        if (v19)
        {
          uint64_t v21 = [v19 size];
          uint64_t v23 = v22;
        }
        else
        {
          uint64_t v23 = 192;
          uint64_t v21 = 256;
        }
        v24 = -[PISemanticStyleLearnNode thumbnailSettingsWithStyleSettings:thumbnailSize:](self, "thumbnailSettingsWithStyleSettings:thumbnailSize:", v59, v21, v23);
        v25 = (void *)MEMORY[0x1E4F7A628];
        v26 = [(PISemanticStyleRenderNode *)self input];
        v27 = [v25 styleTransferThumbnailNodeWithInput:v26 settings:v24];

        v28 = [[PISemanticStyleRenderNode alloc] initWithInput:v27 settings:v58];
        v29 = [MEMORY[0x1E4F7A628] styleTransferLearnNodeWithInput:v27 target:v28 settings:v59];
        v15 = [v29 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];
      }
      else
      {
        v61.receiver = self;
        v61.super_class = (Class)PISemanticStyleLearnNode;
        v15 = [(PISemanticStyleRenderNode *)&v61 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];
      }
    }
  }
  else
  {
    v65.receiver = self;
    v65.super_class = (Class)PISemanticStyleLearnNode;
    v15 = [(PISemanticStyleRenderNode *)&v65 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];
  }

  return v15;
}

double __76__PISemanticStyleLearnNode_nodeByReplayingAgainstCache_pipelineState_error___block_invoke(uint64_t a1, CMTime *a2)
{
  memset(&v10, 0, sizeof(v10));
  v3 = *(void **)(a1 + 32);
  if (v3) {
    [v3 time];
  }
  CMTime lhs = *a2;
  CMTime v7 = v10;
  CMTimeSubtract(&time, &lhs, &v7);
  Float64 Seconds = CMTimeGetSeconds(&time);
  double v5 = Seconds * Seconds / -0.08;
  return exp(v5);
}

void __76__PISemanticStyleLearnNode_nodeByReplayingAgainstCache_pipelineState_error___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  [*(id *)(a1 + 32) updatePipelineStateForWindowedSampleIndex:a2];
  double v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  id v19 = 0;
  id v8 = [v5 nodeByReplayingAgainstCache:v6 pipelineState:v7 error:&v19];
  id v9 = v19;
  if (v8)
  {
    [*(id *)(a1 + 56) addObject:v8];
    CMTime v10 = NSNumber;
    v11 = *(void **)(a1 + 64);
    uint64_t v12 = *(void *)(a1 + 72);
    v13 = *(void **)(a1 + 32);
    if (v13) {
      [v13 time];
    }
    else {
      memset(v18, 0, sizeof(v18));
    }
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v18);
    v17 = objc_msgSend(v10, "numberWithDouble:");
    [v11 addObject:v17];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to evaluate keyframe learn node" object:*(void *)(a1 + 40) underlyingError:v9];
    uint64_t v15 = *(void *)(*(void *)(a1 + 80) + 8);
    v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    *a3 = 1;
  }
}

id __76__PISemanticStyleLearnNode_nodeByReplayingAgainstCache_pipelineState_error___block_invoke_190(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) doubleValue];
  double v9 = v8;
  [v6 doubleValue];
  CMTime v10 = v7;
  if (v9 < v11)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    CMTime v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  id v12 = v10;
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "unsignedIntegerValue") + 1);
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  return v12;
}

- (id)thumbnailSettingsWithStyleSettings:(id)a3 thumbnailSize:(id)a4
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v12 = NUAssertLogger_9921();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "settings != nil");
      *(_DWORD *)int buf = 138543362;
      v26 = v13;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v14 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v16 = NUAssertLogger_9921();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific(*v14);
        uint64_t v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        uint64_t v23 = [v21 callStackSymbols];
        v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)int buf = 138543618;
        v26 = v20;
        __int16 v27 = 2114;
        v28 = v24;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)int buf = 138543362;
      v26 = v19;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v7 = v6;
  double v8 = (void *)[v6 mutableCopy];
  double v9 = [NSNumber numberWithInteger:var0];
  [v8 setObject:v9 forKeyedSubscript:@"thumbnailWidth"];

  CMTime v10 = [NSNumber numberWithInteger:var1];
  [v8 setObject:v10 forKeyedSubscript:@"thumbnailHeight"];

  return v8;
}

- (id)styleSettingsForPipelineState:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 evaluationMode] == 3 || v4 && (objc_msgSend(v4, "time"), (v60 & 1) != 0))
  {
    double v5 = (void *)MEMORY[0x1E4F7A6B8];
    uint64_t v6 = [v4 scale];
    double v8 = objc_msgSend(v5, "semanticStyleVideoSettingsForScale:", v6, v7);
LABEL_7:
    id v12 = v8;
    uint64_t v13 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F7A360]];
    uint64_t v14 = [v13 objectForKeyedSubscript:@"StylePriorStrength"];
    [v14 floatValue];
    int v16 = v15;

    BOOL v17 = [(NURenderNode *)self settings];
    v18 = [v17 objectForKeyedSubscript:@"cast"];

    id v19 = [(NURenderNode *)self settings];
    v20 = [v19 objectForKeyedSubscript:@"tone"];
    [v20 floatValue];
    int v22 = v21;

    uint64_t v23 = [(NURenderNode *)self settings];
    v24 = [v23 objectForKeyedSubscript:@"color"];
    [v24 floatValue];
    int v26 = v25;

    __int16 v27 = [(NURenderNode *)self settings];
    v28 = [v27 objectForKeyedSubscript:@"intensity"];
    [v28 floatValue];
    int v30 = v29;

    LODWORD(v31) = v22;
    LODWORD(v32) = v26;
    LODWORD(v33) = v30;
    LODWORD(v34) = v16;
    v35 = +[PISemanticStyleFilter stylePriorDataForCast:v18 tone:v31 color:v32 intensity:v33 priorStrength:v34];
    if (v35)
    {
      BOOL v36 = (void *)[v12 mutableCopy];
      v37 = (void *)MEMORY[0x1E4F7A350];
      v38 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F7A350]];
      v39 = (void *)[v38 mutableCopy];

      [v39 setObject:v35 forKeyedSubscript:@"priorMatrix"];
      [v36 setObject:v39 forKeyedSubscript:*v37];
      uint64_t v40 = [v36 copy];

      id v12 = (void *)v40;
    }

    return v12;
  }
  if ([v4 evaluationMode] == 1)
  {
    double v9 = (void *)MEMORY[0x1E4F7A6B8];
    uint64_t v10 = [v4 scale];
    double v8 = objc_msgSend(v9, "semanticStyleImageSettingsForScale:", v10, v11);
    goto LABEL_7;
  }
  v42 = NUAssertLogger_9921();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    v43 = [NSString stringWithFormat:@"Unexpected pipeline state"];
    *(_DWORD *)int buf = 138543362;
    uint64_t v62 = v43;
    _os_log_error_impl(&dword_1A9680000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  BOOL v44 = (const void **)MEMORY[0x1E4F7A308];
  specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
  v46 = NUAssertLogger_9921();
  BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
  if (specific)
  {
    if (v47)
    {
      v50 = dispatch_get_specific(*v44);
      v51 = (void *)MEMORY[0x1E4F29060];
      id v52 = v50;
      v53 = [v51 callStackSymbols];
      id v54 = [v53 componentsJoinedByString:@"\n"];
      *(_DWORD *)int buf = 138543618;
      uint64_t v62 = v50;
      __int16 v63 = 2114;
      uint64_t v64 = v54;
      _os_log_error_impl(&dword_1A9680000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else if (v47)
  {
    v48 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v49 = [v48 componentsJoinedByString:@"\n"];
    *(_DWORD *)int buf = 138543362;
    uint64_t v62 = v49;
    _os_log_error_impl(&dword_1A9680000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
  }
  v55 = (PISemanticStyleApplyNode *)_NUAssertFailHandler();
  return [(PISemanticStyleApplyNode *)v55 nodeByReplayingAgainstCache:v57 pipelineState:v58 error:v59];
}

@end