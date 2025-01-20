@interface ISPlayerView
- (BOOL)_needsUpdate;
- (BOOL)audioMuted;
- (BOOL)isInteracting;
- (BOOL)isReadyForDisplay;
- (BOOL)readyForDisplay;
- (CGSize)dimensionsOfReservedVideoMemory;
- (ISBasePlayerUIView)_playerView;
- (ISPlayerItem)_playerItem;
- (ISPlayerView)initWithFrame:(CGRect)a3;
- (ISPlayerView)initWithVideoPlayer:(id)a3;
- (ISPlayerViewDelegate)delegate;
- (ISWrappedAVPlayer)_videoPlayer;
- (NSError)error;
- (NSMutableSet)_activeGestures;
- (UIGestureRecognizer)_gestureRecognizer;
- (UIGestureRecognizer)gestureRecognizer;
- (id)videoPlayerForPlayer:(id)a3;
- (int64_t)playbackState;
- (int64_t)status;
- (unint64_t)playbackStyle;
- (void)_handleGesture:(id)a3;
- (void)_invalidatePlaybackState;
- (void)_invalidatePlayerItemLoadingTarget;
- (void)_invalidatePlayerMuted;
- (void)_invalidatePlayerPlayerItem;
- (void)_invalidatePlayerView;
- (void)_invalidateReadyForDisplay;
- (void)_invalidateStatus;
- (void)_setGestureRecognizer:(id)a3;
- (void)_setInteracting:(BOOL)a3;
- (void)_setPlaybackState:(int64_t)a3;
- (void)_setPlayerItem:(id)a3;
- (void)_setPlayerView:(id)a3;
- (void)_setReadyForDisplay:(BOOL)a3;
- (void)_setStatus:(int64_t)a3;
- (void)_updateIfNeeded;
- (void)_updatePlaybackStateIfNeeded;
- (void)_updatePlayerItemLoadingTargetIfNeeded;
- (void)_updatePlayerMutedIfNeeded;
- (void)_updatePlayerPlayerItemIfNeeded;
- (void)_updatePlayerViewIfNeeded;
- (void)_updateReadyForDisplayIfNeeded;
- (void)_updateStatusIfNeeded;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)prepareWithPhoto:(CGImage *)a3 videoAsset:(id)a4 photoTime:(double)a5 photoEXIFOrientation:(int)a6;
- (void)setAudioMuted:(BOOL)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDimensionsOfReservedVideoMemory:(CGSize)a3;
- (void)setPlaybackStyle:(unint64_t)a3;
@end

@implementation ISPlayerView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activeGestures, 0);
  objc_storeStrong((id *)&self->__gestureRecognizer, 0);
  objc_storeStrong((id *)&self->__playerItem, 0);
  objc_storeStrong((id *)&self->__videoPlayer, 0);
  objc_storeStrong((id *)&self->__playerView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setDimensionsOfReservedVideoMemory:(CGSize)a3
{
  self->_dimensionsOfReservedVideoMemory = a3;
}

- (CGSize)dimensionsOfReservedVideoMemory
{
  double width = self->_dimensionsOfReservedVideoMemory.width;
  double height = self->_dimensionsOfReservedVideoMemory.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)playbackStyle
{
  return self->_playbackStyle;
}

- (NSMutableSet)_activeGestures
{
  return self->__activeGestures;
}

- (void)_setReadyForDisplay:(BOOL)a3
{
  self->_readyForDisplay = a3;
}

- (BOOL)readyForDisplay
{
  return self->_readyForDisplay;
}

- (UIGestureRecognizer)_gestureRecognizer
{
  return self->__gestureRecognizer;
}

- (ISPlayerItem)_playerItem
{
  return self->__playerItem;
}

- (ISWrappedAVPlayer)_videoPlayer
{
  return self->__videoPlayer;
}

- (ISBasePlayerUIView)_playerView
{
  return self->__playerView;
}

- (ISPlayerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ISPlayerViewDelegate *)WeakRetained;
}

- (NSError)error
{
  return self->_error;
}

- (void)_setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (BOOL)isInteracting
{
  return self->_isInteracting;
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (BOOL)isReadyForDisplay
{
  return self->_isReadyForDisplay;
}

- (BOOL)audioMuted
{
  return self->_audioMuted;
}

- (id)videoPlayerForPlayer:(id)a3
{
  v4 = [(ISPlayerView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(ISPlayerView *)self delegate];
    v7 = [v6 videoPlayerForPlayerView:self];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)ISPlayerObservationContext == a5)
  {
    if ((v6 & 2) != 0) {
      [(ISPlayerView *)self _invalidateStatus];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ((v6 & 8) == 0) {
        goto LABEL_13;
      }
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if ((v6 & 0x10) == 0 || (isKindOfClass & 1) == 0) {
        goto LABEL_13;
      }
    }
    [(ISPlayerView *)self _invalidatePlaybackState];
    goto LABEL_13;
  }
  if ((v6 & 1) != 0 && (void *)ISPlayerItemObservationContext == a5) {
    [(ISPlayerView *)self _invalidateReadyForDisplay];
  }
LABEL_13:
  [(ISPlayerView *)self _updateIfNeeded];
}

- (void)_updateReadyForDisplayIfNeeded
{
  if (!self->_isValid.readyForDisplay)
  {
    self->_isValid.readyForDisplay = 1;
    id v3 = [(ISPlayerView *)self _playerItem];
    -[ISPlayerView _setReadyForDisplay:](self, "_setReadyForDisplay:", [v3 status] > 1);
  }
}

- (void)_updatePlaybackStateIfNeeded
{
  if (self->_isValid.playbackState) {
    return;
  }
  self->_isValid.playbackState = 1;
  id v6 = [(ISPlayerView *)self _playerView];
  id v3 = [v6 player];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v4 = [v3 currentPlaybackStyle] - 1;
    if (v4 < 4)
    {
      uint64_t v5 = qword_1DB24DF60[v4];
      goto LABEL_10;
    }
LABEL_9:
    uint64_t v5 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  if ([v3 isPlaying]) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 0;
  }
LABEL_10:
  [(ISPlayerView *)self _setPlaybackState:v5];
}

- (void)_updateStatusIfNeeded
{
  if (!self->_isValid.status)
  {
    self->_isValid.status = 1;
    id v7 = [(ISPlayerView *)self _playerView];
    id v3 = [v7 player];
    uint64_t v4 = [v3 status];
    if (v4 == 3) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 0;
    }
    if (v4 == 2) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = v5;
    }
    [(ISPlayerView *)self _setStatus:v6];
  }
}

- (void)_updatePlayerMutedIfNeeded
{
  if (!self->_isValid.playerMuted)
  {
    self->_isValid.playerMuted = 1;
    id v4 = [(ISPlayerView *)self _playerView];
    id v3 = [v4 player];
    objc_msgSend(v3, "setAudioEnabled:", -[ISPlayerView audioMuted](self, "audioMuted") ^ 1);
  }
}

- (void)_updatePlayerPlayerItemIfNeeded
{
  if (!self->_isValid.playerPlayerItem)
  {
    self->_isValid.playerPlayerItem = 1;
    id v5 = [(ISPlayerView *)self _playerItem];
    id v3 = [(ISPlayerView *)self _playerView];
    id v4 = [v3 player];
    [v4 setPlayerItem:v5];
  }
}

- (void)_updatePlayerItemLoadingTargetIfNeeded
{
  if (!self->_isValid.playerItemLoadingTarget)
  {
    self->_isValid.playerItemLoadingTarget = 1;
    id v4 = [(ISPlayerView *)self _playerItem];
    if ([(ISPlayerView *)self playbackStyle] == 1) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
    [v4 setLoadingTarget:v3];
    [v4 discardContentBelowLoadingTarget];
  }
}

- (void)_updatePlayerViewIfNeeded
{
  if (!self->_isValid.playerView)
  {
    self->_isValid.playerView = 1;
    [(ISPlayerView *)self playbackStyle];
    id v3 = objc_alloc_init((Class)objc_opt_class());
    [v3 setAutoresizingMask:18];
    objc_msgSend(v3, "setContentMode:", -[ISPlayerView contentMode](self, "contentMode"));
    [(ISPlayerView *)self _setPlayerView:v3];
  }
}

- (void)_updateIfNeeded
{
  if ([(ISPlayerView *)self _needsUpdate])
  {
    [(ISPlayerView *)self _updatePlayerViewIfNeeded];
    [(ISPlayerView *)self _updatePlayerItemLoadingTargetIfNeeded];
    [(ISPlayerView *)self _updatePlayerPlayerItemIfNeeded];
    [(ISPlayerView *)self _updatePlayerMutedIfNeeded];
    [(ISPlayerView *)self _updateStatusIfNeeded];
    [(ISPlayerView *)self _updatePlaybackStateIfNeeded];
    [(ISPlayerView *)self _updateReadyForDisplayIfNeeded];
  }
}

- (BOOL)_needsUpdate
{
  return !self->_isValid.playerPlayerItem
      || !self->_isValid.playerItemLoadingTarget
      || !self->_isValid.playerView
      || !self->_isValid.playerMuted
      || !self->_isValid.status
      || !self->_isValid.playbackState
      || !self->_isValid.readyForDisplay;
}

- (void)_invalidateReadyForDisplay
{
  self->_isValid.readyForDisplay = 0;
}

- (void)_invalidatePlaybackState
{
  self->_isValid.playbackState = 0;
}

- (void)_invalidateStatus
{
  self->_isValid.status = 0;
}

- (void)_invalidatePlayerMuted
{
  self->_isValid.playerMuted = 0;
}

- (void)_invalidatePlayerView
{
  self->_isValid.playerView = 0;
}

- (void)_invalidatePlayerPlayerItem
{
  self->_isValid.playerPlayerItem = 0;
}

- (void)_invalidatePlayerItemLoadingTarget
{
  self->_isValid.playerItemLoadingTarget = 0;
}

- (void)_setGestureRecognizer:(id)a3
{
  uint64_t v6 = (UIGestureRecognizer *)a3;
  if (self->__gestureRecognizer != v6)
  {
    objc_storeStrong((id *)&self->__gestureRecognizer, a3);
    if (self->_delegateRespondsTo.gestureRecognizerDidChange)
    {
      id v5 = [(ISPlayerView *)self delegate];
      [v5 playerViewGestureRecognizerDidChange:self];
    }
  }
}

- (void)_setPlayerView:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = (ISBasePlayerUIView *)a3;
  p_playerView = &self->__playerView;
  playerView = self->__playerView;
  if (playerView != v5)
  {
    v8 = [(ISBasePlayerUIView *)playerView player];
    [v8 unregisterChangeObserver:self context:ISPlayerObservationContext];

    id v9 = [(ISBasePlayerUIView *)*p_playerView player];
    [v9 setDelegate:0];

    [(ISBasePlayerUIView *)*p_playerView removeFromSuperview];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v10 = [(ISBasePlayerUIView *)*p_playerView gestureRecognizers];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * i) removeTarget:self action:0];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v12);
    }

    objc_storeStrong((id *)&self->__playerView, a3);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v15 = [(ISBasePlayerUIView *)*p_playerView gestureRecognizers];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * j) addTarget:self action:sel__handleGesture_];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v17);
    }

    v20 = [(ISBasePlayerUIView *)*p_playerView player];
    [v20 setDelegate:self];

    v21 = [(ISBasePlayerUIView *)*p_playerView player];
    [v21 registerChangeObserver:self context:ISPlayerObservationContext];

    v22 = *p_playerView;
    [(ISPlayerView *)self bounds];
    -[ISBasePlayerUIView setFrame:](v22, "setFrame:");
    [(ISPlayerView *)self addSubview:*p_playerView];
    [(ISPlayerView *)self _invalidatePlayerPlayerItem];
    v23 = [(ISBasePlayerUIView *)*p_playerView playbackGestureRecognizer];
    [(ISPlayerView *)self _setGestureRecognizer:v23];
  }
}

- (void)_setPlaybackState:(int64_t)a3
{
  if (self->_playbackState != a3)
  {
    self->_playbackState = a3;
    if (self->_delegateRespondsTo.playbackStateDidChange)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained playerViewPlaybackStateDidChange:self];
    }
  }
}

- (void)_setInteracting:(BOOL)a3
{
  if (self->_isInteracting != a3)
  {
    self->_isInteracting = a3;
    if (self->_delegateRespondsTo.interactingDidChange)
    {
      id v4 = [(ISPlayerView *)self delegate];
      [v4 playerViewIsInteractingDidChange:self];
    }
  }
}

- (void)_handleGesture:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 state];
  if (v4 != 2)
  {
    if (v4 == 1)
    {
      id v5 = [(ISPlayerView *)self _activeGestures];
      [v5 addObject:v8];
    }
    else
    {
      id v5 = [(ISPlayerView *)self _activeGestures];
      [v5 removeObject:v8];
    }
  }
  uint64_t v6 = [(ISPlayerView *)self _activeGestures];
  BOOL v7 = [v6 count] != 0;

  [(ISPlayerView *)self _setInteracting:v7];
}

- (void)_setPlayerItem:(id)a3
{
  id v5 = (ISPlayerItem *)a3;
  p_playerItem = &self->__playerItem;
  playerItem = self->__playerItem;
  if (playerItem != v5)
  {
    id v8 = v5;
    [(ISObservable *)playerItem unregisterChangeObserver:self context:ISPlayerItemObservationContext];
    objc_storeStrong((id *)&self->__playerItem, a3);
    [(ISObservable *)*p_playerItem registerChangeObserver:self context:ISPlayerItemObservationContext];
    [(ISPlayerItem *)*p_playerItem setLoadingTarget:2];
    [(ISPlayerView *)self _invalidatePlayerPlayerItem];
    [(ISPlayerView *)self _invalidatePlayerItemLoadingTarget];
    [(ISPlayerView *)self _invalidateReadyForDisplay];
    playerItem = (ISPlayerItem *)[(ISPlayerView *)self _updateIfNeeded];
    id v5 = v8;
  }

  MEMORY[0x1F41817F8](playerItem, v5);
}

- (UIGestureRecognizer)gestureRecognizer
{
  v2 = [(ISPlayerView *)self _playerView];
  id v3 = [v2 playbackGestureRecognizer];

  return (UIGestureRecognizer *)v3;
}

- (void)setDelegate:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->playbackStateDidChange = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->interactingDidChange = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->gestureRecognizerDidChange = objc_opt_respondsToSelector() & 1;
  }
}

- (void)setAudioMuted:(BOOL)a3
{
  if (self->_audioMuted != a3)
  {
    self->_audioMuted = a3;
    [(ISPlayerView *)self _invalidatePlayerMuted];
    [(ISPlayerView *)self _updateIfNeeded];
  }
}

- (void)setContentMode:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ISPlayerView;
  -[ISPlayerView setContentMode:](&v6, sel_setContentMode_);
  id v5 = [(ISPlayerView *)self _playerView];
  [v5 setContentMode:a3];
}

- (void)setPlaybackStyle:(unint64_t)a3
{
  if (self->_playbackStyle != a3)
  {
    self->_playbackStyle = a3;
    [(ISPlayerView *)self _invalidatePlayerItemLoadingTarget];
    [(ISPlayerView *)self _invalidatePlayerView];
    [(ISPlayerView *)self _updateIfNeeded];
  }
}

- (void)prepareWithPhoto:(CGImage *)a3 videoAsset:(id)a4 photoTime:(double)a5 photoEXIFOrientation:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a4;
  v20 = [[ISAsset alloc] initWithVideoAsset:v10 photo:a3 photoTime:v6 photoEXIFOrientation:a5];

  uint64_t v11 = [MEMORY[0x1E4F42D90] mainScreen];
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;

  uint64_t v16 = [MEMORY[0x1E4F42D90] mainScreen];
  [v16 scale];
  double v18 = v17;

  v19 = +[ISPlayerItem playerItemWithAsset:targetSize:](ISPlayerItem, "playerItemWithAsset:targetSize:", v20, v13 * v18, v15 * v18);
  [(ISPlayerView *)self prepareWithPlayerItem:v19];
}

- (ISPlayerView)initWithVideoPlayer:(id)a3
{
  id v4 = a3;
  id v5 = -[ISPlayerView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v5)
  {
    uint64_t v6 = [[ISWrappedAVPlayer alloc] _initWithAVPlayer:v4];
    videoPlayer = v5->__videoPlayer;
    v5->__videoPlayer = v6;
  }
  return v5;
}

- (ISPlayerView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ISPlayerView;
  id v3 = -[ISPlayerView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    activeGestures = v3->__activeGestures;
    v3->__activeGestures = v4;
  }
  return v3;
}

@end