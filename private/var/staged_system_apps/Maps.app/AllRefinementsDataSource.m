@interface AllRefinementsDataSource
- (AllRefinementsDataSource)initWithCollectionView:(id)a3 viewModel:(id)a4 scrollViewDelegate:(id)a5 selectionSequenceNumber:(id)a6 analyticsDelegate:(id)a7 viewModelDelegate:(id)a8;
- (AllRefinementsMultiSelectCellLogicController)multiSelectLogicController;
- (AllRefinementsSizeController)sizeController;
- (AllRefinementsTogglesCellLogicController)togglesLogicController;
- (AllRefinementsViewModel)viewModel;
- (AllRefinementsViewModelDelegate)viewModelDelegate;
- (NSNumber)selectionSequenceNumber;
- (ResultRefinementsAnalytics)analyticsDelegate;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)collectionViewDiffableDataSource;
- (UIScrollViewDelegate)scrollViewDelegate;
- (double)getMaxWidth;
- (id)layoutSectionForSectionIndex:(int64_t)a3 layoutEnvironment:(id)a4;
- (void)displayRefinements;
- (void)reloadCollectionView:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewDiffableDataSource:(id)a3;
- (void)setMultiSelectLogicController:(id)a3;
- (void)setScrollViewDelegate:(id)a3;
- (void)setSelectionSequenceNumber:(id)a3;
- (void)setSizeController:(id)a3;
- (void)setTogglesLogicController:(id)a3;
- (void)setViewModel:(id)a3;
- (void)setViewModelDelegate:(id)a3;
- (void)setupDataSource;
@end

@implementation AllRefinementsDataSource

- (AllRefinementsDataSource)initWithCollectionView:(id)a3 viewModel:(id)a4 scrollViewDelegate:(id)a5 selectionSequenceNumber:(id)a6 analyticsDelegate:(id)a7 viewModelDelegate:(id)a8
{
  id v29 = a3;
  id v28 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v30.receiver = self;
  v30.super_class = (Class)AllRefinementsDataSource;
  v19 = [(AllRefinementsDataSource *)&v30 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_collectionView, a3);
    -[UICollectionView setDelegate:](v20->_collectionView, "setDelegate:", v20, v28, v29);
    objc_storeStrong((id *)&v20->_viewModel, a4);
    v21 = objc_alloc_init(AllRefinementsSizeController);
    sizeController = v20->_sizeController;
    v20->_sizeController = v21;

    objc_storeStrong((id *)&v20->_scrollViewDelegate, a5);
    objc_storeStrong((id *)&v20->_selectionSequenceNumber, a6);
    v23 = objc_alloc_init(AllRefinementsTogglesCellLogicController);
    togglesLogicController = v20->_togglesLogicController;
    v20->_togglesLogicController = v23;

    v25 = objc_alloc_init(AllRefinementsMultiSelectCellLogicController);
    multiSelectLogicController = v20->_multiSelectLogicController;
    v20->_multiSelectLogicController = v25;

    objc_storeWeak((id *)&v20->_analyticsDelegate, v17);
    objc_storeWeak((id *)&v20->_viewModelDelegate, v18);
    [(AllRefinementsDataSource *)v20 setupDataSource];
  }

  return v20;
}

- (void)setupDataSource
{
  v3 = [(AllRefinementsDataSource *)self collectionView];
  uint64_t v4 = objc_opt_class();
  v5 = +[NonSelectableCollectionViewListCell reuseIdentifier];
  [v3 registerClass:v4 forCellWithReuseIdentifier:v5];

  v6 = [(AllRefinementsDataSource *)self collectionView];
  uint64_t v7 = objc_opt_class();
  v8 = +[AllRefinementsMultiSelectElementCell reuseIdentifier];
  [v6 registerClass:v7 forCellWithReuseIdentifier:v8];

  if (MapsFeature_IsEnabled_SearchAndDiscovery())
  {
    v9 = [(AllRefinementsDataSource *)self collectionView];
    uint64_t v10 = objc_opt_class();
    v11 = +[AllRefinementsOpenAtCell reuseIdentifier];
    [v9 registerClass:v10 forCellWithReuseIdentifier:v11];
  }
  v12 = [(AllRefinementsDataSource *)self collectionView];
  uint64_t v13 = objc_opt_class();
  v14 = +[AllRefinementsHeaderView reuseIdentifier];
  [v12 registerClass:v13 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v14];

  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_100104500;
  v26[4] = sub_100104AF0;
  id v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_100104500;
  v24[4] = sub_100104AF0;
  id v25 = 0;
  objc_initWeak(&location, self);
  id v15 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  id v16 = [(AllRefinementsDataSource *)self collectionView];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100CD81EC;
  v21[3] = &unk_101321130;
  objc_copyWeak(&v22, &location);
  v21[4] = self;
  v21[5] = v24;
  v21[6] = v26;
  id v17 = (UICollectionViewDiffableDataSource *)[v15 initWithCollectionView:v16 cellProvider:v21];
  collectionViewDiffableDataSource = self->_collectionViewDiffableDataSource;
  self->_collectionViewDiffableDataSource = v17;

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100CD8FEC;
  v19[3] = &unk_1012F0D40;
  objc_copyWeak(&v20, &location);
  [(UICollectionViewDiffableDataSource *)self->_collectionViewDiffableDataSource setSupplementaryViewProvider:v19];
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v26, 8);
}

- (void)reloadCollectionView:(id)a3
{
  [(AllRefinementsDataSource *)self setViewModel:a3];

  [(AllRefinementsDataSource *)self displayRefinements];
}

- (void)displayRefinements
{
  id v3 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v25 = self;
  uint64_t v4 = [(AllRefinementsDataSource *)self viewModel];
  v5 = [v4 sections];

  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v11 = [v10 identifier];
        objc_super v30 = v11;
        v12 = +[NSArray arrayWithObjects:&v30 count:1];
        [v3 appendSectionsWithIdentifiers:v12];

        id v13 = [v10 type];
        if (v13 == (id)2)
        {
          id v16 = v10;
          id v17 = +[NSMutableArray array];
          id v18 = [v16 openNow];

          if (v18)
          {
            v19 = [v16 openNow];
            [v17 addObject:v19];
          }
          id v20 = [v16 openAt];

          if (v20)
          {
            v21 = [v16 openAt];
            [v17 addObject:v21];
          }
          id v22 = [v16 identifier];
          [v3 appendItemsWithIdentifiers:v17 intoSectionWithIdentifier:v22];
        }
        else
        {
          if (v13 == (id)1)
          {
            id v14 = v10;
            uint64_t v15 = [v14 elements];
          }
          else
          {
            if (v13) {
              continue;
            }
            id v14 = v10;
            uint64_t v15 = [v14 toggles];
          }
          id v16 = (id)v15;
          id v17 = [v14 identifier];

          [v3 appendItemsWithIdentifiers:v16 intoSectionWithIdentifier:v17];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  v23 = [(AllRefinementsDataSource *)v25 collectionViewDiffableDataSource];
  [v23 applySnapshot:v3 animatingDifferences:0];

  v24 = [(AllRefinementsDataSource *)v25 collectionView];
  [v24 layoutIfNeeded];
}

- (id)layoutSectionForSectionIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v6 = a4;
  id v7 = [(AllRefinementsDataSource *)self viewModel];
  uint64_t v8 = [v7 sections];
  v9 = [v8 objectAtIndex:a3];

  id v10 = [v9 type];
  if (v10 == (id)2)
  {
    id v45 = [objc_alloc((Class)_UICollectionViewListLayoutSectionConfiguration) initWithAppearanceStyle:0 layoutEnvironment:v6];
    [v45 setSeparatorStyle:1];
    [v45 setEstimatedRowHeight:44.0];
    objc_initWeak(&location, v9);
    v125[0] = _NSConcreteStackBlock;
    v125[1] = 3221225472;
    v125[2] = sub_100CD9FE0;
    v125[3] = &unk_1012F8570;
    objc_copyWeak(&v126, &location);
    [v45 setSeparatorInsetProvider:v125];
    id v7 = [objc_alloc((Class)_UICollectionViewListLayoutSection) initWithConfiguration:v45 layoutEnvironment:v6];
    v46 = [(AllRefinementsDataSource *)self sizeController];
    [v46 togglesSectionContentInsets];
    double v48 = v47;
    double v50 = v49;
    double v52 = v51;
    double v54 = v53;

    [v7 setContentInsets:v48, v50, v52, v54];
    v55 = +[AllRefinementsSectionBackground decorationViewKind];
    v56 = +[NSCollectionLayoutDecorationItem backgroundDecorationItemWithElementKind:v55];

    v57 = [(AllRefinementsDataSource *)self sizeController];
    v58 = [v9 displayName];
    v59 = [(AllRefinementsDataSource *)self collectionView];
    [v57 headerHeightWithTitle:v58 collectionView:v59];
    double v61 = v60;

    if (v61 > 0.0)
    {
      v62 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
      v63 = +[NSCollectionLayoutDimension estimatedDimension:v61];
      v64 = +[NSCollectionLayoutSize sizeWithWidthDimension:v62 heightDimension:v63];

      v65 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v64 elementKind:UICollectionElementKindSectionHeader alignment:2];
      v66 = [(AllRefinementsDataSource *)self sizeController];
      [v66 togglesHeaderLeadingAdjustment];
      [v65 setContentInsets:0.0, v67, 0.0, 0.0];

      v131 = v65;
      v68 = +[NSArray arrayWithObjects:&v131 count:1];
      [v7 setBoundarySupplementaryItems:v68];
    }
    v69 = [(AllRefinementsDataSource *)self sizeController];
    [v69 togglesBackgroundContentInsets];
    double v71 = v70;
    double v73 = v72;
    double v75 = v74;
    double v77 = v76;

    [v56 setContentInsets:v61 + v71, v73, v75, v77];
    v130 = v56;
    v78 = +[NSArray arrayWithObjects:&v130 count:1];
    [v7 setDecorationItems:v78];

    objc_destroyWeak(&v126);
    objc_destroyWeak(&location);
  }
  else if (v10 == (id)1)
  {
    v79 = +[NSCollectionLayoutDimension estimatedDimension:100.0];
    v80 = +[NSCollectionLayoutDimension estimatedDimension:32.0];
    v124 = +[NSCollectionLayoutSize sizeWithWidthDimension:v79 heightDimension:v80];

    v123 = +[NSCollectionLayoutItem itemWithLayoutSize:v124];
    v81 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
    v82 = +[NSCollectionLayoutDimension estimatedDimension:32.0];
    v122 = +[NSCollectionLayoutSize sizeWithWidthDimension:v81 heightDimension:v82];

    v134 = v123;
    v83 = +[NSArray arrayWithObjects:&v134 count:1];
    v84 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v122 subitems:v83];

    v85 = [(AllRefinementsDataSource *)self sizeController];
    [v85 multiSelectPaddingBetweenCells];
    v86 = +[NSCollectionLayoutSpacing fixedSpacing:](NSCollectionLayoutSpacing, "fixedSpacing:");
    [v84 setInterItemSpacing:v86];

    id v7 = +[NSCollectionLayoutSection sectionWithGroup:v84];
    v87 = [(AllRefinementsDataSource *)self sizeController];
    [v87 multiSelectPaddingBetweenCells];
    [v7 setInterGroupSpacing:];

    v88 = [(AllRefinementsDataSource *)self sizeController];
    [v88 multiSelectSectionContentInsets];
    double v90 = v89;
    double v92 = v91;
    double v94 = v93;
    double v96 = v95;

    [v7 setContentInsets:v90, v92, v94, v96];
    v97 = +[AllRefinementsSectionBackground decorationViewKind];
    v98 = +[NSCollectionLayoutDecorationItem backgroundDecorationItemWithElementKind:v97];

    v99 = [(AllRefinementsDataSource *)self sizeController];
    v100 = [v9 displayName];
    v101 = [(AllRefinementsDataSource *)self collectionView];
    [v99 headerHeightWithTitle:v100 collectionView:v101];
    double v103 = v102;

    if (v103 > 0.0)
    {
      v104 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
      v105 = +[NSCollectionLayoutDimension estimatedDimension:v103];
      v106 = +[NSCollectionLayoutSize sizeWithWidthDimension:v104 heightDimension:v105];

      v107 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v106 elementKind:UICollectionElementKindSectionHeader alignment:2];
      v108 = [(AllRefinementsDataSource *)self sizeController];
      [v108 multiSelectHeaderLeadingAdjustment];
      [v107 setContentInsets:0.0, v109, 0.0, 0.0];

      v133 = v107;
      v110 = +[NSArray arrayWithObjects:&v133 count:1];
      [v7 setBoundarySupplementaryItems:v110];
    }
    v111 = [(AllRefinementsDataSource *)self sizeController];
    [v111 multiSelectBackgroundContentInsets];
    double v113 = v112;
    double v115 = v114;
    double v117 = v116;
    double v119 = v118;

    [v98 setContentInsets:v103 + v113, v115, v117, v119];
    v132 = v98;
    v120 = +[NSArray arrayWithObjects:&v132 count:1];
    [v7 setDecorationItems:v120];
  }
  else if (!v10)
  {
    objc_initWeak(&location, v9);
    id v11 = [objc_alloc((Class)_UICollectionViewListLayoutSectionConfiguration) initWithAppearanceStyle:0 layoutEnvironment:v6];
    [v11 setSeparatorStyle:1];
    [v11 setEstimatedRowHeight:44.0];
    v127[0] = _NSConcreteStackBlock;
    v127[1] = 3221225472;
    v127[2] = sub_100CD9F44;
    v127[3] = &unk_1012F8570;
    objc_copyWeak(&v128, &location);
    [v11 setSeparatorInsetProvider:v127];
    id v7 = [objc_alloc((Class)_UICollectionViewListLayoutSection) initWithConfiguration:v11 layoutEnvironment:v6];
    v12 = [(AllRefinementsDataSource *)self sizeController];
    [v12 togglesSectionContentInsets];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;

    [v7 setContentInsets:v14, v16, v18, v20];
    v21 = +[AllRefinementsSectionBackground decorationViewKind];
    id v22 = +[NSCollectionLayoutDecorationItem backgroundDecorationItemWithElementKind:v21];

    v23 = [(AllRefinementsDataSource *)self sizeController];
    v24 = [v9 displayName];
    id v25 = [(AllRefinementsDataSource *)self collectionView];
    [v23 headerHeightWithTitle:v24 collectionView:v25];
    double v27 = v26;

    if (v27 > 0.0)
    {
      long long v28 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
      long long v29 = +[NSCollectionLayoutDimension estimatedDimension:v27];
      objc_super v30 = +[NSCollectionLayoutSize sizeWithWidthDimension:v28 heightDimension:v29];

      v31 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v30 elementKind:UICollectionElementKindSectionHeader alignment:2];
      v32 = [(AllRefinementsDataSource *)self sizeController];
      [v32 togglesHeaderLeadingAdjustment];
      [v31 setContentInsets:0.0, v33, 0.0, 0.0];

      v136 = v31;
      v34 = +[NSArray arrayWithObjects:&v136 count:1];
      [v7 setBoundarySupplementaryItems:v34];
    }
    v35 = [(AllRefinementsDataSource *)self sizeController];
    [v35 togglesBackgroundContentInsets];
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;

    [v22 setContentInsets:v27 + v37, v39, v41, v43];
    v135 = v22;
    v44 = +[NSArray arrayWithObjects:&v135 count:1];
    [v7 setDecorationItems:v44];

    objc_destroyWeak(&v128);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (double)getMaxWidth
{
  id v3 = [(AllRefinementsDataSource *)self sizeController];
  [v3 multiSelectSectionContentInsets];
  double v5 = v4;
  id v6 = [(AllRefinementsDataSource *)self sizeController];
  [v6 multiSelectSectionContentInsets];
  double v8 = v5 + v7;
  v9 = [(AllRefinementsDataSource *)self sizeController];
  [v9 multiSelectBackgroundContentInsets];
  double v11 = v8 + v10;
  v12 = [(AllRefinementsDataSource *)self sizeController];
  [v12 multiSelectBackgroundContentInsets];
  double v14 = v11 + v13;

  double v15 = [(AllRefinementsDataSource *)self collectionView];
  [v15 frame];
  double v16 = CGRectGetWidth(v18) - v14;

  return v16;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  id v5 = [(AllRefinementsDataSource *)self scrollViewDelegate];
  [v5 scrollViewWillBeginDragging:v4];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  id v10 = [(AllRefinementsDataSource *)self scrollViewDelegate];
  [v10 scrollViewWillEndDragging:v9 withVelocity:a5 targetContentOffset:x, y];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = [(AllRefinementsDataSource *)self scrollViewDelegate];
  [v5 scrollViewDidScroll:v4];
}

- (NSNumber)selectionSequenceNumber
{
  return self->_selectionSequenceNumber;
}

- (void)setSelectionSequenceNumber:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (AllRefinementsViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (UICollectionViewDiffableDataSource)collectionViewDiffableDataSource
{
  return self->_collectionViewDiffableDataSource;
}

- (void)setCollectionViewDiffableDataSource:(id)a3
{
}

- (AllRefinementsSizeController)sizeController
{
  return self->_sizeController;
}

- (void)setSizeController:(id)a3
{
}

- (UIScrollViewDelegate)scrollViewDelegate
{
  return self->_scrollViewDelegate;
}

- (void)setScrollViewDelegate:(id)a3
{
}

- (AllRefinementsTogglesCellLogicController)togglesLogicController
{
  return self->_togglesLogicController;
}

- (void)setTogglesLogicController:(id)a3
{
}

- (AllRefinementsMultiSelectCellLogicController)multiSelectLogicController
{
  return self->_multiSelectLogicController;
}

- (void)setMultiSelectLogicController:(id)a3
{
}

- (ResultRefinementsAnalytics)analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);

  return (ResultRefinementsAnalytics *)WeakRetained;
}

- (void)setAnalyticsDelegate:(id)a3
{
}

- (AllRefinementsViewModelDelegate)viewModelDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewModelDelegate);

  return (AllRefinementsViewModelDelegate *)WeakRetained;
}

- (void)setViewModelDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewModelDelegate);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_multiSelectLogicController, 0);
  objc_storeStrong((id *)&self->_togglesLogicController, 0);
  objc_storeStrong((id *)&self->_scrollViewDelegate, 0);
  objc_storeStrong((id *)&self->_sizeController, 0);
  objc_storeStrong((id *)&self->_collectionViewDiffableDataSource, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_storeStrong((id *)&self->_selectionSequenceNumber, 0);
}

@end