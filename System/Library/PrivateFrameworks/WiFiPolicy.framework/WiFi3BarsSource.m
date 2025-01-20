@interface WiFi3BarsSource
- (NSMutableDictionary)networks;
- (NSURL)storeURL;
- (OS_dispatch_queue)queue;
- (TBDataSourceMediator)sourceMediator;
- (WiFi3BarsSource)initWithChangeHandler:(id)a3 localStoreType:(unint64_t)a4;
- (WiFi3BarsTileFetcher)tileFetcher;
- (id)_descriptorForType:(unint64_t)a3;
- (id)_matchSearchBSSIDs:(id)a3 toResponse:(id)a4;
- (id)changeHandler;
- (id)relevancyHandler;
- (id)relevantNetworks;
- (unint64_t)cacheExpirationInDays;
- (void)_handleRemoteFetchResponse:(id)a3;
- (void)fetch3BarsNetworksFor:(id)a3;
- (void)fetch3BarsNetworksForLocation:(id)a3 forceRemote:(BOOL)a4 trigger:(unint64_t)a5 completionHandler:(id)a6;
- (void)fetch3BarsNetworksPredictedForLocation:(id)a3 duration:(double)a4 maxLocations:(unint64_t)a5 completionHandler:(id)a6;
- (void)fetchCandidateNetworksMatchingBSSIDs:(id)a3 completionHandler:(id)a4;
- (void)forceFetch3BarsNetworkMatchingBSSID:(id)a3 completionHandler:(id)a4;
- (void)prune3BarsNetworks:(unint64_t)a3 completionHandler:(id)a4;
- (void)setCacheExpirationInDays:(unint64_t)a3;
- (void)setChangeHandler:(id)a3;
- (void)setNetworks:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRelevancyHandler:(id)a3;
- (void)setSourceMediator:(id)a3;
- (void)setStoreURL:(id)a3;
- (void)setTileFetcher:(id)a3;
- (void)submitCacheAnalyticsEvent;
@end

@implementation WiFi3BarsSource

- (id)relevantNetworks
{
  return 0;
}

- (id)_matchSearchBSSIDs:(id)a3 toResponse:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (objc_opt_respondsToSelector())
  {
    v7 = [v6 resultsByBSSID];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      v9 = [v6 resultsByBSSID];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __49__WiFi3BarsSource__matchSearchBSSIDs_toResponse___block_invoke;
      v52[3] = &unk_1E69BE438;
      id v53 = v29;
      [v9 enumerateKeysAndObjectsUsingBlock:v52];

      goto LABEL_35;
    }
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = v5;
  uint64_t v34 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (!v34) {
    goto LABEL_34;
  }
  id v28 = v5;
  id v31 = v6;
  uint64_t v32 = *(void *)v49;
  do
  {
    for (uint64_t i = 0; i != v34; ++i)
    {
      if (*(void *)v49 != v32) {
        objc_enumerationMutation(obj);
      }
      v11 = *(void **)(*((void *)&v48 + 1) + 8 * i);
      v12 = objc_msgSend(v11, "reformatBSSID", v28);
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v13 = [v6 results];
      uint64_t v38 = [(WiFi3BarsNetwork *)v13 countByEnumeratingWithState:&v44 objects:v55 count:16];
      if (!v38)
      {
        v26 = 0;
        goto LABEL_29;
      }
      v33 = v11;
      uint64_t v35 = i;
      v36 = v13;
      v39 = 0;
      uint64_t v37 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v38; ++j)
        {
          if (*(void *)v45 != v37) {
            objc_enumerationMutation(v36);
          }
          v15 = *(void **)(*((void *)&v44 + 1) + 8 * j);
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          v16 = [v15 accessPoints];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v54 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v41;
            while (2)
            {
              for (uint64_t k = 0; k != v18; ++k)
              {
                if (*(void *)v41 != v19) {
                  objc_enumerationMutation(v16);
                }
                v21 = *(void **)(*((void *)&v40 + 1) + 8 * k);
                v22 = (void *)MEMORY[0x1D9440170]();
                v23 = [v21 BSSID];
                int v24 = [v23 isEqualToString:v12];

                if (v24)
                {
                  id v25 = v15;

                  v39 = v25;
                  goto LABEL_24;
                }
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v40 objects:v54 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }
LABEL_24:
        }
        uint64_t v38 = [(WiFi3BarsNetwork *)v36 countByEnumeratingWithState:&v44 objects:v55 count:16];
      }
      while (v38);

      v26 = v39;
      if (v39)
      {
        v13 = [[WiFi3BarsNetwork alloc] initWithNetwork:v39];
        [v29 setObject:v13 forKey:v33];
        id v6 = v31;
        uint64_t i = v35;
LABEL_29:

        goto LABEL_31;
      }
      id v6 = v31;
      uint64_t i = v35;
LABEL_31:
    }
    uint64_t v34 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
  }
  while (v34);
  id v5 = v28;
LABEL_34:

LABEL_35:

  return v29;
}

- (void)_handleRemoteFetchResponse:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 error];

  if (!v4)
  {
    v7 = [v3 tiles];
    uint64_t v8 = [v7 count];

    BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (!v9) {
        goto LABEL_11;
      }
      id v5 = [v3 tiles];
      int v12 = 136315394;
      v13 = "-[WiFi3BarsSource _handleRemoteFetchResponse:]";
      __int16 v14 = 2048;
      uint64_t v15 = [v5 count];
      v10 = MEMORY[0x1E4F14500];
      v11 = "%s: Fetched %lu tiles";
    }
    else
    {
      if (!v9) {
        goto LABEL_11;
      }
      id v5 = [v3 results];
      int v12 = 136315394;
      v13 = "-[WiFi3BarsSource _handleRemoteFetchResponse:]";
      __int16 v14 = 2048;
      uint64_t v15 = [v5 count];
      v10 = MEMORY[0x1E4F14500];
      v11 = "%s: Fetched %lu results";
    }
    _os_log_impl(&dword_1D3CCD000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v12, 0x16u);
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 error];
    id v6 = [v5 description];
    int v12 = 136315394;
    v13 = "-[WiFi3BarsSource _handleRemoteFetchResponse:]";
    __int16 v14 = 2080;
    uint64_t v15 = [v6 UTF8String];
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Failed fetch with error %s\n", (uint8_t *)&v12, 0x16u);

LABEL_10:
  }
LABEL_11:
}

void __74__WiFi3BarsSource_fetchCandidateNetworksMatchingBSSIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 error];

  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 error];
      int v11 = 136315394;
      int v12 = "-[WiFi3BarsSource fetchCandidateNetworksMatchingBSSIDs:completionHandler:]_block_invoke";
      __int16 v13 = 2112;
      __int16 v14 = v5;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: fetch error %@", (uint8_t *)&v11, 0x16u);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) _matchSearchBSSIDs:*(void *)(a1 + 40) toResponse:v3];
  }
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = [v3 error];
  (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v6, v8);

  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;
}

void __87__WiFi3BarsSource_fetch3BarsNetworksForLocation_forceRemote_trigger_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v10 = a2;
  id v7 = a3;
  uint64_t v8 = v7;
  if (v7) {
    (*((void (**)(id))v7 + 2))(v7);
  }
  [*(id *)(a1 + 32) _handleRemoteFetchResponse:v10];
  if (a4)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
    }
  }
}

- (void)fetch3BarsNetworksFor:(id)a3
{
}

- (WiFi3BarsSource)initWithChangeHandler:(id)a3 localStoreType:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)WiFi3BarsSource;
  id v7 = [(WiFi3BarsSource *)&v26 init];
  if (!v7) {
    goto LABEL_17;
  }
  if (v6)
  {
    uint64_t v8 = MEMORY[0x1D94403E0](v6);
    id changeHandler = v7->changeHandler;
    v7->id changeHandler = (id)v8;
  }
  dispatch_queue_t v10 = dispatch_queue_create("com.apple.wifi.3bars-source", MEMORY[0x1E4F14430]);
  queue = v7->_queue;
  v7->_queue = (OS_dispatch_queue *)v10;

  if (!v7->_queue) {
    goto LABEL_17;
  }
  int v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  networks = v7->_networks;
  v7->_networks = v12;

  if (!v7->_networks) {
    goto LABEL_17;
  }
  __int16 v14 = [(WiFi3BarsSource *)v7 _descriptorForType:a4];
  if (!v14)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v28 = "-[WiFi3BarsSource initWithChangeHandler:localStoreType:]";
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: store descriptor is nil", buf, 0xCu);
    }
LABEL_17:
    uint64_t v15 = 0;
LABEL_18:

    id v7 = 0;
    goto LABEL_14;
  }
  uint64_t v15 = v14;
  uint64_t v16 = [v14 storeURL];
  uint64_t v17 = [v16 copy];
  storeURL = v7->_storeURL;
  v7->_storeURL = (NSURL *)v17;

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = v7->_storeURL;
    *(_DWORD *)buf = 136315394;
    id v28 = "-[WiFi3BarsSource initWithChangeHandler:localStoreType:]";
    __int16 v29 = 2112;
    v30 = v19;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: source initialized with storeURL %@", buf, 0x16u);
  }
  v20 = [[TBDataSourceMediator alloc] initWithLocalStoreDescriptor:v15];
  sourceMediator = v7->_sourceMediator;
  v7->_sourceMediator = v20;

  if (!v7->_sourceMediator) {
    goto LABEL_18;
  }
  if (![v15 type])
  {
    v22 = [[WiFi3BarsTileFetcher alloc] initWithDataSourceMediator:v7->_sourceMediator];
    tileFetcher = v7->_tileFetcher;
    v7->_tileFetcher = v22;

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v24 = v7->_tileFetcher;
      *(_DWORD *)buf = 136315394;
      id v28 = "-[WiFi3BarsSource initWithChangeHandler:localStoreType:]";
      __int16 v29 = 2112;
      v30 = v24;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: created tile fetcher %@ for server", buf, 0x16u);
    }
  }
  v7->_cacheExpirationInDays = 7;
LABEL_14:

  return v7;
}

- (id)_descriptorForType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      id v5 = +[TBCoreDataStoreDescriptor serverStoreDescriptor];
      goto LABEL_9;
    case 1uLL:
      id v5 = +[TBCoreDataStoreDescriptor directStoreDescriptor];
      goto LABEL_9;
    case 2uLL:
      id v5 = +[TBCoreDataStoreDescriptor clientStoreDescriptor];
      goto LABEL_9;
    case 3uLL:
      id v5 = +[TBCoreDataStoreDescriptor tempStoreDescriptor];
LABEL_9:
      break;
    default:
      id v5 = 0;
      break;
  }
  return v5;
}

- (void)fetch3BarsNetworksForLocation:(id)a3 forceRemote:(BOOL)a4 trigger:(unint64_t)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v38 = "-[WiFi3BarsSource fetch3BarsNetworksForLocation:forceRemote:trigger:completionHandler:]";
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  int v12 = [MEMORY[0x1E4F1C9C8] date];
  __int16 v13 = objc_msgSend(v12, "dateByAddingDays:", --[WiFi3BarsSource cacheExpirationInDays](self, "cacheExpirationInDays"));

  __int16 v14 = [TBLocationFetchRequestDescriptor alloc];
  [v10 coordinate];
  double v16 = v15;
  [v10 coordinate];
  double v18 = v17;
  if (a5 == 1)
  {
    +[TBDefaults nearbyTileSearchRadius];
    uint64_t v20 = [(TBLocationFetchRequestDescriptor *)v14 initWithLatitude:v13 longitude:v16 radius:v18 maxCacheAge:v19];
  }
  else
  {
    uint64_t v20 = [(TBLocationFetchRequestDescriptor *)v14 initWithLatitude:v13 longitude:v16 maxCacheAge:v17];
  }
  v21 = (void *)v20;
  if (v8) {
    uint64_t v22 = 2;
  }
  else {
    uint64_t v22 = 3;
  }
  v23 = +[TBLocationFetchRequest fetchRequestWithDescriptor:v20 sourcePolicy:v22 cacheable:1];
  v35[0] = @"trigger";
  int v24 = [NSNumber numberWithUnsignedInteger:a5];
  v35[1] = @"tileKey";
  v36[0] = v24;
  id v25 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v21, "primaryTileKey"));
  v36[1] = v25;
  objc_super v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
  [v23 setUserInfo:v26];

  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  uint64_t v31 = __87__WiFi3BarsSource_fetch3BarsNetworksForLocation_forceRemote_trigger_completionHandler___block_invoke;
  uint64_t v32 = &unk_1E69BE370;
  v33 = self;
  id v34 = v11;
  id v27 = v11;
  [v23 setResultsHandler:&v29];
  id v28 = [(WiFi3BarsSource *)self sourceMediator];
  [v28 executeFetchRequest:v23];
}

- (void)fetchCandidateNetworksMatchingBSSIDs:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[WiFi3BarsSource fetchCandidateNetworksMatchingBSSIDs:completionHandler:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v6 count];
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: fetching candidates for %lu BSSIDS", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__8;
  v23 = __Block_byref_object_dispose__8;
  id v24 = (id)os_transaction_create();
  BOOL v8 = [[TBNetworkFetchRequestDescriptor alloc] initWithBSSIDs:v6];
  uint64_t v9 = +[TBNetworkFetchRequest fetchRequestWithDescriptor:v8 sourcePolicy:1];
  [v9 setUserInfo:&unk_1F2B95678];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  double v15 = __74__WiFi3BarsSource_fetchCandidateNetworksMatchingBSSIDs_completionHandler___block_invoke;
  double v16 = &unk_1E69BE410;
  double v17 = self;
  id v10 = v6;
  id v18 = v10;
  id v11 = v7;
  id v19 = v11;
  uint64_t v20 = buf;
  [v9 setResultsHandler:&v13];
  int v12 = [(WiFi3BarsSource *)self sourceMediator];
  [v12 executeFetchRequest:v9];

  _Block_object_dispose(buf, 8);
}

- (TBDataSourceMediator)sourceMediator
{
  return self->_sourceMediator;
}

- (unint64_t)cacheExpirationInDays
{
  return self->_cacheExpirationInDays;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileFetcher, 0);
  objc_storeStrong((id *)&self->_sourceMediator, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_networks, 0);
  objc_storeStrong(&self->relevancyHandler, 0);

  objc_storeStrong(&self->changeHandler, 0);
}

- (void)fetch3BarsNetworksPredictedForLocation:(id)a3 duration:(double)a4 maxLocations:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  int v12 = [(WiFi3BarsSource *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__WiFi3BarsSource_fetch3BarsNetworksPredictedForLocation_duration_maxLocations_completionHandler___block_invoke;
  block[3] = &unk_1E69BE3E8;
  block[4] = self;
  id v16 = v10;
  double v19 = a4;
  id v17 = v11;
  unint64_t v18 = a5;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, block);
}

void __98__WiFi3BarsSource_fetch3BarsNetworksPredictedForLocation_duration_maxLocations_completionHandler___block_invoke(uint64_t a1)
{
  v2 = dispatch_group_create();
  objc_initWeak(&location, *(id *)(a1 + 32));
  dispatch_group_enter(v2);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __98__WiFi3BarsSource_fetch3BarsNetworksPredictedForLocation_duration_maxLocations_completionHandler___block_invoke_2;
  v16[3] = &unk_1E69BE3C0;
  v18[1] = *(id *)(a1 + 56);
  uint64_t v3 = v2;
  id v17 = v3;
  objc_copyWeak(v18, &location);
  uint64_t v4 = (void *)MEMORY[0x1D94403E0](v16);
  id v5 = [MEMORY[0x1E4F5CEB0] defaultManager];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  [v5 fetchNextPredictedLocationsOfInterestFromLocation:v6 startDate:v7 timeInterval:v4 withHandler:*(double *)(a1 + 64)];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Querying current location", buf, 2u);
  }
  dispatch_group_enter(v3);
  id v8 = objc_loadWeakRetained(&location);
  uint64_t v9 = *(void *)(a1 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __98__WiFi3BarsSource_fetch3BarsNetworksPredictedForLocation_duration_maxLocations_completionHandler___block_invoke_19;
  v13[3] = &unk_1E69BE398;
  id v10 = v3;
  id v14 = v10;
  [v8 fetch3BarsNetworksForLocation:v9 forceRemote:0 trigger:2 completionHandler:v13];

  dispatch_time_t v11 = dispatch_time(0, 3600000000000);
  dispatch_group_wait(v10, v11);
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(void))(v12 + 16))();
  }

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

void __98__WiFi3BarsSource_fetch3BarsNetworksPredictedForLocation_duration_maxLocations_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v26 = [v5 count];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v35[0] = v26;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[predictedLocationsOfInterest count] <%ld>", buf, 0xCu);
  }
  if (!v6 && v26)
  {
    id v25 = v5;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      unint64_t v10 = 0;
      uint64_t v11 = *(void *)v31;
      id v27 = v7;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v14 = (void *)MEMORY[0x1D9440170]();
          if (v10 < *(void *)(a1 + 48))
          {
            [v13 confidence];
            if (v15 >= 0.5)
            {
              dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
              id v16 = [v13 locationOfInterest];
              id v17 = objc_alloc(MEMORY[0x1E4F1E5F8]);
              unint64_t v18 = [v16 location];
              [v18 latitude];
              double v20 = v19;
              v21 = [v16 location];
              [v21 longitude];
              v23 = (void *)[v17 initWithLatitude:v20 longitude:v22];

              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                LODWORD(v35[0]) = v10 + 1;
                WORD2(v35[0]) = 2048;
                *(void *)((char *)v35 + 6) = v26;
                _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Querying predicted location %d/%ld", buf, 0x12u);
              }
              id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
              v28[0] = MEMORY[0x1E4F143A8];
              v28[1] = 3221225472;
              v28[2] = __98__WiFi3BarsSource_fetch3BarsNetworksPredictedForLocation_duration_maxLocations_completionHandler___block_invoke_15;
              v28[3] = &unk_1E69BE398;
              id v29 = *(id *)(a1 + 32);
              [WeakRetained fetch3BarsNetworksForLocation:v23 forceRemote:0 trigger:3 completionHandler:v28];

              ++v10;
              id v7 = v27;
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v9);
    }

    id v6 = 0;
    id v5 = v25;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __98__WiFi3BarsSource_fetch3BarsNetworksPredictedForLocation_duration_maxLocations_completionHandler___block_invoke_15(uint64_t a1)
{
}

void __98__WiFi3BarsSource_fetch3BarsNetworksPredictedForLocation_duration_maxLocations_completionHandler___block_invoke_19(uint64_t a1)
{
}

- (void)prune3BarsNetworks:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(WiFi3BarsSource *)self sourceMediator];
  [v7 prune3BarsNetworks:a3 completionHandler:v6];
}

void __49__WiFi3BarsSource__matchSearchBSSIDs_toResponse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[WiFi3BarsNetwork alloc] initWithNetwork:v5];

  [*(id *)(a1 + 32) setObject:v7 forKey:v6];
}

- (void)forceFetch3BarsNetworkMatchingBSSID:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    double v20 = "-[WiFi3BarsSource forceFetch3BarsNetworkMatchingBSSID:completionHandler:]";
    __int16 v21 = 2160;
    uint64_t v22 = 1752392040;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: fetching 3bars network for %{mask.hash}@", buf, 0x20u);
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v6, 0);
  uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
  unint64_t v10 = objc_msgSend(v9, "dateByAddingDays:", --[WiFi3BarsSource cacheExpirationInDays](self, "cacheExpirationInDays"));

  uint64_t v11 = [[TBNetworkFetchRequestDescriptor alloc] initWithBSSIDs:v8 maxCacheAge:v10];
  uint64_t v12 = +[TBNetworkFetchRequest fetchRequestWithDescriptor:v11 sourcePolicy:3 cacheable:1];
  [v12 setUserInfo:&unk_1F2B956A0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__WiFi3BarsSource_forceFetch3BarsNetworkMatchingBSSID_completionHandler___block_invoke;
  v16[3] = &unk_1E69BE460;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v7;
  id v13 = v7;
  id v14 = v8;
  [v12 setResultsHandler:v16];
  double v15 = [(WiFi3BarsSource *)self sourceMediator];
  [v15 executeFetchRequest:v12];
}

void __73__WiFi3BarsSource_forceFetch3BarsNetworkMatchingBSSID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  id v5 = [v3 error];

  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v3 error];
      int v10 = 136315394;
      uint64_t v11 = "-[WiFi3BarsSource forceFetch3BarsNetworkMatchingBSSID:completionHandler:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: fetch error %@", (uint8_t *)&v10, 0x16u);
    }
    id v7 = 0;
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) _matchSearchBSSIDs:*(void *)(a1 + 40) toResponse:v3];
  }
  [v4 setResults:v7];
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8)
  {
    uint64_t v9 = [v3 error];
    (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v4, v9);
  }
}

- (void)submitCacheAnalyticsEvent
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [(WiFi3BarsSource *)self sourceMediator];
  id v3 = [v2 local];
  uint64_t v4 = [v3 context];

  if (v4)
  {
    id v5 = +[TBTileMO fetchRequest];
    [v5 setIncludesSubentities:0];
    id v6 = +[TBTileMO fetchRequest];
    [v6 setIncludesSubentities:0];
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v8 = [v7 dateByAddingDays:-1];

    uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"created > %@", v8];
    [v6 setPredicate:v9];

    id v17 = 0;
    uint64_t v10 = [v4 countForFetchRequest:v5 error:&v17];
    id v11 = v17;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        double v19 = "-[WiFi3BarsSource submitCacheAnalyticsEvent]";
        __int16 v20 = 2112;
        uint64_t v21 = (uint64_t)v11;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: error fetching all tiles %@", buf, 0x16u);
      }
    }
    else
    {
      id v16 = 0;
      uint64_t v12 = [v4 countForFetchRequest:v6 error:&v16];
      id v13 = v16;
      BOOL v14 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v14)
        {
          *(_DWORD *)buf = 136315394;
          double v19 = "-[WiFi3BarsSource submitCacheAnalyticsEvent]";
          __int16 v20 = 2112;
          uint64_t v21 = (uint64_t)v11;
          _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: error fetching last day tiles %@", buf, 0x16u);
        }
      }
      else
      {
        if (v14)
        {
          *(_DWORD *)buf = 136315650;
          double v19 = "-[WiFi3BarsSource submitCacheAnalyticsEvent]";
          __int16 v20 = 2048;
          uint64_t v21 = v10;
          __int16 v22 = 2048;
          uint64_t v23 = v12;
          _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: allCount: %lu lastDayCount: %lu", buf, 0x20u);
        }
        double v15 = +[TBCacheAnalyticsEvent cacheEventWithTotalCount:v10 last24HoursCount:v12];
        +[TBAnalytics captureEvent:v15];
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v19 = "-[WiFi3BarsSource submitCacheAnalyticsEvent]";
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: unable to get moc", buf, 0xCu);
  }
}

- (void)setCacheExpirationInDays:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[WiFi3BarsSource setCacheExpirationInDays:]";
    __int16 v9 = 2048;
    unint64_t v10 = a3;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: setting new cache expiration %lu", (uint8_t *)&v7, 0x16u);
  }
  self->_cacheExpirationInDays = a3;
  id v5 = [(WiFi3BarsSource *)self sourceMediator];
  id v6 = [v5 local];
  [v6 setCacheExpirationInDays:a3];
}

- (id)changeHandler
{
  return self->changeHandler;
}

- (void)setChangeHandler:(id)a3
{
}

- (id)relevancyHandler
{
  return self->relevancyHandler;
}

- (void)setRelevancyHandler:(id)a3
{
}

- (NSMutableDictionary)networks
{
  return self->_networks;
}

- (void)setNetworks:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (void)setStoreURL:(id)a3
{
}

- (void)setSourceMediator:(id)a3
{
}

- (WiFi3BarsTileFetcher)tileFetcher
{
  return self->_tileFetcher;
}

- (void)setTileFetcher:(id)a3
{
}

@end