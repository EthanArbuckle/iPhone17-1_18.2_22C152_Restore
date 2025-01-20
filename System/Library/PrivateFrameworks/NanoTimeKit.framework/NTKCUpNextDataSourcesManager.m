@interface NTKCUpNextDataSourcesManager
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)watchVersion;
- (BOOL)_isNanoWeatherAppID:(id)a3;
- (NSArray)firstPartyDataSourceEntries;
- (NSArray)sportsDataSourceEntries;
- (NSArray)thirdPartyDataSourceEntries;
- (NTKCUpNextDataSourcesManagerIdentifiersDelegate)firstPartyIdentifiersDelegate;
- (NTKCUpNextDataSourcesManagerIdentifiersDelegate)sportsIdentifiersDelegate;
- (NTKCUpNextDataSourcesManagerIdentifiersDelegate)thirdPartyIdentifiersDelegate;
- (OS_dispatch_queue)fetchQueue;
- (id)_dedupeAndSortFirstPartyDataSourcesFromIdentifiers:(id)a3;
- (id)_firstPartyDataSourceEntries;
- (id)_preGraceThirdPartyBundleIdentifiers;
- (id)initWatchVersion:(id *)a3;
- (void)_appsChangedNotification:(id)a3;
- (void)_buildRows;
- (void)_buildRowsAfterPrewarming;
- (void)_dataSourcesChangedNotification:(id)a3;
- (void)_fetchThirdPartyBundleIdentifiersWithCompletion:(id)a3;
- (void)_phoneDedupeFromIdentifiers:(id)a3 completion:(id)a4;
- (void)_phoneDedupedDataSourcesFromIdentifiers:(id)a3 completion:(id)a4;
- (void)_prewarmRowBuildingWithCompletion:(id)a3;
- (void)dealloc;
- (void)setFirstPartyDataSourceEntries:(id)a3;
- (void)setFirstPartyIdentifiersDelegate:(id)a3;
- (void)setSportsDataSourceEntries:(id)a3;
- (void)setSportsIdentifiersDelegate:(id)a3;
- (void)setThirdPartyDataSourceEntries:(id)a3;
- (void)setThirdPartyIdentifiersDelegate:(id)a3;
@end

@implementation NTKCUpNextDataSourcesManager

- (id)initWatchVersion:(id *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)NTKCUpNextDataSourcesManager;
  v4 = [(NTKCUpNextDataSourcesManager *)&v22 init];
  if (v4)
  {
    v5 = +[NTKRelevanceEngineCache sharedCache];
    uint64_t v6 = [v5 canonicalRelevanceEngine];
    v7 = (void *)*((void *)v4 + 1);
    *((void *)v4 + 1) = v6;

    long long v8 = *(_OWORD *)&a3->var0;
    *((void *)v4 + 11) = a3->var2;
    *(_OWORD *)(v4 + 72) = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] array];
    v10 = (void *)*((void *)v4 + 2);
    *((void *)v4 + 2) = v9;

    uint64_t v11 = [MEMORY[0x1E4F1C978] array];
    v12 = (void *)*((void *)v4 + 4);
    *((void *)v4 + 4) = v11;

    uint64_t v13 = [MEMORY[0x1E4F1C978] array];
    v14 = (void *)*((void *)v4 + 3);
    *((void *)v4 + 3) = v13;

    v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.upnext.datasources.fetcher", v15);
    v17 = (void *)*((void *)v4 + 8);
    *((void *)v4 + 8) = v16;

    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v4 selector:sel__appsChangedNotification_ name:@"NTKSystemAppStateChangedNotification" object:0];

    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v4 selector:sel__dataSourcesChangedNotification_ name:*MEMORY[0x1E4F949E0] object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)_dataSourcesDidChange, @"com.apple.NanoTimeKit.NPS.NTKSiriDefaultsThirdPartyDataSourcesDidChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v4;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, 0, 0);
  v4.receiver = self;
  v4.super_class = (Class)NTKCUpNextDataSourcesManager;
  [(NTKCUpNextDataSourcesManager *)&v4 dealloc];
}

- (void)_appsChangedNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 object];
    int v7 = 138412290;
    long long v8 = v6;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "NTKSystemAppStateChangedNotification will rebuild rows - %@", (uint8_t *)&v7, 0xCu);
  }
  [(NTKCUpNextDataSourcesManager *)self fetchIdentifiers];
}

- (void)_dataSourcesChangedNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 object];
    int v7 = 138412290;
    long long v8 = v6;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "REAvailableDataSourceIdentifiersDidChange will rebuild rows - %@", (uint8_t *)&v7, 0xCu);
  }
  [(NTKCUpNextDataSourcesManager *)self fetchIdentifiers];
}

- (id)_preGraceThirdPartyBundleIdentifiers
{
  v2 = [MEMORY[0x1E4F19A30] activeNRDevice];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F4AC68] sharedDeviceConnection];
    id v4 = [MEMORY[0x1E4F1CA80] set];
    v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__NTKCUpNextDataSourcesManager__preGraceThirdPartyBundleIdentifiers__block_invoke;
    v11[3] = &unk_1E62C2B28;
    id v6 = v4;
    id v12 = v6;
    id v13 = v3;
    id v14 = v2;
    id v7 = v3;
    [v5 enumerateBundlesOfType:1 block:v11];

    long long v8 = v14;
    id v9 = v6;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CA80] set];
  }

  return v9;
}

void __68__NTKCUpNextDataSourcesManager__preGraceThirdPartyBundleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v18 = a2;
  v21 = [v18 bundleIdentifier];
  v19 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v21];
  v3 = [v19 applicationType];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F22380]];

  if ((v4 & 1) == 0)
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2050000000;
    v5 = (void *)getINAppInfoClass_softClass;
    uint64_t v34 = getINAppInfoClass_softClass;
    if (!getINAppInfoClass_softClass)
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __getINAppInfoClass_block_invoke;
      v30[3] = &unk_1E62C16C0;
      v30[4] = &v31;
      __getINAppInfoClass_block_invoke((uint64_t)v30);
      v5 = (void *)v32[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v31, 8);
    v17 = [v6 appInfoWithAppProxy:v19];
    id v7 = [v17 supportedActionsByExtensions];
    BOOL v8 = [v7 count] == 0;

    if (v8)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id obj = [v19 counterpartIdentifiers];
      uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v27;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v27 != v10) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8 * v11);
            id v13 = dispatch_group_create();
            dispatch_group_enter(v13);
            v15 = *(void **)(a1 + 40);
            uint64_t v14 = *(void *)(a1 + 48);
            v22[0] = MEMORY[0x1E4F143A8];
            v22[1] = 3221225472;
            v22[2] = __68__NTKCUpNextDataSourcesManager__preGraceThirdPartyBundleIdentifiers__block_invoke_2;
            v22[3] = &unk_1E62C2B00;
            id v23 = *(id *)(a1 + 32);
            id v24 = v21;
            v25 = v13;
            dispatch_queue_t v16 = v13;
            [v15 fetchApplicationOnPairedDevice:v14 withBundleID:v12 completion:v22];
            dispatch_group_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
        }
        while (v9);
      }
    }
    else
    {
      [*(id *)(a1 + 32) addObject:v21];
    }
  }
}

void __68__NTKCUpNextDataSourcesManager__preGraceThirdPartyBundleIdentifiers__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 intentsSupported];
  char v4 = [v3 userActivityTypes];

  if ([v5 count] || objc_msgSend(v4, "count")) {
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (BOOL)_isNanoWeatherAppID:(id)a3
{
  return [@"com.apple.weather.watchapp" isEqualToString:a3];
}

- (id)_dedupeAndSortFirstPartyDataSourcesFromIdentifiers:(id)a3
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v61 = self;
  id v5 = [(RERelevanceEngine *)self->_relevanceEngine dataSourceCatalog];
  v71 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  v70 = v4;
  id obj = (id)[v4 copy];
  uint64_t v7 = [obj countByEnumeratingWithState:&v89 objects:v96 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v90;
    uint64_t v62 = *(void *)v90;
    v63 = v5;
    do
    {
      uint64_t v10 = 0;
      uint64_t v64 = v8;
      do
      {
        if (*(void *)v90 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(id *)(*((void *)&v89 + 1) + 8 * v10);
        uint64_t v12 = RERemoteApplicationIdentifierForLocalApplication();
        id v13 = (void *)v12;
        if (v12) {
          uint64_t v14 = (void *)v12;
        }
        else {
          uint64_t v14 = v11;
        }
        id v15 = v14;

        dispatch_queue_t v16 = [v5 localizedNameForDataSourceWithIdentifier:v15];
        if (v16)
        {
          v17 = [v5 applicationIdentifierForDataSourceWithIdentifier:v15];
          if (v17)
          {
            v68 = v17;
            uint64_t v18 = [v71 objectForKeyedSubscript:v16];
            id v69 = v15;
            uint64_t v66 = v10;
            v67 = v16;
            if (v18)
            {
              v19 = (void *)v18;
              long long v87 = 0u;
              long long v88 = 0u;
              long long v85 = 0u;
              long long v86 = 0u;
              id v20 = v15;
              v21 = [MEMORY[0x1E4F1CA70] orderedSetWithObject:v20];
              objc_super v22 = RERemoteApplicationIdentifierForLocalApplication();
              if (v22) {
                [v21 addObject:v22];
              }
              id v23 = RELocalApplicationIdentifierForRemoteApplication();
              if (v23) {
                [v21 addObject:v23];
              }
              id v24 = (void *)[v21 copy];

              uint64_t v25 = [v24 countByEnumeratingWithState:&v85 objects:v95 count:16];
              if (v25)
              {
                uint64_t v26 = v25;
                uint64_t v27 = *(void *)v86;
                do
                {
                  for (uint64_t i = 0; i != v26; ++i)
                  {
                    if (*(void *)v86 != v27) {
                      objc_enumerationMutation(v24);
                    }
                    [v19 addObject:*(void *)(*((void *)&v85 + 1) + 8 * i)];
                  }
                  uint64_t v26 = [v24 countByEnumeratingWithState:&v85 objects:v95 count:16];
                }
                while (v26);
              }
            }
            else
            {
              id v29 = v15;
              v30 = [MEMORY[0x1E4F1CA70] orderedSetWithObject:v29];
              uint64_t v31 = RERemoteApplicationIdentifierForLocalApplication();
              if (v31) {
                [v30 addObject:v31];
              }
              v32 = RELocalApplicationIdentifierForRemoteApplication();
              if (v32) {
                [v30 addObject:v32];
              }
              uint64_t v33 = (void *)[v30 copy];

              v19 = (void *)[v33 mutableCopy];
              if (![(NTKCUpNextDataSourcesManager *)v61 _isNanoWeatherAppID:v68]) {
                [v19 addObject:v68];
              }
              [v71 setObject:v19 forKeyedSubscript:v67];
            }
            long long v83 = 0u;
            long long v84 = 0u;
            long long v81 = 0u;
            long long v82 = 0u;
            id v34 = v15;
            v35 = [MEMORY[0x1E4F1CA70] orderedSetWithObject:v34];
            uint64_t v36 = RERemoteApplicationIdentifierForLocalApplication();
            if (v36) {
              [v35 addObject:v36];
            }
            v37 = RELocalApplicationIdentifierForRemoteApplication();
            if (v37) {
              [v35 addObject:v37];
            }
            v38 = (void *)[v35 copy];

            uint64_t v39 = [v38 countByEnumeratingWithState:&v81 objects:v94 count:16];
            if (v39)
            {
              uint64_t v40 = v39;
              uint64_t v41 = *(void *)v82;
              do
              {
                for (uint64_t j = 0; j != v40; ++j)
                {
                  if (*(void *)v82 != v41) {
                    objc_enumerationMutation(v38);
                  }
                  v43 = *(void **)(*((void *)&v81 + 1) + 8 * j);
                  if (([v43 isEqualToString:v34] & 1) == 0)
                  {
                    v44 = [v6 objectForKeyedSubscript:v43];
                    v45 = v44;
                    if (v44)
                    {
                      if (([v44 isEqualToString:v34] & 1) == 0)
                      {
                        [v70 removeObject:v43];
                        v46 = [v71 objectForKeyedSubscript:v45];
                        [v46 removeObject:v43];
                      }
                    }
                    else
                    {
                      [v6 setObject:v34 forKeyedSubscript:v43];
                    }
                  }
                }
                uint64_t v40 = [v38 countByEnumeratingWithState:&v81 objects:v94 count:16];
              }
              while (v40);
            }

            uint64_t v9 = v62;
            id v5 = v63;
            uint64_t v8 = v64;
            uint64_t v10 = v66;
            dispatch_queue_t v16 = v67;
            v17 = v68;
            id v15 = v69;
          }
        }
        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [obj countByEnumeratingWithState:&v89 objects:v96 count:16];
    }
    while (v8);
  }

  long long v80 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v77 = 0u;
  v47 = (void *)[v70 copy];
  uint64_t v48 = [v47 countByEnumeratingWithState:&v77 objects:v93 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v78;
    do
    {
      for (uint64_t k = 0; k != v49; ++k)
      {
        if (*(void *)v78 != v50) {
          objc_enumerationMutation(v47);
        }
        v52 = *(void **)(*((void *)&v77 + 1) + 8 * k);
        v53 = [v5 applicationIdentifierForDataSourceWithIdentifier:v52];
        if (v53 && ([v52 isEqualToString:v53] & 1) == 0)
        {
          v54 = [v5 localizedNameForDataSourceWithIdentifier:v52];
          if (v54 && ![(NTKCUpNextDataSourcesManager *)v61 _isNanoWeatherAppID:v53])
          {
            v55 = [v71 objectForKeyedSubscript:v54];
            v74[0] = MEMORY[0x1E4F143A8];
            v74[1] = 3221225472;
            v74[2] = __83__NTKCUpNextDataSourcesManager__dedupeAndSortFirstPartyDataSourcesFromIdentifiers___block_invoke;
            v74[3] = &unk_1E62C2B58;
            id v75 = v54;
            id v76 = v55;
            id v56 = v55;
            [v71 enumerateKeysAndObjectsUsingBlock:v74];
          }
        }
      }
      uint64_t v49 = [v47 countByEnumeratingWithState:&v77 objects:v93 count:16];
    }
    while (v49);
  }

  v57 = [MEMORY[0x1E4F1CA48] array];
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __83__NTKCUpNextDataSourcesManager__dedupeAndSortFirstPartyDataSourcesFromIdentifiers___block_invoke_2;
  v72[3] = &unk_1E62C2B80;
  id v73 = v57;
  id v58 = v57;
  [v71 enumerateKeysAndObjectsUsingBlock:v72];
  v59 = [v58 sortedArrayUsingComparator:&__block_literal_global_40];

  return v59;
}

void __83__NTKCUpNextDataSourcesManager__dedupeAndSortFirstPartyDataSourcesFromIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (([a2 isEqualToString:*(void *)(a1 + 32)] & 1) == 0) {
    [*(id *)(a1 + 40) minusOrderedSet:v5];
  }
}

void __83__NTKCUpNextDataSourcesManager__dedupeAndSortFirstPartyDataSourcesFromIdentifiers___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [NTKUpNextDataSourceEntry alloc];
  id v9 = [v5 set];

  uint64_t v8 = [(NTKUpNextDataSourceEntry *)v7 initWithDataSourceIdentifiers:v9 localizedName:v6 isDonation:0];
  [v4 addObject:v8];
}

uint64_t __83__NTKCUpNextDataSourcesManager__dedupeAndSortFirstPartyDataSourcesFromIdentifiers___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 localizedName];
  id v6 = [v4 localizedName];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_firstPartyDataSourceEntries
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [(RERelevanceEngine *)self->_relevanceEngine dataSourceCatalog];
  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F16E9AA8];
  if (NTKInternalBuild(v4, v5))
  {
    uint64_t v6 = [v4 setByAddingObjectsFromArray:&unk_1F16E9AC0];

    id v4 = (void *)v6;
  }
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  [(NTKCUpNextDataSourcesManager *)self watchVersion];
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (v3) {
          [v3 minimumSupportedSystemVersionForDataSourceWithIdentifier:v13];
        }
        if (v22 >= 0 && ([v13 isEqualToString:@"com.apple.upnext.siri.sports"] & 1) == 0)
        {
          uint64_t v14 = [v3 localizedNameForDataSourceWithIdentifier:v13];

          if (v14)
          {
            id v15 = [v3 applicationIdentifierForDataSourceWithIdentifier:v13];

            if (v15) {
              [v7 addObject:v13];
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v25 count:16];
    }
    while (v10);
  }

  dispatch_queue_t v16 = [(NTKCUpNextDataSourcesManager *)self _dedupeAndSortFirstPartyDataSourcesFromIdentifiers:v7];

  return v16;
}

- (void)_phoneDedupedDataSourcesFromIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([v6 count])
    {
      id v8 = [(RERelevanceEngine *)self->_relevanceEngine dataSourceCatalog];
      uint64_t v9 = dispatch_get_global_queue(2, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __83__NTKCUpNextDataSourcesManager__phoneDedupedDataSourcesFromIdentifiers_completion___block_invoke;
      block[3] = &unk_1E62C0098;
      id v12 = v6;
      id v13 = v8;
      id v14 = v7;
      id v10 = v8;
      dispatch_async(v9, block);
    }
    else
    {
      id v10 = [MEMORY[0x1E4F1C9E8] dictionary];
      (*((void (**)(id, id))v7 + 2))(v7, v10);
    }
  }
}

void __83__NTKCUpNextDataSourcesManager__phoneDedupedDataSourcesFromIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "copy", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(id *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v9 = RERemoteApplicationIdentifierForLocalApplication();
        id v10 = (void *)v9;
        if (v9) {
          uint64_t v11 = (void *)v9;
        }
        else {
          uint64_t v11 = v8;
        }
        id v12 = v11;

        id v13 = [*(id *)(a1 + 40) localizedNameForApplicationWithIdentifier:v12];
        if (v13)
        {
          id v14 = [v2 objectForKey:v13];
          if (!v14)
          {
            id v14 = [MEMORY[0x1E4F1CA80] set];
            [v2 setObject:v14 forKey:v13];
          }
          [v14 addObject:v12];
          [v14 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  uint64_t v15 = *(void *)(a1 + 48);
  dispatch_queue_t v16 = (void *)[v2 copy];
  (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);
}

- (void)_phoneDedupeFromIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[a3 copy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__NTKCUpNextDataSourcesManager__phoneDedupeFromIdentifiers_completion___block_invoke;
  v9[3] = &unk_1E62C2BF0;
  id v10 = v6;
  id v8 = v6;
  [(NTKCUpNextDataSourcesManager *)self _phoneDedupedDataSourcesFromIdentifiers:v7 completion:v9];
}

void __71__NTKCUpNextDataSourcesManager__phoneDedupeFromIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__NTKCUpNextDataSourcesManager__phoneDedupeFromIdentifiers_completion___block_invoke_2;
  v5[3] = &unk_1E62C2290;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __71__NTKCUpNextDataSourcesManager__phoneDedupeFromIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__NTKCUpNextDataSourcesManager__phoneDedupeFromIdentifiers_completion___block_invoke_3;
  v7[3] = &unk_1E62C2BC8;
  id v4 = v2;
  id v8 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];
  uint64_t v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_151_0];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);
  }
}

void __71__NTKCUpNextDataSourcesManager__phoneDedupeFromIdentifiers_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [NTKUpNextDataSourceEntry alloc];
  id v9 = (id)[v5 copy];

  id v8 = [(NTKUpNextDataSourceEntry *)v7 initWithDataSourceIdentifiers:v9 localizedName:v6 isDonation:1];
  [v4 addObject:v8];
}

uint64_t __71__NTKCUpNextDataSourcesManager__phoneDedupeFromIdentifiers_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 localizedName];
  id v6 = [v4 localizedName];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)_fetchThirdPartyBundleIdentifiersWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[NTKSiriDefaults sharedInstance];
  char v6 = [v5 watchHasMigratedAvailableDataSources];

  uint64_t v7 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)dispatch_queue_t v16 = 0;
      _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "Watch has migrated available data sources. Using defaults.", v16, 2u);
    }

    id v9 = [MEMORY[0x1E4F1CA80] set];
    id v10 = +[NTKSiriDefaults sharedInstance];
    uint64_t v11 = [v10 watchThirdPartyDataSources];
    id v12 = [v11 allObjects];
    [v9 addObjectsFromArray:v12];

    id v13 = +[NTKSiriDefaults sharedInstance];
    id v14 = [v13 phoneThirdPartyDataSources];
    uint64_t v15 = [v14 allObjects];
    [v9 addObjectsFromArray:v15];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "Watch has not migrated available data sources. Using legacy path.", buf, 2u);
    }

    id v9 = [(NTKCUpNextDataSourcesManager *)self _preGraceThirdPartyBundleIdentifiers];
  }
  [(NTKCUpNextDataSourcesManager *)self _dedupeAndSortThirdPartyDataSourcesFromIdentifiers:v9 completion:v4];
}

- (void)_buildRows
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__NTKCUpNextDataSourcesManager__buildRows__block_invoke;
  block[3] = &unk_1E62BFF20;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __42__NTKCUpNextDataSourcesManager__buildRows__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__NTKCUpNextDataSourcesManager__buildRows__block_invoke_2;
  v3[3] = &unk_1E62BFF20;
  v3[4] = v1;
  return [v1 _prewarmRowBuildingWithCompletion:v3];
}

uint64_t __42__NTKCUpNextDataSourcesManager__buildRows__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _buildRowsAfterPrewarming];
}

- (void)_prewarmRowBuildingWithCompletion:(id)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v4 = [(RERelevanceEngine *)self->_relevanceEngine dataSourceCatalog];
  id v5 = [v4 dataSourceIdentifiers];
  char v6 = (void *)[v5 copy];

  uint64_t v7 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__NTKCUpNextDataSourcesManager__prewarmRowBuildingWithCompletion___block_invoke;
  block[3] = &unk_1E62C04F0;
  id v11 = v6;
  id v12 = v4;
  id v13 = self;
  id v8 = v4;
  id v9 = v6;
  dispatch_async(v7, block);
}

void __66__NTKCUpNextDataSourcesManager__prewarmRowBuildingWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = (id)[*(id *)(a1 + 40) localizedNameForApplicationWithIdentifier:*(void *)(*((void *)&v9 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__NTKCUpNextDataSourcesManager__prewarmRowBuildingWithCompletion___block_invoke_2;
  block[3] = &unk_1E62BFF20;
  void block[4] = *(void *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __66__NTKCUpNextDataSourcesManager__prewarmRowBuildingWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _buildRowsAfterPrewarming];
}

- (void)_buildRowsAfterPrewarming
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v3 = [(NTKCUpNextDataSourcesManager *)self _firstPartyDataSourceEntries];
  [(NTKCUpNextDataSourcesManager *)self setFirstPartyDataSourceEntries:v3];

  uint64_t v4 = [(NTKCUpNextDataSourcesManager *)self firstPartyIdentifiersDelegate];
  uint64_t v5 = [(NTKCUpNextDataSourcesManager *)self firstPartyDataSourceEntries];
  [v4 manager:self didUpdateDataSourceEntries:v5];

  [(NTKCUpNextDataSourcesManager *)self watchVersion];
  if (v8[5] >= 5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke;
    v8[3] = &unk_1E62C11C0;
    v8[4] = self;
    [(NTKCUpNextDataSourcesManager *)self _fetchThirdPartyBundleIdentifiersWithCompletion:v8];
    fetchQueue = self->_fetchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke_3;
    block[3] = &unk_1E62BFF20;
    void block[4] = self;
    dispatch_async(fetchQueue, block);
  }
}

void __57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke_2;
  v5[3] = &unk_1E62C09C0;
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setThirdPartyDataSourceEntries:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 32) thirdPartyIdentifiersDelegate];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 thirdPartyDataSourceEntries];
  [v4 manager:v2 didUpdateDataSourceEntries:v3];
}

void __57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke_3(uint64_t a1)
{
  if (WatchListKitLibraryCore())
  {
    id v9 = 0;
    uint64_t v11 = 0;
    long long v12 = &v11;
    uint64_t v13 = 0x2020000000;
    id v2 = (uint64_t (*)(id *))getWLKIsSportsEnabledSymbolLoc_ptr;
    uint64_t v14 = getWLKIsSportsEnabledSymbolLoc_ptr;
    if (!getWLKIsSportsEnabledSymbolLoc_ptr)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __getWLKIsSportsEnabledSymbolLoc_block_invoke;
      v10[3] = &unk_1E62C16C0;
      v10[4] = &v11;
      __getWLKIsSportsEnabledSymbolLoc_block_invoke((uint64_t)v10);
      id v2 = (uint64_t (*)(id *))v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v2)
    {
      id v6 = (_Unwind_Exception *)__57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke_3_cold_1();
      _Block_object_dispose(&v11, 8);
      _Unwind_Resume(v6);
    }
    char v3 = v2(&v9);
    id v4 = v9;
    if (v4)
    {
      uint64_t v5 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke_3_cold_2((uint64_t)v4, v5);
      }
    }
  }
  else
  {
    char v3 = 0;
    id v4 = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke_155;
  v7[3] = &unk_1E62C1BF0;
  void v7[4] = *(void *)(a1 + 32);
  char v8 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke_155(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) dataSourceCatalog];
  char v3 = [v2 dataSourceIdentifiers];
  int v4 = [v3 containsObject:@"com.apple.upnext.siri.sports"];

  if (*(unsigned char *)(a1 + 40)) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    id v6 = [v2 localizedNameForDataSourceWithIdentifier:@"com.apple.upnext.siri.sports"];
    id v7 = [NTKUpNextDataSourceEntry alloc];
    char v8 = [MEMORY[0x1E4F1CAD0] setWithObject:@"com.apple.upnext.siri.sports"];
    id v9 = [(NTKUpNextDataSourceEntry *)v7 initWithDataSourceIdentifiers:v8 localizedName:v6 isDonation:0];

    long long v10 = *(void **)(a1 + 32);
    v15[0] = v9;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [v10 setSportsDataSourceEntries:v11];

    long long v12 = [*(id *)(a1 + 32) sportsIdentifiersDelegate];
    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v14 = [v13 sportsDataSourceEntries];
    [v12 manager:v13 didUpdateDataSourceEntries:v14];
  }
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)watchVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[3];
  return self;
}

- (NSArray)firstPartyDataSourceEntries
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFirstPartyDataSourceEntries:(id)a3
{
}

- (NSArray)thirdPartyDataSourceEntries
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setThirdPartyDataSourceEntries:(id)a3
{
}

- (NSArray)sportsDataSourceEntries
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSportsDataSourceEntries:(id)a3
{
}

- (NTKCUpNextDataSourcesManagerIdentifiersDelegate)firstPartyIdentifiersDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_firstPartyIdentifiersDelegate);

  return (NTKCUpNextDataSourcesManagerIdentifiersDelegate *)WeakRetained;
}

- (void)setFirstPartyIdentifiersDelegate:(id)a3
{
}

- (NTKCUpNextDataSourcesManagerIdentifiersDelegate)thirdPartyIdentifiersDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thirdPartyIdentifiersDelegate);

  return (NTKCUpNextDataSourcesManagerIdentifiersDelegate *)WeakRetained;
}

- (void)setThirdPartyIdentifiersDelegate:(id)a3
{
}

- (NTKCUpNextDataSourcesManagerIdentifiersDelegate)sportsIdentifiersDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sportsIdentifiersDelegate);

  return (NTKCUpNextDataSourcesManagerIdentifiersDelegate *)WeakRetained;
}

- (void)setSportsIdentifiersDelegate:(id)a3
{
}

- (OS_dispatch_queue)fetchQueue
{
  return self->_fetchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_destroyWeak((id *)&self->_sportsIdentifiersDelegate);
  objc_destroyWeak((id *)&self->_thirdPartyIdentifiersDelegate);
  objc_destroyWeak((id *)&self->_firstPartyIdentifiersDelegate);
  objc_storeStrong((id *)&self->_sportsDataSourceEntries, 0);
  objc_storeStrong((id *)&self->_thirdPartyDataSourceEntries, 0);
  objc_storeStrong((id *)&self->_firstPartyDataSourceEntries, 0);

  objc_storeStrong((id *)&self->_relevanceEngine, 0);
}

uint64_t __57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke_3_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke_3_cold_2(v0);
}

void __57__NTKCUpNextDataSourcesManager__buildRowsAfterPrewarming__block_invoke_3_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Error checking sports: %@", (uint8_t *)&v2, 0xCu);
}

@end