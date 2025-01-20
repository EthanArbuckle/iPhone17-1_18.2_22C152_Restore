@interface PXComposeRecipientSelectionManager
- (PXComposeRecipientDataSource)dataSource;
- (PXComposeRecipientSelectionManager)init;
- (PXComposeRecipientSelectionManager)initWithDataSource:(id)a3;
- (PXComposeRecipientSelectionManagerDelegate)delegate;
- (PXComposeRecipientSelectionSnapshot)selectionSnapshot;
- (id)_createComposeRecipientSelectionSnapshotFromCurrentState;
- (id)_setSelectedState:(BOOL)a3 forComposeRecipients:(id)a4;
- (void)_invalidateCurrentSelectionSnapshotWithChangedComposeRecipients:(id)a3;
- (void)selectAll;
- (void)setDataSource:(id)a3 changeDetails:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setSelectedState:(BOOL)a3 atIndex:(int64_t)a4;
- (void)setSelectionSnapshot:(id)a3;
@end

@implementation PXComposeRecipientSelectionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_selectedRecipients, 0);
  objc_storeStrong((id *)&self->_selectedComposeRecipients, 0);
}

- (void)setSelectionSnapshot:(id)a3
{
}

- (PXComposeRecipientSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (void)setDelegate:(id)a3
{
}

- (PXComposeRecipientSelectionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXComposeRecipientSelectionManagerDelegate *)WeakRetained;
}

- (PXComposeRecipientDataSource)dataSource
{
  return self->_dataSource;
}

- (void)_invalidateCurrentSelectionSnapshotWithChangedComposeRecipients:(id)a3
{
  id v4 = a3;
  v5 = [(PXComposeRecipientSelectionManager *)self selectionSnapshot];
  id v12 = [v5 selectedComposeRecipients];

  v6 = [(PXComposeRecipientSelectionManager *)self _createComposeRecipientSelectionSnapshotFromCurrentState];
  [(PXComposeRecipientSelectionManager *)self setSelectionSnapshot:v6];
  v7 = [(PXComposeRecipientSelectionManager *)self selectionSnapshot];
  v8 = [v7 selectedComposeRecipients];

  if (v4) {
    id v9 = v4;
  }
  else {
    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }
  v10 = [off_1E5DA5568 changeDetailsFromArray:v12 toArray:v8 changedObjects:v9];

  v11 = [(PXComposeRecipientSelectionManager *)self delegate];
  [v11 composeRecipientSelectionManager:self didUpdateSelectionSnapshotWithChangeDetails:v10];
}

- (id)_createComposeRecipientSelectionSnapshotFromCurrentState
{
  v3 = [PXComposeRecipientSelectionSnapshot alloc];
  id v4 = [(NSMutableOrderedSet *)self->_selectedComposeRecipients array];
  v5 = [(NSMutableOrderedSet *)self->_selectedRecipients array];
  v6 = [(PXComposeRecipientSelectionSnapshot *)v3 initWithSelectedComposeRecipients:v4 selectedRecipients:v5];

  return v6;
}

- (id)_setSelectedState:(BOOL)a3 forComposeRecipients:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = a4;
  v8 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__PXComposeRecipientSelectionManager__setSelectedState_forComposeRecipients___block_invoke;
  v13[3] = &unk_1E5DC7858;
  BOOL v15 = a3;
  v13[4] = self;
  id v9 = v8;
  id v14 = v9;
  [v7 enumerateObjectsUsingBlock:v13];

  v10 = v14;
  id v11 = v9;

  return v11;
}

void __77__PXComposeRecipientSelectionManager__setSelectedState_forComposeRecipients___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 recipient];
  int v4 = *(unsigned __int8 *)(a1 + 48);
  int v5 = [*(id *)(*(void *)(a1 + 32) + 8) containsObject:v7];
  if (v4) {
    BOOL v6 = v3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (!v5) {
      goto LABEL_12;
    }
    [*(id *)(*(void *)(a1 + 32) + 8) removeObject:v7];
    if (v3) {
      [*(id *)(*(void *)(a1 + 32) + 16) removeObject:v3];
    }
  }
  else
  {
    if (v5) {
      goto LABEL_12;
    }
    [*(id *)(*(void *)(a1 + 32) + 8) addObject:v7];
    [*(id *)(*(void *)(a1 + 32) + 16) addObject:v3];
  }
  [*(id *)(a1 + 40) addObject:v7];
LABEL_12:
}

- (void)setSelectedState:(BOOL)a3 atIndex:(int64_t)a4
{
  BOOL v5 = a3;
  v14[1] = *MEMORY[0x1E4F143B8];
  v8 = [(PXComposeRecipientSelectionManager *)self dataSource];
  id v9 = [v8 composeRecipients];

  v10 = [v9 objectAtIndexedSubscript:a4];
  if (!v10)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXComposeRecipientSelectionManager.m", 125, @"Invalid parameter not satisfying: %@", @"composeRecipient" object file lineNumber description];
  }
  v14[0] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v12 = [(PXComposeRecipientSelectionManager *)self _setSelectedState:v5 forComposeRecipients:v11];

  if ([v12 count]) {
    [(PXComposeRecipientSelectionManager *)self _invalidateCurrentSelectionSnapshotWithChangedComposeRecipients:v12];
  }
}

- (void)selectAll
{
  v3 = [(PXComposeRecipientSelectionManager *)self dataSource];
  id v9 = [v3 composeRecipients];

  uint64_t v4 = [v9 count];
  id v7 = v9;
  if (v4)
  {
    v8 = [(PXComposeRecipientSelectionManager *)self _setSelectedState:1 forComposeRecipients:v9];
    if ([v8 count]) {
      [(PXComposeRecipientSelectionManager *)self _invalidateCurrentSelectionSnapshotWithChangedComposeRecipients:v8];
    }

    id v7 = v9;
  }
  MEMORY[0x1F4181870](v4, v5, v6, v7);
}

- (void)setDataSource:(id)a3 changeDetails:(id)a4
{
  id v7 = (PXComposeRecipientDataSource *)a3;
  dataSource = self->_dataSource;
  if (dataSource != v7)
  {
    id v9 = dataSource;
    objc_storeStrong((id *)&self->_dataSource, a3);
    id v10 = a4;
    id v11 = [v10 removedIndexes];
    id v12 = [MEMORY[0x1E4F28E60] indexSet];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __66__PXComposeRecipientSelectionManager_setDataSource_changeDetails___block_invoke;
    v21[3] = &unk_1E5DD3088;
    v13 = v9;
    v22 = v13;
    v23 = self;
    id v14 = v12;
    id v24 = v14;
    [v11 enumerateIndexesUsingBlock:v21];
    BOOL v15 = [v10 changedIndexes];

    v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __66__PXComposeRecipientSelectionManager_setDataSource_changeDetails___block_invoke_2;
    v19[3] = &unk_1E5DD1558;
    v19[4] = self;
    id v17 = v16;
    id v20 = v17;
    [v15 enumerateIndexesUsingBlock:v19];
    if ([v17 count])
    {
      v18 = [(PXComposeRecipientSelectionManager *)self _setSelectedState:0 forComposeRecipients:v17];
    }
    else
    {
      v18 = 0;
    }
    if ([v14 count] || objc_msgSend(v18, "count")) {
      [(PXComposeRecipientSelectionManager *)self _invalidateCurrentSelectionSnapshotWithChangedComposeRecipients:v18];
    }
  }
}

void __66__PXComposeRecipientSelectionManager_setDataSource_changeDetails___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) composeRecipients];
  v8 = [v4 objectAtIndexedSubscript:a2];

  int v5 = [*(id *)(*(void *)(a1 + 40) + 8) containsObject:v8];
  uint64_t v6 = v8;
  if (v5)
  {
    [*(id *)(*(void *)(a1 + 40) + 8) removeObject:v8];
    [*(id *)(a1 + 48) addIndex:a2];
    id v7 = [v8 recipient];
    if (v7) {
      [*(id *)(*(void *)(a1 + 40) + 16) removeObject:v7];
    }

    uint64_t v6 = v8;
  }
}

void __66__PXComposeRecipientSelectionManager_setDataSource_changeDetails___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 24) composeRecipients];
  v8 = [v4 objectAtIndexedSubscript:a2];

  int v5 = [*(id *)(*(void *)(a1 + 32) + 8) containsObject:v8];
  uint64_t v6 = v8;
  if (v5)
  {
    id v7 = [v8 recipient];
    if (!v7) {
      [*(id *)(a1 + 40) addObject:v8];
    }

    uint64_t v6 = v8;
  }
}

- (PXComposeRecipientSelectionManager)initWithDataSource:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXComposeRecipientSelectionManager.m", 57, @"Invalid parameter not satisfying: %@", @"dataSource" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PXComposeRecipientSelectionManager;
  id v7 = [(PXComposeRecipientSelectionManager *)&v15 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_dataSource, a3);
    uint64_t v9 = [MEMORY[0x1E4F1CA70] orderedSet];
    selectedComposeRecipients = v8->_selectedComposeRecipients;
    v8->_selectedComposeRecipients = (NSMutableOrderedSet *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA70] orderedSet];
    selectedRecipients = v8->_selectedRecipients;
    v8->_selectedRecipients = (NSMutableOrderedSet *)v11;
  }
  return v8;
}

- (PXComposeRecipientSelectionManager)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXComposeRecipientSelectionManager.m", 53, @"%s is not available as initializer", "-[PXComposeRecipientSelectionManager init]");

  abort();
}

@end