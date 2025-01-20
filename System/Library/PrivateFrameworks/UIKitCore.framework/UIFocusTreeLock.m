@interface UIFocusTreeLock
@end

@implementation UIFocusTreeLock

void __24___UIFocusTreeLock_init__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _validateLockedEnvironments];
  }
  else {
    [v5 invalidate];
  }
}

void __40___UIFocusTreeLock_lockEnvironmentTree___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    [WeakRetained[1] removeObjectForKey:a2];
    id WeakRetained = v4;
  }
}

@end