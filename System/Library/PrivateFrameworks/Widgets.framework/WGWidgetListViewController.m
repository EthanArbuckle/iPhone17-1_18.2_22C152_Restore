@interface WGWidgetListViewController
- (BOOL)isEditingIcons;
- (BOOL)isWidgetExtensionVisible:(id)a3;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldBlurContent;
- (BOOL)shouldIncludeScrollView;
- (CGRect)_visibleContentFrameForBounds:(CGRect)a3 withContentOccludingInsets:(UIEdgeInsets)a4;
- (CGRect)visibleFrameForWidget:(id)a3;
- (CGSize)_maxVisibleContentSize;
- (CGSize)maxSizeForWidget:(id)a3 forDisplayMode:(int64_t)a4;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (NSArray)_previouslyVisibleWidgetIDs;
- (NSLayoutConstraint)stackViewBottomConstraint;
- (NSMutableDictionary)resizeContexts;
- (NSString)_group;
- (UIControl)editButton;
- (UIEdgeInsets)layoutMarginForWidget:(id)a3;
- (UIEdgeInsets)marginInsetsForWidget:(id)a3;
- (UIScrollView)widgetListView;
- (WGWidgetListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (WGWidgetListViewController)initWithWidgetDiscoveryController:(id)a3;
- (WGWidgetListViewControllerDelegatePrivate)delegate;
- (id)_animatablePropertiesForStackViewUpdate;
- (id)_beginInsertion:(BOOL)a3 ofListItem:(id)a4 withOrderedIdentifiers:(id)a5 removingViewIfPossible:(BOOL)a6;
- (id)_identifierForCell:(id)a3;
- (id)_insert:(BOOL)a3 listItem:(id)a4 withOrderedIdentifiers:(id)a5 animated:(BOOL)a6;
- (id)_listItemViewControllerForWidgetWithIdentifier:(id)a3 creatingIfNecessary:(BOOL)a4;
- (id)_newCaptureOnlyMaterialView;
- (id)_platterViewAtLocation:(CGPoint)a3;
- (id)_platterViewForWidgetWithIdentifier:(id)a3 creatingIfNecessary:(BOOL)a4;
- (id)_scrollViewIfLoaded;
- (id)_scrollViewLoadingIfNecessary:(BOOL)a3;
- (id)_widgetIdentifiersForPlatterViewsVisibleInBounds;
- (id)_wrapperViewForWidgetPlatterView:(id)a3;
- (id)visibleWidgetIdentifiers;
- (id)widgetListItemViewController:(id)a3 widgetHostWithIdentifier:(id)a4;
- (unint64_t)_insertionIndexofListItem:(id)a3 intoWidgetViews:(id)a4 withOrderedIdentifiers:(id)a5;
- (unint64_t)widgetCount;
- (void)_adjustContentOffsetToInsideContent:(BOOL)a3;
- (void)_cancelTouchesForHitWidgetIfNecessaryAndDisableTouchesOnAllWidgets;
- (void)_cancelTouchesForWidget:(id)a3;
- (void)_configureAlternateCaptureOnlyMaterialViewWithUserInterfaceStyle:(int64_t)a3;
- (void)_configureCaptureOnlyMaterialView;
- (void)_configureScrollView;
- (void)_configureStackView;
- (void)_createPropertiesForStackViewUpdate;
- (void)_didUpdateStackViewArrangedSubviews;
- (void)_disableTouchesOnAllWidgets;
- (void)_enableTouchesOnAllWidgets;
- (void)_invalidateAllAlternateCaptureOnlyMaterialViews;
- (void)_invalidateAllCancelTouchesAssertions;
- (void)_invalidateAlternateCaptureOnlyMaterialViewWithUserInterfaceStyle:(int64_t)a3;
- (void)_invokeBlock:(id)a3 withPlatterViewsPassingTest:(id)a4;
- (void)_invokeBlockWithAllPlatterViews:(id)a3;
- (void)_invokeBlockWithPlatterViewsVisibleInBounds:(id)a3;
- (void)_invokeBlockWithPlatterViewsVisibleInRect:(CGRect)a3 block:(id)a4;
- (void)_presentEditViewController;
- (void)_pruneAlternateCaptureOnlyMaterialViews;
- (void)_repopulateStackView;
- (void)_repopulateStackViewWithWidgetIdentifiers:(id)a3;
- (void)_resizeCell:(id)a3;
- (void)_scrollViewDidStop;
- (void)_setPreviouslyVisibleWidgetIDs:(id)a3;
- (void)_stackViewArrangedSubviewsTransformPresentationValueChanged;
- (void)_updateBackgroundViewForPlatter:(id)a3;
- (void)_updateWidgetViewStateWithPreviouslyVisibleWidgetIdentifiers:(id)a3;
- (void)brokenViewDidAppearForWidget:(id)a3;
- (void)dealloc;
- (void)makeVisibleWidgetWithIdentifier:(id)a3 completion:(id)a4;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)registerWidgetForRefreshEvents:(id)a3;
- (void)remoteViewControllerDidDisconnectForWidget:(id)a3;
- (void)remoteViewControllerViewDidAppearForWidget:(id)a3;
- (void)remoteViewControllerViewDidHideForWidget:(id)a3;
- (void)resizeWidgetWrapperView:(id)a3 toSize:(CGSize)a4 withTransitionContext:(id)a5 completion:(id)a6;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidScrollToTop:(id)a3;
- (void)scrollViewWillBeginDecelerating:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setDelegate:(id)a3;
- (void)setEditButton:(id)a3;
- (void)setEditingIcons:(BOOL)a3;
- (void)setResizeContexts:(id)a3;
- (void)setShouldBlurContent:(BOOL)a3;
- (void)setShouldIncludeScrollView:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)unregisterWidgetForRefreshEvents:(id)a3;
- (void)updatePreviouslyVisibleWidgetIDs;
- (void)updateWidgetViewState;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)widget:(id)a3 didChangeLargestSupportedDisplayMode:(int64_t)a4;
- (void)widgetDiscoveryController:(id)a3 orderDidChangeForWidgetIdentifiers:(id)a4;
- (void)widgetDiscoveryControllerSignificantWidgetsChange:(id)a3;
@end

@implementation WGWidgetListViewController

- (WGWidgetListViewController)initWithWidgetDiscoveryController:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"WGWidgetListViewController.m", 58, @"Invalid parameter not satisfying: %@", @"discoveryController" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)WGWidgetListViewController;
  v7 = [(WGWidgetListViewController *)&v11 initWithNibName:0 bundle:0];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_discoveryController, a3);
    v8->_shouldIncludeScrollView = 0;
  }

  return v8;
}

- (WGWidgetListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"WGWidgetListViewController.m" lineNumber:67 description:@"Not a valid initializer."];

  return 0;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(WGWidgetListViewController *)self _invalidateAllCancelTouchesAssertions];
  v4.receiver = self;
  v4.super_class = (Class)WGWidgetListViewController;
  [(WGWidgetListViewController *)&v4 dealloc];
}

- (UIScrollView)widgetListView
{
  if ([(WGWidgetListViewController *)self shouldIncludeScrollView])
  {
    v3 = [(WGWidgetListViewController *)self _scrollViewIfLoaded];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      v3 = [WeakRetained scrollViewForWidgetListViewController:self];
    }
    else
    {
      v3 = 0;
    }
  }
  return (UIScrollView *)v3;
}

- (unint64_t)widgetCount
{
  return 1;
}

- (void)setShouldBlurContent:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_shouldBlurContent != a3)
  {
    self->_shouldBlurContent = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v4 = [(NSMutableDictionary *)self->_widgetIDsToItemVCs allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) platterView];
          [(WGWidgetListViewController *)self _updateBackgroundViewForPlatter:v9];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (NSString)_group
{
  objc_super v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"WGWidgetListViewController.m" lineNumber:107 description:@"Abstract"];

  return 0;
}

- (id)_listItemViewControllerForWidgetWithIdentifier:(id)a3 creatingIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 length])
  {
    widgetIDsToItemVCs = self->_widgetIDsToItemVCs;
    if (!widgetIDsToItemVCs)
    {
      uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      v9 = self->_widgetIDsToItemVCs;
      self->_widgetIDsToItemVCs = v8;

      widgetIDsToItemVCs = self->_widgetIDsToItemVCs;
    }
    long long v10 = [(NSMutableDictionary *)widgetIDsToItemVCs objectForKey:v6];
    if (v10) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = !v4;
    }
    if (!v11)
    {
      long long v10 = [[WGWidgetListItemViewController alloc] initWithWidgetIdentifier:v6];
      [(WGWidgetListItemViewController *)v10 setDelegate:self];
      [(WGWidgetListItemViewController *)v10 setAdjustsFontForContentSizeCategory:1];
      long long v12 = [(WGWidgetListItemViewController *)v10 platterView];
      [(WGWidgetListViewController *)self _updateBackgroundViewForPlatter:v12];

      [(NSMutableDictionary *)self->_widgetIDsToItemVCs setObject:v10 forKey:v6];
    }
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

- (id)_platterViewForWidgetWithIdentifier:(id)a3 creatingIfNecessary:(BOOL)a4
{
  BOOL v4 = [(WGWidgetListViewController *)self _listItemViewControllerForWidgetWithIdentifier:a3 creatingIfNecessary:a4];
  uint64_t v5 = [v4 platterView];

  return v5;
}

- (void)_configureStackView
{
  v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v4 = [v3 integerForKey:@"WGAzulWidgetsType"];

  uint64_t v5 = (UIStackView *)objc_alloc_init(MEMORY[0x263F1C9B8]);
  stackView = self->_stackView;
  self->_stackView = v5;

  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView setSpacing:8.0];
  [(UIStackView *)self->_stackView setPreservesSuperviewLayoutMargins:1];
  if ([(WGWidgetListViewController *)self shouldIncludeScrollView]) {
    [(WGWidgetListViewController *)self widgetListView];
  }
  else {
  id v24 = [(WGWidgetListViewController *)self view];
  }
  [v24 addSubview:self->_stackView];
  uint64_t v7 = [(UIStackView *)self->_stackView leadingAnchor];
  uint64_t v8 = [v24 leadingAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  long long v10 = self->_stackView;
  if (v4 == 1)
  {
    BOOL v11 = [(UIStackView *)v10 widthAnchor];
    long long v12 = [v11 constraintEqualToConstant:200.0];
    [v12 setActive:1];
  }
  else
  {
    long long v13 = [(UIStackView *)v10 trailingAnchor];
    v14 = [v24 trailingAnchor];
    uint64_t v15 = [v13 constraintEqualToAnchor:v14];
    [v15 setActive:1];

    BOOL v11 = [(UIStackView *)self->_stackView widthAnchor];
    long long v12 = [v24 widthAnchor];
    v16 = [v11 constraintEqualToAnchor:v12];
    [v16 setActive:1];
  }
  v17 = [(UIStackView *)self->_stackView topAnchor];
  v18 = [v24 topAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  [v19 setActive:1];

  v20 = [(UIStackView *)self->_stackView bottomAnchor];
  v21 = [v24 bottomAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  stackViewBottomConstraint = self->_stackViewBottomConstraint;
  self->_stackViewBottomConstraint = v22;

  [(NSLayoutConstraint *)self->_stackViewBottomConstraint setActive:1];
  [(UIStackView *)self->_stackView setAxis:1];
}

- (void)_repopulateStackViewWithWidgetIdentifiers:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = [(UIStackView *)self->_stackView arrangedSubviews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * v9++) removeFromSuperview];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  [(WGWidgetListViewController *)self _invalidateAllAlternateCaptureOnlyMaterialViews];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = -[WGWidgetListViewController _listItemViewControllerForWidgetWithIdentifier:creatingIfNecessary:](self, "_listItemViewControllerForWidgetWithIdentifier:creatingIfNecessary:", *(void *)(*((void *)&v18 + 1) + 8 * v14), 1, (void)v18);
        uint64_t v16 = [(WGWidgetListViewController *)self _insert:1 listItem:v15 withOrderedIdentifiers:v10 animated:0];
        v17 = (void *)v16;
        if (v16) {
          (*(void (**)(uint64_t))(v16 + 16))(v16);
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v12);
  }
}

- (unint64_t)_insertionIndexofListItem:(id)a3 intoWidgetViews:(id)a4 withOrderedIdentifiers:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    id v10 = [v7 widgetIdentifier];
    unint64_t v11 = [v9 indexOfObject:v10];

    if (v11 && v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v12 = v11 - 1;
      if (v12 < 0)
      {
        unint64_t v11 = 0;
      }
      else
      {
        do
        {
          uint64_t v13 = [v9 objectAtIndex:v12];
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          v18[2] = __95__WGWidgetListViewController__insertionIndexofListItem_intoWidgetViews_withOrderedIdentifiers___block_invoke;
          v18[3] = &unk_264676E08;
          id v19 = v13;
          id v14 = v13;
          uint64_t v15 = [v8 indexOfObjectPassingTest:v18];

          BOOL v16 = v12-- != 0;
        }
        while (v16 && v15 == 0x7FFFFFFFFFFFFFFFLL);
        if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v11 = 0;
        }
        else {
          unint64_t v11 = v15 + 1;
        }
      }
    }
  }
  else
  {
    unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v11;
}

uint64_t __95__WGWidgetListViewController__insertionIndexofListItem_intoWidgetViews_withOrderedIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = WGSafeCast(v5, v3);

  id v7 = [v6 platterView];
  id v8 = WGSafeCast(v4, v7);
  id v9 = [v8 listItem];
  id v10 = [v9 widgetIdentifier];
  uint64_t v11 = [v10 isEqualToString:*(void *)(a1 + 32)];

  return v11;
}

- (id)_beginInsertion:(BOOL)a3 ofListItem:(id)a4 withOrderedIdentifiers:(id)a5 removingViewIfPossible:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v11)
  {
    if ([(WGWidgetListViewController *)self isViewLoaded])
    {
      if (!v8)
      {
        if (v6)
        {
          widgetIDsToItemVCs = self->_widgetIDsToItemVCs;
          long long v22 = [v11 widgetIdentifier];
          [(NSMutableDictionary *)widgetIDsToItemVCs removeObjectForKey:v22];
        }
        goto LABEL_15;
      }
      uint64_t v13 = [(UIStackView *)self->_stackView arrangedSubviews];
      unint64_t v14 = [(WGWidgetListViewController *)self _insertionIndexofListItem:v11 intoWidgetViews:v13 withOrderedIdentifiers:v12];

      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_15:
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __103__WGWidgetListViewController__beginInsertion_ofListItem_withOrderedIdentifiers_removingViewIfPossible___block_invoke_2;
        v33[3] = &unk_264676810;
        BOOL v35 = v8;
        v33[4] = self;
        id v34 = v11;
        v29 = (void *)MEMORY[0x223CAA850](v33);

        goto LABEL_18;
      }
      uint64_t v15 = [v11 parentViewController];

      if (v15 == self)
      {
LABEL_14:
        long long v24 = [WGWidgetWrapperView alloc];
        long long v25 = [v11 platterView];
        v26 = [(WGWidgetWrapperView *)v24 initWithPlatterView:v25];

        v27 = (void *)MEMORY[0x263F1CB60];
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __103__WGWidgetListViewController__beginInsertion_ofListItem_withOrderedIdentifiers_removingViewIfPossible___block_invoke;
        v36[3] = &unk_264676CC8;
        v36[4] = self;
        v37 = v26;
        unint64_t v38 = v14;
        uint64_t v28 = v26;
        [v27 performWithoutAnimation:v36];

        goto LABEL_15;
      }
      [(WGWidgetListViewController *)self addChildViewController:v11];
      BOOL v16 = [v11 widgetIdentifier];
      BOOL v17 = WGIsWidgetWithBundleIdentifierBuiltOnOrAfterSystemVersion(v16, @"10.0");

      if (v17)
      {
        long long v18 = [v11 widgetIdentifier];
        BOOL v19 = WGIsWidgetWithBundleIdentifierBuiltOnOrAfterSystemVersion(v18, @"13.0");

        if (v19)
        {
LABEL_13:
          [v11 didMoveToParentViewController:self];
          goto LABEL_14;
        }
        uint64_t v20 = 1;
      }
      else
      {
        uint64_t v20 = 2;
      }
      long long v23 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:v20];
      [(WGWidgetListViewController *)self setOverrideTraitCollection:v23 forChildViewController:v11];

      [(WGWidgetListViewController *)self _configureAlternateCaptureOnlyMaterialViewWithUserInterfaceStyle:v20];
      goto LABEL_13;
    }
  }
  else
  {
    v30 = [MEMORY[0x263F08690] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"WGWidgetListViewController.m", 197, @"Invalid parameter not satisfying: %@", @"listItemVC" object file lineNumber description];

    [(WGWidgetListViewController *)self isViewLoaded];
  }
  v29 = 0;
LABEL_18:
  v31 = (void *)[v29 copy];

  return v31;
}

uint64_t __103__WGWidgetListViewController__beginInsertion_ofListItem_withOrderedIdentifiers_removingViewIfPossible___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1008) insertArrangedSubview:*(void *)(a1 + 40) atIndex:*(void *)(a1 + 48)];
  v2 = [*(id *)(a1 + 32) widgetListView];
  [v2 layoutIfNeeded];

  id v3 = *(void **)(a1 + 32);
  return [v3 _didUpdateStackViewArrangedSubviews];
}

void __103__WGWidgetListViewController__beginInsertion_ofListItem_withOrderedIdentifiers_removingViewIfPossible___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    v2 = *(void **)(a1 + 32);
    id v3 = [*(id *)(a1 + 40) platterView];
    id v4 = [v2 _wrapperViewForWidgetPlatterView:v3];

    [v4 removeFromSuperview];
    [*(id *)(a1 + 40) willMoveToParentViewController:0];
    [*(id *)(a1 + 40) removeFromParentViewController];
  }
}

- (void)_didUpdateStackViewArrangedSubviews
{
  [(WGWidgetListViewController *)self _createPropertiesForStackViewUpdate];
  id v3 = (void *)MEMORY[0x263F1CB60];
  id v4 = [(WGWidgetListViewController *)self _animatablePropertiesForStackViewUpdate];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__WGWidgetListViewController__didUpdateStackViewArrangedSubviews__block_invoke;
  v5[3] = &unk_264676588;
  v5[4] = self;
  [v3 _createTransformerWithInputAnimatableProperties:v4 presentationValueChangedCallback:v5];
}

uint64_t __65__WGWidgetListViewController__didUpdateStackViewArrangedSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stackViewArrangedSubviewsTransformPresentationValueChanged];
}

- (void)_createPropertiesForStackViewUpdate
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(WGWidgetListViewController *)self resizeContexts];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = [(WGWidgetListViewController *)self resizeContexts];
    BOOL v6 = [v5 allValues];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [*(id *)(*((void *)&v14 + 1) + 8 * v10) resizeProgress];
          [v11 invalidate];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    [(WGWidgetListViewController *)self setResizeContexts:0];
  }
  id v12 = [(WGWidgetListViewController *)self resizeContexts];

  if (!v12)
  {
    id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(WGWidgetListViewController *)self setResizeContexts:v13];
  }
}

- (id)_animatablePropertiesForStackViewUpdate
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v4 = [(UIStackView *)self->_stackView arrangedSubviews];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__WGWidgetListViewController__animatablePropertiesForStackViewUpdate__block_invoke;
  v9[3] = &unk_264676D40;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [v4 enumerateObjectsUsingBlock:v9];
  BOOL v6 = v10;
  id v7 = v5;

  return v7;
}

void __69__WGWidgetListViewController__animatablePropertiesForStackViewUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v3 = [*(id *)(a1 + 32) _identifierForCell:v9];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = objc_alloc_init(_WGCarouselCellResizeContext);
      id v5 = objc_alloc_init(MEMORY[0x263F1CB70]);
      [(_WGCarouselCellResizeContext *)v4 setResizeProgress:v5];

      [(_WGCarouselCellResizeContext *)v4 setActive:0];
      BOOL v6 = *(void **)(a1 + 40);
      id v7 = [(_WGCarouselCellResizeContext *)v4 resizeProgress];
      [v6 addObject:v7];

      uint64_t v8 = [*(id *)(a1 + 32) resizeContexts];
      [v8 setObject:v4 forKey:v3];
    }
  }
}

- (void)_resizeCell:(id)a3
{
  id v18 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v18 platterView];
    id v5 = [v4 listItem];
    BOOL v6 = [v5 widgetIdentifier];

    id v7 = [(WGWidgetListViewController *)self resizeContexts];
    uint64_t v8 = [v7 objectForKey:v6];

    double v9 = -1.0;
    if ([v8 isActive])
    {
      [v8 compactHeight];
      double v11 = v10;
      id v12 = [v8 resizeProgress];
      [v12 presentationValue];
      double v14 = v13;
      [v8 expandedHeight];
      double v16 = v15;
      [v8 compactHeight];
      double v9 = v11 + v14 * (v16 - v17);
    }
    [v18 setOverrideIntrinsicContentHeight:v9];
  }
}

- (void)_stackViewArrangedSubviewsTransformPresentationValueChanged
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(UIStackView *)self->_stackView arrangedSubviews];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(WGWidgetListViewController *)self _resizeCell:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(UIStackView *)self->_stackView layoutIfNeeded];
}

- (id)_insert:(BOOL)a3 listItem:(id)a4 withOrderedIdentifiers:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v11)
  {
    if ([(WGWidgetListViewController *)self isViewLoaded])
    {
      uint64_t v13 = [(WGWidgetListViewController *)self _beginInsertion:v8 ofListItem:v11 withOrderedIdentifiers:v12 removingViewIfPossible:1];
      if (!v6) {
        goto LABEL_8;
      }
      double v14 = [v11 platterView];
      double v15 = [(WGWidgetListViewController *)self _wrapperViewForWidgetPlatterView:v14];

      if (v8)
      {
        double v16 = (void *)MEMORY[0x263F1CB60];
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __79__WGWidgetListViewController__insert_listItem_withOrderedIdentifiers_animated___block_invoke;
        v28[3] = &unk_264676680;
        id v29 = v15;
        v30 = self;
        [v16 performWithoutAnimation:v28];
      }
      double v17 = (void *)MEMORY[0x263F1CB60];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __79__WGWidgetListViewController__insert_listItem_withOrderedIdentifiers_animated___block_invoke_2;
      v24[3] = &unk_264676810;
      BOOL v27 = v8;
      id v25 = v15;
      v26 = self;
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __79__WGWidgetListViewController__insert_listItem_withOrderedIdentifiers_animated___block_invoke_3;
      v22[3] = &unk_264676E30;
      id v23 = v13;
      id v18 = v15;
      [v17 animateWithDuration:0 delay:v24 usingSpringWithDamping:v22 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:0.0];
    }
  }
  else
  {
    long long v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"WGWidgetListViewController.m", 302, @"Invalid parameter not satisfying: %@", @"listItemVC" object file lineNumber description];

    [(WGWidgetListViewController *)self isViewLoaded];
  }
  uint64_t v13 = 0;
LABEL_8:
  uint64_t v19 = (void *)MEMORY[0x223CAA850](v13);

  return v19;
}

void __79__WGWidgetListViewController__insert_listItem_withOrderedIdentifiers_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:1];
  id v2 = [*(id *)(a1 + 40) widgetListView];
  [v2 layoutIfNeeded];
}

void __79__WGWidgetListViewController__insert_listItem_withOrderedIdentifiers_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:*(unsigned char *)(a1 + 48) == 0];
  id v2 = [*(id *)(a1 + 40) widgetListView];
  [v2 layoutIfNeeded];
}

uint64_t __79__WGWidgetListViewController__insert_listItem_withOrderedIdentifiers_animated___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_pruneAlternateCaptureOnlyMaterialViews
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (self->_userInterfaceStylesToCaptureOnlyMaterialViews)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v4 = self->_widgetIDsToItemVCs;
    uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v26;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v26 != v7) {
            objc_enumerationMutation(v4);
          }
          long long v9 = [(WGWidgetListViewController *)self overrideTraitCollectionForChildViewController:*(void *)(*((void *)&v25 + 1) + 8 * v8)];
          long long v10 = v9;
          if (v9)
          {
            uint64_t v11 = [v9 userInterfaceStyle];
            if (v11)
            {
              id v12 = [NSNumber numberWithInteger:v11];
              [v3 addObject:v12];
            }
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v6);
    }

    id v13 = objc_alloc(MEMORY[0x263EFF9C0]);
    double v14 = [(NSMutableDictionary *)self->_userInterfaceStylesToCaptureOnlyMaterialViews allKeys];
    double v15 = (void *)[v13 initWithArray:v14];

    [v15 minusSet:v3];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v22;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v16);
          }
          -[WGWidgetListViewController _invalidateAlternateCaptureOnlyMaterialViewWithUserInterfaceStyle:](self, "_invalidateAlternateCaptureOnlyMaterialViewWithUserInterfaceStyle:", objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v20++), "integerValue", (void)v21));
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v18);
    }
  }
}

- (id)_newCaptureOnlyMaterialView
{
  id v2 = [MEMORY[0x263F53FE8] materialViewWithRecipe:2];
  [v2 setGroupNameBase:@"WGWidgetListViewControllerGroupName"];
  [v2 setCaptureOnly:1];
  [v2 setAutoresizingMask:18];
  return v2;
}

- (void)_configureCaptureOnlyMaterialView
{
  id v3 = [(WGWidgetListViewController *)self _newCaptureOnlyMaterialView];
  captureOnlyMaterialView = self->_captureOnlyMaterialView;
  self->_captureOnlyMaterialView = v3;

  id v6 = [(WGWidgetListViewController *)self view];
  uint64_t v5 = self->_captureOnlyMaterialView;
  [v6 bounds];
  -[MTMaterialView setFrame:](v5, "setFrame:");
  [v6 insertSubview:self->_captureOnlyMaterialView atIndex:0];
}

- (void)_configureAlternateCaptureOnlyMaterialViewWithUserInterfaceStyle:(int64_t)a3
{
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = -[NSMutableDictionary objectForKey:](self->_userInterfaceStylesToCaptureOnlyMaterialViews, "objectForKey:");

  if (!v5)
  {
    id v6 = [(WGWidgetListViewController *)self _newCaptureOnlyMaterialView];
    [v6 setOverrideUserInterfaceStyle:a3];
    userInterfaceStylesToCaptureOnlyMaterialViews = self->_userInterfaceStylesToCaptureOnlyMaterialViews;
    if (!userInterfaceStylesToCaptureOnlyMaterialViews)
    {
      uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      long long v9 = self->_userInterfaceStylesToCaptureOnlyMaterialViews;
      self->_userInterfaceStylesToCaptureOnlyMaterialViews = v8;

      userInterfaceStylesToCaptureOnlyMaterialViews = self->_userInterfaceStylesToCaptureOnlyMaterialViews;
    }
    [(NSMutableDictionary *)userInterfaceStylesToCaptureOnlyMaterialViews setObject:v6 forKey:v11];
    long long v10 = [(WGWidgetListViewController *)self view];
    [v10 bounds];
    objc_msgSend(v6, "setFrame:");
    [v10 insertSubview:v6 aboveSubview:self->_captureOnlyMaterialView];
  }
}

- (void)_invalidateAlternateCaptureOnlyMaterialViewWithUserInterfaceStyle:(int64_t)a3
{
  if (self->_userInterfaceStylesToCaptureOnlyMaterialViews)
  {
    id v7 = [NSNumber numberWithInteger:a3];
    uint64_t v4 = -[NSMutableDictionary objectForKey:](self->_userInterfaceStylesToCaptureOnlyMaterialViews, "objectForKey:");
    uint64_t v5 = v4;
    if (v4)
    {
      [v4 removeFromSuperview];
      [(NSMutableDictionary *)self->_userInterfaceStylesToCaptureOnlyMaterialViews removeObjectForKey:v7];
      if (![(NSMutableDictionary *)self->_userInterfaceStylesToCaptureOnlyMaterialViews count])
      {
        userInterfaceStylesToCaptureOnlyMaterialViews = self->_userInterfaceStylesToCaptureOnlyMaterialViews;
        self->_userInterfaceStylesToCaptureOnlyMaterialViews = 0;
      }
    }
  }
}

- (void)_invalidateAllAlternateCaptureOnlyMaterialViews
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  userInterfaceStylesToCaptureOnlyMaterialViews = self->_userInterfaceStylesToCaptureOnlyMaterialViews;
  if (userInterfaceStylesToCaptureOnlyMaterialViews)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v4 = [(NSMutableDictionary *)userInterfaceStylesToCaptureOnlyMaterialViews allKeys];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          -[WGWidgetListViewController _invalidateAlternateCaptureOnlyMaterialViewWithUserInterfaceStyle:](self, "_invalidateAlternateCaptureOnlyMaterialViewWithUserInterfaceStyle:", [*(id *)(*((void *)&v9 + 1) + 8 * i) integerValue]);
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)_configureScrollView
{
  id v3 = objc_alloc_init(_WGWidgetListScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = &v3->super;

  uint64_t v5 = [(UIScrollView *)self->_scrollView layer];
  [v5 setHitTestsAsOpaque:1];

  [(UIScrollView *)self->_scrollView setDelegate:self];
  [(UIScrollView *)self->_scrollView setAlwaysBounceVertical:1];
  [(UIScrollView *)self->_scrollView setShowsHorizontalScrollIndicator:0];
  [(UIScrollView *)self->_scrollView setShowsVerticalScrollIndicator:0];
  [(UIScrollView *)self->_scrollView setPreservesSuperviewLayoutMargins:1];
  [(UIScrollView *)self->_scrollView setClipsToBounds:0];
  [(UIScrollView *)self->_scrollView setAutoresizingMask:18];
  id v7 = [(WGWidgetListViewController *)self view];
  uint64_t v6 = self->_scrollView;
  [v7 bounds];
  -[UIScrollView setFrame:](v6, "setFrame:");
  [v7 addSubview:self->_scrollView];
}

- (id)_scrollViewLoadingIfNecessary:(BOOL)a3
{
  if (a3 && ([(WGWidgetListViewController *)self isViewLoaded] & 1) == 0) {
    [(WGWidgetListViewController *)self loadViewIfNeeded];
  }
  scrollView = self->_scrollView;
  return scrollView;
}

- (id)_scrollViewIfLoaded
{
  return [(WGWidgetListViewController *)self _scrollViewLoadingIfNecessary:0];
}

- (void)_updateBackgroundViewForPlatter:(id)a3
{
}

- (void)_repopulateStackView
{
  id v3 = [(WGWidgetListViewController *)self visibleWidgetIdentifiers];
  [(WGWidgetListViewController *)self _repopulateStackViewWithWidgetIdentifiers:v3];
}

- (id)_platterViewAtLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__3;
  long long v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  uint64_t v6 = [(WGWidgetListViewController *)self _scrollViewIfLoaded];
  stackView = v6;
  if (!self->_shouldIncludeScrollView) {
    stackView = self->_stackView;
  }
  uint64_t v8 = stackView;
  if (v8)
  {
    long long v9 = [(UIStackView *)self->_stackView arrangedSubviews];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __53__WGWidgetListViewController__platterViewAtLocation___block_invoke;
    v12[3] = &unk_264676E58;
    CGFloat v15 = x;
    CGFloat v16 = y;
    id v13 = v8;
    uint64_t v14 = &v17;
    [v9 enumerateObjectsUsingBlock:v12];
  }
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

uint64_t __53__WGWidgetListViewController__platterViewAtLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v7 = v11;
  if (isKindOfClass)
  {
    uint64_t v8 = [v11 platterView];
    long long v9 = *(void **)(a1 + 32);
    [v8 bounds];
    objc_msgSend(v9, "convertRect:fromView:", v8);
    if (CGRectContainsPoint(v13, *(CGPoint *)(a1 + 48)))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8);
      *a4 = 1;
    }

    id v7 = v11;
  }
  return MEMORY[0x270F9A758](isKindOfClass, v7);
}

- (void)_cancelTouchesForHitWidgetIfNecessaryAndDisableTouchesOnAllWidgets
{
  id v3 = [(WGWidgetListViewController *)self _scrollViewIfLoaded];
  id v12 = v3;
  if (v3)
  {
    uint64_t v4 = [v3 panGestureRecognizer];
    [v4 locationInView:v12];
    double v6 = v5;
    double v8 = v7;

    long long v9 = -[WGWidgetListViewController _platterViewAtLocation:](self, "_platterViewAtLocation:", v6, v8);
    id v10 = v9;
    if (v9)
    {
      id v11 = [v9 widgetHost];
      [(WGWidgetListViewController *)self _cancelTouchesForWidget:v11];
    }
  }
  [(WGWidgetListViewController *)self _disableTouchesOnAllWidgets];
}

- (void)_cancelTouchesForWidget:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [v9 widgetIdentifier];
  if ([v4 length])
  {
    double v5 = [(NSMutableDictionary *)self->_cancelTouchesAssertionsByWidgetID objectForKey:v4];
    if (!v5)
    {
      double v5 = [v9 _cancelTouches];
      if (v5)
      {
        cancelTouchesAssertionsByWidgetID = self->_cancelTouchesAssertionsByWidgetID;
        if (!cancelTouchesAssertionsByWidgetID)
        {
          double v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
          double v8 = self->_cancelTouchesAssertionsByWidgetID;
          self->_cancelTouchesAssertionsByWidgetID = v7;

          cancelTouchesAssertionsByWidgetID = self->_cancelTouchesAssertionsByWidgetID;
        }
        [(NSMutableDictionary *)cancelTouchesAssertionsByWidgetID setObject:v5 forKey:v4];
      }
    }
  }
}

- (void)_invalidateAllCancelTouchesAssertions
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_cancelTouchesAssertionsByWidgetID;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = -[NSMutableDictionary objectForKey:](self->_cancelTouchesAssertionsByWidgetID, "objectForKey:", *(void *)(*((void *)&v9 + 1) + 8 * v7), (void)v9);
        [v8 invalidate];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_cancelTouchesAssertionsByWidgetID removeAllObjects];
  [(WGWidgetListViewController *)self _enableTouchesOnAllWidgets];
}

- (void)_disableTouchesOnAllWidgets
{
}

uint64_t __57__WGWidgetListViewController__disableTouchesOnAllWidgets__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setContentViewHitTestingDisabled:1];
}

- (void)_enableTouchesOnAllWidgets
{
}

uint64_t __56__WGWidgetListViewController__enableTouchesOnAllWidgets__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setContentViewHitTestingDisabled:0];
}

- (void)_adjustContentOffsetToInsideContent:(BOOL)a3
{
  if (self->_shouldIncludeScrollView)
  {
    scrollView = self->_scrollView;
    if (scrollView)
    {
      BOOL v5 = a3;
      [(UIScrollView *)scrollView contentSize];
      double v7 = v6;
      [(UIScrollView *)self->_scrollView bounds];
      double v9 = v7 - v8;
      [(UIScrollView *)self->_scrollView contentInset];
      double v11 = v9 + v10;
      double v12 = fmax(v9 + v10, 0.0);
      [(UIScrollView *)self->_scrollView contentInset];
      double v14 = v12 - v13;
      [(UIScrollView *)self->_scrollView contentOffset];
      if (v15 > v14)
      {
        BOOL v16 = v11 >= 0.0 && v5;
        uint64_t v17 = self->_scrollView;
        -[UIScrollView setContentOffset:animated:](v17, "setContentOffset:animated:", v16, 0.0, v14);
      }
    }
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)WGWidgetListViewController;
  [(WGWidgetListViewController *)&v3 viewDidLoad];
  [(WGWidgetListViewController *)self _configureCaptureOnlyMaterialView];
  if (self->_shouldIncludeScrollView) {
    [(WGWidgetListViewController *)self _configureScrollView];
  }
  [(WGWidgetListViewController *)self _configureStackView];
  [(WGWidgetListViewController *)self _repopulateStackView];
  [(WGWidgetDiscoveryController *)self->_discoveryController addDiscoveryObserver:self];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WGWidgetListViewController;
  -[WGWidgetListViewController viewWillAppear:](&v8, sel_viewWillAppear_);
  [(WGWidgetListViewController *)self _adjustContentOffsetToInsideContent:v3];
  [(WGWidgetListViewController *)self _invalidateAllCancelTouchesAssertions];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__WGWidgetListViewController_viewWillAppear___block_invoke;
  v6[3] = &__block_descriptor_33_e33_v24__0__WGWidgetPlatterView_8_B16l;
  BOOL v7 = v3;
  [(WGWidgetListViewController *)self _invokeBlockWithPlatterViewsVisibleInBounds:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__WGWidgetListViewController_viewWillAppear___block_invoke_2;
  v5[3] = &unk_264676EC0;
  v5[4] = self;
  [(WGWidgetListViewController *)self _invokeBlock:v5 withPlatterViewsPassingTest:0];
}

void __45__WGWidgetListViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 listItem];
  objc_msgSend(v3, "wg_beginAppearanceTransitionIfNecessary:animated:", 1, *(unsigned __int8 *)(a1 + 32));
}

void __45__WGWidgetListViewController_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 listItem];
  [v3 managingContainerWillAppear:*(void *)(a1 + 32)];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WGWidgetListViewController;
  -[WGWidgetListViewController viewDidAppear:](&v7, sel_viewDidAppear_);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__WGWidgetListViewController_viewDidAppear___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v24__0__WGWidgetPlatterView_8_B16l;
  BOOL v6 = a3;
  [(WGWidgetListViewController *)self _invokeBlockWithPlatterViewsVisibleInBounds:v5];
}

void __44__WGWidgetListViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 listItem];
  objc_msgSend(v3, "wg_beginAppearanceTransitionIfNecessary:animated:", 1, *(unsigned __int8 *)(a1 + 32));
  objc_msgSend(v3, "wg_endAppearanceTransitionIfNecessary");
  uint64_t v4 = [v3 widgetHost];
  double v5 = 1.0;
  if (([v4 isRemoteViewVisible] & 1) == 0
    && ([v4 isSnapshotLoaded] & 1) == 0
    && ([v4 isBrokenViewVisible] & 1) == 0)
  {
    if ([v4 isLockedOut]) {
      double v5 = 1.0;
    }
    else {
      double v5 = 0.0;
    }
  }
  BOOL v6 = [v9 contentView];
  [v6 setAlpha:v5];

  objc_super v7 = +[WGWidgetEventTracker sharedInstance];
  objc_super v8 = [v4 widgetIdentifier];
  objc_msgSend(v7, "widget:didAppearInMode:", v8, objc_msgSend(v4, "activeDisplayMode"));
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WGWidgetListViewController;
  [(WGWidgetListViewController *)&v5 viewWillDisappear:a3];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__WGWidgetListViewController_viewWillDisappear___block_invoke;
  v4[3] = &unk_264676EC0;
  v4[4] = self;
  [(WGWidgetListViewController *)self _invokeBlockWithPlatterViewsVisibleInBounds:v4];
  [(WGWidgetListViewController *)self _disableTouchesOnAllWidgets];
}

void __48__WGWidgetListViewController_viewWillDisappear___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 widgetHost];
  [*(id *)(a1 + 32) _cancelTouchesForWidget:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WGWidgetListViewController;
  -[WGWidgetListViewController viewDidDisappear:](&v7, sel_viewDidDisappear_);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__WGWidgetListViewController_viewDidDisappear___block_invoke;
  v5[3] = &unk_264676EE8;
  BOOL v6 = a3;
  void v5[4] = self;
  [(WGWidgetListViewController *)self _invokeBlock:v5 withPlatterViewsPassingTest:0];
  [(WGWidgetListViewController *)self _invokeBlockWithPlatterViewsVisibleInBounds:&__block_literal_global_68];
}

void __47__WGWidgetListViewController_viewDidDisappear___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 listItem];
  objc_msgSend(v5, "wg_beginAppearanceTransitionIfNecessary:animated:", 0, *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(v5, "wg_endAppearanceTransitionIfNecessary");
  [v5 managingContainerDidDisappear:*(void *)(a1 + 32)];
  uint64_t v4 = [v3 contentView];

  [v4 setAlpha:1.0];
}

void __47__WGWidgetListViewController_viewDidDisappear___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = [a2 widgetHost];
  id v2 = +[WGWidgetEventTracker sharedInstance];
  id v3 = [v4 widgetIdentifier];
  objc_msgSend(v2, "widget:didDisappearInMode:", v3, objc_msgSend(v4, "activeDisplayMode"));
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v15.receiver = self;
  v15.super_class = (Class)WGWidgetListViewController;
  -[WGWidgetListViewController viewWillTransitionToSize:withTransitionCoordinator:](&v15, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4);
  objc_super v7 = [(WGWidgetListViewController *)self view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __81__WGWidgetListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v13[3] = &__block_descriptor_65_e33_v24__0__WGWidgetPlatterView_8_B16l;
  BOOL v12 = v11 != height || v9 != width;
  BOOL v14 = v12;
  *(double *)&v13[4] = v9;
  *(double *)&v13[5] = v11;
  *(double *)&v13[6] = width;
  *(double *)&v13[7] = height;
  [(WGWidgetListViewController *)self _invokeBlockWithPlatterViewsVisibleInBounds:v13];
}

void __81__WGWidgetListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 64))
  {
    id v2 = [a2 widgetHost];
    if ((BSFloatEqualToFloat() & 1) == 0) {
      [v2 maximumSizeDidChangeForDisplayMode:0];
    }
    [v2 maximumSizeDidChangeForDisplayMode:1];
  }
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v8 = v7;
  }
  else {
    double v8 = 0;
  }
  id v9 = v8;
  double v10 = v9;
  if (v9)
  {
    [v9 preferredContentSize];
    double v12 = v11;
    if (width == 0.0 && height == 0.0 && [(WGWidgetListViewController *)self isViewLoaded])
    {
      double v13 = [(WGWidgetListViewController *)self view];
      [v13 bounds];
      double width = CGRectGetWidth(v35);
    }
    objc_msgSend(v10, "contentSizeForPreferredContentSize:", width, v12);
    double v15 = v14;
    double v17 = v16;
    uint64_t v18 = [v10 widgetHost];
    [(WGWidgetListViewController *)self maxSizeForWidget:v18 forDisplayMode:0];
    double v20 = v19;

    long long v21 = [v10 widgetHost];
    if ([v21 activeDisplayMode] < 1)
    {
      double v25 = v20;
    }
    else
    {
      id v22 = [v10 widgetHost];
      long long v23 = [v10 widgetHost];
      -[WGWidgetListViewController maxSizeForWidget:forDisplayMode:](self, "maxSizeForWidget:forDisplayMode:", v22, [v23 activeDisplayMode]);
      double v25 = v24;
    }
    if (v20 >= v17) {
      double v28 = v20;
    }
    else {
      double v28 = v17;
    }
    if (v25 <= v28) {
      double v29 = v25;
    }
    else {
      double v29 = v28;
    }
    objc_msgSend(v10, "preferredContentSizeForContentOfSize:", v15, v29);
    double v26 = v30;
    double v27 = v31;
  }
  else
  {
    double v26 = *MEMORY[0x263F001B0];
    double v27 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v32 = v26;
  double v33 = v27;
  result.double height = v33;
  result.double width = v32;
  return result;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    id v7 = [(WGWidgetListViewController *)self view];
    [v7 bounds];
    -[WGWidgetListViewController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", v4, v8, v9);
    double v11 = v10;
    double v13 = v12;

    double v14 = [v6 widgetIdentifier];
    double v15 = [(WGWidgetListViewController *)self _platterViewForWidgetWithIdentifier:v14 creatingIfNecessary:0];

    double v16 = [(WGWidgetListViewController *)self _wrapperViewForWidgetPlatterView:v15];
    [v16 invalidateIntrinsicContentSize];
    ADClientPushValueForDistributionKey();
    BOOL v17 = [(WGWidgetListViewController *)self _appearState] == 2;
    uint64_t v18 = [(WGWidgetListViewController *)self _widgetIdentifiersForPlatterViewsVisibleInBounds];
    [(WGWidgetListViewController *)self _setPreviouslyVisibleWidgetIDs:v18];

    id v19 = objc_alloc_init(MEMORY[0x263F1CD58]);
    [v19 _setIsAnimated:v17];
    double v20 = [v19 _transitionCoordinator];
    objc_msgSend(v4, "viewWillTransitionToSize:withTransitionCoordinator:", v20, v11, v13);

    objc_initWeak(&location, self);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __84__WGWidgetListViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke;
    v23[3] = &unk_264676F30;
    objc_copyWeak(&v25, &location);
    id v21 = v19;
    id v24 = v21;
    id v22 = (void *)MEMORY[0x223CAA850](v23);
    -[WGWidgetListViewController resizeWidgetWrapperView:toSize:withTransitionContext:completion:](self, "resizeWidgetWrapperView:toSize:withTransitionContext:completion:", v16, v21, v22, v11, v13);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
}

void __84__WGWidgetListViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained _previouslyVisibleWidgetIDs];
  [WeakRetained _updateWidgetViewStateWithPreviouslyVisibleWidgetIdentifiers:v4];

  [*(id *)(a1 + 32) completeTransition:a2];
}

- (id)_identifierForCell:(id)a3
{
  id v5 = a3;
  if (!v5) {
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = objc_opt_class();
    id v7 = v5;
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        double v8 = v7;
      }
      else {
        double v8 = 0;
      }
    }
    else
    {
      double v8 = 0;
    }
    id v11 = v8;

    double v12 = [v11 platterView];

    double v13 = [v12 listItem];
    double v10 = [v13 widgetIdentifier];

    if (v10) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (double v9 = (objc_class *)objc_opt_class(),
        NSStringFromClass(v9),
        (double v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_12:
    double v14 = [MEMORY[0x263F08690] currentHandler];
    double v15 = [v5 recursiveDescription];
    [v14 handleFailureInMethod:a2, self, @"WGWidgetListViewController.m", 682, @"_identifierForCell: no identifier for cell with view hierarchy: %@", v15 object file lineNumber description];

LABEL_13:
    double v10 = 0;
  }
LABEL_14:

  return v10;
}

- (void)resizeWidgetWrapperView:(id)a3 toSize:(CGSize)a4 withTransitionContext:(id)a5 completion:(id)a6
{
  double height = a4.height;
  CGFloat width = a4.width;
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  double v14 = (void (**)(void, void))v13;
  if (v11)
  {
    char v15 = [v12 isAnimated];
    double v16 = [(WGWidgetListViewController *)self _identifierForCell:v11];
    BOOL v17 = [(NSMutableDictionary *)self->_resizeContexts objectForKey:v16];
    uint64_t v18 = v17;
    if ((v15 & 1) == 0)
    {
      if ([v17 isActive])
      {
        [v18 setActive:0];
        [v11 setOverrideIntrinsicContentHeight:-1.0];
      }
      id v21 = [(WGWidgetListViewController *)self widgetListView];
      [v21 setNeedsLayout];

      objc_msgSend(v12, "__runAlongsideAnimations");
      if (v14) {
        v14[2](v14, 1);
      }
      goto LABEL_40;
    }
    id v19 = [v17 resizeProgress];
    if ([v18 isActive])
    {
      [v19 value];
      if (BSFloatIsZero()) {
        [v18 compactHeight];
      }
      else {
        [v18 expandedHeight];
      }
      double v23 = v20;
    }
    else
    {
      [v11 bounds];
      double v23 = v22;
    }
    if (BSFloatEqualToFloat())
    {
      id v24 = (void *)WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG))
      {
        id v25 = v24;
        double v26 = [(WGWidgetListViewController *)self _identifierForCell:v11];
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v26;
        __int16 v69 = 2048;
        double v70 = v23;
        __int16 v71 = 2048;
        double v72 = height;
        _os_log_debug_impl(&dword_222E49000, v25, OS_LOG_TYPE_DEBUG, "Not animating for cell %@ from: %.2f to %.2f", buf, 0x20u);
      }
LABEL_39:

LABEL_40:
      goto LABEL_41;
    }
    if (height <= v23) {
      double v27 = height;
    }
    else {
      double v27 = v23;
    }
    if (height <= v23) {
      double v28 = v23;
    }
    else {
      double v28 = height;
    }
    v45 = v19;
    if ([v18 isActive]
      && (([v18 compactHeight], !BSFloatEqualToFloat())
        ? (char v29 = 0)
        : ([v18 expandedHeight], char v29 = BSFloatEqualToFloat()),
          objc_msgSend(v19, "value", v19),
          int IsOne = BSFloatIsOne(),
          (v29 & 1) != 0))
    {
      if (((height > v23) ^ IsOne))
      {
        int v31 = 1;
LABEL_34:
        [v18 setActive:1];
        uint64_t v33 = ++resizeWidgetWrapperView_toSize_withTransitionContext_completion__animationId;
        id v34 = (void *)WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG))
        {
          v43 = v34;
          v44 = [(WGWidgetListViewController *)self _identifierForCell:v11];
          *(_DWORD *)buf = 134219010;
          *(void *)&buf[4] = v33;
          __int16 v69 = 2112;
          double v70 = *(double *)&v44;
          __int16 v71 = 2048;
          double v72 = v23;
          __int16 v73 = 2048;
          double v74 = height;
          __int16 v75 = 1024;
          int v76 = v31;
          _os_log_debug_impl(&dword_222E49000, v43, OS_LOG_TYPE_DEBUG, "nmao _updateUtilityButtonForMoreContentState Starting animation %lu for cell %@ from: %.2f to %.2f reversing %{BOOL}d", buf, 0x30u);
        }
        CGRect v35 = dispatch_group_create();
        dispatch_group_enter(v35);
        v36 = (void *)MEMORY[0x263F1CB60];
        v65[0] = MEMORY[0x263EF8330];
        v65[1] = 3221225472;
        v65[2] = __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke;
        v65[3] = &unk_264676D18;
        id v66 = v45;
        BOOL v67 = height > v23;
        v60[0] = MEMORY[0x263EF8330];
        v60[1] = 3221225472;
        v60[2] = __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_2;
        v60[3] = &unk_264676F58;
        uint64_t v64 = v33;
        id v61 = v18;
        id v37 = v11;
        id v62 = v37;
        unint64_t v38 = v35;
        v63 = v38;
        [v36 _animateUsingSpringWithTension:0 friction:v65 interactive:v60 animations:341.02 completion:36.93];
        *(void *)buf = 0;
        double v58 = 0.0;
        uint64_t v59 = 0;
        WGConvertTensionAndFrictionToDampingRatioResponseAndSettlingDuration((double *)buf, (double *)&v59, &v58, 341.02, 36.93);
        dispatch_group_enter(v38);
        v39 = (void *)MEMORY[0x263F1CB60];
        double v40 = v58;
        double v41 = *(double *)buf;
        v53[0] = MEMORY[0x263EF8330];
        v53[1] = 3221225472;
        v53[2] = __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_80;
        v53[3] = &unk_264676F80;
        id v54 = v37;
        CGFloat v56 = width;
        double v57 = height;
        id v55 = v12;
        v49[0] = MEMORY[0x263EF8330];
        v49[1] = 3221225472;
        v49[2] = __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_2_81;
        v49[3] = &unk_264676FA8;
        uint64_t v52 = v33;
        id v50 = v54;
        v42 = v38;
        v51 = v42;
        [v39 animateWithDuration:6 delay:v53 usingSpringWithDamping:v49 initialSpringVelocity:v40 options:0.0 animations:v41 completion:0.0];
        if (v14)
        {
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_82;
          block[3] = &unk_264676FD0;
          uint64_t v48 = v33;
          v47 = v14;
          dispatch_group_notify(v42, MEMORY[0x263EF83A0], block);
        }
        id v19 = v45;
        goto LABEL_39;
      }
    }
    else
    {
      objc_msgSend(v18, "setCompactHeight:", v27, v45);
      [v18 setExpandedHeight:v28];
    }
    double v32 = 1.0;
    if (height > v23) {
      double v32 = 0.0;
    }
    [v19 setValue:v32];
    [v11 setOverrideIntrinsicContentHeight:v23];
    int v31 = 0;
    goto LABEL_34;
  }
  (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
LABEL_41:
}

uint64_t __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(a1 + 32) setValue:v1];
}

void __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_2(uint64_t a1, uint64_t a2, char a3)
{
  id v5 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG))
  {
    __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_2_cold_1(a1, a3, v5);
    if (a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if ((a3 & 1) == 0)
  {
LABEL_3:
    [*(id *)(a1 + 32) setActive:0];
    [*(id *)(a1 + 40) setOverrideIntrinsicContentHeight:-1.0];
    uint64_t v6 = [*(id *)(a1 + 40) platterView];
    [v6 setOverrideHeightForLayingOutContentView:-1.0];
  }
LABEL_4:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_80(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platterView];
  [v2 setOverrideHeightForLayingOutContentView:*(double *)(a1 + 56)];

  id v3 = [*(id *)(a1 + 32) platterView];
  [v3 layoutIfNeeded];

  id v4 = *(void **)(a1 + 40);
  return objc_msgSend(v4, "__runAlongsideAnimations");
}

void __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_2_81(uint64_t a1)
{
  id v2 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG)) {
    __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_2_81_cold_1(a1, v2);
  }
  id v3 = [*(id *)(a1 + 32) platterView];
  [v3 setOverrideHeightForLayingOutContentView:-1.0];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_82(uint64_t a1)
{
  id v2 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG)) {
    __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_82_cold_1(a1, v2);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WGWidgetListViewController;
  id v4 = a3;
  [(WGWidgetListViewController *)&v9 traitCollectionDidChange:v4];
  id v5 = objc_msgSend(v4, "preferredContentSizeCategory", v9.receiver, v9.super_class);

  uint64_t v6 = [(WGWidgetListViewController *)self traitCollection];
  id v7 = [v6 preferredContentSizeCategory];
  char v8 = [v5 isEqualToString:v7];

  if ((v8 & 1) == 0) {
    [(WGWidgetListViewController *)self _invokeBlockWithAllPlatterViews:&__block_literal_global_86];
  }
}

void __55__WGWidgetListViewController_traitCollectionDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 listItem];
  [v2 adjustForContentSizeCategoryChange];
}

- (void)_invokeBlock:(id)a3 withPlatterViewsPassingTest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    char v8 = [(WGWidgetListViewController *)self _scrollViewIfLoaded];
    if (v8 || !self->_shouldIncludeScrollView)
    {
      objc_super v9 = [(UIStackView *)self->_stackView arrangedSubviews];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __71__WGWidgetListViewController__invokeBlock_withPlatterViewsPassingTest___block_invoke;
      v10[3] = &unk_264676FF8;
      id v11 = v7;
      id v12 = v6;
      [v9 enumerateObjectsUsingBlock:v10];
    }
  }
}

uint64_t __71__WGWidgetListViewController__invokeBlock_withPlatterViewsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v4 = v8;
  if (isKindOfClass)
  {
    id v5 = [v8 platterView];
    uint64_t v6 = *(void *)(a1 + 32);
    if (!v6 || (*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v5)) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }

    id v4 = v8;
  }
  return MEMORY[0x270F9A758](isKindOfClass, v4);
}

- (void)_invokeBlockWithAllPlatterViews:(id)a3
{
}

- (void)_invokeBlockWithPlatterViewsVisibleInRect:(CGRect)a3 block:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  if (v9)
  {
    v11.origin.CGFloat x = x;
    v11.origin.CGFloat y = y;
    v11.size.CGFloat width = width;
    v11.size.CGFloat height = height;
    if (CGRectGetHeight(v11) > 0.0)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __78__WGWidgetListViewController__invokeBlockWithPlatterViewsVisibleInRect_block___block_invoke;
      v10[3] = &unk_264677020;
      void v10[4] = self;
      *(CGFloat *)&v10[5] = x;
      *(CGFloat *)&v10[6] = y;
      *(CGFloat *)&v10[7] = width;
      *(CGFloat *)&v10[8] = height;
      [(WGWidgetListViewController *)self _invokeBlock:v9 withPlatterViewsPassingTest:v10];
    }
  }
}

BOOL __78__WGWidgetListViewController__invokeBlockWithPlatterViewsVisibleInRect_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [*(id *)(a1 + 32) widgetListView];
  objc_msgSend(v3, "convertRect:toView:", v12, v5, v7, v9, v11);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  id v21 = [*(id *)(a1 + 32) _wrapperViewForWidgetPlatterView:v3];

  v27.origin.CGFloat x = v14;
  v27.origin.CGFloat y = v16;
  v27.size.CGFloat width = v18;
  v27.size.CGFloat height = v20;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 40), v27))
  {
    double v22 = [v21 contentView];
    [v22 alpha];
    if (v23 <= 0.0)
    {
      BOOL v25 = 0;
    }
    else
    {
      [v21 alpha];
      BOOL v25 = v24 > 0.0;
    }
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

- (void)_invokeBlockWithPlatterViewsVisibleInBounds:(id)a3
{
  id v4 = a3;
  id v5 = [(WGWidgetListViewController *)self widgetListView];
  [v5 bounds];
  -[WGWidgetListViewController _invokeBlockWithPlatterViewsVisibleInRect:block:](self, "_invokeBlockWithPlatterViewsVisibleInRect:block:", v4);
}

- (id)_widgetIdentifiersForPlatterViewsVisibleInBounds
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__3;
  double v10 = __Block_byref_object_dispose__3;
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __78__WGWidgetListViewController__widgetIdentifiersForPlatterViewsVisibleInBounds__block_invoke;
  v5[3] = &unk_264677048;
  void v5[4] = &v6;
  [(WGWidgetListViewController *)self _invokeBlockWithPlatterViewsVisibleInBounds:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __78__WGWidgetListViewController__widgetIdentifiersForPlatterViewsVisibleInBounds__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 widgetHost];
  id v4 = [v3 widgetIdentifier];

  if ([v4 length]) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v4];
  }
}

- (void)updateWidgetViewState
{
  [(WGWidgetListViewController *)self _updateWidgetViewStateWithPreviouslyVisibleWidgetIdentifiers:self->_previouslyVisibleWidgetIDs];
  previouslyVisibleWidgetIDs = self->_previouslyVisibleWidgetIDs;
  self->_previouslyVisibleWidgetIDs = 0;
}

- (void)updatePreviouslyVisibleWidgetIDs
{
  id v3 = [(WGWidgetListViewController *)self _widgetIdentifiersForPlatterViewsVisibleInBounds];
  previouslyVisibleWidgetIDs = self->_previouslyVisibleWidgetIDs;
  self->_previouslyVisibleWidgetIDs = v3;
  MEMORY[0x270F9A758](v3, previouslyVisibleWidgetIDs);
}

- (void)_updateWidgetViewStateWithPreviouslyVisibleWidgetIdentifiers:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(WGWidgetListViewController *)self _appearState] == 2)
  {
    uint64_t v23 = 0;
    double v24 = &v23;
    uint64_t v25 = 0x3032000000;
    double v26 = __Block_byref_object_copy__3;
    CGRect v27 = __Block_byref_object_dispose__3;
    id v28 = [MEMORY[0x263EFF9C0] set];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __91__WGWidgetListViewController__updateWidgetViewStateWithPreviouslyVisibleWidgetIdentifiers___block_invoke;
    v22[3] = &unk_264677048;
    void v22[4] = &v23;
    [(WGWidgetListViewController *)self _invokeBlockWithPlatterViewsVisibleInBounds:v22];
    id v5 = [MEMORY[0x263EFF9C0] setWithArray:v4];
    [v5 minusSet:v24[5]];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = v5;
    uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          double v10 = [(NSMutableDictionary *)self->_widgetIDsToItemVCs objectForKey:v9];
          objc_msgSend(v10, "wg_beginAppearanceTransitionIfNecessary:animated:", 0, 1);
          objc_msgSend(v10, "wg_endAppearanceTransitionIfNecessary");
          discoveryController = self->_discoveryController;
          id v12 = (objc_class *)objc_opt_class();
          double v13 = NSStringFromClass(v12);
          CGFloat v14 = [(WGWidgetDiscoveryController *)discoveryController widgetWithIdentifier:v9 delegate:self forRequesterWithIdentifier:v13];

          double v15 = +[WGWidgetEventTracker sharedInstance];
          CGFloat v16 = [v14 widgetIdentifier];
          objc_msgSend(v15, "widget:didDisappearInMode:", v16, objc_msgSend(v14, "activeDisplayMode"));
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v29 count:16];
      }
      while (v6);
    }

    _Block_object_dispose(&v23, 8);
  }
}

void __91__WGWidgetListViewController__updateWidgetViewStateWithPreviouslyVisibleWidgetIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 listItem];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 widgetIdentifier];
    if (![v6 length])
    {
      uint64_t v7 = WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR)) {
        __91__WGWidgetListViewController__updateWidgetViewStateWithPreviouslyVisibleWidgetIdentifiers___block_invoke_cold_2((uint64_t)v5, v7);
      }
    }
    if ([v6 length])
    {
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v6];
      objc_msgSend(v5, "wg_beginAppearanceTransitionIfNecessary:animated:", 1, 1);
      objc_msgSend(v5, "wg_endAppearanceTransitionIfNecessary");
      uint64_t v8 = [v5 widgetHost];
      if ([v8 isRemoteViewVisible])
      {
        [v8 _invalidateVisibleFrame];
      }
      else
      {
        double v10 = 1.0;
        if (([v8 isSnapshotLoaded] & 1) == 0 && (objc_msgSend(v8, "isBrokenViewVisible") & 1) == 0)
        {
          if ([v8 isLockedOut]) {
            double v10 = 1.0;
          }
          else {
            double v10 = 0.0;
          }
        }
        id v11 = [v3 contentView];
        [v11 setAlpha:v10];

        id v12 = +[WGWidgetEventTracker sharedInstance];
        objc_msgSend(v12, "widget:didAppearInMode:", v6, objc_msgSend(v8, "activeDisplayMode"));
      }
    }
  }
  else
  {
    uint64_t v9 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR)) {
      __91__WGWidgetListViewController__updateWidgetViewStateWithPreviouslyVisibleWidgetIdentifiers___block_invoke_cold_1((uint64_t)v3, v9);
    }
  }
}

- (id)_wrapperViewForWidgetPlatterView:(id)a3
{
  id v3 = [a3 superview];
  id v4 = [v3 superview];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (void)setEditingIcons:(BOOL)a3
{
  self->_editingIcons = a3;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__WGWidgetListViewController_setEditingIcons___block_invoke;
  v3[3] = &__block_descriptor_33_e33_v24__0__WGWidgetPlatterView_8_B16l;
  BOOL v4 = a3;
  [(WGWidgetListViewController *)self _invokeBlockWithAllPlatterViews:v3];
}

uint64_t __46__WGWidgetListViewController_setEditingIcons___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setEditingIcons:*(unsigned __int8 *)(a1 + 32)];
}

- (UIControl)editButton
{
  editButton = self->_editButton;
  if (!editButton)
  {
    BOOL v4 = objc_alloc_init(WGShortLookStyleButton);
    uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"WIDGETS_EDIT_BUTTON" value:&stru_26D5C79B8 table:@"Widgets"];
    [(WGShortLookStyleButton *)v4 setTitle:v6];

    [(WGShortLookStyleButton *)v4 setBackgroundBlurred:self->_shouldBlurContent];
    [(WGShortLookStyleButton *)v4 addTarget:self action:sel__presentEditViewController forControlEvents:64];
    [(WGShortLookStyleButton *)v4 setMaterialGroupNameBase:@"WGWidgetListViewControllerGroupName"];
    uint64_t v7 = self->_editButton;
    self->_editButton = &v4->super;

    editButton = self->_editButton;
  }
  return editButton;
}

- (void)_presentEditViewController
{
}

- (void)scrollViewDidScroll:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained performSelector:sel_scrollViewDidScroll_ withObject:v5];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v7 = a3;
  [(WGWidgetListViewController *)self _cancelTouchesForHitWidgetIfNecessaryAndDisableTouchesOnAllWidgets];
  BOOL v4 = [(WGWidgetListViewController *)self _widgetIdentifiersForPlatterViewsVisibleInBounds];
  previouslyVisibleWidgetIDs = self->_previouslyVisibleWidgetIDs;
  self->_previouslyVisibleWidgetIDs = v4;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained performSelector:sel_scrollViewWillBeginDragging_ withObject:v7];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(WeakRetained, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v10, a5, x, y);
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (!v4 && ([v7 isDecelerating] & 1) == 0) {
    [(WGWidgetListViewController *)self _scrollViewDidStop];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained scrollViewDidEndDragging:v7 willDecelerate:v4];
  }
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained performSelector:sel_scrollViewWillBeginDecelerating_ withObject:v5];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v5 = a3;
  [(WGWidgetListViewController *)self _scrollViewDidStop];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained performSelector:sel_scrollViewDidEndDecelerating_ withObject:v5];
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v5 = a3;
  [(WGWidgetListViewController *)self _scrollViewDidStop];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained performSelector:sel_scrollViewDidEndScrollingAnimation_ withObject:v5];
  }
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![WeakRetained scrollViewShouldScrollToTop:v4])
  {
    BOOL v8 = 0;
  }
  else
  {
    id v6 = [(WGWidgetListViewController *)self _widgetIdentifiersForPlatterViewsVisibleInBounds];
    previouslyVisibleWidgetIDs = self->_previouslyVisibleWidgetIDs;
    self->_previouslyVisibleWidgetIDs = v6;

    BOOL v8 = 1;
  }

  return v8;
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  id v5 = a3;
  [(WGWidgetListViewController *)self _scrollViewDidStop];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained performSelector:sel_scrollViewDidScrollToTop_ withObject:v5];
  }
}

- (void)_scrollViewDidStop
{
  [(WGWidgetListViewController *)self _updateWidgetViewStateWithPreviouslyVisibleWidgetIdentifiers:self->_previouslyVisibleWidgetIDs];
  previouslyVisibleWidgetIDs = self->_previouslyVisibleWidgetIDs;
  self->_previouslyVisibleWidgetIDs = 0;

  [(WGWidgetListViewController *)self _invalidateAllCancelTouchesAssertions];
}

- (void)widgetDiscoveryControllerSignificantWidgetsChange:(id)a3
{
  id v4 = [(WGWidgetListViewController *)self widgetListView];
  [v4 contentOffset];
  double v6 = v5;
  double v8 = v7;

  [(WGWidgetListViewController *)self _repopulateStackView];
  id v9 = [(WGWidgetListViewController *)self widgetListView];
  objc_msgSend(v9, "setContentOffset:", v6, v8);
}

- (void)widgetDiscoveryController:(id)a3 orderDidChangeForWidgetIdentifiers:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v6 = a4;
  objc_initWeak(&location, self);
  double v7 = [(WGWidgetListViewController *)self _widgetIdentifiersForPlatterViewsVisibleInBounds];
  previouslyVisibleWidgetIDs = self->_previouslyVisibleWidgetIDs;
  self->_previouslyVisibleWidgetIDs = v7;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v19 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(obj);
        }
        id v11 = [(WGWidgetListViewController *)self _listItemViewControllerForWidgetWithIdentifier:*(void *)(*((void *)&v25 + 1) + 8 * v10) creatingIfNecessary:0];
        id v12 = [v11 platterView];
        double v13 = [(WGWidgetListViewController *)self _wrapperViewForWidgetPlatterView:v12];
        CGFloat v14 = (void *)MEMORY[0x263F1CB60];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __91__WGWidgetListViewController_widgetDiscoveryController_orderDidChangeForWidgetIdentifiers___block_invoke;
        v22[3] = &unk_264676798;
        void v22[4] = self;
        id v15 = v11;
        id v23 = v15;
        id v16 = v13;
        id v24 = v16;
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __91__WGWidgetListViewController_widgetDiscoveryController_orderDidChangeForWidgetIdentifiers___block_invoke_2;
        v20[3] = &unk_264677070;
        objc_copyWeak(&v21, &location);
        [v14 animateWithDuration:0 delay:v22 usingSpringWithDamping:v20 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:0.0];
        objc_destroyWeak(&v21);

        ++v10;
      }
      while (v9 != v10);
      uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }

  objc_destroyWeak(&location);
}

void __91__WGWidgetListViewController_widgetDiscoveryController_orderDidChangeForWidgetIdentifiers___block_invoke(uint64_t a1)
{
  id v2 = *(id **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [v2[126] arrangedSubviews];
  double v5 = [*(id *)(a1 + 32) visibleWidgetIdentifiers];
  uint64_t v6 = [v2 _insertionIndexofListItem:v3 intoWidgetViews:v4 withOrderedIdentifiers:v5];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v7 = *(void **)(*(void *)(a1 + 32) + 1008);
    uint64_t v8 = *(void *)(a1 + 48);
    [v7 insertArrangedSubview:v8 atIndex:v6];
  }
}

void __91__WGWidgetListViewController_widgetDiscoveryController_orderDidChangeForWidgetIdentifiers___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v1 = [WeakRetained _previouslyVisibleWidgetIDs];
  [WeakRetained _updateWidgetViewStateWithPreviouslyVisibleWidgetIdentifiers:v1];
}

- (CGRect)_visibleContentFrameForBounds:(CGRect)a3 withContentOccludingInsets:(UIEdgeInsets)a4
{
  id v4 = [(WGWidgetListViewController *)self widgetListView];
  [v4 contentInset];

  UIRectInset();
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGSize)_maxVisibleContentSize
{
  p_maxVisibleContentSize = &self->_maxVisibleContentSize;
  double width = self->_maxVisibleContentSize.width;
  double height = self->_maxVisibleContentSize.height;
  if (width == 0.0 && height == 0.0)
  {
    double v6 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      uint64_t v8 = 4;
    }
    else {
      uint64_t v8 = 1;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      [WeakRetained widgetListViewController:self sizeForInterfaceOrientation:v8];
    }
    else
    {
      uint64_t v10 = [(WGWidgetListViewController *)self view];
      [v10 bounds];
    }
    if (objc_opt_respondsToSelector()) {
      [WeakRetained widgetListViewController:self contentOccludingInsetsForInterfaceOrientation:v8];
    }
    BSRectWithSize();
    -[WGWidgetListViewController _visibleContentFrameForBounds:withContentOccludingInsets:](self, "_visibleContentFrameForBounds:withContentOccludingInsets:");
    p_maxVisibleContentSize->double width = v11;
    p_maxVisibleContentSize->double height = v12;

    double width = p_maxVisibleContentSize->width;
    double height = p_maxVisibleContentSize->height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)maxSizeForWidget:(id)a3 forDisplayMode:(int64_t)a4
{
  id v6 = a3;
  [(WGWidgetListViewController *)self _maxVisibleContentSize];
  double v8 = v7;
  double v10 = v9;
  +[WGWidgetInfo maximumContentHeightForCompactDisplayMode];
  double v12 = v11;
  if (a4)
  {
    [MEMORY[0x263F146D0] defaultWidgetRowHeight];
    double v14 = v13;
    [MEMORY[0x263F146D0] widgetRowHeight];
    double v16 = v15;
    id v17 = [v6 widgetIdentifier];
    long long v18 = [(WGWidgetListViewController *)self _platterViewForWidgetWithIdentifier:v17 creatingIfNecessary:1];
    objc_msgSend(v18, "contentSizeForSize:", v8, v10);
    if (v14 <= v16) {
      double v20 = v14;
    }
    else {
      double v20 = v16;
    }
    double v21 = floor(v19 / v20);

    if (v16 * (double)(uint64_t)v21 >= v12) {
      double v12 = v16 * (double)(uint64_t)v21;
    }
  }

  double v22 = v8;
  double v23 = v12;
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (void)registerWidgetForRefreshEvents:(id)a3
{
  discoveryController = self->_discoveryController;
  id v4 = [a3 widgetIdentifier];
  [(WGWidgetDiscoveryController *)discoveryController registerIdentifierForRefreshEvents:v4];
}

- (void)unregisterWidgetForRefreshEvents:(id)a3
{
  discoveryController = self->_discoveryController;
  id v4 = [a3 widgetIdentifier];
  [(WGWidgetDiscoveryController *)discoveryController unregisterIdentifierForRefreshEvents:v4];
}

- (UIEdgeInsets)marginInsetsForWidget:(id)a3
{
  uint64_t v3 = [(WGWidgetListViewController *)self view];
  int v4 = [v3 _shouldReverseLayoutDirection];
  if (v4) {
    double v5 = 0.0;
  }
  else {
    double v5 = 15.0;
  }
  if (v4) {
    double v6 = 15.0;
  }
  else {
    double v6 = 0.0;
  }

  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = v5;
  double v10 = v6;
  result.right = v10;
  result.bottom = v8;
  result.left = v9;
  result.top = v7;
  return result;
}

- (UIEdgeInsets)layoutMarginForWidget:(id)a3
{
  double v3 = *MEMORY[0x263F146D8];
  double v4 = *(double *)(MEMORY[0x263F146D8] + 8);
  double v5 = *(double *)(MEMORY[0x263F146D8] + 24);
  [(WGWidgetListViewController *)self _maxVisibleContentSize];
  +[WGWidgetPlatterView contentBaselineToBoundsBottomWithWidth:](WGWidgetPlatterView, "contentBaselineToBoundsBottomWithWidth:");
  double v7 = v6;
  double v8 = v3;
  double v9 = v4;
  double v10 = v5;
  result.right = v10;
  result.bottom = v7;
  result.left = v9;
  result.top = v8;
  return result;
}

- (void)widget:(id)a3 didChangeLargestSupportedDisplayMode:(int64_t)a4
{
  id v6 = a3;
  double v7 = (void *)MEMORY[0x263F1CB60];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__WGWidgetListViewController_widget_didChangeLargestSupportedDisplayMode___block_invoke;
  v9[3] = &unk_264676CC8;
  v9[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  [v7 animateWithDuration:v9 animations:0.5];
}

void __74__WGWidgetListViewController_widget_didChangeLargestSupportedDisplayMode___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) widgetIdentifier];
  double v3 = [v2 _platterViewForWidgetWithIdentifier:v4 creatingIfNecessary:0];
  [v3 setShowMoreButtonVisible:*(void *)(a1 + 48) == 1];
}

- (void)remoteViewControllerViewDidAppearForWidget:(id)a3
{
  id v4 = a3;
  if ([(UIViewController *)self wg_isAppearingOrAppeared]
    && [v4 isRemoteViewVisible])
  {
    [v4 _invalidateVisibleFrame];
    double v5 = [v4 widgetIdentifier];
    id v6 = [(WGWidgetListViewController *)self _platterViewForWidgetWithIdentifier:v5 creatingIfNecessary:0];

    if (v6)
    {
      double v7 = (void *)MEMORY[0x263F1CB60];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __73__WGWidgetListViewController_remoteViewControllerViewDidAppearForWidget___block_invoke;
      v8[3] = &unk_264676588;
      id v9 = v6;
      [v7 animateWithDuration:v8 animations:0.25];
    }
  }
}

void __73__WGWidgetListViewController_remoteViewControllerViewDidAppearForWidget___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) contentView];
  [v1 setAlpha:1.0];
}

- (void)remoteViewControllerViewDidHideForWidget:(id)a3
{
  cancelTouchesAssertionsByWidgetID = self->_cancelTouchesAssertionsByWidgetID;
  id v5 = [a3 widgetIdentifier];
  id v4 = [(NSMutableDictionary *)cancelTouchesAssertionsByWidgetID objectForKey:v5];
  [v4 invalidate];
}

- (void)brokenViewDidAppearForWidget:(id)a3
{
  id v4 = a3;
  if ([(UIViewController *)self wg_isAppearingOrAppeared]
    && ([v4 isSnapshotLoaded] & 1) == 0
    && ([v4 isRemoteViewVisible] & 1) == 0)
  {
    id v5 = [v4 widgetIdentifier];
    id v6 = [(WGWidgetListViewController *)self _platterViewForWidgetWithIdentifier:v5 creatingIfNecessary:0];

    if (v6)
    {
      double v7 = (void *)MEMORY[0x263F1CB60];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __59__WGWidgetListViewController_brokenViewDidAppearForWidget___block_invoke;
      v8[3] = &unk_264676588;
      id v9 = v6;
      [v7 animateWithDuration:v8 animations:0.25];
    }
  }
}

void __59__WGWidgetListViewController_brokenViewDidAppearForWidget___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) contentView];
  [v1 setAlpha:1.0];
}

- (void)remoteViewControllerDidDisconnectForWidget:(id)a3
{
}

- (CGRect)visibleFrameForWidget:(id)a3
{
  id v4 = a3;
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(WeakRetained, "widgetListViewController:contentOccludingInsetsForInterfaceOrientation:", self, objc_msgSend((id)*MEMORY[0x263F1D020], "activeInterfaceOrientation"));
    }
    id v10 = [(WGWidgetListViewController *)self widgetListView];
    [v10 bounds];
    -[WGWidgetListViewController _visibleContentFrameForBounds:withContentOccludingInsets:](self, "_visibleContentFrameForBounds:withContentOccludingInsets:");
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    double v19 = [(WGWidgetListViewController *)self widgetListView];
    double v20 = [v4 view];
    [v20 frame];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    char v29 = [v20 superview];
    objc_msgSend(v19, "convertRect:fromView:", v29, v22, v24, v26, v28);
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    CGFloat v37 = v36;

    v55.origin.double x = v12;
    v55.origin.double y = v14;
    v55.size.double width = v16;
    v55.size.double height = v18;
    v58.origin.double x = v31;
    v58.origin.double y = v33;
    v58.size.double width = v35;
    v58.size.double height = v37;
    CGRect v56 = CGRectIntersection(v55, v58);
    double x = v56.origin.x;
    double y = v56.origin.y;
    double width = v56.size.width;
    double height = v56.size.height;
    double v6 = v53;
    double v5 = v54;
    double v8 = v51;
    double v7 = v52;
    if (!CGRectIsNull(v56))
    {
      v42 = [v4 view];
      objc_msgSend(v42, "convertRect:fromView:", v19, x, y, width, height);
      double v5 = v43;
      double v6 = v44;
      double v7 = v45;
      double v8 = v46;
    }
  }

  double v47 = v5;
  double v48 = v6;
  double v49 = v7;
  double v50 = v8;
  result.size.double height = v50;
  result.size.double width = v49;
  result.origin.double y = v48;
  result.origin.double x = v47;
  return result;
}

- (id)widgetListItemViewController:(id)a3 widgetHostWithIdentifier:(id)a4
{
  discoveryController = self->_discoveryController;
  id v6 = a4;
  double v7 = (objc_class *)objc_opt_class();
  double v8 = NSStringFromClass(v7);
  id v9 = [(WGWidgetDiscoveryController *)discoveryController widgetWithIdentifier:v6 delegate:self forRequesterWithIdentifier:v8];

  return v9;
}

- (BOOL)isWidgetExtensionVisible:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  if ([(WGWidgetListViewController *)self _appearState])
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __55__WGWidgetListViewController_isWidgetExtensionVisible___block_invoke;
    v7[3] = &unk_264677098;
    id v8 = v4;
    id v9 = &v10;
    [(WGWidgetListViewController *)self _invokeBlockWithPlatterViewsVisibleInBounds:v7];
  }
  char v5 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __55__WGWidgetListViewController_isWidgetExtensionVisible___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  char v5 = [a2 widgetHost];
  id v6 = [v5 widgetIdentifier];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (WGWidgetListViewControllerDelegatePrivate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WGWidgetListViewControllerDelegatePrivate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldBlurContent
{
  return self->_shouldBlurContent;
}

- (void)setEditButton:(id)a3
{
}

- (BOOL)isEditingIcons
{
  return self->_editingIcons;
}

- (BOOL)shouldIncludeScrollView
{
  return self->_shouldIncludeScrollView;
}

- (void)setShouldIncludeScrollView:(BOOL)a3
{
  self->_shouldIncludeScrollView = a3;
}

- (NSArray)_previouslyVisibleWidgetIDs
{
  return self->_previouslyVisibleWidgetIDs;
}

- (void)_setPreviouslyVisibleWidgetIDs:(id)a3
{
}

- (NSLayoutConstraint)stackViewBottomConstraint
{
  return self->_stackViewBottomConstraint;
}

- (NSMutableDictionary)resizeContexts
{
  return self->_resizeContexts;
}

- (void)setResizeContexts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resizeContexts, 0);
  objc_storeStrong((id *)&self->_stackViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_previouslyVisibleWidgetIDs, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_widgetIDsToItemVCs, 0);
  objc_storeStrong((id *)&self->_cancelTouchesAssertionsByWidgetID, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_userInterfaceStylesToCaptureOnlyMaterialViews, 0);
  objc_storeStrong((id *)&self->_captureOnlyMaterialView, 0);
  objc_storeStrong((id *)&self->_discoveryController, 0);
}

- (id)visibleWidgetIdentifiers
{
  discoveryController = self->_discoveryController;
  double v3 = [(WGWidgetListViewController *)self _group];
  id v4 = [(WGWidgetDiscoveryController *)discoveryController visibleWidgetIdentifiersForGroup:v3];

  return v4;
}

- (void)makeVisibleWidgetWithIdentifier:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, BOOL))a4;
  if ([v11 length])
  {
    int v7 = [(WGWidgetListViewController *)self _platterViewForWidgetWithIdentifier:v11 creatingIfNecessary:0];
    if (v7)
    {
      id v8 = [(WGWidgetListViewController *)self _widgetIdentifiersForPlatterViewsVisibleInBounds];
      previouslyVisibleWidgetIDs = self->_previouslyVisibleWidgetIDs;
      self->_previouslyVisibleWidgetIDs = v8;

      uint64_t v10 = [(WGWidgetListViewController *)self widgetListView];
      [v7 frame];
      objc_msgSend(v10, "scrollRectToVisible:animated:", 1);
    }
    if (v6) {
      v6[2](v6, v7 != 0);
    }
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }
}

void __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_2_cold_1(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2 & 1;
  _os_log_debug_impl(&dword_222E49000, log, OS_LOG_TYPE_DEBUG, "C2 completion %lu - retargeted: %{BOOL}d", (uint8_t *)&v4, 0x12u);
}

void __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_2_81_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_222E49000, a2, OS_LOG_TYPE_DEBUG, "CA completion %lu", (uint8_t *)&v3, 0xCu);
}

void __94__WGWidgetListViewController_resizeWidgetWrapperView_toSize_withTransitionContext_completion___block_invoke_82_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_222E49000, a2, OS_LOG_TYPE_DEBUG, "final completion %lu", (uint8_t *)&v3, 0xCu);
}

void __91__WGWidgetListViewController__updateWidgetViewStateWithPreviouslyVisibleWidgetIdentifiers___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222E49000, a2, OS_LOG_TYPE_ERROR, "Encountered widget short look view with no list item: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __91__WGWidgetListViewController__updateWidgetViewStateWithPreviouslyVisibleWidgetIdentifiers___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222E49000, a2, OS_LOG_TYPE_ERROR, "Encountered list item without a widget identifier: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end