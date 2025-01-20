@interface SFUnifiedTabBar
- (BOOL)_centersContentForSingleItem;
- (BOOL)_shouldDelayContentTouches;
- (BOOL)canCloseItem:(id)a3;
- (BOOL)isContentHidden;
- (BOOL)isCurrentlyScrollable;
- (BOOL)isStandalone;
- (BOOL)itemsNeedEraserBasedCutoutBorder;
- (BOOL)pinsScrollPositionToTrailingEdgeDuringResize;
- (BOOL)searchFieldShowsFormatMenuButtonAccessories;
- (BOOL)searchFieldShowsPersistentStopReloadButton;
- (BOOL)showsSquishedAccessoryViews;
- (BOOL)showsSquishedTitleContainer;
- (BOOL)tabBarItemViewCanBecomeFocused:(id)a3;
- (BOOL)tabBarItemViewShouldAnnotateWithTabEntity:(id)a3;
- (BOOL)usesMoreMenu;
- (CGPoint)_adjustedContentOffsetForContentOffset:(CGPoint)a3 size:(CGSize)a4 contentSize:(CGSize)a5;
- (CGPoint)_targetContentOffsetForAnimatedResizeWithTargetLayout:(id)a3;
- (CGPoint)midpointForCenteredContent;
- (CGRect)frameForTabBarItem:(id)a3;
- (CGRect)pinnedItemDropArea;
- (CGSize)preferredSize;
- (NSArray)squishedAccessoryViews;
- (NSDirectionalEdgeInsets)contentInset;
- (SFTabHoverPreviewController)tabHoverPreviewController;
- (SFUnifiedBarTheme)barTheme;
- (SFUnifiedTabBar)initWithFrame:(CGRect)a3;
- (SFUnifiedTabBarDragObserving)dragObserver;
- (SFUnifiedTabBarItemArrangement)itemArrangement;
- (SFUnifiedTabBarMetrics)barMetrics;
- (SFUnifiedTabBarNavigationDelegate)navigationDelegate;
- (UIEdgeInsets)_itemTouchInsets;
- (UIEdgeInsets)searchFieldPopoverSourceInsets;
- (UIEdgeInsets)squishedContentInset;
- (UITextField)searchField;
- (UIView)itemContainerView;
- (UIView)menuPopoverSourceView;
- (UIView)searchFieldPopoverSourceView;
- (_SFFluidProgressView)minimizedProgressView;
- (double)_preferredWidth;
- (double)barBackgroundAlpha;
- (double)preferredSquishedBottomSpacing;
- (double)squishTransformFactor;
- (double)themeColorVisibility;
- (id)_activeTabBarItemView;
- (id)_backgroundCaptureGroupName;
- (id)_currentLayoutConfiguration;
- (id)_firstFullyVisibleInactiveItem;
- (id)_pinnedOverflowMenu;
- (id)_prepareForResizeIfNeeded;
- (id)_viewForItem:(id)a3 inArrangement:(id)a4;
- (id)dragPreviewForBarItem:(id)a3;
- (id)dragPreviewForBarItem:(id)a3 pinned:(BOOL)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)newSearchField;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)preferredFocusEnvironments;
- (id)tabBarItemAtPoint:(CGPoint)a3;
- (id)tabBarItemClosestToPoint:(CGPoint)a3;
- (id)viewForBarItem:(id)a3;
- (int64_t)_itemViewAccessoryButtonLayout;
- (int64_t)_platterStyleForTabBarItem:(id)a3;
- (int64_t)role;
- (unint64_t)_pinnedItemLimitForItemArrangement:(id)a3;
- (unint64_t)indexOfCenterItem;
- (unint64_t)maximumNumberOfVisibleItems;
- (unint64_t)sizeClass;
- (void)_applyLayoutInfo:(id *)a3 toItemView:(id)a4;
- (void)_beginTransitioningSearchField;
- (void)_configureTabBarItemView:(id)a3 forItem:(id)a4 inArrangement:(id)a5 isPreview:(BOOL)a6;
- (void)_didBeginScrollingAnimation;
- (void)_didEndAnimationsForItems:(id)a3;
- (void)_didEndScrollingAnimation;
- (void)_didSelectItemView:(id)a3 event:(id)a4;
- (void)_discardItemView:(id)a3;
- (void)_discardViewForItem:(id)a3;
- (void)_discardViewsForAnimatingItemsIfNeeded:(id)a3;
- (void)_discardViewsForIndexes:(id)a3 ofItems:(id)a4;
- (void)_endTransitioningSearchFieldInItemView:(id)a3;
- (void)_hover:(id)a3;
- (void)_installSearchFieldIfNeeded;
- (void)_layOutPinnedItemsSeparator;
- (void)_layoutAppearingItemsAtIndexes:(id)a3 withDistanceToScroll:(double)a4 usingLayout:(id)a5;
- (void)_layoutDisappearingItemsAtIndexes:(id)a3 withDistanceScrolled:(double)a4 usingLayout:(id)a5;
- (void)_layoutItems;
- (void)_layoutItemsAtIndexes:(id)a3 usingLayout:(id)a4;
- (void)_layoutSquishedTitleContainer;
- (void)_setResolvedItemArrangement:(id)a3 animated:(BOOL)a4 keepingItemVisible:(id)a5 completionHandler:(id)a6;
- (void)_setRevealsSquishedActiveItem:(BOOL)a3 animated:(BOOL)a4;
- (void)_setUpBuiltInItemViewRegistrations;
- (void)_setUpPinnedItemsSeparatorIfNeeded;
- (void)_tearDownPinnedItemsSeparatorIfNeeded;
- (void)_uninstallSearchFieldIfNeeded;
- (void)_updateBarMetricsForTraitChange;
- (void)_updateContentSizeIfNeeded;
- (void)_updateHoveringItem:(id)a3;
- (void)_updateItemSizesIfNeeded;
- (void)_updateMinimizedProgressViewFillColor;
- (void)_updatePinnedItemsSeparator;
- (void)_updateScrolling;
- (void)_updateShowsMinimizedProgressView;
- (void)cleanUpDragPreviewForBarItem:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)registerReuseIdentifier:(id)a3 withItemViewProvider:(id)a4 configurationHandler:(id)a5;
- (void)revealActiveItemIfNeeded;
- (void)scrollToItem:(id)a3 animated:(BOOL)a4;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setActiveItem:(id)a3 animated:(BOOL)a4;
- (void)setActiveItemIsExpanded:(BOOL)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)setBarBackgroundAlpha:(double)a3;
- (void)setBarMetrics:(id)a3;
- (void)setBarTheme:(id)a3;
- (void)setContentHidden:(BOOL)a3;
- (void)setContentInset:(NSDirectionalEdgeInsets)a3;
- (void)setDragObserver:(id)a3;
- (void)setItemArrangement:(id)a3;
- (void)setItemArrangement:(id)a3 animated:(BOOL)a4 keepingItemVisible:(id)a5 completionHandler:(id)a6;
- (void)setItemsNeedEraserBasedCutoutBorder:(BOOL)a3;
- (void)setMidpointForCenteredContent:(CGPoint)a3;
- (void)setMinimizedProgressView:(id)a3;
- (void)setNavigationDelegate:(id)a3;
- (void)setPinsScrollPositionToTrailingEdgeDuringResize:(BOOL)a3;
- (void)setRole:(int64_t)a3;
- (void)setSearchFieldShowsFormatMenuButtonAccessories:(BOOL)a3;
- (void)setShowsSquishedAccessoryViews:(BOOL)a3;
- (void)setShowsSquishedTitleContainer:(BOOL)a3;
- (void)setSizeClass:(unint64_t)a3;
- (void)setSquishTransformFactor:(double)a3;
- (void)setSquishedContentInset:(UIEdgeInsets)a3;
- (void)setThemeColorVisibility:(double)a3;
- (void)tabBarItemView:(id)a3 didFinishShowingAvailabilityLabelOfType:(int64_t)a4;
- (void)tabBarItemView:(id)a3 didUpdateHovering:(BOOL)a4;
- (void)tabBarItemView:(id)a3 extensionButtonTapped:(id)a4 extension:(id)a5;
- (void)tabBarItemView:(id)a3 multipleExtensionButtonTapped:(id)a4;
- (void)tabBarItemViewCloseButtonTapped:(id)a3;
- (void)tabBarItemViewDidRequestFocusForPencilInput:(id)a3 completionHandler:(id)a4;
- (void)tabBarItemViewMediaStateMuteButtonTapped:(id)a3;
- (void)tabBarItemViewMenuButtonClicked:(id)a3;
- (void)tabBarItemViewMenuButtonReceivedTouchDown:(id)a3;
- (void)tabBarItemViewMenuButtonTapped:(id)a3;
- (void)tabBarItemViewReaderButtonTapped:(id)a3;
- (void)tabBarItemViewReloadButtonTapped:(id)a3;
- (void)tabBarItemViewStopButtonTapped:(id)a3;
- (void)tabBarItemViewTitleChanged:(id)a3;
- (void)tabBarItemViewTranslationButtonTapped:(id)a3;
- (void)tabBarItemViewVoiceSearchButtonTapped:(id)a3;
- (void)updateLayout;
@end

@implementation SFUnifiedTabBar

- (SFUnifiedTabBar)initWithFrame:(CGRect)a3
{
  v45.receiver = self;
  v45.super_class = (Class)SFUnifiedTabBar;
  v3 = -[SFUnifiedTabBar initWithFrame:](&v45, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_themeColorVisibility = 1.0;
    v3->_squishTransformFactor = 1.0;
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    searchFieldPopoverAlignmentView = v4->_searchFieldPopoverAlignmentView;
    v4->_searchFieldPopoverAlignmentView = v5;

    [(UIView *)v4->_searchFieldPopoverAlignmentView setHidden:1];
    [(SFUnifiedTabBar *)v4 addSubview:v4->_searchFieldPopoverAlignmentView];
    v7 = (_UIVisualEffectBackdropView *)objc_alloc_init(MEMORY[0x1E4FB23F0]);
    backgroundCaptureView = v4->_backgroundCaptureView;
    v4->_backgroundCaptureView = v7;

    [(_UIVisualEffectBackdropView *)v4->_backgroundCaptureView setRenderMode:1];
    v9 = [(SFUnifiedTabBar *)v4 _backgroundCaptureGroupName];
    v10 = [(_UIVisualEffectBackdropView *)v4->_backgroundCaptureView captureGroup];
    [v10 setGroupName:v9];

    [(SFUnifiedTabBar *)v4 addSubview:v4->_backgroundCaptureView];
    v11 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4FB1BE0]);
    scrollView = v4->_scrollView;
    v4->_scrollView = v11;

    [(UIScrollView *)v4->_scrollView setDelegate:v4];
    [(UIScrollView *)v4->_scrollView setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)v4->_scrollView setShowsVerticalScrollIndicator:0];
    [(UIScrollView *)v4->_scrollView setAlwaysBounceHorizontal:1];
    [(UIScrollView *)v4->_scrollView setContentInsetAdjustmentBehavior:2];
    [(UIScrollView *)v4->_scrollView setClipsToBounds:0];
    [(SFUnifiedTabBar *)v4 addSubview:v4->_scrollView];
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    dragPreviewContainer = v4->_dragPreviewContainer;
    v4->_dragPreviewContainer = v13;

    [(UIView *)v4->_dragPreviewContainer setHidden:1];
    [(UIScrollView *)v4->_scrollView addSubview:v4->_dragPreviewContainer];
    v15 = [SFUnifiedTabBarMetrics alloc];
    v16 = [(SFUnifiedTabBar *)v4 traitCollection];
    uint64_t v17 = [(SFUnifiedTabBarMetrics *)v15 initWithTraitCollection:v16];
    barMetrics = v4->_barMetrics;
    v4->_barMetrics = (SFUnifiedTabBarMetrics *)v17;

    v19 = objc_alloc_init(SFUnifiedTabBarItemArrangement);
    itemArrangement = v4->_itemArrangement;
    v4->_itemArrangement = v19;

    v21 = [SFUnifiedTabBarLayout alloc];
    v22 = v4->_itemArrangement;
    v23 = [(SFUnifiedTabBar *)v4 _currentLayoutConfiguration];
    uint64_t v24 = [(SFUnifiedTabBarLayout *)v21 initWithItemArrangement:v22 configuration:v23];
    layout = v4->_layout;
    v4->_layout = (SFUnifiedTabBarLayout *)v24;

    v26 = objc_alloc_init(SFUnifiedTabBarItemArrangement);
    unresolvedItemArrangement = v4->_unresolvedItemArrangement;
    v4->_unresolvedItemArrangement = v26;

    uint64_t v28 = [(SFUnifiedTabBar *)v4 newSearchField];
    searchField = v4->_searchField;
    v4->_searchField = (UITextField *)v28;

    [(UITextField *)v4->_searchField setAdjustsFontForContentSizeCategory:1];
    [(UITextField *)v4->_searchField setAutocapitalizationType:0];
    [(UITextField *)v4->_searchField setAutocorrectionType:1];
    [(UITextField *)v4->_searchField setClearButtonMode:3];
    [(UITextField *)v4->_searchField setKeyboardType:10];
    [(UITextField *)v4->_searchField setSemanticContentAttribute:3];
    [(UITextField *)v4->_searchField setSmartDashesType:1];
    [(UITextField *)v4->_searchField setSmartQuotesType:1];
    [(UITextField *)v4->_searchField setTintAdjustmentMode:1];
    uint64_t v30 = [objc_alloc(MEMORY[0x1E4FB1800]) initWithTarget:v4 action:sel__hover_];
    hoverRecognizer = v4->_hoverRecognizer;
    v4->_hoverRecognizer = (UIHoverGestureRecognizer *)v30;

    [(SFUnifiedTabBar *)v4 addGestureRecognizer:v4->_hoverRecognizer];
    v32 = objc_alloc_init(SFTabHoverPreviewController);
    tabHoverPreviewController = v4->_tabHoverPreviewController;
    v4->_tabHoverPreviewController = v32;

    [(SFTabHoverPreviewController *)v4->_tabHoverPreviewController setHoverRecognizer:v4->_hoverRecognizer];
    v34 = objc_alloc_init(SFPinnedOverflowItem);
    pinnedOverflowItem = v4->_pinnedOverflowItem;
    v4->_pinnedOverflowItem = v34;

    uint64_t v36 = [objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v4];
    pointerInteraction = v4->_pointerInteraction;
    v4->_pointerInteraction = (UIPointerInteraction *)v36;

    [(SFUnifiedTabBar *)v4 addInteraction:v4->_pointerInteraction];
    uint64_t v38 = [MEMORY[0x1E4F1CA60] dictionary];
    itemViewRegistrationsByReuseIdentifier = v4->_itemViewRegistrationsByReuseIdentifier;
    v4->_itemViewRegistrationsByReuseIdentifier = (NSMutableDictionary *)v38;

    [(SFUnifiedTabBar *)v4 _setUpBuiltInItemViewRegistrations];
    v40 = +[SFUnifiedBarTheme defaultTheme];
    [(SFUnifiedTabBar *)v4 setBarTheme:v40];

    v41 = +[SFUnifiedBarMetrics traitsAffectingBarMetrics];
    id v42 = (id)[(SFUnifiedTabBar *)v4 registerForTraitChanges:v41 withTarget:v4 action:sel__updateBarMetricsForTraitChange];

    v43 = v4;
  }

  return v4;
}

- (BOOL)showsSquishedTitleContainer
{
  return self->_squishedTitleContainer != 0;
}

- (void)setShowsSquishedTitleContainer:(BOOL)a3
{
  if ([(SFUnifiedTabBar *)self showsSquishedTitleContainer] != a3)
  {
    if (a3)
    {
      v5 = [[SFUnifiedTabBarItemTitleContainerView alloc] initWithAlignment:1];
      squishedTitleContainer = self->_squishedTitleContainer;
      self->_squishedTitleContainer = v5;

      [(SFUnifiedTabBarItemTitleContainerView *)self->_squishedTitleContainer setCollapsed:0];
      v7 = [(SFUnifiedBarTheme *)self->_barTheme titleTheme];
      [(SFUnifiedTabBarItemTitleContainerView *)self->_squishedTitleContainer setTheme:v7];

      [(SFUnifiedTabBarItemTitleContainerView *)self->_squishedTitleContainer setShowsPrivateAnnotation:[(SFUnifiedBarTheme *)self->_barTheme isPrivate]];
      [(SFUnifiedTabBarItemTitleContainerView *)self->_squishedTitleContainer setUserInteractionEnabled:0];
      v8 = self->_squishedTitleContainer;
      v9 = [(SFUnifiedTabBar *)self _activeTabBarItemView];
      [v9 setSquishedTitleContainer:v8];

      v10 = self->_squishedTitleContainer;
      [(SFUnifiedTabBar *)self addSubview:v10];
    }
    else
    {
      v11 = [(SFUnifiedTabBar *)self _activeTabBarItemView];
      [v11 setSquishedTitleContainer:0];

      [(SFUnifiedTabBarItemTitleContainerView *)self->_squishedTitleContainer removeFromSuperview];
      v12 = self->_squishedTitleContainer;
      self->_squishedTitleContainer = 0;
    }
  }
}

- (void)layoutSubviews
{
  self->_isLayingOut = 1;
  v37.receiver = self;
  v37.super_class = (Class)SFUnifiedTabBar;
  [(SFUnifiedTabBar *)&v37 layoutSubviews];
  [(SFUnifiedTabBar *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(SFUnifiedBarMetrics *)self->_barMetrics itemHeight];
  double v12 = v11;
  [(SFUnifiedTabBar *)self layoutMargins];
  double v14 = v13;
  v15 = [(SFUnifiedTabBar *)self _prepareForResizeIfNeeded];
  v38.origin.double x = v4;
  v38.origin.y = v6;
  v38.size.width = v8;
  v38.size.height = v10;
  double Width = CGRectGetWidth(v38);
  [(UIScrollView *)self->_scrollView frame];
  v42.origin.double x = 0.0;
  v42.origin.y = v14;
  v42.size.width = Width;
  v42.size.height = v12;
  if (!CGRectEqualToRect(v39, v42)) {
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", 0.0, v14, Width, v12);
  }
  -[_UIVisualEffectBackdropView setFrame:](self->_backgroundCaptureView, "setFrame:", 0.0, v14, Width, v12);
  double x = self->_midpointForCenteredContent.x;
  v40.origin.double x = v4;
  v40.origin.y = v6;
  v40.size.width = v8;
  v40.size.height = v10;
  double v18 = x + CGRectGetWidth(v40) * -0.5;
  v41.origin.double x = v4;
  v41.origin.y = v6;
  v41.size.width = v8;
  v41.size.height = v10;
  -[UIView setFrame:](self->_searchFieldPopoverAlignmentView, "setFrame:", v18, v14, CGRectGetWidth(v41), v12);
  v19 = [(_SFFluidProgressView *)self->_minimizedProgressView superview];
  [v19 bounds];
  -[_SFFluidProgressView setFrame:](self->_minimizedProgressView, "setFrame:");

  v20 = titleTextStyleForRole(self->_role);
  [(SFUnifiedTabBarItemTitleContainerView *)self->_squishedTitleContainer setTitleTextStyle:v20];

  [(UIScrollView *)self->_scrollView setScrollEnabled:[(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItemIsExpanded] ^ 1];
  [(SFUnifiedTabBarLayout *)self->_layout autoScrollTouchInsets];
  -[UIScrollView _setAutoScrollTouchInsets:](self->_scrollView, "_setAutoScrollTouchInsets:");
  [(SFUnifiedTabBar *)self _updateItemSizesIfNeeded];
  [(SFUnifiedTabBar *)self _updateContentSizeIfNeeded];
  [(SFUnifiedTabBar *)self _layoutSquishedTitleContainer];
  v21 = (void *)MEMORY[0x1E4FB1EB0];
  BOOL v22 = v15 != 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __33__SFUnifiedTabBar_layoutSubviews__block_invoke;
  v34[3] = &unk_1E54E9A60;
  id v35 = v15;
  uint64_t v36 = self;
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  uint64_t v30 = __33__SFUnifiedTabBar_layoutSubviews__block_invoke_2;
  v31 = &unk_1E54E9E68;
  v32 = self;
  id v33 = v35;
  id v23 = v35;
  objc_msgSend(v21, "sf_animate:usingDefaultMotionWithOptions:animations:completion:", v22, 2, v34, &v28);
  [(UIView *)self ss_untransformedFrame];
  self->_lastLayoutFrame.origin.double x = v24;
  self->_lastLayoutFrame.origin.y = v25;
  self->_lastLayoutFrame.size.width = v26;
  self->_lastLayoutFrame.size.height = v27;
  self->_isLayingOut = 0;
}

uint64_t __33__SFUnifiedTabBar_layoutSubviews__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 targetContentOffset];
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 408), "setContentOffset:");
  }
  double v3 = *(void **)(a1 + 40);

  return [v3 _layoutItems];
}

void __33__SFUnifiedTabBar_layoutSubviews__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) itemsToKeepVisible];
  [v1 _didEndAnimationsForItems:v2];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!-[SFUnifiedTabBar pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    double v11 = 0;
    goto LABEL_18;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  CGFloat v8 = [(SFUnifiedTabBarLayout *)self->_layout visibleItems];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v9)
  {

LABEL_17:
    v25.receiver = self;
    v25.super_class = (Class)SFUnifiedTabBar;
    double v11 = -[SFUnifiedTabBar hitTest:withEvent:](&v25, sel_hitTest_withEvent_, v7, x, y);
    goto LABEL_18;
  }
  uint64_t v10 = v9;
  double v11 = 0;
  uint64_t v12 = *(void *)v27;
  double v13 = -1.79769313e308;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v27 != v12) {
        objc_enumerationMutation(v8);
      }
      v15 = [*(id *)(*((void *)&v26 + 1) + 8 * i) reusableView];
      v16 = [v15 _outermostLayer];
      [v16 zPosition];
      double v18 = v17;

      if (v18 >= v13)
      {
        objc_msgSend(v15, "convertPoint:fromView:", self, x, y);
        v19 = objc_msgSend(v15, "hitTest:withEvent:", v7);
        v20 = v19;
        if (v19)
        {
          id v21 = v19;

          BOOL v22 = [v15 _outermostLayer];
          [v22 zPosition];
          double v13 = v23;

          double v11 = v21;
        }
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  }
  while (v10);

  if (!v11) {
    goto LABEL_17;
  }
LABEL_18:

  return v11;
}

- (void)_updateBarMetricsForTraitChange
{
  barMetrics = self->_barMetrics;
  CGFloat v4 = [(SFUnifiedTabBar *)self traitCollection];
  LODWORD(barMetrics) = [(SFUnifiedBarMetrics *)barMetrics updateWithTraitCollection:v4];

  if (barMetrics)
  {
    [(SFUnifiedTabBar *)self setNeedsLayout];
  }
}

- (void)setItemArrangement:(id)a3
{
}

- (void)setItemArrangement:(id)a3 animated:(BOOL)a4 keepingItemVisible:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  uint64_t v10 = (SFUnifiedTabBarItemArrangement *)a3;
  id v11 = a6;
  id v12 = a5;
  id v14 = [(SFUnifiedTabBarItemArrangement *)v10 resolvedArrangementWithPinnedItemLimit:[(SFUnifiedTabBar *)self _pinnedItemLimitForItemArrangement:v10] overflowItem:self->_pinnedOverflowItem];
  [(SFUnifiedTabBar *)self _setResolvedItemArrangement:v14 animated:v8 keepingItemVisible:v12 completionHandler:v11];

  unresolvedItemArrangement = self->_unresolvedItemArrangement;
  self->_unresolvedItemArrangement = v10;
}

- (void)_setResolvedItemArrangement:(id)a3 animated:(BOOL)a4 keepingItemVisible:(id)a5 completionHandler:(id)a6
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  double v13 = (void (**)(void))a6;
  p_itemArrangement = &self->_itemArrangement;
  int v15 = [v11 isEqualToArrangement:self->_itemArrangement];
  v80 = v12;
  if (v12 || !v15)
  {
    BOOL v73 = a4;
    v76 = [(SFUnifiedTabBarItemArrangement *)*p_itemArrangement items];
    v77 = [v11 items];
    v79 = [v77 differenceFromArray:v76 withOptions:4];
    v75 = objc_msgSend(v79, "safari_removalIndexes");
    if ([(SFUnifiedTabBarItemArrangement *)*p_itemArrangement activeItemIsExpanded]) {
      int v72 = 0;
    }
    else {
      int v72 = [v11 activeItemIsExpanded] ^ 1;
    }
    v16 = [v11 activeItem];
    double v17 = [(SFUnifiedTabBarItemArrangement *)*p_itemArrangement activeItem];
    if (v16 == v17)
    {
      v19 = [v11 items];
      v20 = [(SFUnifiedTabBarItemArrangement *)*p_itemArrangement items];
      int v18 = [v19 isEqual:v20];
    }
    else
    {
      int v18 = 0;
    }

    objc_msgSend(v11, "determineActiveItemSquishStateIfNeeded:", -[SFUnifiedTabBarItemArrangement revealsSquishedActiveItem](*p_itemArrangement, "revealsSquishedActiveItem") & v18);
    id v21 = [(SFUnifiedTabBarItemArrangement *)*p_itemArrangement activeItem];
    BOOL v22 = [v11 activeItem];

    if (v21 != v22)
    {
      double v23 = [(SFUnifiedTabBar *)self _activeTabBarItemView];
      [v23 setSquishedTitleContainer:0];
    }
    v78 = self->_layout;
    objc_storeStrong((id *)&self->_itemArrangement, a3);
    CGFloat v24 = [SFUnifiedTabBarLayout alloc];
    objc_super v25 = [(SFUnifiedTabBar *)self _currentLayoutConfiguration];
    long long v26 = [(SFUnifiedTabBarLayout *)v24 initWithItemArrangement:v11 configuration:v25];
    layout = self->_layout;
    self->_layout = v26;

    long long v28 = [v11 items];
    -[UIScrollView setAlwaysBounceHorizontal:](self->_scrollView, "setAlwaysBounceHorizontal:", (unint64_t)[v28 count] > 1);

    [(SFUnifiedTabBar *)self setNeedsLayout];
    if (v80
      && ((v29 = [v77 indexOfObject:v80], v29 != 0x7FFFFFFFFFFFFFFFLL) ? (int v30 = v72) : (int v30 = 0),
          v30 == 1))
    {
      [(SFUnifiedTabBarLayout *)self->_layout contentOffsetForScrollingToItemAtIndex:v29];
    }
    else
    {
      [(UIScrollView *)self->_scrollView contentOffset];
    }
    double v33 = v31;
    double v34 = v32;
    id v35 = [v79 insertions];
    int v36 = objc_msgSend(v35, "safari_containsObjectPassingTest:", &__block_literal_global_30);

    if (v36)
    {
      [(SFUnifiedTabBarLayout *)self->_layout contentOffsetForScrollingToDroppingItems];
      double v33 = v37;
      double v34 = v38;
    }
    scrollView = self->_scrollView;
    if (v73)
    {
      [(UIScrollView *)scrollView bounds];
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;
      double v47 = v46;
      [(UIScrollView *)self->_scrollView contentOffset];
      double v49 = v48;
      v50 = (void *)MEMORY[0x1E4F1CA80];
      v51 = [(SFUnifiedTabBarLayout *)v78 visibleItems];
      v52 = [v50 setWithArray:v51];
      double v53 = v33 - v49;

      v54 = -[SFUnifiedTabBarLayout itemsVisibleInRect:](self->_layout, "itemsVisibleInRect:", v41 + v53, v43, v45, v47);
      [v52 unionSet:v54];

      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id v55 = v52;
      uint64_t v56 = [v55 countByEnumeratingWithState:&v101 objects:v106 count:16];
      if (v56)
      {
        uint64_t v57 = *(void *)v102;
        do
        {
          for (uint64_t i = 0; i != v56; ++i)
          {
            if (*(void *)v102 != v57) {
              objc_enumerationMutation(v55);
            }
            objc_msgSend(*(id *)(*((void *)&v101 + 1) + 8 * i), "setActiveAnimationCount:", objc_msgSend(*(id *)(*((void *)&v101 + 1) + 8 * i), "activeAnimationCount") + 1);
          }
          uint64_t v56 = [v55 countByEnumeratingWithState:&v101 objects:v106 count:16];
        }
        while (v56);
      }

      v59 = [(SFUnifiedTabBarLayout *)v78 itemArrangement];
      v60 = [v59 allItemIndexes];
      v61 = (void *)[v60 mutableCopy];

      v62 = [(SFUnifiedTabBarLayout *)v78 visibleItemIndexes];
      v99[0] = MEMORY[0x1E4F143A8];
      v99[1] = 3221225472;
      v99[2] = __93__SFUnifiedTabBar__setResolvedItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_3;
      v99[3] = &unk_1E54EA280;
      id v63 = v61;
      id v100 = v63;
      [v62 enumerateIndexesUsingBlock:v99];

      v64 = [v79 removals];
      v65 = objc_msgSend(v64, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_28_0);

      [(SFUnifiedTabBar *)self _didBeginScrollingAnimation];
      v66 = (void *)MEMORY[0x1E4FB1EB0];
      v96[0] = MEMORY[0x1E4F143A8];
      v96[1] = 3221225472;
      v96[2] = __93__SFUnifiedTabBar__setResolvedItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_5;
      v96[3] = &unk_1E54E9B00;
      v96[4] = self;
      id v74 = v63;
      id v97 = v74;
      v67 = v78;
      v98 = v67;
      [v66 performWithoutAnimation:v96];
      v68 = objc_msgSend(v79, "safari_insertionIndexes");
      [(SFUnifiedTabBar *)self _layoutAppearingItemsAtIndexes:v68 withDistanceToScroll:self->_layout usingLayout:v53];

      v94[0] = 0;
      v94[1] = v94;
      v94[2] = 0x3032000000;
      v94[3] = __Block_byref_object_copy__3;
      v94[4] = __Block_byref_object_dispose__3;
      id v95 = 0;
      v69 = (void *)MEMORY[0x1E4FB1EB0];
      v87[0] = MEMORY[0x1E4F143A8];
      v87[1] = 3221225472;
      v87[2] = __93__SFUnifiedTabBar__setResolvedItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_29;
      v87[3] = &unk_1E54EB990;
      v87[4] = self;
      double v91 = v33;
      double v92 = v34;
      id v88 = v75;
      double v93 = v53;
      v89 = v67;
      v90 = v94;
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __93__SFUnifiedTabBar__setResolvedItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_2_30;
      v81[3] = &unk_1E54EB9B8;
      id v70 = v65;
      id v82 = v70;
      v83 = self;
      id v71 = v55;
      id v84 = v71;
      v86 = v94;
      v85 = v13;
      objc_msgSend(v69, "sf_animate:usingDefaultMotionWithOptions:animations:completion:", 1, 610, v87, v81);

      _Block_object_dispose(v94, 8);
    }
    else
    {
      -[UIScrollView setContentOffset:](scrollView, "setContentOffset:", v33, v34);
      [(SFUnifiedTabBar *)self _discardViewsForIndexes:v75 ofItems:v76];
      v105[0] = MEMORY[0x1E4F143A8];
      v105[1] = 3221225472;
      v105[2] = __93__SFUnifiedTabBar__setResolvedItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_2;
      v105[3] = &unk_1E54E9858;
      v105[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v105];
      if (v13) {
        v13[2](v13);
      }
    }
  }
  else if (v13)
  {
    v13[2](v13);
  }
}

uint64_t __93__SFUnifiedTabBar__setResolvedItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 object];
  uint64_t v3 = [v2 isDropping];

  return v3;
}

uint64_t __93__SFUnifiedTabBar__setResolvedItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updatePinnedItemsSeparator];
  [*(id *)(a1 + 32) layoutIfNeeded];
  [*(id *)(a1 + 32) _uninstallSearchFieldIfNeeded];
  [*(id *)(*(void *)(a1 + 32) + 472) setShowsSearchField:1];
  id v2 = *(void **)(*(void *)(a1 + 32) + 472);

  return [v2 layoutIfNeeded];
}

uint64_t __93__SFUnifiedTabBar__setResolvedItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeIndex:a2];
}

id __93__SFUnifiedTabBar__setResolvedItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 associatedIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v3 = [v2 object];
    CGFloat v4 = [v3 reusableView];
  }
  else
  {
    CGFloat v4 = 0;
  }

  return v4;
}

uint64_t __93__SFUnifiedTabBar__setResolvedItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) _layoutItemsAtIndexes:*(void *)(a1 + 40) usingLayout:*(void *)(a1 + 48)];
  id v2 = *(void **)(a1 + 32);

  return [v2 _setUpPinnedItemsSeparatorIfNeeded];
}

void __93__SFUnifiedTabBar__setResolvedItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_29(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 408), "setContentOffset:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  [*(id *)(a1 + 32) _layoutDisappearingItemsAtIndexes:*(void *)(a1 + 40) withDistanceScrolled:*(void *)(a1 + 48) usingLayout:*(double *)(a1 + 80)];
  [*(id *)(a1 + 32) layoutIfNeeded];
  [*(id *)(a1 + 32) _beginTransitioningSearchField];
  id v2 = *(void **)(*(void *)(a1 + 32) + 472);
  uint64_t v3 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);

  objc_storeStrong(v3, v2);
}

uint64_t __93__SFUnifiedTabBar__setResolvedItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_2_30(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_discardItemView:", *(void *)(*((void *)&v8 + 1) + 8 * v6++), (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 40) _didEndAnimationsForItems:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) _didEndScrollingAnimation];
  [*(id *)(a1 + 40) _endTransitioningSearchFieldInItemView:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  [*(id *)(a1 + 40) _tearDownPinnedItemsSeparatorIfNeeded];
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setActiveItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  unresolvedItemArrangement = self->_unresolvedItemArrangement;
  id v7 = a3;
  id v8 = [(SFUnifiedTabBarItemArrangement *)unresolvedItemArrangement arrangementWithActiveItem:v7];
  [(SFUnifiedTabBar *)self setItemArrangement:v8 animated:v4 keepingItemVisible:v7 completionHandler:0];
}

- (void)setActiveItemIsExpanded:(BOOL)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  unresolvedItemArrangement = self->_unresolvedItemArrangement;
  id v9 = a5;
  id v10 = [(SFUnifiedTabBarItemArrangement *)unresolvedItemArrangement arrangementWithActiveItemIsExpanded:v6];
  [(SFUnifiedTabBar *)self setItemArrangement:v10 animated:v5 keepingItemVisible:0 completionHandler:v9];
}

- (void)scrollToItem:(id)a3 animated:(BOOL)a4
{
}

- (void)setItemsNeedEraserBasedCutoutBorder:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_itemsNeedEraserBasedCutoutBorder != a3)
  {
    BOOL v3 = a3;
    self->_itemsNeedEraserBasedCutoutBorder = a3;
    BOOL v5 = [(UIScrollView *)self->_scrollView layer];
    [v5 setCreatesCompositingGroup:v3];

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    BOOL v6 = [(SFUnifiedTabBarLayout *)self->_layout visibleItems];
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
          long long v11 = [*(id *)(*((void *)&v12 + 1) + 8 * v10) reusableView];
          [v11 setItemsNeedEraserBasedCutoutBorder:v3];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)updateLayout
{
  [(SFUnifiedTabBarLayout *)self->_layout updateItemSizes];
  [(SFUnifiedTabBar *)self setNeedsLayout];

  [(SFUnifiedTabBar *)self layoutIfNeeded];
}

- (UIView)searchFieldPopoverSourceView
{
  if ([(SFUnifiedTabBarLayout *)self->_layout contentIsCentered])
  {
    BOOL v3 = [(SFUnifiedTabBar *)self _activeTabBarItemView];
  }
  else if ([(SFUnifiedTabBarLayout *)self->_layout centersActiveItemWhenExpanded])
  {
    BOOL v3 = self->_searchFieldPopoverAlignmentView;
  }
  else
  {
    BOOL v3 = self;
  }

  return (UIView *)v3;
}

- (UIEdgeInsets)searchFieldPopoverSourceInsets
{
  if ([(SFUnifiedTabBarLayout *)self->_layout contentIsCentered]
    || [(SFUnifiedTabBarLayout *)self->_layout centersActiveItemWhenExpanded])
  {
    double v3 = *MEMORY[0x1E4FB2848];
    double v4 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v5 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v6 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  else
  {
    [(SFUnifiedTabBar *)self layoutMargins];
    UIEdgeInsetsReplace();
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)usesMoreMenu
{
  if (self->_role)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    double v3 = +[SFFeatureManager sharedFeatureManager];
    int v2 = [v3 usesFormatMenuInUnifiedTabBar] ^ 1;
  }
  return v2;
}

- (UIView)menuPopoverSourceView
{
  int v2 = [(SFUnifiedTabBar *)self _activeTabBarItemView];
  double v3 = [v2 menuPopoverSourceView];

  return (UIView *)v3;
}

- (unint64_t)indexOfCenterItem
{
  return [(SFUnifiedTabBarLayout *)self->_layout indexOfCenterItem];
}

- (unint64_t)maximumNumberOfVisibleItems
{
  return [(SFUnifiedTabBarLayout *)self->_layout maximumNumberOfVisibleItems];
}

- (id)newSearchField
{
  return objc_alloc_init(MEMORY[0x1E4FB1D70]);
}

- (UITextField)searchField
{
  [(SFUnifiedTabBar *)self layoutIfNeeded];
  searchField = self->_searchField;

  return searchField;
}

- (BOOL)canCloseItem:(id)a3
{
  return 0;
}

- (void)_didSelectItemView:(id)a3 event:(id)a4
{
  id v10 = a3;
  double v5 = [v10 item];
  if (v5)
  {
    double v6 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItem];
    if (v5 != v6
      || [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement revealsSquishedActiveItem])
    {

LABEL_5:
      if (![v10 isOccluded]
        || [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItemIsExpanded]
        || [(SFUnifiedTabBarLayout *)self->_layout horizontalSpaceIsExtremelyConstrained])
      {
        [(SFUnifiedTabBar *)self didSelectItem:v5];
      }
      else
      {
        [(SFUnifiedTabBar *)self scrollToItem:v5 animated:1];
      }
      goto LABEL_9;
    }
    BOOL v7 = [(SFUnifiedTabBarLayout *)self->_layout activeItemIsSquished];

    if (!v7) {
      goto LABEL_5;
    }
    [(SFUnifiedTabBar *)self _setRevealsSquishedActiveItem:1 animated:1];
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    lastTapToRevealActiveItemDate = self->_lastTapToRevealActiveItemDate;
    self->_lastTapToRevealActiveItemDate = v8;
  }
LABEL_9:
}

- (void)_hover:(id)a3
{
  scrollView = self->_scrollView;
  id v5 = a3;
  [v5 locationInView:scrollView];
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = [v5 state];

  if ((unint64_t)(v10 - 1) > 1)
  {
    tabHoverPreviewController = self->_tabHoverPreviewController;
    -[SFTabHoverPreviewController updateWithItem:atLocation:](tabHoverPreviewController, "updateWithItem:atLocation:", 0, v7, v9);
  }
  else
  {
    -[SFUnifiedTabBarLayout itemAtPoint:](self->_layout, "itemAtPoint:", v7, v9);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v11 = v13;
      }
      else {
        id v11 = 0;
      }
      -[SFTabHoverPreviewController updateWithItem:atLocation:](self->_tabHoverPreviewController, "updateWithItem:atLocation:", v11, v7, v9);
    }
  }
}

- (void)_updateHoveringItem:(id)a3
{
  id v6 = a3;
  id v4 = [(SFUnifiedTabBarLayout *)self->_layout hoveringItem];

  id v5 = v6;
  if (v4 != v6)
  {
    [(SFUnifiedTabBarLayout *)self->_layout setHoveringItem:v6];
    [(SFUnifiedTabBar *)self setNeedsLayout];
    id v5 = v6;
  }
}

- (void)_layoutItems
{
  double v3 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement allItemIndexes];
  [(SFUnifiedTabBar *)self _layoutItemsAtIndexes:v3 usingLayout:self->_layout];

  [(SFUnifiedTabBar *)self _installSearchFieldIfNeeded];

  [(SFUnifiedTabBar *)self _layOutPinnedItemsSeparator];
}

- (void)_layoutItemsAtIndexes:(id)a3 usingLayout:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__SFUnifiedTabBar__layoutItemsAtIndexes_usingLayout___block_invoke;
  v8[3] = &unk_1E54EBA08;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [v7 enumerateLayoutForItemsAtIndexes:a3 usingBlock:v8];
}

void __53__SFUnifiedTabBar__layoutItemsAtIndexes_usingLayout___block_invoke(uint64_t a1, void *a2, uint64_t a3, long long *a4)
{
  id v7 = a2;
  double v8 = v7;
  if (*((unsigned char *)a4 + 56) || [v7 activeAnimationCount])
  {
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = [*(id *)(a1 + 40) itemArrangement];
    id v11 = [v9 _viewForItem:v8 inArrangement:v10];

    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    long long v12 = *a4;
    long long v29 = a4[1];
    long long v13 = a4[3];
    long long v30 = a4[2];
    long long v31 = v13;
    double v23 = __53__SFUnifiedTabBar__layoutItemsAtIndexes_usingLayout___block_invoke_2;
    CGFloat v24 = &unk_1E54EB9E0;
    uint64_t v32 = *((void *)a4 + 8);
    long long v28 = v12;
    long long v14 = *(void **)(a1 + 40);
    uint64_t v25 = *(void *)(a1 + 32);
    id v26 = v11;
    id v27 = v14;
    id v15 = v11;
    v16 = (void (**)(void *, uint64_t, uint64_t, uint64_t, uint64_t))_Block_copy(&v21);
    v16[2](v16, v17, v18, v19, v20);
  }
  else
  {
    [*(id *)(a1 + 32) _discardViewForItem:v8];
  }
  objc_msgSend(*(id *)(a1 + 40), "setItemAtIndex:isVisible:", a3, *((unsigned __int8 *)a4 + 56), v21, v22, v23, v24, v25);
  [*(id *)(a1 + 40) setItemAtIndex:a3 isOccluded:*((unsigned __int8 *)a4 + 57)];
}

void __53__SFUnifiedTabBar__layoutItemsAtIndexes_usingLayout___block_invoke_2(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  long long v4 = *(_OWORD *)(a1 + 72);
  long long v5 = *(_OWORD *)(a1 + 104);
  v9[2] = *(_OWORD *)(a1 + 88);
  v9[3] = v5;
  uint64_t v10 = *(void *)(a1 + 120);
  v9[0] = *(_OWORD *)(a1 + 56);
  v9[1] = v4;
  [v2 _applyLayoutInfo:v9 toItemView:v3];
  [*(id *)(a1 + 40) layoutIfNeeded];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [*(id *)(a1 + 48) itemArrangement];
    double v8 = [v7 itemTitles];
    [v6 updateTitleWhenCollapsedWithItemTitles:v8];
  }
}

- (void)_applyLayoutInfo:(id *)a3 toItemView:(id)a4
{
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v11[0] = *MEMORY[0x1E4F1DAB8];
  v11[1] = v5;
  v11[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  id v6 = a4;
  [v6 setTransform:v11];
  objc_msgSend(v6, "setFrame:", a3->var0.origin.x, a3->var0.origin.y, a3->var0.size.width, a3->var0.size.height);
  [v6 setAlpha:a3->var1];
  CGAffineTransformMakeScale(&v10, a3->var2, a3->var2);
  CGAffineTransform v9 = v10;
  [v6 setTransform:&v9];
  double var3 = a3->var3;
  double v8 = [v6 _outermostLayer];
  [v8 setZPosition:var3];

  [v6 setVisible:a3->var4];
  [v6 setOccluded:a3->var5];
  [v6 setSquishedInset:a3->var6];
}

- (void)_layoutSquishedTitleContainer
{
  squishedTitleContainer = self->_squishedTitleContainer;
  if (squishedTitleContainer)
  {
    [(SFUnifiedTabBarItemTitleContainerView *)squishedTitleContainer setHidden:self->_squishTransformFactor == 1.0];
    double squishTransformFactor = self->_squishTransformFactor;
    if (squishTransformFactor != 1.0)
    {
      [(SFUnifiedTabBarItemTitleContainerView *)self->_squishedTitleContainer setAlpha:_SFClamp(squishTransformFactor * -2.0 + 1.5, 0.0, 1.0)];
      [(SFUnifiedTabBar *)self layoutMargins];
      double v6 = v5;
      [(SFUnifiedTabBar *)self bounds];
      double Width = CGRectGetWidth(v17);
      [(SFUnifiedBarMetrics *)self->_barMetrics itemHeight];
      double top = self->_squishedContentInset.top;
      double left = self->_squishedContentInset.left;
      double v10 = left + 0.0;
      double v11 = v6 + top;
      double v12 = Width - (left + self->_squishedContentInset.right);
      long long v13 = self->_squishedTitleContainer;
      double v15 = v14 - (top + self->_squishedContentInset.bottom);
      -[SFUnifiedTabBarItemTitleContainerView setFrame:](v13, "setFrame:", v10, v11, v12, v15);
    }
  }
}

- (CGRect)frameForTabBarItem:(id)a3
{
  [(SFUnifiedTabBarLayout *)self->_layout frameForItem:a3];
  scrollView = self->_scrollView;

  -[SFUnifiedTabBar convertRect:fromView:](self, "convertRect:fromView:", scrollView);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (id)tabBarItemAtPoint:(CGPoint)a3
{
  layout = self->_layout;
  -[UIScrollView convertPoint:fromView:](self->_scrollView, "convertPoint:fromView:", self, a3.x, a3.y);
  long long v4 = -[SFUnifiedTabBarLayout itemAtPoint:](layout, "itemAtPoint:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)tabBarItemClosestToPoint:(CGPoint)a3
{
  layout = self->_layout;
  -[UIScrollView convertPoint:fromView:](self->_scrollView, "convertPoint:fromView:", self, a3.x, a3.y);

  return -[SFUnifiedTabBarLayout itemClosestToPoint:passingTest:](layout, "itemClosestToPoint:passingTest:", &__block_literal_global_39);
}

uint64_t __44__SFUnifiedTabBar_tabBarItemClosestToPoint___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (UIEdgeInsets)_itemTouchInsets
{
  [(SFUnifiedTabBar *)self layoutMargins];
  double v3 = -v2;
  double v5 = -v4;
  double v6 = 0.0;
  double v7 = 0.0;
  result.right = v7;
  result.bottom = v5;
  result.double left = v6;
  result.double top = v3;
  return result;
}

- (id)_currentLayoutConfiguration
{
  double v3 = [[SFUnifiedTabBarLayoutConfiguration alloc] initWithScrollView:self->_scrollView];
  [(SFUnifiedTabBarLayoutConfiguration *)v3 setBarMetrics:self->_barMetrics];
  -[SFUnifiedTabBarLayoutConfiguration setMidpointForCenteredContent:](v3, "setMidpointForCenteredContent:", self->_midpointForCenteredContent.x, self->_midpointForCenteredContent.y);
  [(SFUnifiedTabBarLayoutConfiguration *)v3 setStandalone:[(SFUnifiedTabBar *)self isStandalone]];
  [(SFUnifiedTabBarLayoutConfiguration *)v3 setFlipped:[(UIView *)self _sf_usesLeftToRightLayout] ^ 1];

  return v3;
}

- (void)setBarMetrics:(id)a3
{
  double v5 = (SFUnifiedTabBarMetrics *)a3;
  if (self->_barMetrics != v5)
  {
    objc_storeStrong((id *)&self->_barMetrics, a3);
    [(SFUnifiedTabBarLayout *)self->_layout setBarMetrics:v5];
    [(SFUnifiedTabBar *)self setNeedsLayout];
  }
}

- (void)_updateItemSizesIfNeeded
{
  if ([(SFUnifiedTabBarMetrics *)self->_barMetrics sizeClass] == self->_sizeClass)
  {
    layout = self->_layout;
    [(SFUnifiedTabBarLayout *)layout updateItemSizesIfNeeded];
  }
  else
  {
    -[SFUnifiedTabBarMetrics setSizeClass:](self->_barMetrics, "setSizeClass:");
    double v4 = self->_layout;
    [(SFUnifiedTabBarLayout *)v4 updateItemSizes];
  }
}

- (void)_updateContentSizeIfNeeded
{
  [(SFUnifiedTabBarLayout *)self->_layout contentSize];
  double v4 = v3;
  double v6 = v5;
  [(UIScrollView *)self->_scrollView contentSize];
  if (v8 != v4 || v7 != v6)
  {
    scrollView = self->_scrollView;
    -[UIScrollView setContentSize:](scrollView, "setContentSize:", v4, v6);
  }
}

- (void)_didBeginScrollingAnimation
{
}

- (void)_didEndScrollingAnimation
{
}

- (void)_updateScrolling
{
  BOOL v3 = [(UIScrollView *)self->_scrollView isDragging] || self->_scrollingAnimationCount != 0;
  BOOL v4 = !v3;
  [(UIPointerInteraction *)self->_pointerInteraction setEnabled:v4];
  [(UIHoverGestureRecognizer *)self->_hoverRecognizer setEnabled:v4];
  if (v4)
  {
    if (self->_tabHoverPreviewSnapshotsNeedUpdate)
    {
      [(SFTabHoverPreviewController *)self->_tabHoverPreviewController setNeedsSnapshotUpdate];
      self->_tabHoverPreviewSnapshotsNeedUpdate = 0;
    }
  }
  else
  {
    tabHoverPreviewController = self->_tabHoverPreviewController;
    [(SFTabHoverPreviewController *)tabHoverPreviewController cancel];
  }
}

- (CGPoint)_adjustedContentOffsetForContentOffset:(CGPoint)a3 size:(CGSize)a4 contentSize:(CGSize)a5
{
  double width = a5.width;
  double v6 = a4.width;
  CGFloat y = a3.y;
  double x = a3.x;
  [(UIScrollView *)self->_scrollView adjustedContentInset];
  double v10 = fmax(fmin(x + v9, width - v6), 0.0) - v9;
  double v11 = y;
  result.CGFloat y = v11;
  result.double x = v10;
  return result;
}

- (void)registerReuseIdentifier:(id)a3 withItemViewProvider:(id)a4 configurationHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = [[SFUnifiedTabBarItemViewRegistration alloc] initWithViewProvider:v9 configurationHandler:v8];

  [(NSMutableDictionary *)self->_itemViewRegistrationsByReuseIdentifier setObject:v11 forKeyedSubscript:v10];
}

- (id)_viewForItem:(id)a3 inArrangement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 viewReuseIdentifier];
  id v9 = [(NSMutableDictionary *)self->_itemViewRegistrationsByReuseIdentifier objectForKeyedSubscript:v8];
  id v10 = [v9 dequeueOrCreateViewForItem:v6 isPreview:0];
  [v10 setReuseIdentifier:v8];
  [v9 configureView:v10 forItem:v6 inArrangement:v7 isPreview:0];

  if (self->_tabHoverPreviewSnapshotsNeedUpdate)
  {
    self->_tabHoverPreviewSnapshotsNeedUpdate = 1;
  }
  else
  {
    double v11 = [v10 superview];
    if (v11 == self->_scrollView) {
      char v12 = [v10 isHidden];
    }
    else {
      char v12 = 1;
    }
    self->_tabHoverPreviewSnapshotsNeedUpdate = v12;
  }
  long long v13 = [v10 superview];
  scrollView = self->_scrollView;

  if (v13 != scrollView) {
    [(UIScrollView *)self->_scrollView addSubview:v10];
  }
  [v10 setBarMetrics:self->_barMetrics];
  [v10 setBarTheme:self->_barTheme];
  double v15 = [(SFUnifiedTabBar *)self _backgroundCaptureGroupName];
  [v10 setCutoutBorderCopyGroupName:v15];

  [v10 setBarBackgroundAlpha:self->_barBackgroundAlpha];
  [v10 setItemsNeedEraserBasedCutoutBorder:self->_itemsNeedEraserBasedCutoutBorder];
  [v10 setThemeColorVisibility:self->_themeColorVisibility];
  [v10 setSquishTransformFactor:self->_squishTransformFactor];
  [(SFUnifiedTabBar *)self _itemTouchInsets];
  objc_msgSend(v10, "_setTouchInsets:");
  objc_msgSend(v10, "setHidden:", objc_msgSend(v6, "isHidden"));

  return v10;
}

- (void)_discardViewForItem:(id)a3
{
  id v5 = a3;
  BOOL v4 = [v5 reusableView];
  if (v4)
  {
    [(SFUnifiedTabBar *)self _discardItemView:v4];
    [v4 setItem:0];
    [v5 setReusableView:0];
  }
}

- (void)_discardItemView:(id)a3
{
  id v7 = (SFUnifiedTabBarItemView *)a3;
  [(SFUnifiedTabBarItemView *)v7 setHidden:1];
  [(SFUnifiedTabBarItemView *)v7 endEditing:0];
  if (self->_itemViewOwningSearchField == v7)
  {
    self->_itemViewOwningSearchField = 0;
  }
  itemViewRegistrationsByReuseIdentifier = self->_itemViewRegistrationsByReuseIdentifier;
  id v5 = [(SFUnifiedBarItemView *)v7 reuseIdentifier];
  id v6 = [(NSMutableDictionary *)itemViewRegistrationsByReuseIdentifier objectForKeyedSubscript:v5];

  [v6 enqueueItemView:v7];
}

- (void)_discardViewsForIndexes:(id)a3 ofItems:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__SFUnifiedTabBar__discardViewsForIndexes_ofItems___block_invoke;
  v4[3] = &unk_1E54EBA50;
  v4[4] = self;
  [a4 enumerateObjectsAtIndexes:a3 options:0 usingBlock:v4];
}

uint64_t __51__SFUnifiedTabBar__discardViewsForIndexes_ofItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _discardViewForItem:a2];
}

- (void)_discardViewsForAnimatingItemsIfNeeded:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v10 = [v9 reusableView];
        if (([v10 isVisible] & 1) == 0 && !objc_msgSend(v9, "activeAnimationCount")) {
          [(SFUnifiedTabBar *)self _discardViewForItem:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_didEndAnimationsForItems:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9), "setActiveAnimationCount:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9), "activeAnimationCount") - 1);
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
    [(SFUnifiedTabBar *)self _discardViewsForAnimatingItemsIfNeeded:v5];
  }
}

- (UIView)itemContainerView
{
  return (UIView *)self->_scrollView;
}

- (id)viewForBarItem:(id)a3
{
  return (id)[a3 reusableView];
}

- (id)_firstFullyVisibleInactiveItem
{
  BOOL v3 = [(SFUnifiedTabBarLayout *)self->_layout visibleItems];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__SFUnifiedTabBar__firstFullyVisibleInactiveItem__block_invoke;
  v6[3] = &unk_1E54EBA78;
  v6[4] = self;
  id v4 = objc_msgSend(v3, "safari_firstObjectPassingTest:", v6);

  return v4;
}

BOOL __49__SFUnifiedTabBar__firstFullyVisibleInactiveItem__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 reusableView];
  uint64_t v5 = v4;
  if (v4 && ([v4 isOccluded] & 1) == 0)
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 640) activeItem];
    BOOL v6 = v7 != v3;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_backgroundCaptureGroupName
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"SFUnifiedTabBar.%p", self);
}

- (void)_setUpBuiltInItemViewRegistrations
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__SFUnifiedTabBar__setUpBuiltInItemViewRegistrations__block_invoke_2;
  v5[3] = &unk_1E54EBAC0;
  objc_copyWeak(&v6, &location);
  [(SFUnifiedTabBar *)self registerReuseIdentifier:@"SFUnifiedTabBarItem" withItemViewProvider:&__block_literal_global_47 configurationHandler:v5];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__SFUnifiedTabBar__setUpBuiltInItemViewRegistrations__block_invoke_3;
  v3[3] = &unk_1E54EBAE8;
  objc_copyWeak(&v4, &location);
  [(SFUnifiedTabBar *)self registerReuseIdentifier:@"SFPinnedOverflowItem" withItemViewProvider:v3 configurationHandler:0];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

SFUnifiedTabBarItemView *__53__SFUnifiedTabBar__setUpBuiltInItemViewRegistrations__block_invoke()
{
  v0 = objc_alloc_init(SFUnifiedTabBarItemView);

  return v0;
}

void __53__SFUnifiedTabBar__setUpBuiltInItemViewRegistrations__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v8 = (id *)(a1 + 32);
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained(v8);
  [WeakRetained _configureTabBarItemView:v11 forItem:v10 inArrangement:v9 isPreview:a5];
}

SFPinnedOverflowItemView *__53__SFUnifiedTabBar__setUpBuiltInItemViewRegistrations__block_invoke_3(uint64_t a1)
{
  double v2 = objc_alloc_init(SFPinnedOverflowItemView);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [(SFPinnedOverflowItemView *)v2 setDelegate:WeakRetained];
    id v4 = [WeakRetained _pinnedOverflowMenu];
    [(SFPinnedOverflowItemView *)v2 setMenu:v4];
  }

  return v2;
}

- (void)_configureTabBarItemView:(id)a3 forItem:(id)a4 inArrangement:(id)a5 isPreview:(BOOL)a6
{
  id v21 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v11 activeItem];

  [v21 setDelegate:self];
  if (v12 == v10)
  {
    objc_msgSend(v21, "setActive:", -[SFUnifiedTabBar isStandalone](self, "isStandalone") ^ 1);
    [v21 setSelected:1];
    BOOL v13 = [(SFUnifiedTabBar *)self canCloseItem:v10];
  }
  else
  {
    [v21 setActive:0];
    [v21 setSelected:0];
    BOOL v13 = 0;
  }
  [v21 setShowsCloseButton:v13];
  objc_msgSend(v21, "setAccessoryButtonLayout:", -[SFUnifiedTabBar _itemViewAccessoryButtonLayout](self, "_itemViewAccessoryButtonLayout"));
  long long v14 = [v11 items];
  BOOL v15 = [v14 count] == 1
     && [(SFUnifiedTabBar *)self _centersContentForSingleItem]
     || self->_role == 2;

  [v21 setContentAlignment:v15];
  uint64_t v16 = titleTextStyleForRole(self->_role);
  [v21 setTitleTextStyle:v16];

  [v21 setLockIconEdge:self->_role == 0];
  objc_msgSend(v21, "setPlatterStyle:", -[SFUnifiedTabBar _platterStyleForTabBarItem:](self, "_platterStyleForTabBarItem:", v10));
  if ([v10 isPinned]) {
    uint64_t v17 = [v11 allowsScrollingPinnedItems];
  }
  else {
    uint64_t v17 = 0;
  }
  [v21 setShowsPinnedIndicator:v17];
  if (!a6)
  {
    [v21 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];
    [v21 addTarget:self action:sel__didSelectItemView_event_ forControlEvents:0x2000];
    id v18 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItem];
    squishedTitleContainer = 0;
    if (v18 == v10) {
      squishedTitleContainer = self->_squishedTitleContainer;
    }
    [v21 setSquishedTitleContainer:squishedTitleContainer];

    uint64_t v20 = [v10 menuButtonConfigurator];
    [v21 setFormatMenuButtonConfigurator:v20];
  }
}

- (id)_activeTabBarItemView
{
  if (self->_role == 2)
  {
    id v2 = 0;
  }
  else
  {
    id v3 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItem];
    id v4 = [v3 reusableView];

    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v2 = v4;
    }
    else {
      id v2 = 0;
    }
  }

  return v2;
}

- (int64_t)_platterStyleForTabBarItem:(id)a3
{
  id v4 = a3;
  if (self->_role == 1)
  {
    uint64_t v5 = +[SFFeatureManager sharedFeatureManager];
    if ([v5 showRectangularTabsInSeparateBar]) {
      int64_t v6 = 4;
    }
    else {
      int64_t v6 = 3;
    }
  }
  else
  {
    id v7 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItem];

    uint64_t v8 = 7;
    if (v7 == v4) {
      uint64_t v8 = 8;
    }
    uint64_t v9 = 1;
    if (v7 == v4) {
      uint64_t v9 = 2;
    }
    if (self->_role == 2) {
      int64_t v6 = v8;
    }
    else {
      int64_t v6 = v9;
    }
  }

  return v6;
}

- (int64_t)_itemViewAccessoryButtonLayout
{
  if (self->_role != 1) {
    return 0;
  }
  if (self->_searchFieldShowsFormatMenuButtonAccessories) {
    return 2;
  }
  return 1;
}

- (id)_prepareForResizeIfNeeded
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  p_lastLayoutFrame = &self->_lastLayoutFrame;
  if (CGRectEqualToRect(*MEMORY[0x1E4F1DB28], self->_lastLayoutFrame)) {
    goto LABEL_18;
  }
  [(UIView *)self ss_untransformedFrame];
  if (CGRectEqualToRect(v47, *p_lastLayoutFrame)) {
    goto LABEL_18;
  }
  unint64_t v4 = [(SFUnifiedTabBar *)self _pinnedItemLimitForItemArrangement:self->_unresolvedItemArrangement];
  if (![(SFUnifiedTabBarItemArrangement *)self->_itemArrangement allowsScrollingPinnedItems]&& [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement pinnedItemLimit] != v4)
  {
    uint64_t v5 = [(SFUnifiedTabBarItemArrangement *)self->_unresolvedItemArrangement resolvedArrangementWithPinnedItemLimit:v4 overflowItem:self->_pinnedOverflowItem];
    [(SFUnifiedTabBar *)self _setResolvedItemArrangement:v5 animated:0 keepingItemVisible:0 completionHandler:0];
  }
  [MEMORY[0x1E4FB1EB0] inheritedAnimationDuration];
  if (v6 == 0.0)
  {
LABEL_18:
    double v34 = 0;
  }
  else
  {
    [(SFUnifiedTabBar *)self bounds];
    double v8 = v7;
    double v10 = v9;
    id v11 = [(SFUnifiedTabBar *)self _currentLayoutConfiguration];
    [(UIScrollView *)self->_scrollView contentOffset];
    objc_msgSend(v11, "setVisibleRectOverride:");
    id v12 = [[SFUnifiedTabBarLayout alloc] initWithItemArrangement:self->_itemArrangement configuration:v11];
    [(SFUnifiedTabBar *)self _targetContentOffsetForAnimatedResizeWithTargetLayout:v12];
    double v14 = v13;
    double v16 = v15;
    uint64_t v17 = [(SFUnifiedTabBarLayout *)self->_layout visibleItemIndexes];
    id v18 = -[SFUnifiedTabBarLayout indexesOfItemsVisibleInRect:](v12, "indexesOfItemsVisibleInRect:", v14, v16, v8, v10);
    uint64_t v19 = (void *)[v18 mutableCopy];

    [v19 removeIndexes:v17];
    double v37 = v17;
    uint64_t v20 = (void *)[v17 mutableCopy];
    [v20 addIndexes:v19];
    id v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement items];
    int v36 = v20;
    double v23 = [v22 objectsAtIndexes:v20];
    CGFloat v24 = [v21 setWithArray:v23];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v25 = v24;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v41 != v28) {
            objc_enumerationMutation(v25);
          }
          objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * i), "setActiveAnimationCount:", objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * i), "activeAnimationCount") + 1);
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v27);
    }

    long long v30 = (void *)MEMORY[0x1E4FB1EB0];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __44__SFUnifiedTabBar__prepareForResizeIfNeeded__block_invoke;
    v38[3] = &unk_1E54E9A60;
    v38[4] = self;
    id v31 = v19;
    id v39 = v31;
    [v30 performWithoutAnimation:v38];
    objc_msgSend(v11, "setVisibleRectOverride:", v14, v16, v8, v10);
    uint64_t v32 = [[SFUnifiedTabBarLayout alloc] initWithItemArrangement:self->_itemArrangement configuration:v11];

    if (![(SFUnifiedTabBarLayout *)self->_layout activeItemIsSquished]
      && [(SFUnifiedTabBarLayout *)v32 activeItemIsSquished])
    {
      double v33 = [(SFUnifiedTabBarItemArrangement *)self->_unresolvedItemArrangement arrangementWithActiveItemSquishState:1];
      [(SFUnifiedTabBar *)self setItemArrangement:v33 animated:0 keepingItemVisible:0 completionHandler:0];
    }
    double v34 = -[SFUnifiedTabBarAnimatedResizingInfo initWithItemsToKeepVisible:targetContentOffset:]([SFUnifiedTabBarAnimatedResizingInfo alloc], "initWithItemsToKeepVisible:targetContentOffset:", v25, v14, v16);
  }

  return v34;
}

uint64_t __44__SFUnifiedTabBar__prepareForResizeIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutItemsAtIndexes:*(void *)(a1 + 40) usingLayout:*(void *)(*(void *)(a1 + 32) + 416)];
}

- (CGPoint)_targetContentOffsetForAnimatedResizeWithTargetLayout:(id)a3
{
  id v4 = a3;
  [(UIScrollView *)self->_scrollView contentOffset];
  double v6 = v5;
  double v8 = v7;
  if (self->_pinsScrollPositionToTrailingEdgeDuringResize)
  {
    if ([(UIView *)self _sf_usesLeftToRightLayout])
    {
      [(UIView *)self ss_untransformedFrame];
      double MinX = CGRectGetMinX(v46);
      double v6 = v6 + MinX - CGRectGetMinX(self->_lastLayoutFrame);
    }
  }
  else
  {
    double v10 = [(SFUnifiedTabBar *)self _firstFullyVisibleInactiveItem];
    if (v10)
    {
      [(SFUnifiedTabBarLayout *)self->_layout frameForItem:v10];
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat rect = v17;
      [v4 frameForItem:v10];
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      if ([(UIView *)self _sf_usesLeftToRightLayout])
      {
        v47.origin.double x = v12;
        v47.origin.CGFloat y = v14;
        v47.size.double width = v16;
        v47.size.height = rect;
        double v26 = CGRectGetMinX(v47);
        [(UIScrollView *)self->_scrollView bounds];
        double v27 = v26 - CGRectGetMinX(v48);
        v49.origin.double x = v19;
        v49.origin.CGFloat y = v21;
        v49.size.double width = v23;
        v49.size.height = v25;
        double v6 = CGRectGetMinX(v49) - v27;
      }
      else
      {
        [(UIScrollView *)self->_scrollView bounds];
        CGFloat v43 = v25;
        double MaxX = CGRectGetMaxX(v50);
        v51.origin.double x = v12;
        v51.origin.CGFloat y = v14;
        v51.size.double width = v16;
        v51.size.height = rect;
        double v29 = MaxX - CGRectGetMaxX(v51);
        v52.origin.double x = v19;
        v52.origin.CGFloat y = v21;
        v52.size.double width = v23;
        v52.size.height = v43;
        CGFloat v30 = CGRectGetMaxX(v52) + v29;
        [(SFUnifiedTabBar *)self bounds];
        double v6 = v30 - CGRectGetWidth(v53);
      }
    }
  }
  [(SFUnifiedTabBar *)self bounds];
  double v32 = v31;
  double v34 = v33;
  [v4 contentSize];
  -[SFUnifiedTabBar _adjustedContentOffsetForContentOffset:size:contentSize:](self, "_adjustedContentOffsetForContentOffset:size:contentSize:", v6, v8, v32, v34, v35, v36);
  double v38 = v37;
  double v40 = v39;

  double v41 = v38;
  double v42 = v40;
  result.CGFloat y = v42;
  result.double x = v41;
  return result;
}

- (void)_beginTransitioningSearchField
{
  [(SFUnifiedTabBar *)self _installSearchFieldIfNeeded];
  [(SFUnifiedTabBarItemView *)self->_itemViewOwningSearchField beginTransitioningSearchField];
  [(SFUnifiedTabBarItemView *)self->_itemViewOwningSearchField setShowsSearchField:[(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItemIsExpanded]];
  itemViewOwningSearchField = self->_itemViewOwningSearchField;

  [(SFUnifiedTabBarItemView *)itemViewOwningSearchField layoutIfNeeded];
}

- (void)_endTransitioningSearchFieldInItemView:(id)a3
{
  [a3 endTransitioningSearchField];

  [(SFUnifiedTabBar *)self _uninstallSearchFieldIfNeeded];
}

- (void)_installSearchFieldIfNeeded
{
  if ([(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItemIsExpanded])
  {
    id v3 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItem];
    char v4 = [v3 hasOverlayConfiguration];

    if ((v4 & 1) == 0)
    {
      double v5 = [(SFUnifiedTabBar *)self _activeTabBarItemView];
      itemViewOwningSearchField = self->_itemViewOwningSearchField;
      if (v5 != itemViewOwningSearchField)
      {
        double v10 = v5;
        double v7 = v5;
        double v8 = self->_itemViewOwningSearchField;
        self->_itemViewOwningSearchField = v7;
        double v9 = itemViewOwningSearchField;

        [(SFUnifiedTabBarItemView *)v7 setSearchField:self->_searchField];
        [(SFUnifiedTabBarItemView *)v9 setSearchField:0];
        [(SFUnifiedTabBarItemView *)v9 setShowsSearchField:0];
        [(SFUnifiedTabBarItemView *)v9 layoutIfNeeded];

        double v5 = v10;
      }
    }
  }
}

- (void)_uninstallSearchFieldIfNeeded
{
  if (![(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItemIsExpanded])
  {
    [(SFUnifiedTabBarItemView *)self->_itemViewOwningSearchField setSearchField:0];
    itemViewOwningSearchField = self->_itemViewOwningSearchField;
    self->_itemViewOwningSearchField = 0;
  }
}

- (id)dragPreviewForBarItem:(id)a3
{
  id v4 = a3;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v33.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v33.c = v5;
  *(_OWORD *)&v33.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  double v6 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement overflowPinnedItems];
  int v7 = [v6 containsObject:v4];

  layout = self->_layout;
  if (v7)
  {
    [(SFUnifiedTabBarLayout *)layout frameForItem:self->_pinnedOverflowItem];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    CGAffineTransformMakeScale(&v33, 0.0, 0.0);
  }
  else
  {
    [(SFUnifiedTabBarLayout *)layout frameForItem:v4];
    double v10 = v17;
    double v12 = v18;
    double v14 = v19;
    double v16 = v20;
  }
  itemViewRegistrationsByReuseIdentifier = self->_itemViewRegistrationsByReuseIdentifier;
  double v22 = [v4 viewReuseIdentifier];
  CGFloat v23 = [(NSMutableDictionary *)itemViewRegistrationsByReuseIdentifier objectForKeyedSubscript:v22];

  double v24 = [v23 createItemView];
  [v23 configureView:v24 forItem:v4 inArrangement:self->_itemArrangement isPreview:1];
  [v24 setBarMetrics:self->_barMetrics];
  [v24 setBarTheme:self->_barTheme];
  objc_msgSend(v24, "setFrame:", v10, v12, v14, v16);
  [v24 layoutIfNeeded];
  id v25 = objc_alloc(MEMORY[0x1E4FB1728]);
  scrollView = self->_scrollView;
  UIRectGetCenter();
  CGAffineTransform v32 = v33;
  double v27 = objc_msgSend(v25, "initWithContainer:center:transform:", scrollView, &v32);
  id v28 = objc_alloc(MEMORY[0x1E4FB1D40]);
  double v29 = [v24 previewParameters];
  CGFloat v30 = (void *)[v28 initWithView:v24 parameters:v29 target:v27];

  return v30;
}

- (id)dragPreviewForBarItem:(id)a3 pinned:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  itemViewRegistrationsByReuseIdentifier = self->_itemViewRegistrationsByReuseIdentifier;
  double v8 = [v6 viewReuseIdentifier];
  double v9 = [(NSMutableDictionary *)itemViewRegistrationsByReuseIdentifier objectForKeyedSubscript:v8];

  double v10 = [v9 dequeueOrCreateViewForItem:v6 isPreview:1];
  [v9 configureView:v10 forItem:v6 inArrangement:self->_itemArrangement isPreview:1];
  [(UIView *)self->_dragPreviewContainer addSubview:v10];
  [v10 setBarMetrics:self->_barMetrics];
  [v10 setBarTheme:self->_barTheme];
  layout = self->_layout;
  if (v4) {
    uint64_t v12 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement allowsScrollingPinnedItems] ^ 1;
  }
  else {
    uint64_t v12 = 0;
  }
  [(SFUnifiedTabBarLayout *)layout frameForPreviewingItem:v6 pinned:v12];
  objc_msgSend(v10, "setFrame:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v13 = v4
       && [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement allowsScrollingPinnedItems];
    [v10 setShowsPinnedIndicator:v13];
  }
  double v14 = (void *)MEMORY[0x1E4FB1EB0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __48__SFUnifiedTabBar_dragPreviewForBarItem_pinned___block_invoke;
  v20[3] = &unk_1E54E9858;
  id v21 = v10;
  id v15 = v10;
  [v14 performWithoutAnimation:v20];
  id v16 = objc_alloc(MEMORY[0x1E4FB1718]);
  double v17 = [v15 previewParameters];
  double v18 = (void *)[v16 initWithView:v15 parameters:v17];

  return v18;
}

uint64_t __48__SFUnifiedTabBar_dragPreviewForBarItem_pinned___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)cleanUpDragPreviewForBarItem:(id)a3
{
  id v4 = a3;
  id v3 = [v4 reusablePreviewView];
  [v3 removeFromSuperview];

  [v4 setReusablePreviewView:0];
}

- (void)_layoutAppearingItemsAtIndexes:(id)a3 withDistanceToScroll:(double)a4 usingLayout:(id)a5
{
  id v8 = a5;
  scrollView = self->_scrollView;
  id v10 = a3;
  [(UIScrollView *)scrollView bounds];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__SFUnifiedTabBar__layoutAppearingItemsAtIndexes_withDistanceToScroll_usingLayout___block_invoke;
  v16[3] = &unk_1E54EBB10;
  double v18 = v11 + a4;
  uint64_t v19 = v12;
  uint64_t v20 = v13;
  uint64_t v21 = v14;
  v16[4] = self;
  id v17 = v8;
  id v15 = v8;
  [v15 enumerateInitialLayoutForAppearingItemsAtIndexes:v10 withDistanceToScroll:v16 usingBlock:a4];
}

void __83__SFUnifiedTabBar__layoutAppearingItemsAtIndexes_withDistanceToScroll_usingLayout___block_invoke(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, uint64_t a7, uint64_t a8)
{
  id v14 = a2;
  v23.origin.double x = a3;
  v23.origin.CGFloat y = a4;
  v23.size.double width = a5;
  v23.size.height = a6;
  if (CGRectIntersectsRect(v23, *(CGRect *)(a1 + 48)))
  {
    id v15 = *(void **)(a1 + 32);
    id v16 = [*(id *)(a1 + 40) itemArrangement];
    id v17 = [v15 _viewForItem:v14 inArrangement:v16];

    double v18 = *(void **)(a1 + 32);
    long long v19 = *(_OWORD *)(a8 + 48);
    v21[2] = *(_OWORD *)(a8 + 32);
    v21[3] = v19;
    uint64_t v22 = *(void *)(a8 + 64);
    long long v20 = *(_OWORD *)(a8 + 16);
    v21[0] = *(_OWORD *)a8;
    v21[1] = v20;
    [v18 _applyLayoutInfo:v21 toItemView:v17];
    [v17 layoutIfNeeded];
  }
}

- (void)_layoutDisappearingItemsAtIndexes:(id)a3 withDistanceScrolled:(double)a4 usingLayout:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__SFUnifiedTabBar__layoutDisappearingItemsAtIndexes_withDistanceScrolled_usingLayout___block_invoke;
  v5[3] = &unk_1E54EBB38;
  void v5[4] = self;
  [a5 enumerateFinalLayoutForDisappearingItemsAtIndexes:a3 withDistanceScrolled:v5 usingBlock:a4];
}

void __86__SFUnifiedTabBar__layoutDisappearingItemsAtIndexes_withDistanceScrolled_usingLayout___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  int v7 = [v6 reusableView];
  if (v7)
  {
    id v8 = *(void **)(a1 + 32);
    long long v9 = *(_OWORD *)(a4 + 48);
    v11[2] = *(_OWORD *)(a4 + 32);
    _OWORD v11[3] = v9;
    uint64_t v12 = *(void *)(a4 + 64);
    long long v10 = *(_OWORD *)(a4 + 16);
    v11[0] = *(_OWORD *)a4;
    v11[1] = v10;
    [v8 _applyLayoutInfo:v11 toItemView:v7];
    [v7 layoutIfNeeded];
    [v6 setReusableView:0];
    [v7 setItem:0];
  }
}

- (void)revealActiveItemIfNeeded
{
}

- (void)_setRevealsSquishedActiveItem:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = a3 && [(SFUnifiedTabBarLayout *)self->_layout activeItemIsSquished];
  if (v6 != [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement revealsSquishedActiveItem])
  {
    id v7 = [(SFUnifiedTabBarItemArrangement *)self->_unresolvedItemArrangement arrangementWithActiveItemSquishState:v6];
    [(SFUnifiedTabBar *)self setItemArrangement:v7 animated:v4 keepingItemVisible:0 completionHandler:0];
  }
}

- (CGRect)pinnedItemDropArea
{
  [(SFUnifiedTabBarLayout *)self->_layout pinnedItemDropArea];
  scrollView = self->_scrollView;

  -[SFUnifiedTabBar convertRect:fromView:](self, "convertRect:fromView:", scrollView);
  result.size.height = v7;
  result.size.double width = v6;
  result.origin.CGFloat y = v5;
  result.origin.double x = v4;
  return result;
}

- (void)_layOutPinnedItemsSeparator
{
  id v3 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement pinnedItems];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    [(SFUnifiedTabBarLayout *)self->_layout pinnedItemsSeparatorFrame];
    p_pinnedItemsSeparator = &self->_pinnedItemsSeparator;
    -[UIView setFrame:](self->_pinnedItemsSeparator, "setFrame:");
    [(SFUnifiedTabBarLayout *)self->_layout pinnedItemsSeparatorOpacity];
    double v7 = v6 * SFBarContentAlphaForSquishTransformFactor(self->_squishTransformFactor);
  }
  else
  {
    p_pinnedItemsSeparator = &self->_pinnedItemsSeparator;
    double v7 = 0.0;
  }
  id v8 = *p_pinnedItemsSeparator;

  [(UIView *)v8 setAlpha:v7];
}

- (void)_updatePinnedItemsSeparator
{
  [(SFUnifiedTabBar *)self _setUpPinnedItemsSeparatorIfNeeded];

  [(SFUnifiedTabBar *)self _tearDownPinnedItemsSeparatorIfNeeded];
}

- (void)_setUpPinnedItemsSeparatorIfNeeded
{
  if (!self->_pinnedItemsSeparator)
  {
    id v3 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement pinnedItems];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      double v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      pinnedItemsSeparator = self->_pinnedItemsSeparator;
      self->_pinnedItemsSeparator = v5;

      double v7 = [(SFUnifiedBarTheme *)self->_barTheme separatorColor];
      [(UIView *)self->_pinnedItemsSeparator setBackgroundColor:v7];

      +[SFUnifiedBarMetrics separatorWidth];
      [(UIView *)self->_pinnedItemsSeparator _setCornerRadius:v8 * 0.5];
      [(SFUnifiedTabBarLayout *)self->_layout pinnedItemsSeparatorFrame];
      -[UIView setFrame:](self->_pinnedItemsSeparator, "setFrame:");
      [(UIView *)self->_pinnedItemsSeparator setAlpha:0.0];
      long long v9 = [(UIView *)self->_pinnedItemsSeparator layer];
      [v9 setZPosition:-1.79769313e308];

      scrollView = self->_scrollView;
      double v11 = self->_pinnedItemsSeparator;
      [(UIScrollView *)scrollView addSubview:v11];
    }
  }
}

- (void)_tearDownPinnedItemsSeparatorIfNeeded
{
  id v3 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement pinnedItems];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    [(UIView *)self->_pinnedItemsSeparator removeFromSuperview];
    pinnedItemsSeparator = self->_pinnedItemsSeparator;
    self->_pinnedItemsSeparator = 0;
  }
}

- (id)_pinnedOverflowMenu
{
  objc_initWeak(&location, self);
  id v2 = (void *)MEMORY[0x1E4FB1970];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__SFUnifiedTabBar__pinnedOverflowMenu__block_invoke;
  v5[3] = &unk_1E54EBBB0;
  objc_copyWeak(&v6, &location);
  id v3 = objc_msgSend(v2, "safari_menuWithUncachedChildrenProvider:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

id __38__SFUnifiedTabBar__pinnedOverflowMenu__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained[80] overflowPinnedItems];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __38__SFUnifiedTabBar__pinnedOverflowMenu__block_invoke_2;
    v7[3] = &unk_1E54EBB88;
    objc_copyWeak(&v8, v1);
    double v5 = objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", v7);
    objc_destroyWeak(&v8);
  }
  else
  {
    double v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

id __38__SFUnifiedTabBar__pinnedOverflowMenu__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__SFUnifiedTabBar__pinnedOverflowMenu__block_invoke_3;
  v6[3] = &unk_1E54EBB60;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  uint64_t v4 = [v3 menuElementRepresentationWithSelectionHandler:v6];
  objc_destroyWeak(&v7);

  return v4;
}

void __38__SFUnifiedTabBar__pinnedOverflowMenu__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained didSelectItem:v3];
}

- (unint64_t)_pinnedItemLimitForItemArrangement:(id)a3
{
  id v4 = a3;
  [(SFUnifiedTabBar *)self bounds];
  unint64_t v5 = +[SFUnifiedTabBarLayout pinnedItemLimitForItemArrangement:v4 tabBarWidth:self->_barMetrics barMetrics:[(SFUnifiedTabBar *)self isStandalone] standalone:CGRectGetWidth(v8)];
  id v6 = [v4 pinnedItems];

  LODWORD(v4) = objc_msgSend(v6, "safari_containsObjectPassingTest:", &__block_literal_global_64_0);
  return v5 + v4;
}

uint64_t __54__SFUnifiedTabBar__pinnedItemLimitForItemArrangement___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPlaceholder];
}

- (void)setRole:(int64_t)a3
{
  if (self->_role != a3)
  {
    self->_role = a3;
    BOOL v4 = [(SFUnifiedTabBar *)self _shouldDelayContentTouches];
    scrollView = self->_scrollView;
    [(UIScrollView *)scrollView setDelaysContentTouches:v4];
  }
}

- (BOOL)isStandalone
{
  return self->_role == 2;
}

- (void)setSearchFieldShowsFormatMenuButtonAccessories:(BOOL)a3
{
  if (self->_searchFieldShowsFormatMenuButtonAccessories != a3)
  {
    self->_searchFieldShowsFormatMenuButtonAccessories = a3;
    [(SFUnifiedTabBar *)self setNeedsLayout];
  }
}

- (BOOL)searchFieldShowsPersistentStopReloadButton
{
  id v2 = [(SFUnifiedTabBar *)self _activeTabBarItemView];
  char v3 = [v2 showsPersistentStopReloadButton];

  return v3;
}

- (BOOL)_centersContentForSingleItem
{
  return self->_role != 2;
}

- (BOOL)_shouldDelayContentTouches
{
  return (self->_role & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (void)setBarBackgroundAlpha:(double)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_barBackgroundAlpha != a3)
  {
    self->_barBackgroundAlpha = a3;
    [(_UIVisualEffectBackdropView *)self->_backgroundCaptureView setRenderMode:a3 < 1.0];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    unint64_t v5 = [(SFUnifiedTabBarLayout *)self->_layout visibleItems];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = [*(id *)(*((void *)&v11 + 1) + 8 * i) reusableView];
          [v10 setBarBackgroundAlpha:a3];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)setBarTheme:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_barTheme, a3);
  uint64_t v6 = [v5 titleTheme];
  [(SFUnifiedTabBarItemTitleContainerView *)self->_squishedTitleContainer setTheme:v6];

  -[SFUnifiedTabBarItemTitleContainerView setShowsPrivateAnnotation:](self->_squishedTitleContainer, "setShowsPrivateAnnotation:", [v5 isPrivate]);
  uint64_t v7 = [v5 separatorColor];
  [(UIView *)self->_pinnedItemsSeparator setBackgroundColor:v7];

  [(SFUnifiedTabBar *)self _updateMinimizedProgressViewFillColor];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [(UIScrollView *)self->_scrollView subviews];
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
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v13 setBarTheme:v5];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)setContentInset:(NSDirectionalEdgeInsets)a3
{
  if (a3.leading != self->_contentInset.leading
    || a3.top != self->_contentInset.top
    || a3.trailing != self->_contentInset.trailing
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:");
    [(SFUnifiedTabBar *)self setNeedsLayout];
  }
}

- (void)setMidpointForCenteredContent:(CGPoint)a3
{
  if (self->_midpointForCenteredContent.x != a3.x || self->_midpointForCenteredContent.y != a3.y)
  {
    self->_midpointForCenteredContent = a3;
    -[SFUnifiedTabBarLayout setMidpointForCenteredContent:](self->_layout, "setMidpointForCenteredContent:");
    [(SFUnifiedTabBar *)self setNeedsLayout];
  }
}

- (CGSize)preferredSize
{
  [(SFUnifiedTabBar *)self _preferredWidth];
  double v4 = v3;
  [(SFUnifiedBarMetrics *)self->_barMetrics itemHeight];
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.double width = v7;
  return result;
}

- (double)_preferredWidth
{
  if (self->_role != 1) {
    return 1.79769313e308;
  }
  [(SFUnifiedTabBarMetrics *)self->_barMetrics maximumActiveItemWidth];
  return result;
}

- (void)setSizeClass:(unint64_t)a3
{
  if (self->_sizeClass != a3)
  {
    self->_sizeClass = a3;
    [(SFUnifiedTabBar *)self setNeedsLayout];
  }
}

- (void)setThemeColorVisibility:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_themeColorVisibility != a3)
  {
    self->_themeColorVisibilitCGFloat y = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v4 = [(SFUnifiedTabBarLayout *)self->_layout visibleItems];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [*(id *)(*((void *)&v10 + 1) + 8 * i) reusableView];
          [v9 setThemeColorVisibility:a3];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)setSquishTransformFactor:(double)a3
{
  double squishTransformFactor = self->_squishTransformFactor;
  if (squishTransformFactor != a3)
  {
    char v5 = (a3 == 1.0) ^ (squishTransformFactor != 1.0);
    BOOL v6 = squishTransformFactor != 0.0 && a3 == 0.0;
    self->_double squishTransformFactor = a3;
    [(SFUnifiedTabBar *)self setNeedsLayout];
    if ((v5 & 1) == 0) {
      [(SFUnifiedTabBar *)self setNeedsFocusUpdate];
    }
    if (v6)
    {
      [(SFUnifiedTabBar *)self _setRevealsSquishedActiveItem:1 animated:0];
    }
  }
}

- (void)setSquishedContentInset:(UIEdgeInsets)a3
{
  if (self->_squishedContentInset.left != a3.left
    || self->_squishedContentInset.top != a3.top
    || self->_squishedContentInset.right != a3.right
    || self->_squishedContentInset.bottom != a3.bottom)
  {
    self->_squishedContentInset = a3;
    [(SFUnifiedTabBar *)self setNeedsLayout];
  }
}

- (NSArray)squishedAccessoryViews
{
  uint64_t v3 = [(SFUnifiedTabBarItemTitleContainerView *)self->_squishedTitleContainer squishedAccessoryViews];
  double v4 = (void *)v3;
  char v5 = (void *)MEMORY[0x1E4F1CBF0];
  if (v3) {
    char v5 = (void *)v3;
  }
  id v6 = v5;

  if (self->_minimizedProgressView)
  {
    uint64_t v7 = objc_msgSend(v6, "arrayByAddingObject:");

    id v6 = (id)v7;
  }

  return (NSArray *)v6;
}

- (void)_updateMinimizedProgressViewFillColor
{
  id v3 = [(_SFBarTheme *)self->_barTheme controlsTintColor];
  [(_SFFluidProgressView *)self->_minimizedProgressView setProgressBarFillColor:v3];
}

- (void)_updateShowsMinimizedProgressView
{
  uint64_t v3 = [(_SFFluidProgressView *)self->_minimizedProgressView isShowingProgress] ^ 1;
  minimizedProgressView = self->_minimizedProgressView;

  [(_SFFluidProgressView *)minimizedProgressView setHidden:v3];
}

- (void)setMinimizedProgressView:(id)a3
{
  char v5 = (_SFFluidProgressView *)a3;
  if (self->_minimizedProgressView != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_minimizedProgressView, a3);
    [(_SFFluidProgressView *)self->_minimizedProgressView setDelegate:self];
    [(SFUnifiedTabBar *)self _updateShowsMinimizedProgressView];
    [(SFUnifiedTabBar *)self _updateMinimizedProgressViewFillColor];
    char v5 = v6;
  }
}

- (void)setShowsSquishedAccessoryViews:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showsSquishedAccessoryViews = a3;
  -[SFUnifiedTabBarItemTitleContainerView setShowsSquishedAccessoryViews:](self->_squishedTitleContainer, "setShowsSquishedAccessoryViews:");
  id v5 = [(SFUnifiedTabBar *)self _activeTabBarItemView];
  [v5 setShowsSquishedAccessoryViews:v3];
}

- (BOOL)isCurrentlyScrollable
{
  return (self->_role | 2) == 2
      && [(SFUnifiedTabBarLayout *)self->_layout isCurrentlyScrollable];
}

- (double)preferredSquishedBottomSpacing
{
  squishedTitleContainer = self->_squishedTitleContainer;
  [(SFUnifiedBarMetrics *)self->_barMetrics itemHeight];
  -[SFUnifiedTabBarItemTitleContainerView urlBaselineToBottomBoundsDistanceForHeight:](squishedTitleContainer, "urlBaselineToBottomBoundsDistanceForHeight:");
  double v4 = v3;
  +[SFUnifiedBarMetrics minimumSquishScale];
  double v6 = v5;
  +[SFUnifiedBarMetrics defaultSquishedContentSpacing];
  return v7 - v4 * v6;
}

- (void)tabBarItemViewDidRequestFocusForPencilInput:(id)a3 completionHandler:(id)a4
{
  double v5 = (void (**)(void))a4;
  if ([(UITextField *)self->_searchField isFirstResponder])
  {
    double v6 = WBS_LOG_CHANNEL_PREFIXPencilInput();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SFUnifiedTabBar tabBarItemViewDidRequestFocusForPencilInput:completionHandler:](v6);
    }
    v5[2](v5);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained unifiedTabBarURLTapped:self completionHandler:v5];
    }
  }
}

- (void)tabBarItemViewCloseButtonTapped:(id)a3
{
  double v4 = [a3 item];
  if (v4)
  {
    double v5 = v4;
    [(SFUnifiedTabBar *)self closeItem:v4];
    double v4 = v5;
  }
}

- (void)tabBarItemViewMenuButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained unifiedTabBarMenuButtonTapped:self];
  }
}

- (void)tabBarItemViewMenuButtonReceivedTouchDown:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained unifiedTabBarMenuButtonReceivedTouchDown:self];
  }
}

- (void)tabBarItemViewMenuButtonClicked:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained unifiedTabBarMenuButtonClicked:self];
  }
}

- (void)tabBarItemViewVoiceSearchButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained unifiedTabBarVoiceSearchButtonTapped:self];
  }
}

- (void)tabBarItemViewReloadButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained unifiedTabBarReloadButtonTapped:self];
  }
}

- (void)tabBarItemViewStopButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained unifiedTabBarStopButtonTapped:self];
  }
}

- (void)tabBarItemViewReaderButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained unifiedTabBarReaderButtonTapped:self];
  }
}

- (void)tabBarItemViewTranslationButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained unifiedTabBarTranslationButtonTapped:self];
  }
}

- (void)tabBarItemViewMediaStateMuteButtonTapped:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if (objc_opt_respondsToSelector())
  {
    double v5 = [v6 item];
    [WeakRetained unifiedTabBar:self didTapMediaStateMuteButtonForItem:v5];
  }
}

- (void)tabBarItemView:(id)a3 extensionButtonTapped:(id)a4 extension:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained unifiedTabBar:self extensionButtonTapped:v9 extension:v7];
  }
}

- (void)tabBarItemView:(id)a3 multipleExtensionButtonTapped:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained unifiedTabBar:self multipleExtensionButtonTapped:v6];
  }
}

- (BOOL)tabBarItemViewCanBecomeFocused:(id)a3
{
  return self->_squishTransformFactor == 1.0;
}

- (void)tabBarItemView:(id)a3 didUpdateHovering:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = [a3 item];
  if (v4)
  {
    id v6 = self;
    id v7 = v10;
  }
  else
  {
    id v8 = [(SFUnifiedTabBarLayout *)self->_layout hoveringItem];

    id v9 = v10;
    if (v8 != v10) {
      goto LABEL_6;
    }
    id v6 = self;
    id v7 = 0;
  }
  [(SFUnifiedTabBar *)v6 _updateHoveringItem:v7];
  id v9 = v10;
LABEL_6:
}

- (void)tabBarItemView:(id)a3 didFinishShowingAvailabilityLabelOfType:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained unifiedTabBar:self didFinishShowingAvailabilityLabelOfType:a4];
  }
}

- (void)tabBarItemViewTitleChanged:(id)a3
{
  [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement setNeedsUpdateCachedItemTitles];
  if (!self->_isLayingOut)
  {
    [(SFUnifiedTabBar *)self setNeedsLayout];
  }
}

- (BOOL)tabBarItemViewShouldAnnotateWithTabEntity:(id)a3
{
  return self->_role != 1;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  [(SFUnifiedTabBar *)self _updateScrolling];
  lastTapToRevealActiveItemDate = self->_lastTapToRevealActiveItemDate;
  if (!lastTapToRevealActiveItemDate
    || ([(NSDate *)lastTapToRevealActiveItemDate safari_timeIntervalUntilNow], v5 > 0.1))
  {
    [(SFUnifiedTabBar *)self _setRevealsSquishedActiveItem:0 animated:1];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragObserver);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained unifiedTabBarWillBeginDragging:self];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  [(SFUnifiedTabBar *)self _updateScrolling];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragObserver);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained unifiedTabBarDidEndDragging:self];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    [(SFUnifiedTabBar *)self _updateScrolling];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dragObserver);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained unifiedTabBarDidEndDragging:self];
    }
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  objc_msgSend(a4, "location", a3);
  double v7 = v6;
  double v9 = v8;
  [(UIScrollView *)self->_scrollView frame];
  v39.double x = v7;
  v39.CGFloat y = v9;
  if (CGRectContainsPoint(v40, v39))
  {
    layout = self->_layout;
    -[UIScrollView convertPoint:fromView:](self->_scrollView, "convertPoint:fromView:", self, v7, v9);
    long long v11 = -[SFUnifiedTabBarLayout itemAtPoint:](layout, "itemAtPoint:");
    long long v12 = [v11 reusableView];

    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v13 = v12;
        -[SFUnifiedTabBar convertPoint:toView:](self, "convertPoint:toView:", v13, v7, v9);
        long long v14 = -[SFUnifiedTabBarPointerRegionIdentifier pointerRegionIdentifierForInteractionLocation:](v13, "pointerRegionIdentifierForInteractionLocation:");
        uint64_t v15 = v14;
        if (v14)
        {
          long long v16 = [v14 viewForPreview];
          [v16 frame];
          double v18 = v17;
          double v20 = v19;
          double v22 = v21;
          double v24 = v23;
          id v25 = [v15 viewForPreview];
          double v26 = [v25 superview];
          -[SFUnifiedTabBar convertRect:fromView:](self, "convertRect:fromView:", v26, v18, v20, v22, v24);
          double v28 = v27;
          double v30 = v29;
          double v32 = v31;
          double v34 = v33;

          double v35 = objc_msgSend(MEMORY[0x1E4FB1AD8], "regionWithRect:identifier:", v15, v28, v30, v32, v34);
        }
        else
        {
          double v35 = 0;
        }
      }
      else
      {
        long long v13 = objc_alloc_init(SFUnifiedTabBarPointerRegionIdentifier);
        [(SFUnifiedTabBarPointerRegionIdentifier *)v13 setViewForPreview:v12];
        [(SFUnifiedTabBarPointerRegionIdentifier *)v13 setPointerStyle:3];
        double v36 = (void *)MEMORY[0x1E4FB1AD8];
        [v12 bounds];
        -[SFUnifiedTabBar convertRect:fromView:](self, "convertRect:fromView:", v12);
        double v35 = objc_msgSend(v36, "regionWithRect:identifier:", v13);
      }
    }
    else
    {
      double v35 = 0;
    }
  }
  else
  {
    double v35 = 0;
  }

  return v35;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = a4;
  double v6 = [v5 identifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v8 = [v5 identifier];
    double v9 = [v8 viewForPreview];
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v9];
    switch([v8 pointerStyle])
    {
      case 0:
        long long v11 = [MEMORY[0x1E4FB1AB8] effectWithPreview:v10];
        [(SFUnifiedBarMetrics *)self->_barMetrics defaultItemHeight];
        double v13 = v12;
        [v9 bounds];
        double v15 = fmax(v14, v13);
        double v17 = fmin(v16, v13);
        [v9 center];
        v58.size.CGFloat width = *(CGFloat *)MEMORY[0x1E4F1DB30];
        v58.size.CGFloat height = *(CGFloat *)(MEMORY[0x1E4F1DB30] + 8);
        CGRect v59 = CGRectInset(v58, 2.0 - v15 * 0.5, 2.0 - v17 * 0.5);
        CGFloat x = v59.origin.x;
        CGFloat y = v59.origin.y;
        CGFloat width = v59.size.width;
        CGFloat height = v59.size.height;
        double v22 = (void *)MEMORY[0x1E4FB1AE0];
        [(SFUnifiedBarMetrics *)self->_barMetrics itemCornerRadius];
        double v24 = v23 + -2.0;
        goto LABEL_9;
      case 1:
        long long v11 = [MEMORY[0x1E4FB1AB8] effectWithPreview:v10];
        id v27 = v9;
        double v28 = [v27 superview];
        double v29 = [v27 imageView];
        [v29 frame];
        objc_msgSend(v28, "convertRect:fromView:", v27);
        CGFloat x = v30;
        CGFloat y = v31;
        CGFloat width = v32;
        CGFloat height = v33;

        double v34 = (void *)MEMORY[0x1E4FB1AE0];
        double v24 = 3.0;
        goto LABEL_10;
      case 2:
        long long v11 = [MEMORY[0x1E4FB1AB8] effectWithPreview:v10];
        id v35 = v9;
        double v36 = [v35 superview];
        double v37 = [v35 imageView];
        [v37 frame];
        objc_msgSend(v36, "convertRect:fromView:", v35);
        CGFloat v39 = v38;
        CGFloat v41 = v40;
        CGFloat v43 = v42;
        CGFloat v45 = v44;

        v60.origin.CGFloat x = v39;
        v60.origin.CGFloat y = v41;
        v60.size.CGFloat width = v43;
        v60.size.CGFloat height = v45;
        double v46 = CGRectGetWidth(v60);
        v61.origin.CGFloat x = v39;
        v61.origin.CGFloat y = v41;
        v61.size.CGFloat width = v43;
        v61.size.CGFloat height = v45;
        double v47 = CGRectGetHeight(v61);
        double v48 = fmax(v46, v47) + 8.0;
        CGFloat v49 = (v46 - v48) * 0.5;
        CGFloat v50 = (v47 - v48) * 0.5;
        v62.origin.CGFloat x = v39;
        v62.origin.CGFloat y = v41;
        v62.size.CGFloat width = v43;
        v62.size.CGFloat height = v45;
        CGRect v63 = CGRectInset(v62, v49, v50);
        double v34 = (void *)MEMORY[0x1E4FB1AE0];
        double v24 = 3.0;
        goto LABEL_11;
      case 3:
        long long v11 = [MEMORY[0x1E4FB1AB8] effectWithPreview:v10];
        double v22 = (void *)MEMORY[0x1E4FB1AE0];
        [v9 frame];
        CGFloat x = v51;
        CGFloat y = v52;
        CGFloat width = v53;
        CGFloat height = v54;
        [(SFUnifiedBarMetrics *)self->_barMetrics itemCornerRadius];
        double v24 = v55;
LABEL_9:
        double v34 = v22;
LABEL_10:
        v63.origin.CGFloat x = x;
        v63.origin.CGFloat y = y;
        v63.size.CGFloat width = width;
        v63.size.CGFloat height = height;
LABEL_11:
        double v26 = objc_msgSend(v34, "shapeWithRoundedRect:cornerRadius:", v63.origin.x, v63.origin.y, v63.size.width, v63.size.height, v24);
        break;
      default:
        double v26 = 0;
        long long v11 = 0;
        break;
    }
    id v25 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v11 shape:v26];
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v7 = [a3 nextFocusedView];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v7;
  }
  else {
    id v5 = 0;
  }
  double v6 = [v5 item];
  if (v6) {
    [(SFUnifiedTabBar *)self scrollToItem:v6 animated:1];
  }
}

- (id)preferredFocusEnvironments
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItem];
  double v3 = [v2 reusableView];

  if (v3)
  {
    v6[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (double)barBackgroundAlpha
{
  return self->_barBackgroundAlpha;
}

- (SFUnifiedBarTheme)barTheme
{
  return self->_barTheme;
}

- (NSDirectionalEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double leading = self->_contentInset.leading;
  double bottom = self->_contentInset.bottom;
  double trailing = self->_contentInset.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (CGPoint)midpointForCenteredContent
{
  double x = self->_midpointForCenteredContent.x;
  double y = self->_midpointForCenteredContent.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)pinsScrollPositionToTrailingEdgeDuringResize
{
  return self->_pinsScrollPositionToTrailingEdgeDuringResize;
}

- (void)setPinsScrollPositionToTrailingEdgeDuringResize:(BOOL)a3
{
  self->_pinsScrollPositionToTrailingEdgeDuringResize = a3;
}

- (unint64_t)sizeClass
{
  return self->_sizeClass;
}

- (double)themeColorVisibility
{
  return self->_themeColorVisibility;
}

- (double)squishTransformFactor
{
  return self->_squishTransformFactor;
}

- (UIEdgeInsets)squishedContentInset
{
  double top = self->_squishedContentInset.top;
  double left = self->_squishedContentInset.left;
  double bottom = self->_squishedContentInset.bottom;
  double right = self->_squishedContentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)showsSquishedAccessoryViews
{
  return self->_showsSquishedAccessoryViews;
}

- (SFUnifiedTabBarMetrics)barMetrics
{
  return self->_barMetrics;
}

- (SFUnifiedTabBarItemArrangement)itemArrangement
{
  return self->_itemArrangement;
}

- (BOOL)itemsNeedEraserBasedCutoutBorder
{
  return self->_itemsNeedEraserBasedCutoutBorder;
}

- (SFUnifiedTabBarDragObserving)dragObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragObserver);

  return (SFUnifiedTabBarDragObserving *)WeakRetained;
}

- (void)setDragObserver:(id)a3
{
}

- (SFUnifiedTabBarNavigationDelegate)navigationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);

  return (SFUnifiedTabBarNavigationDelegate *)WeakRetained;
}

- (void)setNavigationDelegate:(id)a3
{
}

- (int64_t)role
{
  return self->_role;
}

- (BOOL)isContentHidden
{
  return self->_contentHidden;
}

- (void)setContentHidden:(BOOL)a3
{
  self->_contentHidden = a3;
}

- (BOOL)searchFieldShowsFormatMenuButtonAccessories
{
  return self->_searchFieldShowsFormatMenuButtonAccessories;
}

- (SFTabHoverPreviewController)tabHoverPreviewController
{
  return self->_tabHoverPreviewController;
}

- (_SFFluidProgressView)minimizedProgressView
{
  return self->_minimizedProgressView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabHoverPreviewController, 0);
  objc_destroyWeak((id *)&self->_navigationDelegate);
  objc_destroyWeak((id *)&self->_dragObserver);
  objc_storeStrong((id *)&self->_itemArrangement, 0);
  objc_storeStrong((id *)&self->_barMetrics, 0);
  objc_storeStrong((id *)&self->_barTheme, 0);
  objc_storeStrong((id *)&self->_searchField, 0);
  objc_storeStrong((id *)&self->_minimizedProgressView, 0);
  objc_storeStrong((id *)&self->_unresolvedItemArrangement, 0);
  objc_storeStrong((id *)&self->_lastTapToRevealActiveItemDate, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_hoverRecognizer, 0);
  objc_storeStrong((id *)&self->_dragPreviewContainer, 0);
  objc_storeStrong((id *)&self->_pinnedOverflowItem, 0);
  objc_storeStrong((id *)&self->_pinnedItemsSeparator, 0);
  objc_storeStrong((id *)&self->_backgroundCaptureView, 0);
  objc_storeStrong((id *)&self->_searchFieldPopoverAlignmentView, 0);
  objc_storeStrong((id *)&self->_itemViewOwningSearchField, 0);
  objc_storeStrong((id *)&self->_squishedTitleContainer, 0);
  objc_storeStrong((id *)&self->_itemViewRegistrationsByReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_layout, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

- (void)tabBarItemViewDidRequestFocusForPencilInput:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18C354000, log, OS_LOG_TYPE_ERROR, "Search field is already first responder, early returning", v1, 2u);
}

@end