@interface PXStoryResourcesPreloader
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentPlaybackTime;
- (BOOL)_isClipPreloadable:(id *)a3;
- (BOOL)_isImagePreloadingNeededForClipInfo:(id *)a3;
- (BOOL)_isVideoPreloadingNeededForClipInfo:(id *)a3;
- (BOOL)isExporting;
- (BOOL)isInline;
- (BOOL)isLoadingLikelyToKeepUpWithPlayback;
- (NSArray)loadedTimeRanges;
- (NSError)error;
- (NSMutableIndexSet)timelineReadingQueue_loadedSegments;
- (NSOperationQueue)loadingOperationQueue;
- (NSString)diagnosticDescription;
- (OS_dispatch_queue)estimationQueue;
- (OS_dispatch_queue)stateQueue;
- (OS_dispatch_queue)storyQueue;
- (OS_dispatch_queue)timelineReadingQueue;
- (OS_os_log)log;
- (PXMediaProvider)mediaProvider;
- (PXStoryLoadingStatusReporter)loadingStatusReporter;
- (PXStoryResourcesPreloader)init;
- (PXStoryResourcesPreloader)initWithMediaProvider:(id)a3 displayScale:(double)a4 videoSessionManager:(id)a5 loadingStatusReporter:(id)a6 storyQueue:(id)a7 isExporting:(BOOL)a8 isInline:(BOOL)a9;
- (PXStoryResourcesPreloadingRequest)currentRequest;
- (PXUpdater)updater;
- (PXVideoSessionManager)videoSessionManager;
- (double)displayScale;
- (float)loadingFractionComplete;
- (id)previousRequest;
- (int64_t)currentSegmentIdentifier;
- (int64_t)lagsCount;
- (unint64_t)logContext;
- (void)_accumulateLoadedTimeRange:(id *)a3 moreExpected:(BOOL)a4;
- (void)_estimationNoteClipWithPlaybackStyle:(int64_t)a3 loadedWithLoadingTime:(double)a4;
- (void)_estimationNoteLoadingSegments:(id)a3 loadedSegments:(id)a4;
- (void)_estimationNoteSessionStartedWithSegmentsToLoad:(id)a3 preloadableClipsCounts:(id *)a4 inTimeline:(id)a5;
- (void)_estimationQueue_updateEstimation;
- (void)_invalidateEstimation;
- (void)_invalidateProcessing;
- (void)_noteLoadingEndedForClip:(id *)a3 inSegment:(int64_t)a4 resourceType:(id)a5 resourceIdentifier:(id)a6 timeRange:(id *)a7 error:(id)a8 loadingTime:(double)a9 playbackStyle:(int64_t)a10;
- (void)_noteLoadingStartedForClipInSegment:(int64_t)a3;
- (void)_noteSessionStartedWithLoadedSegments:(id)a3 segmentsToLoad:(id)a4 preloadableClipsCounts:(id *)a5 inTimeline:(id)a6;
- (void)_performChangesOnStoryQueue:(id)a3;
- (void)_setNeedsUpdate;
- (void)_stateQueue_accumulateLoadedTimeRange:(id *)a3 moreExpected:(BOOL)a4;
- (void)_timelineReadingQueue_loadResourcesForClipsInSegment:(int64_t)a3 request:(id)a4 clipLoadingGroup:(id)a5;
- (void)_timelineReadingQueue_processRequest:(id)a3 previousRequest:(id)a4;
- (void)_timelineReadingQueue_sessionStartedWithAlreadyLoadedSegments:(id)a3 segmentsToLoad:(id)a4 preloadableClipsCounts:(id *)a5 request:(id)a6;
- (void)_updateEstimation;
- (void)_updateProcessing;
- (void)cancelProcessingAllRequests;
- (void)dealloc;
- (void)didPerformChanges;
- (void)performChanges:(id)a3;
- (void)setCurrentPlaybackTime:(id *)a3;
- (void)setCurrentRequest:(id)a3;
- (void)setCurrentSegmentIdentifier:(int64_t)a3;
- (void)setError:(id)a3;
- (void)setIsLoadingLikelyToKeepUpWithPlayback:(BOOL)a3;
- (void)setLoadingFractionComplete:(float)a3;
- (void)setLog:(id)a3;
- (void)setLogContext:(unint64_t)a3;
- (void)setTimelineReadingQueue_loadedSegments:(id)a3;
- (void)startProcessingRequest:(id)a3;
@end

@implementation PXStoryResourcesPreloader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineReadingQueue_loadedSegments, 0);
  objc_storeStrong((id *)&self->_loadingOperationQueue, 0);
  objc_storeStrong((id *)&self->_estimationQueue, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_timelineReadingQueue, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_loadingStatusReporter, 0);
  objc_storeStrong((id *)&self->_videoSessionManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_estimationQueue_statsStore, 0);
  objc_storeStrong((id *)&self->_estimationQueue_segmentsToLoad, 0);
  objc_storeStrong((id *)&self->_estimationQueue_loadedSegments, 0);
  objc_storeStrong((id *)&self->_estimationQueue_loadingSegments, 0);
  objc_storeStrong((id *)&self->_estimationQueue_currentSessionTimeline, 0);
  objc_storeStrong((id *)&self->_stateQueue_loadedSegments, 0);
  objc_storeStrong((id *)&self->_stateQueue_loadingSegments, 0);
  objc_storeStrong((id *)&self->_stateQueue_estimationDiagnostics, 0);
  objc_storeStrong((id *)&self->_stateQueue_loadedTimeRanges, 0);
  objc_storeStrong((id *)&self->_stateQueue_previousRequest, 0);
  objc_storeStrong((id *)&self->_stateQueue_currentRequest, 0);
  objc_storeStrong((id *)&self->_stateQueue_error, 0);
}

- (void)setTimelineReadingQueue_loadedSegments:(id)a3
{
}

- (NSMutableIndexSet)timelineReadingQueue_loadedSegments
{
  return self->_timelineReadingQueue_loadedSegments;
}

- (NSOperationQueue)loadingOperationQueue
{
  return self->_loadingOperationQueue;
}

- (OS_dispatch_queue)estimationQueue
{
  return self->_estimationQueue;
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (OS_dispatch_queue)timelineReadingQueue
{
  return self->_timelineReadingQueue;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXStoryLoadingStatusReporter)loadingStatusReporter
{
  return self->_loadingStatusReporter;
}

- (BOOL)isInline
{
  return self->_isInline;
}

- (BOOL)isExporting
{
  return self->_isExporting;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (PXVideoSessionManager)videoSessionManager
{
  return self->_videoSessionManager;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (void)setLogContext:(unint64_t)a3
{
  self->_logContext = a3;
}

- (unint64_t)logContext
{
  return self->_logContext;
}

- (void)setLog:(id)a3
{
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 320, 1);
}

- (NSString)diagnosticDescription
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = [(PXStoryResourcesPreloader *)self loadingOperationQueue];
  v5 = [v4 operations];
  v6 = (void *)[v5 copy];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          v13 = [v12 diagnosticDescription];
          [v3 appendFormat:@"%@\n", v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return (NSString *)v3;
}

- (BOOL)_isVideoPreloadingNeededForClipInfo:(id *)a3
{
  return (unint64_t)(a3->var5 - 3) < 3;
}

- (BOOL)_isImagePreloadingNeededForClipInfo:(id *)a3
{
  int64_t var1 = a3->var1;
  if (var1 == 5)
  {
    return [(PXStoryResourcesPreloader *)self isExporting];
  }
  else if (var1 == 1)
  {
    int64_t var5 = a3->var5;
    if ((unint64_t)(var5 - 3) >= 3) {
      return (unint64_t)(var5 - 1) <= 1;
    }
    else {
      return ![(PXStoryResourcesPreloader *)self isExporting];
    }
  }
  else
  {
    return 0;
  }
}

- (BOOL)_isClipPreloadable:(id *)a3
{
  return ((a3->var1 - 1) & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (void)_timelineReadingQueue_loadResourcesForClipsInSegment:(int64_t)a3 request:(id)a4 clipLoadingGroup:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  [(PXStoryResourcesPreloader *)self log];
  objc_claimAutoreleasedReturnValue();
  [(PXStoryResourcesPreloader *)self logContext];
  [(PXStoryResourcesPreloader *)self loadingStatusReporter];
  objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v8 timeline];
  if (v10) {
    [v10 timeRangeForSegmentWithIdentifier:a3];
  }
  [v8 timeline];
  [(id)objc_claimAutoreleasedReturnValue() size];
  PXRectWithOriginAndSize();
}

void __107__PXStoryResourcesPreloader__timelineReadingQueue_loadResourcesForClipsInSegment_request_clipLoadingGroup___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  if (a2 >= 1)
  {
    uint64_t v6 = a2;
    uint64_t v8 = 0;
    v50 = (long long *)(a1 + 104);
    unint64_t v9 = *MEMORY[0x1E4F1DB30];
    unint64_t v10 = *(void *)(MEMORY[0x1E4F1DB30] + 8);
    v11 = (void *)(a5 + 160);
    do
    {
      uint64_t v12 = *(v11 - 20);
      long long v13 = *(_OWORD *)(v11 - 9);
      long long v14 = *(_OWORD *)(v11 - 5);
      long long v101 = *(_OWORD *)(v11 - 7);
      long long v102 = v14;
      long long v103 = *(_OWORD *)(v11 - 3);
      long long v15 = *(_OWORD *)(v11 - 17);
      long long v16 = *(_OWORD *)(v11 - 13);
      long long v97 = *(_OWORD *)(v11 - 15);
      long long v98 = v16;
      long long v17 = *(_OWORD *)(v11 - 11);
      long long v100 = v13;
      long long v99 = v17;
      long long v18 = *(_OWORD *)(v11 - 19);
      long long v96 = v15;
      long long v95 = v18;
      uint64_t v19 = *(v11 - 1);
      memcpy(__dst, v11, sizeof(__dst));
      uint64_t v20 = *(void **)(a1 + 32);
      long long v21 = *(_OWORD *)(v11 - 9);
      long long v22 = *(_OWORD *)(v11 - 5);
      long long v89 = *(_OWORD *)(v11 - 7);
      long long v90 = v22;
      long long v91 = *(_OWORD *)(v11 - 3);
      long long v23 = *(_OWORD *)(v11 - 17);
      long long v24 = *(_OWORD *)(v11 - 13);
      *(_OWORD *)&v85[40] = *(_OWORD *)(v11 - 15);
      long long v86 = v24;
      long long v87 = *(_OWORD *)(v11 - 11);
      long long v88 = v21;
      *(_OWORD *)&v85[8] = *(_OWORD *)(v11 - 19);
      *(_OWORD *)&v85[24] = v23;
      *(void *)v85 = v12;
      uint64_t v92 = v19;
      memcpy(v93, v11, sizeof(v93));
      if ([v20 _isClipPreloadable:v85])
      {
        if ([*(id *)(a1 + 40) isCancelled])
        {
          *a6 = 1;
          return;
        }
        v25 = [*(id *)(a1 + 48) clipWithIdentifier:v12];
        uint64_t v26 = [v25 identifier];
        v54 = v25;
        v55 = [v25 resource];
        [*(id *)(a1 + 56) notifyStartedPreloadingClipIdentifier:v26];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __107__PXStoryResourcesPreloader__timelineReadingQueue_loadResourcesForClipsInSegment_request_clipLoadingGroup___block_invoke_2;
        aBlock[3] = &unk_1E5DCBAB8;
        id v27 = *(id *)(a1 + 64);
        uint64_t v65 = *(void *)(a1 + 88);
        uint64_t v66 = v26;
        uint64_t v67 = a3;
        uint64_t v68 = v8;
        uint64_t v28 = *(void *)(a1 + 32);
        id v61 = v27;
        uint64_t v62 = v28;
        long long v76 = v101;
        long long v77 = v102;
        long long v78 = v103;
        long long v72 = v97;
        long long v73 = v98;
        long long v74 = v99;
        long long v75 = v100;
        long long v70 = v95;
        long long v71 = v96;
        uint64_t v69 = v12;
        uint64_t v79 = v19;
        memcpy(v80, __dst, sizeof(v80));
        uint64_t v81 = *(void *)(a1 + 96);
        long long v29 = v50[1];
        long long v82 = *v50;
        long long v83 = v29;
        long long v84 = v50[2];
        id v63 = *(id *)(a1 + 72);
        id v64 = *(id *)(a1 + 80);
        v30 = _Block_copy(aBlock);
        v31 = *(void **)(a1 + 32);
        long long v89 = v101;
        long long v90 = v102;
        long long v91 = v103;
        *(_OWORD *)&v85[40] = v97;
        long long v86 = v98;
        long long v87 = v99;
        long long v88 = v100;
        *(_OWORD *)&v85[8] = v95;
        *(_OWORD *)&v85[24] = v96;
        *(void *)v85 = v12;
        uint64_t v92 = v19;
        memcpy(v93, __dst, sizeof(v93));
        int v32 = [v31 _isImagePreloadingNeededForClipInfo:v85];
        uint64_t v33 = v19;
        v34 = *(void **)(a1 + 32);
        long long v89 = v101;
        long long v90 = v102;
        long long v91 = v103;
        *(_OWORD *)&v85[40] = v97;
        long long v86 = v98;
        long long v87 = v99;
        long long v88 = v100;
        *(_OWORD *)&v85[8] = v95;
        *(_OWORD *)&v85[24] = v96;
        *(void *)v85 = v12;
        uint64_t v53 = v33;
        uint64_t v92 = v33;
        memcpy(v93, __dst, sizeof(v93));
        if ([v34 _isVideoPreloadingNeededForClipInfo:v85]) {
          int v35 = [*(id *)(a1 + 40) timelineAttributes] & 1;
        }
        else {
          int v35 = 0;
        }
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __107__PXStoryResourcesPreloader__timelineReadingQueue_loadResourcesForClipsInSegment_request_clipLoadingGroup___block_invoke_64;
        v57[3] = &unk_1E5DCBAE0;
        id v58 = *(id *)(a1 + 56);
        uint64_t v59 = v26;
        v36 = _Block_copy(v57);
        if (v32)
        {
          [*(id *)(a1 + 32) displayScale];
          long long v89 = v101;
          long long v90 = v102;
          long long v91 = v103;
          *(_OWORD *)&v85[40] = v97;
          long long v86 = v98;
          long long v87 = v99;
          long long v88 = v100;
          *(_OWORD *)&v85[8] = v95;
          *(_OWORD *)&v85[24] = v96;
          *(void *)v85 = v12;
          uint64_t v92 = v53;
          memcpy(v93, __dst, sizeof(v93));
          PXStoryMediaSizeForDisplayAssetClipInfo((uint64_t)v85);
        }
        if (v35)
        {
          memset(v85, 0, 48);
          PXStoryClipVideoSegmentTimeRange(v54, v85);
          v37 = PLStoryGetLog();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_OWORD *)buf = *(_OWORD *)v85;
            *(_OWORD *)&buf[16] = *(_OWORD *)&v85[16];
            long long v105 = *(_OWORD *)&v85[32];
            v38 = PXStoryTimeRangeDescription((uint64_t)buf);
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v38;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v55;
            _os_log_impl(&dword_1A9AE7000, v37, OS_LOG_TYPE_INFO, "[Buffering] preload time range %@ for video asset resource %@", buf, 0x16u);
          }
          v39 = [PXStoryVideoAssetResourcePreloadingOperation alloc];
          v40 = [*(id *)(a1 + 32) mediaProvider];
          v56[0] = *(_OWORD *)v85;
          v56[1] = *(_OWORD *)&v85[16];
          v56[2] = *(_OWORD *)&v85[32];
          v41 = [*(id *)(a1 + 32) videoSessionManager];
          v42 = -[PXStoryVideoAssetResourcePreloadingOperation initWithVideoAssetResource:mediaProvider:downloadTimeRange:videoSessionManager:isExporting:isInline:](v39, "initWithVideoAssetResource:mediaProvider:downloadTimeRange:videoSessionManager:isExporting:isInline:", v55, v40, v56, v41, [*(id *)(a1 + 32) isExporting], objc_msgSend(*(id *)(a1 + 32), "isInline"));

          [(PXStoryDisplayAssetResourcePreloadingOperation *)v42 setProgressHandler:v36];
          if (v53 == 5 || v53 == 3)
          {
            v43 = (void (*)(void *, PXStoryVideoAssetResourcePreloadingOperation *, __CFString *, unsigned char *, uint64_t, __n128, __n128))v30[2];
            v44.n128_u64[1] = *(void *)&v85[24];
            *(_OWORD *)buf = *(_OWORD *)v85;
            *(_OWORD *)&buf[16] = *(_OWORD *)&v85[16];
            v45.n128_u64[1] = *(void *)&v85[40];
            long long v105 = *(_OWORD *)&v85[32];
            v45.n128_u64[0] = v9;
            v44.n128_u64[0] = v10;
            v43(v30, v42, @"livePhoto", buf, 3, v45, v44);
          }
          else
          {
            v46 = (void (*)(void *, PXStoryVideoAssetResourcePreloadingOperation *, __CFString *, unsigned char *, uint64_t, __n128, __n128))v30[2];
            v47.n128_u64[1] = *(void *)&v85[24];
            *(_OWORD *)buf = *(_OWORD *)v85;
            *(_OWORD *)&buf[16] = *(_OWORD *)&v85[16];
            v48.n128_u64[1] = *(void *)&v85[40];
            long long v105 = *(_OWORD *)&v85[32];
            v48.n128_u64[0] = v9;
            v47.n128_u64[0] = v10;
            v46(v30, v42, @"video", buf, 4, v48, v47);
          }
        }
        uint64_t v6 = a2;
      }
      ++v8;
      v11 += 96;
    }
    while (v6 != v8);
  }
}

void __107__PXStoryResourcesPreloader__timelineReadingQueue_loadResourcesForClipsInSegment_request_clipLoadingGroup___block_invoke_2(uint64_t a1, void *a2, void *a3, _OWORD *a4, uint64_t a5, CGFloat a6, CGFloat a7)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v12 = a2;
  id v13 = a3;
  long long v14 = [v12 displayAsset];
  long long v15 = [v14 uuid];

  long long v16 = *(id *)(a1 + 32);
  os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, v12);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v18 = v17;
    if (os_signpost_enabled(v16))
    {
      uint64_t v28 = *(void *)(a1 + 64);
      uint64_t v29 = *(void *)(a1 + 72);
      uint64_t v19 = (_OWORD *)(*(void *)(a1 + 80) + 48 * *(void *)(a1 + 88));
      *(_OWORD *)buf = *v19;
      *(_OWORD *)&buf[16] = v19[1];
      *(_OWORD *)__n128 v44 = v19[2];
      uint64_t v20 = PXStoryTimeRangeDescription((uint64_t)buf);
      v50.width = a6;
      v50.height = a7;
      long long v21 = NSStringFromCGSize(v50);
      long long v22 = a4[1];
      *(_OWORD *)buf = *a4;
      *(_OWORD *)&buf[16] = v22;
      *(_OWORD *)__n128 v44 = a4[2];
      long long v23 = PXStoryTimeRangeDescription((uint64_t)buf);
      *(_DWORD *)buf = 134219522;
      *(void *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = v29;
      *(_WORD *)&buf[22] = 2114;
      *(void *)&buf[24] = v13;
      *(_WORD *)__n128 v44 = 2114;
      *(void *)&v44[2] = v15;
      *(_WORD *)&v44[10] = 2114;
      *(void *)&v44[12] = v20;
      __int16 v45 = 2114;
      v46 = v21;
      __int16 v47 = 2114;
      __n128 v48 = v23;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PXStoryResourcesPreloaderBufferingOperation", "Context=%{signpost.telemetry:string2}lu clipIdentifier=%{signpost.description:attribute, public}ld resourceType=%{signpost.description:attribute, public}@ asset=%{signpost.description:attribute, public}@ timeRange=%{signpost.description:attribute, public}@ targetSize=%{signpost.description:attribute, public}@ videoSegmentTimeRange=%{signpost.description:attribute, public}@ ", buf, 0x48u);
    }
  }

  uint64_t v24 = mach_absolute_time();
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  objc_initWeak(&location, v12);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __107__PXStoryResourcesPreloader__timelineReadingQueue_loadResourcesForClipsInSegment_request_clipLoadingGroup___block_invoke_62;
  v31[3] = &unk_1E5DCBA90;
  id v32 = *(id *)(a1 + 32);
  objc_copyWeak(&v36, &location);
  v37[1] = *(id *)(a1 + 64);
  objc_copyWeak(v37, (id *)buf);
  memcpy(v38, (const void *)(a1 + 96), 0x308uLL);
  id v25 = v13;
  id v33 = v25;
  id v26 = v15;
  long long v27 = *(_OWORD *)(a1 + 888);
  long long v39 = *(_OWORD *)(a1 + 872);
  long long v40 = v27;
  long long v41 = *(_OWORD *)(a1 + 904);
  id v34 = v26;
  v38[97] = v24;
  v38[98] = a5;
  id v35 = *(id *)(a1 + 48);
  [v12 setCompletionBlock:v31];
  [*(id *)(a1 + 40) _noteLoadingStartedForClipInSegment:*(void *)(a1 + 864)];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
  [*(id *)(a1 + 56) addObject:v12];

  objc_destroyWeak(v37);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

uint64_t __107__PXStoryResourcesPreloader__timelineReadingQueue_loadResourcesForClipsInSegment_request_clipLoadingGroup___block_invoke_64(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyPreloadingProgress:error:forClipIdentifier:", a2, *(void *)(a1 + 40));
}

void __107__PXStoryResourcesPreloader__timelineReadingQueue_loadResourcesForClipsInSegment_request_clipLoadingGroup___block_invoke_62(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = *(id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v2, WeakRetained);

  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    uint64_t v5 = *(void *)(a1 + 80);
    *(_DWORD *)buf = 134217984;
    uint64_t v7 = v5;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v2, OS_SIGNPOST_INTERVAL_END, v4, "PXStoryResourcesPreloaderBufferingOperation", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
  }

  objc_loadWeakRetained((id *)(a1 + 72));
  [objc_loadWeakRetained((id *)(a1 + 64)) error];
  objc_claimAutoreleasedReturnValue();
  mach_absolute_time();
  PXTimebaseConversionFactor();
}

- (void)_timelineReadingQueue_processRequest:(id)a3 previousRequest:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 && ([v6 isCancelled] & 1) == 0)
  {
    uint64_t v8 = PLStoryGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unint64_t v9 = [v6 timeline];
      buf[0] = 138412546;
      *(void *)&buf[1] = v9;
      __int16 v13 = 2048;
      uint64_t v14 = [v6 startingSegmentIdentifier];
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_INFO, "[Buffering] Starting for timeline: %@, starting segment %ld", (uint8_t *)buf, 0x16u);
    }
    unint64_t v10 = [v6 timeline];
    if (![v6 shouldIgnoreStartingSegmentIdentifier]
      || [v10 numberOfSegments] > 2)
    {
      [v6 timeline];
      [(id)objc_claimAutoreleasedReturnValue() size];
      PXRectWithOriginAndSize();
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __82__PXStoryResourcesPreloader__timelineReadingQueue_processRequest_previousRequest___block_invoke;
    v11[3] = &unk_1E5DD3368;
    v11[4] = self;
    [(PXStoryResourcesPreloader *)self _performChangesOnStoryQueue:v11];
  }
}

uint64_t __82__PXStoryResourcesPreloader__timelineReadingQueue_processRequest_previousRequest___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsLoadingLikelyToKeepUpWithPlayback:1];
  v2 = *(void **)(a1 + 32);
  LODWORD(v3) = 1.0;
  return [v2 setLoadingFractionComplete:v3];
}

void __82__PXStoryResourcesPreloader__timelineReadingQueue_processRequest_previousRequest___block_invoke_2(uint64_t a1, unint64_t a2, uint64_t a3, int a4)
{
  if (a2 < a2 + a3)
  {
    uint64_t v23 = v7;
    uint64_t v24 = v6;
    uint64_t v25 = v4;
    uint64_t v26 = v5;
    uint64_t v9 = a3;
    uint64_t v10 = a2;
    do
    {
      if (v10 >= [*(id *)(a1 + 32) numberOfSegments]) {
        break;
      }
      uint64_t v12 = [*(id *)(a1 + 32) identifierForSegmentAtIndex:v10];
      __int16 v13 = [*(id *)(a1 + 40) identifiersOfSegmentsMatchingSegmentWithIdentifier:v12 inTimeline:*(void *)(a1 + 32)];
      if (([*(id *)(a1 + 48) containsIndex:v12] & 1) != 0
        || v13 && [*(id *)(a1 + 48) containsIndexes:v13])
      {
        [*(id *)(a1 + 56) addIndex:v12];
      }
      else if (a4)
      {
        [*(id *)(a1 + 64) addIndex:v12];
        uint64_t v14 = *(void **)(a1 + 72);
        uint64_t v15 = [NSNumber numberWithInteger:v12];
        [v14 addObject:v15];

        long long v21 = 0u;
        long long v22 = 0u;
        long long v20 = 0u;
        long long v16 = *(void **)(a1 + 32);
        if (v16)
        {
          [v16 timeRangeForSegmentWithIdentifier:v12];
          long long v16 = *(void **)(a1 + 32);
        }
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __82__PXStoryResourcesPreloader__timelineReadingQueue_processRequest_previousRequest___block_invoke_3;
        v18[3] = &unk_1E5DCBA40;
        long long v19 = *(_OWORD *)(a1 + 80);
        v17[0] = v20;
        v17[1] = v21;
        v17[2] = v22;
        objc_msgSend(v16, "enumerateClipsInTimeRange:rect:usingBlock:", v17, v18, *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
      }

      ++v10;
      --v9;
    }
    while (v9);
  }
}

uint64_t __82__PXStoryResourcesPreloader__timelineReadingQueue_processRequest_previousRequest___block_invoke_3(uint64_t result, uint64_t a2, int a3, int a4, char *__src)
{
  if (a2 >= 1)
  {
    uint64_t v16 = v5;
    uint64_t v17 = v6;
    uint64_t v8 = a2;
    uint64_t v9 = result;
    do
    {
      uint64_t v10 = *(void **)(v9 + 32);
      memcpy(v15, __src, sizeof(v15));
      result = [v10 _isClipPreloadable:v15];
      if (result)
      {
        v11 = *(void **)(v9 + 32);
        memcpy(v15, __src, sizeof(v15));
        if ([v11 _isImagePreloadingNeededForClipInfo:v15]) {
          ++*(void *)(*(void *)(*(void *)(v9 + 40) + 8) + 32);
        }
        uint64_t v12 = *(void **)(v9 + 32);
        memcpy(v15, __src, sizeof(v15));
        result = [v12 _isVideoPreloadingNeededForClipInfo:v15];
        if (result)
        {
          uint64_t v13 = *((void *)__src + 19);
          if (v13 == 5 || v13 == 3) {
            uint64_t v14 = (void *)(*(void *)(*(void *)(v9 + 40) + 8) + 48);
          }
          else {
            uint64_t v14 = (void *)(*(void *)(*(void *)(v9 + 40) + 8) + 40);
          }
          ++*v14;
        }
      }
      __src += 768;
      --v8;
    }
    while (v8);
  }
  return result;
}

- (void)_timelineReadingQueue_sessionStartedWithAlreadyLoadedSegments:(id)a3 segmentsToLoad:(id)a4 preloadableClipsCounts:(id *)a5 request:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [v10 timeline];
  long long v16 = *(_OWORD *)&a5->var0;
  *(void *)&long long v17 = a5->var2;
  [(PXStoryResourcesPreloader *)self _noteSessionStartedWithLoadedSegments:v12 segmentsToLoad:v11 preloadableClipsCounts:&v16 inTimeline:v13];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __137__PXStoryResourcesPreloader__timelineReadingQueue_sessionStartedWithAlreadyLoadedSegments_segmentsToLoad_preloadableClipsCounts_request___block_invoke;
  v19[3] = &unk_1E5DD1558;
  v19[4] = self;
  id v20 = v10;
  id v14 = v10;
  [v12 enumerateIndexesUsingBlock:v19];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  [(PXStoryResourcesPreloader *)self _accumulateLoadedTimeRange:&v16 moreExpected:0];
  uint64_t v15 = (void *)[v12 mutableCopy];

  [(PXStoryResourcesPreloader *)self setTimelineReadingQueue_loadedSegments:v15];
}

void __137__PXStoryResourcesPreloader__timelineReadingQueue_sessionStartedWithAlreadyLoadedSegments_segmentsToLoad_preloadableClipsCounts_request___block_invoke(uint64_t a1, uint64_t a2)
{
  double v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) timeline];
  uint64_t v5 = v4;
  if (v4) {
    [v4 timeRangeForSegmentWithIdentifier:a2];
  }
  else {
    memset(v6, 0, sizeof(v6));
  }
  [v3 _accumulateLoadedTimeRange:v6 moreExpected:1];
}

- (void)_estimationQueue_updateEstimation
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PXStoryResourcesPreloader *)self currentRequest];
  uint64_t v5 = v4;
  if (!v4 || ([v4 isCancelled] & 1) != 0) {
    goto LABEL_71;
  }
  if (self->_estimationQueue_sessionStarted)
  {
    [(PXStoryResourcesPreloadingStatsStore *)self->_estimationQueue_statsStore loadedFraction];
    float v7 = v6;
  }
  else
  {
    float v7 = 0.0;
  }
  [(PXStoryResourcesPreloader *)self logContext];
  uint64_t v8 = self->_estimationQueue_currentSessionTimeline;
  uint64_t v9 = [(PXStoryResourcesPreloader *)self currentSegmentIdentifier];
  uint64_t v10 = [v5 startingSegmentIdentifier];
  id v11 = [v5 timeline];

  if (v8 != v11)
  {
    id v12 = [v5 timeline];
    uint64_t v13 = [(PXStoryTimeline *)v8 identifiersOfSegmentsMatchingSegmentWithIdentifier:v9 inTimeline:v12];
    uint64_t v9 = [v13 firstIndex];

    id v14 = [v5 timeline];
    uint64_t v15 = [(PXStoryTimeline *)v8 identifiersOfSegmentsMatchingSegmentWithIdentifier:v10 inTimeline:v14];
    uint64_t v10 = [v15 firstIndex];
  }
  uint64_t v51 = [(PXStoryTimeline *)v8 indexOfSegmentWithIdentifier:v9];
  v52 = +[PXStorySettings sharedInstance];
  if (![v52 preloadingEstimationStrategy])
  {
    memset(&v62, 0, sizeof(v62));
    [(PXStoryResourcesPreloader *)self currentPlaybackTime];
    memset(&v76, 0, sizeof(v76));
    if (v8) {
      [(PXStoryTimeline *)v8 timeRange];
    }
    else {
      memset(&v75, 0, sizeof(v75));
    }
    CMTimeRange buf = v75;
    CMTimeRangeGetEnd(&v76, &buf);
    uint64_t v24 = [(PXStoryTimeline *)v8 indexOfSegmentWithIdentifier:v10];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    uint64_t v25 = [(NSArray *)self->_estimationQueue_loadingSegments objectEnumerator];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v71 objects:v78 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v72;
      uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v72 != v27) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = -[PXStoryTimeline indexOfSegmentWithIdentifier:](v8, "indexOfSegmentWithIdentifier:", [*(id *)(*((void *)&v71 + 1) + 8 * i) integerValue]);
          if (v30 >= v28) {
            uint64_t v31 = v28;
          }
          else {
            uint64_t v31 = v30;
          }
          if (v30 > v24 && v30 != 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v28 = v31;
          }
        }
        uint64_t v26 = [v25 countByEnumeratingWithState:&v71 objects:v78 count:16];
      }
      while (v26);

      if (v51 != 0x7FFFFFFFFFFFFFFFLL && v28 != 0x7FFFFFFFFFFFFFFFLL)
      {
        int64_t v33 = [(PXStoryResourcesPreloader *)self lagsCount];
        memset(&v70, 0, sizeof(v70));
        buf.start = v76;
        CMTimeMultiplyByRatio(&v70, &buf.start, 1, 2);
        CMTimeMakeWithSeconds(&v69, 30.0, 600);
        buf.start = v70;
        CMTime time2 = v69;
        if (CMTimeCompare(&buf.start, &time2) >= 1)
        {
          CMTimeMakeWithSeconds(&v67, 30.0, 600);
          buf.start = v76;
          CMTime time2 = v67;
          CMTimeSubtract(&v68, &buf.start, &time2);
          CMTime v70 = v68;
        }
        buf.start = v62;
        CMTime time2 = v70;
        uint64_t v34 = 2 * v33 + 2;
        if (CMTimeCompare(&buf.start, &time2) >= 1
          && ![(PXStoryResourcesPreloader *)self isLoadingLikelyToKeepUpWithPlayback])
        {
          uint64_t v34 = [(PXStoryTimeline *)v8 numberOfSegments];
        }
        BOOL v36 = v28 < v24 || v28 - v51 >= v34;
        objc_msgSend(0, "appendFormat:", @"Indexes: (%ld - %ld = %ld) >= %ld\n", v28, v51, v28 - v51, v34);
        int v23 = 1;
        goto LABEL_49;
      }
    }
    else
    {
    }
    [0 appendString:@"canChangeIsLikelyToKeepUp = NO\n"];
    int v23 = 0;
    BOOL v36 = 1;
LABEL_49:
    buf.start = v76;
    CMTime time2 = v62;
    CMTimeSubtract(&v66, &buf.start, &time2);
    buf.start = v66;
    double Seconds = CMTimeGetSeconds(&buf.start);
    [(PXStoryResourcesPreloadingStatsStore *)self->_estimationQueue_statsStore estimatedLoadingTimeLeft];
    double v39 = v38;
    [0 appendFormat:@"playbackTimeLeft: %.2fs\n", *(void *)&Seconds];
    [0 appendFormat:@"loadingTimeLeft : %.2fs\n", *(void *)&v39];
    if (Seconds < v39) {
      BOOL v36 = 0;
    }
    long long v40 = +[PXStorySettings sharedInstance];
    int v41 = [v40 estimateTimeLeftPerPlaybackStyle];

    if ((v41 & v36) == 1) {
      int v19 = [(PXStoryResourcesPreloadingStatsStore *)self->_estimationQueue_statsStore didDownloadFirstVideo];
    }
    else {
      int v19 = v36 & ~v41;
    }
    [(PXStoryResourcesPreloader *)self loadingFractionComplete];
    if (v7 != v42)
    {
      v43 = PLStoryGetLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        if (v19) {
          __n128 v44 = @"YES";
        }
        else {
          __n128 v44 = @"NO";
        }
        __int16 v45 = v44;
        if (v23) {
          v46 = @"YES";
        }
        else {
          v46 = @"NO";
        }
        v46;
        v45;
        mach_absolute_time();
        PXTimebaseConversionFactor();
      }
    }
    goto LABEL_64;
  }
  if ([v52 preloadingEstimationStrategy] != 1)
  {
    CGSize v50 = [MEMORY[0x1E4F28B00] currentHandler];
    [v50 handleFailureInMethod:a2 object:self file:@"PXStoryResourcesPreloader.m" lineNumber:627 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  time2.value = 0;
  *(void *)&time2.timescale = &time2;
  time2.epoch = 0x2020000000;
  uint64_t v65 = 0;
  v62.value = 0;
  *(void *)&v62.timescale = &v62;
  v62.epoch = 0x2020000000;
  uint64_t v63 = 0x7FFFFFFFFFFFFFFFLL;
  estimationQueue_loadedSegments = self->_estimationQueue_loadedSegments;
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __62__PXStoryResourcesPreloader__estimationQueue_updateEstimation__block_invoke;
  v57[3] = &unk_1E5DCB9F0;
  id v58 = v8;
  uint64_t v59 = &v62;
  p_CMTime time2 = &time2;
  uint64_t v61 = v51;
  [(NSIndexSet *)estimationQueue_loadedSegments enumerateIndexesUsingBlock:v57];
  uint64_t v17 = *(void *)(*(void *)&time2.timescale + 24);
  uint64_t v18 = [v52 minPreloadedeSegments];
  LOBYTE(v19) = v17 > v18;
  id v20 = PLStoryGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    long long v21 = @"NO";
    if (v17 > v18) {
      long long v21 = @"YES";
    }
    long long v22 = v21;
    mach_absolute_time();
    PXTimebaseConversionFactor();
  }

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&time2, 8);
  LOBYTE(v23) = 1;
LABEL_64:
  v53[1] = 3221225472;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[2] = __62__PXStoryResourcesPreloader__estimationQueue_updateEstimation__block_invoke_57;
  v53[3] = &unk_1E5DCBA18;
  if (v7 >= 1.0) {
    char v47 = 1;
  }
  else {
    char v47 = v23;
  }
  char v55 = v47;
  if (v7 >= 1.0) {
    char v48 = 1;
  }
  else {
    char v48 = v19;
  }
  v53[4] = self;
  char v56 = v48;
  float v54 = v7;
  [(PXStoryResourcesPreloader *)self _performChangesOnStoryQueue:v53];
  stateQueue_estimationDiagnostics = self->_stateQueue_estimationDiagnostics;
  self->_stateQueue_estimationDiagnostics = 0;

LABEL_71:
}

uint64_t __62__PXStoryResourcesPreloader__estimationQueue_updateEstimation__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) indexOfSegmentWithIdentifier:a2];
  if (result - *(void *)(a1 + 56) >= 2)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(void *)(v4 + 24) != 0x7FFFFFFFFFFFFFFFLL || result != 0x7FFFFFFFFFFFFFFFLL)
    {
      *(void *)(v4 + 24) = result;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  return result;
}

uint64_t __62__PXStoryResourcesPreloader__estimationQueue_updateEstimation__block_invoke_57(uint64_t a1, double a2)
{
  if (*(unsigned char *)(a1 + 44)) {
    [*(id *)(a1 + 32) setIsLoadingLikelyToKeepUpWithPlayback:*(unsigned __int8 *)(a1 + 45)];
  }
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  double v3 = *(void **)(a1 + 32);
  return [v3 setLoadingFractionComplete:a2];
}

- (void)_estimationNoteClipWithPlaybackStyle:(int64_t)a3 loadedWithLoadingTime:(double)a4
{
  float v7 = [(PXStoryResourcesPreloader *)self estimationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__PXStoryResourcesPreloader__estimationNoteClipWithPlaybackStyle_loadedWithLoadingTime___block_invoke;
  block[3] = &unk_1E5DD35E0;
  block[4] = self;
  block[5] = a3;
  *(double *)&block[6] = a4;
  dispatch_async(v7, block);
}

uint64_t __88__PXStoryResourcesPreloader__estimationNoteClipWithPlaybackStyle_loadedWithLoadingTime___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 296) noteClipWithPlaybackStyle:*(void *)(a1 + 40) loadedWithLoadingTime:*(double *)(a1 + 48)];
  v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "_estimationQueue_updateEstimation");
}

- (void)_estimationNoteLoadingSegments:(id)a3 loadedSegments:(id)a4
{
  id v6 = a4;
  float v7 = (void *)[a3 copy];
  uint64_t v8 = (void *)[v6 copy];

  uint64_t v9 = [(PXStoryResourcesPreloader *)self estimationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PXStoryResourcesPreloader__estimationNoteLoadingSegments_loadedSegments___block_invoke;
  block[3] = &unk_1E5DD0F30;
  id v13 = v7;
  id v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __75__PXStoryResourcesPreloader__estimationNoteLoadingSegments_loadedSegments___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = *(id *)(*(void *)(a1 + 40) + 272);
  BOOL v4 = v2 != v3;
  if (v2 != v3)
  {
    uint64_t v5 = v3;
    id v6 = v2;
    char v7 = [v6 isEqual:v5];

    if (v7)
    {
      BOOL v4 = 0;
      goto LABEL_6;
    }
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = *(id *)(a1 + 32);
    id v2 = *(id *)(v8 + 272);
    *(void *)(v8 + 272) = v9;
  }

LABEL_6:
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(*(void *)(a1 + 40) + 280);
  if (v10 == v11)
  {

LABEL_10:
    if (!v4) {
      return;
    }
    goto LABEL_11;
  }
  id v12 = v11;
  id v13 = v10;
  char v14 = [v13 isEqual:v12];

  if (v14) {
    goto LABEL_10;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 280), *(id *)(a1 + 48));
  [*(id *)(*(void *)(a1 + 40) + 288) removeIndexes:*(void *)(a1 + 48)];
LABEL_11:
  id v15 = *(void **)(a1 + 40);
  objc_msgSend(v15, "_estimationQueue_updateEstimation");
}

- (void)_estimationNoteSessionStartedWithSegmentsToLoad:(id)a3 preloadableClipsCounts:(id *)a4 inTimeline:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(PXStoryResourcesPreloader *)self estimationQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __111__PXStoryResourcesPreloader__estimationNoteSessionStartedWithSegmentsToLoad_preloadableClipsCounts_inTimeline___block_invoke;
  v13[3] = &unk_1E5DCB9C8;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D v16 = *a4;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(v10, v13);
}

void __111__PXStoryResourcesPreloader__estimationNoteSessionStartedWithSegmentsToLoad_preloadableClipsCounts_inTimeline___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 296);
  long long v10 = *(_OWORD *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 72);
  [v2 noteSessionStartedPreloadableClipsCounts:&v10];
  *(void *)(*(void *)(a1 + 32) + 304) = mach_absolute_time();
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 272);
  *(void *)(v3 + 272) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 280);
  *(void *)(v5 + 280) = 0;

  uint64_t v7 = [*(id *)(a1 + 40) mutableCopy];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 288);
  *(void *)(v8 + 288) = v7;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 264), *(id *)(a1 + 48));
  *(unsigned char *)(*(void *)(a1 + 32) + 256) = 1;
}

- (void)_updateProcessing
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(PXStoryResourcesPreloader *)self currentRequest];
  objc_initWeak(&from, v3);

  BOOL v4 = [(PXStoryResourcesPreloader *)self previousRequest];
  objc_initWeak(&v10, v4);

  uint64_t v5 = [(PXStoryResourcesPreloader *)self timelineReadingQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PXStoryResourcesPreloader__updateProcessing__block_invoke;
  _OWORD v6[3] = &unk_1E5DCB9A0;
  objc_copyWeak(&v7, &location);
  objc_copyWeak(&v8, &from);
  objc_copyWeak(&v9, &v10);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __46__PXStoryResourcesPreloader__updateProcessing__block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  id v2 = objc_loadWeakRetained(a1 + 5);
  id v3 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "_timelineReadingQueue_processRequest:previousRequest:", v2, v3);
}

- (void)_invalidateProcessing
{
  id v2 = [(PXStoryResourcesPreloader *)self updater];
  [v2 setNeedsUpdateOf:sel__updateProcessing];
}

- (void)_updateEstimation
{
  objc_initWeak(&location, self);
  id v3 = [(PXStoryResourcesPreloader *)self estimationQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__PXStoryResourcesPreloader__updateEstimation__block_invoke;
  v4[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __46__PXStoryResourcesPreloader__updateEstimation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_estimationQueue_updateEstimation");
}

- (void)_invalidateEstimation
{
  id v2 = [(PXStoryResourcesPreloader *)self updater];
  [v2 setNeedsUpdateOf:sel__updateEstimation];
}

- (void)_setNeedsUpdate
{
}

- (void)cancelProcessingAllRequests
{
}

- (void)startProcessingRequest:(id)a3
{
  id v15 = a3;
  id v4 = [(PXStoryResourcesPreloader *)self currentRequest];

  id v5 = v15;
  if (v4 != v15)
  {
    id v6 = [(PXStoryResourcesPreloader *)self currentRequest];
    id v7 = [v15 timeline];
    id v8 = [v6 timeline];
    if (v7 == v8)
    {
    }
    else
    {
      char v9 = [v7 isEqual:v8];

      if ((v9 & 1) == 0)
      {

        goto LABEL_11;
      }
    }
    id v10 = [v15 songResource];
    id v11 = [v6 songResource];
    if (v10 == v11)
    {
    }
    else
    {
      id v12 = v11;
      char v13 = [v10 isEqual:v11];

      if ((v13 & 1) == 0) {
        goto LABEL_11;
      }
    }
    uint64_t v14 = [v15 startingSegmentIdentifier];
    if (v14 == [v6 startingSegmentIdentifier])
    {
LABEL_12:

      id v5 = v15;
      goto LABEL_13;
    }
LABEL_11:
    [(PXStoryResourcesPreloader *)self setCurrentRequest:v15];
    goto LABEL_12;
  }
LABEL_13:
}

- (void)_noteLoadingEndedForClip:(id *)a3 inSegment:(int64_t)a4 resourceType:(id)a5 resourceIdentifier:(id)a6 timeRange:(id *)a7 error:(id)a8 loadingTime:(double)a9 playbackStyle:(int64_t)a10
{
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = [(PXStoryResourcesPreloader *)self loadingStatusReporter];
  [v20 notifyPreloadingCompleteForClipIdentifier:a3->var0];

  long long v21 = [(PXStoryResourcesPreloader *)self stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __138__PXStoryResourcesPreloader__noteLoadingEndedForClip_inSegment_resourceType_resourceIdentifier_timeRange_error_loadingTime_playbackStyle___block_invoke;
  block[3] = &unk_1E5DCB950;
  void block[4] = self;
  block[5] = a4;
  long long v22 = *(_OWORD *)&a7->var0.var3;
  long long v37 = *(_OWORD *)&a7->var0.var0;
  long long v38 = v22;
  long long v39 = *(_OWORD *)&a7->var1.var1;
  block[6] = a10;
  *(double *)&void block[7] = a9;
  dispatch_async(v21, block);

  int v23 = +[PXStorySettings sharedInstance];
  int v24 = [v23 simulateResourcesBufferingError];

  if (!v19 && v24)
  {
    PXStoryErrorCreateWithCodeDebugFormat(22, @"Simulated preloading error.", v25, v26, v27, v28, v29, v30, v31[0]);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v19)
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = (uint64_t)__138__PXStoryResourcesPreloader__noteLoadingEndedForClip_inSegment_resourceType_resourceIdentifier_timeRange_error_loadingTime_playbackStyle___block_invoke_2;
    v31[3] = (uint64_t)&unk_1E5DCB978;
    void v31[4] = (uint64_t)self;
    id v32 = v19;
    id v33 = v17;
    id v34 = v18;
    memcpy(v35, a3, sizeof(v35));
    [(PXStoryResourcesPreloader *)self _performChangesOnStoryQueue:v31];
  }
}

uint64_t __138__PXStoryResourcesPreloader__noteLoadingEndedForClip_inSegment_resourceType_resourceIdentifier_timeRange_error_loadingTime_playbackStyle___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 240);
  id v3 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  [v2 removeObject:v3];

  id v4 = *(void **)(*(void *)(a1 + 32) + 240);
  id v5 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  uint64_t v6 = [v4 countForObject:v5];

  if (!v6)
  {
    [*(id *)(*(void *)(a1 + 32) + 248) addIndex:*(void *)(a1 + 40)];
    id v7 = *(void **)(a1 + 32);
    long long v8 = *(_OWORD *)(a1 + 80);
    v13[0] = *(_OWORD *)(a1 + 64);
    v13[1] = v8;
    v13[2] = *(_OWORD *)(a1 + 96);
    objc_msgSend(v7, "_stateQueue_accumulateLoadedTimeRange:moreExpected:", v13, 1);
  }
  char v9 = *(id **)(a1 + 32);
  id v10 = [v9[30] objectEnumerator];
  id v11 = [v10 allObjects];
  [v9 _estimationNoteLoadingSegments:v11 loadedSegments:*(void *)(*(void *)(a1 + 32) + 248)];

  return [*(id *)(a1 + 32) _estimationNoteClipWithPlaybackStyle:*(void *)(a1 + 48) loadedWithLoadingTime:*(double *)(a1 + 56)];
}

void __138__PXStoryResourcesPreloader__noteLoadingEndedForClip_inSegment_resourceType_resourceIdentifier_timeRange_error_loadingTime_playbackStyle___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 40);
  id v4 = [NSString stringWithFormat:@"An error occured when preloading: %@ uuid: %@, clip %ld", *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64)];
  id v3 = PXStoryErrorCreateWithCodeUnderlyingErrorDebugDescription(22, v2, v4);
  [*(id *)(a1 + 32) setError:v3];
}

- (void)_noteLoadingStartedForClipInSegment:(int64_t)a3
{
  uint64_t v6 = [(PXStoryResourcesPreloader *)self stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PXStoryResourcesPreloader__noteLoadingStartedForClipInSegment___block_invoke;
  block[3] = &unk_1E5DD35E0;
  void block[4] = self;
  block[5] = a3;
  block[6] = a2;
  dispatch_async(v6, block);
}

void __65__PXStoryResourcesPreloader__noteLoadingStartedForClipInSegment___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 248) containsIndex:*(void *)(a1 + 40)]) {
    PXAssertGetLog();
  }
  id v2 = *(void **)(*(void *)(a1 + 32) + 240);
  id v3 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  [v2 addObject:v3];

  id v4 = *(id **)(a1 + 32);
  id v5 = [v4[30] objectEnumerator];
  uint64_t v6 = [v5 allObjects];
  [v4 _estimationNoteLoadingSegments:v6 loadedSegments:*(void *)(*(void *)(a1 + 32) + 248)];
}

- (void)_stateQueue_accumulateLoadedTimeRange:(id *)a3 moreExpected:(BOOL)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_stateQueue_loadedContinuousTimeRange = &self->_stateQueue_loadedContinuousTimeRange;
  CMTimeValue value = self->_stateQueue_loadedContinuousTimeRange.start.value;
  CMTimeFlags flags = self->_stateQueue_loadedContinuousTimeRange.start.flags;
  CMTimeScale timescale = self->_stateQueue_loadedContinuousTimeRange.start.timescale;
  if (flags)
  {
    CMTimeFlags v7 = self->_stateQueue_loadedContinuousTimeRange.duration.flags;
    if ((v7 & 1) != 0 && self->_stateQueue_loadedContinuousTimeRange.duration.epoch == 0)
    {
      CMTimeValue v9 = self->_stateQueue_loadedContinuousTimeRange.duration.value;
      if ((v9 & 0x8000000000000000) == 0)
      {
        CMTimeEpoch epoch = self->_stateQueue_loadedContinuousTimeRange.start.epoch;
        CMTimeScale v13 = self->_stateQueue_loadedContinuousTimeRange.duration.timescale;
        *(_OWORD *)time1 = *(_OWORD *)&a3->var0.var0;
        *(void *)&time1[16] = a3->var0.var3;
        time2.start.CMTimeValue value = p_stateQueue_loadedContinuousTimeRange->start.value;
        time2.start.CMTimeScale timescale = self->_stateQueue_loadedContinuousTimeRange.start.timescale;
        time2.start.CMTimeFlags flags = flags;
        time2.start.CMTimeEpoch epoch = epoch;
        if ((CMTimeCompare((CMTime *)time1, &time2.start) & 0x80000000) == 0 && a4)
        {
          time2.start.CMTimeValue value = value;
          time2.start.CMTimeScale timescale = timescale;
          time2.start.CMTimeFlags flags = flags;
          time2.start.CMTimeEpoch epoch = epoch;
          time2.duration.CMTimeValue value = v9;
          time2.duration.CMTimeScale timescale = v13;
          time2.duration.CMTimeFlags flags = v7;
          time2.duration.CMTimeEpoch epoch = 0;
          long long v14 = *(_OWORD *)&a3->var0.var3;
          v21[0] = *(_OWORD *)&a3->var0.var0;
          v21[1] = v14;
          v21[2] = *(_OWORD *)&a3->var1.var1;
          PXStoryTimeRangeUnion(&time2, (uint64_t)v21, (uint64_t)time1);
          long long v15 = *(_OWORD *)&time1[16];
          *(_OWORD *)&p_stateQueue_loadedContinuousTimeRange->start.CMTimeValue value = *(_OWORD *)time1;
          *(_OWORD *)&p_stateQueue_loadedContinuousTimeRange->start.CMTimeEpoch epoch = v15;
          *(_OWORD *)&p_stateQueue_loadedContinuousTimeRange->duration.CMTimeScale timescale = v24;
          return;
        }
        stateQueue_loadedTimeRanges = self->_stateQueue_loadedTimeRanges;
        id v17 = [PXStoryTimeRangeValue alloc];
        *(void *)time1 = value;
        *(void *)&time1[8] = __PAIR64__(flags, timescale);
        *(void *)&time1[16] = epoch;
        *(void *)&time1[24] = v9;
        long long v24 = __PAIR64__(v7, v13);
        id v18 = [(PXStoryTimeRangeValue *)v17 initWithStoryTimeRange:time1];
        [(NSMutableArray *)stateQueue_loadedTimeRanges addObject:v18];
      }
    }
  }
  long long v19 = *(_OWORD *)&a3->var0.var0;
  long long v20 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&p_stateQueue_loadedContinuousTimeRange->start.CMTimeEpoch epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&p_stateQueue_loadedContinuousTimeRange->duration.CMTimeScale timescale = v20;
  *(_OWORD *)&p_stateQueue_loadedContinuousTimeRange->start.CMTimeValue value = v19;
}

- (void)_accumulateLoadedTimeRange:(id *)a3 moreExpected:(BOOL)a4
{
  CMTimeFlags v7 = [(PXStoryResourcesPreloader *)self stateQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  long long v8 = *(_OWORD *)&a3->var0.var3;
  long long v10 = *(_OWORD *)&a3->var0.var0;
  v9[2] = __69__PXStoryResourcesPreloader__accumulateLoadedTimeRange_moreExpected___block_invoke;
  v9[3] = &unk_1E5DCB928;
  v9[4] = self;
  long long v11 = v8;
  long long v12 = *(_OWORD *)&a3->var1.var1;
  BOOL v13 = a4;
  dispatch_async(v7, v9);
}

uint64_t __69__PXStoryResourcesPreloader__accumulateLoadedTimeRange_moreExpected___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(unsigned __int8 *)(a1 + 88);
  long long v3 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "_stateQueue_accumulateLoadedTimeRange:moreExpected:", v5, v2);
}

- (void)_noteSessionStartedWithLoadedSegments:(id)a3 segmentsToLoad:(id)a4 preloadableClipsCounts:(id *)a5 inTimeline:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  BOOL v13 = [(PXStoryResourcesPreloader *)self stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __116__PXStoryResourcesPreloader__noteSessionStartedWithLoadedSegments_segmentsToLoad_preloadableClipsCounts_inTimeline___block_invoke;
  block[3] = &unk_1E5DD32A8;
  void block[4] = self;
  id v17 = v10;
  id v14 = v10;
  dispatch_sync(v13, block);

  $9FE6E10C8CE45DBC9A88DFDEA39A390D v15 = *a5;
  [(PXStoryResourcesPreloader *)self _estimationNoteSessionStartedWithSegmentsToLoad:v12 preloadableClipsCounts:&v15 inTimeline:v11];

  [(PXStoryResourcesPreloader *)self _estimationNoteLoadingSegments:0 loadedSegments:v14];
}

void __116__PXStoryResourcesPreloader__noteSessionStartedWithLoadedSegments_segmentsToLoad_preloadableClipsCounts_inTimeline___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 176) removeAllObjects];
  uint64_t v2 = (_OWORD *)(*(void *)(a1 + 32) + 184);
  _OWORD *v2 = 0u;
  v2[1] = 0u;
  v2[2] = 0u;
  [*(id *)(*(void *)(a1 + 32) + 240) removeAllObjects];
  uint64_t v3 = [*(id *)(a1 + 40) mutableCopy];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 248);
  *(void *)(v4 + 248) = v3;
}

- (NSArray)loadedTimeRanges
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__251705;
  id v11 = __Block_byref_object_dispose__251706;
  id v12 = 0;
  uint64_t v3 = [(PXStoryResourcesPreloader *)self stateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__PXStoryResourcesPreloader_loadedTimeRanges__block_invoke;
  _OWORD v6[3] = &unk_1E5DD0588;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __45__PXStoryResourcesPreloader_loadedTimeRanges__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v2 + 196) & 1) != 0
    && ((*(_DWORD *)(v2 + 220) & 1) != 0 ? (BOOL v3 = *(void *)(v2 + 224) == 0) : (BOOL v3 = 0),
        v3 && (*(void *)(v2 + 208) & 0x8000000000000000) == 0))
  {
    id v4 = *(void **)(v2 + 176);
    id v5 = [PXStoryTimeRangeValue alloc];
    long long v6 = *(_OWORD *)(*(void *)(a1 + 32) + 184);
    long long v7 = *(_OWORD *)(*(void *)(a1 + 32) + 216);
    v15[1] = *(_OWORD *)(*(void *)(a1 + 32) + 200);
    v15[2] = v7;
    v15[0] = v6;
    long long v8 = [(PXStoryTimeRangeValue *)v5 initWithStoryTimeRange:v15];
    uint64_t v9 = [v4 arrayByAddingObject:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    uint64_t v12 = [*(id *)(v2 + 176) copy];
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

- (void)setError:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(PXStoryResourcesPreloader *)self stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__PXStoryResourcesPreloader_setError___block_invoke;
  block[3] = &unk_1E5DCCA20;
  id v6 = v4;
  id v8 = v6;
  uint64_t v9 = self;
  uint64_t v10 = &v11;
  dispatch_sync(v5, block);

  if (*((unsigned char *)v12 + 24)) {
    [(PXStoryResourcesPreloader *)self signalChange:4];
  }

  _Block_object_dispose(&v11, 8);
}

void __38__PXStoryResourcesPreloader_setError___block_invoke(uint64_t a1)
{
  id v5 = *(id *)(a1 + 32);
  id v2 = *(id *)(*(void *)(a1 + 40) + 120);
  if (v5 == v2)
  {
  }
  else
  {
    id v3 = v5;
    char v4 = [v3 isEqual:v2];

    if ((v4 & 1) == 0)
    {
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 120), *(id *)(a1 + 32));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
}

- (NSError)error
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__251705;
  uint64_t v11 = __Block_byref_object_dispose__251706;
  id v12 = 0;
  id v3 = [(PXStoryResourcesPreloader *)self stateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__PXStoryResourcesPreloader_error__block_invoke;
  _OWORD v6[3] = &unk_1E5DD0588;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSError *)v4;
}

void __34__PXStoryResourcesPreloader_error__block_invoke(uint64_t a1)
{
}

- (void)setLoadingFractionComplete:(float)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v5 = [(PXStoryResourcesPreloader *)self stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PXStoryResourcesPreloader_setLoadingFractionComplete___block_invoke;
  block[3] = &unk_1E5DCCD98;
  float v7 = a3;
  void block[4] = self;
  void block[5] = &v8;
  dispatch_sync(v5, block);

  if (*((unsigned char *)v9 + 24)) {
    [(PXStoryResourcesPreloader *)self signalChange:2];
  }
  _Block_object_dispose(&v8, 8);
}

void __56__PXStoryResourcesPreloader_setLoadingFractionComplete___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  float v1 = *(float *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v1 != *(float *)(v2 + 112))
  {
    *(float *)(v2 + 112) = v1;
    id v4 = *(float **)(a1 + 32);
    if (v4[28] >= 1.0)
    {
      id v5 = PLStoryGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = [*(id *)(a1 + 32) logContext];
        int v12 = 134217984;
        uint64_t v13 = v6;
        _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_INFO, "[Buffering] [Context=%llu] Preloading finished", (uint8_t *)&v12, 0xCu);
      }

      id v4 = *(float **)(a1 + 32);
    }
    float v7 = [v4 log];
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, *(const void **)(a1 + 32));
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v9 = v8;
      if (os_signpost_enabled(v7))
      {
        uint64_t v10 = [*(id *)(a1 + 32) logContext];
        double v11 = *(float *)(a1 + 48);
        int v12 = 134218240;
        uint64_t v13 = v10;
        __int16 v14 = 2048;
        double v15 = v11;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_EVENT, v9, "PXStoryResourcesPreloaderFractionComplete", "Context=%{signpost.telemetry:string2}lu %.2f", (uint8_t *)&v12, 0x16u);
      }
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (float)loadingFractionComplete
{
  uint64_t v7 = 0;
  os_signpost_id_t v8 = (float *)&v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  id v3 = [(PXStoryResourcesPreloader *)self stateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__PXStoryResourcesPreloader_loadingFractionComplete__block_invoke;
  _OWORD v6[3] = &unk_1E5DD0588;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  float v4 = v8[6];
  _Block_object_dispose(&v7, 8);
  return v4;
}

float __52__PXStoryResourcesPreloader_loadingFractionComplete__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 112);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)lagsCount
{
  uint64_t v7 = 0;
  os_signpost_id_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v3 = [(PXStoryResourcesPreloader *)self stateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__PXStoryResourcesPreloader_lagsCount__block_invoke;
  _OWORD v6[3] = &unk_1E5DD0588;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __38__PXStoryResourcesPreloader_lagsCount__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 104);
  return result;
}

- (void)setIsLoadingLikelyToKeepUpWithPlayback:(BOOL)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v5 = [(PXStoryResourcesPreloader *)self stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PXStoryResourcesPreloader_setIsLoadingLikelyToKeepUpWithPlayback___block_invoke;
  block[3] = &unk_1E5DCCB88;
  BOOL v7 = a3;
  void block[4] = self;
  void block[5] = &v8;
  dispatch_sync(v5, block);

  if (*((unsigned char *)v9 + 24)) {
    [(PXStoryResourcesPreloader *)self signalChange:2];
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __68__PXStoryResourcesPreloader_setIsLoadingLikelyToKeepUpWithPlayback___block_invoke(uint64_t result)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v1 = *(unsigned __int8 *)(result + 48);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 97))
  {
    uint64_t v3 = result;
    *(unsigned char *)(v2 + 97) = v1;
    if (!*(unsigned char *)(result + 48)) {
      ++*(void *)(*(void *)(result + 32) + 104);
    }
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    float result = *(void *)(result + 32);
    if (!*(unsigned char *)(v3 + 48)) {
      goto LABEL_10;
    }
    if (*(unsigned char *)(result + 96))
    {
      int64_t v4 = [(id)result log];
      os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, *(const void **)(v3 + 32));
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v6 = v5;
        if (os_signpost_enabled(v4))
        {
          uint64_t v7 = [*(id *)(v3 + 32) logContext];
          uint64_t v8 = +[PXNetworkStatusMonitor sharedInstance];
          int v13 = 134218240;
          uint64_t v14 = v7;
          __int16 v15 = 2050;
          uint64_t v16 = [v8 bestAvailableNetworkType];
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v4, OS_SIGNPOST_INTERVAL_END, v6, "PXStoryResourcesPreloaderNotLikelyToKeepUp", "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES networkType=%{signpost.telemetry:number1,public}lu ", (uint8_t *)&v13, 0x16u);
        }
      }

      float result = *(void *)(v3 + 32);
      if (!*(unsigned char *)(v3 + 48))
      {
LABEL_10:
        uint64_t v9 = [(id)result log];
        os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, *(const void **)(v3 + 32));
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v11 = v10;
          if (os_signpost_enabled(v9))
          {
            uint64_t v12 = [*(id *)(v3 + 32) logContext];
            int v13 = 134217984;
            uint64_t v14 = v12;
            _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PXStoryResourcesPreloaderNotLikelyToKeepUp", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v13, 0xCu);
          }
        }

        float result = *(void *)(v3 + 32);
      }
    }
    *(unsigned char *)(result + 96) = 1;
  }
  return result;
}

- (BOOL)isLoadingLikelyToKeepUpWithPlayback
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(PXStoryResourcesPreloader *)self stateQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__PXStoryResourcesPreloader_isLoadingLikelyToKeepUpWithPlayback__block_invoke;
  _OWORD v5[3] = &unk_1E5DD0588;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __64__PXStoryResourcesPreloader_isLoadingLikelyToKeepUpWithPlayback__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 97);
  return result;
}

- (void)setCurrentRequest:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  os_signpost_id_t v5 = [(PXStoryResourcesPreloader *)self stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PXStoryResourcesPreloader_setCurrentRequest___block_invoke;
  block[3] = &unk_1E5DCCA20;
  id v6 = v4;
  id v8 = v6;
  char v9 = self;
  os_signpost_id_t v10 = &v11;
  dispatch_sync(v5, block);

  if (*((unsigned char *)v12 + 24))
  {
    [(PXStoryResourcesPreloader *)self _invalidateEstimation];
    [(PXStoryResourcesPreloader *)self _invalidateProcessing];
  }

  _Block_object_dispose(&v11, 8);
}

void __47__PXStoryResourcesPreloader_setCurrentRequest___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(v1 + 160);
  if (*(void **)(a1 + 32) != v2)
  {
    objc_storeStrong((id *)(v1 + 168), v2);
    [*(id *)(*(void *)(a1 + 40) + 168) setIsCancelled:1];
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 160), *(id *)(a1 + 32));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (id)previousRequest
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  os_signpost_id_t v10 = __Block_byref_object_copy__251705;
  uint64_t v11 = __Block_byref_object_dispose__251706;
  id v12 = 0;
  uint64_t v3 = [(PXStoryResourcesPreloader *)self stateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__PXStoryResourcesPreloader_previousRequest__block_invoke;
  _OWORD v6[3] = &unk_1E5DD0588;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __44__PXStoryResourcesPreloader_previousRequest__block_invoke(uint64_t a1)
{
}

- (PXStoryResourcesPreloadingRequest)currentRequest
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  os_signpost_id_t v10 = __Block_byref_object_copy__251705;
  uint64_t v11 = __Block_byref_object_dispose__251706;
  id v12 = 0;
  uint64_t v3 = [(PXStoryResourcesPreloader *)self stateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__PXStoryResourcesPreloader_currentRequest__block_invoke;
  _OWORD v6[3] = &unk_1E5DD0588;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (PXStoryResourcesPreloadingRequest *)v4;
}

void __43__PXStoryResourcesPreloader_currentRequest__block_invoke(uint64_t a1)
{
}

- (void)setCurrentSegmentIdentifier:(int64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  os_signpost_id_t v5 = [(PXStoryResourcesPreloader *)self stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PXStoryResourcesPreloader_setCurrentSegmentIdentifier___block_invoke;
  block[3] = &unk_1E5DCDEC8;
  void block[5] = &v7;
  void block[6] = a3;
  void block[4] = self;
  dispatch_sync(v5, block);

  if (*((unsigned char *)v8 + 24)) {
    [(PXStoryResourcesPreloader *)self _invalidateEstimation];
  }
  _Block_object_dispose(&v7, 8);
}

void *__57__PXStoryResourcesPreloader_setCurrentSegmentIdentifier___block_invoke(void *result)
{
  uint64_t v1 = result[6];
  uint64_t v2 = result[4];
  if (v1 != *(void *)(v2 + 152))
  {
    *(void *)(v2 + 152) = v1;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
  }
  return result;
}

- (int64_t)currentSegmentIdentifier
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(PXStoryResourcesPreloader *)self stateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__PXStoryResourcesPreloader_currentSegmentIdentifier__block_invoke;
  _OWORD v6[3] = &unk_1E5DD0588;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __53__PXStoryResourcesPreloader_currentSegmentIdentifier__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 152);
  return result;
}

- (void)setCurrentPlaybackTime:(id *)a3
{
  os_signpost_id_t v5 = [(PXStoryResourcesPreloader *)self stateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__PXStoryResourcesPreloader_setCurrentPlaybackTime___block_invoke;
  _OWORD v6[3] = &unk_1E5DD01C8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  void v6[4] = self;
  dispatch_sync(v5, v6);
}

__n128 __52__PXStoryResourcesPreloader_setCurrentPlaybackTime___block_invoke(uint64_t a1)
{
  long long v2 = *(_OWORD *)(*(void *)(a1 + 32) + 128);
  CMTimeEpoch v5 = *(void *)(*(void *)(a1 + 32) + 144);
  CMTime time1 = *(CMTime *)(a1 + 40);
  *(_OWORD *)&time2.CMTimeValue value = v2;
  time2.CMTimeEpoch epoch = v5;
  if (CMTimeCompare(&time1, &time2))
  {
    int64_t v4 = (__n128 *)(*(void *)(a1 + 32) + 128);
    __n128 result = *(__n128 *)(a1 + 40);
    v4[1].n128_u64[0] = *(void *)(a1 + 56);
    __n128 *v4 = result;
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentPlaybackTime
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3810000000;
  uint64_t v11 = &unk_1AB5D584F;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  CMTimeEpoch v5 = [(PXStoryResourcesPreloader *)self stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PXStoryResourcesPreloader_currentPlaybackTime__block_invoke;
  block[3] = &unk_1E5DD0588;
  void block[4] = self;
  void block[5] = &v8;
  dispatch_sync(v5, block);

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v9 + 4);
  _Block_object_dispose(&v8, 8);
  return result;
}

__n128 __48__PXStoryResourcesPreloader_currentPlaybackTime__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  long long v2 = (__n128 *)(*(void *)(a1 + 32) + 128);
  unint64_t v3 = *(void *)(*(void *)(a1 + 32) + 144);
  __n128 result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryResourcesPreloader;
  [(PXStoryResourcesPreloader *)&v4 didPerformChanges];
  unint64_t v3 = [(PXStoryResourcesPreloader *)self updater];
  [v3 updateIfNeeded];
}

- (void)_performChangesOnStoryQueue:(id)a3
{
  id v4 = a3;
  CMTimeEpoch v5 = [(PXStoryResourcesPreloader *)self storyQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PXStoryResourcesPreloader__performChangesOnStoryQueue___block_invoke;
  v7[3] = &unk_1E5DD3280;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __57__PXStoryResourcesPreloader__performChangesOnStoryQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performChanges:*(void *)(a1 + 40)];
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryResourcesPreloader;
  [(PXStoryResourcesPreloader *)&v3 performChanges:a3];
}

- (void)dealloc
{
  [(PXStoryResourcesPreloadingRequest *)self->_stateQueue_currentRequest setIsCancelled:1];
  objc_super v3 = [(PXStoryResourcesPreloader *)self loadingOperationQueue];
  [v3 cancelAllOperations];

  v4.receiver = self;
  v4.super_class = (Class)PXStoryResourcesPreloader;
  [(PXStoryResourcesPreloader *)&v4 dealloc];
}

- (PXStoryResourcesPreloader)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryResourcesPreloader.m", 160, @"%s is not available as initializer", "-[PXStoryResourcesPreloader init]");

  abort();
}

- (PXStoryResourcesPreloader)initWithMediaProvider:(id)a3 displayScale:(double)a4 videoSessionManager:(id)a5 loadingStatusReporter:(id)a6 storyQueue:(id)a7 isExporting:(BOOL)a8 isInline:(BOOL)a9
{
  id v50 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v51.receiver = self;
  v51.super_class = (Class)PXStoryResourcesPreloader;
  long long v20 = [(PXStoryResourcesPreloader *)&v51 init];
  long long v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_mediaProvider, a3);
    v21->_displayScale = a4;
    objc_storeStrong((id *)&v21->_videoSessionManager, a5);
    objc_storeStrong((id *)&v21->_loadingStatusReporter, a6);
    long long v22 = (const char *)*MEMORY[0x1E4F8C518];
    int v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    id v24 = objc_claimAutoreleasedReturnValue();
    os_log_t v25 = os_log_create(v22, (const char *)[v24 UTF8String]);
    log = v21->_log;
    v21->_log = (OS_os_log *)v25;

    objc_storeStrong((id *)&v21->_storyQueue, a7);
    v21->_isExporting = a8;
    v21->_isInline = a9;
    uint64_t v27 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v21 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v21->_updater;
    v21->_updater = (PXUpdater *)v27;

    [(PXUpdater *)v21->_updater addUpdateSelector:sel__updateEstimation];
    [(PXUpdater *)v21->_updater addUpdateSelector:sel__updateProcessing];
    uint64_t v29 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v30 = dispatch_queue_create("PXStoryResourcesPreloader.timelineReading", v29);
    timelineReadingQueue = v21->_timelineReadingQueue;
    v21->_timelineReadingQueue = (OS_dispatch_queue *)v30;

    dispatch_queue_t v32 = dispatch_queue_create("PXStoryResourcesPreloader.state", v29);
    stateQueue = v21->_stateQueue;
    v21->_stateQueue = (OS_dispatch_queue *)v32;

    dispatch_queue_t v34 = dispatch_queue_create("PXStoryResourcesPreloader.estimation", v29);
    estimationQueue = v21->_estimationQueue;
    v21->_estimationQueue = (OS_dispatch_queue *)v34;

    BOOL v36 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    loadingOperationQueue = v21->_loadingOperationQueue;
    v21->_loadingOperationQueue = v36;

    long long v38 = +[PXStorySettings sharedInstance];
    -[NSOperationQueue setMaxConcurrentOperationCount:](v21->_loadingOperationQueue, "setMaxConcurrentOperationCount:", [v38 simultaneousPreloadingOperationsCount]);

    [(NSOperationQueue *)v21->_loadingOperationQueue setQualityOfService:25];
    [(NSOperationQueue *)v21->_loadingOperationQueue setName:@"PXStoryResourcesPreloader.resourcesLoading"];
    long long v39 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    timelineReadingQueue_loadedSegments = v21->_timelineReadingQueue_loadedSegments;
    v21->_timelineReadingQueue_loadedSegments = v39;

    int v41 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    stateQueue_loadingSegments = v21->_stateQueue_loadingSegments;
    v21->_stateQueue_loadingSegments = v41;

    v43 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    stateQueue_loadedTimeRanges = v21->_stateQueue_loadedTimeRanges;
    v21->_stateQueue_loadedTimeRanges = v43;

    __int16 v45 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    stateQueue_loadedSegments = v21->_stateQueue_loadedSegments;
    v21->_stateQueue_loadedSegments = v45;

    char v47 = objc_alloc_init(PXStoryResourcesPreloadingStatsStore);
    estimationQueue_statsStore = v21->_estimationQueue_statsStore;
    v21->_estimationQueue_statsStore = v47;
  }
  return v21;
}

@end