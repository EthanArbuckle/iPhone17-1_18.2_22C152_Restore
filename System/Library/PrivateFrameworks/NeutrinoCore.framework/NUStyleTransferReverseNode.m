@interface NUStyleTransferReverseNode
+ (id)_reverseImageConfiguration_0_1;
+ (id)_reverseImageTuningParameters_0_1;
+ (id)_reverseVideoConfiguration_0_1;
+ (id)_reverseVideoConfiguration_0_10;
+ (id)_reverseVideoTuningParameters_0_1;
+ (id)_reverseVideoTuningParameters_0_10;
+ (id)reverseSettingsForSemanticStyleProperties:(id)a3;
- (BOOL)requiresVideoComposition;
- (NUStyleTransferReverseNode)initWithInput:(id)a3 settings:(id)a4;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateVideo:(id *)a3;
- (id)_evaluateVideoComposition:(id *)a3;
- (id)deltaNode;
- (id)inputNode;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (id)styleData;
- (id)thumbnailNode;
@end

@implementation NUStyleTransferReverseNode

- (id)_evaluateVideoComposition:(id *)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v31 = NUAssertLogger_27648();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v49 = v32;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v34 = NUAssertLogger_27648();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v35)
      {
        v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        v41 = [v39 callStackSymbols];
        v42 = [v41 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v49 = v38;
        __int16 v50 = 2114;
        v51 = v42;
        _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v35)
    {
      v36 = [MEMORY[0x1E4F29060] callStackSymbols];
      v37 = [v36 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v49 = v37;
      _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferReverseNode _evaluateVideoComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 905, @"Invalid parameter not satisfying: %s", v43, v44, v45, v46, (uint64_t)"error != NULL");
  }
  v5 = [(NURenderNode *)self outputVideo:"outputVideo:"];
  if (!v5)
  {
    v21 = 0;
    goto LABEL_21;
  }
  v6 = [(NUStyleTransferReverseNode *)self inputNode];
  v7 = [v6 outputVideoComposition:a3];

  if (v7)
  {
    v8 = [v7 instructions];
    uint64_t v9 = [v8 count];

    if (v9 == 1)
    {
      v10 = [(NUStyleTransferReverseNode *)self inputNode];
      v11 = [v10 videoProperties:a3];

      if (v11)
      {
        v12 = [v7 instructions];
        v13 = [v12 firstObject];

        v14 = (void *)[v13 copy];
        v15 = [v11 auxiliaryVideoTrackProperties];
        v16 = [v15 objectForKeyedSubscript:@"DeltaImage"];

        if (v16)
        {
          v17 = [v14 requiredSourceTrackIDs];
          v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v16, "trackID"));
          v19 = [v17 arrayByAddingObject:v18];
          [v14 setRequiredSourceTrackIDs:v19];

          v20 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v16, "trackID"));
          [v14 setSourceIdentifier:@"DeltaImage" forTrackID:v20];
        }
        else
        {
          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
          }
          v23 = _NULogger;
          if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Missing delta video track properties, omitting from video composition", buf, 2u);
          }
        }
        v24 = +[NUVideoUtilities metadataTrackWithIdenfifier:kMetadataIdentifier_SmartStyleInfo forAsset:v5];
        v25 = v24;
        if (v24)
        {
          uint64_t v26 = NUSourceIdentifierSmartStyleVideoMetadata;
          v27 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v24, "trackID"));
          [v14 setSourceIdentifier:v26 forMetadataTrackID:v27];
        }
        v21 = (void *)[v7 mutableCopy];
        v47 = v14;
        v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
        [v21 setInstructions:v28];

        v29 = [v14 requiredSourceSampleDataTrackIDs];
        [v21 setSourceSampleDataTrackIDs:v29];
      }
      else
      {
        v21 = 0;
      }

      goto LABEL_20;
    }
    v22 = [v7 instructions];
    *a3 = +[NUError unsupportedError:@"Unsupported video configuration" object:v22];
  }
  v21 = 0;
LABEL_20:

LABEL_21:

  return v21;
}

- (id)_evaluateVideo:(id *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NUStyleTransferReverseNode;
  v3 = [(NURenderNode *)&v5 _evaluateVideo:a3];

  return v3;
}

- (BOOL)requiresVideoComposition
{
  return 1;
}

- (id)thumbnailNode
{
  return [(NURenderNode *)self inputForKey:@"thumbnail"];
}

- (id)deltaNode
{
  return [(NURenderNode *)self inputForKey:@"delta"];
}

- (id)inputNode
{
  return [(NURenderNode *)self inputForKey:@"input"];
}

- (id)styleData
{
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:@"styleData"];

  return v3;
}

- (NUStyleTransferReverseNode)initWithInput:(id)a3 settings:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v13 = NUAssertLogger_27648();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      *(_DWORD *)buf = 138543362;
      v33 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v16 = NUAssertLogger_27648();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        v23 = [v21 callStackSymbols];
        v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v33 = v20;
        __int16 v34 = 2114;
        BOOL v35 = v24;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v33 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferReverseNode initWithInput:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 860, @"Invalid parameter not satisfying: %s", v25, v26, v27, v28, (uint64_t)"input != nil");
  }
  v8 = v7;
  uint64_t v9 = (void *)[v7 mutableCopy];
  [v9 setObject:@"input" forKeyedSubscript:@"__dominantInputSettingsKey"];
  v30 = @"input";
  id v31 = v6;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  v29.receiver = self;
  v29.super_class = (Class)NUStyleTransferReverseNode;
  v11 = [(NURenderNode *)&v29 initWithSettings:v9 inputs:v10];

  return v11;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v8.receiver = self;
  v8.super_class = (Class)NUStyleTransferReverseNode;
  id v6 = [(NUStyleTransferNode *)&v8 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];

  return v6;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  v78[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (![v9 evaluationMode])
  {
    v75.receiver = self;
    v75.super_class = (Class)NUStyleTransferReverseNode;
    id v13 = [(NUStyleTransferNode *)&v75 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];
    goto LABEL_45;
  }
  v10 = [(NUStyleTransferReverseNode *)self inputNode];
  v11 = [v10 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];

  if (!v11)
  {
    id v13 = 0;
    goto LABEL_44;
  }
  if ([v9 auxiliaryImageType] != 1)
  {
    id v13 = v11;
    goto LABEL_44;
  }
  if ([v9 evaluationMode] != 2)
  {
    unint64_t v14 = 0x1E4F1C000uLL;
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    [v15 setObject:v11 forKeyedSubscript:@"input"];
    v16 = (void *)[v9 copy];
    [v16 setAuxiliaryImageType:11];
    [v16 setSampleMode:2];
    BOOL v17 = [(NUStyleTransferReverseNode *)self inputNode];
    v18 = [v17 nodeByReplayingAgainstCache:v8 pipelineState:v16 error:a5];

    if (v18) {
      goto LABEL_20;
    }
    if (v9)
    {
      [v9 time];
      if ((v73 & 0x100000000) != 0)
      {
        v19 = NULogger_28099();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          [v9 time];
          v65 = NUStringFromTime(&v71);
          id v20 = *a5;
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v65;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v20;
          _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Failed to obtain delta at time %{public}@, ignoring. Error: %{public}@", buf, 0x16u);
        }
LABEL_19:

        v18 = 0;
LABEL_20:
        [v15 setObject:v18 forKeyedSubscript:@"delta"];
        v21 = [v11 outputImageGeometry:a5];
        if (!v21)
        {
          id v13 = 0;
LABEL_43:

          goto LABEL_44;
        }
        v66 = v21;
        v67 = v16;
        if ([v9 evaluationMode] == 3)
        {
          id v22 = [v9 videoMetadataSamples];
          v23 = [v22 objectForKeyedSubscript:NUSourceIdentifierSmartStyleVideoMetadata];

          v24 = [v23 metadataGroup];

          if (!v24)
          {
            id v40 = NULogger_28099();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              v41 = v18;
              if (v9) {
                [v9 time];
              }
              else {
                memset(&v70, 0, sizeof(v70));
              }
              v42 = NUStringFromTime(&v70);
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v42;
              _os_log_impl(&dword_1A9892000, v40, OS_LOG_TYPE_INFO, "Failed to obtain metadata sample from pipeline state at time %{public}@, ignoring", buf, 0xCu);

              v18 = v41;
            }

            id v13 = v11;
            id v27 = 0;
            goto LABEL_42;
          }
          v61 = v18;
          uint64_t v25 = [v23 metadataGroup];
          id v69 = 0;
          *(_OWORD *)buf = *MEMORY[0x1E4F1F9F8];
          *(void *)&buf[16] = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
          uint64_t v26 = +[NUVideoUtilities semanticStylePropertiesFromMetadataGroup:v25 keyTime:buf error:&v69];
          id v27 = v69;

          if (v26)
          {
            v63 = v15;
            id v64 = v27;
            uint64_t v28 = v23;
            v23 = (void *)v26;
            unint64_t v14 = 0x1E4F1C000;
LABEL_30:

            id v31 = +[NUStyleTransferReverseNode reverseSettingsForSemanticStyleProperties:v23];
            id v32 = objc_alloc_init(*(Class *)(v14 + 2656));
            v33 = [v31 objectForKeyedSubscript:NUStyleTransferNodeConfigurationKey];
            [v32 setObject:v33 forKeyedSubscript:NUStyleTransferNodeConfigurationKey];

            __int16 v34 = [v31 objectForKeyedSubscript:NUStyleTransferNodeTuningParametersKey];
            [v32 setObject:v34 forKeyedSubscript:NUStyleTransferNodeTuningParametersKey];

            v62 = v31;
            BOOL v35 = [v31 objectForKeyedSubscript:@"useFloat16"];
            [v32 setObject:v35 forKeyedSubscript:@"useFloat16"];

            uint64_t v36 = [[NUStyleTransferThumbnailNode alloc] initWithInput:v11 settings:v32];
            v37 = [(NURenderNode *)v36 inputs];
            v38 = [(NURenderNode *)v36 resolvedNodeWithCachedInputs:v37 cache:v8 pipelineState:v9 error:a5];

            if (v38)
            {
              [v63 setObject:v38 forKeyedSubscript:@"thumbnail"];
              v39 = [(NUStyleTransferReverseNode *)self resolvedNodeWithCachedInputs:v63 settings:v62 pipelineState:v9 error:a5];
              id v13 = +[NURenderNode nodeFromCache:v39 cache:v8];

              objc_msgSend(v13, "setEvaluatedForMode:", objc_msgSend(v9, "evaluationMode"));
            }
            else
            {
              id v13 = 0;
            }
            v18 = v61;

            v15 = v63;
            id v27 = v64;
            goto LABEL_42;
          }
          +[NUError errorWithCode:1 reason:@"Failed to obtain semantic style properties from metadata sample" object:v23 underlyingError:v27];
          id v13 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          v18 = v61;
        }
        else
        {
          if ([v9 evaluationMode] != 1)
          {
            uint64_t v45 = NUAssertLogger_27648();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              uint64_t v46 = [NSString stringWithFormat:@"Unsupported pipelineState evaluation mode: %@", v9];
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v46;
              _os_log_error_impl(&dword_1A9892000, v45, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
            }
            specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v48 = NUAssertLogger_27648();
            BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_ERROR);
            if (specific)
            {
              if (v49)
              {
                uint64_t v52 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
                v53 = (void *)MEMORY[0x1E4F29060];
                id v54 = v52;
                v55 = [v53 callStackSymbols];
                v56 = [v55 componentsJoinedByString:@"\n"];
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v52;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v56;
                _os_log_error_impl(&dword_1A9892000, v48, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
              }
            }
            else if (v49)
            {
              __int16 v50 = [MEMORY[0x1E4F29060] callStackSymbols];
              v51 = [v50 componentsJoinedByString:@"\n"];
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v51;
              _os_log_error_impl(&dword_1A9892000, v48, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
            }
            _NUAssertFailHandler((uint64_t)"-[NUStyleTransferReverseNode nodeByReplayingAgainstCache:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 816, @"Unsupported pipelineState evaluation mode: %@", v57, v58, v59, v60, (uint64_t)v9);
          }
          id v68 = 0;
          v23 = [v11 imageProperties:&v68];
          id v64 = v68;
          if (v23)
          {
            objc_super v29 = [v23 semanticStyleProperties];

            if (v29)
            {
              v61 = v18;
              v63 = v15;
              uint64_t v30 = [v23 semanticStyleProperties];
              uint64_t v28 = v23;
              v23 = (void *)v30;
              goto LABEL_30;
            }
          }
          id v27 = v64;
          +[NUError errorWithCode:1 reason:@"Failed to obtain semantic style properties from image properties" object:v23 underlyingError:v64];
          id v13 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_42:

        v21 = v66;
        v16 = v67;
        goto LABEL_43;
      }
    }
    else
    {
      uint64_t v72 = 0;
      uint64_t v73 = 0;
      uint64_t v74 = 0;
    }
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
    }
    v19 = (id)_NULogger;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v44 = *a5;
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v44;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Failed to obtain delta, ignoring. Error: %{public}@", buf, 0xCu);
    }
    goto LABEL_19;
  }
  v77 = @"input";
  v78[0] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:&v77 count:1];
  id v13 = [(NURenderNode *)self resolvedNodeWithCachedInputs:v12 cache:v8 pipelineState:v9 error:a5];

LABEL_44:
LABEL_45:

  return v13;
}

- (id)_evaluateImage:(id *)a3
{
  v50[2] = *MEMORY[0x1E4F143B8];
  objc_super v5 = [(NUStyleTransferReverseNode *)self inputNode];
  id v6 = [v5 outputImage:a3];

  if (v6)
  {
    id v7 = [(NUStyleTransferReverseNode *)self thumbnailNode];
    id v8 = [v7 outputImage:a3];

    if (v8)
    {
      id v9 = [(NUStyleTransferReverseNode *)self deltaNode];
      v10 = [v9 outputImage:a3];

      if (!v10)
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_828);
        }
        v11 = _NULogger;
        if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Missing delta frame - ignoring", buf, 2u);
        }
      }
      [v10 extent];
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      [v6 extent];
      v53.origin.x = v20;
      v53.origin.y = v21;
      v53.size.width = v22;
      v53.size.height = v23;
      v52.origin.x = v13;
      v52.origin.y = v15;
      v52.size.width = v17;
      v52.size.height = v19;
      if (!CGRectEqualToRect(v52, v53))
      {
        v24 = [v10 imageByClampingToExtent];
        [v6 extent];
        uint64_t v25 = objc_msgSend(v24, "imageByCroppingToRect:");

        v10 = (void *)v25;
      }
      uint64_t v47 = [(NUStyleTransferNode *)self tuningParameters];
      uint64_t v26 = [(NUStyleTransferReverseNode *)self styleData];
      id v27 = [(NURenderNode *)self settings];
      uint64_t v28 = [v27 objectForKeyedSubscript:@"useFloat16"];
      uint64_t v29 = [v28 BOOLValue];

      uint64_t v30 = [(NUStyleTransferNode *)self configuration];
      id v31 = (void *)[v30 mutableCopy];

      id v32 = [NSNumber numberWithBool:v29];
      [v31 setObject:v32 forKeyedSubscript:@"useFloat16"];

      +[_NUStyleEngineConfiguration coefficientTextureSizeForConfigurationDictionary:v31];
      double v35 = v33;
      double v36 = v34;
      char v37 = 1;
      if (!v29) {
        char v37 = 2;
      }
      unint64_t v38 = (unint64_t)v33 << v37;
      unint64_t v39 = v38 * (unint64_t)v34;
      if ([v26 length] == v39)
      {
        id v40 = (unsigned int *)MEMORY[0x1E4F1E318];
        if (!v29) {
          id v40 = (unsigned int *)MEMORY[0x1E4F1E310];
        }
        v41 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v26, v38, *v40, 0, v35, v36);
        if (+[NUGlobalSettings semanticStyleDisableDeltaMap])
        {

          v10 = 0;
        }
        v42 = (void *)v47;
        uint64_t v43 = [(NUStyleTransferNode *)self targetColorSpace];
        id v44 = +[_NUStyleTransferApplyProcessor applyStyle:v41 toImage:v6 thumbnail:v8 target:0 deltaMap:v10 colorSpace:v43 configuration:v31 tuningParameters:v47 noiseModel:0 error:a3];
      }
      else
      {
        v49[0] = @"expected";
        v41 = [NSNumber numberWithUnsignedLong:v39];
        v49[1] = @"actual";
        v50[0] = v41;
        uint64_t v43 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v26, "length"));
        v50[1] = v43;
        uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];
        *a3 = +[NUError invalidError:@"Unexpected style data length" object:v45];

        id v44 = 0;
        v42 = (void *)v47;
      }
    }
    else
    {
      id v44 = 0;
    }
  }
  else
  {
    id v44 = 0;
  }

  return v44;
}

+ (id)_reverseImageTuningParameters_0_1
{
  return &unk_1F004A4D8;
}

+ (id)_reverseImageConfiguration_0_1
{
  return &unk_1F004A4B0;
}

+ (id)_reverseVideoConfiguration_0_10
{
  return &unk_1F004A488;
}

+ (id)_reverseVideoTuningParameters_0_10
{
  return &unk_1F004A460;
}

+ (id)_reverseVideoTuningParameters_0_1
{
  return &unk_1F004A438;
}

+ (id)_reverseVideoConfiguration_0_1
{
  return &unk_1F004A410;
}

+ (id)reverseSettingsForSemanticStyleProperties:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([v4 isVideo])
  {
    id v6 = [v4 version];
    if (![v6 atLeastMajor:0 minor:10])
    {
      id v9 = [v4 styleData];
      [v9 length];
    }
    id v7 = objc_msgSend(a1, "_reverseVideoConfiguration_0");
    uint64_t v8 = objc_msgSend(a1, "_reverseVideoTuningParameters_0");
  }
  else
  {
    id v7 = objc_msgSend(a1, "_reverseImageConfiguration_0");
    uint64_t v8 = objc_msgSend(a1, "_reverseImageTuningParameters_0");
  }
  v10 = (void *)v8;
  v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "styleDataIsFloat16"));
  [v5 setObject:v11 forKeyedSubscript:@"useFloat16"];

  double v12 = [v4 styleData];
  [v5 setObject:v12 forKeyedSubscript:@"styleData"];

  [v5 setObject:v7 forKeyedSubscript:NUStyleTransferNodeConfigurationKey];
  [v5 setObject:v10 forKeyedSubscript:NUStyleTransferNodeTuningParametersKey];

  return v5;
}

@end