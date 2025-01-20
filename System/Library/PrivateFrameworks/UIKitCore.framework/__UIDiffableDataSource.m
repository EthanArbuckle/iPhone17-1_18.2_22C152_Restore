@interface __UIDiffableDataSource
+ (void)initialize;
- (BOOL)_canApplySnapshotUpdateWithoutDiffing:(id)a3;
- (BOOL)_isApplyingReorderingTransaction;
- (BOOL)_isDiffableDataSource;
- (BOOL)canMoveItemAtIndexPath:(id)a3;
- (BOOL)isApplyingWithoutRebasingSectionSnapshots;
- (BOOL)isSuppressingViewUpdates;
- (BOOL)sectionController:(id)a3 shouldCollapseItem:(id)a4;
- (BOOL)sectionController:(id)a3 shouldExpandItem:(id)a4;
- (BOOL)sectionController:(id)a3 shouldQueryForSnapshotForExpandingParentItem:(id)a4;
- (NSArray)itemIdentifiers;
- (NSArray)reconfiguredItemIdentifiers;
- (NSArray)reloadedItemIdentifiers;
- (NSArray)reloadedSectionIdentifiers;
- (NSArray)sectionControllers;
- (NSArray)sectionIdentifiers;
- (NSDiffableDataSourceTransaction)currentTransaction;
- (NSMutableArray)completionHandlersForBatchApply;
- (NSString)description;
- (OS_dispatch_queue)applyQueue;
- (OS_dispatch_queue)snapshotQueue;
- (UICollectionView)_collectionView;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSourceReorderingHandlers)reorderingHandlers;
- (UICollectionViewDiffableDataSourceSectionSnapshotHandlers)sectionSnapshotHandlers;
- (UITableView)tableView;
- (_UICollectionViewUpdateExpandCollapseAnimationContext)expandCollapseAnimationContext;
- (_UICollectionViewUpdateItemApplying)viewUpdatesSink;
- (_UIDiffableDataSourceState)state;
- (_UIDiffableDataSourceViewUpdater)viewUpdater;
- (__UIDiffableDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4;
- (__UIDiffableDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4 dataSource:(id)a5;
- (__UIDiffableDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4 reuseIdentifierProvider:(id)a5 cellConfigurationHandler:(id)a6 state:(id)a7 dataSource:(id)a8;
- (__UIDiffableDataSource)initWithCollectionView:(id)a3 itemRenderers:(id)a4 rendererIdentifierProvider:(id)a5;
- (__UIDiffableDataSource)initWithCollectionView:(id)a3 reuseIdentifierProvider:(id)a4 cellConfigurationHandler:(id)a5;
- (__UIDiffableDataSource)initWithCollectionView:(id)a3 sectionControllers:(id)a4 rendererIdentifierProvider:(id)a5;
- (__UIDiffableDataSource)initWithState:(id)a3;
- (__UIDiffableDataSource)initWithTableView:(id)a3 cellProvider:(id)a4;
- (__UIDiffableDataSource)initWithTableView:(id)a3 cellProvider:(id)a4 reuseIdentifierProvider:(id)a5 cellConfigurationHandler:(id)a6 state:(id)a7 dataSource:(id)a8;
- (__UIDiffableDataSource)initWithTableView:(id)a3 reuseIdentifierProvider:(id)a4 cellConfigurationHandler:(id)a5;
- (__UIDiffableDataSource)initWithViewUpdatesSink:(id)a3;
- (id)_cellForItemAtIndexPath:(id)a3 collectionView:(id)a4;
- (id)_cellForRowAtIndexPath:(id)a3 tableView:(id)a4;
- (id)_reorderingTransactionForReorderingUpdate:(id)a3;
- (id)_snapshotForSection:(id)a3;
- (id)_snapshotWithHandlerAtomic:(id)a3;
- (id)_transactionForFinalSnapshot:(id)a3 dataSourceDiffer:(id)a4 shouldSkipRebasingSectionSnapshots:(BOOL)a5;
- (id)_transactionForReloadUpdatesWithSnapshot:(id)a3;
- (id)_validReloadOrReconfigureViewUpdatesInSnapshot:(id)a3;
- (id)_viewForSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4 collectionView:(id)a5;
- (id)associatedSectionControllerForItemIdentifier:(id)a3;
- (id)associatedSectionControllerForSectionIdentifier:(id)a3;
- (id)canReorderItemHandler;
- (id)cellObserver;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellConfigurationHandler;
- (id)collectionViewCellProvider;
- (id)didApplySnapshotHandler;
- (id)emptySnapshot;
- (id)indexPathForItemIdentifier:(id)a3;
- (id)itemIdentifierForIndexPath:(id)a3;
- (id)itemIdentifiersInSectionWithIdentifier:(id)a3;
- (id)reuseIdentifierProvider;
- (id)sectionController:(id)a3 snapshotForExpandingParentItem:(id)a4 currentSectionSnapshot:(id)a5;
- (id)sectionIdentifierForIndex:(int64_t)a3;
- (id)sectionIdentifierForSectionContainingItemIdentifier:(id)a3;
- (id)snapshot;
- (id)snapshotForSection:(id)a3;
- (id)supplementaryReuseIdentifierProvider;
- (id)supplementaryViewConfigurationHandler;
- (id)supplementaryViewProvider;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableViewCellConfigurationHandler;
- (id)tableViewCellProvider;
- (id)willApplySnapshotHandler;
- (int64_t)_commitNewDataSource:(id)a3 withViewUpdates:(id)a4 viewPropertyAnimator:(id)a5 customAnimationsProvider:(id)a6 animated:(BOOL)a7 commitAlongsideHandler:(id)a8 completion:(id)a9;
- (int64_t)_numberOfItemsInSection:(int64_t)a3 collectionView:(id)a4;
- (int64_t)_numberOfRowsInSection:(int64_t)a3 tableView:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)indexForSectionIdentifier:(id)a3;
- (int64_t)indexOfItemIdentifier:(id)a3;
- (int64_t)indexOfSectionIdentifier:(id)a3;
- (int64_t)numberOfItems;
- (int64_t)numberOfItemsInSection:(id)a3;
- (int64_t)numberOfSections;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)outstandingApplyCount;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableViewDefaultRowAnimation;
- (unint64_t)mutationQueueSource;
- (void)_applyDifferencesFromSnapshot:(id)a3 animatingDifferences:(BOOL)a4 completion:(id)a5 isOnApplyQueue:(BOOL)a6;
- (void)_applyDifferencesFromSnapshot:(id)a3 customAnimationsProvider:(id)a4;
- (void)_applyDifferencesFromSnapshot:(id)a3 toSection:(id)a4 animatingDifferences:(BOOL)a5 completion:(id)a6;
- (void)_applyDifferencesFromSnapshot:(id)a3 viewPropertyAnimator:(id)a4 customAnimationsProvider:(id)a5;
- (void)_commitRebasedSectionSnapshotsFromCurrentTransactionIfNeeded;
- (void)_commitReorderingForItemAtIndexPath:(id)a3 toDestinationIndexPath:(id)a4;
- (void)_commitReorderingForItemAtIndexPath:(id)a3 toDestinationIndexPath:(id)a4 shouldPerformViewAnimations:(BOOL)a5;
- (void)_commitStateAtomically:(id)a3;
- (void)_commitUpdate:(id)a3 snapshot:(id)a4 animated:(BOOL)a5 animator:(id)a6 customAnimationsProvider:(id)a7 completion:(id)a8;
- (void)_computeCurrentTransactionForFinalSnapshot:(id)a3 withDataSourceDiffer:(id)a4;
- (void)_notifyDidApplyForCurrentTransactionIfNeeded;
- (void)_notifyWillApplyForCurrentTransactionIfNeeded;
- (void)_onApplyQueue_applyDifferencesFromSnapshot:(id)a3 animatingDifferences:(BOOL)a4 completion:(id)a5;
- (void)_onApplyQueue_applyDifferencesFromSnapshot:(id)a3 viewPropertyAnimator:(id)a4 customAnimationsProvider:(id)a5;
- (void)_onApplyQueue_applyDifferencesFromSnapshot:(id)a3 viewPropertyAnimator:(id)a4 customAnimationsProvider:(id)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)_onApplyQueue_reloadFromSnapshot:(id)a3 completion:(id)a4;
- (void)_performApplyWithoutRebasingSectionSnapshots:(id)a3;
- (void)_performBatchApplyUsingReloadData:(id)a3;
- (void)_performOnApplyQueue:(atomic_ullong *)a1;
- (void)_performReloadOrReconfigureUpdateWithItems:(id)a3 dataSourceSnapshot:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_registerItemRenderers:(id)a3 rendererIdentifierProvider:(id)a4;
- (void)_resetCurrentTransaction;
- (void)_storeState:(id)a3;
- (void)_willBeginReorderingForItemAtIndexPath:(id)a3;
- (void)addAssociatedSectionControllerIfNeeded:(id)a3;
- (void)appendItemsWithIdentifiers:(id)a3;
- (void)appendItemsWithIdentifiers:(id)a3 intoSectionWithIdentifier:(id)a4;
- (void)appendSectionWithIdentifier:(id)a3;
- (void)appendSectionsWithIdentifiers:(id)a3;
- (void)applyDifferencesFromSnapshot:(id)a3;
- (void)applyDifferencesFromSnapshot:(id)a3 animatingDifferences:(BOOL)a4;
- (void)applyDifferencesFromSnapshot:(id)a3 animatingDifferences:(BOOL)a4 completion:(id)a5;
- (void)applyDifferencesFromSnapshot:(id)a3 completion:(id)a4;
- (void)deleteAllItems;
- (void)deleteItemsWithIdentifiers:(id)a3;
- (void)deleteSectionsWithIdentifiers:(id)a3;
- (void)insertItemsWithIdentifiers:(id)a3 afterItemWithIdentifier:(id)a4;
- (void)insertItemsWithIdentifiers:(id)a3 beforeItemWithIdentifier:(id)a4;
- (void)insertSectionWithIdentifier:(id)a3 afterSectionWithIdentifier:(id)a4;
- (void)insertSectionWithIdentifier:(id)a3 beforeSectionWithIdentifier:(id)a4;
- (void)insertSectionsWithIdentifiers:(id)a3 afterSectionWithIdentifier:(id)a4;
- (void)insertSectionsWithIdentifiers:(id)a3 beforeSectionWithIdentifier:(id)a4;
- (void)moveItemWithIdentifier:(id)a3 afterItemWithIdentifier:(id)a4;
- (void)moveItemWithIdentifier:(id)a3 beforeItemWithIdentifier:(id)a4;
- (void)moveSectionWithIdentifier:(id)a3 afterSectionWithIdentifier:(id)a4;
- (void)moveSectionWithIdentifier:(id)a3 beforeSectionWithIdentifier:(id)a4;
- (void)reconfigureItemsWithIdentifiers:(id)a3;
- (void)reloadFromSnapshot:(id)a3;
- (void)reloadFromSnapshot:(id)a3 completion:(id)a4;
- (void)reloadItemsWithIdentifiers:(id)a3;
- (void)reloadSectionsWithIdentifiers:(id)a3;
- (void)sectionController:(id)a3 willCollapseItem:(id)a4;
- (void)sectionController:(id)a3 willExpandItem:(id)a4;
- (void)setCanReorderItemHandler:(id)a3;
- (void)setCollectionViewCellConfigurationHandler:(id)a3;
- (void)setCompletionHandlersForBatchApply:(id)a3;
- (void)setDidApplySnapshotHandler:(id)a3;
- (void)setExpandCollapseAnimationContext:(id)a3;
- (void)setIsApplyingWithoutRebasingSectionSnapshots:(BOOL)a3;
- (void)setMutationQueueSource:(unint64_t)a3;
- (void)setReorderingHandlers:(id)a3;
- (void)setReuseIdentifierProvider:(id)a3;
- (void)setSectionSnapshotHandlers:(id)a3;
- (void)setState:(id)a3;
- (void)setSupplementaryReuseIdentifierProvider:(id)a3;
- (void)setSupplementaryViewConfigurationHandler:(id)a3;
- (void)setSupplementaryViewProvider:(id)a3;
- (void)setTableViewCellConfigurationHandler:(id)a3;
- (void)setTableViewCellProvider:(id)a3;
- (void)setTableViewDefaultRowAnimation:(int64_t)a3;
- (void)setViewUpdater:(id)a3;
- (void)setWillApplySnapshotHandler:(id)a3;
- (void)validateIdentifiers;
@end

@implementation __UIDiffableDataSource

- (id)sectionIdentifierForIndex:(int64_t)a3
{
  return (id)[(_UIDiffableDataSourceState *)self->_state sectionIdentifierForIndex:a3];
}

- (id)indexPathForItemIdentifier:(id)a3
{
  return (id)[(_UIDiffableDataSourceState *)self->_state indexPathForItemIdentifier:a3];
}

- (void)setSupplementaryViewProvider:(id)a3
{
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(_UIDiffableDataSourceState *)self->_state dataSourceSnapshot];
  int64_t v4 = [v3 numberOfSections];

  return v4;
}

- (void)setReorderingHandlers:(id)a3
{
}

- (id)_validReloadOrReconfigureViewUpdatesInSnapshot:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int64_t v4 = [v3 pendingSnapshotUpdates];
  v28 = v3;
  v5 = [v3 state];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = 0;
    uint64_t v9 = *(void *)v38;
    uint64_t v29 = *(void *)v38;
    while (1)
    {
      uint64_t v10 = 0;
      uint64_t v30 = v7;
      do
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v37 + 1) + 8 * v10);
        if ([v11 action] == 2)
        {
          uint64_t v32 = v10;
          int v12 = [v11 isSectionOperation];
          int v13 = [v11 shouldReconfigure];
          v14 = [v11 identifiers];
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (!v15) {
            goto LABEL_27;
          }
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v34;
          if (v13) {
            char v18 = 2;
          }
          else {
            char v18 = 0;
          }
          while (1)
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v34 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v20 = *(void *)(*((void *)&v33 + 1) + 8 * i);
              if (v12)
              {
                uint64_t v21 = [v5 indexOfSectionIdentifier:v20];
                if (v21 == 0x7FFFFFFFFFFFFFFFLL) {
                  continue;
                }
                uint64_t v22 = [MEMORY[0x1E4F28D58] indexPathForItem:0x7FFFFFFFFFFFFFFFLL inSection:v21];
              }
              else
              {
                uint64_t v22 = [v5 indexPathForItemIdentifier:v20];
              }
              v23 = (void *)v22;
              if (v22)
              {
                v24 = [[UICollectionViewUpdateItem alloc] initWithInitialIndexPath:v22 finalIndexPath:0 updateAction:2];
                v25 = v24;
                if (v24) {
                  *(unsigned char *)&v24->_updateItemFlags = *(unsigned char *)&v24->_updateItemFlags & 0xFD | v18;
                }
                if (v8)
                {
                  [v8 addObject:v24];
                }
                else
                {
                  v8 = [MEMORY[0x1E4F1CA48] arrayWithObject:v24];
                }
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v41 count:16];
            if (!v16)
            {
LABEL_27:

              uint64_t v9 = v29;
              uint64_t v7 = v30;
              uint64_t v10 = v32;
              break;
            }
          }
        }
        ++v10;
      }
      while (v10 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (!v7) {
        goto LABEL_32;
      }
    }
  }
  v8 = 0;
LABEL_32:

  id v26 = v8;
  return v26;
}

- (UICollectionViewDiffableDataSourceReorderingHandlers)reorderingHandlers
{
  reorderingHandlers = self->_reorderingHandlers;
  if (!reorderingHandlers)
  {
    int64_t v4 = objc_alloc_init(UICollectionViewDiffableDataSourceReorderingHandlers);
    v5 = self->_reorderingHandlers;
    self->_reorderingHandlers = v4;

    reorderingHandlers = self->_reorderingHandlers;
  }
  return reorderingHandlers;
}

- (id)canReorderItemHandler
{
  return self->_canReorderItemHandler;
}

- (void)_commitRebasedSectionSnapshotsFromCurrentTransactionIfNeeded
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (self->_currentTransaction)
  {
    os_unfair_recursive_lock_lock_with_options();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v3 = [(NSDiffableDataSourceTransaction *)self->_currentTransaction sectionTransactions];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v32 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v9 = [v8 sectionIdentifier];
          uint64_t v10 = [(__UIDiffableDataSource *)self associatedSectionControllerForSectionIdentifier:v9];
          v11 = v10;
          if (v10)
          {
            int v12 = [v10 _extantMutableSnapshotForSection:v9];
            if (v12)
            {
              int v13 = [v8 finalSnapshot];
              [v11 _updateSnapshot:v13 forSectionIdentifier:v9];
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v5);
    }

    v14 = [(NSDiffableDataSourceTransaction *)self->_currentTransaction initialSnapshot];
    uint64_t v15 = [(NSDiffableDataSourceTransaction *)self->_currentTransaction finalSnapshot];
    uint64_t v16 = [v15 sectionIdentifiers];
    uint64_t v17 = [v14 sectionIdentifiers];
    char v18 = [v16 differenceFromArray:v17];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v19 = [v18 removals];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = [*(id *)(*((void *)&v27 + 1) + 8 * j) object];
          v25 = [(__UIDiffableDataSource *)self associatedSectionControllerForSectionIdentifier:v24];
          id v26 = v25;
          if (v25) {
            [v25 _updateSnapshot:0 forSectionIdentifier:v24];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v21);
    }

    os_unfair_recursive_lock_unlock();
  }
}

- (void)_commitStateAtomically:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49____UIDiffableDataSource__commitStateAtomically___block_invoke;
  aBlock[3] = &unk_1E52D9F98;
  aBlock[4] = self;
  id v5 = v4;
  id v12 = v5;
  uint64_t v6 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v7 = [(__UIDiffableDataSource *)self snapshotQueue];

  if (v7)
  {
    v8 = [(__UIDiffableDataSource *)self snapshotQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49____UIDiffableDataSource__commitStateAtomically___block_invoke_2;
    block[3] = &unk_1E52DA040;
    uint64_t v10 = v6;
    dispatch_sync(v8, block);
  }
  else
  {
    v6[2](v6);
  }
}

- (id)snapshot
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __34____UIDiffableDataSource_snapshot__block_invoke;
  aBlock[3] = &unk_1E52E3270;
  aBlock[4] = self;
  id v3 = _Block_copy(aBlock);
  id v4 = [(__UIDiffableDataSource *)self _snapshotWithHandlerAtomic:v3];

  return v4;
}

- (id)_snapshotWithHandlerAtomic:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__36;
  char v18 = __Block_byref_object_dispose__36;
  id v19 = 0;
  id v5 = [(__UIDiffableDataSource *)self snapshotQueue];

  if (v5)
  {
    uint64_t v6 = [(__UIDiffableDataSource *)self snapshotQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53____UIDiffableDataSource__snapshotWithHandlerAtomic___block_invoke;
    v11[3] = &unk_1E52E3388;
    int v13 = &v14;
    id v12 = v4;
    dispatch_sync(v6, v11);

    uint64_t v7 = v12;
  }
  else
  {
    uint64_t v8 = v4[2](v4);
    uint64_t v7 = (void *)v15[5];
    v15[5] = v8;
  }

  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (OS_dispatch_queue)snapshotQueue
{
  return self->_snapshotQueue;
}

- (id)associatedSectionControllerForSectionIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && (sectionControllers = self->_sectionControllers) != 0)
  {
    if ([(NSHashTable *)sectionControllers count] == 1)
    {
      uint64_t v6 = [(NSHashTable *)self->_sectionControllers allObjects];
      id v7 = [(NSHashTable *)v6 firstObject];
LABEL_16:
      uint64_t v8 = v7;
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v6 = self->_sectionControllers;
      uint64_t v8 = (void *)[(NSHashTable *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v16;
        while (2)
        {
          for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v16 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            id v12 = objc_msgSend(v11, "associatedSectionIdentifiers", (void)v15);
            int v13 = [v12 containsObject:v4];

            if (v13)
            {
              id v7 = v11;
              goto LABEL_16;
            }
          }
          uint64_t v8 = (void *)[(NSHashTable *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (_UICollectionViewUpdateExpandCollapseAnimationContext)expandCollapseAnimationContext
{
  return self->_expandCollapseAnimationContext;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v7 = [(_UIDiffableDataSourceState *)self->_state dataSourceSnapshot];
  int64_t v8 = [v7 numberOfSections];

  if (v8 <= a4)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 1510, @"Invalid parameter not satisfying: %@", @"section < [_state.dataSourceSnapshot numberOfSections]" object file lineNumber description];
  }
  uint64_t v9 = [(_UIDiffableDataSourceState *)self->_state dataSourceSnapshot];
  int64_t v10 = [v9 numberOfItemsInSection:a4];

  return v10;
}

- (int64_t)numberOfSections
{
  return [(_UIDiffableDataSourceState *)self->_state numberOfSections];
}

- (_UIDiffableDataSourceState)state
{
  return self->_state;
}

- (int64_t)numberOfItemsInSection:(id)a3
{
  return [(_UIDiffableDataSourceState *)self->_state numberOfItemsInSection:a3];
}

- (int64_t)_numberOfItemsInSection:(int64_t)a3 collectionView:(id)a4
{
  return [(__UIDiffableDataSource *)self collectionView:a4 numberOfItemsInSection:a3];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v3 = [(_UIDiffableDataSourceState *)self->_state dataSourceSnapshot];
  int64_t v4 = [v3 numberOfSections];

  return v4;
}

- (NSDiffableDataSourceTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (id)_viewForSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4 collectionView:(id)a5
{
  return [(__UIDiffableDataSource *)self collectionView:a5 viewForSupplementaryElementOfKind:a3 atIndexPath:a4];
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(__UIDiffableDataSource *)self supplementaryViewProvider];
  if (v12) {
    goto LABEL_5;
  }
  uint64_t v13 = [(__UIDiffableDataSource *)self supplementaryReuseIdentifierProvider];
  if (!v13
    || (uint64_t v14 = (void *)v13,
        [(__UIDiffableDataSource *)self supplementaryViewConfigurationHandler],
        long long v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        !v15))
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 1551, @"Invalid parameter not satisfying: %@", @"self.supplementaryViewProvider || (self.supplementaryReuseIdentifierProvider && self.supplementaryViewConfigurationHandler)" object file lineNumber description];
LABEL_5:
  }
  long long v16 = [(__UIDiffableDataSource *)self supplementaryViewProvider];

  if (v16)
  {
    long long v17 = [(__UIDiffableDataSource *)self supplementaryViewProvider];
    long long v18 = ((void (**)(void, id, id, id))v17)[2](v17, v9, v10, v11);

    if (v18) {
      goto LABEL_13;
    }
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 1556, @"UICollectionViewDiffableDataSource supplementary view provider returned nil for element kind '%@' at index path %@, which is not allowed. You must always return a view to the collection view: %@", v10, v11, v9 object file lineNumber description];
  }
  else
  {
    uint64_t v20 = [(__UIDiffableDataSource *)self supplementaryReuseIdentifierProvider];
    id v19 = ((void (**)(void, id, id))v20)[2](v20, v10, v11);

    if (!v19)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2 object:self file:@"_UIDiffableDataSourceImpl.m" lineNumber:1559 description:@"Error: reuseIdentifier must not be nil"];
    }
    long long v18 = [v9 dequeueReusableSupplementaryViewOfKind:v10 withReuseIdentifier:v19 forIndexPath:v11];
    uint64_t v21 = [(__UIDiffableDataSource *)self supplementaryViewConfigurationHandler];
    ((void (**)(void, void *, id, id))v21)[2](v21, v18, v10, v11);
  }
LABEL_13:

  return v18;
}

- (id)supplementaryViewProvider
{
  return self->_supplementaryViewProvider;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(__UIDiffableDataSource *)self itemIdentifierForIndexPath:v8];
  id v10 = [(__UIDiffableDataSource *)self collectionViewCellProvider];

  if (!v10)
  {
    long long v15 = [(__UIDiffableDataSource *)self reuseIdentifierProvider];

    if (!v15)
    {
      uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 1536, @"Invalid parameter not satisfying: %@", @"self.reuseIdentifierProvider" object file lineNumber description];
    }
    long long v16 = [(__UIDiffableDataSource *)self collectionViewCellConfigurationHandler];

    if (!v16)
    {
      uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 1537, @"Invalid parameter not satisfying: %@", @"self.collectionViewCellConfigurationHandler" object file lineNumber description];
    }
    long long v17 = [(__UIDiffableDataSource *)self reuseIdentifierProvider];
    uint64_t v14 = ((void (**)(void, void *))v17)[2](v17, v9);

    if (v14)
    {
      if (v9)
      {
LABEL_13:
        id v12 = [v7 dequeueReusableCellWithReuseIdentifier:v14 forIndexPath:v8];
        long long v18 = [(__UIDiffableDataSource *)self collectionViewCellConfigurationHandler];
        ((void (**)(void, void *, void *))v18)[2](v18, v12, v9);

LABEL_14:
        goto LABEL_15;
      }
    }
    else
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 1540, @"Invalid parameter not satisfying: %@", @"reuseIdentifier" object file lineNumber description];

      if (v9) {
        goto LABEL_13;
      }
    }
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 1541, @"Invalid parameter not satisfying: %@", @"itemIdentifier" object file lineNumber description];

    goto LABEL_13;
  }
  id v11 = [(__UIDiffableDataSource *)self collectionViewCellProvider];
  id v12 = ((void (**)(void, id, id, void *))v11)[2](v11, v7, v8, v9);

  if (!v12)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 1524, @"UICollectionViewDiffableDataSource cell provider returned nil for index path %@ with item identifier '%@', which is not allowed. You must always return a cell to the collection view: %@", v8, v9, v7 object file lineNumber description];
  }
  if ([(NSHashTable *)self->_sectionControllers count])
  {
    uint64_t v13 = [(__UIDiffableDataSource *)self associatedSectionControllerForItemIdentifier:v9];
    uint64_t v14 = v13;
    if (v13) {
      [v13 configureCell:v12 forItem:v9];
    }
    goto LABEL_14;
  }
LABEL_15:

  return v12;
}

- (id)collectionViewCellProvider
{
  return self->_collectionViewCellProvider;
}

- (id)itemIdentifierForIndexPath:(id)a3
{
  return (id)[(_UIDiffableDataSourceState *)self->_state itemIdentifierForIndexPath:a3];
}

- (id)_cellForItemAtIndexPath:(id)a3 collectionView:(id)a4
{
  return [(__UIDiffableDataSource *)self collectionView:a4 cellForItemAtIndexPath:a3];
}

- (id)associatedSectionControllerForItemIdentifier:(id)a3
{
  if (a3)
  {
    int64_t v4 = -[__UIDiffableDataSource sectionIdentifierForSectionContainingItemIdentifier:](self, "sectionIdentifierForSectionContainingItemIdentifier:");
    if (v4)
    {
      id v5 = [(__UIDiffableDataSource *)self associatedSectionControllerForSectionIdentifier:v4];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)sectionIdentifierForSectionContainingItemIdentifier:(id)a3
{
  return (id)[(_UIDiffableDataSourceState *)self->_state sectionIdentifierForSectionContainingItemIdentifier:a3];
}

- (__UIDiffableDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)off_1E52D5498);
  id v9 = [(__UIDiffableDataSource *)self initWithCollectionView:v7 cellProvider:v6 reuseIdentifierProvider:0 cellConfigurationHandler:0 state:v8 dataSource:0];

  return v9;
}

- (void)_applyDifferencesFromSnapshot:(id)a3 animatingDifferences:(BOOL)a4 completion:(id)a5 isOnApplyQueue:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __103____UIDiffableDataSource__applyDifferencesFromSnapshot_animatingDifferences_completion_isOnApplyQueue___block_invoke;
  v16[3] = &unk_1E52DA138;
  v16[4] = self;
  id v17 = v10;
  BOOL v19 = a4;
  id v18 = v11;
  id v12 = v11;
  id v13 = v10;
  uint64_t v14 = (void (**)(void))_Block_copy(v16);
  long long v15 = v14;
  if (v6) {
    v14[2](v14);
  }
  else {
    -[__UIDiffableDataSource _performOnApplyQueue:]((atomic_ullong *)self, v14);
  }
}

- (void)applyDifferencesFromSnapshot:(id)a3 animatingDifferences:(BOOL)a4 completion:(id)a5
{
}

- (void)_onApplyQueue_reloadFromSnapshot:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (pthread_main_np() == 1) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 4;
  }
  [(__UIDiffableDataSource *)self setMutationQueueSource:v8 | [(__UIDiffableDataSource *)self mutationQueueSource]];
  if ([(__UIDiffableDataSource *)self mutationQueueSource] == 6)
  {
    id v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIDiffing", _onApplyQueue_reloadFromSnapshot_completion____s_category)+ 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = v9;
      id v11 = [(__UIDiffableDataSource *)self viewUpdater];
      id v12 = [v11 targetView];
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v12;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Warning: applying updates in a non-thread confined manner is dangerous and can lead to deadlocks. Please always submit updates either always on the main queue or always off the main queue - view=%@", buf, 0xCu);
    }
  }
  [v6 _prepareForApplyToDataSource];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70____UIDiffableDataSource__onApplyQueue_reloadFromSnapshot_completion___block_invoke;
  aBlock[3] = &unk_1E52E3298;
  aBlock[4] = self;
  id v18 = v6;
  id v19 = v7;
  id v13 = v7;
  id v14 = v6;
  long long v15 = (void (**)(void))_Block_copy(aBlock);
  long long v16 = [(__UIDiffableDataSource *)self applyQueue];
  dispatch_assert_queue_V2(v16);

  if (pthread_main_np() == 1) {
    v15[2](v15);
  }
  else {
    dispatch_sync(MEMORY[0x1E4F14428], v15);
  }
}

- (void)_commitUpdate:(id)a3 snapshot:(id)a4 animated:(BOOL)a5 animator:(id)a6 customAnimationsProvider:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v39 = a8;
  id v38 = a7;
  id v16 = a6;
  if (pthread_main_np() != 1)
  {
    long long v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2 object:self file:@"_UIDiffableDataSourceImpl.m" lineNumber:963 description:@"Error: Updates can only be committed on the main thread."];
  }
  uint64_t v17 = [v14 action];
  v41 = v14;
  if (v17 == 2)
  {
    uint64_t v18 = [(__UIDiffableDataSource *)self _validReloadOrReconfigureViewUpdatesInSnapshot:v15];
    id v19 = (void *)v18;
    uint64_t v20 = (void *)MEMORY[0x1E4F1CBF0];
    if (v18) {
      uint64_t v20 = (void *)v18;
    }
    id v21 = v20;

    uint64_t v22 = (void *)[objc_alloc((Class)off_1E52D5498) initWithStateAdvancingGenerationID:self->_state];
  }
  else
  {
    uint64_t v23 = v17;
    v24 = [(_UIDiffableDataSourceState *)self->_state identifiers];
    v25 = (void *)[v24 mutableCopy];

    id v26 = [(_UIDiffableDataSourceState *)self->_state sections];
    long long v27 = (void *)[v26 mutableCopy];

    long long v28 = [(_UIDiffableDataSourceState *)self->_state dataSourceSnapshot];
    long long v29 = [off_1E52D5400 snapshotterForSnapshot:v28];

    switch(v23)
    {
      case 3:
        _UIDiffableDataSourceApplyMoveUpdate();
      case 1:
        _UIDiffableDataSourceApplyDeleteUpdate();
      case 0:
        _UIDiffableDataSourceApplyInsertUpdate();
    }
    id v21 = (id)MEMORY[0x1E4F1CBF0];
    id v30 = objc_alloc((Class)off_1E52D5498);
    long long v31 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v22 = (void *)[v30 initWithGenerationID:v31 identifiers:v25 sections:v27 dataSourceSnapshot:v29];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __103____UIDiffableDataSource__commitUpdate_snapshot_animated_animator_customAnimationsProvider_completion___block_invoke;
  aBlock[3] = &unk_1E52D9F98;
  aBlock[4] = self;
  id v43 = v22;
  id v32 = v22;
  long long v33 = _Block_copy(aBlock);
  [(__UIDiffableDataSource *)self _computeCurrentTransactionForFinalSnapshot:v15 withDataSourceDiffer:0];
  [(__UIDiffableDataSource *)self _notifyWillApplyForCurrentTransactionIfNeeded];
  long long v34 = [(__UIDiffableDataSource *)self viewUpdater];
  long long v35 = [(_UIDiffableDataSourceState *)self->_state dataSourceSnapshot];
  LOBYTE(v37) = a5;
  [v34 _performUpdateWithCollectionViewUpdateItems:v21 dataSourceSnapshot:v35 updateHandler:v33 completion:v39 viewPropertyAnimator:v16 customAnimationsProvider:v38 animated:v37];

  [(__UIDiffableDataSource *)self _notifyDidApplyForCurrentTransactionIfNeeded];
  [(__UIDiffableDataSource *)self _resetCurrentTransaction];
}

- (void)_resetCurrentTransaction
{
  pendingReorderingTransaction = self->_pendingReorderingTransaction;
  self->_pendingReorderingTransaction = 0;

  currentTransaction = self->_currentTransaction;
  self->_currentTransaction = 0;
}

- (void)_onApplyQueue_applyDifferencesFromSnapshot:(id)a3 viewPropertyAnimator:(id)a4 customAnimationsProvider:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (!v13)
  {
    uint64_t v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 831, @"Invalid parameter not satisfying: %@", @"snapshot" object file lineNumber description];
  }
  if (pthread_main_np() == 1) {
    uint64_t v17 = 2;
  }
  else {
    uint64_t v17 = 4;
  }
  [(__UIDiffableDataSource *)self setMutationQueueSource:v17 | [(__UIDiffableDataSource *)self mutationQueueSource]];
  if ([(__UIDiffableDataSource *)self mutationQueueSource] == 6)
  {
    uint64_t v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIDiffing", &_onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion____s_category)+ 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = v18;
      [(__UIDiffableDataSource *)self viewUpdater];
      v21 = uint64_t v20 = a2;
      uint64_t v22 = [v21 targetView];
      *(_DWORD *)buf = 138412290;
      v66 = v22;
      _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "Warning: applying updates in a non-thread confined manner is dangerous and can lead to deadlocks. Please always submit updates either always on the main queue or always off the main queue - view=%@", buf, 0xCu);

      a2 = v20;
    }
  }
  if ([(__UIDiffableDataSource *)self isSuppressingViewUpdates])
  {
    [(__UIDiffableDataSource *)self _onApplyQueue_reloadFromSnapshot:v13 completion:v16];
  }
  else
  {
    v41 = v16;
    id v42 = v15;
    [v13 _prepareForApplyToDataSource];
    long long v40 = v14;
    SEL v23 = a2;
    if ([(__UIDiffableDataSource *)self _isApplyingReorderingTransaction]) {
      BOOL pendingReorderingTransactionShouldPerformViewAnimations = self->_pendingReorderingTransactionShouldPerformViewAnimations;
    }
    else {
      BOOL pendingReorderingTransactionShouldPerformViewAnimations = 1;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke;
    aBlock[3] = &unk_1E52E3310;
    aBlock[4] = self;
    id v25 = v13;
    id v63 = v25;
    BOOL v64 = pendingReorderingTransactionShouldPerformViewAnimations;
    id v39 = _Block_copy(aBlock);
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke_2;
    v55[3] = &unk_1E52E3338;
    BOOL v60 = pendingReorderingTransactionShouldPerformViewAnimations;
    v55[4] = self;
    id v26 = v25;
    id v56 = v26;
    id v27 = v41;
    id v58 = v27;
    id v28 = v40;
    id v57 = v28;
    id v29 = v15;
    id v59 = v29;
    BOOL v61 = a6;
    id v30 = _Block_copy(v55);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke_5;
    v49[3] = &unk_1E52E3360;
    SEL v53 = v23;
    v49[4] = self;
    BOOL v54 = a6;
    id v50 = v28;
    id v51 = v29;
    id v52 = v27;
    long long v31 = (void (**)(void *, id))_Block_copy(v49);
    id v32 = [(__UIDiffableDataSource *)self applyQueue];

    if (!v32)
    {
      id v38 = [MEMORY[0x1E4F28B00] currentHandler];
      [v38 handleFailureInMethod:v23, self, @"_UIDiffableDataSourceImpl.m", 923, @"Invalid parameter not satisfying: %@", @"self.applyQueue != nil" object file lineNumber description];
    }
    long long v33 = [(__UIDiffableDataSource *)self applyQueue];
    dispatch_assert_queue_V2(v33);

    if ([(__UIDiffableDataSource *)self _canApplySnapshotUpdateWithoutDiffing:v26])
    {
      id v14 = v40;
      id v16 = v41;
      long long v34 = v39;
      long long v35 = v30;
      if (pthread_main_np() == 1)
      {
        v31[2](v31, v26);
      }
      else
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke_6;
        block[3] = &unk_1E52DB330;
        v48 = v31;
        id v47 = v26;
        dispatch_sync(MEMORY[0x1E4F14428], block);
      }
      id v15 = v42;
    }
    else
    {
      long long v34 = v39;
      long long v36 = (*((void (**)(void *))v39 + 2))(v39);
      id v14 = v40;
      id v16 = v41;
      long long v35 = v30;
      if (pthread_main_np() == 1)
      {
        (*((void (**)(void *, void *))v30 + 2))(v30, v36);
      }
      else
      {
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke_7;
        v43[3] = &unk_1E52DB330;
        id v45 = v30;
        id v44 = v36;
        dispatch_sync(MEMORY[0x1E4F14428], v43);
      }
      id v15 = v42;
    }
  }
}

- (unint64_t)mutationQueueSource
{
  return self->_mutationQueueSource;
}

- (BOOL)isSuppressingViewUpdates
{
  return self->_completionHandlersForBatchApply != 0;
}

- (void)setMutationQueueSource:(unint64_t)a3
{
  self->_mutationQueueSource = a3;
}

- (void)_performOnApplyQueue:(atomic_ullong *)a1
{
  id v3 = a2;
  if (a1)
  {
    if (pthread_main_np() == 1 && [(atomic_ullong *)a1 outstandingApplyCount] >= 1)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = [(atomic_ullong *)a1 viewUpdater];
      id v9 = [v8 targetView];
      [v7 handleFailureInMethod:sel__performOnApplyQueue_, a1, @"_UIDiffableDataSourceImpl.m", 575, @"Deadlock detected: calling this method on the main queue with outstanding async updates is not permitted and will deadlock. Please always submit updates either always on the main queue or always off the main queue - view=%@", v9 object file lineNumber description];
    }
    int64_t v4 = [(atomic_ullong *)a1 applyQueue];

    if (!v4)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:sel__performOnApplyQueue_, a1, @"_UIDiffableDataSourceImpl.m", 577, @"Invalid parameter not satisfying: %@", @"self.applyQueue != nil" object file lineNumber description];
    }
    atomic_fetch_add_explicit(a1 + 29, 1uLL, memory_order_relaxed);
    id v5 = [(atomic_ullong *)a1 applyQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47____UIDiffableDataSource__performOnApplyQueue___block_invoke;
    block[3] = &unk_1E52DB330;
    void block[4] = a1;
    id v11 = v3;
    dispatch_sync(v5, block);
  }
}

- (OS_dispatch_queue)applyQueue
{
  return self->_applyQueue;
}

- (int64_t)outstandingApplyCount
{
  return atomic_load((unint64_t *)&self->_outstandingApplyCount);
}

- (void)_notifyDidApplyForCurrentTransactionIfNeeded
{
  if (self->_currentTransaction)
  {
    id v3 = [(__UIDiffableDataSource *)self didApplySnapshotHandler];

    if (v3)
    {
      int64_t v4 = [(__UIDiffableDataSource *)self didApplySnapshotHandler];
      id v5 = [(NSDiffableDataSourceTransaction *)self->_currentTransaction _spiCopy];
      ((void (**)(void, void *))v4)[2](v4, v5);
    }
    if ([(__UIDiffableDataSource *)self _isApplyingReorderingTransaction])
    {
      id v6 = [(__UIDiffableDataSource *)self reorderingHandlers];
      id v7 = [v6 didReorderHandler];

      if (v7)
      {
        id v9 = [(__UIDiffableDataSource *)self reorderingHandlers];
        uint64_t v8 = [v9 didReorderHandler];
        ((void (**)(void, NSDiffableDataSourceTransaction *))v8)[2](v8, self->_currentTransaction);
      }
    }
  }
}

- (id)didApplySnapshotHandler
{
  return self->_didApplySnapshotHandler;
}

- (void)_notifyWillApplyForCurrentTransactionIfNeeded
{
  if (self->_currentTransaction)
  {
    id v3 = [(__UIDiffableDataSource *)self willApplySnapshotHandler];

    if (v3)
    {
      int64_t v4 = [(__UIDiffableDataSource *)self willApplySnapshotHandler];
      id v5 = [(NSDiffableDataSourceTransaction *)self->_currentTransaction _spiCopy];
      ((void (**)(void, void *))v4)[2](v4, v5);
    }
    if ([(__UIDiffableDataSource *)self _isApplyingReorderingTransaction])
    {
      id v6 = [(__UIDiffableDataSource *)self reorderingHandlers];
      id v7 = [v6 willReorderHandler];

      if (v7)
      {
        id v9 = [(__UIDiffableDataSource *)self reorderingHandlers];
        uint64_t v8 = [v9 willReorderHandler];
        ((void (**)(void, NSDiffableDataSourceTransaction *))v8)[2](v8, self->_currentTransaction);
      }
    }
  }
}

- (BOOL)_isApplyingReorderingTransaction
{
  return self->_pendingReorderingTransaction != 0;
}

- (id)willApplySnapshotHandler
{
  return self->_willApplySnapshotHandler;
}

- (BOOL)_canApplySnapshotUpdateWithoutDiffing:(id)a3
{
  id v4 = a3;
  id v5 = [v4 state];
  id v6 = [v5 generationID];
  id v7 = [(_UIDiffableDataSourceState *)self->_state generationID];
  char v8 = [v6 isEqual:v7];

  id v9 = [v4 pendingSnapshotUpdates];

  uint64_t v10 = [v9 count];
  NSUInteger v11 = [(NSHashTable *)self->_sectionControllers count];
  BOOL v12 = [(__UIDiffableDataSource *)self isApplyingWithoutRebasingSectionSnapshots];
  if (v11) {
    char v13 = v12;
  }
  else {
    char v13 = 1;
  }
  if (v10 == 1) {
    char v14 = v8;
  }
  else {
    char v14 = 0;
  }
  return v14 & v13;
}

- (void)_computeCurrentTransactionForFinalSnapshot:(id)a3 withDataSourceDiffer:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  pendingReorderingTransaction = self->_pendingReorderingTransaction;
  if (pendingReorderingTransaction)
  {
    objc_storeStrong((id *)&self->_currentTransaction, pendingReorderingTransaction);
  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    char v8 = [(__UIDiffableDataSource *)self _transactionForFinalSnapshot:v10 dataSourceDiffer:v6 shouldSkipRebasingSectionSnapshots:[(__UIDiffableDataSource *)self isApplyingWithoutRebasingSectionSnapshots]];
    currentTransaction = self->_currentTransaction;
    self->_currentTransaction = v8;

    os_unfair_recursive_lock_unlock();
  }
}

- (BOOL)isApplyingWithoutRebasingSectionSnapshots
{
  return self->_isApplyingWithoutRebasingSectionSnapshots;
}

- (id)_transactionForFinalSnapshot:(id)a3 dataSourceDiffer:(id)a4 shouldSkipRebasingSectionSnapshots:(BOOL)a5
{
  BOOL v35 = a5;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v36 = a4;
  id v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v34 = self;
  id obj = self->_sectionControllers;
  uint64_t v8 = [(NSHashTable *)obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v39 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v45 != v39) {
          objc_enumerationMutation(obj);
        }
        NSUInteger v11 = objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * i), "_snapshotsMap", v34);
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        BOOL v12 = [v11 keyEnumerator];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v41;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v41 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v40 + 1) + 8 * j);
              uint64_t v18 = [v11 objectForKey:v17];
              [v7 setObject:v18 forKey:v17];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v40 objects:v48 count:16];
          }
          while (v14);
        }
      }
      uint64_t v9 = [(NSHashTable *)obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v9);
  }

  id v19 = (void *)[objc_alloc((Class)off_1E52D2BB8) initWithState:v34->_state];
  id v20 = objc_alloc((Class)off_1E52D2BB8);
  id v21 = [v37 state];
  uint64_t v22 = (void *)[v20 initWithState:v21];

  if (v35)
  {
    SEL v23 = v36;
    if (v36) {
      v24 = (void *)*((void *)v36 + 4);
    }
    else {
      v24 = 0;
    }
    id v25 = v24;
    id v26 = -[_UIIdentifierDiffer collectionDifference](v25);
    id v27 = v26;
    if (v26)
    {
      id v28 = v26;
    }
    else
    {
      id v31 = objc_alloc(MEMORY[0x1E4F28F20]);
      id v28 = (_UIDiffableDataSourceSectionSnapshotRebaser *)[v31 initWithChanges:MEMORY[0x1E4F1CBF0]];
    }
    id v29 = v28;

    id v30 = [[NSDiffableDataSourceTransaction alloc] initWithInitialSnapshot:v19 finalSnapshot:v22 source:0 difference:v29 finalSectionSnapshots:v7];
  }
  else
  {
    SEL v23 = v36;
    id v29 = [[_UIDiffableDataSourceSectionSnapshotRebaser alloc] initWithInitialSnapshot:v19 finalSnapshot:v22 initialSectionSnapshots:v7 dataSourceDiffer:v36];
    id v30 = [(_UIDiffableDataSourceSectionSnapshotRebaser *)v29 computeApplyTransactionIncludingSectionDifferences:0];
  }
  id v32 = v30;

  return v32;
}

- (int64_t)_commitNewDataSource:(id)a3 withViewUpdates:(id)a4 viewPropertyAnimator:(id)a5 customAnimationsProvider:(id)a6 animated:(BOOL)a7 commitAlongsideHandler:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a8;
  id v17 = a9;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  if (pthread_main_np() != 1)
  {
    id v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"_UIDiffableDataSourceImpl.m" lineNumber:1069 description:@"Error: Updates can only be committed on the main thread."];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __152____UIDiffableDataSource__commitNewDataSource_withViewUpdates_viewPropertyAnimator_customAnimationsProvider_animated_commitAlongsideHandler_completion___block_invoke;
  aBlock[3] = &unk_1E52E3298;
  id v33 = v15;
  long long v34 = self;
  id v35 = v16;
  id v30 = v16;
  id v21 = v15;
  uint64_t v22 = _Block_copy(aBlock);
  kdebug_trace();
  SEL v23 = [(__UIDiffableDataSource *)self viewUpdater];
  v24 = [(_UIDiffableDataSourceState *)self->_state dataSourceSnapshot];
  id v25 = [off_1E52D5400 snapshotterForSnapshot:v24];
  LOBYTE(v29) = a7;
  int64_t v26 = [v23 _performUpdateWithCollectionViewUpdateItems:v20 dataSourceSnapshot:v25 updateHandler:v22 completion:v17 viewPropertyAnimator:v19 customAnimationsProvider:v18 animated:v29];

  kdebug_trace();
  return v26;
}

- (_UIDiffableDataSourceViewUpdater)viewUpdater
{
  return self->_viewUpdater;
}

- (__UIDiffableDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4 reuseIdentifierProvider:(id)a5 cellConfigurationHandler:(id)a6 state:(id)a7 dataSource:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = (__UIDiffableDataSource *)a8;
  v32.receiver = self;
  v32.super_class = (Class)__UIDiffableDataSource;
  id v20 = [(__UIDiffableDataSource *)&v32 init];
  if (v20)
  {
    id v21 = [[_UIDiffableDataSourceViewUpdater alloc] initWithCollectionView:v14];
    viewUpdater = v20->_viewUpdater;
    v20->_viewUpdater = v21;

    uint64_t v23 = [v15 copy];
    id collectionViewCellProvider = v20->_collectionViewCellProvider;
    v20->_id collectionViewCellProvider = (id)v23;

    uint64_t v25 = [v16 copy];
    id reuseIdentifierProvider = v20->_reuseIdentifierProvider;
    v20->_id reuseIdentifierProvider = (id)v25;

    uint64_t v27 = [v17 copy];
    id collectionViewCellConfigurationHandler = v20->_collectionViewCellConfigurationHandler;
    v20->_id collectionViewCellConfigurationHandler = (id)v27;

    uint64_t v29 = (void *)[objc_alloc((Class)off_1E52D5498) initWithState:v18];
    [(__UIDiffableDataSource *)v20 _storeState:v29];

    objc_storeWeak((id *)&v20->_collectionView, v14);
    _UIDiffableDataSourceCommonInit(v20);
    if (v19) {
      id v30 = v19;
    }
    else {
      id v30 = v20;
    }
    [v14 setDataSource:v30];
  }

  return v20;
}

- (void)_storeState:(id)a3
{
  id v4 = a3;
  [v4 willBecomeWiredToDataSource];
  state = self->_state;
  self->_state = (_UIDiffableDataSourceState *)v4;
}

- (void)setTableViewDefaultRowAnimation:(int64_t)a3
{
  id v4 = [(__UIDiffableDataSource *)self viewUpdater];
  [v4 setTableViewRowAnimation:a3];
}

- (id)_transactionForReloadUpdatesWithSnapshot:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F28F20];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = MEMORY[0x1E4F1CBF0];
  id v7 = (void *)[v5 initWithChanges:MEMORY[0x1E4F1CBF0]];
  uint64_t v8 = +[NSDiffableDataSourceTransaction applyTransactionWithInitialSnapshot:v4 finalSnapshot:v4 difference:v7 sectionTransactions:v6];

  return v8;
}

- (void)_performReloadOrReconfigureUpdateWithItems:(id)a3 dataSourceSnapshot:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v14 = [(__UIDiffableDataSource *)self viewUpdater];
  LOBYTE(v13) = a5;
  [v14 _performUpdateWithCollectionViewUpdateItems:v12 dataSourceSnapshot:v11 updateHandler:&__block_literal_global_76 completion:v10 viewPropertyAnimator:0 customAnimationsProvider:0 animated:v13];
}

- (void)_onApplyQueue_applyDifferencesFromSnapshot:(id)a3 animatingDifferences:(BOOL)a4 completion:(id)a5
{
}

- (__UIDiffableDataSource)initWithTableView:(id)a3 cellProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)off_1E52D5498);
  uint64_t v9 = [(__UIDiffableDataSource *)self initWithTableView:v7 cellProvider:v6 reuseIdentifierProvider:0 cellConfigurationHandler:0 state:v8 dataSource:0];

  return v9;
}

- (__UIDiffableDataSource)initWithTableView:(id)a3 cellProvider:(id)a4 reuseIdentifierProvider:(id)a5 cellConfigurationHandler:(id)a6 state:(id)a7 dataSource:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = (__UIDiffableDataSource *)a8;
  v32.receiver = self;
  v32.super_class = (Class)__UIDiffableDataSource;
  id v20 = [(__UIDiffableDataSource *)&v32 init];
  if (v20)
  {
    id v21 = [[_UIDiffableDataSourceViewUpdater alloc] initWithTableView:v14];
    viewUpdater = v20->_viewUpdater;
    v20->_viewUpdater = v21;

    uint64_t v23 = [v15 copy];
    id tableViewCellProvider = v20->_tableViewCellProvider;
    v20->_id tableViewCellProvider = (id)v23;

    uint64_t v25 = [v16 copy];
    id reuseIdentifierProvider = v20->_reuseIdentifierProvider;
    v20->_id reuseIdentifierProvider = (id)v25;

    uint64_t v27 = [v17 copy];
    id tableViewCellConfigurationHandler = v20->_tableViewCellConfigurationHandler;
    v20->_id tableViewCellConfigurationHandler = (id)v27;

    uint64_t v29 = (void *)[objc_alloc((Class)off_1E52D5498) initWithState:v18];
    [(__UIDiffableDataSource *)v20 _storeState:v29];

    objc_storeWeak((id *)&v20->_tableView, v14);
    _UIDiffableDataSourceCommonInit(v20);
    if (v19) {
      id v30 = v19;
    }
    else {
      id v30 = v20;
    }
    [v14 setDataSource:v30];
  }

  return v20;
}

- (void)_applyDifferencesFromSnapshot:(id)a3 toSection:(id)a4 animatingDifferences:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v13 = [(__UIDiffableDataSource *)self associatedSectionControllerForSectionIdentifier:v11];
  if (!v13)
  {
    uint64_t v13 = [[_UIDiffableDataSourceSectionControllerInternal alloc] initWithDiffableDataSourceImpl:self];
    [(__UIDiffableDataSource *)self addAssociatedSectionControllerIfNeeded:v13];
  }
  os_unfair_recursive_lock_unlock();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __98____UIDiffableDataSource__applyDifferencesFromSnapshot_toSection_animatingDifferences_completion___block_invoke;
  v18[3] = &unk_1E52E32E8;
  v18[4] = self;
  id v19 = v13;
  id v20 = v10;
  id v21 = v11;
  BOOL v23 = a5;
  id v22 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v13;
  -[__UIDiffableDataSource _performOnApplyQueue:]((atomic_ullong *)self, v18);
}

- (void)setExpandCollapseAnimationContext:(id)a3
{
}

- (void)_performApplyWithoutRebasingSectionSnapshots:(id)a3
{
  id v4 = (void (**)(void))a3;
  BOOL v5 = [(__UIDiffableDataSource *)self isApplyingWithoutRebasingSectionSnapshots];
  [(__UIDiffableDataSource *)self setIsApplyingWithoutRebasingSectionSnapshots:1];
  v4[2](v4);

  [(__UIDiffableDataSource *)self setIsApplyingWithoutRebasingSectionSnapshots:v5];
}

- (void)setIsApplyingWithoutRebasingSectionSnapshots:(BOOL)a3
{
  self->_isApplyingWithoutRebasingSectionSnapshots = a3;
}

- (void)addAssociatedSectionControllerIfNeeded:(id)a3
{
  id v4 = a3;
  sectionControllers = self->_sectionControllers;
  id v8 = v4;
  if (!sectionControllers)
  {
    id v6 = (NSHashTable *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:0 capacity:1];
    id v7 = self->_sectionControllers;
    self->_sectionControllers = v6;

    id v4 = v8;
    sectionControllers = self->_sectionControllers;
  }
  [(NSHashTable *)sectionControllers addObject:v4];
}

- (UICollectionView)_collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  return (UICollectionView *)WeakRetained;
}

- (void)setSectionSnapshotHandlers:(id)a3
{
}

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_105);
  }
}

- (void)reloadFromSnapshot:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56____UIDiffableDataSource_reloadFromSnapshot_completion___block_invoke;
  v10[3] = &unk_1E52E3298;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  -[__UIDiffableDataSource _performOnApplyQueue:]((atomic_ullong *)self, v10);
}

- (void)setCanReorderItemHandler:(id)a3
{
}

- (void)setDidApplySnapshotHandler:(id)a3
{
}

- (void)_performBatchApplyUsingReloadData:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void (**)(void))a3;
  if (!v5)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 800, @"Invalid parameter not satisfying: %@", @"block != NULL" object file lineNumber description];
  }
  if (pthread_main_np() != 1)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    id v18 = NSStringFromSelector(a2);
    [v17 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 801, @"%@ is only supported on the main queue", v18 object file lineNumber description];
  }
  if (self->_completionHandlersForBatchApply)
  {
    v5[2](v5);
  }
  else
  {
    id v6 = (NSMutableArray *)objc_opt_new();
    completionHandlersForBatchApply = self->_completionHandlersForBatchApply;
    self->_completionHandlersForBatchApply = v6;

    v5[2](v5);
    id v8 = [(__UIDiffableDataSource *)self viewUpdater];
    [v8 _reloadData];

    id v9 = self->_completionHandlersForBatchApply;
    id v10 = self->_completionHandlersForBatchApply;
    self->_completionHandlersForBatchApply = 0;

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = v9;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v19 + 1) + 8 * i) + 16))();
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }
  }
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  id v6 = [(_UIDiffableDataSourceState *)self->_state dataSourceSnapshot];
  id v7 = [(_UIDiffableDataSourceState *)self->_state sections];
  id v8 = [(_UIDiffableDataSourceState *)self->_state identifiers];
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p: sectionCounts=%@; sections=[%p]; identifiers=[%p]>",
    v5,
    self,
    v6,
    v7,
  id v9 = v8);

  return (NSString *)v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlersForBatchApply, 0);
  objc_storeStrong((id *)&self->_snapshotQueue, 0);
  objc_storeStrong((id *)&self->_applyQueue, 0);
  objc_storeStrong((id *)&self->_viewUpdater, 0);
  objc_storeStrong(&self->_collectionViewCellConfigurationHandler, 0);
  objc_storeStrong(&self->_reuseIdentifierProvider, 0);
  objc_storeStrong(&self->_tableViewCellConfigurationHandler, 0);
  objc_storeStrong((id *)&self->_sectionSnapshotHandlers, 0);
  objc_storeStrong(&self->_canReorderItemHandler, 0);
  objc_storeStrong(&self->_didApplySnapshotHandler, 0);
  objc_storeStrong(&self->_willApplySnapshotHandler, 0);
  objc_storeStrong((id *)&self->_reorderingHandlers, 0);
  objc_storeStrong(&self->_cellObserver, 0);
  objc_storeStrong(&self->_supplementaryViewConfigurationHandler, 0);
  objc_storeStrong(&self->_supplementaryReuseIdentifierProvider, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_destroyWeak((id *)&self->_viewUpdatesSink);
  objc_storeStrong(&self->_collectionViewCellProvider, 0);
  objc_storeStrong((id *)&self->_expandCollapseAnimationContext, 0);
  objc_storeStrong(&self->_supplementaryViewProvider, 0);
  objc_storeStrong(&self->_tableViewCellProvider, 0);
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_pendingReorderingTransaction, 0);
  objc_storeStrong((id *)&self->_sectionControllers, 0);
  objc_storeStrong(&self->_rendererIdentifierProvider, 0);
  objc_storeStrong((id *)&self->_rendererMap, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_destroyWeak((id *)&self->_tableView);
}

- (UITableView)tableView
{
  p_tableView = &self->_tableView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  BOOL v5 = [WeakRetained dataSource];

  if (v5 == self) {
    id v6 = objc_loadWeakRetained((id *)p_tableView);
  }
  else {
    id v6 = 0;
  }
  return (UITableView *)v6;
}

- (__UIDiffableDataSource)initWithState:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)__UIDiffableDataSource;
  BOOL v5 = [(__UIDiffableDataSource *)&v8 init];
  if (v5)
  {
    id v6 = (void *)[objc_alloc((Class)off_1E52D5498) initWithState:v4];
    [(__UIDiffableDataSource *)v5 _storeState:v6];

    _UIDiffableDataSourceCommonInit(v5);
  }

  return v5;
}

- (__UIDiffableDataSource)initWithViewUpdatesSink:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)__UIDiffableDataSource;
  BOOL v5 = [(__UIDiffableDataSource *)&v10 init];
  if (v5)
  {
    id v6 = [[_UIDiffableDataSourceViewUpdater alloc] initWithCollectionViewUpdatesSink:v4];
    viewUpdater = v5->_viewUpdater;
    v5->_viewUpdater = v6;

    id v8 = objc_alloc_init((Class)off_1E52D5498);
    [(__UIDiffableDataSource *)v5 _storeState:v8];

    _UIDiffableDataSourceCommonInit(v5);
  }

  return v5;
}

- (__UIDiffableDataSource)initWithCollectionView:(id)a3 sectionControllers:(id)a4 rendererIdentifierProvider:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)off_1E52D5498);
  uint64_t v12 = [(__UIDiffableDataSource *)self initWithCollectionView:v8 cellProvider:0 reuseIdentifierProvider:0 cellConfigurationHandler:0 state:v11 dataSource:0];

  uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D30]), "initWithOptions:capacity:", 0, objc_msgSend(v9, "count"));
  sectionControllers = v12->_sectionControllers;
  v12->_sectionControllers = (NSHashTable *)v13;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = v9;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_msgSend(v20, "setDataSource:", v12, (void)v23);
        long long v21 = [v20 itemRenderers];
        [(__UIDiffableDataSource *)v12 _registerItemRenderers:v21 rendererIdentifierProvider:v10];

        [(NSHashTable *)v12->_sectionControllers addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v17);
  }

  return v12;
}

- (__UIDiffableDataSource)initWithCollectionView:(id)a3 itemRenderers:(id)a4 rendererIdentifierProvider:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)off_1E52D5498);
  uint64_t v12 = [(__UIDiffableDataSource *)self initWithCollectionView:v10 cellProvider:0 reuseIdentifierProvider:0 cellConfigurationHandler:0 state:v11 dataSource:0];

  [(__UIDiffableDataSource *)v12 _registerItemRenderers:v9 rendererIdentifierProvider:v8];
  return v12;
}

- (__UIDiffableDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4 dataSource:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)off_1E52D5498);
  uint64_t v12 = [(__UIDiffableDataSource *)self initWithCollectionView:v10 cellProvider:v9 reuseIdentifierProvider:0 cellConfigurationHandler:0 state:v11 dataSource:v8];

  return v12;
}

- (__UIDiffableDataSource)initWithCollectionView:(id)a3 reuseIdentifierProvider:(id)a4 cellConfigurationHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)off_1E52D5498);
  uint64_t v12 = [(__UIDiffableDataSource *)self initWithCollectionView:v10 cellProvider:0 reuseIdentifierProvider:v9 cellConfigurationHandler:v8 state:v11 dataSource:0];

  return v12;
}

- (UICollectionView)collectionView
{
  p_collectionView = &self->_collectionView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  BOOL v5 = [WeakRetained dataSource];

  if (v5 == self) {
    id v6 = objc_loadWeakRetained((id *)p_collectionView);
  }
  else {
    id v6 = 0;
  }
  return (UICollectionView *)v6;
}

- (__UIDiffableDataSource)initWithTableView:(id)a3 reuseIdentifierProvider:(id)a4 cellConfigurationHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)off_1E52D5498);
  uint64_t v12 = [(__UIDiffableDataSource *)self initWithTableView:v10 cellProvider:0 reuseIdentifierProvider:v9 cellConfigurationHandler:v8 state:v11 dataSource:0];

  return v12;
}

- (UICollectionViewDiffableDataSourceSectionSnapshotHandlers)sectionSnapshotHandlers
{
  sectionSnapshotHandlers = self->_sectionSnapshotHandlers;
  if (!sectionSnapshotHandlers)
  {
    id v4 = objc_alloc_init(UICollectionViewDiffableDataSourceSectionSnapshotHandlers);
    BOOL v5 = self->_sectionSnapshotHandlers;
    self->_sectionSnapshotHandlers = v4;

    sectionSnapshotHandlers = self->_sectionSnapshotHandlers;
  }
  return sectionSnapshotHandlers;
}

- (BOOL)_isDiffableDataSource
{
  return 1;
}

- (int64_t)numberOfItems
{
  return [(_UIDiffableDataSourceState *)self->_state numberOfItems];
}

- (NSArray)sectionIdentifiers
{
  return (NSArray *)[(_UIDiffableDataSourceState *)self->_state sectionIdentifiers];
}

- (NSArray)itemIdentifiers
{
  return (NSArray *)[(_UIDiffableDataSourceState *)self->_state itemIdentifiers];
}

- (NSArray)reloadedSectionIdentifiers
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)reloadedItemIdentifiers
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)reconfiguredItemIdentifiers
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (id)itemIdentifiersInSectionWithIdentifier:(id)a3
{
  return (id)[(_UIDiffableDataSourceState *)self->_state itemIdentifiersInSectionWithIdentifier:a3];
}

- (int64_t)indexOfItemIdentifier:(id)a3
{
  return [(_UIDiffableDataSourceState *)self->_state indexOfItemIdentifier:a3];
}

- (int64_t)indexOfSectionIdentifier:(id)a3
{
  return [(_UIDiffableDataSourceState *)self->_state indexOfSectionIdentifier:a3];
}

- (void)appendItemsWithIdentifiers:(id)a3
{
}

- (void)appendItemsWithIdentifiers:(id)a3 intoSectionWithIdentifier:(id)a4
{
  state = self->_state;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(_UIDiffableDataSourceState *)state dataSourceSnapshot];
  uint64_t v11 = [v10 numberOfSections];

  if (v11 <= 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"_UIDiffableDataSourceImpl.m" lineNumber:386 description:@"There are currently no sections in the data source. Please add a section first."];
  }
  id v13 = [(__UIDiffableDataSource *)self snapshot];
  [v13 appendItemsWithIdentifiers:v9 intoSectionWithIdentifier:v8];

  [(__UIDiffableDataSource *)self applyDifferencesFromSnapshot:v13];
}

- (void)insertItemsWithIdentifiers:(id)a3 beforeItemWithIdentifier:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (v11)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 394, @"Invalid parameter not satisfying: %@", @"identifiers" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 395, @"Invalid parameter not satisfying: %@", @"destinationIdentifier" object file lineNumber description];

LABEL_3:
  id v8 = [(__UIDiffableDataSource *)self snapshot];
  [v8 insertItemsWithIdentifiers:v11 beforeItemWithIdentifier:v7];
  [(__UIDiffableDataSource *)self applyDifferencesFromSnapshot:v8];
}

- (void)insertItemsWithIdentifiers:(id)a3 afterItemWithIdentifier:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (v11)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 403, @"Invalid parameter not satisfying: %@", @"identifiers" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 404, @"Invalid parameter not satisfying: %@", @"destinationIdentifier" object file lineNumber description];

LABEL_3:
  id v8 = [(__UIDiffableDataSource *)self snapshot];
  [v8 insertItemsWithIdentifiers:v11 afterItemWithIdentifier:v7];
  [(__UIDiffableDataSource *)self applyDifferencesFromSnapshot:v8];
}

- (void)deleteItemsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(__UIDiffableDataSource *)self snapshot];
  [v5 deleteItemsWithIdentifiers:v4];

  [(__UIDiffableDataSource *)self applyDifferencesFromSnapshot:v5];
}

- (void)deleteAllItems
{
  id v3 = [(__UIDiffableDataSource *)self emptySnapshot];
  [(__UIDiffableDataSource *)self applyDifferencesFromSnapshot:v3];
}

- (void)moveItemWithIdentifier:(id)a3 beforeItemWithIdentifier:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (v11)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 423, @"Invalid parameter not satisfying: %@", @"fromIdentifier" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 424, @"Invalid parameter not satisfying: %@", @"toIdentifier" object file lineNumber description];

LABEL_3:
  id v8 = [(__UIDiffableDataSource *)self snapshot];
  [v8 moveItemWithIdentifier:v11 beforeItemWithIdentifier:v7];
  [(__UIDiffableDataSource *)self applyDifferencesFromSnapshot:v8];
}

- (void)moveItemWithIdentifier:(id)a3 afterItemWithIdentifier:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (v11)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 432, @"Invalid parameter not satisfying: %@", @"fromIdentifier" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 433, @"Invalid parameter not satisfying: %@", @"toIdentifier" object file lineNumber description];

LABEL_3:
  id v8 = [(__UIDiffableDataSource *)self snapshot];
  [v8 moveItemWithIdentifier:v11 afterItemWithIdentifier:v7];
  [(__UIDiffableDataSource *)self applyDifferencesFromSnapshot:v8];
}

- (void)reloadItemsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(__UIDiffableDataSource *)self snapshot];
  [v5 reloadItemsWithIdentifiers:v4];

  [(__UIDiffableDataSource *)self applyDifferencesFromSnapshot:v5];
}

- (void)reconfigureItemsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(__UIDiffableDataSource *)self snapshot];
  [v5 reconfigureItemsWithIdentifiers:v4];

  [(__UIDiffableDataSource *)self applyDifferencesFromSnapshot:v5];
}

- (void)appendSectionsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(__UIDiffableDataSource *)self snapshot];
  [v5 appendSectionsWithIdentifiers:v4];

  [(__UIDiffableDataSource *)self applyDifferencesFromSnapshot:v5];
}

- (void)insertSectionsWithIdentifiers:(id)a3 beforeSectionWithIdentifier:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (v11)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 461, @"Invalid parameter not satisfying: %@", @"sectionIdentifiers" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 462, @"Invalid parameter not satisfying: %@", @"toSectionIdentifier" object file lineNumber description];

LABEL_3:
  id v8 = [(__UIDiffableDataSource *)self snapshot];
  [v8 insertSectionsWithIdentifiers:v11 beforeSectionWithIdentifier:v7];
  [(__UIDiffableDataSource *)self applyDifferencesFromSnapshot:v8];
}

- (void)insertSectionsWithIdentifiers:(id)a3 afterSectionWithIdentifier:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (v11)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 470, @"Invalid parameter not satisfying: %@", @"sectionIdentifiers" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 471, @"Invalid parameter not satisfying: %@", @"toSectionIdentifier" object file lineNumber description];

LABEL_3:
  id v8 = [(__UIDiffableDataSource *)self snapshot];
  [v8 insertSectionsWithIdentifiers:v11 afterSectionWithIdentifier:v7];
  [(__UIDiffableDataSource *)self applyDifferencesFromSnapshot:v8];
}

- (void)deleteSectionsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(__UIDiffableDataSource *)self snapshot];
  [v5 deleteSectionsWithIdentifiers:v4];

  [(__UIDiffableDataSource *)self applyDifferencesFromSnapshot:v5];
}

- (void)moveSectionWithIdentifier:(id)a3 beforeSectionWithIdentifier:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (v11)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 485, @"Invalid parameter not satisfying: %@", @"fromSectionIdentifier" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 486, @"Invalid parameter not satisfying: %@", @"toSectionIdentifier" object file lineNumber description];

LABEL_3:
  id v8 = [(__UIDiffableDataSource *)self snapshot];
  [v8 moveSectionWithIdentifier:v11 beforeSectionWithIdentifier:v7];
  [(__UIDiffableDataSource *)self applyDifferencesFromSnapshot:v8];
}

- (void)moveSectionWithIdentifier:(id)a3 afterSectionWithIdentifier:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (v11)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 494, @"Invalid parameter not satisfying: %@", @"fromSectionIdentifier" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 495, @"Invalid parameter not satisfying: %@", @"toSectionIdentifier" object file lineNumber description];

LABEL_3:
  id v8 = [(__UIDiffableDataSource *)self snapshot];
  [v8 moveSectionWithIdentifier:v11 afterSectionWithIdentifier:v7];
  [(__UIDiffableDataSource *)self applyDifferencesFromSnapshot:v8];
}

- (void)reloadSectionsWithIdentifiers:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 503, @"Invalid parameter not satisfying: %@", @"sectionIdentifiers" object file lineNumber description];
  }
  id v5 = [(__UIDiffableDataSource *)self snapshot];
  [v5 reloadSectionsWithIdentifiers:v7];
  [(__UIDiffableDataSource *)self applyDifferencesFromSnapshot:v5];
}

- (void)appendSectionWithIdentifier:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 513, @"Invalid parameter not satisfying: %@", @"sectionIdentifier" object file lineNumber description];
  }
  id v6 = [(__UIDiffableDataSource *)self snapshot];
  v9[0] = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v6 appendSectionsWithIdentifiers:v7];

  [(__UIDiffableDataSource *)self applyDifferencesFromSnapshot:v6];
}

- (void)insertSectionWithIdentifier:(id)a3 beforeSectionWithIdentifier:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 521, @"Invalid parameter not satisfying: %@", @"sectionIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 522, @"Invalid parameter not satisfying: %@", @"toSectionIdentifier" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  id v10 = [(__UIDiffableDataSource *)self snapshot];
  v14[0] = v7;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v10 insertSectionsWithIdentifiers:v11 beforeSectionWithIdentifier:v9];

  [(__UIDiffableDataSource *)self applyDifferencesFromSnapshot:v10];
}

- (void)insertSectionWithIdentifier:(id)a3 afterSectionWithIdentifier:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 530, @"Invalid parameter not satisfying: %@", @"sectionIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 531, @"Invalid parameter not satisfying: %@", @"toSectionIdentifier" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  id v10 = [(__UIDiffableDataSource *)self snapshot];
  v14[0] = v7;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v10 insertSectionsWithIdentifiers:v11 afterSectionWithIdentifier:v9];

  [(__UIDiffableDataSource *)self applyDifferencesFromSnapshot:v10];
}

- (int64_t)indexForSectionIdentifier:(id)a3
{
  return [(_UIDiffableDataSourceState *)self->_state indexForSectionIdentifier:a3];
}

- (id)emptySnapshot
{
  id v2 = objc_alloc_init((Class)off_1E52D64D8);
  return v2;
}

- (void)applyDifferencesFromSnapshot:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55____UIDiffableDataSource_applyDifferencesFromSnapshot___block_invoke;
  v6[3] = &unk_1E52D9F98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[__UIDiffableDataSource _performOnApplyQueue:]((atomic_ullong *)self, v6);
}

- (void)applyDifferencesFromSnapshot:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66____UIDiffableDataSource_applyDifferencesFromSnapshot_completion___block_invoke;
  v10[3] = &unk_1E52E3298;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  -[__UIDiffableDataSource _performOnApplyQueue:]((atomic_ullong *)self, v10);
}

- (void)reloadFromSnapshot:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45____UIDiffableDataSource_reloadFromSnapshot___block_invoke;
  v6[3] = &unk_1E52D9F98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[__UIDiffableDataSource _performOnApplyQueue:]((atomic_ullong *)self, v6);
}

- (void)applyDifferencesFromSnapshot:(id)a3 animatingDifferences:(BOOL)a4
{
}

- (void)_onApplyQueue_applyDifferencesFromSnapshot:(id)a3 viewPropertyAnimator:(id)a4 customAnimationsProvider:(id)a5
{
}

- (int64_t)tableViewDefaultRowAnimation
{
  id v2 = [(__UIDiffableDataSource *)self viewUpdater];
  int64_t v3 = [v2 tableViewRowAnimation];

  return v3;
}

- (void)_applyDifferencesFromSnapshot:(id)a3 customAnimationsProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81____UIDiffableDataSource__applyDifferencesFromSnapshot_customAnimationsProvider___block_invoke;
  v10[3] = &unk_1E52E3298;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  -[__UIDiffableDataSource _performOnApplyQueue:]((atomic_ullong *)self, v10);
}

- (void)_applyDifferencesFromSnapshot:(id)a3 viewPropertyAnimator:(id)a4 customAnimationsProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __102____UIDiffableDataSource__applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider___block_invoke;
  v14[3] = &unk_1E52DC7E8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  -[__UIDiffableDataSource _performOnApplyQueue:]((atomic_ullong *)self, v14);
}

- (id)snapshotForSection:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  id v5 = [(__UIDiffableDataSource *)self associatedSectionControllerForSectionIdentifier:v4];
  id v6 = v5;
  if (v5
    && ([v5 _extantMutableSnapshotForSection:v4],
        (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v8 = v7;
    id v9 = (NSDiffableDataSourceSectionSnapshot *)[v7 copy];

    os_unfair_recursive_lock_unlock();
    if (v9) {
      goto LABEL_13;
    }
  }
  else
  {
    os_unfair_recursive_lock_unlock();
  }
  id v10 = [(__UIDiffableDataSource *)self snapshot];
  if ([v10 indexOfSectionIdentifier:v4] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = [v10 itemIdentifiersInSectionWithIdentifier:v4];
    if ([v11 count])
    {
      id v9 = objc_alloc_init(NSDiffableDataSourceSectionSnapshot);
      [(NSDiffableDataSourceSectionSnapshot *)v9 appendItems:v11];

      if (v9) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
LABEL_12:
  id v9 = objc_alloc_init(NSDiffableDataSourceSectionSnapshot);
LABEL_13:

  return v9;
}

- (id)_snapshotForSection:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  id v5 = [(__UIDiffableDataSource *)self associatedSectionControllerForSectionIdentifier:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 snapshotForSection:v4];
    os_unfair_recursive_lock_unlock();
    if (v7) {
      goto LABEL_6;
    }
  }
  else
  {
    os_unfair_recursive_lock_unlock();
  }
  id v7 = objc_alloc_init(NSDiffableDataSourceSectionSnapshot);
LABEL_6:

  return v7;
}

- (void)_registerItemRenderers:(id)a3 rendererIdentifierProvider:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!self->_rendererIdentifierProvider)
  {
    id v9 = (void *)[v7 copy];
    id rendererIdentifierProvider = self->_rendererIdentifierProvider;
    self->_id rendererIdentifierProvider = v9;
  }
  uint64_t v27 = v8;
  if (!self->_rendererMap)
  {
    id v11 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    rendererMap = self->_rendererMap;
    self->_rendererMap = v11;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        long long v19 = [v18 rendererIdentifier];
        if (!v19)
        {
          long long v23 = [MEMORY[0x1E4F28B00] currentHandler];
          [v23 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 1156, @"Invalid parameter not satisfying: %@", @"rendererIdentifier" object file lineNumber description];
        }
        [(NSMapTable *)self->_rendererMap setObject:v18 forKey:v19];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
        uint64_t v21 = [v18 cellClass];
        long long v22 = [v18 cellReuseIdentifier];
        [WeakRetained registerClass:v21 forCellWithReuseIdentifier:v22];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v15);
  }

  if (!self->_collectionViewCellProvider)
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __76____UIDiffableDataSource__registerItemRenderers_rendererIdentifierProvider___block_invoke;
    aBlock[3] = &unk_1E52E33B0;
    objc_copyWeak(&v29, &location);
    long long v24 = _Block_copy(aBlock);
    id collectionViewCellProvider = self->_collectionViewCellProvider;
    self->_id collectionViewCellProvider = v24;

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
}

- (BOOL)canMoveItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(__UIDiffableDataSource *)self reorderingHandlers];
  id v6 = [v5 canReorderItemHandler];

  if (!v6)
  {
    id v11 = [(__UIDiffableDataSource *)self canReorderItemHandler];

    if (!v11)
    {
      char v10 = 0;
      goto LABEL_10;
    }
    id v7 = [(__UIDiffableDataSource *)self itemIdentifierForIndexPath:v4];
    if (v7)
    {
      id v8 = [(__UIDiffableDataSource *)self canReorderItemHandler];
      char v10 = ((uint64_t (**)(void, void *))v8)[2](v8, v7);
      goto LABEL_7;
    }
LABEL_8:
    char v10 = 0;
    goto LABEL_9;
  }
  id v7 = [(__UIDiffableDataSource *)self itemIdentifierForIndexPath:v4];
  if (!v7) {
    goto LABEL_8;
  }
  id v8 = [(__UIDiffableDataSource *)self reorderingHandlers];
  id v9 = [v8 canReorderItemHandler];
  char v10 = ((uint64_t (**)(void, void *))v9)[2](v9, v7);

LABEL_7:
LABEL_9:

LABEL_10:
  return v10;
}

- (void)_willBeginReorderingForItemAtIndexPath:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(__UIDiffableDataSource *)self itemIdentifierForIndexPath:a3];
  if (v4)
  {
    id v5 = [(__UIDiffableDataSource *)self sectionIdentifierForSectionContainingItemIdentifier:v4];
    if (v5)
    {
      id v6 = [(__UIDiffableDataSource *)self associatedSectionControllerForSectionIdentifier:v5];
      id v7 = v6;
      if (v6)
      {
        id v8 = [v6 _extantMutableSnapshotForSection:v5];
        id v9 = v8;
        if (v8 && [v8 isExpanded:v4])
        {
          char v10 = [v7 _extantMutableSnapshotForSection:v5];
          id v11 = (void *)[v10 copy];

          if (v11)
          {
            v13[0] = v4;
            id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
            [v11 collapseItems:v12];

            [(__UIDiffableDataSource *)self applySnapshot:v11 toSection:v5 animatingDifferences:1 completion:0];
          }
        }
      }
    }
  }
}

- (void)_commitReorderingForItemAtIndexPath:(id)a3 toDestinationIndexPath:(id)a4
{
}

- (void)_commitReorderingForItemAtIndexPath:(id)a3 toDestinationIndexPath:(id)a4 shouldPerformViewAnimations:(BOOL)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v14 = [[UICollectionViewUpdateItem alloc] initWithInitialIndexPath:v9 finalIndexPath:v8 updateAction:3];

  char v10 = [(__UIDiffableDataSource *)self _reorderingTransactionForReorderingUpdate:v14];
  pendingReorderingTransaction = self->_pendingReorderingTransaction;
  self->_pendingReorderingTransaction = v10;

  id v12 = [(NSDiffableDataSourceTransaction *)self->_pendingReorderingTransaction finalSnapshot];
  self->_BOOL pendingReorderingTransactionShouldPerformViewAnimations = a5;
  id v13 = [v12 impl];
  [(__UIDiffableDataSource *)self applyDifferencesFromSnapshot:v13 animatingDifferences:1];
}

- (id)_reorderingTransactionForReorderingUpdate:(id)a3
{
  id v5 = a3;
  id v6 = (void *)[objc_alloc((Class)off_1E52D2BB8) initWithState:self->_state];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68____UIDiffableDataSource__reorderingTransactionForReorderingUpdate___block_invoke;
  aBlock[3] = &unk_1E52E33D8;
  id v12 = v6;
  SEL v13 = a2;
  void aBlock[4] = self;
  id v7 = v6;
  id v8 = _Block_copy(aBlock);
  id v9 = +[NSDiffableDataSourceTransaction _computeReorderingTransactionWithInitialSnapshot:v7 reorderingUpdate:v5 sectionSnapshotProvider:v8];

  return v9;
}

- (NSArray)sectionControllers
{
  sectionControllers = self->_sectionControllers;
  if (sectionControllers)
  {
    int64_t v3 = [(NSHashTable *)sectionControllers allObjects];
  }
  else
  {
    int64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v3;
}

- (BOOL)sectionController:(id)a3 shouldExpandItem:(id)a4
{
  id v5 = a4;
  id v6 = [(__UIDiffableDataSource *)self sectionSnapshotHandlers];
  id v7 = [v6 shouldExpandItemHandler];

  if (v7)
  {
    id v8 = [(__UIDiffableDataSource *)self sectionSnapshotHandlers];
    id v9 = [v8 shouldExpandItemHandler];
    char v10 = ((uint64_t (**)(void, id))v9)[2](v9, v5);
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (void)sectionController:(id)a3 willExpandItem:(id)a4
{
  id v9 = a4;
  id v5 = [(__UIDiffableDataSource *)self sectionSnapshotHandlers];
  id v6 = [v5 willExpandItemHandler];

  if (v6)
  {
    id v7 = [(__UIDiffableDataSource *)self sectionSnapshotHandlers];
    id v8 = [v7 willExpandItemHandler];
    ((void (**)(void, id))v8)[2](v8, v9);
  }
}

- (BOOL)sectionController:(id)a3 shouldCollapseItem:(id)a4
{
  id v5 = a4;
  id v6 = [(__UIDiffableDataSource *)self sectionSnapshotHandlers];
  id v7 = [v6 shouldCollapseItemHandler];

  if (v7)
  {
    id v8 = [(__UIDiffableDataSource *)self sectionSnapshotHandlers];
    id v9 = [v8 shouldCollapseItemHandler];
    char v10 = ((uint64_t (**)(void, id))v9)[2](v9, v5);
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (void)sectionController:(id)a3 willCollapseItem:(id)a4
{
  id v9 = a4;
  id v5 = [(__UIDiffableDataSource *)self sectionSnapshotHandlers];
  id v6 = [v5 willCollapseItemHandler];

  if (v6)
  {
    id v7 = [(__UIDiffableDataSource *)self sectionSnapshotHandlers];
    id v8 = [v7 willCollapseItemHandler];
    ((void (**)(void, id))v8)[2](v8, v9);
  }
}

- (BOOL)sectionController:(id)a3 shouldQueryForSnapshotForExpandingParentItem:(id)a4
{
  id v4 = [(__UIDiffableDataSource *)self sectionSnapshotHandlers];
  id v5 = [v4 snapshotForExpandingParentItemHandler];
  BOOL v6 = v5 != 0;

  return v6;
}

- (id)sectionController:(id)a3 snapshotForExpandingParentItem:(id)a4 currentSectionSnapshot:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(__UIDiffableDataSource *)self sectionSnapshotHandlers];
  char v10 = [v9 snapshotForExpandingParentItemHandler];

  id v11 = v8;
  if (v10)
  {
    id v12 = [(__UIDiffableDataSource *)self sectionSnapshotHandlers];
    SEL v13 = [v12 snapshotForExpandingParentItemHandler];
    id v11 = ((void (**)(void, id, id))v13)[2](v13, v7, v8);
  }
  return v11;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v7 = [(_UIDiffableDataSourceState *)self->_state dataSourceSnapshot];
  int64_t v8 = [v7 numberOfSections];

  if (v8 <= a4)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 1640, @"Invalid parameter not satisfying: %@", @"section < [_state.dataSourceSnapshot numberOfSections]" object file lineNumber description];
  }
  id v9 = [(_UIDiffableDataSourceState *)self->_state dataSourceSnapshot];
  int64_t v10 = [v9 numberOfItemsInSection:a4];

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(__UIDiffableDataSource *)self tableViewCellProvider];
  if (v9) {
    goto LABEL_5;
  }
  uint64_t v10 = [(__UIDiffableDataSource *)self tableViewCellConfigurationHandler];
  if (!v10
    || (id v11 = (void *)v10,
        [(__UIDiffableDataSource *)self reuseIdentifierProvider],
        id v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        !v12))
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 1646, @"Invalid parameter not satisfying: %@", @"self.tableViewCellProvider || (self.tableViewCellConfigurationHandler && self.reuseIdentifierProvider)" object file lineNumber description];
LABEL_5:
  }
  SEL v13 = [(__UIDiffableDataSource *)self itemIdentifierForIndexPath:v8];
  if (!v13)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 1649, @"Invalid parameter not satisfying: %@", @"itemIdentifier" object file lineNumber description];
  }
  uint64_t v14 = [(__UIDiffableDataSource *)self tableViewCellProvider];

  if (v14)
  {
    uint64_t v15 = [(__UIDiffableDataSource *)self tableViewCellProvider];
    uint64_t v16 = ((void (**)(void, id, id, void *))v15)[2](v15, v7, v8, v13);

    if (v16) {
      goto LABEL_15;
    }
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 1654, @"UITableViewDiffableDataSource cell provider returned nil for index path %@ with item identifier '%@', which is not allowed. You must always return a cell to the table view: %@", v8, v13, v7 object file lineNumber description];
  }
  else
  {
    uint64_t v18 = [(__UIDiffableDataSource *)self reuseIdentifierProvider];
    id v17 = ((void (**)(void, void *))v18)[2](v18, v13);

    if (!v17)
    {
      long long v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceImpl.m", 1657, @"Invalid parameter not satisfying: %@", @"reuseIdentifier" object file lineNumber description];
    }
    uint64_t v16 = [v7 dequeueReusableCellWithIdentifier:v17];
    long long v19 = [(__UIDiffableDataSource *)self tableViewCellConfigurationHandler];
    ((void (**)(void, void *, void *))v19)[2](v19, v16, v13);
  }
LABEL_15:

  return v16;
}

- (int64_t)_numberOfRowsInSection:(int64_t)a3 tableView:(id)a4
{
  return [(__UIDiffableDataSource *)self tableView:a4 numberOfRowsInSection:a3];
}

- (id)_cellForRowAtIndexPath:(id)a3 tableView:(id)a4
{
  return [(__UIDiffableDataSource *)self tableView:a4 cellForRowAtIndexPath:a3];
}

- (id)tableViewCellProvider
{
  return self->_tableViewCellProvider;
}

- (void)setTableViewCellProvider:(id)a3
{
}

- (_UICollectionViewUpdateItemApplying)viewUpdatesSink
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewUpdatesSink);
  return (_UICollectionViewUpdateItemApplying *)WeakRetained;
}

- (void)setState:(id)a3
{
}

- (id)supplementaryReuseIdentifierProvider
{
  return self->_supplementaryReuseIdentifierProvider;
}

- (void)setSupplementaryReuseIdentifierProvider:(id)a3
{
}

- (id)supplementaryViewConfigurationHandler
{
  return self->_supplementaryViewConfigurationHandler;
}

- (void)setSupplementaryViewConfigurationHandler:(id)a3
{
}

- (id)cellObserver
{
  return self->_cellObserver;
}

- (void)setWillApplySnapshotHandler:(id)a3
{
}

- (id)tableViewCellConfigurationHandler
{
  return self->_tableViewCellConfigurationHandler;
}

- (void)setTableViewCellConfigurationHandler:(id)a3
{
}

- (id)reuseIdentifierProvider
{
  return self->_reuseIdentifierProvider;
}

- (void)setReuseIdentifierProvider:(id)a3
{
}

- (id)collectionViewCellConfigurationHandler
{
  return self->_collectionViewCellConfigurationHandler;
}

- (void)setCollectionViewCellConfigurationHandler:(id)a3
{
}

- (void)setViewUpdater:(id)a3
{
}

- (NSMutableArray)completionHandlersForBatchApply
{
  return self->_completionHandlersForBatchApply;
}

- (void)setCompletionHandlersForBatchApply:(id)a3
{
}

- (void)validateIdentifiers
{
  id v2 = [(__UIDiffableDataSource *)self state];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    [v2 sections];
    objc_claimAutoreleasedReturnValue();
    _UIDiffableDataSourceValidateIdentifiers();
  }
  [v2 validateIdentifiers];
}

@end