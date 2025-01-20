@interface THWAudioRep
- (BOOL)autoplayAllowed;
- (BOOL)canExpand;
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)canSelectChildRep:(id)a3;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)createdPressableHandler;
- (BOOL)handleGesture:(id)a3;
- (BOOL)handlingPress;
- (BOOL)isMuted;
- (BOOL)isPaused;
- (BOOL)isPlaying;
- (BOOL)observingRate;
- (BOOL)pMuted;
- (BOOL)seeking;
- (BOOL)shouldRecognizePressOnRep:(id)a3;
- (BOOL)wantsPressAction;
- (BOOL)wantsPressAnimation;
- (CALayer)pressableAnimationLayer;
- (CALayer)pressableAnimationShadowLayer;
- (NSArray)childReps;
- (THWAudioRep)initWithLayout:(id)a3 canvas:(id)a4;
- (THWAutoplayConfig)autoplayConfig;
- (THWMovieLayout)movieLayout;
- (THWPressableRepGestureTargetHandler)pressableHandler;
- (TSDContainerInfo)containerInfo;
- (double)currentTime;
- (double)ignoreTimeChangeUpdate;
- (double)pVolumeLevel;
- (double)playbackRate;
- (double)timeToBeginPlaybackAt;
- (double)volumeLevel;
- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5;
- (id)movieInfo;
- (void)autoplayPause;
- (void)autoplayStart;
- (void)autoplayStop;
- (void)changeCurrentTimeTo:(double)a3;
- (void)control:(id)a3 repWasAdded:(id)a4;
- (void)control:(id)a3 repWillBeRemoved:(id)a4;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)p_cleanupPlayerAndController;
- (void)p_play;
- (void)p_playPause:(id)a3;
- (void)p_playerDidPlayToEnd:(id)a3;
- (void)p_setPlaying:(BOOL)a3;
- (void)p_stop;
- (void)pause;
- (void)play;
- (void)pressableRepWasPressed:(id)a3 atPoint:(CGPoint)a4;
- (void)setChildReps:(id)a3;
- (void)setCreatedPressableHandler:(BOOL)a3;
- (void)setHandlingPress:(BOOL)a3;
- (void)setIgnoreTimeChangeUpdate:(double)a3;
- (void)setIsPaused:(BOOL)a3;
- (void)setObservingRate:(BOOL)a3;
- (void)setPMuted:(BOOL)a3;
- (void)setPVolumeLevel:(double)a3;
- (void)setPressableHandler:(id)a3;
- (void)setSeeking:(BOOL)a3;
- (void)setTimeToBeginPlaybackAt:(double)a3;
- (void)stop;
- (void)timeChanged:(double)a3;
- (void)timerDidTriggerTimeChangedUpdate;
- (void)togglePlayPause;
- (void)updateChildrenFromLayout;
- (void)viewScrollWillChange;
- (void)willBeRemoved;
@end

@implementation THWAudioRep

- (THWAudioRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)THWAudioRep;
  v4 = [(THWAudioRep *)&v11 initWithLayout:a3 canvas:a4];
  v5 = v4;
  if (v4)
  {
    if ([(THWAudioRep *)v4 movieInfo])
    {
      [(THWAudioRep *)v5 setPVolumeLevel:1.0];
      [(THWAudioRep *)v5 setPMuted:0];
      v6 = [(THWMovieLayout *)[(THWAudioRep *)v5 movieLayout] mediaListener];
      [v5 movieInfo].endTime;
      double v8 = v7;
      [(-[THWAudioRep movieInfo](v5, "movieInfo")) startTime];
      [(THWAVMediaListener *)v6 durationChanged:v8 - v9];
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (THWMovieLayout)movieLayout
{
  objc_opt_class();
  [(THWAudioRep *)self layout];

  return (THWMovieLayout *)TSUDynamicCast();
}

- (THWPressableRepGestureTargetHandler)pressableHandler
{
  if (![(THWAudioRep *)self createdPressableHandler])
  {
    [(THWAudioRep *)self setCreatedPressableHandler:1];
    if ([(THWAudioRep *)self wantsPressAction]) {
      self->_pressableHandler = [[THWPressableRepGestureTargetHandler alloc] initWithPressableRep:self pressHandler:self];
    }
  }
  return self->_pressableHandler;
}

- (id)movieInfo
{
  objc_opt_class();
  [(THWAudioRep *)self info];

  return (id)TSUDynamicCast();
}

- (void)p_cleanupPlayerAndController
{
  mPlaybackTimer = self->mPlaybackTimer;
  if (mPlaybackTimer)
  {
    [(NSTimer *)mPlaybackTimer invalidate];

    self->mPlaybackTimer = 0;
  }
  if ([(THWAudioRep *)self observingRate])
  {
    [(AVPlayer *)self->mPlayer removeObserver:self forKeyPath:@"rate"];
    [(THWAudioRep *)self setObservingRate:0];
  }
  v4 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v4 removeObserver:self name:TSKAVPlayerControllerDidPlayToEndNotification object:self->mPlayerController];
  [(TSKAVPlayerController *)self->mPlayerController teardown];

  self->mPlayer = 0;
  self->mPlayerController = 0;
}

- (void)dealloc
{
  [(THWAudioRep *)self p_cleanupPlayerAndController];

  v3.receiver = self;
  v3.super_class = (Class)THWAudioRep;
  [(THWAudioRep *)&v3 dealloc];
}

- (void)willBeRemoved
{
  v3.receiver = self;
  v3.super_class = (Class)THWAudioRep;
  [(THWAudioRep *)&v3 willBeRemoved];
  [(THWAudioRep *)self stop];

  self->_pressableHandler = 0;
  [+[NSNotificationCenter defaultCenter] removeObserver:self];
  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
}

- (void)togglePlayPause
{
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if (objc_msgSend(-[THWAudioRep movieInfo](self, "movieInfo"), "posterImageData"))
  {
    [(THWAudioRep *)self naturalBounds];
  }
  else
  {
    [(THWAudioRep *)self naturalBounds];
    TSDCenterRectOverRect();
  }
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (void)viewScrollWillChange
{
  v4.receiver = self;
  v4.super_class = (Class)THWAudioRep;
  [(THWAudioRep *)&v4 viewScrollWillChange];
  [(THWAudioRep *)self playbackRate];
  if (v3 != 0.0) {
    [(THWAudioRep *)self stop];
  }
}

- (void)drawInContext:(CGContext *)a3
{
  [(THWAudioRep *)self naturalBounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  id v13 = [(THWAudioRep *)self movieInfo];
  if (![v13 posterImageData] && objc_msgSend(v13, "controlStyle") != 1)
  {
    if ([(THWAudioRep *)self isPlaying])
    {
      if ([(THWPressableRepGestureTargetHandler *)[(THWAudioRep *)self pressableHandler] isPressableAtPoint])
      {
        CFStringRef v14 = @"ib_media_btn_pause_bg_well-P";
      }
      else
      {
        CFStringRef v14 = @"ib_media_btn_pause_bg_well";
      }
    }
    else
    {
      unsigned int v15 = [(THWAudioRep *)self isPaused];
      unsigned int v16 = [(THWPressableRepGestureTargetHandler *)[(THWAudioRep *)self pressableHandler] isPressableAtPoint];
      CFStringRef v17 = @"ib_media_btn_audio-N";
      if (v16) {
        CFStringRef v17 = @"ib_media_btn_audio-P";
      }
      CFStringRef v18 = @"ib_media_btn_play_bg_well-P";
      if (!v16) {
        CFStringRef v18 = @"ib_media_btn_play_bg_well";
      }
      if (v15) {
        CFStringRef v14 = v18;
      }
      else {
        CFStringRef v14 = v17;
      }
    }
    id v19 = +[TSUImage imageNamed:v14 inBundle:THBundle()];
    TSDCenterRectOverRect();
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    [self canvas].contentsScale;
    v28 = [v19 CGImageForContentsScale:];
    v42.origin.CGFloat x = v21;
    v42.origin.CGFloat y = v23;
    v42.size.width = v25;
    v42.size.height = v27;
    CGContextDrawImage(a3, v42, v28);
    if ([(THWAudioRep *)self isPlaying] || [(THWAudioRep *)self isPaused])
    {
      [v13 endTime];
      double v30 = v29;
      [v13 startTime];
      double v32 = v30 - v31;
      [(THWAudioRep *)self currentTime];
      double v34 = v33;
      [v13 startTime];
      double v36 = fmax((v34 - v35) / v32, 0.01);
      if (fabs(v36) >= 0.00999999978)
      {
        v43.origin.CGFloat x = v6;
        v43.origin.CGFloat y = v8;
        v43.size.width = v10;
        v43.size.height = v12;
        CGFloat MidX = CGRectGetMidX(v43);
        v44.origin.CGFloat x = v6;
        v44.origin.CGFloat y = v8;
        v44.size.width = v10;
        v44.size.height = v12;
        double MidY = CGRectGetMidY(v44);
        if ([(THWPressableRepGestureTargetHandler *)[(THWAudioRep *)self pressableHandler] isPressed])
        {
          double v39 = 0.5;
        }
        else
        {
          double v39 = 1.0;
        }
        CGContextSetStrokeColorWithColor(a3, (CGColorRef)[+[TSUColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:v39] CGColor]);
        CGContextSetLineWidth(a3, 7.0);
        Mutable = CGPathCreateMutable();
        CGPathMoveToPoint(Mutable, 0, MidX, MidY + -17.82);
        CGPathAddArc(Mutable, 0, MidX, MidY, 17.82, -1.57079633, v36 * 3.14159265 * 2.0 + -1.57079633, 0);
        CGContextAddPath(a3, Mutable);
        CGContextStrokePath(a3);
        CFRelease(Mutable);
      }
    }
  }
}

- (double)playbackRate
{
  mPlayer = self->mPlayer;
  if (!mPlayer) {
    return 0.0;
  }
  [(AVPlayer *)mPlayer rate];
  return v3;
}

- (void)p_playPause:(id)a3
{
  if ([(THWAudioRep *)self isPlaying])
  {
    [(THWAudioRep *)self pause];
  }
  else
  {
    [(THWAudioRep *)self play];
  }
}

- (BOOL)isPlaying
{
  return self->mIsPlaying;
}

- (double)volumeLevel
{
  [(THWAudioRep *)self pVolumeLevel];
  return result;
}

- (BOOL)isMuted
{
  return [(THWAudioRep *)self pMuted];
}

- (void)p_setPlaying:(BOOL)a3
{
  if (self->mIsPlaying != a3)
  {
    self->mIsPlaying = a3;
    objc_super v4 = +[NSNotificationCenter defaultCenter];
    double v5 = v4;
    if (self->mIsPlaying)
    {
      [+[TSKMoviePlaybackRegistry sharedMoviePlaybackRegistry](TSKMoviePlaybackRegistry, "sharedMoviePlaybackRegistry") objectWillBeginMoviePlayback:self];
      [(NSNotificationCenter *)v5 addObserver:self selector:"p_playerDidPlayToEnd:" name:TSKAVPlayerControllerDidPlayToEndNotification object:self->mPlayerController];
      if ([(THWAudioRep *)self observingRate]) {
        [(AVPlayer *)self->mPlayer removeObserver:self forKeyPath:@"rate"];
      }
      [(THWAudioRep *)self setObservingRate:1];
      [(AVPlayer *)self->mPlayer addObserver:self forKeyPath:@"rate" options:0 context:off_56F090];
      self->mPlaybackTimer = +[NSTimer scheduledTimerWithTimeInterval:self target:"timerDidTriggerTimeChangedUpdate" selector:0 userInfo:1 repeats:0.0333333333];
      [(NSNotificationCenter *)v5 addObserver:self selector:"stop" name:UIApplicationDidEnterBackgroundNotification object:0];
      LODWORD(v6) = 1.0;
      [(AVPlayer *)self->mPlayer setRate:v6];
    }
    else
    {
      [(NSNotificationCenter *)v4 removeObserver:self name:TSKAVPlayerControllerDidPlayToEndNotification object:self->mPlayerController];
      [(NSNotificationCenter *)v5 removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:0];
      if ([(THWAudioRep *)self observingRate])
      {
        [(AVPlayer *)self->mPlayer removeObserver:self forKeyPath:@"rate"];
        [(THWAudioRep *)self setObservingRate:0];
      }
      mPlaybackTimer = self->mPlaybackTimer;
      if (mPlaybackTimer)
      {
        [(NSTimer *)mPlaybackTimer invalidate];

        self->mPlaybackTimer = 0;
      }
      [(AVPlayer *)self->mPlayer setRate:0.0];
      [+[TSKMoviePlaybackRegistry sharedMoviePlaybackRegistry](TSKMoviePlaybackRegistry, "sharedMoviePlaybackRegistry") objectDidEndMoviePlayback:self];
    }
    [(THWAudioRep *)self setNeedsDisplay];
    CGFloat v8 = [(THWMovieLayout *)[(THWAudioRep *)self movieLayout] mediaListener];
    [(THWAudioRep *)self playbackRate];
    -[THWAVMediaListener rateChanged:](v8, "rateChanged:");
  }
}

- (void)timerDidTriggerTimeChangedUpdate
{
  [(THWAudioRep *)self ignoreTimeChangeUpdate];
  if (v3 <= 0.0)
  {
    mPlayer = self->mPlayer;
    if (mPlayer)
    {
      [(AVPlayer *)mPlayer currentTime];
      CGFloat v8 = self->mPlayer;
      double v9 = (double)v14;
      if (v8)
      {
        [(AVPlayer *)v8 currentTime];
        double v10 = (double)(int)v12;
LABEL_11:
        -[THWAudioRep timeChanged:](self, "timeChanged:", v9 / v10, v11, v12, v13, v14, v15, v16);
        return;
      }
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      double v9 = 0.0;
      uint64_t v16 = 0;
    }
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    double v10 = 0.0;
    uint64_t v13 = 0;
    goto LABEL_11;
  }
  SFUGetMicroseconds();
  double v5 = v4;
  [(THWAudioRep *)self ignoreTimeChangeUpdate];
  if (v5 > v6)
  {
    [(THWAudioRep *)self setIgnoreTimeChangeUpdate:0.0];
  }
}

- (void)timeChanged:(double)a3
{
  [(THWAVMediaListener *)[(THWMovieLayout *)[(THWAudioRep *)self movieLayout] mediaListener] timeChanged:a3];
  id v4 = [(THWAudioRep *)self movieInfo];
  if ([(THWAudioRep *)self isPlaying]
    && ![v4 posterImageData]
    && [v4 controlStyle] != 1)
  {
    [(THWAudioRep *)self setNeedsDisplay];
  }
}

- (void)p_play
{
  [(THWAudioRep *)self setIsPaused:0];
  id v3 = [(THWAudioRep *)self movieInfo];
  [(THWAudioRep *)self stop];
  id v4 = +[AVPlayerItem playerItemWithAsset:](AVPlayerItem, "playerItemWithAsset:", [v3 makeAVAsset]);
  id v5 = [[self movieInfo] drmContext];
  if (v5 && ([v5 authorizeAVPlayerItemForPlayback:v4] & 1) == 0) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWAudioRep p_play]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Movie/THWAudioRep.m") lineNumber:456 description:@"failed to authorize audio for playback"];
  }
  [(THWAudioRep *)self p_cleanupPlayerAndController];
  memset(&v17, 0, sizeof(v17));
  [v3 startTime];
  CMTimeMakeWithSeconds(&v17, v6, 100);
  CMTime v16 = v17;
  [(AVPlayerItem *)v4 setReversePlaybackEndTime:&v16];
  [v3 endTime];
  if (v7 != 0.0)
  {
    memset(&v16, 0, sizeof(v16));
    [v3 endTime];
    CMTimeMakeWithSeconds(&v16, v8, 100);
    CMTime time = v16;
    [(AVPlayerItem *)v4 setForwardPlaybackEndTime:&time];
  }
  memset(&v16, 0, sizeof(v16));
  if (v4) {
    [(AVPlayerItem *)v4 duration];
  }
  else {
    memset(&lhs, 0, sizeof(lhs));
  }
  [(THWAudioRep *)self timeToBeginPlaybackAt];
  CMTimeMakeWithSeconds(&rhs, v9, 100);
  CMTimeSubtract(&v16, &lhs, &rhs);
  CMTime time = v16;
  if (CMTimeGetSeconds(&time) < 0.2) {
    [(THWAudioRep *)self setTimeToBeginPlaybackAt:0.0];
  }
  [(THWAudioRep *)self timeToBeginPlaybackAt];
  CMTimeMakeWithSeconds(&v12, v10, 100);
  CMTime time = kCMTimeZero;
  CMTime v11 = time;
  [(AVPlayerItem *)v4 seekToTime:&v12 toleranceBefore:&time toleranceAfter:&v11 completionHandler:0];
  self->mPlayer = (AVPlayer *)[objc_alloc((Class)AVPlayer) initWithPlayerItem:v4];
  if (!self->mPlayerController)
  {
    self->mPlayerController = (TSKAVPlayerController *)[objc_alloc((Class)TSKAVPlayerController) initWithPlayer:self->mPlayer delegate:self];
    [v3 loopOption];
    [(TSKAVPlayerController *)self->mPlayerController setRepeatMode:TSKPlayerRepeatModeForMovieLoopOption()];
  }
  [(THWAudioRep *)self p_setPlaying:1];
  [(THWAudioRep *)self setNeedsDisplay];
}

- (void)p_stop
{
  if (self->mPlayer)
  {
    [(THWAudioRep *)self currentTime];
    -[THWAudioRep setTimeToBeginPlaybackAt:](self, "setTimeToBeginPlaybackAt:");
    [(THWAudioRep *)self p_setPlaying:0];
    [(THWAudioRep *)self p_cleanupPlayerAndController];
    [(THWAudioRep *)self timeToBeginPlaybackAt];
    -[THWAudioRep timeChanged:](self, "timeChanged:");
    [(THWAudioRep *)self setNeedsDisplay];
  }
}

- (void)play
{
  [(THWAudioRep *)self p_play];
  objc_opt_class();
  [(THWMovieLayout *)[(THWAudioRep *)self movieLayout] mediaListener];
  uint64_t v3 = TSUDynamicCast();
  id v4 = +[THWAVController sharedController];

  [v4 transportControllerDidStartPlaying:v3];
}

- (void)pause
{
  if (self->mPlayer)
  {
    [(THWAudioRep *)self p_stop];
    [(THWAudioRep *)self setIsPaused:1];
    objc_opt_class();
    [(THWMovieLayout *)[(THWAudioRep *)self movieLayout] mediaListener];
    uint64_t v3 = TSUDynamicCast();
    id v4 = +[THWAVController sharedController];
    [v4 transportControllerDidPausePlaying:v3];
  }
}

- (void)stop
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  id v4 = sub_160764;
  id v5 = &unk_456DE0;
  Float64 v6 = self;
  if (+[NSThread isMainThread])
  {
    v4((uint64_t)v3);
  }
  else
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_1607D8;
    v2[3] = &unk_457868;
    v2[4] = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  }
}

- (void)changeCurrentTimeTo:(double)a3
{
  if (self->mPlayer)
  {
    SFUGetMicroseconds();
    [(THWAudioRep *)self setIgnoreTimeChangeUpdate:v5 + 100000.0];
  }
  if (![(THWAudioRep *)self seeking])
  {
    [(THWAudioRep *)self setSeeking:1];
    mPlayer = self->mPlayer;
    CMTimeMakeWithSeconds(&v12, a3, 100);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_16090C;
    v11[3] = &unk_457140;
    v11[4] = self;
    long long v9 = *(_OWORD *)&kCMTimeZero.value;
    CMTimeEpoch epoch = kCMTimeZero.epoch;
    long long v7 = v9;
    CMTimeEpoch v8 = epoch;
    [(AVPlayer *)mPlayer seekToTime:&v12 toleranceBefore:&v9 toleranceAfter:&v7 completionHandler:v11];
  }
  if (!self->mPlayer) {
    [(THWAudioRep *)self setTimeToBeginPlaybackAt:a3];
  }
}

- (double)currentTime
{
  [(THWAudioRep *)self timeToBeginPlaybackAt];
  mPlayer = self->mPlayer;
  if (mPlayer)
  {
    [(AVPlayer *)mPlayer currentTime];
    return CMTimeGetSeconds(&time);
  }
  return result;
}

- (void)p_playerDidPlayToEnd:(id)a3
{
  if ([(THWAudioRep *)self isPlaying])
  {
    if (!objc_msgSend(-[THWAudioRep movieInfo](self, "movieInfo"), "loopOption")) {
      [(THWAudioRep *)self stop];
    }
    [self movieInfo].startTime;
    -[THWAudioRep setTimeToBeginPlaybackAt:](self, "setTimeToBeginPlaybackAt:");
    id v4 = [(THWMovieLayout *)[(THWAudioRep *)self movieLayout] mediaListener];
    [(THWAVMediaListener *)v4 mediaDidPlayToEnd];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_56F090 == a6)
  {
    if ([(THWAudioRep *)self isPlaying])
    {
      [(AVPlayer *)self->mPlayer rate];
      if (v7 == 0.0)
      {
        Main = CFRunLoopGetMain();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_160AC8;
        block[3] = &unk_456DE0;
        block[4] = self;
        CFRunLoopPerformBlock(Main, kCFRunLoopCommonModes, block);
        CFRunLoopWakeUp(Main);
      }
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)THWAudioRep;
    -[THWAudioRep observeValueForKeyPath:ofObject:change:context:](&v9, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)pressableRepWasPressed:(id)a3 atPoint:(CGPoint)a4
{
  if (objc_msgSend(-[THWAudioRep movieInfo](self, "movieInfo", a3, a4.x, a4.y), "posterImageData"))
  {
    [self movieInfo].startTime
    double v6 = v5;
    if ([(THWAudioRep *)self isPlaying]
      && !objc_msgSend(-[THWAudioRep movieInfo](self, "movieInfo"), "loopOption"))
    {
      [(THWAudioRep *)self changeCurrentTimeTo:v6];
    }
    else if ([(THWAudioRep *)self isPlaying])
    {
      [(THWAudioRep *)self pause];
    }
    else
    {
      [(THWAudioRep *)self changeCurrentTimeTo:v6];
      CMTimeEpoch v8 = [(THWMovieLayout *)[(THWAudioRep *)self movieLayout] mediaListener];
      [(THWAVMediaListener *)v8 playMovie];
    }
  }
  else
  {
    float v7 = [(THWMovieLayout *)[(THWAudioRep *)self movieLayout] mediaListener];
    [(THWAVMediaListener *)v7 mediaWasPressed];
  }
}

- (CALayer)pressableAnimationLayer
{
  id v3 = [(THWAudioRep *)self interactiveCanvasController];

  return (CALayer *)[v3 layerForRep:self];
}

- (CALayer)pressableAnimationShadowLayer
{
  return 0;
}

- (BOOL)wantsPressAnimation
{
  return 1;
}

- (BOOL)wantsPressAction
{
  return 1;
}

- (BOOL)shouldRecognizePressOnRep:(id)a3
{
  return a3 == self;
}

- (BOOL)canExpand
{
  return 0;
}

- (BOOL)canHandleGesture:(id)a3
{
  id v4 = [(THWAudioRep *)self pressableHandler];

  return [(THWPressableRepGestureTargetHandler *)v4 canHandleGesture:a3];
}

- (BOOL)handleGesture:(id)a3
{
  BOOL v4 = [(THWPressableRepGestureTargetHandler *)[(THWAudioRep *)self pressableHandler] handleGesture:a3];
  [(THWAudioRep *)self setNeedsDisplay];
  return v4;
}

- (TSDContainerInfo)containerInfo
{
  return 0;
}

- (BOOL)canSelectChildRep:(id)a3
{
  return 0;
}

- (void)setChildReps:(id)a3
{
  childReps = self->_childReps;
  if (childReps != a3)
  {
    [(NSArray *)childReps makeObjectsPerformSelector:"setParentRep:" withObject:0];

    double v6 = (NSArray *)a3;
    self->_childReps = v6;
    [(NSArray *)v6 makeObjectsPerformSelector:"setParentRep:" withObject:self];
  }
}

- (void)updateChildrenFromLayout
{
  id v3 = +[TSDContainerRep childrenFromLayoutInContainerRep:self];

  [(THWAudioRep *)self setChildReps:v3];
}

- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5
{
  return +[TSDContainerRep containerRep:hitRep:withGesture:passingTest:](TSDContainerRep, "containerRep:hitRep:withGesture:passingTest:", self, a4, a5, a3.x, a3.y);
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  id v6 = [(THWAudioRep *)self layout];
  if (v6)
  {
    id v7 = [v6 mediaListener];
    [v7 control:a3 repWasAdded:a4];
  }
}

- (void)control:(id)a3 repWillBeRemoved:(id)a4
{
  id v6 = [(THWAudioRep *)self layout];
  if (v6)
  {
    id v7 = [v6 mediaListener];
    [v7 control:a3 repWillBeRemoved:a4];
  }
}

- (THWAutoplayConfig)autoplayConfig
{
  [(THWAudioRep *)self info];
  double result = (THWAutoplayConfig *)TSUProtocolCast();
  if (result)
  {
    return (THWAutoplayConfig *)[(THWAutoplayConfig *)result autoplayConfig];
  }
  return result;
}

- (BOOL)autoplayAllowed
{
  return 1;
}

- (void)autoplayStart
{
  if (![(THWAudioRep *)self isPlaying])
  {
    [(THWAudioRep *)self changeCurrentTimeTo:0.0];
    [(THWAudioRep *)self p_play];
    objc_opt_class();
    [(THWMovieLayout *)[(THWAudioRep *)self movieLayout] mediaListener];
    uint64_t v3 = TSUDynamicCast();
    id v4 = +[THWAVController sharedController];
    [v4 transportControllerDidStartAutoplaying:v3];
  }
}

- (void)autoplayStop
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  id v4 = sub_16109C;
  double v5 = &unk_456DE0;
  id v6 = self;
  if (+[NSThread isMainThread])
  {
    v4((uint64_t)v3);
  }
  else
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_161134;
    v2[3] = &unk_457868;
    v2[4] = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  }
}

- (void)autoplayPause
{
  if ([(THWAudioRep *)self isPlaying])
  {
    [(THWAudioRep *)self pause];
  }
}

- (BOOL)handlingPress
{
  return self->_handlingPress;
}

- (void)setHandlingPress:(BOOL)a3
{
  self->_handlingPress = a3;
}

- (void)setPressableHandler:(id)a3
{
}

- (BOOL)createdPressableHandler
{
  return self->_createdPressableHandler;
}

- (void)setCreatedPressableHandler:(BOOL)a3
{
  self->_createdPressableHandler = a3;
}

- (double)timeToBeginPlaybackAt
{
  return self->_timeToBeginPlaybackAt;
}

- (void)setTimeToBeginPlaybackAt:(double)a3
{
  self->_timeToBeginPlaybackAt = a3;
}

- (NSArray)childReps
{
  return self->_childReps;
}

- (double)pVolumeLevel
{
  return self->_pVolumeLevel;
}

- (void)setPVolumeLevel:(double)a3
{
  self->_pVolumeLevel = a3;
}

- (BOOL)pMuted
{
  return self->_pMuted;
}

- (void)setPMuted:(BOOL)a3
{
  self->_pMuted = a3;
}

- (BOOL)observingRate
{
  return self->_observingRate;
}

- (void)setObservingRate:(BOOL)a3
{
  self->_observingRate = a3;
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (void)setIsPaused:(BOOL)a3
{
  self->_isPaused = a3;
}

- (double)ignoreTimeChangeUpdate
{
  return self->_ignoreTimeChangeUpdate;
}

- (void)setIgnoreTimeChangeUpdate:(double)a3
{
  self->_ignoreTimeChangeUpdate = a3;
}

- (BOOL)seeking
{
  return self->_seeking;
}

- (void)setSeeking:(BOOL)a3
{
  self->_seeking = a3;
}

@end