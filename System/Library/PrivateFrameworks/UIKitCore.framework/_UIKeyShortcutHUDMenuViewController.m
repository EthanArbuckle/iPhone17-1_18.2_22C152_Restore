@interface _UIKeyShortcutHUDMenuViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isSearching;
- (BOOL)isTransitioningSearch;
- (BOOL)selectionFollowsFocusForItemAtIndexPath:(id)a3;
- (BOOL)shouldPersistSelectionForCellAtIndexPath:(id)a3;
- (UICollectionView)collectionView;
- (UICollectionViewCellRegistration)cellRegistration;
- (UICollectionViewDiffableDataSource)dataSource;
- (UICollectionViewSupplementaryRegistration)cellSeparatorRegistration;
- (UICollectionViewSupplementaryRegistration)sectionHeaderRegistration;
- (UIKeyShortcutHUDMetrics)metrics;
- (UIVisualEffectView)visualEffectView;
- (_UIKeyShortcutHUDCollectionViewManager)collectionViewManager;
- (_UIKeyShortcutHUDMenu)menu;
- (_UIKeyShortcutHUDMenuViewControllerDelegate)delegate;
- (id)_searchModeCollectionViewLayout;
- (id)_standardModeCollectionViewLayout;
- (id)indexPathsForCellsUsingSeparatorAtIndexPath:(id)a3;
- (id)indexPathsForSeparatorsUsedByCellAtIndexPath:(id)a3;
- (unint64_t)currentScrolledToCategoryIndex;
- (void)_configureCollectionView;
- (void)_displayMenu:(id)a3 animatingDifferences:(BOOL)a4;
- (void)_setupSubviews;
- (void)didCompleteSearchTransition;
- (void)didScrollCollectionView;
- (void)flashShortcutIfVisible:(id)a3 completionHandler:(id)a4;
- (void)performActionForSelectingCellAtIndexPath:(id)a3;
- (void)prepareForSearchTransition:(BOOL)a3;
- (void)scrollToCategory:(id)a3 withCategoryIndex:(int64_t)a4 animated:(BOOL)a5;
- (void)setCellRegistration:(id)a3;
- (void)setCellSeparatorRegistration:(id)a3;
- (void)setCollectionViewManager:(id)a3;
- (void)setCurrentScrolledToCategoryIndex:(unint64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMenu:(id)a3;
- (void)setMenu:(id)a3 animated:(BOOL)a4;
- (void)setMetrics:(id)a3;
- (void)setSearching:(BOOL)a3;
- (void)setSectionHeaderRegistration:(id)a3;
- (void)setTransitioningSearch:(BOOL)a3;
- (void)setVisualEffectView:(id)a3;
- (void)viewDidLoad;
@end

@implementation _UIKeyShortcutHUDMenuViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyShortcutHUDMenuViewController;
  [(UIViewController *)&v3 viewDidLoad];
  [(_UIKeyShortcutHUDMenuViewController *)self _setupSubviews];
  [(_UIKeyShortcutHUDMenuViewController *)self _configureCollectionView];
}

- (void)_setupSubviews
{
  p_metrics = &self->_metrics;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
  [WeakRetained menuPlatterCornerRadius];
  double v6 = v5;
  v7 = [(UIViewController *)self view];
  v8 = [v7 layer];
  [v8 setCornerRadius:v6];

  uint64_t v9 = *MEMORY[0x1E4F39EA8];
  v10 = [(UIViewController *)self view];
  v11 = [v10 layer];
  [v11 setCornerCurve:v9];

  id v12 = objc_loadWeakRetained((id *)p_metrics);
  uint64_t v13 = [v12 menuPanelCornerMask];
  v14 = [(UIViewController *)self view];
  v15 = [v14 layer];
  [v15 setMaskedCorners:v13];

  v16 = [(UIViewController *)self view];
  v17 = [v16 layer];
  [v17 setMasksToBounds:1];

  id v18 = objc_loadWeakRetained((id *)p_metrics);
  [v18 menuPanelStrokeWidth];
  double v20 = v19;
  v21 = [(UIViewController *)self view];
  v22 = [v21 layer];
  [v22 setBorderWidth:v20];

  id v23 = objc_loadWeakRetained((id *)p_metrics);
  v24 = [v23 platterStrokeColor];
  v25 = [(UIViewController *)self traitCollection];
  id v26 = [v24 resolvedColorWithTraitCollection:v25];
  uint64_t v27 = [v26 CGColor];
  v28 = [(UIViewController *)self view];
  v29 = [v28 layer];
  [v29 setBorderColor:v27];

  id v30 = objc_loadWeakRetained((id *)p_metrics);
  [v30 platterZPosition];
  double v32 = v31;
  v33 = [(UIViewController *)self view];
  v34 = [v33 layer];
  [v34 setZPosition:v32];

  v35 = [UIVisualEffectView alloc];
  id v36 = objc_loadWeakRetained((id *)p_metrics);
  v37 = [v36 platterVisualEffect];
  v38 = [(UIVisualEffectView *)v35 initWithEffect:v37];
  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = v38;

  v40 = [(UIViewController *)self view];
  [v40 bounds];
  -[UIView setFrame:](self->_visualEffectView, "setFrame:");

  [(UIView *)self->_visualEffectView setAutoresizingMask:18];
  v41 = [UICollectionView alloc];
  v42 = [(UIVisualEffectView *)self->_visualEffectView contentView];
  [v42 bounds];
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  v51 = [(_UIKeyShortcutHUDMenuViewController *)self _standardModeCollectionViewLayout];
  v52 = -[UICollectionView initWithFrame:collectionViewLayout:](v41, "initWithFrame:collectionViewLayout:", v51, v44, v46, v48, v50);
  collectionView = self->_collectionView;
  self->_collectionView = v52;

  id v54 = objc_loadWeakRetained((id *)p_metrics);
  [v54 menuHorizontalContentInset];
  double v56 = v55;
  id v57 = objc_loadWeakRetained((id *)p_metrics);
  [v57 menuHorizontalContentInset];
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", 0.0, v56, 0.0, v58);

  [(UIView *)self->_collectionView setAutoresizingMask:18];
  v59 = [(UIViewController *)self view];
  [v59 addSubview:self->_visualEffectView];

  id v60 = [(UIVisualEffectView *)self->_visualEffectView contentView];
  [v60 addSubview:self->_collectionView];
}

- (void)_configureCollectionView
{
  objc_initWeak(location, self);
  objc_super v3 = self;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __63___UIKeyShortcutHUDMenuViewController__configureCollectionView__block_invoke;
  v27[3] = &unk_1E52EEF18;
  objc_copyWeak(&v28, location);
  v4 = +[UICollectionViewCellRegistration registrationWithCellClass:v3 configurationHandler:v27];

  double v5 = self;
  double v6 = +[_UIKeyShortcutHUDUtilities separatorElementKind]();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __63___UIKeyShortcutHUDMenuViewController__configureCollectionView__block_invoke_2;
  v25[3] = &unk_1E52EEF40;
  objc_copyWeak(&v26, location);
  v7 = +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:v5 elementKind:v6 configurationHandler:v25];

  v8 = self;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __63___UIKeyShortcutHUDMenuViewController__configureCollectionView__block_invoke_3;
  v23[3] = &unk_1E52EEF68;
  objc_copyWeak(&v24, location);
  uint64_t v9 = +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:v8 elementKind:@"UICollectionElementKindSectionHeader" configurationHandler:v23];

  v10 = [UICollectionViewDiffableDataSource alloc];
  collectionView = self->_collectionView;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __63___UIKeyShortcutHUDMenuViewController__configureCollectionView__block_invoke_4;
  v21[3] = &unk_1E52EEF90;
  id v12 = v4;
  id v22 = v12;
  uint64_t v13 = [(UICollectionViewDiffableDataSource *)v10 initWithCollectionView:collectionView cellProvider:v21];
  dataSource = self->_dataSource;
  self->_dataSource = v13;

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __63___UIKeyShortcutHUDMenuViewController__configureCollectionView__block_invoke_5;
  v18[3] = &unk_1E52EEFB8;
  id v15 = v9;
  id v19 = v15;
  id v16 = v7;
  id v20 = v16;
  [(UICollectionViewDiffableDataSource *)self->_dataSource setSupplementaryViewProvider:v18];
  objc_storeStrong((id *)&self->_cellRegistration, v4);
  objc_storeStrong((id *)&self->_cellSeparatorRegistration, v7);
  objc_storeStrong((id *)&self->_sectionHeaderRegistration, v9);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menu);
  [(_UIKeyShortcutHUDMenuViewController *)self _displayMenu:WeakRetained animatingDifferences:0];

  self->_currentScrolledToCategoryIndex = 0;
  objc_destroyWeak(&v24);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(location);
}

- (id)_standardModeCollectionViewLayout
{
  v54[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [off_1E52D2B08 fractionalWidthDimension:1.0];
  v4 = [off_1E52D2B08 absoluteDimension:1.0];
  v52 = [off_1E52D2B30 sizeWithWidthDimension:v3 heightDimension:v4];

  double v5 = +[_UIKeyShortcutHUDUtilities separatorElementKind]();
  double v6 = [off_1E52D2AF0 layoutAnchorWithEdges:4];
  v51 = [off_1E52D2B40 supplementaryItemWithLayoutSize:v52 elementKind:v5 containerAnchor:v6];

  p_metrics = &self->_metrics;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
  [WeakRetained minShortcutCellWidth];
  uint64_t v9 = objc_msgSend(off_1E52D2B08, "estimatedDimension:");
  id v10 = objc_loadWeakRetained((id *)&self->_metrics);
  v11 = objc_msgSend(off_1E52D2B08, "fractionalHeightDimension:", 1.0 / (double)(unint64_t)objc_msgSend(v10, "numCellsPerColumn"));
  double v50 = [off_1E52D2B30 sizeWithWidthDimension:v9 heightDimension:v11];

  v54[0] = v51;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
  double v49 = [off_1E52D2B20 itemWithLayoutSize:v50 supplementaryItems:v12];

  id v13 = objc_loadWeakRetained((id *)&self->_metrics);
  [v13 minShortcutCellWidth];
  v14 = objc_msgSend(off_1E52D2B08, "estimatedDimension:");
  id v15 = objc_loadWeakRetained((id *)&self->_metrics);
  [v15 menuCellHeight];
  double v17 = v16;
  id v18 = objc_loadWeakRetained((id *)&self->_metrics);
  id v19 = objc_msgSend(off_1E52D2B08, "absoluteDimension:", v17 * (double)(unint64_t)objc_msgSend(v18, "numCellsPerColumn"));
  id v20 = [off_1E52D2B30 sizeWithWidthDimension:v14 heightDimension:v19];

  id v21 = objc_loadWeakRetained((id *)&self->_metrics);
  id v22 = objc_msgSend(off_1E52D2B18, "verticalGroupWithLayoutSize:repeatingSubitem:count:", v20, v49, objc_msgSend(v21, "numCellsPerColumn"));

  id v23 = objc_loadWeakRetained((id *)&self->_metrics);
  [v23 menuCellHeight];
  id v24 = objc_msgSend(off_1E52D2B38, "fixedSpacing:");
  v25 = [off_1E52D2B10 spacingForLeading:0 top:v24 trailing:0 bottom:0];
  [v22 setEdgeSpacing:v25];

  id v26 = [off_1E52D2B28 sectionWithGroup:v22];
  id v27 = objc_loadWeakRetained((id *)&self->_metrics);
  [v27 menuColumnSpacing];
  objc_msgSend(v26, "setInterGroupSpacing:");

  id v28 = objc_loadWeakRetained((id *)&self->_metrics);
  [v28 minShortcutCellWidth];
  v29 = objc_msgSend(off_1E52D2B08, "estimatedDimension:");
  id v30 = objc_loadWeakRetained((id *)&self->_metrics);
  [v30 menuCellHeight];
  double v31 = objc_msgSend(off_1E52D2B08, "absoluteDimension:");
  double v32 = [off_1E52D2B30 sizeWithWidthDimension:v29 heightDimension:v31];

  v33 = [off_1E52D2AF8 boundarySupplementaryItemWithLayoutSize:v32 elementKind:@"UICollectionElementKindSectionHeader" alignment:2];
  [v33 setExtendsBoundary:0];
  [v33 setPinToVisibleBounds:1];
  v53 = v33;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
  [v26 setBoundarySupplementaryItems:v34];

  [v26 contentInsets];
  double v36 = v35;
  double v38 = v37;
  id v39 = objc_loadWeakRetained((id *)p_metrics);
  [v39 menuTopContentInset];
  double v41 = v40;

  id v42 = objc_loadWeakRetained((id *)p_metrics);
  [v42 menuBottomContentInset];
  double v44 = v43;

  objc_msgSend(v26, "setContentInsets:", v41, v36, v44, v38);
  double v45 = objc_opt_new();
  [v45 setScrollDirection:1];
  id v46 = objc_loadWeakRetained((id *)p_metrics);
  [v46 menuColumnSpacing];
  objc_msgSend(v45, "setInterSectionSpacing:");

  double v47 = [[UICollectionViewCompositionalLayout alloc] initWithSection:v26 configuration:v45];
  return v47;
}

- (id)_searchModeCollectionViewLayout
{
  v43[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [off_1E52D2B08 fractionalWidthDimension:1.0];
  p_metrics = &self->_metrics;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
  [WeakRetained separatorWidth];
  double v6 = objc_msgSend(off_1E52D2B08, "absoluteDimension:");
  double v40 = [off_1E52D2B30 sizeWithWidthDimension:v3 heightDimension:v6];

  v7 = +[_UIKeyShortcutHUDUtilities separatorElementKind]();
  v8 = [off_1E52D2AF0 layoutAnchorWithEdges:4];
  id v39 = [off_1E52D2B40 supplementaryItemWithLayoutSize:v40 elementKind:v7 containerAnchor:v8];

  uint64_t v9 = [off_1E52D2B08 fractionalWidthDimension:1.0];
  id v10 = [off_1E52D2B08 fractionalHeightDimension:1.0];
  double v38 = [off_1E52D2B30 sizeWithWidthDimension:v9 heightDimension:v10];

  v43[0] = v39;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
  id v12 = [off_1E52D2B20 itemWithLayoutSize:v38 supplementaryItems:v11];

  id v13 = [off_1E52D2B08 fractionalWidthDimension:1.0];
  id v14 = objc_loadWeakRetained((id *)&self->_metrics);
  [v14 menuCellHeight];
  id v15 = objc_msgSend(off_1E52D2B08, "absoluteDimension:");
  double v16 = [off_1E52D2B30 sizeWithWidthDimension:v13 heightDimension:v15];

  id v42 = v12;
  double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  id v18 = [off_1E52D2B18 verticalGroupWithLayoutSize:v16 subitems:v17];

  id v19 = [off_1E52D2B28 sectionWithGroup:v18];
  id v20 = [off_1E52D2B08 fractionalWidthDimension:1.0];
  id v21 = objc_loadWeakRetained((id *)&self->_metrics);
  [v21 menuCellHeight];
  id v22 = objc_msgSend(off_1E52D2B08, "absoluteDimension:");
  id v23 = [off_1E52D2B30 sizeWithWidthDimension:v20 heightDimension:v22];

  id v24 = [off_1E52D2AF8 boundarySupplementaryItemWithLayoutSize:v23 elementKind:@"UICollectionElementKindSectionHeader" alignment:1];
  [v24 setPinToVisibleBounds:1];
  double v41 = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  [v19 setBoundarySupplementaryItems:v25];

  [v19 contentInsets];
  double v27 = v26;
  double v29 = v28;
  id v30 = objc_loadWeakRetained((id *)p_metrics);
  [v30 menuHorizontalContentInset];
  double v32 = v31;

  id v33 = objc_loadWeakRetained((id *)p_metrics);
  [v33 menuHorizontalContentInset];
  double v35 = v34;

  objc_msgSend(v19, "setContentInsets:", v27, v32, v29, v35);
  double v36 = [[UICollectionViewCompositionalLayout alloc] initWithSection:v19];

  return v36;
}

- (void)setMenu:(id)a3
{
}

- (void)setMenu:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menu);

  v7 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_menu, obj);
    BOOL v8 = [(UIViewController *)self isViewLoaded];
    v7 = obj;
    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_menu);
      [(_UIKeyShortcutHUDMenuViewController *)self _displayMenu:v9 animatingDifferences:v4];

      id v10 = objc_loadWeakRetained((id *)&self->_collectionViewManager);
      [v10 reloadAllVisibleSeparatorsForClient:self];

      v7 = obj;
    }
  }
}

- (void)_displayMenu:(id)a3 animatingDifferences:(BOOL)a4
{
  BOOL v16 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v7 = [v5 children];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v21 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = v21;
        id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
        [v6 appendSectionsWithIdentifiers:v13];

        id v14 = [v12 children];
        [v6 appendItemsWithIdentifiers:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v9);
  }

  dataSource = self->_dataSource;
  if (v16) {
    [(UICollectionViewDiffableDataSource *)dataSource applySnapshot:v6 animatingDifferences:1];
  }
  else {
    [(UICollectionViewDiffableDataSource *)dataSource applySnapshotUsingReloadData:v6];
  }
}

- (void)performActionForSelectingCellAtIndexPath:(id)a3
{
  id v5 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:a3];
  if (v5)
  {
    BOOL v4 = [(_UIKeyShortcutHUDMenuViewController *)self delegate];
    [v4 menuViewController:self didSelectShortcut:v5];
  }
}

- (BOOL)selectionFollowsFocusForItemAtIndexPath:(id)a3
{
  return 0;
}

- (BOOL)shouldPersistSelectionForCellAtIndexPath:(id)a3
{
  objc_super v3 = self;
  BOOL v4 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:a3];
  id v5 = [(_UIKeyShortcutHUDMenuViewController *)v3 delegate];
  LOBYTE(v3) = [v5 menuViewController:v3 shouldPersistSelectionForShortcut:v4];

  return (char)v3;
}

- (void)didScrollCollectionView
{
  if (![(UIScrollView *)self->_collectionView isScrollAnimating]
    && ![(_UIKeyShortcutHUDMenuViewController *)self isSearching]
    && ![(_UIKeyShortcutHUDMenuViewController *)self isTransitioningSearch])
  {
    [(_UIKeyShortcutHUDMenuViewController *)self currentScrolledToCategoryIndex];
    [(UIScrollView *)self->_collectionView contentOffset];
    double v4 = v3;
    [(UIScrollView *)self->_collectionView contentSize];
    double v6 = v5;
    [(UIView *)self->_collectionView bounds];
    double v8 = v7;
    [(UIScrollView *)self->_collectionView contentInset];
    double v10 = v9;
    [(UIScrollView *)self->_collectionView contentInset];
    if (v4 + v11 > 0.0
      || (id v12 = objc_loadWeakRetained((id *)&self->_menu), v13 = [v12 isEmpty], v12, v13))
    {
      if (v4 < v6 - v8 + v10
        || (id v14 = objc_loadWeakRetained((id *)&self->_menu),
            char v15 = [v14 isEmpty],
            v14,
            (v15 & 1) != 0))
      {
        [(UIScrollView *)self->_collectionView contentInset];
        double v17 = v4 + v16 + v16;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
        uint64_t v19 = [WeakRetained categoryIndexAtHorizontalOffset:v17];
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_menu);
        long long v20 = [WeakRetained children];
        uint64_t v19 = [v20 count] - 1;
      }
    }
    else
    {
      uint64_t v19 = 0;
    }
    if ([(_UIKeyShortcutHUDMenuViewController *)self currentScrolledToCategoryIndex] != v19)
    {
      [(_UIKeyShortcutHUDMenuViewController *)self setCurrentScrolledToCategoryIndex:v19];
      id v21 = objc_loadWeakRetained((id *)&self->_menu);
      id v22 = [v21 children];
      objc_msgSend(v22, "objectAtIndexedSubscript:", -[_UIKeyShortcutHUDMenuViewController currentScrolledToCategoryIndex](self, "currentScrolledToCategoryIndex"));
      id v24 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v23 = [(_UIKeyShortcutHUDMenuViewController *)self delegate];
      objc_msgSend(v23, "menuViewController:didScrollToCategory:withCategoryIndex:", self, v24, -[_UIKeyShortcutHUDMenuViewController currentScrolledToCategoryIndex](self, "currentScrolledToCategoryIndex"));
    }
  }
}

- (id)indexPathsForCellsUsingSeparatorAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v6 = [v4 indexPath];
  if (v6)
  {
    double v7 = (void *)v6;
    double v8 = [v4 client];

    if (v8 == self)
    {
      if ([(_UIKeyShortcutHUDMenuViewController *)self isSearching]
        || ([v4 indexPath],
            double v9 = objc_claimAutoreleasedReturnValue(),
            unint64_t v10 = [v9 item] + 1,
            id WeakRetained = objc_loadWeakRetained((id *)&self->_metrics),
            unint64_t v12 = v10 % [WeakRetained numCellsPerColumn],
            WeakRetained,
            v9,
            v12))
      {
        [v5 addObject:v4];
        int v13 = [v4 indexPath];
        uint64_t v14 = [v13 section];
        if (v14 < [(UICollectionView *)self->_collectionView numberOfSections])
        {
          char v15 = [v4 indexPath];
          uint64_t v16 = [v15 item];
          collectionView = self->_collectionView;
          long long v18 = [v4 indexPath];
          uint64_t v19 = -[UICollectionView numberOfItemsInSection:](collectionView, "numberOfItemsInSection:", [v18 section])- 1;

          if (v16 >= v19) {
            goto LABEL_9;
          }
          long long v20 = (void *)MEMORY[0x1E4F28D58];
          id v21 = [v4 indexPath];
          uint64_t v22 = [v21 item] + 1;
          uint64_t v23 = [v4 indexPath];
          id v24 = objc_msgSend(v20, "indexPathForItem:inSection:", v22, objc_msgSend(v23, "section"));
          int v13 = +[_UIKeyShortcutHUDIndexPath hudIndexPathWithClient:self indexPath:v24];

          [v5 addObject:v13];
        }
      }
    }
  }
LABEL_9:

  return v5;
}

- (id)indexPathsForSeparatorsUsedByCellAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v6 = [v4 indexPath];
  if (v6)
  {
    double v7 = (void *)v6;
    double v8 = [v4 client];

    if (v8 == self)
    {
      if ([(_UIKeyShortcutHUDMenuViewController *)self isSearching])
      {
        [v5 addObject:v4];
        double v9 = [v4 indexPath];
        uint64_t v10 = [v9 item];

        if (v10 < 1) {
          goto LABEL_10;
        }
LABEL_9:
        uint64_t v19 = (void *)MEMORY[0x1E4F28D58];
        long long v20 = [v4 indexPath];
        uint64_t v21 = [v20 item] - 1;
        uint64_t v22 = [v4 indexPath];
        uint64_t v23 = objc_msgSend(v19, "indexPathForItem:inSection:", v21, objc_msgSend(v22, "section"));
        id v24 = +[_UIKeyShortcutHUDIndexPath hudIndexPathWithClient:self indexPath:v23];

        [v5 addObject:v24];
        goto LABEL_10;
      }
      double v11 = [v4 indexPath];
      unint64_t v12 = [v11 item] + 1;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
      unint64_t v14 = v12 % [WeakRetained numCellsPerColumn];

      if (v14) {
        [v5 addObject:v4];
      }
      char v15 = [v4 indexPath];
      unint64_t v16 = [v15 item];
      id v17 = objc_loadWeakRetained((id *)&self->_metrics);
      unint64_t v18 = v16 % [v17 numCellsPerColumn];

      if (v18) {
        goto LABEL_9;
      }
    }
  }
LABEL_10:

  return v5;
}

- (void)prepareForSearchTransition:(BOOL)a3
{
}

- (void)setSearching:(BOOL)a3
{
  if (self->_searching != a3)
  {
    self->_searching = a3;
    collectionView = self->_collectionView;
    if (a3)
    {
      double v5 = [(_UIKeyShortcutHUDMenuViewController *)self _searchModeCollectionViewLayout];
      [(UICollectionView *)collectionView setCollectionViewLayout:v5];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
      [WeakRetained searchModeMenuTopContentInset];
      double v8 = v7;
      id v9 = objc_loadWeakRetained((id *)&self->_metrics);
      [v9 searchModeMenuBottomContentInset];
      double v11 = v10;
      unint64_t v12 = self->_collectionView;
      double v13 = 0.0;
      double v14 = 0.0;
      double v15 = v8;
    }
    else
    {
      unint64_t v16 = [(_UIKeyShortcutHUDMenuViewController *)self _standardModeCollectionViewLayout];
      [(UICollectionView *)collectionView setCollectionViewLayout:v16];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
      [WeakRetained menuHorizontalContentInset];
      double v18 = v17;
      id v9 = objc_loadWeakRetained((id *)&self->_metrics);
      [v9 menuHorizontalContentInset];
      double v14 = v19;
      unint64_t v12 = self->_collectionView;
      double v15 = 0.0;
      double v11 = 0.0;
      double v13 = v18;
    }
    -[UICollectionView setContentInset:](v12, "setContentInset:", v15, v13, v11, v14);

    id v20 = objc_loadWeakRetained((id *)&self->_collectionViewManager);
    [v20 reloadAllVisibleSeparatorsForClient:self];
  }
}

- (void)didCompleteSearchTransition
{
}

- (void)scrollToCategory:(id)a3 withCategoryIndex:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  [(UIScrollView *)self->_collectionView contentInset];
  double v9 = v8;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
  [WeakRetained horizontalOffsetForCategoryAtIndex:a4];
  double v12 = v11;

  double v13 = v12 - (v9 + v9);
  id v14 = objc_loadWeakRetained((id *)&self->_metrics);
  [v14 displayedMenuContentWidth];
  double v16 = v15;
  [(UIView *)self->_collectionView bounds];
  double v18 = v16 - v17 - v9;

  if (v13 < v18) {
    double v18 = v13;
  }
  collectionView = self->_collectionView;
  [(UIScrollView *)collectionView contentOffset];
  [(UICollectionView *)collectionView setContentOffset:v5 animated:v18];
  [(_UIKeyShortcutHUDMenuViewController *)self setCurrentScrolledToCategoryIndex:a4];
}

- (void)flashShortcutIfVisible:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  double v7 = [(UICollectionViewDiffableDataSource *)self->_dataSource indexPathForItemIdentifier:a3];
  double v8 = [(_UIKeyShortcutHUDMenuViewController *)self collectionViewManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80___UIKeyShortcutHUDMenuViewController_flashShortcutIfVisible_completionHandler___block_invoke;
  v11[3] = &unk_1E52EDA60;
  id v12 = v7;
  id v13 = v6;
  id v9 = v7;
  id v10 = v6;
  [v8 client:self flashCellIfPossibleAtIndexPath:v9 completionHandler:v11];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (_UIKeyShortcutHUDMenuViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIKeyShortcutHUDMenuViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_UIKeyShortcutHUDCollectionViewManager)collectionViewManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionViewManager);
  return (_UIKeyShortcutHUDCollectionViewManager *)WeakRetained;
}

- (void)setCollectionViewManager:(id)a3
{
}

- (_UIKeyShortcutHUDMenu)menu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menu);
  return (_UIKeyShortcutHUDMenu *)WeakRetained;
}

- (UIKeyShortcutHUDMetrics)metrics
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
  return (UIKeyShortcutHUDMetrics *)WeakRetained;
}

- (void)setMetrics:(id)a3
{
}

- (BOOL)isSearching
{
  return self->_searching;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return self->_cellRegistration;
}

- (void)setCellRegistration:(id)a3
{
}

- (UICollectionViewSupplementaryRegistration)cellSeparatorRegistration
{
  return self->_cellSeparatorRegistration;
}

- (void)setCellSeparatorRegistration:(id)a3
{
}

- (UICollectionViewSupplementaryRegistration)sectionHeaderRegistration
{
  return self->_sectionHeaderRegistration;
}

- (void)setSectionHeaderRegistration:(id)a3
{
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (BOOL)isTransitioningSearch
{
  return self->_transitioningSearch;
}

- (void)setTransitioningSearch:(BOOL)a3
{
  self->_transitioningSearch = a3;
}

- (unint64_t)currentScrolledToCategoryIndex
{
  return self->_currentScrolledToCategoryIndex;
}

- (void)setCurrentScrolledToCategoryIndex:(unint64_t)a3
{
  self->_currentScrolledToCategoryIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_sectionHeaderRegistration, 0);
  objc_storeStrong((id *)&self->_cellSeparatorRegistration, 0);
  objc_storeStrong((id *)&self->_cellRegistration, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_destroyWeak((id *)&self->_metrics);
  objc_destroyWeak((id *)&self->_menu);
  objc_destroyWeak((id *)&self->_collectionViewManager);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end