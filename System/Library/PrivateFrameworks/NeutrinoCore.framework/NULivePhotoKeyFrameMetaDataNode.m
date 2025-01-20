@interface NULivePhotoKeyFrameMetaDataNode
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NULivePhotoKeyFrameMetaDataNode)initWithSettings:(id)a3 inputs:(id)a4;
- (NULivePhotoKeyFrameMetaDataNode)initWithTime:(id *)a3 input:(id)a4;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateVideo:(id *)a3;
- (id)_evaluateVideoProperties:(id *)a3;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
@end

@implementation NULivePhotoKeyFrameMetaDataNode

- (id)_evaluateImage:(id *)a3
{
  v4 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
  v5 = [v4 _evaluateImage:a3];

  return v5;
}

- (id)_evaluateVideoProperties:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v8 = NUAssertLogger_1099();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v28 = v9;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v11 = NUAssertLogger_1099();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v16 = (void *)MEMORY[0x1E4F29060];
        id v17 = v15;
        v18 = [v16 callStackSymbols];
        v19 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v28 = v15;
        __int16 v29 = 2114;
        v30 = v19;
        _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
      v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v28 = v14;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NULivePhotoKeyFrameMetaDataNode _evaluateVideoProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+KeyFrame.m", 106, @"Invalid parameter not satisfying: %s", v20, v21, v22, v23, (uint64_t)"error != NULL");
  }
  v26.receiver = self;
  v26.super_class = (Class)NULivePhotoKeyFrameMetaDataNode;
  uint64_t v4 = -[NURenderNode _evaluateVideoProperties:](&v26, sel__evaluateVideoProperties_);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [[_NUVideoProperties alloc] initWithProperties:v4];
    long long v24 = *(_OWORD *)&self->_timeFromAdjustment.value;
    int64_t epoch = self->_timeFromAdjustment.epoch;
    [(_NUVideoProperties *)v6 setLivePhotoKeyFrameTime:&v24];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_evaluateVideo:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v10 = NUAssertLogger_1099();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v28 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v13 = NUAssertLogger_1099();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        id v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        uint64_t v20 = [v18 callStackSymbols];
        uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v28 = v17;
        __int16 v29 = 2114;
        v30 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v28 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NULivePhotoKeyFrameMetaDataNode _evaluateVideo:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+KeyFrame.m", 78, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"error != nil");
  }
  v26.receiver = self;
  v26.super_class = (Class)NULivePhotoKeyFrameMetaDataNode;
  uint64_t v4 = -[NURenderNode _evaluateVideo:](&v26, sel__evaluateVideo_);
  if (v4)
  {
    v5 = +[NUVideoUtilities metadataTrackWithStillImageDisplayTimeMarkerInLivePhotoAsset:v4];
    if (v5)
    {
      id v6 = (id)[v4 mutableCopy];
      if (v6)
      {
        v7 = objc_msgSend(v6, "trackWithTrackID:", objc_msgSend(v5, "trackID"));
        [v6 removeTrack:v7];

        id v8 = v6;
      }
      else
      {
        *a3 = +[NUError errorWithCode:1 reason:@"[NULivePhotoKeyFrameMetaDataNode _evaluateVideo] failed to get mutableCopy" object:v4];
      }
    }
    else
    {
      id v6 = v4;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v10.receiver = self;
  v10.super_class = (Class)NULivePhotoKeyFrameMetaDataNode;
  uint64_t v7 = [(NURenderNode *)&v10 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];
  if (v7)
  {
    int64_t epoch = self->_timeFromAdjustment.epoch;
    *(_OWORD *)(v7 + 168) = *(_OWORD *)&self->_timeFromAdjustment.value;
    *(void *)(v7 + 184) = epoch;
  }

  return (id)v7;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = (void *)[v9 copy];
  if (!v9)
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    goto LABEL_5;
  }
  [v9 time];
  if ((v17 & 0x100000000) == 0)
  {
LABEL_5:
    long long v14 = *(_OWORD *)&self->_timeFromAdjustment.value;
    int64_t epoch = self->_timeFromAdjustment.epoch;
    [v10 setTime:&v14];
  }
  v13.receiver = self;
  v13.super_class = (Class)NULivePhotoKeyFrameMetaDataNode;
  v11 = [(NURenderNode *)&v13 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];

  return v11;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return ([a3 evaluationMode] & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (NULivePhotoKeyFrameMetaDataNode)initWithSettings:(id)a3 inputs:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_1114);
  }
  id v8 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v9 = NSString;
    objc_super v10 = v8;
    v11 = (objc_class *)objc_opt_class();
    BOOL v12 = NSStringFromClass(v11);
    objc_super v13 = NSStringFromSelector(a2);
    long long v14 = [v9 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v12, v13];
    *(_DWORD *)buf = 138543362;
    v34 = v14;
    _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v15 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v15 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_1114);
      }
      goto LABEL_8;
    }
    if (v15 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_1114);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    uint64_t v16 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F29060];
    uint64_t v18 = v16;
    id v19 = [v17 callStackSymbols];
    uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v34 = v20;
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
  objc_super v26 = [v25 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v34 = specific;
  __int16 v35 = 2114;
  v36 = v26;
  _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NULivePhotoKeyFrameMetaDataNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+KeyFrame.m", 38, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

- (NULivePhotoKeyFrameMetaDataNode)initWithTime:(id *)a3 input:(id)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!v6)
  {
    uint64_t v15 = NUAssertLogger_1099();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      LODWORD(time.value) = 138543362;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v18 = NUAssertLogger_1099();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        uint64_t v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        uint64_t v25 = [v23 callStackSymbols];
        objc_super v26 = [v25 componentsJoinedByString:@"\n"];
        LODWORD(time.value) = 138543618;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v22;
        LOWORD(time.flags) = 2114;
        *(void *)((char *)&time.flags + 2) = v26;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time, 0x16u);
      }
    }
    else if (v19)
    {
      uint64_t v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
      LODWORD(time.value) = 138543362;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NULivePhotoKeyFrameMetaDataNode initWithTime:input:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+KeyFrame.m", 27, @"Invalid parameter not satisfying: %s", v27, v28, v29, v30, (uint64_t)"input != nil");
  }
  id v7 = v6;
  uint64_t v8 = *MEMORY[0x1E4F1E500];
  CMTime time = (CMTime)*a3;
  uint64_t v35 = v8;
  CFDictionaryRef v9 = CMTimeCopyAsDictionary(&time, 0);
  v36[0] = v9;
  objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
  uint64_t v32 = *MEMORY[0x1E4F1E480];
  v33 = v7;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  v31.receiver = self;
  v31.super_class = (Class)NULivePhotoKeyFrameMetaDataNode;
  BOOL v12 = [(NURenderNode *)&v31 initWithSettings:v10 inputs:v11];

  int64_t var3 = a3->var3;
  *(_OWORD *)(v12 + 168) = *(_OWORD *)&a3->var0;
  *((void *)v12 + 23) = var3;

  return (NULivePhotoKeyFrameMetaDataNode *)v12;
}

@end