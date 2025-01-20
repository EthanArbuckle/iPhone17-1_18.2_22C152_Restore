@interface PXVideoScrubberController
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_avPlayerCurrentTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_avPlayerDuration;
- (AVPlayerItem)currentPlayerItem;
- (PXScrubberSeekRequest)_activeSeekRequest;
- (PXScrubberSeekRequest)_pendingSeekRequest;
- (PXVideoScrubberController)init;
- (PXVideoScrubberController)initWithTarget:(id)a3 estimatedDuration:(double)a4;
- (PXVideoScrubberControllerDelegate)delegate;
- (PXVideoScrubberControllerTarget)target;
- (double)_duration;
- (double)_lengthForDuration:(double)a3;
- (double)_playheadTime;
- (double)_progressForTime:(double)a3;
- (double)_timeForProgress:(double)a3;
- (double)estimatedDuration;
- (double)length;
- (double)playheadProgress;
- (float)playRate;
- (void)_addObservers;
- (void)_handleTimeoutCallbackForSeekRequest:(id)a3;
- (void)_invalidate;
- (void)_invalidateAvPlayerCurrentTime;
- (void)_invalidateAvPlayerDuration;
- (void)_playerDidChange:(id)a3;
- (void)_playerItemDidChange;
- (void)_playerItemDurationDidChange;
- (void)_removeObservers;
- (void)_seekRequest:(id)a3 didFinish:(BOOL)a4;
- (void)_seekToTime:(double)a3;
- (void)_setActiveSeekRequest:(id)a3;
- (void)_setAvPlayerCurrentTime:(id *)a3;
- (void)_setAvPlayerDuration:(id *)a3;
- (void)_setPendingSeekRequest:(id)a3;
- (void)_setPlayheadProgress:(double)a3 andSeekVideoPlayer:(BOOL)a4;
- (void)_setPlayheadTime:(double)a3;
- (void)_updateAvPlayerCurrentTimeIfNeeded;
- (void)_updateAvPlayerDurationIfNeeded;
- (void)_updateIfNeeded;
- (void)_updateSeeking;
- (void)beginSeeking;
- (void)dealloc;
- (void)endSeeking;
- (void)setDelegate:(id)a3;
- (void)setPlayheadProgress:(double)a3;
@end

@implementation PXVideoScrubberController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activeSeekRequest, 0);
  objc_storeStrong((id *)&self->__pendingSeekRequest, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_playerObserver, 0);
}

- (void)_setAvPlayerDuration:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->$95D729B680665BEAEFA1D6FCA8238556::value = *(_OWORD *)&a3->var0;
  self->$95D729B680665BEAEFA1D6FCA8238556::epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_avPlayerDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 184);
  return self;
}

- (void)_setAvPlayerCurrentTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->$95D729B680665BEAEFA1D6FCA8238556::value = *(_OWORD *)&a3->var0;
  self->$95D729B680665BEAEFA1D6FCA8238556::epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_avPlayerCurrentTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 160);
  return self;
}

- (PXScrubberSeekRequest)_activeSeekRequest
{
  return self->__activeSeekRequest;
}

- (void)_setPendingSeekRequest:(id)a3
{
}

- (PXScrubberSeekRequest)_pendingSeekRequest
{
  return self->__pendingSeekRequest;
}

- (double)_playheadTime
{
  return self->__playheadTime;
}

- (double)estimatedDuration
{
  return self->_estimatedDuration;
}

- (PXVideoScrubberControllerTarget)target
{
  return self->_target;
}

- (PXVideoScrubberControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXVideoScrubberControllerDelegate *)WeakRetained;
}

- (void)_updateAvPlayerDurationIfNeeded
{
  if (self->_avPlayerDurationNeedsUpdate)
  {
    self->_avPlayerDurationNeedsUpdate = 0;
    long long v6 = 0uLL;
    uint64_t v7 = 0;
    target = self->_target;
    if (target) {
      [(PXVideoScrubberControllerTarget *)target currentItemDuration];
    }
    long long v4 = v6;
    uint64_t v5 = v7;
    [(PXVideoScrubberController *)self _setAvPlayerDuration:&v4];
  }
}

- (void)_invalidateAvPlayerDuration
{
  self->_avPlayerDurationNeedsUpdate = 1;
  [(PXVideoScrubberController *)self _invalidate];
}

- (void)_updateAvPlayerCurrentTimeIfNeeded
{
  if (self->_avPlayerCurrentTimeNeedsUpdate)
  {
    self->_avPlayerCurrentTimeNeedsUpdate = 0;
    objc_initWeak(&location, self);
    v3 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__PXVideoScrubberController__updateAvPlayerCurrentTimeIfNeeded__block_invoke;
    block[3] = &unk_1E5DD20C8;
    block[4] = self;
    objc_copyWeak(&v5, &location);
    dispatch_async(v3, block);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __63__PXVideoScrubberController__updateAvPlayerCurrentTimeIfNeeded__block_invoke(uint64_t a1)
{
  long long v7 = 0uLL;
  uint64_t v8 = 0;
  v2 = *(void **)(*(void *)(a1 + 32) + 120);
  if (v2) {
    [v2 playerCurrentTime];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PXVideoScrubberController__updateAvPlayerCurrentTimeIfNeeded__block_invoke_2;
  block[3] = &unk_1E5DCE6A8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  long long v5 = v7;
  uint64_t v6 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v4);
}

void __63__PXVideoScrubberController__updateAvPlayerCurrentTimeIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v3 = *(_OWORD *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  [WeakRetained _setAvPlayerCurrentTime:&v3];
}

- (void)_invalidateAvPlayerCurrentTime
{
  self->_avPlayerCurrentTimeNeedsUpdate = 1;
  [(PXVideoScrubberController *)self _invalidate];
}

- (void)_updateIfNeeded
{
  if (self->_needsUpdate)
  {
    self->_needsUpdate = 0;
    [(PXVideoScrubberController *)self _updateAvPlayerCurrentTimeIfNeeded];
    [(PXVideoScrubberController *)self _updateAvPlayerDurationIfNeeded];
    uint64_t v4 = [(PXVideoScrubberController *)self _activeSeekRequest];
    if (v4)
    {
      long long v5 = [(PXVideoScrubberController *)self _pendingSeekRequest];
      uint64_t v6 = v5;
      if (!v5) {
        long long v5 = v4;
      }
      [v5 seekTime];
      -[PXVideoScrubberController _progressForTime:](self, "_progressForTime:");
      -[PXVideoScrubberController _setPlayheadProgress:andSeekVideoPlayer:](self, "_setPlayheadProgress:andSeekVideoPlayer:", 0);
    }
    else
    {
      memset(&v10, 0, sizeof(v10));
      [(PXVideoScrubberController *)self _avPlayerCurrentTime];
      CMTime time = v10;
      [(PXVideoScrubberController *)self _progressForTime:CMTimeGetSeconds(&time)];
      -[PXVideoScrubberController _setPlayheadProgress:andSeekVideoPlayer:](self, "_setPlayheadProgress:andSeekVideoPlayer:", 0);
    }
    if (self->_videoScrubberDelegateFlags.respondsToDidUpdate)
    {
      long long v7 = [(PXVideoScrubberController *)self delegate];
      [v7 videoScrubberControllerDidUpdate:self];
    }
    if (self->_needsUpdate)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"PXVideoScrubberController.m", 389, @"Invalid parameter not satisfying: %@", @"!_needsUpdate" object file lineNumber description];
    }
  }
}

- (void)_invalidate
{
  self->_needsUpdate = 1;
}

- (void)_setPlayheadTime:(double)a3
{
  if (self->__playheadTime != a3)
  {
    self->__playheadTime = a3;
    [(PXVideoScrubberController *)self _invalidate];
    [(PXVideoScrubberController *)self _updateIfNeeded];
  }
}

- (double)_lengthForDuration:(double)a3
{
  if (!self->_videoScrubberDelegateFlags.respondsToLengthForDuration) {
    return a3 * 60.0;
  }
  long long v5 = [(PXVideoScrubberController *)self delegate];
  [v5 videoScrubberController:self lengthForDuration:a3];
  double v7 = v6;

  return v7;
}

- (double)_progressForTime:(double)a3
{
  [(PXVideoScrubberController *)self _duration];
  double v5 = 0.0;
  if (v4 > 0.0)
  {
    double v6 = fmax(a3, 0.0);
    if (v4 < v6) {
      double v6 = v4;
    }
    return v6 / v4;
  }
  return v5;
}

- (double)_timeForProgress:(double)a3
{
  double v3 = fmax(a3, 0.0);
  if (v3 <= 1.0) {
    double v4 = v3;
  }
  else {
    double v4 = 1.0;
  }
  [(PXVideoScrubberController *)self _duration];
  return v4 * v5;
}

- (double)_duration
{
  memset(&v4[1], 0, sizeof(CMTime));
  [(PXVideoScrubberController *)self _avPlayerDuration];
  if ((unsigned __int128)0 >> 96 == 1)
  {
    v4[0] = v4[1];
    double result = CMTimeGetSeconds(v4);
  }
  else
  {
    [(PXVideoScrubberController *)self estimatedDuration];
  }
  if (result == 0.0) {
    return 1.0;
  }
  return result;
}

- (void)_playerItemDidChange
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __49__PXVideoScrubberController__playerItemDidChange__block_invoke;
  v2[3] = &unk_1E5DD0FA8;
  v2[4] = self;
  [(PXVideoScrubberController *)self performChanges:v2];
}

uint64_t __49__PXVideoScrubberController__playerItemDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) signalChange:1];
}

- (void)_playerItemDurationDidChange
{
  [(PXVideoScrubberController *)self _invalidateAvPlayerDuration];
  [(PXVideoScrubberController *)self _updateIfNeeded];
}

- (void)_playerDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(PXVideoScrubberController *)self target];

  if (v5 == v4)
  {
    [(PXVideoScrubberController *)self _invalidateAvPlayerCurrentTime];
    [(PXVideoScrubberController *)self _updateIfNeeded];
  }
}

- (void)_removeObservers
{
  double v3 = [(PXVideoScrubberController *)self target];
  [v3 removeTimeObserver:self->_playerObserver];

  id playerObserver = self->_playerObserver;
  self->_id playerObserver = 0;
}

- (void)_addObservers
{
  objc_initWeak(&location, self);
  double v3 = [(PXVideoScrubberController *)self target];
  objc_initWeak(&from, v3);

  id v4 = objc_loadWeakRetained(&from);
  CMTimeMakeWithSeconds(&v12, 0.03, 100);
  uint64_t v5 = MEMORY[0x1E4F14428];
  id v6 = MEMORY[0x1E4F14428];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__PXVideoScrubberController__addObservers__block_invoke;
  v9[3] = &unk_1E5DCD338;
  objc_copyWeak(&v10, &location);
  objc_copyWeak(&v11, &from);
  double v7 = [v4 addPeriodicTimeObserverForInterval:&v12 queue:v5 usingBlock:v9];
  id playerObserver = self->_playerObserver;
  self->_id playerObserver = v7;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __42__PXVideoScrubberController__addObservers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _playerDidChange:v2];
}

- (void)_setActiveSeekRequest:(id)a3
{
  uint64_t v5 = (PXScrubberSeekRequest *)a3;
  if (self->__activeSeekRequest != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->__activeSeekRequest, a3);
    [(PXVideoScrubberController *)self _invalidate];
    uint64_t v5 = v6;
  }
}

- (void)_handleTimeoutCallbackForSeekRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    id v5 = [(PXVideoScrubberController *)self _activeSeekRequest];

    id v4 = v6;
    if (v5 == v6)
    {
      [(PXVideoScrubberController *)self _updateSeeking];
      id v4 = v6;
    }
  }
}

- (void)_seekRequest:(id)a3 didFinish:(BOOL)a4
{
  id v5 = a3;
  if (v5)
  {
    id v7 = v5;
    id v6 = [(PXVideoScrubberController *)self _activeSeekRequest];

    id v5 = v7;
    if (v6 == v7)
    {
      [(PXVideoScrubberController *)self _setActiveSeekRequest:0];
      [(PXVideoScrubberController *)self _updateSeeking];
      id v5 = v7;
    }
  }
}

- (void)_updateSeeking
{
  double v3 = [(PXVideoScrubberController *)self _activeSeekRequest];
  id v4 = [(PXVideoScrubberController *)self target];
  if (v3)
  {
    id v5 = [(PXVideoScrubberController *)self _pendingSeekRequest];

    if (v5)
    {
      id v6 = [MEMORY[0x1E4F1C9C8] date];
      id v7 = [v3 dateCreated];
      [v6 timeIntervalSinceDate:v7];
      double v9 = v8;

      if (v9 >= 60.0 || v9 < 0.0)
      {
        [v4 cancelPendingSeeks];
        [(PXVideoScrubberController *)self _setActiveSeekRequest:0];

        double v3 = 0;
      }
    }
  }
  id v10 = [(PXVideoScrubberController *)self _pendingSeekRequest];
  uint64_t v11 = [v4 playerStatus];
  if (v10)
  {
    uint64_t v12 = v11;
    [v10 seekTime];
    Float64 v14 = v13;
    long long v33 = 0uLL;
    uint64_t v34 = 0;
    if (v4) {
      [v4 currentItemDuration];
    }
    memset(&time, 0, sizeof(time));
    CMTimeMakeWithSeconds(&time, v14, 100);
    if (self->_videoScrubberDelegateFlags.respondsToDesiredSeekTime)
    {
      v15 = [(PXVideoScrubberController *)self delegate];
      CMTime v31 = time;
      [v15 videoScrubberController:self desiredSeekTime:&v31];
    }
    if (!v3 && v12 == 1)
    {
      id v16 = v10;
      [(PXVideoScrubberController *)self _setActiveSeekRequest:v16];
      [(PXVideoScrubberController *)self _setPendingSeekRequest:0];
      objc_initWeak(&location, self);
      objc_initWeak(&from, v16);
      v17 = [v4 playerItem];
      CMTime v28 = time;
      if (objc_msgSend(v17, "px_loadedTimeRangesContainTime:", &v28))
      {
        *(_OWORD *)&v31.value = *MEMORY[0x1E4F1FA48];
        CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      }
      else
      {
        CMTimeMakeWithSeconds(&v28, 0.0001, 10000);
        *(_OWORD *)&v31.value = *(_OWORD *)&v28.value;
        CMTimeEpoch epoch = v28.epoch;
      }
      v31.CMTimeEpoch epoch = epoch;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __43__PXVideoScrubberController__updateSeeking__block_invoke;
      v25[3] = &unk_1E5DCD310;
      objc_copyWeak(&v26, &location);
      objc_copyWeak(&v27, &from);
      CMTime v28 = time;
      CMTime v24 = v31;
      CMTime v23 = v31;
      [v4 videoScrubberController:self seekToTime:&v28 toleranceBefore:&v24 toleranceAfter:&v23 completionHandler:v25];
      dispatch_time_t v19 = dispatch_time(0, 60000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __43__PXVideoScrubberController__updateSeeking__block_invoke_3;
      block[3] = &unk_1E5DD0838;
      objc_copyWeak(&v21, &location);
      objc_copyWeak(&v22, &from);
      dispatch_after(v19, MEMORY[0x1E4F14428], block);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&v26);

      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  [(PXVideoScrubberController *)self _updateIfNeeded];
}

void __43__PXVideoScrubberController__updateSeeking__block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PXVideoScrubberController__updateSeeking__block_invoke_2;
  block[3] = &unk_1E5DCD2E8;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  objc_copyWeak(&v6, (id *)(a1 + 40));
  char v7 = a2;
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
}

void __43__PXVideoScrubberController__updateSeeking__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleTimeoutCallbackForSeekRequest:v2];
}

void __43__PXVideoScrubberController__updateSeeking__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _seekRequest:v2 didFinish:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_seekToTime:(double)a3
{
  id v5 = [PXScrubberSeekRequest alloc];
  id v6 = [(PXVideoScrubberController *)self target];
  char v7 = [(PXScrubberSeekRequest *)v5 initWithTarget:v6 seekTime:a3];

  [(PXVideoScrubberController *)self _setPendingSeekRequest:v7];
  [(PXVideoScrubberController *)self _updateSeeking];
}

- (float)playRate
{
  id v2 = [(PXVideoScrubberController *)self target];
  [v2 playRate];
  float v4 = v3;

  return v4;
}

- (AVPlayerItem)currentPlayerItem
{
  id v2 = [(PXVideoScrubberController *)self target];
  float v3 = [v2 playerItem];

  return (AVPlayerItem *)v3;
}

- (void)endSeeking
{
  if (self->_targetFlags.respondsToDidEndSeeking) {
    [(PXVideoScrubberControllerTarget *)self->_target videoScrubberControllerDidEndSeeking:self];
  }
}

- (void)beginSeeking
{
  if (self->_targetFlags.respondsToWillBeginSeeking) {
    [(PXVideoScrubberControllerTarget *)self->_target videoScrubberControllerWillBeginSeeking:self];
  }
}

- (void)_setPlayheadProgress:(double)a3 andSeekVideoPlayer:(BOOL)a4
{
  BOOL v4 = a4;
  [(PXVideoScrubberController *)self _timeForProgress:a3];
  double v7 = v6;
  if (v4) {
    [(PXVideoScrubberController *)self _seekToTime:v6];
  }
  [(PXVideoScrubberController *)self _setPlayheadTime:v7];
}

- (void)setPlayheadProgress:(double)a3
{
}

- (double)playheadProgress
{
  [(PXVideoScrubberController *)self _playheadTime];
  -[PXVideoScrubberController _progressForTime:](self, "_progressForTime:");
  return result;
}

- (double)length
{
  [(PXVideoScrubberController *)self estimatedDuration];
  double Seconds = v3;
  memset(&v9, 0, sizeof(v9));
  id v5 = [(PXVideoScrubberController *)self target];
  double v6 = v5;
  if (v5) {
    [v5 currentItemDuration];
  }
  else {
    memset(&v9, 0, sizeof(v9));
  }

  if ((v9.flags & 0x1D) == 1)
  {
    CMTime v8 = v9;
    double Seconds = CMTimeGetSeconds(&v8);
  }
  [(PXVideoScrubberController *)self _lengthForDuration:Seconds];
  return result;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_videoScrubberDelegateFlags = &self->_videoScrubberDelegateFlags;
    p_videoScrubberDelegateFlags->respondsToDidUpdate = objc_opt_respondsToSelector() & 1;
    p_videoScrubberDelegateFlags->respondsToLengthForDuration = objc_opt_respondsToSelector() & 1;
    p_videoScrubberDelegateFlags->respondsToDesiredSeekTime = objc_opt_respondsToSelector() & 1;
  }
}

- (void)dealloc
{
  [(PXVideoScrubberController *)self _removeObservers];
  v3.receiver = self;
  v3.super_class = (Class)PXVideoScrubberController;
  [(PXVideoScrubberController *)&v3 dealloc];
}

- (PXVideoScrubberController)initWithTarget:(id)a3 estimatedDuration:(double)a4
{
  id v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PXVideoScrubberController;
  CMTime v9 = [(PXVideoScrubberController *)&v22 init];
  if (v9)
  {
    if (!v8)
    {
      Float64 v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, v9, @"PXVideoScrubberController.m", 69, @"Invalid parameter not satisfying: %@", @"target != nil" object file lineNumber description];
    }
    *((double *)v9 + 16) = a4;
    objc_storeStrong((id *)v9 + 15, a3);
    objc_initWeak(&location, v9);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __62__PXVideoScrubberController_initWithTarget_estimatedDuration___block_invoke;
    v19[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v20, &location);
    [v8 setDurationChangeHandler:v19];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62__PXVideoScrubberController_initWithTarget_estimatedDuration___block_invoke_2;
    v17[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v18, &location);
    [v8 setStatusChangeHandler:v17];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__PXVideoScrubberController_initWithTarget_estimatedDuration___block_invoke_3;
    v15[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v16, &location);
    [v8 setPlayerItemChangeHandler:v15];
    v9[104] = 1;
    v9[105] = 1;
    v9[106] = 1;
    id v10 = (long long *)MEMORY[0x1E4F1F9F8];
    uint64_t v11 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    *((void *)v9 + 22) = v11;
    long long v12 = *v10;
    *((_OWORD *)v9 + 10) = *v10;
    *(_OWORD *)(v9 + 184) = v12;
    *((void *)v9 + 25) = v11;
    [v9 _addObservers];
    [v9 _updateIfNeeded];
    v9[110] = objc_opt_respondsToSelector() & 1;
    v9[111] = objc_opt_respondsToSelector() & 1;
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return (PXVideoScrubberController *)v9;
}

void __62__PXVideoScrubberController_initWithTarget_estimatedDuration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _playerItemDurationDidChange];
}

void __62__PXVideoScrubberController_initWithTarget_estimatedDuration___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _playerStatusDidChange];
}

void __62__PXVideoScrubberController_initWithTarget_estimatedDuration___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _playerItemDidChange];
}

- (PXVideoScrubberController)init
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXVideoScrubberController.m", 63, @"%s is not available as initializer", "-[PXVideoScrubberController init]");

  abort();
}

@end