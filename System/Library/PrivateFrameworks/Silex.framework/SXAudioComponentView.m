@interface SXAudioComponentView
- (AVPlayerViewController)playerViewController;
- (BOOL)allowHierarchyRemoval;
- (BOOL)audioHasPlayed;
- (BOOL)shouldAutoStartPlayback;
- (BOOL)startPlaybackWhenReady;
- (SVAVPlayer)player;
- (SXAudioComponentOverlayView)overlayView;
- (SXAudioComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8 resourceDataSource:(id)a9 host:(id)a10;
- (SXHost)host;
- (SXResourceDataSource)resourceDataSource;
- (id)cancelHandler;
- (unint64_t)analyticsMediaType;
- (void)discardContents;
- (void)hidePlaybackControls;
- (void)layoutViews;
- (void)loadAudio;
- (void)loadImage;
- (void)pauseMediaPlayback;
- (void)pauseMediaPlaybackForDisappearance;
- (void)playButtonTapped:(id)a3;
- (void)playbackPaused;
- (void)playbackResumed;
- (void)playbackStarted;
- (void)playerViewController:(id)a3 metricsCollectionEventOccured:(int64_t)a4;
- (void)presentComponentWithChanges:(id)a3;
- (void)renderContents;
- (void)setAudioHasPlayed:(BOOL)a3;
- (void)setCancelHandler:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerViewController:(id)a3;
- (void)setStartPlaybackWhenReady:(BOOL)a3;
- (void)setupPlayerViewControllerWithPlayer:(id)a3;
- (void)showPlaybackControls;
- (void)submitMediaEngageCompleteEvent;
- (void)submitMediaEngageEventForUserAction:(unint64_t)a3;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4;
@end

@implementation SXAudioComponentView

- (SXAudioComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8 resourceDataSource:(id)a9 host:(id)a10
{
  id v16 = a4;
  id v28 = a9;
  id v17 = a10;
  v29.receiver = self;
  v29.super_class = (Class)SXAudioComponentView;
  v18 = [(SXMediaComponentView *)&v29 initWithDOMObjectProvider:a3 viewport:v16 presentationDelegate:a5 componentStyleRendererFactory:a6 analyticsReporting:a7 appStateMonitor:a8];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_host, a10);
    objc_storeStrong((id *)&v19->_resourceDataSource, a9);
    v20 = [SXAudioComponentOverlayView alloc];
    v21 = [(SXComponentView *)v19 contentView];
    [v21 bounds];
    uint64_t v22 = -[SXAudioComponentOverlayView initWithFrame:](v20, "initWithFrame:");
    overlayView = v19->_overlayView;
    v19->_overlayView = (SXAudioComponentOverlayView *)v22;

    [(SXAudioComponentOverlayView *)v19->_overlayView setAutoresizingMask:18];
    v24 = v19->_overlayView;
    v25 = [MEMORY[0x263F1C550] blackColor];
    [(SXAudioComponentOverlayView *)v24 setBackgroundColor:v25];

    [(SXAudioComponentOverlayView *)v19->_overlayView setUserInteractionEnabled:1];
    v26 = [(SXAudioComponentOverlayView *)v19->_overlayView playButton];
    [v26 addTarget:v19 action:sel_playButtonTapped_ forControlEvents:64];

    [v16 addViewportChangeListener:v19 forOptions:8];
  }

  return v19;
}

- (void)presentComponentWithChanges:(id)a3
{
  BOOL var0 = a3.var0;
  v5.receiver = self;
  v5.super_class = (Class)SXAudioComponentView;
  [(SXComponentView *)&v5 presentComponentWithChanges:*(void *)&a3.var0 & 0xFFFFFFLL];
  if (var0) {
    [(SXAudioComponentView *)self layoutViews];
  }
}

- (void)renderContents
{
  v9.receiver = self;
  v9.super_class = (Class)SXAudioComponentView;
  [(SXComponentView *)&v9 renderContents];
  v3 = [(SXComponentView *)self component];
  v4 = [v3 stillImageIdentifier];

  if (v4)
  {
    objc_super v5 = [(SXComponentView *)self contentView];
    v6 = [(SXAudioComponentView *)self overlayView];
    [v5 addSubview:v6];

    [(SXAudioComponentView *)self loadImage];
  }
  else
  {
    v7 = [(SXAudioComponentView *)self player];

    if (!v7)
    {
      [(SXAudioComponentView *)self loadAudio];
      v8 = [(SXAudioComponentView *)self player];
      [(SXAudioComponentView *)self setupPlayerViewControllerWithPlayer:v8];
    }
  }
  [(SXAudioComponentView *)self layoutViews];
}

- (void)discardContents
{
  v15.receiver = self;
  v15.super_class = (Class)SXAudioComponentView;
  [(SXComponentView *)&v15 discardContents];
  v3 = [(SXAudioComponentView *)self player];
  int v4 = [v3 playbackStatus];

  if (v4 != 2)
  {
    objc_super v5 = [(SXAudioComponentView *)self cancelHandler];

    if (v5)
    {
      v6 = [(SXAudioComponentView *)self cancelHandler];
      v6[2]();

      [(SXAudioComponentView *)self setCancelHandler:0];
    }
    v7 = [(SXAudioComponentView *)self overlayView];
    [v7 setImage:0];

    v8 = [(SXAudioComponentView *)self overlayView];
    [v8 removeFromSuperview];

    objc_super v9 = [(SXAudioComponentView *)self overlayView];
    v10 = [v9 playButton];
    [v10 setHidden:0];

    [(SXAudioComponentView *)self setPlayer:0];
    v11 = [(SXAudioComponentView *)self playerViewController];
    [v11 willMoveToParentViewController:0];

    v12 = [(SXAudioComponentView *)self playerViewController];
    v13 = [v12 view];
    [v13 removeFromSuperview];

    v14 = [(SXAudioComponentView *)self playerViewController];
    [v14 removeFromParentViewController];

    [(SXAudioComponentView *)self setPlayerViewController:0];
    [(SXAudioComponentView *)self setStartPlaybackWhenReady:0];
  }
}

- (void)layoutViews
{
  v3 = [(SXAudioComponentView *)self overlayView];
  int v4 = [v3 superview];
  objc_super v5 = [(SXAudioComponentView *)self playerViewController];
  v6 = [v5 contentOverlayView];

  v7 = [(SXAudioComponentView *)self overlayView];
  v8 = v7;
  if (v4 == v6)
  {
    v10 = [(SXAudioComponentView *)self playerViewController];
    v11 = [v10 contentOverlayView];
    [v11 bounds];
    objc_msgSend(v8, "setFrame:");
  }
  else
  {
    objc_super v9 = [v7 superview];

    if (!v9) {
      goto LABEL_6;
    }
    v8 = [(SXAudioComponentView *)self overlayView];
    [(SXComponentView *)self contentFrame];
    objc_msgSend(v8, "setFrame:");
  }

LABEL_6:
  v12 = [(SXAudioComponentView *)self playerViewController];
  v13 = [v12 view];
  v14 = [v13 superview];

  if (v14)
  {
    id v16 = [(SXAudioComponentView *)self playerViewController];
    objc_super v15 = [v16 view];
    [(SXComponentView *)self contentFrame];
    objc_msgSend(v15, "setFrame:");
  }
}

- (void)playButtonTapped:(id)a3
{
  int v4 = [(SXAudioComponentView *)self overlayView];
  [v4 startActivityIndicator];

  [(SXAudioComponentView *)self setStartPlaybackWhenReady:1];
  [(SXAudioComponentView *)self submitMediaEngageEventForUserAction:4];
  dispatch_time_t v5 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SXAudioComponentView_playButtonTapped___block_invoke;
  block[3] = &unk_2646511F8;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x263EF83A0], block);
}

void __41__SXAudioComponentView_playButtonTapped___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) loadAudio];
  v2 = [MEMORY[0x263F6C690] sharedSessionForMode:1];
  v3 = [*(id *)(a1 + 32) player];
  [v2 addInterestForPlayer:v3 withMode:1];

  int v4 = *(void **)(a1 + 32);
  dispatch_time_t v5 = [v4 player];
  [v4 setupPlayerViewControllerWithPlayer:v5];

  v6 = [*(id *)(a1 + 32) playerViewController];
  v7 = [v6 contentOverlayView];
  v8 = [*(id *)(a1 + 32) overlayView];
  [v7 addSubview:v8];

  id v11 = [*(id *)(a1 + 32) overlayView];
  objc_super v9 = [*(id *)(a1 + 32) playerViewController];
  v10 = [v9 contentOverlayView];
  [v10 bounds];
  objc_msgSend(v11, "setFrame:");
}

- (void)setupPlayerViewControllerWithPlayer:(id)a3
{
  if (!self->_playerViewController)
  {
    id v4 = a3;
    dispatch_time_t v5 = objc_alloc_init(SXAudioPlayerViewController);
    playerViewController = self->_playerViewController;
    self->_playerViewController = &v5->super;

    [(AVPlayerViewController *)self->_playerViewController setAllowsPictureInPicturePlayback:0];
    [(AVPlayerViewController *)self->_playerViewController setPlayer:v4];

    [(AVPlayerViewController *)self->_playerViewController setDelegate:self];
    v7 = [(SXComponentView *)self presentationDelegate];
    id v20 = [v7 presentingContentViewController];

    [v20 addChildViewController:self->_playerViewController];
    v8 = [(AVPlayerViewController *)self->_playerViewController view];
    [(SXComponentView *)self contentFrame];
    objc_msgSend(v8, "setFrame:");

    objc_super v9 = [(SXComponentView *)self contentView];
    v10 = [(AVPlayerViewController *)self->_playerViewController view];
    [v9 addSubview:v10];

    [(AVPlayerViewController *)self->_playerViewController didMoveToParentViewController:v20];
    id v11 = [(SXAudioComponentView *)self playerViewController];
    uint64_t v12 = [v11 view];
    v13 = [MEMORY[0x263F1C550] clearColor];
    [(id)v12 setBackgroundColor:v13];

    v14 = [(SXAudioComponentView *)self playerViewController];
    LOBYTE(v12) = objc_opt_respondsToSelector();

    objc_super v15 = v20;
    if (v12)
    {
      id v16 = [(SXAudioComponentView *)self playerViewController];
      id v17 = [v16 contentView];

      if (objc_opt_respondsToSelector())
      {
        v18 = [v17 audioOnlyIndicatorView];
        v19 = [MEMORY[0x263F1C550] clearColor];
        [v18 setBackgroundColor:v19];
      }
      objc_super v15 = v20;
    }
  }
}

- (void)loadImage
{
  v3 = [(SXComponentView *)self DOMObjectProvider];
  id v4 = [(SXComponentView *)self component];
  dispatch_time_t v5 = [v4 stillImageIdentifier];
  v6 = [v3 imageResourceForIdentifier:v5];

  if ([(SXComponentView *)self visibilityState] == 1) {
    uint64_t v7 = 6;
  }
  else {
    uint64_t v7 = 4;
  }
  uint64_t v8 = [v6 wideColorSpace];
  objc_initWeak(&location, self);
  objc_super v9 = [SXImageRequest alloc];
  v10 = [v6 imageIdentifier];
  id v11 = [v6 URL];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  id v17 = __33__SXAudioComponentView_loadImage__block_invoke;
  v18 = &unk_264651468;
  objc_copyWeak(&v19, &location);
  uint64_t v12 = -[SXImageRequest initWithImageIdentifier:imageQualities:url:size:preserveColorspace:loadingBlock:](v9, "initWithImageIdentifier:imageQualities:url:size:preserveColorspace:loadingBlock:", v10, v7, v11, v8, &v15, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));

  v13 = [(SXAudioComponentView *)self resourceDataSource];
  v14 = [v13 loadImagesForImageRequest:v12 completionBlock:0];
  [(SXAudioComponentView *)self setCancelHandler:v14];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __33__SXAudioComponentView_loadImage__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_time_t v5 = [WeakRetained overlayView];
  v6 = [v5 image];

  if (!v6)
  {
    [WeakRetained setIsDisplayingMedia:1];
    uint64_t v7 = (void *)MEMORY[0x263F1CB60];
    uint64_t v8 = [WeakRetained overlayView];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __33__SXAudioComponentView_loadImage__block_invoke_2;
    v9[3] = &unk_264651158;
    v9[4] = WeakRetained;
    id v10 = v3;
    [v7 transitionWithView:v8 duration:5242880 options:v9 animations:0 completion:0.25];
  }
}

void __33__SXAudioComponentView_loadImage__block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) overlayView];
  v2 = [*(id *)(a1 + 40) image];
  [v3 setImage:v2];
}

- (void)loadAudio
{
  v19[1] = *MEMORY[0x263EF8340];
  id v3 = [(SXComponentView *)self DOMObjectProvider];
  id v4 = [(SXComponentView *)self component];
  dispatch_time_t v5 = [v4 resourceIdentifier];
  v6 = [v3 resourceForIdentifier:v5];

  uint64_t v7 = [(SXAudioComponentView *)self player];

  if (!v7)
  {
    id v8 = objc_alloc(MEMORY[0x263EFA8D0]);
    objc_super v9 = [v6 URL];
    uint64_t v18 = *MEMORY[0x263EFA2B8];
    v19[0] = &unk_26D593B90;
    id v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    id v11 = (void *)[v8 initWithURL:v9 options:v10];

    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263EFA800]) initWithAsset:v11 automaticallyLoadedAssetKeys:&unk_26D593F50];
    v13 = (void *)[objc_alloc(MEMORY[0x263F6C680]) initWithPlayerItem:v12 audioMode:3];
    [(SXAudioComponentView *)self setPlayer:v13];

    objc_initWeak(&location, self);
    v14 = [(SXAudioComponentView *)self player];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __33__SXAudioComponentView_loadAudio__block_invoke;
    v15[3] = &unk_264653360;
    objc_copyWeak(&v16, &location);
    [v14 setPlaybackStatusBlock:v15];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __33__SXAudioComponentView_loadAudio__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  switch(a3)
  {
    case 1:
      [WeakRetained setIsDisplayingMedia:1];
      if ([v6 shouldAutoStartPlayback]) {
        [v10 play];
      }
      break;
    case 2:
      uint64_t v7 = [WeakRetained overlayView];
      [v7 stopActivityIndicator];

      id v8 = [v6 overlayView];
      objc_super v9 = [v8 playButton];
      [v9 setHidden:1];

      [v6 setStartPlaybackWhenReady:0];
      if ([v10 playbackPosition]) {
        [v6 playbackResumed];
      }
      else {
        [v6 playbackStarted];
      }
      break;
    case 3:
      [WeakRetained playbackPaused];
      break;
    case 4:
      [WeakRetained playbackFinished];
      [v10 seekToStartWithCompletionBlock:0];
      break;
    default:
      break;
  }
}

- (BOOL)shouldAutoStartPlayback
{
  BOOL v3 = [(SXAudioComponentView *)self startPlaybackWhenReady];
  if (v3)
  {
    id v4 = [(SXAudioComponentView *)self host];
    int v5 = [v4 active];

    if (!v5 || [(SXAudioComponentView *)self audioHasPlayed]) {
      goto LABEL_10;
    }
    v6 = [(SXAudioComponentView *)self player];
    if (![v6 playbackStatus]) {
      goto LABEL_9;
    }
    uint64_t v7 = [(SXAudioComponentView *)self player];
    if ([v7 playbackStatus] == 5)
    {
LABEL_8:

LABEL_9:
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    id v8 = [(SXAudioComponentView *)self player];
    if ([v8 playbackStatus] == 2)
    {

      goto LABEL_8;
    }
    objc_super v9 = [(SXAudioComponentView *)self player];
    int v10 = [v9 playbackStatus];

    if (v10 == 4) {
      goto LABEL_10;
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)playbackPaused
{
}

- (void)playbackResumed
{
  BOOL v3 = [(SXComponentView *)self presentationDelegate];
  id v4 = [v3 mediaPlaybackController];
  -[SXMediaPlaybackController registerMediaPlayBack:]((uint64_t)v4, self);

  [(SXAudioComponentView *)self submitMediaEngageEventForUserAction:3];
}

- (void)playbackStarted
{
  BOOL v3 = [(SXComponentView *)self presentationDelegate];
  id v4 = [v3 mediaPlaybackController];
  -[SXMediaPlaybackController registerMediaPlayBack:]((uint64_t)v4, self);

  [(SXAudioComponentView *)self setAudioHasPlayed:1];
  [(SXAudioComponentView *)self submitMediaEngageEventForUserAction:1];
}

- (void)pauseMediaPlayback
{
  id v2 = [(SXAudioComponentView *)self player];
  [v2 pause];
}

- (void)pauseMediaPlaybackForDisappearance
{
  id v2 = [(SXAudioComponentView *)self player];
  [v2 pause];
}

- (void)showPlaybackControls
{
  id v2 = [(SXAudioComponentView *)self playerViewController];
  [v2 setShowsPlaybackControls:1];
}

- (void)hidePlaybackControls
{
  id v2 = [(SXAudioComponentView *)self playerViewController];
  [v2 setShowsPlaybackControls:0];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v15 = [a3 anyObject];
  [(SXAudioComponentView *)self bounds];
  CGFloat Width = CGRectGetWidth(v18);
  [(SXAudioComponentView *)self bounds];
  CGFloat v6 = CGRectGetHeight(v19) + -50.0;
  uint64_t v7 = [(SXAudioComponentView *)self overlayView];
  [v15 locationInView:v7];
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.width = Width;
  v20.size.height = v6;
  v17.x = v9;
  v17.y = v11;
  if (CGRectContainsPoint(v20, v17))
  {
    uint64_t v12 = [(SXAudioComponentView *)self playerViewController];

    if (v12)
    {
      v13 = [(SXAudioComponentView *)self playerViewController];
      int v14 = [v13 showsPlaybackControls];

      if (v14)
      {
        [(SXAudioComponentView *)self hidePlaybackControls];
        [(SXAudioComponentView *)self performSelector:sel_showPlaybackControls withObject:0 afterDelay:3.0];
      }
      else
      {
        [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_showPlaybackControls object:0];
        [(SXAudioComponentView *)self showPlaybackControls];
      }
    }
  }
}

- (unint64_t)analyticsMediaType
{
  return 3;
}

- (void)submitMediaEngageEventForUserAction:(unint64_t)a3
{
  int v5 = [(SXAudioComponentView *)self player];
  CGFloat v6 = v5;
  if (v5) {
    [v5 currentTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);

  double v8 = [(SXMediaComponentView *)self mediaEventForClass:objc_opt_class()];
  [v8 setUserAction:a3];
  CGFloat v9 = [(SXAudioComponentView *)self player];
  [v9 totalTimePlayed];
  double v11 = v10;

  if (a3 != 4)
  {
    unint64_t v12 = (unint64_t)Seconds;
    v13 = [(SXAudioComponentView *)self player];
    [v13 duration];
    double v15 = v14;

    id v16 = [(SXAudioComponentView *)self player];
    [v16 frameRate];
    double v18 = v17;

    [v8 setMediaDuration:v15];
    [v8 setMediaFrameRate:v18];
    if (a3 == 3)
    {
      [v8 setMediaResumePosition:v12];
      goto LABEL_9;
    }
    if (a3 == 2)
    {
      [v8 setMediaPausePosition:v12];
LABEL_9:
      [v8 setMediaTimePlayed:v11];
    }
  }
  [v8 determineEndDate];
  CGRect v19 = [(SXMediaComponentView *)self analyticsReporting];
  [v19 reportEvent:v8];
}

- (void)submitMediaEngageCompleteEvent
{
  BOOL v3 = [(SXAudioComponentView *)self player];
  [v3 duration];
  double v5 = v4;

  CGFloat v6 = [(SXAudioComponentView *)self player];
  [v6 frameRate];
  double v8 = v7;

  CGFloat v9 = [(SXAudioComponentView *)self player];
  [v9 totalTimePlayed];
  double v11 = v10;

  id v13 = [(SXMediaComponentView *)self mediaEventForClass:objc_opt_class()];
  [v13 setMediaDuration:v5];
  [v13 setMediaFrameRate:v8];
  [v13 setMediaTimePlayed:v11];
  [v13 determineEndDate];
  unint64_t v12 = [(SXMediaComponentView *)self analyticsReporting];
  [v12 reportEvent:v13];
}

- (BOOL)allowHierarchyRemoval
{
  v8.receiver = self;
  v8.super_class = (Class)SXAudioComponentView;
  BOOL v3 = [(SXComponentView *)&v8 allowHierarchyRemoval];
  if (v3)
  {
    double v4 = [(SXAudioComponentView *)self player];
    if ([v4 playbackStatus] == 2)
    {
    }
    else
    {
      double v5 = [(SXAudioComponentView *)self player];
      int v6 = [v5 playbackStatus];

      if (v6 != 1)
      {
        LOBYTE(v3) = 1;
        return v3;
      }
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)playerViewController:(id)a3 metricsCollectionEventOccured:(int64_t)a4
{
  if (!a4)
  {
    id v7 = [MEMORY[0x263F6C690] sharedSessionForMode:1];
    int v6 = [(SXAudioComponentView *)self player];
    [v7 addInterestForPlayer:v6 withMode:1];
  }
}

- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4
{
  BOOL v5 = [a3 appearState] != 0;
  id v6 = [(SXAudioComponentView *)self playerViewController];
  [v6 setUpdatesNowPlayingInfoCenter:v5];
}

- (SXResourceDataSource)resourceDataSource
{
  return self->_resourceDataSource;
}

- (SXHost)host
{
  return self->_host;
}

- (SXAudioComponentOverlayView)overlayView
{
  return self->_overlayView;
}

- (AVPlayerViewController)playerViewController
{
  return self->_playerViewController;
}

- (void)setPlayerViewController:(id)a3
{
}

- (SVAVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (BOOL)audioHasPlayed
{
  return self->_audioHasPlayed;
}

- (void)setAudioHasPlayed:(BOOL)a3
{
  self->_audioHasPlayed = a3;
}

- (BOOL)startPlaybackWhenReady
{
  return self->_startPlaybackWhenReady;
}

- (void)setStartPlaybackWhenReady:(BOOL)a3
{
  self->_startPlaybackWhenReady = a3;
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (void)setCancelHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_playerViewController, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_resourceDataSource, 0);
}

@end