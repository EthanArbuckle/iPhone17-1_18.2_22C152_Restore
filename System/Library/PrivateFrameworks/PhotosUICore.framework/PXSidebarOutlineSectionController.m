@interface PXSidebarOutlineSectionController
- (BOOL)_appendChildrenForParentIfNeeded:(id)a3 inSnapshot:(id)a4;
- (BOOL)animateDataSourceUpdates;
- (PXSidebarDataController)dataController;
- (PXSidebarOutlineSectionController)initWithSidebarDataController:(id)a3 dataSource:(id)a4;
- (PXSidebarOutlineSectionControllerDelegate)delegate;
- (UICollectionViewDiffableDataSource)dataSource;
- (id)_applyChangeDetails:(id)a3 forItem:(id)a4 toSnapshot:(id)a5 outChangedItemsBeforeChange:(id *)a6 outChangedItemsAfterChange:(id *)a7;
- (id)_newSnapshotFromDataControllerWithRestoredExpansionState:(BOOL)a3;
- (id)currentSectionSnapshot;
- (id)expandItemsToRevealFirstEditableItemIfNeededAnimated:(BOOL)a3;
- (void)_configureInitialSnapshotAnimated:(BOOL)a3 expandSubItems:(BOOL)a4 applyOnQueue:(id)a5;
- (void)_expandItem:(id)a3 inSnapshot:(id)a4;
- (void)_expandItemIfNeeded:(id)a3 inSnapshot:(id)a4;
- (void)_transferStateOfItem:(id)a3 oldSnapshot:(id)a4 toNewItem:(id)a5 newSnapshot:(id)a6;
- (void)appendChildrenForParentIfNeeded:(id)a3;
- (void)expandItemsForIdentifiersIfNeeded:(id)a3 animated:(BOOL)a4;
- (void)loadRootItems;
- (void)reloadFromDataControllerApplyAnimated:(BOOL)a3 onQueue:(id)a4;
- (void)sectionControllerWillCollapseItem:(id)a3;
- (void)sectionControllerWillExpandItem:(id)a3;
- (void)setAnimateDataSourceUpdates:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)sidebarDataSourceController:(id)a3 didChangeChildrenOfItem:(id)a4 changeDetails:(id)a5;
@end

@implementation PXSidebarOutlineSectionController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_dataController, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PXSidebarOutlineSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXSidebarOutlineSectionControllerDelegate *)WeakRetained;
}

- (void)setAnimateDataSourceUpdates:(BOOL)a3
{
  self->_animateDataSourceUpdates = a3;
}

- (BOOL)animateDataSourceUpdates
{
  return self->_animateDataSourceUpdates;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (PXSidebarDataController)dataController
{
  return self->_dataController;
}

- (void)sidebarDataSourceController:(id)a3 didChangeChildrenOfItem:(id)a4 changeDetails:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  v9 = PLSidebarGetLog();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    v13 = [v7 identifier];
    *(_DWORD *)buf = 138412290;
    v46 = v13;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "sidebarDataSourceController_didChangeChildrenOfItem_changeDetails", "identifier: %@", buf, 0xCu);
  }
  v14 = [(PXSidebarOutlineSectionController *)self dataSource];
  v15 = [v14 snapshotForSection:@"PXSidebarOutlineSectionControllerSectionIdentifier"];
  id v43 = 0;
  id v44 = 0;
  v31 = v7;
  v16 = [(PXSidebarOutlineSectionController *)self _applyChangeDetails:v8 forItem:v7 toSnapshot:v15 outChangedItemsBeforeChange:&v44 outChangedItemsAfterChange:&v43];
  id v30 = v44;
  id v29 = v43;
  v17 = [v8 insertedIndexes];
  if ([v17 count])
  {
    BOOL v18 = 1;
  }
  else
  {
    v19 = [v8 removedIndexes];
    BOOL v18 = [v19 count] != 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__PXSidebarOutlineSectionController_sidebarDataSourceController_didChangeChildrenOfItem_changeDetails___block_invoke;
  aBlock[3] = &unk_1E5DBA7D0;
  id v20 = v15;
  id v35 = v20;
  id v21 = v16;
  id v36 = v21;
  v37 = self;
  BOOL v42 = v18;
  id v22 = v14;
  id v38 = v22;
  v39 = @"PXSidebarOutlineSectionControllerSectionIdentifier";
  v23 = v12;
  v40 = v23;
  os_signpost_id_t v41 = v10;
  v24 = (void (**)(void))_Block_copy(aBlock);
  v25 = [(PXSidebarOutlineSectionController *)self delegate];

  if (v25)
  {
    v26 = [(PXSidebarOutlineSectionController *)self delegate];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __103__PXSidebarOutlineSectionController_sidebarDataSourceController_didChangeChildrenOfItem_changeDetails___block_invoke_13;
    v32[3] = &unk_1E5DD3128;
    v33 = v24;
    v27 = self;
    v28 = v29;
    [v26 sidebarOutlineSectionController:v27 willApplySnapshotWithChangedItemsAfterChange:v29 applyBlock:v32];
  }
  else
  {
    v24[2](v24);
    v28 = v29;
  }
}

void __103__PXSidebarOutlineSectionController_sidebarDataSourceController_didChangeChildrenOfItem_changeDetails___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqual:*(void *)(a1 + 40)] & 1) == 0)
  {
    unsigned int v2 = [*(id *)(a1 + 48) animateDataSourceUpdates];
    if (*(unsigned char *)(a1 + 88)) {
      uint64_t v3 = v2;
    }
    else {
      uint64_t v3 = 0;
    }
    [*(id *)(a1 + 56) applySnapshot:*(void *)(a1 + 40) toSection:*(void *)(a1 + 64) animatingDifferences:v3];
  }
  v4 = *(id *)(a1 + 72);
  v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 80);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v6, "sidebarDataSourceController_didChangeChildrenOfItem_changeDetails", "", v7, 2u);
  }
}

uint64_t __103__PXSidebarOutlineSectionController_sidebarDataSourceController_didChangeChildrenOfItem_changeDetails___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_applyChangeDetails:(id)a3 forItem:(id)a4 toSnapshot:(id)a5 outChangedItemsBeforeChange:(id *)a6 outChangedItemsAfterChange:(id *)a7
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = v14;
  if (v13)
  {
    if (([v14 containsItem:v13] & 1) != 0 && !objc_msgSend(v12, "needsReload"))
    {
      os_signpost_id_t v41 = a7;
      BOOL v42 = a6;
      id v16 = [v15 childSnapshotOfParent:v13];
      goto LABEL_9;
    }
  }
  else if (([v12 needsReload] & 1) == 0)
  {
    os_signpost_id_t v41 = a7;
    BOOL v42 = a6;
    id v16 = v15;
LABEL_9:
    v19 = v16;
    uint64_t v47 = [v12 arrayChangeDetails];
    v45 = [v47 insertedIndexes];
    id v43 = [v47 changedIndexes];
    id v20 = [(PXSidebarOutlineSectionController *)self dataController];
    v46 = [v20 childrenOfListItem:v13];

    uint64_t v69 = 0;
    v70 = &v69;
    uint64_t v71 = 0x2020000000;
    BOOL v72 = 0;
    if ([v47 hasAnyInsertionsRemovalsOrMoves])
    {
      BOOL v21 = 1;
    }
    else
    {
      uint64_t v22 = [v46 count];
      v23 = [v19 rootItems];
      BOOL v21 = v22 != [v23 count];
    }
    BOOL v72 = v21;
    if (*((unsigned char *)v70 + 24) || ![v43 count]) {
      goto LABEL_19;
    }
    unint64_t v24 = [v43 lastIndex];
    v25 = [v19 rootItems];
    if (v24 >= [v25 count])
    {
    }
    else
    {
      unint64_t v26 = [v43 lastIndex];
      LOBYTE(v26) = v26 < [v46 count];

      if (v26)
      {
        v27 = [v47 changedIndexes];
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __131__PXSidebarOutlineSectionController__applyChangeDetails_forItem_toSnapshot_outChangedItemsBeforeChange_outChangedItemsAfterChange___block_invoke;
        v65[3] = &unk_1E5DC05D0;
        id v66 = v19;
        id v67 = v46;
        v68 = &v69;
        [v27 enumerateIndexesUsingBlock:v65];

LABEL_19:
        if (*((unsigned char *)v70 + 24))
        {
          id v28 = objc_alloc_init(MEMORY[0x1E4FB1358]);
          [v28 appendItems:v46];
          long long v63 = 0u;
          long long v64 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          id v29 = v46;
          uint64_t v30 = [v29 countByEnumeratingWithState:&v61 objects:v73 count:16];
          if (v30)
          {
            uint64_t v31 = *(void *)v62;
            do
            {
              for (uint64_t i = 0; i != v30; ++i)
              {
                if (*(void *)v62 != v31) {
                  objc_enumerationMutation(v29);
                }
                [(PXSidebarOutlineSectionController *)self _transferStateOfItem:*(void *)(*((void *)&v61 + 1) + 8 * i) oldSnapshot:v19 toNewItem:*(void *)(*((void *)&v61 + 1) + 8 * i) newSnapshot:v28];
              }
              uint64_t v30 = [v29 countByEnumeratingWithState:&v61 objects:v73 count:16];
            }
            while (v30);
          }

          if ([v45 count])
          {
            v59[0] = MEMORY[0x1E4F143A8];
            v59[1] = 3221225472;
            v59[2] = __131__PXSidebarOutlineSectionController__applyChangeDetails_forItem_toSnapshot_outChangedItemsBeforeChange_outChangedItemsAfterChange___block_invoke_2;
            v59[3] = &unk_1E5DBA780;
            v59[4] = self;
            id v28 = v28;
            id v60 = v28;
            [v29 enumerateObjectsAtIndexes:v45 options:0 usingBlock:v59];
          }
        }
        else
        {
          id v28 = (id)[v19 copy];
        }
        id v44 = [MEMORY[0x1E4F1CA48] array];
        v33 = [MEMORY[0x1E4F1CA48] array];
        v34 = [v12 changedItems];
        uint64_t v35 = [v34 count];

        if (v35)
        {
          id v36 = [v12 previousDataSection];
          v37 = [v47 changedIndexes];
          if ([v45 count])
          {
            id v38 = (void *)[v37 mutableCopy];
            [v38 removeIndexes:v45];
          }
          else
          {
            id v38 = v37;
          }
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __131__PXSidebarOutlineSectionController__applyChangeDetails_forItem_toSnapshot_outChangedItemsBeforeChange_outChangedItemsAfterChange___block_invoke_3;
          v48[3] = &unk_1E5DBA7A8;
          id v49 = v47;
          id v39 = v36;
          id v50 = v39;
          id v51 = v46;
          v52 = self;
          id v53 = v19;
          id v54 = v28;
          id v55 = v13;
          id v56 = v15;
          id v57 = v44;
          id v58 = v33;
          [v38 enumerateIndexesUsingBlock:v48];
        }
        if (v42) {
          *BOOL v42 = (id)[v44 copy];
        }
        if (v41) {
          *os_signpost_id_t v41 = (id)[v33 copy];
        }
        if (v13)
        {
          id v18 = (id)[v15 copy];
          [v18 setChildrenWithSnapshot:v28 forParent:v13];
        }
        else
        {
          id v18 = v28;
        }

        _Block_object_dispose(&v69, 8);
        goto LABEL_43;
      }
    }
    PXAssertGetLog();
  }
  id v17 = [(PXSidebarOutlineSectionController *)self _newSnapshotFromDataControllerWithRestoredExpansionState:1];
  id v18 = v17;
  if (a7)
  {
    *a7 = [v17 visibleItems];
  }
LABEL_43:

  return v18;
}

void __131__PXSidebarOutlineSectionController__applyChangeDetails_forItem_toSnapshot_outChangedItemsBeforeChange_outChangedItemsAfterChange___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  os_signpost_id_t v6 = [*(id *)(a1 + 32) rootItems];
  id v9 = [v6 objectAtIndexedSubscript:a2];

  id v7 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  if (v9 == v7)
  {
  }
  else
  {
    char v8 = [v9 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
}

uint64_t __131__PXSidebarOutlineSectionController__applyChangeDetails_forItem_toSnapshot_outChangedItemsBeforeChange_outChangedItemsAfterChange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _expandItemIfNeeded:a2 inSnapshot:*(void *)(a1 + 40)];
}

void __131__PXSidebarOutlineSectionController__applyChangeDetails_forItem_toSnapshot_outChangedItemsBeforeChange_outChangedItemsAfterChange___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "indexAfterRevertingChangesFromIndex:", a2));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [*(id *)(a1 + 48) objectAtIndex:a2];
  [*(id *)(a1 + 56) _transferStateOfItem:v5 oldSnapshot:*(void *)(a1 + 64) toNewItem:v4 newSnapshot:*(void *)(a1 + 72)];
  if ((!*(void *)(a1 + 80) || objc_msgSend(*(id *)(a1 + 88), "isExpanded:"))
    && [*(id *)(a1 + 64) containsItem:v5])
  {
    [*(id *)(a1 + 96) addObject:v5];
    [*(id *)(a1 + 104) addObject:v4];
  }
}

- (void)_transferStateOfItem:(id)a3 oldSnapshot:(id)a4 toNewItem:(id)a5 newSnapshot:(id)a6
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v10 containsItem:v9])
  {
    if ([v10 isExpanded:v9])
    {
      v15[0] = v11;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      [v12 expandItems:v13];
    }
    id v14 = [v10 childSnapshotOfParent:v9];
    [v12 setChildrenWithSnapshot:v14 forParent:v11];
  }
}

- (void)_expandItemIfNeeded:(id)a3 inSnapshot:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(PXSidebarOutlineSectionController *)self dataController];
  int v9 = [v8 isItemExpanded:v6];

  if (v9)
  {
    v11[0] = v6;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v7 expandItems:v10];

    [(PXSidebarOutlineSectionController *)self _appendChildrenForParentIfNeeded:v6 inSnapshot:v7];
  }
}

- (void)_expandItem:(id)a3 inSnapshot:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  char v8 = [(PXSidebarOutlineSectionController *)self dataController];
  [v8 setExpanded:1 forItem:v7];

  v10[0] = v7;
  int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v6 expandItems:v9];

  [(PXSidebarOutlineSectionController *)self _appendChildrenForParentIfNeeded:v7 inSnapshot:v6];
}

- (BOOL)_appendChildrenForParentIfNeeded:(id)a3 inSnapshot:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [v7 childrenOfParent:v6];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    BOOL v10 = 0;
  }
  else
  {
    id v11 = [(PXSidebarOutlineSectionController *)self dataController];
    id v12 = [v11 childrenOfListItem:v6];

    uint64_t v13 = [v12 count];
    BOOL v10 = v13 != 0;
    if (v13)
    {
      [v7 appendItems:v12 intoParent:v6];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v14 = v12;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v21 != v17) {
              objc_enumerationMutation(v14);
            }
            -[PXSidebarOutlineSectionController _expandItemIfNeeded:inSnapshot:](self, "_expandItemIfNeeded:inSnapshot:", *(void *)(*((void *)&v20 + 1) + 8 * i), v7, (void)v20);
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v16);
      }
    }
  }

  return v10;
}

- (void)appendChildrenForParentIfNeeded:(id)a3
{
  id v4 = a3;
  id v6 = [(PXSidebarOutlineSectionController *)self dataSource];
  id v5 = [v6 snapshotForSection:@"PXSidebarOutlineSectionControllerSectionIdentifier"];
  LODWORD(self) = [(PXSidebarOutlineSectionController *)self _appendChildrenForParentIfNeeded:v4 inSnapshot:v5];

  if (self) {
    [v6 applySnapshot:v5 toSection:@"PXSidebarOutlineSectionControllerSectionIdentifier" animatingDifferences:0];
  }
}

- (void)_configureInitialSnapshotAnimated:(BOOL)a3 expandSubItems:(BOOL)a4 applyOnQueue:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  char v8 = a5;
  uint64_t v9 = PLSidebarGetLog();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  id v11 = v9;
  id v12 = v11;
  if (v10 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    id v14 = v12;
  }
  else
  {
    if (os_signpost_enabled(v11))
    {
      *(_DWORD *)buf = 67109376;
      BOOL v32 = v6;
      __int16 v33 = 1024;
      BOOL v34 = v5;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "_configureInitialSnapshotAnimated_expandSubItems", "animated: %i, expandSubItem: %i", buf, 0xEu);
    }

    uint64_t v13 = v12;
    if (os_signpost_enabled(v13))
    {
      *(_DWORD *)buf = 67109376;
      BOOL v32 = v6;
      __int16 v33 = 1024;
      BOOL v34 = v5;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v10, "_configureInitialSnapshotAnimated_expandSubItems.createSnaphot", "animated: %i, expandSubItem: %i", buf, 0xEu);
    }
  }

  uint64_t v15 = [(PXSidebarOutlineSectionController *)self dataSource];
  id v16 = [(PXSidebarOutlineSectionController *)self _newSnapshotFromDataControllerWithRestoredExpansionState:v5];
  uint64_t v17 = v12;
  id v18 = v17;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v18, OS_SIGNPOST_INTERVAL_END, v10, "_configureInitialSnapshotAnimated_expandSubItems.createSnaphot", "", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__PXSidebarOutlineSectionController__configureInitialSnapshotAnimated_expandSubItems_applyOnQueue___block_invoke;
  aBlock[3] = &unk_1E5DCA340;
  BOOL v29 = v6;
  BOOL v30 = v5;
  uint64_t v25 = v18;
  id v26 = v15;
  id v27 = v16;
  os_signpost_id_t v28 = v10;
  id v19 = v16;
  id v20 = v15;
  long long v21 = v18;
  long long v22 = (void (**)(void))_Block_copy(aBlock);
  long long v23 = v22;
  if (v8) {
    dispatch_async(v8, v22);
  }
  else {
    v22[2](v22);
  }
}

void __99__PXSidebarOutlineSectionController__configureInitialSnapshotAnimated_expandSubItems_applyOnQueue___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = *(id *)(a1 + 32);
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 56);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    int v5 = *(unsigned __int8 *)(a1 + 64);
    int v6 = *(unsigned __int8 *)(a1 + 65);
    v13[0] = 67109376;
    v13[1] = v5;
    __int16 v14 = 1024;
    int v15 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "_configureInitialSnapshotAnimated_expandSubItems.applySnapshot", "animated: %i, expandSubItem: %i", (uint8_t *)v13, 0xEu);
  }

  [*(id *)(a1 + 40) applySnapshot:*(void *)(a1 + 48) toSection:@"PXSidebarOutlineSectionControllerSectionIdentifier" animatingDifferences:*(unsigned __int8 *)(a1 + 64)];
  id v7 = *(id *)(a1 + 32);
  char v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v13[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_END, v9, "_configureInitialSnapshotAnimated_expandSubItems.applySnapshot", "", (uint8_t *)v13, 2u);
  }

  os_signpost_id_t v10 = *(id *)(a1 + 32);
  id v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 56);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v13[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v11, OS_SIGNPOST_INTERVAL_END, v12, "_configureInitialSnapshotAnimated_expandSubItems", "", (uint8_t *)v13, 2u);
  }
}

- (id)_newSnapshotFromDataControllerWithRestoredExpansionState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v5 = PLSidebarGetLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  id v7 = v5;
  char v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v26 = v3;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "_newSnapshotFromDataControllerWithRestoredExpansionState", "restoreExpansionState: %i", buf, 8u);
  }

  id v9 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  os_signpost_id_t v10 = [(PXSidebarOutlineSectionController *)self dataController];
  id v11 = [v10 childrenOfListItem:0];

  if ([v11 count])
  {
    [v9 appendItems:v11];
    if (v3)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v12);
            }
            -[PXSidebarOutlineSectionController _expandItemIfNeeded:inSnapshot:](self, "_expandItemIfNeeded:inSnapshot:", *(void *)(*((void *)&v20 + 1) + 8 * i), v9, (void)v20);
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v14);
      }
    }
  }
  uint64_t v17 = v8;
  id v18 = v17;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v18, OS_SIGNPOST_INTERVAL_END, v6, "_newSnapshotFromDataControllerWithRestoredExpansionState", "", buf, 2u);
  }

  return v9;
}

- (void)reloadFromDataControllerApplyAnimated:(BOOL)a3 onQueue:(id)a4
{
}

- (id)expandItemsToRevealFirstEditableItemIfNeededAnimated:(BOOL)a3
{
  BOOL v19 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v4 = [(PXSidebarOutlineSectionController *)self currentSectionSnapshot];
  int v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v29 = 0;
  BOOL v30 = &v29;
  uint64_t v31 = 0x3032000000;
  BOOL v32 = __Block_byref_object_copy__108508;
  __int16 v33 = __Block_byref_object_dispose__108509;
  id v34 = 0;
  os_signpost_id_t v6 = [v4 items];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __90__PXSidebarOutlineSectionController_expandItemsToRevealFirstEditableItemIfNeededAnimated___block_invoke;
  v26[3] = &unk_1E5DBA730;
  os_signpost_id_t v28 = &v29;
  id v20 = v5;
  id v27 = v20;
  [v6 enumerateObjectsUsingBlock:v26];

  if (v30[5])
  {
LABEL_2:
    char v7 = 0;
LABEL_3:
    char v8 = objc_msgSend(v4, "parentOfChild:");
    if (v8)
    {
      do
      {
        [(PXSidebarOutlineSectionController *)self _expandItem:v8 inSnapshot:v4];
        uint64_t v9 = [v4 parentOfChild:v8];

        char v8 = (void *)v9;
      }
      while (v9);
      goto LABEL_21;
    }
    goto LABEL_17;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v20;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v35 count:16];
  if (!v11)
  {

    if (!v30[5]) {
      goto LABEL_22;
    }
    goto LABEL_2;
  }
  char v7 = 0;
  uint64_t v12 = *(void *)v23;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v23 != v12) {
        objc_enumerationMutation(v10);
      }
      uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
      if ([(PXSidebarOutlineSectionController *)self _appendChildrenForParentIfNeeded:v14 inSnapshot:v4])
      {
        uint64_t v15 = [v4 childrenOfParent:v14];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __90__PXSidebarOutlineSectionController_expandItemsToRevealFirstEditableItemIfNeededAnimated___block_invoke_2;
        v21[3] = &unk_1E5DBA758;
        v21[4] = &v29;
        [v15 enumerateObjectsUsingBlock:v21];

        if (v30[5])
        {

          if (!v30[5]) {
            goto LABEL_21;
          }
          char v7 = 1;
          goto LABEL_3;
        }
        char v7 = 1;
      }
    }
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v35 count:16];
    if (v11) {
      continue;
    }
    break;
  }

  if (v30[5]) {
    goto LABEL_3;
  }
LABEL_17:
  if (v7)
  {
LABEL_21:
    uint64_t v16 = [(PXSidebarOutlineSectionController *)self dataSource];
    [v16 applySnapshot:v4 toSection:@"PXSidebarOutlineSectionControllerSectionIdentifier" animatingDifferences:v19];
  }
LABEL_22:
  id v17 = (id)v30[5];

  _Block_object_dispose(&v29, 8);
  return v17;
}

void __90__PXSidebarOutlineSectionController_expandItemsToRevealFirstEditableItemIfNeededAnimated___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (([v7 isReorderable] & 1) != 0 || objc_msgSend(v7, "isDeletable"))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
  else if ([v7 isExpandable])
  {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

void __90__PXSidebarOutlineSectionController_expandItemsToRevealFirstEditableItemIfNeededAnimated___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (([v7 isReorderable] & 1) != 0 || objc_msgSend(v7, "isDeletable"))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)expandItemsForIdentifiersIfNeeded:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = [(PXSidebarOutlineSectionController *)self currentSectionSnapshot];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
          uint64_t v14 = [(PXSidebarOutlineSectionController *)self dataController];
          uint64_t v15 = [v14 itemForIdentifier:v13];

          if ([v15 isExpandable]) {
            [(PXSidebarOutlineSectionController *)self _expandItem:v15 inSnapshot:v7];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    uint64_t v16 = [(PXSidebarOutlineSectionController *)self currentSectionSnapshot];
    char v17 = [v7 isEqual:v16];

    if ((v17 & 1) == 0)
    {
      id v18 = [(PXSidebarOutlineSectionController *)self dataSource];
      [v18 applySnapshot:v7 toSection:@"PXSidebarOutlineSectionControllerSectionIdentifier" animatingDifferences:v4];
    }
  }
}

- (id)currentSectionSnapshot
{
  unsigned int v2 = [(PXSidebarOutlineSectionController *)self dataSource];
  BOOL v3 = [v2 snapshotForSection:@"PXSidebarOutlineSectionControllerSectionIdentifier"];

  return v3;
}

- (void)sectionControllerWillCollapseItem:(id)a3
{
  id v4 = a3;
  id v5 = [(PXSidebarOutlineSectionController *)self dataController];
  [v5 setExpanded:0 forItem:v4];
}

- (void)sectionControllerWillExpandItem:(id)a3
{
  id v4 = a3;
  [(PXSidebarOutlineSectionController *)self appendChildrenForParentIfNeeded:v4];
  id v5 = [(PXSidebarOutlineSectionController *)self dataController];
  [v5 setExpanded:1 forItem:v4];
}

- (void)loadRootItems
{
}

- (PXSidebarOutlineSectionController)initWithSidebarDataController:(id)a3 dataSource:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXSidebarOutlineSectionController;
  uint64_t v10 = [(PXSidebarOutlineSectionController *)&v16 init];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_dataController, a3);
    uint64_t v12 = [v8 delegate];

    if (v12)
    {
      uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v15 = [v8 delegate];
      [v14 handleFailureInMethod:a2, v11, @"PXSidebarOutlineSectionController.m", 32, @"Expected nil delegate instead of %@ on data controller %@", v15, v8 object file lineNumber description];
    }
    [v8 setDelegate:v11];
    objc_storeStrong((id *)&v11->_dataSource, a4);
    v11->_animateDataSourceUpdates = 1;
  }

  return v11;
}

@end