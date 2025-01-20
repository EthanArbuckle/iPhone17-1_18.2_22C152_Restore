@interface MKSIMMigrator
+ (BOOL)isSupported;
- (MKSIMMigrator)init;
- (id)label:(id)a3;
- (unint64_t)activatedCellularPlansCount;
- (unint64_t)aggregatedActivatedCellularPlansCount;
- (void)_createLabelsForNumbersInUse:(id)a3;
- (void)coreTelephonyClientDidInvalidateCrossPlatformPlanTransfer:(id)a3;
- (void)coreTelephonyClientDidPrepareCrossPlatformPlanTransfer:(id)a3;
- (void)createLabelsForNumbersInUse:(id)a3;
- (void)determineAggregatedCellularPlans:(id)a3;
- (void)import:(id)a3;
- (void)importDataEncodedInJSON:(id)a3;
- (void)init;
- (void)remove;
- (void)setActivatedCellularPlansCount:(unint64_t)a3;
- (void)setAggregatedActivatedCellularPlansCount:(unint64_t)a3;
@end

@implementation MKSIMMigrator

- (MKSIMMigrator)init
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v43.receiver = self;
  v43.super_class = (Class)MKSIMMigrator;
  v2 = [(MKMigrator *)&v43 init];
  v3 = v2;
  if (v2)
  {
    [(MKMigrator *)v2 setType:16];
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.migrationkit.migrator.sim", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x263F02D30]) initWithQueue:v3->_queue];
    client = v3->_client;
    v3->_client = (CoreTelephonyClient *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    labels = v3->_labels;
    v3->_labels = v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    existingLabels = v3->_existingLabels;
    v3->_existingLabels = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    existingNumbers = v3->_existingNumbers;
    v3->_existingNumbers = v12;

    v14 = v3->_client;
    id v42 = 0;
    v15 = [(CoreTelephonyClient *)v14 getSubscriptionInfoWithError:&v42];
    id v16 = v42;
    if (v16)
    {
      v17 = +[MKLog log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        [(MKSIMMigrator *)(uint64_t)v16 init];
      }
    }
    else
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v33 = v15;
      v18 = [v15 subscriptions];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v45 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v39 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            v24 = [v23 labelID];
            v25 = [v23 phoneNumber];
            if ([v24 length])
            {
              [(NSMutableSet *)v3->_existingLabels addObject:v24];
              if ([v25 length])
              {
                v26 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v24];
                [(NSMutableDictionary *)v3->_labels setObject:v26 forKey:v25];
              }
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v38 objects:v45 count:16];
        }
        while (v20);
      }

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v15 = v33;
      v17 = [v33 subscriptionsInUse];
      uint64_t v27 = [v17 countByEnumeratingWithState:&v34 objects:v44 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v35;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v35 != v29) {
              objc_enumerationMutation(v17);
            }
            v31 = [*(id *)(*((void *)&v34 + 1) + 8 * j) phoneNumber];
            if ([v31 length]) {
              [(NSMutableSet *)v3->_existingNumbers addObject:v31];
            }
          }
          uint64_t v28 = [v17 countByEnumeratingWithState:&v34 objects:v44 count:16];
        }
        while (v28);
      }
      id v16 = 0;
    }
  }
  return v3;
}

- (void)importDataEncodedInJSON:(id)a3
{
  id v7 = a3;
  dispatch_queue_t v4 = self;
  uint64_t v5 = objc_sync_enter(v4);
  uint64_t v6 = (void *)MEMORY[0x230F5C060](v5);
  [(MKSIMMigrator *)v4 import:v7];
  objc_sync_exit(v4);
}

- (void)import:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[MKSIM alloc] initWithData:v4];
  if (v5)
  {
    uint64_t v6 = [(MKMigrator *)self delegate];
    [v6 migratorWillExecuteOperation:self];

    objc_initWeak(&location, self);
    id v7 = objc_alloc(MEMORY[0x263F02C48]);
    v8 = [(MKSIM *)v5 number];
    v9 = [(MKSIM *)v5 carrier];
    v10 = [(MKSIM *)v5 mccmnc];
    v11 = [(MKSIM *)v5 gid1];
    v12 = [(MKSIM *)v5 carrierID];
    v13 = (void *)[v7 initWithPhoneNumber:v8 carrierName:v9 mccMnc:v10 gid1:v11 gid2:&stru_26DF6A8B0 carrierID:v12];

    client = self->_client;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __24__MKSIMMigrator_import___block_invoke;
    v16[3] = &unk_2649062F8;
    objc_copyWeak(&v17, &location);
    [(CoreTelephonyClient *)client prepareCrossPlatformPlanTransfer:v13 completion:v16];
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
  }
  else
  {
    v15 = [MEMORY[0x263F087E8] errorWithDomain:@"MKSIMImportError" code:1 userInfo:0];
    [(MKMigrator *)self migratorDidFailWithImportError:v15];
  }
}

void __24__MKSIMMigrator_import___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained coreTelephonyClientDidPrepareCrossPlatformPlanTransfer:v3];
}

- (void)coreTelephonyClientDidPrepareCrossPlatformPlanTransfer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[MKLog log];
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[MKSIMMigrator coreTelephonyClientDidPrepareCrossPlatformPlanTransfer:](v4, v6);
    }

    [(MKMigrator *)self migratorDidFailWithImportError:v4];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_22BFAC000, v6, OS_LOG_TYPE_INFO, "sim is transferred to CoreTelephony", v8, 2u);
    }

    [(MKMigrator *)self migratorDidImport];
  }
  id v7 = [(MKMigrator *)self delegate];
  [v7 migratorDidExecuteOperation:self];
}

- (void)remove
{
  id v3 = +[MKLog log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_22BFAC000, v3, OS_LOG_TYPE_INFO, "will invalidate cached sim metadata.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  client = self->_client;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __23__MKSIMMigrator_remove__block_invoke;
  v5[3] = &unk_2649062F8;
  objc_copyWeak(&v6, buf);
  [(CoreTelephonyClient *)client invalidateCrossPlatformPlanTransfer:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __23__MKSIMMigrator_remove__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained coreTelephonyClientDidInvalidateCrossPlatformPlanTransfer:v3];
}

- (void)coreTelephonyClientDidInvalidateCrossPlatformPlanTransfer:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[MKLog log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 description];
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_22BFAC000, v5, OS_LOG_TYPE_INFO, "did invalidate cached sim metadata. error=%@", (uint8_t *)&v7, 0xCu);
  }
  [(MKMigrator *)self migratorDidResetImport];
}

- (id)label:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_labels;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)self->_labels objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)createLabelsForNumbersInUse:(id)a3
{
  id v5 = a3;
  id v4 = self->_labels;
  objc_sync_enter(v4);
  [(MKSIMMigrator *)self determineAggregatedCellularPlans:v5];
  [(MKSIMMigrator *)self _createLabelsForNumbersInUse:v5];
  objc_sync_exit(v4);
}

- (void)setActivatedCellularPlansCount:(unint64_t)a3
{
  self->_activatedCellularPlansCount = a3;
  self->_aggregatedActivatedCellularPlansCount = a3;
}

- (void)determineAggregatedCellularPlans:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_existingNumbers;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v15 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 += objc_msgSend(v4, "containsObject:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v15 objects:v27 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  self->_unint64_t aggregatedActivatedCellularPlansCount = self->_activatedCellularPlansCount + v8;
  v11 = +[MKLog log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    unint64_t aggregatedActivatedCellularPlansCount = self->_aggregatedActivatedCellularPlansCount;
    unint64_t activatedCellularPlansCount = self->_activatedCellularPlansCount;
    uint64_t v14 = [(NSMutableSet *)self->_existingNumbers count];
    *(_DWORD *)buf = 134218752;
    unint64_t v20 = aggregatedActivatedCellularPlansCount;
    __int16 v21 = 2048;
    unint64_t v22 = activatedCellularPlansCount;
    __int16 v23 = 2048;
    uint64_t v24 = v14;
    __int16 v25 = 2048;
    uint64_t v26 = v8;
    _os_log_impl(&dword_22BFAC000, v11, OS_LOG_TYPE_INFO, "did determine aggregated cellular plans. aggregated=%ld, android=%ld, ios=%ld, ios_in_use=%ld", buf, 0x2Au);
  }

  if (self->_aggregatedActivatedCellularPlansCount <= 1) {
    [(NSMutableDictionary *)self->_labels removeAllObjects];
  }
}

- (void)_createLabelsForNumbersInUse:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_aggregatedActivatedCellularPlansCount >= 2
    && (unint64_t)[(NSMutableDictionary *)self->_labels count] <= 7)
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v23 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v45 objects:v52 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v46 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = (void *)[objc_alloc(MEMORY[0x263F02C38]) initWithPhoneNumber:*(void *)(*((void *)&v45 + 1) + 8 * i) labelName:0];
          [v5 addObject:v10];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v45 objects:v52 count:16];
      }
      while (v7);
    }

    uint64_t v39 = 0;
    long long v40 = &v39;
    uint64_t v41 = 0x3032000000;
    id v42 = __Block_byref_object_copy__3;
    objc_super v43 = __Block_byref_object_dispose__3;
    id v44 = 0;
    uint64_t v33 = 0;
    long long v34 = &v33;
    uint64_t v35 = 0x3032000000;
    long long v36 = __Block_byref_object_copy__3;
    long long v37 = __Block_byref_object_dispose__3;
    id v38 = 0;
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    client = self->_client;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __46__MKSIMMigrator__createLabelsForNumbersInUse___block_invoke;
    v29[3] = &unk_264906320;
    v31 = &v39;
    v32 = &v33;
    dispatch_semaphore_t dsema = v11;
    dispatch_semaphore_t v30 = dsema;
    [(CoreTelephonyClient *)client prepareCrossPlatformCellularPlanLabel:v5 completion:v29];
    if (!v40[5] && !v34[5]) {
      dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
    }
    v13 = +[MKLog log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = v34[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v51 = v14;
      _os_log_impl(&dword_22BFAC000, v13, OS_LOG_TYPE_INFO, "did create sim labels. error=%@", buf, 0xCu);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v15 = [(id)v40[5] subscriptions];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v49 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = *(void **)(*((void *)&v25 + 1) + 8 * j);
          unint64_t v20 = [v19 labelID];
          __int16 v21 = [v19 phoneNumber];
          if ([v20 length])
          {
            if (([(NSMutableSet *)self->_existingLabels containsObject:v20] & 1) == 0)
            {
              [(NSMutableSet *)self->_existingLabels addObject:v20];
              if ([v21 length])
              {
                unint64_t v22 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v20];
                [(NSMutableDictionary *)self->_labels setObject:v22 forKey:v21];
              }
            }
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v49 count:16];
      }
      while (v16);
    }

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v39, 8);

    id v4 = v23;
  }
}

void __46__MKSIMMigrator__createLabelsForNumbersInUse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)isSupported
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(MKDevice);
  if ([(MKDevice *)v2 type] == 1 || [(MKDevice *)v2 type] == 2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.migrationkit.migrator.sim.config", 0);
    id v4 = (void *)[objc_alloc(MEMORY[0x263F02D30]) initWithQueue:v3];
    id v11 = 0;
    id v5 = [v4 isEmbeddedSIMOnlyConfig:&v11];
    id v6 = v11;
    int v7 = [v5 BOOLValue];

    if (v6) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = v7;
    }
    uint64_t v9 = +[MKLog log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      BOOL v13 = v8;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_22BFAC000, v9, OS_LOG_TYPE_INFO, "did determine whether eSIM is supported or not. is_supported=%d, error=%@", buf, 0x12u);
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (unint64_t)activatedCellularPlansCount
{
  return self->_activatedCellularPlansCount;
}

- (unint64_t)aggregatedActivatedCellularPlansCount
{
  return self->_aggregatedActivatedCellularPlansCount;
}

- (void)setAggregatedActivatedCellularPlansCount:(unint64_t)a3
{
  self->_unint64_t aggregatedActivatedCellularPlansCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingNumbers, 0);
  objc_storeStrong((id *)&self->_existingLabels, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)init
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22BFAC000, a2, OS_LOG_TYPE_ERROR, "could not get subscription info. error=%@", (uint8_t *)&v2, 0xCu);
}

- (void)coreTelephonyClientDidPrepareCrossPlatformPlanTransfer:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_22BFAC000, a2, OS_LOG_TYPE_ERROR, "CoreTelephony could not prepare cross platform plan transfer. error=%@", (uint8_t *)&v4, 0xCu);
}

@end