@interface _UIDiffableDataSourceSectionController
- (BOOL)_performDisclosureAction:(unint64_t)a3 forItem:(id)a4;
- (BOOL)_queryClientShouldCollapseItem:(id)a3;
- (BOOL)_queryClientShouldExpandItem:(id)a3;
- (BOOL)_queryClientShouldQueryForSnapshotForExpandingParentItem:(id)a3;
- (BOOL)_shouldPerformCustomCollapseExpandAnimationsForInitialSnapshot:(id)a3 finalSnapshot:(id)a4;
- (BOOL)_snapshotHasExpandOrCollapseUpdates:(id)a3;
- (NSArray)itemRenderers;
- (NSSet)associatedSectionIdentifiers;
- (_UIDiffableDataSourceSectionController)initWithDiffableDataSource:(id)a3;
- (_UIDiffableDataSourceSectionController)initWithDiffableDataSourceImpl:(id)a3;
- (_UIDiffableDataSourceSectionController)initWithItemRenderers:(id)a3;
- (_UIDiffableDataSourceSectionController)initWithItemRenderers:(id)a3 associatedSectionIdentifiers:(id)a4;
- (_UIDiffableDataSourceSectionController)initWithItemRenderers:(id)a3 associatedSectionIdentifiers:(id)a4 snapshotsMap:(id)a5 dataSource:(id)a6;
- (_UIDiffableDataSourceSectionControllerDelegate)delegate;
- (_UIDiffableDataSourceSectionControllerHandlers)handlers;
- (id)_collectionView;
- (id)_expandCollapseAnimationContextForCollectionView:(id)a3;
- (id)_extantMutableSnapshotForItem:(id)a3;
- (id)_extantMutableSnapshotForSection:(id)a3;
- (id)_queryClientSnapshotForExpandingParentItemForItem:(id)a3 currentSectionSnapshot:(id)a4;
- (id)_sectionIdentifierForItem:(id)a3;
- (id)_snapshotForSectionContainingItem:(id)a3;
- (id)_snapshotsMap;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataSource;
- (id)snapshotForItem:(id)a3;
- (id)snapshotForSection:(id)a3;
- (void)__applySnapshot:(id)a3 toSection:(id)a4 animatingDifferences:(BOOL)a5 viewPropertyAnimator:(id)a6 animationsProvider:(id)a7 isOnDiffableApplyQueue:(BOOL)a8 completion:(id)a9;
- (void)_applySnapshot:(id)a3 toSection:(id)a4 animatingDifferences:(BOOL)a5 viewPropertyAnimator:(id)a6 animationsProvider:(id)a7 isOnDiffableApplyQueue:(BOOL)a8 completion:(id)a9;
- (void)_configureCell:(id)a3 forItem:(id)a4 inSnapshot:(id)a5;
- (void)_configureForItemRenderersIfNeeded:(id)a3;
- (void)_queryClientWillCollapseItem:(id)a3;
- (void)_queryClientWillExpandItem:(id)a3;
- (void)_updatePreparedCellsForExpansionStateWithSnapshot:(id)a3;
- (void)_updateSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)applySnapshot:(id)a3 toSection:(id)a4 animatingDifferences:(BOOL)a5;
- (void)applySnapshot:(id)a3 toSection:(id)a4 animatingDifferences:(BOOL)a5 completion:(id)a6;
- (void)applySnapshot:(id)a3 toSection:(id)a4 customAnimationsProvider:(id)a5;
- (void)applySnapshot:(id)a3 toSection:(id)a4 viewPropertyAnimator:(id)a5 customAnimationsProvider:(id)a6;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHandlers:(id)a3;
@end

@implementation _UIDiffableDataSourceSectionController

- (id)_snapshotForSectionContainingItem:(id)a3
{
  id v4 = a3;
  v5 = [(_UIDiffableDataSourceSectionController *)self dataSource];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 snapshot];
    uint64_t v8 = [v7 sectionIdentifierForSectionContainingItemIdentifier:v4];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [(_UIDiffableDataSourceSectionController *)self snapshotForSection:v8];

      if (v10) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  v10 = objc_alloc_init(NSDiffableDataSourceSectionSnapshot);
LABEL_7:

  return v10;
}

- (id)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return WeakRetained;
}

- (id)snapshotForSection:(id)a3
{
  v3 = [(_UIDiffableDataSourceSectionController *)self _extantMutableSnapshotForSection:a3];
  id v4 = (void *)[v3 copy];
  v5 = v4;
  if (v4) {
    v6 = v4;
  }
  else {
    v6 = objc_alloc_init(NSDiffableDataSourceSectionSnapshot);
  }
  v7 = v6;

  return v7;
}

- (id)_extantMutableSnapshotForSection:(id)a3
{
  return [(NSMapTable *)self->_snapshotsMap objectForKey:a3];
}

- (void)_updateSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (!v7)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"UIDiffableDataSourceSectionController.m", 468, @"Invalid parameter not satisfying: %@", @"sectionIdentifier" object file lineNumber description];
  }
  snapshotsMap = self->_snapshotsMap;
  if (v10) {
    [(NSMapTable *)snapshotsMap setObject:v10 forKey:v7];
  }
  else {
    [(NSMapTable *)snapshotsMap removeObjectForKey:v7];
  }
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UIDiffableDataSourceSectionController *)self _snapshotForSectionContainingItem:v6];
  [(_UIDiffableDataSourceSectionController *)self _configureCell:v7 forItem:v6 inSnapshot:v8];
}

- (void)_configureCell:(id)a3 forItem:(id)a4 inSnapshot:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v8;
    [v11 _setItemIdentifier:v9];
    if ([v10 containsItem:v9])
    {
      uint64_t v12 = [v10 levelForItem:v9];
      v13 = [v11 _layoutAttributes];
      -[UICollectionViewLayoutAttributes _existingListAttributes](v13);
      v14 = (unsigned char *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        uint64_t v15 = v12 <= 1 ? 1 : v12;
        uint64_t v16 = v15 - 1;
        if (v14[8]) {
          uint64_t v12 = v16;
        }
      }
      [v11 _setDefaultIndentationLevel:v12];
      objc_msgSend(v11, "_setExpanded:", objc_msgSend(v10, "isExpanded:", v9));
      v17 = [v10 parentOfChildItem:v9];
      if (v17)
      {
        v18 = [(_UIDiffableDataSourceSectionController *)self dataSource];
        v19 = [v18 indexPathForItemIdentifier:v17];
        if (v19)
        {
          [v18 _collectionView];
          v20 = v22 = v14;
          v21 = [v20 cellForItemAtIndexPath:v19];

          v14 = v22;
        }
        else
        {
          v21 = 0;
        }
      }
      else
      {
        v21 = 0;
      }
      [v11 _setParentFocusItem:v21];
    }
    objc_initWeak(&location, self);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __76___UIDiffableDataSourceSectionController__configureCell_forItem_inSnapshot___block_invoke;
    v23[3] = &unk_1E52F0888;
    objc_copyWeak(&v24, &location);
    [v11 _setDisclosureActionHandler:v23];
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

- (id)_snapshotsMap
{
  return self->_snapshotsMap;
}

- (_UIDiffableDataSourceSectionController)initWithDiffableDataSource:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = [v4 set];
  id v7 = [v5 _diffableDataSourceImpl];

  id v8 = [(_UIDiffableDataSourceSectionController *)self initWithItemRenderers:MEMORY[0x1E4F1CBF0] associatedSectionIdentifiers:v6 snapshotsMap:0 dataSource:v7];
  return v8;
}

- (void)applySnapshot:(id)a3 toSection:(id)a4 animatingDifferences:(BOOL)a5
{
}

- (void)__applySnapshot:(id)a3 toSection:(id)a4 animatingDifferences:(BOOL)a5 viewPropertyAnimator:(id)a6 animationsProvider:(id)a7 isOnDiffableApplyQueue:(BOOL)a8 completion:(id)a9
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (!WeakRetained) {
    goto LABEL_12;
  }
  if (v16)
  {
    if (!v17) {
      goto LABEL_4;
    }
  }
  else
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"UIDiffableDataSourceSectionController.m", 164, @"Invalid parameter not satisfying: %@", @"section" object file lineNumber description];

    if (!v17)
    {
LABEL_4:
      if (v18)
      {
        v37 = [MEMORY[0x1E4F28B00] currentHandler];
        [v37 handleFailureInMethod:a2 object:self file:@"UIDiffableDataSourceSectionController.m" lineNumber:165 description:@"An non-nil animator is required to use a custom animations provider"];
      }
    }
  }
  BOOL v39 = a5;
  id v21 = objc_loadWeakRetained((id *)&self->_dataSource);
  [v21 addAssociatedSectionControllerIfNeeded:self];

  v22 = [(_UIDiffableDataSourceSectionController *)self associatedSectionIdentifiers];
  v23 = [v22 setByAddingObject:v16];
  associatedSectionIdentifiers = self->_associatedSectionIdentifiers;
  self->_associatedSectionIdentifiers = v23;

  v38 = (void *)[v15 copy];
  -[NSMapTable setObject:forKey:](self->_snapshotsMap, "setObject:forKey:");
  id v25 = objc_loadWeakRetained((id *)&self->_dataSource);
  v26 = [v25 snapshot];

  v27 = v18;
  if ([v26 indexOfSectionIdentifier:v16] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v28 = v19;
    v49[0] = v16;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
    [v26 appendSectionsWithIdentifiers:v29];
  }
  else
  {
    v29 = [v26 itemIdentifiersInSectionWithIdentifier:v16];
    if ([v29 count]) {
      [v26 deleteItemsWithIdentifiers:v29];
    }
    v28 = v19;
  }

  v30 = [v15 visibleItems];
  [v26 appendItemsWithIdentifiers:v30 intoSectionWithIdentifier:v16];

  expandCollapseAnimationContext = self->_expandCollapseAnimationContext;
  id v32 = objc_loadWeakRetained((id *)&self->_dataSource);
  [v32 setExpandCollapseAnimationContext:expandCollapseAnimationContext];

  id v33 = objc_loadWeakRetained((id *)&self->_dataSource);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __163___UIDiffableDataSourceSectionController___applySnapshot_toSection_animatingDifferences_viewPropertyAnimator_animationsProvider_isOnDiffableApplyQueue_completion___block_invoke;
  v41[3] = &unk_1E52F0860;
  BOOL v47 = a8;
  id v42 = v17;
  v43 = self;
  id v44 = v26;
  id v45 = v27;
  BOOL v48 = v39;
  id v46 = v28;
  id v34 = v26;
  [v33 _performApplyWithoutRebasingSectionSnapshots:v41];

  id v35 = objc_loadWeakRetained((id *)&self->_dataSource);
  [v35 setExpandCollapseAnimationContext:0];

  id v19 = v28;
  id v18 = v27;

LABEL_12:
}

- (NSSet)associatedSectionIdentifiers
{
  return self->_associatedSectionIdentifiers;
}

- (void)_applySnapshot:(id)a3 toSection:(id)a4 animatingDifferences:(BOOL)a5 viewPropertyAnimator:(id)a6 animationsProvider:(id)a7 isOnDiffableApplyQueue:(BOOL)a8 completion:(id)a9
{
  uint64_t v9 = a8;
  BOOL v12 = a5;
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  [v16 _prepareForApplyToDataSource];
  if (!v12)
  {
    [(_UIDiffableDataSourceSectionController *)self _updatePreparedCellsForExpansionStateWithSnapshot:v16];
    id v21 = (void *)[v16 copy];
    [(_UIDiffableDataSourceSectionController *)self __applySnapshot:v21 toSection:v17 animatingDifferences:0 viewPropertyAnimator:0 animationsProvider:0 isOnDiffableApplyQueue:v9 completion:v20];
    goto LABEL_23;
  }
  id v21 = _Block_copy(v19);
  if ([(_UIDiffableDataSourceSectionController *)self _snapshotHasExpandOrCollapseUpdates:v16])
  {
    unsigned int v63 = v9;
    v64 = [(_UIDiffableDataSourceSectionController *)self dataSource];
    v22 = [v64 snapshot];
    uint64_t v23 = [v22 indexOfSectionIdentifier:v17];

    v62 = (__UIDiffableDataSource *)v23;
    if (v23 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_16:

      uint64_t v9 = v63;
      goto LABEL_17;
    }
    id v24 = [(_UIDiffableDataSourceSectionController *)self snapshotForSection:v17];
    if (![(_UIDiffableDataSourceSectionController *)self _shouldPerformCustomCollapseExpandAnimationsForInitialSnapshot:v24 finalSnapshot:v16])
    {
LABEL_15:

      goto LABEL_16;
    }
    v58 = v21;
    id v25 = [_UIDiffableDataSourceExpandCollapseAnimationContext alloc];
    id obj = [v64 snapshot];
    id v26 = obj;
    id v61 = v24;
    id v57 = v24;
    id v27 = v16;
    v59 = v26;
    if (!v25)
    {
      v30 = 0;
      v28 = v57;
      id v33 = v27;
LABEL_14:

      expandCollapseAnimationContext = self->_expandCollapseAnimationContext;
      self->_expandCollapseAnimationContext = v30;

      id v24 = v61;
      id v21 = v58;
      goto LABEL_15;
    }
    v60 = v27;
    if (!v26)
    {
      v50 = v25;
      v51 = [MEMORY[0x1E4F28B00] currentHandler];
      [v51 handleFailureInMethod:sel_initWithSectionIndex_snapshotBeforeApplication_initialSectionSnapshot_finalSectionSnapshot_, v50, @"UIDiffableDataSourceSectionController.m", 651, @"Invalid parameter not satisfying: %@", @"initialSnapshot != nil" object file lineNumber description];

      id v25 = v50;
      id v27 = v60;
    }
    v28 = v57;
    if (v57)
    {
      if (v27) {
        goto LABEL_10;
      }
    }
    else
    {
      v54 = v25;
      v52 = [MEMORY[0x1E4F28B00] currentHandler];
      [v52 handleFailureInMethod:sel_initWithSectionIndex_snapshotBeforeApplication_initialSectionSnapshot_finalSectionSnapshot_, v54, @"UIDiffableDataSourceSectionController.m", 652, @"Invalid parameter not satisfying: %@", @"initialSectionSnapshot != nil" object file lineNumber description];

      id v25 = v54;
      if (v60) {
        goto LABEL_10;
      }
    }
    v55 = v25;
    v53 = [MEMORY[0x1E4F28B00] currentHandler];
    [v53 handleFailureInMethod:sel_initWithSectionIndex_snapshotBeforeApplication_initialSectionSnapshot_finalSectionSnapshot_, v55, @"UIDiffableDataSourceSectionController.m", 653, @"Invalid parameter not satisfying: %@", @"finalSectionSnapshot != nil" object file lineNumber description];

    id v25 = v55;
LABEL_10:
    v69.receiver = v25;
    v69.super_class = (Class)_UIDiffableDataSourceExpandCollapseAnimationContext;
    v29 = [(_UIDiffableDataSourceSectionController *)&v69 init];
    v30 = (_UIDiffableDataSourceExpandCollapseAnimationContext *)v29;
    if (v29)
    {
      v29->_dataSource = v62;
      objc_storeStrong((id *)&v29->_snapshotsMap, obj);
      objc_storeStrong((id *)&v30->_initialSectionSnapshot, v61);
      objc_storeStrong((id *)&v30->_finalSectionSnapshot, a3);
      uint64_t v31 = [v57 _itemsOrderedSet];
      initialIdentifiers = v30->_initialIdentifiers;
      v30->_initialIdentifiers = (NSOrderedSet *)v31;

      id v33 = v60;
      uint64_t v34 = [v60 _itemsOrderedSet];
      finalIdentifiers = v30->_finalIdentifiers;
      v30->_finalIdentifiers = (NSOrderedSet *)v34;

      uint64_t v36 = [v57 _visibleItemsOrderedSet];
      initialVisibleIdentifiers = v30->_initialVisibleIdentifiers;
      v30->_initialVisibleIdentifiers = (NSOrderedSet *)v36;

      uint64_t v38 = [v60 _visibleItemsOrderedSet];
      finalVisibleIdentifiers = v30->_finalVisibleIdentifiers;
      v30->_finalVisibleIdentifiers = (NSOrderedSet *)v38;

      uint64_t v40 = [v60 expandedItemsUpdates];
      identifiersOfExpandedItems = v30->_identifiersOfExpandedItems;
      v30->_identifiersOfExpandedItems = (NSArray *)v40;

      uint64_t v42 = [v60 collapsedItemsUpdates];
      identifiersOfCollapsedItems = v30->_identifiersOfCollapsedItems;
      v30->_identifiersOfCollapsedItems = (NSArray *)v42;
    }
    else
    {
      id v33 = v60;
    }
    goto LABEL_14;
  }
LABEL_17:
  if (v18) {
    id v45 = (UIViewPropertyAnimator *)v18;
  }
  else {
    id v45 = [[UIViewPropertyAnimator alloc] initWithDuration:0 curve:&__block_literal_global_257 animations:0.25];
  }
  id v46 = v45;
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __162___UIDiffableDataSourceSectionController__applySnapshot_toSection_animatingDifferences_viewPropertyAnimator_animationsProvider_isOnDiffableApplyQueue_completion___block_invoke_2;
  v67[3] = &unk_1E52D9F98;
  v67[4] = self;
  id v47 = v16;
  id v68 = v47;
  [(UIViewPropertyAnimator *)v46 addAnimations:v67];
  if (v20)
  {
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __162___UIDiffableDataSourceSectionController__applySnapshot_toSection_animatingDifferences_viewPropertyAnimator_animationsProvider_isOnDiffableApplyQueue_completion___block_invoke_3;
    v65[3] = &unk_1E52E5E20;
    id v66 = v20;
    [(UIViewPropertyAnimator *)v46 addCompletion:v65];
  }
  BOOL v48 = (void *)[v47 copy];
  [(_UIDiffableDataSourceSectionController *)self __applySnapshot:v48 toSection:v17 animatingDifferences:1 viewPropertyAnimator:v46 animationsProvider:v21 isOnDiffableApplyQueue:v9 completion:0];

  v49 = self->_expandCollapseAnimationContext;
  self->_expandCollapseAnimationContext = 0;

LABEL_23:
}

- (void)_updatePreparedCellsForExpansionStateWithSnapshot:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_UIDiffableDataSourceSectionController *)self dataSource];
  id v6 = v5;
  if (v5 && ([v5 isSuppressingViewUpdates] & 1) == 0)
  {
    id v7 = [v6 _collectionView];
    if (v7)
    {
      id v15 = v7;
      id v8 = [v7 preparedCells];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = [v13 _itemIdentifier];
              if (v14) {
                [(_UIDiffableDataSourceSectionController *)self _configureCell:v13 forItem:v14 inSnapshot:v4];
              }
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v10);
      }

      id v7 = v15;
    }
  }
}

- (_UIDiffableDataSourceSectionController)initWithDiffableDataSourceImpl:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = [v4 set];
  id v7 = [(_UIDiffableDataSourceSectionController *)self initWithItemRenderers:MEMORY[0x1E4F1CBF0] associatedSectionIdentifiers:v6 snapshotsMap:0 dataSource:v5];

  return v7;
}

- (_UIDiffableDataSourceSectionController)initWithItemRenderers:(id)a3 associatedSectionIdentifiers:(id)a4 snapshotsMap:(id)a5 dataSource:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_UIDiffableDataSourceSectionController;
  id v15 = [(_UIDiffableDataSourceSectionController *)&v22 init];
  long long v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_itemRenderers, a3);
    if (v12)
    {
      long long v17 = (NSSet *)v12;
    }
    else
    {
      long long v17 = [MEMORY[0x1E4F1CAD0] set];
    }
    associatedSectionIdentifiers = v16->_associatedSectionIdentifiers;
    v16->_associatedSectionIdentifiers = v17;

    if (v13)
    {
      long long v19 = (NSMapTable *)v13;
    }
    else
    {
      long long v19 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    }
    snapshotsMap = v16->_snapshotsMap;
    v16->_snapshotsMap = v19;

    objc_storeWeak((id *)&v16->_dataSource, v14);
  }
  if (v14)
  {
    [(_UIDiffableDataSourceSectionController *)v16 _configureForDataSource:v14];
  }
  else if ([v11 count])
  {
    [(_UIDiffableDataSourceSectionController *)v16 _configureForItemRenderersIfNeeded:v11];
  }

  return v16;
}

- (void)setDelegate:(id)a3
{
}

- (_UIDiffableDataSourceSectionController)initWithItemRenderers:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = [v4 set];
  id v7 = [(_UIDiffableDataSourceSectionController *)self initWithItemRenderers:v5 associatedSectionIdentifiers:v6 snapshotsMap:0 dataSource:0];

  return v7;
}

- (_UIDiffableDataSourceSectionController)initWithItemRenderers:(id)a3 associatedSectionIdentifiers:(id)a4
{
  return [(_UIDiffableDataSourceSectionController *)self initWithItemRenderers:a3 associatedSectionIdentifiers:a4 snapshotsMap:0 dataSource:0];
}

- (id)snapshotForItem:(id)a3
{
  v3 = [(_UIDiffableDataSourceSectionController *)self _extantMutableSnapshotForItem:a3];
  id v4 = (void *)[v3 copy];
  id v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = objc_alloc_init(NSDiffableDataSourceSectionSnapshot);
  }
  id v7 = v6;

  return v7;
}

- (void)applySnapshot:(id)a3 toSection:(id)a4 animatingDifferences:(BOOL)a5 completion:(id)a6
{
}

- (void)applySnapshot:(id)a3 toSection:(id)a4 customAnimationsProvider:(id)a5
{
}

- (void)applySnapshot:(id)a3 toSection:(id)a4 viewPropertyAnimator:(id)a5 customAnimationsProvider:(id)a6
{
}

- (id)_expandCollapseAnimationContextForCollectionView:(id)a3
{
  return self->_expandCollapseAnimationContext;
}

- (BOOL)_snapshotHasExpandOrCollapseUpdates:(id)a3
{
  id v3 = a3;
  id v4 = [v3 expandedItemsUpdates];
  uint64_t v5 = [v4 count];

  id v6 = [v3 collapsedItemsUpdates];

  uint64_t v7 = [v6 count];
  return v5 > 0 || v7 > 0;
}

- (BOOL)_shouldPerformCustomCollapseExpandAnimationsForInitialSnapshot:(id)a3 finalSnapshot:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = [v6 collapsedItemsUpdates];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v23 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * v11);
      if ([v5 containsItem:v12])
      {
        if ([v5 isExpanded:v12]) {
          goto LABEL_20;
        }
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = objc_msgSend(v6, "expandedItemsUpdates", 0);
  uint64_t v13 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
LABEL_12:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v19 != v14) {
        objc_enumerationMutation(v7);
      }
      uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * v15);
      if ([v5 containsItem:v16])
      {
        if (![v5 isExpanded:v16]) {
          break;
        }
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v13) {
          goto LABEL_12;
        }
        goto LABEL_21;
      }
    }
LABEL_20:
    LOBYTE(v13) = 1;
  }
LABEL_21:

  return v13;
}

- (id)_collectionView
{
  v2 = [(_UIDiffableDataSourceSectionController *)self dataSource];
  id v3 = [v2 _collectionView];

  return v3;
}

- (_UIDiffableDataSourceSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIDiffableDataSourceSectionControllerDelegate *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v5 = a3;
  objc_storeWeak((id *)p_dataSource, v5);
  [(_UIDiffableDataSourceSectionController *)self _configureForDataSource:v5];
}

- (void)_configureForItemRenderersIfNeeded:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v11 = v4;
    uint64_t v12 = [v4 firstObject];
    objc_opt_class();
    id v5 = (void *)v12;
    if (objc_opt_isKindOfClass())
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id obj = v11;
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v18;
        uint64_t v8 = MEMORY[0x1E4F143A8];
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v18 != v7) {
              objc_enumerationMutation(obj);
            }
            uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
            objc_initWeak(&location, self);
            v14[0] = v8;
            v14[1] = 3221225472;
            v14[2] = __77___UIDiffableDataSourceSectionController__configureForItemRenderersIfNeeded___block_invoke;
            v14[3] = &unk_1E52F08B0;
            objc_copyWeak(&v15, &location);
            [v10 setWillUpdateCellHandler:v14];
            objc_destroyWeak(&v15);
            objc_destroyWeak(&location);
            ++v9;
          }
          while (v6 != v9);
          uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v6);
      }

      id v5 = (void *)v12;
    }

    id v4 = v11;
  }
}

- (id)_sectionIdentifierForItem:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    uint64_t v6 = [(_UIDiffableDataSourceSectionController *)self dataSource];
    if (!v6)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"UIDiffableDataSourceSectionController.m", 369, @"Invalid parameter not satisfying: %@", @"dataSource" object file lineNumber description];
    }
    uint64_t v7 = [v6 snapshot];
    uint64_t v8 = [v7 sectionIdentifierForSectionContainingItemIdentifier:v5];
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (BOOL)_performDisclosureAction:(unint64_t)a3 forItem:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!a3
    || ([(_UIDiffableDataSourceSectionController *)self _sectionIdentifierForItem:v6],
        (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    BOOL v12 = 0;
    goto LABEL_10;
  }
  uint64_t v8 = (void *)v7;
  uint64_t v9 = [(_UIDiffableDataSourceSectionController *)self snapshotForSection:v7];
  if (![v9 containsItem:v6]) {
    goto LABEL_7;
  }
  int v10 = [v9 isExpanded:v6];
  uint64_t v11 = 2;
  if (!v10) {
    uint64_t v11 = 3;
  }
  if (v11 == a3) {
    goto LABEL_7;
  }
  if (v10)
  {
    if ([(_UIDiffableDataSourceSectionController *)self _queryClientShouldCollapseItem:v6])
    {
      [(_UIDiffableDataSourceSectionController *)self _queryClientWillCollapseItem:v6];
      uint64_t v14 = [(_UIDiffableDataSourceSectionController *)self snapshotForSection:v8];

      v20[0] = v6;
      id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
      [v14 collapseItems:v15];
LABEL_20:

      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      BOOL v12 = 1;
      [WeakRetained applySnapshot:v14 toSection:v8 animatingDifferences:1 completion:0];

      uint64_t v9 = v14;
      goto LABEL_8;
    }
  }
  else if ([(_UIDiffableDataSourceSectionController *)self _queryClientShouldExpandItem:v6])
  {
    [(_UIDiffableDataSourceSectionController *)self _queryClientWillExpandItem:v6];
    uint64_t v14 = [(_UIDiffableDataSourceSectionController *)self snapshotForSection:v8];

    if ([(_UIDiffableDataSourceSectionController *)self _queryClientShouldQueryForSnapshotForExpandingParentItem:v6])
    {
      uint64_t v16 = [v14 childSnapshotOfParent:v6];
      long long v17 = [(_UIDiffableDataSourceSectionController *)self _queryClientSnapshotForExpandingParentItemForItem:v6 currentSectionSnapshot:v16];
      if (v17) {
        [v14 setChildrenWithSnapshot:v17 forParent:v6];
      }
    }
    id v19 = v6;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    [v14 expandItems:v15];
    goto LABEL_20;
  }
LABEL_7:
  BOOL v12 = 0;
LABEL_8:

LABEL_10:
  return v12;
}

- (id)_extantMutableSnapshotForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIDiffableDataSourceSectionController *)self dataSource];
  id v6 = v5;
  uint64_t v7 = 0;
  if (v4 && v5)
  {
    uint64_t v8 = [v5 sectionIdentifierForSectionContainingItemIdentifier:v4];
    if (v8)
    {
      uint64_t v7 = [(_UIDiffableDataSourceSectionController *)self _extantMutableSnapshotForSection:v8];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  return v7;
}

- (BOOL)_queryClientShouldExpandItem:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIDiffableDataSourceSectionController *)self handlers];
  id v6 = [v5 shouldExpandItemHandler];

  if (v6)
  {
    uint64_t v7 = [(_UIDiffableDataSourceSectionController *)self handlers];
    uint64_t v8 = [v7 shouldExpandItemHandler];
    char v9 = ((uint64_t (**)(void, id))v8)[2](v8, v4);
  }
  else
  {
    int v10 = [(_UIDiffableDataSourceSectionController *)self delegate];

    if (!v10)
    {
      char v9 = 1;
      goto LABEL_6;
    }
    uint64_t v7 = [(_UIDiffableDataSourceSectionController *)self delegate];
    char v9 = [v7 sectionController:self shouldExpandItem:v4];
  }

LABEL_6:
  return v9;
}

- (void)_queryClientWillExpandItem:(id)a3
{
  id v10 = a3;
  id v4 = [(_UIDiffableDataSourceSectionController *)self handlers];
  id v5 = [v4 willExpandItemHandler];

  if (v5)
  {
    id v6 = [(_UIDiffableDataSourceSectionController *)self handlers];
    uint64_t v7 = [v6 willExpandItemHandler];
    ((void (**)(void, id))v7)[2](v7, v10);
  }
  uint64_t v8 = [(_UIDiffableDataSourceSectionController *)self delegate];

  if (v8)
  {
    char v9 = [(_UIDiffableDataSourceSectionController *)self delegate];
    [v9 sectionController:self willExpandItem:v10];
  }
}

- (BOOL)_queryClientShouldCollapseItem:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_UIDiffableDataSourceSectionController *)self handlers];
  id v6 = [v5 shouldCollapseItemHandler];

  if (v6)
  {
    uint64_t v7 = [(_UIDiffableDataSourceSectionController *)self handlers];
    uint64_t v8 = [v7 shouldCollapseItemHandler];
    char v9 = ((uint64_t (**)(void, id))v8)[2](v8, v4);

    if ((v9 & 1) == 0)
    {
LABEL_21:
      BOOL v28 = 0;
      goto LABEL_30;
    }
  }
  else
  {
    id v10 = [(_UIDiffableDataSourceSectionController *)self delegate];

    if (v10)
    {
      uint64_t v11 = [(_UIDiffableDataSourceSectionController *)self delegate];
      int v12 = [v11 sectionController:self shouldCollapseItem:v4];

      if (!v12) {
        goto LABEL_21;
      }
    }
  }
  uint64_t v13 = [(_UIDiffableDataSourceSectionController *)self _collectionView];
  uint64_t v14 = v13;
  if (v13 && [v13 _isReordering])
  {
    id v15 = [(_UIDiffableDataSourceSectionController *)self snapshotForItem:v4];
    uint64_t v16 = [v15 childSnapshotOfParent:v4 includingParent:0];
    if (v16)
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v17 = [v14 _reorderedItems];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        v30 = v15;
        uint64_t v31 = v14;
        uint64_t v20 = *(void *)v33;
        p_dataSource = &self->_dataSource;
        while (2)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v33 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v23 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "originalIndexPath", v30, v31);
            if (v23)
            {
              long long v24 = (void *)v23;
              id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
              id v26 = [WeakRetained itemIdentifierForIndexPath:v24];

              if (v26 && ([v16 containsItem:v26] & 1) != 0)
              {

                int v27 = 0;
                goto LABEL_25;
              }
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
          if (v19) {
            continue;
          }
          break;
        }
        int v27 = 1;
LABEL_25:
        id v15 = v30;
        uint64_t v14 = v31;
      }
      else
      {
        int v27 = 1;
      }
    }
    else
    {
      int v27 = 1;
    }
  }
  else
  {
    int v27 = 1;
  }

  BOOL v28 = v27 != 0;
LABEL_30:

  return v28;
}

- (void)_queryClientWillCollapseItem:(id)a3
{
  id v10 = a3;
  id v4 = [(_UIDiffableDataSourceSectionController *)self handlers];
  id v5 = [v4 willCollapseItemHandler];

  if (v5)
  {
    id v6 = [(_UIDiffableDataSourceSectionController *)self handlers];
    uint64_t v7 = [v6 willCollapseItemHandler];
    ((void (**)(void, id))v7)[2](v7, v10);
  }
  uint64_t v8 = [(_UIDiffableDataSourceSectionController *)self delegate];

  if (v8)
  {
    char v9 = [(_UIDiffableDataSourceSectionController *)self delegate];
    [v9 sectionController:self willCollapseItem:v10];
  }
}

- (BOOL)_queryClientShouldQueryForSnapshotForExpandingParentItem:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIDiffableDataSourceSectionController *)self handlers];
  id v6 = [v5 childSnapshotForExpandingParentHandler];

  if (v6)
  {
    char v7 = 1;
  }
  else
  {
    uint64_t v8 = [(_UIDiffableDataSourceSectionController *)self delegate];

    if (v8)
    {
      char v9 = [(_UIDiffableDataSourceSectionController *)self delegate];
      char v7 = [v9 sectionController:self shouldQueryForSnapshotForExpandingParentItem:v4];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)_queryClientSnapshotForExpandingParentItemForItem:(id)a3 currentSectionSnapshot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_UIDiffableDataSourceSectionController *)self handlers];
  char v9 = [v8 childSnapshotForExpandingParentHandler];

  if (v9)
  {
    id v10 = [(_UIDiffableDataSourceSectionController *)self handlers];
    uint64_t v11 = [v10 childSnapshotForExpandingParentHandler];
    int v12 = ((void (**)(void, id, id))v11)[2](v11, v6, v7);
  }
  else
  {
    uint64_t v13 = [(_UIDiffableDataSourceSectionController *)self delegate];

    int v12 = v7;
    if (!v13) {
      goto LABEL_6;
    }
    id v10 = [(_UIDiffableDataSourceSectionController *)self delegate];
    int v12 = [v10 sectionController:self snapshotForExpandingParentItem:v6 currentSectionSnapshot:v7];
    uint64_t v11 = (void (**)(void, void, void))v7;
  }

LABEL_6:
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_itemRenderers copyItems:1];
  associatedSectionIdentifiers = self->_associatedSectionIdentifiers;
  id v7 = (void *)[(NSMapTable *)self->_snapshotsMap mutableCopy];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  char v9 = (void *)[v4 initWithItemRenderers:v5 associatedSectionIdentifiers:associatedSectionIdentifiers snapshotsMap:v7 dataSource:WeakRetained];

  id v10 = [(_UIDiffableDataSourceSectionController *)self handlers];
  [v9 setHandlers:v10];

  return v9;
}

- (NSArray)itemRenderers
{
  return self->_itemRenderers;
}

- (_UIDiffableDataSourceSectionControllerHandlers)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_itemRenderers, 0);
  objc_storeStrong((id *)&self->_expandCollapseAnimationContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_associatedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_snapshotsMap, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end