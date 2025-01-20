@interface WBTabCyclerTabGroupUpdateObserver
@end

@implementation WBTabCyclerTabGroupUpdateObserver

void __52___WBTabCyclerTabGroupUpdateObserver_startObserving__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v5[0] = 0;
      _os_log_impl(&dword_21C043000, v2, OS_LOG_TYPE_INFO, "Beginning to observe Tab Group updates", (uint8_t *)v5, 2u);
    }
    [WeakRetained[2] addTabGroupObserver:WeakRetained];
    uint64_t v3 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:WeakRetained target:sel__timeout selector:0 userInfo:0 repeats:300.0];
    id v4 = WeakRetained[3];
    WeakRetained[3] = (id)v3;
  }
}

@end