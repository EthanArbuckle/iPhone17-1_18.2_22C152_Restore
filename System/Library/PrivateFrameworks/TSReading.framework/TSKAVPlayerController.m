@interface TSKAVPlayerController
+ (BOOL)automaticallyNotifiesObserversOfEndTime;
+ (BOOL)automaticallyNotifiesObserversOfStartTime;
+ (id)keyPathsForValuesAffectingAbsoluteDuration;
+ (id)keyPathsForValuesAffectingDuration;
+ (id)keyPathsForValuesAffectingEndTime;
+ (id)keyPathsForValuesAffectingStartTime;
- (AVPlayer)player;
- (BOOL)canPlay;
- (BOOL)isFastForwarding;
- (BOOL)isFastReversing;
- (BOOL)isPlaying;
- (BOOL)isScrubbing;
- (BOOL)p_canFastForward;
- (BOOL)p_canFastReverse;
- (TSKAVPlayerController)init;
- (TSKAVPlayerController)initWithPlayer:(id)a3 delegate:(id)a4;
- (TSKAVPlayerControllerDelegate)delegate;
- (double)absoluteCurrentTime;
- (double)absoluteDuration;
- (double)currentTime;
- (double)duration;
- (double)endTime;
- (double)remainingTime;
- (double)startTime;
- (float)volume;
- (int64_t)repeatMode;
- (void)addAdditionalReference;
- (void)beginScrubbing;
- (void)dealloc;
- (void)endScrubbing;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)p_applicationDidResignActive;
- (void)p_applyVolumeToPlayerItem;
- (void)p_playbackDidFailWithError:(id)a3;
- (void)p_playerItemDidPlayToEndTime:(id)a3;
- (void)p_startObservingClosedCaptionDisplayEnabled;
- (void)p_stopObservingClosedCaptionDisplayEnabled;
- (void)p_updateClosedCaptionDisplayEnabled;
- (void)playerItemDidPlayToEndTimeAtRate:(float)a3;
- (void)scrubToTime:(double)a3 withTolerance:(double)a4;
- (void)scrubToTime:(double)a3 withTolerance:(double)a4 completionHandler:(id)a5;
- (void)seekBackwardByOneFrame;
- (void)seekForwardByOneFrame;
- (void)seekToBeginning;
- (void)seekToEnd;
- (void)setAbsoluteCurrentTime:(double)a3;
- (void)setEndTime:(double)a3;
- (void)setFastForwarding:(BOOL)a3;
- (void)setFastReversing:(BOOL)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setRepeatMode:(int64_t)a3;
- (void)setStartTime:(double)a3;
- (void)setVolume:(float)a3;
- (void)teardown;
@end

@implementation TSKAVPlayerController

- (TSKAVPlayerController)initWithPlayer:(id)a3 delegate:(id)a4
{
  if (!a3)
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSKAVPlayerController initWithPlayer:delegate:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerController.m"), 59, @"Invalid parameter not satisfying: %s", "player != nil");
  }
  v13.receiver = self;
  v13.super_class = (Class)TSKAVPlayerController;
  v9 = [(TSKAVPlayerController *)&v13 init];
  v10 = v9;
  if (v9)
  {
    v9->mRepeatMode = 0;
    v9->mVolume = 1.0;
    v9->mDelegate = (TSKAVPlayerControllerDelegate *)a4;
    v11 = (AVPlayer *)a3;
    v10->mPlayer = v11;
    [(AVPlayer *)v11 setActionAtItemEnd:2];
    [(AVPlayer *)v10->mPlayer addObserver:v10 forKeyPath:@"currentItem" options:7 context:TSKAVPlayerControllerAVPlayerCurrentItemObserverContext];
    [(AVPlayer *)v10->mPlayer addObserver:v10 forKeyPath:@"rate" options:7 context:TSKAVPlayerControllerAVPlayerRateObserverContext];
    [(TSKAVPlayerController *)v10 p_startObservingClosedCaptionDisplayEnabled];
  }
  return v10;
}

- (TSKAVPlayerController)init
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSKAVPlayerController init]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerController.m"), 82, @"Do not call method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[TSKAVPlayerController init]"), 0 reason userInfo]);
}

- (void)dealloc
{
  if (self->mDelegate)
  {
    uint64_t v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSKAVPlayerController dealloc]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerController.m"), 88, @"-teardown must be called before dealloc");
  }

  v5.receiver = self;
  v5.super_class = (Class)TSKAVPlayerController;
  [(TSKAVPlayerController *)&v5 dealloc];
}

- (void)addAdditionalReference
{
}

- (void)teardown
{
  unint64_t mAdditionalReferences = self->mAdditionalReferences;
  if (mAdditionalReferences)
  {
    self->unint64_t mAdditionalReferences = mAdditionalReferences - 1;
  }
  else
  {
    if ([(TSKAVPlayerController *)self isPlaying]
      || [(TSKAVPlayerController *)self isFastReversing]
      || [(TSKAVPlayerController *)self isFastForwarding])
    {
      uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"-[TSKAVPlayerController teardown]"];
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerController.m"), 107, @"player controller should not be playing when it is told to teardown");
    }
    [(TSKAVPlayerController *)self p_stopObservingClosedCaptionDisplayEnabled];
    v6 = [(TSKAVPlayerController *)self player];
    [(AVPlayer *)v6 setRate:0.0];
    uint64_t v7 = [(AVPlayer *)v6 currentItem];
    if (v7)
    {
      uint64_t v8 = v7;
      v9 = (void *)[MEMORY[0x263F08A00] defaultCenter];
      [v9 removeObserver:self name:*MEMORY[0x263EFA050] object:v8];
    }
    [(AVPlayer *)v6 removeObserver:self forKeyPath:@"currentItem" context:TSKAVPlayerControllerAVPlayerCurrentItemObserverContext];
    [(AVPlayer *)v6 removeObserver:self forKeyPath:@"rate" context:TSKAVPlayerControllerAVPlayerRateObserverContext];
    [(AVPlayer *)v6 replaceCurrentItemWithPlayerItem:0];

    self->mDelegate = 0;
  }
}

- (double)duration
{
  uint64_t v3 = [[(TSKAVPlayerController *)self player] currentItem];
  if (!v3) {
    return NAN;
  }
  memset(&v8[1], 0, sizeof(CMTime));
  [(AVPlayerItem *)v3 duration];
  if ((unsigned __int128)0 >> 96 != 1) {
    return NAN;
  }
  [(TSKAVPlayerController *)self endTime];
  v8[0] = v8[1];
  double v5 = fmin(v4, CMTimeGetSeconds(v8));
  [(TSKAVPlayerController *)self startTime];
  return fmax(v5 - v6, 0.0);
}

+ (id)keyPathsForValuesAffectingDuration
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"player.currentItem.duration", @"startTime", @"endTime", 0);
}

- (double)absoluteDuration
{
  v2 = [[(TSKAVPlayerController *)self player] currentItem];
  if (!v2) {
    return NAN;
  }
  memset(&v4[1], 0, sizeof(CMTime));
  [(AVPlayerItem *)v2 duration];
  if ((unsigned __int128)0 >> 96 != 1) {
    return NAN;
  }
  v4[0] = v4[1];
  return CMTimeGetSeconds(v4);
}

+ (id)keyPathsForValuesAffectingAbsoluteDuration
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"player.currentItem.duration", 0);
}

- (double)startTime
{
  v2 = [[(TSKAVPlayerController *)self player] currentItem];
  if (!v2) {
    return NAN;
  }
  memset(&v4[1], 0, sizeof(CMTime));
  [(AVPlayerItem *)v2 reversePlaybackEndTime];
  double result = 0.0;
  if ((unsigned __int128)0 >> 96 == 1)
  {
    v4[0] = v4[1];
    return CMTimeGetSeconds(v4);
  }
  return result;
}

- (void)setStartTime:(double)a3
{
  double v4 = [[(TSKAVPlayerController *)self player] currentItem];
  if (v4)
  {
    double v5 = v4;
    memset(&v10, 0, sizeof(v10));
    CMTimeMakeWithSeconds(&v10, a3, 90000);
    memset(&v9, 0, sizeof(v9));
    [(AVPlayerItem *)v5 currentTime];
    CMTime time1 = v9;
    CMTime time2 = v10;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      CMTime time1 = v10;
      CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
      CMTime v6 = time2;
      [(AVPlayerItem *)v5 seekToTime:&time1 toleranceBefore:&time2 toleranceAfter:&v6];
    }
    CMTime time1 = v10;
    [(AVPlayerItem *)v5 setReversePlaybackEndTime:&time1];
  }
}

+ (BOOL)automaticallyNotifiesObserversOfStartTime
{
  return 0;
}

+ (id)keyPathsForValuesAffectingStartTime
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"player.currentItem.reversePlaybackEndTime"];
}

- (double)endTime
{
  v2 = [[(TSKAVPlayerController *)self player] currentItem];
  if (!v2) {
    return NAN;
  }
  uint64_t v3 = v2;
  long long v10 = 0uLL;
  uint64_t v11 = 0;
  [(AVPlayerItem *)v2 forwardPlaybackEndTime];
  if ((unsigned __int128)0 >> 96 == 1)
  {
    long long v8 = v10;
    uint64_t v9 = v11;
    p_CMTime time = (CMTime *)&v8;
  }
  else
  {
    CMTime v6 = [(AVPlayerItem *)v3 asset];
    if (v6) {
      [(AVAsset *)v6 duration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    p_CMTime time = &time;
  }
  return CMTimeGetSeconds(p_time);
}

- (void)setEndTime:(double)a3
{
  double v4 = [[(TSKAVPlayerController *)self player] currentItem];
  if (v4)
  {
    double v5 = v4;
    memset(&v10, 0, sizeof(v10));
    CMTimeMakeWithSeconds(&v10, a3, 90000);
    memset(&v9, 0, sizeof(v9));
    [(AVPlayerItem *)v5 currentTime];
    CMTime time1 = v9;
    CMTime time2 = v10;
    if (CMTimeCompare(&time1, &time2) >= 1)
    {
      CMTime time1 = v10;
      CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
      CMTime v6 = time2;
      [(AVPlayerItem *)v5 seekToTime:&time1 toleranceBefore:&time2 toleranceAfter:&v6];
    }
    CMTime time1 = v10;
    [(AVPlayerItem *)v5 setForwardPlaybackEndTime:&time1];
  }
}

+ (BOOL)automaticallyNotifiesObserversOfEndTime
{
  return 0;
}

+ (id)keyPathsForValuesAffectingEndTime
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"player.currentItem.forwardPlaybackEndTime", @"player.currentItem.asset.duration", 0);
}

- (void)setRepeatMode:(int64_t)a3
{
  if (self->mRepeatMode != a3)
  {
    self->mRepeatMode = a3;
    double v4 = [(TSKAVPlayerController *)self player];
    if (self->mRepeatMode != 2)
    {
      double v5 = v4;
      [(AVPlayer *)v4 rate];
      if (*(float *)&v6 < 0.0)
      {
        LODWORD(v6) = 1.0;
        [(AVPlayer *)v5 setRate:v6];
      }
    }
  }
}

- (void)setVolume:(float)a3
{
  if (self->mVolume != a3)
  {
    self->mVolume = a3;
    [(TSKAVPlayerController *)self p_applyVolumeToPlayerItem];
  }
}

- (void)p_applyVolumeToPlayerItem
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  [(TSKAVPlayerController *)self volume];
  float v4 = v3;
  double v5 = [[(TSKAVPlayerController *)self player] currentItem];
  if (v5)
  {
    double v6 = v5;
    if (v4 == 1.0)
    {
      v17 = 0;
    }
    else
    {
      id v18 = objc_alloc_init(MEMORY[0x263EFA778]);
      uint64_t v7 = [(AVPlayerItem *)v6 asset];
      long long v8 = [(AVAsset *)v7 tracksWithMediaType:*MEMORY[0x263EF9CE8]];
      CMTime v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSArray count](v8, "count"));
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v23;
        long long v19 = *MEMORY[0x263F010E0];
        uint64_t v13 = *(void *)(MEMORY[0x263F010E0] + 16);
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(v8);
            }
            v15 = *(void **)(*((void *)&v22 + 1) + 8 * v14);
            id v16 = objc_alloc_init(MEMORY[0x263EFA780]);
            objc_msgSend(v16, "setTrackID:", objc_msgSend(v15, "trackID"));
            long long v20 = v19;
            uint64_t v21 = v13;
            objc_msgSend(v16, "setVolume:atTime:", &v20, COERCE_DOUBLE(__PAIR64__(DWORD1(v19), LODWORD(v4))));
            [v9 addObject:v16];

            ++v14;
          }
          while (v11 != v14);
          uint64_t v11 = [(NSArray *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v11);
      }
      v17 = v18;
      [v18 setInputParameters:v9];
    }
    [(AVPlayerItem *)v6 setAudioMix:v17];
  }
}

- (double)absoluteCurrentTime
{
  self->_absoluteCurrentTime = 0.0;
  float v3 = [[(TSKAVPlayerController *)self player] currentItem];
  if (v3)
  {
    float v4 = v3;
    if ([(AVPlayerItem *)v3 status] == AVPlayerItemStatusReadyToPlay)
    {
      [(AVPlayerItem *)v4 currentTime];
      self->_absoluteCurrentTime = fmax(CMTimeGetSeconds(&time), 0.0);
    }
  }
  return self->_absoluteCurrentTime;
}

- (double)currentTime
{
  float v3 = [[(TSKAVPlayerController *)self player] currentItem];
  double v4 = 0.0;
  if (v3)
  {
    double v5 = v3;
    if ([(AVPlayerItem *)v3 status] == AVPlayerItemStatusReadyToPlay)
    {
      [(AVPlayerItem *)v5 currentTime];
      CMTimeGetSeconds(&time);
      [(TSKAVPlayerController *)self startTime];
      [(TSKAVPlayerController *)self endTime];
      TSUClamp();
      return v6;
    }
  }
  return v4;
}

- (double)remainingTime
{
  float v3 = [[(TSKAVPlayerController *)self player] currentItem];
  double v4 = 0.0;
  if (v3)
  {
    double v5 = v3;
    if ([(AVPlayerItem *)v3 status] == AVPlayerItemStatusReadyToPlay)
    {
      [(TSKAVPlayerController *)self endTime];
      double v7 = v6;
      [(AVPlayerItem *)v5 currentTime];
      return fmax(v7 - fmax(CMTimeGetSeconds(&time), 0.0), 0.0);
    }
  }
  return v4;
}

- (BOOL)isScrubbing
{
  return self->mScrubbingCount != 0;
}

- (void)beginScrubbing
{
  unint64_t mScrubbingCount = self->mScrubbingCount;
  if (mScrubbingCount)
  {
    self->unint64_t mScrubbingCount = mScrubbingCount + 1;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"TSKAVPlayerControllerWillBeginScrubbingNotification", self);
    unint64_t v4 = self->mScrubbingCount;
    self->unint64_t mScrubbingCount = v4 + 1;
    if (!v4)
    {
      double v5 = [(TSKAVPlayerController *)self player];
      [(AVPlayer *)v5 rate];
      self->mRateBeforeScrubbing = v6;
      [(AVPlayer *)v5 setRate:0.0];
    }
  }
}

- (void)scrubToTime:(double)a3 withTolerance:(double)a4
{
}

- (void)scrubToTime:(double)a3 withTolerance:(double)a4 completionHandler:(id)a5
{
  if (![(TSKAVPlayerController *)self isScrubbing])
  {
    CMTime v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSKAVPlayerController scrubToTime:withTolerance:completionHandler:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerController.m"), 416, @"scrubbed to time when not in a scrubbing operation");
  }
  uint64_t v11 = [(TSKAVPlayerController *)self player];
  CMTimeMakeWithSeconds(&v14, a3, 90000);
  CMTimeMakeWithSeconds(&v13, a4, 90000);
  CMTimeMakeWithSeconds(&v12, a4, 90000);
  [(AVPlayer *)v11 seekToTime:&v14 toleranceBefore:&v13 toleranceAfter:&v12 completionHandler:a5];
}

- (void)endScrubbing
{
  unint64_t mScrubbingCount = self->mScrubbingCount;
  if (mScrubbingCount
    || (unint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler],
        uint64_t v5 = [NSString stringWithUTF8String:"-[TSKAVPlayerController endScrubbing]"],
        objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerController.m"), 423, @"Uneven begin/end scrubbing calls!"), (unint64_t mScrubbingCount = self->mScrubbingCount) != 0))
  {
    unint64_t v6 = mScrubbingCount - 1;
    self->unint64_t mScrubbingCount = v6;
    if (!v6)
    {
      double v7 = [(TSKAVPlayerController *)self player];
      long long v8 = [(AVPlayer *)v7 currentItem];
      if (!v8)
      {
        *(float *)&double v9 = self->mRateBeforeScrubbing;
LABEL_25:
        [(AVPlayer *)v7 setRate:v9];
        objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"TSKAVPlayerControllerDidEndScrubbingNotification", self);
        return;
      }
      uint64_t v10 = v8;
      memset(&v21, 0, sizeof(v21));
      [(AVPlayerItem *)v8 forwardPlaybackEndTime];
      if ((unsigned __int128)0 >> 96 == 1)
      {
        uint64_t v11 = [(TSKAVPlayerController *)self player];
        if (v11) {
          [(AVPlayer *)v11 currentTime];
        }
        else {
          memset(&time1, 0, sizeof(time1));
        }
        CMTime time2 = v21;
        unsigned int v12 = CMTimeCompare(&time1, &time2) >> 31;
      }
      else
      {
        unsigned int v12 = 1;
      }
      memset(&time2, 0, sizeof(time2));
      [(AVPlayerItem *)v10 reversePlaybackEndTime];
      if ((time2.flags & 0x1D) == 1)
      {
        CMTime v13 = [(TSKAVPlayerController *)self player];
        if (v13) {
          [(AVPlayer *)v13 currentTime];
        }
        else {
          memset(&v18, 0, sizeof(v18));
        }
        CMTime v17 = time2;
        BOOL v14 = CMTimeCompare(&v18, &v17) < 1;
      }
      else
      {
        BOOL v14 = 0;
      }
      *(float *)&double v9 = self->mRateBeforeScrubbing;
      if (*(float *)&v9 <= 0.0) {
        int v15 = 1;
      }
      else {
        int v15 = v12;
      }
      if (*(float *)&v9 >= 0.0) {
        BOOL v14 = 0;
      }
      if (v15 == 1 && !v14) {
        goto LABEL_25;
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"TSKAVPlayerControllerDidEndScrubbingNotification", self);
      *(float *)&double v16 = self->mRateBeforeScrubbing;
      [(TSKAVPlayerController *)self playerItemDidPlayToEndTimeAtRate:v16];
    }
  }
}

- (void)seekForwardByOneFrame
{
  float v3 = [[(TSKAVPlayerController *)self player] currentItem];
  unint64_t v4 = v3;
  if (v3
    && (memset(&v9, 0, sizeof(v9)),
        [(AVPlayerItem *)v3 forwardPlaybackEndTime],
        (unsigned __int128)0 >> 96 == 1))
  {
    uint64_t v5 = [(TSKAVPlayerController *)self player];
    if (v5) {
      [(AVPlayer *)v5 currentTime];
    }
    else {
      memset(&time1, 0, sizeof(time1));
    }
    CMTime v7 = v9;
    BOOL v6 = CMTimeCompare(&time1, &v7) >= 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  if ([(AVPlayerItem *)v4 canStepForward])
  {
    if (!v6) {
      [(AVPlayerItem *)v4 stepByCount:1];
    }
  }
}

- (void)seekBackwardByOneFrame
{
  float v3 = [[(TSKAVPlayerController *)self player] currentItem];
  unint64_t v4 = v3;
  if (v3
    && (memset(&v9, 0, sizeof(v9)),
        [(AVPlayerItem *)v3 reversePlaybackEndTime],
        (unsigned __int128)0 >> 96 == 1))
  {
    uint64_t v5 = [(TSKAVPlayerController *)self player];
    if (v5) {
      [(AVPlayer *)v5 currentTime];
    }
    else {
      memset(&time1, 0, sizeof(time1));
    }
    CMTime v7 = v9;
    BOOL v6 = CMTimeCompare(&time1, &v7) < 1;
  }
  else
  {
    BOOL v6 = 0;
  }
  if ([(AVPlayerItem *)v4 canStepBackward])
  {
    if (!v6) {
      [(AVPlayerItem *)v4 stepByCount:-1];
    }
  }
}

- (void)seekToBeginning
{
  v2 = [(TSKAVPlayerController *)self player];
  float v3 = [(AVPlayer *)v2 currentItem];
  if (v3) {
    [(AVPlayerItem *)v3 reversePlaybackEndTime];
  }
  else {
    memset(v4, 0, sizeof(v4));
  }
  [(AVPlayer *)v2 seekToTime:v4];
}

- (void)seekToEnd
{
  v2 = [(TSKAVPlayerController *)self player];
  float v3 = [(AVPlayer *)v2 currentItem];
  if (v3) {
    [(AVPlayerItem *)v3 forwardPlaybackEndTime];
  }
  else {
    memset(v4, 0, sizeof(v4));
  }
  [(AVPlayer *)v2 seekToTime:v4];
}

- (void)setPlaying:(BOOL)a3
{
  if (self->mPlaying != a3)
  {
    BOOL v3 = a3;
    self->mPlaying = a3;
    uint64_t v5 = [(TSKAVPlayerController *)self player];
    BOOL v6 = v5;
    if (v3)
    {
      [(AVPlayer *)v5 rate];
      if (*(float *)&v7 == 0.0)
      {
        long long v8 = [(AVPlayer *)v6 currentItem];
        CMTime v9 = v8;
        memset(&v17, 0, sizeof(v17));
        if (v8) {
          [(AVPlayerItem *)v8 currentTime];
        }
        memset(&v16, 0, sizeof(v16));
        [(TSKAVPlayerController *)self startTime];
        CMTimeMakeWithSeconds(&v16, v10, 90000);
        memset(&v15, 0, sizeof(v15));
        [(TSKAVPlayerController *)self endTime];
        CMTimeMakeWithSeconds(&v15, v11 + -0.01, 90000);
        CMTime time1 = v17;
        CMTime time2 = v16;
        if (CMTimeCompare(&time1, &time2) < 0 || (time1 = v17, CMTime time2 = v15, CMTimeCompare(&time1, &time2) >= 1))
        {
          CMTime time1 = v16;
          CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
          CMTime v12 = time2;
          [(AVPlayerItem *)v9 seekToTime:&time1 toleranceBefore:&time2 toleranceAfter:&v12];
          objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"TSKAVPlayerControllerWillPlayFromStartNotification", self);
        }
      }
      LODWORD(v7) = 1.0;
    }
    else
    {
      double v7 = 0.0;
    }
    [(AVPlayer *)v6 setRate:v7];
    [(TSKAVPlayerController *)self setFastReversing:0];
    [(TSKAVPlayerController *)self setFastForwarding:0];
  }
}

- (BOOL)p_canFastReverse
{
  BOOL v3 = [(TSKAVPlayerController *)self player];
  unint64_t v4 = [(AVPlayer *)v3 currentItem];
  BOOL v5 = [(AVPlayerItem *)v4 canPlayFastReverse];
  if (v5)
  {
    [(AVPlayer *)v3 rate];
    if (v6 == 0.0)
    {
      memset(&v12, 0, sizeof(v12));
      if (v4) {
        [(AVPlayerItem *)v4 currentTime];
      }
      memset(&v11, 0, sizeof(v11));
      [(TSKAVPlayerController *)self startTime];
      CMTimeMakeWithSeconds(&v11, v7, 90000);
      CMTime time1 = v12;
      CMTime v9 = v11;
      LOBYTE(v5) = CMTimeCompare(&time1, &v9) > 0;
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)setFastReversing:(BOOL)a3
{
  if (self->mFastReversing != a3)
  {
    if (a3)
    {
      if ([(TSKAVPlayerController *)self p_canFastReverse])
      {
        self->mFastReversing = 1;
        unint64_t v4 = [(TSKAVPlayerController *)self player];
        LODWORD(v5) = -2.0;
        [(AVPlayer *)v4 setRate:v5];
        [(TSKAVPlayerController *)self setFastForwarding:0];
      }
    }
    else
    {
      self->mFastReversing = 0;
      if (![(TSKAVPlayerController *)self isFastForwarding])
      {
        BOOL v6 = [(TSKAVPlayerController *)self isPlaying];
        Float64 v7 = [(TSKAVPlayerController *)self player];
        if (v6) {
          LODWORD(v8) = 1.0;
        }
        else {
          double v8 = 0.0;
        }
        [(AVPlayer *)v7 setRate:v8];
      }
    }
  }
}

- (BOOL)p_canFastForward
{
  BOOL v3 = [(TSKAVPlayerController *)self player];
  unint64_t v4 = [(AVPlayer *)v3 currentItem];
  BOOL v5 = [(AVPlayerItem *)v4 canPlayFastForward];
  if (v5)
  {
    [(AVPlayer *)v3 rate];
    if (v6 == 0.0)
    {
      memset(&v12, 0, sizeof(v12));
      if (v4) {
        [(AVPlayerItem *)v4 currentTime];
      }
      memset(&v11, 0, sizeof(v11));
      [(TSKAVPlayerController *)self endTime];
      CMTimeMakeWithSeconds(&v11, v7, 90000);
      CMTime time1 = v12;
      CMTime v9 = v11;
      return CMTimeCompare(&time1, &v9) >> 31;
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)setFastForwarding:(BOOL)a3
{
  if (self->mFastForwarding != a3)
  {
    if (a3)
    {
      if ([(TSKAVPlayerController *)self p_canFastForward])
      {
        self->mFastForwarding = 1;
        unint64_t v4 = [(TSKAVPlayerController *)self player];
        LODWORD(v5) = 2.0;
        [(AVPlayer *)v4 setRate:v5];
        [(TSKAVPlayerController *)self setFastReversing:0];
      }
    }
    else
    {
      self->mFastForwarding = 0;
      if (![(TSKAVPlayerController *)self isFastReversing])
      {
        BOOL v6 = [(TSKAVPlayerController *)self isPlaying];
        Float64 v7 = [(TSKAVPlayerController *)self player];
        if (v6) {
          LODWORD(v8) = 1.0;
        }
        else {
          double v8 = 0.0;
        }
        [(AVPlayer *)v7 setRate:v8];
      }
    }
  }
}

- (void)p_startObservingClosedCaptionDisplayEnabled
{
  BOOL v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_p_closedCaptioningStatusDidChange_ name:*MEMORY[0x263F1CDE8] object:0];

  [(TSKAVPlayerController *)self p_updateClosedCaptionDisplayEnabled];
}

- (void)p_stopObservingClosedCaptionDisplayEnabled
{
  BOOL v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263F1CDE8];

  [v3 removeObserver:self name:v4 object:0];
}

- (void)p_updateClosedCaptionDisplayEnabled
{
  BOOL IsClosedCaptioningEnabled = UIAccessibilityIsClosedCaptioningEnabled();
  uint64_t v4 = [(TSKAVPlayerController *)self player];

  [(AVPlayer *)v4 setClosedCaptionDisplayEnabled:IsClosedCaptioningEnabled];
}

- (void)playerItemDidPlayToEndTimeAtRate:(float)a3
{
  uint64_t v4 = self;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"TSKAVPlayerControllerDidPlayToEndNotification", self);
  double v5 = self;
  int64_t v6 = [(TSKAVPlayerController *)self repeatMode];
  if (v6)
  {
    if (v6 == 2)
    {
      if (a3 >= 0.0) {
        [(TSKAVPlayerController *)self endTime];
      }
      else {
        [(TSKAVPlayerController *)self startTime];
      }
      memset(&v19, 0, sizeof(v19));
      CMTimeMakeWithSeconds(&v19, v9, 90000);
      CMTime v11 = [(TSKAVPlayerController *)self player];
      *(float *)&double v12 = -a3;
      CMTime v18 = v19;
      long long v16 = *MEMORY[0x263F01090];
      uint64_t v17 = *(void *)(MEMORY[0x263F01090] + 16);
      [(AVPlayer *)v11 setRate:&v18 time:&v16 atHostTime:v12];
    }
    else if (v6 == 1)
    {
      if (a3 >= 0.0) {
        [(TSKAVPlayerController *)self startTime];
      }
      else {
        [(TSKAVPlayerController *)self endTime];
      }
      memset(&v19, 0, sizeof(v19));
      CMTimeMakeWithSeconds(&v19, v7, 90000);
      Float64 v10 = [[(TSKAVPlayerController *)self player] currentItem];
      CMTime v18 = v19;
      long long v16 = *MEMORY[0x263F010E0];
      uint64_t v17 = *(void *)(MEMORY[0x263F010E0] + 16);
      long long v14 = v16;
      uint64_t v15 = v17;
      [(AVPlayerItem *)v10 seekToTime:&v18 toleranceBefore:&v16 toleranceAfter:&v14];
    }
  }
  else
  {
    double v8 = self;
    [(TSKAVPlayerController *)self setPlaying:0];
    [(TSKAVPlayerController *)self setFastReversing:0];
    [(TSKAVPlayerController *)self setFastForwarding:0];
    if (a3 > 0.0) {
      [(TSKAVPlayerControllerDelegate *)[(TSKAVPlayerController *)self delegate] playbackDidStopForPlayerController:self];
    }
  }
}

- (void)p_playerItemDidPlayToEndTime:(id)a3
{
  [[(TSKAVPlayerController *)self player] rate];

  -[TSKAVPlayerController playerItemDidPlayToEndTimeAtRate:](self, "playerItemDidPlayToEndTimeAtRate:");
}

- (void)p_playbackDidFailWithError:(id)a3
{
  double v5 = [(TSKAVPlayerController *)self delegate];

  [(TSKAVPlayerControllerDelegate *)v5 playerController:self playbackDidFailWithError:a3];
}

- (void)p_applicationDidResignActive
{
  [(TSKAVPlayerController *)self setPlaying:0];
  [(TSKAVPlayerController *)self setFastReversing:0];
  [(TSKAVPlayerController *)self setFastForwarding:0];
  BOOL v3 = [(TSKAVPlayerController *)self delegate];

  [(TSKAVPlayerControllerDelegate *)v3 playbackDidStopForPlayerController:self];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  CMTime v11 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  if ((void *)TSKAVPlayerControllerAVPlayerCurrentItemObserverContext == a6)
  {
    uint64_t v12 = [a5 objectForKey:*MEMORY[0x263F081C8]];
    if (v12)
    {
      uint64_t v13 = v12;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v11 removeObserver:self name:*MEMORY[0x263EFA050] object:v13];
      }
    }
    uint64_t v14 = [a5 objectForKey:*MEMORY[0x263F081B8]];
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (![(TSKAVPlayerController *)self canPlay])
        {
          long long v16 = (void *)[v15 asset];
          v36[0] = MEMORY[0x263EF8330];
          v36[1] = 3221225472;
          v36[2] = __72__TSKAVPlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke;
          v36[3] = &unk_2646B0750;
          v36[4] = v16;
          v36[5] = self;
          [v16 loadValuesAsynchronouslyForKeys:&unk_26D739348 completionHandler:v36];
        }
        [v11 addObserver:self selector:sel_p_playerItemDidPlayToEndTime_ name:*MEMORY[0x263EFA050] object:v15];
        [(TSKAVPlayerController *)self p_applyVolumeToPlayerItem];
      }
    }
  }
  else
  {
    if ((void *)TSKAVPlayerControllerAVPlayerStatusObserverContext == a6)
    {
      if ([[(TSKAVPlayerController *)self player] status] != AVPlayerStatusFailed) {
        return;
      }
      uint64_t v17 = [[(TSKAVPlayerController *)self player] error];
      if (!v17)
      {
        CMTime v18 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v19 = [NSString stringWithUTF8String:"-[TSKAVPlayerController observeValueForKeyPath:ofObject:change:context:]"];
        objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerController.m"), 801, @"invalid nil value for '%s'", "playerError");
      }
    }
    else
    {
      if ((void *)TSKAVPlayerControllerAVPlayerItemStatusObserverContext != a6)
      {
        if ((void *)TSKAVPlayerControllerAVPlayerRateObserverContext == a6)
        {
          objc_opt_class();
          [a5 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
          long long v23 = (void *)TSUDynamicCast();
          float v24 = 0.0;
          float v25 = 0.0;
          if (v23)
          {
            [v23 floatValue];
            float v25 = v26;
          }
          objc_opt_class();
          [a5 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
          uint64_t v27 = (void *)TSUDynamicCast();
          if (v27 && ([v27 floatValue], float v24 = v28, v25 == 0.0) && v28 != 0.0)
          {
            v29 = [(TSKAVPlayerController *)self player];
            objc_msgSend(+[TSKMoviePlaybackRegistry sharedMoviePlaybackRegistry](TSKMoviePlaybackRegistry, "sharedMoviePlaybackRegistry"), "objectWillBeginMoviePlayback:", self);
            [v11 addObserver:self selector:sel_p_applicationDidResignActive name:*MEMORY[0x263F1D0D8] object:0];
            if (!self->mIsObservingStatus)
            {
              [(AVPlayer *)v29 addObserver:self forKeyPath:@"status" options:4 context:TSKAVPlayerControllerAVPlayerStatusObserverContext];
              [(AVPlayer *)v29 addObserver:self forKeyPath:@"currentItem.status" options:4 context:TSKAVPlayerControllerAVPlayerItemStatusObserverContext];
              self->mIsObservingStatus = 1;
            }
            [(AVPlayer *)v29 rate];
            if (v30 == 0.0 && self->mIsObservingStatus)
            {
              [(AVPlayer *)v29 removeObserver:self forKeyPath:@"currentItem.status" context:TSKAVPlayerControllerAVPlayerItemStatusObserverContext];
              [(AVPlayer *)v29 removeObserver:self forKeyPath:@"status" context:TSKAVPlayerControllerAVPlayerStatusObserverContext];
              self->mIsObservingStatus = 0;
            }
          }
          else if (v25 != 0.0 && v24 == 0.0)
          {
            v31 = [(TSKAVPlayerController *)self player];
            [v11 removeObserver:self name:*MEMORY[0x263F1D0D8] object:0];
            if (self->mIsObservingStatus)
            {
              [(AVPlayer *)v31 removeObserver:self forKeyPath:@"currentItem.status" context:TSKAVPlayerControllerAVPlayerItemStatusObserverContext];
              [(AVPlayer *)v31 removeObserver:self forKeyPath:@"status" context:TSKAVPlayerControllerAVPlayerStatusObserverContext];
              self->mIsObservingStatus = 0;
            }
            objc_msgSend(+[TSKMoviePlaybackRegistry sharedMoviePlaybackRegistry](TSKMoviePlaybackRegistry, "sharedMoviePlaybackRegistry"), "objectDidEndMoviePlayback:", self);
            if (([(TSKAVPlayerController *)self isPlaying]
               || [(TSKAVPlayerController *)self isFastReversing]
               || [(TSKAVPlayerController *)self isFastForwarding])
              && ![(TSKAVPlayerController *)self isScrubbing])
            {
              Main = CFRunLoopGetMain();
              v33 = (const void *)*MEMORY[0x263EFFE78];
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __72__TSKAVPlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
              block[3] = &unk_2646AF7B8;
              block[4] = self;
              CFRunLoopPerformBlock(Main, v33, block);
              CFRunLoopWakeUp(Main);
            }
          }
        }
        else
        {
          v34.receiver = self;
          v34.super_class = (Class)TSKAVPlayerController;
          [(TSKAVPlayerController *)&v34 observeValueForKeyPath:a3 ofObject:a4 change:a5 context:a6];
        }
        return;
      }
      long long v20 = [[(TSKAVPlayerController *)self player] currentItem];
      if ([(AVPlayerItem *)v20 status] != AVPlayerItemStatusFailed) {
        return;
      }
      uint64_t v17 = [(AVPlayerItem *)v20 error];
      if (!v17)
      {
        CMTime v21 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v22 = [NSString stringWithUTF8String:"-[TSKAVPlayerController observeValueForKeyPath:ofObject:change:context:]"];
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAVPlayerController.m"), 812, @"invalid nil value for '%s'", "playerItemError");
      }
    }
    [(TSKAVPlayerController *)self p_playbackDidFailWithError:v17];
  }
}

void __72__TSKAVPlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  Main = CFRunLoopGetMain();
  BOOL v3 = (const void *)*MEMORY[0x263EFFE78];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  CMTime v4[2] = __72__TSKAVPlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
  void v4[3] = &unk_2646B0750;
  long long v5 = *(_OWORD *)(a1 + 32);
  CFRunLoopPerformBlock(Main, v3, v4);
  CFRunLoopWakeUp(Main);
}

uint64_t __72__TSKAVPlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "player"), "currentItem"), "asset");
  if (v2 == result)
  {
    uint64_t result = [*(id *)(a1 + 32) statusOfValueForKey:@"playable" error:0];
    if (result == 2)
    {
      uint64_t result = [*(id *)(a1 + 32) isPlayable];
      if (result)
      {
        [*(id *)(a1 + 40) willChangeValueForKey:@"canPlay"];
        *(unsigned char *)(*(void *)(a1 + 40) + 48) = 1;
        uint64_t v4 = *(void **)(a1 + 40);
        return [v4 didChangeValueForKey:@"canPlay"];
      }
    }
  }
  return result;
}

uint64_t __72__TSKAVPlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setPlaying:0];
  [*(id *)(a1 + 32) setFastReversing:0];
  [*(id *)(a1 + 32) setFastForwarding:0];
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 playbackDidStopForPlayerController:v3];
}

- (TSKAVPlayerControllerDelegate)delegate
{
  return self->mDelegate;
}

- (AVPlayer)player
{
  return self->mPlayer;
}

- (int64_t)repeatMode
{
  return self->mRepeatMode;
}

- (float)volume
{
  return self->mVolume;
}

- (BOOL)canPlay
{
  return self->mCanPlay;
}

- (BOOL)isPlaying
{
  return self->mPlaying;
}

- (BOOL)isFastReversing
{
  return self->mFastReversing;
}

- (BOOL)isFastForwarding
{
  return self->mFastForwarding;
}

- (void)setAbsoluteCurrentTime:(double)a3
{
  self->_absoluteCurrentTime = a3;
}

@end