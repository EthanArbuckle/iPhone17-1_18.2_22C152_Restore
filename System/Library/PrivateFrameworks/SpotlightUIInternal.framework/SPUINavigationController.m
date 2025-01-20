@interface SPUINavigationController
+ (id)backgroundColorForViewController:(id)a3;
+ (id)viewControllerWithBackgroundColorForViewController:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)isFirstInitialization;
- (BOOL)sui_isTransitioning;
- (SPUINavigationController)init;
- (SPUINavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (SPUINavigationController)initWithRootViewController:(id)a3;
- (SPUINavigationController)initWithSearchViewController:(id)a3;
- (SPUINavigationControllerDelegate)sizingDelegate;
- (SPUISearchViewController)searchViewController;
- (SPUIUnifiedFieldNavigationDelegate)unifiedFieldDelegate;
- (SearchUIBackgroundColorView)backgroundView;
- (SearchUIBackgroundColorView)transitioningBackgroundView;
- (double)contentHeight;
- (double)contentHeightIncludingCardViewController;
- (double)contentHeightIncludingSearchView;
- (double)heightOfNavigationBar;
- (id)footerGeneratorForProactive:(BOOL)a3;
- (id)generateFooterViewForProactive:(BOOL)a3 cache:(BOOL)a4;
- (int64_t)navigationMode;
- (void)applyCardHeightAnimated:(BOOL)a3;
- (void)cardViewController:(id)a3 preferredContentSizeDidChange:(CGSize)a4 animated:(BOOL)a5;
- (void)dealloc;
- (void)didInvalidateSizeAnimated:(BOOL)a3;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)presentPrivacyView;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)resetSearchFieldContentWithSearchToken:(id)a3 text:(id)a4 wantsBackButton:(BOOL)a5 transitionCoordinator:(id)a6;
- (void)setBackgroundView:(id)a3;
- (void)setContentHeight:(double)a3 animated:(BOOL)a4;
- (void)setIsFirstInitialization:(BOOL)a3;
- (void)setNavigationMode:(int64_t)a3;
- (void)setSearchViewController:(id)a3;
- (void)setSizingDelegate:(id)a3;
- (void)setSui_isTransitioning:(BOOL)a3;
- (void)setTransitioningBackgroundView:(id)a3;
- (void)setUnifiedFieldDelegate:(id)a3;
- (void)setupConstraintsForBackgroundView:(id)a3;
- (void)tapToRadarPressed;
- (void)updateBackButton:(BOOL)a3;
- (void)updateBackgroundColorWithViewControllerToBeShown:(id)a3;
- (void)updateFooterViewForViewController:(id)a3;
- (void)updateFooterViewsIfNecessary;
- (void)updateSearchFieldForViewController:(id)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SPUINavigationController

- (void)didInvalidateSizeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(SPUINavigationController *)self navigationMode] == 1
     || [(SPUINavigationController *)self navigationMode] == 5)
    && [MEMORY[0x263F79140] enableFloatingWindow])
  {
    [(SPUINavigationController *)self contentHeightIncludingSearchView];
    -[SPUINavigationController setContentHeight:animated:](self, "setContentHeight:animated:", v3);
  }
}

- (int64_t)navigationMode
{
  return self->_navigationMode;
}

- (void)setNavigationMode:(int64_t)a3
{
  int64_t navigationMode = self->_navigationMode;
  self->_int64_t navigationMode = a3;
  [MEMORY[0x263F79140] enableFloatingWindow];
  switch(a3)
  {
    case 0:
      [(SPUINavigationController *)self heightOfNavigationBar];
      goto LABEL_4;
    case 1:
    case 2:
      [(SPUINavigationController *)self contentHeightIncludingSearchView];
      BOOL v6 = navigationMode == 3;
      v7 = self;
      goto LABEL_5;
    case 3:
LABEL_4:
      v7 = self;
      BOOL v6 = 0;
LABEL_5:
      -[SPUINavigationController setContentHeight:animated:](v7, "setContentHeight:animated:", v6);
      break;
    case 4:
      goto LABEL_7;
    case 5:
      [(SPUINavigationController *)self contentHeightIncludingSearchView];
      -[SPUINavigationController setContentHeight:animated:](self, "setContentHeight:animated:", navigationMode == 0);
LABEL_7:
      [(SPUINavigationController *)self applyCardHeightAnimated:1];
      break;
    default:
      break;
  }
  id v8 = [(SPUINavigationController *)self searchViewController];
  [v8 updateResponderChainIfNeeded];
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a4;
  id v8 = a3;
  [(SPUINavigationController *)self setSui_isTransitioning:1];
  v9 = [v8 viewControllers];

  v10 = [v9 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    objc_msgSend(v7, "setEdgesForExtendedLayout:", objc_msgSend(v7, "edgesForExtendedLayout") & 0xFFFFFFFFFFFFFFFELL);
  }
  objc_opt_class();
  char v12 = objc_opt_isKindOfClass();
  objc_opt_class();
  char v13 = objc_opt_isKindOfClass();
  if (v13)
  {
    id v14 = v7;
    [v14 setDelegate:self];
    [v14 setShouldDrawBackgroundColor:0];
  }
  if ((v12 & 1) == 0)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __81__SPUINavigationController_navigationController_willShowViewController_animated___block_invoke;
    v16[3] = &unk_264E90790;
    char v17 = v13 & 1;
    v16[4] = self;
    [MEMORY[0x263F67C78] performAnimatableChanges:v16];
  }
  [(SPUINavigationController *)self updateBackgroundColorWithViewControllerToBeShown:v7];
  [(SPUINavigationController *)self updateFooterViewForViewController:v7];
  [(SPUINavigationController *)self updateSearchFieldForViewController:v7];
  v15 = [(SPUINavigationController *)self navigationBar];
  [v15 updateBackgroundViewVisibility];
}

- (void)updateFooterViewsIfNecessary
{
  id v3 = [(SPUINavigationController *)self topViewController];
  [(SPUINavigationController *)self updateFooterViewForViewController:v3];
}

- (void)updateFooterViewForViewController:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v7;
    v5 = [(SPUINavigationController *)self generateFooterViewForProactive:1 cache:1];
    BOOL v6 = [(SPUINavigationController *)self generateFooterViewForProactive:0 cache:1];
    [v4 setFooterViewsForProactive:v5 forResults:v6];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_6;
    }
    v5 = [(SPUINavigationController *)self generateFooterViewForProactive:0 cache:0];
    [v7 performSelector:sel_setFooterView_ withObject:v5];
  }

LABEL_6:
}

- (void)updateBackgroundColorWithViewControllerToBeShown:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() backgroundColorForViewController:v4];

  BOOL v6 = [(SPUINavigationController *)self transitioningBackgroundView];
  [v6 setAlpha:0.0];

  id v7 = [(SPUINavigationController *)self transitioningBackgroundView];
  [v7 setColor:v5];

  id v8 = [(SPUINavigationController *)self transitionCoordinator];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__SPUINavigationController_updateBackgroundColorWithViewControllerToBeShown___block_invoke;
  aBlock[3] = &unk_264E906F0;
  aBlock[4] = self;
  id v9 = v5;
  id v20 = v9;
  v10 = _Block_copy(aBlock);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __77__SPUINavigationController_updateBackgroundColorWithViewControllerToBeShown___block_invoke_2;
  v18[3] = &unk_264E90718;
  v18[4] = self;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __77__SPUINavigationController_updateBackgroundColorWithViewControllerToBeShown___block_invoke_3;
  v16[3] = &unk_264E90740;
  id v11 = v10;
  id v17 = v11;
  if (([v8 animateAlongsideTransition:v18 completion:v16] & 1) == 0)
  {
    char v12 = (void *)MEMORY[0x263F67C78];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __77__SPUINavigationController_updateBackgroundColorWithViewControllerToBeShown___block_invoke_4;
    v14[3] = &unk_264E90768;
    id v15 = v11;
    [v12 performAnimatableChanges:v14];
  }
  if (!v8)
  {
    char v13 = [(SPUINavigationController *)self backgroundView];
    [v13 setColor:v9];
  }
}

+ (id)backgroundColorForViewController:(id)a3
{
  id v3 = [a1 viewControllerWithBackgroundColorForViewController:a3];
  id v4 = [v3 searchUIBackgroundColor];

  return v4;
}

+ (id)viewControllerWithBackgroundColorForViewController:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 childViewControllers];
    id v5 = [v4 firstObject];
  }
  else
  {
    id v5 = v3;
  }
  if (objc_opt_respondsToSelector()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (void)setUnifiedFieldDelegate:(id)a3
{
}

- (SPUINavigationController)initWithSearchViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(SPUINavigationController *)self initWithRootViewController:v4];
  id v6 = v5;
  if (v5)
  {
    [(SPUINavigationController *)v5 setSearchViewController:v4];
    id v7 = [(SPUINavigationController *)v6 searchViewController];
    [v7 setSizingDelegate:v6];

    v6->_int64_t navigationMode = 0;
    id v8 = [(SPUINavigationController *)v6 view];
    LODWORD(v9) = 1148846080;
    [v8 setContentCompressionResistancePriority:1 forAxis:v9];

    v10 = [(SPUINavigationController *)v6 searchViewController];
    id v11 = [v10 headerView];
    char v12 = [(SPUINavigationController *)v6 navigationBar];
    [v12 setHeader:v11];
  }
  return v6;
}

- (SPUISearchViewController)searchViewController
{
  return (SPUISearchViewController *)objc_getProperty(self, a2, 1456, 1);
}

- (void)setSearchViewController:(id)a3
{
}

- (SPUINavigationController)initWithRootViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(SPUINavigationController *)self initWithNavigationBarClass:0 toolbarClass:0];
  id v6 = v5;
  if (v5) {
    [(SPUINavigationController *)v5 pushViewController:v4 animated:0];
  }

  return v6;
}

- (SPUINavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    a3 = (Class)objc_opt_class();
  }
  v26.receiver = self;
  v26.super_class = (Class)SPUINavigationController;
  id v7 = [(SPUINavigationController *)&v26 initWithNavigationBarClass:a3 toolbarClass:a4];
  id v8 = v7;
  if (v7)
  {
    [(SPUINavigationController *)v7 setDelegate:v7];
    [(SPUINavigationController *)v8 _setBuiltinTransitionStyle:1];
    double v9 = [(SPUINavigationController *)v8 view];
    v10 = [v9 layer];
    [v10 setHitTestsAsOpaque:1];

    id v11 = objc_opt_new();
    [(SPUINavigationController *)v8 setBackgroundView:v11];

    char v12 = [(SPUINavigationController *)v8 backgroundView];
    [v12 setShowsPlaceholderPlatterView:0];

    char v13 = [(SPUINavigationController *)v8 backgroundView];
    [v13 setDelegate:v8];

    id v14 = [(SPUINavigationController *)v8 view];
    id v15 = [(SPUINavigationController *)v8 backgroundView];
    [v14 insertSubview:v15 atIndex:0];

    v16 = [(SPUINavigationController *)v8 view];
    [v16 setClipsToBounds:0];

    id v17 = [(SPUINavigationController *)v8 backgroundView];
    [(SPUINavigationController *)v8 setupConstraintsForBackgroundView:v17];

    v18 = objc_opt_new();
    [(SPUINavigationController *)v8 setTransitioningBackgroundView:v18];

    v19 = [(SPUINavigationController *)v8 transitioningBackgroundView];
    [v19 setShowsPlaceholderPlatterView:0];

    id v20 = [(SPUINavigationController *)v8 transitioningBackgroundView];
    [v20 setAlpha:0.0];

    v21 = [(SPUINavigationController *)v8 view];
    v22 = [(SPUINavigationController *)v8 transitioningBackgroundView];
    [v21 insertSubview:v22 atIndex:0];

    v23 = [(SPUINavigationController *)v8 transitioningBackgroundView];
    [(SPUINavigationController *)v8 setupConstraintsForBackgroundView:v23];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v8, (CFNotificationCallback)lockStateChanged, @"com.apple.mobile.keybagd.lock_status", 0, CFNotificationSuspensionBehaviorDrop);
    [(SPUINavigationController *)v8 setIsFirstInitialization:1];
  }
  return v8;
}

- (SearchUIBackgroundColorView)backgroundView
{
  return self->_backgroundView;
}

- (SearchUIBackgroundColorView)transitioningBackgroundView
{
  return self->_transitioningBackgroundView;
}

- (void)setTransitioningBackgroundView:(id)a3
{
}

- (void)setBackgroundView:(id)a3
{
}

- (void)updateSearchFieldForViewController:(id)a3
{
  id v53 = a3;
  unint64_t v4 = 0x263F67000uLL;
  if ([MEMORY[0x263F67C78] isIpad])
  {
    id v5 = [(SPUINavigationController *)self navigationBar];
    id v6 = [v5 header];
    [v6 unfocusSearchFieldWithReason:5];
  }
  id v7 = [v53 transitionCoordinator];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (![(SPUINavigationController *)self isFirstInitialization])
    {
      id v8 = [(SPUINavigationController *)self searchViewController];
      double v9 = [v8 lastSearchToken];
      v10 = [(SPUINavigationController *)self searchViewController];
      id v11 = [v10 lastSearchString];
      [(SPUINavigationController *)self resetSearchFieldContentWithSearchToken:v9 text:v11 wantsBackButton:0 transitionCoordinator:v7];
    }
    [(SPUINavigationController *)self setIsFirstInitialization:0];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v53;
      char v13 = [v12 card];
      id v14 = [v13 titleImage];

      if (!v14) {
        goto LABEL_14;
      }
      id v15 = (void *)MEMORY[0x263F67C48];
      v16 = [v12 card];
      id v17 = [v16 titleImage];
      v18 = [v15 imageWithSFImage:v17];
      v19 = [(SPUINavigationController *)self view];
      [v19 effectiveScreenScale];
      double v21 = v20;
      v22 = (void *)MEMORY[0x263F7E398];
      v23 = [(SPUINavigationController *)self view];
      v24 = [v22 bestAppearanceForView:v23];
      v25 = objc_msgSend(v18, "loadImageWithScale:isDarkStyle:", objc_msgSend(v24, "isDark"), v21);

      unint64_t v4 = 0x263F67000;
      if (!v25) {
        goto LABEL_14;
      }
      objc_super v26 = (void *)MEMORY[0x263F82BA8];
      v27 = [v12 card];
      v28 = [v27 title];
      v29 = [v26 tokenWithIcon:v25 text:v28];

      v30 = [v12 card];
      v31 = [v30 title];
      [v29 setRepresentedObject:v31];

      if (v29)
      {
        v32 = self;
        v33 = v29;
        v34 = 0;
      }
      else
      {
LABEL_14:
        v29 = [v12 title];
        v32 = self;
        v33 = 0;
        v34 = v29;
      }
      [(SPUINavigationController *)v32 resetSearchFieldContentWithSearchToken:v33 text:v34 wantsBackButton:1 transitionCoordinator:v7];

      v38 = [(SPUINavigationController *)self searchViewController];
      v39 = [v38 headerView];
      v40 = [v39 searchField];
      [v12 setTextField:v40];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = [v53 searchToken];
        v35 = self;
        id v36 = v12;
        id v37 = 0;
      }
      else
      {
        id v12 = [v53 title];
        v35 = self;
        id v36 = 0;
        id v37 = v12;
      }
      [(SPUINavigationController *)v35 resetSearchFieldContentWithSearchToken:v36 text:v37 wantsBackButton:1 transitionCoordinator:v7];
    }
  }
  if ([MEMORY[0x263F79140] bottomSearchFieldEnabled]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v41 = [(SPUINavigationController *)self searchViewController];
    v42 = [v41 headerView];
    [v42 frame];
    if (v43 == 0.0)
    {
      v44 = [(SPUINavigationController *)self searchViewController];
      v45 = [v44 headerView];
      objc_msgSend(v45, "systemLayoutSizeFittingSize:", *MEMORY[0x263F83818], *(double *)(MEMORY[0x263F83818] + 8));
      double v47 = v46;
    }
    else
    {
      double v47 = v43;
    }

    [v53 setAdditionalKeyboardHeight:v47];
  }
  if ([*(id *)(v4 + 3192) isIpad])
  {
    v48 = [(SPUINavigationController *)self viewControllers];
    v49 = [v48 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v51 = [(SPUINavigationController *)self viewControllers];
      v52 = [v51 firstObject];
      [v52 updateResponderChainIfNeeded];
    }
  }
}

- (void)setIsFirstInitialization:(BOOL)a3
{
  self->_isFirstInitialization = a3;
}

- (BOOL)isFirstInitialization
{
  return self->_isFirstInitialization;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

uint64_t __77__SPUINavigationController_updateBackgroundColorWithViewControllerToBeShown___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  [(SPUINavigationController *)self updateFooterViewsIfNecessary];
  [(SPUINavigationController *)self setSui_isTransitioning:0];
}

void __77__SPUINavigationController_updateBackgroundColorWithViewControllerToBeShown___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = objc_opt_class();
    unint64_t v4 = [*(id *)(a1 + 32) visibleViewController];
    id v8 = [v3 backgroundColorForViewController:v4];
  }
  else
  {
    id v8 = *(id *)(a1 + 40);
  }
  id v5 = [*(id *)(a1 + 32) backgroundView];
  [v5 setColor:v8];

  id v6 = [*(id *)(a1 + 32) backgroundView];
  [v6 setAlpha:1.0];

  id v7 = [*(id *)(a1 + 32) transitioningBackgroundView];
  [v7 setAlpha:0.0];
}

- (SPUINavigationController)init
{
  return [(SPUINavigationController *)self initWithNavigationBarClass:0 toolbarClass:0];
}

- (void)setupConstraintsForBackgroundView:(id)a3
{
  id v21 = a3;
  if ([MEMORY[0x263F79140] enableFloatingWindow])
  {
    [MEMORY[0x263F67C10] fillContainerWithView:v21];
  }
  else
  {
    [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
    unint64_t v4 = [v21 leadingAnchor];
    id v5 = [(SPUINavigationController *)self view];
    id v6 = [v5 leadingAnchor];
    double v7 = *(double *)&SPUIExtendedEdgesDimensionConstant;
    id v8 = [v4 constraintEqualToAnchor:v6 constant:*(double *)&SPUIExtendedEdgesDimensionConstant * -2.0];
    [v8 setActive:1];

    double v9 = [v21 trailingAnchor];
    v10 = [(SPUINavigationController *)self view];
    id v11 = [v10 trailingAnchor];
    id v12 = [v9 constraintEqualToAnchor:v11 constant:v7 + v7];
    [v12 setActive:1];

    char v13 = [v21 topAnchor];
    id v14 = [(SPUINavigationController *)self view];
    id v15 = [v14 topAnchor];
    v16 = [v13 constraintEqualToAnchor:v15 constant:v7 * -6.0];
    [v16 setActive:1];

    id v17 = [v21 bottomAnchor];
    v18 = [(SPUINavigationController *)self view];
    v19 = [v18 bottomAnchor];
    double v20 = [v17 constraintEqualToAnchor:v19 constant:v7 + v7];
    [v20 setActive:1];
  }
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.mobile.keybagd.lock_status", 0);
  v4.receiver = self;
  v4.super_class = (Class)SPUINavigationController;
  [(SPUINavigationController *)&v4 dealloc];
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(SPUINavigationController *)self navigationBar];
  id v8 = [v6 navigationItem];
  [v7 reconfigureNavigationBarForItem:v8];

  v9.receiver = self;
  v9.super_class = (Class)SPUINavigationController;
  [(SPUINavigationController *)&v9 pushViewController:v6 animated:v4];
}

void __77__SPUINavigationController_updateBackgroundColorWithViewControllerToBeShown___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) transitioningBackgroundView];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 32) backgroundView];
  [v3 setAlpha:0.0];
}

uint64_t __77__SPUINavigationController_updateBackgroundColorWithViewControllerToBeShown___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 isCancelled];
  BOOL v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __81__SPUINavigationController_navigationController_willShowViewController_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v1 = 4;
  }
  else {
    uint64_t v1 = 3;
  }
  return [*(id *)(a1 + 32) setNavigationMode:v1];
}

- (void)resetSearchFieldContentWithSearchToken:(id)a3 text:(id)a4 wantsBackButton:(BOOL)a5 transitionCoordinator:(id)a6
{
  BOOL v6 = a5;
  v10 = (void *)MEMORY[0x263F79140];
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  if ([v10 bottomSearchFieldEnabled])
  {
    id v26 = [(SPUINavigationController *)self unifiedFieldDelegate];
    [v26 resetSearchFieldContentWithSearchToken:v13 text:v12 wantsBackButton:v6 transitionCoordinator:v11];
  }
  else
  {
    id v14 = [(SPUINavigationController *)self navigationBar];
    id v15 = [v14 header];

    [v15 setUseClearTokens:1];
    v16 = [v15 searchField];
    id v17 = v16;
    if (v13) {
      id v18 = 0;
    }
    else {
      id v18 = v12;
    }
    [v16 updateTextRange:v18];

    v19 = [v15 searchField];
    [v19 updateToken:v13];

    double v20 = (void *)MEMORY[0x263F82E00];
    id v21 = [v15 searchField];
    v22 = [v21 leftView];
    [v11 transitionDuration];
    double v24 = v23;

    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __110__SPUINavigationController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke;
    v30[3] = &unk_264E90790;
    v30[4] = self;
    BOOL v31 = v6;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __110__SPUINavigationController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_2;
    v27[3] = &unk_264E907B8;
    BOOL v29 = v6;
    id v28 = v15;
    id v25 = v15;
    [v20 transitionWithView:v22 duration:5242880 options:v30 animations:v27 completion:v24];
  }
}

uint64_t __110__SPUINavigationController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateBackButton:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __110__SPUINavigationController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void **)(a1 + 32);
  if (v1) {
    return [v2 unfocusSearchFieldWithReason:5 afterCommit:0];
  }
  else {
    return [v2 focusSearchFieldAndSelectAll:0 withReason:3];
  }
}

- (void)updateBackButton:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(SPUINavigationController *)self navigationBar];
  id v5 = [v4 header];
  id v8 = [v5 searchField];

  if (v3) {
    BOOL v6 = @"chevron.backward";
  }
  else {
    BOOL v6 = @"magnifyingglass";
  }
  [v8 updateLeftViewWithSymbolName:v6];
  double v7 = [v8 leftView];
  [v7 setUserInteractionEnabled:v3];
}

- (void)setContentHeight:(double)a3 animated:(BOOL)a4
{
  if (self->_contentHeight != a3)
  {
    BOOL v4 = a4;
    self->_contentHeight = a3;
    id v5 = [(SPUINavigationController *)self sizingDelegate];
    [v5 navigationViewDidInvalidateSizeAnimated:v4];
  }
}

- (double)contentHeightIncludingSearchView
{
  [(SPUINavigationController *)self heightOfNavigationBar];
  double v4 = v3;
  id v5 = [(SPUINavigationController *)self searchViewController];
  [v5 contentHeight];
  double v7 = v4 + v6;

  return v7;
}

- (double)contentHeightIncludingCardViewController
{
  double v3 = [(SPUINavigationController *)self topViewController];
  objc_opt_class();
  double v4 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(SPUINavigationController *)self topViewController];
    [v5 preferredContentSize];
    double v4 = v6;
  }
  [(SPUINavigationController *)self heightOfNavigationBar];
  double result = v4 + v7;
  if (result < 250.0)
  {
    objc_super v9 = [(SPUINavigationController *)self view];
    v10 = [v9 superview];
    [v10 frame];
    double Height = CGRectGetHeight(v12);

    return Height;
  }
  return result;
}

- (double)heightOfNavigationBar
{
  uint64_t v2 = [(SPUINavigationController *)self navigationBar];
  [v2 intrinsicContentSize];
  double v4 = v3;

  return v4;
}

- (void)applyCardHeightAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(SPUINavigationController *)self contentHeightIncludingCardViewController];
  double v6 = v5;
  [(SPUINavigationController *)self heightOfNavigationBar];
  if (v7 != v6)
  {
    [(SPUINavigationController *)self setContentHeight:v3 animated:v6];
  }
}

- (void)cardViewController:(id)a3 preferredContentSizeDidChange:(CGSize)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if ([(SPUINavigationController *)self navigationMode] == 4)
  {
    id v7 = [(SPUINavigationController *)self topViewController];

    if (v7 == v8) {
      [(SPUINavigationController *)self applyCardHeightAnimated:v5];
    }
  }
}

- (id)generateFooterViewForProactive:(BOOL)a3 cache:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v6 = -[SPUINavigationController footerGeneratorForProactive:](self, "footerGeneratorForProactive:");
  id v7 = v6;
  if (v6)
  {
    if (v4)
    {
      if (generateFooterViewForProactive_cache__onceToken != -1) {
        dispatch_once(&generateFooterViewForProactive_cache__onceToken, &__block_literal_global_0);
      }
      id v8 = NSString;
      objc_super v9 = [v7 reuseIdentifier];
      v10 = [NSNumber numberWithBool:v5];
      id v11 = [v8 stringWithFormat:@"%@, %@", v9, v10];

      CGRect v12 = [(id)generateFooterViewForProactive_cache__footerViewCache objectForKeyedSubscript:v11];
      if (v12) {
        goto LABEL_14;
      }
      id v13 = [v7 buttonGenerator];
      id v14 = v13[2]();
      [(id)generateFooterViewForProactive_cache__footerViewCache setObject:v14 forKeyedSubscript:v11];

      uint64_t v15 = [(id)generateFooterViewForProactive_cache__footerViewCache objectForKeyedSubscript:v11];
    }
    else
    {
      id v11 = [v6 buttonGenerator];
      uint64_t v15 = v11[2]();
    }
    CGRect v12 = (void *)v15;
LABEL_14:

    goto LABEL_15;
  }
  v16 = (NSObject **)MEMORY[0x263F79148];
  id v17 = *MEMORY[0x263F79148];
  if (!*MEMORY[0x263F79148])
  {
    SPUIInitLogging();
    id v17 = *v16;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[SPUINavigationController generateFooterViewForProactive:cache:](v17);
  }
  CGRect v12 = 0;
LABEL_15:

  return v12;
}

uint64_t __65__SPUINavigationController_generateFooterViewForProactive_cache___block_invoke()
{
  generateFooterViewForProactive_cache__footerViewCache = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (id)footerGeneratorForProactive:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (void *)MEMORY[0x263F67C78];
  double v6 = [(SPUINavigationController *)self view];
  LOBYTE(v5) = [v5 deviceIsAuthenticatedForView:v6];

  if ((v5 & 1) == 0)
  {
    id v11 = [[SPUIFooterButtonGenerator alloc] initWithReuseIdentifier:@"lockScreenFooter" buttonGenerator:&__block_literal_global_156];
    goto LABEL_13;
  }
  if (+[SPUISearchFirstTimeViewController needsDisplay])
  {
    BOOL v7 = !v3;
  }
  else
  {
    BOOL v7 = 1;
  }
  if (!v7
    && +[SPUISearchFirstTimeViewController useZKWFTE])
  {
    objc_initWeak(&location, self);
    id v8 = [SPUIFooterButtonGenerator alloc];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __56__SPUINavigationController_footerGeneratorForProactive___block_invoke_2;
    v16[3] = &unk_264E90828;
    objc_super v9 = &v17;
    objc_copyWeak(&v17, &location);
    uint64_t v10 = [(SPUIFooterButtonGenerator *)v8 initWithReuseIdentifier:@"fteView" buttonGenerator:v16];
LABEL_11:
    id v11 = (SPUIFooterButtonGenerator *)v10;
    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
    goto LABEL_13;
  }
  if (+[SPUITapToRadarView shouldDisplayTapToRadar])
  {
    objc_initWeak(&location, self);
    CGRect v12 = [SPUIFooterButtonGenerator alloc];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __56__SPUINavigationController_footerGeneratorForProactive___block_invoke_5;
    v14[3] = &unk_264E90828;
    objc_super v9 = &v15;
    objc_copyWeak(&v15, &location);
    uint64_t v10 = [(SPUIFooterButtonGenerator *)v12 initWithReuseIdentifier:@"ttr" buttonGenerator:v14];
    goto LABEL_11;
  }
  id v11 = 0;
LABEL_13:
  return v11;
}

id __56__SPUINavigationController_footerGeneratorForProactive___block_invoke()
{
  v0 = objc_opt_new();
  return v0;
}

SPUIFTEView *__56__SPUINavigationController_footerGeneratorForProactive___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [SPUIFTEView alloc];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__SPUINavigationController_footerGeneratorForProactive___block_invoke_3;
  v7[3] = &unk_264E90800;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__SPUINavigationController_footerGeneratorForProactive___block_invoke_4;
  v5[3] = &unk_264E90800;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  BOOL v3 = [(SPUIFTEView *)v2 initWithPrivacyPresentation:v7 ttr:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  return v3;
}

void __56__SPUINavigationController_footerGeneratorForProactive___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained presentPrivacyView];
}

void __56__SPUINavigationController_footerGeneratorForProactive___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained tapToRadarPressed];
}

SPUITapToRadarView *__56__SPUINavigationController_footerGeneratorForProactive___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [[SPUITapToRadarView alloc] initWithTarget:WeakRetained action:sel_tapToRadarPressed];

  return v2;
}

- (void)presentPrivacyView
{
  id v3 = objc_alloc_init(MEMORY[0x263F67C60]);
  [v3 setModalPresentationStyle:2];
  [(SPUINavigationController *)self presentViewController:v3 animated:1 completion:0];
}

- (void)tapToRadarPressed
{
  id v10 = +[SPUISearchModel sharedGeneralInstance];
  id v3 = [(SPUINavigationController *)self searchViewController];
  BOOL v4 = [v3 currentQuery];
  BOOL v5 = [v10 sections];
  id v6 = [v10 rankingDebugLog];
  +[SPUITapToRadarView openTapToRadarWithQuery:v4 sections:v5 rankingDebugLog:v6];

  BOOL v7 = objc_opt_new();
  [v7 setIdentifier:*MEMORY[0x263F67508]];
  id v8 = (void *)[objc_alloc(MEMORY[0x263F679C8]) initWithResult:v7 triggerEvent:2 destination:0];
  objc_super v9 = +[SPUIFeedbackManager feedbackListener];
  [v9 didEngageResult:v8];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SPUINavigationController;
  [(SPUINavigationController *)&v6 willTransitionToTraitCollection:a3 withTransitionCoordinator:a4];
  BOOL v5 = [(SPUINavigationController *)self topViewController];
  [(SPUINavigationController *)self updateBackgroundColorWithViewControllerToBeShown:v5];
}

- (double)contentHeight
{
  return self->_contentHeight;
}

- (SPUINavigationControllerDelegate)sizingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sizingDelegate);
  return (SPUINavigationControllerDelegate *)WeakRetained;
}

- (void)setSizingDelegate:(id)a3
{
}

- (SPUIUnifiedFieldNavigationDelegate)unifiedFieldDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unifiedFieldDelegate);
  return (SPUIUnifiedFieldNavigationDelegate *)WeakRetained;
}

- (BOOL)sui_isTransitioning
{
  return self->_sui_isTransitioning;
}

- (void)setSui_isTransitioning:(BOOL)a3
{
  self->_sui_isTransitioning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitioningBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_searchViewController, 0);
  objc_destroyWeak((id *)&self->_unifiedFieldDelegate);
  objc_destroyWeak((id *)&self->_sizingDelegate);
}

- (void)generateFooterViewForProactive:(os_log_t)log cache:.cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_23D2E6000, log, OS_LOG_TYPE_DEBUG, "No footer generated: no valid footer generator found!", v1, 2u);
}

@end