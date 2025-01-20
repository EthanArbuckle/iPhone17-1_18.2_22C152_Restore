@interface PIAutoLoopMirrorVideoNode
+ (int)fadeLengthForTrimRange:(id *)a3 frameDuration:(id *)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_conformTime:(SEL)a3;
- (BOOL)requiresAudioMix;
- (BOOL)requiresVideoComposition;
- (id)_evaluateAudioMix:(id *)a3;
- (id)_evaluateVideo:(id *)a3;
- (id)_evaluateVideoComposition:(id *)a3;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
@end

@implementation PIAutoLoopMirrorVideoNode

- (id)_evaluateAudioMix:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    v4 = (os_log_t *)MEMORY[0x1E4F7A748];
    v5 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      v6 = NSString;
      v7 = v5;
      v8 = [v6 stringWithFormat:@"Mirror does not require an AVAudioMix"];
      int v20 = 138543362;
      v21 = v8;
      _os_log_error_impl(&dword_1A9680000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v20, 0xCu);

      uint64_t v9 = *v3;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v9 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_26968);
        }
LABEL_7:
        os_log_t v10 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
        {
          v11 = (void *)MEMORY[0x1E4F29060];
          v12 = v10;
          v13 = [v11 callStackSymbols];
          v14 = [v13 componentsJoinedByString:@"\n"];
          int v20 = 138543362;
          v21 = v14;
          _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v20, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v9 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_26968);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v15 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v17 = (void *)MEMORY[0x1E4F29060];
      v3 = specific;
      v12 = v15;
      v18 = [v17 callStackSymbols];
      v19 = [v18 componentsJoinedByString:@"\n"];
      int v20 = 138543618;
      v21 = specific;
      __int16 v22 = 2114;
      v23 = v19;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v20, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_26968);
  }
}

- (BOOL)requiresAudioMix
{
  return 0;
}

- (id)_evaluateVideoComposition:(id *)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v4 = [(NURenderNode *)self outputVideo:a3];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 tracksWithMediaType:*MEMORY[0x1E4F15C18]];
    v7 = [v6 objectAtIndexedSubscript:0];
    id v8 = objc_alloc_init(MEMORY[0x1E4F7A6E0]);
    if (v7)
    {
      [v7 timeRange];
    }
    else
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v20 = 0u;
    }
    v19[0] = v20;
    v19[1] = v21;
    v19[2] = v22;
    [v8 setTimeRange:v19];
    os_log_t v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "trackID"));
    v24[0] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    [v8 setRequiredSourceTrackIDs:v11];

    v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "trackID"));
    [v8 setSourceIdentifier:@"video" forTrackID:v12];

    id v9 = objc_alloc_init(MEMORY[0x1E4F165B0]);
    [(PIAutoLoopVideoNode *)self frameDuration];
    long long v15 = v17;
    uint64_t v16 = v18;
    [v9 setFrameDuration:&v15];
    id v23 = v8;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    [v9 setInstructions:v13];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)requiresVideoComposition
{
  return 1;
}

- (id)_evaluateVideo:(id *)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    long long v21 = NUAssertLogger_26951();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      long long v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      LODWORD(v53.start.value) = 138543362;
      *(CMTimeValue *)((char *)&v53.start.value + 4) = (CMTimeValue)v22;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v53, 0xCu);
    }
    id v23 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v25 = NUAssertLogger_26951();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v29 = dispatch_get_specific(*v23);
        v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        v32 = [v30 callStackSymbols];
        v33 = [v32 componentsJoinedByString:@"\n"];
        LODWORD(v53.start.value) = 138543618;
        *(CMTimeValue *)((char *)&v53.start.value + 4) = (CMTimeValue)v29;
        LOWORD(v53.start.flags) = 2114;
        *(void *)((char *)&v53.start.flags + 2) = v33;
        _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v53, 0x16u);
      }
    }
    else if (v26)
    {
      v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      LODWORD(v53.start.value) = 138543362;
      *(CMTimeValue *)((char *)&v53.start.value + 4) = (CMTimeValue)v28;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v53, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = [(NURenderNode *)self inputs];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

  v7 = [v6 outputVideo:a3];
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F7A718] firstEnabledVideoTrackInAsset:v7 error:a3];
    if (v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F16590]);
      os_log_t v10 = v9;
      if (v9)
      {
        v11 = [v9 addMutableTrackWithMediaType:*MEMORY[0x1E4F15C18] preferredTrackID:0];
        memset(&v53, 0, sizeof(v53));
        [(PIAutoLoopVideoNode *)self startTime];
        [(PIAutoLoopVideoNode *)self loopDuration];
        CMTimeRangeMake(&v53, &start, &duration);
        id v50 = 0;
        CMTimeRange v49 = v53;
        CMTime v48 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
        char v12 = [v11 insertTimeRange:&v49 ofTrack:v8 atTime:&v48 error:&v50];
        id v13 = v50;
        if (v12)
        {
          v34 = v10;
          v35 = v6;
          int v14 = [(PIAutoLoopVideoNode *)self loopPeriod];
          if (v14 < 3)
          {
LABEL_10:
            os_log_t v10 = v34;
            id v19 = v34;
            v6 = v35;
          }
          else
          {
            int32_t v15 = v14;
            int32_t v16 = v14 - 1;
            while (1)
            {
              long long v17 = v13;
              --v16;
              memset(&v48, 0, sizeof(v48));
              [(PIAutoLoopVideoNode *)self startTime];
              [(PIAutoLoopVideoNode *)self frameDuration];
              CMTimeMultiply(&rhs, &time, v16);
              CMTimeAdd(&v48, &lhs, &rhs);
              memset(&v44, 0, sizeof(v44));
              [(PIAutoLoopVideoNode *)self frameDuration];
              CMTimeMultiply(&v44, &v43, v15);
              memset(&v42, 0, sizeof(v42));
              [(PIAutoLoopVideoNode *)self frameDuration];
              CMTimeMake(&v42, 1, timescale);
              CMTime v40 = v48;
              CMTime v39 = v42;
              CMTimeRangeMake(&v49, &v40, &v39);
              CMTimeRange v53 = v49;
              id v38 = v13;
              CMTime v40 = v44;
              int v18 = [v11 insertTimeRange:&v49 ofTrack:v8 atTime:&v40 error:&v38];
              id v13 = v38;

              if (!v18) {
                break;
              }
              v49.CMTime start = v44;
              CMTime v40 = v42;
              CMTimeRangeMake(&v37, &v49.start, &v40);
              [(PIAutoLoopVideoNode *)self frameDuration];
              [v11 scaleTimeRange:&v37 toDuration:v36];
              ++v15;
              if (v16 < 2) {
                goto LABEL_10;
              }
            }
            [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to update video track" object:self underlyingError:v13];
            id v19 = 0;
            *a3 = (id)objc_claimAutoreleasedReturnValue();
            os_log_t v10 = v34;
            v6 = v35;
          }
        }
        else
        {
          [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to update video track #1" object:self underlyingError:v13];
          id v19 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"[[AVMutableComposition alloc] init] failed." object:self];
        id v19 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      id v19 = 0;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    int32_t v15 = NUAssertLogger_26951();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int32_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v16;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    long long v17 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v19 = NUAssertLogger_26951();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        id v23 = dispatch_get_specific(*v17);
        uint64_t v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        BOOL v26 = [v24 callStackSymbols];
        v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v27;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      long long v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v22;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  os_log_t v10 = v9;
  if (([v9 evaluationMode] & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    memset(buf, 0, sizeof(buf));
    if (v10) {
      [v10 time];
    }
    else {
      memset(v30, 0, sizeof(v30));
    }
    [(PIAutoLoopMirrorVideoNode *)self _conformTime:v30];
    char v12 = (void *)[v10 copy];
    long long v28 = *(_OWORD *)buf;
    uint64_t v29 = *(void *)&buf[16];
    [v12 setTime:&v28];
    id v13 = [(PIAutoLoopVideoNode *)self input];
    v11 = [v13 nodeByReplayingAgainstCache:v8 pipelineState:v12 error:a5];
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)PIAutoLoopMirrorVideoNode;
    v11 = [(PIAutoLoopVideoNode *)&v31 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];
  }

  return v11;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_conformTime:(SEL)a3
{
  *retstr = *a4;
  [(PIAutoLoopVideoNode *)self frameDuration];
  CMTime time = *(CMTime *)retstr;
  CMTimeConvertScale(&v22, &time, v21, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  *(CMTime *)retstr = v22;
  memset(&v22, 0, sizeof(v22));
  [(PIAutoLoopVideoNode *)self loopDuration];
  [(PIAutoLoopVideoNode *)self frameDuration];
  CMTimeConvertScale(&v22, &v19, newTimescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  CMTimeValue value = v22.value;
  [(PIAutoLoopVideoNode *)self frameDuration];
  uint64_t v7 = 2 * (value - v17);
  int64_t var0 = retstr->var0;
  if (retstr->var0 < 0) {
    int64_t var0 = var0 % v7 + v7;
  }
  int64_t v9 = var0 % v7;
  [(PIAutoLoopVideoNode *)self frameDuration];
  CMTimeMake(&time, v9, timescale);
  *(CMTime *)retstr = time;
  memset(&time, 0, sizeof(time));
  [(PIAutoLoopVideoNode *)self frameDuration];
  CMTime lhs = v22;
  CMTimeSubtract(&time, &lhs, &rhs);
  CMTime lhs = (CMTime)*retstr;
  CMTime time2 = time;
  if ((CMTimeCompare(&lhs, &time2) & 0x80000000) == 0)
  {
    CMTime lhs = (CMTime)*retstr;
    CMTime time2 = time;
    CMTimeSubtract(&v12, &lhs, &time2);
    CMTime time2 = time;
    CMTimeSubtract(&lhs, &time2, &v12);
    *(CMTime *)retstr = lhs;
  }
  [(PIAutoLoopVideoNode *)self startTime];
  CMTime time2 = (CMTime)*retstr;
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeAdd(&lhs, &v11, &time2);
  *(CMTime *)retstr = lhs;
  return result;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v8.receiver = self;
  v8.super_class = (Class)PIAutoLoopMirrorVideoNode;
  v6 = [(PIAutoLoopVideoNode *)&v8 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];
  return v6;
}

+ (int)fadeLengthForTrimRange:(id *)a3 frameDuration:(id *)a4
{
  return 0;
}

@end