@interface WFWidgetCache
+ (WFWidgetCache)sharedCache;
- (NSMutableDictionary)resultsByIdentifier;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (WFWidgetCache)init;
- (WFWidgetWorkflowRequestQueue)requestQueue;
- (id)widgetWorkflowWithIdentifier:(id)a3;
- (id)widgetWorkflowsInCollectionWithIdentifier:(id)a3 limit:(unint64_t)a4;
- (void)observableResultDidChange:(id)a3;
- (void)queue_getWidgetWorkflowWithIdentifier:(id)a3;
- (void)queue_getWidgetWorkflowsInCollectionWithIdentifier:(id)a3 limit:(unint64_t)a4;
- (void)queue_notifyObserversOfChange:(id)a3 forIdentifier:(id)a4;
- (void)queue_storeAndNotifyWithResult:(id)a3 forIdentifier:(id)a4 resultsLimit:(unint64_t)a5;
@end

@implementation WFWidgetCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_resultsByIdentifier, 0);
}

- (OS_os_log)log
{
  return self->_log;
}

- (WFWidgetWorkflowRequestQueue)requestQueue
{
  return self->_requestQueue;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)resultsByIdentifier
{
  return self->_resultsByIdentifier;
}

- (WFWidgetCache)init
{
  v15.receiver = self;
  v15.super_class = (Class)WFWidgetCache;
  v2 = [(WFWidgetCache *)&v15 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    resultsByIdentifier = v2->_resultsByIdentifier;
    v2->_resultsByIdentifier = (NSMutableDictionary *)v3;

    v5 = objc_alloc_init(WFWidgetWorkflowRequestQueue);
    requestQueue = v2->_requestQueue;
    v2->_requestQueue = v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.shortcuts.widget", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    os_log_t v11 = os_log_create("com.apple.shortcuts", "WidgetCache");
    log = v2->_log;
    v2->_log = (OS_os_log *)v11;

    v13 = v2;
  }

  return v2;
}

- (void)observableResultDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(WFWidgetCache *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__WFWidgetCache_observableResultDidChange___block_invoke;
  v7[3] = &unk_2642A5EC8;
  id v8 = v4;
  dispatch_queue_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __43__WFWidgetCache_observableResultDidChange___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v3 = v2;
    }
    else {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  id v5 = *(id *)(a1 + 32);
  if (!v5)
  {
    if (!v4) {
      goto LABEL_20;
    }
    id v8 = 0;
LABEL_18:
    id v11 = [v4 value];
    v12 = [v11 identifier];
    uint64_t v13 = 1;
    id v6 = v8;
LABEL_19:

    goto LABEL_21;
  }
  id v6 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v4) {
    goto LABEL_18;
  }
  if (v8)
  {
    dispatch_queue_t v9 = [v8 query];
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v10 = v9;
      }
      else {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
    id v11 = v10;

    v12 = [v11 folderIdentifier];
    uint64_t v13 = [v11 resultsLimit];
    if (v11)
    {
      objc_super v15 = [v11 folderIdentifier];

      if (!v15)
      {
        v16 = @"MyShortcuts";

        v12 = @"MyShortcuts";
      }
    }
    goto LABEL_19;
  }
LABEL_20:
  id v6 = 0;
  uint64_t v13 = 0;
  v12 = 0;
LABEL_21:
  v14 = [*(id *)(a1 + 40) log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    v18 = v12;
    _os_log_impl(&dword_2177E0000, v14, OS_LOG_TYPE_DEFAULT, "Received observable result change for identifier: %@", (uint8_t *)&v17, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "queue_storeAndNotifyWithResult:forIdentifier:resultsLimit:", *(void *)(a1 + 32), v12, v13);
}

- (void)queue_notifyObserversOfChange:(id)a3 forIdentifier:(id)a4
{
  v26[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFWidgetCache *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = v6;
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;

    id v12 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    id v14 = v13;

    if (v11)
    {
      objc_super v15 = [v11 value];
      v26[0] = v15;
      v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];

      goto LABEL_12;
    }
  }
  else
  {
    id v14 = 0;
  }
  v16 = [v14 values];
  id v12 = 0;
LABEL_12:
  int v17 = [(WFWidgetCache *)self log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v16;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl(&dword_2177E0000, v17, OS_LOG_TYPE_DEFAULT, "Posting notification with workflows: %@ for identifier: %@", buf, 0x16u);
  }

  v18 = [MEMORY[0x263F08A00] defaultCenter];
  v20 = @"WFWidgetCacheAssociatedIdentifier";
  id v21 = v7;
  uint64_t v19 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  [v18 postNotificationName:@"WFWidgetCacheUpdateNotification" object:v16 userInfo:v19];
}

- (void)queue_storeAndNotifyWithResult:(id)a3 forIdentifier:(id)a4 resultsLimit:(unint64_t)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [(WFWidgetCache *)self queue];
  dispatch_assert_queue_V2(v10);

  if (!v8 || !v9) {
    goto LABEL_42;
  }
  id v11 = v8;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = v13;

  id v15 = v11;
  objc_opt_class();
  char v16 = objc_opt_isKindOfClass();
  if (v16) {
    int v17 = v15;
  }
  else {
    int v17 = 0;
  }
  id v18 = v17;

  if (isKindOfClass)
  {
    [v15 addResultObserver:self];
    uint64_t v19 = [(WFWidgetCache *)self resultsByIdentifier];
    [v19 setObject:v15 forKey:v9];

    v20 = [(WFWidgetCache *)self log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v35 = 138412546;
      id v36 = v15;
      __int16 v37 = 2112;
      id v38 = v9;
      _os_log_impl(&dword_2177E0000, v20, OS_LOG_TYPE_DEFAULT, "Storing single object result: %@ for identifier: %@", (uint8_t *)&v35, 0x16u);
    }
    goto LABEL_35;
  }
  if (v16)
  {
    id v21 = [(WFWidgetCache *)self resultsByIdentifier];
    v22 = [v21 objectForKey:v9];

    if (v22)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v23 = v22;
      }
      else {
        v23 = 0;
      }
    }
    else
    {
      v23 = 0;
    }
    v20 = v23;

    __int16 v24 = [v20 query];
    if (v24)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v25 = v24;
      }
      else {
        id v25 = 0;
      }
    }
    else
    {
      id v25 = 0;
    }
    id v26 = v25;

    v27 = [(WFWidgetCache *)self log];
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v20 && v26)
    {
      if (v28)
      {
        int v35 = 138412290;
        id v36 = v9;
        _os_log_impl(&dword_2177E0000, v27, OS_LOG_TYPE_DEFAULT, "Cached result found for collection with identifier: %@", (uint8_t *)&v35, 0xCu);
      }

      if ([v26 resultsLimit] >= a5) {
        goto LABEL_34;
      }
      v29 = [(WFWidgetCache *)self log];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        int v35 = 138412546;
        id v36 = v15;
        __int16 v37 = 2112;
        id v38 = v9;
        _os_log_impl(&dword_2177E0000, v29, OS_LOG_TYPE_DEFAULT, "New results limit is more than cached results limit, removing old cached result and storing the new one: %@, identifier: %@", (uint8_t *)&v35, 0x16u);
      }

      [v20 removeResultObserver:self];
      v27 = [(WFWidgetCache *)self resultsByIdentifier];
      [v27 removeObjectForKey:v9];
    }
    else if (v28)
    {
      int v35 = 138412546;
      id v36 = v15;
      __int16 v37 = 2112;
      id v38 = v9;
      _os_log_impl(&dword_2177E0000, v27, OS_LOG_TYPE_DEFAULT, "No cache hit, storing collection result: %@ for identifier: %@", (uint8_t *)&v35, 0x16u);
    }

    [v15 addResultObserver:self];
    v30 = [(WFWidgetCache *)self resultsByIdentifier];
    [v30 setObject:v15 forKey:v9];

LABEL_34:
LABEL_35:
  }
  v31 = [(WFWidgetCache *)self resultsByIdentifier];
  v32 = [v31 objectForKey:v9];

  if (v32)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v33 = v32;
    }
    else {
      v33 = 0;
    }
  }
  else
  {
    v33 = 0;
  }
  id v34 = v33;

  [(WFWidgetCache *)self queue_notifyObserversOfChange:v34 forIdentifier:v9];
LABEL_42:
}

- (void)queue_getWidgetWorkflowsInCollectionWithIdentifier:(id)a3 limit:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(WFWidgetCache *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(WFWidgetCache *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_2177E0000, v8, OS_LOG_TYPE_DEFAULT, "Requesting widget workflow collection with identifier: %@", buf, 0xCu);
  }

  id v9 = [(WFWidgetCache *)self requestQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__WFWidgetCache_queue_getWidgetWorkflowsInCollectionWithIdentifier_limit___block_invoke;
  v11[3] = &unk_2642A5E68;
  v11[4] = self;
  id v12 = v6;
  unint64_t v13 = a4;
  id v10 = v6;
  [v9 getWidgetWorkflowsInCollectionWithIdentifier:v10 limit:a4 completionHandler:v11];
}

void __74__WFWidgetCache_queue_getWidgetWorkflowsInCollectionWithIdentifier_limit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    id v16 = v3;
    __int16 v17 = 2112;
    uint64_t v18 = v5;
    _os_log_impl(&dword_2177E0000, v4, OS_LOG_TYPE_DEFAULT, "Received result %@ for identifier: %@", buf, 0x16u);
  }

  id v6 = [*(id *)(a1 + 32) queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__WFWidgetCache_queue_getWidgetWorkflowsInCollectionWithIdentifier_limit___block_invoke_67;
  v11[3] = &unk_2642A5E40;
  id v7 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v3;
  id v8 = v7;
  uint64_t v9 = *(void *)(a1 + 48);
  id v13 = v8;
  uint64_t v14 = v9;
  id v10 = v3;
  dispatch_async(v6, v11);
}

uint64_t __74__WFWidgetCache_queue_getWidgetWorkflowsInCollectionWithIdentifier_limit___block_invoke_67(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_storeAndNotifyWithResult:forIdentifier:resultsLimit:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)queue_getWidgetWorkflowWithIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(WFWidgetCache *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(WFWidgetCache *)self log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_2177E0000, v6, OS_LOG_TYPE_DEFAULT, "Requesting widget workflow with identifier: %@", buf, 0xCu);
  }

  id v7 = [(WFWidgetCache *)self requestQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__WFWidgetCache_queue_getWidgetWorkflowWithIdentifier___block_invoke;
  v9[3] = &unk_2642A5E18;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 getWidgetWorkflowWithIdentifier:v8 completionHandler:v9];
}

void __55__WFWidgetCache_queue_getWidgetWorkflowWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    id v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_impl(&dword_2177E0000, v4, OS_LOG_TYPE_DEFAULT, "Received result %@ for identifier: %@", buf, 0x16u);
  }

  id v6 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__WFWidgetCache_queue_getWidgetWorkflowWithIdentifier___block_invoke_65;
  block[3] = &unk_2642A5DF0;
  id v7 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, block);
}

uint64_t __55__WFWidgetCache_queue_getWidgetWorkflowWithIdentifier___block_invoke_65(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_storeAndNotifyWithResult:forIdentifier:resultsLimit:", *(void *)(a1 + 40), *(void *)(a1 + 48), 1);
}

- (id)widgetWorkflowsInCollectionWithIdentifier:(id)a3 limit:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = [(WFWidgetCache *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a4;
    _os_log_impl(&dword_2177E0000, v8, OS_LOG_TYPE_DEFAULT, "Requesting widget workflow collection for identifier: %@, limit: %lu", buf, 0x16u);
  }

  if (!v7)
  {
    __int16 v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFWidgetCache.m", 54, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  uint64_t v9 = [(WFWidgetCache *)self queue];
  dispatch_assert_queue_not_V2(v9);

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  id v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  id v10 = [(WFWidgetCache *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__WFWidgetCache_widgetWorkflowsInCollectionWithIdentifier_limit___block_invoke;
  block[3] = &unk_2642A5DC8;
  block[4] = self;
  id v16 = v7;
  __int16 v17 = buf;
  unint64_t v18 = a4;
  id v11 = v7;
  dispatch_sync(v10, block);

  id v12 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v12;
}

void __65__WFWidgetCache_widgetWorkflowsInCollectionWithIdentifier_limit___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) resultsByIdentifier];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 query];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = [v5 values];
  id v10 = v9;
  if (v9 && v8)
  {
    unint64_t v11 = [v8 resultsLimit];
    unint64_t v12 = *(void *)(a1 + 56);

    if (v11 >= v12)
    {
      id v13 = [*(id *)(a1 + 32) log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 40);
        int v20 = 138412290;
        uint64_t v21 = v14;
        _os_log_impl(&dword_2177E0000, v13, OS_LOG_TYPE_DEFAULT, "Found cached widget workflow collection for id: %@", (uint8_t *)&v20, 0xCu);
      }

      uint64_t v15 = [v5 values];
      uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
      __int16 v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      goto LABEL_21;
    }
  }
  else
  {
  }
  unint64_t v18 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 40);
    int v20 = 138412290;
    uint64_t v21 = v19;
    _os_log_impl(&dword_2177E0000, v18, OS_LOG_TYPE_DEFAULT, "No cached widget workflow collection for %@ found, kicking off a request", (uint8_t *)&v20, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue_getWidgetWorkflowsInCollectionWithIdentifier:limit:", *(void *)(a1 + 40), *(void *)(a1 + 56));
LABEL_21:
}

- (id)widgetWorkflowWithIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(WFWidgetCache *)self log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_2177E0000, v6, OS_LOG_TYPE_DEFAULT, "Requesting widget workflow for identifier: %@", (uint8_t *)&buf, 0xCu);
  }

  if (!v5)
  {
    unint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFWidgetCache.m", 34, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  id v7 = [(WFWidgetCache *)self queue];
  dispatch_assert_queue_not_V2(v7);

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v17 = 0x3032000000;
  unint64_t v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  id v8 = [(WFWidgetCache *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__WFWidgetCache_widgetWorkflowWithIdentifier___block_invoke;
  block[3] = &unk_2642A5DA0;
  block[4] = self;
  id v14 = v5;
  p_long long buf = &buf;
  id v9 = v5;
  dispatch_sync(v8, block);

  id v10 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v10;
}

void __46__WFWidgetCache_widgetWorkflowWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) resultsByIdentifier];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v11 = 138412290;
      uint64_t v12 = v5;
      _os_log_impl(&dword_2177E0000, v4, OS_LOG_TYPE_DEFAULT, "Found cached widget workflow for id: %@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v6 = [v3 value];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {

    id v9 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = 138412290;
      uint64_t v12 = v10;
      _os_log_impl(&dword_2177E0000, v9, OS_LOG_TYPE_DEFAULT, "No cached widget workflow for %@ found, kicking off a request", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "queue_getWidgetWorkflowWithIdentifier:", *(void *)(a1 + 40));
  }
}

+ (WFWidgetCache)sharedCache
{
  if (sharedCache_onceToken != -1) {
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_2667);
  }
  id v2 = (void *)sharedCache_cache;
  return (WFWidgetCache *)v2;
}

uint64_t __28__WFWidgetCache_sharedCache__block_invoke()
{
  sharedCache_cache = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

@end