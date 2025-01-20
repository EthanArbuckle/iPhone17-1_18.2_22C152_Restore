@interface REMDACalDAVSyncReplicaManagerProvider
@end

@implementation REMDACalDAVSyncReplicaManagerProvider

void __79___REMDACalDAVSyncReplicaManagerProvider_replicaManagerForAccountID_withStore___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) uuid];
  uint64_t v3 = [(id)managerByAccountID objectForKeyedSubscript:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    id v25 = 0;
    v8 = [v6 fetchReplicaManagerForAccountID:v7 error:&v25];
    id v9 = v25;
    if (v8)
    {
      v10 = +[REMLog dataAccess];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [v8 managerData];
        uint64_t v12 = [v11 length];
        *(_DWORD *)buf = 138412546;
        v27 = v2;
        __int16 v28 = 2048;
        uint64_t v29 = v12;
        _os_log_impl(&dword_1B9AA2000, v10, OS_LOG_TYPE_DEFAULT, "_REMDACalDAVSyncReplicaManagerProvider: Deserializing existing replica manager {account = %@, size = %lu}", buf, 0x16u);
      }
      id v24 = v9;
      uint64_t v13 = +[REMReplicaManager replicaManagerWithSerializedData:v8 error:&v24];
      id v14 = v24;

      uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
      v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v13;

      id v9 = v14;
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      v17 = +[REMLog dataAccess];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v2;
        _os_log_impl(&dword_1B9AA2000, v17, OS_LOG_TYPE_DEFAULT, "_REMDACalDAVSyncReplicaManagerProvider: Creating a new replica manager {account = %@}", buf, 0xCu);
      }

      v18 = objc_alloc_init(REMReplicaManager);
      uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
      v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }
    v21 = (void *)managerByAccountID;
    if (!managerByAccountID)
    {
      uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
      v23 = (void *)managerByAccountID;
      managerByAccountID = v22;

      v21 = (void *)managerByAccountID;
    }
    [v21 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKeyedSubscript:v2];
  }
}

void __78___REMDACalDAVSyncReplicaManagerProvider_unsavedReplicaManagersForAccountIDs___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v8 = (void *)managerByAccountID;
        id v9 = objc_msgSend(v7, "uuid", (void)v11);
        v10 = [v8 objectForKeyedSubscript:v9];

        if ([v10 hasUnsavedChanges]) {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v10 forKeyedSubscript:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

@end