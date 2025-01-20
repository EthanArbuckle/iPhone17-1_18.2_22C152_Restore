@interface PIAutoLoopVideoNode
+ (id)loopParamsForTrimRange:(id *)a3 frameDuration:(id *)a4;
+ (int)fadeLengthForTrimRange:(id *)a3 frameDuration:(id *)a4;
+ (int)loopPeriodForTrimRange:(id *)a3 frameDuration:(id *)a4;
+ (int)loopStartForTrimRange:(id *)a3 frameDuration:(id *)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fadeDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fadeStartTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)loopDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime;
- (BOOL)requiresAudioMix;
- (BOOL)requiresVideoComposition;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NURenderNode)input;
- (PIAutoLoopVideoNode)initWithInput:(id)a3 frameDuration:(id *)a4 trimRange:(id *)a5 settings:(id)a6;
- (PIAutoLoopVideoNode)initWithSettings:(id)a3 inputs:(id)a4;
- (id)_evaluateAudioMix:(id *)a3;
- (id)_evaluateVideo:(id *)a3;
- (id)_evaluateVideoComposition:(id *)a3;
- (id)_evaluateVideoProperties:(id *)a3;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (int)fadeLength;
- (int)loopPeriod;
- (int)loopStart;
@end

@implementation PIAutoLoopVideoNode

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[7].var2;
  retstr->var3 = *(int64_t *)((char *)&self[8].var0 + 4);
  return self;
}

- (int)fadeLength
{
  return self->_fadeLength;
}

- (int)loopPeriod
{
  return self->_loopPeriod;
}

- (int)loopStart
{
  return self->_loopStart;
}

- (id)_evaluateAudioMix:(id *)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v28 = NUAssertLogger_26951();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      LODWORD(v52.value) = 138543362;
      *(CMTimeValue *)((char *)&v52.value + 4) = (CMTimeValue)v29;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v52, 0xCu);
    }
    v30 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v32 = NUAssertLogger_26951();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        v36 = dispatch_get_specific(*v30);
        v37 = (void *)MEMORY[0x1E4F29060];
        id v38 = v36;
        v39 = [v37 callStackSymbols];
        v40 = [v39 componentsJoinedByString:@"\n"];
        LODWORD(v52.value) = 138543618;
        *(CMTimeValue *)((char *)&v52.value + 4) = (CMTimeValue)v36;
        LOWORD(v52.flags) = 2114;
        *(void *)((char *)&v52.flags + 2) = v40;
        _os_log_error_impl(&dword_1A9680000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v52, 0x16u);
      }
    }
    else if (v33)
    {
      v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      v35 = [v34 componentsJoinedByString:@"\n"];
      LODWORD(v52.value) = 138543362;
      *(CMTimeValue *)((char *)&v52.value + 4) = (CMTimeValue)v35;
      _os_log_error_impl(&dword_1A9680000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v52, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v4 = [(NURenderNode *)self outputVideo:"outputVideo:"];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 tracksWithMediaType:*MEMORY[0x1E4F15BA8]];
    if ((unint64_t)[v6 count] > 1)
    {
      v8 = (void *)MEMORY[0x1E4F16588];
      v9 = [v6 objectAtIndexedSubscript:0];
      v10 = [v8 audioMixInputParametersWithTrack:v9];

      v11 = (void *)MEMORY[0x1E4F16588];
      int v12 = 1;
      v13 = [v6 objectAtIndexedSubscript:1];
      v14 = [v11 audioMixInputParametersWithTrack:v13];

      CMTime v52 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      long long v41 = *(_OWORD *)&v52.value;
      CMTimeEpoch epoch = v52.epoch;
      objc_msgSend(v10, "setVolume:atTime:", &v52, COERCE_DOUBLE(__PAIR64__(HIDWORD(v52.value), 1.0)));
      *(_OWORD *)&v52.value = v41;
      v52.CMTimeEpoch epoch = epoch;
      [v14 setVolume:&v52 atTime:0.0];
      memset(&v52, 0, sizeof(v52));
      [(PIAutoLoopVideoNode *)self loopDuration];
      [(PIAutoLoopVideoNode *)self fadeDuration];
      CMTimeSubtract(&v52, &lhs, &rhs);
      CMTime v48 = v52;
      memset(&v47, 0, sizeof(v47));
      [(PIAutoLoopVideoNode *)self fadeDuration];
      CMTimeMultiplyByRatio(&v47, &time, 1, 20);
      do
      {
        __double2 v16 = __sincos_stret((float)((float)(v12 - 1) / 20.0) * 1.57079633);
        float cosval = v16.__cosval;
        __double2 v18 = __sincos_stret((float)((float)v12 / 20.0) * 1.57079633);
        float v19 = v18.__cosval;
        float sinval = v18.__sinval;
        CMTime start = v48;
        CMTime duration = v47;
        CMTimeRangeMake(&v45, &start, &duration);
        *(float *)&double v22 = cosval;
        *(float *)&double v23 = v19;
        [v10 setVolumeRampFromStartVolume:&v45 toEndVolume:v22 timeRange:v23];
        CMTime start = v48;
        CMTime duration = v47;
        CMTimeRangeMake(&v42, &start, &duration);
        float v20 = v16.__sinval;
        *(float *)&double v24 = v20;
        *(float *)&double v25 = sinval;
        [v14 setVolumeRampFromStartVolume:&v42 toEndVolume:v24 timeRange:v25];
        CMTime start = v48;
        CMTime duration = v47;
        CMTimeAdd(&v48, &start, &duration);
        ++v12;
      }
      while (v12 != 21);
      v7 = [MEMORY[0x1E4F16580] audioMix];
      v51[0] = v10;
      v51[1] = v14;
      v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
      [v7 setInputParameters:v26];
    }
    else
    {
      v7 = [MEMORY[0x1E4F16580] audioMix];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)requiresAudioMix
{
  return 1;
}

- (id)_evaluateVideoComposition:(id *)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v29 = NUAssertLogger_26951();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      LODWORD(v60.value) = 138543362;
      *(CMTimeValue *)((char *)&v60.value + 4) = (CMTimeValue)v30;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v60, 0xCu);
    }
    v31 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v33 = NUAssertLogger_26951();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v34)
      {
        v37 = dispatch_get_specific(*v31);
        id v38 = (void *)MEMORY[0x1E4F29060];
        id v39 = v37;
        v40 = [v38 callStackSymbols];
        long long v41 = [v40 componentsJoinedByString:@"\n"];
        LODWORD(v60.value) = 138543618;
        *(CMTimeValue *)((char *)&v60.value + 4) = (CMTimeValue)v37;
        LOWORD(v60.flags) = 2114;
        *(void *)((char *)&v60.flags + 2) = v41;
        _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v60, 0x16u);
      }
    }
    else if (v34)
    {
      v35 = [MEMORY[0x1E4F29060] callStackSymbols];
      v36 = [v35 componentsJoinedByString:@"\n"];
      LODWORD(v60.value) = 138543362;
      *(CMTimeValue *)((char *)&v60.value + 4) = (CMTimeValue)v36;
      _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v60, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = [(NURenderNode *)self outputVideo:"outputVideo:"];
  v6 = v5;
  if (!v5)
  {
    id v25 = 0;
    goto LABEL_12;
  }
  v7 = [v5 tracksWithMediaType:*MEMORY[0x1E4F15C18]];
  v8 = [(NURenderNode *)self inputs];
  v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

  v10 = [v9 outputVideoComposition:a3];
  v11 = v10;
  if (v10)
  {
    int v12 = [v10 instructions];
    uint64_t v13 = [v12 count];

    if (v13 == 1)
    {
      v44 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
      v14 = [v7 objectAtIndexedSubscript:0];
      id v15 = objc_alloc_init(MEMORY[0x1E4F7A6E0]);
      memset(&v60, 0, sizeof(v60));
      [(PIAutoLoopVideoNode *)self loopDuration];
      [(PIAutoLoopVideoNode *)self fadeDuration];
      CMTimeSubtract(&v60, &lhs, &rhs);
      CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      CMTime duration = v60;
      CMTimeRangeMake(&v55, &start, &duration);
      CMTimeRange v52 = v55;
      [v15 setTimeRange:&v52];
      __double2 v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v14, "trackID"));
      v59 = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
      [v15 setRequiredSourceTrackIDs:v17];

      v43 = v14;
      __double2 v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v14, "trackID"));
      [v15 setSourceIdentifier:@"primary" forTrackID:v18];

      [v44 addObject:v15];
      if ([v7 count] == 2)
      {
        CMTimeRange v42 = [v7 objectAtIndexedSubscript:1];
        id v19 = objc_alloc_init(MEMORY[0x1E4F7A6E0]);
        [(PIAutoLoopVideoNode *)self fadeDuration];
        CMTime start = v60;
        CMTimeRangeMake(&v51, &start, &v50);
        CMTimeRange v49 = v51;
        [v19 setTimeRange:&v49];
        float v20 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v14, "trackID"));
        v58[0] = v20;
        v21 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v42, "trackID"));
        v58[1] = v21;
        double v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
        [v19 setRequiredSourceTrackIDs:v22];

        double v23 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v43, "trackID"));
        [v19 setSourceIdentifier:@"primary" forTrackID:v23];

        double v24 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v42, "trackID"));
        [v19 setSourceIdentifier:@"secondary" forTrackID:v24];

        [v44 addObject:v19];
      }
      id v25 = objc_alloc_init(MEMORY[0x1E4F165B0]);
      [(PIAutoLoopVideoNode *)self frameDuration];
      long long v45 = v47;
      uint64_t v46 = v48;
      [v25 setFrameDuration:&v45];
      [v25 setInstructions:v44];

      goto LABEL_11;
    }
    v26 = (void *)MEMORY[0x1E4F7A438];
    v27 = [v11 instructions];
    *a3 = [v26 unsupportedError:@"Unsupported video configuration" object:v27];
  }
  id v25 = 0;
LABEL_11:

LABEL_12:
  return v25;
}

- (BOOL)requiresVideoComposition
{
  return 1;
}

- (id)_evaluateVideo:(id *)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v30 = NUAssertLogger_26951();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      LODWORD(v73.start.value) = 138543362;
      *(CMTimeValue *)((char *)&v73.start.value + 4) = (CMTimeValue)v31;
      _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v73, 0xCu);
    }
    v32 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v34 = NUAssertLogger_26951();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v35)
      {
        id v38 = dispatch_get_specific(*v32);
        id v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        long long v41 = [v39 callStackSymbols];
        CMTimeRange v42 = [v41 componentsJoinedByString:@"\n"];
        LODWORD(v73.start.value) = 138543618;
        *(CMTimeValue *)((char *)&v73.start.value + 4) = (CMTimeValue)v38;
        LOWORD(v73.start.flags) = 2114;
        *(void *)((char *)&v73.start.flags + 2) = v42;
        _os_log_error_impl(&dword_1A9680000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v73, 0x16u);
      }
    }
    else if (v35)
    {
      v36 = [MEMORY[0x1E4F29060] callStackSymbols];
      v37 = [v36 componentsJoinedByString:@"\n"];
      LODWORD(v73.start.value) = 138543362;
      *(CMTimeValue *)((char *)&v73.start.value + 4) = (CMTimeValue)v37;
      _os_log_error_impl(&dword_1A9680000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v73, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = [(PIAutoLoopVideoNode *)self input];
  v6 = [v5 outputVideo:a3];

  if (!v6)
  {
    id v20 = 0;
    goto LABEL_35;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F16590]);
  if (v7)
  {
    v8 = [MEMORY[0x1E4F7A718] firstEnabledVideoTrackInAsset:v6 error:a3];
    if (!v8)
    {
      id v20 = 0;
LABEL_33:

      goto LABEL_34;
    }
    uint64_t v47 = *MEMORY[0x1E4F15BA8];
    v9 = objc_msgSend(v6, "tracksWithMediaType:");
    v10 = [v9 firstObject];

    uint64_t v11 = *MEMORY[0x1E4F15C18];
    int v12 = [v7 addMutableTrackWithMediaType:*MEMORY[0x1E4F15C18] preferredTrackID:0];
    memset(&v73, 0, sizeof(v73));
    [(PIAutoLoopVideoNode *)self startTime];
    [(PIAutoLoopVideoNode *)self loopDuration];
    CMTimeRangeMake(&v73, &start, &duration);
    memset(&v70[48], 0, 48);
    uint64_t v13 = (void *)MEMORY[0x1E4F7A718];
    [v8 timeRange];
    CMTimeRange v69 = v73;
    [v13 conformRange:&v69 inRange:v70];
    id v68 = 0;
    CMTimeRange v69 = *(CMTimeRange *)&v70[48];
    long long v44 = *MEMORY[0x1E4F1FA48];
    *(_OWORD *)&time1.start.value = *MEMORY[0x1E4F1FA48];
    CMTimeEpoch v14 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    time1.start.CMTimeEpoch epoch = v14;
    uint64_t v48 = v12;
    LOBYTE(v13) = [v12 insertTimeRange:&v69 ofTrack:v8 atTime:&time1 error:&v68];
    id v15 = v68;
    if ((v13 & 1) == 0)
    {
      [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to update video track #1" object:self underlyingError:v15];
      id v20 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:
      v28 = v48;
      goto LABEL_32;
    }
    if (!v10) {
      goto LABEL_18;
    }
    uint64_t v43 = v11;
    __double2 v16 = [v7 addMutableTrackWithMediaType:v47 preferredTrackID:2];
    memset(&v69, 0, sizeof(v69));
    v17 = (void *)MEMORY[0x1E4F7A718];
    [v10 timeRange];
    CMTimeRange time1 = v73;
    [v17 conformRange:&time1 inRange:v67];
    id v65 = v15;
    CMTimeRange time1 = v69;
    *(_OWORD *)&time2.start.value = v44;
    time2.start.CMTimeEpoch epoch = v14;
    long long v45 = v16;
    LOBYTE(v17) = [v16 insertTimeRange:&time1 ofTrack:v10 atTime:&time2 error:&v65];
    id v18 = v65;

    if (v17)
    {
      time1.CMTime start = v69.duration;
      time2.CMTime start = *(CMTime *)&v70[72];
      if ((CMTimeCompare(&time1.start, &time2.start) & 0x80000000) == 0)
      {
        id v15 = v18;
        uint64_t v11 = v43;
        id v19 = v45;
LABEL_17:

LABEL_18:
        if ([(PIAutoLoopVideoNode *)self fadeLength] < 1)
        {
          v28 = v48;
LABEL_27:
          id v20 = v7;
LABEL_32:

          goto LABEL_33;
        }
        uint64_t v22 = [v7 addMutableTrackWithMediaType:v11 preferredTrackID:1];
        [(PIAutoLoopVideoNode *)self fadeStartTime];
        [(PIAutoLoopVideoNode *)self fadeDuration];
        CMTimeRangeMake(&v69, &v56, &v55);
        CMTimeRange v73 = v69;
        double v23 = (void *)MEMORY[0x1E4F7A718];
        [v8 timeRange];
        CMTimeRange time1 = v73;
        [v23 conformRange:&time1 inRange:v54];
        *(CMTimeRange *)&v70[48] = v69;
        memset(&time2, 0, 24);
        [(PIAutoLoopVideoNode *)self loopDuration];
        [(PIAutoLoopVideoNode *)self fadeDuration];
        CMTimeSubtract(&time2.start, &v53, &rhs);
        id v51 = v15;
        CMTimeRange v69 = *(CMTimeRange *)&v70[48];
        *(_OWORD *)&time1.start.value = *(_OWORD *)&time2.start.value;
        time1.start.CMTimeEpoch epoch = time2.start.epoch;
        uint64_t v46 = (void *)v22;
        LOBYTE(v22) = [(id)v22 insertTimeRange:&v69 ofTrack:v8 atTime:&time1 error:&v51];
        id v24 = v51;

        if (v22)
        {
          if (!v10)
          {
            id v15 = v24;
            goto LABEL_26;
          }
          id v25 = [v7 addMutableTrackWithMediaType:v47 preferredTrackID:3];
          memset(&v69, 0, sizeof(v69));
          v26 = (void *)MEMORY[0x1E4F7A718];
          [v10 timeRange];
          CMTimeRange time1 = v73;
          [v26 conformRange:&time1 inRange:v50];
          id v49 = v24;
          CMTimeRange time1 = v69;
          CMTime v64 = time2.start;
          char v27 = [v25 insertTimeRange:&time1 ofTrack:v10 atTime:&v64 error:&v49];
          id v15 = v49;

          if (v27)
          {

LABEL_26:
            v28 = v48;

            goto LABEL_27;
          }
          *a3 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to update audio track #2" object:self underlyingError:v15];
        }
        else
        {
          *a3 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to update video track #2" object:self underlyingError:v24];
          id v15 = v24;
        }

        goto LABEL_30;
      }
      memset(&v64, 0, sizeof(v64));
      time1.CMTime start = *(CMTime *)&v70[72];
      time2.CMTime start = v69.duration;
      CMTimeSubtract(&v64, &time1.start, &time2.start);
      memset(&v63, 0, sizeof(v63));
      [(PIAutoLoopVideoNode *)self startTime];
      time1.CMTime start = v64;
      CMTimeSubtract(&v63, &lhs, &time1.start);
      memset(&time1, 0, sizeof(time1));
      v21 = (void *)MEMORY[0x1E4F7A718];
      time2.CMTime start = v63;
      CMTime v60 = v64;
      CMTimeRangeMake(&v61, &time2.start, &v60);
      [v10 timeRange];
      [v21 conformRange:&v61 inRange:v59];
      id v58 = v18;
      CMTimeRange time2 = time1;
      CMTime v60 = v69.duration;
      id v19 = v45;
      LOBYTE(v21) = [v45 insertTimeRange:&time2 ofTrack:v10 atTime:&v60 error:&v58];
      id v15 = v58;

      uint64_t v11 = v43;
      if (v21) {
        goto LABEL_17;
      }
      *a3 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to update audio track #1" object:self underlyingError:v15];
    }
    else
    {
      *a3 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to update audio track #1" object:self underlyingError:v18];
      id v15 = v18;
      id v19 = v45;
    }

LABEL_30:
    id v20 = 0;
    goto LABEL_31;
  }
  [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"[[AVMutableComposition alloc] init] failed." object:self];
  id v20 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_34:

LABEL_35:
  return v20;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  v79[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    id v39 = NUAssertLogger_26951();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      id v40 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v40;
      _os_log_error_impl(&dword_1A9680000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    long long v41 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v43 = NUAssertLogger_26951();
    BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v44)
      {
        uint64_t v47 = dispatch_get_specific(*v41);
        uint64_t v48 = (void *)MEMORY[0x1E4F29060];
        id v49 = v47;
        CMTime v50 = [v48 callStackSymbols];
        id v51 = [v50 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v47;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v51;
        _os_log_error_impl(&dword_1A9680000, v43, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v44)
    {
      long long v45 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v46 = [v45 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v46;
      _os_log_error_impl(&dword_1A9680000, v43, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v10 = v9;
  uint64_t v11 = [v9 evaluationMode];
  if ((v11 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    v70.receiver = self;
    v70.super_class = (Class)PIAutoLoopVideoNode;
    id v17 = [(NURenderNode *)&v70 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];
    goto LABEL_31;
  }
  uint64_t v12 = v11;
  uint64_t v13 = (void *)[v10 copy];
  if (v12 != 3)
  {
LABEL_6:
    [(PIAutoLoopVideoNode *)self startTime];
    if (v10) {
      [v10 time];
    }
    else {
      memset(&rhs, 0, sizeof(rhs));
    }
    CMTimeAdd(&v69, &lhs, &rhs);
    CMTime v66 = v69;
    [v13 setTime:&v66];
    id v18 = [(PIAutoLoopVideoNode *)self input];
    id v19 = [v18 nodeByReplayingAgainstCache:v8 pipelineState:v13 error:a5];

    if (!v19)
    {
      id v17 = 0;
LABEL_29:

      goto LABEL_30;
    }
    memset(buf, 0, sizeof(buf));
    if (v10)
    {
      [v10 time];
      uint64_t v63 = 0;
      uint64_t v64 = 0;
      uint64_t v65 = 0;
      [(PIAutoLoopVideoNode *)self frameDuration];
      [v10 time];
      uint64_t v20 = v60;
      uint64_t v21 = *(int *)&buf[8];
    }
    else
    {
      uint64_t v63 = 0;
      uint64_t v64 = 0;
      uint64_t v65 = 0;
      [(PIAutoLoopVideoNode *)self frameDuration];
      uint64_t v21 = 0;
      uint64_t v20 = 0;
      uint64_t v60 = 0;
      uint64_t v61 = 0;
      uint64_t v62 = 0;
    }
    int v22 = (int)(v20 * (int)v64 / (v63 * v21)) % [(PIAutoLoopVideoNode *)self loopPeriod];
    int v23 = [(PIAutoLoopVideoNode *)self fadeLength] + v22;
    if (v23 < [(PIAutoLoopVideoNode *)self loopPeriod])
    {
      id v17 = v19;
      goto LABEL_29;
    }
    int v24 = [(PIAutoLoopVideoNode *)self loopPeriod];
    int v53 = [(PIAutoLoopVideoNode *)self fadeLength];
    id v25 = (void *)[v10 copy];
    if (v12 == 3)
    {
      int v52 = v24;
      v26 = [v10 videoFrames];
      char v27 = [v26 objectForKeyedSubscript:@"secondary"];

      if (!v27)
      {
        [MEMORY[0x1E4F7A438] missingError:@"Missing secondary video frame" object:v10];
        id v17 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

        goto LABEL_29;
      }
      v75 = @"video";
      v76 = v27;
      v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
      [v25 setVideoFrames:v28];

      int v24 = v52;
    }
    [(PIAutoLoopVideoNode *)self startTime];
    [(PIAutoLoopVideoNode *)self loopDuration];
    if (v10) {
      [v10 time];
    }
    else {
      memset(&v55, 0, sizeof(v55));
    }
    CMTimeSubtract(&v57, &v56, &v55);
    CMTimeSubtract(&v59, &v58, &v57);
    CMTime v54 = v59;
    [v25 setTime:&v54];
    v29 = [(PIAutoLoopVideoNode *)self input];
    v30 = [v29 nodeByReplayingAgainstCache:v8 pipelineState:v25 error:a5];

    if (v30)
    {
      id v31 = objc_alloc(MEMORY[0x1E4F7A460]);
      uint64_t v73 = *MEMORY[0x1E4F1E500];
      *(float *)&double v32 = 1.0 - (float)((float)(v24 - v22) / (float)v53);
      BOOL v33 = [NSNumber numberWithFloat:v32];
      uint64_t v74 = v33;
      BOOL v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
      uint64_t v35 = *MEMORY[0x1E4F1E4F8];
      v71[0] = *MEMORY[0x1E4F1E480];
      v71[1] = v35;
      v72[0] = v19;
      v72[1] = v30;
      v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:2];
      v37 = (void *)[v31 initWithFilterName:@"CIDissolveTransition" settings:v34 inputs:v36];

      id v17 = [MEMORY[0x1E4F7A610] nodeFromCache:v37 cache:v8];
      objc_msgSend(v17, "setEvaluatedForMode:", objc_msgSend(v10, "evaluationMode"));
    }
    else
    {
      id v17 = 0;
    }

    goto LABEL_28;
  }
  CMTimeEpoch v14 = [v10 videoFrames];
  id v15 = [v14 objectForKeyedSubscript:@"primary"];

  if (v15)
  {
    v78 = @"video";
    v79[0] = v15;
    __double2 v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:&v78 count:1];
    [v13 setVideoFrames:v16];

    goto LABEL_6;
  }
  [MEMORY[0x1E4F7A438] missingError:@"Missing primary video frame" object:v10];
  id v17 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

LABEL_31:
  return v17;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v10.receiver = self;
  v10.super_class = (Class)PIAutoLoopVideoNode;
  uint64_t v7 = [(NURenderNode *)&v10 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];
  long long v8 = *(_OWORD *)(&self->_fadeLength + 1);
  *(void *)(v7 + 196) = *(void *)&self->_frameDuration.flags;
  *(_OWORD *)(v7 + 180) = v8;
  *(_DWORD *)(v7 + 168) = self->_loopStart;
  *(_DWORD *)(v7 + 172) = self->_loopPeriod;
  *(_DWORD *)(v7 + 176) = self->_fadeLength;
  return (id)v7;
}

- (id)_evaluateVideoProperties:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v6 = NUAssertLogger_26951();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      int v23 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    long long v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    objc_super v10 = NUAssertLogger_26951();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        CMTimeEpoch v14 = dispatch_get_specific(*v8);
        id v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        id v17 = [v15 callStackSymbols];
        id v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        int v23 = v14;
        __int16 v24 = 2114;
        id v25 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      int v23 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v21.receiver = self;
  v21.super_class = (Class)PIAutoLoopVideoNode;
  v3 = -[NURenderNode _evaluateVideoProperties:](&v21, sel__evaluateVideoProperties_);
  if (v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F7A740]) initWithProperties:v3];
    long long v19 = *MEMORY[0x1E4F1F9F8];
    uint64_t v20 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    [v4 setLivePhotoKeyFrameTime:&v19];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return 1;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fadeStartTime
{
  [(PIAutoLoopVideoNode *)self frameDuration];
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMultiply((CMTime *)retstr, &time, [(PIAutoLoopVideoNode *)self loopStart]);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fadeDuration
{
  [(PIAutoLoopVideoNode *)self frameDuration];
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMultiply((CMTime *)retstr, &time, [(PIAutoLoopVideoNode *)self fadeLength]);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime
{
  [(PIAutoLoopVideoNode *)self frameDuration];
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMultiply((CMTime *)retstr, &time, [(PIAutoLoopVideoNode *)self fadeLength]+ [(PIAutoLoopVideoNode *)self loopStart]);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)loopDuration
{
  [(PIAutoLoopVideoNode *)self frameDuration];
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMultiply((CMTime *)retstr, &time, [(PIAutoLoopVideoNode *)self loopPeriod]);
}

- (NURenderNode)input
{
  v2 = [(NURenderNode *)self inputs];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

  return (NURenderNode *)v3;
}

- (PIAutoLoopVideoNode)initWithInput:(id)a3 frameDuration:(id *)a4 trimRange:(id *)a5 settings:(id)a6
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if (!v10)
  {
    id v25 = NUAssertLogger_26951();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      *(_DWORD *)CMTime time = 138543362;
      *(void *)&time[4] = v26;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", time, 0xCu);
    }
    char v27 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v29 = NUAssertLogger_26951();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v30)
      {
        uint64_t v43 = dispatch_get_specific(*v27);
        BOOL v44 = (void *)MEMORY[0x1E4F29060];
        id v45 = v43;
        char v27 = [v44 callStackSymbols];
        uint64_t v46 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime time = 138543618;
        *(void *)&time[4] = v43;
        *(_WORD *)&time[12] = 2114;
        *(void *)&time[14] = v46;
        _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", time, 0x16u);
      }
    }
    else if (v30)
    {
      id v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      char v27 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime time = 138543362;
      *(void *)&time[4] = v27;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", time, 0xCu);
    }
    int v35 = _NUAssertFailHandler();
    goto LABEL_28;
  }
  if ((a4->var2 & 1) == 0)
  {
    double v32 = NUAssertLogger_26951();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      BOOL v33 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "CMTIME_IS_VALID(frameDuration)");
      *(_DWORD *)CMTime time = 138543362;
      *(void *)&time[4] = v33;
      _os_log_error_impl(&dword_1A9680000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", time, 0xCu);
    }
    char v27 = (const void **)MEMORY[0x1E4F7A308];
    BOOL v34 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v29 = NUAssertLogger_26951();
    int v35 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (!v34)
    {
      if (v35)
      {
        v36 = [MEMORY[0x1E4F29060] callStackSymbols];
        char v27 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime time = 138543362;
        *(void *)&time[4] = v27;
        _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", time, 0xCu);
      }
LABEL_30:

      int v40 = _NUAssertFailHandler();
      goto LABEL_31;
    }
LABEL_28:
    if (v35)
    {
      uint64_t v47 = dispatch_get_specific(*v27);
      uint64_t v48 = (void *)MEMORY[0x1E4F29060];
      id v49 = v47;
      char v27 = [v48 callStackSymbols];
      CMTime v50 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime time = 138543618;
      *(void *)&time[4] = v47;
      *(_WORD *)&time[12] = 2114;
      *(void *)&time[14] = v50;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", time, 0x16u);
    }
    goto LABEL_30;
  }
  uint64_t v12 = v11;
  if (!v11)
  {
    v37 = NUAssertLogger_26951();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      id v38 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "loopParams != nil");
      *(_DWORD *)CMTime time = 138543362;
      *(void *)&time[4] = v38;
      _os_log_error_impl(&dword_1A9680000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", time, 0xCu);
    }
    char v27 = (const void **)MEMORY[0x1E4F7A308];
    id v39 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v29 = NUAssertLogger_26951();
    int v40 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (!v39)
    {
      if (v40)
      {
        long long v41 = [MEMORY[0x1E4F29060] callStackSymbols];
        CMTimeRange v42 = [v41 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime time = 138543362;
        *(void *)&time[4] = v42;
        _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", time, 0xCu);
      }
      goto LABEL_33;
    }
LABEL_31:
    if (v40)
    {
      id v51 = dispatch_get_specific(*v27);
      int v52 = (void *)MEMORY[0x1E4F29060];
      id v53 = v51;
      CMTime v54 = [v52 callStackSymbols];
      CMTime v55 = [v54 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime time = 138543618;
      *(void *)&time[4] = v51;
      *(_WORD *)&time[12] = 2114;
      *(void *)&time[14] = v55;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", time, 0x16u);
    }
LABEL_33:

    _NUAssertFailHandler();
  }
  if ((a5->var0.var2 & 1) != 0
    && (a5->var1.var2 & 1) != 0
    && !a5->var1.var3
    && (a5->var1.var0 & 0x8000000000000000) == 0)
  {
    uint64_t v13 = objc_opt_class();
    long long v14 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)CMTime time = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&time[16] = v14;
    long long v62 = *(_OWORD *)&a5->var1.var1;
    long long v57 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    uint64_t v15 = [v13 loopParamsForTrimRange:time frameDuration:&v57];

    uint64_t v12 = (void *)v15;
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v16 setObject:v12 forKeyedSubscript:@"loopParams"];
  *(_OWORD *)CMTime time = *(_OWORD *)&a4->var0;
  *(void *)&time[16] = a4->var3;
  CFDictionaryRef v17 = CMTimeCopyAsDictionary((CMTime *)time, 0);
  [v16 setObject:v17 forKeyedSubscript:@"frameDuration"];

  uint64_t v59 = *MEMORY[0x1E4F1E480];
  id v60 = v10;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
  v56.receiver = self;
  v56.super_class = (Class)PIAutoLoopVideoNode;
  long long v19 = [(NURenderNode *)&v56 initWithSettings:v16 inputs:v18];

  int64_t v20 = a4->var3;
  *(_OWORD *)(v19 + 180) = *(_OWORD *)&a4->var0;
  *(void *)(v19 + 196) = v20;
  objc_super v21 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F4F158]];
  *((_DWORD *)v19 + 42) = [v21 intValue];

  int v22 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F4F150]];
  *((_DWORD *)v19 + 43) = [v22 intValue];

  int v23 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F4F148]];
  *((_DWORD *)v19 + 44) = [v23 intValue];

  return (PIAutoLoopVideoNode *)v19;
}

- (PIAutoLoopVideoNode)initWithSettings:(id)a3 inputs:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v8 = (uint64_t *)MEMORY[0x1E4F7A750];
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
      long long v14 = NSStringFromClass(v13);
      uint64_t v15 = NSStringFromSelector(a2);
      id v16 = [v11 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v14, v15];
      *(_DWORD *)buf = 138543362;
      id v31 = v16;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v17 = *v8;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v17 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_26968);
        }
LABEL_7:
        os_log_t v18 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          long long v19 = (void *)MEMORY[0x1E4F29060];
          int64_t v20 = v18;
          objc_super v21 = [v19 callStackSymbols];
          int v22 = [v21 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          id v31 = v22;
          _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v17 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_26968);
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
      id v25 = (void *)MEMORY[0x1E4F29060];
      id v26 = specific;
      int64_t v20 = v23;
      char v27 = [v25 callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      id v31 = specific;
      __int16 v32 = 2114;
      BOOL v33 = v28;
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
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_26968);
  }
}

+ (int)fadeLengthForTrimRange:(id *)a3 frameDuration:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE var1 = a3->var1;
  double v5 = fmin(CMTimeGetSeconds((CMTime *)&var1) * 0.5, 1.0);
  $3CC8671D27C23BF42ADDB32F2B5E48AE var1 = *a4;
  return vcvtmd_s64_f64(v5 / CMTimeGetSeconds((CMTime *)&var1));
}

+ (int)loopPeriodForTrimRange:(id *)a3 frameDuration:(id *)a4
{
  *($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTime time = a3->var1;
  double Seconds = CMTimeGetSeconds((CMTime *)time);
  *($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTime time = *a4;
  unsigned int v8 = vcvtpd_s64_f64(Seconds / CMTimeGetSeconds((CMTime *)time));
  long long v9 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)CMTime time = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&time[16] = v9;
  long long v13 = *(_OWORD *)&a3->var1.var1;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a4;
  return v8 - [a1 fadeLengthForTrimRange:time frameDuration:&v11];
}

+ (int)loopStartForTrimRange:(id *)a3 frameDuration:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE var0 = a3->var0;
  double Seconds = CMTimeGetSeconds((CMTime *)&var0);
  $3CC8671D27C23BF42ADDB32F2B5E48AE var0 = *a4;
  return vcvtmd_s64_f64(Seconds / CMTimeGetSeconds((CMTime *)&var0));
}

+ (id)loopParamsForTrimRange:(id *)a3 frameDuration:(id *)a4
{
  v25[3] = *MEMORY[0x1E4F143B8];
  id v6 = objc_opt_class();
  long long v7 = *(_OWORD *)&a3->var0.var3;
  long long v21 = *(_OWORD *)&a3->var0.var0;
  long long v22 = v7;
  long long v23 = *(_OWORD *)&a3->var1.var1;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v20 = *a4;
  uint64_t v8 = [v6 loopStartForTrimRange:&v21 frameDuration:&v20];
  long long v9 = objc_opt_class();
  long long v10 = *(_OWORD *)&a3->var0.var3;
  long long v21 = *(_OWORD *)&a3->var0.var0;
  long long v22 = v10;
  long long v23 = *(_OWORD *)&a3->var1.var1;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v20 = *a4;
  uint64_t v11 = [v9 loopPeriodForTrimRange:&v21 frameDuration:&v20];
  uint64_t v12 = objc_opt_class();
  long long v13 = *(_OWORD *)&a3->var0.var3;
  long long v21 = *(_OWORD *)&a3->var0.var0;
  long long v22 = v13;
  long long v23 = *(_OWORD *)&a3->var1.var1;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v20 = *a4;
  uint64_t v14 = [v12 fadeLengthForTrimRange:&v21 frameDuration:&v20];
  v24[0] = *MEMORY[0x1E4F4F158];
  uint64_t v15 = [NSNumber numberWithInt:v8];
  v25[0] = v15;
  v24[1] = *MEMORY[0x1E4F4F150];
  id v16 = [NSNumber numberWithInt:v11];
  v25[1] = v16;
  v24[2] = *MEMORY[0x1E4F4F148];
  uint64_t v17 = [NSNumber numberWithInt:v14];
  v25[2] = v17;
  os_log_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];

  return v18;
}

@end