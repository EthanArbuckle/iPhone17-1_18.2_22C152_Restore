@interface SUUIMediaQueryEvaluator
+ (void)initialize;
+ (void)registerFeatureClass:(Class)a3;
- (BOOL)evaluateMediaQuery:(id)a3;
- (SUUIMediaQueryDelegate)delegate;
- (SUUIMediaQueryEvaluator)init;
- (id)_delegateValuesForKeys:(id)a3;
- (void)_featureDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)reloadData;
- (void)setDelegate:(id)a3;
@end

@implementation SUUIMediaQueryEvaluator

- (SUUIMediaQueryEvaluator)init
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIMediaQueryEvaluator;
  v2 = [(SUUIMediaQueryEvaluator *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    cachedFeatureResults = v2->_cachedFeatureResults;
    v2->_cachedFeatureResults = (NSMapTable *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    observedNotificationNames = v2->_observedNotificationNames;
    v2->_observedNotificationNames = v5;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_observedNotificationNames;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 removeObserver:self name:*(void *)(*((void *)&v11 + 1) + 8 * v8++) object:0];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  reloadTimer = self->_reloadTimer;
  if (reloadTimer) {
    dispatch_source_cancel(reloadTimer);
  }

  v10.receiver = self;
  v10.super_class = (Class)SUUIMediaQueryEvaluator;
  [(SUUIMediaQueryEvaluator *)&v10 dealloc];
}

+ (void)registerFeatureClass:(Class)a3
{
  v4 = (void *)sClassSet;
  if (!sClassSet)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    uint64_t v6 = (void *)sClassSet;
    sClassSet = (uint64_t)v5;

    v4 = (void *)sClassSet;
  }
  [v4 addObject:a3];
}

- (BOOL)evaluateMediaQuery:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v8 = [v4 featureValues];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __46__SUUIMediaQueryEvaluator_evaluateMediaQuery___block_invoke;
  v33[3] = &unk_2654087C8;
  id v9 = v5;
  id v34 = v9;
  id v10 = v6;
  id v35 = v10;
  v36 = self;
  long long v11 = self;
  id v12 = v7;
  id v37 = v12;
  [v8 enumerateKeysAndObjectsUsingBlock:v33];

  if ([v9 count])
  {
    if ([v10 count])
    {
      long long v13 = [(SUUIMediaQueryEvaluator *)v11 _delegateValuesForKeys:v10];
    }
    else
    {
      long long v13 = 0;
    }
    id v24 = v12;
    id v25 = v10;
    id v26 = v9;
    id v27 = v4;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = v9;
    uint64_t v15 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v30;
      char v14 = 1;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v20 = [v19 evaluateWithValues:v13];
          cachedFeatureResults = v11->_cachedFeatureResults;
          v22 = [NSNumber numberWithBool:v20];
          [(NSMapTable *)cachedFeatureResults setObject:v22 forKey:v19];

          v14 &= v20;
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v16);
    }
    else
    {
      char v14 = 1;
    }

    id v9 = v26;
    id v4 = v27;
    id v12 = v24;
    id v10 = v25;
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

void __46__SUUIMediaQueryEvaluator_evaluateMediaQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = (id)sClassSet;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(objc_class **)(*((void *)&v19 + 1) + 8 * i);
        if ([(objc_class *)v12 supportsFeatureName:v5])
        {
          long long v13 = (void *)[[v12 alloc] initWithFeatureName:v5 value:v6];
          [*(id *)(a1 + 32) addObject:v13];
          char v14 = [v13 requiredKeys];
          if (v14) {
            [*(id *)(a1 + 40) addObjectsFromArray:v14];
          }
          uint64_t v15 = [v13 notificationNames];
          v17[0] = MEMORY[0x263EF8330];
          v17[1] = 3221225472;
          v17[2] = __46__SUUIMediaQueryEvaluator_evaluateMediaQuery___block_invoke_2;
          v17[3] = &unk_2654061A8;
          uint64_t v16 = *(void **)(a1 + 56);
          v17[4] = *(void *)(a1 + 48);
          id v18 = v16;
          [v15 enumerateObjectsUsingBlock:v17];

          goto LABEL_13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

void __46__SUUIMediaQueryEvaluator_evaluateMediaQuery___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "containsObject:") & 1) == 0)
  {
    [*(id *)(a1 + 40) addObserver:*(void *)(a1 + 32) selector:sel__featureDidChangeNotification_ name:v3 object:0];
    [*(id *)(*(void *)(a1 + 32) + 24) addObject:v3];
  }
}

- (void)reloadData
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = (void *)[(NSMapTable *)self->_cachedFeatureResults copy];
  [(NSMapTable *)self->_cachedFeatureResults removeAllObjects];
  reloadTimer = self->_reloadTimer;
  if (reloadTimer)
  {
    dispatch_source_cancel(reloadTimer);
    id v5 = self->_reloadTimer;
    self->_reloadTimer = 0;
  }
  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v33 + 1) + 8 * i) requiredKeys];
        if (v12) {
          [v6 addObjectsFromArray:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v9);
  }

  if ([v6 count])
  {
    v28 = [(SUUIMediaQueryEvaluator *)self _delegateValuesForKeys:v6];
  }
  else
  {
    v28 = 0;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
  id WeakRetained = v13;
  if (!v14) {
    goto LABEL_25;
  }
  uint64_t v16 = v14;
  id v27 = v6;
  uint64_t v17 = self;
  char v18 = 0;
  uint64_t v19 = *(void *)v30;
  do
  {
    for (uint64_t j = 0; j != v16; ++j)
    {
      if (*(void *)v30 != v19) {
        objc_enumerationMutation(v13);
      }
      long long v21 = *(void **)(*((void *)&v29 + 1) + 8 * j);
      uint64_t v22 = objc_msgSend(v21, "evaluateWithValues:", v28, v27);
      v23 = [v13 objectForKey:v21];
      int v24 = v22 ^ [v23 BOOLValue];

      v18 |= v24;
      cachedFeatureResults = v17->_cachedFeatureResults;
      id v26 = [NSNumber numberWithBool:v22];
      [(NSMapTable *)cachedFeatureResults setObject:v26 forKey:v21];
    }
    uint64_t v16 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
  }
  while (v16);

  id v6 = v27;
  if (v18)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v17->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained mediaQueryEvaluatorDidChange:v17];
    }
LABEL_25:
  }
}

- (void)_featureDidChangeNotification:(id)a3
{
  id v4 = MEMORY[0x263EF83A0];
  id v5 = MEMORY[0x263EF83A0];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__SUUIMediaQueryEvaluator__featureDidChangeNotification___block_invoke;
  v6[3] = &unk_265400890;
  v6[4] = self;
  id v7 = v4;
  dispatch_async(v4, v6);
}

void __57__SUUIMediaQueryEvaluator__featureDidChangeNotification___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 32))
  {
    dispatch_source_t v2 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *(dispatch_queue_t *)(a1 + 40));
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = v2;

    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    dispatch_time_t v6 = dispatch_time(0, 3000000000);
    dispatch_source_set_timer(v5, v6, 0, 0);
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __57__SUUIMediaQueryEvaluator__featureDidChangeNotification___block_invoke_2;
    v8[3] = &unk_265401538;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler(v7, v8);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 32));
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __57__SUUIMediaQueryEvaluator__featureDidChangeNotification___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadData];
}

- (id)_delegateValuesForKeys:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          id v13 = objc_msgSend(WeakRetained, "mediaQueryEvaluator:valueForKey:", self, v12, (void)v15);
          if (v13) {
            [v5 setObject:v13 forKey:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 registerFeatureClass:objc_opt_class()];
    uint64_t v3 = objc_opt_class();
    [a1 registerFeatureClass:v3];
  }
}

- (SUUIMediaQueryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIMediaQueryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reloadTimer, 0);
  objc_storeStrong((id *)&self->_observedNotificationNames, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedFeatureResults, 0);
}

@end