@interface ISLivePhotoPlaybackBehavior
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)keyTime;
- ($D31FB86CA7B02E89CA780FE277FE9EC8)playbackTimeRange;
- (BOOL)_isPreparing;
- (BOOL)_isVideoReadyToPlay;
- (BOOL)hasBlurryTransition;
- (BOOL)immediatelyShowsPhotoWhenPlaybackEnds;
- (BOOL)isTransitioningToPhoto;
- (ISLivePhotoPlaybackBehavior)initWithInitialLayoutInfo:(id)a3 keyTime:(id *)a4 playbackTimeRange:(id *)a5 photoTransitionDuration:(double)a6 immediatelyShowsPhotoWhenPlaybackEnds:(BOOL)a7 hasBlurryTransition:(BOOL)a8;
- (double)photoTransitionDuration;
- (int64_t)_currentPlaybackID;
- (int64_t)_readyToPlayPlaybackID;
- (int64_t)behaviorType;
- (void)_didFinishPreparing;
- (void)_handleDidFinish;
- (void)_handleDidSeekToBeginning;
- (void)_prepareVideoForPlaybackIfNeeded;
- (void)_prerollWithCompletionHandler:(id)a3;
- (void)_setCurrentPlaybackID:(int64_t)a3;
- (void)_setPreparing:(BOOL)a3;
- (void)_setReadyToPlayPlaybackID:(int64_t)a3;
- (void)_setVideoReadyToPlay:(BOOL)a3;
- (void)_showVideoWithPlaybackID:(int64_t)a3;
- (void)_startPlaybackWithPlaybackID:(int64_t)a3;
- (void)_transitionToVideoWithPlaybackID:(int64_t)a3;
- (void)activeDidChange;
- (void)setDelegate:(id)a3;
- (void)startPlayback;
- (void)videoDidPlayToEnd;
- (void)videoWillPlayToEnd;
@end

@implementation ISLivePhotoPlaybackBehavior

- (void)_setPreparing:(BOOL)a3
{
  self->__preparing = a3;
}

- (BOOL)_isPreparing
{
  return self->__preparing;
}

- (void)_setVideoReadyToPlay:(BOOL)a3
{
  self->__videoReadyToPlay = a3;
}

- (BOOL)_isVideoReadyToPlay
{
  return self->__videoReadyToPlay;
}

- (void)_setReadyToPlayPlaybackID:(int64_t)a3
{
  self->__readyToPlayPlaybackID = a3;
}

- (int64_t)_readyToPlayPlaybackID
{
  return self->__readyToPlayPlaybackID;
}

- (void)_setCurrentPlaybackID:(int64_t)a3
{
  self->__currentPlaybackID = a3;
}

- (int64_t)_currentPlaybackID
{
  return self->__currentPlaybackID;
}

- (BOOL)isTransitioningToPhoto
{
  return self->_isTransitioningToPhoto;
}

- (BOOL)hasBlurryTransition
{
  return self->_hasBlurryTransition;
}

- (BOOL)immediatelyShowsPhotoWhenPlaybackEnds
{
  return self->_immediatelyShowsPhotoWhenPlaybackEnds;
}

- (double)photoTransitionDuration
{
  return self->_photoTransitionDuration;
}

- ($D31FB86CA7B02E89CA780FE277FE9EC8)playbackTimeRange
{
  long long v3 = *(_OWORD *)&self[2].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var1.var0;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)keyTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (void)_showVideoWithPlaybackID:(int64_t)a3
{
  if ([(ISLivePhotoPlaybackBehavior *)self _currentPlaybackID] == a3)
  {
    double v4 = 3.5;
    if (!self->_hasBlurryTransition) {
      double v4 = 0.0;
    }
    id v6 = +[ISPlayerState outputInfoWithPhotoBlurRadius:@"SHOW VIDEO PLAYBACK" videoAlpha:v4 videoBlurRadius:1.0 label:0.0];
    v5 = objc_alloc_init(ISPlayerOutputTransitionOptions);
    [(ISPlayerOutputTransitionOptions *)v5 setTransitionDuration:0.3];
    [(ISBehavior *)self setOutputInfo:v6 withTransitionOptions:v5 completion:0];
  }
}

- (void)_transitionToVideoWithPlaybackID:(int64_t)a3
{
  if ([(ISLivePhotoPlaybackBehavior *)self _currentPlaybackID] == a3)
  {
    LODWORD(v5) = 1.0;
    [(ISBehavior *)self setVideoPlayRate:v5];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __64__ISLivePhotoPlaybackBehavior__transitionToVideoWithPlaybackID___block_invoke;
    v6[3] = &unk_1E6BECFC0;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __64__ISLivePhotoPlaybackBehavior__transitionToVideoWithPlaybackID___block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[33])
  {
    long long v3 = [v2 delegate];
    [v3 livePhotoPlaybackBehaviorDidBeginPlaying:*(void *)(a1 + 32)];

    v2 = *(unsigned char **)(a1 + 32);
  }
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 _showVideoWithPlaybackID:v4];
}

- (void)_startPlaybackWithPlaybackID:(int64_t)a3
{
  if ([(ISLivePhotoPlaybackBehavior *)self _currentPlaybackID] == a3)
  {
    [(ISLivePhotoPlaybackBehavior *)self _setVideoReadyToPlay:0];
    [(ISLivePhotoPlaybackBehavior *)self _transitionToVideoWithPlaybackID:a3];
  }
}

- (void)_didFinishPreparing
{
  [(ISLivePhotoPlaybackBehavior *)self _setPreparing:0];
  [(ISLivePhotoPlaybackBehavior *)self _setVideoReadyToPlay:1];
  int64_t v3 = [(ISLivePhotoPlaybackBehavior *)self _readyToPlayPlaybackID];

  [(ISLivePhotoPlaybackBehavior *)self _startPlaybackWithPlaybackID:v3];
}

- (void)_prerollWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  double v5 = +[ISPlayerSettings sharedInstance];
  int v6 = [v5 prerollBeforePlaying];

  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__ISLivePhotoPlaybackBehavior__prerollWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E6BEC620;
    v9 = v4;
    LODWORD(v7) = 1.0;
    [(ISBehavior *)self prerollVideoAtRate:v8 completionHandler:v7];
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

uint64_t __61__ISLivePhotoPlaybackBehavior__prerollWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_handleDidSeekToBeginning
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__ISLivePhotoPlaybackBehavior__handleDidSeekToBeginning__block_invoke;
  v3[3] = &unk_1E6BECB10;
  objc_copyWeak(&v4, &location);
  [(ISLivePhotoPlaybackBehavior *)self _prerollWithCompletionHandler:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __56__ISLivePhotoPlaybackBehavior__handleDidSeekToBeginning__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ISLivePhotoPlaybackBehavior__handleDidSeekToBeginning__block_invoke_2;
  block[3] = &unk_1E6BECB10;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __56__ISLivePhotoPlaybackBehavior__handleDidSeekToBeginning__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDidFinishPreroll];
}

- (void)_prepareVideoForPlaybackIfNeeded
{
  if (![(ISLivePhotoPlaybackBehavior *)self _isPreparing]
    && ![(ISLivePhotoPlaybackBehavior *)self _isVideoReadyToPlay])
  {
    [(ISLivePhotoPlaybackBehavior *)self _setPreparing:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
    [(ISLivePhotoPlaybackBehavior *)self playbackTimeRange];
    CMTime v12 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
    range.start = v12;
    [(ISBehavior *)self setVideoForwardPlaybackEndTime:&range];
    objc_initWeak(&location, self);
    *(_OWORD *)&range.start.value = *MEMORY[0x1E4F1FA48];
    range.start.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    int64_t v3 = +[ISPlayerSettings sharedInstance];
    uint64_t v4 = [v3 startBehavior];

    if (v4 == 1)
    {
      p_keyTime = &self->_keyTime;
    }
    else
    {
      if ((BYTE12(v13) & 1) == 0
        || (BYTE4(v15) & 1) == 0
        || *((void *)&v15 + 1)
        || (*((void *)&v14 + 1) & 0x8000000000000000) != 0)
      {
        goto LABEL_11;
      }
      p_keyTime = ($95D729B680665BEAEFA1D6FCA8238556 *)&v13;
    }
    *(_OWORD *)&range.start.value = *(_OWORD *)&p_keyTime->value;
    range.start.CMTimeEpoch epoch = p_keyTime->epoch;
LABEL_11:
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__ISLivePhotoPlaybackBehavior__prepareVideoForPlaybackIfNeeded__block_invoke;
    v8[3] = &unk_1E6BEC808;
    objc_copyWeak(&v9, &location);
    long long v6 = *(_OWORD *)&range.start.value;
    CMTimeEpoch epoch = range.start.epoch;
    [(ISBehavior *)self seekVideoPlayerToTime:&v6 completionHandler:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __63__ISLivePhotoPlaybackBehavior__prepareVideoForPlaybackIfNeeded__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__ISLivePhotoPlaybackBehavior__prepareVideoForPlaybackIfNeeded__block_invoke_2;
  block[3] = &unk_1E6BECB10;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __63__ISLivePhotoPlaybackBehavior__prepareVideoForPlaybackIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDidSeekToBeginning];
}

- (void)startPlayback
{
  int64_t v3 = [(ISLivePhotoPlaybackBehavior *)self _currentPlaybackID] + 1;
  [(ISLivePhotoPlaybackBehavior *)self _setCurrentPlaybackID:v3];
  if ([(ISLivePhotoPlaybackBehavior *)self _isVideoReadyToPlay])
  {
    [(ISLivePhotoPlaybackBehavior *)self _startPlaybackWithPlaybackID:v3];
  }
  else
  {
    [(ISLivePhotoPlaybackBehavior *)self _setReadyToPlayPlaybackID:v3];
    [(ISLivePhotoPlaybackBehavior *)self _prepareVideoForPlaybackIfNeeded];
  }
}

- (void)activeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)ISLivePhotoPlaybackBehavior;
  [(ISBehavior *)&v3 activeDidChange];
  if ([(ISBehavior *)self isActive])
  {
    [(ISLivePhotoPlaybackBehavior *)self _prepareVideoForPlaybackIfNeeded];
  }
  else
  {
    [(ISLivePhotoPlaybackBehavior *)self _setPreparing:0];
    [(ISLivePhotoPlaybackBehavior *)self _setVideoReadyToPlay:0];
  }
}

- (void)videoDidPlayToEnd
{
  v3.receiver = self;
  v3.super_class = (Class)ISLivePhotoPlaybackBehavior;
  [(ISBehavior *)&v3 videoDidPlayToEnd];
  [(ISBehavior *)self setVideoPlayRate:0.0];
}

- (void)_handleDidFinish
{
  self->_isTransitioningToPhoto = 0;
  if (self->_delegateFlags.respondsToDidFinish)
  {
    id v3 = [(ISBehavior *)self delegate];
    [v3 livePhotoPlaybackBehaviorDidFinish:self];
  }
}

- (void)videoWillPlayToEnd
{
  if ([(ISLivePhotoPlaybackBehavior *)self immediatelyShowsPhotoWhenPlaybackEnds])
  {
    [(ISBehavior *)self setVideoPlayRate:0.0];
    id v3 = [[ISPlayerState alloc] initWithPhotoBlurRadius:@"END HINT" videoAlpha:0.0 videoBlurRadius:0.0 label:0.0];
    uint64_t v4 = objc_alloc_init(ISPlayerOutputTransitionOptions);
    [(ISPlayerOutputTransitionOptions *)v4 setTransitionDuration:0.5];
    self->_isTransitioningToPhoto = 1;
    double v5 = [(ISBehavior *)self delegate];
    [v5 livePhotoPlaybackBehaviorWillTransitionToPhoto:self];

    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__ISLivePhotoPlaybackBehavior_videoWillPlayToEnd__block_invoke;
    v6[3] = &unk_1E6BEC808;
    objc_copyWeak(&v7, &location);
    [(ISBehavior *)self setOutputInfo:v3 withTransitionOptions:v4 completion:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __49__ISLivePhotoPlaybackBehavior_videoWillPlayToEnd__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDidFinish];
}

- (int64_t)behaviorType
{
  return 2;
}

- (void)setDelegate:(id)a3
{
  id v3 = self;
  v6.receiver = self;
  v6.super_class = (Class)ISLivePhotoPlaybackBehavior;
  id v4 = a3;
  [(ISBehavior *)&v6 setDelegate:v4];
  p_delegateFlags = &v3->_delegateFlags;
  v3->_delegateFlags.respondsToDidFinish = objc_opt_respondsToSelector() & 1;
  LOBYTE(v3) = objc_opt_respondsToSelector();

  p_delegateFlags->respondsToDidBeginPlaying = v3 & 1;
}

- (ISLivePhotoPlaybackBehavior)initWithInitialLayoutInfo:(id)a3 keyTime:(id *)a4 playbackTimeRange:(id *)a5 photoTransitionDuration:(double)a6 immediatelyShowsPhotoWhenPlaybackEnds:(BOOL)a7 hasBlurryTransition:(BOOL)a8
{
  v17.receiver = self;
  v17.super_class = (Class)ISLivePhotoPlaybackBehavior;
  uint64_t result = [(ISBehavior *)&v17 initWithInitialLayoutInfo:a3];
  if (result)
  {
    result->_immediatelyShowsPhotoWhenPlaybackEnds = a7;
    long long v14 = *(_OWORD *)&a4->var0;
    result->_keyTime.CMTimeEpoch epoch = a4->var3;
    *(_OWORD *)&result->_keyTime.value = v14;
    result->_photoTransitionDuration = a6;
    long long v15 = *(_OWORD *)&a5->var1.var1;
    long long v16 = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&result->_playbackTimeRange.start.CMTimeEpoch epoch = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&result->_playbackTimeRange.duration.timescale = v15;
    *(_OWORD *)&result->_playbackTimeRange.start.value = v16;
    result->_hasBlurryTransition = a8;
  }
  return result;
}

@end