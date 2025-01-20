@interface NUSlowMotionNode
- ($246D6535441D8C1432A5B8F9230D346F)range;
- (BOOL)requiresAudioMix;
- (BOOL)requiresVideoComposition;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NUGeometryTransform)geomTransform;
- (NUSlowMotionNode)initWithSettings:(id)a3 inputs:(id)a4;
- (NUSlowMotionNode)initWithTimeRange:(id *)a3 rate:(float)a4 input:(id)a5;
- (float)rate;
- (id)_evaluateAudioMix:(id *)a3;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateVideo:(id *)a3;
- (id)_evaluateVideoComposition:(id *)a3;
- (id)_evaluateVideoProperties:(id *)a3;
- (id)_transformWithError:(id *)a3;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
@end

@implementation NUSlowMotionNode

- (void).cxx_destruct
{
}

- (float)rate
{
  return self->_rate;
}

- ($246D6535441D8C1432A5B8F9230D346F)range
{
  objc_copyStruct(retstr, &self->_range, 48, 1, 0);
  return result;
}

- (NUGeometryTransform)geomTransform
{
  return (NUGeometryTransform *)objc_getProperty(self, a2, 176, 1);
}

- (id)_evaluateAudioMix:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v12 = NUAssertLogger_4842();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v30 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v15 = NUAssertLogger_4842();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        v22 = [v20 callStackSymbols];
        v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v30 = v19;
        __int16 v31 = 2114;
        v32 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v30 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSlowMotionNode _evaluateAudioMix:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Time.m", 402, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"error != nil");
  }
  v5 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
  v6 = [v5 outputVideo:a3];
  [(NUSlowMotionNode *)self rate];
  int v8 = v7;
  [(NUSlowMotionNode *)self range];
  LODWORD(v9) = v8;
  v10 = +[NUSlowMotionUtilities slowMotionAudioMixFromAsset:v6 rate:v28 range:a3 error:v9];

  return v10;
}

- (BOOL)requiresAudioMix
{
  return 1;
}

- (id)_evaluateVideoProperties:(id *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)NUSlowMotionNode;
  v4 = [(NURenderNode *)&v20 _evaluateVideoProperties:a3];
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E4F16558];
    int v7 = [(_NUVideoProperties *)v4 metadata];
    int v8 = [v6 metadataItemsFromArray:v7 withKey:*MEMORY[0x1E4F15E78] keySpace:*MEMORY[0x1E4F15DF8]];
    double v9 = [v8 firstObject];

    if (v9)
    {
      v10 = [v9 numberValue];
      uint64_t v11 = [v10 integerValue];

      [(NUSlowMotionNode *)self rate];
      uint64_t v13 = fabs(v12 + -1.0) <= 0.00000999999975;
      if (v11 != v13)
      {
        v14 = (void *)[v9 mutableCopy];
        v15 = [NSNumber numberWithInteger:v13];
        [v14 setValue:v15];

        BOOL v16 = [(_NUVideoProperties *)v5 metadata];
        v17 = (void *)[v16 mutableCopy];

        [v17 removeObject:v9];
        [v17 addObject:v14];
        v18 = [[_NUVideoProperties alloc] initWithProperties:v5];
        [(_NUVideoProperties *)v18 setMetadata:v17];

        v5 = v18;
      }
    }
    v5 = v5;
  }

  return v5;
}

- (id)_evaluateVideo:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    float v12 = NUAssertLogger_4842();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v30 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v15 = NUAssertLogger_4842();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_super v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        v22 = [v20 callStackSymbols];
        v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v30 = v19;
        __int16 v31 = 2114;
        v32 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v30 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSlowMotionNode _evaluateVideo:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Time.m", 355, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"error != nil");
  }
  v5 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
  v6 = [v5 outputVideo:a3];
  [(NUSlowMotionNode *)self rate];
  int v8 = v7;
  [(NUSlowMotionNode *)self range];
  LODWORD(v9) = v8;
  v10 = +[NUSlowMotionUtilities slowMotionVideoFromAsset:v6 rate:v28 range:a3 error:v9];

  return v10;
}

- (id)_evaluateVideoComposition:(id *)a3
{
  v39[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    objc_super v20 = NUAssertLogger_4842();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v23 = NUAssertLogger_4842();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        uint64_t v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        v30 = [v28 callStackSymbols];
        __int16 v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v27;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v31;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      uint64_t v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSlowMotionNode _evaluateVideoComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Time.m", 311, @"Invalid parameter not satisfying: %s", v32, v33, v34, v35, (uint64_t)"error != NULL");
  }
  v5 = [(NURenderNode *)self outputVideo:"outputVideo:"];
  if (!v5)
  {
    v14 = 0;
    goto LABEL_13;
  }
  v6 = [(NURenderNode *)self inputs];
  int v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

  int v8 = [v7 outputVideoComposition:a3];
  double v9 = v8;
  if (v8)
  {
    v10 = [v8 instructions];
    uint64_t v11 = [v10 count];

    if (v11 == 1)
    {
      float v12 = +[NUVideoUtilities firstEnabledVideoTrackInAsset:v5 error:a3];
      if (v12)
      {
        uint64_t v13 = [v7 videoProperties:a3];
        v14 = (void *)[v9 mutableCopy];
        v15 = +[NUVideoCompositionInstruction instructionForVideoTrack:v12];
        v39[0] = v15;
        BOOL v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
        [v14 setInstructions:v16];

        memset(buf, 0, 24);
        v17 = (void *)MEMORY[0x1E4F8CE18];
        [v13 nominalFrameRate];
        objc_msgSend(v17, "minFrameDurationForNominalFrameRate:");
        [v14 setSourceTrackIDForFrameTiming:0];
        long long v36 = *(_OWORD *)buf;
        uint64_t v37 = *(void *)&buf[16];
        [v14 setFrameDuration:&v36];
      }
      else
      {
        v14 = 0;
      }

      goto LABEL_12;
    }
    v18 = [v9 instructions];
    *a3 = +[NUError unsupportedError:@"Unsupported video configuration" object:v18];
  }
  v14 = 0;
LABEL_12:

LABEL_13:

  return v14;
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
  v5 = [v4 _evaluateImage:a3];

  return v5;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v11.receiver = self;
  v11.super_class = (Class)NUSlowMotionNode;
  uint64_t v7 = [(NURenderNode *)&v11 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];
  if (v7)
  {
    long long v9 = *(_OWORD *)&self->_range.start.epoch;
    long long v8 = *(_OWORD *)&self->_range.duration.timescale;
    *(_OWORD *)(v7 + 184) = *(_OWORD *)&self->_range.start.value;
    *(_OWORD *)(v7 + 200) = v9;
    *(_OWORD *)(v7 + 216) = v8;
    *(float *)(v7 + 168) = self->_rate;
  }

  return (id)v7;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return ([a3 evaluationMode] & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (id)_transformWithError:(id *)a3
{
  long long v5 = *(_OWORD *)&self->_range.start.epoch;
  *(_OWORD *)&v24.value = *(_OWORD *)&self->_range.start.value;
  long long v6 = *(_OWORD *)&self->_range.duration.timescale;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_range.start.value;
  *(_OWORD *)&range.start.epoch = v5;
  v24.epoch = self->_range.start.epoch;
  memset(&v23, 0, sizeof(v23));
  *(_OWORD *)&range.duration.timescale = v6;
  CMTimeRangeGetEnd(&v23, &range);
  uint64_t v7 = [(NURenderNode *)self inputs];
  long long v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

  long long v9 = [v8 _evaluateVideo:a3];
  v10 = v9;
  if (v9)
  {
    memset(&range, 0, 24);
    [v9 duration];
    CMTime time = range.start;
    double Seconds = CMTimeGetSeconds(&time);
    float v12 = [NUTimeTransformSlowMo alloc];
    *(float *)&double v13 = self->_rate;
    CMTime time = v24;
    CMTime v20 = v23;
    v14 = [(NUTimeTransformSlowMo *)v12 initWithSlowMoBeginTime:&time endTime:&v20 rate:v13 assetDuration:Seconds];
    v15 = v14;
    if (v14) {
      BOOL v16 = v14;
    }
    else {
      BOOL v16 = objc_alloc_init(NUGeometryTransform);
    }
    geomTransform = self->_geomTransform;
    self->_geomTransform = v16;

    v17 = self->_geomTransform;
  }
  else
  {
    +[NUError errorWithCode:1 reason:@"[NUSlowMotionNode _transformWithError] input's _evaluateVideo failed." object:0 underlyingError:*a3];
    v17 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (NUSlowMotionNode)initWithTimeRange:(id *)a3 rate:(float)a4 input:(id)a5
{
  v28[2] = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&start.start.value = *MEMORY[0x1E4F1FA48];
  start.start.epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  *(_OWORD *)&duration.start.value = *MEMORY[0x1E4F1FA10];
  duration.start.epoch = *(void *)(MEMORY[0x1E4F1FA10] + 16);
  id v8 = a5;
  CMTimeRangeMake(&otherRange, &start.start, &duration.start);
  long long v9 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&duration.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&duration.start.epoch = v9;
  *(_OWORD *)&duration.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetIntersection(&start, &duration, &otherRange);
  long long v10 = *(_OWORD *)&start.start.epoch;
  *(_OWORD *)&a3->var0.var0 = *(_OWORD *)&start.start.value;
  *(_OWORD *)&a3->var0.var3 = v10;
  *(_OWORD *)&a3->var1.var1 = *(_OWORD *)&start.duration.timescale;
  long long v11 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&start.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&start.start.epoch = v11;
  *(_OWORD *)&start.duration.timescale = *(_OWORD *)&a3->var1.var1;
  float v12 = [MEMORY[0x1E4F29238] valueWithCMTimeRange:&start];
  *(float *)&double v13 = a4;
  v14 = [NSNumber numberWithFloat:v13];
  v27[0] = @"range";
  v27[1] = @"rate";
  v28[0] = v12;
  v28[1] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  uint64_t v25 = *MEMORY[0x1E4F1E480];
  id v26 = v8;
  BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  v21.receiver = self;
  v21.super_class = (Class)NUSlowMotionNode;
  v17 = [(NURenderNode *)&v21 initWithSettings:v15 inputs:v16];

  long long v19 = *(_OWORD *)&a3->var0.var3;
  long long v18 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)(v17 + 184) = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)(v17 + 200) = v19;
  *(_OWORD *)(v17 + 216) = v18;
  *((float *)v17 + 42) = a4;

  return (NUSlowMotionNode *)v17;
}

- (NUSlowMotionNode)initWithSettings:(id)a3 inputs:(id)a4
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
    long long v9 = NSString;
    long long v10 = v8;
    long long v11 = (objc_class *)objc_opt_class();
    float v12 = NSStringFromClass(v11);
    double v13 = NSStringFromSelector(a2);
    v14 = [v9 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v12, v13];
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v14;
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
    BOOL v16 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v17 = (void *)MEMORY[0x1E4F29060];
    long long v18 = v16;
    long long v19 = [v17 callStackSymbols];
    CMTime v20 = [v19 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v20;
    _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  objc_super v21 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  CMTime v23 = (void *)MEMORY[0x1E4F29060];
  id v24 = specific;
  long long v18 = v21;
  uint64_t v25 = [v23 callStackSymbols];
  id v26 = [v25 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v34 = specific;
  __int16 v35 = 2114;
  long long v36 = v26;
  _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUSlowMotionNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Time.m", 218, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

@end