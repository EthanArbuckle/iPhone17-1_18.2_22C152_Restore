@interface REPredictorManager
- (REPredictorManager)initWithPredictors:(id)a3 featureSet:(id)a4 relevanceEngine:(id)a5;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)enumeratePredictors:(id)a3;
- (void)enumerateValuesForElement:(id)a3 trainingContext:(id)a4 usingBlock:(id)a5;
- (void)pause;
- (void)predictor:(id)a3 didBeginActivity:(id)a4;
- (void)predictor:(id)a3 didFinishActivity:(id)a4;
- (void)predictorDidUpdate:(id)a3;
- (void)removeObserver:(id)a3;
- (void)resume;
@end

@implementation REPredictorManager

- (REPredictorManager)initWithPredictors:(id)a3 featureSet:(id)a4 relevanceEngine:(id)a5
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v57.receiver = self;
  v57.super_class = (Class)REPredictorManager;
  id v10 = a5;
  v11 = [(REPredictorManager *)&v57 init];
  v12 = v11;
  if (v11)
  {
    v38 = v11;
    location = (id *)&v11->_engine;
    id v44 = v10;
    objc_storeWeak((id *)&v11->_engine, v10);
    v13 = [MEMORY[0x263EFF9C0] set];
    v14 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v39 = v8;
    obuint64_t j = v8;
    uint64_t v43 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
    if (v43)
    {
      uint64_t v42 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v54 != v42) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v53 + 1) + 8 * i);
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          v17 = [(id)objc_opt_class() supportedFeatures];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v49 objects:v59 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v50;
            do
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v50 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void *)(*((void *)&v49 + 1) + 8 * j);
                if ([v9 containsFeature:v22])
                {
                  [v14 setObject:v16 forKeyedSubscript:v22];
                  [v13 addObject:v16];
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v49 objects:v59 count:16];
            }
            while (v19);
          }
        }
        uint64_t v43 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
      }
      while (v43);
    }

    uint64_t v23 = [v13 allObjects];
    v12 = v38;
    predictors = v38->_predictors;
    v38->_predictors = (NSArray *)v23;

    uint64_t v25 = [v14 copy];
    predictorsMap = v38->_predictorsMap;
    v38->_predictorsMap = (NSDictionary *)v25;

    v27 = objc_alloc_init(REObserverStore);
    observer = v38->_observer;
    v38->_observer = v27;

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v29 = v38->_predictors;
    uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v45 objects:v58 count:16];
    id v10 = v44;
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v46;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v46 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v45 + 1) + 8 * k);
          if (v10)
          {
            id WeakRetained = objc_loadWeakRetained(location);
            [v34 addRelevanceEngine:WeakRetained];

            id v10 = v44;
          }
          [v34 addObserver:v38];
          v36 = [v10 logger];
          [v36 addLoggable:v34];

          id v10 = v44;
        }
        uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v45 objects:v58 count:16];
      }
      while (v31);
    }

    id v8 = v39;
  }

  return v12;
}

- (void)enumeratePredictors:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void))a3;
  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = self->_predictors;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
          v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)addObserver:(id)a3
{
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = self->_predictors;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v8 removeObserver:self];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
        [v8 removeRelevanceEngine:WeakRetained];

        id v10 = objc_loadWeakRetained((id *)&self->_engine);
        long long v11 = [v10 logger];
        [v11 removeLoggable:v8];
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  v12.receiver = self;
  v12.super_class = (Class)REPredictorManager;
  [(REPredictorManager *)&v12 dealloc];
}

- (void)enumerateValuesForElement:(id)a3 trainingContext:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    predictorsMap = self->_predictorsMap;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __75__REPredictorManager_enumerateValuesForElement_trainingContext_usingBlock___block_invoke;
    v12[3] = &unk_2644BE450;
    id v13 = v8;
    long long v14 = self;
    id v15 = v9;
    id v16 = v10;
    [(NSDictionary *)predictorsMap enumerateKeysAndObjectsUsingBlock:v12];
  }
}

void __75__REPredictorManager_enumerateValuesForElement_trainingContext_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__8;
  v29 = __Block_byref_object_dispose__8;
  id v30 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __75__REPredictorManager_enumerateValuesForElement_trainingContext_usingBlock___block_invoke_5;
  v18[3] = &unk_2644BE428;
  v24 = &v25;
  id v7 = v6;
  id v19 = v7;
  id v8 = v5;
  id v20 = v8;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  long long v11 = *(void **)(a1 + 48);
  id v21 = v9;
  uint64_t v22 = v10;
  id v23 = v11;
  [v7 onQueueSync:v18];
  uint64_t v17 = v26[5];
  if (v17) {
    (*(void (**)(void, id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56)
  }
                                                                                             + 16))(*(void *)(a1 + 56), v8, v17, v12, v13, v14, v15, v16);

  _Block_object_dispose(&v25, 8);
}

void __75__REPredictorManager_enumerateValuesForElement_trainingContext_usingBlock___block_invoke_5(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[7] + 32));
  uint64_t v5 = [v2 featureValueForFeature:v3 element:v4 engine:WeakRetained trainingContext:a1[8]];
  uint64_t v6 = *(void *)(a1[9] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)resume
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = self->_predictors;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    uint64_t v5 = MEMORY[0x263EF8330];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_initWeak(&location, v7);
        v8[0] = v5;
        v8[1] = 3221225472;
        v8[2] = __28__REPredictorManager_resume__block_invoke;
        v8[3] = &unk_2644BC638;
        objc_copyWeak(&v9, &location);
        [v7 onQueue:v8];
        objc_destroyWeak(&v9);
        objc_destroyWeak(&location);
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }
}

void __28__REPredictorManager_resume__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained beginUpdates];
}

- (void)pause
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = self->_predictors;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    uint64_t v5 = MEMORY[0x263EF8330];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_initWeak(&location, v7);
        v8[0] = v5;
        v8[1] = 3221225472;
        v8[2] = __27__REPredictorManager_pause__block_invoke;
        v8[3] = &unk_2644BC638;
        objc_copyWeak(&v9, &location);
        [v7 onQueue:v8];
        objc_destroyWeak(&v9);
        objc_destroyWeak(&location);
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }
}

void __27__REPredictorManager_pause__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained endUpdates];
}

- (void)removeObserver:(id)a3
{
}

- (void)predictorDidUpdate:(id)a3
{
  id v4 = a3;
  observer = self->_observer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__REPredictorManager_predictorDidUpdate___block_invoke;
  v7[3] = &unk_2644BE478;
  id v8 = v4;
  id v6 = v4;
  [(REObserverStore *)observer enumerateObserversWithBlock:v7];
}

void __41__REPredictorManager_predictorDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 predictorDidUpdate:*(void *)(a1 + 32)];
  }
}

- (void)predictor:(id)a3 didBeginActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  observer = self->_observer;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__REPredictorManager_predictor_didBeginActivity___block_invoke;
  v11[3] = &unk_2644BE4A0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(REObserverStore *)observer enumerateObserversWithBlock:v11];
}

void __49__REPredictorManager_predictor_didBeginActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 predictor:*(void *)(a1 + 32) didBeginActivity:*(void *)(a1 + 40)];
  }
}

- (void)predictor:(id)a3 didFinishActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  observer = self->_observer;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__REPredictorManager_predictor_didFinishActivity___block_invoke;
  v11[3] = &unk_2644BE4A0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(REObserverStore *)observer enumerateObserversWithBlock:v11];
}

void __50__REPredictorManager_predictor_didFinishActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 predictor:*(void *)(a1 + 32) didFinishActivity:*(void *)(a1 + 40)];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engine);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_predictorsMap, 0);
  objc_storeStrong((id *)&self->_predictors, 0);
}

@end