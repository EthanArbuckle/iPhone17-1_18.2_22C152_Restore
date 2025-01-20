@interface SBHIconLibraryAbstractQueryEngine
+ (id)_leafIdentifiersForBundleIdentifier:(id)a3;
- (APSubjectMonitorSubscription)appPrototectionSubjectMonitorSubscription;
- (BOOL)_processingQueue_isBundleIdentifierValid:(id)a3 iconLibraryQueryContext:(id)a4;
- (BOOL)_processingQueue_isIconModelReloading;
- (BOOL)_processingQueue_isShutdown;
- (BOOL)isShutdown;
- (OS_dispatch_queue)processingQueue;
- (SBHIconLibraryAbstractQueryEngine)init;
- (SBHIconLibraryAbstractQueryEngine)initWithIconModel:(id)a3;
- (SBHIconModel)iconModel;
- (id)_processingQueue_lastQueryResultForContext:(id)a3;
- (id)_processingQueue_sortComperatorForQueryContext:(id)a3;
- (void)_addItemsWithBundleIdentifiers:(id)a3 iconLibraryQueryContext:(id)a4 notifyDelegate:(BOOL)a5;
- (void)_iconModelDidReload:(id)a3;
- (void)_iconModelNeedsIconAdded:(id)a3;
- (void)_iconModelNeedsIconRemoved:(id)a3;
- (void)_iconModelNeedsIconReplaced:(id)a3;
- (void)_iconModelVisibilityDidChange:(id)a3;
- (void)_iconModelWillReload:(id)a3;
- (void)_mapBundleIdentifiersToIcons:(id)a3 completion:(id)a4;
- (void)_processingQueue_addIcons:(id)a3 iconLibraryQueryContext:(id)a4 notifyDelegate:(BOOL)a5;
- (void)_processingQueue_noteQueryResultsWereUpdated:(id)a3 iconLibraryQueryContext:(id)a4 notifyDelegate:(BOOL)a5;
- (void)_processingQueue_observerDispatchError:(id)a3 forQuery:(id)a4;
- (void)_processingQueue_observerDispatchQueryResultsWereUpdated:(id)a3;
- (void)_processingQueue_removeItemsWithBundleIdentifiers:(id)a3;
- (void)_processingQueue_removeItemsWithBundleIdentifiers:(id)a3 iconLibraryQueryContext:(id)a4 notifyDelegate:(BOOL)a5;
- (void)_processingQueue_startNewQueryContext:(id)a3;
- (void)_processingQueue_teardownQueryContext:(id)a3;
- (void)_processingQueue_teardownQueryContext:(id)a3 removeContext:(BOOL)a4;
- (void)_setupNotifications;
- (void)_teardownNotifications;
- (void)addObserver:(id)a3;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setAppPrototectionSubjectMonitorSubscription:(id)a3;
- (void)shutdown;
@end

@implementation SBHIconLibraryAbstractQueryEngine

- (SBHIconLibraryAbstractQueryEngine)initWithIconModel:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBHIconLibraryAbstractQueryEngine;
  v6 = [(SBHIconLibraryAbstractQueryEngine *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_iconModel, a3);
    [(SBHIconLibraryAbstractQueryEngine *)v7 _setupNotifications];
    uint64_t v8 = [MEMORY[0x1E4F28D30] hashTableWithOptions:0];
    executingQueryContexts = v7->_executingQueryContexts;
    v7->_executingQueryContexts = (NSHashTable *)v8;

    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    id v12 = [@"com.apple.processingQueue." stringByAppendingString:v11];
    [v12 UTF8String];
    uint64_t v13 = BSDispatchQueueCreateWithQualityOfService();
    processingQueue = v7->_processingQueue;
    v7->_processingQueue = (OS_dispatch_queue *)v13;

    v15 = [MEMORY[0x1E4F4B800] subjectMonitorRegistry];
    v16 = [v15 addMonitor:v7 subjectMask:1 subscriptionOptions:1];
    objc_storeWeak((id *)&v7->_appPrototectionSubjectMonitorSubscription, v16);
  }
  return v7;
}

- (SBHIconLibraryAbstractQueryEngine)init
{
  return 0;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appPrototectionSubjectMonitorSubscription);
  [WeakRetained invalidate];

  v4.receiver = self;
  v4.super_class = (Class)SBHIconLibraryAbstractQueryEngine;
  [(SBHIconLibraryAbstractQueryEngine *)&v4 dealloc];
}

- (BOOL)_processingQueue_isIconModelReloading
{
  return self->_iconModelIsReloading;
}

- (void)_setupNotifications
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SBHIconLibraryAbstractQueryEngine__setupNotifications__block_invoke;
  block[3] = &unk_1E6AAC810;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __56__SBHIconLibraryAbstractQueryEngine__setupNotifications__block_invoke(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(id *)(v2 + 16);
  [v4 addObserver:v2 selector:sel__iconModelNeedsIconAdded_ name:@"SBIconModelDidAddIconNotification" object:v3];
  [v4 addObserver:*(void *)(a1 + 32) selector:sel__iconModelNeedsIconReplaced_ name:@"SBIconModelDidReplaceIconNotification" object:v3];
  [v4 addObserver:*(void *)(a1 + 32) selector:sel__iconModelNeedsIconRemoved_ name:@"SBIconModelWillRemoveIconNotification" object:v3];
  [v4 addObserver:*(void *)(a1 + 32) selector:sel__iconModelWillReload_ name:@"SBIconModelWillReloadIconsNotification" object:v3];
  [v4 addObserver:*(void *)(a1 + 32) selector:sel__iconModelDidReload_ name:@"SBIconModelDidReloadIconsNotification" object:v3];
  [v4 addObserver:*(void *)(a1 + 32) selector:sel__iconModelVisibilityDidChange_ name:@"SBIconModelVisibilityDidChangeNotification" object:v3];
}

- (void)_teardownNotifications
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SBHIconLibraryAbstractQueryEngine__teardownNotifications__block_invoke;
  block[3] = &unk_1E6AAC810;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __59__SBHIconLibraryAbstractQueryEngine__teardownNotifications__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 removeObserver:*(void *)(a1 + 32)];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SBHIconLibraryAbstractQueryEngine_addObserver___block_invoke;
  block[3] = &unk_1E6AB0610;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(processingQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __49__SBHIconLibraryAbstractQueryEngine_addObserver___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = (void *)WeakRetained[4];
    if (!v3)
    {
      uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      id v5 = (void *)v6[4];
      v6[4] = v4;

      id v3 = (void *)v6[4];
    }
    [v3 addObject:*(void *)(a1 + 32)];
    id WeakRetained = v6;
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SBHIconLibraryAbstractQueryEngine_removeObserver___block_invoke;
  block[3] = &unk_1E6AB0610;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(processingQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __52__SBHIconLibraryAbstractQueryEngine_removeObserver___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[4] removeObject:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)shutdown
{
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __45__SBHIconLibraryAbstractQueryEngine_shutdown__block_invoke;
  v7 = &unk_1E6AB0278;
  objc_copyWeak(&v8, &location);
  dispatch_async(processingQueue, &v4);
  [(SBHIconLibraryAbstractQueryEngine *)self _teardownNotifications];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __45__SBHIconLibraryAbstractQueryEngine_shutdown__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;
    id v3 = WeakRetained;

    id WeakRetained = v3;
    *((unsigned char *)v3 + 40) = 1;
  }
}

- (BOOL)_processingQueue_isShutdown
{
  return self->_isShutdown;
}

- (BOOL)isShutdown
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  processingQueue = self->_processingQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__SBHIconLibraryAbstractQueryEngine_isShutdown__block_invoke;
  v5[3] = &unk_1E6AACB28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(processingQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__SBHIconLibraryAbstractQueryEngine_isShutdown__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 40);
  return result;
}

- (void)_processingQueue_observerDispatchQueryResultsWereUpdated:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) engine:self queryResultsWereUpdated:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_processingQueue_observerDispatchError:(id)a3 forQuery:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) engine:self failedToExecuteQuery:v7 withError:v6];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_processingQueue_startNewQueryContext:(id)a3
{
}

- (id)_processingQueue_lastQueryResultForContext:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"kLastQueryResultKey"];
}

- (void)_addItemsWithBundleIdentifiers:(id)a3 iconLibraryQueryContext:(id)a4 notifyDelegate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __107__SBHIconLibraryAbstractQueryEngine__addItemsWithBundleIdentifiers_iconLibraryQueryContext_notifyDelegate___block_invoke;
    v10[3] = &unk_1E6AB4A38;
    objc_copyWeak(&v12, &location);
    id v11 = v9;
    BOOL v13 = a5;
    [(SBHIconLibraryAbstractQueryEngine *)self _mapBundleIdentifiersToIcons:v8 completion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __107__SBHIconLibraryAbstractQueryEngine__addItemsWithBundleIdentifiers_iconLibraryQueryContext_notifyDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[6];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __107__SBHIconLibraryAbstractQueryEngine__addItemsWithBundleIdentifiers_iconLibraryQueryContext_notifyDelegate___block_invoke_2;
    v7[3] = &unk_1E6AB4A10;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    id v8 = v3;
    id v9 = *(id *)(a1 + 32);
    char v11 = *(unsigned char *)(a1 + 48);
    dispatch_async(v6, v7);

    objc_destroyWeak(&v10);
  }
}

void __107__SBHIconLibraryAbstractQueryEngine__addItemsWithBundleIdentifiers_iconLibraryQueryContext_notifyDelegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_processingQueue_addIcons:iconLibraryQueryContext:notifyDelegate:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
    id WeakRetained = v3;
  }
}

- (void)_processingQueue_addIcons:(id)a3 iconLibraryQueryContext:(id)a4 notifyDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  id v18 = a4;
  id v8 = a3;
  id v9 = [v18 objectForKeyedSubscript:@"kLastQueryResultKey"];
  id v10 = [v9 icons];
  char v11 = (void *)[v10 mutableCopy];
  id v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = (id)objc_opt_new();
  }
  long long v14 = v13;

  [v14 unionSet:v8];
  if (([v10 isEqualToSet:v14] & 1) == 0)
  {
    long long v15 = [(SBHIconLibraryAbstractQueryEngine *)self _processingQueue_sortComperatorForQueryContext:v18];
    long long v16 = [v18 query];
    v17 = [[SBHIconLibraryQueryResult alloc] initWithQuery:v16 icons:v14 sortComparator:v15];
    [(SBHIconLibraryAbstractQueryEngine *)self _processingQueue_noteQueryResultsWereUpdated:v17 iconLibraryQueryContext:v18 notifyDelegate:v5];
  }
}

- (void)_processingQueue_noteQueryResultsWereUpdated:(id)a3 iconLibraryQueryContext:(id)a4 notifyDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  objc_msgSend(a4, "setObject:forKeyedSubscript:");
  if (v5) {
    [(SBHIconLibraryAbstractQueryEngine *)self _processingQueue_observerDispatchQueryResultsWereUpdated:v8];
  }
}

- (void)_processingQueue_removeItemsWithBundleIdentifiers:(id)a3 iconLibraryQueryContext:(id)a4 notifyDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  id v10 = [v8 objectForKeyedSubscript:@"kLastQueryResultKey"];
  char v11 = [v10 icons];
  id v12 = (void *)[v11 mutableCopy];
  id v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = (id)objc_opt_new();
  }
  long long v15 = v14;

  long long v16 = (void *)MEMORY[0x1E4F28F60];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __126__SBHIconLibraryAbstractQueryEngine__processingQueue_removeItemsWithBundleIdentifiers_iconLibraryQueryContext_notifyDelegate___block_invoke;
  v22[3] = &unk_1E6AB4A60;
  id v17 = v9;
  id v23 = v17;
  id v18 = [v16 predicateWithBlock:v22];
  [v15 filterUsingPredicate:v18];

  if (([v11 isEqualToSet:v15] & 1) == 0)
  {
    v19 = [(SBHIconLibraryAbstractQueryEngine *)self _processingQueue_sortComperatorForQueryContext:v8];
    v20 = [v8 query];
    v21 = [[SBHIconLibraryQueryResult alloc] initWithQuery:v20 icons:v15 sortComparator:v19];
    [(SBHIconLibraryAbstractQueryEngine *)self _processingQueue_noteQueryResultsWereUpdated:v21 iconLibraryQueryContext:v8 notifyDelegate:v5];
  }
}

uint64_t __126__SBHIconLibraryAbstractQueryEngine__processingQueue_removeItemsWithBundleIdentifiers_iconLibraryQueryContext_notifyDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 leafIdentifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

- (id)_processingQueue_sortComperatorForQueryContext:(id)a3
{
  return 0;
}

+ (id)_leafIdentifiersForBundleIdentifier:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = a3;
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  BOOL v5 = [v3 arrayWithObjects:v7 count:1];

  return v5;
}

- (void)_mapBundleIdentifiersToIcons:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__SBHIconLibraryAbstractQueryEngine__mapBundleIdentifiersToIcons_completion___block_invoke;
  v10[3] = &unk_1E6AB4A88;
  objc_copyWeak(&v13, &location);
  id v11 = v6;
  id v12 = v7;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __77__SBHIconLibraryAbstractQueryEngine__mapBundleIdentifiersToIcons_completion___block_invoke(id *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v3 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v4 = a1[4];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = [*((id *)WeakRetained + 2) leafIconForIdentifier:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          if ([*((id *)WeakRetained + 2) isIconVisible:v9]
            && _SBIconIsLeafIconAndNotWidgetIcon(v9))
          {
            [v3 addObject:v9];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v6);
    }

    id v10 = *((void *)WeakRetained + 6);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77__SBHIconLibraryAbstractQueryEngine__mapBundleIdentifiersToIcons_completion___block_invoke_2;
    v15[3] = &unk_1E6AAD7E0;
    id v11 = a1[5];
    id v16 = v3;
    id v17 = v11;
    id v12 = v3;
    dispatch_async(v10, v15);
  }
  else
  {
    id v13 = (void (**)(id, void *))a1[5];
    id v14 = [MEMORY[0x1E4F1CAD0] set];
    v13[2](v13, v14);
  }
}

uint64_t __77__SBHIconLibraryAbstractQueryEngine__mapBundleIdentifiersToIcons_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_processingQueue_teardownQueryContext:(id)a3
{
}

- (void)_processingQueue_teardownQueryContext:(id)a3 removeContext:(BOOL)a4
{
  if (a4) {
    [(NSHashTable *)self->_executingQueryContexts removeObject:a3];
  }
}

- (void)_iconModelNeedsIconAdded:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SBHIconLibraryAbstractQueryEngine__iconModelNeedsIconAdded___block_invoke;
  block[3] = &unk_1E6AB0610;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(processingQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __62__SBHIconLibraryAbstractQueryEngine__iconModelNeedsIconAdded___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[3];
    if ([v4 count])
    {
      uint64_t v5 = [*(id *)(a1 + 32) userInfo];
      id v6 = [v5 objectForKey:@"icon"];

      if (v6 && _SBIconIsLeafIconAndNotWidgetIcon(v6))
      {
        uint64_t v7 = objc_opt_class();
        long long v20 = v6;
        id v8 = [v6 leafIdentifier];
        uint64_t v23 = [v7 _leafIdentifiersForBundleIdentifier:v8];

        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        obuint64_t j = [v4 allObjects];
        uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v22 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v29 != v22) {
                objc_enumerationMutation(obj);
              }
              uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8 * i);
              long long v24 = 0u;
              long long v25 = 0u;
              long long v26 = 0u;
              long long v27 = 0u;
              id v13 = v23;
              uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v33 count:16];
              if (v14)
              {
                uint64_t v15 = v14;
                uint64_t v16 = *(void *)v25;
                do
                {
                  for (uint64_t j = 0; j != v15; ++j)
                  {
                    if (*(void *)v25 != v16) {
                      objc_enumerationMutation(v13);
                    }
                    uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * j);
                    if (objc_msgSend(v3, "_processingQueue_isBundleIdentifierValid:iconLibraryQueryContext:", v18, v12))
                    {
                      uint64_t v32 = v18;
                      long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
                      [v3 _addItemsWithBundleIdentifiers:v19 iconLibraryQueryContext:v12 notifyDelegate:1];
                    }
                  }
                  uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v33 count:16];
                }
                while (v15);
              }
            }
            uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
          }
          while (v10);
        }

        id v6 = v20;
      }
    }
  }
}

- (void)_iconModelNeedsIconReplaced:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__SBHIconLibraryAbstractQueryEngine__iconModelNeedsIconReplaced___block_invoke;
  block[3] = &unk_1E6AB0610;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(processingQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __65__SBHIconLibraryAbstractQueryEngine__iconModelNeedsIconReplaced___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[3];
    if ([v4 count])
    {
      uint64_t v5 = [*(id *)(a1 + 32) userInfo];
      id v6 = [v5 objectForKey:@"icon"];

      if (v6 && _SBIconIsLeafIconAndNotWidgetIcon(v6))
      {
        uint64_t v7 = objc_opt_class();
        id v8 = [v6 leafIdentifier];
        uint64_t v18 = [v7 _leafIdentifiersForBundleIdentifier:v8];

        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        obuint64_t j = [v4 allObjects];
        uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v19)
        {
          uint64_t v17 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v26 != v17) {
                objc_enumerationMutation(obj);
              }
              uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
              objc_msgSend(v3, "_processingQueue_removeItemsWithBundleIdentifiers:iconLibraryQueryContext:notifyDelegate:", v18, v10, 0);
              long long v23 = 0u;
              long long v24 = 0u;
              long long v21 = 0u;
              long long v22 = 0u;
              id v11 = v18;
              uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
              if (v12)
              {
                uint64_t v13 = v12;
                uint64_t v14 = *(void *)v22;
                do
                {
                  for (uint64_t j = 0; j != v13; ++j)
                  {
                    if (*(void *)v22 != v14) {
                      objc_enumerationMutation(v11);
                    }
                    if (objc_msgSend(v3, "_processingQueue_isBundleIdentifierValid:iconLibraryQueryContext:", *(void *)(*((void *)&v21 + 1) + 8 * j), v10))
                    {
                      v20[0] = MEMORY[0x1E4F143A8];
                      v20[1] = 3221225472;
                      v20[2] = __65__SBHIconLibraryAbstractQueryEngine__iconModelNeedsIconReplaced___block_invoke_2;
                      v20[3] = &unk_1E6AB4AB0;
                      v20[4] = v3;
                      v20[5] = v10;
                      [v3 _mapBundleIdentifiersToIcons:v11 completion:v20];
                    }
                  }
                  uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
                }
                while (v13);
              }
            }
            uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
          }
          while (v19);
        }
      }
    }
  }
}

uint64_t __65__SBHIconLibraryAbstractQueryEngine__iconModelNeedsIconReplaced___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processingQueue_addIcons:iconLibraryQueryContext:notifyDelegate:", a2, *(void *)(a1 + 40), 1);
}

- (void)_iconModelNeedsIconRemoved:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SBHIconLibraryAbstractQueryEngine__iconModelNeedsIconRemoved___block_invoke;
  block[3] = &unk_1E6AB0610;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(processingQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __64__SBHIconLibraryAbstractQueryEngine__iconModelNeedsIconRemoved___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) userInfo];
    id v4 = [v3 objectForKey:@"icon"];

    if (v4 && _SBIconIsLeafIconAndNotWidgetIcon(v4))
    {
      uint64_t v5 = [v4 leafIdentifier];
      v7[0] = v5;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
      objc_msgSend(WeakRetained, "_processingQueue_removeItemsWithBundleIdentifiers:", v6);
    }
  }
}

- (void)_iconModelWillReload:(id)a3
{
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__SBHIconLibraryAbstractQueryEngine__iconModelWillReload___block_invoke;
  v5[3] = &unk_1E6AB0278;
  objc_copyWeak(&v6, &location);
  dispatch_async(processingQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __58__SBHIconLibraryAbstractQueryEngine__iconModelWillReload___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = *((id *)WeakRetained + 3);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = objc_msgSend(v3, "allObjects", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(v2, "_processingQueue_teardownQueryContext:removeContext:", *(void *)(*((void *)&v10 + 1) + 8 * v8++), 0);
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }

    v2[8] = 1;
    id v9 = +[SBHIconLibraryQueryResult nullQueryResults];
    objc_msgSend(v2, "_processingQueue_noteQueryResultsWereUpdated:iconLibraryQueryContext:notifyDelegate:", v9, 0, 1);
  }
}

- (void)_iconModelDidReload:(id)a3
{
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__SBHIconLibraryAbstractQueryEngine__iconModelDidReload___block_invoke;
  v5[3] = &unk_1E6AB0278;
  objc_copyWeak(&v6, &location);
  dispatch_async(processingQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __57__SBHIconLibraryAbstractQueryEngine__iconModelDidReload___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 8) = 0;
    id v3 = WeakRetained[3];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = objc_msgSend(v3, "allObjects", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) query];
          [v2 executeQuery:v9];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)_iconModelVisibilityDidChange:(id)a3
{
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__SBHIconLibraryAbstractQueryEngine__iconModelVisibilityDidChange___block_invoke;
  v5[3] = &unk_1E6AB0278;
  objc_copyWeak(&v6, &location);
  dispatch_async(processingQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __67__SBHIconLibraryAbstractQueryEngine__iconModelVisibilityDidChange___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained[3];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = objc_msgSend(v3, "allObjects", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          objc_msgSend(v2, "_processingQueue_teardownQueryContext:removeContext:", v9, 1);
          long long v10 = [v9 query];
          [v2 executeQuery:v10];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)_processingQueue_isBundleIdentifierValid:(id)a3 iconLibraryQueryContext:(id)a4
{
  return 1;
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
        uint64_t v13 = objc_opt_class();
        id v14 = v12;
        if (v13)
        {
          if (objc_opt_isKindOfClass()) {
            uint64_t v15 = v14;
          }
          else {
            uint64_t v15 = 0;
          }
        }
        else
        {
          uint64_t v15 = 0;
        }
        id v16 = v15;

        uint64_t v17 = [v16 bundleIdentifier];
        [v6 addObject:v17];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__SBHIconLibraryAbstractQueryEngine_appProtectionSubjectsChanged_forSubscription___block_invoke;
  block[3] = &unk_1E6AB0610;
  objc_copyWeak(&v22, &location);
  id v21 = v6;
  id v19 = v6;
  dispatch_async(processingQueue, block);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __82__SBHIconLibraryAbstractQueryEngine_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_processingQueue_removeItemsWithBundleIdentifiers:", *(void *)(a1 + 32));
    id WeakRetained = v3;
  }
}

- (void)_processingQueue_removeItemsWithBundleIdentifiers:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_executingQueryContexts;
  if ([(NSHashTable *)v5 count])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = [(id)objc_opt_class() _leafIdentifiersForBundleIdentifier:*(void *)(*((void *)&v22 + 1) + 8 * v11)];
          [v6 addObjectsFromArray:v12];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v9);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v13 = [(NSHashTable *)v5 allObjects];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          [(SBHIconLibraryAbstractQueryEngine *)self _processingQueue_removeItemsWithBundleIdentifiers:v6 iconLibraryQueryContext:*(void *)(*((void *)&v18 + 1) + 8 * v17++) notifyDelegate:1];
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v15);
    }
  }
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (SBHIconModel)iconModel
{
  return self->_iconModel;
}

- (APSubjectMonitorSubscription)appPrototectionSubjectMonitorSubscription
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appPrototectionSubjectMonitorSubscription);
  return (APSubjectMonitorSubscription *)WeakRetained;
}

- (void)setAppPrototectionSubjectMonitorSubscription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appPrototectionSubjectMonitorSubscription);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_executingQueryContexts, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
}

@end