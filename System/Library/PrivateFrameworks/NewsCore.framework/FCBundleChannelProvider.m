@interface FCBundleChannelProvider
- (FCBundleChannelProviderDelegate)delegate;
- (NSArray)bundleChannelIDs;
- (NSString)bundleChannelIDsVersion;
- (id)initWithLocalStore:(void *)a3 appActivityMonitor:(void *)a4 configurationManager:(void *)a5 contentContext:;
- (void)activityObservingApplicationWindowWillBecomeForeground;
- (void)loadInitialBundleChannelIDsWithCompletion:(id)a3;
- (void)refreshBundleChannelIDsWithCompletion:(id *)a1;
- (void)setBundleChannelIDs:(id)a3;
- (void)setBundleChannelIDsVersion:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation FCBundleChannelProvider

void __69__FCBundleChannelProvider_fetchBundleTagIDsForPurchaseID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 fetchedObject];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)activityObservingApplicationWindowWillBecomeForeground
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __81__FCBundleChannelProvider_activityObservingApplicationWindowWillBecomeForeground__block_invoke;
  v2[3] = &unk_1E5B4C018;
  v2[4] = self;
  +[FCTaskScheduler scheduleLowPriorityBlockForMainThread:v2];
}

void __65__FCBundleChannelProvider_refreshBundleChannelIDsWithCompletion___block_invoke_12(uint64_t a1, void *a2)
{
  id v19 = a2;
  if (v19)
  {
    id v3 = [v19 bundleChannelIDsByPurchaseID];
    v4 = [v3 objectForKey:*(void *)(a1 + 32)];

    v5 = [v19 bundleChannelIDsVersion];
    if (v4)
    {
      v6 = [*(id *)(a1 + 40) bundleChannelIDs];
      v7 = (void *)[v6 copy];

      v8 = [*(id *)(a1 + 40) bundleChannelIDsVersion];
      v9 = (void *)[v8 copy];

      if (![v7 isEqualToArray:v4] || (objc_msgSend(v9, "isEqualToString:", v5) & 1) == 0)
      {
        v10 = *(id **)(a1 + 40);
        id v11 = v4;
        id v12 = v5;
        if (v10)
        {
          [v10[3] lock];
          objc_storeStrong(v10 + 6, v4);
          objc_storeStrong(v10 + 7, v5);
          [v10[3] unlock];
        }

        uint64_t v13 = *(void *)(a1 + 40);
        if (v13) {
          v14 = *(void **)(v13 + 16);
        }
        else {
          v14 = 0;
        }
        [v14 setObject:v11 forKey:@"bundleChannelIDs"];
        uint64_t v15 = *(void *)(a1 + 40);
        if (v15) {
          v16 = *(void **)(v15 + 16);
        }
        else {
          v16 = 0;
        }
        [v16 setObject:v12 forKey:@"bundleChannelIDsVersion"];
        v17 = [*(id *)(a1 + 40) delegate];
        [v17 bundleChannelProvider:*(void *)(a1 + 40) bundleChannelIDsDidChangeWithChannelIDs:v11 version:v12];
      }
    }
  }
  uint64_t v18 = *(void *)(a1 + 48);
  if (v18) {
    (*(void (**)(void))(v18 + 16))();
  }
}

- (void)setDelegate:(id)a3
{
}

- (id)initWithLocalStore:(void *)a3 appActivityMonitor:(void *)a4 configurationManager:(void *)a5 contentContext:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a1
    && (v41.receiver = a1,
        v41.super_class = (Class)FCBundleChannelProvider,
        (v14 = (id *)objc_msgSendSuper2(&v41, sel_init)) != 0))
  {
    uint64_t v15 = v14;
    id v37 = v13;
    id v38 = v12;
    id v40 = v10;
    objc_storeStrong(v14 + 2, a2);
    objc_storeStrong(v15 + 4, a4);
    objc_storeStrong(v15 + 5, a5);
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F81C18]) initWithOptions:1];
    id v17 = v15[3];
    v15[3] = (id)v16;

    id v39 = v11;
    [v11 addObserver:v15];
    uint64_t v18 = [MEMORY[0x1E4F1C978] array];
    [v15 setBundleChannelIDs:v18];

    id v19 = [NSString string];
    [v15 setBundleChannelIDsVersion:v19];

    v20 = v15;
    id v21 = v15[2];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v22 = [v21 allKeys];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v43 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          objc_opt_class();
          v28 = [v21 objectForKey:v27];
          if (v28)
          {
            if (objc_opt_isKindOfClass()) {
              v29 = v28;
            }
            else {
              v29 = 0;
            }
          }
          else
          {
            v29 = 0;
          }
          id v30 = v29;

          if (v30 && [v27 isEqualToString:@"bundleChannelIDs"])
          {
            v31 = (void *)[v30 copy];
            [v20 setBundleChannelIDs:v31];
          }
          objc_opt_class();
          v32 = [v21 objectForKey:v27];
          if (v32)
          {
            if (objc_opt_isKindOfClass()) {
              v33 = v32;
            }
            else {
              v33 = 0;
            }
          }
          else
          {
            v33 = 0;
          }
          id v34 = v33;

          if (v34 && [v27 isEqualToString:@"bundleChannelIDsVersion"])
          {
            v35 = (void *)[v34 copy];
            [v20 setBundleChannelIDsVersion:v35];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v24);
    }

    id v11 = v39;
    id v10 = v40;
    id v13 = v37;
    id v12 = v38;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)setBundleChannelIDsVersion:(id)a3
{
}

- (void)setBundleChannelIDs:(id)a3
{
}

- (void)loadInitialBundleChannelIDsWithCompletion:(id)a3
{
  v5 = (void (**)(void))a3;
  v4 = [(FCBundleChannelProvider *)self bundleChannelIDs];
  if ([v4 count])
  {
    if (v5) {
      v5[2]();
    }
  }
  else
  {
    -[FCBundleChannelProvider refreshBundleChannelIDsWithCompletion:]((id *)&self->super.isa, v5);
  }
}

- (NSArray)bundleChannelIDs
{
  uint64_t v2 = self;
  if (self) {
    self = (FCBundleChannelProvider *)self->_accessLock;
  }
  [(FCBundleChannelProvider *)self lock];
  id v3 = v2->_bundleChannelIDs;
  [(NFUnfairLock *)v2->_accessLock unlock];
  return v3;
}

- (NSString)bundleChannelIDsVersion
{
  uint64_t v2 = self;
  if (self) {
    self = (FCBundleChannelProvider *)self->_accessLock;
  }
  [(FCBundleChannelProvider *)self lock];
  id v3 = v2->_bundleChannelIDsVersion;
  [(NFUnfairLock *)v2->_accessLock unlock];
  return v3;
}

void __65__FCBundleChannelProvider_refreshBundleChannelIDsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = [v3 paidBundleConfig];
  v6 = [v5 offeredBundlePurchaseIDs];
  v7 = [v6 firstObject];

  if (v7)
  {
    v8 = NSString;
    v9 = +[FCAppleAccount sharedAccount];
    id v10 = [v9 contentStoreFrontID];
    id v11 = [v8 stringWithFormat:@"%@-%@", v7, v10];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __65__FCBundleChannelProvider_refreshBundleChannelIDsWithCompletion___block_invoke_12;
    v19[3] = &unk_1E5B55C28;
    id v20 = v11;
    id v21 = v4;
    id v22 = *(id *)(a1 + 40);
    id v12 = v11;
    id v13 = v19;
    if (v4)
    {
      id v14 = v12;
      uint64_t v15 = [FCPurchaseLookupFetchOperation alloc];
      v27[0] = v14;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      id v17 = [(FCPurchaseLookupFetchOperation *)v15 initWithPurchaseIDs:v16 contentContext:v4[5]];

      [(FCOperation *)v17 setQualityOfService:25];
      [(FCOperation *)v17 setRelativePriority:1];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __69__FCBundleChannelProvider_fetchBundleTagIDsForPurchaseID_completion___block_invoke;
      v25[3] = &unk_1E5B4CAF8;
      v26 = v13;
      [(FCFetchOperation *)v17 setFetchCompletionBlock:v25];
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
      [v18 addOperation:v17];
    }
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __65__FCBundleChannelProvider_refreshBundleChannelIDsWithCompletion___block_invoke_3;
    v23[3] = &unk_1E5B4CA88;
    id v24 = *(id *)(a1 + 40);
    __65__FCBundleChannelProvider_refreshBundleChannelIDsWithCompletion___block_invoke_3((uint64_t)v23);
    id v12 = v24;
  }
}

void __81__FCBundleChannelProvider_activityObservingApplicationWindowWillBecomeForeground__block_invoke(uint64_t a1)
{
}

- (void)refreshBundleChannelIDsWithCompletion:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    id v4 = a1[4];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __65__FCBundleChannelProvider_refreshBundleChannelIDsWithCompletion___block_invoke;
    v5[3] = &unk_1E5B55C78;
    objc_copyWeak(&v7, &location);
    id v6 = v3;
    FCCoreConfigurationFetch(v4, v5);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __65__FCBundleChannelProvider_refreshBundleChannelIDsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__FCBundleChannelProvider_refreshBundleChannelIDsWithCompletion___block_invoke_2;
  v6[3] = &unk_1E5B55C50;
  id v7 = v3;
  id v8 = *(id *)(a1 + 32);
  id v5 = v3;
  FCPerformIfNonNil(WeakRetained, v6);
}

uint64_t __65__FCBundleChannelProvider_refreshBundleChannelIDsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "BundleChannelProvider couldn't find bundle purchaseID from configuration", v4, 2u);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (FCBundleChannelProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (FCBundleChannelProviderDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleChannelIDsVersion, 0);
  objc_storeStrong((id *)&self->_bundleChannelIDs, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_accessLock, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end