@interface PXSimpleVideoScrubberControllerTarget
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentItemDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playerCurrentTime;
- (AVPlayer)videoPlayer;
- (PXSimpleVideoScrubberControllerTarget)init;
- (PXSimpleVideoScrubberControllerTarget)initWithVideoPlayer:(id)a3;
- (float)playRate;
- (id)addPeriodicTimeObserverForInterval:(id *)a3 queue:(id)a4 usingBlock:(id)a5;
- (id)durationChangeHandler;
- (id)playerItem;
- (id)playerItemChangeHandler;
- (id)statusChangeHandler;
- (int64_t)playerStatus;
- (void)cancelPendingSeeks;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeTimeObserver:(id)a3;
- (void)setDurationChangeHandler:(id)a3;
- (void)setPlayerItemChangeHandler:(id)a3;
- (void)setStatusChangeHandler:(id)a3;
- (void)videoScrubberController:(id)a3 seekToTime:(id *)a4 toleranceBefore:(id *)a5 toleranceAfter:(id *)a6 completionHandler:(id)a7;
@end

@implementation PXSimpleVideoScrubberControllerTarget

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong(&self->playerItemChangeHandler, 0);
  objc_storeStrong(&self->durationChangeHandler, 0);
  objc_storeStrong(&self->statusChangeHandler, 0);
}

- (AVPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (void)setPlayerItemChangeHandler:(id)a3
{
}

- (id)playerItemChangeHandler
{
  return self->playerItemChangeHandler;
}

- (void)setDurationChangeHandler:(id)a3
{
}

- (id)durationChangeHandler
{
  return self->durationChangeHandler;
}

- (void)setStatusChangeHandler:(id)a3
{
}

- (id)statusChangeHandler
{
  return self->statusChangeHandler;
}

- (void)cancelPendingSeeks
{
}

- (void)videoScrubberController:(id)a3 seekToTime:(id *)a4 toleranceBefore:(id *)a5 toleranceAfter:(id *)a6 completionHandler:(id)a7
{
  videoPlayer = self->_videoPlayer;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a6;
  [(AVPlayer *)videoPlayer seekToTime:&v10 toleranceBefore:&v9 toleranceAfter:&v8 completionHandler:a7];
}

- (id)addPeriodicTimeObserverForInterval:(id *)a3 queue:(id)a4 usingBlock:(id)a5
{
  videoPlayer = self->_videoPlayer;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
  v6 = [(AVPlayer *)videoPlayer addPeriodicTimeObserverForInterval:&v8 queue:a4 usingBlock:a5];
  return v6;
}

- (void)removeTimeObserver:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentItemDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var1;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playerCurrentTime
{
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_videoPlayer;
  if (result) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result currentTime];
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (int64_t)playerStatus
{
  return [(AVPlayer *)self->_videoPlayer status];
}

- (id)playerItem
{
  return [(AVPlayer *)self->_videoPlayer currentItem];
}

- (float)playRate
{
  [(AVPlayer *)self->_videoPlayer rate];
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  if ((void *)avPlayerObservationContext != a6)
  {
    v19.receiver = self;
    v19.super_class = (Class)PXSimpleVideoScrubberControllerTarget;
    [(PXSimpleVideoScrubberControllerTarget *)&v19 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
    goto LABEL_16;
  }
  if ([v10 isEqualToString:@"status"])
  {
    v12 = [(PXSimpleVideoScrubberControllerTarget *)self statusChangeHandler];

    if (v12)
    {
      uint64_t v13 = [(PXSimpleVideoScrubberControllerTarget *)self statusChangeHandler];
LABEL_15:
      v18 = (void *)v13;
      (*(void (**)(void))(v13 + 16))();

      goto LABEL_16;
    }
  }
  if ([v10 isEqualToString:@"currentItem.duration"])
  {
    v14 = [(PXSimpleVideoScrubberControllerTarget *)self durationChangeHandler];

    if (v14)
    {
      v15 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
      v16 = v15;
      if (v15)
      {
        [v15 CMTimeValue];
      }
      else
      {
        long long v20 = 0uLL;
        int64_t v21 = 0;
      }
      *(_OWORD *)&self->_currentItemDuration.value = v20;
      self->_currentItemDuration.epoch = v21;

      uint64_t v13 = [(PXSimpleVideoScrubberControllerTarget *)self durationChangeHandler];
      goto LABEL_15;
    }
  }
  if ([v10 isEqualToString:@"currentItem"])
  {
    v17 = [(PXSimpleVideoScrubberControllerTarget *)self playerItemChangeHandler];

    if (v17)
    {
      uint64_t v13 = [(PXSimpleVideoScrubberControllerTarget *)self playerItemChangeHandler];
      goto LABEL_15;
    }
  }
LABEL_16:
}

- (void)dealloc
{
  [(AVPlayer *)self->_videoPlayer removeObserver:self forKeyPath:@"status" context:avPlayerObservationContext];
  [(AVPlayer *)self->_videoPlayer removeObserver:self forKeyPath:@"currentItem.duration" context:avPlayerObservationContext];
  [(AVPlayer *)self->_videoPlayer removeObserver:self forKeyPath:@"currentItem" context:avPlayerObservationContext];
  v3.receiver = self;
  v3.super_class = (Class)PXSimpleVideoScrubberControllerTarget;
  [(PXSimpleVideoScrubberControllerTarget *)&v3 dealloc];
}

- (PXSimpleVideoScrubberControllerTarget)initWithVideoPlayer:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXSimpleVideoScrubberControllerTarget;
  v6 = [(PXSimpleVideoScrubberControllerTarget *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_videoPlayer, a3);
    [(AVPlayer *)v7->_videoPlayer addObserver:v7 forKeyPath:@"status" options:0 context:avPlayerObservationContext];
    [(AVPlayer *)v7->_videoPlayer addObserver:v7 forKeyPath:@"currentItem" options:0 context:avPlayerObservationContext];
    [(AVPlayer *)v7->_videoPlayer addObserver:v7 forKeyPath:@"currentItem.duration" options:1 context:avPlayerObservationContext];
    uint64_t v8 = MEMORY[0x1E4F1F9F0];
    *(_OWORD *)&v7->_currentItemDuration.value = *MEMORY[0x1E4F1F9F0];
    v7->_currentItemDuration.epoch = *(void *)(v8 + 16);
  }

  return v7;
}

- (PXSimpleVideoScrubberControllerTarget)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXVideoScrubberController.m", 462, @"%s is not available as initializer", "-[PXSimpleVideoScrubberControllerTarget init]");

  abort();
}

@end