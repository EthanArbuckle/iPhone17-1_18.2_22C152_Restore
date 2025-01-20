@interface PKDynamicCollectionViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)deselectSelectedCellsOnViewWillAppear;
- (BOOL)retainCellSelectionCellOnReload;
- (BOOL)useItemIdentityWhenUpdating;
- (NSArray)sections;
- (PKDynamicCollectionViewController)init;
- (UICollectionView)collectionView;
- (id)_cellRegistrationForSection:(id)a3 itemIdentifier:(id)a4 item:(id)a5;
- (id)_indexPathForItem:(id)a3;
- (id)_indexPathForItemIdentifier:(id)a3;
- (id)_sectionAtIndex:(int64_t)a3;
- (id)_sectionAtIndexPath:(id)a3;
- (id)_sectionForIdentifier:(id)a3;
- (id)_sectionIdentifierForIndex:(int64_t)a3;
- (id)_supplementaryRegistrationForSection:(id)a3 sectionIdentifier:(id)a4 elementKind:(id)a5;
- (id)cellForItem:(id)a3;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)layout;
- (void)_deselectCellsForce:(BOOL)a3;
- (void)_reloadDataForSections:(id)a3 recreateSnapshot:(BOOL)a4 animated:(BOOL)a5;
- (void)_reloadSectionMapForSections:(id)a3 animated:(BOOL)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)deselectCells;
- (void)loadView;
- (void)reconfigureHeaderAndFooterForSectionIdentifier:(id)a3;
- (void)reloadDataAnimated:(BOOL)a3;
- (void)reloadDataForSection:(id)a3 animated:(BOOL)a4;
- (void)reloadDataForSectionIdentifier:(id)a3 animated:(BOOL)a4;
- (void)reloadDataWithoutRebuildingDataStores;
- (void)reloadItem:(id)a3 animated:(BOOL)a4;
- (void)scrollToItem:(id)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5;
- (void)setCollectionView:(id)a3;
- (void)setDeselectSelectedCellsOnViewWillAppear:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setRetainCellSelectionCellOnReload:(BOOL)a3;
- (void)setUseItemIdentityWhenUpdating:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDismissModalView;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKDynamicCollectionViewController

- (PKDynamicCollectionViewController)init
{
  v13.receiver = self;
  v13.super_class = (Class)PKDynamicCollectionViewController;
  v2 = [(PKDynamicCollectionViewController *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_deselectSelectedCellsOnViewWillAppear = 1;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cellRegistrations = v3->_cellRegistrations;
    v3->_cellRegistrations = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    supplementaryViewRegistrations = v3->_supplementaryViewRegistrations;
    v3->_supplementaryViewRegistrations = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    itemsPendingDeletion = v3->_itemsPendingDeletion;
    v3->_itemsPendingDeletion = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    itemsMap = v3->_itemsMap;
    v3->_itemsMap = v10;
  }
  return v3;
}

- (void)loadView
{
  v26.receiver = self;
  v26.super_class = (Class)PKDynamicCollectionViewController;
  [(PKDynamicCollectionViewController *)&v26 loadView];
  v3 = [(PKDynamicCollectionViewController *)self view];
  id v4 = objc_alloc(MEMORY[0x1E4FB1568]);
  [v3 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  objc_super v13 = [(PKDynamicCollectionViewController *)self layout];
  v14 = (UICollectionView *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v13, v6, v8, v10, v12);
  collectionView = self->_collectionView;
  self->_collectionView = v14;

  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setShowsVerticalScrollIndicator:0];
  [v3 addSubview:self->_collectionView];
  objc_initWeak(&location, self);
  id v16 = objc_alloc(MEMORY[0x1E4FB1598]);
  v17 = self->_collectionView;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __45__PKDynamicCollectionViewController_loadView__block_invoke;
  v23[3] = &unk_1E59CCAA0;
  objc_copyWeak(&v24, &location);
  v18 = (UICollectionViewDiffableDataSource *)[v16 initWithCollectionView:v17 cellProvider:v23];
  dataSource = self->_dataSource;
  self->_dataSource = v18;

  v20 = self->_dataSource;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __45__PKDynamicCollectionViewController_loadView__block_invoke_2;
  v21[3] = &unk_1E59CCAC8;
  objc_copyWeak(&v22, &location);
  [(UICollectionViewDiffableDataSource *)v20 setSupplementaryViewProvider:v21];
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

id __45__PKDynamicCollectionViewController_loadView__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v11 = WeakRetained;
  if (WeakRetained)
  {
    double v12 = [WeakRetained _sectionAtIndexPath:v8];
    if (v12)
    {
      objc_super v13 = [v11 _cellRegistrationForSection:v12 itemIdentifier:v9 item:0];
      v14 = [v7 dequeueConfiguredReusableCellWithRegistration:v13 forIndexPath:v8 item:v9];
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

id __45__PKDynamicCollectionViewController_loadView__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v11 = objc_msgSend(WeakRetained, "_sectionIdentifierForIndex:", objc_msgSend(v9, "section"));
    double v12 = [WeakRetained _sectionForIdentifier:v11];
    objc_super v13 = [WeakRetained _supplementaryRegistrationForSection:v12 sectionIdentifier:v11 elementKind:v8];
    v14 = [v7 dequeueConfiguredReusableSupplementaryViewWithRegistration:v13 forIndexPath:v9];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PKDynamicCollectionViewController;
  [(PKDynamicCollectionViewController *)&v3 viewDidLoad];
  [(PKDynamicCollectionViewController *)self reloadDataAnimated:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKDynamicCollectionViewController;
  [(PKDynamicCollectionViewController *)&v4 viewWillAppear:a3];
  self->_isViewControllerActive = 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKDynamicCollectionViewController;
  [(PKDynamicCollectionViewController *)&v4 viewDidAppear:a3];
  [(PKDynamicCollectionViewController *)self _deselectCellsForce:0];
  self->_viewDidAppear = 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKDynamicCollectionViewController;
  [(PKDynamicCollectionViewController *)&v4 viewWillDisappear:a3];
  self->_isViewControllerActive = 0;
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKDynamicCollectionViewController;
  [(PKDynamicCollectionViewController *)&v4 viewWillLayoutSubviews];
  objc_super v3 = [(PKDynamicCollectionViewController *)self view];
  [v3 bounds];
  -[UICollectionView setFrame:](self->_collectionView, "setFrame:");
}

- (void)viewDidDismissModalView
{
}

- (void)_reloadSectionMapForSections:(id)a3 animated:(BOOL)a4
{
  BOOL v31 = a4;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obj = (NSArray *)v5;
  uint64_t v34 = [(NSArray *)obj countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v42;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v42 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = v7;
        id v8 = *(void **)(*((void *)&v41 + 1) + 8 * v7);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v9 = [v8 identifiers];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v49 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v38 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v37 + 1) + 8 * i);
              v15 = [v6 objectForKey:v14];

              if (v15)
              {
                id v16 = PKLogFacilityTypeGetObject();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  v17 = objc_opt_class();
                  *(_DWORD *)buf = 138412546;
                  v46 = v17;
                  __int16 v47 = 2112;
                  uint64_t v48 = v14;
                  id v18 = v17;
                  _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "PKDynamicCollectionViewController (%@) attempting to set sections with duplicate section ids. Discarding duplicate %@ section id.", buf, 0x16u);
                }
              }
              else
              {
                [v36 addObject:v14];
                [v6 setObject:v8 forKey:v14];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v37 objects:v49 count:16];
          }
          while (v11);
        }

        uint64_t v7 = v35 + 1;
      }
      while (v35 + 1 != v34);
      uint64_t v34 = [(NSArray *)obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v34);
  }

  v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v36];
  v20 = [MEMORY[0x1E4F1CA80] setWithArray:self->_sectionIdentifiers];
  [v20 minusSet:v19];
  if ([v20 count])
  {
    v21 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
    id v22 = [v20 allObjects];
    [v21 deleteSectionsWithIdentifiers:v22];

    BOOL v23 = v31 && self->_isViewControllerActive;
    [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v21 animatingDifferences:v23];
  }
  sections = self->_sections;
  self->_sections = obj;
  v25 = obj;

  objc_super v26 = (NSArray *)[v36 copy];
  sectionIdentifiers = self->_sectionIdentifiers;
  self->_sectionIdentifiers = v26;

  v28 = (NSDictionary *)[v6 copy];
  sectionMap = self->_sectionMap;
  self->_sectionMap = v28;

  [(PKDynamicCollectionViewController *)self _reloadDataForSections:self->_sectionIdentifiers recreateSnapshot:1 animated:v31];
  v30 = [(PKDynamicCollectionViewController *)self view];
  [v30 setNeedsLayout];
}

- (id)cellForItem:(id)a3
{
  objc_super v4 = [(PKDynamicCollectionViewController *)self _indexPathForItem:a3];
  if (v4)
  {
    id v5 = [(PKDynamicCollectionViewController *)self collectionView];
    id v6 = [v5 cellForItemAtIndexPath:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_indexPathForItem:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    BOOL useItemIdentityWhenUpdating = self->_useItemIdentityWhenUpdating;
    id v7 = v4;
    id v8 = v7;
    if (useItemIdentityWhenUpdating)
    {
      if ([v7 conformsToProtocol:&unk_1EF30C150])
      {
        id v9 = v8;
      }
      else
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"PKDynamicCollectionViewController: useItemIdentityWhenUpdating was set to true but item %@ does not conform to PKIdentifiable", v8 format];
        id v9 = 0;
      }

      id v8 = [v9 identifier];
    }
    uint64_t v10 = [(PKDynamicCollectionViewController *)self _indexPathForItemIdentifier:v8];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_indexPathForItemIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](self->_dataSource, "indexPathForItemIdentifier:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PKDynamicCollectionViewController;
  [(PKDynamicCollectionViewController *)&v6 setEditing:a3 animated:a4];
  [(UICollectionView *)self->_collectionView setEditing:v4];
}

- (void)reloadItem:(id)a3 animated:(BOOL)a4
{
  uint64_t v4 = a4;
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
  id v8 = v6;
  id v9 = v8;
  uint64_t v10 = v8;
  if (self->_useItemIdentityWhenUpdating)
  {
    id v11 = v8;
    if ([v11 conformsToProtocol:&unk_1EF30C150])
    {
      id v12 = v11;
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"PKDynamicCollectionViewController: useItemIdentityWhenUpdating was set to true but item %@ does not conform to PKIdentifiable", v11 format];
      id v12 = 0;
    }

    uint64_t v10 = [v12 identifier];

    if (v10) {
      [(NSMutableDictionary *)self->_itemsPendingDeletion removeObjectForKey:v10];
    }
  }
  objc_super v13 = [(UICollectionViewDiffableDataSource *)self->_dataSource indexPathForItemIdentifier:v10];
  if (v13)
  {
    if (self->_useItemIdentityWhenUpdating)
    {
      [(NSMutableDictionary *)self->_itemsMap setObject:v9 forKey:v10];
      uint64_t v14 = [(PKDynamicCollectionViewController *)self collectionView];
      v15 = [v14 cellForItemAtIndexPath:v13];

      uint64_t v16 = [(PKDynamicCollectionViewController *)self _sectionAtIndexPath:v13];
      v17 = (void *)v16;
      if (v15) {
        BOOL v18 = v16 == 0;
      }
      else {
        BOOL v18 = 1;
      }
      if (!v18)
      {
        unsigned int v23 = v4;
        v19 = [(PKDynamicCollectionViewController *)self _cellRegistrationForSection:v16 itemIdentifier:0 item:v9];
        uint64_t v20 = [v19 cellClass];
        if (v20 == objc_opt_class())
        {
          id v22 = [v19 configurationHandler];
          ((void (**)(void, void *, void *, void *))v22)[2](v22, v15, v13, v10);

          goto LABEL_17;
        }

        uint64_t v4 = v23;
      }
    }
    v24[0] = v10;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    [v7 reloadItemsWithIdentifiers:v21];

    [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v7 animatingDifferences:v4];
  }
LABEL_17:
}

- (void)deselectCells
{
}

- (void)scrollToItem:(id)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = [(PKDynamicCollectionViewController *)self _indexPathForItem:a3];
  if (v9)
  {
    id v8 = [(PKDynamicCollectionViewController *)self collectionView];
    [v8 scrollToItemAtIndexPath:v9 atScrollPosition:a4 animated:v5];
  }
}

- (void)setUseItemIdentityWhenUpdating:(BOOL)a3
{
  self->_BOOL useItemIdentityWhenUpdating = a3;
}

- (void)reloadDataWithoutRebuildingDataStores
{
  id v2 = [(PKDynamicCollectionViewController *)self collectionView];
  [v2 reloadData];
}

- (void)reconfigureHeaderAndFooterForSectionIdentifier:(id)a3
{
  id v12 = a3;
  uint64_t v4 = -[PKDynamicCollectionViewController _sectionForIdentifier:](self, "_sectionForIdentifier:");
  if (v4)
  {
    NSInteger v5 = [(UICollectionViewDiffableDataSource *)self->_dataSource indexForSectionIdentifier:v12];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v5];
      uint64_t v7 = *MEMORY[0x1E4FB2770];
      id v8 = [(UICollectionView *)self->_collectionView supplementaryViewForElementKind:*MEMORY[0x1E4FB2770] atIndexPath:v6];
      if (v8) {
        [v4 configureSupplementaryRegistration:v8 elementKind:v7 sectionIdentifier:v12];
      }
      collectionView = self->_collectionView;
      uint64_t v10 = *MEMORY[0x1E4FB2760];
      id v11 = [(UICollectionView *)collectionView supplementaryViewForElementKind:*MEMORY[0x1E4FB2760] atIndexPath:v6];
      if (v11) {
        [v4 configureSupplementaryRegistration:v11 elementKind:v10 sectionIdentifier:v12];
      }
    }
  }
}

- (void)reloadDataAnimated:(BOOL)a3
{
}

- (void)reloadDataForSectionIdentifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v8[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(UICollectionViewDiffableDataSource *)self->_dataSource indexForSectionIdentifier:v6] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [(PKDynamicCollectionViewController *)self sections];
    [(PKDynamicCollectionViewController *)self _reloadSectionMapForSections:v7 animated:v4];
  }
  else
  {
    v8[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [(PKDynamicCollectionViewController *)self _reloadDataForSections:v7 recreateSnapshot:0 animated:v4];
  }
}

- (void)reloadDataForSection:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [a3 identifiers];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __67__PKDynamicCollectionViewController_reloadDataForSection_animated___block_invoke;
  v8[3] = &unk_1E59CCAF0;
  v8[4] = self;
  if (objc_msgSend(v6, "pk_containsObjectPassingTest:", v8))
  {
    uint64_t v7 = [(PKDynamicCollectionViewController *)self sections];
    [(PKDynamicCollectionViewController *)self _reloadSectionMapForSections:v7 animated:v4];
  }
  else
  {
    [(PKDynamicCollectionViewController *)self _reloadDataForSections:v6 recreateSnapshot:0 animated:v4];
  }
}

BOOL __67__PKDynamicCollectionViewController_reloadDataForSection_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 976) indexForSectionIdentifier:a2] == 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_reloadDataForSections:(id)a3 recreateSnapshot:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v61 = a5;
  BOOL v5 = a4;
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!self->_sections) {
    goto LABEL_74;
  }
  if (!self->_dataSource) {
    goto LABEL_74;
  }
  v62 = v7;
  int v8 = [(PKDynamicCollectionViewController *)self isViewLoaded];
  id v7 = v62;
  if (!v8) {
    goto LABEL_74;
  }
  uint64_t v9 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
  BOOL v10 = !self->_retainCellSelectionCellOnReload || !v5;
  v63 = (void *)v9;
  if (v10)
  {
    if (!self->_retainCellSelectionCellOnReload)
    {
LABEL_12:
      v60 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    id v11 = (void *)v9;
    uint64_t v12 = [v62 count];
    objc_super v13 = [v11 sectionIdentifiers];
    uint64_t v14 = [v13 count];

    if (v12 != v14) {
      goto LABEL_12;
    }
  }
  v60 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
LABEL_13:
  if (v5)
  {
    id v75 = objc_alloc_init(MEMORY[0x1E4FB1360]);
    v15 = v62;
    [v75 appendSectionsWithIdentifiers:v62];
  }
  else
  {
    id v75 = v63;
    v15 = v62;
  }
  id v78 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v68 = [v63 sectionIdentifiers];
  id v79 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  obuint64_t j = v15;
  uint64_t v69 = [obj countByEnumeratingWithState:&v97 objects:v112 count:16];
  if (v69)
  {
    uint64_t v67 = *(void *)v98;
    uint64_t v77 = *MEMORY[0x1E4F1C3B8];
    uint64_t v65 = *MEMORY[0x1E4FB2770];
    uint64_t v66 = *MEMORY[0x1E4FB2760];
    do
    {
      for (uint64_t i = 0; i != v69; ++i)
      {
        if (*(void *)v98 != v67) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v97 + 1) + 8 * i);
        if ([v68 containsObject:v17])
        {
          BOOL v18 = [v63 itemIdentifiersInSectionWithIdentifier:v17];
        }
        else
        {
          BOOL v18 = 0;
        }
        if (self->_useItemIdentityWhenUpdating) {
          [v79 addObjectsFromArray:v18];
        }
        v19 = [(PKDynamicCollectionViewController *)self _sectionForIdentifier:v17];
        uint64_t v20 = [v75 itemIdentifiersInSectionWithIdentifier:v17];
        [v75 deleteItemsWithIdentifiers:v20];

        v21 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshotForSection:v17];
        id v22 = [v19 snapshotWithPreviousSnapshot:v21 forSectionIdentifier:v17];
        unsigned int v23 = [v22 items];

        if ([v23 count])
        {
          v71 = v21;
          v72 = v18;
          uint64_t v73 = i;
          uint64_t v74 = v17;
          v70 = v23;
          if (self->_useItemIdentityWhenUpdating)
          {
            id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            id v76 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            long long v93 = 0u;
            long long v94 = 0u;
            long long v95 = 0u;
            long long v96 = 0u;
            id v25 = v23;
            uint64_t v26 = [v25 countByEnumeratingWithState:&v93 objects:v104 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = *(void *)v94;
              do
              {
                for (uint64_t j = 0; j != v27; ++j)
                {
                  if (*(void *)v94 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  id v30 = *(id *)(*((void *)&v93 + 1) + 8 * j);
                  if ([v30 conformsToProtocol:&unk_1EF30C150])
                  {
                    id v31 = v30;
                  }
                  else
                  {
                    [MEMORY[0x1E4F1CA00] raise:v77, @"PKDynamicCollectionViewController: useItemIdentityWhenUpdating was set to true but item %@ does not conform to PKIdentifiable", v30, v60 format];
                    id v31 = 0;
                  }

                  v32 = [v31 identifier];

                  uint64_t v33 = [(NSMutableDictionary *)self->_itemsMap objectForKey:v32];
                  if (v33 && (PKEqualObjects() & 1) == 0) {
                    [v76 addObject:v32];
                  }
                  [(NSMutableDictionary *)self->_itemsPendingDeletion removeObjectForKey:v32];
                  [v79 removeObject:v32];
                  [v78 setObject:v30 forKey:v32];
                  [v24 addObject:v32];
                }
                uint64_t v27 = [v25 countByEnumeratingWithState:&v93 objects:v104 count:16];
              }
              while (v27);
            }

            [v75 appendItemsWithIdentifiers:v24 intoSectionWithIdentifier:v74];
            [v75 reloadItemsWithIdentifiers:v76];
          }
          else
          {
            [v75 appendItemsWithIdentifiers:v23 intoSectionWithIdentifier:v17];
          }
          long long v91 = 0u;
          long long v92 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          id v36 = v79;
          uint64_t v37 = [v36 countByEnumeratingWithState:&v89 objects:v103 count:16];
          if (v37)
          {
            uint64_t v38 = v37;
            uint64_t v39 = *(void *)v90;
            do
            {
              for (uint64_t k = 0; k != v38; ++k)
              {
                if (*(void *)v90 != v39) {
                  objc_enumerationMutation(v36);
                }
                uint64_t v41 = *(void *)(*((void *)&v89 + 1) + 8 * k);
                long long v42 = [(NSMutableDictionary *)self->_itemsPendingDeletion objectForKeyedSubscript:v41];
                uint64_t v43 = [v42 integerValue] + 1;

                long long v44 = [NSNumber numberWithInteger:v43];
                [(NSMutableDictionary *)self->_itemsPendingDeletion setObject:v44 forKeyedSubscript:v41];
              }
              uint64_t v38 = [v36 countByEnumeratingWithState:&v89 objects:v103 count:16];
            }
            while (v38);
          }

          long long v87 = 0u;
          long long v88 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          unsigned int v23 = v70;
          id v45 = v70;
          uint64_t v46 = [v45 countByEnumeratingWithState:&v85 objects:v102 count:16];
          BOOL v18 = v72;
          uint64_t i = v73;
          if (v46)
          {
            uint64_t v47 = v46;
            uint64_t v48 = *(void *)v86;
            do
            {
              for (uint64_t m = 0; m != v47; ++m)
              {
                if (*(void *)v86 != v48) {
                  objc_enumerationMutation(v45);
                }
                id v50 = [(PKDynamicCollectionViewController *)self _cellRegistrationForSection:v19 itemIdentifier:0 item:*(void *)(*((void *)&v85 + 1) + 8 * m)];
              }
              uint64_t v47 = [v45 countByEnumeratingWithState:&v85 objects:v102 count:16];
            }
            while (v47);
          }

          id v51 = [(PKDynamicCollectionViewController *)self _supplementaryRegistrationForSection:v19 sectionIdentifier:v74 elementKind:v66];
          id v52 = [(PKDynamicCollectionViewController *)self _supplementaryRegistrationForSection:v19 sectionIdentifier:v74 elementKind:v65];
          v21 = v71;
        }
        else
        {
          uint64_t v34 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v107 = self;
            __int16 v108 = 2112;
            uint64_t v109 = v17;
            __int16 v110 = 2112;
            v111 = v19;
            _os_log_impl(&dword_19F450000, v34, OS_LOG_TYPE_DEFAULT, "PKDynamicCollectionViewController (%@) attempting to render section %@-%@ with no items..", buf, 0x20u);
          }

          uint64_t v105 = v17;
          uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v105 count:1];
          [v75 deleteSectionsWithIdentifiers:v35];
        }
      }
      uint64_t v69 = [obj countByEnumeratingWithState:&v97 objects:v112 count:16];
    }
    while (v69);
  }

  [(NSMutableDictionary *)self->_itemsMap addEntriesFromDictionary:v78];
  dataSource = self->_dataSource;
  BOOL v54 = v61 && self->_isViewControllerActive;
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __86__PKDynamicCollectionViewController__reloadDataForSections_recreateSnapshot_animated___block_invoke;
  v84[3] = &unk_1E59CA7D0;
  v84[4] = self;
  [(UICollectionViewDiffableDataSource *)dataSource applySnapshot:v75 animatingDifferences:v54 completion:v84];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v55 = v60;
  uint64_t v56 = [v55 countByEnumeratingWithState:&v80 objects:v101 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v81;
    do
    {
      for (uint64_t n = 0; n != v57; ++n)
      {
        if (*(void *)v81 != v58) {
          objc_enumerationMutation(v55);
        }
        [(UICollectionView *)self->_collectionView selectItemAtIndexPath:*(void *)(*((void *)&v80 + 1) + 8 * n) animated:0 scrollPosition:0];
      }
      uint64_t v57 = [v55 countByEnumeratingWithState:&v80 objects:v101 count:16];
    }
    while (v57);
  }

  id v7 = v62;
LABEL_74:
}

void __86__PKDynamicCollectionViewController__reloadDataForSections_recreateSnapshot_animated___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 1036))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v3 = objc_msgSend(*(id *)(v1 + 1016), "allKeys", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 1016) objectForKeyedSubscript:v8];
          uint64_t v10 = [v9 integerValue];

          if (v10 == 1)
          {
            [*(id *)(*(void *)(a1 + 32) + 1016) removeObjectForKey:v8];
            [*(id *)(*(void *)(a1 + 32) + 1008) removeObjectForKey:v8];
          }
          else
          {
            id v11 = [NSNumber numberWithInteger:v10 - 1];
            [*(id *)(*(void *)(a1 + 32) + 1016) setObject:v11 forKeyedSubscript:v8];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
  }
}

- (id)layout
{
  objc_initWeak(&location, self);
  id v2 = objc_alloc(MEMORY[0x1E4FB1580]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__PKDynamicCollectionViewController_layout__block_invoke;
  v5[3] = &unk_1E59CCB18;
  objc_copyWeak(&v6, &location);
  uint64_t v3 = (void *)[v2 initWithSectionProvider:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

id __43__PKDynamicCollectionViewController_layout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v7 = [WeakRetained _sectionIdentifierForIndex:a2];
  uint64_t v8 = [WeakRetained _sectionForIdentifier:v7];
  uint64_t v9 = [v8 layoutWithLayoutEnvironment:v5 sectionIdentifier:v7];

  if (v9)
  {
    if (objc_msgSend(WeakRetained, "pkui_userInterfaceIdiomSupportsLargeLayouts")
      && ![v9 contentInsetsReference])
    {
      [v9 setContentInsetsReference:4];
    }
  }
  else
  {
    uint64_t v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      uint64_t v13 = WeakRetained[124];
      int v14 = 134218754;
      uint64_t v15 = a2;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      __int16 v18 = 2112;
      v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      _os_log_fault_impl(&dword_19F450000, v10, OS_LOG_TYPE_FAULT, "PKDynamicCollectionViewController: Failed to find layout. Something has gone horribly wrong. sectionIndex %li; s"
        "ectionIdentifier: %@; section: %@; sectionMap: %@.",
        (uint8_t *)&v14,
        0x2Au);
    }

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = WeakRetained[124];
      int v14 = 134218754;
      uint64_t v15 = a2;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      __int16 v18 = 2112;
      v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "PKDynamicCollectionViewController: Failed to find layout. Something has gone horribly wrong. sectionIndex %li; s"
        "ectionIdentifier: %@; section: %@; sectionMap: %@.",
        (uint8_t *)&v14,
        0x2Au);
    }
  }

  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v8 = a4;
  id v5 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:");
  if (self->_useItemIdentityWhenUpdating)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_itemsMap objectForKey:v5];

    id v5 = (void *)v6;
  }
  id v7 = [(PKDynamicCollectionViewController *)self _sectionAtIndexPath:v8];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v7 didSelectItem:v5];
  }
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v5];
  if (self->_useItemIdentityWhenUpdating)
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_itemsMap objectForKey:v6];

    uint64_t v6 = (void *)v7;
  }
  id v8 = [(PKDynamicCollectionViewController *)self _sectionAtIndexPath:v5];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v9 = [v8 shouldHighlightItem:v6];
  }
  else {
    char v9 = 1;
  }

  return v9;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v9 = a5;
  uint64_t v6 = -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:");
  if (self->_useItemIdentityWhenUpdating)
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_itemsMap objectForKey:v6];

    uint64_t v6 = (void *)v7;
  }
  id v8 = [(PKDynamicCollectionViewController *)self _sectionAtIndexPath:v9];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v8 willDisplayItem:v6];
  }
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  uint64_t v6 = objc_msgSend(a4, "firstObject", a3, a5.x, a5.y);
  if (v6)
  {
    uint64_t v7 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v6];
    if (self->_useItemIdentityWhenUpdating)
    {
      uint64_t v8 = [(NSMutableDictionary *)self->_itemsMap objectForKey:v7];

      uint64_t v7 = (void *)v8;
    }
    id v9 = [(PKDynamicCollectionViewController *)self _sectionAtIndexPath:v6];
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v10 = [v9 contextMenuConfigurationForItem:v7];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_sectionIdentifierForIndex:(int64_t)a3
{
  if (a3 < 0)
  {
    uint64_t v6 = 0;
  }
  else
  {
    if ([(NSArray *)self->_sectionIdentifiers count] <= a3)
    {
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v6 = [(UICollectionViewDiffableDataSource *)self->_dataSource sectionIdentifierForIndex:a3];
    }
  }
  return v6;
}

- (id)_sectionForIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = -[NSDictionary objectForKey:](self->_sectionMap, "objectForKey:");
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)_sectionAtIndex:(int64_t)a3
{
  uint64_t v4 = [(PKDynamicCollectionViewController *)self _sectionIdentifierForIndex:a3];
  id v5 = [(PKDynamicCollectionViewController *)self _sectionForIdentifier:v4];

  return v5;
}

- (id)_sectionAtIndexPath:(id)a3
{
  uint64_t v4 = [a3 section];

  return [(PKDynamicCollectionViewController *)self _sectionAtIndex:v4];
}

- (void)_deselectCellsForce:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = [(PKDynamicCollectionViewController *)self collectionView];
  uint64_t v6 = v5;
  if (self->_deselectSelectedCellsOnViewWillAppear || v3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v8 = objc_msgSend(v5, "indexPathsForSelectedItems", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [v6 deselectItemAtIndexPath:*(void *)(*((void *)&v13 + 1) + 8 * i) animated:1];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (id)_cellRegistrationForSection:(id)a3 itemIdentifier:(id)a4 item:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
    id v13 = v12;
  }
  else
  {
    uint64_t v14 = [(NSMutableDictionary *)self->_itemsMap objectForKey:v9];
    long long v15 = (void *)v14;
    if (v14) {
      long long v16 = (void *)v14;
    }
    else {
      long long v16 = v9;
    }
    id v13 = v16;
  }
  uint64_t v17 = __85__PKDynamicCollectionViewController__cellRegistrationForSection_itemIdentifier_item___block_invoke((uint64_t)v12, v8, v13);
  uint64_t v18 = (void *)[[NSString alloc] initWithFormat:@"%@-%@", objc_msgSend(v17, "cellClass"), objc_opt_class()];
  v19 = [(NSMutableDictionary *)self->_cellRegistrations objectForKey:v18];
  if (!v19)
  {
    objc_initWeak(&location, self);
    __int16 v20 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v21 = [v17 cellClass];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __85__PKDynamicCollectionViewController__cellRegistrationForSection_itemIdentifier_item___block_invoke_2;
    v23[3] = &unk_1E59CCB60;
    objc_copyWeak(&v25, &location);
    id v24 = &__block_literal_global_22;
    v19 = [v20 registrationWithCellClass:v21 configurationHandler:v23];
    [(NSMutableDictionary *)self->_cellRegistrations setObject:v19 forKey:v18];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v19;
}

id __85__PKDynamicCollectionViewController__cellRegistrationForSection_itemIdentifier_item___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v4 cellRegistrationForItem:v5];
LABEL_5:
    uint64_t v7 = (void *)v6;
    goto LABEL_7;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v4 cellRegistration];
    goto LABEL_5;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"PKDynamicSectionController (%@) didn't implement required cellRegistration method or property", objc_opt_class() format];
  uint64_t v7 = 0;
LABEL_7:

  return v7;
}

void __85__PKDynamicCollectionViewController__cellRegistrationForSection_itemIdentifier_item___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v16 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 1036))
    {
      id v11 = [WeakRetained[126] objectForKey:v8];
    }
    else
    {
      id v11 = v8;
    }
    id v12 = v11;
    id v13 = [v10 _sectionAtIndexPath:v7];
    uint64_t v14 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    long long v15 = [v14 configurationHandler];
    ((void (**)(void, id, id, void *))v15)[2](v15, v16, v7, v12);
  }
}

- (id)_supplementaryRegistrationForSection:(id)a3 sectionIdentifier:(id)a4 elementKind:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_opt_respondsToSelector()) {
    uint64_t v11 = [v8 supplementaryRegistrationClassForKind:v10 sectionIdentifier:v9];
  }
  else {
    uint64_t v11 = objc_opt_class();
  }
  uint64_t v12 = v11;
  id v13 = (void *)[[NSString alloc] initWithFormat:@"%@-%@", v11, v10];
  uint64_t v14 = [(NSMutableDictionary *)self->_supplementaryViewRegistrations objectForKey:v13];
  if (!v14)
  {
    objc_initWeak(&location, self);
    long long v15 = (void *)MEMORY[0x1E4FB15F8];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __104__PKDynamicCollectionViewController__supplementaryRegistrationForSection_sectionIdentifier_elementKind___block_invoke;
    v17[3] = &unk_1E59CCB88;
    objc_copyWeak(&v18, &location);
    uint64_t v14 = [v15 registrationWithSupplementaryClass:v12 elementKind:v10 configurationHandler:v17];
    [(NSMutableDictionary *)self->_supplementaryViewRegistrations setObject:v14 forKey:v13];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v14;
}

void __104__PKDynamicCollectionViewController__supplementaryRegistrationForSection_sectionIdentifier_elementKind___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v14 = a2;
  id v7 = a3;
  a1 += 4;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained(a1);
  uint64_t v10 = [v8 section];

  uint64_t v11 = [WeakRetained _sectionIdentifierForIndex:v10];

  id v12 = objc_loadWeakRetained(a1);
  id v13 = [v12 _sectionForIdentifier:v11];

  if (objc_opt_respondsToSelector()) {
    [v13 configureSupplementaryRegistration:v14 elementKind:v7 sectionIdentifier:v11];
  }
}

- (NSArray)sections
{
  return self->_sections;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (BOOL)deselectSelectedCellsOnViewWillAppear
{
  return self->_deselectSelectedCellsOnViewWillAppear;
}

- (void)setDeselectSelectedCellsOnViewWillAppear:(BOOL)a3
{
  self->_deselectSelectedCellsOnViewWillAppear = a3;
}

- (BOOL)retainCellSelectionCellOnReload
{
  return self->_retainCellSelectionCellOnReload;
}

- (void)setRetainCellSelectionCellOnReload:(BOOL)a3
{
  self->_retainCellSelectionCellOnReload = a3;
}

- (BOOL)useItemIdentityWhenUpdating
{
  return self->_useItemIdentityWhenUpdating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_cellRegistrations, 0);
  objc_storeStrong((id *)&self->_itemsPendingDeletion, 0);
  objc_storeStrong((id *)&self->_itemsMap, 0);
  objc_storeStrong((id *)&self->_supplementaryViewRegistrations, 0);
  objc_storeStrong((id *)&self->_sectionMap, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiers, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end