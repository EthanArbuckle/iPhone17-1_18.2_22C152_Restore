@interface PIDepthEffectNode
- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3;
- (PIDepthEffectNode)initWithInput:(id)a3 blurMap:(id)a4 settings:(id)a5;
- (PIDepthEffectNode)initWithSettings:(id)a3 inputs:(id)a4;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
@end

@implementation PIDepthEffectNode

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    v62 = NUAssertLogger_15192();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      v63 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v89 = v63;
      _os_log_error_impl(&dword_1A9680000, v62, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v64 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v66 = NUAssertLogger_15192();
    BOOL v67 = os_log_type_enabled(v66, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v67)
      {
        v70 = dispatch_get_specific(*v64);
        v71 = (void *)MEMORY[0x1E4F29060];
        id v72 = v70;
        v73 = [v71 callStackSymbols];
        v74 = [v73 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v89 = v70;
        __int16 v90 = 2114;
        v91 = v74;
        _os_log_error_impl(&dword_1A9680000, v66, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v67)
    {
      v68 = [MEMORY[0x1E4F29060] callStackSymbols];
      v69 = [v68 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v89 = v69;
      _os_log_error_impl(&dword_1A9680000, v66, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v10 = v9;
  if ([v9 evaluationMode] != 1)
  {
    [MEMORY[0x1E4F7A438] unsupportedError:@"Depth Effect only applies to images" object:0];
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
  v11 = [(PIPortraitNode *)self input];
  v12 = [v11 imageProperties:a5];

  if (v12)
  {
    v13 = [v12 flexRangeProperties];
    if (v13)
    {
      BOOL v14 = 1;
    }
    else
    {
      v16 = [v12 meteorPlusGainMapVersion];
      BOOL v14 = [v16 major] > 1;
    }
    if ([v10 auxiliaryImageType] == 1
      || ([v10 auxiliaryImageType] == 7 ? (BOOL v17 = v14) : (BOOL v17 = 0), v17))
    {
      v18 = [(PIPortraitNode *)self input];
      v19 = [v18 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];

      if (!v19)
      {
        v15 = 0;
LABEL_41:

        goto LABEL_42;
      }
      BOOL v81 = v14;
      v20 = (void *)[v10 copy];
      [v20 setAuxiliaryImageType:1];
      v21 = [(PIPortraitNode *)self blurMap];
      id v87 = 0;
      v22 = [v21 nodeByReplayingAgainstCache:v8 pipelineState:v20 error:&v87];
      id v23 = v87;

      if (!v22)
      {
        v32 = (void *)MEMORY[0x1E4F7A438];
        uint64_t v33 = [(PIPortraitNode *)self blurMap];
        v34 = v32;
        v35 = (void *)v33;
        [v34 errorWithCode:1 reason:@"Failed to evaluate blur map" object:v33 underlyingError:v23];
        v15 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_40:

        goto LABEL_41;
      }
      v83 = v22;
      v84 = v23;
      v24 = [v12 auxiliaryImagePropertiesForType:7];
      v82 = v20;
      if (v24)
      {
        [v20 setAuxiliaryImageType:7];
        [v12 size];
        [v24 size];
        uint64_t v25 = NUScaleToFillSizeInSize();
        objc_msgSend(v20, "setScale:", v25, v26);
        v27 = [(PIPortraitNode *)self input];
        id v86 = 0;
        uint64_t v28 = [v27 nodeByReplayingAgainstCache:v8 pipelineState:v20 error:&v86];
        id v29 = v86;

        if (!v28)
        {
          v57 = (void *)MEMORY[0x1E4F7A438];
          v58 = [(PIPortraitNode *)self input];
          [v57 errorWithCode:1 reason:@"Failed to evaluate gain map" object:v58 underlyingError:v29];
          v15 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          v59 = v24;
          id v23 = v29;
          v35 = v59;
          v22 = v83;
LABEL_39:

          v20 = v82;
          goto LABEL_40;
        }
        v84 = v29;
        uint64_t v30 = v28;
      }
      else
      {
        uint64_t v30 = 0;
      }
      id v36 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v36 setObject:v19 forKeyedSubscript:@"inputImage"];
      [v36 setObject:v83 forKeyedSubscript:@"inputBlurMap"];
      v79 = (void *)v30;
      [v36 setObject:v30 forKeyedSubscript:@"inputGainMap"];
      v37 = [v12 auxiliaryImagePropertiesForType:3];

      v78 = v37;
      if (v37)
      {
        [v82 setAuxiliaryImageType:3];
        [v12 size];
        [v37 size];
        uint64_t v38 = NUScaleToFillSizeInSize();
        objc_msgSend(v82, "setScale:", v38, v39);
        v40 = [(PIPortraitNode *)self input];
        id v85 = 0;
        v37 = [v40 nodeByReplayingAgainstCache:v8 pipelineState:v82 error:&v85];
        id v41 = v85;

        if (!v37)
        {
          v60 = (void *)MEMORY[0x1E4F7A438];
          v56 = [(PIPortraitNode *)self input];
          [v60 errorWithCode:1 reason:@"Failed to evaluate portrait effect matte" object:v56 underlyingError:v41];
          v15 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          id v23 = v41;
LABEL_38:

          v22 = v83;
          v35 = v78;
          v58 = v79;
          goto LABEL_39;
        }
        v77 = v19;
        v84 = v41;
      }
      else
      {
        v77 = v19;
      }
      v76 = v37;
      [v36 setObject:v37 forKeyedSubscript:@"inputMatte"];
      v42 = [MEMORY[0x1E4F1CA60] dictionary];
      v43 = [(NURenderNode *)self settings];
      v44 = [v43 objectForKeyedSubscript:@"depthInfo"];

      v80 = v44;
      v45 = [v44 objectForKeyedSubscript:@"lumaNoiseScale"];
      [v42 setObject:v45 forKeyedSubscript:@"inputLumaNoiseScale"];

      v46 = NSNumber;
      [v10 scale];
      NUScaleToDouble();
      v47 = objc_msgSend(v46, "numberWithDouble:");
      [v42 setObject:v47 forKeyedSubscript:@"inputScale"];

      v75 = [v12 auxiliaryImagePropertiesForType:2];
      objc_msgSend(v42, "setObject:forKeyedSubscript:", objc_msgSend(v75, "auxiliaryDataInfoMetadata"), @"inputDepthMetadata");
      v48 = [v12 auxiliaryImagePropertiesForType:7];
      objc_msgSend(v42, "setObject:forKeyedSubscript:", objc_msgSend(v48, "auxiliaryDataInfoMetadata"), @"inputGainMapMetadata");
      v49 = [v48 auxiliaryImageTypeCGIdentifier];
      LODWORD(v44) = [v49 isEqualToString:*MEMORY[0x1E4F2F3C8]];

      if (v44)
      {
        [v42 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"inputGainMapIsLinear"];
        objc_msgSend(v42, "setObject:forKeyedSubscript:", objc_msgSend(v48, "compatibilityMetadata"), @"inputGainMapMetadata");
      }
      v50 = [v80 objectForKeyedSubscript:@"shape"];
      [v42 setObject:v50 forKeyedSubscript:@"inputShape"];

      v51 = [(NURenderNode *)self settings];
      v52 = [v51 objectForKeyedSubscript:@"aperture"];
      [v42 setObject:v52 forKeyedSubscript:@"inputAperture"];

      v53 = [(NURenderNode *)self settings];
      v54 = [v53 objectForKeyedSubscript:@"portraitEffect"];

      if (v54 && ([(id)objc_opt_class() isPortraitStageEffect:v54] & 1) != 0
        || [v10 auxiliaryImageType] == 7)
      {
        [v42 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"inputBestHairQuality"];
      }
      if (v81) {
        [v42 setObject:&unk_1F0009C08 forKeyedSubscript:@"__gainMapMode"];
      }
      v55 = (void *)[objc_alloc(MEMORY[0x1E4F7A460]) initWithFilterName:@"PIDepthEffectFilter" settings:v42 inputs:v36];
      v15 = [v55 resolvedNodeWithCachedInputs:v36 cache:v8 pipelineState:v10 error:a5];

      v56 = v76;
      v19 = v77;
      id v23 = v84;
      goto LABEL_38;
    }
    v31 = [(PIPortraitNode *)self input];
    v15 = [v31 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];
  }
  else
  {
    v15 = 0;
  }
LABEL_42:

LABEL_43:
  return v15;
}

- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PIDepthEffectNode;
  BOOL result = -[PIPortraitNode canPropagateOriginalAuxiliaryData:](&v5, sel_canPropagateOriginalAuxiliaryData_);
  if (a3 == 7) {
    return 0;
  }
  return result;
}

- (PIDepthEffectNode)initWithInput:(id)a3 blurMap:(id)a4 settings:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v15 = NUAssertLogger_15192();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      v16 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v41 = v16;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v17 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v19 = NUAssertLogger_15192();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        uint64_t v28 = dispatch_get_specific(*v17);
        id v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        BOOL v17 = [v29 callStackSymbols];
        v31 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v41 = (const void **)v28;
        __int16 v42 = 2114;
        v43 = v31;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v17 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v41 = v17;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v25 = _NUAssertFailHandler();
    goto LABEL_17;
  }
  if (!v9)
  {
    v22 = NUAssertLogger_15192();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "blurMap != nil");
      id v23 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v41 = v23;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v17 = (const void **)MEMORY[0x1E4F7A308];
    v24 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v19 = NUAssertLogger_15192();
    int v25 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!v24)
    {
      if (v25)
      {
        uint64_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
        v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        id v41 = v27;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_19;
    }
LABEL_17:
    if (v25)
    {
      v32 = dispatch_get_specific(*v17);
      uint64_t v33 = (void *)MEMORY[0x1E4F29060];
      id v34 = v32;
      v35 = [v33 callStackSymbols];
      id v36 = [v35 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      id v41 = (const void **)v32;
      __int16 v42 = 2114;
      v43 = v36;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_19:

    _NUAssertFailHandler();
  }
  v11 = v10;
  v38[0] = @"inputImage";
  v38[1] = @"inputBlurMap";
  v39[0] = v8;
  v39[1] = v9;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
  v37.receiver = self;
  v37.super_class = (Class)PIDepthEffectNode;
  v13 = [(NURenderNode *)&v37 initWithSettings:v11 inputs:v12];

  return v13;
}

- (PIDepthEffectNode)initWithSettings:(id)a3 inputs:(id)a4
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
      BOOL v14 = NSStringFromClass(v13);
      v15 = NSStringFromSelector(a2);
      v16 = [v11 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v14, v15];
      *(_DWORD *)buf = 138543362;
      v31 = v16;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v17 = *v8;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v17 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_15332);
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
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_15332);
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
      uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v31 = specific;
      __int16 v32 = 2114;
      uint64_t v33 = v28;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    id v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_15332);
  }
}

@end