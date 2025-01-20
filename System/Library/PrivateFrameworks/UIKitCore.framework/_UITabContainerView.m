@interface _UITabContainerView
- (BOOL)_hasActiveMorphTransition;
- (BOOL)_isShowingSidebar;
- (BOOL)_isTabBarHidden;
- (BOOL)canShowFloatingTabBar;
- (BOOL)canShowFloatingUI;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isShowingFloatingTabBar;
- (BOOL)isSidebarOverlappingContent;
- (BOOL)supportsResizingSidebar;
- (BOOL)suppressTabBar;
- (BOOL)wantsHostingNavigationBarPlaceholder;
- (CGRect)adjustedFrameForContentTransitionViewFrame:(CGRect)a3;
- (CGRect)floatingTabBarContentFrameInCoordinateSpace:(id)a3;
- (UIAction)_sidebarToggleAction;
- (UIAction)overrideTidebarButtonAction;
- (UIBarButtonItem)hostingNavigationBarPlaceholderItem;
- (UIEdgeInsets)additionalContentMargins;
- (UIEdgeInsets)edgeInsetsForChildViewController:(id)a3;
- (UITabBar)tabBar;
- (UITabBarControllerSidebar)sidebar;
- (UIView)_dimmingView;
- (_UIFloatingTabBar)floatingTabBar;
- (_UITabContainerView)initWithSidebar:(id)a3 tabBar:(id)a4;
- (_UITabContainerViewDelegate)delegate;
- (_UITabContainerViewFloatingTabBarHost)floatingTabBarHost;
- (_UITabModel)tabModel;
- (_UITabOutlineView)outlineView;
- (_UITabSidebarBorderView)_borderView;
- (double)_currentSidebarWidth;
- (double)_floatingTabBarFittingHeight;
- (double)_floatingTabBarTopOffset;
- (double)currentSidebarWidth;
- (double)floatingTabBarTopInsetForViewController:(id)a3;
- (double)maximumSidebarWidth;
- (double)minimumSidebarWidth;
- (double)pendingSidebarTranslation;
- (id)_configuredGroupCompletion;
- (id)preferredFocusEnvironments;
- (id)resolvedPopoverPresentationControllerSourceItemForTab:(id)a3;
- (int64_t)_currentVisibleComponents;
- (int64_t)availableComponent;
- (int64_t)sidebarLayout;
- (int64_t)supportedComponent;
- (void)_commitSidebarTranslation;
- (void)_createViewHierarchy;
- (void)_didDragBorderView:(id)a3;
- (void)_finalizeEditingState;
- (void)_handleDimmingViewTap:(id)a3;
- (void)_horizontalSizeClassDidChange;
- (void)_updateFloatingTabBarFrame;
- (void)_updateOutlineViewFrame;
- (void)_updateSidebarAppearanceForMorphTransitionAnimated:(BOOL)a3;
- (void)_updateSidebarContentMarginsWithTabBarContentFrame:(CGRect)a3;
- (void)_updateToggleAction;
- (void)_updateVisibleBarAnimated:(BOOL)a3;
- (void)_updateVisibleBarAnimated:(BOOL)a3 requireLayout:(BOOL)a4 updateDimmingView:(BOOL)a5;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)layoutSubviews;
- (void)outlineView:(id)a3 didSelectTab:(id)a4;
- (void)outlineViewDidChangeCustomizationStore:(id)a3;
- (void)safeAreaInsetsDidChange;
- (void)setAvailableComponent:(int64_t)a3;
- (void)setAvailableComponent:(int64_t)a3 animated:(BOOL)a4;
- (void)setCurrentSidebarWidth:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setFloatingTabBarHost:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setMaximumSidebarWidth:(double)a3;
- (void)setMinimumSidebarWidth:(double)a3;
- (void)setOverrideTidebarButtonAction:(id)a3;
- (void)setPendingSidebarTranslation:(double)a3;
- (void)setSidebarLayout:(int64_t)a3;
- (void)setSupportedComponent:(int64_t)a3;
- (void)setSupportsResizingSidebar:(BOOL)a3;
- (void)setSuppressTabBar:(BOOL)a3;
- (void)updateDimmingViewAnimated:(BOOL)a3;
- (void)updateEditModeAppearanceAnimated:(BOOL)a3;
- (void)updateSidebarAppearanceStateAnimated:(BOOL)a3 animator:(id)a4;
@end

@implementation _UITabContainerView

- (_UITabContainerView)initWithSidebar:(id)a3 tabBar:(id)a4
{
  v6 = (id *)a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UITabContainerView;
  v8 = -[UIView initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v8)
  {
    if (v6)
    {
      id v9 = v6[5];
      v10 = v9;
      if (v9)
      {
        v11 = (void *)*((void *)v9 + 145);
LABEL_5:
        objc_storeStrong((id *)&v8->_tabModel, v11);

        objc_storeStrong((id *)&v8->_tabBar, a4);
        objc_storeWeak((id *)&v8->_sidebar, v6);
        v12 = [(_UITabModel *)v8->_tabModel customizationStore];
        [v12 preferredSidebarWidth];
        v8->_currentSidebarWidth = v13;

        [(_UITabContainerView *)v8 _createViewHierarchy];
        goto LABEL_6;
      }
    }
    else
    {
      v10 = 0;
    }
    v11 = 0;
    goto LABEL_5;
  }
LABEL_6:

  return v8;
}

- (_UITabOutlineView)outlineView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sidebar);
  v3 = [WeakRetained _outlineView];

  return (_UITabOutlineView *)v3;
}

- (_UIFloatingTabBar)floatingTabBar
{
  if (!self->_floatingTabBar && ([(_UITabContainerView *)self supportedComponent] & 1) != 0)
  {
    v3 = [_UIFloatingTabBar alloc];
    v4 = -[_UIFloatingTabBar initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(_UIFloatingTabBar *)v4 setTabModel:self->_tabModel];
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __37___UITabContainerView_floatingTabBar__block_invoke;
    v8[3] = &unk_1E5306388;
    objc_copyWeak(&v9, &location);
    [(_UIFloatingTabBar *)v4 setContentFrameDidChangeBlock:v8];
    floatingTabBar = self->_floatingTabBar;
    self->_floatingTabBar = v4;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  v6 = self->_floatingTabBar;
  return v6;
}

- (void)_createViewHierarchy
{
  v14[1] = *MEMORY[0x1E4F143B8];
  tabBar = self->_tabBar;
  if (tabBar)
  {
    v4 = tabBar;
  }
  else
  {
    v5 = [UITabBar alloc];
    v4 = -[UITabBar initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  v6 = v4;
  [(UIView *)v4 setAutoresizingMask:0];
  id v7 = self->_tabBar;
  self->_tabBar = v6;
  v8 = v6;

  v14[0] = 0x1ED3F5A90;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v10 = [(UIView *)self _registerForTraitTokenChanges:v9 withTarget:self action:sel__horizontalSizeClassDidChange];

  v13[0] = 0x1ED3F5A60;
  v13[1] = 0x1ED3F5AD8;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v12 = [(UIView *)self _registerForTraitTokenChanges:v11 withTarget:self action:sel_setNeedsLayout];

  [(_UITabContainerView *)self _updateVisibleBarAnimated:0];
}

- (void)safeAreaInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)_UITabContainerView;
  [(UIView *)&v4 safeAreaInsetsDidChange];
  v3 = [(_UITabContainerView *)self delegate];
  [v3 safeAreaInsetsDidChange];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  v15.origin.double x = v8;
  v15.origin.double y = v9;
  v15.size.double width = v10;
  v15.size.double height = v11;
  v14.origin.double x = x;
  v14.origin.double y = y;
  v14.size.double width = width;
  v14.size.double height = height;
  BOOL v12 = CGRectEqualToRect(v14, v15);
  v13.receiver = self;
  v13.super_class = (Class)_UITabContainerView;
  -[UIView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (!v12)
  {
    if ([(_UITabContainerView *)self _hasActiveMorphTransition]) {
      [(_UITabContainerView *)self _updateSidebarAppearanceForMorphTransitionAnimated:0];
    }
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UITabContainerView;
  [(UIView *)&v3 layoutSubviews];
  [(_UITabContainerView *)self _updateFloatingTabBarFrame];
  [(_UITabContainerView *)self _updateOutlineViewFrame];
  [(UIView *)self bounds];
  -[UIView setFrame:](self->_dimmingView, "setFrame:");
}

- (void)_updateFloatingTabBarFrame
{
  objc_super v3 = self->_floatingTabBar;
  [(UIView *)self safeAreaInsets];
  double v5 = v4;
  [(UIView *)v3 center];
  double v7 = v6;
  double v9 = v8;
  [(UIView *)self bounds];
  -[_UIFloatingTabBar sizeThatFits:](v3, "sizeThatFits:", v10, v11);
  double v13 = v12;
  [(_UITabContainerView *)self _floatingTabBarTopOffset];
  double v15 = v5 + v14;
  [(UIView *)self bounds];
  double Width = CGRectGetWidth(v42);
  -[_UIFloatingTabBar setBounds:](v3, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), Width, v13);
  -[UIView setCenter:](v3, "setCenter:", Width * 0.5 + 0.0, v15 + v13 * 0.5);
  [(UIView *)v3 center];
  if (v7 != v18 || v9 != v17)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_floatingTabBarHost);
    [WeakRetained tabBarContainerDidLayoutFloatingTabBar:self];
  }
  v21 = [(_UITabContainerView *)self tabModel];
  int v22 = [v21 isEditing];

  if (v22)
  {
    v23 = [(UIView *)self traitCollection];
    v24 = _UIFloatingTabBarGetPlatformMetrics([v23 userInterfaceIdiom]);

    remainder.origin.double x = 0.0;
    remainder.origin.double y = 0.0;
    remainder.size.double width = Width;
    [(_UITabContainerView *)self _floatingTabBarFittingHeight];
    double v26 = v15 + v25;
    [v24 expandedDropTargetInset];
    double height = v26 + v27;
    remainder.size.double height = height;
    uint64_t v29 = [(_UITabContainerView *)self outlineView];
    v30 = (void *)v29;
    if (v29
      && (double y = 0.0,
          (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(*(float64x2_t *)(v29 + 632)), (int32x4_t)vceqzq_f64(*(float64x2_t *)(v29 + 648)))))) & 1) != 0))
    {
      double x = 0.0;
    }
    else
    {
      [(_UITabContainerView *)self _currentSidebarWidth];
      CGFloat v34 = v33;
      if ([(UIView *)self _shouldReverseLayoutDirection])
      {
        CGRectEdge v35 = CGRectMaxXEdge;
      }
      else
      {
        CGRectEdge v35 = CGRectMinXEdge;
      }
      v43.origin.double x = 0.0;
      v43.origin.double y = 0.0;
      v43.size.double width = Width;
      v43.size.double height = height;
      CGRectDivide(v43, &v40, &remainder, v34, v35);
      double x = remainder.origin.x;
      double y = remainder.origin.y;
      double Width = remainder.size.width;
      double height = remainder.size.height;
    }
    -[UIView convertRect:toView:](self, "convertRect:toView:", v3, x, y, Width, height);
    remainder.origin.double x = v36;
    remainder.origin.double y = v37;
    remainder.size.double width = v38;
    remainder.size.double height = v39;
    -[_UIFloatingTabBar setFrameForExpandedDropTarget:](v3, "setFrameForExpandedDropTarget:");
  }
  else
  {
    -[_UIFloatingTabBar setFrameForExpandedDropTarget:](v3, "setFrameForExpandedDropTarget:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  }
}

- (void)_updateOutlineViewFrame
{
  [(_UITabContainerView *)self _currentSidebarWidth];
  double v4 = v3;
  double v5 = 0.0;
  double v6 = 0.0;
  if ([(UIView *)self _shouldReverseLayoutDirection])
  {
    [(UIView *)self bounds];
    double v6 = CGRectGetWidth(v31) - v4;
  }
  [(UIView *)self bounds];
  double Height = CGRectGetHeight(v32);
  double v8 = *MEMORY[0x1E4F1DAD8];
  double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v10 = [(_UITabContainerView *)self outlineView];
  objc_msgSend(v10, "setBounds:", v8, v9, v4, Height);

  double v11 = [(_UITabContainerView *)self outlineView];
  objc_msgSend(v11, "setCenter:", v4 * 0.5 + v6, Height * 0.5 + 0.0);

  double v12 = [(UIView *)self traitCollection];
  _UIFloatingTabBarGetPlatformMetrics([v12 userInterfaceIdiom]);
  id v29 = (id)objc_claimAutoreleasedReturnValue();

  [v29 sidebarBorderWidth];
  double v14 = v13;
  [(UIView *)self _currentScreenScale];
  double v16 = v15;
  if ([v29 isSidebarBorderInsideBounds])
  {
    [v29 sidebarBorderWidth];
    double v5 = v17;
  }
  BOOL v18 = [(UIView *)self _shouldReverseLayoutDirection];
  uint64_t v19 = 0;
  double v20 = v6;
  double v21 = v4;
  double v22 = Height;
  if (v18) {
    double MinX = CGRectGetMinX(*(CGRect *)&v20);
  }
  else {
    double MinX = CGRectGetMaxX(*(CGRect *)&v20) - v5;
  }
  double v24 = v14 / v16;
  v33.origin.double y = 0.0;
  v33.origin.double x = v6;
  v33.size.double width = v4;
  v33.size.double height = Height;
  double v25 = CGRectGetHeight(v33);
  double v26 = [(_UITabContainerView *)self _borderView];
  objc_msgSend(v26, "setBounds:", v8, v9, v24, v25);

  double v27 = [(_UITabContainerView *)self _borderView];
  objc_msgSend(v27, "setCenter:", v24 * 0.5 + MinX, v25 * 0.5 + 0.0);

  v28 = [(_UITabContainerView *)self delegate];
  [v28 didLayoutSidebarView];
}

- (void)setSidebarLayout:(int64_t)a3
{
  if (self->_sidebarLayout != a3)
  {
    self->_sidebarLayout = a3;
    [(_UITabContainerView *)self _updateVisibleBarAnimated:0];
  }
}

- (void)setSupportedComponent:(int64_t)a3
{
  if (self->_supportedComponent != a3)
  {
    char v3 = a3;
    self->_supportedComponent = a3;
    uint64_t v5 = [(_UITabContainerView *)self sidebar];
    id v7 = (id)v5;
    if ((v3 & 2) != 0) {
      double v6 = self;
    }
    else {
      double v6 = 0;
    }
    -[UITabBarControllerSidebar _setSidebarViewDelegate:](v5, v6);
  }
}

- (void)setAvailableComponent:(int64_t)a3
{
}

- (void)setAvailableComponent:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_availableComponent != a3)
  {
    BOOL v4 = a4;
    self->_availableComponent = a3;
    [(_UITabContainerView *)self _updateToggleAction];
    [(_UITabContainerView *)self _updateVisibleBarAnimated:v4];
  }
}

- (void)setSuppressTabBar:(BOOL)a3
{
  if (self->_suppressTabBar != a3)
  {
    self->_suppressTabBar = a3;
    if ([(_UITabContainerView *)self canShowFloatingUI])
    {
      [(_UITabContainerView *)self _updateVisibleBarAnimated:1];
      [(_UITabContainerView *)self _updateToggleAction];
    }
  }
}

- (void)setOverrideTidebarButtonAction:(id)a3
{
  uint64_t v5 = (UIAction *)a3;
  if (self->_overrideTidebarButtonAction != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_overrideTidebarButtonAction, a3);
    [(_UITabContainerView *)self _updateToggleAction];
    uint64_t v5 = v6;
  }
}

- (BOOL)canShowFloatingUI
{
  v2 = [(_UITabModel *)self->_tabModel tabBarController];
  char v3 = [v2 traitCollection];
  BOOL v4 = [v3 horizontalSizeClass] == 2;

  return v4;
}

- (BOOL)isShowingFloatingTabBar
{
  if ([(_UITabContainerView *)self _hasActiveMorphTransition])
  {
    LOBYTE(v3) = self->_isAnimatingToTabBar;
  }
  else
  {
    BOOL v3 = [(_UITabContainerView *)self canShowFloatingTabBar];
    if (v3) {
      LOBYTE(v3) = ![(_UITabContainerView *)self _isShowingSidebar];
    }
  }
  return v3;
}

- (BOOL)canShowFloatingTabBar
{
  if (([(_UITabContainerView *)self availableComponent] & 1) == 0) {
    return 0;
  }
  return [(_UITabContainerView *)self canShowFloatingUI];
}

- (BOOL)isSidebarOverlappingContent
{
  BOOL v3 = [(_UITabContainerView *)self outlineView];
  BOOL v4 = [v3 window];
  if (v4) {
    BOOL v5 = [(_UITabContainerView *)self sidebarLayout] == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_isShowingSidebar
{
  v2 = [(_UITabContainerView *)self sidebar];
  char isSidebarSupportedAnd = -[UITabBarControllerSidebar _isSidebarSupportedAndVisible](v2);

  return isSidebarSupportedAnd;
}

- (UIEdgeInsets)edgeInsetsForChildViewController:(id)a3
{
  id v4 = a3;
  double v5 = 0.0;
  double v6 = 0.0;
  if ([(_UITabContainerView *)self isShowingFloatingTabBar])
  {
    id v7 = [(_UITabContainerView *)self tabModel];
    double v8 = [v7 tabItems];
    if ([v8 count])
    {
      char v9 = [v4 _shouldOverlayTabBar];

      if ((v9 & 1) == 0)
      {
        [(_UITabContainerView *)self _floatingTabBarFittingHeight];
        double v6 = v10;
      }
    }
    else
    {
    }
  }
  if ([(_UITabContainerView *)self sidebarLayout])
  {
    double v11 = 0.0;
  }
  else
  {
    double v11 = 0.0;
    if ([(_UITabContainerView *)self _isShowingSidebar])
    {
      [(_UITabContainerView *)self _currentSidebarWidth];
      double v11 = v12;
      BOOL v13 = [(UIView *)self _shouldReverseLayoutDirection];
      if (v13) {
        double v5 = v11;
      }
      else {
        double v5 = 0.0;
      }
      if (v13) {
        double v11 = 0.0;
      }
    }
  }

  double v14 = 0.0;
  double v15 = v6;
  double v16 = v11;
  double v17 = v5;
  result.right = v17;
  result.bottom = v14;
  result.left = v16;
  result.top = v15;
  return result;
}

- (double)floatingTabBarTopInsetForViewController:(id)a3
{
  id v4 = a3;
  double v5 = 0.0;
  if ([(_UITabContainerView *)self isShowingFloatingTabBar])
  {
    double v6 = [v4 _hostingNavigationBar];

    if (v6)
    {
      id v7 = [(_UITabContainerView *)self floatingTabBar];
      [v7 contentLayoutFrame];
      double v5 = v8 + 14.0;
    }
    else
    {
      [(_UITabContainerView *)self _floatingTabBarFittingHeight];
      double v5 = v9;
    }
  }

  return v5;
}

- (UIEdgeInsets)additionalContentMargins
{
  double v3 = 0.0;
  if ([(_UITabContainerView *)self sidebarLayout] == 1)
  {
    BOOL v4 = [(_UITabContainerView *)self _isShowingSidebar];
    double v5 = 0.0;
    if (v4)
    {
      [(_UITabContainerView *)self _currentSidebarWidth];
      double v7 = v6;
      BOOL v8 = [(UIView *)self _shouldReverseLayoutDirection];
      if (v8) {
        double v3 = v7;
      }
      else {
        double v3 = 0.0;
      }
      if (v8) {
        double v5 = 0.0;
      }
      else {
        double v5 = v7;
      }
    }
  }
  else
  {
    double v5 = 0.0;
  }
  double v9 = 0.0;
  double v10 = 0.0;
  double v11 = v3;
  result.right = v11;
  result.bottom = v10;
  result.left = v5;
  result.top = v9;
  return result;
}

- (CGRect)adjustedFrameForContentTransitionViewFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGRect remainder = a3;
  BOOL v8 = [(_UITabContainerView *)self sidebar];
  if (-[UITabBarControllerSidebar _isSidebarSupportedAndVisible](v8))
  {
    double v9 = [(_UITabContainerView *)self outlineView];
    double v10 = [v9 superview];
    BOOL v11 = v10 == 0;
  }
  else
  {
    BOOL v11 = 1;
  }

  if ([(_UITabContainerView *)self sidebarLayout] == 1 && !v11)
  {
    [(_UITabContainerView *)self _currentSidebarWidth];
    CGFloat v13 = v12;
    if ([(UIView *)self _shouldReverseLayoutDirection])
    {
      CGRectEdge v14 = CGRectMaxXEdge;
    }
    else
    {
      CGRectEdge v14 = CGRectMinXEdge;
    }
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CGRectDivide(v21, &v19, &remainder, v13, v14);
    CGFloat x = remainder.origin.x;
    CGFloat y = remainder.origin.y;
    CGFloat width = remainder.size.width;
    CGFloat height = remainder.size.height;
  }
  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGRect)floatingTabBarContentFrameInCoordinateSpace:(id)a3
{
  id v4 = a3;
  [(_UIFloatingTabBar *)self->_floatingTabBar contentLayoutFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(UIView *)self->_floatingTabBar center];
  double v14 = v13;
  double v16 = v15;
  [(UIView *)self->_floatingTabBar bounds];
  double v17 = v14 - CGRectGetWidth(v36) * 0.5;
  [(UIView *)self->_floatingTabBar bounds];
  double MidX = v6 + v17;
  double v19 = v8 + v16 - CGRectGetHeight(v37) * 0.5;
  v38.origin.CGFloat x = MidX;
  v38.origin.CGFloat y = v19;
  v38.size.CGFloat width = v10;
  v38.size.CGFloat height = v12;
  if (CGRectEqualToRect(v38, *MEMORY[0x1E4F1DB28]))
  {
    [(UIView *)self bounds];
    double MidX = CGRectGetMidX(v39);
    double v12 = 0.0;
    double v10 = 0.0;
    double v19 = 0.0;
  }
  -[UIView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v4, MidX, v19, v10, v12);
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  v28 = [(_UITabContainerView *)self tabModel];
  if (([v28 isEditing] & 1) != 0
    || ([(UIView *)self->_floatingTabBar superview], (uint64_t v29 = objc_claimAutoreleasedReturnValue()) == 0))
  {
  }
  else
  {
    v30 = (void *)v29;
    BOOL v31 = [(_UIFloatingTabBar *)self->_floatingTabBar isInTransitionAnimation];

    if (!v31) {
      goto LABEL_9;
    }
  }
  v40.origin.CGFloat x = v21;
  v40.origin.CGFloat y = v23;
  v40.size.CGFloat width = v25;
  v40.size.CGFloat height = v27;
  CGFloat v21 = CGRectGetMidX(v40);
  CGFloat v25 = 0.0;
LABEL_9:

  double v32 = v21;
  double v33 = v23;
  double v34 = v25;
  double v35 = v27;
  result.size.CGFloat height = v35;
  result.size.CGFloat width = v34;
  result.origin.CGFloat y = v33;
  result.origin.CGFloat x = v32;
  return result;
}

- (void)_updateSidebarContentMarginsWithTabBarContentFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(_UITabContainerView *)self floatingTabBar];
  objc_msgSend(v8, "convertRect:toView:", self, x, y, width, height);
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  double v17 = [(_UITabContainerView *)self outlineView];
  [v17 frame];
  v29.origin.double x = v18;
  v29.origin.double y = v19;
  v29.size.double width = v20;
  v29.size.double height = v21;
  v28.origin.double x = v10;
  v28.origin.double y = v12;
  v28.size.double width = v14;
  v28.size.double height = v16;
  BOOL v22 = CGRectIntersectsRect(v28, v29);

  if (!v22) {
    double height = 0.0;
  }
  self->_sidebarAdditionalEditingInsets.top = height;
  self->_sidebarAdditionalEditingInsets.bottom = 0.0;
  self->_sidebarAdditionalEditingInsets.right = 0.0;
  self->_sidebarAdditionalEditingInsets.left = 0.0;
  if (!self->_suppressesEditingInsetsChanges)
  {
    CGFloat v23 = [(_UITabContainerView *)self tabModel];
    int v24 = [v23 isEditing];

    if (v24)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __74___UITabContainerView__updateSidebarContentMarginsWithTabBarContentFrame___block_invoke;
      aBlock[3] = &unk_1E52DA520;
      aBlock[4] = self;
      *(double *)&aBlock[5] = height;
      memset(&aBlock[6], 0, 24);
      CGFloat v25 = (void (**)(void))_Block_copy(aBlock);
      if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
      {
        v25[2](v25);
      }
      else
      {
        double v26 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.25];
        +[UIView _animateUsingSpringBehavior:v26 tracking:0 animations:v25 completion:0];
      }
    }
  }
}

- (void)_updateToggleAction
{
  id v6 = [(_UITabContainerView *)self _sidebarToggleAction];
  double v3 = [(_UITabContainerView *)self floatingTabBar];
  [v3 setSidebarButtonAction:v6];

  id v4 = [(_UITabContainerView *)self outlineView];
  -[_UITabOutlineView setSidebarButtonAction:](v4, v6);

  LODWORD(v4) = ![(_UITabContainerView *)self _isTabBarHidden];
  double v5 = [(_UITabContainerView *)self outlineView];
  -[_UITabOutlineView setTransitionsToTabBar:]((uint64_t)v5, (int)v4);
}

- (UIAction)_sidebarToggleAction
{
  double v3 = [(_UITabContainerView *)self overrideTidebarButtonAction];

  if (v3)
  {
    id v4 = [(_UITabContainerView *)self overrideTidebarButtonAction];
  }
  else if ([(_UITabContainerView *)self supportedComponent] == 3)
  {
    sidebarToggleAction = self->_sidebarToggleAction;
    if (!sidebarToggleAction)
    {
      objc_initWeak(&location, self);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __43___UITabContainerView__sidebarToggleAction__block_invoke;
      v9[3] = &unk_1E52DDB60;
      objc_copyWeak(&v10, &location);
      id v6 = +[UIAction actionWithHandler:v9];
      double v7 = self->_sidebarToggleAction;
      self->_sidebarToggleAction = v6;

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
      sidebarToggleAction = self->_sidebarToggleAction;
    }
    id v4 = sidebarToggleAction;
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (double)_currentSidebarWidth
{
  [(_UITabContainerView *)self currentSidebarWidth];
  [(UIView *)self _shouldReverseLayoutDirection];
  [(_UITabContainerView *)self pendingSidebarTranslation];
  [(_UITabContainerView *)self minimumSidebarWidth];
  if (v3 > 0.0) {
    [(_UITabContainerView *)self minimumSidebarWidth];
  }
  [(_UITabContainerView *)self maximumSidebarWidth];
  if (v4 > 0.0) {
    [(_UITabContainerView *)self maximumSidebarWidth];
  }
  UIRoundToViewScale(self);
  return result;
}

- (double)_floatingTabBarTopOffset
{
  double v3 = 4.0;
  if (_UITabBarControllerWantsNavigationBarExtensionForFloatingTabBar())
  {
    double v4 = [(UIView *)self traitCollection];
    double v5 = _UIFloatingTabBarGetPlatformMetrics([v4 userInterfaceIdiom]);

    [v5 safeAreaOffset];
    double v7 = v6;
    double v8 = [(UIView *)self traitCollection];
    if ([v8 _presentationSemanticContext] == 2) {
      double v9 = 10.0;
    }
    else {
      double v9 = 0.0;
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_floatingTabBarHost);
    [WeakRetained contentViewVerticalOffsetInTabBarContainer:self];
    double v12 = v11;

    [(_UIFloatingTabBar *)self->_floatingTabBar baselineOffsetFromTop];
    double v3 = v7 + v9 + v12 - v13;
  }
  return v3;
}

- (double)_floatingTabBarFittingHeight
{
  int v2 = [(_UITabContainerView *)self availableComponent];
  int v3 = _UITabBarControllerWantsNavigationBarExtensionForFloatingTabBar();
  double result = 50.0;
  if ((v3 & v2) != 0) {
    return 64.0;
  }
  return result;
}

- (void)setSupportsResizingSidebar:(BOOL)a3
{
  if (self->_supportsResizingSidebar != a3)
  {
    self->_supportsResizingSidebar = a3;
    if (a3)
    {
      double v4 = [_UITabSidebarBorderView alloc];
      double v5 = -[_UITabSidebarBorderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      if ([(_UITabContainerView *)self _isShowingSidebar]) {
        [(UIView *)self addSubview:v5];
      }
      borderView = self->_borderView;
      self->_borderView = v5;
      double v7 = v5;

      double v9 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:sel__didDragBorderView_];
      [(UILongPressGestureRecognizer *)v9 setMinimumPressDuration:0.0];
      [(UILongPressGestureRecognizer *)v9 setAllowableMovement:1.79769313e308];
      [(UIView *)v7 addGestureRecognizer:v9];

      double v8 = (_UITabSidebarBorderView *)v9;
    }
    else
    {
      [(UIView *)self->_borderView removeFromSuperview];
      double v8 = self->_borderView;
      self->_borderView = 0;
    }
  }
}

- (void)_didDragBorderView:(id)a3
{
  id v4 = a3;
  id v10 = [v4 view];
  objc_msgSend(v4, "_translationInView:");
  double v6 = v5;
  uint64_t v7 = [v4 state];

  double v8 = 0.0;
  if ((unint64_t)(v7 - 4) >= 2)
  {
    if (v7 == 3)
    {
      [(_UITabContainerView *)self _commitSidebarTranslation];
    }
    else
    {
      if (v7 != 2) {
        goto LABEL_7;
      }
      double v8 = v6;
    }
  }
  [(_UITabContainerView *)self setPendingSidebarTranslation:v8];
LABEL_7:
  [(_UITabContainerView *)self _updateOutlineViewFrame];
  double v9 = [(_UITabContainerView *)self delegate];
  [v9 updateContentLayoutForSidebarAppearanceWithTransitionCoordinator:0];
}

- (void)_commitSidebarTranslation
{
  [(_UITabContainerView *)self _currentSidebarWidth];
  double v4 = v3;
  -[_UITabContainerView setCurrentSidebarWidth:](self, "setCurrentSidebarWidth:");
  id v6 = [(_UITabContainerView *)self tabModel];
  double v5 = [v6 customizationStore];
  [v5 setPreferredSidebarWidth:v4];
}

- (BOOL)_hasActiveMorphTransition
{
  return self->_transitionContainerView != 0;
}

- (BOOL)_isTabBarHidden
{
  if (self->_availableComponent)
  {
    BOOL v2 = [(_UITabContainerView *)self canShowFloatingUI];
    if (v2)
    {
      LOBYTE(v2) = [(_UITabContainerView *)self suppressTabBar];
    }
  }
  else
  {
    LOBYTE(v2) = 1;
  }
  return v2;
}

- (void)updateSidebarAppearanceStateAnimated:(BOOL)a3 animator:(id)a4
{
  BOOL v4 = a3;
  id v6 = (_UITabBarControllerSidebarAnimator *)a4;
  uint64_t v7 = [(UIView *)self traitCollection];
  uint64_t v8 = [v7 horizontalSizeClass];

  if ([(_UITabContainerView *)self _isTabBarHidden])
  {
    unsigned int v9 = 0;
  }
  else
  {
    BOOL v10 = v8 == 2;
    double v11 = [(_UITabContainerView *)self tabModel];
    unsigned int v9 = v10 & ~[v11 isEditing];
  }
  alongsideAnimator = self->_alongsideAnimator;
  self->_alongsideAnimator = v6;
  CGFloat v14 = v6;

  if (v9) {
    [(_UITabContainerView *)self _updateSidebarAppearanceForMorphTransitionAnimated:v4];
  }
  else {
    [(_UITabContainerView *)self _updateVisibleBarAnimated:v4];
  }
  double v13 = self->_alongsideAnimator;
  self->_alongsideAnimator = 0;
}

- (void)_updateSidebarAppearanceForMorphTransitionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v251[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke;
  aBlock[3] = &unk_1E52DC308;
  objc_copyWeak(&v248, &location);
  v151 = (void (**)(void))_Block_copy(aBlock);
  if (v3) {
    BOOL v3 = +[UIView areAnimationsEnabled];
  }
  [(_UITabContainerView *)self updateDimmingViewAnimated:v3];
  double v5 = self->_alongsideAnimator;
  if (v3 && (self->_availableComponent & 2) != 0)
  {
    [(UIView *)self _shouldReverseLayoutDirection];
    BOOL v8 = [(_UITabContainerView *)self _isShowingSidebar];
    unsigned int v9 = [(_UITabContainerView *)self outlineView];
    v149 = [(_UITabContainerView *)self floatingTabBar];
    v145 = -[_UITabOutlineView contentView](v9);
    v147 = v9;
    int v142 = v8;
    v143 = [v149 contentView];
    v139 = self->_transitionContainerView;
    BOOL v10 = self->_transitionBackgroundView;
    v130 = self->_outlineTransitionView;
    double v11 = self->_tabBarTransitionView;
    v132 = [(_UITabContainerView *)self _configuredGroupCompletion];
    [v132 increment];
    if (!v139)
    {
      [v9 setHidden:1];
      [(UIView *)self->_floatingTabBar setHidden:1];
      self->_isAnimatingToTabBar = v8;
      [(_UITabContainerView *)self _updateVisibleBarAnimated:0 requireLayout:1 updateDimmingView:0];
    }
    id v246 = 0;
    long long v245 = 0u;
    long long v244 = 0u;
    long long v243 = 0u;
    long long v242 = 0u;
    long long v241 = 0u;
    long long v240 = 0u;
    long long v239 = 0u;
    [v145 bounds];
    v238[0] = v12;
    v238[1] = v13;
    v238[2] = v14;
    v238[3] = v15;
    double v16 = *MEMORY[0x1E4F1DAD8];
    double v17 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    objc_msgSend(v145, "convertPoint:toView:", self, *MEMORY[0x1E4F1DAD8], v17);
    *(void *)&long long v239 = v18;
    *((void *)&v239 + 1) = v19;
    *(void *)&long long v240 = -[_UITabOutlineView sidebarButtonOrigin](v9);
    *((void *)&v240 + 1) = v20;
    *(void *)&long long v241 = -[_UITabOutlineView currentBackgroundEffect](v9);
    *((void *)&v241 + 1) = -[_UITabOutlineView shadowProperties](v9);
    if (v9)
    {
      [v9 _intersectedSceneCornerRadii];
    }
    else
    {
      long long v244 = 0u;
      long long v245 = 0u;
      long long v242 = 0u;
      long long v243 = 0u;
    }
    +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:0.9 response:0.4];
    v134 = v5;
    id v246 = (id)objc_claimAutoreleasedReturnValue();
    CGFloat v21 = objc_opt_new();
    BOOL v22 = [*((id *)&v241 + 1) color];
    [v21 setColor:v22];

    [v143 bounds];
    v223[0] = v23;
    v223[1] = v24;
    v223[2] = v25;
    v223[3] = v26;
    objc_msgSend(v143, "convertPoint:toView:", self, v16, v17);
    double v28 = v27;
    v223[4] = v29;
    double v224 = v27;
    [v149 sidebarButtonOrigin];
    double v31 = v30;
    double v33 = v32;
    double v225 = v30;
    double v226 = v32;
    id v227 = [v149 currentBackgroundEffect];
    id v129 = v21;
    id v228 = v129;
    [v149 contentCornerRadius];
    uint64_t v229 = v34;
    uint64_t v230 = v34;
    uint64_t v231 = v34;
    uint64_t v232 = v34;
    uint64_t v233 = v34;
    uint64_t v234 = v34;
    uint64_t v235 = v34;
    uint64_t v236 = v34;
    id v237 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.45];
    if ([(_UITabContainerView *)self _isTabBarHidden])
    {
      [v149 frame];
      double v224 = v28 - CGRectGetMaxY(v252);
    }
    if (v139)
    {
      double v35 = v11;
      CGRect v36 = v130;
      v137 = v10;
      obj = v139;
    }
    else
    {
      [v149 prepareForTransitionToVisibility:v142 ^ 1u];
      -[_UITabOutlineView prepareForTransitionToVisibility:](v9, v142);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_floatingTabBarHost);
      [WeakRetained tabBarContainerDidLayoutFloatingTabBar:self];

      CGRect v38 = [UIView alloc];
      double v39 = *MEMORY[0x1E4F1DB28];
      double v40 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v41 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v42 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      obj = -[UIView initWithFrame:](v38, "initWithFrame:", *MEMORY[0x1E4F1DB28], v40, v41, v42);
      CGRect v43 = [(UIView *)obj layer];
      [v43 setShadowPathIsBounds:1];

      v44 = [(UIView *)obj layer];
      [v44 setPunchoutShadow:1];

      v45 = [(UIView *)obj layer];
      objc_msgSend(v45, "setAnchorPoint:", v16, v17);

      [(UIView *)self addSubview:obj];
      objc_storeStrong((id *)&self->_transitionContainerView, obj);
      v137 = objc_alloc_init(UIVisualEffectView);

      [(UIView *)v137 setClipsToBounds:1];
      [(UIView *)obj addSubview:v137];
      objc_storeStrong((id *)&self->_transitionBackgroundView, v137);
      v46 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v39, v40, v41, v42);
      [(UIView *)v46 setAutoresizingMask:18];
      [(UIView *)v46 setClipsToBounds:1];
      [(UIView *)obj addSubview:v46];
      v127 = v46;
      [v145 bounds];
      double v48 = v47;
      double v50 = v49;
      v135 = [[_UIPortalView alloc] initWithSourceView:v145];
      -[_UIPortalView setFrame:](v135, "setFrame:", v16 - *(double *)&v240, v17 - *((double *)&v240 + 1), v48, v50);
      [(_UIPortalView *)v135 setForwardsClientHitTestingToSourceView:1];
      [(_UIPortalView *)v135 setHidesSourceView:1];
      [(_UIPortalView *)v135 setAllowsBackdropGroups:1];
      v51 = [UIView alloc];
      [(UIView *)v135 bounds];
      double v53 = v52;
      double v55 = v54;
      double v57 = v56;
      double v59 = v58;
      [v145 safeAreaInsets];
      v64 = -[UIView initWithFrame:](v51, "initWithFrame:", v53 + v63, v55 + v60, v57 - (v63 + v61), v59 - (v60 + v62));

      v65 = [(UIView *)v64 layer];
      objc_msgSend(v65, "setAnchorPoint:", v16, v17);

      v66 = [(UIView *)v64 layer];
      [v66 setPosition:v240];

      [(UIView *)v64 addSubview:v135];
      [(UIView *)v127 addSubview:v64];
      objc_storeStrong((id *)&self->_outlineTransitionView, v64);
      [v143 bounds];
      double v68 = v67;
      double v70 = v69;
      v71 = [[_UIPortalView alloc] initWithSourceView:v143];
      -[_UIPortalView setFrame:](v71, "setFrame:", v16 - v31, v17 - v33, v68, v70);
      [(_UIPortalView *)v71 setForwardsClientHitTestingToSourceView:1];
      [(_UIPortalView *)v71 setHidesSourceView:1];
      [(_UIPortalView *)v71 setAllowsBackdropGroups:1];
      v72 = [UIView alloc];
      [(UIView *)v71 bounds];
      double v35 = -[UIView initWithFrame:](v72, "initWithFrame:");

      v73 = [(UIView *)v35 layer];
      objc_msgSend(v73, "setAnchorPoint:", v16, v17);

      v74 = [(UIView *)v35 layer];
      objc_msgSend(v74, "setPosition:", v31, v33);

      [(UIView *)v35 addSubview:v71];
      [(UIView *)v127 addSubview:v35];
      objc_storeStrong((id *)&self->_tabBarTransitionView, v35);
      uint64_t v75 = *MEMORY[0x1E4F3A0D0];
      v76 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
      v251[0] = v76;
      v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v251 count:1];
      v78 = [(UIView *)v64 layer];
      [v78 setFilters:v77];

      v79 = [MEMORY[0x1E4F39BC0] filterWithType:v75];
      v250 = v79;
      v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v250 count:1];
      v81 = [(UIView *)v35 layer];
      [v81 setFilters:v80];

      [v132 addNonIncrementingCompletion:v151];
      CGRect v36 = v64;
    }
    if (v142) {
      v82 = v36;
    }
    else {
      v82 = v35;
    }
    v136 = v36;
    if (v142) {
      v83 = v35;
    }
    else {
      v83 = v36;
    }
    v84 = v82;
    v85 = v83;
    id v222 = 0;
    long long v220 = 0u;
    long long v221 = 0u;
    long long v218 = 0u;
    long long v219 = 0u;
    long long v216 = 0u;
    long long v217 = 0u;
    long long v214 = 0u;
    long long v215 = 0u;
    long long v213 = 0u;
    if (v142)
    {
      __copy_constructor_8_8_t0w64_s64_s72_t80w64_s144((uint64_t)&v213, v238);
      v86 = v223;
      v87 = v145;
    }
    else
    {
      __copy_constructor_8_8_t0w64_s64_s72_t80w64_s144((uint64_t)&v213, v223);
      v86 = v238;
      v87 = v143;
    }
    id v212 = 0;
    long long v210 = 0u;
    long long v211 = 0u;
    long long v208 = 0u;
    long long v209 = 0u;
    long long v206 = 0u;
    long long v207 = 0u;
    long long v204 = 0u;
    long long v205 = 0u;
    long long v203 = 0u;
    __copy_constructor_8_8_t0w64_s64_s72_t80w64_s144((uint64_t)&v203, v86);
    id v88 = v87;
    if (!v139)
    {
      v89 = [(UIView *)v85 layer];
      [v89 setValue:&unk_1ED3F25F8 forKeyPath:@"filters.gaussianBlur.inputRadius"];

      v90 = [(UIView *)v84 layer];
      [v90 setValue:&unk_1ED3F2608 forKeyPath:@"filters.gaussianBlur.inputRadius"];

      [(UIView *)v84 setAlpha:0.0];
      *(void *)&double v91 = v204;
      CGAffineTransformMakeScale(&v202, *(double *)&v204 / *(double *)&v214, 1.0);
      CGAffineTransform v201 = v202;
      [(UIView *)v84 setTransform:&v201];
      [(UIView *)obj setCenter:v205];
      long long v92 = v203;
      double v93 = *((double *)&v204 + 1);
      -[UIView setBounds:](obj, "setBounds:", v203, __PAIR128__(*((unint64_t *)&v204 + 1), *(unint64_t *)&v91));
      v94 = [(UIView *)obj layer];
      v200[0] = v208;
      v200[1] = v209;
      v200[2] = v210;
      v200[3] = v211;
      [v94 setCornerRadii:v200];

      [*((id *)&v207 + 1) applyToView:obj];
      -[UIView setFrame:](v137, "setFrame:", v92, v91, v93);
      v95 = [(UIView *)v137 layer];
      v199[0] = v208;
      v199[1] = v209;
      v199[2] = v210;
      v199[3] = v211;
      [v95 setCornerRadii:v199];

      [(UIVisualEffectView *)v137 setEffect:(void)v207];
      long long v96 = v206;
      v97 = [(UIView *)v136 layer];
      [v97 setPosition:v96];

      v98 = [(UIView *)v35 layer];
      [v98 setPosition:v96];
    }
    v99 = [(UIView *)v84 superview];
    [v99 bringSubviewToFront:v84];

    memset(&v198, 0, sizeof(v198));
    CGAffineTransformMakeScale(&v198, *(double *)&v214 / *(double *)&v204, 1.0);
    if (self->_isAnimatingEditModeAppearance) {
      [(_UITabContainerView *)self _finalizeEditingState];
    }
    currentRopeAnimation = self->_currentRopeAnimation;
    if (currentRopeAnimation) {
      [(_UIRopeAnimation *)currentRopeAnimation invalidate];
    }
    v101 = objc_alloc_init(_UIRopeAnimation);
    v194[0] = MEMORY[0x1E4F143A8];
    v194[1] = 3221225472;
    v194[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_30;
    v194[3] = &unk_1E52DCB30;
    id v102 = v132;
    id v195 = v102;
    v196 = self;
    v197 = v134;
    v103 = _Block_copy(v194);
    v140 = v35;
    v104 = v88;
    v178[0] = MEMORY[0x1E4F143A8];
    v178[1] = 3254779904;
    v178[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_4;
    v178[3] = &unk_1ED0E7500;
    v178[4] = self;
    char v192 = v142;
    id v105 = v102;
    id v179 = v105;
    v106 = v85;
    v107 = obj;
    v180 = v107;
    v133 = v84;
    v181 = v133;
    v126 = v106;
    v182 = v126;
    __copy_constructor_8_8_t0w64_s64_s72_t80w64_s144((uint64_t)v185, (id *)&v213);
    long long v186 = *(_OWORD *)&v198.a;
    long long v187 = *(_OWORD *)&v198.c;
    long long v108 = *MEMORY[0x1E4F1DAB8];
    long long v109 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v188 = *(_OWORD *)&v198.tx;
    long long v189 = v108;
    long long v131 = v108;
    long long v110 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    long long v128 = v109;
    long long v190 = v109;
    long long v191 = v110;
    long long v125 = v110;
    v111 = v137;
    v183 = v111;
    char v193 = v142;
    id v112 = v103;
    id v184 = v112;
    [(_UIRopeAnimation *)v101 addAnimation:v178];
    v156[0] = MEMORY[0x1E4F143A8];
    v156[1] = 3254779904;
    v156[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_36;
    v156[3] = &unk_1ED0E75A8;
    id v138 = v104;
    id v157 = v138;
    v158 = self;
    char v176 = v142;
    v121 = v147;
    v159 = v121;
    id v122 = v149;
    id v160 = v122;
    id v123 = v143;
    id v161 = v123;
    __copy_constructor_8_8_t0w64_s64_s72_t80w64_s144((uint64_t)v170, v223);
    v148 = v140;
    v162 = v148;
    id v113 = v105;
    id v163 = v113;
    __copy_constructor_8_8_t0w64_s64_s72_t80w64_s144((uint64_t)v171, (id *)&v213);
    v124 = v107;
    v164 = v124;
    v141 = v111;
    v165 = v141;
    v144 = v136;
    v166 = v144;
    v150 = v126;
    v167 = v150;
    CGAffineTransform v172 = v198;
    v114 = v133;
    v168 = v114;
    long long v173 = v131;
    long long v174 = v128;
    long long v175 = v125;
    char v177 = v142;
    id v115 = v112;
    id v169 = v115;
    [(_UIRopeAnimation *)v101 addAnimation:v156];
    v116 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.3];
    v152[0] = MEMORY[0x1E4F143A8];
    v152[1] = 3221225472;
    v152[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_45;
    v152[3] = &unk_1E5306400;
    objc_copyWeak(&v155, &location);
    id v117 = v113;
    id v153 = v117;
    v118 = v101;
    v154 = v118;
    [(_UIRopeAnimation *)v118 beginUsingSpringBehavior:v116 completion:v152];
    v119 = self->_currentRopeAnimation;
    self->_currentRopeAnimation = v118;
    v120 = v118;

    objc_destroyWeak(&v155);
    double v5 = v134;
  }
  else
  {
    id v6 = [(_UITabContainerView *)self delegate];
    [v6 updateContentLayoutForSidebarAppearanceWithTransitionCoordinator:0];

    [(_UITabBarControllerSidebarAnimator *)v5 runAnimations];
    [(_UITabBarControllerSidebarAnimator *)v5 runCompletions];
    transitionGroupCompletion = self->_transitionGroupCompletion;
    if (transitionGroupCompletion) {
      [(_UIGroupCompletion *)transitionGroupCompletion completeImmediately];
    }
    else {
      v151[2]();
    }
  }

  objc_destroyWeak(&v248);
  objc_destroyWeak(&location);
}

- (void)updateEditModeAppearanceAnimated:(BOOL)a3
{
  BOOL v22 = a3;
  BOOL v4 = [(_UITabContainerView *)self tabModel];
  int v5 = [v4 isEditing];

  char v6 = [(_UITabContainerView *)self supportedComponent];
  uint64_t v7 = [(_UITabContainerView *)self outlineView];
  BOOL v8 = [(_UITabContainerView *)self floatingTabBar];
  unsigned int v9 = [v7 superview];

  BOOL v10 = [v8 superview];

  if (v5)
  {
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = [(_UITabContainerView *)self _isShowingSidebar];
    if ([(_UITabContainerView *)self _isShowingSidebar])
    {
      int v12 = 0;
      goto LABEL_6;
    }
  }
  int v12 = v6 & 1;
LABEL_6:
  double v13 = [(_UITabContainerView *)self _configuredGroupCompletion];
  [v13 increment];
  self->_suppressesEditingInsetsChanges = 1;
  -[_UITabOutlineView tabModelEditingStateDidChange]((uint64_t)v7);
  [v8 tabModelEditingStateDidChange];
  if (v5)
  {
    -[_UITabOutlineView setEditing:animated:]((uint64_t)v7, 1, v9 != 0);
    CGFloat v14 = v8;
    uint64_t v15 = 1;
    BOOL v16 = v10 != 0;
LABEL_12:
    [v14 setEditing:v15 animated:v16];
    goto LABEL_13;
  }
  if (v11) {
    -[_UITabOutlineView setEditing:animated:]((uint64_t)v7, 0, 1);
  }
  if (v12)
  {
    CGFloat v14 = v8;
    uint64_t v15 = 0;
    BOOL v16 = 1;
    goto LABEL_12;
  }
LABEL_13:
  [(_UITabContainerView *)self _updateVisibleBarAnimated:v22 requireLayout:1 updateDimmingView:1];
  if (!v9 && v11) {
    [v7 setAlpha:0.0];
  }
  char v17 = v5;
  if (!v10 && ((v12 ^ 1) & 1) == 0) {
    [v8 setAlpha:0.0];
  }
  [(UIView *)self bringSubviewToFront:v8];
  self->_isAnimatingEditModeAppearance = 1;
  uint64_t v18 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.25];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __56___UITabContainerView_updateEditModeAppearanceAnimated___block_invoke;
  v25[3] = &unk_1E5306428;
  BOOL v29 = v11;
  id v26 = v7;
  id v27 = v8;
  char v30 = v12;
  char v31 = v17;
  double v28 = self;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __56___UITabContainerView_updateEditModeAppearanceAnimated___block_invoke_2;
  v23[3] = &unk_1E52DA9D0;
  id v24 = v13;
  id v19 = v13;
  id v20 = v8;
  id v21 = v7;
  +[UIView _animateUsingSpringBehavior:v18 tracking:0 animations:v25 completion:v23];
}

- (id)_configuredGroupCompletion
{
  transitionGroupCompletion = self->_transitionGroupCompletion;
  if (!transitionGroupCompletion)
  {
    BOOL v4 = objc_alloc_init(_UIGroupCompletion);
    int v5 = self->_transitionGroupCompletion;
    self->_transitionGroupCompletion = v4;

    objc_initWeak(&location, self);
    char v6 = self->_transitionGroupCompletion;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49___UITabContainerView__configuredGroupCompletion__block_invoke;
    v8[3] = &unk_1E52DC308;
    objc_copyWeak(&v9, &location);
    [(_UIGroupCompletion *)v6 addNonIncrementingCompletion:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    transitionGroupCompletion = self->_transitionGroupCompletion;
  }
  return transitionGroupCompletion;
}

- (void)_finalizeEditingState
{
  if (self->_isAnimatingEditModeAppearance)
  {
    BOOL v3 = [(_UITabContainerView *)self tabModel];
    uint64_t v4 = [v3 isEditing];

    id v6 = [(_UITabContainerView *)self floatingTabBar];
    int v5 = [(_UITabContainerView *)self outlineView];
    [v6 setAlpha:1.0];
    [v5 setAlpha:1.0];
    [v6 setEditing:v4 animated:0];
    -[_UITabOutlineView setEditing:animated:]((uint64_t)v5, v4, 0);
    self->_isAnimatingEditModeAppearance = 0;
    self->_suppressesEditingInsetsChanges = 0;
  }
}

- (void)_horizontalSizeClassDidChange
{
  BOOL v3 = [(_UITabContainerView *)self canShowFloatingUI];
  uint64_t v4 = [(_UITabContainerView *)self floatingTabBar];
  [v4 setShowRecentItem:v3];

  [(_UITabContainerView *)self _updateVisibleBarAnimated:0];
}

- (void)_updateVisibleBarAnimated:(BOOL)a3
{
}

- (void)_updateVisibleBarAnimated:(BOOL)a3 requireLayout:(BOOL)a4 updateDimmingView:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = a3;
  if ([(_UITabContainerView *)self _hasActiveMorphTransition])
  {
    if (v7)
    {
      [(_UITabContainerView *)self _updateSidebarAppearanceForMorphTransitionAnimated:1];
    }
  }
  else
  {
    BOOL v51 = v5;
    int64_t v9 = [(_UITabContainerView *)self _currentVisibleComponents];
    BOOL v10 = [(_UITabContainerView *)self _isTabBarHidden];
    BOOL v11 = [(_UITabContainerView *)self outlineView];
    int v12 = [(_UITabContainerView *)self floatingTabBar];
    double v13 = [(_UITabContainerView *)self _borderView];
    double v50 = self->_alongsideAnimator;
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __81___UITabContainerView__updateVisibleBarAnimated_requireLayout_updateDimmingView___block_invoke;
    v82[3] = &unk_1E5306450;
    BOOL v53 = v7;
    BOOL v14 = v7 || a4;
    BOOL v15 = v10;
    v82[4] = self;
    BOOL v86 = v14;
    BOOL v87 = (v9 & 4) != 0;
    id v16 = v11;
    id v83 = v16;
    id v17 = v13;
    id v84 = v17;
    BOOL v88 = (v9 & 2) != 0;
    uint64_t v18 = (void *)v9;
    id v19 = v12;
    id v85 = v19;
    +[UIView performWithoutAnimation:v82];
    long long v20 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v81.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v81.c = v20;
    *(_OWORD *)&v81.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&v80.a = *(_OWORD *)&v81.a;
    *(_OWORD *)&v80.c = v20;
    *(_OWORD *)&v80.tdouble x = *(_OWORD *)&v81.tx;
    if ((v9 & 4) == 0 && v15)
    {
      [(_UITabContainerView *)self _currentSidebarWidth];
      double v22 = v21;
      int v23 = [v16 _shouldReverseLayoutDirection];
      double v24 = -v22;
      if (v23) {
        double v24 = v22;
      }
      CGAffineTransformMakeTranslation(&v81, v24, 0.0);
    }
    BOOL v25 = (v9 & 2) == 0 && v15;
    double v26 = 1.0;
    if (v25)
    {
      [(UIView *)self bounds];
      objc_msgSend(v19, "sizeThatFits:", v27, v28);
      double v26 = 0.0;
      CGAffineTransformMakeTranslation(&v80, 0.0, -v29);
    }
    if (v16) {
      [v16 transform];
    }
    else {
      memset(&t1, 0, sizeof(t1));
    }
    CGAffineTransform t2 = v81;
    BOOL v30 = CGAffineTransformEqualToTransform(&t1, &t2);
    [v19 alpha];
    double v32 = v31;
    if ([(_UITabContainerView *)self canShowFloatingUI]) {
      int v33 = v32 != v26 || !v30;
    }
    else {
      int v33 = 0;
    }
    if (v32 != v26)
    {
      uint64_t v34 = [(_UITabContainerView *)self floatingTabBarHost];
      [v34 tabBarContainerWillChangeFloatingTabBarVisibility:self];
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __81___UITabContainerView__updateVisibleBarAnimated_requireLayout_updateDimmingView___block_invoke_2;
    aBlock[3] = &unk_1E5306478;
    id v35 = v19;
    id v72 = v35;
    double v75 = v26;
    CGAffineTransform v76 = v80;
    id v36 = v16;
    id v73 = v36;
    CGAffineTransform v77 = v81;
    id v37 = v17;
    id v74 = v37;
    double v54 = _Block_copy(aBlock);
    objc_initWeak((id *)&t2, self);
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __81___UITabContainerView__updateVisibleBarAnimated_requireLayout_updateDimmingView___block_invoke_3;
    v67[3] = &unk_1E53064A0;
    objc_copyWeak(v70, (id *)&t2);
    v70[1] = v18;
    id v38 = v35;
    id v68 = v38;
    id v39 = v36;
    id v69 = v39;
    double v40 = _Block_copy(v67);
    double v41 = 0;
    if (v53 && v33) {
      double v41 = [[_UITabSidebarTransitionAnimator alloc] initWithContainerView:self duration:0.5];
    }
    double v49 = v38;
    double v52 = v37;
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __81___UITabContainerView__updateVisibleBarAnimated_requireLayout_updateDimmingView___block_invoke_4;
    v64[3] = &unk_1E52DCB30;
    v64[4] = self;
    double v42 = v41;
    v65 = v42;
    CGRect v43 = v50;
    v66 = v43;
    v44 = _Block_copy(v64);
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __81___UITabContainerView__updateVisibleBarAnimated_requireLayout_updateDimmingView___block_invoke_5;
    v61[3] = &unk_1E52DA660;
    v45 = v42;
    double v62 = v45;
    v46 = v43;
    double v63 = v46;
    double v47 = _Block_copy(v61);
    if (v51) {
      -[_UITabContainerView updateDimmingViewAnimated:](self, "updateDimmingViewAnimated:", v53, v49);
    }
    if (v53)
    {
      double v48 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.35];
      +[UIView _animateUsingSpringBehavior:v48 tracking:0 animations:v54 completion:v40];
      if (v33) {
        +[UIView animateWithDuration:0 delay:v44 usingSpringWithDamping:v47 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:0.0];
      }
    }
    else
    {
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __81___UITabContainerView__updateVisibleBarAnimated_requireLayout_updateDimmingView___block_invoke_6;
      v55[3] = &unk_1E53064C8;
      id v56 = v54;
      char v60 = v33;
      id v57 = v44;
      id v58 = v47;
      id v59 = v40;
      +[UIView performWithoutAnimation:v55];

      double v48 = v56;
    }

    objc_destroyWeak(v70);
    objc_destroyWeak((id *)&t2);
  }
}

- (int64_t)_currentVisibleComponents
{
  int v3 = [(_UITabContainerView *)self _isTabBarHidden];
  uint64_t v4 = [(UIView *)self traitCollection];
  uint64_t v5 = [v4 horizontalSizeClass];

  id v6 = [(_UITabContainerView *)self tabModel];
  int v7 = [v6 isEditing];

  char v8 = [(_UITabContainerView *)self supportedComponent];
  char v9 = [(_UITabContainerView *)self supportedComponent];
  BOOL v10 = [(_UITabContainerView *)self sidebar];
  int v11 = [v10 isHidden];
  if ((v9 & 2) != 0) {
    int v12 = v11;
  }
  else {
    int v12 = 1;
  }

  int v13 = 0;
  if (v5 == 2 && v7 | v12 ^ 1) {
    int v13 = (LOBYTE(self->_availableComponent) >> 1) & 1;
  }
  BOOL v14 = (v8 & 1) != 0 && v5 == 2;
  int v15 = !v14;
  if (v14) {
    char v16 = v7;
  }
  else {
    char v16 = 1;
  }
  int v17 = v15 ^ 1;
  if ((v16 & 1) == 0) {
    int v17 = v12 & ~v3;
  }
  if (v17) {
    int64_t v18 = (v5 != 2) & ~v3 | 2;
  }
  else {
    int64_t v18 = (v5 != 2) & ~v3;
  }
  if (v13) {
    return v18 | 4;
  }
  else {
    return v18;
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v4 = [(_UITabContainerView *)self tabModel];
  int v5 = [v4 isEditing];

  if (v5)
  {
    id v6 = [(_UITabContainerView *)self floatingTabBar];
    if ([v6 hasActiveDrag])
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      char v8 = [(_UITabContainerView *)self sidebar];
      char v9 = [v8 _outlineView];
      unsigned int v7 = -[_UITabOutlineView hasActiveDrag](v9) ^ 1;
    }
  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (void)_handleDimmingViewTap:(id)a3
{
  uint64_t v4 = [(_UITabContainerView *)self tabModel];
  int v5 = [v4 isEditing];

  if (v5)
  {
    id v6 = [(_UITabContainerView *)self tabModel];
    [v6 setEditing:0];
  }
  else
  {
    id v6 = [(_UITabContainerView *)self sidebar];
    -[UITabBarControllerSidebar _setHidden:source:]((uint64_t)v6, 1, 3);
  }
}

- (void)updateDimmingViewAnimated:(BOOL)a3
{
  uint64_t v4 = [(_UITabContainerView *)self tabModel];
  int v5 = [v4 isEditing];

  int64_t v6 = [(_UITabContainerView *)self sidebarLayout];
  unsigned int v7 = [(_UITabContainerView *)self sidebar];
  int isSidebarSupportedAnd = -[UITabBarControllerSidebar _isSidebarSupportedAndVisible](v7);

  char v9 = [(UIView *)self traitCollection];
  uint64_t v10 = [v9 horizontalSizeClass];

  if (v10 == 2 && (v6 == 2 ? (int v11 = isSidebarSupportedAnd) : (int v11 = 0), ((v5 | v11) & 1) != 0))
  {
    int v12 = [(_UITabContainerView *)self _dimmingView];
    double v13 = 1.0;
    char v14 = 1;
    double v15 = 0.0;
  }
  else
  {
    char v16 = [(UIView *)self->_dimmingView superview];

    if (!v16) {
      return;
    }
    int v12 = [(_UITabContainerView *)self _dimmingView];
    char v14 = 0;
    double v13 = 0.0;
    double v15 = 1.0;
  }
  int v17 = [v12 superview];

  if (!v17)
  {
    [v12 setAlpha:v15];
    [(UIView *)self insertSubview:v12 atIndex:0];
  }
  int64_t v18 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.25];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __49___UITabContainerView_updateDimmingViewAnimated___block_invoke;
  v23[3] = &unk_1E52D9CD0;
  id v24 = v12;
  double v25 = v13;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __49___UITabContainerView_updateDimmingViewAnimated___block_invoke_2;
  v20[3] = &unk_1E53064F0;
  char v22 = v14;
  id v21 = v24;
  id v19 = v24;
  +[UIView _animateUsingSpringBehavior:v18 tracking:0 animations:v23 completion:v20];
}

- (UIView)_dimmingView
{
  dimmingView = self->_dimmingView;
  if (!dimmingView)
  {
    uint64_t v4 = [UIView alloc];
    [(UIView *)self bounds];
    int v5 = -[UIView initWithFrame:](v4, "initWithFrame:");
    [(UIView *)v5 setAutoresizingMask:18];
    int64_t v6 = +[UIColor _dimmingViewColor];
    [(UIView *)v5 setBackgroundColor:v6];

    unsigned int v7 = self->_dimmingView;
    self->_dimmingView = v5;
    char v8 = v5;

    char v9 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel__handleDimmingViewTap_];
    [(UIGestureRecognizer *)v9 setDelegate:self];
    [(UIView *)v8 addGestureRecognizer:v9];
    uint64_t v10 = [[UIDropInteraction alloc] initWithDelegate:self];
    [(UIView *)v8 addInteraction:v10];

    dimmingView = self->_dimmingView;
  }
  return dimmingView;
}

- (id)preferredFocusEnvironments
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(_UITabContainerView *)self outlineView];
  int v5 = [v4 window];

  if (v5)
  {
    int64_t v6 = [(_UITabContainerView *)self outlineView];
    [v3 addObject:v6];
  }
  unsigned int v7 = [(_UITabContainerView *)self floatingTabBar];
  char v8 = [v7 window];

  if (v8)
  {
    char v9 = [(_UITabContainerView *)self floatingTabBar];
    [v3 addObject:v9];
  }
  uint64_t v10 = [(_UITabContainerView *)self tabBar];
  int v11 = [v10 window];

  if (v11)
  {
    int v12 = [(_UITabContainerView *)self tabBar];
    [v3 addObject:v12];
  }
  return v3;
}

- (id)resolvedPopoverPresentationControllerSourceItemForTab:(id)a3
{
  id v4 = a3;
  int v5 = [(_UITabContainerView *)self tabBar];
  int64_t v6 = [v5 window];

  if (v6)
  {
    unsigned int v7 = [v4 _parentGroup];

    if (!v7)
    {
      double v13 = [v4 _resolvedTabBarItemSourceItemForPopoverPresentationControllerSourceItem];
      goto LABEL_11;
    }
    char v8 = [v4 _parentGroup];
    char v9 = self;
    id v10 = v8;
    goto LABEL_10;
  }
  int v11 = [(_UITabContainerView *)self outlineView];
  int v12 = [v11 window];

  if (v12)
  {
    char v9 = [(_UITabContainerView *)self outlineView];
LABEL_9:
    char v8 = v9;
    id v10 = v4;
LABEL_10:
    double v13 = [v9 resolvedPopoverPresentationControllerSourceItemForTab:v10];

    goto LABEL_11;
  }
  char v14 = [(_UITabContainerView *)self floatingTabBar];
  double v15 = [v14 window];

  if (v15)
  {
    char v9 = [(_UITabContainerView *)self floatingTabBar];
    goto LABEL_9;
  }
  double v13 = 0;
LABEL_11:

  return v13;
}

- (void)outlineView:(id)a3 didSelectTab:(id)a4
{
  int v5 = [(_UITabContainerView *)self tabModel];
  char v6 = [v5 isEditing];

  if ((v6 & 1) == 0)
  {
    unsigned int v7 = [(UIView *)self->_dimmingView superview];

    if (v7)
    {
      id v8 = [(_UITabContainerView *)self sidebar];
      -[UITabBarControllerSidebar _setHidden:source:]((uint64_t)v8, 1, 0);
    }
  }
}

- (void)outlineViewDidChangeCustomizationStore:(id)a3
{
  id v4 = [(_UITabContainerView *)self tabModel];
  int v5 = [v4 customizationStore];
  [v5 preferredSidebarWidth];
  double v7 = v6;

  [(_UITabContainerView *)self setCurrentSidebarWidth:v7];
  [(_UITabContainerView *)self _updateOutlineViewFrame];
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v5 = a4;
  double v6 = [(_UITabContainerView *)self tabModel];
  int v7 = [v6 isEditing];

  if (v7)
  {
    id v8 = [v5 items];
    char v9 = [v8 firstObject];

    id v10 = [v5 items];
    if ([v10 count] == 1)
    {
      int v11 = [v9 localObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_11:

        goto LABEL_12;
      }
      id v10 = [v9 localObject];
      double v13 = [v9 previewProvider];
      if (v13)
      {
      }
      else
      {
        uint64_t v14 = [(_UITabContainerView *)self outlineView];
        double v15 = (void *)v14;
        if (v14) {
          char v16 = *(void **)(v14 + 496);
        }
        else {
          char v16 = 0;
        }
        id v17 = v16;
        id v18 = [v5 localDragSession];

        if (v17 == v18)
        {
          id v19 = [(UIView *)self traitCollection];
          uint64_t v20 = [v19 userInterfaceStyle];

          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __55___UITabContainerView_dropInteraction_sessionDidEnter___block_invoke;
          v21[3] = &unk_1E5306518;
          id v22 = v10;
          uint64_t v23 = v20;
          [v9 setPreviewProvider:v21];
        }
      }
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (_UITabSidebarBorderView)_borderView
{
  return self->_borderView;
}

- (_UITabContainerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UITabContainerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_UITabModel)tabModel
{
  return self->_tabModel;
}

- (UITabBarControllerSidebar)sidebar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sidebar);
  return (UITabBarControllerSidebar *)WeakRetained;
}

- (int64_t)sidebarLayout
{
  return self->_sidebarLayout;
}

- (int64_t)supportedComponent
{
  return self->_supportedComponent;
}

- (int64_t)availableComponent
{
  return self->_availableComponent;
}

- (UIAction)overrideTidebarButtonAction
{
  return self->_overrideTidebarButtonAction;
}

- (_UITabContainerViewFloatingTabBarHost)floatingTabBarHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_floatingTabBarHost);
  return (_UITabContainerViewFloatingTabBarHost *)WeakRetained;
}

- (void)setFloatingTabBarHost:(id)a3
{
}

- (BOOL)suppressTabBar
{
  return self->_suppressTabBar;
}

- (BOOL)wantsHostingNavigationBarPlaceholder
{
  return self->_wantsHostingNavigationBarPlaceholder;
}

- (UIBarButtonItem)hostingNavigationBarPlaceholderItem
{
  return self->_hostingNavigationBarPlaceholderItem;
}

- (BOOL)supportsResizingSidebar
{
  return self->_supportsResizingSidebar;
}

- (double)minimumSidebarWidth
{
  return self->_minimumSidebarWidth;
}

- (void)setMinimumSidebarWidth:(double)a3
{
  self->_minimumSidebardouble Width = a3;
}

- (double)maximumSidebarWidth
{
  return self->_maximumSidebarWidth;
}

- (void)setMaximumSidebarWidth:(double)a3
{
  self->_maximumSidebardouble Width = a3;
}

- (UITabBar)tabBar
{
  return self->_tabBar;
}

- (double)currentSidebarWidth
{
  return self->_currentSidebarWidth;
}

- (void)setCurrentSidebarWidth:(double)a3
{
  self->_currentSidebardouble Width = a3;
}

- (double)pendingSidebarTranslation
{
  return self->_pendingSidebarTranslation;
}

- (void)setPendingSidebarTranslation:(double)a3
{
  self->_pendingSidebarTranslation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabBar, 0);
  objc_storeStrong((id *)&self->_hostingNavigationBarPlaceholderItem, 0);
  objc_destroyWeak((id *)&self->_floatingTabBarHost);
  objc_storeStrong((id *)&self->_overrideTidebarButtonAction, 0);
  objc_destroyWeak((id *)&self->_sidebar);
  objc_storeStrong((id *)&self->_tabModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_floatingTabBar, 0);
  objc_storeStrong((id *)&self->_sidebarToggleAction, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_alongsideAnimator, 0);
  objc_storeStrong((id *)&self->_currentRopeAnimation, 0);
  objc_storeStrong((id *)&self->_transitionGroupCompletion, 0);
  objc_storeStrong((id *)&self->_tabBarTransitionView, 0);
  objc_storeStrong((id *)&self->_outlineTransitionView, 0);
  objc_storeStrong((id *)&self->_transitionBackgroundView, 0);
  objc_storeStrong((id *)&self->_transitionContainerView, 0);
}

@end