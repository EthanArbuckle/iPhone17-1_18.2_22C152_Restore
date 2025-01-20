@interface UAFAssetSetManager
+ (BOOL)cacheDeleteDisabledForAutoAssetType:(id)a3 autoAssetSpecifier:(id)a4;
+ (BOOL)shouldConfigure:(id)a3 newUsages:(id)a4;
+ (BOOL)subscribe:(id)a3 subscriptions:(id)a4 storeManager:(id)a5 configurationManager:(id)a6 userInitiated:(BOOL)a7;
+ (BOOL)unsubscribe:(id)a3 subscriptions:(id)a4 storeManager:(id)a5 configurationManager:(id)a6 userInitiated:(BOOL)a7;
+ (BOOL)userIsValidForAssetSetManagement:(unsigned int)a3;
+ (UAFAssetSetManager)sharedManager;
+ (id)_subscriptionDiffersFromDB:(id)a3 subscriber:(id)a4 error:(id *)a5;
+ (id)cacheDeleteDefaultsKeyForAutoAssetType:(id)a3 autoAssetSpecifier:(id)a4;
+ (id)defaults;
+ (id)generateInformationWithError:(id *)a3;
+ (id)getAssetSetUsages:(id)a3 storeManager:(id)a4;
+ (id)getComparableUsages:(id)a3;
+ (id)getConcurrentQueue;
+ (id)getSerialQueue;
+ (id)getSubscriptions:(id)a3 storeManager:(id)a4;
+ (id)getSystemUsageAssets:(id)a3;
+ (id)sysdiagnoseInformationWithError:(id *)a3;
+ (unint64_t)coalesceDownloadStatus:(id)a3;
+ (void)autoAssetDetailsForAssetNamed:(id)a3 assetSet:(id)a4 usages:(id)a5 autoAssetType:(id *)a6 autoAssetSpecifier:(id *)a7;
+ (void)configureAssetDelivery:(id)a3 configurationManager:(id)a4;
+ (void)configureAssetDelivery:(id)a3 configurationManager:(id)a4 lockIfUnchanged:(BOOL)a5;
+ (void)configureAssetDelivery:(id)a3 configurationManager:(id)a4 lockIfUnchanged:(BOOL)a5 subscriptions:(id)a6 assetSetUsages:(id)a7 userInitiated:(BOOL)a8;
+ (void)disableCacheDelete:(BOOL)a3 forAutoAssetType:(id)a4 autoAssetSpecifier:(id)a5;
+ (void)processAssetSet:(id)a3 allAssets:(id)a4;
+ (void)subscribe:(id)a3 subscriptions:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)unsubscribe:(id)a3 subscriptions:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)updateAssets:(id)a3 policies:(id)a4 queue:(id)a5 progress:(id)a6 completion:(id)a7;
+ (void)updateAssets:(id)a3 policies:(id)a4 queue:(id)a5 progress:(id)a6 completion:(id)a7 storeManager:(id)a8 configurationManager:(id)a9;
+ (void)updateAssets:(id)a3 subscription:(id)a4 policies:(id)a5 queue:(id)a6 progress:(id)a7 completion:(id)a8;
+ (void)updateAssets:(id)a3 subscription:(id)a4 policies:(id)a5 queue:(id)a6 progress:(id)a7 completion:(id)a8 storeManager:(id)a9 configurationManager:(id)a10;
+ (void)updateAssets:(id)a3 subscription:(id)a4 policies:(id)a5 queue:(id)a6 progressWithStatus:(id)a7 completion:(id)a8;
- (BOOL)assetDeliveryReady;
- (BOOL)cacheDeleteDisabledForAssetNamed:(id)a3 assetSet:(id)a4 usages:(id)a5;
- (NSMutableSet)assetSetObservers;
- (UAFAssetSetManager)init;
- (id)assetNamesForAssetSet:(id)a3 usages:(id)a4;
- (id)assetSetUsagesForStatusForSubscriber:(id)a3 subscriptionName:(id)a4 status:(unint64_t *)a5;
- (id)diskSpaceNeededForSubscriber:(id)a3 subscriptionName:(id)a4 error:(id *)a5;
- (id)diskSpaceNeededForSubscriber:(id)a3 subscriptionName:(id)a4 storeManager:(id)a5 configurationManager:(id)a6 error:(id *)a7;
- (id)knownUsagesForAssetSet:(id)a3 usageType:(id)a4;
- (id)observeAssetSet:(id)a3 queue:(id)a4 handler:(id)a5;
- (id)retrieveAssetSet:(id)a3 usages:(id)a4;
- (id)retrieveAssetSet:(id)a3 usages:(id)a4 consistencyToken:(id)a5;
- (id)retrieveAssetSet:(id)a3 usages:(id)a4 disableExperimentation:(BOOL)a5;
- (id)subscribedUsagesForAssetSet:(id)a3;
- (id)subscriptionsForSubscriber:(id)a3;
- (id)subscriptionsForSubscriber:(id)a3 storeManager:(id)a4;
- (unint64_t)downloadStatusForSubscriber:(id)a3 subscriptionName:(id)a4;
- (void)disableCacheDelete:(BOOL)a3 forAssetNamed:(id)a4 assetSet:(id)a5 usages:(id)a6 queue:(id)a7 completion:(id)a8;
- (void)downloadStatusForSubscriber:(id)a3 subscriptionName:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)removeObserver:(id)a3;
- (void)retrieveAssetSet:(id)a3 usages:(id)a4 consistencyToken:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)retrieveAssetSet:(id)a3 usages:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)setAssetSetObservers:(id)a3;
- (void)subscribe:(id)a3 subscriptions:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)unsubscribe:(id)a3 subscriptionNames:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)updateAssetsForSubscriber:(id)a3 subscriptionName:(id)a4 policies:(id)a5 queue:(id)a6 detailedProgress:(id)a7 completion:(id)a8;
- (void)updateAssetsForSubscriber:(id)a3 subscriptionName:(id)a4 policies:(id)a5 queue:(id)a6 progress:(id)a7 completion:(id)a8;
- (void)updateAssetsForSubscriber:(id)a3 subscriptionName:(id)a4 policies:(id)a5 queue:(id)a6 progress:(id)a7 detailedProgress:(id)a8 completion:(id)a9 storeManager:(id)a10 configurationManager:(id)a11;
@end

@implementation UAFAssetSetManager

- (id)retrieveAssetSet:(id)a3 usages:(id)a4
{
  return [(UAFAssetSetManager *)self retrieveAssetSet:a3 usages:a4 consistencyToken:0];
}

- (id)subscriptionsForSubscriber:(id)a3
{
  return [(UAFAssetSetManager *)self subscriptionsForSubscriber:a3 storeManager:0];
}

+ (UAFAssetSetManager)sharedManager
{
  if (qword_26AF0BAC0 != -1) {
    dispatch_once(&qword_26AF0BAC0, &__block_literal_global_370);
  }
  v2 = (void *)qword_26AF0BAC8;

  return (UAFAssetSetManager *)v2;
}

- (id)retrieveAssetSet:(id)a3 usages:(id)a4 consistencyToken:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[UAFAssetSet alloc] initWithAssetSet:v9 usages:v8 configurationDirURLs:0 disableExperimentation:0 consistencyToken:v7];

  return v10;
}

- (id)knownUsagesForAssetSet:(id)a3 usageType:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[UAFConfigurationManager defaultManager];
  id v8 = [v7 getAssetSet:v5];
  id v9 = v8;
  if (v8)
  {
    v10 = [v8 usageValues];
    v11 = [v10 objectForKeyedSubscript:v6];
  }
  else
  {
    v12 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315394;
      v15 = "-[UAFAssetSetManager knownUsagesForAssetSet:usageType:]";
      __int16 v16 = 2114;
      id v17 = v5;
      _os_log_impl(&dword_23797A000, v12, OS_LOG_TYPE_DEFAULT, "%s Unable to get assetset for '%{public}@'", (uint8_t *)&v14, 0x16u);
    }

    v11 = 0;
  }

  return v11;
}

- (id)observeAssetSet:(id)a3 queue:(id)a4 handler:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [[UAFAssetSetObserver alloc] initWithAssetSet:v8 queue:v9 updateHandler:v10];
  if (v11)
  {
    v12 = self->_assetSetObservers;
    objc_sync_enter(v12);
    [(NSMutableSet *)self->_assetSetObservers addObject:v11];
    objc_sync_exit(v12);

    v13 = v11;
  }
  else
  {
    int v14 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315394;
      id v17 = "-[UAFAssetSetManager observeAssetSet:queue:handler:]";
      __int16 v18 = 2114;
      id v19 = v8;
      _os_log_error_impl(&dword_23797A000, v14, OS_LOG_TYPE_ERROR, "%s Failed to create UAFAssetSetObserver for %{public}@'", (uint8_t *)&v16, 0x16u);
    }
  }

  return v11;
}

void __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke_6(uint64_t a1)
{
}

- (void)updateAssetsForSubscriber:(id)a3 subscriptionName:(id)a4 policies:(id)a5 queue:(id)a6 progress:(id)a7 completion:(id)a8
{
}

- (void)updateAssetsForSubscriber:(id)a3 subscriptionName:(id)a4 policies:(id)a5 queue:(id)a6 progress:(id)a7 detailedProgress:(id)a8 completion:(id)a9 storeManager:(id)a10 configurationManager:(id)a11
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  unint64_t v61 = (unint64_t)a7;
  id v60 = a8;
  id v58 = a9;
  id v20 = a10;
  id v21 = a11;
  uint64_t v22 = (uint64_t)v21;
  v64 = v20;
  if (v20)
  {
    if (v21) {
      goto LABEL_3;
    }
  }
  else
  {
    v64 = +[UAFSubscriptionStoreManager defaultManager];
    if (v22) {
      goto LABEL_3;
    }
  }
  uint64_t v22 = +[UAFConfigurationManager defaultManager];
LABEL_3:
  id v23 = objc_alloc_init(MEMORY[0x263F08C38]);
  v24 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v88 = "-[UAFAssetSetManager updateAssetsForSubscriber:subscriptionName:policies:queue:progress:detailedProgress:compl"
          "etion:storeManager:configurationManager:]";
    __int16 v89 = 2114;
    id v90 = v23;
    __int16 v91 = 2114;
    uint64_t v92 = (uint64_t)v16;
    __int16 v93 = 2114;
    id v94 = v17;
    _os_log_impl(&dword_23797A000, v24, OS_LOG_TYPE_DEFAULT, "%s %{public}@: updateAssets for subscriber '%{public}@' with subscription '%{public}@'", buf, 0x2Au);
  }
  v56 = v23;
  v59 = (void *)v22;
  v62 = v17;
  v63 = v16;

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obj = v18;
  uint64_t v25 = [obj countByEnumeratingWithState:&v82 objects:v86 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    int v27 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = *(void *)v83;
    uint64_t v30 = 100;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v83 != v29) {
          objc_enumerationMutation(obj);
        }
        v32 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        if ([v32 isEqualToString:@"UpdateNamespaces"])
        {
          v30 -= 2;
          uint64_t v28 = 1;
        }
        if ([v32 isEqualToString:@"ForceUpdateNamespaces"])
        {
          v30 -= 2;
          uint64_t v28 = 2;
        }
        v27 |= [v32 isEqualToString:@"UseCellular"];
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v82 objects:v86 count:16];
    }
    while (v26);
  }
  else
  {
    LOBYTE(v27) = 0;
    uint64_t v28 = 0;
    uint64_t v30 = 100;
  }

  if (v17)
  {
    id v33 = v16;
    v34 = [v64 getSubscription:v17 subscriber:v16];
    unint64_t v35 = (unint64_t)v60;
    if (v34)
    {
      uint64_t v36 = [MEMORY[0x263EFF8C0] arrayWithObject:v34];
    }
    else
    {
      uint64_t v36 = 0;
    }
  }
  else
  {
    id v33 = v16;
    uint64_t v36 = [v64 getSubscriptions:v16 error:0];
    unint64_t v35 = (unint64_t)v60;
  }
  v37 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v88 = "-[UAFAssetSetManager updateAssetsForSubscriber:subscriptionName:policies:queue:progress:detailedProgress:compl"
          "etion:storeManager:configurationManager:]";
    __int16 v89 = 2114;
    id v90 = v33;
    __int16 v91 = 2114;
    uint64_t v92 = v36;
    _os_log_debug_impl(&dword_23797A000, v37, OS_LOG_TYPE_DEBUG, "%s Subscriptions for %{public}@: %{public}@", buf, 0x20u);
  }

  v38 = [v59 applySubscriptions:v36];
  v39 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v88 = "-[UAFAssetSetManager updateAssetsForSubscriber:subscriptionName:policies:queue:progress:detailedProgress:compl"
          "etion:storeManager:configurationManager:]";
    __int16 v89 = 2114;
    id v90 = v38;
    _os_log_debug_impl(&dword_23797A000, v39, OS_LOG_TYPE_DEBUG, "%s All asset set usages now %{public}@", buf, 0x16u);
  }

  if (!v19)
  {
    id v19 = +[UAFAssetSetManager getConcurrentQueue];
  }
  v57 = (void *)v36;
  uint64_t v40 = [NSString stringWithFormat:@"%@: %@", v33, v36];
  v53 = (void *)v40;
  if (v61 | v35)
  {
    uint64_t v41 = v40;
    v42 = [UAFAssetSetProgress alloc];
    v78[0] = MEMORY[0x263EF8330];
    v78[1] = 3221225472;
    v78[2] = __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke;
    v78[3] = &unk_264CEBE00;
    id v79 = v19;
    id v80 = (id)v61;
    id v81 = (id)v35;
    v43 = [(UAFAssetSetProgress *)v42 initWithName:v41 maxProgressBeforeComplete:v30 progressWithStatus:v78];
    v76[0] = MEMORY[0x263EF8330];
    v76[1] = 3221225472;
    v76[2] = __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke_3;
    v76[3] = &unk_264CEBE28;
    v44 = v43;
    v77 = v44;
    v45 = (void *)MEMORY[0x237E26D50](v76);
    v74[0] = MEMORY[0x263EF8330];
    v74[1] = 3221225472;
    v74[2] = __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke_4;
    v74[3] = &unk_264CEBE28;
    v55 = v44;
    v75 = v55;
    v54 = (void *)MEMORY[0x237E26D50](v74);
  }
  else
  {
    v54 = 0;
    v55 = 0;
    v45 = 0;
  }
  v46 = dispatch_group_create();
  dispatch_group_enter(v46);
  v72[0] = MEMORY[0x263EF8330];
  v72[1] = 3221225472;
  v72[2] = __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke_5;
  v72[3] = &unk_264CEAB50;
  v47 = v46;
  v73 = v47;
  +[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:v38 configurationManager:v59 expensiveNetworking:v27 & 1 progress:v45 requestId:v56 completion:v72];
  dispatch_group_enter(v47);
  v70[0] = MEMORY[0x263EF8330];
  v70[1] = 3221225472;
  v70[2] = __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke_6;
  v70[3] = &unk_264CEAB50;
  v71 = v47;
  v48 = v47;
  +[UAFTrialUpdateManager updateTrialFromAssetSetUsages:v38 rolloutUpdateMode:v28 expensiveNetworking:v27 & 1 storeManager:v64 configurationManager:v59 progress:v54 completion:v70];
  v49 = +[UAFAssetSetManager getConcurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke_7;
  block[3] = &unk_264CEBE50;
  id v68 = v19;
  id v69 = v58;
  id v67 = v56;
  id v50 = v19;
  id v51 = v56;
  id v52 = v58;
  dispatch_group_notify(v48, v49, block);
}

+ (id)getConcurrentQueue
{
  if (_MergedGlobals_13 != -1) {
    dispatch_once(&_MergedGlobals_13, &__block_literal_global_14);
  }
  v2 = (void *)qword_26AF0BAA8;

  return v2;
}

- (id)subscriptionsForSubscriber:(id)a3 storeManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  uint64_t v25 = __Block_byref_object_dispose__6;
  id v26 = 0;
  if (!v6)
  {
    id v6 = +[UAFSubscriptionStoreManager defaultManager];
  }
  id v20 = 0;
  uint64_t v7 = [v6 getSubscriptions:v5 error:&v20];
  id v8 = v20;
  id v9 = (void *)v22[5];
  v22[5] = v7;

  id v10 = (void *)v22[5];
  if (v10) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v8 == 0;
  }
  if (!v11)
  {
    v12 = objc_opt_new();
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __62__UAFAssetSetManager_subscriptionsForSubscriber_storeManager___block_invoke;
    v17[3] = &unk_264CEBF40;
    id v13 = v12;
    id v18 = v13;
    id v19 = &v21;
    int v14 = (void *)MEMORY[0x237E26D50](v17);
    [v13 subscriptionsForSubscriber:v5 completion:v14];

    id v10 = (void *)v22[5];
  }
  id v15 = v10;
  _Block_object_dispose(&v21, 8);

  return v15;
}

+ (unint64_t)coalesceDownloadStatus:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = 4;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v3);
        }
        id v10 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        int v11 = [v10 unsignedIntValue];

        switch(v11)
        {
          case 0:
            uint64_t v7 = 0;
            continue;
          case 1:
            uint64_t v7 = v7 != 0;
            continue;
          case 2:
            BOOL v12 = (v7 & 0xFFFFFFFFFFFFFFFELL) == 4;
            uint64_t v13 = 2;
            goto LABEL_19;
          case 3:
            BOOL v12 = (v7 & 0xFFFFFFFFFFFFFFFELL) == 4 || v7 == 2;
            uint64_t v13 = 3;
            goto LABEL_19;
          case 4:
            ++v6;
            continue;
          case 5:
            BOOL v12 = (v7 & 0xFFFFFFFFFFFFFFFDLL) == 4 || v7 == 7;
            uint64_t v13 = 5;
LABEL_19:
            if (v12) {
              uint64_t v7 = v13;
            }
            break;
          case 6:
            if (v7 == 4) {
              uint64_t v7 = 6;
            }
            break;
          case 7:
            if ((v7 & 0xFFFFFFFFFFFFFFFDLL) == 4) {
              uint64_t v7 = 7;
            }
            break;
          default:
            continue;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
  else
  {
    int v6 = 0;
    uint64_t v7 = 4;
  }
  if ([v3 count] == v6) {
    unint64_t v14 = 4;
  }
  else {
    unint64_t v14 = v7;
  }

  return v14;
}

uint64_t __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) progress:@"Trial" completed:a2 total:a3 status:a4];
}

uint64_t __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) progress:@"AutoAsset" completed:a2 total:a3 status:a4];
}

void __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke_2;
  v11[3] = &unk_264CEBDD8;
  id v10 = *(NSObject **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  double v14 = a5;
  uint64_t v15 = a4;
  id v13 = *(id *)(a1 + 48);
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  dispatch_async(v10, v11);
}

void __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(uint64_t, void, double))(v2 + 16))(v2, *(void *)(a1 + 56), *(double *)(a1 + 48));
  }
  if (*(void *)(a1 + 40))
  {
    id v3 = [[UAFAssetSetStatus alloc] initWithStatus:*(void *)(a1 + 56) percent:*(void *)(a1 + 64) completedBytes:*(void *)(a1 + 72) totalBytes:*(double *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __35__UAFAssetSetManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(UAFAssetSetManager);
  v1 = (void *)qword_26AF0BAC8;
  qword_26AF0BAC8 = (uint64_t)v0;
}

- (UAFAssetSetManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)UAFAssetSetManager;
  uint64_t v2 = [(UAFAssetSetManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    assetSetObservers = v2->_assetSetObservers;
    v2->_assetSetObservers = (NSMutableSet *)v3;

    uint64_t v5 = v2;
  }

  return v2;
}

void __40__UAFAssetSetManager_getConcurrentQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("UAFAssetSetManager.Concurrent", MEMORY[0x263EF83A8]);
  v1 = (void *)qword_26AF0BAA8;
  qword_26AF0BAA8 = (uint64_t)v0;
}

+ (id)getSerialQueue
{
  if (qword_26AF0BAB0 != -1) {
    dispatch_once(&qword_26AF0BAB0, &__block_literal_global_286_1);
  }
  uint64_t v2 = (void *)qword_26AF0BAB8;

  return v2;
}

void __36__UAFAssetSetManager_getSerialQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("UAFAssetSetManager.Serial", 0);
  v1 = (void *)qword_26AF0BAB8;
  qword_26AF0BAB8 = (uint64_t)v0;
}

+ (BOOL)userIsValidForAssetSetManagement:(unsigned int)a3
{
  return 1;
}

+ (id)_subscriptionDiffersFromDB:(id)a3 subscriber:(id)a4 error:(id *)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v24 = a4;
  objc_super v7 = +[UAFSubscriptionStoreManager defaultManager];
  uint64_t v8 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v25 = 0;
        char v15 = [v14 isValid:0 error:&v25];
        id v16 = v25;
        uint64_t v17 = v16;
        if ((v15 & 1) == 0)
        {
          if (a5) {
            *a5 = v16;
          }
          uint64_t v21 = UAFGetLogCategory((void **)&UAFLogContextSubscription);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            v31 = "+[UAFAssetSetManager _subscriptionDiffersFromDB:subscriber:error:]";
            __int16 v32 = 2114;
            id v33 = v24;
            __int16 v34 = 2114;
            unint64_t v35 = v14;
            __int16 v36 = 2114;
            v37 = v17;
            _os_log_error_impl(&dword_23797A000, v21, OS_LOG_TYPE_ERROR, "%s Subscription invalid for subscriber %{public}@, subscription:%{public}@: %{public}@", buf, 0x2Au);
          }

          id v20 = 0;
          goto LABEL_18;
        }
        long long v18 = [v14 name];
        long long v19 = [v7 getSubscription:v18 subscriber:v24];

        if (!v19 || ([v14 isEqual:v19] & 1) == 0) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v38 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v20 = [v8 allObjects];
LABEL_18:

  return v20;
}

+ (void)subscribe:(id)a3 subscriptions:(id)a4 queue:(id)a5 completion:(id)a6
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = a5;
  id v12 = a6;
  if (!v11)
  {
    uint64_t v11 = +[UAFAssetSetManager getConcurrentQueue];
  }
  id v35 = 0;
  id v13 = +[UAFAssetSetManager _subscriptionDiffersFromDB:v10 subscriber:v9 error:&v35];
  id v14 = v35;
  char v15 = v14;
  if (v13) {
    BOOL v16 = v14 == 0;
  }
  else {
    BOOL v16 = 0;
  }
  if (v16)
  {
    if ([v13 count])
    {
      long long v19 = UAFGetLogCategory((void **)&UAFLogContextSubscription);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v39 = "+[UAFAssetSetManager subscribe:subscriptions:queue:completion:]";
        __int16 v40 = 2114;
        id v41 = v9;
        __int16 v42 = 2114;
        id v43 = v13;
        _os_log_impl(&dword_23797A000, v19, OS_LOG_TYPE_DEFAULT, "%s Changing subscriptions for '%{public}@': '%{public}@'", buf, 0x20u);
      }

      v36[0] = @"Operation";
      v36[1] = @"Subscriber";
      v37[0] = @"Subscribe";
      v37[1] = v9;
      v36[2] = @"Subscriptions";
      v37[2] = v13;
      long long v18 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3];
      id v20 = objc_opt_new();
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __63__UAFAssetSetManager_subscribe_subscriptions_queue_completion___block_invoke_293;
      v24[3] = &unk_264CEBC48;
      id v25 = v20;
      id v29 = v12;
      long long v26 = v11;
      id v27 = v9;
      id v28 = v13;
      id v21 = v20;
      uint64_t v22 = (void *)MEMORY[0x237E26D50](v24);
      [v21 operationWithConfig:v18 completion:v22];

      goto LABEL_19;
    }
    uint64_t v23 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v39 = "+[UAFAssetSetManager subscribe:subscriptions:queue:completion:]";
      __int16 v40 = 2114;
      id v41 = v9;
      __int16 v42 = 2114;
      id v43 = v10;
      _os_log_impl(&dword_23797A000, v23, OS_LOG_TYPE_DEFAULT, "%s No subscription changes for subscriber '%{public}@' and subscriptions '%{public}@'", buf, 0x20u);
    }

    if (v12)
    {
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __63__UAFAssetSetManager_subscribe_subscriptions_queue_completion___block_invoke_290;
      v30[3] = &unk_264CEB800;
      id v31 = v12;
      dispatch_async(v11, v30);
      long long v18 = v31;
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v17 = UAFGetLogCategory((void **)&UAFLogContextSubscription);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v39 = "+[UAFAssetSetManager subscribe:subscriptions:queue:completion:]";
      __int16 v40 = 2114;
      id v41 = v9;
      __int16 v42 = 2114;
      id v43 = v15;
      _os_log_error_impl(&dword_23797A000, v17, OS_LOG_TYPE_ERROR, "%s Not attempting to update subscriptions for %{public}@: %{public}@", buf, 0x20u);
    }

    if (v12)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __63__UAFAssetSetManager_subscribe_subscriptions_queue_completion___block_invoke;
      block[3] = &unk_264CEB4D0;
      id v34 = v12;
      id v33 = v15;
      dispatch_async(v11, block);

      long long v18 = v34;
LABEL_19:
    }
  }
}

uint64_t __63__UAFAssetSetManager_subscribe_subscriptions_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __63__UAFAssetSetManager_subscribe_subscriptions_queue_completion___block_invoke_290(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__UAFAssetSetManager_subscribe_subscriptions_queue_completion___block_invoke_293(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [*(id *)(a1 + 32) invalidate];
  uint64_t v4 = *(void **)(a1 + 64);
  if (v4)
  {
    uint64_t v5 = *(NSObject **)(a1 + 40);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __63__UAFAssetSetManager_subscribe_subscriptions_queue_completion___block_invoke_2;
    v9[3] = &unk_264CEB4D0;
    id v11 = v4;
    id v10 = v3;
    dispatch_async(v5, v9);
  }
  id v6 = UAFGetLogCategory((void **)&UAFLogContextSubscription);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 136315650;
    id v13 = "+[UAFAssetSetManager subscribe:subscriptions:queue:completion:]_block_invoke";
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    __int16 v16 = 2114;
    uint64_t v17 = v8;
    _os_log_impl(&dword_23797A000, v6, OS_LOG_TYPE_DEFAULT, "%s Changed subscriptions for '%{public}@': '%{public}@'", buf, 0x20u);
  }
}

uint64_t __63__UAFAssetSetManager_subscribe_subscriptions_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)getComparableUsages:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  uint64_t v5 = [v3 dictionary];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__UAFAssetSetManager_getComparableUsages___block_invoke;
  v8[3] = &unk_264CEBC70;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

void __42__UAFAssetSetManager_getComparableUsages___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = a2;
  id v7 = [v5 setWithArray:a3];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

+ (BOOL)shouldConfigure:(id)a3 newUsages:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[UAFAssetSetManager getComparableUsages:v5];
  uint64_t v8 = +[UAFAssetSetManager getComparableUsages:v6];
  if ([v7 isEqual:v8])
  {
    id v9 = UAFGetLogCategory((void **)&UAFLogContextSubscription);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "+[UAFAssetSetManager shouldConfigure:newUsages:]";
      _os_log_impl(&dword_23797A000, v9, OS_LOG_TYPE_DEFAULT, "%s old and new usages equal, skipping configure", (uint8_t *)&buf, 0xCu);
    }
    BOOL v10 = 0;
  }
  else
  {
    id v11 = (void *)MEMORY[0x263EFFA08];
    id v12 = [v5 allKeys];
    id v9 = [v11 setWithArray:v12];

    id v13 = (void *)MEMORY[0x263EFFA08];
    __int16 v14 = [v6 allKeys];
    uint64_t v15 = [v13 setWithArray:v14];

    if ([v9 isEqual:v15])
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v23 = 0x2020000000;
      char v24 = 0;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __48__UAFAssetSetManager_shouldConfigure_newUsages___block_invoke;
      v18[3] = &unk_264CEBC98;
      id v19 = v5;
      id v20 = v6;
      p_long long buf = &buf;
      [v8 enumerateKeysAndObjectsUsingBlock:v18];
      BOOL v10 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      __int16 v16 = UAFGetLogCategory((void **)&UAFLogContextSubscription);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "+[UAFAssetSetManager shouldConfigure:newUsages:]";
        _os_log_impl(&dword_23797A000, v16, OS_LOG_TYPE_DEFAULT, "%s old and new usages cover different asset sets, requiring configure", (uint8_t *)&buf, 0xCu);
      }

      BOOL v10 = 1;
    }
  }
  return v10;
}

void __48__UAFAssetSetManager_shouldConfigure_newUsages___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = +[UAFConfigurationManager defaultManager];
  uint64_t v8 = [v7 getAssetSet:v6];

  id v9 = +[UAFAutoAssetManager getSpecifiers:v8 assetSetUsages:a1[4]];
  BOOL v10 = +[UAFAutoAssetManager getSpecifiers:v8 assetSetUsages:a1[5]];
  if (([v9 isEqual:v10] & 1) == 0)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    id v11 = UAFGetLogCategory((void **)&UAFLogContextSubscription);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      id v13 = "+[UAFAssetSetManager shouldConfigure:newUsages:]_block_invoke";
      _os_log_impl(&dword_23797A000, v11, OS_LOG_TYPE_DEFAULT, "%s resulting specifiers different, requiring configure", (uint8_t *)&v12, 0xCu);
    }
  }
}

+ (BOOL)subscribe:(id)a3 subscriptions:(id)a4 storeManager:(id)a5 configurationManager:(id)a6 userInitiated:(BOOL)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v13)
  {
    id v13 = +[UAFSubscriptionStoreManager writeManager];
  }
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v15 = +[UAFAssetSetManager getSerialQueue];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __94__UAFAssetSetManager_subscribe_subscriptions_storeManager_configurationManager_userInitiated___block_invoke;
  v22[3] = &unk_264CEBD88;
  id v23 = v12;
  id v24 = v11;
  id v26 = v14;
  id v27 = &v29;
  id v25 = v13;
  BOOL v28 = a7;
  id v16 = v14;
  id v17 = v13;
  id v18 = v11;
  id v19 = v12;
  dispatch_sync(v15, v22);

  char v20 = *((unsigned char *)v30 + 24);
  _Block_object_dispose(&v29, 8);
  return v20;
}

void __94__UAFAssetSetManager_subscribe_subscriptions_storeManager_configurationManager_userInitiated___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v48 = 0;
  id v4 = +[UAFAssetSetManager _subscriptionDiffersFromDB:v2 subscriber:v3 error:&v48];
  id v5 = v48;
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    if ([v4 count])
    {
      id v9 = *(void **)(a1 + 48);
      id v47 = 0;
      BOOL v10 = [v9 getAllSystemAssetSetUsages:&v47];
      id v11 = v47;
      if (v11)
      {
        id v7 = v11;
        id v12 = UAFGetLogCategory((void **)&UAFLogContextSubscription);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315394;
          *(void *)&uint8_t buf[4] = "+[UAFAssetSetManager subscribe:subscriptions:storeManager:configurationManager:userInitia"
                               "ted:]_block_invoke";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v7;
          _os_log_error_impl(&dword_23797A000, v12, OS_LOG_TYPE_ERROR, "%s Could not read system usages from database: %@", buf, 0x16u);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      }
      else
      {
        id v16 = *(void **)(a1 + 48);
        id v46 = 0;
        id v17 = [v16 getAllSubscriptions:&v46];
        id v7 = v46;
        if (v7)
        {
          id v18 = UAFGetLogCategory((void **)&UAFLogContextSubscription);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136315394;
            *(void *)&uint8_t buf[4] = "+[UAFAssetSetManager subscribe:subscriptions:storeManager:configurationManager:userInit"
                                 "iated:]_block_invoke";
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v7;
            _os_log_error_impl(&dword_23797A000, v18, OS_LOG_TYPE_ERROR, "%s Could not read subscriptions from database: %{public}@", buf, 0x16u);
          }

          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
        }
        else
        {
          char v32 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v17];
          id v33 = [v17 objectForKeyedSubscript:*(void *)(a1 + 40)];
          if (!v33)
          {
            id v33 = [MEMORY[0x263EFF8C0] array];
          }
          id v19 = [MEMORY[0x263EFF9A0] dictionary];
          v44[0] = MEMORY[0x263EF8330];
          v44[1] = 3221225472;
          v44[2] = __94__UAFAssetSetManager_subscribe_subscriptions_storeManager_configurationManager_userInitiated___block_invoke_302;
          v44[3] = &unk_264CEBCC0;
          id v20 = v19;
          id v45 = v20;
          [v33 enumerateObjectsUsingBlock:v44];
          v42[0] = MEMORY[0x263EF8330];
          v42[1] = 3221225472;
          v42[2] = __94__UAFAssetSetManager_subscribe_subscriptions_storeManager_configurationManager_userInitiated___block_invoke_2;
          v42[3] = &unk_264CEBCC0;
          id v31 = v20;
          id v43 = v31;
          [v4 enumerateObjectsUsingBlock:v42];
          id v21 = [v31 allValues];
          [v32 setObject:v21 forKeyedSubscript:*(void *)(a1 + 40)];

          *(void *)long long buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          id v52 = 0;
          uint64_t v22 = [v32 allValues];
          v41[0] = MEMORY[0x263EF8330];
          v41[1] = 3221225472;
          v41[2] = __94__UAFAssetSetManager_subscribe_subscriptions_storeManager_configurationManager_userInitiated___block_invoke_3;
          v41[3] = &unk_264CEBCE8;
          v41[4] = buf;
          [v22 enumerateObjectsUsingBlock:v41];
          uint64_t v30 = v22;
          id v23 = [MEMORY[0x263EFF980] arrayWithCapacity:*(void *)(*(void *)&buf[8] + 24)];
          v39[0] = MEMORY[0x263EF8330];
          v39[1] = 3221225472;
          v39[2] = __94__UAFAssetSetManager_subscribe_subscriptions_storeManager_configurationManager_userInitiated___block_invoke_4;
          v39[3] = &unk_264CEBD10;
          id v24 = v23;
          id v40 = v24;
          [v22 enumerateObjectsUsingBlock:v39];
          id v25 = +[UAFConfigurationManager defaultManager];
          id v26 = [v25 applySubscriptions:v24];

          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = __94__UAFAssetSetManager_subscribe_subscriptions_storeManager_configurationManager_userInitiated___block_invoke_5;
          v34[3] = &unk_264CEBD38;
          id v35 = *(id *)(a1 + 48);
          id v36 = *(id *)(a1 + 40);
          id v37 = v4;
          id v38 = *(id *)(a1 + 32);
          id v27 = (uint64_t (**)(void))MEMORY[0x237E26D50](v34);
          if (+[UAFAssetSetManager shouldConfigure:v10 newUsages:v26])
          {
            +[UAFAssetSetManager configureAssetDelivery:*(void *)(a1 + 48) configurationManager:*(void *)(a1 + 56) lockIfUnchanged:0 subscriptions:v24 assetSetUsages:v26 userInitiated:*(unsigned __int8 *)(a1 + 72)];
          }
          else
          {
            uint64_t v29 = UAFGetLogCategory((void **)&UAFLogContextSubscription);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v49 = 136315138;
              id v50 = "+[UAFAssetSetManager subscribe:subscriptions:storeManager:configurationManager:userInitiated:]_block_invoke";
              _os_log_impl(&dword_23797A000, v29, OS_LOG_TYPE_DEFAULT, "%s Updated subscriptions results in no usage changes, skipping reconfiguration", v49, 0xCu);
            }
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v27[2](v27);

          _Block_object_dispose(buf, 8);
        }
      }
    }
    else
    {
      id v13 = UAFGetLogCategory((void **)&UAFLogContextSubscription);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void **)(a1 + 32);
        uint64_t v14 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 136315650;
        *(void *)&uint8_t buf[4] = "+[UAFAssetSetManager subscribe:subscriptions:storeManager:configurationManager:userInitiate"
                             "d:]_block_invoke";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v14;
        *(_WORD *)&buf[22] = 2114;
        id v52 = v15;
        _os_log_impl(&dword_23797A000, v13, OS_LOG_TYPE_DEFAULT, "%s No subscription changes for subscriber '%{public}@' and subscriptions '%{public}@'", buf, 0x20u);
      }

      id v7 = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
  }
  else
  {
    id v7 = v5;
    uint64_t v8 = UAFGetLogCategory((void **)&UAFLogContextSubscription);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 136315650;
      *(void *)&uint8_t buf[4] = "+[UAFAssetSetManager subscribe:subscriptions:storeManager:configurationManager:userInitiated:]_block_invoke";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v28;
      *(_WORD *)&buf[22] = 2114;
      id v52 = v7;
      _os_log_error_impl(&dword_23797A000, v8, OS_LOG_TYPE_ERROR, "%s Not attempting to update subscriptions for %{public}@: %{public}@", buf, 0x20u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

void __94__UAFAssetSetManager_subscribe_subscriptions_storeManager_configurationManager_userInitiated___block_invoke_302(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 name];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

void __94__UAFAssetSetManager_subscribe_subscriptions_storeManager_configurationManager_userInitiated___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 name];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

uint64_t __94__UAFAssetSetManager_subscribe_subscriptions_storeManager_configurationManager_userInitiated___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result = [a2 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __94__UAFAssetSetManager_subscribe_subscriptions_storeManager_configurationManager_userInitiated___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:a2];
}

uint64_t __94__UAFAssetSetManager_subscribe_subscriptions_storeManager_configurationManager_userInitiated___block_invoke_5(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) subscribe:*(void *)(a1 + 40) subscriptions:*(void *)(a1 + 48) expires:0];
  id v3 = UAFGetLogCategory((void **)&UAFLogContextSubscription);
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 56);
      uint64_t v6 = *(void *)(a1 + 40);
      int v10 = 136315650;
      id v11 = "+[UAFAssetSetManager subscribe:subscriptions:storeManager:configurationManager:userInitiated:]_block_invoke";
      __int16 v12 = 2114;
      uint64_t v13 = v5;
      __int16 v14 = 2114;
      uint64_t v15 = v6;
      _os_log_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEFAULT, "%s Updated storage to reflect subscriptions %{public}@ for subscriber %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = 136315650;
    id v11 = "+[UAFAssetSetManager subscribe:subscriptions:storeManager:configurationManager:userInitiated:]_block_invoke_5";
    __int16 v12 = 2114;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    _os_log_error_impl(&dword_23797A000, v4, OS_LOG_TYPE_ERROR, "%s Failed to update storage to reflect subscriptions %{public}@ for subscriber %{public}@", (uint8_t *)&v10, 0x20u);
  }

  return v2;
}

+ (void)unsubscribe:(id)a3 subscriptions:(id)a4 queue:(id)a5 completion:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v11)
  {
    id v11 = +[UAFAssetSetManager getConcurrentQueue];
  }
  uint64_t v13 = UAFGetLogCategory((void **)&UAFLogContextSubscription);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    id v27 = "+[UAFAssetSetManager unsubscribe:subscriptions:queue:completion:]";
    __int16 v28 = 2114;
    id v29 = v10;
    _os_log_impl(&dword_23797A000, v13, OS_LOG_TYPE_DEFAULT, "%s Unsubscribing for '%{public}@'", buf, 0x16u);
  }

  v24[0] = @"Operation";
  v24[1] = @"Subscriber";
  v25[0] = @"Unsubscribe";
  v25[1] = v9;
  v24[2] = @"Subscriptions";
  v25[2] = v10;
  __int16 v14 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];
  uint64_t v15 = objc_opt_new();
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __65__UAFAssetSetManager_unsubscribe_subscriptions_queue_completion___block_invoke;
  v20[3] = &unk_264CEBD60;
  id v22 = v11;
  id v23 = v12;
  id v21 = v15;
  id v16 = v11;
  id v17 = v12;
  id v18 = v15;
  id v19 = (void *)MEMORY[0x237E26D50](v20);
  [v18 operationWithConfig:v14 completion:v19];
}

void __65__UAFAssetSetManager_unsubscribe_subscriptions_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) invalidate];
  id v4 = *(void **)(a1 + 48);
  if (v4)
  {
    uint64_t v5 = *(NSObject **)(a1 + 40);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __65__UAFAssetSetManager_unsubscribe_subscriptions_queue_completion___block_invoke_2;
    v6[3] = &unk_264CEB4D0;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __65__UAFAssetSetManager_unsubscribe_subscriptions_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (BOOL)unsubscribe:(id)a3 subscriptions:(id)a4 storeManager:(id)a5 configurationManager:(id)a6 userInitiated:(BOOL)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v13)
  {
    id v13 = +[UAFSubscriptionStoreManager writeManager];
  }
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v15 = +[UAFAssetSetManager getSerialQueue];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __96__UAFAssetSetManager_unsubscribe_subscriptions_storeManager_configurationManager_userInitiated___block_invoke;
  v22[3] = &unk_264CEBD88;
  id v26 = v14;
  id v27 = &v29;
  id v23 = v13;
  id v24 = v12;
  id v25 = v11;
  BOOL v28 = a7;
  id v16 = v14;
  id v17 = v11;
  id v18 = v12;
  id v19 = v13;
  dispatch_sync(v15, v22);

  char v20 = *((unsigned char *)v30 + 24);
  _Block_object_dispose(&v29, 8);
  return v20;
}

void __96__UAFAssetSetManager_unsubscribe_subscriptions_storeManager_configurationManager_userInitiated___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  id v43 = 0;
  id v3 = [v2 getAllSystemAssetSetUsages:&v43];
  id v4 = v43;
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = UAFGetLogCategory((void **)&UAFLogContextSubscription);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "+[UAFAssetSetManager unsubscribe:subscriptions:storeManager:configurationManager:userInitiate"
                           "d:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_error_impl(&dword_23797A000, v6, OS_LOG_TYPE_ERROR, "%s Could not read system usages from database: %@", buf, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
  else
  {
    id v7 = objc_opt_new();
    id v8 = objc_opt_new();
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v50 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v40 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          id v14 = [*(id *)(a1 + 32) getSubscription:v13 subscriber:*(void *)(a1 + 48)];
          if (v14)
          {
            [v7 addObject:v13];
            [v8 addObject:v14];
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v50 count:16];
      }
      while (v10);
    }

    if ([v8 count])
    {
      uint64_t v15 = *(void **)(a1 + 32);
      id v38 = 0;
      id v16 = [v15 getAllSubscriptions:&v38];
      id v5 = v38;
      if (v5)
      {
        id v17 = UAFGetLogCategory((void **)&UAFLogContextSubscription);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315394;
          *(void *)&uint8_t buf[4] = "+[UAFAssetSetManager unsubscribe:subscriptions:storeManager:configurationManager:userInit"
                               "iated:]_block_invoke";
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v5;
          _os_log_error_impl(&dword_23797A000, v17, OS_LOG_TYPE_ERROR, "%s Could not read subscriptions from database: %{public}@", buf, 0x16u);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      }
      else
      {
        id v21 = (void *)MEMORY[0x263EFF9A0];
        id v22 = [v16 allValues];
        id v23 = [v16 allKeys];
        uint64_t v31 = [v21 dictionaryWithObjects:v22 forKeys:v23];

        id v24 = [v16 objectForKeyedSubscript:*(void *)(a1 + 48)];
        if (!v24)
        {
          id v24 = [MEMORY[0x263EFF8C0] array];
        }
        uint64_t v30 = [MEMORY[0x263EFF980] arrayWithArray:v24];
        [v30 removeObjectsInArray:v8];
        [v31 setObject:v30 forKeyedSubscript:*(void *)(a1 + 48)];
        *(void *)long long buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        id v47 = __Block_byref_object_copy__6;
        id v48 = __Block_byref_object_dispose__6;
        id v49 = (id)MEMORY[0x263EFFA68];
        id v25 = [v31 allValues];
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = __96__UAFAssetSetManager_unsubscribe_subscriptions_storeManager_configurationManager_userInitiated___block_invoke_307;
        void v37[3] = &unk_264CEBCE8;
        v37[4] = buf;
        [v25 enumerateObjectsUsingBlock:v37];

        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __96__UAFAssetSetManager_unsubscribe_subscriptions_storeManager_configurationManager_userInitiated___block_invoke_2;
        v32[3] = &unk_264CEBD38;
        id v33 = *(id *)(a1 + 32);
        id v34 = *(id *)(a1 + 48);
        id v35 = v7;
        id v36 = *(id *)(a1 + 40);
        id v26 = (uint64_t (**)(void))MEMORY[0x237E26D50](v32);
        id v27 = +[UAFConfigurationManager defaultManager];
        BOOL v28 = [v27 applySubscriptions:*(void *)(*(void *)&buf[8] + 40)];

        if (+[UAFAssetSetManager shouldConfigure:v3 newUsages:v28])
        {
          +[UAFAssetSetManager configureAssetDelivery:*(void *)(a1 + 32) configurationManager:*(void *)(a1 + 56) lockIfUnchanged:0 subscriptions:*(void *)(*(void *)&buf[8] + 40) assetSetUsages:v28 userInitiated:*(unsigned __int8 *)(a1 + 72)];
        }
        else
        {
          uint64_t v29 = UAFGetLogCategory((void **)&UAFLogContextSubscription);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t v44 = 136315138;
            id v45 = "+[UAFAssetSetManager unsubscribe:subscriptions:storeManager:configurationManager:userInitiated:]_block_invoke";
            _os_log_impl(&dword_23797A000, v29, OS_LOG_TYPE_DEFAULT, "%s Updated subscriptions results in no usage changes, skipping reconfiguration", v44, 0xCu);
          }
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v26[2](v26);

        _Block_object_dispose(buf, 8);
      }
    }
    else
    {
      id v18 = UAFGetLogCategory((void **)&UAFLogContextSubscription);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        char v20 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 40);
        uint64_t v19 = *(void *)(a1 + 48);
        *(_DWORD *)long long buf = 136315650;
        *(void *)&uint8_t buf[4] = "+[UAFAssetSetManager unsubscribe:subscriptions:storeManager:configurationManager:userInitia"
                             "ted:]_block_invoke";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2114;
        id v47 = v20;
        _os_log_impl(&dword_23797A000, v18, OS_LOG_TYPE_DEFAULT, "%s No changes found for subscriber %{public}@ subscriptions: %{public}@", buf, 0x20u);
      }

      id v5 = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
  }
}

void __96__UAFAssetSetManager_unsubscribe_subscriptions_storeManager_configurationManager_userInitiated___block_invoke_307(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) arrayByAddingObjectsFromArray:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __96__UAFAssetSetManager_unsubscribe_subscriptions_storeManager_configurationManager_userInitiated___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) allObjects];
  uint64_t v5 = [v2 unsubscribe:v3 subscriptions:v4];

  uint64_t v6 = UAFGetLogCategory((void **)&UAFLogContextSubscription);
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v9 = *(void *)(a1 + 40);
      int v13 = 136315650;
      id v14 = "+[UAFAssetSetManager unsubscribe:subscriptions:storeManager:configurationManager:userInitiated:]_block_invoke";
      __int16 v15 = 2114;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      _os_log_impl(&dword_23797A000, v7, OS_LOG_TYPE_DEFAULT, "%s Updated storage to reflect removal of subscriptions %{public}@ for subscriber %{public}@", (uint8_t *)&v13, 0x20u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 40);
    int v13 = 136315650;
    id v14 = "+[UAFAssetSetManager unsubscribe:subscriptions:storeManager:configurationManager:userInitiated:]_block_invoke_2";
    __int16 v15 = 2114;
    uint64_t v16 = v11;
    __int16 v17 = 2114;
    uint64_t v18 = v12;
    _os_log_error_impl(&dword_23797A000, v7, OS_LOG_TYPE_ERROR, "%s Failed to update storage to reflect subscriptions %{public}@ for subscriber %{public}@", (uint8_t *)&v13, 0x20u);
  }

  return v5;
}

+ (id)getSubscriptions:(id)a3 storeManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v6 = +[UAFSubscriptionStoreManager defaultManager];
  }
  id v7 = [v6 getSubscriptions:v5 error:0];

  return v7;
}

+ (id)getAssetSetUsages:(id)a3 storeManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v6 = +[UAFSubscriptionStoreManager defaultManager];
  }
  id v7 = [v6 getSystemAssetSetUsages:v5];

  return v7;
}

- (id)diskSpaceNeededForSubscriber:(id)a3 subscriptionName:(id)a4 error:(id *)a5
{
  return [(UAFAssetSetManager *)self diskSpaceNeededForSubscriber:a3 subscriptionName:a4 storeManager:0 configurationManager:0 error:a5];
}

- (id)diskSpaceNeededForSubscriber:(id)a3 subscriptionName:(id)a4 storeManager:(id)a5 configurationManager:(id)a6 error:(id *)a7
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  __int16 v15 = v14;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    id v13 = +[UAFSubscriptionStoreManager defaultManager];
    if (v15) {
      goto LABEL_3;
    }
  }
  __int16 v15 = +[UAFConfigurationManager defaultManager];
LABEL_3:
  if (v12)
  {
    uint64_t v16 = [v13 getSubscription:v12 subscriber:v11];
    if (v16)
    {
      __int16 v17 = [MEMORY[0x263EFF8C0] arrayWithObject:v16];
    }
    else
    {
      __int16 v17 = 0;
    }
  }
  else
  {
    __int16 v17 = [v13 getSubscriptions:v11 error:0];
  }
  uint64_t v18 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 136315650;
    id v24 = "-[UAFAssetSetManager diskSpaceNeededForSubscriber:subscriptionName:storeManager:configurationManager:error:]";
    __int16 v25 = 2114;
    id v26 = v11;
    __int16 v27 = 2114;
    BOOL v28 = v17;
    _os_log_debug_impl(&dword_23797A000, v18, OS_LOG_TYPE_DEBUG, "%s Subscriptions for %{public}@: %{public}@", (uint8_t *)&v23, 0x20u);
  }

  uint64_t v19 = [v15 applySubscriptions:v17];
  char v20 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 136315394;
    id v24 = "-[UAFAssetSetManager diskSpaceNeededForSubscriber:subscriptionName:storeManager:configurationManager:error:]";
    __int16 v25 = 2114;
    id v26 = v19;
    _os_log_debug_impl(&dword_23797A000, v20, OS_LOG_TYPE_DEBUG, "%s All asset set usages now %{public}@", (uint8_t *)&v23, 0x16u);
  }

  id v21 = +[UAFAutoAssetManager spaceNeededForAssetSetUsages:v19 key:@"_UnarchivedSize" configurationManager:v15 error:a7];

  return v21;
}

+ (void)updateAssets:(id)a3 policies:(id)a4 queue:(id)a5 progress:(id)a6 completion:(id)a7
{
}

+ (void)updateAssets:(id)a3 policies:(id)a4 queue:(id)a5 progress:(id)a6 completion:(id)a7 storeManager:(id)a8 configurationManager:(id)a9
{
}

+ (void)updateAssets:(id)a3 subscription:(id)a4 policies:(id)a5 queue:(id)a6 progress:(id)a7 completion:(id)a8
{
  id v13 = a7;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  uint64_t v19 = +[UAFAssetSetManager sharedManager];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __83__UAFAssetSetManager_updateAssets_subscription_policies_queue_progress_completion___block_invoke;
  v21[3] = &unk_264CEBDB0;
  id v22 = v13;
  id v20 = v13;
  [v19 updateAssetsForSubscriber:v18 subscriptionName:v17 policies:v16 queue:v15 progress:v21 completion:v14];
}

uint64_t __83__UAFAssetSetManager_updateAssets_subscription_policies_queue_progress_completion___block_invoke(uint64_t a1, double a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, unint64_t))(result + 16))(result, (unint64_t)a2);
  }
  return result;
}

+ (void)updateAssets:(id)a3 subscription:(id)a4 policies:(id)a5 queue:(id)a6 progressWithStatus:(id)a7 completion:(id)a8
{
  id v13 = a7;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  uint64_t v19 = +[UAFAssetSetManager sharedManager];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __93__UAFAssetSetManager_updateAssets_subscription_policies_queue_progressWithStatus_completion___block_invoke;
  v21[3] = &unk_264CEBDB0;
  id v22 = v13;
  id v20 = v13;
  [v19 updateAssetsForSubscriber:v18 subscriptionName:v17 policies:v16 queue:v15 progress:v21 completion:v14];
}

uint64_t __93__UAFAssetSetManager_updateAssets_subscription_policies_queue_progressWithStatus_completion___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(result + 16))(result, (unint64_t)a3, a2);
  }
  return result;
}

+ (void)updateAssets:(id)a3 subscription:(id)a4 policies:(id)a5 queue:(id)a6 progress:(id)a7 completion:(id)a8 storeManager:(id)a9 configurationManager:(id)a10
{
  id v15 = a7;
  id v16 = a8;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = +[UAFAssetSetManager sharedManager];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __117__UAFAssetSetManager_updateAssets_subscription_policies_queue_progress_completion_storeManager_configurationManager___block_invoke;
  v23[3] = &unk_264CEBDB0;
  id v24 = v15;
  id v22 = v15;
  [v21 updateAssetsForSubscriber:v20 subscriptionName:v19 policies:v18 queue:v17 progress:v23 completion:v16];
}

uint64_t __117__UAFAssetSetManager_updateAssets_subscription_policies_queue_progress_completion_storeManager_configurationManager___block_invoke(uint64_t a1, double a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, unint64_t))(result + 16))(result, (unint64_t)a2);
  }
  return result;
}

void __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke_5(uint64_t a1)
{
}

void __151__UAFAssetSetManager_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_detailedProgress_completion_storeManager_configurationManager___block_invoke_7(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 48))
  {
    uint64_t v2 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v4 = 136315394;
      id v5 = "-[UAFAssetSetManager updateAssetsForSubscriber:subscriptionName:policies:queue:progress:detailedProgress:comp"
           "letion:storeManager:configurationManager:]_block_invoke_7";
      __int16 v6 = 2114;
      uint64_t v7 = v3;
      _os_log_impl(&dword_23797A000, v2, OS_LOG_TYPE_DEFAULT, "%s Dispatching completion method for Request ID %{public}@", (uint8_t *)&v4, 0x16u);
    }

    dispatch_async(*(dispatch_queue_t *)(a1 + 40), *(dispatch_block_t *)(a1 + 48));
  }
}

+ (id)sysdiagnoseInformationWithError:(id *)a3
{
  uint64_t v24 = 0;
  __int16 v25 = &v24;
  uint64_t v26 = 0x3032000000;
  __int16 v27 = __Block_byref_object_copy__6;
  BOOL v28 = __Block_byref_object_dispose__6;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__6;
  id v22 = __Block_byref_object_dispose__6;
  id v23 = 0;
  int v4 = dispatch_group_create();
  id v5 = objc_opt_new();
  dispatch_group_enter(v4);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__UAFAssetSetManager_sysdiagnoseInformationWithError___block_invoke;
  v13[3] = &unk_264CEBE78;
  id v6 = v5;
  id v14 = v6;
  id v16 = &v24;
  id v17 = &v18;
  uint64_t v7 = v4;
  id v15 = v7;
  [v6 diagnosticInformation:v13];
  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (a3) {
    *a3 = (id) v19[5];
  }
  uint64_t v8 = (void *)v25[5];
  if (!v8)
  {
    uint64_t v9 = [NSString stringWithFormat:@"No output found: %@", v19[5]];
    uint64_t v10 = (void *)v25[5];
    v25[5] = v9;

    uint64_t v8 = (void *)v25[5];
  }
  id v11 = v8;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

void __54__UAFAssetSetManager_sysdiagnoseInformationWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) invalidate];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

+ (void)processAssetSet:(id)a3 allAssets:(id)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v35 = a4;
  id v37 = [v5 assets];
  id v6 = +[UAFConfigurationManager defaultManager];
  uint64_t v7 = [v5 name];
  uint64_t v8 = [v6 getAssetSet:v7];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v33 = v8;
  id obj = [v8 assets];
  uint64_t v38 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
  if (v38)
  {
    uint64_t v36 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v54 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        id v11 = [v10 name];
        id v12 = [v37 objectForKey:v11];

        if (v12)
        {
          long long v39 = v12;
          uint64_t v40 = i;
          id v13 = [v12 metadata];
          id v14 = (void *)[v13 mutableCopy];

          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v41 = [v10 expansions];
          uint64_t v43 = [v41 countByEnumeratingWithState:&v49 objects:v58 count:16];
          if (v43)
          {
            uint64_t v42 = *(void *)v50;
            do
            {
              uint64_t v15 = 0;
              do
              {
                if (*(void *)v50 != v42) {
                  objc_enumerationMutation(v41);
                }
                uint64_t v44 = v15;
                id v16 = *(void **)(*((void *)&v49 + 1) + 8 * v15);
                long long v45 = 0u;
                long long v46 = 0u;
                long long v47 = 0u;
                long long v48 = 0u;
                id v17 = [v16 requiredUsageTypes];
                uint64_t v18 = [v17 countByEnumeratingWithState:&v45 objects:v57 count:16];
                if (v18)
                {
                  uint64_t v19 = v18;
                  uint64_t v20 = *(void *)v46;
                  do
                  {
                    for (uint64_t j = 0; j != v19; ++j)
                    {
                      if (*(void *)v46 != v20) {
                        objc_enumerationMutation(v17);
                      }
                      uint64_t v22 = *(void *)(*((void *)&v45 + 1) + 8 * j);
                      id v23 = [v5 usages];
                      uint64_t v24 = [v23 objectForKey:v22];

                      if (v24)
                      {
                        __int16 v25 = [@"com.apple.UnifiedAssetFramework.FoundUsageType." stringByAppendingString:v22];
                        [v14 setObject:v24 forKeyedSubscript:v25];
                      }
                    }
                    uint64_t v19 = [v17 countByEnumeratingWithState:&v45 objects:v57 count:16];
                  }
                  while (v19);
                }

                uint64_t v15 = v44 + 1;
              }
              while (v44 + 1 != v43);
              uint64_t v43 = [v41 countByEnumeratingWithState:&v49 objects:v58 count:16];
            }
            while (v43);
          }

          unint64_t v26 = [v14 count];
          id v12 = v39;
          __int16 v27 = [v39 metadata];
          unint64_t v28 = [v27 count];

          if (v26 <= v28)
          {
            [v35 addObject:v39];
          }
          else
          {
            id v29 = [UAFAsset alloc];
            uint64_t v30 = [v39 name];
            uint64_t v31 = [v39 location];
            char v32 = [(UAFAsset *)v29 initWithName:v30 location:v31 metadata:v14];
            [v35 addObject:v32];
          }
          uint64_t i = v40;
        }
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
    }
    while (v38);
  }
}

+ (id)getSystemUsageAssets:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __43__UAFAssetSetManager_getSystemUsageAssets___block_invoke;
  v14[3] = &unk_264CEBEA0;
  id v16 = a1;
  id v6 = v5;
  id v15 = v6;
  uint64_t v7 = (void *)MEMORY[0x237E26D50](v14);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __43__UAFAssetSetManager_getSystemUsageAssets___block_invoke_329;
  v12[3] = &unk_264CEBEC8;
  id v13 = v7;
  id v8 = v7;
  [v4 enumerateKeysAndObjectsUsingBlock:v12];

  uint64_t v9 = v13;
  id v10 = v6;

  return v10;
}

void __43__UAFAssetSetManager_getSystemUsageAssets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [[UAFAssetSet alloc] initWithAssetSet:v5 usages:v6];
  if (!v7)
  {
    p_super = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315650;
      id v14 = "+[UAFAssetSetManager getSystemUsageAssets:]_block_invoke";
      __int16 v15 = 2114;
      id v16 = v5;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_error_impl(&dword_23797A000, p_super, OS_LOG_TYPE_ERROR, "%s failed to init assetSet with assetSetName '%{public}@' and usages '%{public}@'", (uint8_t *)&v13, 0x20u);
    }
    goto LABEL_10;
  }
  [*(id *)(a1 + 40) processAssetSet:v7 allAssets:*(void *)(a1 + 32)];
  id v8 = [(UAFAssetSet *)v7 experimentId];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    id v10 = [[UAFAssetSet alloc] initWithAssetSet:v5 usages:v6 disableExperimentation:1];
    if (v10)
    {
      p_super = &v10->super;
      [*(id *)(a1 + 40) processAssetSet:v10 allAssets:*(void *)(a1 + 32)];
    }
    else
    {
      id v12 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136315650;
        id v14 = "+[UAFAssetSetManager getSystemUsageAssets:]_block_invoke";
        __int16 v15 = 2114;
        id v16 = v5;
        __int16 v17 = 2114;
        id v18 = v6;
        _os_log_error_impl(&dword_23797A000, v12, OS_LOG_TYPE_ERROR, "%s failed to init assetSetWithoutExperimentation with assetSetName '%{public}@' and usages '%{public}@'", (uint8_t *)&v13, 0x20u);
      }

      p_super = 0;
    }
LABEL_10:
  }
}

void __43__UAFAssetSetManager_getSystemUsageAssets___block_invoke_329(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
          (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (id)generateInformationWithError:(id *)a3
{
  uint64_t v118 = *MEMORY[0x263EF8340];
  uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  id v5 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    v111 = "+[UAFAssetSetManager generateInformationWithError:]";
    _os_log_impl(&dword_23797A000, v5, OS_LOG_TYPE_DEFAULT, "%s Generating subscription log", buf, 0xCu);
  }

  id v6 = +[UAFSubscriptionStoreManager defaultManager];
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  v70 = (void *)v4;
  uint64_t v8 = (void *)v4;
  uint64_t v9 = v6;
  [v8 setObject:v7 forKeyedSubscript:@"Subscriptions"];

  [v6 getSubscribers];
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [obj countByEnumeratingWithState:&v99 objects:v117 count:16];
  id v69 = v6;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v100;
    uint64_t v79 = *(void *)v100;
    do
    {
      uint64_t v13 = 0;
      uint64_t v81 = v11;
      do
      {
        if (*(void *)v100 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t k = *(void *)(*((void *)&v99 + 1) + 8 * v13);
        long long v14 = [v9 getSubscriptions:k error:0];
        long long v15 = v14;
        if (v14 && [v14 count])
        {
          id v16 = [MEMORY[0x263EFF9A0] dictionary];
          id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
          long long v95 = 0u;
          long long v96 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          id v18 = v15;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v95 objects:v116 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v96;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v96 != v21) {
                  objc_enumerationMutation(v18);
                }
                id v23 = [*(id *)(*((void *)&v95 + 1) + 8 * i) propertiesAsDictionary];
                [v17 addObject:v23];
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v95 objects:v116 count:16];
            }
            while (v20);
          }

          [v16 setObject:v17 forKeyedSubscript:k];
          uint64_t v24 = [v70 objectForKeyedSubscript:@"Subscriptions"];
          [v24 addObject:v16];

          __int16 v25 = UAFGetLogCategory((void **)&UAFLogContextClient);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 136315650;
            v111 = "+[UAFAssetSetManager generateInformationWithError:]";
            __int16 v112 = 2114;
            uint64_t v113 = k;
            __int16 v114 = 2114;
            id v115 = v18;
            _os_log_impl(&dword_23797A000, v25, OS_LOG_TYPE_DEFAULT, "%s Subscriptions for subscriber: %{public}@: %{public}@", buf, 0x20u);
          }

          uint64_t v9 = v69;
          uint64_t v12 = v79;
          uint64_t v11 = v81;
        }

        ++v13;
      }
      while (v13 != v11);
      uint64_t v11 = [obj countByEnumeratingWithState:&v99 objects:v117 count:16];
    }
    while (v11);
  }
  unint64_t v26 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    v111 = "+[UAFAssetSetManager generateInformationWithError:]";
    _os_log_impl(&dword_23797A000, v26, OS_LOG_TYPE_DEFAULT, "%s Generating asset usages log", buf, 0xCu);
  }

  __int16 v27 = [v9 getAllSystemAssetSetUsages:0];
  [v70 setObject:v27 forKeyedSubscript:@"SystemAssetSetUsages"];
  unint64_t v28 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    v111 = "+[UAFAssetSetManager generateInformationWithError:]";
    __int16 v112 = 2114;
    uint64_t v113 = (uint64_t)v27;
    _os_log_impl(&dword_23797A000, v28, OS_LOG_TYPE_DEFAULT, "%s System AssetSetUsages: %{public}@", buf, 0x16u);
  }

  id v29 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    v111 = "+[UAFAssetSetManager generateInformationWithError:]";
    _os_log_impl(&dword_23797A000, v29, OS_LOG_TYPE_DEFAULT, "%s Generating system asset log", buf, 0xCu);
  }

  v76 = [MEMORY[0x263EFF9A0] dictionary];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v74 = v27;
  uint64_t v30 = [v74 countByEnumeratingWithState:&v91 objects:v109 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v92;
    uint64_t k = (uint64_t)&UAFLogContextClient;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v92 != v32) {
          objc_enumerationMutation(v74);
        }
        id v34 = *(void **)(*((void *)&v91 + 1) + 8 * j);
        id v35 = [[UAFAssetSet alloc] initWithAssetSet:v34 usages:0];
        uint64_t v36 = v35;
        if (v35)
        {
          id v37 = [(UAFAssetSet *)v35 assetSetId];
          if (v37)
          {
            uint64_t v38 = [(UAFAssetSet *)v36 assetSetId];
            [v76 setObject:v38 forKeyedSubscript:v34];
          }
          else
          {
            [v76 setObject:@"none" forKeyedSubscript:v34];
          }

          long long v39 = UAFGetLogCategory((void **)&UAFLogContextClient);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v40 = [(UAFAssetSet *)v36 assetSetId];
            *(_DWORD *)long long buf = 136315650;
            v111 = "+[UAFAssetSetManager generateInformationWithError:]";
            __int16 v112 = 2114;
            uint64_t v113 = (uint64_t)v34;
            __int16 v114 = 2114;
            id v115 = v40;
            _os_log_impl(&dword_23797A000, v39, OS_LOG_TYPE_DEFAULT, "%s AssetSet Identifier: %{public}@: %{public}@", buf, 0x20u);
          }
        }
      }
      uint64_t v31 = [v74 countByEnumeratingWithState:&v91 objects:v109 count:16];
    }
    while (v31);
  }

  [v70 setObject:v76 forKeyedSubscript:@"AssetSetIdentifiers"];
  id v41 = +[UAFAssetSetManager getSystemUsageAssets:v74];
  id v80 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v73 = v41;
  uint64_t v42 = [v73 countByEnumeratingWithState:&v87 objects:v108 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v88;
    do
    {
      for (uint64_t k = 0; k != v43; ++k)
      {
        if (*(void *)v88 != v44) {
          objc_enumerationMutation(v73);
        }
        long long v45 = [*(id *)(*((void *)&v87 + 1) + 8 * k) propertiesAsDictionary:1];
        [v80 addObject:v45];
      }
      uint64_t v43 = [v73 countByEnumeratingWithState:&v87 objects:v108 count:16];
    }
    while (v43);
  }

  [v70 setObject:v80 forKeyedSubscript:@"SystemAssets"];
  long long v46 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    v111 = "+[UAFAssetSetManager generateInformationWithError:]";
    _os_log_impl(&dword_23797A000, v46, OS_LOG_TYPE_DEFAULT, "%s Generating system configuration log", buf, 0xCu);
  }

  uint64_t v47 = [v69 getAllSystemConfiguration];
  [v70 setObject:v47 forKeyedSubscript:@"SystemConfigKey"];
  long long v48 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    v111 = "+[UAFAssetSetManager generateInformationWithError:]";
    __int16 v112 = 2114;
    uint64_t v113 = v47;
    _os_log_impl(&dword_23797A000, v48, OS_LOG_TYPE_DEFAULT, "%s System Configuration: %{public}@", buf, 0x16u);
  }
  id v67 = (void *)v47;

  id v75 = objc_alloc_init(MEMORY[0x263EFF980]);
  +[UAFConfigurationManager defaultManager];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  v66 = long long v86 = 0u;
  id v71 = [v66 getAllAssetSets];
  uint64_t v82 = [v71 countByEnumeratingWithState:&v83 objects:v107 count:16];
  if (v82)
  {
    uint64_t v78 = *(void *)v84;
    do
    {
      for (uint64_t m = 0; m != v82; ++m)
      {
        if (*(void *)v84 != v78) {
          objc_enumerationMutation(v71);
        }
        long long v50 = *(void **)(*((void *)&v83 + 1) + 8 * m);
        long long v51 = [v50 name];

        if (v51)
        {
          long long v52 = [v50 name];
          v105 = v52;
          v103[0] = @"FileURL";
          long long v53 = [v50 originatingURL];
          if (v53)
          {
            v77 = [v50 originatingURL];
            uint64_t k = [v77 path];
            long long v54 = (__CFString *)k;
          }
          else
          {
            long long v54 = &stru_26EA999B8;
          }
          v104[0] = v54;
          v103[1] = @"PallasURL";
          long long v55 = [v50 name];
          long long v56 = +[UAFCommonUtilities getUAFPallasURLForAssetSet:v55];
          v104[1] = v56;
          v103[2] = @"Population";
          v57 = [v50 name];
          id v58 = +[UAFCommonUtilities getUAFPopulationForAssetSet:v57];
          v104[2] = v58;
          v59 = [NSDictionary dictionaryWithObjects:v104 forKeys:v103 count:3];
          v106 = v59;
          uint64_t v60 = [NSDictionary dictionaryWithObjects:&v106 forKeys:&v105 count:1];
          [v75 addObject:v60];

          if (v53)
          {
          }
        }
      }
      uint64_t v82 = [v71 countByEnumeratingWithState:&v83 objects:v107 count:16];
    }
    while (v82);
  }

  [v70 setObject:v75 forKeyedSubscript:@"AssetSetConfiguration"];
  unint64_t v61 = +[UAFAutoAssetHistory getPersistedAssetInfo];
  if ([MEMORY[0x263F08900] isValidJSONObject:v61])
  {
    [v70 setObject:v61 forKeyedSubscript:@"PersistedAssetInfo"];
    v62 = v67;
  }
  else
  {
    v63 = UAFGetLogCategory((void **)&UAFLogContextClient);
    v62 = v67;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      v111 = "+[UAFAssetSetManager generateInformationWithError:]";
      _os_log_impl(&dword_23797A000, v63, OS_LOG_TYPE_DEFAULT, "%s could not serialize persisted asset info array to json, not including in output", buf, 0xCu);
    }
  }
  v64 = +[UAFCommonUtilities serializeDictToJSONStr:v70 error:a3];

  return v64;
}

+ (void)configureAssetDelivery:(id)a3 configurationManager:(id)a4 lockIfUnchanged:(BOOL)a5 subscriptions:(id)a6 assetSetUsages:(id)a7 userInitiated:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v11 = a5;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  id v16 = a4;
  id v17 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 136315138;
    unint64_t v26 = "+[UAFAssetSetManager configureAssetDelivery:configurationManager:lockIfUnchanged:subscriptions:assetSetUsages:userInitiated:]";
    _os_log_impl(&dword_23797A000, v17, OS_LOG_TYPE_DEFAULT, "%s Configuring asset delivery systems", (uint8_t *)&v25, 0xCu);
  }

  id v18 = +[UAFAssetSetManager getSerialQueue];
  dispatch_assert_queue_V2(v18);

  if (!v13)
  {
    id v13 = +[UAFSubscriptionStoreManager writeManager];
  }
  id v19 = v14;
  id v20 = v15;
  uint64_t v21 = v19;
  if (!v19)
  {
    uint64_t v21 = [v13 getSubscriptions:0 error:0];
    if (!v21) {
      uint64_t v21 = objc_opt_new();
    }
  }
  uint64_t v22 = v20;
  if (!v20)
  {
    id v23 = +[UAFConfigurationManager defaultManager];
    uint64_t v22 = [v23 applySubscriptions:v21];
  }
  +[UAFAutoAssetManager configureAutoAssetsFromAssetSetUsages:v22 subscriptions:v21 configurationManager:v16 lockIfUnchanged:v11 userInitiated:v8];
  +[UAFTrialUpdateManager updateTrialFromAssetSetUsages:v22 storeManager:v13 configurationManager:v16];

  if (!v19) {
    id v24 = (id)[v13 updateSystemAssetSetUsages:0];
  }
}

+ (void)configureAssetDelivery:(id)a3 configurationManager:(id)a4 lockIfUnchanged:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = +[UAFAssetSetManager getSerialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__UAFAssetSetManager_configureAssetDelivery_configurationManager_lockIfUnchanged___block_invoke;
  block[3] = &unk_264CEABC8;
  id v13 = v7;
  id v14 = v8;
  BOOL v15 = a5;
  id v10 = v8;
  id v11 = v7;
  dispatch_sync(v9, block);
}

uint64_t __82__UAFAssetSetManager_configureAssetDelivery_configurationManager_lockIfUnchanged___block_invoke(uint64_t a1)
{
  return +[UAFAssetSetManager configureAssetDelivery:*(void *)(a1 + 32) configurationManager:*(void *)(a1 + 40) lockIfUnchanged:*(unsigned __int8 *)(a1 + 48) subscriptions:0 assetSetUsages:0 userInitiated:1];
}

+ (void)configureAssetDelivery:(id)a3 configurationManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[UAFAssetSetManager getSerialQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__UAFAssetSetManager_configureAssetDelivery_configurationManager___block_invoke;
  v10[3] = &unk_264CEAC18;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_sync(v7, v10);
}

uint64_t __66__UAFAssetSetManager_configureAssetDelivery_configurationManager___block_invoke(uint64_t a1)
{
  return +[UAFAssetSetManager configureAssetDelivery:*(void *)(a1 + 32) configurationManager:*(void *)(a1 + 40) lockIfUnchanged:1 subscriptions:0 assetSetUsages:0 userInitiated:1];
}

- (void)retrieveAssetSet:(id)a3 usages:(id)a4 consistencyToken:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!v14)
  {
    id v14 = +[UAFAssetSetManager getConcurrentQueue];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__UAFAssetSetManager_retrieveAssetSet_usages_consistencyToken_queue_completion___block_invoke;
  block[3] = &unk_264CEBF18;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  id v16 = v15;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  id v20 = v11;
  dispatch_async(v17, block);
}

void __80__UAFAssetSetManager_retrieveAssetSet_usages_consistencyToken_queue_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6;
  id v16 = __Block_byref_object_dispose__6;
  id v17 = [[UAFAssetSet alloc] initWithAssetSet:*(void *)(a1 + 32) usages:*(void *)(a1 + 40) configurationDirURLs:0 disableExperimentation:0 consistencyToken:*(void *)(a1 + 48)];
  uint64_t v2 = [(id)v13[5] autoAssetSetError];
  BOOL v3 = +[UAFAutoAssetManager shouldWaitForMobileAssetStart:v2];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 56);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __80__UAFAssetSetManager_retrieveAssetSet_usages_consistencyToken_queue_completion___block_invoke_2;
    v6[3] = &unk_264CEBEF0;
    id v11 = &v12;
    id v7 = v4;
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 64);
    +[UAFAutoAssetManager waitForMobileAssetStart:v7 queue:v5 completion:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  _Block_object_dispose(&v12, 8);
}

uint64_t __80__UAFAssetSetManager_retrieveAssetSet_usages_consistencyToken_queue_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = [[UAFAssetSet alloc] initWithAssetSet:a1[4] usages:a1[5] configurationDirURLs:0 disableExperimentation:0 consistencyToken:a1[6]];
  uint64_t v3 = *(void *)(a1[8] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(uint64_t (**)(void))(a1[7] + 16);

  return v5();
}

- (void)retrieveAssetSet:(id)a3 usages:(id)a4 queue:(id)a5 completion:(id)a6
{
}

- (id)retrieveAssetSet:(id)a3 usages:(id)a4 disableExperimentation:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = [[UAFAssetSet alloc] initWithAssetSet:v8 usages:v7 disableExperimentation:v5];

  return v9;
}

- (void)removeObserver:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = self->_assetSetObservers;
    objc_sync_enter(v6);
    [(NSMutableSet *)self->_assetSetObservers removeObject:v5];
    [v5 invalidate];
    objc_sync_exit(v6);
  }
  else
  {
    id v7 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      id v9 = "-[UAFAssetSetManager removeObserver:]";
      _os_log_error_impl(&dword_23797A000, v7, OS_LOG_TYPE_ERROR, "%s Unexpected token is not of kind UAFAssetSetObserver'", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)subscribe:(id)a3 subscriptions:(id)a4 queue:(id)a5 completion:(id)a6
{
}

- (void)unsubscribe:(id)a3 subscriptionNames:(id)a4 queue:(id)a5 completion:(id)a6
{
}

void __62__UAFAssetSetManager_subscriptionsForSubscriber_storeManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) invalidate];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)subscribedUsagesForAssetSet:(id)a3
{
  return +[UAFAssetSetManager getAssetSetUsages:a3 storeManager:0];
}

- (id)assetNamesForAssetSet:(id)a3 usages:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[UAFConfigurationManager defaultManager];
  int v8 = [v7 getAssetSet:v5];
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 getAssets:v6];
    if (v10)
    {
      id v11 = (void *)v10;
      id v25 = v9;
      id v26 = v6;
      id v27 = v5;
      uint64_t v12 = [MEMORY[0x263EFF980] array];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v13 = v11;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (!v14) {
        goto LABEL_14;
      }
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v29;
      while (1)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          id v19 = [v13 objectForKeyedSubscript:v18];
          id v20 = [v19 objectForKeyedSubscript:@"TrialFactor"];
          if (v20)
          {
          }
          else
          {
            uint64_t v21 = [v13 objectForKeyedSubscript:v18];
            id v22 = [v21 objectForKeyedSubscript:@"AssetSpecifier"];

            if (!v22) {
              continue;
            }
          }
          [v12 addObject:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (!v15)
        {
LABEL_14:

          id v6 = v26;
          id v5 = v27;
          id v9 = v25;
          goto LABEL_21;
        }
      }
    }
    id v23 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315650;
      id v34 = "-[UAFAssetSetManager assetNamesForAssetSet:usages:]";
      __int16 v35 = 2114;
      id v36 = v5;
      __int16 v37 = 2114;
      id v38 = v6;
      _os_log_impl(&dword_23797A000, v23, OS_LOG_TYPE_DEFAULT, "%s Error retrieving assets for %{public}@ with usages: %{public}@", buf, 0x20u);
    }

    id v13 = 0;
  }
  else
  {
    id v13 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      id v34 = "-[UAFAssetSetManager assetNamesForAssetSet:usages:]";
      __int16 v35 = 2114;
      id v36 = v5;
      _os_log_impl(&dword_23797A000, v13, OS_LOG_TYPE_DEFAULT, "%s No configuration for asset set: %{public}@", buf, 0x16u);
    }
  }
  uint64_t v12 = 0;
LABEL_21:

  return v12;
}

- (void)updateAssetsForSubscriber:(id)a3 subscriptionName:(id)a4 policies:(id)a5 queue:(id)a6 detailedProgress:(id)a7 completion:(id)a8
{
}

- (id)assetSetUsagesForStatusForSubscriber:(id)a3 subscriptionName:(id)a4 status:(unint64_t *)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  *a5 = 4;
  id v9 = +[UAFSubscriptionStoreManager defaultManager];
  uint64_t v10 = [v9 getSubscription:v8 subscriber:v7];

  id v11 = UAFGetLogCategory((void **)&UAFLogContextClient);
  uint64_t v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 136315906;
      id v20 = "-[UAFAssetSetManager assetSetUsagesForStatusForSubscriber:subscriptionName:status:]";
      __int16 v21 = 2114;
      id v22 = v7;
      __int16 v23 = 2114;
      id v24 = v8;
      __int16 v25 = 2114;
      id v26 = v10;
      _os_log_debug_impl(&dword_23797A000, v12, OS_LOG_TYPE_DEBUG, "%s Subscriptions for %{public}@ %{public}@: %{public}@", (uint8_t *)&v19, 0x2Au);
    }

    id v13 = [MEMORY[0x263EFF8C0] arrayWithObject:v10];
    if (v13)
    {
      uint64_t v14 = +[UAFConfigurationManager defaultManager];
      uint64_t v15 = [v14 applySubscriptions:v13];

      uint64_t v16 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        int v19 = 136315394;
        id v20 = "-[UAFAssetSetManager assetSetUsagesForStatusForSubscriber:subscriptionName:status:]";
        __int16 v21 = 2114;
        id v22 = v15;
        _os_log_debug_impl(&dword_23797A000, v16, OS_LOG_TYPE_DEBUG, "%s All asset set usages now %{public}@", (uint8_t *)&v19, 0x16u);
      }
    }
    else
    {
      id v17 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v19 = 136315394;
        id v20 = "-[UAFAssetSetManager assetSetUsagesForStatusForSubscriber:subscriptionName:status:]";
        __int16 v21 = 2114;
        id v22 = v10;
        _os_log_error_impl(&dword_23797A000, v17, OS_LOG_TYPE_ERROR, "%s Could not create array from '%{public}@'", (uint8_t *)&v19, 0x16u);
      }

      uint64_t v15 = 0;
      *a5 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315906;
      id v20 = "-[UAFAssetSetManager assetSetUsagesForStatusForSubscriber:subscriptionName:status:]";
      __int16 v21 = 2114;
      id v22 = v7;
      __int16 v23 = 2114;
      id v24 = v8;
      __int16 v25 = 2114;
      id v26 = 0;
      _os_log_error_impl(&dword_23797A000, v12, OS_LOG_TYPE_ERROR, "%s No subscriptions for %{public}@ %{public}@: %{public}@", (uint8_t *)&v19, 0x2Au);
    }

    uint64_t v15 = 0;
    *a5 = 0;
  }

  return v15;
}

- (void)downloadStatusForSubscriber:(id)a3 subscriptionName:(id)a4 queue:(id)a5 completion:(id)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = a5;
  id v13 = a6;
  uint64_t v14 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315650;
    __int16 v35 = "-[UAFAssetSetManager downloadStatusForSubscriber:subscriptionName:queue:completion:]";
    __int16 v36 = 2114;
    id v37 = v10;
    __int16 v38 = 2114;
    id v39 = v11;
    _os_log_impl(&dword_23797A000, v14, OS_LOG_TYPE_DEFAULT, "%s Downloading assets for subscriber: %{public}@ and subscription: %{public}@", buf, 0x20u);
  }

  if (!v12)
  {
    uint64_t v12 = +[UAFAssetSetManager getConcurrentQueue];
  }
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  uint64_t v15 = [(UAFAssetSetManager *)self assetSetUsagesForStatusForSubscriber:v10 subscriptionName:v11 status:&v33];
  if (v15)
  {
    uint64_t v16 = +[UAFConfigurationManager defaultManager];
    unint64_t v17 = +[UAFTrialUpdateManager getTrialDownloadStatusForUsages:v15 configurationManager:v16];

    uint64_t v18 = +[UAFConfigurationManager defaultManager];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __84__UAFAssetSetManager_downloadStatusForSubscriber_subscriptionName_queue_completion___block_invoke_2;
    v22[3] = &unk_264CEBF90;
    id v26 = &v30;
    unint64_t v27 = v17;
    id v23 = v10;
    id v24 = v11;
    id v25 = v13;
    +[UAFAutoAssetManager getDownloadStatusFromAssetSetUsages:v15 configurationManager:v18 queue:v12 completion:v22];

    int v19 = &v23;
  }
  else
  {
    id v20 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = (void *)v31[3];
      *(_DWORD *)long long buf = 136315906;
      __int16 v35 = "-[UAFAssetSetManager downloadStatusForSubscriber:subscriptionName:queue:completion:]";
      __int16 v36 = 2048;
      id v37 = v21;
      __int16 v38 = 2114;
      id v39 = v10;
      __int16 v40 = 2114;
      id v41 = v11;
      _os_log_impl(&dword_23797A000, v20, OS_LOG_TYPE_DEFAULT, "%s Returning status: %lu for subscriber: %{public}@ and subscription: %{public}@ as the asset set usages are nil", buf, 0x2Au);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __84__UAFAssetSetManager_downloadStatusForSubscriber_subscriptionName_queue_completion___block_invoke;
    block[3] = &unk_264CEBF68;
    int v19 = (id *)v29;
    v29[0] = v13;
    v29[1] = &v30;
    dispatch_async(v12, block);
  }

  _Block_object_dispose(&v30, 8);
}

uint64_t __84__UAFAssetSetManager_downloadStatusForSubscriber_subscriptionName_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

void __84__UAFAssetSetManager_downloadStatusForSubscriber_subscriptionName_queue_completion___block_invoke_2(void *a1, uint64_t a2)
{
  v19[2] = *MEMORY[0x263EF8340];
  v18[0] = @"autoasset";
  id v3 = [NSNumber numberWithUnsignedInteger:a2];
  v19[0] = v3;
  v18[1] = @"trial";
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a1[8]];
  v19[1] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];

  *(void *)(*(void *)(a1[7] + 8) + 24) = +[UAFAssetSetManager coalesceDownloadStatus:v5];
  id v6 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(*(void *)(a1[7] + 8) + 24);
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    int v10 = 136315906;
    id v11 = "-[UAFAssetSetManager downloadStatusForSubscriber:subscriptionName:queue:completion:]_block_invoke_2";
    __int16 v12 = 2048;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    uint64_t v15 = v8;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    _os_log_impl(&dword_23797A000, v6, OS_LOG_TYPE_DEFAULT, "%s Returning asset download status: %lu for subscriber: %{public}@ and subscription: %{public}@", (uint8_t *)&v10, 0x2Au);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (unint64_t)downloadStatusForSubscriber:(id)a3 subscriptionName:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315650;
    id v25 = "-[UAFAssetSetManager downloadStatusForSubscriber:subscriptionName:]";
    __int16 v26 = 2114;
    unint64_t v27 = (unint64_t)v6;
    __int16 v28 = 2114;
    id v29 = v7;
    _os_log_impl(&dword_23797A000, v8, OS_LOG_TYPE_DEFAULT, "%s Downloading assets for subscriber: %{public}@ and subscription: %{public}@", buf, 0x20u);
  }

  unint64_t v21 = 0;
  uint64_t v9 = [(UAFAssetSetManager *)self assetSetUsagesForStatusForSubscriber:v6 subscriptionName:v7 status:&v21];
  if (v9)
  {
    int v10 = +[UAFConfigurationManager defaultManager];
    unint64_t v11 = +[UAFTrialUpdateManager getTrialDownloadStatusForUsages:v9 configurationManager:v10];

    __int16 v12 = +[UAFConfigurationManager defaultManager];
    unint64_t v13 = +[UAFAutoAssetManager getDownloadStatusFromAssetSetUsages:v9 configurationManager:v12];

    v22[0] = @"autoasset";
    __int16 v14 = [NSNumber numberWithUnsignedInteger:v13];
    v22[1] = @"trial";
    v23[0] = v14;
    uint64_t v15 = [NSNumber numberWithUnsignedInteger:v11];
    v23[1] = v15;
    __int16 v16 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

    unint64_t v21 = +[UAFAssetSetManager coalesceDownloadStatus:v16];
    uint64_t v17 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315906;
      id v25 = "-[UAFAssetSetManager downloadStatusForSubscriber:subscriptionName:]";
      __int16 v26 = 2048;
      unint64_t v27 = v21;
      __int16 v28 = 2114;
      id v29 = v6;
      __int16 v30 = 2114;
      id v31 = v7;
      _os_log_impl(&dword_23797A000, v17, OS_LOG_TYPE_DEFAULT, "%s Returning asset download status: %lu for subscriber: %{public}@ and subscription: %{public}@", buf, 0x2Au);
    }

    unint64_t v18 = v21;
  }
  else
  {
    int v19 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315906;
      id v25 = "-[UAFAssetSetManager downloadStatusForSubscriber:subscriptionName:]";
      __int16 v26 = 2048;
      unint64_t v27 = v21;
      __int16 v28 = 2114;
      id v29 = v6;
      __int16 v30 = 2114;
      id v31 = v7;
      _os_log_impl(&dword_23797A000, v19, OS_LOG_TYPE_DEFAULT, "%s Returning status: %lu for subscriber: %{public}@ and subscription: %{public}@ as the asset set usages are nil", buf, 0x2Au);
    }

    unint64_t v18 = v21;
  }

  return v18;
}

+ (id)defaults
{
  if (qword_26AF0BAD0 != -1) {
    dispatch_once(&qword_26AF0BAD0, &__block_literal_global_382);
  }
  uint64_t v2 = (void *)qword_26AF0BAD8;

  return v2;
}

void __30__UAFAssetSetManager_defaults__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.UnifiedAssetFramework"];
  v1 = (void *)qword_26AF0BAD8;
  qword_26AF0BAD8 = v0;
}

+ (id)cacheDeleteDefaultsKeyForAutoAssetType:(id)a3 autoAssetSpecifier:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@-%@-%@", @"DisableCacheDelete", a3, a4];
}

+ (void)disableCacheDelete:(BOOL)a3 forAutoAssetType:(id)a4 autoAssetSpecifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = +[UAFAssetSetManager getSerialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__UAFAssetSetManager_disableCacheDelete_forAutoAssetType_autoAssetSpecifier___block_invoke;
  block[3] = &unk_264CEABC8;
  id v13 = v7;
  id v14 = v8;
  BOOL v15 = a3;
  id v10 = v8;
  id v11 = v7;
  dispatch_sync(v9, block);
}

void __77__UAFAssetSetManager_disableCacheDelete_forAutoAssetType_autoAssetSpecifier___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = +[UAFAssetSetManager cacheDeleteDefaultsKeyForAutoAssetType:*(void *)(a1 + 32) autoAssetSpecifier:*(void *)(a1 + 40)];
  int v3 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v4 = UAFGetLogCategory((void **)&UAFLogContextClient);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v13 = 136315650;
      id v14 = "+[UAFAssetSetManager disableCacheDelete:forAutoAssetType:autoAssetSpecifier:]_block_invoke";
      __int16 v15 = 2114;
      uint64_t v16 = v6;
      __int16 v17 = 2114;
      uint64_t v18 = v7;
      _os_log_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEFAULT, "%s Cache delete disabled for type %{public}@ specifier %{public}@", (uint8_t *)&v13, 0x20u);
    }

    id v8 = +[UAFAssetSetManager defaults];
    [v8 setBool:*(unsigned __int8 *)(a1 + 48) forKey:v2];
  }
  else
  {
    if (v5)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      int v13 = 136315650;
      id v14 = "+[UAFAssetSetManager disableCacheDelete:forAutoAssetType:autoAssetSpecifier:]_block_invoke";
      __int16 v15 = 2114;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      _os_log_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEFAULT, "%s Cache delete enabled for type %{public}@ specifier %{public}@", (uint8_t *)&v13, 0x20u);
    }

    id v8 = +[UAFAssetSetManager defaults];
    [v8 removeObjectForKey:v2];
  }

  id v11 = +[UAFSubscriptionStoreManager writeManager];
  __int16 v12 = +[UAFConfigurationManager defaultManager];
  +[UAFAssetSetManager configureAssetDelivery:v11 configurationManager:v12 lockIfUnchanged:0 subscriptions:0 assetSetUsages:0 userInitiated:0];
}

+ (void)autoAssetDetailsForAssetNamed:(id)a3 assetSet:(id)a4 usages:(id)a5 autoAssetType:(id *)a6 autoAssetSpecifier:(id *)a7
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = +[UAFConfigurationManager defaultManager];
  __int16 v15 = [v14 getAssetSet:v12];
  uint64_t v16 = v15;
  if (!v15)
  {
    uint64_t v18 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)long long buf = 136315394;
    __int16 v30 = "+[UAFAssetSetManager autoAssetDetailsForAssetNamed:assetSet:usages:autoAssetType:autoAssetSpecifier:]";
    __int16 v31 = 2114;
    id v32 = v12;
    __int16 v26 = "%s Failed to find configuration for asset set %{public}@'";
LABEL_15:
    _os_log_error_impl(&dword_23797A000, v18, OS_LOG_TYPE_ERROR, v26, buf, 0x16u);
    goto LABEL_13;
  }
  __int16 v17 = [v15 autoAssetType];

  if (!v17)
  {
    uint64_t v18 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)long long buf = 136315394;
    __int16 v30 = "+[UAFAssetSetManager autoAssetDetailsForAssetNamed:assetSet:usages:autoAssetType:autoAssetSpecifier:]";
    __int16 v31 = 2114;
    id v32 = v12;
    __int16 v26 = "%s Failed to find auto asset type for asset set %{public}@'";
    goto LABEL_15;
  }
  id v28 = v13;
  uint64_t v18 = [v16 getAutoAssets:v13];
  uint64_t v19 = [v18 objectForKeyedSubscript:v11];
  if (!v19) {
    goto LABEL_8;
  }
  id v20 = (void *)v19;
  [v18 objectForKeyedSubscript:v11];
  unint64_t v21 = a6;
  v23 = id v22 = a7;
  id v24 = objc_msgSend(v23, "objectForKeyedSubscript:");

  if (v24)
  {
    *unint64_t v21 = [v16 autoAssetType];
    id v25 = [v18 objectForKeyedSubscript:v11];
    *id v22 = [v25 objectForKeyedSubscript:@"AssetSpecifier"];
  }
  else
  {
LABEL_8:
    unint64_t v27 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315650;
      __int16 v30 = "+[UAFAssetSetManager autoAssetDetailsForAssetNamed:assetSet:usages:autoAssetType:autoAssetSpecifier:]";
      __int16 v31 = 2114;
      id v32 = v11;
      __int16 v33 = 2114;
      id v34 = v12;
      _os_log_error_impl(&dword_23797A000, v27, OS_LOG_TYPE_ERROR, "%s Failed to find auto asset specifier for asset %{public}@ in asset set %{public}@'", buf, 0x20u);
    }
  }
  id v13 = v28;
LABEL_13:
}

+ (BOOL)cacheDeleteDisabledForAutoAssetType:(id)a3 autoAssetSpecifier:(id)a4
{
  uint64_t v4 = +[UAFAssetSetManager cacheDeleteDefaultsKeyForAutoAssetType:a3 autoAssetSpecifier:a4];
  BOOL v5 = +[UAFAssetSetManager defaults];
  char v6 = [v5 BOOLForKey:v4];

  return v6;
}

- (void)disableCacheDelete:(BOOL)a3 forAssetNamed:(id)a4 assetSet:(id)a5 usages:(id)a6 queue:(id)a7 completion:(id)a8
{
  BOOL v12 = a3;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = a7;
  id v17 = a8;
  if (!v16)
  {
    uint64_t v16 = +[UAFAssetSetManager getConcurrentQueue];
  }
  id v42 = 0;
  id v43 = 0;
  +[UAFAssetSetManager autoAssetDetailsForAssetNamed:v13 assetSet:v14 usages:v15 autoAssetType:&v43 autoAssetSpecifier:&v42];
  id v18 = v43;
  id v19 = v42;
  id v20 = v19;
  if (v18 && v19)
  {
    if (+[UAFAssetSetManager cacheDeleteDisabledForAutoAssetType:v18 autoAssetSpecifier:v19] == v12)
    {
      __int16 v26 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v27 = @"NO";
        *(_DWORD *)long long buf = 136315906;
        uint64_t v47 = "-[UAFAssetSetManager disableCacheDelete:forAssetNamed:assetSet:usages:queue:completion:]";
        __int16 v48 = 2114;
        id v49 = v13;
        if (v12) {
          unint64_t v27 = @"YES";
        }
        __int16 v50 = 2114;
        id v51 = v14;
        __int16 v52 = 2114;
        long long v53 = v27;
        _os_log_impl(&dword_23797A000, v26, OS_LOG_TYPE_DEFAULT, "%s Not changing cache delete disabled for asset %{public}@ in asset set %{public}@ as it is already %{public}@", buf, 0x2Au);
      }

      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __88__UAFAssetSetManager_disableCacheDelete_forAssetNamed_assetSet_usages_queue_completion___block_invoke_397;
      v35[3] = &unk_264CEB800;
      id v36 = v17;
      dispatch_async(v16, v35);
      id v22 = v36;
    }
    else
    {
      v45[0] = @"ConfigureCacheDelete";
      v44[0] = @"Operation";
      v44[1] = @"CacheDeleteDisabled";
      unint64_t v21 = [NSNumber numberWithBool:v12];
      v45[1] = v21;
      v45[2] = v18;
      v44[2] = @"AutoAssetType";
      v44[3] = @"AssetSpecifier";
      v45[3] = v20;
      id v22 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:4];

      id v23 = objc_opt_new();
      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 3221225472;
      __int16 v30 = __88__UAFAssetSetManager_disableCacheDelete_forAssetNamed_assetSet_usages_queue_completion___block_invoke_2;
      __int16 v31 = &unk_264CEBD60;
      id v32 = v23;
      id v34 = v17;
      __int16 v33 = v16;
      id v24 = v23;
      id v25 = (void *)MEMORY[0x237E26D50](&v28);
      objc_msgSend(v24, "operationWithConfig:completion:", v22, v25, v28, v29, v30, v31);
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __88__UAFAssetSetManager_disableCacheDelete_forAssetNamed_assetSet_usages_queue_completion___block_invoke;
    block[3] = &unk_264CEBFB8;
    id v38 = v13;
    id v39 = v14;
    id v40 = v15;
    id v41 = v17;
    dispatch_async(v16, block);

    id v22 = v38;
  }
}

void __88__UAFAssetSetManager_disableCacheDelete_forAssetNamed_assetSet_usages_queue_completion___block_invoke(void *a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [NSString stringWithFormat:@"Failed to get auto asset configuration for asset %@ in asset set %@ with usages %@", a1[4], a1[5], a1[6]];
  int v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F08338];
  v7[0] = v2;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  BOOL v5 = [v3 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v4];

  (*(void (**)(void))(a1[7] + 16))();
}

uint64_t __88__UAFAssetSetManager_disableCacheDelete_forAssetNamed_assetSet_usages_queue_completion___block_invoke_397(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__UAFAssetSetManager_disableCacheDelete_forAssetNamed_assetSet_usages_queue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) invalidate];
  uint64_t v4 = *(void **)(a1 + 48);
  if (v4)
  {
    BOOL v5 = *(NSObject **)(a1 + 40);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __88__UAFAssetSetManager_disableCacheDelete_forAssetNamed_assetSet_usages_queue_completion___block_invoke_3;
    v6[3] = &unk_264CEB4D0;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __88__UAFAssetSetManager_disableCacheDelete_forAssetNamed_assetSet_usages_queue_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)cacheDeleteDisabledForAssetNamed:(id)a3 assetSet:(id)a4 usages:(id)a5
{
  id v11 = 0;
  id v12 = 0;
  +[UAFAssetSetManager autoAssetDetailsForAssetNamed:a3 assetSet:a4 usages:a5 autoAssetType:&v12 autoAssetSpecifier:&v11];
  id v5 = v12;
  id v6 = v11;
  id v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = v8
    || +[UAFAssetSetManager cacheDeleteDisabledForAutoAssetType:v5 autoAssetSpecifier:v6];

  return v9;
}

- (BOOL)assetDeliveryReady
{
  return [MEMORY[0x263F55960] hasStartupActivatedCompletedOnce];
}

- (NSMutableSet)assetSetObservers
{
  return (NSMutableSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAssetSetObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end