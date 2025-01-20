@interface WFCloudKitResolveReferencesOperation
- (CKFetchRecordsOperation)currentOperation;
- (CKOperationGroup)operationGroup;
- (NSArray)records;
- (WFCloudKitItemRequest)request;
- (WFCloudKitItemTask)task;
- (WFCloudKitResolveReferencesOperation)initWithRequest:(id)a3 records:(id)a4 operationGroup:(id)a5 task:(id)a6;
- (void)cancel;
- (void)setCurrentOperation:(id)a3;
- (void)setTask:(id)a3;
- (void)start;
@end

@implementation WFCloudKitResolveReferencesOperation

- (void)start
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v46.receiver = self;
  v46.super_class = (Class)WFCloudKitResolveReferencesOperation;
  [(WFCloudKitAsyncOperation *)&v46 start];
  v29 = [MEMORY[0x1E4F28F08] currentQueue];
  v3 = getWFCloudKitLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(WFCloudKitResolveReferencesOperation *)self records];
    uint64_t v5 = [v4 count];
    *(_DWORD *)buf = 136315394;
    v49 = "-[WFCloudKitResolveReferencesOperation start]";
    __int16 v50 = 2048;
    uint64_t v51 = v5;
    _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_INFO, "%s Resolve references operation starting for %lu records", buf, 0x16u);
  }
  v6 = objc_opt_new();
  v7 = objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v28 = self;
  id obj = [(WFCloudKitResolveReferencesOperation *)self records];
  uint64_t v8 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        v13 = [v12 record];
        v14 = [v12 item];
        v15 = [(id)objc_opt_class() properties];
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __45__WFCloudKitResolveReferencesOperation_start__block_invoke;
        v38[3] = &unk_1E6552D90;
        id v39 = v13;
        id v40 = v6;
        id v41 = v7;
        id v16 = v13;
        [v15 enumerateKeysAndObjectsUsingBlock:v38];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v9);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__WFCloudKitResolveReferencesOperation_start__block_invoke_3;
  aBlock[3] = &unk_1E6552DB8;
  aBlock[4] = v28;
  v17 = _Block_copy(aBlock);
  if ([v6 count])
  {
    v18 = getWFCloudKitLogObject();
    v19 = v29;
    v20 = v7;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = [v6 count];
      *(_DWORD *)buf = 136315394;
      v49 = "-[WFCloudKitResolveReferencesOperation start]";
      __int16 v50 = 2048;
      uint64_t v51 = v21;
      _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_INFO, "%s Fetching %lu references.", buf, 0x16u);
    }

    v22 = [(WFCloudKitResolveReferencesOperation *)v28 request];
    v23 = [v6 allKeys];
    v24 = [v7 allObjects];
    v25 = [(WFCloudKitResolveReferencesOperation *)v28 operationGroup];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __45__WFCloudKitResolveReferencesOperation_start__block_invoke_447;
    v31[3] = &unk_1E6554378;
    id v32 = v6;
    v33 = v28;
    id v34 = v29;
    SEL v36 = a2;
    id v35 = v17;
    v26 = [v22 fetchRecordIDs:v23 desiredKeys:v24 operationGroup:v25 completionHandler:v31];
    [(WFCloudKitResolveReferencesOperation *)v28 setCurrentOperation:v26];
  }
  else
  {
    (*((void (**)(void *, void))v17 + 2))(v17, 0);
    v19 = v29;
    v20 = v7;
  }
}

- (NSArray)records
{
  return self->_records;
}

void __45__WFCloudKitResolveReferencesOperation_start__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = objc_msgSend(*(id *)(a1 + 32), "records", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v10 = [v9 record];
        v11 = [v9 item];
        +[WFCloudKitItemRequest hydrateItem:v11 withRecord:v10 resolvedReferences:v3 setNilValues:0];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  [*(id *)(a1 + 32) finishExecuting];
}

- (WFCloudKitResolveReferencesOperation)initWithRequest:(id)a3 records:(id)a4 operationGroup:(id)a5 task:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)WFCloudKitResolveReferencesOperation;
  long long v14 = [(WFCloudKitResolveReferencesOperation *)&v18 init];
  long long v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_request, v10);
    objc_storeStrong((id *)&v15->_records, a4);
    objc_storeStrong((id *)&v15->_operationGroup, a5);
    objc_storeStrong((id *)&v15->_task, a6);
    id v16 = v15;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_currentOperation, 0);
  objc_storeStrong((id *)&self->_operationGroup, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_destroyWeak((id *)&self->_request);
}

- (void)setTask:(id)a3
{
}

- (WFCloudKitItemTask)task
{
  return self->_task;
}

- (void)setCurrentOperation:(id)a3
{
}

- (CKFetchRecordsOperation)currentOperation
{
  return self->_currentOperation;
}

- (CKOperationGroup)operationGroup
{
  return self->_operationGroup;
}

- (WFCloudKitItemRequest)request
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_request);
  return (WFCloudKitItemRequest *)WeakRetained;
}

- (void)cancel
{
  id v3 = [(WFCloudKitResolveReferencesOperation *)self currentOperation];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)WFCloudKitResolveReferencesOperation;
  [(WFCloudKitResolveReferencesOperation *)&v4 cancel];
}

void __45__WFCloudKitResolveReferencesOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 type] == 3)
  {
    uint64_t v7 = [*(id *)(a1 + 32) objectForKey:v5];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      uint64_t v9 = [v6 itemClass];
      id v10 = *(void **)(a1 + 40);
      id v11 = [v8 recordID];

      [v10 setObject:v9 forKeyedSubscript:v11];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v22 = v7;
        id v12 = [v7 objectsMatchingClass:objc_opt_class()];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v26;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v26 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v25 + 1) + 8 * v16);
              uint64_t v18 = [v6 itemClass];
              v19 = *(void **)(a1 + 40);
              v20 = [v17 recordID];
              [v19 setObject:v18 forKeyedSubscript:v20];

              ++v16;
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
          }
          while (v14);
        }

        uint64_t v7 = v22;
      }
    }
    uint64_t v21 = objc_msgSend((id)objc_msgSend(v6, "itemClass"), "properties");
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __45__WFCloudKitResolveReferencesOperation_start__block_invoke_2;
    v23[3] = &unk_1E6552CC8;
    id v24 = *(id *)(a1 + 48);
    [v21 enumerateKeysAndObjectsUsingBlock:v23];
  }
}

void __45__WFCloudKitResolveReferencesOperation_start__block_invoke_447(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = getWFCloudKitLogObject();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [*(id *)(a1 + 32) allKeys];
      *(_DWORD *)buf = 136315650;
      v31 = "-[WFCloudKitResolveReferencesOperation start]_block_invoke";
      __int16 v32 = 2112;
      uint64_t v33 = (uint64_t)v9;
      __int16 v34 = 2112;
      id v35 = v6;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_ERROR, "%s Error fetching record IDs: %@, %@", buf, 0x20u);
    }
    id v10 = [*(id *)(a1 + 40) task];
    [v10 setError:v6];

    [*(id *)(a1 + 48) cancelAllOperations];
    [*(id *)(a1 + 40) finishExecuting];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[WFCloudKitResolveReferencesOperation start]_block_invoke";
      __int16 v32 = 2048;
      uint64_t v33 = [v5 count];
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_INFO, "%s Finished fetching %lu references", buf, 0x16u);
    }

    id v11 = objc_opt_new();
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    id v24 = __45__WFCloudKitResolveReferencesOperation_start__block_invoke_448;
    long long v25 = &unk_1E6552DE0;
    id v12 = *(id *)(a1 + 32);
    uint64_t v29 = *(void *)(a1 + 64);
    uint64_t v13 = *(void *)(a1 + 40);
    id v26 = v12;
    uint64_t v27 = v13;
    id v14 = v11;
    id v28 = v14;
    [v5 enumerateKeysAndObjectsUsingBlock:&v22];
    if ((objc_msgSend(*(id *)(a1 + 40), "isCancelled", v22, v23, v24, v25) & 1) == 0)
    {
      uint64_t v15 = *(void **)(a1 + 48);
      uint64_t v16 = [WFCloudKitResolveReferencesOperation alloc];
      uint64_t v17 = [*(id *)(a1 + 40) request];
      uint64_t v18 = [v14 allValues];
      v19 = [*(id *)(a1 + 40) operationGroup];
      v20 = [*(id *)(a1 + 40) task];
      uint64_t v21 = [(WFCloudKitResolveReferencesOperation *)v16 initWithRequest:v17 records:v18 operationGroup:v19 task:v20];
      [v15 addOperation:v21];
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __45__WFCloudKitResolveReferencesOperation_start__block_invoke_448(uint64_t a1, void *a2, void *a3)
{
  id v15 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = (objc_class *)[v5 objectForKeyedSubscript:v6];
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 40);
    id v14 = [v15 recordType];
    [v11 handleFailureInMethod:v12, v13, @"WFCloudKitItemRequest.m", 755, @"Received record not in known WFCloudKitItem types: %@", v14 object file lineNumber description];
  }
  id v8 = [WFCloudKitItemRecord alloc];
  id v9 = objc_alloc_init(v7);
  id v10 = [(WFCloudKitItemRecord *)v8 initWithRecord:v15 item:v9];
  [*(id *)(a1 + 48) setObject:v10 forKeyedSubscript:v6];
}

void __45__WFCloudKitResolveReferencesOperation_start__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (([a3 isIgnoredByDefault] & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

@end