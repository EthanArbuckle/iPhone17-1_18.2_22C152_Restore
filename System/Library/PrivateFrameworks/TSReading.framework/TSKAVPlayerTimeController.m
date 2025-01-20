@interface TSKAVPlayerTimeController
- (TSKAVPlayerController)playerController;
- (TSKAVPlayerTimeController)initWithPlayerController:(id)a3;
- (double)absoluteCurrentTime;
- (double)currentTime;
- (double)remainingTime;
- (double)updateInterval;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)p_beginScrubbingIfNeeded;
- (void)p_createTimeObserver;
- (void)p_endScrubbing;
- (void)p_setTimeValuesWithoutScrubbing;
- (void)p_teardownTimeObserver;
- (void)setAbsoluteCurrentTime:(double)a3;
- (void)setCurrentTime:(double)a3;
- (void)setUpdateInterval:(double)a3;
- (void)startObservingTime;
- (void)stopObservingTime;
@end

@implementation TSKAVPlayerTimeController

- (TSKAVPlayerTimeController)initWithPlayerController:(id)a3
{
  if (!a3)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSKAVPlayerTimeController initWithPlayerController:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerTimeController.m"), 40, @"Invalid parameter not satisfying: %s", "playerController != nil");
  }
  v9.receiver = self;
  v9.super_class = (Class)TSKAVPlayerTimeController;
  v7 = [(TSKAVPlayerTimeController *)&v9 init];
  if (v7)
  {
    v7->mPlayerController = (TSKAVPlayerController *)a3;
    [(TSKAVPlayerTimeController *)v7 setUpdateInterval:1.0];
    [(TSKAVPlayerController *)v7->mPlayerController addObserver:v7 forKeyPath:@"player.currentItem.status" options:4 context:TSKAVPlayerTimeControllerPlayerItemStatusObserverContext];
    v7->mObservingPlayerStatus = 1;
  }
  return v7;
}

- (void)dealloc
{
  if (self->mObservingPlayerStatus) {
    [(TSKAVPlayerController *)self->mPlayerController removeObserver:self forKeyPath:@"player.currentItem.status" context:TSKAVPlayerTimeControllerPlayerItemStatusObserverContext];
  }
  if (self->mTimeObserver)
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSKAVPlayerTimeController dealloc]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerTimeController.m"), 56, @"expected nil value for '%s'", "mTimeObserver");
  }

  v5.receiver = self;
  v5.super_class = (Class)TSKAVPlayerTimeController;
  [(TSKAVPlayerTimeController *)&v5 dealloc];
}

- (void)startObservingTime
{
  if (self->mTimeObserver)
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSKAVPlayerTimeController startObservingTime]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerTimeController.m"), 67, @"expected nil value for '%s'", "mTimeObserver");
  }
  [(TSKAVPlayerTimeController *)self p_createTimeObserver];

  [(TSKAVPlayerTimeController *)self p_setTimeValuesWithoutScrubbing];
}

- (void)stopObservingTime
{
  [(TSKAVPlayerTimeController *)self p_teardownTimeObserver];

  [(TSKAVPlayerTimeController *)self p_setTimeValuesWithoutScrubbing];
}

- (void)p_createTimeObserver
{
  if (self->mTimeObserver)
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSKAVPlayerTimeController p_createTimeObserver]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerTimeController.m"), 84, @"expected nil value for '%s'", "mTimeObserver");
  }
  objc_super v5 = [(TSKAVPlayerController *)[(TSKAVPlayerTimeController *)self playerController] player];
  CMTimeMakeWithSeconds(&v10, self->mUpdateInterval, 90000);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__TSKAVPlayerTimeController_p_createTimeObserver__block_invoke;
  v9[3] = &unk_2646B0C60;
  v9[4] = self;
  id v6 = [(AVPlayer *)v5 addPeriodicTimeObserverForInterval:&v10 queue:MEMORY[0x263EF83A0] usingBlock:v9];
  self->mTimeObserver = v6;
  if (!v6)
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSKAVPlayerTimeController p_createTimeObserver]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerTimeController.m"), 90, @"invalid nil value for '%s'", "mTimeObserver");
  }
}

uint64_t __49__TSKAVPlayerTimeController_p_createTimeObserver__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_setTimeValuesWithoutScrubbing");
}

- (void)p_teardownTimeObserver
{
  if (self->mTimeObserver
    || (v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler],
        uint64_t v4 = [NSString stringWithUTF8String:"-[TSKAVPlayerTimeController p_teardownTimeObserver]"], objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerTimeController.m"), 95, @"invalid nil value for '%s'", "mTimeObserver"), self->mTimeObserver))
  {
    [[(TSKAVPlayerController *)[(TSKAVPlayerTimeController *)self playerController] player] removeTimeObserver:self->mTimeObserver];

    self->mTimeObserver = 0;
  }
}

- (void)p_setTimeValuesWithoutScrubbing
{
  [(TSKAVPlayerTimeController *)self willChangeValueForKey:@"absoluteCurrentTime"];
  [(TSKAVPlayerController *)[(TSKAVPlayerTimeController *)self playerController] absoluteCurrentTime];
  self->mAbsoluteCurrentTime = v3;
  [(TSKAVPlayerTimeController *)self didChangeValueForKey:@"absoluteCurrentTime"];
  [(TSKAVPlayerTimeController *)self willChangeValueForKey:@"currentTime"];
  [(TSKAVPlayerController *)[(TSKAVPlayerTimeController *)self playerController] currentTime];
  self->mCurrentTime = v4;
  [(TSKAVPlayerTimeController *)self didChangeValueForKey:@"currentTime"];
  [(TSKAVPlayerTimeController *)self willChangeValueForKey:@"remainingTime"];
  [(TSKAVPlayerController *)[(TSKAVPlayerTimeController *)self playerController] remainingTime];
  self->mRemainingTime = v5;

  [(TSKAVPlayerTimeController *)self didChangeValueForKey:@"remainingTime"];
}

- (void)setUpdateInterval:(double)a3
{
  if (self->mUpdateInterval != a3)
  {
    if (a3 < 0.0166666675) {
      a3 = 0.0166666675;
    }
    self->mUpdateInterval = a3;
    if (self->mTimeObserver)
    {
      [(TSKAVPlayerTimeController *)self p_teardownTimeObserver];
      [(TSKAVPlayerTimeController *)self p_createTimeObserver];
      [(TSKAVPlayerTimeController *)self p_setTimeValuesWithoutScrubbing];
    }
  }
}

- (void)setAbsoluteCurrentTime:(double)a3
{
  self->double mAbsoluteCurrentTime = a3;
  [(TSKAVPlayerTimeController *)self p_beginScrubbingIfNeeded];
  double mUpdateInterval = self->mUpdateInterval;
  mPlayerController = self->mPlayerController;
  double mAbsoluteCurrentTime = self->mAbsoluteCurrentTime;

  [(TSKAVPlayerController *)mPlayerController scrubToTime:mAbsoluteCurrentTime withTolerance:mUpdateInterval];
}

- (void)setCurrentTime:(double)a3
{
  self->mCurrentTime = a3;
  [(TSKAVPlayerTimeController *)self p_beginScrubbingIfNeeded];
  double mUpdateInterval = self->mUpdateInterval;
  [(TSKAVPlayerController *)self->mPlayerController startTime];
  double v7 = v6 + a3;
  mPlayerController = self->mPlayerController;

  [(TSKAVPlayerController *)mPlayerController scrubToTime:v7 withTolerance:mUpdateInterval];
}

- (void)p_beginScrubbingIfNeeded
{
  v4[1] = *MEMORY[0x263EF8340];
  double v3 = [(TSKAVPlayerTimeController *)self playerController];
  if (![(TSKAVPlayerController *)v3 isScrubbing])
  {
    [(TSKAVPlayerController *)v3 beginScrubbing];
    v4[0] = *MEMORY[0x263EFF478];
    -[TSKAVPlayerTimeController performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel_p_endScrubbing, 0, [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1], 0.0);
  }
}

- (void)p_endScrubbing
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)TSKAVPlayerTimeControllerPlayerItemStatusObserverContext == a6)
  {
    if ([(AVPlayerItem *)[[(TSKAVPlayerController *)[(TSKAVPlayerTimeController *)self playerController] player] currentItem] status] == AVPlayerItemStatusReadyToPlay)
    {
      [(TSKAVPlayerTimeController *)self p_setTimeValuesWithoutScrubbing];
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TSKAVPlayerTimeController;
    -[TSKAVPlayerTimeController observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (double)absoluteCurrentTime
{
  return self->mAbsoluteCurrentTime;
}

- (double)currentTime
{
  return self->mCurrentTime;
}

- (double)remainingTime
{
  return self->mRemainingTime;
}

- (double)updateInterval
{
  return self->mUpdateInterval;
}

- (TSKAVPlayerController)playerController
{
  return self->mPlayerController;
}

@end