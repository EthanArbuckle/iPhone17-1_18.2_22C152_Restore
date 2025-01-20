@interface LibraryViewController
- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5;
- (CGRect)_frameForFloatingCollectionView;
- (LibraryConfiguration)configuration;
- (LibraryItemController)presentedItemController;
- (LibraryItemController)selectedItemController;
- (LibraryViewControllerDelegate)delegate;
- (NSArray)profilesInSwitcherMenu;
- (NSArray)sectionControllers;
- (WebBookmarkCollection)collection;
- (id)_diffableDataSourceForCollectionView:(id)a3;
- (id)_swipeActionsConfigurationForIndexPath:(id)a3;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (void)_applySnapshotForSection:(id)a3 animated:(BOOL)a4;
- (void)_collectionViewDidSelectItem:(id)a3 atIndexPath:(id)a4;
- (void)_enumerateItemControllersWithBlock:(id)a3;
- (void)_layOutFloatingViews;
- (void)_reloadFloatingSectionControllersImmediately;
- (void)_reloadSectionControllersImmediatelyAnimated:(BOOL)a3;
- (void)_updateSelectionIfNeeded;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionViewContentSizeDidChange:(id)a3;
- (void)dealloc;
- (void)librarySectionContentDidChange:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reloadExpansionStateForItem:(id)a3 inSection:(id)a4;
- (void)reloadSectionControllersIfNeeded;
- (void)scrollToTopAnimated:(BOOL)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNeedsReloadForProfileSwitcher;
- (void)setNeedsReloadSectionControllersAnimated:(BOOL)a3;
- (void)setNeedsUpdateSelection;
- (void)setPresentedItemController:(id)a3;
- (void)setSectionControllers:(id)a3;
- (void)setSelectedItemController:(id)a3;
- (void)updateSelection;
- (void)updateSelectionByIgnoringExistingSelection:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation LibraryViewController

- (void)dealloc
{
  [(UICollectionView *)self->_floatingCollectionView removeObserver:self forKeyPath:@"contentSize" context:kvoContext];
  v3.receiver = self;
  v3.super_class = (Class)LibraryViewController;
  [(LibraryViewController *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  v11 = (UICollectionView *)a4;
  id v12 = a5;
  if ((void *)kvoContext == a6
    && self->_floatingCollectionView == v11
    && [v10 isEqualToString:@"contentSize"])
  {
    [(UICollectionView *)self->_floatingCollectionView contentSize];
    [(UICollectionView *)self->_floatingCollectionView frame];
    CGRectGetHeight(v15);
    if ((_SFEqualWithEpsilon() & 1) == 0)
    {
      v13 = [(LibraryViewController *)self view];
      [v13 setNeedsLayout];
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)LibraryViewController;
    [(LibraryViewController *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)collectionViewContentSizeDidChange:(id)a3
{
  id v3 = [(LibraryViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)viewDidLoad
{
  v39.receiver = self;
  v39.super_class = (Class)LibraryViewController;
  [(LibraryViewController *)&v39 viewDidLoad];
  id v3 = _WBSLocalizedString();
  [(LibraryViewController *)self setTitle:v3];

  v4 = [(LibraryViewController *)self view];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:3];
  [v5 setHeaderMode:0];
  objc_initWeak(&location, self);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __36__LibraryViewController_viewDidLoad__block_invoke;
  v36[3] = &unk_1E6D7A988;
  objc_copyWeak(&v37, &location);
  [v5 setTrailingSwipeActionsConfigurationProvider:v36];
  id v6 = objc_alloc(MEMORY[0x1E4FB1580]);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __36__LibraryViewController_viewDidLoad__block_invoke_2;
  v33[3] = &unk_1E6D7A9B0;
  id v7 = v5;
  id v34 = v7;
  objc_copyWeak(&v35, &location);
  v28 = (void *)[v6 initWithSectionProvider:v33];
  id v8 = objc_alloc(MEMORY[0x1E4FB1568]);
  [v4 bounds];
  v9 = (UICollectionView *)objc_msgSend(v8, "initWithFrame:collectionViewLayout:", v28);
  collectionView = self->_collectionView;
  self->_collectionView = v9;

  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setDragDelegate:self];
  [(UICollectionView *)self->_collectionView setDropDelegate:self];
  [(UICollectionView *)self->_collectionView setSpringLoaded:1];
  [(UICollectionView *)self->_collectionView setSelectionFollowsFocus:1];
  [(UICollectionView *)self->_collectionView setAutoresizingMask:18];
  [(UICollectionView *)self->_collectionView setAllowsFocus:1];
  [v4 addSubview:self->_collectionView];
  v11 = [MEMORY[0x1E4FB1580] layoutWithListConfiguration:v7];
  id v12 = objc_alloc(MEMORY[0x1E4FB1568]);
  [v4 bounds];
  v13 = (UICollectionView *)objc_msgSend(v12, "initWithFrame:collectionViewLayout:", v11);
  floatingCollectionView = self->_floatingCollectionView;
  self->_floatingCollectionView = v13;

  [(UICollectionView *)self->_floatingCollectionView setAlwaysBounceVertical:0];
  CGRect v15 = [(UICollectionView *)self->_floatingCollectionView panGestureRecognizer];
  [v15 _setCanPanVertically:0];

  [(UICollectionView *)self->_floatingCollectionView setDelegate:self];
  [(UICollectionView *)self->_floatingCollectionView addObserver:self forKeyPath:@"contentSize" options:0 context:kvoContext];
  [v4 addSubview:self->_floatingCollectionView];
  v16 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  separator = self->_separator;
  self->_separator = v16;

  v18 = [MEMORY[0x1E4FB1618] systemFillColor];
  [(UIView *)self->_separator setBackgroundColor:v18];

  [v4 addSubview:self->_separator];
  v19 = [MEMORY[0x1E4FB1578] registrationWithCellClass:objc_opt_class() configurationHandler:&__block_literal_global_31];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __36__LibraryViewController_viewDidLoad__block_invoke_5;
  v31[3] = &unk_1E6D7B5C8;
  id v20 = v19;
  id v32 = v20;
  v21 = (void *)MEMORY[0x1E4E42950](v31);
  v22 = (UICollectionViewDiffableDataSource *)[objc_alloc(MEMORY[0x1E4FB1598]) initWithCollectionView:self->_collectionView cellProvider:v21];
  dataSource = self->_dataSource;
  self->_dataSource = v22;

  v24 = (UICollectionViewDiffableDataSource *)[objc_alloc(MEMORY[0x1E4FB1598]) initWithCollectionView:self->_floatingCollectionView cellProvider:v21];
  floatingCollectionViewDataSource = self->_floatingCollectionViewDataSource;
  self->_floatingCollectionViewDataSource = v24;

  id v26 = objc_alloc_init(MEMORY[0x1E4FB15A8]);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __36__LibraryViewController_viewDidLoad__block_invoke_6;
  v29[3] = &unk_1E6D7B5F0;
  objc_copyWeak(&v30, &location);
  v27 = (void *)MEMORY[0x1E4E42950](v29);
  [v26 setWillExpandItemHandler:v27];
  [v26 setWillCollapseItemHandler:v27];
  [(UICollectionViewDiffableDataSource *)self->_dataSource setSectionSnapshotHandlers:v26];
  [(LibraryViewController *)self _reloadFloatingSectionControllersImmediately];
  [(LibraryViewController *)self _reloadSectionControllersImmediatelyAnimated:0];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v35);

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

id __36__LibraryViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained _swipeActionsConfigurationForIndexPath:v3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

id __36__LibraryViewController_viewDidLoad__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:*(void *)(a1 + 32) layoutEnvironment:a3];
  [v5 contentInsets];
  double v7 = v6;
  double v9 = v8;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained[123] numberOfItemsInSection:a2])
    {
      double v12 = v7 + 5.0;
      double v13 = v9 + 5.0;
      double v14 = 16.0;
      double v15 = 8.0;
    }
    else
    {
      double v14 = *MEMORY[0x1E4FB12A8];
      double v12 = *(double *)(MEMORY[0x1E4FB12A8] + 8);
      double v15 = *(double *)(MEMORY[0x1E4FB12A8] + 16);
      double v13 = *(double *)(MEMORY[0x1E4FB12A8] + 24);
    }
    objc_msgSend(v5, "setContentInsets:", v14, v12, v15, v13);
    id v16 = v5;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

void __36__LibraryViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a2;
  double v7 = [v5 accessibilityIdentifier];
  [v6 setAccessibilityIdentifier:v7];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__LibraryViewController_viewDidLoad__block_invoke_4;
  v9[3] = &unk_1E6D7B5A0;
  id v10 = v5;
  id v8 = v5;
  [v6 setConfigurationUpdateHandler:v9];
}

void __36__LibraryViewController_viewDidLoad__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  double v7 = [v5 defaultContentConfiguration];
  id v8 = [v7 updatedConfigurationForState:v6];

  double v9 = [v8 textProperties];
  [v9 setAllowsDefaultTighteningForTruncation:0];

  id v10 = [v8 textProperties];
  [v10 setAdjustsFontSizeToFitWidth:0];

  [*(id *)(a1 + 32) updateListContentConfiguration:v8];
  [v5 updateConfigurationForTabIconRegistration:v8];
  [v5 setContentConfiguration:v8];
  if ([*(id *)(a1 + 32) hasSubitems])
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4FB1538]);
    [v11 setDisplayedState:0];
    [v11 setStyle:2];
    if (objc_msgSend(v8, "safari_usesWhiteText"))
    {
      double v12 = [v8 textProperties];
      double v13 = [v12 color];
      [v11 setTintColor:v13];
    }
    else
    {
      double v12 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
      [v11 setTintColor:v12];
    }

    [v11 setReservedLayoutWidth:30.0];
    v15[0] = v11;
    double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [v5 setAccessories:v14];
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) accessories];
    [v5 setAccessories:v11];
  }
}

uint64_t __36__LibraryViewController_viewDidLoad__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 dequeueConfiguredReusableCellWithRegistration:*(void *)(a1 + 32) forIndexPath:a3 item:a4];
}

void __36__LibraryViewController_viewDidLoad__block_invoke_6(uint64_t a1, void *a2)
{
  [a2 willToggleExpansionState];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained view];
  [v3 setNeedsLayout];
}

- (void)viewDidLayoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)LibraryViewController;
  [(LibraryViewController *)&v26 viewDidLayoutSubviews];
  if ([MEMORY[0x1E4F97EA0] isSafariProfilesEnabled])
  {
    id v3 = [(LibraryViewController *)self configuration];
    v4 = [v3 tabGroupProvider];
    int v5 = [v4 hasMultipleProfiles];

    floatingCollectionView = self->_floatingCollectionView;
    if (v5)
    {
      [(UICollectionView *)floatingCollectionView setHidden:0];
      [(LibraryViewController *)self _frameForFloatingCollectionView];
      double Height = CGRectGetHeight(v27);
      [(UICollectionView *)self->_collectionView contentInset];
      if ((_SFEqualWithEpsilon() & 1) == 0) {
        -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", 0.0, 0.0, Height, 0.0);
      }
      if (Height == 0.0)
      {
        BOOL v24 = 1;
      }
      else
      {
        [(UICollectionView *)self->_collectionView contentSize];
        double v9 = v8;
        [(UICollectionView *)self->_collectionView frame];
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        [(UICollectionView *)self->_collectionView adjustedContentInset];
        CGFloat v19 = v13 + v18;
        CGFloat v22 = v15 - (v20 + v21);
        v28.size.height = v17 - (v18 + v23);
        v28.origin.x = v11 + v20;
        v28.origin.y = v19;
        v28.size.width = v22;
        BOOL v24 = v9 <= CGRectGetHeight(v28);
      }
      [(UIView *)self->_separator setHidden:v24];
      [(LibraryViewController *)self _layOutFloatingViews];
    }
    else
    {
      [(UICollectionView *)floatingCollectionView setHidden:1];
      [(UIView *)self->_separator setHidden:1];
      [(UICollectionView *)self->_collectionView contentInset];
      if (v25 != 0.0) {
        -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
      }
    }
  }
  else
  {
    [(UICollectionView *)self->_floatingCollectionView setHidden:1];
    [(UIView *)self->_separator setHidden:1];
  }
}

- (CGRect)_frameForFloatingCollectionView
{
  id v3 = [(LibraryViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(UICollectionView *)self->_floatingCollectionView contentSize];
  if (v12 == 0.0)
  {
    v25.origin.x = v5;
    v25.origin.y = v7;
    v25.size.width = v9;
    v25.size.height = v11;
    double Height = CGRectGetHeight(v25);
  }
  else
  {
    double Height = v12 + 0.0;
  }
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  double v14 = CGRectGetHeight(v26) - Height;
  v27.origin.x = v5;
  v27.origin.y = v7;
  v27.size.width = v9;
  v27.size.height = v11;
  CGFloat Width = CGRectGetWidth(v27);
  if ([(UIView *)self->_separator isHidden])
  {
    NSInteger v16 = [(UICollectionView *)self->_collectionView numberOfSections];
    NSInteger v17 = [(UICollectionView *)self->_collectionView numberOfItemsInSection:v16 - 1];
    if (v16) {
      BOOL v18 = v17 == 0;
    }
    else {
      BOOL v18 = 1;
    }
    if (!v18)
    {
      CGFloat v19 = [MEMORY[0x1E4F28D58] indexPathForItem:v17 - 1 inSection:v16 - 1];
      double v20 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:v19];
      [v20 bounds];
      objc_msgSend(v3, "convertRect:fromView:", v20);
      double v14 = fmax(v14, CGRectGetMaxY(v28));
    }
  }

  double v21 = 0.0;
  double v22 = v14;
  double v23 = Width;
  double v24 = Height;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)_layOutFloatingViews
{
  [(LibraryViewController *)self _frameForFloatingCollectionView];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  -[UICollectionView setFrame:](self->_floatingCollectionView, "setFrame:");
  _SFOnePixel();
  separator = self->_separator;
  -[UIView setFrame:](separator, "setFrame:", v4, v6, v8, v9);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LibraryViewController;
  [(LibraryViewController *)&v4 viewWillAppear:a3];
  [(LibraryViewController *)self _reloadSectionControllersImmediatelyAnimated:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)LibraryViewController;
  [(LibraryViewController *)&v3 viewDidDisappear:a3];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)LibraryViewController;
  -[LibraryViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  [(LibraryViewController *)self _reloadSectionControllersImmediatelyAnimated:0];
}

- (void)updateSelection
{
}

- (void)updateSelectionByIgnoringExistingSelection:(BOOL)a3
{
  if (a3
    || ([(LibraryViewController *)self selectedItemController],
        objc_super v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __68__LibraryViewController_updateSelectionByIgnoringExistingSelection___block_invoke;
    v5[3] = &unk_1E6D7B618;
    v5[4] = self;
    [(LibraryViewController *)self _enumerateItemControllersWithBlock:v5];
  }
}

void __68__LibraryViewController_updateSelectionByIgnoringExistingSelection___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if ([a2 isSelected])
  {
    [*(id *)(*(void *)(a1 + 32) + 984) selectItemAtIndexPath:v7 animated:0 scrollPosition:0];
    *a4 = 1;
  }
}

- (void)_updateSelectionIfNeeded
{
  if (self->_reloadFlags.needsUpdateSelection)
  {
    self->_reloadFlags.needsUpdateSelection = 0;
    [(LibraryViewController *)self updateSelectionByIgnoringExistingSelection:1];
  }
}

- (void)reloadExpansionStateForItem:(id)a3 inSection:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dataSource = self->_dataSource;
  id v8 = a4;
  double v9 = [(UICollectionViewDiffableDataSource *)dataSource snapshotForSection:v8];
  if ([v6 isExpanded])
  {
    v12[0] = v6;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v9 expandItems:v10];
  }
  else
  {
    id v11 = v6;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    [v9 collapseItems:v10];
  }

  [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v9 toSection:v8 animatingDifferences:1];
}

- (void)setNeedsReloadSectionControllersAnimated:(BOOL)a3
{
  self->_reloadFlags.needsReload = 1;
  if (self->_reloadFlags.animated) {
    a3 = 1;
  }
  self->_reloadFlags.animated = a3;
  id v4 = [(LibraryViewController *)self view];
  [v4 setNeedsLayout];
}

- (void)setNeedsReloadForProfileSwitcher
{
  self->_reloadFlags.needsReloadForProfileSwitcher = 1;
  id v2 = [(LibraryViewController *)self view];
  [v2 setNeedsLayout];
}

- (void)_reloadFloatingSectionControllersImmediately
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if ([(LibraryViewController *)self isViewLoaded]
    && [(NSArray *)self->_sectionControllers count])
  {
    objc_super v3 = [(NSArray *)self->_sectionControllers lastObject];
    v22[0] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];

    id v5 = objc_alloc_init(MEMORY[0x1E4FB1360]);
    [v5 appendSectionsWithIdentifiers:v4];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          double v12 = objc_msgSend(v11, "filteredItemControllers", (void)v17);
          [v5 appendItemsWithIdentifiers:v12 intoSectionWithIdentifier:v11];
          [v5 reconfigureItemsWithIdentifiers:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    [(UICollectionViewDiffableDataSource *)self->_floatingCollectionViewDataSource applySnapshot:v5 animatingDifferences:0];
    double v13 = [(LibraryViewController *)self configuration];
    double v14 = [v13 tabGroupProvider];
    double v15 = [v14 profiles];
    profilesInSwitcherMenu = self->_profilesInSwitcherMenu;
    self->_profilesInSwitcherMenu = v15;

    self->_reloadFlags.needsReloadForProfileSwitcher = 0;
    [(LibraryViewController *)self updateSelectionByIgnoringExistingSelection:1];
  }
}

- (void)setNeedsUpdateSelection
{
  self->_reloadFlags.needsUpdateSelection = 1;
  id v2 = [(LibraryViewController *)self view];
  [v2 setNeedsLayout];
}

- (void)reloadSectionControllersIfNeeded
{
  p_reloadFlags = &self->_reloadFlags;
  if (!self->_reloadFlags.needsReload)
  {
    if (!self->_reloadFlags.needsReloadForProfileSwitcher) {
      return;
    }
LABEL_5:
    self->_reloadFlags.needsReloadForProfileSwitcher = 0;
    [(LibraryViewController *)self _reloadFloatingSectionControllersImmediately];
    if (!p_reloadFlags->needsReload) {
      return;
    }
    goto LABEL_6;
  }
  if (self->_reloadFlags.needsReloadForProfileSwitcher) {
    goto LABEL_5;
  }
LABEL_6:
  BOOL animated = p_reloadFlags->animated;
  p_reloadFlags->needsReload = 0;
  p_reloadFlags->BOOL animated = 0;
  [(LibraryViewController *)self _reloadSectionControllersImmediatelyAnimated:animated];
}

- (void)_reloadSectionControllersImmediatelyAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(LibraryViewController *)self isViewLoaded]
    && [(NSArray *)self->_sectionControllers count])
  {
    id v5 = -[NSArray subarrayWithRange:](self->_sectionControllers, "subarrayWithRange:", 0, [(NSArray *)self->_sectionControllers count] - 1);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          [(LibraryViewController *)self _applySnapshotForSection:*(void *)(*((void *)&v12 + 1) + 8 * v9++) animated:v3];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
    double v10 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
    id v11 = [v10 itemIdentifiers];
    [v10 reconfigureItemsWithIdentifiers:v11];

    [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v10 animatingDifferences:0];
    [(LibraryViewController *)self updateSelectionByIgnoringExistingSelection:1];
  }
}

- (void)scrollToTopAnimated:(BOOL)a3
{
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)LibraryViewController;
  [(LibraryViewController *)&v3 viewWillLayoutSubviews];
  [(LibraryViewController *)self reloadSectionControllersIfNeeded];
  [(LibraryViewController *)self _updateSelectionIfNeeded];
}

- (id)_diffableDataSourceForCollectionView:(id)a3
{
  objc_super v3 = [a3 dataSource];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)_enumerateItemControllersWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *, void *, unsigned char *))a3;
  uint64_t v12 = [(UICollectionView *)self->_collectionView numberOfSections];
  if (v12 >= 1)
  {
    uint64_t v5 = 0;
    while (1)
    {
      uint64_t v6 = [(UICollectionView *)self->_collectionView numberOfItemsInSection:v5];
      if (v6 >= 1) {
        break;
      }
LABEL_7:
      if (++v5 == v12) {
        goto LABEL_8;
      }
    }
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = [MEMORY[0x1E4F28D58] indexPathForItem:v8 inSection:v5];
      double v10 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v9];
      unsigned __int8 v13 = 0;
      v4[2](v4, v10, v9, &v13);
      int v11 = v13;

      if (v11) {
        break;
      }
      if (v7 == ++v8) {
        goto LABEL_7;
      }
    }
  }
LABEL_8:
}

- (id)_swipeActionsConfigurationForIndexPath:(id)a3
{
  collectionView = self->_collectionView;
  id v5 = a3;
  uint64_t v6 = [(LibraryViewController *)self _diffableDataSourceForCollectionView:collectionView];
  uint64_t v7 = [v6 itemIdentifierForIndexPath:v5];

  uint64_t v8 = [v7 swipeActionsConfiguration];

  return v8;
}

- (void)setSectionControllers:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSArray *)self->_sectionControllers isEqualToArray:v4])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v5 = self->_sectionControllers;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          [v10 setContentObserver:0];
          [v10 setPresentingViewController:0];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }

    int v11 = (NSArray *)[v4 copy];
    sectionControllers = self->_sectionControllers;
    self->_sectionControllers = v11;

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    unsigned __int8 v13 = self->_sectionControllers;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = *(void **)(*((void *)&v19 + 1) + 8 * j);
          objc_msgSend(v18, "setContentObserver:", self, (void)v19);
          [v18 setPresentingViewController:self];
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v15);
    }

    [(LibraryViewController *)self _reloadSectionControllersImmediatelyAnimated:0];
  }
}

- (LibraryItemController)selectedItemController
{
  objc_super v3 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
  id v4 = [v3 firstObject];

  if (v4)
  {
    id v5 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v4];
  }
  else
  {
    id v5 = 0;
  }

  return (LibraryItemController *)v5;
}

- (void)setSelectedItemController:(id)a3
{
  id v4 = a3;
  id v14 = v4;
  if (v4)
  {
    id WeakRetained = [(UICollectionViewDiffableDataSource *)self->_dataSource indexPathForItemIdentifier:v4];
    if (WeakRetained)
    {
      uint64_t v6 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
      char v7 = [v6 containsObject:WeakRetained];

      if ((v7 & 1) == 0)
      {
        [(UICollectionView *)self->_collectionView selectItemAtIndexPath:WeakRetained animated:0 scrollPosition:2];
        [(LibraryViewController *)self _collectionViewDidSelectItem:v14 atIndexPath:WeakRetained];
      }
    }
  }
  else
  {
    presentedItemController = self->_presentedItemController;
    self->_presentedItemController = 0;

    uint64_t v9 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
    uint64_t v10 = [v9 count];

    if (!v10) {
      goto LABEL_10;
    }
    collectionView = self->_collectionView;
    uint64_t v12 = [(UICollectionView *)collectionView indexPathsForSelectedItems];
    unsigned __int8 v13 = [v12 firstObject];
    [(UICollectionView *)collectionView deselectItemAtIndexPath:v13 animated:0];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained libraryViewControllerDidClearSelection:self];
    }
    [(LibraryViewController *)self updateSelection];
  }

LABEL_10:
}

- (void)scrollViewDidScroll:(id)a3
{
  if (self->_collectionView == a3 && [(UIView *)self->_separator isHidden])
  {
    [(LibraryViewController *)self _layOutFloatingViews];
  }
}

- (void)_collectionViewDidSelectItem:(id)a3 atIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained libraryViewController:self didSelectItem:v10];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([WeakRetained libraryViewController:self shouldPersistSelectionForItem:v10] & 1) == 0)
  {
    [(UICollectionView *)self->_collectionView deselectItemAtIndexPath:v6 animated:1];
    uint64_t v9 = (LibraryItemController *)v10;
    presentedItemController = self->_presentedItemController;
    self->_presentedItemController = v9;
  }
  else
  {
    presentedItemController = self->_presentedItemController;
    self->_presentedItemController = 0;
  }

  [(LibraryViewController *)self updateSelection];
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  dataSource = self->_dataSource;
  id v7 = a4;
  id v8 = [(UICollectionViewDiffableDataSource *)dataSource itemIdentifierForIndexPath:a5];
  [v8 willDisplayCell:v7];
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setTabIconRegistration:0];
  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 1;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v7 = (UICollectionView *)a3;
  id v8 = a4;
  if (![v8 count] || self->_floatingCollectionView == v7)
  {
    unsigned __int8 v13 = 0;
  }
  else
  {
    uint64_t v9 = [v8 sortedArrayUsingSelector:sel_compare_];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __91__LibraryViewController_collectionView_contextMenuConfigurationForItemsAtIndexPaths_point___block_invoke;
    v15[3] = &unk_1E6D7B160;
    v15[4] = self;
    id v10 = objc_msgSend(v9, "safari_mapObjectsUsingBlock:", v15);
    int v11 = [(LibraryViewController *)self configuration];
    uint64_t v12 = [v11 tabGroupProvider];
    unsigned __int8 v13 = +[LibraryMenuProvider contextMenuConfigurationForLibraryItems:v10 dataSource:v12];

    id v8 = v9;
  }

  return v13;
}

id __91__LibraryViewController_collectionView_contextMenuConfigurationForItemsAtIndexPaths_point___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[123];
  id v4 = a2;
  id v5 = [v2 _diffableDataSourceForCollectionView:v3];
  id v6 = [v5 itemIdentifierForIndexPath:v4];

  return v6;
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  id v7 = a4;
  id v8 = [(LibraryViewController *)self _diffableDataSourceForCollectionView:a3];
  uint64_t v9 = [v8 itemIdentifierForIndexPath:v7];

  LOBYTE(v8) = [v9 isSpringLoaded];
  return (char)v8;
}

- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [(LibraryViewController *)self _diffableDataSourceForCollectionView:a3];
  id v8 = [v7 itemIdentifierForIndexPath:v6];

  LOBYTE(v7) = [v8 selectionFollowsFocus];
  return (char)v7;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  collectionView = self->_collectionView;
  id v6 = a4;
  id v7 = [(LibraryViewController *)self _diffableDataSourceForCollectionView:collectionView];
  id v8 = [v7 itemIdentifierForIndexPath:v6];

  [(LibraryViewController *)self _collectionViewDidSelectItem:v8 atIndexPath:v6];
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = [(LibraryViewController *)self _diffableDataSourceForCollectionView:a3];
  uint64_t v9 = [v8 itemIdentifierForIndexPath:v7];

  id v10 = [v9 dragItems];

  return v10;
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  id v8 = a5;
  uint64_t v9 = [(LibraryViewController *)self _diffableDataSourceForCollectionView:a3];
  id v10 = [v9 itemIdentifierForIndexPath:v8];

  int v11 = [v10 dragItems];

  return v11;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F97E48], "sharedLogger", a3, a4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 didStartDragWithDragContentType:4];
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(LibraryViewController *)self _diffableDataSourceForCollectionView:a3];
  int v11 = [v10 itemIdentifierForIndexPath:v8];

  uint64_t v12 = [v11 dropOperationForSession:v9];
  uint64_t v13 = [v11 dropIntentForSession:v9];

  id v14 = (void *)[objc_alloc(MEMORY[0x1E4FB15B8]) initWithDropOperation:v12 intent:v13];
  return v14;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v16 = [v6 destinationIndexPath];
  id v8 = [(LibraryViewController *)self _diffableDataSourceForCollectionView:v7];
  id v9 = objc_msgSend(v8, "sectionIdentifierForIndex:", objc_msgSend(v16, "section"));

  id v10 = [(LibraryViewController *)self _diffableDataSourceForCollectionView:v7];

  int v11 = [v10 itemIdentifierForIndexPath:v16];

  uint64_t v12 = [v6 session];
  uint64_t v13 = objc_msgSend(v9, "itemControllerToHandleDropItemsFromSession:withProposedDestinationItemController:atIndex:", v12, v11, objc_msgSend(v16, "row"));

  id v14 = [v6 proposal];
  uint64_t v15 = [v6 session];

  [v13 performDropWithProposal:v14 session:v15];
}

- (void)librarySectionContentDidChange:(id)a3
{
}

- (void)_applySnapshotForSection:(id)a3 animated:(BOOL)a4
{
  BOOL v16 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  id v7 = [v5 filteredItemControllers];
  [v6 appendItems:v7];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v14 = [v13 subitems];
        if ([v14 count])
        {
          [v6 appendItems:v14 intoParentItem:v13];
          if ([v13 isExpanded])
          {
            long long v21 = v13;
            uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
            [v6 expandItems:v15];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v10);
  }

  [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v6 toSection:v5 animatingDifferences:v16];
}

- (LibraryViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (LibraryViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WebBookmarkCollection)collection
{
  return self->_collection;
}

- (LibraryConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSArray)sectionControllers
{
  return self->_sectionControllers;
}

- (LibraryItemController)presentedItemController
{
  return self->_presentedItemController;
}

- (void)setPresentedItemController:(id)a3
{
}

- (NSArray)profilesInSwitcherMenu
{
  return self->_profilesInSwitcherMenu;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profilesInSwitcherMenu, 0);
  objc_storeStrong((id *)&self->_presentedItemController, 0);
  objc_storeStrong((id *)&self->_sectionControllers, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_floatingCollectionView, 0);
  objc_storeStrong((id *)&self->_floatingCollectionViewDataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end