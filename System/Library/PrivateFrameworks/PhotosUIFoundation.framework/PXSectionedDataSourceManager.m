@interface PXSectionedDataSourceManager
- (PXSectionedChangeDetailsRepository)changeHistory;
- (PXSectionedDataSource)dataSource;
- (PXSectionedDataSource)dataSourceIfExists;
- (PXSectionedDataSourceManager)init;
- (id)allChangeDetailsFromDataSource:(id)a3 toDataSource:(id)a4;
- (id)changeDetailsFromDataSource:(id)a3 toDataSource:(id)a4;
- (id)createInitialDataSource;
- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4;
- (id)queryObserversInterestingObjectReferences;
- (void)_reevaluateWaitingConditions;
- (void)_setDataSource:(id)a3;
- (void)_waitingConditionDidTimeout:(id)a3;
- (void)didPublishChanges;
- (void)registerChangeObserver:(id)a3 context:(void *)a4;
- (void)setDataSource:(id)a3 changeDetails:(id)a4;
- (void)setDataSource:(id)a3 changeDetailsArray:(id)a4;
- (void)unregisterChangeObserver:(id)a3 context:(void *)a4;
- (void)waitForCondition:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
@end

@implementation PXSectionedDataSourceManager

- (PXSectionedDataSourceManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXSectionedDataSourceManager;
  v2 = [(PXObservable *)&v6 init];
  if (v2)
  {
    v3 = [[PXSectionedChangeDetailsRepository alloc] initWithChangeHistoryLimit:100];
    changeHistory = v2->_changeHistory;
    v2->_changeHistory = v3;
  }
  return v2;
}

- (void)registerChangeObserver:(id)a3 context:(void *)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PXSectionedDataSourceManager;
  [(PXObservable *)&v4 registerChangeObserver:a3 context:a4];
}

- (PXSectionedDataSource)dataSource
{
  dataSource = self->_dataSource;
  if (!dataSource)
  {
    objc_super v4 = [(PXSectionedDataSourceManager *)self createInitialDataSource];
    v5 = self->_dataSource;
    self->_dataSource = v4;

    [(PXSectionedDataSourceManager *)self didCreateInitialDataSource];
    dataSource = self->_dataSource;
  }

  return dataSource;
}

- (void)didPublishChanges
{
  v3.receiver = self;
  v3.super_class = (Class)PXSectionedDataSourceManager;
  [(PXObservable *)&v3 didPublishChanges];
  if ([(PXObservable *)self currentChanges]) {
    [(PXSectionedDataSourceManager *)self _reevaluateWaitingConditions];
  }
}

- (void)_reevaluateWaitingConditions
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ([(NSMutableArray *)self->_waitingConditions count])
  {
    id v3 = objc_alloc_init(MEMORY[0x263F089C8]);
    objc_super v4 = [(PXSectionedDataSourceManager *)self dataSource];
    waitingConditions = self->_waitingConditions;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __60__PXSectionedDataSourceManager__reevaluateWaitingConditions__block_invoke;
    v19[3] = &unk_26545ADC8;
    id v6 = v4;
    id v20 = v6;
    id v7 = v3;
    id v21 = v7;
    [(NSMutableArray *)waitingConditions enumerateObjectsUsingBlock:v19];
    if ([v7 count])
    {
      v8 = [(NSMutableArray *)self->_waitingConditions objectsAtIndexes:v7];
      [(NSMutableArray *)self->_waitingConditions removeObjectsAtIndexes:v7];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v16;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v16 != v12) {
              objc_enumerationMutation(v9);
            }
            objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v13), "completionHandler", (void)v15);
            v14 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
            v14[2](v14, 1);

            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v22 count:16];
        }
        while (v11);
      }
    }
  }
}

- (void)setDataSource:(id)a3 changeDetails:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v11 = v6;
    v8 = (void *)MEMORY[0x263EFF8C0];
    id v9 = a3;
    id v10 = [v8 arrayWithObjects:&v11 count:1];
    -[PXSectionedDataSourceManager setDataSource:changeDetailsArray:](self, "setDataSource:changeDetailsArray:", v9, v10, v11, v12);
  }
  else
  {
    id v10 = a3;
    [(PXSectionedDataSourceManager *)self setDataSource:v10 changeDetailsArray:0];
  }
}

- (void)setDataSource:(id)a3 changeDetailsArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__PXSectionedDataSourceManager_setDataSource_changeDetailsArray___block_invoke;
  v10[3] = &unk_26545ADF0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PXObservable *)self performChanges:v10];
}

void __65__PXSectionedDataSourceManager_setDataSource_changeDetailsArray___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _setDataSource:*(void *)(a1 + 40)];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 48);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        id v8 = objc_msgSend(*(id *)(a1 + 32), "changeHistory", (void)v9);
        [v8 addChangeDetails:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)_setDataSource:(id)a3
{
  id v6 = a3;
  int64_t v5 = [(PXSectionedDataSource *)self->_dataSource identifier];
  if (v5 != [v6 identifier])
  {
    objc_storeStrong((id *)&self->_dataSource, a3);
    [(PXObservable *)self signalChange:1];
  }
}

- (PXSectionedChangeDetailsRepository)changeHistory
{
  return self->_changeHistory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeHistory, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_waitingConditions, 0);
}

- (void)unregisterChangeObserver:(id)a3 context:(void *)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PXSectionedDataSourceManager;
  [(PXObservable *)&v4 unregisterChangeObserver:a3 context:a4];
}

- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", a4, a3);
}

- (PXSectionedDataSource)dataSourceIfExists
{
  return self->_dataSource;
}

- (id)createInitialDataSource
{
  objc_super v4 = [MEMORY[0x263F08690] currentHandler];
  int64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXSectionedDataSourceManager.m", 161, @"Method %s is a responsibility of subclass %@", "-[PXSectionedDataSourceManager createInitialDataSource]", v6 object file lineNumber description];

  abort();
}

- (id)queryObserversInterestingObjectReferences
{
  uint64_t v3 = [MEMORY[0x263EFF9C0] set];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  long long v9 = __73__PXSectionedDataSourceManager_queryObserversInterestingObjectReferences__block_invoke;
  long long v10 = &unk_26545AE18;
  long long v11 = self;
  id v12 = v3;
  id v4 = v3;
  [(PXObservable *)self enumerateObserversUsingBlock:&v7];
  int64_t v5 = objc_msgSend(v4, "allObjects", v7, v8, v9, v10, v11);

  return v5;
}

uint64_t __73__PXSectionedDataSourceManager_queryObserversInterestingObjectReferences__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = objc_opt_respondsToSelector();
  id v4 = v7;
  if (v3)
  {
    int64_t v5 = [v7 sectionedDataSourceManagerInterestingObjectReferences:*(void *)(a1 + 32)];
    if (v5) {
      [*(id *)(a1 + 40) addObjectsFromArray:v5];
    }

    id v4 = v7;
  }

  return MEMORY[0x270F9A758](v3, v4);
}

- (void)_waitingConditionDidTimeout:(id)a3
{
  id v6 = a3;
  uint64_t v4 = -[NSMutableArray indexOfObject:](self->_waitingConditions, "indexOfObject:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_waitingConditions removeObjectAtIndex:v4];
    int64_t v5 = [v6 completionHandler];
    v5[2](v5, 0);
  }
}

void __60__PXSectionedDataSourceManager__reevaluateWaitingConditions__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  int64_t v5 = [a2 condition];
  int v6 = v5[2](v5, *(void *)(a1 + 32));

  if (v6)
  {
    id v7 = *(void **)(a1 + 40);
    [v7 addIndex:a3];
  }
}

- (void)waitForCondition:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  uint64_t v8 = (uint64_t (**)(id, void *))a3;
  long long v9 = (void (**)(id, uint64_t))a5;
  long long v10 = [(PXSectionedDataSourceManager *)self dataSource];
  int v11 = v8[2](v8, v10);

  if (v11)
  {
    v9[2](v9, 1);
  }
  else
  {
    id v12 = objc_alloc_init(PXSectionedDataSourceWaitingCondition);
    [(PXSectionedDataSourceWaitingCondition *)v12 setCondition:v8];
    [(PXSectionedDataSourceWaitingCondition *)v12 setCompletionHandler:v9];
    waitingConditions = self->_waitingConditions;
    if (!waitingConditions)
    {
      uint64_t v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      long long v15 = self->_waitingConditions;
      self->_waitingConditions = v14;

      waitingConditions = self->_waitingConditions;
    }
    [(NSMutableArray *)waitingConditions addObject:v12];
    objc_initWeak(&location, self);
    dispatch_time_t v16 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__PXSectionedDataSourceManager_waitForCondition_timeout_completionHandler___block_invoke;
    block[3] = &unk_26545ADA0;
    objc_copyWeak(&v20, &location);
    v19 = v12;
    long long v17 = v12;
    dispatch_after(v16, MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

void __75__PXSectionedDataSourceManager_waitForCondition_timeout_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _waitingConditionDidTimeout:*(void *)(a1 + 32)];
}

- (id)allChangeDetailsFromDataSource:(id)a3 toDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v9 = [v6 identifier];
    if (v8)
    {
LABEL_3:
      uint64_t v10 = [v8 identifier];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (v7) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = 0;
LABEL_6:
  int v11 = [(PXSectionedDataSourceManager *)self changeHistory];
  id v12 = [v11 changeDetailsFromDataSourceIdentifier:v9 toDataSourceIdentifier:v10];

  return v12;
}

- (id)changeDetailsFromDataSource:(id)a3 toDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v9 = [v6 identifier];
    if (v8)
    {
LABEL_3:
      uint64_t v10 = [v8 identifier];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (v7) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = 0;
LABEL_6:
  int v11 = [(PXSectionedDataSourceManager *)self changeHistory];
  id v12 = [v11 coalescedChangeDetailsFromDataSourceIdentifier:v9 toDataSourceIdentifier:v10];

  return v12;
}

@end