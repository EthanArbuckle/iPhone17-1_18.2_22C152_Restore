@interface ISLiveWallpaperPlayer
- (BOOL)_active;
- (BOOL)_isSeeking;
- (BOOL)isTouching;
- (ISDisplayLink)_displayLink;
- (double)force;
- (float)_playRate;
- (void)_handleDidFinishSeeking:(BOOL)a3;
- (void)_seekVideoToBeginning;
- (void)_seekVideoToEnd;
- (void)_setActive:(BOOL)a3;
- (void)_setDisplayLink:(id)a3;
- (void)_setPlayRate:(float)a3;
- (void)_setSeeking:(BOOL)a3;
- (void)_update;
- (void)_updatePlayer;
- (void)didPerformChanges;
- (void)setForce:(double)a3;
- (void)setPlayerItem:(id)a3;
- (void)setTouching:(BOOL)a3;
- (void)statusDidChange;
@end

@implementation ISLiveWallpaperPlayer

- (float)_playRate
{
  return self->__playRate;
}

- (void)_setSeeking:(BOOL)a3
{
  self->__seeking = a3;
}

- (BOOL)_isSeeking
{
  return self->__seeking;
}

- (void)_setDisplayLink:(id)a3
{
  self->__displayLink = (ISDisplayLink *)a3;
}

- (ISDisplayLink)_displayLink
{
  return self->__displayLink;
}

- (BOOL)_active
{
  return self->__active;
}

- (double)force
{
  return self->_force;
}

- (BOOL)isTouching
{
  return self->_touching;
}

- (void)_handleDidFinishSeeking:(BOOL)a3
{
  [(ISLiveWallpaperPlayer *)self _setSeeking:0];

  [(ISLiveWallpaperPlayer *)self _updatePlayer];
}

- (void)_seekVideoToEnd
{
  if (![(ISLiveWallpaperPlayer *)self _isSeeking])
  {
    [(ISLiveWallpaperPlayer *)self _setSeeking:1];
    objc_initWeak(&location, self);
    v3 = [(ISBasePlayer *)self videoPlayer];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__ISLiveWallpaperPlayer__seekVideoToEnd__block_invoke;
    v10[3] = &unk_1E6BEC808;
    objc_copyWeak(&v11, &location);
    long long v8 = *(_OWORD *)&self->_videoDuration.value;
    int64_t epoch = self->_videoDuration.epoch;
    long long v6 = *MEMORY[0x1E4F1FA48];
    uint64_t v7 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    long long v4 = v6;
    uint64_t v5 = v7;
    [v3 seekToTime:&v8 toleranceBefore:&v6 toleranceAfter:&v4 completionHandler:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __40__ISLiveWallpaperPlayer__seekVideoToEnd__block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__ISLiveWallpaperPlayer__seekVideoToEnd__block_invoke_2;
  v3[3] = &unk_1E6BEC7E0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = a2;
  is_dispatch_on_main_queue(v3);
  objc_destroyWeak(&v4);
}

void __40__ISLiveWallpaperPlayer__seekVideoToEnd__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDidFinishSeeking:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_seekVideoToBeginning
{
  if (![(ISLiveWallpaperPlayer *)self _isSeeking])
  {
    [(ISLiveWallpaperPlayer *)self _setSeeking:1];
    objc_initWeak(&location, self);
    v3 = [(ISBasePlayer *)self videoPlayer];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__ISLiveWallpaperPlayer__seekVideoToBeginning__block_invoke;
    v10[3] = &unk_1E6BEC808;
    objc_copyWeak(&v11, &location);
    long long v8 = *MEMORY[0x1E4F1FA48];
    uint64_t v9 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    long long v6 = v8;
    uint64_t v7 = v9;
    long long v4 = v8;
    uint64_t v5 = v9;
    [v3 seekToTime:&v8 toleranceBefore:&v6 toleranceAfter:&v4 completionHandler:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __46__ISLiveWallpaperPlayer__seekVideoToBeginning__block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__ISLiveWallpaperPlayer__seekVideoToBeginning__block_invoke_2;
  v3[3] = &unk_1E6BEC7E0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = a2;
  is_dispatch_on_main_queue(v3);
  objc_destroyWeak(&v4);
}

void __46__ISLiveWallpaperPlayer__seekVideoToBeginning__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDidFinishSeeking:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_updatePlayer
{
  v3 = [(ISBasePlayer *)self videoPlayer];
  [(ISLiveWallpaperPlayer *)self _playRate];
  float v5 = v4;
  $95D729B680665BEAEFA1D6FCA8238556 videoDuration = self->_videoDuration;
  memset(&v20, 0, sizeof(v20));
  if (v3) {
    [v3 currentTime];
  }
  [v3 rate];
  float v7 = v6;
  CMTime time1 = v20;
  $95D729B680665BEAEFA1D6FCA8238556 v18 = *($95D729B680665BEAEFA1D6FCA8238556 *)*(void *)&MEMORY[0x1E4F1FA48];
  int32_t v8 = CMTimeCompare(&time1, (CMTime *)&v18);
  BOOL v10 = v5 < 0.0 && v8 < 1;
  CMTime time1 = v20;
  $95D729B680665BEAEFA1D6FCA8238556 v18 = videoDuration;
  BOOL v11 = 0;
  if ((CMTimeCompare(&time1, (CMTime *)&v18) & 0x80000000) == 0 && v5 > 0.0) {
    BOOL v11 = (v20.flags & 0x1D) == 1;
  }
  double v12 = vabds_f32(v7, v5);
  v13 = +[ISPlayerSettings sharedInstance];
  [v13 forceScrubMinRateChange];
  double v15 = v14;

  char v16 = v15 >= v12 || v10;
  if ((v16 & 1) == 0 && !v11)
  {
    CMTime time1 = v20;
    if (CMTimeGetSeconds(&time1) >= 0.0)
    {
      CMTime time1 = v20;
      $95D729B680665BEAEFA1D6FCA8238556 v18 = videoDuration;
      if (CMTimeCompare(&time1, (CMTime *)&v18) < 1)
      {
        *(float *)&double v17 = v5;
        [v3 setRate:v17];
      }
      else
      {
        [(ISLiveWallpaperPlayer *)self _seekVideoToEnd];
      }
    }
    else
    {
      [(ISLiveWallpaperPlayer *)self _seekVideoToBeginning];
    }
  }
}

- (void)_setPlayRate:(float)a3
{
  if (self->__playRate != a3)
  {
    self->__playRate = a3;
    [(ISLiveWallpaperPlayer *)self _updatePlayer];
  }
}

- (void)_setActive:(BOOL)a3
{
  if (self->__active != a3)
  {
    BOOL v3 = a3;
    self->__active = a3;
    [(ISObservable *)self signalChange:16];
    float v5 = [(ISLiveWallpaperPlayer *)self _displayLink];

    if (v3)
    {
      if (!v5)
      {
        float v6 = [[ISPlayerState alloc] initWithPhotoBlurRadius:@"WALLPAPER PLAY" videoAlpha:0.0 videoBlurRadius:1.0 label:0.0];
        [(ISBasePlayer *)self applyOutputInfo:v6 fromBehavior:0 withTransitionOptions:0 completion:0];
        objc_initWeak(&location, self);
        float v7 = [ISDisplayLink alloc];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __36__ISLiveWallpaperPlayer__setActive___block_invoke;
        v11[3] = &unk_1E6BECBD0;
        objc_copyWeak(&v12, &location);
        int32_t v8 = [(ISDisplayLink *)v7 initWithUpdateHandler:v11 completionHandler:0];
        [(ISLiveWallpaperPlayer *)self _setDisplayLink:v8];
        [(ISDisplayLink *)v8 start];

        objc_destroyWeak(&v12);
        objc_destroyWeak(&location);
      }
    }
    else if (v5)
    {
      BOOL v10 = [[ISPlayerState alloc] initWithPhotoBlurRadius:@"WALLPAPER STOP" videoAlpha:0.0 videoBlurRadius:0.0 label:0.0];
      [(ISBasePlayer *)self applyOutputInfo:v10 fromBehavior:0 withTransitionOptions:0 completion:0];
      uint64_t v9 = [(ISLiveWallpaperPlayer *)self _displayLink];
      [v9 stop];

      [(ISLiveWallpaperPlayer *)self _setDisplayLink:0];
      self->_smoothedVelocity = 0.0;
    }
  }
}

void __36__ISLiveWallpaperPlayer__setActive___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _update];
}

- (void)_update
{
  uint64_t v3 = [(ISBasePlayer *)self videoPlayer];
  if (v3)
  {
    float v4 = (void *)v3;
    uint64_t v5 = [(ISBasePlayer *)self status];

    if (v5 >= 1)
    {
      unsigned int flags = self->_videoDuration.flags;
      if ((flags & 0x1D) != 1)
      {
        long long v13 = 0uLL;
        int64_t v14 = 0;
        float v7 = [(ISBasePlayer *)self videoPlayer];
        int32_t v8 = [v7 currentItem];
        uint64_t v9 = [v8 asset];
        BOOL v10 = v9;
        if (v9)
        {
          [v9 duration];
        }
        else
        {
          long long v13 = 0uLL;
          int64_t v14 = 0;
        }

        *(_OWORD *)&self->_videoDuration.value = v13;
        self->_videoDuration.int64_t epoch = v14;
        unsigned int flags = self->_videoDuration.flags;
      }
      if ((flags & 0x1D) == 1)
      {
        long long v13 = 0uLL;
        int64_t v14 = 0;
        BOOL v11 = [(ISBasePlayer *)self videoPlayer];
        id v12 = v11;
        if (v11)
        {
          [v11 currentTime];
        }
        else
        {
          long long v13 = 0uLL;
          int64_t v14 = 0;
        }
      }
    }
  }
}

uint64_t __32__ISLiveWallpaperPlayer__update__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setActive:1];
}

uint64_t __32__ISLiveWallpaperPlayer__update__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setActive:0];
}

- (void)statusDidChange
{
  v2.receiver = self;
  v2.super_class = (Class)ISLiveWallpaperPlayer;
  [(ISBasePlayer *)&v2 statusDidChange];
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)ISLiveWallpaperPlayer;
  [(ISBasePlayer *)&v3 didPerformChanges];
  [(ISLiveWallpaperPlayer *)self _update];
}

- (void)setForce:(double)a3
{
  if (self->_force != a3)
  {
    self->_force = a3;
    [(ISObservable *)self signalChange:8];
  }
}

- (void)setTouching:(BOOL)a3
{
  if (self->_touching != a3)
  {
    self->_touching = a3;
    [(ISObservable *)self signalChange:4];
  }
}

- (void)setPlayerItem:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ISLiveWallpaperPlayer;
  id v3 = a3;
  [(ISBasePlayer *)&v4 setPlayerItem:v3];
  objc_msgSend(v3, "setReversesMoreVideoFramesInMemory:", 1, v4.receiver, v4.super_class);
  [v3 setAggressivelyCacheVideoFrames:1];
  [v3 setDecodesAllFramesDuringOrdinaryPlayback:1];
}

@end