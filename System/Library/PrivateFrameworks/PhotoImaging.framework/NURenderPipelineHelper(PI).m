@interface NURenderPipelineHelper(PI)
- (PIPortraitVideoDebugDetectionsRenderNode)portraitVideoDebugDetectedObjects:()PI source:cinematographyState:monochrome:error:;
- (PIPortraitVideoRenderNode)portraitVideo:()PI disparityInput:disparityKeyframes:apertureKeyframes:debugMode:error:;
- (PIVideoCrossfadeLoopNode)videoCrossfadeLoop:()PI crossfadeAdjustment:error:;
- (PIVideoReframeNode)videoReframe:()PI reframes:error:;
- (id)debugNodeByApplyingFilterWithName:()PI useHDRFilter:settingsAndInputs:;
- (id)nodeByApplyingFilterWithName:()PI useHDRFilter:settingsAndInputs:;
- (id)performApertureRedeyeOnImage:()PI useHDRFilter:redEyeAdjustment:;
- (id)performLongExposureFusionForComposition:()PI longExposureImage:useHDRFilter:error:;
- (id)performRedeyeOnImage:()PI useHDRFilter:redEyeAdjustment:;
- (id)remapPortraitV2Strength:()PI portraitEffectKind:;
- (uint64_t)versionForPortraitEffect:()PI;
@end

@implementation NURenderPipelineHelper(PI)

- (id)debugNodeByApplyingFilterWithName:()PI useHDRFilter:settingsAndInputs:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v6 = a5;
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v10) {
    goto LABEL_14;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v27;
  v25 = (void *)*MEMORY[0x1E4F1E510];
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v27 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      v15 = [v9 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = v8;
      }
      else
      {
        if ([v14 isEqualToString:@"filterVersion"])
        {
          v16 = v7;
          v17 = v15;
          v18 = v25;
          goto LABEL_12;
        }
        v16 = v7;
      }
      v17 = v15;
      v18 = v14;
LABEL_12:
      [v16 setObject:v17 forKeyedSubscript:v18];
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  }
  while (v11);
LABEL_14:

  if (a4)
  {
    uint64_t v19 = +[PIPhotosPipelineHDRFilters HDRFilterForSDRFilter:v24];

    v20 = (void *)v19;
  }
  else
  {
    v20 = v24;
  }
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F7A420]) initWithFilterName:v20 settings:v7 inputs:v8];

  return v21;
}

- (id)nodeByApplyingFilterWithName:()PI useHDRFilter:settingsAndInputs:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v6 = a5;
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v10) {
    goto LABEL_14;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v27;
  v25 = (void *)*MEMORY[0x1E4F1E510];
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v27 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      v15 = [v9 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = v8;
      }
      else
      {
        if ([v14 isEqualToString:@"filterVersion"])
        {
          v16 = v7;
          v17 = v15;
          v18 = v25;
          goto LABEL_12;
        }
        v16 = v7;
      }
      v17 = v15;
      v18 = v14;
LABEL_12:
      [v16 setObject:v17 forKeyedSubscript:v18];
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  }
  while (v11);
LABEL_14:

  if (a4)
  {
    uint64_t v19 = +[PIPhotosPipelineHDRFilters HDRFilterForSDRFilter:v24];

    v20 = (void *)v19;
  }
  else
  {
    v20 = v24;
  }
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F7A460]) initWithFilterName:v20 settings:v7 inputs:v8];

  return v21;
}

- (id)performRedeyeOnImage:()PI useHDRFilter:redEyeAdjustment:
{
  v20[5] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v9 objectForKeyedSubscript:@"inputCorrectionInfo"];
  if ([v10 count])
  {
    uint64_t v11 = [v9 objectForKeyedSubscript:@"iPhone"];
    uint64_t v12 = &stru_1EFFD8610;
    if (v11) {
      uint64_t v12 = @"iPhone";
    }
    v13 = v12;

    v19[0] = @"inputImage";
    id v14 = objc_alloc(MEMORY[0x1E4F7A658]);
    v15 = objc_msgSend(v14, "initWithInput:scale:", v8, *MEMORY[0x1E4F7A338], *(void *)(MEMORY[0x1E4F7A338] + 8));
    v20[0] = v15;
    v20[1] = v8;
    v19[1] = @"inputDestinationImage";
    v19[2] = @"inputCorrectionInfo";
    v20[2] = v10;
    v20[3] = v13;
    v19[3] = @"inputCameraModel";
    v19[4] = @"__dominantInputSettingsKey";
    v20[4] = @"inputDestinationImage";
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:5];

    uint64_t v17 = [a1 nodeByApplyingFilterWithName:@"PIRedEye" useHDRFilter:a4 settingsAndInputs:v16];

    id v8 = (id)v17;
  }

  return v8;
}

- (id)performApertureRedeyeOnImage:()PI useHDRFilter:redEyeAdjustment:
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = @"inputImage";
  v15[1] = @"inputSpots";
  v16[0] = a3;
  id v8 = (void *)MEMORY[0x1E4F7A620];
  id v9 = a3;
  uint64_t v10 = [a5 objectForKeyedSubscript:@"inputCorrectionInfo"];
  uint64_t v11 = [v8 redEyeSpotsWithCorrectionInfo:v10];
  v16[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  v13 = [a1 nodeByApplyingFilterWithName:@"PIApertureRedEyeFilter" useHDRFilter:a4 settingsAndInputs:v12];

  return v13;
}

- (id)performLongExposureFusionForComposition:()PI longExposureImage:useHDRFilter:error:
{
  v42[9] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [v9 objectForKeyedSubscript:@"highResFusion"];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"alignment"];
  v13 = [v12 objectForKeyedSubscript:@"extent"];
  id v14 = [v12 objectForKeyedSubscript:@"transform"];
  v15 = [a1 getTagWithPath:@"AutoLoop/LongExposureMotion" error:a6];
  if (v15)
  {
    id v38 = v9;
    v16 = [v9 objectForKeyedSubscript:@"source"];
    uint64_t v17 = [a1 renderNodeFromSource:v16 settings:&unk_1F000F080 error:a6];

    v39 = (void *)v17;
    if (v17)
    {
      v18 = [v10 outputImageGeometry:a6];
      uint64_t v19 = v18;
      if (v18)
      {
        v35 = v14;
        v41[0] = @"__dominantInputSettingsKey";
        v41[1] = @"__gainMapMode";
        v42[0] = @"inputStillImage";
        v42[1] = &unk_1F000A0D0;
        v41[2] = @"inputVideoScale";
        v20 = NSNumber;
        double v21 = (double)[v18 renderScale];
        [v19 renderScale];
        v23 = [v20 numberWithDouble:v21 / (double)v22];
        v42[2] = v23;
        v41[3] = @"inputRenderScale";
        v32 = [MEMORY[0x1E4F7A620] scaleMultiplyOfScalar:1.0];
        v42[3] = v32;
        v41[4] = @"inputAlignmentExtent";
        id v24 = [a1 vectorWithFloats:v13];
        v42[4] = v24;
        v41[5] = @"inputAlignmentTransform";
        [a1 vectorWithFloats:v14];
        v25 = v34 = v19;
        v42[5] = v25;
        v42[6] = v10;
        v41[6] = @"inputImage";
        v41[7] = @"inputStillImage";
        v41[8] = @"inputMaskImage";
        v42[7] = v39;
        v42[8] = v15;
        long long v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:9];
        v37 = [a1 nodeByApplyingFilterWithName:@"PILongExposureFusion" useHDRFilter:a5 settingsAndInputs:v26];

        long long v27 = [v13 objectAtIndexedSubscript:2];
        uint64_t v33 = [v27 integerValue];
        long long v28 = [v13 objectAtIndexedSubscript:3];
        uint64_t v29 = [v28 integerValue];

        uint64_t v19 = v34;
        v40[0] = 0;
        v40[1] = 0;
        v40[2] = v33;
        v40[3] = v29;
        id v14 = v35;
        v30 = [a1 cropNode:v37 cropRect:v40 cropSettings:0];
      }
      else
      {
        v30 = 0;
      }
      id v9 = v38;
    }
    else
    {
      v30 = 0;
      id v9 = v38;
    }
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (uint64_t)versionForPortraitEffect:()PI
{
  v3 = [a3 objectForKeyedSubscript:@"kind"];
  if ([&unk_1F000AC70 containsObject:v3]) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }

  return v4;
}

- (PIPortraitVideoDebugDetectionsRenderNode)portraitVideoDebugDetectedObjects:()PI source:cinematographyState:monochrome:error:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!a7)
  {
    uint64_t v22 = NUAssertLogger_26816();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v36 = v23;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v24 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    long long v26 = NUAssertLogger_26816();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v30 = dispatch_get_specific(*v24);
        uint64_t v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        uint64_t v33 = [v31 callStackSymbols];
        v34 = [v33 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v36 = v30;
        __int16 v37 = 2114;
        id v38 = v34;
        _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      long long v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v36 = v29;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v14 = v13;
  v15 = [v12 definition];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = [v15 sourceDefinitions];
    id v17 = [v16 firstObject];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v17 = v15;
    }
    else {
      id v17 = 0;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = [PIPortraitVideoDebugDetectionsRenderNode alloc];
    uint64_t v19 = [v17 url];
    v20 = [(PIPortraitVideoDebugDetectionsRenderNode *)v18 initWithInput:v11 assetURL:v19 cinematographyState:v14 monochrome:a6];
  }
  else
  {
    [MEMORY[0x1E4F7A438] invalidError:@"Unexpected source type" object:v12];
    v20 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (PIPortraitVideoRenderNode)portraitVideo:()PI disparityInput:disparityKeyframes:apertureKeyframes:debugMode:error:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (!a8)
  {
    uint64_t v22 = NUAssertLogger_26816();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v36 = v23;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v24 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    long long v26 = NUAssertLogger_26816();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v30 = dispatch_get_specific(*v24);
        uint64_t v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        uint64_t v33 = [v31 callStackSymbols];
        v34 = [v33 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v36 = v30;
        __int16 v37 = 2114;
        id v38 = v34;
        _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      long long v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v36 = v29;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v17 = v16;
  v18 = __112__NURenderPipelineHelper_PI__portraitVideo_disparityInput_disparityKeyframes_apertureKeyframes_debugMode_error___block_invoke(v15);
  uint64_t v19 = __112__NURenderPipelineHelper_PI__portraitVideo_disparityInput_disparityKeyframes_apertureKeyframes_debugMode_error___block_invoke(v17);
  v20 = [[PIPortraitVideoRenderNode alloc] initWithInput:v13 disparityInput:v14 disparityKeyframes:v18 apertureKeyframes:v19 debugMode:a7];

  return v20;
}

- (PIVideoCrossfadeLoopNode)videoCrossfadeLoop:()PI crossfadeAdjustment:error:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!a5)
  {
    id v24 = NUAssertLogger_26816();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      LODWORD(v47.start.value) = 138543362;
      *(CMTimeValue *)((char *)&v47.start.value + 4) = (CMTimeValue)v25;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v47, 0xCu);
    }
    long long v26 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    long long v28 = NUAssertLogger_26816();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        id v32 = dispatch_get_specific(*v26);
        uint64_t v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        v35 = [v33 callStackSymbols];
        v36 = [v35 componentsJoinedByString:@"\n"];
        LODWORD(v47.start.value) = 138543618;
        *(CMTimeValue *)((char *)&v47.start.value + 4) = (CMTimeValue)v32;
        LOWORD(v47.start.flags) = 2114;
        *(void *)((char *)&v47.start.flags + 2) = v36;
        _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v47, 0x16u);
      }
    }
    else if (v29)
    {
      v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v31 = [v30 componentsJoinedByString:@"\n"];
      LODWORD(v47.start.value) = 138543362;
      *(CMTimeValue *)((char *)&v47.start.value + 4) = (CMTimeValue)v31;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v47, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v9 = v8;
  id v10 = [v8 objectForKeyedSubscript:@"crossfadeDurationValue"];
  id v11 = [v9 objectForKeyedSubscript:@"crossfadeDurationTimescale"];
  id v12 = [v9 objectForKeyedSubscript:@"startTimeValue"];
  id v13 = [v9 objectForKeyedSubscript:@"startTimeTimescale"];
  id v14 = [v9 objectForKeyedSubscript:@"timeRangeStartValue"];
  id v15 = [v9 objectForKeyedSubscript:@"timeRangeStartTimescale"];
  id v38 = [v9 objectForKeyedSubscript:@"timeRangeDurationValue"];
  __int16 v37 = [v9 objectForKeyedSubscript:@"timeRangeDurationTimescale"];
  id v16 = v10;
  uint64_t v39 = v11;
  if (v10 && v11)
  {
    if (v7)
    {
      memset(&v46, 0, sizeof(v46));
      CMTimeMake(&v46, [v10 longLongValue], objc_msgSend(v11, "intValue"));
      memset(&v45, 0, sizeof(v45));
      CMTimeMake(&v45, [v12 longLongValue], objc_msgSend(v13, "intValue"));
      memset(&v47, 0, sizeof(v47));
      CMTimeMake(&start, [v14 longLongValue], objc_msgSend(v15, "intValue"));
      id v17 = v38;
      v18 = v37;
      CMTimeMake(&duration, [v38 longLongValue], objc_msgSend(v37, "intValue"));
      CMTimeRangeMake(&v47, &start, &duration);
      uint64_t v19 = [PIVideoCrossfadeLoopNode alloc];
      CMTimeRange v42 = v47;
      CMTime v41 = v46;
      CMTime v40 = v45;
      v20 = [(PIVideoCrossfadeLoopNode *)v19 initWithInput:v7 timeRange:&v42 crossfadeDuration:&v41 startTime:&v40];
      goto LABEL_9;
    }
    double v21 = (void *)MEMORY[0x1E4F7A438];
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
    *a5 = [v21 missingError:@"input to VideoCrossfadeLoop cannot be nil" object:v22];

    v20 = 0;
  }
  else
  {
    [MEMORY[0x1E4F7A438] invalidError:@"Missing duration for crossfade" object:v9];
    v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v37;
  id v17 = v38;
LABEL_9:

  return v20;
}

- (PIVideoReframeNode)videoReframe:()PI reframes:error:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!a5)
  {
    v23 = NUAssertLogger_26816();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v24;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v25 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v27 = NUAssertLogger_26816();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        uint64_t v31 = dispatch_get_specific(*v25);
        id v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        id v34 = [v32 callStackSymbols];
        v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v31;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v35;
        _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      BOOL v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v30;
      _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v9 = v8;
  id v10 = [v8 objectForKeyedSubscript:@"keyframes"];
  uint64_t v11 = [v9 objectForKeyedSubscript:@"stabCropRect"];
  id v12 = (void *)v11;
  if (v10)
  {
    if (v11)
    {
      id v38 = +[PIReframeKeyframe keyframesFromDictionaryRepresentations:v10];
      id v13 = [v12 objectForKeyedSubscript:@"X"];
      uint64_t v37 = (int)[v13 intValue];
      id v14 = [v12 objectForKeyedSubscript:@"Y"];
      uint64_t v36 = (int)[v14 intValue];
      id v15 = [v12 objectForKeyedSubscript:@"Width"];
      uint64_t v16 = (int)[v15 intValue];
      id v17 = [v12 objectForKeyedSubscript:@"Height"];
      uint64_t v18 = (int)[v17 intValue];

      *(void *)buf = v37;
      *(void *)&buf[8] = v36;
      *(void *)&buf[16] = v16;
      uint64_t v40 = v18;
      uint64_t v19 = [[PIVideoReframeNode alloc] initWithKeyframes:v38 stabCropRect:buf input:v7];

      goto LABEL_8;
    }
    v20 = (void *)MEMORY[0x1E4F7A438];
    double v21 = @"Invalid data type for stabCropRect";
  }
  else
  {
    v20 = (void *)MEMORY[0x1E4F7A438];
    double v21 = @"Invalid data type for keyframes";
  }
  [v20 invalidError:v21 object:v9];
  uint64_t v19 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v19;
}

- (id)remapPortraitV2Strength:()PI portraitEffectKind:
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    [v5 doubleValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 0.5;
  }
  if (([v6 isEqualToString:@"StudioV2"] & 1) != 0
    || [v6 isEqualToString:@"StageWhite"])
  {
    id v9 = NSNumber;
    double v10 = pow(v8, 0.75);
    uint64_t v11 = v9;
  }
  else if (([v6 isEqualToString:@"ContourV2"] & 1) != 0 {
         || ([v6 isEqualToString:@"StageV2"] & 1) != 0
  }
         || [v6 isEqualToString:@"StageMonoV2"])
  {
    uint64_t v11 = NSNumber;
    double v10 = v8 * 1.8 + v8 * v8 * -0.8;
  }
  else
  {
    uint64_t v11 = NSNumber;
    double v10 = v8;
  }
  id v12 = [v11 numberWithDouble:v10];

  return v12;
}

@end