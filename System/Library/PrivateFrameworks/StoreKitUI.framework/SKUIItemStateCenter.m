@interface SKUIItemStateCenter
+ (id)defaultCenter;
- (ASDSoftwareUpdatesStore)appstoredUpdatesStore;
- (BOOL)_gratisStateIsValid;
- (BOOL)_isPurchaseForOffDeviceContent:(id)a3;
- (BOOL)isApplicationInstallRestricted;
- (BOOL)isGratisEligible;
- (BOOL)isItemRestrictedWithParentalControlsRank:(int64_t)a3;
- (BOOL)isRunningInStoreDemoMode;
- (SKUIItemStateCenter)init;
- (SSSoftwareUpdatesStore)appUpdatesStore;
- (id)_addState:(unint64_t)a3 forItemIdentifier:(id)a4;
- (id)_appstoredUpdatesStore;
- (id)_copyItemsStatesForLibraryItems:(id)a3;
- (id)_downloadPhaseForJobPhase:(int64_t)a3;
- (id)_jobManager;
- (id)_newPurchaseWithItem:(id)a3 offer:(id)a4;
- (id)_newPurchasesForSoftwareWithBundleItem:(id)a3 bundleOffer:(id)a4;
- (id)_newPurchasesWithBundleItem:(id)a3 bundleOffer:(id)a4;
- (id)_newPurchasesWithItems:(id)a3;
- (id)_newSoftwarePurchaseWithItem:(id)a3 offer:(id)a4;
- (id)_purchaseHistoryDatabase;
- (id)_removeState:(unint64_t)a3 forItemIdentifier:(id)a4;
- (id)_setStateFlag:(unint64_t)a3 forItemsWithIdentifiers:(id)a4 sendNotification:(BOOL)a5;
- (id)_setStateFlag:(unint64_t)a3 forOnlyItemsWithIdentifiers:(id)a4 sendNotification:(BOOL)a5;
- (id)gratisEligibleItemIdentifiers;
- (id)metricsActionTypeForItem:(id)a3;
- (id)performActionForItem:(id)a3 clientContext:(id)a4;
- (id)performActionForItem:(id)a3 clientContext:(id)a4 completionBlock:(id)a5;
- (id)performActionForItem:(id)a3 offer:(id)a4 clientContext:(id)a5 completionBlock:(id)a6;
- (id)performActionForItem:(id)a3 withCompletionBlock:(id)a4;
- (id)performActionForSoftwareItem:(id)a3 offer:(id)a4 clientContext:(id)a5 completionBlock:(id)a6;
- (id)stateForItemWithIdentifier:(int64_t)a3;
- (id)stateForItemWithStoreIdentifier:(id)a3;
- (int64_t)parentalControlsRank;
- (void)_enumerateAvailableItemsForLibraryItems:(id)a3 usingBlock:(id)a4;
- (void)_fireFinishLoadBlocksIfNecessary;
- (void)_mediaLibraryDidChangeNotification:(id)a3;
- (void)_notifyObserversOfMediaLibraryChange;
- (void)_notifyObserversOfPurchasesResponses:(id)a3;
- (void)_notifyObserversOfRestrictionsChange;
- (void)_notifyObserversOfSoftwarePurchasesResponses:(id)a3;
- (void)_notifyObserversOfStateChange:(id)a3;
- (void)_notifyObserversOfStateChanges:(id)a3;
- (void)_performPurchases:(id)a3 hasBundlePurchase:(BOOL)a4 withClientContext:(id)a5 completionBlock:(id)a6;
- (void)_performSoftwarePurchases:(id)a3 withClientContext:(id)a4 completionBlock:(id)a5;
- (void)_reloadAppUpdatesStore;
- (void)_reloadDownloadManager;
- (void)_reloadJobManager;
- (void)_reloadMediaLibraryStateForItems:(id)a3;
- (void)_reloadPurchaseHistory;
- (void)_reloadSoftwareLibrary;
- (void)_reloadStateForObservedMediaLibraryItems;
- (void)_removePurchasingItemsForPurchases:(id)a3;
- (void)_replacePurchasingItem:(id)a3 withDownloadIDs:(id)a4;
- (void)_restrictionsChangedNotification:(id)a3;
- (void)_setAvailableAppstoredUpdatesWithUpdates:(id)a3 decrementLoadCount:(BOOL)a4;
- (void)_setDownloads:(id)a3;
- (void)_setFirstPartyRemovableItemsIdentifiers:(id)a3;
- (void)_setGratisIdentifiers:(id)a3 error:(id)a4;
- (void)_setInstalledItems:(id)a3;
- (void)_setJobs:(id)a3;
- (void)_setPurchaseHistoryItemsWithIdentifiers:(id)a3;
- (void)_setPurchaseHistoryVPPItemsWithIdentifiers:(id)a3;
- (void)_storefrontDidChangeNotification:(id)a3;
- (void)_updatesSoftwarePurchasingItemsForPurchases:(id)a3 purchaseWasSuccessful:(BOOL)a4;
- (void)addDownloads:(id)a3;
- (void)addManifestDownloadWithURL:(id)a3 placeholderMetadata:(id)a4;
- (void)addMediaLibrary:(id)a3;
- (void)addObserver:(id)a3;
- (void)addRelationshipForParentAdamId:(id)a3 withChildAdamIds:(id)a4;
- (void)beginObservingLibraryItems:(id)a3;
- (void)cancelDownloadForItemWithIdentifier:(int64_t)a3;
- (void)dealloc;
- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4;
- (void)downloadQueue:(id)a3 downloadStates:(id)a4 didCompleteWithError:(id)a5;
- (void)downloadQueue:(id)a3 downloadStatesDidChange:(id)a4;
- (void)endObservingLibraryItems:(id)a3;
- (void)evaluatePurchaseResponseForRentals:(id)a3;
- (void)findLibraryItemsForContentIdentifiers:(id)a3 options:(id)a4 completionBlock:(id)a5;
- (void)finishLoadingWithCompletionBlock:(id)a3;
- (void)getSoftwareUpdatesWithCompletionBlock:(id)a3;
- (void)init;
- (void)jobManager:(id)a3 completedJobs:(id)a4;
- (void)jobManager:(id)a3 updatedProgressOfJobs:(id)a4;
- (void)jobManager:(id)a3 updatedStateOfJobs:(id)a4;
- (void)performActionForLibraryItem:(id)a3;
- (void)purchaseItem:(id)a3 offer:(id)a4 clientContext:(id)a5 completionBlock:(id)a6;
- (void)purchaseItems:(id)a3 withClientContext:(id)a4 completionBlock:(id)a5;
- (void)purchaseItems:(id)a3 withCompletionBlock:(id)a4;
- (void)purchaseSoftwareItem:(id)a3 offer:(id)a4 clientContext:(id)a5 completionBlock:(id)a6;
- (void)purchaseTone:(id)a3 withProperties:(id)a4 clientContext:(id)a5 completionBlock:(id)a6;
- (void)reloadFromServer;
- (void)reloadGratisEligibilityWithBundleIdentifiers:(id)a3 clientContext:(id)a4;
- (void)reloadMediaLibrary:(id)a3;
- (void)reloadSoftwareUpdatesFromServerWithCompletionBlock:(id)a3;
- (void)removeMediaLibrary:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeRelationshipsForParentAdamId:(id)a3;
@end

@implementation SKUIItemStateCenter

- (SKUIItemStateCenter)init
{
  v35[1] = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIItemStateCenter init]();
  }
  v33.receiver = self;
  v33.super_class = (Class)SKUIItemStateCenter;
  id v3 = [(SKUIItemStateCenter *)&v33 init];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.StoreKitUI.SKUIItemStateCenter.access", 0);
    v5 = (void *)*((void *)v3 + 1);
    *((void *)v3 + 1) = v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.StoreKitUI.SKUIItemStateCenter.observers", 0);
    v7 = (void *)*((void *)v3 + 15);
    *((void *)v3 + 15) = v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.StoreKitUI.SKUIItemStateCenter.mediaLibrary", 0);
    v9 = (void *)*((void *)v3 + 12);
    *((void *)v3 + 12) = v8;

    v10 = *((void *)v3 + 12);
    v11 = dispatch_get_global_queue(0, 0);
    dispatch_set_target_queue(v10, v11);

    v12 = objc_alloc_init(SKUIMediaLibraryInterface);
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v14 = (void *)*((void *)v3 + 13);
    *((void *)v3 + 13) = v13;

    [*((id *)v3 + 13) addObject:v12];
    *((unsigned char *)v3 + 16) = -1;
    *((_WORD *)v3 + 20) = -1;
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v16 = (void *)*((void *)v3 + 11);
    *((void *)v3 + 11) = v15;

    *((void *)v3 + 17) = -1;
    *((unsigned char *)v3 + 160) = -1;
    v17 = objc_alloc_init(SKUIStoreItemRelationshipCounsellor);
    v18 = (void *)*((void *)v3 + 19);
    *((void *)v3 + 19) = v17;

    id v19 = objc_alloc_init(MEMORY[0x1E4FA8178]);
    v20 = [MEMORY[0x1E4FA8170] allStoreDownloadKinds];
    [v19 setDownloadKinds:v20];

    v35[0] = *MEMORY[0x1E4FA8460];
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    [v19 setPrefetchedDownloadExternalProperties:v21];

    uint64_t v22 = *MEMORY[0x1E4FA8588];
    v34[0] = *MEMORY[0x1E4FA8630];
    v34[1] = v22;
    uint64_t v23 = *MEMORY[0x1E4FA85C8];
    v34[2] = *MEMORY[0x1E4FA85B0];
    v34[3] = v23;
    v34[4] = *MEMORY[0x1E4FA85D8];
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:5];
    [v19 setPrefetchedDownloadProperties:v24];

    uint64_t v25 = [objc_alloc(MEMORY[0x1E4FA8170]) initWithManagerOptions:v19];
    v26 = (void *)*((void *)v3 + 6);
    *((void *)v3 + 6) = v25;

    [*((id *)v3 + 6) addObserver:v3];
    uint64_t v27 = [v3 _jobManager];
    v28 = (void *)*((void *)v3 + 4);
    *((void *)v3 + 4) = v27;

    v29 = [MEMORY[0x1E4F50BF8] sharedInstance];
    [v29 addObserver:v3];

    [v3 _reloadAppUpdatesStore];
    [v3 _reloadDownloadManager];
    [v3 _reloadJobManager];
    [v3 _reloadPurchaseHistory];
    [v3 _reloadSoftwareLibrary];
    v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v30 addObserver:v3 selector:sel__restrictionsChangedNotification_ name:*MEMORY[0x1E4F73EC0] object:0];
    [v30 addObserver:v3 selector:sel__storefrontDidChangeNotification_ name:*MEMORY[0x1E4FA83B8] object:0];
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(DistributedCenter, v3, (CFNotificationCallback)__SoftwareLibraryChangeNotification, @"com.apple.LaunchServices.applicationRegistered", 0, CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(DistributedCenter, v3, (CFNotificationCallback)__SoftwareLibraryChangeNotification, @"com.apple.LaunchServices.applicationUnregistered", 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  return (SKUIItemStateCenter *)v3;
}

- (id)_jobManager
{
  jobManager = self->_jobManager;
  if (!jobManager)
  {
    dispatch_queue_t v4 = objc_opt_new();
    [v4 setShouldFilterExternalOriginatedDownloads:0];
    [v4 setShouldReportDownloadProgress:1];
    v5 = (ASDJobManager *)[objc_alloc(MEMORY[0x1E4F4BC40]) initWithOptions:v4];
    dispatch_queue_t v6 = self->_jobManager;
    self->_jobManager = v5;

    [(ASDJobManager *)self->_jobManager addJobObserver:self];
    jobManager = self->_jobManager;
  }

  return jobManager;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F73EC0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FA83B8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4F4BBA8] object:0];
  dispatch_queue_t v4 = (void *)SKUIMediaPlayerFramework();
  id v5 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaLibraryDidChangeNotification", v4);
  [v3 removeObserver:self name:v5 object:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4FA83C0], 0);
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterRemoveObserver(DistributedCenter, self, @"com.apple.LaunchServices.applicationRegistered", 0);
  CFNotificationCenterRemoveObserver(DistributedCenter, self, @"com.apple.LaunchServices.applicationUnregistered", 0);
  [(SSDownloadManager *)self->_downloadManager removeObserver:self];

  v8.receiver = self;
  v8.super_class = (Class)SKUIItemStateCenter;
  [(SKUIItemStateCenter *)&v8 dealloc];
}

+ (id)defaultCenter
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SKUIItemStateCenter_defaultCenter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultCenter_sOnce != -1) {
    dispatch_once(&defaultCenter_sOnce, block);
  }
  v2 = (void *)defaultCenter_sCenter;

  return v2;
}

uint64_t __36__SKUIItemStateCenter_defaultCenter__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = defaultCenter_sCenter;
  defaultCenter_sCenter = (uint64_t)v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

- (void)addMediaLibrary:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__SKUIItemStateCenter_addMediaLibrary___block_invoke;
  v7[3] = &unk_1E6421FF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

uint64_t __39__SKUIItemStateCenter_addMediaLibrary___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) addObject:*(void *)(a1 + 40)];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__SKUIItemStateCenter_addObserver___block_invoke;
  v7[3] = &unk_1E6421FF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

uint64_t __35__SKUIItemStateCenter_addObserver___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 128);
  if (!v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:0];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 128);
    *(void *)(v4 + 128) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 128);
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v2 addObject:v6];
}

- (void)cancelDownloadForItemWithIdentifier:(int64_t)a3
{
  id v5 = [SKUIStoreIdentifier alloc];
  uint64_t v6 = [NSNumber numberWithLongLong:a3];
  v7 = [(SKUIStoreIdentifier *)v5 initWithNumber:v6];

  id v8 = [(NSMutableDictionary *)self->_itemStates objectForKey:v7];
  if ([v8 mediaCategory] == 1)
  {
    objc_initWeak(&location, self->_jobManager);
    objc_initWeak(&from, self);
    jobManager = self->_jobManager;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__SKUIItemStateCenter_cancelDownloadForItemWithIdentifier___block_invoke;
    v17[3] = &unk_1E64237D0;
    v20[1] = (id)a3;
    objc_copyWeak(&v19, &location);
    objc_copyWeak(v20, &from);
    v17[4] = self;
    id v18 = v8;
    [(ASDJobManager *)jobManager getJobsUsingBlock:v17];

    objc_destroyWeak(v20);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_initWeak(&location, self->_downloadManager);
    downloadManager = self->_downloadManager;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__SKUIItemStateCenter_cancelDownloadForItemWithIdentifier___block_invoke_45;
    v14[3] = &unk_1E64237F8;
    v16[1] = (id)a3;
    id v15 = v8;
    objc_copyWeak(v16, &location);
    [(SSDownloadManager *)downloadManager getDownloadsUsingBlock:v14];
    objc_destroyWeak(v16);

    objc_destroyWeak(&location);
    accessQueue = self->_accessQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__SKUIItemStateCenter_cancelDownloadForItemWithIdentifier___block_invoke_2_46;
    v12[3] = &unk_1E6421FF8;
    v12[4] = self;
    id v13 = v7;
    dispatch_async(accessQueue, v12);
  }
}

void __59__SKUIItemStateCenter_cancelDownloadForItemWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v8 storeItemID] == *(void *)(a1 + 64))
        {
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
          v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v8, "persistentID"));
          v24 = v14;
          id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
          [WeakRetained cancelJobsWithIDs:v15 completionBlock:&__block_literal_global_0];

          id v9 = v3;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v9 = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  id v16[2] = __59__SKUIItemStateCenter_cancelDownloadForItemWithIdentifier___block_invoke_3;
  v16[3] = &unk_1E64237A8;
  uint64_t v12 = *(void *)(a1 + 64);
  v16[4] = v10;
  uint64_t v19 = v12;
  id v17 = *(id *)(a1 + 40);
  id v18 = v9;
  dispatch_async(v11, v16);

LABEL_11:
}

void __59__SKUIItemStateCenter_cancelDownloadForItemWithIdentifier___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4FA81D8] sharedConfig];
  int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  uint64_t v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_9;
  }
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = *(void *)(a1 + 56);
  *(_DWORD *)uint64_t v12 = 138412546;
  *(void *)&v12[4] = v6;
  *(_WORD *)&v12[12] = 2048;
  *(void *)&v12[14] = v7;
  id v8 = v6;
  LODWORD(v11) = 22;
  id v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, v12, v11, *(_OWORD *)v12, *(void *)&v12[16]);
    free(v9);
    SSFileLog();
LABEL_9:
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  objc_msgSend(*(id *)(a1 + 40), "setState:", objc_msgSend(*(id *)(a1 + 40), "state") & 0xFFFFFFFFFFFFFFFCLL);
  [v10 addObject:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 48) && [v10 count]) {
    [*(id *)(a1 + 48) _notifyObserversOfStateChanges:v10];
  }
}

void __59__SKUIItemStateCenter_cancelDownloadForItemWithIdentifier___block_invoke_45(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    uint64_t v6 = *MEMORY[0x1E4FA8630];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v9 = [v8 valueForProperty:v6];
        uint64_t v10 = [v9 longLongValue];
        uint64_t v11 = *(void *)(a1 + 48);

        if (v10 != v11)
        {
          uint64_t v12 = [*(id *)(a1 + 32) downloadIdentifiers];
          uint64_t v13 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v8, "persistentIdentifier"));
          int v14 = [v12 containsObject:v13];

          if (!v14) {
            continue;
          }
        }
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        long long v22 = v8;
        v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
        [WeakRetained cancelDownloads:v16 completionBlock:0];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }
}

void __59__SKUIItemStateCenter_cancelDownloadForItemWithIdentifier___block_invoke_2_46(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 104) copy];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 152) familyForItem:*(void *)(a1 + 40)];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = SKUILibraryItemForStoreIdentifier(*(void **)(*((void *)&v15 + 1) + 8 * v9));
        [v4 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    uint64_t v11 = *(NSObject **)(*(void *)(a1 + 32) + 96);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__SKUIItemStateCenter_cancelDownloadForItemWithIdentifier___block_invoke_3_47;
    v12[3] = &unk_1E6421FF8;
    id v13 = v2;
    id v14 = v4;
    dispatch_async(v11, v12);
  }
}

void __59__SKUIItemStateCenter_cancelDownloadForItemWithIdentifier___block_invoke_3_47(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "removeMediaItemsForLibraryItems:", *(void *)(a1 + 40), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)finishLoadingWithCompletionBlock:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SKUIItemStateCenter_finishLoadingWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E6423820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __56__SKUIItemStateCenter_finishLoadingWithCompletionBlock___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 56))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 56);
    *(void *)(v3 + 56) = v2;
  }
  id v7 = (id)[*(id *)(a1 + 40) copy];
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 56);
  id v6 = _Block_copy(v7);
  [v5 addObject:v6];

  [*(id *)(a1 + 32) _fireFinishLoadBlocksIfNecessary];
}

- (BOOL)isApplicationInstallRestricted
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__SKUIItemStateCenter_isApplicationInstallRestricted__block_invoke;
  v5[3] = &unk_1E6423848;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __53__SKUIItemStateCenter_isApplicationInstallRestricted__block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 16);
  if (v2 == 255)
  {
    char v3 = [MEMORY[0x1E4F74230] sharedConnection];
    char v4 = [v3 isOnDeviceAppInstallationAllowed];

    *(unsigned char *)(*(void *)(a1 + 32) + 16) = v4 ^ 1;
    int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 16);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

- (BOOL)isGratisEligible
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__SKUIItemStateCenter_isGratisEligible__block_invoke;
  v5[3] = &unk_1E6423848;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__SKUIItemStateCenter_isGratisEligible__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(*(void *)(a1 + 32) + 88);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__SKUIItemStateCenter_isGratisEligible__block_invoke_2;
  v3[3] = &unk_1E6423870;
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __39__SKUIItemStateCenter_isGratisEligible__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 state];
  if ((result & 0x10) != 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)isItemRestrictedWithParentalControlsRank:(int64_t)a3
{
  return [(SKUIItemStateCenter *)self isRunningInStoreDemoMode]
      || [(SKUIItemStateCenter *)self isApplicationInstallRestricted]
      || [(SKUIItemStateCenter *)self parentalControlsRank] < a3;
}

- (BOOL)isRunningInStoreDemoMode
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__SKUIItemStateCenter_isRunningInStoreDemoMode__block_invoke;
  v5[3] = &unk_1E6423848;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__SKUIItemStateCenter_isRunningInStoreDemoMode__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  int v2 = *(unsigned __int8 *)(*(void *)(result + 32) + 160);
  if (v2 == 255)
  {
    uint64_t result = [MEMORY[0x1E4FB1438] isRunningInStoreDemoMode];
    *(unsigned char *)(*(void *)(v1 + 32) + 160) = result;
    int v2 = *(unsigned __int8 *)(*(void *)(v1 + 32) + 160);
  }
  *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = v2 != 0;
  return result;
}

- (id)metricsActionTypeForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[SKUIItemStateCenter stateForItemWithIdentifier:](self, "stateForItemWithIdentifier:", [v4 itemIdentifier]);
  char v6 = [v5 state];
  if ((v6 & 2) != 0)
  {
    char v9 = (id *)MEMORY[0x1E4FA8850];
LABEL_6:
    id v8 = *v9;
    goto LABEL_13;
  }
  if ((v6 & 0x24) == 4)
  {
    id v7 = [v4 bundleIdentifier];
    if (v7) {
      id v8 = (id)*MEMORY[0x1E4FA8860];
    }
    else {
      id v8 = 0;
    }

    goto LABEL_13;
  }
  if ((v6 & 1) == 0)
  {
    if ((v6 & 8) != 0) {
      char v9 = (id *)MEMORY[0x1E4FA8858];
    }
    else {
      char v9 = (id *)MEMORY[0x1E4FA8848];
    }
    goto LABEL_6;
  }
  id v8 = 0;
LABEL_13:

  return v8;
}

- (int64_t)parentalControlsRank
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 1000;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__SKUIItemStateCenter_parentalControlsRank__block_invoke;
  v5[3] = &unk_1E6423848;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __43__SKUIItemStateCenter_parentalControlsRank__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 136);
  if (v2 == -1)
  {
    int64_t v3 = [MEMORY[0x1E4F74230] sharedConnection];
    id v4 = [v3 effectiveValueForSetting:*MEMORY[0x1E4F740B0]];

    if (v4) {
      uint64_t v5 = [v4 integerValue];
    }
    else {
      uint64_t v5 = 1000;
    }
    *(void *)(*(void *)(a1 + 32) + 136) = v5;

    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 136);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
}

- (id)performActionForItem:(id)a3 withCompletionBlock:(id)a4
{
  return [(SKUIItemStateCenter *)self performActionForItem:a3 clientContext:0 completionBlock:a4];
}

- (id)performActionForItem:(id)a3 clientContext:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  long long v11 = [v10 primaryItemOffer];
  uint64_t v12 = [(SKUIItemStateCenter *)self performActionForItem:v10 offer:v11 clientContext:v9 completionBlock:v8];

  return v12;
}

- (id)performActionForItem:(id)a3 clientContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = SKUIItemStateCenterUseAppstoredPurchases(v7);
  id v9 = [v7 primaryItemOffer];
  if (v8) {
    [(SKUIItemStateCenter *)self performActionForSoftwareItem:v7 offer:v9 clientContext:v6 completionBlock:0];
  }
  else {
  id v10 = [(SKUIItemStateCenter *)self performActionForItem:v7 offer:v9 clientContext:v6 completionBlock:0];
  }

  return v10;
}

- (id)performActionForItem:(id)a3 offer:(id)a4 clientContext:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(SKUIItemStateCenter *)self metricsActionTypeForItem:v10];
  if (([v14 isEqualToString:*MEMORY[0x1E4FA8848]] & 1) != 0
    || [v14 isEqualToString:*MEMORY[0x1E4FA8858]])
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __80__SKUIItemStateCenter_performActionForItem_offer_clientContext_completionBlock___block_invoke;
    v22[3] = &unk_1E6423898;
    long long v15 = &v23;
    id v23 = v13;
    [(SKUIItemStateCenter *)self purchaseItem:v10 offer:v11 clientContext:v12 completionBlock:v22];
    long long v16 = -[SKUIItemStateCenter stateForItemWithIdentifier:](self, "stateForItemWithIdentifier:", [v10 itemIdentifier]);
LABEL_4:

    goto LABEL_5;
  }
  if ([v14 isEqualToString:*MEMORY[0x1E4FA8860]])
  {
    long long v18 = [v10 bundleIdentifier];
    SKUIMetricsLaunchApplicationWithIdentifier((uint64_t)v18, 0);
    CFRelease(v18);
  }
  else if ([v14 isEqualToString:*MEMORY[0x1E4FA8850]])
  {
    -[SKUIItemStateCenter cancelDownloadForItemWithIdentifier:](self, "cancelDownloadForItemWithIdentifier:", [v10 itemIdentifier]);
  }
  if (v13)
  {
    observerQueue = self->_observerQueue;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    id v20[2] = __80__SKUIItemStateCenter_performActionForItem_offer_clientContext_completionBlock___block_invoke_2;
    v20[3] = &unk_1E64238C0;
    long long v15 = &v21;
    id v21 = v13;
    dispatch_async(observerQueue, v20);
    long long v16 = 0;
    goto LABEL_4;
  }
  long long v16 = 0;
LABEL_5:

  return v16;
}

uint64_t __80__SKUIItemStateCenter_performActionForItem_offer_clientContext_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __80__SKUIItemStateCenter_performActionForItem_offer_clientContext_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)performActionForSoftwareItem:(id)a3 offer:(id)a4 clientContext:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(SKUIItemStateCenter *)self metricsActionTypeForItem:v10];
  if (([v14 isEqualToString:*MEMORY[0x1E4FA8848]] & 1) != 0
    || [v14 isEqualToString:*MEMORY[0x1E4FA8858]])
  {
    if (SKUIItemStateCenterUseAppstoredPurchases(v10))
    {
      long long v15 = v24;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      long long v16 = __88__SKUIItemStateCenter_performActionForSoftwareItem_offer_clientContext_completionBlock___block_invoke;
    }
    else
    {
      long long v15 = v23;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      long long v16 = __88__SKUIItemStateCenter_performActionForSoftwareItem_offer_clientContext_completionBlock___block_invoke_2;
    }
    v15[2] = v16;
    v15[3] = &unk_1E64238E8;
    v15[4] = v13;
    [(SKUIItemStateCenter *)self purchaseSoftwareItem:v10 offer:v11 clientContext:v12 completionBlock:v15];

    long long v17 = -[SKUIItemStateCenter stateForItemWithIdentifier:](self, "stateForItemWithIdentifier:", [v10 itemIdentifier]);
  }
  else
  {
    if ([v14 isEqualToString:*MEMORY[0x1E4FA8860]])
    {
      long long v18 = [v10 bundleIdentifier];
      SKUIMetricsLaunchApplicationWithIdentifier((uint64_t)v18, 0);
      CFRelease(v18);
    }
    else if ([v14 isEqualToString:*MEMORY[0x1E4FA8850]])
    {
      -[SKUIItemStateCenter cancelDownloadForItemWithIdentifier:](self, "cancelDownloadForItemWithIdentifier:", [v10 itemIdentifier]);
    }
    if (v13)
    {
      observerQueue = self->_observerQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __88__SKUIItemStateCenter_performActionForSoftwareItem_offer_clientContext_completionBlock___block_invoke_3;
      block[3] = &unk_1E64238C0;
      id v22 = v13;
      dispatch_async(observerQueue, block);
    }
    long long v17 = 0;
  }

  return v17;
}

uint64_t __88__SKUIItemStateCenter_performActionForSoftwareItem_offer_clientContext_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __88__SKUIItemStateCenter_performActionForSoftwareItem_offer_clientContext_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __88__SKUIItemStateCenter_performActionForSoftwareItem_offer_clientContext_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)purchaseItem:(id)a3 offer:(id)a4 clientContext:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__SKUIItemStateCenter_purchaseItem_offer_clientContext_completionBlock___block_invoke;
  block[3] = &unk_1E6423938;
  id v20 = v10;
  id v21 = self;
  id v23 = v12;
  id v24 = v13;
  id v22 = v11;
  id v15 = v12;
  id v16 = v13;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(accessQueue, block);
}

void __72__SKUIItemStateCenter_purchaseItem_offer_clientContext_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) itemKind];
  uint64_t v4 = *(void *)(a1 + 32);
  int64_t v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  if (v2 == 17)
  {
    id v6 = (void *)[v3 _newPurchasesWithBundleItem:v4 bundleOffer:v5];
  }
  else
  {
    id v7 = (void *)[v3 _newPurchaseWithItem:v4 offer:v5];
    if (v7) {
      id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v7, 0);
    }
    else {
      id v6 = 0;
    }
  }
  if ([v6 count])
  {
    BOOL v8 = *(void **)(a1 + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__SKUIItemStateCenter_purchaseItem_offer_clientContext_completionBlock___block_invoke_3;
    v13[3] = &unk_1E6423910;
    id v9 = &v14;
    uint64_t v10 = *(void *)(a1 + 56);
    id v14 = *(id *)(a1 + 64);
    [v8 _performPurchases:v6 hasBundlePurchase:v2 == 17 withClientContext:v10 completionBlock:v13];
LABEL_11:

    goto LABEL_12;
  }
  id v11 = *(void **)(a1 + 64);
  if (v11)
  {
    id v12 = *(NSObject **)(*(void *)(a1 + 40) + 120);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__SKUIItemStateCenter_purchaseItem_offer_clientContext_completionBlock___block_invoke_2;
    block[3] = &unk_1E64238C0;
    id v9 = &v16;
    id v16 = v11;
    dispatch_async(v12, block);
    goto LABEL_11;
  }
LABEL_12:
}

uint64_t __72__SKUIItemStateCenter_purchaseItem_offer_clientContext_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__SKUIItemStateCenter_purchaseItem_offer_clientContext_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    id v5 = v3;
    if ([v3 count] == 1)
    {
      uint64_t v4 = [v5 objectAtIndex:0];
    }
    else
    {
      uint64_t v4 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

    id v3 = v5;
  }
}

- (void)purchaseSoftwareItem:(id)a3 offer:(id)a4 clientContext:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__SKUIItemStateCenter_purchaseSoftwareItem_offer_clientContext_completionBlock___block_invoke;
  block[3] = &unk_1E6423938;
  id v20 = v10;
  id v21 = self;
  id v23 = v12;
  id v24 = v13;
  id v22 = v11;
  id v15 = v12;
  id v16 = v13;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(accessQueue, block);
}

void __80__SKUIItemStateCenter_purchaseSoftwareItem_offer_clientContext_completionBlock___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) itemKind] == 17)
  {
    uint64_t v2 = (void *)[*(id *)(a1 + 40) _newPurchasesForSoftwareWithBundleItem:*(void *)(a1 + 32) bundleOffer:*(void *)(a1 + 48)];
  }
  else if ([*(id *)(a1 + 32) itemKind] == 12)
  {
    uint64_t v3 = [*(id *)(a1 + 40) _newSoftwarePurchaseWithItem:*(void *)(a1 + 32) offer:*(void *)(a1 + 48)];
    uint64_t v4 = (void *)v3;
    if (v3)
    {
      v13[0] = v3;
      uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  if (![v2 count])
  {
    id v5 = *(void **)(a1 + 64);
    if (v5)
    {
      id v6 = *(NSObject **)(*(void *)(a1 + 40) + 120);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__SKUIItemStateCenter_purchaseSoftwareItem_offer_clientContext_completionBlock___block_invoke_2;
      block[3] = &unk_1E64238C0;
      id v12 = v5;
      dispatch_async(v6, block);
    }
  }
  if ([v2 count])
  {
    id v7 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80__SKUIItemStateCenter_purchaseSoftwareItem_offer_clientContext_completionBlock___block_invoke_3;
    v9[3] = &unk_1E6423960;
    uint64_t v8 = *(void *)(a1 + 56);
    id v10 = *(id *)(a1 + 64);
    [v7 _performSoftwarePurchases:v2 withClientContext:v8 completionBlock:v9];
  }
}

uint64_t __80__SKUIItemStateCenter_purchaseSoftwareItem_offer_clientContext_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__SKUIItemStateCenter_purchaseSoftwareItem_offer_clientContext_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = [a2 items];
    id v4 = [v3 firstObject];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)purchaseItems:(id)a3 withCompletionBlock:(id)a4
{
}

- (void)purchaseItems:(id)a3 withClientContext:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__SKUIItemStateCenter_purchaseItems_withClientContext_completionBlock___block_invoke;
  v15[3] = &unk_1E6423988;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

void __71__SKUIItemStateCenter_purchaseItems_withClientContext_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _newPurchasesWithItems:*(void *)(a1 + 40)];
  if ([v2 count])
  {
    [*(id *)(a1 + 32) _performPurchases:v2 hasBundlePurchase:0 withClientContext:*(void *)(a1 + 48) completionBlock:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v3 = *(void **)(a1 + 56);
    if (v3)
    {
      id v4 = *(NSObject **)(*(void *)(a1 + 32) + 120);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __71__SKUIItemStateCenter_purchaseItems_withClientContext_completionBlock___block_invoke_2;
      block[3] = &unk_1E64238C0;
      id v6 = v3;
      dispatch_async(v4, block);
    }
  }
}

uint64_t __71__SKUIItemStateCenter_purchaseItems_withClientContext_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reloadFromServer
{
}

- (void)reloadGratisEligibilityWithBundleIdentifiers:(id)a3 clientContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__SKUIItemStateCenter_reloadGratisEligibilityWithBundleIdentifiers_clientContext___block_invoke;
  block[3] = &unk_1E64225B0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

void __82__SKUIItemStateCenter_reloadGratisEligibilityWithBundleIdentifiers_clientContext___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _gratisStateIsValid] & 1) == 0)
  {
    *(void *)(*(void *)(a1 + 32) + 64) = 1;
    ++*(void *)(*(void *)(a1 + 32) + 80);
    uint64_t v2 = [[SKUILoadGratisEligibilityOperation alloc] initWithBundleIdentifiers:*(void *)(a1 + 40) clientContext:*(void *)(a1 + 48)];
    objc_initWeak(&location, *(id *)(a1 + 32));
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __82__SKUIItemStateCenter_reloadGratisEligibilityWithBundleIdentifiers_clientContext___block_invoke_2;
    v7[3] = &unk_1E64239B0;
    objc_copyWeak(&v8, &location);
    v7[4] = *(void *)(a1 + 32);
    [(SKUILoadGratisEligibilityOperation *)v2 setOutputBlock:v7];
    uint64_t v3 = dispatch_get_global_queue(0, 0);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __82__SKUIItemStateCenter_reloadGratisEligibilityWithBundleIdentifiers_clientContext___block_invoke_3;
    v5[3] = &unk_1E6422020;
    id v6 = v2;
    id v4 = v2;
    dispatch_async(v3, v5);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __82__SKUIItemStateCenter_reloadGratisEligibilityWithBundleIdentifiers_clientContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];

  [WeakRetained _setGratisIdentifiers:v9 error:v6];
  if (v6)
  {
    id v10 = 0;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1C9C8] date];
  }
  id v11 = v10;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), v10);
  if (!v6)
  {
  }
}

uint64_t __82__SKUIItemStateCenter_reloadGratisEligibilityWithBundleIdentifiers_clientContext___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) main];
}

- (void)reloadMediaLibrary:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__SKUIItemStateCenter_reloadMediaLibrary___block_invoke;
  v7[3] = &unk_1E6421FF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

uint64_t __42__SKUIItemStateCenter_reloadMediaLibrary___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 104) containsObject:*(void *)(a1 + 40)];
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _reloadStateForObservedMediaLibraryItems];
  }
  return result;
}

- (void)removeMediaLibrary:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__SKUIItemStateCenter_removeMediaLibrary___block_invoke;
  v7[3] = &unk_1E6421FF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

uint64_t __42__SKUIItemStateCenter_removeMediaLibrary___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) removeObjectIdenticalTo:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__SKUIItemStateCenter_removeObserver___block_invoke;
  v7[3] = &unk_1E6421FF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

uint64_t __38__SKUIItemStateCenter_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) removeObject:*(void *)(a1 + 40)];
}

- (id)stateForItemWithIdentifier:(int64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__5;
  id v11 = __Block_byref_object_dispose__5;
  id v12 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__SKUIItemStateCenter_stateForItemWithIdentifier___block_invoke;
  block[3] = &unk_1E6422560;
  void block[5] = &v7;
  block[6] = a3;
  void block[4] = self;
  dispatch_sync(accessQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __50__SKUIItemStateCenter_stateForItemWithIdentifier___block_invoke(void *a1)
{
  id v6 = [[SKUIStoreIdentifier alloc] initWithLongLong:a1[6]];
  uint64_t v2 = [*(id *)(a1[4] + 88) objectForKey:v6];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)stateForItemWithStoreIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__5;
  id v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__SKUIItemStateCenter_stateForItemWithStoreIdentifier___block_invoke;
  block[3] = &unk_1E6422588;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __55__SKUIItemStateCenter_stateForItemWithStoreIdentifier___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 88) objectForKey:a1[5]];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)addDownloads:(id)a3
{
}

- (void)addManifestDownloadWithURL:(id)a3 placeholderMetadata:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x1E4FA8188];
  id v8 = a3;
  id v9 = [v7 alloc];
  id v10 = [MEMORY[0x1E4F18DA8] requestWithURL:v8];

  id v11 = (void *)[v9 initWithURLRequest:v10];
  [v11 setManifestFormat:1];
  uint64_t v12 = -[SKUIStoreIdentifier initWithLongLong:]([SKUIStoreIdentifier alloc], "initWithLongLong:", [v6 itemIdentifier]);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__SKUIItemStateCenter_addManifestDownloadWithURL_placeholderMetadata___block_invoke;
  block[3] = &unk_1E64225B0;
  void block[4] = self;
  uint64_t v14 = v12;
  id v20 = v14;
  id v21 = v6;
  id v15 = v6;
  dispatch_async(accessQueue, block);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__SKUIItemStateCenter_addManifestDownloadWithURL_placeholderMetadata___block_invoke_2;
  v17[3] = &unk_1E64239D8;
  v17[4] = self;
  id v18 = v14;
  id v16 = v14;
  [v11 startWithManifestResponseBlock:v17];
}

void __70__SKUIItemStateCenter_addManifestDownloadWithURL_placeholderMetadata___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _addState:1 forItemIdentifier:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = v2;
    if ([*(id *)(a1 + 48) isSample]) {
      [v3 setDownloadContentFlags:1];
    }
    [*(id *)(a1 + 32) _notifyObserversOfStateChange:v3];
    uint64_t v2 = v3;
  }
}

void __70__SKUIItemStateCenter_addManifestDownloadWithURL_placeholderMetadata___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__SKUIItemStateCenter_addManifestDownloadWithURL_placeholderMetadata___block_invoke_3;
  block[3] = &unk_1E64225B0;
  void block[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

void __70__SKUIItemStateCenter_addManifestDownloadWithURL_placeholderMetadata___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _removeState:1 forItemIdentifier:*(void *)(a1 + 40)];
  if (v2)
  {
    id v6 = v2;
    id v3 = [*(id *)(a1 + 48) validDownloads];
    uint64_t v4 = [v3 firstObject];

    if (v4) {
      id v5 = (id)[*(id *)(a1 + 32) _addState:2 forItemIdentifier:*(void *)(a1 + 40)];
    }
    else {
      [v6 setDownloadContentFlags:0];
    }
    [*(id *)(a1 + 32) _notifyObserversOfStateChange:v6];

    uint64_t v2 = v6;
  }
}

- (ASDSoftwareUpdatesStore)appstoredUpdatesStore
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__5;
  id v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__SKUIItemStateCenter_appstoredUpdatesStore__block_invoke;
  v5[3] = &unk_1E6422538;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ASDSoftwareUpdatesStore *)v3;
}

uint64_t __44__SKUIItemStateCenter_appstoredUpdatesStore__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _appstoredUpdatesStore];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (SSSoftwareUpdatesStore)appUpdatesStore
{
  return 0;
}

- (void)beginObservingLibraryItems:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SKUIItemStateCenter_beginObservingLibraryItems___block_invoke;
  v7[3] = &unk_1E6421FF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __50__SKUIItemStateCenter_beginObservingLibraryItems___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 112))
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (!objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "countForObject:", v9, (void)v14)) {
            [v3 addObject:v9];
          }
          [*(id *)(*(void *)(a1 + 32) + 112) addObject:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v6);
    }

    [*(id *)(a1 + 32) _reloadMediaLibraryStateForItems:v3];
  }
  else
  {
    id v10 = *(NSObject **)(v2 + 96);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__SKUIItemStateCenter_beginObservingLibraryItems___block_invoke_2;
    block[3] = &unk_1E6422020;
    void block[4] = v2;
    dispatch_async(v10, block);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28BD0]) initWithSet:*(void *)(a1 + 40)];
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 112);
    *(void *)(v12 + 112) = v11;

    [*(id *)(a1 + 32) _reloadMediaLibraryStateForItems:*(void *)(a1 + 40)];
  }
}

void __50__SKUIItemStateCenter_beginObservingLibraryItems___block_invoke_2(uint64_t a1)
{
  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v2 = SKUIMediaPlayerFramework();
  id v3 = SKUIWeakLinkedClassForString(&cfstr_Mpmedialibrary_0.isa, v2);
  id v4 = [v3 defaultMediaLibrary];
  [v4 beginGeneratingLibraryChangeNotifications];

  uint64_t v5 = (void *)SKUIMediaPlayerFramework();
  uint64_t v6 = (id *)SKUIWeakLinkedSymbolForString("MPMediaLibraryDidChangeNotification", v5);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *v6;
  uint64_t v9 = [v3 defaultMediaLibrary];
  [v10 addObserver:v7 selector:sel__mediaLibraryDidChangeNotification_ name:v8 object:v9];
}

- (void)evaluatePurchaseResponseForRentals:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CB10];
    id v23 = v4;
    uint64_t v6 = [v4 purchase];
    uint64_t v7 = [v6 buyParameters];
    id v8 = (void *)[v5 copyDictionaryForQueryString:v7 unescapedValues:1];

    uint64_t v9 = [v23 purchase];
    id v10 = [v9 valueForDownloadProperty:*MEMORY[0x1E4FA8630]];

    if (!v10 || ![v10 unsignedLongLongValue])
    {
      uint64_t v11 = [v8 valueForKey:@"salableAdamId"];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v12 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v11, "longLongValue"));

        id v10 = (void *)v12;
      }
    }
    id v13 = [[SKUIStoreIdentifier alloc] initWithNumber:v10];
    long long v14 = [v23 purchase];
    long long v15 = [v14 valueForDownloadProperty:*MEMORY[0x1E4FA85C8]];
    int v16 = [v15 BOOLValue];

    long long v17 = [v8 valueForKey:@"rental"];
    int v18 = [v17 BOOLValue];

    long long v19 = [v23 error];
    if (v19 || ([v23 cancelsPurchaseBatch] & 1) != 0)
    {
    }
    else if (v16 | v18)
    {
      uint64_t v20 = [MEMORY[0x1E4F1CAD0] setWithObject:v13];
      id v22 = [(SKUIItemStateCenter *)self _setStateFlag:2048 forItemsWithIdentifiers:v20 sendNotification:1];
LABEL_12:

      id v4 = v23;
      goto LABEL_13;
    }
    uint64_t v20 = [(SKUIItemStateCenter *)self stateForItemWithStoreIdentifier:v13];
    if (([v20 state] & 0x800) != 0) {
      id v21 = [(SKUIItemStateCenter *)self _removeState:2048 forItemIdentifier:v13];
    }
    goto LABEL_12;
  }
LABEL_13:
}

- (void)endObservingLibraryItems:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SKUIItemStateCenter_endObservingLibraryItems___block_invoke;
  v7[3] = &unk_1E6421FF8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __48__SKUIItemStateCenter_endObservingLibraryItems___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 112), "countForObject:", v7, (void)v13);
        if (v8 == 1)
        {
          uint64_t v9 = [SKUIStoreIdentifier alloc];
          id v10 = [v7 storeItemIdentifier];
          uint64_t v11 = [(SKUIStoreIdentifier *)v9 initWithNumber:v10];

          id v12 = (id)[*(id *)(a1 + 40) _removeState:64 forItemIdentifier:v11];
        }
        else if (v8 < 1)
        {
          continue;
        }
        [*(id *)(*(void *)(a1 + 40) + 112) removeObject:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

- (void)getSoftwareUpdatesWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SKUIItemStateCenter *)self appstoredUpdatesStore];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__SKUIItemStateCenter_getSoftwareUpdatesWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E6423A00;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getUpdatesWithCompletionBlock:v7];
}

void __61__SKUIItemStateCenter_getSoftwareUpdatesWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _setAvailableAppstoredUpdatesWithUpdates:v4 decrementLoadCount:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)performActionForLibraryItem:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__SKUIItemStateCenter_performActionForLibraryItem___block_invoke;
  v7[3] = &unk_1E6421FF8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __51__SKUIItemStateCenter_performActionForLibraryItem___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 104) copy];
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SKUIItemStateCenter_performActionForLibraryItem___block_invoke_2;
  block[3] = &unk_1E64225B0;
  id v8 = v2;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v9 = v4;
  uint64_t v10 = v5;
  id v6 = v2;
  dispatch_async(v3, block);
}

void __51__SKUIItemStateCenter_performActionForLibraryItem___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v8 = [v7 stateForLibraryItem:*(void *)(a1 + 40)];
        if ([v8 availability])
        {
          [v7 performActionForLibraryItem:*(void *)(a1 + 40)];
LABEL_20:

          goto LABEL_21;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 48) + 104);
  uint64_t v9 = [v2 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v2);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v13 = NSString;
          long long v14 = [*(id *)(a1 + 40) storeItemIdentifier];
          id v8 = [v13 stringWithFormat:@"ibooks://assetid/%@", v14];

          long long v15 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
          long long v16 = [MEMORY[0x1E4FB1438] sharedApplication];
          [v16 openURL:v15 options:MEMORY[0x1E4F1CC08] completionHandler:0];

          goto LABEL_20;
        }
      }
      uint64_t v10 = [v2 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_21:
}

- (void)reloadSoftwareUpdatesFromServerWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SKUIItemStateCenter *)self appstoredUpdatesStore];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__SKUIItemStateCenter_reloadSoftwareUpdatesFromServerWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E6423A28;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 reloadFromServerWithCompletionBlock:v7];
}

void __74__SKUIItemStateCenter_reloadSoftwareUpdatesFromServerWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (!v5) {
    [*(id *)(a1 + 32) _setAvailableAppstoredUpdatesWithUpdates:v6 decrementLoadCount:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)findLibraryItemsForContentIdentifiers:(id)a3 options:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__SKUIItemStateCenter_findLibraryItemsForContentIdentifiers_options_completionBlock___block_invoke;
  v15[3] = &unk_1E6423988;
  id v16 = v9;
  long long v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(accessQueue, v15);
}

void __85__SKUIItemStateCenter_findLibraryItemsForContentIdentifiers_options_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) objectForKey:@"kinds"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v2];
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 40) + 104);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v11 = [v10 exposedPlatformItemKinds];
        id v12 = (void *)v11;
        if (!v3 || !v11 || [v3 intersectsSet:v11]) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v7);
  }

  id v13 = objc_alloc_init(SKUISoftwareLibraryInterface);
  id v14 = v13;
  if (!v3
    || ([(SKUISoftwareLibraryInterface *)v13 exposedPlatformItemKinds],
        long long v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = [v3 intersectsSet:v15],
        v15,
        v16))
  {
    [v4 addObject:v14];
  }
  long long v17 = *(NSObject **)(*(void *)(a1 + 40) + 96);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__SKUIItemStateCenter_findLibraryItemsForContentIdentifiers_options_completionBlock___block_invoke_2;
  block[3] = &unk_1E6423AA0;
  id v22 = *(id *)(a1 + 48);
  id v23 = v4;
  uint64_t v18 = *(void *)(a1 + 40);
  id v24 = v3;
  uint64_t v25 = v18;
  id v26 = *(id *)(a1 + 56);
  id v19 = v3;
  id v20 = v4;
  dispatch_async(v17, block);
}

void __85__SKUIItemStateCenter_findLibraryItemsForContentIdentifiers_options_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v24 = a1;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v36 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v8 = objc_alloc_init(SKUILibraryItem);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v9 = v7;
        }
        else {
          id v9 = (id)objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v7, "longLongValue"));
        }
        id v10 = v9;
        uint64_t v11 = [[SKUIStoreIdentifier alloc] initWithNumber:v9];
        [(SKUILibraryItem *)v8 setStoreIdentifier:v11];

        [v2 addObject:v8];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v4);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        uint64_t v18 = (void *)MEMORY[0x1C8749310]();
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __85__SKUIItemStateCenter_findLibraryItemsForContentIdentifiers_options_completionBlock___block_invoke_3;
        v28[3] = &unk_1E6423A50;
        id v29 = *(id *)(v24 + 48);
        id v30 = v23;
        [v17 enumerateStatesForLibraryItems:v2 usingBlock:v28];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v14);
  }

  id v19 = *(NSObject **)(*(void *)(v24 + 56) + 120);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__SKUIItemStateCenter_findLibraryItemsForContentIdentifiers_options_completionBlock___block_invoke_4;
  block[3] = &unk_1E6423A78;
  id v20 = *(id *)(v24 + 64);
  id v26 = v23;
  id v27 = v20;
  id v21 = v23;
  dispatch_async(v19, block);
}

void __85__SKUIItemStateCenter_findLibraryItemsForContentIdentifiers_options_completionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if ([v5 availability] == 2)
  {
    uint64_t v6 = [v5 storePlatformKind];
    if (!v6 || (uint64_t v7 = *(void **)(a1 + 32)) == 0 || [v7 containsObject:v6])
    {
      uint64_t v8 = (void *)[v5 newJavaScriptRepresentation];
      id v9 = [v11 storeItemIdentifier];
      id v10 = [v9 stringValue];

      [v8 setObject:v10 forKey:0x1F1C8B588];
      [*(id *)(a1 + 40) setObject:v8 forKey:v10];
    }
  }
}

uint64_t __85__SKUIItemStateCenter_findLibraryItemsForContentIdentifiers_options_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)gratisEligibleItemIdentifiers
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__5;
  id v11 = __Block_byref_object_dispose__5;
  id v12 = [MEMORY[0x1E4F1CA48] array];
  accessQueue = self->_accessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__SKUIItemStateCenter_gratisEligibleItemIdentifiers__block_invoke;
  v6[3] = &unk_1E6423848;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(accessQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __52__SKUIItemStateCenter_gratisEligibleItemIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 88);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__SKUIItemStateCenter_gratisEligibleItemIdentifiers__block_invoke_2;
  v3[3] = &unk_1E6423870;
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

void __52__SKUIItemStateCenter_gratisEligibleItemIdentifiers__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (([v6 state] & 0x10) != 0)
  {
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v5 = [v6 itemIdentifier];
    [v4 addObject:v5];
  }
}

- (void)purchaseTone:(id)a3 withProperties:(id)a4 clientContext:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__SKUIItemStateCenter_purchaseTone_withProperties_clientContext_completionBlock___block_invoke;
  block[3] = &unk_1E6423AC8;
  void block[4] = self;
  id v20 = v10;
  id v22 = v12;
  id v23 = v13;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  id v18 = v10;
  dispatch_async(accessQueue, block);
}

void __81__SKUIItemStateCenter_purchaseTone_withProperties_clientContext_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = [v3 primaryItemOffer];
  id v5 = (void *)[v2 _newPurchaseWithItem:v3 offer:v4];

  if (v5)
  {
    id v6 = *(void **)(a1 + 48);
    if (v6)
    {
      uint64_t v7 = [v6 assigneeIdentifier];
      [v5 setAssigneeIdentifier:v7];

      uint64_t v8 = [*(id *)(a1 + 48) assigneeContactIdentifier];
      [v5 setAssigneeContactIdentifier:v8];

      uint64_t v9 = [*(id *)(a1 + 48) assigneeToneStyle];
      [v5 setAssigneeToneStyle:v9];

      objc_msgSend(v5, "setShouldMakeDefaultRingtone:", objc_msgSend(*(id *)(a1 + 48), "shouldMakeDefaultRingtone"));
      objc_msgSend(v5, "setShouldMakeDefaultTextTone:", objc_msgSend(*(id *)(a1 + 48), "shouldMakeDefaultTextTone"));
    }
    id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v5, 0);
    id v11 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __81__SKUIItemStateCenter_purchaseTone_withProperties_clientContext_completionBlock___block_invoke_3;
    v15[3] = &unk_1E6423910;
    uint64_t v12 = *(void *)(a1 + 56);
    id v16 = *(id *)(a1 + 64);
    [v11 _performPurchases:v10 hasBundlePurchase:0 withClientContext:v12 completionBlock:v15];

    goto LABEL_7;
  }
  id v13 = *(void **)(a1 + 64);
  if (v13)
  {
    uint64_t v14 = *(NSObject **)(*(void *)(a1 + 32) + 120);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__SKUIItemStateCenter_purchaseTone_withProperties_clientContext_completionBlock___block_invoke_2;
    block[3] = &unk_1E64238C0;
    id v18 = v13;
    dispatch_async(v14, block);
    id v10 = v18;
LABEL_7:
  }
}

uint64_t __81__SKUIItemStateCenter_purchaseTone_withProperties_clientContext_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81__SKUIItemStateCenter_purchaseTone_withProperties_clientContext_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    id v5 = v3;
    if ([v3 count] == 1)
    {
      id v4 = [v5 objectAtIndex:0];
    }
    else
    {
      id v4 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

    id v3 = v5;
  }
}

- (void)addRelationshipForParentAdamId:(id)a3 withChildAdamIds:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__SKUIItemStateCenter_addRelationshipForParentAdamId_withChildAdamIds___block_invoke;
  block[3] = &unk_1E64225B0;
  id v12 = v6;
  id v13 = v7;
  uint64_t v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

void __71__SKUIItemStateCenter_addRelationshipForParentAdamId_withChildAdamIds___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [[SKUIStoreIdentifier alloc] initWithNumber:*(void *)(a1 + 32)];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        id v10 = [SKUIStoreIdentifier alloc];
        id v11 = -[SKUIStoreIdentifier initWithNumber:](v10, "initWithNumber:", v9, (void)v12);
        [v3 addObject:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  [*(id *)(*(void *)(a1 + 48) + 152) addChildren:v3 forParent:v2];
}

- (void)removeRelationshipsForParentAdamId:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__SKUIItemStateCenter_removeRelationshipsForParentAdamId___block_invoke;
  v7[3] = &unk_1E6421FF8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __58__SKUIItemStateCenter_removeRelationshipsForParentAdamId___block_invoke(uint64_t a1)
{
  id v2 = [[SKUIStoreIdentifier alloc] initWithNumber:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 152) removeAllRelationshipsForItem:v2];
}

- (void)jobManager:(id)a3 completedJobs:(id)a4
{
  id v5 = a4;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__SKUIItemStateCenter_jobManager_completedJobs___block_invoke;
  v8[3] = &unk_1E6421FF8;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(accessQueue, v8);
}

void __48__SKUIItemStateCenter_jobManager_completedJobs___block_invoke(uint64_t a1)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v57 = [obj countByEnumeratingWithState:&v62 objects:v74 count:16];
  if (v57)
  {
    uint64_t v56 = *(void *)v63;
    uint64_t v48 = a1;
    do
    {
      for (uint64_t i = 0; i != v57; ++i)
      {
        if (*(void *)v63 != v56) {
          objc_enumerationMutation(obj);
        }
        id v3 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "storeItemID", v46));
        id v5 = [[SKUIStoreIdentifier alloc] initWithNumber:v4];
        id v6 = [*(id *)(*(void *)(a1 + 40) + 88) objectForKey:v5];
        uint64_t v7 = [v3 phase];
        if (!v6)
        {
          v59 = v5;
          id v19 = [MEMORY[0x1E4FA81D8] sharedConfig];
          int v20 = [v19 shouldLog];
          if ([v19 shouldLogToDisk]) {
            v20 |= 2u;
          }
          id v21 = [v19 OSLogObject];
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            v20 &= 2u;
          }
          if (v20)
          {
LABEL_27:
            uint64_t v23 = a1;
            uint64_t v24 = v4;
            uint64_t v25 = objc_opt_class();
            id v26 = v25;
            id v27 = [v3 bundleID];
            int v66 = 138412546;
            v67 = v25;
            id v4 = v24;
            __int16 v68 = 2112;
            v69 = v27;
            LODWORD(v47) = 22;
            v46 = &v66;
            long long v28 = (void *)_os_log_send_and_compose_impl();

            if (v28)
            {
              id v21 = objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, &v66, v47);
              free(v28);
              v46 = (int *)v21;
              SSFileLog();
              goto LABEL_30;
            }
LABEL_31:

            a1 = v23;
            id v5 = v59;
            goto LABEL_59;
          }
LABEL_29:
          uint64_t v23 = a1;
LABEL_30:

          goto LABEL_31;
        }
        uint64_t v8 = v7;
        uint64_t v9 = [v6 state];
        if ((v9 & 0x23) == 0)
        {
          v59 = v5;
          id v19 = [MEMORY[0x1E4FA81D8] sharedConfig];
          int v22 = [v19 shouldLog];
          if ([v19 shouldLogToDisk]) {
            v22 |= 2u;
          }
          id v21 = [v19 OSLogObject];
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            v22 &= 2u;
          }
          if (v22) {
            goto LABEL_27;
          }
          goto LABEL_29;
        }
        uint64_t v10 = v9;
        if (!v8)
        {
          id v29 = [MEMORY[0x1E4FA81D8] sharedConfig];
          int v30 = [v29 shouldLog];
          if ([v29 shouldLogToDisk]) {
            v30 |= 2u;
          }
          long long v31 = [v29 OSLogObject];
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
            v30 &= 2u;
          }
          if (v30)
          {
            v60 = v5;
            uint64_t v32 = a1;
            long long v33 = v4;
            long long v34 = objc_opt_class();
            id v55 = v34;
            long long v35 = [v3 bundleID];
            int v66 = 138412546;
            v67 = v34;
            id v4 = v33;
            a1 = v32;
            id v5 = v60;
            __int16 v68 = 2112;
            v69 = v35;
            LODWORD(v47) = 22;
            v46 = &v66;
            long long v36 = (void *)_os_log_send_and_compose_impl();

            if (v36)
            {
              long long v31 = objc_msgSend(NSString, "stringWithCString:encoding:", v36, 4, &v66, v47);
              free(v36);
              v46 = (int *)v31;
              SSFileLog();
              goto LABEL_39;
            }
          }
          else
          {
LABEL_39:
          }
          unint64_t v37 = v10 & 0xFFFFFFFFFFFFFFFCLL;
          goto LABEL_58;
        }
        v53 = v4;
        char v51 = v9;
        unint64_t v11 = v9 & 0xFFFFFFFFFFFFFFDCLL;
        long long v12 = [MEMORY[0x1E4FA81D8] sharedConfig];
        int v13 = [v12 shouldLog];
        if ([v12 shouldLogToDisk]) {
          v13 |= 2u;
        }
        long long v14 = [v12 OSLogObject];
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          v13 &= 2u;
        }
        unint64_t v54 = v11;
        if (!v13)
        {
          char v18 = v51;
          goto LABEL_42;
        }
        long long v15 = objc_opt_class();
        id v49 = v15;
        [v3 bundleID];
        id v16 = v58 = v5;
        int v66 = 138413058;
        v67 = v15;
        __int16 v68 = 2112;
        v69 = v16;
        __int16 v70 = 2048;
        uint64_t v71 = v8;
        __int16 v72 = 2048;
        unint64_t v73 = v11;
        LODWORD(v47) = 42;
        v46 = &v66;
        uint64_t v17 = (void *)_os_log_send_and_compose_impl();

        id v5 = v58;
        char v18 = v51;
        if (v17)
        {
          long long v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v66, v47);
          free(v17);
          v46 = (int *)v14;
          SSFileLog();
LABEL_42:
        }
        if (v8 != 4)
        {
          a1 = v48;
          id v4 = v53;
          goto LABEL_57;
        }
        a1 = v48;
        id v4 = v53;
        unint64_t v37 = v54;
        if ((v18 & 4) == 0)
        {
          uint64_t v38 = v54 | 4;
          v39 = [MEMORY[0x1E4FA81D8] sharedConfig];
          int v40 = [v39 shouldLog];
          if ([v39 shouldLogToDisk]) {
            v40 |= 2u;
          }
          uint64_t v41 = objc_msgSend(v39, "OSLogObject", v46);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
            int v42 = v40;
          }
          else {
            int v42 = v40 & 2;
          }
          v54 |= 4uLL;
          if (v42)
          {
            v43 = objc_opt_class();
            id v61 = v43;
            v44 = [v3 bundleID];
            int v66 = 138413058;
            v67 = v43;
            __int16 v68 = 2112;
            v69 = v44;
            __int16 v70 = 2048;
            uint64_t v71 = 4;
            __int16 v72 = 2048;
            unint64_t v73 = v38;
            LODWORD(v47) = 42;
            v46 = &v66;
            v45 = (void *)_os_log_send_and_compose_impl();

            id v4 = v53;
            if (v45)
            {
              uint64_t v41 = objc_msgSend(NSString, "stringWithCString:encoding:", v45, 4, &v66, v47);
              free(v45);
              v46 = (int *)v41;
              SSFileLog();
              goto LABEL_55;
            }
          }
          else
          {
            id v4 = v53;
LABEL_55:
          }
LABEL_57:
          unint64_t v37 = v54;
        }
LABEL_58:
        objc_msgSend(v6, "setDownloadProgress:", 0.0, v46);
        [v6 setState:v37];
        [v50 addObject:v6];
LABEL_59:
      }
      uint64_t v57 = [obj countByEnumeratingWithState:&v62 objects:v74 count:16];
    }
    while (v57);
  }

  if ([v50 count]) {
    [*(id *)(a1 + 40) _notifyObserversOfStateChanges:v50];
  }
}

- (void)jobManager:(id)a3 updatedProgressOfJobs:(id)a4
{
  id v5 = a4;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__SKUIItemStateCenter_jobManager_updatedProgressOfJobs___block_invoke;
  v8[3] = &unk_1E6421FF8;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(accessQueue, v8);
}

void __56__SKUIItemStateCenter_jobManager_updatedProgressOfJobs___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v27 = a1;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v29;
    unint64_t v6 = 0x1E4F28000uLL;
    unint64_t v7 = 0x1E6420000uLL;
    uint64_t v25 = *(void *)v29;
    do
    {
      uint64_t v8 = 0;
      uint64_t v26 = v4;
      do
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(v2);
        }
        id v9 = *(void **)(*((void *)&v28 + 1) + 8 * v8);
        uint64_t v10 = objc_msgSend(*(id *)(v6 + 3792), "numberWithLongLong:", objc_msgSend(v9, "storeItemID", v24));
        if (!v10)
        {
          unint64_t v11 = 0;
LABEL_20:
          int v13 = 0;
          goto LABEL_21;
        }
        unint64_t v11 = (void *)[objc_alloc(*(Class *)(v7 + 4072)) initWithNumber:v10];
        if (!v11) {
          goto LABEL_20;
        }
        long long v12 = [*(id *)(*(void *)(v27 + 40) + 88) objectForKey:v11];
        int v13 = v12;
        if (v12)
        {
          id v14 = v2;
          uint64_t v15 = [v12 state];
          char v16 = ~(_BYTE)v15;
          uint64_t v17 = [v9 phase];
          [v9 percentComplete];
          float v19 = v18;
          if (v19 != 1.0 && v17 == 5) {
            float v21 = 1.0;
          }
          else {
            float v21 = v19;
          }
          if (v15 != (v16 & 2 | v15 & 0xFFFFFFFFFFFFFFFELL) || ([v13 downloadProgress], v21 != v22))
          {
            [v13 setState:v16 & 2 | v15 & 0xFFFFFFFFFFFFFFFELL];
            *(float *)&double v23 = v21;
            [v13 setDownloadProgress:v23];
            [v24 addObject:v13];
          }
          id v2 = v14;
          uint64_t v5 = v25;
          uint64_t v4 = v26;
          unint64_t v6 = 0x1E4F28000;
          unint64_t v7 = 0x1E6420000;
        }
LABEL_21:

        ++v8;
      }
      while (v4 != v8);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v4);
  }

  if ([v24 count]) {
    [*(id *)(v27 + 40) _notifyObserversOfStateChanges:v24];
  }
}

- (void)jobManager:(id)a3 updatedStateOfJobs:(id)a4
{
  id v5 = a4;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__SKUIItemStateCenter_jobManager_updatedStateOfJobs___block_invoke;
  v8[3] = &unk_1E6421FF8;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(accessQueue, v8);
}

void __53__SKUIItemStateCenter_jobManager_updatedStateOfJobs___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v34 = a1;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v36;
    unint64_t v6 = 0x1E4F28000uLL;
    uint64_t v28 = *(void *)v36;
    id v29 = v2;
    do
    {
      uint64_t v7 = 0;
      uint64_t v31 = v4;
      do
      {
        if (*(void *)v36 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v35 + 1) + 8 * v7);
        id v9 = objc_msgSend(*(id *)(v6 + 3792), "numberWithLongLong:", objc_msgSend(v8, "storeItemID", v26));
        if (!v9)
        {
          uint64_t v10 = 0;
          goto LABEL_22;
        }
        uint64_t v10 = [[SKUIStoreIdentifier alloc] initWithNumber:v9];
        if (v10)
        {
          uint64_t v11 = [*(id *)(*(void *)(v34 + 40) + 88) objectForKey:v10];
          if (v11)
          {
            long long v12 = (void *)v11;
            uint64_t v13 = [v8 phase];
            id v14 = [MEMORY[0x1E4FA81D8] sharedConfig];
            int v15 = [v14 shouldLog];
            if ([v14 shouldLogToDisk]) {
              int v16 = v15 | 2;
            }
            else {
              int v16 = v15;
            }
            uint64_t v17 = [v14 OSLogObject];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
              int v18 = v16;
            }
            else {
              int v18 = v16 & 2;
            }
            if (v18)
            {
              float v19 = objc_opt_class();
              id v33 = v19;
              [v8 bundleID];
              uint64_t v20 = v32 = v13;
              uint64_t v21 = [v12 state];
              int v39 = 138413058;
              int v40 = v19;
              __int16 v41 = 2112;
              uint64_t v42 = v20;
              float v22 = (void *)v20;
              __int16 v43 = 2048;
              uint64_t v44 = v32;
              __int16 v45 = 2048;
              uint64_t v46 = v21;
              LODWORD(v27) = 42;
              uint64_t v26 = &v39;
              double v23 = (void *)_os_log_send_and_compose_impl();

              id v2 = v29;
              if (v23)
              {
                uint64_t v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, &v39, v27);
                free(v23);
                uint64_t v26 = (int *)v17;
                SSFileLog();
                goto LABEL_20;
              }
            }
            else
            {
              id v2 = v29;
LABEL_20:
            }
            id v24 = objc_msgSend(*(id *)(v34 + 40), "_downloadPhaseForJobPhase:", objc_msgSend(v8, "phase"));
            [v12 setDownloadPhase:v24];

            [v8 percentComplete];
            *(float *)&double v25 = v25;
            [v12 setDownloadProgress:v25];
            [v30 addObject:v12];

            uint64_t v5 = v28;
            unint64_t v6 = 0x1E4F28000;
            uint64_t v4 = v31;
          }
        }
LABEL_22:

        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v4);
  }

  [*(id *)(v34 + 40) _notifyObserversOfStateChanges:v30];
}

- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4
{
  id v5 = a4;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__SKUIItemStateCenter_downloadManager_downloadStatesDidChange___block_invoke;
  v8[3] = &unk_1E6421FF8;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(accessQueue, v8);
}

void __63__SKUIItemStateCenter_downloadManager_downloadStatesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    long long v35 = 0;
    uint64_t v5 = *(void *)v46;
    uint64_t v6 = *MEMORY[0x1E4FA85E0];
    uint64_t v7 = *MEMORY[0x1E4FA8478];
    id v40 = v2;
    uint64_t v41 = *MEMORY[0x1E4FA8630];
    uint64_t v34 = *MEMORY[0x1E4FA84F0];
    uint64_t v42 = *MEMORY[0x1E4FA8478];
    uint64_t v43 = a1;
    while (1)
    {
      uint64_t v8 = 0;
      uint64_t v44 = v4;
      do
      {
        if (*(void *)v46 != v5) {
          objc_enumerationMutation(v2);
        }
        id v9 = *(void **)(*((void *)&v45 + 1) + 8 * v8);
        uint64_t v10 = objc_msgSend(v9, "valueForProperty:", v6, v34);
        char v11 = [v10 isEqualToString:v7];

        if ((v11 & 1) == 0)
        {
          uint64_t v12 = v6;
          uint64_t v13 = [v9 valueForProperty:v41];
          if (v13)
          {
            id v14 = [[SKUIStoreIdentifier alloc] initWithNumber:v13];
            if (v14)
            {
              [*(id *)(*(void *)(a1 + 40) + 88) objectForKey:v14];
              v16 = uint64_t v15 = a1;
              if (!v16) {
                goto LABEL_22;
              }
              uint64_t v17 = [v9 downloadPhaseIdentifier];
              [v16 setDownloadPhase:v17];

              [v16 downloadProgress];
              float v19 = v18;
              [v9 percentComplete];
              *(float *)&double v20 = v20;
              [v16 setDownloadProgress:v20];
              [v39 addObject:v16];
              if ([*(id *)(*(void *)(v15 + 40) + 152) itemHasParent:v14])
              {
                uint64_t v21 = [*(id *)(*(void *)(v15 + 40) + 152) parentItemForItem:v14];
                float v22 = [*(id *)(*(void *)(v15 + 40) + 88) objectForKey:v21];
                if (!v22)
                {
                  float v22 = objc_alloc_init(SKUIItemState);
                  [v21 itemIdentifier];
                  double v23 = v37 = v21;
                  [(SKUIItemState *)v22 setItemIdentifier:v23];

                  [(SKUIItemState *)v22 setStoreIdentifier:v37];
                  id v24 = [v16 downloadPhase];
                  [(SKUIItemState *)v22 setDownloadPhase:v24];

                  uint64_t v21 = v37;
                  -[SKUIItemState setDownloadContentFlags:](v22, "setDownloadContentFlags:", [v16 downloadContentFlags]);
                  [*(id *)(*(void *)(v15 + 40) + 88) setObject:v22 forKey:v37];
                }
                double v25 = [*(id *)(*(void *)(v15 + 40) + 152) siblingItemsForItem:v14];
                [(SKUIItemState *)v22 downloadProgress];
                float v27 = v26;
                long long v36 = v25;
                float v28 = (float)(unint64_t)[v25 count];
                float v29 = v19 / v28;
                if ((float)(v27 - (float)(v19 / v28)) >= 0.0) {
                  float v29 = -0.0;
                }
                float v30 = (float)(v27 - (float)(v19 / v28)) + v29;
                [v16 downloadProgress];
                *(float *)&double v31 = (float)(*(float *)&v31 / v28) + v30;
                if (*(float *)&v31 > 1.0) {
                  *(float *)&double v31 = 1.0;
                }
                [(SKUIItemState *)v22 setDownloadProgress:v31];
                if (([v35 isEqual:v34] & 1) == 0)
                {
                  [v9 downloadPhaseIdentifier];
                  uint64_t v32 = v38 = v21;
                  [(SKUIItemState *)v22 setDownloadPhase:v32];

                  uint64_t v21 = v38;
                  uint64_t v33 = [v9 downloadPhaseIdentifier];

                  long long v35 = (void *)v33;
                }
                id v2 = v40;
                [v39 addObject:v22];
              }
              else
              {
LABEL_22:
                id v2 = v40;
              }
              goto LABEL_23;
            }
          }
          else
          {
            id v14 = 0;
          }
          int v16 = 0;
LABEL_23:

          uint64_t v6 = v12;
          a1 = v43;
          uint64_t v4 = v44;
          uint64_t v7 = v42;
        }
        ++v8;
      }
      while (v4 != v8);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (!v4) {
        goto LABEL_28;
      }
    }
  }
  long long v35 = 0;
LABEL_28:

  [*(id *)(a1 + 40) _notifyObserversOfStateChanges:v39];
}

- (void)downloadQueue:(id)a3 downloadStatesDidChange:(id)a4
{
  id v5 = a4;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__SKUIItemStateCenter_downloadQueue_downloadStatesDidChange___block_invoke;
  v8[3] = &unk_1E6421FF8;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(accessQueue, v8);
}

void __61__SKUIItemStateCenter_downloadQueue_downloadStatesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v30 = [v3 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v32;
    uint64_t v27 = *MEMORY[0x1E4FA84F0];
    uint64_t v26 = *MEMORY[0x1E4FA8510];
    id v25 = v3;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(v3);
        }
        id v5 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v6 = [v5 storeID];
        id v7 = [v6 stringValue];
        if (![v7 length])
        {
          uint64_t v8 = (void *)MEMORY[0x1E4F1CB10];
          id v9 = [v5 permLink];
          uint64_t v10 = [v8 URLWithString:v9];

          if (v10)
          {
            char v11 = [v10 identifierFromPermlink];

            if (v11)
            {
              objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "integerValue"));
              uint64_t v6 = v7 = v6;
              goto LABEL_13;
            }
          }
          else
          {
            char v11 = 0;
LABEL_13:
          }
          id v7 = v11;
          if (!v6) {
            goto LABEL_31;
          }
          goto LABEL_15;
        }
        if (!v6) {
          goto LABEL_31;
        }
LABEL_15:
        uint64_t v12 = [[SKUIStoreIdentifier alloc] initWithNumber:v6];
        if (v12)
        {
          uint64_t v13 = [*(id *)(*(void *)(a1 + 40) + 88) objectForKey:v12];
          if (v13) {
            goto LABEL_26;
          }
        }
        float v28 = v12;
        id v14 = [MEMORY[0x1E4FA81D8] sharedConfig];
        int v15 = [v14 shouldLog];
        if ([v14 shouldLogToDisk]) {
          v15 |= 2u;
        }
        int v16 = [v14 OSLogObject];
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          v15 &= 2u;
        }
        if (!v15) {
          goto LABEL_24;
        }
        uint64_t v17 = objc_opt_class();
        int v35 = 138412290;
        long long v36 = v17;
        id v18 = v2;
        uint64_t v19 = a1;
        id v20 = v17;
        LODWORD(v24) = 12;
        double v23 = &v35;
        uint64_t v21 = (void *)_os_log_send_and_compose_impl();

        a1 = v19;
        id v2 = v18;
        id v3 = v25;

        if (v21)
        {
          int v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, &v35, v24);
          free(v21);
          double v23 = (int *)v16;
          SSFileLog();
LABEL_24:
        }
        uint64_t v12 = v28;
        uint64_t v13 = [*(id *)(a1 + 40) _addState:2 forItemIdentifier:v28];
LABEL_26:
        objc_msgSend(v13, "setMediaCategory:", 3, v23);
        [v13 setDownloadPhase:v27];
        if ([v5 downloadPhase] == 8) {
          [v13 setDownloadPhase:v26];
        }
        float v22 = [v5 percentComplete];
        [v22 floatValue];
        objc_msgSend(v13, "setDownloadProgress:");

        objc_msgSend(v13, "setState:", objc_msgSend(v13, "state") | 2);
        objc_msgSend(v13, "setState:", objc_msgSend(v13, "state") & 0xFFFFFFFFFFFFFFFELL);
        if ([v5 isSample]) {
          [v13 setDownloadContentFlags:1];
        }
        [v2 addObject:v13];

LABEL_31:
      }
      uint64_t v30 = [v3 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v30);
  }

  [*(id *)(a1 + 40) _notifyObserversOfStateChanges:v2];
}

- (void)downloadQueue:(id)a3 downloadStates:(id)a4 didCompleteWithError:(id)a5
{
  id v6 = a4;
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__SKUIItemStateCenter_downloadQueue_downloadStates_didCompleteWithError___block_invoke;
  v9[3] = &unk_1E6421FF8;
  id v10 = v6;
  char v11 = self;
  id v8 = v6;
  dispatch_async(accessQueue, v9);
}

void __73__SKUIItemStateCenter_downloadQueue_downloadStates_didCompleteWithError___block_invoke(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v52;
    uint64_t v40 = *MEMORY[0x1E4FA8510];
    uint64_t v36 = *(void *)v52;
    uint64_t v37 = a1;
    do
    {
      uint64_t v5 = 0;
      uint64_t v38 = v3;
      do
      {
        if (*(void *)v52 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v51 + 1) + 8 * v5);
        id v7 = objc_msgSend(v6, "storeID", v34, v35);
        id v8 = [v7 stringValue];
        if ([v8 length])
        {
          if (v7) {
            goto LABEL_8;
          }
          goto LABEL_38;
        }
        double v23 = (void *)MEMORY[0x1E4F1CB10];
        uint64_t v24 = [v6 permLink];
        id v25 = [v23 URLWithString:v24];

        if (v25)
        {
          uint64_t v26 = [v25 identifierFromPermlink];

          if (!v26) {
            goto LABEL_37;
          }
          objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v26, "integerValue"));
          v7 = id v8 = v7;
        }
        else
        {
          uint64_t v26 = 0;
        }

LABEL_37:
        id v8 = v26;
        if (v7)
        {
LABEL_8:
          uint64_t v44 = v6;
          id v9 = [[SKUIStoreIdentifier alloc] initWithNumber:v7];
          if (!v9
            || ([*(id *)(*(void *)(a1 + 40) + 88) objectForKey:v9],
                (id v10 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            id v10 = [*(id *)(a1 + 40) _addState:2 forItemIdentifier:v9];
          }
          long long v45 = v9;
          [v10 setMediaCategory:3];
          [v10 setDownloadPhase:v40];
          LODWORD(v11) = 1.0;
          [v10 setDownloadProgress:v11];
          [v10 setState:[v10 state] & 0xFFFFFFFFFFFFFFFDLL];
          long long v46 = v10;
          [v10 setState:[v10 state] & 0xFFFFFFFFFFFFFFFELL];
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v12 = *(id *)(*(void *)(a1 + 40) + 104);
          uint64_t v13 = [v12 countByEnumeratingWithState:&v47 objects:v55 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v42 = v8;
            uint64_t v43 = v5;
            int v15 = v7;
            char v16 = 0;
            uint64_t v17 = *(void *)v48;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v48 != v17) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v19 = *(void **)(*((void *)&v47 + 1) + 8 * i);
                if (objc_opt_respondsToSelector())
                {
                  id v20 = objc_alloc_init(SKUILibraryItem);
                  uint64_t v21 = [[SKUIStoreIdentifier alloc] initWithNumber:v15];
                  [(SKUILibraryItem *)v20 setStoreIdentifier:v21];

                  float v22 = [v19 stateForLibraryItemAfterLibraryIntegration:v20];
                  if ([v22 availability] == 2)
                  {
                    [v46 setState:[v46 state] | 0x40];
                    char v16 = 1;
                  }
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v47 objects:v55 count:16];
            }
            while (v14);

            uint64_t v4 = v36;
            a1 = v37;
            uint64_t v3 = v38;
            id v7 = v15;
            id v8 = v42;
            uint64_t v5 = v43;
            id v10 = v46;
            if (v16) {
              goto LABEL_29;
            }
          }
          else
          {
          }
          [v10 setState:[v10 state] | 0x40];
LABEL_29:
          [v10 setLibraryContentFlags:0];
          uint64_t v27 = v45;
          if ([v44 isSample])
          {
            [v10 setDownloadContentFlags:1];
            [v10 setLibraryContentFlags:1];
          }
          [v41 addObject:v10];
          goto LABEL_32;
        }
LABEL_38:
        uint64_t v27 = [MEMORY[0x1E4FA81D8] sharedConfig];
        int v28 = [v27 shouldLog];
        if ([v27 shouldLogToDisk]) {
          v28 |= 2u;
        }
        id v10 = [v27 OSLogObject];
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          v28 &= 2u;
        }
        if (!v28) {
          goto LABEL_32;
        }
        uint64_t v29 = objc_opt_class();
        int v56 = 138412290;
        uint64_t v57 = v29;
        uint64_t v30 = v10;
        id v31 = v29;
        LODWORD(v35) = 12;
        long long v34 = &v56;
        long long v32 = (void *)_os_log_send_and_compose_impl();

        if (v32)
        {
          id v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v32, 4, &v56, v35);
          free(v32);
          long long v34 = (int *)v10;
          SSFileLog();
LABEL_32:
        }
        ++v5;
      }
      while (v5 != v3);
      uint64_t v33 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
      uint64_t v3 = v33;
    }
    while (v33);
  }

  [*(id *)(a1 + 40) _notifyObserversOfStateChanges:v41];
}

- (void)_reloadStateForObservedMediaLibraryItems
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ([(NSCountedSet *)self->_observedLibraryItems count])
  {
    uint64_t v3 = (void *)[(NSCountedSet *)self->_observedLibraryItems copy];
    uint64_t v4 = (void *)[v3 mutableCopy];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v28;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v28 != v7) {
            objc_enumerationMutation(obj);
          }
          relationshipCouncellor = self->_relationshipCouncellor;
          id v10 = [*(id *)(*((void *)&v27 + 1) + 8 * v8) storeIdentifier];
          double v11 = [(SKUIStoreItemRelationshipCounsellor *)relationshipCouncellor childItemsForItem:v10];

          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v12 = v11;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v24;
            do
            {
              uint64_t v16 = 0;
              do
              {
                if (*(void *)v24 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = SKUILibraryItemForStoreIdentifier(*(void **)(*((void *)&v23 + 1) + 8 * v16));
                [v4 addObject:v17];

                ++v16;
              }
              while (v14 != v16);
              uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v14);
          }

          ++v8;
        }
        while (v8 != v6);
        uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v6);
    }

    mediaLibraryQueue = self->_mediaLibraryQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__SKUIItemStateCenter__reloadStateForObservedMediaLibraryItems__block_invoke;
    block[3] = &unk_1E6421FF8;
    void block[4] = self;
    id v22 = v4;
    id v19 = v4;
    dispatch_async(mediaLibraryQueue, block);
  }
}

void __63__SKUIItemStateCenter__reloadStateForObservedMediaLibraryItems__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _copyItemsStatesForLibraryItems:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__SKUIItemStateCenter__reloadStateForObservedMediaLibraryItems__block_invoke_2;
  v6[3] = &unk_1E6421FF8;
  v6[4] = v3;
  id v7 = v2;
  id v5 = v2;
  dispatch_async(v4, v6);
}

void __63__SKUIItemStateCenter__reloadStateForObservedMediaLibraryItems__block_invoke_2(uint64_t a1)
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v64 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 88) mutableCopy];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v73 objects:v79 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v74;
    id v54 = v4;
    id v55 = v2;
    uint64_t v53 = *(void *)v74;
    do
    {
      uint64_t v8 = 0;
      uint64_t v63 = v6;
      do
      {
        if (*(void *)v74 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v73 + 1) + 8 * v8);
        id v10 = [v9 storeIdentifier];

        if (v10)
        {
          double v11 = [v9 storeIdentifier];
          uint64_t v12 = [v11 copy];
        }
        else
        {
          uint64_t v13 = v8;
          uint64_t v14 = [SKUIStoreIdentifier alloc];
          double v11 = [v9 storeItemIdentifier];
          uint64_t v15 = v14;
          uint64_t v8 = v13;
          uint64_t v12 = [(SKUIStoreIdentifier *)v15 initWithNumber:v11];
        }
        uint64_t v16 = (void *)v12;

        if (([v64 containsObject:v16] & 1) == 0)
        {
          uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 88) objectForKey:v16];
          id v18 = [*(id *)(a1 + 40) objectForKey:v9];
          if (v17)
          {
            uint64_t v19 = v7;
            id v20 = v2;
            id v21 = v4;
            id v22 = v17;
            uint64_t v23 = [v17 state];
            unint64_t v24 = [v18 state] | v23 & 0xFFFFFFFFFFFFFFBFLL;
            BOOL v25 = v23 == v24;
            uint64_t v17 = v22;
            id v4 = v21;
            id v2 = v20;
            uint64_t v7 = v19;
            if (!v25)
            {
              unint64_t v26 = v24;
              objc_msgSend(v17, "setLibraryContentFlags:", objc_msgSend(v18, "libraryContentFlags"));
              objc_msgSend(v17, "setMediaCategory:", objc_msgSend(v18, "mediaCategory"));
              [v17 setState:v26];
              long long v27 = [v18 variantIdentifier];
              [v17 setVariantIdentifier:v27];

              long long v28 = v2;
              long long v29 = v17;
              goto LABEL_14;
            }
          }
          else
          {
            [*(id *)(*(void *)(a1 + 32) + 88) setObject:v18 forKey:v16];
            long long v28 = v2;
            long long v29 = v18;
LABEL_14:
            [v28 addObject:v29];
          }
          if ([*(id *)(*(void *)(a1 + 32) + 152) itemHasParent:v16])
          {
            long long v30 = [*(id *)(*(void *)(a1 + 32) + 152) parentItemForItem:v16];
            if (([v64 containsObject:v30] & 1) == 0)
            {
              uint64_t v60 = v8;
              uint64_t v31 = [*(id *)(*(void *)(a1 + 32) + 152) siblingItemsForItem:v16];
              long long v32 = v30;
              uint64_t v33 = (void *)v31;
              long long v62 = v32;
              id v61 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "objectForKey:");
              if (!v61)
              {
                uint64_t v57 = v33;
                long long v34 = objc_alloc_init(SKUIItemState);
                uint64_t v35 = [v62 numberValue];
                [(SKUIItemState *)v34 setItemIdentifier:v35];

                [(SKUIItemState *)v34 setStoreIdentifier:v62];
                [(SKUIItemState *)v34 setState:0];
                id v61 = v34;
                uint64_t v36 = v34;
                uint64_t v33 = v57;
                [*(id *)(*(void *)(a1 + 32) + 88) setObject:v36 forKey:v62];
              }
              int v56 = v18;
              v58 = v17;
              long long v71 = 0u;
              long long v72 = 0u;
              long long v69 = 0u;
              long long v70 = 0u;
              id v37 = v33;
              uint64_t v38 = [v37 countByEnumeratingWithState:&v69 objects:v78 count:16];
              uint64_t v59 = v16;
              if (v38)
              {
                uint64_t v39 = v38;
                uint64_t v40 = *(void *)v70;
                uint64_t v41 = 64;
                do
                {
                  for (uint64_t i = 0; i != v39; ++i)
                  {
                    if (*(void *)v70 != v40) {
                      objc_enumerationMutation(v37);
                    }
                    uint64_t v43 = *(void **)(*((void *)&v69 + 1) + 8 * i);
                    uint64_t v44 = SKUILibraryItemForStoreIdentifier(v43);
                    long long v45 = [*(id *)(a1 + 40) objectForKey:v44];
                    v41 &= [v45 state];
                    [v64 addObject:v43];
                    [v3 removeObjectForKey:v43];
                  }
                  uint64_t v39 = [v37 countByEnumeratingWithState:&v69 objects:v78 count:16];
                }
                while (v39);
              }
              else
              {
                uint64_t v41 = 64;
              }

              objc_msgSend(v61, "setState:", objc_msgSend(v61, "state") | v41);
              id v2 = v55;
              [v55 addObject:v61];
              [v64 addObject:v62];
              [v3 removeObjectForKey:v62];

              long long v30 = v62;
              uint64_t v7 = v53;
              id v4 = v54;
              uint64_t v16 = v59;
              uint64_t v8 = v60;
              id v18 = v56;
              uint64_t v17 = v58;
            }
          }
          [v3 removeObjectForKey:v16];

          uint64_t v6 = v63;
        }

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v73 objects:v79 count:16];
    }
    while (v6);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v46 = v3;
  uint64_t v47 = [v46 countByEnumeratingWithState:&v65 objects:v77 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v48; ++j)
      {
        if (*(void *)v66 != v49) {
          objc_enumerationMutation(v46);
        }
        long long v51 = [*(id *)(a1 + 32) _removeState:64 forItemIdentifier:*(void *)(*((void *)&v65 + 1) + 8 * j)];
        long long v52 = v51;
        if (v51)
        {
          [v51 setLibraryContentFlags:0];
          [v2 addObject:v52];
        }
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v65 objects:v77 count:16];
    }
    while (v48);
  }

  if ([v2 count]) {
    [*(id *)(a1 + 32) _notifyObserversOfStateChanges:v2];
  }
  [*(id *)(a1 + 32) _notifyObserversOfMediaLibraryChange];
}

- (void)_mediaLibraryDidChangeNotification:(id)a3
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SKUIItemStateCenter__mediaLibraryDidChangeNotification___block_invoke;
  block[3] = &unk_1E6422020;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __58__SKUIItemStateCenter__mediaLibraryDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadStateForObservedMediaLibraryItems];
}

- (void)_restrictionsChangedNotification:(id)a3
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SKUIItemStateCenter__restrictionsChangedNotification___block_invoke;
  block[3] = &unk_1E6422020;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __56__SKUIItemStateCenter__restrictionsChangedNotification___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned __int8 *)(v1 + 16) == 255)
  {
    uint64_t v4 = *(void *)(v1 + 136);
    uint64_t v3 = (void *)(v1 + 136);
    if (v4 == -1) {
      return result;
    }
  }
  else
  {
    *(unsigned char *)(v1 + 16) = -1;
    id v2 = *(void **)(result + 32);
    uint64_t v3 = v2 + 17;
    if (v2[17] == -1) {
      return [v2 _notifyObserversOfRestrictionsChange];
    }
  }
  *uint64_t v3 = -1;
  id v2 = *(void **)(result + 32);
  return [v2 _notifyObserversOfRestrictionsChange];
}

- (void)_storefrontDidChangeNotification:(id)a3
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SKUIItemStateCenter__storefrontDidChangeNotification___block_invoke;
  block[3] = &unk_1E6422020;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __56__SKUIItemStateCenter__storefrontDidChangeNotification___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 64) != 1) {
    *(void *)(v1 + 64) = 0;
  }
  return result;
}

- (id)_addState:(unint64_t)a3 forItemIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(NSMutableDictionary *)self->_itemStates objectForKey:v6];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = [(SKUIItemState *)v7 state];
    if ((v9 & a3) == 0)
    {
      [(SKUIItemState *)v8 setState:v9 | a3];
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (v6)
  {
    uint64_t v8 = objc_alloc_init(SKUIItemState);
    id v10 = [v6 numberValue];
    [(SKUIItemState *)v8 setItemIdentifier:v10];

    [(SKUIItemState *)v8 setStoreIdentifier:v6];
    [(SKUIItemState *)v8 setState:a3];
    [(NSMutableDictionary *)self->_itemStates setObject:v8 forKey:v6];
    goto LABEL_16;
  }
  uint64_t v8 = [MEMORY[0x1E4FA81D8] sharedConfig];
  int v11 = [(SKUIItemState *)v8 shouldLog];
  if ([(SKUIItemState *)v8 shouldLogToDisk]) {
    int v12 = v11 | 2;
  }
  else {
    int v12 = v11;
  }
  uint64_t v13 = [(SKUIItemState *)v8 OSLogObject];
  if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    v12 &= 2u;
  }
  if (!v12) {
    goto LABEL_14;
  }
  LODWORD(v18) = 138412290;
  *(void *)((char *)&v18 + 4) = objc_opt_class();
  id v14 = *(id *)((char *)&v18 + 4);
  LODWORD(v17) = 12;
  uint64_t v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v18, v17, v18);
    free(v15);
    SSFileLog();
LABEL_14:
  }
LABEL_15:

  uint64_t v8 = 0;
LABEL_16:

  return v8;
}

- (id)_appstoredUpdatesStore
{
  if (!self->_appstoredUpdatesStore)
  {
    uint64_t v3 = (ASDSoftwareUpdatesStore *)objc_alloc_init(MEMORY[0x1E4F4BCD8]);
    appstoredUpdatesStore = self->_appstoredUpdatesStore;
    self->_appstoredUpdatesStore = v3;

    if ([(ASDSoftwareUpdatesStore *)self->_appstoredUpdatesStore hasEntitlement])
    {
      uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 addObserver:self selector:sel__appstoredUpdatesStoreChangeNotification_ name:*MEMORY[0x1E4F4BBA8] object:self->_appstoredUpdatesStore];
    }
  }
  id v6 = self->_appstoredUpdatesStore;

  return v6;
}

- (id)_copyItemsStatesForLibraryItems:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F28E10];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithKeyOptions:0 valueOptions:0 capacity:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__SKUIItemStateCenter__copyItemsStatesForLibraryItems___block_invoke;
  v9[3] = &unk_1E6423AF0;
  id v7 = v6;
  id v10 = v7;
  [(SKUIItemStateCenter *)self _enumerateAvailableItemsForLibraryItems:v5 usingBlock:v9];

  return v7;
}

void __55__SKUIItemStateCenter__copyItemsStatesForLibraryItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  id v6 = objc_alloc_init(SKUIItemState);
  id v7 = [v18 storeItemIdentifier];
  [(SKUIItemState *)v6 setItemIdentifier:v7];

  uint64_t v8 = [v18 storeIdentifier];
  [(SKUIItemState *)v6 setStoreIdentifier:v8];

  uint64_t v9 = [v5 isPreview];
  uint64_t v10 = [v5 availability];
  uint64_t v11 = 64;
  uint64_t v12 = 8;
  if (v10 != 1) {
    uint64_t v12 = 0;
  }
  if (v10 != 2) {
    uint64_t v11 = v12;
  }
  if (v10 == 3) {
    uint64_t v13 = 64;
  }
  else {
    uint64_t v13 = v11;
  }
  if (v10 == 3) {
    uint64_t v14 = v9 | 2;
  }
  else {
    uint64_t v14 = v9;
  }
  [(SKUIItemState *)v6 setLibraryContentFlags:v14];
  [(SKUIItemState *)v6 setState:v13];
  uint64_t v15 = [v5 itemStateVariantIdentifier];
  [(SKUIItemState *)v6 setVariantIdentifier:v15];

  char v16 = [v5 AVTypes];
  if ((v16 & 2) != 0)
  {
    uint64_t v17 = 3;
  }
  else if ((v16 & 4) != 0)
  {
    uint64_t v17 = 4;
  }
  else if (v16)
  {
    uint64_t v17 = 2;
  }
  else
  {
    if ((v16 & 8) == 0) {
      goto LABEL_20;
    }
    uint64_t v17 = 5;
  }
  [(SKUIItemState *)v6 setMediaCategory:v17];
LABEL_20:
  [*(id *)(a1 + 32) setObject:v6 forKey:v18];
}

- (void)_enumerateAvailableItemsForLibraryItems:(id)a3 usingBlock:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = self->_mediaLibraries;
  uint64_t v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  uint64_t v17 = v8;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      uint64_t v14 = v8;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __74__SKUIItemStateCenter__enumerateAvailableItemsForLibraryItems_usingBlock___block_invoke;
        v19[3] = &unk_1E6423B18;
        id v16 = v9;
        id v20 = v16;
        id v21 = v7;
        objc_msgSend(v15, "enumerateStatesForLibraryItems:usingBlock:", v14, v19, v17);
        id v8 = v16;

        id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        ++v13;
        uint64_t v14 = v8;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }
}

void __74__SKUIItemStateCenter__enumerateAvailableItemsForLibraryItems_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  id v5 = a2;
  if ([v6 availability]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (void)_fireFinishLoadBlocksIfNecessary
{
  if (!self->_loadCount)
  {
    if ([(NSMutableArray *)self->_finishLoadBlocks count])
    {
      uint64_t v3 = (void *)[(NSMutableArray *)self->_finishLoadBlocks copy];
      [(NSMutableArray *)self->_finishLoadBlocks removeAllObjects];
      observerQueue = self->_observerQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__SKUIItemStateCenter__fireFinishLoadBlocksIfNecessary__block_invoke;
      block[3] = &unk_1E6422020;
      id v7 = v3;
      id v5 = v3;
      dispatch_async(observerQueue, block);
    }
  }
}

void __55__SKUIItemStateCenter__fireFinishLoadBlocksIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (BOOL)_gratisStateIsValid
{
  if (!self->_gratisState || !self->_gratisStateLastUpdate) {
    return 0;
  }
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSinceDate:self->_gratisStateLastUpdate];
  BOOL v5 = v4 <= 604800.0;

  return v5;
}

- (id)_downloadPhaseForJobPhase:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    uint64_t v3 = (id *)MEMORY[0x1E4FA8530];
  }
  else {
    uint64_t v3 = (id *)qword_1E6423D18[a3];
  }
  id v4 = *v3;

  return v4;
}

- (id)_newPurchaseWithItem:(id)a3 offer:(id)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v8 = [v7 actionParameters];
  if (!v8)
  {
    id v10 = 0;
    goto LABEL_39;
  }
  long long v9 = (objc_class *)objc_opt_class();
  if (SKUIItemKindIsToneKind([v6 itemKind])) {
    long long v9 = (objc_class *)objc_opt_class();
  }
  id v10 = objc_alloc_init(v9);
  [v10 setBuyParameters:v8];
  objc_msgSend(v10, "setExpectedDownloadFileSize:", objc_msgSend(v7, "fileSize"));
  uint64_t v11 = [v6 requiredCapabilities];
  [v10 setRequiredDeviceCapabilities:v11];

  [v10 setUsesLocalRedownloadParametersIfPossible:1];
  uint64_t v12 = [v6 bundleIdentifier];
  [v10 setValue:v12 forDownloadProperty:*MEMORY[0x1E4FA8548]];
  uint64_t v13 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v6, "itemIdentifier"));
  [v10 setValue:v13 forDownloadProperty:*MEMORY[0x1E4FA8630]];
  uint64_t v14 = [v6 artistName];
  [v10 setValue:v14 forDownloadProperty:*MEMORY[0x1E4FA8538]];

  uint64_t v15 = [v6 _downloadKind];
  [v10 setValue:v15 forDownloadProperty:*MEMORY[0x1E4FA85E0]];

  id v16 = [v6 title];
  [v10 setValue:v16 forDownloadProperty:*MEMORY[0x1E4FA8660]];

  if ([v6 isNewsstandApp]) {
    [v10 setValue:*MEMORY[0x1E4FA8670] forDownloadProperty:*MEMORY[0x1E4FA8620]];
  }
  if ([v6 hasPrerenderedArtwork])
  {
    uint64_t v17 = [NSNumber numberWithBool:1];
    [v10 setValue:v17 forDownloadProperty:*MEMORY[0x1E4FA8540]];
  }
  id v18 = [v7 variantIdentifier];
  int v19 = [v18 isEqualToString:@"HD"];

  if (v19) {
    [v10 setValue:MEMORY[0x1E4F1CC38] forDownloadProperty:*MEMORY[0x1E4FA85B0]];
  }
  if ([v6 itemKind] == 18) {
    [v10 setEnabledServiceType:&unk_1F1D61BC8];
  }
  if ([(SKUIItemStateCenter *)self _isPurchaseForOffDeviceContent:v6])
  {
    [v10 setCreatesDownloads:0];
    [v10 setCreatesJobs:0];
  }
  uint64_t v20 = [v7 offerType];
  if (v20 == 3)
  {
    uint64_t v21 = *MEMORY[0x1E4FA85C8];
    long long v23 = (void *)MEMORY[0x1E4F1CC38];
    long long v22 = v10;
    goto LABEL_19;
  }
  if (v20 == 2)
  {
    uint64_t v21 = *MEMORY[0x1E4FA8638];
    long long v22 = v10;
    long long v23 = v13;
LABEL_19:
    [v22 setValue:v23 forDownloadProperty:v21];
  }
  long long v24 = [[SKUIStoreIdentifier alloc] initWithNumber:v13];
  long long v25 = [(NSMutableDictionary *)self->_itemStates objectForKey:v24];
  unint64_t v26 = v25;
  if (v25)
  {
    int v27 = [v25 state];
    int v28 = v27;
    if ((v27 & 8) != 0)
    {
      [v10 setValue:MEMORY[0x1E4F1CC38] forDownloadProperty:*MEMORY[0x1E4FA85C0]];
    }
    else if ((v27 & 0x10) != 0)
    {
      if (v12)
      {
        v41[0] = v12;
        long long v29 = (void *)MEMORY[0x1E4F1C978];
        long long v30 = (void **)v41;
      }
      else
      {
        uint64_t v40 = v13;
        long long v29 = (void *)MEMORY[0x1E4F1C978];
        long long v30 = &v40;
      }
      uint64_t v31 = [v29 arrayWithObjects:v30 count:1];
      [v10 setGratisIdentifiers:v31];
    }
    if ((~v28 & 0x24) == 0)
    {
      long long v32 = [v10 requestProperties];
      id v33 = (id)[v32 mutableCopy];

      if (!v33) {
        id v33 = objc_alloc_init(MEMORY[0x1E4FA8268]);
      }
      [v33 setURLBagKey:@"updateProduct"];
      [v10 setRequestProperties:v33];
    }
  }
  if ([v6 hasMessagesExtension]
    && [v7 shouldEnableMessagesExtension])
  {
    [v10 setValue:&unk_1F1D61BE0 forDownloadProperty:*MEMORY[0x1E4FA8598]];
  }
  long long v34 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v34 scale];
  if (v35 <= 1.0) {
    uint64_t v36 = 64;
  }
  else {
    uint64_t v36 = 128;
  }

  id v37 = [v6 artworkURLForSize:v36];
  uint64_t v38 = [v37 absoluteString];
  [v10 setValue:v38 forDownloadProperty:*MEMORY[0x1E4FA8650]];

LABEL_39:
  return v10;
}

- (id)_newSoftwarePurchaseWithItem:(id)a3 offer:(id)a4
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v8 = [v7 actionParameters];
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F4BC70]);
    [v9 setBuyParameters:v8];
    id v10 = [v6 requiredCapabilities];

    if (v10)
    {
      uint64_t v11 = [v6 requiredCapabilities];
      [v9 setRequiredCapabilities:v11];
    }
    uint64_t v12 = [v6 bundleIdentifier];
    [v9 setBundleID:v12];
    uint64_t v13 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v6, "itemIdentifier"));
    [v9 setItemID:v13];
    uint64_t v14 = [v6 artistName];
    [v9 setVendorName:v14];

    uint64_t v15 = [v6 title];
    [v9 setItemName:v15];

    if ([(SKUIItemStateCenter *)self _isPurchaseForOffDeviceContent:v6]) {
      [v9 setCreatesJobs:0];
    }
    id v16 = [[SKUIStoreIdentifier alloc] initWithNumber:v13];
    uint64_t v17 = [(NSMutableDictionary *)self->_itemStates objectForKey:v16];
    id v18 = v17;
    if (v17)
    {
      int v19 = [v17 state];
      int v20 = v19;
      if ((v19 & 8) != 0)
      {
        [v9 setIsRedownload:1];
      }
      else if ((v19 & 0x10) != 0)
      {
        if (v12)
        {
          v38[0] = v12;
          uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
          [v9 setGratisIdentifiers:v21];
        }
        else
        {
          double v35 = [MEMORY[0x1E4FA81D8] sharedConfig];
          int v32 = [v35 shouldLog];
          int v23 = [v35 shouldLogToDisk];
          int v24 = v32 | 2;
          if (!v23) {
            int v24 = v32;
          }
          int v30 = v24;
          id v33 = [v35 OSLogObject];
          BOOL v25 = os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG);
          int v26 = v30 & 2;
          if (v25) {
            int v26 = v30;
          }
          if (v26)
          {
            int v36 = 138412290;
            id v37 = (id)objc_opt_class();
            id v29 = v37;
            LODWORD(v28) = 12;
            int v27 = &v36;
            uint64_t v31 = (void *)_os_log_send_and_compose_impl();

            if (v31)
            {
              objc_msgSend(NSString, "stringWithCString:encoding:", v31, 4, &v36, v28);
              long long v34 = (int *)objc_claimAutoreleasedReturnValue();
              free(v31);
              int v27 = v34;
              SSFileLog();
            }
          }
          else
          {
          }
        }
      }
      if ((~v20 & 0x24) == 0) {
        [v9 setBagKey:@"updateProduct"];
      }
    }
    if (objc_msgSend(v6, "hasMessagesExtension", v27)
      && [v7 shouldEnableMessagesExtension])
    {
      [v9 setExtensionsToEnable:1];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_newPurchasesWithBundleItem:(id)a3 bundleOffer:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = [v6 childItemIdentifiers];
  uint64_t v11 = [v10 count];

  uint64_t v12 = [v6 loadedChildItems];
  if ([v12 count] == v11)
  {
    uint64_t v29 = v11;
    int v30 = v12;
    id v31 = v7;
    id v32 = v8;
    id v33 = v6;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = 0;
      uint64_t v17 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(v13);
          }
          int v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          itemStates = self->_itemStates;
          uint64_t v21 = [v19 storeIdentifier];
          long long v22 = [(NSMutableDictionary *)itemStates objectForKey:v21];

          char v23 = [v22 state];
          if ((v23 & 1) == 0)
          {
            if ((v23 & 6) != 0)
            {
              ++v16;
            }
            else if ((v23 & 8) != 0)
            {
              int v24 = [v19 primaryItemOffer];
              id v25 = [(SKUIItemStateCenter *)self _newPurchaseWithItem:v19 offer:v24];

              if (v25) {
                [v9 addObject:v25];
              }
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v15);
    }
    else
    {
      uint64_t v16 = 0;
    }

    id v8 = v32;
    id v6 = v33;
    uint64_t v12 = v30;
    id v7 = v31;
    uint64_t v11 = v29;
  }
  else
  {
    uint64_t v16 = 0;
  }
  if (v11 >= 1 && [v9 count] + v16 == v11)
  {
    [v8 addObjectsFromArray:v9];
  }
  else
  {
    id v26 = [(SKUIItemStateCenter *)self _newPurchaseWithItem:v6 offer:v7];
    int v27 = v26;
    if (v26)
    {
      [v26 setValue:MEMORY[0x1E4F1CC38] forDownloadProperty:*MEMORY[0x1E4FA8610]];
      [v8 addObject:v27];
    }
  }
  return v8;
}

- (id)_newPurchasesForSoftwareWithBundleItem:(id)a3 bundleOffer:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = [v6 childItemIdentifiers];
  uint64_t v11 = [v10 count];

  uint64_t v12 = [v6 loadedChildItems];
  if ([v12 count] == v11)
  {
    uint64_t v29 = v11;
    int v30 = v12;
    id v31 = v7;
    id v32 = v8;
    id v33 = v6;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = 0;
      uint64_t v17 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(v13);
          }
          int v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          itemStates = self->_itemStates;
          uint64_t v21 = [v19 storeIdentifier];
          long long v22 = [(NSMutableDictionary *)itemStates objectForKey:v21];

          char v23 = [v22 state];
          if ((v23 & 1) == 0)
          {
            if ((v23 & 6) != 0)
            {
              ++v16;
            }
            else if ((v23 & 8) != 0)
            {
              int v24 = [v19 primaryItemOffer];
              id v25 = [(SKUIItemStateCenter *)self _newSoftwarePurchaseWithItem:v19 offer:v24];

              if (v25) {
                [v9 addObject:v25];
              }
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v15);
    }
    else
    {
      uint64_t v16 = 0;
    }

    id v8 = v32;
    id v6 = v33;
    uint64_t v12 = v30;
    id v7 = v31;
    uint64_t v11 = v29;
  }
  else
  {
    uint64_t v16 = 0;
  }
  if (v11 >= 1 && [v9 count] + v16 == v11)
  {
    [v8 addObjectsFromArray:v9];
  }
  else
  {
    id v26 = [(SKUIItemStateCenter *)self _newSoftwarePurchaseWithItem:v6 offer:v7];
    int v27 = v26;
    if (v26)
    {
      [v26 setShouldCancelForInstalledBundleItems:1];
      [v8 addObject:v27];
    }
  }
  return v8;
}

- (id)_newPurchasesWithItems:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
        uint64_t v12 = (void *)MEMORY[0x1C8749310](v7);
        uint64_t v13 = objc_msgSend(v11, "itemKind", (void)v17);
        uint64_t v14 = [v11 primaryItemOffer];
        if (v13 == 17)
        {
          id v15 = [(SKUIItemStateCenter *)self _newPurchasesWithBundleItem:v11 bundleOffer:v14];

          if (v15) {
            [v5 addObjectsFromArray:v15];
          }
        }
        else
        {
          id v15 = [(SKUIItemStateCenter *)self _newPurchaseWithItem:v11 offer:v14];

          if (v15) {
            [v5 addObject:v15];
          }
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v8 = v7;
    }
    while (v7);
  }

  return v5;
}

- (void)_notifyObserversOfMediaLibraryChange
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_observers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v3 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  if ([v3 count])
  {
    observerQueue = self->_observerQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__SKUIItemStateCenter__notifyObserversOfMediaLibraryChange__block_invoke;
    v11[3] = &unk_1E6421FF8;
    id v12 = v3;
    uint64_t v13 = self;
    dispatch_async(observerQueue, v11);
  }
}

void __59__SKUIItemStateCenter__notifyObserversOfMediaLibraryChange__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "itemStateCenterMediaLibrariesDidChange:", *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_notifyObserversOfStateChange:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  id v6 = (id)objc_msgSend([v4 alloc], "initWithObjects:", v5, 0);

  [(SKUIItemStateCenter *)self _notifyObserversOfStateChanges:v6];
}

- (void)_notifyObserversOfRestrictionsChange
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = self->_observers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v3 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  if ([v3 count])
  {
    observerQueue = self->_observerQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__SKUIItemStateCenter__notifyObserversOfRestrictionsChange__block_invoke;
    v11[3] = &unk_1E6421FF8;
    id v12 = v3;
    uint64_t v13 = self;
    dispatch_async(observerQueue, v11);
  }
}

void __59__SKUIItemStateCenter__notifyObserversOfRestrictionsChange__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "itemStateCenterRestrictionsChanged:", *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_notifyObserversOfStateChanges:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v6 = self->_observers;
    uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            [v5 addObject:v11];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    if ([v5 count])
    {
      observerQueue = self->_observerQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__SKUIItemStateCenter__notifyObserversOfStateChanges___block_invoke;
      block[3] = &unk_1E64225B0;
      id v14 = v5;
      long long v15 = self;
      id v16 = v4;
      dispatch_async(observerQueue, block);
    }
  }
}

void __54__SKUIItemStateCenter__notifyObserversOfStateChanges___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "itemStateCenter:itemStatesChanged:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_notifyObserversOfPurchasesResponses:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__SKUIItemStateCenter__notifyObserversOfPurchasesResponses___block_invoke;
  v7[3] = &unk_1E6421FF8;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __60__SKUIItemStateCenter__notifyObserversOfPurchasesResponses___block_invoke(int8x16_t *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(id)a1[2].i64[0] count])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v3 = *(id *)(a1[2].i64[1] + 128);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v16;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * v7);
          if (objc_opt_respondsToSelector()) {
            [v2 addObject:v8];
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v5);
    }

    if ([v2 count])
    {
      long long v9 = *(NSObject **)(a1[2].i64[1] + 120);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__SKUIItemStateCenter__notifyObserversOfPurchasesResponses___block_invoke_2;
      block[3] = &unk_1E64225B0;
      id v13 = v2;
      int8x16_t v11 = a1[2];
      id v10 = (id)v11.i64[0];
      int8x16_t v14 = vextq_s8(v11, v11, 8uLL);
      dispatch_async(v9, block);
    }
  }
}

void __60__SKUIItemStateCenter__notifyObserversOfPurchasesResponses___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "itemStateCenter:didFinishPurchases:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_notifyObserversOfSoftwarePurchasesResponses:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__SKUIItemStateCenter__notifyObserversOfSoftwarePurchasesResponses___block_invoke;
  v7[3] = &unk_1E6421FF8;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __68__SKUIItemStateCenter__notifyObserversOfSoftwarePurchasesResponses___block_invoke(int8x16_t *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(id)a1[2].i64[0] count])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v3 = *(id *)(a1[2].i64[1] + 128);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v16;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * v7);
          if (objc_opt_respondsToSelector()) {
            [v2 addObject:v8];
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v5);
    }

    if ([v2 count])
    {
      long long v9 = *(NSObject **)(a1[2].i64[1] + 120);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68__SKUIItemStateCenter__notifyObserversOfSoftwarePurchasesResponses___block_invoke_2;
      block[3] = &unk_1E64225B0;
      id v13 = v2;
      int8x16_t v11 = a1[2];
      id v10 = (id)v11.i64[0];
      int8x16_t v14 = vextq_s8(v11, v11, 8uLL);
      dispatch_async(v9, block);
    }
  }
}

void __68__SKUIItemStateCenter__notifyObserversOfSoftwarePurchasesResponses___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "itemStateCenter:didFinishSoftwarePurchases:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_performPurchases:(id)a3 hasBundlePurchase:(BOOL)a4 withClientContext:(id)a5 completionBlock:(id)a6
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v49 = a5;
  id v41 = a6;
  id v45 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
  if (v9)
  {
    uint64_t v48 = *(void *)v71;
    uint64_t v10 = *MEMORY[0x1E4FA8630];
    uint64_t v44 = *MEMORY[0x1E4FA85B0];
    uint64_t v43 = *MEMORY[0x1E4FA85C8];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v71 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        id v13 = [v12 valueForDownloadProperty:v10];
        if (v13)
        {
          int8x16_t v14 = [[SKUIStoreIdentifier alloc] initWithNumber:v13];
          long long v15 = [(SKUIItemStateCenter *)self _addState:1 forItemIdentifier:v14];
          if (v15)
          {
            id v16 = v12;
            long long v17 = [v16 valueForDownloadProperty:v44];
            int v18 = [v17 BOOLValue];

            long long v19 = [v16 valueForDownloadProperty:v43];

            int v20 = [v19 BOOLValue];
            uint64_t v21 = @"buy";
            if (v20) {
              uint64_t v21 = @"rent";
            }
            uint64_t v22 = @"buy_HD";
            if (v20) {
              uint64_t v22 = @"rent_HD";
            }
            if (v18) {
              char v23 = v22;
            }
            else {
              char v23 = v21;
            }
            [v15 setVariantIdentifier:v23];
            [v45 addObject:v15];
          }
        }
        [v49 customizePurchase:v12];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
    }
    while (v9);
  }

  if ([v45 count]) {
    [(SKUIItemStateCenter *)self _notifyObserversOfStateChanges:v45];
  }
  if ([obj count] == 1)
  {
    int v24 = [obj lastObject];
    id v25 = [v24 valueForDownloadProperty:*MEMORY[0x1E4FA85C8]];
    [v25 BOOLValue];
  }
  if ([obj count] == 1)
  {
    id v26 = [obj lastObject];
    int v27 = [v26 valueForDownloadProperty:*MEMORY[0x1E4FA85E0]];
    int IsSoftwareKind = SSDownloadKindIsSoftwareKind();
    if (IsSoftwareKind) {
      int v29 = [v26 createsJobs] ^ 1;
    }
    else {
      int v29 = 0;
    }
    if (SSDownloadKindIsEBookKind())
    {
      id v31 = [v26 valueForDownloadProperty:*MEMORY[0x1E4FA8638]];
      BOOL v30 = v31 == 0;
    }
    else
    {
      BOOL v30 = 0;
    }
  }
  else
  {
    int v29 = 0;
    int IsSoftwareKind = 0;
    BOOL v30 = 0;
  }
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v33 = [MEMORY[0x1E4FA8390] weakReferenceWithObject:self];
  long long v34 = (void *)[objc_alloc(MEMORY[0x1E4FA8278]) initWithPurchases:obj];
  long long v35 = v34;
  if (IsSoftwareKind) {
    [v34 setCreatesDownloads:0];
  }
  if (v29) {
    [v35 setCreatesJobs:0];
  }
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x2020000000;
  char v69 = 0;
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __93__SKUIItemStateCenter__performPurchases_hasBundlePurchase_withClientContext_completionBlock___block_invoke;
  v60[3] = &unk_1E6423B40;
  id v61 = v33;
  uint64_t v63 = v68;
  char v64 = IsSoftwareKind;
  BOOL v65 = v30;
  BOOL v66 = a4;
  char v67 = v29;
  id v62 = v32;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __93__SKUIItemStateCenter__performPurchases_hasBundlePurchase_withClientContext_completionBlock___block_invoke_2;
  v50[3] = &unk_1E6423B68;
  BOOL v36 = v30;
  id v37 = v61;
  id v51 = v37;
  id v38 = obj;
  id v52 = v38;
  id v39 = v62;
  id v53 = v39;
  id v40 = v41;
  char v56 = IsSoftwareKind;
  BOOL v57 = v36;
  BOOL v58 = a4;
  char v59 = v29;
  id v54 = v40;
  id v55 = v68;
  [v35 startWithPurchaseResponseBlock:v60 completionBlock:v50];

  _Block_object_dispose(v68, 8);
}

void __93__SKUIItemStateCenter__performPurchases_hasBundlePurchase_withClientContext_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) object];
  uint64_t v4 = [v9 purchase];
  uint64_t v5 = [v4 valueForDownloadProperty:*MEMORY[0x1E4FA8630]];

  if (v5)
  {
    uint64_t v6 = [[SKUIStoreIdentifier alloc] initWithNumber:v5];
    long long v7 = [v9 error];

    if (v7) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    if (!*(unsigned char *)(a1 + 56) && !*(unsigned char *)(a1 + 57) || *(unsigned char *)(a1 + 58) || *(unsigned char *)(a1 + 59))
    {
      id v8 = [v9 downloadIdentifiers];
      [v3 _replacePurchasingItem:v6 withDownloadIDs:v8];
    }
    [v3 evaluatePurchaseResponseForRentals:v9];
  }
  [*(id *)(a1 + 40) addObject:v9];
}

void __93__SKUIItemStateCenter__performPurchases_hasBundlePurchase_withClientContext_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) object];
  if (![*(id *)(a1 + 40) count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA8280]);
    [v4 setError:v6];
    [*(id *)(a1 + 48) addObject:v4];
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, *(void *)(a1 + 48));
  }
  [v3 _notifyObserversOfPurchasesResponses:*(void *)(a1 + 48)];
  if (!*(unsigned char *)(a1 + 72) && !*(unsigned char *)(a1 + 73)
    || *(unsigned char *)(a1 + 74)
    || *(unsigned char *)(a1 + 75)
    || *(unsigned char *)(a1 + 72) && *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
    || *(unsigned char *)(a1 + 73) && *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    [v3 _removePurchasingItemsForPurchases:*(void *)(a1 + 40)];
  }
}

- (void)_performSoftwarePurchases:(id)a3 withClientContext:(id)a4 completionBlock:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v21 = a5;
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        int8x16_t v14 = [v13 itemID];
        if (v14)
        {
          long long v15 = [[SKUIStoreIdentifier alloc] initWithNumber:v14];
          id v16 = [(SKUIItemStateCenter *)self _addState:1 forItemIdentifier:v15];
          if (v16) {
            [v22 addObject:v16];
          }
        }
        [v9 customizeSoftwarePurchase:v13];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v10);
  }

  if ([v22 count]) {
    [(SKUIItemStateCenter *)self _notifyObserversOfStateChanges:v22];
  }
  long long v17 = (void *)[objc_alloc(MEMORY[0x1E4F4BCA8]) initWithPurchases:obj];
  int v18 = (void *)[objc_alloc(MEMORY[0x1E4F4BCA0]) initWithOptions:v17];
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __83__SKUIItemStateCenter__performSoftwarePurchases_withClientContext_completionBlock___block_invoke;
  v24[3] = &unk_1E6423B90;
  objc_copyWeak(&v27, &location);
  id v19 = v21;
  id v26 = v19;
  id v20 = obj;
  id v25 = v20;
  [v18 startWithCompletionBlock:v24];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __83__SKUIItemStateCenter__performSoftwarePurchases_withClientContext_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v16 = v7;
  uint64_t v10 = [v16 items];
  uint64_t v11 = [v10 count];

  uint64_t v12 = v16;
  if (!v11)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F4BCB0]);
    uint64_t v12 = (void *)[v13 initWithPurchaseResponseItems:MEMORY[0x1E4F1CBF0]];

    [v16 setError:v8];
  }
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v12);
  }
  long long v15 = [v16 items];
  [WeakRetained _notifyObserversOfSoftwarePurchasesResponses:v15];

  [WeakRetained _updatesSoftwarePurchasingItemsForPurchases:*(void *)(a1 + 32) purchaseWasSuccessful:a2];
}

- (id)_purchaseHistoryDatabase
{
  int canAccessPurchaseHistory = self->_canAccessPurchaseHistory;
  if (canAccessPurchaseHistory == 255)
  {
    id v4 = [MEMORY[0x1E4FA8110] databasePath];
    uint64_t v5 = [v4 stringByDeletingLastPathComponent];
    self->_int canAccessPurchaseHistory = SSFileIsLocalWritable();

    int canAccessPurchaseHistory = self->_canAccessPurchaseHistory;
  }
  if (canAccessPurchaseHistory && !self->_purchaseHistoryDatabase)
  {
    id v6 = (SSAppPurchaseHistoryDatabase *)[MEMORY[0x1E4FA8108] newDefaultInstance];
    purchaseHistoryDatabase = self->_purchaseHistoryDatabase;
    self->_purchaseHistoryDatabase = v6;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)__PurchaseHistoryChangeNotification, (CFStringRef)*MEMORY[0x1E4FA83C0], 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  id v9 = self->_purchaseHistoryDatabase;

  return v9;
}

- (void)_reloadAppUpdatesStore
{
  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SKUIItemStateCenter__reloadAppUpdatesStore__block_invoke;
  block[3] = &unk_1E6422160;
  void block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async(accessQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __45__SKUIItemStateCenter__reloadAppUpdatesStore__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _appstoredUpdatesStore];
  if ([v2 hasEntitlement])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __45__SKUIItemStateCenter__reloadAppUpdatesStore__block_invoke_2;
    v3[3] = &unk_1E6423BB8;
    objc_copyWeak(&v4, (id *)(a1 + 40));
    [v2 getUpdatesWithCompletionBlock:v3];
    ++*(void *)(*(void *)(a1 + 32) + 80);
    objc_destroyWeak(&v4);
  }
}

void __45__SKUIItemStateCenter__reloadAppUpdatesStore__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setAvailableAppstoredUpdatesWithUpdates:v3 decrementLoadCount:1];
}

- (void)_reloadDownloadManager
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SKUIItemStateCenter__reloadDownloadManager__block_invoke;
  block[3] = &unk_1E6422020;
  void block[4] = self;
  dispatch_async(accessQueue, block);
  objc_initWeak(&location, self);
  downloadManager = self->_downloadManager;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__SKUIItemStateCenter__reloadDownloadManager__block_invoke_2;
  v5[3] = &unk_1E6423BB8;
  objc_copyWeak(&v6, &location);
  [(SSDownloadManager *)downloadManager getDownloadsUsingBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __45__SKUIItemStateCenter__reloadDownloadManager__block_invoke(uint64_t result)
{
  return result;
}

void __45__SKUIItemStateCenter__reloadDownloadManager__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setDownloads:v3];
}

- (void)_reloadJobManager
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SKUIItemStateCenter__reloadJobManager__block_invoke;
  block[3] = &unk_1E6422020;
  void block[4] = self;
  dispatch_async(accessQueue, block);
  objc_initWeak(&location, self);
  jobManager = self->_jobManager;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__SKUIItemStateCenter__reloadJobManager__block_invoke_2;
  v5[3] = &unk_1E6423BB8;
  objc_copyWeak(&v6, &location);
  [(ASDJobManager *)jobManager getJobsUsingBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __40__SKUIItemStateCenter__reloadJobManager__block_invoke(uint64_t result)
{
  return result;
}

void __40__SKUIItemStateCenter__reloadJobManager__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setJobs:v3];
}

- (void)_reloadMediaLibraryStateForItems:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SKUIItemStateCenter__reloadMediaLibraryStateForItems___block_invoke;
  v7[3] = &unk_1E6421FF8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __56__SKUIItemStateCenter__reloadMediaLibraryStateForItems___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v27;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v27 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*(void *)(a1 + 40) + 152);
        id v8 = [*(id *)(*((void *)&v26 + 1) + 8 * v6) storeIdentifier];
        id v9 = [v7 childItemsForItem:v8];

        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v23;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = SKUILibraryItemForStoreIdentifier(*(void **)(*((void *)&v22 + 1) + 8 * v14));
              [v2 addObject:v15];

              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v12);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v4);
  }

  uint64_t v16 = *(void *)(a1 + 40);
  long long v17 = *(NSObject **)(v16 + 96);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SKUIItemStateCenter__reloadMediaLibraryStateForItems___block_invoke_2;
  block[3] = &unk_1E6421FF8;
  void block[4] = v16;
  id v21 = v2;
  id v18 = v2;
  dispatch_async(v17, block);
}

void __56__SKUIItemStateCenter__reloadMediaLibraryStateForItems___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) _copyItemsStatesForLibraryItems:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__SKUIItemStateCenter__reloadMediaLibraryStateForItems___block_invoke_3;
  v6[3] = &unk_1E6421FF8;
  id v7 = v2;
  uint64_t v8 = v3;
  id v5 = v2;
  dispatch_async(v4, v6);
}

void __56__SKUIItemStateCenter__reloadMediaLibraryStateForItems___block_invoke_3(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v40;
    uint64_t v28 = *(void *)v40;
    do
    {
      uint64_t v5 = 0;
      uint64_t v29 = v3;
      do
      {
        if (*(void *)v40 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v39 + 1) + 8 * v5);
        if ([*(id *)(*(void *)(a1 + 40) + 112) containsObject:v6])
        {
          id v7 = [v6 storeIdentifier];

          if (v7)
          {
            uint64_t v8 = [v6 storeIdentifier];
            uint64_t v9 = [v8 copy];
          }
          else
          {
            id v10 = [SKUIStoreIdentifier alloc];
            uint64_t v8 = [v6 storeItemIdentifier];
            uint64_t v9 = [(SKUIStoreIdentifier *)v10 initWithNumber:v8];
          }
          uint64_t v11 = (void *)v9;

          uint64_t v12 = [*(id *)(*(void *)(a1 + 40) + 88) objectForKey:v11];
          uint64_t v13 = [*(id *)(a1 + 32) objectForKey:v6];
          uint64_t v14 = [*(id *)(*(void *)(a1 + 40) + 152) childItemsForItem:v11];
          if ([v14 count])
          {
            id v33 = v12;
            uint64_t v34 = v11;
            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            uint64_t v32 = v14;
            id v15 = v14;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v36;
              uint64_t v19 = 64;
              do
              {
                for (uint64_t i = 0; i != v17; ++i)
                {
                  if (*(void *)v36 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  id v21 = SKUILibraryItemForStoreIdentifier(*(void **)(*((void *)&v35 + 1) + 8 * i));
                  long long v22 = [*(id *)(a1 + 32) objectForKey:v21];
                  v19 &= [v22 state];
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
              }
              while (v17);
            }
            else
            {
              uint64_t v19 = 64;
            }

            objc_msgSend(v13, "setState:", objc_msgSend(v13, "state") | v19);
            uint64_t v4 = v28;
            uint64_t v3 = v29;
            uint64_t v12 = v33;
            uint64_t v11 = v34;
            uint64_t v14 = v32;
          }
          if (v12)
          {
            uint64_t v23 = [v12 state];
            unint64_t v24 = [v13 state] | v23 & 0xFFFFFFFFFFFFFFBFLL;
            if (v23 != v24)
            {
              objc_msgSend(v12, "setLibraryContentFlags:", objc_msgSend(v13, "libraryContentFlags"));
              objc_msgSend(v12, "setMediaCategory:", objc_msgSend(v13, "mediaCategory"));
              [v12 setState:v24];
              long long v25 = [v13 variantIdentifier];
              [v12 setVariantIdentifier:v25];

              long long v26 = v30;
              long long v27 = v12;
              goto LABEL_25;
            }
          }
          else
          {
            [*(id *)(*(void *)(a1 + 40) + 88) setObject:v13 forKey:v11];
            long long v26 = v30;
            long long v27 = v13;
LABEL_25:
            [v26 addObject:v27];
          }
        }
        ++v5;
      }
      while (v5 != v3);
      uint64_t v3 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v3);
  }

  [*(id *)(a1 + 40) _notifyObserversOfStateChanges:v30];
}

- (void)_reloadPurchaseHistory
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SKUIItemStateCenter__reloadPurchaseHistory__block_invoke;
  block[3] = &unk_1E6422020;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

void __45__SKUIItemStateCenter__reloadPurchaseHistory__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = objc_alloc_init(MEMORY[0x1E4FA82E0]);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__SKUIItemStateCenter__reloadPurchaseHistory__block_invoke_2;
  v3[3] = &unk_1E6423C30;
  void v3[4] = *(void *)(a1 + 32);
  objc_copyWeak(&v4, &location);
  [v2 getRemovableSytemApplicationsWithCompletionBlock:v3];
  objc_destroyWeak(&v4);

  objc_destroyWeak(&location);
}

void __45__SKUIItemStateCenter__reloadPurchaseHistory__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v23 = a3;
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v25 = v4;
  if (v4)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v5 = v4;
    uint64_t v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16, v23);
    if (v6)
    {
      uint64_t v7 = *(void *)v34;
      uint64_t v8 = *MEMORY[0x1E4FA8948];
      uint64_t v9 = *MEMORY[0x1E4FA8928];
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v34 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v12 = [v11 valueForProperty:v8];
          if (v12)
          {
            uint64_t v13 = [[SKUIStoreIdentifier alloc] initWithNumber:v12];
            uint64_t v14 = [v11 valueForProperty:v9];
            [(SKUIStoreIdentifier *)v13 setBundleIdentifier:v14];

            [v27 addObject:v13];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v6);
    }
  }
  id v15 = objc_msgSend(v27, "copy", v23);
  uint64_t v16 = [MEMORY[0x1E4FA8100] defaultStore];
  uint64_t v17 = [v16 activeAccount];
  uint64_t v18 = [v17 uniqueIdentifier];

  uint64_t v19 = [*(id *)(a1 + 32) _purchaseHistoryDatabase];
  id v20 = (void *)v19;
  if (v18 && v19)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __45__SKUIItemStateCenter__reloadPurchaseHistory__block_invoke_3;
    v28[3] = &unk_1E6423C08;
    id v29 = v18;
    id v30 = v27;
    objc_copyWeak(&v32, (id *)(a1 + 40));
    id v31 = v15;
    [v20 readAsyncUsingTransactionBlock:v28];
    ++*(void *)(*(void *)(a1 + 32) + 80);

    objc_destroyWeak(&v32);
    id v21 = v29;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _setPurchaseHistoryItemsWithIdentifiers:v27];

    id v21 = objc_loadWeakRetained((id *)(a1 + 40));
    [v21 _setFirstPartyRemovableItemsIdentifiers:v15];
  }
}

uint64_t __45__SKUIItemStateCenter__reloadPurchaseHistory__block_invoke_3(uint64_t a1, void *a2)
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4FA82B8] predicateWithProperty:*MEMORY[0x1E4FA83C8] equalToValue:*(void *)(a1 + 32)];
  id v5 = (void *)MEMORY[0x1E4FA8118];
  uint64_t v6 = [v3 database];
  uint64_t v7 = [v5 queryWithDatabase:v6 predicate:v4];

  v21[0] = (id)*MEMORY[0x1E4FA83D8];
  v21[1] = (id)*MEMORY[0x1E4FA83D0];
  v21[2] = (id)*MEMORY[0x1E4FA83E0];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __45__SKUIItemStateCenter__reloadPurchaseHistory__block_invoke_4;
  uint64_t v18 = &unk_1E6423BE0;
  id v9 = v8;
  id v19 = v9;
  id v20 = *(id *)(a1 + 40);
  [v7 enumeratePersistentIDsAndProperties:v21 count:3 usingBlock:&v15];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_setPurchaseHistoryItemsWithIdentifiers:", *(void *)(a1 + 40), v15, v16, v17, v18);

  id v11 = objc_loadWeakRetained((id *)(a1 + 56));
  [v11 _setFirstPartyRemovableItemsIdentifiers:*(void *)(a1 + 48)];

  if ([v9 count])
  {
    id v12 = objc_loadWeakRetained((id *)(a1 + 56));
    [v12 _setPurchaseHistoryVPPItemsWithIdentifiers:v9];
  }
  for (uint64_t i = 2; i != -1; --i)

  return 1;
}

void __45__SKUIItemStateCenter__reloadPurchaseHistory__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v10 = *(id *)a3;
  id v5 = *(void **)(a3 + 8);
  uint64_t v6 = *(void **)(a3 + 16);
  id v7 = v5;
  LODWORD(v6) = [v6 BOOLValue];
  id v8 = [[SKUIStoreIdentifier alloc] initWithNumber:v10];
  [(SKUIStoreIdentifier *)v8 setBundleIdentifier:v7];
  uint64_t v9 = 40;
  if (v6) {
    uint64_t v9 = 32;
  }
  [*(id *)(a1 + v9) addObject:v8];
}

- (void)_reloadSoftwareLibrary
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SKUIItemStateCenter__reloadSoftwareLibrary__block_invoke;
  block[3] = &unk_1E6422020;
  void block[4] = self;
  dispatch_async(accessQueue, block);
  objc_initWeak(&location, self);
  id v4 = objc_alloc_init(MEMORY[0x1E4FA82E0]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__SKUIItemStateCenter__reloadSoftwareLibrary__block_invoke_2;
  v5[3] = &unk_1E6423C58;
  objc_copyWeak(&v6, &location);
  [v4 getLibraryItemsForITunesStoreItemIdentifiers:0 completionBlock:v5];
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
}

uint64_t __45__SKUIItemStateCenter__reloadSoftwareLibrary__block_invoke(uint64_t result)
{
  return result;
}

void __45__SKUIItemStateCenter__reloadSoftwareLibrary__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setInstalledItems:v3];
}

- (void)_removePurchasingItemsForPurchases:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__SKUIItemStateCenter__removePurchasingItemsForPurchases___block_invoke;
  v7[3] = &unk_1E6421FF8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __58__SKUIItemStateCenter__removePurchasingItemsForPurchases___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    uint64_t v6 = *MEMORY[0x1E4FA8630];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7), "valueForDownloadProperty:", v6, (void)v11);
        if (v8)
        {
          uint64_t v9 = [[SKUIStoreIdentifier alloc] initWithNumber:v8];
          id v10 = [*(id *)(a1 + 40) _removeState:1 forItemIdentifier:v9];
          if (v10) {
            [*(id *)(a1 + 40) _notifyObserversOfStateChange:v10];
          }
        }
        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (id)_removeState:(unint64_t)a3 forItemIdentifier:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(NSMutableDictionary *)self->_itemStates objectForKey:v6];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 state];
    if ((v9 & a3) != 0)
    {
      [v8 setState:v9 & ~a3];
      if (![v8 state]) {
        [(NSMutableDictionary *)self->_itemStates removeObjectForKey:v6];
      }
    }
    else
    {

      id v8 = 0;
    }
  }

  return v8;
}

- (void)_replacePurchasingItem:(id)a3 withDownloadIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SKUIItemStateCenter__replacePurchasingItem_withDownloadIDs___block_invoke;
  block[3] = &unk_1E64225B0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

void __62__SKUIItemStateCenter__replacePurchasingItem_withDownloadIDs___block_invoke(uint64_t a1)
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v2 = [*(id *)(a1 + 32) _removeState:1 forItemIdentifier:*(void *)(a1 + 40)];
  if (v2) {
    [v6 addObject:v2];
  }
  if ([*(id *)(a1 + 48) count])
  {
    uint64_t v3 = [*(id *)(a1 + 32) _addState:2 forItemIdentifier:*(void *)(a1 + 40)];
    uint64_t v4 = (void *)v3;
    if (!v3 || (void *)v3 == v2)
    {
      uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 88) objectForKey:*(void *)(a1 + 40)];

      uint64_t v4 = (void *)v5;
    }
    else
    {
      [v6 addObject:v3];
    }
    [v4 setDownloadProgress:0.0];
    [v4 setDownloadIdentifiers:*(void *)(a1 + 48)];
  }
  if ([v6 count]) {
    [*(id *)(a1 + 32) _notifyObserversOfStateChanges:v6];
  }
}

- (void)_setAvailableAppstoredUpdatesWithUpdates:(id)a3 decrementLoadCount:(BOOL)a4
{
  id v6 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__SKUIItemStateCenter__setAvailableAppstoredUpdatesWithUpdates_decrementLoadCount___block_invoke;
  block[3] = &unk_1E64234A0;
  id v10 = v6;
  long long v11 = self;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_async(accessQueue, block);
}

void __83__SKUIItemStateCenter__setAvailableAppstoredUpdatesWithUpdates_decrementLoadCount___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v2 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v27 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v27)
  {
    uint64_t v3 = *(void *)v29;
    id v23 = v2;
    uint64_t v24 = a1;
    uint64_t v22 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v29 != v3) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v6 = -[SKUIStoreIdentifier initWithLongLong:]([SKUIStoreIdentifier alloc], "initWithLongLong:", [v5 storeItemIdentifier]);
        id v7 = [*(id *)(*(void *)(a1 + 40) + 88) objectForKey:v6];
        uint64_t v8 = [(SKUIItemState *)v7 state];
        switch([v5 updateState])
        {
          case 0:
            unint64_t v9 = v8 & 0xFFFFFFFFFFFFFFDELL | 0x20;
            if (!v7) {
              goto LABEL_19;
            }
            break;
          case 1:
          case 2:
            unint64_t v9 = v8 & 0xFFFFFFFFFFFFFFD8 | 4;
            if (!v7) {
              goto LABEL_19;
            }
            break;
          case 3:
            unint64_t v9 = ((v8 & 2) == 0) | (unint64_t)v8;
            if (!v7) {
              goto LABEL_19;
            }
            break;
          case 4:
            if ((v8 & 2) != 0) {
              unint64_t v9 = v8;
            }
            else {
              unint64_t v9 = v8 & 0xFFFFFFFFFFFFFFDELL | 0x20;
            }
            if (!v7) {
              goto LABEL_19;
            }
            break;
          default:
            unint64_t v9 = v8;
            if (!v7)
            {
LABEL_19:
              id v7 = objc_alloc_init(SKUIItemState);
              id v10 = [(SKUIStoreIdentifier *)v6 numberValue];
              [(SKUIItemState *)v7 setItemIdentifier:v10];

              [(SKUIItemState *)v7 setStoreIdentifier:v6];
              [(SKUIItemState *)v7 setState:v9];
              [*(id *)(*(void *)(a1 + 40) + 88) setObject:v7 forKey:v6];
            }
            break;
        }
        if (v8 != v9)
        {
          [(SKUIItemState *)v7 setState:v9];
          [v2 addObject:v7];
          long long v11 = [MEMORY[0x1E4FA81D8] sharedConfig];
          int v12 = [v11 shouldLog];
          if ([v11 shouldLogToDisk]) {
            int v13 = v12 | 2;
          }
          else {
            int v13 = v12;
          }
          long long v14 = objc_msgSend(v11, "OSLogObject", v20, v21);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
            int v15 = v13;
          }
          else {
            int v15 = v13 & 2;
          }
          if (v15)
          {
            uint64_t v16 = objc_opt_class();
            id v26 = v16;
            uint64_t v17 = [v5 bundleIdentifier];
            uint64_t v18 = [v5 updateState];
            int v32 = 138413058;
            long long v33 = v16;
            __int16 v34 = 2112;
            long long v35 = v17;
            __int16 v36 = 2048;
            uint64_t v37 = v18;
            __int16 v38 = 2048;
            unint64_t v39 = v9;
            LODWORD(v21) = 42;
            id v20 = &v32;
            id v19 = (void *)_os_log_send_and_compose_impl();

            id v2 = v23;
            if (v19)
            {
              long long v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v32, v21);
              free(v19);
              id v20 = (int *)v14;
              SSFileLog();
              goto LABEL_31;
            }
          }
          else
          {
            id v2 = v23;
LABEL_31:
          }
          a1 = v24;
          uint64_t v3 = v22;
        }
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v27);
  }

  if ([v2 count]) {
    [*(id *)(a1 + 40) _notifyObserversOfStateChanges:v2];
  }
  if (*(unsigned char *)(a1 + 48))
  {
    --*(void *)(*(void *)(a1 + 40) + 80);
    [*(id *)(a1 + 40) _fireFinishLoadBlocksIfNecessary];
  }
}

- (void)_setDownloads:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__SKUIItemStateCenter__setDownloads___block_invoke;
  v7[3] = &unk_1E6421FF8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __37__SKUIItemStateCenter__setDownloads___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  --*(void *)(*(void *)(a1 + 32) + 80);
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 88) mutableCopy];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v61 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id obj = *(id *)(v1 + 40);
  uint64_t v4 = [obj countByEnumeratingWithState:&v88 objects:v95 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v89;
    uint64_t v7 = *MEMORY[0x1E4FA85E0];
    uint64_t v8 = *MEMORY[0x1E4FA8478];
    uint64_t v70 = *MEMORY[0x1E4FA8630];
    uint64_t v65 = *MEMORY[0x1E4FA85D8];
    uint64_t v63 = *MEMORY[0x1E4FA85C8];
    uint64_t v64 = *MEMORY[0x1E4FA85B0];
    id v62 = v2;
    uint64_t v67 = *MEMORY[0x1E4FA85E0];
    uint64_t v68 = *(void *)v89;
    uint64_t v66 = *MEMORY[0x1E4FA8478];
    BOOL v58 = v3;
    uint64_t v59 = v1;
    do
    {
      uint64_t v9 = 0;
      uint64_t v69 = v5;
      do
      {
        if (*(void *)v89 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v75 = v9;
        id v10 = *(void **)(*((void *)&v88 + 1) + 8 * v9);
        long long v11 = objc_msgSend(v10, "valueForProperty:", v7, v58);
        char v12 = [v11 isEqualToString:v8];

        if ((v12 & 1) == 0)
        {
          int v13 = [v10 valueForProperty:v70];
          if (v13)
          {
            long long v14 = [[SKUIStoreIdentifier alloc] initWithNumber:v13];
            int v15 = [v2 objectForKey:v14];
            if (!v15)
            {
              int v15 = objc_alloc_init(SKUIItemState);
              [(SKUIItemState *)v15 setItemIdentifier:v13];
              [(SKUIItemState *)v15 setStoreIdentifier:v14];
              [*(id *)(*(void *)(v1 + 32) + 88) setObject:v15 forKey:v14];
            }
            uint64_t v16 = [(SKUIItemState *)v15 state];
            if ((v16 & 2) == 0)
            {
              [(SKUIItemState *)v15 setState:v16 | 2];
              [v3 addObject:v15];
            }
            uint64_t v17 = [(SKUIItemState *)v15 downloadContentFlags];
            uint64_t v18 = [v10 valueForProperty:v65];
            unsigned int v19 = [v18 BOOLValue];

            if ((v17 & 2) != v19)
            {
              [(SKUIItemState *)v15 setDownloadContentFlags:v17 | v19];
              [v3 addObject:v15];
            }
            id v20 = v10;
            uint64_t v21 = [v20 valueForProperty:v64];
            int v22 = [v21 BOOLValue];

            id v23 = [v20 valueForProperty:v63];

            int v24 = [v23 BOOLValue];
            long long v25 = @"buy";
            if (v24) {
              long long v25 = @"rent";
            }
            id v26 = @"buy_HD";
            if (v24) {
              id v26 = @"rent_HD";
            }
            if (v22) {
              long long v25 = v26;
            }
            uint64_t v27 = v25;
            long long v28 = [(SKUIItemState *)v15 variantIdentifier];
            long long v74 = v27;
            char v29 = [v28 isEqualToString:v27];

            if ((v29 & 1) == 0)
            {
              [(SKUIItemState *)v15 setVariantIdentifier:v27];
              [v3 addObject:v15];
            }
            [v2 removeObjectForKey:v14];
            long long v72 = v15;
            long long v73 = v14;
            if ([*(id *)(*(void *)(v1 + 32) + 152) itemHasParent:v14])
            {
              long long v30 = [*(id *)(*(void *)(v1 + 32) + 152) parentItemForItem:v14];
              long long v31 = [v2 objectForKey:v30];
              if (!v31)
              {
                long long v31 = objc_alloc_init(SKUIItemState);
                int v32 = [v30 itemIdentifier];
                [(SKUIItemState *)v31 setItemIdentifier:v32];

                [(SKUIItemState *)v31 setStoreIdentifier:v30];
                long long v33 = [(SKUIItemState *)v15 downloadPhase];
                [(SKUIItemState *)v31 setDownloadPhase:v33];

                [*(id *)(*(void *)(v1 + 32) + 88) setObject:v31 forKey:v30];
              }
              uint64_t v34 = [(SKUIItemState *)v31 state];
              if ((v34 & 2) == 0)
              {
                [(SKUIItemState *)v31 setState:v34 | 2];
                [v3 addObject:v31];
              }
              id v35 = v30;
LABEL_40:
              [v61 addObject:v30];

              id v2 = v62;
            }
            else
            {
              long long v86 = 0u;
              long long v87 = 0u;
              long long v84 = 0u;
              long long v85 = 0u;
              id v35 = v2;
              uint64_t v36 = [v35 countByEnumeratingWithState:&v84 objects:v94 count:16];
              if (v36)
              {
                uint64_t v37 = v36;
                uint64_t v60 = v13;
                uint64_t v38 = *(void *)v85;
                while (2)
                {
                  for (uint64_t i = 0; i != v37; ++i)
                  {
                    if (*(void *)v85 != v38) {
                      objc_enumerationMutation(v35);
                    }
                    long long v30 = *(void **)(*((void *)&v84 + 1) + 8 * i);
                    long long v31 = [v35 objectForKey:v30];
                    long long v40 = [(SKUIItemState *)v31 downloadIdentifiers];
                    uint64_t v41 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v20, "persistentIdentifier"));
                    int v42 = [v40 containsObject:v41];

                    if (v42)
                    {
                      uint64_t v43 = [(SKUIItemState *)v31 state];
                      id v3 = v58;
                      if ((v43 & 2) == 0)
                      {
                        [(SKUIItemState *)v31 setState:v43 | 2];
                        [v58 addObject:v31];
                      }
                      uint64_t v1 = v59;
                      uint64_t v44 = *(void **)(*(void *)(v59 + 32) + 152);
                      uint64_t v45 = [MEMORY[0x1E4F1CAD0] setWithObject:v73];
                      [v44 addChildren:v45 forParent:v30];

                      int v13 = v60;
                      goto LABEL_40;
                    }
                  }
                  uint64_t v37 = [v35 countByEnumeratingWithState:&v84 objects:v94 count:16];
                  if (v37) {
                    continue;
                  }
                  break;
                }
                id v3 = v58;
                uint64_t v1 = v59;
                id v2 = v62;
                int v13 = v60;
              }
            }

            uint64_t v7 = v67;
            uint64_t v6 = v68;
            uint64_t v5 = v69;
            uint64_t v8 = v66;
          }
        }
        uint64_t v9 = v75 + 1;
      }
      while (v75 + 1 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v88 objects:v95 count:16];
    }
    while (v5);
  }

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v46 = v61;
  uint64_t v47 = [v46 countByEnumeratingWithState:&v80 objects:v93 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v81;
    do
    {
      for (uint64_t j = 0; j != v48; ++j)
      {
        if (*(void *)v81 != v49) {
          objc_enumerationMutation(v46);
        }
        [v2 removeObjectForKey:*(void *)(*((void *)&v80 + 1) + 8 * j)];
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v80 objects:v93 count:16];
    }
    while (v48);
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v51 = v2;
  uint64_t v52 = [v51 countByEnumeratingWithState:&v76 objects:v92 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v77;
    do
    {
      for (uint64_t k = 0; k != v53; ++k)
      {
        if (*(void *)v77 != v54) {
          objc_enumerationMutation(v51);
        }
        char v56 = [*(id *)(v1 + 32) _removeState:2 forItemIdentifier:*(void *)(*((void *)&v76 + 1) + 8 * k)];
        BOOL v57 = v56;
        if (v56)
        {
          [v56 setDownloadContentFlags:0];
          [v57 setVariantIdentifier:0];
          [v3 addObject:v57];
        }
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v76 objects:v92 count:16];
    }
    while (v53);
  }

  if ([v3 count]) {
    [*(id *)(v1 + 32) _notifyObserversOfStateChanges:v3];
  }
  [*(id *)(v1 + 32) _fireFinishLoadBlocksIfNecessary];
}

- (void)_setJobs:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__SKUIItemStateCenter__setJobs___block_invoke;
  v7[3] = &unk_1E6421FF8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __32__SKUIItemStateCenter__setJobs___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  --*(void *)(*(void *)(a1 + 32) + 80);
  long long v28 = (void *)[*(id *)(*(void *)(a1 + 32) + 88) mutableCopy];
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = *(id *)(v1 + 40);
  uint64_t v31 = [obj countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v31)
  {
    uint64_t v2 = *(void *)v34;
    uint64_t v27 = v1;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v34 != v2) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v5 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "storeItemID", v23, v24));
        if (v5)
        {
          id v6 = [[SKUIStoreIdentifier alloc] initWithNumber:v5];
          uint64_t v7 = [v28 objectForKey:v6];
          if (!v7)
          {
            uint64_t v7 = objc_alloc_init(SKUIItemState);
            [(SKUIItemState *)v7 setItemIdentifier:v5];
            [(SKUIItemState *)v7 setStoreIdentifier:v6];
            [*(id *)(*(void *)(v1 + 32) + 88) setObject:v7 forKey:v6];
          }
          int v32 = v6;
          [(SKUIItemState *)v7 setMediaCategory:1];
          uint64_t v8 = [(SKUIItemState *)v7 state];
          uint64_t v9 = v8;
          if (v8) {
            uint64_t v10 = 0;
          }
          else {
            uint64_t v10 = v8;
          }
          uint64_t v11 = v10 | ~(_BYTE)v8 & 2;
          uint64_t v30 = [v4 phase];
          [v4 percentComplete];
          *(float *)&double v12 = v12;
          [(SKUIItemState *)v7 setDownloadProgress:v12];
          [(SKUIItemState *)v7 setState:v11];
          uint64_t v13 = [(SKUIItemState *)v7 downloadContentFlags];
          if ((v13 & v11) != 0) {
            [(SKUIItemState *)v7 setDownloadContentFlags:v13];
          }
          if (v9 != v11 || v13 != 0) {
            [v25 addObject:v7];
          }
          int v15 = [MEMORY[0x1E4FA81D8] sharedConfig];
          int v16 = [v15 shouldLog];
          if ([v15 shouldLogToDisk]) {
            v16 |= 2u;
          }
          uint64_t v17 = [v15 OSLogObject];
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            v16 &= 2u;
          }
          if (v16)
          {
            uint64_t v18 = v2;
            unsigned int v19 = objc_opt_class();
            id v29 = v19;
            id v20 = [v4 bundleID];
            int v37 = 138413058;
            uint64_t v38 = v19;
            uint64_t v2 = v18;
            __int16 v39 = 2112;
            long long v40 = v20;
            __int16 v41 = 2048;
            uint64_t v42 = v30;
            __int16 v43 = 2048;
            uint64_t v44 = v11;
            LODWORD(v24) = 42;
            id v23 = &v37;
            uint64_t v21 = (void *)_os_log_send_and_compose_impl();

            int v22 = v32;
            if (v21)
            {
              uint64_t v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, &v37, v24);
              free(v21);
              id v23 = (int *)v17;
              SSFileLog();
              goto LABEL_27;
            }
          }
          else
          {
            int v22 = v32;
LABEL_27:
          }
          uint64_t v1 = v27;
        }
      }
      uint64_t v31 = [obj countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v31);
  }

  if ([v25 count]) {
    [*(id *)(v1 + 32) _notifyObserversOfStateChanges:v25];
  }
  objc_msgSend(*(id *)(v1 + 32), "_fireFinishLoadBlocksIfNecessary", v23);
}

- (void)_setGratisIdentifiers:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SKUIItemStateCenter__setGratisIdentifiers_error___block_invoke;
  block[3] = &unk_1E64225B0;
  id v12 = v7;
  uint64_t v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(accessQueue, block);
}

uint64_t __51__SKUIItemStateCenter__setGratisIdentifiers_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    *(void *)(v2 + 64) = 3;
  }
  else
  {
    *(void *)(v2 + 64) = 2;
    id v3 = (id)[*(id *)(a1 + 40) _setStateFlag:16 forOnlyItemsWithIdentifiers:*(void *)(a1 + 48) sendNotification:1];
  }
  --*(void *)(*(void *)(a1 + 40) + 80);
  id v4 = *(void **)(a1 + 40);

  return [v4 _fireFinishLoadBlocksIfNecessary];
}

- (void)_setInstalledItems:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    id v6 = objc_alloc_init(MEMORY[0x1E4FA82E0]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      uint64_t v11 = *MEMORY[0x1E4FA8928];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = [*(id *)(*((void *)&v18 + 1) + 8 * i) valueForProperty:v11];
          [v5 addObject:v13];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v9);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __42__SKUIItemStateCenter__setInstalledItems___block_invoke_2;
    v15[3] = &unk_1E6423CF8;
    id v16 = v7;
    uint64_t v17 = self;
    [v6 playableApplicationsWithBundleIdentifiers:v5 completionBlock:v15];
  }
  else
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__SKUIItemStateCenter__setInstalledItems___block_invoke;
    block[3] = &unk_1E6422020;
    void block[4] = self;
    dispatch_async(accessQueue, block);
  }
}

uint64_t __42__SKUIItemStateCenter__setInstalledItems___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fireFinishLoadBlocksIfNecessary];
}

void __42__SKUIItemStateCenter__setInstalledItems___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v22 = a2;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v20 = a1;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v29;
    uint64_t v6 = *MEMORY[0x1E4FA8948];
    uint64_t v24 = *MEMORY[0x1E4FA8938];
    uint64_t v21 = *MEMORY[0x1E4FA8928];
    unint64_t v7 = 0x1E6420000uLL;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "valueForProperty:", v6, v20);
        if (v10)
        {
          uint64_t v11 = (void *)[objc_alloc(*(Class *)(v7 + 4072)) initWithNumber:v10];
          if (([v9 isPlaceholder] & 1) == 0 && (objc_msgSend(v9, "isBeta") & 1) == 0)
          {
            [v9 valueForProperty:v24];
            uint64_t v13 = v12 = v7;
            uint64_t v14 = [v13 longLongValue];

            unint64_t v7 = v12;
            if (!v14
              || ([v9 valueForProperty:v21],
                  int v15 = objc_claimAutoreleasedReturnValue(),
                  int v16 = [v22 containsObject:v15],
                  v15,
                  unint64_t v7 = v12,
                  v16))
            {
              [v23 setObject:v9 forKey:v11];
            }
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v4);
  }

  uint64_t v17 = *(void *)(v20 + 40);
  long long v18 = *(NSObject **)(v17 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SKUIItemStateCenter__setInstalledItems___block_invoke_3;
  block[3] = &unk_1E6421FF8;
  void block[4] = v17;
  id v27 = v23;
  id v19 = v23;
  dispatch_async(v18, block);
}

void __42__SKUIItemStateCenter__setInstalledItems___block_invoke_3(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__SKUIItemStateCenter__setInstalledItems___block_invoke_4;
  aBlock[3] = &unk_1E6423C80;
  aBlock[4] = *(void *)(a1 + 32);
  id v3 = v2;
  id v20 = v3;
  uint64_t v4 = _Block_copy(aBlock);
  uint64_t v5 = (void *)[*(id *)(*(void *)(a1 + 32) + 88) copy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __42__SKUIItemStateCenter__setInstalledItems___block_invoke_5;
  v14[3] = &unk_1E6423CA8;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v15 = v6;
  uint64_t v16 = v7;
  id v8 = v3;
  id v17 = v8;
  id v9 = v4;
  id v18 = v9;
  [v5 enumerateKeysAndObjectsUsingBlock:v14];
  uint64_t v10 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42__SKUIItemStateCenter__setInstalledItems___block_invoke_6;
  v12[3] = &unk_1E6423CD0;
  id v11 = v9;
  id v13 = v11;
  [v10 enumerateKeysAndObjectsUsingBlock:v12];
  if ([v8 count]) {
    [*(id *)(a1 + 32) _notifyObserversOfStateChanges:v8];
  }
  [*(id *)(a1 + 32) _notifyObserversOfMediaLibraryChange];
  --*(void *)(*(void *)(a1 + 32) + 80);
  [*(id *)(a1 + 32) _fireFinishLoadBlocksIfNecessary];
}

void __42__SKUIItemStateCenter__setInstalledItems___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) _addState:4 forItemIdentifier:v8];
  if (v6) {
    [*(id *)(a1 + 40) addObject:v6];
  }
  if ([v5 isLaunchProhibited])
  {
    uint64_t v7 = [*(id *)(a1 + 32) _addState:4096 forItemIdentifier:v8];

    if (v7)
    {
      [*(id *)(a1 + 40) addObject:v7];
      id v6 = (void *)v7;
    }
    else
    {
      id v6 = 0;
    }
  }
}

void __42__SKUIItemStateCenter__setInstalledItems___block_invoke_5(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 40) _removeState:4 forItemIdentifier:v6];
    if (v4) {
      [*(id *)(a1 + 48) addObject:v4];
    }
    id v5 = [*(id *)(a1 + 40) _removeState:4096 forItemIdentifier:v6];

    if (v5) {
      [*(id *)(a1 + 48) addObject:v5];
    }
  }
  [*(id *)(a1 + 32) removeObjectForKey:v6];
}

uint64_t __42__SKUIItemStateCenter__setInstalledItems___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setPurchaseHistoryItemsWithIdentifiers:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__SKUIItemStateCenter__setPurchaseHistoryItemsWithIdentifiers___block_invoke;
  v7[3] = &unk_1E6421FF8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

uint64_t __63__SKUIItemStateCenter__setPurchaseHistoryItemsWithIdentifiers___block_invoke(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 80);
  id v2 = (id)[*(id *)(a1 + 32) _setStateFlag:8 forItemsWithIdentifiers:*(void *)(a1 + 40) sendNotification:1];
  id v3 = *(void **)(a1 + 32);

  return [v3 _fireFinishLoadBlocksIfNecessary];
}

- (void)_setPurchaseHistoryVPPItemsWithIdentifiers:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__SKUIItemStateCenter__setPurchaseHistoryVPPItemsWithIdentifiers___block_invoke;
  v7[3] = &unk_1E6421FF8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

uint64_t __66__SKUIItemStateCenter__setPurchaseHistoryVPPItemsWithIdentifiers___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) _setStateFlag:512 forItemsWithIdentifiers:*(void *)(a1 + 40) sendNotification:1];
  id v3 = *(void **)(a1 + 32);

  return [v3 _fireFinishLoadBlocksIfNecessary];
}

- (void)_setFirstPartyRemovableItemsIdentifiers:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__SKUIItemStateCenter__setFirstPartyRemovableItemsIdentifiers___block_invoke;
  v7[3] = &unk_1E6421FF8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

uint64_t __63__SKUIItemStateCenter__setFirstPartyRemovableItemsIdentifiers___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) _setStateFlag:1024 forItemsWithIdentifiers:*(void *)(a1 + 40) sendNotification:1];
  id v3 = *(void **)(a1 + 32);

  return [v3 _fireFinishLoadBlocksIfNecessary];
}

- (id)_setStateFlag:(unint64_t)a3 forItemsWithIdentifiers:(id)a4 sendNotification:(BOOL)a5
{
  BOOL v24 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v9 = (void *)[(NSMutableDictionary *)self->_itemStates mutableCopy];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v16 = [(SKUIItemStateCenter *)self _addState:a3 forItemIdentifier:v15];
        if (v16) {
          [v8 addObject:v16];
        }
        [v9 removeObjectForKey:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v12);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v17 = v9;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = [(SKUIItemStateCenter *)self _removeState:a3 forItemIdentifier:*(void *)(*((void *)&v25 + 1) + 8 * j)];
        if (v22) {
          [v8 addObject:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v19);
  }

  if (v24 && [v8 count]) {
    [(SKUIItemStateCenter *)self _notifyObserversOfStateChanges:v8];
  }

  return v8;
}

- (id)_setStateFlag:(unint64_t)a3 forOnlyItemsWithIdentifiers:(id)a4 sendNotification:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v16 = [SKUIStoreIdentifier alloc];
        id v17 = -[SKUIStoreIdentifier initWithNumber:](v16, "initWithNumber:", v15, (void)v20);
        [v9 addObject:v17];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  uint64_t v18 = [(SKUIItemStateCenter *)self _setStateFlag:a3 forItemsWithIdentifiers:v9 sendNotification:v5];

  return v18;
}

- (void)_updatesSoftwarePurchasingItemsForPurchases:(id)a3 purchaseWasSuccessful:(BOOL)a4
{
  id v6 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__SKUIItemStateCenter__updatesSoftwarePurchasingItemsForPurchases_purchaseWasSuccessful___block_invoke;
  block[3] = &unk_1E64234A0;
  id v10 = v6;
  uint64_t v11 = self;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_async(accessQueue, block);
}

void __89__SKUIItemStateCenter__updatesSoftwarePurchasingItemsForPurchases_purchaseWasSuccessful___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "itemID", (void)v16);

        if (v8)
        {
          id v9 = [SKUIStoreIdentifier alloc];
          id v10 = [v7 itemID];
          uint64_t v11 = [(SKUIStoreIdentifier *)v9 initWithNumber:v10];

          BOOL v12 = [*(id *)(*(void *)(a1 + 40) + 88) objectForKey:v11];
          uint64_t v13 = [v12 state];
          unint64_t v14 = v13 & 0xFFFFFFFFFFFFFFFELL;
          if ([v7 createsJobs])
          {
            if ((v13 & 2) == 0 && *(unsigned char *)(a1 + 48) != 0) {
              unint64_t v14 = v13 & 0xFFFFFFFFFFFFFFFCLL | 2;
            }
          }
          if (v13 != v14)
          {
            [v12 setState:v14];
            [*(id *)(a1 + 40) _notifyObserversOfStateChange:v12];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }
}

- (BOOL)_isPurchaseForOffDeviceContent:(id)a3
{
  char v3 = [a3 deviceFamilies];

  return SKUIItemDeviceFamilyIsTVOnly(v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationshipCouncellor, 0);
  objc_storeStrong((id *)&self->_purchaseHistoryDatabase, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_observedLibraryItems, 0);
  objc_storeStrong((id *)&self->_mediaLibraries, 0);
  objc_storeStrong((id *)&self->_mediaLibraryQueue, 0);
  objc_storeStrong((id *)&self->_itemStates, 0);
  objc_storeStrong((id *)&self->_gratisStateLastUpdate, 0);
  objc_storeStrong((id *)&self->_finishLoadBlocks, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
  objc_storeStrong((id *)&self->_jobManager, 0);
  objc_storeStrong((id *)&self->_appstoredUpdatesStore, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "-[SKUIItemStateCenter init]";
}

@end