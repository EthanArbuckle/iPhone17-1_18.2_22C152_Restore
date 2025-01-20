@interface PIAutoLoopStabVideoNode
+ (id)nodeWithInput:(id)a3 recipe:(id)a4 error:(id *)a5;
- (BOOL)requiresAudioMix;
- (BOOL)requiresVideoComposition;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NSDictionary)bakedRecipe;
- (PIAutoLoopStabVideoNode)initWithInput:(id)a3 settings:(id)a4 bakedRecipe:(id)a5;
- (PIAutoLoopStabVideoNode)initWithSettings:(id)a3 inputs:(id)a4;
- (id)_evaluateImageGeometry:(id *)a3;
- (id)_evaluateVideo:(id *)a3;
- (id)_evaluateVideoComposition:(id *)a3;
- (id)_evaluateVideoProperties:(id *)a3;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
@end

@implementation PIAutoLoopStabVideoNode

- (void).cxx_destruct
{
}

- (NSDictionary)bakedRecipe
{
  return self->_bakedRecipe;
}

- (BOOL)requiresAudioMix
{
  return 0;
}

- (id)_evaluateVideoComposition:(id *)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v46 = NUAssertLogger_14385();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v47 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      LODWORD(v76.value) = 138543362;
      *(CMTimeValue *)((char *)&v76.value + 4) = (CMTimeValue)v47;
      _os_log_error_impl(&dword_1A9680000, v46, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v76, 0xCu);
    }
    v48 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v50 = NUAssertLogger_14385();
    BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v51)
      {
        v54 = dispatch_get_specific(*v48);
        v55 = (void *)MEMORY[0x1E4F29060];
        id v56 = v54;
        v57 = [v55 callStackSymbols];
        v58 = [v57 componentsJoinedByString:@"\n"];
        LODWORD(v76.value) = 138543618;
        *(CMTimeValue *)((char *)&v76.value + 4) = (CMTimeValue)v54;
        LOWORD(v76.flags) = 2114;
        *(void *)((char *)&v76.flags + 2) = v58;
        _os_log_error_impl(&dword_1A9680000, v50, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v76, 0x16u);
      }
    }
    else if (v51)
    {
      v52 = [MEMORY[0x1E4F29060] callStackSymbols];
      v53 = [v52 componentsJoinedByString:@"\n"];
      LODWORD(v76.value) = 138543362;
      *(CMTimeValue *)((char *)&v76.value + 4) = (CMTimeValue)v53;
      _os_log_error_impl(&dword_1A9680000, v50, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v76, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = [(NURenderNode *)self outputVideo:"outputVideo:"];
  v6 = v5;
  if (!v5)
  {
    id v38 = 0;
    goto LABEL_13;
  }
  v7 = [v5 tracksWithMediaType:*MEMORY[0x1E4F15C18]];
  v8 = [(NURenderNode *)self inputs];
  v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

  v10 = [v9 outputVideoComposition:a3];
  v11 = v10;
  if (v10)
  {
    v12 = [v10 instructions];
    uint64_t v13 = [v12 count];

    if (v13 == 1)
    {
      v14 = [(PIAutoLoopStabVideoNode *)self bakedRecipe];
      v15 = [v14 objectForKeyedSubscript:@"loopRecipe_loopParams"];
      v16 = v15;
      if (v15)
      {
        memset(&v76, 0, sizeof(v76));
        CFDictionaryRef v17 = [v15 objectForKeyedSubscript:@"loopParams_duration"];
        CMTimeMakeFromDictionary(&v76, v17);

        memset(&v72, 0, sizeof(v72));
        CFDictionaryRef v18 = [v16 objectForKeyedSubscript:@"loopParams_fadeLen"];
        CMTimeMakeFromDictionary(&v72, v18);

        memset(&v71, 0, sizeof(v71));
        CMTime lhs = v76;
        CMTime rhs = v72;
        CMTimeSubtract(&v71, &lhs, &rhs);
        v19 = [v7 objectAtIndexedSubscript:0];
        v20 = [v7 objectAtIndexedSubscript:1];
        id v21 = objc_alloc_init(MEMORY[0x1E4F7A6E0]);
        CMTime lhs = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
        CMTime rhs = v71;
        CMTimeRangeMake(&v68, &lhs, &rhs);
        CMTimeRange v67 = v68;
        v61 = v7;
        v60 = v9;
        v22 = v21;
        [v21 setTimeRange:&v67];
        v62 = v16;
        v23 = v19;
        v24 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v19, "trackID"));
        v75[0] = v24;
        v63 = v14;
        v25 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v20, "trackID"));
        v75[1] = v25;
        v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:2];
        [v22 setRequiredSourceTrackIDs:v26];

        v27 = v23;
        v28 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v23, "trackID"));
        v7 = v61;
        [v22 setSourceIdentifier:@"primary" forTrackID:v28];

        v29 = v20;
        v30 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v20, "trackID"));
        [v22 setSourceIdentifier:@"secondary" forTrackID:v30];

        id v31 = objc_alloc_init(MEMORY[0x1E4F7A6E0]);
        CMTime lhs = v71;
        CMTime rhs = v72;
        CMTimeRangeMake(&v66, &lhs, &rhs);
        CMTimeRange v65 = v66;
        [v31 setTimeRange:&v65];
        v32 = v27;
        v33 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v27, "trackID"));
        v74[0] = v33;
        v59 = v29;
        v34 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v29, "trackID"));
        v74[1] = v34;
        v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:2];
        [v31 setRequiredSourceTrackIDs:v35];

        v36 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v32, "trackID"));
        [v31 setSourceIdentifier:@"primary" forTrackID:v36];

        v37 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v29, "trackID"));
        [v31 setSourceIdentifier:@"secondary" forTrackID:v37];

        id v38 = objc_alloc_init(MEMORY[0x1E4F165B0]);
        v39 = [v63 objectForKeyedSubscript:@"loopRecipe_frameInstructions"];
        v40 = [v39 firstObject];
        memset(&lhs, 0, sizeof(lhs));
        CFDictionaryRef v41 = [v40 objectForKeyedSubscript:@"loopFrameData_presDur"];
        CMTimeMakeFromDictionary(&lhs, v41);

        CMTime v64 = lhs;
        [v38 setFrameDuration:&v64];
        v73[0] = v22;
        v73[1] = v31;
        v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:2];
        [v38 setInstructions:v42];

        v16 = v62;
        v14 = v63;

        v9 = v60;
      }
      else
      {
        [MEMORY[0x1E4F7A438] invalidError:@"Malformed loop recipe, missing loop params", v14 object];
        id v38 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_12;
    }
    v43 = (void *)MEMORY[0x1E4F7A438];
    v44 = [v11 instructions];
    *a3 = [v43 unsupportedError:@"Unsupported video configuration" object:v44];
  }
  id v38 = 0;
LABEL_12:

LABEL_13:
  return v38;
}

- (BOOL)requiresVideoComposition
{
  return 1;
}

- (id)_evaluateVideo:(id *)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v45 = NUAssertLogger_14385();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v46 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      LODWORD(lhs.start.value) = 138543362;
      *(CMTimeValue *)((char *)&lhs.start.value + 4) = (CMTimeValue)v46;
      _os_log_error_impl(&dword_1A9680000, v45, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&lhs, 0xCu);
    }
    v47 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v49 = NUAssertLogger_14385();
    BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v50)
      {
        v53 = dispatch_get_specific(*v47);
        v54 = (void *)MEMORY[0x1E4F29060];
        id v55 = v53;
        id v56 = [v54 callStackSymbols];
        v57 = [v56 componentsJoinedByString:@"\n"];
        LODWORD(lhs.start.value) = 138543618;
        *(CMTimeValue *)((char *)&lhs.start.value + 4) = (CMTimeValue)v53;
        LOWORD(lhs.start.flags) = 2114;
        *(void *)((char *)&lhs.start.flags + 2) = v57;
        _os_log_error_impl(&dword_1A9680000, v49, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&lhs, 0x16u);
      }
    }
    else if (v50)
    {
      BOOL v51 = [MEMORY[0x1E4F29060] callStackSymbols];
      v52 = [v51 componentsJoinedByString:@"\n"];
      LODWORD(lhs.start.value) = 138543362;
      *(CMTimeValue *)((char *)&lhs.start.value + 4) = (CMTimeValue)v52;
      _os_log_error_impl(&dword_1A9680000, v49, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&lhs, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = [(NURenderNode *)self inputs];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

  v7 = [v6 outputVideo:a3];
  if (!v7)
  {
    id v41 = 0;
    goto LABEL_38;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F16590]);
  if (!v8)
  {
    [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"[[AVMutableComposition alloc] init] failed." object:self];
    id v41 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  v62 = self;
  v9 = [(PIAutoLoopStabVideoNode *)self bakedRecipe];
  v10 = [MEMORY[0x1E4F7A718] firstEnabledVideoTrackInAsset:v7 error:a3];
  if (!v10)
  {
    id v41 = 0;
    goto LABEL_36;
  }
  v60 = a3;
  v61 = v7;
  uint64_t v11 = *MEMORY[0x1E4F15C18];
  v12 = [v8 addMutableTrackWithMediaType:*MEMORY[0x1E4F15C18] preferredTrackID:0];
  CMTimeRange v65 = [v8 addMutableTrackWithMediaType:v11 preferredTrackID:1];
  v63 = v9;
  [v9 objectForKeyedSubscript:@"loopRecipe_frameInstructions"];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  CMTimeRange v66 = v12;
  id v64 = v13;
  uint64_t v69 = [v13 countByEnumeratingWithState:&v84 objects:v89 count:16];
  if (!v69) {
    goto LABEL_19;
  }
  uint64_t v68 = *(void *)v85;
  id v58 = v8;
  v59 = v6;
  while (2)
  {
    for (uint64_t i = 0; i != v69; ++i)
    {
      if (*(void *)v85 != v68) {
        objc_enumerationMutation(v13);
      }
      v15 = *(void **)(*((void *)&v84 + 1) + 8 * i);
      memset(&lhs, 0, 24);
      CFDictionaryRef v16 = [v15 objectForKeyedSubscript:@"loopFrameData_presTime"];
      CMTimeMakeFromDictionary(&lhs.start, v16);

      memset(&rhs, 0, 24);
      CFDictionaryRef v17 = [v15 objectForKeyedSubscript:@"loopFrameData_presDur"];
      CMTimeMakeFromDictionary(&rhs.start, v17);

      memset(&v71, 0, 24);
      CMTimeMake(&v71.start, 1, rhs.start.timescale);
      CFDictionaryRef v18 = [v15 objectForKeyedSubscript:@"loopFrameData_frameTransforms"];
      if ([v18 count] != 1 && objc_msgSend(v18, "count") != 2)
      {
        id *v60 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Unexpected number of frame transforms" object:v18];

        id v41 = 0;
        v29 = v13;
        id v8 = v58;
        v6 = v59;
        v7 = v61;
        goto LABEL_29;
      }
      v19 = [v18 objectAtIndexedSubscript:0];
      memset(&v83, 0, sizeof(v83));
      uint64_t v20 = [v19 objectForKeyedSubscript:@"frameTransform_rawTime"];
      CMTimeMakeFromDictionary(&v83, (CFDictionaryRef)v20);

      CMTime start = v83;
      CMTime duration = v71.start;
      CMTimeRangeMake(&v82, &start, &duration);
      id v79 = 0;
      CMTime start = lhs.start;
      LOBYTE(v20) = [v12 insertTimeRange:&v82 ofTrack:v10 atTime:&start error:&v79];
      id v21 = v79;
      if ((v20 & 1) == 0)
      {
        id *v60 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to update video track" object:v62 underlyingError:v21];
        v42 = v65;
        goto LABEL_31;
      }
      CMTime start = lhs.start;
      CMTime duration = v71.start;
      CMTimeRangeMake(&v78, &start, &duration);
      CMTime start = rhs.start;
      [v12 scaleTimeRange:&v78 toDuration:&start];
      if ([v18 count] == 2)
      {
        CMTimeRange v67 = v19;
        v22 = [v18 objectAtIndexedSubscript:1];
        memset(&start, 0, sizeof(start));
        CFDictionaryRef v23 = [v22 objectForKeyedSubscript:@"frameTransform_rawTime"];
        CMTimeMakeFromDictionary(&start, v23);

        CMTime duration = start;
        CMTime v76 = v71.start;
        CMTimeRangeMake(&v77, &duration, &v76);
        id v75 = v21;
        CMTime duration = lhs.start;
        v24 = v10;
        int v25 = [v65 insertTimeRange:&v77 ofTrack:v10 atTime:&duration error:&v75];
        id v26 = v75;

        if (v25)
        {
          CMTime duration = lhs.start;
          CMTime v76 = v71.start;
          CMTimeRangeMake(&v74, &duration, &v76);
          CMTime duration = rhs.start;
          [v65 scaleTimeRange:&v74 toDuration:&duration];

          v10 = v24;
          v12 = v66;
          v19 = v67;
          id v13 = v64;
          goto LABEL_17;
        }
        id *v60 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to update video track" object:v62 underlyingError:v26];

        id v21 = v26;
        v10 = v24;
        v42 = v65;
        v19 = v67;
LABEL_31:

        id v41 = 0;
        v43 = v64;
        v29 = v64;
        id v8 = v58;
        v6 = v59;
        v7 = v61;
        goto LABEL_35;
      }
      id v26 = v21;
LABEL_17:
    }
    id v8 = v58;
    v6 = v59;
    uint64_t v69 = [v13 countByEnumeratingWithState:&v84 objects:v89 count:16];
    if (v69) {
      continue;
    }
    break;
  }
LABEL_19:

  uint64_t v27 = *MEMORY[0x1E4F15BA8];
  v7 = v61;
  v28 = [v61 tracksWithMediaType:*MEMORY[0x1E4F15BA8]];
  v29 = [v28 firstObject];

  if (v29)
  {
    v30 = v10;
    id v31 = v8;
    v32 = [v8 addMutableTrackWithMediaType:v27 preferredTrackID:2];
    v33 = [v63 objectForKeyedSubscript:@"loopRecipe_loopParams"];
    if (v33)
    {
      v34 = v33;
      memset(&v83, 0, sizeof(v83));
      CFDictionaryRef v35 = [v33 objectForKeyedSubscript:@"loopParams_duration"];
      CMTimeMakeFromDictionary(&v83, v35);

      memset(&start, 0, sizeof(start));
      CFDictionaryRef v36 = [v34 objectForKeyedSubscript:@"loopParams_fadeLen"];
      CMTimeMakeFromDictionary(&start, v36);

      memset(&duration, 0, sizeof(duration));
      CFDictionaryRef v37 = [v34 objectForKeyedSubscript:@"loopParams_startTime"];
      CMTimeMakeFromDictionary(&duration, v37);

      memset(&v76, 0, sizeof(v76));
      lhs.CMTime start = duration;
      rhs.CMTime start = start;
      CMTimeAdd(&v76, &lhs.start, &rhs.start);
      memset(&lhs, 0, sizeof(lhs));
      rhs.CMTime start = v76;
      v71.CMTime start = v83;
      CMTimeRangeMake(&lhs, &rhs.start, &v71.start);
      id v38 = (void *)MEMORY[0x1E4F7A718];
      [v29 timeRange];
      CMTimeRange v71 = lhs;
      [v38 conformRange:&v71 inRange:v72];
      CMTimeRange lhs = rhs;
      id v70 = 0;
      *(_OWORD *)&v71.start.value = *MEMORY[0x1E4F1FA48];
      v71.start.epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      int v39 = [v32 insertTimeRange:&rhs ofTrack:v29 atTime:&v71 error:&v70];
      id v40 = v70;
      if (v39)
      {
        objc_msgSend(v32, "setNaturalTimeScale:", objc_msgSend(v29, "naturalTimeScale"));

        id v8 = v31;
        v10 = v30;
        id v13 = v64;
        goto LABEL_23;
      }
      id *v60 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to update audio track" object:v62 underlyingError:v40];

      id v41 = 0;
      id v8 = v31;
      v9 = v63;
    }
    else
    {
      id *v60 = [MEMORY[0x1E4F7A438] invalidError:@"Malformed loop recipe, missing loop params", v63 object];

      id v41 = 0;
      v9 = v63;
    }
    v10 = v30;
    v43 = v64;
    v42 = v65;
  }
  else
  {
LABEL_23:
    id v41 = v8;
LABEL_29:
    v9 = v63;
    v43 = v13;
    v42 = v65;
  }
LABEL_35:

LABEL_36:
LABEL_37:

LABEL_38:
  return v41;
}

- (id)_evaluateVideoProperties:(id *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v22 = NUAssertLogger_14385();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      CFDictionaryRef v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      LODWORD(buf.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v23;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    v24 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v26 = NUAssertLogger_14385();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v30 = dispatch_get_specific(*v24);
        id v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        v33 = [v31 callStackSymbols];
        v34 = [v33 componentsJoinedByString:@"\n"];
        LODWORD(buf.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v30;
        LOWORD(buf.flags) = 2114;
        *(void *)((char *)&buf.flags + 2) = v34;
        _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v27)
    {
      v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      v29 = [v28 componentsJoinedByString:@"\n"];
      LODWORD(buf.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v29;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = [(NURenderNode *)self inputs];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

  v7 = [v6 videoProperties:a3];
  id v8 = v7;
  if (v7)
  {
    memset(&buf, 0, sizeof(buf));
    [v7 livePhotoKeyFrameTime];
    v9 = [(PIAutoLoopStabVideoNode *)self bakedRecipe];
    v10 = [v9 objectForKeyedSubscript:@"loopRecipe_loopParams"];
    uint64_t v11 = v10;
    if (v10)
    {
      memset(&v44, 0, sizeof(v44));
      CFDictionaryRef v12 = [v10 objectForKeyedSubscript:@"loopParams_startTime"];
      CMTimeMakeFromDictionary(&v44, v12);

      memset(&v43, 0, sizeof(v43));
      CFDictionaryRef v13 = [v11 objectForKeyedSubscript:@"loopParams_duration"];
      CMTimeMakeFromDictionary(&v43, v13);

      memset(&v42, 0, sizeof(v42));
      PIAutoLoopRecipeGetFrameDuration(v9, &v42);
      memset(&v41, 0, sizeof(v41));
      CMTime lhs = buf;
      CMTime rhs = v44;
      CMTimeSubtract(&time1, &lhs, &rhs);
      CMTime lhs = v43;
      CMTime rhs = v42;
      CMTimeSubtract(&time2, &lhs, &rhs);
      CMTimeMinimum(&v41, &time1, &time2);
      v14 = (void *)[objc_alloc(MEMORY[0x1E4F7A740]) initWithProperties:v8];
      CMTime v36 = v41;
      [v14 setLivePhotoKeyFrameTime:&v36];
      v15 = [(NURenderNode *)self outputImageGeometry:a3];
      CFDictionaryRef v16 = v15;
      if (v15)
      {
        uint64_t v17 = [v15 scaledSize];
        uint64_t v19 = v18;
        v35[0] = 0;
        v35[1] = 0;
        v35[2] = v17;
        v35[3] = v18;
        [v14 setCleanAperture:v35];
        objc_msgSend(v14, "setSize:", v17, v19);
        id v20 = v14;
      }
      else
      {
        id v20 = 0;
      }
    }
    else
    {
      [MEMORY[0x1E4F7A438] invalidError:@"Malformed loop recipe, missing loop params", v9 object];
      id v20 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v18 = NUAssertLogger_14385();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)CMTime buf = 138543362;
      v34 = v19;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v20 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v22 = NUAssertLogger_14385();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        id v26 = dispatch_get_specific(*v20);
        BOOL v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        v29 = [v27 callStackSymbols];
        v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        v34 = v26;
        __int16 v35 = 2114;
        CMTime v36 = v30;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      v34 = v25;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = [(NURenderNode *)self inputs];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

  id v32 = 0;
  v7 = [v6 outputImageGeometry:&v32];
  id v8 = v32;
  if (v7)
  {
    v9 = [(PIAutoLoopStabVideoNode *)self bakedRecipe];
    uint64_t v10 = [v7 orientation];
    uint64_t v11 = [v7 renderScale];
    uint64_t v13 = v12;
    v14 = PIAutoLoopRecipeComputeOutputGeometry(v9);
    id v15 = objc_alloc(MEMORY[0x1E4F7A508]);
    if (v14) {
      [v14 extent];
    }
    else {
      memset(v31, 0, sizeof(v31));
    }
    CFDictionaryRef v16 = objc_msgSend(v15, "initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:", v31, v11, v13, v10, 0, 4);
  }
  else
  {
    [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to get input geometry" object:self underlyingError:v8];
    CFDictionaryRef v16 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    CMTimeRange v65 = NUAssertLogger_14385();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      CMTimeRange v66 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)CMTime buf = 138543362;
      *(void *)&uint8_t buf[4] = v66;
      _os_log_error_impl(&dword_1A9680000, v65, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    CMTimeRange v67 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v69 = NUAssertLogger_14385();
    BOOL v70 = os_log_type_enabled(v69, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v70)
      {
        v73 = dispatch_get_specific(*v67);
        CMTimeRange v74 = (void *)MEMORY[0x1E4F29060];
        id v75 = v73;
        CMTime v76 = [v74 callStackSymbols];
        CMTimeRange v77 = [v76 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        *(void *)&uint8_t buf[4] = v73;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v77;
        _os_log_error_impl(&dword_1A9680000, v69, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v70)
    {
      CMTimeRange v71 = [MEMORY[0x1E4F29060] callStackSymbols];
      CMTime v72 = [v71 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      *(void *)&uint8_t buf[4] = v72;
      _os_log_error_impl(&dword_1A9680000, v69, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  uint64_t v10 = v9;
  uint64_t v11 = [v9 evaluationMode];
  if ((v11 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    v93.receiver = self;
    v93.super_class = (Class)PIAutoLoopStabVideoNode;
    __int16 v35 = [(NURenderNode *)&v93 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];
    goto LABEL_40;
  }
  uint64_t v12 = v11;
  uint64_t v13 = [(NURenderNode *)self outputImageGeometry:a5];
  if (v13)
  {
    id v85 = v13;
    v14 = [(NURenderNode *)self inputs];
    CMTime v83 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

    id v15 = [(PIAutoLoopStabVideoNode *)self bakedRecipe];
    memset(buf, 0, sizeof(buf));
    if (!v10 || ([v10 time], (buf[12] & 1) == 0))
    {
      *(_OWORD *)CMTime buf = *MEMORY[0x1E4F1FA48];
      *(void *)&buf[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    }
    *(_OWORD *)v104 = *(_OWORD *)buf;
    uint64_t v105 = *(void *)&buf[16];
    CFDictionaryRef v16 = PIAutoLoopRecipeGetInstructionAtTime(v15, (uint64_t)v104);
    uint64_t v17 = [v16 objectForKeyedSubscript:@"loopFrameData_frameTransforms"];
    CMTimeRange v82 = v16;
    uint64_t v18 = (void *)[v16 mutableCopy];
    v81 = v15;
    uint64_t v19 = [v15 objectForKeyedSubscript:@"loopRecipe_stabCropRect"];
    [v18 setObject:v19 forKeyedSubscript:@"loopRecipe_stabCropRect"];

    id v20 = [(NURenderNode *)self settings];
    id v21 = [v20 objectForKeyedSubscript:@"cleanAperture"];
    [v18 setObject:v21 forKeyedSubscript:@"cleanAperture"];

    [v85 renderScale];
    v22 = NUScaleToValue();
    [v18 setObject:v22 forKeyedSubscript:@"videoScale"];

    long long v84 = v17;
    if ([v17 count] == 1)
    {
      BOOL v23 = (void *)[v10 copy];
      int v25 = v82;
      v24 = v83;
      if (v12 == 3)
      {
        id v26 = [v10 videoFrames];
        BOOL v27 = [v26 objectForKeyedSubscript:@"primary"];

        if (!v27)
        {
          *a5 = [MEMORY[0x1E4F7A438] missingError:@"Missing primary video frame" object:v10];

          goto LABEL_29;
        }
        v102 = @"video";
        v103 = v27;
        id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v103 forKeys:&v102 count:1];
        [v23 setVideoFrames:v28];
      }
      v29 = [v17 objectAtIndexedSubscript:0];
      CFDictionaryRef v30 = [v29 objectForKeyedSubscript:@"frameTransform_rawTime"];
      CMTimeMakeFromDictionary(&v92, v30);
      CMTime v91 = v92;
      [v23 setTime:&v91];

      uint64_t v31 = [v83 nodeByReplayingAgainstCache:v8 pipelineState:v23 error:a5];
      if (v31)
      {
        id v32 = (void *)v31;
        v33 = [PIAutoLoopFrameNode alloc];
        v100 = @"primary";
        v101 = v32;
        v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v101 forKeys:&v100 count:1];
        BOOL v27 = [(NURenderNode *)v33 initWithSettings:v18 inputs:v34];

LABEL_13:
        __int16 v35 = [MEMORY[0x1E4F7A610] nodeFromCache:v27 cache:v8];
        objc_msgSend(v35, "setEvaluatedForMode:", objc_msgSend(v10, "evaluationMode"));
LABEL_38:

        uint64_t v13 = v85;
        goto LABEL_39;
      }

      BOOL v27 = 0;
LABEL_29:
      __int16 v35 = 0;
      goto LABEL_38;
    }
    if ([v17 count] != 2)
    {
      int v25 = v82;
      [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Unexpected number of frame transforms" object:v82];
      BOOL v27 = 0;
      __int16 v35 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      v24 = v83;
      goto LABEL_38;
    }
    CMTime v36 = (void *)[v10 copy];
    if (v12 == 3)
    {
      uint64_t v37 = [v10 videoFrames];
      id v38 = [v37 objectForKeyedSubscript:@"primary"];

      if (!v38)
      {
        *a5 = [MEMORY[0x1E4F7A438] missingError:@"Missing primary video frame" object:v10];

        BOOL v27 = 0;
        __int16 v35 = 0;
        int v25 = v82;
        v24 = v83;
        goto LABEL_38;
      }
      v98 = @"video";
      v99 = v38;
      int v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v99 forKeys:&v98 count:1];
      [v36 setVideoFrames:v39];
    }
    id v40 = [v17 objectAtIndexedSubscript:1];
    CFDictionaryRef v41 = [v40 objectForKeyedSubscript:@"frameTransform_rawTime"];
    CMTimeMakeFromDictionary(&v90, v41);
    CMTime v89 = v90;
    [v36 setTime:&v89];

    v24 = v83;
    uint64_t v42 = [v83 nodeByReplayingAgainstCache:v8 pipelineState:v36 error:a5];
    if (!v42)
    {

      BOOL v27 = 0;
      __int16 v35 = 0;
      int v25 = v82;
      goto LABEL_38;
    }
    id v79 = v36;
    v80 = (void *)v42;
    CMTime v43 = (void *)[v10 copy];
    int v25 = v82;
    CMTimeRange v78 = v43;
    if (v12 == 3)
    {
      CMTime v44 = [v10 videoFrames];
      v45 = [v44 objectForKeyedSubscript:@"secondary"];

      if (!v45)
      {
        v54 = NULogger_14487();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v104 = 138412290;
          *(void *)&v104[4] = v10;
          _os_log_error_impl(&dword_1A9680000, v54, OS_LOG_TYPE_ERROR, "Missing secondary video frame %@", v104, 0xCu);
        }

        id v88 = 0;
        v49 = [(PIAutoLoopStabVideoNode *)self _evaluateImageGeometry:&v88];
        id v55 = (objc_class *)MEMORY[0x1E4F7A3D0];
        id v56 = v88;
        id v57 = [v55 alloc];
        id v58 = (void *)MEMORY[0x1E4F1E050];
        v59 = [MEMORY[0x1E4F1E008] redColor];
        v60 = [v58 imageWithColor:v59];
        [v49 scaledExtent];
        v61 = objc_msgSend(v60, "imageByCroppingToRect:");
        uint64_t v62 = [v49 orientation];
        __int16 v35 = (void *)[v57 initWithImage:v61 settings:MEMORY[0x1E4F1CC08] orientation:v62];

        uint64_t v63 = [v10 evaluationMode];
        [v35 setEvaluatedForMode:v63];
        BOOL v27 = 0;
        char v53 = 0;
        int v25 = v82;
        v24 = v83;
        goto LABEL_36;
      }
      v96 = @"video";
      v97 = v45;
      uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
      [v43 setVideoFrames:v46];
    }
    v47 = [v84 objectAtIndexedSubscript:0];
    CFDictionaryRef v48 = [v47 objectForKeyedSubscript:@"frameTransform_rawTime"];
    CMTimeMakeFromDictionary(&v87, v48);
    CMTime v86 = v87;
    [v43 setTime:&v86];

    v49 = [v83 nodeByReplayingAgainstCache:v8 pipelineState:v43 error:a5];
    if (v49)
    {
      BOOL v50 = [PIAutoLoopFrameNode alloc];
      v94[0] = @"primary";
      v94[1] = @"secondary";
      BOOL v51 = v80;
      v95[0] = v80;
      v95[1] = v49;
      v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:2];
      BOOL v27 = [(NURenderNode *)v50 initWithSettings:v18 inputs:v52];

      __int16 v35 = 0;
      char v53 = 1;
      goto LABEL_37;
    }
    BOOL v27 = 0;
    char v53 = 0;
    __int16 v35 = 0;
LABEL_36:
    BOOL v51 = v80;
LABEL_37:

    if ((v53 & 1) == 0) {
      goto LABEL_38;
    }
    goto LABEL_13;
  }
  __int16 v35 = 0;
LABEL_39:

LABEL_40:
  return v35;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v10.receiver = self;
  v10.super_class = (Class)PIAutoLoopStabVideoNode;
  uint64_t v7 = [(NURenderNode *)&v10 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];
  id v8 = (void *)v7;
  if (v7) {
    objc_storeStrong((id *)(v7 + 168), self->_bakedRecipe);
  }
  return v8;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return 1;
}

- (PIAutoLoopStabVideoNode)initWithInput:(id)a3 settings:(id)a4 bakedRecipe:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = (NSDictionary *)a5;
  uint64_t v17 = *MEMORY[0x1E4F1E480];
  v18[0] = a3;
  id v9 = (void *)MEMORY[0x1E4F1C9E8];
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v9 dictionaryWithObjects:v18 forKeys:&v17 count:1];
  v16.receiver = self;
  v16.super_class = (Class)PIAutoLoopStabVideoNode;
  uint64_t v13 = [(NURenderNode *)&v16 initWithSettings:v10 inputs:v12];

  bakedRecipe = v13->_bakedRecipe;
  v13->_bakedRecipe = v8;

  return v13;
}

- (PIAutoLoopStabVideoNode)initWithSettings:(id)a3 inputs:(id)a4
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
      id v11 = NSString;
      uint64_t v12 = v10;
      uint64_t v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      id v15 = NSStringFromSelector(a2);
      objc_super v16 = [v11 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v14, v15];
      *(_DWORD *)CMTime buf = 138543362;
      uint64_t v31 = v16;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v17 = *v8;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v17 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_14431);
        }
LABEL_7:
        os_log_t v18 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = (void *)MEMORY[0x1E4F29060];
          id v20 = v18;
          id v21 = [v19 callStackSymbols];
          v22 = [v21 componentsJoinedByString:@"\n"];
          *(_DWORD *)CMTime buf = 138543362;
          uint64_t v31 = v22;
          _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v17 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_14431);
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
      id v20 = v23;
      BOOL v27 = [v25 callStackSymbols];
      id v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543618;
      uint64_t v31 = specific;
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
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_14431);
  }
}

+ (id)nodeWithInput:(id)a3 recipe:(id)a4 error:(id *)a5
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F7A428]);
  objc_msgSend(v7, "nu_updateDigest:", v8);
  os_log_t v23 = [v8 stringValue];
  id v9 = [v6 videoProperties:a5];
  id v10 = v9;
  if (v9)
  {
    [v9 cleanAperture];
    v27[0] = v23;
    v26[0] = @"recipeDigest";
    v26[1] = @"cleanAperture";
    v24[0] = @"x";
    id v11 = [NSNumber numberWithInteger:0];
    v25[0] = v11;
    v24[1] = @"y";
    uint64_t v12 = [NSNumber numberWithInteger:0];
    v25[1] = v12;
    v24[2] = @"w";
    uint64_t v13 = [NSNumber numberWithInteger:0];
    v25[2] = v13;
    v24[3] = @"h";
    v14 = [NSNumber numberWithInteger:0];
    v25[3] = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
    v27[1] = v15;
    objc_super v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

    uint64_t v17 = PIAutoLoopRecipeForFlavor(v7, 3);
    os_log_t v18 = (void *)[v17 copy];

    uint64_t v19 = (void *)[objc_alloc((Class)a1) initWithInput:v6 settings:v16 bakedRecipe:v18];
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

@end