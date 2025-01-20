@interface _UITabBarVisualProviderLegacyIOS
- (BOOL)_shim_shadowHidden;
- (BOOL)useModernAppearance;
- (CGRect)_layoutRegion;
- (CGRect)_shadowFrameForBounds:(CGRect)a3 height:(double)a4;
- (CGSize)intrinsicContentSizeGivenSize:(CGSize)a3;
- (double)_shim_heightForCustomizingItems;
- (double)_shim_shadowAlpha;
- (double)backgroundTransitionProgress;
- (double)minimumWidthForHorizontalLayout;
- (id)_focusedItemHighlightView;
- (id)_preferredFocusedViewCarplay;
- (id)_preferredFocusedViewiOS;
- (id)_shim_accessoryView;
- (id)_shim_compatibilityBackgroundView;
- (id)createViewForTabBarItem:(id)a3;
- (id)exchangeItem:(id)a3 withItem:(id)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)preferredFocusedView;
- (id)traitCollectionForChild:(id)a3 baseTraitCollection:(id)a4;
- (int64_t)_styleForTraitCollection:(id)a3;
- (void)_applyAppearanceCustomizationsToItem:(id)a3;
- (void)_configureItems:(id)a3;
- (void)_layoutTabBarItems;
- (void)_shim_setAccessoryView:(id)a3;
- (void)_shim_setCustomBackgroundView:(id)a3;
- (void)_shim_setShadowAlpha:(double)a3;
- (void)_shim_setShadowHidden:(BOOL)a3;
- (void)_shim_updateTabBarItemView:(id)a3;
- (void)_updateAccessoryView;
- (void)_updateAppearanceForTransitionFromItem:(id)a3 toItem:(id)a4;
- (void)_updateBackgroundAnimated:(BOOL)a3;
- (void)_updateBackgroundLegacy;
- (void)_updateBackgroundModern;
- (void)changeAppearance;
- (void)changeItemsTo:(id)a3 removingItems:(id)a4 selectedItem:(id)a5 oldSelectedItem:(id)a6 animate:(BOOL)a7;
- (void)changeLayout;
- (void)changeSelectedItem:(id)a3 fromItem:(id)a4;
- (void)layoutSubviews;
- (void)prepare;
- (void)setBackgroundTransitionProgress:(double)a3;
- (void)setBackgroundTransitionProgress:(double)a3 forceUpdate:(BOOL)a4 animated:(BOOL)a5;
- (void)setMinimumWidthForHorizontalLayout:(double)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setUseModernAppearance:(BOOL)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)teardown;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateArchivedSubviews:(id)a3;
- (void)updateBackgroundGroupName;
@end

@implementation _UITabBarVisualProviderLegacyIOS

- (CGSize)intrinsicContentSizeGivenSize:(CGSize)a3
{
  int64_t v4 = [(UITabBar *)self->super._tabBar _barMetrics];
  if (v4)
  {
    if (v4 == 1)
    {
      uint64_t v5 = 0x4046000000000000;
    }
    else
    {
      if (v4 != 2)
      {
        double v6 = -1.0;
        goto LABEL_16;
      }
      uint64_t v5 = 0x404C000000000000;
    }
    double v6 = *(double *)&v5;
  }
  else
  {
    if _UIUseMiniHeightInLandscape((unint64_t)([(UITabBar *)self->super._tabBar _expectedInterfaceOrientation]- 3) < 2)&& (dyld_program_sdk_at_least())
    {
      double v6 = 32.0;
    }
    else
    {
      double v6 = 49.0;
    }
    if (_UIBarsUseNewPadHeights()) {
      double v6 = 50.0;
    }
    v7 = [(UIView *)self->super._tabBar traitCollection];
    uint64_t v8 = [v7 userInterfaceIdiom];

    if (v8 != 3) {
      double v6 = v6 + _UIBackgroundExtensionForBar(self->super._tabBar);
    }
  }
LABEL_16:
  double v9 = -1.0;
  double v10 = v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setBackgroundTransitionProgress:(double)a3 forceUpdate:(BOOL)a4 animated:(BOOL)a5
{
  self->_backgroundTransitionProgress = fmax(fmin(a3, 1.0), 0.0);
  [(_UITabBarVisualProviderLegacyIOS *)self _updateBackgroundAnimated:a5];
}

- (void)setBackgroundTransitionProgress:(double)a3
{
}

- (id)traitCollectionForChild:(id)a3 baseTraitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (self->_useModernAppearance)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = [v7 userInterfaceStyle];
    unint64_t v11 = [(UITabBar *)self->super._tabBar barStyle] - 1;
    if (v10 == 2 || v11 >= 2) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = 2;
    }
  }
  v13 = [v8 preferredContentSizeCategory];
  v14 = v13;
  if (v13 && ([v13 isEqualToString:@"UICTContentSizeCategoryL"] & 1) == 0) {
    v15 = @"UICTContentSizeCategoryL";
  }
  else {
    v15 = 0;
  }
  id v16 = v8;
  v17 = v16;
  if (v9 || (v18 = v16, v15))
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __80___UITabBarVisualProviderLegacyIOS_traitCollectionForChild_baseTraitCollection___block_invoke;
    v20[3] = &unk_1E52DF500;
    uint64_t v22 = v9;
    v21 = v15;
    v18 = [v17 traitCollectionByModifyingTraits:v20];
  }
  return v18;
}

- (void)_updateBackgroundLegacy
{
  p_backgroundViewLayout = &self->_backgroundViewLayout;
  int64_t v4 = self->_backgroundViewLayout;
  if (!v4)
  {
    int64_t v4 = objc_alloc_init(_UIBarBackgroundLayoutLegacy);
    objc_storeStrong((id *)p_backgroundViewLayout, v4);
  }
  uint64_t v5 = [(UIView *)self->super._tabBar traitCollection];
  -[_UIBarBackgroundLayout setInterfaceIdiom:](*p_backgroundViewLayout, "setInterfaceIdiom:", [v5 userInterfaceIdiom]);

  id v6 = [(UIView *)self->super._tabBar traitCollection];
  -[_UIBarBackgroundLayout setInterfaceStyle:](*p_backgroundViewLayout, "setInterfaceStyle:", [v6 userInterfaceStyle]);

  BOOL v7 = [(UITabBar *)self->super._tabBar isTranslucent];
  uint64_t v8 = [(UITabBar *)self->super._tabBar _effectiveBarTintColor];
  uint64_t v9 = [(UITabBar *)self->super._tabBar backgroundImage];
  UIBarStyle v10 = [(UITabBar *)self->super._tabBar barStyle];
  unint64_t v11 = [(UITabBar *)self->super._tabBar backgroundEffects];
  if (v11)
  {
    [(_UIBarBackgroundLayoutLegacy *)v4 configureWithEffects:v11];
  }
  else if (v9)
  {
    [v9 size];
    double v13 = v12;
    if (([v9 _isResizable] & 1) == 0)
    {
      uint64_t v14 = [v9 stretchableImageWithLeftCapWidth:0 topCapHeight:(uint64_t)(v13 + -1.0)];

      uint64_t v9 = (void *)v14;
    }
    char v20 = 0;
    [v9 _isInvisibleAndGetIsTranslucent:&v20];
    if (v7)
    {
      [(_UIBarBackgroundLayoutLegacy *)v4 configureImage:v9 forceTranslucent:v20 == 0];
    }
    else
    {
      BOOL v17 = v20 != 0;
      if (v8) {
        [(_UIBarBackgroundLayoutLegacy *)v4 configureImage:v9 forceOpaque:v17 backgroundTintColor:v8];
      }
      else {
        [(_UIBarBackgroundLayoutLegacy *)v4 configureImage:v9 forceOpaque:v17 barStyle:v10];
      }
    }
    uint64_t v18 = [(UITabBar *)self->super._tabBar shadowImage];
    if (v18)
    {
      v19 = (void *)v18;
      [(_UIBarBackgroundLayoutLegacy *)v4 configureShadowImage:v18];

      goto LABEL_6;
    }
  }
  else
  {
    v15 = [(UIView *)self->super._tabBar _screen];
    uint64_t v16 = [v15 _userInterfaceIdiom];

    if (v16 == 3) {
      [(_UIBarBackgroundLayoutLegacy *)v4 configureAsTransparent];
    }
    else {
      [(_UIBarBackgroundLayoutLegacy *)v4 configureEffectForStyle:v10 backgroundTintColor:v8 forceOpaque:!v7];
    }
    uint64_t v9 = 0;
  }
  [(_UIBarBackgroundLayoutLegacy *)v4 configureShadowForBarStyle:v10];
LABEL_6:
}

- (void)_updateBackgroundAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(UITabBar *)self->super._tabBar _setBackgroundNeedsUpdate:0];
  if ([(UIView *)self->super._tabBar _canDrawContent])
  {
    backgroundView = self->_backgroundView;
    [(UIView *)backgroundView removeFromSuperview];
    return;
  }
  [(UIView *)self->super._tabBar bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  uint64_t v14 = [(UITabBar *)self->super._tabBar delegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    double v13 = v13 + _UIBackgroundExtensionForBar(self->super._tabBar);
  }
  if (self->_customBackgroundView)
  {
    backgroundViewLayout = self->_backgroundViewLayout;
    self->_backgroundViewLayout = 0;
LABEL_11:

    goto LABEL_12;
  }
  if (+[_UIBarBackgroundLayoutPrototyping prototypingEnabled])
  {
    BOOL v17 = +[_UIBarBackgroundLayoutPrototyping prototypingLayoutForBarType:3];
    backgroundViewLayout = self->_backgroundViewLayout;
    self->_backgroundViewLayout = v17;
    goto LABEL_11;
  }
  if (self->_useModernAppearance) {
    [(_UITabBarVisualProviderLegacyIOS *)self _updateBackgroundModern];
  }
  else {
    [(_UITabBarVisualProviderLegacyIOS *)self _updateBackgroundLegacy];
  }
LABEL_12:
  [(UIView *)self->super._tabBar insertSubview:self->_backgroundView atIndex:0];
  [(_UIBarBackground *)self->_backgroundView setLayout:self->_backgroundViewLayout];
  [(_UIBarBackground *)self->_backgroundView setCustomBackgroundView:self->_customBackgroundView];
  [(_UIBarBackgroundLayout *)self->_backgroundViewLayout setDisableTinting:[(UITabBar *)self->super._tabBar _disableBlurTinting]];
  -[UIView setFrame:](self->_backgroundView, "setFrame:", v7, v9, v11, v13);
  BOOL useModernAppearance = self->_useModernAppearance;
  [(_UITabBarVisualProviderLegacyIOS *)self backgroundTransitionProgress];
  if (useModernAppearance) {
    -[_UIBarBackgroundLayout setBackgroundTransitionProgress:](self->_backgroundViewLayout, "setBackgroundTransitionProgress:");
  }
  else {
    [(_UIBarBackgroundLayout *)self->_backgroundViewLayout setBackgroundAlpha:1.0 - v19];
  }
  [(_UITabBarVisualProviderLegacyIOS *)self updateBackgroundGroupName];
  char v20 = self->_backgroundView;
  [(_UIBarBackground *)v20 transitionBackgroundViewsAnimated:v3];
}

- (double)backgroundTransitionProgress
{
  return self->_backgroundTransitionProgress;
}

- (void)updateBackgroundGroupName
{
  id v5 = [(UIView *)self->super._tabBar traitCollection];
  BOOL v3 = self;
  int64_t v4 = [v5 objectForTrait:v3];
  [(_UIBarBackground *)self->_backgroundView setGroupName:v4];
}

- (void)_updateBackgroundModern
{
  p_backgroundViewLayout = &self->_backgroundViewLayout;
  uint64_t v16 = self->_backgroundViewLayout;
  if (!v16)
  {
    uint64_t v16 = objc_alloc_init(_UIBarBackgroundLayoutModern);
    objc_storeStrong((id *)p_backgroundViewLayout, v16);
  }
  int64_t v4 = [(UIView *)self->super._tabBar traitCollection];
  -[_UIBarBackgroundLayout setInterfaceIdiom:](v16, "setInterfaceIdiom:", [v4 userInterfaceIdiom]);

  id v5 = [(UIView *)self->super._tabBar traitCollection];
  -[_UIBarBackgroundLayout setInterfaceStyle:](v16, "setInterfaceStyle:", [v5 userInterfaceStyle]);

  LODWORD(v5) = _UIBarsApplyChromelessEverywhere();
  double v6 = [(UITabBar *)self->super._tabBar selectedItem];
  double v7 = [v6 standardAppearance];
  double v8 = v7;
  if (!v5)
  {
    if (v7)
    {
      id v10 = v7;
    }
    else
    {
      id v10 = [(UITabBar *)self->super._tabBar standardAppearance];
    }
    double v9 = v10;

    v15 = [v9 _backgroundData];
    [(_UIBarBackgroundLayoutModern *)v16 setBackgroundData1:v15];
    goto LABEL_16;
  }
  if (v7)
  {
    double v9 = [v7 _backgroundData];
  }
  else
  {
    double v11 = [(UITabBar *)self->super._tabBar standardAppearance];
    double v9 = [v11 _backgroundData];
  }
  double v12 = [(UITabBar *)self->super._tabBar selectedItem];
  uint64_t v13 = [v12 scrollEdgeAppearance];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
  }
  else
  {
    uint64_t v14 = [(UITabBar *)self->super._tabBar scrollEdgeAppearance];

    if (!v14)
    {
      v15 = +[_UIBarBackgroundAppearanceData transparentBackgroundData];
      goto LABEL_15;
    }
  }
  v15 = [v14 _backgroundData];

LABEL_15:
  [(_UIBarBackgroundLayoutModern *)v16 setBackgroundData1:v9];
  [(_UIBarBackgroundLayoutModern *)v16 setBackgroundData2:v15];
LABEL_16:
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
        id v10 = -[UITabBarItem _tabBarButton](*(id **)(*((void *)&v17 + 1) + 8 * v9));
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
    double v12 = [v11 _existingMoreNavigationController];
    uint64_t v13 = [v12 view];
    [v13 setSemanticContentAttribute:a3];

    uint64_t v14 = [v12 topViewController];
    v15 = [v14 view];
    [v15 setSemanticContentAttribute:a3];

    uint64_t v16 = [v12 navigationBar];
    [v16 setSemanticContentAttribute:a3];
  }
}

- (void)_updateAppearanceForTransitionFromItem:(id)a3 toItem:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_useModernAppearance)
  {
    uint64_t v8 = [(UITabBar *)self->super._tabBar standardAppearance];
    uint64_t v9 = [v6 standardAppearance];
    id v10 = (void *)v9;
    if (v9) {
      double v11 = (void *)v9;
    }
    else {
      double v11 = (void *)v8;
    }
    id v12 = v11;

    uint64_t v13 = [v7 standardAppearance];
    uint64_t v14 = (void *)v13;
    v51 = (void *)v8;
    if (v13) {
      v15 = (void *)v13;
    }
    else {
      v15 = (void *)v8;
    }
    id v16 = v15;

    long long v17 = [v12 _backgroundData];
    long long v18 = [v16 _backgroundData];
    id v19 = v17;
    id v20 = v18;
    id v49 = v7;
    id v50 = v6;
    if (v19 == v20)
    {

      goto LABEL_25;
    }
    v21 = v20;
    if (v19 && v20)
    {
      char v22 = [v19 isEqual:v20];

      if (v22) {
        goto LABEL_25;
      }
    }
    else
    {
    }
    if (![(UITabBar *)self->super._tabBar _suspendBackgroundUpdates]) {
      [(_UITabBarVisualProviderLegacyIOS *)self _updateBackgroundAnimated:0];
    }
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v23 = [(UITabBar *)self->super._tabBar items];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v57 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = -[UITabBarItem _tabBarButton](*(id **)(*((void *)&v56 + 1) + 8 * i));
          v29 = [v16 _backgroundData];
          v30 = [v29 tabBarVibrancyEffect];
          [v28 setItemVibrantEffect:v30];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v56 objects:v61 count:16];
      }
      while (v25);
    }

    id v7 = v49;
    id v6 = v50;
LABEL_25:
    v31 = [v12 _tabLayoutAppearanceData];
    v32 = [v16 _tabLayoutAppearanceData];
    id v33 = v31;
    id v34 = v32;
    if (v33 == v34)
    {

      goto LABEL_33;
    }
    v35 = v34;
    if (v33 && v34)
    {
      char v36 = [v33 isEqual:v34];

      if (v36)
      {
LABEL_33:
        v37 = [v12 _dataForItemStyle:self->_style];
        v38 = [v16 _dataForItemStyle:self->_style];
        id v39 = v37;
        id v40 = v38;
        v41 = v40;
        if (v39 != v40)
        {
          if (v39 && v40)
          {
            char v42 = [v39 isEqual:v40];

            if (v42) {
              goto LABEL_48;
            }
          }
          else
          {
          }
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          v43 = [(UITabBar *)self->super._tabBar items];
          uint64_t v44 = [v43 countByEnumeratingWithState:&v52 objects:v60 count:16];
          if (v44)
          {
            uint64_t v45 = v44;
            uint64_t v46 = *(void *)v53;
            do
            {
              for (uint64_t j = 0; j != v45; ++j)
              {
                if (*(void *)v53 != v46) {
                  objc_enumerationMutation(v43);
                }
                v48 = -[UITabBarItem _tabBarButton](*(id **)(*((void *)&v52 + 1) + 8 * j));
                [v48 setItemAppearanceData:v41];
              }
              uint64_t v45 = [v43 countByEnumeratingWithState:&v52 objects:v60 count:16];
            }
            while (v45);
          }

          [(UIView *)self->super._tabBar setNeedsLayout];
          id v7 = v49;
          id v6 = v50;
          goto LABEL_48;
        }

LABEL_48:
        goto LABEL_49;
      }
    }
    else
    {
    }
    [(UIView *)self->super._tabBar setNeedsLayout];
    goto LABEL_33;
  }
LABEL_49:
}

- (void)layoutSubviews
{
  BOOL v3 = [(UIView *)self->super._tabBar traitCollection];
  self->_style = [(_UITabBarVisualProviderLegacyIOS *)self _styleForTraitCollection:v3];

  [(_UITabBarVisualProviderLegacyIOS *)self _layoutTabBarItems];
  [(_UITabBarVisualProviderLegacyIOS *)self _updateAccessoryView];
  if (![(UITabBar *)self->super._tabBar _suspendBackgroundUpdates])
  {
    [(_UITabBarVisualProviderLegacyIOS *)self _updateBackgroundAnimated:0];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  tabBar = self->super._tabBar;
  id v5 = a3;
  id v10 = [(UIView *)tabBar traitCollection];
  id v6 = [(UIView *)self->super._tabBar traitCollection];
  int64_t v7 = [(_UITabBarVisualProviderLegacyIOS *)self _styleForTraitCollection:v6];

  if (self->_style != v7) {
    [(UIView *)self->super._tabBar setNeedsLayout];
  }
  uint64_t v8 = [v10 legibilityWeight];
  uint64_t v9 = [v5 legibilityWeight];

  if (v8 != v9) {
    [(UIView *)self->super._tabBar setNeedsLayout];
  }
}

- (void)_updateAccessoryView
{
  accessoryView = self->_accessoryView;
  if (accessoryView)
  {
    [(UIView *)accessoryView frame];
    double v5 = v4;
    [(_UITabBarVisualProviderLegacyIOS *)self _layoutRegion];
    CGFloat v10 = v6;
    CGFloat v11 = v7;
    CGFloat v12 = v8;
    CGFloat v13 = v9;
    double MaxX = 0.0;
    if ((*((_DWORD *)&self->super._tabBar->super._viewFlags + 4) & 0x80000) == 0) {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v6);
    }
    v19.origin.x = v10;
    v19.origin.y = v11;
    v19.size.width = v12;
    v19.size.height = v13;
    double MinY = CGRectGetMinY(v19);
    v20.origin.x = v10;
    v20.origin.y = v11;
    v20.size.width = v12;
    v20.size.height = v13;
    double Height = CGRectGetHeight(v20);
    long long v17 = self->_accessoryView;
    -[UIView setFrame:](v17, "setFrame:", MaxX, MinY, v5, Height);
  }
}

- (void)_layoutTabBarItems
{
  BOOL v3 = [(UITabBar *)self->super._tabBar items];
  if ([v3 count])
  {
    if (!self->_useModernAppearance)
    {
      double v8 = [(UITabBar *)self->super._tabBar selectionIndicatorImage];
      UITabBarItemPositioning v9 = [(UITabBar *)self->super._tabBar itemPositioning];
      [(UITabBar *)self->super._tabBar itemWidth];
      double v11 = v10;
      [(UITabBar *)self->super._tabBar itemSpacing];
      double v13 = v12;
      if (!dyld_program_sdk_at_least() || self->_style == 3)
      {
        uint64_t v57 = 0;
        long long v58 = 0;
        long long v55 = 0;
LABEL_24:
        [(_UITabBarVisualProviderLegacyIOS *)self _layoutRegion];
        double v25 = v24;
        double v27 = v26;
        uint64_t v29 = v28;
        double v30 = 0.0;
        if (v8 && ([v8 _isResizable] & 1) == 0)
        {
          [v8 size];
          double v30 = v31;
        }
        long long v56 = v8;
        v32 = [(UIView *)self->super._tabBar traitCollection];
        long long v59 = v3;
        uint64_t v33 = [v3 count];
        int64_t style = self->_style;
        unint64_t v35 = style - 1;
        BOOL v36 = (unint64_t)(style - 1) < 2;
        BOOL v37 = 0;
        BOOL v38 = [v32 horizontalSizeClass] == 2;
        BOOL v39 = style == 3;
        if (style == 3) {
          BOOL v38 = 0;
        }
        if (v9 == UITabBarItemPositioningAutomatic && v38 && v30 > 0.0)
        {
          double v40 = v30 * (double)v33;
          BOOL v37 = v40 <= v27 && v40 > v27 - (double)(10 * v33);
        }
        if (v9 == UITabBarItemPositioningFill
          || v37
          || !v38
          || v27 <= (double)(110 * v33 - 30)
          || [v32 userInterfaceIdiom] != 1)
        {
          if (v9 == UITabBarItemPositioningCentered)
          {
            double v42 = 80.0;
            if (v11 > 0.0) {
              double v42 = v11;
            }
            double v43 = 30.0;
            if (v13 > 0.0) {
              double v43 = v13;
            }
            BOOL v41 = v42 * (double)v33 + v43 * (double)(v33 - 1) < v27;
          }
          else
          {
            BOOL v41 = 0;
          }
        }
        else
        {
          BOOL v41 = 1;
        }
        BOOL v44 = v11 > 0.0;
        BOOL v45 = v11 > 0.0 && v41;
        uint64_t v77 = 0;
        v78 = (double *)&v77;
        uint64_t v79 = 0x2020000000;
        uint64_t v80 = 0;
        v75[0] = 0;
        v75[1] = v75;
        v75[2] = 0x2020000000;
        int v76 = 0;
        if (!self->_accessoryView) {
          double v25 = 0.0;
        }
        [(_UITabBarVisualProviderLegacyIOS *)self _configureItems:v59];
        if (v35 > 1)
        {
          id v50 = (void *)v57;
          if (v37)
          {
            v78[3] = v30;
            double v46 = round((v27 - v30 * (double)v33) / (double)v33);
            double v25 = floor(v46 * 0.5) + v25;
          }
          else
          {
            if (v41)
            {
              double v51 = 80.0;
              if (v11 > 0.0) {
                double v51 = v11;
              }
              v78[3] = v51;
              if (v13 <= 0.0) {
                double v46 = 30.0;
              }
              else {
                double v46 = v13;
              }
              double v25 = round(v27 * 0.5 - (v51 * (double)v33 + v46 * (double)(v33 - 1)) * 0.5) + v25;
              double v49 = 0.0;
              BOOL v45 = v44;
              goto LABEL_66;
            }
            BOOL v45 = 0;
            v78[3] = v27 / (double)v33;
            double v46 = 0.0;
          }
          double v49 = 0.0;
        }
        else
        {
          double v46 = 0.0;
          [(UITabBar *)self->super._tabBar _totalDimensionForItems:v59 spacing:0.0 dimension:v78[3] scaleFactor:1.0];
          double v48 = v27 - v47;
          double v49 = round((v27 - v47) / (double)(v33 + 1));
          double v25 = v25 + floor((v48 - v49 * (double)v33) * 0.5);
          id v50 = (void *)v57;
        }
LABEL_66:
        v74[0] = 0;
        v74[1] = v74;
        v74[2] = 0x2020000000;
        *(double *)&v74[3] = v25;
        unint64_t v52 = ((unint64_t)*((unsigned int *)&self->super._tabBar->super._viewFlags + 4) >> 18) & 2;
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __54___UITabBarVisualProviderLegacyIOS__layoutTabBarItems__block_invoke;
        v60[3] = &unk_1E52DF4D8;
        BOOL v71 = v36;
        v64 = &v77;
        double v67 = v49;
        id v53 = v50;
        id v61 = v53;
        id v54 = v58;
        uint64_t v68 = v29;
        double v69 = v46;
        double v70 = v25;
        v65 = v74;
        v66 = v75;
        BOOL v72 = v39;
        BOOL v73 = v45;
        id v62 = v54;
        v63 = self;
        BOOL v3 = v59;
        [v59 enumerateObjectsWithOptions:v52 usingBlock:v60];

        _Block_object_dispose(v74, 8);
        _Block_object_dispose(v75, 8);
        _Block_object_dispose(&v77, 8);

        goto LABEL_67;
      }
      uint64_t v7 = [(UITabBar *)self->super._tabBar barTintColor];
      uint64_t v14 = [(UITabBar *)self->super._tabBar unselectedItemTintColor];
      if (v7 | v14)
      {
        CGRect v20 = (void *)v14;
        uint64_t v57 = 0;
        long long v58 = 0;
        long long v55 = 0;
        goto LABEL_23;
      }
      if ([(UITabBar *)self->super._tabBar barStyle] == UIBarStyleBlack) {
        uint64_t v15 = 20;
      }
      else {
        uint64_t v15 = 10;
      }
      v23 = +[UIBlurEffect effectWithStyle:v15];
      +[UIVibrancyEffect effectForBlurEffect:v23 style:4];
      v58 = uint64_t v57 = 0;
      CGRect v20 = 0;
      uint64_t v7 = 0;
      long long v55 = 0;
      goto LABEL_22;
    }
    if (_UIBarsApplyChromelessEverywhere())
    {
      [(_UITabBarVisualProviderLegacyIOS *)self backgroundTransitionProgress];
      if (v4 > 0.5)
      {
        double v5 = [(UITabBar *)self->super._tabBar selectedItem];
        uint64_t v6 = [v5 scrollEdgeAppearance];
        if (v6)
        {
          uint64_t v7 = v6;
LABEL_18:

          goto LABEL_19;
        }
        uint64_t v7 = [(UITabBar *)self->super._tabBar scrollEdgeAppearance];

        if (v7)
        {
LABEL_19:
          CGRect v20 = [(id)v7 _tabLayoutAppearanceData];
          long long v55 = [v20 selectionIndicatorTintColor];
          double v8 = [v20 selectionIndicatorImage];
          UITabBarItemPositioning v9 = [v20 itemPositioning];
          [v20 itemWidth];
          double v11 = v21;
          [v20 itemSpacing];
          double v13 = v22;
          uint64_t v57 = [(id)v7 _dataForItemStyle:self->_style];
          if (self->_style == 3)
          {
            long long v58 = 0;
LABEL_23:

            goto LABEL_24;
          }
          v23 = [(id)v7 _backgroundData];
          long long v58 = [v23 tabBarVibrancyEffect];
LABEL_22:

          goto LABEL_23;
        }
      }
    }
    id v16 = v3;
    double v5 = [(UITabBar *)self->super._tabBar selectedItem];
    long long v17 = [v5 standardAppearance];
    long long v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      id v19 = [(UITabBar *)self->super._tabBar standardAppearance];
    }
    uint64_t v7 = (uint64_t)v19;

    BOOL v3 = v16;
    goto LABEL_18;
  }
LABEL_67:
}

- (int64_t)_styleForTraitCollection:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_4;
  }
  if (!dyld_program_sdk_at_least()) {
    goto LABEL_4;
  }
  [(_UITabBarVisualProviderLegacyIOS *)self _layoutRegion];
  if (CGRectGetWidth(v11) < self->_minimumWidthForHorizontalLayout) {
    goto LABEL_4;
  }
  uint64_t v7 = [v4 userInterfaceIdiom];
  if (v7)
  {
    int64_t v5 = v7;
    if (v7 == 3) {
      goto LABEL_5;
    }
    if (v7 == 1 && [v4 horizontalSizeClass] == 2)
    {
      double v8 = [(UITabBar *)self->super._tabBar items];
      int64_t v5 = (unint64_t)[v8 count] < 9;

      goto LABEL_5;
    }
    goto LABEL_4;
  }
  UITabBarItemPositioning v9 = [(UITabBar *)self->super._tabBar items];
  if ((unint64_t)[v9 count] > 5)
  {

LABEL_4:
    int64_t v5 = 0;
    goto LABEL_5;
  }
  accessoryView = self->_accessoryView;

  if (accessoryView) {
    goto LABEL_4;
  }
  if ([v4 horizontalSizeClass] != 2)
  {
    if ([v4 verticalSizeClass] != 1) {
      goto LABEL_4;
    }
    [(_UITabBarVisualProviderLegacyIOS *)self _layoutRegion];
    if (CGRectGetWidth(v12) < 568.0) {
      goto LABEL_4;
    }
  }
  if (_UIUseMiniHeightInLandscape(1u)) {
    int64_t v5 = 2;
  }
  else {
    int64_t v5 = 1;
  }
LABEL_5:

  return v5;
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
  uint64_t v15 = [(UIView *)tabBar traitCollection];
  uint64_t v16 = [v15 userInterfaceIdiom];

  if (v16 != 3)
  {
    [(UIView *)self->super._tabBar safeAreaInsets];
    double v18 = v17;
    if (v17 != 0.0)
    {
      id v19 = +[UIDevice currentDevice];
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

- (void)changeItemsTo:(id)a3 removingItems:(id)a4 selectedItem:(id)a5 oldSelectedItem:(id)a6 animate:(BOOL)a7
{
  BOOL v41 = a7;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v39 = a4;
  id v12 = a5;
  id v38 = a6;
  int64_t v13 = [(UITabBar *)self->super._tabBar _barMetrics];
  int64_t v14 = [(UITabBar *)self->super._tabBar _imageStyle];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v15 = v11;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v53;
    obuint64_t j = v15;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        id v20 = v12;
        if (*(void *)v53 != v18) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(id *)(*((void *)&v52 + 1) + 8 * i);
        [v21 _setBarMetrics:v13];
        [v21 _setImageStyle:v14];
        double v22 = -[UITabBarItem _tabBarButton]((id *)v21);
        if (v22 && [(UIView *)self->super._tabBar containsView:v22])
        {
          double v23 = v22;
        }
        else
        {
          [v22 removeFromSuperview];
          double v23 = [(_UITabBarVisualProviderLegacyIOS *)self createViewForTabBarItem:v21];

          [(UIView *)self->super._tabBar addSubview:v23];
          -[UITabBarItem _setTabBarButton:]((uint64_t)v21, v23);
          if (v41) {
            [v23 setAlpha:0.0];
          }
        }
        double v24 = -[UITabBarItem _tabBarButton]((id *)v21);
        double v25 = v24;
        BOOL v26 = v21 == v20;
        id v12 = v20;
        uint64_t v27 = v26;
        [v24 _showSelectedIndicator:v27 changeSelection:1];
      }
      id v15 = obj;
      uint64_t v17 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v17);
  }

  if (v41)
  {
    [(_UITabBarVisualProvider *)self defaultAnimationDuration];
    double v29 = v28;
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __101___UITabBarVisualProviderLegacyIOS_changeItemsTo_removingItems_selectedItem_oldSelectedItem_animate___block_invoke;
    v48[3] = &unk_1E52DCB30;
    double v30 = v39;
    id v49 = v39;
    id v50 = self;
    id v51 = v15;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __101___UITabBarVisualProviderLegacyIOS_changeItemsTo_removingItems_selectedItem_oldSelectedItem_animate___block_invoke_2;
    v46[3] = &unk_1E52DC3A0;
    id v47 = v49;
    +[UIView animateWithDuration:v48 animations:v46 completion:v29];
  }
  else
  {
    id v31 = v15;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    double v30 = v39;
    id v32 = v39;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v42 objects:v56 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v43 != v35) {
            objc_enumerationMutation(v32);
          }
          BOOL v37 = -[UITabBarItem _tabBarButton](*(id **)(*((void *)&v42 + 1) + 8 * j));
          [v37 removeFromSuperview];
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v42 objects:v56 count:16];
      }
      while (v34);
    }

    [(UIView *)self->super._tabBar setNeedsLayout];
    id v15 = v31;
  }
  if (v12 != v38) {
    [(_UITabBarVisualProviderLegacyIOS *)self _updateAppearanceForTransitionFromItem:v38 toItem:v12];
  }
}

- (id)createViewForTabBarItem:(id)a3
{
  id v5 = a3;
  if (![v5 _imageStyle])
  {
    id v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2 object:self file:@"_UITabBarVisualProviderLegacyIOS.m" lineNumber:271 description:@"A default style should never be returned at this point"];
  }
  double v6 = [(UITabBar *)self->super._tabBar _appearanceStorage];
  double v7 = [v6 selectedImageTintColor];

  if ([v5 isSystemItem]) {
    [v5 _internalTitle];
  }
  else {
  double v8 = [v5 title];
  }
  double v9 = [UITabBarButton alloc];
  double v10 = [v5 unselectedImage];
  id v11 = [v5 _internalLandscapeTemplateImage];
  id v12 = [v5 selectedImage];
  int64_t v13 = [v5 _internalLandscapeSelectedImagePhone];
  [v5 imageInsets];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [v5 landscapeImagePhoneInsets];
  BOOL v26 = -[UITabBarButton initWithImage:landscapeImage:selectedImage:landscapeSelectedImage:label:withInsets:landscapeInsets:tabBar:](v9, "initWithImage:landscapeImage:selectedImage:landscapeSelectedImage:label:withInsets:landscapeInsets:tabBar:", v10, v11, v12, v13, v8, self->super._tabBar, v15, v17, v19, v21, v22, v23, v24, v25);

  [v5 badgeOffset];
  -[UITabBarButton _setBadgeOffset:](v26, "_setBadgeOffset:");
  [(UITabBarButton *)v26 setLayoutStyle:self->_style];
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
  uint64_t v33 = [v5 _appearanceStorage];
  uint64_t v34 = objc_getAssociatedObject(v5, &_UIAppearanceCustomizedSelectorsAssociationKey);
  [(UITabBarButton *)v26 _applyTabBarButtonAppearanceStorage:v33 withTaggedSelectors:v34];

  uint64_t v35 = [(UITabBar *)self->super._tabBar _appearanceStorage];
  BOOL v36 = [v35 selectionIndicatorImage];

  if (v36) {
    [(UITabBarButton *)v26 _setCustomSelectedIndicatorImage:v36];
  }
  [(UIControl *)v26 addTarget:self->super._tabBar action:sel__buttonDown_ forControlEvents:1];
  [(UIControl *)v26 addTarget:self->super._tabBar action:sel__buttonUp_ forControlEvents:64];
  [(UIControl *)v26 addTarget:self->super._tabBar action:sel__buttonCancel_ forControlEvents:256];
  [(UIControl *)v26 addTarget:self->super._tabBar action:sel__sendAction_withEvent_ forControlEvents:0x40000000];
  [(UIControl *)v26 addTarget:self->super._tabBar action:sel__sendAction_withEvent_ forControlEvents:0x2000];
  -[UITabBarButton setEnabled:](v26, "setEnabled:", [v5 isEnabled]);
  [(UITabBarButton *)v26 _setShowsHighlightedState:[(UITabBar *)self->super._tabBar _showsHighlightedState]];
  BOOL v37 = [v5 badgeValue];
  if (v37) {
    [(UITabBarButton *)v26 _setBadgeValue:v37];
  }
  [(UITabBarButton *)v26 setSemanticContentAttribute:[(UIView *)self->super._tabBar semanticContentAttribute]];

  return v26;
}

- (void)_configureItems:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(UITabBar *)self->super._tabBar _barMetrics];
  int64_t v6 = [(UITabBar *)self->super._tabBar _imageStyle];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "_barMetrics", (void)v16) != v5 || objc_msgSend(v12, "_imageStyle") != v6)
        {
          [v12 _setBarMetrics:v5];
          [v12 _setImageStyle:v6];
          [v12 _updateViewAndPositionItems:0];
        }
        int64_t v13 = -[UITabBarItem _tabBarButton]((id *)v12);
        objc_msgSend(v13, "setSemanticContentAttribute:", -[UIView semanticContentAttribute](self->super._tabBar, "semanticContentAttribute"));
        [v13 setLayoutStyle:self->_style];
        int64_t style = self->_style;
        if (style) {
          BOOL v15 = style == 3;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15) {
          [v13 layoutIfNeeded];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)setUseModernAppearance:(BOOL)a3
{
  if (!self->_useModernAppearance || a3)
  {
    if (!self->_useModernAppearance && a3)
    {
      self->_BOOL useModernAppearance = 1;
      backgroundViewLayout = self->_backgroundViewLayout;
      self->_backgroundViewLayout = 0;

      [(_UITabBarVisualProviderLegacyIOS *)self changeAppearance];
    }
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"_UITabBarVisualProviderLegacyIOS.m" lineNumber:241 description:@"Downgrading modern appearance flag from YES to NO not supported"];
  }
}

- (void)changeAppearance
{
}

- (void)prepare
{
  v19.receiver = self;
  v19.super_class = (Class)_UITabBarVisualProviderLegacyIOS;
  [(_UITabBarVisualProvider *)&v19 prepare];
  [(UIView *)self->super._tabBar bounds];
  id v7 = -[_UIBarBackground initWithFrame:]([_UIBarBackground alloc], "initWithFrame:", v3, v4, v5, v6);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v7;

  [(_UIBarBackground *)self->_backgroundView setTopAligned:0];
  uint64_t v9 = [[UIPointerInteraction alloc] initWithDelegate:self];
  pointerInteraction = self->_pointerInteraction;
  self->_pointerInteraction = v9;

  [(UIView *)self->super._tabBar addInteraction:self->_pointerInteraction];
  objc_initWeak(&location, self);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  BOOL v15 = __43___UITabBarVisualProviderLegacyIOS_prepare__block_invoke;
  long long v16 = &unk_1E52DE810;
  objc_copyWeak(&v17, &location);
  +[_UIBarBackgroundLayoutPrototyping registerPrototypingCallback:&v13];
  id v11 = +[_UIBarSettingsDomain rootSettings];
  id v12 = [v11 tabBarSettings];
  [v12 addKeyObserver:self];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)changeSelectedItem:(id)a3 fromItem:(id)a4
{
  double v6 = (id *)a4;
  uint64_t v9 = (id *)a3;
  id v7 = -[UITabBarItem _tabBarButton](v6);
  [v7 _showSelectedIndicator:0 changeSelection:1];

  uint64_t v8 = -[UITabBarItem _tabBarButton](v9);
  [v8 _showSelectedIndicator:1 changeSelection:1];

  [(_UITabBarVisualProviderLegacyIOS *)self _updateAppearanceForTransitionFromItem:v6 toItem:v9];
}

- (void)_shim_setAccessoryView:(id)a3
{
  double v4 = (UIView *)a3;
  [(UIView *)self->_accessoryView removeFromSuperview];
  accessoryView = self->_accessoryView;
  self->_accessoryView = v4;
  double v6 = v4;

  [(UIView *)self->super._tabBar addSubview:self->_accessoryView];
  [(UIView *)self->super._tabBar setNeedsLayout];
}

- (void)_shim_setCustomBackgroundView:(id)a3
{
  double v5 = (UIView *)a3;
  if (self->_customBackgroundView != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_customBackgroundView, a3);
    [(_UITabBarVisualProviderLegacyIOS *)self _updateBackgroundAnimated:0];
    double v5 = v6;
  }
}

- (void)setMinimumWidthForHorizontalLayout:(double)a3
{
  if (self->_minimumWidthForHorizontalLayout != a3)
  {
    self->_minimumWidthForHorizontalLayout = a3;
    [(UIView *)self->super._tabBar setNeedsLayout];
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

- (void)teardown
{
  [(UIView *)self->_backgroundView removeFromSuperview];
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  [(UIView *)self->_accessoryView removeFromSuperview];
  accessoryView = self->_accessoryView;
  self->_accessoryView = 0;

  double v5 = +[_UIBarSettingsDomain rootSettings];
  double v6 = [v5 tabBarSettings];
  [v6 removeKeyObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)_UITabBarVisualProviderLegacyIOS;
  [(_UITabBarVisualProvider *)&v7 teardown];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_customBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundViewLayout, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
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
  uint64_t v9 = [(UITabBar *)tabBar items];
  uint64_t v10 = [v9 indexOfObject:v8];

  uint64_t v11 = [v9 indexOfObject:v6];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL || v10 == v11)
  {
    id v13 = v9;
  }
  else
  {
    uint64_t v14 = v11;
    BOOL v15 = (void *)[v9 mutableCopy];
    long long v16 = v15;
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [v15 replaceObjectAtIndex:v10 withObject:v6];
      id v17 = -[UITabBarItem _tabBarButton](v6);

      if (!v17)
      {
        objc_msgSend(v6, "_setImageStyle:", -[UITabBar _imageStyle](self->super._tabBar, "_imageStyle"));
        objc_msgSend(v6, "_setBarMetrics:", -[UITabBar _barMetrics](self->super._tabBar, "_barMetrics"));
        long long v18 = [(_UITabBarVisualProviderLegacyIOS *)self createViewForTabBarItem:v6];
        -[UITabBarItem _setTabBarButton:]((uint64_t)v6, v18);
      }
      objc_super v19 = -[UITabBarItem _tabBarButton](v6);
      [v19 setAlpha:1.0];

      double v20 = self->super._tabBar;
      uint64_t v21 = -[UITabBarItem _tabBarButton](v6);
      [(UIView *)v20 addSubview:v21];

      [(_UITabBarVisualProviderLegacyIOS *)self _applyAppearanceCustomizationsToItem:v6];
    }
    else
    {
      [v15 exchangeObjectAtIndex:v10 withObjectAtIndex:v14];
    }
    id v13 = (id)[v16 copy];
  }
  return v13;
}

- (void)changeLayout
{
}

- (BOOL)useModernAppearance
{
  return self->_useModernAppearance;
}

- (double)minimumWidthForHorizontalLayout
{
  return self->_minimumWidthForHorizontalLayout;
}

- (void)updateArchivedSubviews:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(UITabBar *)self->super._tabBar items];
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
          id v12 = -[UITabBarItem _tabBarButton](v10);
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

- (id)_preferredFocusedViewCarplay
{
  double v3 = [(UIView *)self->super._tabBar window];
  id v4 = [v3 _focusEventRecognizer];
  double v5 = [v4 _moveEvent];

  if (v5)
  {
    if ([v5 _focusHeading] == 32) {
      goto LABEL_3;
    }
  }
  else
  {
    tabBar = self->super._tabBar;
    int v9 = *((_DWORD *)&tabBar->super._viewFlags + 4);
    uint64_t v10 = [(UITabBar *)tabBar _preferredFocusHeading];
    if ((v9 & 0x80000) != 0 && v10 == 8 || (v9 & 0x80000) == 0 && v10 == 4)
    {
      uint64_t v11 = [(UITabBar *)self->super._tabBar items];
      id v12 = [v11 firstObject];
      goto LABEL_11;
    }
    if ((*(void *)&v9 & 0x80000) != 0) {
      BOOL v14 = v10 == 4;
    }
    else {
      BOOL v14 = v10 == 8;
    }
    if (v14)
    {
LABEL_3:
      accessoryView = self->_accessoryView;
      if (accessoryView)
      {
        double v7 = accessoryView;
        goto LABEL_18;
      }
      uint64_t v11 = [(UITabBar *)self->super._tabBar items];
      id v12 = [v11 lastObject];
LABEL_11:
      long long v13 = v12;
      -[UITabBarItem _tabBarButton](v12);
      double v7 = (UIView *)objc_claimAutoreleasedReturnValue();

      if (v7) {
        goto LABEL_18;
      }
    }
  }
  long long v15 = [(UITabBar *)self->super._tabBar selectedItem];
  -[UITabBarItem _tabBarButton](v15);
  double v7 = (UIView *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  return v7;
}

- (id)_preferredFocusedViewiOS
{
  v2 = [(UITabBar *)self->super._tabBar items];
  double v3 = [v2 firstObject];
  id v4 = -[UITabBarItem _tabBarButton](v3);

  return v4;
}

- (id)preferredFocusedView
{
  double v3 = [(UIView *)self->super._tabBar traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 3) {
    [(_UITabBarVisualProviderLegacyIOS *)self _preferredFocusedViewCarplay];
  }
  else {
  double v5 = [(_UITabBarVisualProviderLegacyIOS *)self _preferredFocusedViewiOS];
  }
  return v5;
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

- (void)_shim_updateTabBarItemView:(id)a3
{
  uint64_t v4 = (id *)a3;
  double v5 = -[UITabBarItem _tabBarButton](v4);
  int v6 = [v5 isFocused];

  if (v6) {
    [(UIView *)self->super._tabBar setNeedsFocusUpdate];
  }
  double v7 = -[UITabBarItem _tabBarButton](v4);
  [v7 removeFromSuperview];

  double v8 = [(_UITabBarVisualProviderLegacyIOS *)self createViewForTabBarItem:v4];
  -[UITabBarItem _setTabBarButton:]((uint64_t)v4, v8);

  tabBar = self->super._tabBar;
  -[UITabBarItem _tabBarButton](v4);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  [(UIView *)tabBar addSubview:v10];
}

- (double)_shim_heightForCustomizingItems
{
  [(_UITabBarVisualProviderLegacyIOS *)self _layoutRegion];
  return v2;
}

- (id)_focusedItemHighlightView
{
  return 0;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  objc_msgSend(a4, "location", a3);
  double v7 = v6;
  double v9 = v8;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v10 = [(UITabBar *)self->super._tabBar items];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v29;
LABEL_3:
    uint64_t v15 = 0;
    uint64_t v16 = v12 + v13;
    while (1)
    {
      if (*(void *)v29 != v14) {
        objc_enumerationMutation(v10);
      }
      id v17 = -[UITabBarItem _tabBarButton](*(id **)(*((void *)&v28 + 1) + 8 * v15));
      -[UIView convertPoint:toView:](self->super._tabBar, "convertPoint:toView:", v17, v7, v9);
      if (objc_msgSend(v17, "pointInside:withEvent:", 0)) {
        break;
      }

      if (v12 == ++v15)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
        uint64_t v13 = v16;
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    if (v17)
    {
      [v17 _tabBarHitRect];
      objc_msgSend(v17, "convertRect:toView:", self->super._tabBar);
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      id v10 = [NSNumber numberWithInteger:v13 + v15];
      uint64_t v18 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v10, v20, v22, v24, v26);
      goto LABEL_12;
    }
    uint64_t v18 = 0;
  }
  else
  {
LABEL_9:
    id v17 = 0;
    uint64_t v18 = 0;
LABEL_12:
  }
  return v18;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  double v5 = objc_msgSend(a4, "identifier", a3);
  unint64_t v6 = [v5 integerValue];

  double v7 = [(UITabBar *)self->super._tabBar items];
  double v8 = v7;
  if ((v6 & 0x8000000000000000) != 0 || v6 >= [v7 count])
  {
    id v17 = 0;
  }
  else
  {
    double v9 = [v8 objectAtIndexedSubscript:v6];
    id v10 = -[UITabBarItem _tabBarButton](v9);

    uint64_t v11 = [v10 window];

    if (v11)
    {
      uint64_t v12 = [[UITargetedPreview alloc] initWithView:v10];
      [v10 _contentRect];
      objc_msgSend(v10, "convertRect:toView:", self->super._tabBar);
      CGFloat x = v35.origin.x;
      double y = v35.origin.y;
      CGFloat width = v35.size.width;
      CGFloat height = v35.size.height;
      if (CGRectIsNull(v35))
      {
        id v17 = 0;
      }
      else
      {
        double v19 = +[_UIPointerSettingsDomain rootSettings];
        double v20 = [v19 tabBarSettings];

        if ([v10 layoutStyle])
        {
          [v20 inlineCornerRadius];
          double v22 = v21;
          [(UIView *)self->super._tabBar safeAreaInsets];
          if (v23 <= 0.0) {
            [v20 inlineHomeButtonVerticalOffset];
          }
          else {
            [v20 inlineHomeAffordanceVerticalOffset];
          }
          double y = y + v24;
        }
        else
        {
          [v20 stackedCornerRadius];
          double v22 = v25;
        }
        [v10 frame];
        v38.origin.CGFloat x = v26;
        v38.origin.double y = v27;
        v38.size.CGFloat width = v28;
        v38.size.CGFloat height = v29;
        v36.origin.CGFloat x = x;
        v36.origin.double y = y;
        v36.size.CGFloat width = width;
        v36.size.CGFloat height = height;
        CGRect v37 = CGRectIntersection(v36, v38);
        long long v30 = +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v37.origin.x, v37.origin.y, v37.size.width, v37.size.height, v22);
        long long v31 = +[UIPointerEffect effectWithPreview:v12];
        id v17 = +[UIPointerStyle styleWithEffect:v31 shape:v30];
      }
    }
    else
    {
      uint64_t v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("TabBarPointerEffects", &pointerInteraction_styleForRegion____s_category)+ 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v33 = 0;
        _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Failed to apply pointer effect since this tab bar's internal view hierarchy was modified. This is generally a bad idea.", v33, 2u);
      }
      id v17 = 0;
    }
  }
  return v17;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v5 = +[_UIBarSettingsDomain rootSettings];
  unint64_t v6 = [v5 tabBarSettings];
  int v7 = [v6 highlightSystemItems];

  double v8 = [(UITabBar *)self->super._tabBar items];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(id **)(*((void *)&v18 + 1) + 8 * i);
        if ([v13 isSystemItem])
        {
          [(_UITabBarVisualProviderLegacyIOS *)self _shim_updateTabBarItemView:v13];
          uint64_t v14 = -[UITabBarItem _tabBarButton](v13);
          uint64_t v15 = [v14 layer];

          if (v7)
          {
            id v16 = +[UIColor cyanColor];
            objc_msgSend(v15, "setBorderColor:", objc_msgSend(v16, "CGColor"));

            double v17 = 2.0;
          }
          else
          {
            [v15 setBorderColor:0];
            double v17 = 0.0;
          }
          [v15 setBorderWidth:v17];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

@end