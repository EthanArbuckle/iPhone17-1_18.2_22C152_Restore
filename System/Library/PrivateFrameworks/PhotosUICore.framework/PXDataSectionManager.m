@interface PXDataSectionManager
- (BOOL)allowsEmptyDataSection;
- (BOOL)isChangeProcessingPaused;
- (BOOL)isDataSectionEmpty;
- (BOOL)shouldInvalidateDataSectionForChildDataSectionManager:(id)a3 changeDescriptor:(unint64_t)a4;
- (NSArray)childDataSectionManagers;
- (NSObject)outlineObject;
- (PXArrayChangeDetails)changeDetailsFromPreviousDataSection;
- (PXDataSection)dataSection;
- (PXDataSection)dataSectionIfCreated;
- (PXDataSection)previousDataSection;
- (PXDataSectionManager)init;
- (PXDataSectionManager)initWithChildDataSectionManagers:(id)a3;
- (id)auxiliaryObjectForKey:(id)a3 dataSectionObject:(id)a4 hintIndex:(int64_t)a5;
- (id)changeDetailsForChangedChildDataSectionManager:(id)a3 childChangeDetails:(id)a4;
- (id)changeDetailsForChildDataSectionManagersChangeDetails:(id)a3;
- (id)createDataSection;
- (int64_t)previousDataSectionIdentifier;
- (void)_registerAsChangeObserverForDataSectionManagers:(id)a3;
- (void)_setDataSection:(id)a3 changeDetails:(id)a4;
- (void)_unregisterAsChangeObserverForDataSectionManagers:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setChangeProcessingPaused:(BOOL)a3 forReason:(id)a4;
- (void)setChildDataSectionManagers:(id)a3;
- (void)setOutlineObject:(id)a3;
- (void)updateDataSectionWithChangeDetails:(id)a3;
@end

@implementation PXDataSectionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousDataSection, 0);
  objc_storeStrong((id *)&self->_changeDetailsFromPreviousDataSection, 0);
  objc_storeStrong((id *)&self->_outlineObject, 0);
  objc_storeStrong((id *)&self->_childDataSectionManagers, 0);
  objc_storeStrong((id *)&self->_dataSection, 0);
}

- (int64_t)previousDataSectionIdentifier
{
  return self->_previousDataSectionIdentifier;
}

- (PXDataSection)previousDataSection
{
  return self->_previousDataSection;
}

- (PXArrayChangeDetails)changeDetailsFromPreviousDataSection
{
  return self->_changeDetailsFromPreviousDataSection;
}

- (void)setOutlineObject:(id)a3
{
}

- (NSObject)outlineObject
{
  return self->_outlineObject;
}

- (NSArray)childDataSectionManagers
{
  return self->_childDataSectionManagers;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((void *)PXChildDataSourceManagerObserverContext == a5)
  {
    id v15 = v8;
    id v9 = v8;
    uint64_t v10 = [(PXDataSectionManager *)self dataSectionIfCreated];
    if (v10)
    {
      v11 = (void *)v10;
      BOOL v12 = [(PXDataSectionManager *)self shouldInvalidateDataSectionForChildDataSectionManager:v9 changeDescriptor:a4];

      if (v12)
      {
        v13 = [v9 changeDetailsFromPreviousDataSection];
        [(PXDataSectionManager *)self childDataSectionManager:v9 didChangeDataSectionWithChangeDetails:v13];
        v14 = [(PXDataSectionManager *)self changeDetailsForChangedChildDataSectionManager:v9 childChangeDetails:v13];
        [(PXDataSectionManager *)self updateDataSectionWithChangeDetails:v14];
      }
    }

    id v8 = v15;
  }
}

- (void)setChangeProcessingPaused:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v7 = [(PXDataSectionManager *)self childDataSectionManagers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) setChangeProcessingPaused:v4 forReason:v6];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)isChangeProcessingPaused
{
}

uint64_t __48__PXDataSectionManager_isChangeProcessingPaused__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isChangeProcessingPaused];
}

- (BOOL)shouldInvalidateDataSectionForChildDataSectionManager:(id)a3 changeDescriptor:(unint64_t)a4
{
  return a4 & 1;
}

- (id)auxiliaryObjectForKey:(id)a3 dataSectionObject:(id)a4 hintIndex:(int64_t)a5
{
  return 0;
}

- (id)changeDetailsForChangedChildDataSectionManager:(id)a3 childChangeDetails:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v10 = (objc_class *)objc_opt_class();
  uint64_t v11 = NSStringFromClass(v10);
  [v9 handleFailureInMethod:a2, self, @"PXDataSectionManager.m", 129, @"Method %s is a responsibility of subclass %@", "-[PXDataSectionManager changeDetailsForChangedChildDataSectionManager:childChangeDetails:]", v11 object file lineNumber description];

  abort();
}

- (id)changeDetailsForChildDataSectionManagersChangeDetails:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXDataSectionManager.m", 125, @"Method %s is a responsibility of subclass %@", "-[PXDataSectionManager changeDetailsForChildDataSectionManagersChangeDetails:]", v8 object file lineNumber description];

  abort();
}

- (void)setChildDataSectionManagers:(id)a3
{
  v19 = (NSArray *)a3;
  BOOL v4 = self->_childDataSectionManagers;
  id v5 = v19;
  if (v4 != v19)
  {
    id v6 = v4;
    char v7 = -[NSArray isEqual:](v4, "isEqual:");

    id v8 = v19;
    if (v7) {
      goto LABEL_9;
    }
    id v5 = [off_1E5DA5568 changeDetailsFromArray:self->_childDataSectionManagers toArray:v19 changedObjects:MEMORY[0x1E4F1CBF0]];
    int v9 = [v5 hasIncrementalChanges];
    childDataSectionManagers = self->_childDataSectionManagers;
    if (v9)
    {
      uint64_t v11 = [v5 removedIndexes];
      long long v12 = [(NSArray *)childDataSectionManagers objectsAtIndexes:v11];
      [(PXDataSectionManager *)self _unregisterAsChangeObserverForDataSectionManagers:v12];

      long long v13 = [v5 insertedIndexes];
      long long v14 = [(NSArray *)v19 objectsAtIndexes:v13];
      [(PXDataSectionManager *)self _registerAsChangeObserverForDataSectionManagers:v14];
    }
    else
    {
      [(PXDataSectionManager *)self _unregisterAsChangeObserverForDataSectionManagers:self->_childDataSectionManagers];
      [(PXDataSectionManager *)self _registerAsChangeObserverForDataSectionManagers:v19];
    }
    long long v15 = (NSArray *)[(NSArray *)v19 copy];
    v16 = self->_childDataSectionManagers;
    self->_childDataSectionManagers = v15;

    uint64_t v17 = [(PXDataSectionManager *)self dataSectionIfCreated];

    if (v17)
    {
      v18 = [(PXDataSectionManager *)self changeDetailsForChildDataSectionManagersChangeDetails:v5];
      [(PXDataSectionManager *)self updateDataSectionWithChangeDetails:v18];
    }
  }

  id v8 = v19;
LABEL_9:
}

- (BOOL)isDataSectionEmpty
{
  v2 = [(PXDataSectionManager *)self dataSection];
  char v3 = [v2 containsAnyObjects] ^ 1;

  return v3;
}

- (PXDataSection)dataSection
{
  dataSection = self->_dataSection;
  if (!dataSection)
  {
    BOOL v4 = [(PXDataSectionManager *)self createDataSection];
    id v5 = self->_dataSection;
    self->_dataSection = v4;

    dataSection = self->_dataSection;
  }
  return dataSection;
}

- (PXDataSection)dataSectionIfCreated
{
  return self->_dataSection;
}

- (id)createDataSection
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXDataSectionManager.m", 85, @"Method %s is a responsibility of subclass %@", "-[PXDataSectionManager createDataSection]", v6 object file lineNumber description];

  abort();
}

- (void)updateDataSectionWithChangeDetails:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(PXDataSectionManager *)self createDataSection];
    [(PXDataSectionManager *)self _setDataSection:v5 changeDetails:v4];
  }
}

- (void)_setDataSection:(id)a3 changeDetails:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__PXDataSectionManager__setDataSection_changeDetails___block_invoke;
  v11[3] = &unk_1E5DD11E8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PXDataSectionManager *)self performChanges:v11];
  previousDataSection = self->_previousDataSection;
  self->_previousDataSection = 0;
}

uint64_t __54__PXDataSectionManager__setDataSection_changeDetails___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) identifier];
  uint64_t result = [*(id *)(a1 + 40) identifier];
  if (v2 != result)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), *(id *)(*(void *)(a1 + 32) + 96));
    *(void *)(*(void *)(a1 + 32) + 136) = [*(id *)(a1 + 40) identifier];
    if (([*(id *)(a1 + 48) hasIncrementalChanges] & 1) != 0
      || [*(id *)(*(void *)(a1 + 32) + 96) count]
      || [*(id *)(a1 + 40) count])
    {
      uint64_t v4 = *(void *)(a1 + 32);
      id v5 = *(id *)(a1 + 48);
      id v6 = *(void **)(v4 + 120);
      *(void *)(v4 + 120) = v5;
    }
    else
    {
      uint64_t v8 = [off_1E5DA5568 changeDetailsWithNoChanges];
      uint64_t v9 = *(void *)(a1 + 32);
      id v6 = *(void **)(v9 + 120);
      *(void *)(v9 + 120) = v8;
    }

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), *(id *)(a1 + 40));
    id v7 = *(void **)(a1 + 32);
    return [v7 signalChange:1];
  }
  return result;
}

- (void)_unregisterAsChangeObserverForDataSectionManagers:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) registerChangeObserver:self context:PXChildDataSourceManagerObserverContext];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_registerAsChangeObserverForDataSectionManagers:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) registerChangeObserver:self context:PXChildDataSourceManagerObserverContext];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)allowsEmptyDataSection
{
  return 0;
}

- (PXDataSectionManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v5 = NSStringFromSelector(sel_initWithChildDataSectionManagers_);
  [v4 handleFailureInMethod:a2, self, @"PXDataSectionManager.m", 36, @"Use the designated initializer %@", v5 object file lineNumber description];

  abort();
}

- (PXDataSectionManager)initWithChildDataSectionManagers:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXDataSectionManager;
  uint64_t v5 = [(PXDataSectionManager *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    childDataSectionManagers = v5->_childDataSectionManagers;
    v5->_childDataSectionManagers = (NSArray *)v6;

    [(PXDataSectionManager *)v5 _registerAsChangeObserverForDataSectionManagers:v5->_childDataSectionManagers];
  }

  return v5;
}

@end