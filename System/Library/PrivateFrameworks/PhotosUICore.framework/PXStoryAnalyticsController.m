@interface PXStoryAnalyticsController
+ (id)analyticsViewNameForViewMode:(int64_t)a3;
+ (id)memoryPayloadFromStoryModel:(id)a3;
+ (id)stringForAudioAssetCatalog:(int64_t)a3;
+ (id)stringForLaunchType:(id)a3 assetCollection:(id)a4;
+ (void)sendMemoryEvent:(id)a3 model:(id)a4 payload:(id)a5;
- (BOOL)didPlayStory;
- (BOOL)didUserChangePlaybackTime;
- (BOOL)isSessionActive;
- (NSDictionary)commonSpinnerRelatedPayload;
- (NSDictionary)defaultPayload;
- (NSNumber)initialBufferingDuration;
- (NSString)sessionIdentifier;
- (PXStoryAnalyticsController)init;
- (PXStoryAnalyticsController)initWithViewModel:(id)a3;
- (PXStoryModel)currentModel;
- (PXStoryViewModel)viewModel;
- (int64_t)bufferingEventsCount;
- (int64_t)currentViewMode;
- (void)_collectAnalyticsAtPlaybackEnd;
- (void)_collectAnalyticsForBuffering;
- (void)_collectAnalyticsForPlayStateChange;
- (void)_incrementPlayCountForMemory:(id)a3;
- (void)_updateCurrentModel;
- (void)_updateCurrentViewMode;
- (void)_updateDidUserChangePlaybackTime;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setBufferingEventsCount:(int64_t)a3;
- (void)setCurrentModel:(id)a3;
- (void)setCurrentViewMode:(int64_t)a3;
- (void)setDidPlayStory:(BOOL)a3;
- (void)setDidUserChangePlaybackTime:(BOOL)a3;
- (void)setInitialBufferingDuration:(id)a3;
- (void)setIsSessionActive:(BOOL)a3;
- (void)viewDidAppear;
- (void)viewDidDisappear;
@end

@implementation PXStoryAnalyticsController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialBufferingDuration, 0);
  objc_storeStrong((id *)&self->_currentModel, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (void)setInitialBufferingDuration:(id)a3
{
}

- (NSNumber)initialBufferingDuration
{
  return self->_initialBufferingDuration;
}

- (void)setBufferingEventsCount:(int64_t)a3
{
  self->_bufferingEventsCount = a3;
}

- (int64_t)bufferingEventsCount
{
  return self->_bufferingEventsCount;
}

- (void)setDidUserChangePlaybackTime:(BOOL)a3
{
  self->_didUserChangePlaybackTime = a3;
}

- (BOOL)didUserChangePlaybackTime
{
  return self->_didUserChangePlaybackTime;
}

- (void)setDidPlayStory:(BOOL)a3
{
  self->_didPlayStory = a3;
}

- (BOOL)didPlayStory
{
  return self->_didPlayStory;
}

- (int64_t)currentViewMode
{
  return self->_currentViewMode;
}

- (PXStoryModel)currentModel
{
  return self->_currentModel;
}

- (BOOL)isSessionActive
{
  return self->_isSessionActive;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v10 = a3;
  if ((void *)ViewModelObservationContext_279966 != a5)
  {
    if ((void *)CurrentModelObservationContext != a5)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"PXStoryAnalyticsController.m" lineNumber:358 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if ((a4 & 2) != 0)
    {
      [(PXStoryAnalyticsController *)self _collectAnalyticsForPlayStateChange];
      if ((a4 & 0x200000) == 0)
      {
LABEL_5:
        if ((a4 & 0x10000000000000) == 0) {
          goto LABEL_14;
        }
LABEL_13:
        [(PXStoryAnalyticsController *)self _invalidateDidUserChangePlaybackTime];
        goto LABEL_14;
      }
    }
    else if ((a4 & 0x200000) == 0)
    {
      goto LABEL_5;
    }
    [(PXStoryAnalyticsController *)self _collectAnalyticsForBuffering];
    if ((a4 & 0x10000000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if ((a4 & 0x40) != 0) {
    [(PXStoryAnalyticsController *)self _invalidateCurrentModel];
  }
  if ((a4 & 0x2000) != 0) {
    [(PXStoryAnalyticsController *)self _invalidateCurrentViewMode];
  }
LABEL_14:
}

- (void)_updateDidUserChangePlaybackTime
{
  if (![(PXStoryAnalyticsController *)self didUserChangePlaybackTime])
  {
    id v3 = [(PXStoryAnalyticsController *)self currentModel];
    -[PXStoryAnalyticsController setDidUserChangePlaybackTime:](self, "setDidUserChangePlaybackTime:", [v3 lastPlaybackTimeChangeSource] == 2);
  }
}

- (void)_updateCurrentViewMode
{
  if ([(PXStoryAnalyticsController *)self isSessionActive])
  {
    id v3 = [(PXStoryAnalyticsController *)self viewModel];
    -[PXStoryAnalyticsController setCurrentViewMode:](self, "setCurrentViewMode:", [v3 viewMode]);
  }
  else
  {
    [(PXStoryAnalyticsController *)self setCurrentViewMode:0];
  }
}

- (void)_updateCurrentModel
{
  id v3 = [(PXStoryAnalyticsController *)self currentModel];

  if (v3) {
    [(PXStoryAnalyticsController *)self _collectAnalyticsAtPlaybackEnd];
  }
  id v5 = [(PXStoryAnalyticsController *)self viewModel];
  v4 = [v5 mainModel];
  [(PXStoryAnalyticsController *)self setCurrentModel:v4];
}

- (void)_collectAnalyticsAtPlaybackEnd
{
  id v3 = [(PXStoryAnalyticsController *)self viewModel];
  v4 = [(PXStoryAnalyticsController *)self currentModel];
  id v5 = [(PXStoryAnalyticsController *)self commonSpinnerRelatedPayload];
  v6 = (void *)[v5 mutableCopy];

  v7 = NSNumber;
  uint64_t v8 = [(PXStoryAnalyticsController *)self bufferingEventsCount];
  if (v8 <= 1) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v8;
  }
  id v10 = [v7 numberWithInteger:v9 - 1];
  [v6 setObject:v10 forKeyedSubscript:@"midMemorySpinnerCount"];

  v11 = NSNumber;
  v12 = [v3 bufferingController];
  [v12 totalBufferingTimeInterval];
  double v14 = v13;
  v15 = [(PXStoryAnalyticsController *)self initialBufferingDuration];
  [v15 doubleValue];
  v17 = [v11 numberWithDouble:(v14 - v16) * 1000.0];
  [v6 setObject:v17 forKeyedSubscript:@"midMemorySpinnerTotalTime"];

  [(id)objc_opt_class() sendMemoryEvent:@"com.apple.photos.memory.playbackReliability" model:v4 payload:v6];
  [v4 playbackMaxFractionCompleted];
  double v19 = v18;
  [v4 playbackFractionCompleted];
  double v21 = v20;
  v22 = [v4 timeline];
  v23 = v22;
  if (v22)
  {
    [v22 timeRange];
  }
  else
  {
    memset(v45, 0, sizeof(v45));
    long long v44 = 0u;
  }
  CMTime time = *(CMTime *)&v45[1];
  double Seconds = CMTimeGetSeconds(&time);

  v25 = [(PXStoryAnalyticsController *)self defaultPayload];
  v26 = (void *)[v25 mutableCopy];

  if (v19 < 1.0) {
    uint64_t v27 = MEMORY[0x1E4F1CC28];
  }
  else {
    uint64_t v27 = MEMORY[0x1E4F1CC38];
  }
  [v26 setObject:v27 forKeyedSubscript:@"didPlayToEnd"];
  v28 = [NSNumber numberWithDouble:v19 * 100.0];
  [v26 setObject:v28 forKeyedSubscript:@"maxPlaybackPercentage"];

  v29 = [NSNumber numberWithDouble:v19 * Seconds];
  [v26 setObject:v29 forKeyedSubscript:@"maxPlayTime"];

  v30 = [NSNumber numberWithDouble:v21 * Seconds];
  [v26 setObject:v30 forKeyedSubscript:@"playTime"];

  v31 = objc_msgSend(NSNumber, "numberWithBool:", ((unint64_t)objc_msgSend(v3, "chromeItems") >> 15) & 1);
  [v26 setObject:v31 forKeyedSubscript:@"spinnerVisible"];

  [(id)objc_opt_class() sendMemoryEvent:@"com.apple.photos.CPAnalytics.memoryPlayed" model:v4 payload:v26];
  v32 = [v4 timeline];
  uint64_t v33 = [v32 numberOfSegments];
  if (v33 >= 5)
  {
    uint64_t v34 = v33;
    time.value = 0;
    *(void *)&time.timescale = &time;
    time.epoch = 0x2020000000;
    uint64_t v43 = 0;
    if (v32) {
      [v32 timeRange];
    }
    else {
      memset(v41, 0, sizeof(v41));
    }
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __60__PXStoryAnalyticsController__collectAnalyticsAtPlaybackEnd__block_invoke;
    v40[3] = &unk_1E5DCFF38;
    v40[4] = &time;
    [v32 enumerateSegmentsInTimeRange:v41 usingBlock:v40];
    float v35 = (float)*(uint64_t *)(*(void *)&time.timescale + 24) / (float)v34;
    if (v35 >= 0.5)
    {
      if (v35 >= 0.75)
      {
        double v37 = v35;
        if (v37 >= 0.85)
        {
          if (v37 >= 0.95) {
            v36 = @"com.apple.photos.memory.interactiveMemoryTimelinePlayedWith95-100PercentTransitionsOnBar";
          }
          else {
            v36 = @"com.apple.photos.memory.interactiveMemoryTimelinePlayedWith85-94PercentTransitionsOnBar";
          }
        }
        else
        {
          v36 = @"com.apple.photos.memory.interactiveMemoryTimelinePlayedWith75-84PercentTransitionsOnBar";
        }
      }
      else
      {
        v36 = @"com.apple.photos.memory.interactiveMemoryTimelinePlayedWith50-74PercentTransitionsOnBar";
      }
    }
    else
    {
      v36 = @"com.apple.photos.memory.interactiveMemoryTimelinePlayedWith0-49PercentTransitionsOnBar";
    }
    v38 = objc_opt_class();
    v39 = [(PXStoryAnalyticsController *)self defaultPayload];
    [v38 sendMemoryEvent:v36 model:v4 payload:v39];

    _Block_object_dispose(&time, 8);
  }
}

uint64_t __60__PXStoryAnalyticsController__collectAnalyticsAtPlaybackEnd__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 >= 1)
  {
    v4 = (uint64_t *)(a4 + 184);
    do
    {
      uint64_t v5 = *v4;
      v4 += 25;
      if (v5 >= 2) {
        ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
      }
      --a2;
    }
    while (a2);
  }
  return result;
}

- (void)_collectAnalyticsForBuffering
{
  id v40 = [(PXStoryAnalyticsController *)self currentModel];
  uint64_t v3 = [v40 readinessStatus];
  if (v3 == 3)
  {
    uint64_t v5 = [(PXStoryAnalyticsController *)self initialBufferingDuration];

    if (!v5)
    {
      [(PXStoryAnalyticsController *)self setBufferingEventsCount:1];
      v6 = [(PXStoryAnalyticsController *)self viewModel];
      v7 = [v6 bufferingController];

      uint64_t v8 = NSNumber;
      [v7 lastNoncriticalBufferingDuration];
      double v10 = v9;
      [v7 lastCriticalBufferingDuration];
      v12 = [v8 numberWithDouble:v10 + v11];
      [(PXStoryAnalyticsController *)self setInitialBufferingDuration:v12];

      double v13 = [(PXStoryAnalyticsController *)self commonSpinnerRelatedPayload];
      double v14 = (void *)[v13 mutableCopy];

      v15 = NSNumber;
      [v7 lastNoncriticalBufferingDuration];
      v17 = [v15 numberWithDouble:v16 * 1000.0];
      [v14 setObject:v17 forKeyedSubscript:@"loadingDelay"];

      double v18 = NSNumber;
      [v7 lastCriticalBufferingDuration];
      double v20 = [v18 numberWithDouble:v19 * 1000.0];
      [v14 setObject:v20 forKeyedSubscript:@"userVisibleSpinnerLoadingDelay"];

      double v21 = [v7 totalBufferingTimeIntervalsPerReason];
      v22 = NSNumber;
      v23 = [v21 objectForKeyedSubscript:&unk_1F02D9FB8];
      [v23 doubleValue];
      v25 = [v22 numberWithDouble:v24 * 1000.0];
      [v14 setObject:v25 forKeyedSubscript:@"spinnerReasonMusicFetching"];

      v26 = NSNumber;
      uint64_t v27 = [v21 objectForKeyedSubscript:&unk_1F02D9FD0];
      [v27 doubleValue];
      v29 = [v26 numberWithDouble:v28 * 1000.0];
      [v14 setObject:v29 forKeyedSubscript:@"spinnerReasonMusicBuffering"];

      v30 = NSNumber;
      v31 = [v21 objectForKeyedSubscript:&unk_1F02D9FE8];
      [v31 doubleValue];
      uint64_t v33 = [v30 numberWithDouble:v32 * 1000.0];
      [v14 setObject:v33 forKeyedSubscript:@"spinnerReasonAssetsPreloading"];

      uint64_t v34 = NSNumber;
      float v35 = [v21 objectForKeyedSubscript:&unk_1F02DA000];
      [v35 doubleValue];
      double v37 = [v34 numberWithDouble:v36 * 1000.0];
      [v14 setObject:v37 forKeyedSubscript:@"spinnerReasonTimelineCreation"];

      v38 = objc_opt_class();
      v39 = [(PXStoryAnalyticsController *)self currentModel];
      [v38 sendMemoryEvent:@"com.apple.photos.memory.playbackLaunchPerformance" model:v39 payload:v14];
    }
  }
  else if (v3 == 1)
  {
    v4 = [(PXStoryAnalyticsController *)self initialBufferingDuration];

    if (v4) {
      [(PXStoryAnalyticsController *)self setBufferingEventsCount:[(PXStoryAnalyticsController *)self bufferingEventsCount] + 1];
    }
  }
}

- (void)_incrementPlayCountForMemory:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F56658];
  uint64_t v7 = *MEMORY[0x1E4F56548];
  v8[0] = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v3 sendEvent:@"com.apple.photos.CPAnalytics.incrementMemoryViewCount" withPayload:v6];
}

- (void)_collectAnalyticsForPlayStateChange
{
  id v9 = [(PXStoryAnalyticsController *)self currentModel];
  uint64_t v3 = [v9 desiredPlayState];
  if (v3)
  {
    if (v3 != 1)
    {
      id v5 = 0;
      goto LABEL_7;
    }
    v4 = PXStoryAnalyticsEventSessionPlayed;
  }
  else
  {
    v4 = PXStoryAnalyticsEventSessionPaused;
  }
  id v5 = *v4;
LABEL_7:
  v6 = (void *)MEMORY[0x1E4F56658];
  uint64_t v7 = [(PXStoryAnalyticsController *)self defaultPayload];
  [v6 sendEvent:v5 withPayload:v7];

  if (!-[PXStoryAnalyticsController didPlayStory](self, "didPlayStory") && [v9 desiredPlayState] == 1)
  {
    uint64_t v8 = [v9 currentAssetCollection];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(PXStoryAnalyticsController *)self _incrementPlayCountForMemory:v8];
    }
    [(PXStoryAnalyticsController *)self setDidPlayStory:1];
  }
}

- (NSDictionary)commonSpinnerRelatedPayload
{
  uint64_t v3 = [(PXStoryAnalyticsController *)self defaultPayload];
  v4 = (void *)[v3 mutableCopy];

  id v5 = [(PXStoryAnalyticsController *)self currentModel];
  v6 = [v5 currentSongResource];
  uint64_t v7 = objc_msgSend(v6, "px_storyResourceSongAsset");
  [v7 pace];
  uint64_t v8 = PFStoryRecipeSongPaceDescription();
  [v4 setObject:v8 forKeyedSubscript:@"songPace"];

  id v9 = objc_msgSend(NSNumber, "numberWithBool:", -[PXStoryAnalyticsController didUserChangePlaybackTime](self, "didUserChangePlaybackTime"));
  [v4 setObject:v9 forKeyedSubscript:@"userDidInteractiveNavigation"];

  double v10 = (void *)[v4 copy];
  return (NSDictionary *)v10;
}

- (NSDictionary)defaultPayload
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  v4 = [(PXStoryAnalyticsController *)self sessionIdentifier];
  [v3 setObject:v4 forKeyedSubscript:@"interactiveMemorySessionIdentifier"];

  id v5 = [(PXStoryAnalyticsController *)self currentModel];
  v6 = [v5 currentAssetCollection];

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F56548]];
  uint64_t v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F56560]];

  double v10 = (void *)[v3 copy];
  return (NSDictionary *)v10;
}

- (void)setCurrentViewMode:(int64_t)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  int64_t currentViewMode = self->_currentViewMode;
  if (currentViewMode != a3)
  {
    int64_t currentViewModeSignpostID = self->_currentViewModeSignpostID;
    self->_int64_t currentViewMode = a3;
    uint64_t v6 = [(id)objc_opt_class() analyticsViewNameForViewMode:currentViewMode];
    id v7 = (void *)v6;
    uint64_t v8 = (uint64_t *)MEMORY[0x1E4F56560];
    id v9 = (uint64_t *)MEMORY[0x1E4F56598];
    unint64_t v10 = 0x1E4F28000;
    if (v6)
    {
      double v11 = (void *)MEMORY[0x1E4F56658];
      uint64_t v12 = *MEMORY[0x1E4F565C0];
      uint64_t v35 = *MEMORY[0x1E4F56560];
      uint64_t v13 = v35;
      v36[0] = v6;
      double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
      [v11 endSignpost:currentViewModeSignpostID forEventName:v12 withPayload:v14];

      v15 = (void *)MEMORY[0x1E4F56658];
      uint64_t v16 = *MEMORY[0x1E4F56488];
      uint64_t v17 = *v9;
      v33[0] = v13;
      unint64_t v10 = 0x1E4F28000uLL;
      v33[1] = v17;
      v34[0] = v7;
      double v18 = [NSNumber numberWithLongLong:currentViewModeSignpostID];
      v34[1] = v18;
      double v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
      [v15 sendEvent:v16 withPayload:v19];

      uint64_t v8 = (uint64_t *)MEMORY[0x1E4F56560];
    }
    double v20 = [(id)objc_opt_class() analyticsViewNameForViewMode:self->_currentViewMode];
    if (v20)
    {
      int64_t v21 = [MEMORY[0x1E4F56658] startSignpost];
      v22 = (void *)MEMORY[0x1E4F56658];
      v23 = v8;
      uint64_t v24 = *MEMORY[0x1E4F56480];
      uint64_t v25 = *v23;
      uint64_t v26 = *v9;
      v31[0] = v25;
      v31[1] = v26;
      v32[0] = v20;
      uint64_t v27 = [*(id *)(v10 + 3792) numberWithLongLong:v21];
      v32[1] = v27;
      double v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
      [v22 sendEvent:v24 withPayload:v28];
    }
    else
    {
      int64_t v21 = 0;
    }
    self->_int64_t currentViewModeSignpostID = v21;
    if ([(PXStoryAnalyticsController *)self currentViewMode] == 2)
    {
      v29 = objc_opt_class();
      v30 = [(PXStoryAnalyticsController *)self currentModel];
      [v29 sendMemoryEvent:@"com.apple.photos.CPAnalytics.memoryOpened" model:v30 payload:MEMORY[0x1E4F1CC08]];
    }
  }
}

- (void)setCurrentModel:(id)a3
{
  id v5 = (PXStoryModel *)a3;
  currentModel = self->_currentModel;
  if (currentModel != v5)
  {
    id v7 = v5;
    [(PXStoryModel *)currentModel unregisterChangeObserver:self context:CurrentModelObservationContext];
    objc_storeStrong((id *)&self->_currentModel, a3);
    [(PXStoryModel *)self->_currentModel registerChangeObserver:self context:CurrentModelObservationContext];
    [(PXStoryAnalyticsController *)self _invalidateCurrentViewMode];
    [(PXStoryAnalyticsController *)self setDidPlayStory:0];
    [(PXStoryAnalyticsController *)self setBufferingEventsCount:0];
    [(PXStoryAnalyticsController *)self setInitialBufferingDuration:0];
    [(PXStoryAnalyticsController *)self setDidUserChangePlaybackTime:0];
    [(PXStoryAnalyticsController *)self _invalidateDidUserChangePlaybackTime];
    id v5 = v7;
  }
}

- (void)setIsSessionActive:(BOOL)a3
{
  BOOL isSessionActive = self->_isSessionActive;
  if (isSessionActive != a3)
  {
    self->_BOOL isSessionActive = a3;
    [(PXStoryAnalyticsController *)self _invalidateCurrentViewMode];
    id v5 = (void *)MEMORY[0x1E4F56658];
    uint64_t v6 = self->_isSessionActive
       ? @"com.apple.photos.memory.interactiveMemorySessionBegan"
       : @"com.apple.photos.memory.interactiveMemorySessionEnded";
    id v7 = [(PXStoryAnalyticsController *)self defaultPayload];
    [v5 sendEvent:v6 withPayload:v7];

    if (isSessionActive && !self->_isSessionActive)
    {
      [(PXStoryAnalyticsController *)self _collectAnalyticsAtPlaybackEnd];
    }
  }
}

- (void)viewDidDisappear
{
}

- (void)viewDidAppear
{
}

- (PXStoryAnalyticsController)initWithViewModel:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXStoryAnalyticsController;
  uint64_t v6 = [(PXStoryAnalyticsController *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    [(PXStoryViewModel *)v7->_viewModel registerChangeObserver:v7 context:ViewModelObservationContext_279966];
    uint64_t v8 = [(PXStoryViewModel *)v7->_viewModel identifier];
    sessionIdentifier = v7->_sessionIdentifier;
    v7->_sessionIdentifier = (NSString *)v8;

    [(PXStoryAnalyticsController *)v7 _invalidateCurrentModel];
  }

  return v7;
}

- (PXStoryAnalyticsController)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryAnalyticsController.m", 84, @"%s is not available as initializer", "-[PXStoryAnalyticsController init]");

  abort();
}

+ (id)stringForAudioAssetCatalog:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return @"??";
  }
  else {
    return off_1E5DCFF68[a3];
  }
}

+ (id)stringForLaunchType:(id)a3 assetCollection:(id)a4
{
  id v5 = (__CFString *)a3;
  id v6 = a4;
  int v7 = [(__CFString *)v5 isEqualToString:@"Unknown"];
  uint64_t v8 = v5;
  if (v7)
  {
    if ((unint64_t)([v6 assetCollectionType] - 1) >= 2) {
      uint64_t v8 = @"Unknown";
    }
    else {
      uint64_t v8 = @"Albums";
    }
  }
  id v9 = v8;

  return v9;
}

+ (id)memoryPayloadFromStoryModel:(id)a3
{
  id v4 = a3;
  id v5 = [v4 currentAssetCollection];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = [MEMORY[0x1E4F39168] analyticsPayloadForMemory:v5];
    [v6 addEntriesFromDictionary:v7];
  }
  uint64_t v8 = *MEMORY[0x1E4F56540];
  id v9 = [MEMORY[0x1E4F56658] systemPropertyForKey:*MEMORY[0x1E4F56540]];
  [v6 setObject:v9 forKeyedSubscript:v8];

  unint64_t v10 = [v4 currentSongResource];
  objc_super v11 = objc_msgSend(v10, "px_storyResourceSongAsset");
  uint64_t v12 = objc_msgSend(a1, "stringForAudioAssetCatalog:", objc_msgSend(v11, "catalog"));
  [v6 setObject:v12 forKeyedSubscript:@"cpa_memory_songType"];

  uint64_t v13 = [v4 configuration];
  double v14 = [v13 launchType];
  v15 = [a1 stringForLaunchType:v14 assetCollection:v5];
  [v6 setObject:v15 forKeyedSubscript:@"cpa_memory_launchType"];

  if (([v4 timelineAttributes] & 2) != 0)
  {
    uint64_t v16 = NSNumber;
    uint64_t v17 = [v4 timeline];
    double v18 = v17;
    if (v17)
    {
      [v17 timeRange];
    }
    else
    {
      memset(v28, 0, sizeof(v28));
      long long v27 = 0u;
    }
    CMTime time = *(CMTime *)&v28[1];
    double v19 = [v16 numberWithDouble:CMTimeGetSeconds(&time)];
    [v6 setObject:v19 forKeyedSubscript:@"cpa_memory_duration"];
  }
  double v20 = objc_msgSend(v4, "resourcesDataSourceManager", v27, v28[0]);
  int v21 = [v20 isDataSourceFinal];

  if (v21)
  {
    v22 = NSNumber;
    v23 = [v4 resourcesDataSourceManager];
    uint64_t v24 = [v23 dataSource];
    uint64_t v25 = objc_msgSend(v22, "numberWithInteger:", objc_msgSend(v24, "numberOfDisplayAssetResources"));
    [v6 setObject:v25 forKeyedSubscript:@"cpa_memory_assetCount"];
  }
  return v6;
}

+ (void)sendMemoryEvent:(id)a3 model:(id)a4 payload:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = [v9 storyQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__PXStoryAnalyticsController_sendMemoryEvent_model_payload___block_invoke;
  v15[3] = &unk_1E5DD1508;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  id v19 = a1;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(v11, v15);
}

void __60__PXStoryAnalyticsController_sendMemoryEvent_model_payload___block_invoke(uint64_t a1)
{
  id v3 = (id)[*(id *)(a1 + 32) mutableCopy];
  v2 = [*(id *)(a1 + 56) memoryPayloadFromStoryModel:*(void *)(a1 + 40)];
  [v3 addEntriesFromDictionary:v2];

  [MEMORY[0x1E4F56658] sendEvent:*(void *)(a1 + 48) withPayload:v3];
}

+ (id)analyticsViewNameForViewMode:(int64_t)a3
{
  id v3 = @"InteractiveMemoryBrowserGrid";
  if (a3 != 2) {
    id v3 = 0;
  }
  if (a3 == 4) {
    return @"InteractiveMemoryStyleSwitcher";
  }
  else {
    return v3;
  }
}

@end