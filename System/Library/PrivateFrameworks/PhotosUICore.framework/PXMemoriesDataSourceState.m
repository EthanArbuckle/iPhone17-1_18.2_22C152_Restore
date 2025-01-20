@interface PXMemoriesDataSourceState
- (NSDictionary)infosByMemory;
- (PHFetchResult)memories;
- (PXMemoriesDataSourceState)initWithMemories:(id)a3 infosByMemory:(id)a4;
- (id)stateUpdatedWithChange:(id)a3 outMemoriesChangeDetails:(id *)a4;
@end

@implementation PXMemoriesDataSourceState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infosByMemory, 0);
  objc_storeStrong((id *)&self->_memories, 0);
}

- (NSDictionary)infosByMemory
{
  return self->_infosByMemory;
}

- (PHFetchResult)memories
{
  return self->_memories;
}

- (id)stateUpdatedWithChange:(id)a3 outMemoriesChangeDetails:(id *)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(PXMemoriesDataSourceState *)self memories];
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = [v5 changeDetailsForFetchResult:v6];
  v9 = "TTRWorkflowBuilder";
  v44 = v6;
  if (v8)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __77__PXMemoriesDataSourceState_stateUpdatedWithChange_outMemoriesChangeDetails___block_invoke;
    aBlock[3] = &unk_1E5DB8ED8;
    id v59 = v7;
    v10 = (void (**)(void *, void))_Block_copy(aBlock);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v11 = [v8 insertedObjects];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v54 objects:v61 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v55 != v14) {
            objc_enumerationMutation(v11);
          }
          v10[2](v10, *(void *)(*((void *)&v54 + 1) + 8 * i));
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v54 objects:v61 count:16];
      }
      while (v13);
    }

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v16 = [v8 changedObjects];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v60 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v51;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v51 != v19) {
            objc_enumerationMutation(v16);
          }
          v10[2](v10, *(void *)(*((void *)&v50 + 1) + 8 * j));
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v50 objects:v60 count:16];
      }
      while (v18);
    }

    id v21 = [v8 fetchResultAfterChanges];
    id v6 = v44;
    v9 = "TTRWorkflowBuilder";
  }
  else
  {
    id v21 = v6;
  }
  v22 = [v8 changedIndexes];
  if (v22)
  {
    v23 = [v8 changedIndexes];
    v24 = (void *)[v23 mutableCopy];
  }
  else
  {
    v24 = [MEMORY[0x1E4F28E60] indexSet];
  }

  id v25 = [(PXMemoriesDataSourceState *)self infosByMemory];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = *((void *)v9 + 415);
  v45[2] = __77__PXMemoriesDataSourceState_stateUpdatedWithChange_outMemoriesChangeDetails___block_invoke_2;
  v45[3] = &unk_1E5DB8F00;
  id v26 = v7;
  id v46 = v26;
  id v27 = v21;
  id v47 = v27;
  id v28 = v5;
  id v48 = v28;
  id v29 = v24;
  id v49 = v29;
  [v25 enumerateKeysAndObjectsUsingBlock:v45];
  v30 = [v8 removedObjects];
  if (v30)
  {
  }
  else if (![v26 count])
  {
    id v31 = v25;
    goto LABEL_27;
  }
  id v31 = (id)[v25 mutableCopy];
  v32 = [v8 removedObjects];

  if (v32)
  {
    v33 = [v8 removedObjects];
    [v31 removeObjectsForKeys:v33];
  }
  [v31 addEntriesFromDictionary:v26];
LABEL_27:
  v42 = v28;
  if (v27 == v6 && v31 == v25) {
    v34 = self;
  }
  else {
    v34 = [[PXMemoriesDataSourceState alloc] initWithMemories:v27 infosByMemory:v31];
  }
  v41 = v34;
  id v35 = objc_alloc((Class)off_1E5DA5568);
  v36 = [v8 removedIndexes];
  v37 = [v8 insertedIndexes];
  v38 = [v8 movedIndexes];
  v39 = objc_msgSend(v35, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v36, v37, v38, objc_msgSend(v8, "movedFromIndexes"), v29);

  if (a4) {
    *a4 = v39;
  }

  return v41;
}

void __77__PXMemoriesDataSourceState_stateUpdatedWithChange_outMemoriesChangeDetails___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[PXMemoryInfo memoryInfoWithMemory:v3];
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
}

void __77__PXMemoriesDataSourceState_stateUpdatedWithChange_outMemoriesChangeDetails___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 keyAssetFetchResult];
  if (v6)
  {
    v7 = (void *)v6;
    uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v14];
    if (v8)
    {
      v9 = (void *)v8;
      goto LABEL_4;
    }
    uint64_t v10 = [*(id *)(a1 + 40) indexOfObject:v14];

    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = *(void **)(a1 + 48);
      uint64_t v12 = [v5 keyAssetFetchResult];
      v7 = [v11 changeDetailsForFetchResult:v12];

      if (!v7) {
        goto LABEL_5;
      }
      uint64_t v13 = [v7 fetchResultAfterChanges];
      v9 = [v5 memoryInfoWithUpdatedKeyAssetFetchResult:v13];

      [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v14];
      [*(id *)(a1 + 56) addIndex:v10];
LABEL_4:

LABEL_5:
    }
  }
}

- (PXMemoriesDataSourceState)initWithMemories:(id)a3 infosByMemory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXMemoriesDataSourceState;
  v9 = [(PXMemoriesDataSourceState *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_memories, a3);
    objc_storeStrong((id *)&v10->_infosByMemory, a4);
  }

  return v10;
}

@end