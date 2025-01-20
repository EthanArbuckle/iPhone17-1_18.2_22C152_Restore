@interface SPUISearchModelGeneral
- (BOOL)forceStableResults;
- (BOOL)infinitePatience;
- (BOOL)queryInProgress;
- (BOOL)shouldEnableOCR;
- (NSString)rankingDebugLog;
- (OS_dispatch_queue)workQueue;
- (SPClientSession)session;
- (SPUISearchModelGeneral)init;
- (int64_t)maxUISuggestions;
- (void)_setInfinitePatience:(BOOL)a3;
- (void)activate;
- (void)clear;
- (void)deactivate;
- (void)purgeMemory;
- (void)setForceStableResults:(BOOL)a3;
- (void)setInfinitePatience:(BOOL)a3;
- (void)setMaxUISuggestions:(int64_t)a3;
- (void)setSession:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)updateWithQueryContext:(id)a3;
- (void)updatesDisabled;
- (void)updatesEnabled;
@end

@implementation SPUISearchModelGeneral

- (void)activate
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__SPUISearchModelGeneral_activate__block_invoke;
  block[3] = &unk_264E90660;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)setMaxUISuggestions:(int64_t)a3
{
  id v4 = [(SPUISearchModelGeneral *)self session];
  [v4 setMaxUISuggestions:a3];
}

id __34__SPUISearchModelGeneral_activate__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) session];
  [v2 activate];

  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)SPUISearchModelGeneral;
  return objc_msgSendSuper2(&v4, sel_activate);
}

- (SPClientSession)session
{
  return (SPClientSession *)objc_getProperty(self, a2, 72, 1);
}

void __30__SPUISearchModelGeneral_init__block_invoke()
{
  v0 = [MEMORY[0x263F78D00] sharedResourcesManager];
  [v0 loadAllParametersForClient:@"Spotlight"];

  v1 = [MEMORY[0x263F78D00] sharedResourcesManager];
  [v1 loadAllParametersForClient:@"SpotlightKnowledge"];

  id v2 = [MEMORY[0x263F78D00] sharedResourcesManager];
  [v2 loadAllParametersForClient:@"Mail"];
}

- (SPUISearchModelGeneral)init
{
  v10.receiver = self;
  v10.super_class = (Class)SPUISearchModelGeneral;
  id v2 = [(SPUISearchModelGeneral *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_super v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v5 = dispatch_queue_create("SPUISearchModel workQueue", v4);
    v6 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v5;

    id v7 = objc_alloc_init(MEMORY[0x263F78C98]);
    v8 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v7;

    dispatch_async(*((dispatch_queue_t *)v2 + 10), &__block_literal_global_223);
  }
  return (SPUISearchModelGeneral *)v2;
}

- (void)_setInfinitePatience:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v7.receiver = self;
  v7.super_class = (Class)SPUISearchModelGeneral;
  [(SPUISearchModel *)&v7 setInfinitePatience:v3];
  dispatch_queue_t v5 = SPLogForSPLogCategoryDefault();
  os_log_type_t v6 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v9 = v3;
    _os_log_impl(&dword_23D2E6000, v5, v6, "Setting infinite patience: %d", buf, 8u);
  }

  [(SPClientSession *)self->_session setInfinitePatience:v3];
}

- (void)setInfinitePatience:(BOOL)a3
{
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SPUISearchModelGeneral_setInfinitePatience___block_invoke;
  block[3] = &unk_264E908C0;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  dispatch_async(workQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __46__SPUISearchModelGeneral_setInfinitePatience___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setInfinitePatience:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)infinitePatience
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__SPUISearchModelGeneral_infinitePatience__block_invoke;
  v5[3] = &unk_264E908E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__SPUISearchModelGeneral_infinitePatience__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) infinitePatience];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setForceStableResults:(BOOL)a3
{
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__SPUISearchModelGeneral_setForceStableResults___block_invoke;
  v4[3] = &unk_264E90790;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(workQueue, v4);
}

void __48__SPUISearchModelGeneral_setForceStableResults___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) queryTask];
  [v2 setForceStableResults:v1];
}

- (BOOL)forceStableResults
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__SPUISearchModelGeneral_forceStableResults__block_invoke;
  v5[3] = &unk_264E908E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __44__SPUISearchModelGeneral_forceStableResults__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queryTask];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 forceStableResults];
}

- (void)updatesDisabled
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SPUISearchModelGeneral_updatesDisabled__block_invoke;
  block[3] = &unk_264E90660;
  void block[4] = self;
  dispatch_sync(workQueue, block);
}

void __41__SPUISearchModelGeneral_updatesDisabled__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) queryTask];
  [v1 disableUpdates];
}

- (BOOL)queryInProgress
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__SPUISearchModelGeneral_queryInProgress__block_invoke;
  v5[3] = &unk_264E908E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  BOOL v3 = *((unsigned char *)v7 + 24) == 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __41__SPUISearchModelGeneral_queryInProgress__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) lastResponse];
  id v2 = [v5 task];
  BOOL v3 = [*(id *)(a1 + 32) queryTask];
  if (v2 == v3)
  {
    objc_super v4 = [*(id *)(a1 + 32) lastResponse];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 state] == 4;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (void)updatesEnabled
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__SPUISearchModelGeneral_updatesEnabled__block_invoke;
  block[3] = &unk_264E90660;
  void block[4] = self;
  dispatch_sync(workQueue, block);
}

void __40__SPUISearchModelGeneral_updatesEnabled__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) queryTask];
  [v1 enableUpdates];
}

- (void)deactivate
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__SPUISearchModelGeneral_deactivate__block_invoke;
  block[3] = &unk_264E90660;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

void __36__SPUISearchModelGeneral_deactivate__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) session];
  [v2 deactivate];

  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)SPUISearchModelGeneral;
  objc_msgSendSuper2(&v6, sel_deactivate);
  BOOL v3 = [MEMORY[0x263F78D00] sharedResourcesManager];
  [v3 loadAllParametersForClient:@"Spotlight"];

  objc_super v4 = [MEMORY[0x263F78D00] sharedResourcesManager];
  [v4 loadAllParametersForClient:@"SpotlightKnowledge"];

  id v5 = [MEMORY[0x263F78D00] sharedResourcesManager];
  [v5 loadAllParametersForClient:@"Mail"];
}

- (int64_t)maxUISuggestions
{
  id v2 = [(SPUISearchModelGeneral *)self session];
  int64_t v3 = [v2 maxUISuggestions];

  return v3;
}

- (BOOL)shouldEnableOCR
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (shouldEnableOCR_onceToken != -1) {
    dispatch_once(&shouldEnableOCR_onceToken, &__block_literal_global_238);
  }
  [MEMORY[0x263EFF960] preferredLanguages];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v29 objects:v34 count:16];
  objc_super v4 = v2;
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v30;
    objc_super v4 = v2;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:*(void *)(*((void *)&v29 + 1) + 8 * i)];
        char v9 = [v8 languageCode];
        int v10 = [v9 isEqualToString:@"yue"];

        if (v10)
        {
          uint64_t v11 = [v4 arrayByAddingObject:@"zh"];

          objc_super v4 = (void *)v11;
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v5);
  }

  v12 = [MEMORY[0x263F086E0] preferredLocalizationsFromArray:shouldEnableOCR_supportedLocaleStrings forPreferences:v4];
  v13 = (void *)MEMORY[0x263EFF960];
  v14 = [v12 firstObject];
  v15 = [v13 localeWithLocaleIdentifier:v14];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = v4;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v26;
    while (2)
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = objc_msgSend(MEMORY[0x263EFF960], "localeWithLocaleIdentifier:", *(void *)(*((void *)&v25 + 1) + 8 * j), (void)v25);
        v21 = [v20 languageCode];
        v22 = [v15 languageCode];
        char v23 = [v21 isEqualToString:v22];

        if (v23)
        {
          LOBYTE(v17) = 1;
          goto LABEL_22;
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
LABEL_22:

  return v17;
}

void __41__SPUISearchModelGeneral_shouldEnableOCR__block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x263F1EF90]);
  uint64_t v0 = [v2 supportedRecognitionLanguagesAndReturnError:0];
  id v1 = (void *)shouldEnableOCR_supportedLocaleStrings;
  shouldEnableOCR_supportedLocaleStrings = v0;
}

- (void)updateWithQueryContext:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__SPUISearchModelGeneral_updateWithQueryContext___block_invoke;
  v7[3] = &unk_264E90910;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workQueue, v7);
}

void __49__SPUISearchModelGeneral_updateWithQueryContext___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queryTask];
  [v2 cancel];

  [*(id *)(a1 + 32) invalidate];
  if (([*(id *)(a1 + 32) shouldEnableOCR] & 1) == 0) {
    [*(id *)(a1 + 40) setDisableOCR:1];
  }
  uint64_t v3 = [*(id *)(a1 + 32) session];
  id v4 = [v3 queryTaskWithContext:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setQueryTask:v4];

  [*(id *)(a1 + 32) setForceStableResults:0];
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5[1])
  {
    id v6 = [*(id *)(a1 + 32) queryTask];
    [v6 disableUpdates];

    uint64_t v5 = *(void **)(a1 + 32);
  }
  id v7 = [v5 queryTask];
  [v7 setDelegate:v5];

  if ([MEMORY[0x263F67C78] isIpad]) {
    uint64_t v8 = 6;
  }
  else {
    uint64_t v8 = 4;
  }
  char v9 = [*(id *)(a1 + 32) queryTask];
  [v9 setMaxTopHitAppResults:v8];

  id v10 = [*(id *)(a1 + 32) queryTask];
  [v10 start];
}

- (void)clear
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__SPUISearchModelGeneral_clear__block_invoke;
  block[3] = &unk_264E90660;
  void block[4] = self;
  dispatch_sync(workQueue, block);
}

uint64_t __31__SPUISearchModelGeneral_clear__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queryTask];
  [v2 clear];

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setQueryTask:0];
}

- (void)purgeMemory
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__SPUISearchModelGeneral_purgeMemory__block_invoke;
  block[3] = &unk_264E90660;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

void __37__SPUISearchModelGeneral_purgeMemory__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)SPUISearchModelGeneral;
  objc_msgSendSuper2(&v3, sel_purgeMemory);
  id v2 = [*(id *)(a1 + 32) session];
  [v2 setLastSections:MEMORY[0x263EFFA68] forQuery:0];
}

- (NSString)rankingDebugLog
{
  id v2 = [(SPUISearchModel *)self queryTask];
  objc_super v3 = [v2 rankingDebugLog];

  return (NSString *)v3;
}

- (void)setSession:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end