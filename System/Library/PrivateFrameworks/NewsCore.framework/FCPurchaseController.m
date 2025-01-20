@interface FCPurchaseController
- (BOOL)atleastOneValidAppStorePurchase;
- (BOOL)hasPurchaseTypeAppStore;
- (BOOL)hasRenewalNoticeShownForTagID:(id)a3;
- (BOOL)isPaidSubscriber;
- (BOOL)isPaidSubscriberFromAppStore;
- (BOOL)isPaidSubscriberFromNews;
- (BOOL)isPaidSubscriberFromWeb;
- (BOOL)isTagIDPurchased:(id)a3;
- (BOOL)isTagPurchased:(id)a3;
- (FCEntitlementsOverrideProviderType)entitlementsOverrideProvider;
- (FCPurchaseController)init;
- (FCPurchaseController)initWithCloudContext:(id)a3 entitlementService:(id)a4;
- (NSDictionary)purchaseLookUpEntriesByTagID;
- (NSMutableDictionary)webAccessEntriesByTagID;
- (NSSet)allPurchaseIDs;
- (NSSet)allTagIDs;
- (NSSet)purchasesDiscoveredTagIDs;
- (NSString)lastSignedInItunesAccountName;
- (id)_allPurchasedTagIDs;
- (id)expiredPurchaseChannelIDs;
- (id)lastSignedInItunesAccountDSID;
- (id)purchaseLookUpEntryForTagID:(id)a3;
- (id)subscriptionNotSupportedChannelIDs;
- (id)webAccessEntryForTagID:(void *)a1;
- (id)webAccessOptedInTagIDs;
- (uint64_t)_removeFromPurchasedChannelsListWithTagIDs:(uint64_t)result;
- (void)_enumerateValidPurchasesUsingBlock:(void *)a1;
- (void)activityObservingApplicationDidEnterBackground;
- (void)addAppStorePurchaseWithTagID:(id)a3 purchaseID:(id)a4;
- (void)addToPurchasedChannelsListWithTagID:(uint64_t)a1 purchaseID:(void *)a2 purchaseType:(void *)a3 purchaseValidationState:(uint64_t)a4 isNewsAppPurchase:(char)a5 lastVerificationTime:(void *)a6;
- (void)addToWebAccessOptedInListWithTagID:(id)a3;
- (void)clearAllAppStorePurchases;
- (void)dealloc;
- (void)forceExpireAllSubscriptionsIfNeeded;
- (void)handleAccessTokenChangeWithTagID:(uint64_t)a1 userInitiated:(void *)a2;
- (void)notifyPurchaseAddedWithTagIDs:(uint64_t)a1;
- (void)notifyPurchaseListChanged;
- (void)notifyPurchaseRemovedWithTagIDs:(uint64_t)a1;
- (void)notifyPurchasesDiscoveredWithTagIDs:(uint64_t)a1;
- (void)performEntitlementCheckWithIgnoreCache:(BOOL)a3 callbackQueue:(id)a4 completion:(id)a5;
- (void)removeFromPurchasedChannelsListWithTagIDs:(id)a3;
- (void)removeFromPurchasesDiscoveredList:(id)a3 completion:(id)a4;
- (void)removeWebPurchaseForTagID:(id)a3 userInitiated:(BOOL)a4;
- (void)renewalNoticeShownForPurchasedChannelsListWithTagIDs:(id)a3;
- (void)setEntitlementsOverrideProvider:(id)a3;
- (void)setPurchasesDiscoveredTagIDs:(uint64_t)a1;
- (void)shouldShowSignedInWithDifferentiTunesAccountAlertWithiTunesAccountName:(id)a3 iTunesAccountDSID:(id)a4 isUserSignedIntoiTunes:(BOOL)a5 isBundleSubscriber:(BOOL)a6 completion:(id)a7;
- (void)shouldShowiTunesSignedOutAlertWithiTunesAccountName:(id)a3 iTunesAccountDSID:(id)a4 isUserSignedIntoiTunes:(BOOL)a5 isBundleSubscriber:(BOOL)a6 completion:(id)a7;
- (void)silentExpireInAppSubscriptions;
- (void)submitWebAccessWithTagID:(id)a3 purchaseID:(id)a4 emailAddress:(id)a5 purchaseReceipt:(id)a6 serialCompletion:(id)a7 completion:(id)a8;
- (void)updatePurchaseEntryToExpired:(id)a3;
- (void)updatePurchaseEntryToExpiredForTagIDs:(id)a3;
- (void)userInfo:(id)a3 didChangeAccessTokenForTagID:(id)a4;
- (void)userInfo:(id)a3 didRemoveAccessTokenForTagID:(id)a4 userInitiated:(BOOL)a5;
- (void)verifyAccessTokenWithTagID:(id)a3 accessToken:(id)a4 consumedArticleCount:(unint64_t)a5 serialCompletion:(id)a6 callbackQueue:(id)a7 completion:(id)a8;
@end

@implementation FCPurchaseController

- (BOOL)isPaidSubscriber
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if (self) {
    purchaseLookupEntriesManager = self->_purchaseLookupEntriesManager;
  }
  else {
    purchaseLookupEntriesManager = 0;
  }
  v3 = purchaseLookupEntriesManager;
  v4 = -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v3);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__FCPurchaseController_isPaidSubscriber__block_invoke;
  v6[3] = &unk_1E5B4E010;
  v6[4] = &v7;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];

  LOBYTE(v3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

- (BOOL)isPaidSubscriberFromWeb
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if (self) {
    purchaseLookupEntriesManager = self->_purchaseLookupEntriesManager;
  }
  else {
    purchaseLookupEntriesManager = 0;
  }
  v3 = purchaseLookupEntriesManager;
  v4 = -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v3);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__FCPurchaseController_isPaidSubscriberFromWeb__block_invoke;
  v6[3] = &unk_1E5B4E010;
  v6[4] = &v7;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];

  LOBYTE(v3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

- (BOOL)isPaidSubscriberFromAppStore
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if (self) {
    purchaseLookupEntriesManager = self->_purchaseLookupEntriesManager;
  }
  else {
    purchaseLookupEntriesManager = 0;
  }
  v3 = purchaseLookupEntriesManager;
  v4 = -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v3);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__FCPurchaseController_isPaidSubscriberFromAppStore__block_invoke;
  v6[3] = &unk_1E5B4E010;
  v6[4] = &v7;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];

  LOBYTE(v3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

- (BOOL)isPaidSubscriberFromNews
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if (self) {
    purchaseLookupEntriesManager = self->_purchaseLookupEntriesManager;
  }
  else {
    purchaseLookupEntriesManager = 0;
  }
  v3 = purchaseLookupEntriesManager;
  v4 = -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v3);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__FCPurchaseController_isPaidSubscriberFromNews__block_invoke;
  v6[3] = &unk_1E5B4E010;
  v6[4] = &v7;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];

  LOBYTE(v3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

- (id)_allPurchasedTagIDs
{
  id v1 = a1;
  if (a1)
  {
    v2 = [MEMORY[0x1E4F1CA80] set];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43__FCPurchaseController__allPurchasedTagIDs__block_invoke;
    v5[3] = &unk_1E5B4E038;
    id v6 = v2;
    id v3 = v2;
    -[FCPurchaseController _enumerateValidPurchasesUsingBlock:](v1, v5);
    id v1 = (id)[v3 copy];
  }
  return v1;
}

- (void)_enumerateValidPurchasesUsingBlock:(void *)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v5 = v3;
  if (a1)
  {
    if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "block != nil");
      *(_DWORD *)buf = 136315906;
      v11 = "-[FCPurchaseController _enumerateValidPurchasesUsingBlock:]";
      __int16 v12 = 2080;
      v13 = "FCPurchaseController.m";
      __int16 v14 = 1024;
      int v15 = 1150;
      __int16 v16 = 2114;
      v17 = v7;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    id Property = objc_getProperty(a1, v4, 64, 1);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__FCPurchaseController__enumerateValidPurchasesUsingBlock___block_invoke;
    v8[3] = &unk_1E5B4E418;
    id v9 = v5;
    [Property enumerateKeysAndObjectsUsingBlock:v8];
  }
}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke(id *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  v8 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    *(_DWORD *)buf = 138412802;
    uint64_t v42 = objc_opt_class();
    __int16 v43 = 2114;
    id v44 = v6;
    __int16 v45 = 2114;
    id v46 = v7;
    _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "%@ Entitlements response received with entitlements:%{public}@ error:%{public}@", buf, 0x20u);
  }
  char v10 = NewsCoreUserDefaults();
  if ([v10 BOOLForKey:@"running_ui_automation"])
  {
    int v11 = NFInternalBuild();

    if (v11)
    {
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_193;
      v37[3] = &unk_1E5B4E150;
      id v38 = a1[5];
      id v39 = a1[7];
      id v40 = a1[8];
      __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_193((uint64_t)v37);

      __int16 v12 = v38;
      goto LABEL_19;
    }
  }
  else
  {
  }
  __int16 v12 = objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", &__block_literal_global_196);
  v13 = [a1[4] entitlementsOverrideProvider];

  if (v13)
  {
    __int16 v14 = [a1[4] entitlementsOverrideProvider];
    int v15 = [v14 entitlementsOverrideWithDefaultEntitlements:v12];

    if (v15)
    {
      __int16 v16 = (void *)FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v16;
        uint64_t v18 = [v15 entitlements];
        *(_DWORD *)buf = 138543618;
        uint64_t v42 = (uint64_t)v18;
        __int16 v43 = 2114;
        id v44 = v7;
        _os_log_impl(&dword_1A460D000, v17, OS_LOG_TYPE_DEFAULT, "Overriding entitlements response with entitlements:%{public}@ error:%{public}@", buf, 0x16u);
      }
      uint64_t v19 = [v15 entitlements];

      uint64_t v20 = [v15 error];

      __int16 v12 = (void *)v19;
      id v7 = (id)v20;
    }
  }
  if (v12 && (!v7 || [v12 count]))
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 9);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_2_199;
    v27[3] = &unk_1E5B4E350;
    v22 = &v28;
    id v28 = a1[6];
    v23 = &v29;
    id v29 = v12;
    id v24 = a1[5];
    id v25 = a1[4];
    id v30 = v24;
    id v31 = v25;
    id v32 = a1[7];
    id v33 = a1[8];
    FCPerformIfNonNil(WeakRetained, v27);
  }
  else
  {
    v26 = a1[5];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_198;
    block[3] = &unk_1E5B4E128;
    v22 = &v35;
    id v35 = a1[7];
    v23 = &v36;
    id v36 = a1[8];
    dispatch_async(v26, block);
  }

LABEL_19:
}

- (FCEntitlementsOverrideProviderType)entitlementsOverrideProvider
{
  return self->_entitlementsOverrideProvider;
}

void __88__FCPurchaseController_performEntitlementCheckWithIgnoreCache_callbackQueue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  int v3 = *(unsigned __int8 *)(a1 + 64);
  v5 = *(id **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  id v6 = a2;
  id v15 = [v4 paidBundleConfig];
  id v7 = [v15 restorableBundlePurchaseIDs];
  v8 = *(void **)(a1 + 48);
  id v9 = *(void **)(a1 + 56);
  id v10 = v7;
  id v11 = v8;
  id v12 = v9;
  id v13 = v6;
  if (v5)
  {
    objc_initWeak(&location, v5);
    id v14 = v5[12];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke;
    v16[3] = &unk_1E5B4E378;
    v16[4] = v5;
    id v17 = v11;
    id v19 = v12;
    id v20 = v13;
    objc_copyWeak(&v21, &location);
    id v18 = v10;
    [v14 performEntitlementWithIgnoreCache:v3 != 0 completion:v16];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

- (FCPurchaseController)initWithCloudContext:(id)a3 entitlementService:(id)a4
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = v7;
    id v10 = v8;
    if (!self)
    {
LABEL_51:
      id v13 = 0;
      goto LABEL_50;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v74 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "cloudContext != nil");
      *(_DWORD *)v92 = 136315906;
      v93 = "-[FCPurchaseController initWithCloudContext:entitlementService:]";
      __int16 v94 = 2080;
      v95 = "FCPurchaseController.m";
      __int16 v96 = 1024;
      int v97 = 168;
      __int16 v98 = 2114;
      v99 = v74;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v92, 0x26u);
    }
    id v11 = v8;
    if (!self) {
      goto LABEL_51;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v75 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "cloudContext != nil");
      *(_DWORD *)v92 = 136315906;
      v93 = "-[FCPurchaseController initWithCloudContext:entitlementService:keyValueStoreOption:]";
      __int16 v94 = 2080;
      v95 = "FCPurchaseController.m";
      __int16 v96 = 1024;
      int v97 = 178;
      __int16 v98 = 2114;
      v99 = v75;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v92, 0x26u);
    }
  }
  v85.receiver = self;
  v85.super_class = (Class)FCPurchaseController;
  id v12 = [(FCPurchaseController *)&v85 init];
  id v13 = v12;
  if (!v12) {
    goto LABEL_50;
  }
  id v78 = v8;
  objc_storeStrong((id *)&v12->_cloudContext, a3);
  objc_storeStrong((id *)&v13->_entitlementService, a4);
  id v14 = [v7 userInfo];
  [v14 addObserver:v13];

  v90[0] = @"newssubscription.subscriptions.metered_count_duration";
  v90[1] = @"newssubscription.a_la_carte_subscriptions.metered_count_maximum_limit";
  v91[0] = &unk_1EF8D76E0;
  v91[1] = &unk_1EF8D76E0;
  v90[2] = @"newssubscription.bundle_subscriptions.metered_count_maximum_limit";
  v91[2] = &unk_1EF8D76E0;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:3];
  __int16 v16 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v77 = (void *)v15;
  [v16 registerDefaults:v15];

  v76 = [v7 privateDataDirectory];
  id v17 = [[FCKeyValueStore alloc] initWithName:@"PurchasedChannelList" directory:v76 version:1 options:0 classRegistry:0];
  localStore = v13->_localStore;
  v13->_localStore = v17;

  id v19 = -[FCPurchaseLookUpEntriesManager initWithLocalStore:]([FCPurchaseLookUpEntriesManager alloc], v13->_localStore);
  purchaseLookupEntriesManager = v13->_purchaseLookupEntriesManager;
  v13->_purchaseLookupEntriesManager = (FCPurchaseLookUpEntriesManager *)v19;

  id v79 = v7;
  id v21 = [v7 appActivityMonitor];
  [v21 addObserver:v13];

  v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v23 = dispatch_queue_attr_make_with_qos_class(v22, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v24 = dispatch_queue_create("FCPurchaseLookUpData.purchasedChannelsAccessQueue", v23);
  accessQueue = v13->_accessQueue;
  v13->_accessQueue = (OS_dispatch_queue *)v24;

  uint64_t v26 = objc_opt_new();
  entitlementQueue = v13->_entitlementQueue;
  v13->_entitlementQueue = (FCAsyncSerialQueue *)v26;

  uint64_t v28 = [objc_alloc(MEMORY[0x1E4F81BD0]) initWithConstructor:&__block_literal_global_15];
  session = v13->_session;
  v13->_session = (NFLazy *)v28;

  objc_setProperty_atomic_copy(v13, v30, MEMORY[0x1E4F1CC08], 64);
  uint64_t v31 = [MEMORY[0x1E4F1CA60] dictionary];
  webAccessEntriesByTagID = v13->_webAccessEntriesByTagID;
  v13->_webAccessEntriesByTagID = (NSMutableDictionary *)v31;

  uint64_t v33 = [MEMORY[0x1E4F1CA80] set];
  purchasesDiscoveredTagIDs = v13->_purchasesDiscoveredTagIDs;
  v13->_purchasesDiscoveredTagIDs = (NSSet *)v33;

  id v35 = v13->_localStore;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id obj = [(FCKeyValueStore *)v35 allKeys];
  uint64_t v36 = [obj countByEnumeratingWithState:&v86 objects:v92 count:16];
  if (!v36) {
    goto LABEL_43;
  }
  uint64_t v37 = v36;
  uint64_t v38 = *(void *)v87;
  v81 = v35;
  v82 = v13;
  uint64_t v80 = *(void *)v87;
  do
  {
    uint64_t v39 = 0;
    uint64_t v83 = v37;
    do
    {
      if (*(void *)v87 != v38) {
        objc_enumerationMutation(obj);
      }
      id v40 = *(void **)(*((void *)&v86 + 1) + 8 * v39);
      objc_opt_class();
      v41 = [(FCKeyValueStore *)v35 objectForKey:v40];
      if (v41)
      {
        if (objc_opt_isKindOfClass()) {
          uint64_t v42 = v41;
        }
        else {
          uint64_t v42 = 0;
        }
      }
      else
      {
        uint64_t v42 = 0;
      }
      id v43 = v42;

      if (v43)
      {
        if (![v40 hasPrefix:@"wa-"]) {
          goto LABEL_39;
        }
        id v44 = [FCWebAccessEntry alloc];
        id v45 = v40;
        id v46 = v43;
        uint64_t v47 = v46;
        if (v44)
        {
          if (!v45 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v58 = (void *)[[NSString alloc] initWithFormat:@"web access entry must have an identifier"];
            *(_DWORD *)buf = 136315906;
            v101 = "-[FCWebAccessEntry initWithEntryID:dictionaryRepresentation:]";
            __int16 v102 = 2080;
            v103 = "FCPurchaseController.m";
            __int16 v104 = 1024;
            int v105 = 1829;
            __int16 v106 = 2114;
            v107 = v58;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          }
          v48 = [v47 objectForKeyedSubscript:@"WebAccessEntryLastRetryAttemptTime"];
          v49 = [v47 objectForKeyedSubscript:@"WebAccessEntryEmail"];
          v50 = [v47 objectForKeyedSubscript:@"WebAccessEntryPurchaseReceipt"];
          v51 = [v47 objectForKeyedSubscript:@"WebAccessEntryTagID"];
          v52 = [v47 objectForKeyedSubscript:@"WebAccessEntryPurchaseID"];
          id v44 = -[FCWebAccessEntry initWithEntryID:tagID:purchaseID:lastRetryAttemptTime:email:purchaseReceipt:](v44, v45, v51, v52, v48, v49, v50);

          if (!v44)
          {
            id v35 = v81;
            id v13 = v82;
            uint64_t v37 = v83;
            uint64_t v38 = v80;
            goto LABEL_38;
          }
          id v13 = v82;
          id v45 = [(FCPurchaseController *)v82 webAccessEntriesByTagID];
          [v45 setObject:v44 forKey:v44->_tagID];
          uint64_t v38 = v80;
          id v35 = v81;
          uint64_t v37 = v83;
        }
        else
        {
        }
      }
      else
      {
        objc_opt_class();
        v53 = [(FCKeyValueStore *)v35 objectForKey:v40];
        if (v53)
        {
          if (objc_opt_isKindOfClass()) {
            v54 = v53;
          }
          else {
            v54 = 0;
          }
        }
        else
        {
          v54 = 0;
        }
        id v44 = v54;

        if (!v44 || ![v40 isEqualToString:@"SubscriptionsDiscoveredList"]) {
          goto LABEL_38;
        }
        v55 = (void *)MEMORY[0x1E4F1CAD0];
        id v45 = (id)[(FCWebAccessEntry *)v44 copy];
        uint64_t v56 = [v55 setWithArray:v45];
        v57 = v13->_purchasesDiscoveredTagIDs;
        v13->_purchasesDiscoveredTagIDs = (NSSet *)v56;
      }
LABEL_38:

LABEL_39:
      ++v39;
    }
    while (v37 != v39);
    uint64_t v59 = [obj countByEnumeratingWithState:&v86 objects:v92 count:16];
    uint64_t v37 = v59;
  }
  while (v59);
LABEL_43:

  v60 = -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID]((id *)&v13->_purchaseLookupEntriesManager->super.isa);
  v61 = (void *)[v60 copy];
  objc_setProperty_atomic_copy(v13, v62, v61, 64);

  id v8 = v78;
  if (NFInternalBuild())
  {
    v63 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v64 = [v63 BOOLForKey:@"simulate_subscription_detection_enabled"];

    if (v64)
    {
      uint32_t v65 = arc4random_uniform(5u);
      v66 = [MEMORY[0x1E4F1CA48] array];
      if (v65 <= 0x7FFFFFFE)
      {
        uint64_t v67 = 0;
        do
        {
          v68 = [&unk_1EF8D88E0 objectAtIndexedSubscript:v67];
          [v66 addObject:v68];

          ++v67;
        }
        while (v65 + 1 != v67);
      }
      v69 = (void *)MEMORY[0x1E4F1CAD0];
      v70 = (void *)[v66 copy];
      uint64_t v71 = [v69 setWithArray:v70];
      v72 = v13->_purchasesDiscoveredTagIDs;
      v13->_purchasesDiscoveredTagIDs = (NSSet *)v71;
    }
  }

  id v7 = v79;
LABEL_50:

  return v13;
}

void __88__FCPurchaseController_performEntitlementCheckWithIgnoreCache_callbackQueue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    v5 = *(void **)(v4 + 88);
  }
  else {
    v5 = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__FCPurchaseController_performEntitlementCheckWithIgnoreCache_callbackQueue_completion___block_invoke_3;
  v7[3] = &unk_1E5B4E0B0;
  v7[4] = a2;
  char v11 = *(unsigned char *)(a1 + 64);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v6 = a2;
  [v5 enqueueBlock:v7];
}

- (void)setEntitlementsOverrideProvider:(id)a3
{
}

- (id)webAccessOptedInTagIDs
{
  if (self) {
    self = (FCPurchaseController *)self->_cloudContext;
  }
  v2 = [(FCPurchaseController *)self tagSettings];
  int v3 = [v2 webAccessOptedInTagIDs];

  return v3;
}

uint64_t __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_198(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, 0, 0);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __88__FCPurchaseController_performEntitlementCheckWithIgnoreCache_callbackQueue_completion___block_invoke_189(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__FCPurchaseController_performEntitlementCheckWithIgnoreCache_callbackQueue_completion___block_invoke_2;
  v7[3] = &unk_1E5B4E0D8;
  char v11 = *(unsigned char *)(a1 + 64);
  v5 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v10 = *(id *)(a1 + 48);
  id v6 = v3;
  FCPerformIfNonNil(WeakRetained, v7);
}

- (void)performEntitlementCheckWithIgnoreCache:(BOOL)a3 callbackQueue:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F28B50] mainBundle];
  char v11 = [v10 bundleIdentifier];

  if (([v11 isEqualToString:@"com.apple.stocks"] & 1) != 0
    || ([v11 isEqualToString:@"com.apple.news"] & 1) != 0
    || NSClassFromString(&cfstr_Xctest.isa))
  {
    objc_initWeak(&location, self);
    if (self) {
      cloudContext = self->_cloudContext;
    }
    else {
      cloudContext = 0;
    }
    id v13 = cloudContext;
    id v14 = [(FCCloudContext *)v13 configurationManager];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __88__FCPurchaseController_performEntitlementCheckWithIgnoreCache_callbackQueue_completion___block_invoke_189;
    v15[3] = &unk_1E5B4E100;
    objc_copyWeak(&v18, &location);
    v15[4] = self;
    BOOL v19 = a3;
    id v16 = v8;
    id v17 = v9;
    [v14 fetchConfigurationIfNeededWithCompletion:v15];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __88__FCPurchaseController_performEntitlementCheckWithIgnoreCache_callbackQueue_completion___block_invoke;
    v21[3] = &unk_1E5B4E088;
    v21[4] = self;
    id v22 = v11;
    id v23 = v9;
    __88__FCPurchaseController_performEntitlementCheckWithIgnoreCache_callbackQueue_completion___block_invoke((uint64_t)v21);
  }
}

- (FCPurchaseController)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCPurchaseController init]";
    __int16 v9 = 2080;
    id v10 = "FCPurchaseController.m";
    __int16 v11 = 1024;
    int v12 = 162;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPurchaseController init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

id __84__FCPurchaseController_initWithCloudContext_entitlementService_keyValueStoreOption___block_invoke()
{
  v0 = [MEMORY[0x1E4F18DD0] ephemeralSessionConfiguration];
  [v0 setNetworkServiceType:0];
  id v1 = [MEMORY[0x1E4F28F80] processInfo];
  objc_msgSend(v0, "setHTTPMaximumConnectionsPerHost:", 2 * objc_msgSend(v1, "processorCount"));

  [v0 setTimeoutIntervalForRequest:15.0];
  uint64_t v2 = [MEMORY[0x1E4F18DC0] sessionWithConfiguration:v0];

  return v2;
}

- (void)dealloc
{
  if (!NSClassFromString(&cfstr_Xctest.isa))
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __31__FCPurchaseController_dealloc__block_invoke_2;
    v4[3] = &unk_1E5B4C018;
    v4[4] = self;
    FCPerformBlockOnMainThread(v4);
  }
  v3.receiver = self;
  v3.super_class = (Class)FCPurchaseController;
  [(FCPurchaseController *)&v3 dealloc];
}

void __31__FCPurchaseController_dealloc__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[4];
  }
  objc_super v3 = v2;
  id v4 = [v3 userInfo];
  [v4 removeObserver:*(void *)(a1 + 32)];
}

- (void)setPurchasesDiscoveredTagIDs:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (void)notifyPurchaseAddedWithTagIDs:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1 && [v3 count])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54__FCPurchaseController_notifyPurchaseAddedWithTagIDs___block_invoke_2;
    v5[3] = &unk_1E5B4BE70;
    id v6 = v4;
    uint64_t v7 = a1;
    FCPerformBlockOnMainThread(v5);
  }
}

void __54__FCPurchaseController_notifyPurchaseAddedWithTagIDs___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v5 = FCPurchaseAddedTagIDsKey;
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:FCPurchaseAddedNotificationName object:0 userInfo:v3];

  -[FCPurchaseController notifyPurchaseListChanged](*(void *)(a1 + 40));
}

- (void)notifyPurchaseListChanged
{
  if (a1)
  {
    v1[0] = MEMORY[0x1E4F143A8];
    v1[1] = 3221225472;
    v1[2] = __49__FCPurchaseController_notifyPurchaseListChanged__block_invoke;
    v1[3] = &unk_1E5B4C018;
    v1[4] = a1;
    FCPerformBlockOnMainThread(v1);
  }
}

- (void)notifyPurchaseRemovedWithTagIDs:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1 && [v3 count])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__FCPurchaseController_notifyPurchaseRemovedWithTagIDs___block_invoke_2;
    v5[3] = &unk_1E5B4BE70;
    id v6 = v4;
    uint64_t v7 = a1;
    FCPerformBlockOnMainThread(v5);
  }
}

void __56__FCPurchaseController_notifyPurchaseRemovedWithTagIDs___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v5 = FCPurchaseRemovedTagIDsKey;
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:FCPurchaseRemovedNotificationName object:0 userInfo:v3];

  -[FCPurchaseController notifyPurchaseListChanged](*(void *)(a1 + 40));
}

void __49__FCPurchaseController_notifyPurchaseListChanged__block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v1 = -[FCPurchaseController _allPurchasedTagIDs](*(id *)(a1 + 32));
  uint64_t v4 = FCPurchasedTagIDsKey;
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:FCPurchaseListChangedNotificationName object:0 userInfo:v2];
}

void __57__FCPurchaseController_notifyWebAccessOptedInListChanged__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:FCWebAccessOptedInListChangedNotificationName object:0];
}

- (void)notifyPurchasesDiscoveredWithTagIDs:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    void v5[2] = __60__FCPurchaseController_notifyPurchasesDiscoveredWithTagIDs___block_invoke;
    v5[3] = &unk_1E5B4C018;
    id v6 = v3;
    FCPerformBlockOnMainThread(v5);
  }
}

void __60__FCPurchaseController_notifyPurchasesDiscoveredWithTagIDs___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v4 = FCPurchasedTagIDsKey;
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:FCPurchasesDiscoveredNotificationName object:0 userInfo:v2];
}

- (void)addToWebAccessOptedInListWithTagID:(id)a3
{
  if (self)
  {
    cloudContext = self->_cloudContext;
    id v4 = a3;
    v5 = [(FCCloudContext *)cloudContext tagSettings];
    [v5 setWebAccessOptInForTagID:v4 webAccessOptIn:1];

    FCPerformBlockOnMainThread(&__block_literal_global_177);
  }
  else
  {
    id v6 = a3;
    id v7 = [0 tagSettings];
    [v7 setWebAccessOptInForTagID:v6 webAccessOptIn:1];
  }
}

- (void)shouldShowSignedInWithDifferentiTunesAccountAlertWithiTunesAccountName:(id)a3 iTunesAccountDSID:(id)a4 isUserSignedIntoiTunes:(BOOL)a5 isBundleSubscriber:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = (void (**)(id, uint64_t, void *, id))a7;
  uint64_t v15 = [(FCPurchaseController *)self lastSignedInItunesAccountName];
  id v22 = v12;
  id v16 = v13;
  id v17 = -[FCPurchaseController lastSignedInItunesAccountDSID]((id *)&self->super.isa);
  id v18 = v17;
  if (v17 && a5)
  {
    BOOL v19 = -[FCPurchaseController lastSignedInItunesAccountDSID]((id *)&self->super.isa);
    char v20 = [v19 isEqualToString:v16];

    if ((v20 & 1) == 0 && (-[FCPurchaseController atleastOneValidAppStorePurchase]((uint64_t)self) || v8))
    {
      if (self)
      {
        [(FCKeyValueStore *)self->_localStore setObject:v16 forKey:@"LastSignedInITunesAccountDSID"];
        localStore = self->_localStore;
      }
      else
      {
        [0 setObject:v16 forKey:@"LastSignedInITunesAccountDSID"];
        localStore = 0;
      }
      [(FCKeyValueStore *)localStore setObject:v22 forKey:@"LastSignedInITunesAccountName"];
      if (v14) {
        v14[2](v14, 1, v15, v22);
      }
      goto LABEL_13;
    }
  }
  else
  {
  }
  if (v14) {
    v14[2](v14, 0, 0, 0);
  }
LABEL_13:
}

- (id)lastSignedInItunesAccountDSID
{
  if (a1)
  {
    a1 = [a1[6] objectForKey:@"LastSignedInITunesAccountDSID"];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)atleastOneValidAppStorePurchase
{
  if (!a1) {
    return 0;
  }
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v1 = (id *)*(id *)(a1 + 56);
  uint64_t v2 = -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v1);
  id v3 = (void *)[v2 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __55__FCPurchaseController_atleastOneValidAppStorePurchase__block_invoke;
  v6[3] = &unk_1E5B4E010;
  v6[4] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  BOOL v4 = *((unsigned char *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)shouldShowiTunesSignedOutAlertWithiTunesAccountName:(id)a3 iTunesAccountDSID:(id)a4 isUserSignedIntoiTunes:(BOOL)a5 isBundleSubscriber:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = (void (**)(id, uint64_t, void *))a7;
  uint64_t v15 = [(FCPurchaseController *)self lastSignedInItunesAccountName];
  id v18 = v12;
  id v16 = v13;
  if (!v15 || a5)
  {
    if (self)
    {
      [(FCKeyValueStore *)self->_localStore setObject:v16 forKey:@"LastSignedInITunesAccountDSID"];
      localStore = self->_localStore;
    }
    else
    {
      [0 setObject:v16 forKey:@"LastSignedInITunesAccountDSID"];
      localStore = 0;
    }
    [(FCKeyValueStore *)localStore setObject:v18 forKey:@"LastSignedInITunesAccountName"];
  }
  else if (-[FCPurchaseController atleastOneValidAppStorePurchase]((uint64_t)self) || v8)
  {
    if (v14) {
      v14[2](v14, 1, v15);
    }
    goto LABEL_12;
  }
  if (v14) {
    v14[2](v14, 0, 0);
  }
LABEL_12:
}

- (void)clearAllAppStorePurchases
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  if (self) {
    purchaseLookupEntriesManager = self->_purchaseLookupEntriesManager;
  }
  else {
    purchaseLookupEntriesManager = 0;
  }
  v5 = purchaseLookupEntriesManager;
  id v6 = -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v5);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __49__FCPurchaseController_clearAllAppStorePurchases__block_invoke;
  id v18 = &unk_1E5B4DFE8;
  id v7 = v3;

  id v19 = v7;
  char v20 = self;
  [v6 enumerateKeysAndObjectsUsingBlock:&v15];

  -[FCPurchaseController notifyPurchaseRemovedWithTagIDs:]((uint64_t)self, v7);
  BOOL v8 = [(FCPurchaseController *)self purchasesDiscoveredTagIDs];
  uint64_t v9 = objc_msgSend(v8, "fc_setByMinusingSet:", v7);
  -[FCPurchaseController setPurchasesDiscoveredTagIDs:]((uint64_t)self, v9);

  if (self) {
    localStore = self->_localStore;
  }
  else {
    localStore = 0;
  }
  __int16 v11 = localStore;
  id v12 = [(FCPurchaseController *)self purchasesDiscoveredTagIDs];
  id v13 = [v12 allObjects];
  [(FCKeyValueStore *)v11 setObject:v13 forKey:@"SubscriptionsDiscoveredList"];

  id v14 = [(FCPurchaseController *)self purchasesDiscoveredTagIDs];
  -[FCPurchaseController notifyPurchasesDiscoveredWithTagIDs:]((uint64_t)self, v14);
}

void __49__FCPurchaseController_clearAllAppStorePurchases__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if ([v5 purchaseType] == 1)
  {
    [*(id *)(a1 + 32) addObject:v14];
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      uint64_t v7 = *(void *)(v6 + 56);
    }
    else {
      uint64_t v7 = 0;
    }
    -[FCPurchaseLookUpEntriesManager removeEntry:](v7, v5);
    BOOL v8 = *(void **)(a1 + 40);
    if (v8) {
      BOOL v8 = (void *)v8[7];
    }
    uint64_t v9 = v8;
    char v10 = -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v9);
    id v12 = (void *)[v10 copy];
    id v13 = *(void **)(a1 + 40);
    if (v13) {
      objc_setProperty_atomic_copy(v13, v11, v12, 64);
    }
  }
}

- (NSString)lastSignedInItunesAccountName
{
  if (self) {
    self = (FCPurchaseController *)self->_localStore;
  }
  return (NSString *)[(FCPurchaseController *)self objectForKey:@"LastSignedInITunesAccountName"];
}

- (void)addAppStorePurchaseWithTagID:(id)a3 purchaseID:(id)a4
{
}

- (void)addToPurchasedChannelsListWithTagID:(uint64_t)a1 purchaseID:(void *)a2 purchaseType:(void *)a3 purchaseValidationState:(uint64_t)a4 isNewsAppPurchase:(char)a5 lastVerificationTime:(void *)a6
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a6;
  if (a1)
  {
    id v14 = *(NSObject **)(a1 + 80);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __147__FCPurchaseController_addToPurchasedChannelsListWithTagID_purchaseID_purchaseType_purchaseValidationState_isNewsAppPurchase_lastVerificationTime___block_invoke;
    block[3] = &unk_1E5B4E440;
    void block[4] = a1;
    id v16 = v11;
    id v17 = v12;
    id v18 = v13;
    uint64_t v19 = a4;
    uint64_t v20 = 1;
    char v21 = a5;
    dispatch_sync(v14, block);
  }
}

void __40__FCPurchaseController_isPaidSubscriber__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  if ([v6 purchaseValidationState] == 1 || objc_msgSend(v6, "purchaseValidationState") == 3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __48__FCPurchaseController_isPaidSubscriberFromNews__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  if ([v6 isNewsAppPurchase]
    && [v6 purchaseValidationState] == 1
    && [v6 purchaseType] == 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __52__FCPurchaseController_isPaidSubscriberFromAppStore__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  if (([v6 isNewsAppPurchase] & 1) == 0
    && [v6 purchaseValidationState] == 1
    && [v6 purchaseType] == 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __47__FCPurchaseController_isPaidSubscriberFromWeb__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  if (([v6 purchaseValidationState] == 1 || objc_msgSend(v6, "purchaseValidationState") == 3)
    && [v6 purchaseType] == 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)hasPurchaseTypeAppStore
{
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if (self) {
    purchaseLookupEntriesManager = self->_purchaseLookupEntriesManager;
  }
  else {
    purchaseLookupEntriesManager = 0;
  }
  id v3 = purchaseLookupEntriesManager;
  BOOL v4 = -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v3);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __47__FCPurchaseController_hasPurchaseTypeAppStore__block_invoke;
  v6[3] = &unk_1E5B4E010;
  v6[4] = &v7;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];

  LOBYTE(v3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __47__FCPurchaseController_hasPurchaseTypeAppStore__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  if ([v6 purchaseValidationState] == 1 && objc_msgSend(v6, "purchaseType") == 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)hasRenewalNoticeShownForTagID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__10;
  id v17 = __Block_byref_object_dispose__10;
  id v18 = 0;
  if (self) {
    accessQueue = self->_accessQueue;
  }
  else {
    accessQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__FCPurchaseController_hasRenewalNoticeShownForTagID___block_invoke;
  block[3] = &unk_1E5B4C230;
  id v12 = &v13;
  void block[4] = self;
  id v6 = v4;
  id v11 = v6;
  dispatch_sync(accessQueue, block);
  uint64_t v7 = (void *)v14[5];
  if (v7) {
    char v8 = [v7 hasShownRenewalNotice];
  }
  else {
    char v8 = 0;
  }

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __54__FCPurchaseController_hasRenewalNoticeShownForTagID___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[7];
  }
  id v3 = v2;
  -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v7 objectForKey:a1[5]];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)forceExpireAllSubscriptionsIfNeeded
{
  if (NFInternalBuild())
  {
    id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v4 = [v3 BOOLForKey:@"force_expire_subscriptions"];

    if (v4)
    {
      if (self) {
        purchaseLookupEntriesManager = self->_purchaseLookupEntriesManager;
      }
      else {
        purchaseLookupEntriesManager = 0;
      }
      id v6 = -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID]((id *)&purchaseLookupEntriesManager->super.isa);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __59__FCPurchaseController_forceExpireAllSubscriptionsIfNeeded__block_invoke_2;
      v12[3] = &unk_1E5B4E038;
      v12[4] = self;
      [v6 enumerateKeysAndObjectsUsingBlock:v12];

      if (self) {
        id v7 = self->_purchaseLookupEntriesManager;
      }
      else {
        id v7 = 0;
      }
      char v8 = v7;
      uint64_t v9 = -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v8);
      id v11 = (void *)[v9 copy];
      if (self) {
        objc_setProperty_atomic_copy(self, v10, v11, 64);
      }
    }
  }
}

void __59__FCPurchaseController_forceExpireAllSubscriptionsIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = (id)[a3 mutableCopy];
  [v7 setPurchaseValidationState:2];
  [v7 setHasShownRenewalNotice:0];
  int v4 = [MEMORY[0x1E4F1C9C8] date];
  [v7 setDateOfExpiration:v4];

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    uint64_t v6 = *(void *)(v5 + 56);
  }
  else {
    uint64_t v6 = 0;
  }
  -[FCPurchaseLookUpEntriesManager updateEntry:](v6, v7);
}

- (void)silentExpireInAppSubscriptions
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__10;
  id v16 = __Block_byref_object_dispose__10;
  id v17 = [MEMORY[0x1E4F1CA80] set];
  if (self) {
    purchaseLookupEntriesManager = self->_purchaseLookupEntriesManager;
  }
  else {
    purchaseLookupEntriesManager = 0;
  }
  int v4 = purchaseLookupEntriesManager;
  uint64_t v5 = -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v4);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__FCPurchaseController_silentExpireInAppSubscriptions__block_invoke;
  v11[3] = &unk_1E5B4E060;
  v11[4] = self;
  v11[5] = &v12;
  [v5 enumerateKeysAndObjectsUsingBlock:v11];

  if (self) {
    uint64_t v6 = self->_purchaseLookupEntriesManager;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;
  char v8 = -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v7);
  char v10 = (void *)[v8 copy];
  if (self) {
    objc_setProperty_atomic_copy(self, v9, v10, 64);
  }

  -[FCPurchaseController notifyPurchaseRemovedWithTagIDs:]((uint64_t)self, (void *)v13[5]);
  _Block_object_dispose(&v12, 8);
}

void __54__FCPurchaseController_silentExpireInAppSubscriptions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ([v5 purchaseType] == 1)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v10];
    uint64_t v6 = (void *)[v5 mutableCopy];
    [v6 setPurchaseValidationState:2];
    [v6 setHasShownRenewalNotice:1];
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    [v6 setDateOfExpiration:v7];

    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      uint64_t v9 = *(void *)(v8 + 56);
    }
    else {
      uint64_t v9 = 0;
    }
    -[FCPurchaseLookUpEntriesManager updateEntry:](v9, v6);
  }
}

- (id)expiredPurchaseChannelIDs
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  if (self) {
    purchaseLookupEntriesManager = self->_purchaseLookupEntriesManager;
  }
  else {
    purchaseLookupEntriesManager = 0;
  }
  id v5 = purchaseLookupEntriesManager;
  uint64_t v6 = -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v5);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__FCPurchaseController_expiredPurchaseChannelIDs__block_invoke;
  v10[3] = &unk_1E5B4E038;

  id v11 = v3;
  id v7 = v3;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];

  uint64_t v8 = (void *)[v7 copy];
  return v8;
}

void __49__FCPurchaseController_expiredPurchaseChannelIDs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if ([v6 purchaseValidationState] == 2 && (objc_msgSend(v6, "hasShownRenewalNotice") & 1) == 0)
  {
    int v4 = *(void **)(a1 + 32);
    id v5 = [v6 tagID];
    [v4 addObject:v5];
  }
}

- (id)subscriptionNotSupportedChannelIDs
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  if (self) {
    purchaseLookupEntriesManager = self->_purchaseLookupEntriesManager;
  }
  else {
    purchaseLookupEntriesManager = 0;
  }
  id v5 = purchaseLookupEntriesManager;
  id v6 = -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v5);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __58__FCPurchaseController_subscriptionNotSupportedChannelIDs__block_invoke;
  uint64_t v13 = &unk_1E5B4DFE8;
  uint64_t v14 = self;

  id v15 = v3;
  id v7 = v3;
  [v6 enumerateKeysAndObjectsUsingBlock:&v10];

  uint64_t v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);
  return v8;
}

void __58__FCPurchaseController_subscriptionNotSupportedChannelIDs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 purchaseValidationState] == 4)
  {
    id v5 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = [v4 tagID];
      int v11 = 138412546;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "%@ found a purchaseLookupEntry with not supported validation state for tagID %{public}@", (uint8_t *)&v11, 0x16u);
    }
    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v10 = [v4 tagID];
    [v9 addObject:v10];
  }
}

uint64_t __88__FCPurchaseController_performEntitlementCheckWithIgnoreCache_callbackQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v2;
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412546;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1A460D000, v3, OS_LOG_TYPE_DEFAULT, "%@ ignoring alacarte entitlement check for bundleID=%{public}@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_193(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_2;
  v3[3] = &unk_1E5B4E128;
  uint64_t v2 = *(NSObject **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  dispatch_async(v2, v3);
}

uint64_t __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, 0, 0);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

FCSubscriptionEntitlement *__120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[FCSubscriptionEntitlement alloc] initWithASDEntitlement:v2];

  return v3;
}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_2_199(uint64_t a1, void *a2)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  id v5 = [v3 allPurchasedTagIDs];
  id v6 = FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "allPurchasedTagIDs:%@", (uint8_t *)&buf, 0xCu);
    id v6 = FCPurchaseLog;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "restorableBundleIAPs:%@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__10;
  int v64 = __Block_byref_object_dispose__10;
  id v65 = [MEMORY[0x1E4F1CA60] dictionary];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_200;
  v51[3] = &unk_1E5B4E198;
  uint64_t v8 = *(void **)(a1 + 40);
  id v52 = *(id *)(a1 + 32);
  p_long long buf = &buf;
  __int16 v9 = objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", v51);
  uint64_t v10 = FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v56) = 138412290;
    *(void *)((char *)&v56 + 4) = v9;
    _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "entitled PurchaseIDs:%@", (uint8_t *)&v56, 0xCu);
  }
  *(void *)&long long v56 = 0;
  *((void *)&v56 + 1) = &v56;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__10;
  uint64_t v59 = __Block_byref_object_dispose__10;
  id v60 = [MEMORY[0x1E4F1CA80] set];
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__10;
  v49[4] = __Block_byref_object_dispose__10;
  id v50 = [MEMORY[0x1E4F1CA80] set];
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__10;
  v47[4] = __Block_byref_object_dispose__10;
  id v48 = [MEMORY[0x1E4F1CA80] set];
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__10;
  v45[4] = __Block_byref_object_dispose__10;
  id v46 = [MEMORY[0x1E4F1CA60] dictionary];
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__10;
  v43[4] = __Block_byref_object_dispose__10;
  id v44 = [MEMORY[0x1E4F1CA48] array];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_202;
  v32[3] = &unk_1E5B4E2D8;
  uint64_t v11 = *(void **)(a1 + 48);
  v32[4] = *(void *)(a1 + 56);
  uint64_t v37 = &v56;
  uint64_t v38 = v45;
  id v12 = v9;
  id v33 = v12;
  uint64_t v39 = v47;
  id v13 = v5;
  id v34 = v13;
  id v35 = v3;
  id v40 = &buf;
  v41 = v43;
  uint64_t v42 = v49;
  uint64_t v14 = v4;
  uint64_t v36 = v14;
  uint64_t v15 = v32;
  if (v3)
  {
    id v16 = v11;
    id v17 = v12;
    id v18 = [[FCPurchaseLookupFetchOperation alloc] initWithPurchaseIDs:v17 contentContext:v3[4]];

    [(FCOperation *)v18 setQualityOfService:25];
    [(FCOperation *)v18 setRelativePriority:1];
    [(FCFetchOperation *)v18 setFetchCompletionQueue:v16];

    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __79__FCPurchaseController_fetchChannelIDsForPurchaseIDs_callbackQueue_completion___block_invoke;
    v54[3] = &unk_1E5B4CAF8;
    v55 = v15;
    [(FCFetchOperation *)v18 setFetchCompletionBlock:v54];
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
    [v19 addOperation:v18];
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_2_217;
  v21[3] = &unk_1E5B4E328;
  uint64_t v28 = &v56;
  id v29 = v49;
  id v22 = v13;
  id v23 = v3;
  SEL v30 = v47;
  id v24 = *(id *)(a1 + 48);
  id v26 = *(id *)(a1 + 64);
  id v25 = *(id *)(a1 + 40);
  uint64_t v31 = v43;
  id v27 = *(id *)(a1 + 72);
  id v20 = v13;
  dispatch_group_notify(v14, MEMORY[0x1E4F14428], v21);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v49, 8);

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&buf, 8);
}

id __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_200(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 inAppAdamID];
  id v5 = [v4 stringValue];

  if (v5 && ([*(id *)(a1 + 32) containsObject:v5] & 1) == 0)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v3 forKey:v5];
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_202(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
    id Property = objc_getProperty(v4, v6, 64, 1);
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __62__FCPurchaseController_allAppStorePurchasedTagIDsByPurchaseID__block_invoke;
    v54 = &unk_1E5B4E038;
    id v55 = v5;
    id v8 = v5;
    [Property enumerateKeysAndObjectsUsingBlock:buf];
    id v4 = (void *)[v8 copy];
  }
  __int16 v9 = [v3 error];

  if (!v9)
  {
    id v17 = [v3 channelIDsByPurchaseID];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_2_203;
    v51[3] = &unk_1E5B4E1E8;
    long long v52 = *(_OWORD *)(a1 + 72);
    [v17 enumerateKeysAndObjectsUsingBlock:v51];

    id v18 = *(void **)(a1 + 40);
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_4;
    v47[3] = &unk_1E5B4E238;
    id v19 = v4;
    uint64_t v20 = *(void *)(a1 + 72);
    id v48 = v19;
    uint64_t v49 = v20;
    uint64_t v50 = *(void *)(a1 + 88);
    [v18 enumerateObjectsUsingBlock:v47];
    id v16 = v48;
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v10 = [v3 error];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    id v12 = [v3 error];
    int v13 = objc_msgSend(v12, "fc_isOfflineError");

    if (v13)
    {
      uint64_t v14 = (void *)FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = v14;
        uint64_t v37 = (objc_class *)objc_opt_class();
        uint64_t v38 = NSStringFromClass(v37);
        uint64_t v39 = *(void *)(a1 + 32);
        id v40 = [v3 error];
        *(_DWORD *)long long buf = 138543874;
        *(void *)&uint8_t buf[4] = v38;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v39;
        *(_WORD *)&buf[22] = 2114;
        v54 = v40;
        _os_log_error_impl(&dword_1A460D000, v36, OS_LOG_TYPE_ERROR, "<%{public}@ %p> fetchChannelIDsForPurchaseIDs failed with error: %{public}@", buf, 0x20u);
      }
      uint64_t v15 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      id v16 = [*(id *)(a1 + 48) allObjects];
      [v15 addObjectsFromArray:v16];
      goto LABEL_10;
    }
  }
LABEL_11:
  char v21 = FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = v22;
    _os_log_impl(&dword_1A460D000, v21, OS_LOG_TYPE_DEFAULT, "subscriptionNotSupportedTagIDs:%@", buf, 0xCu);
    char v21 = FCPurchaseLog;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = v23;
    _os_log_impl(&dword_1A460D000, v21, OS_LOG_TYPE_DEFAULT, "entitledTagIDs:%@", buf, 0xCu);
  }
  id v24 = (void *)MEMORY[0x1E4F1CA48];
  id v25 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) allObjects];
  id v26 = [v24 arrayWithArray:v25];

  id v27 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) allObjects];
  [v26 addObjectsFromArray:v27];

  uint64_t v28 = *(void **)(a1 + 56);
  if (v28) {
    uint64_t v28 = (void *)v28[4];
  }
  id v29 = v28;
  SEL v30 = [v29 tagController];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_207;
  v41[3] = &unk_1E5B4E2B0;
  long long v31 = *(_OWORD *)(a1 + 72);
  id v32 = *(void **)(a1 + 64);
  v41[4] = *(void *)(a1 + 56);
  long long v33 = *(_OWORD *)(a1 + 96);
  long long v43 = v31;
  long long v44 = v33;
  uint64_t v34 = *(void *)(a1 + 112);
  uint64_t v45 = *(void *)(a1 + 88);
  uint64_t v46 = v34;
  id v35 = v32;

  id v42 = v35;
  [v30 fetchTagsForTagIDs:v26 maximumCachedAge:9 qualityOfService:v41 completionHandler:0.0];
}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_2_203(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_3_204;
  v7[3] = &unk_1E5B4E1C0;
  long long v9 = *(_OWORD *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  [a3 enumerateObjectsUsingBlock:v7];
}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_3_204(void *a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1[5] + 8) + 40);
  id v4 = a2;
  [v3 addObject:v4];
  [*(id *)(*(void *)(a1[6] + 8) + 40) setObject:a1[4] forKey:v4];
}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectForKey:a2];
  id v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    void v5[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_5;
    v5[3] = &unk_1E5B4E210;
    long long v6 = *(_OWORD *)(a1 + 40);
    [v3 enumerateObjectsUsingBlock:v5];
  }
}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "containsObject:") & 1) == 0) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v3];
  }
}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_207(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_2_208;
  v9[3] = &unk_1E5B4E288;
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v4;
  long long v5 = *(_OWORD *)(a1 + 72);
  long long v13 = *(_OWORD *)(a1 + 56);
  long long v14 = v5;
  uint64_t v15 = *(void *)(a1 + 88);
  long long v8 = *(_OWORD *)(a1 + 40);
  id v6 = (id)v8;
  long long v12 = v8;
  id v7 = v3;
  FCPerformBlockOnMainThread(v9);
}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_2_208(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_3_209;
  v11[3] = &unk_1E5B4E260;
  long long v3 = *(_OWORD *)(a1 + 56);
  v11[4] = *(void *)(a1 + 40);
  long long v4 = *(_OWORD *)(a1 + 72);
  long long v12 = v3;
  long long v13 = v4;
  long long v14 = *(_OWORD *)(a1 + 88);
  [v2 enumerateKeysAndObjectsUsingBlock:v11];
  long long v5 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_213;
  v9[3] = &unk_1E5B4DBB0;
  id v10 = *(id *)(a1 + 32);
  uint64_t v6 = objc_msgSend(v5, "fc_setOfObjectsPassingTest:", v9);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  long long v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_3_209(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = [v4 identifier];
  if (![*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) containsObject:v5])
  {
    if (![*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) containsObject:v5]) {
      goto LABEL_20;
    }
    uint64_t v6 = [v4 replacementID];
    uint64_t v7 = [v4 identifier];
    if (v6
      && [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) containsObject:v6])
    {
      [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) addObject:v6];
      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) removeObject:v7];
      long long v8 = *(void **)(a1 + 32);
      id v19 = v7;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
      id v10 = v9;
      if (v8)
      {
        uint64_t v11 = v8[10];
        *(void *)block = MEMORY[0x1E4F143A8];
        *(void *)&block[8] = 3221225472;
        *(void *)&block[16] = __72__FCPurchaseController_silentRemoveFromPurchasedChannelsListWithTagIDs___block_invoke;
        char v21 = &unk_1E5B4BE70;
        id v22 = v8;
        id v23 = v9;
        dispatch_sync(v11, block);
      }
      goto LABEL_15;
    }
LABEL_19:

    goto LABEL_20;
  }
  if (+[FCTagController isTagAllowedInContentStoreFront:](FCTagController, "isTagAllowedInContentStoreFront:", v4)&& ([v4 isDeprecated] & 1) == 0)
  {
    uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKey:v5];
    long long v12 = [*(id *)(a1 + 32) purchaseLookUpEntryForTagID:v5];
    uint64_t v7 = v12;
    if (!v12)
    {
      id v16 = FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)block = 138412546;
        *(void *)&void block[4] = v5;
        *(_WORD *)&block[12] = 2112;
        *(void *)&block[14] = v6;
        _os_log_impl(&dword_1A460D000, v16, OS_LOG_TYPE_DEFAULT, "Adding tagID:%@ and purchaseID:%@ to purchased channels list", block, 0x16u);
      }
      id v17 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectForKey:v6];
      -[FCPurchaseController addToPurchasedChannelsListWithTagID:purchaseID:purchaseType:purchaseValidationState:isNewsAppPurchase:lastVerificationTime:](*(void *)(a1 + 32), v5, v6, 1, [v17 isNewsAppPurchase], 0);
      id v18 = -[FCRestorePaidSubscriptionItem initWithChannelID:isNewsAppPurchase:]([FCRestorePaidSubscriptionItem alloc], "initWithChannelID:isNewsAppPurchase:", v5, [v17 isNewsAppPurchase]);
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v18];

      goto LABEL_19;
    }
    if ([v12 purchaseValidationState] != 1)
    {
      long long v13 = *(void **)(a1 + 32);
      id v14 = v7;
      id v10 = v14;
      if (v13)
      {
        uint64_t v15 = v13[10];
        *(void *)block = MEMORY[0x1E4F143A8];
        *(void *)&block[8] = 3221225472;
        *(void *)&block[16] = __64__FCPurchaseController_updatePurchaseEntryToValid_purchaseType___block_invoke;
        char v21 = &unk_1E5B4E490;
        id v23 = v13;
        uint64_t v24 = 1;
        id v22 = v14;
        dispatch_sync(v15, block);
      }
LABEL_15:

      goto LABEL_19;
    }
    goto LABEL_19;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeObject:v5];
LABEL_20:
}

BOOL __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_213(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) objectForKey:a2];
  BOOL v3 = v2 != 0;

  return v3;
}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_2_217(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) allObjects];
  BOOL v3 = [*(id *)(a1 + 32) allObjects];
  id v4 = objc_msgSend(v2, "fc_arrayByRemovingObjectsInArray:", v3);

  long long v5 = FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "restoredChannelIDs:%@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) allObjects];
  uint64_t v7 = objc_msgSend(v4, "fc_arrayByRemovingObjectsInArray:", v6);

  long long v8 = *(void **)(a1 + 40);
  if (v8)
  {
    id v9 = (void *)v8[4];
    id v10 = v7;
    uint64_t v11 = [v9 tagController];
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    long long v52 = __65__FCPurchaseController_addAppStoreDiscoveredChannelsToFavorites___block_invoke;
    v53 = &unk_1E5B4E3F0;
    id v54 = v8;
    [v11 fetchTagsForTagIDs:v10 qualityOfService:9 callbackQueue:MEMORY[0x1E4F14428] completionHandler:&buf];
  }
  long long v12 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = [*(id *)(a1 + 40) purchasesDiscoveredTagIDs];
  id v14 = [v13 allObjects];
  [v12 addObjectsFromArray:v14];

  [v12 addObjectsFromArray:v7];
  -[FCPurchaseController setPurchasesDiscoveredTagIDs:](*(void *)(a1 + 40), v12);
  uint64_t v15 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = *(void **)(a1 + 40);
    id v17 = v15;
    id v18 = [v16 purchasesDiscoveredTagIDs];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v18;
    _os_log_impl(&dword_1A460D000, v17, OS_LOG_TYPE_DEFAULT, "purchasesDiscoveredTagIDs:%@", (uint8_t *)&buf, 0xCu);
  }
  id v19 = *(void **)(a1 + 40);
  if (v19) {
    uint64_t v20 = (void *)v19[6];
  }
  else {
    uint64_t v20 = 0;
  }
  id v21 = v20;
  id v22 = [v19 purchasesDiscoveredTagIDs];
  id v23 = [v22 allObjects];
  [v21 setObject:v23 forKey:@"SubscriptionsDiscoveredList"];

  uint64_t v24 = [*(id *)(a1 + 40) purchasesDiscoveredTagIDs];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    id v26 = *(void **)(a1 + 40);
    id v27 = [v26 purchasesDiscoveredTagIDs];
    -[FCPurchaseController notifyPurchasesDiscoveredWithTagIDs:]((uint64_t)v26, v27);
  }
  uint64_t v28 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) allObjects];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_218;
  v50[3] = &unk_1E5B4DAA0;
  v50[4] = *(void *)(a1 + 40);
  [v28 enumerateObjectsUsingBlock:v50];

  uint64_t v29 = *(void *)(a1 + 40);
  if (v29)
  {
    SEL v30 = [MEMORY[0x1E4F1CA80] set];
    long long v31 = (id *)*(id *)(v29 + 56);
    id v32 = -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v31);
    long long v33 = (void *)[v32 copy];
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    long long v52 = __50__FCPurchaseController_allAppStorePurchasedTagIDs__block_invoke;
    v53 = &unk_1E5B4E038;
    id v34 = v30;

    id v54 = v34;
    [v33 enumerateKeysAndObjectsUsingBlock:&buf];
  }
  else
  {
    id v34 = 0;
  }
  id v35 = [v34 allObjects];
  uint64_t v36 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) allObjects];
  uint64_t v37 = objc_msgSend(v35, "fc_arrayByRemovingObjectsInArray:", v36);

  uint64_t v38 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) allObjects];
  uint64_t v39 = objc_msgSend(v37, "fc_arrayByRemovingObjectsInArray:", v38);

  id v40 = FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v39;
    _os_log_impl(&dword_1A460D000, v40, OS_LOG_TYPE_DEFAULT, "expiredPurchaseIDs:%@", (uint8_t *)&buf, 0xCu);
  }
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_219;
  v49[3] = &unk_1E5B4DAA0;
  v49[4] = *(void *)(a1 + 40);
  [v39 enumerateObjectsUsingBlock:v49];
  v41 = *(NSObject **)(a1 + 48);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_2_220;
  v44[3] = &unk_1E5B4E300;
  id v46 = *(id *)(a1 + 64);
  id v42 = *(id *)(a1 + 56);
  uint64_t v43 = *(void *)(a1 + 104);
  id v45 = v42;
  uint64_t v48 = v43;
  id v47 = *(id *)(a1 + 72);
  dispatch_async(v41, v44);
}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_218(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    id v4 = *(id **)(v3 + 56);
  }
  else {
    id v4 = 0;
  }
  id v5 = a2;
  uint64_t v6 = -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v4);
  uint64_t v7 = [v6 objectForKey:v5];

  uint64_t v8 = *(void *)(a1 + 32);
  id v10 = v7;
  if (v8)
  {
    id v9 = *(NSObject **)(v8 + 80);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__FCPurchaseController_updatePurchaseEntryToSubscriptionNotSupported___block_invoke;
    block[3] = &unk_1E5B4BE70;
    id v12 = v10;
    uint64_t v13 = v8;
    dispatch_sync(v9, block);
  }
}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_219(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    id v4 = *(id **)(v3 + 56);
  }
  else {
    id v4 = 0;
  }
  id v5 = a2;
  uint64_t v6 = -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v4);
  id v11 = [v6 objectForKey:v5];

  [*(id *)(a1 + 32) updatePurchaseEntryToExpired:v11];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    uint64_t v8 = *(void **)(v7 + 32);
    id v9 = v5;
    id v10 = [v8 tagSettings];
    [v10 setWebAccessOptInForTagID:v9 webAccessOptIn:0];

    FCPerformBlockOnMainThread(&__block_literal_global_177);
  }
}

uint64_t __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_2_220(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, a1[4], *(void *)(*(void *)(a1[7] + 8) + 40));
  }
  uint64_t result = a1[6];
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __65__FCPurchaseController_addAppStoreDiscoveredChannelsToFavorites___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = (void *)[[NSString alloc] initWithFormat:@"Couldn't add the subscriptions detected channels to favorites"];
      *(_DWORD *)long long buf = 136315906;
      id v10 = "-[FCPurchaseController addAppStoreDiscoveredChannelsToFavorites:]_block_invoke";
      __int16 v11 = 2080;
      id v12 = "FCPurchaseController.m";
      __int16 v13 = 1024;
      int v14 = 1035;
      __int16 v15 = 2114;
      id v16 = v7;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__FCPurchaseController_addAppStoreDiscoveredChannelsToFavorites___block_invoke_225;
    v8[3] = &unk_1E5B4E3C8;
    void v8[4] = *(void *)(a1 + 32);
    [v5 enumerateKeysAndObjectsUsingBlock:v8];
  }
}

void __65__FCPurchaseController_addAppStoreDiscoveredChannelsToFavorites___block_invoke_225(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(a1 + 32);
  if (v5) {
    id v5 = (void *)v5[4];
  }
  id v6 = v5;
  uint64_t v7 = [v6 subscriptionController];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__FCPurchaseController_addAppStoreDiscoveredChannelsToFavorites___block_invoke_2;
  v9[3] = &unk_1E5B4E3A0;
  void v9[4] = *(void *)(a1 + 32);

  id v10 = v4;
  id v8 = v4;
  [v7 subscriptionsWithCompletion:v9];
}

void __65__FCPurchaseController_addAppStoreDiscoveredChannelsToFavorites___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[4];
  }
  uint64_t v3 = v2;
  id v4 = [v3 subscriptionController];
  char v5 = [v4 hasSubscriptionToTag:*(void *)(a1 + 40)];

  if ((v5 & 1) == 0)
  {
    id v6 = *(void **)(a1 + 32);
    if (v6) {
      id v6 = (void *)v6[4];
    }
    uint64_t v7 = v6;
    id v8 = [v7 subscriptionController];
    uint64_t v9 = *(void *)(a1 + 40);
    id v11 = 0;
    [v8 addSubscriptionToTag:v9 error:&v11];
    id v10 = v11;
  }
}

void __79__FCPurchaseController_fetchChannelIDsForPurchaseIDs_callbackQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 fetchedObject];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (NSDictionary)purchaseLookUpEntriesByTagID
{
  if (self) {
    self = (FCPurchaseController *)objc_getProperty(self, a2, 64, 1);
  }
  uint64_t v2 = (void *)[(FCPurchaseController *)self copy];
  return (NSDictionary *)v2;
}

- (id)purchaseLookUpEntryForTagID:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 64, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v7 = [Property objectForKey:v5];

  return v7;
}

void __62__FCPurchaseController_allAppStorePurchasedTagIDsByPurchaseID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if ([v5 purchaseType] == 1 && objc_msgSend(v5, "purchaseValidationState") == 1)
  {
    id v6 = [v5 purchaseID];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA48] arrayWithObject:v14];
      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = [v5 purchaseID];
      id v10 = [v8 objectForKey:v9];

      if (v10) {
        [v7 addObjectsFromArray:v10];
      }
      id v11 = *(void **)(a1 + 32);
      id v12 = (void *)[v7 copy];
      __int16 v13 = [v5 purchaseID];
      [v11 setObject:v12 forKey:v13];
    }
  }
}

- (NSSet)allTagIDs
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  if (self) {
    self = (FCPurchaseController *)objc_getProperty(self, a2, 64, 1);
  }
  id v3 = [(FCPurchaseController *)self allKeys];
  id v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

uint64_t __43__FCPurchaseController__allPurchasedTagIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (NSSet)allPurchaseIDs
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __38__FCPurchaseController_allPurchaseIDs__block_invoke;
  v6[3] = &unk_1E5B4E038;
  id v4 = v3;
  id v7 = v4;
  -[FCPurchaseController _enumerateValidPurchasesUsingBlock:](self, v6);

  return (NSSet *)v4;
}

void __38__FCPurchaseController_allPurchaseIDs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if ([v6 purchaseType] == 1 && objc_msgSend(v6, "purchaseValidationState") == 1)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v6 purchaseID];
    [v4 addObject:v5];
  }
}

void __59__FCPurchaseController__enumerateValidPurchasesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v5 purchaseValidationState] == 1 || objc_msgSend(v5, "purchaseValidationState") == 3) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __50__FCPurchaseController_allAppStorePurchasedTagIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v5 purchaseValidationState] == 1 && objc_msgSend(v5, "purchaseType") == 1) {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

- (BOOL)isTagIDPurchased:(id)a3
{
  id v3 = [(FCPurchaseController *)self purchaseLookUpEntryForTagID:a3];
  BOOL v4 = [v3 purchaseValidationState] == 1 || objc_msgSend(v3, "purchaseValidationState") == 3;

  return v4;
}

- (BOOL)isTagPurchased:(id)a3
{
  id v4 = a3;
  if ([v4 tagType] == 3)
  {
    id v5 = [v4 asSection];

    id v6 = [v5 parentID];
    id v4 = v5;
  }
  else
  {
    id v6 = [v4 identifier];
  }

  BOOL v7 = [(FCPurchaseController *)self isTagIDPurchased:v6];
  return v7;
}

void __55__FCPurchaseController_atleastOneValidAppStorePurchase__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    *a4 = 1;
  }
  else
  {
    id v8 = v6;
    BOOL v7 = [v6 purchaseType] == 1;
    id v6 = v8;
    if (v7)
    {
      BOOL v7 = [v8 purchaseValidationState] == 1;
      id v6 = v8;
      if (v7) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      }
    }
  }
}

void __147__FCPurchaseController_addToPurchasedChannelsListWithTagID_purchaseID_purchaseType_purchaseValidationState_isNewsAppPurchase_lastVerificationTime___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void *)(v2 + 56);
  }
  else {
    uint64_t v3 = 0;
  }
  -[FCPurchaseLookUpEntriesManager addEntryWithTagID:purchaseID:lastVerificationTime:lastVerificationFailureTime:purchaseType:purchaseValidationState:isNewsAppPurchase:dateOfExpiration:hasShownRenewalNotice:](v3, *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), 0, *(void *)(a1 + 64), *(void *)(a1 + 72), *(unsigned char *)(a1 + 80), 0, 0);
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    id v4 = (void *)v4[7];
  }
  id v5 = v4;
  id v6 = -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v5);
  id v8 = (void *)[v6 copy];
  uint64_t v9 = *(void **)(a1 + 32);
  if (v9) {
    objc_setProperty_atomic_copy(v9, v7, v8, 64);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *(void *)(a1 + 40), 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  -[FCPurchaseController notifyPurchaseAddedWithTagIDs:](v10, v11);
}

- (void)renewalNoticeShownForPurchasedChannelsListWithTagIDs:(id)a3
{
  id v4 = a3;
  if (self) {
    accessQueue = self->_accessQueue;
  }
  else {
    accessQueue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__FCPurchaseController_renewalNoticeShownForPurchasedChannelsListWithTagIDs___block_invoke;
  v7[3] = &unk_1E5B4BE70;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

uint64_t __77__FCPurchaseController_renewalNoticeShownForPurchasedChannelsListWithTagIDs___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__FCPurchaseController_renewalNoticeShownForPurchasedChannelsListWithTagIDs___block_invoke_2;
  v3[3] = &unk_1E5B4E468;
  uint64_t v1 = *(void **)(a1 + 32);
  void v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateObjectsUsingBlock:v3];
}

void __77__FCPurchaseController_renewalNoticeShownForPurchasedChannelsListWithTagIDs___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    id v4 = *(id **)(v3 + 56);
  }
  else {
    id v4 = 0;
  }
  id v5 = a2;
  id v6 = -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v4);
  BOOL v7 = [v6 objectForKey:v5];

  id v11 = (id)[v7 mutableCopy];
  id v8 = v11;
  if (v11)
  {
    [v11 setHasShownRenewalNotice:1];
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v10 = *(void *)(v9 + 56);
    }
    else {
      uint64_t v10 = 0;
    }
    -[FCPurchaseLookUpEntriesManager updateEntry:](v10, v11);
    id v8 = v11;
  }
}

- (void)updatePurchaseEntryToExpiredForTagIDs:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__FCPurchaseController_updatePurchaseEntryToExpiredForTagIDs___block_invoke;
  v3[3] = &unk_1E5B4E468;
  void v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

void __62__FCPurchaseController_updatePurchaseEntryToExpiredForTagIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) purchaseLookUpEntryForTagID:a2];
  [*(id *)(a1 + 32) updatePurchaseEntryToExpired:v3];
}

- (void)updatePurchaseEntryToExpired:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__FCPurchaseController_updatePurchaseEntryToExpired_hasShownRenewalNotice___block_invoke;
    block[3] = &unk_1E5B4C710;
    char v10 = 0;
    id v8 = v4;
    uint64_t v9 = self;
    dispatch_sync(accessQueue, block);
  }
}

void __75__FCPurchaseController_updatePurchaseEntryToExpired_hasShownRenewalNotice___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v16 = (id)[v2 mutableCopy];
    [v16 setPurchaseValidationState:2];
    id v3 = [MEMORY[0x1E4F1C9C8] date];
    [v16 setDateOfExpiration:v3];

    [v16 setHasShownRenewalNotice:*(unsigned __int8 *)(a1 + 48)];
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      uint64_t v5 = *(void *)(v4 + 56);
    }
    else {
      uint64_t v5 = 0;
    }
    -[FCPurchaseLookUpEntriesManager updateEntry:](v5, v16);
    id v6 = *(void **)(a1 + 40);
    if (v6) {
      id v6 = (void *)v6[7];
    }
    BOOL v7 = v6;
    id v8 = -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v7);
    char v10 = (void *)[v8 copy];
    id v11 = *(void **)(a1 + 40);
    if (v11) {
      objc_setProperty_atomic_copy(v11, v9, v10, 64);
    }

    id v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = *(void *)(a1 + 40);
    id v14 = [*(id *)(a1 + 32) tagID];
    __int16 v15 = objc_msgSend(v12, "setWithObjects:", v14, 0);
    -[FCPurchaseController notifyPurchaseRemovedWithTagIDs:](v13, v15);
  }
}

void __70__FCPurchaseController_updatePurchaseEntryToSubscriptionNotSupported___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPurchaseValidationState:4];
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2) {
    uint64_t v2 = (void *)v2[6];
  }
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = v2;
  id v6 = [v3 dictionaryRepresentation];
  uint64_t v5 = [*(id *)(a1 + 32) identifier];
  [v4 setObject:v6 forKey:v5];
}

void __64__FCPurchaseController_updatePurchaseEntryToValid_purchaseType___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPurchaseValidationState:1];
  [*(id *)(a1 + 32) setPurchaseType:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setHasShownRenewalNotice:0];
  [*(id *)(a1 + 32) setDateOfExpiration:0];
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2) {
    uint64_t v2 = (void *)v2[6];
  }
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = v2;
  uint64_t v5 = [v3 dictionaryRepresentation];
  id v6 = [*(id *)(a1 + 32) identifier];
  [v4 setObject:v5 forKey:v6];

  BOOL v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) tagID];
  uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v10, 0);
  -[FCPurchaseController notifyPurchaseAddedWithTagIDs:](v8, v9);
}

- (void)removeFromPurchasedChannelsListWithTagIDs:(id)a3
{
  id v4 = a3;
  if (self) {
    accessQueue = self->_accessQueue;
  }
  else {
    accessQueue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__FCPurchaseController_removeFromPurchasedChannelsListWithTagIDs___block_invoke;
  v7[3] = &unk_1E5B4BE70;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

uint64_t __66__FCPurchaseController_removeFromPurchasedChannelsListWithTagIDs___block_invoke(uint64_t a1)
{
  return -[FCPurchaseController _removeFromPurchasedChannelsListWithTagIDs:](*(void *)(a1 + 32), *(void **)(a1 + 40));
}

- (uint64_t)_removeFromPurchasedChannelsListWithTagIDs:(uint64_t)result
{
  if (result)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __67__FCPurchaseController__removeFromPurchasedChannelsListWithTagIDs___block_invoke;
    v2[3] = &unk_1E5B4E468;
    v2[4] = result;
    return [a2 enumerateObjectsUsingBlock:v2];
  }
  return result;
}

uint64_t __72__FCPurchaseController_silentRemoveFromPurchasedChannelsListWithTagIDs___block_invoke(uint64_t a1)
{
  return -[FCPurchaseController _removeFromPurchasedChannelsListWithTagIDs:](*(void *)(a1 + 32), *(void **)(a1 + 40));
}

void __67__FCPurchaseController__removeFromPurchasedChannelsListWithTagIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 56);
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = a2;
  -[FCPurchaseLookUpEntriesManager removeEntryForTagID:](v4, v5);
  id v6 = *(void **)(a1 + 32);
  if (v6) {
    id v6 = (void *)v6[7];
  }
  BOOL v7 = v6;
  id v8 = -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v7);
  id v10 = (void *)[v8 copy];
  id v11 = *(void **)(a1 + 32);
  if (v11) {
    objc_setProperty_atomic_copy(v11, v9, v10, 64);
  }

  uint64_t v12 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v5, 0);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  -[FCPurchaseController notifyPurchaseRemovedWithTagIDs:](v12, v13);
}

- (void)removeFromPurchasesDiscoveredList:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    accessQueue = self->_accessQueue;
  }
  else {
    accessQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__FCPurchaseController_removeFromPurchasesDiscoveredList_completion___block_invoke;
  block[3] = &unk_1E5B4E088;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

uint64_t __69__FCPurchaseController_removeFromPurchasesDiscoveredList_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) purchasesDiscoveredTagIDs];
  uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 40)];
  uint64_t v4 = objc_msgSend(v2, "fc_setByMinusingSet:", v3);
  -[FCPurchaseController setPurchasesDiscoveredTagIDs:](*(void *)(a1 + 32), v4);

  id v5 = *(void **)(a1 + 32);
  if (v5) {
    id v6 = (void *)v5[6];
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  id v8 = [v5 purchasesDiscoveredTagIDs];
  id v9 = [v8 allObjects];
  [v7 setObject:v9 forKey:@"SubscriptionsDiscoveredList"];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v11 = *(uint64_t (**)(void))(result + 16);
    return v11();
  }
  return result;
}

- (void)removeWebPurchaseForTagID:(id)a3 userInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  if (self) {
    cloudContext = self->_cloudContext;
  }
  else {
    cloudContext = 0;
  }
  id v6 = a3;
  id v7 = [(FCCloudContext *)cloudContext tagSettings];
  [v7 setAccessTokenForTagID:v6 accessToken:0 userInitiated:v4];
}

void __67__FCPurchaseController_cleanupExpiredPurchaseLookupEntriesIfNeeded__block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property)
  {
    id Property = objc_getProperty(Property, a2, 64, 1);
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v4 = 0;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__FCPurchaseController_cleanupExpiredPurchaseLookupEntriesIfNeeded__block_invoke_2;
  v11[3] = &unk_1E5B4E038;
  v11[4] = v4;
  [Property enumerateKeysAndObjectsUsingBlock:v11];
  id v5 = *(void **)(a1 + 32);
  if (v5) {
    id v5 = (void *)v5[7];
  }
  id v6 = v5;
  id v7 = -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v6);
  id v9 = (void *)[v7 copy];
  id v10 = *(void **)(a1 + 32);
  if (v10) {
    objc_setProperty_atomic_copy(v10, v8, v9, 64);
  }
}

void __67__FCPurchaseController_cleanupExpiredPurchaseLookupEntriesIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if ([v5 purchaseValidationState] == 2)
  {
    id v6 = [v5 dateOfExpiration];
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    char v8 = objc_msgSend(v6, "fc_isWithinTimeInterval:ofDate:", v7, 864000.0);

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      if (v9) {
        uint64_t v10 = *(void *)(v9 + 56);
      }
      else {
        uint64_t v10 = 0;
      }
      -[FCPurchaseLookUpEntriesManager removeEntryForTagID:](v10, v11);
    }
  }
}

- (void)activityObservingApplicationDidEnterBackground
{
  if (self)
  {
    [MEMORY[0x1E4F29060] isMainThread];
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__FCPurchaseController_cleanupExpiredPurchaseLookupEntriesIfNeeded__block_invoke;
    block[3] = &unk_1E5B4C018;
    void block[4] = self;
    dispatch_sync(accessQueue, block);
    localStore = self->_localStore;
    [(FCKeyValueStore *)localStore saveWithCompletionHandler:0];
  }
}

- (void)userInfo:(id)a3 didRemoveAccessTokenForTagID:(id)a4 userInitiated:(BOOL)a5
{
}

- (void)handleAccessTokenChangeWithTagID:(uint64_t)a1 userInitiated:(void *)a2
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = *(id *)(a1 + 32);
    id v5 = [v4 tagSettings];
    id v6 = [v5 accessTokenForTagID:v3];

    uint64_t v31 = 0;
    id v32 = &v31;
    uint64_t v33 = 0x3032000000;
    id v34 = __Block_byref_object_copy__10;
    id v35 = __Block_byref_object_dispose__10;
    id v36 = [(id)a1 purchaseLookUpEntryForTagID:v3];
    if (v6)
    {
      objc_initWeak(&location, (id)a1);
      id v7 = *(id *)(a1 + 32);
      char v8 = [v7 tagController];
      id v9 = MEMORY[0x1E4F14428];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __71__FCPurchaseController_handleAccessTokenChangeWithTagID_userInitiated___block_invoke;
      v25[3] = &unk_1E5B4E4E0;
      objc_copyWeak(&v29, &location);
      uint64_t v27 = a1;
      uint64_t v28 = &v31;
      id v26 = v3;
      [v8 fetchTagForTagID:v26 qualityOfService:9 callbackQueue:MEMORY[0x1E4F14428] completionHandler:v25];

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
    else
    {
      uint64_t v10 = (void *)v32[5];
      if (v10)
      {
        if ([v10 purchaseType] == 2)
        {
          v37[0] = v3;
          id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
          [(id)a1 removeFromPurchasedChannelsListWithTagIDs:v11];

          id v12 = [(id)a1 purchasesDiscoveredTagIDs];
          int v13 = [v12 containsObject:v3];

          if (v13)
          {
            id v14 = [(id)a1 purchasesDiscoveredTagIDs];
            __int16 v15 = [v14 allObjects];
            id v16 = (void *)[v15 mutableCopy];

            [v16 removeObject:v3];
            uint64_t v17 = (void *)MEMORY[0x1E4F1CAD0];
            id v18 = (void *)[v16 copy];
            uint64_t v19 = [v17 setWithArray:v18];
            uint64_t v20 = *(void **)(a1 + 8);
            *(void *)(a1 + 8) = v19;

            id v21 = *(id *)(a1 + 48);
            id v22 = [(id)a1 purchasesDiscoveredTagIDs];
            id v23 = [v22 allObjects];
            [v21 setObject:v23 forKey:@"SubscriptionsDiscoveredList"];

            uint64_t v24 = [(id)a1 purchasesDiscoveredTagIDs];
            -[FCPurchaseController notifyPurchasesDiscoveredWithTagIDs:](a1, v24);
          }
        }
      }
    }
    _Block_object_dispose(&v31, 8);
  }
}

- (void)userInfo:(id)a3 didChangeAccessTokenForTagID:(id)a4
{
}

void __71__FCPurchaseController_handleAccessTokenChangeWithTagID_userInitiated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __71__FCPurchaseController_handleAccessTokenChangeWithTagID_userInitiated___block_invoke_2;
  v6[3] = &unk_1E5B4E4B8;
  id v7 = v3;
  id v8 = *(id *)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 40);
  id v5 = v3;
  FCPerformIfNonNil(WeakRetained, v6);
}

void __71__FCPurchaseController_handleAccessTokenChangeWithTagID_userInitiated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    if (+[FCTagController isTagAllowedInContentStoreFront:](FCTagController, "isTagAllowedInContentStoreFront:")&& ([*(id *)(a1 + 32) isDeprecated] & 1) == 0)
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        id v4 = *(void **)(a1 + 40);
        id v5 = [MEMORY[0x1E4F1C9C8] date];
        -[FCPurchaseController addToPurchasedChannelsListWithTagID:purchaseID:purchaseType:purchaseValidationState:isNewsAppPurchase:lastVerificationTime:]((uint64_t)v3, v4, 0, 2, 1, v5);

        if (v3) {
          id v6 = (void *)v3[4];
        }
        else {
          id v6 = 0;
        }
        id v7 = v6;
        id v8 = [v7 subscriptionController];
        [v8 addSubscriptionToTag:*(void *)(a1 + 32) error:0];

        long long v9 = [*(id *)(a1 + 48) purchasesDiscoveredTagIDs];
        uint64_t v10 = [v9 allObjects];
        id v11 = (void *)[v10 mutableCopy];

        [v11 addObject:*(void *)(a1 + 40)];
        id v12 = (void *)MEMORY[0x1E4F1CAD0];
        int v13 = (void *)[v11 copy];
        id v14 = [v12 setWithArray:v13];
        -[FCPurchaseController setPurchasesDiscoveredTagIDs:]((uint64_t)v3, v14);

        if (v3) {
          __int16 v15 = (void *)v3[6];
        }
        else {
          __int16 v15 = 0;
        }
        id v16 = v15;
        uint64_t v17 = [v3 purchasesDiscoveredTagIDs];
        id v18 = [v17 allObjects];
        [v16 setObject:v18 forKey:@"SubscriptionsDiscoveredList"];

        uint64_t v19 = [v3 purchasesDiscoveredTagIDs];
        -[FCPurchaseController notifyPurchasesDiscoveredWithTagIDs:]((uint64_t)v3, v19);
      }
    }
    else
    {
      [v3 removeWebPurchaseForTagID:*(void *)(a1 + 40) userInitiated:0];
    }
  }
  else
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __71__FCPurchaseController_handleAccessTokenChangeWithTagID_userInitiated___block_invoke_3;
    v20[3] = &unk_1E5B4BE70;
    id v21 = *(id *)(a1 + 40);
    id v22 = v3;
    __71__FCPurchaseController_handleAccessTokenChangeWithTagID_userInitiated___block_invoke_3((uint64_t)v20);
  }
}

uint64_t __71__FCPurchaseController_handleAccessTokenChangeWithTagID_userInitiated___block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "Nil tag returned in handleAccessTokenChange for tagID:%@", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 40) removeWebPurchaseForTagID:*(void *)(a1 + 32) userInitiated:0];
}

void __93__FCPurchaseController_handleAccessTokenVerificationSuccessWithTagID_subscribed_accessToken___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __93__FCPurchaseController_handleAccessTokenVerificationSuccessWithTagID_subscribed_accessToken___block_invoke_2;
  v6[3] = &unk_1E5B4E530;
  id v7 = v3;
  id v8 = *(id *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 56);
  id v9 = *(id *)(a1 + 40);
  id v5 = v3;
  FCPerformIfNonNil(WeakRetained, v6);
}

void __93__FCPurchaseController_handleAccessTokenVerificationSuccessWithTagID_subscribed_accessToken___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    id v5 = [v3 purchaseLookUpEntryForTagID:*(void *)(a1 + 40)];
    if (v5)
    {
      if (v4) {
        uint64_t v6 = v4[10];
      }
      else {
        uint64_t v6 = 0;
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __93__FCPurchaseController_handleAccessTokenVerificationSuccessWithTagID_subscribed_accessToken___block_invoke_235;
      block[3] = &unk_1E5B4E508;
      id v7 = v5;
      char v22 = *(unsigned char *)(a1 + 56);
      id v17 = v7;
      id v18 = v4;
      id v19 = *(id *)(a1 + 40);
      id v20 = *(id *)(a1 + 48);
      id v21 = *(id *)(a1 + 32);
      dispatch_sync(v6, block);
    }
    else
    {
      if (*(unsigned char *)(a1 + 56))
      {
        if (v4) {
          id v8 = (void *)v4[4];
        }
        else {
          id v8 = 0;
        }
        id v9 = v8;
        char v10 = [v9 tagSettings];
        [v10 setAccessTokenForTagID:*(void *)(a1 + 40) accessToken:*(void *)(a1 + 48) userInitiated:0];

        id v11 = *(void **)(a1 + 40);
        id v12 = [MEMORY[0x1E4F1C9C8] date];
        -[FCPurchaseController addToPurchasedChannelsListWithTagID:purchaseID:purchaseType:purchaseValidationState:isNewsAppPurchase:lastVerificationTime:]((uint64_t)v4, v11, 0, 2, 1, v12);

        if (v4) {
          int v13 = (void *)v4[4];
        }
        else {
          int v13 = 0;
        }
        id v14 = v13;
        __int16 v15 = [v14 subscriptionController];
        [v15 addSubscriptionToTag:*(void *)(a1 + 32) error:0];
      }
      id v7 = 0;
    }
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __93__FCPurchaseController_handleAccessTokenVerificationSuccessWithTagID_subscribed_accessToken___block_invoke_3;
    v23[3] = &unk_1E5B4C018;
    id v24 = *(id *)(a1 + 40);
    __93__FCPurchaseController_handleAccessTokenVerificationSuccessWithTagID_subscribed_accessToken___block_invoke_3((uint64_t)v23);
    id v7 = v24;
  }
}

void __93__FCPurchaseController_handleAccessTokenVerificationSuccessWithTagID_subscribed_accessToken___block_invoke_3(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "Nil tag returned in handleAccessTokenVerification for tagID:%@", (uint8_t *)&v4, 0xCu);
  }
}

void __93__FCPurchaseController_handleAccessTokenVerificationSuccessWithTagID_subscribed_accessToken___block_invoke_235(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) purchaseValidationState];
  [*(id *)(a1 + 32) setPurchaseType:2];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  [*(id *)(a1 + 32) setLastVerificationTime:v3];

  [*(id *)(a1 + 32) setLastVerificationFailureTime:0];
  if (*(unsigned char *)(a1 + 72)) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  [*(id *)(a1 + 32) setPurchaseValidationState:v4];
  if (*(unsigned char *)(a1 + 72))
  {
    [*(id *)(a1 + 32) setDateOfExpiration:0];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
    [*(id *)(a1 + 32) setDateOfExpiration:v5];
  }
  BOOL v6 = v2 != 2 && *(unsigned char *)(a1 + 72) == 0;
  if (v6 || *(unsigned char *)(a1 + 72)) {
    [*(id *)(a1 + 32) setHasShownRenewalNotice:0];
  }
  id v7 = *(void **)(a1 + 40);
  if (v7) {
    id v7 = (void *)v7[6];
  }
  id v8 = *(void **)(a1 + 32);
  id v9 = v7;
  char v10 = [v8 dictionaryRepresentation];
  id v11 = [*(id *)(a1 + 32) identifier];
  [v9 setObject:v10 forKey:v11];

  if (*(unsigned char *)(a1 + 72) && v2 != 1)
  {
    id v12 = *(void **)(a1 + 40);
    if (v12) {
      id v12 = (void *)v12[4];
    }
    int v13 = v12;
    id v14 = [v13 tagSettings];
    [v14 setAccessTokenForTagID:*(void *)(a1 + 48) accessToken:*(void *)(a1 + 56) userInitiated:0];

    __int16 v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = *(void *)(a1 + 40);
    id v17 = [*(id *)(a1 + 32) tagID];
    id v18 = objc_msgSend(v15, "setWithObjects:", v17, 0);
    -[FCPurchaseController notifyPurchaseAddedWithTagIDs:](v16, v18);

    id v19 = *(void **)(a1 + 40);
    if (v19) {
      id v19 = (void *)v19[4];
    }
    id v20 = v19;
    id v21 = [v20 subscriptionController];
    [v21 addSubscriptionToTag:*(void *)(a1 + 64) error:0];
  }
}

void __70__FCPurchaseController_handleAccessTokenVerificationFailureWithTagID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  [*(id *)(a1 + 32) setLastVerificationTime:v2];

  uint64_t v3 = [*(id *)(a1 + 32) lastVerificationFailureTime];

  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    [*(id *)(a1 + 32) setLastVerificationFailureTime:v4];
  }
  [*(id *)(a1 + 32) setPurchaseValidationState:3];
  uint64_t v5 = *(void **)(a1 + 40);
  if (v5) {
    uint64_t v5 = (void *)v5[6];
  }
  BOOL v6 = *(void **)(a1 + 32);
  id v7 = v5;
  id v9 = [v6 dictionaryRepresentation];
  id v8 = [*(id *)(a1 + 32) identifier];
  [v7 setObject:v9 forKey:v8];
}

- (void)verifyAccessTokenWithTagID:(id)a3 accessToken:(id)a4 consumedArticleCount:(unint64_t)a5 serialCompletion:(id)a6 callbackQueue:(id)a7 completion:(id)a8
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (self) {
    cloudContext = self->_cloudContext;
  }
  else {
    cloudContext = 0;
  }
  id v20 = [(FCCloudContext *)cloudContext networkReachability];
  int v21 = [v20 isNetworkReachable];

  if (v21)
  {
    if (self) {
      char v22 = self->_cloudContext;
    }
    else {
      char v22 = 0;
    }
    id v23 = v22;
    id v24 = [(FCCloudContext *)v23 tagController];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    void v37[2] = __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke;
    v37[3] = &unk_1E5B4E620;
    void v37[4] = self;
    id v38 = v14;
    uint64_t v39 = v17;
    id v41 = v18;
    id v42 = v16;
    id v40 = v15;
    unint64_t v43 = a5;
    id v25 = v16;
    id v26 = v18;
    [v24 fetchTagForTagID:v38 qualityOfService:9 callbackQueue:MEMORY[0x1E4F14428] completionHandler:v37];

    uint64_t v27 = v38;
  }
  else
  {
    uint64_t v28 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = v28;
      SEL v30 = (objc_class *)objc_opt_class();
      uint64_t v31 = NSStringFromClass(v30);
      *(_DWORD *)long long buf = 138543618;
      id v45 = v31;
      __int16 v46 = 2048;
      id v47 = self;
      _os_log_impl(&dword_1A460D000, v29, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> verifyAccessTokenWithTagID failed because the network is not reachable", buf, 0x16u);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_254;
    block[3] = &unk_1E5B4E128;
    id v35 = v18;
    id v36 = v16;
    id v32 = v16;
    id v33 = v18;
    dispatch_async(v17, block);

    uint64_t v27 = v35;
  }
}

void __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v78[1] = *MEMORY[0x1E4F143B8];
  id v59 = a2;
  id v5 = a3;
  if (v5)
  {
    BOOL v6 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138544130;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2114;
      *(void *)v76 = v11;
      *(_WORD *)&v76[8] = 2114;
      *(void *)&v76[10] = v5;
      _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> verifyAccessTokenWithTagID failed to fetch tagID: %{public}@ error: %{public}@", buf, 0x2Au);
    }
    id v12 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_236;
    block[3] = &unk_1E5B4E128;
    id v73 = *(id *)(a1 + 64);
    id v74 = *(id *)(a1 + 72);
    dispatch_async(v12, block);

    id v13 = v73;
  }
  else
  {
    id v14 = NewsCoreUserDefaults();
    id v15 = [v14 stringForKey:@"web_authentication_local_server_ip_address"];

    if (NFInternalBuild() && v15)
    {
      id v16 = NewsCoreUserDefaults();
      id v17 = [v16 stringForKey:@"web_authentication_local_server_ip_address"];

      id v18 = [NSString stringWithFormat:@"%@%@%@", @"http://", v17, @":3000/verify_authorization"];
    }
    else
    {
      id v18 = [v59 publisherPaidVerificationURL];
    }
    id v19 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = v19;
      int v21 = (objc_class *)objc_opt_class();
      char v22 = NSStringFromClass(v21);
      uint64_t v23 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543874;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 2114;
      *(void *)v76 = v18;
      _os_log_impl(&dword_1A460D000, v20, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> verifyAccessTokenWithTagID will use verificationURL: %{public}@", buf, 0x20u);
    }
    if (v18)
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      uint64_t v24 = *(void *)(a1 + 32);
      id v25 = *(void **)(a1 + 56);
      uint64_t v26 = *(void *)(a1 + 80);
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_2;
      v60[3] = &unk_1E5B4E5F8;
      objc_copyWeak(&v67, &location);
      v60[4] = *(void *)(a1 + 32);
      id v61 = *(id *)(a1 + 40);
      id v62 = *(id *)(a1 + 56);
      id v63 = *(id *)(a1 + 48);
      id v65 = *(id *)(a1 + 64);
      id v64 = v59;
      id v66 = *(id *)(a1 + 72);
      id v13 = v18;
      id v58 = v25;
      uint64_t v57 = v60;
      if (v24)
      {
        if (!v58 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          uint64_t v56 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "accessToken");
          *(_DWORD *)long long buf = 136315906;
          *(void *)&uint8_t buf[4] = "-[FCPurchaseController performHTTPRequestForVerifyAccessTokenWithURL:accessToken:consumed"
                               "ArticleCount:completion:]";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "FCPurchaseController.m";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)v76 = 1624;
          *(_WORD *)&v76[4] = 2114;
          *(void *)&v76[6] = v56;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
        uint64_t v27 = (void *)FCPurchaseLog;
        if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v50 = v27;
          v51 = (objc_class *)objc_opt_class();
          long long v52 = NSStringFromClass(v51);
          *(_DWORD *)long long buf = 138543874;
          *(void *)&uint8_t buf[4] = v52;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v24;
          *(_WORD *)&buf[22] = 2114;
          *(void *)v76 = v13;
          _os_log_debug_impl(&dword_1A460D000, v50, OS_LOG_TYPE_DEBUG, "<%{public}@ %p> performHTTPRequestForVerifyAccessTokenWithURL: %{public}@", buf, 0x20u);
        }
        uint64_t v28 = [MEMORY[0x1E4F29088] componentsWithString:v13];
        id v29 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
        SEL v30 = (void *)[v29 mutableCopy];

        [v30 removeCharactersInString:@"?=&+/"];
        uint64_t v31 = [v58 stringByAddingPercentEncodingWithAllowedCharacters:v30];
        id v32 = [NSString stringWithFormat:@"%@=%@&%@=%lu", @"access_token", v31, @"read_article_count", v26];
        [v28 setPercentEncodedQuery:v32];

        id v33 = (void *)MEMORY[0x1E4F18D50];
        id v34 = [v28 URL];
        id v35 = [v33 requestWithURL:v34];

        v77 = @"Accept";
        v78[0] = @"application/json";
        id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:&v77 count:1];
        [v35 setAllHTTPHeaderFields:v36];
        [v35 setHTTPMethod:@"GET"];
        uint64_t v37 = (void *)FCPurchaseLog;
        if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
        {
          id v38 = v37;
          uint64_t v39 = (objc_class *)objc_opt_class();
          id v40 = NSStringFromClass(v39);
          *(_DWORD *)long long buf = 138543874;
          *(void *)&uint8_t buf[4] = v40;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v24;
          *(_WORD *)&buf[22] = 2114;
          *(void *)v76 = v35;
          _os_log_impl(&dword_1A460D000, v38, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> performHTTPRequestForVerifyAccessTokenWithURL request: %{public}@", buf, 0x20u);
        }
        id v41 = *(id *)(v24 + 40);
        id v42 = [v41 value];
        *(void *)long long buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __114__FCPurchaseController_performHTTPRequestForVerifyAccessTokenWithURL_accessToken_consumedArticleCount_completion___block_invoke;
        *(void *)v76 = &unk_1E5B4E648;
        *(void *)&v76[8] = v24;
        *(void *)&v76[16] = v57;
        unint64_t v43 = [v42 dataTaskWithRequest:v35 completionHandler:buf];

        [v43 resume];
      }

      objc_destroyWeak(&v67);
      objc_destroyWeak(&location);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v53 = [NSString alloc];
        id v54 = [v59 identifier];
        uint64_t v55 = (void *)[v53 initWithFormat:@"Verification URL is nil for publisher : %@", v54];
        *(_DWORD *)long long buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[FCPurchaseController verifyAccessTokenWithTagID:accessToken:consumedArticleCount:serialCo"
                             "mpletion:callbackQueue:completion:]_block_invoke";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "FCPurchaseController.m";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)v76 = 1570;
        *(_WORD *)&v76[4] = 2114;
        *(void *)&v76[6] = v55;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
      long long v44 = (void *)FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
      {
        id v45 = v44;
        __int16 v46 = (objc_class *)objc_opt_class();
        id v47 = NSStringFromClass(v46);
        uint64_t v48 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138543618;
        *(void *)&uint8_t buf[4] = v47;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v48;
        _os_log_impl(&dword_1A460D000, v45, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> verifyAccessTokenWithTagID failed to get a verificationURL", buf, 0x16u);
      }
      uint64_t v49 = *(NSObject **)(a1 + 48);
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_250;
      v69[3] = &unk_1E5B4E128;
      id v70 = *(id *)(a1 + 64);
      id v71 = *(id *)(a1 + 72);
      dispatch_async(v49, v69);

      id v13 = 0;
    }
  }
}

uint64_t __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_236(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
    id v7 = @"error_message";
    v8[0] = @"CloudKit error while fetching channel information";
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    id v5 = [v3 errorWithDomain:@"FCTokenVerificationErrorDomain" code:5002 userInfo:v4];
    (*(void (**)(uint64_t, void, void, void *))(v2 + 16))(v2, 0, 0, v5);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_250(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
    id v7 = @"error_message";
    v8[0] = @"URL not found";
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    id v5 = [v3 errorWithDomain:@"FCTokenVerificationErrorDomain" code:5001 userInfo:v4];
    (*(void (**)(uint64_t, void, void, void *))(v2 + 16))(v2, 0, 0, v5);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_3;
  v9[3] = &unk_1E5B4E5D0;
  char v17 = a2;
  id v7 = *(void **)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v7;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 72);
  id v14 = *(id *)(a1 + 64);
  id v16 = *(id *)(a1 + 80);
  id v8 = v5;
  FCPerformIfNonNil(WeakRetained, v9);
}

void __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    BOOL v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v8 = *(unsigned __int8 *)(a1 + 96);
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138544130;
    char v22 = v7;
    __int16 v23 = 2048;
    uint64_t v24 = v9;
    __int16 v25 = 1024;
    int v26 = v8;
    __int16 v27 = 2114;
    uint64_t v28 = v10;
    _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> verifyAccessTokenWithTagID isSubscribed: %d verificationError: %{public}@", buf, 0x26u);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_251;
  v11[3] = &unk_1E5B4E5A8;
  id v12 = *(id *)(a1 + 40);
  id v13 = v3;
  id v14 = *(id *)(a1 + 48);
  char v20 = *(unsigned char *)(a1 + 96);
  id v15 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 64);
  id v18 = *(id *)(a1 + 80);
  id v17 = *(id *)(a1 + 72);
  id v19 = *(id *)(a1 + 88);
  FCPerformBlockOnMainThread(v11);
}

void __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_251(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(a1 + 48);
  if (!*(void *)(a1 + 32))
  {
    char v7 = *(unsigned char *)(a1 + 96);
    int v8 = *(void **)(a1 + 56);
    id v5 = v3;
    id v9 = v8;
    if (v2)
    {
      objc_initWeak(&location, (id)v2);
      id v10 = *(id *)(v2 + 32);
      id v11 = [v10 tagController];
      uint64_t v12 = MEMORY[0x1E4F14428];
      id v13 = MEMORY[0x1E4F14428];
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      __int16 v23 = __93__FCPurchaseController_handleAccessTokenVerificationSuccessWithTagID_subscribed_accessToken___block_invoke;
      uint64_t v24 = &unk_1E5B4E558;
      objc_copyWeak(&v27, &location);
      id v25 = v5;
      char v28 = v7;
      id v26 = v9;
      [v11 fetchTagForTagID:v25 qualityOfService:9 callbackQueue:v12 completionHandler:&block];

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }

    goto LABEL_8;
  }
  if (v2)
  {
    uint64_t v4 = [*(id *)(a1 + 40) purchaseLookUpEntryForTagID:v3];
    id v5 = v4;
    if (v4)
    {
      BOOL v6 = *(NSObject **)(v2 + 80);
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      __int16 v23 = __70__FCPurchaseController_handleAccessTokenVerificationFailureWithTagID___block_invoke;
      uint64_t v24 = &unk_1E5B4BE70;
      id v25 = v4;
      id v26 = (id)v2;
      dispatch_async(v6, &block);
    }
LABEL_8:
  }
  id v14 = *(NSObject **)(a1 + 64);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_2_252;
  v15[3] = &unk_1E5B4E580;
  id v18 = *(id *)(a1 + 80);
  char v20 = *(unsigned char *)(a1 + 96);
  id v16 = *(id *)(a1 + 72);
  id v17 = *(id *)(a1 + 32);
  id v19 = *(id *)(a1 + 88);
  dispatch_async(v14, v15);
}

uint64_t __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_2_252(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(uint64_t, void, void, void))(v2 + 16))(v2, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_254(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = (void *)MEMORY[0x1E4F28C58];
    char v7 = @"error_message";
    v8[0] = @"Device in offline";
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    id v5 = [v3 errorWithDomain:@"FCTokenVerificationErrorDomain" code:5000 userInfo:v4];
    (*(void (**)(uint64_t, void, void, void *))(v2 + 16))(v2, 0, 0, v5);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __114__FCPurchaseController_performHTTPRequestForVerifyAccessTokenWithURL_accessToken_consumedArticleCount_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  id v11 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    id v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    uint64_t v15 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138544130;
    v93 = v14;
    __int16 v94 = 2048;
    uint64_t v95 = v15;
    __int16 v96 = 2114;
    id v97 = v10;
    __int16 v98 = 2114;
    id v99 = v9;
    _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> performHTTPRequestForVerifyAccessTokenWithURL response: %{public}@ error: %{public}@", buf, 0x2Au);
  }
  if (!v9)
  {
    id v79 = 0;
    char v20 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v79];
    id v19 = v79;
    if (v19)
    {
      uint64_t v22 = (void *)FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_ERROR))
      {
        id v71 = v22;
        v72 = (objc_class *)objc_opt_class();
        id v73 = NSStringFromClass(v72);
        uint64_t v74 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138543874;
        v93 = v73;
        __int16 v94 = 2048;
        uint64_t v95 = v74;
        __int16 v96 = 2114;
        id v97 = v19;
        _os_log_error_impl(&dword_1A460D000, v71, OS_LOG_TYPE_ERROR, "<%{public}@ %p> performHTTPRequestForVerifyAccessTokenWithURL failed to parse with error: %{public}@", buf, 0x20u);
      }
      uint64_t v23 = *(void *)(a1 + 40);
      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = [v10 statusCode];
      long long v88 = @"error_message";
      long long v89 = @"JSON parsing error";
      id v26 = (void *)MEMORY[0x1E4F1C9E8];
      id v27 = &v89;
      char v28 = &v88;
LABEL_20:
      id v21 = [v26 dictionaryWithObjects:v27 forKeys:v28 count:1];
      id v42 = [v24 errorWithDomain:@"FCTokenVerificationErrorDomain" code:v25 userInfo:v21];
      (*(void (**)(uint64_t, void, id))(v23 + 16))(v23, 0, v42);
LABEL_21:

      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v37 = (void *)FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
      {
        id v38 = v37;
        uint64_t v39 = (objc_class *)objc_opt_class();
        id v40 = NSStringFromClass(v39);
        uint64_t v41 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138543618;
        v93 = v40;
        __int16 v94 = 2048;
        uint64_t v95 = v41;
        _os_log_impl(&dword_1A460D000, v38, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> performHTTPRequestForVerifyAccessTokenWithURL invalid JSON response format", buf, 0x16u);
      }
      uint64_t v23 = *(void *)(a1 + 40);
      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = [v10 statusCode];
      uint64_t v80 = @"error_message";
      v81 = @"Invalid JSON format found";
      id v26 = (void *)MEMORY[0x1E4F1C9E8];
      id v27 = &v81;
      char v28 = &v80;
      goto LABEL_20;
    }
    id v21 = v20;
    uint64_t v29 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      SEL v30 = v29;
      uint64_t v31 = (objc_class *)objc_opt_class();
      id v32 = NSStringFromClass(v31);
      uint64_t v33 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543874;
      v93 = v32;
      __int16 v94 = 2048;
      uint64_t v95 = v33;
      __int16 v96 = 2114;
      id v97 = v21;
      _os_log_impl(&dword_1A460D000, v30, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> performHTTPRequestForVerifyAccessTokenWithURL validResponseJSON: %{public}@", buf, 0x20u);
    }
    id v34 = [v21 objectForKey:@"status"];

    if (v34)
    {
      objc_opt_class();
      id v35 = [v21 objectForKey:@"status"];
      if (v35)
      {
        if (objc_opt_isKindOfClass()) {
          id v36 = v35;
        }
        else {
          id v36 = 0;
        }
      }
      else
      {
        id v36 = 0;
      }
      id v42 = v36;

      id v63 = (void *)FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
      {
        id v64 = v63;
        id v65 = (objc_class *)objc_opt_class();
        id v66 = NSStringFromClass(v65);
        uint64_t v67 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138543874;
        v93 = v66;
        __int16 v94 = 2048;
        uint64_t v95 = v67;
        __int16 v96 = 2114;
        id v97 = v42;
        _os_log_impl(&dword_1A460D000, v64, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> performHTTPRequestForVerifyAccessTokenWithURL status: %{public}@", buf, 0x20u);
      }
      if (![v42 caseInsensitiveCompare:@"subscribed"])
      {
        (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, 0);
        goto LABEL_21;
      }
      uint64_t v68 = [v42 caseInsensitiveCompare:@"not_subscribed"];
      uint64_t v69 = *(void *)(a1 + 40);
      if (!v68)
      {
        (*(void (**)(uint64_t, void, void))(v69 + 16))(v69, 0, 0);
        goto LABEL_21;
      }
      v75 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v70 = [v10 statusCode];
      long long v86 = @"error_message";
      long long v87 = @"Invalid response.Response structure did not meet agreement";
      id v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
      id v54 = [v75 errorWithDomain:@"FCTokenVerificationErrorDomain" code:v70 userInfo:v53];
      (*(void (**)(uint64_t, void, void *))(v69 + 16))(v69, 0, v54);
    }
    else
    {
      uint64_t v43 = [v21 objectForKey:@"error"];
      if (!v43
        || (long long v44 = (void *)v43,
            [v21 objectForKey:@"error"],
            id v45 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char log = objc_opt_isKindOfClass(),
            v45,
            v44,
            (log & 1) == 0))
      {
        uint64_t v55 = (void *)FCPurchaseLog;
        if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v56 = v55;
          uint64_t v57 = (objc_class *)objc_opt_class();
          id v58 = NSStringFromClass(v57);
          uint64_t v59 = *(void *)(a1 + 32);
          *(_DWORD *)long long buf = 138543618;
          v93 = v58;
          __int16 v94 = 2048;
          uint64_t v95 = v59;
          _os_log_impl(&dword_1A460D000, v56, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> performHTTPRequestForVerifyAccessTokenWithURL missing status and error", buf, 0x16u);
        }
        uint64_t v60 = *(void *)(a1 + 40);
        id v61 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v62 = [v10 statusCode];
        v82 = @"error_message";
        uint64_t v83 = @"Invalid response.Response structure did not meet agreement";
        id v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
        id v53 = [v61 errorWithDomain:@"FCTokenVerificationErrorDomain" code:v62 userInfo:v42];
        (*(void (**)(uint64_t, void, void *))(v60 + 16))(v60, 0, v53);
        goto LABEL_38;
      }
      __int16 v46 = (void *)FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
      {
        loga = v46;
        id v47 = (objc_class *)objc_opt_class();
        uint64_t v48 = NSStringFromClass(v47);
        uint64_t v49 = *(void *)(a1 + 32);
        uint64_t v50 = [v21 objectForKey:@"error"];
        *(_DWORD *)long long buf = 138543874;
        v93 = v48;
        __int16 v94 = 2048;
        uint64_t v95 = v49;
        __int16 v96 = 2114;
        id v97 = v50;
        _os_log_impl(&dword_1A460D000, loga, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> performHTTPRequestForVerifyAccessTokenWithURL error: %{public}@", buf, 0x20u);
      }
      uint64_t v51 = *(void *)(a1 + 40);
      os_log_t logb = (os_log_t)MEMORY[0x1E4F28C58];
      uint64_t v52 = [v10 statusCode];
      v84 = @"error_message";
      id v42 = [NSString stringWithFormat:@"%@", v21];
      id v85 = v42;
      id v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
      id v54 = [logb errorWithDomain:@"FCTokenVerificationErrorDomain" code:v52 userInfo:v53];
      (*(void (**)(uint64_t, void, void *))(v51 + 16))(v51, 0, v54);
    }

LABEL_38:
    goto LABEL_21;
  }
  uint64_t v16 = *(void *)(a1 + 40);
  id v17 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v18 = [v9 code];
  v90 = @"error_message";
  id v19 = [v9 localizedDescription];
  id v91 = v19;
  char v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
  id v21 = [v17 errorWithDomain:@"FCTokenVerificationErrorDomain" code:v18 userInfo:v20];
  (*(void (**)(uint64_t, void, id))(v16 + 16))(v16, 0, v21);
LABEL_22:
}

- (id)webAccessEntryForTagID:(void *)a1
{
  id v3 = a2;
  uint64_t v4 = [a1 webAccessEntriesByTagID];
  id v5 = [v4 objectForKey:v3];

  return v5;
}

- (void)submitWebAccessWithTagID:(id)a3 purchaseID:(id)a4 emailAddress:(id)a5 purchaseReceipt:(id)a6 serialCompletion:(id)a7 completion:(id)a8
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v33 = a5;
  id v16 = a6;
  id v34 = (void (**)(void))a7;
  id v35 = a8;
  if (self) {
    cloudContext = self->_cloudContext;
  }
  else {
    cloudContext = 0;
  }
  uint64_t v18 = [(FCCloudContext *)cloudContext networkReachability];
  int v19 = [v18 isNetworkReachable];

  if (v19)
  {
    objc_initWeak(&location, self);
    char v20 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v32 = [v20 objectForKey:*MEMORY[0x1E4F1C438]];

    id v21 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v31 = [v21 objectForKey:*MEMORY[0x1E4F1C400]];

    uint64_t v22 = [v16 dataUsingEncoding:4];
    SEL v30 = [v22 base64EncodedStringWithOptions:0];
    if (self) {
      uint64_t v23 = self->_cloudContext;
    }
    else {
      uint64_t v23 = 0;
    }
    uint64_t v24 = v23;
    uint64_t v25 = [(FCCloudContext *)v24 endpointConnection];
    id v26 = MEMORY[0x1E4F14428];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __117__FCPurchaseController_submitWebAccessWithTagID_purchaseID_emailAddress_purchaseReceipt_serialCompletion_completion___block_invoke;
    v36[3] = &unk_1E5B4E698;
    objc_copyWeak(&v43, &location);
    id v37 = v14;
    id v38 = v15;
    id v39 = v33;
    id v40 = v16;
    id v41 = v35;
    id v42 = v34;
    [v25 submitWebAccessWithTagID:v37 purchaseID:v38 emailAddress:v39 purchaseReceipt:v30 countryCode:v31 languageCode:v32 callbackQueue:MEMORY[0x1E4F14428] completion:v36];

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }
  else
  {
    if (v35)
    {
      id v27 = (void *)MEMORY[0x1E4F28C58];
      id v45 = @"error_message";
      v46[0] = @"Device in offline";
      char v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
      uint64_t v29 = [v27 errorWithDomain:@"FCWebAccessErrorDomain" code:5000 userInfo:v28];
      (*((void (**)(id, void, void *))v35 + 2))(v35, 0, v29);
    }
    if (v34) {
      v34[2]();
    }
  }
}

void __117__FCPurchaseController_submitWebAccessWithTagID_purchaseID_emailAddress_purchaseReceipt_serialCompletion_completion___block_invoke(id *a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 10);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __117__FCPurchaseController_submitWebAccessWithTagID_purchaseID_emailAddress_purchaseReceipt_serialCompletion_completion___block_invoke_2;
  v9[3] = &unk_1E5B4E670;
  char v17 = a2;
  id v10 = a1[4];
  id v11 = a1[5];
  id v12 = a1[6];
  id v13 = a1[7];
  id v7 = a1[8];
  id v14 = v5;
  id v15 = v7;
  id v16 = a1[9];
  id v8 = v5;
  FCPerformIfNonNil(WeakRetained, v9);
}

void __117__FCPurchaseController_submitWebAccessWithTagID_purchaseID_emailAddress_purchaseReceipt_serialCompletion_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v36 = v3;
  if (!*(unsigned char *)(a1 + 88))
  {
    id v9 = *(void **)(a1 + 40);
    id v10 = *(void **)(a1 + 48);
    id v11 = *(void **)(a1 + 56);
    id v5 = v4;
    id v8 = v9;
    id v12 = v10;
    id v13 = v11;
    if (v36)
    {
      uint64_t v14 = -[FCPurchaseController webAccessEntryForTagID:](v36, v5);
      if (v14)
      {
        id v15 = (void *)v14;
        id v16 = [v36 webAccessEntriesByTagID];
        [v16 removeObjectForKey:v15[6]];

        uint64_t v17 = v15[5];
        uint64_t v18 = v36[6];
        [v18 removeObjectForKey:v17];
      }
      else
      {
        int v19 = [FCWebAccessEntry alloc];
        char v20 = [NSString stringWithFormat:@"%@%@", @"wa-", v5];
        id v21 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v22 = -[FCWebAccessEntry initWithEntryID:tagID:purchaseID:lastRetryAttemptTime:email:purchaseReceipt:](v19, v20, v5, v8, v21, v12, v13);

        uint64_t v18 = v22;
        uint64_t v23 = [v36 webAccessEntriesByTagID];
        uint64_t v24 = v23;
        if (v18) {
          uint64_t v25 = v18[6];
        }
        else {
          uint64_t v25 = 0;
        }
        [v23 setObject:v18 forKey:v25];

        id v26 = v36[6];
        if (v18)
        {
          id v27 = [MEMORY[0x1E4F1CA60] dictionary];
          objc_msgSend(v27, "fc_safelySetObjectAllowingNil:forKey:", v18[6], @"WebAccessEntryTagID");
          char v28 = [v18 purchaseID];
          objc_msgSend(v27, "fc_safelySetObjectAllowingNil:forKey:", v28, @"WebAccessEntryPurchaseID");

          uint64_t v29 = [v18 lastRetryAttemptTime];
          objc_msgSend(v27, "fc_safelySetObjectAllowingNil:forKey:", v29, @"WebAccessEntryLastRetryAttemptTime");

          SEL v30 = [v18 email];
          objc_msgSend(v27, "fc_safelySetObjectAllowingNil:forKey:", v30, @"WebAccessEntryEmail");

          uint64_t v31 = [v18 purchaseReceipt];
          objc_msgSend(v27, "fc_safelySetObjectAllowingNil:forKey:", v31, @"WebAccessEntryPurchaseReceipt");

          id v32 = (void *)[v27 copy];
          uint64_t v33 = v18[5];
        }
        else
        {
          id v32 = 0;
          uint64_t v33 = 0;
        }
        [v26 setObject:v32 forKey:v33];

        id v15 = v18;
      }
    }
    goto LABEL_15;
  }
  if (!v3) {
    goto LABEL_17;
  }
  id v5 = -[FCPurchaseController webAccessEntryForTagID:](v3, v4);
  if (v5)
  {
    BOOL v6 = [v36 webAccessEntriesByTagID];
    [v6 removeObjectForKey:v5[6]];

    uint64_t v7 = v5[5];
    id v8 = v36[6];
    [v8 removeObjectForKey:v7];
LABEL_15:
  }
LABEL_17:
  uint64_t v34 = *(void *)(a1 + 72);
  if (v34) {
    (*(void (**)(uint64_t, void, void))(v34 + 16))(v34, *(unsigned __int8 *)(a1 + 88), *(void *)(a1 + 64));
  }
  uint64_t v35 = *(void *)(a1 + 80);
  if (v35) {
    (*(void (**)(uint64_t, void *))(v35 + 16))(v35, v4);
  }
}

- (NSSet)purchasesDiscoveredTagIDs
{
  return self->_purchasesDiscoveredTagIDs;
}

- (NSMutableDictionary)webAccessEntriesByTagID
{
  return self->_webAccessEntriesByTagID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlementService, 0);
  objc_storeStrong((id *)&self->_entitlementQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_lastEntitlementCheckTime, 0);
  objc_storeStrong((id *)&self->_readOnlyPurchaseLookUpEntriesByTagID, 0);
  objc_storeStrong((id *)&self->_purchaseLookupEntriesManager, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_entitlementsOverrideProvider, 0);
  objc_storeStrong((id *)&self->_webAccessEntriesByTagID, 0);
  objc_storeStrong((id *)&self->_purchasesDiscoveredTagIDs, 0);
}

@end