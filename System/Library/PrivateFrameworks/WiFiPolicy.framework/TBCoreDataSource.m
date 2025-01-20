@interface TBCoreDataSource
- (BOOL)_canSupportRequest:(id)a3;
- (BOOL)hasStorageError;
- (NSManagedObjectContext)context;
- (TBCoreDataSource)initWithStoreDescriptor:(id)a3;
- (TBCoreDataStoreDescriptor)descriptor;
- (TBPersistenceManager)persistenceManager;
- (unint64_t)cacheExpirationInDays;
- (unint64_t)type;
- (void)_createNewNetwork:(id)a3 tile:(id)a4 withMOC:(id)a5;
- (void)_createNewNetworkFromDictionary:(id)a3 withMOC:(id)a4;
- (void)_executeFetchRequest:(id)a3;
- (void)_executePreferLocalFetchRequest:(id)a3;
- (void)cacheFetchResponse:(id)a3 completionHandler:(id)a4;
- (void)executeFetchRequest:(id)a3;
- (void)importObjectsWithArray:(id)a3 completionHandler:(id)a4;
- (void)prune3BarsNetworks:(unint64_t)a3 completionHandler:(id)a4;
- (void)removeAllWithCompletionHandler:(id)a3;
- (void)removeWithFetchRequest:(id)a3 completionHandler:(id)a4;
- (void)setCacheExpirationInDays:(unint64_t)a3;
- (void)setContext:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setHasStorageError:(BOOL)a3;
- (void)setPersistenceManager:(id)a3;
@end

@implementation TBCoreDataSource

- (void)_executeFetchRequest:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(TBCoreDataSource *)self _canSupportRequest:v4])
  {
    if ([(TBCoreDataSource *)self hasStorageError])
    {
      v5 = [TBError alloc];
      uint64_t v37 = *MEMORY[0x1E4F28568];
      v38 = @"Failed to add persistent store.";
      v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      v7 = [(TBError *)v5 initWithType:104 userInfo:v6];

      v8 = +[TBErrorFetchResponse responseWithError:v7];
      [v4 handleResponse:v8];
    }
    else
    {
      v11 = [v4 descriptor];
      v12 = [v11 localFetchDescriptor];
      v7 = [v12 fetchRequest];

      if (v7)
      {
        uint64_t v13 = mach_absolute_time();
        uint64_t v31 = 0;
        v32 = &v31;
        uint64_t v33 = 0x2020000000;
        uint64_t v34 = 0;
        uint64_t v25 = 0;
        v26 = &v25;
        uint64_t v27 = 0x3032000000;
        v28 = __Block_byref_object_copy__4;
        v29 = __Block_byref_object_dispose__4;
        id v30 = 0;
        v14 = [v4 descriptor];
        BOOL v15 = [v14 type] == 1;

        if (v15)
        {
          [(TBError *)v7 setResultType:2];
          [(TBError *)v7 setPropertiesToFetch:&unk_1F2B95308];
          [(TBError *)v7 setAllocationType:1];
          v16 = [(TBCoreDataSource *)self context];
          v17 = v24;
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __41__TBCoreDataSource__executeFetchRequest___block_invoke;
          v24[3] = &unk_1E69BD600;
          v24[4] = self;
          v24[5] = v7;
          v24[7] = &v25;
          v24[6] = v4;
          v24[8] = &v31;
          [v16 performBlockAndWait:v24];
        }
        else
        {
          v16 = [(TBCoreDataSource *)self context];
          v17 = v23;
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __41__TBCoreDataSource__executeFetchRequest___block_invoke_2;
          v23[3] = &unk_1E69BD628;
          v23[4] = self;
          v23[5] = v7;
          v23[6] = v4;
          v23[7] = &v31;
          [v16 performBlockAndWait:v23];
        }

        uint64_t v21 = mach_absolute_time();
        double v22 = MachTimeToSecs(v21 - v13);
        NSLog(&cfstr_SFetchedLuResu.isa, "-[TBCoreDataSource _executeFetchRequest:]", v32[3], *(void *)&v22);
        [(TBDataSource *)self submitAnalyticsEventForFetchRequest:v4 duration:v26[5] error:v32[3] resultCount:v22];
        _Block_object_dispose(&v25, 8);

        _Block_object_dispose(&v31, 8);
      }
      else
      {
        uint64_t v35 = *MEMORY[0x1E4F28568];
        v36 = @"localFetchDescriptor is nil";
        v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        v19 = +[TBError fetchMissingParametersErrorWithUserInfo:v18];

        v20 = +[TBErrorFetchResponse responseWithError:v19];
        [v4 handleResponse:v20];
      }
    }
  }
  else
  {
    uint64_t v39 = *MEMORY[0x1E4F28568];
    v40[0] = @"unhandled fetch request type";
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
    v7 = +[TBError fetchMissingParametersErrorWithUserInfo:v9];

    v10 = +[TBErrorFetchResponse responseWithError:v7];
    [v4 handleResponse:v10];
  }
}

- (BOOL)hasStorageError
{
  return self->_hasStorageError;
}

- (BOOL)_canSupportRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 descriptor];
  if ([v4 type] == 1)
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [v3 descriptor];
    if ([v6 type] == 2)
    {
      BOOL v5 = 1;
    }
    else
    {
      v7 = [v3 descriptor];
      BOOL v5 = [v7 type] == 3;
    }
  }

  return v5;
}

void __41__TBCoreDataSource__executeFetchRequest___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) context];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  BOOL v5 = [v2 executeFetchRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);

  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v6)
  {
    NSLog(&cfstr_SFailedFetchFo.isa, "-[TBCoreDataSource _executeFetchRequest:]_block_invoke", v6);
    v7 = *(void **)(a1 + 48);
    v8 = +[TBErrorFetchResponse responseWithError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    [v7 handleResponse:v8];
  }
  else
  {
    v8 = +[TBNetworkMO fetchRequest];
    v9 = (void *)MEMORY[0x1E4F28F60];
    v10 = [v5 valueForKey:@"network"];
    v11 = [v9 predicateWithFormat:@"self IN %@", v10];
    [v8 setPredicate:v11];

    [v8 setReturnsObjectsAsFaults:0];
    v12 = [*(id *)(a1 + 32) context];
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    id v37 = *(id *)(v13 + 40);
    v14 = [v12 executeFetchRequest:v8 error:&v37];
    objc_storeStrong((id *)(v13 + 40), v37);

    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (!v14 || v15)
    {
      NSLog(&cfstr_SFailedFetchFo_0.isa, "-[TBCoreDataSource _executeFetchRequest:]_block_invoke", v15);
      v28 = *(void **)(a1 + 48);
      v16 = +[TBErrorFetchResponse responseWithError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      [v28 handleResponse:v16];
    }
    else
    {
      v29 = v14;
      id v30 = v8;
      v16 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v31 = v5;
      id v32 = v5;
      uint64_t v17 = [v32 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v34 != v19) {
              objc_enumerationMutation(v32);
            }
            uint64_t v21 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            double v22 = [v21 objectForKey:@"bssid"];
            v23 = [v21 objectForKey:@"network"];
            v24 = [*(id *)(a1 + 32) context];
            uint64_t v25 = [v24 objectWithID:v23];
            [v16 setObject:v25 forKey:v22];
          }
          uint64_t v18 = [v32 countByEnumeratingWithState:&v33 objects:v39 count:16];
        }
        while (v18);
      }

      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v16 count];
      v26 = *(void **)(a1 + 48);
      uint64_t v27 = +[TBLocalFetchResponse responseWithResultsByBSSID:v16];
      [v26 handleResponse:v27];

      v8 = v30;
      BOOL v5 = v31;
      v14 = v29;
    }
  }
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (unint64_t)type
{
  return 0;
}

- (TBCoreDataSource)initWithStoreDescriptor:(id)a3
{
  uint64_t v4 = (TBCoreDataStoreDescriptor *)a3;
  v32.receiver = self;
  v32.super_class = (Class)TBCoreDataSource;
  BOOL v5 = [(TBCoreDataSource *)&v32 init];
  descriptor = v5->_descriptor;
  v5->_descriptor = v4;
  v7 = v4;

  id v8 = objc_alloc(MEMORY[0x1E4F1C120]);
  v9 = [(TBCoreDataStoreDescriptor *)v7 modelURL];
  v10 = (void *)[v8 initWithContentsOfURL:v9];

  v11 = [[TBPersistenceManager alloc] initWithManagedObjectModel:v10 storeDescriptor:v7];
  persistenceManager = v5->_persistenceManager;
  v5->_persistenceManager = v11;

  uint64_t v13 = v5->_persistenceManager;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __44__TBCoreDataSource_initWithStoreDescriptor___block_invoke;
  v30[3] = &unk_1E69BD5D8;
  v14 = v5;
  uint64_t v31 = v14;
  [(TBPersistenceManager *)v13 addPersistentStorage:v7 completionHandler:v30];
  uint64_t v15 = [(TBCoreDataStoreDescriptor *)v7 modelURL];
  NSLog(&cfstr_SObjectModelAt.isa, "-[TBCoreDataSource initWithStoreDescriptor:]", v15);

  v16 = [(TBCoreDataStoreDescriptor *)v7 storeURL];
  NSLog(&cfstr_SStoreUrl.isa, "-[TBCoreDataSource initWithStoreDescriptor:]", v16);

  uint64_t v17 = (NSManagedObjectContext *)[objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
  uint64_t v18 = [MEMORY[0x1E4F1C130] mergeByPropertyObjectTrumpMergePolicy];
  [(NSManagedObjectContext *)v17 setMergePolicy:v18];

  uint64_t v19 = [(TBPersistenceManager *)v5->_persistenceManager persistenceCoordinator];
  [(NSManagedObjectContext *)v17 setPersistentStoreCoordinator:v19];

  v20 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v21 = [v20 processName];
  [(NSManagedObjectContext *)v17 setTransactionAuthor:v21];

  context = v14->_context;
  v14->_context = v17;
  v23 = v17;

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __44__TBCoreDataSource_initWithStoreDescriptor___block_invoke_2;
  v28[3] = &unk_1E69BD458;
  v24 = v14;
  v29 = v24;
  +[WCAFetchWiFiBehaviorParameters fetchWiFiBehaviorWithCompletion:v28];
  uint64_t v25 = v29;
  v26 = v24;

  return v26;
}

void __52__TBCoreDataSource__executePreferLocalFetchRequest___block_invoke(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) context];
  uint64_t v3 = *(void *)(a1 + 40);
  id v17 = 0;
  uint64_t v4 = [v2 executeFetchRequest:v3 error:&v17];
  id v5 = v17;

  if (v5)
  {
    NSLog(&cfstr_SError.isa, "-[TBCoreDataSource _executePreferLocalFetchRequest:]_block_invoke", v5);
    uint64_t v6 = *(void **)(a1 + 48);
    v7 = +[TBErrorFetchResponse responseWithError:v5];
    [v6 handleResponse:v7];
LABEL_11:

    goto LABEL_12;
  }
  if (![v4 count])
  {
    v10 = [TBError alloc];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21[0] = @"pref local cache doesn't satisfy request (0 results)";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    v12 = v10;
    uint64_t v13 = 103;
LABEL_10:
    v7 = [(TBError *)v12 initWithType:v13 userInfo:v11];

    uint64_t v15 = *(void **)(a1 + 48);
    v16 = +[TBErrorFetchResponse responseWithError:v7];
    [v15 handleResponse:v16];

    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 48) handlePreferLocalResponse:v4];
  }
  id v8 = [*(id *)(a1 + 48) preferLocalHandler];
  int v9 = ((uint64_t (**)(void, void *))v8)[2](v8, v4);

  if (!v9)
  {
    v14 = [TBError alloc];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    uint64_t v19 = @"pref local cache doesn't satisfy request (1 or more missing results)";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v12 = v14;
    uint64_t v13 = 102;
    goto LABEL_10;
  }
  NSLog(&cfstr_SLocalResultsS.isa, "-[TBCoreDataSource _executePreferLocalFetchRequest:]_block_invoke", [v4 count]);
  [*(id *)(a1 + 32) _executeFetchRequest:*(void *)(a1 + 48)];
LABEL_12:
}

- (void)executeFetchRequest:(id)a3
{
  id v4 = a3;
  if ([v4 sourcePolicy] == 3) {
    [(TBCoreDataSource *)self _executePreferLocalFetchRequest:v4];
  }
  else {
    [(TBCoreDataSource *)self _executeFetchRequest:v4];
  }
}

- (void)_executePreferLocalFetchRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 descriptor];
  uint64_t v6 = [v5 preferLocalFetchDescriptor];
  v7 = [v6 fetchRequest];

  id v8 = [(TBCoreDataSource *)self context];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__TBCoreDataSource__executePreferLocalFetchRequest___block_invoke;
  v11[3] = &unk_1E69BCEC8;
  v11[4] = self;
  id v12 = v7;
  id v13 = v4;
  id v9 = v4;
  id v10 = v7;
  [v8 performBlock:v11];
}

void __41__TBCoreDataSource__executeFetchRequest___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  uint64_t v3 = *(void *)(a1 + 40);
  id v10 = 0;
  id v4 = [v2 executeFetchRequest:v3 error:&v10];
  id v5 = v10;

  if (v5)
  {
    NSLog(&cfstr_SError.isa, "-[TBCoreDataSource _executeFetchRequest:]_block_invoke_2", v5);
    uint64_t v6 = *(void **)(a1 + 48);
    v7 = +[TBErrorFetchResponse responseWithError:v5];
    [v6 handleResponse:v7];
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v4 count];
    id v8 = *(void **)(a1 + 48);
    v7 = [*(id *)(a1 + 40) entity];
    uint64_t v9 = +[TBLocalFetchResponse responseWithResults:v4 entityDescription:v7];
    [v8 handleResponse:v9];

    id v5 = (id)v9;
  }
}

void __44__TBCoreDataSource_initWithStoreDescriptor___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 jtrnDefaults];
  if (v3)
  {
    id v5 = v3;
    id v4 = [v3 valueForKey:@"kWiFiCoreDataSourceExpirationDays"];
    *(void *)(*(void *)(a1 + 32) + 24) = (int)[v4 intValue];

    uint64_t v3 = v5;
  }
  else
  {
    *(void *)(*(void *)(a1 + 32) + 24) = 7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

void __44__TBCoreDataSource_initWithStoreDescriptor___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSLog(&cfstr_SAddThePersist.isa, "-[TBCoreDataSource initWithStoreDescriptor:]_block_invoke", a2);
    *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  }
}

- (void)cacheFetchResponse:(id)a3 completionHandler:(id)a4
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v72 = (void (**)(id, void *))a4;
  v66 = v5;
  NSLog(&cfstr_SCachingRespon.isa, "-[TBCoreDataSource cacheFetchResponse:completionHandler:]", v5);
  v65 = (void *)os_transaction_create();
  uint64_t v6 = [v5 error];

  if (v6)
  {
    v7 = [v5 error];
    NSLog(&cfstr_SError.isa, "-[TBCoreDataSource cacheFetchResponse:completionHandler:]", v7);

    if (v72)
    {
      id v8 = [v5 error];
      v72[2](v72, v8);
    }
  }
  else
  {
    v64 = (void *)[objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
    uint64_t v9 = [(TBCoreDataSource *)self persistenceManager];
    id v10 = [v9 persistenceCoordinator];
    [v64 setPersistentStoreCoordinator:v10];

    v11 = [MEMORY[0x1E4F1C9C8] date];
    v63 = objc_msgSend(v11, "dateByAddingDays:", --[TBCoreDataSource cacheExpirationInDays](self, "cacheExpirationInDays"));

    id v12 = [v66 tiles];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      v62 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(created < %@)", v63];
      +[TBTileMO removeTilesUsingPredicate:v62 moc:v64];
      v14 = (void *)MEMORY[0x1E4F1CA48];
      uint64_t v15 = [v66 tiles];
      v70 = objc_msgSend(v14, "arrayWithCapacity:", objc_msgSend(v15, "count"));

      long long v122 = 0u;
      long long v123 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      v16 = [v66 tiles];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v120 objects:v127 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v121;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v121 != v18) {
              objc_enumerationMutation(v16);
            }
            uint64_t v20 = NSNumber;
            uint64_t v21 = [*(id *)(*((void *)&v120 + 1) + 8 * i) tile];
            double v22 = objc_msgSend(v20, "numberWithLongLong:", objc_msgSend(v21, "key"));
            [v70 addObject:v22];
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v120 objects:v127 count:16];
        }
        while (v17);
      }

      v61 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(key IN %@)", v70];
      +[TBTileMO removeTilesUsingPredicate:v61 moc:v64];
      v118[0] = MEMORY[0x1E4F143A8];
      v118[1] = 3221225472;
      v118[2] = __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke;
      v118[3] = &unk_1E69BC8D8;
      id v23 = v64;
      id v119 = v23;
      [v23 performBlockAndWait:v118];
      v24 = [v66 tiles];
      uint64_t v77 = [v24 count];

      long long v116 = 0u;
      long long v117 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      id obj = [v66 tiles];
      uint64_t v69 = [obj countByEnumeratingWithState:&v114 objects:v126 count:16];
      if (v69)
      {
        uint64_t v79 = 0;
        uint64_t v68 = *(void *)v115;
        do
        {
          uint64_t v25 = 0;
          do
          {
            if (*(void *)v115 != v68)
            {
              uint64_t v26 = v25;
              objc_enumerationMutation(obj);
              uint64_t v25 = v26;
            }
            uint64_t v73 = v25;
            uint64_t v27 = *(void **)(*((void *)&v114 + 1) + 8 * v25);
            context = (void *)MEMORY[0x1D9440170]();
            v28 = [v27 tile];
            v29 = +[TBTileMO generateNewTileObjectFromMOC:v23];
            objc_msgSend(v29, "setKey:", objc_msgSend(v28, "key"));
            id v30 = [MEMORY[0x1E4F1C9C8] date];
            [v29 setCreated:v30];

            if (objc_opt_respondsToSelector())
            {
              uint64_t v31 = [v28 etag];
              [v29 setEtag:v31];
            }
            else
            {
              NSLog(&cfstr_STileDoesnTRes.isa, "-[TBCoreDataSource cacheFetchResponse:completionHandler:]", v28);
            }
            objc_super v32 = [v27 networks];
            uint64_t v33 = [v32 count];
            NSLog(&cfstr_SLdResultsForT.isa, "-[TBCoreDataSource cacheFetchResponse:completionHandler:]", v33, v79++, [v28 key]);
            uint64_t v108 = 0;
            v109 = &v108;
            uint64_t v110 = 0x3032000000;
            v111 = __Block_byref_object_copy__4;
            v112 = __Block_byref_object_dispose__4;
            id v113 = 0;
            if (v33)
            {
              if (v33 >= 1)
              {
                uint64_t v34 = 0;
                unint64_t v35 = 1;
                do
                {
                  long long v36 = [v32 objectAtIndexedSubscript:v34];
                  [(TBCoreDataSource *)self _createNewNetwork:v36 tile:v29 withMOC:v23];
                  uint64_t v37 = v34 + 1;
                  if (100 * (v35 / 0x64) - 1 == v34 || v33 - 1 == v34)
                  {
                    NSLog(&cfstr_SSavingEntries.isa, "-[TBCoreDataSource cacheFetchResponse:completionHandler:]", v34 + 1, v33);
                    v98[0] = MEMORY[0x1E4F143A8];
                    v98[1] = 3221225472;
                    v98[2] = __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke_3;
                    v98[3] = &unk_1E69BD650;
                    id v99 = v23;
                    v100 = &v108;
                    uint64_t v101 = v79;
                    uint64_t v102 = v77;
                    [v99 performBlockAndWait:v98];
                  }
                  ++v35;
                  ++v34;
                }
                while (v33 != v37);
              }
            }
            else
            {
              NSLog(&cfstr_SSavingEmptyTi.isa, "-[TBCoreDataSource cacheFetchResponse:completionHandler:]", [v28 key]);
              v103[0] = MEMORY[0x1E4F143A8];
              v103[1] = 3221225472;
              v103[2] = __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke_2;
              v103[3] = &unk_1E69BD650;
              id v104 = v23;
              v105 = &v108;
              uint64_t v106 = v79;
              uint64_t v107 = v77;
              [v104 performBlockAndWait:v103];
            }
            if (v72 && v79 == v77) {
              v72[2](v72, (void *)v109[5]);
            }
            _Block_object_dispose(&v108, 8);

            uint64_t v25 = v73 + 1;
          }
          while (v73 + 1 != v69);
          uint64_t v69 = [obj countByEnumeratingWithState:&v114 objects:v126 count:16];
        }
        while (v69);
      }
    }
    else
    {
      uint64_t v39 = [v66 results];
      uint64_t v40 = [v39 count];

      if (v40)
      {
        v41 = [MEMORY[0x1E4F1CA80] set];
        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        id v76 = [v66 results];
        uint64_t v80 = [v76 countByEnumeratingWithState:&v94 objects:v125 count:16];
        if (v80)
        {
          uint64_t v78 = *(void *)v95;
          do
          {
            for (uint64_t j = 0; j != v80; ++j)
            {
              if (*(void *)v95 != v78) {
                objc_enumerationMutation(v76);
              }
              v43 = *(void **)(*((void *)&v94 + 1) + 8 * j);
              long long v90 = 0u;
              long long v91 = 0u;
              long long v92 = 0u;
              long long v93 = 0u;
              v44 = [v43 accessPoints];
              uint64_t v45 = [v44 countByEnumeratingWithState:&v90 objects:v124 count:16];
              if (v45)
              {
                uint64_t v46 = *(void *)v91;
                do
                {
                  for (uint64_t k = 0; k != v45; ++k)
                  {
                    if (*(void *)v91 != v46) {
                      objc_enumerationMutation(v44);
                    }
                    v48 = *(void **)(*((void *)&v90 + 1) + 8 * k);
                    v49 = [v48 BSSID];

                    if (v49)
                    {
                      v50 = [v48 BSSID];
                      [v41 addObject:v50];
                    }
                    else
                    {
                      NSLog(&cfstr_SNullBssidForN.isa, "-[TBCoreDataSource cacheFetchResponse:completionHandler:]", v43);
                    }
                  }
                  uint64_t v45 = [v44 countByEnumeratingWithState:&v90 objects:v124 count:16];
                }
                while (v45);
              }
            }
            uint64_t v80 = [v76 countByEnumeratingWithState:&v94 objects:v125 count:16];
          }
          while (v80);
        }

        v74 = +[TBAccessPointMO fetchRequest];
        v51 = [v41 bssidPredicate];
        [v74 setPredicate:v51];

        v52 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v74];
        v87[0] = MEMORY[0x1E4F143A8];
        v87[1] = 3221225472;
        v87[2] = __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke_4;
        v87[3] = &unk_1E69BC8B0;
        id v53 = v64;
        id v88 = v53;
        id v71 = v52;
        id v89 = v71;
        [v53 performBlockAndWait:v87];
        v54 = [v66 results];
        uint64_t v55 = [v54 count];
        NSLog(&cfstr_SLdResultsAvai.isa, "-[TBCoreDataSource cacheFetchResponse:completionHandler:]", v55);
        uint64_t v56 = v55 - 1;
        if (v55 >= 1)
        {
          uint64_t v57 = 0;
          unint64_t v58 = 1;
          do
          {
            v59 = [v54 objectAtIndexedSubscript:v57];
            [(TBCoreDataSource *)self _createNewNetwork:v59 tile:0 withMOC:v53];
            uint64_t v60 = v57 + 1;
            if (v56 == v57 || 100 * (v58 / 0x64) - 1 == v57)
            {
              NSLog(&cfstr_SSavingEntries.isa, "-[TBCoreDataSource cacheFetchResponse:completionHandler:]", v57 + 1, v55);
              uint64_t v108 = 0;
              v109 = &v108;
              uint64_t v110 = 0x3032000000;
              v111 = __Block_byref_object_copy__4;
              v112 = __Block_byref_object_dispose__4;
              id v113 = 0;
              v82[0] = MEMORY[0x1E4F143A8];
              v82[1] = 3221225472;
              v82[2] = __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke_5;
              v82[3] = &unk_1E69BD650;
              id v83 = v53;
              v84 = &v108;
              uint64_t v85 = v57 + 1;
              uint64_t v86 = v55;
              [v83 performBlockAndWait:v82];
              if (v72 && v56 == v57) {
                v72[2](v72, (void *)v109[5]);
              }

              _Block_object_dispose(&v108, 8);
            }

            ++v58;
            ++v57;
          }
          while (v55 != v60);
        }
      }
      else
      {
        NSLog(&cfstr_SEmptyResultsI.isa, "-[TBCoreDataSource cacheFetchResponse:completionHandler:]", v66);
        if (v72) {
          v72[2](v72, 0);
        }
      }
    }
  }
}

void __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v5 = 0;
  [v2 save:&v5];
  id v3 = v5;
  id v4 = v3;
  if (v3) {
    NSLog(&cfstr_SaveError.isa, v3);
  }
  [*(id *)(a1 + 32) reset];
}

void __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  [v2 save:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    NSLog(&cfstr_SaveError.isa, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  if (*(void *)(a1 + 48) == *(void *)(a1 + 56)) {
    [*(id *)(a1 + 32) reset];
  }
}

void __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  [v2 save:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    NSLog(&cfstr_SaveError.isa, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  if (*(void *)(a1 + 48) == *(void *)(a1 + 56)) {
    [*(id *)(a1 + 32) reset];
  }
}

void __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke_4(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v6 = 0;
  id v3 = (id)[v2 executeRequest:v1 error:&v6];
  id v4 = v6;
  id v5 = v4;
  if (v4) {
    NSLog(&cfstr_SApDeleteError.isa, "-[TBCoreDataSource cacheFetchResponse:completionHandler:]_block_invoke_4", v4);
  }
}

void __57__TBCoreDataSource_cacheFetchResponse_completionHandler___block_invoke_5(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  [v2 save:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    NSLog(&cfstr_SaveError.isa, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  if (*(void *)(a1 + 48) == *(void *)(a1 + 56)) {
    [*(id *)(a1 + 32) reset];
  }
}

- (void)removeAllWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
  v7 = [(TBCoreDataSource *)self persistenceManager];
  id v8 = [v7 persistenceCoordinator];
  [v6 setPersistentStoreCoordinator:v8];

  NSLog(&cfstr_SRemovingAll.isa, "-[TBCoreDataSource removeAllWithCompletionHandler:]");
  +[TBNetworkMO removeAllNetworksInMOC:v6];
  +[TBTileMO removeAllTilesInMOC:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__TBCoreDataSource_removeAllWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E69BCE00;
  id v12 = v6;
  id v13 = v4;
  id v9 = v4;
  id v10 = v6;
  [v10 performBlockAndWait:v11];
}

void __51__TBCoreDataSource_removeAllWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = 0;
  [v2 save:&v6];
  id v3 = v6;
  id v4 = v3;
  if (v3) {
    NSLog(&cfstr_SaveError.isa, v3);
  }
  [*(id *)(a1 + 32) reset];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);
  }
}

- (void)prune3BarsNetworks:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = [(TBCoreDataStoreDescriptor *)self->_descriptor storeURL];
  id v8 = [v7 path];

  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v15 = 0;
  id v10 = [v9 attributesOfItemAtPath:v8 error:&v15];
  id v11 = v15;

  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    id v13 = [v10 objectForKey:*MEMORY[0x1E4F28390]];
    unint64_t v14 = [v13 longLongValue];
    if (v14 > a3)
    {
      NSLog(&cfstr_LocalStoreSize.isa, v14, a3);
      [(TBCoreDataSource *)self removeAllWithCompletionHandler:v6];
    }
  }
  else
  {
    NSLog(&cfstr_FailedToGetAtt.isa, v11);
  }
}

- (void)removeWithFetchRequest:(id)a3 completionHandler:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 descriptor];
  v7 = [v6 localFetchDescriptor];
  id v8 = [v7 fetchRequest];

  if (v8)
  {
    NSLog(&cfstr_SRemovingAllMa.isa, "-[TBCoreDataSource removeWithFetchRequest:completionHandler:]", v8);
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v8];
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
    id v11 = [(TBCoreDataSource *)self persistenceManager];
    BOOL v12 = [v11 persistenceCoordinator];
    [v10 setPersistentStoreCoordinator:v12];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__TBCoreDataSource_removeWithFetchRequest_completionHandler___block_invoke;
    v16[3] = &unk_1E69BCEC8;
    id v17 = v10;
    id v18 = v9;
    id v19 = v8;
    id v13 = v9;
    id v14 = v10;
    [v14 performBlockAndWait:v16];
  }
  else
  {
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21[0] = @"localFetchDescriptor is nil";
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v14 = +[TBError fetchMissingParametersErrorWithUserInfo:v15];

    id v13 = +[TBErrorFetchResponse responseWithError:v14];
    [v5 handleResponse:v13];
  }
}

void __61__TBCoreDataSource_removeWithFetchRequest_completionHandler___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D9440170]();
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v10 = 0;
  id v5 = (id)[v3 executeRequest:v4 error:&v10];
  id v6 = v10;
  v7 = v6;
  if (v6)
  {
    NSLog(&cfstr_SError.isa, "-[TBCoreDataSource removeWithFetchRequest:completionHandler:]_block_invoke", v6);
  }
  else
  {
    id v8 = [*(id *)(a1 + 48) entityName];
    id v9 = [*(id *)(a1 + 48) predicate];
    NSLog(&cfstr_SRemovedItemsT.isa, "-[TBCoreDataSource removeWithFetchRequest:completionHandler:]_block_invoke", v8, v9);
  }
}

- (void)_createNewNetwork:(id)a3 tile:(id)a4 withMOC:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v38 = a4;
  id v8 = a5;
  context = (void *)MEMORY[0x1D9440170]();
  uint64_t v40 = v8;
  id v9 = +[TBNetworkMO generateNewNetworkObjectFromMOC:v8];
  objc_msgSend(v9, "setAuthMask:", objc_msgSend(v7, "authMask"));
  id v10 = [v7 remoteIdentifier];
  [v9 setIdentifier:v10];

  id v11 = [v7 SSID];
  [v9 setName:v11];

  BOOL v12 = [v7 popularityScore];
  objc_msgSend(v9, "setPopularityScoreValue:", objc_msgSend(v12, "score"));

  id v13 = [v7 qualityScore];
  objc_msgSend(v9, "setQualityScoreValue:", objc_msgSend(v13, "score"));

  objc_msgSend(v9, "setMoving:", objc_msgSend(v7, "isMoving"));
  objc_msgSend(v9, "setSuspicious:", objc_msgSend(v7, "isSuspicious"));
  objc_msgSend(v9, "setCaptive:", objc_msgSend(v7, "isCaptive"));
  objc_msgSend(v9, "setPublic:", objc_msgSend(v7, "isPublic"));
  objc_msgSend(v9, "setLowQuality:", objc_msgSend(v7, "isLowQuality"));
  id v14 = [MEMORY[0x1E4F1C9C8] date];
  [v9 setCreated:v14];

  id v15 = [v7 ownerIdentifiers];
  [v9 setOwnerIdentifiers:v15];

  objc_msgSend(v9, "setType:", objc_msgSend(v7, "type"));
  objc_msgSend(v9, "setVenueGroup:", objc_msgSend(v7, "venueGroup"));
  objc_msgSend(v9, "setVenueType:", objc_msgSend(v7, "venueType"));
  v16 = objc_alloc_init(TBCentroidCalculator);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v39 = v7;
  id v17 = [v7 accessPoints];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v42 != v20) {
          objc_enumerationMutation(v17);
        }
        double v22 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v23 = (void *)MEMORY[0x1D9440170]();
        v24 = [v22 BSSID];

        if (v24)
        {
          uint64_t v25 = +[TBAccessPointMO generateNewAccessPointObjectFromMOC:v40];
          uint64_t v26 = [v22 BSSID];
          [v25 setBssid:v26];

          [v22 latitude];
          objc_msgSend(v25, "setLat:");
          [v22 longitude];
          objc_msgSend(v25, "setLng:");
          [v22 latitude];
          double v28 = v27;
          [v22 longitude];
          [(TBCentroidCalculator *)v16 addLatitude:v28 longitude:v29];
          id v30 = [v22 popularityScore];
          objc_msgSend(v25, "setPopularityScoreValue:", objc_msgSend(v30, "score"));

          uint64_t v31 = [v22 qualityScore];
          objc_msgSend(v25, "setQualityScoreValue:", objc_msgSend(v31, "score"));

          objc_msgSend(v25, "setEdge:", objc_msgSend(v22, "isEdge"));
          objc_msgSend(v25, "setTcpGood:", objc_msgSend(v22, "isTCPGood"));
          [v25 setNetwork:v9];
          objc_super v32 = [MEMORY[0x1E4F1C9C8] date];
          [v25 setCreated:v32];

          uint64_t v33 = [v9 accessPoints];
          id v34 = (id)[v33 setByAddingObject:v25];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v19);
  }

  [(TBCentroidCalculator *)v16 centroid];
  double v36 = v35;
  objc_msgSend(v9, "setCentroidLat:");
  [v9 setCentroidLng:v36];
  if (v38) {
    [v38 addNetworksObject:v9];
  }
}

- (void)importObjectsWithArray:(id)a3 completionHandler:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    id v8 = [(TBCoreDataSource *)self context];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__TBCoreDataSource_importObjectsWithArray_completionHandler___block_invoke;
    v12[3] = &unk_1E69BD678;
    id v13 = v6;
    id v14 = self;
    id v15 = v7;
    [v8 performBlock:v12];

    id v9 = v13;
  }
  else
  {
    id v10 = [TBError alloc];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17[0] = @"nil or empty objects to import";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v11 = [(TBError *)v10 initWithType:0 userInfo:v9];
    (*((void (**)(id, TBError *))v7 + 2))(v7, v11);
  }
}

void __61__TBCoreDataSource_importObjectsWithArray_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v8 = *(void **)(a1 + 40);
        id v9 = [v8 context];
        [v8 _createNewNetworkFromDictionary:v7 withMOC:v9];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }

  id v10 = [*(id *)(a1 + 40) context];
  id v11 = [v10 insertedObjects];
  NSLog(&cfstr_InsertedLuObje.isa, [v11 count]);

  BOOL v12 = [*(id *)(a1 + 40) context];
  id v14 = 0;
  [v12 save:&v14];
  id v13 = v14;

  if (v13) {
    NSLog(&cfstr_SFailedToSaveW.isa, "-[TBCoreDataSource importObjectsWithArray:completionHandler:]_block_invoke", v13);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_createNewNetworkFromDictionary:(id)a3 withMOC:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v60 = a4;
  id v6 = +[TBNetworkMO generateNewNetworkObjectFromMOC:](TBNetworkMO, "generateNewNetworkObjectFromMOC:");
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSince1970];
  [v6 setTimestamp:(uint64_t)v8];

  id v9 = [MEMORY[0x1E4F1C9C8] date];
  [v6 setCreated:v9];

  id v10 = [v5 objectForKeyedSubscript:@"authMask"];

  if (v10)
  {
    id v11 = [v5 objectForKeyedSubscript:@"authMask"];
    objc_msgSend(v6, "setAuthMask:", objc_msgSend(v11, "integerValue"));
  }
  BOOL v12 = [v5 objectForKeyedSubscript:@"identifier"];

  if (v12)
  {
    id v13 = [v5 objectForKeyedSubscript:@"identifier"];
    [v6 setIdentifier:v13];
  }
  id v14 = [v5 objectForKeyedSubscript:@"SSID"];

  if (v14)
  {
    long long v15 = [v5 objectForKeyedSubscript:@"SSID"];
    [v6 setName:v15];
  }
  long long v16 = [v5 objectForKeyedSubscript:@"popularityScoreValue"];

  if (v16)
  {
    long long v17 = [v5 objectForKeyedSubscript:@"popularityScoreValue"];
    objc_msgSend(v6, "setPopularityScoreValue:", objc_msgSend(v17, "intValue"));
  }
  long long v18 = [v5 objectForKeyedSubscript:@"qualityScoreValue"];

  if (v18)
  {
    uint64_t v19 = [v5 objectForKeyedSubscript:@"qualityScoreValue"];
    objc_msgSend(v6, "setQualityScoreValue:", objc_msgSend(v19, "intValue"));
  }
  uint64_t v20 = [v5 objectForKeyedSubscript:@"moving"];

  if (v20)
  {
    uint64_t v21 = [v5 objectForKeyedSubscript:@"moving"];
    objc_msgSend(v6, "setMoving:", objc_msgSend(v21, "BOOLValue"));
  }
  double v22 = [v5 objectForKeyedSubscript:@"suspicious"];

  if (v22)
  {
    id v23 = [v5 objectForKeyedSubscript:@"suspicious"];
    objc_msgSend(v6, "setSuspicious:", objc_msgSend(v23, "BOOLValue"));
  }
  v24 = [v5 objectForKeyedSubscript:@"captive"];

  if (v24)
  {
    uint64_t v25 = [v5 objectForKeyedSubscript:@"captive"];
    objc_msgSend(v6, "setCaptive:", objc_msgSend(v25, "BOOLValue"));
  }
  uint64_t v26 = [v5 objectForKeyedSubscript:@"public"];

  if (v26)
  {
    double v27 = [v5 objectForKeyedSubscript:@"public"];
    objc_msgSend(v6, "setPublic:", objc_msgSend(v27, "BOOLValue"));
  }
  double v28 = [v5 objectForKeyedSubscript:@"public"];

  if (v28)
  {
    double v29 = [v5 objectForKeyedSubscript:@"lowQuality"];
    objc_msgSend(v6, "setLowQuality:", objc_msgSend(v29, "BOOLValue"));
  }
  id v30 = [v5 objectForKeyedSubscript:@"ownerIdentifiers"];

  if (v30)
  {
    uint64_t v31 = [v5 objectForKeyedSubscript:@"ownerIdentifiers"];
    [v6 setOwnerIdentifiers:v31];
  }
  objc_super v32 = [v5 objectForKeyedSubscript:@"type"];

  if (v32)
  {
    uint64_t v33 = [v5 objectForKeyedSubscript:@"type"];
    objc_msgSend(v6, "setType:", objc_msgSend(v33, "integerValue"));
  }
  id v34 = [v5 objectForKeyedSubscript:@"venueGroup"];

  if (v34)
  {
    double v35 = [v5 objectForKeyedSubscript:@"venueGroup"];
    objc_msgSend(v6, "setVenueGroup:", objc_msgSend(v35, "integerValue"));
  }
  double v36 = [v5 objectForKeyedSubscript:@"venueType"];

  if (v36)
  {
    uint64_t v37 = [v5 objectForKeyedSubscript:@"venueType"];
    objc_msgSend(v6, "setVenueType:", objc_msgSend(v37, "intValue"));
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  objc_msgSend(v5, "objectForKeyedSubscript:", @"accessPoints", v5);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v38 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v59 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v62 != v59) {
          objc_enumerationMutation(obj);
        }
        long long v41 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        long long v42 = +[TBAccessPointMO generateNewAccessPointObjectFromMOC:v60];
        long long v43 = [v41 objectForKeyedSubscript:@"bssid"];
        [v42 setBssid:v43];

        long long v44 = [v41 objectForKeyedSubscript:@"latitude"];
        [v44 doubleValue];
        objc_msgSend(v42, "setLat:");

        uint64_t v45 = [v41 objectForKeyedSubscript:@"longitude"];
        [v45 doubleValue];
        objc_msgSend(v42, "setLng:");

        uint64_t v46 = [v41 objectForKeyedSubscript:@"popularityScoreValue"];

        if (v46)
        {
          v47 = [v41 objectForKeyedSubscript:@"popularityScoreValue"];
          objc_msgSend(v42, "setPopularityScoreValue:", objc_msgSend(v47, "intValue"));
        }
        v48 = [v41 objectForKeyedSubscript:@"qualityScoreValue"];

        if (v48)
        {
          v49 = [v41 objectForKeyedSubscript:@"qualityScoreValue"];
          objc_msgSend(v42, "setQualityScoreValue:", objc_msgSend(v49, "intValue"));
        }
        v50 = [v41 objectForKeyedSubscript:@"edge"];

        if (v50)
        {
          v51 = [v41 objectForKeyedSubscript:@"edge"];
          objc_msgSend(v42, "setEdge:", objc_msgSend(v51, "BOOLValue"));
        }
        v52 = [v41 objectForKeyedSubscript:@"tcpGood"];

        if (v52)
        {
          id v53 = [v41 objectForKeyedSubscript:@"tcpGood"];
          objc_msgSend(v42, "setTcpGood:", objc_msgSend(v53, "BOOLValue"));
        }
        [v42 setNetwork:v6];
        v54 = [MEMORY[0x1E4F1C9C8] date];
        [v42 setCreated:v54];

        uint64_t v55 = [v6 accessPoints];
        id v56 = (id)[v55 setByAddingObject:v42];
      }
      uint64_t v39 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
    }
    while (v39);
  }
}

- (unint64_t)cacheExpirationInDays
{
  return self->_cacheExpirationInDays;
}

- (void)setCacheExpirationInDays:(unint64_t)a3
{
  self->_cacheExpirationInDays = a3;
}

- (void)setContext:(id)a3
{
}

- (TBPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
}

- (TBCoreDataStoreDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (void)setHasStorageError:(BOOL)a3
{
  self->_hasStorageError = a3;
}

@end