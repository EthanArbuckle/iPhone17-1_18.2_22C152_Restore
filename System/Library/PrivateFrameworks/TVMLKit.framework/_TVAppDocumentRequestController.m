@interface _TVAppDocumentRequestController
- (BOOL)automaticallyProvidesMediaController;
- (BOOL)handleEvent:(id)a3 targetResponder:(id)a4 viewElement:(id)a5 extraInfo:(id *)a6;
- (BOOL)isPlaying;
- (BOOL)isUIHidden;
- (BOOL)tv_handleEventForDocument:(id)a3 eventName:(id)a4 targetResponder:(id)a5 viewElement:(id)a6 extraInfo:(id *)a7;
- (IKDocumentServiceRequest)documentServiceRequest;
- (IKUpdateServiceRequest)updateServiceRequest;
- (TVMediaController)mediaController;
- (TVMediaInfo)selectedMediaInfo;
- (TVMediaPlaybackManager)mediaPlaybackManager;
- (TVMediaProviding)mediaProvider;
- (TVObservableEventController)observableEventController;
- (TVShowcasing)showcasingController;
- (TVTemplateFeaturesManager)featuresManager;
- (UIImage)coverImage;
- (_TVAppDocumentRequestController)initWithAppDocument:(id)a3;
- (_TVAppDocumentRequestController)initWithDocumentServiceRequest:(id)a3;
- (_TVAppDocumentRequestController)initWithDocumentServiceRequest:(id)a3 loadImmediately:(BOOL)a4;
- (_TVSwipeUpMessageView)swipeUpMessageView;
- (double)showcaseFactor;
- (double)showcaseInset;
- (id)_hostingFocusEnvironment;
- (id)customAnimatorForNavigationControllerOperation:(int64_t)a3 fromViewController:(id)a4;
- (id)customAnimatorForNavigationControllerOperation:(int64_t)a3 toViewController:(id)a4;
- (id)interactionPreviewControllerForViewController:(id)a3 presentingView:(id)a4 presentingElement:(id)a5;
- (id)preferredFocusEnvironments;
- (id)relinquishOwnership;
- (void)_hostMediaControllerIfPossible;
- (void)_updateMediaInfo;
- (void)_updateShowcaseFactor;
- (void)addObserver:(id)a3 forEvent:(id)a4;
- (void)adoptMediaController:(id)a3;
- (void)coverImageDidChangeForMediaController:(id)a3;
- (void)dealloc;
- (void)didChangeDocumentContext;
- (void)documentDidChangeForDocumentServiceRequest:(id)a3;
- (void)evaluateSwipeUpMessageForMediaPlaybackManager:(id)a3;
- (void)featuresManager:(id)a3 currentContextDidChangeForFeature:(id)a4;
- (void)handleEvent:(id)a3 sender:(id)a4 withUserInfo:(id)a5;
- (void)mediaPlaybackManager:(id)a3 shouldHideUI:(BOOL)a4 animated:(BOOL)a5 animations:(id)a6 completion:(id)a7;
- (void)removeObserver:(id)a3;
- (void)removeObserver:(id)a3 forEvent:(id)a4;
- (void)sendInitialRequestIfNeeded;
- (void)serviceRequest:(id)a3 didCompleteWithStatus:(int64_t)a4 errorDictionary:(id)a5;
- (void)setAppDelegate:(id)a3;
- (void)setMediaController:(id)a3;
- (void)setMediaPlaybackManager:(id)a3;
- (void)setMediaProvider:(id)a3;
- (void)setObservableEventController:(id)a3;
- (void)setShowcaseInset:(double)a3;
- (void)setShowcasingController:(id)a3;
- (void)setSwipeUpMessageView:(id)a3;
- (void)setUpdateServiceRequest:(id)a3;
- (void)stateDidChangeForMediaController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willHostTemplateViewController:(id)a3 usesTransitions:(BOOL *)a4;
@end

@implementation _TVAppDocumentRequestController

- (_TVAppDocumentRequestController)initWithAppDocument:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_TVAppDocumentRequestController;
  v3 = [(_TVAppDocumentController *)&v9 initWithAppDocument:a3];
  if (v3)
  {
    v4 = objc_alloc_init(TVObservableEventController);
    observableEventController = v3->_observableEventController;
    v3->_observableEventController = v4;

    v6 = objc_alloc_init(TVTemplateFeaturesManager);
    featuresManager = v3->_featuresManager;
    v3->_featuresManager = v6;

    [(TVTemplateFeaturesManager *)v3->_featuresManager setDelegate:v3];
    [(TVTemplateFeaturesManager *)v3->_featuresManager pushContext:v3 forFeature:&unk_26E5F4098];
    v3->_showcaseFactor = NAN;
  }
  return v3;
}

- (_TVAppDocumentRequestController)initWithDocumentServiceRequest:(id)a3
{
  return [(_TVAppDocumentRequestController *)self initWithDocumentServiceRequest:a3 loadImmediately:1];
}

- (_TVAppDocumentRequestController)initWithDocumentServiceRequest:(id)a3 loadImmediately:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v8 = [v7 appDocument];
  objc_super v9 = [(_TVAppDocumentRequestController *)self initWithAppDocument:v8];

  if (v9)
  {
    objc_storeStrong((id *)&v9->_documentServiceRequest, a3);
    [(IKDocumentServiceRequest *)v9->_documentServiceRequest setDelegate:v9];
    if (v4)
    {
      v9->_flags.initialRequestSent = 1;
      [(IKDocumentServiceRequest *)v9->_documentServiceRequest send];
    }
  }

  return v9;
}

- (void)dealloc
{
  v3 = [(_TVAppDocumentRequestController *)self documentServiceRequest];
  [v3 setDelegate:0];

  BOOL v4 = [(_TVAppDocumentRequestController *)self documentServiceRequest];
  [v4 cancel];

  [(TVTemplateFeaturesManager *)self->_featuresManager popContext:self forFeature:&unk_26E5F4098];
  [(_TVAppDocumentRequestController *)self setShowcasingController:0];
  [(_TVAppDocumentRequestController *)self setMediaProvider:0];
  v5.receiver = self;
  v5.super_class = (Class)_TVAppDocumentRequestController;
  [(_TVAppDocumentController *)&v5 dealloc];
}

- (void)setAppDelegate:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_TVAppDocumentRequestController;
  [(_TVAppDocumentController *)&v6 setAppDelegate:v4];
  if ([v4 conformsToProtocol:&unk_26E602158])
  {
    self->_adrcDelegateFlags.hasSelectedMediaInfoDidChange = objc_opt_respondsToSelector() & 1;
    self->_adrcDelegateFlags.hasDidHideUI = objc_opt_respondsToSelector() & 1;
    self->_adrcDelegateFlags.hasShowcaseFactorDidChange = objc_opt_respondsToSelector() & 1;
    char v5 = objc_opt_respondsToSelector();
  }
  else
  {
    char v5 = 0;
    *(_WORD *)&self->_adrcDelegateFlags.hasSelectedMediaInfoDidChange = 0;
    self->_adrcDelegateFlags.hasShowcaseFactorDidChange = 0;
  }
  self->_adrcDelegateFlags.hasDidCompleteDocumentCreation = v5 & 1;
}

- (void)setMediaController:(id)a3
{
  p_mediaController = &self->_mediaController;
  v18 = (TVMediaController *)a3;
  if (*p_mediaController != v18)
  {
    if ([(_TVAppDocumentRequestController *)self isViewLoaded])
    {
      objc_super v6 = [(_TVAppDocumentRequestController *)self mediaPlaybackManager];

      if (v6)
      {
        id v7 = [(TVMediaController *)*p_mediaController view];
        v8 = [(_TVAppDocumentRequestController *)self mediaPlaybackManager];
        objc_super v9 = [v8 menuGestureRecognizer];
        [v7 removeGestureRecognizer:v9];

        v10 = [(_TVAppDocumentRequestController *)self view];
        v11 = [(_TVAppDocumentRequestController *)self mediaPlaybackManager];
        v12 = [v11 swipeUpGestureRecognizer];
        [v10 removeGestureRecognizer:v12];
      }
    }
    [(_TVAppDocumentRequestController *)self setMediaPlaybackManager:0];
    objc_storeStrong((id *)&self->_mediaController, a3);
    if (*p_mediaController)
    {
      [(TVMediaController *)*p_mediaController setDelegate:self];
      v13 = [[TVMediaPlaybackManager alloc] initWithMediaController:*p_mediaController];
      [(_TVAppDocumentRequestController *)self setMediaPlaybackManager:v13];

      [(TVMediaPlaybackManager *)self->_mediaPlaybackManager setDelegate:self];
      if ([(_TVAppDocumentRequestController *)self isViewLoaded])
      {
        v14 = [(TVMediaController *)*p_mediaController view];
        v15 = [(TVMediaPlaybackManager *)self->_mediaPlaybackManager menuGestureRecognizer];
        [v14 addGestureRecognizer:v15];

        v16 = [(_TVAppDocumentRequestController *)self view];
        v17 = [(TVMediaPlaybackManager *)self->_mediaPlaybackManager swipeUpGestureRecognizer];
        [v16 addGestureRecognizer:v17];
      }
    }
  }
}

- (BOOL)isUIHidden
{
  return self->_flags.shouldHideUI;
}

- (void)setShowcasingController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_showcasingController);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_showcasingController);
    [v5 removeObserver:self forEvent:@"TVShowcaseFactorDidChangeEvent"];

    id v6 = objc_storeWeak((id *)&self->_showcasingController, obj);
    [(_TVAppDocumentRequestController *)self showcaseInset];
    objc_msgSend(obj, "setShowcaseInset:");

    id v7 = objc_loadWeakRetained((id *)&self->_showcasingController);
    [v7 addObserver:self forEvent:@"TVShowcaseFactorDidChangeEvent"];

    [(_TVAppDocumentRequestController *)self _updateShowcaseFactor];
  }
}

- (void)setMediaProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaProvider);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_mediaProvider);
    [v5 removeObserver:self forEvent:@"TVSelectedMediaInfoDidChangeEvent"];

    id v6 = objc_storeWeak((id *)&self->_mediaProvider, obj);
    [obj addObserver:self forEvent:@"TVSelectedMediaInfoDidChangeEvent"];

    [(_TVAppDocumentRequestController *)self _updateMediaInfo];
  }
}

- (void)sendInitialRequestIfNeeded
{
  if (!self->_flags.initialRequestSent)
  {
    self->_flags.initialRequestSent = 1;
    id v2 = [(_TVAppDocumentRequestController *)self documentServiceRequest];
    [v2 send];
  }
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)_TVAppDocumentRequestController;
  [(_TVAppDocumentController *)&v11 viewDidLoad];
  v3 = [(_TVAppDocumentRequestController *)self mediaPlaybackManager];

  if (v3)
  {
    id v4 = [(_TVAppDocumentRequestController *)self mediaController];
    id v5 = [v4 view];
    id v6 = [(_TVAppDocumentRequestController *)self mediaPlaybackManager];
    id v7 = [v6 menuGestureRecognizer];
    [v5 addGestureRecognizer:v7];

    v8 = [(_TVAppDocumentRequestController *)self view];
    objc_super v9 = [(_TVAppDocumentRequestController *)self mediaPlaybackManager];
    v10 = [v9 swipeUpGestureRecognizer];
    [v8 addGestureRecognizer:v10];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)_TVAppDocumentRequestController;
  [(_TVAppDocumentController *)&v16 viewWillAppear:a3];
  if (!self->_flags.initialRequestSent)
  {
    self->_flags.initialRequestSent = 1;
    id v4 = [(_TVAppDocumentRequestController *)self documentServiceRequest];
    [v4 send];
  }
  uint64_t v5 = [(_TVAppDocumentRequestController *)self mediaPlaybackManager];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(_TVAppDocumentController *)self templateViewController];
    int v8 = [v7 isViewLoaded];

    if (v8)
    {
      objc_super v9 = [(_TVAppDocumentRequestController *)self mediaPlaybackManager];
      if ([v9 shouldHideUI])
      {
        self->_flags.shouldHideUI = 1;
        p_shouldHideUI = &self->_flags.shouldHideUI;
      }
      else
      {
        objc_super v11 = [(_TVAppDocumentRequestController *)self mediaPlaybackManager];
        self->_flags.shouldHideUI = [v11 currentUIMode] == 1;
        p_shouldHideUI = &self->_flags.shouldHideUI;
      }
      v12 = [(_TVAppDocumentController *)self templateViewController];
      v13 = [v12 view];
      v14 = v13;
      double v15 = 0.0;
      if (!*p_shouldHideUI) {
        double v15 = 1.0;
      }
      [v13 setAlpha:v15];
    }
  }
  [(_TVAppDocumentRequestController *)self _hostMediaControllerIfPossible];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_TVAppDocumentRequestController;
  [(_TVAppDocumentController *)&v5 viewDidAppear:a3];
  id v4 = [(_TVAppDocumentRequestController *)self mediaPlaybackManager];
  [v4 onAppear];

  [(_TVAppDocumentRequestController *)self _hostMediaControllerIfPossible];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_TVAppDocumentRequestController;
  [(_TVAppDocumentController *)&v5 viewWillDisappear:a3];
  id v4 = [(_TVAppDocumentRequestController *)self mediaPlaybackManager];
  [v4 onDisappear];
}

- (void)viewDidLayoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)_TVAppDocumentRequestController;
  [(_TVAppDocumentController *)&v18 viewDidLayoutSubviews];
  v3 = [(_TVAppDocumentRequestController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  int v8 = [(_TVAppDocumentRequestController *)self swipeUpMessageView];
  objc_msgSend(v8, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  if (v10 > 0.0)
  {
    double v11 = v9;
    double v12 = v10;
    objc_msgSend(v8, "setCenter:", v5 * 0.5, v7 * 0.5);
    objc_msgSend(v8, "setBounds:", 0.0, 0.0, v11, v12);
    [(_TVAppDocumentRequestController *)self showcaseInset];
    BOOL v14 = v13 <= 0.0;
    double v15 = 34.0;
    if (!v14) {
      double v15 = 64.0;
    }
    double v16 = v7 * 0.5 - v15;
    v17 = [v8 layer];
    objc_msgSend(v17, "setAnchorPoint:", 0.5, v16 / v12);

    [v3 bringSubviewToFront:v8];
  }
}

- (id)preferredFocusEnvironments
{
  v8[1] = *MEMORY[0x263EF8340];
  if (self->_flags.shouldHideUI
    && ([(_TVAppDocumentRequestController *)self mediaController],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    double v4 = [(_TVAppDocumentRequestController *)self mediaController];
    v8[0] = v4;
    double v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_TVAppDocumentRequestController;
    double v5 = [(_TVAppDocumentController *)&v7 preferredFocusEnvironments];
  }
  return v5;
}

- (void)willHostTemplateViewController:(id)a3 usesTransitions:(BOOL *)a4
{
  if (self->_flags.shouldHideUI)
  {
    double v5 = [a3 view];
    [v5 setAlpha:0.0];

    *a4 = 0;
  }
}

- (id)customAnimatorForNavigationControllerOperation:(int64_t)a3 fromViewController:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(_TVAppDocumentController *)self adoptsContext];
  if (a3 == 1 && v7)
  {
    int v8 = objc_alloc_init(TVMediaTransitionAnimator);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_TVAppDocumentRequestController;
    int v8 = [(_TVAppDocumentController *)&v11 customAnimatorForNavigationControllerOperation:a3 fromViewController:v6];
  }
  double v9 = v8;

  return v9;
}

- (id)customAnimatorForNavigationControllerOperation:(int64_t)a3 toViewController:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(_TVAppDocumentController *)self adoptsContext];
  if (a3 == 2 && v7)
  {
    int v8 = objc_alloc_init(TVMediaTransitionAnimator);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_TVAppDocumentRequestController;
    int v8 = [(_TVAppDocumentController *)&v11 customAnimatorForNavigationControllerOperation:a3 toViewController:v6];
  }
  double v9 = v8;

  return v9;
}

- (id)relinquishOwnership
{
  v3 = [(_TVAppDocumentRequestController *)self mediaController];
  [(_TVAppDocumentRequestController *)self setMediaController:0];
  if (v3)
  {
    double v4 = [v3 parentViewController];

    if (v4 == self)
    {
      [v3 willMoveToParentViewController:0];
      double v5 = [v3 view];
      [v5 removeFromSuperview];

      [v3 removeFromParentViewController];
    }
  }
  return v3;
}

- (void)adoptMediaController:(id)a3
{
  id v4 = a3;
  [v4 setShouldZoomWhenTransitioningToBackground:1];
  [v4 transitionToForeground:0 animated:1];
  [(_TVAppDocumentRequestController *)self setMediaController:v4];
}

- (void)featuresManager:(id)a3 currentContextDidChangeForFeature:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  BOOL v7 = v6;
  if (&unk_26E5F54B0 == v6)
  {
    int v8 = [(TVTemplateFeaturesManager *)self->_featuresManager currentContextForFeature:v6];
    [(_TVAppDocumentRequestController *)self setShowcasingController:v8];
  }
  else
  {
    if (&unk_26E5E0118 != v6) {
      goto LABEL_6;
    }
    int v8 = [(TVTemplateFeaturesManager *)self->_featuresManager currentContextForFeature:v6];
    [(_TVAppDocumentRequestController *)self setMediaProvider:v8];
  }

LABEL_6:
}

- (void)coverImageDidChangeForMediaController:(id)a3
{
  id v4 = [(_TVAppDocumentRequestController *)self observableEventController];
  [v4 dispatchEvent:@"TVMediaPlayingCoverImageDidChangeEvent" sender:self withUserInfo:0];
}

- (void)stateDidChangeForMediaController:(id)a3
{
  id v4 = [(_TVAppDocumentRequestController *)self mediaPlaybackManager];
  [v4 onMediaControllerStateDidChange];

  id v5 = [(_TVAppDocumentRequestController *)self observableEventController];
  [v5 dispatchEvent:@"TVMediaPlayingStateDidChangeEvent" sender:self withUserInfo:0];
}

- (void)mediaPlaybackManager:(id)a3 shouldHideUI:(BOOL)a4 animated:(BOOL)a5 animations:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  double v15 = [(_TVAppDocumentController *)self templateViewController];
  char v16 = [v15 isViewLoaded];

  if (v16)
  {
    if ([v12 currentUIMode] == 1)
    {
      [(_TVAppDocumentRequestController *)self shouldHideSupplementaryUI:v10 animated:v9 completion:v14];
    }
    else if (self->_flags.shouldHideUI != v10)
    {
      self->_flags.shouldHideUI = v10;
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __100___TVAppDocumentRequestController_mediaPlaybackManager_shouldHideUI_animated_animations_completion___block_invoke;
      v25[3] = &unk_264BA6878;
      BOOL v26 = v10;
      v25[4] = self;
      v17 = (void (**)(void))MEMORY[0x230FC9DC0](v25);
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __100___TVAppDocumentRequestController_mediaPlaybackManager_shouldHideUI_animated_animations_completion___block_invoke_2;
      v22[3] = &unk_264BA7BD0;
      BOOL v24 = v10;
      v22[4] = self;
      id v23 = v13;
      objc_super v18 = (void (**)(void))MEMORY[0x230FC9DC0](v22);
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __100___TVAppDocumentRequestController_mediaPlaybackManager_shouldHideUI_animated_animations_completion___block_invoke_3;
      v20[3] = &unk_264BA8FF8;
      v20[4] = self;
      id v21 = v14;
      v19 = (void (**)(void, void))MEMORY[0x230FC9DC0](v20);
      if (v9)
      {
        v17[2](v17);
        [MEMORY[0x263F1CB60] animateWithDuration:0 delay:v18 options:v19 animations:0.25 completion:0.0];
      }
      else
      {
        v18[2](v18);
        v19[2](v19, 1);
      }
    }
  }
  else if (v14)
  {
    (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
  }
}

- (void)evaluateSwipeUpMessageForMediaPlaybackManager:(id)a3
{
  id v14 = [(_TVAppDocumentRequestController *)self swipeUpMessageView];
  id v4 = [(_TVAppDocumentRequestController *)self mediaController];
  uint64_t v5 = [v4 state];

  if (v5 == 4
    || ([(_TVAppDocumentRequestController *)self mediaPlaybackManager],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 swipeUpGestureRecognizer],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEnabled],
        v7,
        v6,
        !v8))
  {
    [v14 setEnabled:0];
  }
  else
  {
    if (!v14)
    {
      id v14 = (id)objc_opt_new();
      BOOL v9 = _TVMLLocString(@"TVMediaPlaybackSwipeUpMessage", @"Localizable");
      [v14 setMessage:v9];

      BOOL v10 = objc_msgSend(MEMORY[0x263F1C550], "tv_opacityColorForType:userInterfaceStyle:", 1, 2);
      [v14 setTintColor:v10];

      objc_super v11 = [(_TVAppDocumentRequestController *)self view];
      [v11 addSubview:v14];

      [(_TVAppDocumentRequestController *)self setSwipeUpMessageView:v14];
    }
    id v12 = [(_TVAppDocumentRequestController *)self mediaController];
    id v13 = [v12 mediaInfo];
    objc_msgSend(v14, "setEnabled:", objc_msgSend(v13, "intent") == 0);
  }
}

- (void)addObserver:(id)a3 forEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_TVAppDocumentRequestController *)self observableEventController];
  [v8 addObserver:v7 forEvent:v6];
}

- (void)removeObserver:(id)a3 forEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_TVAppDocumentRequestController *)self observableEventController];
  [v8 removeObserver:v7 forEvent:v6];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(_TVAppDocumentRequestController *)self observableEventController];
  [v5 removeObserver:v4];
}

- (void)handleEvent:(id)a3 sender:(id)a4 withUserInfo:(id)a5
{
  BOOL v10 = (__CFString *)a3;
  id v8 = a4;
  id v9 = a5;
  if (@"TVSelectedMediaInfoDidChangeEvent" == v10)
  {
    [(_TVAppDocumentRequestController *)self _updateMediaInfo];
  }
  else if (@"TVShowcaseFactorDidChangeEvent" == v10)
  {
    [(_TVAppDocumentRequestController *)self _updateShowcaseFactor];
  }
}

- (UIImage)coverImage
{
  id v2 = [(_TVAppDocumentRequestController *)self mediaController];
  v3 = [v2 coverImage];

  return (UIImage *)v3;
}

- (BOOL)isPlaying
{
  id v2 = [(_TVAppDocumentRequestController *)self mediaController];
  uint64_t v3 = [v2 state];

  return (unint64_t)(v3 - 2) < 3;
}

- (void)serviceRequest:(id)a3 didCompleteWithStatus:(int64_t)a4 errorDictionary:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  id v9 = [(_TVAppDocumentRequestController *)self documentServiceRequest];

  if (v9 == v14)
  {
    [v14 setDelegate:0];
    if (self->_adrcDelegateFlags.hasDidCompleteDocumentCreation)
    {
      id v12 = [(_TVAppDocumentController *)self appDelegate];
      [v12 appDocumentController:self didCompleteDocumentCreationWithStatus:a4 errorDictionary:v8];
    }
    [(_TVAppDocumentRequestController *)self didCompleteDocumentCreationWithStatus:a4 errorDictionary:v8];
  }
  else
  {
    id v10 = [(_TVAppDocumentRequestController *)self updateServiceRequest];

    if (v10 == v14)
    {
      [v14 setDelegate:0];
      [(_TVAppDocumentRequestController *)self setUpdateServiceRequest:0];
      if (a4)
      {
        objc_super v11 = [MEMORY[0x263F087E8] errorWithDomain:@"TVDocumentErrorDomain" code:a4 != 1 userInfo:v8];
        [(TVDocumentViewController *)self didFailUpdateWithError:v11];
      }
      else
      {
        objc_super v11 = [v14 serviceContext];
        id v13 = [v11 contextDictionary];
        [(TVDocumentViewController *)self didUpdateWithContext:v13];
      }
    }
  }
}

- (void)documentDidChangeForDocumentServiceRequest:(id)a3
{
  id v5 = [(_TVAppDocumentRequestController *)self documentServiceRequest];
  id v4 = [v5 appDocument];
  [(_TVAppDocumentController *)self replaceAppDocumentWithAppDocument:v4];
}

- (BOOL)tv_handleEventForDocument:(id)a3 eventName:(id)a4 targetResponder:(id)a5 viewElement:(id)a6 extraInfo:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(_TVAppDocumentRequestController *)self mediaPlaybackManager];
  [v14 onEvent];

  double v15 = objc_msgSend(v13, "tv_associatedViewElement");
  BOOL v16 = [(TVDocumentViewController *)self handleEvent:v11 withElement:v15 targetResponder:v12];

  BOOL v17 = v16
     || [(_TVAppDocumentRequestController *)self handleEvent:v11 targetResponder:v12 viewElement:v13 extraInfo:a7];

  return v17;
}

- (void)didChangeDocumentContext
{
  id v14 = [(TVDocumentViewController *)self documentContext];
  uint64_t v3 = [(_TVAppDocumentRequestController *)self updateServiceRequest];

  if (v3)
  {
    id v4 = [(_TVAppDocumentRequestController *)self updateServiceRequest];
    [v4 setDelegate:0];

    id v5 = [(_TVAppDocumentRequestController *)self updateServiceRequest];
    [v5 cancel];
  }
  id v6 = objc_alloc(MEMORY[0x263F4B480]);
  id v7 = [(_TVAppDocumentController *)self appDocument];
  id v8 = [v7 templateElement];
  id v9 = (void *)[v6 initWithContextDictionary:v14 element:v8];

  id v10 = objc_alloc(MEMORY[0x263F4B4C0]);
  id v11 = [(_TVAppDocumentController *)self appDocument];
  id v12 = [v11 appContext];
  id v13 = (void *)[v10 initWithAppContext:v12 serviceContext:v9];

  [v13 setDelegate:self];
  [(_TVAppDocumentRequestController *)self setUpdateServiceRequest:v13];
  [v13 send];
}

- (BOOL)automaticallyProvidesMediaController
{
  return 1;
}

- (BOOL)handleEvent:(id)a3 targetResponder:(id)a4 viewElement:(id)a5 extraInfo:(id *)a6
{
  return 0;
}

- (id)interactionPreviewControllerForViewController:(id)a3 presentingView:(id)a4 presentingElement:(id)a5
{
  return 0;
}

- (void)_hostMediaControllerIfPossible
{
  uint64_t v3 = [(_TVAppDocumentRequestController *)self mediaController];
  if (v3)
  {
    id v14 = v3;
    id v4 = [v3 parentViewController];

    uint64_t v3 = v14;
    if (!v4)
    {
      if ([v14 isViewLoaded])
      {
        id v5 = [v14 view];
        id v6 = [v5 superview];
        id v7 = [(_TVAppDocumentRequestController *)self view];
        char v8 = [v6 isDescendantOfView:v7];

        if ((v8 & 1) == 0)
        {
          id v9 = [v14 view];
          [v9 removeFromSuperview];
        }
      }
      [(_TVAppDocumentRequestController *)self addChildViewController:v14];
      id v10 = [v14 view];
      id v11 = [(_TVAppDocumentRequestController *)self view];
      [v11 bounds];
      objc_msgSend(v10, "setFrame:");

      id v12 = [(_TVAppDocumentRequestController *)self view];
      id v13 = [v14 view];
      [v12 insertSubview:v13 atIndex:0];

      [v14 didMoveToParentViewController:self];
      uint64_t v3 = v14;
    }
  }
}

- (id)_hostingFocusEnvironment
{
  uint64_t v3 = [(_TVAppDocumentRequestController *)self mediaController];
  id v4 = [v3 view];

  id v5 = self;
  id v6 = v5;
  if (v4 && v5)
  {
    do
    {
      id v7 = [v6 view];
      char v8 = [v4 isDescendantOfView:v7];

      if (v8) {
        break;
      }
      uint64_t v9 = [v6 parentViewController];

      id v6 = (void *)v9;
    }
    while (v9);
  }

  return v6;
}

- (void)_updateMediaInfo
{
  uint64_t v3 = [(_TVAppDocumentRequestController *)self mediaProvider];
  id obj = [v3 selectedMediaInfo];

  id v4 = obj;
  uint64_t selectedMediaInfo = (uint64_t)self->_selectedMediaInfo;
  if ((id)selectedMediaInfo != obj)
  {
    uint64_t selectedMediaInfo = [(id)selectedMediaInfo isEqual:obj];
    id v4 = obj;
    if ((selectedMediaInfo & 1) == 0)
    {
      objc_storeStrong((id *)&self->_selectedMediaInfo, obj);
      [(_TVAppDocumentRequestController *)self showcaseFactor];
      id v6 = [(_TVAppDocumentRequestController *)self mediaController];
      id v7 = [(_TVAppDocumentRequestController *)self selectedMediaInfo];
      [v6 setMediaInfo:v7];

      uint64_t selectedMediaInfo = [(_TVAppDocumentRequestController *)self mediaInfoDidChange];
      id v4 = obj;
      if (self->_adrcDelegateFlags.hasSelectedMediaInfoDidChange)
      {
        char v8 = [(_TVAppDocumentController *)self appDelegate];
        [v8 selectedMediaInfoDidChangeForAppDocumentController:self];

        id v4 = obj;
      }
    }
  }
  MEMORY[0x270F9A758](selectedMediaInfo, v4);
}

- (void)_updateShowcaseFactor
{
  if (self->_flags.shouldHideUI)
  {
    double v3 = NAN;
  }
  else
  {
    id v4 = [(_TVAppDocumentRequestController *)self showcasingController];
    [v4 showcaseFactor];
    double v3 = v5;
  }
  if (self->_showcaseFactor != v3)
  {
    self->_showcaseFactor = v3;
    [(_TVAppDocumentRequestController *)self showcaseFactor];
    id v6 = [(_TVAppDocumentRequestController *)self mediaPlaybackManager];
    [(_TVAppDocumentRequestController *)self showcaseFactor];
    objc_msgSend(v6, "setShowcaseFactor:");

    [(_TVAppDocumentRequestController *)self showcaseFactorDidChange];
    if (self->_adrcDelegateFlags.hasShowcaseFactorDidChange)
    {
      id v7 = [(_TVAppDocumentController *)self appDelegate];
      [v7 showcaseFactorDidChangeForAppDocumentController:self];
    }
  }
}

- (IKDocumentServiceRequest)documentServiceRequest
{
  return self->_documentServiceRequest;
}

- (TVMediaController)mediaController
{
  return self->_mediaController;
}

- (TVMediaPlaybackManager)mediaPlaybackManager
{
  return self->_mediaPlaybackManager;
}

- (void)setMediaPlaybackManager:(id)a3
{
}

- (TVMediaInfo)selectedMediaInfo
{
  return self->_selectedMediaInfo;
}

- (double)showcaseFactor
{
  return self->_showcaseFactor;
}

- (double)showcaseInset
{
  return self->_showcaseInset;
}

- (void)setShowcaseInset:(double)a3
{
  self->_showcaseInset = a3;
}

- (TVTemplateFeaturesManager)featuresManager
{
  return self->_featuresManager;
}

- (TVShowcasing)showcasingController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_showcasingController);
  return (TVShowcasing *)WeakRetained;
}

- (TVMediaProviding)mediaProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaProvider);
  return (TVMediaProviding *)WeakRetained;
}

- (_TVSwipeUpMessageView)swipeUpMessageView
{
  return self->_swipeUpMessageView;
}

- (void)setSwipeUpMessageView:(id)a3
{
}

- (TVObservableEventController)observableEventController
{
  return self->_observableEventController;
}

- (void)setObservableEventController:(id)a3
{
}

- (IKUpdateServiceRequest)updateServiceRequest
{
  return self->_updateServiceRequest;
}

- (void)setUpdateServiceRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateServiceRequest, 0);
  objc_storeStrong((id *)&self->_observableEventController, 0);
  objc_storeStrong((id *)&self->_swipeUpMessageView, 0);
  objc_destroyWeak((id *)&self->_mediaProvider);
  objc_destroyWeak((id *)&self->_showcasingController);
  objc_storeStrong((id *)&self->_featuresManager, 0);
  objc_storeStrong((id *)&self->_selectedMediaInfo, 0);
  objc_storeStrong((id *)&self->_mediaPlaybackManager, 0);
  objc_storeStrong((id *)&self->_mediaController, 0);
  objc_storeStrong((id *)&self->_documentServiceRequest, 0);
}

@end