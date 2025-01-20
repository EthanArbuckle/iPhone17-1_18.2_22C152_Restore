@interface UIStatusBarDataAggregator
@end

@implementation UIStatusBarDataAggregator

uint64_t __69___UIStatusBarDataAggregator__updateFromPendingUpdatesForKeys_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __61___UIStatusBarDataAggregator_endDelayingUpdatesForEntryKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateForCoalescedKeysWithData:a2];
}

void __62___UIStatusBarDataAggregator__updateForCoalescedKeysWithData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) valueForKey:v5];
  if (v7)
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    v8 = (void *)MEMORY[0x1E4F1CB00];
    [v6 doubleValue];
    double v10 = v9;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62___UIStatusBarDataAggregator__updateForCoalescedKeysWithData___block_invoke_2;
    v13[3] = &unk_1E52FEDC8;
    objc_copyWeak(&v14, &location);
    v13[4] = v5;
    v11 = [v8 scheduledTimerWithTimeInterval:0 repeats:v13 block:v10];
    v12 = [*(id *)(*(void *)(a1 + 40) + 56) objectForKeyedSubscript:v5];
    [v12 invalidate];

    [*(id *)(*(void *)(a1 + 40) + 56) setObject:v11 forKeyedSubscript:v5];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __62___UIStatusBarDataAggregator__updateForCoalescedKeysWithData___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 32)];
  [WeakRetained _coalescedUpdateForEntryKeys:v2];
}

@end