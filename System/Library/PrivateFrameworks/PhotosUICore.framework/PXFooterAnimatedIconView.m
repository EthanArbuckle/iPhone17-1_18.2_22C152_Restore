@interface PXFooterAnimatedIconView
- (AVPlayerItem)playerItem;
- (AVPlayerLayer)playerLayer;
- (BOOL)isObscured;
- (BOOL)isPlayerHidden;
- (BOOL)isPlayerPaused;
- (BOOL)wantsGridCycleTimeObservation;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PXFooterAnimatedIconView)initWithFrame:(CGRect)a3;
- (id)_movieURL;
- (int64_t)desiredMode;
- (int64_t)presentedState;
- (int64_t)style;
- (void)_addReasonToPause:(unint64_t)a3;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationDidEnterForeground:(id)a3;
- (void)_createPlayerIfNeeded;
- (void)_crossedGridCycleBoundary;
- (void)_didSeekToPlayFromTime:(id *)a3 toTime:(id *)a4;
- (void)_didSeekToTime:(id *)a3;
- (void)_hideVideo;
- (void)_layoutPlayer;
- (void)_mediaServicesWereReset:(id)a3;
- (void)_playFromTime:(id *)a3 toTime:(id *)a4;
- (void)_removeReasonToPause:(unint64_t)a3;
- (void)_seekToTime:(id *)a3;
- (void)_setNeedsUpdate;
- (void)_transitionToState:(int64_t)a3;
- (void)_update;
- (void)_updateIsPlayerPaused;
- (void)_updateStyle;
- (void)_windowDidChange;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setDesiredMode:(int64_t)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIsPlayerHidden:(BOOL)a3;
- (void)setIsPlayerPaused:(BOOL)a3;
- (void)setPlayerItem:(id)a3;
- (void)setPlayerLayer:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setWantsGridCycleTimeObservation:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PXFooterAnimatedIconView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong(&self->_gridCycleTimeObservationToken, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (AVPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (void)_mediaServicesWereReset:(id)a3
{
}

uint64_t __52__PXFooterAnimatedIconView__mediaServicesWereReset___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 440);
  *(void *)(v2 + 440) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 584);
  *(void *)(v4 + 584) = 0;

  v6 = *(void **)(a1 + 32);
  return [v6 _setNeedsUpdate];
}

- (void)_applicationDidEnterForeground:(id)a3
{
}

- (void)_applicationDidEnterBackground:(id)a3
{
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXFooterAnimatedIconView;
  [(PXFooterAnimatedIconView *)&v4 traitCollectionDidChange:a3];
  [(PXFooterAnimatedIconView *)self _updateStyle];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)PXFooterAnimatedIconView;
  [(PXFooterAnimatedIconView *)&v3 didMoveToWindow];
  [(PXFooterAnimatedIconView *)self _windowDidChange];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXFooterAnimatedIconView;
  [(PXFooterAnimatedIconView *)&v3 layoutSubviews];
  [(PXFooterAnimatedIconView *)self _updateStyle];
  [(PXFooterAnimatedIconView *)self _layoutPlayer];
}

- (id)_movieURL
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int64_t v3 = [(PXFooterAnimatedIconView *)self style];
  objc_super v4 = @"PXFooterAnimationLightWithAlpha";
  if (v3 != 1) {
    objc_super v4 = 0;
  }
  if (v3 == 2) {
    v5 = @"PXFooterAnimationDarkWithAlpha";
  }
  else {
    v5 = v4;
  }
  v6 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/Photos/Resources/PXFooterAnimation.bundle"];
  v7 = [v6 URLForResource:v5 withExtension:@"mov"];

  return v7;
}

- (void)setStyle:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_style != a3)
  {
    self->_style = a3;
    v5 = [(PXFooterAnimatedIconView *)self _movieURL];
    if (v5)
    {
      long long v27 = 0uLL;
      uint64_t v28 = 0;
      player = self->_player;
      if (player)
      {
        [(AVPlayer *)player currentTime];
        player = self->_player;
      }
      long long v25 = 0uLL;
      uint64_t v26 = 0;
      v7 = [(AVPlayer *)player currentItem];
      v8 = v7;
      if (v7)
      {
        [v7 forwardPlaybackEndTime];
      }
      else
      {
        long long v25 = 0uLL;
        uint64_t v26 = 0;
      }

      [(AVPlayer *)self->_player rate];
      int v10 = v9;
      v11 = (void *)[objc_alloc(MEMORY[0x1E4F16620]) initWithURL:v5];
      [(AVPlayer *)self->_player replaceCurrentItemWithPlayerItem:v11];
      [(PXFooterAnimatedIconView *)self setPlayerItem:v11];
      long long v23 = v25;
      uint64_t v24 = v26;
      [v11 setForwardPlaybackEndTime:&v23];
      if ((BYTE12(v27) & 0x1D) == 1)
      {
        objc_initWeak(&location, self->_player);
        v12 = self->_player;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __37__PXFooterAnimatedIconView_setStyle___block_invoke;
        v19[3] = &unk_1E5DB5808;
        objc_copyWeak(&v20, &location);
        int v21 = v10;
        long long v17 = v27;
        uint64_t v18 = v28;
        long long v15 = *MEMORY[0x1E4F1FA48];
        uint64_t v16 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
        long long v13 = v15;
        uint64_t v14 = v16;
        [(AVPlayer *)v12 seekToTime:&v17 toleranceBefore:&v15 toleranceAfter:&v13 completionHandler:v19];
        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __37__PXFooterAnimatedIconView_setStyle___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    int v2 = *(_DWORD *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    LODWORD(v3) = v2;
    [WeakRetained setRate:v3];
  }
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)isObscured
{
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x2020000000;
  char v4 = 0;
  px_dispatch_on_main_queue_sync();
}

void __38__PXFooterAnimatedIconView_isObscured__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) window];
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(v2, "convertRect:fromView:", *(void *)(a1 + 32));
  PXRectGetCenter();
}

- (int64_t)presentedState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(AVPlayer *)self->_player status] != AVPlayerStatusReadyToPlay
    || [(PXFooterAnimatedIconView *)self isPlayerHidden])
  {
    return 1;
  }
  memset(&v7, 0, sizeof(v7));
  int64_t result = (int64_t)self->_player;
  if (result)
  {
    [(id)result currentTime];
    if ((v7.flags & 0x1D) == 1)
    {
      [(AVPlayer *)self->_player rate];
      if (v4 == 0.0)
      {
        CMTime lhs = (CMTime)self->_introStartTime;
        CMTime rhs = (CMTime)self->_loopStartTime;
        CMTimeAdd(&time, &lhs, &rhs);
        CMTimeMultiplyByFloat64(&time2, &time, 0.5);
        CMTime time = v7;
        if (CMTimeCompare(&time, &time2) < 0)
        {
          return 2;
        }
        else
        {
          CMTime lhs = (CMTime)self->_loopEndTime;
          CMTime rhs = (CMTime)self->_outroEndTime;
          CMTimeAdd(&time, &lhs, &rhs);
          CMTimeMultiplyByFloat64(&v5, &time, 0.5);
          CMTime time = v7;
          if (CMTimeCompare(&time, &v5) >= 1) {
            return 2;
          }
          else {
            return 4;
          }
        }
      }
      else
      {
        CMTime time = v7;
        CMTime lhs = (CMTime)self->_loopStartTime;
        if (CMTimeCompare(&time, &lhs) < 1)
        {
          return 3;
        }
        else
        {
          CMTime time = v7;
          CMTime lhs = (CMTime)self->_loopEndTime;
          if (CMTimeCompare(&time, &lhs) < 1)
          {
            return 5;
          }
          else
          {
            CMTime time = v7;
            CMTime lhs = (CMTime)self->_outroEndTime;
            if (CMTimeCompare(&time, &lhs) >= 1) {
              return 0;
            }
            else {
              return 6;
            }
          }
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)setIsPlayerPaused:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isPlayerPaused != v3)
  {
    self->_isPlayerPaused = v3;
    if (v3)
    {
      [(AVPlayer *)self->_player rate];
      self->_playerRateBeforePause = v6;
      player = self->_player;
      [(AVPlayer *)player pause];
    }
    else
    {
      *(float *)&double v5 = self->_playerRateBeforePause;
      [(AVPlayer *)self->_player setRate:v5];
      [(PXFooterAnimatedIconView *)self _update];
    }
  }
}

- (BOOL)isPlayerPaused
{
  return self->_isPlayerPaused;
}

- (void)setIsPlayerHidden:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isPlayerHidden != v3)
  {
    self->_isPlayerHidden = v3;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46__PXFooterAnimatedIconView_setIsPlayerHidden___block_invoke;
    v5[3] = &unk_1E5DCFE98;
    v5[4] = self;
    BOOL v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __46__PXFooterAnimatedIconView_setIsPlayerHidden___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) playerLayer];
  [v3 setHidden:v2];

  float v4 = (void *)MEMORY[0x1E4F39CF8];
  return [v4 commit];
}

- (BOOL)isPlayerHidden
{
  return self->_isPlayerHidden;
}

- (void)setPlayerItem:(id)a3
{
  int v10 = (AVPlayerItem *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  p_playerItem = &self->_playerItem;
  playerItem = self->_playerItem;
  if (playerItem != v10)
  {
    CMTime v7 = (void *)MEMORY[0x1E4F16020];
    if (playerItem)
    {
      v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 removeObserver:self name:*v7 object:*p_playerItem];
    }
    objc_storeStrong((id *)&self->_playerItem, a3);
    if (*p_playerItem)
    {
      int v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 addObserver:self selector:sel__didPlayerToEndTime_ name:*v7 object:*p_playerItem];
    }
  }
}

- (AVPlayerItem)playerItem
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  playerItem = self->_playerItem;
  return playerItem;
}

- (void)_didSeekToPlayFromTime:(id *)a3 toTime:(id *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
  CMTime v7 = [(AVPlayer *)self->_player currentItem];
  [v7 setForwardPlaybackEndTime:&v10];

  [(AVPlayer *)self->_player play];
  [(PXFooterAnimatedIconView *)self setIsPlayerHidden:0];
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 loopStartTime = self->_loopStartTime;
  if (!CMTimeCompare(&time1, (CMTime *)&loopStartTime))
  {
    CMTime time1 = (CMTime)*a4;
    $95D729B680665BEAEFA1D6FCA8238556 loopStartTime = self->_loopEndTime;
    if (!CMTimeCompare(&time1, (CMTime *)&loopStartTime)) {
      [(PXFooterAnimatedIconView *)self setWantsGridCycleTimeObservation:1];
    }
  }
}

- (void)_playFromTime:(id *)a3 toTime:(id *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(PXFooterAnimatedIconView *)self _createPlayerIfNeeded];
  [(AVPlayer *)self->_player pause];
  objc_initWeak(&location, self);
  CMTime v7 = self->_queue;
  player = self->_player;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __49__PXFooterAnimatedIconView__playFromTime_toTime___block_invoke;
  v17[3] = &unk_1E5DB57E0;
  int v9 = v7;
  uint64_t v18 = v9;
  objc_copyWeak(&v19, &location);
  long long v20 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  long long v22 = *(_OWORD *)&a4->var0;
  int64_t v11 = a4->var3;
  int64_t v21 = var3;
  int64_t v23 = v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16 = *a3;
  long long v14 = *MEMORY[0x1E4F1FA48];
  uint64_t v15 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  long long v12 = *MEMORY[0x1E4F1FA48];
  uint64_t v13 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [(AVPlayer *)player seekToTime:&v16 toleranceBefore:&v14 toleranceAfter:&v12 completionHandler:v17];
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

void __49__PXFooterAnimatedIconView__playFromTime_toTime___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    BOOL v3 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__PXFooterAnimatedIconView__playFromTime_toTime___block_invoke_2;
    block[3] = &unk_1E5DB57B8;
    objc_copyWeak(&v5, (id *)(a1 + 40));
    long long v6 = *(_OWORD *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 64);
    long long v8 = *(_OWORD *)(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 88);
    dispatch_async(v3, block);
    objc_destroyWeak(&v5);
  }
}

void __49__PXFooterAnimatedIconView__playFromTime_toTime___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v5 = *(_OWORD *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 56);
  long long v3 = *(_OWORD *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 80);
  [WeakRetained _didSeekToPlayFromTime:&v5 toTime:&v3];
}

- (void)_didSeekToTime:(id *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(PXFooterAnimatedIconView *)self setIsPlayerHidden:0];
}

- (void)_seekToTime:(id *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(PXFooterAnimatedIconView *)self _createPlayerIfNeeded];
  [(AVPlayer *)self->_player pause];
  objc_initWeak(&location, self);
  long long v5 = self->_queue;
  player = self->_player;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __40__PXFooterAnimatedIconView__seekToTime___block_invoke;
  v13[3] = &unk_1E5DB5790;
  uint64_t v7 = v5;
  long long v14 = v7;
  objc_copyWeak(&v15, &location);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a3;
  long long v10 = *MEMORY[0x1E4F1FA48];
  uint64_t v11 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  long long v8 = *MEMORY[0x1E4F1FA48];
  uint64_t v9 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [(AVPlayer *)player seekToTime:&v12 toleranceBefore:&v10 toleranceAfter:&v8 completionHandler:v13];
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

void __40__PXFooterAnimatedIconView__seekToTime___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    long long v3 = *(NSObject **)(a1 + 32);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __40__PXFooterAnimatedIconView__seekToTime___block_invoke_2;
    v4[3] = &unk_1E5DCE6A8;
    objc_copyWeak(&v5, (id *)(a1 + 40));
    long long v6 = *(_OWORD *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 64);
    dispatch_async(v3, v4);
    objc_destroyWeak(&v5);
  }
}

void __40__PXFooterAnimatedIconView__seekToTime___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v3 = *(_OWORD *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  [WeakRetained _didSeekToTime:&v3];
}

- (void)_createPlayerIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_player)
  {
    long long v3 = [(PXFooterAnimatedIconView *)self _movieURL];
    if (v3)
    {
      uint64_t v4 = (AVPlayer *)[objc_alloc(MEMORY[0x1E4F16608]) initWithURL:v3];
      player = self->_player;
      self->_player = v4;

      [(AVPlayer *)self->_player _setDisallowsVideoLayerDisplayCompositing:1];
      [(AVPlayer *)self->_player setPreventsDisplaySleepDuringVideoPlayback:0];
      [(AVPlayer *)self->_player setAllowsExternalPlayback:0];
      [(AVPlayer *)self->_player setMuted:1];
      [(AVPlayer *)self->_player setActionAtItemEnd:1];
      long long v6 = [(AVPlayer *)self->_player currentItem];
      [(PXFooterAnimatedIconView *)self setPlayerItem:v6];

      uint64_t v7 = [MEMORY[0x1E4F16650] playerLayerWithPlayer:self->_player];
      [v7 setHidden:self->_isPlayerHidden];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __49__PXFooterAnimatedIconView__createPlayerIfNeeded__block_invoke;
      v9[3] = &unk_1E5DD32A8;
      v9[4] = self;
      id v10 = v7;
      id v8 = v7;
      dispatch_async(MEMORY[0x1E4F14428], v9);
    }
  }
}

uint64_t __49__PXFooterAnimatedIconView__createPlayerIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPlayerLayer:*(void *)(a1 + 40)];
}

- (void)_hideVideo
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(PXFooterAnimatedIconView *)self setIsPlayerHidden:1];
}

- (void)_crossedGridCycleBoundary
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(AVPlayer *)self->_player rate];
  if (v3 > 0.0)
  {
    player = self->_player;
    if (player) {
      [(AVPlayer *)player currentTime];
    }
    else {
      memset(&time1, 0, sizeof(time1));
    }
    CMTime time2 = (CMTime)self->_loopEndTime;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __53__PXFooterAnimatedIconView__crossedGridCycleBoundary__block_invoke;
      block[3] = &unk_1E5DD36F8;
      void block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __53__PXFooterAnimatedIconView__crossedGridCycleBoundary__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"PXFooterAnimatedIconViewCrossedGridCycleBoundaryNotificationName" object:*(void *)(a1 + 32)];
}

- (void)setWantsGridCycleTimeObservation:(BOOL)a3
{
  BOOL wantsGridCycleTimeObservation = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_wantsGridCycleTimeObservation != wantsGridCycleTimeObservation)
  {
    self->_BOOL wantsGridCycleTimeObservation = wantsGridCycleTimeObservation;
    if (self->_gridCycleTimeObservationToken)
    {
      -[AVPlayer removeTimeObserver:](self->_player, "removeTimeObserver:");
      id gridCycleTimeObservationToken = self->_gridCycleTimeObservationToken;
      self->_id gridCycleTimeObservationToken = 0;

      BOOL wantsGridCycleTimeObservation = self->_wantsGridCycleTimeObservation;
    }
    if (wantsGridCycleTimeObservation)
    {
      objc_initWeak(&location, self);
      player = self->_player;
      CMTimeMakeWithSeconds(&v12, 2.0, 60);
      queue = self->_queue;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __61__PXFooterAnimatedIconView_setWantsGridCycleTimeObservation___block_invoke;
      v10[3] = &unk_1E5DCF948;
      objc_copyWeak(&v11, &location);
      id v8 = [(AVPlayer *)player addPeriodicTimeObserverForInterval:&v12 queue:queue usingBlock:v10];
      id v9 = self->_gridCycleTimeObservationToken;
      self->_id gridCycleTimeObservationToken = v8;

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

void __61__PXFooterAnimatedIconView_setWantsGridCycleTimeObservation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _crossedGridCycleBoundary];
}

- (BOOL)wantsGridCycleTimeObservation
{
  return self->_wantsGridCycleTimeObservation;
}

- (void)_transitionToState:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(PXFooterAnimatedIconView *)self setWantsGridCycleTimeObservation:0];
  switch(a3)
  {
    case 1:
      [(PXFooterAnimatedIconView *)self _hideVideo];
      return;
    case 2:
      uint64_t v5 = 448;
      goto LABEL_8;
    case 3:
      p_introStartTime = &self->_introStartTime;
      uint64_t v7 = 472;
      goto LABEL_11;
    case 4:
      uint64_t v5 = 496;
LABEL_8:
      id v8 = (char *)self + v5;
      long long v12 = *(_OWORD *)v8;
      int64_t epoch = *((void *)v8 + 2);
      [(PXFooterAnimatedIconView *)self _seekToTime:&v12];
      return;
    case 5:
      p_introStartTime = &self->_loopStartTime;
      uint64_t v7 = 496;
      goto LABEL_11;
    case 6:
      p_introStartTime = &self->_loopEndTime;
      uint64_t v7 = 520;
LABEL_11:
      id v9 = (char *)self + v7;
      long long v12 = *(_OWORD *)&p_introStartTime->value;
      int64_t epoch = p_introStartTime->epoch;
      long long v10 = *(_OWORD *)v9;
      uint64_t v11 = *((void *)v9 + 2);
      [(PXFooterAnimatedIconView *)self _playFromTime:&v12 toTime:&v10];
      break;
    default:
      return;
  }
}

- (void)_update
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (![(PXFooterAnimatedIconView *)self isPlayerPaused])
  {
    int64_t waitingState = self->_waitingState;
    self->_int64_t waitingState = 0;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v5 = v4;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __35__PXFooterAnimatedIconView__update__block_invoke;
    aBlock[3] = &unk_1E5DB5740;
    aBlock[4] = self;
    aBlock[5] = waitingState;
    aBlock[6] = v4;
    long long v6 = _Block_copy(aBlock);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __35__PXFooterAnimatedIconView__update__block_invoke_3;
    v26[3] = &unk_1E5DCE1A8;
    v26[5] = v5;
    v26[4] = self;
    uint64_t v7 = _Block_copy(v26);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __35__PXFooterAnimatedIconView__update__block_invoke_4;
    v24[3] = &unk_1E5DD3128;
    id v8 = v6;
    id v25 = v8;
    id v9 = (void (**)(void))_Block_copy(v24);
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __35__PXFooterAnimatedIconView__update__block_invoke_5;
    id v19 = &unk_1E5DB5768;
    long long v20 = self;
    id v21 = v8;
    id v22 = v7;
    int64_t v23 = waitingState;
    id v10 = v7;
    id v11 = v8;
    long long v12 = (unsigned int (**)(void))_Block_copy(&v16);
    unint64_t v13 = [(PXFooterAnimatedIconView *)self presentedState];
    int64_t v14 = [(PXFooterAnimatedIconView *)self desiredMode];
    uint64_t v15 = 1;
    switch(v14)
    {
      case 0:
        goto LABEL_18;
      case 1:
        if (v13 < 2) {
          goto LABEL_17;
        }
        if (v13 != 4) {
          goto LABEL_20;
        }
        uint64_t v15 = 6;
        goto LABEL_18;
      case 2:
        if (v13 < 2)
        {
          v9[2](v9);
LABEL_17:
          uint64_t v15 = 2;
        }
        else if (v13 == 2)
        {
          if (v12[2](v12)) {
            uint64_t v15 = 3;
          }
          else {
            uint64_t v15 = 2;
          }
        }
        else
        {
          if (v13 != 4) {
            goto LABEL_20;
          }
          uint64_t v15 = 5;
        }
        goto LABEL_18;
      case 3:
        if (v13 >= 2)
        {
          if (v13 != 4) {
            goto LABEL_20;
          }
          if (v12[2](v12)) {
            uint64_t v15 = 6;
          }
          else {
            uint64_t v15 = 4;
          }
        }
        else
        {
          v9[2](v9);
          uint64_t v15 = 4;
        }
LABEL_18:
        if (v15 != v13) {
          -[PXFooterAnimatedIconView _transitionToState:](self, "_transitionToState:");
        }
LABEL_20:

        break;
      default:
        goto LABEL_20;
    }
  }
}

void __35__PXFooterAnimatedIconView__update__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(a1 + 32) + 560) = a2;
  if (*(void *)(a1 + 40) != a2) {
    *(void *)(*(void *)(a1 + 32) + 568) = *(void *)(a1 + 48);
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  dispatch_time_t v3 = dispatch_time(0, 200000000);
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 432);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__PXFooterAnimatedIconView__update__block_invoke_2;
  v5[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v6, &location);
  dispatch_after(v3, v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

BOOL __35__PXFooterAnimatedIconView__update__block_invoke_3(uint64_t a1, double a2)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(*(void *)(a1 + 32) + 568);
  return v2 < v3 + a2 && v2 >= v3;
}

uint64_t __35__PXFooterAnimatedIconView__update__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL __35__PXFooterAnimatedIconView__update__block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2 != 2)
  {
    if (v2 != 1) {
      return v2 == 0;
    }
    [*(id *)(a1 + 32) isObscured];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    return 0;
  }
  if ([*(id *)(a1 + 32) isObscured])
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_9:
    v4();
    return 0;
  }
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = +[PXFooterSettings sharedInstance];
  [v6 animationDelay];
  LODWORD(v5) = (*(uint64_t (**)(uint64_t))(v5 + 16))(v5);

  if (v5)
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_9;
  }
  return 1;
}

void __35__PXFooterAnimatedIconView__update__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _update];
}

- (void)_setNeedsUpdate
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__PXFooterAnimatedIconView__setNeedsUpdate__block_invoke;
  v4[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __43__PXFooterAnimatedIconView__setNeedsUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _update];
}

- (void)_layoutPlayer
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFooterAnimatedIconView.m", 236, @"%s must be called on the main thread", "-[PXFooterAnimatedIconView _layoutPlayer]");
  }
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  uint64_t v4 = [(PXFooterAnimatedIconView *)self layer];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  unint64_t v13 = [(PXFooterAnimatedIconView *)self playerLayer];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  int64_t v14 = (void *)MEMORY[0x1E4F39CF8];
  [v14 commit];
}

- (void)_updateIsPlayerPaused
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFooterAnimatedIconView.m", 227, @"%s must be called on the main thread", "-[PXFooterAnimatedIconView _updateIsPlayerPaused]");
  }
  BOOL v4 = self->_reasonsToPause != 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PXFooterAnimatedIconView__updateIsPlayerPaused__block_invoke;
  block[3] = &unk_1E5DD0EE8;
  objc_copyWeak(&v8, &location);
  BOOL v9 = v4;
  dispatch_async(queue, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __49__PXFooterAnimatedIconView__updateIsPlayerPaused__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsPlayerPaused:v1];
}

- (void)_removeReasonToPause:(unint64_t)a3
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFooterAnimatedIconView.m", 221, @"%s must be called on the main thread", "-[PXFooterAnimatedIconView _removeReasonToPause:]");
  }
  self->_reasonsToPause &= ~a3;
  [(PXFooterAnimatedIconView *)self _updateIsPlayerPaused];
}

- (void)_addReasonToPause:(unint64_t)a3
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFooterAnimatedIconView.m", 215, @"%s must be called on the main thread", "-[PXFooterAnimatedIconView _addReasonToPause:]");
  }
  self->_reasonsToPause |= a3;
  [(PXFooterAnimatedIconView *)self _updateIsPlayerPaused];
}

- (void)_updateStyle
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFooterAnimatedIconView.m", 184, @"%s must be called on the main thread", "-[PXFooterAnimatedIconView _updateStyle]");
  }
  [(PXFooterAnimatedIconView *)self traitCollection];
  objc_claimAutoreleasedReturnValue();
  PXUserInterfaceStyleFromUITraitCollection();
}

void __40__PXFooterAnimatedIconView__updateStyle__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setStyle:v1];
}

- (void)setPlayerLayer:(id)a3
{
  double v10 = (AVPlayerLayer *)a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFooterAnimatedIconView.m", 173, @"%s must be called on the main thread", "-[PXFooterAnimatedIconView setPlayerLayer:]");
  }
  playerLayer = self->_playerLayer;
  double v7 = v10;
  if (playerLayer != v10)
  {
    [(AVPlayerLayer *)playerLayer removeFromSuperlayer];
    objc_storeStrong((id *)&self->_playerLayer, a3);
    id v8 = [(PXFooterAnimatedIconView *)self layer];
    [v8 addSublayer:self->_playerLayer];

    [(PXFooterAnimatedIconView *)self setNeedsLayout];
    double v7 = v10;
  }
}

- (void)setDesiredMode:(int64_t)a3
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFooterAnimatedIconView.m", 159, @"%s must be called on the main thread", "-[PXFooterAnimatedIconView setDesiredMode:]");
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_desiredMode == a3)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    self->_lock_desiredMode = a3;
    os_unfair_lock_unlock(&self->_lock);
    [(PXFooterAnimatedIconView *)self _setNeedsUpdate];
  }
}

- (int64_t)desiredMode
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_desiredMode = self->_lock_desiredMode;
  os_unfair_lock_unlock(p_lock);
  return lock_desiredMode;
}

- (void)_windowDidChange
{
  double v3 = [(PXFooterAnimatedIconView *)self window];

  if (v3)
  {
    [(PXFooterAnimatedIconView *)self _removeReasonToPause:2];
  }
  else
  {
    [(PXFooterAnimatedIconView *)self _addReasonToPause:2];
  }
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PXFooterAnimatedIconView;
  -[PXFooterAnimatedIconView setHidden:](&v5, sel_setHidden_);
  if (v3) {
    [(PXFooterAnimatedIconView *)self _addReasonToPause:1];
  }
  else {
    [(PXFooterAnimatedIconView *)self _removeReasonToPause:1];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 75.0;
  double v4 = 75.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)dealloc
{
  [(AVPlayer *)self->_player removeTimeObserver:self->_gridCycleTimeObservationToken];
  v3.receiver = self;
  v3.super_class = (Class)PXFooterAnimatedIconView;
  [(PXFooterAnimatedIconView *)&v3 dealloc];
}

- (PXFooterAnimatedIconView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PXFooterAnimatedIconView;
  objc_super v3 = -[PXFooterAnimatedIconView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_super v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.mobileslideshow.PXFooterAnimatedIconView", v5);
    double v7 = (void *)*((void *)v3 + 54);
    *((void *)v3 + 54) = v6;

    v3[577] = 1;
    CMTimeMakeWithSeconds(&v14, 0.0, 60);
    long long v8 = *(_OWORD *)&v14.value;
    *((void *)v3 + 58) = v14.epoch;
    *((_OWORD *)v3 + 28) = v8;
    CMTimeMakeWithSeconds(&v14, 2.0, 60);
    long long v9 = *(_OWORD *)&v14.value;
    *((void *)v3 + 61) = v14.epoch;
    *(_OWORD *)(v3 + 472) = v9;
    CMTimeMakeWithSeconds(&v14, 14.0, 60);
    long long v10 = *(_OWORD *)&v14.value;
    *((void *)v3 + 64) = v14.epoch;
    *((_OWORD *)v3 + 31) = v10;
    CMTimeMakeWithSeconds(&v14, 16.0, 60);
    long long v11 = *(_OWORD *)&v14.value;
    *((void *)v3 + 67) = v14.epoch;
    *(_OWORD *)(v3 + 520) = v11;
    double v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v3 selector:sel__applicationDidEnterBackground_ name:*MEMORY[0x1E4FB2640] object:0];
    [v12 addObserver:v3 selector:sel__applicationDidEnterForeground_ name:*MEMORY[0x1E4FB2730] object:0];
    [v12 addObserver:v3 selector:sel__mediaServicesWereReset_ name:*MEMORY[0x1E4F157A8] object:0];
  }
  return (PXFooterAnimatedIconView *)v3;
}

@end