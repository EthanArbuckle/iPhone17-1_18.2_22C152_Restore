@interface UIViewServiceSessionManager
@end

@implementation UIViewServiceSessionManager

void __71___UIViewServiceSessionManager_startViewServiceSessionManagerAsPlugin___block_invoke(uint64_t a1)
{
  v2 = _UIMainBundleIdentifier();

  if (v2)
  {
    id v3 = [[_UIViewServiceSessionManager alloc] _initAsPlugIn:*(unsigned __int8 *)(a1 + 32)];
    v4 = (void *)__viewServiceSessionManager;
    __viewServiceSessionManager = (uint64_t)v3;
  }
}

void __68___UIViewServiceSessionManager_startViewServiceSessionWithDelegate___block_invoke(uint64_t a1)
{
  v2 = _UIMainBundleIdentifier();

  if (v2)
  {
    id v3 = [[_UIViewServiceSessionManager alloc] _initWithDelegate:*(void *)(a1 + 32)];
    v4 = (void *)__viewServiceSessionManager;
    __viewServiceSessionManager = (uint64_t)v3;
  }
}

uint64_t __50___UIViewServiceSessionManager__initWithDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startListener];
}

uint64_t __46___UIViewServiceSessionManager__initAsPlugIn___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startListener];
}

void __67___UIViewServiceSessionManager__registerSessionForDefaultDeputies___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, _OWORD *a5, void *a6)
{
  v10 = (id *)(a1 + 32);
  v11 = a6;
  id v12 = a4;
  id v13 = a2;
  id WeakRetained = objc_loadWeakRetained(v10);
  v15 = [WeakRetained uniqueIdentifier];
  long long v16 = a5[1];
  v18[0] = *a5;
  v18[1] = v16;
  v17 = +[_UIViewServiceViewControllerOperator operatorWithRemoteViewControllerProxy:v13 hostPID:a3 hostBundleID:v12 hostAuditToken:v18 sessionIdentifier:v15];

  [WeakRetained unregisterDeputyClass:objc_opt_class()];
  [v17 setDelegate:WeakRetained];
  v11[2](v11, v17);
}

void __67___UIViewServiceSessionManager__registerSessionForDefaultDeputies___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  v8 = (id *)(a1 + 32);
  v9 = a6;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v8);
  v11 = [WeakRetained uniqueIdentifier];
  id v12 = +[_UIViewServiceTextEffectsOperator operatorWithRemoteViewControllerProxy:v10 hostPID:a3 sessionIdentifier:v11];

  id v13 = objc_loadWeakRetained(v8);
  [v13 unregisterDeputyClass:objc_opt_class()];

  v9[2](v9, v12);
}

void __63___UIViewServiceSessionManager__configureSessionForConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    [*(id *)(*(void *)(a1 + 32) + 24) removeObject:WeakRetained];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  }
  [*(id *)(a1 + 32) _startOrStopSystemsForBackgroundRunning];
}

uint64_t __71___UIViewServiceSessionManager__startOrStopSystemsForBackgroundRunning__block_invoke(uint64_t a1)
{
  BSSetMainThreadPriorityFixedForUI();
  if ([*(id *)(a1 + 32) _hasActiveSessions])
  {
    return +[UIView _endSuspendingMotionEffectsForReason:0x1ED15B240];
  }
  else
  {
    uint64_t result = [(id)UIApp applicationState];
    if (result == 2)
    {
      return +[UIView _beginSuspendingMotionEffectsForReason:0x1ED15B240];
    }
  }
  return result;
}

@end