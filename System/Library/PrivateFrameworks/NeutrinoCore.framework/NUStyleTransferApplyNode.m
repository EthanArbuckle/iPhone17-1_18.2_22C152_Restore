@interface NUStyleTransferApplyNode
- (NUStyleTransferApplyNode)initWithInput:(id)a3 thumbnail:(id)a4 target:(id)a5 settings:(id)a6;
- (id)_evaluateImage:(id *)a3;
- (id)configuration;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (id)styleNode;
- (id)targetColorSpace;
- (id)thumbnailNode;
- (id)tuningParameters;
@end

@implementation NUStyleTransferApplyNode

- (id)_evaluateImage:(id *)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v5 = [(NUStyleTransferNode *)self inputNode];
  id v41 = 0;
  v6 = [v5 outputImage:&v41];
  id v7 = v41;

  if (!v6)
  {
    v9 = [(NUStyleTransferNode *)self inputNode];
    +[NUError errorWithCode:1 reason:@"Failed to get input image" object:v9 underlyingError:v7];
    id v23 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  v8 = [(NUStyleTransferApplyNode *)self thumbnailNode];
  id v40 = 0;
  v9 = [v8 outputImage:&v40];
  id v10 = v40;

  if (v9)
  {
    v11 = [(NUStyleTransferApplyNode *)self styleNode];
    v12 = v11;
    if (!v11)
    {
      v12 = [(NUStyleTransferNode *)self targetNode];
    }
    id v39 = 0;
    v13 = [v12 outputImage:&v39];
    id v14 = v39;

    if (!v11) {
    if (!v13)
    }
    {
      id v23 = v6;
LABEL_34:
      id v10 = v14;
      goto LABEL_35;
    }
    v15 = [(NUStyleTransferApplyNode *)self configuration];
    v16 = (void *)[v15 mutableCopy];

    [v16 setObject:&unk_1F004A268 forKeyedSubscript:@"useFloat16"];
    v17 = [(NUStyleTransferApplyNode *)self tuningParameters];
    v37 = [(NUStyleTransferApplyNode *)self targetColorSpace];
    v18 = [v17 objectForKeyedSubscript:@"ResidualScaleFactor"];
    [v18 floatValue];
    float v20 = v19;

    if (v20 <= 0.0) {
      goto LABEL_14;
    }
    if (+[NUGlobalSettings semanticStyleDisableResiduals])
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
      }
      v21 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9892000, v21, OS_LOG_TYPE_INFO, "NUStyleTransferApplyNode: not applying residuals, disabled", buf, 2u);
      }
LABEL_14:
      v22 = 0;
LABEL_33:
      v32 = [(NUStyleTransferNode *)self noiseModel];
      id v23 = +[_NUStyleTransferApplyProcessor applyStyle:v13 toImage:v6 thumbnail:v9 target:v22 deltaMap:0 colorSpace:v37 configuration:v16 tuningParameters:v17 noiseModel:v32 error:a3];

      goto LABEL_34;
    }
    v24 = [(NUStyleTransferApplyNode *)self styleNode];
    v35 = [v24 targetNode];

    v25 = [(NUStyleTransferApplyNode *)self styleNode];
    uint64_t v26 = [v25 thumbnailNode];

    [(NUStyleTransferApplyNode *)self thumbnailNode];
    v34 = v36 = (void *)v26;
    if ((void *)v26 == v34
      || +[NUGlobalSettings semanticStyleAllowResidualsMismatch])
    {
      v27 = [(NUStyleTransferApplyNode *)self thumbnailNode];

      if ((void *)v26 != v27)
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
        }
        v28 = _NULogger;
        if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A9892000, v28, OS_LOG_TYPE_INFO, "NUStyleTransferApplyNode: applying residuals even though thumbnails do not match", buf, 2u);
        }
      }
      id v38 = 0;
      v22 = [v35 outputImage:&v38];
      id v29 = v38;

      if (v22)
      {
        id v14 = v29;
        v30 = v35;
LABEL_32:

        goto LABEL_33;
      }
      v31 = NULogger_28099();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v14 = v29;
        id v43 = v29;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "NUStyleTransferApplyNode: not applying residuals because of error: %{public}@", buf, 0xCu);
      }
      else
      {
        id v14 = v29;
      }
    }
    else
    {
      v31 = NULogger_28099();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9892000, v31, OS_LOG_TYPE_INFO, "NUStyleTransferApplyNode: not applying residuals because thumbnails do not match", buf, 2u);
      }
    }
    v30 = v35;

    v22 = 0;
    goto LABEL_32;
  }
  v13 = [(NUStyleTransferApplyNode *)self thumbnailNode];
  +[NUError errorWithCode:1 reason:@"Failed to get input thumbnail image" object:v13 underlyingError:v10];
  id v23 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_35:

  id v7 = v10;
LABEL_36:

  return v23;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v12 = (void *)[a4 mutableCopy];
  v13 = [v10 objectForKeyedSubscript:@"target"];
  id v14 = [v13 configuration];
  v15 = [v14 objectForKeyedSubscript:@"applySyntheticNoise"];
  int v16 = [v15 BOOLValue];

  if (v16)
  {
    v17 = [(NUStyleTransferNode *)self inputNode];
    v18 = [v17 imageProperties:a6];

    if (!v18)
    {
      v34 = 0;
      goto LABEL_13;
    }
    float v19 = [v18 metadata];
    float v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];

    v21 = [v20 objectForKeyedSubscript:@"90"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = v20;
      id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __86__NUStyleTransferApplyNode_resolvedNodeWithCachedInputs_settings_pipelineState_error___block_invoke;
      v42[3] = &unk_1E5D95CB0;
      id v43 = v11;
      id v39 = self;
      id v23 = (void (**)(void, void))MEMORY[0x1AD0FAD00](v42);
      [v21 objectForKeyedSubscript:@"0"];
      v24 = id v38 = v18;
      [v22 setObject:v24 forKeyedSubscript:@"Version"];

      v25 = [v21 objectForKeyedSubscript:@"1"];
      ((void (**)(void, void *))v23)[2](v23, v25);
      uint64_t v26 = v40 = a6;
      [v22 setObject:v26 forKeyedSubscript:@"ReadNoise"];

      v27 = [v21 objectForKeyedSubscript:@"2"];
      v28 = ((void (**)(void, void *))v23)[2](v23, v27);
      [v22 setObject:v28 forKeyedSubscript:@"ShotNoise"];

      id v29 = [v21 objectForKeyedSubscript:@"3"];
      v30 = ((void (**)(void, void *))v23)[2](v23, v29);
      [v22 setObject:v30 forKeyedSubscript:@"SquaredNoise"];

      v31 = [v21 objectForKeyedSubscript:@"4"];
      v32 = ((void (**)(void, void *))v23)[2](v23, v31);
      [v22 setObject:v32 forKeyedSubscript:@"SpatialSigma"];

      v18 = v38;
      v33 = (void *)[v22 copy];
      [v12 setObject:v33 forKeyedSubscript:NUStyleTransferNodeNoiseModelKey];

      a6 = v40;
      self = v39;

      float v20 = v37;
    }
    else if (v21)
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
      }
      v35 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v45 = v21;
        _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Invalid noise model from makernote, ignored: %{public}@", buf, 0xCu);
      }
    }
  }
  v41.receiver = self;
  v41.super_class = (Class)NUStyleTransferApplyNode;
  v34 = [(NUStyleTransferNode *)&v41 resolvedNodeWithCachedInputs:v10 settings:v12 pipelineState:v11 error:a6];
LABEL_13:

  return v34;
}

id __86__NUStyleTransferApplyNode_resolvedNodeWithCachedInputs_settings_pipelineState_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = NSNumber;
    [v3 doubleValue];
    double v6 = v5;
    uint64_t v7 = [*(id *)(a1 + 32) scale];
    v9 = objc_msgSend(v4, "numberWithDouble:", v6 * NUScaleToDouble(v7, v8));
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(NUStyleTransferNode *)self inputNode];
  id v11 = [v10 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];

  if (!v11)
  {
    id v14 = 0;
    goto LABEL_22;
  }
  if ([v9 auxiliaryImageType] != 1)
  {
    id v15 = v11;
LABEL_11:
    id v14 = v15;
    goto LABEL_22;
  }
  if (![v9 evaluationMode])
  {
    v26.receiver = self;
    v26.super_class = (Class)NUStyleTransferApplyNode;
    id v15 = [(NUStyleTransferNode *)&v26 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];
    goto LABEL_11;
  }
  v12 = [(NUStyleTransferNode *)self targetNode];
  v13 = [v12 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];

  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v9 evaluationMode] == 2)
      {
        id v14 = v13;
      }
      else
      {
        id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v16 setObject:v11 forKeyedSubscript:@"input"];
        [v16 setObject:v13 forKeyedSubscript:@"target"];
        v17 = [(NUStyleTransferApplyNode *)self thumbnailNode];
        v18 = v17;
        if (v17)
        {
          id v19 = v17;
        }
        else
        {
          id v19 = [(NUStyleTransferNode *)self inputNode];
        }
        float v20 = v19;

        v21 = [NUStyleTransferThumbnailNode alloc];
        id v22 = [v13 settings];
        id v23 = [(NUStyleTransferThumbnailNode *)v21 initWithInput:v20 settings:v22];

        v24 = [(NUStyleTransferThumbnailNode *)v23 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];

        if (v24)
        {
          [v16 setObject:v24 forKeyedSubscript:@"thumbnail"];
          id v14 = [(NURenderNode *)self resolvedNodeWithCachedInputs:v16 cache:v8 pipelineState:v9 error:a5];
        }
        else
        {
          id v14 = 0;
        }
      }
    }
    else
    {
      +[NUError invalidError:@"Invalid style node" object:v13];
      id v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v14 = 0;
  }

LABEL_22:

  return v14;
}

- (id)configuration
{
  v2 = [(NUStyleTransferApplyNode *)self styleNode];
  id v3 = [v2 configuration];

  return v3;
}

- (id)tuningParameters
{
  v2 = [(NUStyleTransferApplyNode *)self styleNode];
  id v3 = [v2 tuningParameters];

  return v3;
}

- (id)targetColorSpace
{
  v2 = [(NUStyleTransferApplyNode *)self styleNode];
  id v3 = [v2 targetColorSpace];

  return v3;
}

- (id)thumbnailNode
{
  return [(NURenderNode *)self inputForKey:@"thumbnail"];
}

- (id)styleNode
{
  return [(NURenderNode *)self inputForKey:@"target"];
}

- (NUStyleTransferApplyNode)initWithInput:(id)a3 thumbnail:(id)a4 target:(id)a5 settings:(id)a6
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    id v19 = NUAssertLogger_27648();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      float v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      *(_DWORD *)buf = 138543362;
      v70 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v22 = NUAssertLogger_27648();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        id v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_super v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        id v43 = [v41 callStackSymbols];
        uint64_t v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v70 = v40;
        __int16 v71 = 2114;
        v72 = v44;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v70 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferApplyNode initWithInput:thumbnail:target:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1324, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"input != nil");
  }
  if (!v11)
  {
    objc_super v26 = NUAssertLogger_27648();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "thumbnail != nil");
      *(_DWORD *)buf = 138543362;
      v70 = v27;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v29 = NUAssertLogger_27648();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v50 = (void *)MEMORY[0x1E4F29060];
        id v51 = v49;
        v52 = [v50 callStackSymbols];
        v53 = [v52 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v70 = v49;
        __int16 v71 = 2114;
        v72 = v53;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v70 = v32;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferApplyNode initWithInput:thumbnail:target:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1325, @"Invalid parameter not satisfying: %s", v54, v55, v56, v57, (uint64_t)"thumbnail != nil");
  }
  if (!v12)
  {
    v33 = NUAssertLogger_27648();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "target != nil");
      *(_DWORD *)buf = 138543362;
      v70 = v34;
      _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v36 = NUAssertLogger_27648();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v35)
    {
      if (v37)
      {
        v58 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v59 = (void *)MEMORY[0x1E4F29060];
        id v60 = v58;
        v61 = [v59 callStackSymbols];
        v62 = [v61 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v70 = v58;
        __int16 v71 = 2114;
        v72 = v62;
        _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v37)
    {
      id v38 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v39 = [v38 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v70 = v39;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferApplyNode initWithInput:thumbnail:target:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1326, @"Invalid parameter not satisfying: %s", v63, v64, v65, v66, (uint64_t)"target != nil");
  }
  id v14 = v13;
  id v15 = (void *)[v13 mutableCopy];
  [v15 setObject:@"input" forKeyedSubscript:@"__dominantInputSettingsKey"];
  v67[0] = @"input";
  v67[1] = @"target";
  v68[0] = v10;
  v68[1] = v12;
  v67[2] = @"thumbnail";
  v68[2] = v11;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:3];
  v17 = [(NURenderNode *)self initWithSettings:v15 inputs:v16];

  return v17;
}

@end