@interface SXVideoComponentView
- (BOOL)allowHierarchyRemoval;
- (BOOL)canEnterFullscreen;
- (BOOL)isReceivingViewportDynamicBoundsChanges;
- (BOOL)usesThumbnailWithImageIdentifier:(id)a3;
- (BOOL)videoPlayerIsMoreThan50PercentVisible;
- (BOOL)videoPlayerViewControllerShouldStartPlayback:(id)a3;
- (CGRect)transitionContentFrame;
- (SVVideoPlayerViewController)videoPlayerViewController;
- (SWReachabilityProvider)reachabilityProvider;
- (SXAppStateMonitor)appStateMonitor;
- (SXBookmarkManager)bookmarkManager;
- (SXPosterFrameView)posterFrame;
- (SXResourceDataSource)resourceDataSource;
- (SXSceneStateMonitor)sceneStateMonitor;
- (SXScrollObserverManager)scrollObserverManager;
- (SXVideoAdProviderFactory)prerollAdFactory;
- (SXVideoAnalyticsRouter)analyticsRouter;
- (SXVideoComponentAnalyticsReporting)videoComponentAnalyticsReporter;
- (SXVideoComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8 sceneStateMonitor:(id)a9 resourceDataSource:(id)a10 reachabilityProvider:(id)a11 scrollObserverManager:(id)a12 videoPlayerViewControllerManager:(id)a13 bookmarkManager:(id)a14 prerollAdFactory:(id)a15;
- (SXVideoPlayerViewControllerManager)videoPlayerViewControllerManager;
- (id)presentationBlock;
- (id)thumbnailRequestCancelHandler;
- (id)videoAdForVideoPlayerViewController:(id)a3;
- (id)videoForVideoPlayerViewController:(id)a3;
- (unint64_t)analyticsMediaType;
- (unint64_t)analyticsVideoType;
- (void)discardContents;
- (void)enterFullscreen;
- (void)loadComponent:(id)a3;
- (void)loadPosterFrameImage;
- (void)pauseMediaPlayback;
- (void)pauseMediaPlaybackForDisappearance;
- (void)pausePrerollIfNeeded;
- (void)playButtonTapped;
- (void)prepareForTransitionType:(unint64_t)a3;
- (void)presentComponentWithChanges:(id)a3;
- (void)reachabilityChanged:(BOOL)a3;
- (void)registerAsMediaPlaybackDelegate;
- (void)registerForViewportDynamicBoundsChanges;
- (void)renderContents;
- (void)setAnalyticsRouter:(id)a3;
- (void)setIsReceivingViewportDynamicBoundsChanges:(BOOL)a3;
- (void)setPosterFrame:(id)a3;
- (void)setPresentationBlock:(id)a3;
- (void)setThumbnailRequestCancelHandler:(id)a3;
- (void)setVideoComponentAnalyticsReporter:(id)a3;
- (void)setVideoPlayerViewController:(id)a3;
- (void)setupVideoPlayerViewController:(id)a3;
- (void)showPosterFrame;
- (void)unloadVideoPlayerIfShowingAd;
- (void)unregisterForViewportDynamicBoundsChanges;
- (void)videoPlayerViewController:(id)a3 resumedPlaybackOfVideo:(id)a4;
- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4;
- (void)viewport:(id)a3 dynamicBoundsDidChangeFromBounds:(CGRect)a4;
- (void)viewport:(id)a3 interfaceOrientationChangedFromOrientation:(int64_t)a4;
- (void)visibilityStateDidChangeFromState:(int64_t)a3;
@end

@implementation SXVideoComponentView

- (SXVideoComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8 sceneStateMonitor:(id)a9 resourceDataSource:(id)a10 reachabilityProvider:(id)a11 scrollObserverManager:(id)a12 videoPlayerViewControllerManager:(id)a13 bookmarkManager:(id)a14 prerollAdFactory:(id)a15
{
  id v17 = a8;
  id v32 = a9;
  id v31 = a10;
  id v30 = a11;
  id v29 = a12;
  id v18 = a13;
  id v19 = a14;
  id v20 = a15;
  v33.receiver = self;
  v33.super_class = (Class)SXVideoComponentView;
  v21 = [(SXMediaComponentView *)&v33 initWithDOMObjectProvider:a3 viewport:a4 presentationDelegate:a5 componentStyleRendererFactory:a6 analyticsReporting:a7 appStateMonitor:v17];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_resourceDataSource, a10);
    objc_storeStrong((id *)&v22->_reachabilityProvider, a11);
    objc_storeStrong((id *)&v22->_appStateMonitor, a8);
    objc_storeStrong((id *)&v22->_sceneStateMonitor, a9);
    objc_storeStrong((id *)&v22->_scrollObserverManager, a12);
    objc_storeStrong((id *)&v22->_videoPlayerViewControllerManager, a13);
    objc_storeStrong((id *)&v22->_bookmarkManager, a14);
    objc_storeStrong((id *)&v22->_prerollAdFactory, a15);
  }

  return v22;
}

- (void)loadComponent:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)SXVideoComponentView;
  [(SXComponentView *)&v45 loadComponent:v4];
  v5 = [(SXVideoComponentView *)self videoPlayerViewController];
  if (!v5)
  {
    v6 = [(SXVideoComponentView *)self posterFrame];

    if (v6) {
      goto LABEL_4;
    }
    v7 = [(SXComponentView *)self DOMObjectProvider];
    v8 = [(SXComponentView *)self component];
    v9 = [v8 resourceIdentifier];
    v5 = [v7 resourceForIdentifier:v9];

    objc_initWeak(&location, self);
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__1;
    v42 = __Block_byref_object_dispose__1;
    id v43 = 0;
    v10 = [(SXVideoComponentView *)self videoPlayerViewControllerManager];
    v11 = [v5 URL];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __38__SXVideoComponentView_loadComponent___block_invoke;
    v36[3] = &unk_2646533F0;
    objc_copyWeak(&v37, &location);
    v36[4] = &v38;
    uint64_t v12 = [v10 videoPlayerViewControllerForURL:v11 receiveOwnershipBlock:v36];
    v13 = (void *)v39[5];
    v39[5] = v12;

    if ([(id)v39[5] shouldAutoplay])
    {
      objc_initWeak(&from, self);
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __38__SXVideoComponentView_loadComponent___block_invoke_2;
      v33[3] = &unk_264651108;
      objc_copyWeak(&v34, &from);
      [(SXVideoComponentView *)self setPresentationBlock:v33];
      objc_destroyWeak(&v34);
      objc_destroyWeak(&from);
    }
    v14 = [(SXVideoComponentView *)self appStateMonitor];
    uint64_t v28 = MEMORY[0x263EF8330];
    uint64_t v29 = 3221225472;
    id v30 = __38__SXVideoComponentView_loadComponent___block_invoke_3;
    id v31 = &unk_264651108;
    objc_copyWeak(&v32, &location);
    [v14 performOnApplicationDidEnterBackground:&v28];

    v15 = [(SXVideoComponentView *)self reachabilityProvider];
    [v15 addReachabilityObserver:self];

    v16 = [(SXComponentView *)self viewport];
    [v16 addViewportChangeListener:self forOptions:8];

    [(SXMediaComponentView *)self setIsDisplayingMedia:1];
    id v17 = [SXVideoComponentAnalyticsReporting alloc];
    id v18 = [(SXComponentView *)self component];
    id v19 = [(SXMediaComponentView *)self analyticsReporting];
    id v20 = [(SXVideoComponentAnalyticsReporting *)v17 initWithComponent:v18 analyticsProviding:v19];
    [(SXVideoComponentView *)self setVideoComponentAnalyticsReporter:v20];

    v21 = [(id)v39[5] analyticsRouter];

    if (v21)
    {
      v22 = [(id)v39[5] analyticsRouter];
      [(SXVideoComponentView *)self setAnalyticsRouter:v22];

      v23 = [(SXVideoComponentView *)self analyticsRouter];
      v24 = [(SXVideoComponentView *)self videoComponentAnalyticsReporter];
      [v23 setAnalyticsReporter:v24 forPlaybackLocation:2];

      v25 = [(SXVideoComponentView *)self analyticsRouter];
      [v25 setCurrentPlaybackLocation:2];
    }
    else
    {
      v26 = [SXVideoAnalyticsRouter alloc];
      v25 = [(SXVideoComponentView *)self videoComponentAnalyticsReporter];
      v27 = [(SXVideoAnalyticsRouter *)v26 initWithInitiatedPlaybackLocation:2 analyticsReporter:v25];
      [(SXVideoComponentView *)self setAnalyticsRouter:v27];
    }
    if (([(id)v39[5] expectVideoPlayerViewController] & 1) == 0) {
      [(SXVideoComponentView *)self showPosterFrame];
    }
    objc_destroyWeak(&v32);
    _Block_object_dispose(&v38, 8);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }

LABEL_4:
}

void __38__SXVideoComponentView_loadComponent___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (v14) {
    [WeakRetained setupVideoPlayerViewController:v14];
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) shouldAutoplay]) {
    [v14 playWithButtonTapped:0];
  }
  v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) visibilityMonitor];

  if (v5)
  {
    v6 = [SXComponentVisiblePercentageProvider alloc];
    v7 = [v4 viewport];
    v8 = [(SXComponentVisiblePercentageProvider *)v6 initWithViewport:v7];

    v9 = [SXVideoComponentVisibilityMonitor alloc];
    id v10 = objc_loadWeakRetained((id *)(a1 + 40));
    v11 = [(SXVisibilityMonitor *)v9 initWithObject:v10 visiblePercentageProvider:v8];

    [(SXVisibilityMonitor *)v11 updateVisibility];
    uint64_t v12 = [v4 scrollObserverManager];
    [v12 addScrollObserver:v11];

    v13 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) visibilityMonitor];
    [v13 setVisibilityMonitor:v11];
  }
}

void __38__SXVideoComponentView_loadComponent___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (([WeakRetained transitionViewIsVisible] & 1) == 0)
  {
    v1 = [WeakRetained bookmarkManager];
    v2 = [SXComponentBookmark alloc];
    v3 = [WeakRetained component];
    id v4 = [v3 identifier];
    v5 = [(SXComponentBookmark *)v2 initWithComponentIdentifier:v4];
    [v1 applyBookmark:v5];
  }
}

void __38__SXVideoComponentView_loadComponent___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained videoPlayerViewController];
  [v1 pause];

  [WeakRetained unloadVideoPlayerIfShowingAd];
}

- (void)presentComponentWithChanges:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SXVideoComponentView;
  [(SXComponentView *)&v11 presentComponentWithChanges:*(void *)&a3.var0 & 0xFFFFFFLL];
  id v4 = [(SXVideoComponentView *)self posterFrame];
  v5 = [(SXComponentView *)self contentView];
  [v5 bounds];
  objc_msgSend(v4, "setFrame:");

  v6 = [(SXVideoComponentView *)self videoPlayerViewController];
  v7 = [v6 view];
  v8 = [(SXComponentView *)self contentView];
  [v8 bounds];
  objc_msgSend(v7, "setFrame:");

  v9 = [(SXVideoComponentView *)self presentationBlock];

  if (v9)
  {
    id v10 = [(SXVideoComponentView *)self presentationBlock];
    v10[2]();

    [(SXVideoComponentView *)self setPresentationBlock:0];
  }
}

- (void)renderContents
{
  v3.receiver = self;
  v3.super_class = (Class)SXVideoComponentView;
  [(SXComponentView *)&v3 renderContents];
  [(SXVideoComponentView *)self loadPosterFrameImage];
}

- (void)discardContents
{
  v12.receiver = self;
  v12.super_class = (Class)SXVideoComponentView;
  [(SXComponentView *)&v12 discardContents];
  objc_super v3 = [(SXVideoComponentView *)self thumbnailRequestCancelHandler];

  if (v3)
  {
    id v4 = [(SXVideoComponentView *)self thumbnailRequestCancelHandler];
    v4[2]();

    [(SXVideoComponentView *)self setThumbnailRequestCancelHandler:0];
  }
  v5 = [(SXVideoComponentView *)self posterFrame];
  [v5 setImage:0];

  v6 = [(SXVideoComponentView *)self videoPlayerViewController];
  char v7 = [v6 isPlaying];

  if ((v7 & 1) == 0)
  {
    v8 = [(SXVideoComponentView *)self videoPlayerViewController];
    [v8 willMoveToParentViewController:0];

    v9 = [(SXVideoComponentView *)self videoPlayerViewController];
    id v10 = [v9 view];
    [v10 removeFromSuperview];

    objc_super v11 = [(SXVideoComponentView *)self videoPlayerViewController];
    [v11 removeFromParentViewController];

    [(SXVideoComponentView *)self setVideoPlayerViewController:0];
    [(SXVideoComponentView *)self showPosterFrame];
  }
}

- (void)showPosterFrame
{
  objc_super v3 = [(SXVideoComponentView *)self posterFrame];

  if (!v3)
  {
    id v4 = [SXPosterFrameView alloc];
    v5 = [(SXComponentView *)self contentView];
    [v5 bounds];
    v6 = -[SXPosterFrameView initWithFrame:](v4, "initWithFrame:");
    [(SXVideoComponentView *)self setPosterFrame:v6];

    char v7 = [(SXVideoComponentView *)self posterFrame];
    v8 = [v7 playButton];
    [v8 addTarget:self action:sel_playButtonTapped forControlEvents:64];

    uint64_t v9 = [(SWReachabilityProvider *)self->_reachabilityProvider isNetworkReachable];
    id v10 = [(SXVideoComponentView *)self posterFrame];
    objc_super v11 = [v10 playButton];
    [v11 setEnabled:v9];
  }
  id v13 = [(SXComponentView *)self contentView];
  objc_super v12 = [(SXVideoComponentView *)self posterFrame];
  [v13 addSubview:v12];
}

- (void)loadPosterFrameImage
{
  objc_super v3 = [(SXComponentView *)self DOMObjectProvider];
  id v4 = [(SXComponentView *)self component];
  v5 = [v4 stillImageIdentifier];
  v6 = [v3 imageResourceForIdentifier:v5];

  char v7 = [(SXVideoComponentView *)self posterFrame];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;

  [v6 dimensions];
  double v14 = v9 / v12;
  double v15 = v11 / v13;
  if (v11 / v13 >= v9 / v12)
  {
    if (v14 < v15) {
      double v11 = v13 * v14;
    }
  }
  else
  {
    double v9 = v12 * v15;
  }
  objc_initWeak(&location, self);
  v16 = [SXImageRequest alloc];
  id v17 = [(SXComponentView *)self component];
  id v18 = [v17 stillImageIdentifier];
  id v19 = [v6 URL];
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  v25 = __44__SXVideoComponentView_loadPosterFrameImage__block_invoke;
  v26 = &unk_264651468;
  objc_copyWeak(&v27, &location);
  id v20 = -[SXImageRequest initWithImageIdentifier:imageQualities:url:size:preserveColorspace:loadingBlock:](v16, "initWithImageIdentifier:imageQualities:url:size:preserveColorspace:loadingBlock:", v18, 4, v19, 1, &v23, v9, v11);

  v21 = [(SXVideoComponentView *)self resourceDataSource];
  v22 = [v21 loadImagesForImageRequest:v20 completionBlock:0];
  [(SXVideoComponentView *)self setThumbnailRequestCancelHandler:v22];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __44__SXVideoComponentView_loadPosterFrameImage__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  BOOL v4 = [WeakRetained visibilityState] == 1 && objc_msgSend(WeakRetained, "presentationState") == 2;
  v5 = [WeakRetained posterFrame];
  v6 = [v3 image];

  [v5 setImage:v6 animated:v4];
  [WeakRetained setThumbnailRequestCancelHandler:0];
}

- (void)playButtonTapped
{
  id v5 = objc_alloc_init(MEMORY[0x263F6C6B8]);
  [(SXVideoComponentView *)self setupVideoPlayerViewController:v5];
  id v3 = [(SXVideoComponentView *)self videoPlayerViewController];
  [v3 playWithButtonTapped:1];

  BOOL v4 = [(SXVideoComponentView *)self posterFrame];
  [v4 removeFromSuperview];
}

- (void)unloadVideoPlayerIfShowingAd
{
  id v3 = [(SXVideoComponentView *)self videoPlayerViewController];
  if (v3)
  {
    id v13 = v3;
    BOOL v4 = [v3 mode] == 1;
    id v3 = v13;
    if (v4)
    {
      id v5 = [v13 presentedViewController];

      id v3 = v13;
      if (!v5)
      {
        [v13 willUnload];
        [v13 willMoveToParentViewController:0];
        v6 = [v13 view];
        [v6 removeFromSuperview];

        [v13 removeFromParentViewController];
        [(SXVideoComponentView *)self setVideoPlayerViewController:0];
        char v7 = [(SXVideoComponentView *)self posterFrame];
        if (!v7)
        {
          char v7 = objc_alloc_init(SXPosterFrameView);
          [(SXVideoComponentView *)self setPosterFrame:v7];
        }
        double v8 = [(SXComponentView *)self contentView];
        [v8 addSubview:v7];

        double v9 = [(SXVideoComponentView *)self posterFrame];
        double v10 = [(SXComponentView *)self contentView];
        [v10 bounds];
        objc_msgSend(v9, "setFrame:");

        double v11 = [(SXPosterFrameView *)v7 playButton];
        [v11 addTarget:self action:sel_playButtonTapped forControlEvents:64];

        double v12 = [(SXPosterFrameView *)v7 image];

        if (!v12) {
          [(SXVideoComponentView *)self loadPosterFrameImage];
        }

        id v3 = v13;
      }
    }
  }
}

- (void)setupVideoPlayerViewController:(id)a3
{
  [(SXVideoComponentView *)self setVideoPlayerViewController:a3];
  BOOL v4 = [(SXVideoComponentView *)self videoPlayerViewController];
  [v4 setDelegate:self];

  id v5 = [(SXVideoComponentView *)self videoPlayerViewController];
  [v5 setDataSource:self];

  v6 = [(SXVideoComponentView *)self videoPlayerViewController];
  [v6 setFullscreenBehavior:0];

  [(SXVideoComponentView *)self registerAsMediaPlaybackDelegate];
  char v7 = [(SXComponentView *)self presentationDelegate];
  id v16 = [v7 presentingContentViewController];

  double v8 = [(SXVideoComponentView *)self videoPlayerViewController];
  [v16 addChildViewController:v8];

  double v9 = [(SXComponentView *)self contentView];
  double v10 = [(SXVideoComponentView *)self videoPlayerViewController];
  double v11 = [v10 view];
  [v9 addSubview:v11];

  double v12 = [(SXVideoComponentView *)self videoPlayerViewController];
  id v13 = [v12 view];
  double v14 = [(SXComponentView *)self contentView];
  [v14 bounds];
  objc_msgSend(v13, "setFrame:");

  double v15 = [(SXVideoComponentView *)self videoPlayerViewController];
  [v15 didMoveToParentViewController:v16];
}

- (id)videoForVideoPlayerViewController:(id)a3
{
  BOOL v4 = [(SXComponentView *)self DOMObjectProvider];
  id v5 = [(SXComponentView *)self component];
  v6 = [v5 resourceIdentifier];
  char v7 = [v4 resourceForIdentifier:v6];

  double v8 = [SXVideoProvider alloc];
  double v9 = [v7 URL];
  double v10 = [(SXVideoProvider *)v8 initWithURL:v9];

  double v11 = [(SXVideoComponentView *)self analyticsRouter];
  [(SXVideoProvider *)v10 setAnalyticsReporter:v11];

  return v10;
}

- (id)videoAdForVideoPlayerViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(SXComponentView *)self component];
  int v6 = [v5 allowsPrerollAds];

  if (v6)
  {
    char v7 = [(SXVideoComponentView *)self prerollAdFactory];
    double v8 = [(SXVideoComponentView *)self analyticsRouter];
    double v9 = [v7 createVideoAdProviderForComponentView:self videoPlayerViewController:v4 analyticsReporter:v8];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (void)videoPlayerViewController:(id)a3 resumedPlaybackOfVideo:(id)a4
{
  [(SXVideoComponentView *)self registerAsMediaPlaybackDelegate];
  [(SXVideoComponentView *)self pausePrerollIfNeeded];
}

- (BOOL)videoPlayerViewControllerShouldStartPlayback:(id)a3
{
  id v4 = a3;
  BOOL v5 = ![v4 mode]
    && ([(SXComponentView *)self visibilityState] == 1
     || ([(SXVideoComponentView *)self videoPlayerViewController],
         int v6 = objc_claimAutoreleasedReturnValue(),
         char v7 = [v6 isFullscreenInProgress],
         v6,
         (v7 & 1) != 0))
    || [v4 mode] == 1
    && [(SXVideoComponentView *)self videoPlayerIsMoreThan50PercentVisible];

  return v5;
}

- (void)registerAsMediaPlaybackDelegate
{
  id v4 = [(SXComponentView *)self presentationDelegate];
  id v3 = [v4 mediaPlaybackController];
  -[SXMediaPlaybackController registerMediaPlayBack:]((uint64_t)v3, self);
}

- (void)pauseMediaPlayback
{
  id v2 = [(SXVideoComponentView *)self videoPlayerViewController];
  [v2 pause];
}

- (void)pauseMediaPlaybackForDisappearance
{
  id v3 = [(SXVideoComponentView *)self videoPlayerViewController];
  char v4 = [v3 isFullscreenInProgress];

  if ((v4 & 1) == 0)
  {
    id v5 = [(SXVideoComponentView *)self videoPlayerViewController];
    [v5 pause];
  }
}

- (void)registerForViewportDynamicBoundsChanges
{
  if (![(SXVideoComponentView *)self isReceivingViewportDynamicBoundsChanges])
  {
    id v3 = [(SXComponentView *)self viewport];
    [v3 addViewportChangeListener:self forOptions:2];
  }
  [(SXVideoComponentView *)self setIsReceivingViewportDynamicBoundsChanges:1];
}

- (void)unregisterForViewportDynamicBoundsChanges
{
  if ([(SXVideoComponentView *)self isReceivingViewportDynamicBoundsChanges])
  {
    id v3 = [(SXComponentView *)self viewport];
    [v3 removeViewportChangeListener:self forOptions:2];
  }
  [(SXVideoComponentView *)self setIsReceivingViewportDynamicBoundsChanges:0];
}

- (void)viewport:(id)a3 dynamicBoundsDidChangeFromBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  if (objc_msgSend((id)-[SXVideoComponentView superclass](self, "superclass"), "instancesRespondToSelector:", sel_viewport_dynamicBoundsDidChangeFromBounds_))
  {
    v10.receiver = self;
    v10.super_class = (Class)SXVideoComponentView;
    -[SXMediaComponentView viewport:dynamicBoundsDidChangeFromBounds:](&v10, sel_viewport_dynamicBoundsDidChangeFromBounds_, v9, x, y, width, height);
  }
  [(SXVideoComponentView *)self pausePrerollIfNeeded];
}

- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4
{
  if (![a3 appearState])
  {
    id v5 = [(SXVideoComponentView *)self videoPlayerViewController];
    char v6 = [v5 isFullscreenInProgress];

    if ((v6 & 1) == 0)
    {
      char v7 = [(SXVideoComponentView *)self videoPlayerViewController];
      [v7 pause];

      [(SXVideoComponentView *)self unloadVideoPlayerIfShowingAd];
    }
  }
}

- (void)viewport:(id)a3 interfaceOrientationChangedFromOrientation:(int64_t)a4
{
  id v5 = a3;
  char v6 = [(SXComponentView *)self presentationDelegate];
  id v8 = [v6 fullscreenVideoPlaybackManager];

  uint64_t v7 = [v5 interfaceOrientation];
  if ((unint64_t)(v7 - 3) > 1) {
    -[SXFullscreenVideoPlaybackManager removeCandidate:]((uint64_t)v8, (uint64_t)self);
  }
  else {
    -[SXFullscreenVideoPlaybackManager addCandidate:]((uint64_t)v8, (uint64_t)self);
  }
}

- (BOOL)videoPlayerIsMoreThan50PercentVisible
{
  id v3 = [(SXVideoComponentView *)self videoPlayerViewController];
  char v4 = [v3 isFullscreenInProgress];

  if (v4) {
    return 1;
  }
  if ([(SXComponentView *)self visibilityState] != 1) {
    return 0;
  }
  char v6 = [(SXComponentView *)self viewport];
  [v6 dynamicBounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [(SXComponentView *)self absoluteFrame];
  v24.origin.double x = v15;
  v24.origin.double y = v16;
  v24.size.double width = v17;
  v24.size.double height = v18;
  v21.origin.double x = v8;
  v21.origin.double y = v10;
  v21.size.double width = v12;
  v21.size.double height = v14;
  CGRect v22 = CGRectIntersection(v21, v24);
  double Height = CGRectGetHeight(v22);
  [(SXVideoComponentView *)self bounds];
  BOOL v5 = Height > CGRectGetHeight(v23) * 0.5;

  return v5;
}

- (void)pausePrerollIfNeeded
{
  id v4 = [(SXVideoComponentView *)self videoPlayerViewController];
  if ([v4 mode] == 1)
  {
    BOOL v3 = [(SXVideoComponentView *)self videoPlayerIsMoreThan50PercentVisible];

    if (v3) {
      return;
    }
    id v4 = [(SXVideoComponentView *)self videoPlayerViewController];
    [v4 pause];
  }
}

- (void)visibilityStateDidChangeFromState:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SXVideoComponentView;
  -[SXMediaComponentView visibilityStateDidChangeFromState:](&v7, sel_visibilityStateDidChangeFromState_);
  if ([(SXComponentView *)self visibilityState] == 1)
  {
    BOOL v5 = [(SXComponentView *)self viewport];
    [v5 addViewportChangeListener:self forOptions:64];
LABEL_6:

    return;
  }
  int64_t v6 = [(SXComponentView *)self visibilityState];
  if (a3 == 1 && v6 == 2)
  {
    BOOL v5 = [(SXComponentView *)self viewport];
    [v5 removeViewportChangeListener:self forOptions:64];
    goto LABEL_6;
  }
}

- (BOOL)canEnterFullscreen
{
  BOOL v3 = [(SXComponentView *)self viewport];
  [v3 dynamicBounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(SXComponentView *)self absoluteFrame];
  v37.origin.CGFloat x = v12;
  v37.origin.CGFloat y = v13;
  v37.size.CGFloat width = v14;
  v37.size.CGFloat height = v15;
  v33.origin.CGFloat x = v5;
  v33.origin.CGFloat y = v7;
  v33.size.CGFloat width = v9;
  v33.size.CGFloat height = v11;
  CGRect v34 = CGRectIntersection(v33, v37);
  CGFloat x = v34.origin.x;
  CGFloat y = v34.origin.y;
  CGFloat width = v34.size.width;
  CGFloat height = v34.size.height;
  id v20 = [(SXVideoComponentView *)self videoPlayerViewController];
  char v21 = [v20 isPlaying];

  uint64_t v22 = [v3 interfaceOrientation];
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  double v23 = CGRectGetHeight(v35);
  [(SXComponentView *)self absoluteFrame];
  double v24 = CGRectGetHeight(v36);
  v25 = [MEMORY[0x263F1C5C0] currentDevice];
  if (objc_opt_respondsToSelector())
  {
    v26 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v27 = [v26 userInterfaceIdiom];

    BOOL v28 = v27 == 0;
  }
  else
  {
    BOOL v28 = 1;
  }
  double v29 = v24 * 0.1;

  if ((unint64_t)(v22 - 3) < 2) {
    char v30 = v21;
  }
  else {
    char v30 = 0;
  }
  if (v23 <= v29) {
    char v30 = 0;
  }
  BOOL v31 = v30 & v28;

  return v31;
}

- (void)enterFullscreen
{
  id v2 = [(SXVideoComponentView *)self videoPlayerViewController];
  [v2 enterFullscreenWithCompletionBlock:0];
}

- (CGRect)transitionContentFrame
{
  BOOL v3 = [(SXComponentView *)self DOMObjectProvider];
  double v4 = [(SXComponentView *)self component];
  CGFloat v5 = [v4 stillImageIdentifier];
  double v6 = [v3 imageResourceForIdentifier:v5];

  [(SXComponentView *)self contentFrame];
  objc_msgSend(v6, "sizeThatFills:", v7, v8);
  double v10 = v9;
  double v12 = v11;
  [(SXComponentView *)self contentFrame];
  double v13 = 0.0;
  double v14 = 0.0;
  if (v12 > v15)
  {
    [(SXComponentView *)self contentFrame];
    double v14 = (v12 - v16) * -0.5;
  }
  [(SXComponentView *)self contentFrame];
  if (v10 > v17)
  {
    [(SXComponentView *)self contentFrame];
    double v13 = (v10 - v18) * -0.5;
  }

  double v19 = v13;
  double v20 = v14;
  double v21 = v10;
  double v22 = v12;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (BOOL)usesThumbnailWithImageIdentifier:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(SXComponentView *)self component];
  double v6 = [v5 stillImageIdentifier];
  char v7 = [v4 isEqualToString:v6];

  return v7;
}

- (void)prepareForTransitionType:(unint64_t)a3
{
  if (a3 == 2)
  {
    CGFloat v5 = [(SXVideoComponentView *)self videoPlayerViewController];
    [v5 willMoveToParentViewController:0];

    id v6 = [(SXVideoComponentView *)self videoPlayerViewController];
    [v6 removeFromParentViewController];
  }
}

- (unint64_t)analyticsMediaType
{
  return 2;
}

- (unint64_t)analyticsVideoType
{
  return 1;
}

- (void)reachabilityChanged:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 && [(SXComponentView *)self hasRenderedContents])
  {
    CGFloat v5 = [(SXVideoComponentView *)self posterFrame];
    id v6 = [v5 image];
    if (v6)
    {
    }
    else
    {
      char v7 = [(SXVideoComponentView *)self thumbnailRequestCancelHandler];

      if (!v7) {
        [(SXVideoComponentView *)self loadPosterFrameImage];
      }
    }
  }
  id v9 = [(SXVideoComponentView *)self posterFrame];
  double v8 = [v9 playButton];
  [v8 setEnabled:v3];
}

- (BOOL)allowHierarchyRemoval
{
  v6.receiver = self;
  v6.super_class = (Class)SXVideoComponentView;
  BOOL v3 = [(SXComponentView *)&v6 allowHierarchyRemoval];
  id v4 = [(SXVideoComponentView *)self videoPlayerViewController];

  return !v4 && v3;
}

- (SVVideoPlayerViewController)videoPlayerViewController
{
  return self->_videoPlayerViewController;
}

- (void)setVideoPlayerViewController:(id)a3
{
}

- (SXResourceDataSource)resourceDataSource
{
  return self->_resourceDataSource;
}

- (SWReachabilityProvider)reachabilityProvider
{
  return self->_reachabilityProvider;
}

- (SXAppStateMonitor)appStateMonitor
{
  return self->_appStateMonitor;
}

- (SXSceneStateMonitor)sceneStateMonitor
{
  return self->_sceneStateMonitor;
}

- (BOOL)isReceivingViewportDynamicBoundsChanges
{
  return self->_isReceivingViewportDynamicBoundsChanges;
}

- (void)setIsReceivingViewportDynamicBoundsChanges:(BOOL)a3
{
  self->_isReceivingViewportDynamicBoundsChanges = a3;
}

- (SXPosterFrameView)posterFrame
{
  return self->_posterFrame;
}

- (void)setPosterFrame:(id)a3
{
}

- (id)thumbnailRequestCancelHandler
{
  return self->_thumbnailRequestCancelHandler;
}

- (void)setThumbnailRequestCancelHandler:(id)a3
{
}

- (SXVideoAnalyticsRouter)analyticsRouter
{
  return self->_analyticsRouter;
}

- (void)setAnalyticsRouter:(id)a3
{
}

- (SXVideoComponentAnalyticsReporting)videoComponentAnalyticsReporter
{
  return self->_videoComponentAnalyticsReporter;
}

- (void)setVideoComponentAnalyticsReporter:(id)a3
{
}

- (SXScrollObserverManager)scrollObserverManager
{
  return self->_scrollObserverManager;
}

- (SXVideoPlayerViewControllerManager)videoPlayerViewControllerManager
{
  return self->_videoPlayerViewControllerManager;
}

- (SXBookmarkManager)bookmarkManager
{
  return self->_bookmarkManager;
}

- (id)presentationBlock
{
  return self->_presentationBlock;
}

- (void)setPresentationBlock:(id)a3
{
}

- (SXVideoAdProviderFactory)prerollAdFactory
{
  return self->_prerollAdFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prerollAdFactory, 0);
  objc_storeStrong(&self->_presentationBlock, 0);
  objc_storeStrong((id *)&self->_bookmarkManager, 0);
  objc_storeStrong((id *)&self->_videoPlayerViewControllerManager, 0);
  objc_storeStrong((id *)&self->_scrollObserverManager, 0);
  objc_storeStrong((id *)&self->_videoComponentAnalyticsReporter, 0);
  objc_storeStrong((id *)&self->_analyticsRouter, 0);
  objc_storeStrong(&self->_thumbnailRequestCancelHandler, 0);
  objc_storeStrong((id *)&self->_posterFrame, 0);
  objc_storeStrong((id *)&self->_sceneStateMonitor, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_reachabilityProvider, 0);
  objc_storeStrong((id *)&self->_resourceDataSource, 0);
  objc_storeStrong((id *)&self->_videoPlayerViewController, 0);
}

@end