@interface NUVideoCompositor
+ (id)metadataSamplesInWindowForTrackID:(int)a3 fromRequest:(id)a4;
+ (id)videoFramesInWindowForTrackID:(int)a3 fromRequest:(id)a4;
- (BOOL)canConformColorOfSourceFrames;
- (BOOL)supportsHDROutput;
- (BOOL)supportsHDRSourceFrames;
- (BOOL)supportsWideColorSourceFrames;
- (BOOL)testAndSetVideoCompositionRequestFinished:(id)a3;
- (NSDictionary)requiredPixelBufferAttributesForRenderContext;
- (NSDictionary)sourcePixelBufferAttributes;
- (NUVideoCompositor)init;
- (id)videoFramesFromRequest:(id)a3;
- (id)videoMetadataSamplesFromRequest:(id)a3;
- (id)videoSampleSlicesFromRequest:(id)a3;
- (int64_t)playbackDirection;
- (void)anticipateRenderingUsingHint:(id)a3;
- (void)cancelAllPendingVideoCompositionRequests;
- (void)failVideoCompositionRequest:(id)a3 error:(id)a4;
- (void)finishCompositionRequest:(id)a3 withComposedVideoFrame:(__CVBuffer *)a4;
- (void)fulfillVideoCompositionRequest:(id)a3;
- (void)setColorSpaceOfDestinationBuffer:(__CVBuffer *)a3 fromPrimarySourceBufferOfRequest:(id)a4;
- (void)setPlaybackDirection:(int64_t)a3;
- (void)startVideoCompositionRequest:(id)a3;
@end

@implementation NUVideoCompositor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequests, 0);

  objc_storeStrong((id *)&self->_renderingQueue, 0);
}

- (void)setPlaybackDirection:(int64_t)a3
{
  self->_playbackDirection = a3;
}

- (int64_t)playbackDirection
{
  return self->_playbackDirection;
}

- (void)anticipateRenderingUsingHint:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    [v4 startCompositionTime];
    [v5 endCompositionTime];
    if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
    {
      [v5 startCompositionTime];
      [v5 endCompositionTime];
      goto LABEL_6;
    }
LABEL_8:
    int64_t v6 = 1;
    goto LABEL_10;
  }
  memset(&time1, 0, sizeof(time1));
  memset(&time2, 0, sizeof(time2));
  if (CMTimeCompare(&time1, &time2) < 0) {
    goto LABEL_8;
  }
  memset(&v8, 0, sizeof(v8));
  memset(&v7, 0, sizeof(v7));
LABEL_6:
  if (CMTimeCompare(&v8, &v7) < 1) {
    int64_t v6 = 3;
  }
  else {
    int64_t v6 = 2;
  }
LABEL_10:
  self->_playbackDirection = v6;
}

- (void)failVideoCompositionRequest:(id)a3 error:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5) {
    [v5 compositionTime];
  }
  else {
    memset(&v12, 0, sizeof(v12));
  }
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CMTime time = v12;
  CMTime v8 = (__CFString *)CMTimeCopyDescription(v7, &time);
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_17465);
  }
  v9 = (void *)_NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
  {
    v10 = v9;
    uint64_t v11 = objc_opt_class();
    LODWORD(time.value) = 138543874;
    *(CMTimeValue *)((char *)&time.value + 4) = v11;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = v8;
    HIWORD(time.epoch) = 2114;
    id v14 = v6;
    _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "%{public}@ failed to generate video frame at %{public}@: %{public}@", (uint8_t *)&time, 0x20u);
  }
  [v5 finishWithError:v6];
}

- (void)setColorSpaceOfDestinationBuffer:(__CVBuffer *)a3 fromPrimarySourceBufferOfRequest:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v48 = a4;
  id v5 = [v48 sourceTrackIDs];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    uint64_t v15 = NUAssertLogger_17470();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = [NSString stringWithFormat:@"Track IDs are missing on instruction"];
      *(_DWORD *)buf = 138543362;
      v50 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v18 = NUAssertLogger_17470();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        v32 = [v30 callStackSymbols];
        v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v50 = v29;
        __int16 v51 = 2114;
        v52 = v33;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v50 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoCompositor setColorSpaceOfDestinationBuffer:fromPrimarySourceBufferOfRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoCompositor.m", 423, @"Track IDs are missing on instruction", v34, v35, v36, v37, v47);
  }
  CFAllocatorRef v7 = [v48 videoCompositionInstruction];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = NUAssertLogger_17470();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = [NSString stringWithFormat:@"Unexpected videoComposition request"];
      *(_DWORD *)buf = 138543362;
      v50 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v25 = NUAssertLogger_17470();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v24)
    {
      if (v26)
      {
        v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        v41 = [v39 callStackSymbols];
        v42 = [v41 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v50 = v38;
        __int16 v51 = 2114;
        v52 = v42;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v50 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoCompositor setColorSpaceOfDestinationBuffer:fromPrimarySourceBufferOfRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoCompositor.m", 426, @"Unexpected videoComposition request", v43, v44, v45, v46, v47);
  }
  CMTime v8 = [v7 trackIDForSourceIdentifier:@"video"];
  if (!v8)
  {
    v9 = [v48 sourceTrackIDs];
    CMTime v8 = [v9 firstObject];
  }
  v10 = (__CVBuffer *)objc_msgSend(v48, "sourceFrameByTrackID:", objc_msgSend(v8, "intValue"));
  CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F24A00];
  NUCopyCVBufferAttachment(v10, a3, (CFStringRef)*MEMORY[0x1E4F24A00]);
  NUCopyCVBufferAttachment(v10, a3, (CFStringRef)*MEMORY[0x1E4F24C18]);
  CFStringRef v12 = (const __CFString *)*MEMORY[0x1E4F24BC8];
  NUCopyCVBufferAttachment(v10, a3, (CFStringRef)*MEMORY[0x1E4F24BC8]);
  NUCopyCVBufferAttachment(v10, a3, (CFStringRef)*MEMORY[0x1E4F24A90]);
  CFStringRef v13 = (const __CFString *)*MEMORY[0x1E4F24B28];
  NUCopyCVBufferAttachment(v10, a3, (CFStringRef)*MEMORY[0x1E4F24B28]);
  id v14 = (void *)CVBufferCopyAttachment(a3, v12, 0);
  if ([v14 isEqualToString:*MEMORY[0x1E4F24C08]])
  {
    CVBufferSetAttachment(a3, v12, (CFTypeRef)*MEMORY[0x1E4F24BE0], kCVAttachmentMode_ShouldPropagate);
    CVBufferRemoveAttachment(a3, v13);
    CVBufferRemoveAttachment(a3, v11);
  }
  NUCopyCVBufferAttachment(v10, a3, (CFStringRef)*MEMORY[0x1E4F249F0]);
  NUCopyCVBufferAttachment(v10, a3, (CFStringRef)*MEMORY[0x1E4F24BB8]);
}

- (id)videoMetadataSamplesFromRequest:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [v3 videoCompositionInstruction];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = [v3 sourceSampleDataTrackIDs];
  uint64_t v5 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v34;
    CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v26 = *(void *)v34;
    do
    {
      uint64_t v8 = 0;
      uint64_t v27 = v6;
      do
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v33 + 1) + 8 * v8);
        v10 = [v4 sourceIdentifierForMetadataTrackID:v9];
        uint64_t v11 = [v9 intValue];
        CFStringRef v12 = [v3 sourceTimedMetadataByTrackID:v11];
        if (v12)
        {
          CFStringRef v13 = [NURenderPipelineVideoMetadataSample alloc];
          if (v3) {
            [v3 compositionTime];
          }
          else {
            memset(v30, 0, sizeof(v30));
          }
          v20 = [(NURenderPipelineVideoMetadataSample *)v13 initWithFrameTime:v30 metadataGroup:v12];
          [v29 setObject:v20 forKeyedSubscript:v10];
        }
        else
        {
          id v14 = v4;
          uint64_t v15 = NSString;
          v16 = [v3 videoCompositionInstruction];
          v17 = [v16 requiredSourceSampleDataTrackIDs];
          v18 = [v15 stringWithFormat:@"requiredSourceSampleDataTrackIDs: %@", v17];

          BOOL v19 = [v3 sourceSampleDataTrackIDs];
          v20 = [v18 stringByAppendingFormat:@" sourceSampleDataTrackIDs: %@", v19];

          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_17465);
          }
          v21 = (id)_NULogger;
          id v4 = v14;
          uint64_t v7 = v26;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            if (v3)
            {
              [v3 compositionTime];
            }
            else
            {
              long long v31 = 0uLL;
              uint64_t v32 = 0;
            }
            *(_OWORD *)CMTime time = v31;
            *(void *)&time[16] = v32;
            v22 = (__CFString *)CMTimeCopyDescription(allocator, (CMTime *)time);
            *(_DWORD *)CMTime time = 138544130;
            *(void *)&time[4] = v22;
            *(_WORD *)&time[12] = 1024;
            *(_DWORD *)&time[14] = v11;
            *(_WORD *)&time[18] = 2114;
            *(void *)&time[20] = v10;
            __int16 v38 = 2114;
            v39 = v20;
            _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "[NUVideoCompositor videoMetadataSamplesFromRequest] skipping metadata sample at %{public}@. metadataGroup is nil for trackID %d (%{public}@),\n DebugInfo: %{public}@", time, 0x26u);
          }
          uint64_t v6 = v27;
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v23 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
      uint64_t v6 = v23;
    }
    while (v23);
  }

  return v29;
}

- (id)videoFramesFromRequest:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 sourceTrackIDs];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    uint64_t v26 = NUAssertLogger_17470();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = [NSString stringWithFormat:@"Track IDs are missing on instruction"];
      *(_DWORD *)buf = 138543362;
      *(void *)__int16 v51 = v27;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v29 = NUAssertLogger_17470();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v30)
      {
        long long v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        long long v36 = [v34 callStackSymbols];
        uint64_t v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)__int16 v51 = v33;
        *(_WORD *)&v51[8] = 2114;
        *(void *)&v51[10] = v37;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      long long v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)__int16 v51 = v32;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoCompositor videoFramesFromRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoCompositor.m", 356, @"Track IDs are missing on instruction", v38, v39, v40, v41, v42);
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = [v3 videoCompositionInstruction];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v8 = [v3 sourceTrackIDs];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v46;
    uint64_t v43 = 67109378;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v46 != v11) {
          objc_enumerationMutation(v8);
        }
        CFStringRef v13 = *(void **)(*((void *)&v45 + 1) + 8 * v12);
        uint64_t v14 = objc_msgSend(v13, "intValue", v43);
        uint64_t v15 = [v7 sourceIdentifierForTrackID:v13];
        if (v15)
        {
          uint64_t v16 = [v3 sourceFrameByTrackID:v14];
          if (v16)
          {
            uint64_t v17 = v16;
            v18 = [NURenderPipelineVideoFrame alloc];
            if (v3) {
              [v3 compositionTime];
            }
            else {
              memset(v44, 0, sizeof(v44));
            }
            v24 = [(NURenderPipelineVideoFrame *)v18 initWithFrameTime:v44 pixelBuffer:v17];
            [v6 setObject:v24 forKeyedSubscript:v15];
          }
          else
          {
            if (_NULogOnceToken != -1) {
              dispatch_once(&_NULogOnceToken, &__block_literal_global_17465);
            }
            uint64_t v23 = _NULogger;
            if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v43;
              *(_DWORD *)__int16 v51 = v14;
              *(_WORD *)&v51[4] = 2114;
              *(void *)&v51[6] = v15;
              v20 = v23;
              v21 = "[NUVideoCompositor videoFramesFromRequest] skipping frame. srcPixels is nil for trackID %d (%{public}@)";
              uint32_t v22 = 18;
              goto LABEL_19;
            }
          }
        }
        else
        {
          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_17465);
          }
          uint64_t v19 = _NULogger;
          if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)__int16 v51 = v14;
            v20 = v19;
            v21 = "[NUVideoCompositor videoFramesFromRequest] skipping frame. sourceIdentifier is nil for trackID %d";
            uint32_t v22 = 8;
LABEL_19:
            _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, v21, buf, v22);
          }
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v10);
  }

  return v6;
}

- (id)videoSampleSlicesFromRequest:(id)a3
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v65 = a3;
  id v3 = [v65 sourceTrackIDs];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    uint64_t v44 = NUAssertLogger_17470();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      long long v45 = [NSString stringWithFormat:@"Track IDs are missing on instruction"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v45;
      _os_log_error_impl(&dword_1A9892000, v44, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v47 = NUAssertLogger_17470();
    BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v48)
      {
        __int16 v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v52 = (void *)MEMORY[0x1E4F29060];
        id v53 = v51;
        v54 = [v52 callStackSymbols];
        v55 = [v54 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v51;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v55;
        _os_log_error_impl(&dword_1A9892000, v47, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v48)
    {
      v49 = [MEMORY[0x1E4F29060] callStackSymbols];
      v50 = [v49 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v50;
      _os_log_error_impl(&dword_1A9892000, v47, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoCompositor videoSampleSlicesFromRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoCompositor.m", 241, @"Track IDs are missing on instruction", v56, v57, v58, v59, v60);
  }
  uint64_t v93 = 0;
  v94 = &v93;
  uint64_t v95 = 0x3032000000;
  v96 = __Block_byref_object_copy__17515;
  v97 = __Block_byref_object_dispose__17516;
  id v98 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = [v65 videoCompositionInstruction];
  if (([v5 requestedWindowOfSamples] & 1) == 0)
  {
    id v29 = (id)v94[5];
    goto LABEL_30;
  }
  id v6 = [v5 mainTrackSourceIdentifier];
  uint64_t v7 = [v5 trackIDForSourceIdentifier:v6];
  uint64_t v8 = [v7 intValue];
  v64 = v5;

  v61 = [v5 mainTrackSourceIdentifier];
  uint64_t v9 = +[NUVideoCompositor videoFramesInWindowForTrackID:v8 fromRequest:v65];
  v63 = (void *)[v9 mutableCopy];

  if ([v63 count])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    uint64_t v11 = [v5 requiredSourceTrackIDs];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v89 objects:v102 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v90;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v90 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void **)(*((void *)&v89 + 1) + 8 * i);
          uint64_t v16 = [v15 intValue];
          if (v16 != v8)
          {
            uint64_t v17 = [v64 sourceIdentifierForTrackID:v15];
            v18 = +[NUVideoCompositor videoFramesInWindowForTrackID:v16 fromRequest:v65];
            uint64_t v19 = (void *)[v18 mutableCopy];
            [v10 setObject:v19 forKeyedSubscript:v17];
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v89 objects:v102 count:16];
      }
      while (v12);
    }

    v20 = [v64 requiredSourceSampleDataTrackIDs];
    v21 = [v20 firstObject];
    uint64_t v22 = [v21 intValue];

    uint64_t v23 = [NSNumber numberWithInt:v22];
    v24 = [v64 sourceIdentifierForMetadataTrackID:v23];

    v25 = +[NUVideoCompositor metadataSamplesInWindowForTrackID:v22 fromRequest:v65];
    uint64_t v26 = (void *)[v25 mutableCopy];

    uint64_t v84 = 0;
    v85 = &v84;
    uint64_t v86 = 0x3810000000;
    v87 = &unk_1A9AA79AF;
    memset(&v88, 0, sizeof(v88));
    CMTimeMake(&v88, 30, 600);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x5010000000;
    v100 = &unk_1A9AA79AF;
    memset(&v101, 0, sizeof(v101));
    uint64_t v27 = [v63 lastObject];
    v28 = v27;
    if (v27) {
      [v27 frameTime];
    }
    else {
      memset(&start, 0, sizeof(start));
    }
    CMTime duration = *(CMTime *)(v85 + 4);
    CMTimeRangeMake(&v101, &start, &duration);

    BOOL v30 = v63;
    if ((unint64_t)[v63 count] < 2) {
      goto LABEL_28;
    }
    long long v31 = [v63 firstObject];
    uint64_t v32 = [v63 lastObject];
    long long v33 = v32;
    memset(&duration, 0, sizeof(duration));
    if (v32)
    {
      [v32 frameTime];
      if (v31)
      {
LABEL_21:
        [v31 frameTime];
LABEL_24:
        CMTimeSubtract(&duration, &lhs, &rhs);
        int32_t v34 = [v63 count];
        CMTime time = duration;
        CMTimeMultiplyByRatio(&v79, &time, 1, v34);
        id v35 = v85;
        *(CMTime *)(v85 + 4) = v79;
        if (v33)
        {
          [v33 frameTime];
          id v35 = v85;
        }
        else
        {
          memset(&v76, 0, sizeof(v76));
        }
        CMTime time = *(CMTime *)(v35 + 4);
        CMTimeRangeMake(&v77, &v76, &time);
        uint64_t v36 = *(void *)&buf[8];
        long long v38 = *(_OWORD *)&v77.start.epoch;
        long long v37 = *(_OWORD *)&v77.duration.timescale;
        *(_OWORD *)(*(void *)&buf[8] + 32) = *(_OWORD *)&v77.start.value;
        *(_OWORD *)(v36 + 48) = v38;
        *(_OWORD *)(v36 + 64) = v37;

        BOOL v30 = v63;
LABEL_28:
        int64_t v39 = [(NUVideoCompositor *)self playbackDirection];
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __50__NUVideoCompositor_videoSampleSlicesFromRequest___block_invoke;
        v66[3] = &unk_1E5D950B0;
        id v67 = v61;
        id v68 = v30;
        v72 = &v84;
        v73 = buf;
        int64_t v75 = v39;
        id v40 = v10;
        id v69 = v40;
        id v41 = v26;
        id v70 = v41;
        id v42 = v24;
        id v71 = v42;
        v74 = &v93;
        [v68 enumerateObjectsWithOptions:2 usingBlock:v66];
        id v29 = (id)v94[5];

        _Block_object_dispose(buf, 8);
        _Block_object_dispose(&v84, 8);

        goto LABEL_29;
      }
    }
    else
    {
      memset(&lhs, 0, sizeof(lhs));
      if (v31) {
        goto LABEL_21;
      }
    }
    memset(&rhs, 0, sizeof(rhs));
    goto LABEL_24;
  }
  id v29 = (id)v94[5];
LABEL_29:

  uint64_t v5 = v64;
LABEL_30:

  _Block_object_dispose(&v93, 8);

  return v29;
}

void __50__NUVideoCompositor_videoSampleSlicesFromRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v36 = 0;
  long long v37 = &v36;
  uint64_t v38 = 0x3032000000;
  int64_t v39 = __Block_byref_object_copy__17515;
  id v40 = __Block_byref_object_dispose__17516;
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(id)v37[5] setObject:v5 forKeyedSubscript:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 40) count] - 1 != a3)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 80) + 8);
    if (v5) {
      [v5 frameTime];
    }
    else {
      memset(&rhs, 0, sizeof(rhs));
    }
    CMTime lhs = *(CMTime *)(v6 + 32);
    CMTimeSubtract(&v35, &lhs, &rhs);
    *(CMTime *)(*(void *)(*(void *)(a1 + 72) + 8) + 32) = v35;
    if (v5) {
      [v5 frameTime];
    }
    else {
      memset(&start, 0, sizeof(start));
    }
    CMTime lhs = *(CMTime *)(*(void *)(*(void *)(a1 + 72) + 8) + 32);
    CMTimeRangeMake(&v32, &start, &lhs);
    uint64_t v7 = *(_OWORD **)(*(void *)(a1 + 80) + 8);
    long long v9 = *(_OWORD *)&v32.start.epoch;
    long long v8 = *(_OWORD *)&v32.duration.timescale;
    v7[2] = *(_OWORD *)&v32.start.value;
    v7[3] = v9;
    v7[4] = v8;
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __50__NUVideoCompositor_videoSampleSlicesFromRequest___block_invoke_2;
  v27[3] = &unk_1E5D95060;
  uint64_t v30 = *(void *)(a1 + 96);
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 80);
  id v28 = v10;
  uint64_t v29 = v11;
  uint64_t v12 = (void *)MEMORY[0x1AD0FAD00](v27);
  uint64_t v13 = *(void **)(a1 + 48);
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __50__NUVideoCompositor_videoSampleSlicesFromRequest___block_invoke_3;
  v24 = &unk_1E5D95088;
  id v14 = v12;
  id v25 = v14;
  uint64_t v26 = &v36;
  [v13 enumerateKeysAndObjectsUsingBlock:&v21];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v16 = objc_msgSend(*(id *)(a1 + 56), "indexOfObjectWithOptions:passingTest:", 2, v14, v21, v22, v23, v24);
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v17 = [*(id *)(a1 + 56) objectAtIndexedSubscript:v16];
    [v15 setObject:v17 forKeyedSubscript:*(void *)(a1 + 64)];

    objc_msgSend(*(id *)(a1 + 56), "removeObjectsInRange:", v16, objc_msgSend(*(id *)(a1 + 56), "count") - v16);
  }
  v18 = [NURenderPipelineVideoSampleSlice alloc];
  uint64_t v19 = v37[5];
  CMTime lhs = *(CMTime *)(*(void *)(*(void *)(a1 + 80) + 8) + 32);
  v20 = [(NURenderPipelineVideoSampleSlice *)v18 initWithFrameTime:&lhs videoFrames:v19 metadataSamples:v15];
  [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) insertObject:v20 atIndex:0];

  _Block_object_dispose(&v36, 8);
}

BOOL __50__NUVideoCompositor_videoSampleSlicesFromRequest___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (*(void *)(a1 + 48) == 3 && [*(id *)(a1 + 32) count] == 1)
  {
    BOOL v7 = 1;
  }
  else
  {
    if (v6) {
      [v6 frameTime];
    }
    else {
      memset(&time1, 0, sizeof(time1));
    }
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    *(_OWORD *)&v12.start.value = *(_OWORD *)(v8 + 32);
    v12.start.epoch = *(void *)(v8 + 48);
    if (CMTimeCompare(&time1, &v12.start) < 0)
    {
      BOOL v7 = 0;
      *a4 = 1;
    }
    else
    {
      long long v9 = (_OWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
      if (v6) {
        [v6 frameTime];
      }
      else {
        memset(&time, 0, sizeof(time));
      }
      long long v10 = v9[1];
      *(_OWORD *)&v12.start.value = *v9;
      *(_OWORD *)&v12.start.epoch = v10;
      *(_OWORD *)&v12.duration.timescale = v9[2];
      BOOL v7 = CMTimeRangeContainsTime(&v12, &time) != 0;
    }
  }

  return v7;
}

void __50__NUVideoCompositor_videoSampleSlicesFromRequest___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 indexOfObjectWithOptions:2 passingTest:*(void *)(a1 + 32)];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v6;
    uint64_t v8 = [v5 objectAtIndexedSubscript:v6];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v8 forKeyedSubscript:v9];

    objc_msgSend(v5, "removeObjectsInRange:", v7, objc_msgSend(v5, "count") - v7);
  }
}

- (void)finishCompositionRequest:(id)a3 withComposedVideoFrame:(__CVBuffer *)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (+[NUGlobalSettings videoCompositorDebugMode] == 2
    && NUIsPixelBufferProbablyAllZeros(a4))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_17465);
    }
    uint64_t v6 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412546;
      uint64_t v8 = a4;
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "green output frame detected. frame:%@ avRequest:%@", (uint8_t *)&v7, 0x16u);
    }
    NUDebugWatermarkCVPixelBuffer(a4, 3);
  }
  [v5 finishWithComposedVideoFrame:a4];
}

- (void)fulfillVideoCompositionRequest:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_147_17493);
  }
  uint64_t v4 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v5 = NSString;
    uint64_t v6 = v4;
    int v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    __int16 v9 = [v5 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v8];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_147_17493);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_147_17493);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    uint64_t v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    CMTimeRange v12 = (void *)MEMORY[0x1E4F29060];
    uint64_t v13 = v11;
    id v14 = [v12 callStackSymbols];
    id v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  uint64_t v13 = v16;
  v20 = [v18 callStackSymbols];
  uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v29 = specific;
  __int16 v30 = 2114;
  long long v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  _NUAssertFailHandler((uint64_t)"-[NUVideoCompositor fulfillVideoCompositionRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoCompositor.m", 222, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v24, v25, v26, v27, v23);
}

- (void)cancelAllPendingVideoCompositionRequests
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_pendingRequestsLock = &self->_pendingRequestsLock;
  os_unfair_lock_lock(&self->_pendingRequestsLock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v4 = self->_pendingRequests;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "finishCancelledRequest", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(NSMutableSet *)self->_pendingRequests removeAllObjects];
  os_unfair_lock_unlock(p_pendingRequestsLock);
}

- (BOOL)supportsWideColorSourceFrames
{
  return 1;
}

- (void)startVideoCompositionRequest:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t add = atomic_fetch_add((atomic_ullong *volatile)&self->_requestCounter, 1uLL);
  uint64_t v6 = [v4 sourceTrackIDs];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = [v4 sourceSampleDataTrackIDs];
    unint64_t v9 = [v8 count];
    long long v10 = [v4 videoCompositionInstruction];
    long long v11 = [v10 requiredSourceSampleDataTrackIDs];
    unint64_t v12 = [v11 count];

    if (v9 < v12)
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_17465);
      }
      uint64_t v13 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "[NUVideoCompositor startVideoCompositionRequest] received request without required sampleData tracks", buf, 2u);
      }
    }
    if (+[NUGlobalSettings videoCompositorDebugMode] == 1)
    {
      uint64_t v14 = [v4 sourceTrackIDs];
      id v15 = [v14 firstObject];
      uint64_t v16 = objc_msgSend(v4, "sourceFrameByTrackID:", objc_msgSend(v15, "intValue"));

      [v4 finishWithComposedVideoFrame:v16];
    }
    else if (+[NUGlobalSettings videoCompositorDebugMode] == 2 {
           && ([v4 sourceTrackIDs],
    }
               v18 = objc_claimAutoreleasedReturnValue(),
               [v18 firstObject],
               id v19 = objc_claimAutoreleasedReturnValue(),
               v20 = (__CVBuffer *)objc_msgSend(v4, "sourceFrameByTrackID:", objc_msgSend(v19, "intValue")),
               v19,
               v18,
               NUIsPixelBufferProbablyAllZeros(v20)))
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_17465);
      }
      uint64_t v21 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        unint64_t v57 = (unint64_t)v20;
        __int16 v58 = 2112;
        id v59 = v4;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "green input frame detected frame: %@ avRequest: %@", buf, 0x16u);
      }
      uint64_t v22 = [v4 renderContext];
      uint64_t v23 = (__CVBuffer *)[v22 newPixelBuffer];

      NUDebugWatermarkCVPixelBuffer(v23, 1);
      [v4 finishWithComposedVideoFrame:v23];
      CFRelease(v23);
    }
    else
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_145);
      }
      uint64_t v24 = (id)_NUScheduleLogger;
      os_signpost_id_t v25 = os_signpost_id_make_with_pointer(v24, v4);
      uint64_t v26 = v24;
      uint64_t v27 = v26;
      if (v25 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      {

        uint64_t v29 = v27;
      }
      else
      {
        if (os_signpost_enabled(v26))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v57 = add;
          _os_signpost_emit_with_name_impl(&dword_1A9892000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "VideoCompositionRequest", "ID=%llu", buf, 0xCu);
        }

        id v28 = v27;
        if (os_signpost_enabled(v28))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v57 = add;
          _os_signpost_emit_with_name_impl(&dword_1A9892000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v25, "VideoCompositionRequestQueueDelay", "ID=%llu", buf, 0xCu);
        }
      }

      os_unfair_lock_lock(&self->_pendingRequestsLock);
      [(NSMutableSet *)self->_pendingRequests addObject:v4];
      os_unfair_lock_unlock(&self->_pendingRequestsLock);
      os_unfair_lock_lock(&self->_renderingQueueInitializeLock);
      if (!self->_renderingQueue)
      {
        unint64_t v49 = add;
        __int16 v30 = [v4 videoCompositionInstruction];
        long long v31 = [v30 renderJob];
        uint64_t v32 = [v31 priority];
        unint64_t v33 = [v32 level];

        int32_t v34 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        CMTime v35 = v34;
        if (v33 > 3) {
          dispatch_qos_class_t v36 = QOS_CLASS_UNSPECIFIED;
        }
        else {
          dispatch_qos_class_t v36 = dword_1A9A72ED0[v33];
        }
        long long v37 = dispatch_queue_attr_make_with_qos_class(v34, v36, 0);

        uint64_t v38 = NSString;
        int64_t v39 = (objc_class *)objc_opt_class();
        id v40 = NSStringFromClass(v39);
        if (v33 > 3) {
          id v41 = 0;
        }
        else {
          id v41 = off_1E5D94210[v33];
        }
        id v42 = v41;
        uint64_t v43 = [v38 stringWithFormat:@"%@-RenderingQueue-%@", v40, v42];

        id v44 = v43;
        long long v45 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v44 UTF8String], v37);
        renderingQueue = self->_renderingQueue;
        self->_renderingQueue = v45;

        unint64_t add = v49;
      }
      os_unfair_lock_unlock(&self->_renderingQueueInitializeLock);
      long long v47 = self->_renderingQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__NUVideoCompositor_startVideoCompositionRequest___block_invoke;
      block[3] = &unk_1E5D95038;
      os_signpost_id_t v54 = v25;
      unint64_t v55 = add;
      __int16 v51 = v27;
      uint64_t v52 = self;
      id v53 = v4;
      BOOL v48 = v27;
      dispatch_async(v47, block);
    }
  }
  else
  {
    [v4 finishCancelledRequest];
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_17465);
    }
    uint64_t v17 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "[NUVideoCompositor startVideoCompositionRequest] received degenerate request. request.sourceTrackIDs.count == 0. treating as canceled.", buf, 2u);
    }
  }
}

void __50__NUVideoCompositor_startVideoCompositionRequest___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1AD0FAA90]();
  id v3 = *(id *)(a1 + 32);
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 56);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v6 = *(void *)(a1 + 64);
    int v21 = 134217984;
    uint64_t v22 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A9892000, v4, OS_SIGNPOST_INTERVAL_END, v5, "VideoCompositionRequestQueueDelay", "ID=%llu", (uint8_t *)&v21, 0xCu);
  }

  uint64_t v7 = *(id *)(a1 + 32);
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v10 = *(void *)(a1 + 64);
    int v21 = 134217984;
    uint64_t v22 = v10;
    _os_signpost_emit_with_name_impl(&dword_1A9892000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VideoCompositionRequestFulfill", "ID=%llu", (uint8_t *)&v21, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 32));
  int v11 = [*(id *)(*(void *)(a1 + 40) + 24) containsObject:*(void *)(a1 + 48)];
  uint64_t v12 = *(void *)(a1 + 40);
  if (v11)
  {
    [*(id *)(v12 + 24) removeObject:*(void *)(a1 + 48)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 32));
    [*(id *)(a1 + 40) fulfillVideoCompositionRequest:*(void *)(a1 + 48)];
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 32));
  }
  uint64_t v13 = *(id *)(a1 + 32);
  uint64_t v14 = v13;
  os_signpost_id_t v15 = *(void *)(a1 + 56);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    uint64_t v16 = *(void *)(a1 + 64);
    int v21 = 134217984;
    uint64_t v22 = v16;
    _os_signpost_emit_with_name_impl(&dword_1A9892000, v14, OS_SIGNPOST_INTERVAL_END, v15, "VideoCompositionRequestFulfill", "ID=%llu", (uint8_t *)&v21, 0xCu);
  }

  uint64_t v17 = *(id *)(a1 + 32);
  v18 = v17;
  os_signpost_id_t v19 = *(void *)(a1 + 56);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    uint64_t v20 = *(void *)(a1 + 64);
    int v21 = 134217984;
    uint64_t v22 = v20;
    _os_signpost_emit_with_name_impl(&dword_1A9892000, v18, OS_SIGNPOST_INTERVAL_END, v19, "VideoCompositionRequest", "ID=%llu", (uint8_t *)&v21, 0xCu);
  }
}

- (BOOL)testAndSetVideoCompositionRequestFinished:(id)a3
{
  p_pendingRequestsLock = &self->_pendingRequestsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_pendingRequestsLock);
  [(NSMutableSet *)self->_pendingRequests removeObject:v5];

  os_unfair_lock_unlock(p_pendingRequestsLock);
  return 1;
}

- (NUVideoCompositor)init
{
  v7.receiver = self;
  v7.super_class = (Class)NUVideoCompositor;
  v2 = [(NUVideoCompositor *)&v7 init];
  renderingQueue = v2->_renderingQueue;
  v2->_renderingQueue = 0;

  uint64_t v4 = objc_opt_new();
  pendingRequests = v2->_pendingRequests;
  v2->_pendingRequests = (NSMutableSet *)v4;

  *(void *)&v2->_pendingRequestsLock._os_unfair_lock_opaque = 0;
  return v2;
}

- (NSDictionary)requiredPixelBufferAttributesForRenderContext
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = +[NUVideoUtilities preferedDestinationPixelFormats];
  if ([(NUVideoCompositor *)self supportsHDROutput])
  {
    uint64_t v4 = +[NUVideoUtilities preferedDestinationPixelFormatsForHDR];

    id v3 = (void *)v4;
  }
  uint64_t v5 = *MEMORY[0x1E4F24D20];
  v8[0] = *MEMORY[0x1E4F24D70];
  v8[1] = v5;
  v9[0] = v3;
  v9[1] = MEMORY[0x1E4F1CC08];
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return (NSDictionary *)v6;
}

- (NSDictionary)sourcePixelBufferAttributes
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v2 = +[NUVideoUtilities preferredSourcePixelFormats];
  uint64_t v3 = *MEMORY[0x1E4F24D20];
  v6[0] = *MEMORY[0x1E4F24D70];
  v6[1] = v3;
  v7[0] = v2;
  v7[1] = MEMORY[0x1E4F1CC08];
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return (NSDictionary *)v4;
}

- (BOOL)supportsHDROutput
{
  return 0;
}

- (BOOL)supportsHDRSourceFrames
{
  return 0;
}

- (BOOL)canConformColorOfSourceFrames
{
  return 1;
}

+ (id)metadataSamplesInWindowForTrackID:(int)a3 fromRequest:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = [v5 numberOfSourceSampleBuffersInWindowForTrackID:v4];
  if (v7 >= 1)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
    {
      long long v16 = 0uLL;
      uint64_t v17 = 0;
      uint64_t v10 = [v5 sourceTimedMetadataByTrackID:v4 atIndexInWindow:i presentationTimeStamp:&v16];
      if (v10)
      {
        int v11 = [NURenderPipelineVideoMetadataSample alloc];
        long long v14 = v16;
        uint64_t v15 = v17;
        uint64_t v12 = [(NURenderPipelineVideoMetadataSample *)v11 initWithFrameTime:&v14 metadataGroup:v10];
        [v6 addObject:v12];
      }
    }
  }

  return v6;
}

+ (id)videoFramesInWindowForTrackID:(int)a3 fromRequest:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = [v5 numberOfSourceFramesInWindowForTrackID:v4];
  if (v7 >= 1)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
    {
      long long v17 = 0uLL;
      uint64_t v18 = 0;
      uint64_t v10 = [v5 sourceFrameByTrackID:v4 atIndexInWindow:i presentationTimeStamp:&v17];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = [NURenderPipelineVideoFrame alloc];
        long long v15 = v17;
        uint64_t v16 = v18;
        uint64_t v13 = [(NURenderPipelineVideoFrame *)v12 initWithFrameTime:&v15 pixelBuffer:v11];
        [v6 addObject:v13];
      }
    }
  }

  return v6;
}

@end