@interface NUStyleTransferNode
+ (NSDictionary)defaultImageConfiguration;
+ (NSDictionary)defaultImageTuningParameters;
+ (NSDictionary)defaultVideoConfiguration;
+ (NSDictionary)defaultVideoTuningParameters;
+ (NSDictionary)semanticStyleImageConfiguration;
+ (NSDictionary)semanticStyleImageTuningParameters;
+ (NSDictionary)semanticStyleVideoConfiguration;
+ (NSDictionary)semanticStyleVideoTuningParameters;
+ (id)defaultImageSettingsForScale:(id)a3;
+ (id)defaultVideoSettingsForScale:(id)a3;
+ (id)semanticStyleImageSettingsForScale:(id)a3;
+ (id)semanticStyleVideoSettingsForScale:(id)a3;
+ (id)thumbnailScalePolicyForConfiguration:(id)a3;
- (BOOL)shouldCache;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NSDictionary)configuration;
- (NSDictionary)tuningParameters;
- (NUColorSpace)targetColorSpace;
- (NURenderNode)inputNode;
- (NURenderNode)targetNode;
- (NUStyleTransferNode)initWithInput:(id)a3 target:(id)a4 settings:(id)a5;
- (id)_evaluateImage:(id *)a3;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)noiseModel;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (id)thumbnailNode;
@end

@implementation NUStyleTransferNode

- (id)_evaluateImage:(id *)a3
{
  v5 = [(NUStyleTransferNode *)self inputNode];
  id v22 = 0;
  v6 = [v5 outputImage:&v22];
  id v7 = v22;

  if (v6)
  {
    v8 = [(NUStyleTransferNode *)self thumbnailNode];
    id v21 = 0;
    v9 = [v8 outputImage:&v21];
    id v10 = v21;

    if (v9)
    {
      v11 = [(NUStyleTransferNode *)self targetNode];
      id v20 = 0;
      v12 = [v11 outputImage:&v20];
      id v13 = v20;

      if (v12)
      {
        v14 = [(NUStyleTransferNode *)self configuration];
        v15 = (void *)[v14 mutableCopy];

        [v15 setObject:&unk_1F004A268 forKeyedSubscript:@"useFloat16"];
        v16 = [(NUStyleTransferNode *)self tuningParameters];
        v17 = [(NUStyleTransferNode *)self targetColorSpace];
        v18 = +[_NUStyleTransferProcessor applyStyleFromInputThumbnail:v9 targetThumbnail:v12 toImage:v6 colorSpace:v17 configuration:v15 tuningParameters:v16 error:a3];
      }
      else
      {
        v15 = [(NUStyleTransferNode *)self targetNode];
        +[NUError errorWithCode:1 reason:@"Failed to get input target thumbnail image" object:v15 underlyingError:v13];
        v18 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v12 = [(NUStyleTransferNode *)self thumbnailNode];
      +[NUError errorWithCode:1 reason:@"Failed to get input thumbnail image" object:v12 underlyingError:v10];
      v18 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      id v13 = v10;
    }
  }
  else
  {
    id v13 = v7;
    v18 = 0;
    *a3 = v13;
  }

  return v18;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v8.receiver = self;
  v8.super_class = (Class)NUStyleTransferNode;
  v6 = [(NURenderNode *)&v8 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];

  return v6;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return [a3 auxiliaryImageType] == 1;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 evaluationMode])
  {
    if ([v9 auxiliaryImageType] == 1 && objc_msgSend(v9, "evaluationMode") != 2)
    {
      id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
      v12 = [(NUStyleTransferNode *)self inputNode];
      id v13 = [v12 outputImageGeometry:a5];

      if (v13)
      {
        v14 = (void *)[v9 copy];
        v15 = [(NUStyleTransferNode *)self configuration];
        v16 = +[NUStyleTransferNode thumbnailScalePolicyForConfiguration:v15];

        uint64_t v17 = [v13 size];
        uint64_t v19 = objc_msgSend(v16, "scaleForImageSize:", v17, v18);
        objc_msgSend(v14, "setScale:", v19, v20);
        id v21 = [(NUStyleTransferNode *)self inputNode];
        id v22 = [v21 nodeByReplayingAgainstCache:v8 pipelineState:v14 error:a5];

        if (v22)
        {
          v29 = v16;
          [v10 setObject:v22 forKeyedSubscript:@"thumbnail"];
          v23 = [(NUStyleTransferNode *)self targetNode];
          v24 = [v23 nodeByReplayingAgainstCache:v8 pipelineState:v14 error:a5];

          if (v24)
          {
            [v10 setObject:v24 forKeyedSubscript:@"target"];
            [(NUStyleTransferNode *)self inputNode];
            v25 = v28 = v10;
            v26 = [v25 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];

            if (v26)
            {
              id v10 = v28;
              [v28 setObject:v26 forKeyedSubscript:@"input"];
              v11 = [(NURenderNode *)self resolvedNodeWithCachedInputs:v28 cache:v8 pipelineState:v9 error:a5];
            }
            else
            {
              v11 = 0;
              id v10 = v28;
            }
          }
          else
          {
            v11 = 0;
          }

          v16 = v29;
        }
        else
        {
          v11 = 0;
        }
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      id v10 = [(NUStyleTransferNode *)self targetNode];
      v11 = [v10 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];
    }
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)NUStyleTransferNode;
    v11 = [(NURenderNode *)&v30 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];
  }

  return v11;
}

- (id)thumbnailNode
{
  return [(NURenderNode *)self inputForKey:@"thumbnail"];
}

- (NURenderNode)targetNode
{
  return (NURenderNode *)[(NURenderNode *)self inputForKey:@"target"];
}

- (NURenderNode)inputNode
{
  return (NURenderNode *)[(NURenderNode *)self inputForKey:@"input"];
}

- (id)noiseModel
{
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:NUStyleTransferNodeNoiseModelKey];

  return v3;
}

- (BOOL)shouldCache
{
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:NUStyleTransferNodeShouldCacheKey];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (NSDictionary)configuration
{
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:NUStyleTransferNodeConfigurationKey];

  return (NSDictionary *)v3;
}

- (NSDictionary)tuningParameters
{
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:NUStyleTransferNodeTuningParametersKey];

  return (NSDictionary *)v3;
}

- (NUColorSpace)targetColorSpace
{
  v3 = +[NUColorSpace displayP3ColorSpace];
  char v4 = [(NURenderNode *)self settings];
  v5 = [v4 objectForKeyedSubscript:NUStyleTransferNodeTargetColorSpaceKey];

  if (v5)
  {
    if ([v5 isEqual:@"sRGB"])
    {
      uint64_t v6 = +[NUColorSpace sRGBColorSpace];
    }
    else if ([v5 isEqual:@"sRGBLinear"])
    {
      uint64_t v6 = +[NUColorSpace sRGBLinearColorSpace];
    }
    else
    {
      if (![v5 isEqual:@"displayP3Linear"]) {
        goto LABEL_9;
      }
      uint64_t v6 = +[NUColorSpace displayP3LinearColorSpace];
    }
    id v7 = (void *)v6;

    v3 = v7;
  }
LABEL_9:

  return (NUColorSpace *)v3;
}

- (NUStyleTransferNode)initWithInput:(id)a3 target:(id)a4 settings:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v16 = NUAssertLogger_27648();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      *(_DWORD *)buf = 138543362;
      v51 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v19 = NUAssertLogger_27648();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        objc_super v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        v33 = [v31 callStackSymbols];
        v34 = [v33 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v51 = v30;
        __int16 v52 = 2114;
        v53 = v34;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      id v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v51 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferNode initWithInput:target:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 357, @"Invalid parameter not satisfying: %s", v35, v36, v37, v38, (uint64_t)"input != nil");
  }
  if (!v9)
  {
    v23 = NUAssertLogger_27648();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "target != nil");
      *(_DWORD *)buf = 138543362;
      v51 = v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v26 = NUAssertLogger_27648();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v25)
    {
      if (v27)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = (void *)MEMORY[0x1E4F29060];
        id v41 = v39;
        v42 = [v40 callStackSymbols];
        v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v51 = v39;
        __int16 v52 = 2114;
        v53 = v43;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v51 = v29;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferNode initWithInput:target:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 358, @"Invalid parameter not satisfying: %s", v44, v45, v46, v47, (uint64_t)"target != nil");
  }
  v11 = v10;
  v12 = (void *)[v10 mutableCopy];
  [v12 setObject:@"input" forKeyedSubscript:@"__dominantInputSettingsKey"];
  v48[0] = @"input";
  v48[1] = @"target";
  v49[0] = v8;
  v49[1] = v9;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];
  v14 = [(NURenderNode *)self initWithSettings:v12 inputs:v13];

  return v14;
}

+ (id)thumbnailScalePolicyForConfiguration:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    v11 = NUAssertLogger_27648();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "config != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v14 = NUAssertLogger_27648();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        BOOL v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        objc_super v30 = [v28 callStackSymbols];
        v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v47 = v27;
        __int16 v48 = 2114;
        v49 = v31;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUStyleTransferNode thumbnailScalePolicyForConfiguration:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 346, @"Invalid parameter not satisfying: %s", v32, v33, v34, v35, (uint64_t)"config != nil");
  }
  char v4 = v3;
  v5 = [v3 objectForKeyedSubscript:@"thumbnailWidth"];
  uint64_t v6 = [v5 integerValue];

  id v7 = [v4 objectForKeyedSubscript:@"thumbnailHeight"];
  uint64_t v8 = [v7 integerValue];

  if ((v8 | v6) < 0)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v19 = objc_msgSend(NSString, "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
    uint64_t v45 = @"(width >= 0) && (height >= 0)";
    [v18 handleFailureInFunction:v19 file:@"NUGeometryPrimitives.h" lineNumber:38 description:@"Invalid parameter not satisfying: %@"];

    if (!v6)
    {
LABEL_14:
      BOOL v20 = NUAssertLogger_27648();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v21 = [NSString stringWithFormat:@"Invalid thumbnail size"];
        *(_DWORD *)buf = 138543362;
        uint64_t v47 = v21;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      id v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v23 = NUAssertLogger_27648();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
      if (v22)
      {
        if (v24)
        {
          uint64_t v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          uint64_t v37 = (void *)MEMORY[0x1E4F29060];
          id v38 = v36;
          v39 = [v37 callStackSymbols];
          v40 = [v39 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          uint64_t v47 = v36;
          __int16 v48 = 2114;
          v49 = v40;
          _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v24)
      {
        v25 = [MEMORY[0x1E4F29060] callStackSymbols];
        v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        uint64_t v47 = v26;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"+[NUStyleTransferNode thumbnailScalePolicyForConfiguration:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 351, @"Invalid thumbnail size", v41, v42, v43, v44, (uint64_t)v45);
    }
  }
  else if (!v6)
  {
    goto LABEL_14;
  }
  if (!v8) {
    goto LABEL_14;
  }
  id v9 = -[NUFitScalePolicy initWithTargetPixelSize:]([NUFitScalePolicy alloc], "initWithTargetPixelSize:", v6, v8);

  return v9;
}

+ (NSDictionary)semanticStyleImageTuningParameters
{
  return (NSDictionary *)[MEMORY[0x1E4F55F18] tuningParametersForUseCase:0];
}

+ (NSDictionary)semanticStyleImageConfiguration
{
  v2 = [MEMORY[0x1E4F55F18] configurationForUseCase:0];
  objc_msgSend(v2, "setApplySyntheticNoise:", +[NUGlobalSettings semanticStyleForceSyntheticNoise](NUGlobalSettings, "semanticStyleForceSyntheticNoise"));
  id v3 = [[_NUStyleEngineConfiguration alloc] initWithStyleEngineConfiguration:v2];
  [(_NUStyleEngineConfiguration *)v3 setUsage:@"semstyle-image"];
  char v4 = [(_NUStyleEngineConfiguration *)v3 configurationDictionary];

  return (NSDictionary *)v4;
}

+ (NSDictionary)semanticStyleVideoTuningParameters
{
  return (NSDictionary *)[MEMORY[0x1E4F55F18] tuningParametersForUseCase:1];
}

+ (NSDictionary)semanticStyleVideoConfiguration
{
  v2 = [MEMORY[0x1E4F55F18] configurationForUseCase:1];
  id v3 = [[_NUStyleEngineConfiguration alloc] initWithStyleEngineConfiguration:v2];
  [(_NUStyleEngineConfiguration *)v3 setUsage:@"semstyle-video"];
  char v4 = [(_NUStyleEngineConfiguration *)v3 configurationDictionary];

  return (NSDictionary *)v4;
}

+ (NSDictionary)defaultVideoTuningParameters
{
  return (NSDictionary *)&unk_1F004A3E8;
}

+ (NSDictionary)defaultVideoConfiguration
{
  return (NSDictionary *)&unk_1F004A3C0;
}

+ (NSDictionary)defaultImageTuningParameters
{
  return (NSDictionary *)&unk_1F004A398;
}

+ (NSDictionary)defaultImageConfiguration
{
  return (NSDictionary *)&unk_1F004A370;
}

+ (id)semanticStyleImageSettingsForScale:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  v21[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a1 semanticStyleImageConfiguration];
  id v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = [a1 semanticStyleImageTuningParameters];
  id v9 = (void *)[v8 mutableCopy];

  if (+[NUGlobalSettings semanticStyleUseDynamicConfig])
  {
    if (NUScaleCompare(var0, var1, 2, 3) < 0)
    {
      id v10 = &unk_1F004A130;
      if (NUScaleCompare(var0, var1, 1, 3) < 0)
      {
        uint64_t v15 = NUScaleCompare(var0, var1, 1, 6);
        if (v15 < 0) {
          v14 = @"semstyle-image@1:8";
        }
        else {
          v14 = @"semstyle-image@1:4";
        }
        if (v15 < 0) {
          v12 = &unk_1F004A178;
        }
        else {
          v12 = &unk_1F004A130;
        }
        if (v15 < 0) {
          v11 = &unk_1F004A190;
        }
        else {
          v11 = &unk_1F004A160;
        }
        if (v15 < 0) {
          id v10 = &unk_1F004A178;
        }
        else {
          id v10 = &unk_1F004A160;
        }
        id v13 = &unk_1F004A148;
      }
      else
      {
        v11 = &unk_1F004A118;
        v12 = &unk_1F004A100;
        id v13 = &unk_1F004A148;
        v14 = @"semstyle-image@1:2";
      }
    }
    else
    {
      id v10 = &unk_1F004A130;
      v11 = &unk_1F004A118;
      v12 = &unk_1F004A100;
      id v13 = &unk_1F004A0E8;
      v14 = @"semstyle-image@1:1";
    }
    [v7 setObject:v14 forKeyedSubscript:@"usage"];
    [v7 setObject:v13 forKeyedSubscript:@"linearSystemOrder"];
    [v7 setObject:v12 forKeyedSubscript:@"spotlightCountX"];
    [v7 setObject:v11 forKeyedSubscript:@"spotlightCountY"];
    [v7 setObject:v10 forKeyedSubscript:@"weightPlaneCount"];
  }
  if (+[NUGlobalSettings semanticStyleUseFasterSystemOrder])
  {
    [v7 setObject:&unk_1F004A1A8 forKeyedSubscript:@"linearSystemOrder"];
  }
  if (+[NUGlobalSettings semanticStyleForceResiduals]) {
    [v9 setObject:&unk_1F004A6D8 forKeyedSubscript:@"ResidualScaleFactor"];
  }
  [v9 setObject:0 forKeyedSubscript:@"SpotlightCount_X"];
  [v9 setObject:0 forKeyedSubscript:@"SpotlightCount_Y"];
  [v9 setObject:0 forKeyedSubscript:@"WeightPlaneCount"];
  v20[0] = NUStyleTransferNodeConfigurationKey;
  v16 = (void *)[v7 copy];
  v20[1] = NUStyleTransferNodeTuningParametersKey;
  v21[0] = v16;
  uint64_t v17 = (void *)[v9 copy];
  v21[1] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

  return v18;
}

+ (id)semanticStyleVideoSettingsForScale:(id)a3
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = NUStyleTransferNodeConfigurationKey;
  char v4 = objc_msgSend(a1, "semanticStyleVideoConfiguration", a3.var0, a3.var1);
  v9[0] = v4;
  v8[1] = NUStyleTransferNodeTuningParametersKey;
  v5 = [a1 semanticStyleVideoTuningParameters];
  v8[2] = NUStyleTransferNodeShouldCacheKey;
  v9[1] = v5;
  v9[2] = MEMORY[0x1E4F1CC38];
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

+ (id)defaultImageSettingsForScale:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = NUStyleTransferNodeConfigurationKey;
  char v4 = objc_msgSend(a1, "defaultImageConfiguration", a3.var0, a3.var1);
  v8[1] = NUStyleTransferNodeTuningParametersKey;
  v9[0] = v4;
  v5 = [a1 defaultImageTuningParameters];
  v9[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

+ (id)defaultVideoSettingsForScale:(id)a3
{
  void v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = NUStyleTransferNodeConfigurationKey;
  char v4 = objc_msgSend(a1, "defaultVideoConfiguration", a3.var0, a3.var1);
  v9[0] = v4;
  v8[1] = NUStyleTransferNodeTuningParametersKey;
  v5 = [a1 defaultVideoTuningParameters];
  void v8[2] = NUStyleTransferNodeShouldCacheKey;
  v9[1] = v5;
  v9[2] = MEMORY[0x1E4F1CC38];
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

@end