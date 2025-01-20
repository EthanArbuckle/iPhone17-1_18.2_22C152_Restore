@interface NURenderPipelineState
- ($0AC6E346AE4835514AAA8AC86D8F4844)scale;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)rawTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (BOOL)applyPipelineSettings:(id)a3 error:(id *)a4;
- (BOOL)disableIntermediateCaching;
- (BOOL)doNotOverride;
- (BOOL)enableTransparency;
- (BOOL)endGroupWithName:(id)a3 error:(id *)a4;
- (BOOL)enforceEvenDimensions;
- (BOOL)lowMemoryMode;
- (BOOL)updatePipelineStateForWindowedSampleIndex:(unint64_t)a3;
- (NSArray)pipelineFilters;
- (NSArray)videoSampleSlices;
- (NSDictionary)videoFrames;
- (NSDictionary)videoMetadataSamples;
- (NUDevice)device;
- (NURenderPipelineState)init;
- (NURenderTagGroup)currentGroup;
- (NURenderTagGroup)rootGroup;
- (id)beginGroupWithName:(id)a3 error:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initForCopy;
- (id)pipelineSettingsFromSourceSettings:(id)a3;
- (int64_t)auxiliaryImageType;
- (int64_t)evaluationMode;
- (int64_t)mediaComponentType;
- (int64_t)playbackDirection;
- (int64_t)roundingPolicy;
- (int64_t)sampleMode;
- (int64_t)serialNumber;
- (unint64_t)groupCount;
- (void)resetRenderTagGroups;
- (void)setAuxiliaryImageType:(int64_t)a3;
- (void)setDevice:(id)a3;
- (void)setDisableIntermediateCaching:(BOOL)a3;
- (void)setDoNotOverride:(BOOL)a3;
- (void)setEnableTransparency:(BOOL)a3;
- (void)setEnforceEvenDimensions:(BOOL)a3;
- (void)setEvaluationMode:(int64_t)a3;
- (void)setLowMemoryMode:(BOOL)a3;
- (void)setMediaComponentType:(int64_t)a3;
- (void)setPipelineFilters:(id)a3;
- (void)setPlaybackDirection:(int64_t)a3;
- (void)setRawTime:(id *)a3;
- (void)setRoundingPolicy:(int64_t)a3;
- (void)setSampleMode:(int64_t)a3;
- (void)setScale:(id)a3;
- (void)setTime:(id *)a3;
- (void)setVideoFrames:(id)a3;
- (void)setVideoMetadataSamples:(id)a3;
- (void)setVideoSampleSlices:(id)a3;
@end

@implementation NURenderPipelineState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentGroup, 0);
  objc_storeStrong((id *)&self->_rootGroup, 0);
  objc_storeStrong((id *)&self->_videoSampleSlices, 0);
  objc_storeStrong((id *)&self->_videoMetadataSamples, 0);
  objc_storeStrong((id *)&self->_videoFrames, 0);
  objc_storeStrong((id *)&self->_pipelineFilters, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_groupStack, 0);
}

- (unint64_t)groupCount
{
  return self->_groupCount;
}

- (NURenderTagGroup)currentGroup
{
  return (NURenderTagGroup *)objc_getProperty(self, a2, 128, 1);
}

- (NURenderTagGroup)rootGroup
{
  return (NURenderTagGroup *)objc_getProperty(self, a2, 120, 1);
}

- (void)setVideoSampleSlices:(id)a3
{
}

- (NSArray)videoSampleSlices
{
  return self->_videoSampleSlices;
}

- (void)setVideoMetadataSamples:(id)a3
{
}

- (NSDictionary)videoMetadataSamples
{
  return self->_videoMetadataSamples;
}

- (void)setVideoFrames:(id)a3
{
}

- (NSDictionary)videoFrames
{
  return self->_videoFrames;
}

- (void)setPipelineFilters:(id)a3
{
}

- (NSArray)pipelineFilters
{
  return self->_pipelineFilters;
}

- (void)setDevice:(id)a3
{
}

- (NUDevice)device
{
  return self->_device;
}

- (void)setLowMemoryMode:(BOOL)a3
{
  self->_lowMemoryMode = a3;
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (void)setDoNotOverride:(BOOL)a3
{
  self->_doNotOverride = a3;
}

- (BOOL)doNotOverride
{
  return self->_doNotOverride;
}

- (void)setEnforceEvenDimensions:(BOOL)a3
{
  self->_enforceEvenDimensions = a3;
}

- (BOOL)enforceEvenDimensions
{
  return self->_enforceEvenDimensions;
}

- (void)setEnableTransparency:(BOOL)a3
{
  self->_enableTransparency = a3;
}

- (BOOL)enableTransparency
{
  return self->_enableTransparency;
}

- (void)setDisableIntermediateCaching:(BOOL)a3
{
  self->_disableIntermediateCaching = a3;
}

- (BOOL)disableIntermediateCaching
{
  return self->_disableIntermediateCaching;
}

- (void)setPlaybackDirection:(int64_t)a3
{
  self->_playbackDirection = a3;
}

- (int64_t)playbackDirection
{
  return self->_playbackDirection;
}

- (void)setRoundingPolicy:(int64_t)a3
{
  self->_roundingPolicy = a3;
}

- (int64_t)roundingPolicy
{
  return self->_roundingPolicy;
}

- (void)setScale:(id)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = a3;
  objc_copyStruct(&self->_scale, &v3, 16, 1, 0);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)scale
{
  objc_copyStruct(v4, &self->_scale, 16, 1, 0);
  int64_t v2 = v4[0];
  int64_t v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setSampleMode:(int64_t)a3
{
  self->_sampleMode = a3;
}

- (int64_t)sampleMode
{
  return self->_sampleMode;
}

- (void)setRawTime:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)rawTime
{
  objc_copyStruct(retstr, &self->_rawTime, 24, 1, 0);
  return result;
}

- (void)setTime:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  objc_copyStruct(retstr, &self->_time, 24, 1, 0);
  return result;
}

- (void)setAuxiliaryImageType:(int64_t)a3
{
  self->_auxiliaryImageType = a3;
}

- (int64_t)auxiliaryImageType
{
  return self->_auxiliaryImageType;
}

- (void)setMediaComponentType:(int64_t)a3
{
  self->_mediaComponentType = a3;
}

- (int64_t)mediaComponentType
{
  return self->_mediaComponentType;
}

- (void)setEvaluationMode:(int64_t)a3
{
  self->_evaluationMode = a3;
}

- (int64_t)evaluationMode
{
  return self->_evaluationMode;
}

- (int64_t)serialNumber
{
  return self->_serialNumber;
}

- (BOOL)updatePipelineStateForWindowedSampleIndex:(unint64_t)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_videoSampleSlices count] <= a3)
  {
    v10 = NUAssertLogger_1297();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = [NSString stringWithFormat:@"Out of bounds index for windowed samples"];
      *(_DWORD *)buf = 138543362;
      v31 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v13 = NUAssertLogger_1297();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        v20 = [v18 callStackSymbols];
        v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v31 = v17;
        __int16 v32 = 2114;
        v33 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v31 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineState updatePipelineStateForWindowedSampleIndex:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 268, @"Out of bounds index for windowed samples", v22, v23, v24, v25, v26);
  }
  v5 = [(NSArray *)self->_videoSampleSlices objectAtIndexedSubscript:a3];
  v6 = v5;
  if (v5)
  {
    [v5 frameTime];
  }
  else
  {
    long long v28 = 0uLL;
    uint64_t v29 = 0;
  }
  long long v26 = v28;
  uint64_t v27 = v29;
  [(NURenderPipelineState *)self setTime:&v26];
  v7 = [v6 videoFrames];
  [(NURenderPipelineState *)self setVideoFrames:v7];

  v8 = [v6 metadataSamples];
  [(NURenderPipelineState *)self setVideoMetadataSamples:v8];

  return 1;
}

- (id)pipelineSettingsFromSourceSettings:(id)a3
{
  int64_t v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [v4 objectForKeyedSubscript:@"scale"];
  [v5 setObject:v6 forKeyedSubscript:@"scale"];

  v7 = [v4 objectForKeyedSubscript:@"frameTime"];
  [v5 setObject:v7 forKeyedSubscript:@"frameTime"];

  v8 = [v4 objectForKeyedSubscript:@"defaultFrameTime"];
  [v5 setObject:v8 forKeyedSubscript:@"defaultFrameTime"];

  v9 = [v4 objectForKeyedSubscript:@"auxiliaryImageType"];
  [v5 setObject:v9 forKeyedSubscript:@"auxiliaryImageType"];

  v10 = [v4 objectForKeyedSubscript:@"mediaComponentType"];
  [v5 setObject:v10 forKeyedSubscript:@"mediaComponentType"];

  v11 = [v4 objectForKeyedSubscript:@"sampleMode"];

  [v5 setObject:v11 forKeyedSubscript:@"sampleMode"];

  return v5;
}

- (BOOL)applyPipelineSettings:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    BOOL v14 = NUAssertLogger_1297();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v17 = NUAssertLogger_1297();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        uint64_t v24 = [v22 callStackSymbols];
        uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v21;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v25;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      id v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineState applyPipelineSettings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 180, @"Invalid parameter not satisfying: %s", v26, v27, v28, v29, (uint64_t)"error != nil");
  }
  v7 = v6;
  if ([(NURenderPipelineState *)self doNotOverride]) {
    goto LABEL_3;
  }
  v9 = [v7 objectForKeyedSubscript:@"scale"];
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (*(_OWORD *)buf = NUScaleUnknown, [v9 getValue:buf], *(uint64_t *)buf < 1)
      || *(uint64_t *)&buf[8] < 1)
    {
      id v12 = +[NUError invalidError:@"invalid scale in settings" object:v9];
LABEL_14:
      BOOL v8 = 0;
      *a4 = v12;
LABEL_36:

      goto LABEL_37;
    }
    *(_OWORD *)buf = NUScaleUnknown;
    [v9 getValue:buf];
    -[NURenderPipelineState setScale:](self, "setScale:", *(void *)buf, *(void *)&buf[8]);
  }
  v10 = [v7 objectForKeyedSubscript:@"frameTime"];

  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ([v10 CMTimeValue], (v40 & 1) == 0))
    {
      id v11 = +[NUError invalidError:@"invalid time in settings" object:v10];
      goto LABEL_34;
    }
    [v10 CMTimeValue];
    long long v36 = v38;
    uint64_t v37 = v39;
    [(NURenderPipelineState *)self setTime:&v36];
  }
  v9 = [v7 objectForKeyedSubscript:@"defaultFrameTime"];

  if (v9)
  {
    [(NURenderPipelineState *)self time];
    if ((v35 & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ([v9 CMTimeValue], (v34 & 1) == 0))
      {
        id v12 = +[NUError invalidError:@"invalid time in settings" object:v9];
        goto LABEL_14;
      }
      [v9 CMTimeValue];
      long long v30 = v32;
      uint64_t v31 = v33;
      [(NURenderPipelineState *)self setTime:&v30];
    }
  }
  v10 = [v7 objectForKeyedSubscript:@"auxiliaryImageType"];

  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !NUAuxiliaryImageTypeFromString(v10))
    {
      id v11 = +[NUError invalidError:@"invalid auxiliaryImageType in settings" object:v10];
      goto LABEL_34;
    }
    [(NURenderPipelineState *)self setAuxiliaryImageType:NUAuxiliaryImageTypeFromString(v10)];
  }
  v9 = [v7 objectForKeyedSubscript:@"mediaComponentType"];

  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !NUMediaComponentTypeFromString(v9))
    {
      id v12 = +[NUError invalidError:@"invalid mediaComponentType in settings" object:v9];
      goto LABEL_14;
    }
    [(NURenderPipelineState *)self setMediaComponentType:NUMediaComponentTypeFromString(v9)];
  }
  v10 = [v7 objectForKeyedSubscript:@"sampleMode"];

  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(NURenderPipelineState *)self setSampleMode:NUSampleModeFromString(v10)];
      BOOL v8 = 1;
LABEL_35:
      v9 = v10;
      goto LABEL_36;
    }
    id v11 = +[NUError invalidError:@"invalid sampleMode in source settings" object:v10];
LABEL_34:
    BOOL v8 = 0;
    *a4 = v11;
    goto LABEL_35;
  }
LABEL_3:
  BOOL v8 = 1;
LABEL_37:

  return v8;
}

- (BOOL)endGroupWithName:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v17 = NUAssertLogger_1297();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      BOOL v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "name != nil");
      *(_DWORD *)buf = 138543362;
      v50 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v20 = NUAssertLogger_1297();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        uint64_t v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        char v34 = [v32 callStackSymbols];
        char v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v50 = v31;
        __int16 v51 = 2114;
        v52 = v35;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      uint64_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v50 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineState endGroupWithName:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 158, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"name != nil");
  }
  if (!a4)
  {
    uint64_t v24 = NUAssertLogger_1297();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v50 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v27 = NUAssertLogger_1297();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        char v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        v43 = [v41 callStackSymbols];
        v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v50 = v40;
        __int16 v51 = 2114;
        v52 = v44;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      uint64_t v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v50 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineState endGroupWithName:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 159, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"error != nil");
  }
  v7 = v6;
  BOOL v8 = [(NURenderPipelineState *)self currentGroup];
  v9 = [v8 path];
  v10 = [v9 lastPathComponent];

  char v11 = [v7 isEqualToString:v10];
  if (v11)
  {
    id v12 = [(NURenderPipelineState *)self currentGroup];
    v13 = [v12 parent];
    currentGroup = self->_currentGroup;
    self->_currentGroup = v13;

    --self->_groupCount;
  }
  else
  {
    v15 = [NSString stringWithFormat:@"end scoping (%@) does not match the start namespace (%@)", v7, v10];
    *a4 = +[NUError errorWithCode:5 reason:v15 object:v7];
  }
  return v11;
}

- (id)beginGroupWithName:(id)a3 error:(id *)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v16 = NUAssertLogger_1297();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "name != nil");
      *(_DWORD *)buf = 138543362;
      v49 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v19 = NUAssertLogger_1297();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        long long v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        id v33 = [v31 callStackSymbols];
        char v34 = [v33 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v49 = v30;
        __int16 v50 = 2114;
        __int16 v51 = v34;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      BOOL v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v49 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineState beginGroupWithName:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 129, @"Invalid parameter not satisfying: %s", v35, v36, v37, v38, (uint64_t)"name != nil");
  }
  if (!a4)
  {
    id v23 = NUAssertLogger_1297();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v49 = v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v26 = NUAssertLogger_1297();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v25)
    {
      if (v27)
      {
        uint64_t v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        char v40 = (void *)MEMORY[0x1E4F29060];
        id v41 = v39;
        id v42 = [v40 callStackSymbols];
        v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v49 = v39;
        __int16 v50 = 2114;
        __int16 v51 = v43;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      BOOL v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v49 = v29;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineState beginGroupWithName:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 130, @"Invalid parameter not satisfying: %s", v44, v45, v46, v47, (uint64_t)"error != nil");
  }
  v7 = v6;
  if (+[NURenderTagNode validateName:v6 error:a4])
  {
    BOOL v8 = [(NURenderPipelineState *)self currentGroup];
    v9 = [v8 childWithName:v7];

    if (v9)
    {
      v10 = NSString;
      char v11 = [v8 path];
      id v12 = [v10 stringWithFormat:@"A group with name '%@' already exists on parent : '%@'", v7, v11];

      *a4 = +[NUError errorWithCode:5 reason:v12 object:v7];

      v13 = 0;
    }
    else
    {
      v13 = objc_opt_new();
      BOOL v14 = [(NURenderPipelineState *)self currentGroup];
      [v14 addChild:v13 withName:v7];

      objc_storeStrong((id *)&self->_currentGroup, v13);
      ++self->_groupCount;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)description
{
  int64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(NURenderPipelineState *)self evaluationMode] - 1;
  if (v5 > 2) {
    id v6 = @"Prepare";
  }
  else {
    id v6 = off_1E5D93E68[v5];
  }
  v7 = [(NURenderPipelineState *)self currentGroup];
  unint64_t mediaComponentType = self->_mediaComponentType;
  if (mediaComponentType > 2) {
    v9 = @"Invalid";
  }
  else {
    v9 = off_1E5D94178[mediaComponentType];
  }
  v10 = v9;
  char v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld:%ld", self->_scale.numerator, self->_scale.denominator);
  unint64_t auxiliaryImageType = self->_auxiliaryImageType;
  if (auxiliaryImageType > 0xB) {
    v13 = @"Invalid";
  }
  else {
    v13 = off_1E5D94190[auxiliaryImageType];
  }
  BOOL v14 = v13;
  CMTime time = (CMTime)self->_time;
  v15 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &time);
  v16 = [v3 stringWithFormat:@"<%@:%p> evaluationMode=%@ group=%@ componentType=%@ scale=%@ auxType=%@ time=%@", v4, self, v6, v7, v10, v11, v14, v15];

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [objc_alloc((Class)objc_opt_class()) initForCopy];
  *(void *)(v4 + 24) = [(NURenderPipelineState *)self serialNumber];
  objc_msgSend((id)v4, "setEvaluationMode:", -[NURenderPipelineState evaluationMode](self, "evaluationMode"));
  objc_msgSend((id)v4, "setMediaComponentType:", -[NURenderPipelineState mediaComponentType](self, "mediaComponentType"));
  objc_msgSend((id)v4, "setAuxiliaryImageType:", -[NURenderPipelineState auxiliaryImageType](self, "auxiliaryImageType"));
  [(NURenderPipelineState *)self time];
  long long v12 = v14;
  uint64_t v13 = v15;
  [(id)v4 setTime:&v12];
  objc_msgSend((id)v4, "setPlaybackDirection:", -[NURenderPipelineState playbackDirection](self, "playbackDirection"));
  objc_msgSend((id)v4, "setSampleMode:", -[NURenderPipelineState sampleMode](self, "sampleMode"));
  uint64_t v5 = [(NURenderPipelineState *)self scale];
  objc_msgSend((id)v4, "setScale:", v5, v6);
  objc_msgSend((id)v4, "setRoundingPolicy:", -[NURenderPipelineState roundingPolicy](self, "roundingPolicy"));
  objc_msgSend((id)v4, "setDisableIntermediateCaching:", -[NURenderPipelineState disableIntermediateCaching](self, "disableIntermediateCaching"));
  objc_msgSend((id)v4, "setEnableTransparency:", -[NURenderPipelineState enableTransparency](self, "enableTransparency"));
  objc_msgSend((id)v4, "setEnforceEvenDimensions:", -[NURenderPipelineState enforceEvenDimensions](self, "enforceEvenDimensions"));
  objc_msgSend((id)v4, "setDoNotOverride:", -[NURenderPipelineState doNotOverride](self, "doNotOverride"));
  objc_msgSend((id)v4, "setLowMemoryMode:", -[NURenderPipelineState lowMemoryMode](self, "lowMemoryMode"));
  v7 = [(NURenderPipelineState *)self pipelineFilters];
  [(id)v4 setPipelineFilters:v7];

  BOOL v8 = [(NURenderPipelineState *)self videoFrames];
  [(id)v4 setVideoFrames:v8];

  v9 = [(NURenderPipelineState *)self videoMetadataSamples];
  [(id)v4 setVideoMetadataSamples:v9];

  v10 = [(NURenderPipelineState *)self videoSampleSlices];
  [(id)v4 setVideoSampleSlices:v10];

  objc_storeStrong((id *)(v4 + 120), self->_rootGroup);
  *(void *)(v4 + 136) = self->_groupCount;
  objc_storeStrong((id *)(v4 + 128), self->_currentGroup);
  objc_storeStrong((id *)(v4 + 8), self->_groupStack);
  objc_storeStrong((id *)(v4 + 80), self->_device);
  return (id)v4;
}

- (id)initForCopy
{
  v3.receiver = self;
  v3.super_class = (Class)NURenderPipelineState;
  return [(NURenderPipelineState *)&v3 init];
}

- (void)resetRenderTagGroups
{
  objc_super v3 = objc_alloc_init(NURenderTagGroup);
  rootGroup = self->_rootGroup;
  self->_rootGroup = v3;

  self->_groupCount = 1;
  objc_storeStrong((id *)&self->_currentGroup, self->_rootGroup);
  self->_groupStack = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);

  MEMORY[0x1F41817F8]();
}

- (NURenderPipelineState)init
{
  v11.receiver = self;
  v11.super_class = (Class)NURenderPipelineState;
  int64_t v2 = [(NURenderPipelineState *)&v11 init];
  unint64_t add = atomic_fetch_add(&NURenderPipelineStateSerialNumber, 1uLL);
  v2->_evaluationMode = 0;
  v2->_unint64_t mediaComponentType = 0;
  v2->_serialNumber = add;
  *(_OWORD *)&v2->_unint64_t auxiliaryImageType = xmmword_1A9A72CA0;
  long long v4 = NUScaleOne;
  v2->_roundingPolicy = 0;
  uint64_t v5 = MEMORY[0x1E4F1F9F8];
  long long v6 = *MEMORY[0x1E4F1F9F8];
  v2->_scale = ($F9703ADC4DD3124DE91DE417D7636CC9)v4;
  *(_OWORD *)&v2->_time.value = v6;
  v2->_time.epoch = *(void *)(v5 + 16);
  v7 = +[NUPlatform currentPlatform];
  uint64_t v8 = [v7 mainDevice];
  device = v2->_device;
  v2->_device = (NUDevice *)v8;

  [(NURenderPipelineState *)v2 resetRenderTagGroups];
  return v2;
}

@end