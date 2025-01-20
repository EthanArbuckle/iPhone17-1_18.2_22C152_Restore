@interface ISLivePhotoVitalityBehavior
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackEndTime;
- (BOOL)_isPreparing;
- (BOOL)_shouldPlayAfterPreparation;
- (BOOL)isPlaying;
- (BOOL)isPlayingBeyondPhoto;
- (BOOL)isPrepared;
- (BOOL)pauseDuringTransition;
- (ISLivePhotoVitalityBehavior)initWithInitialLayoutInfo:(id)a3 playbackEndTime:(id *)a4 playDuration:(id *)a5 playRate:(float)a6 photoTransitionDuration:(double)a7 pauseDuringTransition:(BOOL)a8 assetOptions:(unint64_t)a9;
- (double)photoTransitionDuration;
- (float)playRate;
- (int64_t)behaviorType;
- (unint64_t)assetOptions;
- (void)_didReachTransitionTime;
- (void)_didReachTransitionToPhotoTime;
- (void)_handleDidFinishPreroll;
- (void)_handleDidSeekToStartTime;
- (void)_setPlayingBeyondPhoto:(BOOL)a3;
- (void)_setPrepared:(BOOL)a3;
- (void)_setPreparing:(BOOL)a3;
- (void)_setShouldPlayAfterPreparation:(BOOL)a3;
- (void)_startObservingVideo;
- (void)_startVideoPlayback;
- (void)_stopObservingVideo;
- (void)activeDidChange;
- (void)cancelSettleToPhoto;
- (void)dealloc;
- (void)playVitality;
- (void)prepareForVitality;
- (void)videoReadyForDisplayDidChange;
@end

@implementation ISLivePhotoVitalityBehavior

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transitionToPhotoObserver, 0);

  objc_storeStrong(&self->_easeOutObserver, 0);
}

- (void)_setShouldPlayAfterPreparation:(BOOL)a3
{
  self->__shouldPlayAfterPreparation = a3;
}

- (BOOL)_shouldPlayAfterPreparation
{
  return self->__shouldPlayAfterPreparation;
}

- (void)_setPreparing:(BOOL)a3
{
  self->_preparing = a3;
}

- (BOOL)_isPreparing
{
  return self->_preparing;
}

- (void)_setPlayingBeyondPhoto:(BOOL)a3
{
  self->_playingBeyondPhoto = a3;
}

- (BOOL)isPlayingBeyondPhoto
{
  return self->_playingBeyondPhoto;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (void)_setPrepared:(BOOL)a3
{
  self->_prepared = a3;
}

- (BOOL)isPrepared
{
  return self->_prepared;
}

- (float)playRate
{
  return self->_playRate;
}

- (unint64_t)assetOptions
{
  return self->_assetOptions;
}

- (BOOL)pauseDuringTransition
{
  return self->_pauseDuringTransition;
}

- (double)photoTransitionDuration
{
  return self->_photoTransitionDuration;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 104);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackEndTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- (void)cancelSettleToPhoto
{
  v4 = [[ISPlayerState alloc] initWithPhotoBlurRadius:@"Continue Vitality" videoAlpha:0.0 videoBlurRadius:1.0 label:0.0];
  [(ISBehavior *)self setOutputInfo:v4 withTransitionOptions:0 completion:0];
  LODWORD(v3) = 1.0;
  [(ISBehavior *)self setVideoPlayRate:v3];
  [(ISLivePhotoVitalityBehavior *)self _setPlayingBeyondPhoto:1];
}

- (void)_didReachTransitionToPhotoTime
{
  double v3 = [(ISBehavior *)self delegate];
  int v4 = [v3 vitalityBehaviorShouldEndPlayingAtPhoto:self];

  if (v4)
  {
    v5 = [[ISPlayerState alloc] initWithPhotoBlurRadius:@"Vitality End" videoAlpha:0.0 videoBlurRadius:0.0 label:0.0];
    v6 = objc_alloc_init(ISPlayerOutputTransitionOptions);
    [(ISLivePhotoVitalityBehavior *)self photoTransitionDuration];
    double v8 = v7;
    v9 = [(ISBehavior *)self delegate];
    [v9 videoPlayRate];
    float v11 = v10;

    if (v11 > 0.0) {
      double v8 = v8 / v11;
    }
    v12 = +[ISVitalitySettings sharedInstance];
    [v12 minimumPhotoTransitionDuration];
    if (v13 < v8) {
      double v13 = v8;
    }
    [(ISPlayerOutputTransitionOptions *)v6 setTransitionDuration:v13];
    self->_playing = 0;
    v14 = [(ISBehavior *)self delegate];
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__ISLivePhotoVitalityBehavior__didReachTransitionToPhotoTime__block_invoke;
    v16[3] = &unk_1E6BEC7B8;
    id v15 = v14;
    id v17 = v15;
    objc_copyWeak(&v18, &location);
    [(ISBehavior *)self setOutputInfo:v5 withTransitionOptions:v6 completion:v16];
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
  }
}

void __61__ISLivePhotoVitalityBehavior__didReachTransitionToPhotoTime__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v1 vitalityBehaviorDidEndPlaying:WeakRetained];
}

- (void)_didReachTransitionTime
{
  double v3 = +[ISPlayerSettings sharedInstance];
  if ([v3 easingEnabled]
    && ([(ISBehavior *)self delegate],
        int v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 vitalityBehaviorShouldEndPlayingAtPhoto:self],
        v4,
        v5))
  {
    v6 = [(ISBehavior *)self delegate];
    [(ISLivePhotoVitalityBehavior *)self playbackEndTime];
    LODWORD(v7) = 1.0;
    [v6 behavior:self playVideoToTime:v8 initialRate:0 overDuration:v7 progressHandler:0.0];
  }
  else
  {
    [(ISLivePhotoVitalityBehavior *)self _setPlayingBeyondPhoto:1];
  }
}

- (void)_startVideoPlayback
{
  [(ISLivePhotoVitalityBehavior *)self _setPrepared:0];
  [(ISLivePhotoVitalityBehavior *)self _setShouldPlayAfterPreparation:0];
  double v8 = objc_alloc_init(ISPlayerOutputTransitionOptions);
  [(ISPlayerOutputTransitionOptions *)v8 setTransitionDuration:0.15];
  double v3 = [[ISPlayerState alloc] initWithPhotoBlurRadius:@"Show video for vitality" videoAlpha:0.0 videoBlurRadius:1.0 label:0.0];
  [(ISBehavior *)self setOutputInfo:v3 withTransitionOptions:v8 completion:0];
  [(ISLivePhotoVitalityBehavior *)self playRate];
  int v5 = v4;
  [(ISBehavior *)self setVideoVolume:0.0];
  LODWORD(v6) = v5;
  [(ISBehavior *)self setVideoPlayRate:v6];
  self->_playing = 1;
  double v7 = [(ISBehavior *)self delegate];
  [v7 vitalityBehaviorDidBeginPlaying:self];
}

- (void)videoReadyForDisplayDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)ISLivePhotoVitalityBehavior;
  [(ISBehavior *)&v3 videoReadyForDisplayDidChange];
  if ([(ISLivePhotoVitalityBehavior *)self _shouldPlayAfterPreparation])
  {
    if (![(ISLivePhotoVitalityBehavior *)self isPlaying]) {
      [(ISLivePhotoVitalityBehavior *)self _startVideoPlayback];
    }
  }
}

- (void)playVitality
{
  if ([(ISBehavior *)self isActive])
  {
    if ([(ISLivePhotoVitalityBehavior *)self isPrepared])
    {
      [(ISLivePhotoVitalityBehavior *)self _startVideoPlayback];
    }
    else
    {
      BOOL v3 = [(ISLivePhotoVitalityBehavior *)self _isPreparing];
      [(ISLivePhotoVitalityBehavior *)self _setShouldPlayAfterPreparation:1];
      if (!v3)
      {
        [(ISLivePhotoVitalityBehavior *)self prepareForVitality];
      }
    }
  }
}

- (int64_t)behaviorType
{
  return 3;
}

- (void)_handleDidFinishPreroll
{
  [(ISLivePhotoVitalityBehavior *)self _setPreparing:0];
  [(ISLivePhotoVitalityBehavior *)self _setPrepared:1];
  if ([(ISLivePhotoVitalityBehavior *)self _shouldPlayAfterPreparation])
  {
    [(ISLivePhotoVitalityBehavior *)self playVitality];
  }
}

- (void)_handleDidSeekToStartTime
{
  memset(&v8, 0, sizeof(v8));
  [(ISLivePhotoVitalityBehavior *)self playbackEndTime];
  CMTimeMake(&rhs, 2, 600);
  CMTime v5 = v8;
  CMTimeSubtract(&v7, &v5, &rhs);
  CMTime v8 = v7;
  [(ISBehavior *)self setVideoForwardPlaybackEndTime:&v7];
  BOOL v3 = +[ISVitalitySettings sharedInstance];
  int v4 = [v3 shouldPreroll];

  if (v4)
  {
    [(ISLivePhotoVitalityBehavior *)self playRate];
    -[ISBehavior prerollVideoAtRate:completionHandler:](self, "prerollVideoAtRate:completionHandler:", &__block_literal_global_1261);
  }
  [(ISLivePhotoVitalityBehavior *)self _handleDidFinishPreroll];
}

- (void)_stopObservingVideo
{
  BOOL v3 = [(ISBehavior *)self delegate];
  [v3 behavior:self removeTimeObserver:self->_easeOutObserver];

  id v4 = [(ISBehavior *)self delegate];
  [v4 behavior:self removeTimeObserver:self->_transitionToPhotoObserver];
}

- (void)_startObservingVideo
{
  v31[1] = *MEMORY[0x1E4F143B8];
  memset(&v29, 0, sizeof(v29));
  [(ISLivePhotoVitalityBehavior *)self playbackEndTime];
  BOOL v3 = +[ISPlayerSettings sharedInstance];
  [v3 vitalityEaseDuration];
  CMTimeMakeWithSeconds(&rhs, v4, 600);
  CMTimeSubtract(&v29, &lhs, &rhs);

  memset(&v26, 0, sizeof(v26));
  [(ISLivePhotoVitalityBehavior *)self playbackEndTime];
  [(ISLivePhotoVitalityBehavior *)self photoTransitionDuration];
  CMTimeMakeWithSeconds(&v24, v5, 600);
  CMTimeSubtract(&v26, &v25, &v24);
  CMTimeMake(&time1, 1, 30);
  CMTime time2 = v26;
  CMTimeMaximum(&v23, &time1, &time2);
  CMTime v26 = v23;
  objc_initWeak((id *)&time2, self);
  double v6 = [(ISBehavior *)self delegate];
  CMTime v23 = v29;
  CMTime v7 = [MEMORY[0x1E4F29238] valueWithCMTime:&v23];
  v31[0] = v7;
  CMTime v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  id v9 = MEMORY[0x1E4F14428];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __51__ISLivePhotoVitalityBehavior__startObservingVideo__block_invoke;
  v19[3] = &unk_1E6BECB10;
  objc_copyWeak(&v20, (id *)&time2);
  float v10 = [v6 behavior:self addBoundaryTimeObserverForTimes:v8 queue:MEMORY[0x1E4F14428] usingBlock:v19];
  id easeOutObserver = self->_easeOutObserver;
  self->_id easeOutObserver = v10;

  v12 = [(ISBehavior *)self delegate];
  CMTime v23 = v26;
  double v13 = [MEMORY[0x1E4F29238] valueWithCMTime:&v23];
  v30 = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__ISLivePhotoVitalityBehavior__startObservingVideo__block_invoke_2;
  v17[3] = &unk_1E6BECB10;
  objc_copyWeak(&v18, (id *)&time2);
  id v15 = [v12 behavior:self addBoundaryTimeObserverForTimes:v14 queue:MEMORY[0x1E4F14428] usingBlock:v17];
  id transitionToPhotoObserver = self->_transitionToPhotoObserver;
  self->_id transitionToPhotoObserver = v15;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)&time2);
}

void __51__ISLivePhotoVitalityBehavior__startObservingVideo__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didReachTransitionTime];
}

void __51__ISLivePhotoVitalityBehavior__startObservingVideo__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didReachTransitionToPhotoTime];
}

- (void)prepareForVitality
{
  if (![(ISLivePhotoVitalityBehavior *)self _isPreparing]
    && ![(ISLivePhotoVitalityBehavior *)self isPrepared]
    && [(ISBehavior *)self isActive])
  {
    [(ISLivePhotoVitalityBehavior *)self _setPreparing:1];
    memset(&v17[1], 0, sizeof(CMTime));
    [(ISLivePhotoVitalityBehavior *)self playbackEndTime];
    memset(v17, 0, 24);
    [(ISLivePhotoVitalityBehavior *)self playDuration];
    memset(&v16, 0, sizeof(v16));
    CMTime lhs = v17[1];
    CMTime rhs = v17[0];
    CMTimeSubtract(&v16, &lhs, &rhs);
    CMTime rhs = v16;
    CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    CMTimeMaximum(&lhs, &rhs, &time2);
    CMTime v16 = lhs;
    objc_initWeak(&location, self);
    BOOL v3 = +[ISVitalitySettings sharedInstance];
    Float64 v4 = [v3 oneUpSettings];
    [v4 startSeekTolerance];
    double v6 = v5;

    memset(&lhs, 0, sizeof(lhs));
    Float64 v7 = v6 * 0.5;
    CMTimeMakeWithSeconds(&lhs, v7, 600);
    memset(&rhs, 0, sizeof(rhs));
    CMTimeMakeWithSeconds(&rhs, v7, 600);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__ISLivePhotoVitalityBehavior_prepareForVitality__block_invoke;
    v10[3] = &unk_1E6BEC808;
    objc_copyWeak(&v11, &location);
    CMTime time2 = v16;
    CMTime v9 = lhs;
    CMTime v8 = rhs;
    if (![(ISBehavior *)self seekVideoPlayerToTime:&time2 toleranceBefore:&v9 toleranceAfter:&v8 completionHandler:v10])[(ISLivePhotoVitalityBehavior *)self _setPreparing:0]; {
    objc_destroyWeak(&v11);
    }
    objc_destroyWeak(&location);
  }
}

void __49__ISLivePhotoVitalityBehavior_prepareForVitality__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __49__ISLivePhotoVitalityBehavior_prepareForVitality__block_invoke_2;
    v2[3] = &unk_1E6BECB10;
    objc_copyWeak(&v3, (id *)(a1 + 32));
    is_dispatch_on_main_queue(v2);
    objc_destroyWeak(&v3);
  }
}

void __49__ISLivePhotoVitalityBehavior_prepareForVitality__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDidSeekToStartTime];
}

- (void)activeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)ISLivePhotoVitalityBehavior;
  [(ISBehavior *)&v3 activeDidChange];
  [(ISLivePhotoVitalityBehavior *)self _setPreparing:0];
  [(ISLivePhotoVitalityBehavior *)self _setPrepared:0];
  if ([(ISBehavior *)self isActive])
  {
    [(ISLivePhotoVitalityBehavior *)self _startObservingVideo];
    [(ISBehavior *)self setVideoVolume:0.0];
  }
  else
  {
    [(ISLivePhotoVitalityBehavior *)self _stopObservingVideo];
  }
}

- (ISLivePhotoVitalityBehavior)initWithInitialLayoutInfo:(id)a3 playbackEndTime:(id *)a4 playDuration:(id *)a5 playRate:(float)a6 photoTransitionDuration:(double)a7 pauseDuringTransition:(BOOL)a8 assetOptions:(unint64_t)a9
{
  v18.receiver = self;
  v18.super_class = (Class)ISLivePhotoVitalityBehavior;
  result = [(ISBehavior *)&v18 initWithInitialLayoutInfo:a3];
  if (result)
  {
    int64_t var3 = a4->var3;
    *(_OWORD *)&result->_playbackEndTime.value = *(_OWORD *)&a4->var0;
    result->_playbackEndTime.epoch = var3;
    int64_t v17 = a5->var3;
    *(_OWORD *)&result->_playDuration.value = *(_OWORD *)&a5->var0;
    result->_playDuration.epoch = v17;
    result->_playRate = a6;
    result->_photoTransitionDuration = a7;
    result->_pauseDuringTransition = a8;
    result->_assetOptions = a9;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3 = [(ISBehavior *)self delegate];
  [v3 behavior:self removeTimeObserver:self->_easeOutObserver];

  Float64 v4 = [(ISBehavior *)self delegate];
  [v4 behavior:self removeTimeObserver:self->_transitionToPhotoObserver];

  v5.receiver = self;
  v5.super_class = (Class)ISLivePhotoVitalityBehavior;
  [(ISLivePhotoVitalityBehavior *)&v5 dealloc];
}

@end