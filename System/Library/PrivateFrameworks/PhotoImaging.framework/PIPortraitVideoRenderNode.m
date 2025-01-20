@interface PIPortraitVideoRenderNode
- ($0AC6E346AE4835514AAA8AC86D8F4844)_targetScaleForScale:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)renderTime;
- (BOOL)_prewarmPortraitRendererWithPipelineState:(id)a3 error:(id *)a4;
- (BOOL)requiresVideoComposition;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (BOOL)useSourceBuffersDirectly;
- (NSArray)apertureKeyframes;
- (NSArray)disparityKeyframes;
- (PIPortraitVideoMetadataSample)timedMetadata;
- (PIPortraitVideoRenderNode)initWithInput:(id)a3 disparityInput:(id)a4 disparityKeyframes:(id)a5 apertureKeyframes:(id)a6 debugMode:(int64_t)a7;
- (PTGlobalRenderingMetadata)globalMetadata;
- (__CVBuffer)_sourceBufferFromInput:(id)a3 error:(id *)a4;
- (id)_evaluateImage:(id *)a3;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (id)sourceTransferFunction;
- (id)uniqueInputNode;
- (int)_portraitQualityForRenderScale:(id)a3;
- (int)renderQuality;
- (int64_t)debugMode;
@end

@implementation PIPortraitVideoRenderNode

- (id)_evaluateImage:(id *)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v37 = NUAssertLogger_3385();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v38;
      _os_log_error_impl(&dword_1A9680000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v39 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v41 = NUAssertLogger_3385();
    BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v42)
      {
        v45 = dispatch_get_specific(*v39);
        v46 = (void *)MEMORY[0x1E4F29060];
        id v47 = v45;
        v48 = [v46 callStackSymbols];
        v49 = [v48 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v49;
        _os_log_error_impl(&dword_1A9680000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v42)
    {
      v43 = [MEMORY[0x1E4F29060] callStackSymbols];
      v44 = [v43 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v44;
      _os_log_error_impl(&dword_1A9680000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
  id v58 = 0;
  v6 = [v5 outputImage:&v58];
  id v7 = v58;
  if (!v6)
  {
    [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Could not get the input image" object:self underlyingError:v7];
    id v17 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = v7;
    goto LABEL_40;
  }
  v8 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E468]];
  id v57 = 0;
  v9 = [v8 outputImage:&v57];
  id v10 = v57;

  if (v9)
  {
    v11 = [(PIPortraitVideoRenderNode *)self globalMetadata];
    v12 = [(PIPortraitVideoRenderNode *)self timedMetadata];
    if (!v12)
    {
      [MEMORY[0x1E4F7A438] missingError:@"Could not get the timed metadata" object:self];
      id v17 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:

      goto LABEL_39;
    }
    v13 = [(PIPortraitVideoRenderNode *)self sourceTransferFunction];
    v14 = v13;
    if (!v13)
    {
      v15 = (void *)MEMORY[0x1E4F7A438];
      v16 = @"Could not get the source transfer function";
      goto LABEL_12;
    }
    unsigned int v51 = [v13 isEqualToString:*MEMORY[0x1E4F162E8]];
    memset(buf, 0, sizeof(buf));
    [(PIPortraitVideoRenderNode *)self renderTime];
    if ((buf[12] & 1) == 0)
    {
      v15 = (void *)MEMORY[0x1E4F7A438];
      v16 = @"Could not get the render time";
LABEL_12:
      [v15 missingError:v16 object:self];
      id v17 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:

      goto LABEL_38;
    }
    v53 = v11;
    v18 = [(PIPortraitVideoRenderNode *)self disparityKeyframes];

    v54 = v14;
    if (v18)
    {
      v19 = [(PIPortraitVideoRenderNode *)self disparityKeyframes];
      long long v55 = *(_OWORD *)buf;
      uint64_t v56 = *(void *)&buf[16];
      v20 = +[PIScalarKeyframe keyframeInArray:v19 closestToTime:&v55];

      if (v20) {
        double v21 = v20[1];
      }
      else {
        double v21 = 0.0;
      }
      v52 = [NSNumber numberWithDouble:v21];

      v14 = v54;
    }
    else
    {
      v52 = 0;
    }
    v22 = [(PIPortraitVideoRenderNode *)self apertureKeyframes];

    if (v22)
    {
      v23 = [(PIPortraitVideoRenderNode *)self apertureKeyframes];
      long long v55 = *(_OWORD *)buf;
      uint64_t v56 = *(void *)&buf[16];
      v24 = +[PIScalarKeyframe keyframeInArray:v23 closestToTime:&v55];

      if (v24) {
        double v25 = v24[1];
      }
      else {
        double v25 = 0.0;
      }
      v50 = [NSNumber numberWithDouble:v25];

      v14 = v54;
    }
    else
    {
      v50 = 0;
    }
    if ([(PIPortraitVideoRenderNode *)self debugMode] == 1)
    {
      id v17 = [v9 imageByCompositingOverImage:v6];
LABEL_36:
      v11 = v53;

      goto LABEL_37;
    }
    v26 = objc_alloc_init(PIPortraitVideoFilter);
    [(PIPortraitVideoFilter *)v26 setInputGlobalRenderingMetadata:v53];
    [(PIPortraitVideoFilter *)v26 setInputTimedRenderingMetadata:v12];
    [(PIPortraitVideoFilter *)v26 setInputImage:v6];
    [(PIPortraitVideoFilter *)v26 setInputDisparityImage:v9];
    [(PIPortraitVideoFilter *)v26 setInputAperture:v50];
    [(PIPortraitVideoFilter *)v26 setInputFocusedDisparity:v52];
    v27 = objc_msgSend(NSNumber, "numberWithInt:", -[PIPortraitVideoRenderNode renderQuality](self, "renderQuality"));
    [(PIPortraitVideoFilter *)v26 setInputRenderQuality:v27];

    v28 = NSNumber;
    int64_t v29 = [(PIPortraitVideoRenderNode *)self debugMode];
    if ((unint64_t)(v29 - 2) >= 4) {
      int64_t v30 = 0;
    }
    else {
      int64_t v30 = v29 - 1;
    }
    v31 = [v28 numberWithInteger:v30];
    [(PIPortraitVideoFilter *)v26 setInputRenderDebugMode:v31];

    v14 = v54;
    [(PIPortraitVideoFilter *)v26 setInputIsHDR:v51];
    if ([(PIPortraitVideoRenderNode *)self useSourceBuffersDirectly])
    {
      [(PIPortraitVideoFilter *)v26 setInputImage:0];
      [(PIPortraitVideoFilter *)v26 setInputDisparityImage:0];
      v32 = [(PIPortraitVideoRenderNode *)self _sourceBufferFromInput:v5 error:a3];
      if (!v32)
      {
        id v17 = 0;
        goto LABEL_35;
      }
      v33 = (void *)[objc_alloc(MEMORY[0x1E4F7A3D8]) initWithCVPixelBuffer:v32];
      [(PIPortraitVideoFilter *)v26 setInputColorPixelBuffer:v33];

      v34 = [(PIPortraitVideoRenderNode *)self _sourceBufferFromInput:v8 error:a3];
      if (!v34)
      {
        id v17 = 0;
        v14 = v54;
        goto LABEL_35;
      }
      v35 = (void *)[objc_alloc(MEMORY[0x1E4F7A3D8]) initWithCVPixelBuffer:v34];
      [(PIPortraitVideoFilter *)v26 setInputDisparityPixelBuffer:v35];

      v14 = v54;
    }
    id v17 = [(PIPortraitVideoFilter *)v26 outputImage];
LABEL_35:

    goto LABEL_36;
  }
  *a3 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Could not get the disparityImage" object:self underlyingError:v10];
  id v17 = v6;
LABEL_39:

LABEL_40:
  return v17;
}

- (__CVBuffer)_sourceBufferFromInput:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F1E480];
  id v7 = [v5 inputForKey:*MEMORY[0x1E4F1E480]];

  if (v7)
  {
    do
    {
      v8 = [v5 inputForKey:v6];

      v9 = [v8 inputForKey:v6];

      id v5 = v8;
    }
    while (v9);
  }
  else
  {
    v8 = v5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = (__CVBuffer *)[v8 pixelBuffer];
  }
  else
  {
    [MEMORY[0x1E4F7A438] missingError:@"Source image isn't backed by a CVPixelBuffer" object:v8];
    id v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (BOOL)requiresVideoComposition
{
  return 1;
}

- (int)_portraitQualityForRenderScale:(id)a3
{
  if (NUScaleCompare() < 1) {
    return 24;
  }
  NUScaleMake();
  if (NUScaleCompare() >= 1) {
    return 75;
  }
  else {
    return 26;
  }
}

- (BOOL)useSourceBuffersDirectly
{
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:@"useSourceBuffersDirectly"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)sourceTransferFunction
{
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:@"sourceTransferFunction"];

  return v3;
}

- (PIPortraitVideoMetadataSample)timedMetadata
{
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:@"timedMetadata"];

  return (PIPortraitVideoMetadataSample *)v3;
}

- (PTGlobalRenderingMetadata)globalMetadata
{
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:@"globalMetadata"];

  return (PTGlobalRenderingMetadata *)v3;
}

- (int)renderQuality
{
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:@"renderQuality"];

  if (v3) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)renderTime
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  int v4 = [(NURenderNode *)self settings];
  CFDictionaryRef v5 = [v4 objectForKeyedSubscript:@"renderTime"];

  if (v5)
  {
    CMTimeMakeFromDictionary(&v7, v5);
    *(CMTime *)retstr = v7;
  }

  return result;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  v11 = (const void **)a3;
  id v12 = a4;
  id v13 = a5;
  if (!a6)
  {
    v53 = NUAssertLogger_3385();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      v54 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v74 = v54;
      _os_log_error_impl(&dword_1A9680000, v53, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v11 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    long long v55 = NUAssertLogger_3385();
    BOOL v56 = os_log_type_enabled(v55, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v56)
      {
        specific = dispatch_get_specific(*v11);
        id v57 = (void *)MEMORY[0x1E4F29060];
        id v12 = specific;
        v11 = [v57 callStackSymbols];
        a6 = [v11 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v74 = (const void **)specific;
        __int16 v75 = 2114;
        v76 = a6;
        _os_log_error_impl(&dword_1A9680000, v55, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v56)
    {
      specific = [MEMORY[0x1E4F29060] callStackSymbols];
      v11 = [specific componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v74 = v11;
      _os_log_error_impl(&dword_1A9680000, v55, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
LABEL_60:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_139);
    goto LABEL_16;
  }
  specific = v13;
  v15 = [(NURenderNode *)self videoProperties:a6];
  uint64_t v6 = v15;
  if (v15)
  {
    v61 = self;
    v62 = v12;
    v63 = v15;
    v64 = specific;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v16 = [v15 metadata];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v68 objects:v72 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v69;
      uint64_t v20 = *MEMORY[0x1E4F92298];
LABEL_5:
      double v21 = v11;
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v69 != v19) {
          objc_enumerationMutation(v16);
        }
        v23 = *(void **)(*((void *)&v68 + 1) + 8 * v22);
        v24 = [v23 key];
        char v25 = [v24 isEqual:v20];

        if (v25) {
          break;
        }
        if (v18 == ++v22)
        {
          uint64_t v18 = [v16 countByEnumeratingWithState:&v68 objects:v72 count:16];
          v11 = v21;
          if (v18) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
      id v26 = v23;

      if (!v26)
      {
        v27 = 0;
        v11 = v21;
        goto LABEL_20;
      }
      v28 = (void *)MEMORY[0x1E4F92218];
      int64_t v29 = [v26 value];
      v27 = [v28 deserializeMetadataWithType:2 fromGlobalMetadata:v29 error:a6];

      v11 = v21;
      if (v27) {
        goto LABEL_20;
      }
      int64_t v30 = 0;
      id v12 = v62;
      specific = v64;
      goto LABEL_46;
    }
LABEL_11:

    id v26 = 0;
    v27 = 0;
LABEL_20:
    specific = v64;
    v32 = [v64 videoMetadataSamples];
    v33 = [v32 objectForKeyedSubscript:@"portraitVideoMetadata"];

    if (v33)
    {
LABEL_21:
      v34 = [v33 metadataGroup];

      id v12 = v62;
      if (v34)
      {
        v35 = [PIPortraitVideoMetadataSample alloc];
        v36 = [v33 metadataGroup];
        v37 = -[PIPortraitVideoMetadataSample initWithMetadataGroup:majorVersion:minorVersion:error:](v35, "initWithMetadataGroup:majorVersion:minorVersion:error:", v36, [v27 majorVersion], objc_msgSend(v27, "minorVersion"), a6);

        if (v37)
        {
          id v60 = v26;
          v38 = v64;
          [v64 scale];
          if (NUScaleEqual()
            && [v64 evaluationMode] == 3
            && [v27 renderingVersion] >= 2)
          {
            v39 = +[PIGlobalSettings globalSettings];
            int v40 = [v39 cinematicAllowYUVSourceInput];

            if (v40)
            {
              if (resolvedNodeWithCachedInputs_settings_pipelineState_error__once != -1) {
                dispatch_once(&resolvedNodeWithCachedInputs_settings_pipelineState_error__once, &__block_literal_global_3450);
              }
              unsigned int v58 = 1;
            }
            else
            {
              unsigned int v58 = 0;
            }
            v38 = v64;
          }
          else
          {
            unsigned int v58 = 0;
          }
          BOOL v42 = (void *)[v62 mutableCopy];
          [v42 setObject:v27 forKeyedSubscript:@"globalMetadata"];
          [v42 setObject:v37 forKeyedSubscript:@"timedMetadata"];
          v59 = v37;
          if (v38) {
            [v38 time];
          }
          else {
            memset(&time, 0, sizeof(time));
          }
          CFDictionaryRef v43 = CMTimeCopyAsDictionary(&time, 0);
          [v42 setObject:v43 forKeyedSubscript:@"renderTime"];

          v44 = NSNumber;
          uint64_t v45 = [v38 scale];
          id v47 = objc_msgSend(v44, "numberWithInt:", -[PIPortraitVideoRenderNode _portraitQualityForRenderScale:](v61, "_portraitQualityForRenderScale:", v45, v46));
          [v42 setObject:v47 forKeyedSubscript:@"renderQuality"];

          v48 = [v63 colorProperties];
          v49 = [v48 objectForKeyedSubscript:*MEMORY[0x1E4F162E0]];
          [v42 setObject:v49 forKeyedSubscript:@"sourceTransferFunction"];

          v50 = [NSNumber numberWithBool:v58];
          [v42 setObject:v50 forKeyedSubscript:@"useSourceBuffersDirectly"];

          v65.receiver = v61;
          v65.super_class = (Class)PIPortraitVideoRenderNode;
          int64_t v30 = [(NURenderNode *)&v65 resolvedNodeWithCachedInputs:v11 settings:v42 pipelineState:v38 error:a6];

          specific = v38;
          v37 = v59;
          id v26 = v60;
        }
        else
        {
          int64_t v30 = 0;
          specific = v64;
        }

        goto LABEL_45;
      }
LABEL_44:
      [MEMORY[0x1E4F7A438] missingError:@"PIPortraitVideoRenderNode: expected a valid portraitVideoMetadata sample" object:v33];
      int64_t v30 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_45:

LABEL_46:
      uint64_t v6 = v63;
      goto LABEL_47;
    }
    if ([v64 evaluationMode] == 1)
    {
      v41 = +[PIPortraitVideoMetadataSample renderingMetadataIdentifier];
      if (v64) {
        [v64 time];
      }
      else {
        memset(v67, 0, sizeof(v67));
      }
      v33 = [(NURenderNode *)v61 outputTimedMetadataSampleWithIdentifier:v41 atTime:v67 error:a6];

      if (v33) {
        goto LABEL_21;
      }
    }
    else
    {
      v33 = 0;
    }
    id v12 = v62;
    goto LABEL_44;
  }
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_60;
  }
LABEL_16:
  v31 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
  {
    v52 = (const void **)*a6;
    *(_DWORD *)buf = 138543362;
    v74 = v52;
    _os_log_error_impl(&dword_1A9680000, v31, OS_LOG_TYPE_ERROR, "Failed to obtain video properties: %{public}@", buf, 0xCu);
  }
  int64_t v30 = 0;
LABEL_47:

  return v30;
}

void __87__PIPortraitVideoRenderNode_resolvedNodeWithCachedInputs_settings_pipelineState_error___block_invoke()
{
}

- (BOOL)_prewarmPortraitRendererWithPipelineState:(id)a3 error:(id *)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v35 = NUAssertLogger_3385();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "state != nil");
      v36 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v36;
      _os_log_error_impl(&dword_1A9680000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v37 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v39 = NUAssertLogger_3385();
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v40)
      {
        v48 = dispatch_get_specific(*v37);
        v49 = (void *)MEMORY[0x1E4F29060];
        id v50 = v48;
        v37 = [v49 callStackSymbols];
        unsigned int v51 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v63 = (const void **)v48;
        __int16 v64 = 2114;
        objc_super v65 = v51;
        _os_log_error_impl(&dword_1A9680000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v40)
    {
      v41 = [MEMORY[0x1E4F29060] callStackSymbols];
      v37 = [v41 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v63 = v37;
      _os_log_error_impl(&dword_1A9680000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v45 = _NUAssertFailHandler();
    goto LABEL_29;
  }
  if (!a4)
  {
    BOOL v42 = NUAssertLogger_3385();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      CFDictionaryRef v43 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v43;
      _os_log_error_impl(&dword_1A9680000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v37 = (const void **)MEMORY[0x1E4F7A308];
    v44 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v39 = NUAssertLogger_3385();
    int v45 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    if (!v44)
    {
      if (v45)
      {
        uint64_t v46 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v47 = [v46 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v63 = v47;
        _os_log_error_impl(&dword_1A9680000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_31;
    }
LABEL_29:
    if (v45)
    {
      v52 = dispatch_get_specific(*v37);
      v53 = (void *)MEMORY[0x1E4F29060];
      id v54 = v52;
      long long v55 = [v53 callStackSymbols];
      BOOL v56 = [v55 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v63 = (const void **)v52;
      __int16 v64 = 2114;
      objc_super v65 = v56;
      _os_log_error_impl(&dword_1A9680000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_31:

    _NUAssertFailHandler();
  }
  CMTime v7 = v6;
  v8 = [(NURenderNode *)self inputs];
  v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];
  id v10 = [v9 outputImageGeometry:a4];

  if (v10)
  {
    v11 = [(NURenderNode *)self inputs];
    id v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F1E468]];
    id v13 = [v12 outputImageGeometry:a4];

    if (v13)
    {
      uint64_t v14 = [v7 scale];
      uint64_t v16 = -[PIPortraitVideoRenderNode _targetScaleForScale:](self, "_targetScaleForScale:", v14, v15);
      uint64_t v18 = v17;
      id v19 = objc_alloc(MEMORY[0x1E4F7A508]);
      [v10 extent];
      uint64_t v20 = objc_msgSend(v19, "initWithExtent:renderScale:orientation:", v61, v16, v18, objc_msgSend(v10, "orientation"));
      double v21 = [v7 device];
      BOOL v22 = v21 != 0;

      if (v21)
      {
        unsigned int v59 = -[PIPortraitVideoRenderNode _portraitQualityForRenderScale:](self, "_portraitQualityForRenderScale:", v16, v18);
        id v60 = [v7 device];
        v23 = [v60 metalDevice];
        uint64_t v24 = [v20 scaledSize];
        uint64_t v57 = v25;
        uint64_t v58 = v24;
        id v26 = v20;
        uint64_t v27 = [v13 scaledSize];
        uint64_t v29 = v28;
        int64_t v30 = [(PIPortraitVideoRenderNode *)self debugMode];
        if ((unint64_t)(v30 - 2) >= 4) {
          int64_t v31 = 0;
        }
        else {
          int64_t v31 = v30 - 1;
        }
        v32 = [(PIPortraitVideoRenderNode *)self globalMetadata];
        uint64_t v33 = v27;
        uint64_t v20 = v26;
        +[PIPortraitVideoRenderer prewarmRendererForDevice:colorSize:disparitySize:quality:debugMode:globalRenderingMetadata:](PIPortraitVideoRenderer, "prewarmRendererForDevice:colorSize:disparitySize:quality:debugMode:globalRenderingMetadata:", v23, v58, v57, v33, v29, v59, v31, v32);
      }
      else
      {
        *a4 = [MEMORY[0x1E4F7A438] invalidError:@"No device specified for prewarm" object:0];
      }
    }
    else
    {
      BOOL v22 = 0;
    }
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    int64_t v31 = NUAssertLogger_3385();
    self = (PIPortraitVideoRenderNode *)"error != NULL";
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      v32 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v32;
      _os_log_error_impl(&dword_1A9680000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v12 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v8 = NUAssertLogger_3385();
    BOOL v33 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        specific = dispatch_get_specific(*v12);
        v34 = (void *)MEMORY[0x1E4F29060];
        a5 = specific;
        id v12 = [v34 callStackSymbols];
        v35 = [v12 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v41 = (const void **)specific;
        __int16 v42 = 2114;
        CFDictionaryRef v43 = v35;
        _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v33)
    {
      specific = [MEMORY[0x1E4F29060] callStackSymbols];
      id v12 = [specific componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v41 = v12;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    v36 = "error != NULL";
    _NUAssertFailHandler();
LABEL_26:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_139);
    goto LABEL_4;
  }
  specific = v9;
  id v39 = 0;
  BOOL v11 = [(PIPortraitVideoRenderNode *)self _prewarmPortraitRendererWithPipelineState:v9 error:&v39];
  id v12 = (const void **)v39;
  if (v11) {
    goto LABEL_6;
  }
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_26;
  }
LABEL_4:
  id v13 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v41 = v12;
    _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Failed to prewarm portrait renderer: %{public}@", buf, 0xCu);
  }
LABEL_6:
  if (objc_msgSend(specific, "evaluationMode", v36) == 1 || objc_msgSend(specific, "evaluationMode") == 3)
  {
    uint64_t v14 = [specific scale];
    uint64_t v16 = -[PIPortraitVideoRenderNode _targetScaleForScale:](self, "_targetScaleForScale:", v14, v15);
    uint64_t v18 = v17;
    id v19 = (void *)[specific copy];
    objc_msgSend(v19, "setScale:", v16, v18);
    v38.receiver = self;
    v38.super_class = (Class)PIPortraitVideoRenderNode;
    uint64_t v20 = [(NURenderNode *)&v38 nodeByReplayingAgainstCache:v8 pipelineState:v19 error:a5];
    if (v20)
    {
      double v21 = (void *)v20;
      [specific scale];
      uint64_t v22 = NUScaleDivide();
      uint64_t v24 = v23;
      if (NUScaleEqual())
      {
        id v25 = v21;
      }
      else
      {
        id v26 = objc_alloc(MEMORY[0x1E4F7A678]);
        uint64_t v27 = [specific scale];
        uint64_t v29 = objc_msgSend(v26, "initWithTargetScale:effectiveScale:sampleMode:input:", v27, v28, v22, v24, objc_msgSend(specific, "sampleMode"), v21);
        id v25 = [MEMORY[0x1E4F7A610] nodeFromCache:v29 cache:v8];

        objc_msgSend(v25, "setEvaluatedForMode:", objc_msgSend(specific, "evaluationMode"));
      }
    }
    else
    {

      id v25 = 0;
    }
  }
  else
  {
    v37.receiver = self;
    v37.super_class = (Class)PIPortraitVideoRenderNode;
    id v25 = [(NURenderNode *)&v37 nodeByReplayingAgainstCache:v8 pipelineState:specific error:a5];
  }

  return v25;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_targetScaleForScale:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!NUScaleIsValid())
  {
    id v6 = NUAssertLogger_3385();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      CMTime v7 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUScaleIsValid(scale)");
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v10 = NUAssertLogger_3385();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        uint64_t v14 = dispatch_get_specific(*v8);
        uint64_t v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        uint64_t v17 = [v15 callStackSymbols];
        uint64_t v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v20 = v14;
        __int16 v21 = 2114;
        uint64_t v22 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      id v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  uint64_t v3 = 1;
  do
  {
    v3 *= 2;
    NUScaleMake();
  }
  while (NUScaleCompare() < 1);
  int64_t v4 = NUScaleMake();
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return (([a3 evaluationMode] - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (id)uniqueInputNode
{
  return [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
}

- (int64_t)debugMode
{
  v2 = [(NURenderNode *)self settings];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"debugMode"];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (NSArray)apertureKeyframes
{
  v2 = [(NURenderNode *)self settings];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"apertureKeyframes"];

  return (NSArray *)v3;
}

- (NSArray)disparityKeyframes
{
  v2 = [(NURenderNode *)self settings];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"disparityKeyframes"];

  return (NSArray *)v3;
}

- (PIPortraitVideoRenderNode)initWithInput:(id)a3 disparityInput:(id)a4 disparityKeyframes:(id)a5 apertureKeyframes:(id)a6 debugMode:(int64_t)a7
{
  v26[2] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = *MEMORY[0x1E4F1E468];
  v25[0] = *MEMORY[0x1E4F1E480];
  uint64_t v12 = v25[0];
  v25[1] = v13;
  v26[0] = a3;
  v26[1] = a4;
  uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [v14 dictionaryWithObjects:v26 forKeys:v25 count:2];
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v20 setObject:v12 forKeyedSubscript:@"__dominantInputSettingsKey"];
  __int16 v21 = [NSNumber numberWithInteger:a7];
  [v20 setObject:v21 forKeyedSubscript:@"debugMode"];

  [v20 setObject:v16 forKeyedSubscript:@"disparityKeyframes"];
  [v20 setObject:v15 forKeyedSubscript:@"apertureKeyframes"];

  v24.receiver = self;
  v24.super_class = (Class)PIPortraitVideoRenderNode;
  uint64_t v22 = [(NURenderNode *)&v24 initWithSettings:v20 inputs:v19];

  return v22;
}

@end