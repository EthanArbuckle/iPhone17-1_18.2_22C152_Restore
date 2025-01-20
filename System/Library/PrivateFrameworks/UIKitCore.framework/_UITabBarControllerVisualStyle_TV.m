@interface _UITabBarControllerVisualStyle_TV
- (BOOL)_isModernBar;
- (BOOL)_shouldAdjustContentViewFrameForOffscreenFocus:(id)a3 adjustedTabBarFrame:(CGRect)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isScrollViewObservationInCompatibilityMode;
- (BOOL)prefersTabBarFocusedOnViewDidLoad;
- (BOOL)removeTabBarFocusedOnViewDidDisappear;
- (BOOL)shouldForgetRememberedFocusItemForSelectedViewController:(id)a3 context:(id)a4;
- (BOOL)shouldTrackContentScrollView:(id)a3 viewController:(id)a4 tabBarBackgroundRequired:(BOOL)a5;
- (BOOL)supportsFocusGestures;
- (BOOL)supportsShowingMoreItem;
- (CGRect)adjustedContentViewFrame:(CGRect)a3 viewController:(id)a4;
- (CGRect)adjustedTabBarFrame:(CGRect)a3;
- (UIEdgeInsets)edgeInsetsForChildViewController:(id)a3;
- (UIEdgeInsets)overlayInsetsAdjustment;
- (double)_childViewControllerModernBarTopInset;
- (id)defaultAnimatorForFromViewController:(id)a3 toViewController:(id)a4;
- (id)tabBarView;
- (id)viewControllerForObservableScrollViewFromViewController:(id)a3;
- (int64_t)backGestureRecognizerPressType;
- (int64_t)tabBarPosition;
- (unint64_t)defaultMaxItems;
- (unint64_t)tabBarFocusSpeedBumpEdges;
- (void)_performTouchDetectionGesture:(id)a3;
- (void)_scrollViewManagerDidFinishScrolling:(id)a3;
- (void)_updateOffscreenState:(BOOL)a3 withFocusAnimationCoordinator:(id)a4;
- (void)adjustTabBarForContentScrollView:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)loadViews;
- (void)sendSelectionEventsForControl:(id)a3;
- (void)tabContentDidChange:(id)a3;
- (void)teardown;
- (void)updateFocusForSelectedViewControllerChange;
- (void)updateGestureRecognizers;
- (void)updateTabBarLayout;
- (void)updateViewControllers:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation _UITabBarControllerVisualStyle_TV

- (void)teardown
{
  if (self->_touchDetectionGestureRecognizer)
  {
    v3 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    id v5 = [v3 _containerView];

    [v5 removeGestureRecognizer:self->_touchDetectionGestureRecognizer];
    touchDetectionGestureRecognizer = self->_touchDetectionGestureRecognizer;
    self->_touchDetectionGestureRecognizer = 0;
  }
}

- (BOOL)supportsShowingMoreItem
{
  return 0;
}

- (int64_t)tabBarPosition
{
  return 2;
}

- (unint64_t)defaultMaxItems
{
  return 7;
}

- (id)tabBarView
{
  tabBarContainerView = self->_tabBarContainerView;
  if (tabBarContainerView)
  {
    v3 = tabBarContainerView;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_UITabBarControllerVisualStyle_TV;
    v3 = [(_UITabBarControllerVisualStyle *)&v5 tabBarView];
  }
  return v3;
}

- (void)loadViews
{
  v13 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  v2 = -[UITabBarController _internalTabBar](v13);

  if (!v2)
  {
    v3 = [v13 view];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    v12 = -[UITabBar initWithFrame:]([UITabBar alloc], "initWithFrame:", v5, v7, v9, v11);
    [v13 setTabBar:v12];
  }
}

- (void)viewDidLoad
{
  v23[4] = *MEMORY[0x1E4F143B8];
  if (!self->_contentFocusContainerGuide)
  {
    v3 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    double v4 = [v3 _containerView];

    double v5 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    v22 = -[UITabBarController _internalTabBar](v5);

    double v6 = objc_alloc_init(UIFocusContainerGuide);
    contentFocusContainerGuide = self->_contentFocusContainerGuide;
    self->_contentFocusContainerGuide = v6;

    [v4 addLayoutGuide:self->_contentFocusContainerGuide];
    [(UILayoutGuide *)self->_contentFocusContainerGuide setIdentifier:@"UITabBarControllerFocusContentContainerGuide"];
    v17 = (void *)MEMORY[0x1E4F5B268];
    v21 = [(UILayoutGuide *)self->_contentFocusContainerGuide topAnchor];
    v20 = [v22 bottomAnchor];
    v19 = [v21 constraintEqualToAnchor:v20];
    v23[0] = v19;
    v18 = [(UILayoutGuide *)self->_contentFocusContainerGuide leadingAnchor];
    double v8 = [v4 leadingAnchor];
    double v9 = [v18 constraintEqualToAnchor:v8];
    v23[1] = v9;
    double v10 = [(UILayoutGuide *)self->_contentFocusContainerGuide trailingAnchor];
    double v11 = [v4 trailingAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v23[2] = v12;
    v13 = [(UILayoutGuide *)self->_contentFocusContainerGuide bottomAnchor];
    v14 = [v4 bottomAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v23[3] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
    [v17 activateConstraints:v16];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  double v8 = [v5 navigationController];

  double v6 = v8;
  if (v8)
  {
    char v7 = [v8 isNavigationBarHidden];
    double v6 = v8;
    if ((v7 & 1) == 0)
    {
      [v8 setNavigationBarHidden:1 animated:v3];
      double v6 = v8;
      *(unsigned char *)&self->_flags |= 1u;
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  if (*(unsigned char *)&self->_flags)
  {
    BOOL v3 = a3;
    double v5 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    id v6 = [v5 navigationController];

    [v6 setNavigationBarHidden:0 animated:v3];
    *(unsigned char *)&self->_flags &= ~1u;
  }
}

- (void)updateViewControllers:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  [v4 _rebuildTabBarItemsAnimated:v3];
}

- (void)tabContentDidChange:(id)a3
{
  id v4 = a3;
  double v5 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  -[UITabBarController _internalTabBar](v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [v7 isLocked];
  [v7 setLocked:0];
  [v4 _updateView];

  [v7 setLocked:v6];
}

- (BOOL)prefersTabBarFocusedOnViewDidLoad
{
  if ([(_UITabBarControllerVisualStyle_TV *)self _isModernBar])
  {
    BOOL v3 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    int v4 = [v3 _shouldFocusViewControllerAfterTransition] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (BOOL)removeTabBarFocusedOnViewDidDisappear
{
  return 0;
}

- (BOOL)supportsFocusGestures
{
  return 1;
}

- (unint64_t)tabBarFocusSpeedBumpEdges
{
  return 4;
}

- (int64_t)backGestureRecognizerPressType
{
  return 5;
}

- (void)updateGestureRecognizers
{
  v7.receiver = self;
  v7.super_class = (Class)_UITabBarControllerVisualStyle_TV;
  [(_UITabBarControllerVisualStyle *)&v7 updateGestureRecognizers];
  if (!self->_touchDetectionGestureRecognizer
    && ![(_UITabBarControllerVisualStyle_TV *)self _isModernBar])
  {
    BOOL v3 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    int v4 = [v3 _containerView];

    double v5 = [(UIGestureRecognizer *)[_UITabBarTouchDetectionGestureRecognizer alloc] initWithTarget:self action:sel__performTouchDetectionGesture_];
    touchDetectionGestureRecognizer = self->_touchDetectionGestureRecognizer;
    self->_touchDetectionGestureRecognizer = &v5->super;

    [(UIGestureRecognizer *)self->_touchDetectionGestureRecognizer setDelegate:self];
    [(UIGestureRecognizer *)self->_touchDetectionGestureRecognizer setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)self->_touchDetectionGestureRecognizer setDelaysTouchesBegan:0];
    [(UIGestureRecognizer *)self->_touchDetectionGestureRecognizer setDelaysTouchesEnded:0];
    [v4 addGestureRecognizer:self->_touchDetectionGestureRecognizer];
  }
}

- (void)sendSelectionEventsForControl:(id)a3
{
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  uint64_t v7 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  int v8 = [(id)v7 _isTabBarFocused];

  LOBYTE(v7) = v8 ^ 1;
  [(_UITabBarControllerVisualStyle_TV *)self _updateOffscreenState:v8 ^ 1u withFocusAnimationCoordinator:v6];

  double v9 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  double v10 = [v9 _observingScrollView];

  [v10 adjustedContentInset];
  double v12 = v11;
  [v10 adjustedContentInset];
  if ((v7 & 1) == 0)
  {
    if (v10)
    {
      double v14 = v13;
      if (![v21 focusHeading])
      {
        double v15 = -v12;
        double v16 = -v14;
        [v10 contentOffset];
        if (v18 != v15 || v17 != v16)
        {
          v19 = [[_UITVScrollViewManager alloc] initWithScrollView:v10 scrollStyle:1];
          scrollViewManager = self->_scrollViewManager;
          self->_scrollViewManager = v19;

          [(_UITVScrollViewManager *)self->_scrollViewManager setDelegate:self];
          -[_UITVScrollViewManager setContentOffset:animated:](self->_scrollViewManager, "setContentOffset:animated:", 1, v15, v16);
        }
      }
    }
  }
}

- (void)updateFocusForSelectedViewControllerChange
{
  if (![(_UITabBarControllerVisualStyle_TV *)self _isModernBar])
  {
    BOOL v3 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    [v3 _setPreferTabBarFocused:1];
  }
  int v4 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  double v5 = [v4 _focusSystem];
  id v7 = [v5 _focusedView];

  id v6 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  [v6 setPreferredFocusedItem:v7];
}

- (BOOL)shouldForgetRememberedFocusItemForSelectedViewController:(id)a3 context:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UITabBarControllerVisualStyle_TV;
  id v7 = a3;
  unsigned __int8 IsAncestorOfEnvironment = [(_UITabBarControllerVisualStyle *)&v13 shouldForgetRememberedFocusItemForSelectedViewController:v7 context:v6];
  double v9 = objc_msgSend(v7, "presentedViewController", v13.receiver, v13.super_class);

  if ((IsAncestorOfEnvironment & 1) == 0 && v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 modalPresentationStyle] == 4)
    {
      double v10 = [v9 view];
      double v11 = [v6 nextFocusedItem];
      unsigned __int8 IsAncestorOfEnvironment = _UIFocusEnvironmentIsAncestorOfEnvironment(v10, v11);
    }
    else
    {
      unsigned __int8 IsAncestorOfEnvironment = 0;
    }
  }

  return IsAncestorOfEnvironment;
}

- (void)_updateOffscreenState:(BOOL)a3 withFocusAnimationCoordinator:(id)a4
{
  BOOL v5 = a3;
  v83[1] = *MEMORY[0x1E4F143B8];
  id v7 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  int v8 = [v7 selectedViewController];
  if ([(_UITabBarControllerVisualStyle_TV *)self _isModernBar])
  {
    uint64_t v9 = [v7 _observingScrollView];
    if (v9)
    {
      double v10 = (void *)v9;
      int v11 = [v8 _tvTabBarShouldAutohide];

      if (v11)
      {
        if (os_variant_has_internal_diagnostics())
        {
          v47 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1853B0000, v47, OS_LOG_TYPE_FAULT, "You cannot return YES for _tvTabBarShouldAutohide if you also set _observingScrollView. Forcing _tvTabBarShouldAutohide to NO.", buf, 2u);
          }
        }
        else
        {
          double v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_updateOffscreenState_withFocusAnimationCoordinator____s_category)+ 8);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "You cannot return YES for _tvTabBarShouldAutohide if you also set _observingScrollView. Forcing _tvTabBarShouldAutohide to NO.", buf, 2u);
          }
        }
        BOOL v5 = 0;
      }
    }
  }
  uint64_t v13 = v5 & [v8 _tvTabBarShouldAutohide];
  double v14 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  int v15 = [v14 _isTabBarOffscreen];

  [v7 _setTabBarOffscreen:v13];
  [(UIView *)self->_tabBarContainerView setUserInteractionEnabled:v13 ^ 1];
  if ((v13 ^ 1) == v15)
  {
    double v16 = -[UITabBarController _internalTabBar]((id *)v7);
    double v17 = [v7 _containerView];
    if (![v7 _isBarLayoutValid])
    {
LABEL_31:

      goto LABEL_32;
    }
    [v16 frame];
    -[_UITabBarControllerVisualStyle_TV adjustedTabBarFrame:](self, "adjustedTabBarFrame:");
    uint64_t v19 = v18;
    uint64_t v21 = v20;
    uint64_t v23 = v22;
    uint64_t v25 = v24;
    BOOL v26 = [(_UITabBarControllerVisualStyle_TV *)self _isModernBar];
    if (!a4 || !v26)
    {
      v34 = [v7 navigationController];
      if (v34)
      {
        v35 = [v7 navigationController];
        int v36 = [v35 isNavigationBarHidden] ^ 1;
      }
      else
      {
        int v36 = 0;
      }

      if (v15) {
        double v37 = 0.0;
      }
      else {
        double v37 = 1.0;
      }
      [v16 setHidden:0];
      [v16 _setShadowAlpha:v37];
      [v16 _setHidesShadow:0];
      if (v36) {
        [v16 setAlpha:v37];
      }
      if (v13) {
        double v38 = 0.2;
      }
      else {
        double v38 = 0.4;
      }
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __89___UITabBarControllerVisualStyle_TV__updateOffscreenState_withFocusAnimationCoordinator___block_invoke_3;
      v61[3] = &unk_1E52FBD40;
      v62 = v16;
      uint64_t v65 = v19;
      uint64_t v66 = v21;
      uint64_t v67 = v23;
      uint64_t v68 = v25;
      double v69 = v37;
      char v70 = v36;
      id v63 = v7;
      id v64 = v8;
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __89___UITabBarControllerVisualStyle_TV__updateOffscreenState_withFocusAnimationCoordinator___block_invoke_4;
      v58[3] = &unk_1E52E0478;
      v59 = v62;
      char v60 = v13;
      +[UIView animateWithDuration:2052 delay:v61 options:v58 animations:v38 completion:0.0];

      v27 = v62;
      goto LABEL_30;
    }
    v27 = self->_tabBarOffscreenFocusGuide;
    if (v27)
    {
      if (v13)
      {
LABEL_14:
        LODWORD(v28) = 1045220557;
        LODWORD(v29) = 0.25;
        LODWORD(v30) = 1.0;
        v31 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v28 :0.0 :v29 :v30];
        v32 = [[UICubicTimingParameters alloc] initWithCustomCurve:v31];

        double v33 = 0.25;
LABEL_29:
        v45 = [[UIViewPropertyAnimator alloc] initWithDuration:v32 timingParameters:v33];
        [(UIViewPropertyAnimator *)v45 _setOptions:608];
        v75[0] = MEMORY[0x1E4F143A8];
        v75[1] = 3221225472;
        v75[2] = __89___UITabBarControllerVisualStyle_TV__updateOffscreenState_withFocusAnimationCoordinator___block_invoke;
        v75[3] = &unk_1E52DA520;
        id v46 = v16;
        id v76 = v46;
        uint64_t v77 = v19;
        uint64_t v78 = v21;
        uint64_t v79 = v23;
        uint64_t v80 = v25;
        [(UIViewPropertyAnimator *)v45 addAnimations:v75];
        v71[0] = MEMORY[0x1E4F143A8];
        v71[1] = 3221225472;
        v71[2] = __89___UITabBarControllerVisualStyle_TV__updateOffscreenState_withFocusAnimationCoordinator___block_invoke_2;
        v71[3] = &unk_1E52EA7D8;
        char v74 = v13;
        id v72 = v46;
        v73 = self;
        [(UIViewPropertyAnimator *)v45 addCompletion:v71];
        [(UIViewPropertyAnimator *)v45 startAnimation];

LABEL_30:
        goto LABEL_31;
      }
    }
    else
    {
      v27 = objc_alloc_init(UIFocusGuide);
      v83[0] = v16;
      v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:1];
      [(UIFocusGuide *)v27 setPreferredFocusEnvironments:v39];

      [v17 addLayoutGuide:v27];
      v51 = (void *)MEMORY[0x1E4F5B268];
      v56 = [(UILayoutGuide *)v27 topAnchor];
      v55 = [v17 topAnchor];
      v54 = [v56 constraintEqualToAnchor:v55];
      v82[0] = v54;
      v53 = [(UILayoutGuide *)v27 leadingAnchor];
      v52 = [v17 leadingAnchor];
      v50 = [v53 constraintEqualToAnchor:v52];
      v82[1] = v50;
      v49 = [v17 trailingAnchor];
      v48 = [(UILayoutGuide *)v27 trailingAnchor];
      v40 = [v49 constraintEqualToAnchor:v48];
      v82[2] = v40;
      v41 = [(UILayoutGuide *)v27 heightAnchor];
      [v41 constraintEqualToConstant:1.0];
      v42 = v57 = v17;
      v82[3] = v42;
      v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:4];
      [v51 activateConstraints:v43];

      double v17 = v57;
      objc_storeStrong((id *)&self->_tabBarOffscreenFocusGuide, v27);
      if (v13) {
        goto LABEL_14;
      }
    }
    v32 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 1.0, 176.0, 26.0, 0.0, 0.0);
    [(UICubicTimingParameters *)v32 settlingDuration];
    double v33 = v44;
    goto LABEL_29;
  }
LABEL_32:
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  touchDetectionGestureRecognizer = self->_touchDetectionGestureRecognizer;
  if (!touchDetectionGestureRecognizer) {
    return 0;
  }
  return touchDetectionGestureRecognizer == a3 || touchDetectionGestureRecognizer == a4;
}

- (void)_performTouchDetectionGesture:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  -[UITabBarController _internalTabBar](v5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [v4 state];
  if (v6 == 1)
  {
    uint64_t v7 = 1;
  }
  else
  {
    if (v6 == 2) {
      goto LABEL_6;
    }
    uint64_t v7 = 0;
  }
  [v8 _setFocusedItemHightlightShouldBeVisible:v7];
LABEL_6:
}

- (void)updateTabBarLayout
{
  BOOL v3 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  -[UITabBarController _internalTabBar](v3);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  BOOL v5 = [v4 _containerView];

  if ([(_UITabBarControllerVisualStyle_TV *)self _isModernBar])
  {
    [v5 frame];
    double v7 = v6;
    [v15 frame];
    double v9 = v8;
    tabBarContainerView = self->_tabBarContainerView;
    if (!tabBarContainerView)
    {
      [v15 setAutoresizingMask:0];
      int v11 = [[_UITabBarContainerView_TV alloc] initWithTabBar:v15];
      double v12 = self->_tabBarContainerView;
      self->_tabBarContainerView = &v11->super;

      tabBarContainerView = self->_tabBarContainerView;
    }
    -[UIView setFrame:](tabBarContainerView, "setFrame:", 0.0, 46.0, v7, v9);
    uint64_t v13 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    double v14 = [v13 _observingScrollView];

    if (v14) {
      [(_UITabBarControllerVisualStyle_TV *)self adjustTabBarForContentScrollView:v14];
    }
    [v15 frame];
    -[_UITabBarControllerVisualStyle_TV adjustedTabBarFrame:](self, "adjustedTabBarFrame:");
    objc_msgSend(v15, "setFrame:");
  }
  else
  {
    [v15 frame];
    objc_msgSend(v15, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
}

- (CGRect)adjustedTabBarFrame:(CGRect)a3
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  int v9 = [v8 _isTabBarOffscreen];

  BOOL v10 = [(_UITabBarControllerVisualStyle_TV *)self _isModernBar];
  if (y >= 0.0) {
    int v11 = v9;
  }
  else {
    int v11 = 0;
  }
  if (y >= 0.0) {
    int v12 = 1;
  }
  else {
    int v12 = v9;
  }
  double v13 = 0.0;
  if (v12) {
    double v13 = y;
  }
  if (v11 == 1) {
    double v13 = -height;
  }
  if (y >= 0.0) {
    int v14 = v9;
  }
  else {
    int v14 = 0;
  }
  if (y >= 0.0) {
    int v15 = 1;
  }
  else {
    int v15 = v9;
  }
  double v16 = -0.0;
  if (!v15) {
    double v16 = height + 46.0;
  }
  double v17 = y + v16;
  double v18 = y - (height + 46.0);
  if (v14 != 1) {
    double v18 = v17;
  }
  if (!v10) {
    double v18 = v13;
  }
  double v19 = x;
  double v20 = width;
  double v21 = height;
  result.size.double height = v21;
  result.size.CGFloat width = v20;
  result.origin.double y = v18;
  result.origin.CGFloat x = v19;
  return result;
}

- (CGRect)adjustedContentViewFrame:(CGRect)a3 viewController:(id)a4
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  BOOL v10 = [(_UITabBarControllerVisualStyle_TV *)self tabBarView];
  [v10 frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  -[_UITabBarControllerVisualStyle_TV adjustedTabBarFrame:](self, "adjustedTabBarFrame:", v12, v14, v16, v18);
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  LODWORD(v10) = -[_UITabBarControllerVisualStyle_TV _shouldAdjustContentViewFrameForOffscreenFocus:adjustedTabBarFrame:](self, "_shouldAdjustContentViewFrameForOffscreenFocus:adjustedTabBarFrame:", v9);

  if (v10)
  {
    v34.origin.CGFloat x = v20;
    v34.origin.CGFloat y = v22;
    v34.size.CGFloat width = v24;
    v34.size.double height = v26;
    CGFloat y = CGRectGetMaxY(v34);
    v27 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    double v28 = [v27 _containerView];
    [v28 bounds];
    double v29 = CGRectGetHeight(v35);
    v36.origin.CGFloat x = v20;
    v36.origin.CGFloat y = v22;
    v36.size.CGFloat width = v24;
    v36.size.double height = v26;
    double height = v29 - CGRectGetMaxY(v36);
  }
  double v30 = x;
  double v31 = y;
  double v32 = width;
  double v33 = height;
  result.size.double height = v33;
  result.size.CGFloat width = v32;
  result.origin.CGFloat y = v31;
  result.origin.CGFloat x = v30;
  return result;
}

- (UIEdgeInsets)edgeInsetsForChildViewController:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  double v6 = -[UITabBarController _internalTabBar](v5);
  [v6 frame];
  -[_UITabBarControllerVisualStyle_TV adjustedTabBarFrame:](self, "adjustedTabBarFrame:");
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  if ([(_UITabBarControllerVisualStyle_TV *)self _isModernBar])
  {
    [(_UITabBarControllerVisualStyle_TV *)self _childViewControllerModernBarTopInset];
LABEL_5:
    double v16 = MaxY;
    goto LABEL_6;
  }
  double v16 = 0.0;
  if (-[_UITabBarControllerVisualStyle_TV _shouldAdjustContentViewFrameForOffscreenFocus:adjustedTabBarFrame:](self, "_shouldAdjustContentViewFrameForOffscreenFocus:adjustedTabBarFrame:", v4, v8, v10, v12, v14))
  {
    v21.origin.CGFloat x = v8;
    v21.origin.CGFloat y = v10;
    v21.size.CGFloat width = v12;
    v21.size.double height = v14;
    double MaxY = CGRectGetMaxY(v21);
    goto LABEL_5;
  }
LABEL_6:

  double v17 = 0.0;
  double v18 = 0.0;
  double v19 = 0.0;
  double v20 = v16;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v20;
  return result;
}

- (UIEdgeInsets)overlayInsetsAdjustment
{
  BOOL v3 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  if (v3)
  {
    unsigned int v4 = ((v3[94] >> 1) & 3) - 1;

    double v5 = 0.0;
    if (v4 <= 1)
    {
      if ([(_UITabBarControllerVisualStyle_TV *)self _isModernBar]
        && ([(_UITabBarControllerVisualStyle_TV *)self tabBarView],
            double v6 = objc_claimAutoreleasedReturnValue(),
            [v6 frame],
            double MaxY = CGRectGetMaxY(v18),
            v6,
            MaxY < 0.0))
      {
        [(_UITabBarControllerVisualStyle_TV *)self _childViewControllerModernBarTopInset];
        double v5 = -v8;
      }
      else
      {
        double v9 = [(_UITabBarControllerVisualStyle *)self tabBarController];
        double v10 = [v9 selectedViewController];
        double v11 = [v10 view];
        double v12 = [v11 superview];

        if (!v12)
        {
          [(_UITabBarControllerVisualStyle_TV *)self _childViewControllerModernBarTopInset];
          double v5 = v13;
        }
      }
    }
  }
  else
  {
    double v5 = 0.0;
  }
  double v14 = 0.0;
  double v15 = 0.0;
  double v16 = 0.0;
  double v17 = v5;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v17;
  return result;
}

- (BOOL)_shouldAdjustContentViewFrameForOffscreenFocus:(id)a3 adjustedTabBarFrame:(CGRect)a4
{
  double height = a4.size.height;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    double v9 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_5;
    }
    double v10 = NSStringFromSelector(a2);
    int v17 = 138412290;
    CGRect v18 = v10;
    _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "%@ unexpectedly called not on tvOS", (uint8_t *)&v17, 0xCu);
  }
  else
  {
    double v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_shouldAdjustContentViewFrameForOffscreenFocus_adjustedTabBarFrame____s_category)+ 8);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    double v9 = v8;
    double v10 = NSStringFromSelector(a2);
    int v17 = 138412290;
    CGRect v18 = v10;
    _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "%@ unexpectedly called not on tvOS", (uint8_t *)&v17, 0xCu);
  }

LABEL_5:
LABEL_6:
  if ([(_UITabBarControllerVisualStyle_TV *)self _isModernBar])
  {
    BOOL v11 = 0;
  }
  else
  {
    BOOL v11 = 1;
    double v12 = [v7 _contentOrObservableScrollViewForEdge:1];
    double v13 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    char v14 = [v13 _isTabBarOffscreen];

    if ((v14 & 1) == 0)
    {
      BOOL v11 = 0;
      if (([v7 _tvTabBarShouldOverlap] & 1) == 0)
      {
        if (!v12 || ([v12 _focusTargetOffset], v15 <= height)) {
          BOOL v11 = 1;
        }
      }
    }
  }
  return v11;
}

- (double)_childViewControllerModernBarTopInset
{
  v2 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  [v2 _contentOverlayInsets];
  double v4 = 157.0 - v3;

  return v4;
}

- (BOOL)shouldTrackContentScrollView:(id)a3 viewController:(id)a4 tabBarBackgroundRequired:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([(_UITabBarControllerVisualStyle_TV *)self _isModernBar]
    && (int v9 = [v8 _tvTabBarShouldAutohide], (v9 & 1) == 0))
  {
    int v11 = v9;
    double v12 = [v7 _viewControllerForAncestor];
    uint64_t v13 = objc_opt_class();
    char v14 = -[UIViewController _ancestorViewControllerOfClass:allowModalParent:]((uint64_t)v12, v13, 0);
    double v15 = v14;
    if (v14) {
      int v10 = [v14 _tvShouldScrollWithObservedScrollViewIfPossible] & (v11 ^ 1);
    }
    else {
      LOBYTE(v10) = 1;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)adjustTabBarForContentScrollView:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(_UITabBarControllerVisualStyle_TV *)self _isModernBar];
  double v5 = v6;
  if (v4)
  {
    if (v6)
    {
      [v6 contentOffset];
      [v6 adjustedContentInset];
    }
    [(UIView *)self->_tabBarContainerView bounds];
    -[UIView setFrame:](self->_tabBarContainerView, "setFrame:");
    double v5 = v6;
  }
}

- (id)viewControllerForObservableScrollViewFromViewController:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UITabBarControllerVisualStyle_TV;
  double v3 = [(_UITabBarControllerVisualStyle *)&v9 viewControllerForObservableScrollViewFromViewController:a3];
  if (_UIViewControllerUseContentScrollViewAPI())
  {
    if ([v3 _isSearchController])
    {
      uint64_t v4 = [v3 searchResultsController];
    }
    else
    {
      double v5 = [v3 presentedViewController];
      int v6 = [v5 _isSearchController];

      if (!v6) {
        goto LABEL_7;
      }
      id v7 = [v3 presentedViewController];
      uint64_t v4 = [v7 searchResultsController];

      double v3 = v7;
    }

    double v3 = (void *)v4;
  }
LABEL_7:
  return v3;
}

- (BOOL)isScrollViewObservationInCompatibilityMode
{
  if (_UIViewControllerUseContentScrollViewAPI()) {
    return 0;
  }
  return [(_UITabBarControllerVisualStyle_TV *)self _isModernBar];
}

- (void)_scrollViewManagerDidFinishScrolling:(id)a3
{
  scrollViewManager = self->_scrollViewManager;
  self->_scrollViewManager = 0;
}

- (id)defaultAnimatorForFromViewController:(id)a3 toViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(_UITabBarTVTransitioner);
  objc_super v9 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  int v10 = -[UITabBarController _viewControllersForTabs](v9);

  unint64_t v11 = [v10 indexOfObject:v6];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v12 = [v6 parentModalViewController];

    if (v12)
    {
      uint64_t v13 = [v6 parentModalViewController];
      unint64_t v11 = [v10 indexOfObject:v13];
    }
    else
    {
      unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  unint64_t v14 = [v10 indexOfObject:v7];
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v15 = [v7 parentModalViewController];

    if (v15)
    {
      double v16 = [v7 parentModalViewController];
      unint64_t v14 = [v10 indexOfObject:v16];
    }
    else
    {
      unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  BOOL v19 = v11 == 0x7FFFFFFFFFFFFFFFLL || v14 == 0x7FFFFFFFFFFFFFFFLL || v11 <= v14;
  [(_UITabBarTVTransitioner *)v8 setTransitionFromRight:v19];
  double v20 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  CGRect v21 = -[UITabBarController _internalTabBar](v20);
  unint64_t v22 = [v21 _displayStyle];

  if (v22 <= 1) {
    [(_UITabBarTVTransitioner *)v8 setTransitionStyle:v22];
  }

  return v8;
}

- (BOOL)_isModernBar
{
  v2 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  double v3 = -[UITabBarController _internalTabBar](v2);
  BOOL v4 = [v3 _displayStyle] == 1;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollViewManager, 0);
  objc_storeStrong((id *)&self->_touchDetectionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tabBarOffscreenFocusGuide, 0);
  objc_storeStrong((id *)&self->_contentFocusContainerGuide, 0);
  objc_storeStrong((id *)&self->_tabBarContainerView, 0);
}

@end