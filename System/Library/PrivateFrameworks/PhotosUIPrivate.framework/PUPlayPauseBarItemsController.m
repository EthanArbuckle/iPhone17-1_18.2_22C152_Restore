@interface PUPlayPauseBarItemsController
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentPlaybackTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackDuration;
- (BOOL)_isPerformingChanges;
- (BOOL)_isUpdating;
- (BOOL)_needsUpdate;
- (BOOL)_needsUpdateAVPlayer;
- (BOOL)_needsUpdateCurrentPlaybackTimeAndDuration;
- (BOOL)_needsUpdatePlayPauseState;
- (BOOL)_needsUpdateVideoPlayer;
- (ISWrappedAVPlayer)_avPlayer;
- (NSHashTable)_changeObservers;
- (OS_dispatch_queue)_observerQueue;
- (PUBrowsingVideoPlayer)_videoPlayer;
- (PUBrowsingViewModel)viewModel;
- (PUPlayPauseBarItemsController)init;
- (PUPlayPauseBarItemsController)initWithViewModel:(id)a3;
- (PUPlayPauseBarItemsControllerChange)_currentChange;
- (id)_timeObservationToken;
- (int64_t)playPauseState;
- (void)_assertInsideChangeBlock;
- (void)_assertInsideUpdate;
- (void)_handleVideoPlayer:(id)a3 didChange:(id)a4;
- (void)_handleViewModel:(id)a3 didChange:(id)a4;
- (void)_invalidateAVPlayer;
- (void)_invalidateCurrentPlaybackTimeAndDuration;
- (void)_invalidatePlayPauseState;
- (void)_invalidateVideoPlayer;
- (void)_performChanges:(id)a3;
- (void)_publishChanges;
- (void)_setAVPlayer:(id)a3;
- (void)_setCurrentPlaybackTime:(id *)a3;
- (void)_setNeedsUpdate;
- (void)_setNeedsUpdateAVPlayer:(BOOL)a3;
- (void)_setNeedsUpdateCurrentPlaybackTimeAndDuration:(BOOL)a3;
- (void)_setNeedsUpdatePlayPauseState:(BOOL)a3;
- (void)_setNeedsUpdateVideoPlayer:(BOOL)a3;
- (void)_setPerformingChanges:(BOOL)a3;
- (void)_setPlayPauseState:(int64_t)a3;
- (void)_setPlaybackDuration:(id *)a3;
- (void)_setTimeObservationToken:(id)a3;
- (void)_setUpdating:(BOOL)a3;
- (void)_setVideoPlayer:(id)a3;
- (void)_startObservingAVPlayer;
- (void)_stopObservingAVPlayer;
- (void)_updateAVPlayerIfNeeded;
- (void)_updateCurrentPlaybackTimeAndDurationIfNeeded;
- (void)_updateIfNeeded;
- (void)_updatePlayPauseStateIfNeeded;
- (void)_updateVideoPlayerIfNeeded;
- (void)registerChangeObserver:(id)a3;
- (void)unregisterChangeObserver:(id)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUPlayPauseBarItemsController

- (void).cxx_destruct
{
  objc_storeStrong(&self->__timeObservationToken, 0);
  objc_storeStrong((id *)&self->__avPlayer, 0);
  objc_storeStrong((id *)&self->__videoPlayer, 0);
  objc_storeStrong((id *)&self->__changeObservers, 0);
  objc_storeStrong((id *)&self->__observerQueue, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->__currentChange, 0);
}

- (void)_setTimeObservationToken:(id)a3
{
}

- (id)_timeObservationToken
{
  return self->__timeObservationToken;
}

- (ISWrappedAVPlayer)_avPlayer
{
  return self->__avPlayer;
}

- (PUBrowsingVideoPlayer)_videoPlayer
{
  return self->__videoPlayer;
}

- (void)_setNeedsUpdateCurrentPlaybackTimeAndDuration:(BOOL)a3
{
  self->__needsUpdateCurrentPlaybackTimeAndDuration = a3;
}

- (BOOL)_needsUpdateCurrentPlaybackTimeAndDuration
{
  return self->__needsUpdateCurrentPlaybackTimeAndDuration;
}

- (void)_setNeedsUpdateAVPlayer:(BOOL)a3
{
  self->__needsUpdateAVPlayer = a3;
}

- (BOOL)_needsUpdateAVPlayer
{
  return self->__needsUpdateAVPlayer;
}

- (void)_setNeedsUpdatePlayPauseState:(BOOL)a3
{
  self->__needsUpdatePlayPauseState = a3;
}

- (BOOL)_needsUpdatePlayPauseState
{
  return self->__needsUpdatePlayPauseState;
}

- (void)_setNeedsUpdateVideoPlayer:(BOOL)a3
{
  self->__needsUpdateVideoPlayer = a3;
}

- (BOOL)_needsUpdateVideoPlayer
{
  return self->__needsUpdateVideoPlayer;
}

- (void)_setUpdating:(BOOL)a3
{
  self->__isUpdating = a3;
}

- (BOOL)_isUpdating
{
  return self->__isUpdating;
}

- (void)_setPerformingChanges:(BOOL)a3
{
  self->__isPerformingChanges = a3;
}

- (BOOL)_isPerformingChanges
{
  return self->__isPerformingChanges;
}

- (NSHashTable)_changeObservers
{
  return self->__changeObservers;
}

- (OS_dispatch_queue)_observerQueue
{
  return self->__observerQueue;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 104);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentPlaybackTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- (int64_t)playPauseState
{
  return self->_playPauseState;
}

- (PUBrowsingViewModel)viewModel
{
  return self->_viewModel;
}

- (void)_handleVideoPlayer:(id)a3 didChange:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__PUPlayPauseBarItemsController__handleVideoPlayer_didChange___block_invoke;
  v7[3] = &unk_1E5F2ECC8;
  id v8 = v5;
  v9 = self;
  id v6 = v5;
  [(PUPlayPauseBarItemsController *)self _performChanges:v7];
}

uint64_t __62__PUPlayPauseBarItemsController__handleVideoPlayer_didChange___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isActivatedDidChange] & 1) != 0
    || ([*(id *)(a1 + 32) desiredPlayStateDidChange] & 1) != 0
    || [*(id *)(a1 + 32) playStateDidChange])
  {
    [*(id *)(a1 + 40) _invalidatePlayPauseState];
  }
  if ([*(id *)(a1 + 32) avPlayerDidChange]) {
    [*(id *)(a1 + 40) _invalidateAVPlayer];
  }
  if (([*(id *)(a1 + 32) isActivatedDidChange] & 1) != 0
    || [*(id *)(a1 + 32) playerItemDidChange])
  {
    [*(id *)(a1 + 40) _invalidateCurrentPlaybackTimeAndDuration];
  }
  uint64_t result = [*(id *)(a1 + 32) isAtEndDidChange];
  if (result)
  {
    v3 = *(void **)(a1 + 40);
    return [v3 _invalidatePlayPauseState];
  }
  return result;
}

- (void)_handleViewModel:(id)a3 didChange:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 assetViewModelChangesByAssetReference];
  v7 = [(id)v6 allValues];
  int v8 = PFExists();

  LOBYTE(v6) = [v5 currentAssetDidChange];
  if ((v6 & 1) != 0 || v8)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__PUPlayPauseBarItemsController__handleViewModel_didChange___block_invoke_3;
    v9[3] = &unk_1E5F2ED10;
    v9[4] = self;
    [(PUPlayPauseBarItemsController *)self _performChanges:v9];
  }
}

uint64_t __60__PUPlayPauseBarItemsController__handleViewModel_didChange___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateVideoPlayer];
}

uint64_t __60__PUPlayPauseBarItemsController__handleViewModel_didChange___block_invoke()
{
  return PFExists();
}

uint64_t __60__PUPlayPauseBarItemsController__handleViewModel_didChange___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 videoPlayerDidChange];
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(PUPlayPauseBarItemsController *)self viewModel];

  if (v7 == v9)
  {
    [(PUPlayPauseBarItemsController *)self _handleViewModel:v9 didChange:v6];
  }
  else
  {
    id v8 = [(PUPlayPauseBarItemsController *)self _videoPlayer];

    if (v8 == v9) {
      [(PUPlayPauseBarItemsController *)self _handleVideoPlayer:v9 didChange:v6];
    }
  }
}

- (void)_updateCurrentPlaybackTimeAndDurationIfNeeded
{
  if ([(PUPlayPauseBarItemsController *)self _needsUpdateCurrentPlaybackTimeAndDuration])
  {
    [(PUPlayPauseBarItemsController *)self _setNeedsUpdateCurrentPlaybackTimeAndDuration:0];
    long long v11 = *MEMORY[0x1E4F1F9F8];
    uint64_t v12 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    long long v9 = v11;
    uint64_t v10 = v12;
    v3 = [(PUPlayPauseBarItemsController *)self _videoPlayer];
    int v4 = [v3 isActivated];

    id v5 = [(PUPlayPauseBarItemsController *)self _avPlayer];
    id v6 = v5;
    if (v4)
    {
      if (v5)
      {
        [v5 currentTime];
        [v6 currentItemDuration];
      }
    }
    long long v7 = v11;
    uint64_t v8 = v12;
    [(PUPlayPauseBarItemsController *)self _setCurrentPlaybackTime:&v7];
    long long v7 = v9;
    uint64_t v8 = v10;
    [(PUPlayPauseBarItemsController *)self _setPlaybackDuration:&v7];
  }
}

- (void)_invalidateCurrentPlaybackTimeAndDuration
{
  [(PUPlayPauseBarItemsController *)self _setNeedsUpdateCurrentPlaybackTimeAndDuration:1];
  [(PUPlayPauseBarItemsController *)self _setNeedsUpdate];
}

- (void)_updateAVPlayerIfNeeded
{
  if ([(PUPlayPauseBarItemsController *)self _needsUpdateAVPlayer])
  {
    [(PUPlayPauseBarItemsController *)self _setNeedsUpdateAVPlayer:0];
    v3 = [(PUPlayPauseBarItemsController *)self _videoPlayer];
    id v4 = [v3 avPlayer];

    [(PUPlayPauseBarItemsController *)self _setAVPlayer:v4];
  }
}

- (void)_invalidateAVPlayer
{
  [(PUPlayPauseBarItemsController *)self _setNeedsUpdateAVPlayer:1];
  [(PUPlayPauseBarItemsController *)self _setNeedsUpdate];
}

- (void)_updatePlayPauseStateIfNeeded
{
  if (![(PUPlayPauseBarItemsController *)self _needsUpdatePlayPauseState]) {
    return;
  }
  [(PUPlayPauseBarItemsController *)self _setNeedsUpdatePlayPauseState:0];
  id v5 = [(PUPlayPauseBarItemsController *)self _videoPlayer];
  unint64_t v3 = [v5 desiredPlayState];
  if (v3 < 3) {
    goto LABEL_5;
  }
  if (v3 - 3 > 1)
  {
    uint64_t v4 = 0;
    goto LABEL_11;
  }
  if ([v5 isAtEnd])
  {
LABEL_5:
    uint64_t v4 = 2;
  }
  else if ([v5 playState] == 5)
  {
    uint64_t v4 = 2;
  }
  else
  {
    uint64_t v4 = 1;
  }
LABEL_11:
  [(PUPlayPauseBarItemsController *)self _setPlayPauseState:v4];
}

- (void)_invalidatePlayPauseState
{
  [(PUPlayPauseBarItemsController *)self _setNeedsUpdatePlayPauseState:1];
  [(PUPlayPauseBarItemsController *)self _setNeedsUpdate];
}

- (void)_updateVideoPlayerIfNeeded
{
  if ([(PUPlayPauseBarItemsController *)self _needsUpdateVideoPlayer])
  {
    [(PUPlayPauseBarItemsController *)self _setNeedsUpdateVideoPlayer:0];
    id v6 = [(PUPlayPauseBarItemsController *)self viewModel];
    unint64_t v3 = [v6 currentAssetReference];
    uint64_t v4 = [v6 assetViewModelForAssetReference:v3];
    id v5 = [v4 videoPlayer];
    [(PUPlayPauseBarItemsController *)self _setVideoPlayer:v5];
  }
}

- (void)_invalidateVideoPlayer
{
  [(PUPlayPauseBarItemsController *)self _setNeedsUpdateVideoPlayer:1];
  [(PUPlayPauseBarItemsController *)self _setNeedsUpdate];
}

- (void)_setNeedsUpdate
{
  if (![(PUPlayPauseBarItemsController *)self _isUpdating]
    && ![(PUPlayPauseBarItemsController *)self _isPerformingChanges])
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PUPlayPauseBarItemsController.m" lineNumber:247 description:@"not within a change block or update"];
  }
}

- (BOOL)_needsUpdate
{
  if ([(PUPlayPauseBarItemsController *)self _needsUpdateVideoPlayer]
    || [(PUPlayPauseBarItemsController *)self _needsUpdatePlayPauseState]
    || [(PUPlayPauseBarItemsController *)self _needsUpdateAVPlayer])
  {
    return 1;
  }
  return [(PUPlayPauseBarItemsController *)self _needsUpdateCurrentPlaybackTimeAndDuration];
}

- (void)_updateIfNeeded
{
  if ([(PUPlayPauseBarItemsController *)self _needsUpdate])
  {
    BOOL v4 = [(PUPlayPauseBarItemsController *)self _isUpdating];
    [(PUPlayPauseBarItemsController *)self _setUpdating:1];
    [(PUPlayPauseBarItemsController *)self _updateVideoPlayerIfNeeded];
    [(PUPlayPauseBarItemsController *)self _updatePlayPauseStateIfNeeded];
    [(PUPlayPauseBarItemsController *)self _updateAVPlayerIfNeeded];
    [(PUPlayPauseBarItemsController *)self _updateCurrentPlaybackTimeAndDurationIfNeeded];
    [(PUPlayPauseBarItemsController *)self _setUpdating:v4];
    if ([(PUPlayPauseBarItemsController *)self _needsUpdate])
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2 object:self file:@"PUPlayPauseBarItemsController.m" lineNumber:234 description:@"updates still needed after an update cycle"];
    }
  }
}

- (void)_performChanges:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  BOOL v5 = [(PUPlayPauseBarItemsController *)self _isPerformingChanges];
  [(PUPlayPauseBarItemsController *)self _setPerformingChanges:1];
  v4[2](v4);

  [(PUPlayPauseBarItemsController *)self _setPerformingChanges:v5];
  if (!v5)
  {
    [(PUPlayPauseBarItemsController *)self _updateIfNeeded];
    [(PUPlayPauseBarItemsController *)self _publishChanges];
  }
}

- (void)_assertInsideUpdate
{
  if (![(PUPlayPauseBarItemsController *)self _isUpdating])
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PUPlayPauseBarItemsController.m" lineNumber:205 description:@"not within update"];
  }
}

- (void)_assertInsideChangeBlock
{
  if (![(PUPlayPauseBarItemsController *)self _isPerformingChanges])
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PUPlayPauseBarItemsController.m" lineNumber:200 description:@"not within a change block"];
  }
}

- (void)_publishChanges
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = self->__currentChange;
  currentChange = self->__currentChange;
  self->__currentChange = 0;

  if ([(PUPlayPauseBarItemsControllerChange *)v3 hasChanges])
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__73013;
    v19 = __Block_byref_object_dispose__73014;
    id v20 = 0;
    BOOL v5 = [(PUPlayPauseBarItemsController *)self _observerQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__PUPlayPauseBarItemsController__publishChanges__block_invoke;
    block[3] = &unk_1E5F2E200;
    block[4] = self;
    block[5] = &v15;
    dispatch_sync(v5, block);

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v6 = (id)v16[5];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "playPauseBarItemsController:didChange:", self, v3, (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v21 count:16];
      }
      while (v7);
    }

    _Block_object_dispose(&v15, 8);
  }
}

void __48__PUPlayPauseBarItemsController__publishChanges__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _changeObservers];
  uint64_t v2 = [v5 allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (PUPlayPauseBarItemsControllerChange)_currentChange
{
  currentChange = self->__currentChange;
  if (!currentChange)
  {
    id v4 = objc_alloc_init(PUPlayPauseBarItemsControllerChange);
    id v5 = self->__currentChange;
    self->__currentChange = v4;

    currentChange = self->__currentChange;
  }
  return currentChange;
}

- (void)_setPlaybackDuration:(id *)a3
{
  [(PUPlayPauseBarItemsController *)self _assertInsideUpdate];
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 playbackDuration = self->_playbackDuration;
  if (CMTimeCompare(&time1, (CMTime *)&playbackDuration))
  {
    long long v5 = *(_OWORD *)&a3->var0;
    self->_playbackDuration.epoch = a3->var3;
    *(_OWORD *)&self->_playbackDuration.value = v5;
    id v6 = [(PUPlayPauseBarItemsController *)self _currentChange];
    [v6 _setPlaybackDurationDidChange:1];
  }
}

- (void)_setCurrentPlaybackTime:(id *)a3
{
  [(PUPlayPauseBarItemsController *)self _assertInsideUpdate];
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 currentPlaybackTime = self->_currentPlaybackTime;
  if (CMTimeCompare(&time1, (CMTime *)&currentPlaybackTime))
  {
    long long v5 = *(_OWORD *)&a3->var0;
    self->_currentPlaybackTime.epoch = a3->var3;
    *(_OWORD *)&self->_currentPlaybackTime.value = v5;
    id v6 = [(PUPlayPauseBarItemsController *)self _currentChange];
    [v6 _setCurrentPlaybackTimeDidChange:1];
  }
}

- (void)_stopObservingAVPlayer
{
  id v4 = [(PUPlayPauseBarItemsController *)self _timeObservationToken];
  if (v4)
  {
    id v7 = v4;
    long long v5 = [(PUPlayPauseBarItemsController *)self _avPlayer];
    if (!v5)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2, self, @"PUPlayPauseBarItemsController.m", 150, @"Invalid parameter not satisfying: %@", @"avPlayer" object file lineNumber description];
    }
    [v5 removeTimeObserver:v7];
    [(PUPlayPauseBarItemsController *)self _setTimeObservationToken:0];

    id v4 = v7;
  }
}

- (void)_startObservingAVPlayer
{
  id v4 = [(PUPlayPauseBarItemsController *)self _timeObservationToken];

  if (v4)
  {
    long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PUPlayPauseBarItemsController.m", 127, @"Invalid parameter not satisfying: %@", @"![self _timeObservationToken]" object file lineNumber description];
  }
  long long v5 = [(PUPlayPauseBarItemsController *)self _avPlayer];
  if (v5)
  {
    objc_initWeak(&location, self);
    id v6 = [(PUPlayPauseBarItemsController *)self _avPlayer];
    CMTimeMake(&v13, 1, 30);
    uint64_t v7 = MEMORY[0x1E4F14428];
    id v8 = MEMORY[0x1E4F14428];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__PUPlayPauseBarItemsController__startObservingAVPlayer__block_invoke;
    v11[3] = &unk_1E5F2B040;
    objc_copyWeak(&v12, &location);
    uint64_t v9 = [v6 addPeriodicTimeObserverForInterval:&v13 queue:v7 usingBlock:v11];

    [(PUPlayPauseBarItemsController *)self _setTimeObservationToken:v9];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __56__PUPlayPauseBarItemsController__startObservingAVPlayer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __56__PUPlayPauseBarItemsController__startObservingAVPlayer__block_invoke_2;
  v2[3] = &unk_1E5F2ED10;
  v2[4] = WeakRetained;
  [WeakRetained _performChanges:v2];
}

uint64_t __56__PUPlayPauseBarItemsController__startObservingAVPlayer__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateCurrentPlaybackTimeAndDuration];
}

- (void)_setAVPlayer:(id)a3
{
  long long v5 = (ISWrappedAVPlayer *)a3;
  [(PUPlayPauseBarItemsController *)self _assertInsideUpdate];
  if (self->__avPlayer != v5)
  {
    [(PUPlayPauseBarItemsController *)self _stopObservingAVPlayer];
    objc_storeStrong((id *)&self->__avPlayer, a3);
    [(PUPlayPauseBarItemsController *)self _startObservingAVPlayer];
    [(PUPlayPauseBarItemsController *)self _invalidateCurrentPlaybackTimeAndDuration];
  }
}

- (void)_setPlayPauseState:(int64_t)a3
{
  [(PUPlayPauseBarItemsController *)self _assertInsideUpdate];
  if (self->_playPauseState != a3)
  {
    self->_playPauseState = a3;
    id v5 = [(PUPlayPauseBarItemsController *)self _currentChange];
    [v5 _setPlayPauseStateDidChange:1];
  }
}

- (void)_setVideoPlayer:(id)a3
{
  id v6 = (PUBrowsingVideoPlayer *)a3;
  [(PUPlayPauseBarItemsController *)self _assertInsideUpdate];
  videoPlayer = self->__videoPlayer;
  if (videoPlayer != v6)
  {
    [(PUBrowsingVideoPlayer *)videoPlayer unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->__videoPlayer, a3);
    [(PUBrowsingVideoPlayer *)self->__videoPlayer registerChangeObserver:self];
    [(PUPlayPauseBarItemsController *)self _invalidatePlayPauseState];
    [(PUPlayPauseBarItemsController *)self _invalidateAVPlayer];
  }
}

- (void)unregisterChangeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPlayPauseBarItemsController *)self _observerQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__PUPlayPauseBarItemsController_unregisterChangeObserver___block_invoke;
  v7[3] = &unk_1E5F2ECC8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __58__PUPlayPauseBarItemsController_unregisterChangeObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _changeObservers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)registerChangeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPlayPauseBarItemsController *)self _observerQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__PUPlayPauseBarItemsController_registerChangeObserver___block_invoke;
  v7[3] = &unk_1E5F2ECC8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __56__PUPlayPauseBarItemsController_registerChangeObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _changeObservers];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (PUPlayPauseBarItemsController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPlayPauseBarItemsController.m", 73, @"%s is not available as initializer", "-[PUPlayPauseBarItemsController init]");

  abort();
}

- (PUPlayPauseBarItemsController)initWithViewModel:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PUPlayPauseBarItemsController;
  id v6 = [(PUPlayPauseBarItemsController *)&v15 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.photos.playpausebaritemscontroller.observer-queue", 0);
    observerQueue = v7->__observerQueue;
    v7->__observerQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    changeObservers = v7->__changeObservers;
    v7->__changeObservers = (NSHashTable *)v10;

    [(PUBrowsingViewModel *)v7->_viewModel registerChangeObserver:v7];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__PUPlayPauseBarItemsController_initWithViewModel___block_invoke;
    v13[3] = &unk_1E5F2ED10;
    v14 = v7;
    [(PUPlayPauseBarItemsController *)v14 _performChanges:v13];
  }
  return v7;
}

uint64_t __51__PUPlayPauseBarItemsController_initWithViewModel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateVideoPlayer];
}

@end