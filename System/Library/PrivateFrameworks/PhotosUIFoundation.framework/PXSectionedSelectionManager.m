@interface PXSectionedSelectionManager
- (BOOL)_needsUpdate;
- (BOOL)disableAssetTypeCounting;
- (BOOL)emptySelectionAvoided;
- (BOOL)selectionLimitReached;
- (NSOrderedSet)overallSelectionOrder;
- (PXMutableIndexPathSet)selectedIndexPaths;
- (PXSectionedDataSource)dataSource;
- (PXSectionedDataSourceManager)dataSourceManager;
- (PXSectionedSelectionManager)init;
- (PXSectionedSelectionManager)initWithDataSourceManager:(id)a3;
- (PXSectionedSelectionManagerSnapshotValidator)snapshotValidator;
- (PXSelectionSnapshot)selectionSnapshot;
- (PXSimpleIndexPath)cursorIndexPath;
- (PXSimpleIndexPath)pendingIndexPath;
- (PXSimpleIndexPath)pressedIndexPath;
- (id)_validatedSnapshotForSnapshot:(id)a3;
- (id)sectionedDataSourceManagerInterestingObjectReferences:(id)a3;
- (void)_invalidateSelectionSnapshot;
- (void)_makeSimpleModificationToSelectedIndexPathsUsingBlock:(id)a3;
- (void)_setCursorIndexPath:(PXSimpleIndexPath *)a3;
- (void)_setDataSource:(id)a3;
- (void)_setDataSource:(id)a3 withChangeHistory:(id)a4;
- (void)_setEmptySelectionAvoided:(BOOL)a3;
- (void)_setOverallSelectionOrder:(id)a3;
- (void)_setPendingIndexPath:(PXSimpleIndexPath *)a3;
- (void)_setPressedIndexPath:(PXSimpleIndexPath *)a3;
- (void)_setSelectedIndexPaths:(id)a3;
- (void)_setSelectionLimitReached:(BOOL)a3;
- (void)_setSelectionSnapshot:(id)a3;
- (void)_updateIfNeeded;
- (void)_updateSelectionSnapshotIfNeeded;
- (void)deselectAll;
- (void)didPerformChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)selectAllItems;
- (void)selectAllItemsInSection:(PXSimpleIndexPath *)a3;
- (void)setCursorIndexPath:(PXSimpleIndexPath *)a3;
- (void)setDisableAssetTypeCounting:(BOOL)a3;
- (void)setOverallSelectionOrder:(id)a3;
- (void)setPendingIndexPath:(PXSimpleIndexPath *)a3;
- (void)setPressedIndexPath:(PXSimpleIndexPath *)a3;
- (void)setSelectedIndexPath:(PXSimpleIndexPath *)a3;
- (void)setSelectedIndexPaths:(id)a3;
- (void)setSelectedState:(BOOL)a3 forIndexPath:(PXSimpleIndexPath *)a4;
- (void)setSelectedState:(BOOL)a3 forIndexPath:(PXSimpleIndexPath *)a4 andUpdateCursorIndexPath:(BOOL)a5;
- (void)setSelectedState:(BOOL)a3 forIndexPathSet:(id)a4;
- (void)setSelectionLimitReached:(BOOL)a3;
- (void)setSnapshotValidator:(id)a3;
@end

@implementation PXSectionedSelectionManager

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((v6 & 1) != 0 && (void *)PXSelectionManagerDataSourceObserverContext == a5)
  {
    if ([(PXObservable *)self isPerformingChanges])
    {
      v15 = [MEMORY[0x263F08690] currentHandler];
      [v15 handleFailureInMethod:a2, self, @"PXSectionedSelectionManager.m", 370, @"Invalid parameter not satisfying: %@", @"!self.isPerformingChanges" object file lineNumber description];
    }
    id v10 = v9;
    v11 = [v10 dataSource];
    v12 = [v10 changeHistory];

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __60__PXSectionedSelectionManager_observable_didChange_context___block_invoke;
    v16[3] = &unk_26545A8D8;
    v16[4] = self;
    id v17 = v11;
    id v18 = v12;
    id v13 = v12;
    id v14 = v11;
    [(PXSectionedSelectionManager *)self performChanges:v16];
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXSectionedSelectionManager;
  [(PXObservable *)&v3 performChanges:a3];
}

uint64_t __60__PXSectionedSelectionManager_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setDataSource:*(void *)(a1 + 40) withChangeHistory:*(void *)(a1 + 48)];
}

- (void)deselectAll
{
}

- (PXSectionedDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXSectionedSelectionManager)initWithDataSourceManager:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXSectionedSelectionManager;
  char v6 = [(PXObservable *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSourceManager, a3);
    uint64_t v8 = +[PXIndexPathSet indexPathSet];
    selectedIndexPaths = v7->_selectedIndexPaths;
    v7->_selectedIndexPaths = (PXMutableIndexPathSet *)v8;

    [v5 registerChangeObserver:v7 context:PXSelectionManagerDataSourceObserverContext];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __57__PXSectionedSelectionManager_initWithDataSourceManager___block_invoke;
    v11[3] = &unk_26545A780;
    v12 = v7;
    id v13 = v5;
    [(PXSectionedSelectionManager *)v12 performChanges:v11];
  }
  return v7;
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)PXSectionedSelectionManager;
  [(PXObservable *)&v3 didPerformChanges];
  [(PXSectionedSelectionManager *)self _updateIfNeeded];
}

- (void)_updateIfNeeded
{
  [(PXSectionedSelectionManager *)self _updateSelectionSnapshotIfNeeded];
  if ([(PXSectionedSelectionManager *)self _needsUpdate])
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PXSectionedSelectionManager.m" lineNumber:171 description:@"Selection manager still needs to update after an update pass"];
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.selectionSnapshot;
}

- (void)_setDataSource:(id)a3 withChangeHistory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PXSectionedSelectionManager *)self dataSource];
  [(PXSectionedSelectionManager *)self _setDataSource:v6];
  long long v43 = *(_OWORD *)PXSimpleIndexPathNull;
  long long v44 = *(_OWORD *)&PXSimpleIndexPathNull[16];
  long long v41 = *(_OWORD *)PXSimpleIndexPathNull;
  long long v42 = *(_OWORD *)&PXSimpleIndexPathNull[16];
  long long v39 = *(_OWORD *)PXSimpleIndexPathNull;
  long long v40 = *(_OWORD *)&PXSimpleIndexPathNull[16];
  if (v7)
  {
    uint64_t v9 = [v8 identifier];
    id v10 = objc_msgSend(v7, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", v9, objc_msgSend(v6, "identifier"));
    v11 = [(PXSectionedSelectionManager *)self selectedIndexPaths];
    v12 = +[PXSectionedDataSourceChangeDetails indexPathSetAfterApplyingChanges:v10 toIndexPathSet:v11 hasIncrementalChanges:0];
    long long v37 = 0u;
    long long v38 = 0u;
    if (v11) {
      [v11 firstItemIndexPathForDataSourceIdentifier:v9];
    }
    id v13 = [(PXSectionedSelectionManager *)self snapshotValidator];
    id v19 = v6;
    if (![v13 selectionManagerShouldAvoidEmptySelection:self]) {
      goto LABEL_10;
    }
    BOOL v14 = 0;
    if (!(void)v37 || (void)v38 == 0x7FFFFFFFFFFFFFFFLL || *((void *)&v38 + 1) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = v8;
      goto LABEL_23;
    }
    if (v12)
    {
      [v12 anyItemIndexPath];
      if ((void)v35)
      {
LABEL_10:
        v15 = v8;
        BOOL v14 = 0;
LABEL_23:
        v16 = (void *)[v12 mutableCopy];
        [(PXSectionedSelectionManager *)self cursorIndexPath];
        +[PXSectionedDataSourceChangeDetails indexPathAfterApplyingChanges:v10 toIndexPath:v22 hasIncrementalChanges:0 objectChanged:0];
        [(PXSectionedSelectionManager *)self pendingIndexPath];
        +[PXSectionedDataSourceChangeDetails indexPathAfterApplyingChanges:v10 toIndexPath:v21 hasIncrementalChanges:0 objectChanged:0];
        [(PXSectionedSelectionManager *)self pressedIndexPath];
        +[PXSectionedDataSourceChangeDetails indexPathAfterApplyingChanges:v10 toIndexPath:v20 hasIncrementalChanges:0 objectChanged:0];

        uint64_t v8 = v15;
        id v6 = v19;
        goto LABEL_24;
      }
    }
    else
    {
      long long v35 = 0u;
      long long v36 = 0u;
    }
    *(void *)&long long v31 = 0;
    *((void *)&v31 + 1) = &v31;
    *(void *)&long long v32 = 0x4010000000;
    *((void *)&v32 + 1) = &unk_259D809E3;
    long long v33 = *(_OWORD *)PXSimpleIndexPathNull;
    long long v34 = *(_OWORD *)&PXSimpleIndexPathNull[16];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __64__PXSectionedSelectionManager__setDataSource_withChangeHistory___block_invoke;
    v28[3] = &unk_26545A7A8;
    long long v29 = v37;
    long long v30 = v38;
    v28[4] = &v31;
    long long v26 = v37;
    long long v27 = v38;
    [v8 enumerateItemIndexPathsStartingAtIndexPath:&v26 reverseDirection:1 usingBlock:v28];
    long long v26 = 0u;
    long long v27 = 0u;
    if (v6) {
      [v6 firstItemIndexPath];
    }
    BOOL v14 = 0;
    if (*(void *)(*((void *)&v31 + 1) + 32))
    {
      if (*(void *)(*((void *)&v31 + 1) + 48) != 0x7FFFFFFFFFFFFFFFLL
        && *(void *)(*((void *)&v31 + 1) + 56) == 0x7FFFFFFFFFFFFFFFLL)
      {
        long long v17 = *(_OWORD *)(*((void *)&v31 + 1) + 48);
        v23[0] = *(_OWORD *)(*((void *)&v31 + 1) + 32);
        v23[1] = v17;
        +[PXSectionedDataSourceChangeDetails indexPathAfterApplyingChanges:v10 toIndexPath:v23 hasIncrementalChanges:0 objectChanged:0];
        BOOL v14 = 0;
        long long v26 = v24;
        long long v27 = v25;
        if ((void)v24)
        {
          if ((void)v27 != 0x7FFFFFFFFFFFFFFFLL) {
            BOOL v14 = *((void *)&v27 + 1) == 0x7FFFFFFFFFFFFFFFLL;
          }
        }
      }
    }
    long long v24 = v26;
    long long v25 = v27;
    uint64_t v18 = +[PXIndexPathSet indexPathSetWithIndexPath:&v24];
    v15 = v8;

    _Block_object_dispose(&v31, 8);
    v12 = (void *)v18;
    goto LABEL_23;
  }
  v16 = +[PXIndexPathSet indexPathSet];
  BOOL v14 = 0;
LABEL_24:
  [(PXSectionedSelectionManager *)self _setEmptySelectionAvoided:v14];
  [(PXSectionedSelectionManager *)self _setSelectedIndexPaths:v16];
  long long v31 = v43;
  long long v32 = v44;
  [(PXSectionedSelectionManager *)self _setCursorIndexPath:&v31];
  long long v31 = v41;
  long long v32 = v42;
  [(PXSectionedSelectionManager *)self _setPendingIndexPath:&v31];
  long long v31 = v39;
  long long v32 = v40;
  [(PXSectionedSelectionManager *)self _setPressedIndexPath:&v31];
}

- (void)_updateSelectionSnapshotIfNeeded
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (self->_needsUpdateFlags.selectionSnapshot)
  {
    self->_needsUpdateFlags.selectionSnapshot = 0;
    id v4 = [(PXSectionedSelectionManager *)self selectedIndexPaths];
    id v5 = (void *)[v4 copy];

    id v6 = [(PXSectionedSelectionManager *)self dataSource];
    uint64_t v7 = [v6 identifier];

    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __63__PXSectionedSelectionManager__updateSelectionSnapshotIfNeeded__block_invoke;
    v41[3] = &unk_26545A7D0;
    v41[5] = v7;
    v41[6] = a2;
    v41[4] = self;
    [v5 enumerateDataSourceIdentifiers:v41];
    long long v39 = 0u;
    long long v40 = 0u;
    [(PXSectionedSelectionManager *)self cursorIndexPath];
    uint64_t v8 = [PXSelectionSnapshot alloc];
    uint64_t v9 = [(PXSectionedSelectionManager *)self dataSource];
    [(PXSectionedSelectionManager *)self pendingIndexPath];
    [(PXSectionedSelectionManager *)self pressedIndexPath];
    BOOL v10 = [(PXSectionedSelectionManager *)self selectionLimitReached];
    BOOL v11 = [(PXSectionedSelectionManager *)self emptySelectionAvoided];
    v12 = [(PXSectionedSelectionManager *)self overallSelectionOrder];
    *(_OWORD *)buf = v39;
    long long v43 = v40;
    LOBYTE(v25) = v11;
    id v13 = [(PXSelectionSnapshot *)v8 initWithDataSource:v9 selectedIndexPaths:v5 cursorIndexPath:buf pendingIndexPath:v38 pressedIndexPath:v37 selectionLimitReached:v10 emptySelectionAvoided:v25 overallSelectionOrder:v12];

    BOOL v14 = [(PXSectionedSelectionManager *)self selectionSnapshot];
    v15 = [v14 dataSource];
    uint64_t v16 = [v15 identifier];
    long long v17 = [(PXSelectionSnapshot *)v13 dataSource];
    uint64_t v18 = [v17 identifier];

    if (v16 == v18)
    {
      id v19 = [(PXSectionedSelectionManager *)self _validatedSnapshotForSnapshot:v13];
      v20 = v19;
      if (v19 != v13)
      {
        v21 = v19;

        v22 = [(PXSectionedSelectionManager *)self selectedIndexPaths];
        [v22 removeAllIndexPaths];
        v23 = [(PXSelectionSnapshot *)v21 selectedIndexPaths];
        [v22 unionIndexPathSet:v23];

        if (v21)
        {
          [(PXSelectionSnapshot *)v21 cursorIndexPath];
          long long v33 = v35;
          long long v34 = v36;
          [(PXSectionedSelectionManager *)self _setCursorIndexPath:&v33];
          [(PXSelectionSnapshot *)v21 pendingIndexPath];
          long long v29 = v31;
          long long v30 = v32;
          [(PXSectionedSelectionManager *)self _setPendingIndexPath:&v29];
          [(PXSelectionSnapshot *)v21 pressedIndexPath];
        }
        else
        {
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          [(PXSectionedSelectionManager *)self _setCursorIndexPath:&v33];
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          [(PXSectionedSelectionManager *)self _setPendingIndexPath:&v29];
          long long v27 = 0u;
          long long v28 = 0u;
        }
        v26[0] = v27;
        v26[1] = v28;
        [(PXSectionedSelectionManager *)self _setPressedIndexPath:v26];
        [(PXSectionedSelectionManager *)self _setSelectionLimitReached:[(PXSelectionSnapshot *)v21 isSelectionLimitReached]];
        long long v24 = [(PXSelectionSnapshot *)v21 overallSelectionOrder];
        [(PXSectionedSelectionManager *)self _setOverallSelectionOrder:v24];

        id v13 = v21;
      }
    }
    [(PXSectionedSelectionManager *)self _setSelectionSnapshot:v13];
  }
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (PXSectionedDataSource)dataSource
{
  return self->_dataSource;
}

- (PXSimpleIndexPath)pressedIndexPath
{
  long long v3 = *(_OWORD *)&self[7].section;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[6].subitem;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXSimpleIndexPath)pendingIndexPath
{
  long long v3 = *(_OWORD *)&self[6].section;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[5].subitem;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXSimpleIndexPath)cursorIndexPath
{
  long long v3 = *(_OWORD *)&self[5].section;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[4].subitem;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (BOOL)selectionLimitReached
{
  return self->_selectionLimitReached;
}

- (NSOrderedSet)overallSelectionOrder
{
  return self->_overallSelectionOrder;
}

- (BOOL)emptySelectionAvoided
{
  return self->_emptySelectionAvoided;
}

- (void)_setSelectionSnapshot:(id)a3
{
  id v5 = (PXSelectionSnapshot *)a3;
  p_selectionSnapshot = &self->_selectionSnapshot;
  if (self->_selectionSnapshot != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_selectionSnapshot, a3);
    p_selectionSnapshot = (PXSelectionSnapshot **)[(PXObservable *)self signalChange:1];
    id v5 = v7;
  }

  MEMORY[0x270F9A758](p_selectionSnapshot, v5);
}

- (void)_setPressedIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  *(_OWORD *)&self->_pressedIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
  *(_OWORD *)&self->_pressedIndexPath.item = v3;
}

- (void)_setPendingIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  *(_OWORD *)&self->_pendingIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
  *(_OWORD *)&self->_pendingIndexPath.item = v3;
}

- (void)_setEmptySelectionAvoided:(BOOL)a3
{
  self->_emptySelectionAvoided = a3;
}

- (void)_setDataSource:(id)a3
{
  id v5 = (PXSectionedDataSource *)a3;
  p_dataSource = &self->_dataSource;
  if (self->_dataSource != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_dataSource, a3);
    [(PXObservable *)self signalChange:2];
    p_dataSource = (PXSectionedDataSource **)[(PXSectionedSelectionManager *)self _invalidateSelectionSnapshot];
    id v5 = v7;
  }

  MEMORY[0x270F9A758](p_dataSource, v5);
}

- (void)_setSelectedIndexPaths:(id)a3
{
  id v5 = (PXMutableIndexPathSet *)a3;
  p_selectedIndexPaths = &self->_selectedIndexPaths;
  if (self->_selectedIndexPaths != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_selectedIndexPaths, a3);
    p_selectedIndexPaths = (PXMutableIndexPathSet **)[(PXSectionedSelectionManager *)self _invalidateSelectionSnapshot];
    id v5 = v7;
  }

  MEMORY[0x270F9A758](p_selectedIndexPaths, v5);
}

- (void)_invalidateSelectionSnapshot
{
  self->_needsUpdateFlags.selectionSnapshot = 1;
}

- (void)_setCursorIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  *(_OWORD *)&self->_cursorIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
  *(_OWORD *)&self->_cursorIndexPath.item = v3;
}

- (PXSectionedSelectionManagerSnapshotValidator)snapshotValidator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotValidator);

  return (PXSectionedSelectionManagerSnapshotValidator *)WeakRetained;
}

- (void)_makeSimpleModificationToSelectedIndexPathsUsingBlock:(id)a3
{
  uint64_t v9 = (void (**)(id, void *))a3;
  if (self->_needsUpdateFlags.selectionSnapshot)
  {
    uint64_t v4 = -1;
  }
  else
  {
    id v5 = [(PXSectionedSelectionManager *)self selectedIndexPaths];
    uint64_t v4 = [v5 count];
  }
  id v6 = [(PXSectionedSelectionManager *)self selectedIndexPaths];
  v9[2](v9, v6);

  if (self->_needsUpdateFlags.selectionSnapshot)
  {
    uint64_t v7 = -1;
  }
  else
  {
    uint64_t v8 = [(PXSectionedSelectionManager *)self selectedIndexPaths];
    uint64_t v7 = [v8 count];
  }
  if (v4 != v7) {
    [(PXSectionedSelectionManager *)self _invalidateSelectionSnapshot];
  }
}

- (PXMutableIndexPathSet)selectedIndexPaths
{
  return self->_selectedIndexPaths;
}

uint64_t __42__PXSectionedSelectionManager_deselectAll__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeAllIndexPaths];
}

uint64_t __57__PXSectionedSelectionManager_initWithDataSourceManager___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v3 = [*(id *)(a1 + 40) dataSource];
  [v2 _setDataSource:v3 withChangeHistory:0];

  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 _invalidateSelectionSnapshot];
}

- (void)setSnapshotValidator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_snapshotValidator);
  objc_storeStrong((id *)&self->_overallSelectionOrder, 0);
  objc_storeStrong((id *)&self->_selectedIndexPaths, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);

  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

- (void)setDisableAssetTypeCounting:(BOOL)a3
{
  self->_disableAssetTypeCounting = a3;
}

- (BOOL)disableAssetTypeCounting
{
  return self->_disableAssetTypeCounting;
}

- (void)_setOverallSelectionOrder:(id)a3
{
}

- (void)_setSelectionLimitReached:(BOOL)a3
{
  self->_selectionLimitReached = a3;
}

- (id)sectionedDataSourceManagerInterestingObjectReferences:(id)a3
{
  return 0;
}

- (void)setOverallSelectionOrder:(id)a3
{
  if (self->_overallSelectionOrder != a3)
  {
    uint64_t v4 = (NSOrderedSet *)[a3 copy];
    overallSelectionOrder = self->_overallSelectionOrder;
    self->_overallSelectionOrder = v4;

    [(PXSectionedSelectionManager *)self _invalidateSelectionSnapshot];
  }
}

- (void)setSelectionLimitReached:(BOOL)a3
{
  if (self->_selectionLimitReached != a3)
  {
    self->_selectionLimitReached = a3;
    [(PXSectionedSelectionManager *)self _invalidateSelectionSnapshot];
  }
}

- (void)setPressedIndexPath:(PXSimpleIndexPath *)a3
{
  [(PXSectionedSelectionManager *)self pressedIndexPath];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64((int64x2_t)v6[2], *(int64x2_t *)&a3->dataSourceIdentifier), (int32x4_t)vceqq_s64((int64x2_t)v6[3], *(int64x2_t *)&a3->item))), 0xFuLL))) & 1) == 0)
  {
    long long v5 = *(_OWORD *)&a3->item;
    v6[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v6[1] = v5;
    [(PXSectionedSelectionManager *)self _setPressedIndexPath:v6];
    [(PXSectionedSelectionManager *)self _invalidateSelectionSnapshot];
  }
}

- (void)setPendingIndexPath:(PXSimpleIndexPath *)a3
{
  [(PXSectionedSelectionManager *)self pendingIndexPath];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64((int64x2_t)v6[2], *(int64x2_t *)&a3->dataSourceIdentifier), (int32x4_t)vceqq_s64((int64x2_t)v6[3], *(int64x2_t *)&a3->item))), 0xFuLL))) & 1) == 0)
  {
    long long v5 = *(_OWORD *)&a3->item;
    v6[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v6[1] = v5;
    [(PXSectionedSelectionManager *)self _setPendingIndexPath:v6];
    [(PXSectionedSelectionManager *)self _invalidateSelectionSnapshot];
  }
}

- (void)setCursorIndexPath:(PXSimpleIndexPath *)a3
{
  [(PXSectionedSelectionManager *)self cursorIndexPath];
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64((int64x2_t)v6[2], *(int64x2_t *)&a3->dataSourceIdentifier), (int32x4_t)vceqq_s64((int64x2_t)v6[3], *(int64x2_t *)&a3->item))), 0xFuLL))) & 1) == 0)
  {
    long long v5 = *(_OWORD *)&a3->item;
    v6[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v6[1] = v5;
    [(PXSectionedSelectionManager *)self _setCursorIndexPath:v6];
    [(PXSectionedSelectionManager *)self _invalidateSelectionSnapshot];
  }
}

- (void)setSelectedIndexPath:(PXSimpleIndexPath *)a3
{
  long long v5 = *(_OWORD *)&a3->item;
  long long v8 = *(_OWORD *)&a3->dataSourceIdentifier;
  long long v9 = v5;
  id v6 = +[PXIndexPathSet indexPathSetWithIndexPath:&v8];
  [(PXSectionedSelectionManager *)self _setSelectedIndexPaths:v6];

  long long v7 = *(_OWORD *)&a3->item;
  long long v8 = *(_OWORD *)&a3->dataSourceIdentifier;
  long long v9 = v7;
  [(PXSectionedSelectionManager *)self _setCursorIndexPath:&v8];
  [(PXSectionedSelectionManager *)self _invalidateSelectionSnapshot];
}

- (void)setSelectedIndexPaths:(id)a3
{
  uint64_t v4 = (void *)[a3 mutableCopy];
  [(PXSectionedSelectionManager *)self _setSelectedIndexPaths:v4];

  [(PXSectionedSelectionManager *)self _invalidateSelectionSnapshot];
}

- (void)selectAllItemsInSection:(PXSimpleIndexPath *)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  long long v3 = *(_OWORD *)&a3->item;
  long long v5 = *(_OWORD *)&a3->dataSourceIdentifier;
  v4[2] = __55__PXSectionedSelectionManager_selectAllItemsInSection___block_invoke;
  v4[3] = &unk_26545A8B0;
  v4[4] = self;
  long long v6 = v3;
  SEL v7 = a2;
  [(PXSectionedSelectionManager *)self _makeSimpleModificationToSelectedIndexPathsUsingBlock:v4];
}

void __55__PXSectionedSelectionManager_selectAllItemsInSection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) dataSource];
  long long v5 = (long long *)(a1 + 40);
  if ([v4 identifier] != *(void *)(a1 + 40))
  {
    BOOL v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 32), @"PXSectionedSelectionManager.m", 298, @"Invalid parameter not satisfying: %@", @"dataSource.identifier == sectionIndexPath.dataSourceIdentifier" object file lineNumber description];
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6 >= [v4 numberOfSections])
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 32), @"PXSectionedSelectionManager.m", 299, @"Invalid parameter not satisfying: %@", @"sectionIndexPath.section < dataSource.numberOfSections" object file lineNumber description];
  }
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  long long v9 = v5[1];
  long long v15 = *v5;
  long long v16 = v9;
  v13[2] = __55__PXSectionedSelectionManager_selectAllItemsInSection___block_invoke_2;
  v13[3] = &unk_26545A888;
  id v14 = v4;
  id v10 = v4;
  [v3 modifyItemIndexSetForDataSourceIdentifier:v8 section:v7 usingBlock:v13];
}

void __55__PXSectionedSelectionManager_selectAllItemsInSection___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = a2;
  objc_msgSend(v4, "addIndexesInRange:", 0, objc_msgSend(v2, "numberOfItemsInSection:", v3));
}

- (void)selectAllItems
{
  uint64_t v3 = [(PXSectionedSelectionManager *)self dataSource];
  id v4 = [v3 allItemIndexPaths];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__PXSectionedSelectionManager_selectAllItems__block_invoke;
  v6[3] = &unk_26545A840;
  id v7 = v4;
  id v5 = v4;
  [(PXSectionedSelectionManager *)self _makeSimpleModificationToSelectedIndexPathsUsingBlock:v6];
}

uint64_t __45__PXSectionedSelectionManager_selectAllItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 unionIndexPathSet:*(void *)(a1 + 32)];
}

- (void)setSelectedState:(BOOL)a3 forIndexPathSet:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__PXSectionedSelectionManager_setSelectedState_forIndexPathSet___block_invoke;
  v8[3] = &unk_26545A818;
  BOOL v10 = a3;
  id v9 = v6;
  id v7 = v6;
  [(PXSectionedSelectionManager *)self _makeSimpleModificationToSelectedIndexPathsUsingBlock:v8];
}

uint64_t __64__PXSectionedSelectionManager_setSelectedState_forIndexPathSet___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    return [a2 unionIndexPathSet:v2];
  }
  else {
    return [a2 minusIndexPathSet:v2];
  }
}

- (void)setSelectedState:(BOOL)a3 forIndexPath:(PXSimpleIndexPath *)a4 andUpdateCursorIndexPath:(BOOL)a5
{
  BOOL v5 = a5;
  long long v8 = *(_OWORD *)&a4->item;
  long long v10 = *(_OWORD *)&a4->dataSourceIdentifier;
  long long v11 = v8;
  [(PXSectionedSelectionManager *)self setSelectedState:a3 forIndexPath:&v10];
  if (v5)
  {
    long long v9 = *(_OWORD *)&a4->item;
    long long v10 = *(_OWORD *)&a4->dataSourceIdentifier;
    long long v11 = v9;
    [(PXSectionedSelectionManager *)self setCursorIndexPath:&v10];
  }
}

- (void)setSelectedState:(BOOL)a3 forIndexPath:(PXSimpleIndexPath *)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int64_t dataSourceIdentifier = a4->dataSourceIdentifier;
  if (a4->dataSourceIdentifier)
  {
    long long v8 = [(PXSectionedSelectionManager *)self dataSource];
    uint64_t v9 = [v8 identifier];

    if (dataSourceIdentifier != v9)
    {
      long long v10 = PXAssertGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int64_t v12 = a4->dataSourceIdentifier;
        id v13 = [(PXSectionedSelectionManager *)self dataSource];
        uint64_t v14 = [v13 identifier];
        long long v15 = [(PXSectionedSelectionManager *)self dataSource];
        *(_DWORD *)buf = 134218498;
        int64_t v21 = v12;
        __int16 v22 = 2048;
        uint64_t v23 = v14;
        __int16 v24 = 2112;
        uint64_t v25 = v15;
        _os_log_error_impl(&dword_259CDA000, v10, OS_LOG_TYPE_ERROR, "Invalid use, data source identifier mismatch %lu!=%lu, can only select indexPaths in the current data source version: %@", buf, 0x20u);
      }
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __61__PXSectionedSelectionManager_setSelectedState_forIndexPath___block_invoke;
    v16[3] = &__block_descriptor_65_e31_v16__0__PXMutableIndexPathSet_8l;
    BOOL v19 = a3;
    long long v11 = *(_OWORD *)&a4->item;
    long long v17 = *(_OWORD *)&a4->dataSourceIdentifier;
    long long v18 = v11;
    [(PXSectionedSelectionManager *)self _makeSimpleModificationToSelectedIndexPathsUsingBlock:v16];
  }
}

uint64_t __61__PXSectionedSelectionManager_setSelectedState_forIndexPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (long long *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 48);
  if (*(unsigned char *)(a1 + 64))
  {
    long long v5 = *v2;
    long long v6 = v3;
    return [a2 addIndexPath:&v5];
  }
  else
  {
    long long v5 = *v2;
    long long v6 = v3;
    return [a2 removeIndexPath:&v5];
  }
}

void __63__PXSectionedSelectionManager__updateSelectionSnapshotIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 40) != a2)
  {
    id v4 = PXAssertGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 134218240;
      uint64_t v7 = v5;
      __int16 v8 = 2048;
      uint64_t v9 = a2;
      _os_log_fault_impl(&dword_259CDA000, v4, OS_LOG_TYPE_FAULT, "Attempted to select an indexPath from an incorrect data source version %ld != %ld", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (id)_validatedSnapshotForSnapshot:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXSectionedSelectionManager *)self snapshotValidator];
  int v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 selectionManager:self validateSnapshot:v4];
    if (v7) {
      goto LABEL_6;
    }
    id v8 = [(PXSectionedSelectionManager *)self selectionSnapshot];
  }
  else
  {
    id v8 = v4;
  }
  uint64_t v7 = v8;
LABEL_6:

  return v7;
}

__n128 __64__PXSectionedSelectionManager__setDataSource_withChangeHistory___block_invoke(uint64_t a1, int64x2_t *a2, unsigned char *a3)
{
  result.n128_u64[0] = (unint64_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)(a1 + 40), *a2), (int32x4_t)vceqq_s64(*(int64x2_t *)(a1 + 56), a2[1]))), 0xFuLL));
  result.n128_u16[0] = vminv_u16((uint16x4_t)result.n128_u64[0]);
  if ((result.n128_u8[0] & 1) == 0)
  {
    id v4 = *(int64x2_t **)(*(void *)(a1 + 32) + 8);
    __n128 result = *(__n128 *)a2;
    int64x2_t v5 = a2[1];
    v4[2] = *a2;
    v4[3] = v5;
    *a3 = 1;
  }
  return result;
}

- (PXSectionedSelectionManager)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXSectionedSelectionManager.m" lineNumber:49 description:@"Not supported"];

  abort();
}

@end