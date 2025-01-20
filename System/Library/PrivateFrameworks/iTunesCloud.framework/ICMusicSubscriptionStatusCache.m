@interface ICMusicSubscriptionStatusCache
+ (ICMusicSubscriptionStatusCache)sharedCache;
- (id)_init;
- (id)_statusChangeUserInfoForUserIdentity:(id)a3 oldStatus:(id)a4 newStatus:(id)a5;
- (void)_getCacheKeyForRequestContext:(id)a3 completion:(id)a4;
- (void)_handleActiveAccountDidChangeNotification:(id)a3;
- (void)_handlePhoneNumberDidChangeNotification:(id)a3;
- (void)_handleSubscriptionStatusChangedDistributedNotification:(id)a3;
- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3;
- (void)_loadPersistedCacheWithCompletion:(id)a3;
- (void)_persistCachePostingGlobalNotification:(BOOL)a3;
- (void)_postLocalChangeNotificationWithUserInfo:(id)a3;
- (void)dealloc;
- (void)getCachedSubscriptionStatusResponseForRequestContext:(id)a3 completion:(id)a4;
- (void)setCachedSubscriptionStatusResponse:(id)a3 forRequestContext:(id)a4 completion:(id)a5;
- (void)setCachedSubscriptionStatusResponseNeedsReloadForAllRequestContextsWithCompletion:(id)a3;
- (void)setCachedSubscriptionStatusResponseNeedsReloadForRequestContext:(id)a3 completion:(id)a4;
- (void)updateBaseCacheKey;
@end

@implementation ICMusicSubscriptionStatusCache

void __75__ICMusicSubscriptionStatusCache__getCacheKeyForRequestContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v2 = +[ICUserIdentity activeAccount];
  [v3 setIdentity:v2];

  [v3 setAllowsExpiredBags:1];
}

void __52__ICMusicSubscriptionStatusCache_updateBaseCacheKey__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v2 = +[ICUserIdentity activeAccount];
  [v3 setIdentity:v2];

  [v3 setAllowsExpiredBags:1];
}

uint64_t __98__ICMusicSubscriptionStatusCache_getCachedSubscriptionStatusResponseForRequestContext_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __75__ICMusicSubscriptionStatusCache__getCacheKeyForRequestContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 DSID];
  if (v3) {
    [*(id *)(a1 + 32) setDSID:v3];
  }
  v4 = [[ICStoreRequestContext alloc] initWithBlock:&__block_literal_global_64];
  v5 = +[ICURLBagProvider sharedBagProvider];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__ICMusicSubscriptionStatusCache__getCacheKeyForRequestContext_completion___block_invoke_3;
  v6[3] = &unk_1E5AC9E30;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  [v5 getBagForRequestContext:v4 forceRefetch:0 withCompletionHandler:v6];
}

- (void)getCachedSubscriptionStatusResponseForRequestContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__ICMusicSubscriptionStatusCache_getCachedSubscriptionStatusResponseForRequestContext_completion___block_invoke;
  block[3] = &unk_1E5ACD250;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

+ (ICMusicSubscriptionStatusCache)sharedCache
{
  if (sharedCache_sOnceToken != -1) {
    dispatch_once(&sharedCache_sOnceToken, &__block_literal_global);
  }
  v2 = (void *)sharedCache_sSharedCache;

  return (ICMusicSubscriptionStatusCache *)v2;
}

void __75__ICMusicSubscriptionStatusCache__getCacheKeyForRequestContext_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 stringForBagKey:@"storeFrontId"];
  if ([v3 length]) {
    [*(id *)(a1 + 32) setStorefrontIdentifier:v3];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __98__ICMusicSubscriptionStatusCache_getCachedSubscriptionStatusResponseForRequestContext_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:a2];
  v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __98__ICMusicSubscriptionStatusCache_getCachedSubscriptionStatusResponseForRequestContext_completion___block_invoke_3;
  v7[3] = &unk_1E5ACD2F0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
}

uint64_t __45__ICMusicSubscriptionStatusCache_sharedCache__block_invoke()
{
  sharedCache_sSharedCache = [[ICMusicSubscriptionStatusCache alloc] _init];

  return MEMORY[0x1F41817F8]();
}

void __52__ICMusicSubscriptionStatusCache_updateBaseCacheKey__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(*(void *)(a1 + 32) + 40);
  if (v7) {
    id v8 = (ICMusicSubscriptionStatusCacheKey *)[v7 copy];
  }
  else {
    id v8 = objc_alloc_init(ICMusicSubscriptionStatusCacheKey);
  }
  id v9 = v8;
  id v10 = [v5 stringForBagKey:@"storeFrontId"];
  if ([v10 length]) {
    [(ICMusicSubscriptionStatusCacheKey *)v9 setStorefrontIdentifier:v10];
  }
  if (*(unsigned char *)(a1 + 40))
  {
    v11 = 0;
  }
  else
  {
    id v12 = +[ICTelephonyController sharedController];
    v11 = [v12 phoneNumber];
  }
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = &stru_1EF5F5C40;
  }
  [(ICMusicSubscriptionStatusCacheKey *)v9 setPhoneNumber:v13];
  v14 = (ICMusicSubscriptionStatusCacheKey *)*(id *)(*(void *)(a1 + 32) + 40);
  if (v14 == v9)
  {
  }
  else
  {
    v15 = v14;
    BOOL v16 = [(ICMusicSubscriptionStatusCacheKey *)v14 isEqual:v9];

    if (!v16)
    {
      v17 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = v18;
        __int16 v30 = 2114;
        v31 = v9;
        _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_DEFAULT, "Base cache key for subscription status cache updated from %{public}@ to %{public}@.", buf, 0x16u);
      }

      uint64_t v19 = [(ICMusicSubscriptionStatusCacheKey *)v9 copy];
      uint64_t v20 = *(void *)(a1 + 32);
      v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;

      v22 = [*(id *)(*(void *)(a1 + 32) + 40) dictionaryRepresentationIncludingDSID:0];
      v23 = +[ICDefaults standardDefaults];
      [v23 setLastKnownSubscriptionStatusBaseCacheKey:v22];

      uint64_t v24 = *(void *)(a1 + 32);
      v25 = *(NSObject **)(v24 + 16);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__ICMusicSubscriptionStatusCache_updateBaseCacheKey__block_invoke_57;
      block[3] = &unk_1E5ACD750;
      block[4] = v24;
      dispatch_async(v25, block);
      goto LABEL_20;
    }
  }
  v22 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = *(void *)(*(void *)(a1 + 32) + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v26;
    _os_log_impl(&dword_1A2D01000, v22, OS_LOG_TYPE_DEFAULT, "Base cache key for subscription status cache remains unchanged: %{public}@.", buf, 0xCu);
  }
LABEL_20:

  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
}

- (id)_init
{
  v21.receiver = self;
  v21.super_class = (Class)ICMusicSubscriptionStatusCache;
  v2 = [(ICMusicSubscriptionStatusCache *)&v21 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicSubscriptionStatusCache.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicSubscriptionStatusCache.calloutQueue", 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicSubscriptionStatusCache.persistenceQueue", 0);
    persistenceQueue = v2->_persistenceQueue;
    v2->_persistenceQueue = (OS_dispatch_queue *)v7;

    id v9 = +[ICDeviceInfo currentDeviceInfo];
    v2->_isPhoneNumberAccessRestricted = [v9 isPhoneNumberAccessRestricted];

    id v10 = +[ICDefaults standardDefaults];
    v11 = [v10 lastKnownSubscriptionStatusBaseCacheKey];

    if (v11)
    {
      id v12 = [[ICMusicSubscriptionStatusCacheKey alloc] initWithDictionaryRepresentation:v11 requiringDSID:0];
      baseCacheKey = v2->_baseCacheKey;
      v2->_baseCacheKey = v12;
    }
    [(ICMusicSubscriptionStatusCache *)v2 updateBaseCacheKey];
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    if (v2->_isPhoneNumberAccessRestricted)
    {
      v15 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v20 = 0;
        _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_DEFAULT, "Subscription status cache will not observe phone number because phone number access is restricted.", v20, 2u);
      }
    }
    else
    {
      v15 = +[ICTelephonyController sharedController];
      [v14 addObserver:v2 selector:sel__handlePhoneNumberDidChangeNotification_ name:@"ICTelephonyPhoneNumberDidChangeNotification" object:v15];
    }

    BOOL v16 = +[ICUserIdentityStore defaultIdentityStore];
    [v14 addObserver:v2 selector:sel__handleUserIdentityStoreDidChangeNotification_ name:@"ICUserIdentityStoreDidChangeNotification" object:v16];

    v17 = +[ICUserIdentityStore defaultIdentityStore];
    [v14 addObserver:v2 selector:sel__handleActiveAccountDidChangeNotification_ name:@"ICActiveUserIdentityDidChangeNotification" object:v17];

    uint64_t v18 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v18 addObserver:v2 selector:sel__handleSubscriptionStatusChangedDistributedNotification_ name:@"com.apple.itunescloud.ICMusicSubscriptionStatusDidChangeDistributedNotification" object:0];

    [(ICMusicSubscriptionStatusCache *)v2 _loadPersistedCacheWithCompletion:0];
  }
  return v2;
}

- (void)updateBaseCacheKey
{
  BOOL isPhoneNumberAccessRestricted = self->_isPhoneNumberAccessRestricted;
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__ICMusicSubscriptionStatusCache_updateBaseCacheKey__block_invoke;
  v4[3] = &unk_1E5ACAD30;
  v4[4] = self;
  BOOL v5 = isPhoneNumberAccessRestricted;
  dispatch_barrier_async(accessQueue, v4);
}

- (void)_loadPersistedCacheWithCompletion:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__ICMusicSubscriptionStatusCache__loadPersistedCacheWithCompletion___block_invoke;
  v7[3] = &unk_1E5ACD2F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

void __98__ICMusicSubscriptionStatusCache_getCachedSubscriptionStatusResponseForRequestContext_completion___block_invoke(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __98__ICMusicSubscriptionStatusCache_getCachedSubscriptionStatusResponseForRequestContext_completion___block_invoke_2;
  v4[3] = &unk_1E5AC6B00;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 48);
  [v2 _getCacheKeyForRequestContext:v3 completion:v4];
}

- (void)_getCacheKeyForRequestContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  id v8 = (void *)[(ICMusicSubscriptionStatusCacheKey *)self->_baseCacheKey copy];
  id v9 = [v6 delegatedIdentity];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v6 identity];
  }
  id v12 = v11;

  id v13 = [v6 identityStore];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__ICMusicSubscriptionStatusCache__getCacheKeyForRequestContext_completion___block_invoke;
  v16[3] = &unk_1E5AC7170;
  id v17 = v8;
  id v18 = v7;
  id v14 = v7;
  id v15 = v8;
  [v13 getPropertiesForUserIdentity:v12 completionHandler:v16];
}

void __52__ICMusicSubscriptionStatusCache_updateBaseCacheKey__block_invoke(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
  v2 = [[ICStoreRequestContext alloc] initWithBlock:&__block_literal_global_51];
  uint64_t v3 = +[ICURLBagProvider sharedBagProvider];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__ICMusicSubscriptionStatusCache_updateBaseCacheKey__block_invoke_3;
  v4[3] = &unk_1E5AC6BA0;
  v4[4] = *(void *)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 40);
  [v3 getBagForRequestContext:v2 forceRefetch:0 withCompletionHandler:v4];
}

void __68__ICMusicSubscriptionStatusCache__loadPersistedCacheWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v64 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v1 = +[ICDefaults standardDefaults];
  [v1 synchronize];

  v2 = +[ICDefaults standardDefaults];
  uint64_t v3 = [v2 cachedSubscriptionStatus];

  uint64_t v4 = objc_msgSend(v3, "ic_dictionaryValueForKey:", @"responses");
  uint64_t v5 = objc_msgSend(v3, "ic_stringValueForKey:", @"lastKnownOSVersion");
  id v6 = +[ICDeviceInfo currentDeviceInfo];
  id v7 = [v6 buildVersion];

  id v8 = +[ICUserIdentityStore defaultIdentityStore];
  id v9 = +[ICUserIdentity activeAccount];
  id v82 = 0;
  id v10 = [v8 DSIDForUserIdentity:v9 outError:&v82];
  id v11 = v82;

  id v12 = objc_msgSend(v3, "ic_numberValueForKey:", @"lastKnownActiveDSID");
  if (v11)
  {
    id v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v85 = v14;
      __int16 v86 = 2114;
      uint64_t v87 = (uint64_t)v11;
      _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load active account DSID - skipping account check. err=%{public}@", buf, 0x16u);
    }
  }
  id v15 = v7;
  if ((id)v5 == v15)
  {

    if (!v11) {
      goto LABEL_10;
    }
  }
  else
  {
    int v16 = [(id)v5 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
    if (!v11)
    {
LABEL_10:
      uint64_t v17 = [v12 unsignedLongLongValue];
      if (v17 == [v10 unsignedLongLongValue]) {
        goto LABEL_11;
      }
LABEL_12:
      id v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138544386;
        uint64_t v85 = v19;
        __int16 v86 = 2114;
        uint64_t v87 = v5;
        __int16 v88 = 2114;
        id v89 = v15;
        __int16 v90 = 2114;
        v91 = v12;
        __int16 v92 = 2114;
        v93 = v10;
        _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ invalidating loaded cached subscription status. cachedOSVersion=%{public}@, currentOSVersion=%{public}@; cachedActiveAcccountDSID=%{public}@, currentActiveAccountDSID=%{public}@",
          buf,
          0x34u);
      }

      int v68 = 1;
      goto LABEL_15;
    }
  }
LABEL_11:
  int v68 = 0;
LABEL_15:
  if (!(v5 | v4))
  {
    if ([v3 count]) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
  }
  v63 = v3;
  uint64_t v20 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v85 = v21;
    __int16 v86 = 2114;
    uint64_t v87 = v4;
    _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ loaded subscription status cache: %{public}@", buf, 0x16u);
  }
  v58 = v15;
  v59 = v12;
  v60 = v11;
  v61 = v10;
  v62 = (void *)v5;

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v22 = (id)v4;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v78 objects:v83 count:16];
  v70 = v22;
  if (!v23)
  {
    v69 = 0;
    id v25 = 0;
    uint64_t v27 = a1;
    goto LABEL_55;
  }
  uint64_t v24 = v23;
  v69 = 0;
  id v25 = 0;
  uint64_t v71 = *(void *)v79;
  uint64_t v26 = off_1E5AC6000;
  uint64_t v27 = a1;
  unint64_t v28 = 0x1E4F1C000uLL;
  do
  {
    uint64_t v29 = 0;
    do
    {
      if (*(void *)v79 != v71) {
        objc_enumerationMutation(v22);
      }
      uint64_t v30 = *(void *)(*((void *)&v78 + 1) + 8 * v29);
      v31 = [v22 objectForKey:v30];
      if (!_NSIsNSString() || !_NSIsNSDictionary())
      {
        uint64_t v32 = 0;
        v35 = 0;
LABEL_44:
        if (!v25) {
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      uint64_t v32 = [[ICMusicSubscriptionStatusCacheKey alloc] initWithStringRepresentation:v30];
      id v33 = v31;
      if (([(__objc2_class *)v26[19] isValidSubscriptionStatusPropertyListRepresentation:v33 error:0] & 1) == 0)
      {

        v35 = 0;
LABEL_50:
        id v22 = v70;
        if (!v25) {
LABEL_45:
        }
          id v25 = objc_alloc_init(*(Class *)(v28 + 2632));
LABEL_46:
        [v25 addObject:v30];
        goto LABEL_47;
      }
      v34 = (void *)[objc_alloc(v26[19]) initWithPropertyListRepresentation:v33];
      v35 = v34;
      if (v68) {
        [v34 setNeedsReload:1];
      }

      if (!v32) {
        goto LABEL_50;
      }
      id v22 = v70;
      if (!v35) {
        goto LABEL_44;
      }
      id v36 = v69;
      if (!v69) {
        id v36 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      v69 = v36;
      [v36 setObject:v35 forKey:v32];
      v37 = [*(id *)(*(void *)(v27 + 32) + 48) objectForKey:v32];
      v38 = *(void **)(*(void *)(v27 + 32) + 48);
      if (!v38)
      {
        id v39 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v40 = *(void *)(v27 + 32);
        v41 = *(void **)(v40 + 48);
        *(void *)(v40 + 48) = v39;

        v38 = *(void **)(*(void *)(v27 + 32) + 48);
      }
      [v38 setObject:v35 forKey:v32];
      v42 = [v37 subscriptionStatus];
      uint64_t v43 = [v35 subscriptionStatus];
      v44 = (void *)v43;
      if (v42 != (void *)v43 && (!v42 || !v43 || ([v42 isEqualToStatus:v43] & 1) == 0))
      {
        v66 = [(ICMusicSubscriptionStatusCacheKey *)v32 DSID];
        +[ICUserIdentity specificAccountWithDSID:v66];
        v45 = v67 = v37;
        v46 = [*(id *)(v27 + 32) _statusChangeUserInfoForUserIdentity:v45 oldStatus:v42 newStatus:v44];
        [v64 addObject:v46];

        uint64_t v27 = a1;
        v37 = v67;
      }
      unint64_t v28 = 0x1E4F1C000;
      id v22 = v70;
LABEL_47:

      ++v29;
      uint64_t v26 = off_1E5AC6000;
    }
    while (v24 != v29);
    uint64_t v47 = [v22 countByEnumeratingWithState:&v78 objects:v83 count:16];
    uint64_t v24 = v47;
  }
  while (v47);
LABEL_55:

  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __68__ICMusicSubscriptionStatusCache__loadPersistedCacheWithCompletion___block_invoke_68;
  v75[3] = &unk_1E5ACD250;
  id v48 = *(id *)(v27 + 40);
  uint64_t v49 = *(void *)(v27 + 32);
  id v77 = v48;
  v75[4] = v49;
  id v50 = v64;
  id v76 = v50;
  v51 = (void (**)(void))MEMORY[0x1A6240BF0](v75);
  if ([v25 count]
    && ([MEMORY[0x1E4F28F80] processInfo],
        v52 = objc_claimAutoreleasedReturnValue(),
        char v53 = objc_msgSend(v52, "ic_isCloudDaemon"),
        v52,
        (v53 & 1) != 0))
  {
    v54 = (void *)[v63 mutableCopy];
    [v54 removeObjectsForKeys:v25];
    v55 = (void *)[v54 copy];

    v56 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__ICMusicSubscriptionStatusCache__loadPersistedCacheWithCompletion___block_invoke_3;
    block[3] = &unk_1E5ACD2F0;
    id v57 = v55;
    id v73 = v57;
    v74 = v51;
    dispatch_async(v56, block);
  }
  else
  {
    v51[2](v51);
    id v57 = v63;
  }
}

void __68__ICMusicSubscriptionStatusCache__loadPersistedCacheWithCompletion___block_invoke_68(uint64_t a1)
{
  v1 = *(void **)(a1 + 48);
  if (v1)
  {
    uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __68__ICMusicSubscriptionStatusCache__loadPersistedCacheWithCompletion___block_invoke_2;
    v4[3] = &unk_1E5ACD2F0;
    id v6 = v1;
    id v5 = *(id *)(a1 + 40);
    dispatch_async(v3, v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSubscriptionStatusResponses, 0);
  objc_storeStrong((id *)&self->_baseCacheKey, 0);
  objc_storeStrong((id *)&self->_persistenceQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (id)_statusChangeUserInfoForUserIdentity:(id)a3 oldStatus:(id)a4 newStatus:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1E4F1CA60];
  id v10 = a3;
  id v11 = [v9 dictionaryWithCapacity:3];
  id v12 = (void *)[v10 copy];

  [v11 setObject:v12 forKeyedSubscript:@"ICUserIdentityForMusicSubscriptionStatusDidChangeKey"];
  if (v7)
  {
    id v13 = (void *)[v7 copy];
    [v11 setObject:v13 forKeyedSubscript:@"ICOldStatusForMusicSubscriptionStatusDidChangeKey"];
  }
  if (v8)
  {
    uint64_t v14 = (void *)[v8 copy];
    [v11 setObject:v14 forKeyedSubscript:@"ICNewStatusForMusicSubscriptionStatusDidChangeKey"];
  }
  id v15 = (void *)[v11 copy];

  return v15;
}

- (void)_postLocalChangeNotificationWithUserInfo:(id)a3
{
  calloutQueue = self->_calloutQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(calloutQueue);
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"ICMusicSubscriptionStatusCacheDidChangeNotification" object:self userInfo:v5];
}

- (void)_persistCachePostingGlobalNotification:(BOOL)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_cachedSubscriptionStatusResponses, "count"));
  cachedSubscriptionStatusResponses = self->_cachedSubscriptionStatusResponses;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __73__ICMusicSubscriptionStatusCache__persistCachePostingGlobalNotification___block_invoke;
  v23[3] = &unk_1E5AC6BC8;
  id v7 = v5;
  id v24 = v7;
  [(NSMutableDictionary *)cachedSubscriptionStatusResponses enumerateKeysAndObjectsUsingBlock:v23];
  id v8 = +[ICUserIdentityStore defaultIdentityStore];
  id v9 = +[ICUserIdentity activeAccount];
  id v22 = 0;
  id v10 = [v8 DSIDForUserIdentity:v9 outError:&v22];
  id v11 = v22;

  if (v11)
  {
    id v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = self;
      __int16 v27 = 2114;
      id v28 = v11;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load active account DSID to save. err=%{public}@", buf, 0x16u);
    }
  }
  id v13 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  uint64_t v14 = +[ICDeviceInfo currentDeviceInfo];
  id v15 = [v14 buildVersion];
  [v13 setValue:v15 forKey:@"lastKnownOSVersion"];

  if (v10) {
    int v16 = v10;
  }
  else {
    int v16 = &unk_1EF640768;
  }
  [v13 setValue:v16 forKey:@"lastKnownActiveDSID"];
  [v13 setValue:v7 forKey:@"responses"];
  persistenceQueue = self->_persistenceQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __73__ICMusicSubscriptionStatusCache__persistCachePostingGlobalNotification___block_invoke_71;
  v19[3] = &unk_1E5ACAD30;
  id v20 = v13;
  BOOL v21 = a3;
  id v18 = v13;
  dispatch_async(persistenceQueue, v19);
}

void __73__ICMusicSubscriptionStatusCache__persistCachePostingGlobalNotification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v7 = [a2 stringRepresentation];
  id v6 = [v5 propertyListRepresentation];

  if (v7 && v6) {
    [*(id *)(a1 + 32) setObject:v6 forKey:v7];
  }
}

void __73__ICMusicSubscriptionStatusCache__persistCachePostingGlobalNotification___block_invoke_71(uint64_t a1)
{
  v2 = +[ICDefaults standardDefaults];
  [v2 setCachedSubscriptionStatus:*(void *)(a1 + 32)];

  uint64_t v3 = +[ICDefaults standardDefaults];
  [v3 synchronize];

  if (*(unsigned char *)(a1 + 40))
  {
    id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v4 postNotificationName:@"com.apple.itunescloud.ICMusicSubscriptionStatusDidChangeDistributedNotification" object:0];
  }
}

uint64_t __68__ICMusicSubscriptionStatusCache__loadPersistedCacheWithCompletion___block_invoke_3(uint64_t a1)
{
  v2 = +[ICDefaults standardDefaults];
  [v2 setCachedSubscriptionStatus:*(void *)(a1 + 32)];

  uint64_t v3 = +[ICDefaults standardDefaults];
  [v3 synchronize];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

void __68__ICMusicSubscriptionStatusCache__loadPersistedCacheWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)_handleSubscriptionStatusChangedDistributedNotification:(id)a3
{
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "Reloading subscription status cache due to external change notification", buf, 2u);
  }

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __90__ICMusicSubscriptionStatusCache__handleSubscriptionStatusChangedDistributedNotification___block_invoke;
  v5[3] = &unk_1E5AC7C78;
  v5[4] = self;
  [(ICMusicSubscriptionStatusCache *)self _loadPersistedCacheWithCompletion:v5];
}

void __90__ICMusicSubscriptionStatusCache__handleSubscriptionStatusChangedDistributedNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[ICDefaults standardDefaults];
  if ([v4 shouldTreatSubscriptionStatusAsExpired])
  {
    int v5 = MSVDeviceOSIsInternalInstall();

    if (v5)
    {
      id v6 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "Posting local change notification as shouldTreatSubscriptionStatusAsExpired is set", buf, 2u);
      }

      [*(id *)(a1 + 32) _postLocalChangeNotificationWithUserInfo:0];
      goto LABEL_16;
    }
  }
  else
  {
  }
  if ([v3 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(a1 + 32), "_postLocalChangeNotificationWithUserInfo:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v9);
    }
  }
LABEL_16:
}

- (void)_handleActiveAccountDidChangeNotification:(id)a3
{
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "Received active identity did change notification - invalidating cache.", v5, 2u);
  }

  [(ICMusicSubscriptionStatusCache *)self setCachedSubscriptionStatusResponseNeedsReloadForAllRequestContextsWithCompletion:&__block_literal_global_61];
}

- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3
{
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "Received user identity store did change notification. Updating base cache key for subscription status cache.", v5, 2u);
  }

  [(ICMusicSubscriptionStatusCache *)self updateBaseCacheKey];
}

- (void)_handlePhoneNumberDidChangeNotification:(id)a3
{
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "Received phone number did change notification. Updating base cache key for subscription status cache.", v5, 2u);
  }

  [(ICMusicSubscriptionStatusCache *)self updateBaseCacheKey];
}

void __52__ICMusicSubscriptionStatusCache_updateBaseCacheKey__block_invoke_57(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    int v5 = @"ICMusicSubscriptionStatusCacheUnderlyingCachingPropertiesDidChangeNotification";
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "Posting %{public}@.", (uint8_t *)&v4, 0xCu);
  }

  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"ICMusicSubscriptionStatusCacheUnderlyingCachingPropertiesDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)setCachedSubscriptionStatusResponseNeedsReloadForRequestContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponseNeedsReloadForRequestContext_completion___block_invoke;
  block[3] = &unk_1E5ACD250;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(accessQueue, block);
}

void __109__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponseNeedsReloadForRequestContext_completion___block_invoke(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __109__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponseNeedsReloadForRequestContext_completion___block_invoke_2;
  v4[3] = &unk_1E5AC6B00;
  void v4[4] = v2;
  id v5 = *(id *)(a1 + 48);
  [v2 _getCacheKeyForRequestContext:v3 completion:v4];
}

void __109__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponseNeedsReloadForRequestContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:v3];
  id v5 = (void *)[v4 copy];

  if (v5)
  {
    if ([v5 needsReload])
    {
      [*(id *)(*(void *)(a1 + 32) + 48) setObject:v5 forKey:v3];
    }
    else
    {
      [v5 setNeedsReload:1];
      [*(id *)(*(void *)(a1 + 32) + 48) setObject:v5 forKey:v3];
      [*(id *)(a1 + 32) _persistCachePostingGlobalNotification:1];
    }
  }
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __109__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponseNeedsReloadForRequestContext_completion___block_invoke_3;
    block[3] = &unk_1E5ACD170;
    id v9 = v6;
    dispatch_async(v7, block);
  }
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
}

uint64_t __109__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponseNeedsReloadForRequestContext_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setCachedSubscriptionStatusResponseNeedsReloadForAllRequestContextsWithCompletion:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __116__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponseNeedsReloadForAllRequestContextsWithCompletion___block_invoke;
  v7[3] = &unk_1E5ACD2F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

void __116__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponseNeedsReloadForAllRequestContextsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) copy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __116__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponseNeedsReloadForAllRequestContextsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E5AC6B78;
  void v7[4] = *(void *)(a1 + 32);
  void v7[5] = &v8;
  [v2 enumerateKeysAndObjectsUsingBlock:v7];

  if (*((unsigned char *)v9 + 24)) {
    [*(id *)(a1 + 32) _persistCachePostingGlobalNotification:1];
  }
  id v3 = *(void **)(a1 + 40);
  if (v3)
  {
    id v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __116__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponseNeedsReloadForAllRequestContextsWithCompletion___block_invoke_3;
    block[3] = &unk_1E5ACD170;
    id v6 = v3;
    dispatch_async(v4, block);
  }
  _Block_object_dispose(&v8, 8);
}

void __116__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponseNeedsReloadForAllRequestContextsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = (void *)[a3 copy];
  if (([v5 needsReload] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    [v5 setNeedsReload:1];
  }
  [*(id *)(*(void *)(a1 + 32) + 48) setObject:v5 forKey:v6];
}

uint64_t __116__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponseNeedsReloadForAllRequestContextsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setCachedSubscriptionStatusResponse:(id)a3 forRequestContext:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (([v9 isFinalResponse] & 1) == 0)
  {
    int v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"ICMusicSubscriptionStatusCache.m", 119, @"Caching a non final subscription status request is not allowed: %@.", v9 object file lineNumber description];
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponse_forRequestContext_completion___block_invoke;
  block[3] = &unk_1E5ACD2A0;
  void block[4] = self;
  id v18 = v10;
  id v19 = v9;
  id v20 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  dispatch_barrier_async(accessQueue, block);
}

void __99__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponse_forRequestContext_completion___block_invoke(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __99__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponse_forRequestContext_completion___block_invoke_2;
  v4[3] = &unk_1E5AC6B50;
  void v4[4] = v2;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 56);
  [v2 _getCacheKeyForRequestContext:v3 completion:v4];
}

void __99__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponse_forRequestContext_completion___block_invoke_2(id *a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*((id *)a1[4] + 6) objectForKey:v3];
  id v5 = a1[5];
  id v6 = (void *)*((void *)a1[4] + 6);
  if (v5)
  {
    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v8 = a1[4];
      id v9 = (void *)v8[6];
      v8[6] = v7;

      id v5 = a1[5];
      id v6 = (void *)*((void *)a1[4] + 6);
    }
    [v6 setObject:v5 forKey:v3];
    id v10 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [a1[5] subscriptionStatus];
      *(_DWORD *)buf = 138543618;
      id v30 = v3;
      __int16 v31 = 2114;
      uint64_t v32 = v11;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "Setting cached subscription status response for cache key %{public}@: %{public}@.", buf, 0x16u);
    }
  }
  else
  {
    [v6 removeObjectForKey:v3];
    id v10 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v30 = v3;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "Removing cached subscription status response for cache key %{public}@.", buf, 0xCu);
    }
  }

  id v12 = [v4 subscriptionStatus];
  uint64_t v13 = [a1[5] subscriptionStatus];
  id v14 = (void *)v13;
  if (v12 == (void *)v13)
  {
    char v16 = 0;
  }
  else
  {
    if (v12) {
      BOOL v15 = v13 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15) {
      char v16 = 1;
    }
    else {
      char v16 = [v12 isEqualToStatus:v13] ^ 1;
    }
  }
  [a1[4] _persistCachePostingGlobalNotification:1];
  uint64_t v17 = *((void *)a1[4] + 2);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __99__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponse_forRequestContext_completion___block_invoke_46;
  v22[3] = &unk_1E5AC6B28;
  char v28 = v16;
  id v18 = a1[6];
  id v19 = a1[4];
  id v23 = v18;
  id v24 = v19;
  id v25 = v12;
  id v26 = v14;
  id v27 = a1[7];
  id v20 = v14;
  id v21 = v12;
  dispatch_async(v17, v22);
  dispatch_resume(*((dispatch_object_t *)a1[4] + 1));
}

uint64_t __99__ICMusicSubscriptionStatusCache_setCachedSubscriptionStatusResponse_forRequestContext_completion___block_invoke_46(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    id v2 = [*(id *)(a1 + 32) delegatedIdentity];
    id v3 = v2;
    if (v2)
    {
      id v4 = v2;
    }
    else
    {
      id v4 = [*(id *)(a1 + 32) identity];
    }
    id v5 = v4;

    id v6 = *(void **)(a1 + 40);
    id v7 = [v6 _statusChangeUserInfoForUserIdentity:v5 oldStatus:*(void *)(a1 + 48) newStatus:*(void *)(a1 + 56)];
    [v6 _postLocalChangeNotificationWithUserInfo:v7];
  }
  uint64_t result = *(void *)(a1 + 64);
  if (result)
  {
    id v9 = *(uint64_t (**)(void))(result + 16);
    return v9();
  }
  return result;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self name:@"com.apple.itunescloud.ICMusicSubscriptionStatusDidChangeDistributedNotification" object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  if (!self->_isPhoneNumberAccessRestricted)
  {
    id v5 = +[ICTelephonyController sharedController];
    [v4 removeObserver:self name:@"ICTelephonyPhoneNumberDidChangeNotification" object:v5];
  }
  id v6 = +[ICUserIdentityStore defaultIdentityStore];
  [v4 removeObserver:self name:@"ICUserIdentityStoreDidChangeNotification" object:v6];

  v7.receiver = self;
  v7.super_class = (Class)ICMusicSubscriptionStatusCache;
  [(ICMusicSubscriptionStatusCache *)&v7 dealloc];
}

@end