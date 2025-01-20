@interface _UIKeyShortcutHUDToolbarViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldHideScrollingSeparatorView;
- (BOOL)isPreparingSearchTransition;
- (BOOL)isSearching;
- (BOOL)selectionFollowsFocusForItemAtIndexPath:(id)a3;
- (BOOL)shouldPersistSelectionForCellAtIndexPath:(id)a3;
- (UICollectionView)collectionView;
- (UICollectionViewCellRegistration)categoryCellRegistration;
- (UICollectionViewDiffableDataSource)dataSource;
- (UICollectionViewSupplementaryRegistration)cellSeparatorRegistration;
- (UIKeyShortcutHUDMetrics)metrics;
- (UIPageControl)categoriesPageControl;
- (UIView)categoriesContentView;
- (UIView)toolbarContentView;
- (UIVisualEffectView)visualEffectView;
- (_UIKeyShortcutHUDCell)cellForSearchTransition;
- (_UIKeyShortcutHUDCollectionViewManager)collectionViewManager;
- (_UIKeyShortcutHUDIndexPath)firstCategoryIndexPath;
- (_UIKeyShortcutHUDMenu)menu;
- (_UIKeyShortcutHUDSearchBar)searchBar;
- (_UIKeyShortcutHUDSearchButton)searchButton;
- (_UIKeyShortcutHUDSeparatorView)scrollingSeparatorView;
- (_UIKeyShortcutHUDToolbarViewControllerDelegate)delegate;
- (id)_collectionViewLayout;
- (id)indexPathsForCellsUsingSeparatorAtIndexPath:(id)a3;
- (id)indexPathsForSeparatorsUsedByCellAtIndexPath:(id)a3;
- (void)_configureCollectionView;
- (void)_configureSeparatorViewAppearance:(id)a3;
- (void)_setupSubviews;
- (void)categoriesPageControlCurrentPageChanged:(id)a3;
- (void)didCompleteSearchTransition;
- (void)flashCategoryAtIndex:(unint64_t)a3 completionHandler:(id)a4;
- (void)hudWillBecomeHidden:(BOOL)a3;
- (void)performActionForSelectingCellAtIndexPath:(id)a3;
- (void)prepareForSearchTransition:(BOOL)a3;
- (void)searchBar:(id)a3 didUpdateSearchText:(id)a4;
- (void)searchBarDidPressCancelButton:(id)a3;
- (void)searchButtonDidPress:(id)a3;
- (void)selectCategory:(id)a3 withCategoryIndex:(int64_t)a4;
- (void)setCategoriesContentView:(id)a3;
- (void)setCategoriesPageControl:(id)a3;
- (void)setCategoryCellRegistration:(id)a3;
- (void)setCellForSearchTransition:(id)a3;
- (void)setCellSeparatorRegistration:(id)a3;
- (void)setCollectionViewManager:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMenu:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setPreparingSearchTransition:(BOOL)a3;
- (void)setScrollingSeparatorView:(id)a3;
- (void)setSearchBar:(id)a3;
- (void)setSearchButton:(id)a3;
- (void)setSearching:(BOOL)a3;
- (void)setToolbarContentView:(id)a3;
- (void)setVisualEffectView:(id)a3;
- (void)updateScrollingSeparatorViewVisibility;
- (void)viewDidLoad;
@end

@implementation _UIKeyShortcutHUDToolbarViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyShortcutHUDToolbarViewController;
  [(UIViewController *)&v3 viewDidLoad];
  [(_UIKeyShortcutHUDToolbarViewController *)self _setupSubviews];
  [(_UIKeyShortcutHUDToolbarViewController *)self _configureCollectionView];
}

- (void)_setupSubviews
{
  v165[4] = *MEMORY[0x1E4F143B8];
  p_metrics = &self->_metrics;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
  [WeakRetained toolbarPlatterCornerRadius];
  double v6 = v5;
  v7 = [(UIViewController *)self view];
  v8 = [v7 layer];
  [v8 setCornerRadius:v6];

  uint64_t v9 = *MEMORY[0x1E4F39EA8];
  v10 = [(UIViewController *)self view];
  v11 = [v10 layer];
  [v11 setCornerCurve:v9];

  id v12 = objc_loadWeakRetained((id *)p_metrics);
  uint64_t v13 = [v12 toolbarPanelCornerMask];
  v14 = [(UIViewController *)self view];
  v15 = [v14 layer];
  [v15 setMaskedCorners:v13];

  v16 = [(UIViewController *)self view];
  v17 = [v16 layer];
  [v17 setMasksToBounds:1];

  id v18 = objc_loadWeakRetained((id *)p_metrics);
  [v18 toolbarPanelStrokeWidth];
  double v20 = v19;
  v21 = [(UIViewController *)self view];
  v22 = [v21 layer];
  [v22 setBorderWidth:v20];

  v23 = (id *)p_metrics;
  id v24 = objc_loadWeakRetained((id *)p_metrics);
  v25 = [v24 platterStrokeColor];
  v26 = [(UIViewController *)self traitCollection];
  id v27 = [v25 resolvedColorWithTraitCollection:v26];
  uint64_t v28 = [v27 CGColor];
  v29 = [(UIViewController *)self view];
  v30 = [v29 layer];
  [v30 setBorderColor:v28];

  location = v23;
  id v31 = objc_loadWeakRetained(v23);
  [v31 platterZPosition];
  double v33 = v32;
  v34 = [(UIViewController *)self view];
  v35 = [v34 layer];
  [v35 setZPosition:v33];

  v36 = [UIVisualEffectView alloc];
  id v37 = objc_loadWeakRetained(v23);
  v38 = [v37 platterVisualEffect];
  v39 = [(UIVisualEffectView *)v36 initWithEffect:v38];
  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = v39;

  v41 = [(UIViewController *)self view];
  [v41 bounds];
  -[UIView setFrame:](self->_visualEffectView, "setFrame:");

  [(UIView *)self->_visualEffectView setAutoresizingMask:18];
  v42 = [(UIViewController *)self view];
  [v42 addSubview:self->_visualEffectView];

  v43 = (UIView *)objc_opt_new();
  toolbarContentView = self->_toolbarContentView;
  self->_toolbarContentView = v43;

  [(UIView *)self->_toolbarContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  v45 = [(UIVisualEffectView *)self->_visualEffectView contentView];
  [v45 addSubview:self->_toolbarContentView];

  v130 = (void *)MEMORY[0x1E4F5B268];
  v149 = [(UIView *)self->_toolbarContentView topAnchor];
  v153 = [(UIVisualEffectView *)self->_visualEffectView contentView];
  v145 = [v153 topAnchor];
  v142 = [v149 constraintEqualToAnchor:v145];
  v165[0] = v142;
  v136 = [(UIView *)self->_toolbarContentView leadingAnchor];
  v139 = [(UIVisualEffectView *)self->_visualEffectView contentView];
  v133 = [v139 leadingAnchor];
  v127 = [v136 constraintEqualToAnchor:v133];
  v165[1] = v127;
  v121 = [(UIView *)self->_toolbarContentView trailingAnchor];
  v124 = [(UIVisualEffectView *)self->_visualEffectView contentView];
  v46 = [v124 trailingAnchor];
  v47 = [v121 constraintEqualToAnchor:v46];
  v165[2] = v47;
  v48 = [(UIView *)self->_toolbarContentView bottomAnchor];
  v49 = [(UIVisualEffectView *)self->_visualEffectView contentView];
  v50 = [v49 safeAreaLayoutGuide];
  v51 = [v50 bottomAnchor];
  v52 = [v48 constraintEqualToAnchor:v51];
  v165[3] = v52;
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v165 count:4];
  [v130 activateConstraints:v53];

  v54 = (_UIKeyShortcutHUDSearchButton *)objc_opt_new();
  searchButton = self->_searchButton;
  self->_searchButton = v54;

  [(_UIKeyShortcutHUDSearchButton *)self->_searchButton setDelegate:self];
  [(_UIKeyShortcutHUDSearchButton *)self->_searchButton setToolbarVC:self];
  [(UIView *)self->_searchButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_toolbarContentView addSubview:self->_searchButton];
  v56 = [_UIKeyShortcutHUDSearchBar alloc];
  [(UIView *)self->_toolbarContentView bounds];
  v57 = -[_UIKeyShortcutHUDSearchBar initWithFrame:](v56, "initWithFrame:");
  searchBar = self->_searchBar;
  self->_searchBar = v57;

  [(UIView *)self->_searchBar setUserInteractionEnabled:0];
  [(_UIKeyShortcutHUDSearchBar *)self->_searchBar setDelegate:self];
  [(_UIKeyShortcutHUDSearchBar *)self->_searchBar setSearchButton:self->_searchButton];
  [(UIView *)self->_searchBar setAutoresizingMask:18];
  [(UIView *)self->_toolbarContentView addSubview:self->_searchBar];
  v59 = (UIView *)objc_opt_new();
  categoriesContentView = self->_categoriesContentView;
  self->_categoriesContentView = v59;

  [(UIView *)self->_categoriesContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_toolbarContentView addSubview:self->_categoriesContentView];
  v125 = (void *)MEMORY[0x1E4F5B268];
  v154 = [(UIView *)self->_searchButton leadingAnchor];
  v150 = [(UIView *)self->_toolbarContentView leadingAnchor];
  v146 = [v154 constraintEqualToAnchor:v150];
  v164[0] = v146;
  v143 = [(UIView *)self->_searchButton topAnchor];
  v140 = [(UIView *)self->_toolbarContentView topAnchor];
  v137 = [v143 constraintEqualToAnchor:v140];
  v164[1] = v137;
  v134 = [(UIView *)self->_searchButton bottomAnchor];
  v131 = [(UIView *)self->_toolbarContentView bottomAnchor];
  v128 = [v134 constraintEqualToAnchor:v131];
  v164[2] = v128;
  v119 = [(UIView *)self->_searchButton widthAnchor];
  id v122 = objc_loadWeakRetained(location);
  [v122 searchButtonWidth];
  v118 = objc_msgSend(v119, "constraintEqualToConstant:");
  v164[3] = v118;
  v117 = [(UIView *)self->_categoriesContentView leadingAnchor];
  v116 = [(UIView *)self->_searchButton trailingAnchor];
  v115 = [v117 constraintEqualToAnchor:v116];
  v164[4] = v115;
  v114 = [(UIView *)self->_categoriesContentView topAnchor];
  v113 = [(UIView *)self->_toolbarContentView topAnchor];
  v61 = [v114 constraintEqualToAnchor:v113];
  v164[5] = v61;
  v62 = [(UIView *)self->_categoriesContentView bottomAnchor];
  v63 = [(UIView *)self->_toolbarContentView bottomAnchor];
  v64 = [v62 constraintEqualToAnchor:v63];
  v164[6] = v64;
  v65 = [(UIView *)self->_categoriesContentView trailingAnchor];
  v66 = [(UIView *)self->_toolbarContentView trailingAnchor];
  v67 = [v65 constraintEqualToAnchor:v66];
  v164[7] = v67;
  v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v164 count:8];
  [v125 activateConstraints:v68];

  v69 = [UICollectionView alloc];
  [(UIView *)self->_categoriesContentView bounds];
  double v71 = v70;
  double v73 = v72;
  double v75 = v74;
  double v77 = v76;
  v78 = [(_UIKeyShortcutHUDToolbarViewController *)self _collectionViewLayout];
  v79 = -[UICollectionView initWithFrame:collectionViewLayout:](v69, "initWithFrame:collectionViewLayout:", v78, v71, v73, v75, v77);
  collectionView = self->_collectionView;
  self->_collectionView = v79;

  id v81 = objc_loadWeakRetained(location);
  -[UIView setHidden:](self->_collectionView, "setHidden:", [v81 toolbarStylesCategoriesAsPageControl]);

  [(UIView *)self->_collectionView setAutoresizingMask:18];
  [(UIView *)self->_categoriesContentView addSubview:self->_collectionView];
  v82 = (UIPageControl *)objc_opt_new();
  categoriesPageControl = self->_categoriesPageControl;
  self->_categoriesPageControl = v82;

  [(UIControl *)self->_categoriesPageControl addTarget:self action:sel_categoriesPageControlCurrentPageChanged_ forControlEvents:4096];
  v84 = +[UIKeyShortcutHUDMetrics currentMetrics];
  v85 = [v84 standardHUDTextColor];
  [(UIPageControl *)self->_categoriesPageControl setCurrentPageIndicatorTintColor:v85];

  v86 = +[UIColor tertiaryLabelColor];
  [(UIPageControl *)self->_categoriesPageControl setPageIndicatorTintColor:v86];

  v87 = +[UIBlurEffect effectWithStyle:6];
  [(UIPageControl *)self->_categoriesPageControl _setPlatterEffect:v87];

  [(UIPageControl *)self->_categoriesPageControl setHidesForSinglePage:1];
  id v88 = objc_loadWeakRetained(location);
  -[UIView setHidden:](self->_categoriesPageControl, "setHidden:", [v88 toolbarStylesCategoriesAsPageControl] ^ 1);

  [(UIView *)self->_categoriesPageControl setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_categoriesContentView addSubview:self->_categoriesPageControl];
  v89 = (_UIKeyShortcutHUDSeparatorView *)objc_opt_new();
  scrollingSeparatorView = self->_scrollingSeparatorView;
  self->_scrollingSeparatorView = v89;

  [(_UIKeyShortcutHUDToolbarViewController *)self _configureSeparatorViewAppearance:self->_scrollingSeparatorView];
  [(_UIKeyShortcutHUDSeparatorView *)self->_scrollingSeparatorView setSeparatorHidden:1];
  [(UIView *)self->_scrollingSeparatorView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_categoriesContentView addSubview:self->_scrollingSeparatorView];
  v132 = (void *)MEMORY[0x1E4F5B268];
  v155 = [(UIView *)self->_categoriesPageControl centerXAnchor];
  v151 = [(UIView *)self->_toolbarContentView centerXAnchor];
  v147 = [v155 constraintEqualToAnchor:v151];
  v163[0] = v147;
  v144 = [(UIView *)self->_categoriesPageControl centerYAnchor];
  v157 = [(UIView *)self->_toolbarContentView centerYAnchor];
  v141 = [v144 constraintEqualToAnchor:v157];
  v163[1] = v141;
  v138 = [(UIView *)self->_scrollingSeparatorView leadingAnchor];
  v135 = [(UIView *)self->_categoriesContentView leadingAnchor];
  v129 = [v138 constraintEqualToAnchor:v135];
  v163[2] = v129;
  v126 = [(UIView *)self->_scrollingSeparatorView topAnchor];
  v120 = [(UIView *)self->_categoriesContentView topAnchor];
  id v123 = objc_loadWeakRetained(location);
  [v123 toolbarContentInset];
  v91 = objc_msgSend(v126, "constraintEqualToAnchor:constant:", v120);
  v163[3] = v91;
  v92 = [(UIView *)self->_scrollingSeparatorView bottomAnchor];
  v93 = [(UIView *)self->_categoriesContentView bottomAnchor];
  id v94 = objc_loadWeakRetained(location);
  [v94 toolbarContentInset];
  v96 = [v92 constraintEqualToAnchor:v93 constant:-v95];
  v163[4] = v96;
  v97 = [(UIView *)self->_scrollingSeparatorView widthAnchor];
  id v98 = objc_loadWeakRetained(location);
  [v98 separatorWidth];
  v99 = objc_msgSend(v97, "constraintEqualToConstant:");
  v163[5] = v99;
  v100 = [MEMORY[0x1E4F1C978] arrayWithObjects:v163 count:6];
  [v132 activateConstraints:v100];

  id v101 = objc_loadWeakRetained(location);
  LODWORD(v98) = [v101 toolbarStylesCategoriesAsPageControl];

  if (v98)
  {
    v102 = objc_opt_new();
    v162 = self->_searchButton;
    v103 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v162 count:1];
    [v102 setPreferredFocusEnvironments:v103];

    [(UIView *)self->_categoriesContentView addLayoutGuide:v102];
    v148 = (void *)MEMORY[0x1E4F5B268];
    locationa = [v102 leadingAnchor];
    v158 = [(UIView *)self->_categoriesContentView leadingAnchor];
    v156 = [locationa constraintEqualToAnchor:v158];
    v161[0] = v156;
    v152 = [v102 topAnchor];
    v104 = [(UIView *)self->_categoriesContentView topAnchor];
    v105 = [v152 constraintEqualToAnchor:v104];
    v161[1] = v105;
    v106 = [v102 trailingAnchor];
    v107 = [(UIView *)self->_categoriesContentView trailingAnchor];
    v108 = [v106 constraintEqualToAnchor:v107];
    v161[2] = v108;
    v109 = [v102 bottomAnchor];
    v110 = [(UIView *)self->_categoriesContentView bottomAnchor];
    v111 = [v109 constraintEqualToAnchor:v110];
    v161[3] = v111;
    v112 = [MEMORY[0x1E4F1C978] arrayWithObjects:v161 count:4];
    [v148 activateConstraints:v112];
  }
}

- (void)_configureCollectionView
{
  objc_initWeak(&location, self);
  objc_super v3 = self;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __66___UIKeyShortcutHUDToolbarViewController__configureCollectionView__block_invoke;
  v25[3] = &unk_1E5311960;
  objc_copyWeak(&v26, &location);
  v4 = +[UICollectionViewCellRegistration registrationWithCellClass:v3 configurationHandler:v25];

  double v5 = self;
  double v6 = +[_UIKeyShortcutHUDUtilities separatorElementKind]();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __66___UIKeyShortcutHUDToolbarViewController__configureCollectionView__block_invoke_3;
  v23[3] = &unk_1E52EEF40;
  objc_copyWeak(&v24, &location);
  v7 = +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:v5 elementKind:v6 configurationHandler:v23];

  v8 = [UICollectionViewDiffableDataSource alloc];
  collectionView = self->_collectionView;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __66___UIKeyShortcutHUDToolbarViewController__configureCollectionView__block_invoke_4;
  v21[3] = &unk_1E52EEF90;
  id v10 = v4;
  id v22 = v10;
  v11 = [(UICollectionViewDiffableDataSource *)v8 initWithCollectionView:collectionView cellProvider:v21];
  dataSource = self->_dataSource;
  self->_dataSource = v11;

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66___UIKeyShortcutHUDToolbarViewController__configureCollectionView__block_invoke_5;
  v19[3] = &unk_1E5311988;
  id v13 = v7;
  id v20 = v13;
  [(UICollectionViewDiffableDataSource *)self->_dataSource setSupplementaryViewProvider:v19];
  objc_storeStrong((id *)&self->_categoryCellRegistration, v4);
  objc_storeStrong((id *)&self->_cellSeparatorRegistration, v7);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
  LODWORD(v7) = [WeakRetained toolbarStylesCategoriesAsPageControl];

  if (v7)
  {
    v15 = objc_loadWeakRetained((id *)&self->_menu);
    v16 = [v15 children];
    -[UIPageControl setNumberOfPages:](self->_categoriesPageControl, "setNumberOfPages:", [v16 count]);
  }
  else
  {
    v15 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
    [v15 appendSectionsWithIdentifiers:&unk_1ED3F19F0];
    id v17 = objc_loadWeakRetained((id *)&self->_menu);
    id v18 = [v17 children];
    [v15 appendItemsWithIdentifiers:v18];

    [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v15 animatingDifferences:0];
  }

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

- (id)_collectionViewLayout
{
  objc_super v3 = objc_opt_new();
  [v3 setScrollDirection:1];
  objc_initWeak(&location, self);
  v4 = [UICollectionViewCompositionalLayout alloc];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63___UIKeyShortcutHUDToolbarViewController__collectionViewLayout__block_invoke;
  v7[3] = &unk_1E5300C98;
  objc_copyWeak(&v8, &location);
  double v5 = [(UICollectionViewCompositionalLayout *)v4 initWithSectionProvider:v7 configuration:v3];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

- (void)performActionForSelectingCellAtIndexPath:(id)a3
{
  id v9 = a3;
  if (![(_UIKeyShortcutHUDToolbarViewController *)self isSearching]
    && ![(_UIKeyShortcutHUDToolbarViewController *)self isPreparingSearchTransition])
  {
    v4 = [(_UIKeyShortcutHUDToolbarViewController *)self collectionViewManager];
    [v4 client:self setCategoryVisibleForCellAtIndexPath:v9];

    double v5 = [(_UIKeyShortcutHUDToolbarViewController *)self menu];
    double v6 = [v5 children];
    v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v9, "item"));

    id v8 = [(_UIKeyShortcutHUDToolbarViewController *)self delegate];
    objc_msgSend(v8, "toolbarViewController:didSelectCategory:categoryIndex:animated:", self, v7, objc_msgSend(v9, "item"), 1);
  }
}

- (BOOL)selectionFollowsFocusForItemAtIndexPath:(id)a3
{
  return 1;
}

- (BOOL)shouldPersistSelectionForCellAtIndexPath:(id)a3
{
  return 1;
}

- (id)indexPathsForCellsUsingSeparatorAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [MEMORY[0x1E4F1CA80] set];
  if (v4)
  {
    double v6 = [v4 client];

    if (v6 == self)
    {
      v7 = [v4 indexPath];
      uint64_t v8 = [v7 item];

      if (v8 >= 1)
      {
        [v5 addObject:v4];
        id v9 = (void *)MEMORY[0x1E4F28D58];
        id v10 = [v4 indexPath];
        uint64_t v11 = [v10 item] - 1;
        id v12 = [v4 indexPath];
        id v13 = objc_msgSend(v9, "indexPathForItem:inSection:", v11, objc_msgSend(v12, "section"));
        v14 = +[_UIKeyShortcutHUDIndexPath hudIndexPathWithClient:self indexPath:v13];

        [v5 addObject:v14];
      }
    }
  }

  return v5;
}

- (id)indexPathsForSeparatorsUsedByCellAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [MEMORY[0x1E4F1CA80] set];
  if (v4)
  {
    double v6 = [v4 client];

    if (v6 == self)
    {
      v7 = [v4 indexPath];
      uint64_t v8 = [v7 item];

      if (v8 >= 1) {
        [v5 addObject:v4];
      }
      id v9 = [v4 indexPath];
      unint64_t v10 = [v9 item];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_menu);
      id v12 = [WeakRetained children];
      unint64_t v13 = [v12 count] - 1;

      if (v10 < v13)
      {
        v14 = (void *)MEMORY[0x1E4F28D58];
        v15 = [v4 indexPath];
        uint64_t v16 = [v15 item] + 1;
        id v17 = [v4 indexPath];
        id v18 = objc_msgSend(v14, "indexPathForItem:inSection:", v16, objc_msgSend(v17, "section"));
        double v19 = +[_UIKeyShortcutHUDIndexPath hudIndexPathWithClient:self indexPath:v18];

        [v5 addObject:v19];
      }
    }
  }

  return v5;
}

- (_UIKeyShortcutHUDIndexPath)firstCategoryIndexPath
{
  objc_super v3 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  id v4 = +[_UIKeyShortcutHUDIndexPath hudIndexPathWithClient:self indexPath:v3];

  return (_UIKeyShortcutHUDIndexPath *)v4;
}

- (void)_configureSeparatorViewAppearance:(id)a3
{
  p_metrics = &self->_metrics;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_metrics);
  [WeakRetained toolbarSeparatorVerticalMargin];
  double v7 = v6;

  objc_msgSend(v4, "setDirectionalLayoutMargins:", v7, 0.0, v7, 0.0);
  id v8 = objc_loadWeakRetained((id *)p_metrics);
  id v9 = [v8 toolbarSeparatorColor];
  [v4 setSeparatorColor:v9];

  id v11 = objc_loadWeakRetained((id *)p_metrics);
  unint64_t v10 = [v11 toolbarSeparatorVisualEffect];
  [v4 setVisualEffect:v10];
}

- (void)updateScrollingSeparatorViewVisibility
{
  BOOL v3 = [(_UIKeyShortcutHUDToolbarViewController *)self _shouldHideScrollingSeparatorView];
  scrollingSeparatorView = self->_scrollingSeparatorView;
  [(_UIKeyShortcutHUDSeparatorView *)scrollingSeparatorView setSeparatorHidden:v3];
}

- (BOOL)_shouldHideScrollingSeparatorView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
  char v4 = [WeakRetained toolbarStylesCategoriesAsPageControl];

  if (v4) {
    return 1;
  }
  double v6 = [(_UIKeyShortcutHUDSearchButton *)self->_searchButton collectionView];
  double v7 = [(_UIKeyShortcutHUDSearchButton *)self->_searchButton searchButtonIndexPath];
  id v8 = [v7 indexPath];
  id v9 = [v6 cellForItemAtIndexPath:v8];

  if ([v9 isBackgroundVisible])
  {
    char v5 = 1;
  }
  else
  {
    collectionView = self->_collectionView;
    id v11 = [(_UIKeyShortcutHUDToolbarViewController *)self firstCategoryIndexPath];
    id v12 = [v11 indexPath];
    unint64_t v13 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v12];

    if ([v13 isBackgroundVisible]
      && ([(UIScrollView *)self->_collectionView contentOffset], v14 < 0.0))
    {
      char v5 = 1;
      id v9 = v13;
    }
    else
    {
      [(UIScrollView *)self->_collectionView contentOffset];
      double v16 = v15;
      [(UIView *)self->_collectionView bounds];
      id v17 = -[UICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:", v16, CGRectGetMidY(v19));
      id v9 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:v17];

      char v5 = [v9 isBackgroundVisible];
    }
  }

  return v5;
}

- (void)prepareForSearchTransition:(BOOL)a3
{
  BOOL v3 = a3;
  [(_UIKeyShortcutHUDToolbarViewController *)self setPreparingSearchTransition:1];
  [(_UIKeyShortcutHUDSearchButton *)self->_searchButton prepareForSearchTransition:v3];
  if (!v3)
  {
    [(UIView *)self->_categoriesContentView setUserInteractionEnabled:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionViewManager);
    [WeakRetained deselectCurrentlySelectedCell];

    double v6 = [(_UIKeyShortcutHUDToolbarViewController *)self searchBar];
    [v6 resignFirstResponder];

    [(_UIKeyShortcutHUDSearchBar *)self->_searchBar setText:0];
    [(UIView *)self->_searchBar setUserInteractionEnabled:0];
    [(UIView *)self->_searchButton setUserInteractionEnabled:1];
    [(UIViewController *)self updateFocusIfNeeded];
    double v7 = [(_UIKeyShortcutHUDSearchBar *)self->_searchBar searchTextField];
    if (__UIAccessibilityBroadcastCallback) {
      __UIAccessibilityBroadcastCallback(1001, v7);
    }
  }
  id v8 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
  if ([v8 count])
  {
    UIUserInterfaceLayoutDirection v9 = [(UIView *)self->_collectionView effectiveUserInterfaceLayoutDirection];

    if (v9 == UIUserInterfaceLayoutDirectionLeftToRight)
    {
      collectionView = self->_collectionView;
      id v11 = [(UICollectionView *)collectionView indexPathsForSelectedItems];
      id v12 = [v11 firstObject];
      unint64_t v13 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v12];
      objc_storeWeak((id *)&self->_cellForSearchTransition, v13);

      goto LABEL_11;
    }
  }
  else
  {
  }
  double v14 = [(_UIKeyShortcutHUDSearchButton *)self->_searchButton collectionView];
  double v15 = [v14 indexPathsForSelectedItems];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    id v17 = [(_UIKeyShortcutHUDSearchButton *)self->_searchButton collectionView];
    id v18 = [(_UIKeyShortcutHUDSearchButton *)self->_searchButton collectionView];
    CGRect v19 = [v18 indexPathsForSelectedItems];
    id v20 = [v19 firstObject];
    v21 = [v17 cellForItemAtIndexPath:v20];
    objc_storeWeak((id *)&self->_cellForSearchTransition, v21);
  }
LABEL_11:
  id v22 = objc_loadWeakRetained((id *)&self->_cellForSearchTransition);
  [v22 setDrawsBackground:1];

  id v23 = objc_loadWeakRetained((id *)&self->_cellForSearchTransition);
  [v23 layoutIfNeeded];

  searchBar = self->_searchBar;
  id v25 = objc_loadWeakRetained((id *)&self->_cellForSearchTransition);
  [(_UIKeyShortcutHUDSearchBar *)searchBar prepareForSearchTransition:v3 usingCell:v25];

  if (v3)
  {
    [(UIView *)self->_searchBar setUserInteractionEnabled:1];
    [(_UIKeyShortcutHUDSearchBar *)self->_searchBar becomeFirstResponder];
    [(UIView *)self->_categoriesContentView setUserInteractionEnabled:0];
    [(UIView *)self->_searchButton setUserInteractionEnabled:0];
    if (self->_searching) {
      [(_UIKeyShortcutHUDSearchBar *)self->_searchBar selectAll:0];
    }
    if (__UIAccessibilityBroadcastCallback) {
      __UIAccessibilityBroadcastCallback(1001, self->_searchButton);
    }
  }
  [(_UIKeyShortcutHUDToolbarViewController *)self setPreparingSearchTransition:0];
}

- (void)setSearching:(BOOL)a3
{
  BOOL v3 = a3;
  -[_UIKeyShortcutHUDSearchButton setSearching:](self->_searchButton, "setSearching:");
  [(_UIKeyShortcutHUDSearchBar *)self->_searchBar setSearching:v3];
  if (self->_searching != v3)
  {
    self->_searching = v3;
    categoriesContentView = self->_categoriesContentView;
    if (v3)
    {
      [(UIView *)categoriesContentView setAlpha:0.0];
    }
    else
    {
      [(UIView *)categoriesContentView setAlpha:1.0];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_cellForSearchTransition);
      double v7 = [WeakRetained superview];
      collectionView = self->_collectionView;

      if (v7 == collectionView)
      {
        UIUserInterfaceLayoutDirection v9 = self->_collectionView;
        id v10 = objc_loadWeakRetained((id *)&self->_cellForSearchTransition);
        id v11 = [(UICollectionView *)v9 indexPathForCell:v10];

        [(_UIKeyShortcutHUDToolbarViewController *)self performActionForSelectingCellAtIndexPath:v11];
      }
      id v13 = [(_UIKeyShortcutHUDToolbarViewController *)self collectionView];
      id v12 = [v13 collectionViewLayout];
      [v12 invalidateLayout];
    }
  }
}

- (void)didCompleteSearchTransition
{
  [(_UIKeyShortcutHUDSearchButton *)self->_searchButton didCompleteSearchTransition];
  [(_UIKeyShortcutHUDSearchBar *)self->_searchBar didCompleteSearchTransition];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cellForSearchTransition);
  [WeakRetained setDrawsBackground:0];

  objc_storeWeak((id *)&self->_cellForSearchTransition, 0);
  if ([(_UIKeyShortcutHUDToolbarViewController *)self isSearching])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69___UIKeyShortcutHUDToolbarViewController_didCompleteSearchTransition__block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)searchBarDidPressCancelButton:(id)a3
{
  id v4 = [(_UIKeyShortcutHUDToolbarViewController *)self delegate];
  [v4 toolbarViewControllerDidPressCancelSearchButton:self];
}

- (void)searchBar:(id)a3 didUpdateSearchText:(id)a4
{
  id v5 = a4;
  id v6 = [(_UIKeyShortcutHUDToolbarViewController *)self delegate];
  [v6 toolbarViewController:self didUpdateSearchText:v5];
}

- (void)searchButtonDidPress:(id)a3
{
  id v4 = [(_UIKeyShortcutHUDToolbarViewController *)self delegate];
  [v4 toolbarViewControllerDidPressSearchButton:self];
}

- (void)hudWillBecomeHidden:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(_UIKeyShortcutHUDToolbarViewController *)self visualEffectView];
    BOOL v3 = [v4 contentView];
    [v3 _setSafeAreaInsetsFrozen:1];
  }
}

- (void)selectCategory:(id)a3 withCategoryIndex:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
  int v7 = [WeakRetained toolbarStylesCategoriesAsPageControl];

  if (v7)
  {
    if ([(UIPageControl *)self->_categoriesPageControl interactionState] == UIPageControlInteractionStateNone)
    {
      categoriesPageControl = self->_categoriesPageControl;
      [(UIPageControl *)categoriesPageControl setCurrentPage:a4];
    }
  }
  else
  {
    id v23 = [MEMORY[0x1E4F28D58] indexPathForItem:a4 inSection:0];
    id v8 = [(_UIKeyShortcutHUDToolbarViewController *)self collectionViewManager];
    [v8 client:self setCategoryVisibleForCellAtIndexPath:v23];

    UIUserInterfaceLayoutDirection v9 = [(UICollectionView *)self->_collectionView layoutAttributesForItemAtIndexPath:v23];
    [v9 frame];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;

    v25.origin.x = v11;
    v25.origin.y = v13;
    v25.size.width = v15;
    v25.size.height = v17;
    CGFloat v18 = CGRectGetWidth(v25) * -0.5;
    v26.origin.x = v11;
    v26.origin.y = v13;
    v26.size.width = v15;
    v26.size.height = v17;
    CGRect v27 = CGRectInset(v26, v18, 0.0);
    -[UIScrollView scrollRectToVisible:animated:](self->_collectionView, "scrollRectToVisible:animated:", 1, v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);
    CGRect v19 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
    uint64_t v20 = [v19 count];

    if (v20)
    {
      v21 = [(_UIKeyShortcutHUDToolbarViewController *)self collectionViewManager];
      [v21 client:self selectCellAtIndexPath:v23];
    }
  }
}

- (void)categoriesPageControlCurrentPageChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIKeyShortcutHUDToolbarViewController *)self menu];
  id v6 = [v5 children];
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "currentPage"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v7 = [v4 interactionState] == 1;
  id v8 = [(_UIKeyShortcutHUDToolbarViewController *)self delegate];
  uint64_t v9 = [v4 currentPage];

  [v8 toolbarViewController:self didSelectCategory:v10 categoryIndex:v9 animated:v7];
}

- (void)flashCategoryAtIndex:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  BOOL v7 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:0];
  id v8 = [(_UIKeyShortcutHUDToolbarViewController *)self collectionViewManager];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81___UIKeyShortcutHUDToolbarViewController_flashCategoryAtIndex_completionHandler___block_invoke;
  v10[3] = &unk_1E52D9FE8;
  id v11 = v6;
  id v9 = v6;
  [v8 client:self flashCellIfPossibleAtIndexPath:v7 completionHandler:v10];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (_UIKeyShortcutHUDToolbarViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIKeyShortcutHUDToolbarViewControllerDelegate *)WeakRetained;
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

- (void)setMenu:(id)a3
{
}

- (UIKeyShortcutHUDMetrics)metrics
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metrics);
  return (UIKeyShortcutHUDMetrics *)WeakRetained;
}

- (void)setMetrics:(id)a3
{
}

- (_UIKeyShortcutHUDSearchButton)searchButton
{
  return self->_searchButton;
}

- (void)setSearchButton:(id)a3
{
}

- (_UIKeyShortcutHUDSearchBar)searchBar
{
  return self->_searchBar;
}

- (void)setSearchBar:(id)a3
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

- (UIView)toolbarContentView
{
  return self->_toolbarContentView;
}

- (void)setToolbarContentView:(id)a3
{
}

- (UIView)categoriesContentView
{
  return self->_categoriesContentView;
}

- (void)setCategoriesContentView:(id)a3
{
}

- (_UIKeyShortcutHUDSeparatorView)scrollingSeparatorView
{
  return self->_scrollingSeparatorView;
}

- (void)setScrollingSeparatorView:(id)a3
{
}

- (UIPageControl)categoriesPageControl
{
  return self->_categoriesPageControl;
}

- (void)setCategoriesPageControl:(id)a3
{
}

- (UICollectionViewCellRegistration)categoryCellRegistration
{
  return self->_categoryCellRegistration;
}

- (void)setCategoryCellRegistration:(id)a3
{
}

- (UICollectionViewSupplementaryRegistration)cellSeparatorRegistration
{
  return self->_cellSeparatorRegistration;
}

- (void)setCellSeparatorRegistration:(id)a3
{
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (BOOL)isPreparingSearchTransition
{
  return self->_preparingSearchTransition;
}

- (void)setPreparingSearchTransition:(BOOL)a3
{
  self->_preparingSearchTransition = a3;
}

- (_UIKeyShortcutHUDCell)cellForSearchTransition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cellForSearchTransition);
  return (_UIKeyShortcutHUDCell *)WeakRetained;
}

- (void)setCellForSearchTransition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cellForSearchTransition);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_cellSeparatorRegistration, 0);
  objc_storeStrong((id *)&self->_categoryCellRegistration, 0);
  objc_storeStrong((id *)&self->_categoriesPageControl, 0);
  objc_storeStrong((id *)&self->_scrollingSeparatorView, 0);
  objc_storeStrong((id *)&self->_categoriesContentView, 0);
  objc_storeStrong((id *)&self->_toolbarContentView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_searchButton, 0);
  objc_destroyWeak((id *)&self->_metrics);
  objc_destroyWeak((id *)&self->_menu);
  objc_destroyWeak((id *)&self->_collectionViewManager);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end