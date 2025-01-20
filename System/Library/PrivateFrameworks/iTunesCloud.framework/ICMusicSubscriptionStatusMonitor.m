@interface ICMusicSubscriptionStatusMonitor
+ (id)_sharedInstanceManager;
+ (id)sharedMonitorForIdentity:(id)a3;
+ (id)sharedMonitorForIdentity:(id)a3 identityStore:(id)a4;
- (BOOL)_isMonitoringSubscriptionStatusForAutoupdatingIdentity;
- (ICMusicSubscriptionStatus)subscriptionStatus;
- (ICUserIdentity)identity;
- (id)_effectiveIdentityForRequestingSubscriptionStatus;
- (id)_initWithIdentityContext:(id)a3;
- (id)beginObservingSubscriptionStatusWithHandler:(id)a3;
- (id)description;
- (void)_beginObservingSubscriptionStatus;
- (void)_endObservingSubscriptionStatus;
- (void)_handleActiveUserIdentityDidChangeRemoteNotification;
- (void)_handleSubscriptionStatusDidChange:(id)a3;
- (void)_handleUserIdentityStoreDidChange:(id)a3;
- (void)_invokeAccessHandlersWithSubscriptionStatus:(id)a3 error:(id)a4;
- (void)_requestSubscriptionStatusWithCachingPolicy:(unint64_t)a3 completion:(id)a4;
- (void)_updateWithSubscriptionStatus:(id)a3;
- (void)dealloc;
- (void)endObservingSubscriptionStatusWithToken:(id)a3;
- (void)performBlockWithLoadedSubscriptionStatus:(id)a3;
- (void)refreshSubscriptionStatus;
@end

@implementation ICMusicSubscriptionStatusMonitor

- (ICMusicSubscriptionStatus)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v4 = objc_alloc(MEMORY[0x1E4F28E78]);
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = (void *)[v4 initWithFormat:@"<%@: %p", v6, self];

  v8 = [(ICUserIdentityContext *)self->_identityContext identity];
  [v7 appendFormat:@"; identity = %@", v8];

  v9 = [(ICUserIdentityContext *)self->_identityContext identityStore];
  if ([v9 identityStoreStyle]) {
    [v7 appendFormat:@"; identityStore = %@", v9];
  }
  os_unfair_lock_lock(p_lock);
  uint64_t v10 = [(NSMutableDictionary *)self->_observers count];
  os_unfair_lock_unlock(p_lock);
  if (v10) {
    objc_msgSend(v7, "appendFormat:", @"; observersCount = %lu", v10);
  }
  [v7 appendString:@">"];

  return v7;
}

+ (id)sharedMonitorForIdentity:(id)a3
{
  id v4 = a3;
  v5 = +[ICUserIdentityStore defaultIdentityStore];
  v6 = [a1 sharedMonitorForIdentity:v4 identityStore:v5];

  return v6;
}

void __91__ICMusicSubscriptionStatusMonitor__requestSubscriptionStatusWithCachingPolicy_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 8);
  id v4 = a2;
  v5 = [v3 identityStore];
  [v4 setIdentityStore:v5];

  [v4 setIdentity:*(void *)(a1 + 40)];
  [v4 setAllowsExpiredBags:1];
  v6 = [(ICURLResponseAuthenticationProvider *)[ICStoreURLResponseAuthenticationProvider alloc] initWithUserInteractionLevel:1];
  [v4 setAuthenticationProvider:v6];
}

void __91__ICMusicSubscriptionStatusMonitor__requestSubscriptionStatusWithCachingPolicy_completion___block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      int v21 = 138543874;
      uint64_t v22 = v9;
      __int16 v23 = 2114;
      uint64_t v24 = v10;
      __int16 v25 = 2114;
      id v26 = v6;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Did complete %{public}@. Encountered error: %{public}@.", (uint8_t *)&v21, 0x20u);
    }

    [*(id *)(a1 + 32) _invokeAccessHandlersWithSubscriptionStatus:0 error:v6];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      int v21 = 138543874;
      uint64_t v22 = v11;
      __int16 v23 = 2114;
      uint64_t v24 = v12;
      __int16 v25 = 2114;
      id v26 = v5;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Did complete %{public}@. Received subscription status response %{public}@.", (uint8_t *)&v21, 0x20u);
    }

    v13 = [*(id *)(a1 + 32) _effectiveIdentityForRequestingSubscriptionStatus];
    uint64_t v14 = *(void *)(a1 + 48);
    v15 = +[ICUserIdentityStore defaultIdentityStore];
    LOBYTE(v14) = [v13 isEqualToIdentity:v14 inStore:v15];

    if (v14)
    {
      v16 = [v5 subscriptionStatus];
      v17 = [v16 copy];

      [*(id *)(a1 + 32) _updateWithSubscriptionStatus:v17];
    }
    else
    {
      v17 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        uint64_t v19 = *(void *)(a1 + 48);
        int v21 = 138543874;
        uint64_t v22 = v18;
        __int16 v23 = 2114;
        uint64_t v24 = v19;
        __int16 v25 = 2114;
        id v26 = v13;
        _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring response because the effective user identity has changed since the request was made: %{public}@ --> %{public}@", (uint8_t *)&v21, 0x20u);
      }
    }
  }
  uint64_t v20 = *(void *)(a1 + 56);
  if (v20) {
    (*(void (**)(void))(v20 + 16))();
  }
}

- (void)_updateWithSubscriptionStatus:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = (ICMusicSubscriptionStatus *)a3;
  os_unfair_lock_lock(&self->_lock);
  id v6 = self->_subscriptionStatus;
  if (v6 == v5)
  {
  }
  else
  {
    v7 = v6;
    BOOL v8 = [(ICMusicSubscriptionStatus *)v6 isEqual:v5];

    if (!v8)
    {
      objc_storeStrong((id *)&self->_subscriptionStatus, a3);
      uint64_t v9 = (void *)[(NSMutableDictionary *)self->_observers copy];
      os_unfair_lock_unlock(&self->_lock);
      uint64_t v10 = [v9 count];
      uint64_t v11 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = "s";
        *(_DWORD *)buf = 138544130;
        __int16 v22 = 2114;
        int v21 = self;
        if (v10 == 1) {
          uint64_t v12 = "";
        }
        __int16 v23 = v5;
        __int16 v24 = 2048;
        uint64_t v25 = v10;
        __int16 v26 = 2080;
        uint64_t v27 = v12;
        _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Subscription status did change: %{public}@. About to invoke %llu observation handler%s.", buf, 0x2Au);
      }

      if (v10)
      {
        uint64_t v14 = MEMORY[0x1E4F143A8];
        uint64_t v15 = 3221225472;
        v16 = __66__ICMusicSubscriptionStatusMonitor__updateWithSubscriptionStatus___block_invoke;
        v17 = &unk_1E5ACC888;
        uint64_t v18 = self;
        uint64_t v19 = v5;
        [v9 enumerateKeysAndObjectsUsingBlock:&v14];
      }
      goto LABEL_13;
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  v13 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    int v21 = self;
    _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Subscription status did not change. Skipping invoking observation handlers.", buf, 0xCu);
  }

  uint64_t v9 = 0;
LABEL_13:
  -[ICMusicSubscriptionStatusMonitor _invokeAccessHandlersWithSubscriptionStatus:error:](self, "_invokeAccessHandlersWithSubscriptionStatus:error:", v5, 0, v14, v15, v16, v17, v18);
}

uint64_t __80__ICMusicSubscriptionStatusMonitor_beginObservingSubscriptionStatusWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestSubscriptionStatusWithCachingPolicy:0 completion:0];
}

- (void)endObservingSubscriptionStatusWithToken:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_observers removeObjectForKey:v4];
  uint64_t v5 = [(NSMutableDictionary *)self->_observers count];
  if (!v5)
  {
    DSID = self->_DSID;
    self->_DSID = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543874;
    uint64_t v10 = self;
    __int16 v11 = 2114;
    id v12 = v4;
    __int16 v13 = 1024;
    BOOL v14 = v5 == 0;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Removed subscription status observer with token: %{public}@. wasLastObserver=%{BOOL}u", (uint8_t *)&v9, 0x1Cu);
  }

  if (!v5) {
    [(ICMusicSubscriptionStatusMonitor *)self _endObservingSubscriptionStatus];
  }
  BOOL v8 = [(id)objc_opt_class() _sharedInstanceManager];
  [v8 decrementUsageCountForKey:self->_identityContext];
}

- (void)_requestSubscriptionStatusWithCachingPolicy:(unint64_t)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v7 = [(ICMusicSubscriptionStatusMonitor *)self _effectiveIdentityForRequestingSubscriptionStatus];
  BOOL v8 = [ICStoreRequestContext alloc];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __91__ICMusicSubscriptionStatusMonitor__requestSubscriptionStatusWithCachingPolicy_completion___block_invoke;
  v22[3] = &unk_1E5ACC838;
  v22[4] = self;
  id v9 = v7;
  id v23 = v9;
  uint64_t v10 = [(ICStoreRequestContext *)v8 initWithBlock:v22];
  __int16 v11 = [[ICMusicSubscriptionStatusRequest alloc] initWithStoreRequestContext:v10];
  [(ICMusicSubscriptionStatusRequest *)v11 setAllowsFallbackToExpiredStatus:1];
  [(ICMusicSubscriptionStatusRequest *)v11 setAllowsFallbackToStatusNeedingReload:1];
  [(ICMusicSubscriptionStatusRequest *)v11 setCarrierBundleProvisioningStyle:1];
  if (a3 == 2)
  {
    [(ICMusicSubscriptionStatusRequest *)v11 setShouldReturnLastKnownStatusOnly:1];
    id v12 = @"required";
  }
  else if (a3 == 1)
  {
    [(ICMusicSubscriptionStatusRequest *)v11 setShouldIgnoreCache:1];
    id v12 = @"restricted";
  }
  else if (a3)
  {
    id v12 = 0;
  }
  else
  {
    id v12 = @"allowed";
  }
  __int16 v13 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v25 = self;
    __int16 v26 = 2114;
    uint64_t v27 = v12;
    __int16 v28 = 2114;
    v29 = v11;
    _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting subscription status with caching %{public}@, using %{public}@.", buf, 0x20u);
  }

  BOOL v14 = +[ICMusicSubscriptionStatusController sharedStatusController];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __91__ICMusicSubscriptionStatusMonitor__requestSubscriptionStatusWithCachingPolicy_completion___block_invoke_43;
  v18[3] = &unk_1E5ACC860;
  v18[4] = self;
  uint64_t v19 = v11;
  id v20 = v9;
  id v21 = v6;
  id v15 = v6;
  id v16 = v9;
  v17 = v11;
  [v14 performSubscriptionStatusRequest:v17 withCompletionHandler:v18];
}

- (id)beginObservingSubscriptionStatusWithHandler:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() _sharedInstanceManager];
  [v5 incrementUsageCountForKey:self->_identityContext];

  id v6 = [(ICMusicSubscriptionStatusMonitor *)self _effectiveIdentityForRequestingSubscriptionStatus];
  v7 = [MEMORY[0x1E4F29128] UUID];
  os_unfair_lock_lock(&self->_lock);
  observers = self->_observers;
  id v9 = (void *)[v4 copy];

  uint64_t v10 = (void *)MEMORY[0x1A6240BF0](v9);
  [(NSMutableDictionary *)observers setObject:v10 forKey:v7];

  uint64_t v11 = [(NSMutableDictionary *)self->_observers count];
  if (v11 == 1)
  {
    id v12 = [(ICUserIdentityContext *)self->_identityContext identityStore];
    id v20 = 0;
    __int16 v13 = [v12 DSIDForUserIdentity:v6 outError:&v20];
    id v14 = v20;
    DSID = self->_DSID;
    self->_DSID = v13;
  }
  else
  {
    id v14 = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
  id v16 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v22 = self;
    __int16 v23 = 2114;
    __int16 v24 = v7;
    _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Registered new subscription status observer with token: %{public}@.", buf, 0x16u);
  }

  if (v14)
  {
    v17 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      __int16 v22 = self;
      __int16 v23 = 2112;
      __int16 v24 = v6;
      __int16 v25 = 2114;
      id v26 = v14;
      _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Encountered unexpected error while resolving DSID for effective user identity %@: %{public}@.", buf, 0x20u);
    }
  }
  if (v11 == 1)
  {
    [(ICMusicSubscriptionStatusMonitor *)self _beginObservingSubscriptionStatus];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __80__ICMusicSubscriptionStatusMonitor_beginObservingSubscriptionStatusWithHandler___block_invoke;
    v19[3] = &unk_1E5ACD750;
    v19[4] = self;
    [(ICMusicSubscriptionStatusMonitor *)self _requestSubscriptionStatusWithCachingPolicy:2 completion:v19];
  }

  return v7;
}

- (id)_effectiveIdentityForRequestingSubscriptionStatus
{
  v2 = [(ICUserIdentityContext *)self->_identityContext identity];
  uint64_t v3 = [v2 type];
  if (v3 == 3)
  {
    id v4 = +[ICUserIdentity activeLockerAccount];
  }
  else if (v3 == 2)
  {
    id v4 = +[ICUserIdentity activeAccount];
  }
  else
  {
    id v4 = v2;
  }
  uint64_t v5 = v4;

  return v5;
}

+ (id)sharedMonitorForIdentity:(id)a3 identityStore:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [[ICUserIdentityContext alloc] initWithIdentity:v7 identityStore:v6];

  id v9 = [a1 _sharedInstanceManager];
  uint64_t v10 = [v9 sharedInstanceForKey:v8];

  return v10;
}

+ (id)_sharedInstanceManager
{
  if (_sharedInstanceManager_sSharedInstanceManagerOnceToken != -1) {
    dispatch_once(&_sharedInstanceManager_sSharedInstanceManagerOnceToken, &__block_literal_global_36697);
  }
  v2 = (void *)_sharedInstanceManager_sSharedInstanceManager;

  return v2;
}

id __58__ICMusicSubscriptionStatusMonitor__sharedInstanceManager__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[ICMusicSubscriptionStatusMonitor alloc] _initWithIdentityContext:v2];

  return v3;
}

- (id)_initWithIdentityContext:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICMusicSubscriptionStatusMonitor;
  id v6 = [(ICMusicSubscriptionStatusMonitor *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_identityContext, a3);
    BOOL v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observers = v7->_observers;
    v7->_observers = v8;

    notificationHandlers = v7->_notificationHandlers;
    v7->_notificationHandlers = 0;

    uint64_t v11 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v7;
      _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ was initialized.", buf, 0xCu);
    }
  }
  return v7;
}

- (void)_beginObservingSubscriptionStatus
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = self;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning to observe subscription status.", buf, 0xCu);
  }

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  objc_initWeak((id *)buf, self);
  id v7 = +[ICMusicSubscriptionStatusController sharedStatusController];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__ICMusicSubscriptionStatusMonitor__beginObservingSubscriptionStatus__block_invoke;
  v17[3] = &unk_1E5ACC810;
  objc_copyWeak(&v18, (id *)buf);
  BOOL v8 = [v5 addObserverForName:@"ICMusicSubscriptionStatusDidChangeNotification" object:v7 queue:0 usingBlock:v17];
  [v6 addObject:v8];

  id v9 = [(ICUserIdentityContext *)self->_identityContext identityStore];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __69__ICMusicSubscriptionStatusMonitor__beginObservingSubscriptionStatus__block_invoke_2;
  id v15 = &unk_1E5ACC810;
  objc_copyWeak(&v16, (id *)buf);
  uint64_t v10 = [v5 addObserverForName:@"ICUserIdentityStoreDidChangeNotification" object:v9 queue:0 usingBlock:&v12];
  objc_msgSend(v6, "addObject:", v10, v12, v13, v14, v15);

  os_unfair_lock_lock(p_lock);
  objc_storeStrong((id *)&self->_notificationHandlers, v6);
  os_unfair_lock_unlock(p_lock);
  if ([(ICMusicSubscriptionStatusMonitor *)self _isMonitoringSubscriptionStatusForAutoupdatingIdentity])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_ICMusicSubscriptionStatusMonitorHandleActiveUserIdentityDidChangeRemoteNotification, @"com.apple.itunescloudd.activeUserIdentityDidChangeNotification", 0, (CFNotificationSuspensionBehavior)1028);
  }
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

- (BOOL)_isMonitoringSubscriptionStatusForAutoupdatingIdentity
{
  id v2 = [(ICUserIdentityContext *)self->_identityContext identity];
  uint64_t v3 = [v2 type];

  return (v3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

uint64_t __58__ICMusicSubscriptionStatusMonitor__sharedInstanceManager__block_invoke()
{
  _sharedInstanceManager_sSharedInstanceManager = [[ICKeyedSharedInstanceManager alloc] initWithInstantiationHandler:&__block_literal_global_24];

  return MEMORY[0x1F41817F8]();
}

void __66__ICMusicSubscriptionStatusMonitor__updateWithSubscriptionStatus___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    uint64_t v11 = *(void *)(a1 + 40);
    int v12 = 138544130;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    id v15 = v5;
    __int16 v16 = 2114;
    v17 = v10;
    __int16 v18 = 2048;
    uint64_t v19 = v11;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Invoking observation handler with token %{public}@; subscription status = <%{public}@: %p>",
      (uint8_t *)&v12,
      0x2Au);
  }
  (*((void (**)(id, void, void))v6 + 2))(v6, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionStatus, 0);
  objc_storeStrong((id *)&self->_notificationHandlers, 0);
  objc_storeStrong((id *)&self->_accessHandlers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_DSID, 0);

  objc_storeStrong((id *)&self->_identityContext, 0);
}

- (void)_invokeAccessHandlersWithSubscriptionStatus:(id)a3 error:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v8 = (void *)[(NSMutableArray *)self->_accessHandlers copy];
  accessHandlers = self->_accessHandlers;
  self->_accessHandlers = 0;

  os_unfair_lock_unlock(&self->_lock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * v14) + 16))(*(void *)(*((void *)&v15 + 1) + 8 * v14));
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)_endObservingSubscriptionStatus
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_notificationHandlers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "removeObserver:", *(void *)(*((void *)&v13 + 1) + 8 * v9++), (void)v13);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }

  if ([(ICMusicSubscriptionStatusMonitor *)self _isMonitoringSubscriptionStatusForAutoupdatingIdentity])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.itunescloudd.activeUserIdentityDidChangeNotification", 0);
  }
  os_unfair_lock_lock(p_lock);
  notificationHandlers = self->_notificationHandlers;
  self->_notificationHandlers = 0;

  os_unfair_lock_unlock(p_lock);
  uint64_t v12 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v18 = self;
    _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopped observing subscription status.", buf, 0xCu);
  }
}

void __69__ICMusicSubscriptionStatusMonitor__beginObservingSubscriptionStatus__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleSubscriptionStatusDidChange:v3];
}

void __69__ICMusicSubscriptionStatusMonitor__beginObservingSubscriptionStatus__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleUserIdentityStoreDidChange:v3];
}

- (void)_handleUserIdentityStoreDidChange:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v5 = [(ICMusicSubscriptionStatusMonitor *)self _effectiveIdentityForRequestingSubscriptionStatus];
  uint64_t v6 = [(ICUserIdentityContext *)self->_identityContext identityStore];
  id v21 = 0;
  uint64_t v7 = [v6 DSIDForUserIdentity:v5 outError:&v21];
  uint64_t v8 = (NSNumber *)v21;

  if (v8)
  {
    uint64_t v9 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [v4 name];
      *(_DWORD *)buf = 138544130;
      __int16 v23 = self;
      __int16 v24 = 2114;
      __int16 v25 = v10;
      __int16 v26 = 2112;
      uint64_t v27 = v5;
      __int16 v28 = 2114;
      v29 = v8;
      _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Upon handling %{public}@, encountered unexpected error while resolving DSID for effective user identity %@: %{public}@.", buf, 0x2Au);
    }
  }
  os_unfair_lock_lock(&self->_lock);
  uint64_t v11 = self->_DSID;
  if (v11 == v7)
  {
  }
  else
  {
    uint64_t v12 = v11;
    char v13 = [(NSNumber *)v11 isEqual:v7];

    if ((v13 & 1) == 0)
    {
      long long v14 = self->_DSID;
      objc_storeStrong((id *)&self->_DSID, v7);
      os_unfair_lock_unlock(&self->_lock);
      long long v15 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        long long v16 = [v4 name];
        *(_DWORD *)buf = 138544130;
        __int16 v23 = self;
        __int16 v24 = 2114;
        __int16 v25 = v16;
        __int16 v26 = 2112;
        uint64_t v27 = v14;
        __int16 v28 = 2112;
        v29 = v7;
        _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Handling %{public}@. DSID changed from %@ to %@. Checking to see if the subscription status has changed.", buf, 0x2Au);
      }
      long long v17 = [(ICUserIdentityContext *)self->_identityContext identity];
      if ([v17 type] == 2)
      {
        long long v18 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          __int16 v23 = self;
          _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: clearing current subscription status for dsid change", buf, 0xCu);
        }

        os_unfair_lock_lock(&self->_lock);
        subscriptionStatus = self->_subscriptionStatus;
        self->_subscriptionStatus = 0;

        os_unfair_lock_unlock(&self->_lock);
      }

      goto LABEL_17;
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v8)
  {
    long long v14 = 0;
LABEL_17:
    [(ICMusicSubscriptionStatusMonitor *)self _requestSubscriptionStatusWithCachingPolicy:0 completion:0];
    goto LABEL_18;
  }
  long long v14 = (NSNumber *)os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(&v14->super.super, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = [v4 name];
    *(_DWORD *)buf = 138543874;
    __int16 v23 = self;
    __int16 v24 = 2114;
    __int16 v25 = v20;
    __int16 v26 = 2112;
    uint64_t v27 = v7;
    _os_log_impl(&dword_1A2D01000, &v14->super.super, OS_LOG_TYPE_DEFAULT, "%{public}@: Handling %{public}@. DSID has not changed (it is still equal to %@). Ignoring this notification.", buf, 0x20u);
  }
LABEL_18:
}

- (void)_handleSubscriptionStatusDidChange:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKey:@"ICUserIdentityForMusicSubscriptionStatusDidChangeKey"];

  if (v6
    && (-[ICMusicSubscriptionStatusMonitor _effectiveIdentityForRequestingSubscriptionStatus](self, "_effectiveIdentityForRequestingSubscriptionStatus"), v7 = objc_claimAutoreleasedReturnValue(), -[ICUserIdentityContext identityStore](self->_identityContext, "identityStore"), v8 = objc_claimAutoreleasedReturnValue(), char v9 = [v7 isEqualToIdentity:v6 inStore:v8], v8, v7, (v9 & 1) == 0))
  {
    uint64_t v12 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      char v13 = [v4 name];
      int v14 = 138543874;
      long long v15 = self;
      __int16 v16 = 2114;
      long long v17 = v13;
      __int16 v18 = 2114;
      uint64_t v19 = v6;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring %{public}@ because it specifically refers to a different user identity: %{public}@.", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    id v10 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v4 name];
      int v14 = 138543618;
      long long v15 = self;
      __int16 v16 = 2114;
      long long v17 = v11;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Handling %{public}@.", (uint8_t *)&v14, 0x16u);
    }
    [(ICMusicSubscriptionStatusMonitor *)self _requestSubscriptionStatusWithCachingPolicy:0 completion:0];
  }
}

- (void)_handleActiveUserIdentityDidChangeRemoteNotification
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v3 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543618;
    id v5 = self;
    __int16 v6 = 2114;
    uint64_t v7 = @"com.apple.itunescloudd.activeUserIdentityDidChangeNotification";
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Handling %{public}@. The active user identity has changed in the daemon. Checking to see if the subscription status has changed.", (uint8_t *)&v4, 0x16u);
  }

  [(ICMusicSubscriptionStatusMonitor *)self _requestSubscriptionStatusWithCachingPolicy:0 completion:0];
}

- (void)refreshSubscriptionStatus
{
  os_unfair_lock_assert_not_owner(&self->_lock);

  [(ICMusicSubscriptionStatusMonitor *)self _requestSubscriptionStatusWithCachingPolicy:1 completion:0];
}

- (void)performBlockWithLoadedSubscriptionStatus:(id)a3
{
  uint64_t v11 = (void (**)(id, void *, void))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v5 = (void *)[(ICMusicSubscriptionStatus *)self->_subscriptionStatus copy];
  if (v5)
  {
    os_unfair_lock_unlock(&self->_lock);
    v11[2](v11, v5, 0);
  }
  else
  {
    accessHandlers = self->_accessHandlers;
    if (!accessHandlers)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v8 = self->_accessHandlers;
      self->_accessHandlers = v7;

      accessHandlers = self->_accessHandlers;
    }
    char v9 = (void *)[v11 copy];
    id v10 = (void *)MEMORY[0x1A6240BF0]();
    [(NSMutableArray *)accessHandlers addObject:v10];

    os_unfair_lock_unlock(p_lock);
  }
}

- (ICUserIdentity)identity
{
  return [(ICUserIdentityContext *)self->_identityContext identity];
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(NSMutableDictionary *)self->_observers count];
  [(NSMutableDictionary *)self->_observers removeAllObjects];
  os_unfair_lock_unlock(p_lock);
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v8 = self;
    __int16 v9 = 1024;
    BOOL v10 = v4 != 0;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ is being deallocated. wasObservingSubscriptionStatus=%{BOOL}u", buf, 0x12u);
  }

  if (v4) {
    [(ICMusicSubscriptionStatusMonitor *)self _endObservingSubscriptionStatus];
  }
  v6.receiver = self;
  v6.super_class = (Class)ICMusicSubscriptionStatusMonitor;
  [(ICMusicSubscriptionStatusMonitor *)&v6 dealloc];
}

@end