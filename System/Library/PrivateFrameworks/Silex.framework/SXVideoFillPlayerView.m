@interface SXVideoFillPlayerView
- (BOOL)hasRequestedPlayback;
- (BOOL)shouldLoop;
- (SVAVPlayer)player;
- (SXImageView)stillImageView;
- (SXPlayerLayer)playerLayer;
- (SXVideoFillPlayerView)initWithVideoResource:(id)a3 imageView:(id)a4;
- (SXVideoResource)videoResource;
- (unint64_t)fillMode;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)play;
- (void)playIfPossible;
- (void)reset;
- (void)setFillMode:(unint64_t)a3;
- (void)setHasRequestedPlayback:(BOOL)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerLayer:(id)a3;
- (void)setShouldLoop:(BOOL)a3;
- (void)setStillImageView:(id)a3;
- (void)setVideoResource:(id)a3;
- (void)switchToPlayer;
@end

@implementation SXVideoFillPlayerView

- (SXVideoFillPlayerView)initWithVideoResource:(id)a3 imageView:(id)a4
{
  v30[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)SXVideoFillPlayerView;
  v9 = -[SXVideoFillPlayerView initWithFrame:](&v28, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_videoResource, a3);
    objc_storeStrong((id *)&v10->_stillImageView, a4);
    stillImageView = v10->_stillImageView;
    v12 = [MEMORY[0x263F1C550] clearColor];
    [(SXImageView *)stillImageView setBackgroundColor:v12];

    objc_initWeak(&location, v10);
    id v13 = objc_alloc(MEMORY[0x263EFA8D0]);
    v14 = [v7 URL];
    uint64_t v29 = *MEMORY[0x263EFA2B8];
    v30[0] = &unk_26D593B78;
    v15 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
    v16 = (void *)[v13 initWithURL:v14 options:v15];

    v17 = (void *)[objc_alloc(MEMORY[0x263EFA800]) initWithAsset:v16 automaticallyLoadedAssetKeys:&unk_26D593F38];
    uint64_t v18 = [objc_alloc(MEMORY[0x263F6C680]) initWithPlayerItem:v17 audioMode:2];
    player = v10->_player;
    v10->_player = (SVAVPlayer *)v18;

    [(SVAVPlayer *)v10->_player setPreventsDisplaySleepDuringVideoPlayback:0];
    [(SVAVPlayer *)v10->_player setMuted:1];
    v20 = v10->_player;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __57__SXVideoFillPlayerView_initWithVideoResource_imageView___block_invoke;
    v25[3] = &unk_264653360;
    objc_copyWeak(&v26, &location);
    [(SVAVPlayer *)v20 setPlaybackStatusBlock:v25];
    v21 = [(SXVideoFillPlayerView *)v10 player];
    uint64_t v22 = +[AVPlayerLayer playerLayerWithPlayer:v21];
    playerLayer = v10->_playerLayer;
    v10->_playerLayer = (SXPlayerLayer *)v22;

    [(SXPlayerLayer *)v10->_playerLayer addObserver:v10 forKeyPath:@"readyForDisplay" options:1 context:0];
    [(SXVideoFillPlayerView *)v10 addSubview:v10->_stillImageView];
    objc_destroyWeak(&v26);

    objc_destroyWeak(&location);
  }

  return v10;
}

void __57__SXVideoFillPlayerView_initWithVideoResource_imageView___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (a3 == 4)
  {
    if ([WeakRetained shouldLoop])
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __57__SXVideoFillPlayerView_initWithVideoResource_imageView___block_invoke_2;
      v8[3] = &unk_2646511F8;
      id v9 = v5;
      [v9 seekToStartWithCompletionBlock:v8];
    }
  }
  else if (a3 == 1)
  {
    [WeakRetained playIfPossible];
  }
}

uint64_t __57__SXVideoFillPlayerView_initWithVideoResource_imageView___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) play];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SXVideoFillPlayerView;
  [(SXVideoFillPlayerView *)&v5 layoutSubviews];
  v3 = [(SXVideoFillPlayerView *)self stillImageView];
  [(SXVideoFillPlayerView *)self bounds];
  objc_msgSend(v3, "setFrame:");

  v4 = [(SXVideoFillPlayerView *)self playerLayer];
  [(SXVideoFillPlayerView *)self bounds];
  objc_msgSend(v4, "setFrame:");
}

- (void)play
{
  v3 = [(SXVideoFillPlayerView *)self player];
  if ([v3 status] == 1)
  {
    v4 = [(SXVideoFillPlayerView *)self playerLayer];
    if ([v4 isReadyForDisplay])
    {
      BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();

      if (IsReduceMotionEnabled) {
        goto LABEL_7;
      }
      [(SXVideoFillPlayerView *)self switchToPlayer];
      v3 = [(SXVideoFillPlayerView *)self player];
      [v3 play];
    }
    else
    {
    }
  }

LABEL_7:
  [(SXVideoFillPlayerView *)self setHasRequestedPlayback:1];
}

- (void)pause
{
  v3 = [(SXVideoFillPlayerView *)self player];
  [v3 pause];

  [(SXVideoFillPlayerView *)self setHasRequestedPlayback:0];
}

- (void)setFillMode:(unint64_t)a3
{
  self->_fillMode = a3;
  v4 = [(SXVideoFillPlayerView *)self playerLayer];
  id v6 = v4;
  objc_super v5 = (void *)MEMORY[0x263EF9C68];
  if (a3 != 2) {
    objc_super v5 = (void *)MEMORY[0x263EF9C78];
  }
  [v4 setVideoGravity:*v5];
}

- (void)reset
{
  v3 = [(SXVideoFillPlayerView *)self player];
  uint64_t v4 = [v3 status];

  if (v4 == 1)
  {
    id v5 = [(SXVideoFillPlayerView *)self player];
    [v5 seekToStartWithCompletionBlock:0];
  }
}

- (void)switchToPlayer
{
  v3 = [(SXVideoFillPlayerView *)self stillImageView];

  if (v3)
  {
    uint64_t v4 = [(SXVideoFillPlayerView *)self layer];
    id v5 = [(SXVideoFillPlayerView *)self playerLayer];
    [v4 insertSublayer:v5 atIndex:0];

    id v6 = [(SXVideoFillPlayerView *)self stillImageView];
    [v6 removeFromSuperview];

    [(SXVideoFillPlayerView *)self setStillImageView:0];
  }
}

- (void)playIfPossible
{
  if ([(SXVideoFillPlayerView *)self hasRequestedPlayback])
  {
    id v5 = [(SXVideoFillPlayerView *)self playerLayer];
    if ([v5 isReadyForDisplay])
    {
      v3 = [(SXVideoFillPlayerView *)self player];
      uint64_t v4 = [v3 status];

      if (v4 == 1)
      {
        [(SXVideoFillPlayerView *)self play];
      }
    }
    else
    {
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11 = a3;
  id v8 = a4;
  id v9 = [(SXVideoFillPlayerView *)self playerLayer];
  if (v9 == v8 && [v11 isEqualToString:@"readyForDisplay"])
  {
    BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();

    if (!IsReduceMotionEnabled)
    {
      [(SXVideoFillPlayerView *)self switchToPlayer];
      [(SXVideoFillPlayerView *)self playIfPossible];
    }
  }
  else
  {
  }
}

- (void)dealloc
{
  v3 = [(SXVideoFillPlayerView *)self playerLayer];

  if (v3)
  {
    uint64_t v4 = [(SXVideoFillPlayerView *)self playerLayer];
    [v4 removeObserver:self forKeyPath:@"readyForDisplay"];
  }
  v5.receiver = self;
  v5.super_class = (Class)SXVideoFillPlayerView;
  [(SXVideoFillPlayerView *)&v5 dealloc];
}

- (unint64_t)fillMode
{
  return self->_fillMode;
}

- (BOOL)shouldLoop
{
  return self->_shouldLoop;
}

- (void)setShouldLoop:(BOOL)a3
{
  self->_shouldLoop = a3;
}

- (SXVideoResource)videoResource
{
  return self->_videoResource;
}

- (void)setVideoResource:(id)a3
{
}

- (SXPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (void)setPlayerLayer:(id)a3
{
}

- (SVAVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (SXImageView)stillImageView
{
  return self->_stillImageView;
}

- (void)setStillImageView:(id)a3
{
}

- (BOOL)hasRequestedPlayback
{
  return self->_hasRequestedPlayback;
}

- (void)setHasRequestedPlayback:(BOOL)a3
{
  self->_hasRequestedPlayback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stillImageView, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_videoResource, 0);
}

@end