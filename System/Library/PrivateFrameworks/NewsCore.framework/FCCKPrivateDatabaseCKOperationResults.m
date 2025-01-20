@interface FCCKPrivateDatabaseCKOperationResults
- (FCCKPrivateDatabaseCKOperationResults)init;
- (FCThreadSafeMutableArray)threadSafeErrorsAndItemIDs;
- (FCThreadSafeMutableArray)threadSafeItems;
- (NSArray)combinedResultItems;
- (NSError)combinedError;
- (OS_dispatch_group)group;
- (void)notifyWhenFinishWithQoS:(int64_t)a3 completionHandler:(id)a4;
- (void)operationDidFinishWithItemIDs:(id)a3 resultItems:(id)a4 error:(id)a5;
- (void)operationWillStart;
- (void)setGroup:(id)a3;
- (void)setThreadSafeErrorsAndItemIDs:(id)a3;
- (void)setThreadSafeItems:(id)a3;
@end

@implementation FCCKPrivateDatabaseCKOperationResults

- (FCCKPrivateDatabaseCKOperationResults)init
{
  v10.receiver = self;
  v10.super_class = (Class)FCCKPrivateDatabaseCKOperationResults;
  v2 = [(FCCKPrivateDatabaseCKOperationResults *)&v10 init];
  if (v2)
  {
    dispatch_group_t v3 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v3;

    v5 = objc_alloc_init(FCThreadSafeMutableArray);
    threadSafeItems = v2->_threadSafeItems;
    v2->_threadSafeItems = v5;

    v7 = objc_alloc_init(FCThreadSafeMutableArray);
    threadSafeErrorsAndItemIDs = v2->_threadSafeErrorsAndItemIDs;
    v2->_threadSafeErrorsAndItemIDs = v7;
  }
  return v2;
}

- (void)operationWillStart
{
  v2 = [(FCCKPrivateDatabaseCKOperationResults *)self group];
  dispatch_group_enter(v2);
}

- (void)operationDidFinishWithItemIDs:(id)a3 resultItems:(id)a4 error:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "itemIDs");
    *(_DWORD *)buf = 136315906;
    v17 = "-[FCCKPrivateDatabaseCKOperationResults operationDidFinishWithItemIDs:resultItems:error:]";
    __int16 v18 = 2080;
    v19 = "FCCKPrivateDatabaseOperation.m";
    __int16 v20 = 1024;
    int v21 = 169;
    __int16 v22 = 2114;
    v23 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if ([v9 count])
  {
    v11 = [(FCCKPrivateDatabaseCKOperationResults *)self threadSafeItems];
    [v11 addObjectsFromArray:v9];
  }
  v12 = [(FCCKPrivateDatabaseCKOperationResults *)self threadSafeErrorsAndItemIDs];
  v13 = +[FCPair pairWithFirst:v8 second:v10];
  [v12 addObject:v13];

  v14 = [(FCCKPrivateDatabaseCKOperationResults *)self group];
  dispatch_group_leave(v14);
}

- (void)notifyWhenFinishWithQoS:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = [(FCCKPrivateDatabaseCKOperationResults *)self group];
  id v8 = FCDispatchQueueForQualityOfService(a3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__FCCKPrivateDatabaseCKOperationResults_notifyWhenFinishWithQoS_completionHandler___block_invoke;
  v10[3] = &unk_1E5B4C7C0;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_group_notify(v7, v8, v10);
}

void __83__FCCKPrivateDatabaseCKOperationResults_notifyWhenFinishWithQoS_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) combinedResultItems];
  dispatch_group_t v3 = [*(id *)(a1 + 32) combinedError];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

- (NSArray)combinedResultItems
{
  uint64_t v2 = [(FCCKPrivateDatabaseCKOperationResults *)self threadSafeItems];
  dispatch_group_t v3 = [v2 readOnlyArray];

  return (NSArray *)v3;
}

- (NSError)combinedError
{
  v21[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(FCCKPrivateDatabaseCKOperationResults *)self threadSafeErrorsAndItemIDs];
  dispatch_group_t v3 = [v2 readOnlyArray];

  if ((unint64_t)[v3 count] <= 1) {
    goto LABEL_2;
  }
  if (objc_msgSend(v3, "fc_allObjectsPassTest:", &__block_literal_global_5))
  {
    v5 = 0;
  }
  else
  {
    int v6 = objc_msgSend(v3, "fc_allObjectsPassTest:", &__block_literal_global_47);
    int v7 = objc_msgSend(v3, "fc_allObjectsPassTest:", &__block_literal_global_49);
    if (v6 && v7)
    {
LABEL_2:
      id v4 = [v3 firstObject];
      v5 = [v4 second];

      goto LABEL_8;
    }
    id v8 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __54__FCCKPrivateDatabaseCKOperationResults_combinedError__block_invoke_4;
    __int16 v18 = &unk_1E5B4BF78;
    id v19 = v3;
    id v9 = objc_msgSend(v8, "fc_dictionary:", &v15);
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F19C40];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v20[0] = *MEMORY[0x1E4F19CD8];
    v20[1] = v12;
    v21[0] = v9;
    v21[1] = @"Some private database CK operations failed.";
    v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v21, v20, 2, v15, v16, v17, v18);
    v5 = [v10 errorWithDomain:v11 code:2 userInfo:v13];
  }
LABEL_8:

  return (NSError *)v5;
}

BOOL __54__FCCKPrivateDatabaseCKOperationResults_combinedError__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 second];
  BOOL v3 = v2 == 0;

  return v3;
}

BOOL __54__FCCKPrivateDatabaseCKOperationResults_combinedError__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 second];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __54__FCCKPrivateDatabaseCKOperationResults_combinedError__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 second];
  BOOL v3 = [v2 code] != 2;

  return v3;
}

void __54__FCCKPrivateDatabaseCKOperationResults_combinedError__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v30;
    uint64_t v24 = *MEMORY[0x1E4F19CD8];
    *(void *)&long long v6 = 136315906;
    long long v22 = v6;
    do
    {
      uint64_t v9 = 0;
      uint64_t v23 = v7;
      do
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v29 + 1) + 8 * v9);
        uint64_t v11 = objc_msgSend(v10, "first", v22);
        uint64_t v12 = [v10 second];
        v13 = v12;
        if (v12)
        {
          if ([v12 code] == 2)
          {
            v14 = [v13 userInfo];
            id v15 = [v14 objectForKeyedSubscript:v24];

            if (!v15 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              int v21 = (void *)[[NSString alloc] initWithFormat:@"all partial failures should have a dictionary from IDs to errors"];
              *(_DWORD *)buf = v22;
              v35 = "-[FCCKPrivateDatabaseCKOperationResults combinedError]_block_invoke_4";
              __int16 v36 = 2080;
              v37 = "FCCKPrivateDatabaseOperation.m";
              __int16 v38 = 1024;
              int v39 = 240;
              __int16 v40 = 2114;
              v41 = v21;
              _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
            }
            [v3 addEntriesFromDictionary:v15];
          }
          else
          {
            long long v27 = 0u;
            long long v28 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
            id v15 = v11;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = v8;
              uint64_t v19 = *(void *)v26;
              do
              {
                for (uint64_t i = 0; i != v17; ++i)
                {
                  if (*(void *)v26 != v19) {
                    objc_enumerationMutation(v15);
                  }
                  [v3 setObject:v13 forKey:*(void *)(*((void *)&v25 + 1) + 8 * i)];
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
              }
              while (v17);
              uint64_t v8 = v18;
              uint64_t v7 = v23;
            }
          }
        }
        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v7);
  }
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (FCThreadSafeMutableArray)threadSafeItems
{
  return self->_threadSafeItems;
}

- (void)setThreadSafeItems:(id)a3
{
}

- (FCThreadSafeMutableArray)threadSafeErrorsAndItemIDs
{
  return self->_threadSafeErrorsAndItemIDs;
}

- (void)setThreadSafeErrorsAndItemIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadSafeErrorsAndItemIDs, 0);
  objc_storeStrong((id *)&self->_threadSafeItems, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end