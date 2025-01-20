@interface PGPictureInPictureViewController
+ (double)defaultContentCornerRadius;
+ (void)animateViewWithAnimationType:(int64_t)a3 initialSpringVelocity:(double)a4 animations:(id)a5 completion:(id)a6;
+ (void)tetherViewController:(id)a3 toViewController:(id)a4 mode:(int64_t)a5;
- (BOOL)canStartShowingChrome;
- (BOOL)isInteractivelyResizing;
- (BOOL)isInterrupted;
- (BOOL)isStashTabHidden;
- (BOOL)prefersHiddenFromClonedDisplay;
- (BOOL)prefersIdleTimerDisabled;
- (BOOL)prefersStashTabSuppressed;
- (BOOL)shouldAutorotate;
- (BOOL)showsPictureInPictureUnavailableIndicator;
- (BOOL)stashed;
- (BOOL)wantsStashTabSuppression;
- (CGSize)microPIPSize;
- (CGSize)minimumStashTabSize;
- (CGSize)preferredContentSize;
- (NSArray)menuItems;
- (NSString)sourceSceneSessionPersistentIdentifier;
- (PGControlsViewModel)viewModel;
- (PGHostedWindowHostingHandle)hostedWindowHostingHandle;
- (PGHostedWindowHostingHandle)microPIPHostedWindowHostingHandle;
- (PGPictureInPictureApplication)application;
- (PGPictureInPicturePagingAccessoryViewController)pagingAccessoryViewController;
- (PGPictureInPictureViewController)initWithApplication:(id)a3 sourceSceneSessionPersistentIdentifier:(id)a4 controlsStyle:(int64_t)a5;
- (PGPictureInPictureViewController)initWithCoder:(id)a3;
- (PGPictureInPictureViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PGPictureInPictureViewController)tetheredViewController;
- (PGPictureInPictureViewController)tetheringViewController;
- (PGPictureInPictureViewControllerContentContainer)contentContainer;
- (PGPictureInPictureViewControllerDelegate)delegate;
- (UIPointerInteraction)pointerInteraction;
- (UIView)contentContainerView;
- (UIView)sceneView;
- (double)currentContentCornerRadius;
- (double)preferredMinimumWidth;
- (id)_newShadowView;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)waitForUIFinalizationCompletionBlock;
- (int64_t)contentType;
- (int64_t)controlsStyle;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (int64_t)tetheringMode;
- (void)_addMaskViewSubviewIfNeeded;
- (void)_applyShadowSettingsToView:(id)a3;
- (void)_handleTapWhileStashedGestureRecognizer:(id)a3;
- (void)_insertContentContainerViewIfNeeded;
- (void)_layoutStashTabViewsIfNeeded;
- (void)_loadShadowViewIfNeeded;
- (void)_loadTabShadowViewIfNeeded;
- (void)_noteTetheringDidUpdate;
- (void)_performStartAnimationWithCompletionHandler:(id)a3;
- (void)_performStopAnimationWithFinalInterfaceOrientation:(int64_t)a3 finalLayerFrame:(CGRect)a4 completionHandler:(id)a5;
- (void)_resetStashTabViewsIfPossible;
- (void)_setPortalActive:(BOOL)a3 left:(BOOL)a4;
- (void)_setStashMaskActive:(BOOL)a3;
- (void)_setStashedTabHidden:(BOOL)a3 left:(BOOL)a4;
- (void)_updateContentCornerRadiusForMaskActive:(BOOL)a3;
- (void)_updateCornerRadii;
- (void)_updatePointerEffect;
- (void)_updatePrefersIdleTimerDisabled;
- (void)_updateStashTabStateWithBehavior:(id)a3;
- (void)acquireInterfaceOrientationLock;
- (void)deactivateAnalyticsSessionIfNeeded;
- (void)dealloc;
- (void)flashControls;
- (void)handleCommand:(id)a3;
- (void)hostedWindowSizeChangeBegan;
- (void)hostedWindowSizeChangeEnded;
- (void)loadView;
- (void)notePictureInPictureStartedAutomatically:(BOOL)a3;
- (void)notePictureInPictureWillStopForAppRequest:(BOOL)a3 preferredFullScreenRestore:(BOOL)a4;
- (void)pagingAccessorySetCurrentPage:(unint64_t)a3 numberOfPages:(unint64_t)a4;
- (void)performResumeAnimationWithCompletionHandler:(id)a3;
- (void)performRotateAnimationWithRotation:(int64_t)a3 completionHandler:(id)a4;
- (void)performStartAnimated:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)performStopAnimated:(BOOL)a3 withFinalInterfaceOrientation:(int64_t)a4 finalLayerFrame:(CGRect)a5 completionHandler:(id)a6;
- (void)performSuspendAnimationWithCompletionHandler:(id)a3;
- (void)prepareStartAnimationWithInitialInterfaceOrientation:(int64_t)a3 initialLayerFrame:(CGRect)a4 completionHandler:(id)a5;
- (void)prepareStopAnimationWithCompletionHandler:(id)a3;
- (void)relinquishInterfaceOrientationLock;
- (void)setAnalyticsDelegate:(id)a3 analyticsSourceUUID:(id)a4;
- (void)setCanStartShowingChrome:(BOOL)a3;
- (void)setContentContainer:(id)a3;
- (void)setContentCornerRadius:(double)a3 animated:(BOOL)a4;
- (void)setContentViewHidden:(BOOL)a3;
- (void)setCurrentContentCornerRadius:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setHostedWindowHostingHandle:(id)a3;
- (void)setInteractivelyResizing:(BOOL)a3;
- (void)setInterrupted:(BOOL)a3;
- (void)setMenuItems:(id)a3;
- (void)setMicroPIPHostedWindowHostingHandle:(id)a3;
- (void)setMicroPIPSize:(CGSize)a3;
- (void)setMinimumStashTabSize:(CGSize)a3;
- (void)setPagingAccessoryViewController:(id)a3;
- (void)setPointerInteraction:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setPrefersStashTabSuppressed:(BOOL)a3;
- (void)setSceneView:(id)a3;
- (void)setShouldDisablePointerInteraction:(BOOL)a3;
- (void)setShowsPictureInPictureUnavailableIndicator:(BOOL)a3;
- (void)setStashProgress:(double)a3;
- (void)setStashTabHidden:(BOOL)a3 left:(BOOL)a4 withSpringBehavior:(id)a5;
- (void)setStashed:(BOOL)a3;
- (void)setTetheredViewController:(id)a3 mode:(int64_t)a4;
- (void)setTetheringViewController:(id)a3 mode:(int64_t)a4;
- (void)setWaitForUIFinalizationCompletionBlock:(id)a3;
- (void)settings:(id)a3 changedValueForKeyPath:(id)a4;
- (void)showChrome:(BOOL)a3 animated:(BOOL)a4;
- (void)updateHostedWindowSize:(CGSize)a3;
- (void)updatePlaybackStateWithDiff:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PGPictureInPictureViewController

- (PGPictureInPictureViewController)initWithApplication:(id)a3 sourceSceneSessionPersistentIdentifier:(id)a4 controlsStyle:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = PGLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureViewController initWithApplication:sourceSceneSessionPersistentIdentifier:controlsStyle:]();
  }

  v29.receiver = self;
  v29.super_class = (Class)PGPictureInPictureViewController;
  v11 = [(PGPictureInPictureViewController *)&v29 initWithNibName:0 bundle:0];
  v12 = v11;
  if (v11)
  {
    v11->_stashTabHidden = 1;
    v11->_canStartShowingChrome = 1;
    v11->_controlsStyle = a5;
    v13 = objc_alloc_init(PGControlsViewModel);
    viewModel = v12->_viewModel;
    v12->_viewModel = v13;

    objc_storeWeak((id *)&v12->_application, v8);
    objc_storeStrong((id *)&v12->_sourceSceneSessionPersistentIdentifier, a4);
    v12->_shouldDisablePointerInteraction = 0;
    if ((unint64_t)(a5 - 1) <= 3)
    {
      v15 = [PGControlsContainerView alloc];
      uint64_t v16 = -[PGControlsContainerView initWithFrame:viewModel:](v15, "initWithFrame:viewModel:", v12->_viewModel, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      controlsContainerView = v12->_controlsContainerView;
      v12->_controlsContainerView = (PGControlsContainerView *)v16;

      [(PGControlsContainerView *)v12->_controlsContainerView setControlsContainerHidden:1 animated:0];
      [(PGControlsContainerView *)v12->_controlsContainerView setCommandHandler:v12];
      objc_initWeak(&location, v12);
      v18 = v12->_controlsContainerView;
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __109__PGPictureInPictureViewController_initWithApplication_sourceSceneSessionPersistentIdentifier_controlsStyle___block_invoke;
      v26 = &unk_1E610CE18;
      objc_copyWeak(&v27, &location);
      [(PGControlsContainerView *)v18 setCoordinatedAnimationsForControlsVisibiity:&v23];
      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
    [(PGPictureInPictureViewController *)v12 setAccessibilityIdentifier:@"PG-PictureInPictureViewController", v23, v24, v25, v26];
    uint64_t v19 = +[PGMobilePIPSettingsDomain rootSettings];
    settings = v12->_settings;
    v12->_settings = (PGMobilePIPSettings *)v19;

    [(PTSettings *)v12->_settings addKeyPathObserver:v12];
    [(id)objc_opt_class() defaultContentCornerRadius];
    v12->_currentContentCornerRadius = v21;
  }

  return v12;
}

void __109__PGPictureInPictureViewController_initWithApplication_sourceSceneSessionPersistentIdentifier_controlsStyle___block_invoke(uint64_t a1, int a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v4 = objc_loadWeakRetained(WeakRetained + 144);
    if ([v4 pictureInPictureViewControllerShouldHideTetheredViewControllerAlongsideControls:v8] ^ 1 | a2)double v5 = 1.0; {
    else
    }
      double v5 = 0.0;

    id v6 = objc_loadWeakRetained(v8 + 154);
    v7 = [v6 viewIfLoaded];
    [v7 setAlpha:v5];

    WeakRetained = v8;
  }
}

- (PGPictureInPictureViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  double v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3A8];
  v7 = _PGLogMethodProem(self, 0);
  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  [v5 raise:v6, @"%@ is not a valid initializer. You must call -[%@ initWithControlsStyle:].", v7, v9 format];

  return [(PGPictureInPictureViewController *)self initWithApplication:0 sourceSceneSessionPersistentIdentifier:0 controlsStyle:0];
}

- (void)dealloc
{
  v3 = PGLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureController init]();
  }

  if ([(PGPictureInPictureViewController *)self prefersIdleTimerDisabled])
  {
    self->_prefersIdleTimerDisabled = 0;
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"PGPictureInPictureViewControllerPrefersIdleTimerDisabledDidChangeNotification" object:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)PGPictureInPictureViewController;
  [(PGPictureInPictureViewController *)&v5 dealloc];
}

- (PGPictureInPictureViewController)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  uint64_t v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v4 raise:v5, @"%@ does not support unarchiving from a nib.", v7 format];

  return [(PGPictureInPictureViewController *)self initWithApplication:0 sourceSceneSessionPersistentIdentifier:0 controlsStyle:0];
}

- (int64_t)contentType
{
  v2 = [(PGControlsViewModel *)self->_viewModel playbackState];
  int64_t v3 = [v2 contentType];

  return v3;
}

- (void)setStashed:(BOOL)a3
{
  if (self->_stashed != a3)
  {
    BOOL v3 = a3;
    self->_stashed = a3;
    double v5 = 0.0;
    if (a3) {
      double v5 = 1.0;
    }
    [(PGPictureInPictureViewController *)self setStashProgress:v5];
    if ([(PGPictureInPictureViewController *)self isViewLoaded])
    {
      if (v3)
      {
        uint64_t v6 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleTapWhileStashedGestureRecognizer_];
        stashedTapGestureRecognizer = self->_stashedTapGestureRecognizer;
        self->_stashedTapGestureRecognizer = v6;

        id v8 = [(PGPictureInPictureViewController *)self view];
        [v8 addGestureRecognizer:self->_stashedTapGestureRecognizer];
      }
      else
      {
        id v8 = [(PGPictureInPictureViewController *)self view];
        [v8 removeGestureRecognizer:self->_stashedTapGestureRecognizer];
      }

      [(PGPictureInPictureViewController *)self _updatePrefersIdleTimerDisabled];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained pictureInPictureViewController:self didTransitionToStashed:v3];

    id v10 = objc_loadWeakRetained((id *)&self->_analyticsDelegate);
    [v10 pictureInPictureDidChangeStashStateForAnalyticsSessionWithUUID:self->_analyticsSessionUUID stashed:v3];
  }
}

- (PGHostedWindowHostingHandle)hostedWindowHostingHandle
{
  return self->_hostedWindowHostingHandle;
}

- (void)setHostedWindowHostingHandle:(id)a3
{
  p_hostedWindowHostingHandle = &self->_hostedWindowHostingHandle;
  uint64_t v6 = (PGHostedWindowHostingHandle *)a3;
  id v10 = v6;
  if (*p_hostedWindowHostingHandle != v6)
  {
    objc_storeStrong((id *)&self->_hostedWindowHostingHandle, a3);
    uint64_t v6 = *p_hostedWindowHostingHandle;
  }
  v7 = [(PGLayerHostView *)self->_contentView hostedWindowHostingHandle];

  id v9 = v10;
  if (v6 != v7)
  {
    uint64_t v8 = [(PGLayerHostView *)self->_contentView setHostedWindowHostingHandle:v10];
    id v9 = v10;
  }

  MEMORY[0x1F41817F8](v8, v9);
}

- (void)setSceneView:(id)a3
{
  uint64_t v6 = (UIView *)a3;
  if (self->_sceneView != v6)
  {
    objc_storeStrong((id *)&self->_sceneView, a3);
    double v5 = [(UIView *)v6 layer];
    [v5 setAllowsHitTesting:0];

    [(PGLayerHostView *)self->_contentView setSceneView:v6];
  }
}

- (void)setContentContainer:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_contentContainer);

    if (v6) {
      *(unsigned char *)&self->_contentContainerRespondsTo &= 0xC0u;
    }
    objc_storeWeak((id *)&self->_contentContainer, obj);
    v7 = [(PGControlsViewModel *)self->_viewModel playbackState];
    if ([v7 isRoutingVideoToHostedWindow])
    {
      char v8 = objc_opt_respondsToSelector();

      if (v8) {
        [obj playbackSourceDidUpdateIsRoutingVideoToHostedWindow:1];
      }
    }
    else
    {
    }
    id v9 = objc_loadWeakRetained((id *)&self->_contentContainer);

    double v5 = obj;
    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_contentContainer);
      *(unsigned char *)&self->_contentContainerRespondsTo = *(unsigned char *)&self->_contentContainerRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;

      id v11 = objc_loadWeakRetained((id *)&self->_contentContainer);
      if (objc_opt_respondsToSelector()) {
        char v12 = 2;
      }
      else {
        char v12 = 0;
      }
      *(unsigned char *)&self->_contentContainerRespondsTo = *(unsigned char *)&self->_contentContainerRespondsTo & 0xFD | v12;

      id v13 = objc_loadWeakRetained((id *)&self->_contentContainer);
      if (objc_opt_respondsToSelector()) {
        char v14 = 4;
      }
      else {
        char v14 = 0;
      }
      *(unsigned char *)&self->_contentContainerRespondsTo = *(unsigned char *)&self->_contentContainerRespondsTo & 0xFB | v14;

      id v15 = objc_loadWeakRetained((id *)&self->_contentContainer);
      if (objc_opt_respondsToSelector()) {
        char v16 = 8;
      }
      else {
        char v16 = 0;
      }
      *(unsigned char *)&self->_contentContainerRespondsTo = *(unsigned char *)&self->_contentContainerRespondsTo & 0xF7 | v16;

      id v17 = objc_loadWeakRetained((id *)&self->_contentContainer);
      if (objc_opt_respondsToSelector()) {
        char v18 = 16;
      }
      else {
        char v18 = 0;
      }
      *(unsigned char *)&self->_contentContainerRespondsTo = *(unsigned char *)&self->_contentContainerRespondsTo & 0xEF | v18;

      id v19 = objc_loadWeakRetained((id *)&self->_contentContainer);
      if (objc_opt_respondsToSelector()) {
        char v20 = 32;
      }
      else {
        char v20 = 0;
      }
      *(unsigned char *)&self->_contentContainerRespondsTo = *(unsigned char *)&self->_contentContainerRespondsTo & 0xDF | v20;

      double v5 = obj;
    }
  }
}

- (void)setCanStartShowingChrome:(BOOL)a3
{
  if (self->_canStartShowingChrome == a3)
  {
    if (!a3) {
      return;
    }
  }
  else
  {
    if (!a3)
    {
      [(PGPictureInPictureViewController *)self setStashed:0];
      [(PGPictureInPictureViewController *)self showChrome:0 animated:0];
      self->_canStartShowingChrome = a3;
      return;
    }
    self->_canStartShowingChrome = a3;
    waitForUIFinalizationCompletionBlock = (void (**)(id, SEL))self->_waitForUIFinalizationCompletionBlock;
    if (waitForUIFinalizationCompletionBlock)
    {
      waitForUIFinalizationCompletionBlock[2](waitForUIFinalizationCompletionBlock, a2);
      id v6 = self->_waitForUIFinalizationCompletionBlock;
      self->_waitForUIFinalizationCompletionBlock = 0;
    }
  }
  if (!self->_waitForUIFinalizationCompletionBlock)
  {
    [(PGPictureInPictureViewController *)self _insertContentContainerViewIfNeeded];
  }
}

- (void)setInteractivelyResizing:(BOOL)a3
{
  if (self->_interactivelyResizing != a3)
  {
    self->_interactivelyResizing = a3;
    -[PGControlsContainerView setInteractivelyResizing:](self->_controlsContainerView, "setInteractivelyResizing:");
    [(PGPictureInPictureViewController *)self _resetStashTabViewsIfPossible];
    id v4 = [(PGPictureInPictureViewController *)self view];
    [v4 setNeedsLayout];

    id v5 = [(PGPictureInPictureViewController *)self view];
    [v5 layoutIfNeeded];
  }
}

- (void)setAnalyticsDelegate:(id)a3 analyticsSourceUUID:(id)a4
{
  id obj = a3;
  id v6 = (NSUUID *)[a4 copy];
  analyticsSourceUUID = self->_analyticsSourceUUID;
  self->_analyticsSourceUUID = v6;

  objc_storeWeak((id *)&self->_analyticsDelegate, obj);
}

- (void)notePictureInPictureStartedAutomatically:(BOOL)a3
{
  self->_startedAutomatically = a3;
}

- (void)notePictureInPictureWillStopForAppRequest:(BOOL)a3 preferredFullScreenRestore:(BOOL)a4
{
  if (self->_analyticsSessionUUID && self->_analyticsSourceUUID)
  {
    BOOL v5 = a4;
    BOOL v6 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);
    [WeakRetained pictureInPictureDidDeactivateAnalyticsSessionWithUUID:self->_analyticsSessionUUID analyticsSourceUUID:self->_analyticsSourceUUID appStoppedSession:v6 restoredFullScreen:v5];

    id v8 = objc_loadWeakRetained((id *)&self->_analyticsDelegate);
    [v8 pictureInPictureDidDestroyAnalyticsSessionWithUUID:self->_analyticsSessionUUID];
  }

  objc_storeWeak((id *)&self->_analyticsDelegate, 0);
}

- (void)deactivateAnalyticsSessionIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);

  if (WeakRetained)
  {
    [(PGPictureInPictureViewController *)self notePictureInPictureWillStopForAppRequest:0 preferredFullScreenRestore:0];
  }
}

- (BOOL)prefersIdleTimerDisabled
{
  return self->_prefersIdleTimerDisabled;
}

- (PGControlsViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setMinimumStashTabSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (self->_minimumStashTabSize.width != a3.width || self->_minimumStashTabSize.height != a3.height)
  {
    self->_minimumStashTabSize = a3;
    if ([(PGPictureInPictureViewController *)self isViewLoaded])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_stashMaskView);
      objc_msgSend(WeakRetained, "setMinimumStashTabSize:", width, height);

      stashView = self->_stashView;
      [(PGStashView *)stashView setStashedTabWidth:width];
    }
  }
}

- (void)flashControls
{
}

- (void)pagingAccessorySetCurrentPage:(unint64_t)a3 numberOfPages:(unint64_t)a4
{
  if (a4 >= 2 && !self->_pagingAccessoryViewController)
  {
    v7 = objc_alloc_init(PGPictureInPicturePagingAccessoryViewController);
    pagingAccessoryViewController = self->_pagingAccessoryViewController;
    self->_pagingAccessoryViewController = v7;
  }
  id v9 = self->_pagingAccessoryViewController;

  [(PGPictureInPicturePagingAccessoryViewController *)v9 setCurrentPage:a3 numberOfPages:a4];
}

+ (double)defaultContentCornerRadius
{
  return 15.0;
}

+ (void)tetherViewController:(id)a3 toViewController:(id)a4 mode:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  [v7 setTetheredViewController:v8 mode:a5];
  [v8 setTetheringViewController:v7 mode:a5];
}

- (void)setTetheredViewController:(id)a3 mode:(int64_t)a4
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tetheredViewController);

  if (WeakRetained != obj) {
    objc_storeWeak((id *)&self->_tetheredViewController, obj);
  }
  if (self->_tetheringMode != a4) {
    self->_tetheringMode = a4;
  }
  [(PGPictureInPictureViewController *)self _noteTetheringDidUpdate];
}

- (void)setTetheringViewController:(id)a3 mode:(int64_t)a4
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tetheringViewController);

  if (WeakRetained != obj) {
    objc_storeWeak((id *)&self->_tetheringViewController, obj);
  }
  if (self->_tetheringMode != a4) {
    self->_tetheringMode = a4;
  }
  [(PGPictureInPictureViewController *)self _noteTetheringDidUpdate];
  id v7 = objc_loadWeakRetained((id *)&self->_pointerInteraction);
  [v7 invalidate];
}

- (void)_noteTetheringDidUpdate
{
  [(PGPictureInPictureViewController *)self _updateCornerRadii];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tetheringViewController);

  if (!WeakRetained)
  {
    BOOL v5 = [(PGPictureInPictureViewController *)self viewIfLoaded];
    [v5 setAlpha:1.0];
  }
  id v6 = objc_loadWeakRetained((id *)&self->_contentContainer);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_contentContainer);
    [v9 notePictureInPictureViewControllerTetheringDidUpdate];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = objc_loadWeakRetained((id *)&self->_contentContainer);
  }
}

- (void)showChrome:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (([(PGPictureInPictureViewController *)self isViewLoaded] & 1) == 0)
  {
    char v7 = PGLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureViewController showChrome:animated:]();
    }
  }
  self->_isShowingChrome = v5;
  if (!v5 || self->_canStartShowingChrome)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__PGPictureInPictureViewController_showChrome_animated___block_invoke;
    v13[3] = &unk_1E610C640;
    v13[4] = self;
    BOOL v14 = v5;
    id v8 = (void (**)(void))MEMORY[0x1BA99D810](v13);
    id v9 = v8;
    if (v4)
    {
      id v10 = (void *)MEMORY[0x1E4F42FF0];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __56__PGPictureInPictureViewController_showChrome_animated___block_invoke_2;
      v11[3] = &unk_1E610CA48;
      char v12 = v8;
      objc_msgSend(v10, "PG_animateUsingDefaultTimingWithAnimations:completion:", v11, 0);
    }
    else
    {
      v8[2](v8);
    }
    [(PGControlsContainerView *)self->_controlsContainerView setControlsContainerHidden:!v5 animated:v4];
  }
}

uint64_t __56__PGPictureInPictureViewController_showChrome_animated___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 984);
  if (*(unsigned char *)(a1 + 40)) {
    [MEMORY[0x1E4F428B8] colorWithRed:0.109803922 green:0.109803922 blue:0.117647059 alpha:1.0];
  }
  else {
  BOOL v3 = [MEMORY[0x1E4F428B8] clearColor];
  }
  [v2 setBackgroundColor:v3];

  if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(a1 + 32) _loadShadowViewIfNeeded];
    [*(id *)(a1 + 32) _loadTabShadowViewIfNeeded];
  }
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = 0.0;
  if (!*(unsigned char *)(v4 + 1202))
  {
    double v5 = 1.0;
    if (!*(unsigned char *)(a1 + 40)) {
      double v5 = 0.0;
    }
  }
  [*(id *)(v4 + 1032) setAlpha:v5];
  id v6 = *(void **)(a1 + 32);

  return [v6 _updateCornerRadii];
}

uint64_t __56__PGPictureInPictureViewController_showChrome_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (double)currentContentCornerRadius
{
  if (self->_isShowingChrome) {
    return self->_currentContentCornerRadius;
  }
  else {
    return 0.0;
  }
}

- (void)setContentCornerRadius:(double)a3 animated:(BOOL)a4
{
  if (self->_currentContentCornerRadius != a3)
  {
    self->_currentContentCornerRadius = a3;
    if (a4)
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __68__PGPictureInPictureViewController_setContentCornerRadius_animated___block_invoke;
      v4[3] = &unk_1E610C280;
      v4[4] = self;
      objc_msgSend(MEMORY[0x1E4F42FF0], "PG_animateUsingDefaultTimingWithAnimations:completion:", v4, 0);
    }
    else
    {
      [(PGPictureInPictureViewController *)self _updateCornerRadii];
    }
  }
}

uint64_t __68__PGPictureInPictureViewController_setContentCornerRadius_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCornerRadii];
}

- (void)_updateCornerRadii
{
  [(PGPictureInPictureViewController *)self currentContentCornerRadius];
  double v4 = v3;
  -[PGPictureInPictureViewControllerClippingView _setContinuousCornerRadius:](self->_contentClippingView, "_setContinuousCornerRadius:");
  [(UIView *)self->_containerView _setContinuousCornerRadius:v4];
  [(PGPictureInPictureViewControllerBackgroundView *)self->_backgroundView _setContinuousCornerRadius:v4];
  [(PGControlsContainerView *)self->_controlsContainerView _setContinuousCornerRadius:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stashMaskView);
  [WeakRetained _setContinuousCornerRadius:v4];

  stashView = self->_stashView;

  [(PGStashView *)stashView _setContinuousCornerRadius:v4];
}

+ (void)animateViewWithAnimationType:(int64_t)a3 initialSpringVelocity:(double)a4 animations:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  if (a3 == 1)
  {
    BOOL v14 = (void *)MEMORY[0x1E4F42FF0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __109__PGPictureInPictureViewController_animateViewWithAnimationType_initialSpringVelocity_animations_completion___block_invoke_2;
    v15[3] = &unk_1E610CE40;
    v16[1] = a1;
    *(double *)&v16[2] = a4;
    id v13 = (id *)v16;
    v16[0] = v10;
    objc_msgSend(v14, "PG_animateUsingDefaultDampedSpringWithInitialSpringVelocity:animations:completion:", v15, v11, a4);
    goto LABEL_5;
  }
  if (!a3)
  {
    char v12 = (void *)MEMORY[0x1E4F42FF0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __109__PGPictureInPictureViewController_animateViewWithAnimationType_initialSpringVelocity_animations_completion___block_invoke;
    v17[3] = &unk_1E610CE40;
    v18[1] = a1;
    v18[2] = 0;
    id v13 = (id *)v18;
    v18[0] = v10;
    objc_msgSend(v12, "PG_animateUsingDefaultTimingWithAnimations:completion:", v17, v11);
LABEL_5:
  }
}

void __109__PGPictureInPictureViewController_animateViewWithAnimationType_initialSpringVelocity_animations_completion___block_invoke(void *a1)
{
  v2 = (void *)a1[5];
  double v3 = [NSNumber numberWithInteger:a1[6]];
  objc_setAssociatedObject(v2, "PGPictureInPictureViewController.AnimationType", v3, (void *)1);

  (*(void (**)(void))(a1[4] + 16))();
  double v4 = (void *)a1[5];

  objc_setAssociatedObject(v4, "PGPictureInPictureViewController.AnimationType", 0, (void *)1);
}

void __109__PGPictureInPictureViewController_animateViewWithAnimationType_initialSpringVelocity_animations_completion___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  double v3 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  objc_setAssociatedObject(v2, "PGPictureInPictureViewController.InitialSpringVelocity", v3, (void *)1);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  double v4 = *(void **)(a1 + 40);

  objc_setAssociatedObject(v4, "PGPictureInPictureViewController.InitialSpringVelocity", 0, (void *)1);
}

- (void)updateHostedWindowSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = objc_opt_class();
  objc_getAssociatedObject(v6, "PGPictureInPictureViewController.InitialSpringVelocity");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v13 doubleValue];
    double v8 = v7;
    uint64_t v9 = 2;
  }
  else
  {
    id v10 = objc_opt_class();
    id v11 = objc_getAssociatedObject(v10, "PGPictureInPictureViewController.AnimationType");

    uint64_t v9 = v11 != 0;
    double v8 = 0.0;
  }
  char v12 = [(PGPictureInPictureViewController *)self delegate];
  objc_msgSend(v12, "pictureInPictureViewController:updateHostedWindowSize:animationType:initialSpringVelocity:", self, v9, width, height, v8);
}

- (void)hostedWindowSizeChangeBegan
{
  double v3 = [(PGPictureInPictureViewController *)self delegate];
  [v3 pictureInPictureViewControllerHostedWindowSizeChangeBegan:self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_pointerInteraction);
  [WeakRetained invalidate];
}

- (void)hostedWindowSizeChangeEnded
{
  double v3 = [(PGPictureInPictureViewController *)self delegate];
  [v3 pictureInPictureViewControllerHostedWindowSizeChangeEnded:self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_pointerInteraction);
  [WeakRetained invalidate];
}

- (void)setStashProgress:(double)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [(PGStashView *)self->_stashView blurProgress];
  BOOL v7 = v6 != 0.0 || a3 >= 0.2;
  BOOL v8 = v6 == a3 || !v7;
  if (!v8 && [(PGPictureInPictureViewController *)self isViewLoaded])
  {
    char IsZero = BSFloatIsZero();
    if ((IsZero & 1) == 0 && [(PGStashView *)self->_stashView isHidden])
    {
      id v10 = PGLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543874;
        double v21 = v11;
        __int16 v22 = 1024;
        int v23 = 608;
        __int16 v24 = 2114;
        v25 = @"not hidden";
        _os_log_impl(&dword_1B5645000, v10, OS_LOG_TYPE_DEFAULT, "[Layout] %{public}@:%d Stash view set %{public}@", buf, 0x1Cu);
      }
      [(PGStashView *)self->_stashView setHidden:0];
    }
    unint64_t v12 = self->_inFlightStashProgressAnimationIdentifier + 1;
    self->_inFlightStashProgressAnimationIdentifier = v12;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __53__PGPictureInPictureViewController_setStashProgress___block_invoke;
    void v18[3] = &unk_1E610C7D0;
    v18[4] = self;
    char v19 = IsZero;
    *(double *)&v18[5] = a3;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __53__PGPictureInPictureViewController_setStashProgress___block_invoke_2;
    void v16[3] = &unk_1E610CE68;
    char v17 = IsZero;
    v16[4] = self;
    v16[5] = v12;
    v16[6] = a2;
    objc_msgSend(MEMORY[0x1E4F42FF0], "PG_animateUsingDefaultTimingWithOptions:animations:completion:", 4, v18, v16);
    double v13 = 1.0 - a3;
    BOOL v8 = BSFloatIsZero() == 0;
    double v14 = 0.5;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__PGPictureInPictureViewController_setStashProgress___block_invoke_144;
    v15[3] = &unk_1E610C5C0;
    if (!v8) {
      double v14 = 0.2;
    }
    void v15[4] = self;
    *(double *)&v15[5] = v13;
    [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v15 options:0 animations:v14 completion:0.0];
  }
}

uint64_t __53__PGPictureInPictureViewController_setStashProgress___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1048);
  double v3 = 0.0;
  if (!*(unsigned char *)(a1 + 48)) {
    double v3 = 1.0;
  }
  [v2 setAlpha:v3];
  double v4 = *(void **)(*(void *)(a1 + 32) + 1048);
  double v5 = *(double *)(a1 + 40);

  return [v4 setBlurProgress:v5];
}

uint64_t __53__PGPictureInPictureViewController_setStashProgress___block_invoke_2(uint64_t result)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(result + 56))
  {
    uint64_t v1 = result;
    if (*(void *)(result + 40) == *(void *)(*(void *)(result + 32) + 1112))
    {
      v2 = PGLogCommon();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        double v3 = NSStringFromSelector(*(SEL *)(v1 + 48));
        int v4 = 138543874;
        double v5 = v3;
        __int16 v6 = 1024;
        int v7 = 618;
        __int16 v8 = 2114;
        uint64_t v9 = @"hidden";
        _os_log_impl(&dword_1B5645000, v2, OS_LOG_TYPE_DEFAULT, "[Layout] %{public}@:%d Stash view set %{public}@", (uint8_t *)&v4, 0x1Cu);
      }
      [*(id *)(*(void *)(v1 + 32) + 1048) setHidden:1];
      return [*(id *)(v1 + 32) _resetStashTabViewsIfPossible];
    }
  }
  return result;
}

uint64_t __53__PGPictureInPictureViewController_setStashProgress___block_invoke_144(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1032) setAlpha:*(double *)(a1 + 40)];
}

- (void)setPrefersStashTabSuppressed:(BOOL)a3
{
  if (self->_prefersStashTabSuppressed != a3)
  {
    self->_prefersStashTabSuppressed = a3;
    [(PGPictureInPictureViewController *)self _updateStashTabStateWithBehavior:self->_stashTabSpringBehavior];
  }
}

- (BOOL)wantsStashTabSuppression
{
  v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v2) = [WeakRetained pictureInPictureViewControllerWantsStashTabSuppression:v2];

  return (char)v2;
}

- (BOOL)isStashTabHidden
{
  return self->_stashTabHidden;
}

- (void)setStashTabHidden:(BOOL)a3 left:(BOOL)a4 withSpringBehavior:(id)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  id v9 = a5;
  objc_storeStrong(&self->_stashTabSpringBehavior, a5);
  if (__PAIR64__(self->_stashTabShownLeft, self->_stashTabHidden) != __PAIR64__(v6, v7))
  {
    self->_stashTabHidden = v7;
    self->_stashTabShownLeft = v6 & ~v7;
    [(PGPictureInPictureViewController *)self _updateStashTabStateWithBehavior:v9];
  }
}

- (void)_updateStashTabStateWithBehavior:(id)a3
{
  int stashTabHidden = self->_stashTabHidden;
  if (self->_prefersStashTabSuppressed) {
    stashTabHidden |= self->_stashed;
  }
  unint64_t v4 = self->_inFlightStashTabAnimationIdentifier + 1;
  self->_inFlightStashTabAnimationIdentifier = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__PGPictureInPictureViewController__updateStashTabStateWithBehavior___block_invoke;
  v6[3] = &unk_1E610C640;
  v6[4] = self;
  BOOL v7 = stashTabHidden != 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__PGPictureInPictureViewController__updateStashTabStateWithBehavior___block_invoke_2;
  v5[3] = &unk_1E610CE90;
  v5[4] = self;
  v5[5] = v4;
  [MEMORY[0x1E4F42FF0] _animateUsingSpringBehavior:a3 tracking:0 animations:v6 completion:v5];
}

uint64_t __69__PGPictureInPictureViewController__updateStashTabStateWithBehavior___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setStashedTabHidden:*(unsigned __int8 *)(a1 + 40) left:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1085)];
}

void *__69__PGPictureInPictureViewController__updateStashTabStateWithBehavior___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  result = *(void **)(a1 + 32);
  if (*(void *)(v2 + 8) == result[138]) {
    return (void *)[result _resetStashTabViewsIfPossible];
  }
  return result;
}

- (BOOL)showsPictureInPictureUnavailableIndicator
{
  return [(PGControlsContainerView *)self->_controlsContainerView showsPictureInPictureUnavailableIndicator];
}

- (void)setShowsPictureInPictureUnavailableIndicator:(BOOL)a3
{
}

- (void)loadView
{
  double v3 = [PGHitTestExtendableView alloc];
  unint64_t v4 = -[PGHitTestExtendableView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(PGPictureInPictureViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)PGPictureInPictureViewController;
  [(PGPictureInPictureViewController *)&v34 viewDidLoad];
  double v3 = [_PGPictureInPictureContainerView alloc];
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  __int16 v8 = -[_PGPictureInPictureContainerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  [(UIView *)v8 setVcForDebugging:self];
  containerView = self->_containerView;
  self->_containerView = v8;
  uint64_t v10 = v8;

  id v11 = [(PGPictureInPictureViewController *)self view];
  [v11 addSubview:self->_containerView];

  unint64_t v12 = -[PGPictureInPictureViewControllerBackgroundView initWithFrame:]([PGPictureInPictureViewControllerBackgroundView alloc], "initWithFrame:", v4, v5, v6, v7);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v12;

  [(UIView *)self->_containerView addSubview:self->_backgroundView];
  double v14 = -[PGPictureInPictureViewControllerClippingView initWithFrame:]([PGPictureInPictureViewControllerClippingView alloc], "initWithFrame:", v4, v5, v6, v7);
  contentClippingView = self->_contentClippingView;
  self->_contentClippingView = v14;

  [(UIView *)self->_containerView addSubview:self->_contentClippingView];
  char v16 = -[PGLayerHostView initWithFrame:]([PGLayerHostView alloc], "initWithFrame:", v4, v5, v6, v7);
  contentView = self->_contentView;
  self->_contentView = v16;

  [(PGLayerHostView *)self->_contentView setHostedWindowHostingHandle:self->_hostedWindowHostingHandle];
  [(PGLayerHostView *)self->_contentView setUserInteractionEnabled:0];
  [(PGPictureInPictureViewControllerClippingView *)self->_contentClippingView addSubview:self->_contentView];
  [(PGPictureInPictureViewControllerClippingView *)self->_contentClippingView setClipsToBounds:1];
  [(UIView *)self->_containerView addSubview:self->_controlsContainerView];
  char v18 = -[PGPortalView initWithFrame:]([PGPortalView alloc], "initWithFrame:", v4, v5, v6, v7);
  leftSideContentPortalView = self->_leftSideContentPortalView;
  self->_leftSideContentPortalView = v18;

  char v20 = self->_leftSideContentPortalView;
  long long v31 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v35.a = *MEMORY[0x1E4F1DAB8];
  long long v30 = *(_OWORD *)&v35.a;
  *(_OWORD *)&v35.c = v31;
  *(_OWORD *)&v35.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v29 = *(_OWORD *)&v35.tx;
  CGAffineTransformScale(&v33, &v35, -1.0, 1.0);
  [(PGPortalView *)v20 setTransform:&v33];
  [(PGPortalView *)self->_leftSideContentPortalView setUserInteractionEnabled:0];
  [(PGPortalView *)self->_leftSideContentPortalView setHidden:1];
  [(UIView *)self->_containerView addSubview:self->_leftSideContentPortalView];
  double v21 = -[PGPortalView initWithFrame:]([PGPortalView alloc], "initWithFrame:", v4, v5, v6, v7);
  rightSideContentPortalView = self->_rightSideContentPortalView;
  self->_rightSideContentPortalView = v21;

  int v23 = self->_rightSideContentPortalView;
  *(_OWORD *)&v35.a = v30;
  *(_OWORD *)&v35.c = v31;
  *(_OWORD *)&v35.tx = v29;
  CGAffineTransformScale(&v32, &v35, -1.0, 1.0);
  [(PGPortalView *)v23 setTransform:&v32];
  [(PGPortalView *)self->_rightSideContentPortalView setHidden:1];
  [(PGPortalView *)self->_leftSideContentPortalView setUserInteractionEnabled:0];
  [(UIView *)self->_containerView addSubview:self->_rightSideContentPortalView];
  __int16 v24 = [PGStashView alloc];
  [(UIView *)self->_containerView bounds];
  v25 = -[PGStashView initWithFrame:](v24, "initWithFrame:");
  stashView = self->_stashView;
  self->_stashView = v25;

  [(PGStashView *)self->_stashView setHidden:1];
  [(PGStashView *)self->_stashView setUserInteractionEnabled:0];
  [(UIView *)self->_containerView addSubview:self->_stashView];

  [(PGPictureInPictureViewController *)self _addMaskViewSubviewIfNeeded];
  id v27 = PGLogCommon();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = [(PGPictureInPictureViewController *)self delegate];
    LODWORD(v35.a) = 136315650;
    *(void *)((char *)&v35.a + 4) = "-[PGPictureInPictureViewController viewDidLoad]";
    WORD2(v35.b) = 2048;
    *(void *)((char *)&v35.b + 6) = self;
    HIWORD(v35.c) = 2114;
    *(void *)&v35.d = v28;
    _os_log_impl(&dword_1B5645000, v27, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@", (uint8_t *)&v35, 0x20u);
  }
}

- (void)viewWillLayoutSubviews
{
  v38.receiver = self;
  v38.super_class = (Class)PGPictureInPictureViewController;
  [(PGPictureInPictureViewController *)&v38 viewWillLayoutSubviews];
  double v3 = [(PGPictureInPictureViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UIView setFrame:](self->_containerView, "setFrame:", v5, v7, v9, v11);
  -[PGPictureInPictureViewControllerClippingView setFrame:](self->_contentClippingView, "setFrame:", v5, v7, v9, v11);
  -[UIView setFrame:](self->_shadowView, "setFrame:", v5, v7, v9, v11);
  [(UIView *)self->_containerView bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [(PGPictureInPictureViewControllerClippingView *)self->_contentClippingView frame];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  if (self->_interactivelyResizing)
  {
    [(PGLayerHostView *)self->_contentView bounds];
    CGFloat v29 = v17 / v28;
    memset(&v37, 0, sizeof(v37));
    long long v30 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v36.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v36.c = v30;
    *(_OWORD *)&v36.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    CGAffineTransformScale(&v37, &v36, v29, v29);
    contentView = self->_contentView;
    CGAffineTransform v36 = v37;
    [(PGLayerHostView *)contentView setTransform:&v36];
    CGAffineTransform v32 = self->_contentView;
    [(PGPictureInPictureViewControllerClippingView *)self->_contentClippingView bounds];
    UIRectGetCenter();
    -[PGLayerHostView setCenter:](v32, "setCenter:");
  }
  else
  {
    CGAffineTransform v33 = self->_contentView;
    long long v34 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v37.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v37.c = v34;
    *(_OWORD *)&v37.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(PGLayerHostView *)v33 setTransform:&v37];
    -[PGLayerHostView setFrame:](self->_contentView, "setFrame:", v13, v15, v17, v19);
  }
  [(UIView *)self->_backgroundView PG_setAllowsEdgeAntialiasing:self->_interactivelyResizing];
  [(UIView *)self->_contentClippingView PG_setAllowsEdgeAntialiasing:self->_interactivelyResizing];
  [(UIView *)self->_controlsContainerView PG_setAllowsEdgeAntialiasing:self->_interactivelyResizing];
  [(UIView *)self->_contentView PG_setAllowsEdgeAntialiasing:self->_interactivelyResizing];
  backgroundView = self->_backgroundView;
  v39.origin.x = v21;
  v39.origin.y = v23;
  v39.size.double width = v25;
  v39.size.double height = v27;
  CGRect v40 = CGRectInset(v39, 1.0, 1.0);
  -[PGPictureInPictureViewControllerBackgroundView setFrame:](backgroundView, "setFrame:", v40.origin.x, v40.origin.y, v40.size.width, v40.size.height);
  -[PGControlsContainerView setFrame:](self->_controlsContainerView, "setFrame:", v21, v23, v25, v27);
  [(PGPictureInPictureViewControllerBackgroundView *)self->_backgroundView layoutIfNeeded];
  [(PGLayerHostView *)self->_contentView setNeedsLayout];
  [(PGLayerHostView *)self->_contentView layoutIfNeeded];
  [(PGControlsContainerView *)self->_controlsContainerView layoutIfNeeded];
  [(PGPictureInPictureViewController *)self _layoutStashTabViewsIfNeeded];
}

- (void)_layoutStashTabViewsIfNeeded
{
  [(UIView *)self->_containerView bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stashMaskView);
  if (WeakRetained && self->_tabShadowView)
  {
    id v23 = WeakRetained;
    id v12 = objc_loadWeakRetained((id *)&self->_stashMaskView);
    [v12 bounds];
    v30.origin.x = v4;
    v30.origin.y = v6;
    v30.size.double width = v8;
    v30.size.double height = v10;
    BOOL v13 = CGRectEqualToRect(v25, v30);

    if (!v13)
    {
      id v14 = objc_loadWeakRetained((id *)&self->_stashMaskView);
      objc_msgSend(v14, "setFrame:", v4, v6, v8, v10);

      id v15 = objc_loadWeakRetained((id *)&self->_stashMaskView);
      [v15 layoutIfNeeded];

      tabShadowView = self->_tabShadowView;
      id v17 = objc_loadWeakRetained((id *)&self->_stashMaskView);
      [v17 tabViewBounds];
      -[UIView setBounds:](tabShadowView, "setBounds:");

      double v18 = self->_tabShadowView;
      id v19 = objc_loadWeakRetained((id *)&self->_stashMaskView);
      [v19 position];
      -[UIView setPosition:](v18, "setPosition:");

      [(UIView *)self->_tabShadowView layoutIfNeeded];
      leftSideContentPortalView = self->_leftSideContentPortalView;
      v26.origin.x = v4;
      v26.origin.y = v6;
      v26.size.double width = v8;
      v26.size.double height = v10;
      CGRect v27 = CGRectOffset(v26, -(v8 + -1.0), 0.0);
      -[PGPortalView setFrame:](leftSideContentPortalView, "setFrame:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);
      rightSideContentPortalView = self->_rightSideContentPortalView;
      v28.origin.x = v4;
      v28.origin.y = v6;
      v28.size.double width = v8;
      v28.size.double height = v10;
      CGRect v29 = CGRectOffset(v28, v8 + -1.0, 0.0);
      -[PGPortalView setFrame:](rightSideContentPortalView, "setFrame:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
      [(PGPortalView *)self->_leftSideContentPortalView layoutIfNeeded];
      [(PGPortalView *)self->_rightSideContentPortalView layoutIfNeeded];
      -[PGStashView setFrame:](self->_stashView, "setFrame:", v4, v6, v8, v10);
      stashView = self->_stashView;
      [(PGStashView *)stashView layoutIfNeeded];
    }
  }
  else
  {
  }
}

- (void)_setStashedTabHidden:(BOOL)a3 left:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (!a3)
  {
    [(UIView *)self->_tabShadowView setAlpha:0.0];
    [(UIView *)self->_tabShadowView setHidden:0];
    [(PGPictureInPictureViewController *)self _setPortalActive:1 left:v4];
    [(PGPictureInPictureViewController *)self _setStashMaskActive:1];
  }
  [(PGControlsContainerView *)self->_controlsContainerView setControlsContainerHidden:!self->_isShowingChrome animated:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stashMaskView);
  [WeakRetained setTabHidden:v5 left:v4];

  stashView = self->_stashView;

  [(PGStashView *)stashView setChevronHidden:v5 left:v4];
}

- (void)_setPortalActive:(BOOL)a3 left:(BOOL)a4
{
  BOOL v4 = a4;
  if (self->_portalsWereActive != a3 || self->_portalsWereActiveLeft != a4)
  {
    self->_portalsWereActive = a3;
    self->_portalsWereActiveLeft = a4;
    leftSideContentPortalView = self->_leftSideContentPortalView;
    BOOL v7 = !a3;
    BOOL v8 = a3 && a4;
    if (a3 && a4) {
      contentView = self->_contentView;
    }
    else {
      contentView = 0;
    }
    [(PGPortalView *)leftSideContentPortalView setSourceView:contentView];
    uint64_t v10 = v7 | v4;
    if (v10) {
      double v11 = 0;
    }
    else {
      double v11 = self->_contentView;
    }
    [(PGPortalView *)self->_rightSideContentPortalView setSourceView:v11];
    [(PGPortalView *)self->_leftSideContentPortalView setHidden:!v8];
    rightSideContentPortalView = self->_rightSideContentPortalView;
    [(PGPortalView *)rightSideContentPortalView setHidden:v10];
  }
}

- (void)_setStashMaskActive:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    BOOL v5 = [(UIView *)self->_containerView maskView];

    if (v5) {
      goto LABEL_6;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_stashMaskView);
    [WeakRetained setHidden:0];

    containerView = self->_containerView;
    id v8 = objc_loadWeakRetained((id *)&self->_stashMaskView);
    [(UIView *)containerView setMaskView:v8];

    double v9 = [(PGPictureInPictureViewController *)self view];
    id v10 = objc_loadWeakRetained((id *)&self->_stashMaskView);
    [v9 setHitTestExtenderView:v10];
  }
  else
  {
    objc_storeWeak((id *)&self->_stashMaskView, 0);
    [(UIView *)self->_containerView setMaskView:0];
    [(PGPictureInPictureViewController *)self _addMaskViewSubviewIfNeeded];
    double v9 = [(PGPictureInPictureViewController *)self view];
    [v9 setHitTestExtenderView:0];
  }

LABEL_6:

  [(PGPictureInPictureViewController *)self _updateContentCornerRadiusForMaskActive:v3];
}

- (void)_updateContentCornerRadiusForMaskActive:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __76__PGPictureInPictureViewController__updateContentCornerRadiusForMaskActive___block_invoke;
  v3[3] = &unk_1E610C640;
  BOOL v4 = a3;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E4F42FF0], "PG_performWithoutRetargetingAnimation:", v3);
}

uint64_t __76__PGPictureInPictureViewController__updateContentCornerRadiusForMaskActive___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40)
    && [*(id *)(*(void *)(a1 + 32) + 1008) ignoreCornerRadiusUpdates])
  {
    [*(id *)(*(void *)(a1 + 32) + 1008) setIgnoreCornerRadiusUpdates:0];
  }
  [*(id *)(*(void *)(a1 + 32) + 1008) _setContinuousCornerRadius:0.0];
  [*(id *)(*(void *)(a1 + 32) + 1008) setIgnoreCornerRadiusUpdates:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _updateCornerRadii];
}

- (void)_resetStashTabViewsIfPossible
{
  if (self->_stashTabHidden)
  {
    BOOL v3 = [(UIView *)self->_containerView maskView];

    if (v3)
    {
      if (self->_interactivelyResizing || ![(PGStashView *)self->_stashView isHidden])
      {
        [(PGPictureInPictureViewController *)self _updateContentCornerRadiusForMaskActive:0];
      }
      else
      {
        BOOL v4 = PGLogCommon();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B5645000, v4, OS_LOG_TYPE_DEFAULT, "[Layout] Removing Stash Tab Views", buf, 2u);
        }

        v5[0] = MEMORY[0x1E4F143A8];
        v5[1] = 3221225472;
        v5[2] = __65__PGPictureInPictureViewController__resetStashTabViewsIfPossible__block_invoke;
        v5[3] = &unk_1E610C280;
        v5[4] = self;
        objc_msgSend(MEMORY[0x1E4F42FF0], "PG_performWithoutRetargetingAnimation:", v5);
      }
    }
  }
}

uint64_t __65__PGPictureInPictureViewController__resetStashTabViewsIfPossible__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1040) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 1040) setHidden:1];
  [*(id *)(a1 + 32) _setPortalActive:0 left:0];
  [*(id *)(a1 + 32) _setStashMaskActive:0];
  [*(id *)(*(void *)(a1 + 32) + 1048) resetChevronState];
  [*(id *)(*(void *)(a1 + 32) + 1040) layoutIfNeeded];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1048);

  return [v2 layoutIfNeeded];
}

- (UIView)contentContainerView
{
  return self->_containerView;
}

- (double)preferredMinimumWidth
{
  [(PGControlsViewModel *)self->_viewModel preferredMinimumWidth];
  return result;
}

- (CGSize)preferredContentSize
{
  double width = self->_preferredContentSize.width;
  double height = self->_preferredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  if (self->_preferredContentSize.width != a3.width || self->_preferredContentSize.height != a3.height)
  {
    self->_preferredContentSize = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
    [WeakRetained preferredContentSizeDidChangeForPictureInPictureViewController];
  }
}

- (BOOL)shouldAutorotate
{
  return self->_controlsStyle != 5;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  if (![(PGPictureInPictureViewController *)self shouldAutorotate]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)PGPictureInPictureViewController;
  return (int64_t)[(PGPictureInPictureViewController *)&v4 interfaceOrientation];
}

- (void)prepareStartAnimationWithInitialInterfaceOrientation:(int64_t)a3 initialLayerFrame:(CGRect)a4 completionHandler:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  double v11 = (void (**)(void))a5;
  if (([(PGPictureInPictureViewController *)self isViewLoaded] & 1) == 0)
  {
    id v12 = PGLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureViewController showChrome:animated:]();
    }
  }
  BOOL v13 = PGLogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = _PGLogMethodProem(self, 1);
    v28.origin.double x = x;
    v28.origin.double y = y;
    v28.size.double width = width;
    v28.size.double height = height;
    id v15 = NSStringFromCGRect(v28);
    *(_DWORD *)buf = 138543618;
    double v24 = v14;
    __int16 v25 = 2112;
    CGRect v26 = v15;
    _os_log_impl(&dword_1B5645000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Preparing animation with initial layer frame: %@", buf, 0x16u);
  }
  v29.origin.double x = x;
  v29.origin.double y = y;
  v29.size.double width = width;
  v29.size.double height = height;
  BOOL IsNull = CGRectIsNull(v29);
  self->_initialLayerFrameBOOL IsNull = IsNull;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
  double v18 = WeakRetained;
  if (IsNull)
  {
    char v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) == 0)
    {
      double v20 = [(PGPictureInPictureViewController *)self view];
      [v20 setAlpha:0.0];

      double v21 = [(PGPictureInPictureViewController *)self view];
      CGAffineTransformMakeScale(&v22, 0.100000001, 0.100000001);
      [v21 setTransform:&v22];
    }
    v11[2](v11);
  }
  else
  {
    objc_msgSend(WeakRetained, "prepareStartAnimationWithInitialInterfaceOrientation:initialLayerFrame:completionHandler:", a3, v11, x, y, width, height);
  }
}

- (void)performStartAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (([(PGPictureInPictureViewController *)self isViewLoaded] & 1) == 0)
  {
    BOOL v7 = PGLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureViewController showChrome:animated:]();
    }
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __79__PGPictureInPictureViewController_performStartAnimated_withCompletionHandler___block_invoke;
  v28[3] = &unk_1E610CAE8;
  v28[4] = self;
  id v8 = v6;
  id v29 = v8;
  double v9 = (void (**)(void))MEMORY[0x1BA99D810](v28);
  [(PGPictureInPictureViewController *)self acquireInterfaceOrientationLock];
  [(PGPictureInPictureViewController *)self showChrome:0 animated:0];
  if (v4)
  {
    [(PGPictureInPictureViewController *)self _performStartAnimationWithCompletionHandler:v9];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_contentContainer);
      [v12 performStartInIsolationWithCompletionHandler:v9];
    }
    else
    {
      v9[2](v9);
    }
  }
  if (self->_analyticsSessionUUID)
  {
    BOOL v13 = PGLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureViewController performStartAnimated:withCompletionHandler:](v13);
    }
  }
  int64_t v14 = [(PGPictureInPictureViewController *)self contentType];
  id v15 = [MEMORY[0x1E4F29128] UUID];
  analyticsSessionUUID = self->_analyticsSessionUUID;
  self->_analyticsSessionUUID = v15;

  id v17 = objc_loadWeakRetained((id *)&self->_application);
  uint64_t v18 = [v17 bundleIdentifier];
  char v19 = (void *)v18;
  double v20 = @"com.apple.MissingBundleIdentifier";
  if (v18) {
    double v20 = (__CFString *)v18;
  }
  double v21 = v20;

  id v22 = objc_loadWeakRetained((id *)&self->_analyticsDelegate);
  [v22 pictureInPictureDidCreateAnalyticsSessionWithUUID:self->_analyticsSessionUUID bundleIdentifier:v21 contentType:v14];

  id v23 = objc_loadWeakRetained((id *)&self->_analyticsDelegate);
  [v23 pictureInPictureDidActivateAnalyticsSessionWithUUID:self->_analyticsSessionUUID analyticsSourceUUID:self->_analyticsSourceUUID automatically:self->_startedAutomatically];

  if ([(PGPictureInPictureViewController *)self contentType] == 6)
  {
    objc_initWeak(&location, self);
    dispatch_time_t v24 = dispatch_time(0, 5000000000);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __79__PGPictureInPictureViewController_performStartAnimated_withCompletionHandler___block_invoke_165;
    v25[3] = &unk_1E610CEE0;
    objc_copyWeak(&v26, &location);
    dispatch_after(v24, MEMORY[0x1E4F14428], v25);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
}

void __79__PGPictureInPictureViewController_performStartAnimated_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2[1201])
  {
    if (v3)
    {
      [*(id *)(a1 + 32) showChrome:1 animated:0];
      [*(id *)(a1 + 32) relinquishInterfaceOrientationLock];
      [*(id *)(a1 + 32) _insertContentContainerViewIfNeeded];
      BOOL v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      v4();
      return;
    }
  }
  else if (v3)
  {
    objc_initWeak(&location, v2);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __79__PGPictureInPictureViewController_performStartAnimated_withCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E610CEB8;
    objc_copyWeak(&v11, &location);
    id v10 = *(id *)(a1 + 40);
    uint64_t v5 = MEMORY[0x1BA99D810](v9);
    uint64_t v6 = *(void *)(a1 + 32);
    BOOL v7 = *(void **)(v6 + 1280);
    *(void *)(v6 + 1280) = v5;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    return;
  }
  id v8 = *(void **)(a1 + 32);

  [v8 _insertContentContainerViewIfNeeded];
}

void __79__PGPictureInPictureViewController_performStartAnimated_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [WeakRetained _updateCornerRadii];
    [WeakRetained showChrome:1 animated:1];
    [WeakRetained relinquishInterfaceOrientationLock];
    [WeakRetained _insertContentContainerViewIfNeeded];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__PGPictureInPictureViewController_performStartAnimated_withCompletionHandler___block_invoke_165(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained contentType] == 6 && (objc_msgSend(WeakRetained, "stashed") & 1) == 0)
  {
    uint64_t v1 = [WeakRetained contentContainer];
    char v2 = objc_opt_respondsToSelector();

    if (v2)
    {
      uint64_t v3 = [WeakRetained contentContainer];
      [v3 pictureInPictureClientDidRequestStashing];
    }
  }
}

- (void)_performStartAnimationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__PGPictureInPictureViewController__performStartAnimationWithCompletionHandler___block_invoke;
  v17[3] = &unk_1E610CAE8;
  void v17[4] = self;
  id v5 = v4;
  id v18 = v5;
  uint64_t v6 = (void *)MEMORY[0x1BA99D810](v17);
  BOOL v7 = [MEMORY[0x1E4F42738] sharedApplication];
  [v7 beginIgnoringInteractionEvents];

  [(PGPictureInPictureViewController *)self showChrome:1 animated:1];
  initialLayerFrameBOOL IsNull = self->_initialLayerFrameIsNull;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
  id v10 = WeakRetained;
  if (initialLayerFrameIsNull)
  {
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_contentContainer);
      [v12 performStartInIsolationWithCompletionHandler:v6];
    }
    else
    {
      BOOL v13 = (void *)MEMORY[0x1E4F42FF0];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __80__PGPictureInPictureViewController__performStartAnimationWithCompletionHandler___block_invoke_2;
      void v16[3] = &unk_1E610C280;
      v16[4] = self;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __80__PGPictureInPictureViewController__performStartAnimationWithCompletionHandler___block_invoke_3;
      v14[3] = &unk_1E610CF08;
      id v15 = v6;
      objc_msgSend(v13, "PG_animateUsingDefaultTimingWithAnimations:completion:", v16, v14);
    }
  }
  else
  {
    [WeakRetained performStartAnimationWithCompletionHandler:v6];
  }
}

uint64_t __80__PGPictureInPictureViewController__performStartAnimationWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 1201)) {
    [*(id *)(v2 + 1016) setControlsContainerHidden:0 animated:1];
  }
  uint64_t v3 = [MEMORY[0x1E4F42738] sharedApplication];
  [v3 endIgnoringInteractionEvents];

  [*(id *)(a1 + 32) relinquishInterfaceOrientationLock];
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

void __80__PGPictureInPictureViewController__performStartAnimationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:1.0];

  uint64_t v3 = [*(id *)(a1 + 32) view];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v3 setTransform:v5];
}

uint64_t __80__PGPictureInPictureViewController__performStartAnimationWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performStopAnimated:(BOOL)a3 withFinalInterfaceOrientation:(int64_t)a4 finalLayerFrame:(CGRect)a5 completionHandler:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  BOOL v11 = a3;
  BOOL v13 = (void (**)(void))a6;
  if (([(PGPictureInPictureViewController *)self isViewLoaded] & 1) == 0)
  {
    int64_t v14 = PGLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureViewController showChrome:animated:]();
    }
  }
  if (v11)
  {
    -[PGPictureInPictureViewController _performStopAnimationWithFinalInterfaceOrientation:finalLayerFrame:completionHandler:](self, "_performStopAnimationWithFinalInterfaceOrientation:finalLayerFrame:completionHandler:", a4, v13, x, y, width, height);
  }
  else
  {
    [(PGControlsContainerView *)self->_controlsContainerView setControlsContainerHidden:1 animated:0];
    v13[2](v13);
  }
}

- (void)_performStopAnimationWithFinalInterfaceOrientation:(int64_t)a3 finalLayerFrame:(CGRect)a4 completionHandler:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a5;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __121__PGPictureInPictureViewController__performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke;
  v24[3] = &unk_1E610C280;
  v24[4] = self;
  id v12 = (void (**)(void))MEMORY[0x1BA99D810](v24);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __121__PGPictureInPictureViewController__performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_2;
  v22[3] = &unk_1E610CAE8;
  v22[4] = self;
  id v13 = v11;
  id v23 = v13;
  int64_t v14 = (void *)MEMORY[0x1BA99D810](v22);
  v12[2](v12);
  v25.origin.double x = x;
  v25.origin.double y = y;
  v25.size.double width = width;
  v25.size.double height = height;
  if (CGRectIsNull(v25))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
    char v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) == 0)
    {
      id v18 = (void *)MEMORY[0x1E4F42FF0];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __121__PGPictureInPictureViewController__performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_3;
      v21[3] = &unk_1E610C280;
      v21[4] = self;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __121__PGPictureInPictureViewController__performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_4;
      v19[3] = &unk_1E610CF08;
      id v20 = v14;
      objc_msgSend(v18, "PG_animateUsingDefaultTimingWithAnimations:completion:", v21, v19);

      goto LABEL_7;
    }
    id v17 = objc_loadWeakRetained((id *)&self->_contentContainer);
    [v17 performStopInIsolationWithCompletionHandler:v14];
  }
  else
  {
    [(PGPictureInPictureViewController *)self showChrome:0 animated:1];
    id v17 = objc_loadWeakRetained((id *)&self->_contentContainer);
    objc_msgSend(v17, "performStopAnimationWithFinalInterfaceOrientation:finalLayerFrame:completionHandler:", a3, v14, x, y, width, height);
  }

LABEL_7:
}

uint64_t __121__PGPictureInPictureViewController__performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F42738] sharedApplication];
  [v2 beginIgnoringInteractionEvents];

  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1016);

  return [v3 setControlsContainerHidden:1 animated:0];
}

uint64_t __121__PGPictureInPictureViewController__performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F42738] sharedApplication];
  [v2 endIgnoringInteractionEvents];

  [*(id *)(a1 + 32) relinquishInterfaceOrientationLock];
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __121__PGPictureInPictureViewController__performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:0.0];

  uint64_t v3 = [*(id *)(a1 + 32) view];
  CGAffineTransformMakeScale(&v4, 0.100000001, 0.100000001);
  [v3 setTransform:&v4];
}

uint64_t __121__PGPictureInPictureViewController__performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performSuspendAnimationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (([(PGPictureInPictureViewController *)self isViewLoaded] & 1) == 0)
  {
    id v5 = PGLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureViewController showChrome:animated:]();
    }
  }
  self->_isSuspended = 1;
  uint64_t v6 = [MEMORY[0x1E4F42738] sharedApplication];
  [v6 beginIgnoringInteractionEvents];

  [(PGControlsContainerView *)self->_controlsContainerView setControlsContainerHidden:1 animated:1];
  BOOL v7 = (void *)MEMORY[0x1E4F42FF0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__PGPictureInPictureViewController_performSuspendAnimationWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E610C280;
  void v11[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__PGPictureInPictureViewController_performSuspendAnimationWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E610CC00;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  objc_msgSend(v7, "PG_animateUsingDefaultTimingWithAnimations:completion:", v11, v9);
}

void __81__PGPictureInPictureViewController_performSuspendAnimationWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:0.0];

  uint64_t v3 = [*(id *)(a1 + 32) view];
  CGAffineTransformMakeScale(&v4, 0.100000001, 0.100000001);
  [v3 setTransform:&v4];
}

uint64_t __81__PGPictureInPictureViewController_performSuspendAnimationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F42738] sharedApplication];
  [v2 endIgnoringInteractionEvents];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 _updatePrefersIdleTimerDisabled];
}

- (void)performResumeAnimationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (([(PGPictureInPictureViewController *)self isViewLoaded] & 1) == 0)
  {
    id v5 = PGLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureViewController showChrome:animated:]();
    }
  }
  self->_isSuspended = 0;
  uint64_t v6 = [MEMORY[0x1E4F42738] sharedApplication];
  [v6 beginIgnoringInteractionEvents];

  BOOL v7 = (void *)MEMORY[0x1E4F42FF0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__PGPictureInPictureViewController_performResumeAnimationWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E610C280;
  void v11[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__PGPictureInPictureViewController_performResumeAnimationWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E610CF30;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  objc_msgSend(v7, "PG_animateUsingDefaultTimingWithAnimations:completion:", v11, v9);
}

void __80__PGPictureInPictureViewController_performResumeAnimationWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:1.0];

  uint64_t v3 = [*(id *)(a1 + 32) view];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v3 setTransform:v5];
}

uint64_t __80__PGPictureInPictureViewController_performResumeAnimationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 1201)) {
    [*(id *)(v2 + 1016) setControlsContainerHidden:0 animated:1];
  }
  uint64_t v3 = [MEMORY[0x1E4F42738] sharedApplication];
  [v3 endIgnoringInteractionEvents];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  long long v4 = *(void **)(a1 + 32);

  return [v4 _updatePrefersIdleTimerDisabled];
}

- (void)performRotateAnimationWithRotation:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v6 = (void (**)(void))a4;
  if (([(PGPictureInPictureViewController *)self isViewLoaded] & 1) == 0)
  {
    BOOL v7 = PGLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureViewController showChrome:animated:]();
    }
  }
  id v8 = [MEMORY[0x1E4F42738] sharedApplication];
  [v8 beginIgnoringInteractionEvents];

  [(PGControlsContainerView *)self->_controlsContainerView setControlsContainerHidden:1 animated:0];
  if ((*(unsigned char *)&self->_contentContainerRespondsTo & 0x20) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __89__PGPictureInPictureViewController_performRotateAnimationWithRotation_completionHandler___block_invoke;
    v10[3] = &unk_1E610CAE8;
    v10[4] = self;
    id v11 = v6;
    [WeakRetained performRotateAnimationWithRotation:a3 completionHandler:v10];
  }
  else
  {
    v6[2](v6);
  }
}

uint64_t __89__PGPictureInPictureViewController_performRotateAnimationWithRotation_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1016) setControlsContainerHidden:0 animated:0];
  uint64_t v2 = [MEMORY[0x1E4F42738] sharedApplication];
  [v2 endIgnoringInteractionEvents];

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void)prepareStopAnimationWithCompletionHandler:(id)a3
{
  long long v4 = (void (**)(void))a3;
  if (([(PGPictureInPictureViewController *)self isViewLoaded] & 1) == 0)
  {
    id v5 = PGLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureViewController showChrome:animated:]();
    }
  }
  [(PGPictureInPictureViewController *)self acquireInterfaceOrientationLock];
  if (*(unsigned char *)&self->_contentContainerRespondsTo)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
    [WeakRetained prepareStopAnimationWithCompletionHandler:v4];
  }
  else
  {
    v4[2](v4);
  }
}

- (void)acquireInterfaceOrientationLock
{
  if (([(PGPictureInPictureViewController *)self isViewLoaded] & 1) == 0)
  {
    uint64_t v3 = PGLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureViewController showChrome:animated:]();
    }
  }
  if ((*(unsigned char *)&self->_contentContainerRespondsTo & 2) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
    [WeakRetained acquireInterfaceOrientationLock];
  }
}

- (void)relinquishInterfaceOrientationLock
{
  if (([(PGPictureInPictureViewController *)self isViewLoaded] & 1) == 0)
  {
    uint64_t v3 = PGLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureViewController showChrome:animated:]();
    }
  }
  if ((*(unsigned char *)&self->_contentContainerRespondsTo & 4) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
    [WeakRetained relinquishInterfaceOrientationLock];
  }
}

- (BOOL)isInterrupted
{
  return [(PGControlsViewModel *)self->_viewModel isInterrupted];
}

- (void)setInterrupted:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(PGPictureInPictureViewController *)self isInterrupted];
  [(PGControlsViewModel *)self->_viewModel setInterrupted:v3];
  [(PGPictureInPictureViewController *)self _updatePrefersIdleTimerDisabled];
  if (v5 != v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tetheringViewController);
    [WeakRetained flashControls];

    if (!v3)
    {
      if ([(PGPictureInPictureViewController *)self isViewLoaded])
      {
        BOOL v7 = [(PGPictureInPictureViewController *)self view];
        [v7 alpha];
        double v9 = v8;

        if (v9 == 0.0)
        {
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          v10[2] = __51__PGPictureInPictureViewController_setInterrupted___block_invoke;
          v10[3] = &unk_1E610C280;
          v10[4] = self;
          objc_msgSend(MEMORY[0x1E4F42FF0], "PG_animateUsingDefaultTimingWithAnimations:completion:", v10, 0);
        }
      }
    }
  }
}

void __51__PGPictureInPictureViewController_setInterrupted___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

- (void)setContentViewHidden:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(PGLayerHostView *)self->_contentView isHidden] != a3)
  {
    BOOL v5 = PGLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = _PGLogMethodProem(self, 1);
      int v7 = 138412546;
      double v8 = v6;
      __int16 v9 = 1024;
      BOOL v10 = v3;
      _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "%@ %{BOOL}u", (uint8_t *)&v7, 0x12u);
    }
    [(PGLayerHostView *)self->_contentView setHidden:v3];
  }
}

- (void)setMenuItems:(id)a3
{
  long long v4 = (NSArray *)a3;
  BOOL v5 = v4;
  id v13 = v4;
  if (self->_menuItems != v4 || (v6 = [(NSArray *)v4 isEqualToArray:v4], BOOL v5 = v13, (v6 & 1) == 0))
  {
    int v7 = (NSArray *)[(NSArray *)v5 copy];
    menuItems = self->_menuItems;
    self->_menuItems = v7;

    p_contentContainer = &self->_contentContainer;
    id WeakRetained = objc_loadWeakRetained((id *)p_contentContainer);
    char v11 = objc_opt_respondsToSelector();

    BOOL v5 = v13;
    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)p_contentContainer);
      [v12 updateMenuItems];

      BOOL v5 = v13;
    }
  }

  MEMORY[0x1F41817F8](v6, v5);
}

- (void)setShouldDisablePointerInteraction:(BOOL)a3
{
  self->_shouldDisablePointerInteraction = a3;
  -[PGControlsContainerView setHoverGestureDisbaled:](self->_controlsContainerView, "setHoverGestureDisbaled:");
}

- (void)_handleTapWhileStashedGestureRecognizer:(id)a3
{
  if ((*(unsigned char *)&self->_contentContainerRespondsTo & 8) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
    [WeakRetained handleTapWhileStashedGesture];
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  if (self->_shouldDisablePointerInteraction) {
    return 0;
  }
  else {
    return a5;
  }
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  BOOL v5 = [(PGPictureInPictureViewController *)self view];
  char v6 = [v5 _isInAWindow];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F42ED8]);
    double v8 = [(PGPictureInPictureViewController *)self view];
    __int16 v9 = (void *)[v7 initWithView:v8];

    BOOL v10 = [(PGPictureInPictureViewController *)self tetheringViewController];

    if (v10)
    {
      char v11 = [MEMORY[0x1E4F42CA8] effectWithPreview:v9];
    }
    else
    {
      char v11 = [MEMORY[0x1E4F42C98] effectWithPreview:v9];
      [v11 setPrefersShadow:1];
      [v11 setPreferredTintMode:0];
    }
    id v13 = [MEMORY[0x1E4F42CC0] styleWithEffect:v11 shape:0];
  }
  else
  {
    id v12 = PGLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[PGPictureInPictureViewController pointerInteraction:styleForRegion:](v12);
    }

    id v13 = 0;
  }

  return v13;
}

- (void)handleCommand:(id)a3
{
  id v8 = a3;
  switch([v8 systemAction])
  {
    case 0:
    case 1:
    case 2:
      id WeakRetained = [(PGPictureInPictureViewController *)self delegate];
      [WeakRetained pictureInPictureViewController:self didReceiveCommand:v8];
      goto LABEL_3;
    case 3:
      char v6 = [(PGPictureInPictureViewController *)self delegate];
      [v6 pictureInPictureViewController:self didReceiveCommand:v8];

      if ([(PGPictureInPictureViewController *)self isInterrupted]) {
        [(PGLayerHostView *)self->_contentView setHidden:1];
      }
      break;
    case 4:
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"PGPictureInPictureViewController.m" lineNumber:1239 description:@"Toggle visibility action should not be sent to PictureInPictureViewController."];

      break;
    case 5:
      if ((*(unsigned char *)&self->_contentContainerRespondsTo & 0x10) != 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
        [WeakRetained handleDoubleTapGesture];
LABEL_3:
      }
      break;
    default:
      break;
  }
  [(PGPictureInPictureViewController *)self _updatePrefersIdleTimerDisabled];
}

- (void)updatePlaybackStateWithDiff:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = [(PGControlsViewModel *)self->_viewModel playbackState];
    int v22 = 136315650;
    id v23 = "-[PGPictureInPictureViewController updatePlaybackStateWithDiff:]";
    __int16 v24 = 2048;
    CGRect v25 = self;
    __int16 v26 = 2114;
    uint64_t v27 = v6;
    _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "%s %p REMOTE: %{public}@", (uint8_t *)&v22, 0x20u);
  }
  id v7 = [(PGControlsViewModel *)self->_viewModel playbackState];
  int v8 = [v7 isRoutingVideoToHostedWindow];

  [(PGControlsViewModel *)self->_viewModel updatePlaybackStateWithDiff:v4];
  [(PGPictureInPictureViewController *)self _updatePrefersIdleTimerDisabled];
  __int16 v9 = [(PGControlsViewModel *)self->_viewModel playbackState];
  uint64_t v10 = [v9 isRoutingVideoToHostedWindow];

  if (v8 != v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_contentContainer);
      [v13 playbackSourceDidUpdateIsRoutingVideoToHostedWindow:v10];
    }
  }
  [(PGPictureInPictureViewController *)self _updatePointerEffect];
  prefersHiddenFromClonedDispladouble y = self->_prefersHiddenFromClonedDisplay;
  id v15 = [(PGControlsViewModel *)self->_viewModel playbackState];
  int v16 = [v15 disablesLayerCloning];

  if (prefersHiddenFromClonedDisplay != v16)
  {
    id v17 = [(PGControlsViewModel *)self->_viewModel playbackState];
    self->_prefersHiddenFromClonedDispladouble y = [v17 disablesLayerCloning];

    p_contentContainer = &self->_contentContainer;
    id v19 = objc_loadWeakRetained((id *)p_contentContainer);
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      id v21 = objc_loadWeakRetained((id *)p_contentContainer);
      [v21 notePictureInPictureViewControllerPrefersHiddenFromClonedDisplayDidChange];
    }
  }
}

- (void)_loadShadowViewIfNeeded
{
  if ([(PGPictureInPictureViewController *)self isViewLoaded] && !self->_shadowView)
  {
    id v6 = [(PGPictureInPictureViewController *)self view];
    BOOL v3 = [(PGPictureInPictureViewController *)self _newShadowView];
    shadowView = self->_shadowView;
    self->_shadowView = v3;

    BOOL v5 = self->_shadowView;
    [v6 bounds];
    -[UIView setFrame:](v5, "setFrame:");
    [v6 insertSubview:self->_shadowView atIndex:0];
  }
}

- (id)_newShadowView
{
  id v3 = objc_alloc(MEMORY[0x1E4F42FF0]);
  id v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v4 setUserInteractionEnabled:0];
  BOOL v5 = [v4 layer];
  [v5 setAllowsEdgeAntialiasing:1];

  id v6 = [v4 layer];
  [v6 setShadowPathIsBounds:1];

  [(PGPictureInPictureViewController *)self _applyShadowSettingsToView:v4];
  return v4;
}

- (void)_applyShadowSettingsToView:(id)a3
{
  id v11 = a3;
  id v4 = [v11 layer];
  [(PGMobilePIPSettings *)self->_settings shadowOffsetX];
  double v6 = v5;
  [(PGMobilePIPSettings *)self->_settings shadowOffsetY];
  objc_msgSend(v4, "setShadowOffset:", v6, v7);

  int v8 = [v11 layer];
  [(PGMobilePIPSettings *)self->_settings shadowOpacity];
  *(float *)&double v9 = v9;
  [v8 setShadowOpacity:v9];

  uint64_t v10 = [v11 layer];
  [(PGMobilePIPSettings *)self->_settings shadowRadius];
  objc_msgSend(v10, "setShadowRadius:");

  [(PGMobilePIPSettings *)self->_settings shadowContinuousCornerRadius];
  objc_msgSend(v11, "_setContinuousCornerRadius:");
}

- (void)_updatePointerEffect
{
  id v3 = [(PGControlsViewModel *)self->_viewModel values];
  int v4 = [v3 includesRestoreButton];

  p_pointerInteraction = &self->_pointerInteraction;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pointerInteraction);
  if (v4)
  {
    if (WeakRetained)
    {
      id v9 = WeakRetained;
      double v7 = [(PGPictureInPictureViewController *)self view];
      [v7 removeInteraction:v9];

      objc_storeWeak((id *)p_pointerInteraction, 0);
LABEL_7:
      id WeakRetained = v9;
    }
  }
  else if (!WeakRetained)
  {
    if (![(PGPictureInPictureViewController *)self isViewLoaded]) {
      return;
    }
    id v9 = (id)[objc_alloc(MEMORY[0x1E4F42CA0]) initWithDelegate:self];
    objc_storeWeak((id *)&self->_pointerInteraction, v9);
    int v8 = [(PGPictureInPictureViewController *)self view];
    [v8 addInteraction:v9];

    goto LABEL_7;
  }
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  -[PGPictureInPictureViewController _applyShadowSettingsToView:](self, "_applyShadowSettingsToView:", self->_shadowView, a4);
  tabShadowView = self->_tabShadowView;

  [(PGPictureInPictureViewController *)self _applyShadowSettingsToView:tabShadowView];
}

- (void)_loadTabShadowViewIfNeeded
{
  if ([(PGPictureInPictureViewController *)self isViewLoaded] && !self->_tabShadowView)
  {
    id v3 = [(PGPictureInPictureViewController *)self _newShadowView];
    tabShadowView = self->_tabShadowView;
    self->_tabShadowView = v3;

    [(UIView *)self->_tabShadowView setHidden:1];
    id v5 = [(PGPictureInPictureViewController *)self view];
    [v5 insertSubview:self->_tabShadowView atIndex:0];
  }
}

- (void)_addMaskViewSubviewIfNeeded
{
  if ([(PGPictureInPictureViewController *)self isViewLoaded])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_stashMaskView);

    if (!WeakRetained)
    {
      int v4 = [PGStashedMaskView alloc];
      [(UIView *)self->_containerView bounds];
      id obj = -[PGStashedMaskView initWithFrame:minimumStashTabSize:](v4, "initWithFrame:minimumStashTabSize:");
      [(PGPictureInPictureViewController *)self _loadTabShadowViewIfNeeded];
      [(PGStashedMaskView *)obj setTabShadowView:self->_tabShadowView];
      [(PGStashedMaskView *)obj setHidden:1];
      [(UIView *)self->_containerView addSubview:obj];
      objc_storeWeak((id *)&self->_stashMaskView, obj);
    }
  }
}

- (void)_updatePrefersIdleTimerDisabled
{
  int prefersIdleTimerDisabled = self->_prefersIdleTimerDisabled;
  if (self->_stashed || self->_isSuspended || [(PGPictureInPictureViewController *)self isInterrupted])
  {
    int v4 = 0;
  }
  else
  {
    id v5 = [(PGControlsViewModel *)self->_viewModel playbackState];
    unint64_t v6 = [v5 contentType];
    if (v6 > 5)
    {
      int v4 = 0;
    }
    else if (((1 << v6) & 0x31) != 0 || ((1 << v6) & 6) == 0)
    {
      int v4 = 1;
    }
    else
    {
      [v5 playbackRate];
      int v4 = v7 != 0.0;
    }
  }
  if (prefersIdleTimerDisabled != v4)
  {
    self->_int prefersIdleTimerDisabled = v4;
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"PGPictureInPictureViewControllerPrefersIdleTimerDisabledDidChangeNotification" object:self];
  }
}

- (void)_insertContentContainerViewIfNeeded
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(PGPictureInPictureViewController *)self canStartShowingChrome])
  {
    if ([(PGPictureInPictureViewController *)self isViewLoaded])
    {
      id v3 = [(UIView *)self->_containerView superview];
      int v4 = [(PGPictureInPictureViewController *)self view];

      if (v3 != v4)
      {
        id v5 = PGLogCommon();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136315394;
          id v13 = "-[PGPictureInPictureViewController _insertContentContainerViewIfNeeded]";
          __int16 v14 = 2048;
          id v15 = self;
          _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "%s %p ", (uint8_t *)&v12, 0x16u);
        }

        tabShadowView = self->_tabShadowView;
        BOOL v7 = tabShadowView == 0;
        BOOL v8 = tabShadowView != 0;
        uint64_t v9 = 1;
        if (!v7) {
          uint64_t v9 = 2;
        }
        if (self->_shadowView) {
          uint64_t v10 = v9;
        }
        else {
          uint64_t v10 = v8;
        }
        id v11 = [(PGPictureInPictureViewController *)self view];
        [v11 insertSubview:self->_containerView atIndex:v10];
      }
    }
  }
}

- (void)setCurrentContentCornerRadius:(double)a3
{
  self->_currentContentCornerRadius = a3;
}

- (PGPictureInPictureApplication)application
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_application);

  return (PGPictureInPictureApplication *)WeakRetained;
}

- (NSString)sourceSceneSessionPersistentIdentifier
{
  return self->_sourceSceneSessionPersistentIdentifier;
}

- (PGPictureInPictureViewControllerContentContainer)contentContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);

  return (PGPictureInPictureViewControllerContentContainer *)WeakRetained;
}

- (BOOL)canStartShowingChrome
{
  return self->_canStartShowingChrome;
}

- (PGPictureInPictureViewController)tetheredViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tetheredViewController);

  return (PGPictureInPictureViewController *)WeakRetained;
}

- (PGPictureInPictureViewController)tetheringViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tetheringViewController);

  return (PGPictureInPictureViewController *)WeakRetained;
}

- (int64_t)tetheringMode
{
  return self->_tetheringMode;
}

- (BOOL)isInteractivelyResizing
{
  return self->_interactivelyResizing;
}

- (CGSize)minimumStashTabSize
{
  double width = self->_minimumStashTabSize.width;
  double height = self->_minimumStashTabSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PGPictureInPicturePagingAccessoryViewController)pagingAccessoryViewController
{
  return self->_pagingAccessoryViewController;
}

- (void)setPagingAccessoryViewController:(id)a3
{
}

- (BOOL)stashed
{
  return self->_stashed;
}

- (BOOL)prefersStashTabSuppressed
{
  return self->_prefersStashTabSuppressed;
}

- (NSArray)menuItems
{
  return self->_menuItems;
}

- (BOOL)prefersHiddenFromClonedDisplay
{
  return self->_prefersHiddenFromClonedDisplay;
}

- (UIPointerInteraction)pointerInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pointerInteraction);

  return (UIPointerInteraction *)WeakRetained;
}

- (void)setPointerInteraction:(id)a3
{
}

- (id)waitForUIFinalizationCompletionBlock
{
  return self->_waitForUIFinalizationCompletionBlock;
}

- (void)setWaitForUIFinalizationCompletionBlock:(id)a3
{
}

- (int64_t)controlsStyle
{
  return self->_controlsStyle;
}

- (UIView)sceneView
{
  return self->_sceneView;
}

- (CGSize)microPIPSize
{
  double width = self->_microPIPSize.width;
  double height = self->_microPIPSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMicroPIPSize:(CGSize)a3
{
  self->_microPIPSize = a3;
}

- (PGHostedWindowHostingHandle)microPIPHostedWindowHostingHandle
{
  return self->_microPIPHostedWindowHostingHandle;
}

- (void)setMicroPIPHostedWindowHostingHandle:(id)a3
{
}

- (PGPictureInPictureViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PGPictureInPictureViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_microPIPHostedWindowHostingHandle, 0);
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong(&self->_waitForUIFinalizationCompletionBlock, 0);
  objc_destroyWeak((id *)&self->_pointerInteraction);
  objc_storeStrong((id *)&self->_menuItems, 0);
  objc_storeStrong((id *)&self->_pagingAccessoryViewController, 0);
  objc_destroyWeak((id *)&self->_tetheringViewController);
  objc_destroyWeak((id *)&self->_tetheredViewController);
  objc_storeStrong((id *)&self->_sourceSceneSessionPersistentIdentifier, 0);
  objc_destroyWeak((id *)&self->_application);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_analyticsSessionUUID, 0);
  objc_storeStrong((id *)&self->_analyticsSourceUUID, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_contentContainer);
  objc_storeStrong((id *)&self->_stashedTapGestureRecognizer, 0);
  objc_storeStrong(&self->_stashTabSpringBehavior, 0);
  objc_storeStrong((id *)&self->_rightSideContentPortalView, 0);
  objc_storeStrong((id *)&self->_leftSideContentPortalView, 0);
  objc_destroyWeak((id *)&self->_stashMaskView);
  objc_storeStrong((id *)&self->_stashView, 0);
  objc_storeStrong((id *)&self->_tabShadowView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_controlsContainerView, 0);
  objc_storeStrong((id *)&self->_contentClippingView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_hostedWindowHostingHandle, 0);
}

- (void)initWithApplication:sourceSceneSessionPersistentIdentifier:controlsStyle:.cold.1()
{
  OUTLINED_FUNCTION_2();
  id v1 = _PGLogMethodProem(v0, 1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B5645000, v2, v3, "%@", v4, v5, v6, v7, v8);
}

- (void)showChrome:animated:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  uint64_t v2 = _PGLogMethodProem(v0, v1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B5645000, v3, v4, "%@ may not be called before view is loaded!", v5, v6, v7, v8, v9);
}

- (void)performStartAnimated:(os_log_t)log withCompletionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_1B5645000, log, OS_LOG_TYPE_DEBUG, "Should have nil _analyticsSessionUUID", v1, 2u);
}

- (void)pointerInteraction:(os_log_t)log styleForRegion:.cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1B5645000, log, OS_LOG_TYPE_ERROR, "Pointer interaction view not in a window", v1, 2u);
}

@end