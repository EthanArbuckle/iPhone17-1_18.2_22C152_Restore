@interface SYBacklinkMonitorFilterCacheOperation
- (int64_t)type;
- (void)_finishProcessingAndNotify;
- (void)_searchBacklinksForInputUserActivity;
- (void)_updateBacklinkFilterCacheWithInfos:(id)a3;
@end

@implementation SYBacklinkMonitorFilterCacheOperation

- (int64_t)type
{
  return 0;
}

- (void)_searchBacklinksForInputUserActivity
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(SYBacklinkMonitorOperation *)self processingQueue];
  dispatch_assert_queue_V2(v3);

  [(SYBacklinkMonitorOperation *)self _setOperationState:1];
  v4 = [(SYBacklinkMonitorOperation *)self inputUserActivityInfo];
  v5 = v4;
  if (v4 && SYIsLinkableUserActivity(v4))
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v7 = v6;
    v8 = [v5 activityType];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__SYBacklinkMonitorFilterCacheOperation__searchBacklinksForInputUserActivity__block_invoke;
    v11[3] = &unk_1E6463F80;
    v11[5] = v7;
    v11[4] = self;
    +[SYItemIndexingManager fetchActivitiesWithActivityType:v8 completion:v11];
  }
  else
  {
    v9 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = @"not linkable";
      if (!v5) {
        v10 = @"nil";
      }
      *(_DWORD *)buf = 134218242;
      v13 = self;
      __int16 v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1C2C5F000, v9, OS_LOG_TYPE_DEFAULT, "BacklinkMonitorFilterOperation %p: Skipping query, input activity is %@.", buf, 0x16u);
    }

    [(SYBacklinkMonitorFilterCacheOperation *)self _updateBacklinkFilterCacheWithInfos:0];
  }
}

void __77__SYBacklinkMonitorFilterCacheOperation__searchBacklinksForInputUserActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v5 = v4 - *(double *)(a1 + 40);
  uint64_t v6 = [*(id *)(a1 + 32) processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__SYBacklinkMonitorFilterCacheOperation__searchBacklinksForInputUserActivity__block_invoke_2;
  block[3] = &unk_1E6463F58;
  block[4] = *(void *)(a1 + 32);
  id v9 = v3;
  double v10 = v5;
  id v7 = v3;
  dispatch_async(v6, block);
}

uint64_t __77__SYBacklinkMonitorFilterCacheOperation__searchBacklinksForInputUserActivity__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) count];
    double v5 = *(double *)(a1 + 48) * 1000.0;
    int v7 = 134218496;
    uint64_t v8 = v3;
    __int16 v9 = 2048;
    uint64_t v10 = v4;
    __int16 v11 = 2048;
    double v12 = v5;
    _os_log_impl(&dword_1C2C5F000, v2, OS_LOG_TYPE_DEFAULT, "BacklinkMonitorFilterOperation %p: Found %ld item(s) linked to current activityType. Query duration: %0.0f ms.", (uint8_t *)&v7, 0x20u);
  }

  return [*(id *)(a1 + 32) _updateBacklinkFilterCacheWithInfos:*(void *)(a1 + 40)];
}

- (void)_updateBacklinkFilterCacheWithInfos:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(SYBacklinkMonitorOperation *)self processingQueue];
  dispatch_assert_queue_V2(v5);

  [(SYBacklinkMonitorOperation *)self _setOperationState:2];
  uint64_t v6 = [(SYBacklinkMonitorOperation *)self inputUserActivityInfo];
  int v7 = [v6 activityType];

  if (v7)
  {
    uint64_t v8 = [SYBacklinkFilterCache alloc];
    __int16 v9 = [(SYBacklinkMonitorOperation *)self inputUserActivityInfo];
    uint64_t v10 = [v9 activityType];
    v26[0] = v10;
    __int16 v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    double v12 = [(SYBacklinkFilterCache *)v8 initWithActivityTypes:v11];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v13 = v4;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          -[SYBacklinkFilterCache addEntriesForItem:](v12, "addEntriesForItem:", *(void *)(*((void *)&v21 + 1) + 8 * v17++), (void)v21);
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v15);
    }

    [(SYBacklinkFilterCache *)v12 finalize];
  }
  else
  {
    double v12 = 0;
  }
  v18 = [(SYBacklinkMonitorOperation *)self delegate];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    v20 = [(SYBacklinkMonitorOperation *)self delegate];
    [v20 backlinkMonitorOperation:self shouldUpdateFilterCache:v12];
  }
  [(SYBacklinkMonitorFilterCacheOperation *)self _finishProcessingAndNotify];
}

- (void)_finishProcessingAndNotify
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SYBacklinkMonitorOperation *)self processingQueue];
  dispatch_assert_queue_V2(v3);

  [(SYBacklinkMonitorOperation *)self _setOperationState:3];
  id v4 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    int v7 = self;
    _os_log_impl(&dword_1C2C5F000, v4, OS_LOG_TYPE_DEFAULT, "BacklinkMonitorFilterOperation %p: Finished, notifying delegate.", (uint8_t *)&v6, 0xCu);
  }

  double v5 = [(SYBacklinkMonitorOperation *)self delegate];
  [v5 backlinkMonitorOperationDidFinish:self];
}

@end