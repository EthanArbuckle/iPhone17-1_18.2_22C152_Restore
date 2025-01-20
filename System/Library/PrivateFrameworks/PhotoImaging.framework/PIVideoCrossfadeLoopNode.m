@interface PIVideoCrossfadeLoopNode
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)crossfadeDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime;
- ($EBD969CC01689D77F00D98CF40540A93)loopTimeRange;
- (BOOL)requiresAudioMix;
- (BOOL)requiresVideoComposition;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (PIVideoCrossfadeLoopNode)initWithInput:(id)a3 timeRange:(id *)a4 crossfadeDuration:(id *)a5 startTime:(id *)a6;
- (PIVideoCrossfadeLoopNode)initWithSettings:(id)a3 inputs:(id)a4;
- (id)_evaluateAudioMix:(id *)a3;
- (id)_evaluateVideo:(id *)a3;
- (id)_evaluateVideoComposition:(id *)a3;
- (id)input;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
@end

@implementation PIVideoCrossfadeLoopNode

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)crossfadeDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[8];
  return self;
}

- ($EBD969CC01689D77F00D98CF40540A93)loopTimeRange
{
  long long v3 = *(_OWORD *)&self[4].var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[4].var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[5].var0.var1;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[7];
  return self;
}

- (id)_evaluateAudioMix:(id *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v24 = NUAssertLogger_2767();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      LODWORD(buf.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v25;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    v26 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v28 = NUAssertLogger_2767();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        v32 = dispatch_get_specific(*v26);
        v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        v35 = [v33 callStackSymbols];
        v36 = [v35 componentsJoinedByString:@"\n"];
        LODWORD(buf.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v32;
        LOWORD(buf.flags) = 2114;
        *(void *)((char *)&buf.flags + 2) = v36;
        _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v29)
    {
      v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      v31 = [v30 componentsJoinedByString:@"\n"];
      LODWORD(buf.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v31;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = [(PIVideoCrossfadeLoopNode *)self input];
  v6 = [v5 outputVideo:a3];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F7A718] firstEnabledVideoTrackInAsset:v6 error:a3];
    v8 = v7;
    if (v7)
    {
      [v7 timeRange];
      CMTime buf = v46;
      v9 = [(NURenderNode *)self outputVideo:a3];
      v10 = v9;
      if (v9)
      {
        v11 = [v9 tracksWithMediaType:*MEMORY[0x1E4F15BA8]];
        if ((unint64_t)[v11 count] > 1)
        {
          v13 = (void *)MEMORY[0x1E4F16588];
          v14 = [v11 objectAtIndexedSubscript:0];
          v15 = [v13 audioMixInputParametersWithTrack:v14];

          v16 = (void *)MEMORY[0x1E4F16588];
          v17 = [v11 objectAtIndexedSubscript:1];
          v18 = [v16 audioMixInputParametersWithTrack:v17];

          CMTime v45 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
          long long v37 = *(_OWORD *)&v45.value;
          CMTimeEpoch epoch = v45.epoch;
          objc_msgSend(v15, "setVolume:atTime:", &v45, COERCE_DOUBLE(__PAIR64__(HIDWORD(v45.value), 1.0)));
          *(_OWORD *)&v45.value = v37;
          v45.CMTimeEpoch epoch = epoch;
          [v18 setVolume:&v45 atTime:0.0];
          memset(&v45, 0, sizeof(v45));
          [(PIVideoCrossfadeLoopNode *)self crossfadeDuration];
          CMTimeMultiply(&rhs, &time, 2);
          CMTime lhs = buf;
          CMTimeSubtract(&v45, &lhs, &rhs);
          [(PIVideoCrossfadeLoopNode *)self crossfadeDuration];
          CMTime lhs = v45;
          CMTimeRangeMake(&v41, &lhs, &duration);
          LODWORD(v20) = 1.0;
          [v15 setVolumeRampFromStartVolume:&v41 toEndVolume:v20 timeRange:0.0];
          [(PIVideoCrossfadeLoopNode *)self crossfadeDuration];
          CMTime lhs = v45;
          CMTimeRangeMake(&v39, &lhs, &v38);
          LODWORD(v21) = 1.0;
          [v18 setVolumeRampFromStartVolume:&v39 toEndVolume:0.0 timeRange:v21];
          v12 = [MEMORY[0x1E4F16580] audioMix];
          v47[0] = v15;
          v47[1] = v18;
          v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
          [v12 setInputParameters:v22];
        }
        else
        {
          v12 = [MEMORY[0x1E4F16580] audioMix];
        }
      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)requiresAudioMix
{
  return 1;
}

- (id)_evaluateVideoComposition:(id *)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v36 = NUAssertLogger_2767();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      long long v37 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v37;
      _os_log_error_impl(&dword_1A9680000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    CMTime v38 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v40 = NUAssertLogger_2767();
    BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v41)
      {
        v44 = dispatch_get_specific(*v38);
        CMTime v45 = (void *)MEMORY[0x1E4F29060];
        id v46 = v44;
        v47 = [v45 callStackSymbols];
        v48 = [v47 componentsJoinedByString:@"\n"];
        LODWORD(buf.start.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v44;
        LOWORD(buf.start.flags) = 2114;
        *(void *)((char *)&buf.start.flags + 2) = v48;
        _os_log_error_impl(&dword_1A9680000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v41)
    {
      v42 = [MEMORY[0x1E4F29060] callStackSymbols];
      v43 = [v42 componentsJoinedByString:@"\n"];
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v43;
      _os_log_error_impl(&dword_1A9680000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = [(PIVideoCrossfadeLoopNode *)self input];
  v6 = [v5 outputVideo:a3];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F7A718] firstEnabledVideoTrackInAsset:v6 error:a3];
    if (v7)
    {
      v8 = [(NURenderNode *)self outputVideo:a3];
      v9 = v8;
      if (v8)
      {
        v10 = [v8 tracksWithMediaType:*MEMORY[0x1E4F15C18]];
        v11 = [(NURenderNode *)self inputs];
        v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

        v13 = [v12 outputVideoComposition:a3];
        v14 = v13;
        if (v13)
        {
          v52 = v12;
          v15 = [v13 instructions];
          uint64_t v16 = [v15 count];

          if (v16 == 1)
          {
            v51 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
            long long v73 = 0uLL;
            CMTimeEpoch v74 = 0;
            [(PIVideoCrossfadeLoopNode *)self startTime];
            long long v71 = 0uLL;
            CMTimeEpoch v72 = 0;
            [(PIVideoCrossfadeLoopNode *)self crossfadeDuration];
            memset(&buf, 0, sizeof(buf));
            [(PIVideoCrossfadeLoopNode *)self loopTimeRange];
            memset(&v70, 0, sizeof(v70));
            CMTimeRange range = buf;
            CMTimeRangeGetEnd(&lhs, &range);
            *(_OWORD *)&range.start.value = v73;
            range.start.CMTimeEpoch epoch = v74;
            *(_OWORD *)&rhs.start.value = v71;
            rhs.start.CMTimeEpoch epoch = v72;
            CMTimeAdd(&v67, &range.start, &rhs.start);
            CMTimeSubtract(&v70, &lhs, &v67);
            memset(&range, 0, sizeof(range));
            *(_OWORD *)&rhs.start.value = *MEMORY[0x1E4F1FA48];
            rhs.start.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
            end.CMTime start = v70;
            CMTimeRangeFromTimeToTime(&range, &rhs.start, &end.start);
            memset(&rhs, 0, sizeof(rhs));
            end.CMTime start = v70;
            *(_OWORD *)&duration.start.value = v71;
            duration.start.CMTimeEpoch epoch = v72;
            CMTimeRangeMake(&rhs, &end.start, &duration.start);
            memset(&v65, 0, sizeof(v65));
            end.CMTime start = buf.duration;
            *(_OWORD *)&duration.start.value = v71;
            duration.start.CMTimeEpoch epoch = v72;
            CMTimeSubtract(&v65, &end.start, &duration.start);
            memset(&end, 0, sizeof(end));
            CMTimeRange duration = rhs;
            CMTimeRangeGetEnd(&start, &duration);
            CMTimeRange duration = rhs;
            CMTimeRangeGetEnd(&v60, &duration);
            duration.CMTime start = v65;
            CMTimeSubtract(&v61, &duration.start, &v60);
            CMTimeRangeMake(&end, &start, &v61);
            v17 = [v10 objectAtIndexedSubscript:0];
            id v18 = objc_alloc_init(MEMORY[0x1E4F7A6E0]);
            CMTimeRange v59 = range;
            [v18 setTimeRange:&v59];
            v19 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v17, "trackID"));
            v77 = v19;
            double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
            [v18 setRequiredSourceTrackIDs:v20];

            double v21 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v17, "trackID"));
            [v18 setSourceIdentifier:@"primary" forTrackID:v21];

            [v51 addObject:v18];
            v50 = v10;
            if ([v10 count] == 2)
            {
              uint64_t v49 = [v10 objectAtIndexedSubscript:1];
              id v22 = objc_alloc_init(MEMORY[0x1E4F7A6E0]);
              CMTimeRange v58 = rhs;
              [v22 setTimeRange:&v58];
              v23 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v17, "trackID"));
              v76[0] = v23;
              v24 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v49, "trackID"));
              v76[1] = v24;
              v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:2];
              [v22 setRequiredSourceTrackIDs:v25];

              v26 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v17, "trackID"));
              [v22 setSourceIdentifier:@"primary" forTrackID:v26];

              v27 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v49, "trackID"));
              [v22 setSourceIdentifier:@"secondary" forTrackID:v27];

              [v51 addObject:v22];
            }
            id v28 = objc_alloc_init(MEMORY[0x1E4F7A6E0]);
            CMTimeRange v57 = end;
            [v28 setTimeRange:&v57];
            BOOL v29 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v17, "trackID"));
            v75 = v29;
            v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
            [v28 setRequiredSourceTrackIDs:v30];

            v31 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v17, "trackID"));
            [v28 setSourceIdentifier:@"primary" forTrackID:v31];

            [v51 addObject:v28];
            id v32 = objc_alloc_init(MEMORY[0x1E4F165B0]);
            [v14 frameDuration];
            long long v53 = v55;
            uint64_t v54 = v56;
            [v32 setFrameDuration:&v53];
            [v14 renderSize];
            objc_msgSend(v32, "setRenderSize:");
            [v32 setInstructions:v51];
            objc_msgSend(v32, "setSourceTrackIDForFrameTiming:", objc_msgSend(v17, "trackID"));

            v10 = v50;
          }
          else
          {
            v33 = (void *)MEMORY[0x1E4F7A438];
            id v34 = [v14 instructions];
            *a3 = [v33 unsupportedError:@"Unsupported video configuration" object:v34];

            id v32 = 0;
          }
          v12 = v52;
        }
        else
        {
          id v32 = 0;
        }
      }
      else
      {
        id v32 = 0;
      }
    }
    else
    {
      id v32 = 0;
    }
  }
  else
  {
    id v32 = 0;
  }

  return v32;
}

- (BOOL)requiresVideoComposition
{
  return 1;
}

- (id)_evaluateVideo:(id *)a3
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v68 = NUAssertLogger_2767();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      v69 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v69;
      _os_log_error_impl(&dword_1A9680000, v68, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    CMTime v70 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    CMTimeEpoch v72 = NUAssertLogger_2767();
    BOOL v73 = os_log_type_enabled(v72, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v73)
      {
        v76 = dispatch_get_specific(*v70);
        v77 = (void *)MEMORY[0x1E4F29060];
        id v78 = v76;
        uint64_t v79 = [v77 callStackSymbols];
        v80 = [v79 componentsJoinedByString:@"\n"];
        LODWORD(buf.start.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v76;
        LOWORD(buf.start.flags) = 2114;
        *(void *)((char *)&buf.start.flags + 2) = v80;
        _os_log_error_impl(&dword_1A9680000, v72, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v73)
    {
      CMTimeEpoch v74 = [MEMORY[0x1E4F29060] callStackSymbols];
      v75 = [v74 componentsJoinedByString:@"\n"];
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v75;
      _os_log_error_impl(&dword_1A9680000, v72, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = [(PIVideoCrossfadeLoopNode *)self input];
  v6 = [v5 outputVideo:a3];

  if (!v6)
  {
    id v14 = 0;
    goto LABEL_53;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F16590]);
  if (v7)
  {
    v8 = [MEMORY[0x1E4F7A718] firstEnabledVideoTrackInAsset:v6 error:a3];
    if (!v8)
    {
      [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"No input video track found" object:self underlyingError:*a3];
      id v14 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_51:

      goto LABEL_52;
    }
    v88 = v6;
    v9 = v6;
    uint64_t v10 = *MEMORY[0x1E4F15BA8];
    v11 = [v9 tracksWithMediaType:*MEMORY[0x1E4F15BA8]];
    uint64_t v12 = [v11 firstObject];

    uint64_t v13 = *MEMORY[0x1E4F15C18];
    v92 = [v7 addMutableTrackWithMediaType:*MEMORY[0x1E4F15C18] preferredTrackID:0];
    v90 = (void *)v12;
    if (v12)
    {
      v91 = [v7 addMutableTrackWithMediaType:v10 preferredTrackID:2];
    }
    else
    {
      v91 = 0;
    }
    v89 = v7;
    long long v119 = 0uLL;
    CMTimeEpoch v120 = 0;
    [(PIVideoCrossfadeLoopNode *)self startTime];
    long long v117 = 0uLL;
    CMTimeEpoch v118 = 0;
    [(PIVideoCrossfadeLoopNode *)self crossfadeDuration];
    memset(&buf, 0, sizeof(buf));
    [(PIVideoCrossfadeLoopNode *)self loopTimeRange];
    memset(&v116, 0, sizeof(v116));
    CMTimeRange range = buf;
    CMTimeRangeGetEnd(&end, &range);
    *(_OWORD *)&range.start.value = v119;
    range.start.CMTimeEpoch epoch = v120;
    CMTimeRangeFromTimeToTime(&v116, &range.start, &end);
    memset(&range, 0, sizeof(range));
    *(_OWORD *)&lhs.start.value = *(_OWORD *)&buf.start.value;
    lhs.start.CMTimeEpoch epoch = buf.start.epoch;
    *(_OWORD *)&rhs.start.value = v117;
    rhs.start.CMTimeEpoch epoch = v118;
    CMTimeAdd(&start, &lhs.start, &rhs.start);
    *(_OWORD *)&lhs.start.value = v119;
    lhs.start.CMTimeEpoch epoch = v120;
    CMTimeRangeFromTimeToTime(&range, &start, &lhs.start);
    memset(&lhs, 0, sizeof(lhs));
    *(_OWORD *)&rhs.start.value = *(_OWORD *)&buf.start.value;
    rhs.start.CMTimeEpoch epoch = buf.start.epoch;
    *(_OWORD *)&duration.start.value = v117;
    duration.start.CMTimeEpoch epoch = v118;
    CMTimeRangeMake(&lhs, &rhs.start, &duration.start);
    rhs.CMTime start = v116.duration;
    long long v94 = *MEMORY[0x1E4F1FA48];
    *(_OWORD *)&duration.start.value = *MEMORY[0x1E4F1FA48];
    CMTimeEpoch v15 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    duration.start.CMTimeEpoch epoch = v15;
    uint64_t v16 = v92;
    if (CMTimeCompare(&rhs.start, &duration.start) < 1)
    {
      id v21 = 0;
    }
    else
    {
      uint64_t v82 = v10;
      id v111 = 0;
      CMTimeRange rhs = v116;
      *(_OWORD *)&duration.start.value = v94;
      duration.start.CMTimeEpoch epoch = v15;
      char v17 = [v92 insertTimeRange:&rhs ofTrack:v8 atTime:&duration error:&v111];
      id v18 = v111;
      v19 = v18;
      if ((v17 & 1) == 0)
      {
        v83 = NSString;
        CMTimeRange rhs = v116;
        id v22 = NUStringFromTimeRange();
        v23 = [MEMORY[0x1E4F7A718] debugDescriptionOfAssetTrack:v8];
        *(_OWORD *)&rhs.start.value = v94;
        rhs.start.CMTimeEpoch epoch = v15;
        v24 = NUStringFromTime();
        v25 = [MEMORY[0x1E4F7A718] debugDescriptionOfAssetTrack:v92];
        v26 = [v83 stringWithFormat:@"Failed to update video track when inserting the pre-crossfade content with source range %@ from track %@ to time %@ in track %@.", v22, v23, v24, v25];

        v27 = v92;
        *a3 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:v26 object:self underlyingError:v19];

        id v14 = 0;
        id v7 = v89;
        goto LABEL_50;
      }
      if (v91)
      {
        memset(&rhs, 0, sizeof(rhs));
        double v20 = (void *)MEMORY[0x1E4F7A718];
        v87 = v8;
        if (v90) {
          [v90 timeRange];
        }
        else {
          memset(v109, 0, sizeof(v109));
        }
        CMTimeRange duration = v116;
        [v20 conformRange:&duration inRange:v109];
        v106.CMTimeEpoch epoch = v15;
        id v107 = v19;
        CMTimeRange duration = rhs;
        *(_OWORD *)&v106.value = v94;
        char v28 = [v91 insertTimeRange:&duration ofTrack:v90 atTime:&v106 error:&v107];
        id v21 = v107;

        if ((v28 & 1) == 0)
        {
          v85 = NSString;
          CMTimeRange duration = rhs;
          long long v55 = NUStringFromTimeRange();
          uint64_t v56 = [MEMORY[0x1E4F7A718] debugDescriptionOfAssetTrack:v90];
          *(_OWORD *)&duration.start.value = v94;
          duration.start.CMTimeEpoch epoch = v15;
          CMTimeRange v57 = NUStringFromTime();
          CMTimeRange v58 = [MEMORY[0x1E4F7A718] debugDescriptionOfAssetTrack:v91];
          [v85 stringWithFormat:@"Failed to update audio track when inserting the pre-crossfade content with source range %@ from track %@ to time %@ in track %@.", v55, v56, v57, v58];
          v66 = LABEL_47:;

          *a3 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:v66 object:self underlyingError:v21];

          id v14 = 0;
          v19 = v21;
          goto LABEL_48;
        }
        uint64_t v16 = v92;
      }
      else
      {
        id v21 = v18;
      }
      uint64_t v10 = v82;
    }
    rhs.CMTime start = lhs.duration;
    *(_OWORD *)&duration.start.value = v94;
    duration.start.CMTimeEpoch epoch = v15;
    if (CMTimeCompare(&rhs.start, &duration.start) < 1)
    {
LABEL_32:
      rhs.CMTime start = range.duration;
      *(_OWORD *)&duration.start.value = v94;
      duration.start.CMTimeEpoch epoch = v15;
      if (CMTimeCompare(&rhs.start, &duration.start) < 1) {
        goto LABEL_45;
      }
      id v99 = v21;
      CMTimeRange rhs = range;
      long long v95 = *MEMORY[0x1E4F1F9F8];
      *(_OWORD *)&duration.start.value = *MEMORY[0x1E4F1F9F8];
      CMTimeEpoch v35 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      duration.start.CMTimeEpoch epoch = v35;
      v36 = v16;
      char v37 = [v16 insertTimeRange:&rhs ofTrack:v8 atTime:&duration error:&v99];
      id v38 = v99;

      if (v37)
      {
        v87 = v8;
        if (v91)
        {
          memset(&rhs, 0, sizeof(rhs));
          CMTimeRange v39 = (void *)MEMORY[0x1E4F7A718];
          if (v90) {
            [v90 timeRange];
          }
          else {
            memset(v98, 0, sizeof(v98));
          }
          CMTimeRange duration = range;
          [v39 conformRange:&duration inRange:v98];
          id v97 = v38;
          CMTimeRange duration = rhs;
          *(_OWORD *)&v106.value = v95;
          v106.CMTimeEpoch epoch = v35;
          char v64 = [v91 insertTimeRange:&duration ofTrack:v90 atTime:&v106 error:&v97];
          id v21 = v97;

          if (v64) {
            goto LABEL_45;
          }
          v86 = NSString;
          CMTimeRange duration = rhs;
          uint64_t v65 = NUStringFromTimeRange();
          uint64_t v56 = [MEMORY[0x1E4F7A718] debugDescriptionOfAssetTrack:v90];
          *(_OWORD *)&duration.start.value = v95;
          duration.start.CMTimeEpoch epoch = v35;
          CMTimeRange v57 = NUStringFromTime();
          CMTimeRange v58 = [MEMORY[0x1E4F7A718] debugDescriptionOfAssetTrack:v91];
          long long v55 = (void *)v65;
          [v86 stringWithFormat:@"Failed to update audio track when inserting the post-crossfade content with source range %@ from track %@ to time %@ in track %@.", v65, v56, v57, v58];
          goto LABEL_47;
        }
        id v21 = v38;
LABEL_45:
        id v14 = v89;
        v19 = v21;
        id v7 = v89;
LABEL_49:
        v27 = v92;
        goto LABEL_50;
      }
      v93 = NSString;
      CMTimeRange rhs = range;
      uint64_t v47 = NUStringFromTimeRange();
      [MEMORY[0x1E4F7A718] debugDescriptionOfAssetTrack:v8];
      uint64_t v49 = v48 = v36;
      *(_OWORD *)&rhs.start.value = v95;
      rhs.start.CMTimeEpoch epoch = v35;
      v50 = NUStringFromTime();
      v51 = v48;
      v52 = [MEMORY[0x1E4F7A718] debugDescriptionOfAssetTrack:v48];
      long long v53 = (void *)v47;
      uint64_t v54 = [v93 stringWithFormat:@"Failed to update video track when inserting the post-crossfade content with source range %@ from track %@ to time %@ in track %@.", v47, v49, v50, v52];

      *a3 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:v54 object:self underlyingError:v38];

      id v14 = 0;
      id v7 = v89;
      v27 = v51;
      v19 = v38;
LABEL_50:

      v6 = v88;
      goto LABEL_51;
    }
    BOOL v29 = [v89 addMutableTrackWithMediaType:v13 preferredTrackID:1];
    memset(&v106, 0, sizeof(v106));
    if (v16) {
      [v16 timeRange];
    }
    else {
      memset(&v104, 0, sizeof(v104));
    }
    CMTimeRangeGetEnd(&v105, &v104);
    *(_OWORD *)&rhs.start.value = v117;
    rhs.start.CMTimeEpoch epoch = v118;
    CMTimeSubtract(&v106, &v105, &rhs.start);
    id v103 = v21;
    CMTimeRange rhs = lhs;
    duration.CMTime start = v106;
    char v30 = [v29 insertTimeRange:&rhs ofTrack:v8 atTime:&duration error:&v103];
    v84 = v29;
    v31 = v8;
    char v32 = v30;
    id v33 = v103;

    v87 = v31;
    if (v32)
    {
      id v21 = v33;
      if (!v90)
      {
LABEL_31:
        uint64_t v16 = v92;

        v8 = v31;
        goto LABEL_32;
      }
      v81 = [v89 addMutableTrackWithMediaType:v10 preferredTrackID:3];
      memset(&rhs, 0, sizeof(rhs));
      id v34 = (void *)MEMORY[0x1E4F7A718];
      [v90 timeRange];
      CMTimeRange duration = lhs;
      [v34 conformRange:&duration inRange:v102];
      id v101 = v33;
      CMTimeRange duration = rhs;
      CMTime v100 = v106;
      LOBYTE(v34) = [v81 insertTimeRange:&duration ofTrack:v90 atTime:&v100 error:&v101];
      id v21 = v101;

      if (v34)
      {

        goto LABEL_31;
      }
      v96 = NSString;
      CMTimeRange duration = rhs;
      CMTimeRange v59 = NUStringFromTimeRange();
      CMTime v60 = [MEMORY[0x1E4F7A718] debugDescriptionOfAssetTrack:v90];
      duration.CMTime start = v106;
      CMTime v61 = NUStringFromTime();
      v62 = [MEMORY[0x1E4F7A718] debugDescriptionOfAssetTrack:v81];
      v63 = [v96 stringWithFormat:@"Failed to update audio track when inserting the crossfade content with source range %@ from track %@ to time %@ in track %@.", v59, v60, v61, v62];

      id v46 = v81;
      *a3 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:v63 object:self underlyingError:v21];

      v19 = v21;
      v44 = v84;
    }
    else
    {
      v40 = NSString;
      CMTimeRange rhs = lhs;
      BOOL v41 = NUStringFromTimeRange();
      v42 = [MEMORY[0x1E4F7A718] debugDescriptionOfAssetTrack:v31];
      rhs.CMTime start = v106;
      v43 = NUStringFromTime();
      v44 = v84;
      CMTime v45 = [MEMORY[0x1E4F7A718] debugDescriptionOfAssetTrack:v84];
      id v46 = [v40 stringWithFormat:@"Failed to update video track when inserting the crossfade content with source range %@ from track %@ to time %@ in track %@.", v41, v42, v43, v45];

      *a3 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:v46 object:self underlyingError:v33];
      v19 = v33;
    }

    id v14 = 0;
LABEL_48:
    v8 = v87;
    id v7 = v89;
    goto LABEL_49;
  }
  [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"[[AVMutableComposition alloc] init] failed." object:self];
  id v14 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_52:

LABEL_53:
  return v14;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    v42 = NUAssertLogger_2767();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v43;
      _os_log_error_impl(&dword_1A9680000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    v44 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v46 = NUAssertLogger_2767();
    BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v47)
      {
        v50 = dispatch_get_specific(*v44);
        v51 = (void *)MEMORY[0x1E4F29060];
        id v52 = v50;
        long long v53 = [v51 callStackSymbols];
        uint64_t v54 = [v53 componentsJoinedByString:@"\n"];
        LODWORD(buf.start.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v50;
        LOWORD(buf.start.flags) = 2114;
        *(void *)((char *)&buf.start.flags + 2) = v54;
        _os_log_error_impl(&dword_1A9680000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v47)
    {
      v48 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v49 = [v48 componentsJoinedByString:@"\n"];
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v49;
      _os_log_error_impl(&dword_1A9680000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  uint64_t v10 = v9;
  uint64_t v11 = [v9 evaluationMode];
  if ((v11 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    v81.receiver = self;
    v81.super_class = (Class)PIVideoCrossfadeLoopNode;
    id v19 = [(NURenderNode *)&v81 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];
    goto LABEL_36;
  }
  uint64_t v12 = v11;
  long long v79 = 0uLL;
  CMTimeEpoch v80 = 0;
  [(PIVideoCrossfadeLoopNode *)self startTime];
  [(PIVideoCrossfadeLoopNode *)self crossfadeDuration];
  memset(&buf, 0, sizeof(buf));
  [(PIVideoCrossfadeLoopNode *)self loopTimeRange];
  memset(v78, 0, sizeof(v78));
  if (v10) {
    [v10 time];
  }
  uint64_t v13 = [(PIVideoCrossfadeLoopNode *)self input];
  id v14 = [v13 outputVideo:a5];

  if (v14)
  {
    memset(&v77, 0, sizeof(v77));
    CMTimeRange range = buf;
    CMTimeRangeGetEnd(&lhs, &range);
    *(_OWORD *)&range.start.value = v79;
    range.start.CMTimeEpoch epoch = v80;
    rhs.CMTime start = v78[1];
    CMTimeAdd(&v74, &range.start, &rhs.start);
    CMTimeSubtract(&v77, &lhs, &v74);
    memset(&range, 0, sizeof(range));
    rhs.CMTime start = v77;
    CMTime duration = v78[1];
    CMTimeRangeMake(&range, &rhs.start, &duration);
    CMTimeEpoch v15 = (void *)[v10 copy];
    if (v12 == 3)
    {
      uint64_t v16 = [v10 videoFrames];
      char v17 = [v16 objectForKeyedSubscript:@"primary"];

      if (!v17)
      {
        [MEMORY[0x1E4F7A438] missingError:@"Missing primary video frame" object:v10];
        id v19 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_34:

        goto LABEL_35;
      }
      v88 = @"video";
      v89 = v17;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
      [v15 setVideoFrames:v18];

      CMTimeRange rhs = range;
      CMTimeRangeGetEnd(&time2, &rhs);
      rhs.CMTime start = v78[0];
      if (CMTimeCompare(&rhs.start, &time2) < 0)
      {
        if (v10) {
          [v10 time];
        }
        else {
          memset(&v69, 0, sizeof(v69));
        }
        *(_OWORD *)&rhs.start.value = v79;
        rhs.start.CMTimeEpoch epoch = v80;
        CMTimeAdd(&v70, &v69, &rhs.start);
        CMTime v68 = v70;
        double v20 = &v68;
      }
      else
      {
        memset(&duration, 0, sizeof(duration));
        [(PIVideoCrossfadeLoopNode *)self loopTimeRange];
        CMTime v67 = v66;
        rhs.CMTime start = v78[1];
        CMTimeAdd(&duration, &v67, &rhs.start);
        if (v10) {
          [v10 time];
        }
        else {
          memset(&v63, 0, sizeof(v63));
        }
        CMTimeRange rhs = range;
        CMTimeRangeGetEnd(&v62, &rhs);
        CMTimeSubtract(&v64, &v63, &v62);
        rhs.CMTime start = duration;
        CMTimeAdd(&v65, &rhs.start, &v64);
        CMTime v61 = v65;
        double v20 = &v61;
      }
      [v15 setRawTime:v20];
    }
    id v21 = [(PIVideoCrossfadeLoopNode *)self input];
    id v22 = [v21 nodeByReplayingAgainstCache:v8 pipelineState:v15 error:a5];

    if (v22)
    {
      CMTimeRange rhs = range;
      CMTime duration = v78[0];
      if (CMTimeRangeContainsTime(&rhs, &duration))
      {
        memset(&rhs, 0, 24);
        CMTime duration = v78[0];
        CMTime start = v77;
        CMTimeSubtract(&rhs.start, &duration, &start);
        CMTime duration = rhs.start;
        double Seconds = CMTimeGetSeconds(&duration);
        CMTime duration = v78[1];
        double v24 = CMTimeGetSeconds(&duration);
        v25 = (void *)[v10 copy];
        if (v12 == 3)
        {
          v26 = [v10 videoFrames];
          v27 = [v26 objectForKeyedSubscript:@"secondary"];

          if (!v27)
          {
            [MEMORY[0x1E4F7A438] missingError:@"Missing secondary video frame" object:v10];
            id v19 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:

            goto LABEL_33;
          }
          CMTime duration = buf.start;
          CMTime start = rhs.start;
          CMTimeAdd(&v59, &duration, &start);
          CMTime v58 = v59;
          [v25 setTime:&v58];
          v86 = @"video";
          v87 = v27;
          char v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
          [v25 setVideoFrames:v28];

          CMTime duration = rhs.start;
          CMTime start = buf.start;
          CMTimeAdd(&v57, &duration, &start);
          CMTime v56 = v57;
          [v15 setRawTime:&v56];
        }
        BOOL v29 = [(PIVideoCrossfadeLoopNode *)self input];
        char v30 = [v29 nodeByReplayingAgainstCache:v8 pipelineState:v25 error:a5];

        if (v30)
        {
          float v31 = Seconds;
          float v32 = v24;
          float v33 = v31 / v32;
          id v34 = objc_alloc(MEMORY[0x1E4F7A460]);
          uint64_t v84 = *MEMORY[0x1E4F1E500];
          *(float *)&double v35 = v33;
          v36 = [NSNumber numberWithFloat:v35];
          v85 = v36;
          long long v55 = v25;
          char v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
          uint64_t v38 = *MEMORY[0x1E4F1E4F8];
          v82[0] = *MEMORY[0x1E4F1E480];
          v82[1] = v38;
          v83[0] = v22;
          v83[1] = v30;
          CMTimeRange v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:2];
          v40 = (void *)[v34 initWithFilterName:@"CIDissolveTransition" settings:v37 inputs:v39];

          v25 = v55;
          id v19 = [MEMORY[0x1E4F7A610] nodeFromCache:v40 cache:v8];
          objc_msgSend(v19, "setEvaluatedForMode:", objc_msgSend(v10, "evaluationMode"));
        }
        else
        {
          id v19 = 0;
        }

        goto LABEL_32;
      }
      id v19 = v22;
    }
    else
    {
      id v19 = 0;
    }
LABEL_33:

    goto LABEL_34;
  }
  id v19 = 0;
LABEL_35:

LABEL_36:
  return v19;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return 1;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v13.receiver = self;
  v13.super_class = (Class)PIVideoCrossfadeLoopNode;
  uint64_t v7 = [(NURenderNode *)&v13 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];
  long long v8 = *(_OWORD *)&self->_crossfadeDuration.value;
  *(void *)(v7 + 208) = self->_crossfadeDuration.epoch;
  *(_OWORD *)(v7 + 192) = v8;
  long long v9 = *(_OWORD *)&self->_startTime.value;
  *(void *)(v7 + 184) = self->_startTime.epoch;
  *(_OWORD *)(v7 + 168) = v9;
  long long v11 = *(_OWORD *)&self->_loopTimeRange.start.epoch;
  long long v10 = *(_OWORD *)&self->_loopTimeRange.duration.timescale;
  *(_OWORD *)(v7 + 216) = *(_OWORD *)&self->_loopTimeRange.start.value;
  *(_OWORD *)(v7 + 232) = v11;
  *(_OWORD *)(v7 + 248) = v10;
  return (id)v7;
}

- (id)input
{
  v2 = [(NURenderNode *)self inputs];
  long long v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

  return v3;
}

- (PIVideoCrossfadeLoopNode)initWithInput:(id)a3 timeRange:(id *)a4 crossfadeDuration:(id *)a5 startTime:(id *)a6
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (!v10)
  {
    float v32 = NUAssertLogger_2767();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      float v33 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      LODWORD(time.start.value) = 138543362;
      *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v33;
      _os_log_error_impl(&dword_1A9680000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time, 0xCu);
    }
    v27 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v29 = NUAssertLogger_2767();
    int v35 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v35)
      {
        v36 = [MEMORY[0x1E4F29060] callStackSymbols];
        v27 = [v36 componentsJoinedByString:@"\n"];
        LODWORD(time.start.value) = 138543362;
        *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v27;
        _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time, 0xCu);
      }
      goto LABEL_32;
    }
LABEL_30:
    if (v35)
    {
      BOOL v47 = dispatch_get_specific(*v27);
      v48 = (void *)MEMORY[0x1E4F29060];
      id v49 = v47;
      v27 = [v48 callStackSymbols];
      v50 = [v27 componentsJoinedByString:@"\n"];
      LODWORD(time.start.value) = 138543618;
      *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v47;
      LOWORD(time.start.flags) = 2114;
      *(void *)((char *)&time.start.flags + 2) = v50;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time, 0x16u);
    }
LABEL_32:

    int v40 = _NUAssertFailHandler();
    goto LABEL_33;
  }
  if ((a5->var2 & 1) == 0)
  {
    char v37 = NUAssertLogger_2767();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      uint64_t v38 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "CMTIME_IS_VALID(crossfadeDuration)");
      LODWORD(time.start.value) = 138543362;
      *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v38;
      _os_log_error_impl(&dword_1A9680000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time, 0xCu);
    }
    v27 = (const void **)MEMORY[0x1E4F7A308];
    CMTimeRange v39 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v29 = NUAssertLogger_2767();
    int v40 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (!v39)
    {
      if (v40)
      {
        BOOL v41 = [MEMORY[0x1E4F29060] callStackSymbols];
        v42 = [v41 componentsJoinedByString:@"\n"];
        LODWORD(time.start.value) = 138543362;
        *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v42;
        _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time, 0xCu);
      }
LABEL_35:

      _NUAssertFailHandler();
    }
LABEL_33:
    if (v40)
    {
      v51 = dispatch_get_specific(*v27);
      id v52 = (void *)MEMORY[0x1E4F29060];
      id v53 = v51;
      uint64_t v54 = [v52 callStackSymbols];
      long long v55 = [v54 componentsJoinedByString:@"\n"];
      LODWORD(time.start.value) = 138543618;
      *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v51;
      LOWORD(time.start.flags) = 2114;
      *(void *)((char *)&time.start.flags + 2) = v55;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time, 0x16u);
    }
    goto LABEL_35;
  }
  if ((a4->var0.var2 & 1) == 0 || (a4->var1.var2 & 1) == 0 || a4->var1.var3 || a4->var1.var0 < 0)
  {
    v25 = NUAssertLogger_2767();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "CMTIMERANGE_IS_VALID(loopTimeRange)");
      LODWORD(time.start.value) = 138543362;
      *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v26;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time, 0xCu);
    }
    v27 = (const void **)MEMORY[0x1E4F7A308];
    char v28 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v29 = NUAssertLogger_2767();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        v43 = dispatch_get_specific(*v27);
        v44 = (void *)MEMORY[0x1E4F29060];
        id v45 = v43;
        v27 = [v44 callStackSymbols];
        id v46 = [v27 componentsJoinedByString:@"\n"];
        LODWORD(time.start.value) = 138543618;
        *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v43;
        LOWORD(time.start.flags) = 2114;
        *(void *)((char *)&time.start.flags + 2) = v46;
        _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time, 0x16u);
      }
    }
    else if (v30)
    {
      float v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      v27 = [v31 componentsJoinedByString:@"\n"];
      LODWORD(time.start.value) = 138543362;
      *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v27;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time, 0xCu);
    }
    int v35 = _NUAssertFailHandler();
    goto LABEL_30;
  }
  long long v11 = v10;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  *(_OWORD *)&time.start.value = *(_OWORD *)&a5->var0;
  time.start.CMTimeEpoch epoch = a5->var3;
  CFDictionaryRef v13 = CMTimeCopyAsDictionary(&time.start, 0);
  [v12 setObject:v13 forKeyedSubscript:@"crossfadeDuration"];

  *(_OWORD *)&time.start.value = *(_OWORD *)&a6->var0;
  time.start.CMTimeEpoch epoch = a6->var3;
  CFDictionaryRef v14 = CMTimeCopyAsDictionary(&time.start, 0);
  [v12 setObject:v14 forKeyedSubscript:@"startTime"];

  long long v15 = *(_OWORD *)&a4->var0.var3;
  *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&time.start.CMTimeEpoch epoch = v15;
  *(_OWORD *)&time.duration.timescale = *(_OWORD *)&a4->var1.var1;
  CFDictionaryRef v16 = CMTimeRangeCopyAsDictionary(&time, 0);
  [v12 setObject:v16 forKeyedSubscript:@"loopTimeRange"];

  uint64_t v62 = *MEMORY[0x1E4F1E480];
  CMTime v63 = v11;
  char v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
  v61.receiver = self;
  v61.super_class = (Class)PIVideoCrossfadeLoopNode;
  id v18 = [(NURenderNode *)&v61 initWithSettings:v12 inputs:v17];

  if (v18)
  {
    int64_t var3 = a5->var3;
    *((_OWORD *)v18 + 12) = *(_OWORD *)&a5->var0;
    *((void *)v18 + 26) = var3;
    long long v20 = *(_OWORD *)&a4->var1.var1;
    long long v21 = *(_OWORD *)&a4->var0.var0;
    *(_OWORD *)(v18 + 232) = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)(v18 + 248) = v20;
    *(_OWORD *)(v18 + 216) = v21;
    memset(&v60, 0, sizeof(v60));
    CMTimeMake(&v60, 1, 600);
    memset(&v59, 0, sizeof(v59));
    long long v22 = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var0.var0;
    *(_OWORD *)&time.start.CMTimeEpoch epoch = v22;
    *(_OWORD *)&time.duration.timescale = *(_OWORD *)&a4->var1.var1;
    CMTimeRangeGetEnd(&lhs, &time);
    *(_OWORD *)&time.start.value = *(_OWORD *)&a5->var0;
    time.start.CMTimeEpoch epoch = a5->var3;
    CMTime rhs = v60;
    CMTimeAdd(&v57, &time.start, &rhs);
    CMTimeSubtract(&v59, &lhs, &v57);
    *(_OWORD *)&time.start.value = *(_OWORD *)&a6->var0;
    time.start.CMTimeEpoch epoch = a6->var3;
    CMTime rhs = v59;
    if ((CMTimeCompare(&time.start, &rhs) & 0x80000000) == 0) {
      *(CMTime *)a6 = v59;
    }
    int64_t v23 = a6->var3;
    *(_OWORD *)(v18 + 168) = *(_OWORD *)&a6->var0;
    *((void *)v18 + 23) = v23;
  }

  return (PIVideoCrossfadeLoopNode *)v18;
}

- (PIVideoCrossfadeLoopNode)initWithSettings:(id)a3 inputs:(id)a4
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
    long long v9 = (os_log_t *)MEMORY[0x1E4F7A748];
    id v10 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      long long v11 = NSString;
      id v12 = v10;
      CFDictionaryRef v13 = (objc_class *)objc_opt_class();
      CFDictionaryRef v14 = NSStringFromClass(v13);
      long long v15 = NSStringFromSelector(a2);
      CFDictionaryRef v16 = [v11 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v14, v15];
      *(_DWORD *)CMTimeRange buf = 138543362;
      float v31 = v16;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v17 = *v8;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v17 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_2784);
        }
LABEL_7:
        os_log_t v18 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          id v19 = (void *)MEMORY[0x1E4F29060];
          long long v20 = v18;
          long long v21 = [v19 callStackSymbols];
          long long v22 = [v21 componentsJoinedByString:@"\n"];
          *(_DWORD *)CMTimeRange buf = 138543362;
          float v31 = v22;
          _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v17 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_2784);
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
      v25 = (void *)MEMORY[0x1E4F29060];
      id v26 = specific;
      long long v20 = v23;
      v27 = [v25 callStackSymbols];
      char v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTimeRange buf = 138543618;
      float v31 = specific;
      __int16 v32 = 2114;
      float v33 = v28;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    BOOL v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_2784);
  }
}

@end