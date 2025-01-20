@interface WCRBloomFilter
+ (BOOL)_shouldBlock:(id)a3 withBloomFilter:(id)a4 useCipherML:(BOOL)a5;
+ (id)_matchingStringsForDomain:(id)a3;
+ (id)_matchingStringsForURL:(id)a3;
+ (id)_nameOfNewestFile:(id)a3;
+ (void)reportAnalyticsBloomFilterBlocked;
+ (void)reportAnalyticsBloomFilterVersion:(id)a3 withAppleAllowListVersion:(id)a4;
- (BOOL)shouldBlock:(id)a3;
- (BOOL)useCipherML;
- (NSString)localPath;
- (OS_dispatch_queue)reloadAssetQueue;
- (WCRAppleAllowList)appleAllowList;
- (WCRAutoAssetClient)autoAsset;
- (WCRBloomFilter)init;
- (_TtC22WebContentRestrictions15BloomFilterShim)bloomFilter;
- (id)initFromFile:(id)a3;
- (void)_loadAssets;
- (void)_loadFallbackAssets;
- (void)_loadMobileAssets;
- (void)setAppleAllowList:(id)a3;
- (void)setAutoAsset:(id)a3;
- (void)setBloomFilter:(id)a3;
- (void)setLocalPath:(id)a3;
- (void)setReloadAssetQueue:(id)a3;
- (void)setUseCipherML:(BOOL)a3;
@end

@implementation WCRBloomFilter

- (WCRBloomFilter)init
{
  v19.receiver = self;
  v19.super_class = (Class)WCRBloomFilter;
  v2 = [(WCRBloomFilter *)&v19 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create((const char *)[@"com.apple.WebContentRestrictions.reloadAssetsQueue" UTF8String], 0);
    reloadAssetQueue = v2->_reloadAssetQueue;
    v2->_reloadAssetQueue = (OS_dispatch_queue *)v3;

    v2->_useCipherML = 1;
    id v18 = 0;
    v5 = [[WCRAutoAssetClient alloc] initWithError:&v18];
    id v6 = v18;
    autoAsset = v2->_autoAsset;
    v2->_autoAsset = v5;

    if (v2->_autoAsset)
    {
      objc_initWeak(&location, v2);
      v8 = v2->_autoAsset;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __22__WCRBloomFilter_init__block_invoke;
      v14[3] = &unk_265585740;
      v15 = v2;
      objc_copyWeak(&v16, &location);
      [(WCRAutoAssetClient *)v8 registerForAssetChangedNotificationsWithBlock:v14];
      objc_destroyWeak(&v16);

      objc_destroyWeak(&location);
    }
    else
    {
      v9 = [NSString stringWithFormat:@"Error initializing WCRAutoAssetClient: %@", v6];
      +[WCRLogging log:v9 withType:1];
    }
    v10 = [(WCRBloomFilter *)v2 reloadAssetQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __22__WCRBloomFilter_init__block_invoke_3;
    block[3] = &unk_265585768;
    v13 = v2;
    dispatch_sync(v10, block);

    if (v2->_useCipherML) {
      +[WCRCipherMLClient activateCipherML];
    }
  }
  return v2;
}

void __22__WCRBloomFilter_init__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) reloadAssetQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __22__WCRBloomFilter_init__block_invoke_2;
  block[3] = &unk_265585718;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_sync(v2, block);

  objc_destroyWeak(&v4);
}

void __22__WCRBloomFilter_init__block_invoke_2(id *a1)
{
  v2 = [NSString stringWithFormat:@"--- Received Download Notification ---"];
  +[WCRLogging log:v2 withType:0];

  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  id v4 = [WeakRetained autoAsset];
  [v4 stopUsingLocalAsset];

  id v5 = objc_loadWeakRetained(a1);
  [v5 _loadAssets];
}

uint64_t __22__WCRBloomFilter_init__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadAssets];
}

- (id)initFromFile:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WCRBloomFilter;
  id v6 = [(WCRBloomFilter *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_localPath, a3);
    v8 = [[_TtC22WebContentRestrictions15BloomFilterShim alloc] initWithPath:v7->_localPath];
    bloomFilter = v7->_bloomFilter;
    v7->_bloomFilter = v8;

    v10 = [NSString stringWithFormat:@"Initializing bloom filter from file %@", v7->_localPath];
    +[WCRLogging log:v10 withType:0];
  }
  return v7;
}

- (void)_loadAssets
{
  dispatch_queue_t v3 = [(WCRBloomFilter *)self autoAsset];

  if (v3) {
    [(WCRBloomFilter *)self _loadMobileAssets];
  }
  [(WCRBloomFilter *)self _loadFallbackAssets];
  id v4 = objc_opt_class();
  id v11 = [(WCRBloomFilter *)self localPath];
  id v5 = [v11 lastPathComponent];
  id v6 = [v5 stringByDeletingPathExtension];
  v7 = [(WCRBloomFilter *)self appleAllowList];
  v8 = [v7 localPath];
  v9 = [v8 lastPathComponent];
  v10 = [v9 stringByDeletingPathExtension];
  [v4 reportAnalyticsBloomFilterVersion:v6 withAppleAllowListVersion:v10];
}

- (void)_loadFallbackAssets
{
  dispatch_queue_t v3 = [(WCRBloomFilter *)self bloomFilter];

  if (!v3)
  {
    id v4 = [NSString stringWithFormat:@"Could not find a bloom filter from MobileAsset. Using local copy %@ instead", @"WCRFilter-2024-09-09.plist"];
    +[WCRLogging log:v4 withType:1];

    id v5 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/WebContentRestrictions.framework"];
    id v6 = [@"WCRFilter-2024-09-09.plist" stringByDeletingPathExtension];
    v7 = [@"WCRFilter-2024-09-09.plist" pathExtension];
    v8 = [v5 pathForResource:v6 ofType:v7];

    [(WCRBloomFilter *)self setLocalPath:v8];
    v9 = [_TtC22WebContentRestrictions15BloomFilterShim alloc];
    v10 = [(WCRBloomFilter *)self localPath];
    id v11 = [(BloomFilterShim *)v9 initWithPath:v10];
    [(WCRBloomFilter *)self setBloomFilter:v11];

    objc_super v12 = [(WCRBloomFilter *)self bloomFilter];

    if (v12)
    {
      v13 = NSString;
      v14 = [(WCRBloomFilter *)self localPath];
      v15 = [v13 stringWithFormat:@"Initialized bloom filter at path %@", v14];
      +[WCRLogging log:v15 withType:0];
    }
  }
  id v16 = [(WCRBloomFilter *)self appleAllowList];

  if (!v16)
  {
    v17 = [NSString stringWithFormat:@"Could not find an Apple allow list filter from MobileAsset. Using local copy %@ instead", @"WCRAppleAllowList-2024-09-09.plist"];
    +[WCRLogging log:v17 withType:1];

    id v18 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/WebContentRestrictions.framework"];
    objc_super v19 = [@"WCRAppleAllowList-2024-09-09.plist" stringByDeletingPathExtension];
    v20 = [@"WCRAppleAllowList-2024-09-09.plist" pathExtension];
    id v24 = [v18 pathForResource:v19 ofType:v20];

    id v21 = [[WCRAppleAllowList alloc] initFromFile:v24];
    [(WCRBloomFilter *)self setAppleAllowList:v21];

    v22 = [(WCRBloomFilter *)self appleAllowList];

    if (v22)
    {
      v23 = [NSString stringWithFormat:@"Initialized Apple allow list at path %@", v24];
      +[WCRLogging log:v23 withType:0];
    }
  }
}

- (void)_loadMobileAssets
{
  id v24 = [MEMORY[0x263F08850] defaultManager];
  dispatch_queue_t v3 = [(WCRBloomFilter *)self autoAsset];
  id v4 = [v3 startUsingLocalAsset];

  if ([v24 fileExistsAtPath:v4])
  {
    id v5 = [NSString stringWithFormat:@"Will use MobileAsset bundle path: %@", v4];
    +[WCRLogging log:v5 withType:2];

    id v6 = [v4 stringByAppendingPathComponent:@"Bloom Filters"];
    uint64_t v7 = [v24 contentsOfDirectoryAtPath:v6 error:0];
    v8 = [NSString stringWithFormat:@"Content of bloom filters dir: %@", v7];
    +[WCRLogging log:v8 withType:2];

    v23 = (void *)v7;
    v9 = [(id)objc_opt_class() _nameOfNewestFile:v7];
    v10 = [v6 stringByAppendingPathComponent:v9];

    id v11 = [NSString stringWithFormat:@"Loading bloom filter from MobileAsset bundle: %@", v10];
    +[WCRLogging log:v11 withType:2];

    [(WCRBloomFilter *)self setLocalPath:v10];
    objc_super v12 = [[_TtC22WebContentRestrictions15BloomFilterShim alloc] initWithPath:v10];
    [(WCRBloomFilter *)self setBloomFilter:v12];

    v13 = [(WCRBloomFilter *)self bloomFilter];

    if (v13)
    {
      v14 = [NSString stringWithFormat:@"Initialized bloom filter at path %@", v10];
      +[WCRLogging log:v14 withType:0];
    }
    v15 = [v4 stringByAppendingPathComponent:@"Apple Allow Lists"];
    id v16 = [v24 contentsOfDirectoryAtPath:v15 error:0];
    v17 = [(id)objc_opt_class() _nameOfNewestFile:v16];
    id v18 = [v15 stringByAppendingPathComponent:v17];

    objc_super v19 = [NSString stringWithFormat:@"Loading Apple allow list from MobileAsset bundle: %@", v18];
    +[WCRLogging log:v19 withType:2];

    id v20 = [[WCRAppleAllowList alloc] initFromFile:v18];
    [(WCRBloomFilter *)self setAppleAllowList:v20];

    id v21 = [(WCRBloomFilter *)self appleAllowList];

    if (v21)
    {
      v22 = [NSString stringWithFormat:@"Initialized Apple allow list at path %@", v18];
      +[WCRLogging log:v22 withType:0];
    }
  }
  else
  {
    id v6 = [NSString stringWithFormat:@"MobileAsset bundle doesn't exist at path: %@", v4];
    +[WCRLogging log:v6 withType:1];
  }
}

+ (id)_nameOfNewestFile:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = [v4 sortedArrayUsingComparator:&__block_literal_global];
    id v6 = [v5 lastObject];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t __36__WCRBloomFilter__nameOfNewestFile___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)shouldBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(WCRBloomFilter *)self bloomFilter];
  LOBYTE(self) = objc_msgSend(v5, "_shouldBlock:withBloomFilter:useCipherML:", v4, v6, -[WCRBloomFilter useCipherML](self, "useCipherML"));

  return (char)self;
}

+ (BOOL)_shouldBlock:(id)a3 withBloomFilter:(id)a4 useCipherML:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v31 = a4;
  v8 = [(id)objc_opt_class() _matchingStringsForURL:v7];
  v9 = v8;
  if (v8)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v10 = v8;
    id v11 = (id)[v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v11)
    {
      BOOL v29 = v5;
      id v30 = v7;
      uint64_t v12 = *(void *)v34;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v33 + 1) + 8 * v13);
        int v15 = [v31 contains:v14];
        id v16 = v15 ? @"Blocked" : @"Allowed";
        v17 = [NSString stringWithFormat:@"%@ -> %@", v14, v16];
        +[WCRLogging log:v17 withType:5];

        if (v15) {
          break;
        }
        if (v11 == (id)++v13)
        {
          id v11 = (id)[v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
          if (v11) {
            goto LABEL_4;
          }
          BOOL v18 = 0;
          id v7 = v30;
          goto LABEL_31;
        }
      }
      id v11 = v14;
      [(id)objc_opt_class() reportAnalyticsBloomFilterBlocked];

      if (!v29)
      {
        BOOL v18 = 1;
        id v7 = v30;
        goto LABEL_32;
      }
      id v32 = 0;
      objc_super v19 = +[WCRCipherMLClient categoryForString:v11 withError:&v32];
      id v20 = v32;
      id v10 = v20;
      id v21 = NSString;
      if (v19 || !v20)
      {
        v27 = [NSString stringWithFormat:@"CipherML response: %@", v19];
        +[WCRLogging log:v27 withType:0];

        if ([v19 integerValue] != 301)
        {
          id v7 = v30;
          BOOL v18 = [v19 integerValue] == 303
             || [v19 integerValue] == 1505
             || [v19 integerValue] == 501;
          goto LABEL_30;
        }
        BOOL v18 = 1;
      }
      else
      {
        id v22 = [v20 description];
        v23 = objc_msgSend(v21, "stringWithFormat:", @"CipherML error: %s. Falling back to local filter verdict.", objc_msgSend(v22, "UTF8String"));
        BOOL v18 = 1;
        +[WCRLogging log:v23 withType:1];
      }
      id v7 = v30;
LABEL_30:

      goto LABEL_31;
    }
    BOOL v18 = 0;
LABEL_31:

LABEL_32:
  }
  else
  {
    id v24 = [v7 scheme];

    v25 = @"Unknown format";
    if (!v24) {
      v25 = @"Missing a scheme (e.g. https://)";
    }
    v26 = [NSString stringWithFormat:@"Unable to parse URL: %@", v25];
    +[WCRLogging log:v26 withType:1];

    BOOL v18 = 0;
  }

  return v18;
}

+ (id)_matchingStringsForDomain:(id)a3
{
  if (a3)
  {
    id v3 = [a3 componentsSeparatedByString:@"."];
    id v4 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v3, "count"));
    if ([v3 count])
    {
      uint64_t v5 = 0;
      unint64_t v6 = 0;
      do
      {
        id v7 = objc_msgSend(v3, "subarrayWithRange:", v6, objc_msgSend(v3, "count") + v5);
        v8 = [v7 componentsJoinedByString:@"."];
        [v4 addObject:v8];

        ++v6;
        --v5;
      }
      while ([v3 count] > v6);
    }
    v9 = (void *)[v4 copy];
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (id)_matchingStringsForURL:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)MEMORY[0x263EFF9C0];
    unint64_t v6 = [v3 pathComponents];
    id v7 = objc_msgSend(v5, "setWithCapacity:", objc_msgSend(v6, "count"));

    v8 = [v4 host];

    if (v8)
    {
      v9 = objc_opt_class();
      id v10 = [v4 host];
      id v11 = [v9 _matchingStringsForDomain:v10];

      uint64_t v12 = [v11 allObjects];
      [v7 addObjectsFromArray:v12];

      uint64_t v13 = [v4 host];
      int v14 = [v13 hasPrefix:@"www."];
      int v15 = [v4 host];
      id v16 = v15;
      if (v14)
      {
        uint64_t v17 = [v15 stringByReplacingOccurrencesOfString:@"www." withString:&stru_270D81768];

        id v16 = (void *)v17;
      }

      if (v16)
      {
        v49 = v11;
        [v7 addObject:v16];
        v48 = v16;
        id v18 = v16;
        objc_super v19 = [v4 host];
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v20 = [v4 pathComponents];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v50 objects:v54 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v51;
          do
          {
            uint64_t v24 = 0;
            v25 = v18;
            v26 = v19;
            do
            {
              if (*(void *)v51 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v27 = *(void *)(*((void *)&v50 + 1) + 8 * v24);
              id v18 = [v25 stringByAppendingPathComponent:v27];

              objc_super v19 = [v26 stringByAppendingPathComponent:v27];

              v28 = (void *)[v18 copy];
              [v7 addObject:v28];

              BOOL v29 = (void *)[v19 copy];
              [v7 addObject:v29];

              ++v24;
              v25 = v18;
              v26 = v19;
            }
            while (v22 != v24);
            uint64_t v22 = [v20 countByEnumeratingWithState:&v50 objects:v54 count:16];
          }
          while (v22);
        }

        id v30 = [v4 query];

        if (v30)
        {
          id v31 = NSString;
          id v32 = [v4 query];
          long long v33 = [v31 stringWithFormat:@"?%@", v32];

          long long v34 = [v18 stringByAppendingString:v33];

          long long v35 = [v19 stringByAppendingString:v33];

          long long v36 = (void *)[v34 copy];
          [v7 addObject:v36];

          v37 = (void *)[v35 copy];
          [v7 addObject:v37];

          id v18 = v34;
          objc_super v19 = v35;
        }
        uint64_t v38 = [v4 fragment];

        id v16 = v48;
        if (v38)
        {
          v39 = NSString;
          v40 = [v4 fragment];
          v41 = [v39 stringWithFormat:@"#%@", v40];

          v42 = [v18 stringByAppendingString:v41];

          v43 = [v19 stringByAppendingString:v41];

          v44 = (void *)[v42 copy];
          [v7 addObject:v44];

          v45 = (void *)[v43 copy];
          [v7 addObject:v45];

          id v18 = v42;
          objc_super v19 = v43;
        }
        id v11 = v49;
        v46 = (void *)[v7 copy];
      }
      else
      {
        v46 = 0;
      }
    }
    else
    {
      v46 = 0;
    }
  }
  else
  {
    v46 = 0;
  }

  return v46;
}

+ (void)reportAnalyticsBloomFilterVersion:(id)a3 withAppleAllowListVersion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && v6)
  {
    id v9 = v5;
    id v10 = v7;
    AnalyticsSendEventLazy();
  }
  else
  {
    v8 = [NSString stringWithFormat:@"Analytics: Filter versions were nil!"];
    +[WCRLogging log:v8 withType:1];
  }
}

id __78__WCRBloomFilter_reportAnalyticsBloomFilterVersion_withAppleAllowListVersion___block_invoke(uint64_t a1)
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = @"bloom_filter_version";
  v4[1] = @"apple_allowlist_version";
  uint64_t v1 = *(void *)(a1 + 40);
  v5[0] = *(void *)(a1 + 32);
  v5[1] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

+ (void)reportAnalyticsBloomFilterBlocked
{
}

id __51__WCRBloomFilter_reportAnalyticsBloomFilterBlocked__block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  v2 = @"bloom_filter_verdict";
  v3[0] = @"Blocked";
  v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  return v0;
}

- (NSString)localPath
{
  return self->_localPath;
}

- (void)setLocalPath:(id)a3
{
}

- (WCRAppleAllowList)appleAllowList
{
  return (WCRAppleAllowList *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAppleAllowList:(id)a3
{
}

- (BOOL)useCipherML
{
  return self->_useCipherML;
}

- (void)setUseCipherML:(BOOL)a3
{
  self->_useCipherML = a3;
}

- (WCRAutoAssetClient)autoAsset
{
  return self->_autoAsset;
}

- (void)setAutoAsset:(id)a3
{
}

- (_TtC22WebContentRestrictions15BloomFilterShim)bloomFilter
{
  return (_TtC22WebContentRestrictions15BloomFilterShim *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBloomFilter:(id)a3
{
}

- (OS_dispatch_queue)reloadAssetQueue
{
  return self->_reloadAssetQueue;
}

- (void)setReloadAssetQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reloadAssetQueue, 0);
  objc_storeStrong((id *)&self->_bloomFilter, 0);
  objc_storeStrong((id *)&self->_autoAsset, 0);
  objc_storeStrong((id *)&self->_appleAllowList, 0);
  objc_storeStrong((id *)&self->_localPath, 0);
}

@end