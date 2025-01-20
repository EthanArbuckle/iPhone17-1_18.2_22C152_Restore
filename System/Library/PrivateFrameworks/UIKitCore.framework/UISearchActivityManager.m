@interface UISearchActivityManager
@end

@implementation UISearchActivityManager

void __65___UISearchActivityManager_beginTrackingActiveSearchParticipant___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = objc_loadWeakRetained((id *)(a1 + 40));
    v3 = [v2 _activeAssertions];
    [v3 removeObjectForKey:WeakRetained];
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  [v4 _updateClientSettingsIfNecessary];
}

uint64_t __60___UISearchActivityManager__updateClientSettingsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setContainsSearchView:*(unsigned __int8 *)(a1 + 32)];
}

@end