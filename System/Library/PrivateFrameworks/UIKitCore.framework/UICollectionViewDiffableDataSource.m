@interface UICollectionViewDiffableDataSource
- (BOOL)_isDiffableDataSource;
- (BOOL)_subclassOverridesMethodWithSelector:(SEL)a3;
- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4;
- (NSDiffableDataSourceSectionSnapshot)snapshotForSection:(id)section;
- (NSDiffableDataSourceSnapshot)snapshot;
- (NSIndexPath)indexPathForItemIdentifier:(id)identifier;
- (NSInteger)indexForSectionIdentifier:(id)identifier;
- (NSString)description;
- (UICollectionViewDiffableDataSource)initWithCollectionView:(UICollectionView *)collectionView cellProvider:(UICollectionViewDiffableDataSourceCellProvider)cellProvider;
- (UICollectionViewDiffableDataSource)initWithCollectionView:(id)a3 itemRenderer:(id)a4;
- (UICollectionViewDiffableDataSource)initWithCollectionView:(id)a3 itemRenderers:(id)a4 rendererIdentifierProvider:(id)a5;
- (UICollectionViewDiffableDataSource)initWithCollectionView:(id)a3 sectionControllers:(id)a4 rendererIdentifierProvider:(id)a5;
- (UICollectionViewDiffableDataSource)initWithViewUpdatesSink:(id)a3;
- (UICollectionViewDiffableDataSourceReorderingHandlers)reorderingHandlers;
- (UICollectionViewDiffableDataSourceSectionSnapshotHandlers)sectionSnapshotHandlers;
- (UICollectionViewDiffableDataSourceSupplementaryViewProvider)supplementaryViewProvider;
- (__UIDiffableDataSource)impl;
- (id)_associatedSectionControllerForItemIdentifier:(id)a3;
- (id)_associatedSectionControllerForSectionIdentifier:(id)a3;
- (id)_canReorderItemHandler;
- (id)_didReorderItemsHandler;
- (id)_diffableDataSourceImpl;
- (id)_expandCollapseAnimationContextForCollectionView:(id)a3;
- (id)_snapshotForSection:(id)a3;
- (id)collectionView;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)itemIdentifierForIndexPath:(NSIndexPath *)indexPath;
- (id)sectionIdentifierForIndex:(NSInteger)index;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_applySnapshot:(id)a3 toSection:(id)a4 animatingDifferences:(BOOL)a5 completion:(id)a6;
- (void)_performBatchApplyUsingReloadData:(id)a3;
- (void)_registerItemRenderers:(id)a3 rendererIdentifierProvider:(id)a4;
- (void)_setCanReorderItemHandler:(id)a3;
- (void)_setDidReorderItemsHandler:(id)a3;
- (void)applySnapshot:(NSDiffableDataSourceSectionSnapshot *)snapshot toSection:(id)sectionIdentifier animatingDifferences:(BOOL)animatingDifferences;
- (void)applySnapshot:(NSDiffableDataSourceSectionSnapshot *)snapshot toSection:(id)sectionIdentifier animatingDifferences:(BOOL)animatingDifferences completion:(void *)completion;
- (void)applySnapshot:(NSDiffableDataSourceSnapshot *)snapshot animatingDifferences:(BOOL)animatingDifferences;
- (void)applySnapshot:(NSDiffableDataSourceSnapshot *)snapshot animatingDifferences:(BOOL)animatingDifferences completion:(void *)completion;
- (void)applySnapshotUsingReloadData:(NSDiffableDataSourceSnapshot *)snapshot;
- (void)applySnapshotUsingReloadData:(NSDiffableDataSourceSnapshot *)snapshot completion:(void *)completion;
- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)setImpl:(id)a3;
- (void)setReorderingHandlers:(UICollectionViewDiffableDataSourceReorderingHandlers *)reorderingHandlers;
- (void)setSectionSnapshotHandlers:(UICollectionViewDiffableDataSourceSectionSnapshotHandlers *)sectionSnapshotHandlers;
- (void)setSupplementaryViewProvider:(UICollectionViewDiffableDataSourceSupplementaryViewProvider)supplementaryViewProvider;
- (void)validateIdentifiers;
@end

@implementation UICollectionViewDiffableDataSource

- (void)applySnapshot:(NSDiffableDataSourceSnapshot *)snapshot animatingDifferences:(BOOL)animatingDifferences
{
}

- (id)sectionIdentifierForIndex:(NSInteger)index
{
  return [(__UIDiffableDataSource *)self->_impl sectionIdentifierForIndex:index];
}

- (NSIndexPath)indexPathForItemIdentifier:(id)identifier
{
  return (NSIndexPath *)[(__UIDiffableDataSource *)self->_impl indexPathForItemIdentifier:identifier];
}

- (id)itemIdentifierForIndexPath:(NSIndexPath *)indexPath
{
  return [(__UIDiffableDataSource *)self->_impl itemIdentifierForIndexPath:indexPath];
}

- (NSDiffableDataSourceSnapshot)snapshot
{
  id v3 = objc_alloc((Class)off_1E52D2BB8);
  v4 = [(__UIDiffableDataSource *)self->_impl snapshot];
  v5 = (void *)[v3 initWithImpl:v4];

  return (NSDiffableDataSourceSnapshot *)v5;
}

- (id)_expandCollapseAnimationContextForCollectionView:(id)a3
{
  return [(__UIDiffableDataSource *)self->_impl expandCollapseAnimationContext];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if ([(__UIDiffableDataSource *)self->_impl numberOfSections] <= a4)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"UIDiffableDataSource.m", 141, @"Invalid parameter not satisfying: %@", @"section < _impl.numberOfSections" object file lineNumber description];
  }
  impl = self->_impl;
  v8 = [(__UIDiffableDataSource *)impl state];
  v9 = [v8 sections];
  v10 = [v9 objectAtIndexedSubscript:a4];
  int64_t v11 = [(__UIDiffableDataSource *)impl numberOfItemsInSection:v10];

  return v11;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return [(__UIDiffableDataSource *)self->_impl numberOfSections];
}

- (UICollectionViewDiffableDataSourceReorderingHandlers)reorderingHandlers
{
  return [(__UIDiffableDataSource *)self->_impl reorderingHandlers];
}

- (BOOL)_subclassOverridesMethodWithSelector:(SEL)a3
{
  v4 = (objc_class *)objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  IMP MethodImplementation = class_getMethodImplementation(v4, a3);
  IMP v7 = class_getMethodImplementation(v5, a3);
  if (MethodImplementation) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  return !v8 && MethodImplementation != v7;
}

- (void)setSupplementaryViewProvider:(UICollectionViewDiffableDataSourceSupplementaryViewProvider)supplementaryViewProvider
{
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"UIDiffableDataSource.m", 151, @"Invalid parameter not satisfying: %@", @"indexPath" object file lineNumber description];
  }
  v12 = [(__UIDiffableDataSource *)self->_impl supplementaryViewProvider];

  if (!v12)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"UIDiffableDataSource.m", 152, @"CollectionView %@ requested a supplementary view, but a supplementaryViewProvider was not specified on the diffable data source. Please configure the diffable data source accordingly and add the supplementary provider", v9 object file lineNumber description];
  }
  v13 = [(__UIDiffableDataSource *)self->_impl supplementaryViewProvider];
  v14 = ((void (**)(void, id, id, id))v13)[2](v13, v9, v10, v11);

  return v14;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"UIDiffableDataSource.m", 146, @"Invalid parameter not satisfying: %@", @"indexPath" object file lineNumber description];
  }
  id v9 = [(__UIDiffableDataSource *)self->_impl _cellForItemAtIndexPath:v8 collectionView:v7];

  return v9;
}

- (UICollectionViewDiffableDataSource)initWithCollectionView:(UICollectionView *)collectionView cellProvider:(UICollectionViewDiffableDataSourceCellProvider)cellProvider
{
  v6 = collectionView;
  UICollectionViewDiffableDataSourceCellProvider v7 = cellProvider;
  v12.receiver = self;
  v12.super_class = (Class)UICollectionViewDiffableDataSource;
  id v8 = [(UICollectionViewDiffableDataSource *)&v12 init];
  if (v8)
  {
    id v9 = [[__UIDiffableDataSource alloc] initWithCollectionView:v6 cellProvider:v7];
    impl = v8->_impl;
    v8->_impl = v9;

    [(UICollectionView *)v6 setDataSource:v8];
  }

  return v8;
}

- (void)applySnapshot:(NSDiffableDataSourceSnapshot *)snapshot animatingDifferences:(BOOL)animatingDifferences completion:(void *)completion
{
  BOOL v5 = animatingDifferences;
  impl = self->_impl;
  id v8 = completion;
  id v9 = [(NSDiffableDataSourceSnapshot *)snapshot impl];
  [(__UIDiffableDataSource *)impl applyDifferencesFromSnapshot:v9 animatingDifferences:v5 completion:v8];
}

void __65__UICollectionViewDiffableDataSource__setDidReorderItemsHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && [v6 isReorderingTransaction])
  {
    v4 = [WeakRetained _didReorderItemsHandler];
    BOOL v5 = [v6 reorderedItemIdentifiers];
    ((void (**)(void, id, void *))v4)[2](v4, v6, v5);
  }
}

- (void)applySnapshot:(NSDiffableDataSourceSectionSnapshot *)snapshot toSection:(id)sectionIdentifier animatingDifferences:(BOOL)animatingDifferences completion:(void *)completion
{
}

- (id)_diffableDataSourceImpl
{
  return self->_impl;
}

- (void)_performBatchApplyUsingReloadData:(id)a3
{
}

- (void)setSectionSnapshotHandlers:(UICollectionViewDiffableDataSourceSectionSnapshotHandlers *)sectionSnapshotHandlers
{
}

- (void)applySnapshot:(NSDiffableDataSourceSectionSnapshot *)snapshot toSection:(id)sectionIdentifier animatingDifferences:(BOOL)animatingDifferences
{
}

- (NSString)description
{
  return [(__UIDiffableDataSource *)self->_impl description];
}

- (void)applySnapshotUsingReloadData:(NSDiffableDataSourceSnapshot *)snapshot completion:(void *)completion
{
  impl = self->_impl;
  id v6 = completion;
  id v7 = [(NSDiffableDataSourceSnapshot *)snapshot impl];
  [(__UIDiffableDataSource *)impl reloadFromSnapshot:v7 completion:v6];
}

- (void)_setCanReorderItemHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
  objc_storeStrong(&self->_didReorderItemsHandler, 0);
}

- (void)_setDidReorderItemsHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = _Block_copy(v4);
  id didReorderItemsHandler = self->_didReorderItemsHandler;
  self->_id didReorderItemsHandler = v5;

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__UICollectionViewDiffableDataSource__setDidReorderItemsHandler___block_invoke;
  v7[3] = &unk_1E52E1A20;
  objc_copyWeak(&v8, &location);
  [(__UIDiffableDataSource *)self->_impl setDidApplySnapshotHandler:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (UICollectionViewDiffableDataSourceSupplementaryViewProvider)supplementaryViewProvider
{
  return [(__UIDiffableDataSource *)self->_impl supplementaryViewProvider];
}

- (void)applySnapshotUsingReloadData:(NSDiffableDataSourceSnapshot *)snapshot
{
}

- (NSDiffableDataSourceSectionSnapshot)snapshotForSection:(id)section
{
  return (NSDiffableDataSourceSectionSnapshot *)[(__UIDiffableDataSource *)self->_impl snapshotForSection:section];
}

- (void)setReorderingHandlers:(UICollectionViewDiffableDataSourceReorderingHandlers *)reorderingHandlers
{
}

- (UICollectionViewDiffableDataSourceSectionSnapshotHandlers)sectionSnapshotHandlers
{
  return [(__UIDiffableDataSource *)self->_impl sectionSnapshotHandlers];
}

- (NSInteger)indexForSectionIdentifier:(id)identifier
{
  return [(__UIDiffableDataSource *)self->_impl indexForSectionIdentifier:identifier];
}

- (UICollectionViewDiffableDataSource)initWithViewUpdatesSink:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UICollectionViewDiffableDataSource;
  BOOL v5 = [(UICollectionViewDiffableDataSource *)&v9 init];
  if (v5)
  {
    id v6 = [[__UIDiffableDataSource alloc] initWithViewUpdatesSink:v4];
    impl = v5->_impl;
    v5->_impl = v6;
  }
  return v5;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  return [(__UIDiffableDataSource *)self->_impl canMoveItemAtIndexPath:a4];
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
}

- (void)_registerItemRenderers:(id)a3 rendererIdentifierProvider:(id)a4
{
}

- (id)collectionView
{
  return [(__UIDiffableDataSource *)self->_impl _collectionView];
}

- (id)_associatedSectionControllerForItemIdentifier:(id)a3
{
  return [(__UIDiffableDataSource *)self->_impl associatedSectionControllerForItemIdentifier:a3];
}

- (id)_associatedSectionControllerForSectionIdentifier:(id)a3
{
  return [(__UIDiffableDataSource *)self->_impl associatedSectionControllerForSectionIdentifier:a3];
}

- (void)_applySnapshot:(id)a3 toSection:(id)a4 animatingDifferences:(BOOL)a5 completion:(id)a6
{
}

- (id)_snapshotForSection:(id)a3
{
  return [(__UIDiffableDataSource *)self->_impl _snapshotForSection:a3];
}

- (BOOL)_isDiffableDataSource
{
  return 1;
}

- (UICollectionViewDiffableDataSource)initWithCollectionView:(id)a3 itemRenderers:(id)a4 rendererIdentifierProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)UICollectionViewDiffableDataSource;
  id v11 = [(UICollectionViewDiffableDataSource *)&v15 init];
  if (v11)
  {
    objc_super v12 = [[__UIDiffableDataSource alloc] initWithCollectionView:v8 itemRenderers:v9 rendererIdentifierProvider:v10];
    impl = v11->_impl;
    v11->_impl = v12;

    [v8 setDataSource:v11];
  }

  return v11;
}

- (UICollectionViewDiffableDataSource)initWithCollectionView:(id)a3 sectionControllers:(id)a4 rendererIdentifierProvider:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)UICollectionViewDiffableDataSource;
  id v11 = [(UICollectionViewDiffableDataSource *)&v24 init];
  if (v11)
  {
    objc_super v12 = [[__UIDiffableDataSource alloc] initWithCollectionView:v8 sectionControllers:v9 rendererIdentifierProvider:v10];
    impl = v11->_impl;
    v11->_impl = v12;

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v18++), "setDataSource:", v11->_impl, (void)v20);
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v16);
    }

    [v8 setDataSource:v11];
  }

  return v11;
}

- (UICollectionViewDiffableDataSource)initWithCollectionView:(id)a3 itemRenderer:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v12 count:1];

  id v10 = -[UICollectionViewDiffableDataSource initWithCollectionView:itemRenderers:rendererIdentifierProvider:](self, "initWithCollectionView:itemRenderers:rendererIdentifierProvider:", v8, v9, &__block_literal_global_103, v12, v13);
  return v10;
}

__CFString *__74__UICollectionViewDiffableDataSource_initWithCollectionView_itemRenderer___block_invoke()
{
  return @"default";
}

- (id)_canReorderItemHandler
{
  return [(__UIDiffableDataSource *)self->_impl canReorderItemHandler];
}

- (id)_didReorderItemsHandler
{
  return self->_didReorderItemsHandler;
}

- (__UIDiffableDataSource)impl
{
  return self->_impl;
}

- (void)setImpl:(id)a3
{
}

- (void)validateIdentifiers
{
  id v2 = [(__UIDiffableDataSource *)self->_impl state];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    [v2 sections];
    objc_claimAutoreleasedReturnValue();
    _UIDiffableDataSourceValidateIdentifiers();
  }
  [v2 validateIdentifiers];
}

@end