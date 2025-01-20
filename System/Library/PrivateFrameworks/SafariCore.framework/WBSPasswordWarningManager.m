@interface WBSPasswordWarningManager
- (BOOL)_historyContainsItemForDomain:(id)a3;
- (BOOL)hasUnacknowledgedHighPriorityWarnings;
- (BOOL)savedAccountsFromGroup:(id)a3 containsPasswordFromSavedAccount:(id)a4;
- (WBSPasswordAuditor)passwordAuditor;
- (WBSPasswordEvaluator)passwordEvaluator;
- (WBSPasswordWarningManager)initWithSavedAccountStore:(id)a3 autoFillQuirksManager:(id)a4 userDefaults:(id)a5 highLevelDomainsProvider:(id)a6;
- (id)_passwordBreachHelperProxy;
- (id)_scoredWarningForSavedAccount:(id)a3 topFraudTargets:(id)a4 breachResultRecord:(id)a5;
- (id)_warningForSavedAccount:(id)a3 breachResultRecord:(id)a4;
- (int64_t)_scoreForSavedAccount:(id)a3 issueTypes:(unint64_t)a4 topFraudTargets:(id)a5;
- (int64_t)numberOfNonHiddenWarningsWithSpecifiedPriority;
- (unint64_t)_issuesForPassword:(id)a3 withWeakPasswordEvaluation:(id)a4 passwordIsReused:(BOOL)a5 breachResultRecord:(id)a6;
- (void)_getBreachResultRecordsForPasswords:(id)a3 startSessionIfNecessary:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)_scoreWarnings:(id)a3 topFraudTargets:(id)a4;
- (void)_sortWarningsBySeverity:(id)a3 intoHighPriorityBucket:(id)a4 intoStandardPriorityBucket:(id)a5 unspecifiedSeverityBucket:(id)a6 savedAccountMap:(id)a7 highPriorityWarningHashes:(id)a8;
- (void)_updateUserDefaultsWithWarningHashes:(id)a3;
- (void)_writePasswordEvaluationsToCache;
- (void)acknowledgeHighPriorityWarnings;
- (void)dealloc;
- (void)getAllWarningsForcingUpdate:(BOOL)a3 completionHandler:(id)a4;
- (void)getWarningForSavedAccount:(id)a3 completionHandler:(id)a4;
- (void)preWarmWarningsWithCompletionHandler:(id)a3;
- (void)removeWarningForSavedAccount:(id)a3;
@end

@implementation WBSPasswordWarningManager

- (WBSPasswordWarningManager)initWithSavedAccountStore:(id)a3 autoFillQuirksManager:(id)a4 userDefaults:(id)a5 highLevelDomainsProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v31.receiver = self;
  v31.super_class = (Class)WBSPasswordWarningManager;
  v15 = [(WBSPasswordWarningManager *)&v31 init];
  if (v15)
  {
    v16 = dispatch_get_global_queue(17, 0);
    dispatch_queue_t v17 = dispatch_queue_create_with_target_V2("com.apple.Safari.PasswordWarningManager.Work", 0, v16);
    workQueue = v15->_workQueue;
    v15->_workQueue = (OS_dispatch_queue *)v17;

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.Safari.PasswordWarningManager.Callback", 0);
    callbackQueue = v15->_callbackQueue;
    v15->_callbackQueue = (OS_dispatch_queue *)v19;

    v15->_cachedDataLock._os_unfair_lock_opaque = 0;
    v15->_passwordEvaluatorLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_historyHighLevelDomainsProvider, a6);
    [(WBSHistoricalHighLevelDomainsProvider *)v15->_historyHighLevelDomainsProvider performBlockAfterHistoryHasLoaded:&__block_literal_global_48];
    objc_storeStrong((id *)&v15->_accountStore, a3);
    v21 = [[WBSPasswordAuditor alloc] initWithSavedAccountStore:v11 autoFillQuirksManager:v12];
    passwordAuditor = v15->_passwordAuditor;
    v15->_passwordAuditor = v21;

    objc_storeStrong((id *)&v15->_userDefaults, a5);
    v23 = objc_alloc_init(WBSPasswordWarningTopFraudTargetsManager);
    topFraudTargetsManager = v15->_topFraudTargetsManager;
    v15->_topFraudTargetsManager = v23;

    [(WBSPasswordWarningTopFraudTargetsManager *)v15->_topFraudTargetsManager getTopFraudTargetsWithCompletionHandler:&__block_literal_global_16_2];
    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cachedPasswordEvaluations = v15->_cachedPasswordEvaluations;
    v15->_cachedPasswordEvaluations = v25;

    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    inMemoryCachedPasswordEvaluations = v15->_inMemoryCachedPasswordEvaluations;
    v15->_inMemoryCachedPasswordEvaluations = v27;

    v29 = v15;
  }

  return v15;
}

- (void)dealloc
{
  [(WBSPasswordBreachHelperProxy *)self->_passwordBreachHelperProxy invalidate];
  v3.receiver = self;
  v3.super_class = (Class)WBSPasswordWarningManager;
  [(WBSPasswordWarningManager *)&v3 dealloc];
}

- (int64_t)numberOfNonHiddenWarningsWithSpecifiedPriority
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_cachedDataLock = &self->_cachedDataLock;
  os_unfair_lock_lock(&self->_cachedDataLock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = self->_cachedWarnings;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int64_t v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 += objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "hasBeenHidden", (void)v11) ^ 1;
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  else
  {
    int64_t v7 = 0;
  }

  os_unfair_lock_unlock(p_cachedDataLock);
  return v7;
}

- (void)preWarmWarningsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__WBSPasswordWarningManager_preWarmWarningsWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E615C700;
  id v7 = v4;
  id v5 = v4;
  [(WBSPasswordWarningManager *)self getAllWarningsForcingUpdate:1 completionHandler:v6];
}

uint64_t __66__WBSPasswordWarningManager_preWarmWarningsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)getAllWarningsForcingUpdate:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  dispatch_suspend((dispatch_object_t)self->_callbackQueue);
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke;
  block[3] = &unk_1E615A870;
  id v8 = v6;
  block[4] = self;
  id v62 = v8;
  dispatch_async(callbackQueue, block);
  os_unfair_lock_lock(&self->_cachedDataLock);
  if (self->_updateInProgress || !a3 && self->_cachedWarnings)
  {
    os_unfair_lock_unlock(&self->_cachedDataLock);
    dispatch_resume((dispatch_object_t)self->_callbackQueue);
  }
  else
  {
    BOOL v29 = a3;
    self->_updateInProgress = 1;
    os_unfair_lock_unlock(&self->_cachedDataLock);
    v9 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B728F000, v9, OS_LOG_TYPE_INFO, "Beginning password warning manager update.", buf, 2u);
    }
    v10 = dispatch_group_create();
    long long v11 = [(WBSSavedAccountStore *)self->_accountStore savedAccountsExcludingNeverSaveMarkerPasswords];
    v30 = objc_msgSend(v11, "safari_filterObjectsUsingBlock:", &__block_literal_global_24_0);

    if (self->_historyHighLevelDomainsProvider)
    {
      dispatch_group_enter(v10);
      historyHighLevelDomainsProvider = self->_historyHighLevelDomainsProvider;
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_2;
      v59[3] = &unk_1E615A768;
      v60 = v10;
      [(WBSHistoricalHighLevelDomainsProvider *)historyHighLevelDomainsProvider performBlockAfterHistoryHasLoaded:v59];
    }
    *(void *)buf = 0;
    v54 = buf;
    uint64_t v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__11;
    v57 = __Block_byref_object_dispose__11;
    id v58 = 0;
    dispatch_group_enter(v10);
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_25;
    v50[3] = &unk_1E615C748;
    v52 = buf;
    long long v13 = v10;
    v51 = v13;
    [(WBSPasswordWarningManager *)self _getBreachResultRecordsForPasswords:v30 startSessionIfNecessary:1 withCompletionHandler:v50];
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x3032000000;
    v48[3] = __Block_byref_object_copy__11;
    v48[4] = __Block_byref_object_dispose__11;
    id v49 = 0;
    dispatch_group_enter(v13);
    topFraudTargetsManager = self->_topFraudTargetsManager;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_2_27;
    v45[3] = &unk_1E615C770;
    v47 = v48;
    v15 = v13;
    v46 = v15;
    [(WBSPasswordWarningTopFraudTargetsManager *)topFraudTargetsManager getTopFraudTargetsWithCompletionHandler:v45];
    if (self->_shouldInitializePasswordEvaluationCache)
    {
      self->_shouldInitializePasswordEvaluationCache = 0;
      dispatch_group_enter(v15);
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      dispatch_queue_t v17 = [(WBSSavedAccountStore *)self->_accountStore savedAccountsWithPasswords];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v63 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v42 != v19) {
              objc_enumerationMutation(v17);
            }
            uint64_t v21 = *(void *)(*((void *)&v41 + 1) + 8 * i);
            v22 = [(WBSSavedAccountStore *)self->_accountStore persistentIdentifierForSavedAccount:v21];
            if (v22) {
              [v16 setObject:v21 forKeyedSubscript:v22];
            }
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v63 count:16];
        }
        while (v18);
      }

      v23 = [(WBSPasswordWarningManager *)self _passwordBreachHelperProxy];
      v24 = [v16 allKeys];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_3;
      v37[3] = &unk_1E615C798;
      id v25 = v16;
      id v38 = v25;
      v39 = self;
      v40 = v15;
      [v23 getPasswordEvaluationsForPersistentIdentifiers:v24 completionHandler:v37];
    }
    workQueue = self->_workQueue;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_4;
    v31[3] = &unk_1E615C7E8;
    BOOL v36 = v29;
    v31[4] = self;
    id v32 = v30;
    v33 = v15;
    v34 = buf;
    v35 = v48;
    v27 = v15;
    id v28 = v30;
    dispatch_group_notify(v27, workQueue, v31);

    _Block_object_dispose(v48, 8);
    _Block_object_dispose(buf, 8);
  }
}

void __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 96));
    v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 104) copy];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 96));
    objc_super v3 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1B728F000, v3, OS_LOG_TYPE_INFO, "Calling back.", v4, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_21(uint64_t a1, void *a2)
{
  return [a2 canUserEditSavedAccount];
}

void __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_2(uint64_t a1)
{
}

void __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_25(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_2_27(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = objc_msgSend(v3, "allKeys", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          long long v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
          long long v12 = [v11 password];
          if (v12)
          {
            long long v13 = [v4 objectForKeyedSubscript:v10];
            long long v14 = [v13 passwordEvaluationWithPassword:v12];

            if (v14) {
              [*(id *)(*(void *)(a1 + 40) + 120) setObject:v14 forKeyedSubscript:v12];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 88);
    *(void *)(v2 + 88) = 0;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_5;
  v13[3] = &unk_1E615C7C0;
  id v4 = *(void **)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  long long v14 = *(_OWORD *)(a1 + 56);
  id v5 = objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", v13);
  [*(id *)(a1 + 32) _writePasswordEvaluationsToCache];
  uint64_t v6 = *(NSObject **)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 8);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_6;
  v10[3] = &unk_1E615BBB8;
  v10[4] = v7;
  id v11 = v5;
  uint64_t v12 = *(void *)(a1 + 64);
  id v9 = v5;
  dispatch_group_notify(v6, v8, v10);
}

id __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v4 = a2;
  id v5 = [v3 objectForKey:v4];
  uint64_t v6 = [*(id *)(a1 + 32) _scoredWarningForSavedAccount:v4 topFraudTargets:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) breachResultRecord:v5];

  return v6;
}

void __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) _scoreWarnings:*(void *)(a1 + 40) topFraudTargets:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v2 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  [*(id *)(a1 + 32) _sortWarningsBySeverity:*(void *)(a1 + 40) intoHighPriorityBucket:v3 intoStandardPriorityBucket:v4 unspecifiedSeverityBucket:v5 savedAccountMap:v2 highPriorityWarningHashes:v6];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 96));
  uint64_t v7 = [v3 arrayByAddingObjectsFromArray:v4];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 104);
  *(void *)(v8 + 104) = v7;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), v2);
  *(unsigned char *)(*(void *)(a1 + 32) + 100) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 96));
  [*(id *)(a1 + 32) _updateUserDefaultsWithWarningHashes:v6];
  uint64_t v10 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_1B728F000, v10, OS_LOG_TYPE_INFO, "Password warning manager update complete.", v11, 2u);
  }
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
}

- (void)getWarningForSavedAccount:(id)a3 completionHandler:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v14[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__WBSPasswordWarningManager_getWarningForSavedAccount_completionHandler___block_invoke;
  v11[3] = &unk_1E615C860;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(WBSPasswordWarningManager *)self _getBreachResultRecordsForPasswords:v8 startSessionIfNecessary:0 withCompletionHandler:v11];
}

void __73__WBSPasswordWarningManager_getWarningForSavedAccount_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 64);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__WBSPasswordWarningManager_getWarningForSavedAccount_completionHandler___block_invoke_2;
  v7[3] = &unk_1E615C838;
  v7[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = *(id *)(a1 + 48);
  id v6 = v3;
  [v5 getTopFraudTargetsWithCompletionHandler:v7];
}

void __73__WBSPasswordWarningManager_getWarningForSavedAccount_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__WBSPasswordWarningManager_getWarningForSavedAccount_completionHandler___block_invoke_3;
  block[3] = &unk_1E615C810;
  block[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v6 = v3;
  dispatch_async(v5, block);
}

void __73__WBSPasswordWarningManager_getWarningForSavedAccount_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 56) objectForKey:v3];
  id v6 = [v2 _scoredWarningForSavedAccount:v3 topFraudTargets:v4 breachResultRecord:v5];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)removeWarningForSavedAccount:(id)a3
{
  p_cachedDataLock = &self->_cachedDataLock;
  id v5 = a3;
  os_unfair_lock_lock(p_cachedDataLock);
  id v12 = [(NSMapTable *)self->_cachedWarningsForSavedAccounts objectForKey:v5];
  id v6 = (void *)[(NSMapTable *)self->_cachedWarningsForSavedAccounts mutableCopy];
  [v6 removeObjectForKey:v5];

  id v7 = (NSMapTable *)[v6 copy];
  cachedWarningsForSavedAccounts = self->_cachedWarningsForSavedAccounts;
  self->_cachedWarningsForSavedAccounts = v7;

  id v9 = (void *)[(NSArray *)self->_cachedWarnings mutableCopy];
  [v9 removeObject:v12];
  id v10 = (NSArray *)[v9 copy];
  cachedWarnings = self->_cachedWarnings;
  self->_cachedWarnings = v10;

  os_unfair_lock_unlock(p_cachedDataLock);
}

- (BOOL)hasUnacknowledgedHighPriorityWarnings
{
  uint64_t v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"lastPasswordWarningManagerUpdateHasNewWarnings"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)acknowledgeHighPriorityWarnings
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 56);
  char v3 = a2;
  uint64_t v4 = [v2 arrayForKey:@"lastPasswordWarningManagerUpdateHashes"];
  int v5 = 134217984;
  uint64_t v6 = [v4 count];
  _os_log_debug_impl(&dword_1B728F000, v3, OS_LOG_TYPE_DEBUG, "Acknowledging %lu existing warnings.", (uint8_t *)&v5, 0xCu);
}

- (WBSPasswordEvaluator)passwordEvaluator
{
  p_passwordEvaluatorLock = &self->_passwordEvaluatorLock;
  os_unfair_lock_lock(&self->_passwordEvaluatorLock);
  if (!self->_passwordEvaluator)
  {
    uint64_t v4 = +[WBSPasswordEvaluator standardPasswordEvaluator];
    passwordEvaluator = self->_passwordEvaluator;
    self->_passwordEvaluator = v4;
  }
  os_unfair_lock_unlock(p_passwordEvaluatorLock);
  uint64_t v6 = self->_passwordEvaluator;
  return v6;
}

- (id)_warningForSavedAccount:(id)a3 breachResultRecord:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 password];
  id v9 = [(NSMutableDictionary *)self->_cachedPasswordEvaluations objectForKeyedSubscript:v8];
  if (!v9)
  {
    id v9 = [(NSMutableDictionary *)self->_inMemoryCachedPasswordEvaluations objectForKeyedSubscript:v8];
    if (!v9)
    {
      id v10 = [(WBSPasswordWarningManager *)self passwordEvaluator];
      id v9 = [v10 evaluatePassword:v8];

      if (v8) {
        [(NSMutableDictionary *)self->_inMemoryCachedPasswordEvaluations setObject:v9 forKeyedSubscript:v8];
      }
    }
  }
  id v11 = [(WBSPasswordAuditor *)self->_passwordAuditor savedAccountsWithDuplicatedPassword:v7];
  id v12 = objc_msgSend(v11, "safari_mapObjectsUsingBlock:", &__block_literal_global_36);
  unint64_t v13 = -[WBSPasswordWarningManager _issuesForPassword:withWeakPasswordEvaluation:passwordIsReused:breachResultRecord:](self, "_issuesForPassword:withWeakPasswordEvaluation:passwordIsReused:breachResultRecord:", v7, v9, [v11 count] != 0, v6);

  accountStore = self->_accountStore;
  long long v15 = [v7 highLevelDomain];
  BOOL v16 = [(WBSSavedAccountStore *)accountStore numberOfSavedAccountsInPersonalKeychainForHighLevelDomain:v15] == 1;

  long long v17 = [[WBSPasswordWarning alloc] initWithSavedAccount:v7 issueTypes:v13 weakPasswordEvaluation:v9 titlesOfSavedAccountsWithReusedPassword:v12 savedAccountIsOnlySavedAccountForHighLevelDomain:v16];
  return v17;
}

id __72__WBSPasswordWarningManager__warningForSavedAccount_breachResultRecord___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 hasValidWebsite])
  {
    char v3 = [v2 effectiveTitle];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (id)_scoredWarningForSavedAccount:(id)a3 topFraudTargets:(id)a4 breachResultRecord:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(WBSPasswordWarningManager *)self _warningForSavedAccount:v9 breachResultRecord:a5];
  int64_t v11 = -[WBSPasswordWarningManager _scoreForSavedAccount:issueTypes:topFraudTargets:](self, "_scoreForSavedAccount:issueTypes:topFraudTargets:", v9, [v10 issueTypes], v8);

  [v10 setSeverityScore:v11];
  return v10;
}

- (unint64_t)_issuesForPassword:(id)a3 withWeakPasswordEvaluation:(id)a4 passwordIsReused:(BOOL)a5 breachResultRecord:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [v10 password];
  if ([v12 length] == 1 && (objc_msgSend(&unk_1F1086C90, "containsObject:", v12) & 1) != 0)
  {
    unint64_t v13 = 0;
  }
  else
  {
    int v14 = [v10 userShouldBeShownPassiveWarning];
    uint64_t v15 = 2;
    if (!v14) {
      uint64_t v15 = 0;
    }
    uint64_t v16 = v15 | v7;
    uint64_t v17 = [v11 result];
    uint64_t v18 = v16 | 4;
    if (v17 != 2) {
      uint64_t v18 = v16;
    }
    if (v17 == 3) {
      uint64_t v19 = v16 | 8;
    }
    else {
      uint64_t v19 = v18;
    }
    uint64_t v20 = [v9 formerlySharedPasswordMarker];

    if (v20) {
      v19 |= 0x10uLL;
    }
    uint64_t v21 = [v9 formerlySharedPasskeyMarker];

    if (v21) {
      unint64_t v13 = v19 | 0x20;
    }
    else {
      unint64_t v13 = v19;
    }
  }

  return v13;
}

- (int64_t)_scoreForSavedAccount:(id)a3 issueTypes:(unint64_t)a4 topFraudTargets:(id)a5
{
  char v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v8)
  {
    id v11 = [v9 highPriorityFraudTargets];
    id v12 = [v8 highLevelDomain];
    char v13 = [v11 containsObject:v12];

    if ((v13 & 1) != 0
      || ([v10 financialFraudTargets],
          int v14 = objc_claimAutoreleasedReturnValue(),
          [v8 highLevelDomain],
          uint64_t v15 = objc_claimAutoreleasedReturnValue(),
          char v16 = [v14 containsObject:v15],
          v15,
          v14,
          (v16 & 1) != 0))
    {
      uint64_t v17 = 10;
    }
    else
    {
      uint64_t v19 = [v10 fraudTargets];
      uint64_t v20 = [v8 highLevelDomain];
      int v21 = [v19 containsObject:v20];

      if (v21) {
        uint64_t v17 = 6;
      }
      else {
        uint64_t v17 = 0;
      }
    }
    v22 = [v8 highLevelDomain];
    BOOL v23 = [(WBSPasswordWarningManager *)self _historyContainsItemForDomain:v22];

    int64_t v24 = v17 | v23;
    if ((v6 & 8) != 0) {
      v24 += 12;
    }
    if ((v6 & 4) != 0) {
      v24 += 11;
    }
    if ((v6 & 2) != 0) {
      v24 += 3;
    }
    if (v6) {
      v24 += 2;
    }
    if ((v6 & 0x30) != 0) {
      int64_t v18 = v24 + 10;
    }
    else {
      int64_t v18 = v24;
    }
  }
  else
  {
    int64_t v18 = 0;
  }

  return v18;
}

- (BOOL)_historyContainsItemForDomain:(id)a3
{
  id v4 = a3;
  historyHighLevelDomains = self->_historyHighLevelDomains;
  if (!historyHighLevelDomains)
  {
    historyHighLevelDomainsProvider = self->_historyHighLevelDomainsProvider;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__WBSPasswordWarningManager__historyContainsItemForDomain___block_invoke;
    v9[3] = &unk_1E615C8A8;
    v9[4] = self;
    [(WBSHistoricalHighLevelDomainsProvider *)historyHighLevelDomainsProvider fetchHistoricalHighLevelDomainsWithCompletionHandler:v9];
    historyHighLevelDomains = self->_historyHighLevelDomains;
  }
  BOOL v7 = [(NSSet *)historyHighLevelDomains containsObject:v4];

  return v7;
}

void __59__WBSPasswordWarningManager__historyContainsItemForDomain___block_invoke(uint64_t a1, void *a2)
{
}

- (id)_passwordBreachHelperProxy
{
  passwordBreachHelperProxy = self->_passwordBreachHelperProxy;
  if (!passwordBreachHelperProxy)
  {
    id v4 = objc_alloc_init(WBSPasswordBreachHelperProxy);
    int v5 = self->_passwordBreachHelperProxy;
    self->_passwordBreachHelperProxy = v4;

    passwordBreachHelperProxy = self->_passwordBreachHelperProxy;
  }
  return passwordBreachHelperProxy;
}

- (void)_getBreachResultRecordsForPasswords:(id)a3 startSessionIfNecessary:(BOOL)a4 withCompletionHandler:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v29 = a5;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = v6;
  uint64_t v34 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v34)
  {
    id v32 = 0;
    uint64_t v33 = *(void *)v44;
    uint64_t v30 = *MEMORY[0x1E4F28798];
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v44 != v33) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        id v11 = [v10 persistentIdentifiersForWarningManager];
        uint64_t v12 = [v11 count];

        if (v12)
        {
          uint64_t v35 = i;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          char v13 = [v10 persistentIdentifiersForWarningManager];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v40;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v40 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void *)(*((void *)&v39 + 1) + 8 * j);
                [v7 setObject:v10 forKeyedSubscript:v18];
                uint64_t v19 = [WBSPasswordBreachResultQuery alloc];
                uint64_t v20 = [v10 lastModifiedDate];
                int v21 = [(WBSPasswordBreachResultQuery *)v19 initWithPersistentIdentifier:v18 dateLastModified:v20];

                [v8 addObject:v21];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v47 count:16];
            }
            while (v15);
          }

          uint64_t i = v35;
        }
        else
        {
          v22 = objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", v30, 14, @"Couldn't find persistent identifier for saved password.");

          BOOL v23 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            -[WBSPasswordWarningManager _getBreachResultRecordsForPasswords:startSessionIfNecessary:withCompletionHandler:](v48, v23, v22, &v49);
          }
          id v32 = v22;
        }
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
    }
    while (v34);
  }
  else
  {
    id v32 = 0;
  }

  int64_t v24 = +[WBSPasswordBreachResultQuery dictionaryRepresentationsForResultQueries:v8];
  id v25 = [(WBSPasswordWarningManager *)self _passwordBreachHelperProxy];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __111__WBSPasswordWarningManager__getBreachResultRecordsForPasswords_startSessionIfNecessary_withCompletionHandler___block_invoke;
  v36[3] = &unk_1E615C8D0;
  id v37 = v7;
  id v38 = v29;
  id v26 = v7;
  id v27 = v29;
  [v25 getResultRecordDictionariesForResultQueryDictionaries:v24 withCompletionHandler:v36];
  [v25 runLookupSessionIgnoringMinimumDelay:0 completionHandler:&__block_literal_global_58_0];
}

void __111__WBSPasswordWarningManager__getBreachResultRecordsForPasswords_startSessionIfNecessary_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    id v17 = v3;
    id v4 = +[WBSPasswordBreachResultRecord resultRecordsFromDictionaryRepresentations:v3];
    int v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v12 = [v11 persistentIdentifier];
          char v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];
          if (v13)
          {
            [v5 setObject:v11 forKey:v13];
          }
          else
          {
            uint64_t v14 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              __111__WBSPasswordWarningManager__getBreachResultRecordsForPasswords_startSessionIfNecessary_withCompletionHandler___block_invoke_cold_2(&buf, v19, v14);
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v3 = v17;
  }
  else
  {
    uint64_t v15 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __111__WBSPasswordWarningManager__getBreachResultRecordsForPasswords_startSessionIfNecessary_withCompletionHandler___block_invoke_cold_1(v15);
    }
    uint64_t v16 = *(void *)(a1 + 40);
    id v6 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v6);
  }
}

void __111__WBSPasswordWarningManager__getBreachResultRecordsForPasswords_startSessionIfNecessary_withCompletionHandler___block_invoke_56()
{
  v0 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B728F000, v0, OS_LOG_TYPE_INFO, "Lookup session request completed.", v1, 2u);
  }
}

- (void)_scoreWarnings:(id)a3 topFraudTargets:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        char v13 = [v12 savedAccount];
        objc_msgSend(v12, "setSeverityScore:", -[WBSPasswordWarningManager _scoreForSavedAccount:issueTypes:topFraudTargets:](self, "_scoreForSavedAccount:issueTypes:topFraudTargets:", v13, objc_msgSend(v12, "issueTypes"), v7));
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)_sortWarningsBySeverity:(id)a3 intoHighPriorityBucket:(id)a4 intoStandardPriorityBucket:(id)a5 unspecifiedSeverityBucket:(id)a6 savedAccountMap:(id)a7 highPriorityWarningHashes:(id)a8
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v27 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v18 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v13);
        }
        long long v22 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        long long v23 = [v22 savedAccount];
        [v16 setObject:v22 forKey:v23];

        uint64_t v24 = [v22 severity];
        if (v24 == 2)
        {
          uint64_t v25 = v14;
        }
        else
        {
          if (v24 == 1)
          {
            [v27 addObject:v22];
            id v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "hashForUserAcknowlegement"));
            [v17 addObject:v26];

            continue;
          }
          if (v24) {
            continue;
          }
          uint64_t v25 = v15;
        }
        [v25 addObject:v22];
      }
      uint64_t v19 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v19);
  }
}

- (void)_updateUserDefaultsWithWarningHashes:(id)a3
{
  id v4 = a3;
  int v5 = [(NSUserDefaults *)self->_userDefaults arrayForKey:@"lastPasswordWarningManagerUpdateHashes"];
  userDefaults = self->_userDefaults;
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  [(NSUserDefaults *)userDefaults safari_setDate:v7 forKey:@"lastPasswordWarningManagerUpdate"];

  [(NSUserDefaults *)self->_userDefaults setObject:v4 forKey:@"lastPasswordWarningManagerUpdateHashes"];
  unint64_t v8 = [v4 count];
  if (v8 <= [v5 count])
  {
    uint64_t v10 = [v4 count];
    if (v10 == [v5 count]) {
      uint64_t v9 = [v4 isEqualToArray:v5] ^ 1;
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }
  id v11 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    [(WBSPasswordWarningManager *)v11 _updateUserDefaultsWithWarningHashes:v5];
  }
  BOOL v12 = [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"lastPasswordWarningManagerUpdateHasNewWarnings"];
  id v13 = WBS_LOG_CHANNEL_PREFIXPasswords();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v14) {
      -[WBSPasswordWarningManager _updateUserDefaultsWithWarningHashes:](v13);
    }
  }
  else
  {
    if (v14) {
      -[WBSPasswordWarningManager _updateUserDefaultsWithWarningHashes:](v9, v13);
    }
    [(NSUserDefaults *)self->_userDefaults setBool:v9 forKey:@"lastPasswordWarningManagerUpdateHasNewWarnings"];
  }
}

- (BOOL)savedAccountsFromGroup:(id)a3 containsPasswordFromSavedAccount:(id)a4
{
  return [(WBSPasswordAuditor *)self->_passwordAuditor savedAccount:a4 reusesPasswordWithAccountInSavedAccounts:a3];
}

- (void)_writePasswordEvaluationsToCache
{
  if ([(NSMutableDictionary *)self->_inMemoryCachedPasswordEvaluations count]
    && [(NSMutableDictionary *)self->_cachedPasswordEvaluations count])
  {
    [(NSMutableDictionary *)self->_cachedPasswordEvaluations addEntriesFromDictionary:self->_inMemoryCachedPasswordEvaluations];
    [(NSMutableDictionary *)self->_inMemoryCachedPasswordEvaluations removeAllObjects];
    passwordBreachHelperProxy = self->_passwordBreachHelperProxy;
    cachedPasswordEvaluations = self->_cachedPasswordEvaluations;
    [(WBSPasswordBreachHelperProxy *)passwordBreachHelperProxy writePasswordEvaluationsToCache:cachedPasswordEvaluations completionHandler:&__block_literal_global_65];
  }
}

void __61__WBSPasswordWarningManager__writePasswordEvaluationsToCache__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v2 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __61__WBSPasswordWarningManager__writePasswordEvaluationsToCache__block_invoke_cold_1(v2);
    }
  }
}

- (WBSPasswordAuditor)passwordAuditor
{
  return self->_passwordAuditor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inMemoryCachedPasswordEvaluations, 0);
  objc_storeStrong((id *)&self->_cachedPasswordEvaluations, 0);
  objc_storeStrong((id *)&self->_cachedWarningsForSavedAccounts, 0);
  objc_storeStrong((id *)&self->_cachedWarnings, 0);
  objc_storeStrong((id *)&self->_historyHighLevelDomains, 0);
  objc_storeStrong((id *)&self->_historyHighLevelDomainsProvider, 0);
  objc_storeStrong((id *)&self->_passwordBreachHelperProxy, 0);
  objc_storeStrong((id *)&self->_topFraudTargetsManager, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_passwordAuditor, 0);
  objc_storeStrong((id *)&self->_passwordEvaluator, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)_getBreachResultRecordsForPasswords:(void *)a3 startSessionIfNecessary:(uint64_t *)a4 withCompletionHandler:.cold.1(uint8_t *a1, void *a2, void *a3, uint64_t *a4)
{
  id v7 = a2;
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  id v8 = objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 UTF8String];
  *(_DWORD *)a1 = 136315138;
  *a4 = v9;
  _os_log_error_impl(&dword_1B728F000, v7, OS_LOG_TYPE_ERROR, "%s", a1, 0xCu);
}

void __111__WBSPasswordWarningManager__getBreachResultRecordsForPasswords_startSessionIfNecessary_withCompletionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Recieved no results for password breach helper query.", v1, 2u);
}

void __111__WBSPasswordWarningManager__getBreachResultRecordsForPasswords_startSessionIfNecessary_withCompletionHandler___block_invoke_cold_2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Recieved result for query we didn't request.", buf, 2u);
}

- (void)_updateUserDefaultsWithWarningHashes:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B728F000, log, OS_LOG_TYPE_DEBUG, "Previous update raised new warnings that have not yet been acknowledged. Leaving flag as-is.", v1, 2u);
}

- (void)_updateUserDefaultsWithWarningHashes:(char)a1 .cold.2(char a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = "does not have";
  if (a1) {
    id v2 = "has";
  }
  int v3 = 136315138;
  id v4 = v2;
  _os_log_debug_impl(&dword_1B728F000, a2, OS_LOG_TYPE_DEBUG, "User %s new warnings.", (uint8_t *)&v3, 0xCu);
}

- (void)_updateUserDefaultsWithWarningHashes:(void *)a3 .cold.3(void *a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a1;
  int v6 = 134218240;
  uint64_t v7 = [a2 count];
  __int16 v8 = 2048;
  uint64_t v9 = [a3 count];
  _os_log_debug_impl(&dword_1B728F000, v5, OS_LOG_TYPE_DEBUG, "Current update has %lu warnings. Previous update had %lu warnings.", (uint8_t *)&v6, 0x16u);
}

void __61__WBSPasswordWarningManager__writePasswordEvaluationsToCache__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Failed to write password evaluation cache to persistent store", v1, 2u);
}

@end