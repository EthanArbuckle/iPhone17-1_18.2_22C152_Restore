@interface RELiveElementCoordinator
- (BOOL)elementDataSourceController:(id)a3 isElementVisible:(id)a4;
- (RELiveElementCoordinator)initWithRelevanceEngine:(id)a3;
- (id)_predictionForElement:(id)a3;
- (id)elementForElementId:(id)a3;
- (id)elementRankerForSection:(id)a3;
- (id)elementRelevanceEngine;
- (id)featureMapForElement:(id)a3 trainingContext:(id)a4;
- (id)featureMapForElementId:(id)a3 trainingContext:(id)a4;
- (id)featureProviderForElement:(id)a3;
- (id)featureProviderForElementAtPath:(id)a3;
- (id)predictionForElementAtPath:(id)a3;
- (void)_enumerateSectionsUsingBlock:(id)a3;
- (void)_enumerateSectionsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)_onqueue_async:(id)a3;
- (void)_queue_addElement:(id)a3 toSection:(id)a4;
- (void)_queue_refreshElement:(id)a3;
- (void)_queue_reload;
- (void)_queue_reloadElement:(id)a3;
- (void)_queue_removeElement:(id)a3;
- (void)_queue_scheduleContentUpdate:(BOOL)a3;
- (void)addElement:(id)a3 toSection:(id)a4;
- (void)dataSource:(id)a3 didBeginActivity:(id)a4;
- (void)dataSource:(id)a3 didFinishActivity:(id)a4;
- (void)dataSourceManager:(id)a3 didLoadDataSourceController:(id)a4;
- (void)dataSourceManager:(id)a3 willUnloadDataSourceController:(id)a4;
- (void)elementDataSourceController:(id)a3 didAddElement:(id)a4 toSection:(id)a5;
- (void)elementDataSourceController:(id)a3 didRefreshElement:(id)a4;
- (void)elementDataSourceController:(id)a3 didReloadElement:(id)a4;
- (void)elementDataSourceController:(id)a3 didRemoveElement:(id)a4;
- (void)elementDataSourceController:(id)a3 performBatchUpdates:(id)a4;
- (void)relevanceEngine:(id)a3 didInsertElement:(id)a4 atPath:(id)a5;
- (void)relevanceEngine:(id)a3 didMoveElement:(id)a4 fromPath:(id)a5 toPath:(id)a6;
- (void)relevanceEngine:(id)a3 didRemoveElement:(id)a4 atPath:(id)a5;
- (void)relevanceEngine:(id)a3 didUpdateRelevanceOfElement:(id)a4;
- (void)relevanceEngine:(id)a3 elementWasAdded:(id)a4;
- (void)relevanceEngine:(id)a3 elementWasRemoved:(id)a4;
- (void)relevanceEngine:(id)a3 performedBatchUpdates:(id)a4;
- (void)removeElement:(id)a3;
@end

@implementation RELiveElementCoordinator

- (void)dataSourceManager:(id)a3 didLoadDataSourceController:(id)a4
{
  id v5 = a4;
  [v5 setDelegate:self];
  v6 = [v5 dataSource];
  [(RERelevanceEngineSubsystem *)self trackObject:v6];

  id v7 = [v5 dataSource];

  [v7 setActivityDelegate:self];
}

- (id)elementRelevanceEngine
{
  return self->_relevanceEngine;
}

- (RELiveElementCoordinator)initWithRelevanceEngine:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)RELiveElementCoordinator;
  id v5 = [(REElementCoordinator *)&v37 initWithRelevanceEngine:v4];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(RERelevanceEngineSubsystem *)v5 queue];
    controllerQueue = v6->_controllerQueue;
    v6->_controllerQueue = (OS_dispatch_queue *)v7;

    v9 = [v4 configuration];
    v10 = [v9 observerQueue];
    v11 = v10;
    if (v10)
    {
      v12 = v10;
      callbackQueue = v6->_callbackQueue;
      v6->_callbackQueue = v12;
    }
    else
    {
      v14 = (OS_dispatch_queue *)MEMORY[0x263EF83A0];
      id v15 = MEMORY[0x263EF83A0];
      callbackQueue = v6->_callbackQueue;
      v6->_callbackQueue = v14;
    }

    uint64_t v16 = [MEMORY[0x263F08760] set];
    remainingInsertOperations = v6->_remainingInsertOperations;
    v6->_remainingInsertOperations = (NSCountedSet *)v16;

    uint64_t v18 = [MEMORY[0x263F08760] set];
    remainingRemoveOperations = v6->_remainingRemoveOperations;
    v6->_remainingRemoveOperations = (NSCountedSet *)v18;

    v6->_currentReloadTryCount = 0;
    uint64_t v20 = [MEMORY[0x263EFF9C0] set];
    refreshedElements = v6->_refreshedElements;
    v6->_refreshedElements = (NSMutableSet *)v20;

    v6->_reloadImmediately = 1;
    uint64_t v22 = [MEMORY[0x263EFF9A0] dictionary];
    elementIdElementMap = v6->_elementIdElementMap;
    v6->_elementIdElementMap = (NSMutableDictionary *)v22;

    v24 = [[REElementRelevanceEngine alloc] initWithRelevanceEngine:v4];
    relevanceEngine = v6->_relevanceEngine;
    v6->_relevanceEngine = v24;

    [(REElementRelevanceEngine *)v6->_relevanceEngine setDelegate:v6];
    v26 = [v4 logger];
    [v26 addLoggable:v6->_relevanceEngine];

    v27 = [v4 configuration];
    int v28 = [v27 wantsImmutableContent];

    objc_initWeak(&location, v6);
    v29 = v6->_controllerQueue;
    if (v28) {
      double v30 = 0.0;
    }
    else {
      double v30 = 0.2;
    }
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __52__RELiveElementCoordinator_initWithRelevanceEngine___block_invoke;
    v34[3] = &unk_2644BC638;
    objc_copyWeak(&v35, &location);
    uint64_t v31 = +[REUpNextScheduler schedulerWithQueue:v29 delay:v34 updateBlock:v30];
    scheduler = v6->_scheduler;
    v6->_scheduler = (REUpNextScheduler *)v31;

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __52__RELiveElementCoordinator_initWithRelevanceEngine___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_reload");
    WeakRetained = v3;
    if (v3[14])
    {
      unint64_t v2 = 0;
      do
      {
        [v3 endActivity:@"RERelevanceEngineSubsystemLoadingActivity" forObject:v3];
        WeakRetained = v3;
        ++v2;
      }
      while (v2 < v3[14]);
    }
    WeakRetained[14] = 0;
  }
}

- (void)_enumerateSectionsUsingBlock:(id)a3
{
}

- (void)_enumerateSectionsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__RELiveElementCoordinator__enumerateSectionsWithOptions_usingBlock___block_invoke;
  v9[3] = &unk_2644BF810;
  id v10 = v6;
  id v8 = v6;
  [v7 enumerateSectionDescriptorsWithOptions:a3 includeHistoric:1 usingBlock:v9];
}

void __69__RELiveElementCoordinator__enumerateSectionsWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 name];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)dataSourceManager:(id)a3 willUnloadDataSourceController:(id)a4
{
  id v5 = a4;
  id v6 = [v5 elementOperationQueue];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __77__RELiveElementCoordinator_dataSourceManager_willUnloadDataSourceController___block_invoke;
  v13 = &unk_2644BC688;
  id v14 = v5;
  id v15 = self;
  id v7 = v5;
  dispatch_async(v6, &v10);

  id v8 = objc_msgSend(v7, "dataSource", v10, v11, v12, v13);
  [v8 setActivityDelegate:0];

  v9 = [v7 dataSource];
  [(RERelevanceEngineSubsystem *)self withdrawObject:v9];
}

void __77__RELiveElementCoordinator_dataSourceManager_willUnloadDataSourceController___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) allElements];
  id v3 = (void *)[v2 copy];

  id v4 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __77__RELiveElementCoordinator_dataSourceManager_willUnloadDataSourceController___block_invoke_2;
  v6[3] = &unk_2644BC688;
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  objc_msgSend(v4, "_onqueue_async:", v6);
}

void __77__RELiveElementCoordinator_dataSourceManager_willUnloadDataSourceController___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "elementDataSourceController:didRemoveElement:", 0, *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)addElement:(id)a3 toSection:(id)a4
{
  controllerQueue = self->_controllerQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(controllerQueue);
  [(RELiveElementCoordinator *)self _queue_addElement:v8 toSection:v7];
}

- (void)removeElement:(id)a3
{
  controllerQueue = self->_controllerQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(controllerQueue);
  [(RELiveElementCoordinator *)self _queue_removeElement:v5];
}

- (id)predictionForElementAtPath:(id)a3
{
  uint64_t v4 = [(REElementCoordinator *)self elementAtPath:a3];
  id v5 = [(RELiveElementCoordinator *)self _predictionForElement:v4];

  return v5;
}

- (id)featureProviderForElement:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__21;
  controllerQueue = self->_controllerQueue;
  uint64_t v16 = __Block_byref_object_dispose__21;
  id v17 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__RELiveElementCoordinator_featureProviderForElement___block_invoke;
  block[3] = &unk_2644BEE08;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(controllerQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __54__RELiveElementCoordinator_featureProviderForElement___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 80) featureProviderForElement:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (id)featureProviderForElementAtPath:(id)a3
{
  uint64_t v4 = [(REElementCoordinator *)self elementAtPath:a3];
  id v5 = [(RELiveElementCoordinator *)self featureProviderForElement:v4];

  return v5;
}

- (id)elementRankerForSection:(id)a3
{
  return [(REElementRelevanceEngine *)self->_relevanceEngine elementRankerForSection:a3];
}

- (id)_predictionForElement:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__21;
  controllerQueue = self->_controllerQueue;
  uint64_t v16 = __Block_byref_object_dispose__21;
  id v17 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__RELiveElementCoordinator__predictionForElement___block_invoke;
  block[3] = &unk_2644BEE08;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(controllerQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __50__RELiveElementCoordinator__predictionForElement___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 80) predictionForElement:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (void)elementDataSourceController:(id)a3 performBatchUpdates:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  controllerQueue = self->_controllerQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __76__RELiveElementCoordinator_elementDataSourceController_performBatchUpdates___block_invoke;
  v11[3] = &unk_2644BC5E8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(controllerQueue, v11);
}

void __76__RELiveElementCoordinator_elementDataSourceController_performBatchUpdates___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __76__RELiveElementCoordinator_elementDataSourceController_performBatchUpdates___block_invoke_2;
  v2[3] = &unk_2644BC5E8;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  _os_activity_initiate(&dword_21E6E6000, "[LEC]: Batch element updates", OS_ACTIVITY_FLAG_DEFAULT, v2);
}

void __76__RELiveElementCoordinator_elementDataSourceController_performBatchUpdates___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = RELogForDomain(7);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl(&dword_21E6E6000, v2, OS_LOG_TYPE_DEFAULT, "[LEC]: Start processing batch updates for data source controller %{public}@", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v4 = RELogForDomain(7);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_impl(&dword_21E6E6000, v4, OS_LOG_TYPE_DEFAULT, "[LEC]: Finish processing batch updates for data source controller %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)elementDataSourceController:(id)a3 didAddElement:(id)a4 toSection:(id)a5
{
  controllerQueue = self->_controllerQueue;
  id v8 = a5;
  id v9 = a4;
  dispatch_assert_queue_V2(controllerQueue);
  [(RELiveElementCoordinator *)self _queue_addElement:v9 toSection:v8];
}

- (void)elementDataSourceController:(id)a3 didReloadElement:(id)a4
{
  controllerQueue = self->_controllerQueue;
  id v6 = a4;
  dispatch_assert_queue_V2(controllerQueue);
  [(RELiveElementCoordinator *)self _queue_reloadElement:v6];
}

- (void)elementDataSourceController:(id)a3 didRemoveElement:(id)a4
{
  controllerQueue = self->_controllerQueue;
  id v6 = a4;
  dispatch_assert_queue_V2(controllerQueue);
  [(RELiveElementCoordinator *)self _queue_removeElement:v6];
}

- (void)elementDataSourceController:(id)a3 didRefreshElement:(id)a4
{
  controllerQueue = self->_controllerQueue;
  id v6 = a4;
  dispatch_assert_queue_V2(controllerQueue);
  [(RELiveElementCoordinator *)self _queue_refreshElement:v6];
}

- (BOOL)elementDataSourceController:(id)a3 isElementVisible:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(REElementCoordinator *)self pathForElement:v7];
  id v9 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __73__RELiveElementCoordinator_elementDataSourceController_isElementVisible___block_invoke;
  v13[3] = &unk_2644BF838;
  id v10 = v9;
  id v14 = v10;
  id v11 = v8;
  id v15 = v11;
  uint64_t v16 = &v17;
  [(REElementCoordinator *)self enumerateObservers:v13];
  LOBYTE(self) = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)self;
}

uint64_t __73__RELiveElementCoordinator_elementDataSourceController_isElementVisible___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 relevanceEngine:a1[4] isElementAtPathVisible:a1[5]];
  if (result)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (void)dataSource:(id)a3 didBeginActivity:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = RELogForDomain(7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v7;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_21E6E6000, v8, OS_LOG_TYPE_DEFAULT, "[LEC]: Start processing %{public}@ activity from data source %{public}@", (uint8_t *)&v9, 0x16u);
  }

  [(RERelevanceEngineSubsystem *)self beginActivity:v7 forObject:v6];
}

- (void)dataSource:(id)a3 didFinishActivity:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(RERelevanceEngineSubsystem *)self endActivity:v7 forObject:v6];
  id v8 = RELogForDomain(7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v7;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_21E6E6000, v8, OS_LOG_TYPE_DEFAULT, "[LEC]: Finish processing %{public}@ activity from data source %{public}@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)_queue_addElement:(id)a3 toSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_controllerQueue);
  if (_fetchedInternalBuildOnceToken_6 != -1) {
    dispatch_once(&_fetchedInternalBuildOnceToken_6, &__block_literal_global_53);
  }
  if (_isInternalDevice_6)
  {
    id v8 = [v6 identifier];

    if (!v8) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Reproduced rdar://107396589: Attempted to add element to section %@ without an identifier: %@", v7, v6 format];
    }
  }
  int v9 = RELogForDomain(7);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[RELiveElementCoordinator _queue_addElement:toSection:](v6);
  }

  refreshedElements = self->_refreshedElements;
  __int16 v11 = [v6 identifier];
  [(NSMutableSet *)refreshedElements removeObject:v11];

  remainingInsertOperations = self->_remainingInsertOperations;
  uint64_t v13 = [v6 identifier];
  [(NSCountedSet *)remainingInsertOperations addObject:v13];

  elementIdElementMap = self->_elementIdElementMap;
  id v15 = [v6 identifier];
  [(NSMutableDictionary *)elementIdElementMap setObject:v6 forKey:v15];

  [(REElementRelevanceEngine *)self->_relevanceEngine addElement:v6 section:v7];
}

uint64_t __56__RELiveElementCoordinator__queue_addElement_toSection___block_invoke()
{
  uint64_t result = _REGetIsInternalBuild();
  _isInternalDevice_6 = result;
  return result;
}

- (void)_queue_reloadElement:(id)a3
{
  id v4 = a3;
  elementIdElementMap = self->_elementIdElementMap;
  id v6 = [v4 identifier];
  id v7 = [(NSMutableDictionary *)elementIdElementMap objectForKeyedSubscript:v6];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_controllerQueue);
  if (v7)
  {
    if (_fetchedInternalBuildOnceToken_6 != -1) {
      dispatch_once(&_fetchedInternalBuildOnceToken_6, &__block_literal_global_10_1);
    }
    if (_isInternalDevice_6)
    {
      id v8 = [v4 identifier];

      if (!v8) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Reproduced rdar://107396589: Attempted to reload element without an identifier: %@", v4 format];
      }
    }
    int v9 = RELogForDomain(7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[RELiveElementCoordinator _queue_reloadElement:](v4);
    }

    id v10 = self->_elementIdElementMap;
    __int16 v11 = [v4 identifier];
    [(NSMutableDictionary *)v10 setObject:v4 forKey:v11];

    id v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = [v7 relevanceProviders];
    id v14 = [v12 setWithArray:v13];

    id v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v16 = [v4 relevanceProviders];
    uint64_t v17 = [v15 setWithArray:v16];

    if (([v14 isEqualToSet:v17] & 1) == 0) {
      [(REElementRelevanceEngine *)self->_relevanceEngine reloadElement:v7 withElement:v4];
    }
    relevanceEngine = self->_relevanceEngine;
    uint64_t v19 = [v4 identifier];
    char v20 = [(REElementRelevanceEngine *)relevanceEngine pathForElement:v19];

    if (v20)
    {
      refreshedElements = self->_refreshedElements;
      uint64_t v22 = [v4 identifier];
      [(NSMutableSet *)refreshedElements removeObject:v22];

      [(RELiveElementCoordinator *)self _queue_scheduleContentUpdate:1];
    }
    else
    {
      v23 = RELogForDomain(7);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[RELiveElementCoordinator _queue_reloadElement:](v4);
      }
    }
  }
  else
  {
    id v14 = RELogForDomain(7);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[RELiveElementCoordinator _queue_reloadElement:](v14);
    }
  }
}

uint64_t __49__RELiveElementCoordinator__queue_reloadElement___block_invoke()
{
  uint64_t result = _REGetIsInternalBuild();
  _isInternalDevice_6 = result;
  return result;
}

- (void)_queue_refreshElement:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_controllerQueue);
  if (_fetchedInternalBuildOnceToken_6 != -1) {
    dispatch_once(&_fetchedInternalBuildOnceToken_6, &__block_literal_global_16_0);
  }
  if (_isInternalDevice_6)
  {
    uint64_t v5 = [v4 identifier];

    if (!v5) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Reproduced rdar://107396589: Attempted to refresh element without an identifier: %@", v4 format];
    }
  }
  id v6 = RELogForDomain(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[RELiveElementCoordinator _queue_refreshElement:](v4);
  }

  elementIdElementMap = self->_elementIdElementMap;
  id v8 = [v4 identifier];
  [(NSMutableDictionary *)elementIdElementMap setObject:v4 forKey:v8];

  relevanceEngine = self->_relevanceEngine;
  id v10 = [v4 identifier];
  __int16 v11 = [(REElementRelevanceEngine *)relevanceEngine pathForElement:v10];

  if (v11)
  {
    refreshedElements = self->_refreshedElements;
    uint64_t v13 = [v4 identifier];
    [(NSMutableSet *)refreshedElements addObject:v13];

    [(RELiveElementCoordinator *)self _queue_scheduleContentUpdate:0];
  }
  else
  {
    id v14 = RELogForDomain(7);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[RELiveElementCoordinator _queue_refreshElement:](v4);
    }
  }
}

uint64_t __50__RELiveElementCoordinator__queue_refreshElement___block_invoke()
{
  uint64_t result = _REGetIsInternalBuild();
  _isInternalDevice_6 = result;
  return result;
}

- (void)_queue_removeElement:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_controllerQueue);
  if (_fetchedInternalBuildOnceToken_6 != -1) {
    dispatch_once(&_fetchedInternalBuildOnceToken_6, &__block_literal_global_21_0);
  }
  if (_isInternalDevice_6)
  {
    uint64_t v5 = [v4 identifier];

    if (!v5) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Reproduced rdar://107396589: Attempted to remove element without an identifier: %@", v4 format];
    }
  }
  id v6 = RELogForDomain(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[RELiveElementCoordinator _queue_removeElement:](v4);
  }

  refreshedElements = self->_refreshedElements;
  id v8 = [v4 identifier];
  [(NSMutableSet *)refreshedElements removeObject:v8];

  remainingRemoveOperations = self->_remainingRemoveOperations;
  id v10 = [v4 identifier];
  [(NSCountedSet *)remainingRemoveOperations removeObject:v10];

  relevanceEngine = self->_relevanceEngine;
  id v12 = [v4 identifier];
  [(REElementRelevanceEngine *)relevanceEngine removeElement:v12];

  elementIdElementMap = self->_elementIdElementMap;
  id v14 = [v4 identifier];
  [(NSMutableDictionary *)elementIdElementMap removeObjectForKey:v14];
}

uint64_t __49__RELiveElementCoordinator__queue_removeElement___block_invoke()
{
  uint64_t result = _REGetIsInternalBuild();
  _isInternalDevice_6 = result;
  return result;
}

- (void)_queue_reload
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21E6E6000, log, OS_LOG_TYPE_DEBUG, "[LEC] Reached reload retry limit. Proceeding with reload", v1, 2u);
}

void __41__RELiveElementCoordinator__queue_reload__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "numberOfElementsInSection:");
  id v4 = [MEMORY[0x263EFF980] array];
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      id v6 = +[RESectionPath sectionPathWithSectionName:v10 element:i];
      id v7 = [*(id *)(*(void *)(a1 + 32) + 80) elementAtPath:v6];
      id v8 = [*(id *)(*(void *)(a1 + 32) + 88) objectForKeyedSubscript:v7];
      if (v8) {
        [v4 addObject:v8];
      }
    }
  }
  int v9 = (void *)[v4 copy];
  [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v10];
}

void __41__RELiveElementCoordinator__queue_reload__block_invoke_2(id *a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v2 = [a1[4] relevanceEngine];
  if (_fetchedInternalBuildOnceToken_6 != -1) {
    dispatch_once(&_fetchedInternalBuildOnceToken_6, &__block_literal_global_171);
  }
  if (_isInternalDevice_6)
  {
    int DisplayDebugProbabilities = __RE_Cached_Get__DisplayDebugProbabilities(v2);

    if (DisplayDebugProbabilities)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v31 = 0u;
      long long v30 = 0u;
      id obj = a1[5];
      uint64_t v21 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v21)
      {
        uint64_t v20 = *(void *)v31;
        do
        {
          uint64_t v4 = 0;
          do
          {
            if (*(void *)v31 != v20) {
              objc_enumerationMutation(obj);
            }
            uint64_t v22 = v4;
            uint64_t v5 = *(void *)(*((void *)&v30 + 1) + 8 * v4);
            long long v26 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            id v6 = [a1[5] objectForKeyedSubscript:v5];
            uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v7)
            {
              uint64_t v8 = v7;
              uint64_t v9 = *(void *)v27;
              do
              {
                for (uint64_t i = 0; i != v8; ++i)
                {
                  if (*(void *)v27 != v9) {
                    objc_enumerationMutation(v6);
                  }
                  __int16 v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
                  id v12 = [a1[4] _predictionForElement:v11];
                  uint64_t v13 = NSString;
                  [v12 probability];
                  id v15 = objc_msgSend(v13, "stringWithFormat:", @"%f", v14);
                  uint64_t v16 = [v11 content];
                  if ([v16 style] != 3 || objc_msgSend(v16, "style")) {
                    [v16 setStyle:0];
                  }
                  [v16 setDescription2TextProvider:0];
                  [v16 setDescription2Text:0];
                  uint64_t v17 = +[RESimpleTextContentProvider textContentProviderWithText:v15];
                  [v16 setDescription2TextContentProvider:v17];
                }
                uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
              }
              while (v8);
            }

            uint64_t v4 = v22 + 1;
          }
          while (v22 + 1 != v21);
          uint64_t v21 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v21);
      }
    }
  }
  else
  {
  }
  id v18 = a1[4];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __41__RELiveElementCoordinator__queue_reload__block_invoke_3;
  v23[3] = &unk_2644BDBF0;
  v23[4] = v18;
  id v24 = a1[5];
  id v25 = a1[6];
  [v18 performBatchUpdateBlock:v23];
}

void __41__RELiveElementCoordinator__queue_reload__block_invoke_3(id *a1)
{
  id v2 = [a1[4] displayElements];
  id v3 = [a1[4] relevanceEngine];
  if (_fetchedInternalBuildOnceToken_6 != -1) {
    dispatch_once(&_fetchedInternalBuildOnceToken_6, &__block_literal_global_171);
  }
  if (_isInternalDevice_6) {
    char DisplayDebugProbabilities = __RE_Cached_Get__DisplayDebugProbabilities(v3);
  }
  else {
    char DisplayDebugProbabilities = 0;
  }

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__RELiveElementCoordinator__queue_reload__block_invoke_4;
  v9[3] = &unk_2644BF910;
  id v10 = v2;
  id v5 = a1[4];
  id v6 = a1[5];
  char v14 = DisplayDebugProbabilities;
  id v7 = a1[4];
  id v11 = v6;
  id v12 = v7;
  id v13 = a1[6];
  id v8 = v2;
  [v5 _enumerateSectionsUsingBlock:v9];
}

void __41__RELiveElementCoordinator__queue_reload__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  id v5 = (void *)[v4 copy];

  id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v3];
  id v7 = (void *)[v6 copy];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __41__RELiveElementCoordinator__queue_reload__block_invoke_7;
  v21[3] = &__block_descriptor_33_e33_B24__0__REElement_8__REElement_16l;
  char v22 = *(unsigned char *)(a1 + 64);
  id v8 = (void *)MEMORY[0x223C31700](v21);
  uint64_t v9 = +[REArrayDiff diffFromElements:v5 toElements:v7 equalComparator:&__block_literal_global_35_0 hashGenerator:&__block_literal_global_38_1 changeComparator:v8];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __41__RELiveElementCoordinator__queue_reload__block_invoke_8;
  uint64_t v17 = &unk_2644BF8E8;
  uint64_t v10 = *(void *)(a1 + 48);
  id v11 = *(void **)(a1 + 56);
  id v18 = v3;
  uint64_t v19 = v10;
  id v20 = v11;
  id v12 = v3;
  id v13 = (void *)MEMORY[0x223C31700](&v14);
  objc_msgSend(v9, "enumerateOperationsUsingBlock:", v13, v14, v15, v16, v17);
}

uint64_t __41__RELiveElementCoordinator__queue_reload__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 identifier];
  id v6 = [v4 identifier];

  uint64_t v7 = [v5 isEqualToString:v6];
  return v7;
}

uint64_t __41__RELiveElementCoordinator__queue_reload__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = [a2 identifier];
  uint64_t v3 = [v2 hash];

  return v3;
}

uint64_t __41__RELiveElementCoordinator__queue_reload__block_invoke_7(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    return 1;
  }
  else {
    return objc_msgSend(a2, "isEqual:") ^ 1;
  }
}

void __41__RELiveElementCoordinator__queue_reload__block_invoke_8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v14 = a3;
  uint64_t v9 = +[RESectionPath sectionPathWithSectionName:*(void *)(a1 + 32) element:a4];
  uint64_t v10 = +[RESectionPath sectionPathWithSectionName:*(void *)(a1 + 32) element:a5];
  switch(a2)
  {
    case 0:
      id v11 = [v14 identifier];
      int v12 = [*(id *)(a1 + 48) containsObject:v11];
      id v13 = *(void **)(a1 + 40);
      if (v12) {
        [v13 refreshElement:v14 atPath:v9];
      }
      else {
        [v13 reloadElement:v14 atPath:v9];
      }

      break;
    case 1:
      [*(id *)(a1 + 40) insertElement:v14 atPath:v9];
      break;
    case 2:
      [*(id *)(a1 + 40) removeElement:v14 atPath:v10];
      break;
    case 3:
      [*(id *)(a1 + 40) moveElement:v14 fromPath:v10 toPath:v9];
      break;
    default:
      break;
  }
}

- (void)_queue_scheduleContentUpdate:(BOOL)a3
{
  [(RERelevanceEngineSubsystem *)self beginActivity:@"RERelevanceEngineSubsystemLoadingActivity" forObject:self];
  ++self->_scheduleCount;
  [(REUpNextScheduler *)self->_scheduler schedule];
  if (a3 || RETrainingSimulationIsCurrentlyActive())
  {
    self->_reloadImmediately = 1;
    scheduler = self->_scheduler;
    [(REUpNextScheduler *)scheduler performImmediately];
  }
}

- (void)relevanceEngine:(id)a3 performedBatchUpdates:(id)a4
{
}

- (void)relevanceEngine:(id)a3 didInsertElement:(id)a4 atPath:(id)a5
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_controllerQueue);
  uint64_t v7 = [(NSMutableDictionary *)self->_elementIdElementMap objectForKey:v6];
  if (v7)
  {
    [(RELiveElementCoordinator *)self _queue_scheduleContentUpdate:0];
  }
  else
  {
    id v8 = RELogForDomain(7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[RELiveElementCoordinator relevanceEngine:didInsertElement:atPath:]();
    }
  }
}

- (void)relevanceEngine:(id)a3 didRemoveElement:(id)a4 atPath:(id)a5
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_controllerQueue);
  uint64_t v7 = [(NSMutableDictionary *)self->_elementIdElementMap objectForKey:v6];
  if (v7)
  {
    [(RELiveElementCoordinator *)self _queue_scheduleContentUpdate:0];
  }
  else
  {
    id v8 = RELogForDomain(7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[RELiveElementCoordinator relevanceEngine:didRemoveElement:atPath:]();
    }
  }
}

- (void)relevanceEngine:(id)a3 didMoveElement:(id)a4 fromPath:(id)a5 toPath:(id)a6
{
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_controllerQueue);
  id v8 = [(NSMutableDictionary *)self->_elementIdElementMap objectForKey:v7];
  if (v8)
  {
    [(RELiveElementCoordinator *)self _queue_scheduleContentUpdate:0];
  }
  else
  {
    uint64_t v9 = RELogForDomain(7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[RELiveElementCoordinator relevanceEngine:didMoveElement:fromPath:toPath:]();
    }
  }
}

- (void)relevanceEngine:(id)a3 elementWasAdded:(id)a4
{
}

- (void)relevanceEngine:(id)a3 elementWasRemoved:(id)a4
{
}

- (void)relevanceEngine:(id)a3 didUpdateRelevanceOfElement:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_controllerQueue);
  id v6 = [(NSMutableDictionary *)self->_elementIdElementMap objectForKey:v5];
  if (v6)
  {
    id v7 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__RELiveElementCoordinator_relevanceEngine_didUpdateRelevanceOfElement___block_invoke;
    block[3] = &unk_2644BDBF0;
    block[4] = self;
    id v11 = v7;
    id v12 = v6;
    uint64_t v9 = v7;
    dispatch_async(callbackQueue, block);
  }
  else
  {
    uint64_t v9 = RELogForDomain(7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[RELiveElementCoordinator relevanceEngine:didUpdateRelevanceOfElement:]();
    }
  }
}

void __72__RELiveElementCoordinator_relevanceEngine_didUpdateRelevanceOfElement___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __72__RELiveElementCoordinator_relevanceEngine_didUpdateRelevanceOfElement___block_invoke_2;
  v3[3] = &unk_2644BF938;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 enumerateObservers:v3];
}

uint64_t __72__RELiveElementCoordinator_relevanceEngine_didUpdateRelevanceOfElement___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 relevanceEngine:*(void *)(a1 + 32) didUpdateRelevanceForElement:*(void *)(a1 + 40)];
}

- (void)_onqueue_async:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_refreshedElements, 0);
  objc_storeStrong((id *)&self->_remainingRemoveOperations, 0);
  objc_storeStrong((id *)&self->_remainingInsertOperations, 0);
  objc_storeStrong((id *)&self->_controllerQueue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_elementIdElementMap, 0);
  objc_storeStrong((id *)&self->_relevanceEngine, 0);
}

- (id)featureMapForElementId:(id)a3 trainingContext:(id)a4
{
  return [(REElementRelevanceEngine *)self->_relevanceEngine featureMapForElement:a3 trainingContext:a4];
}

- (id)featureMapForElement:(id)a3 trainingContext:(id)a4
{
  return [(REElementRelevanceEngine *)self->_relevanceEngine featureMapForPredictedElement:a3 trainingContext:a4];
}

- (id)elementForElementId:(id)a3
{
  controllerQueue = self->_controllerQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(controllerQueue);
  id v6 = [(NSMutableDictionary *)self->_elementIdElementMap objectForKeyedSubscript:v5];

  return v6;
}

- (void)_queue_addElement:(void *)a1 toSection:.cold.1(void *a1)
{
  v1 = [a1 identifier];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E6E6000, v2, v3, "[LEC]: Add element %@", v4, v5, v6, v7, v8);
}

- (void)_queue_reloadElement:(NSObject *)a1 .cold.1(NSObject *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v2 = [0 identifier];
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_21E6E6000, a1, OS_LOG_TYPE_ERROR, "previousElement is nil. Identifier is %@", v3, 0xCu);
}

- (void)_queue_reloadElement:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 identifier];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E6E6000, v2, v3, "Unable to reload element %@", v4, v5, v6, v7, v8);
}

- (void)_queue_reloadElement:(void *)a1 .cold.3(void *a1)
{
  v1 = [a1 identifier];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E6E6000, v2, v3, "[LEC]: Reload element %@", v4, v5, v6, v7, v8);
}

- (void)_queue_refreshElement:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 identifier];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E6E6000, v2, v3, "Unable to refresh element %@", v4, v5, v6, v7, v8);
}

- (void)_queue_refreshElement:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 identifier];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E6E6000, v2, v3, "[LEC]: Refresh element %@", v4, v5, v6, v7, v8);
}

- (void)_queue_removeElement:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 identifier];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E6E6000, v2, v3, "[LEC]: Remove element %@", v4, v5, v6, v7, v8);
}

- (void)relevanceEngine:didInsertElement:atPath:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_21E6E6000, v0, v1, "Unable to find element for id %@ (insert)", v2);
}

- (void)relevanceEngine:didRemoveElement:atPath:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_21E6E6000, v0, v1, "Unable to find element for id %@ (remove)", v2);
}

- (void)relevanceEngine:didMoveElement:fromPath:toPath:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_21E6E6000, v0, v1, "Unable to find element for id %@ (move)", v2);
}

- (void)relevanceEngine:didUpdateRelevanceOfElement:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_21E6E6000, v0, v1, "Unable to find element for id %@ (relevance update)", v2);
}

@end