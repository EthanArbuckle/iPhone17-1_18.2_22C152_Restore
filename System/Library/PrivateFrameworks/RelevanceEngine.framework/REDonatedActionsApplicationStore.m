@interface REDonatedActionsApplicationStore
- (BOOL)_shouldFilterDonation:(id)a3;
- (REDonatedActionsApplicationStore)init;
- (REDonatedActionsApplicationStore)initWithLocationManager:(id)a3;
- (void)_notify;
- (void)_notifyApplicationsUpdates;
- (void)_queue_loadApplicationsIfNeededWithCompletion:(id)a3;
- (void)_sortDonationsByCount:(id)a3 completion:(id)a4;
- (void)donatedActionFilteredCacheCountDidChange;
- (void)donatedActionFilteredCacheDidAddDonation:(id)a3;
- (void)donatedActionFilteredCacheDonationRemoved;
- (void)fetchAllUniqueDonationsWithBlock:(id)a3 completion:(id)a4;
- (void)fetchApplicationsProvidingDonations:(id)a3;
- (void)fetchDonationWithIdentifier:(id)a3 completion:(id)a4;
- (void)fetchFirstPerformedActionDate:(id)a3;
- (void)fetchPerformedCountForAction:(id)a3 completion:(id)a4;
- (void)fetchPerformedTodayCountForActionWithBundleIdentifer:(id)a3 actionIdentifier:(unint64_t)a4 completion:(id)a5;
- (void)fetchTopDonationsForApplications:(id)a3 fromOnlyRecentPlatform:(BOOL)a4 block:(id)a5;
@end

@implementation REDonatedActionsApplicationStore

- (REDonatedActionsApplicationStore)init
{
  v3 = +[RELocationManager simulatedLocationManager];
  v4 = [(REDonatedActionsApplicationStore *)self initWithLocationManager:v3];

  return v4;
}

- (REDonatedActionsApplicationStore)initWithLocationManager:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)REDonatedActionsApplicationStore;
  v5 = [(REDonatedActionsApplicationStore *)&v38 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.RelevanceEngine.REDonatedActionsApplicationStore", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    v8 = +[REMutableRelevanceEngineConfiguration defaultConfiguration];
    [v8 setWantsImmutableContent:1];
    [v8 setAllowsRemoteTraining:1];
    [v8 setTrainingBehavior:1];
    [v8 setModelStorageBehavior:1];
    id v32 = v4;
    [v8 setLocationManager:v4];
    v9 = +[REDataSourceLoader disabledDataSourceLoader];
    [v8 setDataSourceLoader:v9];

    [v8 removeAllInteractions];
    [v8 removeAllSections];
    v10 = +[RESectionDescriptor defaultSectionDescriptorForIdentifier:@"defaultSectionIdentifier"];
    [v10 setHistoricSectionDescriptor:0];
    v11 = [v10 rules];
    v12 = (void *)[v11 mutableCopy];

    v13 = [REFilteringRule alloc];
    v14 = +[RECondition trueCondition];
    v15 = [(REFilteringRule *)v13 initWithCondition:v14 type:1];

    LODWORD(v16) = 1.0;
    [(RERule *)v15 setPriority:v16];
    [v12 addObject:v15];
    v31 = v12;
    [v10 setRules:v12];
    [v8 addSectionWithDescriptor:v10];
    v17 = objc_alloc_init(REInteractionDescriptor);
    [(REInteractionDescriptor *)v17 setName:@"REElementInteractionTap"];
    [v8 addInteractionWithDescriptor:v17];
    v18 = [[RERelevanceEngine alloc] initWithName:@"REDonatedActionsApplicationStore-Filtering" configuration:v8];
    filteringEngine = v5->_filteringEngine;
    v5->_filteringEngine = v18;

    [(RERelevanceEngine *)v5->_filteringEngine setAutomaticallyResumeEngine:0];
    [(RERelevanceEngine *)v5->_filteringEngine resume];
    uint64_t v20 = [(RERelevanceEngine *)v5->_filteringEngine elementRankerForSection:@"defaultSectionIdentifier"];
    elementRanker = v5->_elementRanker;
    v5->_elementRanker = (REMLElementRanker *)v20;

    objc_initWeak(&location, v5);
    v22 = v5->_queue;
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __60__REDonatedActionsApplicationStore_initWithLocationManager___block_invoke;
    v35[3] = &unk_2644BC638;
    objc_copyWeak(&v36, &location);
    uint64_t v23 = +[REUpNextScheduler schedulerWithQueue:v22 delay:v35 updateBlock:0.1];
    scheduler = v5->_scheduler;
    v5->_scheduler = (REUpNextScheduler *)v23;

    v25 = v5->_queue;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __60__REDonatedActionsApplicationStore_initWithLocationManager___block_invoke_2;
    v33[3] = &unk_2644BC638;
    objc_copyWeak(&v34, &location);
    uint64_t v26 = +[REUpNextScheduler schedulerWithQueue:v25 delay:v33 updateBlock:0.1];
    applicationScheduler = v5->_applicationScheduler;
    v5->_applicationScheduler = (REUpNextScheduler *)v26;

    v28 = objc_alloc_init(REDonatedActionFilteredCache);
    cache = v5->_cache;
    v5->_cache = v28;

    [(REDonatedActionFilteredCache *)v5->_cache setDelegate:v5];
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);

    id v4 = v32;
  }

  return v5;
}

void __60__REDonatedActionsApplicationStore_initWithLocationManager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notify];
}

void __60__REDonatedActionsApplicationStore_initWithLocationManager___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyApplicationsUpdates];
}

- (void)fetchApplicationsProvidingDonations:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __72__REDonatedActionsApplicationStore_fetchApplicationsProvidingDonations___block_invoke;
    v7[3] = &unk_2644BC5E8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __72__REDonatedActionsApplicationStore_fetchApplicationsProvidingDonations___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __72__REDonatedActionsApplicationStore_fetchApplicationsProvidingDonations___block_invoke_2;
  v4[3] = &unk_2644BCCD0;
  v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(v2, "_queue_loadApplicationsIfNeededWithCompletion:", v4);
}

void __72__REDonatedActionsApplicationStore_fetchApplicationsProvidingDonations___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(*(void *)(a1 + 32) + 40) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)fetchDonationWithIdentifier:(id)a3 completion:(id)a4
{
  if (a4) {
    -[REDonatedActionFilteredCache fetchDonationWithIdentifier:completion:](self->_cache, "fetchDonationWithIdentifier:completion:", a3);
  }
}

- (void)fetchTopDonationsForApplications:(id)a3 fromOnlyRecentPlatform:(BOOL)a4 block:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    if ([v8 count])
    {
      if (v6) {
        v10 = objc_alloc_init(_MultiplatformDonationRecencyStore);
      }
      else {
        v10 = 0;
      }
      v11 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
      cache = self->_cache;
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __98__REDonatedActionsApplicationStore_fetchTopDonationsForApplications_fromOnlyRecentPlatform_block___block_invoke;
      v21[3] = &unk_2644C0610;
      id v22 = v8;
      uint64_t v23 = self;
      id v24 = v11;
      BOOL v26 = v6;
      v25 = v10;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __98__REDonatedActionsApplicationStore_fetchTopDonationsForApplications_fromOnlyRecentPlatform_block___block_invoke_2;
      v15[3] = &unk_2644C0660;
      BOOL v20 = v6;
      double v16 = v25;
      id v17 = v24;
      v18 = self;
      id v19 = v9;
      id v13 = v24;
      v14 = v25;
      [(REDonatedActionFilteredCache *)cache fetchAllUniqueActions:v21 completion:v15];
    }
    else
    {
      (*((void (**)(id, void))v9 + 2))(v9, MEMORY[0x263EFFA78]);
    }
  }
}

void __98__REDonatedActionsApplicationStore_fetchTopDonationsForApplications_fromOnlyRecentPlatform_block___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 bundleIdentifier];
  if (v3
    && [*(id *)(a1 + 32) containsObject:v3]
    && ([*(id *)(a1 + 40) _shouldFilterDonation:v9] & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 48) objectForKeyedSubscript:v3];
    if (!v4)
    {
      id v4 = [MEMORY[0x263EFF980] array];
      [*(id *)(a1 + 48) setObject:v4 forKeyedSubscript:v3];
    }
    [v4 addObject:v9];
    if (*(unsigned char *)(a1 + 64))
    {
      id v5 = [v9 remoteBundleIdentifier];
      BOOL v6 = [v9 localBundleIdentifier];
      if ([v9 isLocalDonation])
      {
        v7 = 0;
      }
      else
      {
        v7 = [v9 creationDate];
      }
      if ([v9 isLocalDonation])
      {
        id v8 = [v9 creationDate];
      }
      else
      {
        id v8 = 0;
      }
      [*(id *)(a1 + 56) updateDataWithRemoteBundleIdentifier:v5 remoteDate:v7 localBundleIdentifier:v6 localDate:v8];
    }
  }
}

void __98__REDonatedActionsApplicationStore_fetchTopDonationsForApplications_fromOnlyRecentPlatform_block___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 64)) {
    [*(id *)(a1 + 32) bundlesFromMostRecentlyProvidingPlatforms];
  }
  else {
  id v2 = [*(id *)(a1 + 40) allKeys];
  }
  id v3 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  id v4 = objc_alloc_init(REExpectation);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v2;
  uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        [(REExpectation *)v4 beginOperation];
        v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
        v11 = *(void **)(a1 + 48);
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __98__REDonatedActionsApplicationStore_fetchTopDonationsForApplications_fromOnlyRecentPlatform_block___block_invoke_3;
        v19[3] = &unk_2644C0638;
        v19[4] = v11;
        id v20 = v3;
        uint64_t v21 = v9;
        id v22 = v4;
        [v11 _sortDonationsByCount:v10 completion:v19];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 32);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __98__REDonatedActionsApplicationStore_fetchTopDonationsForApplications_fromOnlyRecentPlatform_block___block_invoke_5;
  v16[3] = &unk_2644BCCD0;
  id v13 = *(id *)(a1 + 56);
  id v17 = v3;
  id v18 = v13;
  id v14 = v3;
  [(REExpectation *)v4 notifyOperationsCompleteOnQueue:v12 block:v16];
}

void __98__REDonatedActionsApplicationStore_fetchTopDonationsForApplications_fromOnlyRecentPlatform_block___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __98__REDonatedActionsApplicationStore_fetchTopDonationsForApplications_fromOnlyRecentPlatform_block___block_invoke_4;
  v9[3] = &unk_2644BD040;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void **)(a1 + 56);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = v3;
  id v13 = v7;
  id v8 = v3;
  dispatch_async(v4, v9);
}

uint64_t __98__REDonatedActionsApplicationStore_fetchTopDonationsForApplications_fromOnlyRecentPlatform_block___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 56);
  return [v2 endOperation];
}

void __98__REDonatedActionsApplicationStore_fetchTopDonationsForApplications_fromOnlyRecentPlatform_block___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)_shouldFilterDonation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 relevanceProviders];
  if ([v5 count])
  {
    uint64_t v6 = [REElement alloc];
    uint64_t v7 = objc_opt_new();
    id v8 = [v4 relevanceProviders];
    uint64_t v9 = [(REElement *)v6 initWithIdentifier:@"filtering-element" content:v7 action:0 relevanceProviders:v8];

    char v10 = [(REMLElementRanker *)self->_elementRanker shouldHideElement:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)fetchAllUniqueDonationsWithBlock:(id)a3 completion:(id)a4
{
}

- (void)fetchPerformedCountForAction:(id)a3 completion:(id)a4
{
}

- (void)fetchPerformedTodayCountForActionWithBundleIdentifer:(id)a3 actionIdentifier:(unint64_t)a4 completion:(id)a5
{
}

- (void)fetchFirstPerformedActionDate:(id)a3
{
}

- (void)_sortDonationsByCount:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ((unint64_t)[v6 count] > 1)
    {
      uint64_t v21 = v7;
      uint64_t v9 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
      char v10 = dispatch_group_create();
      uint64_t v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v22 = v6;
      id obj = v6;
      uint64_t v12 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v34;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v34 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void *)(*((void *)&v33 + 1) + 8 * v15);
            dispatch_group_enter(v10);
            cache = self->_cache;
            v28[0] = MEMORY[0x263EF8330];
            v28[1] = 3221225472;
            v28[2] = __69__REDonatedActionsApplicationStore__sortDonationsByCount_completion___block_invoke;
            v28[3] = &unk_2644C06B0;
            v28[4] = v16;
            v29 = v10;
            v30 = self;
            id v31 = v9;
            id v32 = v11;
            [(REDonatedActionFilteredCache *)cache fetchCountForAction:v16 usingBlock:v28];

            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v13);
      }

      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __69__REDonatedActionsApplicationStore__sortDonationsByCount_completion___block_invoke_3;
      block[3] = &unk_2644BC570;
      id v25 = v11;
      id v26 = v9;
      id v7 = v21;
      id v27 = v21;
      id v19 = v9;
      id v20 = v11;
      dispatch_group_notify(v10, queue, block);

      id v6 = v22;
    }
    else
    {
      if (v6) {
        id v8 = v6;
      }
      else {
        id v8 = (id)MEMORY[0x263EFFA68];
      }
      (*((void (**)(id, id))v7 + 2))(v7, v8);
    }
  }
}

void __69__REDonatedActionsApplicationStore__sortDonationsByCount_completion___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) type];
  if (a2 > 1 || v4 == 2)
  {
    id v6 = *(NSObject **)(*(void *)(a1 + 48) + 32);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__REDonatedActionsApplicationStore__sortDonationsByCount_completion___block_invoke_2;
    block[3] = &unk_2644C0688;
    id v7 = *(id *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = v7;
    uint64_t v11 = v8;
    unint64_t v14 = a2;
    id v12 = *(id *)(a1 + 64);
    id v13 = *(id *)(a1 + 40);
    dispatch_async(v6, block);
  }
  else
  {
    id v5 = *(NSObject **)(a1 + 40);
    dispatch_group_leave(v5);
  }
}

void __69__REDonatedActionsApplicationStore__sortDonationsByCount_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) identifier];
  [v3 setObject:v2 forKeyedSubscript:v4];

  [*(id *)(a1 + 48) addObject:*(void *)(a1 + 40)];
  id v5 = *(NSObject **)(a1 + 56);
  dispatch_group_leave(v5);
}

void __69__REDonatedActionsApplicationStore__sortDonationsByCount_completion___block_invoke_3(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __69__REDonatedActionsApplicationStore__sortDonationsByCount_completion___block_invoke_4;
  v4[3] = &unk_2644C06D8;
  id v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 sortedArrayUsingComparator:v4];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __69__REDonatedActionsApplicationStore__sortDonationsByCount_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [a2 identifier];
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];
  uint64_t v9 = (void *)v8;
  if (v8) {
    id v10 = (void *)v8;
  }
  else {
    id v10 = &unk_26CFCD680;
  }
  id v11 = v10;

  id v12 = *(void **)(a1 + 32);
  id v13 = [v6 identifier];

  uint64_t v14 = [v12 objectForKeyedSubscript:v13];
  uint64_t v15 = (void *)v14;
  if (v14) {
    uint64_t v16 = (void *)v14;
  }
  else {
    uint64_t v16 = &unk_26CFCD680;
  }
  id v17 = v16;

  uint64_t v18 = [v17 compare:v11];
  return v18;
}

- (void)_notify
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"REDonatedActionsApplicationStoreDidUpdate" object:self];
}

- (void)_notifyApplicationsUpdates
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"REDonatedActionsApplicationStoreDidUpdateApplications" object:0];
}

- (void)_queue_loadApplicationsIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_applications)
  {
    if (v4) {
      (*((void (**)(id))v4 + 2))(v4);
    }
  }
  else
  {
    id v6 = [MEMORY[0x263EFF9C0] set];
    cache = self->_cache;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __82__REDonatedActionsApplicationStore__queue_loadApplicationsIfNeededWithCompletion___block_invoke;
    v12[3] = &unk_2644C0700;
    id v13 = v6;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __82__REDonatedActionsApplicationStore__queue_loadApplicationsIfNeededWithCompletion___block_invoke_2;
    v9[3] = &unk_2644BC570;
    void v9[4] = self;
    id v10 = v13;
    id v11 = v5;
    id v8 = v13;
    [(REDonatedActionFilteredCache *)cache fetchAllUniqueActions:v12 completion:v9];
  }
}

uint64_t __82__REDonatedActionsApplicationStore__queue_loadApplicationsIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 bundleIdentifier];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = [*(id *)(a1 + 32) addObject:v3];
    uint64_t v4 = v6;
  }
  return MEMORY[0x270F9A758](v3, v4);
}

void __82__REDonatedActionsApplicationStore__queue_loadApplicationsIfNeededWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__REDonatedActionsApplicationStore__queue_loadApplicationsIfNeededWithCompletion___block_invoke_3;
  block[3] = &unk_2644BC570;
  void block[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v3, block);
}

uint64_t __82__REDonatedActionsApplicationStore__queue_loadApplicationsIfNeededWithCompletion___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 24) schedule];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)donatedActionFilteredCacheDidAddDonation:(id)a3
{
  uint64_t v4 = [a3 bundleIdentifier];
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __77__REDonatedActionsApplicationStore_donatedActionFilteredCacheDidAddDonation___block_invoke;
    v7[3] = &unk_2644BC688;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __77__REDonatedActionsApplicationStore_donatedActionFilteredCacheDidAddDonation___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 24) schedule];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v2 schedule];
}

- (void)donatedActionFilteredCacheCountDidChange
{
}

- (void)donatedActionFilteredCacheDonationRemoved
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__REDonatedActionsApplicationStore_donatedActionFilteredCacheDonationRemoved__block_invoke;
  block[3] = &unk_2644BC660;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __77__REDonatedActionsApplicationStore_donatedActionFilteredCacheDonationRemoved__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  [*(id *)(*(void *)(a1 + 32) + 24) schedule];
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v4 schedule];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementRanker, 0);
  objc_storeStrong((id *)&self->_filteringEngine, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_applicationScheduler, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end