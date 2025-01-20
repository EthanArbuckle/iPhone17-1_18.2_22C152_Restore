@interface ICURLBagMonitor
+ (ICURLBagMonitor)sharedBagMonitor;
- (ICURLBag)bag;
- (NSString)description;
- (id)_description;
- (id)_init;
- (id)beginObservingBagWithHandler:(id)a3;
- (void)_beginObservingBag;
- (void)_endObservingBag;
- (void)_handleBagExpirationTimerFired;
- (void)_handleUserIdentityStoreDidChange:(id)a3;
- (void)_invalidateBagExpirationTimer;
- (void)_requestBagWithPolicy:(unint64_t)a3 completionHandler:(id)a4;
- (void)_scheduleBagExpirationTimerForDate:(id)a3;
- (void)_updateWithBag:(id)a3;
- (void)dealloc;
- (void)endObservingBagWithToken:(id)a3;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
@end

@implementation ICURLBagMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_identityStore, 0);
  objc_storeStrong((id *)&self->_bagExpirationTimer, 0);

  objc_storeStrong((id *)&self->_bag, 0);
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  int v6 = [v5 isRemoteServerLikelyReachable];

  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    v9 = self;
    __int16 v10 = 1024;
    int v11 = v6;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Handling network reachability change; isRemoteServerLikelyReachable = %{BOOL}u.",
      (uint8_t *)&v8,
      0x12u);
  }

  if (v6) {
    [(ICURLBagMonitor *)self _requestBagWithPolicy:1 completionHandler:0];
  }
}

- (void)_updateWithBag:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (![(ICURLBag *)self->_bag isEqual:v5])
  {
    objc_storeStrong((id *)&self->_bag, a3);
    int v11 = (void *)[(NSMutableDictionary *)self->_observers copy];
    uint64_t v13 = [v11 count];
    v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(ICURLBagMonitor *)self _description];
      v16 = [v5 serverCorrelationKey];
      uint64_t v17 = [v5 serverEnvironment];
      v18 = (void *)v17;
      *(_DWORD *)buf = 138544642;
      v19 = "s";
      v25 = v15;
      if (v13 == 1) {
        v19 = "";
      }
      __int16 v26 = 2114;
      id v27 = v5;
      __int16 v28 = 2114;
      v29 = v16;
      __int16 v30 = 2114;
      uint64_t v31 = v17;
      __int16 v32 = 2048;
      uint64_t v33 = v13;
      __int16 v34 = 2080;
      v35 = v19;
      _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Bag did change: %{public}@ (serverCorrelationKey: %{public}@; serverEnvironment: %{public}@). About "
        "to invoke %llu observation handler%s.",
        buf,
        0x3Eu);
    }
    goto LABEL_11;
  }
  int v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(ICURLBagMonitor *)self _description];
    *(_DWORD *)buf = 138543362;
    v25 = v7;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Bag did not change. Skipping invoking observation handlers.", buf, 0xCu);
  }
  int v8 = [(ICURLBag *)self->_bag expirationDate];
  v9 = [v5 expirationDate];
  uint64_t v10 = [v8 compare:v9];

  int v11 = 0;
  uint64_t v12 = 0;
  if (v10 == -1)
  {
LABEL_11:
    v20 = [v5 expirationDate];
    [(ICURLBagMonitor *)self _scheduleBagExpirationTimerForDate:v20];

    uint64_t v12 = v11;
  }
  os_unfair_lock_unlock(&self->_lock);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __34__ICURLBagMonitor__updateWithBag___block_invoke;
  v22[3] = &unk_1E5AC9D00;
  v22[4] = self;
  id v23 = v5;
  id v21 = v5;
  [v12 enumerateKeysAndObjectsUsingBlock:v22];
}

void __34__ICURLBagMonitor__updateWithBag___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  int v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = 138543874;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    id v13 = v5;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Invoking observation handler with token %{public}@; bag = %{public}@.",
      (uint8_t *)&v10,
      0x20u);
  }

  v6[2](v6, *(void *)(a1 + 40));
}

- (void)_requestBagWithPolicy:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  if (a3 == 1)
  {
    char v7 = 0;
    uint64_t v8 = @"requireValidBag";
  }
  else if (a3)
  {
    uint64_t v8 = 0;
    char v7 = 0;
  }
  else
  {
    char v7 = 1;
    uint64_t v8 = @"allowExpiredBag";
  }
  uint64_t v9 = [ICStoreRequestContext alloc];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__ICURLBagMonitor__requestBagWithPolicy_completionHandler___block_invoke;
  v16[3] = &unk_1E5AC9CD8;
  v16[4] = self;
  char v17 = v7;
  int v10 = [(ICStoreRequestContext *)v9 initWithBlock:v16];
  uint64_t v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v19 = self;
    __int16 v20 = 2114;
    id v21 = v8;
    _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting bag with policy %{public}@.", buf, 0x16u);
  }

  __int16 v12 = +[ICURLBagProvider sharedBagProvider];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__ICURLBagMonitor__requestBagWithPolicy_completionHandler___block_invoke_29;
  v14[3] = &unk_1E5AC9E30;
  v14[4] = self;
  id v15 = v6;
  id v13 = v6;
  [v12 getBagForRequestContext:v10 withCompletionHandler:v14];
}

void __59__ICURLBagMonitor__requestBagWithPolicy_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 24);
  id v4 = a2;
  [v4 setIdentityStore:v3];
  id v5 = +[ICUserIdentity activeAccount];
  [v4 setIdentity:v5];

  [v4 setAllowsExpiredBags:*(unsigned __int8 *)(a1 + 40)];
  id v6 = [[ICURLResponseAuthenticationProvider alloc] initWithUserInteractionLevel:1];
  [v4 setAuthenticationProvider:v6];
}

void __59__ICURLBagMonitor__requestBagWithPolicy_completionHandler___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) _updateWithBag:v5];
  }
  else
  {
    char v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch bag with error: %{public}@.", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
}

- (void)_handleUserIdentityStoreDidChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    int v7 = 138543618;
    uint64_t v8 = self;
    __int16 v9 = 2114;
    int v10 = v6;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Handling %{public}@.", (uint8_t *)&v7, 0x16u);
  }
  [(ICURLBagMonitor *)self _requestBagWithPolicy:1 completionHandler:0];
}

- (void)_endObservingBag
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"ICUserIdentityStoreDidChangeNotification" object:self->_identityStore];
  [(ICURLBagMonitor *)self _invalidateBagExpirationTimer];
  id v4 = +[ICEnvironmentMonitor sharedMonitor];
  [v4 unregisterObserver:self];

  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(ICURLBagMonitor *)self _description];
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopped observing bag.", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_beginObservingBag
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(ICURLBagMonitor *)self _description];
    int v8 = 138543362;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning to observe bag.", (uint8_t *)&v8, 0xCu);
  }
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__handleUserIdentityStoreDidChange_ name:@"ICUserIdentityStoreDidChangeNotification" object:self->_identityStore];
  id v6 = [(ICURLBag *)self->_bag expirationDate];
  if (v6) {
    [(ICURLBagMonitor *)self _scheduleBagExpirationTimerForDate:v6];
  }
  int v7 = +[ICEnvironmentMonitor sharedMonitor];
  [v7 registerObserver:self];
}

- (void)_handleBagExpirationTimerFired
{
}

- (void)_scheduleBagExpirationTimerForDate:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  [(ICURLBagMonitor *)self _invalidateBagExpirationTimer];
  [v4 timeIntervalSinceNow];
  double v6 = v5;
  int v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6 >= 0.00000011920929)
  {
    if (v8)
    {
      uint64_t v10 = [(ICURLBagMonitor *)self _description];
      *(_DWORD *)buf = 138543874;
      __int16 v20 = v10;
      __int16 v21 = 2114;
      id v22 = v4;
      __int16 v23 = 2048;
      double v24 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Scheduling timer for bag expiration for date %{public}@; i.e. for %.1f seconds.",
        buf,
        0x20u);
    }
    uint64_t v11 = dispatch_get_global_queue(0, 0);
    __int16 v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v11);
    bagExpirationTimer = self->_bagExpirationTimer;
    self->_bagExpirationTimer = v12;

    uint64_t v14 = self->_bagExpirationTimer;
    dispatch_time_t v15 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    objc_initWeak((id *)buf, self);
    uint64_t v16 = self->_bagExpirationTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __54__ICURLBagMonitor__scheduleBagExpirationTimerForDate___block_invoke;
    handler[3] = &unk_1E5ACD778;
    objc_copyWeak(&v18, (id *)buf);
    dispatch_source_set_event_handler(v16, handler);
    dispatch_resume((dispatch_object_t)self->_bagExpirationTimer);
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v8)
    {
      uint64_t v9 = [(ICURLBagMonitor *)self _description];
      *(_DWORD *)buf = 138543618;
      __int16 v20 = v9;
      __int16 v21 = 2114;
      id v22 = v4;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Bag expiration date is in the past: %{public}@. Not scheduling timer for bag expiration.", buf, 0x16u);
    }
  }
}

void __54__ICURLBagMonitor__scheduleBagExpirationTimerForDate___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138543362;
    id v4 = WeakRetained;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Bag expiration timer did fire.", (uint8_t *)&v3, 0xCu);
  }

  [WeakRetained _handleBagExpirationTimerFired];
}

- (void)_invalidateBagExpirationTimer
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  bagExpirationTimer = self->_bagExpirationTimer;
  if (bagExpirationTimer)
  {
    dispatch_source_cancel(bagExpirationTimer);
    id v4 = self->_bagExpirationTimer;
    self->_bagExpirationTimer = 0;

    uint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = [(ICURLBagMonitor *)self _description];
      int v7 = 138543362;
      BOOL v8 = v6;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidated timer for bag expiration.", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)endObservingBagWithToken:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_observers removeObjectForKey:v4];
  uint64_t v5 = [(NSMutableDictionary *)self->_observers count];
  double v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(ICURLBagMonitor *)self _description];
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Removed bag observer with token: %{public}@.", (uint8_t *)&v8, 0x16u);
  }
  if (!v5) {
    [(ICURLBagMonitor *)self _endObservingBag];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (id)beginObservingBagWithHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  double v6 = [MEMORY[0x1E4F29128] UUID];
  os_unfair_lock_lock(p_lock);
  observers = self->_observers;
  int v8 = (void *)[v5 copy];

  uint64_t v9 = (void *)MEMORY[0x1A6240BF0](v8);
  [(NSMutableDictionary *)observers setObject:v9 forKey:v6];

  uint64_t v10 = [(NSMutableDictionary *)self->_observers count];
  id v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(ICURLBagMonitor *)self _description];
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v12;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Registered new bag observer with token: %{public}@.", buf, 0x16u);
  }
  if (v10 == 1)
  {
    [(ICURLBagMonitor *)self _beginObservingBag];
    os_unfair_lock_unlock(p_lock);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __48__ICURLBagMonitor_beginObservingBagWithHandler___block_invoke;
    v14[3] = &unk_1E5ACD750;
    v14[4] = self;
    [(ICURLBagMonitor *)self _requestBagWithPolicy:0 completionHandler:v14];
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }

  return v6;
}

uint64_t __48__ICURLBagMonitor_beginObservingBagWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestBagWithPolicy:1 completionHandler:0];
}

- (ICURLBag)bag
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  id v4 = self->_bag;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  id v4 = [(ICURLBagMonitor *)self _description];
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v4;
}

- (id)_description
{
  os_unfair_lock_assert_owner(&self->_lock);
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  double v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  uint64_t v7 = [(NSMutableDictionary *)self->_observers count];
  if (v7) {
    objc_msgSend(v6, "appendFormat:", @"; observersCount = %lu", v7);
  }
  [v6 appendString:@">"];

  return v6;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  [(ICURLBagMonitor *)self _endObservingBag];
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)ICURLBagMonitor;
  [(ICURLBagMonitor *)&v4 dealloc];
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)ICURLBagMonitor;
  v2 = [(ICURLBagMonitor *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[ICUserIdentityStore defaultIdentityStore];
    identityStore = v2->_identityStore;
    v2->_identityStore = (ICUserIdentityStore *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observers = v2->_observers;
    v2->_observers = v5;
  }
  return v2;
}

+ (ICURLBagMonitor)sharedBagMonitor
{
  if (sharedBagMonitor_sSharedBagMonitorOnceToken != -1) {
    dispatch_once(&sharedBagMonitor_sSharedBagMonitorOnceToken, &__block_literal_global_24294);
  }
  v2 = (void *)sharedBagMonitor_sSharedBagMonitor;

  return (ICURLBagMonitor *)v2;
}

uint64_t __35__ICURLBagMonitor_sharedBagMonitor__block_invoke()
{
  id v0 = [[ICURLBagMonitor alloc] _init];
  uint64_t v1 = sharedBagMonitor_sSharedBagMonitor;
  sharedBagMonitor_sSharedBagMonitor = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end