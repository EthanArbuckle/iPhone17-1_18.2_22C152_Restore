@interface PXSelectionCoordinator
- (BOOL)modifySelectionWithRemovedOIDs:(id)a3 insertedOIDs:(id)a4;
- (BOOL)selectionLimitReached;
- (BOOL)selectionManagerShouldAvoidEmptySelection:(id)a3;
- (BOOL)test_validateInternalState;
- (NSMapTable)stateByManager;
- (NSMutableOrderedSet)mutableSelectedObjectIDs;
- (NSNumber)selectionCountLimit;
- (NSOrderedSet)selectedObjectIDs;
- (PXSelectionCoordinator)init;
- (PXSelectionCoordinator)initWithSelectedOIDs:(id)a3;
- (PXSelectionCoordinatorDelegate)delegate;
- (id)checkOutSelectionManagerForDataSourceManager:(id)a3;
- (id)selectionManager:(id)a3 validateSnapshot:(id)a4;
- (void)_handleDataSourceChangeToSelectionManager:(id)a3 state:(id)a4;
- (void)_handleSelectionChangeToSelectionManager:(id)a3 state:(id)a4;
- (void)_modifySelectionWithRemovedOIDs:(id)a3 insertedOIDs:(id)a4 originatingSelectionManager:(id)a5;
- (void)_performChangesToCoordinatedSelectionManagersWithRemovedOIDs:(id)a3 insertedOIDs:(id)a4 originatingSelectionManager:(id)a5;
- (void)_startMutatingSelectionManager:(id)a3;
- (void)_stopMutatingSelectionManager:(id)a3;
- (void)_updateSelectionLimitReached;
- (void)_updateSelectionManagerToGlobalState:(id)a3 managerState:(id)a4;
- (void)checkInSelectionManager:(id)a3;
- (void)modifySelectionWithOrder:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setDelegate:(id)a3;
- (void)setSelectionCountLimit:(id)a3;
- (void)setSelectionLimitReached:(BOOL)a3;
@end

@implementation PXSelectionCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateByManager, 0);
  objc_storeStrong((id *)&self->_mutableSelectedObjectIDs, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectionCountLimit, 0);

  objc_storeStrong((id *)&self->_currentlyMutatingSelectionManager, 0);
}

- (NSMapTable)stateByManager
{
  return self->_stateByManager;
}

- (NSMutableOrderedSet)mutableSelectedObjectIDs
{
  return self->_mutableSelectedObjectIDs;
}

- (PXSelectionCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PXSelectionCoordinatorDelegate *)WeakRetained;
}

- (void)setSelectionLimitReached:(BOOL)a3
{
  self->_selectionLimitReached = a3;
}

- (BOOL)selectionLimitReached
{
  return self->_selectionLimitReached;
}

- (NSNumber)selectionCountLimit
{
  return self->_selectionCountLimit;
}

- (BOOL)test_validateInternalState
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = [(PXSelectionCoordinator *)self stateByManager];
  v4 = [v3 keyEnumerator];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v10 = [(PXSelectionCoordinator *)self stateByManager];
        v11 = [v10 objectForKey:v9];

        v12 = [v11 selectionSnapshot];
        v13 = [v9 selectionSnapshot];

        if (v12 != v13)
        {
          BOOL v14 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_11:

  return v14;
}

- (BOOL)selectionManagerShouldAvoidEmptySelection:(id)a3
{
  return 0;
}

- (id)selectionManager:(id)a3 validateSnapshot:(id)a4
{
  uint64_t v6 = (PXSectionedSelectionManager *)a3;
  id v7 = a4;
  v8 = [(PXSelectionCoordinator *)self selectionCountLimit];
  v9 = v8;
  if (!v8) {
    goto LABEL_10;
  }
  if (self->_currentlyMutatingSelectionManager == v6) {
    goto LABEL_10;
  }
  uint64_t v10 = [v8 integerValue];
  v11 = [(PXSelectionCoordinator *)self mutableSelectedObjectIDs];
  uint64_t v28 = [v11 count];

  v12 = [v7 selectedIndexPaths];
  uint64_t v13 = [v12 count];
  BOOL v14 = [(PXSectionedSelectionManager *)v6 selectionSnapshot];
  v15 = [v14 selectedIndexPaths];
  uint64_t v16 = v13 - [v15 count];

  if (v16 < 1) {
    goto LABEL_10;
  }
  if (v16 + v28 <= v10) {
    goto LABEL_10;
  }
  long long v17 = [v7 dataSource];
  long long v18 = [v7 selectedIndexPaths];
  long long v19 = [v17 objectIDsForIndexPathSet:v18];
  v20 = [v19 set];

  uint64_t v21 = [(PXSelectionCoordinator *)self mutableSelectedObjectIDs];
  v22 = [v21 set];
  v23 = [v22 setByAddingObjectsFromSet:v20];
  uint64_t v24 = [v23 count];

  if (v24 <= v10 || v24 <= v28)
  {
LABEL_10:
    id v26 = v7;
  }
  else
  {
    if (self->_delegateRespondsTo.rejectedCountLimitViolation)
    {
      v25 = [(PXSelectionCoordinator *)self delegate];
      [v25 selectionCoordinator:self rejectedCountLimitViolationForSelectionManager:v6];
    }
    id v26 = 0;
  }

  return v26;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)CoordinatedSelectionManagerContext != a5)
  {
    uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"PXSelectionCoordinator.m" lineNumber:331 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  long long v17 = (PXSectionedSelectionManager *)v9;
  uint64_t v10 = [(PXSelectionCoordinator *)self stateByManager];
  v11 = [v10 objectForKey:v17];

  if (v11)
  {
    v12 = v17;
    if (self->_currentlyMutatingSelectionManager == v17)
    {
      if (self->_currentlyMutatingObservationCount)
      {
        v15 = [MEMORY[0x263F08690] currentHandler];
        [v15 handleFailureInMethod:a2 object:self file:@"PXSelectionCoordinator.m" lineNumber:315 description:@"A coordinated selection manager was changed while the coordinator was updating it"];

        v12 = v17;
        int64_t v13 = self->_currentlyMutatingObservationCount + 1;
      }
      else
      {
        int64_t v13 = 1;
      }
      self->_currentlyMutatingObservationCount = v13;
      BOOL v14 = [(PXSectionedSelectionManager *)v12 selectionSnapshot];
      [v11 setSelectionSnapshot:v14];
    }
    else if ((v6 & 2) != 0)
    {
      [(PXSelectionCoordinator *)self _handleDataSourceChangeToSelectionManager:v17 state:v11];
    }
    else if (v6)
    {
      [(PXSelectionCoordinator *)self _handleSelectionChangeToSelectionManager:v17 state:v11];
    }
  }
}

- (void)_performChangesToCoordinatedSelectionManagersWithRemovedOIDs:(id)a3 insertedOIDs:(id)a4 originatingSelectionManager:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29 = v8;
  if ([v8 count]) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = [v9 count] != 0;
  }
  BOOL v32 = v11;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v12 = [(PXSelectionCoordinator *)self stateByManager];
  int64_t v13 = [v12 keyEnumerator];

  id obj = v13;
  uint64_t v31 = [v13 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v31)
  {
    uint64_t v30 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v44 != v30) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(id *)(*((void *)&v43 + 1) + 8 * i);
        int v16 = [(PXSelectionCoordinator *)self selectionLimitReached];
        if (v15 == v10)
        {
          id v26 = [v10 selectionSnapshot];
          int v27 = [v26 isSelectionLimitReached];

          if (v16 != v27 || v32)
          {
            [(PXSelectionCoordinator *)self _startMutatingSelectionManager:v10];
            v40[0] = MEMORY[0x263EF8330];
            v40[1] = 3221225472;
            v40[2] = __128__PXSelectionCoordinator__performChangesToCoordinatedSelectionManagersWithRemovedOIDs_insertedOIDs_originatingSelectionManager___block_invoke;
            v40[3] = &unk_26545AB00;
            char v41 = v16;
            BOOL v42 = v32;
            v40[4] = v10;
            v40[5] = self;
            [v10 performChanges:v40];
            [(PXSelectionCoordinator *)self _stopMutatingSelectionManager:v10];
          }
        }
        else
        {
          long long v17 = [v15 selectionSnapshot];
          long long v18 = [v17 dataSource];

          long long v19 = [v29 set];
          v20 = [v18 indexPathSetForObjectIDs:v19];

          uint64_t v21 = [v9 set];
          [v18 indexPathSetForObjectIDs:v21];
          v23 = id v22 = v9;

          [(PXSelectionCoordinator *)self _startMutatingSelectionManager:v15];
          v33[0] = MEMORY[0x263EF8330];
          v33[1] = 3221225472;
          v33[2] = __128__PXSelectionCoordinator__performChangesToCoordinatedSelectionManagersWithRemovedOIDs_insertedOIDs_originatingSelectionManager___block_invoke_2;
          v33[3] = &unk_26545AB28;
          id v34 = v20;
          id v35 = v23;
          char v38 = v16;
          BOOL v39 = v32;
          id v36 = v15;
          v37 = self;
          id v24 = v23;
          id v25 = v20;
          [v15 performChanges:v33];
          [(PXSelectionCoordinator *)self _stopMutatingSelectionManager:v15];

          id v9 = v22;
        }
      }
      uint64_t v31 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v31);
  }
}

void __128__PXSelectionCoordinator__performChangesToCoordinatedSelectionManagersWithRemovedOIDs_insertedOIDs_originatingSelectionManager___block_invoke(uint64_t a1, void *a2)
{
  [a2 setSelectionLimitReached:*(unsigned __int8 *)(a1 + 48)];
  if (*(unsigned char *)(a1 + 49))
  {
    v3 = *(void **)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) selectedObjectIDs];
    [v3 setOverallSelectionOrder:v4];
  }
}

void __128__PXSelectionCoordinator__performChangesToCoordinatedSelectionManagersWithRemovedOIDs_insertedOIDs_originatingSelectionManager___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setSelectedState:0 forIndexPathSet:v3];
  [v4 setSelectedState:1 forIndexPathSet:*(void *)(a1 + 40)];
  [v4 setSelectionLimitReached:*(unsigned __int8 *)(a1 + 64)];

  if (*(unsigned char *)(a1 + 65))
  {
    uint64_t v5 = *(void **)(a1 + 48);
    id v6 = [*(id *)(a1 + 56) selectedObjectIDs];
    [v5 setOverallSelectionOrder:v6];
  }
}

- (void)_modifySelectionWithRemovedOIDs:(id)a3 insertedOIDs:(id)a4 originatingSelectionManager:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v20 count])
  {
    id v10 = [(PXSelectionCoordinator *)self mutableSelectedObjectIDs];
    int v11 = [v10 intersectsOrderedSet:v20];
  }
  else
  {
    int v11 = 0;
  }
  if ([v8 count])
  {
    v12 = [(PXSelectionCoordinator *)self mutableSelectedObjectIDs];
    int v13 = [v8 isSubsetOfOrderedSet:v12] ^ 1;
  }
  else
  {
    int v13 = 0;
  }
  BOOL v14 = [(PXSelectionCoordinator *)self mutableSelectedObjectIDs];
  [v14 minusOrderedSet:v20];

  id v15 = [(PXSelectionCoordinator *)self mutableSelectedObjectIDs];
  [v15 unionOrderedSet:v8];

  int v16 = [(PXSelectionCoordinator *)self selectionLimitReached];
  [(PXSelectionCoordinator *)self _updateSelectionLimitReached];
  int v17 = [(PXSelectionCoordinator *)self selectionLimitReached];
  [(PXSelectionCoordinator *)self _performChangesToCoordinatedSelectionManagersWithRemovedOIDs:v20 insertedOIDs:v8 originatingSelectionManager:v9];

  if ((v11 | v13) == 1 && self->_delegateRespondsTo.didUpdateSelectedObjects)
  {
    long long v18 = [(PXSelectionCoordinator *)self delegate];
    [v18 selectionCoordinator:self didUpdateSelectedObjectsWithRemovedOIDs:v20 insertedOIDs:v8];
  }
  if (v16 != v17 && self->_delegateRespondsTo.selectionLimitStatusChanged)
  {
    long long v19 = [(PXSelectionCoordinator *)self delegate];
    [v19 selectionLimitStatusChangedForSelectionCoordinator:self];
  }
}

- (void)_handleSelectionChangeToSelectionManager:(id)a3 state:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  id v7 = [v6 selectionSnapshot];
  id v8 = [v20 selectionSnapshot];
  id v9 = [v7 selectedIndexPaths];
  id v10 = (void *)[v9 mutableCopy];

  int v11 = [v8 selectedIndexPaths];
  [v10 minusIndexPathSet:v11];

  v12 = [v8 selectedIndexPaths];
  int v13 = (void *)[v12 mutableCopy];

  BOOL v14 = [v7 selectedIndexPaths];
  [v13 minusIndexPathSet:v14];

  if (self->_delegateRespondsTo.willUpdateSelectedObjects)
  {
    id v15 = [(PXSelectionCoordinator *)self delegate];
    [v15 selectionCoordinator:self willUpdateSelectedObjectsForSnapshot:v8 withRemovedIndexes:v10 insertedIndexes:v13];
  }
  int v16 = [v7 dataSource];
  int v17 = [v16 objectIDsForIndexPathSet:v10];

  long long v18 = [v8 dataSource];
  long long v19 = [v18 objectIDsForIndexPathSet:v13];

  [v6 setSelectionSnapshot:v8];
  [(PXSelectionCoordinator *)self _modifySelectionWithRemovedOIDs:v17 insertedOIDs:v19 originatingSelectionManager:v20];
}

- (void)_handleDataSourceChangeToSelectionManager:(id)a3 state:(id)a4
{
  long long v19 = self;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v24 = a3;
  id v20 = a4;
  uint64_t v21 = [v20 selectionSnapshot];
  v23 = [v24 selectionSnapshot];
  id v22 = [v24 dataSourceManager];
  uint64_t v5 = [v21 dataSource];
  id v6 = [v23 dataSource];
  id v7 = [v22 allChangeDetailsFromDataSource:v5 toDataSource:v6];

  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        int v13 = objc_msgSend(v12, "sectionChanges", v19);
        if (([v13 hasIncrementalChanges] & 1) == 0)
        {

LABEL_13:
          *((unsigned char *)v31 + 24) = 1;
          goto LABEL_14;
        }
        BOOL v14 = [v12 sectionChanges];
        id v15 = [v14 insertedIndexes];
        BOOL v16 = [v15 count] == 0;

        if (!v16) {
          goto LABEL_13;
        }
        int v17 = [v12 sectionsWithItemChanges];
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __74__PXSelectionCoordinator__handleDataSourceChangeToSelectionManager_state___block_invoke;
        v25[3] = &unk_26545B980;
        v25[4] = v12;
        v25[5] = &v30;
        [v17 enumerateIndexesUsingBlock:v25];

        if (*((unsigned char *)v31 + 24)) {
          goto LABEL_14;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v36 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  if (*((unsigned char *)v31 + 24))
  {
    if (PXSelectionCoordinatorGetLog_predicate != -1) {
      dispatch_once(&PXSelectionCoordinatorGetLog_predicate, &__block_literal_global_4179);
    }
    long long v18 = (id)PXSelectionCoordinatorGetLog_log;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v22;
      _os_log_impl(&dword_259CDA000, v18, OS_LOG_TYPE_DEFAULT, "Reloading selection state for data source manager %@", buf, 0xCu);
    }

    [(PXSelectionCoordinator *)v19 _updateSelectionManagerToGlobalState:v24 managerState:v20];
  }
  else
  {
    [v20 setSelectionSnapshot:v23];
  }
  _Block_object_dispose(&v30, 8);
}

void __74__PXSelectionCoordinator__handleDataSourceChangeToSelectionManager_state___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v7 = [*(id *)(a1 + 32) itemChangesInSection:a2];
  if (![v7 hasIncrementalChanges]
    || ([v7 insertedIndexes],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v6))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (void)_updateSelectionManagerToGlobalState:(id)a3 managerState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 dataSourceManager];
  uint64_t v9 = [v8 dataSource];

  uint64_t v10 = [(PXSelectionCoordinator *)self mutableSelectedObjectIDs];
  int v11 = [v10 set];
  v12 = [v9 indexPathSetForObjectIDs:v11];

  LOBYTE(v10) = [(PXSelectionCoordinator *)self selectionLimitReached];
  [(PXSelectionCoordinator *)self _startMutatingSelectionManager:v6];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  long long v18 = __76__PXSelectionCoordinator__updateSelectionManagerToGlobalState_managerState___block_invoke;
  long long v19 = &unk_26545AAD8;
  char v23 = (char)v10;
  id v20 = v12;
  id v21 = v6;
  id v22 = self;
  id v13 = v6;
  id v14 = v12;
  [v13 performChanges:&v16];
  id v15 = objc_msgSend(v13, "selectionSnapshot", v16, v17, v18, v19);
  [v7 setSelectionSnapshot:v15];

  [(PXSelectionCoordinator *)self _stopMutatingSelectionManager:v13];
}

void __76__PXSelectionCoordinator__updateSelectionManagerToGlobalState_managerState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setSelectedIndexPaths:v3];
  [v4 setSelectionLimitReached:*(unsigned __int8 *)(a1 + 56)];

  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 48) selectedObjectIDs];
  [v5 setOverallSelectionOrder:v6];
}

- (void)modifySelectionWithOrder:(id)a3
{
  id v10 = a3;
  uint64_t v5 = [(PXSelectionCoordinator *)self selectedObjectIDs];
  if (!v10 || (uint64_t v6 = [v10 count], v7 = objc_msgSend(v5, "count"), v8 = v10, v6 != v7))
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXSelectionCoordinator.m", 148, @"Invalid parameter not satisfying: %@", @"updatedSelectionOrder && updatedSelectionOrder.count == currentSelectionOrder.count" object file lineNumber description];

    id v8 = v10;
  }
  [(PXSelectionCoordinator *)self _modifySelectionWithRemovedOIDs:v5 insertedOIDs:v8 originatingSelectionManager:0];
}

- (BOOL)modifySelectionWithRemovedOIDs:(id)a3 insertedOIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7 || !v8)
  {
    id v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PXSelectionCoordinator.m", 121, @"Invalid parameter not satisfying: %@", @"removedOIDs && insertedOIDs" object file lineNumber description];
  }
  id v10 = [(PXSelectionCoordinator *)self mutableSelectedObjectIDs];
  int v11 = (void *)[v10 mutableCopy];

  v12 = (void *)[v7 mutableCopy];
  [v12 intersectOrderedSet:v11];
  [v11 minusOrderedSet:v12];
  id v13 = (void *)[v9 mutableCopy];
  [v13 minusOrderedSet:v11];
  [v11 unionOrderedSet:v13];
  id v14 = [(PXSelectionCoordinator *)self selectionCountLimit];
  id v15 = v14;
  if (v14 && (unint64_t v16 = [v14 integerValue], v16 < objc_msgSend(v11, "count")))
  {
    unint64_t v17 = [v11 count];
    long long v18 = [(PXSelectionCoordinator *)self mutableSelectedObjectIDs];
    BOOL v19 = v17 <= [v18 count];
  }
  else
  {
    BOOL v19 = 1;
  }
  if ([v12 count])
  {
    BOOL v20 = 0;
    if (!v19) {
      goto LABEL_13;
    }
  }
  else
  {
    BOOL v20 = [v13 count] == 0;
    if (!v19) {
      goto LABEL_13;
    }
  }
  if (!v20) {
    [(PXSelectionCoordinator *)self _modifySelectionWithRemovedOIDs:v12 insertedOIDs:v9 originatingSelectionManager:0];
  }
LABEL_13:

  return v19 || v20;
}

- (void)checkInSelectionManager:(id)a3
{
  id v4 = a3;
  id v5 = [(PXSelectionCoordinator *)self stateByManager];
  [v5 removeObjectForKey:v4];
}

- (id)checkOutSelectionManagerForDataSourceManager:(id)a3
{
  id v4 = a3;
  id v5 = [[PXSectionedSelectionManager alloc] initWithDataSourceManager:v4];

  [(PXSectionedSelectionManager *)v5 setSnapshotValidator:self];
  uint64_t v6 = [_PXSelectionCoordinatorState alloc];
  id v7 = [(PXSectionedSelectionManager *)v5 selectionSnapshot];
  id v8 = [(_PXSelectionCoordinatorState *)v6 initWithSelectionSnapshot:v7];

  uint64_t v9 = [(PXSelectionCoordinator *)self stateByManager];
  [v9 setObject:v8 forKey:v5];

  [(PXObservable *)v5 registerChangeObserver:self context:CoordinatedSelectionManagerContext];
  [(PXSelectionCoordinator *)self _updateSelectionManagerToGlobalState:v5 managerState:v8];

  return v5;
}

- (void)_stopMutatingSelectionManager:(id)a3
{
  currentlyMutatingSelectionManager = (PXSectionedSelectionManager *)a3;
  id v7 = currentlyMutatingSelectionManager;
  if (self->_currentlyMutatingSelectionManager != currentlyMutatingSelectionManager)
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXSelectionCoordinator.m", 100, @"Invalid parameter not satisfying: %@", @"_currentlyMutatingSelectionManager == selectionManager" object file lineNumber description];

    currentlyMutatingSelectionManager = self->_currentlyMutatingSelectionManager;
  }
  self->_currentlyMutatingSelectionManager = 0;
}

- (void)_startMutatingSelectionManager:(id)a3
{
  id v5 = (PXSectionedSelectionManager *)a3;
  currentlyMutatingSelectionManager = self->_currentlyMutatingSelectionManager;
  if (currentlyMutatingSelectionManager)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXSelectionCoordinator.m", 94, @"Invalid parameter not satisfying: %@", @"_currentlyMutatingSelectionManager == nil" object file lineNumber description];

    currentlyMutatingSelectionManager = self->_currentlyMutatingSelectionManager;
  }
  self->_currentlyMutatingSelectionManager = v5;

  self->_currentlyMutatingObservationCount = 0;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.willUpdateSelectedObjects = objc_opt_respondsToSelector() & 1;
    self->_delegateRespondsTo.didUpdateSelectedObjects = objc_opt_respondsToSelector() & 1;
    self->_delegateRespondsTo.rejectedCountLimitViolation = objc_opt_respondsToSelector() & 1;
    self->_delegateRespondsTo.selectionLimitStatusChanged = objc_opt_respondsToSelector() & 1;
  }
}

- (void)_updateSelectionLimitReached
{
  id v6 = [(PXSelectionCoordinator *)self selectionCountLimit];
  uint64_t v3 = [(PXSelectionCoordinator *)self selectedObjectIDs];
  uint64_t v4 = [v3 count];

  if (v6) {
    BOOL v5 = v4 >= [v6 integerValue];
  }
  else {
    BOOL v5 = 0;
  }
  [(PXSelectionCoordinator *)self setSelectionLimitReached:v5];
}

- (NSOrderedSet)selectedObjectIDs
{
  v2 = [(PXSelectionCoordinator *)self mutableSelectedObjectIDs];
  uint64_t v3 = (void *)[v2 copy];

  return (NSOrderedSet *)v3;
}

- (void)setSelectionCountLimit:(id)a3
{
  v12 = (NSNumber *)a3;
  id v6 = self->_selectionCountLimit;
  id v7 = v12;
  if (v6 != v12)
  {
    id v8 = v6;
    char v9 = [(NSNumber *)v6 isEqual:v12];

    if (v9) {
      goto LABEL_8;
    }
    if (v12 && [(NSNumber *)v12 integerValue] < 0)
    {
      int v11 = [MEMORY[0x263F08690] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PXSelectionCoordinator.m" lineNumber:65 description:@"Negative count limits are invalid"];
    }
    objc_storeStrong((id *)&self->_selectionCountLimit, a3);
    id v7 = [MEMORY[0x263EFF9D8] orderedSet];
    id v10 = [MEMORY[0x263EFF9D8] orderedSet];
    [(PXSelectionCoordinator *)self _modifySelectionWithRemovedOIDs:v7 insertedOIDs:v10 originatingSelectionManager:0];
  }
LABEL_8:
}

- (PXSelectionCoordinator)initWithSelectedOIDs:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXSelectionCoordinator;
  BOOL v5 = [(PXSelectionCoordinator *)&v11 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = [v4 mutableCopy];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x263EFF9B0] orderedSet];
    }
    mutableSelectedObjectIDs = v5->_mutableSelectedObjectIDs;
    v5->_mutableSelectedObjectIDs = (NSMutableOrderedSet *)v6;

    uint64_t v8 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    stateByManager = v5->_stateByManager;
    v5->_stateByManager = (NSMapTable *)v8;
  }
  return v5;
}

- (PXSelectionCoordinator)init
{
  return [(PXSelectionCoordinator *)self initWithSelectedOIDs:0];
}

@end