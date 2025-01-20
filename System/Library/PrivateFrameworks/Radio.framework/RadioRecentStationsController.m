@interface RadioRecentStationsController
- (NSArray)stationGroups;
- (NSArray)stations;
- (RadioRecentStationsController)init;
- (id)_newRecentStationsRequest;
- (void)_createStationGroups;
- (void)_handleRecentStationsResponse:(id)a3 fromRequest:(id)a4 pendingRecentStations:(id)a5 isInitialCacheLoad:(BOOL)a6;
- (void)_insertPendingRecentStation:(id)a3;
- (void)_postStationsDidChangeNotification;
- (void)insertPendingRecentStation:(id)a3;
- (void)insertPendingRecentStationDictionary:(id)a3;
- (void)refreshWithCompletionHandler:(id)a3;
- (void)removePendingRecentStation:(id)a3;
@end

@implementation RadioRecentStationsController

- (id)_newRecentStationsRequest
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__735;
  v11 = __Block_byref_object_dispose__736;
  id v12 = 0;
  accessQueue = self->_accessQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__RadioRecentStationsController__newRecentStationsRequest__block_invoke;
  v6[3] = &unk_2643AA670;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(accessQueue, v6);
  v3 = [RadioRecentStationsRequest alloc];
  v4 = [(RadioRecentStationsRequest *)v3 initWithCurrentStation:v8[5]];
  [(RadioRecentStationsRequest *)v4 setShouldGroupResponses:1];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (RadioRecentStationsController)init
{
  v11.receiver = self;
  v11.super_class = (Class)RadioRecentStationsController;
  v2 = [(RadioRecentStationsController *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Radio.RadioRecentStationsController.accessQueue", MEMORY[0x263EF83A8]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v2->_hasValidStationGroups = 1;
    id v5 = [(RadioRecentStationsController *)v2 _newRecentStationsRequest];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __37__RadioRecentStationsController_init__block_invoke;
    v8[3] = &unk_2643AA198;
    uint64_t v9 = v2;
    id v10 = v5;
    id v6 = v5;
    [v6 getCachedRecentStationsResponseWithCompletionHandler:v8];
  }
  return v2;
}

uint64_t __37__RadioRecentStationsController_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleRecentStationsResponse:a2 fromRequest:*(void *)(a1 + 40) pendingRecentStations:0 isInitialCacheLoad:1];
}

- (void)_handleRecentStationsResponse:(id)a3 fromRequest:(id)a4 pendingRecentStations:(id)a5 isInitialCacheLoad:(BOOL)a6
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (v10)
  {
    v29 = self;
    v30 = v12;
    [v10 stationGroups];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v33 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    id v31 = v11;
    v14 = 0;
    v15 = 0;
    if (v33)
    {
      uint64_t v32 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v46 != v32) {
            objc_enumerationMutation(obj);
          }
          v35 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          v36 = v14;
          v17 = [v35 stationDictionaries];
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v49 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            v20 = 0;
            uint64_t v21 = *(void *)v42;
            do
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v42 != v21) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v23 = *(void *)(*((void *)&v41 + 1) + 8 * j);
                if (!v15)
                {
                  v15 = +[RadioModel backgroundModel];
                }
                v24 = (void *)[v15 newStationWithDictionary:v23];
                if (v24)
                {
                  if (!v20) {
                    v20 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v17, "count"));
                  }
                  [v20 addObject:v24];
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v49 count:16];
            }
            while (v19);
          }
          else
          {
            v20 = 0;
          }
          v14 = v36;
          if (!v36) {
            v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(obj, "count"));
          }
          v25 = objc_alloc_init(RadioMutableRecentStationsGroup);
          -[RadioMutableRecentStationsGroup setActive:](v25, "setActive:", [v35 isActive]);
          v26 = [v35 localizedTitle];
          [(RadioMutableRecentStationsGroup *)v25 setLocalizedTitle:v26];

          [(RadioMutableRecentStationsGroup *)v25 setStations:v20];
          if (v25)
          {
            if (!v14) {
              v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(obj, "count"));
            }
            [v14 addObject:v25];
          }
        }
        uint64_t v33 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v33);
    }
    accessQueue = v29->_accessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __116__RadioRecentStationsController__handleRecentStationsResponse_fromRequest_pendingRecentStations_isInitialCacheLoad___block_invoke;
    block[3] = &unk_2643AA260;
    block[4] = v29;
    BOOL v40 = a6;
    v13 = v30;
    id v38 = v30;
    id v39 = v14;
    id v28 = v14;
    dispatch_barrier_async(accessQueue, block);

    id v11 = v31;
  }
}

uint64_t __58__RadioRecentStationsController__newRecentStationsRequest__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) firstObject];
  return MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationGroups, 0);
  objc_storeStrong((id *)&self->_serverRecentStationGroups, 0);
  objc_storeStrong((id *)&self->_pendingRecentStations, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)_postStationsDidChangeNotification
{
  dispatch_queue_t v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__RadioRecentStationsController__postStationsDidChangeNotification__block_invoke;
  block[3] = &unk_2643AA648;
  block[4] = self;
  dispatch_async(v3, block);
}

void __67__RadioRecentStationsController__postStationsDidChangeNotification__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"RadioRecentStationsControllerStationsDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_insertPendingRecentStation:(id)a3
{
  id v8 = a3;
  char v4 = -[NSMutableArray containsObject:](self->_pendingRecentStations, "containsObject:");
  pendingRecentStations = self->_pendingRecentStations;
  if (!pendingRecentStations)
  {
    id v6 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
    uint64_t v7 = self->_pendingRecentStations;
    self->_pendingRecentStations = v6;

    pendingRecentStations = self->_pendingRecentStations;
  }
  [(NSMutableArray *)pendingRecentStations insertObject:v8 atIndex:0];
  if ((v4 & 1) == 0)
  {
    self->_hasValidStationGroups = 0;
    [(RadioRecentStationsController *)self _postStationsDidChangeNotification];
  }
}

id *__116__RadioRecentStationsController__handleRecentStationsResponse_fromRequest_pendingRecentStations_isInitialCacheLoad___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 16) && !*(unsigned char *)(a1 + 56))
  {
    *(unsigned char *)(v2 + 16) = 1;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(void *)(v2 + 24))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      char v6 = 0;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "indexOfObject:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
          if (v9 != 0x7FFFFFFFFFFFFFFFLL)
          {
            [*(id *)(*(void *)(a1 + 32) + 24) removeObjectAtIndex:v9];
            char v6 = 1;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v5);
    }
    else
    {
      char v6 = 0;
    }

    uint64_t v13 = *(void *)(a1 + 32);
    result = (id *)(v13 + 32);
    id v12 = *(void **)(a1 + 48);
    if (*(void **)(v13 + 32) != v12) {
      goto LABEL_19;
    }
    if (v6) {
      goto LABEL_20;
    }
  }
  else
  {
    id v11 = *(void **)(v2 + 32);
    result = (id *)(v2 + 32);
    id v12 = *(void **)(a1 + 48);
    if (v11 != v12)
    {
LABEL_19:
      objc_storeStrong(result, v12);
      uint64_t v13 = *(void *)(a1 + 32);
LABEL_20:
      *(unsigned char *)(v13 + 17) = 0;
      return (id *)objc_msgSend(*(id *)(a1 + 32), "_postStationsDidChangeNotification", (void)v14);
    }
  }
  return result;
}

- (void)_createStationGroups
{
  if ([(NSMutableArray *)self->_pendingRecentStations count]) {
    id v3 = (void *)[objc_alloc(MEMORY[0x263EFF9D8]) initWithArray:self->_pendingRecentStations];
  }
  else {
    id v3 = 0;
  }
  uint64_t v4 = [v3 array];
  uint64_t v5 = (void *)[v4 mutableCopy];

  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__735;
  v30 = __Block_byref_object_dispose__736;
  id v31 = 0;
  if (-[NSArray count](self->_serverRecentStationGroups, "count") || ![v3 count])
  {
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x2020000000;
    uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
    serverRecentStationGroups = self->_serverRecentStationGroups;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __53__RadioRecentStationsController__createStationGroups__block_invoke;
    v17[3] = &unk_2643AA238;
    v20 = &v22;
    id v7 = v5;
    uint64_t v21 = &v26;
    id v18 = v7;
    uint64_t v19 = self;
    [(NSArray *)serverRecentStationGroups enumerateObjectsUsingBlock:v17];
    if (v23[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([(id)v27[5] count])
      {
        v23[3] = 0;
      }
      else if (v23[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_20:

        _Block_object_dispose(&v22, 8);
        goto LABEL_21;
      }
    }
    if ([v7 count])
    {
      id v11 = [(id)v27[5] objectAtIndex:v23[3]];
      id v12 = v11;
      if (v11)
      {
        uint64_t v13 = (void *)[v11 mutableCopy];
        long long v14 = [v13 stations];
        if ([v14 count])
        {
          id v15 = [v7 arrayByAddingObjectsFromArray:v14];
        }
        else
        {
          id v15 = v7;
        }
        long long v16 = v15;
        [v13 setStations:v15];
        [(id)v27[5] replaceObjectAtIndex:v23[3] withObject:v13];
      }
    }
    goto LABEL_20;
  }
  id v8 = objc_alloc_init(RadioMutableRecentStationsGroup);
  [(RadioMutableRecentStationsGroup *)v8 setStations:v5];
  if (v8)
  {
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v8, 0);
    id v10 = (void *)v27[5];
    v27[5] = v9;
  }
LABEL_21:
  objc_storeStrong((id *)&self->_stationGroups, (id)v27[5]);
  _Block_object_dispose(&v26, 8);
}

void __53__RadioRecentStationsController__createStationGroups__block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  char v6 = v5;
  id v16 = v5;
  if (*(void *)(*(void *)(a1[6] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v7 = [v5 isActive];
    char v6 = v16;
    if (v7) {
      *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
    }
  }
  id v8 = [v6 stations];
  if ([v8 count])
  {
    uint64_t v9 = (void *)[v8 mutableCopy];
    [v9 removeObjectsInArray:a1[4]];
    if (v8 != v9 && ([v8 isEqualToArray:v9] & 1) == 0)
    {
      id v10 = (void *)[v16 mutableCopy];
      [v10 setStations:v9];

      id v16 = v10;
    }
  }
  id v11 = *(void **)(*(void *)(a1[7] + 8) + 40);
  id v12 = v16;
  if (!v11)
  {
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(a1[5] + 32), "count"));
    uint64_t v14 = *(void *)(a1[7] + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    id v12 = v16;
    id v11 = *(void **)(*(void *)(a1[7] + 8) + 40);
  }
  id v17 = v12;
  [v11 addObject:v12];
}

- (void)removePendingRecentStation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__RadioRecentStationsController_removePendingRecentStation___block_invoke;
    v7[3] = &unk_2643AA1C0;
    v7[4] = self;
    id v8 = v4;
    dispatch_barrier_async(accessQueue, v7);
  }
}

void __60__RadioRecentStationsController_removePendingRecentStation___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v1)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __60__RadioRecentStationsController_removePendingRecentStation___block_invoke_2;
    v6[3] = &unk_2643AA210;
    id v7 = *(id *)(a1 + 40);
    uint64_t v3 = [v1 indexOfObjectWithOptions:2 passingTest:v6];
    if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [*(id *)(*(void *)(a1 + 32) + 24) removeObjectAtIndex:v3];
      if (![*(id *)(*(void *)(a1 + 32) + 24) count])
      {
        uint64_t v4 = *(void *)(a1 + 32);
        id v5 = *(void **)(v4 + 24);
        *(void *)(v4 + 24) = 0;
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 17) = 0;
    }
  }
}

uint64_t __60__RadioRecentStationsController_removePendingRecentStation___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

- (void)refreshWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(NSMutableArray *)self->_pendingRecentStations copy];
  id v6 = [(RadioRecentStationsController *)self _newRecentStationsRequest];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__RadioRecentStationsController_refreshWithCompletionHandler___block_invoke;
  v10[3] = &unk_2643AA1E8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v5;
  id v13 = v4;
  id v7 = v4;
  id v8 = v5;
  id v9 = v6;
  [v9 startWithCompletionHandler:v10];
}

void __62__RadioRecentStationsController_refreshWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (!v5) {
    [*(id *)(a1 + 32) _handleRecentStationsResponse:v7 fromRequest:*(void *)(a1 + 40) pendingRecentStations:*(void *)(a1 + 48) isInitialCacheLoad:0];
  }
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }
}

- (void)insertPendingRecentStationDictionary:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __70__RadioRecentStationsController_insertPendingRecentStationDictionary___block_invoke;
    v7[3] = &unk_2643AA1C0;
    id v8 = v4;
    id v9 = self;
    dispatch_barrier_async(accessQueue, v7);
  }
}

void __70__RadioRecentStationsController_insertPendingRecentStationDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[RadioModel backgroundModel];
  id v4 = (id)[v2 newStationWithDictionary:*(void *)(a1 + 32)];

  uint64_t v3 = v4;
  if (v4)
  {
    [*(id *)(a1 + 40) _insertPendingRecentStation:v4];
    uint64_t v3 = v4;
  }
}

- (void)insertPendingRecentStation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__RadioRecentStationsController_insertPendingRecentStation___block_invoke;
    v7[3] = &unk_2643AA1C0;
    void v7[4] = self;
    id v8 = v4;
    dispatch_barrier_async(accessQueue, v7);
  }
}

uint64_t __60__RadioRecentStationsController_insertPendingRecentStation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _insertPendingRecentStation:*(void *)(a1 + 40)];
}

- (NSArray)stations
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(RadioRecentStationsController *)self stationGroups];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) stations];
        if ([v8 count])
        {
          if (!v5) {
            id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v8, "count"));
          }
          [v5 addObjectsFromArray:v8];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return (NSArray *)v5;
}

- (NSArray)stationGroups
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__735;
  long long v10 = __Block_byref_object_dispose__736;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__RadioRecentStationsController_stationGroups__block_invoke;
  v5[3] = &unk_2643AA670;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_barrier_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __46__RadioRecentStationsController_stationGroups__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 17))
  {
    *(unsigned char *)(v2 + 17) = 1;
    [*(id *)(a1 + 32) _createStationGroups];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  id v3 = *(void **)(v2 + 40);
  uint64_t v4 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v4, v3);
}

@end