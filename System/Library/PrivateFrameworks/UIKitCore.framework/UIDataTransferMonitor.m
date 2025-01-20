@interface UIDataTransferMonitor
@end

@implementation UIDataTransferMonitor

void __30___UIDataTransferMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained cancelOutstandingRequests];
    id WeakRetained = v2;
  }
}

uint64_t __58___UIDataTransferMonitor_setSuppressEventsUntilRequested___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 24) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __54___UIDataTransferMonitor_suppressEventsUntilRequested__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 24);
  return result;
}

void __58___UIDataTransferMonitor__transferQueue_sendBeganCallback__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained dataTransferMonitorBeganTransfers:*(void *)(a1 + 32)];
}

void __61___UIDataTransferMonitor__transferQueue_sendFinishedCallback__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained dataTransferMonitorFinishedTransfers:*(void *)(a1 + 32)];
}

uint64_t __41___UIDataTransferMonitor_totalItemsCount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 48) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

unsigned char *__52___UIDataTransferMonitor_sendDelegateEventsIfNeeded__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[26]) {
    return result;
  }
  if (result[25])
  {
    result[25] = 0;
    uint64_t result = (unsigned char *)objc_msgSend(*(id *)(a1 + 32), "_transferQueue_sendBeganCallback");
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = *(unsigned __int8 *)(v3 + 28);
    v4 = (unsigned char *)(v3 + 28);
    if (!v5) {
      return result;
    }
  }
  else
  {
    v4 = result + 28;
    if (!result[28])
    {
      objc_msgSend(result, "_transferQueue_sendBeganCallback");
      goto LABEL_7;
    }
  }
  unsigned char *v4 = 0;
LABEL_7:
  v6 = *(void **)(a1 + 32);
  return (unsigned char *)objc_msgSend(v6, "_transferQueue_sendFinishedCallback");
}

void __34___UIDataTransferMonitor_progress__block_invoke(uint64_t a1)
{
}

void __51___UIDataTransferMonitor_cancelOutstandingRequests__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v5), "progress", (void)v7);
        [v6 cancel];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

void __81___UIDataTransferMonitor_itemProvider_beganDataTransferTransactionUUID_progress___block_invoke(uint64_t a1)
{
  uint64_t v4 = objc_alloc_init(_UIDataTransferRequest);
  [(_UIDataTransferRequest *)v4 setItemProvider:*(void *)(a1 + 32)];
  [(_UIDataTransferRequest *)v4 setUUID:*(void *)(a1 + 40)];
  [(_UIDataTransferRequest *)v4 setProgress:*(void *)(a1 + 48)];
  uint64_t v2 = [*(id *)(a1 + 32) _UUID];
  [*(id *)(*(void *)(a1 + 56) + 48) addObject:v2];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 56) + 8) objectForKeyedSubscript:v2];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    [*(id *)(*(void *)(a1 + 56) + 8) setObject:v3 forKeyedSubscript:v2];
  }
  [v3 addObject:v4];
  [*(id *)(*(void *)(a1 + 56) + 16) addObject:v4];
  [*(id *)(*(void *)(a1 + 56) + 40) addObject:*(void *)(a1 + 48)];
  [*(id *)(a1 + 48) addObserver:*(void *)(a1 + 56) forKeyPath:@"fractionCompleted" options:1 context:0];
  objc_msgSend(*(id *)(a1 + 56), "_transferQueue_recomputeMasterProgress");
  objc_msgSend(*(id *)(a1 + 56), "_transferQueue_scheduleBeganCallback");
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(*(void *)(a1 + 56) + 8) count];
}

uint64_t __64___UIDataTransferMonitor__transferQueue_recomputeMasterProgress__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTotalUnitCount:*(void *)(a1 + 40)];
  uint64_t v2 = (uint64_t)(*(double *)(a1 + 48) * 100.0);
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setCompletedUnitCount:v2];
}

uint64_t __73___UIDataTransferMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transferQueue_recomputeMasterProgress");
}

void __75___UIDataTransferMonitor_itemProvider_finishedDataTransferTransactionUUID___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) count];
  uint64_t v2 = [*(id *)(a1 + 40) _UUID];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v2];
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void **)(a1 + 48);
  id v6 = v3;
  id v7 = v4;
  id v8 = v5;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = ___indexOfDataTransferRequestMatching_block_invoke;
  v14[3] = &unk_1E52EC538;
  id v9 = v7;
  id v15 = v9;
  id v10 = v8;
  id v16 = v10;
  v17 = &v18;
  [v6 enumerateObjectsUsingBlock:v14];
  uint64_t v11 = v19[3];

  _Block_object_dispose(&v18, 8);
  uint64_t v12 = [v6 objectAtIndexedSubscript:v11];
  v13 = [v12 progress];
  [v13 removeObserver:*(void *)(a1 + 32) forKeyPath:@"fractionCompleted"];

  [v6 removeObjectAtIndex:v11];
  if (![v6 count]) {
    [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:v2];
  }
  [*(id *)(*(void *)(a1 + 32) + 16) removeObject:v12];
  if (![*(id *)(*(void *)(a1 + 32) + 16) count]) {
    objc_msgSend(*(id *)(a1 + 32), "_transferQueue_scheduleFinishedCallback");
  }
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) count];
}

uint64_t __75___UIDataTransferMonitor_itemProvider_finishedDataTransferTransactionUUID___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transferQueue_scheduleFinishedCallback");
}

@end