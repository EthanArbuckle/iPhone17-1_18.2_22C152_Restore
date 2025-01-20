@interface WKWebsiteDataStore(SafariSharedExtras)
+ (id)_dataStoresByAutomationSessionIdentifier;
+ (id)_dataStoresByProfileIdentifier;
+ (id)_safari_dataStoreForProfileWithIdentifier:()SafariSharedExtras createIfNecessary:cacheNewDataStoreInMemory:;
+ (id)safari_allDataTypes;
+ (id)safari_allPersistentDataStores;
+ (id)safari_dataStoreForAutomationSessionWithIdentifier:()SafariSharedExtras;
+ (id)safari_dataStoreWithConfiguration:()SafariSharedExtras;
+ (id)safari_defaultDataStore;
+ (id)safari_nonPersistentDataStore;
+ (id)safari_webViewForDownloadsForProfileWithIdentifier:()SafariSharedExtras;
+ (uint64_t)_newDataStoreForAutomationSessionIdentifier:()SafariSharedExtras;
+ (uint64_t)_newDataStoreForProfileIdentifier:()SafariSharedExtras;
+ (uint64_t)safari_dataStoreForProfileWithIdentifier:()SafariSharedExtras;
+ (uint64_t)safari_dataStoreForProfileWithIdentifierIfExists:()SafariSharedExtras;
+ (uint64_t)safari_dataStoreWithoutCachingForProfileWithIdentifier:()SafariSharedExtras;
+ (void)safari_clearHSTSSuperCookies;
+ (void)safari_fetchExistingDataStoresForProfilesWithIdentifiers:()SafariSharedExtras completionHandler:;
+ (void)safari_removeDataStoreForProfileWithIdentifier:()SafariSharedExtras completionHandler:;
+ (void)safari_setCommonProperties:()SafariSharedExtras;
- (id)safari_profileIdentifier;
@end

@implementation WKWebsiteDataStore(SafariSharedExtras)

+ (uint64_t)safari_dataStoreForProfileWithIdentifier:()SafariSharedExtras
{
  return objc_msgSend(a1, "_safari_dataStoreForProfileWithIdentifier:createIfNecessary:cacheNewDataStoreInMemory:", a3, 1, 1);
}

+ (void)safari_fetchExistingDataStoresForProfilesWithIdentifiers:()SafariSharedExtras completionHandler:
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 containsObject:*MEMORY[0x1E4F984B8]];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __117__WKWebsiteDataStore_SafariSharedExtras__safari_fetchExistingDataStoresForProfilesWithIdentifiers_completionHandler___block_invoke;
  v11[3] = &unk_1E5E46FD8;
  char v15 = v8;
  id v13 = v7;
  v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  [a1 _fetchAllIdentifiers:v11];
}

+ (id)safari_allPersistentDataStores
{
  v0 = [MEMORY[0x1E4F46710] _dataStoresByProfileIdentifier];
  v1 = [v0 allValues];
  v2 = objc_msgSend(MEMORY[0x1E4F46710], "safari_defaultDataStore");
  v3 = [v1 arrayByAddingObject:v2];

  return v3;
}

+ (id)_safari_dataStoreForProfileWithIdentifier:()SafariSharedExtras createIfNecessary:cacheNewDataStoreInMemory:
{
  id v7 = a3;
  if ([(id)*MEMORY[0x1E4F984B8] isEqualToString:v7])
  {
    objc_msgSend(MEMORY[0x1E4F46710], "safari_defaultDataStore");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = [MEMORY[0x1E4F46710] _dataStoresByProfileIdentifier];
    id v10 = [v9 objectForKeyedSubscript:v7];

    if (v10) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = a4 == 0;
    }
    if (!v11)
    {
      id v10 = (void *)[MEMORY[0x1E4F46710] _newDataStoreForProfileIdentifier:v7];
      if (a5)
      {
        id v12 = [MEMORY[0x1E4F46710] _dataStoresByProfileIdentifier];
        [v12 setObject:v10 forKeyedSubscript:v7];
      }
    }
    id v8 = v10;
  }
  return v8;
}

+ (id)safari_defaultDataStore
{
  v0 = (void *)safari_defaultDataStore_dataStore;
  if (!safari_defaultDataStore_dataStore)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F467D8]);
    objc_msgSend(MEMORY[0x1E4F46710], "safari_setCommonProperties:", v1);
    if ([MEMORY[0x1E4F98318] isWAPEnabled]) {
      [v1 setWebPushMachServiceName:@"com.apple.webkit.webpushd.service"];
    }
    uint64_t v2 = [objc_alloc(MEMORY[0x1E4F46710]) _initWithConfiguration:v1];
    v3 = (void *)safari_defaultDataStore_dataStore;
    safari_defaultDataStore_dataStore = v2;

    v0 = (void *)safari_defaultDataStore_dataStore;
  }
  return v0;
}

+ (void)safari_setCommonProperties:()SafariSharedExtras
{
  id v3 = a3;
  [v3 setFastServerTrustEvaluationEnabled:1];
  [v3 setNetworkCacheSpeculativeValidationEnabled:1];
}

+ (id)_dataStoresByProfileIdentifier
{
  v0 = (void *)_dataStoresByProfileIdentifier_dataStoresByProfileIdentifier;
  if (!_dataStoresByProfileIdentifier_dataStoresByProfileIdentifier)
  {
    uint64_t v1 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v2 = (void *)_dataStoresByProfileIdentifier_dataStoresByProfileIdentifier;
    _dataStoresByProfileIdentifier_dataStoresByProfileIdentifier = v1;

    v0 = (void *)_dataStoresByProfileIdentifier_dataStoresByProfileIdentifier;
  }
  return v0;
}

+ (id)safari_webViewForDownloadsForProfileWithIdentifier:()SafariSharedExtras
{
  id v3 = a3;
  v4 = (void *)safari_webViewForDownloadsForProfileWithIdentifier__map;
  if (!safari_webViewForDownloadsForProfileWithIdentifier__map)
  {
    uint64_t v5 = objc_opt_new();
    id v6 = (void *)safari_webViewForDownloadsForProfileWithIdentifier__map;
    safari_webViewForDownloadsForProfileWithIdentifier__map = v5;

    v4 = (void *)safari_webViewForDownloadsForProfileWithIdentifier__map;
  }
  id v7 = [v4 objectForKeyedSubscript:v3];
  if (!v7)
  {
    id v8 = objc_opt_new();
    id v9 = objc_msgSend(MEMORY[0x1E4F46710], "safari_dataStoreForProfileWithIdentifier:", v3);
    [v8 setWebsiteDataStore:v9];

    id v10 = objc_alloc(MEMORY[0x1E4F466F0]);
    id v7 = objc_msgSend(v10, "initWithFrame:configuration:", v8, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(id)safari_webViewForDownloadsForProfileWithIdentifier__map setObject:v7 forKeyedSubscript:v3];
  }
  return v7;
}

+ (id)safari_allDataTypes
{
  v0 = [MEMORY[0x1E4F46710] allWebsiteDataTypes];
  uint64_t v1 = (void *)[v0 mutableCopy];

  [v1 addObject:*MEMORY[0x1E4F468B8]];
  [v1 addObject:*MEMORY[0x1E4F468B0]];
  [v1 addObject:*MEMORY[0x1E4F468C0]];
  [v1 addObject:*MEMORY[0x1E4F468A8]];
  [v1 addObject:*MEMORY[0x1E4F46898]];
  [v1 addObject:*MEMORY[0x1E4F468A0]];
  return v1;
}

+ (void)safari_clearHSTSSuperCookies
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v0 = (id)_CFNetworkCopyHSTSPolicies();
  uint64_t v1 = [v0 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v12 != v3) {
          objc_enumerationMutation(v0);
        }
        uint64_t v5 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v5 hasSuffix:@"ctoid.net"] & 1) != 0
          || [v5 hasSuffix:@"ar1d.net"])
        {
          id v6 = [v0 objectForKeyedSubscript:v5];
          id v7 = [v6 objectForKeyedSubscript:@"_kCFNetworkHSTSPreloaded"];
          if (([v7 BOOLValue] & 1) == 0)
          {
            id v8 = (void *)MEMORY[0x1E4F1CB10];
            id v9 = [NSString stringWithFormat:@"http://%@/", v5];
            id v10 = [v8 URLWithString:v9];

            _CFNetworkResetHSTS();
          }
        }
      }
      uint64_t v2 = [v0 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v2);
  }
}

+ (uint64_t)safari_dataStoreWithoutCachingForProfileWithIdentifier:()SafariSharedExtras
{
  return objc_msgSend(a1, "_safari_dataStoreForProfileWithIdentifier:createIfNecessary:cacheNewDataStoreInMemory:", a3, 1, 0);
}

+ (uint64_t)safari_dataStoreForProfileWithIdentifierIfExists:()SafariSharedExtras
{
  return objc_msgSend(a1, "_safari_dataStoreForProfileWithIdentifier:createIfNecessary:cacheNewDataStoreInMemory:", a3, 0, 0);
}

+ (void)safari_removeDataStoreForProfileWithIdentifier:()SafariSharedExtras completionHandler:
{
  uint64_t v5 = (void *)MEMORY[0x1E4F46710];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 _dataStoresByProfileIdentifier];
  [v8 setObject:0 forKeyedSubscript:v7];

  id v9 = (void *)MEMORY[0x1E4F46710];
  id v10 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];

  [v9 _removeDataStoreWithIdentifier:v10 completionHandler:v6];
}

+ (uint64_t)_newDataStoreForProfileIdentifier:()SafariSharedExtras
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F467D8];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];

  id v7 = (void *)[v5 initWithIdentifier:v6];
  objc_msgSend(MEMORY[0x1E4F46710], "safari_setCommonProperties:", v7);
  uint64_t v8 = [objc_alloc(MEMORY[0x1E4F46710]) _initWithConfiguration:v7];

  return v8;
}

+ (id)_dataStoresByAutomationSessionIdentifier
{
  id v0 = (void *)_dataStoresByAutomationSessionIdentifier__dataStoresByAutomationSessionIdentifier;
  if (!_dataStoresByAutomationSessionIdentifier__dataStoresByAutomationSessionIdentifier)
  {
    uint64_t v1 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    uint64_t v2 = (void *)_dataStoresByAutomationSessionIdentifier__dataStoresByAutomationSessionIdentifier;
    _dataStoresByAutomationSessionIdentifier__dataStoresByAutomationSessionIdentifier = v1;

    id v0 = (void *)_dataStoresByAutomationSessionIdentifier__dataStoresByAutomationSessionIdentifier;
  }
  return v0;
}

+ (uint64_t)_newDataStoreForAutomationSessionIdentifier:()SafariSharedExtras
{
  v13[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSString;
  id v4 = a3;
  id v5 = NSTemporaryDirectory();
  v13[0] = v5;
  v13[1] = @"SafariAutomation";
  v13[2] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  id v7 = [v3 pathWithComponents:v6];

  uint64_t v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7 isDirectory:1];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F467D8]) initWithDirectory:v8];
  objc_msgSend(MEMORY[0x1E4F46710], "safari_setCommonProperties:", v9);
  id v10 = objc_alloc(MEMORY[0x1E4F46710]);

  uint64_t v11 = [v10 _initWithConfiguration:v9];
  return v11;
}

+ (id)safari_dataStoreForAutomationSessionWithIdentifier:()SafariSharedExtras
{
  id v4 = a3;
  if ([v4 length]
    && ([MEMORY[0x1E4F467D8] instancesRespondToSelector:sel_initWithDirectory_] & 1) != 0)
  {
    id v5 = [MEMORY[0x1E4F46710] _dataStoresByAutomationSessionIdentifier];
    id v6 = [v5 objectForKey:v4];

    if (!v6)
    {
      id v6 = (void *)[MEMORY[0x1E4F46710] _newDataStoreForAutomationSessionIdentifier:v4];
      id v7 = [MEMORY[0x1E4F46710] _dataStoresByAutomationSessionIdentifier];
      [v7 setObject:v6 forKey:v4];
    }
    id v8 = v6;
  }
  else
  {
    objc_msgSend(a1, "safari_nonPersistentDataStore");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)safari_nonPersistentDataStore
{
  id v0 = (void *)[objc_alloc(MEMORY[0x1E4F467D8]) initNonPersistentConfiguration];
  objc_msgSend(MEMORY[0x1E4F46710], "safari_setCommonProperties:", v0);
  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x1E4F46710]) _initWithConfiguration:v0];

  return v1;
}

+ (id)safari_dataStoreWithConfiguration:()SafariSharedExtras
{
  uint64_t v3 = (void *)MEMORY[0x1E4F46710];
  id v4 = a3;
  objc_msgSend(v3, "safari_setCommonProperties:", v4);
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F46710]) _initWithConfiguration:v4];

  return v5;
}

- (id)safari_profileIdentifier
{
  uint64_t v1 = [a1 _configuration];
  uint64_t v2 = [v1 identifier];
  uint64_t v3 = [v2 UUIDString];
  id v4 = v3;
  if (!v3) {
    uint64_t v3 = (void *)*MEMORY[0x1E4F984B8];
  }
  id v5 = v3;

  return v5;
}

@end