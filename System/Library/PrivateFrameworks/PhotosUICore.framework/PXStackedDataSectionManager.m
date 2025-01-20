@interface PXStackedDataSectionManager
- (BOOL)_updateDataSectionIfNecessary;
- (BOOL)alwaysContainsObjects;
- (BOOL)isDataSectionEmpty;
- (BOOL)isEnabled;
- (PXDataSectionEnablementForwarder)enablementForwarder;
- (PXStackedDataSectionManager)initWithChildDataSectionManagers:(id)a3;
- (id)auxiliaryObjectForKey:(id)a3 dataSectionObject:(id)a4 hintIndex:(int64_t)a5;
- (id)changeDetailsForChangedChildDataSectionManager:(id)a3 childChangeDetails:(id)a4;
- (id)changeDetailsForChildDataSectionManagersChangeDetails:(id)a3;
- (id)childDataSectionManagerForObjectAtIndex:(int64_t)a3 localIndex:(int64_t *)a4;
- (id)createDataSection;
- (void)setAlwaysContainsObjects:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnablementForwarder:(id)a3;
- (void)setOutlineObject:(id)a3;
@end

@implementation PXStackedDataSectionManager

- (void).cxx_destruct
{
}

- (void)setAlwaysContainsObjects:(BOOL)a3
{
  self->_alwaysContainsObjects = a3;
}

- (BOOL)alwaysContainsObjects
{
  return self->_alwaysContainsObjects;
}

- (void)setEnablementForwarder:(id)a3
{
}

- (PXDataSectionEnablementForwarder)enablementForwarder
{
  return self->_enablementForwarder;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (id)auxiliaryObjectForKey:(id)a3 dataSectionObject:(id)a4 hintIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__82997;
  v24 = __Block_byref_object_dispose__82998;
  id v25 = 0;
  v10 = [(PXDataSectionManager *)self childDataSectionManagers];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__PXStackedDataSectionManager_auxiliaryObjectForKey_dataSectionObject_hintIndex___block_invoke;
  v15[3] = &unk_1E5DB7A18;
  v18 = &v20;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  int64_t v19 = a5;
  [v10 enumerateObjectsUsingBlock:v15];
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __81__PXStackedDataSectionManager_auxiliaryObjectForKey_dataSectionObject_hintIndex___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 auxiliaryObjectForKey:a1[4] dataSectionObject:a1[5] hintIndex:a1[7]];
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(a1[6] + 8) + 40)) {
    *a4 = 1;
  }
}

- (id)changeDetailsForChangedChildDataSectionManager:(id)a3 childChangeDetails:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PXDataSectionManager *)self childDataSectionManagers];
  uint64_t v9 = [v8 indexOfObject:v7];

  uint64_t v10 = [(PXDataSectionManager *)self dataSectionIfCreated];
  id v11 = (void *)v10;
  id v12 = 0;
  if (v9 != 0x7FFFFFFFFFFFFFFFLL && v10)
  {
    if ([(PXStackedDataSectionManager *)self isEnabled])
    {
      id v12 = objc_msgSend(v6, "changeDetailsShiftedBy:", objc_msgSend(v11, "itemStartIndexForChildDataSourceAtIndex:", v9));
    }
    else
    {
      id v12 = 0;
    }
  }

  return v12;
}

- (id)changeDetailsForChildDataSectionManagersChangeDetails:(id)a3
{
  id v4 = a3;
  v5 = [(PXDataSectionManager *)self dataSectionIfCreated];
  if (v5 && [v4 hasIncrementalChanges] && (objc_msgSend(v4, "hasMoves") & 1) == 0)
  {
    id v8 = [(PXStackedDataSectionManager *)self createDataSection];
    uint64_t v9 = objc_opt_new();
    uint64_t v10 = [v4 removedIndexes];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __85__PXStackedDataSectionManager_changeDetailsForChildDataSectionManagersChangeDetails___block_invoke;
    v30[3] = &unk_1E5DD1558;
    id v31 = v5;
    id v32 = v9;
    id v11 = v9;
    [v10 enumerateIndexesUsingBlock:v30];

    id v12 = objc_opt_new();
    id v13 = [v4 insertedIndexes];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __85__PXStackedDataSectionManager_changeDetailsForChildDataSectionManagersChangeDetails___block_invoke_2;
    v27[3] = &unk_1E5DD1558;
    id v14 = v8;
    id v28 = v14;
    id v29 = v12;
    id v15 = v12;
    [v13 enumerateIndexesUsingBlock:v27];

    id v16 = objc_opt_new();
    id v17 = [v4 changedIndexes];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __85__PXStackedDataSectionManager_changeDetailsForChildDataSectionManagersChangeDetails___block_invoke_3;
    v24 = &unk_1E5DD1558;
    id v25 = v14;
    id v26 = v16;
    id v18 = v16;
    id v19 = v14;
    [v17 enumerateIndexesUsingBlock:&v21];

    id v20 = objc_alloc((Class)off_1E5DA5568);
    id v6 = objc_msgSend(v20, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v11, v15, 0, 0, v18, v21, v22, v23, v24);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __85__PXStackedDataSectionManager_changeDetailsForChildDataSectionManagersChangeDetails___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) childDataSections];
  id v5 = [v4 objectAtIndexedSubscript:a2];

  objc_msgSend(*(id *)(a1 + 40), "addIndexesInRange:", objc_msgSend(*(id *)(a1 + 32), "itemStartIndexForChildDataSourceAtIndex:", a2), objc_msgSend(v5, "count"));
}

void __85__PXStackedDataSectionManager_changeDetailsForChildDataSectionManagersChangeDetails___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) childDataSections];
  id v5 = [v4 objectAtIndexedSubscript:a2];

  objc_msgSend(*(id *)(a1 + 40), "addIndexesInRange:", objc_msgSend(*(id *)(a1 + 32), "itemStartIndexForChildDataSourceAtIndex:", a2), objc_msgSend(v5, "count"));
}

void __85__PXStackedDataSectionManager_changeDetailsForChildDataSectionManagersChangeDetails___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) childDataSections];
  id v5 = [v4 objectAtIndexedSubscript:a2];

  objc_msgSend(*(id *)(a1 + 40), "addIndexesInRange:", objc_msgSend(*(id *)(a1 + 32), "itemStartIndexForChildDataSourceAtIndex:", a2), objc_msgSend(v5, "count"));
}

- (BOOL)isDataSectionEmpty
{
  if (![(PXStackedDataSectionManager *)self isEnabled]) {
    return 1;
  }
  if ([(PXStackedDataSectionManager *)self alwaysContainsObjects]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PXStackedDataSectionManager;
  return [(PXDataSectionManager *)&v4 isDataSectionEmpty];
}

- (id)createDataSection
{
  if ([(PXStackedDataSectionManager *)self isEnabled])
  {
    [(PXDataSectionManager *)self childDataSectionManagers];
    objc_claimAutoreleasedReturnValue();
    PXMap();
  }
  v3 = (void *)MEMORY[0x1E4F1CBF0];
  objc_super v4 = [PXStackedDataSection alloc];
  id v5 = [(PXDataSectionManager *)self outlineObject];
  id v6 = [(PXStackedDataSection *)v4 initWithChildDataSections:v3 outlineObject:v5];

  return v6;
}

uint64_t __48__PXStackedDataSectionManager_createDataSection__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dataSection];
}

- (void)setOutlineObject:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXStackedDataSectionManager;
  [(PXDataSectionManager *)&v14 setOutlineObject:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(PXDataSectionManager *)self childDataSectionManagers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setOutlineObject:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (BOOL)_updateDataSectionIfNecessary
{
  v3 = [(PXDataSectionManager *)self dataSectionIfCreated];
  id v4 = v3;
  if (!v3) {
    goto LABEL_10;
  }
  if ([v3 count] || !-[PXStackedDataSectionManager isEnabled](self, "isEnabled"))
  {
    if ([v4 count] < 1) {
      goto LABEL_10;
    }
    if ([(PXStackedDataSectionManager *)self isEnabled]) {
      goto LABEL_10;
    }
    uint64_t v6 = objc_msgSend(off_1E5DA5568, "changeDetailsWithRemovedIndexRange:", 0, objc_msgSend(v4, "count"));
    if (!v6) {
      goto LABEL_10;
    }
  }
  else
  {
    id v5 = [(PXStackedDataSectionManager *)self createDataSection];
    uint64_t v6 = objc_msgSend(off_1E5DA5568, "changeDetailsWithInsertedIndexRange:", 0, objc_msgSend(v5, "count"));

    if (!v6)
    {
LABEL_10:
      BOOL v7 = 0;
      goto LABEL_11;
    }
  }
  [(PXDataSectionManager *)self updateDataSectionWithChangeDetails:v6];

  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __42__PXStackedDataSectionManager_setEnabled___block_invoke;
    v3[3] = &unk_1E5DCEB78;
    v3[4] = self;
    BOOL v4 = a3;
    [(PXStackedDataSectionManager *)self performChanges:v3];
  }
}

uint64_t __42__PXStackedDataSectionManager_setEnabled___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 144) = *(unsigned char *)(a1 + 40);
  uint64_t result = [*(id *)(a1 + 32) _updateDataSectionIfNecessary];
  if ((result & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    return [v3 signalChange:4];
  }
  return result;
}

- (id)childDataSectionManagerForObjectAtIndex:(int64_t)a3 localIndex:(int64_t *)a4
{
  BOOL v7 = [(PXDataSectionManager *)self dataSection];
  uint64_t v8 = [v7 indexOfChildDataSourceForObjectAtIndex:a3 localIndex:a4];

  uint64_t v9 = [(PXDataSectionManager *)self childDataSectionManagers];
  long long v10 = [v9 objectAtIndexedSubscript:v8];

  return v10;
}

- (PXStackedDataSectionManager)initWithChildDataSectionManagers:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXStackedDataSectionManager;
  uint64_t result = [(PXDataSectionManager *)&v4 initWithChildDataSectionManagers:a3];
  if (result) {
    result->_enabled = 1;
  }
  return result;
}

@end