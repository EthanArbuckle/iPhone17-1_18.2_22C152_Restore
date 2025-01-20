@interface _UITabBarVisualProviderLegacyTVOS
- (BOOL)_focusedItemHighlightViewIsVisible;
- (BOOL)_shim_shadowHidden;
- (CGRect)_layoutRegion;
- (CGRect)_shadowFrameForBounds:(CGRect)a3 height:(double)a4;
- (CGSize)intrinsicContentSizeGivenSize:(CGSize)a3;
- (double)_shim_shadowAlpha;
- (id)_focusedItemHighlightView;
- (id)_parentViewForItems;
- (id)_shim_accessoryView;
- (id)_shim_compatibilityBackgroundView;
- (id)createViewForTabBarItem:(id)a3;
- (id)exchangeItem:(id)a3 withItem:(id)a4;
- (id)preferredFocusedView;
- (void)_applyAppearanceCustomizationsToItem:(id)a3;
- (void)_configureItems:(id)a3;
- (void)_layoutTabBarItems;
- (void)_setFocusedItemHightlightVisible:(BOOL)a3;
- (void)_shim_setAccessoryView:(id)a3;
- (void)_shim_setCustomBackgroundView:(id)a3;
- (void)_shim_setShadowAlpha:(double)a3;
- (void)_shim_setShadowHidden:(BOOL)a3;
- (void)_shim_updateFocusHighlightVisibility;
- (void)_shim_updateTabBarItemView:(id)a3;
- (void)_updateAccessoryView;
- (void)_updateBackground;
- (void)_updateFocusedItemHighlightFrame;
- (void)_updateFocusedItemHighlightViewWithInterfaceStyle:(int64_t)a3 visible:(BOOL)a4;
- (void)_updateHighlightMotionEffect;
- (void)changeItemsTo:(id)a3 removingItems:(id)a4 selectedItem:(id)a5 oldSelectedItem:(id)a6 animate:(BOOL)a7;
- (void)changeLayout;
- (void)changeSelectedItem:(id)a3 fromItem:(id)a4;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepare;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)teardown;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateArchivedSubviews:(id)a3;
- (void)updateBackgroundGroupName;
@end

@implementation _UITabBarVisualProviderLegacyTVOS

- (void)prepare
{
  v11.receiver = self;
  v11.super_class = (Class)_UITabBarVisualProviderLegacyTVOS;
  [(_UITabBarVisualProvider *)&v11 prepare];
  [(UIView *)self->super._tabBar bounds];
  v7 = -[_UIBarBackground initWithFrame:]([_UIBarBackground alloc], "initWithFrame:", v3, v4, v5, v6);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v7;

  [(_UIBarBackground *)self->_backgroundView setTopAligned:0];
  v9 = objc_alloc_init(_UIBarBackgroundLayoutLegacy);
  backgroundViewLayout = self->_backgroundViewLayout;
  self->_backgroundViewLayout = v9;

  [(_UIBarBackground *)self->_backgroundView setLayout:self->_backgroundViewLayout];
  [(UITabBar *)self->super._tabBar _setVibrantLabels:1];
}

- (void)teardown
{
  [(UIView *)self->_backgroundView removeFromSuperview];
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  [(UIView *)self->_accessoryView removeFromSuperview];
  accessoryView = self->_accessoryView;
  self->_accessoryView = 0;

  [(UIScrollView *)self->_itemsScrollView removeFromSuperview];
  itemsScrollView = self->_itemsScrollView;
  self->_itemsScrollView = 0;

  [(UIView *)self->_focusedItemHighlightView removeFromSuperview];
  focusedItemHighlightView = self->_focusedItemHighlightView;
  self->_focusedItemHighlightView = 0;

  focusedItemHighlightMotionEffect = self->_focusedItemHighlightMotionEffect;
  self->_focusedItemHighlightMotionEffect = 0;

  v8.receiver = self;
  v8.super_class = (Class)_UITabBarVisualProviderLegacyTVOS;
  [(_UITabBarVisualProvider *)&v8 teardown];
}

- (void)changeItemsTo:(id)a3 removingItems:(id)a4 selectedItem:(id)a5 oldSelectedItem:(id)a6 animate:(BOOL)a7
{
  BOOL v35 = a7;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v34 = a4;
  id v37 = a5;
  int64_t v11 = [(UITabBar *)self->super._tabBar _barMetrics];
  int64_t v12 = [(UITabBar *)self->super._tabBar _imageStyle];
  v36 = self;
  v13 = [(_UITabBarVisualProviderLegacyTVOS *)self _parentViewForItems];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v50;
    do
    {
      v18 = v14;
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v50 != v17) {
          objc_enumerationMutation(v18);
        }
        id v20 = *(id *)(*((void *)&v49 + 1) + 8 * i);
        objc_msgSend(v20, "_setBarMetrics:", v11, v34);
        [v20 _setImageStyle:v12];
        v21 = -[UITabBarItem _tabBarButton]((id *)v20);
        if (v21 && ([v13 containsView:v21] & 1) != 0)
        {
          v22 = v21;
        }
        else
        {
          [v21 removeFromSuperview];
          v22 = [(_UITabBarVisualProviderLegacyTVOS *)v36 createViewForTabBarItem:v20];

          [v13 addSubview:v22];
          -[UITabBarItem _setTabBarButton:]((uint64_t)v20, v22);
          if (v35) {
            [v22 setAlpha:0.0];
          }
        }
        v23 = -[UITabBarItem _tabBarButton]((id *)v20);
        [v23 _showSelectedIndicator:v20 == v37 changeSelection:1];
      }
      id v14 = v18;
      uint64_t v16 = [v18 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v16);
  }

  if (v35)
  {
    [(_UITabBarVisualProvider *)v36 defaultAnimationDuration];
    double v25 = v24;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __102___UITabBarVisualProviderLegacyTVOS_changeItemsTo_removingItems_selectedItem_oldSelectedItem_animate___block_invoke;
    v44[3] = &unk_1E52DC3F8;
    v26 = v34;
    id v45 = v34;
    v46 = v36;
    BOOL v48 = v35;
    id v47 = v14;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __102___UITabBarVisualProviderLegacyTVOS_changeItemsTo_removingItems_selectedItem_oldSelectedItem_animate___block_invoke_2;
    v42[3] = &unk_1E52DC3A0;
    id v43 = v45;
    +[UIView animateWithDuration:v44 animations:v42 completion:v25];
  }
  else
  {
    id v27 = v14;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v26 = v34;
    id v28 = v34;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v38 objects:v53 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v39 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = -[UITabBarItem _tabBarButton](*(id **)(*((void *)&v38 + 1) + 8 * j));
          [v33 removeFromSuperview];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v38 objects:v53 count:16];
      }
      while (v30);
    }

    [(UIView *)v36->super._tabBar setNeedsLayout];
    id v14 = v27;
  }
}

- (void)_applyAppearanceCustomizationsToItem:(id)a3
{
  double v4 = (id *)a3;
  -[UITabBarItem _tabBarButton](v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  double v5 = [(UITabBar *)self->super._tabBar selectionIndicatorImage];
  [v7 _setCustomSelectedIndicatorImage:v5];

  double v6 = [v4 _tintColor];

  [v7 setTintColor:v6];
}

- (id)exchangeItem:(id)a3 withItem:(id)a4
{
  double v6 = (id *)a4;
  tabBar = self->super._tabBar;
  id v8 = a3;
  v9 = [(UITabBar *)tabBar items];
  uint64_t v10 = [v9 indexOfObject:v8];

  uint64_t v11 = [v9 indexOfObject:v6];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL || v10 == v11)
  {
    id v13 = v9;
  }
  else
  {
    uint64_t v14 = v11;
    uint64_t v15 = (void *)[v9 mutableCopy];
    uint64_t v16 = v15;
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [v15 replaceObjectAtIndex:v10 withObject:v6];
      uint64_t v17 = -[UITabBarItem _tabBarButton](v6);

      if (!v17)
      {
        objc_msgSend(v6, "_setImageStyle:", -[UITabBar _imageStyle](self->super._tabBar, "_imageStyle"));
        objc_msgSend(v6, "_setBarMetrics:", -[UITabBar _barMetrics](self->super._tabBar, "_barMetrics"));
        v18 = [(_UITabBarVisualProviderLegacyTVOS *)self createViewForTabBarItem:v6];
        -[UITabBarItem _setTabBarButton:]((uint64_t)v6, v18);
      }
      v19 = -[UITabBarItem _tabBarButton](v6);
      [v19 setAlpha:1.0];

      id v20 = [(_UITabBarVisualProviderLegacyTVOS *)self _parentViewForItems];
      v21 = -[UITabBarItem _tabBarButton](v6);
      [v20 addSubview:v21];

      [(_UITabBarVisualProviderLegacyTVOS *)self _applyAppearanceCustomizationsToItem:v6];
    }
    else
    {
      [v15 exchangeObjectAtIndex:v10 withObjectAtIndex:v14];
    }
    id v13 = (id)[v16 copy];
  }
  return v13;
}

- (void)changeSelectedItem:(id)a3 fromItem:(id)a4
{
  double v5 = (id *)a3;
  double v6 = -[UITabBarItem _tabBarButton]((id *)a4);
  [v6 _showSelectedIndicator:0 changeSelection:1];

  -[UITabBarItem _tabBarButton](v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [v7 _showSelectedIndicator:1 changeSelection:1];
}

- (void)changeLayout
{
}

- (id)createViewForTabBarItem:(id)a3
{
  id v5 = a3;
  if (![v5 _imageStyle])
  {
    long long v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2 object:self file:@"_UITabBarVisualProviderLegacyTVOS.m" lineNumber:176 description:@"A default style should never be returned at this point"];
  }
  double v6 = [(UITabBar *)self->super._tabBar _appearanceStorage];
  id v7 = [v6 selectedImageTintColor];

  if ([v5 isSystemItem]) {
    [v5 _internalTitle];
  }
  else {
  id v8 = [v5 title];
  }
  v9 = [UITabBarButton alloc];
  uint64_t v10 = [v5 unselectedImage];
  uint64_t v11 = [v5 _internalLandscapeTemplateImage];
  int64_t v12 = [v5 selectedImage];
  id v13 = [v5 _internalLandscapeSelectedImagePhone];
  [v5 imageInsets];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [v5 landscapeImagePhoneInsets];
  v26 = -[UITabBarButton initWithImage:landscapeImage:selectedImage:landscapeSelectedImage:label:withInsets:landscapeInsets:tabBar:](v9, "initWithImage:landscapeImage:selectedImage:landscapeSelectedImage:label:withInsets:landscapeInsets:tabBar:", v10, v11, v12, v13, v8, self->super._tabBar, v15, v17, v19, v21, v22, v23, v24, v25);

  [v5 badgeOffset];
  -[UITabBarButton _setBadgeOffset:](v26, "_setBadgeOffset:");
  if ([v5 isSpringLoaded]) {
    [(UITabBarButton *)v26 setSpringLoaded:1];
  }

  [(UITabBarButton *)v26 _setAppearanceGuideClass:objc_opt_class()];
  [(UIView *)v26 frame];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  [(UIView *)self->super._tabBar bounds];
  -[UIView setFrame:](v26, "setFrame:", v28, v30, v32);
  v33 = [v5 _appearanceStorage];
  id v34 = objc_getAssociatedObject(v5, &_UIAppearanceCustomizedSelectorsAssociationKey);
  [(UITabBarButton *)v26 _applyTabBarButtonAppearanceStorage:v33 withTaggedSelectors:v34];

  BOOL v35 = [(UITabBar *)self->super._tabBar _appearanceStorage];
  v36 = [v35 selectionIndicatorImage];

  if (v36) {
    [(UITabBarButton *)v26 _setCustomSelectedIndicatorImage:v36];
  }
  [(UIControl *)v26 addTarget:self->super._tabBar action:sel__buttonDown_ forControlEvents:1];
  [(UIControl *)v26 addTarget:self->super._tabBar action:sel__buttonUp_ forControlEvents:64];
  [(UIControl *)v26 addTarget:self->super._tabBar action:sel__buttonCancel_ forControlEvents:256];
  [(UIControl *)v26 addTarget:self->super._tabBar action:sel__sendAction_withEvent_ forControlEvents:0x40000000];
  -[UITabBarButton setEnabled:](v26, "setEnabled:", [v5 isEnabled]);
  [(UITabBarButton *)v26 _setShowsHighlightedState:[(UITabBar *)self->super._tabBar _showsHighlightedState]];
  id v37 = [v5 badgeValue];
  if (v37) {
    [(UITabBarButton *)v26 _setBadgeValue:v37];
  }
  [(UITabBarButton *)v26 setSemanticContentAttribute:[(UIView *)self->super._tabBar semanticContentAttribute]];

  return v26;
}

- (void)updateArchivedSubviews:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(UITabBar *)self->super._tabBar items];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(id **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = -[UITabBarItem _tabBarButton](v10);

        if (v11)
        {
          int64_t v12 = -[UITabBarItem _tabBarButton](v10);
          [v4 removeObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  if (self->_backgroundView) {
    objc_msgSend(v4, "removeObject:");
  }
  if (self->_accessoryView) {
    objc_msgSend(v4, "removeObject:");
  }
  if (self->_itemsScrollView) {
    objc_msgSend(v4, "removeObject:");
  }
  if (self->_focusedItemHighlightView) {
    objc_msgSend(v4, "removeObject:");
  }
}

- (CGSize)intrinsicContentSizeGivenSize:(CGSize)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(UITabBar *)self->super._tabBar _barMetrics] == 3)
  {
    double v4 = 140.0;
  }
  else if (os_variant_has_internal_diagnostics())
  {
    v9 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      tabBar = self->super._tabBar;
      int v11 = 138412290;
      int64_t v12 = tabBar;
      _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "_tabBar._barMetrics unexpectedly not _UITabBarMetricsTV in _UITabBarVisualProviderLegacyTVOS. _tabBar = %@", (uint8_t *)&v11, 0xCu);
    }

    double v4 = -1.0;
  }
  else
  {
    uint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &intrinsicContentSizeGivenSize____s_category) + 8);
    double v4 = -1.0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = self->super._tabBar;
      int v11 = 138412290;
      int64_t v12 = v8;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "_tabBar._barMetrics unexpectedly not _UITabBarMetricsTV in _UITabBarVisualProviderLegacyTVOS. _tabBar = %@", (uint8_t *)&v11, 0xCu);
    }
  }
  double v5 = -1.0;
  double v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGRect)_layoutRegion
{
  [(UIView *)self->super._tabBar bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  accessoryView = self->_accessoryView;
  if (accessoryView)
  {
    [(UIView *)accessoryView frame];
    double v8 = v8 - v12;
    tabBar = self->super._tabBar;
    double v14 = -0.0;
    if ((*((_DWORD *)&tabBar->super._viewFlags + 4) & 0x80000) != 0) {
      double v14 = v12;
    }
    double v4 = v4 + v14;
  }
  else
  {
    tabBar = self->super._tabBar;
  }
  long long v15 = [(UIView *)tabBar traitCollection];
  uint64_t v16 = [v15 userInterfaceIdiom];

  if (v16 != 3)
  {
    [(UIView *)self->super._tabBar safeAreaInsets];
    double v18 = v17;
    if (v17 != 0.0)
    {
      double v19 = +[UIDevice currentDevice];
      uint64_t v20 = [v19 userInterfaceIdiom];

      if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        double v18 = _UIBackgroundExtensionForBar(self->super._tabBar);
      }
    }
    double v10 = v10 - v18;
  }
  double v21 = v4;
  double v22 = v6;
  double v23 = v8;
  double v24 = v10;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)_shadowFrameForBounds:(CGRect)a3 height:(double)a4
{
  CGFloat width = a3.size.width;
  CGFloat x = a3.origin.x;
  double v7 = CGRectGetMinY(a3) - a4;
  double v8 = x;
  double v9 = width;
  double v10 = a4;
  result.size.height = v10;
  result.size.CGFloat width = v9;
  result.origin.y = v7;
  result.origin.CGFloat x = v8;
  return result;
}

- (void)_updateAccessoryView
{
  accessoryView = self->_accessoryView;
  if (accessoryView)
  {
    [(UIView *)accessoryView frame];
    double v5 = v4;
    [(_UITabBarVisualProviderLegacyTVOS *)self _layoutRegion];
    CGFloat v10 = v6;
    CGFloat v11 = v7;
    CGFloat v12 = v8;
    CGFloat v13 = v9;
    double MaxX = 0.0;
    if ((*((_DWORD *)&self->super._tabBar->super._viewFlags + 4) & 0x80000) == 0) {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v6);
    }
    v19.origin.CGFloat x = v10;
    v19.origin.y = v11;
    v19.size.CGFloat width = v12;
    v19.size.height = v13;
    double MinY = CGRectGetMinY(v19);
    v20.origin.CGFloat x = v10;
    v20.origin.y = v11;
    v20.size.CGFloat width = v12;
    v20.size.height = v13;
    double Height = CGRectGetHeight(v20);
    double v17 = self->_accessoryView;
    -[UIView setFrame:](v17, "setFrame:", MaxX, MinY, v5, Height);
  }
}

- (id)_parentViewForItems
{
  if (![(UITabBar *)self->super._tabBar _scrollsItems] || (tabBar = self->_itemsScrollView) == 0) {
    tabBar = self->super._tabBar;
  }
  return tabBar;
}

- (void)_configureItems:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(UITabBar *)self->super._tabBar _barMetrics];
  int64_t v6 = [(UITabBar *)self->super._tabBar _imageStyle];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        CGFloat v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "_barMetrics", (void)v14) != v5 || objc_msgSend(v12, "_imageStyle") != v6)
        {
          [v12 _setBarMetrics:v5];
          [v12 _setImageStyle:v6];
          [v12 _updateViewAndPositionItems:0];
        }
        CGFloat v13 = -[UITabBarItem _tabBarButton]((id *)v12);
        objc_msgSend(v13, "setSemanticContentAttribute:", -[UIView semanticContentAttribute](self->super._tabBar, "semanticContentAttribute"));
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)_layoutTabBarItems
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  double v3 = [(UITabBar *)self->super._tabBar items];
  if (![v3 count]) {
    goto LABEL_73;
  }
  BOOL v4 = [(UITabBar *)self->super._tabBar _scrollsItems];
  itemsScrollView = self->_itemsScrollView;
  if (v4)
  {
    if (!itemsScrollView)
    {
      int64_t v6 = [UIScrollView alloc];
      [(UIView *)self->super._tabBar bounds];
      id v7 = -[UIScrollView initWithFrame:](v6, "initWithFrame:");
      uint64_t v8 = self->_itemsScrollView;
      self->_itemsScrollView = v7;

      [(UIView *)self->_itemsScrollView setAutoresizingMask:18];
      [(UIScrollView *)self->_itemsScrollView setShowsHorizontalScrollIndicator:0];
      [(UIScrollView *)self->_itemsScrollView setShowsVerticalScrollIndicator:0];
      [(UIView *)self->super._tabBar addSubview:self->_itemsScrollView];
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      uint64_t v9 = v3;
      uint64_t v10 = [(UIScrollView *)v9 countByEnumeratingWithState:&v83 objects:v88 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v84;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v84 != v11) {
              objc_enumerationMutation(v9);
            }
            CGFloat v13 = *(id **)(*((void *)&v83 + 1) + 8 * i);
            long long v14 = -[UITabBarItem _tabBarButton](v13);
            long long v15 = [v14 superview];
            BOOL v16 = v15 == self->super._tabBar;

            if (v16)
            {
              long long v17 = self->_itemsScrollView;
              double v18 = -[UITabBarItem _tabBarButton](v13);
              [(UIView *)v17 addSubview:v18];
            }
          }
          uint64_t v10 = [(UIScrollView *)v9 countByEnumeratingWithState:&v83 objects:v88 count:16];
        }
        while (v10);
      }
LABEL_25:
    }
  }
  else if (itemsScrollView)
  {
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v19 = v3;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v79 objects:v87 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v80;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v80 != v21) {
            objc_enumerationMutation(v19);
          }
          double v23 = *(id **)(*((void *)&v79 + 1) + 8 * j);
          double v24 = -[UITabBarItem _tabBarButton](v23);
          double v25 = [v24 superview];
          BOOL v26 = v25 == self->_itemsScrollView;

          if (v26)
          {
            tabBar = self->super._tabBar;
            double v28 = -[UITabBarItem _tabBarButton](v23);
            [(UIView *)tabBar addSubview:v28];
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v79 objects:v87 count:16];
      }
      while (v20);
    }

    [(UIScrollView *)self->_itemsScrollView removeFromSuperview];
    uint64_t v9 = self->_itemsScrollView;
    self->_itemsScrollView = 0;
    goto LABEL_25;
  }
  [(_UITabBarVisualProviderLegacyTVOS *)self _layoutRegion];
  double v30 = v29;
  double v32 = v31;
  uint64_t v34 = v33;
  BOOL v35 = [(UITabBar *)self->super._tabBar selectionIndicatorImage];
  v61 = v35;
  double v36 = 0.0;
  if (v35 && ([v35 _isResizable] & 1) == 0)
  {
    [v61 size];
    double v36 = v37;
  }
  long long v38 = [(UIView *)self->super._tabBar traitCollection];
  UITabBarItemPositioning v39 = [(UITabBar *)self->super._tabBar itemPositioning];
  [(UITabBar *)self->super._tabBar itemWidth];
  double v41 = v40;
  [(UITabBar *)self->super._tabBar itemSpacing];
  double v43 = v42;
  uint64_t v44 = [v3 count];
  BOOL v45 = [v38 userInterfaceIdiom] == 3;
  uint64_t v46 = [v38 horizontalSizeClass];
  BOOL v47 = 0;
  int v48 = !v45;
  if (v46 != 2) {
    int v48 = 0;
  }
  if (v39 == UITabBarItemPositioningAutomatic && v48 && v36 > 0.0)
  {
    double v49 = v36 * (double)v44;
    BOOL v47 = v49 <= v32 && v49 > v32 - (double)(10 * v44);
  }
  if (v39 == UITabBarItemPositioningFill
    || v47
    || ((v48 ^ 1) & 1) != 0
    || v32 <= (double)(110 * v44 - 30)
    || [v38 userInterfaceIdiom] != 1)
  {
    if (v39 != UITabBarItemPositioningCentered)
    {
      BOOL v52 = 0;
      goto LABEL_51;
    }
    double v50 = 80.0;
    if (v41 > 0.0) {
      double v50 = v41;
    }
    double v51 = 30.0;
    if (v43 > 0.0) {
      double v51 = v43;
    }
    if (v50 * (double)v44 + v51 * (double)(v44 - 1) >= v32)
    {
      BOOL v52 = self->_itemsScrollView != 0;
      goto LABEL_51;
    }
  }
  BOOL v52 = 1;
LABEL_51:
  BOOL v53 = v41 > 0.0 && v52;
  uint64_t v54 = [v38 userInterfaceIdiom];
  BOOL v56 = v41 <= 0.0 && v54 == 2;
  uint64_t v75 = 0;
  v76 = (double *)&v75;
  uint64_t v77 = 0x2020000000;
  uint64_t v78 = 0;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  int v74 = 0;
  if (!self->_accessoryView) {
    double v30 = 0.0;
  }
  [(_UITabBarVisualProviderLegacyTVOS *)self _configureItems:v3];
  if (v47)
  {
    v76[3] = v36;
    double v57 = round((v32 - v36 * (double)v44) / (double)v44);
    double v30 = floor(v57 * 0.5) + v30;
  }
  else if (v52)
  {
    if (v41 <= 0.0) {
      double v58 = 80.0;
    }
    else {
      double v58 = v41;
    }
    v76[3] = v58;
    double v57 = 30.0;
    if (v43 > 0.0) {
      double v57 = v43;
    }
    double v30 = round(v32 * 0.5 - (v58 * (double)v44 + v57 * (double)(v44 - 1)) * 0.5) + v30;
    BOOL v53 = v41 > 0.0;
  }
  else
  {
    BOOL v53 = 0;
    v76[3] = v32 / (double)v44;
    double v57 = 0.0;
  }
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x2020000000;
  float v59 = v30;
  float v72 = v59;
  unint64_t v60 = ((unint64_t)*((unsigned int *)&self->super._tabBar->super._viewFlags + 4) >> 18) & 2;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __55___UITabBarVisualProviderLegacyTVOS__layoutTabBarItems__block_invoke;
  v63[3] = &unk_1E530CAC0;
  BOOL v68 = v56;
  long long v64 = xmmword_186B8C800;
  v63[4] = &v75;
  v63[5] = v71;
  uint64_t v65 = v34;
  double v66 = v57;
  double v67 = v30;
  v63[6] = v73;
  BOOL v69 = v45;
  BOOL v70 = v53;
  [v3 enumerateObjectsWithOptions:v60 usingBlock:v63];
  _Block_object_dispose(v71, 8);
  _Block_object_dispose(v73, 8);
  _Block_object_dispose(&v75, 8);

LABEL_73:
}

- (void)_updateBackground
{
  v37[1] = *MEMORY[0x1E4F143B8];
  [(UITabBar *)self->super._tabBar _setBackgroundNeedsUpdate:0];
  if (![(UIView *)self->super._tabBar _canDrawContent])
  {
    [(UIView *)self->super._tabBar insertSubview:self->_backgroundView atIndex:0];
    [(_UIBarBackground *)self->_backgroundView setCustomBackgroundView:self->_customBackgroundView];
    [(_UIBarBackgroundLayout *)self->_backgroundViewLayout setDisableTinting:[(UITabBar *)self->super._tabBar _disableBlurTinting]];
    [(UIView *)self->super._tabBar bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    CGFloat v12 = [(UITabBar *)self->super._tabBar delegate];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      double v11 = v11 + _UIBackgroundExtensionForBar(self->super._tabBar);
    }
    if (self->_customBackgroundView)
    {
      [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout configureWithoutShadow];
LABEL_13:
      -[UIView setFrame:](self->_backgroundView, "setFrame:", v5, v7, v9, v11);
      [(_UITabBarVisualProviderLegacyTVOS *)self updateBackgroundGroupName];
      [(_UIBarBackground *)self->_backgroundView transitionBackgroundViews];
      return;
    }
    long long v14 = [(UIView *)self->super._tabBar traitCollection];
    -[_UIBarBackgroundLayout setInterfaceIdiom:](self->_backgroundViewLayout, "setInterfaceIdiom:", [v14 userInterfaceIdiom]);

    long long v15 = [(UIView *)self->super._tabBar traitCollection];
    -[_UIBarBackgroundLayout setInterfaceStyle:](self->_backgroundViewLayout, "setInterfaceStyle:", [v15 userInterfaceStyle]);

    BOOL v16 = [(UITabBar *)self->super._tabBar isTranslucent];
    long long v17 = [(UITabBar *)self->super._tabBar _effectiveBarTintColor];
    double v18 = [(UITabBar *)self->super._tabBar backgroundImage];
    UIBarStyle v19 = [(UITabBar *)self->super._tabBar barStyle];
    uint64_t v20 = [(UITabBar *)self->super._tabBar backgroundEffects];
    if (v20)
    {
      [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout configureWithEffects:v20];
    }
    else if (v18)
    {
      [v18 size];
      double v22 = v21;
      if (([v18 _isResizable] & 1) == 0)
      {
        uint64_t v23 = [v18 stretchableImageWithLeftCapWidth:0 topCapHeight:(uint64_t)(v22 + -1.0)];

        double v18 = (void *)v23;
      }
      char v36 = 0;
      char v24 = [v18 _isInvisibleAndGetIsTranslucent:&v36];
      if (v16)
      {
        [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout configureImage:v18 forceTranslucent:v36 == 0];
      }
      else
      {
        backgroundViewLayout = self->_backgroundViewLayout;
        BOOL v28 = v36 != 0;
        if (v17) {
          [(_UIBarBackgroundLayoutLegacy *)backgroundViewLayout configureImage:v18 forceOpaque:v28 backgroundTintColor:v17];
        }
        else {
          [(_UIBarBackgroundLayoutLegacy *)backgroundViewLayout configureImage:v18 forceOpaque:v28 barStyle:v19];
        }
      }
      if (v22 <= v11) {
        char v33 = 1;
      }
      else {
        char v33 = v24;
      }
      if (v33)
      {
        uint64_t v34 = [(UITabBar *)self->super._tabBar shadowImage];
        if (v34)
        {
          BOOL v35 = (void *)v34;
          [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout configureShadowImage:v34];

          goto LABEL_12;
        }
      }
      else
      {
        double v7 = v11 - v22;
        double v11 = v22;
      }
    }
    else
    {
      double v25 = [(UIView *)self->super._tabBar _screen];
      uint64_t v26 = [v25 _userInterfaceIdiom];

      if (v26 == 3)
      {
        [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout configureAsTransparent];
      }
      else
      {
        if (v19) {
          uint64_t v29 = 4009;
        }
        else {
          uint64_t v29 = 5004;
        }
        double v30 = +[UIBlurEffect _effectWithStyle:v29 tintColor:v17 invertAutomaticStyle:0];
        double v31 = self->_backgroundViewLayout;
        v37[0] = v30;
        double v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
        [(_UIBarBackgroundLayoutLegacy *)v31 configureWithEffects:v32];
      }
      double v18 = 0;
    }
    [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout configureShadowForBarStyle:v19];
LABEL_12:

    goto LABEL_13;
  }
  backgroundView = self->_backgroundView;
  [(UIView *)backgroundView removeFromSuperview];
}

- (void)updateBackgroundGroupName
{
  id v5 = [(UIView *)self->super._tabBar traitCollection];
  double v3 = self;
  double v4 = [v5 objectForTrait:v3];
  [(_UIBarBackground *)self->_backgroundView setGroupName:v4];
}

- (void)layoutSubviews
{
  [(_UITabBarVisualProviderLegacyTVOS *)self _layoutTabBarItems];
  [(_UITabBarVisualProviderLegacyTVOS *)self _updateAccessoryView];
  [(_UITabBarVisualProviderLegacyTVOS *)self _updateBackground];
}

- (void)traitCollectionDidChange:(id)a3
{
  tabBar = self->super._tabBar;
  id v4 = a3;
  id v5 = [(UIView *)tabBar traitCollection];
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(UITabBar *)self->super._tabBar items];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = -[UITabBarItem _tabBarButton](*(id **)(*((void *)&v17 + 1) + 8 * v9));
        [v10 setSemanticContentAttribute:a3];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  double v11 = [(UITabBar *)self->super._tabBar delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CGFloat v12 = [v11 _existingMoreNavigationController];
    CGFloat v13 = [v12 view];
    [v13 setSemanticContentAttribute:a3];

    long long v14 = [v12 topViewController];
    long long v15 = [v14 view];
    [v15 setSemanticContentAttribute:a3];

    BOOL v16 = [v12 navigationBar];
    [v16 setSemanticContentAttribute:a3];
  }
}

- (id)preferredFocusedView
{
  uint64_t v3 = [(UITabBar *)self->super._tabBar selectedItem];
  id v4 = (void *)v3;
  if (v3)
  {
    id v5 = *(id *)(v3 + 232);
  }
  else
  {
    uint64_t v6 = [(UITabBar *)self->super._tabBar items];
    uint64_t v7 = [v6 firstObject];
    -[UITabBarItem _tabBarButton](v7);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_updateHighlightMotionEffect
{
  uint64_t v3 = [(UIView *)self->super._tabBar _focusSystem];
  id v9 = [v3 _focusedView];

  double v4 = 0.0;
  if (-[_UITabBarVisualProviderLegacyTVOS _focusedItemHighlightViewIsVisible](self, "_focusedItemHighlightViewIsVisible")&& [v9 isDescendantOfView:self->super._tabBar])
  {
    [v9 bounds];
    double v4 = CGRectGetWidth(v11) * 0.25;
  }
  focusedItemHighlightMotionEffect = self->_focusedItemHighlightMotionEffect;
  uint64_t v6 = [NSNumber numberWithDouble:-v4];
  [(UIMotionEffect *)focusedItemHighlightMotionEffect setMinimumRelativeValue:v6];

  uint64_t v7 = self->_focusedItemHighlightMotionEffect;
  uint64_t v8 = [NSNumber numberWithDouble:v4];
  [(UIMotionEffect *)v7 setMaximumRelativeValue:v8];
}

- (void)_updateFocusedItemHighlightFrame
{
  if (self->_focusedItemHighlightView)
  {
    uint64_t v3 = [(UIView *)self->super._tabBar _focusSystem];
    id v5 = [v3 _focusedView];

    if ([v5 isDescendantOfView:self->super._tabBar])
    {
      focusedItemHighlightView = self->_focusedItemHighlightView;
      [v5 center];
      -[UIView setCenter:](focusedItemHighlightView, "setCenter:");
    }
  }
}

- (void)_setFocusedItemHightlightVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    if (!self->_focusedItemHighlightView)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __70___UITabBarVisualProviderLegacyTVOS__setFocusedItemHightlightVisible___block_invoke;
      v7[3] = &unk_1E52D9F70;
      v7[4] = self;
      +[UIView performWithoutAnimation:v7];
    }
    id v5 = [(UIView *)self->super._tabBar window];

    if (v5)
    {
      uint64_t v6 = [(UIView *)self->super._tabBar traitCollection];
      id v5 = (void *)[v6 userInterfaceStyle];
    }
  }
  else
  {
    id v5 = 0;
  }
  [(_UITabBarVisualProviderLegacyTVOS *)self _updateFocusedItemHighlightViewWithInterfaceStyle:v5 visible:v3];
  [(_UITabBarVisualProviderLegacyTVOS *)self _updateHighlightMotionEffect];
}

- (void)_updateFocusedItemHighlightViewWithInterfaceStyle:(int64_t)a3 visible:(BOOL)a4
{
  double v4 = dbl_186B9DA30[a3 == 2];
  if (!a4) {
    double v4 = 0.0;
  }
  [(UIView *)self->_focusedItemHighlightView setAlpha:v4];
}

- (BOOL)_focusedItemHighlightViewIsVisible
{
  [(UIView *)self->_focusedItemHighlightView alpha];
  return v2 > 0.0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5 = [(UIView *)self->super._tabBar _focusSystem];
  uint64_t v6 = [v5 _focusedView];

  if ([v6 isDescendantOfView:self->super._tabBar])
  {
    if ([(UITabBar *)self->super._tabBar _vibrantLabels]) {
      [(_UITabBarVisualProviderLegacyTVOS *)self _layoutTabBarItems];
    }
    if ([(UITabBar *)self->super._tabBar _focusedItemHighlightShouldBeVisible]
      && ![(_UITabBarVisualProviderLegacyTVOS *)self _focusedItemHighlightViewIsVisible])
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __86___UITabBarVisualProviderLegacyTVOS_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
      v11[3] = &unk_1E52D9F70;
      v11[4] = self;
      +[UIView animateWithDuration:v11 animations:0.2];
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __86___UITabBarVisualProviderLegacyTVOS_didUpdateFocusInContext_withAnimationCoordinator___block_invoke_2;
    v10[3] = &unk_1E52D9F70;
    v10[4] = self;
    double v7 = 0.15;
    uint64_t v8 = v10;
    goto LABEL_10;
  }
  if (self->_focusedItemHighlightView)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __86___UITabBarVisualProviderLegacyTVOS_didUpdateFocusInContext_withAnimationCoordinator___block_invoke_3;
    v9[3] = &unk_1E52D9F70;
    v9[4] = self;
    double v7 = 0.2;
    uint64_t v8 = v9;
LABEL_10:
    +[UIView animateWithDuration:v8 animations:v7];
  }
}

- (void)_shim_setCustomBackgroundView:(id)a3
{
  id v5 = (UIView *)a3;
  if (self->_customBackgroundView != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_customBackgroundView, a3);
    [(_UITabBarVisualProviderLegacyTVOS *)self _updateBackground];
    id v5 = v6;
  }
}

- (id)_shim_compatibilityBackgroundView
{
  customBackgroundView = (_UIBarBackground *)self->_customBackgroundView;
  if (!customBackgroundView) {
    customBackgroundView = self->_backgroundView;
  }
  return customBackgroundView;
}

- (void)_shim_setAccessoryView:(id)a3
{
  double v4 = (UIView *)a3;
  [(UIView *)self->_accessoryView removeFromSuperview];
  accessoryView = self->_accessoryView;
  self->_accessoryView = v4;
  uint64_t v6 = v4;

  [(UIView *)self->super._tabBar addSubview:self->_accessoryView];
  [(UIView *)self->super._tabBar setNeedsLayout];
}

- (id)_shim_accessoryView
{
  return self->_accessoryView;
}

- (double)_shim_shadowAlpha
{
  [(_UIBarBackgroundLayout *)self->_backgroundViewLayout shadowAlpha];
  return result;
}

- (void)_shim_setShadowAlpha:(double)a3
{
  [(_UIBarBackgroundLayout *)self->_backgroundViewLayout shadowAlpha];
  if (v5 != a3)
  {
    [(_UIBarBackgroundLayout *)self->_backgroundViewLayout setShadowAlpha:a3];
    backgroundView = self->_backgroundView;
    [(_UIBarBackground *)backgroundView transitionBackgroundViews];
  }
}

- (BOOL)_shim_shadowHidden
{
  return [(_UIBarBackgroundLayout *)self->_backgroundViewLayout shadowHidden];
}

- (void)_shim_setShadowHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIBarBackgroundLayout *)self->_backgroundViewLayout shadowHidden] != a3)
  {
    [(_UIBarBackgroundLayout *)self->_backgroundViewLayout setShadowHidden:v3];
    backgroundView = self->_backgroundView;
    [(_UIBarBackground *)backgroundView transitionBackgroundViews];
  }
}

- (void)_shim_updateFocusHighlightVisibility
{
  BOOL v3 = [(UITabBar *)self->super._tabBar _focusedItemHighlightShouldBeVisible];
  BOOL v4 = v3;
  if (!self->_focusedItemHighlightView)
  {
    if (!v3) {
      return;
    }
    goto LABEL_8;
  }
  BOOL v5 = [(_UITabBarVisualProviderLegacyTVOS *)self _focusedItemHighlightViewIsVisible];
  BOOL v6 = v5;
  if (!v4 && v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __73___UITabBarVisualProviderLegacyTVOS__shim_updateFocusHighlightVisibility__block_invoke;
    v12[3] = &unk_1E52D9FC0;
    v12[4] = self;
    BOOL v13 = v4;
    +[UIView animateWithDuration:v12 animations:0.2];
  }
  if (v4 && !v6)
  {
LABEL_8:
    double v7 = [(UIView *)self->super._tabBar _focusSystem];
    uint64_t v8 = [v7 _focusedView];
    int v9 = [v8 isDescendantOfView:self->super._tabBar];

    if (v9)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __73___UITabBarVisualProviderLegacyTVOS__shim_updateFocusHighlightVisibility__block_invoke_2;
      v10[3] = &unk_1E52D9FC0;
      v10[4] = self;
      BOOL v11 = v4;
      +[UIView animateWithDuration:v10 animations:0.2];
    }
  }
}

- (void)_shim_updateTabBarItemView:(id)a3
{
  BOOL v4 = (id *)a3;
  BOOL v5 = -[UITabBarItem _tabBarButton](v4);
  int v6 = [v5 isFocused];

  if (v6) {
    [(UIView *)self->super._tabBar setNeedsFocusUpdate];
  }
  double v7 = -[UITabBarItem _tabBarButton](v4);
  [v7 removeFromSuperview];

  uint64_t v8 = [(_UITabBarVisualProviderLegacyTVOS *)self createViewForTabBarItem:v4];
  -[UITabBarItem _setTabBarButton:]((uint64_t)v4, v8);

  id v10 = [(_UITabBarVisualProviderLegacyTVOS *)self _parentViewForItems];
  int v9 = -[UITabBarItem _tabBarButton](v4);

  [v10 addSubview:v9];
}

- (id)_focusedItemHighlightView
{
  return self->_focusedItemHighlightView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedItemHighlightMotionEffect, 0);
  objc_storeStrong((id *)&self->_focusedItemHighlightView, 0);
  objc_storeStrong((id *)&self->_itemsScrollView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_customBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundViewLayout, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end