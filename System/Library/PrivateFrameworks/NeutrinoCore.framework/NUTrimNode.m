@interface NUTrimNode
- ($246D6535441D8C1432A5B8F9230D346F)range;
- (BOOL)requiresVideoComposition;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NUTrimNode)initWithSettings:(id)a3 inputs:(id)a4;
- (NUTrimNode)initWithTimeRange:(id *)a3 input:(id)a4;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateVideo:(id *)a3;
- (id)_evaluateVideoAttributes:(id *)a3;
- (id)_evaluateVideoComposition:(id *)a3;
- (id)_evaluateVideoProperties:(id *)a3;
- (id)_transformWithError:(id *)a3;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
@end

@implementation NUTrimNode

- ($246D6535441D8C1432A5B8F9230D346F)range
{
  objc_copyStruct(retstr, &self->_range, 48, 1, 0);
  return result;
}

- (id)_evaluateVideoAttributes:(id *)a3
{
  v4 = [NUVideoAttributes alloc];
  [(NUTrimNode *)self range];
  long long v9 = v7;
  uint64_t v10 = v8;
  v5 = [(NUVideoAttributes *)v4 initWithDuration:&v9];

  return v5;
}

- (id)_evaluateVideoProperties:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    long long v9 = NUAssertLogger_4842();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      LODWORD(buf.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v12 = NUAssertLogger_4842();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        v19 = [v17 callStackSymbols];
        v20 = [v19 componentsJoinedByString:@"\n"];
        LODWORD(buf.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v16;
        LOWORD(buf.flags) = 2114;
        *(void *)((char *)&buf.flags + 2) = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v13)
    {
      v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      v15 = [v14 componentsJoinedByString:@"\n"];
      LODWORD(buf.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUTrimNode _evaluateVideoProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Time.m", 178, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"error != NULL");
  }
  v31.receiver = self;
  v31.super_class = (Class)NUTrimNode;
  v5 = -[NURenderNode _evaluateVideoProperties:](&v31, sel__evaluateVideoProperties_);
  v6 = v5;
  if (v5)
  {
    memset(&buf, 0, sizeof(buf));
    [v5 livePhotoKeyFrameTime];
    if (buf.flags)
    {
      [(NUTrimNode *)self range];
      CMTime time = buf;
      if (CMTimeRangeContainsTime(&range, &time))
      {
        memset(&time, 0, sizeof(time));
        [(NUTrimNode *)self range];
        CMTime rhs = v27;
        CMTime lhs = buf;
        CMTimeSubtract(&time, &lhs, &rhs);
        long long v7 = [[_NUVideoProperties alloc] initWithProperties:v6];
        CMTime v25 = time;
        [(_NUVideoProperties *)v7 setLivePhotoKeyFrameTime:&v25];
      }
      else
      {
        +[NUError rangeError:@"keyframe time outside trim range" object:self];
        long long v7 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      long long v7 = v6;
    }
  }
  else
  {
    long long v7 = 0;
  }

  return v7;
}

- (id)_evaluateVideo:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    BOOL v13 = NUAssertLogger_4842();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)CMTime buf = 138543362;
      uint64_t v33 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v16 = NUAssertLogger_4842();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        uint64_t v23 = [v21 callStackSymbols];
        uint64_t v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        uint64_t v33 = v20;
        __int16 v34 = 2114;
        v35 = v24;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      id v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      uint64_t v33 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUTrimNode _evaluateVideo:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Time.m", 156, @"Invalid parameter not satisfying: %s", v25, v26, v27, v28, (uint64_t)"error != nil");
  }
  v31.receiver = self;
  v31.super_class = (Class)NUTrimNode;
  v5 = -[NURenderNode _evaluateVideo:](&v31, sel__evaluateVideo_);
  v6 = (void *)[v5 mutableCopy];
  long long v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 tracks];
    [(NUTrimNode *)self range];
    id v29 = 0;
    BOOL v9 = +[NUVideoUtilities trimCompositionTracks:v8 toRange:v30 error:&v29];
    id v10 = v29;

    if (v9)
    {
      id v11 = v7;
    }
    else
    {
      +[NUError errorWithCode:1 reason:@"failed to trim output video to range" object:self underlyingError:v10];
      id v11 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[NUError errorWithCode:1 reason:@"[NUTrimNode _evaluateVideo] failed to get new composition" object:0];
    id v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_evaluateVideoComposition:(id *)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v42 = NUAssertLogger_4842();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      LODWORD(buf[0].value) = 138543362;
      *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v43;
      _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v45 = NUAssertLogger_4842();
    BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v46)
      {
        v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v50 = (void *)MEMORY[0x1E4F29060];
        id v51 = v49;
        v52 = [v50 callStackSymbols];
        v53 = [v52 componentsJoinedByString:@"\n"];
        LODWORD(buf[0].value) = 138543618;
        *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v49;
        LOWORD(buf[0].flags) = 2114;
        *(void *)((char *)&buf[0].flags + 2) = v53;
        _os_log_error_impl(&dword_1A9892000, v45, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);
      }
    }
    else if (v46)
    {
      v47 = [MEMORY[0x1E4F29060] callStackSymbols];
      v48 = [v47 componentsJoinedByString:@"\n"];
      LODWORD(buf[0].value) = 138543362;
      *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v48;
      _os_log_error_impl(&dword_1A9892000, v45, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUTrimNode _evaluateVideoComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Time.m", 108, @"Invalid parameter not satisfying: %s", v54, v55, v56, v57, (uint64_t)"error != NULL");
  }
  v5 = [(NURenderNode *)self outputVideo:"outputVideo:"];
  if (v5)
  {
    v6 = +[NUVideoUtilities firstEnabledVideoTrackInAsset:v5 error:a3];
    if (v6)
    {
      long long v7 = [(NURenderNode *)self inputs];
      uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

      BOOL v9 = [v8 outputVideoComposition:a3];
      if (v9)
      {
        v60 = v5;
        id v61 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        v59 = v9;
        id v10 = [v9 instructions];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v66 objects:v72 count:16];
        if (!v11) {
          goto LABEL_34;
        }
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v67;
        while (1)
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v67 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v66 + 1) + 8 * v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (_NULogOnceToken != -1) {
                dispatch_once(&_NULogOnceToken, &__block_literal_global_4862);
              }
              uint64_t v26 = (id)_NUAssertLogger;
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                uint64_t v27 = [NSString stringWithFormat:@"Unexpected instruction type"];
                LODWORD(buf[0].value) = 138543362;
                *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v27;
                _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);
              }
              uint64_t v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
              if (_NULogOnceToken != -1) {
                dispatch_once(&_NULogOnceToken, &__block_literal_global_4862);
              }
              id v29 = (id)_NUAssertLogger;
              BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
              if (v28)
              {
                if (v30)
                {
                  uint64_t v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
                  __int16 v34 = (void *)MEMORY[0x1E4F29060];
                  id v35 = v33;
                  uint64_t v36 = [v34 callStackSymbols];
                  v37 = [v36 componentsJoinedByString:@"\n"];
                  LODWORD(buf[0].value) = 138543618;
                  *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v33;
                  LOWORD(buf[0].flags) = 2114;
                  *(void *)((char *)&buf[0].flags + 2) = v37;
                  _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);
                }
              }
              else if (v30)
              {
                objc_super v31 = [MEMORY[0x1E4F29060] callStackSymbols];
                v32 = [v31 componentsJoinedByString:@"\n"];
                LODWORD(buf[0].value) = 138543362;
                *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v32;
                _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);
              }
              _NUAssertFailHandler((uint64_t)"-[NUTrimNode _evaluateVideoComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Time.m", 132, @"Unexpected instruction type", v38, v39, v40, v41, v58);
            }
            memset(buf, 0, sizeof(buf));
            if (v15) {
              [v15 timeRange];
            }
            else {
              memset(v65, 0, sizeof(v65));
            }
            [v6 timeRange];
            +[NUVideoUtilities conformRange:v65 inRange:v64];
            char flags = buf[0].flags;
            if ((buf[0].flags & 1) == 0) {
              goto LABEL_15;
            }
            CMTimeFlags v18 = buf[1].flags;
            int v19 = buf[1].flags & 1;
            CMTimeEpoch epoch = buf[1].epoch;
            CMTimeValue value = buf[1].value;
            if ((buf[1].flags & 1) != 0 && !buf[1].epoch && (buf[1].value & 0x8000000000000000) == 0)
            {
              CMTime time1 = buf[1];
              CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
              if (!CMTimeCompare(&time1, &time2)) {
                goto LABEL_15;
              }
              char flags = buf[0].flags;
              if ((buf[0].flags & 1) == 0) {
                goto LABEL_15;
              }
              CMTimeFlags v18 = buf[1].flags;
              CMTimeEpoch epoch = buf[1].epoch;
              CMTimeValue value = buf[1].value;
              int v19 = buf[1].flags & 1;
            }
            if ((~v18 & 0x11) != 0 && (flags & 0x11) != 0x11 && v19 && !epoch && (value & 0x8000000000000000) == 0)
            {
              id v22 = (void *)[v15 copy];
              v62[0] = *(_OWORD *)&buf[0].value;
              v62[1] = *(_OWORD *)&buf[0].epoch;
              v62[2] = *(_OWORD *)&buf[1].timescale;
              [v22 setTimeRange:v62];
              [v61 addObject:v22];

              goto LABEL_19;
            }
LABEL_15:
            if (_NULogOnceToken != -1) {
              dispatch_once(&_NULogOnceToken, &__block_literal_global_103);
            }
            BOOL v17 = _NULogger;
            if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
            {
              LODWORD(time1.value) = 138412290;
              *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v15;
              _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Instruction <%@> does not conform to trim range - skipping", (uint8_t *)&time1, 0xCu);
            }
LABEL_19:
            ++v14;
          }
          while (v12 != v14);
          uint64_t v23 = [v10 countByEnumeratingWithState:&v66 objects:v72 count:16];
          uint64_t v12 = v23;
          if (!v23)
          {
LABEL_34:

            BOOL v9 = v59;
            uint64_t v24 = (void *)[v59 mutableCopy];
            [v24 setInstructions:v61];

            v5 = v60;
            goto LABEL_38;
          }
        }
      }
      uint64_t v24 = 0;
LABEL_38:
    }
    else
    {
      uint64_t v24 = 0;
    }
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

- (BOOL)requiresVideoComposition
{
  v2 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
  char v3 = [v2 requiresVideoComposition];

  return v3;
}

- (id)_evaluateImage:(id *)a3
{
  v4 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
  v5 = [v4 outputImage:a3];

  return v5;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v11.receiver = self;
  v11.super_class = (Class)NUTrimNode;
  uint64_t v7 = [(NURenderNode *)&v11 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];
  if (v7)
  {
    long long v9 = *(_OWORD *)&self->_range.start.epoch;
    long long v8 = *(_OWORD *)&self->_range.duration.timescale;
    *(_OWORD *)(v7 + 168) = *(_OWORD *)&self->_range.start.value;
    *(_OWORD *)(v7 + 184) = v9;
    *(_OWORD *)(v7 + 200) = v8;
  }

  return (id)v7;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 evaluationMode] != 3)
  {
LABEL_7:
    id v10 = v9;
    goto LABEL_11;
  }
  if (v9)
  {
    [v9 time];
    if ((BYTE4(v19) & 0x1D) == 1 && (self->_range.start.flags & 0x1D) == 1)
    {
      id v10 = (void *)[v9 copy];

      if (v10) {
        [v10 time];
      }
      else {
        memset(&lhs, 0, sizeof(lhs));
      }
      CMTime rhs = (CMTime)self->_range.start;
      CMTimeAdd(&v17, &lhs, &rhs);
      CMTime v14 = v17;
      [v10 setTime:&v14];
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  id v10 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
LABEL_11:
  v13.receiver = self;
  v13.super_class = (Class)NUTrimNode;
  objc_super v11 = [(NURenderNode *)&v13 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];

  return v11;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  unint64_t v3 = [a3 evaluationMode];
  return (v3 < 4) & (0xDu >> (v3 & 0xF));
}

- (id)_transformWithError:(id *)a3
{
  v4 = [NUTimeTransformTrim alloc];
  long long v7 = *(_OWORD *)&self->_range.start.value;
  int64_t epoch = self->_range.start.epoch;
  v5 = [(NUTimeTransformTrim *)v4 initWithTrimBeginTime:&v7];

  return v5;
}

- (NUTrimNode)initWithSettings:(id)a3 inputs:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_4862);
  }
  id v8 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v9 = NSString;
    id v10 = v8;
    objc_super v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    objc_super v13 = NSStringFromSelector(a2);
    CMTime v14 = [v9 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v12, v13];
    *(_DWORD *)CMTime buf = 138543362;
    __int16 v34 = v14;
    _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v15 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v15 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_4862);
      }
      goto LABEL_8;
    }
    if (v15 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_4862);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v16 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    CMTime v17 = (void *)MEMORY[0x1E4F29060];
    uint64_t v18 = v16;
    uint64_t v19 = [v17 callStackSymbols];
    uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
    *(_DWORD *)CMTime buf = 138543362;
    __int16 v34 = v20;
    _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v21 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v23 = (void *)MEMORY[0x1E4F29060];
  id v24 = specific;
  uint64_t v18 = v21;
  uint64_t v25 = [v23 callStackSymbols];
  uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
  *(_DWORD *)CMTime buf = 138543618;
  __int16 v34 = specific;
  __int16 v35 = 2114;
  uint64_t v36 = v26;
  _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUTrimNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Time.m", 40, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

- (NUTrimNode)initWithTimeRange:(id *)a3 input:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F29238];
  long long v7 = *(_OWORD *)&a3->var0.var3;
  v17[0] = *(_OWORD *)&a3->var0.var0;
  v17[1] = v7;
  v17[2] = *(_OWORD *)&a3->var1.var1;
  id v8 = a4;
  id v9 = [v6 valueWithCMTimeRange:v17];
  uint64_t v20 = @"range";
  v21[0] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  uint64_t v18 = *MEMORY[0x1E4F1E480];
  id v19 = v8;
  objc_super v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v16.receiver = self;
  v16.super_class = (Class)NUTrimNode;
  uint64_t v12 = [(NURenderNode *)&v16 initWithSettings:v10 inputs:v11];

  long long v14 = *(_OWORD *)&a3->var0.var3;
  long long v13 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)(v12 + 168) = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)(v12 + 184) = v14;
  *(_OWORD *)(v12 + 200) = v13;

  return (NUTrimNode *)v12;
}

@end