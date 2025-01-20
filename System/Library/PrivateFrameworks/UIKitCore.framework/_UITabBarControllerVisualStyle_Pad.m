@interface _UITabBarControllerVisualStyle_Pad
- (BOOL)canDisplaySidebar;
- (BOOL)canDisplayTabBar;
- (BOOL)canDisplayUITabBar;
- (BOOL)canToggleSidebar;
- (BOOL)overrideUISplitViewControllerToCompact;
- (BOOL)shouldEnforceChildSelectionInGroupTabs;
- (BOOL)supportsOverlaySidebarMode;
- (BOOL)supportsResizingSidebar;
- (BOOL)supportsTabBar;
- (BOOL)wantsDefaultTabBar;
- (CGRect)adjustedTransitionViewFrame:(CGRect)a3;
- (UIAction)overrideTidebarButtonAction;
- (UIEdgeInsets)additionalContentMargins;
- (UIEdgeInsets)edgeInsetsForChildViewController:(id)a3;
- (_UITabBarControllerVisualStyle_Pad)initWithTabBarController:(id)a3;
- (_UITabContainerView)tabContainerView;
- (double)maximumSidebarWidth;
- (double)minimumSidebarWidth;
- (id)_tabCustomizationProxy;
- (id)childViewControllerForStatusBarStyle;
- (id)resolvedPopoverPresentationControllerSourceItemForTab:(id)a3;
- (id)sidebar;
- (int64_t)_effectivePartStyleForEdge:(int64_t)a3;
- (int64_t)preferredCenterStatusBarStyle;
- (int64_t)preferredLeadingStatusBarStyle;
- (int64_t)preferredTrailingStatusBarStyle;
- (unint64_t)defaultMaxItems;
- (void)_setNeedsContentLayout;
- (void)_updateBarAvailabilityAnimated:(BOOL)a3;
- (void)_updateContentLayoutForSidebarAppearanceIfNeeded;
- (void)_updateHostedNavigationBarsWithWantsHostedTabBarMetrics:(BOOL)a3;
- (void)_updateNavigationBarHostingWithSelectedViewController:(id)a3;
- (void)_updateSidebarResolvedLayout;
- (void)didUpdateVisibleAppearance;
- (void)editingStateDidChange;
- (void)loadViews;
- (void)preferredSidebarModeDidChange;
- (void)selectedViewControllerDidChange;
- (void)setBarHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setMaximumSidebarWidth:(double)a3;
- (void)setMinimumSidebarWidth:(double)a3;
- (void)setOverrideTidebarButtonAction:(id)a3;
- (void)setSupportsResizingSidebar:(BOOL)a3;
- (void)sidebarLayoutDidChange;
- (void)sidebarVisibilityDidChangeWithAnimator:(id)a3;
- (void)tabContentDidChange:(id)a3;
- (void)titleDidChange;
- (void)updateContentLayoutForSidebarAppearanceWithTransitionCoordinator:(id)a3;
- (void)updateTabBarLayout;
- (void)updateViewControllerForReselection:(id)a3;
- (void)updateViewControllers:(BOOL)a3;
- (void)willUpdateViewControllers;
@end

@implementation _UITabBarControllerVisualStyle_Pad

- (_UITabBarControllerVisualStyle_Pad)initWithTabBarController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UITabBarControllerVisualStyle_Pad;
  v3 = [(_UITabBarControllerVisualStyle *)&v5 initWithTabBarController:a3];
  if (v3) {
    +[_UIFloatingTabBar registerPlatformMetrics];
  }
  return v3;
}

- (UIAction)overrideTidebarButtonAction
{
  v2 = [(_UITabBarControllerVisualStyle_Pad *)self tabContainerView];
  v3 = [v2 overrideTidebarButtonAction];

  return (UIAction *)v3;
}

- (void)setOverrideTidebarButtonAction:(id)a3
{
  id v4 = a3;
  id v5 = [(_UITabBarControllerVisualStyle_Pad *)self tabContainerView];
  [v5 setOverrideTidebarButtonAction:v4];
}

- (unint64_t)defaultMaxItems
{
  v3 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  id v4 = [v3 traitCollection];
  uint64_t v5 = [v4 horizontalSizeClass];

  if (v5 == 2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v7.receiver = self;
  v7.super_class = (Class)_UITabBarControllerVisualStyle_Pad;
  return [(_UITabBarControllerVisualStyle_iOS *)&v7 defaultMaxItems];
}

- (BOOL)wantsDefaultTabBar
{
  return 0;
}

- (void)loadViews
{
  id v12 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  if (!self->_tabContainerView)
  {
    v3 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    id v4 = -[UITabBarController _internalTabBar](v3);

    uint64_t v5 = [_UITabContainerView alloc];
    v6 = [v12 sidebar];
    objc_super v7 = [(_UITabContainerView *)v5 initWithSidebar:v6 tabBar:v4];
    tabContainerView = self->_tabContainerView;
    self->_tabContainerView = v7;

    [(_UITabContainerView *)self->_tabContainerView setDelegate:self];
    if (!v4)
    {
      v9 = [(_UITabContainerView *)self->_tabContainerView tabBar];
      [v12 setTabBar:v9];
    }
  }
  if (dyld_program_sdk_at_least())
  {
    v10 = +[UIColor systemBackgroundColor];
    v11 = [v12 view];
    [v11 setBackgroundColor:v10];
  }
}

- (void)_updateNavigationBarHostingWithSelectedViewController:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  v6 = -[UITabBarController _viewControllersForTabs](v5);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v18 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "_hostingNavigationBar", (void)v18);
        if (v13)
        {
          if ([v12 _shouldOverlayTabBar])
          {
            [v13 _setActiveTabBarHost:v12 == v4];
            v14 = [(_UITabBarControllerVisualStyle_Pad *)self tabContainerView];
            [v13 _setTabBarHostedView:v14];
          }
          else
          {
            [v13 _setTabBarHostedView:0];
          }
        }
        else if ([v12 _isSplitViewController])
        {
          id v15 = v12;
          v16 = [(_UITabBarControllerVisualStyle_Pad *)self tabContainerView];
          [v15 _setTabBarHostedView:v16];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  v17 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  [v17 _updateContentOverlayInsetsForSelfAndChildren];
}

- (void)updateTabBarLayout
{
  [(UIView *)self->_tabContainerView frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v11 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  id v12 = [v11 view];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  -[_UITabContainerView setFrame:](self->_tabContainerView, "setFrame:", v14, v16, v18, v20);
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  v26.origin.x = v14;
  v26.origin.y = v16;
  v26.size.width = v18;
  v26.size.height = v20;
  if (!CGRectEqualToRect(v25, v26))
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __56___UITabBarControllerVisualStyle_Pad_updateTabBarLayout__block_invoke;
    v24[3] = &unk_1E52DD590;
    *(CGFloat *)&v24[5] = v4;
    *(CGFloat *)&v24[6] = v6;
    *(CGFloat *)&v24[7] = v8;
    *(CGFloat *)&v24[8] = v10;
    *(double *)&v24[9] = v14;
    *(double *)&v24[10] = v16;
    *(double *)&v24[11] = v18;
    *(double *)&v24[12] = v20;
    v24[4] = self;
    +[UIView performWithoutAnimation:v24];
  }
  [(_UITabBarControllerVisualStyle_Pad *)self _updateSidebarResolvedLayout];
  [(_UITabBarControllerVisualStyle_Pad *)self _updateContentLayoutForSidebarAppearanceIfNeeded];
  [(_UITabBarControllerVisualStyle_Pad *)self _updateHostedNavigationBarsWithWantsHostedTabBarMetrics:1];
  long long v21 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  v22 = [v21 selectedViewController];
  [(_UITabBarControllerVisualStyle_Pad *)self _updateNavigationBarHostingWithSelectedViewController:v22];

  v23.receiver = self;
  v23.super_class = (Class)_UITabBarControllerVisualStyle_Pad;
  [(_UITabBarControllerVisualStyle *)&v23 updateTabBarLayout];
}

- (void)willUpdateViewControllers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)_UITabBarControllerVisualStyle_Pad;
  [(_UITabBarControllerVisualStyle *)&v16 willUpdateViewControllers];
  [(_UITabBarControllerVisualStyle_Pad *)self _updateHostedNavigationBarsWithWantsHostedTabBarMetrics:0];
  double v3 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  CGFloat v4 = -[UITabBarController _viewControllersForTabs](v3);

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        CGFloat v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "_hostingNavigationBar", (void)v12);
        [v11 _setTabBarHostedView:0];

        if ([v10 _isSplitViewController]) {
          [v10 _setTabBarHostedView:0];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)updateViewControllers:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UITabBarControllerVisualStyle_Pad;
  -[_UITabBarControllerVisualStyle_iOS updateViewControllers:](&v5, sel_updateViewControllers_);
  [(_UITabBarControllerVisualStyle_Pad *)self _updateBarAvailabilityAnimated:v3];
  [(_UITabBarControllerVisualStyle_Pad *)self _updateHostedNavigationBarsWithWantsHostedTabBarMetrics:1];
}

- (void)selectedViewControllerDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)_UITabBarControllerVisualStyle_Pad;
  [(_UITabBarControllerVisualStyle *)&v5 selectedViewControllerDidChange];
  BOOL v3 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  CGFloat v4 = [v3 selectedViewController];
  [(_UITabBarControllerVisualStyle_Pad *)self _updateNavigationBarHostingWithSelectedViewController:v4];
}

- (void)titleDidChange
{
  id v6 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  BOOL v3 = [v6 title];
  CGFloat v4 = [(_UITabBarControllerVisualStyle_Pad *)self sidebar];
  objc_super v5 = [v4 _outlineView];
  -[_UITabOutlineView setTitle:](v5, v3);
}

- (void)updateViewControllerForReselection:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  id v6 = [v5 _selectedTabElement];
  int v7 = [v6 _isGroup];

  BOOL v8 = [(_UITabBarControllerVisualStyle_Pad *)self shouldEnforceChildSelectionInGroupTabs];
  if (!v7 || !v8)
  {
    v9.receiver = self;
    v9.super_class = (Class)_UITabBarControllerVisualStyle_Pad;
    [(_UITabBarControllerVisualStyle *)&v9 updateViewControllerForReselection:v4];
  }
}

- (void)_updateHostedNavigationBarsWithWantsHostedTabBarMetrics:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  objc_super v5 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  id v6 = -[UITabBarController _viewControllersForTabs](v5);

  int v7 = [(_UITabBarControllerVisualStyle_Pad *)self tabContainerView];
  if ([v7 canShowFloatingUI])
  {
    BOOL v8 = [(_UITabBarControllerVisualStyle_Pad *)self canDisplayTabBar];

    if (v8) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  BOOL v3 = 0;
LABEL_6:
  if ([(_UITabBarControllerVisualStyle *)self isBarHidden])
  {
    objc_super v9 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    CGFloat v10 = [v9 _overrideTidebarButtonAction];

    if (!v10) {
      BOOL v3 = 0;
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_super v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        double v17 = objc_msgSend(v16, "_hostingNavigationBar", (void)v18);
        objc_msgSend(v17, "_setWantsHostedTabBarMetrics:", v3 & objc_msgSend(v16, "_shouldOverlayTabBar"));
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
}

- (id)resolvedPopoverPresentationControllerSourceItemForTab:(id)a3
{
  return [(_UITabContainerView *)self->_tabContainerView resolvedPopoverPresentationControllerSourceItemForTab:a3];
}

- (void)tabContentDidChange:(id)a3
{
  id v4 = a3;
  if ([v4 _isBridgedItem])
  {
    v5.receiver = self;
    v5.super_class = (Class)_UITabBarControllerVisualStyle_Pad;
    [(_UITabBarControllerVisualStyle_iOS *)&v5 tabContentDidChange:v4];
  }
}

- (BOOL)shouldEnforceChildSelectionInGroupTabs
{
  v2 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  BOOL v3 = [v2 traitCollection];
  BOOL v4 = [v3 horizontalSizeClass] == 2;

  return v4;
}

- (id)_tabCustomizationProxy
{
  v2 = [(_UITabBarControllerVisualStyle_Pad *)self tabContainerView];
  BOOL v3 = [v2 floatingTabBar];
  BOOL v4 = [v3 tabCustomizationProxy];

  return v4;
}

- (id)sidebar
{
  v2 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  BOOL v3 = [v2 sidebar];

  return v3;
}

- (BOOL)canDisplayTabBar
{
  return 1;
}

- (BOOL)canDisplayUITabBar
{
  v2 = [(_UITabBarControllerVisualStyle_Pad *)self tabContainerView];
  char v3 = [v2 canShowFloatingUI] ^ 1;

  return v3;
}

- (BOOL)canDisplaySidebar
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!_os_feature_enabled_impl()) {
    goto LABEL_13;
  }
  char v3 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  uint64_t v4 = [v3 mode];

  if (v4 == 2)
  {
    LOBYTE(v7) = 1;
    return v7;
  }
  if (v4)
  {
LABEL_13:
    LOBYTE(v7) = 0;
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    objc_super v5 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    id v6 = [v5 _tabElements];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v11 + 1) + 8 * i) _isGroup])
          {
            LOBYTE(v7) = 1;
            goto LABEL_17;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
  return v7;
}

- (BOOL)canToggleSidebar
{
  char v3 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  uint64_t v4 = [v3 traitCollection];
  uint64_t v5 = [v4 horizontalSizeClass];

  if (v5 != 2) {
    return 0;
  }
  return [(_UITabBarControllerVisualStyle_Pad *)self canDisplaySidebar];
}

- (BOOL)supportsTabBar
{
  return 1;
}

- (void)setBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = [(_UITabBarControllerVisualStyle *)self isBarHidden];
  v8.receiver = self;
  v8.super_class = (Class)_UITabBarControllerVisualStyle_Pad;
  [(_UITabBarControllerVisualStyle *)&v8 setBarHidden:v5 animated:v4];
  if (v7 != v5) {
    [(_UITabBarControllerVisualStyle_Pad *)self _updateBarAvailabilityAnimated:v4];
  }
}

- (void)preferredSidebarModeDidChange
{
  [(_UITabBarControllerVisualStyle_Pad *)self _updateBarAvailabilityAnimated:0];
  [(_UITabBarControllerVisualStyle_Pad *)self _setNeedsContentLayout];
  [(_UITabBarControllerVisualStyle_Pad *)self _updateContentLayoutForSidebarAppearanceIfNeeded];
}

- (void)sidebarLayoutDidChange
{
  [(_UITabBarControllerVisualStyle_Pad *)self _setNeedsContentLayout];
  [(_UITabBarControllerVisualStyle_Pad *)self _updateContentLayoutForSidebarAppearanceIfNeeded];
}

- (void)sidebarVisibilityDidChangeWithAnimator:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  BOOL v5 = [v4 view];
  id v6 = [v5 _window];
  BOOL v7 = v6 != 0;

  [(_UITabContainerView *)self->_tabContainerView updateSidebarAppearanceStateAnimated:v7 animator:v8];
}

- (BOOL)supportsResizingSidebar
{
  v2 = [(_UITabBarControllerVisualStyle_Pad *)self tabContainerView];
  char v3 = [v2 supportsResizingSidebar];

  return v3;
}

- (void)setSupportsResizingSidebar:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UITabBarControllerVisualStyle_Pad *)self tabContainerView];
  [v4 setSupportsResizingSidebar:v3];
}

- (double)minimumSidebarWidth
{
  v2 = [(_UITabBarControllerVisualStyle_Pad *)self tabContainerView];
  [v2 minimumSidebarWidth];
  double v4 = v3;

  return v4;
}

- (void)setMinimumSidebarWidth:(double)a3
{
  id v4 = [(_UITabBarControllerVisualStyle_Pad *)self tabContainerView];
  [v4 setMinimumSidebarWidth:a3];
}

- (double)maximumSidebarWidth
{
  v2 = [(_UITabBarControllerVisualStyle_Pad *)self tabContainerView];
  [v2 maximumSidebarWidth];
  double v4 = v3;

  return v4;
}

- (void)setMaximumSidebarWidth:(double)a3
{
  id v4 = [(_UITabBarControllerVisualStyle_Pad *)self tabContainerView];
  [v4 setMaximumSidebarWidth:a3];
}

- (void)editingStateDidChange
{
  id v2 = [(_UITabBarControllerVisualStyle_Pad *)self tabContainerView];
  [v2 updateEditModeAppearanceAnimated:1];
}

- (BOOL)overrideUISplitViewControllerToCompact
{
  return 0;
}

- (void)_updateBarAvailabilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UITabBarControllerVisualStyle_Pad *)self canDisplaySidebar]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5;
  if ([(_UITabBarControllerVisualStyle_Pad *)self canDisplayTabBar])
  {
    if ([(_UITabBarControllerVisualStyle *)self isBarHidden]) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = v5 | 1;
    }
    v5 |= 1uLL;
  }
  [(_UITabContainerView *)self->_tabContainerView setSupportedComponent:v5];
  tabContainerView = self->_tabContainerView;
  [(_UITabContainerView *)tabContainerView setAvailableComponent:v6 animated:v3];
}

- (void)updateContentLayoutForSidebarAppearanceWithTransitionCoordinator:(id)a3
{
  id v18 = a3;
  id v4 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  uint64_t v5 = [v4 _transitionView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  CGFloat v10 = [v4 view];
  [v10 bounds];
  -[_UITabBarControllerVisualStyle_Pad adjustedTransitionViewFrame:](self, "adjustedTransitionViewFrame:");
  double v12 = v11;
  double v14 = v13;

  if (v7 != v12 || v9 != v14)
  {
    uint64_t v16 = (uint64_t)v18;
    if (!v18)
    {
      uint64_t v16 = [v4 _definiteTransitionCoordinator];
    }
    id v18 = (id)v16;
    double v17 = [v4 _selectedViewControllerInTabBar];
    objc_msgSend(v17, "viewWillTransitionToSize:withTransitionCoordinator:", v18, v12, v14);
  }
  [(_UITabBarControllerVisualStyle_Pad *)self _setNeedsContentLayout];
  [(_UITabBarControllerVisualStyle_Pad *)self _updateContentLayoutForSidebarAppearanceIfNeeded];
}

- (void)didUpdateVisibleAppearance
{
  BOOL v3 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  char v4 = [v3 _isInSidebarTransition];

  if ((v4 & 1) == 0)
  {
    [(_UITabBarControllerVisualStyle_Pad *)self _setNeedsContentLayout];
    [(_UITabBarControllerVisualStyle_Pad *)self _updateContentLayoutForSidebarAppearanceIfNeeded];
  }
}

- (void)_setNeedsContentLayout
{
  if (!self->_needsContentLayout)
  {
    self->_needsContentLayout = 1;
    id v3 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    id v2 = [v3 _existingView];
    [v2 setNeedsLayout];
  }
}

- (void)_updateSidebarResolvedLayout
{
  char v4 = [(_UITabBarControllerVisualStyle_Pad *)self sidebar];
  uint64_t v5 = -[UITabBarControllerSidebar _resolvedLayout]((uint64_t)v4);

  if (!v5)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"_UITabBarControllerVisualStyle_Pad.m" lineNumber:485 description:@"Resolved sidebar layout cannot be automatic."];
  }
  double v6 = [(_UITabBarControllerVisualStyle_Pad *)self tabContainerView];
  [v6 bounds];
  double v8 = v7;
  if (v7 <= v9) {
    double v10 = 1194.0;
  }
  else {
    double v10 = 1024.0;
  }

  if (v8 <= v10 && [(_UITabBarControllerVisualStyle_Pad *)self supportsOverlaySidebarMode])
  {
    uint64_t v11 = 2;
  }
  else
  {
    uint64_t v12 = 1;
    if (v5 != 2) {
      uint64_t v12 = 2;
    }
    if (v5 == 1) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = v12;
    }
  }
  id v14 = [(_UITabBarControllerVisualStyle_Pad *)self tabContainerView];
  [v14 setSidebarLayout:v11];
}

- (BOOL)supportsOverlaySidebarMode
{
  return 1;
}

- (void)_updateContentLayoutForSidebarAppearanceIfNeeded
{
  id v3 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  char v4 = v3;
  if (self->_needsContentLayout)
  {
    uint64_t v5 = [v3 _window];

    if (v5)
    {
      self->_needsContentLayout = 0;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __86___UITabBarControllerVisualStyle_Pad__updateContentLayoutForSidebarAppearanceIfNeeded__block_invoke;
      v10[3] = &unk_1E52D9F98;
      v10[4] = self;
      double v6 = v4;
      id v11 = v6;
      if (v6)
      {
        double v7 = v6;
        unsigned int v8 = v6[278];
        v6[278] = v8 | 0x10000;
        __86___UITabBarControllerVisualStyle_Pad__updateContentLayoutForSidebarAppearanceIfNeeded__block_invoke((uint64_t)v10);
        v7[278] = v7[278] & 0xFFFEFFFF | ((HIWORD(v8) & 1) << 16);
        double v9 = v11;
      }
      else
      {
        double v9 = 0;
      }
    }
  }
}

- (CGRect)adjustedTransitionViewFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = [(_UITabBarControllerVisualStyle_Pad *)self tabContainerView];
  objc_msgSend(v7, "adjustedFrameForContentTransitionViewFrame:", x, y, width, height);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (id)childViewControllerForStatusBarStyle
{
  id v3 = [(_UITabBarControllerVisualStyle_Pad *)self sidebar];
  if (-[UITabBarControllerSidebar _isSidebarSupportedAndVisible](v3))
  {
    char v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_UITabBarControllerVisualStyle_Pad;
    char v4 = [(_UITabBarControllerVisualStyle *)&v6 childViewControllerForStatusBarStyle];
  }

  return v4;
}

- (int64_t)preferredLeadingStatusBarStyle
{
  id v3 = [(_UITabBarControllerVisualStyle_Pad *)self sidebar];
  int isSidebarSupportedAnd = -[UITabBarControllerSidebar _isSidebarSupportedAndVisible](v3);

  if (isSidebarSupportedAnd)
  {
    uint64_t v5 = [(_UITabBarControllerVisualStyle *)self tabBarController];
    objc_super v6 = [v5 traitCollection];
    uint64_t v7 = [v6 userInterfaceStyle];

    if (v7 == 2) {
      return 1;
    }
    else {
      return 2;
    }
  }
  else
  {
    return [(_UITabBarControllerVisualStyle_Pad *)self _effectivePartStyleForEdge:0];
  }
}

- (int64_t)preferredCenterStatusBarStyle
{
  return [(_UITabBarControllerVisualStyle_Pad *)self _effectivePartStyleForEdge:1];
}

- (int64_t)preferredTrailingStatusBarStyle
{
  return [(_UITabBarControllerVisualStyle_Pad *)self _effectivePartStyleForEdge:2];
}

- (int64_t)_effectivePartStyleForEdge:(int64_t)a3
{
  char v4 = [(_UITabBarControllerVisualStyle *)self tabBarController];
  uint64_t v5 = [v4 _selectedViewControllerInTabBar];
  objc_super v6 = [v5 _effectiveStatusBarStyleViewController];

  uint64_t v7 = _viewControllerIfStatusBarPartStyleProviding(v6);
  double v8 = v7;
  if (!v7) {
    goto LABEL_9;
  }
  switch(a3)
  {
    case 2:
      uint64_t v9 = [v7 preferredTrailingStatusBarStyle];
      goto LABEL_8;
    case 1:
      uint64_t v9 = [v7 preferredCenterStatusBarStyle];
LABEL_8:
      int64_t v10 = v9;
      if (v9 != 4) {
        goto LABEL_12;
      }
      break;
    case 0:
      uint64_t v9 = [v7 preferredLeadingStatusBarStyle];
      goto LABEL_8;
  }
LABEL_9:
  uint64_t v11 = [v6 preferredStatusBarStyle];
  if (v11 == 1) {
    int64_t v10 = 1;
  }
  else {
    int64_t v10 = 2 * (v11 == 3);
  }
LABEL_12:

  return v10;
}

- (UIEdgeInsets)edgeInsetsForChildViewController:(id)a3
{
  tabContainerView = self->_tabContainerView;
  id v5 = a3;
  if ([(_UITabContainerView *)tabContainerView canShowFloatingUI])
  {
    [(_UITabContainerView *)self->_tabContainerView edgeInsetsForChildViewController:v5];
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)_UITabBarControllerVisualStyle_Pad;
    [(_UITabBarControllerVisualStyle *)&v18 edgeInsetsForChildViewController:v5];
  }
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;

  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (UIEdgeInsets)additionalContentMargins
{
  if ([(_UITabContainerView *)self->_tabContainerView canShowFloatingUI])
  {
    tabContainerView = self->_tabContainerView;
    [(_UITabContainerView *)tabContainerView additionalContentMargins];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_UITabBarControllerVisualStyle_Pad;
    [(_UITabBarControllerVisualStyle *)&v8 additionalContentMargins];
  }
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (_UITabContainerView)tabContainerView
{
  return self->_tabContainerView;
}

- (void).cxx_destruct
{
}

@end