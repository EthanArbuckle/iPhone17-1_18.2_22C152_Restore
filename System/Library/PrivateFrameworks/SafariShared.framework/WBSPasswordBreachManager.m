@interface WBSPasswordBreachManager
+ (BOOL)isPasswordBreachDetectionOn;
+ (id)testableManagerWithTestCredentialSource:(id)a3 store:(id)a4 configuration:(id)a5;
+ (void)_getStandardContextWithCompletionHandler:(id)a3;
+ (void)getSharedManagerWithCompletionHandler:(id)a3;
+ (void)setPasswordBreachDetectionOn:(BOOL)a3;
- (BOOL)_canPerformSessionIgnoringMinimumDelay:(BOOL)a3;
- (WBSPasswordBreachManager)initWithContext:(id)a3 credentialSource:(id)a4;
- (id)_checker;
- (id)recentlyBreachedResultRecords;
- (id)recentlyBreachedSavedAccounts;
- (id)resultRecordsForQueries:(id)a3;
- (void)_addRecentlyBreachedNotificationIfNecessaryWithCompletionHandler:(id)a3;
- (void)_completeSessionWithResults:(id)a3 completionHandler:(id)a4;
- (void)_showActiveWarningsIfNecessaryWithInitialBagFillState:(int64_t)a3 completionHandler:(id)a4;
- (void)addResultRecords:(id)a3;
- (void)clearAllRecordsWithCompletionHandler:(id)a3;
- (void)clearRecentlyBreachedResultRecords;
- (void)getPasswordEvaluationsForPersistentIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)performNextSessionLookupIgnoringMinimumDelay:(BOOL)a3 completionHandler:(id)a4;
- (void)writePasswordEvaluationsToStore:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSPasswordBreachManager

+ (BOOL)isPasswordBreachDetectionOn
{
  return [MEMORY[0x1E4F97F38] isPasswordBreachDetectionEnabled];
}

+ (void)setPasswordBreachDetectionOn:(BOOL)a3
{
}

- (WBSPasswordBreachManager)initWithContext:(id)a3 credentialSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSPasswordBreachManager;
  v9 = [(WBSPasswordBreachManager *)&v15 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_credentialSource, a4);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F97F30]) initWithContext:v10->_context];
    results = v10->_results;
    v10->_results = (WBSPasswordBreachResults *)v11;

    v13 = v10;
  }

  return v10;
}

- (id)_checker
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_bagManager)
  {
    v4 = (WBSPasswordBreachQueuedPasswordBagManager *)[objc_alloc(MEMORY[0x1E4F97F18]) initWithContext:self->_context results:self->_results passwordSource:self->_credentialSource];
    bagManager = self->_bagManager;
    self->_bagManager = v4;
  }
  if (!self->_checker)
  {
    v6 = (WBSPasswordBreachChecker *)[objc_alloc(MEMORY[0x1E4F97EE8]) initWithContext:self->_context bagManager:self->_bagManager];
    checker = self->_checker;
    self->_checker = v6;
  }
  os_unfair_lock_unlock(p_lock);
  id v8 = self->_checker;
  return v8;
}

- (id)resultRecordsForQueries:(id)a3
{
  return (id)[(WBSPasswordBreachResults *)self->_results resultRecordsForQueries:a3];
}

+ (void)_getStandardContextWithCompletionHandler:(id)a3
{
  id v3 = a3;
  if (!_getStandardContextWithCompletionHandler__configurationBagLoader)
  {
    v4 = objc_alloc_init(WBSPasswordBreachConfigurationBagLoader);
    v5 = (void *)_getStandardContextWithCompletionHandler__configurationBagLoader;
    _getStandardContextWithCompletionHandler__configurationBagLoader = (uint64_t)v4;
  }
  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = objc_msgSend(v6, "safari_settingsDirectoryURL");
  id v8 = [v7 URLByAppendingPathComponent:@"PasswordBreachStore.plist" isDirectory:0];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F97F40]) initWithBackingStoreURL:v8];
  v10 = (void *)_getStandardContextWithCompletionHandler__configurationBagLoader;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__WBSPasswordBreachManager__getStandardContextWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E5C9E6E8;
  id v14 = v9;
  id v15 = v3;
  id v11 = v3;
  id v12 = v9;
  [v10 getConfigurationBagWithCompletionHandler:v13];
}

void __69__WBSPasswordBreachManager__getStandardContextWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "firstConfigurationForSupportedProtocolVersion:rampIdentifier:allowValuesForTesting:", 1, objc_msgSend(v3, "rampIdentifier"), 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F97F00]) initWithConfiguration:v6 store:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) saveAndCloseStoreSynchronously];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (void)getSharedManagerWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  os_unfair_lock_lock((os_unfair_lock_t)&getSharedManagerWithCompletionHandler__sharedLock);
  id v5 = (id)getSharedManagerWithCompletionHandler__sharedBreachManager;
  os_unfair_lock_unlock((os_unfair_lock_t)&getSharedManagerWithCompletionHandler__sharedLock);
  if (v5)
  {
    v4[2](v4, v5);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__WBSPasswordBreachManager_getSharedManagerWithCompletionHandler___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (getSharedManagerWithCompletionHandler__onceToken != -1) {
      dispatch_once(&getSharedManagerWithCompletionHandler__onceToken, block);
    }
    id v6 = getSharedManagerWithCompletionHandler__accessQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __66__WBSPasswordBreachManager_getSharedManagerWithCompletionHandler___block_invoke_5;
    v7[3] = &unk_1E5C8CDC8;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
}

void __66__WBSPasswordBreachManager_getSharedManagerWithCompletionHandler___block_invoke(uint64_t a1)
{
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.SafariShared.WBSPasswordBreachManager.sharedInstanceQueue", 0);
  id v3 = (void *)getSharedManagerWithCompletionHandler__accessQueue;
  getSharedManagerWithCompletionHandler__accessQueue = (uint64_t)v2;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__WBSPasswordBreachManager_getSharedManagerWithCompletionHandler___block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)getSharedManagerWithCompletionHandler__accessQueue, block);
}

void __66__WBSPasswordBreachManager_getSharedManagerWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_block_t v2 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &__block_literal_global_87);
  id v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__WBSPasswordBreachManager_getSharedManagerWithCompletionHandler___block_invoke_4;
  v5[3] = &unk_1E5C9E710;
  id v6 = v2;
  id v4 = v2;
  [v3 _getStandardContextWithCompletionHandler:v5];
  dispatch_block_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __66__WBSPasswordBreachManager_getSharedManagerWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = objc_alloc_init(WBSPasswordBreachKeychainCredentialSource);
    id v5 = [[WBSPasswordBreachManager alloc] initWithContext:v3 credentialSource:v4];

    os_unfair_lock_lock((os_unfair_lock_t)&getSharedManagerWithCompletionHandler__sharedLock);
    id v6 = (void *)getSharedManagerWithCompletionHandler__sharedBreachManager;
    getSharedManagerWithCompletionHandler__sharedBreachManager = (uint64_t)v5;

    os_unfair_lock_unlock((os_unfair_lock_t)&getSharedManagerWithCompletionHandler__sharedLock);
  }
  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v7();
}

void __66__WBSPasswordBreachManager_getSharedManagerWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__WBSPasswordBreachManager_getSharedManagerWithCompletionHandler___block_invoke_6;
  block[3] = &unk_1E5C8CDC8;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __66__WBSPasswordBreachManager_getSharedManagerWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)testableManagerWithTestCredentialSource:(id)a3 store:(id)a4 configuration:(id)a5
{
  id v7 = (objc_class *)MEMORY[0x1E4F97F00];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[[v7 alloc] initWithConfiguration:v8 store:v9];

  id v12 = [[WBSPasswordBreachManager alloc] initWithContext:v11 credentialSource:v10];
  return v12;
}

- (void)performNextSessionLookupIgnoringMinimumDelay:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void))a4;
  if (!+[WBSPasswordBreachManager isPasswordBreachDetectionOn])
  {
    id v10 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6B5F000, v10, OS_LOG_TYPE_INFO, "Refusing to start lookup session: Breach detection is turned off.", buf, 2u);
    }
    goto LABEL_13;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_sessionTransaction)
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v9 = "Refusing to start lookup session: Session is already running.";
LABEL_11:
      _os_log_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_INFO, v9, buf, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (![(WBSPasswordBreachManager *)self _canPerformSessionIgnoringMinimumDelay:v4])
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v9 = "Refusing to start lookup session: The minimum delay between sessions has not elapsed.";
      goto LABEL_11;
    }
LABEL_12:
    os_unfair_lock_unlock(p_lock);
LABEL_13:
    v6[2](v6, MEMORY[0x1E4F1CC08]);
    goto LABEL_14;
  }
  id v11 = (OS_os_transaction *)os_transaction_create();
  sessionTransaction = self->_sessionTransaction;
  self->_sessionTransaction = v11;

  os_unfair_lock_unlock(&self->_lock);
  v13 = [(WBSPasswordBreachManager *)self _checker];
  uint64_t v14 = [(WBSPasswordBreachQueuedPasswordBagManager *)self->_bagManager fillState];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__WBSPasswordBreachManager_performNextSessionLookupIgnoringMinimumDelay_completionHandler___block_invoke;
  v15[3] = &unk_1E5C9E738;
  v15[4] = self;
  uint64_t v17 = v14;
  v16 = v6;
  [v13 checkPasswordBatchesWithCompletionHandler:v15];

LABEL_14:
}

void __91__WBSPasswordBreachManager_performNextSessionLookupIgnoringMinimumDelay_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__WBSPasswordBreachManager_performNextSessionLookupIgnoringMinimumDelay_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5C8C8F8;
  void v7[4] = v4;
  id v8 = v3;
  uint64_t v5 = *(void *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  id v6 = v3;
  [v4 _showActiveWarningsIfNecessaryWithInitialBagFillState:v5 completionHandler:v7];
}

uint64_t __91__WBSPasswordBreachManager_performNextSessionLookupIgnoringMinimumDelay_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeSessionWithResults:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_showActiveWarningsIfNecessaryWithInitialBagFillState:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(WBSPasswordBreachQueuedPasswordBagManager *)self->_bagManager fillState];
  if (a3 != 2 && v7 == 2) {
    [(WBSPasswordBreachResults *)self->_results markAllCompromisedResultRecordsAsRecentlyBreached];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __100__WBSPasswordBreachManager__showActiveWarningsIfNecessaryWithInitialBagFillState_completionHandler___block_invoke;
  v9[3] = &unk_1E5C8CDC8;
  id v10 = v6;
  id v8 = v6;
  [(WBSPasswordBreachManager *)self _addRecentlyBreachedNotificationIfNecessaryWithCompletionHandler:v9];
}

uint64_t __100__WBSPasswordBreachManager__showActiveWarningsIfNecessaryWithInitialBagFillState_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_canPerformSessionIgnoringMinimumDelay:(BOOL)a3
{
  if (a3) {
    return 1;
  }
  uint64_t v5 = [(WBSPasswordBreachContext *)self->_context store];
  id v6 = [v5 lastSessionCompletionDate];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
    [v7 timeIntervalSinceDate:v6];
    double v9 = v8;
    id v10 = [(WBSPasswordBreachContext *)self->_context configuration];
    [v10 minimumDelayBetweenSessions];
    BOOL v3 = v9 > v11;
  }
  else
  {
    BOOL v3 = 1;
  }

  return v3;
}

- (void)_completeSessionWithResults:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  context = self->_context;
  double v8 = (void (**)(id, id))a4;
  double v9 = [(WBSPasswordBreachContext *)context store];
  [(WBSPasswordBreachQueuedPasswordBagManager *)self->_bagManager saveBagToStore];
  if ([v6 count])
  {
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    [v9 setLastSessionCompletionDate:v10];
  }
  [v9 saveStoreSynchronously];
  os_unfair_lock_lock(&self->_lock);
  sessionTransaction = self->_sessionTransaction;
  self->_sessionTransaction = 0;

  os_unfair_lock_unlock(&self->_lock);
  id v12 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1A6B5F000, v12, OS_LOG_TYPE_INFO, "Lookup session completed.", v13, 2u);
  }
  v8[2](v8, v6);
}

- (void)_addRecentlyBreachedNotificationIfNecessaryWithCompletionHandler:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  uint64_t v5 = [(WBSPasswordBreachManager *)self recentlyBreachedSavedAccounts];
  if ([v5 count])
  {
    id v6 = objc_alloc_init(WBSPasswordBreachNotificationManager);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __93__WBSPasswordBreachManager__addRecentlyBreachedNotificationIfNecessaryWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E5C8DC00;
    void v7[4] = self;
    double v8 = v4;
    [(WBSPasswordBreachNotificationManager *)v6 addBreachNotificationForSavedAccounts:v5 withCompletionHandler:v7];
  }
  else
  {
    v4[2](v4);
  }
}

void __93__WBSPasswordBreachManager__addRecentlyBreachedNotificationIfNecessaryWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __93__WBSPasswordBreachManager__addRecentlyBreachedNotificationIfNecessaryWithCompletionHandler___block_invoke_cold_1(v4, v3);
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 48) clearRecentlyBreachedResultRecords];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)recentlyBreachedResultRecords
{
  return (id)[(WBSPasswordBreachResults *)self->_results recentlyBreachedResultRecords];
}

- (id)recentlyBreachedSavedAccounts
{
  id v3 = [(WBSPasswordBreachManager *)self recentlyBreachedResultRecords];
  if ([v3 count])
  {
    BOOL v4 = objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_21);
    uint64_t v5 = [(WBSPasswordBreachCredentialSource *)self->_credentialSource savedAccountsForPersistentIdentifiers:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __57__WBSPasswordBreachManager_recentlyBreachedSavedAccounts__block_invoke(uint64_t a1, void *a2)
{
  return [a2 persistentIdentifier];
}

- (void)clearRecentlyBreachedResultRecords
{
  [(WBSPasswordBreachResults *)self->_results clearRecentlyBreachedResultRecords];
  id v3 = [(WBSPasswordBreachContext *)self->_context store];
  [v3 saveStoreSynchronously];
}

- (void)clearAllRecordsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_get_global_queue(21, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__WBSPasswordBreachManager_clearAllRecordsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8CDF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __65__WBSPasswordBreachManager_clearAllRecordsWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) clearAllResultsSynchronously];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)addResultRecords:(id)a3
{
  [(WBSPasswordBreachResults *)self->_results addResultRecords:a3];
  id v4 = [(WBSPasswordBreachContext *)self->_context store];
  [v4 saveStoreSynchronously];

  [(WBSPasswordBreachManager *)self _showActiveWarningsIfNecessaryWithInitialBagFillState:2 completionHandler:&__block_literal_global_23_0];
}

- (void)getPasswordEvaluationsForPersistentIdentifiers:(id)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v22 = (void (**)(id, id))a4;
  uint64_t v5 = [(WBSPasswordBreachContext *)self->_context store];
  id v6 = [v5 passwordEvaluationResuts];

  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [v6 allKeys];
  uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    id v10 = (void *)*MEMORY[0x1E4F98140];
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * v11);
        v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v12 options:0];
        uint64_t v14 = [v6 objectForKeyedSubscript:v12];
        id v15 = (void *)[objc_alloc(MEMORY[0x1E4F97F50]) initWithDictionaryRepresentation:v14];
        v16 = v15;
        if (v15)
        {
          uint64_t v17 = [v15 versionNumber];
          [v17 doubleValue];
          double v19 = v18;
          [v10 doubleValue];
          double v21 = v20;

          if (v19 >= v21) {
            [v23 setObject:v16 forKeyedSubscript:v13];
          }
        }

        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  v22[2](v22, v23);
}

- (void)writePasswordEvaluationsToStore:(id)a3 completionHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  v22 = (void (**)(id, uint64_t))a4;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = [MEMORY[0x1E4F97FD0] sharedStore];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = [v5 savedAccountsWithPasswords];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    uint64_t v23 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v12 = [v5 persistentIdentifierForSavedAccount:v11];
        if (v12)
        {
          v13 = [v11 password];
          if ([v13 length])
          {
            uint64_t v14 = [v25 objectForKeyedSubscript:v13];
            if (v14)
            {
              id v15 = v5;
              v16 = (void *)[objc_alloc(MEMORY[0x1E4F97F50]) initWithPasswordEvaluation:v14];
              uint64_t v17 = [v16 dictionaryRepresentation];
              double v18 = [v12 base64EncodedStringWithOptions:0];
              [v24 setObject:v17 forKeyedSubscript:v18];

              uint64_t v5 = v15;
              uint64_t v9 = v23;
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }

  double v19 = [(WBSPasswordBreachContext *)self->_context store];
  [v19 setPasswordEvaluationResuts:v24];

  double v20 = [(WBSPasswordBreachContext *)self->_context store];
  [v20 saveStoreSynchronously];

  v22[2](v22, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagManager, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_checker, 0);
  objc_storeStrong((id *)&self->_credentialSource, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sessionTransaction, 0);
}

void __93__WBSPasswordBreachManager__addRecentlyBreachedNotificationIfNecessaryWithCompletionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_ERROR, "Failed to add notification for new breaches: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end