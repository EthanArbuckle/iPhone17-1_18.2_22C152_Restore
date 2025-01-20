@interface TFDataAggregator
- (OS_dispatch_queue)aggregationQueue;
- (TFDataAggregator)initWithSessionDataContainer:(id)a3;
- (TFDataAggregatorDelegate)delegate;
- (TFFeedbackDataContainer)sessionDataContainer;
- (id)_loadAndExtractDataForTasks:(id)a3 intoDataContainer:(id)a4;
- (void)_finishUpdatingDataContainer:(id)a3 byMergingDataContainer:(id)a4 forTasks:(id)a5;
- (void)_prepareDestinationDataContainer:(id)a3 forTasks:(id)a4;
- (void)runTasks:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation TFDataAggregator

- (TFDataAggregator)initWithSessionDataContainer:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TFDataAggregator;
  v6 = [(TFDataAggregator *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sessionDataContainer, a3);
    uint64_t v8 = dispatch_get_global_queue(0, 0);
    aggregationQueue = v7->_aggregationQueue;
    v7->_aggregationQueue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (void)runTasks:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = AMSGenerateLogCorrelationKey();
  v6 = +[TFLogConfiguration defaultConfiguration];
  v7 = [v6 generatedLogger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v19 = objc_opt_class();
    __int16 v20 = 2114;
    v21 = v5;
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_impl(&dword_223064000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] runTasks: tasks=%@", buf, 0x20u);
  }

  [(TFDataAggregator *)self _validateProvidedIdentifiersForTasks:v4];
  uint64_t v8 = [(TFDataAggregator *)self sessionDataContainer];
  [(TFDataAggregator *)self _prepareDestinationDataContainer:v8 forTasks:v4];

  v9 = [[TFFeedbackDataContainer alloc] initWithName:@"tasks"];
  v10 = [(TFDataAggregator *)self _loadAndExtractDataForTasks:v4 intoDataContainer:v9];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __29__TFDataAggregator_runTasks___block_invoke;
  v14[3] = &unk_26468E840;
  v14[4] = self;
  v15 = v9;
  id v16 = v4;
  id v17 = v5;
  id v11 = v5;
  id v12 = v4;
  v13 = v9;
  [v10 addFinishBlock:v14];
}

void __29__TFDataAggregator_runTasks___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  v3 = [v2 sessionDataContainer];
  [v2 _finishUpdatingDataContainer:v3 byMergingDataContainer:*(void *)(a1 + 40) forTasks:*(void *)(a1 + 48)];

  id v4 = +[TFLogConfiguration defaultConfiguration];
  id v5 = [v4 generatedLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    v9 = [*(id *)(a1 + 40) debugDescription];
    v10 = [*(id *)(a1 + 32) sessionDataContainer];
    id v11 = [v10 debugDescription];
    int v12 = 138544386;
    uint64_t v13 = v6;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_223064000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] runTasks completed: tasks=%@, taskDataContainer=%@ sessionDataContainer=%@", (uint8_t *)&v12, 0x34u);
  }
}

- (void)_prepareDestinationDataContainer:(id)a3 forTasks:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__TFDataAggregator__prepareDestinationDataContainer_forTasks___block_invoke;
  v7[3] = &unk_26468E7D8;
  id v8 = v5;
  id v6 = v5;
  [a3 performBatchUpdates:v7];
}

void __62__TFDataAggregator__prepareDestinationDataContainer_forTasks___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        v10 = objc_msgSend(v9, "providedEntryIdentifiers", 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v16;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v16 != v13) {
                objc_enumerationMutation(v10);
              }
              [v3 setEntryLoadingForIdentifier:*(void *)(*((void *)&v15 + 1) + 8 * v14++) toValue:1];
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }
}

- (void)_finishUpdatingDataContainer:(id)a3 byMergingDataContainer:(id)a4 forTasks:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __81__TFDataAggregator__finishUpdatingDataContainer_byMergingDataContainer_forTasks___block_invoke;
  v15[3] = &unk_26468E868;
  id v10 = v9;
  id v16 = v10;
  id v17 = v8;
  id v11 = v8;
  [a3 performBatchUpdates:v15];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __81__TFDataAggregator__finishUpdatingDataContainer_byMergingDataContainer_forTasks___block_invoke_2;
  v13[3] = &unk_26468E890;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  dispatch_async(MEMORY[0x263EF83A0], v13);
}

void __81__TFDataAggregator__finishUpdatingDataContainer_byMergingDataContainer_forTasks___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v10 = objc_msgSend(v9, "providedEntryIdentifiers", 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v16;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v16 != v13) {
                objc_enumerationMutation(v10);
              }
              [v3 setEntryLoadingForIdentifier:*(void *)(*((void *)&v15 + 1) + 8 * v14++) toValue:0];
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }

  [v3 overwriteWithContentsOfDataContainer:*(void *)(a1 + 40)];
}

void __81__TFDataAggregator__finishUpdatingDataContainer_byMergingDataContainer_forTasks___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 dataAggregator:*(void *)(a1 + 32) didCompleteTasks:*(void *)(a1 + 40)];
}

- (id)_loadAndExtractDataForTasks:(id)a3 intoDataContainer:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v14 = objc_alloc_init(MEMORY[0x263F27E10]);
        [v8 addObject:v14];
        long long v15 = [(TFDataAggregator *)self aggregationQueue];
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __66__TFDataAggregator__loadAndExtractDataForTasks_intoDataContainer___block_invoke;
        v20[3] = &unk_26468E8B8;
        v20[4] = v13;
        id v21 = v7;
        id v22 = v14;
        id v16 = v14;
        [v13 loadDataOnQueue:v15 withCompletionHandler:v20];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  long long v17 = [MEMORY[0x263F27E10] promiseWithAll:v8];

  return v17;
}

void __66__TFDataAggregator__loadAndExtractDataForTasks_intoDataContainer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[TFLogConfiguration defaultConfiguration];
    uint64_t v8 = [v7 generatedLogger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = *(void **)(a1 + 32);
      id v11 = v9;
      uint64_t v12 = [v10 name];
      uint64_t v13 = [*(id *)(a1 + 32) logKey];
      int v14 = 138544130;
      long long v15 = v9;
      __int16 v16 = 2112;
      long long v17 = v12;
      __int16 v18 = 2112;
      long long v19 = v13;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_223064000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%@:%@] Data aggregation failed with error: %@", (uint8_t *)&v14, 0x2Au);
    }
  }
  [*(id *)(a1 + 32) extractDataPropertiesFromData:v5 intoDataContainer:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) finishWithResult:&unk_26D61BBB0];
}

- (TFFeedbackDataContainer)sessionDataContainer
{
  return self->_sessionDataContainer;
}

- (TFDataAggregatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TFDataAggregatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)aggregationQueue
{
  return self->_aggregationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregationQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_sessionDataContainer, 0);
}

@end