@interface MTSubscriptionEntitlementsObserver
- (ASDSubscriptionEntitlements)entitlements;
- (MTSubscriptionEntitlementsObserver)initWithDelegate:(id)a3 onQueue:(id)a4;
- (MTSubscriptionEntitlementsObserverDelegate)delegate;
- (void)entitlementsDidChange:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEntitlements:(id)a3;
@end

@implementation MTSubscriptionEntitlementsObserver

- (MTSubscriptionEntitlementsObserver)initWithDelegate:(id)a3 onQueue:(id)a4
{
  id v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MTSubscriptionEntitlementsObserver;
  v8 = [(MTSubscriptionEntitlementsObserver *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v9->_subscriptionsEntitlementsLock._os_unfair_lock_opaque = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__MTSubscriptionEntitlementsObserver_initWithDelegate_onQueue___block_invoke;
    block[3] = &unk_1E5E611F0;
    v12 = v9;
    dispatch_async(v7, block);
  }
  return v9;
}

void __63__MTSubscriptionEntitlementsObserver_initWithDelegate_onQueue___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  v2 = (void *)getASDSubscriptionEntitlementsClass_softClass;
  uint64_t v22 = getASDSubscriptionEntitlementsClass_softClass;
  if (!getASDSubscriptionEntitlementsClass_softClass)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __getASDSubscriptionEntitlementsClass_block_invoke;
    v17 = &unk_1E5E621D0;
    v18 = &v19;
    __getASDSubscriptionEntitlementsClass_block_invoke((uint64_t)&v14);
    v2 = (void *)v20[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v19, 8);
  v4 = objc_opt_new();
  [*(id *)(a1 + 32) setEntitlements:v4];

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  v7 = (id *)getASDSubscriptionEntitlementsPodcastDidChangeNotificationSymbolLoc_ptr;
  uint64_t v22 = getASDSubscriptionEntitlementsPodcastDidChangeNotificationSymbolLoc_ptr;
  if (!getASDSubscriptionEntitlementsPodcastDidChangeNotificationSymbolLoc_ptr)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __getASDSubscriptionEntitlementsPodcastDidChangeNotificationSymbolLoc_block_invoke;
    v17 = &unk_1E5E621D0;
    v18 = &v19;
    v8 = (void *)AppStoreDaemonLibrary();
    v9 = dlsym(v8, "ASDSubscriptionEntitlementsPodcastDidChangeNotification");
    *(void *)(v18[1] + 24) = v9;
    getASDSubscriptionEntitlementsPodcastDidChangeNotificationSymbolLoc_ptr = *(void *)(v18[1] + 24);
    v7 = (id *)v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v7)
  {
    objc_super v13 = (_Unwind_Exception *)getkSymptomDiagnosticReplySuccess_cold_1();
    _Block_object_dispose(&v19, 8);
    _Unwind_Resume(v13);
  }
  v10 = *(void **)(a1 + 32);
  id v11 = *v7;
  v12 = [v10 entitlements];
  [v5 addObserver:v6 selector:sel_entitlementsDidChange_ name:v11 object:v12];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
}

- (void)setEntitlements:(id)a3
{
}

- (ASDSubscriptionEntitlements)entitlements
{
  return self->_entitlements;
}

- (void)entitlementsDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MTSubscriptionEntitlementsObserver_entitlementsDidChange___block_invoke;
  block[3] = &unk_1E5E611F0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __60__MTSubscriptionEntitlementsObserver_entitlementsDidChange___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 entitlementsDidChange];
}

- (MTSubscriptionEntitlementsObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MTSubscriptionEntitlementsObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end