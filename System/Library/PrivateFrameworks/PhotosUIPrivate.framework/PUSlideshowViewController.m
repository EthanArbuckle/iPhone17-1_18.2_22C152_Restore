@interface PUSlideshowViewController
- (BOOL)_needsUpdateSpec;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (BOOL)pu_wantsNavigationBarVisible;
- (BOOL)pu_wantsTabBarVisible;
- (BOOL)pu_wantsToolbarVisible;
- (PHPlaceholderView)_slideshowPlaceholderView;
- (PUSlideshowSession)session;
- (PUSlideshowViewController)_secondScreenBrowser;
- (PUSlideshowViewController)initWithCoder:(id)a3;
- (PUSlideshowViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PUSlideshowViewController)initWithSession:(id)a3;
- (PUSlideshowViewController)initWithSession:(id)a3 mode:(unint64_t)a4;
- (PUSlideshowViewControllerDelegate)delegate;
- (UIViewController)_slideshowSettingsViewController;
- (id)ancestorViewOfInstance:(id)a3;
- (id)contentViewControllerForAirPlayController:(id)a3;
- (id)visibleAssets;
- (unint64_t)mode;
- (void)_airplayButtonTapped:(id)a3;
- (void)_dismissSlideshow;
- (void)_doneButtonTapped:(id)a3;
- (void)_handleAppWillResignActiveNotification:(id)a3;
- (void)_handleStateChange;
- (void)_installPresentationController:(id)a3;
- (void)_invalidateSpec;
- (void)_playerStateButtonTapped:(id)a3;
- (void)_removeCurrentPresentationController;
- (void)_removeSlideshowSettingsViewController;
- (void)_setNeedsUpdateSpec:(BOOL)a3;
- (void)_setSecondScreenBrowser:(id)a3;
- (void)_setSlideshowPlaceHolderView:(id)a3;
- (void)_setSlideshowSettingsViewController:(id)a3;
- (void)_settingsButtonTapped:(id)a3;
- (void)_setupChromeBar;
- (void)_setupTapGesture;
- (void)_tapGesture:(id)a3;
- (void)_updateAirplayButton;
- (void)_updateChromeVisibility;
- (void)_updateIfNeeded;
- (void)_updatePlaceholder;
- (void)_updatePlayerButton;
- (void)_updateRouteObservation;
- (void)_updateSpecIfNeeded;
- (void)airPlayControllerRouteAvailabilityChanged:(id)a3;
- (void)airPlayControllerScreenAvailabilityChanged:(id)a3;
- (void)couchPotatoPlaybackFinished;
- (void)dealloc;
- (void)finishSession;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)slideshowSession:(id)a3 startDisplayingPresentationViewController:(id)a4;
- (void)slideshowSession:(id)a3 stopDisplayingPresentationViewController:(id)a4;
- (void)viewControllerSpec:(id)a3 didChange:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewModel:(id)a3 didChange:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PUSlideshowViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__slideshowSettingsViewController, 0);
  objc_storeStrong((id *)&self->__slideshowPlaceholderView, 0);
  objc_storeStrong((id *)&self->__secondScreenBrowser, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_currentPresentationController, 0);
}

- (void)_setSlideshowSettingsViewController:(id)a3
{
}

- (UIViewController)_slideshowSettingsViewController
{
  return self->__slideshowSettingsViewController;
}

- (void)_setSlideshowPlaceHolderView:(id)a3
{
}

- (PHPlaceholderView)_slideshowPlaceholderView
{
  return self->__slideshowPlaceholderView;
}

- (void)_setNeedsUpdateSpec:(BOOL)a3
{
  self->__needsUpdateSpec = a3;
}

- (BOOL)_needsUpdateSpec
{
  return self->__needsUpdateSpec;
}

- (void)_setSecondScreenBrowser:(id)a3
{
}

- (PUSlideshowViewController)_secondScreenBrowser
{
  return self->__secondScreenBrowser;
}

- (void)setDelegate:(id)a3
{
}

- (PUSlideshowViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUSlideshowViewControllerDelegate *)WeakRetained;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (PUSlideshowSession)session
{
  return self->_session;
}

- (void)slideshowSession:(id)a3 stopDisplayingPresentationViewController:(id)a4
{
  if (self->_currentPresentationController == a4) {
    [(PUSlideshowViewController *)self _removeCurrentPresentationController];
  }
}

- (void)slideshowSession:(id)a3 startDisplayingPresentationViewController:(id)a4
{
}

- (void)airPlayControllerRouteAvailabilityChanged:(id)a3
{
  [(PUSlideshowViewController *)self _invalidateSpec];
  [(PUSlideshowViewController *)self _updateIfNeeded];
}

- (void)airPlayControllerScreenAvailabilityChanged:(id)a3
{
  if (![a3 screenAvailability])
  {
    v4 = [(PUSlideshowViewController *)self _secondScreenBrowser];
    [v4 finishSession];

    [(PUSlideshowViewController *)self _setSecondScreenBrowser:0];
  }
  [(PUSlideshowViewController *)self _invalidateSpec];
  [(PUSlideshowViewController *)self _updateIfNeeded];
}

- (id)contentViewControllerForAirPlayController:(id)a3
{
  v4 = [(PUSlideshowViewController *)self _secondScreenBrowser];
  if (!v4)
  {
    v5 = [(PUSlideshowViewController *)self session];
    v4 = [[PUSlideshowViewController alloc] initWithSession:v5 mode:1];
    [(PUSlideshowViewController *)self _setSecondScreenBrowser:v4];
  }
  return v4;
}

- (void)couchPotatoPlaybackFinished
{
  v2 = [(PUSlideshowViewController *)self session];
  v3 = [v2 viewModel];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__PUSlideshowViewController_couchPotatoPlaybackFinished__block_invoke;
  v5[3] = &unk_1E5F2ED10;
  id v6 = v3;
  id v4 = v3;
  [v4 performChanges:v5];
}

uint64_t __56__PUSlideshowViewController_couchPotatoPlaybackFinished__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentState:5];
}

- (id)ancestorViewOfInstance:(id)a3
{
  id v4 = a3;
  v5 = [(PUSlideshowViewController *)self view];
  id v6 = [v5 superview];

  if (v6)
  {
    v7 = v4;
    if (v6 != v4)
    {
      v7 = [v6 ancestorViewOfInstance:v4];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a4;
  if (self->_tapGestureRecognizer == a3
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    v8 = [v6 view];
    v9 = [(PUSlideshowViewController *)self view];
    v10 = [v8 ancestorViewOfInstance:v9];
    BOOL v7 = v10 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return self->_tapGestureRecognizer == a3;
}

- (BOOL)pu_wantsTabBarVisible
{
  return [(PUSlideshowViewControllerSpec *)self->_spec shouldShowChromeBars];
}

- (BOOL)pu_wantsToolbarVisible
{
  return [(PUSlideshowViewControllerSpec *)self->_spec shouldShowChromeBars];
}

- (BOOL)pu_wantsNavigationBarVisible
{
  return [(PUSlideshowViewControllerSpec *)self->_spec shouldShowChromeBars];
}

- (BOOL)prefersStatusBarHidden
{
  return ![(PUSlideshowViewControllerSpec *)self->_spec shouldShowChromeBars];
}

- (void)viewControllerSpec:(id)a3 didChange:(id)a4
{
  v8 = (PUSlideshowViewControllerSpec *)a3;
  id v6 = a4;
  if (self->_spec == v8)
  {
    if ([v6 shouldShowChromeBarsChanged])
    {
      [(PUSlideshowViewController *)self _updateChromeVisibility];
      if (![(PUSlideshowViewControllerSpec *)v8 isChromeVisible])
      {
        BOOL v7 = [(PUSlideshowViewController *)self _slideshowSettingsViewController];

        if (v7) {
          [(PUSlideshowViewController *)self _removeSlideshowSettingsViewController];
        }
      }
      [(PUSlideshowViewController *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
    }
    if ([v6 shouldObserveAirplayRouteChanged]) {
      [(PUSlideshowViewController *)self _updateRouteObservation];
    }
    if ([v6 shouldShowAirplayButtonChanged]) {
      [(PUSlideshowViewController *)self _updateAirplayButton];
    }
    if ([v6 shouldShowPlaceholderChanged]) {
      [(PUSlideshowViewController *)self _updatePlaceholder];
    }
  }
}

- (void)_updateSpecIfNeeded
{
  if ([(PUSlideshowViewController *)self _needsUpdateSpec])
  {
    [(PUSlideshowViewController *)self _setNeedsUpdateSpec:0];
    v3 = [(PUSlideshowSession *)self->_session viewModel];
    char v4 = [v3 wantsChromeVisible];

    v5 = +[PHAirPlayScreenController sharedInstance];
    BOOL v6 = [v5 screenAvailability] != 0;

    BOOL v7 = +[PHAirPlayScreenController sharedInstance];
    BOOL v8 = [v7 routeAvailability] == 1;

    spec = self->_spec;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__PUSlideshowViewController__updateSpecIfNeeded__block_invoke;
    v10[3] = &unk_1E5F2DA08;
    v10[4] = self;
    char v11 = v4;
    BOOL v12 = v6;
    BOOL v13 = v8;
    [(PUViewControllerSpec *)spec performChanges:v10];
  }
}

uint64_t __48__PUSlideshowViewController__updateSpecIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 984) setChromeVisible:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 984) setAirplayScreenAvailable:*(unsigned __int8 *)(a1 + 41)];
  v2 = *(void **)(*(void *)(a1 + 32) + 984);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 42);
  return [v2 setAirplayRouteAvailable:v3];
}

- (void)_invalidateSpec
{
  [(PUSlideshowViewController *)self _setNeedsUpdateSpec:1];
  [(PUSlideshowViewController *)self _setNeedsUpdate];
}

- (void)_updateIfNeeded
{
  if ([(PUSlideshowViewController *)self _needsUpdate])
  {
    [(PUSlideshowViewController *)self _updateSpecIfNeeded];
    if ([(PUSlideshowViewController *)self _needsUpdate])
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:a2 object:self file:@"PUSlideshowViewController.m" lineNumber:452 description:@"updates still needed after an update cycle"];
    }
  }
}

- (void)_updatePlaceholder
{
  BOOL v3 = [(PUSlideshowViewControllerSpec *)self->_spec shouldShowPlaceholder];
  id v4 = [(PUSlideshowViewController *)self _slideshowPlaceholderView];
  int v5 = !v3;
  if (v3 && !v4)
  {
    BOOL v6 = [[PHPlaceholderView alloc] initWithType:1];
    BOOL v7 = [(PUSlideshowViewController *)self view];
    [v7 bounds];
    -[PHPlaceholderView setFrame:](v6, "setFrame:");

    [(PHPlaceholderView *)v6 setAutoresizingMask:18];
    BOOL v8 = [(PUSlideshowViewController *)self view];
    [v8 addSubview:v6];

    v9 = v6;
LABEL_8:
    [(PUSlideshowViewController *)self _setSlideshowPlaceHolderView:v6];
    id v4 = v9;
    goto LABEL_9;
  }
  if (!v4) {
    int v5 = 0;
  }
  if (v5 == 1)
  {
    v9 = v4;
    [(PHPlaceholderView *)v4 removeFromSuperview];
    BOOL v6 = 0;
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_updateAirplayButton
{
  if ([(PUSlideshowViewControllerSpec *)self->_spec shouldShowAirplayButton]) {
    id v4 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:111 target:self action:sel__airplayButtonTapped_];
  }
  else {
    id v4 = 0;
  }
  BOOL v3 = [(PUSlideshowViewController *)self navigationItem];
  [v3 setRightBarButtonItem:v4 animated:1];
}

- (void)_updateRouteObservation
{
  BOOL v3 = [(PUSlideshowViewControllerSpec *)self->_spec shouldObserveAirplayRoute];
  id v4 = +[PHAirPlayScreenController sharedInstance];
  int v5 = v4;
  if (v3) {
    [v4 registerRouteObserver:self];
  }
  else {
    [v4 unregisterRouteObserver:self];
  }

  [(PUSlideshowViewController *)self _invalidateSpec];
  [(PUSlideshowViewController *)self _updateIfNeeded];
}

- (void)_updatePlayerButton
{
  id v7 = [(PUSlideshowSession *)self->_session viewModel];
  if ([v7 currentState] == 2) {
    uint64_t v3 = 18;
  }
  else {
    uint64_t v3 = 17;
  }
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:v3 target:self action:sel__playerStateButtonTapped_];
  int v5 = [(PUSlideshowViewController *)self toolbarItems];
  BOOL v6 = (void *)[v5 mutableCopy];

  [v6 replaceObjectAtIndex:self->_playerStateButtonItemIndex withObject:v4];
  [(PUSlideshowViewController *)self setToolbarItems:v6 animated:1];
}

- (void)_updateChromeVisibility
{
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v9 = a4;
  session = self->_session;
  id v7 = a3;
  id v8 = [(PUSlideshowSession *)session viewModel];

  if (v8 == v7)
  {
    if ([v9 wantsChromeVisibleDidChange])
    {
      [(PUSlideshowViewController *)self _invalidateSpec];
      [(PUSlideshowViewController *)self _updateIfNeeded];
    }
    if ([v9 currentStateDidChange]) {
      [(PUSlideshowViewController *)self _handleStateChange];
    }
  }
}

- (void)_removeSlideshowSettingsViewController
{
  uint64_t v3 = [(PUSlideshowViewController *)self presentedViewController];
  id v4 = [(PUSlideshowViewController *)self _slideshowSettingsViewController];
  char v5 = _removeSlideshowSettingsViewController_isDismissing;

  if (v3 == v4 && (v5 & 1) == 0)
  {
    _removeSlideshowSettingsViewController_isDismissing = 1;
    [(PUSlideshowViewController *)self dismissViewControllerAnimated:1 completion:&__block_literal_global_87568];
  }
}

void __67__PUSlideshowViewController__removeSlideshowSettingsViewController__block_invoke()
{
  _removeSlideshowSettingsViewController_isDismissing = 0;
}

- (void)_removeCurrentPresentationController
{
  currentPresentationController = self->_currentPresentationController;
  if (currentPresentationController)
  {
    id v4 = [(OKPresentationViewController *)currentPresentationController parentViewController];

    if (v4 == self)
    {
      [(OKPresentationViewController *)self->_currentPresentationController willMoveToParentViewController:0];
      char v5 = [(OKPresentationViewController *)self->_currentPresentationController view];
      [v5 removeFromSuperview];

      [(OKPresentationViewController *)self->_currentPresentationController removeFromParentViewController];
      BOOL v6 = self->_currentPresentationController;
      self->_currentPresentationController = 0;
    }
  }
}

- (void)viewWillLayoutSubviews
{
  v37.receiver = self;
  v37.super_class = (Class)PUSlideshowViewController;
  [(PUSlideshowViewController *)&v37 viewWillLayoutSubviews];
  uint64_t v3 = [(PUSlideshowSession *)self->_session settingsViewModel];
  id v4 = [v3 preset];

  char v5 = [v4 pluginIdentifier];
  int v6 = [v5 containsString:@"magazine"];

  if (v6)
  {
    id v7 = [(PUSlideshowViewController *)self view];
    id v8 = [v7 window];
    id v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "px_peripheryInsets");
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
    }
    else
    {
      v18 = [MEMORY[0x1E4FB1438] sharedApplication];
      v19 = objc_msgSend(v18, "px_firstKeyWindow");
      objc_msgSend(v19, "px_peripheryInsets");
      double v11 = v20;
      double v13 = v21;
      double v15 = v22;
      double v17 = v23;
    }
    if (v13 != *(double *)(MEMORY[0x1E4FB2848] + 8)
      || v11 != *MEMORY[0x1E4FB2848]
      || v17 != *(double *)(MEMORY[0x1E4FB2848] + 24)
      || v15 != *(double *)(MEMORY[0x1E4FB2848] + 16))
    {
      v27 = [(PUSlideshowViewController *)self view];
      [v27 bounds];
      double v29 = v13 + v28;
      double v31 = v11 + v30;
      double v33 = v32 - (v13 + v17);
      double v35 = v34 - (v11 + v15);

      v36 = [(OKPresentationViewController *)self->_currentPresentationController view];
      objc_msgSend(v36, "setBounds:", v29, v31, v33, v35);
    }
  }
}

- (void)_installPresentationController:(id)a3
{
  char v5 = (OKPresentationViewController *)a3;
  if (v5)
  {
    p_currentPresentationController = &self->_currentPresentationController;
    if (self->_currentPresentationController != v5)
    {
      double v14 = v5;
      objc_storeStrong((id *)&self->_currentPresentationController, a3);
      [(OKPresentationViewController *)*p_currentPresentationController setDelegate:self];
      [(PUSlideshowViewController *)self addChildViewController:*p_currentPresentationController];
      id v7 = [(OKPresentationViewController *)*p_currentPresentationController view];
      id v8 = [(PUSlideshowViewController *)self view];
      [v8 bounds];
      objc_msgSend(v7, "setFrame:");

      id v9 = [(OKPresentationViewController *)*p_currentPresentationController view];
      [v9 setAutoresizingMask:18];

      double v10 = [(OKPresentationViewController *)*p_currentPresentationController view];
      double v11 = [MEMORY[0x1E4FB1618] blackColor];
      [v10 setBackgroundColor:v11];

      double v12 = [(PUSlideshowViewController *)self view];
      double v13 = [(OKPresentationViewController *)*p_currentPresentationController view];
      [v12 addSubview:v13];

      [(OKPresentationViewController *)*p_currentPresentationController didMoveToParentViewController:self];
      char v5 = v14;
    }
  }
}

- (void)_dismissSlideshow
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PUSlideshowViewController__dismissSlideshow__block_invoke;
  aBlock[3] = &unk_1E5F2ED10;
  aBlock[4] = self;
  uint64_t v3 = (void (**)(void))_Block_copy(aBlock);
  id v4 = [(PUSlideshowViewController *)self presentedViewController];

  if (v4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46__PUSlideshowViewController__dismissSlideshow__block_invoke_2;
    v5[3] = &unk_1E5F2EBA0;
    int v6 = v3;
    [(PUSlideshowViewController *)self dismissViewControllerAnimated:1 completion:v5];
  }
  else
  {
    v3[2](v3);
  }
}

uint64_t __46__PUSlideshowViewController__dismissSlideshow__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1032));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1032));
    char v5 = *(void **)(a1 + 32);
    int v6 = [v5 visibleAssets];
    [v4 slideshowViewControllerDidFinish:v5 withVisibleAssets:v6];
  }
  id v7 = *(void **)(a1 + 32);
  return [v7 finishSession];
}

uint64_t __46__PUSlideshowViewController__dismissSlideshow__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleStateChange
{
  char v3 = [(PUSlideshowSession *)self->_session viewModel];
  uint64_t v4 = [v3 currentState];
  [(PUSlideshowViewController *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
  switch(v4)
  {
    case 1:
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __47__PUSlideshowViewController__handleStateChange__block_invoke;
      v16[3] = &unk_1E5F2ED10;
      id v17 = v3;
      [v17 performChanges:v16];
      [(PUSlideshowSession *)self->_session updatePresentationViewController];
      int v6 = [(PUSlideshowSession *)self->_session viewModel];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __47__PUSlideshowViewController__handleStateChange__block_invoke_2;
      v14[3] = &unk_1E5F2ED10;
      id v15 = v6;
      id v7 = v6;
      [v7 performChanges:v14];

      id v5 = v17;
      goto LABEL_7;
    case 2:
      [(OKPresentationViewController *)self->_currentPresentationController instantPlay];
      [(PUSlideshowViewController *)self _updatePlayerButton];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __47__PUSlideshowViewController__handleStateChange__block_invoke_3;
      v12[3] = &unk_1E5F2ED10;
      id v13 = v3;
      [v13 performChanges:v12];
      id v5 = v13;
      goto LABEL_7;
    case 3:
    case 5:
      [(OKPresentationViewController *)self->_currentPresentationController instantPause];
      [(PUSlideshowViewController *)self _updatePlayerButton];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __47__PUSlideshowViewController__handleStateChange__block_invoke_4;
      v10[3] = &unk_1E5F2ED10;
      id v11 = v3;
      [v11 performChanges:v10];
      id v5 = v11;
      goto LABEL_7;
    case 4:
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __47__PUSlideshowViewController__handleStateChange__block_invoke_5;
      v8[3] = &unk_1E5F2ED10;
      id v9 = v3;
      [v9 performChanges:v8];
      id v5 = v9;
LABEL_7:

      break;
    case 6:
      [(PUSlideshowViewController *)self _dismissSlideshow];
      break;
    default:
      break;
  }
}

uint64_t __47__PUSlideshowViewController__handleStateChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setWantsChromeVisible:1];
}

uint64_t __47__PUSlideshowViewController__handleStateChange__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentState:2];
}

uint64_t __47__PUSlideshowViewController__handleStateChange__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setWantsChromeVisible:0];
}

uint64_t __47__PUSlideshowViewController__handleStateChange__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setWantsChromeVisible:1];
}

uint64_t __47__PUSlideshowViewController__handleStateChange__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setWantsChromeVisible:1];
}

- (void)_handleAppWillResignActiveNotification:(id)a3
{
  char v3 = [(PUSlideshowSession *)self->_session viewModel];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__PUSlideshowViewController__handleAppWillResignActiveNotification___block_invoke;
  v5[3] = &unk_1E5F2ED10;
  id v6 = v3;
  id v4 = v3;
  [v4 performChanges:v5];
}

uint64_t __68__PUSlideshowViewController__handleAppWillResignActiveNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentState:3];
}

- (void)_settingsButtonTapped:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(PUSlideshowViewController *)self _slideshowSettingsViewController];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(PUSlideshowViewController *)self presentedViewController];

    if (v6 == v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = [[PUSlideshowSettingsViewController alloc] initWithSession:self->_session];
    [(PUSlideshowSettingsViewController *)v7 setDelegate:self];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v7];
    [v5 setModalPresentationStyle:7];
    [(PUSlideshowViewController *)self _setSlideshowSettingsViewController:v5];
  }
  id v8 = [v5 popoverPresentationController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 setBarButtonItem:v9];
  }
  [(PUSlideshowViewController *)self presentViewController:v5 animated:1 completion:0];

LABEL_8:
}

- (void)_airplayButtonTapped:(id)a3
{
  id v10 = objc_alloc_init(MEMORY[0x1E4FB2278]);
  uint64_t v4 = [v10 popoverPresentationController];
  id v5 = [(PUSlideshowViewController *)self navigationItem];
  id v6 = [v5 rightBarButtonItem];
  [v4 setBarButtonItem:v6];

  id v7 = [v10 popoverPresentationController];
  id v8 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
  [v7 setBackgroundColor:v8];

  [(PUSlideshowViewController *)self presentViewController:v10 animated:1 completion:0];
  id v9 = +[PHAirPlayScreenController sharedInstance];
  [v9 notifyDidPresentAirPlayRoutesFromSlideshow];
}

- (void)_doneButtonTapped:(id)a3
{
  char v3 = [(PUSlideshowSession *)self->_session viewModel];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__PUSlideshowViewController__doneButtonTapped___block_invoke;
  v5[3] = &unk_1E5F2ED10;
  id v6 = v3;
  id v4 = v3;
  [v4 performChanges:v5];
}

uint64_t __47__PUSlideshowViewController__doneButtonTapped___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentState:6];
}

- (void)_tapGesture:(id)a3
{
  if (![(PUSlideshowViewControllerSpec *)self->_spec isAirplayScreenAvailable])
  {
    id v4 = [(PUSlideshowSession *)self->_session viewModel];
    char v5 = [v4 wantsChromeVisible];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__PUSlideshowViewController__tapGesture___block_invoke;
    v7[3] = &unk_1E5F2E120;
    id v8 = v4;
    char v9 = v5;
    id v6 = v4;
    [v6 performChanges:v7];
  }
}

uint64_t __41__PUSlideshowViewController__tapGesture___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setWantsChromeVisible:*(unsigned char *)(a1 + 40) == 0 changeReason:1];
}

- (void)_playerStateButtonTapped:(id)a3
{
  char v3 = [(PUSlideshowSession *)self->_session viewModel];
  uint64_t v4 = [v3 currentState];
  uint64_t v5 = 2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__PUSlideshowViewController__playerStateButtonTapped___block_invoke;
  v7[3] = &unk_1E5F2E0A8;
  if (v4 == 2) {
    uint64_t v5 = 3;
  }
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  [v6 performChanges:v7];
}

uint64_t __54__PUSlideshowViewController__playerStateButtonTapped___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentState:*(void *)(a1 + 40)];
}

- (id)visibleAssets
{
  v2 = [(PUSlideshowSession *)self->_session presentationViewController];
  char v3 = [v2 visibleMediaObjects];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  [v4 removeObjectIdenticalTo:v5];

  return v4;
}

- (void)_setupTapGesture
{
  if (!self->_tapGestureRecognizer)
  {
    char v3 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__tapGesture_];
    [(UITapGestureRecognizer *)v3 setDelegate:self];
    [(UITapGestureRecognizer *)v3 setNumberOfTapsRequired:1];
    [(UITapGestureRecognizer *)v3 setNumberOfTouchesRequired:1];
    uint64_t v4 = [(PUSlideshowViewController *)self view];
    [v4 addGestureRecognizer:v3];

    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v3;
  }
}

- (void)_setupChromeBar
{
  v15[4] = *MEMORY[0x1E4F143B8];
  char v3 = [(PUSlideshowViewController *)self navigationItem];
  uint64_t v4 = PULocalizedString(@"SLIDESHOW_TITLE");
  [v3 setTitle:v4];

  uint64_t v5 = [(PUSlideshowViewController *)self navigationItem];
  [v5 setHidesBackButton:1];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__doneButtonTapped_];
  id v7 = objc_alloc(MEMORY[0x1E4FB14A8]);
  id v8 = PULocalizedString(@"SLIDESHOW_SETTINGS_BUTTON");
  uint64_t v9 = (void *)[v7 initWithTitle:v8 style:0 target:self action:sel__settingsButtonTapped_];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:18 target:self action:sel__playerStateButtonTapped_];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  double v12 = [(PUSlideshowViewController *)self navigationItem];
  [v12 setLeftBarButtonItem:v6];

  v15[0] = v11;
  v15[1] = v10;
  v15[2] = v11;
  v15[3] = v9;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];
  [(PUSlideshowViewController *)self setToolbarItems:v13];

  double v14 = [(PUSlideshowViewController *)self toolbarItems];
  self->_playerStateButtonItemIndex = [v14 indexOfObject:v10];
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  v2 = self;
  char v3 = [(PUSlideshowSession *)self->_session viewModel];
  uint64_t v4 = [v3 currentState];
  LOBYTE(v2) = (v4 == 2) & ~[(PUSlideshowViewControllerSpec *)v2->_spec shouldShowChromeBars];

  return (char)v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUSlideshowViewController;
  [(PUSlideshowViewController *)&v5 viewDidAppear:a3];
  if ([(PUSlideshowViewControllerSpec *)self->_spec shouldRegisterToAirplay])
  {
    uint64_t v4 = +[PHAirPlayScreenController sharedInstance];
    [v4 registerContentProvider:self];
  }
  else
  {
    [(PUSlideshowSession *)self->_session registerSlideshowDisplayContext:self];
  }
  [(PUSlideshowViewController *)self _invalidateSpec];
  [(PUSlideshowViewController *)self _updateIfNeeded];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PUSlideshowViewController;
  -[PUSlideshowViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  if ([(PUSlideshowViewControllerSpec *)self->_spec shouldRegisterToAirplay]) {
    [(PUSlideshowSession *)self->_session registerSlideshowDisplayContext:self];
  }
  [(UIViewController *)self pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:v3];
}

- (void)finishSession
{
  [(PUSlideshowSession *)self->_session unregisterSlideshowDisplayContext:self];
  BOOL v3 = [(PUSlideshowSession *)self->_session viewModel];
  [v3 unregisterChangeObserver:self];

  [(PUViewControllerSpec *)self->_spec unregisterChangeObserver:self];
  if ([(PUSlideshowViewControllerSpec *)self->_spec shouldRegisterToAirplay])
  {
    uint64_t v4 = +[PHAirPlayScreenController sharedInstance];
    [v4 unregisterContentProvider:self];

    objc_super v5 = +[PHAirPlayScreenController sharedInstance];
    [v5 unregisterRouteObserver:self];
  }
  if ([(PUSlideshowViewControllerSpec *)self->_spec shouldPauseWhenAppResignsActive])
  {
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:self name:*MEMORY[0x1E4FB2738] object:0];
  }
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PUSlideshowViewController;
  [(PUSlideshowViewController *)&v6 viewDidLoad];
  if ([(PUSlideshowViewControllerSpec *)self->_spec shouldUseChromeBars]) {
    [(PUSlideshowViewController *)self _setupChromeBar];
  }
  if ([(PUSlideshowViewControllerSpec *)self->_spec shouldUseTapGesture]) {
    [(PUSlideshowViewController *)self _setupTapGesture];
  }
  BOOL v3 = [(PUSlideshowSession *)self->_session viewModel];
  if (![v3 currentState])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __40__PUSlideshowViewController_viewDidLoad__block_invoke;
    v4[3] = &unk_1E5F2ED10;
    id v5 = v3;
    [v5 performChanges:v4];
  }
}

uint64_t __40__PUSlideshowViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentState:1];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  id v4 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(PUSlideshowViewController *)self setView:v4];
}

- (void)dealloc
{
  [(PUSlideshowViewController *)self finishSession];
  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowViewController;
  [(PUSlideshowViewController *)&v3 dealloc];
}

- (PUSlideshowViewController)initWithSession:(id)a3 mode:(unint64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    double v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PUSlideshowViewController.m", 69, @"Invalid parameter not satisfying: %@", @"session" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)PUSlideshowViewController;
  uint64_t v9 = [(PUSlideshowViewController *)&v17 initWithNibName:0 bundle:0];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_session, a3);
    v10->_mode = a4;
    id v11 = [[PUSlideshowViewControllerSpec alloc] initWithMode:a4];
    spec = v10->_spec;
    v10->_spec = v11;

    [(PUViewControllerSpec *)v10->_spec registerChangeObserver:v10];
    id v13 = [(PUSlideshowSession *)v10->_session viewModel];
    [v13 registerChangeObserver:v10];

    if ([(PUSlideshowViewControllerSpec *)v10->_spec shouldPauseWhenAppResignsActive])
    {
      double v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v14 addObserver:v10 selector:sel__handleAppWillResignActiveNotification_ name:*MEMORY[0x1E4FB2738] object:0];
    }
  }

  return v10;
}

- (PUSlideshowViewController)initWithSession:(id)a3
{
  return [(PUSlideshowViewController *)self initWithSession:a3 mode:0];
}

- (PUSlideshowViewController)initWithCoder:(id)a3
{
  return [(PUSlideshowViewController *)self initWithSession:0];
}

- (PUSlideshowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[PUSlideshowViewController initWithSession:](self, "initWithSession:", 0, a4);
}

@end