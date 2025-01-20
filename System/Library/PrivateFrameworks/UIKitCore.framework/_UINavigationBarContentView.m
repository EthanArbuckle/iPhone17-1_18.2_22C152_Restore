@interface _UINavigationBarContentView
- ($F24F406B2B787EFB06265DBA3D28CBD5)titleViewLargeTitleHeightRange:(id)a3;
- (BOOL)_backButtonLayoutGuideIncludesFullyHiddenConstant;
- (BOOL)_effectiveStaticNavBarButtonLingers;
- (BOOL)_isStaticNavBarButtonOnRight;
- (BOOL)_item:(id)a3 addSymbolEffect:(id)a4 options:(id)a5 animated:(BOOL)a6;
- (BOOL)_item:(id)a3 removeAllSymbolEffectsWithOptions:(id)a4 animated:(BOOL)a5;
- (BOOL)_item:(id)a3 removeSymbolEffectOfType:(id)a4 options:(id)a5 animated:(BOOL)a6;
- (BOOL)_showTitleWithTabBar;
- (BOOL)_useLeadingAlignedTitle;
- (BOOL)allowLeadingAlignedLargeTitle;
- (BOOL)backButtonHidden;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)compactMetrics;
- (BOOL)enableAlternatePopItem;
- (BOOL)hasLeadingInsetFromTideBar;
- (BOOL)hostedTabBarEnabled;
- (BOOL)hostedTabBarVisibilityAffectsTitle;
- (BOOL)isAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange;
- (BOOL)isHostedTabBarVisible;
- (BOOL)isNavItemContentLayoutGuideFlushLeading;
- (BOOL)isNavItemContentLayoutGuideFlushTrailing;
- (BOOL)isRTL;
- (BOOL)isStaticNavBarButtonTrailing;
- (BOOL)leadingItemsSupplementBackItem;
- (BOOL)placeInlineSearchBarInCenter;
- (BOOL)shouldFadeStaticNavBarButton;
- (BOOL)showTitleWithTabBar;
- (BOOL)staticNavBarButtonLingers;
- (BOOL)updateNavItemContentLayoutGuideAnimationConstraintConstant:(double)a3;
- (BOOL)useInlineLargeTitleMetrics;
- (BOOL)wantsHostedTabBarMetrics;
- (CGRect)_overlayRectForFrame:(CGRect)a3 inView:(id)a4 inTargetView:(id)a5;
- (CGRect)_overlayRectForGuide:(id)a3 inTargetView:(id)a4;
- (CGRect)_overlayRectForView:(id)a3 inTargetView:(id)a4;
- (CGRect)hostedTabBarFrame;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)centerBarGroups;
- (NSArray)leadingBarButtonItems;
- (NSArray)leadingBarGroups;
- (NSArray)trailingBarButtonItems;
- (NSArray)trailingBarGroups;
- (NSDictionary)effectiveTitleAttributes;
- (NSDictionary)titleAttributes;
- (NSString)customizationIdentifier;
- (NSString)description;
- (NSString)title;
- (UIAction)backAction;
- (UIBarButtonItem)backButtonItem;
- (UIBarButtonItem)staticNavBarButtonItem;
- (UIBarButtonItemGroup)fixedTrailingGroup;
- (UIDeferredMenuElement)additionalItems;
- (UIDocumentProperties)documentProperties;
- (UILayoutGuide)navItemContentLayoutGuide;
- (UIOffset)titlePositionAdjustment;
- (UIView)_effectiveTitleView;
- (UIView)titleView;
- (_UIBarButtonItemData)backButtonAppearance;
- (_UIBarButtonItemData)doneItemAppearance;
- (_UIBarButtonItemData)plainItemAppearance;
- (_UIBarButtonItemSearchBarGroup)inlineSearchBarGroup;
- (_UINavigationBarContentView)initWithFrame:(CGRect)a3 visualProvider:(id)a4;
- (_UINavigationBarContentViewDelegate)delegate;
- (_UINavigationBarContentViewLayout)layout;
- (_UINavigationBarContentViewVisualProvider)visualProvider;
- (_UINavigationItemRenameHandler)dci_renameHandler;
- (_UIPointerInteractionAssistant)assistant;
- (double)_contentLayoutGuideAnimationConstraintConstantForFullyHiddenButton;
- (double)_contentLayoutGuideAnimationConstraintConstantForFullyVisibleButton;
- (double)_intrinsicHeight;
- (double)_resolvedInlineTitleViewAlpha;
- (double)backButtonMargin;
- (double)backButtonMaximumWidth;
- (double)buttonBarMinimumInterGroupSpace;
- (double)buttonBarMinimumInterItemSpace;
- (double)defaultEdgeSpacing;
- (double)inlineTitleViewAlpha;
- (double)navItemContentLayoutGuideAnimationDistance;
- (double)overrideSize;
- (double)titleViewContentBaseHeight:(id)a3;
- (double)titleViewContentBaselineOffsetFromTop:(id)a3;
- (double)titleViewFloatingTabBarHeight:(id)a3;
- (double)titleViewLargeTitleHeight:(id)a3;
- (id)_accessibility_HUDItemForPoint:(CGPoint)a3;
- (id)_accessibility_barButtonItemAtPoint:(CGPoint)a3;
- (id)_accessibility_controlToActivateForHUDGestureLiftAtPoint:(CGPoint)a3;
- (id)_layoutForAugmentedTitleView:(id)a3;
- (id)_newLayout;
- (id)_traitCollectionForChildEnvironment:(id)a3;
- (id)backIndicatorImage;
- (id)titleMenuProvider;
- (id)titleViewBackButtonMenu:(id)a3;
- (int64_t)_currentContentSize;
- (int64_t)_effectiveToolbarStyle;
- (int64_t)barMetrics;
- (int64_t)barType;
- (int64_t)currentContentSize;
- (int64_t)effectiveStyleForStyle:(int64_t)a3;
- (int64_t)requestedContentSize;
- (int64_t)toolbarStyle;
- (unint64_t)edgesPaddingBarButtonItem:(id)a3;
- (void)__backButtonAction:(id)a3;
- (void)_addCoordinatedAnimation:(id)a3 completion:(id)a4;
- (void)_appearanceChanged;
- (void)_clearAllAnimations;
- (void)_clearAssistants;
- (void)_configureBackButton:(id)a3;
- (void)_ensureHostedTabBarConstraintsWithUpdateBlock:(id)a3;
- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3;
- (void)_item:(id)a3 applyContentTransition:(id)a4 options:(id)a5;
- (void)_runAllScheduledAnimations:(BOOL)a3;
- (void)_safeAreaInsetsDidChangeFromOldInsets:(UIEdgeInsets)a3;
- (void)_setAssistants;
- (void)_setBackButtonMaximumWidth:(double)a3;
- (void)_setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3;
- (void)_setupBackButton;
- (void)_setupCenterButtonBar;
- (void)_setupLeadingButtonBarAnimated:(BOOL)a3;
- (void)_setupStaticNavBarButtonAnimated:(BOOL)a3;
- (void)_setupTitleView;
- (void)_setupTrailingButtonBarAnimated:(BOOL)a3;
- (void)_updateLayoutMarginsForLayout:(id)a3;
- (void)_updateNavItemContentLayoutGuideEdgeConstraints;
- (void)_updateStaticNavBarButtonVerticalAlignmentConstraints;
- (void)_updateTitleAlignment;
- (void)adoptLayout:(id)a3;
- (void)adoptNewLayout;
- (void)beginAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange;
- (void)clearTransitionContext;
- (void)dci_setRenameHandler:(id)a3;
- (void)endAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange;
- (void)ensureBackButtonTruncationOccursWithContext:(id)a3;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)prepareToRecordToState:(id)a3;
- (void)recordFromStateForTransition:(id)a3;
- (void)recordToStateForTransition:(id)a3;
- (void)relinquishLayout;
- (void)resolvedHeightDidChange;
- (void)setAdditionalItems:(id)a3;
- (void)setAllowLeadingAlignedLargeTitle:(BOOL)a3;
- (void)setAssistant:(id)a3;
- (void)setBackAction:(id)a3;
- (void)setBackButtonAppearance:(id)a3;
- (void)setBackButtonHidden:(BOOL)a3;
- (void)setBackButtonItem:(id)a3;
- (void)setBackIndicatorImage:(id)a3;
- (void)setBarMetrics:(int64_t)a3;
- (void)setCenterBarGroups:(id)a3;
- (void)setCustomizationIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3;
- (void)setDocumentProperties:(id)a3;
- (void)setDoneItemAppearance:(id)a3;
- (void)setEnableAlternatePopItem:(BOOL)a3;
- (void)setFixedTrailingGroup:(id)a3;
- (void)setHasLeadingInsetFromTideBar:(BOOL)a3;
- (void)setHostedTabBarEnabled:(BOOL)a3;
- (void)setHostedTabBarFrame:(CGRect)a3;
- (void)setHostedTabBarVisibilityAffectsTitle:(BOOL)a3;
- (void)setInlineSearchBarGroup:(id)a3;
- (void)setInlineTitleViewAlpha:(double)a3;
- (void)setIsHostedTabBarVisible:(BOOL)a3;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
- (void)setLeadingBarButtonItems:(id)a3;
- (void)setLeadingBarGroups:(id)a3;
- (void)setLeadingItemsSupplementBackItem:(BOOL)a3;
- (void)setNeedsStaticNavBarButtonUpdate;
- (void)setOverrideSize:(double)a3;
- (void)setPlaceInlineSearchBarInCenter:(BOOL)a3;
- (void)setPlainItemAppearance:(id)a3;
- (void)setRequestedContentSize:(int64_t)a3;
- (void)setShouldFadeStaticNavBarButton:(BOOL)a3;
- (void)setShowTitleWithTabBar:(BOOL)a3;
- (void)setStaticNavBarButtonItem:(id)a3;
- (void)setStaticNavBarButtonLingers:(BOOL)a3;
- (void)setStaticNavBarButtonTrailing:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTitleAttributes:(id)a3;
- (void)setTitleMenuProvider:(id)a3;
- (void)setTitlePositionAdjustment:(UIOffset)a3;
- (void)setTitleView:(id)a3;
- (void)setToolbarStyle:(int64_t)a3;
- (void)setTrailingBarButtonItems:(id)a3;
- (void)setTrailingBarGroups:(id)a3;
- (void)setUseInlineLargeTitleMetrics:(BOOL)a3;
- (void)setWantsHostedTabBarMetrics:(BOOL)a3;
- (void)tintColorDidChange;
- (void)titleView:(id)a3 needsUpdatedContentOverlayRects:(id)a4;
- (void)titleViewChangedDisplayItemAlpha:(id)a3;
- (void)titleViewChangedHeight:(id)a3;
- (void)titleViewChangedLayout:(id)a3;
- (void)titleViewChangedMaximumBackButtonWidth:(id)a3;
- (void)titleViewChangedPreferredDisplaySize:(id)a3;
- (void)titleViewChangedStandardDisplayItems:(id)a3;
- (void)titleViewChangedTabBarSizingDisposition:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAccessibilityContents:(id)a3;
- (void)updateAugmentedTitleViewNavigationBarTraitsTo:(id)a3 from:(id)a4;
- (void)updateContentAnimated:(BOOL)a3;
@end

@implementation _UINavigationBarContentView

- (UILayoutGuide)navItemContentLayoutGuide
{
  navItemContentLayoutGuide = self->_navItemContentLayoutGuide;
  if (!navItemContentLayoutGuide)
  {
    v4 = objc_alloc_init(UILayoutGuide);
    v5 = self->_navItemContentLayoutGuide;
    self->_navItemContentLayoutGuide = v4;

    [(UILayoutGuide *)self->_navItemContentLayoutGuide setIdentifier:@"UINavigationBarItemContentLayoutGuide"];
    [(UIView *)self addLayoutGuide:self->_navItemContentLayoutGuide];
    v6 = [(UILayoutGuide *)self->_navItemContentLayoutGuide topAnchor];
    v7 = [(UIView *)self topAnchor];
    v8 = [v6 constraintEqualToAnchor:v7];
    [v8 setActive:1];

    v9 = [(UILayoutGuide *)self->_navItemContentLayoutGuide bottomAnchor];
    v10 = [(UIView *)self bottomAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    [v11 setActive:1];

    [(_UINavigationBarContentView *)self _updateNavItemContentLayoutGuideEdgeConstraints];
    navItemContentLayoutGuide = self->_navItemContentLayoutGuide;
  }
  return navItemContentLayoutGuide;
}

- (int64_t)barType
{
  return 1;
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarContentView;
  [(UIView *)&v3 layoutMarginsDidChange];
  [(_UINavigationBarContentView *)self _updateLayoutMarginsForLayout:self->_layout];
}

- (double)buttonBarMinimumInterGroupSpace
{
  v2 = [(UIView *)self traitCollection];
  [v2 userInterfaceIdiom];

  return 6.0;
}

- (_UINavigationBarContentViewVisualProvider)visualProvider
{
  return self->_visualProvider;
}

- (void)_setupStaticNavBarButtonAnimated:(BOOL)a3
{
  staticNavBarButtonItem = self->_staticNavBarButtonItem;
  if (staticNavBarButtonItem && ![(UIBarButtonItem *)staticNavBarButtonItem isHidden])
  {
    if ([(UIBarButtonItem *)self->_staticNavBarButtonItem _actsAsFakeBackButton])
    {
      staticNavBarButton = self->_staticNavBarButton;
      if (staticNavBarButton)
      {
        if ((*(_WORD *)&self->_navigationBarContentViewFlags & 0x100) == 0)
        {
          [(UIView *)staticNavBarButton removeFromSuperview];
          v8 = self->_staticNavBarButton;
          self->_staticNavBarButton = 0;

          staticNavBarButtonVerticalAlignmentConstraints = self->_staticNavBarButtonVerticalAlignmentConstraints;
          self->_staticNavBarButtonVerticalAlignmentConstraints = 0;
        }
      }
    }
    v10 = self->_staticNavBarButton;
    if (!v10)
    {
      v11 = [_UIButtonBarButton alloc];
      v12 = [(UIView *)self traitCollection];
      v13 = +[_UIButtonBarButtonVisualProvider visualProviderForIdiom:](_UIButtonBarButtonVisualProvider, "visualProviderForIdiom:", [v12 userInterfaceIdiom]);
      v14 = [(_UIButtonBarButton *)v11 initWithVisualProvider:v13];
      v15 = self->_staticNavBarButton;
      self->_staticNavBarButton = v14;

      [(UIView *)self->_staticNavBarButton setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v16) = 1145569280;
      [(UIView *)self->_staticNavBarButton setContentCompressionResistancePriority:0 forAxis:v16];
      v10 = self->_staticNavBarButton;
    }
    [(UIView *)self addSubview:v10];
    if ((*(_WORD *)&self->_navigationBarContentViewFlags & 4) == 0)
    {
      v17 = [(_UIButtonBarButton *)self->_staticNavBarButton visualProvider];
      v18 = [v17 contentView];

      if (v18) {
        goto LABEL_40;
      }
    }
    BOOL v19 = [(UIBarButtonItem *)self->_staticNavBarButtonItem _actsAsFakeBackButton];
    v20 = self->_staticNavBarButton;
    v21 = self->_staticNavBarButtonItem;
    if (v19)
    {
      [(_UIButtonBarButton *)v20 configureBackButtonFromBarItem:v21 withAppearanceDelegate:self];
      __int16 v22 = *(_WORD *)&self->_navigationBarContentViewFlags | 0x100;
    }
    else
    {
      [(_UIButtonBarButton *)v20 configureFromBarItem:v21 withAppearanceDelegate:self];
      __int16 v22 = *(_WORD *)&self->_navigationBarContentViewFlags & 0xFEFF;
    }
    *(_WORD *)&self->_navigationBarContentViewFlags = v22;
    BOOL staticNavBarButtonTrailing = self->_staticNavBarButtonTrailing;
    v24 = [(_UIButtonBarButton *)self->_staticNavBarButton visualProvider];
    v25 = v24;
    if (staticNavBarButtonTrailing) {
      [v24 alignmentViewForStaticNavBarButtonTrailing];
    }
    else {
    v26 = [v24 alignmentViewForStaticNavBarButtonLeading];
    }

    if (self->_staticNavBarButtonTrailing) {
      uint64_t v27 = 6;
    }
    else {
      uint64_t v27 = 5;
    }
    staticNavBarButtonXPositionConstraint = self->_staticNavBarButtonXPositionConstraint;
    if (v26)
    {
      if (!staticNavBarButtonXPositionConstraint
        || ![(NSLayoutConstraint *)staticNavBarButtonXPositionConstraint isActive])
      {
        goto LABEL_30;
      }
      v29 = [(NSLayoutConstraint *)self->_staticNavBarButtonXPositionConstraint firstItem];
      if (v29 != v26)
      {

LABEL_30:
        [(NSLayoutConstraint *)self->_staticNavBarButtonXPositionConstraint setActive:0];
        v31 = (void *)MEMORY[0x1E4F5B268];
        v32 = [(UIView *)self layoutMarginsGuide];
        v33 = [v31 constraintWithItem:v26 attribute:v27 relatedBy:0 toItem:v32 attribute:v27 multiplier:1.0 constant:0.0];

        [(NSLayoutConstraint *)v33 setIdentifier:@"UINav_static_button_horiz_position"];
        [(NSLayoutConstraint *)v33 setActive:1];
        v34 = self->_staticNavBarButtonXPositionConstraint;
        self->_staticNavBarButtonXPositionConstraint = v33;

        goto LABEL_31;
      }
      NSLayoutAttribute v30 = [(NSLayoutConstraint *)self->_staticNavBarButtonXPositionConstraint firstAttribute];

      if (v27 != v30) {
        goto LABEL_30;
      }
    }
    else
    {
      [(NSLayoutConstraint *)staticNavBarButtonXPositionConstraint setActive:0];
    }
LABEL_31:
    objc_initWeak(&location, self->_staticNavBarButtonItem);
    BOOL v35 = [(UIBarButtonItem *)self->_staticNavBarButtonItem _isFloating];
    v36 = self->_staticNavBarButtonItem;
    if (v35)
    {
      v37 = v36;
      v38 = [(UIBarButtonItem *)v37 _configuredFloatableView];

      if (!v38)
      {
        v39 = [_UIButtonBarButton alloc];
        v40 = [(UIView *)self traitCollection];
        v41 = +[_UIButtonBarButtonVisualProvider visualProviderForIdiom:](_UIButtonBarButtonVisualProvider, "visualProviderForIdiom:", [v40 userInterfaceIdiom]);
        v42 = [(_UIButtonBarButton *)v39 initWithVisualProvider:v41];

        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __64___UINavigationBarContentView__setupStaticNavBarButtonAnimated___block_invoke;
        v61[3] = &unk_1E52DDB60;
        objc_copyWeak(&v62, &location);
        v43 = +[UIAction actionWithTitle:&stru_1ED0E84C0 image:0 identifier:@"com.apple.UIKit.NavigationBar.StaticNavBarButton" handler:v61];
        [(UIControl *)v42 addAction:v43 forControlEvents:0x2000];

        [(UIBarButtonItem *)v37 _setConfiguredFloatableView:v42];
        objc_destroyWeak(&v62);
      }
      [(UIBarButtonItem *)v37 _setReferenceView:self->_staticNavBarButton];
      v44 = [(UIBarButtonItem *)v37 _configuredFloatableView];
      [v44 configureFromBarItem:v37 withAppearanceDelegate:self];
      [(UIView *)self->_staticNavBarButton setUserInteractionEnabled:0];
      v45 = [(UIBarButtonItem *)self->_staticNavBarButtonItem _configuredFloatableView];
      [v45 setAlpha:1.0];
    }
    else
    {
      v46 = [(UIBarButtonItem *)v36 _configuredFloatableView];
      [v46 setAlpha:0.0];

      v47 = self->_staticNavBarButton;
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __64___UINavigationBarContentView__setupStaticNavBarButtonAnimated___block_invoke_2;
      v59[3] = &unk_1E52DDB60;
      objc_copyWeak(&v60, &location);
      v48 = +[UIAction actionWithTitle:&stru_1ED0E84C0 image:0 identifier:@"com.apple.UIKit.NavigationBar.StaticNavBarButton" handler:v59];
      [(UIControl *)v47 addAction:v48 forControlEvents:0x2000];

      if ([(UIBarButtonItem *)self->_staticNavBarButtonItem _isFloatable])
      {
        v49 = [(UIBarButtonItem *)self->_staticNavBarButtonItem _referenceView];

        if (!v49) {
          [(UIBarButtonItem *)self->_staticNavBarButtonItem _setReferenceView:self->_staticNavBarButton];
        }
      }
      objc_destroyWeak(&v60);
    }
    objc_destroyWeak(&location);

LABEL_40:
    char v6 = 1;
    goto LABEL_41;
  }
  v5 = self->_staticNavBarButton;
  if (v5) {
    [(UIView *)self insertSubview:v5 atIndex:0];
  }
  char v6 = 0;
LABEL_41:
  if ([(UIBarButtonItem *)self->_staticNavBarButtonItem _isFloating])
  {
    [(UIView *)self->_staticNavBarButton setAlpha:0.0];
  }
  else
  {
    if ((*(_WORD *)&self->_navigationBarContentViewFlags & 0x40) != 0)
    {
      [(_UINavigationBarContentView *)self _contentLayoutGuideAnimationConstraintConstantForFullyHiddenButton];
      double v52 = v51;
      [(_UINavigationBarContentView *)self _contentLayoutGuideAnimationConstraintConstantForFullyVisibleButton];
      double v54 = v53;
      [(NSLayoutConstraint *)self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint constant];
      double v56 = v55;
      if ([(_UINavigationBarContentView *)self _backButtonLayoutGuideIncludesFullyHiddenConstant])
      {
        double v57 = 0.0;
      }
      else
      {
        double v57 = v52;
      }
      double v58 = fmax(fmin((v56 - v57) / (v54 - v52), 1.0), 0.0);
      double v50 = v58 * (v58 * (v58 * v58));
    }
    else
    {
      double v50 = 1.0;
      if ((v6 & 1) == 0)
      {
        if ([(_UINavigationBarContentView *)self _effectiveStaticNavBarButtonLingers])
        {
          double v50 = 1.0;
        }
        else
        {
          double v50 = 0.0;
        }
      }
    }
    [(UIView *)self->_staticNavBarButton setAlpha:v50];
    [(UIView *)self->_staticNavBarButton setUserInteractionEnabled:v50 == 1.0];
  }
  [(_UINavigationBarContentView *)self _updateNavItemContentLayoutGuideEdgeConstraints];
  [(_UINavigationBarContentView *)self _updateStaticNavBarButtonVerticalAlignmentConstraints];
  [(UIBarButtonItem *)self->_staticNavBarButtonItem setView:self->_staticNavBarButton];
  *(_WORD *)&self->_navigationBarContentViewFlags &= ~4u;
}

- (void)_updateNavItemContentLayoutGuideEdgeConstraints
{
  v42[2] = *MEMORY[0x1E4F143B8];
  if (self->_navItemContentLayoutGuide) {
    goto LABEL_2;
  }
  if (os_variant_has_internal_diagnostics())
  {
    BOOL v35 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v35, OS_LOG_TYPE_FAULT, "_navItemContentLayoutGuideLeadingConstraint not updated because of missing layout guide", buf, 2u);
    }
  }
  else
  {
    v34 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_updateNavItemContentLayoutGuideEdgeConstraints___s_category)+ 8);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v34, OS_LOG_TYPE_ERROR, "_navItemContentLayoutGuideLeadingConstraint not updated because of missing layout guide", buf, 2u);
    }
  }
  if (self->_navItemContentLayoutGuide)
  {
LABEL_2:
    objc_super v3 = [(NSArray *)self->_navItemContentLayoutGuideHorizEdgeConstraints firstObject];
    v4 = [(NSArray *)self->_navItemContentLayoutGuideHorizEdgeConstraints lastObject];
    __int16 navigationBarContentViewFlags = (__int16)self->_navigationBarContentViewFlags;
    if ((navigationBarContentViewFlags & 0x10) != 0)
    {
      if ((navigationBarContentViewFlags & 0x20) != 0)
      {
        navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint = self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint;
        if (!navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint) {
          goto LABEL_57;
        }
        if (self->_staticNavBarButtonTrailing) {
          uint64_t v9 = 6;
        }
        else {
          uint64_t v9 = 5;
        }
        if (v9 != [(NSLayoutConstraint *)navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint firstAttribute])
        {
          [(NSLayoutConstraint *)self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint setActive:0];
          v10 = self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint;
          self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint = 0;
        }
        if (!self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint)
        {
LABEL_57:
          if (self->_staticNavBarButtonTrailing)
          {
            v11 = [(UIView *)self trailingAnchor];
            [(UILayoutGuide *)self->_navItemContentLayoutGuide trailingAnchor];
          }
          else
          {
            v11 = [(UILayoutGuide *)self->_navItemContentLayoutGuide leadingAnchor];
            [(UIView *)self leadingAnchor];
          v24 = };
          v25 = [v11 constraintEqualToAnchor:v24];
          v26 = self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint;
          self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint = v25;
        }
        if (self->_staticNavBarButtonTrailing) {
          uint64_t v27 = v4;
        }
        else {
          uint64_t v27 = v3;
        }
        id v28 = v27;
        v29 = [v28 secondItem];

        if (v29 == self)
        {
          double v33 = 0.0;
        }
        else
        {
          [(_UINavigationBarContentView *)self _contentLayoutGuideAnimationConstraintConstantForFullyVisibleButton];
          double v31 = v30;
          [(_UINavigationBarContentView *)self _contentLayoutGuideAnimationConstraintConstantForFullyHiddenButton];
          double v33 = v31 - v32;
        }
        [v28 setActive:0];
        [(_UINavigationBarContentView *)self updateNavItemContentLayoutGuideAnimationConstraintConstant:v33];
        [(NSLayoutConstraint *)self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint setActive:1];

        *(_WORD *)&self->_navigationBarContentViewFlags &= ~0x20u;
      }
      goto LABEL_46;
    }
    [(NSLayoutConstraint *)self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint setActive:0];
    staticNavBarButtonItem = self->_staticNavBarButtonItem;
    BOOL v7 = staticNavBarButtonItem && ![(UIBarButtonItem *)staticNavBarButtonItem isHidden]
      || [(_UINavigationBarContentView *)self _effectiveStaticNavBarButtonLingers];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v37 = __78___UINavigationBarContentView__updateNavItemContentLayoutGuideEdgeConstraints__block_invoke;
    v38 = &unk_1E52DE4D0;
    v39 = self;
    BOOL v40 = v7;
    BOOL v12 = __78___UINavigationBarContentView__updateNavItemContentLayoutGuideEdgeConstraints__block_invoke((uint64_t)v36, v3, 1);
    if (v12)
    {
      [v3 setActive:0];
      BOOL v13 = !self->_staticNavBarButtonTrailing && v7;
      v14 = [(UILayoutGuide *)self->_navItemContentLayoutGuide leadingAnchor];
      if (v13)
      {
        v15 = [(UIView *)self->_staticNavBarButton trailingAnchor];
        [(_UINavigationBarContentView *)self buttonBarMinimumInterGroupSpace];
        objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15);
      }
      else
      {
        v15 = [(UIView *)self leadingAnchor];
        [v14 constraintEqualToAnchor:v15];
      double v16 = };

      [v16 setIdentifier:@"UINavItemContentGuide-leading"];
      objc_super v3 = v16;
    }
    else
    {
      [v3 setActive:1];
    }
    if (((unsigned int (*)(void *, void *, void))v37)(v36, v4, 0))
    {
      [v4 setActive:0];
      BOOL v17 = self->_staticNavBarButtonTrailing && v7;
      v18 = [(UILayoutGuide *)self->_navItemContentLayoutGuide trailingAnchor];
      if (v17)
      {
        BOOL v19 = [(UIView *)self->_staticNavBarButton leadingAnchor];
        [(_UINavigationBarContentView *)self buttonBarMinimumInterGroupSpace];
        [v18 constraintEqualToAnchor:v19 constant:-v20];
      }
      else
      {
        BOOL v19 = [(UIView *)self trailingAnchor];
        [v18 constraintEqualToAnchor:v19];
      v21 = };

      [v21 setIdentifier:@"UINavItemContentGuide-trailing"];
      v4 = v21;
    }
    else
    {
      [v4 setActive:1];
      if (!v12) {
        goto LABEL_46;
      }
    }
    v42[0] = v3;
    v42[1] = v4;
    __int16 v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    navItemContentLayoutGuideHorizEdgeConstraints = self->_navItemContentLayoutGuideHorizEdgeConstraints;
    self->_navItemContentLayoutGuideHorizEdgeConstraints = v22;

    [MEMORY[0x1E4F5B268] activateConstraints:self->_navItemContentLayoutGuideHorizEdgeConstraints];
    [(_UINavigationBarContentViewLayout *)self->_layout _updateMarginConstraints];
LABEL_46:
  }
}

- (BOOL)_effectiveStaticNavBarButtonLingers
{
  if ((*(_WORD *)&self->_navigationBarContentViewFlags & 0x80) == 0) {
    return 0;
  }
  v4 = [(_UINavigationBarContentViewLayout *)self->_layout backButton];
  if (v4) {
    BOOL v2 = 0;
  }
  else {
    BOOL v2 = self->_staticNavBarButton != 0;
  }

  return v2;
}

- (void)_updateStaticNavBarButtonVerticalAlignmentConstraints
{
  v15[2] = *MEMORY[0x1E4F143B8];
  if (self->_staticNavBarButton && [(_UINavigationBarContentViewLayout *)self->_layout active])
  {
    objc_super v3 = [(NSArray *)self->_staticNavBarButtonVerticalAlignmentConstraints firstObject];
    if ([(UIBarButtonItem *)self->_staticNavBarButtonItem _actsAsFakeBackButton])
    {
      uint64_t v4 = [(_UINavigationBarContentViewLayout *)self->_layout backButtonGuide];
    }
    else
    {
      layout = self->_layout;
      if (self->_staticNavBarButtonTrailing) {
        [(_UINavigationBarContentViewLayout *)layout trailingBarGuide];
      }
      else {
      uint64_t v4 = [(_UINavigationBarContentViewLayout *)layout leadingBarGuide];
      }
    }
    id v6 = (id)v4;
    if (v4
      && (!v3
       || ![v3 isActive]
       || v6 != (id)[v3 secondItem]))
    {
      if (self->_staticNavBarButtonVerticalAlignmentConstraints) {
        objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
      }
      BOOL v7 = [(UIView *)self->_staticNavBarButton topAnchor];
      v8 = [v6 topAnchor];
      uint64_t v9 = [v7 constraintEqualToAnchor:v8];

      [v9 setIdentifier:@"UINav-static-button-top"];
      v10 = [(UIView *)self->_staticNavBarButton bottomAnchor];
      v11 = [v6 bottomAnchor];
      BOOL v12 = [v10 constraintEqualToAnchor:v11];

      [v12 setIdentifier:@"UINav-static-button-bottom"];
      v15[0] = v9;
      v15[1] = v12;
      BOOL v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
      staticNavBarButtonVerticalAlignmentConstraints = self->_staticNavBarButtonVerticalAlignmentConstraints;
      self->_staticNavBarButtonVerticalAlignmentConstraints = v13;

      [MEMORY[0x1E4F5B268] activateConstraints:self->_staticNavBarButtonVerticalAlignmentConstraints];
    }
  }
}

- (void)layoutSubviews
{
  objc_super v3 = _UINavigationBarCastToAugmentedTitleView(self->_titleView);
  uint64_t v4 = [v3 _navigationBarContentOverlayRects];
  v68.receiver = self;
  v68.super_class = (Class)_UINavigationBarContentView;
  [(UIView *)&v68 layoutSubviews];
  if (!self->_transitionContext)
  {
    layout = self->_layout;
    if (layout)
    {
      [(_UINavigationBarContentViewLayout *)layout layoutSubviews];
      [(UIView *)self bounds];
      CGFloat x = v69.origin.x;
      CGFloat y = v69.origin.y;
      CGFloat width = v69.size.width;
      CGFloat height = v69.size.height;
      double MinX = CGRectGetMinX(v69);
      v70.origin.CGFloat x = x;
      v70.origin.CGFloat y = y;
      v70.size.CGFloat width = width;
      v70.size.CGFloat height = height;
      CGRectGetMaxX(v70);
      v11 = [(_UINavigationBarContentViewLayout *)self->_layout backButton];
      BOOL v12 = [(_UINavigationBarContentViewLayout *)self->_layout titleControl];
      BOOL v13 = [(_UINavigationBarContentViewLayout *)self->_layout leadingBar];
      v14 = [(_UINavigationBarContentViewLayout *)self->_layout trailingBar];
      uint64_t v15 = 464;
      staticNavBarButton = self->_staticNavBarButton;
      v67 = v13;
      if (staticNavBarButton && ![(UIView *)staticNavBarButton isHidden])
      {
        BOOL staticNavBarButtonTrailing = self->_staticNavBarButtonTrailing;
        BOOL v17 = self->_staticNavBarButton;
        if (!staticNavBarButtonTrailing)
        {
          int v65 = [(UIView *)self _shouldReverseLayoutDirection];
          if (v17)
          {
            if (v11)
            {
              uint64_t v15 = 0;
              double v30 = v11;
            }
            else
            {
              uint64_t v60 = [v13 view];
              if (v60)
              {
                BOOL v13 = (void *)v60;
                uint64_t v15 = 0;
                double v30 = (void *)v60;
              }
              else if (v12)
              {
                uint64_t v15 = 0;
                BOOL v13 = 0;
                double v30 = v12;
              }
              else
              {
                double v30 = [v14 view];
                BOOL v13 = 0;
                uint64_t v15 = 1;
              }
            }
            double v61 = _hitTestInsets(v17, 0, v30, v65, MinX);
            -[UIView setHitTestInsets:](v17, "setHitTestInsets:", 0.0, v61, 0.0, v62);
            if (v15) {

            }
            v26 = 0;
            if (!v11)
            {
              v66 = v17;
              uint64_t v28 = 1;
LABEL_25:

              BOOL v13 = v67;
LABEL_26:
              v63 = v11;
              if (v13)
              {
                BOOL v13 = [v67 view];
                if (v28) {
                  v11 = v66;
                }
                v34 = v12;
                if (!v12)
                {
                  uint64_t v35 = [v14 view];
                  uint64_t v15 = v35;
                  if (v35) {
                    v34 = (void *)v35;
                  }
                  else {
                    v34 = v26;
                  }
                }
                double v36 = _hitTestInsets(v13, v11, v34, v65, MinX);
                objc_msgSend(v67, "setHitTestInsets:", 0.0, v36, 0.0, v37);
                if (!v12) {

                }
                v11 = v63;
              }
              if (v14)
              {
                BOOL v13 = [v14 view];
                v38 = v12;
                if (!v12)
                {
                  uint64_t v39 = [v67 view];
                  uint64_t v15 = v39;
                  if (v28) {
                    BOOL v40 = v66;
                  }
                  else {
                    BOOL v40 = v11;
                  }
                  if (v39) {
                    v38 = (void *)v39;
                  }
                  else {
                    v38 = v40;
                  }
                }
                double v41 = _hitTestInsets(v13, v38, v26, v65, MinX);
                objc_msgSend(v14, "setHitTestInsets:", 0.0, v41, 0.0, v42);
                if (!v12) {
              }
                }
              if (v26)
              {
                if (v12)
                {
                  int v43 = 0;
                  v44 = v12;
                }
                else
                {
                  uint64_t v45 = [v67 view];
                  if (v45)
                  {
                    BOOL v13 = (void *)v45;
                    int v43 = 0;
                    v44 = (void *)v45;
                  }
                  else if (v28)
                  {
                    uint64_t v46 = [v14 view];
                    uint64_t v28 = v46;
                    BOOL v13 = 0;
                    if (v46) {
                      v44 = (void *)v46;
                    }
                    else {
                      v44 = v66;
                    }
                    int v43 = 1;
                  }
                  else
                  {
                    BOOL v13 = 0;
                    int v43 = 0;
                    v44 = v11;
                  }
                }
                double v47 = _hitTestInsets(v26, v44, 0, v65, MinX);
                -[UIView setHitTestInsets:](v26, "setHitTestInsets:", 0.0, v47, 0.0, v48);
                if (v43) {

                }
                if (!v12) {
              }
                }
              v49 = objc_msgSend(v14, "view", v63);
              double v50 = v49;
              if (v3)
              {
                double v51 = [v49 subviews];
                BOOL v52 = [v51 count] != 0;
                double v53 = [v14 view];
                [v53 setUserInteractionEnabled:v52];

                double v54 = v67;
                if (v4)
                {
                  double v55 = [v3 _navigationBarContentOverlayRects];
                  id v56 = v4;
                  id v57 = v55;
                  if (v56 == v57)
                  {
                  }
                  else
                  {
                    double v58 = v57;
                    if (v57)
                    {
                      char v59 = [v56 isEqual:v57];

                      if (v59) {
                        goto LABEL_73;
                      }
                    }
                    else
                    {
                    }
                    [v3 setNeedsLayout];
                  }
                }
              }
              else
              {
                [v49 setUserInteractionEnabled:1];

                double v54 = v67;
              }
LABEL_73:

              goto LABEL_74;
            }
            BOOL v13 = v67;
LABEL_11:
            uint64_t v27 = [v13 view];
            BOOL v13 = (void *)v27;
            if (v27)
            {
              uint64_t v28 = 0;
              v29 = (void *)v27;
            }
            else if (v12)
            {
              uint64_t v28 = 0;
              v29 = v12;
            }
            else
            {
              uint64_t v31 = [v14 view];
              uint64_t v15 = v31;
              if (v31) {
                v29 = (void *)v31;
              }
              else {
                v29 = v26;
              }
              uint64_t v28 = 1;
            }
            v66 = v17;
            double v32 = _hitTestInsets(v11, v17, v29, v65, MinX);
            -[UIView setHitTestInsets:](v11, "setHitTestInsets:", 0.0, v32, 0.0, v33);
            if (v28)
            {

              uint64_t v28 = 0;
            }
            goto LABEL_25;
          }
          v26 = 0;
LABEL_10:
          BOOL v17 = 0;
          if (!v11)
          {
            v66 = 0;
            uint64_t v28 = 1;
            goto LABEL_26;
          }
          goto LABEL_11;
        }
      }
      else
      {
        BOOL v17 = 0;
      }
      int v65 = [(UIView *)self _shouldReverseLayoutDirection];
      v26 = v17;
      goto LABEL_10;
    }
    if (self->_staticNavBarButton)
    {
      [(UIView *)self bounds];
      CGFloat v18 = v71.origin.x;
      CGFloat v19 = v71.origin.y;
      CGFloat v20 = v71.size.width;
      CGFloat v21 = v71.size.height;
      double v22 = CGRectGetMinX(v71);
      v72.origin.CGFloat x = v18;
      v72.origin.CGFloat y = v19;
      v72.size.CGFloat width = v20;
      v72.size.CGFloat height = v21;
      CGRectGetMaxX(v72);
      double v23 = _hitTestInsets(self->_staticNavBarButton, 0, 0, [(UIView *)self _shouldReverseLayoutDirection], v22);
      -[UIView setHitTestInsets:](self->_staticNavBarButton, "setHitTestInsets:", 0.0, v23, 0.0, v24);
    }
  }
LABEL_74:
}

- (void)_setupTitleView
{
  objc_super v3 = _UINavigationBarCastToAugmentedTitleView(self->_titleView);
  uint64_t v4 = v3;
  if (!v3)
  {
    if (self->_titleView)
    {
      [(_UINavigationBarContentViewLayout *)self->_layout setAugmentedTitleView:0];
      LODWORD(v5) = 1142292480;
      [(_UINavigationBarContentViewLayout *)self->_layout configureWithTitleView:self->_titleView compressionResistancePriority:v5];
LABEL_20:
      -[_UINavigationBarContentViewLayout setTitlePositionAdjustment:](self->_layout, "setTitlePositionAdjustment:", self->_titlePositionAdjustment.horizontal, self->_titlePositionAdjustment.vertical);
      goto LABEL_21;
    }
    NSUInteger v6 = [(NSString *)self->_title length];
    layout = self->_layout;
    v8 = 0;
LABEL_8:
    [(_UINavigationBarContentViewLayout *)layout setAugmentedTitleView:v8];
    if (!v6) {
      goto LABEL_14;
    }
    LODWORD(v9) = 1143930880;
    [(_UINavigationBarContentViewLayout *)self->_layout configureWithTitle:self->_title attributes:self->_titleAttributes compressionResistancePriority:v9];
    v10 = self->_layout;
    if (v10)
    {
      [(_UINavigationBarContentViewLayout *)v10 currentButtonBarLayoutInfo];
      if (!v15[58]) {
        goto LABEL_18;
      }
      v11 = self->_layout;
      if (v11)
      {
        [(_UINavigationBarContentViewLayout *)v11 currentButtonBarLayoutInfo];
        double v12 = 0.0;
        if (v14[57])
        {
LABEL_19:
          [(_UINavigationBarContentViewLayout *)self->_layout setInlineTitleViewAlpha:v12];
          goto LABEL_20;
        }
LABEL_18:
        [(_UINavigationBarContentView *)self _resolvedInlineTitleViewAlpha];
        goto LABEL_19;
      }
      BOOL v13 = v14;
    }
    else
    {
      BOOL v13 = v15;
    }
    v13[2] = 0u;
    v13[3] = 0u;
    _OWORD *v13 = 0u;
    v13[1] = 0u;
    goto LABEL_18;
  }
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  if (![v4 _hideNavigationBarStandardTitle])
  {
    NSUInteger v6 = [(NSString *)self->_title length];
    layout = self->_layout;
    v8 = v4;
    goto LABEL_8;
  }
  [(_UINavigationBarContentViewLayout *)self->_layout setAugmentedTitleView:v4];
LABEL_14:
  [(_UINavigationBarContentViewLayout *)self->_layout configureWithoutTitle];
LABEL_21:
  [(_UINavigationBarContentViewLayout *)self->_layout setTitleMenuProvider:self->_titleMenuProvider];
  [(_UINavigationBarContentViewLayout *)self->_layout setDocumentProperties:self->_documentProperties];
  [(_UINavigationBarContentViewLayout *)self->_layout setRenameHandler:self->_dci_renameHandler];
}

- (void)setInlineTitleViewAlpha:(double)a3
{
  self->_inlineTitleViewAlpha = a3;
  [(_UINavigationBarContentView *)self _resolvedInlineTitleViewAlpha];
  -[_UINavigationBarContentViewLayout setInlineTitleViewAlpha:](self->_layout, "setInlineTitleViewAlpha:");
  layout = self->_layout;
  if (layout)
  {
    [(_UINavigationBarContentViewLayout *)layout currentButtonBarLayoutInfo];
    layout = self->_layout;
    if (BYTE10(v12))
    {
      if (layout)
      {
        [(_UINavigationBarContentViewLayout *)layout currentButtonBarLayoutInfo];
        if (BYTE9(v8)) {
          return;
        }
        layout = self->_layout;
      }
      else
      {
        long long v7 = 0u;
        long long v8 = 0u;
        long long v5 = 0u;
        long long v6 = 0u;
      }
    }
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
  }
  [(_UINavigationBarContentViewLayout *)layout _applyInlineTitleViewAlphaImmediately];
}

- (double)_resolvedInlineTitleViewAlpha
{
  double v3 = 1.0;
  if ([(_UINavigationBarContentView *)self hostedTabBarEnabled]
    && [(_UINavigationBarContentView *)self isHostedTabBarVisible])
  {
    if ([(_UINavigationBarContentView *)self showTitleWithTabBar]) {
      double v3 = 1.0;
    }
    else {
      double v3 = 0.0;
    }
  }
  return v3 * self->_inlineTitleViewAlpha;
}

- (BOOL)hostedTabBarEnabled
{
  return (*(_WORD *)&self->_navigationBarContentViewFlags >> 9) & 1;
}

- (void)updateContentAnimated:(BOOL)a3
{
  layout = self->_layout;
  if (layout)
  {
    BOOL v5 = a3;
    [(_UINavigationBarContentViewLayout *)layout setOverrideHeight:self->_overrideSize];
    [(_UINavigationBarContentViewLayout *)self->_layout setShowTitleWithTabBar:[(_UINavigationBarContentView *)self _showTitleWithTabBar]];
    [(_UINavigationBarContentViewLayout *)self->_layout setUseInlineLargeTitleMetrics:self->_useInlineLargeTitleMetrics];
    if ((*(_WORD *)&self->_navigationBarContentViewFlags & 0x200) != 0) {
      hostedTabBarGuide = self->_hostedTabBarGuide;
    }
    else {
      hostedTabBarGuide = 0;
    }
    [(_UINavigationBarContentViewLayout *)self->_layout setTabBarContentGuide:hostedTabBarGuide];
    [(_UINavigationBarContentView *)self _updateTitleAlignment];
    [(_UINavigationBarContentViewLayout *)self->_layout setInlineSearchBarGroup:self->_inlineSearchBarGroup];
    BOOL v7 = self->_placeInlineSearchBarInCenter
      && [(_UINavigationBarContentViewLayout *)self->_layout titleAlignment] == 1;
    [(_UINavigationBarContentViewLayout *)self->_layout setPlaceInlineSearchBarInCenter:v7];
    [(_UINavigationBarContentView *)self _setupTitleView];
    [(_UINavigationBarContentView *)self _setupStaticNavBarButtonAnimated:v5];
    [(_UINavigationBarContentView *)self _setupBackButton];
    [(_UINavigationBarContentView *)self _setupLeadingButtonBarAnimated:0];
    [(_UINavigationBarContentView *)self _setupCenterButtonBar];
    [(_UINavigationBarContentView *)self _setupTrailingButtonBarAnimated:0];
    [(_UINavigationBarContentViewLayout *)self->_layout setCustomizationIdentifier:self->_customizationIdentifier];
    [(_UINavigationBarContentViewLayout *)self->_layout updateAlphas];
    [(_UINavigationBarContentView *)self _updateLayoutMarginsForLayout:self->_layout];
    [(_UINavigationBarContentViewLayout *)self->_layout updateSpacingConstraints];
    [(_UINavigationBarContentViewLayout *)self->_layout updateBackButtonGeometry];
    long long v8 = [(_UINavigationBarContentViewLayout *)self->_layout augmentedTitleView];
    [v8 _contentDidChange];

    [(_UINavigationBarContentView *)self _runAllScheduledAnimations:v5];
    [(_UINavigationBarContentView *)self _setAssistants];
  }
}

- (BOOL)isNavItemContentLayoutGuideFlushTrailing
{
  double v3 = [(NSArray *)self->_navItemContentLayoutGuideHorizEdgeConstraints lastObject];
  uint64_t v4 = (_UINavigationBarContentView *)(id)[v3 secondItem];
  if (v3) {
    BOOL v5 = v4 == self;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)isNavItemContentLayoutGuideFlushLeading
{
  double v3 = [(NSArray *)self->_navItemContentLayoutGuideHorizEdgeConstraints firstObject];
  uint64_t v4 = (_UINavigationBarContentView *)(id)[v3 secondItem];
  if (v3) {
    BOOL v5 = v4 == self;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)hasLeadingInsetFromTideBar
{
  return self->_hasLeadingInsetFromTideBar;
}

- (void)_updateTitleAlignment
{
  if ([(_UINavigationBarContentView *)self _useLeadingAlignedTitle]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = *((unsigned char *)&self->_navigationBarContentViewFlags + 1) & 2;
  }
  layout = self->_layout;
  [(_UINavigationBarContentViewLayout *)layout setTitleAlignment:v3];
}

- (BOOL)_showTitleWithTabBar
{
  if (self->_showTitleWithTabBar)
  {
    if (self->_hostedTabBarVisibilityAffectsTitle) {
      return self->_isHostedTabBarVisible;
    }
    return 1;
  }
  if (self->_titleMenuProvider) {
    return 1;
  }
  titleView = self->_titleView;
  if (!titleView) {
    return 0;
  }
  BOOL v6 = _UINavigationBarCastToAugmentedTitleView(titleView);
  BOOL v7 = v6;
  if (v6)
  {
    if ([v6 _navigationBarHeightShouldBeIncreasedByTabBarHeight]) {
      BOOL v3 = !self->_useInlineLargeTitleMetrics;
    }
    else {
      BOOL v3 = 0;
    }
  }
  else
  {
    BOOL v3 = 1;
  }

  return v3;
}

- (void)_setupTrailingButtonBarAnimated:(BOOL)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(NSArray *)self->_trailingBarButtonItems count]
    || [(NSArray *)self->_trailingBarGroups count]
    || self->_fixedTrailingGroup != 0;
  BOOL v5 = [(_UINavigationBarContentViewLayout *)self->_layout trailingSearchBarGroup];
  if (v5) {
    int v6 = ![(UIBarButtonItemGroup *)self->_inlineSearchBarGroup isHidden];
  }
  else {
    int v6 = 0;
  }
  if (((v4 | v6) & 1) != 0 || self->_additionalItems || _UIBarsDesktopNavigationBarEnabled())
  {
    BOOL v7 = [(_UINavigationBarContentViewLayout *)self->_layout augmentedTitleView];
    long long v8 = v7;
    if (v7) {
      uint64_t v9 = [v7 _hideNavigationBarTrailingBarButtons] ^ 1;
    }
    else {
      uint64_t v9 = 1;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  [(_UINavigationBarContentViewLayout *)self->_layout setTrailingGroupsEnabled:v9];
  p_trailingBarGroups = &self->_trailingBarGroups;
  if ([(NSArray *)self->_trailingBarGroups count])
  {
    long long v11 = *p_trailingBarGroups;
  }
  else if ([(NSArray *)self->_trailingBarButtonItems count])
  {
    long long v12 = [UIBarButtonItemGroup alloc];
    BOOL v13 = [(NSArray *)self->_trailingBarButtonItems reverseObjectEnumerator];
    v14 = [v13 allObjects];
    uint64_t v15 = [(UIBarButtonItemGroup *)v12 initWithBarButtonItems:v14 representativeItem:0];
    v19[0] = v15;
    long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];

    objc_storeStrong((id *)p_trailingBarGroups, v11);
  }
  else
  {
    long long v11 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  [(_UINavigationBarContentViewLayout *)self->_layout setTrailingGroups:v11];
  [(_UINavigationBarContentViewLayout *)self->_layout setFixedTrailingGroup:self->_fixedTrailingGroup];
  double v16 = [(_UINavigationBarContentViewLayout *)self->_layout additionalOverflowItems];

  additionalItems = self->_additionalItems;
  [(_UINavigationBarContentViewLayout *)self->_layout setAdditionalOverflowItems:additionalItems];
  if (v9)
  {
    CGFloat v18 = [(_UINavigationBarContentViewLayout *)self->_layout trailingBar];
    [v18 _confirmOwnershipOfFixedGroups];
  }
  if ((v16 == 0) == (additionalItems != 0)) {
    [(UIView *)self setNeedsLayout];
  }
}

- (void)_setupLeadingButtonBarAnimated:(BOOL)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_leadingBarButtonItems count]
    || [(NSArray *)self->_leadingBarGroups count]
    || self->_enableAlternatePopItem)
  {
    BOOL v4 = [(_UINavigationBarContentViewLayout *)self->_layout augmentedTitleView];
    BOOL v5 = v4;
    if (v4) {
      unsigned int v6 = [v4 _hideNavigationBarLeadingBarButtons] ^ 1;
    }
    else {
      unsigned int v6 = 1;
    }
  }
  else
  {
    unsigned int v6 = 0;
  }
  [(_UINavigationBarContentViewLayout *)self->_layout setLeadingGroupsMode:v6];
  p_leadingBarGroups = &self->_leadingBarGroups;
  if ([(NSArray *)self->_leadingBarGroups count])
  {
    long long v8 = *p_leadingBarGroups;
  }
  else if ([(NSArray *)self->_leadingBarButtonItems count])
  {
    uint64_t v9 = [[UIBarButtonItemGroup alloc] initWithBarButtonItems:self->_leadingBarButtonItems representativeItem:0];
    v18[0] = v9;
    long long v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];

    objc_storeStrong((id *)p_leadingBarGroups, v8);
  }
  else
  {
    long long v8 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  [(_UINavigationBarContentViewLayout *)self->_layout setLeadingGroups:v8];
  [(_UINavigationBarContentViewLayout *)self->_layout setEnableAlternatePopItem:self->_enableAlternatePopItem];
  layout = self->_layout;
  if (v6)
  {
    long long v11 = [(_UINavigationBarContentViewLayout *)layout leadingBar];
    long long v12 = [v11 leadingVisibleItem];
    uint64_t v13 = [v12 _showsChevron];

    if (v13) {
      double v14 = 8.0;
    }
    else {
      double v14 = 0.0;
    }
    uint64_t v15 = [(_UINavigationBarContentViewLayout *)self->_layout leadingBar];
    double v16 = [v15 view];
    objc_msgSend(v16, "setDirectionalLayoutMargins:", 0.0, 0.0, 0.0, v14);

    layout = self->_layout;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v17 = 0;
  }
  [(_UINavigationBarContentViewLayout *)layout setHasFakedBackButton:v17];
}

- (void)_setupCenterButtonBar
{
  int64_t v3 = [(_UINavigationBarContentView *)self _effectiveToolbarStyle];
  id v11 = [(_UINavigationBarContentViewLayout *)self->_layout centerSearchBarGroup];
  if (v11) {
    int v4 = ![(UIBarButtonItemGroup *)self->_inlineSearchBarGroup isHidden];
  }
  else {
    int v4 = 0;
  }
  if ([(NSArray *)self->_centerBarGroups count]) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (v5
    || ([(_UINavigationBarContentViewLayout *)self->_layout augmentedTitleView],
        (unsigned int v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && (BOOL v7 = v6, v8 = [v6 _hideNavigationBarCenterBarButtons], v7, (v8 & 1) != 0))
  {
    uint64_t v9 = 0;
  }
  else if (v3)
  {
    if ((*(_WORD *)&self->_navigationBarContentViewFlags & 0x200) != 0) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 1;
    }
  }
  else
  {
    uint64_t v9 = 2;
  }
  [(_UINavigationBarContentViewLayout *)self->_layout setCenterGroupsMode:v9];
  if (self->_centerBarGroups) {
    centerBarGroups = self->_centerBarGroups;
  }
  else {
    centerBarGroups = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  [(_UINavigationBarContentViewLayout *)self->_layout setCenterBarGroups:centerBarGroups];
}

- (BOOL)_useLeadingAlignedTitle
{
  int64_t v3 = [(_UINavigationBarContentView *)self _effectiveToolbarStyle];
  visualProvider = self->_visualProvider;
  unint64_t v5 = v3 - 1;
  if (visualProvider) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = v5 >= 2;
  }
  BOOL v7 = !v6;
  if (visualProvider) {
    BOOL v8 = v5 >= 2;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8) {
    return v7;
  }
  BOOL allowLeadingAlignedLargeTitle = self->_allowLeadingAlignedLargeTitle;
  int64_t toolbarStyle = self->_toolbarStyle;
  return [(_UINavigationBarContentViewVisualProvider *)visualProvider useLeadingAlignedLargeTitle:allowLeadingAlignedLargeTitle toolbarStyle:toolbarStyle];
}

- (int64_t)effectiveStyleForStyle:(int64_t)a3
{
  if (a3 == -1) {
    int64_t v3 = 0;
  }
  else {
    int64_t v3 = a3;
  }
  if ((unint64_t)(v3 - 1) <= 1)
  {
    unint64_t v5 = [(UIView *)self traitCollection];
    uint64_t v6 = [v5 horizontalSizeClass];

    if (v6 == 1) {
      return 0;
    }
    else {
      return a3;
    }
  }
  return v3;
}

- (int64_t)_effectiveToolbarStyle
{
  return [(_UINavigationBarContentView *)self effectiveStyleForStyle:self->_toolbarStyle];
}

- (void)_setupBackButton
{
  if (self->_backAction) {
    goto LABEL_2;
  }
  backActionItem = self->_backActionItem;
  self->_backActionItem = 0;

  if ([(NSArray *)self->_leadingBarButtonItems count]) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = [(NSArray *)self->_leadingBarGroups count] == 0;
  }
  if (self->_backButtonItem && !self->_backButtonHidden)
  {
    uint64_t v9 = [(_UINavigationBarContentViewLayout *)self->_layout augmentedTitleView];
    int v10 = [v9 _hideNavigationBarBackButton];
    if ((v10 | v8))
    {
      int v11 = v10;

      if (v11) {
        goto LABEL_14;
      }
    }
    else
    {
      BOOL leadingItemsSupplementBackItem = self->_leadingItemsSupplementBackItem;

      if (!leadingItemsSupplementBackItem) {
        goto LABEL_14;
      }
    }
LABEL_2:
    uint64_t v3 = [(_UINavigationBarContentViewLayout *)self->_layout backButton];
    if (!v3)
    {
      int v4 = [(UIView *)self traitCollection];
      unint64_t v5 = +[_UIButtonBarButtonVisualProvider visualProviderForIdiom:](_UIButtonBarButtonVisualProvider, "visualProviderForIdiom:", [v4 userInterfaceIdiom]);

      id v14 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend(v5, "buttonBarButtonClass")), "initWithVisualProvider:", v5);
      [v14 addTarget:self action:sel___backButtonAction_ forControlEvents:0x2000];
      LODWORD(v6) = 1143111680;
      [v14 setContentCompressionResistancePriority:0 forAxis:v6];
      objc_msgSend(v14, "setSpringLoaded:", +[UIDragInteraction isEnabledByDefault](UIDragInteraction, "isEnabledByDefault"));
      [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(_UINavigationBarContentViewLayout *)self->_layout setBackButton:v14];

      uint64_t v3 = (uint64_t)v14;
    }
    id v15 = (id)v3;
    [(_UINavigationBarContentView *)self _configureBackButton:v3];
    [(_UINavigationBarContentViewLayout *)self->_layout setMinimumBackButtonWidth:_minimumBackButtonWidth(self)];
    [(UIBarButtonItem *)self->_backButtonItem _setViewOwner:self];

    return;
  }
LABEL_14:
  layout = self->_layout;
  [(_UINavigationBarContentViewLayout *)layout setBackButton:0];
}

- (void)_runAllScheduledAnimations:(BOOL)a3
{
  BOOL v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58___UINavigationBarContentView__runAllScheduledAnimations___block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  aBlock[4] = self;
  unint64_t v5 = (void (**)(void))_Block_copy(aBlock);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58___UINavigationBarContentView__runAllScheduledAnimations___block_invoke_2;
  v7[3] = &unk_1E52DC3A0;
  v7[4] = self;
  double v6 = (void (**)(void *, uint64_t))_Block_copy(v7);
  if (v3)
  {
    +[UIView animateWithDuration:v5 animations:v6 completion:0.2];
  }
  else
  {
    v5[2](v5);
    v6[2](v6, 1);
  }
}

- (void)setAdditionalItems:(id)a3
{
}

- (void)setWantsHostedTabBarMetrics:(BOOL)a3
{
}

- (void)setUseInlineLargeTitleMetrics:(BOOL)a3
{
  self->_useInlineLargeTitleMetrics = a3;
}

- (void)setToolbarStyle:(int64_t)a3
{
  self->_int64_t toolbarStyle = a3;
}

- (void)setTitleView:(id)a3
{
}

- (void)setTitlePositionAdjustment:(UIOffset)a3
{
  self->_titlePositionAdjustment = a3;
}

- (void)setTitleMenuProvider:(id)a3
{
}

- (void)setTitleAttributes:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (void)setShowTitleWithTabBar:(BOOL)a3
{
  self->_showTitleWithTabBar = a3;
}

- (void)setPlaceInlineSearchBarInCenter:(BOOL)a3
{
  self->_placeInlineSearchBarInCenter = a3;
}

- (void)setOverrideSize:(double)a3
{
  self->_overrideSize = a3;
}

- (void)setLeadingItemsSupplementBackItem:(BOOL)a3
{
  self->_BOOL leadingItemsSupplementBackItem = a3;
}

- (void)setIsHostedTabBarVisible:(BOOL)a3
{
  self->_isHostedTabBarVisible = a3;
}

- (void)setInlineSearchBarGroup:(id)a3
{
}

- (void)setHostedTabBarVisibilityAffectsTitle:(BOOL)a3
{
  self->_hostedTabBarVisibilityAffectsTitle = a3;
}

- (void)setHostedTabBarFrame:(CGRect)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52___UINavigationBarContentView_setHostedTabBarFrame___block_invoke;
  v3[3] = &__block_descriptor_64_e17_v16__0__NSArray_8l;
  CGRect v4 = a3;
  [(_UINavigationBarContentView *)self _ensureHostedTabBarConstraintsWithUpdateBlock:v3];
}

- (void)setHostedTabBarEnabled:(BOOL)a3
{
  __int16 navigationBarContentViewFlags = (__int16)self->_navigationBarContentViewFlags;
  if (((((navigationBarContentViewFlags & 0x200) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 512;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 navigationBarContentViewFlags = navigationBarContentViewFlags & 0xFDFF | v4;
    [(_UINavigationBarContentView *)self _ensureHostedTabBarConstraintsWithUpdateBlock:0];
  }
}

- (void)setHasLeadingInsetFromTideBar:(BOOL)a3
{
  self->_hasLeadingInsetFromTideBar = a3;
}

- (void)setFixedTrailingGroup:(id)a3
{
}

- (void)setEnableAlternatePopItem:(BOOL)a3
{
  self->_enableAlternatePopItem = a3;
}

- (void)setDocumentProperties:(id)a3
{
}

- (void)setCustomizationIdentifier:(id)a3
{
}

- (void)setCenterBarGroups:(id)a3
{
}

- (void)setBarMetrics:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int64_t v3 = 1;
  if (a3 == 101) {
    int64_t v4 = 0;
  }
  else {
    int64_t v4 = a3;
  }
  if (a3 != 102) {
    int64_t v3 = v4;
  }
  if (self->_barMetrics != v3)
  {
    self->_barMetrics = v3;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    double v6 = self->_leadingBarButtonItems;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * v10++) _updateView];
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v8);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    int v11 = self->_trailingBarButtonItems;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "_updateView", (void)v16);
        }
        while (v13 != v15);
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v13);
    }

    [(_UINavigationBarContentViewLayout *)self->_layout setRequestedContentSize:[(_UINavigationBarContentView *)self _currentContentSize]];
  }
}

- (void)setBackButtonItem:(id)a3
{
  unint64_t v5 = (UIBarButtonItem *)a3;
  p_backButtonItem = &self->_backButtonItem;
  if (*p_backButtonItem != v5)
  {
    uint64_t v7 = v5;
    [(UIBarButtonItem *)*p_backButtonItem _setViewOwner:0];
    objc_storeStrong((id *)p_backButtonItem, a3);
    unint64_t v5 = v7;
  }
}

- (void)setBackButtonHidden:(BOOL)a3
{
  self->_backButtonHidden = a3;
}

- (void)setBackAction:(id)a3
{
}

- (void)setAllowLeadingAlignedLargeTitle:(BOOL)a3
{
  self->_BOOL allowLeadingAlignedLargeTitle = a3;
}

- (void)dci_setRenameHandler:(id)a3
{
}

- (void)_setBackButtonMaximumWidth:(double)a3
{
}

- (void)setLeadingBarGroups:(id)a3
{
}

- (void)setLeadingBarButtonItems:(id)a3
{
}

- (void)setTrailingBarGroups:(id)a3
{
}

- (void)setTrailingBarButtonItems:(id)a3
{
}

- (void)setPlainItemAppearance:(id)a3
{
}

- (void)setDoneItemAppearance:(id)a3
{
}

- (void)setBackButtonAppearance:(id)a3
{
}

- (NSArray)trailingBarGroups
{
  return self->_trailingBarGroups;
}

- (NSArray)leadingBarGroups
{
  return self->_leadingBarGroups;
}

- (unint64_t)edgesPaddingBarButtonItem:(id)a3
{
  id v4 = a3;
  visualProvider = self->_visualProvider;
  if (visualProvider)
  {
    unint64_t v6 = [(_UINavigationBarContentViewVisualProvider *)visualProvider edgesPaddingBarButtonItem:v4];
  }
  else
  {
    uint64_t v7 = self->_layout;
    if (!v7)
    {
      transitionContext = self->_transitionContext;
      if (transitionContext)
      {
        uint64_t v9 = [(_UINavigationBarTransitionContext *)transitionContext toLayout];
        uint64_t v10 = (void *)v9;
        if (v9) {
          int v11 = *(void **)(v9 + 160);
        }
        else {
          int v11 = 0;
        }
        uint64_t v7 = v11;
      }
      else
      {
        uint64_t v7 = 0;
      }
    }
    id v12 = [(_UINavigationBarContentViewLayout *)v7 leadingVisibleItem];

    if (v12 == v4) {
      uint64_t v13 = 13;
    }
    else {
      uint64_t v13 = 15;
    }
    id v14 = [(_UINavigationBarContentViewLayout *)v7 trailingVisibleItem];

    if (v14 == v4) {
      unint64_t v6 = v13 & 7;
    }
    else {
      unint64_t v6 = v13;
    }
  }
  return v6;
}

- (void)_updateLayoutMarginsForLayout:(id)a3
{
  id v32 = a3;
  [(UIView *)self directionalLayoutMargins];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(_UINavigationBarContentView *)self defaultEdgeSpacing];
  double v13 = v12;
  id v14 = [v32 leadingVisibleItem];
  uint64_t v15 = [v32 trailingVisibleItem];
  int v16 = [v14 isCustomViewItem];
  int v17 = [v15 isCustomViewItem];
  char v18 = v17;
  double v19 = 0.0;
  if (v16) {
    double v20 = 0.0;
  }
  else {
    double v20 = v13;
  }
  double v21 = v7 - v20;
  if (!v17) {
    double v19 = v13;
  }
  double v22 = v11 - v19;
  [v32 layoutMargins];
  BOOL v29 = v21 == v26 && v5 == v23 && v22 == v25 && v9 == v24;
  if (!v29 || [v32 hasFakedBackButton])
  {
    objc_msgSend(v32, "setLayoutMargins:", v5, v21, v9, v22);
    if ((v16 & 1) == 0)
    {
      double v30 = [v14 _viewOwner];
      [v30 _itemStandardViewNeedsUpdate:v14];
    }
    if ((v18 & 1) == 0)
    {
      uint64_t v31 = [v15 _viewOwner];
      [v31 _itemStandardViewNeedsUpdate:v15];
    }
  }
}

- (double)defaultEdgeSpacing
{
  BOOL v2 = [(UIView *)self traitCollection];
  [v2 userInterfaceIdiom];

  return 8.0;
}

- (void)_setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarContentView;
  -[UIView setDirectionalLayoutMargins:](&v3, sel_setDirectionalLayoutMargins_, a3.top, a3.leading, a3.bottom, a3.trailing);
}

- (BOOL)compactMetrics
{
  unint64_t v2 = self->_requestedContentSize - 1;
  if (v2 >= 3) {
    return self->_barMetrics == 1;
  }
  else {
    return (v2 & 7) == 0;
  }
}

- (_UINavigationBarContentViewLayout)layout
{
  return self->_layout;
}

- (_UIPointerInteractionAssistant)assistant
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assistant);
  return (_UIPointerInteractionAssistant *)WeakRetained;
}

- (void)setStaticNavBarButtonTrailing:(BOOL)a3
{
  self->_BOOL staticNavBarButtonTrailing = a3;
}

- (void)setStaticNavBarButtonItem:(id)a3
{
  id v5 = a3;
  staticNavBarButtonItem = self->_staticNavBarButtonItem;
  id v7 = v5;
  if (v5)
  {
    if ([v5 isEqual:staticNavBarButtonItem]) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (staticNavBarButtonItem)
  {
LABEL_3:
    objc_storeStrong((id *)&self->_staticNavBarButtonItem, a3);
    [(_UINavigationBarContentView *)self setNeedsStaticNavBarButtonUpdate];
  }
LABEL_4:
}

- (void)setDelegate:(id)a3
{
}

- (void)setAssistant:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assistant);

  if (WeakRetained != obj)
  {
    [(_UINavigationBarContentView *)self _clearAssistants];
    objc_storeWeak((id *)&self->_assistant, obj);
    [(_UINavigationBarContentView *)self _setAssistants];
  }
}

- (_UINavigationBarContentView)initWithFrame:(CGRect)a3 visualProvider:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_UINavigationBarContentView;
  double v11 = -[_UIBarContentView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  double v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_visualProvider, a4);
    uint64_t v13 = [(_UINavigationBarContentView *)v12 _newLayout];
    layout = v12->_layout;
    v12->_layout = (_UINavigationBarContentViewLayout *)v13;

    [(_UINavigationBarContentViewLayout *)v12->_layout setActive:1 contentView:v12];
    [(UIView *)v12 _setHostsLayoutEngine:1];
    uint64_t v15 = objc_opt_new();
    currentAnimations = v12->_currentAnimations;
    v12->_currentAnimations = (NSMutableArray *)v15;

    uint64_t v17 = objc_opt_new();
    currentCompletions = v12->_currentCompletions;
    v12->_currentCompletions = (NSMutableArray *)v17;
  }
  return v12;
}

- (id)_newLayout
{
  objc_super v3 = [[_UINavigationBarContentViewLayout alloc] initWithContentView:self];
  [(_UINavigationBarContentViewLayout *)v3 setMinimumBackButtonWidth:_minimumBackButtonWidth(self)];
  [(_UINavigationBarContentViewLayout *)v3 setRequestedContentSize:[(_UINavigationBarContentView *)self _currentContentSize]];
  [(_UINavigationBarContentView *)self _updateLayoutMarginsForLayout:v3];
  return v3;
}

- (int64_t)_currentContentSize
{
  int64_t requestedContentSize = self->_requestedContentSize;
  if (!requestedContentSize)
  {
    int64_t requestedContentSize = self->_barMetrics;
    if (requestedContentSize != 1)
    {
      objc_super v3 = [(UIView *)self traitCollection];
      uint64_t v4 = [v3 _presentationSemanticContext];

      int64_t requestedContentSize = 2;
      if (v4 == 2) {
        return 3;
      }
    }
  }
  return requestedContentSize;
}

- (void)_clearAssistants
{
  p_assistant = &self->_assistant;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assistant);
  [WeakRetained setAssistedView:0 identifier:@"ContentView.staticButton"];

  id v5 = objc_loadWeakRetained((id *)p_assistant);
  [v5 setAssistedView:0 identifier:@"ContentView.backButton"];

  double v6 = [(_UINavigationBarContentViewLayout *)self->_layout leadingBar];
  [v6 setAssistant:0];

  id v7 = objc_loadWeakRetained((id *)p_assistant);
  [v7 setAssistedView:0 identifier:@"ContentView.leadingBar"];

  double v8 = [(_UINavigationBarContentViewLayout *)self->_layout centerBar];
  [v8 setAssistant:0];

  id v9 = objc_loadWeakRetained((id *)p_assistant);
  [v9 setAssistedView:0 identifier:@"ContentView.centerBar"];

  id v10 = [(_UINavigationBarContentViewLayout *)self->_layout trailingBar];
  [v10 setAssistant:0];

  id v11 = objc_loadWeakRetained((id *)p_assistant);
  [v11 setAssistedView:0 identifier:@"ContentView.trailingBar"];

  id v12 = objc_loadWeakRetained((id *)p_assistant);
  [v12 setAssistedView:0 identifier:@"ContentView.title"];
}

- (void)_setAssistants
{
  p_assistant = &self->_assistant;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assistant);
  [WeakRetained setAssistedView:self->_staticNavBarButton identifier:@"ContentView.staticButton"];

  id v5 = objc_loadWeakRetained((id *)p_assistant);
  double v6 = [(_UINavigationBarContentViewLayout *)self->_layout backButton];
  [v5 setAssistedView:v6 identifier:@"ContentView.backButton"];

  id v7 = objc_loadWeakRetained((id *)p_assistant);
  double v8 = [(_UINavigationBarContentViewLayout *)self->_layout leadingBar];
  [v8 setAssistant:v7];

  id v9 = objc_loadWeakRetained((id *)p_assistant);
  id v10 = [(_UINavigationBarContentViewLayout *)self->_layout leadingBar];
  id v11 = [v10 assistantView];
  [v9 setAssistedView:v11 identifier:@"ContentView.leadingBar"];

  id v12 = objc_loadWeakRetained((id *)p_assistant);
  uint64_t v13 = [(_UINavigationBarContentViewLayout *)self->_layout centerBar];
  [v13 setAssistant:v12];

  id v14 = objc_loadWeakRetained((id *)p_assistant);
  uint64_t v15 = [(_UINavigationBarContentViewLayout *)self->_layout centerBar];
  int v16 = [v15 assistantView];
  [v14 setAssistedView:v16 identifier:@"ContentView.centerBar"];

  id v17 = objc_loadWeakRetained((id *)p_assistant);
  char v18 = [(_UINavigationBarContentViewLayout *)self->_layout trailingBar];
  [v18 setAssistant:v17];

  id v19 = objc_loadWeakRetained((id *)p_assistant);
  objc_super v20 = [(_UINavigationBarContentViewLayout *)self->_layout trailingBar];
  double v21 = [v20 assistantView];
  [v19 setAssistedView:v21 identifier:@"ContentView.trailingBar"];

  id v23 = objc_loadWeakRetained((id *)p_assistant);
  double v22 = [(_UINavigationBarContentViewLayout *)self->_layout titleControl];
  [v23 setAssistedView:v22 identifier:@"ContentView.title"];
}

- (void)setRequestedContentSize:(int64_t)a3
{
  int64_t v5 = [(_UINavigationBarContentView *)self barMetrics];
  if (self->_requestedContentSize != a3)
  {
    int64_t v6 = v5;
    self->_int64_t requestedContentSize = a3;
    [(_UINavigationBarContentViewLayout *)self->_layout setRequestedContentSize:[(_UINavigationBarContentView *)self _currentContentSize]];
    if (v6 != [(_UINavigationBarContentView *)self barMetrics])
    {
      [(_UINavigationBarContentView *)self _appearanceChanged];
    }
  }
}

- (int64_t)barMetrics
{
  return self->_barMetrics;
}

- (void)_ensureHostedTabBarConstraintsWithUpdateBlock:(id)a3
{
  v22[4] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void))a3;
  int64_t v5 = &OBJC_IVAR____UIAlertControllerTextFieldViewCollectionCell__selectButtonGesture;
  if (!self->_hostedTabBarGuide)
  {
    int64_t v6 = objc_alloc_init(UILayoutGuide);
    hostedTabBarGuide = self->_hostedTabBarGuide;
    self->_hostedTabBarGuide = v6;

    double v8 = objc_msgSend(NSString, "stringWithFormat:", @"TabBarGuide(%p)", self);
    [(UILayoutGuide *)self->_hostedTabBarGuide setIdentifier:v8];

    double v21 = [(UILayoutGuide *)self->_hostedTabBarGuide leftAnchor];
    objc_super v20 = [(UIView *)self leftAnchor];
    id v19 = [v21 constraintEqualToAnchor:v20];
    v22[0] = v19;
    id v9 = [(UILayoutGuide *)self->_hostedTabBarGuide topAnchor];
    id v10 = [(UIView *)self topAnchor];
    id v11 = [v9 constraintEqualToAnchor:v10];
    v22[1] = v11;
    id v12 = [(UILayoutGuide *)self->_hostedTabBarGuide widthAnchor];
    uint64_t v13 = [v12 constraintEqualToConstant:0.0];
    v22[2] = v13;
    id v14 = [(UILayoutGuide *)self->_hostedTabBarGuide heightAnchor];
    uint64_t v15 = [v14 constraintEqualToConstant:0.0];
    v22[3] = v15;
    int v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
    hostedTabBarConstraints = self->_hostedTabBarConstraints;
    self->_hostedTabBarConstraints = v16;

    int64_t v5 = &OBJC_IVAR____UIAlertControllerTextFieldViewCollectionCell__selectButtonGesture;
  }
  if (v4) {
    v4[2](v4, *(Class *)((char *)&self->super.super.super.super.isa + v5[714]));
  }
  if ((*(_WORD *)&self->_navigationBarContentViewFlags & 0x200) != 0)
  {
    [(UIView *)self addLayoutGuide:self->_hostedTabBarGuide];
    [MEMORY[0x1E4F5B268] activateConstraints:*(Class *)((char *)&self->super.super.super.super.isa + v5[714])];
    char v18 = self->_hostedTabBarGuide;
  }
  else
  {
    char v18 = 0;
  }
  [(_UINavigationBarContentViewLayout *)self->_layout setTabBarContentGuide:v18];
}

- (double)backButtonMargin
{
  [(UIView *)self _contentMargin];
  double v4 = v3;
  double result = 0.0;
  if (v4 > 0.0)
  {
    double v6 = 0.0;
    if (!self->_hasLeadingInsetFromTideBar
      && (![(UIBarButtonItem *)self->_staticNavBarButtonItem _isFloatable]
       || [(UIBarButtonItem *)self->_staticNavBarButtonItem isHidden]))
    {
      [(UIView *)self safeAreaInsets];
      double v6 = v7;
      double v9 = v8;
      if ([(UIView *)self effectiveUserInterfaceLayoutDirection]) {
        double v6 = v9;
      }
    }
    return v4 + -8.0 + v6;
  }
  return result;
}

- (int64_t)toolbarStyle
{
  return self->_toolbarStyle;
}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_UINavigationBarContentView;
  int64_t v5 = [(UIView *)&v23 _traitCollectionForChildEnvironment:v4];
  layout = self->_layout;
  if (layout)
  {
    id v7 = [(_UINavigationBarContentViewLayout *)layout traitOverridesForChild:v4];
  }
  else
  {
    transitionContext = self->_transitionContext;
    if (!transitionContext)
    {
      id v15 = v5;
      goto LABEL_15;
    }
    uint64_t v9 = [(_UINavigationBarTransitionContext *)transitionContext toLayout];
    id v10 = (void *)v9;
    if (v9) {
      id v11 = *(void **)(v9 + 160);
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;
    uint64_t v13 = [v12 traitOverridesForChild:v4];
    id v14 = v13;
    if (v13)
    {
      id v7 = v13;
    }
    else
    {
      uint64_t v16 = [(_UINavigationBarTransitionContext *)self->_transitionContext fromLayout];
      id v17 = (void *)v16;
      if (v16) {
        char v18 = *(void **)(v16 + 160);
      }
      else {
        char v18 = 0;
      }
      id v19 = v18;
      id v7 = [v19 traitOverridesForChild:v4];
    }
  }
  id v20 = v5;
  id v15 = v20;
  if (v7)
  {
    uint64_t v21 = -[UITraitCollection _traitCollectionByApplyingOverrides:defaultValueOverrides:](v20, (uint64_t)v7, 0);

    id v15 = (id)v21;
  }
LABEL_15:

  return v15;
}

- (void)tintColorDidChange
{
  [(_UINavigationBarContentView *)self _appearanceChanged];
  id v3 = [(_UINavigationBarContentView *)self delegate];
  [v3 navigationBarContentViewDidChangeTintColor:self];
}

- (_UINavigationBarContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UINavigationBarContentViewDelegate *)WeakRetained;
}

- (void)_appearanceChanged
{
  id v3 = self->_layout;
  if (v3) {
    goto LABEL_2;
  }
  transitionContext = self->_transitionContext;
  if (!transitionContext) {
    goto LABEL_9;
  }
  uint64_t v9 = [(_UINavigationBarTransitionContext *)transitionContext toLayout];
  id v10 = (void *)v9;
  id v11 = v9 ? *(void **)(v9 + 160) : 0;
  uint64_t v13 = v11;

  id v3 = v13;
  if (v13)
  {
LABEL_2:
    id v12 = v3;
    id v4 = [(_UINavigationBarContentViewLayout *)v3 backButton];
    if (v4) {
      [(_UINavigationBarContentView *)self _configureBackButton:v4];
    }
    int64_t v5 = [(_UINavigationBarContentViewLayout *)v12 leadingBar];
    [v5 _appearanceChanged];

    double v6 = [(_UINavigationBarContentViewLayout *)v12 trailingBar];
    [v6 _appearanceChanged];

    id v7 = [(_UINavigationBarContentViewLayout *)v12 centerBar];
    [v7 _appearanceChanged];
  }
  else
  {
LABEL_9:
    id v12 = 0;
  }
  *(_WORD *)&self->_navigationBarContentViewFlags |= 4u;
  [(_UINavigationBarContentView *)self _setupStaticNavBarButtonAnimated:0];
}

- (void)_configureBackButton:(id)a3
{
  id v11 = a3;
  backButtonItem = self->_backButtonItem;
  if (backButtonItem || self->_backAction)
  {
    int64_t v5 = backButtonItem;
    if (self->_backButtonItem || !self->_backAction)
    {
      backActionItem = self->_backActionItem;
      self->_backActionItem = 0;
    }
    else
    {
      id v7 = self->_backActionItem;
      if (v7)
      {
        -[UIBarButtonItem setPrimaryAction:](v7, "setPrimaryAction:");
      }
      else
      {
        double v8 = [[UIBarButtonItem alloc] initWithPrimaryAction:self->_backAction];
        uint64_t v9 = self->_backActionItem;
        self->_backActionItem = v8;
      }
      id v10 = self->_backActionItem;
      backActionItem = v5;
      int64_t v5 = v10;
    }

    if (self->_toolbarStyle == 2) {
      [v11 configureBreadcrumbBackButtonFromBarItem:v5 withAppearanceDelegate:self];
    }
    else {
      [v11 configureBackButtonFromBarItem:v5 withAppearanceDelegate:self];
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UINavigationBarContentView;
  [(UIView *)&v9 traitCollectionDidChange:v4];
  int64_t v5 = [(UIView *)self traitCollection];
  uint64_t v6 = [v5 _presentationSemanticContext];
  if (v6 != [v4 _presentationSemanticContext]) {
    [(_UINavigationBarContentViewLayout *)self->_layout setRequestedContentSize:[(_UINavigationBarContentView *)self _currentContentSize]];
  }
  uint64_t v7 = [v5 userInterfaceIdiom];
  if (v7 != [v4 userInterfaceIdiom]) {
    [(_UINavigationBarContentViewLayout *)self->_layout updateOverflowItemImage];
  }
  uint64_t v8 = [v5 horizontalSizeClass];
  if (v8 != [v4 horizontalSizeClass]) {
    [(_UINavigationBarContentViewLayout *)self->_layout updateRenameForHorizontalSizeClassChangeIfNecessary];
  }
}

- (void)setStaticNavBarButtonLingers:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 navigationBarContentViewFlags = *(_WORD *)&self->_navigationBarContentViewFlags & 0xFF7F | v3;
}

- (id)backIndicatorImage
{
  return self->_backIndicatorImage;
}

- (double)backButtonMaximumWidth
{
  [(_UINavigationBarContentViewLayout *)self->_layout maximumBackButtonWidth];
  return result;
}

- (CGRect)_overlayRectForGuide:(id)a3 inTargetView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 layoutFrame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  uint64_t v16 = [v7 owningView];

  -[_UINavigationBarContentView _overlayRectForFrame:inView:inTargetView:](self, "_overlayRectForFrame:inView:inTargetView:", v16, v6, v9, v11, v13, v15);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  double v25 = v18;
  double v26 = v20;
  double v27 = v22;
  double v28 = v24;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (void)titleView:(id)a3 needsUpdatedContentOverlayRects:(id)a4
{
  id v31 = a3;
  id v6 = a4;
  id v7 = [(_UINavigationBarContentView *)self _layoutForAugmentedTitleView:v31];
  double v8 = v7;
  if (v7)
  {
    double v9 = [v7 backButton];
    [(_UINavigationBarContentView *)self _overlayRectForView:v9 inTargetView:v31];
    objc_msgSend(v6, "setBackButtonRect:");

    double v10 = [v8 leadingBar];
    double v11 = [v10 _viewForOverlayRects];
    [(_UINavigationBarContentView *)self _overlayRectForView:v11 inTargetView:v31];
    objc_msgSend(v6, "setLeadingItemsRect:");

    double v12 = [v8 titleControl];
    [(_UINavigationBarContentView *)self _overlayRectForView:v12 inTargetView:v31];
    objc_msgSend(v6, "setTitleRect:");

    double v13 = [v8 centerBar];
    double v14 = [v13 _viewForOverlayRects];
    [(_UINavigationBarContentView *)self _overlayRectForView:v14 inTargetView:v31];
    objc_msgSend(v6, "setCenterItemsRect:");

    double v15 = [v8 trailingBar];
    uint64_t v16 = [v15 _viewForOverlayRects];
    [(_UINavigationBarContentView *)self _overlayRectForView:v16 inTargetView:v31];
    objc_msgSend(v6, "setTrailingItemsRect:");

    double v17 = [v8 tabBarContentGuide];
    [(_UINavigationBarContentView *)self _overlayRectForGuide:v17 inTargetView:v31];
    objc_msgSend(v6, "setFloatingTabBarRect:");

    staticNavBarButtonItem = self->_staticNavBarButtonItem;
    double v19 = (double *)MEMORY[0x1E4F1DB20];
    if (staticNavBarButtonItem && ![(UIBarButtonItem *)staticNavBarButtonItem _isFloating])
    {
      [(_UINavigationBarContentView *)self _overlayRectForView:self->_staticNavBarButton inTargetView:v31];
      double v20 = v24;
      double v21 = v25;
      double v22 = v26;
      double v23 = v27;
    }
    else
    {
      double v20 = *v19;
      double v21 = v19[1];
      double v22 = v19[2];
      double v23 = v19[3];
    }
    if (self->_staticNavBarButtonTrailing)
    {
      objc_msgSend(v6, "setLeadingStaticItemRect:", *v19, v19[1], v19[2], v19[3]);
    }
    else
    {
      objc_msgSend(v6, "setLeadingStaticItemRect:", v20, v21, v22, v23);
      double v20 = *v19;
      double v21 = v19[1];
      double v22 = v19[2];
      double v23 = v19[3];
    }
    objc_msgSend(v6, "setTrailingStaticItemRect:", v20, v21, v22, v23);
    uint64_t v28 = [v8 titleAlignment];
    switch(v28)
    {
      case 2:
        if ([v8 showTitleWithTabBar])
        {
          double v30 = [v8 tabBarContentGuide];

          if (v30) {
            uint64_t v29 = 3;
          }
          else {
            uint64_t v29 = 0;
          }
          goto LABEL_19;
        }
        break;
      case 1:
        uint64_t v29 = 2;
        goto LABEL_19;
      case 0:
        uint64_t v29 = 1;
LABEL_19:
        [v6 setTitleLocation:v29];
        goto LABEL_20;
    }
    uint64_t v29 = 0;
    goto LABEL_19;
  }
LABEL_20:
}

- (CGRect)_overlayRectForView:(id)a3 inTargetView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 bounds];
  -[_UINavigationBarContentView _overlayRectForFrame:inView:inTargetView:](self, "_overlayRectForFrame:inView:inTargetView:", v7, v6);
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

- (CGRect)_overlayRectForFrame:(CGRect)a3 inView:(id)a4 inTargetView:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  id v11 = a5;
  if (v10
    && (v24.origin.double x = x, v24.origin.y = y, v24.size.width = width, v24.size.height = height, !CGRectIsEmpty(v24)))
  {
    objc_msgSend(v10, "convertRect:toView:", v11, x, y, width, height);
    double v12 = v16;
    double v13 = v17;
    double v14 = v18;
    double v15 = v19;
  }
  else
  {
    double v12 = *MEMORY[0x1E4F1DB20];
    double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v20 = v12;
  double v21 = v13;
  double v22 = v14;
  double v23 = v15;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (id)_layoutForAugmentedTitleView:(id)a3
{
  id v4 = a3;
  int64_t v5 = self->_layout;
  if (!v5)
  {
    uint64_t v6 = [(_UINavigationBarTransitionContext *)self->_transitionContext toLayout];
    id v7 = (void *)v6;
    if (v6) {
      double v8 = *(void **)(v6 + 160);
    }
    else {
      double v8 = 0;
    }
    id v9 = v8;
    id v10 = [v9 augmentedTitleView];

    transitionContext = self->_transitionContext;
    if (v10 == v4)
    {
      uint64_t v17 = [(_UINavigationBarTransitionContext *)transitionContext toLayout];
    }
    else
    {
      uint64_t v12 = [(_UINavigationBarTransitionContext *)transitionContext fromLayout];
      double v13 = (void *)v12;
      if (v12) {
        double v14 = *(void **)(v12 + 160);
      }
      else {
        double v14 = 0;
      }
      id v15 = v14;
      id v16 = [v15 augmentedTitleView];

      if (v16 != v4)
      {
        int64_t v5 = 0;
        goto LABEL_14;
      }
      uint64_t v17 = [(_UINavigationBarTransitionContext *)self->_transitionContext fromLayout];
    }
    double v18 = (void *)v17;
    if (v17) {
      double v19 = *(void **)(v17 + 160);
    }
    else {
      double v19 = 0;
    }
    int64_t v5 = v19;
  }
LABEL_14:

  return v5;
}

- (void)resolvedHeightDidChange
{
  if (self->_layout)
  {
    __int16 navigationBarContentViewFlags = (__int16)self->_navigationBarContentViewFlags;
    if ((navigationBarContentViewFlags & 2) == 0)
    {
      if (navigationBarContentViewFlags)
      {
        *(_WORD *)&self->___int16 navigationBarContentViewFlags = navigationBarContentViewFlags | 2;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __54___UINavigationBarContentView_resolvedHeightDidChange__block_invoke;
        block[3] = &unk_1E52D9F70;
        block[4] = self;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained navigationBarContentViewDidChangeDesiredHeight:self];
      }
    }
  }
}

- (void)updateAugmentedTitleViewNavigationBarTraitsTo:(id)a3 from:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  [(_UINavigationBarContentViewLayout *)self->_layout setAugmentedTitleNavigationBarTraits:v9];
  id v7 = [(_UINavigationBarContentViewLayout *)self->_layout augmentedTitleView];
  double v8 = v7;
  if (v7) {
    [v7 _navigationBarTraitCollectionDidChangeTo:v9 from:v6];
  }
}

- (double)buttonBarMinimumInterItemSpace
{
  unint64_t v2 = [(UIView *)self traitCollection];
  if ([v2 userInterfaceIdiom] == 5) {
    double v3 = 6.0;
  }
  else {
    double v3 = 8.0;
  }

  return v3;
}

- (void)_safeAreaInsetsDidChangeFromOldInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double left = a3.left;
  v12.receiver = self;
  v12.super_class = (Class)_UINavigationBarContentView;
  -[UIView _safeAreaInsetsDidChangeFromOldInsets:](&v12, sel__safeAreaInsetsDidChangeFromOldInsets_, a3.top, a3.left, a3.bottom);
  [(_UINavigationBarContentView *)self _updateLayoutMarginsForLayout:self->_layout];
  [(_UINavigationBarContentViewLayout *)self->_layout updateBackButtonGeometry];
  if ([(_UINavigationBarContentView *)self isAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange]&& ![(_UINavigationBarContentView *)self _backButtonLayoutGuideIncludesFullyHiddenConstant])
  {
    BOOL v6 = [(_UINavigationBarContentView *)self _isStaticNavBarButtonOnRight];
    [(UIView *)self safeAreaInsets];
    double v9 = v8 - left;
    if (v6) {
      double v10 = v7 - right;
    }
    else {
      double v10 = v9;
    }
    [(NSLayoutConstraint *)self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint constant];
    [(NSLayoutConstraint *)self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint setConstant:v10 + v11];
  }
}

- (BOOL)isAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange
{
  return (*(_WORD *)&self->_navigationBarContentViewFlags >> 4) & 1;
}

- (void)setNeedsStaticNavBarButtonUpdate
{
  *(_WORD *)&self->_navigationBarContentViewFlags |= 4u;
  [(_UINavigationBarContentView *)self updateContentAnimated:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveTitleAttributes, 0);
  objc_storeStrong((id *)&self->_additionalItems, 0);
  objc_storeStrong((id *)&self->_backAction, 0);
  objc_storeStrong((id *)&self->_dci_renameHandler, 0);
  objc_storeStrong((id *)&self->_documentProperties, 0);
  objc_storeStrong(&self->_titleMenuProvider, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_destroyWeak((id *)&self->_assistant);
  objc_storeStrong((id *)&self->_titleAttributes, 0);
  objc_storeStrong((id *)&self->_inlineSearchBarGroup, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_fixedTrailingGroup, 0);
  objc_storeStrong((id *)&self->_trailingBarGroups, 0);
  objc_storeStrong((id *)&self->_trailingBarButtonItems, 0);
  objc_storeStrong((id *)&self->_customizationIdentifier, 0);
  objc_storeStrong((id *)&self->_centerBarGroups, 0);
  objc_storeStrong((id *)&self->_leadingBarGroups, 0);
  objc_storeStrong((id *)&self->_leadingBarButtonItems, 0);
  objc_storeStrong((id *)&self->_staticNavBarButtonItem, 0);
  objc_storeStrong((id *)&self->_backButtonItem, 0);
  objc_storeStrong((id *)&self->_visualProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentCompletions, 0);
  objc_storeStrong((id *)&self->_currentAnimations, 0);
  objc_storeStrong((id *)&self->_hostedTabBarConstraints, 0);
  objc_storeStrong((id *)&self->_hostedTabBarGuide, 0);
  objc_storeStrong((id *)&self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint, 0);
  objc_storeStrong((id *)&self->_navItemContentLayoutGuideHorizEdgeConstraints, 0);
  objc_storeStrong((id *)&self->_staticNavBarButtonVerticalAlignmentConstraints, 0);
  objc_storeStrong((id *)&self->_staticNavBarButtonXPositionConstraint, 0);
  objc_storeStrong((id *)&self->_navItemContentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_staticNavBarButton, 0);
  objc_storeStrong((id *)&self->_backActionItem, 0);
  objc_storeStrong((id *)&self->_backIndicatorImage, 0);
}

- (void)titleViewChangedHeight:(id)a3
{
}

- (void)titleViewChangedDisplayItemAlpha:(id)a3
{
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return 0;
}

- (int64_t)currentContentSize
{
  if (self->_layout) {
    return [(_UINavigationBarContentViewLayout *)self->_layout requestedContentSize];
  }
  else {
    return self->_requestedContentSize;
  }
}

- (CGRect)hostedTabBarFrame
{
  [(_UINavigationBarContentView *)self _ensureHostedTabBarConstraintsWithUpdateBlock:0];
  double v3 = [(NSArray *)self->_hostedTabBarConstraints objectAtIndexedSubscript:0];
  [v3 constant];
  double v5 = v4;
  BOOL v6 = [(NSArray *)self->_hostedTabBarConstraints objectAtIndexedSubscript:1];
  [v6 constant];
  double v8 = v7;
  double v9 = [(NSArray *)self->_hostedTabBarConstraints objectAtIndexedSubscript:2];
  [v9 constant];
  double v11 = v10;
  objc_super v12 = [(NSArray *)self->_hostedTabBarConstraints objectAtIndexedSubscript:3];
  [v12 constant];
  double v14 = v13;

  double v15 = v5;
  double v16 = v8;
  double v17 = v11;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (BOOL)wantsHostedTabBarMetrics
{
  return [(_UINavigationBarContentViewLayout *)self->_layout wantsHostedTabBarMetrics];
}

- (void)setShouldFadeStaticNavBarButton:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 navigationBarContentViewFlags = *(_WORD *)&self->_navigationBarContentViewFlags & 0xFFBF | v3;
}

- (BOOL)shouldFadeStaticNavBarButton
{
  return (*(_WORD *)&self->_navigationBarContentViewFlags >> 6) & 1;
}

- (BOOL)staticNavBarButtonLingers
{
  return (*(_WORD *)&self->_navigationBarContentViewFlags >> 7) & 1;
}

- (void)beginAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange
{
  if (self->_staticNavBarButton)
  {
    __int16 navigationBarContentViewFlags = (__int16)self->_navigationBarContentViewFlags;
    if ((navigationBarContentViewFlags & 0x10) == 0)
    {
      *(_WORD *)&self->___int16 navigationBarContentViewFlags = navigationBarContentViewFlags | 0x30;
      [(_UINavigationBarContentView *)self _updateNavItemContentLayoutGuideEdgeConstraints];
    }
  }
}

- (double)navItemContentLayoutGuideAnimationDistance
{
  [(_UINavigationBarContentView *)self _contentLayoutGuideAnimationConstraintConstantForFullyVisibleButton];
  double v4 = v3;
  [(_UINavigationBarContentView *)self _contentLayoutGuideAnimationConstraintConstantForFullyHiddenButton];
  return v4 - v5;
}

- (BOOL)_backButtonLayoutGuideIncludesFullyHiddenConstant
{
  unint64_t v2 = [(_UINavigationBarContentViewLayout *)self->_layout backButtonGuide];
  [v2 layoutFrame];
  BOOL v3 = CGRectGetWidth(v5) != 0.0;

  return v3;
}

- (BOOL)updateNavItemContentLayoutGuideAnimationConstraintConstant:(double)a3
{
  if ((*(_WORD *)&self->_navigationBarContentViewFlags & 0x10) == 0)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"_UINavigationBarContentView.m" lineNumber:384 description:@"Must send -beginAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange first"];
  }
  if (![(_UINavigationBarContentView *)self _backButtonLayoutGuideIncludesFullyHiddenConstant])
  {
    [(_UINavigationBarContentView *)self _contentLayoutGuideAnimationConstraintConstantForFullyHiddenButton];
    a3 = v5 + a3;
  }
  [(NSLayoutConstraint *)self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint constant];
  double v7 = v6;
  [(NSLayoutConstraint *)self->_navItemContentLayoutGuideStaticButtonVisibilityAnimationConstraint setConstant:a3];
  return v7 != a3;
}

- (void)endAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange
{
  __int16 navigationBarContentViewFlags = (__int16)self->_navigationBarContentViewFlags;
  if ((navigationBarContentViewFlags & 0x10) != 0)
  {
    *(_WORD *)&self->___int16 navigationBarContentViewFlags = navigationBarContentViewFlags & 0xFFEF;
    [(_UINavigationBarContentView *)self _updateNavItemContentLayoutGuideEdgeConstraints];
  }
}

- (BOOL)_isStaticNavBarButtonOnRight
{
  return [(UIView *)self _shouldReverseLayoutDirection] ^ self->_staticNavBarButtonTrailing;
}

- (double)_contentLayoutGuideAnimationConstraintConstantForFullyVisibleButton
{
  if ([(_UINavigationBarContentView *)self _isStaticNavBarButtonOnRight])
  {
    [(UIView *)self bounds];
    double MaxX = CGRectGetMaxX(v10);
    [(UIView *)self->_staticNavBarButton frame];
    return MaxX - CGRectGetMinX(v11);
  }
  else
  {
    [(UIView *)self->_staticNavBarButton frame];
    return CGRectGetMaxX(*(CGRect *)&v5);
  }
}

- (double)_contentLayoutGuideAnimationConstraintConstantForFullyHiddenButton
{
  BOOL v3 = [(_UINavigationBarContentViewLayout *)self->_layout backButton];

  double result = 0.0;
  if (!v3)
  {
    BOOL staticNavBarButtonTrailing = self->_staticNavBarButtonTrailing;
    [(_UINavigationBarContentViewLayout *)self->_layout layoutMargins];
    if (staticNavBarButtonTrailing) {
      return v7;
    }
    else {
      return v6;
    }
  }
  return result;
}

- (void)__backButtonAction:(id)a3
{
  backAction = self->_backAction;
  if (backAction)
  {
    [(UIAction *)backAction performWithSender:0 target:0];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained navigationBarContentViewDidTriggerBackAction:self fromBackButtonItem:self->_backButtonItem];
  }
}

- (double)_intrinsicHeight
{
  layout = self->_layout;
  if (layout)
  {
    [(_UINavigationBarContentViewLayout *)layout preferredHeight];
  }
  else
  {
    transitionContext = self->_transitionContext;
    if (transitionContext)
    {
      uint64_t v6 = [(_UINavigationBarTransitionContext *)transitionContext fromLayout];
      double v7 = (void *)v6;
      if (v6) {
        double v8 = *(void **)(v6 + 160);
      }
      else {
        double v8 = 0;
      }
      id v9 = v8;
      [v9 preferredHeight];
      double v11 = v10;

      uint64_t v12 = [(_UINavigationBarTransitionContext *)self->_transitionContext toLayout];
      double v13 = (void *)v12;
      if (v12) {
        double v14 = *(void **)(v12 + 160);
      }
      else {
        double v14 = 0;
      }
      id v15 = v14;
      [v15 preferredHeight];
      double v17 = v16;

      if (v11 >= v17) {
        return v11;
      }
      else {
        return v17;
      }
    }
    else
    {
      double v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2 object:self file:@"_UINavigationBarContentView.m" lineNumber:1052 description:@"Cannot determine content view height"];

      return 0.0;
    }
  }
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(_UINavigationBarContentView *)self _intrinsicHeight];
  double v3 = v2;
  double v4 = -1.0;
  result.double height = v3;
  result.double width = v4;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(_UINavigationBarContentView *)self _intrinsicHeight];
  double v5 = v4;
  double v6 = width;
  result.double height = v5;
  result.CGFloat width = v6;
  return result;
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  layout = self->_layout;
  id v5 = a3;
  id v6 = [(_UINavigationBarContentViewLayout *)layout augmentedTitleView];

  if (v6 == v5)
  {
    *(_WORD *)&self->_navigationBarContentViewFlags |= 1u;
    [(_UINavigationBarContentViewLayout *)self->_layout updateAugmentedTitleViewHeight];
    *(_WORD *)&self->_navigationBarContentViewFlags &= ~1u;
  }
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  if (dyld_program_sdk_at_least())
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_UINavigationBarContentView.m" lineNumber:1104 description:@"Client error attempting to change layout margins of a private view"];
  }
  else
  {
    id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setLayoutMargins____s_category) + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Client error attempting to change layout margins of a private view", buf, 2u);
    }
  }
}

- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  if (dyld_program_sdk_at_least())
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_UINavigationBarContentView.m" lineNumber:1109 description:@"Client error attempting to change layout margins of a private view"];
  }
  else
  {
    id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setDirectionalLayoutMargins____s_category) + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Client error attempting to change layout margins of a private view", buf, 2u);
    }
  }
}

- (void)updateAccessibilityContents:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_UINavigationBarContentViewLayout *)self->_layout augmentedTitleView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v7 = [(_UINavigationBarContentViewLayout *)self->_layout augmentedTitleView];
    [v4 setAugmentedTitleView:v7];
  }
  uint64_t v8 = [(_UINavigationBarContentViewLayout *)self->_layout tabBarContentGuide];
  if (!v8
    || (id v9 = (void *)v8,
        BOOL v10 = [(_UINavigationBarContentViewLayout *)self->_layout showTitleWithTabBar],
        v9,
        v10))
  {
    double v11 = [(_UINavigationBarContentViewLayout *)self->_layout titleControl];
    [v4 setTitleView:v11];
  }
  uint64_t v12 = [(_UINavigationBarContentViewLayout *)self->_layout backButton];

  if (v12)
  {
    double v13 = [(_UINavigationBarContentViewLayout *)self->_layout backButton];
    v15[0] = v13;
    double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [v4 setViewsRepresentingBackButton:v14];
  }
}

- (UIView)_effectiveTitleView
{
  double v3 = [(_UINavigationBarContentViewLayout *)self->_layout augmentedTitleView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  layout = self->_layout;
  if (isKindOfClass)
  {
    id v6 = [(_UINavigationBarContentViewLayout *)layout augmentedTitleView];
  }
  else
  {
    uint64_t v7 = [(_UINavigationBarContentViewLayout *)layout tabBarContentGuide];
    if (v7
      && (uint64_t v8 = (void *)v7,
          BOOL v9 = [(_UINavigationBarContentViewLayout *)self->_layout showTitleWithTabBar],
          v8,
          !v9))
    {
      id v6 = 0;
    }
    else
    {
      id v6 = [(_UINavigationBarContentViewLayout *)self->_layout titleControl];
    }
  }
  return (UIView *)v6;
}

- (void)_addCoordinatedAnimation:(id)a3 completion:(id)a4
{
  id aBlock = a3;
  id v6 = a4;
  if (aBlock)
  {
    currentAnimations = self->_currentAnimations;
    uint64_t v8 = _Block_copy(aBlock);
    [(NSMutableArray *)currentAnimations addObject:v8];
  }
  if (v6)
  {
    currentCompletions = self->_currentCompletions;
    BOOL v10 = _Block_copy(v6);
    [(NSMutableArray *)currentCompletions addObject:v10];
  }
}

- (void)_clearAllAnimations
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v3 = self->_currentAnimations;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v22;
    do
    {
      uint64_t v8 = 0;
      BOOL v9 = v6;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v3);
        }
        id v6 = (void (**)(void))_Block_copy(*(const void **)(*((void *)&v21 + 1) + 8 * v8));

        v6[2](v6);
        ++v8;
        BOOL v9 = v6;
      }
      while (v5 != v8);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v10 = self->_currentCompletions;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    double v13 = 0;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      double v16 = v13;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v10);
        }
        double v13 = _Block_copy(*(const void **)(*((void *)&v17 + 1) + 8 * v15));

        (*((void (**)(void *, uint64_t))v13 + 2))(v13, 1);
        ++v15;
        double v16 = v13;
      }
      while (v12 != v15);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }
  -[_UINavigationBarContentViewLayout setKeepsSnapshotsInHierarchy:](self->_layout, "setKeepsSnapshotsInHierarchy:", 0, (void)v17);
  [(_UINavigationBarContentViewLayout *)self->_layout removeAllSnapshots];
  [(NSMutableArray *)self->_currentAnimations removeAllObjects];
  [(NSMutableArray *)self->_currentCompletions removeAllObjects];
}

- (void)recordFromStateForTransition:(id)a3
{
  layout = self->_layout;
  uint64_t v5 = (_UINavigationBarTransitionContext *)a3;
  id v6 = [(_UINavigationBarTransitionContext *)v5 fromLayout];
  [(_UINavigationBarLayout *)v6 setContentViewLayout:layout];

  [(_UINavigationBarContentViewLayout *)self->_layout setKeepsSnapshotsInHierarchy:0];
  [(_UINavigationBarContentViewLayout *)self->_layout removeAllSnapshots];
  [(_UINavigationBarContentView *)self _clearAssistants];
  uint64_t v7 = self->_layout;
  self->_layout = 0;

  self->_transitionContext = v5;
}

- (void)prepareToRecordToState:(id)a3
{
  id v6 = (_UINavigationBarTransitionContext *)a3;
  uint64_t v4 = [(_UINavigationBarContentView *)self _newLayout];
  if (!self->_transitionContext) {
    [(_UINavigationBarContentViewLayout *)self->_layout removeContent];
  }
  self->_transitionContext = v6;
  layout = self->_layout;
  self->_layout = v4;
}

- (void)recordToStateForTransition:(id)a3
{
  uint64_t v7 = (_UINavigationBarTransitionContext *)a3;
  [(_UINavigationBarContentView *)self updateContentAnimated:0];
  layout = self->_layout;
  uint64_t v5 = [(_UINavigationBarTransitionContext *)v7 toLayout];
  [(_UINavigationBarLayout *)v5 setContentViewLayout:layout];

  self->_transitionContext = v7;
  [(_UINavigationBarContentViewLayout *)self->_layout setKeepsSnapshotsInHierarchy:0];
  [(_UINavigationBarContentViewLayout *)self->_layout removeAllSnapshots];
  id v6 = self->_layout;
  self->_layout = 0;
}

- (void)ensureBackButtonTruncationOccursWithContext:(id)a3
{
  p_layout = &self->_layout;
  id v6 = self->_layout;
  uint64_t v7 = [a3 toLayout];
  uint64_t v8 = (void *)v7;
  if (v7) {
    BOOL v9 = *(void **)(v7 + 160);
  }
  else {
    BOOL v9 = 0;
  }
  objc_storeStrong((id *)p_layout, v9);

  BOOL v10 = [(_UINavigationBarContentViewLayout *)*p_layout backButton];
  uint64_t v11 = [v10 visualProvider];
  id v19 = [v11 contentView];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [v19 currentTitle];
    if (v12)
    {
      double v13 = (void *)v12;
      uint64_t v14 = [(_UINavigationBarContentViewLayout *)*p_layout backButton];
      objc_msgSend(v14, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      double v16 = v15;
      double v17 = _minimumBackButtonWidth(self);

      if (v16 > v17) {
        [(_UINavigationBarContentView *)self updateContentAnimated:0];
      }
    }
  }
  long long v18 = *p_layout;
  *p_layout = v6;
}

- (void)clearTransitionContext
{
  if (self->_transitionContext)
  {
    if (!self->_layout)
    {
      double v3 = [[_UINavigationBarContentViewLayout alloc] initWithContentView:self];
      layout = self->_layout;
      self->_layout = v3;
    }
    self->_transitionContext = 0;
  }
}

- (void)adoptLayout:(id)a3
{
  id v6 = (_UINavigationBarContentViewLayout *)a3;
  BOOL v9 = v6;
  if (!v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"_UINavigationBarContentView.m" lineNumber:1531 description:@"Cannot adopt a nil layout!"];

    id v6 = 0;
  }
  self->_transitionContext = 0;
  layout = v6;
  if (self->_layout != v6)
  {
    [(_UINavigationBarContentViewLayout *)self->_layout removeContent];
    objc_storeStrong((id *)&self->_layout, a3);
    layout = self->_layout;
  }
  [(_UINavigationBarContentViewLayout *)layout setActive:1 contentView:self];
  [(_UINavigationBarContentView *)self updateContentAnimated:0];
}

- (void)adoptNewLayout
{
  if (!self->_layout)
  {
    double v3 = [(_UINavigationBarContentView *)self _newLayout];
    layout = self->_layout;
    self->_layout = v3;

    [(_UINavigationBarContentViewLayout *)self->_layout setActive:1 contentView:self];
    [(_UINavigationBarContentView *)self updateContentAnimated:0];
  }
}

- (void)relinquishLayout
{
  [(_UINavigationBarContentViewLayout *)self->_layout removeContent];
  layout = self->_layout;
  self->_layout = 0;
}

- (BOOL)isRTL
{
  uint64_t v3 = [(UIView *)self superview];
  uint64_t v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = (_UINavigationBarContentView *)v3;
  }
  else {
    uint64_t v5 = self;
  }
  id v6 = v5;

  uint64_t v7 = [(UIView *)v6 effectiveUserInterfaceLayoutDirection];
  return v7 == 1;
}

- (void)setBackIndicatorImage:(id)a3
{
}

- (_UIBarButtonItemData)plainItemAppearance
{
  return [(_UINavigationBarContentViewLayout *)self->_layout plainItemAppearance];
}

- (_UIBarButtonItemData)doneItemAppearance
{
  return [(_UINavigationBarContentViewLayout *)self->_layout doneItemAppearance];
}

- (_UIBarButtonItemData)backButtonAppearance
{
  return [(_UINavigationBarContentViewLayout *)self->_layout backButtonAppearance];
}

- (double)titleViewLargeTitleHeight:(id)a3
{
  uint64_t v3 = [(_UINavigationBarContentView *)self _layoutForAugmentedTitleView:a3];
  [v3 largeTitleHeight];
  double v5 = v4;

  return v5;
}

- (double)titleViewFloatingTabBarHeight:(id)a3
{
  id v4 = a3;
  double v5 = 0.0;
  if ([(_UINavigationBarContentView *)self _showTitleWithTabBar])
  {
    id v6 = [(_UINavigationBarContentView *)self _layoutForAugmentedTitleView:v4];
    [v6 tabBarExtension];
    double v5 = v7;
  }
  return v5;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)titleViewLargeTitleHeightRange:(id)a3
{
  uint64_t v3 = [(_UINavigationBarContentView *)self _layoutForAugmentedTitleView:a3];
  [v3 largeTitleHeightRange];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (double)titleViewContentBaselineOffsetFromTop:(id)a3
{
  id v4 = a3;
  double v5 = [(_UINavigationBarContentView *)self _layoutForAugmentedTitleView:v4];
  [v5 baselineOffsetFromTop];
  double v7 = v6;

  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v4, 0.0, v7);
  double v9 = v8;

  return v9;
}

- (double)titleViewContentBaseHeight:(id)a3
{
  uint64_t v3 = [(_UINavigationBarContentView *)self _layoutForAugmentedTitleView:a3];
  [v3 baseHeight];
  double v5 = v4;

  return v5;
}

- (void)titleViewChangedTabBarSizingDisposition:(id)a3
{
}

- (void)titleViewChangedLayout:(id)a3
{
}

- (void)titleViewChangedStandardDisplayItems:(id)a3
{
  [(_UINavigationBarContentView *)self updateContentAnimated:0];
  layout = self->_layout;
  [(_UINavigationBarContentViewLayout *)layout updateAugmentedTitleViewHeight];
}

- (void)titleViewChangedPreferredDisplaySize:(id)a3
{
  int64_t v4 = [(_UINavigationBarContentView *)self _currentContentSize];
  layout = self->_layout;
  [(_UINavigationBarContentViewLayout *)layout setRequestedContentSize:v4];
}

- (void)titleViewChangedMaximumBackButtonWidth:(id)a3
{
}

- (id)titleViewBackButtonMenu:(id)a3
{
  uint64_t v3 = [(_UINavigationBarContentView *)self _layoutForAugmentedTitleView:a3];
  int64_t v4 = v3;
  if (v3)
  {
    double v5 = [v3 backButton];
    double v6 = [v5 visualProvider];
    double v7 = [v6 buttonContextMenuInteractionConfiguration];

    if (v7)
    {
      uint64_t v8 = [v7 actionProvider];
      double v9 = (void *)v8;
      if (v8)
      {
        BOOL v10 = (*(void (**)(uint64_t, void))(v8 + 16))(v8, MEMORY[0x1E4F1CBF0]);
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_item:(id)a3 addSymbolEffect:(id)a4 options:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  if (self->_backButtonItem == a3)
  {
    double v13 = [(_UINavigationBarContentViewLayout *)self->_layout backButton];
    uint64_t v14 = v13;
    BOOL v12 = v13 == 0;
    if (v13) {
      [v13 addSymbolEffect:v10 options:v11 animated:v6];
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_item:(id)a3 removeSymbolEffectOfType:(id)a4 options:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  if (self->_backButtonItem == a3)
  {
    double v13 = [(_UINavigationBarContentViewLayout *)self->_layout backButton];
    uint64_t v14 = v13;
    BOOL v12 = v13 == 0;
    if (v13) {
      [v13 removeSymbolEffectOfType:v10 options:v11 animated:v6];
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_item:(id)a3 removeAllSymbolEffectsWithOptions:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  if (self->_backButtonItem == a3)
  {
    id v10 = [(_UINavigationBarContentViewLayout *)self->_layout backButton];
    id v11 = v10;
    BOOL v9 = v10 == 0;
    if (v10) {
      [v10 removeAllSymbolEffectsWithOptions:v8 animated:v5];
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_item:(id)a3 applyContentTransition:(id)a4 options:(id)a5
{
  id v11 = a4;
  id v8 = a5;
  if (self->_backButtonItem == a3)
  {
    BOOL v9 = [(_UINavigationBarContentViewLayout *)self->_layout backButton];
    id v10 = v9;
    if (v9) {
      [v9 applyContentTransition:v11 options:v8];
    }
  }
}

- (id)_accessibility_HUDItemForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (self->_inlineTitleViewAlpha > 0.0)
  {
    if ([(NSString *)self->_title length])
    {
      BOOL v6 = [(_UINavigationBarContentViewLayout *)self->_layout titleControl];
      double v7 = [(_UINavigationBarContentViewLayout *)self->_layout titleControl];
      -[UIView convertPoint:toView:](self, "convertPoint:toView:", v7, x, y);
      int v8 = objc_msgSend(v6, "pointInside:withEvent:", 0);

      if (v8)
      {
        BOOL v9 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:", self->_title, 0, 0.0, 0.0, 0.0, 0.0);
        goto LABEL_12;
      }
    }
  }
  if (self->_backButtonHidden) {
    goto LABEL_9;
  }
  id v10 = [(_UINavigationBarContentViewLayout *)self->_layout backButton];
  id v11 = [(_UINavigationBarContentViewLayout *)self->_layout backButton];
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v11, x, y);
  int v12 = objc_msgSend(v10, "pointInside:withEvent:", 0);

  if (!v12)
  {
LABEL_9:
    -[_UINavigationBarContentView _accessibility_barButtonItemAtPoint:](self, "_accessibility_barButtonItemAtPoint:", x, y);
    double v13 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [(UIBarButtonItem *)v13 _showsChevron];
    if (!v13) {
      goto LABEL_8;
    }
LABEL_10:
    +[UIAccessibilityHUDItem HUDItemForBarButtonItem:atPoint:inView:isBackButton:](UIAccessibilityHUDItem, "HUDItemForBarButtonItem:atPoint:inView:isBackButton:", v13, self, v14, x, y);
    BOOL v9 = (UIAccessibilityHUDItem *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  double v13 = self->_backButtonItem;
  uint64_t v14 = 1;
  if (v13) {
    goto LABEL_10;
  }
LABEL_8:
  BOOL v9 = 0;
LABEL_11:

LABEL_12:
  return v9;
}

- (id)_accessibility_barButtonItemAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  staticNavBarButtonItem = self->_staticNavBarButtonItem;
  if (staticNavBarButtonItem
    && ![(UIBarButtonItem *)staticNavBarButtonItem isHidden]
    && (staticNavBarButton = self->_staticNavBarButton,
        -[UIView convertPoint:toView:](self, "convertPoint:toView:", staticNavBarButton, x, y),
        -[UIView pointInside:withEvent:](staticNavBarButton, "pointInside:withEvent:", 0)))
  {
    int v8 = self->_staticNavBarButtonItem;
  }
  else
  {
    layout = self->_layout;
    if (layout)
    {
      id v10 = [(_UINavigationBarContentViewLayout *)layout leadingBar];
      objc_msgSend(v10, "itemAtPoint:inView:", self, x, y);
      int v8 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        id v11 = [(_UINavigationBarContentViewLayout *)self->_layout centerBar];
        objc_msgSend(v11, "itemAtPoint:inView:", self, x, y);
        int v8 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
          int v12 = [(_UINavigationBarContentViewLayout *)self->_layout trailingBar];
          objc_msgSend(v12, "itemAtPoint:inView:", self, x, y);
          int v8 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    else
    {
      int v8 = 0;
    }
  }
  return v8;
}

- (id)_accessibility_controlToActivateForHUDGestureLiftAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (!self->_backButtonHidden)
  {
    BOOL v6 = [(_UINavigationBarContentViewLayout *)self->_layout backButton];
    double v7 = [(_UINavigationBarContentViewLayout *)self->_layout backButton];
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", v7, x, y);
    if (objc_msgSend(v6, "pointInside:withEvent:", 0))
    {
      int v8 = [(_UINavigationBarContentViewLayout *)self->_layout backButton];
      int v9 = [v8 _accessibilityShouldActivateOnHUDLift];

      if (v9)
      {
        id v10 = [(_UINavigationBarContentViewLayout *)self->_layout backButton];
        goto LABEL_12;
      }
    }
    else
    {
    }
  }
  id v11 = -[_UINavigationBarContentView _accessibility_barButtonItemAtPoint:](self, "_accessibility_barButtonItemAtPoint:", x, y);
  int v12 = [v11 view];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_10;
  }
  double v13 = [v11 view];
  int v14 = [v13 _accessibilityShouldActivateOnHUDLift];

  if (!v14)
  {
LABEL_10:
    id v10 = 0;
    goto LABEL_11;
  }
  id v10 = [v11 view];
LABEL_11:

LABEL_12:
  return v10;
}

- (NSString)description
{
  v15.receiver = self;
  v15.super_class = (Class)_UINavigationBarContentView;
  uint64_t v3 = [(UIView *)&v15 description];
  int64_t v4 = (void *)[v3 mutableCopy];

  transitionContext = self->_transitionContext;
  if (transitionContext)
  {
    uint64_t v6 = [(_UINavigationBarTransitionContext *)self->_transitionContext fromLayout];
    double v7 = (void *)v6;
    if (v6) {
      int v8 = *(void **)(v6 + 160);
    }
    else {
      int v8 = 0;
    }
    id v9 = v8;
    uint64_t v10 = [(_UINavigationBarTransitionContext *)self->_transitionContext toLayout];
    id v11 = (void *)v10;
    if (v10) {
      int v12 = *(void **)(v10 + 160);
    }
    else {
      int v12 = 0;
    }
    id v13 = v12;
    objc_msgSend(v4, "appendFormat:", @" transitionContext=%p fromLayout=%p toLayout=%p", transitionContext, v9, v13);
  }
  else
  {
    objc_msgSend(v4, "appendFormat:", @" layout=%p", self->_layout);
  }
  return (NSString *)v4;
}

- (UIBarButtonItem)backButtonItem
{
  return self->_backButtonItem;
}

- (BOOL)backButtonHidden
{
  return self->_backButtonHidden;
}

- (UIBarButtonItem)staticNavBarButtonItem
{
  return self->_staticNavBarButtonItem;
}

- (BOOL)isStaticNavBarButtonTrailing
{
  return self->_staticNavBarButtonTrailing;
}

- (NSArray)leadingBarButtonItems
{
  return self->_leadingBarButtonItems;
}

- (BOOL)leadingItemsSupplementBackItem
{
  return self->_leadingItemsSupplementBackItem;
}

- (NSArray)centerBarGroups
{
  return self->_centerBarGroups;
}

- (NSString)customizationIdentifier
{
  return self->_customizationIdentifier;
}

- (NSArray)trailingBarButtonItems
{
  return self->_trailingBarButtonItems;
}

- (UIBarButtonItemGroup)fixedTrailingGroup
{
  return self->_fixedTrailingGroup;
}

- (NSString)title
{
  return self->_title;
}

- (UIView)titleView
{
  return self->_titleView;
}

- (_UIBarButtonItemSearchBarGroup)inlineSearchBarGroup
{
  return self->_inlineSearchBarGroup;
}

- (BOOL)placeInlineSearchBarInCenter
{
  return self->_placeInlineSearchBarInCenter;
}

- (double)inlineTitleViewAlpha
{
  return self->_inlineTitleViewAlpha;
}

- (NSDictionary)titleAttributes
{
  return self->_titleAttributes;
}

- (UIOffset)titlePositionAdjustment
{
  double horizontal = self->_titlePositionAdjustment.horizontal;
  double vertical = self->_titlePositionAdjustment.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (double)overrideSize
{
  return self->_overrideSize;
}

- (BOOL)allowLeadingAlignedLargeTitle
{
  return self->_allowLeadingAlignedLargeTitle;
}

- (int64_t)requestedContentSize
{
  return self->_requestedContentSize;
}

- (id)titleMenuProvider
{
  return self->_titleMenuProvider;
}

- (UIDocumentProperties)documentProperties
{
  return self->_documentProperties;
}

- (_UINavigationItemRenameHandler)dci_renameHandler
{
  return self->_dci_renameHandler;
}

- (UIAction)backAction
{
  return self->_backAction;
}

- (BOOL)enableAlternatePopItem
{
  return self->_enableAlternatePopItem;
}

- (UIDeferredMenuElement)additionalItems
{
  return self->_additionalItems;
}

- (BOOL)isHostedTabBarVisible
{
  return self->_isHostedTabBarVisible;
}

- (BOOL)hostedTabBarVisibilityAffectsTitle
{
  return self->_hostedTabBarVisibilityAffectsTitle;
}

- (BOOL)showTitleWithTabBar
{
  return self->_showTitleWithTabBar;
}

- (BOOL)useInlineLargeTitleMetrics
{
  return self->_useInlineLargeTitleMetrics;
}

- (NSDictionary)effectiveTitleAttributes
{
  return self->_effectiveTitleAttributes;
}

@end