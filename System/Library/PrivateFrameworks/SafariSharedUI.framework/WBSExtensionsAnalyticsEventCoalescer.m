@interface WBSExtensionsAnalyticsEventCoalescer
- (BOOL)didInjectScriptForExtensionWithIdentifier:(id)a3;
- (BOOL)didInvokeToolbarButtonForExtensionWithIdentifier:(id)a3;
- (WBSExtensionsAnalyticsEventCoalescer)init;
- (WBSExtensionsAnalyticsEventCoalescerDelegate)delegate;
- (double)resetInterval;
- (void)_configureResetTimer;
- (void)extensionAnalyticsEventCoalescer:(id)a3 didInjectScriptForExtensionWithIdentifier:(id)a4;
- (void)extensionAnalyticsEventCoalescer:(id)a3 didInvokeToolbarButtonForExtensionWithIdentifier:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setResetInterval:(double)a3;
@end

@implementation WBSExtensionsAnalyticsEventCoalescer

- (WBSExtensionsAnalyticsEventCoalescer)init
{
  v10.receiver = self;
  v10.super_class = (Class)WBSExtensionsAnalyticsEventCoalescer;
  v2 = [(WBSExtensionsAnalyticsEventCoalescer *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    injectedScriptExtensions = v3->_injectedScriptExtensions;
    v3->_injectedScriptExtensions = v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    buttonInvokedExtensions = v3->_buttonInvokedExtensions;
    v3->_buttonInvokedExtensions = v6;

    objc_storeWeak((id *)&v3->_delegate, v3);
    v3->_resetInterval = 86400.0;
    [(WBSExtensionsAnalyticsEventCoalescer *)v3 _configureResetTimer];
    v8 = v3;
  }

  return v3;
}

- (void)_configureResetTimer
{
  [(NSTimer *)self->_resetTimer invalidate];
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E4F1CB00];
  [(WBSExtensionsAnalyticsEventCoalescer *)self resetInterval];
  double v5 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__WBSExtensionsAnalyticsEventCoalescer__configureResetTimer__block_invoke;
  v8[3] = &unk_1E5E41668;
  objc_copyWeak(&v9, &location);
  v6 = [v3 scheduledTimerWithTimeInterval:1 repeats:v8 block:v5];
  resetTimer = self->_resetTimer;
  self->_resetTimer = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (double)resetInterval
{
  return self->_resetInterval;
}

- (BOOL)didInjectScriptForExtensionWithIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  char v5 = [(NSMutableSet *)self->_injectedScriptExtensions containsObject:v4];
  os_unfair_lock_unlock(&self->_lock);
  if (v4) {
    char v6 = v5;
  }
  else {
    char v6 = 1;
  }
  if ((v6 & 1) == 0)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __82__WBSExtensionsAnalyticsEventCoalescer_didInjectScriptForExtensionWithIdentifier___block_invoke;
    v13 = &unk_1E5E40D38;
    v14 = self;
    id v7 = v4;
    id v15 = v7;
    os_unfair_lock_lock(&self->_lock);
    __82__WBSExtensionsAnalyticsEventCoalescer_didInjectScriptForExtensionWithIdentifier___block_invoke((uint64_t)&v10);
    os_unfair_lock_unlock(&self->_lock);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(WeakRetained, "extensionAnalyticsEventCoalescer:didInjectScriptForExtensionWithIdentifier:", self, v7, v10, v11);
    }
  }
  return v6 ^ 1;
}

void __82__WBSExtensionsAnalyticsEventCoalescer_didInjectScriptForExtensionWithIdentifier___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  id v2 = (id)[*(id *)(a1 + 40) copy];
  [v1 addObject:v2];
}

- (BOOL)didInvokeToolbarButtonForExtensionWithIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  char v5 = [(NSMutableSet *)self->_buttonInvokedExtensions containsObject:v4];
  os_unfair_lock_unlock(&self->_lock);
  if (v4) {
    char v6 = v5;
  }
  else {
    char v6 = 1;
  }
  if ((v6 & 1) == 0)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __89__WBSExtensionsAnalyticsEventCoalescer_didInvokeToolbarButtonForExtensionWithIdentifier___block_invoke;
    v13 = &unk_1E5E40D38;
    v14 = self;
    id v7 = v4;
    id v15 = v7;
    os_unfair_lock_lock(&self->_lock);
    __89__WBSExtensionsAnalyticsEventCoalescer_didInvokeToolbarButtonForExtensionWithIdentifier___block_invoke((uint64_t)&v10);
    os_unfair_lock_unlock(&self->_lock);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(WeakRetained, "extensionAnalyticsEventCoalescer:didInvokeToolbarButtonForExtensionWithIdentifier:", self, v7, v10, v11);
    }
  }
  return v6 ^ 1;
}

void __89__WBSExtensionsAnalyticsEventCoalescer_didInvokeToolbarButtonForExtensionWithIdentifier___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 16);
  id v2 = (id)[*(id *)(a1 + 40) copy];
  [v1 addObject:v2];
}

- (void)setResetInterval:(double)a3
{
  self->_resetInterval = a3;
  [(WBSExtensionsAnalyticsEventCoalescer *)self _configureResetTimer];
}

void __60__WBSExtensionsAnalyticsEventCoalescer__configureResetTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __60__WBSExtensionsAnalyticsEventCoalescer__configureResetTimer__block_invoke_2;
    v4[3] = &unk_1E5E40968;
    v4[4] = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 6);
    __60__WBSExtensionsAnalyticsEventCoalescer__configureResetTimer__block_invoke_2((uint64_t)v4);
    os_unfair_lock_unlock(v2 + 6);
    id v3 = objc_loadWeakRetained((id *)&v2[10]);
    if (objc_opt_respondsToSelector()) {
      [v3 extensionAnalyticsEventCoalescerDidResetCachedExtensions:v2];
    }
  }
}

uint64_t __60__WBSExtensionsAnalyticsEventCoalescer__configureResetTimer__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v2 removeAllObjects];
}

- (void)extensionAnalyticsEventCoalescer:(id)a3 didInjectScriptForExtensionWithIdentifier:(id)a4
{
  id v4 = (void *)MEMORY[0x1E4F98290];
  id v5 = a4;
  id v6 = [v4 sharedLogger];
  [v6 didInjectScriptForExtensionWithIdentifier:v5];
}

- (void)extensionAnalyticsEventCoalescer:(id)a3 didInvokeToolbarButtonForExtensionWithIdentifier:(id)a4
{
  id v4 = (void *)MEMORY[0x1E4F98290];
  id v5 = a4;
  id v6 = [v4 sharedLogger];
  [v6 didInvokeToolbarButtonForExtensionWithIdentifier:v5];
}

- (WBSExtensionsAnalyticsEventCoalescerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSExtensionsAnalyticsEventCoalescerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_resetTimer, 0);
  objc_storeStrong((id *)&self->_buttonInvokedExtensions, 0);
  objc_storeStrong((id *)&self->_injectedScriptExtensions, 0);
}

@end