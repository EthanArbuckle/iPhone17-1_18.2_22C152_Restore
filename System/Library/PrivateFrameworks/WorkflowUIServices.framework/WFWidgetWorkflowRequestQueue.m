@interface WFWidgetWorkflowRequestQueue
- (BOOL)isHandlingRequest;
- (NSMutableArray)requests;
- (OS_os_log)log;
- (WFWidgetWorkflowRequestQueue)init;
- (os_unfair_lock_s)lock;
- (void)_requeueFailedRequest:(id)a3;
- (void)fetchNextQueuedItem;
- (void)getWidgetWorkflowWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getWidgetWorkflowsInCollectionWithIdentifier:(id)a3 limit:(unint64_t)a4 completionHandler:(id)a5;
- (void)setHandlingRequest:(BOOL)a3;
@end

@implementation WFWidgetWorkflowRequestQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

- (OS_os_log)log
{
  return self->_log;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSMutableArray)requests
{
  return self->_requests;
}

- (void)setHandlingRequest:(BOOL)a3
{
  self->_handlingRequest = a3;
}

- (BOOL)isHandlingRequest
{
  return self->_handlingRequest;
}

- (void)fetchNextQueuedItem
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = [(WFWidgetWorkflowRequestQueue *)self isHandlingRequest];
  os_unfair_lock_unlock(p_lock);
  if (!v4)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__WFWidgetWorkflowRequestQueue_fetchNextQueuedItem__block_invoke;
    aBlock[3] = &unk_2642A59F8;
    aBlock[4] = self;
    v5 = _Block_copy(aBlock);
    os_unfair_lock_lock(p_lock);
    v6 = [(WFWidgetWorkflowRequestQueue *)self requests];
    v7 = [v6 firstObject];

    os_unfair_lock_unlock(p_lock);
    if (v7)
    {
      os_unfair_lock_lock(p_lock);
      v8 = [(WFWidgetWorkflowRequestQueue *)self requests];
      [v8 removeObjectAtIndex:0];

      [(WFWidgetWorkflowRequestQueue *)self setHandlingRequest:1];
      os_unfair_lock_unlock(p_lock);
      v9 = [(WFWidgetWorkflowRequestQueue *)self log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v7;
        _os_log_impl(&dword_2177E0000, v9, OS_LOG_TYPE_DEFAULT, "Handling request: %@", buf, 0xCu);
      }

      if ([v7 type])
      {
        if ([v7 type] != 1)
        {
LABEL_14:

          goto LABEL_15;
        }
        v10 = [MEMORY[0x263F85128] standardClient];
        v11 = [v7 identifier];
        uint64_t v12 = [v7 limit];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __51__WFWidgetWorkflowRequestQueue_fetchNextQueuedItem__block_invoke_2;
        v16[3] = &unk_2642A5A48;
        v18 = v5;
        id v17 = v7;
        [v10 getWidgetWorkflowsInCollectionWithIdentifier:v11 limit:v12 completion:v16];

        v13 = v18;
      }
      else
      {
        v14 = [MEMORY[0x263F85128] standardClient];
        v15 = [v7 identifier];
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __51__WFWidgetWorkflowRequestQueue_fetchNextQueuedItem__block_invoke_94;
        v19[3] = &unk_2642A5A20;
        v21 = v5;
        id v20 = v7;
        [v14 getWidgetWorkflowWithIdentifier:v15 completion:v19];

        v13 = v21;
      }
    }
    else
    {
      v13 = [(WFWidgetWorkflowRequestQueue *)self log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2177E0000, v13, OS_LOG_TYPE_DEFAULT, "No pending requests.", buf, 2u);
      }
    }

    goto LABEL_14;
  }
  v5 = [(WFWidgetWorkflowRequestQueue *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2177E0000, v5, OS_LOG_TYPE_DEFAULT, "Already handling request, dropping request to move forward", buf, 2u);
  }
LABEL_15:
}

void __51__WFWidgetWorkflowRequestQueue_fetchNextQueuedItem__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl(&dword_2177E0000, v10, OS_LOG_TYPE_DEFAULT, "Finished with result: %@, error: %@", (uint8_t *)&v13, 0x16u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  [*(id *)(a1 + 32) setHandlingRequest:0];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  if (v9 && ![v7 retryCount])
  {
    [*(id *)(a1 + 32) _requeueFailedRequest:v7];
  }
  else
  {
    v11 = [v7 completionHandler];
    ((void (**)(void, id, id))v11)[2](v11, v8, v9);
  }
  uint64_t v12 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_2177E0000, v12, OS_LOG_TYPE_DEFAULT, "Onto the next...", (uint8_t *)&v13, 2u);
  }

  [*(id *)(a1 + 32) fetchNextQueuedItem];
}

uint64_t __51__WFWidgetWorkflowRequestQueue_fetchNextQueuedItem__block_invoke_94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3);
}

uint64_t __51__WFWidgetWorkflowRequestQueue_fetchNextQueuedItem__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3);
}

- (void)_requeueFailedRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [WFWidgetWorkflowFetchRequest alloc];
  uint64_t v6 = [v4 type];
  id v7 = [v4 identifier];
  uint64_t v8 = [v4 limit];
  uint64_t v9 = [v4 retryCount] + 1;
  v10 = [v4 completionHandler];

  v11 = [(WFWidgetWorkflowFetchRequest *)v5 initWithFetchType:v6 identifier:v7 limit:v8 retryCount:v9 completionHandler:v10];
  uint64_t v12 = [(WFWidgetWorkflowRequestQueue *)self log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v11;
    _os_log_impl(&dword_2177E0000, v12, OS_LOG_TYPE_DEFAULT, "Re-adding failed request: %@", (uint8_t *)&v15, 0xCu);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v14 = [(WFWidgetWorkflowRequestQueue *)self requests];
  [v14 insertObject:v11 atIndex:0];

  os_unfair_lock_unlock(p_lock);
}

- (void)getWidgetWorkflowsInCollectionWithIdentifier:(id)a3 limit:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if ([v8 isEqualToString:@"MyShortcuts"]) {
    v10 = 0;
  }
  else {
    v10 = v8;
  }
  id v11 = v10;
  uint64_t v12 = [[WFWidgetWorkflowFetchRequest alloc] initWithFetchType:1 identifier:v11 limit:a4 retryCount:0 completionHandler:v9];

  int v13 = [(WFWidgetWorkflowRequestQueue *)self log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v12;
    _os_log_impl(&dword_2177E0000, v13, OS_LOG_TYPE_DEFAULT, "Adding request: %@", (uint8_t *)&v15, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  id v14 = [(WFWidgetWorkflowRequestQueue *)self requests];
  [v14 addObject:v12];

  os_unfair_lock_unlock(&self->_lock);
  [(WFWidgetWorkflowRequestQueue *)self fetchNextQueuedItem];
}

- (void)getWidgetWorkflowWithIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = [[WFWidgetWorkflowFetchRequest alloc] initWithFetchType:0 identifier:v7 limit:1 retryCount:0 completionHandler:v6];

  id v9 = [(WFWidgetWorkflowRequestQueue *)self log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    uint64_t v12 = v8;
    _os_log_impl(&dword_2177E0000, v9, OS_LOG_TYPE_DEFAULT, "Adding request: %@", (uint8_t *)&v11, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  v10 = [(WFWidgetWorkflowRequestQueue *)self requests];
  [v10 addObject:v8];

  os_unfair_lock_unlock(&self->_lock);
  [(WFWidgetWorkflowRequestQueue *)self fetchNextQueuedItem];
}

- (WFWidgetWorkflowRequestQueue)init
{
  v9.receiver = self;
  v9.super_class = (Class)WFWidgetWorkflowRequestQueue;
  v2 = [(WFWidgetWorkflowRequestQueue *)&v9 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    requests = v2->_requests;
    v2->_requests = (NSMutableArray *)v3;

    v2->_handlingRequest = 0;
    v2->_lock._os_unfair_lock_opaque = 0;
    os_log_t v5 = os_log_create("com.apple.shortcuts", "WidgetWorkflowRequestQueue");
    log = v2->_log;
    v2->_log = (OS_os_log *)v5;

    id v7 = v2;
  }

  return v2;
}

@end