@interface WBSHistoryAccessSessionProxy
- (WBSHistoryAccessSessionProxy)init;
- (void)_getHistoryAccessSessionWithCompletionHandler:(id)a3;
- (void)getHistoryItemsVisitedAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5;
- (void)getHistoryVisitsAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5;
@end

@implementation WBSHistoryAccessSessionProxy

- (WBSHistoryAccessSessionProxy)init
{
  v9.receiver = self;
  v9.super_class = (Class)WBSHistoryAccessSessionProxy;
  v2 = [(WBSHistoryAccessSessionProxy *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(WBSHistoryConnectionProxy);
    historyConnectionProxy = v2->_historyConnectionProxy;
    v2->_historyConnectionProxy = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryAccessSessionProxy", 0);
    historyAccessSessionAccessQueue = v2->_historyAccessSessionAccessQueue;
    v2->_historyAccessSessionAccessQueue = (OS_dispatch_queue *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)getHistoryItemsVisitedAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __93__WBSHistoryAccessSessionProxy_getHistoryItemsVisitedAfterDate_beforeDate_completionHandler___block_invoke;
  v14[3] = &unk_1E5C9C1A0;
  id v16 = v9;
  id v17 = v10;
  id v15 = v8;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(WBSHistoryAccessSessionProxy *)self _getHistoryAccessSessionWithCompletionHandler:v14];
}

uint64_t __93__WBSHistoryAccessSessionProxy_getHistoryItemsVisitedAfterDate_beforeDate_completionHandler___block_invoke(void *a1, void *a2)
{
  if (a2) {
    return [a2 getHistoryItemsVisitedAfterDate:a1[4] beforeDate:a1[5] completionHandler:a1[6]];
  }
  else {
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
}

- (void)getHistoryVisitsAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__WBSHistoryAccessSessionProxy_getHistoryVisitsAfterDate_beforeDate_completionHandler___block_invoke;
  v14[3] = &unk_1E5C9C1A0;
  id v16 = v9;
  id v17 = v10;
  id v15 = v8;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(WBSHistoryAccessSessionProxy *)self _getHistoryAccessSessionWithCompletionHandler:v14];
}

uint64_t __87__WBSHistoryAccessSessionProxy_getHistoryVisitsAfterDate_beforeDate_completionHandler___block_invoke(void *a1, void *a2)
{
  if (a2) {
    return [a2 getHistoryVisitsAfterDate:a1[4] beforeDate:a1[5] completionHandler:a1[6]];
  }
  else {
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
}

- (void)_getHistoryAccessSessionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  historyAccessSessionAccessQueue = self->_historyAccessSessionAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__WBSHistoryAccessSessionProxy__getHistoryAccessSessionWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8CDF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(historyAccessSessionAccessQueue, v7);
}

void __78__WBSHistoryAccessSessionProxy__getHistoryAccessSessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__19;
    v24 = __Block_byref_object_dispose__19;
    id v25 = 0;
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    uint64_t v4 = *(void *)(a1 + 32);
    dispatch_queue_t v5 = *(void **)(v4 + 8);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __78__WBSHistoryAccessSessionProxy__getHistoryAccessSessionWithCompletionHandler___block_invoke_3;
    id v16 = &unk_1E5C9C1C8;
    uint64_t v17 = v4;
    v19 = &v20;
    id v6 = v3;
    v18 = v6;
    [v5 beginHistoryAccessSession:&v13];
    dispatch_time_t v7 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(v6, v7))
    {
      id v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      id v9 = _WBSLocalizedString();
      v27[0] = v9;
      id v10 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1, v13, v14, v15, v16, v17);
      uint64_t v11 = [v8 errorWithDomain:@"WBSHistoryAccessSessionProxyErrorDomain" code:0 userInfo:v10];
      id v12 = (void *)v21[5];
      v21[5] = v11;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    _Block_object_dispose(&v20, 8);
  }
}

void __78__WBSHistoryAccessSessionProxy__getHistoryAccessSessionWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyAccessSessionAccessQueue, 0);
  objc_storeStrong((id *)&self->_historyAccessSession, 0);
  objc_storeStrong((id *)&self->_historyConnectionProxy, 0);
}

@end