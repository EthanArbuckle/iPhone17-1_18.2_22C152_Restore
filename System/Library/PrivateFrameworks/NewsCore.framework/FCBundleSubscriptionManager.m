@interface FCBundleSubscriptionManager
- (BOOL)hasRunEntitlementOnce;
- (FCBundleSubscription)cachedSubscription;
- (FCBundleSubscription)validatedCachedSubscription;
- (FCBundleSubscriptionManager)init;
- (FCBundleSubscriptionManager)initWithPrivateDataDirectory:(id)a3 configurationManager:(id)a4 cloudContext:(id)a5 contentContext:(id)a6 appActivityMonitor:(id)a7 entitlementsProvider:(id)a8;
- (id)bundleSubscriptionLookupEntry;
- (uint64_t)updateHasRunEntitlementOnce:(uint64_t)result;
- (void)activityObservingApplicationDidEnterBackground;
- (void)addObserver:(id)a3;
- (void)bundleChannelProvider:(id)a3 bundleChannelIDsDidChangeWithChannelIDs:(id)a4 version:(id)a5;
- (void)clearBundleSubscription;
- (void)expireBundleSubscription;
- (void)forceExpireBundleSubscriptionBasedOnInternalSettings;
- (void)networkReachabilityDidChange:(id)a3;
- (void)notifyObserversForChangeStateWithNewSubscription:(void *)a3 previousBundleSubscription:;
- (void)notifyObserversForExpiredStateWithSubscription:(uint64_t)a1;
- (void)notifyObserversForSubscribedStateWithSubscription:(char)a3 hideBundleDetectionUI:;
- (void)prepareForUseWithCompletion:(id)a3;
- (void)prewarmBundleTagIDsWithPurchaseID:(id)a3;
- (void)refreshBundleSubscriptionWithCachePolicy:(unint64_t)a3 completion:(id)a4;
- (void)refreshBundleSubscriptionWithCachePolicy:(unint64_t)a3 hideBundleDetectionUI:(BOOL)a4 completion:(id)a5;
- (void)removeObserver:(id)a3;
- (void)renewalNoticeShownWithPurchaseID:(id)a3;
- (void)setCachedSubscription:(id)a3;
- (void)setEntitlementsOverrideProvider:(id)a3;
- (void)silentExpireBundleSubscription;
- (void)updateCachedSubscriptionWithSubscription:(uint64_t)a1;
@end

@implementation FCBundleSubscriptionManager

void __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_77(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    *(_DWORD *)buf = 134217984;
    uint64_t v13 = objc_msgSend(v5, "fc_millisecondTimeIntervalUntilNow");
    _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "Did refresh bundle subscription with duration=%llums", buf, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_78;
  v9[3] = &unk_1E5B4C7C0;
  id v7 = *(id *)(a1 + 48);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  FCPerformBlockOnMainThread(v9);
}

- (FCBundleSubscription)cachedSubscription
{
  v2 = self;
  if (self) {
    self = (FCBundleSubscriptionManager *)self->_accessLock;
  }
  [(FCBundleSubscriptionManager *)self lock];
  id v3 = v2->_cachedSubscription;
  [(NFMutexLock *)v2->_accessLock unlock];
  return v3;
}

uint64_t __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];

  if (([v3 isEqualToString:@"com.apple.stocks"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.news"] & 1) != 0
    || NSClassFromString(&cfstr_Xctest.isa))
  {
    uint64_t v7 = 1;
    if ((NFStoreDemoMode() & 1) == 0 && *(void *)(a1 + 40) <= 1uLL)
    {
      uint64_t v4 = [*(id *)(a1 + 32) cachedSubscription];
      if (v4)
      {
        v5 = (void *)v4;
        BOOL v6 = -[FCBundleSubscriptionManager hasRunEntitlementOnce](*(void *)(a1 + 32));

        if (v6) {
          uint64_t v7 = 0;
        }
      }
    }
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_2;
    v9[3] = &unk_1E5B4C0B8;
    void v9[4] = *(void *)(a1 + 32);
    id v10 = v3;
    uint64_t v7 = __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_2((uint64_t)v9);
  }
  return v7;
}

uint64_t __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_78(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (FCBundleSubscriptionManager)initWithPrivateDataDirectory:(id)a3 configurationManager:(id)a4 cloudContext:(id)a5 contentContext:(id)a6 appActivityMonitor:(id)a7 entitlementsProvider:(id)a8
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v14 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v63 = v19;
    v57 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "privateDataDirectory != nil");
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[FCBundleSubscriptionManager initWithPrivateDataDirectory:configurationManager:cloudContext:co"
                         "ntentContext:appActivityMonitor:entitlementsProvider:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "FCBundleSubscriptionManager.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v67) = 78;
    WORD2(v67) = 2114;
    *(void *)((char *)&v67 + 6) = v57;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    id v19 = v63;
    if (v63) {
      goto LABEL_6;
    }
  }
  else if (v19)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v64 = v19;
    v58 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "entitlementsProvider != nil");
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[FCBundleSubscriptionManager initWithPrivateDataDirectory:configurationManager:cloudContext:co"
                         "ntentContext:appActivityMonitor:entitlementsProvider:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "FCBundleSubscriptionManager.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v67) = 79;
    WORD2(v67) = 2114;
    *(void *)((char *)&v67 + 6) = v58;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    id v19 = v64;
  }
LABEL_6:
  v65.receiver = self;
  v65.super_class = (Class)FCBundleSubscriptionManager;
  v20 = [(FCBundleSubscriptionManager *)&v65 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_configurationManager, a4);
    objc_storeStrong((id *)&v21->_bundleEntitlementsProvider, a8);
    objc_storeStrong((id *)&v21->_contentContext, a6);
    v21->_hasRunEntitlementOnce = 0;
    uint64_t v22 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    observers = v21->_observers;
    v21->_observers = (NSHashTable *)v22;

    v24 = (NFMutexLock *)objc_alloc_init(MEMORY[0x1E4F81BE0]);
    accessLock = v21->_accessLock;
    v21->_accessLock = v24;

    v26 = [[FCKeyValueStore alloc] initWithName:@"BundleSubscription" directory:v14 version:1 options:0 classRegistry:0];
    localStore = v21->_localStore;
    v21->_localStore = v26;

    v28 = [[FCBundleSubscriptionLookUpEntryManager alloc] initWithLocalStore:v21->_localStore];
    bundleSubscriptionLookupEntryManager = v21->_bundleSubscriptionLookupEntryManager;
    v21->_bundleSubscriptionLookupEntryManager = v28;

    v30 = -[FCBundleChannelProvider initWithLocalStore:appActivityMonitor:configurationManager:contentContext:]([FCBundleChannelProvider alloc], v21->_localStore, v18, v15, v17);
    bundleChannelProvider = v21->_bundleChannelProvider;
    v21->_bundleChannelProvider = (FCBundleChannelProviderType *)v30;

    [(FCBundleChannelProviderType *)v21->_bundleChannelProvider setDelegate:v21];
    v32 = [[FCAsyncSerialQueue alloc] initWithQualityOfService:25];
    refreshQueue = v21->_refreshQueue;
    v21->_refreshQueue = v32;

    v34 = [(FCBundleSubscriptionLookUpEntryManager *)v21->_bundleSubscriptionLookupEntryManager bundleSubscriptionLookUpEntry];
    v35 = v34;
    id v62 = v19;
    if (!v34)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __54__FCBundleSubscriptionManager_setupCachedSubscription__block_invoke;
      *(void *)&long long v67 = &unk_1E5B4C018;
      *((void *)&v67 + 1) = v21;
      __54__FCBundleSubscriptionManager_setupCachedSubscription__block_invoke((uint64_t)buf);
LABEL_20:

      v55 = [v16 networkReachability];
      [v55 addObserver:v21];

      [v18 addObserver:v21];
      id v19 = v62;
      goto LABEL_21;
    }
    if (![v34 purchaseValidationState])
    {
      v47 = [v35 bundleSubscription];
      -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:]((uint64_t)v21, v47);
      v48 = (void *)FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
      {
        v49 = v48;
        v50 = [(FCBundleSubscriptionManager *)v21 cachedSubscription];
        [v50 debugDescription];
        v51 = id v61 = v17;
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v51;
        _os_log_impl(&dword_1A460D000, v49, OS_LOG_TYPE_DEFAULT, "Cache bundle subscription state valid: %{public}@", buf, 0xCu);

        id v17 = v61;
      }

      goto LABEL_20;
    }
    id v59 = v15;
    id v60 = v17;
    uint64_t v36 = [v35 purchaseValidationState];
    v37 = v21->_bundleChannelProvider;
    v38 = [(FCBundleChannelProviderType *)v37 bundleChannelIDs];
    if (v36 == 1)
    {
      uint64_t v39 = +[FCBundleSubscription subscriptionWithSubscriptionState:2 bundleChannelIDs:v38];
      v40 = [NSNumber numberWithUnsignedInteger:v39 + 132];
      v41 = [NSNumber numberWithUnsignedInteger:-132 - v39];
      objc_setAssociatedObject((id)v39, (const void *)(v39 + 1), v40, (void *)1);
      objc_setAssociatedObject((id)v39, (const void *)(-133 - v39), v41, (void *)1);

      -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:]((uint64_t)v21, (void *)v39);
      v42 = (void *)FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
      {
        v43 = v42;
        v44 = [(FCBundleSubscriptionManager *)v21 cachedSubscription];
        v45 = [v44 debugDescription];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v45;
        v46 = "Cache bundle subscription state expired: %{public}@";
LABEL_18:
        _os_log_impl(&dword_1A460D000, v43, OS_LOG_TYPE_DEFAULT, v46, buf, 0xCu);
      }
    }
    else
    {
      uint64_t v39 = +[FCBundleSubscription subscriptionWithSubscriptionState:3 bundleChannelIDs:v38];
      v52 = [NSNumber numberWithUnsignedInteger:v39 + 139];
      v53 = [NSNumber numberWithUnsignedInteger:-139 - v39];
      objc_setAssociatedObject((id)v39, (const void *)(v39 + 1), v52, (void *)1);
      objc_setAssociatedObject((id)v39, (const void *)(-140 - v39), v53, (void *)1);

      -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:]((uint64_t)v21, (void *)v39);
      v54 = (void *)FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
      {
        v43 = v54;
        v44 = [(FCBundleSubscriptionManager *)v21 cachedSubscription];
        v45 = [v44 debugDescription];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v45;
        v46 = "Cache bundle subscription state not subscribed: %{public}@";
        goto LABEL_18;
      }
    }

    id v15 = v59;
    id v17 = v60;
    goto LABEL_20;
  }
LABEL_21:

  return v21;
}

void __54__FCBundleSubscriptionManager_setupCachedSubscription__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "Cache bundle subscription is initialized as 'not subscribed' state", (uint8_t *)&v14, 2u);
  }
  id v3 = *(void **)(a1 + 32);
  if (v3) {
    id v3 = (void *)v3[8];
  }
  uint64_t v4 = v3;
  v5 = [v4 bundleChannelIDs];
  uint64_t v6 = +[FCBundleSubscription subscriptionWithSubscriptionState:3 bundleChannelIDs:v5];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:v6 + 116];
  id v8 = [NSNumber numberWithUnsignedInteger:-116 - v6];
  objc_setAssociatedObject((id)v6, (const void *)(v6 + 1), v7, (void *)1);
  objc_setAssociatedObject((id)v6, (const void *)(-117 - v6), v8, (void *)1);

  -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:](*(void *)(a1 + 32), (void *)v6);
  v9 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = *(void **)(a1 + 32);
    id v11 = v9;
    v12 = [v10 cachedSubscription];
    uint64_t v13 = [v12 debugDescription];
    int v14 = 138543362;
    id v15 = v13;
    _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "Cache bundle subscription is set up: %{public}@", (uint8_t *)&v14, 0xCu);
  }
}

- (void)updateCachedSubscriptionWithSubscription:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a2;
  if (a1)
  {
    [*(id *)(a1 + 56) lock];
    objc_storeStrong((id *)(a1 + 88), a2);
    v5 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v5;
      uint64_t v7 = [v4 debugDescription];
      int v15 = 138412290;
      uint64_t v16 = v7;
      _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "updateCachedSubscriptionWithSubscription  bundleSubscription= %@", (uint8_t *)&v15, 0xCu);
    }
    [*(id *)(a1 + 56) unlock];
    id v8 = NewsCoreUserDefaults();
    v9 = v4;
    id v10 = objc_getAssociatedObject(v9, v4 + 1);
    uint64_t v11 = [v10 unsignedIntegerValue];
    char v12 = v11;
    uint64_t v13 = objc_getAssociatedObject(v9, (const void *)~v11);

    uint64_t v14 = (([v13 unsignedIntegerValue] + 1) ^ (v12 + 1)) & 1;
    [v8 setBool:v14 forKey:@"news_url_resolution_subscription_status"];
  }
}

- (void)prepareForUseWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__FCBundleSubscriptionManager_prepareForUseWithCompletion___block_invoke;
  v6[3] = &unk_1E5B4F828;
  id v7 = v4;
  id v5 = v4;
  [(FCBundleSubscriptionManager *)self refreshBundleSubscriptionWithCachePolicy:1 completion:v6];
}

- (void)refreshBundleSubscriptionWithCachePolicy:(unint64_t)a3 completion:(id)a4
{
}

- (void)refreshBundleSubscriptionWithCachePolicy:(unint64_t)a3 hideBundleDetectionUI:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke;
  aBlock[3] = &unk_1E5B4F6E8;
  aBlock[4] = self;
  aBlock[5] = a3;
  v9 = (uint64_t (**)(void))_Block_copy(aBlock);
  if (v9[2]())
  {
    BOOL v11 = a3 == 3 || a3 == 0;
    if (self) {
      refreshQueue = self->_refreshQueue;
    }
    else {
      refreshQueue = 0;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_3;
    v14[3] = &unk_1E5B4F760;
    uint64_t v13 = (id *)&v15;
    int v15 = v9;
    id v16 = v8;
    unint64_t v17 = a3;
    v14[4] = self;
    BOOL v18 = v11;
    BOOL v19 = a4;
    [(FCAsyncSerialQueue *)refreshQueue enqueueBlock:v14];
  }
  else
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_75;
    v20[3] = &unk_1E5B4C7C0;
    uint64_t v13 = &v21;
    v20[4] = self;
    id v21 = v8;
    __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_75((uint64_t)v20);
  }
}

void __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_75(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_2_76;
  v3[3] = &unk_1E5B4C7C0;
  id v2 = *(id *)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  FCPerformBlockOnMainThread(v3);
}

void __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    id v5 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 56);
      id v7 = v5;
      id v8 = FCStringFromBundleSubscriptionCachePolicy(v6);
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "Will refresh bundle subscription with cache policy=%{public}@", (uint8_t *)&buf, 0xCu);
    }
    v9 = *(id **)(a1 + 32);
    int v10 = *(unsigned __int8 *)(a1 + 64);
    char v26 = *(unsigned char *)(a1 + 65);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_77;
    v28[3] = &unk_1E5B4F738;
    id v29 = v4;
    id v30 = v3;
    id v31 = *(id *)(a1 + 48);
    id v11 = v3;
    id v12 = v4;
    v27 = v28;
    if (v9)
    {
      if (!-[FCBundleSubscriptionManager hasRunEntitlementOnce]((uint64_t)v9))
      {
        uint64_t v13 = FCPurchaseLog;
        if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "Fetching entitlements now because the entitlements check has not run at least once", (uint8_t *)&buf, 2u);
        }
      }
      uint64_t v14 = dispatch_group_create();
      v52[0] = 0;
      v52[1] = v52;
      v52[2] = 0x3032000000;
      v52[3] = __Block_byref_object_copy__17;
      v52[4] = __Block_byref_object_dispose__17;
      id v53 = 0;
      v50[0] = 0;
      v50[1] = v50;
      v50[2] = 0x3032000000;
      v50[3] = __Block_byref_object_copy__17;
      v50[4] = __Block_byref_object_dispose__17;
      id v51 = 0;
      int v15 = [MEMORY[0x1E4F1C9C8] date];
      dispatch_group_enter(v14);
      id v16 = v9[8];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __95__FCBundleSubscriptionManager__unguardedRefreshIgnoringCache_hideBundleDetectionUI_completion___block_invoke;
      v45[3] = &unk_1E5B4F788;
      v48 = v52;
      v49 = v50;
      v45[4] = v9;
      id v17 = v15;
      id v46 = v17;
      BOOL v18 = v14;
      v47 = v18;
      [v16 loadInitialBundleChannelIDsWithCompletion:v45];

      v43[0] = 0;
      v43[1] = v43;
      v43[2] = 0x3032000000;
      v43[3] = __Block_byref_object_copy__17;
      v43[4] = __Block_byref_object_dispose__17;
      id v44 = 0;
      v41[0] = 0;
      v41[1] = v41;
      v41[2] = 0x3032000000;
      v41[3] = __Block_byref_object_copy__17;
      v41[4] = __Block_byref_object_dispose__17;
      id v42 = 0;
      BOOL v19 = [MEMORY[0x1E4F1C9C8] date];
      dispatch_group_enter(v18);
      id v20 = v9[2];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __95__FCBundleSubscriptionManager__unguardedRefreshIgnoringCache_hideBundleDetectionUI_completion___block_invoke_81;
      v36[3] = &unk_1E5B4F7B0;
      uint64_t v39 = v43;
      v40 = v41;
      id v21 = v19;
      id v37 = v21;
      uint64_t v22 = v18;
      v38 = v22;
      [v20 fetchEntitlementsWithIgnoreCache:v10 != 0 completion:v36];

      objc_initWeak(&location, v9);
      if (FCDispatchGroupIsEmpty(v22))
      {
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        v55 = __95__FCBundleSubscriptionManager__unguardedRefreshIgnoringCache_hideBundleDetectionUI_completion___block_invoke_83;
        v56 = &unk_1E5B4F800;
        objc_copyWeak(&v63, &location);
        id v59 = v43;
        v57 = v9;
        id v60 = v52;
        id v61 = v50;
        char v64 = v26;
        id v62 = v41;
        v58 = v27;
        v55((uint64_t)&buf);
      }
      else
      {
        v25 = dispatch_get_global_queue(25, 0);
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        v55 = __95__FCBundleSubscriptionManager__unguardedRefreshIgnoringCache_hideBundleDetectionUI_completion___block_invoke_86;
        v56 = &unk_1E5B4F800;
        objc_copyWeak(&v63, &location);
        id v59 = v43;
        v57 = v9;
        id v60 = v52;
        id v61 = v50;
        char v64 = v26;
        id v62 = v41;
        v58 = v27;
        dispatch_group_notify(v22, v25, &buf);
      }
      objc_destroyWeak(&v63);
      objc_destroyWeak(&location);

      _Block_object_dispose(v41, 8);
      _Block_object_dispose(v43, 8);

      _Block_object_dispose(v50, 8);
      _Block_object_dispose(v52, 8);
    }
  }
  else
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_4;
    v32[3] = &unk_1E5B4F710;
    id v33 = v3;
    id v23 = *(id *)(a1 + 48);
    uint64_t v24 = *(void *)(a1 + 32);
    id v34 = v23;
    v32[4] = v24;
    id v12 = v3;
    __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_4((uint64_t)v32);

    id v11 = v33;
  }
}

- (BOOL)hasRunEntitlementOnce
{
  if (!a1) {
    return 0;
  }
  [*(id *)(a1 + 56) lock];
  BOOL v2 = *(unsigned char *)(a1 + 8) != 0;
  [*(id *)(a1 + 56) unlock];
  return v2;
}

void __95__FCBundleSubscriptionManager__unguardedRefreshIgnoringCache_hideBundleDetectionUI_completion___block_invoke_81(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  id v8 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(void **)(a1 + 32);
    int v10 = v8;
    int v11 = 134217984;
    uint64_t v12 = objc_msgSend(v9, "fc_millisecondTimeIntervalUntilNow");
    _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "Spent %llums fetching entitlements for bundle subscription", (uint8_t *)&v11, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __95__FCBundleSubscriptionManager__unguardedRefreshIgnoringCache_hideBundleDetectionUI_completion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v2 = *(void **)(a1 + 32);
  if (v2) {
    BOOL v2 = (void *)v2[8];
  }
  id v3 = v2;
  id v4 = [v3 bundleChannelIDs];
  uint64_t v5 = [v4 copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = *(void **)(a1 + 32);
  if (v8) {
    id v8 = (void *)v8[8];
  }
  v9 = v8;
  int v10 = [v9 bundleChannelIDsVersion];
  uint64_t v11 = [v10 copy];
  uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = *(void **)(a1 + 40);
    id v16 = v14;
    int v17 = 134217984;
    uint64_t v18 = objc_msgSend(v15, "fc_millisecondTimeIntervalUntilNow");
    _os_log_impl(&dword_1A460D000, v16, OS_LOG_TYPE_DEFAULT, "Spent %llums fetching channel IDs for bundle subscription", (uint8_t *)&v17, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)addObserver:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    if (self) {
      observers = self->_observers;
    }
    else {
      observers = 0;
    }
    if ([(NSHashTable *)observers containsObject:v4]
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"%p is already an observer", v4);
      *(_DWORD *)long long buf = 136315906;
      int v10 = "-[FCBundleSubscriptionManager addObserver:]";
      __int16 v11 = 2080;
      uint64_t v12 = "FCBundleSubscriptionManager.m";
      __int16 v13 = 1024;
      int v14 = 606;
      __int16 v15 = 2114;
      id v16 = v8;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      if (self) {
        goto LABEL_7;
      }
    }
    else if (self)
    {
LABEL_7:
      uint64_t v6 = self->_observers;
LABEL_8:
      [(NSHashTable *)v6 addObject:v4];
      goto LABEL_11;
    }
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer != nil");
    *(_DWORD *)long long buf = 136315906;
    int v10 = "-[FCBundleSubscriptionManager addObserver:]";
    __int16 v11 = 2080;
    uint64_t v12 = "FCBundleSubscriptionManager.m";
    __int16 v13 = 1024;
    int v14 = 602;
    __int16 v15 = 2114;
    id v16 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_11:
}

- (void)prewarmBundleTagIDsWithPurchaseID:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [FCPurchaseLookupFetchOperation alloc];
  v10[0] = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  if (self) {
    contentContext = self->_contentContext;
  }
  else {
    contentContext = 0;
  }
  id v8 = [(FCPurchaseLookupFetchOperation *)v5 initWithPurchaseIDs:v6 contentContext:contentContext];

  [(FCOperation *)v8 setQualityOfService:25];
  [(FCOperation *)v8 setRelativePriority:1];
  v9 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
  [v9 addOperation:v8];
}

void __95__FCBundleSubscriptionManager__unguardedRefreshIgnoringCache_hideBundleDetectionUI_completion___block_invoke_86(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __95__FCBundleSubscriptionManager__unguardedRefreshIgnoringCache_hideBundleDetectionUI_completion___block_invoke_2_87;
  v5[3] = &unk_1E5B4F7D8;
  v5[4] = *(void *)(a1 + 32);
  long long v7 = *(_OWORD *)(a1 + 56);
  char v9 = *(unsigned char *)(a1 + 88);
  uint64_t v8 = *(void *)(a1 + 72);
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  FCPerformIfNonNil(WeakRetained, v5);
}

void __95__FCBundleSubscriptionManager__unguardedRefreshIgnoringCache_hideBundleDetectionUI_completion___block_invoke_2_87(uint64_t a1, void *a2)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v4 = [v3 cachedSubscription];
  uint64_t v5 = [v4 copy];

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    long long v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v6 removeObjectForKey:FCEntitlementsNotFoundErrorDateDate];

    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v72 = (uint64_t)v3;
    if (v7) {
      uint64_t v8 = *(void **)(v7 + 72);
    }
    else {
      uint64_t v8 = 0;
    }
    char v9 = [v8 configuration];
    int v10 = [v9 paidBundleViaOfferConfig];
    __int16 v11 = [v10 vendorAdHocOfferIds];

    uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) vendorAdHocOfferID];
    v70 = v11;
    uint64_t v71 = v5;
    if (v12)
    {
      __int16 v13 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) vendorAdHocOfferID];
      unsigned int v14 = [v11 containsObject:v13];
    }
    else
    {
      unsigned int v14 = 0;
    }

    id v21 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) bundlePurchaseID];
    uint64_t v22 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v23 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v24 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) inTrialPeriod];
    uint64_t v25 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isPurchaser];
    char v26 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) servicesBundlePurchaseID];
    char v27 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isAmplifyUser];
    v28 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) initialPurchaseTimestamp];
    id v29 = FCBundleSubscriptionMakeInline(v21, v22, v23, v24, v25, v26, v27, v14, v28);

    id v30 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = v30;
      v32 = [v29 debugDescription];
      *(_DWORD *)long long buf = 138412290;
      v74 = v32;
      _os_log_impl(&dword_1A460D000, v31, OS_LOG_TYPE_DEFAULT, "Refresh bundle subscription bundleSubscription= %@", buf, 0xCu);
    }
    uint64_t v5 = v71;
    id v33 = (id)v71;
    id v34 = objc_getAssociatedObject(v33, (const void *)(v71 + 1));
    uint64_t v35 = [v34 unsignedIntegerValue];
    char v36 = v35;
    id v37 = objc_getAssociatedObject(v33, (const void *)~v35);

    char v38 = ([v37 unsignedIntegerValue] + 1) ^ (v36 + 1);
    if (v38)
    {
      v50 = v70;
      if (([v33 isEqual:v29] & 1) == 0)
      {
        id v51 = (void *)FCPurchaseLog;
        if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
        {
          v52 = v51;
          id v53 = [v33 debugDescription];
          v54 = [v29 debugDescription];
          *(_DWORD *)long long buf = 138543618;
          v74 = v53;
          __int16 v75 = 2114;
          v76 = v54;
          _os_log_impl(&dword_1A460D000, v52, OS_LOG_TYPE_DEFAULT, "Checked cachedSubscription: %{public}@ is not equal to bundleSubscription: %{public}@", buf, 0x16u);
        }
        if (v72) {
          v55 = *(void **)(v72 + 40);
        }
        else {
          v55 = 0;
        }
        v56 = [v55 bundleSubscriptionLookUpEntry];
        v57 = (void *)[v56 mutableCopy];

        if (v57)
        {
          [v57 setBundleChannelIDs:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
          [v57 setBundleChannelIDsVersion:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
          v58 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) bundlePurchaseID];
          [v57 setPurchaseID:v58];

          objc_msgSend(v57, "setInTrialPeriod:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "inTrialPeriod"));
          objc_msgSend(v57, "setIsPurchaser:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "isPurchaser"));
          id v59 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) servicesBundlePurchaseID];
          [v57 setServicesBundlePurchaseID:v59];

          objc_msgSend(v57, "setIsAmplifyUser:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "isAmplifyUser"));
          [v57 setIsPaidBundleViaOfferActivated:v14];
          if (v72) {
            id v60 = *(void **)(v72 + 40);
          }
          else {
            id v60 = 0;
          }
          [v60 updateEntry:v57];
        }
        id v61 = (void *)[v29 copy];
        id v62 = (void *)[v33 copy];
        -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:](v72, v29);
        -[FCBundleSubscriptionManager notifyObserversForChangeStateWithNewSubscription:previousBundleSubscription:](v72, v61, v62);
      }
    }
    else
    {
      uint64_t v39 = FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A460D000, v39, OS_LOG_TYPE_INFO, "Bundle subscription did subscribe", buf, 2u);
      }
      uint64_t v68 = v29;
      char v69 = v14;
      if (v72) {
        v40 = *(void **)(v72 + 40);
      }
      else {
        v40 = 0;
      }
      uint64_t v67 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v41 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      id v42 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      id v43 = v40;
      id v44 = [v42 bundlePurchaseID];
      uint64_t v45 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) inTrialPeriod];
      uint64_t v46 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isPurchaser];
      v47 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) servicesBundlePurchaseID];
      char v48 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isAmplifyUser];
      v49 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) initialPurchaseTimestamp];
      LOBYTE(v66) = v69;
      LOBYTE(v65) = v48;
      [v43 addBundleChannelIDs:v67 bundleChannelIDsVersion:v41 purchaseID:v44 inTrialPeriod:v45 isPurchaser:v46 servicesBundlePurchaseID:v47 isAmplifyUser:v65 initialPurchaseTimestamp:v49 isPaidBundleViaOfferActivated:v66];

      id v29 = v68;
      -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:](v72, v68);
      -[FCBundleSubscriptionManager notifyObserversForSubscribedStateWithSubscription:hideBundleDetectionUI:](v72, v68, *(unsigned char *)(a1 + 80));
      v50 = v70;
      uint64_t v5 = v71;
    }

    id v3 = (id)v72;
  }
  else
  {
    if ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) code] != 5002) {
      goto LABEL_41;
    }
    id v15 = (id)v5;
    id v16 = objc_getAssociatedObject(v15, (const void *)(v5 + 1));
    uint64_t v17 = [v16 unsignedIntegerValue];
    char v18 = v17;
    uint64_t v19 = objc_getAssociatedObject(v15, (const void *)~v17);

    LOBYTE(v15) = [v19 unsignedIntegerValue] ^ v18;
    if (v15)
    {
      -[FCBundleSubscriptionManager expireBundleSubscription]((id *)v3);
    }
    else
    {
LABEL_41:
      if ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) code] == 3001)
      {
        id v20 = FCPurchaseLog;
        if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1A460D000, v20, OS_LOG_TYPE_DEFAULT, "Refresh bundle subscription failed with timeout error. Maintaining the same state as before", buf, 2u);
        }
      }
    }
  }
  -[FCBundleSubscriptionManager updateHasRunEntitlementOnce:]((uint64_t)v3);
  uint64_t v63 = *(void *)(a1 + 40);
  if (v63)
  {
    char v64 = [v3 cachedSubscription];
    (*(void (**)(uint64_t, void *))(v63 + 16))(v63, v64);
  }
}

- (uint64_t)updateHasRunEntitlementOnce:(uint64_t)result
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 56) lock];
    *(unsigned char *)(v1 + 8) = 1;
    BOOL v2 = *(void **)(v1 + 56);
    return [v2 unlock];
  }
  return result;
}

- (FCBundleSubscription)validatedCachedSubscription
{
  BOOL v2 = self;
  if (self) {
    self = (FCBundleSubscriptionManager *)self->_accessLock;
  }
  [(FCBundleSubscriptionManager *)self lock];
  if (v2->_hasRunEntitlementOnce) {
    cachedSubscription = v2->_cachedSubscription;
  }
  else {
    cachedSubscription = 0;
  }
  long long v4 = cachedSubscription;
  [(NFMutexLock *)v2->_accessLock unlock];
  return v4;
}

- (void)setEntitlementsOverrideProvider:(id)a3
{
  if (self) {
    self = (FCBundleSubscriptionManager *)self->_bundleEntitlementsProvider;
  }
  [(FCBundleSubscriptionManager *)self setEntitlementsOverrideProvider:a3];
}

void __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_2_76(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) cachedSubscription];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

uint64_t __59__FCBundleSubscriptionManager_prepareForUseWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (FCBundleSubscriptionManager)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)long long buf = 136315906;
    uint64_t v8 = "-[FCBundleSubscriptionManager init]";
    __int16 v9 = 2080;
    int v10 = "FCBundleSubscriptionManager.m";
    __int16 v11 = 1024;
    int v12 = 68;
    __int16 v13 = 2114;
    unsigned int v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCBundleSubscriptionManager init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)activityObservingApplicationDidEnterBackground
{
  id v2 = self;
  if (self) {
    self = (FCBundleSubscriptionManager *)self->_bundleSubscriptionLookupEntryManager;
  }
  [(FCBundleSubscriptionManager *)self cleanupStaleExpiredEntry];
  if (NFInternalBuild())
  {
    if (v2)
    {
      id v3 = FCPersistenceQueue();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__FCBundleSubscriptionManager_saveReadableBundleState__block_invoke;
      block[3] = &unk_1E5B4C018;
      block[4] = v2;
      dispatch_async(v3, block);
    }
  }
}

void __54__FCBundleSubscriptionManager_saveReadableBundleState__block_invoke(uint64_t a1)
{
  v36[3] = *MEMORY[0x1E4F143B8];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __54__FCBundleSubscriptionManager_saveReadableBundleState__block_invoke_2;
  v32[3] = &unk_1E5B4C2A0;
  v32[4] = *(void *)(a1 + 32);
  id v2 = __54__FCBundleSubscriptionManager_saveReadableBundleState__block_invoke_2((uint64_t)v32);
  v36[0] = v2;
  v35[0] = @"state";
  v35[1] = @"bundleChannels";
  id v3 = [*(id *)(a1 + 32) bundleSubscription];
  uint64_t v4 = [v3 bundleChannelIDs];
  uint64_t v5 = [v4 array];
  v36[1] = v5;
  v35[2] = @"lastUpdated";
  id v6 = NSString;
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSince1970];
  __int16 v9 = objc_msgSend(v6, "stringWithFormat:", @"%f", v8);
  v36[2] = v9;
  int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];

  id v31 = 0;
  __int16 v11 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v10 options:1 error:&v31];
  id v12 = v31;
  id v13 = v12;
  if (v11)
  {
    unsigned int v14 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v15 = *(void *)(a1 + 32);
    if (v15) {
      id v16 = *(void **)(v15 + 32);
    }
    else {
      id v16 = 0;
    }
    uint64_t v17 = [v16 storeDirectory];
    char v18 = [v14 fileURLWithPath:v17];
    uint64_t v19 = [v18 URLByAppendingPathComponent:@"bundle"];
    id v20 = [v19 URLByAppendingPathExtension:@"json"];

    if (v20)
    {
      id v21 = [v20 path];
      id v28 = v13;
      int v22 = [v11 writeToFile:v21 options:1 error:&v28];
      id v23 = v28;

      uint64_t v24 = FCPersonalizationLog;
      if (v22)
      {
        if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v25 = v24;
          char v26 = [v20 path];
          *(_DWORD *)long long buf = 138412290;
          id v34 = v26;
          _os_log_debug_impl(&dword_1A460D000, v25, OS_LOG_TYPE_DEBUG, "Successfully saved readable bundle data at %@.", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v34 = v23;
        _os_log_error_impl(&dword_1A460D000, v24, OS_LOG_TYPE_ERROR, "Error when saving readable bundle data: %@", buf, 0xCu);
      }
      id v13 = v23;
    }
    else
    {
      char v27 = FCPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_1A460D000, v27, OS_LOG_TYPE_ERROR, "Failed to construct file URL for saving readable bundle data", buf, 2u);
      }
      id v20 = 0;
    }
  }
  else
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __54__FCBundleSubscriptionManager_saveReadableBundleState__block_invoke_3;
    v29[3] = &unk_1E5B4C018;
    id v13 = v12;
    id v30 = v13;
    __54__FCBundleSubscriptionManager_saveReadableBundleState__block_invoke_3((uint64_t)v29);
    id v20 = v30;
  }
}

__CFString *__54__FCBundleSubscriptionManager_saveReadableBundleState__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) bundleSubscription];
  unint64_t v2 = [v1 unprotectedSubscriptionState];

  if (v2 > 2) {
    return @"unsubscribed";
  }
  else {
    return off_1E5B4F848[v2];
  }
}

void __54__FCBundleSubscriptionManager_saveReadableBundleState__block_invoke_3(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "Error when saving readable bundle data: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)bundleChannelProvider:(id)a3 bundleChannelIDsDidChangeWithChannelIDs:(id)a4 version:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  __int16 v9 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = v9;
    __int16 v11 = [(FCBundleSubscriptionManager *)self cachedSubscription];
    id v12 = [v11 debugDescription];
    int v19 = 138412290;
    id v20 = v12;
    _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "bundleChannelIDsDidChangeWithChannelIDs  bundleSubscription= %@", (uint8_t *)&v19, 0xCu);
  }
  id v13 = [(FCBundleSubscriptionManager *)self cachedSubscription];
  unsigned int v14 = (void *)[v13 copy];

  uint64_t v15 = (void *)MEMORY[0x1E4F1CAA0];
  id v16 = (void *)[v7 copy];
  uint64_t v17 = [v15 orderedSetWithArray:v16];
  [v14 setBundleChannelIDs:v17];

  char v18 = (void *)[v8 copy];
  [v14 setBundleChannelIDsVersion:v18];

  -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:]((uint64_t)self, v14);
}

uint64_t __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = v2;
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412546;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1A460D000, v3, OS_LOG_TYPE_DEFAULT, "%@ ignoring bundle entitlement check for bundleID=%{public}@", (uint8_t *)&v7, 0x16u);
  }
  return 0;
}

void __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_5;
  v3[3] = &unk_1E5B4C7C0;
  id v2 = *(id *)(a1 + 48);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  FCPerformBlockOnMainThread(v3);
}

void __105__FCBundleSubscriptionManager_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) cachedSubscription];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

void __95__FCBundleSubscriptionManager__unguardedRefreshIgnoringCache_hideBundleDetectionUI_completion___block_invoke_83(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __95__FCBundleSubscriptionManager__unguardedRefreshIgnoringCache_hideBundleDetectionUI_completion___block_invoke_2;
  v5[3] = &unk_1E5B4F7D8;
  v5[4] = *(void *)(a1 + 32);
  long long v7 = *(_OWORD *)(a1 + 56);
  char v9 = *(unsigned char *)(a1 + 88);
  uint64_t v8 = *(void *)(a1 + 72);
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  FCPerformIfNonNil(WeakRetained, v5);
}

void __95__FCBundleSubscriptionManager__unguardedRefreshIgnoringCache_hideBundleDetectionUI_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v4 = [v3 cachedSubscription];
  uint64_t v5 = [v4 copy];

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    long long v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v6 removeObjectForKey:FCEntitlementsNotFoundErrorDateDate];

    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v72 = (uint64_t)v3;
    if (v7) {
      uint64_t v8 = *(void **)(v7 + 72);
    }
    else {
      uint64_t v8 = 0;
    }
    char v9 = [v8 configuration];
    uint64_t v10 = [v9 paidBundleViaOfferConfig];
    uint64_t v11 = [v10 vendorAdHocOfferIds];

    id v12 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) vendorAdHocOfferID];
    v70 = v11;
    uint64_t v71 = v5;
    if (v12)
    {
      id v13 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) vendorAdHocOfferID];
      unsigned int v14 = [v11 containsObject:v13];
    }
    else
    {
      unsigned int v14 = 0;
    }

    uint64_t v21 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) bundlePurchaseID];
    int v22 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v23 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v24 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) inTrialPeriod];
    uint64_t v25 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isPurchaser];
    char v26 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) servicesBundlePurchaseID];
    char v27 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isAmplifyUser];
    id v28 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) initialPurchaseTimestamp];
    id v29 = FCBundleSubscriptionMakeInline(v21, v22, v23, v24, v25, v26, v27, v14, v28);

    id v30 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = v30;
      v32 = [v29 debugDescription];
      *(_DWORD *)long long buf = 138412290;
      v74 = v32;
      _os_log_impl(&dword_1A460D000, v31, OS_LOG_TYPE_DEFAULT, "Refresh bundle subscription bundleSubscription= %@", buf, 0xCu);
    }
    uint64_t v5 = v71;
    id v33 = (id)v71;
    id v34 = objc_getAssociatedObject(v33, (const void *)(v71 + 1));
    uint64_t v35 = [v34 unsignedIntegerValue];
    char v36 = v35;
    id v37 = objc_getAssociatedObject(v33, (const void *)~v35);

    char v38 = ([v37 unsignedIntegerValue] + 1) ^ (v36 + 1);
    if (v38)
    {
      v50 = v70;
      if (([v33 isEqual:v29] & 1) == 0)
      {
        id v51 = (void *)FCPurchaseLog;
        if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
        {
          v52 = v51;
          id v53 = [v33 debugDescription];
          v54 = [v29 debugDescription];
          *(_DWORD *)long long buf = 138543618;
          v74 = v53;
          __int16 v75 = 2114;
          v76 = v54;
          _os_log_impl(&dword_1A460D000, v52, OS_LOG_TYPE_DEFAULT, "Checked cachedSubscription: %{public}@ is not equal to bundleSubscription: %{public}@", buf, 0x16u);
        }
        if (v72) {
          v55 = *(void **)(v72 + 40);
        }
        else {
          v55 = 0;
        }
        v56 = [v55 bundleSubscriptionLookUpEntry];
        v57 = (void *)[v56 mutableCopy];

        if (v57)
        {
          [v57 setBundleChannelIDs:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
          [v57 setBundleChannelIDsVersion:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
          v58 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) bundlePurchaseID];
          [v57 setPurchaseID:v58];

          objc_msgSend(v57, "setInTrialPeriod:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "inTrialPeriod"));
          objc_msgSend(v57, "setIsPurchaser:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "isPurchaser"));
          id v59 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) servicesBundlePurchaseID];
          [v57 setServicesBundlePurchaseID:v59];

          objc_msgSend(v57, "setIsAmplifyUser:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "isAmplifyUser"));
          [v57 setIsPaidBundleViaOfferActivated:v14];
          if (v72) {
            id v60 = *(void **)(v72 + 40);
          }
          else {
            id v60 = 0;
          }
          [v60 updateEntry:v57];
        }
        id v61 = (void *)[v29 copy];
        id v62 = (void *)[v33 copy];
        -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:](v72, v29);
        -[FCBundleSubscriptionManager notifyObserversForChangeStateWithNewSubscription:previousBundleSubscription:](v72, v61, v62);
      }
    }
    else
    {
      uint64_t v39 = FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A460D000, v39, OS_LOG_TYPE_INFO, "Bundle subscription did subscribe", buf, 2u);
      }
      uint64_t v68 = v29;
      char v69 = v14;
      if (v72) {
        v40 = *(void **)(v72 + 40);
      }
      else {
        v40 = 0;
      }
      uint64_t v67 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v41 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      id v42 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      id v43 = v40;
      id v44 = [v42 bundlePurchaseID];
      uint64_t v45 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) inTrialPeriod];
      uint64_t v46 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isPurchaser];
      v47 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) servicesBundlePurchaseID];
      char v48 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isAmplifyUser];
      v49 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) initialPurchaseTimestamp];
      LOBYTE(v66) = v69;
      LOBYTE(v65) = v48;
      [v43 addBundleChannelIDs:v67 bundleChannelIDsVersion:v41 purchaseID:v44 inTrialPeriod:v45 isPurchaser:v46 servicesBundlePurchaseID:v47 isAmplifyUser:v65 initialPurchaseTimestamp:v49 isPaidBundleViaOfferActivated:v66];

      id v29 = v68;
      -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:](v72, v68);
      -[FCBundleSubscriptionManager notifyObserversForSubscribedStateWithSubscription:hideBundleDetectionUI:](v72, v68, *(unsigned char *)(a1 + 80));
      v50 = v70;
      uint64_t v5 = v71;
    }

    id v3 = (id)v72;
  }
  else
  {
    if ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) code] != 5002) {
      goto LABEL_41;
    }
    id v15 = (id)v5;
    id v16 = objc_getAssociatedObject(v15, (const void *)(v5 + 1));
    uint64_t v17 = [v16 unsignedIntegerValue];
    char v18 = v17;
    int v19 = objc_getAssociatedObject(v15, (const void *)~v17);

    LOBYTE(v15) = [v19 unsignedIntegerValue] ^ v18;
    if (v15)
    {
      -[FCBundleSubscriptionManager expireBundleSubscription]((id *)v3);
    }
    else
    {
LABEL_41:
      if ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) code] == 3001)
      {
        id v20 = FCPurchaseLog;
        if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1A460D000, v20, OS_LOG_TYPE_DEFAULT, "Refresh bundle subscription failed with timeout error. Maintaining the same state as before", buf, 2u);
        }
      }
    }
  }
  -[FCBundleSubscriptionManager updateHasRunEntitlementOnce:]((uint64_t)v3);
  uint64_t v63 = *(void *)(a1 + 40);
  if (v63)
  {
    char v64 = [v3 cachedSubscription];
    (*(void (**)(uint64_t, void *))(v63 + 16))(v63, v64);
  }
}

- (void)notifyObserversForSubscribedStateWithSubscription:(char)a3 hideBundleDetectionUI:
{
  id v5 = a2;
  long long v6 = v5;
  if (a1)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __103__FCBundleSubscriptionManager_notifyObserversForSubscribedStateWithSubscription_hideBundleDetectionUI___block_invoke;
    v7[3] = &unk_1E5B4C710;
    v7[4] = a1;
    id v8 = v5;
    char v9 = a3;
    FCPerformBlockOnMainThread(v7);
  }
}

- (void)notifyObserversForChangeStateWithNewSubscription:(void *)a3 previousBundleSubscription:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __107__FCBundleSubscriptionManager_notifyObserversForChangeStateWithNewSubscription_previousBundleSubscription___block_invoke;
    v7[3] = &unk_1E5B4C738;
    v7[4] = a1;
    id v8 = v5;
    id v9 = v6;
    FCPerformBlockOnMainThread(v7);
  }
}

- (void)expireBundleSubscription
{
  if (a1)
  {
    id v2 = FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned int v14 = 0;
      _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_INFO, "Bundle subscription did expire", v14, 2u);
    }
    id v3 = [a1[5] bundleSubscriptionLookUpEntry];
    long long v4 = (void *)[v3 mutableCopy];

    if (v4)
    {
      id v5 = [MEMORY[0x1E4F1C9C8] date];
      [v4 setDateOfExpiration:v5];

      [v4 setPurchaseValidationState:1];
      [a1[5] updateEntry:v4];
    }
    id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v6 removeObjectForKey:FCEntitlementsCacheExpiredErrorDateDate];

    uint64_t v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v7 removeObjectForKey:FCEntitlementsNotFoundErrorDateDate];

    id v8 = a1[8];
    id v9 = [v8 bundleChannelIDs];
    uint64_t v10 = +[FCBundleSubscription subscriptionWithSubscriptionState:2 bundleChannelIDs:v9];
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:v10 + 452];
    id v12 = [NSNumber numberWithUnsignedInteger:-452 - v10];
    objc_setAssociatedObject((id)v10, (const void *)(v10 + 1), v11, (void *)1);
    objc_setAssociatedObject((id)v10, (const void *)(-453 - v10), v12, (void *)1);

    -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:]((uint64_t)a1, (void *)v10);
    id v13 = [a1 cachedSubscription];
    -[FCBundleSubscriptionManager notifyObserversForExpiredStateWithSubscription:]((uint64_t)a1, v13);
  }
}

- (void)notifyObserversForExpiredStateWithSubscription:(uint64_t)a1
{
  id v3 = a2;
  long long v4 = v3;
  if (a1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __78__FCBundleSubscriptionManager_notifyObserversForExpiredStateWithSubscription___block_invoke;
    v5[3] = &unk_1E5B4BE70;
    v5[4] = a1;
    id v6 = v3;
    FCPerformBlockOnMainThread(v5);
  }
}

- (void)clearBundleSubscription
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    long long v4 = v3;
    id v5 = [(FCBundleSubscriptionManager *)self cachedSubscription];
    id v6 = [v5 debugDescription];
    int v25 = 138412290;
    char v26 = v6;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "clearBundleSubscription cachedSubscription=%@", (uint8_t *)&v25, 0xCu);
  }
  uint64_t v7 = [(FCBundleSubscriptionManager *)self cachedSubscription];
  id v8 = objc_getAssociatedObject((id)v7, (const void *)(v7 + 1));
  uint64_t v9 = [v8 unsignedIntegerValue];
  char v10 = v9;
  uint64_t v11 = objc_getAssociatedObject((id)v7, (const void *)~v9);
  char v12 = [v11 unsignedIntegerValue] ^ v10;

  if (v12)
  {
    if (self) {
      bundleSubscriptionLookupEntryManager = self->_bundleSubscriptionLookupEntryManager;
    }
    else {
      bundleSubscriptionLookupEntryManager = 0;
    }
    unsigned int v14 = [(FCBundleSubscriptionLookUpEntryManager *)bundleSubscriptionLookupEntryManager bundleSubscriptionLookUpEntry];
    id v15 = (void *)[v14 mutableCopy];

    if (v15)
    {
      id v16 = [MEMORY[0x1E4F1C9C8] date];
      [v15 setDateOfExpiration:v16];

      [v15 setPurchaseValidationState:1];
      [v15 setHasShownRenewalNotice:1];
      if (self) {
        uint64_t v17 = self->_bundleSubscriptionLookupEntryManager;
      }
      else {
        uint64_t v17 = 0;
      }
      [(FCBundleSubscriptionLookUpEntryManager *)v17 updateEntry:v15];
    }
    if (self) {
      bundleChannelProvider = self->_bundleChannelProvider;
    }
    else {
      bundleChannelProvider = 0;
    }
    int v19 = bundleChannelProvider;
    id v20 = [(FCBundleChannelProviderType *)v19 bundleChannelIDs];
    uint64_t v21 = +[FCBundleSubscription subscriptionWithSubscriptionState:2 bundleChannelIDs:v20];
    int v22 = [NSNumber numberWithUnsignedInteger:v21 + 474];
    id v23 = [NSNumber numberWithUnsignedInteger:-474 - v21];
    objc_setAssociatedObject((id)v21, (const void *)(v21 + 1), v22, (void *)1);
    objc_setAssociatedObject((id)v21, (const void *)(-475 - v21), v23, (void *)1);

    -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:]((uint64_t)self, (void *)v21);
    uint64_t v24 = [(FCBundleSubscriptionManager *)self cachedSubscription];
    -[FCBundleSubscriptionManager notifyObserversForExpiredStateWithSubscription:]((uint64_t)self, v24);
  }
}

- (id)bundleSubscriptionLookupEntry
{
  if (self) {
    self = (FCBundleSubscriptionManager *)self->_bundleSubscriptionLookupEntryManager;
  }
  return (id)[(FCBundleSubscriptionManager *)self bundleSubscriptionLookUpEntry];
}

- (void)renewalNoticeShownWithPurchaseID:(id)a3
{
  id v3 = self;
  if (self) {
    self = (FCBundleSubscriptionManager *)self->_bundleSubscriptionLookupEntryManager;
  }
  long long v4 = [(FCBundleSubscriptionManager *)self bundleSubscriptionLookUpEntry];
  id v7 = (id)[v4 mutableCopy];

  id v5 = v7;
  if (v7)
  {
    [v7 setHasShownRenewalNotice:1];
    if (v3) {
      bundleSubscriptionLookupEntryManager = v3->_bundleSubscriptionLookupEntryManager;
    }
    else {
      bundleSubscriptionLookupEntryManager = 0;
    }
    [(FCBundleSubscriptionLookUpEntryManager *)bundleSubscriptionLookupEntryManager updateEntry:v7];
    id v5 = v7;
  }
}

- (void)forceExpireBundleSubscriptionBasedOnInternalSettings
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (NFInternalBuild())
  {
    id v3 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      long long v4 = v3;
      id v5 = [(FCBundleSubscriptionManager *)self cachedSubscription];
      id v6 = [v5 debugDescription];
      int v21 = 138412290;
      int v22 = v6;
      _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "forceExpireBundleSubscriptionBasedOnInternalSettings  cachedSubscription=%@", (uint8_t *)&v21, 0xCu);
    }
    id v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v8 = [v7 BOOLForKey:@"newssubscription.bundle_subscriptions.force_expire_bundle_subscriptions"];

    if (v8)
    {
      if (self) {
        bundleSubscriptionLookupEntryManager = self->_bundleSubscriptionLookupEntryManager;
      }
      else {
        bundleSubscriptionLookupEntryManager = 0;
      }
      char v10 = [(FCBundleSubscriptionLookUpEntryManager *)bundleSubscriptionLookupEntryManager bundleSubscriptionLookUpEntry];
      uint64_t v11 = (void *)[v10 mutableCopy];

      if (v11)
      {
        char v12 = [MEMORY[0x1E4F1C9C8] date];
        [v11 setDateOfExpiration:v12];

        [v11 setPurchaseValidationState:1];
        if (self) {
          id v13 = self->_bundleSubscriptionLookupEntryManager;
        }
        else {
          id v13 = 0;
        }
        [(FCBundleSubscriptionLookUpEntryManager *)v13 updateEntry:v11];
      }
      if (self) {
        bundleChannelProvider = self->_bundleChannelProvider;
      }
      else {
        bundleChannelProvider = 0;
      }
      id v15 = bundleChannelProvider;
      id v16 = [(FCBundleChannelProviderType *)v15 bundleChannelIDs];
      uint64_t v17 = +[FCBundleSubscription subscriptionWithSubscriptionState:2 bundleChannelIDs:v16];
      char v18 = [NSNumber numberWithUnsignedInteger:v17 + 569];
      int v19 = [NSNumber numberWithUnsignedInteger:-569 - v17];
      objc_setAssociatedObject((id)v17, (const void *)(v17 + 1), v18, (void *)1);
      objc_setAssociatedObject((id)v17, (const void *)(-570 - v17), v19, (void *)1);

      -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:]((uint64_t)self, (void *)v17);
      id v20 = [(FCBundleSubscriptionManager *)self cachedSubscription];
      -[FCBundleSubscriptionManager notifyObserversForExpiredStateWithSubscription:]((uint64_t)self, v20);
    }
  }
}

- (void)silentExpireBundleSubscription
{
  id v2 = self;
  if (self) {
    self = (FCBundleSubscriptionManager *)self->_bundleSubscriptionLookupEntryManager;
  }
  id v3 = [(FCBundleSubscriptionManager *)self bundleSubscriptionLookUpEntry];
  id v13 = (id)[v3 mutableCopy];

  if (v13)
  {
    long long v4 = [MEMORY[0x1E4F1C9C8] date];
    [v13 setDateOfExpiration:v4];

    [v13 setPurchaseValidationState:1];
    [v13 setHasShownRenewalNotice:1];
    if (v2) {
      bundleSubscriptionLookupEntryManager = v2->_bundleSubscriptionLookupEntryManager;
    }
    else {
      bundleSubscriptionLookupEntryManager = 0;
    }
    [(FCBundleSubscriptionLookUpEntryManager *)bundleSubscriptionLookupEntryManager updateEntry:v13];
  }
  if (v2) {
    bundleChannelProvider = v2->_bundleChannelProvider;
  }
  else {
    bundleChannelProvider = 0;
  }
  id v7 = bundleChannelProvider;
  int v8 = [(FCBundleChannelProviderType *)v7 bundleChannelIDs];
  uint64_t v9 = +[FCBundleSubscription subscriptionWithSubscriptionState:2 bundleChannelIDs:v8];
  char v10 = [NSNumber numberWithUnsignedInteger:v9 + 586];
  uint64_t v11 = [NSNumber numberWithUnsignedInteger:-586 - v9];
  objc_setAssociatedObject((id)v9, (const void *)(v9 + 1), v10, (void *)1);
  objc_setAssociatedObject((id)v9, (const void *)(-587 - v9), v11, (void *)1);

  -[FCBundleSubscriptionManager updateCachedSubscriptionWithSubscription:]((uint64_t)v2, (void *)v9);
  char v12 = [(FCBundleSubscriptionManager *)v2 cachedSubscription];
  -[FCBundleSubscriptionManager notifyObserversForExpiredStateWithSubscription:]((uint64_t)v2, v12);
}

- (void)removeObserver:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    if (self) {
      observers = self->_observers;
    }
    else {
      observers = 0;
    }
    [(NSHashTable *)observers removeObject:v4];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer != nil");
    *(_DWORD *)long long buf = 136315906;
    int v8 = "-[FCBundleSubscriptionManager removeObserver:]";
    __int16 v9 = 2080;
    char v10 = "FCBundleSubscriptionManager.m";
    __int16 v11 = 1024;
    int v12 = 615;
    __int16 v13 = 2114;
    unsigned int v14 = v6;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
}

void __103__FCBundleSubscriptionManager_notifyObserversForSubscribedStateWithSubscription_hideBundleDetectionUI___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 48);
  }
  else {
    id v3 = 0;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)[v3 copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        __int16 v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "bundleSubscriptionDidSubscribe:", *(void *)(a1 + 40), (void)v10);
        }
        if (objc_opt_respondsToSelector()) {
          [v9 bundleSubscriptionDidSubscribe:*(void *)(a1 + 40) hideBundleDetectionUI:*(unsigned __int8 *)(a1 + 48)];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

void __78__FCBundleSubscriptionManager_notifyObserversForExpiredStateWithSubscription___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 48);
  }
  else {
    id v3 = 0;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)[v3 copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        __int16 v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "bundleSubscriptionDidExpire:", *(void *)(a1 + 40), (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

void __107__FCBundleSubscriptionManager_notifyObserversForChangeStateWithNewSubscription_previousBundleSubscription___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  if (v2) {
    id v3 = *(void **)(v2 + 48);
  }
  else {
    id v3 = 0;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)[v3 copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        __int16 v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "bundleSubscriptionDidChange:previousBundleSubscription:", a1[5], a1[6], (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)networkReachabilityDidChange:(id)a3
{
  if ([a3 isNetworkReachable])
  {
    id v4 = self ? self->_bundleChannelProvider : 0;
    uint64_t v5 = [(FCBundleChannelProviderType *)v4 bundleChannelIDs];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      uint64_t v7 = FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v9 = 0;
        _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "bundleChannelIDs list found empty.Initiating download for bundle channelIds list", v9, 2u);
      }
      if (self) {
        bundleChannelProvider = self->_bundleChannelProvider;
      }
      else {
        bundleChannelProvider = 0;
      }
      [(FCBundleChannelProviderType *)bundleChannelProvider loadInitialBundleChannelIDsWithCompletion:&__block_literal_global_111];
    }
  }
}

void __60__FCBundleSubscriptionManager_networkReachabilityDidChange___block_invoke()
{
  v0 = FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1A460D000, v0, OS_LOG_TYPE_DEFAULT, "Successfully downloaded bundleChannelIDs list", v1, 2u);
  }
}

- (void)setCachedSubscription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSubscription, 0);
  objc_storeStrong((id *)&self->_refreshQueue, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_bundleChannelProvider, 0);
  objc_storeStrong((id *)&self->_accessLock, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_bundleSubscriptionLookupEntryManager, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_bundleEntitlementsProvider, 0);
}

@end