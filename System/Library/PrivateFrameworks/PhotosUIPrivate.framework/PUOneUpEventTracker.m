@interface PUOneUpEventTracker
- (BOOL)currentlyStreamingVideoDidStartActualPlayback;
- (BOOL)currentlyStreamingVideoIsActuallyPlaying;
- (BOOL)currentlyStreamingVideoIsStalled;
- (BOOL)isSessionActive;
- (OS_dispatch_queue)biomeRequestQueue;
- (PUBrowsingVideoPlayer)currentVideoPlayer;
- (PUBrowsingViewModel)viewModel;
- (PUDisplayAsset)currentVideoAsset;
- (PUDisplayAsset)currentlyPlayingVideoAsset;
- (PUDisplayAsset)currentlyStreamingVideoAsset;
- (PUOneUpEventTracker)initWithViewModel:(id)a3 presentationOrigin:(int64_t)a4;
- (PUOneUpEventTracker)initWithViewName:(id)a3;
- (PXAssetAnalyzer)assetAnalyzer;
- (PXAssetMetadataDonator)assetMetadataDonator;
- (double)currentlyPlayingVideoAssetTimestamp;
- (double)currentlyViewedAssetTimestamp;
- (double)livePhotoFirstPlayWaitDuration;
- (int64_t)currentAssetDisplayIntervalSignpost;
- (int64_t)currentAssetSignpost;
- (int64_t)currentlyPlayingLivePhotoSignpost;
- (int64_t)currentlyPlayingStreamedVideoSignpost;
- (int64_t)currentlyPlayingStreamedVideoStartSignpost;
- (int64_t)currentlyPlayingVideoSignpost;
- (int64_t)currentlyShowingInfoPanelSignpost;
- (int64_t)currentlyStreamingVideoStallsCount;
- (int64_t)currentlyViewedAssetGeneration;
- (int64_t)presentationOrigin;
- (int64_t)sessionSignpost;
- (int64_t)startLoggingTimeInterval;
- (void)_handleLongEnoughViewDurationWithGeneration:(int64_t)a3;
- (void)_incrementAssetViewCountIfNeeded:(id)a3;
- (void)_invalidateCurrentVideoPlayer;
- (void)_invalidateCurrentVideoProperties;
- (void)_invalidateCurrentlyViewedAsset;
- (void)_invalidateIsSessionActive;
- (void)_invalidateOneUpInfoPanelShowingSignpost;
- (void)_logDidEndPlayingVideoAsset:(id)a3 duration:(double)a4;
- (void)_logDidEndSession;
- (void)_logDidStartActualPlaybackOfStreamedVideoAsset:(id)a3;
- (void)_logDidStartPlaybackOfStreamedVideoAsset:(id)a3;
- (void)_logDidStartPlayingVideoAsset:(id)a3;
- (void)_logDidStartSession;
- (void)_logInfoPanelChangeEventsIfNeededWithChange:(id)a3;
- (void)_logWillEndPlaybackOfStreamedVideoAsset:(id)a3;
- (void)_sendMapSelectionEventToBiomeWithAssetUUID:(id)a3;
- (void)_updateCurrentVideoPlayer;
- (void)_updateCurrentVideoProperties;
- (void)_updateCurrentlyViewedAsset;
- (void)_updateIsSessionActive;
- (void)_updateOneUpInfoPanelShowingSignpost;
- (void)endLoggingTimeInterval:(int64_t)a3 event:(id)a4;
- (void)logDidEndViewingMedia:(id)a3 mediaKind:(int64_t)a4 duration:(double)a5;
- (void)logDidStartViewingMedia:(id)a3 mediaKind:(int64_t)a4;
- (void)logInfoPanelClosedBy:(int64_t)a3;
- (void)logInfoPanelOpenedBy:(int64_t)a3;
- (void)logInfoPanelRotatedToHorizontalView;
- (void)logInfoPanelShownAndSwipeToNewAsset;
- (void)logTipPresentedForType:(int64_t)a3;
- (void)logUserDidPlayLivePhoto:(id)a3;
- (void)logUserDidPlayLivePhoto:(id)a3 pressOnSubject:(BOOL)a4;
- (void)logUserWillPlayLivePhoto:(id)a3;
- (void)logUserWillPlayLivePhoto:(id)a3 firstTimeWaitDuration:(double)a4;
- (void)logViewControllerDidAppear:(id)a3;
- (void)logVitalityDidEndForLivePhoto:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setBiomeRequestQueue:(id)a3;
- (void)setCurrentAssetDisplayIntervalSignpost:(int64_t)a3;
- (void)setCurrentAssetSignpost:(int64_t)a3;
- (void)setCurrentVideoPlayer:(id)a3;
- (void)setCurrentlyPlayingLivePhotoSignpost:(int64_t)a3;
- (void)setCurrentlyPlayingStreamedVideoSignpost:(int64_t)a3;
- (void)setCurrentlyPlayingStreamedVideoStartSignpost:(int64_t)a3;
- (void)setCurrentlyPlayingVideoAsset:(id)a3;
- (void)setCurrentlyPlayingVideoSignpost:(int64_t)a3;
- (void)setCurrentlyShowingInfoPanelSignpost:(int64_t)a3;
- (void)setCurrentlyStreamingVideoAsset:(id)a3;
- (void)setCurrentlyStreamingVideoDidStartActualPlayback:(BOOL)a3;
- (void)setCurrentlyStreamingVideoIsActuallyPlaying:(BOOL)a3;
- (void)setCurrentlyStreamingVideoIsStalled:(BOOL)a3;
- (void)setCurrentlyStreamingVideoStallsCount:(int64_t)a3;
- (void)setDisplayedAsset:(id)a3;
- (void)setIsSessionActive:(BOOL)a3;
- (void)setLivePhotoFirstPlayWaitDuration:(double)a3;
- (void)setSessionSignpost:(int64_t)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUOneUpEventTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeRequestQueue, 0);
  objc_storeStrong((id *)&self->_currentlyStreamingVideoAsset, 0);
  objc_storeStrong((id *)&self->_currentlyPlayingVideoAsset, 0);
  objc_storeStrong((id *)&self->_currentVideoAsset, 0);
  objc_storeStrong((id *)&self->_currentVideoPlayer, 0);
  objc_storeStrong((id *)&self->_assetMetadataDonator, 0);
  objc_storeStrong((id *)&self->_assetAnalyzer, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (void)setBiomeRequestQueue:(id)a3
{
}

- (OS_dispatch_queue)biomeRequestQueue
{
  return self->_biomeRequestQueue;
}

- (void)setCurrentlyShowingInfoPanelSignpost:(int64_t)a3
{
  self->_currentlyShowingInfoPanelSignpost = a3;
}

- (int64_t)currentlyShowingInfoPanelSignpost
{
  return self->_currentlyShowingInfoPanelSignpost;
}

- (void)setCurrentlyPlayingStreamedVideoStartSignpost:(int64_t)a3
{
  self->_currentlyPlayingStreamedVideoStartSignpost = a3;
}

- (int64_t)currentlyPlayingStreamedVideoStartSignpost
{
  return self->_currentlyPlayingStreamedVideoStartSignpost;
}

- (void)setCurrentlyPlayingStreamedVideoSignpost:(int64_t)a3
{
  self->_currentlyPlayingStreamedVideoSignpost = a3;
}

- (int64_t)currentlyPlayingStreamedVideoSignpost
{
  return self->_currentlyPlayingStreamedVideoSignpost;
}

- (void)setCurrentlyPlayingVideoSignpost:(int64_t)a3
{
  self->_currentlyPlayingVideoSignpost = a3;
}

- (int64_t)currentlyPlayingVideoSignpost
{
  return self->_currentlyPlayingVideoSignpost;
}

- (void)setCurrentlyPlayingLivePhotoSignpost:(int64_t)a3
{
  self->_currentlyPlayingLivePhotoSignpost = a3;
}

- (int64_t)currentlyPlayingLivePhotoSignpost
{
  return self->_currentlyPlayingLivePhotoSignpost;
}

- (void)setLivePhotoFirstPlayWaitDuration:(double)a3
{
  self->_livePhotoFirstPlayWaitDuration = a3;
}

- (double)livePhotoFirstPlayWaitDuration
{
  return self->_livePhotoFirstPlayWaitDuration;
}

- (void)setCurrentlyStreamingVideoDidStartActualPlayback:(BOOL)a3
{
  self->_currentlyStreamingVideoDidStartActualPlayback = a3;
}

- (BOOL)currentlyStreamingVideoDidStartActualPlayback
{
  return self->_currentlyStreamingVideoDidStartActualPlayback;
}

- (void)setCurrentlyStreamingVideoStallsCount:(int64_t)a3
{
  self->_currentlyStreamingVideoStallsCount = a3;
}

- (int64_t)currentlyStreamingVideoStallsCount
{
  return self->_currentlyStreamingVideoStallsCount;
}

- (BOOL)currentlyStreamingVideoIsStalled
{
  return self->_currentlyStreamingVideoIsStalled;
}

- (BOOL)currentlyStreamingVideoIsActuallyPlaying
{
  return self->_currentlyStreamingVideoIsActuallyPlaying;
}

- (PUDisplayAsset)currentlyStreamingVideoAsset
{
  return self->_currentlyStreamingVideoAsset;
}

- (double)currentlyPlayingVideoAssetTimestamp
{
  return self->_currentlyPlayingVideoAssetTimestamp;
}

- (PUDisplayAsset)currentlyPlayingVideoAsset
{
  return self->_currentlyPlayingVideoAsset;
}

- (PUDisplayAsset)currentVideoAsset
{
  return self->_currentVideoAsset;
}

- (PUBrowsingVideoPlayer)currentVideoPlayer
{
  return self->_currentVideoPlayer;
}

- (PXAssetMetadataDonator)assetMetadataDonator
{
  return self->_assetMetadataDonator;
}

- (PXAssetAnalyzer)assetAnalyzer
{
  return self->_assetAnalyzer;
}

- (void)setCurrentAssetDisplayIntervalSignpost:(int64_t)a3
{
  self->_currentAssetDisplayIntervalSignpost = a3;
}

- (int64_t)currentAssetDisplayIntervalSignpost
{
  return self->_currentAssetDisplayIntervalSignpost;
}

- (void)setCurrentAssetSignpost:(int64_t)a3
{
  self->_currentAssetSignpost = a3;
}

- (int64_t)currentAssetSignpost
{
  return self->_currentAssetSignpost;
}

- (int64_t)currentlyViewedAssetGeneration
{
  return self->_currentlyViewedAssetGeneration;
}

- (double)currentlyViewedAssetTimestamp
{
  return self->_currentlyViewedAssetTimestamp;
}

- (void)setSessionSignpost:(int64_t)a3
{
  self->_sessionSignpost = a3;
}

- (int64_t)sessionSignpost
{
  return self->_sessionSignpost;
}

- (BOOL)isSessionActive
{
  return self->_isSessionActive;
}

- (int64_t)presentationOrigin
{
  return self->_presentationOrigin;
}

- (PUBrowsingViewModel)viewModel
{
  return self->_viewModel;
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(PUOneUpEventTracker *)self viewModel];

  if (v9 == v7)
  {
    id v15 = v8;
    if ([v15 browsingSpeedRegimeDidChange]) {
      char v12 = 1;
    }
    else {
      char v12 = [v15 currentAssetDidChange];
    }
    char v13 = [v15 videoPlayerDidChange];
    [(PUOneUpEventTracker *)self _logInfoPanelChangeEventsIfNeededWithChange:v15];
    int v14 = 0;
  }
  else
  {
    id v10 = [(PUOneUpEventTracker *)self currentVideoPlayer];

    if (v10 != v7)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, self, @"PUOneUpEventTracker.m", 718, @"unexpected view model %@", v7 object file lineNumber description];

      abort();
    }
    id v11 = v8;
    if (([v11 desiredPlayStateDidChange] & 1) != 0
      || ([v11 playerItemDidChange] & 1) != 0
      || ([v11 playStateDidChange] & 1) != 0)
    {

      char v12 = 0;
      char v13 = 0;
      LOBYTE(v14) = 1;
LABEL_7:
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __43__PUOneUpEventTracker_viewModel_didChange___block_invoke;
      v17[3] = &unk_1E5F2B2E0;
      char v18 = v12;
      v17[4] = self;
      char v19 = v13;
      char v20 = v14;
      [(PUOneUpEventTracker *)self performChanges:v17];
      goto LABEL_15;
    }
    int v14 = [v11 isStalledDidChange];
    char v13 = 0;
    char v12 = 0;
  }

  if ((v12 & 1) != 0 || (v13 & 1) != 0 || v14) {
    goto LABEL_7;
  }
LABEL_15:
}

void __43__PUOneUpEventTracker_viewModel_didChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) _invalidateCurrentlyViewedAsset];
  }
  if (*(unsigned char *)(a1 + 41)) {
    [*(id *)(a1 + 32) _invalidateCurrentVideoPlayer];
  }
  if (*(unsigned char *)(a1 + 42)) {
    [*(id *)(a1 + 32) _invalidateCurrentVideoProperties];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((void *)EventTrackerObservationContext == a5)
  {
    if ((a4 & 8) != 0)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __52__PUOneUpEventTracker_observable_didChange_context___block_invoke;
      v9[3] = &unk_1E5F2B2B8;
      v9[4] = self;
      unsigned __int32 v10 = vdup_n_s8((a4 & 8) >> 3).u32[0];
      [(PUOneUpEventTracker *)self performChanges:v9];
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PUOneUpEventTracker;
    [(PXMediaViewControllerEventTracker *)&v11 observable:v8 didChange:a4 context:a5];
  }
}

void __52__PUOneUpEventTracker_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) _invalidateIsSessionActive];
  }
  if (*(unsigned char *)(a1 + 41)) {
    [*(id *)(a1 + 32) _invalidateCurrentlyViewedAsset];
  }
  if (*(unsigned char *)(a1 + 42)) {
    [*(id *)(a1 + 32) _invalidateCurrentVideoPlayer];
  }
  if (*(unsigned char *)(a1 + 43)) {
    [*(id *)(a1 + 32) _invalidateOneUpInfoPanelShowingSignpost];
  }
}

- (void)_logInfoPanelChangeEventsIfNeededWithChange:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PUOneUpEventTracker *)self viewModel];
  v6 = [v5 currentAssetReference];
  id v7 = [v4 assetViewModelChangesByAssetReference];
  id v8 = [v7 objectForKeyedSubscript:v6];
  id v9 = [v5 assetViewModelForCurrentAssetReference];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    v17 = v6;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v10);
        }
        if ([*(id *)(*((void *)&v18 + 1) + 8 * i) accessoryViewVisibilityChanged])
        {
          unint64_t v16 = [v9 lastAccessoryViewVisibilityChangeReason] - 1;
          if (v16 <= 4 && ((0x17u >> v16) & 1) != 0) {
            uint64_t v13 = qword_1AEFF8498[v16];
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);

    v6 = v17;
    if (v13)
    {
      if ([v9 isAccessoryViewVisible]) {
        [(PUOneUpEventTracker *)self logInfoPanelOpenedBy:v13];
      }
      else {
        [(PUOneUpEventTracker *)self logInfoPanelClosedBy:v13];
      }
    }
  }
  else
  {
  }
}

- (void)logInfoPanelClosedBy:(int64_t)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  int64_t v5 = [(PUOneUpEventTracker *)self currentlyShowingInfoPanelSignpost];
  v6 = (uint64_t *)MEMORY[0x1E4F56560];
  if (v5)
  {
    id v7 = (void *)MEMORY[0x1E4F56658];
    int64_t v8 = [(PUOneUpEventTracker *)self currentlyShowingInfoPanelSignpost];
    uint64_t v9 = *MEMORY[0x1E4F56440];
    uint64_t v10 = *v6;
    v18[0] = *MEMORY[0x1E4F56580];
    v18[1] = v10;
    v19[0] = @"com.apple.photos.CPAnalytics.infoPanelViewingDuration";
    uint64_t v11 = [(PXMediaViewControllerEventTracker *)self viewName];
    v19[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    [v7 endSignpost:v8 forEventName:v9 withPayload:v12];

    [(PUOneUpEventTracker *)self setCurrentlyShowingInfoPanelSignpost:0];
  }
  if (a3 == 2)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F56658];
    v16[0] = *v6;
    uint64_t v14 = [(PXMediaViewControllerEventTracker *)self viewName];
    v16[1] = @"tapToOpen";
    v17[0] = v14;
    v17[1] = MEMORY[0x1E4F1CC28];
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    [v13 sendEvent:@"com.apple.photos.CPAnalytics.oneUpAccessoryViewTapped" withPayload:v15];
  }
}

- (void)logInfoPanelOpenedBy:(int64_t)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (![(PUOneUpEventTracker *)self currentlyShowingInfoPanelSignpost])
  {
    -[PUOneUpEventTracker setCurrentlyShowingInfoPanelSignpost:](self, "setCurrentlyShowingInfoPanelSignpost:", [MEMORY[0x1E4F56658] startSignpost]);
    int64_t v5 = (void *)MEMORY[0x1E4F56658];
    uint64_t v6 = *MEMORY[0x1E4F56560];
    uint64_t v22 = *MEMORY[0x1E4F56560];
    id v7 = [(PXMediaViewControllerEventTracker *)self viewName];
    v23[0] = v7;
    int64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    [v5 sendEvent:@"com.apple.photos.CPAnalytics.infoPanelViewed" withPayload:v8];

    uint64_t v9 = [(PUOneUpEventTracker *)self viewModel];
    uint64_t v10 = [v9 assetViewModelForCurrentAssetReference];

    uint64_t v11 = [v10 visualImageAnalysis];
    uint64_t v12 = [v11 hasVisualSearchResults];

    if (a3 == 2)
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F56658];
      v18[0] = v6;
      uint64_t v14 = [(PXMediaViewControllerEventTracker *)self viewName];
      v19[0] = v14;
      v18[1] = @"hasVisualSearchResults";
      id v15 = [NSNumber numberWithBool:v12];
      void v18[2] = @"tapToOpen";
      v19[1] = v15;
      v19[2] = MEMORY[0x1E4F1CC38];
      unint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
      v17 = @"com.apple.photos.CPAnalytics.oneUpAccessoryViewTapped";
    }
    else
    {
      if (a3 != 1)
      {
LABEL_7:

        return;
      }
      uint64_t v13 = (void *)MEMORY[0x1E4F56658];
      v20[0] = v6;
      uint64_t v14 = [(PXMediaViewControllerEventTracker *)self viewName];
      v20[1] = @"hasVisualSearchResults";
      v21[0] = v14;
      id v15 = [NSNumber numberWithBool:v12];
      v21[1] = v15;
      unint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
      v17 = @"com.apple.photos.CPAnalytics.oneUpAccessoryViewSwipedUp";
    }
    [v13 sendEvent:v17 withPayload:v16];

    goto LABEL_7;
  }
}

- (void)logTipPresentedForType:(int64_t)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 1) <= 3)
  {
    id v4 = off_1E5F2B300[a3 - 1];
    int64_t v5 = [(PUOneUpEventTracker *)self viewModel];
    uint64_t v6 = [v5 assetViewModelForCurrentAssetReference];
    id v7 = [v6 asset];

    int64_t v8 = (void *)MEMORY[0x1E4F56658];
    uint64_t v9 = *MEMORY[0x1E4F56558];
    v14[0] = v7;
    uint64_t v10 = *MEMORY[0x1E4F56560];
    v13[0] = v9;
    v13[1] = v10;
    uint64_t v11 = [(PXMediaViewControllerEventTracker *)self viewName];
    v14[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    [v8 sendEvent:v4 withPayload:v12];
  }
}

- (void)logInfoPanelShownAndSwipeToNewAsset
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(PUOneUpEventTracker *)self viewModel];
  id v4 = [v3 assetBeforeLastViewedAssetReference];
  int64_t v5 = [v3 trailingAssetReference];
  BOOL v6 = v4 == v5;

  id v7 = (void *)MEMORY[0x1E4F56658];
  v11[0] = *MEMORY[0x1E4F56560];
  int64_t v8 = [(PXMediaViewControllerEventTracker *)self viewName];
  v11[1] = @"swipeToPreviousAsset";
  v12[0] = v8;
  uint64_t v9 = [NSNumber numberWithBool:v6];
  v12[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  [v7 sendEvent:@"com.apple.photos.CPAnalytics.infoPanelSwipedToNewPhoto" withPayload:v10];
}

- (void)endLoggingTimeInterval:(int64_t)a3 event:(id)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  BOOL v6 = (void *)MEMORY[0x1E4F56658];
  uint64_t v7 = *MEMORY[0x1E4F56440];
  uint64_t v8 = *MEMORY[0x1E4F56580];
  v14[0] = a4;
  uint64_t v9 = *MEMORY[0x1E4F56560];
  v13[0] = v8;
  v13[1] = v9;
  id v10 = a4;
  uint64_t v11 = [(PXMediaViewControllerEventTracker *)self viewName];
  v14[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  [v6 endSignpost:a3 forEventName:v7 withPayload:v12];
}

- (int64_t)startLoggingTimeInterval
{
  return [MEMORY[0x1E4F56658] startSignpost];
}

- (void)logInfoPanelRotatedToHorizontalView
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F56658];
  uint64_t v5 = *MEMORY[0x1E4F56560];
  id v3 = [(PXMediaViewControllerEventTracker *)self viewName];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v2 sendEvent:@"com.apple.photos.CPAnalytics.infoPanelRotatedToHorizontalView" withPayload:v4];
}

- (void)_sendMapSelectionEventToBiomeWithAssetUUID:(id)a3
{
  id v4 = a3;
  biomeRequestQueue = self->_biomeRequestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PUOneUpEventTracker__sendMapSelectionEventToBiomeWithAssetUUID___block_invoke;
  block[3] = &unk_1E5F2ED10;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(biomeRequestQueue, block);
}

void __66__PUOneUpEventTracker__sendMapSelectionEventToBiomeWithAssetUUID___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];

  if (v3)
  {
    id v4 = BiomeLibrary();
    uint64_t v5 = [v4 Photos];
    id v6 = [v5 Map];

    uint64_t v7 = [v6 source];
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F4FF68]) initWithIdentifier:*(void *)(a1 + 32) subset:v3 type:1];
    [v7 sendEvent:v8];
    uint64_t v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138412290;
      uint64_t v12 = v10;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_INFO, "[PXOneUpPresentationOriginPlacesAlbum] Sent photos-map-selection event to Biome Stream with asset uuid: %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)logViewControllerDidAppear:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PUOneUpEventTracker;
  [(PXViewControllerEventTracker *)&v17 logViewControllerDidAppear:v4];
  uint64_t v5 = [(PXViewControllerEventTracker *)self currentViewController];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(PXViewControllerEventTracker *)self currentViewController];

    if (v7 != v4)
    {
      id v8 = PXAssertGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        unint64_t v16 = [(PXViewControllerEventTracker *)self currentViewController];
        *(_DWORD *)buf = 138412546;
        id v19 = v4;
        __int16 v20 = 2112;
        long long v21 = v16;
        _os_log_error_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_ERROR, "viewController %@ appeared with unexpected currentViewController %@", buf, 0x16u);
      }
    }
  }
  if ([(PUOneUpEventTracker *)self presentationOrigin] == 7)
  {
    uint64_t v9 = [(PXMediaViewControllerEventTracker *)self viewName];
    if (!v9)
    {
LABEL_15:

      goto LABEL_16;
    }
    uint64_t v10 = [(PUOneUpEventTracker *)self viewModel];
    int v11 = [v10 currentAssetReference];
    uint64_t v12 = [v11 asset];

    id v13 = v12;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      id v14 = v13;

      if (!v14)
      {
LABEL_14:

        goto LABEL_15;
      }
      id v15 = [v14 uuid];
      [(PUOneUpEventTracker *)self _sendMapSelectionEventToBiomeWithAssetUUID:v15];
    }
    else
    {
      id v14 = 0;
      id v15 = v13;
    }

    goto LABEL_14;
  }
LABEL_16:
}

- (void)_logWillEndPlaybackOfStreamedVideoAsset:(id)a3
{
  void v23[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    objc_super v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PUOneUpEventTracker.m", 442, @"Invalid parameter not satisfying: %@", @"asset != nil" object file lineNumber description];
  }
  id v6 = (void *)MEMORY[0x1E4F56658];
  int64_t v7 = [(PUOneUpEventTracker *)self currentlyPlayingStreamedVideoSignpost];
  uint64_t v8 = *MEMORY[0x1E4F56440];
  uint64_t v9 = *MEMORY[0x1E4F56558];
  v22[0] = *MEMORY[0x1E4F56580];
  v22[1] = v9;
  v23[0] = @"com.apple.photos.CPAnalytics.oneUpStreamedVideoPlayed";
  v23[1] = v5;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  [v6 endSignpost:v7 forEventName:v8 withPayload:v10];

  [(PUOneUpEventTracker *)self setCurrentlyPlayingStreamedVideoSignpost:0];
  int v11 = (void *)MEMORY[0x1E4F56658];
  uint64_t v20 = v9;
  id v21 = v5;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  [v11 sendEvent:@"com.apple.photos.CPAnalytics.oneUpStreamedVideoPlayed" withPayload:v12];

  if (![(PUOneUpEventTracker *)self currentlyStreamingVideoDidStartActualPlayback])
  {
    unint64_t v16 = (void *)MEMORY[0x1E4F56658];
    uint64_t v18 = v9;
    id v19 = v5;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    [v16 sendEvent:@"com.apple.photos.CPAnalytics.oneUpStreamedVideoPlaybackCancelled" withPayload:v14];
    goto LABEL_7;
  }
  uint64_t v13 = [(PUOneUpEventTracker *)self currentlyStreamingVideoStallsCount];
  if (v13 >= 1)
  {
    id v14 = objc_msgSend(MEMORY[0x1E4F56658], "bucketNameForInteger:bucketLimits:", v13, 1, 2, 3, 5, 10, 0);
    id v15 = (void *)[[NSString alloc] initWithFormat:@"com.apple.photos.CPAnalytics.oneUpStreamedVideoPlaybackStalled%@Times", v14];
    [MEMORY[0x1E4F56658] sendEvent:v15 withPayload:MEMORY[0x1E4F1CC08]];

LABEL_7:
  }
}

- (void)_logDidStartActualPlaybackOfStreamedVideoAsset:(id)a3
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    int v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PUOneUpEventTracker.m", 433, @"Invalid parameter not satisfying: %@", @"asset != nil" object file lineNumber description];
  }
  id v6 = (void *)MEMORY[0x1E4F56658];
  int64_t v7 = [(PUOneUpEventTracker *)self currentlyPlayingStreamedVideoStartSignpost];
  uint64_t v8 = *MEMORY[0x1E4F56440];
  uint64_t v9 = *MEMORY[0x1E4F56558];
  v12[0] = *MEMORY[0x1E4F56580];
  v12[1] = v9;
  v13[0] = @"com.apple.photos.CPAnalytics.oneUpStreamedVideoPlaybackLatency";
  v13[1] = v5;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v6 endSignpost:v7 forEventName:v8 withPayload:v10];

  [(PUOneUpEventTracker *)self setCurrentlyPlayingStreamedVideoStartSignpost:0];
}

- (void)_logDidStartPlaybackOfStreamedVideoAsset:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    int64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PUOneUpEventTracker.m", 426, @"Invalid parameter not satisfying: %@", @"asset != nil" object file lineNumber description];
  }
  if ([(PUOneUpEventTracker *)self currentlyPlayingStreamedVideoSignpost])
  {
    id v6 = PXAssertGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_error_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Streamed video %@ did start playing before previous video did end playing", buf, 0xCu);
    }
  }
  -[PUOneUpEventTracker setCurrentlyPlayingStreamedVideoSignpost:](self, "setCurrentlyPlayingStreamedVideoSignpost:", [MEMORY[0x1E4F56658] startSignpost]);
  -[PUOneUpEventTracker setCurrentlyPlayingStreamedVideoStartSignpost:](self, "setCurrentlyPlayingStreamedVideoStartSignpost:", [MEMORY[0x1E4F56658] startSignpost]);
}

- (void)_logDidEndPlayingVideoAsset:(id)a3 duration:(double)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUOneUpEventTracker.m", 408, @"Invalid parameter not satisfying: %@", @"asset != nil" object file lineNumber description];
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F56658];
  int64_t v9 = [(PUOneUpEventTracker *)self currentlyPlayingVideoSignpost];
  uint64_t v10 = *MEMORY[0x1E4F56440];
  uint64_t v11 = *MEMORY[0x1E4F56558];
  v18[0] = *MEMORY[0x1E4F56580];
  v18[1] = v11;
  v19[0] = @"com.apple.photos.CPAnalytics.oneUpVideoPlayed";
  v19[1] = v7;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  [v8 endSignpost:v9 forEventName:v10 withPayload:v12];

  [(PUOneUpEventTracker *)self setCurrentlyPlayingVideoSignpost:0];
  uint64_t v13 = (void *)MEMORY[0x1E4F56658];
  uint64_t v16 = v11;
  id v17 = v7;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  [v13 sendEvent:@"com.apple.photos.CPAnalytics.oneUpVideoPlayed" withPayload:v14];

  if (a4 >= 0.5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(PUOneUpEventTracker *)self _incrementAssetViewCountIfNeeded:v7];
    }
  }
}

- (void)_logDidStartPlayingVideoAsset:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PUOneUpEventTracker.m", 402, @"Invalid parameter not satisfying: %@", @"asset != nil" object file lineNumber description];
  }
  if ([(PUOneUpEventTracker *)self currentlyPlayingVideoSignpost])
  {
    id v6 = PXAssertGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_error_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Video %@ did start playing before previous video did end playing", buf, 0xCu);
    }
  }
  -[PUOneUpEventTracker setCurrentlyPlayingVideoSignpost:](self, "setCurrentlyPlayingVideoSignpost:", [MEMORY[0x1E4F56658] startSignpost]);
}

- (void)logVitalityDidEndForLivePhoto:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PUOneUpEventTracker.m", 395, @"Invalid parameter not satisfying: %@", @"asset != nil" object file lineNumber description];
  }
  id v6 = (void *)MEMORY[0x1E4F56658];
  uint64_t v9 = *MEMORY[0x1E4F56558];
  v10[0] = v5;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v6 sendEvent:@"com.apple.photos.CPAnalytics.oneUpLivePhotoVitalityPlayed" withPayload:v7];
}

- (void)logUserDidPlayLivePhoto:(id)a3 pressOnSubject:(BOOL)a4
{
  BOOL v4 = a4;
  void v21[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PUOneUpEventTracker.m", 378, @"Invalid parameter not satisfying: %@", @"asset != nil" object file lineNumber description];
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F56658];
  int64_t v9 = [(PUOneUpEventTracker *)self currentlyPlayingLivePhotoSignpost];
  uint64_t v10 = *MEMORY[0x1E4F56440];
  uint64_t v11 = *MEMORY[0x1E4F56558];
  v20[0] = *MEMORY[0x1E4F56580];
  v20[1] = v11;
  v21[0] = @"com.apple.photos.CPAnalytics.oneUpLivePhotoPlayed";
  v21[1] = v7;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  [v8 endSignpost:v9 forEventName:v10 withPayload:v12];

  [(PUOneUpEventTracker *)self setCurrentlyPlayingLivePhotoSignpost:0];
  [(PUOneUpEventTracker *)self livePhotoFirstPlayWaitDuration];
  double v14 = v13;
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v16 = v7;
  }
  else {
    id v16 = 0;
  }
  [v15 setObject:v16 forKeyedSubscript:v11];
  id v17 = [NSNumber numberWithBool:v4];
  [v15 setObject:v17 forKeyedSubscript:@"pressOnSubject"];

  if (v14 <= 0.0 || v14 >= 120.0)
  {
    [v15 setObject:0 forKeyedSubscript:@"firstPlayWaitDuration"];
  }
  else
  {
    uint64_t v18 = [NSNumber numberWithDouble:v14];
    [v15 setObject:v18 forKeyedSubscript:@"firstPlayWaitDuration"];
  }
  [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.oneUpLivePhotoPlayed" withPayload:v15];
}

- (void)logUserDidPlayLivePhoto:(id)a3
{
}

- (void)logUserWillPlayLivePhoto:(id)a3 firstTimeWaitDuration:(double)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    int64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PUOneUpEventTracker.m", 366, @"Invalid parameter not satisfying: %@", @"asset != nil" object file lineNumber description];
  }
  if ([(PUOneUpEventTracker *)self currentlyPlayingLivePhotoSignpost])
  {
    uint64_t v8 = PXAssertGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v7;
      _os_log_error_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_ERROR, "Live Photo %@ will start playing before previous Live Photo did end playing", buf, 0xCu);
    }
  }
  -[PUOneUpEventTracker setCurrentlyPlayingLivePhotoSignpost:](self, "setCurrentlyPlayingLivePhotoSignpost:", [MEMORY[0x1E4F56658] startSignpost]);
  [(PUOneUpEventTracker *)self setLivePhotoFirstPlayWaitDuration:a4];
}

- (void)logUserWillPlayLivePhoto:(id)a3
{
}

- (void)_handleLongEnoughViewDurationWithGeneration:(int64_t)a3
{
  if (self->_currentlyViewedAssetGeneration == a3)
  {
    int64_t v9 = [(PXMediaViewControllerEventTracker *)self displayedAsset];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v5 = v9;
    if (isKindOfClass)
    {
      id v6 = v9;
      if (([v6 needsDeferredProcessing] & 1) == 0)
      {
        id v7 = [(PUOneUpEventTracker *)self assetAnalyzer];
        [v7 analyzeAsset:v6 forWorkerType:0];
      }
      uint64_t v8 = [(PUOneUpEventTracker *)self assetMetadataDonator];
      [v8 donateMetadataForAsset:v6];

      id v5 = v9;
    }
  }
}

- (void)_logDidEndSession
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F56658];
  int64_t v4 = [(PUOneUpEventTracker *)self sessionSignpost];
  uint64_t v5 = *MEMORY[0x1E4F56440];
  uint64_t v8 = *MEMORY[0x1E4F56580];
  v9[0] = @"com.apple.photos.CPAnalytics.oneUpBrowserDisplayed";
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v7 = [(PXUserInterfaceElementEventTracker *)self finalPayloadWithPayload:v6];
  [v3 endSignpost:v4 forEventName:v5 withPayload:v7];

  [(PUOneUpEventTracker *)self setSessionSignpost:0];
}

- (void)_logDidStartSession
{
  if ([(PUOneUpEventTracker *)self sessionSignpost])
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"PUOneUpEventTracker.m", 333, @"Invalid parameter not satisfying: %@", @"self.sessionSignpost == CPAnalyticsSignpostIDNull" object file lineNumber description];
  }
  uint64_t v4 = [MEMORY[0x1E4F56658] startSignpost];
  [(PUOneUpEventTracker *)self setSessionSignpost:v4];
}

- (void)_incrementAssetViewCountIfNeeded:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PUOneUpEventTracker *)self viewModel];
  id v6 = [v5 currentAssetReference];
  id v7 = [v6 assetCollection];

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if ((objc_msgSend(v8, "px_isRecentlyViewedCollection") & 1) == 0)
  {
    int64_t v9 = (void *)MEMORY[0x1E4F56658];
    uint64_t v10 = *MEMORY[0x1E4F90B88];
    uint64_t v12 = *MEMORY[0x1E4F56558];
    v13[0] = v4;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    [v9 sendEvent:v10 withPayload:v11];
  }
}

- (void)logDidEndViewingMedia:(id)a3 mediaKind:(int64_t)a4 duration:(double)a5
{
  v39[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"PUOneUpEventTracker.m", 294, @"Invalid parameter not satisfying: %@", @"media != nil" object file lineNumber description];
  }
  v33.receiver = self;
  v33.super_class = (Class)PUOneUpEventTracker;
  [(PXMediaViewControllerEventTracker *)&v33 logDidEndViewingMedia:v9 mediaKind:a4 duration:a5];
  if (a4 == 1)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F56658];
    int64_t v11 = [(PUOneUpEventTracker *)self currentAssetSignpost];
    uint64_t v12 = *MEMORY[0x1E4F565C0];
    v38[0] = *MEMORY[0x1E4F56560];
    uint64_t v13 = v38[0];
    double v14 = [(PXMediaViewControllerEventTracker *)self viewName];
    uint64_t v15 = *MEMORY[0x1E4F56558];
    v39[0] = v14;
    v39[1] = v9;
    v38[1] = v15;
    v38[2] = @"oneUpEngagement";
    v39[2] = MEMORY[0x1E4F1CC38];
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:3];
    id v17 = [(PXUserInterfaceElementEventTracker *)self finalPayloadWithPayload:v16];
    [v10 endSignpost:v11 forEventName:v12 withPayload:v17];

    uint64_t v18 = (void *)MEMORY[0x1E4F56658];
    uint64_t v19 = *MEMORY[0x1E4F56488];
    v36[0] = v13;
    uint64_t v20 = [(PXMediaViewControllerEventTracker *)self viewName];
    v37[0] = v20;
    v36[1] = *MEMORY[0x1E4F56598];
    id v21 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PUOneUpEventTracker currentAssetSignpost](self, "currentAssetSignpost"));
    v37[1] = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
    uint64_t v23 = [(PXUserInterfaceElementEventTracker *)self finalPayloadWithPayload:v22];
    [v18 sendEvent:v19 withPayload:v23];

    [(PUOneUpEventTracker *)self setCurrentAssetSignpost:0];
    v24 = (void *)MEMORY[0x1E4F56658];
    int64_t v25 = [(PUOneUpEventTracker *)self currentAssetDisplayIntervalSignpost];
    uint64_t v26 = *MEMORY[0x1E4F56440];
    v34[0] = *MEMORY[0x1E4F56580];
    v34[1] = v15;
    v35[0] = @"com.apple.photos.CPAnalytics.oneUpAssetDisplayed";
    v35[1] = v9;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
    v28 = [(PXUserInterfaceElementEventTracker *)self finalPayloadWithPayload:v27];
    [v24 endSignpost:v25 forEventName:v26 withPayload:v28];

    [(PUOneUpEventTracker *)self setCurrentAssetDisplayIntervalSignpost:0];
    v29 = +[PUOneUpSettings sharedInstance];
    [v29 minimumDurationForIncrementingViewCount];
    if (v30 <= a5)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        [(PUOneUpEventTracker *)self _incrementAssetViewCountIfNeeded:v9];
      }
    }
    else
    {
    }
  }
}

- (void)logDidStartViewingMedia:(id)a3 mediaKind:(int64_t)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PUOneUpEventTracker.m", 279, @"Invalid parameter not satisfying: %@", @"media != nil" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)PUOneUpEventTracker;
  [(PXMediaViewControllerEventTracker *)&v17 logDidStartViewingMedia:v7 mediaKind:a4];
  if ([(PUOneUpEventTracker *)self currentAssetSignpost])
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUOneUpEventTracker.m", 282, @"Invalid parameter not satisfying: %@", @"self.currentAssetSignpost == CPAnalyticsSignpostIDNull" object file lineNumber description];
  }
  -[PUOneUpEventTracker setCurrentAssetSignpost:](self, "setCurrentAssetSignpost:", [MEMORY[0x1E4F56658] startSignpost]);
  id v8 = (void *)MEMORY[0x1E4F56658];
  uint64_t v9 = *MEMORY[0x1E4F56480];
  v18[0] = *MEMORY[0x1E4F56560];
  uint64_t v10 = [(PXMediaViewControllerEventTracker *)self viewName];
  v19[0] = v10;
  v18[1] = *MEMORY[0x1E4F56598];
  int64_t v11 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PUOneUpEventTracker currentAssetSignpost](self, "currentAssetSignpost"));
  v19[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  uint64_t v13 = [(PXUserInterfaceElementEventTracker *)self finalPayloadWithPayload:v12];
  [v8 sendEvent:v9 withPayload:v13];

  if ([(PUOneUpEventTracker *)self currentAssetDisplayIntervalSignpost])
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PUOneUpEventTracker.m", 289, @"Invalid parameter not satisfying: %@", @"self.currentAssetDisplayIntervalSignpost == CPAnalyticsSignpostIDNull" object file lineNumber description];
  }
  -[PUOneUpEventTracker setCurrentAssetDisplayIntervalSignpost:](self, "setCurrentAssetDisplayIntervalSignpost:", [MEMORY[0x1E4F56658] startSignpost]);
}

- (void)setDisplayedAsset:(id)a3
{
  id v4 = a3;
  id v5 = [(PXMediaViewControllerEventTracker *)self displayedAsset];
  if (v5 == v4)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [v4 isEqual:v5];

    if ((v7 & 1) == 0)
    {
      v14.receiver = self;
      v14.super_class = (Class)PUOneUpEventTracker;
      [(PXMediaViewControllerEventTracker *)&v14 setDisplayedAsset:v4];
      [(PXUserInterfaceElementEventTracker *)self currentTimestamp];
      self->_currentlyViewedAssetTimestamp = v8;
      ++self->_currentlyViewedAssetGeneration;
      if (v4)
      {
        objc_initWeak(&location, self);
        currentlyViewedAssetGeneration = (void *)self->_currentlyViewedAssetGeneration;
        dispatch_time_t v10 = dispatch_time(0, 1000000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __41__PUOneUpEventTracker_setDisplayedAsset___block_invoke;
        block[3] = &unk_1E5F2B980;
        objc_copyWeak(v12, &location);
        v12[1] = currentlyViewedAssetGeneration;
        dispatch_after(v10, MEMORY[0x1E4F14428], block);
        objc_destroyWeak(v12);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __41__PUOneUpEventTracker_setDisplayedAsset___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleLongEnoughViewDurationWithGeneration:*(void *)(a1 + 40)];
}

- (void)setCurrentlyStreamingVideoIsStalled:(BOOL)a3
{
  if (self->_currentlyStreamingVideoIsStalled != a3)
  {
    self->_currentlyStreamingVideoIsStalled = a3;
    if (a3)
    {
      int64_t v4 = [(PUOneUpEventTracker *)self currentlyStreamingVideoStallsCount] + 1;
      [(PUOneUpEventTracker *)self setCurrentlyStreamingVideoStallsCount:v4];
    }
  }
}

- (void)setCurrentlyStreamingVideoIsActuallyPlaying:(BOOL)a3
{
  if (self->_currentlyStreamingVideoIsActuallyPlaying != a3)
  {
    self->_currentlyStreamingVideoIsActuallyPlaying = a3;
    if (a3)
    {
      [(PUOneUpEventTracker *)self setCurrentlyStreamingVideoDidStartActualPlayback:1];
      if (self->_currentlyStreamingVideoAsset)
      {
        -[PUOneUpEventTracker _logDidStartActualPlaybackOfStreamedVideoAsset:](self, "_logDidStartActualPlaybackOfStreamedVideoAsset:");
      }
      else
      {
        int64_t v4 = PXAssertGetLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id v5 = 0;
          _os_log_error_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_ERROR, "No currently streaming video asset when actual playback did start", v5, 2u);
        }
      }
    }
  }
}

- (void)setCurrentlyStreamingVideoAsset:(id)a3
{
  double v8 = (PUDisplayAsset *)a3;
  p_currentlyStreamingVideoAsset = &self->_currentlyStreamingVideoAsset;
  id v6 = self->_currentlyStreamingVideoAsset;
  if (v6 == v8)
  {
  }
  else
  {
    char v7 = [(PUDisplayAsset *)v8 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      if (*p_currentlyStreamingVideoAsset) {
        -[PUOneUpEventTracker _logWillEndPlaybackOfStreamedVideoAsset:](self, "_logWillEndPlaybackOfStreamedVideoAsset:");
      }
      objc_storeStrong((id *)&self->_currentlyStreamingVideoAsset, a3);
      if (*p_currentlyStreamingVideoAsset)
      {
        [(PUOneUpEventTracker *)self setCurrentlyStreamingVideoStallsCount:0];
        [(PUOneUpEventTracker *)self setCurrentlyStreamingVideoDidStartActualPlayback:0];
        [(PUOneUpEventTracker *)self _logDidStartPlaybackOfStreamedVideoAsset:*p_currentlyStreamingVideoAsset];
      }
    }
  }
}

- (void)setCurrentlyPlayingVideoAsset:(id)a3
{
  uint64_t v9 = (PUDisplayAsset *)a3;
  p_currentlyPlayingVideoAsset = &self->_currentlyPlayingVideoAsset;
  id v6 = self->_currentlyPlayingVideoAsset;
  if (v6 == v9)
  {
  }
  else
  {
    char v7 = [(PUDisplayAsset *)v9 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      if (*p_currentlyPlayingVideoAsset)
      {
        [(PXUserInterfaceElementEventTracker *)self timeIntervalSinceTimestamp:self->_currentlyPlayingVideoAssetTimestamp];
        -[PUOneUpEventTracker _logDidEndPlayingVideoAsset:duration:](self, "_logDidEndPlayingVideoAsset:duration:", *p_currentlyPlayingVideoAsset);
      }
      objc_storeStrong((id *)&self->_currentlyPlayingVideoAsset, a3);
      [(PXUserInterfaceElementEventTracker *)self currentTimestamp];
      self->_currentlyPlayingVideoAssetTimestamp = v8;
      if (*p_currentlyPlayingVideoAsset) {
        -[PUOneUpEventTracker _logDidStartPlayingVideoAsset:](self, "_logDidStartPlayingVideoAsset:");
      }
    }
  }
}

- (void)setCurrentVideoPlayer:(id)a3
{
  id v5 = (PUBrowsingVideoPlayer *)a3;
  p_currentVideoPlayer = &self->_currentVideoPlayer;
  currentVideoPlayer = self->_currentVideoPlayer;
  if (currentVideoPlayer != v5)
  {
    dispatch_time_t v10 = v5;
    [(PUBrowsingVideoPlayer *)currentVideoPlayer unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_currentVideoPlayer, a3);
    [(PUBrowsingVideoPlayer *)*p_currentVideoPlayer registerChangeObserver:self];
    double v8 = [(PUBrowsingVideoPlayer *)*p_currentVideoPlayer asset];
    currentVideoAsset = self->_currentVideoAsset;
    self->_currentVideoAsset = v8;

    [(PUOneUpEventTracker *)self _invalidateCurrentVideoProperties];
    id v5 = v10;
  }
}

- (void)setIsSessionActive:(BOOL)a3
{
  if (self->_isSessionActive != a3)
  {
    BOOL v3 = a3;
    if (self->_isSessionActive) {
      [(PUOneUpEventTracker *)self _logDidEndSession];
    }
    self->_isSessionActive = v3;
    if (v3)
    {
      [(PUOneUpEventTracker *)self _logDidStartSession];
    }
  }
}

- (void)_updateOneUpInfoPanelShowingSignpost
{
  if (![(PUOneUpEventTracker *)self isSessionActive])
  {
    [(PUOneUpEventTracker *)self setCurrentlyShowingInfoPanelSignpost:0];
  }
}

- (void)_invalidateOneUpInfoPanelShowingSignpost
{
  id v2 = [(PXUserInterfaceElementEventTracker *)self updater];
  [v2 setNeedsUpdateOf:sel__updateOneUpInfoPanelShowingSignpost];
}

- (void)_updateCurrentVideoProperties
{
  id v15 = [(PUOneUpEventTracker *)self currentVideoPlayer];
  int v3 = [v15 isPlaybackDesired];
  if (v3)
  {
    int64_t v4 = [v15 playerItem];
    id v5 = [v4 asset];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v5 URL];
      char v7 = [v6 isFileURL];

      if ((v7 & 1) == 0)
      {
        BOOL v8 = [v15 playState] == 3;
        uint64_t v9 = [v15 isStalled];
        int v10 = 1;
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  BOOL v8 = 0;
  int v10 = 0;
  uint64_t v9 = 0;
LABEL_7:
  uint64_t v11 = [(PUOneUpEventTracker *)self currentVideoAsset];
  uint64_t v12 = (void *)v11;
  if (v3) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = 0;
  }
  [(PUOneUpEventTracker *)self setCurrentlyPlayingVideoAsset:v13];
  if (v10) {
    objc_super v14 = v12;
  }
  else {
    objc_super v14 = 0;
  }
  [(PUOneUpEventTracker *)self setCurrentlyStreamingVideoAsset:v14];
  [(PUOneUpEventTracker *)self setCurrentlyStreamingVideoIsActuallyPlaying:v8];
  [(PUOneUpEventTracker *)self setCurrentlyStreamingVideoIsStalled:v9];
}

- (void)_invalidateCurrentVideoProperties
{
  id v2 = [(PXUserInterfaceElementEventTracker *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentVideoProperties];
}

- (void)_updateCurrentVideoPlayer
{
  if ([(PXViewControllerEventTracker *)self isViewVisible])
  {
    int v3 = [(PUOneUpEventTracker *)self viewModel];
    id v4 = [v3 videoPlayer];
  }
  else
  {
    id v4 = 0;
  }
  [(PUOneUpEventTracker *)self setCurrentVideoPlayer:v4];
}

- (void)_invalidateCurrentVideoPlayer
{
  id v2 = [(PXUserInterfaceElementEventTracker *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentVideoPlayer];
}

- (void)_updateCurrentlyViewedAsset
{
  id v6 = [(PUOneUpEventTracker *)self viewModel];
  uint64_t v3 = [v6 browsingSpeedRegime];
  id v4 = 0;
  if ([(PXViewControllerEventTracker *)self isViewVisible] && v3 <= 1)
  {
    id v5 = [v6 currentAssetReference];
    id v4 = [v5 asset];
  }
  [(PUOneUpEventTracker *)self setDisplayedAsset:v4];
}

- (void)_invalidateCurrentlyViewedAsset
{
  id v2 = [(PXUserInterfaceElementEventTracker *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentlyViewedAsset];
}

- (void)_updateIsSessionActive
{
  BOOL v3 = [(PXViewControllerEventTracker *)self isViewVisible];
  [(PUOneUpEventTracker *)self setIsSessionActive:v3];
}

- (void)_invalidateIsSessionActive
{
  id v2 = [(PXUserInterfaceElementEventTracker *)self updater];
  [v2 setNeedsUpdateOf:sel__updateIsSessionActive];
}

- (PUOneUpEventTracker)initWithViewModel:(id)a3 presentationOrigin:(int64_t)a4
{
  id v7 = a3;
  if (a4 == 44) {
    BOOL v8 = @"OneUp_DuplicatesAlbum";
  }
  else {
    BOOL v8 = @"OneUp";
  }
  v18.receiver = self;
  v18.super_class = (Class)PUOneUpEventTracker;
  uint64_t v9 = [(PXMediaViewControllerEventTracker *)&v18 initWithViewName:v8];
  int v10 = v9;
  if (v9)
  {
    v9->_presentationOrigin = a4;
    [(PUOneUpEventTracker *)v9 registerChangeObserver:v9 context:EventTrackerObservationContext];
    uint64_t v11 = [(PXUserInterfaceElementEventTracker *)v10 updater];
    [v11 addUpdateSelector:sel__updateIsSessionActive];
    [v11 addUpdateSelector:sel__updateCurrentlyViewedAsset];
    [v11 addUpdateSelector:sel__updateCurrentVideoPlayer];
    [v11 addUpdateSelector:sel__updateCurrentVideoProperties];
    [v11 addUpdateSelector:sel__updateOneUpInfoPanelShowingSignpost];
    objc_storeStrong((id *)&v10->_viewModel, a3);
    [(PUBrowsingViewModel *)v10->_viewModel registerChangeObserver:v10];
    uint64_t v12 = [MEMORY[0x1E4F8FFD8] sharedDonator];
    assetMetadataDonator = v10->_assetMetadataDonator;
    v10->_assetMetadataDonator = (PXAssetMetadataDonator *)v12;

    objc_super v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.photosui.eventTracker.biome", v14);
    biomeRequestQueue = v10->_biomeRequestQueue;
    v10->_biomeRequestQueue = (OS_dispatch_queue *)v15;
  }
  return v10;
}

- (PUOneUpEventTracker)initWithViewName:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUOneUpEventTracker.m", 79, @"%s is not available as initializer", "-[PUOneUpEventTracker initWithViewName:]");

  abort();
}

@end