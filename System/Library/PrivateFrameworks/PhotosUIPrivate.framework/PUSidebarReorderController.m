@interface PUSidebarReorderController
- (BOOL)canReorderItem:(id)a3;
- (PUSidebarReorderController)initWithDataSource:(id)a3 outlineSectionController:(id)a4;
- (PXNavigationListItem)itemToReorder;
- (PXSidebarOutlineSectionController)sidebarOutlineSectionController;
- (UICollectionViewDiffableDataSource)dataSource;
- (id)targetIndexPathForMoveFromItemAtIndexPath:(id)a3 toProposedIndexPath:(id)a4;
- (void)performReorderWithTransaction:(id)a3;
- (void)setItemToReorder:(id)a3;
@end

@implementation PUSidebarReorderController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemToReorder, 0);
  objc_storeStrong((id *)&self->_sidebarOutlineSectionController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (void)setItemToReorder:(id)a3
{
}

- (PXNavigationListItem)itemToReorder
{
  return self->_itemToReorder;
}

- (PXSidebarOutlineSectionController)sidebarOutlineSectionController
{
  return self->_sidebarOutlineSectionController;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)performReorderWithTransaction:(id)a3
{
  v4 = [a3 sectionTransactions];
  v5 = [v4 firstObject];

  v6 = [v5 difference];
  v7 = [v6 insertions];
  v8 = [v7 firstObject];

  v45 = v8;
  id v9 = [v8 object];
  v10 = [v5 difference];
  v11 = [v10 removals];
  v12 = [v11 firstObject];

  v13 = [v12 object];
  if (v9)
  {
    v14 = [v5 finalSnapshot];
    v15 = [v14 parentOfChildItem:v9];
    v16 = [v14 childrenOfParent:v15];
    id v17 = [(PUSidebarReorderController *)self itemToReorder];
    if (v9 != v17)
    {
      v18 = [v14 parentOfChildItem:v17];

      if (v18 == v15)
      {
        id v19 = v17;

        id v9 = v19;
        v13 = v9;
      }
    }
    uint64_t v20 = [v16 indexOfObject:v9];
  }
  else
  {
    v15 = 0;
    uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v21 = [v15 collection];

  if (!v21)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__PUSidebarReorderController_performReorderWithTransaction___block_invoke;
    block[3] = &unk_1E5F2ED10;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    goto LABEL_14;
  }
  v22 = [v5 initialSnapshot];
  v23 = [v22 parentOfChild:v13];
  char v44 = [v23 isEqual:v15];

  v24 = [(PUSidebarReorderController *)self sidebarOutlineSectionController];
  v25 = [v24 dataController];
  v26 = [v25 infoForItem:v15 childIndex:v20];

  v27 = [v26 collection];
  if (v27)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_10;
    }
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    v36 = (objc_class *)objc_opt_class();
    v35 = NSStringFromClass(v36);
    v41 = objc_msgSend(v27, "px_descriptionForAssertionMessage");
    [v33 handleFailureInMethod:a2, self, @"PUSidebarReorderController.m", 124, @"%@ should be an instance inheriting from %@, but it is %@", @"childInfo.collection", v35, v41 object file lineNumber description];
  }
  else
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    v34 = (objc_class *)objc_opt_class();
    v35 = NSStringFromClass(v34);
    [v33 handleFailureInMethod:a2, self, @"PUSidebarReorderController.m", 124, @"%@ should be an instance inheriting from %@, but it is nil", @"childInfo.collection", v35 object file lineNumber description];
  }

LABEL_10:
  v28 = [v9 collection];
  if (!v28)
  {
    v42 = [MEMORY[0x1E4F28B00] currentHandler];
    v37 = (objc_class *)objc_opt_class();
    v38 = NSStringFromClass(v37);
    [v42 handleFailureInMethod:a2, self, @"PUSidebarReorderController.m", 125, @"%@ should be an instance inheriting from %@, but it is nil", @"insertedItem.collection", v38 object file lineNumber description];
LABEL_20:

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v42 = [MEMORY[0x1E4F28B00] currentHandler];
    v39 = (objc_class *)objc_opt_class();
    v38 = NSStringFromClass(v39);
    v40 = objc_msgSend(v28, "px_descriptionForAssertionMessage");
    [v42 handleFailureInMethod:a2, self, @"PUSidebarReorderController.m", 125, @"%@ should be an instance inheriting from %@, but it is %@", @"insertedItem.collection", v38, v40 object file lineNumber description];

    goto LABEL_20;
  }
LABEL_12:
  v29 = [v27 photoLibrary];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __60__PUSidebarReorderController_performReorderWithTransaction___block_invoke_2;
  v47[3] = &unk_1E5F2BAD8;
  id v48 = v27;
  id v49 = v26;
  char v51 = v44;
  id v50 = v28;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __60__PUSidebarReorderController_performReorderWithTransaction___block_invoke_3;
  v46[3] = &unk_1E5F2E3B8;
  v46[4] = self;
  id v30 = v28;
  id v31 = v26;
  id v32 = v27;
  [v29 performChanges:v47 completionHandler:v46];

LABEL_14:
}

void __60__PUSidebarReorderController_performReorderWithTransaction___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) sidebarOutlineSectionController];
  objc_msgSend(v1, "reloadFromDataControllerApplyAnimated:onQueue:", objc_msgSend(v1, "animateDataSourceUpdates"), 0);
}

void __60__PUSidebarReorderController_performReorderWithTransaction___block_invoke_2(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F39010];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = [*(id *)(a1 + 40) fetchResult];
  v5 = [v2 changeRequestForCollectionList:v3 childCollections:v4];

  if (*(unsigned char *)(a1 + 56))
  {
    v12[0] = *(void *)(a1 + 48);
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v5 removeChildCollections:v6];
  }
  uint64_t v7 = [*(id *)(a1 + 40) childIndexInFetchResult];
  if (v7 != *MEMORY[0x1E4F91020])
  {
    uint64_t v8 = v7;
    uint64_t v11 = *(void *)(a1 + 48);
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    v10 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v8];
    [v5 insertChildCollections:v9 atIndexes:v10];
  }
}

void __60__PUSidebarReorderController_performReorderWithTransaction___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Item reordering failed with error %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v7 = [*(id *)(a1 + 32) sidebarOutlineSectionController];
    objc_msgSend(v7, "reloadFromDataControllerApplyAnimated:onQueue:", objc_msgSend(v7, "animateDataSourceUpdates"), 0);
  }
}

- (id)targetIndexPathForMoveFromItemAtIndexPath:(id)a3 toProposedIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(PUSidebarReorderController *)self itemToReorder];
  if (!v8)
  {
    id v9 = PXAssertGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_FAULT, "Expected to have an item to move", buf, 2u);
    }
  }
  uint64_t v10 = [(PUSidebarReorderController *)self dataSource];
  uint64_t v11 = [v10 itemIdentifierForIndexPath:v7];
  if (![v8 isReorderable] || (objc_msgSend(v11, "isReorderable") & 1) == 0)
  {
    id v27 = v6;
    goto LABEL_22;
  }
  id v30 = v6;
  v12 = [(PUSidebarReorderController *)self sidebarOutlineSectionController];
  v13 = [v12 currentSectionSnapshot];

  v14 = [v13 parentOfChildItem:v8];
  v15 = [v14 collection];
  int v16 = [v15 canPerformEditOperation:5];

  id v17 = [v13 parentOfChildItem:v11];
  v18 = [v17 collection];
  int v19 = v16 & [v18 canPerformEditOperation:5];

  id v20 = v17;
  v21 = v20;
  if (v19 != 1 || !v20)
  {
    v23 = v20;
    if ((v19 & 1) == 0)
    {
LABEL_20:
      id v6 = v30;
      id v28 = v30;

      id v7 = v28;
      goto LABEL_21;
    }
    goto LABEL_17;
  }
  uint64_t v22 = [v13 levelOfItem:v20];
  if (v22 <= [v13 levelOfItem:v14])
  {
LABEL_17:
    v23 = v21;
    goto LABEL_18;
  }
  v23 = v21;
  while (1)
  {
    v24 = v23;
    char v25 = [v23 isEqual:v8];
    v23 = [v13 parentOfChildItem:v23];

    if ((v25 & 1) != 0 || !v23) {
      break;
    }
    uint64_t v26 = [v13 levelOfItem:v21];
    if (v26 <= [v13 levelOfItem:v14]) {
      goto LABEL_18;
    }
  }
  if (v25) {
    goto LABEL_20;
  }
LABEL_18:
  id v6 = v30;
LABEL_21:
  id v7 = v7;

  id v27 = v7;
LABEL_22:

  return v27;
}

- (BOOL)canReorderItem:(id)a3
{
  id v4 = a3;
  [(PUSidebarReorderController *)self setItemToReorder:v4];
  LOBYTE(self) = [v4 isReorderable];

  return (char)self;
}

- (PUSidebarReorderController)initWithDataSource:(id)a3 outlineSectionController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUSidebarReorderController;
  id v9 = [(PUSidebarReorderController *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSource, a3);
    objc_storeStrong((id *)&v10->_sidebarOutlineSectionController, a4);
  }

  return v10;
}

@end