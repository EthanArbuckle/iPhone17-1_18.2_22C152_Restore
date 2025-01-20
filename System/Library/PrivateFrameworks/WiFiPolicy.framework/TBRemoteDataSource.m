@interface TBRemoteDataSource
- (OS_dispatch_queue)queue;
- (TBRemoteDataSource)init;
- (unint64_t)type;
- (void)_captureTileFetchError:(id)a3 tileKey:(id)a4 duration:(double)a5 trigger:(unint64_t)a6;
- (void)_executeNetworkFetchRequest:(id)a3;
- (void)_fetchTilesForTileItems:(id)a3 completionHandler:(id)a4 trigger:(unint64_t)a5;
- (void)_fetchTilesWithRequest:(id)a3;
- (void)_submitNetworkSearch:(id)a3 completion:(id)a4;
- (void)_writeSearchTileToFile:(id)a3;
- (void)executeFetchRequest:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation TBRemoteDataSource

- (void).cxx_destruct
{
}

- (TBRemoteDataSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)TBRemoteDataSource;
  v2 = [(TBRemoteDataSource *)&v6 init];
  if (!v2)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "self", ", "/Library/Caches/com.apple.xbs/Sources/WiFiPolicy/frameworks/Sources/ThreeBars/Data Sources/TBRemoteDataSource.m"", 38, 0);
LABEL_6:

    return 0;
  }
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.wifi.threebars.service", MEMORY[0x1E4F14430]);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v3;

  if (!v2->_queue)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "_queue", ", "/Library/Caches/com.apple.xbs/Sources/WiFiPolicy/frameworks/Sources/ThreeBars/Data Sources/TBRemoteDataSource.m"", 41, 0);
    goto LABEL_6;
  }
  return v2;
}

- (unint64_t)type
{
  return 1;
}

- (void)_submitNetworkSearch:(id)a3 completion:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  objc_super v6 = (void *)MEMORY[0x1E4F64708];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 sharedService];
  v13[0] = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  v11 = [v9 ticketForWiFiQualityNetworkServiceRequest:v10];

  v12 = [(TBRemoteDataSource *)self queue];
  [v11 submitNetworkSearchWithCompletionQueue:v12 completion:v7];
}

- (void)executeFetchRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 descriptor];
  uint64_t v6 = [v5 type];

  switch(v6)
  {
    case 3:
      [(TBRemoteDataSource *)self _executeTileFetchRequest:v4];
      break;
    case 2:
      [(TBRemoteDataSource *)self _executeLocationFetchRequest:v4];
      break;
    case 1:
      [(TBRemoteDataSource *)self _executeNetworkFetchRequest:v4];
      break;
    default:
      v7.receiver = self;
      v7.super_class = (Class)TBRemoteDataSource;
      [(TBDataSource *)&v7 executeFetchRequest:v4];
      break;
  }
}

- (void)_executeNetworkFetchRequest:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 descriptor];
  uint64_t v6 = [v5 remoteRequest];

  if (v6)
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__0;
    v15[4] = __Block_byref_object_dispose__0;
    id v16 = (id)os_transaction_create();
    uint64_t v7 = mach_absolute_time();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__TBRemoteDataSource__executeNetworkFetchRequest___block_invoke;
    v11[3] = &unk_1E69BCC90;
    uint64_t v14 = v7;
    v11[4] = self;
    id v12 = v4;
    v13 = v15;
    [(TBRemoteDataSource *)self _submitNetworkSearch:v6 completion:v11];

    _Block_object_dispose(v15, 8);
  }
  else
  {
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"remoteRequest property is nil";
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v9 = +[TBError fetchMissingParametersErrorWithUserInfo:v8];

    NSLog(&cfstr_SFailedToCreat_1.isa, "-[TBRemoteDataSource _executeNetworkFetchRequest:]");
    v10 = +[TBErrorFetchResponse responseWithError:v9];
    [v4 handleResponse:v10];
  }
}

void __50__TBRemoteDataSource__executeNetworkFetchRequest___block_invoke(void *a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  uint64_t v6 = mach_absolute_time();
  double v7 = MachTimeToSecs(v6 - a1[7]);
  if (v5)
  {
    NSLog(&cfstr_SError.isa, "-[TBRemoteDataSource _executeNetworkFetchRequest:]_block_invoke", v5);
    id v8 = +[TBErrorFetchResponse remoteResponseWithError:v5];
    uint64_t v9 = 0;
  }
  else
  {
    id v8 = +[TBNetworkRemoteFetchResponse responseWithNetworkSearchResults:v17];
    v10 = [v8 results];
    uint64_t v9 = [v10 count];

    v11 = [v8 results];
    NSLog(&cfstr_SFetchedLuResu.isa, "-[TBRemoteDataSource _executeNetworkFetchRequest:]_block_invoke", [v11 count], *(void *)&v7);
  }
  id v12 = (void *)a1[4];
  uint64_t v13 = a1[5];
  uint64_t v14 = [v8 error];
  [v12 submitAnalyticsEventForFetchRequest:v13 duration:v14 error:v9 resultCount:v7];

  [(id)a1[5] handleResponse:v8];
  uint64_t v15 = *(void *)(a1[6] + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = 0;
}

- (void)_fetchTilesWithRequest:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 descriptor];
  uint64_t v6 = [v5 tileItems];

  if (v6)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v4 userInfo],
          double v7 = objc_claimAutoreleasedReturnValue(),
          [v7 objectForKeyedSubscript:@"trigger"],
          id v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          v8))
    {
      uint64_t v9 = [v4 userInfo];
      v10 = [v9 objectForKeyedSubscript:@"trigger"];
      uint64_t v11 = [v10 unsignedIntegerValue];
    }
    else
    {
      uint64_t v11 = 0;
    }
    id v12 = [(TBRemoteDataSource *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__TBRemoteDataSource__fetchTilesWithRequest___block_invoke;
    block[3] = &unk_1E69BCCE0;
    id v17 = v6;
    v18 = self;
    id v19 = v4;
    uint64_t v20 = v11;
    dispatch_async(v12, block);

    uint64_t v13 = v17;
  }
  else
  {
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22[0] = @"tileItem property is nil";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v13 = +[TBError fetchMissingParametersErrorWithUserInfo:v14];

    NSLog(&cfstr_SFailedToCreat_2.isa, "-[TBRemoteDataSource _fetchTilesWithRequest:]");
    uint64_t v15 = +[TBErrorFetchResponse responseWithError:v13];
    [v4 handleResponse:v15];
  }
}

void __45__TBRemoteDataSource__fetchTilesWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v14 = mach_absolute_time();
  uint64_t v15 = [*(id *)(a1 + 32) allObjects];
  v2 = [MEMORY[0x1E4F1CA80] set];
  unint64_t v3 = [*(id *)(a1 + 32) count];
  NSLog(&cfstr_SFetchingLuTil.isa, "-[TBRemoteDataSource _fetchTilesWithRequest:]_block_invoke", v3);
  unint64_t v4 = 0;
  unint64_t v5 = 1;
  do
  {
    if (v4 < v3)
    {
      uint64_t v6 = [v15 objectAtIndexedSubscript:v4];
      [v2 addObject:v6];
    }
    unint64_t v7 = v4 + 1;
    if (v3 - 1 == v4 || 10 * (v5 / 0xA) - 1 == v4)
    {
      id v8 = dispatch_group_create();
      dispatch_group_enter(v8);
      uint64_t v9 = *(void **)(a1 + 40);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __45__TBRemoteDataSource__fetchTilesWithRequest___block_invoke_2;
      v16[3] = &unk_1E69BCCB8;
      id v10 = v2;
      id v17 = v10;
      unint64_t v21 = v7;
      unint64_t v22 = v3;
      id v18 = *(id *)(a1 + 48);
      id v19 = v8;
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v23 = v14;
      uint64_t v20 = v11;
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = v8;
      [v9 _fetchTilesForTileItems:v10 completionHandler:v16 trigger:v12];
      dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    }
    ++v5;
    unint64_t v4 = v7;
  }
  while (v7 <= v3);
}

void __45__TBRemoteDataSource__fetchTilesWithRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) removeAllObjects];
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  uint64_t v6 = [*(id *)(a1 + 40) resultsHandler];

  if (v6)
  {
    unint64_t v7 = [*(id *)(a1 + 40) resultsHandler];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __45__TBRemoteDataSource__fetchTilesWithRequest___block_invoke_3;
    v13[3] = &unk_1E69BC8D8;
    id v14 = *(id *)(a1 + 48);
    ((void (**)(void, id, void *, BOOL))v7)[2](v7, v3, v13, v4 == v5);

    if (v4 == v5)
    {
      uint64_t v8 = mach_absolute_time();
      double v9 = MachTimeToSecs(v8 - *(void *)(a1 + 80));
      id v10 = *(void **)(a1 + 56);
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = [v3 error];
      [v10 submitAnalyticsEventForFetchRequest:v11 duration:v12 error:*(void *)(a1 + 72) resultCount:v9];
    }
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

void __45__TBRemoteDataSource__fetchTilesWithRequest___block_invoke_3(uint64_t a1)
{
}

- (void)_fetchTilesForTileItems:(id)a3 completionHandler:(id)a4 trigger:(unint64_t)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v21 = a4;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__0;
  v37[4] = __Block_byref_object_dispose__0;
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v8 = dispatch_group_create();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v9)
  {
    uint64_t v23 = *(void *)v34;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v33 + 1) + 8 * v10);
        dispatch_group_enter(v8);
        uint64_t v12 = mach_absolute_time();
        uint64_t v13 = [MEMORY[0x1E4F64708] sharedService];
        id v14 = [v11 key];
        uint64_t v15 = [v14 stringValue];
        id v16 = [v11 etag];
        id v17 = [v13 ticketForWiFiQualityTileLoadForKey:v15 eTag:v16];

        id v18 = [(TBRemoteDataSource *)self queue];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __72__TBRemoteDataSource__fetchTilesForTileItems_completionHandler_trigger___block_invoke;
        v28[3] = &unk_1E69BCD08;
        uint64_t v31 = v12;
        unint64_t v32 = a5;
        v28[4] = self;
        v30 = v37;
        v29 = v8;
        [v17 submitTileLoadWithCompletionQueue:v18 completion:v28];

        ++v10;
      }
      while (v9 != v10);
      uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v9);
  }

  id v19 = [(TBRemoteDataSource *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__TBRemoteDataSource__fetchTilesForTileItems_completionHandler_trigger___block_invoke_2;
  block[3] = &unk_1E69BCD30;
  v27 = v37;
  void block[4] = self;
  id v26 = v21;
  id v20 = v21;
  dispatch_group_notify(v8, v19, block);

  _Block_object_dispose(v37, 8);
}

void __72__TBRemoteDataSource__fetchTilesForTileItems_completionHandler_trigger___block_invoke(uint64_t a1, void *a2, char a3, void *a4, void *a5, void *a6)
{
  id v22 = a2;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (a3)
  {
    if (!v13)
    {
      uint64_t v15 = 2;
LABEL_9:
      id v19 = [[TBRemoteFetchTileItem alloc] initWithTile:v11 status:v15 etag:v12 error:0];
      id v20 = *(id *)(a1 + 32);
      objc_sync_enter(v20);
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v19];
      goto LABEL_10;
    }
  }
  else
  {
    if (!v13)
    {
      uint64_t v15 = 1;
      goto LABEL_9;
    }
    id v16 = [v13 domain];
    id v17 = GEOErrorDomain();
    if ([v16 isEqualToString:v17])
    {
      uint64_t v18 = [v14 code];

      if (v18 == -7)
      {
        id v19 = -[TBRemoteFetchTileItem initWithEmptyTileKey:etag:error:]([TBRemoteFetchTileItem alloc], "initWithEmptyTileKey:etag:error:", [v22 integerValue], v12, v14);
        id v20 = *(id *)(a1 + 32);
        objc_sync_enter(v20);
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v19];
LABEL_10:
        objc_sync_exit(v20);

        goto LABEL_14;
      }
    }
    else
    {
    }
    uint64_t v21 = mach_absolute_time();
    [*(id *)(a1 + 32) _captureTileFetchError:v14 tileKey:v22 duration:*(void *)(a1 + 64) trigger:MachTimeToSecs(v21 - *(void *)(a1 + 56))];
  }
  NSLog(&cfstr_SError.isa, "-[TBRemoteDataSource _fetchTilesForTileItems:completionHandler:trigger:]_block_invoke", v14);
LABEL_14:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __72__TBRemoteDataSource__fetchTilesForTileItems_completionHandler_trigger___block_invoke_2(uint64_t a1)
{
  NSLog(&cfstr_SFinishedTileD.isa, "-[TBRemoteDataSource _fetchTilesForTileItems:completionHandler:trigger:]_block_invoke_2", [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count]);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = +[TBTileRemoteFetchResponse responseWithTileItems:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeAllObjects];
  objc_sync_exit(obj);
}

- (void)_writeSearchTileToFile:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28DB0];
  uint64_t v10 = 0;
  id v4 = a3;
  uint64_t v5 = [v3 archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v10];
  uint64_t v6 = NSString;
  uint64_t v7 = [v4 tileKey];

  uint64_t v8 = objc_msgSend(v6, "stringWithFormat:", @"/tmp/tile_%llu", v7, v10);
  uint64_t v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
  [v5 writeToURL:v9 atomically:1];
}

- (void)_captureTileFetchError:(id)a3 tileKey:(id)a4 duration:(double)a5 trigger:(unint64_t)a6
{
  uint64_t v9 = NSNumber;
  id v10 = a4;
  id v11 = a3;
  id v13 = [v9 numberWithDouble:a5];
  id v12 = +[TBFetchAnalyticsEvent fetchEventWithSource:2 type:3 trigger:a6 duration:v13 requestCount:&unk_1F2B93DD8 resultCount:0 error:v11 tileKey:v10];

  +[TBAnalytics captureEvent:v12];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

@end