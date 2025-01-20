@interface PXTrimToolPlayerWrapperNUMediaView
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)trimRange;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)seekTime;
- (AVPlayer)_currentAVPlayer;
- (BOOL)didLoopVideoBeforeSeek;
- (BOOL)didPlayBeforeSeek;
- (BOOL)isPlaying;
- (BOOL)isReadyToPlay;
- (BOOL)showsUntrimmed;
- (NSArray)fullVideoPipelineFilters;
- (NSArray)pipelineFiltersBeforeSeek;
- (NSMutableArray)mediaViewObservers;
- (NUMediaPlayer)mediaPlayer;
- (NUMediaView)mediaView;
- (PXTrimToolPlayerObserver)playerObserver;
- (PXTrimToolPlayerWrapperNUMediaView)initWithNUMediaView:(id)a3;
- (PXTrimToolPlayerWrapperNUMediaViewPlayerItemSource)playerItemSource;
- (_PXTrimToolPlayerWrapperAVPlayerView)loupePlayerView;
- (id)mediaViewTimeObserver;
- (void)_handleMediaPlayerObserverStatusChanged:(int64_t)a3;
- (void)_handleMediaPlayerObserverTimeChanged:(id *)a3;
- (void)_registerDefaultMediaViewObserver;
- (void)_registerTimeMediaViewObserver;
- (void)_removeMediaPlayerObserver;
- (void)_removeTimeObserver;
- (void)_updateLoupePlayerView;
- (void)applyTrimTimeRange:(id *)a3;
- (void)dealloc;
- (void)invalidateComposition;
- (void)pause;
- (void)play;
- (void)requestAssetWithCompletion:(id)a3;
- (void)seekToTime:(id *)a3;
- (void)seekToTime:(id *)a3 untrimmed:(BOOL)a4 exact:(BOOL)a5;
- (void)seekToTime:(id *)a3 untrimmed:(BOOL)a4 exact:(BOOL)a5 forceSeek:(BOOL)a6;
- (void)setDidLoopVideoBeforeSeek:(BOOL)a3;
- (void)setDidPlayBeforeSeek:(BOOL)a3;
- (void)setFullVideoPipelineFilters:(id)a3;
- (void)setLoupePlayerView:(id)a3;
- (void)setMediaPlayer:(id)a3;
- (void)setMediaViewObservers:(id)a3;
- (void)setMediaViewTimeObserver:(id)a3;
- (void)setPipelineFiltersBeforeSeek:(id)a3;
- (void)setPlayerItemSource:(id)a3;
- (void)setPlayerObserver:(id)a3;
- (void)setPosterFrame:(id *)a3;
- (void)setSeekTime:(id *)a3;
- (void)setShowsUntrimmed:(BOOL)a3;
- (void)setShowsUntrimmed:(BOOL)a3 completion:(id)a4;
- (void)stepByCount:(int64_t)a3 playheadTime:(id *)a4;
@end

@implementation PXTrimToolPlayerWrapperNUMediaView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loupePlayerView, 0);
  objc_storeStrong(&self->_mediaViewTimeObserver, 0);
  objc_storeStrong((id *)&self->_mediaViewObservers, 0);
  objc_storeStrong((id *)&self->_mediaPlayer, 0);
  objc_storeStrong((id *)&self->_mediaView, 0);
  objc_storeStrong((id *)&self->_fullVideoPipelineFilters, 0);
  objc_storeStrong((id *)&self->_playerItemSource, 0);
  objc_destroyWeak((id *)&self->_playerObserver);
  objc_destroyWeak((id *)&self->_showsUntrimmed);
}

- (void)setPipelineFiltersBeforeSeek:(id)a3
{
}

- (NSArray)pipelineFiltersBeforeSeek
{
  return (NSArray *)self->_loupePlayerView;
}

- (void)setDidLoopVideoBeforeSeek:(BOOL)a3
{
  BYTE6(self->_trimRange.duration.epoch) = a3;
}

- (BOOL)didLoopVideoBeforeSeek
{
  return BYTE6(self->_trimRange.duration.epoch);
}

- (void)setDidPlayBeforeSeek:(BOOL)a3
{
  BYTE5(self->_trimRange.duration.epoch) = a3;
}

- (BOOL)didPlayBeforeSeek
{
  return BYTE5(self->_trimRange.duration.epoch);
}

- (void)setSeekTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_seekTime.timescale = a3->var3;
  *(_OWORD *)&self->_pipelineFiltersBeforeSeek = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)seekTime
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)((char *)self + 136);
  return self;
}

- (void)setLoupePlayerView:(id)a3
{
}

- (void)setMediaViewTimeObserver:(id)a3
{
}

- (id)mediaViewTimeObserver
{
  return self->_mediaViewObservers;
}

- (void)setMediaViewObservers:(id)a3
{
}

- (NSMutableArray)mediaViewObservers
{
  return (NSMutableArray *)self->_mediaPlayer;
}

- (void)setMediaPlayer:(id)a3
{
}

- (NUMediaPlayer)mediaPlayer
{
  return self->_mediaView;
}

- (NUMediaView)mediaView
{
  return (NUMediaView *)self->_fullVideoPipelineFilters;
}

- (BOOL)showsUntrimmed
{
  return BYTE4(self->_trimRange.duration.epoch);
}

- (void)setFullVideoPipelineFilters:(id)a3
{
}

- (NSArray)fullVideoPipelineFilters
{
  return (NSArray *)self->_playerItemSource;
}

- (void)setPlayerItemSource:(id)a3
{
}

- (PXTrimToolPlayerWrapperNUMediaViewPlayerItemSource)playerItemSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerObserver);
  return (PXTrimToolPlayerWrapperNUMediaViewPlayerItemSource *)WeakRetained;
}

- (PXTrimToolPlayerObserver)playerObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_showsUntrimmed);
  return (PXTrimToolPlayerObserver *)WeakRetained;
}

- (void)setShowsUntrimmed:(BOOL)a3 completion:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  v7 = v6;
  if (BYTE4(self->_trimRange.duration.epoch) != v4)
  {
    fullVideoPipelineFilters = self->_fullVideoPipelineFilters;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __67__PXTrimToolPlayerWrapperNUMediaView_setShowsUntrimmed_completion___block_invoke;
    v19 = &unk_1E5DCE8A0;
    id v20 = v6;
    char v21 = 1;
    [(NSArray *)fullVideoPipelineFilters installRenderingCompletionBlock:&v16];
    BYTE4(self->_trimRange.duration.epoch) = v4;
    v9 = [(PXTrimToolPlayerWrapperNUMediaView *)self mediaView];
    v10 = v9;
    if (v4)
    {
      v11 = [v9 pipelineFilters];
      [(PXTrimToolPlayerWrapperNUMediaView *)self setPipelineFiltersBeforeSeek:v11];

      id v12 = [(PXTrimToolPlayerWrapperNUMediaView *)self fullVideoPipelineFilters];
    }
    else
    {
      id v12 = [(PXTrimToolPlayerWrapperNUMediaView *)self pipelineFiltersBeforeSeek];
      id v13 = [v10 pipelineFilters];
      if (v13 == v12)
      {

        goto LABEL_10;
      }
      v14 = v13;
      char v15 = [v13 isEqual:v12];

      if (v15)
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    [v10 setPipelineFilters:v12];
    goto LABEL_10;
  }
  if (v6) {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
LABEL_11:
}

uint64_t __67__PXTrimToolPlayerWrapperNUMediaView_setShowsUntrimmed_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (void)setShowsUntrimmed:(BOOL)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  int v4 = [(PXTrimToolPlayerWrapperNUMediaView *)self mediaPlayer];
  if (v4)
  {
    id v6 = v4;
    [v4 currentTime];
    int v4 = v6;
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
  id v5 = [(PXTrimToolPlayerWrapperNUMediaView *)self mediaPlayer];
  [v5 stepByCount:a3];
}

- (void)pause
{
  id v2 = [(PXTrimToolPlayerWrapperNUMediaView *)self mediaPlayer];
  [v2 pause];
}

- (void)play
{
  id v2 = [(PXTrimToolPlayerWrapperNUMediaView *)self mediaPlayer];
  [v2 play];
}

- (BOOL)isPlaying
{
  id v2 = [(PXTrimToolPlayerWrapperNUMediaView *)self mediaPlayer];
  uint64_t v3 = [v2 playbackState];

  return v3 == 3;
}

- (BOOL)isReadyToPlay
{
  id v2 = [(PXTrimToolPlayerWrapperNUMediaView *)self mediaPlayer];
  uint64_t v3 = [v2 playbackState];

  return (v3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)invalidateComposition
{
  id v3 = [(PXTrimToolPlayerWrapperNUMediaView *)self playerObserver];
  [v3 compositionDidUpdateForPlayerWrapper:self];
}

- (void)requestAssetWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(PXTrimToolPlayerWrapperNUMediaView *)self playerItemSource];
  id v5 = [(PXTrimToolPlayerWrapperNUMediaView *)self fullVideoPipelineFilters];
  [v6 trimToolPlayerWrapper:self requestAssetWithFilters:v5 completion:v4];
}

- (void)applyTrimTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)((char *)&self->_trimRange.duration.value + 4) = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_trimRange.start.flags = v4;
  *(_OWORD *)(&self->_delegateFlags + 2) = v3;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)trimRange
{
  long long v3 = *(_OWORD *)((char *)&self->var1.var0 + 4);
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var2;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)((char *)&self->var1.var3 + 4);
  return self;
}

- (void)setPosterFrame:(id *)a3
{
  long long v4 = [(PXTrimToolPlayerWrapperNUMediaView *)self mediaPlayer];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [v4 seekToTime:&v5 exact:1];
}

- (void)seekToTime:(id *)a3 untrimmed:(BOOL)a4 exact:(BOOL)a5 forceSeek:(BOOL)a6
{
  BOOL v8 = a4;
  unsigned int v11 = a3->var2 & 0x11;
  memset(&v27[1], 0, sizeof($3CC8671D27C23BF42ADDB32F2B5E48AE));
  [(PXTrimToolPlayerWrapperNUMediaView *)self seekTime];
  char var2 = v27[1].var2;
  v27[0] = *a3;
  [(PXTrimToolPlayerWrapperNUMediaView *)self setSeekTime:v27];
  id v13 = [(PXTrimToolPlayerWrapperNUMediaView *)self mediaView];
  v14 = v13;
  if (v11 == 1 && (var2 & 1) == 0)
  {
    -[PXTrimToolPlayerWrapperNUMediaView setDidLoopVideoBeforeSeek:](self, "setDidLoopVideoBeforeSeek:", [v13 loopsVideoPlayback]);
    if (v8) {
      [v14 setLoopsVideoPlayback:0];
    }
    [(PXTrimToolPlayerWrapperNUMediaView *)self setDidPlayBeforeSeek:[(PXTrimToolPlayerWrapperNUMediaView *)self isPlaying]];
    [(PXTrimToolPlayerWrapperNUMediaView *)self pause];
  }
  else if (v11 != 1)
  {
    CMTime time1 = (CMTime)v27[1];
    CMTime time2 = (CMTime)*a3;
    if (CMTimeCompare(&time1, &time2))
    {
      [(PXTrimToolPlayerWrapperNUMediaView *)self setShowsUntrimmed:0];
      [(PXTrimToolPlayerWrapperNUMediaView *)self setPipelineFiltersBeforeSeek:0];
      int v16 = [v14 loopsVideoPlayback];
      if (v16 != [(PXTrimToolPlayerWrapperNUMediaView *)self didLoopVideoBeforeSeek]) {
        objc_msgSend(v14, "setLoopsVideoPlayback:", -[PXTrimToolPlayerWrapperNUMediaView didLoopVideoBeforeSeek](self, "didLoopVideoBeforeSeek"));
      }
      if ([(PXTrimToolPlayerWrapperNUMediaView *)self didPlayBeforeSeek]) {
        [(PXTrimToolPlayerWrapperNUMediaView *)self play];
      }
      else {
        [(PXTrimToolPlayerWrapperNUMediaView *)self pause];
      }
    }
    goto LABEL_18;
  }
  [(PXTrimToolPlayerWrapperNUMediaView *)self trimRange];
  if (!v8 && (v26.flags & 0x1D) == 1)
  {
    CMTime time2 = (CMTime)*a3;
    CMTime rhs = v26;
    CMTimeSubtract(&time1, &time2, &rhs);
    *(CMTime *)a3 = time1;
  }
  objc_initWeak((id *)&time1, self);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__PXTrimToolPlayerWrapperNUMediaView_seekToTime_untrimmed_exact_forceSeek___block_invoke;
  v17[3] = &unk_1E5DCE878;
  BOOL v21 = a6;
  objc_copyWeak(&v18, (id *)&time1);
  long long v19 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  BOOL v22 = a5;
  [(PXTrimToolPlayerWrapperNUMediaView *)self setShowsUntrimmed:v8 completion:v17];
  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)&time1);
LABEL_18:
}

void __75__PXTrimToolPlayerWrapperNUMediaView_seekToTime_untrimmed_exact_forceSeek___block_invoke(uint64_t a1, unsigned int a2)
{
  if (*(unsigned char *)(a1 + 64)) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = a2;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = [WeakRetained mediaPlayer];
  uint64_t v6 = *(unsigned __int8 *)(a1 + 65);
  long long v7 = *(_OWORD *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  [v5 seekToTime:&v7 exact:v6 forceSeek:v3];
}

- (void)seekToTime:(id *)a3 untrimmed:(BOOL)a4 exact:(BOOL)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [(PXTrimToolPlayerWrapperNUMediaView *)self seekToTime:&v5 untrimmed:a4 exact:a5 forceSeek:0];
}

- (void)seekToTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3 = *a3;
  [(PXTrimToolPlayerWrapperNUMediaView *)self seekToTime:&v3 untrimmed:1 exact:1];
}

- (_PXTrimToolPlayerWrapperAVPlayerView)loupePlayerView
{
  id mediaViewTimeObserver = self->_mediaViewTimeObserver;
  if (!mediaViewTimeObserver)
  {
    long long v4 = [_PXTrimToolPlayerWrapperAVPlayerView alloc];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = [(PXTrimToolPlayerWrapperNUMediaView *)self _currentAVPlayer];
    uint64_t v6 = [(_PXTrimToolPlayerWrapperAVPlayerView *)v4 initWithPlayer:v5];
    id v7 = self->_mediaViewTimeObserver;
    self->_id mediaViewTimeObserver = v6;

    id mediaViewTimeObserver = self->_mediaViewTimeObserver;
  }
  return (_PXTrimToolPlayerWrapperAVPlayerView *)mediaViewTimeObserver;
}

- (void)setPlayerObserver:(id)a3
{
  p_showsUntrimmed = &self->_showsUntrimmed;
  id v5 = a3;
  objc_storeWeak((id *)p_showsUntrimmed, v5);
  self->_delegateFlags.respondsToPlayerStatusChangedForPlayerWrapper = objc_opt_respondsToSelector() & 1;
  LOBYTE(p_showsUntrimmed) = objc_opt_respondsToSelector();

  self->_delegateFlags.respondsToTimeChanged = p_showsUntrimmed & 1;
}

- (void)_handleMediaPlayerObserverStatusChanged:(int64_t)a3
{
  if (self->_delegateFlags.respondsToPlayerStatusChangedForPlayerWrapper)
  {
    long long v4 = [(PXTrimToolPlayerWrapperNUMediaView *)self playerObserver];
    [v4 playerStatusChangedForPlayerWrapper:self];
  }
  [(PXTrimToolPlayerWrapperNUMediaView *)self _updateLoupePlayerView];
}

- (void)_handleMediaPlayerObserverTimeChanged:(id *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_delegateFlags.respondsToTimeChanged)
  {
    [(PXTrimToolPlayerWrapperNUMediaView *)self trimRange];
    CMTimeValue v13 = v9;
    CMTimeScale v14 = v10;
    if (![(PXTrimToolPlayerWrapperNUMediaView *)self showsUntrimmed] && (v11 & 0x1D) == 1)
    {
      CMTime lhs = (CMTime)*a3;
      rhs.value = v13;
      rhs.timescale = v14;
      rhs.flags = v11;
      rhs.epoch = v12;
      CMTimeAdd(&v8, &lhs, &rhs);
      *(CMTime *)a3 = v8;
    }
    id v5 = [(PXTrimToolPlayerWrapperNUMediaView *)self playerObserver];
    CMTime v8 = (CMTime)*a3;
    [v5 playerWrapper:self timeChanged:&v8];
  }
}

- (void)_removeTimeObserver
{
  id v5 = [(PXTrimToolPlayerWrapperNUMediaView *)self mediaViewTimeObserver];
  if (v5)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v3 = [(PXTrimToolPlayerWrapperNUMediaView *)self mediaPlayer];
    [v3 removeObserver:v5];

    long long v4 = [(PXTrimToolPlayerWrapperNUMediaView *)self mediaViewObservers];
    [v4 removeObject:v5];

    [(PXTrimToolPlayerWrapperNUMediaView *)self setMediaViewTimeObserver:0];
  }
}

- (void)_removeMediaPlayerObserver
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(PXTrimToolPlayerWrapperNUMediaView *)self _removeTimeObserver];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3 = [(PXTrimToolPlayerWrapperNUMediaView *)self mediaViewObservers];
  [(PXTrimToolPlayerWrapperNUMediaView *)self setMediaViewObservers:0];
  long long v4 = [(PXTrimToolPlayerWrapperNUMediaView *)self mediaPlayer];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "removeObserver:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_registerTimeMediaViewObserver
{
  objc_initWeak(&location, self);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3 = [(PXTrimToolPlayerWrapperNUMediaView *)self mediaPlayer];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __68__PXTrimToolPlayerWrapperNUMediaView__registerTimeMediaViewObserver__block_invoke;
  uint64_t v9 = &unk_1E5DCE850;
  objc_copyWeak(&v10, &location);
  long long v4 = [v3 addPlaybackTimeObserver:&v6];

  -[PXTrimToolPlayerWrapperNUMediaView setMediaViewTimeObserver:](self, "setMediaViewTimeObserver:", v4, v6, v7, v8, v9);
  id v5 = [(PXTrimToolPlayerWrapperNUMediaView *)self mediaViewObservers];
  [v5 addObject:v4];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __68__PXTrimToolPlayerWrapperNUMediaView__registerTimeMediaViewObserver__block_invoke(uint64_t a1, void *a2, long long *a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  long long v10 = 0uLL;
  uint64_t v11 = 0;
  if (v5)
  {
    [v5 currentSeekTime];
    if (BYTE12(v10))
    {
      *a3 = v10;
      *((void *)a3 + 2) = v11;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v8 = *a3;
  uint64_t v9 = *((void *)a3 + 2);
  [WeakRetained _handleMediaPlayerObserverTimeChanged:&v8];
}

- (void)_registerDefaultMediaViewObserver
{
  v14[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3 = [(PXTrimToolPlayerWrapperNUMediaView *)self mediaPlayer];
  long long v4 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  long long v10 = __71__PXTrimToolPlayerWrapperNUMediaView__registerDefaultMediaViewObserver__block_invoke;
  uint64_t v11 = &unk_1E5DCE828;
  objc_copyWeak(&v12, &location);
  id v5 = [v3 addPlaybackStateObserver:&v8];
  v14[0] = v5;
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v14, 1, v8, v9, v10, v11);
  uint64_t v7 = [v4 arrayWithArray:v6];
  [(PXTrimToolPlayerWrapperNUMediaView *)self setMediaViewObservers:v7];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __71__PXTrimToolPlayerWrapperNUMediaView__registerDefaultMediaViewObserver__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleMediaPlayerObserverStatusChanged:a3];
}

- (void)_updateLoupePlayerView
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3 = [(PXTrimToolPlayerWrapperNUMediaView *)self loupePlayerView];
  id v6 = [v3 playerLayer];

  long long v4 = [(PXTrimToolPlayerWrapperNUMediaView *)self _currentAVPlayer];
  id v5 = [v6 player];

  if (v5 != v4) {
    [v6 setPlayer:v4];
  }
  if (objc_opt_respondsToSelector()) {
    [v6 setToneMapToStandardDynamicRange:1];
  }
}

- (AVPlayer)_currentAVPlayer
{
  id v2 = [(PXTrimToolPlayerWrapperNUMediaView *)self mediaView];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3 = [v2 _videoPlayerController];
  long long v4 = [v3 player];

  return (AVPlayer *)v4;
}

- (void)dealloc
{
  [(PXTrimToolPlayerWrapperNUMediaView *)self _removeMediaPlayerObserver];
  v3.receiver = self;
  v3.super_class = (Class)PXTrimToolPlayerWrapperNUMediaView;
  [(PXTrimToolPlayerWrapperNUMediaView *)&v3 dealloc];
}

- (PXTrimToolPlayerWrapperNUMediaView)initWithNUMediaView:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXTrimToolPlayerWrapperNUMediaView;
  id v6 = [(PXTrimToolPlayerWrapperNUMediaView *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fullVideoPipelineFilters, a3);
    uint64_t v8 = [v5 player];
    mediaView = v7->_mediaView;
    v7->_mediaView = (NUMediaView *)v8;

    [(PXTrimToolPlayerWrapperNUMediaView *)v7 _registerDefaultMediaViewObserver];
  }

  return v7;
}

@end