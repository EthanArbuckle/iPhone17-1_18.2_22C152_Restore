@interface KPFMovie
- (AVPlayerLayer)playerLayer;
- (BOOL)isPlaying;
- (BOOL)p_canLoadEnhancedCaptionsInformationForURL:(id)a3;
- (BOOL)p_showsClosedCaptions;
- (BOOL)showsClosedCaptions;
- (KPFMovie)initWithURL:(id)a3 looping:(id)a4 volume:(double)a5 name:(id)a6 audioOnly:(BOOL)a7 drmContext:(id)a8;
- (NSString)name;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)p_playMovie;
- (void)p_playerItemDidPlayToEndTime:(id)a3;
- (void)p_setShowsClosedCaptions:(BOOL)a3;
- (void)p_setupEnhancedCaptionsInformation;
- (void)p_setupPosterFrame;
- (void)p_tearDownMoviePlayback;
- (void)pause;
- (void)playAfterDelay:(double)a3;
- (void)registerForMovieEndCallback:(SEL)a3 target:(id)a4;
- (void)resume;
- (void)stop;
@end

@implementation KPFMovie

- (BOOL)showsClosedCaptions
{
  CFArrayRef v2 = MACaptionAppearanceCopyPreferredCaptioningMediaCharacteristics(kMACaptionAppearanceDomainUser);
  CFArrayRef v3 = v2;
  if (v2) {
    CFRelease(v2);
  }
  return v3 != 0;
}

- (KPFMovie)initWithURL:(id)a3 looping:(id)a4 volume:(double)a5 name:(id)a6 audioOnly:(BOOL)a7 drmContext:(id)a8
{
  BOOL v9 = a7;
  v19.receiver = self;
  v19.super_class = (Class)KPFMovie;
  v14 = [(KPFMovie *)&v19 init];
  if (v14)
  {
    if ([a4 isEqualToString:@"looping"])
    {
      int v15 = 2;
    }
    else if ([a4 isEqualToString:@"loopBackAndForth"])
    {
      int v15 = 3;
    }
    else
    {
      int v15 = 1;
    }
    v14->mLooping = v15;
    v14->mVolume = a5;
    v14->mName = (NSString *)a6;
    v16 = +[AVPlayerItem playerItemWithURL:a3];
    v14->mPlayerItem = v16;
    [a8 authorizeAVPlayerItemForPlayback:v16];
    v14->mPlayer = (AVPlayer *)[objc_alloc((Class)AVPlayer) initWithPlayerItem:v14->mPlayerItem];
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    [(AVPlayer *)v14->mPlayer setActionAtItemEnd:2];
    [(AVPlayer *)v14->mPlayer addObserver:v14 forKeyPath:@"currentItem" options:7 context:off_56BA80];
    [(AVPlayer *)v14->mPlayer addObserver:v14 forKeyPath:@"currentItem.status" options:0 context:off_56BA88];
    v14->mIsObservingPlayerItemStatus = 1;
    *(_WORD *)&v14->mMoviePlaybackIsQueued = 0;
    v14->mAudioOnly = v9;
    if (v9)
    {
      v14->mPlayerLayer = 0;
    }
    else
    {
      if ([(KPFMovie *)v14 p_canLoadEnhancedCaptionsInformationForURL:a3])
      {
        [(KPFMovie *)v14 p_setupEnhancedCaptionsInformation];
      }
      v17 = (AVPlayerLayer *)objc_alloc_init((Class)AVPlayerLayer);
      v14->mPlayerLayer = v17;
      [(AVPlayerLayer *)v17 setPlayer:v14->mPlayer];
      [(AVPlayerLayer *)v14->mPlayerLayer setVideoGravity:AVLayerVideoGravityResize];
      [(AVPlayerLayer *)v14->mPlayerLayer setName:@"movieLayer"];
    }
    +[CATransaction commit];
  }
  return v14;
}

- (void)dealloc
{
  [(KPFMovie *)self stop];

  self->mPlayerItem = 0;
  v3.receiver = self;
  v3.super_class = (Class)KPFMovie;
  [(KPFMovie *)&v3 dealloc];
}

- (BOOL)p_showsClosedCaptions
{
  return [(AVMediaSelection *)[(AVPlayerItem *)self->mPlayerItem currentMediaSelection] selectedMediaOptionInMediaSelectionGroup:[(AVAsset *)[(AVPlayerItem *)self->mPlayerItem asset] mediaSelectionGroupForMediaCharacteristic:AVMediaCharacteristicLegible]] != 0;
}

- (void)p_setShowsClosedCaptions:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(AVAsset *)[(AVPlayerItem *)self->mPlayerItem asset] mediaSelectionGroupForMediaCharacteristic:AVMediaCharacteristicLegible];
  v6 = v5;
  if (v3)
  {
    v7 = +[AVMediaSelectionGroup mediaSelectionOptionsFromArray:filteredAndSortedAccordingToPreferredLanguages:](AVMediaSelectionGroup, "mediaSelectionOptionsFromArray:filteredAndSortedAccordingToPreferredLanguages:", [(AVMediaSelectionGroup *)v5 options], +[NSLocale preferredLanguages]);
    if (!v7) {
      return;
    }
    v8 = v7;
    if (![(NSArray *)v7 count]) {
      return;
    }
    mPlayerItem = self->mPlayerItem;
    id v10 = [(NSArray *)v8 objectAtIndex:0];
    v11 = mPlayerItem;
  }
  else
  {
    v11 = self->mPlayerItem;
    id v10 = 0;
  }

  [(AVPlayerItem *)v11 selectMediaOption:v10 inMediaSelectionGroup:v6];
}

- (BOOL)p_canLoadEnhancedCaptionsInformationForURL:(id)a3
{
  return [[[a3 lastPathComponent] pathExtension] compare:@"m4v" options:1] == 0;
}

- (void)p_setupEnhancedCaptionsInformation
{
  if ([(AVAsset *)[(AVPlayerItem *)self->mPlayerItem asset] statusOfValueForKey:@"tracks" error:0] != (char *)&dword_0 + 2)
  {
    BOOL v3 = [(AVPlayerItem *)self->mPlayerItem asset];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_7D010;
    v4[3] = &unk_456DE0;
    v4[4] = self;
    [(AVAsset *)v3 loadValuesAsynchronouslyForKeys:&off_499878 completionHandler:v4];
  }
}

- (void)playAfterDelay:(double)a3
{
  if ((char *)[(AVPlayerItem *)[(AVPlayer *)self->mPlayer currentItem] status] == (char *)&dword_0 + 1)
  {
    [(KPFMovie *)self performSelector:"p_playMovie" withObject:0 afterDelay:a3];
  }
  else if ((char *)[(AVPlayerItem *)[(AVPlayer *)self->mPlayer currentItem] status] != (char *)&dword_0 + 2)
  {
    self->mMoviePlaybackIsQueued = 1;
    self->mQueuedPlaybackTime = CACurrentMediaTime() + a3;
  }
}

- (void)stop
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  if (self->mPlayer) {
    [(KPFMovie *)self p_tearDownMoviePlayback];
  }

  +[CATransaction commit];
}

- (void)pause
{
  if (!self->mMoviePlaybackIsPaused)
  {
    self->mMoviePlaybackIsPaused = 1;
    if (self->mMoviePlaybackHasStarted) {
      [(AVPlayer *)self->mPlayer setRate:0.0];
    }
  }
}

- (void)resume
{
  if (self->mMoviePlaybackIsPaused)
  {
    self->mMoviePlaybackIsPaused = 0;
    if (self->mMoviePlaybackHasStarted)
    {
      LODWORD(v2) = 1.0;
      [(AVPlayer *)self->mPlayer setRate:v2];
    }
  }
}

- (void)registerForMovieEndCallback:(SEL)a3 target:(id)a4
{
  self->mMovieEndCallbackTarget = a4;
  if (a3) {
    v4 = a3;
  }
  else {
    v4 = 0;
  }
  self->mMovieEndCallbackSelector = v4;
}

- (void)p_playMovie
{
  if (self->mPlayer)
  {
    self->mMoviePlaybackHasStarted = 1;
    if (!self->mAudioOnly)
    {
      [(AVPlayerLayer *)self->mPlayerLayer setHidden:0];
      id v4 = [(AVPlayerLayer *)self->mPlayerLayer valueForKey:@"textureLayer"];
      if (v4) {
        [v4 setHidden:1];
      }
    }
    if (!self->mMoviePlaybackIsPaused)
    {
      mPlayer = self->mPlayer;
      LODWORD(v2) = 1.0;
      [(AVPlayer *)mPlayer setRate:v2];
    }
  }
}

- (void)p_playerItemDidPlayToEndTime:(id)a3
{
  int mLooping = self->mLooping;
  if (mLooping == 3)
  {
    v8 = [(AVPlayer *)self->mPlayer currentItem];
    if (v8)
    {
      BOOL v9 = v8;
      [(AVPlayerItem *)v8 currentTime];
      [(AVPlayerItem *)v9 forwardPlaybackEndTime];
    }
    else
    {
      memset(&time1, 0, sizeof(time1));
      memset(&v17, 0, sizeof(v17));
    }
    int32_t v13 = CMTimeCompare(&time1, &v17);
    mPlayer = self->mPlayer;
    if ((v13 & 0x80000000) == 0)
    {
      LODWORD(v6) = -1.0;
LABEL_13:
      -[AVPlayer setRate:](mPlayer, "setRate:", v6, v17.value, *(void *)&v17.timescale, v17.epoch, time1.value, *(void *)&time1.timescale, time1.epoch);
      return;
    }
LABEL_12:
    LODWORD(v6) = 1.0;
    goto LABEL_13;
  }
  if (mLooping == 2)
  {
    memset(&v24, 0, sizeof(v24));
    CMTimeMakeWithSeconds(&v24, 0.0, 90000);
    v5 = [(AVPlayer *)self->mPlayer currentItem];
    CMTime v23 = v24;
    long long v21 = *(_OWORD *)&kCMTimeZero.value;
    CMTimeEpoch epoch = kCMTimeZero.epoch;
    long long v19 = v21;
    CMTimeEpoch v20 = epoch;
    [(AVPlayerItem *)v5 seekToTime:&v23 toleranceBefore:&v21 toleranceAfter:&v19 completionHandler:0];
    mPlayer = self->mPlayer;
    goto LABEL_12;
  }
  -[AVPlayer setRate:](self->mPlayer, "setRate:", a3, 0.0);
  id mMovieEndCallbackTarget = self->mMovieEndCallbackTarget;
  if (mMovieEndCallbackTarget)
  {
    SEL mMovieEndCallbackSelector = self->mMovieEndCallbackSelector;
    self->mMoviePlaybackHasStarted = 0;
    SEL v12 = mMovieEndCallbackSelector ? mMovieEndCallbackSelector : 0;
    id v14 = [mMovieEndCallbackTarget methodSignatureForSelector:v12];
    if (v14)
    {
      if ([v14 numberOfArguments] == (char *)&dword_0 + 3)
      {
        id v15 = self->mMovieEndCallbackTarget;
        if (self->mMovieEndCallbackSelector) {
          SEL v16 = self->mMovieEndCallbackSelector;
        }
        else {
          SEL v16 = 0;
        }
        [v15 performSelector:v16 withObject:self afterDelay:0.0];
      }
    }
  }
}

- (void)p_setupPosterFrame
{
  BOOL v3 = [(AVPlayer *)self->mPlayer currentItem];
  id v4 = [(AVPlayerItem *)v3 asset];
  if (v3) {
    [(AVPlayerItem *)v3 currentTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  Float64 v5 = CMTimeGetSeconds(&time) + 0.05;
  id v6 = [objc_alloc((Class)AVAssetImageGenerator) initWithAsset:v4];
  long long v28 = *(_OWORD *)&kCMTimeZero.value;
  long long v11 = v28;
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  CMTimeEpoch v7 = epoch;
  [v6 setRequestedTimeToleranceAfter:&v28];
  long long v26 = v11;
  CMTimeEpoch v27 = v7;
  [v6 setRequestedTimeToleranceBefore:&v26];
  [v6 setAppliesPreferredTrackTransform:1];
  CMTimeMakeWithSeconds(&v24, v5, 90000);
  if (v4) {
    [(AVAsset *)v4 duration];
  }
  else {
    memset(&duration, 0, sizeof(duration));
  }
  *(_OWORD *)&start.value = v11;
  start.CMTimeEpoch epoch = v7;
  CMTimeRangeMake(&range, &start, &duration);
  CMTimeClampToRange(&v25, &v24, &range);
  v8 = (CGImage *)[v6 copyCGImageAtTime:&v25 actualTime:0 error:0];

  if (v8)
  {
    BOOL v9 = +[CALayer layer];
    [(AVPlayerLayer *)self->mPlayerLayer bounds];
    -[CALayer setBounds:](v9, "setBounds:");
    [(AVPlayerLayer *)self->mPlayerLayer position];
    -[CALayer setPosition:](v9, "setPosition:");
    mPlayerLayer = self->mPlayerLayer;
    if (mPlayerLayer)
    {
      [(AVPlayerLayer *)mPlayerLayer transform];
    }
    else
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
    }
    v12[4] = v17;
    v12[5] = v18;
    v12[6] = v19;
    v12[7] = v20;
    v12[0] = v13;
    v12[1] = v14;
    v12[2] = v15;
    v12[3] = v16;
    [(CALayer *)v9 setTransform:v12];
    [(AVPlayerLayer *)self->mPlayerLayer zPosition];
    -[CALayer setZPosition:](v9, "setZPosition:");
    [(CALayer *)v9 setContents:v8];
    [(CALayer *)v9 setName:@"posterImage"];
    CGImageRelease(v8);
    [self->mPlayerLayer.superlayer insertSublayer:v9 above:self->mPlayerLayer];
  }
}

- (void)p_tearDownMoviePlayback
{
  mPlayer = self->mPlayer;
  if (mPlayer)
  {
    [(AVPlayer *)mPlayer setRate:0.0];
    self->mMoviePlaybackHasStarted = 0;
    if (self->mIsObservingPlayerItemStatus)
    {
      [(AVPlayer *)self->mPlayer removeObserver:self forKeyPath:@"currentItem.status"];
      self->mIsObservingPlayerItemStatus = 0;
    }
    [(AVPlayer *)self->mPlayer removeObserver:self forKeyPath:@"currentItem"];
    id v4 = [(AVPlayer *)self->mPlayer currentItem];
    if (v4) {
      [+[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:v4];
    }
    [(KPFMovie *)self p_setupPosterFrame];

    self->mPlayer = 0;
  }
  mPlayerLayer = self->mPlayerLayer;
  if (mPlayerLayer)
  {
    id v6 = [(AVPlayerLayer *)mPlayerLayer valueForKey:@"textureLayer"];
    [(AVPlayerLayer *)self->mPlayerLayer setValue:0 forKey:@"textureLayer"];
    [v6 setValue:0 forKey:@"movieLayer"];
    [(AVPlayerLayer *)self->mPlayerLayer removeFromSuperlayer];

    self->mPlayerLayer = 0;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_56BA88 == a6)
  {
    AVPlayerItemStatus v8 = [(AVPlayerItem *)[(AVPlayer *)self->mPlayer currentItem] status];
    mPlayer = self->mPlayer;
    if (v8 == AVPlayerItemStatusReadyToPlay)
    {
      [(AVPlayer *)mPlayer removeObserver:self forKeyPath:@"currentItem.status"];
      self->mIsObservingPlayerItemStatus = 0;
      if (!self->mMoviePlaybackIsQueued) {
        return;
      }
      double mQueuedPlaybackTime = self->mQueuedPlaybackTime;
      double v11 = mQueuedPlaybackTime - CACurrentMediaTime();
      if (v11 < 0.0) {
        double v11 = 0.0;
      }
      [(KPFMovie *)self performSelector:"p_playMovie" withObject:0 afterDelay:v11];
    }
    else
    {
      if ((char *)[(AVPlayerItem *)[(AVPlayer *)mPlayer currentItem] status] != (char *)&dword_0 + 2) {
        return;
      }
      [(AVPlayer *)self->mPlayer removeObserver:self forKeyPath:@"currentItem.status"];
      self->mIsObservingPlayerItemStatus = 0;
    }
    self->mMoviePlaybackIsQueued = 0;
  }
  else if (off_56BA80 == a6)
  {
    SEL v12 = +[NSNotificationCenter defaultCenter];
    id v13 = [a5 objectForKey:NSKeyValueChangeOldKey];
    if (v13)
    {
      id v14 = v13;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(NSNotificationCenter *)v12 removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:v14];
      }
    }
    id v15 = [a5 objectForKey:NSKeyValueChangeNewKey];
    if (v15)
    {
      id v16 = v15;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(NSNotificationCenter *)v12 addObserver:self selector:"p_playerItemDidPlayToEndTime:" name:AVPlayerItemDidPlayToEndTimeNotification object:v16];
      }
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)KPFMovie;
    -[KPFMovie observeValueForKeyPath:ofObject:change:context:](&v17, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (AVPlayerLayer)playerLayer
{
  return self->mPlayerLayer;
}

- (NSString)name
{
  return self->mName;
}

- (BOOL)isPlaying
{
  return self->mMoviePlaybackHasStarted;
}

@end