@interface WBSPasswordBreachQueuedPasswordBagManager
- (NSDictionary)allNonbreachedPasswords;
- (WBSPasswordBreachQueuedPasswordBagManager)initWithContext:(id)a3 results:(id)a4 passwordSource:(id)a5;
- (id)_constructBagOnInternalQueueWithCredentials:(id)a3 ensureFakePasswordGeneration:(BOOL)a4;
- (id)_constructNewBagOnInternalQueueEnsuringFakePasswordGeneration:(BOOL)a3;
- (id)_dictionaryRepresentation;
- (id)_passwordBagFromDictionaryRepresentation:(id)a3;
- (id)_unbreachedCredentials;
- (id)description;
- (int64_t)fillState;
- (void)getPasswordsForNextBatchWithCompletionHandler:(id)a3;
- (void)reportPasswordCheckBatchResults:(id)a3;
- (void)saveBagToStore;
@end

@implementation WBSPasswordBreachQueuedPasswordBagManager

- (WBSPasswordBreachQueuedPasswordBagManager)initWithContext:(id)a3 results:(id)a4 passwordSource:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)WBSPasswordBreachQueuedPasswordBagManager;
  v12 = [(WBSPasswordBreachQueuedPasswordBagManager *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_results, a4);
    objc_storeStrong((id *)&v13->_credentialSource, a5);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.Safari.WBSPasswordBreachQueuedPasswordBagManager", 0);
    internalQueue = v13->_internalQueue;
    v13->_internalQueue = (OS_dispatch_queue *)v14;

    v13->_fillState = 0;
    v16 = v13->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__WBSPasswordBreachQueuedPasswordBagManager_initWithContext_results_passwordSource___block_invoke;
    block[3] = &unk_1E615A768;
    v17 = v13;
    v21 = v17;
    dispatch_async(v16, block);
    v18 = v17;
  }
  return v13;
}

void __84__WBSPasswordBreachQueuedPasswordBagManager_initWithContext_results_passwordSource___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) store];
  v3 = [v2 queuedPasswordBagManagerState];

  v4 = [*(id *)(a1 + 32) _passwordBagFromDictionaryRepresentation:v3];
  uint64_t v5 = [v4 mutableCopy];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;

  if ([*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1B728F000, v8, OS_LOG_TYPE_INFO, "Restored password bag.", v13, 2u);
    }
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 32) _constructNewBagOnInternalQueueEnsuringFakePasswordGeneration:0];
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 32);
    *(void *)(v10 + 32) = v9;

    if (![*(id *)(*(void *)(a1 + 32) + 32) count])
    {
      v12 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __84__WBSPasswordBreachQueuedPasswordBagManager_initWithContext_results_passwordSource___block_invoke_cold_1();
      }
    }
  }
}

- (id)_passwordBagFromDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B728F000, v5, OS_LOG_TYPE_INFO, "Trying to restore password bag from persisted state.", buf, 2u);
  }
  uint64_t v6 = objc_msgSend(v4, "safari_numberForKey:", @"FillState");
  v7 = v6;
  if (v6)
  {
    self->_fillState = [v6 integerValue];
    v8 = objc_msgSend(v4, "safari_arrayContainingObjectsOfClass:forKey:", objc_opt_class(), @"PersistentIdentifiers");
    if ([v8 count])
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v8];
      uint64_t v10 = [(WBSPasswordBreachQueuedPasswordBagManager *)self _unbreachedCredentials];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __86__WBSPasswordBreachQueuedPasswordBagManager__passwordBagFromDictionaryRepresentation___block_invoke;
      v17[3] = &unk_1E615C038;
      id v18 = v9;
      id v11 = v9;
      v12 = objc_msgSend(v10, "safari_filterObjectsUsingBlock:", v17);
      v13 = [(WBSPasswordBreachQueuedPasswordBagManager *)self _constructBagOnInternalQueueWithCredentials:v12 ensureFakePasswordGeneration:0];
    }
    else
    {
      v15 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[WBSPasswordBreachQueuedPasswordBagManager _passwordBagFromDictionaryRepresentation:]();
      }
      v13 = 0;
    }
  }
  else
  {
    dispatch_queue_t v14 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[WBSPasswordBreachQueuedPasswordBagManager _passwordBagFromDictionaryRepresentation:]();
    }
    v13 = 0;
  }

  return v13;
}

uint64_t __86__WBSPasswordBreachQueuedPasswordBagManager__passwordBagFromDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 persistentIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (id)_unbreachedCredentials
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [(WBSPasswordBreachCredentialSource *)self->_credentialSource credentials];
  uint64_t v4 = objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_37);
  uint64_t v5 = [(WBSPasswordBreachResults *)self->_results resultRecordsForQueries:v4];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v13 = [v12 persistentIdentifier];
        [v6 setObject:v12 forKeyedSubscript:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__WBSPasswordBreachQueuedPasswordBagManager__unbreachedCredentials__block_invoke_2;
  v17[3] = &unk_1E615C038;
  id v18 = v6;
  id v14 = v6;
  v15 = objc_msgSend(v3, "safari_filterObjectsUsingBlock:", v17);

  return v15;
}

WBSPasswordBreachResultQuery *__67__WBSPasswordBreachQueuedPasswordBagManager__unbreachedCredentials__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [WBSPasswordBreachResultQuery alloc];
  uint64_t v4 = [v2 persistentIdentifier];
  uint64_t v5 = [v2 dateLastModified];

  id v6 = [(WBSPasswordBreachResultQuery *)v3 initWithPersistentIdentifier:v4 dateLastModified:v5];
  return v6;
}

BOOL __67__WBSPasswordBreachQueuedPasswordBagManager__unbreachedCredentials__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [a2 persistentIdentifier];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  if (v4) {
    BOOL v5 = ([v4 result] & 0xFFFFFFFFFFFFFFFELL) != 2;
  }
  else {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)_constructNewBagOnInternalQueueEnsuringFakePasswordGeneration:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[WBSPasswordBreachQueuedPasswordBagManager _constructNewBagOnInternalQueueEnsuringFakePasswordGeneration:]();
  }
  int64_t fillState = self->_fillState;
  if (fillState)
  {
    if (fillState != 1) {
      goto LABEL_8;
    }
    int64_t v7 = 2;
  }
  else
  {
    int64_t v7 = 1;
  }
  self->_int64_t fillState = v7;
LABEL_8:
  uint64_t v8 = [(WBSPasswordBreachQueuedPasswordBagManager *)self _unbreachedCredentials];
  uint64_t v9 = [(WBSPasswordBreachQueuedPasswordBagManager *)self _constructBagOnInternalQueueWithCredentials:v8 ensureFakePasswordGeneration:v3];

  return v9;
}

- (id)_constructBagOnInternalQueueWithCredentials:(id)a3 ensureFakePasswordGeneration:(BOOL)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "safari_dictionaryWithObjectsInFastEnumerationCollection:groupedUsingBlock:", a3, &__block_literal_global_14_0);
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  int64_t v7 = [v5 allValues];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [[WBSPasswordBreachQueuedPassword alloc] initWithCredentials:*(void *)(*((void *)&v32 + 1) + 8 * i) context:self->_context];
        v13 = [(WBSPasswordBreachQueuedPassword *)v12 uuid];
        [v6 setObject:v12 forKeyedSubscript:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v9);
  }

  id v14 = [(WBSPasswordBreachContext *)self->_context configuration];
  uint64_t v15 = [v14 passwordCheckBatchSize];
  uint64_t v16 = [v14 numberOfBatchesPerSession];
  unint64_t v17 = [v6 count];
  unint64_t v18 = v17;
  if (!a4 && !v17)
  {
    long long v19 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[WBSPasswordBreachQueuedPasswordBagManager _constructBagOnInternalQueueWithCredentials:ensureFakePasswordGeneration:]();
    }
LABEL_19:
    id v28 = v6;
    goto LABEL_20;
  }
  unint64_t v20 = v16 * v15;
  if (v20 <= v17) {
    goto LABEL_19;
  }
  long long v21 = [(WBSPasswordBreachContext *)self->_context configuration];
  int v22 = [v21 verboseSensitiveLoggingEnabled];

  if (v22)
  {
    v23 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134545665;
      unint64_t v37 = v20 - v18;
      _os_log_debug_impl(&dword_1B728F000, v23, OS_LOG_TYPE_DEBUG, "Adding %{sensitive}lu generated passwords to the bag.", buf, 0xCu);
    }
  }
  unint64_t v24 = v20 - v18;
  if (v20 == v18) {
    goto LABEL_19;
  }
  while (1)
  {
    id v25 = [[WBSPasswordBreachQueuedPassword alloc] initFakePasswordWithContext:self->_context];
    if (!v25) {
      break;
    }
    v26 = v25;
    v27 = [v25 uuid];
    [v6 setObject:v26 forKeyedSubscript:v27];

    if (!--v24) {
      goto LABEL_19;
    }
  }
  v30 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
    -[WBSPasswordBreachQueuedPasswordBagManager _constructBagOnInternalQueueWithCredentials:ensureFakePasswordGeneration:]();
  }
  id v28 = 0;
LABEL_20:

  return v28;
}

id __118__WBSPasswordBreachQueuedPasswordBagManager__constructBagOnInternalQueueWithCredentials_ensureFakePasswordGeneration___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 password];
  BOOL v3 = (void *)[v2 length];
  if (v3)
  {
    if (+[WBSPasswordEvaluator passwordLooksLikeDigitOnlyPasscode:v2])
    {
      BOOL v3 = 0;
    }
    else
    {
      BOOL v3 = v2;
    }
  }
  id v4 = v3;

  return v4;
}

- (void)getPasswordsForNextBatchWithCompletionHandler:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__WBSPasswordBreachQueuedPasswordBagManager_getPasswordsForNextBatchWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E615A6A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __91__WBSPasswordBreachQueuedPasswordBagManager_getPasswordsForNextBatchWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
  uint64_t v3 = [v2 passwordCheckBatchSize];

  id v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v3];
  BOOL v5 = [*(id *)(*(void *)(v1 + 32) + 32) allKeys];
  id v6 = (void *)[v5 mutableCopy];

  int64_t v7 = [*(id *)(*(void *)(v1 + 32) + 8) configuration];
  if ([v6 count])
  {
    if (!v3)
    {
LABEL_40:
      v13 = v6;
      goto LABEL_41;
    }
    uint64_t v8 = 0;
    v43 = v7;
    v44 = v4;
    uint64_t v42 = v3;
LABEL_4:
    unint64_t v9 = arc4random();
    unint64_t v10 = v9 % [v6 count];
    id v11 = [v6 objectAtIndexedSubscript:v10];
    v12 = [*(id *)(*(void *)(v1 + 32) + 32) objectForKeyedSubscript:v11];
    [v4 addObject:v12];
    [v6 removeObjectAtIndex:v10];
    if ([v6 count])
    {
      v13 = v6;
      goto LABEL_32;
    }
    id v14 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __91__WBSPasswordBreachQueuedPasswordBagManager_getPasswordsForNextBatchWithCompletionHandler___block_invoke_cold_3(&v59, v60, v14);
    }
    if (([v7 shouldRefillBagWhenEmpty] & 1) == 0)
    {
      v40 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
        __91__WBSPasswordBreachQueuedPasswordBagManager_getPasswordsForNextBatchWithCompletionHandler___block_invoke_cold_2();
      }

      goto LABEL_40;
    }
    uint64_t v15 = [*(id *)(v1 + 32) _constructNewBagOnInternalQueueEnsuringFakePasswordGeneration:1];
    if (!v15)
    {
      v41 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
        __91__WBSPasswordBreachQueuedPasswordBagManager_getPasswordsForNextBatchWithCompletionHandler___block_invoke_cold_1();
      }
      (*(void (**)(void))(*(void *)(v1 + 40) + 16))();

      goto LABEL_42;
    }
    uint64_t v16 = (void *)v15;
    v45 = v12;
    uint64_t v46 = v8;
    v47 = v11;
    int v49 = [v7 verboseSensitiveLoggingEnabled];
    v48 = v16;
    unint64_t v17 = [v16 allKeys];
    v13 = (void *)[v17 mutableCopy];

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = *(id *)(*(void *)(v1 + 32) + 32);
    uint64_t v18 = [obj countByEnumeratingWithState:&v55 objects:v66 count:16];
    if (!v18) {
      goto LABEL_24;
    }
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v56;
LABEL_12:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v56 != v20) {
        objc_enumerationMutation(obj);
      }
      uint64_t v22 = *(void *)(*((void *)&v55 + 1) + 8 * v21);
      uint64_t v23 = v1;
      unint64_t v24 = [*(id *)(*(void *)(v1 + 32) + 32) objectForKeyedSubscript:v22];
      id v25 = [v24 persistentIdentifiers];
      v26 = [v25 firstObject];
      uint64_t v27 = [v26 length];

      if (!v27) {
        goto LABEL_22;
      }
      if ([v24 remainingHashCount])
      {
        if (!v49) {
          goto LABEL_22;
        }
        id v28 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_22;
        }
        v29 = v28;
        uint64_t v30 = [v24 remainingHashCount];
        *(_DWORD *)buf = 138740227;
        uint64_t v63 = v22;
        __int16 v64 = 2053;
        uint64_t v65 = v30;
        _os_log_debug_impl(&dword_1B728F000, v29, OS_LOG_TYPE_DEBUG, "Skipping adding work to %{sensitive}@ because it already has %{sensitive}lu items enqueued.", buf, 0x16u);
      }
      else
      {
        v29 = [v48 objectForKeyedSubscript:v22];
        [v29 pushBucketIdentifiersAndHashesFromQueuedPassword:v24];
      }

LABEL_22:
      ++v21;
      uint64_t v1 = v23;
      if (v19 == v21)
      {
        uint64_t v19 = [obj countByEnumeratingWithState:&v55 objects:v66 count:16];
        if (!v19)
        {
LABEL_24:

          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id v4 = v44;
          id v31 = v44;
          uint64_t v32 = [v31 countByEnumeratingWithState:&v51 objects:v61 count:16];
          v12 = v45;
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = *(void *)v52;
            do
            {
              for (uint64_t i = 0; i != v33; ++i)
              {
                if (*(void *)v52 != v34) {
                  objc_enumerationMutation(v31);
                }
                v36 = [*(id *)(*((void *)&v51 + 1) + 8 * i) uuid];
                [v13 removeObject:v36];
              }
              uint64_t v33 = [v31 countByEnumeratingWithState:&v51 objects:v61 count:16];
            }
            while (v33);
          }

          uint64_t v37 = *(void *)(v1 + 32);
          v38 = *(void **)(v37 + 32);
          *(void *)(v37 + 32) = v48;

          id v6 = v13;
          uint64_t v3 = v42;
          int64_t v7 = v43;
          uint64_t v8 = v46;
          id v11 = v47;
LABEL_32:

          if (++v8 == v3)
          {
LABEL_41:
            (*(void (**)(void))(*(void *)(v1 + 40) + 16))();
            id v6 = v13;
            goto LABEL_42;
          }
          goto LABEL_4;
        }
        goto LABEL_12;
      }
    }
  }
  uint64_t v39 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B728F000, v39, OS_LOG_TYPE_DEFAULT, "Queued password bag is empty. Stopping lookup session.", buf, 2u);
  }
  (*(void (**)(void))(*(void *)(v1 + 40) + 16))();
LABEL_42:
}

- (void)reportPasswordCheckBatchResults:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__WBSPasswordBreachQueuedPasswordBagManager_reportPasswordCheckBatchResults___block_invoke;
  v7[3] = &unk_1E615A6C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __77__WBSPasswordBreachQueuedPasswordBagManager_reportPasswordCheckBatchResults___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1C9C8] now];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
  int v26 = [v4 verboseSensitiveLoggingEnabled];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v30 = [obj countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v37;
    *(void *)&long long v5 = 134217984;
    long long v25 = v5;
    uint64_t v28 = a1;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v37 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        id v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectForKeyedSubscript:", v7, v25);
        if (v8)
        {
          unint64_t v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
          uint64_t v10 = [v9 unsignedIntegerValue];

          if ((unint64_t)(v10 - 2) < 2)
          {
            if (v26)
            {
              uint64_t v16 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138739971;
                uint64_t v42 = v7;
                _os_log_debug_impl(&dword_1B728F000, v16, OS_LOG_TYPE_DEBUG, "Password with UUID %{sensitive}@ breached. Removing from bag.", buf, 0xCu);
              }
            }
            [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:v7];
          }
          else
          {
            if (!v10) {
              goto LABEL_13;
            }
            if (v10 == 1)
            {
              [v8 removeTopBucketIdentifierAndHash];
              if (v26)
              {
                id v11 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
                if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138739971;
                  uint64_t v42 = v7;
                  _os_log_debug_impl(&dword_1B728F000, v11, OS_LOG_TYPE_DEBUG, "Password with UUID %{sensitive}@ not breached.", buf, 0xCu);
                }
              }
LABEL_13:
              if (![v8 remainingHashCount])
              {
                v12 = *(void **)(*(void *)(a1 + 32) + 32);
                v13 = [v8 uuid];
                [v12 removeObjectForKey:v13];

                if (v26)
                {
                  id v14 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
                  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138739971;
                    uint64_t v42 = v7;
                    _os_log_debug_impl(&dword_1B728F000, v14, OS_LOG_TYPE_DEBUG, "Password with UUID %{sensitive}@ has no remaining queued work. Removing from bag.", buf, 0xCu);
                  }
                }
              }
            }
            else
            {
              unint64_t v17 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v25;
                uint64_t v42 = v10;
                _os_log_error_impl(&dword_1B728F000, v17, OS_LOG_TYPE_ERROR, "Received unknown breach check result: %lu", buf, 0xCu);
              }
            }
          }
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v31 = v8;
          uint64_t v18 = [v8 persistentIdentifiers];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v33;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v33 != v21) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v23 = *(void **)(*((void *)&v32 + 1) + 8 * j);
                if ([v23 length])
                {
                  unint64_t v24 = [[WBSPasswordBreachResultRecord alloc] initWithPersistentIdentifier:v23 result:v10 dateLastModified:v2];
                  [v3 addObject:v24];
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }
            while (v20);
          }

          a1 = v28;
          id v8 = v31;
          goto LABEL_35;
        }
        uint64_t v15 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138477827;
          uint64_t v42 = v7;
          _os_log_error_impl(&dword_1B728F000, v15, OS_LOG_TYPE_ERROR, "Received result for unknown password: %{private}@", buf, 0xCu);
        }
LABEL_35:
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v36 objects:v43 count:16];
    }
    while (v30);
  }

  [*(id *)(*(void *)(a1 + 32) + 16) addResultRecords:v3];
}

- (NSDictionary)allNonbreachedPasswords
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  unint64_t v9 = __Block_byref_object_copy__10;
  uint64_t v10 = __Block_byref_object_dispose__10;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__WBSPasswordBreachQueuedPasswordBagManager_allNonbreachedPasswords__block_invoke;
  v5[3] = &unk_1E615A970;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __68__WBSPasswordBreachQueuedPasswordBagManager_allNonbreachedPasswords__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)saveBagToStore
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__WBSPasswordBreachQueuedPasswordBagManager_saveBagToStore__block_invoke;
  block[3] = &unk_1E615A768;
  void block[4] = self;
  dispatch_sync(internalQueue, block);
}

void __59__WBSPasswordBreachQueuedPasswordBagManager_saveBagToStore__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _dictionaryRepresentation];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) store];
  [v2 setQueuedPasswordBagManagerState:v3];
}

- (id)_dictionaryRepresentation
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v19 = self;
  id v4 = [(NSMutableDictionary *)self->_queuedPasswordsByUUID allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v10 = [v9 persistentIdentifiers];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v30 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v21 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * j);
              if ([v15 length]) {
                [v3 addObject:v15];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v30 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v6);
  }

  v28[0] = @"FillState";
  uint64_t v16 = [NSNumber numberWithInteger:v19->_fillState];
  v28[1] = @"PersistentIdentifiers";
  v29[0] = v16;
  v29[1] = v3;
  unint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];

  return v17;
}

- (int64_t)fillState
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__WBSPasswordBreachQueuedPasswordBagManager_fillState__block_invoke;
  v5[3] = &unk_1E615A970;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__WBSPasswordBreachQueuedPasswordBagManager_fillState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40);
  return result;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p, context: %@, results: %@, credentialSource: %@, queuedPasswordsByUUID: %@>", objc_opt_class(), self, self->_context, self->_results, self->_credentialSource, self->_queuedPasswordsByUUID];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_queuedPasswordsByUUID, 0);
  objc_storeStrong((id *)&self->_credentialSource, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

void __84__WBSPasswordBreachQueuedPasswordBagManager_initWithContext_results_passwordSource___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  _os_log_error_impl(&dword_1B728F000, v0, OS_LOG_TYPE_ERROR, "Could not create password bag.", v1, 2u);
}

- (void)_passwordBagFromDictionaryRepresentation:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_5(&dword_1B728F000, v0, v1, "Missing fill state.", v2, v3, v4, v5, v6);
}

- (void)_passwordBagFromDictionaryRepresentation:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_5(&dword_1B728F000, v0, v1, "No persistent identifiers found.", v2, v3, v4, v5, v6);
}

- (void)_constructNewBagOnInternalQueueEnsuringFakePasswordGeneration:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_5(&dword_1B728F000, v0, v1, "Constructing new password bag.", v2, v3, v4, v5, v6);
}

- (void)_constructBagOnInternalQueueWithCredentials:ensureFakePasswordGeneration:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  _os_log_fault_impl(&dword_1B728F000, v0, OS_LOG_TYPE_FAULT, "Could not generate password for new password bag. Aborting.", v1, 2u);
}

- (void)_constructBagOnInternalQueueWithCredentials:ensureFakePasswordGeneration:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_5(&dword_1B728F000, v0, v1, "Found no unbreached credentials; not going to generate any extra passwords.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __91__WBSPasswordBreachQueuedPasswordBagManager_getPasswordsForNextBatchWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  _os_log_fault_impl(&dword_1B728F000, v0, OS_LOG_TYPE_FAULT, "Failed to construct new password bag. Aborting.", v1, 2u);
}

void __91__WBSPasswordBreachQueuedPasswordBagManager_getPasswordsForNextBatchWithCompletionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_5(&dword_1B728F000, v0, v1, "Told not to refill password bag.", v2, v3, v4, v5, v6);
}

void __91__WBSPasswordBreachQueuedPasswordBagManager_getPasswordsForNextBatchWithCompletionHandler___block_invoke_cold_3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1B728F000, log, OS_LOG_TYPE_DEBUG, "Password bag empty.", buf, 2u);
}

@end