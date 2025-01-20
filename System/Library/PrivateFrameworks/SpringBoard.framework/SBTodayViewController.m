@interface SBTodayViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldIconViewForbidJiggling:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isSpotlightVisible;
- (BOOL)spotlightPresenterAllowsPullToSearch:(id)a3;
- (NSString)coverSheetIdentifier;
- (SBFTouchPassThroughView)spotlightContainerView;
- (SBTodayViewSpotlightPresenter)spotlightPresenter;
- (SBViewControllerTransitionContext)transitionContext;
- (SBWindowSceneStatusBarSettingsAssertion)statusBarSettingsAssertion;
- (UITapGestureRecognizer)dismissTapGestureRecognizer;
- (double)todayViewControllerLocationForSpotlightPresenter:(id)a3;
- (id)spotlightHeaderAcquiringViewController;
- (int64_t)idleTimerDuration;
- (int64_t)idleTimerMode;
- (int64_t)idleWarnMode;
- (int64_t)notificationBehavior;
- (int64_t)participantState;
- (int64_t)proximityDetectionMode;
- (int64_t)scrollingStrategy;
- (unint64_t)restrictedCapabilities;
- (void)_beginAppearanceTransitionForChildViewControllersToVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)_dismissTodayViewOverlay:(id)a3;
- (void)_endAppearanceTransitionForChildViewControllersToVisible:(BOOL)a3;
- (void)_setStatusBarSettingsAssertionActive:(BOOL)a3;
- (void)_setUpGestureRecognizers;
- (void)_setUpSearchPresenter;
- (void)_updateScrollViewContentInset;
- (void)cleanupViews;
- (void)dismissSpotlightAnimated:(BOOL)a3;
- (void)loadView;
- (void)overlayController:(id)a3 didChangePresentationProgress:(double)a4 newPresentationProgress:(double)a5 fromLeading:(BOOL)a6;
- (void)overlayControllerDidBeginChangingPresentationProgress:(id)a3;
- (void)presentSpotlightAnimated:(BOOL)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setDismissTapGestureRecognizer:(id)a3;
- (void)setSpotlightContainerView:(id)a3;
- (void)setSpotlightPresenter:(id)a3;
- (void)setStatusBarSettingsAssertion:(id)a3;
- (void)setTransitionContext:(id)a3;
- (void)spotlightPresenterDidDismissSpotlight:(id)a3;
- (void)spotlightPresenterDidPresentSpotlight:(id)a3;
- (void)spotlightPresenterSearchBarDidFocus:(id)a3;
- (void)spotlightPresenterWillPresentSpotlight:(id)a3;
- (void)updateViewsWithLegibilitySettings;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SBTodayViewController

- (BOOL)isSpotlightVisible
{
  return [(SBTodayViewSpotlightPresenter *)self->_spotlightPresenter isPresenting];
}

- (void)_updateScrollViewContentInset
{
  v3 = (double *)MEMORY[0x1E4F437F8];
  v4 = [(SBTodayViewSpotlightPresenter *)self->_spotlightPresenter searchBarViewController];
  id v32 = v4;
  if (v4)
  {
    v5 = [v4 view];
    [v5 bounds];
    double v7 = v6;
    [(SBHTodayViewController *)self searchBarTopOffset];
    double v9 = v8 + v7;
  }
  else
  {
    double v9 = *v3;
  }
  double v10 = v3[1];
  double v11 = v3[2];
  double v12 = v3[3];
  if ([(SBTodayViewController *)self isEditing])
  {
    v13 = +[SBControlCenterController sharedInstanceIfExists];
    char v14 = [v13 presentingEdge];

    if ((v14 & 4) != 0) {
      double v11 = 100.0;
    }
  }
  v15 = [(SBHTodayViewController *)self scrollView];
  [v15 contentInset];
  if (v10 == v19 && v9 == v16 && v12 == v18)
  {
    double v22 = v17;

    if (v11 == v22) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  v23 = [(SBHTodayViewController *)self scrollView];
  [v23 contentOffset];
  v24 = [(SBHTodayViewController *)self scrollView];
  [v24 adjustedContentInset];
  int v25 = BSFloatLessThanOrEqualToFloat();

  v26 = [(SBHTodayViewController *)self scrollView];
  objc_msgSend(v26, "setContentInset:", v9, v10, v11, v12);

  if (v25)
  {
    v27 = [(SBHTodayViewController *)self scrollView];
    char v28 = [v27 isDragging];

    if ((v28 & 1) == 0)
    {
      v29 = [(SBHTodayViewController *)self scrollView];
      v30 = [(SBHTodayViewController *)self scrollView];
      [v30 adjustedContentInset];
      objc_msgSend(v29, "setContentOffset:", 0.0, -v31);
    }
  }
LABEL_19:
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBTodayViewController;
  [(SBHTodayViewController *)&v3 viewWillLayoutSubviews];
  [(SBTodayViewSpotlightPresenter *)self->_spotlightPresenter layout];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)SBTodayViewController;
  [(SBHTodayViewController *)&v3 loadView];
  [(SBTodayViewController *)self _setUpGestureRecognizers];
  [(SBTodayViewController *)self _setUpSearchPresenter];
}

- (void)_setUpGestureRecognizers
{
  objc_super v3 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__dismissTodayViewOverlay_];
  dismissTapGestureRecognizer = self->_dismissTapGestureRecognizer;
  self->_dismissTapGestureRecognizer = v3;

  [(UITapGestureRecognizer *)self->_dismissTapGestureRecognizer setAllowableMovement:10.0];
  [(UITapGestureRecognizer *)self->_dismissTapGestureRecognizer setDelegate:self];
  id v5 = [(SBTodayViewController *)self view];
  [v5 addGestureRecognizer:self->_dismissTapGestureRecognizer];
}

- (void)_setUpSearchPresenter
{
  v29[4] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    id v5 = [(SBTodayViewController *)self view];
    double v6 = (SBFTouchPassThroughView *)objc_alloc_init(MEMORY[0x1E4FA6028]);
    spotlightContainerView = self->_spotlightContainerView;
    self->_spotlightContainerView = v6;

    [(SBFTouchPassThroughView *)self->_spotlightContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [v5 addSubview:self->_spotlightContainerView];
    v23 = (void *)MEMORY[0x1E4F28DC8];
    char v28 = [v5 leadingAnchor];
    v27 = [(SBFTouchPassThroughView *)self->_spotlightContainerView leadingAnchor];
    v26 = [v28 constraintEqualToAnchor:v27];
    v29[0] = v26;
    int v25 = [v5 trailingAnchor];
    v24 = [(SBFTouchPassThroughView *)self->_spotlightContainerView trailingAnchor];
    double v22 = [v25 constraintEqualToAnchor:v24];
    v29[1] = v22;
    double v8 = [v5 topAnchor];
    double v9 = [(SBFTouchPassThroughView *)self->_spotlightContainerView topAnchor];
    double v10 = [v8 constraintEqualToAnchor:v9];
    v29[2] = v10;
    double v11 = [v5 bottomAnchor];
    double v12 = [(SBFTouchPassThroughView *)self->_spotlightContainerView bottomAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v29[3] = v13;
    char v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
    [v23 activateConstraints:v14];

    v15 = [SBTodayViewSpotlightPresenter alloc];
    double v16 = self->_spotlightContainerView;
    double v17 = [(SBHTodayViewController *)self scrollView];
    double v18 = [(SBTodayViewSpotlightPresenter *)v15 initWithSearchBarViewController:0 containerView:v16 scrollView:v17 delegate:self];
    spotlightPresenter = self->_spotlightPresenter;
    self->_spotlightPresenter = v18;

    v20 = self->_spotlightPresenter;
    v21 = [(SBHTodayViewController *)self effectiveLegibilitySettings];
    [(SBTodayViewSpotlightPresenter *)v20 setLegibilitySettings:v21];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBTodayViewController;
  [(SBHTodayViewController *)&v6 viewDidAppear:a3];
  if ([(SBHTodayViewController *)self location] == 2)
  {
    uint64_t v4 = +[SBLockScreenManager sharedInstance];
    id v5 = [v4 coverSheetViewController];
    [v5 registerExternalBehaviorProvider:self];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBTodayViewController;
  [(SBHTodayViewController *)&v6 viewWillDisappear:a3];
  if ([(SBHTodayViewController *)self location] == 2)
  {
    uint64_t v4 = +[SBLockScreenManager sharedInstance];
    id v5 = [v4 coverSheetViewController];
    [v5 unregisterExternalBehaviorProvider:self];
  }
}

- (void)_beginAppearanceTransitionForChildViewControllersToVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v7 = [(SBTodayViewSpotlightPresenter *)self->_spotlightPresenter spotlightViewController];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v8 = [(SBTodayViewController *)self childViewControllers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (v13 != v7) {
          [(SBTodayViewController *)self bs_beginAppearanceTransitionForChildViewController:v13 toVisible:v5 animated:v4];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)_endAppearanceTransitionForChildViewControllersToVisible:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(SBTodayViewSpotlightPresenter *)self->_spotlightPresenter spotlightViewController];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v6 = [(SBTodayViewController *)self childViewControllers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (v11 != v5) {
          [(SBTodayViewController *)self bs_endAppearanceTransitionForChildViewController:v11 toVisible:v3];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)SBTodayViewController;
  id v6 = a3;
  [(SBHTodayViewController *)&v7 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  -[SBTodayViewSpotlightPresenter containerViewDidMoveToWindow:](self->_spotlightPresenter, "containerViewDidMoveToWindow:", v6, v7.receiver, v7.super_class);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)presentSpotlightAnimated:(BOOL)a3
{
}

- (void)dismissSpotlightAnimated:(BOOL)a3
{
}

- (void)updateViewsWithLegibilitySettings
{
  v4.receiver = self;
  v4.super_class = (Class)SBTodayViewController;
  [(SBHTodayViewController *)&v4 updateViewsWithLegibilitySettings];
  BOOL v3 = [(SBHTodayViewController *)self effectiveLegibilitySettings];
  [(SBTodayViewSpotlightPresenter *)self->_spotlightPresenter setLegibilitySettings:v3];
}

- (void)_dismissTodayViewOverlay:(id)a3
{
  id v8 = a3;
  id v4 = [(SBTodayViewController *)self dismissTapGestureRecognizer];

  BOOL v5 = v8;
  if (v4 == v8)
  {
    BOOL v6 = [v8 state] == 3;
    BOOL v5 = v8;
    if (v6)
    {
      objc_super v7 = [(SBHTodayViewController *)self dismissalDelegate];
      [v7 overlayControllerRequestsDismissal:self];

      BOOL v5 = v8;
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBTodayViewController *)self dismissTapGestureRecognizer];

  if (v8 == v7)
  {
    uint64_t v10 = [(SBHTodayViewController *)self scrollView];
    id v11 = [v10 panGestureRecognizer];
    BOOL v9 = v11 == v6;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v24 = 0;
  int v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  id v8 = [(SBTodayViewController *)self dismissTapGestureRecognizer];

  if (v8 == v6)
  {
    BOOL v9 = [(SBHTodayViewController *)self scrollView];
    [v7 locationInView:v9];
    uint64_t v11 = v10;
    uint64_t v13 = v12;

    if ([(SBTodayViewController *)self isEditing])
    {
      *((unsigned char *)v25 + 24) = 0;
    }
    else
    {
      long long v14 = [(SBTodayViewSpotlightPresenter *)self->_spotlightPresenter searchBarViewController];
      if (v14)
      {
        [v7 locationInView:self->_spotlightContainerView];
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        uint64_t v19 = [v14 view];
        [v19 frame];
        v28.x = v16;
        v28.y = v18;
        BOOL v20 = CGRectContainsPoint(v29, v28);

        if (v20) {
          *((unsigned char *)v25 + 24) = 0;
        }
      }

      if (*((unsigned char *)v25 + 24))
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __62__SBTodayViewController_gestureRecognizer_shouldReceiveTouch___block_invoke;
        v23[3] = &unk_1E6AFFEB8;
        v23[6] = v11;
        v23[7] = v13;
        v23[4] = self;
        v23[5] = &v24;
        [(SBHTodayViewController *)self enumerateWidgetIconViewsUsingBlock:v23];
      }
    }
  }
  char v21 = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v24, 8);

  return v21;
}

BOOL __62__SBTodayViewController_gestureRecognizer_shouldReceiveTouch___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  long long v14 = [*(id *)(a1 + 32) scrollView];
  objc_msgSend(v5, "convertRect:toView:", v14, v7, v9, v11, v13);
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v24.origin.x = v16;
  v24.origin.y = v18;
  v24.size.width = v20;
  v24.size.height = v22;
  BOOL result = CGRectContainsPoint(v24, *(CGPoint *)(a1 + 48));
  if (result)
  {
    *a3 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

- (id)spotlightHeaderAcquiringViewController
{
  return [(SBTodayViewSpotlightPresenter *)self->_spotlightPresenter spotlightViewController];
}

- (void)spotlightPresenterSearchBarDidFocus:(id)a3
{
  id v4 = [(SBHTodayViewController *)self delegate];
  [v4 todayViewWantsToEndEditing:self];
}

- (void)spotlightPresenterWillPresentSpotlight:(id)a3
{
  id v4 = [(SBHTodayViewController *)self delegate];
  [v4 todayViewControllerWillPresentSpotlight:self];
}

- (void)spotlightPresenterDidPresentSpotlight:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(SBHTodayViewController *)self location] == 2)
  {
    id v4 = +[SBLockScreenManager sharedInstance];
    id v5 = [v4 coverSheetViewController];
    [v5 externalBehaviorProviderBehaviorChanged:self];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v6 = [(SBHTodayViewController *)self observers];
  double v7 = (void *)[v6 copy];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 todayViewControllerDidPresentSearch:self];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)spotlightPresenterDidDismissSpotlight:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(SBHTodayViewController *)self location] == 2)
  {
    id v4 = +[SBLockScreenManager sharedInstance];
    id v5 = [v4 coverSheetViewController];
    [v5 externalBehaviorProviderBehaviorChanged:self];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v6 = [(SBHTodayViewController *)self observers];
  double v7 = (void *)[v6 copy];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 todayViewControllerDidDismissSearch:self];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (double)todayViewControllerLocationForSpotlightPresenter:(id)a3
{
  return (double)[(SBHTodayViewController *)self location];
}

- (BOOL)spotlightPresenterAllowsPullToSearch:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F74230], "sharedConnection", a3);
  char v5 = [v4 isSpotlightAllowed];

  if ((v5 & 1) == 0)
  {
    double v6 = SBLogSpotlight();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v11 = [(SBHTodayViewController *)self location];
      double v12 = @"unknown";
      if (v11 == 2) {
        double v12 = @"left-of-lock";
      }
      if (v11 == 1) {
        double v12 = @"left-of-home";
      }
      uint64_t v9 = v12;
      int v14 = 138412290;
      long long v15 = v9;
      uint64_t v10 = "Disallowing Spotlight presentation in %@: disallowed by ManagedConfiguration";
      goto LABEL_15;
    }
LABEL_16:

    return 0;
  }
  if ([(SBTodayViewController *)self isEditing])
  {
    double v6 = SBLogSpotlight();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v7 = [(SBHTodayViewController *)self location];
      uint64_t v8 = @"unknown";
      if (v7 == 2) {
        uint64_t v8 = @"left-of-lock";
      }
      if (v7 == 1) {
        uint64_t v8 = @"left-of-home";
      }
      uint64_t v9 = v8;
      int v14 = 138412290;
      long long v15 = v9;
      uint64_t v10 = "Disallowing Spotlight presentation in %@: editing";
LABEL_15:
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, 0xCu);

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  return 1;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBTodayViewController;
  id v4 = a3;
  [(SBHTodayViewController *)&v5 scrollViewWillBeginDragging:v4];
  -[SBTodayViewSpotlightPresenter scrollViewWillBeginDragging:](self->_spotlightPresenter, "scrollViewWillBeginDragging:", v4, v5.receiver, v5.super_class);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBTodayViewController;
  [(SBHTodayViewController *)&v6 scrollViewDidScroll:v4];
  id v5 = [(SBHTodayViewController *)self scrollView];

  if (v5 == v4) {
    [(SBTodayViewSpotlightPresenter *)self->_spotlightPresenter scrollViewDidScroll:v4];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  v10.receiver = self;
  v10.super_class = (Class)SBTodayViewController;
  id v9 = a3;
  -[SBHTodayViewController scrollViewWillEndDragging:withVelocity:targetContentOffset:](&v10, sel_scrollViewWillEndDragging_withVelocity_targetContentOffset_, v9, a5, x, y);
  -[SBTodayViewSpotlightPresenter scrollViewWillEndDragging:withVelocity:](self->_spotlightPresenter, "scrollViewWillEndDragging:withVelocity:", v9, x, y, v10.receiver, v10.super_class);
}

- (void)overlayControllerDidBeginChangingPresentationProgress:(id)a3
{
  id v4 = a3;
  [(SBHTodayViewController *)self cancelTouchesForAllWidgets];
  [(SBHTodayViewController *)self beginDisablingWidgetHitTestingForReason:*MEMORY[0x1E4FA6620]];
  [(SBHTodayViewController *)self setIsOverlayViewDisappearing:1];
  [v4 presentationProgress];
  double v6 = v5;

  [(SBHTodayViewController *)self setMostRecentPresentationProgress:v6];
}

- (void)overlayController:(id)a3 didChangePresentationProgress:(double)a4 newPresentationProgress:(double)a5 fromLeading:(BOOL)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a6)
  {
    [a3 presentationProgress];
    -[SBHTodayViewController setMostRecentPresentationProgress:](self, "setMostRecentPresentationProgress:");
    if (((BSFloatIsOne() & 1) != 0 || BSFloatIsZero())
      && [(SBHTodayViewController *)self isOverlayViewDisappearing])
    {
      [(SBHTodayViewController *)self invalidateAllCancelTouchesAssertions];
      [(SBHTodayViewController *)self endDisablingWidgetHitTestingForReason:*MEMORY[0x1E4FA6620]];
      [(SBHTodayViewController *)self setIsOverlayViewDisappearing:0];
    }
    [(SBTodayViewController *)self _setStatusBarSettingsAssertionActive:BSFloatGreaterThanFloat()];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = [(SBHTodayViewController *)self observers];
    objc_super v10 = (void *)[v9 copy];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
          if (objc_opt_respondsToSelector()) {
            [v15 todayViewController:self didChangePresentationProgress:1 newPresentationProgress:a4 fromLeading:a5];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

- (BOOL)_shouldIconViewForbidJiggling:(id)a3
{
  id v4 = a3;
  double v5 = [(SBHTodayViewController *)self listView];
  int v6 = [v5 isEditing];

  if (!v6) {
    goto LABEL_4;
  }
  int64_t v7 = [(SBHTodayViewController *)self listView];
  uint64_t v8 = [v7 icons];
  id v9 = [v4 icon];
  int v10 = [v8 containsObject:v9];

  if (!v10) {
    goto LABEL_4;
  }
  uint64_t v11 = [(SBHTodayViewController *)self onScreenIconIndexRangeByIconListView];
  uint64_t v12 = [(SBHTodayViewController *)self listView];
  uint64_t v13 = [v11 objectForKey:v12];
  unint64_t v14 = [v13 rangeValue];
  unint64_t v16 = v15;

  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v19 = [(SBTodayViewController *)self view];
    CGFloat v20 = [(SBTodayViewController *)self spotlightPresenter];
    uint64_t v21 = [v20 searchBarViewController];
    CGFloat v22 = [v21 view];

    v23 = [(SBHTodayViewController *)self scrollView];
    [v23 adjustedContentInset];
    double v25 = v24;

    [v22 frame];
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    v34 = [v22 superview];
    objc_msgSend(v19, "convertRect:fromView:", v34, v27, v29, v31, v33);
    CGFloat v36 = v35;
    double v38 = v37;
    CGFloat v40 = v39;
    double v42 = v41;

    v43 = [(SBHTodayViewController *)self listView];
    v44 = [v4 icon];
    unint64_t v45 = [v43 indexOfIcon:v44];

    BOOL v17 = 1;
    if (v45 >= v14 && v45 - v14 < v16)
    {
      double v46 = v42 + v25 + v38;
      [v4 frame];
      double v48 = v47;
      double v50 = v49;
      double v52 = v51;
      double v54 = v53;
      v55 = [v4 superview];
      objc_msgSend(v19, "convertRect:fromView:", v55, v48, v50, v52, v54);
      CGFloat v57 = v56;
      double v59 = v58;
      CGFloat v61 = v60;
      CGFloat v63 = v62;

      double v64 = v25 + v59;
      v71.origin.double y = 0.0;
      v67.origin.double x = v57;
      v67.origin.double y = v64;
      v67.size.width = v61;
      v67.size.height = v63;
      v71.origin.double x = v36;
      v71.size.width = v40;
      v71.size.height = v46;
      if (CGRectIntersectsRect(v67, v71))
      {
        v68.origin.double y = 0.0;
        v68.origin.double x = v36;
        v68.size.width = v40;
        v68.size.height = v46;
        double MaxY = CGRectGetMaxY(v68);
        v69.origin.double x = v57;
        v69.origin.double y = v64;
        v69.size.width = v61;
        v69.size.height = v63;
        CGFloat v66 = MaxY - CGRectGetMinY(v69);
        v70.origin.double x = v57;
        v70.origin.double y = v64;
        v70.size.width = v61;
        v70.size.height = v63;
        BOOL v17 = v66 > CGRectGetHeight(v70);
      }
      else
      {
        BOOL v17 = 0;
      }
    }
  }
  else
  {
LABEL_4:
    BOOL v17 = 0;
  }

  return v17;
}

- (void)cleanupViews
{
  if ([(SBTodayViewController *)self isSpotlightVisible]) {
    [(SBTodayViewSpotlightPresenter *)self->_spotlightPresenter dismissSpotlightAnimated:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)SBTodayViewController;
  [(SBHTodayViewController *)&v3 cleanupViews];
}

- (void)_setStatusBarSettingsAssertionActive:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(SBTodayViewController *)self statusBarSettingsAssertion];
  if (v3 && !v5)
  {
    id v14 = 0;
    int v6 = [(UIViewController *)self _sbWindowScene];
    int64_t v7 = [v6 statusBarManager];
    uint64_t v8 = [v7 assertionManager];

    id v9 = objc_alloc_init(SBMutableStatusBarSettings);
    int v10 = [(SBHTodayViewController *)self effectiveLegibilitySettings];
    [(SBMutableStatusBarSettings *)v9 setLegibilitySettings:v10];

    uint64_t v11 = (void *)[v8 newSettingsAssertionWithSettings:v9 atLevel:2 reason:@"Today View"];
    uint64_t v12 = __62__SBTodayViewController__setStatusBarSettingsAssertionActive___block_invoke();
    [v11 acquireWithAnimationParameters:v12];

    [(SBTodayViewController *)self setStatusBarSettingsAssertion:v11];
LABEL_7:
    double v5 = v14;
    goto LABEL_8;
  }
  if (!v3 && v5)
  {
    id v14 = v5;
    uint64_t v13 = __62__SBTodayViewController__setStatusBarSettingsAssertionActive___block_invoke();
    [v14 invalidateWithAnimationParameters:v13];

    [(SBTodayViewController *)self setStatusBarSettingsAssertion:0];
    goto LABEL_7;
  }
LABEL_8:
}

id __62__SBTodayViewController__setStatusBarSettingsAssertionActive___block_invoke()
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F42E48]) initWithDefaultParameters];
  [v0 duration];
  [v0 setDuration:v1 * 0.6];
  return v0;
}

- (int64_t)idleTimerDuration
{
  v2 = [(SBTodayViewController *)self spotlightPresenter];
  if ([v2 isPresenting]) {
    int64_t v3 = 6;
  }
  else {
    int64_t v3 = 5;
  }

  return v3;
}

- (int64_t)idleTimerMode
{
  return 1;
}

- (int64_t)idleWarnMode
{
  return 2;
}

- (int64_t)scrollingStrategy
{
  return 0;
}

- (int64_t)notificationBehavior
{
  return 0;
}

- (unint64_t)restrictedCapabilities
{
  return 4096;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (NSString)coverSheetIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int64_t v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    uint64_t v11 = self;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Determining participantState for %@", (uint8_t *)&v10, 0xCu);
  }

  [(SBHTodayViewController *)self mostRecentPresentationProgress];
  char v4 = BSFloatLessThanFloat();
  double v5 = [(SBTodayViewController *)self viewIfLoaded];
  int v6 = [v5 superview];
  if (!v6 || ([(SBTodayViewController *)self bs_isDisappearingOrDisappeared] & 1) != 0)
  {

LABEL_6:
    int64_t v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      uint64_t v11 = self;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Determined participantState for %@ to be Inactive", (uint8_t *)&v10, 0xCu);
    }
    int64_t v8 = 1;
    goto LABEL_9;
  }

  if (v4) {
    goto LABEL_6;
  }
  int64_t v7 = SBLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    uint64_t v11 = self;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Determined participantState for %@ to be ACTIVE", (uint8_t *)&v10, 0xCu);
  }
  int64_t v8 = 2;
LABEL_9:

  return v8;
}

- (SBViewControllerTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
}

- (SBWindowSceneStatusBarSettingsAssertion)statusBarSettingsAssertion
{
  return self->_statusBarSettingsAssertion;
}

- (void)setStatusBarSettingsAssertion:(id)a3
{
}

- (SBTodayViewSpotlightPresenter)spotlightPresenter
{
  return self->_spotlightPresenter;
}

- (void)setSpotlightPresenter:(id)a3
{
}

- (SBFTouchPassThroughView)spotlightContainerView
{
  return self->_spotlightContainerView;
}

- (void)setSpotlightContainerView:(id)a3
{
}

- (UITapGestureRecognizer)dismissTapGestureRecognizer
{
  return self->_dismissTapGestureRecognizer;
}

- (void)setDismissTapGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_spotlightContainerView, 0);
  objc_storeStrong((id *)&self->_spotlightPresenter, 0);
  objc_storeStrong((id *)&self->_statusBarSettingsAssertion, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end