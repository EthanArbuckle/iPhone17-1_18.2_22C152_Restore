@interface PXIDSAddressQueryController
- (PXIDSAddressQueryController)init;
- (void)_callResultsHandlerForQueries:(id)a3;
- (void)_idStatusUpdatedForDestinations:(id)a3 service:(id)a4;
- (void)_performBatchQueryForAddresses:(id)a3 resultHandler:(id)a4;
- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6;
- (void)dealloc;
- (void)performBatchQueryForAddresses:(id)a3 resultHandler:(id)a4;
@end

@implementation PXIDSAddressQueryController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsBatchIDQueryController, 0);
  objc_storeStrong((id *)&self->_queryStateForAddress, 0);
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)_callResultsHandlerForQueries:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "popStashedResults", (void)v12);
        if ([v10 count])
        {
          v11 = [v9 resultHandler];
          ((void (**)(void, void *, void))v11)[2](v11, v10, 0);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)_idStatusUpdatedForDestinations:(id)a3 service:(id)a4
{
  id v7 = a3;
  serialQueue = self->_serialQueue;
  id v9 = a4;
  dispatch_assert_queue_V2(serialQueue);
  LODWORD(serialQueue) = [v9 isEqualToString:*MEMORY[0x1E4F6AA78]];

  if (serialQueue)
  {
    if (![(NSMutableArray *)self->_queries count])
    {
      long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"PXIDSAddressQueryController.m", 200, @"Invalid parameter not satisfying: %@", @"_queries.count > 0" object file lineNumber description];
    }
    v10 = (void *)[(NSMutableArray *)self->_queries copy];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __71__PXIDSAddressQueryController__idStatusUpdatedForDestinations_service___block_invoke;
    v18[3] = &unk_1E5DB75D0;
    id v11 = v10;
    id v19 = v11;
    v20 = self;
    [v7 enumerateKeysAndObjectsUsingBlock:v18];
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__PXIDSAddressQueryController__idStatusUpdatedForDestinations_service___block_invoke_69;
    block[3] = &unk_1E5DD20C8;
    objc_copyWeak(&v16, &location);
    id v15 = v11;
    id v12 = v11;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __71__PXIDSAddressQueryController__idStatusUpdatedForDestinations_service___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v19 = a3;
  uint64_t v6 = PLUIGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v5;
    __int16 v27 = 2112;
    id v28 = v19;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, "IDS status update for %@: %@", buf, 0x16u);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (([v12 isComplete] & 1) == 0)
        {
          long long v13 = [v12 remainingDestinations];
          if ([v13 containsObject:v5])
          {
            uint64_t v14 = [v19 integerValue];
            uint64_t v15 = 2;
            if (v14 != 1) {
              uint64_t v15 = 0;
            }
            if (v14 == 2) {
              uint64_t v16 = 3;
            }
            else {
              uint64_t v16 = v15;
            }
            BOOL v17 = v14 != 2 && v14 == 1;
            v18 = [NSNumber numberWithInteger:v16];
            [*(id *)(*(void *)(a1 + 40) + 24) setObject:v18 forKeyedSubscript:v5];

            [v12 stashDestination:v5 withResult:v17];
            if ([v12 isComplete]) {
              [*(id *)(*(void *)(a1 + 40) + 16) removeObject:v12];
            }
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
}

void __71__PXIDSAddressQueryController__idStatusUpdatedForDestinations_service___block_invoke_69(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _callResultsHandlerForQueries:*(void *)(a1 + 32)];
}

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a6;
  if (v10)
  {
    id v11 = PLUIGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412546;
      id v13 = v9;
      __int16 v14 = 2112;
      id v15 = v10;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "Error updating IDS destinations %@ : %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    [(PXIDSAddressQueryController *)self _idStatusUpdatedForDestinations:v9 service:a5];
  }
}

- (void)_performBatchQueryForAddresses:(id)a3 resultHandler:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v36 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v37 = [MEMORY[0x1E4F1CA60] dictionary];
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v47 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        id v13 = [(NSMutableDictionary *)self->_queryStateForAddress objectForKeyedSubscript:v12];
        __int16 v14 = v13;
        if (!v13) {
          goto LABEL_10;
        }
        uint64_t v15 = [v13 integerValue];
        if ((v15 & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          uint64_t v16 = [NSNumber numberWithBool:v15 == 2];
          [v37 setObject:v16 forKeyedSubscript:v12];

          goto LABEL_12;
        }
        if (!v15) {
LABEL_10:
        }
          [(NSMutableDictionary *)self->_queryStateForAddress setObject:&unk_1F02D72A0 forKeyedSubscript:v12];
        [v7 addObject:v12];
LABEL_12:
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
    }
    while (v9);
  }

  BOOL v17 = v37;
  v18 = v36;
  if ([v37 count])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__PXIDSAddressQueryController__performBatchQueryForAddresses_resultHandler___block_invoke;
    block[3] = &unk_1E5DD3280;
    id v45 = v36;
    id v44 = v37;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  if ([v7 count])
  {
    id v19 = [[PXIDSAddressQuery alloc] initWithDestinations:v7 resultHandler:v36];
    [(NSMutableArray *)self->_queries addObject:v19];
    if (![(NSMutableArray *)self->_queries count]) {
      goto LABEL_29;
    }
    long long v20 = [MEMORY[0x1E4F1CA80] setWithArray:v7];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v21 = self->_queries;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v39 objects:v52 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(v21);
          }
          id v26 = *(void **)(*((void *)&v39 + 1) + 8 * j);
          if ([v26 isComplete])
          {
            id v28 = [MEMORY[0x1E4F28B00] currentHandler];
            [v28 handleFailureInMethod:a2, self, @"PXIDSAddressQueryController.m", 168, @"Invalid parameter not satisfying: %@", @"!query.isComplete" object file lineNumber description];
          }
          __int16 v27 = [v26 remainingDestinations];
          [v20 unionSet:v27];
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v39 objects:v52 count:16];
      }
      while (v23);
    }

    v18 = v36;
    BOOL v17 = v37;
    if (v20)
    {
      id v29 = [v20 allObjects];
    }
    else
    {
LABEL_29:
      id v29 = v7;
    }
    v30 = PLUIGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v51 = v29;
      _os_log_impl(&dword_1A9AE7000, v30, OS_LOG_TYPE_DEBUG, "Querying status for phone numbers/email addresses: %@", buf, 0xCu);
    }

    idsBatchIDQueryController = self->_idsBatchIDQueryController;
    if (!idsBatchIDQueryController)
    {
      id v32 = objc_alloc(MEMORY[0x1E4F6AAD8]);
      v33 = (IDSBatchIDQueryController *)[v32 initWithService:*MEMORY[0x1E4F6AA78] delegate:self queue:self->_serialQueue];
      v34 = self->_idsBatchIDQueryController;
      self->_idsBatchIDQueryController = v33;

      idsBatchIDQueryController = self->_idsBatchIDQueryController;
    }
    [(IDSBatchIDQueryController *)idsBatchIDQueryController setDestinations:v29];
  }
}

uint64_t __76__PXIDSAddressQueryController__performBatchQueryForAddresses_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)performBatchQueryForAddresses:(id)a3 resultHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXIDSAddressQueryController.m", 123, @"Invalid parameter not satisfying: %@", @"addresses" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    __int16 v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXIDSAddressQueryController.m", 124, @"Invalid parameter not satisfying: %@", @"resultHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PXIDSAddressQueryController_performBatchQueryForAddresses_resultHandler___block_invoke;
  block[3] = &unk_1E5DCE4D0;
  objc_copyWeak(&v18, &location);
  id v16 = v7;
  id v17 = v9;
  id v11 = v9;
  id v12 = v7;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __75__PXIDSAddressQueryController_performBatchQueryForAddresses_resultHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _performBatchQueryForAddresses:*(void *)(a1 + 32) resultHandler:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  [(IDSBatchIDQueryController *)self->_idsBatchIDQueryController invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PXIDSAddressQueryController;
  [(PXIDSAddressQueryController *)&v3 dealloc];
}

- (PXIDSAddressQueryController)init
{
  v12.receiver = self;
  v12.super_class = (Class)PXIDSAddressQueryController;
  v2 = [(PXIDSAddressQueryController *)&v12 init];
  if (v2)
  {
    objc_super v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    queryStateForAddress = v2->_queryStateForAddress;
    v2->_queryStateForAddress = v3;

    id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    queries = v2->_queries;
    v2->_queries = v5;

    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.photos.PXIDSAddressQueryController", v8);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

@end