@interface FCUserVectorManager
- (FCAsyncSerialQueue)queue;
- (FCCloudContext)context;
- (FCReadonlyAggregateStoreProviderType)aggregateStoreProvider;
- (FCUserVector)userVector;
- (FCUserVectorAggregateVectorProvider)tabiBasedAggregateVectorProvider;
- (FCUserVectorManager)initWithContext:(id)a3;
- (NSDate)lastUpdated;
- (void)_applicationDidEnterBackground;
- (void)_cacheGSToken;
- (void)_fetchUserVector:(id)a3;
- (void)_submitPersonalizationVector;
- (void)setAggregateStoreProvider:(id)a3;
- (void)setContext:(id)a3;
- (void)setLastUpdated:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTabiBasedAggregateVectorProvider:(id)a3;
- (void)setUserVector:(id)a3;
@end

@implementation FCUserVectorManager

- (void)_cacheGSToken
{
  v2 = [(FCUserVectorManager *)self context];
  id v5 = [v2 newsletterManager];

  v3 = +[FCAppleAccount sharedAccount];
  if ([v5 enabled]) {
    id v4 = (id)[v3 getGSToken];
  }
}

- (FCCloudContext)context
{
  return self->_context;
}

- (FCUserVectorManager)initWithContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FCUserVectorManager;
  v6 = [(FCUserVectorManager *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v8 = [[FCAsyncSerialQueue alloc] initWithQualityOfService:17];
    queue = v7->_queue;
    v7->_queue = v8;

    v10 = [v5 appActivityMonitor];
    [v10 addObserver:v7];
  }
  return v7;
}

- (void)setTabiBasedAggregateVectorProvider:(id)a3
{
}

- (void)setAggregateStoreProvider:(id)a3
{
}

- (void)_applicationDidEnterBackground
{
  [MEMORY[0x1E4F29060] isMainThread];
  [(FCUserVectorManager *)self _submitPersonalizationVector];
}

- (void)_submitPersonalizationVector
{
  v3 = [(FCUserVectorManager *)self context];
  id v4 = [v3 newsletterManager];
  int v5 = [v4 shouldSubmitPersonalizationVector];

  if (v5)
  {
    v6 = [(FCUserVectorManager *)self context];
    v7 = [v6 appConfigurationManager];
    v8 = [v7 possiblyUnfetchedAppConfiguration];
    v9 = [v8 personalizationTreatment];

    v10 = [(FCUserVectorManager *)self context];
    v11 = [v10 backgroundTaskable];

    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    uint64_t v44 = 0;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_2;
    v38[3] = &unk_1E5B4F3B0;
    id v12 = v11;
    id v39 = v12;
    v40 = &v41;
    uint64_t v13 = objc_msgSend(v12, "fc_beginBackgroundTaskWithName:expirationHandler:", @"User Vector Upload", v38);
    v42[3] = v13;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_3;
    aBlock[3] = &unk_1E5B4F3B0;
    id v14 = v12;
    id v36 = v14;
    v37 = &v41;
    v15 = _Block_copy(aBlock);
    if ([v9 computeUserVectorWithTabi])
    {
      v16 = [(FCUserVectorManager *)self tabiBasedAggregateVectorProvider];
      if (v16)
      {
        id v17 = v16;
        v18 = dispatch_get_global_queue(17, 0);
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_20;
        v26[3] = &unk_1E5B57F60;
        v26[4] = self;
        id v27 = v17;
        id v28 = v9;
        id v29 = v15;
        id v19 = v17;
        dispatch_async(v18, v26);

LABEL_7:
LABEL_12:

        _Block_object_dispose(&v41, 8);
        return;
      }
      v24 = FCPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v25 = "Not submitting personalization vector due to missing tabi based aggregate vector provider";
LABEL_15:
        _os_log_fault_impl(&dword_1A460D000, v24, OS_LOG_TYPE_FAULT, v25, buf, 2u);
      }
    }
    else
    {
      v20 = [(FCUserVectorManager *)self aggregateStoreProvider];
      if (v20)
      {
        id v19 = v20;
        v21 = [v19 aggregateStore];
        v22 = dispatch_get_global_queue(17, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_8;
        block[3] = &unk_1E5B575E8;
        id v31 = v21;
        id v32 = v9;
        v33 = self;
        id v34 = v15;
        id v23 = v21;
        dispatch_async(v22, block);

        goto LABEL_7;
      }
      v24 = FCPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v25 = "Not submitting personalization vector due to missing aggregate store provider";
        goto LABEL_15;
      }
    }
    id v19 = 0;
    goto LABEL_12;
  }
}

uint64_t __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fc_endBackgroundTask:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

void __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_3(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_4;
  v4[3] = &unk_1E5B4F3B0;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  FCPerformBlockOnMainThread(v4);
}

uint64_t __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fc_endBackgroundTask:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

void __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_8(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_2_9;
  v4[3] = &unk_1E5B575E8;
  id v5 = v2;
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = v3;
  [v5 prepareAggregatesForUseWithCompletionHandler:v4];
}

void __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_2_9(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) baselineAggregateWithConfigurableValues:*(void *)(a1 + 40)];
  unint64_t v3 = [v2 eventCount];
  if (v3 <= [*(id *)(a1 + 40) minBaselineEventsToSubmitUserVector])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_3_10;
    v14[3] = &unk_1E5B4CC80;
    id v4 = &v15;
    id v15 = v2;
    id v6 = &v16;
    id v16 = *(id *)(a1 + 56);
    __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_3_10((uint64_t)v14);
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_11;
    v9[3] = &unk_1E5B57F88;
    id v4 = &v13;
    id v5 = *(void **)(a1 + 48);
    id v13 = *(id *)(a1 + 56);
    id v6 = &v10;
    id v10 = *(id *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    id v11 = v7;
    uint64_t v12 = v8;
    [v5 _fetchUserVector:v9];
  }
}

uint64_t __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_3_10(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_debug_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEBUG, "Not submitting personalization vector due to insufficient baseline events: %@.", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_2_12;
    v20[3] = &unk_1E5B4CC80;
    uint64_t v8 = &v21;
    id v21 = v6;
    v9 = &v22;
    id v22 = *(id *)(a1 + 56);
    __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_2_12((uint64_t)v20);
  }
  else
  {
    id v10 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_13;
    block[3] = &unk_1E5B55018;
    uint64_t v8 = &v15;
    id v15 = v5;
    v9 = &v16;
    id v16 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = *(void **)(a1 + 56);
    id v17 = v11;
    uint64_t v18 = v12;
    id v19 = v13;
    dispatch_async(v10, block);
  }
}

uint64_t __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_2_12(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "Error in retrieving user vector provider: %@", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_13(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  unint64_t v3 = [[FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider alloc] initWithReadonlyPersonalizationAggregateStore:*(void *)(a1 + 40) personalizationTreatment:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(a1 + 48);
  int v5 = [*(id *)(a1 + 56) context];
  uint64_t v6 = [v5 feedPersonalizer];
  uint64_t v7 = [*(id *)(a1 + 56) context];
  uint64_t v8 = [v7 newsletterManager];
  v9 = objc_msgSend(v2, "computePersonalizationVectorWithAggregateVectorProvider:personalizationTreatment:tagRanker:options:", v3, v4, v6, objc_msgSend(v8, "includeOptions"));

  id v10 = (void *)FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    uint64_t v12 = [v9 personalizationVector];
    id v13 = [v9 version];
    id v14 = [v9 bundleSubscribedVector];
    id v15 = [v9 bundleSubscribedVectorVersion];
    *(_DWORD *)buf = 138413058;
    id v22 = v12;
    __int16 v23 = 2112;
    v24 = v13;
    __int16 v25 = 2112;
    v26 = v14;
    __int16 v27 = 2112;
    id v28 = v15;
    _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "Generated personalization vector %@ with version %@, and bundle subscribed vector %@ with version %@.", buf, 0x2Au);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_15;
  v17[3] = &unk_1E5B57F60;
  v17[4] = *(void *)(a1 + 56);
  id v18 = v9;
  id v19 = *(id *)(a1 + 32);
  id v20 = *(id *)(a1 + 64);
  id v16 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v17);
}

uint64_t __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_15(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) context];
  unint64_t v3 = [v2 newsletterManager];
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = [*(id *)(a1 + 48) subscribedBundleChannelIDs];
  [v3 submitPersonalizationVector:v4 subscribedBundleChannelIDs:v5];

  uint64_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v6();
}

void __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_20(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_2_21;
  v5[3] = &unk_1E5B57F88;
  id v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v9 = *(id *)(a1 + 56);
  [v2 _fetchUserVector:v5];
}

void __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_2_21(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 48) context];
  id v7 = [v6 feedPersonalizer];
  uint64_t v8 = [*(id *)(a1 + 48) context];
  id v9 = [v8 newsletterManager];
  id v10 = objc_msgSend(v3, "computePersonalizationVectorWithAggregateVectorProvider:personalizationTreatment:tagRanker:options:", v4, v5, v7, objc_msgSend(v9, "includeOptions"));

  id v11 = (void *)FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    id v13 = [v10 personalizationVector];
    id v14 = [v10 version];
    id v15 = [v10 bundleSubscribedVector];
    id v16 = [v10 bundleSubscribedVectorVersion];
    *(_DWORD *)buf = 138413058;
    __int16 v25 = v13;
    __int16 v26 = 2112;
    __int16 v27 = v14;
    __int16 v28 = 2112;
    uint64_t v29 = v15;
    __int16 v30 = 2112;
    id v31 = v16;
    _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "Generated personalization vector %@ with version %@, and bundle subscribed vector %@ with version %@.", buf, 0x2Au);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_22;
  v20[3] = &unk_1E5B57F60;
  id v17 = *(void **)(a1 + 56);
  void v20[4] = *(void *)(a1 + 48);
  id v21 = v10;
  id v22 = v3;
  id v23 = v17;
  id v18 = v3;
  id v19 = v10;
  dispatch_async(MEMORY[0x1E4F14428], v20);
}

uint64_t __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_22(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 newsletterManager];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = [*(id *)(a1 + 48) subscribedBundleChannelIDs];
  [v3 submitPersonalizationVector:v4 subscribedBundleChannelIDs:v5];

  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v6();
}

- (void)_fetchUserVector:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FCUserVectorManager *)self userVector];
  if (!v5) {
    goto LABEL_4;
  }
  id v6 = (void *)v5;
  uint64_t v7 = [(FCUserVectorManager *)self userVector];
  if (!v7)
  {

    goto LABEL_6;
  }
  uint64_t v8 = (void *)v7;
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  id v10 = [(FCUserVectorManager *)self lastUpdated];
  [v9 timeIntervalSinceDate:v10];
  double v12 = v11;

  if (v12 <= 86400.0)
  {
LABEL_6:
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke;
    v18[3] = &unk_1E5B4C7C0;
    v18[4] = self;
    id v19 = v4;
    __40__FCUserVectorManager__fetchUserVector___block_invoke((uint64_t)v18);

    goto LABEL_7;
  }
LABEL_4:
  objc_initWeak(&location, self);
  id v13 = [(FCUserVectorManager *)self queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_2;
  v14[3] = &unk_1E5B58078;
  objc_copyWeak(&v16, &location);
  void v14[4] = self;
  id v15 = v4;
  [v13 enqueueBlock:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
LABEL_7:
}

void __40__FCUserVectorManager__fetchUserVector___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) userVector];
    (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
  }
}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = [WeakRetained context];
  id v6 = [v5 subscriptionController];
  uint64_t v7 = dispatch_get_global_queue(17, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_3;
  v9[3] = &unk_1E5B58050;
  id v10 = *(id *)(a1 + 40);
  id v8 = v3;
  id v11 = v8;
  objc_copyWeak(&v12, (id *)(a1 + 48));
  void v9[4] = *(void *)(a1 + 32);
  [v6 fetchSubscribedTagsWithCallbackQueue:v7 preferCache:1 completion:v9];

  objc_destroyWeak(&v12);
}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_4;
  aBlock[3] = &unk_1E5B57FB0;
  id v40 = *(id *)(a1 + 40);
  id v41 = *(id *)(a1 + 48);
  id v4 = _Block_copy(aBlock);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    v24 = WeakRetained;
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v25 = v3;
    id v8 = v3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v14 = objc_msgSend(v13, "asSports", v24);

          if (v14)
          {
            id v15 = [v13 identifier];
            objc_msgSend(v7, "insertObject:atIndex:", v15, objc_msgSend(v7, "count"));
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v42 count:16];
      }
      while (v10);
    }

    id v16 = FCPersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v16, OS_LOG_TYPE_DEFAULT, "Attempting a user vector resource fetch", buf, 2u);
    }
    id v17 = v24;
    id v18 = objc_msgSend(v24, "context", v24);
    id v19 = [v18 appConfigurationManager];
    id v20 = dispatch_get_global_queue(17, 0);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_26;
    v26[3] = &unk_1E5B58028;
    v26[4] = *(void *)(a1 + 32);
    void v26[5] = v17;
    id v27 = v7;
    id v28 = v4;
    id v21 = v4;
    id v22 = v7;
    [v19 fetchAppConfigurationIfNeededWithCompletionQueue:v20 completion:v26];

    id v3 = v25;
    goto LABEL_16;
  }
  uint64_t v34 = MEMORY[0x1E4F143A8];
  uint64_t v35 = 3221225472;
  id v36 = __40__FCUserVectorManager__fetchUserVector___block_invoke_5;
  v37 = &unk_1E5B4CA88;
  v38 = v4;
  if (v4)
  {
    id v23 = (void (*)(void))v4[2];
    id v17 = v4;
    v23();
    id v22 = v38;
LABEL_16:
  }
}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v5);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

uint64_t __40__FCUserVectorManager__fetchUserVector___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_2_27;
    v38[3] = &unk_1E5B4CC80;
    id v39 = v6;
    id v40 = *(id *)(a1 + 56);
    __40__FCUserVectorManager__fetchUserVector___block_invoke_2_27((uint64_t)v38);

    id v8 = v39;
  }
  else
  {
    uint64_t v9 = [v5 userVectorWhitelistResourceId];
    if (v9)
    {
      id v8 = v9;
      uint64_t v10 = FCPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v43 = v8;
        _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "Found userVectorWhitelistResourceId: %@, building fetch operation", buf, 0xCu);
      }
      uint64_t v11 = [v5 userVectorModelResourceId];
      id v12 = v11;
      if (v11)
      {
        id v13 = v11;
        id v14 = FCPersonalizationLog;
        if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v43 = v8;
          _os_log_impl(&dword_1A460D000, v14, OS_LOG_TYPE_DEFAULT, "Found userVectorModelResourceId: %@, building fetch operation", buf, 0xCu);
        }
        id v15 = [FCResourcesFetchOperation alloc];
        id v16 = [*(id *)(a1 + 32) context];
        v41[0] = v8;
        v41[1] = v13;
        id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
        id v18 = [(FCResourcesFetchOperation *)v15 initWithContext:v16 resourceIDs:v17 downloadAssets:1];

        [(FCFetchOperation *)v18 setCachePolicy:4];
        [(FCFetchOperation *)v18 setMaximumCachedAge:86400.0];
        [(FCOperation *)v18 setQualityOfService:9];
        [(FCOperation *)v18 setRelativePriority:0];
        id v19 = [(FCOperation *)v18 shortOperationDescription];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_40;
        v24[3] = &unk_1E5B58000;
        id v25 = v19;
        id v26 = 0;
        id v33 = *(id *)(a1 + 56);
        id v27 = v8;
        id v28 = v13;
        uint64_t v29 = *(void *)(a1 + 40);
        id v20 = v5;
        uint64_t v21 = *(void *)(a1 + 32);
        id v30 = v20;
        uint64_t v31 = v21;
        id v32 = *(id *)(a1 + 48);
        id v22 = v13;
        id v23 = v19;
        [(FCFetchOperation *)v18 setFetchCompletionBlock:v24];
        [(FCOperation *)v18 start];
      }
      else
      {
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_34;
        v34[3] = &unk_1E5B4CA88;
        uint64_t v35 = (FCResourcesFetchOperation *)*(id *)(a1 + 56);
        __40__FCUserVectorManager__fetchUserVector___block_invoke_34((uint64_t)v34);
        id v18 = v35;
      }
    }
    else
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_28;
      v36[3] = &unk_1E5B4CA88;
      id v37 = *(id *)(a1 + 56);
      __40__FCUserVectorManager__fetchUserVector___block_invoke_28((uint64_t)v36);

      id v8 = 0;
    }
  }
}

uint64_t __40__FCUserVectorManager__fetchUserVector___block_invoke_2_27(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "App config returned error: %@", (uint8_t *)&v5, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_28(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "App config contained no userVectorWhitelistResourceId", v7, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F28568];
    v9[0] = @"Didn't find a userVectorWhitelistResourceId in the News app config";
    int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    uint64_t v6 = [v4 errorWithDomain:@"FCErrorDomain" code:19 userInfo:v5];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v6);
  }
}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_34(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "App config contained no userVectorModelResourceId", v7, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F28568];
    v9[0] = @"Didn't find a userVectorModelResourceId in the News app config";
    int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    uint64_t v6 = [v4 errorWithDomain:@"FCErrorDomain" code:19 userInfo:v5];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v6);
  }
}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_40(uint64_t a1, void *a2)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 error];

  if (v4)
  {
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_2_41;
    v61[3] = &unk_1E5B4E088;
    int v5 = &v62;
    id v62 = *(id *)(a1 + 32);
    id v63 = *(id *)(a1 + 40);
    id v64 = *(id *)(a1 + 96);
    __40__FCUserVectorManager__fetchUserVector___block_invoke_2_41(v61);

    uint64_t v6 = v63;
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_42;
    v59[3] = &unk_1E5B4BF78;
    int v5 = &v60;
    id v60 = v3;
    uint64_t v6 = objc_msgSend(v7, "fc_dictionary:", v59);
    uint64_t v8 = [v6 objectForKeyedSubscript:*(void *)(a1 + 48)];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = v8;
      uint64_t v11 = [v6 objectForKeyedSubscript:*(void *)(a1 + 56)];
      id v12 = v11;
      if (v11)
      {
        id v44 = v11;
        id v13 = FCPersonalizationLog;
        if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v66 = v10;
          __int16 v67 = 2112;
          id v68 = v44;
          _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "Got resources: %@, %@", buf, 0x16u);
        }
        id v14 = [v10 fileURL];
        id v43 = v14;
        if (v14)
        {
          id v42 = v14;
          id v15 = v44;
          id v16 = [v44 fileURL];
          id v41 = v16;
          if (v16)
          {
            id v39 = v12;
            id v40 = v10;
            id v17 = v16;
            id v18 = FCPersonalizationLog;
            if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v66 = v42;
              __int16 v67 = 2112;
              id v68 = v17;
              _os_log_impl(&dword_1A460D000, v18, OS_LOG_TYPE_DEFAULT, "Got file URLs: %@, %@", buf, 0x16u);
            }
            id v37 = [FCUserVector alloc];
            uint64_t v31 = [*(id *)(a1 + 72) personalizationTreatment];
            id v36 = [*(id *)(a1 + 80) context];
            uint64_t v35 = [v36 bundleSubscriptionManager];
            uint64_t v34 = [v35 bundleSubscription];
            uint64_t v29 = [v34 bundleChannelIDs];
            id v33 = [*(id *)(a1 + 80) context];
            id v32 = [v33 bundleSubscriptionManager];
            id v30 = [v32 bundleSubscription];
            id v19 = [v30 bundleChannelIDsVersion];
            id v20 = [*(id *)(a1 + 80) context];
            uint64_t v21 = [v20 subscriptionController];
            id v22 = v37;
            id v38 = v17;
            id v23 = [(FCUserVector *)v22 initWithWhitelistURL:v42 modelURL:v17 personalizationTreatment:v31 bundleChannelIDs:v29 bundleChannelIDsVersion:v19 subscriptionController:v21 sportsTagIDs:*(void *)(a1 + 88)];
            [*(id *)(a1 + 64) setUserVector:v23];

            v24 = [MEMORY[0x1E4F1C9C8] date];
            [*(id *)(a1 + 64) setLastUpdated:v24];

            uint64_t v25 = *(void *)(a1 + 96);
            if (v25)
            {
              id v26 = [*(id *)(a1 + 64) userVector];
              (*(void (**)(uint64_t, void *, void))(v25 + 16))(v25, v26, 0);
            }
            id v12 = v39;
            id v10 = v40;
            id v15 = v44;
            id v27 = v38;
          }
          else
          {
            v45[0] = MEMORY[0x1E4F143A8];
            v45[1] = 3221225472;
            v45[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_61;
            v45[3] = &unk_1E5B4C7C0;
            id v47 = *(id *)(a1 + 96);
            id v46 = v44;
            __40__FCUserVectorManager__fetchUserVector___block_invoke_61((uint64_t)v45);

            id v27 = v47;
          }

          id v28 = v42;
        }
        else
        {
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_57;
          v48[3] = &unk_1E5B4C7C0;
          id v50 = *(id *)(a1 + 96);
          id v49 = v10;
          __40__FCUserVectorManager__fetchUserVector___block_invoke_57((uint64_t)v48);

          id v28 = v50;
          id v15 = v44;
        }
      }
      else
      {
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_56;
        v51[3] = &unk_1E5B4F080;
        id v54 = *(id *)(a1 + 96);
        id v52 = *(id *)(a1 + 56);
        id v53 = v6;
        __40__FCUserVectorManager__fetchUserVector___block_invoke_56((uint64_t)v51);

        id v15 = v54;
      }
    }
    else
    {
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_52;
      v55[3] = &unk_1E5B4F080;
      id v58 = *(id *)(a1 + 96);
      id v56 = *(id *)(a1 + 48);
      id v57 = v6;
      __40__FCUserVectorManager__fetchUserVector___block_invoke_52((uint64_t)v55);

      id v10 = v58;
    }
  }
}

uint64_t __40__FCUserVectorManager__fetchUserVector___block_invoke_2_41(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    int v6 = 138412546;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "Fetch operation: %@ error: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, a1[5]);
  }
  return result;
}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_42(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) fetchedObject];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_2_43;
  v6[3] = &unk_1E5B57FD8;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_2_43(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 resourceID];
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "resourceIdentifier");
    *(_DWORD *)buf = 136315906;
    id v7 = "-[FCUserVectorManager _fetchUserVector:]_block_invoke_2";
    __int16 v8 = 2080;
    uint64_t v9 = "FCUserVectorManager.m";
    __int16 v10 = 1024;
    int v11 = 292;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  objc_msgSend(*(id *)(a1 + 32), "fc_safelySetObjectAllowingNil:forKeyAllowingNil:", v3, v4);
}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_52(uint64_t a1)
{
  id v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "No whitelist resource provided back from fetch operation", buf, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
    id v5 = NSString;
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];
    __int16 v8 = [v5 stringWithFormat:@"Failed to find a resource for ID: %@, got back: %@", v6, v7];
    uint64_t v9 = objc_msgSend(v4, "fc_missingResourceErrorWithDescription:", v8);
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v9);
  }
}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_56(uint64_t a1)
{
  id v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "No model resource provided back from fetch operation", buf, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
    id v5 = NSString;
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];
    __int16 v8 = [v5 stringWithFormat:@"Failed to find a resource for ID: %@, got back: %@", v6, v7];
    uint64_t v9 = objc_msgSend(v4, "fc_missingResourceErrorWithDescription:", v8);
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v9);
  }
}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_57(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "Whitelist resource had no fileURL", buf, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28568];
    id v5 = [NSString stringWithFormat:@"Got a nil fileURL for resource: %@", *(void *)(a1 + 32)];
    v10[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v7 = [v4 errorWithDomain:@"FCErrorDomain" code:19 userInfo:v6];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v7);
  }
}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_61(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "Model resource had no fileURL", buf, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28568];
    id v5 = [NSString stringWithFormat:@"Got a nil fileURL for resource: %@", *(void *)(a1 + 32)];
    v10[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v7 = [v4 errorWithDomain:@"FCErrorDomain" code:19 userInfo:v6];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v7);
  }
}

- (FCUserVectorAggregateVectorProvider)tabiBasedAggregateVectorProvider
{
  return self->_tabiBasedAggregateVectorProvider;
}

- (FCReadonlyAggregateStoreProviderType)aggregateStoreProvider
{
  return self->_aggregateStoreProvider;
}

- (void)setContext:(id)a3
{
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
}

- (FCAsyncSerialQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (FCUserVector)userVector
{
  return self->_userVector;
}

- (void)setUserVector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userVector, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_aggregateStoreProvider, 0);
  objc_storeStrong((id *)&self->_tabiBasedAggregateVectorProvider, 0);
}

@end