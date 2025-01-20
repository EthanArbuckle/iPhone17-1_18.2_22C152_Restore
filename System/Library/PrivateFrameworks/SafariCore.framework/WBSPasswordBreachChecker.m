@interface WBSPasswordBreachChecker
- (WBSPasswordBreachChecker)initWithContext:(id)a3 bagManager:(id)a4;
- (void)_checkHighFrequencyBucketForPasswords:(id)a3 withCompletionHandler:(id)a4;
- (void)_checkLowFrequencyBatchesWithBagManager:(id)a3 completionHandler:(id)a4;
- (void)_mergeResultsByUUID:(id)a3 intoResultsByPersistentIdentifier:(id)a4 usingQueuedPasswordsbyUUID:(id)a5;
- (void)checkPasswordBatchesWithCompletionHandler:(id)a3;
@end

@implementation WBSPasswordBreachChecker

- (WBSPasswordBreachChecker)initWithContext:(id)a3 bagManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSPasswordBreachChecker;
  v9 = [(WBSPasswordBreachChecker *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_bagManager, a4);
    v11 = [[WBSPasswordBreachRequestManager alloc] initWithContext:v7];
    requestManager = v10->_requestManager;
    v10->_requestManager = v11;

    v13 = v10;
  }

  return v10;
}

- (void)_checkHighFrequencyBucketForPasswords:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B728F000, v8, OS_LOG_TYPE_INFO, "Fetching high frequency bucket.", buf, 2u);
  }
  requestManager = self->_requestManager;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__WBSPasswordBreachChecker__checkHighFrequencyBucketForPasswords_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E615BE70;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(WBSPasswordBreachRequestManager *)requestManager fetchHighFrequencyBucketWithCompletionHandler:v12];
}

void __88__WBSPasswordBreachChecker__checkHighFrequencyBucketForPasswords_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v23 = v3;
  if (v3)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v22 = a1;
      uint64_t v8 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v11 = objc_msgSend(v10, "highFrequencyEncodedPasswordData", v22);
          int v12 = [v23 containsLowercaseHexStringForData:v11];

          if (v12) {
            uint64_t v13 = 1;
          }
          else {
            uint64_t v13 = 2;
          }
          id v14 = [NSNumber numberWithUnsignedInteger:v13];
          objc_super v15 = [v10 uuid];
          [v4 setObject:v14 forKeyedSubscript:v15];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v7);
      a1 = v22;
    }
  }
  else
  {
    v16 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __88__WBSPasswordBreachChecker__checkHighFrequencyBucketForPasswords_withCompletionHandler___block_invoke_cold_1(v16);
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v5 = *(id *)(a1 + 32);
    uint64_t v17 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v5);
          }
          v21 = [*(id *)(*((void *)&v28 + 1) + 8 * j) uuid];
          [v4 setObject:&unk_1F1086320 forKeyedSubscript:v21];
        }
        uint64_t v18 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v18);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_checkLowFrequencyBatchesWithBagManager:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B728F000, v8, OS_LOG_TYPE_INFO, "Performing low frequency batch lookup.", buf, 2u);
  }
  v9 = [(WBSPasswordBreachContext *)self->_context configuration];
  char v10 = [v9 verboseSensitiveLoggingEnabled];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__WBSPasswordBreachChecker__checkLowFrequencyBatchesWithBagManager_completionHandler___block_invoke;
  v12[3] = &unk_1E615BEC0;
  void v12[4] = self;
  id v13 = v6;
  char v14 = v10;
  id v11 = v6;
  [v7 getPasswordsForNextBatchWithCompletionHandler:v12];
}

void __86__WBSPasswordBreachChecker__checkLowFrequencyBatchesWithBagManager_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 count];
  if ([v3 count])
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v4];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          int v12 = [v11 topBucketIdentiferAndHash];
          id v13 = [v11 uuid];
          [v5 setObject:v12 forKeyedSubscript:v13];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v8);
    }

    uint64_t v14 = *(void *)(a1 + 32);
    objc_super v15 = *(void **)(v14 + 24);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __86__WBSPasswordBreachChecker__checkLowFrequencyBatchesWithBagManager_completionHandler___block_invoke_2;
    v17[3] = &unk_1E615BE98;
    uint64_t v21 = v4;
    id v18 = v5;
    uint64_t v19 = v14;
    char v22 = *(unsigned char *)(a1 + 48);
    id v20 = *(id *)(a1 + 40);
    id v16 = v5;
    [v15 fetchLowFrequencyBucketsForBucketIdentifiersAndClientBlindedHashes:v16 completionHandler:v17];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __86__WBSPasswordBreachChecker__checkLowFrequencyBatchesWithBagManager_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:*(void *)(a1 + 56)];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v27 = a1;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v31;
    *(void *)&long long v6 = 138740227;
    long long v24 = v6;
    uint64_t v26 = *(void *)v31;
    do
    {
      uint64_t v9 = 0;
      uint64_t v28 = v7;
      do
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v30 + 1) + 8 * v9);
        id v11 = objc_msgSend(v3, "objectForKeyedSubscript:", v10, v24);
        int v12 = [v11 first];
        id v13 = [v11 second];
        uint64_t v14 = v13;
        if (v12 && [v13 length])
        {
          id v15 = v3;
          id v16 = [*(id *)(*(void *)(v27 + 40) + 8) cryptographicOperations];
          uint64_t v17 = [v16 unblindHash:v14];

          if (*(unsigned char *)(v27 + 64))
          {
            id v18 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              id v20 = NSString;
              uint64_t v21 = v18;
              long long v25 = objc_msgSend(v20, "safari_stringAsHexWithData:", v14);
              uint64_t v22 = objc_msgSend(NSString, "safari_stringAsHexWithData:", v17);
              *(_DWORD *)buf = v24;
              v35 = v25;
              __int16 v36 = 2117;
              uint64_t v37 = v22;
              long long v23 = (void *)v22;
              _os_log_debug_impl(&dword_1B728F000, v21, OS_LOG_TYPE_DEBUG, "Unblinded %{sensitive}@ to %{sensitive}@", buf, 0x16u);
            }
          }
          if ([v12 containsLowercaseHexStringForData:v17]) {
            uint64_t v19 = &unk_1F1086338;
          }
          else {
            uint64_t v19 = &unk_1F1086350;
          }
          [v4 setObject:v19 forKeyedSubscript:v10];

          id v3 = v15;
          uint64_t v8 = v26;
          uint64_t v7 = v28;
        }
        else
        {
          [v4 setObject:&unk_1F1086320 forKeyedSubscript:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v7);
  }

  (*(void (**)(void))(*(void *)(v27 + 48) + 16))();
}

- (void)_mergeResultsByUUID:(id)a3 intoResultsByPersistentIdentifier:(id)a4 usingQueuedPasswordsbyUUID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __109__WBSPasswordBreachChecker__mergeResultsByUUID_intoResultsByPersistentIdentifier_usingQueuedPasswordsbyUUID___block_invoke;
  v11[3] = &unk_1E615BEE8;
  id v12 = v8;
  id v13 = v7;
  id v9 = v7;
  id v10 = v8;
  [a3 enumerateKeysAndObjectsUsingBlock:v11];
}

void __109__WBSPasswordBreachChecker__mergeResultsByUUID_intoResultsByPersistentIdentifier_usingQueuedPasswordsbyUUID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = objc_msgSend(v6, "persistentIdentifiers", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v12 length]) {
          [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)checkPasswordBatchesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B728F000, v5, OS_LOG_TYPE_INFO, "Beginning breached password lookup session.", buf, 2u);
  }
  long long v6 = [(WBSPasswordBreachQueuedPasswordBagManager *)self->_bagManager allNonbreachedPasswords];
  uint64_t v7 = [v6 count];
  uint64_t v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[WBSPasswordBreachChecker checkPasswordBatchesWithCompletionHandler:](v9, v6);
    }
    uint64_t v10 = [v6 allValues];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__WBSPasswordBreachChecker_checkPasswordBatchesWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E615BF58;
    void v11[4] = self;
    id v12 = v6;
    id v13 = v4;
    [(WBSPasswordBreachChecker *)self _checkHighFrequencyBucketForPasswords:v10 withCompletionHandler:v11];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B728F000, v9, OS_LOG_TYPE_DEFAULT, "Found no passwords to check. Stopping session.", buf, 2u);
    }
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __70__WBSPasswordBreachChecker_checkPasswordBatchesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_35);
  id v4 = objc_msgSend(v3, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_14);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = [v4 count];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v6)
  {
    [*(id *)(v7 + 16) reportPasswordCheckBatchResults:v4];
    [*(id *)(a1 + 32) _mergeResultsByUUID:v3 intoResultsByPersistentIdentifier:v5 usingQueuedPasswordsbyUUID:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v8 = [*(id *)(v7 + 8) configuration];
    int v9 = [v8 verboseSensitiveLoggingEnabled];

    if (v9)
    {
      uint64_t v10 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __70__WBSPasswordBreachChecker_checkPasswordBatchesWithCompletionHandler___block_invoke_cold_2(v10);
      }
    }
  }
  id v11 = dispatch_group_create();
  id v12 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
  uint64_t v13 = [v12 numberOfBatchesPerSession];

  if (v13)
  {
    unint64_t v14 = 0;
    while (1)
    {
      dispatch_group_enter(v11);
      long long v15 = *(void **)(a1 + 32);
      uint64_t v16 = v15[2];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __70__WBSPasswordBreachChecker_checkPasswordBatchesWithCompletionHandler___block_invoke_15;
      v24[3] = &unk_1E615BF30;
      v24[4] = v15;
      id v25 = v5;
      id v26 = *(id *)(a1 + 40);
      uint64_t v17 = v11;
      uint64_t v27 = v17;
      [v15 _checkLowFrequencyBatchesWithBagManager:v16 completionHandler:v24];
      uint64_t v18 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
      dispatch_time_t v19 = dispatch_time(0, 1000000000 * [v18 lowFrequencyBucketFetchTimeout]);
      intptr_t v20 = dispatch_group_wait(v17, v19);

      if (v20) {
        break;
      }

      ++v14;
      uint64_t v21 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
      unint64_t v22 = [v21 numberOfBatchesPerSession];

      if (v14 >= v22) {
        goto LABEL_10;
      }
    }
    long long v23 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      __70__WBSPasswordBreachChecker_checkPasswordBatchesWithCompletionHandler___block_invoke_cold_1(v23);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
LABEL_10:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void *__70__WBSPasswordBreachChecker_checkPasswordBatchesWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v3 = [a3 unsignedIntegerValue];
  if (v3 > 2) {
    return &unk_1F1086320;
  }
  else {
    return (void *)qword_1E615BF78[v3];
  }
}

id __70__WBSPasswordBreachChecker_checkPasswordBatchesWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if ([v3 unsignedIntegerValue] == 2) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

void __70__WBSPasswordBreachChecker_checkPasswordBatchesWithCompletionHandler___block_invoke_15(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_18_1);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 16) reportPasswordCheckBatchResults:v3];
  [*(id *)(a1 + 32) _mergeResultsByUUID:v3 intoResultsByPersistentIdentifier:*(void *)(a1 + 40) usingQueuedPasswordsbyUUID:*(void *)(a1 + 48)];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void *__70__WBSPasswordBreachChecker_checkPasswordBatchesWithCompletionHandler___block_invoke_2_16(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v3 = [a3 unsignedIntegerValue];
  if (v3 > 2) {
    return &unk_1F1086320;
  }
  else {
    return (void *)qword_1E615BF90[v3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestManager, 0);
  objc_storeStrong((id *)&self->_bagManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

void __88__WBSPasswordBreachChecker__checkHighFrequencyBucketForPasswords_withCompletionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Failed to fetch high frequency bucket.", v1, 2u);
}

- (void)checkPasswordBatchesWithCompletionHandler:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a1;
  int v4 = 134283521;
  uint64_t v5 = [a2 count];
  _os_log_debug_impl(&dword_1B728F000, v3, OS_LOG_TYPE_DEBUG, "Initial bag contains %{private}lu non-breached passwords.", (uint8_t *)&v4, 0xCu);
}

void __70__WBSPasswordBreachChecker_checkPasswordBatchesWithCompletionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Timed out waiting for low frequency bucket result.", v1, 2u);
}

void __70__WBSPasswordBreachChecker_checkPasswordBatchesWithCompletionHandler___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B728F000, log, OS_LOG_TYPE_DEBUG, "No breached common passwords found.", v1, 2u);
}

@end