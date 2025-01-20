@interface _UITabBarControllerVisualStyle
- (BOOL)canDisplaySidebar;
- (BOOL)canDisplayTabBar;
- (BOOL)canToggleSidebar;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isBarHidden;
- (BOOL)isScrollViewObservationInCompatibilityMode;
- (BOOL)isTabBarEffectivelyHidden;
- (BOOL)overrideUISplitViewControllerToCompact;
- (BOOL)prefersTabBarFocusedOnViewDidLoad;
- (BOOL)removeTabBarFocusedOnViewDidDisappear;
- (BOOL)shouldEnforceChildSelectionInGroupTabs;
- (BOOL)shouldForgetRememberedFocusItemForSelectedViewController:(id)a3 context:(id)a4;
- (BOOL)shouldSuppressPresses:(id)a3 withEvent:(id)a4;
- (BOOL)shouldTrackContentScrollView:(id)a3 viewController:(id)a4 tabBarBackgroundRequired:(BOOL)a5;
- (BOOL)supportsFocusGestures;
- (BOOL)supportsShowingMoreItem;
- (BOOL)suppressesEditingUI;
- (BOOL)transitionFromViewController:(id)a3 toViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (BOOL)updatesTabBarFocusHeadingOnChange;
- (BOOL)wantsDefaultTabBar;
- (UIEdgeInsets)additionalContentMargins;
- (UIEdgeInsets)edgeInsetsForChildViewController:(id)a3;
- (UIEdgeInsets)overlayInsetsAdjustment;
- (UITabBarController)tabBarController;
- (_UITabBarControllerVisualStyle)initWithTabBarController:(id)a3;
- (id)_tabCustomizationProxy;
- (id)childViewControllerForStatusBarStyle;
- (id)defaultAnimatorForFromViewController:(id)a3 toViewController:(id)a4;
- (id)resolvedPopoverPresentationControllerSourceItemForTab:(id)a3;
- (id)tabBarView;
- (id)viewControllerForObservableScrollViewFromViewController:(id)a3;
- (int64_t)backGestureRecognizerPressType;
- (int64_t)preferredCenterStatusBarStyle;
- (int64_t)preferredLeadingStatusBarStyle;
- (int64_t)preferredTrailingStatusBarStyle;
- (int64_t)tabBarPosition;
- (unint64_t)defaultMaxItems;
- (unint64_t)tabBarFocusSpeedBumpEdges;
- (void)_accessibilityLongPressChanged:(id)a3;
- (void)_performBackGesture:(id)a3;
- (void)_performSelectGesture:(id)a3;
- (void)_updateAccessibilityGestureEnableState;
- (void)editingStateDidChange;
- (void)performWithoutNotifyingTabBarController:(id)a3;
- (void)sendSelectionEventsForControl:(id)a3;
- (void)setBarHidden:(BOOL)a3;
- (void)setBarHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)teardown;
- (void)updateFocusForSelectedViewControllerChange;
- (void)updateGestureRecognizers;
- (void)updateTabBarLayout;
- (void)updateTabForChildViewController:(id)a3;
- (void)updateViewControllerForReselection:(id)a3;
@end

@implementation _UITabBarControllerVisualStyle

- (UIEdgeInsets)additionalContentMargins
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)shouldTrackContentScrollView:(id)a3 viewController:(id)a4 tabBarBackgroundRequired:(BOOL)a5
{
  BOOL v5 = a5;
  if (_UIBarsApplyChromelessEverywhere())
  {
    v7 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    int v8 = ([v7 _isBarEffectivelyHidden] | v5) ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (UIEdgeInsets)edgeInsetsForChildViewController:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarController);
  uint64_t v6 = [WeakRetained _effectiveTabBarPosition];

  v7 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  int v8 = -[UITabBarController _internalTabBar](v7);

  if (v6 == 2) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 4;
  }
  uint64_t v10 = [v4 edgesForExtendedLayout];
  if ([v8 _isTranslucent]) {
    int v11 = 1;
  }
  else {
    int v11 = [v4 extendedLayoutIncludesOpaqueBars];
  }
  v12 = [v8 superview];
  if (!v12 || [v8 isHidden])
  {

    double v13 = 0.0;
    double v14 = 0.0;
    goto LABEL_14;
  }
  BOOL v15 = (v10 & v9) != 0;
  v16 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  unsigned int v17 = v15 & ~[v16 _isBarHidden] & v11;

  double v14 = 0.0;
  if (v17 != 1)
  {
LABEL_13:
    double v13 = 0.0;
    goto LABEL_14;
  }
  objc_msgSend(v8, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v20 = v19;
  if (v6 == 2)
  {
    [v8 frame];
    double v14 = v20 + CGRectGetMinY(v31);
    goto LABEL_13;
  }
  double v25 = v18;
  v26 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  [v26 _contentOverlayInsets];
  double v13 = v20 - v27;

  [v8 bounds];
  if (v29 != v25 || v28 != v20)
  {
    v30 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    [v30 _invalidateBarLayout];
  }
LABEL_14:

  double v21 = 0.0;
  double v22 = 0.0;
  double v23 = v14;
  double v24 = v13;
  result.right = v22;
  result.bottom = v24;
  result.left = v21;
  result.top = v23;
  return result;
}

- (BOOL)isTabBarEffectivelyHidden
{
  double v2 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  double v3 = -[UITabBarController _internalTabBar](v2);

  if (v3) {
    char v4 = [v3 isHidden];
  }
  else {
    char v4 = 1;
  }
  BOOL v5 = [v3 traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 6) {
    BOOL v7 = v4;
  }
  else {
    BOOL v7 = 1;
  }
  if (v6 != 6 && (v4 & 1) == 0)
  {
    [v3 alpha];
    BOOL v7 = v8 == 0.0;
  }

  return v7;
}

- (UITabBarController)tabBarController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarController);
  return (UITabBarController *)WeakRetained;
}

- (BOOL)overrideUISplitViewControllerToCompact
{
  double v2 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  double v3 = [v2 traitCollection];
  BOOL v4 = [v3 userInterfaceIdiom] != 6;

  return v4;
}

- (UIEdgeInsets)overlayInsetsAdjustment
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)teardown
{
  if (self->_backGestureRecognizer)
  {
    double v3 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    id v6 = [v3 _containerView];

    [v6 removeGestureRecognizer:self->_backGestureRecognizer];
    backGestureRecognizer = self->_backGestureRecognizer;
    self->_backGestureRecognizer = 0;

    [v6 removeGestureRecognizer:self->_selectGestureRecognizer];
    selectGestureRecognizer = self->_selectGestureRecognizer;
    self->_selectGestureRecognizer = 0;
  }
}

- (BOOL)removeTabBarFocusedOnViewDidDisappear
{
  return 1;
}

- (void)_updateAccessibilityGestureEnableState
{
  if (self->_accessibilityLongPressGestureRecognizer)
  {
    double v3 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    double v4 = [v3 traitCollection];
    uint64_t v5 = [v4 _isLargeContentViewerEnabled];

    accessibilityLongPressGestureRecognizer = self->_accessibilityLongPressGestureRecognizer;
    [(UIGestureRecognizer *)accessibilityLongPressGestureRecognizer setEnabled:v5];
  }
}

- (id)childViewControllerForStatusBarStyle
{
  double v2 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  double v3 = [v2 _selectedViewControllerInTabBar];

  return v3;
}

- (int64_t)preferredTrailingStatusBarStyle
{
  return 4;
}

- (int64_t)preferredLeadingStatusBarStyle
{
  return 4;
}

- (int64_t)preferredCenterStatusBarStyle
{
  return 4;
}

- (id)viewControllerForObservableScrollViewFromViewController:(id)a3
{
  return (id)[a3 _viewControllerForObservableScrollView];
}

- (BOOL)isScrollViewObservationInCompatibilityMode
{
  return 0;
}

- (BOOL)transitionFromViewController:(id)a3 toViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  return 0;
}

- (BOOL)prefersTabBarFocusedOnViewDidLoad
{
  return 0;
}

- (void)updateTabBarLayout
{
  double v3 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  -[UITabBarController _internalTabBar](v3);
  id v23 = (id)objc_claimAutoreleasedReturnValue();

  double v4 = [v23 window];
  if (v4)
  {
  }
  else
  {
    double v20 = [v23 _expectedSuperviewFollowingAnimation];

    if (v20) {
      goto LABEL_19;
    }
  }
  uint64_t v5 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  uint64_t v6 = [v5 _effectiveTabBarPosition];

  BOOL v7 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  double v8 = [v7 _containerView];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  double v13 = *MEMORY[0x1E4F1DB30];
  double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  objc_msgSend(v23, "sizeThatFits:", *MEMORY[0x1E4F1DB30], v14);
  if ((unint64_t)(v6 - 3) >= 2) {
    double v17 = v16;
  }
  else {
    double v17 = v15;
  }
  double v18 = 0.0;
  switch(v6)
  {
    case 0:
    case 1:
      double v19 = v12 - v17;
      double v12 = v17;
      goto LABEL_15;
    case 2:
      double v12 = v17;
      break;
    case 3:
      goto LABEL_13;
    case 4:
      double v18 = v10 - v17;
LABEL_13:
      double v10 = v17;
      break;
    default:
      double v12 = 0.0;
      double v10 = 0.0;
      break;
  }
  double v19 = 0.0;
LABEL_15:
  -[_UITabBarControllerVisualStyle adjustedTabBarFrame:](self, "adjustedTabBarFrame:", v18, v19, v10, v12);
  objc_msgSend(v23, "setFrame:");
  objc_msgSend(v23, "sizeThatFits:", v13, v14);
  if ((unint64_t)(v6 - 3) >= 2) {
    double v21 = v22;
  }
  if (v17 != v21) {
    [(_UITabBarControllerVisualStyle *)self updateTabBarLayout];
  }
LABEL_19:
}

- (void)updateGestureRecognizers
{
  v24[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_UITabBarControllerVisualStyle *)self supportsFocusGestures];
  double v4 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  uint64_t v5 = [v4 _containerView];

  backGestureRecognizer = self->_backGestureRecognizer;
  if (v3)
  {
    if (!backGestureRecognizer)
    {
      BOOL v7 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel__performBackGesture_];
      double v8 = self->_backGestureRecognizer;
      self->_backGestureRecognizer = v7;

      [(UIGestureRecognizer *)self->_backGestureRecognizer setDelegate:self];
      double v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[_UITabBarControllerVisualStyle backGestureRecognizerPressType](self, "backGestureRecognizerPressType"));
      v24[0] = v9;
      double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
      [(UITapGestureRecognizer *)self->_backGestureRecognizer setAllowedPressTypes:v10];

      [v5 addGestureRecognizer:self->_backGestureRecognizer];
      double v11 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel__performSelectGesture_];
      selectGestureRecognizer = self->_selectGestureRecognizer;
      self->_selectGestureRecognizer = v11;

      [(UIGestureRecognizer *)self->_selectGestureRecognizer setDelegate:self];
      [(UITapGestureRecognizer *)self->_selectGestureRecognizer setAllowedPressTypes:&unk_1ED3F1210];
      [v5 addGestureRecognizer:self->_selectGestureRecognizer];
    }
  }
  else if (backGestureRecognizer)
  {
    objc_msgSend(v5, "removeGestureRecognizer:");
    double v13 = self->_backGestureRecognizer;
    self->_backGestureRecognizer = 0;

    [v5 removeGestureRecognizer:self->_selectGestureRecognizer];
    double v14 = self->_selectGestureRecognizer;
    self->_selectGestureRecognizer = 0;
  }
  accessibilityLongPressGestureRecognizer = self->_accessibilityLongPressGestureRecognizer;
  if (accessibilityLongPressGestureRecognizer) {
    goto LABEL_10;
  }
  if (dyld_program_sdk_at_least())
  {
    double v16 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:sel__accessibilityLongPressChanged_];
    double v17 = self->_accessibilityLongPressGestureRecognizer;
    self->_accessibilityLongPressGestureRecognizer = v16;

    [(UILongPressGestureRecognizer *)self->_accessibilityLongPressGestureRecognizer setMinimumPressDuration:0.15];
    [(UIGestureRecognizer *)self->_accessibilityLongPressGestureRecognizer setDelegate:self];
    double v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:self selector:sel__updateAccessibilityGestureEnableState name:@"UILargeContentViewerInteractionEnabledStatusDidChangeNotification" object:0];
  }
  accessibilityLongPressGestureRecognizer = self->_accessibilityLongPressGestureRecognizer;
  if (accessibilityLongPressGestureRecognizer)
  {
LABEL_10:
    double v19 = [(UIGestureRecognizer *)accessibilityLongPressGestureRecognizer view];
    double v20 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    double v21 = -[UITabBarController _internalTabBar](v20);

    if (v19 != v21)
    {
      double v22 = [(_UITabBarControllerVisualStyle *)self tabBarController];
      id v23 = -[UITabBarController _internalTabBar](v22);
      [v23 addGestureRecognizer:self->_accessibilityLongPressGestureRecognizer];
    }
  }
  [(_UITabBarControllerVisualStyle *)self _updateAccessibilityGestureEnableState];
}

- (BOOL)supportsFocusGestures
{
  return 0;
}

- (unint64_t)tabBarFocusSpeedBumpEdges
{
  return 0;
}

- (BOOL)wantsDefaultTabBar
{
  double v2 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  BOOL v3 = [v2 traitCollection];
  BOOL v4 = [v3 userInterfaceIdiom] != 6;

  return v4;
}

- (id)tabBarView
{
  double v2 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  BOOL v3 = -[UITabBarController _internalTabBar](v2);

  return v3;
}

- (_UITabBarControllerVisualStyle)initWithTabBarController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UITabBarControllerVisualStyle;
  uint64_t v5 = [(_UITabBarControllerVisualStyle *)&v8 init];
  uint64_t v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_tabBarController, v4);
  }

  return v6;
}

- (BOOL)isBarHidden
{
  return self->_barHidden;
}

- (void)updateTabForChildViewController:(id)a3
{
}

- (BOOL)suppressesEditingUI
{
  return 0;
}

- (BOOL)shouldEnforceChildSelectionInGroupTabs
{
  return 0;
}

- (void)performWithoutNotifyingTabBarController:(id)a3
{
  BOOL suppressTabBarControllerNotification = self->_suppressTabBarControllerNotification;
  self->_BOOL suppressTabBarControllerNotification = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_BOOL suppressTabBarControllerNotification = suppressTabBarControllerNotification;
}

- (void)setBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_barHidden != a3)
  {
    BOOL v4 = a3;
    self->_barHidden = a3;
    if (!self->_suppressTabBarControllerNotification)
    {
      BOOL v5 = a4;
      uint64_t v6 = [(_UITabBarControllerVisualStyle *)self tabBarController];
      id v9 = v6;
      if (v4)
      {
        if (v5) {
          uint64_t v7 = 7;
        }
        else {
          uint64_t v7 = 0;
        }
        [v6 _hideBarWithTransition:v7 isExplicit:1];
      }
      else
      {
        if (v5) {
          uint64_t v8 = 3;
        }
        else {
          uint64_t v8 = 0;
        }
        [v6 _showBarWithTransition:v8 isExplicit:1];
      }
    }
  }
}

- (BOOL)canDisplayTabBar
{
  return 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabBarController);
  objc_storeStrong((id *)&self->_accessibilityLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_selectGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_backGestureRecognizer, 0);
}

- (BOOL)supportsShowingMoreItem
{
  return 0;
}

- (int64_t)tabBarPosition
{
  return 0;
}

- (unint64_t)defaultMaxItems
{
  return 0;
}

- (void)updateViewControllerForReselection:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = (id)[v4 popToRootViewControllerAnimated:1];
  }
}

- (id)resolvedPopoverPresentationControllerSourceItemForTab:(id)a3
{
  return (id)[a3 _resolvedTabBarItemSourceItemForPopoverPresentationControllerSourceItem];
}

- (id)_tabCustomizationProxy
{
  return 0;
}

- (BOOL)canDisplaySidebar
{
  return 0;
}

- (BOOL)canToggleSidebar
{
  return 0;
}

- (void)editingStateDidChange
{
  id v3 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  id v4 = [v3 sidebar];
  id v8 = [v4 _outlineView];

  if (v8)
  {
    uint64_t v5 = +[UIView areAnimationsEnabled];
    uint64_t v6 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    uint64_t v7 = [v6 isEditing];

    -[_UITabOutlineView tabModelEditingStateDidChange]((uint64_t)v8);
    -[_UITabOutlineView setEditing:animated:]((uint64_t)v8, v7, v5);
  }
}

- (BOOL)updatesTabBarFocusHeadingOnChange
{
  return 0;
}

- (int64_t)backGestureRecognizerPressType
{
  return 7;
}

- (BOOL)shouldSuppressPresses:(id)a3 withEvent:(id)a4
{
  return 0;
}

- (void)sendSelectionEventsForControl:(id)a3
{
  id v3 = a3;
  [v3 sendActionsForControlEvents:1];
  [v3 sendActionsForControlEvents:64];
}

- (void)updateFocusForSelectedViewControllerChange
{
  id v2 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  [v2 _setPreferTabBarFocused:0];
}

- (BOOL)shouldForgetRememberedFocusItemForSelectedViewController:(id)a3 context:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 view];
  uint64_t v7 = [v5 nextFocusedItem];

  LOBYTE(v5) = _UIFocusEnvironmentIsAncestorOfEnvironment(v6, v7);
  return (char)v5;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (UITapGestureRecognizer *)a3;
  id v5 = v4;
  if (self->_backGestureRecognizer == v4)
  {
    uint64_t v7 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    int v6 = [v7 _isTabBarFocused] ^ 1;
LABEL_6:

    goto LABEL_7;
  }
  if (self->_selectGestureRecognizer == v4)
  {
    uint64_t v7 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    LOBYTE(v6) = [v7 _isTabBarFocused];
    goto LABEL_6;
  }
  LOBYTE(v6) = 1;
LABEL_7:

  return v6;
}

- (void)_performBackGesture:(id)a3
{
  id v3 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  [v3 _performFocusGesture:0];
}

- (void)_performSelectGesture:(id)a3
{
  id v4 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  int v5 = [v4 _isTabBarFocused];

  if (v5)
  {
    int v6 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    uint64_t v7 = [v6 _focusSystem];
    id v10 = [v7 _focusedView];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_UITabBarControllerVisualStyle *)self sendSelectionEventsForControl:v10];
      id v8 = [(_UITabBarControllerVisualStyle *)self tabBarController];
      [v8 _setPreferTabBarFocused:0];

      id v9 = [(_UITabBarControllerVisualStyle *)self tabBarController];
      [v9 setNeedsFocusUpdate];
    }
  }
}

- (void)_accessibilityLongPressChanged:(id)a3
{
  id v4 = a3;
  int v5 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  -[UITabBarController _internalTabBar](v5);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  [v4 locationInView:v11];
  int v6 = objc_msgSend(v11, "_tabBarItemForButtonAtPoint:");
  uint64_t v7 = [v4 state];

  if ((unint64_t)(v7 - 1) >= 2)
  {
    if (v7 == 3 && v6)
    {
      id v10 = [(_UITabBarControllerVisualStyle *)self tabBarController];
      [v10 _tabBarItemClicked:v6];
    }
  }
  else if (v6)
  {
    id v8 = +[UIAccessibilityHUDItem HUDItemForTabBarItem:v6];
    id v9 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    [v9 _showAccessibilityHUDItem:v8];

    goto LABEL_8;
  }
  id v8 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  [v8 _dismissAccessibilityHUD];
LABEL_8:
}

- (void)setBarHidden:(BOOL)a3
{
}

- (id)defaultAnimatorForFromViewController:(id)a3 toViewController:(id)a4
{
  return 0;
}

@end