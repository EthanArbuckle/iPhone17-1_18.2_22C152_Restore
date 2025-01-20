@interface PXStoryResourcesPreloadingController
- (BOOL)canStartPreloading;
- (BOOL)isActive;
- (BOOL)isCompleted;
- (BOOL)isPreloadingEnabled;
- (BOOL)isSongResourcesPreloadingEnabled;
- (BOOL)shouldSkipInitialSegment;
- (NSError)error;
- (NSString)diagnosticDescription;
- (PXStoryModel)model;
- (PXStoryResourcesPreloadingController)initWithModel:(id)a3 mediaProvider:(id)a4;
- (PXStoryResourcesPreloadingController)initWithObservableModel:(id)a3;
- (float)loadingFractionComplete;
- (int64_t)bufferingEvents;
- (unint64_t)isCompletedChangeDescriptor;
- (void)_invalidateCanStartPreloading;
- (void)_invalidateCurrentPlaybackTimeOnPreloader;
- (void)_invalidateCurrentSegmentIdentifierOnPreloader;
- (void)_invalidatePreloadingRequest;
- (void)_invalidateReadinessStatus;
- (void)_updateCanStartPreloading;
- (void)_updateCurrentPlaybackTimeOnPreloader;
- (void)_updateCurrentSegmentIdentifierOnPreloader;
- (void)_updatePreloadingRequest;
- (void)_updateReadinessStatus;
- (void)configureUpdater:(id)a3;
- (void)dealloc;
- (void)handleModelChange:(unint64_t)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setBufferingEvents:(int64_t)a3;
- (void)setCanStartPreloading:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsCompleted:(BOOL)a3;
- (void)setIsPreloadingEnabled:(BOOL)a3;
- (void)setIsSongResourcesPreloadingEnabled:(BOOL)a3;
- (void)setLoadingFractionComplete:(float)a3;
- (void)setShouldSkipInitialSegment:(BOOL)a3;
@end

@implementation PXStoryResourcesPreloadingController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_model);
  objc_storeStrong((id *)&self->_preloader, 0);
}

- (void)setBufferingEvents:(int64_t)a3
{
  self->_bufferingEvents = a3;
}

- (int64_t)bufferingEvents
{
  return self->_bufferingEvents;
}

- (BOOL)canStartPreloading
{
  return self->_canStartPreloading;
}

- (NSError)error
{
  return self->_error;
}

- (float)loadingFractionComplete
{
  return self->_loadingFractionComplete;
}

- (BOOL)shouldSkipInitialSegment
{
  return self->_shouldSkipInitialSegment;
}

- (BOOL)isSongResourcesPreloadingEnabled
{
  return self->_isSongResourcesPreloadingEnabled;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (PXStoryModel)model
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_model);
  return (PXStoryModel *)WeakRetained;
}

- (BOOL)isPreloadingEnabled
{
  return self->_isPreloadingEnabled;
}

- (BOOL)isCompleted
{
  return self->_isCompleted;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)PreloaderObservationContext == a5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __69__PXStoryResourcesPreloadingController_observable_didChange_context___block_invoke;
    v6[3] = &unk_1E5DD33E0;
    v6[4] = self;
    v6[5] = a4;
    [(PXStoryController *)self performChanges:v6];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PXStoryResourcesPreloadingController;
    -[PXStoryController observable:didChange:context:](&v5, sel_observable_didChange_context_, a3, a4);
  }
}

uint64_t __69__PXStoryResourcesPreloadingController_observable_didChange_context___block_invoke(uint64_t result)
{
  if ((*(unsigned char *)(result + 40) & 7) != 0) {
    return [*(id *)(result + 32) _invalidateReadinessStatus];
  }
  return result;
}

- (void)handleModelChange:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXStoryResourcesPreloadingController;
  -[PXStoryController handleModelChange:](&v6, sel_handleModelChange_);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__PXStoryResourcesPreloadingController_handleModelChange___block_invoke;
  v5[3] = &unk_1E5DD33E0;
  v5[4] = self;
  v5[5] = a3;
  [(PXStoryController *)self performChanges:v5];
}

void __58__PXStoryResourcesPreloadingController_handleModelChange___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = *(void *)(a1 + 40);
  if ((v3 & 0x20000000) != 0)
  {
    [*(id *)(a1 + 32) _invalidateCanStartPreloading];
    uint64_t v3 = *(void *)(a1 + 40);
  }
  if ((v3 & 0x20000030) != 0)
  {
    [*(id *)(a1 + 32) _invalidatePreloadingRequest];
    [*(id *)(a1 + 32) _invalidateReadinessStatus];
    uint64_t v3 = *(void *)(a1 + 40);
  }
  if ((v3 & 0x400) != 0 && [*(id *)(a1 + 32) isSongResourcesPreloadingEnabled]) {
    [*(id *)(a1 + 32) _invalidatePreloadingRequest];
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    [*(id *)(a1 + 32) _invalidateCurrentPlaybackTimeOnPreloader];
    uint64_t v4 = *(void *)(a1 + 40);
  }
  if ((v4 & 0x20) != 0) {
    [*(id *)(a1 + 32) _invalidateCurrentSegmentIdentifierOnPreloader];
  }
}

- (void)_updateReadinessStatus
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  [(PXStoryResourcesPreloader *)self->_preloader loadingFractionComplete];
  float v4 = v3;
  id v5 = [(PXStoryResourcesPreloadingController *)self model];
  uint64_t v6 = [v5 options] & 1;

  if (v4 < 1.0) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 3;
  }
  if (v4 < 1.0 && v6 == 0)
  {
    if (-[PXStoryResourcesPreloader isLoadingLikelyToKeepUpWithPlayback](self->_preloader, "isLoadingLikelyToKeepUpWithPlayback")&& (-[PXStoryResourcesPreloader currentRequest](self->_preloader, "currentRequest"), v9 = objc_claimAutoreleasedReturnValue(), char v10 = [v9 timelineAttributes], v9, (v10 & 2) != 0))
    {
      uint64_t v7 = 3;
    }
    else
    {
      uint64_t v7 = [(PXStoryResourcesPreloadingController *)self canStartPreloading];
    }
  }
  v11 = [(PXStoryResourcesPreloadingController *)self model];
  uint64_t v12 = [v11 desiredPlayState];

  if (v12 == 1)
  {
    v13 = [(PXStoryResourcesPreloadingController *)self model];
    uint64_t v14 = [v13 contentReadinessStatus];

    if (v14 != v7)
    {
      if (v7 == 1)
      {
        [(PXStoryResourcesPreloadingController *)self setBufferingEvents:[(PXStoryResourcesPreloadingController *)self bufferingEvents] + 1];
        v15 = [(PXStoryResourcesPreloadingController *)self log];
        os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, self);
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v17 = v16;
          if (os_signpost_enabled(v15))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v40 = [(PXStoryResourcesPreloadingController *)self logContext];
            _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PXStoryResourcesPreloadingController.Buffering", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
          }
        }
LABEL_27:

        goto LABEL_28;
      }
      if (v7 == 3 && v14 == 1)
      {
        v15 = [(PXStoryResourcesPreloadingController *)self log];
        os_signpost_id_t v19 = os_signpost_id_make_with_pointer(v15, self);
        if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v20 = v19;
          if (os_signpost_enabled(v15))
          {
            uint64_t v21 = [(PXStoryResourcesPreloadingController *)self logContext];
            v22 = +[PXNetworkStatusMonitor sharedInstance];
            *(_DWORD *)buf = 134218496;
            uint64_t v40 = v21;
            __int16 v41 = 2050;
            uint64_t v42 = [v22 bestAvailableNetworkType];
            __int16 v43 = 2050;
            int64_t v44 = [(PXStoryResourcesPreloadingController *)self bufferingEvents];
            _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v15, OS_SIGNPOST_INTERVAL_END, v20, "PXStoryResourcesPreloadingController.Buffering", "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES networkType=%{signpost.telemetry:number1,public}lu bufferingEvents=%{signpost.telemetry:number2,public}lu", buf, 0x20u);
          }
        }
        goto LABEL_27;
      }
    }
  }
LABEL_28:
  v23 = [(PXStoryResourcesPreloadingController *)self model];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __62__PXStoryResourcesPreloadingController__updateReadinessStatus__block_invoke;
  v38[3] = &__block_descriptor_40_e31_v16__0___PXStoryMutableModel__8l;
  v38[4] = v7;
  [v23 performChanges:v38];

  v24 = [(PXStoryResourcesPreloader *)self->_preloader error];
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  v32 = __62__PXStoryResourcesPreloadingController__updateReadinessStatus__block_invoke_2;
  v33 = &unk_1E5DD33B0;
  v34 = self;
  BOOL v37 = v4 >= 1.0;
  id v25 = v24;
  id v35 = v25;
  float v36 = v4;
  [(PXStoryController *)self performChanges:&v30];
  v26 = objc_msgSend(v25, "domain", v30, v31, v32, v33, v34);
  if (![v26 isEqualToString:@"PXStoryErrorDomain"])
  {
LABEL_31:

    goto LABEL_32;
  }
  uint64_t v27 = [v25 code];

  if (v27 == 22)
  {
    v26 = [(PXStoryResourcesPreloadingController *)self model];
    [v26 reportNetworkRelatedPlaybackFailure];
    goto LABEL_31;
  }
LABEL_32:
  v28 = [(PXStoryResourcesPreloadingController *)self model];
  v29 = [v28 errorReporter];
  [v29 setError:v25 forComponent:@"Assets preloading"];
}

uint64_t __62__PXStoryResourcesPreloadingController__updateReadinessStatus__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setContentReadinessStatus:*(void *)(a1 + 32)];
}

uint64_t __62__PXStoryResourcesPreloadingController__updateReadinessStatus__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsCompleted:*(unsigned __int8 *)(a1 + 52)];
  [*(id *)(a1 + 32) setError:*(void *)(a1 + 40)];
  LODWORD(v2) = *(_DWORD *)(a1 + 48);
  float v3 = *(void **)(a1 + 32);
  return [v3 setLoadingFractionComplete:v2];
}

- (void)_invalidateReadinessStatus
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateReadinessStatus];
}

- (void)_updateCurrentSegmentIdentifierOnPreloader
{
  preloader = self->_preloader;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __82__PXStoryResourcesPreloadingController__updateCurrentSegmentIdentifierOnPreloader__block_invoke;
  v3[3] = &unk_1E5DD3368;
  v3[4] = self;
  [(PXStoryResourcesPreloader *)preloader performChanges:v3];
}

void __82__PXStoryResourcesPreloadingController__updateCurrentSegmentIdentifierOnPreloader__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 model];
  objc_msgSend(v3, "setCurrentSegmentIdentifier:", objc_msgSend(v4, "currentSegmentIdentifier"));
}

- (void)_invalidateCurrentSegmentIdentifierOnPreloader
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentSegmentIdentifierOnPreloader];
}

- (void)_updateCurrentPlaybackTimeOnPreloader
{
  preloader = self->_preloader;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__PXStoryResourcesPreloadingController__updateCurrentPlaybackTimeOnPreloader__block_invoke;
  v3[3] = &unk_1E5DD3368;
  v3[4] = self;
  [(PXStoryResourcesPreloader *)preloader performChanges:v3];
}

void __77__PXStoryResourcesPreloadingController__updateCurrentPlaybackTimeOnPreloader__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) model];
  id v5 = v4;
  if (v4)
  {
    [v4 nominalPlaybackTime];
  }
  else
  {
    long long v8 = 0uLL;
    uint64_t v9 = 0;
  }
  long long v6 = v8;
  uint64_t v7 = v9;
  [v3 setCurrentPlaybackTime:&v6];
}

- (void)_invalidateCurrentPlaybackTimeOnPreloader
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentPlaybackTimeOnPreloader];
}

- (void)_updatePreloadingRequest
{
  if ([(PXStoryResourcesPreloadingController *)self canStartPreloading])
  {
    id v3 = [(PXStoryResourcesPreloadingController *)self model];
    id v4 = [v3 timeline];
    id v5 = [(PXStoryResourcesPreloadingController *)self model];
    char v6 = [v5 options];

    if (v6)
    {
      uint64_t v9 = [PXStoryResourcesPreloadingRequest alloc];
      uint64_t v10 = [v3 timelineAttributes];
      uint64_t v11 = [v4 firstSegmentIdentifier];
      uint64_t v12 = v9;
      v13 = v4;
      uint64_t v14 = v10;
      BOOL v15 = 0;
      goto LABEL_12;
    }
    uint64_t v7 = [(PXStoryResourcesPreloader *)self->_preloader currentRequest];
    long long v8 = [v7 timeline];
    if (v8 == v4)
    {
      uint64_t v16 = [v3 lastPlaybackTimeChangeSource];

      if (v16 != 2) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    if ([v4 numberOfSegments] >= 1)
    {
      if ([v3 currentSegmentIdentifier]) {
        uint64_t v17 = [v3 currentSegmentIdentifier];
      }
      else {
        uint64_t v17 = [v4 firstSegmentIdentifier];
      }
      uint64_t v18 = v17;
      os_signpost_id_t v19 = [PXStoryResourcesPreloadingRequest alloc];
      uint64_t v20 = [v3 timelineAttributes];
      BOOL v15 = [(PXStoryResourcesPreloadingController *)self shouldSkipInitialSegment];
      uint64_t v12 = v19;
      v13 = v4;
      uint64_t v14 = v20;
      uint64_t v11 = v18;
LABEL_12:
      uint64_t v21 = [(PXStoryResourcesPreloadingRequest *)v12 initWithTimeline:v13 timelineAttributes:v14 startingSegmentIdentifier:v11 shouldIgnoreStartingSegmentIdentifier:v15];
      if (v21)
      {
        if ([(PXStoryResourcesPreloadingController *)self isSongResourcesPreloadingEnabled])
        {
          v22 = [v3 currentSongResource];
          [(PXStoryResourcesPreloadingRequest *)v21 setSongResource:v22];
        }
        preloader = self->_preloader;
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __64__PXStoryResourcesPreloadingController__updatePreloadingRequest__block_invoke;
        v25[3] = &unk_1E5DD3368;
        v26 = v21;
        v24 = v21;
        [(PXStoryResourcesPreloader *)preloader performChanges:v25];
      }
    }
LABEL_16:
  }
}

uint64_t __64__PXStoryResourcesPreloadingController__updatePreloadingRequest__block_invoke(uint64_t a1, void *a2)
{
  return [a2 startProcessingRequest:*(void *)(a1 + 32)];
}

- (void)_invalidatePreloadingRequest
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePreloadingRequest];
}

- (void)_updateCanStartPreloading
{
  if ([(PXStoryResourcesPreloadingController *)self isActive]) {
    BOOL v3 = [(PXStoryResourcesPreloadingController *)self isPreloadingEnabled];
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = [(PXStoryResourcesPreloadingController *)self model];
  char v5 = [v4 options];

  if (v3)
  {
    if (v5) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 1;
    }
    uint64_t v7 = [(PXStoryResourcesPreloadingController *)self model];
    BOOL v3 = ([v7 timelineAttributes] & v6) != 0;
  }
  [(PXStoryResourcesPreloadingController *)self setCanStartPreloading:v3];
}

- (void)_invalidateCanStartPreloading
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCanStartPreloading];
}

- (void)setIsPreloadingEnabled:(BOOL)a3
{
  if (self->_isPreloadingEnabled != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __63__PXStoryResourcesPreloadingController_setIsPreloadingEnabled___block_invoke;
    v3[3] = &unk_1E5DD3340;
    v3[4] = self;
    BOOL v4 = a3;
    [(PXStoryController *)self performChanges:v3];
  }
}

uint64_t __63__PXStoryResourcesPreloadingController_setIsPreloadingEnabled___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 129) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) _invalidateCanStartPreloading];
}

- (unint64_t)isCompletedChangeDescriptor
{
  return 1;
}

- (void)setIsCompleted:(BOOL)a3
{
  if (self->_isCompleted != a3)
  {
    self->_isCompleted = a3;
    [(PXStoryResourcesPreloadingController *)self signalChange:1];
  }
}

- (void)setLoadingFractionComplete:(float)a3
{
}

- (void)setError:(id)a3
{
  uint64_t v7 = (NSError *)a3;
  char v5 = self->_error;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(NSError *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_error, a3);
      [(PXStoryResourcesPreloadingController *)self signalChange:4];
    }
  }
}

- (void)setCanStartPreloading:(BOOL)a3
{
  if (self->_canStartPreloading != a3)
  {
    self->_canStartPreloading = a3;
    [(PXStoryResourcesPreloadingController *)self _invalidatePreloadingRequest];
  }
}

- (void)setShouldSkipInitialSegment:(BOOL)a3
{
  if (self->_shouldSkipInitialSegment != a3)
  {
    self->_shouldSkipInitialSegment = a3;
    [(PXStoryResourcesPreloadingController *)self _invalidatePreloadingRequest];
  }
}

- (void)setIsSongResourcesPreloadingEnabled:(BOOL)a3
{
  if (self->_isSongResourcesPreloadingEnabled != a3)
  {
    self->_isSongResourcesPreloadingEnabled = a3;
    [(PXStoryResourcesPreloadingController *)self _invalidateCanStartPreloading];
  }
}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    [(PXStoryResourcesPreloadingController *)self _invalidateCanStartPreloading];
    [(PXStoryResourcesPreloadingController *)self _invalidateReadinessStatus];
  }
}

- (NSString)diagnosticDescription
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PXStoryResourcesPreloadingController *)self model];
  BOOL v4 = v3;
  if (v3)
  {
    char v5 = [v3 currentAssetCollection];
    memset(&v37, 0, sizeof(v37));
    char v6 = [v4 timeline];
    uint64_t v7 = v6;
    if (v6) {
      [v6 timeRange];
    }
    else {
      memset(&v37, 0, sizeof(v37));
    }

    *(_OWORD *)&time.start.value = *(_OWORD *)&v37.start.value;
    time.start.epoch = v37.start.epoch;
    double Seconds = CMTimeGetSeconds(&time.start);
    CMTimeRange time = v37;
    CMTime duration = v37.duration;
    double v10 = CMTimeGetSeconds(&duration);
    uint64_t v30 = objc_alloc_init(PXStoryDurationFormatter);
    if ([(PXStoryResourcesPreloadingController *)self isActive])
    {
      if ([(PXStoryResourcesPreloadingController *)self isCompleted])
      {
        uint64_t v11 = @"Completed";
      }
      else if ([(PXStoryResourcesPreloadingController *)self isPreloadingEnabled])
      {
        if ([(PXStoryResourcesPreloadingController *)self canStartPreloading]) {
          uint64_t v11 = @"Preloading";
        }
        else {
          uint64_t v11 = @"Waiting";
        }
      }
      else
      {
        uint64_t v11 = @"Paused";
      }
    }
    else
    {
      uint64_t v11 = @"Inactive";
    }
    id v12 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    v13 = +[PXStorySettings sharedInstance];
    int v14 = [v13 simulateSlowResourcesBuffering];

    if (v14) {
      [v12 appendString:@"Simulating slow assets buffering!!!\n"];
    }
    [v12 appendFormat:@"State: %@\n", v11];
    BOOL v15 = PXStoryDisplayAssetCollectionShortTitle(v5);
    uint64_t v16 = [v5 uuid];
    [v12 appendFormat:@"Asset Collection: “%@”, UUID: %@\n", v15, v16];

    [v12 appendString:@"["];
    for (uint64_t i = 0; i != 30; ++i)
    {
      memset(&v36, 0, sizeof(v36));
      CMTimeMakeWithSeconds(&v36, Seconds + v10 * (double)i / 30.0, 600);
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v18 = [(PXStoryResourcesPreloader *)self->_preloader loadedTimeRanges];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v33;
        while (2)
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v33 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v32 + 1) + 8 * j);
            if (v23) {
              [v23 storyTimeRange];
            }
            else {
              memset(&v31, 0, sizeof(v31));
            }
            CMTime duration = v36;
            CMTimeRange time = v31;
            if (CMTimeRangeContainsTime(&time, &duration))
            {
              v24 = @"*";
              goto LABEL_26;
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }
      v24 = @".";
LABEL_26:

      [v12 appendString:v24];
    }
    id v25 = [(PXStoryDurationFormatter *)v30 stringFromTimeInterval:v10];
    [v12 appendFormat:@"] %@\n", v25];

    [v4 playbackFractionCompleted];
    uint64_t v27 = [&stru_1F00B0030 stringByPaddingToLength:(unint64_t)(v26 * 30.0) withString:@" " startingAtIndex:0];
    [v12 appendFormat:@" %@^\n", v27];

    v28 = [(PXStoryResourcesPreloader *)self->_preloader diagnosticDescription];
    [v12 appendFormat:@"%@\n", v28];

    long long v8 = (__CFString *)[v12 copy];
  }
  else
  {
    long long v8 = @"n/a";
  }

  return (NSString *)v8;
}

- (void)configureUpdater:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryResourcesPreloadingController;
  id v3 = a3;
  [(PXStoryController *)&v4 configureUpdater:v3];
  objc_msgSend(v3, "addUpdateSelector:", sel__updateCurrentPlaybackTimeOnPreloader, v4.receiver, v4.super_class);
  [v3 addUpdateSelector:sel__updateCurrentSegmentIdentifierOnPreloader];
  [v3 addUpdateSelector:sel__updateCanStartPreloading];
  [v3 addUpdateSelector:sel__updatePreloadingRequest];
  [v3 addUpdateSelector:sel__updateReadinessStatus];
}

- (void)dealloc
{
  id v3 = self->_preloader;
  objc_super v4 = [(PXStoryController *)self storyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PXStoryResourcesPreloadingController_dealloc__block_invoke;
  block[3] = &unk_1E5DD36F8;
  long long v8 = v3;
  char v5 = v3;
  dispatch_async(v4, block);

  v6.receiver = self;
  v6.super_class = (Class)PXStoryResourcesPreloadingController;
  [(PXStoryResourcesPreloadingController *)&v6 dealloc];
}

uint64_t __47__PXStoryResourcesPreloadingController_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performChanges:&__block_literal_global_302228];
}

uint64_t __47__PXStoryResourcesPreloadingController_dealloc__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 cancelProcessingAllRequests];
}

- (PXStoryResourcesPreloadingController)initWithModel:(id)a3 mediaProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)PXStoryResourcesPreloadingController;
  long long v8 = [(PXStoryController *)&v25 initWithObservableModel:v6];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_model, v6);
    double v10 = [v6 extendedTraitCollection];
    [v10 displayScale];
    double v12 = v11;

    uint64_t v13 = [v6 isExporting];
    uint64_t v14 = [v6 isInline];
    BOOL v15 = [PXStoryResourcesPreloader alloc];
    uint64_t v16 = [v6 videoSessionManager];
    uint64_t v17 = [v6 loadingStatusReporter];
    uint64_t v18 = [(PXStoryController *)v9 storyQueue];
    uint64_t v19 = [(PXStoryResourcesPreloader *)v15 initWithMediaProvider:v7 displayScale:v16 videoSessionManager:v17 loadingStatusReporter:v18 storyQueue:v13 isExporting:v14 isInline:v12];
    preloader = v9->_preloader;
    v9->_preloader = (PXStoryResourcesPreloader *)v19;

    uint64_t v21 = [(PXStoryResourcesPreloadingController *)v9 log];
    [(PXStoryResourcesPreloader *)v9->_preloader setLog:v21];

    [(PXStoryResourcesPreloader *)v9->_preloader setLogContext:[(PXStoryResourcesPreloadingController *)v9 logContext]];
    [(PXStoryResourcesPreloader *)v9->_preloader registerChangeObserver:v9 context:PreloaderObservationContext];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __68__PXStoryResourcesPreloadingController_initWithModel_mediaProvider___block_invoke;
    v23[3] = &unk_1E5DD32F8;
    v24 = v9;
    [(PXStoryController *)v24 performChanges:v23];
  }
  return v9;
}

uint64_t __68__PXStoryResourcesPreloadingController_initWithModel_mediaProvider___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateCurrentPlaybackTimeOnPreloader];
  id v2 = *(void **)(a1 + 32);
  return [v2 _invalidateCurrentSegmentIdentifierOnPreloader];
}

- (PXStoryResourcesPreloadingController)initWithObservableModel:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryResourcesPreloadingController.m", 40, @"%s is not available as initializer", "-[PXStoryResourcesPreloadingController initWithObservableModel:]");

  abort();
}

@end