@interface TFBetaAppLaunchScreenViewController
- (SEL)_selectorForPresentorViewEvent:(unint64_t)a3;
- (TFBetaAppLaunchPresenter)presenter;
- (TFBetaAppLaunchScreenHost)launchScreenHost;
- (TFBetaAppLaunchScreenView)launchScreenView;
- (TFBetaAppLaunchScreenViewController)initWithPresenter:(id)a3;
- (UIBarButtonItem)cancelBarButtonItem;
- (id)_fadeTransition;
- (id)_pushTransition;
- (int64_t)_currentInterfaceOrientation;
- (void)_animateLaunchScreenViewWithUpdateBlock:(id)a3 transition:(id)a4;
- (void)_didPressExitLaunchScreenButton;
- (void)_didPressNavigationItemCancel;
- (void)_didPressOpenHowToSupportLinkButton;
- (void)_didPressShowHowToButton;
- (void)_updateForContainmentInHostEnvironment:(id)a3;
- (void)_updateNavigationBarForHostTraitCollection:(id)a3;
- (void)dismissAnimated:(BOOL)a3;
- (void)loadView;
- (void)setLaunchScreenHost:(id)a3;
- (void)setLaunchScreenView:(id)a3;
- (void)showHowToWithTitle:(id)a3 subtitle:(id)a4 screenshotImageDict:(id)a5 primaryButtonTitle:(id)a6 primaryButtonEvent:(unint64_t)a7 secondaryButtonTitle:(id)a8 secondaryButtonEvent:(unint64_t)a9 animated:(BOOL)a10;
- (void)showLoadingAnimated:(BOOL)a3;
- (void)showTestNotesWithTitle:(id)a3 lockup:(id)a4 testNotesTitle:(id)a5 testNotesText:(id)a6 primaryButtonTitle:(id)a7 primaryButtonEvent:(unint64_t)a8 animated:(BOOL)a9 fetchingOnImageFetcher:(id)a10;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation TFBetaAppLaunchScreenViewController

- (TFBetaAppLaunchScreenViewController)initWithPresenter:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TFBetaAppLaunchScreenViewController;
  v6 = [(TFBetaAppLaunchScreenViewController *)&v11 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presenter, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:v7 action:sel__didPressNavigationItemCancel];
    cancelBarButtonItem = v7->_cancelBarButtonItem;
    v7->_cancelBarButtonItem = (UIBarButtonItem *)v8;
  }
  return v7;
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [(TFBetaAppLaunchScreenViewController *)self setView:v3];

  v4 = [MEMORY[0x263F1C550] systemBackgroundColor];
  id v5 = [(TFBetaAppLaunchScreenViewController *)self view];
  [v5 setBackgroundColor:v4];

  v6 = [(TFBetaAppLaunchScreenViewController *)self view];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  v7 = [(TFBetaAppLaunchScreenViewController *)self view];
  [v7 setAutoresizingMask:18];

  uint64_t v8 = [TFBetaAppLaunchScreenView alloc];
  v9 = -[TFBetaAppLaunchScreenView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(TFBetaAppLaunchScreenViewController *)self setLaunchScreenView:v9];

  v10 = [(TFBetaAppLaunchScreenViewController *)self launchScreenView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v11 = [(TFBetaAppLaunchScreenViewController *)self launchScreenView];
  [v11 setAutoresizingMask:18];

  id v13 = [(TFBetaAppLaunchScreenViewController *)self view];
  v12 = [(TFBetaAppLaunchScreenViewController *)self launchScreenView];
  [v13 addSubview:v12];
}

- (void)viewDidLoad
{
  id v12 = [(TFBetaAppLaunchScreenViewController *)self view];
  [v12 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_super v11 = [(TFBetaAppLaunchScreenViewController *)self launchScreenView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TFBetaAppLaunchScreenViewController;
  [(TFBetaAppLaunchScreenViewController *)&v7 viewWillAppear:a3];
  double v4 = [(TFBetaAppLaunchScreenViewController *)self launchScreenHost];

  if (v4)
  {
    double v5 = [(TFBetaAppLaunchScreenViewController *)self launchScreenHost];
    [(TFBetaAppLaunchScreenViewController *)self _updateForContainmentInHostEnvironment:v5];
  }
  double v6 = [(TFBetaAppLaunchScreenViewController *)self presenter];
  [v6 update];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TFBetaAppLaunchScreenViewController;
  [(TFBetaAppLaunchScreenViewController *)&v7 viewDidDisappear:a3];
  double v4 = [(TFBetaAppLaunchScreenViewController *)self launchScreenHost];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    double v6 = [(TFBetaAppLaunchScreenViewController *)self launchScreenHost];
    [v6 performSelector:sel_launchScreenViewControllerWasDismissed_ withObject:self];
  }
}

- (void)viewSafeAreaInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)TFBetaAppLaunchScreenViewController;
  [(TFBetaAppLaunchScreenViewController *)&v4 viewSafeAreaInsetsDidChange];
  double v3 = [(TFBetaAppLaunchScreenViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)TFBetaAppLaunchScreenViewController;
  [(TFBetaAppLaunchScreenViewController *)&v13 viewDidLayoutSubviews];
  double v3 = [(TFBetaAppLaunchScreenViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(TFBetaAppLaunchScreenViewController *)self launchScreenView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)TFBetaAppLaunchScreenViewController;
  id v7 = a4;
  -[TFBetaAppLaunchScreenViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __90__TFBetaAppLaunchScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v11[3] = &unk_26468EB88;
  v11[4] = self;
  double v8 = (void *)MEMORY[0x223CADBF0](v11);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __90__TFBetaAppLaunchScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v10[3] = &unk_26468EB88;
  v10[4] = self;
  double v9 = (void *)MEMORY[0x223CADBF0](v10);
  [v7 animateAlongsideTransition:v8 completion:v9];
}

void __90__TFBetaAppLaunchScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) launchScreenView];
  [v1 setDeviceImageVisibility:0];
}

uint64_t __90__TFBetaAppLaunchScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) launchScreenView];
  objc_msgSend(v2, "setDeviceImageOrientation:", objc_msgSend(*(id *)(a1 + 32), "_currentInterfaceOrientation"));

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __90__TFBetaAppLaunchScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  v4[3] = &unk_26468EBB0;
  v4[4] = *(void *)(a1 + 32);
  return [MEMORY[0x263F1CB60] animateWithDuration:v4 animations:0.3];
}

void __90__TFBetaAppLaunchScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) launchScreenView];
  [v1 setDeviceImageVisibility:1];
}

- (int64_t)_currentInterfaceOrientation
{
  v2 = [MEMORY[0x263F1C408] sharedApplication];
  int64_t v3 = [v2 statusBarOrientation];

  return v3;
}

- (void)setLaunchScreenHost:(id)a3
{
  p_launchScreenHost = &self->_launchScreenHost;
  id v5 = a3;
  objc_storeWeak((id *)p_launchScreenHost, v5);
  [(TFBetaAppLaunchScreenViewController *)self _updateForContainmentInHostEnvironment:v5];
}

- (void)_updateForContainmentInHostEnvironment:(id)a3
{
  if (a3)
  {
    id v4 = [a3 traitCollection];
    [(TFBetaAppLaunchScreenViewController *)self _updateNavigationBarForHostTraitCollection:v4];
  }
}

- (void)showLoadingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__TFBetaAppLaunchScreenViewController_showLoadingAnimated___block_invoke;
  v8[3] = &unk_26468EBB0;
  v8[4] = self;
  uint64_t v5 = MEMORY[0x223CADBF0](v8, a2);
  double v6 = (void *)v5;
  if (v3)
  {
    id v7 = [(TFBetaAppLaunchScreenViewController *)self _fadeTransition];
    [(TFBetaAppLaunchScreenViewController *)self _animateLaunchScreenViewWithUpdateBlock:v6 transition:v7];
  }
  else
  {
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }
}

void __59__TFBetaAppLaunchScreenViewController_showLoadingAnimated___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) launchScreenView];
  [v1 prepareForState:0];
}

- (void)showTestNotesWithTitle:(id)a3 lockup:(id)a4 testNotesTitle:(id)a5 testNotesText:(id)a6 primaryButtonTitle:(id)a7 primaryButtonEvent:(unint64_t)a8 animated:(BOOL)a9 fetchingOnImageFetcher:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a10;
  v22 = [(TFBetaAppLaunchScreenViewController *)self launchScreenView];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __168__TFBetaAppLaunchScreenViewController_showTestNotesWithTitle_lockup_testNotesTitle_testNotesText_primaryButtonTitle_primaryButtonEvent_animated_fetchingOnImageFetcher___block_invoke;
  v38[3] = &unk_26468EBD8;
  id v23 = v22;
  id v39 = v23;
  id v40 = v16;
  id v24 = v17;
  id v41 = v24;
  id v42 = v18;
  id v43 = v19;
  id v44 = v20;
  v45 = self;
  unint64_t v46 = a8;
  id v37 = v20;
  id v36 = v19;
  id v35 = v18;
  id v25 = v16;
  v26 = (void (**)(void))MEMORY[0x223CADBF0](v38);
  v27 = [v24 iconArtwork];
  v28 = [v23 lockupView];
  [v28 displayedIconSize];
  double v30 = v29;
  double v32 = v31;
  v33 = [v23 lockupView];
  objc_msgSend(v21, "fetchIconArtwork:ofSize:intoView:animated:", v27, v33, a9, v30, v32);

  if (a9)
  {
    v34 = [(TFBetaAppLaunchScreenViewController *)self _fadeTransition];
    [(TFBetaAppLaunchScreenViewController *)self _animateLaunchScreenViewWithUpdateBlock:v26 transition:v34];
  }
  else
  {
    v26[2](v26);
  }
}

uint64_t __168__TFBetaAppLaunchScreenViewController_showTestNotesWithTitle_lockup_testNotesTitle_testNotesText_primaryButtonTitle_primaryButtonEvent_animated_fetchingOnImageFetcher___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) prepareForState:1];
  [*(id *)(a1 + 32) setTitle:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setLockup:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setBodyTitle:*(void *)(a1 + 56) bodyText:*(void *)(a1 + 64)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 72);
  id v4 = *(void **)(a1 + 80);
  uint64_t v5 = [v4 _selectorForPresentorViewEvent:*(void *)(a1 + 88)];

  return [v2 setPrimaryButtonTitle:v3 target:v4 action:v5];
}

- (void)showHowToWithTitle:(id)a3 subtitle:(id)a4 screenshotImageDict:(id)a5 primaryButtonTitle:(id)a6 primaryButtonEvent:(unint64_t)a7 secondaryButtonTitle:(id)a8 secondaryButtonEvent:(unint64_t)a9 animated:(BOOL)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = [(TFBetaAppLaunchScreenViewController *)self launchScreenView];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __176__TFBetaAppLaunchScreenViewController_showHowToWithTitle_subtitle_screenshotImageDict_primaryButtonTitle_primaryButtonEvent_secondaryButtonTitle_secondaryButtonEvent_animated___block_invoke;
  v31[3] = &unk_26468EC00;
  id v32 = v18;
  id v33 = v21;
  id v34 = v16;
  id v35 = v17;
  id v36 = self;
  id v37 = v19;
  id v38 = v20;
  unint64_t v39 = a7;
  unint64_t v40 = a9;
  id v22 = v20;
  id v23 = v19;
  id v24 = v17;
  id v25 = v16;
  id v26 = v21;
  id v27 = v18;
  uint64_t v28 = MEMORY[0x223CADBF0](v31);
  double v29 = (void *)v28;
  if (a10)
  {
    double v30 = [(TFBetaAppLaunchScreenViewController *)self _pushTransition];
    [(TFBetaAppLaunchScreenViewController *)self _animateLaunchScreenViewWithUpdateBlock:v29 transition:v30];
  }
  else
  {
    (*(void (**)(uint64_t))(v28 + 16))(v28);
  }
}

void __176__TFBetaAppLaunchScreenViewController_showHowToWithTitle_subtitle_screenshotImageDict_primaryButtonTitle_primaryButtonEvent_secondaryButtonTitle_secondaryButtonEvent_animated___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"TFScreenshotInstructionDeviceImageKey"];
  [*(id *)(a1 + 40) prepareForState:2];
  [*(id *)(a1 + 40) setTitle:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) setSubtitle:*(void *)(a1 + 56)];
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = (void *)MEMORY[0x263F1C6B0];
  id v4 = [*(id *)(a1 + 64) traitCollection];
  uint64_t v5 = objc_msgSend(v3, "tf_imageNamed:compatibleWithTraitCollection:", v6, v4);
  objc_msgSend(v2, "setDeviceImage:withOrientation:", v5, objc_msgSend(*(id *)(a1 + 64), "_currentInterfaceOrientation"));

  objc_msgSend(*(id *)(a1 + 40), "setPrimaryButtonTitle:target:action:", *(void *)(a1 + 72), *(void *)(a1 + 64), objc_msgSend(*(id *)(a1 + 64), "_selectorForPresentorViewEvent:", *(void *)(a1 + 88)));
  objc_msgSend(*(id *)(a1 + 40), "setSecondaryButtonTitle:target:action:", *(void *)(a1 + 80), *(void *)(a1 + 64), objc_msgSend(*(id *)(a1 + 64), "_selectorForPresentorViewEvent:", *(void *)(a1 + 96)));
}

- (void)dismissAnimated:(BOOL)a3
{
}

- (void)_animateLaunchScreenViewWithUpdateBlock:(id)a3 transition:(id)a4
{
  id v6 = (void *)MEMORY[0x263F158F8];
  id v7 = a4;
  double v8 = (void (**)(void))a3;
  [v6 begin];
  double v9 = [(TFBetaAppLaunchScreenViewController *)self launchScreenView];
  [v9 snapshotCurrentView];

  [MEMORY[0x263F158F8] commit];
  double v10 = [(TFBetaAppLaunchScreenViewController *)self launchScreenView];
  [v10 setUserInteractionEnabled:0];

  [MEMORY[0x263F158F8] begin];
  v8[2](v8);

  double v11 = [(TFBetaAppLaunchScreenViewController *)self launchScreenView];
  [v11 cleanupSnapshot];

  objc_super v12 = [(TFBetaAppLaunchScreenViewController *)self launchScreenView];
  objc_super v13 = [v12 layer];
  [v13 addAnimation:v7 forKey:@"transition"];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __90__TFBetaAppLaunchScreenViewController__animateLaunchScreenViewWithUpdateBlock_transition___block_invoke;
  v14[3] = &unk_26468EBB0;
  v14[4] = self;
  [MEMORY[0x263F158F8] setCompletionBlock:v14];
  [MEMORY[0x263F158F8] commit];
}

void __90__TFBetaAppLaunchScreenViewController__animateLaunchScreenViewWithUpdateBlock_transition___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) launchScreenView];
  [v1 setUserInteractionEnabled:1];
}

- (id)_fadeTransition
{
  v2 = [MEMORY[0x263F15910] animation];
  uint64_t v3 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  [v2 setTimingFunction:v3];

  [v2 setType:*MEMORY[0x263F15FD8]];
  [v2 setDuration:0.3];

  return v2;
}

- (id)_pushTransition
{
  v2 = [(TFBetaAppLaunchScreenViewController *)self view];
  uint64_t v3 = [v2 traitCollection];
  uint64_t v4 = [v3 layoutDirection];

  uint64_t v5 = [MEMORY[0x263F15910] animation];
  id v6 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  [v5 setTimingFunction:v6];

  [v5 setType:*MEMORY[0x263F16008]];
  id v7 = (void *)MEMORY[0x263F15FE8];
  if (v4 != 1) {
    id v7 = (void *)MEMORY[0x263F15FF0];
  }
  [v5 setSubtype:*v7];
  [v5 setDuration:0.3];

  return v5;
}

- (void)_updateNavigationBarForHostTraitCollection:(id)a3
{
  uint64_t v4 = [a3 horizontalSizeClass];
  uint64_t v5 = [(TFBetaAppLaunchScreenViewController *)self navigationController];
  id v6 = [v5 navigationBar];
  id v7 = v6;
  if (v4 == 2)
  {
    [v6 _setBackgroundOpacity:1.0];

    id v9 = [(TFBetaAppLaunchScreenViewController *)self navigationItem];
    double v8 = [(TFBetaAppLaunchScreenViewController *)self cancelBarButtonItem];
    [v9 setLeftBarButtonItem:v8];
  }
  else
  {
    [v6 _setBackgroundOpacity:0.0];

    id v9 = [(TFBetaAppLaunchScreenViewController *)self navigationItem];
    [v9 setLeftBarButtonItem:0];
  }
}

- (SEL)_selectorForPresentorViewEvent:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      return sel__didPressExitLaunchScreenButton;
    case 1uLL:
      return sel__didPressOpenHowToSupportLinkButton;
    case 0uLL:
      return sel__didPressShowHowToButton;
  }
  return self;
}

- (void)_didPressShowHowToButton
{
  id v2 = [(TFBetaAppLaunchScreenViewController *)self presenter];
  [v2 showHowToScreen];
}

- (void)_didPressOpenHowToSupportLinkButton
{
  id v2 = [(TFBetaAppLaunchScreenViewController *)self presenter];
  [v2 openHowToSupportLink];
}

- (void)_didPressExitLaunchScreenButton
{
  id v2 = [(TFBetaAppLaunchScreenViewController *)self presenter];
  [v2 exitLaunchScreen];
}

- (void)_didPressNavigationItemCancel
{
  id v2 = [(TFBetaAppLaunchScreenViewController *)self presenter];
  [v2 exitLaunchScreen];
}

- (TFBetaAppLaunchScreenHost)launchScreenHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_launchScreenHost);

  return (TFBetaAppLaunchScreenHost *)WeakRetained;
}

- (TFBetaAppLaunchPresenter)presenter
{
  return self->_presenter;
}

- (TFBetaAppLaunchScreenView)launchScreenView
{
  return self->_launchScreenView;
}

- (void)setLaunchScreenView:(id)a3
{
}

- (UIBarButtonItem)cancelBarButtonItem
{
  return self->_cancelBarButtonItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_launchScreenView, 0);
  objc_storeStrong((id *)&self->_presenter, 0);

  objc_destroyWeak((id *)&self->_launchScreenHost);
}

@end