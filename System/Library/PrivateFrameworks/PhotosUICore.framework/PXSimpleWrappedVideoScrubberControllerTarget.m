@interface PXSimpleWrappedVideoScrubberControllerTarget
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentItemDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playerCurrentTime;
- (ISWrappedAVPlayer)videoPlayer;
- (PXSimpleWrappedVideoScrubberControllerTarget)init;
- (PXSimpleWrappedVideoScrubberControllerTarget)initWithVideoPlayer:(id)a3;
- (float)playRate;
- (id)addPeriodicTimeObserverForInterval:(id *)a3 queue:(id)a4 usingBlock:(id)a5;
- (id)durationChangeHandler;
- (id)playerItem;
- (id)playerItemChangeHandler;
- (id)statusChangeHandler;
- (int64_t)playerStatus;
- (void)cancelPendingSeeks;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)removeTimeObserver:(id)a3;
- (void)setDurationChangeHandler:(id)a3;
- (void)setPlayerItemChangeHandler:(id)a3;
- (void)setStatusChangeHandler:(id)a3;
- (void)videoScrubberController:(id)a3 seekToTime:(id *)a4 toleranceBefore:(id *)a5 toleranceAfter:(id *)a6 completionHandler:(id)a7;
@end

@implementation PXSimpleWrappedVideoScrubberControllerTarget

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong(&self->durationChangeHandler, 0);
  objc_storeStrong(&self->playerItemChangeHandler, 0);
  objc_storeStrong(&self->statusChangeHandler, 0);
}

- (ISWrappedAVPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (void)setDurationChangeHandler:(id)a3
{
}

- (id)durationChangeHandler
{
  return self->durationChangeHandler;
}

- (void)setPlayerItemChangeHandler:(id)a3
{
}

- (id)playerItemChangeHandler
{
  return self->playerItemChangeHandler;
}

- (void)setStatusChangeHandler:(id)a3
{
}

- (id)statusChangeHandler
{
  return self->statusChangeHandler;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)wrappedPlayerObservationContext == a5) {
    px_dispatch_on_main_queue();
  }
}

void __77__PXSimpleWrappedVideoScrubberControllerTarget_observable_didChange_context___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    v2 = [*(id *)(a1 + 32) statusChangeHandler];

    if (v2)
    {
      v3 = [*(id *)(a1 + 32) statusChangeHandler];
      v3[2]();
    }
  }
  if ((*(unsigned char *)(a1 + 41) & 2) != 0)
  {
    v4 = [*(id *)(a1 + 32) durationChangeHandler];

    if (v4)
    {
      v5 = [*(id *)(a1 + 32) durationChangeHandler];
      v5[2]();
    }
  }
  if ((*(unsigned char *)(a1 + 40) & 4) != 0)
  {
    v6 = [*(id *)(a1 + 32) playerItemChangeHandler];

    if (v6)
    {
      v7 = [*(id *)(a1 + 32) playerItemChangeHandler];
      v7[2]();
    }
  }
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
  [(ISWrappedAVPlayer *)videoPlayer seekToTime:&v10 toleranceBefore:&v9 toleranceAfter:&v8 completionHandler:a7];
}

- (id)addPeriodicTimeObserverForInterval:(id *)a3 queue:(id)a4 usingBlock:(id)a5
{
  videoPlayer = self->_videoPlayer;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
  v6 = [(ISWrappedAVPlayer *)videoPlayer addPeriodicTimeObserverForInterval:&v8 queue:a4 usingBlock:a5];
  return v6;
}

- (void)removeTimeObserver:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentItemDuration
{
  v4 = [(ISWrappedAVPlayer *)self->_videoPlayer currentItem];
  if (v4)
  {
    v6 = v4;
    [v4 duration];
    v4 = v6;
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
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
  return [(ISWrappedAVPlayer *)self->_videoPlayer status];
}

- (id)playerItem
{
  return (id)[(ISWrappedAVPlayer *)self->_videoPlayer currentItem];
}

- (float)playRate
{
  [(ISWrappedAVPlayer *)self->_videoPlayer rate];
  return result;
}

- (PXSimpleWrappedVideoScrubberControllerTarget)initWithVideoPlayer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSimpleWrappedVideoScrubberControllerTarget;
  v6 = [(PXSimpleWrappedVideoScrubberControllerTarget *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_videoPlayer, a3);
    [v5 registerChangeObserver:v7 context:wrappedPlayerObservationContext];
  }

  return v7;
}

- (PXSimpleWrappedVideoScrubberControllerTarget)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXVideoScrubberController.m", 552, @"%s is not available as initializer", "-[PXSimpleWrappedVideoScrubberControllerTarget init]");

  abort();
}

@end