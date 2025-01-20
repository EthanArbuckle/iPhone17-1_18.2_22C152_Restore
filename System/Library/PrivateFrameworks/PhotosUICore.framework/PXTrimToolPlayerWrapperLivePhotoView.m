@interface PXTrimToolPlayerWrapperLivePhotoView
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)trimRange;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)periodicTimeObservationInterval;
- (BOOL)isPlaying;
- (BOOL)isReadyToPlay;
- (BOOL)needsPlayerUpdate;
- (ISVideoPlayerUIView)_videoPlayerView;
- (ISWrappedAVPlayer)wrappedAVPlayer;
- (PXLivePhotoView)livePhotoView;
- (PXTrimToolPlayerObserver)playerObserver;
- (PXTrimToolPlayerWrapperLivePhotoView)initWithLivePhotoView:(id)a3;
- (UIView)loupePlayerView;
- (id)_videoPlayerViewIfLoaded;
- (id)periodicTimeObserver;
- (id)videoPlayerView;
- (void)_addPeriodicTimeObserver;
- (void)_createLoupePlayerView;
- (void)_loadWrappedAVPlayerIfNecessary;
- (void)_timeObserverTimeChanged:(id *)a3;
- (void)applyTrimTimeRange:(id *)a3;
- (void)finishSeeking;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)pause;
- (void)play;
- (void)requestAssetWithCompletion:(id)a3;
- (void)seekToTime:(id *)a3;
- (void)seekToTime:(id *)a3 untrimmed:(BOOL)a4 exact:(BOOL)a5;
- (void)seekToTime:(id *)a3 untrimmed:(BOOL)a4 exact:(BOOL)a5 forceSeek:(BOOL)a6;
- (void)setNeedsPlayerUpdate:(BOOL)a3;
- (void)setPeriodicTimeObservationInterval:(id *)a3;
- (void)setPeriodicTimeObserver:(id)a3;
- (void)setPlayerObserver:(id)a3;
- (void)setWrappedAVPlayer:(id)a3;
- (void)set_videoPlayerView:(id)a3;
- (void)startPeriodicTimeObserver;
- (void)stepByCount:(int64_t)a3 playheadTime:(id *)a4;
- (void)stopPeriodicTimeObserver;
@end

@implementation PXTrimToolPlayerWrapperLivePhotoView

- (void).cxx_destruct
{
  objc_storeStrong(&self->_periodicTimeObserver, 0);
  objc_storeStrong((id *)&self->_livePhotoView, 0);
  objc_storeStrong((id *)&self->_wrappedAVPlayer, 0);
  objc_storeStrong((id *)&self->_videoPlayerView, 0);
  objc_storeStrong((id *)&self->_loupePlayerView, 0);
  objc_destroyWeak((id *)&self->_playerObserver);
}

- (void)setPeriodicTimeObserver:(id)a3
{
}

- (id)periodicTimeObserver
{
  return self->_periodicTimeObserver;
}

- (void)setPeriodicTimeObservationInterval:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_periodicTimeObservationInterval.epoch = a3->var3;
  *(_OWORD *)&self->_periodicTimeObservationInterval.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)periodicTimeObservationInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (void)setNeedsPlayerUpdate:(BOOL)a3
{
  self->_needsPlayerUpdate = a3;
}

- (BOOL)needsPlayerUpdate
{
  return self->_needsPlayerUpdate;
}

- (PXLivePhotoView)livePhotoView
{
  return self->_livePhotoView;
}

- (ISWrappedAVPlayer)wrappedAVPlayer
{
  return self->_wrappedAVPlayer;
}

- (void)set_videoPlayerView:(id)a3
{
}

- (ISVideoPlayerUIView)_videoPlayerView
{
  return self->_videoPlayerView;
}

- (PXTrimToolPlayerObserver)playerObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerObserver);
  return (PXTrimToolPlayerObserver *)WeakRetained;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6 = a4;
  id v8 = a3;
  v9 = v8;
  if ((void *)livePhotoPlayerObservationContext == a5)
  {
    if ((v6 & 4) != 0)
    {
      v8;
      px_dispatch_on_main_queue();
    }
  }
  else if ((void *)avPlayerObservationContext_270381 == a5)
  {
    if ((v6 & 0x1000) != 0)
    {
      v10 = [(PXTrimToolPlayerWrapperLivePhotoView *)self playerObserver];
      [v10 compositionDidUpdateForPlayerWrapper:self];
    }
    if ((v6 & 1) != 0 && self->_delegateFlags.respondsToPlayerStatusChangedForPlayerWrapper)
    {
      v11 = [(PXTrimToolPlayerWrapperLivePhotoView *)self playerObserver];
      [v11 playerStatusChangedForPlayerWrapper:self];
    }
  }
}

void __69__PXTrimToolPlayerWrapperLivePhotoView_observable_didChange_context___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) videoPlayer];
  [*(id *)(a1 + 40) setWrappedAVPlayer:v3];
  v2 = [*(id *)(a1 + 40) playerObserver];
  [v2 compositionDidUpdateForPlayerWrapper:*(void *)(a1 + 40)];
}

- (void)stopPeriodicTimeObserver
{
  id v3 = [(PXTrimToolPlayerWrapperLivePhotoView *)self periodicTimeObserver];
  if (v3)
  {
    v4 = [(PXTrimToolPlayerWrapperLivePhotoView *)self wrappedAVPlayer];
    v5 = [(PXTrimToolPlayerWrapperLivePhotoView *)self periodicTimeObserver];
    [v4 removeTimeObserver:v5];

    [(PXTrimToolPlayerWrapperLivePhotoView *)self setPeriodicTimeObserver:0];
  }
  long long v6 = *MEMORY[0x1E4F1F9F8];
  uint64_t v7 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  [(PXTrimToolPlayerWrapperLivePhotoView *)self setPeriodicTimeObservationInterval:&v6];
}

- (void)startPeriodicTimeObserver
{
  id v3 = [(PXTrimToolPlayerWrapperLivePhotoView *)self periodicTimeObserver];

  if (v3) {
    [(PXTrimToolPlayerWrapperLivePhotoView *)self stopPeriodicTimeObserver];
  }
  CMTimeMake(&v5, 1, 30);
  CMTime v4 = v5;
  [(PXTrimToolPlayerWrapperLivePhotoView *)self setPeriodicTimeObservationInterval:&v4];
  [(PXTrimToolPlayerWrapperLivePhotoView *)self _addPeriodicTimeObserver];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  CMTime v4 = [(PXTrimToolPlayerWrapperLivePhotoView *)self wrappedAVPlayer];
  if (v4)
  {
    long long v6 = v4;
    [v4 currentTime];
    CMTime v4 = v6;
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (void)stepByCount:(int64_t)a3 playheadTime:(id *)a4
{
  memset(&v9, 0, sizeof(v9));
  CMTimeMakeWithSeconds(&rhs, (double)a3 * 0.016, 600);
  CMTime v7 = *(CMTime *)a4;
  CMTimeAdd(&v9, &v7, &rhs);
  long long v6 = [(PXTrimToolPlayerWrapperLivePhotoView *)self livePhotoView];
  CMTime v7 = v9;
  [v6 setSeekTime:&v7];
}

- (void)pause
{
  id v2 = [(PXTrimToolPlayerWrapperLivePhotoView *)self wrappedAVPlayer];
  [v2 pause];
}

- (void)play
{
  [(PXTrimToolPlayerWrapperLivePhotoView *)self _loadWrappedAVPlayerIfNecessary];
  id v3 = [(PXTrimToolPlayerWrapperLivePhotoView *)self wrappedAVPlayer];
  CMTime v5 = v3;
  if (v3) {
    [v3 itemForwardPlaybackEndTime];
  }
  else {
    memset(v6, 0, sizeof(v6));
  }
  LODWORD(v4) = 1.0;
  [v5 playToTime:v6 withInitialRate:0 overDuration:v4 progressHandler:0.0];
}

- (BOOL)isPlaying
{
  id v2 = [(PXTrimToolPlayerWrapperLivePhotoView *)self wrappedAVPlayer];
  [v2 rate];
  float v4 = v3;

  return v4 > 0.0;
}

- (BOOL)isReadyToPlay
{
  id v2 = [(PXTrimToolPlayerWrapperLivePhotoView *)self wrappedAVPlayer];
  BOOL v3 = [v2 status] == 1;

  return v3;
}

- (void)applyTrimTimeRange:(id *)a3
{
  float v4 = [(PXTrimToolPlayerWrapperLivePhotoView *)self livePhotoView];
  long long v5 = *(_OWORD *)&a3->var0.var3;
  v6[0] = *(_OWORD *)&a3->var0.var0;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a3->var1.var1;
  [v4 setTrimmedTimeRange:v6];
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)trimRange
{
  id v7 = [(PXTrimToolPlayerWrapperLivePhotoView *)self livePhotoView];
  float v4 = [v7 player];
  long long v5 = v4;
  if (v4)
  {
    [v4 trimTimeRange];
  }
  else
  {
    *(_OWORD *)&retstr->var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }

  return result;
}

- (void)finishSeeking
{
  long long v2 = *MEMORY[0x1E4F1F9F8];
  uint64_t v3 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  [(PXTrimToolPlayerWrapperLivePhotoView *)self seekToTime:&v2];
}

- (void)seekToTime:(id *)a3 untrimmed:(BOOL)a4 exact:(BOOL)a5 forceSeek:(BOOL)a6
{
  id v7 = [(PXTrimToolPlayerWrapperLivePhotoView *)self livePhotoView];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
  [v7 setSeekTime:&v8];
}

- (void)seekToTime:(id *)a3 untrimmed:(BOOL)a4 exact:(BOOL)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [(PXTrimToolPlayerWrapperLivePhotoView *)self seekToTime:&v5 untrimmed:a4 exact:a5 forceSeek:0];
}

- (void)seekToTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3 = *a3;
  [(PXTrimToolPlayerWrapperLivePhotoView *)self seekToTime:&v3 untrimmed:1 exact:1];
}

- (void)requestAssetWithCompletion:(id)a3
{
  float v4 = (void (**)(id, void *, void *))a3;
  [(PXTrimToolPlayerWrapperLivePhotoView *)self _loadWrappedAVPlayerIfNecessary];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = [(PXTrimToolPlayerWrapperLivePhotoView *)self wrappedAVPlayer];
  id v8 = [v5 currentItem];

  long long v6 = [v8 asset];
  id v7 = [v8 videoComposition];
  v4[2](v4, v6, v7);
}

- (UIView)loupePlayerView
{
  loupePlayerView = self->_loupePlayerView;
  if (!loupePlayerView)
  {
    [(PXTrimToolPlayerWrapperLivePhotoView *)self _createLoupePlayerView];
    loupePlayerView = self->_loupePlayerView;
  }
  return loupePlayerView;
}

- (void)setPlayerObserver:(id)a3
{
  p_playerObserver = &self->_playerObserver;
  id v5 = a3;
  objc_storeWeak((id *)p_playerObserver, v5);
  self->_delegateFlags.respondsToPlayerStatusChangedForPlayerWrapper = objc_opt_respondsToSelector() & 1;
  LOBYTE(p_playerObserver) = objc_opt_respondsToSelector();

  self->_delegateFlags.respondsToTimeChanged = p_playerObserver & 1;
  [(PXTrimToolPlayerWrapperLivePhotoView *)self stopPeriodicTimeObserver];
}

- (void)_timeObserverTimeChanged:(id *)a3
{
  if (self->_delegateFlags.respondsToTimeChanged)
  {
    id v5 = [(PXTrimToolPlayerWrapperLivePhotoView *)self playerObserver];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
    [v5 playerWrapper:self timeChanged:&v6];
  }
}

- (void)_addPeriodicTimeObserver
{
  objc_initWeak(&location, self);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3 = [(PXTrimToolPlayerWrapperLivePhotoView *)self wrappedAVPlayer];
  [(PXTrimToolPlayerWrapperLivePhotoView *)self periodicTimeObservationInterval];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__PXTrimToolPlayerWrapperLivePhotoView__addPeriodicTimeObserver__block_invoke;
  v5[3] = &unk_1E5DCF948;
  objc_copyWeak(&v6, &location);
  id v4 = (id)[v3 addPeriodicTimeObserverForInterval:v7 queue:0 usingBlock:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __64__PXTrimToolPlayerWrapperLivePhotoView__addPeriodicTimeObserver__block_invoke(uint64_t a1, long long *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v4 = *a2;
  uint64_t v5 = *((void *)a2 + 2);
  [WeakRetained _timeObserverTimeChanged:&v4];
}

- (void)_createLoupePlayerView
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3 = [(PXTrimToolPlayerWrapperLivePhotoView *)self videoPlayerView];
  loupePlayerView = self->_loupePlayerView;
  self->_loupePlayerView = v3;
}

- (id)videoPlayerView
{
  videoPlayerView = self->_videoPlayerView;
  if (!videoPlayerView)
  {
    long long v4 = (ISVideoPlayerUIView *)objc_alloc_init(MEMORY[0x1E4F8EBB8]);
    uint64_t v5 = self->_videoPlayerView;
    self->_videoPlayerView = v4;

    [(PXTrimToolPlayerWrapperLivePhotoView *)self _loadWrappedAVPlayerIfNecessary];
    id v6 = [(PXTrimToolPlayerWrapperLivePhotoView *)self wrappedAVPlayer];
    [(ISVideoPlayerUIView *)self->_videoPlayerView setVideoPlayer:v6];

    videoPlayerView = self->_videoPlayerView;
  }
  return videoPlayerView;
}

- (id)_videoPlayerViewIfLoaded
{
  return self->_videoPlayerView;
}

- (void)setWrappedAVPlayer:(id)a3
{
  uint64_t v5 = (ISWrappedAVPlayer *)a3;
  if (self->_wrappedAVPlayer != v5)
  {
    long long v9 = 0uLL;
    uint64_t v10 = 0;
    [(PXTrimToolPlayerWrapperLivePhotoView *)self periodicTimeObservationInterval];
    [(PXTrimToolPlayerWrapperLivePhotoView *)self stopPeriodicTimeObserver];
    [(ISWrappedAVPlayer *)self->_wrappedAVPlayer unregisterChangeObserver:self context:avPlayerObservationContext_270381];
    objc_storeStrong((id *)&self->_wrappedAVPlayer, a3);
    id v6 = [(PXTrimToolPlayerWrapperLivePhotoView *)self _videoPlayerViewIfLoaded];
    [v6 setVideoPlayer:v5];

    [(ISWrappedAVPlayer *)v5 registerChangeObserver:self context:avPlayerObservationContext_270381];
    if ((unsigned __int128)0 >> 96)
    {
      long long v7 = v9;
      uint64_t v8 = v10;
      [(PXTrimToolPlayerWrapperLivePhotoView *)self setPeriodicTimeObservationInterval:&v7];
      [(PXTrimToolPlayerWrapperLivePhotoView *)self _addPeriodicTimeObserver];
    }
  }
}

- (void)_loadWrappedAVPlayerIfNecessary
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3 = [(PXTrimToolPlayerWrapperLivePhotoView *)self wrappedAVPlayer];

  if (!v3)
  {
    long long v4 = [(PXTrimToolPlayerWrapperLivePhotoView *)self livePhotoView];
    id v6 = [v4 player];

    [v6 registerChangeObserver:self context:livePhotoPlayerObservationContext];
    uint64_t v5 = [v6 videoPlayer];
    [(PXTrimToolPlayerWrapperLivePhotoView *)self setWrappedAVPlayer:v5];
  }
}

- (PXTrimToolPlayerWrapperLivePhotoView)initWithLivePhotoView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXTrimToolPlayerWrapperLivePhotoView;
  id v6 = [(PXTrimToolPlayerWrapperLivePhotoView *)&v9 init];
  long long v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_livePhotoView, a3);
  }

  return v7;
}

@end