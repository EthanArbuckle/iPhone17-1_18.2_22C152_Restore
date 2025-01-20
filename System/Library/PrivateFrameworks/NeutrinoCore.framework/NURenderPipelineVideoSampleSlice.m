@interface NURenderPipelineVideoSampleSlice
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameTime;
- (BOOL)containsMetadataSampleForKey:(id)a3;
- (BOOL)containsVideoFrameForKey:(id)a3;
- (NSDictionary)metadataSamples;
- (NSDictionary)videoFrames;
- (NURenderPipelineVideoSampleSlice)initWithFrameTime:(id *)a3;
- (NURenderPipelineVideoSampleSlice)initWithFrameTime:(id *)a3 videoFrames:(id)a4 metadataSamples:(id)a5;
- (id)description;
- (id)metadataSampleFromKey:(id)a3;
- (id)videoFrameFromKey:(id)a3;
@end

@implementation NURenderPipelineVideoSampleSlice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataSamples, 0);

  objc_storeStrong((id *)&self->_videoFrames, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (NSDictionary)metadataSamples
{
  return self->_metadataSamples;
}

- (NSDictionary)videoFrames
{
  return self->_videoFrames;
}

- (BOOL)containsMetadataSampleForKey:(id)a3
{
  v3 = [(NURenderPipelineVideoSampleSlice *)self metadataSampleFromKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)containsVideoFrameForKey:(id)a3
{
  v3 = [(NURenderPipelineVideoSampleSlice *)self videoFrameFromKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)metadataSampleFromKey:(id)a3
{
  return [(NSDictionary *)self->_metadataSamples objectForKeyedSubscript:a3];
}

- (id)videoFrameFromKey:(id)a3
{
  return [(NSDictionary *)self->_videoFrames objectForKeyedSubscript:a3];
}

- (NURenderPipelineVideoSampleSlice)initWithFrameTime:(id *)a3 videoFrames:(id)a4 metadataSamples:(id)a5
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if ((a3->var2 & 1) == 0)
  {
    v18 = NUAssertLogger_1297();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "CMTIME_IS_VALID(frameTime)");
      *(_DWORD *)buf = 138543362;
      v68 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v21 = NUAssertLogger_1297();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = (void *)MEMORY[0x1E4F29060];
        id v41 = v39;
        v42 = [v40 callStackSymbols];
        v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v68 = v39;
        __int16 v69 = 2114;
        v70 = v43;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v68 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineVideoSampleSlice initWithFrameTime:videoFrames:metadataSamples:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 314, @"Invalid parameter not satisfying: %s", v44, v45, v46, v47, (uint64_t)"CMTIME_IS_VALID(frameTime)");
  }
  if (!v8)
  {
    v25 = NUAssertLogger_1297();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "videoFrames != nil");
      *(_DWORD *)buf = 138543362;
      v68 = v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v28 = NUAssertLogger_1297();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v49 = (void *)MEMORY[0x1E4F29060];
        id v50 = v48;
        v51 = [v49 callStackSymbols];
        v52 = [v51 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v68 = v48;
        __int16 v69 = 2114;
        v70 = v52;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      v31 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v68 = v31;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineVideoSampleSlice initWithFrameTime:videoFrames:metadataSamples:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 315, @"Invalid parameter not satisfying: %s", v53, v54, v55, v56, (uint64_t)"videoFrames != nil");
  }
  v10 = v9;
  if (!v9)
  {
    v32 = NUAssertLogger_1297();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "metadataSamples != nil");
      *(_DWORD *)buf = 138543362;
      v68 = v33;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v35 = NUAssertLogger_1297();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (v34)
    {
      if (v36)
      {
        v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v58 = (void *)MEMORY[0x1E4F29060];
        id v59 = v57;
        v60 = [v58 callStackSymbols];
        v61 = [v60 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v68 = v57;
        __int16 v69 = 2114;
        v70 = v61;
        _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v36)
    {
      v37 = [MEMORY[0x1E4F29060] callStackSymbols];
      v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v68 = v38;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineVideoSampleSlice initWithFrameTime:videoFrames:metadataSamples:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 316, @"Invalid parameter not satisfying: %s", v62, v63, v64, v65, (uint64_t)"metadataSamples != nil");
  }
  v66.receiver = self;
  v66.super_class = (Class)NURenderPipelineVideoSampleSlice;
  v11 = [(NURenderPipelineVideoSampleSlice *)&v66 init];
  uint64_t v12 = [v8 copy];
  v13 = (void *)*((void *)v11 + 1);
  *((void *)v11 + 1) = v12;

  uint64_t v14 = [v10 copy];
  v15 = (void *)*((void *)v11 + 2);
  *((void *)v11 + 2) = v14;

  long long v16 = *(_OWORD *)&a3->var0;
  *((void *)v11 + 5) = a3->var3;
  *(_OWORD *)(v11 + 24) = v16;

  return (NURenderPipelineVideoSampleSlice *)v11;
}

- (NURenderPipelineVideoSampleSlice)initWithFrameTime:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((a3->var2 & 1) == 0)
  {
    BOOL v4 = NUAssertLogger_1297();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "CMTIME_IS_VALID(frameTime)");
      LODWORD(buf.var0) = 138543362;
      *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v5;
      _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v7 = NUAssertLogger_1297();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v12 = (void *)MEMORY[0x1E4F29060];
        id v13 = v11;
        uint64_t v14 = [v12 callStackSymbols];
        v15 = [v14 componentsJoinedByString:@"\n"];
        LODWORD(buf.var0) = 138543618;
        *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v11;
        LOWORD(buf.var2) = 2114;
        *(void *)((char *)&buf.var2 + 2) = v15;
        _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v8)
    {
      id v9 = [MEMORY[0x1E4F29060] callStackSymbols];
      v10 = [v9 componentsJoinedByString:@"\n"];
      LODWORD(buf.var0) = 138543362;
      *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v10;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineVideoSampleSlice initWithFrameTime:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 308, @"Invalid parameter not satisfying: %s", v16, v17, v18, v19, (uint64_t)"CMTIME_IS_VALID(frameTime)");
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE buf = *a3;
  return [(NURenderPipelineVideoSampleSlice *)self initWithFrameTime:&buf videoFrames:MEMORY[0x1E4F1CC08] metadataSamples:MEMORY[0x1E4F1CC08]];
}

- (id)description
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = [(NSDictionary *)self->_videoFrames allKeys];
  BOOL v4 = [v3 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  CMTime time = (CMTime)self->_frameTime;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  v7 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &time);
  [v5 appendFormat:@"[(%@) videoFrames: ", v7];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v4;
  uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * v11);
        id v13 = __47__NURenderPipelineVideoSampleSlice_description__block_invoke(v8, v12);
        uint64_t v14 = [(NSDictionary *)self->_videoFrames objectForKeyedSubscript:v12];
        v15 = v14;
        if (v14) {
          [v14 frameTime];
        }
        else {
          memset(&v26, 0, sizeof(v26));
        }
        CMTime time = v26;
        uint64_t v16 = (__CFString *)CMTimeCopyDescription(v6, &time);
        [v5 appendFormat:@"%@: %@ ", v13, v16];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      uint64_t v9 = v8;
    }
    while (v8);
  }

  [v5 appendString:@"\tmetadataSamples: "];
  metadataSamples = self->_metadataSamples;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __47__NURenderPipelineVideoSampleSlice_description__block_invoke_2;
  v22[3] = &unk_1E5D93D90;
  id v18 = v5;
  v24 = self;
  id v25 = &__block_literal_global_1405;
  id v23 = v18;
  [(NSDictionary *)metadataSamples enumerateKeysAndObjectsUsingBlock:v22];
  [v18 appendString:@"]"];
  id v19 = v18;

  return v19;
}

id __47__NURenderPipelineVideoSampleSlice_description__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = [v2 length];
  if (v3 >= 3) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = v3;
  }
  id v5 = [v2 substringToIndex:v4];

  return v5;
}

void __47__NURenderPipelineVideoSampleSlice_description__block_invoke_2(void *a1, void *a2)
{
  unint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[6];
  id v5 = *(void (**)(uint64_t, id))(v4 + 16);
  id v6 = a2;
  v7 = v5(v4, v6);
  uint64_t v8 = [*(id *)(a1[5] + 16) objectForKeyedSubscript:v6];

  if (v8) {
    [v8 frameTime];
  }
  else {
    memset(&v11, 0, sizeof(v11));
  }
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CMTime time = v11;
  uint64_t v10 = (__CFString *)CMTimeCopyDescription(v9, &time);
  [v3 appendFormat:@"%@: %@ ", v7, v10];
}

@end