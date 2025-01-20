@interface FCCKRecordZoneManager
- (id)initWithDatabase:(void *)a3 recordZoneNames:;
- (id)recordZoneWithName:(id *)a1;
- (void)ensureRecordZoneExistsWithID:(id)a3 completionHandler:(id)a4;
- (void)prepareRecordZonesForUseWithCompletionHandler:(uint64_t)a1;
@end

@implementation FCCKRecordZoneManager

- (id)initWithDatabase:(void *)a3 recordZoneNames:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v27 = a2;
  id v6 = a3;
  if (a1
    && (v33.receiver = a1,
        v33.super_class = (Class)FCCKRecordZoneManager,
        (v28 = (id *)objc_msgSendSuper2(&v33, sel_init)) != 0))
  {
    id v24 = a2;
    v7 = [MEMORY[0x1E4F1CA48] array];
    v8 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v25 = v6;
    id obj = v6;
    uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v30;
      uint64_t v12 = *MEMORY[0x1E4F19C08];
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * v13);
          v15 = (void *)[objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:v14 ownerName:v12];
          [v7 addObject:v15];
          v16 = -[FCCKRecordZone initWithDatabase:delegate:recordZoneID:]((id *)[FCCKRecordZone alloc], v27, v28, v15);
          [v8 setObject:v16 forKey:v14];

          ++v13;
        }
        while (v10 != v13);
        uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v10);
    }

    objc_storeStrong(v28 + 1, v24);
    id v17 = v28[2];
    v28[2] = v7;
    id v18 = v7;

    id v19 = v28[3];
    v28[3] = v8;
    id v20 = v8;

    v21 = [[FCAsyncSerialQueue alloc] initWithQualityOfService:25];
    id v22 = v28[5];
    v28[5] = v21;

    id v6 = v25;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)recordZoneWithName:(id *)a1
{
  if (a1)
  {
    a1 = [a1[3] objectForKey:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)prepareRecordZonesForUseWithCompletionHandler:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __71__FCCKRecordZoneManager_prepareRecordZonesForUseWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E5B5AFB8;
    v6[4] = a1;
    id v7 = v3;
    [v5 enqueueBlock:v6];
  }
}

void __71__FCCKRecordZoneManager_prepareRecordZonesForUseWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__FCCKRecordZoneManager_prepareRecordZonesForUseWithCompletionHandler___block_invoke_2;
  aBlock[3] = &unk_1E5B544B8;
  id v4 = v3;
  id v17 = v4;
  id v18 = *(id *)(a1 + 40);
  v5 = _Block_copy(aBlock);
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7 && *(void *)(v7 + 32))
  {
    (*((void (**)(void *, void))v5 + 2))(v5, 0);
  }
  else
  {
    v8 = objc_alloc_init(FCCKPrivateFetchRecordZonesOperation);
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      uint64_t v11 = *(void *)(v10 + 16);
    }
    else {
      uint64_t v11 = 0;
    }
    [(FCCKPrivateFetchRecordZonesOperation *)v8 setRecordZoneIDs:v11];
    [(FCOperation *)v9 setQualityOfService:25];
    [(FCOperation *)v9 setRelativePriority:1];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__FCCKRecordZoneManager_prepareRecordZonesForUseWithCompletionHandler___block_invoke_3;
    v14[3] = &unk_1E5B4CD48;
    v14[4] = *(void *)(a1 + 32);
    id v15 = v6;
    [(FCCKPrivateFetchRecordZonesOperation *)v9 setFetchRecordZonesCompletionBlock:v14];
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      uint64_t v13 = *(void *)(v12 + 8);
    }
    else {
      uint64_t v13 = 0;
    }
    -[FCCKPrivateDatabase addOperation:](v13, v9);
  }
}

void __71__FCCKRecordZoneManager_prepareRecordZonesForUseWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void (**)(uint64_t))(v3 + 16);
  id v5 = a2;
  v4(v3);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __71__FCCKRecordZoneManager_prepareRecordZonesForUseWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    if ([v6 code] == 2)
    {
      id v24 = v5;
      v8 = [v6 userInfo];
      uint64_t v9 = [v8 objectForKey:*MEMORY[0x1E4F19CD8]];

      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v30 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * i);
            v16 = [v10 objectForKey:v15];
            if ([v16 code] == 26)
            {
              id v17 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v15];
              [v7 addObject:v17];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v12);
      }

      id v5 = v24;
    }
    if ([v7 count])
    {
      id v18 = objc_alloc_init(FCCKPrivateSaveRecordZonesOperation);
      [(FCCKPrivateSaveRecordZonesOperation *)v18 setRecordZonesToSave:v7];
      [(FCOperation *)v18 setQualityOfService:25];
      [(FCOperation *)v18 setRelativePriority:1];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __71__FCCKRecordZoneManager_prepareRecordZonesForUseWithCompletionHandler___block_invoke_4;
      v25[3] = &unk_1E5B54DC0;
      id v19 = v5;
      uint64_t v20 = *(void *)(a1 + 32);
      v21 = *(void **)(a1 + 40);
      id v26 = v19;
      uint64_t v27 = v20;
      id v28 = v21;
      [(FCCKPrivateSaveRecordZonesOperation *)v18 setSaveRecordZonesCompletionBlock:v25];
      uint64_t v22 = *(void *)(a1 + 32);
      if (v22) {
        uint64_t v23 = *(void *)(v22 + 8);
      }
      else {
        uint64_t v23 = 0;
      }
      -[FCCKPrivateDatabase addOperation:](v23, v18);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    -[FCAssetHandle setFetchOperation:](*(void *)(a1 + 32), v5);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __71__FCCKRecordZoneManager_prepareRecordZonesForUseWithCompletionHandler___block_invoke_4(void *a1, void *a2, void *a3)
{
  id v10 = a3;
  if (!v10)
  {
    id v5 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v6 = a1[4];
    id v7 = a2;
    v8 = [v5 dictionaryWithDictionary:v6];
    uint64_t v9 = objc_msgSend(v7, "fc_dictionaryWithKeySelector:", sel_zoneID);

    [v8 addEntriesFromDictionary:v9];
    -[FCAssetHandle setFetchOperation:](a1[5], v8);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)ensureRecordZoneExistsWithID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__FCCKRecordZoneManager_ensureRecordZoneExistsWithID_completionHandler___block_invoke;
  v10[3] = &unk_1E5B55918;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  -[FCCKRecordZoneManager prepareRecordZonesForUseWithCompletionHandler:]((uint64_t)self, v10);
}

void __72__FCCKRecordZoneManager_ensureRecordZoneExistsWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(void **)(v4 + 32);
  }
  else {
    id v5 = 0;
  }
  id v6 = [v5 objectForKey:*(void *)(a1 + 40)];
  id v7 = [*(id *)(a1 + 40) zoneName];
  int v8 = [v7 isEqualToString:@"Subscriptions"];

  if (v8)
  {
    if (!v6)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      if (v9)
      {
        if (*(void *)(v9 + 32) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          id v10 = (void *)[[NSString alloc] initWithFormat:@"missing record zone for ID %@", *(void *)(a1 + 40)];
          *(_DWORD *)buf = 136315906;
          uint64_t v14 = "-[FCCKRecordZoneManager ensureRecordZoneExistsWithID:completionHandler:]_block_invoke";
          __int16 v15 = 2080;
          v16 = "FCCKRecordZoneManager.m";
          __int16 v17 = 1024;
          int v18 = 152;
          __int16 v19 = 2114;
          uint64_t v20 = v10;
          id v11 = MEMORY[0x1E4F14500];
LABEL_15:
          _os_log_error_impl(&dword_1A460D000, v11, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
      }
    }
  }
  else if (!v6)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12)
    {
      if (*(void *)(v12 + 32) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v10 = (void *)[[NSString alloc] initWithFormat:@"missing record zone for ID %@", *(void *)(a1 + 40)];
        *(_DWORD *)buf = 136315906;
        uint64_t v14 = "-[FCCKRecordZoneManager ensureRecordZoneExistsWithID:completionHandler:]_block_invoke";
        __int16 v15 = 2080;
        v16 = "FCCKRecordZoneManager.m";
        __int16 v17 = 1024;
        int v18 = 156;
        __int16 v19 = 2114;
        uint64_t v20 = v10;
        id v11 = MEMORY[0x1E4F14500];
        goto LABEL_15;
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_ckRecordZonesByID, 0);
  objc_storeStrong((id *)&self->_fcRecordZonesByName, 0);
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end