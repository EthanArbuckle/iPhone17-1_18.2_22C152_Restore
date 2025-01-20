@interface HVQueues
+ (id)defaultQueues;
- (BOOL)cleanupWithError:(id *)a3 shouldContinueBlock:(id)a4;
- (BOOL)deleteContentWithRequest:(id)a3 error:(id *)a4;
- (BOOL)dequeueContent:(id *)a3 contentProtection:(id *)a4 dataSource:(unsigned int)a5 dataSourceContentState:(id)a6 minimumLevelOfService:(unsigned __int8)a7 inMemoryItemsOnly:(BOOL)a8 error:(id *)a9;
- (BOOL)dequeuedContentConsumedForDataSources:(unsigned int)a3 withError:(id *)a4;
- (BOOL)dequeuedContentConsumedWithError:(id *)a3;
- (BOOL)dequeuedContentNotConsumed:(id)a3 dataSource:(unsigned int)a4 error:(id *)a5;
- (BOOL)enqueueContent:(id)a3 contentProtection:(id)a4 error:(id *)a5;
- (BOOL)registerQueueObserver:(id)a3 dispatchQueue:(id)a4;
- (HVQueues)init;
- (id)statsWithError:(id *)a3;
- (unsigned)waitForObserversWithTimeout:(double)a3;
- (void)_queueForDataSource:(int8x8_t)a3;
- (void)setQueue:(id)a3 forDataSource:(unsigned int)a4;
@end

@implementation HVQueues

void __47__HVQueues_informObserversToDeleteWithRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v3[1];
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x22A6667F0]();
        v10 = [v3[1] objectForKey:v8];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __47__HVQueues_informObserversToDeleteWithRequest___block_invoke_2;
        block[3] = &unk_2647D5650;
        block[4] = v8;
        id v13 = *(id *)(a1 + 32);
        id v14 = *(id *)(a1 + 40);
        dispatch_async(v10, block);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
}

void __32__HVQueues__queueForDataSource___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  uint64_t v4 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 56)];
  uint64_t v5 = [v3[2] objectForKeyedSubscript:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    goto LABEL_2;
  }
  int v8 = 0;
  int v9 = *(_DWORD *)(a1 + 56);
  if (v9 <= 255)
  {
    if (v9 <= 15)
    {
      uint64_t v10 = 16;
      switch(v9)
      {
        case 1:
          goto LABEL_37;
        case 2:
          uint64_t v10 = 256;
          int v8 = 1;
          goto LABEL_37;
        case 4:
          int v8 = 0;
          uint64_t v10 = 4;
          goto LABEL_37;
        case 8:
          int v8 = 0;
          goto LABEL_37;
        default:
          goto LABEL_40;
      }
    }
    if (v9 > 63)
    {
      if (v9 == 64)
      {
        int v8 = 0;
        uint64_t v10 = 16;
        goto LABEL_37;
      }
      if (v9 == 128)
      {
        int v8 = 0;
        uint64_t v10 = 16;
        goto LABEL_37;
      }
    }
    else
    {
      if (v9 == 16)
      {
        int v8 = 0;
        uint64_t v10 = 16;
        goto LABEL_37;
      }
      if (v9 == 32)
      {
        int v8 = 0;
        uint64_t v10 = 16;
        goto LABEL_37;
      }
    }
    goto LABEL_40;
  }
  if (v9 > 4095)
  {
    if (v9 >= 0x4000)
    {
      if (v9 == 0x4000)
      {
        int v8 = 0;
        uint64_t v10 = 256;
        goto LABEL_37;
      }
      if (v9 == 0x8000)
      {
        int v8 = 0;
        uint64_t v10 = 256;
        goto LABEL_37;
      }
      goto LABEL_40;
    }
    if (v9 == 4096)
    {
      int v8 = 0;
      v11 = 0;
      uint64_t v10 = 256;
      v12 = @"UserActivityMetadata";
    }
    else
    {
      if (v9 != 0x2000) {
        goto LABEL_40;
      }
      int v8 = 0;
      v11 = 0;
      uint64_t v10 = 256;
      v12 = @"SearchableUserActivities";
    }
  }
  else
  {
    if (v9 <= 1023)
    {
      if (v9 == 256)
      {
        int v8 = 0;
        uint64_t v10 = 4;
        goto LABEL_37;
      }
      if (v9 == 512)
      {
        int v8 = 0;
        uint64_t v10 = 16;
LABEL_37:
        id v13 = objc_opt_new();
        v11 = v13;
        if (v13)
        {
          v12 = [v13 identifier];
          if (v12) {
            goto LABEL_42;
          }
        }
        goto LABEL_41;
      }
LABEL_40:
      id v14 = [MEMORY[0x263F08690] currentHandler];
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 48), *(void *)(a1 + 32), @"HVQueues.m", 262, @"HVQueue initWithDataSource given unexpected data source value: %u", *(unsigned int *)(a1 + 56));

      uint64_t v10 = 0;
      int v8 = 0;
      v11 = 0;
LABEL_41:
      long long v15 = [MEMORY[0x263F08690] currentHandler];
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 48), *(void *)(a1 + 32), @"HVQueues.m", 268, @"HVQueues failed to determine queue identifier: %u", *(unsigned int *)(a1 + 56));

      v12 = 0;
      goto LABEL_42;
    }
    if (v9 == 1024)
    {
      int v8 = 0;
      uint64_t v10 = 16;
      goto LABEL_37;
    }
    if (v9 != 2048) {
      goto LABEL_40;
    }
    v11 = 0;
    uint64_t v10 = 256;
    v12 = @"Interactions";
  }
LABEL_42:
  long long v16 = [HVQueue alloc];
  long long v18 = HVDataSourceFileProtection(*(unsigned int *)(a1 + 56), v17);
  HIDWORD(v19) = *(_DWORD *)(a1 + 56);
  LODWORD(v19) = HIDWORD(v19) - 1024;
  uint64_t v20 = [(HVQueue *)v16 initWithIdentifier:v12 biomeStream:v11 memoryLimit:v10 contentProtection:v18 contentExpectedFromMultipleApps:((v19 >> 10) < 8) & (0x8Bu >> (v19 >> 10))];
  uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
  v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;

  [v3[2] setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKeyedSubscript:v4];
  if (v8)
  {
    id location = 0;
    objc_initWeak(&location, *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    v23 = (void *)MEMORY[0x263F61E30];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __32__HVQueues__queueForDataSource___block_invoke_2;
    v24[3] = &unk_2647D56C8;
    objc_copyWeak(&v25, &location);
    [v23 runBlockWhenDeviceIsClassCUnlockedWithQoS:9 block:v24];
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

LABEL_2:
}

- (BOOL)deleteContentWithRequest:(id)a3 error:(id *)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = hv_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [v6 bundleIdentifier];
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_226C41000, v7, OS_LOG_TYPE_DEFAULT, "HVQueues: deleteContentWithRequest: %{private}@", (uint8_t *)&buf, 0xCu);
  }
  int v9 = [v6 bundleIdentifier];
  uint64_t v10 = HVDataSourceForBundleIdentifier(v9);

  v11 = (void *)MEMORY[0x22A6667F0]();
  id v12 = objc_alloc(MEMORY[0x263EFFA08]);
  id v14 = [(HVQueues *)self _queueForDataSource:v13];
  long long v16 = [(HVQueues *)self _queueForDataSource:v15];
  int8x8_t v17 = objc_msgSend(v12, "initWithObjects:", v14, v16, 0);

  v38 = a4;
  if (v10)
  {
    long long v18 = (void *)MEMORY[0x22A6667F0]();
    uint64_t v20 = [(HVQueues *)self _queueForDataSource:v19];
    uint64_t v21 = [v17 setByAddingObject:v20];

    int8x8_t v17 = (void *)v21;
  }
  v39 = self;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v22 = v17;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    id v25 = 0;
    uint64_t v26 = *(void *)v42;
    char v27 = 1;
    do
    {
      uint64_t v28 = 0;
      v29 = v25;
      do
      {
        if (*(void *)v42 != v26) {
          objc_enumerationMutation(v22);
        }
        v30 = *(void **)(*((void *)&v41 + 1) + 8 * v28);
        v31 = (void *)MEMORY[0x22A6667F0]();
        id v40 = v29;
        char v32 = [v30 deleteContentWithRequest:v6 error:&v40];
        id v25 = v40;

        v27 &= v32;
        ++v28;
        v29 = v25;
      }
      while (v24 != v28);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v24);
  }
  else
  {
    id v25 = 0;
    char v27 = 1;
  }

  if (v38) {
    id *v38 = v25;
  }
  id v33 = v6;
  if (v39)
  {
    v34 = (void *)os_transaction_create();
    lock = v39->_lock;
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v47 = __47__HVQueues_informObserversToDeleteWithRequest___block_invoke;
    v48 = &unk_2647D55D8;
    id v49 = v33;
    id v50 = v34;
    id v36 = v34;
    [(_PASLock *)lock runWithLockAcquired:&buf];
  }
  return v27;
}

- (void)_queueForDataSource:(int8x8_t)a3
{
  v3 = a1;
  if (a1)
  {
    int v4 = a2;
    HVDataSourceAssertSingleSource(a2, a3);
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = __Block_byref_object_copy__1140;
    int8x8_t v13 = __Block_byref_object_dispose__1141;
    id v14 = 0;
    uint64_t v5 = (void *)v3[1];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __32__HVQueues__queueForDataSource___block_invoke;
    v7[3] = &unk_2647D56F0;
    int v8 = v4;
    v7[5] = &v9;
    v7[6] = sel__queueForDataSource_;
    v7[4] = v3;
    [v5 runWithLockAcquired:v7];
    v3 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }

  return v3;
}

id __47__HVQueues_informObserversToDeleteWithRequest___block_invoke_2(uint64_t a1)
{
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationSerialQueue, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

- (BOOL)cleanupWithError:(id *)a3 shouldContinueBlock:(id)a4
{
  id v6 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__1140;
  uint64_t v23 = __Block_byref_object_dispose__1141;
  id v24 = 0;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__HVQueues_cleanupWithError_shouldContinueBlock___block_invoke;
  v11[3] = &unk_2647D57D8;
  id v7 = v6;
  v11[4] = self;
  id v12 = v7;
  int8x8_t v13 = &v15;
  id v14 = &v19;
  HVDataSourceRunBlockPerSetBit(-1, v11);
  int v8 = *((unsigned __int8 *)v16 + 24);
  if (a3 && !*((unsigned char *)v16 + 24))
  {
    *a3 = (id) v20[5];
    int v8 = *((unsigned __int8 *)v16 + 24);
  }
  BOOL v9 = v8 != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __49__HVQueues_cleanupWithError_shouldContinueBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    id v7 = [(HVQueues *)*(void **)(a1 + 32) _queueForDataSource:v6];
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v8 + 40);
    char v9 = [v7 cleanupWithError:&obj shouldContinueBlock:*(void *)(a1 + 40)];
    objc_storeStrong((id *)(v8 + 40), obj);
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(unsigned char *)(v10 + 24)) {
      char v11 = v9;
    }
    else {
      char v11 = 0;
    }
    *(unsigned char *)(v10 + 24) = v11;
  }
  else
  {
    *a3 = 1;
  }
}

void __32__HVQueues__queueForDataSource___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained ensureDeletionScanHasOccurredWithError:0];
    id WeakRetained = v2;
  }
}

- (id)statsWithError:(id *)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  int v4 = objc_opt_new();
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  id v50 = __Block_byref_object_copy__1140;
  uint64_t v51 = __Block_byref_object_dispose__1141;
  id v52 = 0;
  uint64_t v41 = 0;
  long long v42 = &v41;
  uint64_t v43 = 0x3032000000;
  long long v44 = __Block_byref_object_copy__1140;
  v45 = __Block_byref_object_dispose__1141;
  id v46 = 0;
  lock = self->_lock;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __27__HVQueues_statsWithError___block_invoke;
  v37[3] = &unk_2647D57B0;
  v39 = &v47;
  id v40 = &v41;
  id v6 = v4;
  id v38 = v6;
  [(_PASLock *)lock runWithLockAcquired:v37];
  id v7 = objc_opt_new();
  [v6 setObject:v7 forKeyedSubscript:@"Observers"];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = (id)v48[5];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v54 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        int8x8_t v13 = (void *)MEMORY[0x22A6667F0]();
        id v14 = [v6 objectForKeyedSubscript:@"Observers"];
        uint64_t v15 = [v12 description];
        [v14 addObject:v15];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v54 count:16];
    }
    while (v9);
  }

  long long v16 = objc_opt_new();
  [v6 setObject:v16 forKeyedSubscript:@"Queues"];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v17 = (id)v42[5];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v53 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v17);
        }
        uint64_t v21 = *(void **)(*((void *)&v29 + 1) + 8 * j);
        id v22 = objc_msgSend((id)v42[5], "objectForKeyedSubscript:", v21, (void)v29);
        uint64_t v23 = [v22 statsWithError:0];
        id v24 = [v6 objectForKeyedSubscript:@"Queues"];
        id v25 = HVDataSourceDescription([v21 intValue]);
        [v24 setObject:v23 forKeyedSubscript:v25];
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v53 count:16];
    }
    while (v18);
  }

  uint64_t v26 = v38;
  id v27 = v6;

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  return v27;
}

void __27__HVQueues_statsWithError___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)a2[1];
  int v4 = a2;
  uint64_t v5 = [v3 copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [(id)v4[2] copy];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  char v11 = HVDataSourceDescription(*((_DWORD *)v4 + 8));
  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:@"DataSources with available content"];

  id v12 = NSNumber;
  uint64_t v13 = v4[3];

  [v12 numberWithInt:v13 != 0];
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:@"Content available notification in progress"];
}

- (BOOL)dequeuedContentNotConsumed:(id)a3 dataSource:(unsigned int)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = hv_default_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v8 uniqueId];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_226C41000, v9, OS_LOG_TYPE_DEFAULT, "HVQueues: dequeuedContentNotConsumedWithUniqueIdentifier: %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__1140;
  id v24 = __Block_byref_object_dispose__1141;
  id v25 = 0;
  lock = self->_lock;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __56__HVQueues_dequeuedContentNotConsumed_dataSource_error___block_invoke;
  v19[3] = &unk_2647D5760;
  v19[4] = &buf;
  unsigned int v20 = a4;
  [(_PASLock *)lock runWithLockAcquired:v19];
  id v12 = *(void **)(*((void *)&buf + 1) + 40);
  if (v12)
  {
    id v18 = 0;
    char v13 = [v12 dequeuedContentNotConsumed:v8 error:&v18];
    id v14 = v18;
    uint64_t v15 = v14;
    if (a5) {
      char v16 = v13;
    }
    else {
      char v16 = 1;
    }
    if ((v16 & 1) == 0) {
      *a5 = v14;
    }
  }
  else if (a5)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"HVErrorDomain" code:12 userInfo:0];
    char v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v13 = 0;
  }
  _Block_object_dispose(&buf, 8);

  return v13;
}

void __56__HVQueues_dequeuedContentNotConsumed_dataSource_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a2 + 16);
  id v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  uint64_t v4 = [v3 objectForKeyedSubscript:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (BOOL)dequeuedContentConsumedForDataSources:(unsigned int)a3 withError:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = hv_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HVDataSourceDescription(a3);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_226C41000, v7, OS_LOG_TYPE_DEFAULT, "HVQueues: dequeuedContentConsumedForDataSources:%{public}@", (uint8_t *)&buf, 0xCu);
  }
  BOOL v9 = 1;
  if (a3)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__1140;
    unsigned int v20 = __Block_byref_object_dispose__1141;
    id v21 = 0;
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 1;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __60__HVQueues_dequeuedContentConsumedForDataSources_withError___block_invoke;
    v12[3] = &unk_2647D5788;
    v12[4] = self;
    v12[5] = &buf;
    v12[6] = &v13;
    HVDataSourceRunBlockPerSetBit(a3, v12);
    int v10 = *((unsigned __int8 *)v14 + 24);
    if (a4 && !*((unsigned char *)v14 + 24))
    {
      *a4 = *(id *)(*((void *)&buf + 1) + 40);
      int v10 = *((unsigned __int8 *)v14 + 24);
    }
    BOOL v9 = v10 != 0;
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&buf, 8);
  }
  return v9;
}

void __60__HVQueues_dequeuedContentConsumedForDataSources_withError___block_invoke(void *a1, int a2)
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__1140;
  uint64_t v15 = __Block_byref_object_dispose__1141;
  id v16 = 0;
  v3 = *(void **)(a1[4] + 8);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__HVQueues_dequeuedContentConsumedForDataSources_withError___block_invoke_2;
  v9[3] = &unk_2647D5760;
  v9[4] = &v11;
  int v10 = a2;
  [v3 runWithLockAcquired:v9];
  uint64_t v4 = (void *)v12[5];
  if (v4)
  {
    id v8 = 0;
    char v5 = [v4 dequeuedContentConsumedWithError:&v8];
    id v6 = v8;
    id v7 = v8;
    if ((v5 & 1) == 0)
    {
      objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v6);
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    }
  }
  _Block_object_dispose(&v11, 8);
}

void __60__HVQueues_dequeuedContentConsumedForDataSources_withError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a2 + 16);
  id v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  uint64_t v4 = [v3 objectForKeyedSubscript:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (BOOL)dequeuedContentConsumedWithError:(id *)a3
{
  return [(HVQueues *)self dequeuedContentConsumedForDataSources:0xFFFFFFFFLL withError:a3];
}

- (BOOL)dequeueContent:(id *)a3 contentProtection:(id *)a4 dataSource:(unsigned int)a5 dataSourceContentState:(id)a6 minimumLevelOfService:(unsigned __int8)a7 inMemoryItemsOnly:(BOOL)a8 error:(id *)a9
{
  BOOL v9 = a8;
  uint64_t v10 = a7;
  uint64_t v11 = *(void *)&a5;
  id v16 = a6;
  if (!a3)
  {
    long long v30 = [MEMORY[0x263F08690] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"HVQueues.m", 318, @"Invalid parameter not satisfying: %@", @"content" object file lineNumber description];
  }
  if ([v16 dataSource] != v11)
  {
    long long v31 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HVQueues.m", 320, @"Mismatched dataSource(%u) and dataSourceContentState(%u) parameters.", v11, objc_msgSend(v16, "dataSource"));
  }
  uint64_t v18 = [(HVQueues *)self _queueForDataSource:v17];
  int v19 = [v18 dequeueContent:a3 dataSourceContentState:v16 minimumLevelOfService:v10 inMemoryItemsOnly:v9 error:a9];
  if (v19)
  {
    if (*a3)
    {
      if (a4)
      {
        HIDWORD(v21) = v11;
        LODWORD(v21) = v11 - 1024;
        unsigned int v20 = v21 >> 10;
        if (v20 <= 7 && ((0x8Bu >> v20) & 1) != 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v22 = *a3;
            uint64_t v23 = [v22 searchableItem];
            id v24 = [v23 protection];
            id v25 = *a4;
            *a4 = v24;
          }
          else
          {
            objc_storeStrong(a4, (id)*MEMORY[0x263F08098]);
          }
        }
        else
        {
          id v27 = [v18 contentProtection];
          id v28 = *a4;
          *a4 = v27;
        }
      }
    }
    else if (!v9)
    {
      lock = self->_lock;
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __125__HVQueues_dequeueContent_contentProtection_dataSource_dataSourceContentState_minimumLevelOfService_inMemoryItemsOnly_error___block_invoke;
      v32[3] = &__block_descriptor_36_e29_v16__0__HVQueuesGuardedData_8l;
      int v33 = v11;
      [(_PASLock *)lock runWithLockAcquired:v32];
    }
  }

  return v19;
}

uint64_t __125__HVQueues_dequeueContent_contentProtection_dataSource_dataSourceContentState_minimumLevelOfService_inMemoryItemsOnly_error___block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(a2 + 32) &= ~*(_DWORD *)(result + 32);
  return result;
}

- (BOOL)enqueueContent:(id)a3 contentProtection:(id)a4 error:(id *)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v32 = 0;
  int v33 = &v32;
  uint64_t v34 = 0x3032000000;
  long long v35 = __Block_byref_object_copy__1140;
  long long v36 = __Block_byref_object_dispose__1141;
  id v37 = 0;
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x2020000000;
  int v31 = 0;
  lock = self->_lock;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __51__HVQueues_enqueueContent_contentProtection_error___block_invoke;
  v23[3] = &unk_2647D5678;
  id v11 = v8;
  uint64_t v26 = &v28;
  id v27 = &v32;
  id v24 = v11;
  id v25 = self;
  [(_PASLock *)lock runWithLockAcquired:v23];
  HIDWORD(v13) = *((_DWORD *)v29 + 6);
  LODWORD(v13) = HIDWORD(v13) - 1024;
  unsigned int v12 = v13 >> 10;
  if (v12 > 7 || ((0x8Bu >> v12) & 1) == 0)
  {
    id v14 = [(id)v33[5] contentProtection];
    char v15 = [v9 isEqualToString:v14];

    if ((v15 & 1) == 0)
    {
      id v16 = hv_default_log_handle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = *((_DWORD *)v29 + 6);
        uint64_t v18 = [(id)v33[5] contentProtection];
        *(_DWORD *)long long buf = 67109634;
        int v39 = v17;
        __int16 v40 = 2112;
        uint64_t v41 = v18;
        __int16 v42 = 2112;
        id v43 = v9;
        _os_log_impl(&dword_226C41000, v16, OS_LOG_TYPE_DEFAULT, "HVQueues: enqueueContent: contentProtection for dataSource %u is %@ but caller passed in %@", buf, 0x1Cu);
      }
    }
  }
  char v19 = [(id)v33[5] enqueueContent:v11 error:a5];
  if (v19)
  {
    unsigned int v20 = self->_lock;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __51__HVQueues_enqueueContent_contentProtection_error___block_invoke_23;
    v22[3] = &unk_2647D56A0;
    v22[4] = self;
    v22[5] = &v28;
    [(_PASLock *)v20 runWithLockAcquired:v22];
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v19;
}

void __51__HVQueues_enqueueContent_contentProtection_error___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = hv_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [(id)objc_opt_class() description];
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_226C41000, v2, OS_LOG_TYPE_DEFAULT, "HVQueues: enqueueContent: %@", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v4 = objc_opt_class();
  HVDataSourceForContentClass(v4);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
  uint64_t v7 = [(HVQueues *)*(void **)(a1 + 40) _queueForDataSource:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void __51__HVQueues_enqueueContent_contentProtection_error___block_invoke_23(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 32) |= *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (!*(void *)(a2 + 24))
  {
    id v9 = (id)a2;
    uint64_t v4 = os_transaction_create();
    int v5 = *(void **)(a2 + 24);
    *(void *)(a2 + 24) = v4;

    int8x8_t v6 = *(void **)(a1 + 32);
    if (v6)
    {
      id location = 0;
      objc_initWeak(&location, v6);
      uint64_t v7 = (void *)MEMORY[0x263F61E38];
      uint64_t v8 = v6[2];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __56__HVQueues__triggerDelayedContentAvailableNotifications__block_invoke;
      v10[3] = &unk_2647D5718;
      objc_copyWeak(&v11, &location);
      v10[4] = v6;
      [v7 runAsyncOnQueue:v8 afterDelaySeconds:v10 block:0.1];
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

void __56__HVQueues__triggerDelayedContentAvailableNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = (void *)*((void *)WeakRetained + 1);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __56__HVQueues__triggerDelayedContentAvailableNotifications__block_invoke_2;
    v5[3] = &unk_2647D5628;
    v5[4] = *(void *)(a1 + 32);
    [v4 runWithLockAcquired:v5];
  }
}

void __56__HVQueues__triggerDelayedContentAvailableNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = a2;
  uint64_t v4 = hv_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl(&dword_226C41000, v4, OS_LOG_TYPE_DEFAULT, "HVQueues: informing observers and posting content available notification.", (uint8_t *)v11, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    int8x8_t v6 = (void *)os_transaction_create();
    uint64_t v7 = *(void **)(v5 + 8);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __49__HVQueues_informObserversThatContentIsAvailable__block_invoke;
    v11[3] = &unk_2647D5628;
    id v12 = v6;
    id v8 = v6;
    [v7 runWithLockAcquired:v11];
  }
  uint64_t v9 = self;
  +[HVNotifications _postNotificationWithName:](v9, "com.apple.proactive.ProactiveHarvesting.queue.contentAdded");
  int v10 = (void *)v3[3];
  v3[3] = 0;
}

void __49__HVQueues_informObserversThatContentIsAvailable__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v3[1];
  uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * v7);
        uint64_t v9 = (void *)MEMORY[0x22A6667F0]();
        int v10 = [v3[1] objectForKey:v8];
        int v11 = *((_DWORD *)v3 + 8);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __49__HVQueues_informObserversThatContentIsAvailable__block_invoke_2;
        block[3] = &unk_2647D5600;
        block[4] = v8;
        int v15 = v11;
        id v14 = *(id *)(a1 + 32);
        dispatch_async(v10, block);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
}

id __49__HVQueues_informObserversThatContentIsAvailable__block_invoke_2(uint64_t a1)
{
  return self;
}

- (BOOL)registerQueueObserver:(id)a3 dispatchQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__HVQueues_registerQueueObserver_dispatchQueue___block_invoke;
  v12[3] = &unk_2647D55D8;
  id v13 = v7;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  [(_PASLock *)lock runWithLockAcquired:v12];

  return 1;
}

uint64_t __48__HVQueues_registerQueueObserver_dispatchQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 8) setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
}

- (HVQueues)init
{
  v10.receiver = self;
  v10.super_class = (Class)HVQueues;
  id v2 = [(HVQueues *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F61E70]);
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = [v3 initWithGuardedData:v4];
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v5;

    uint64_t v7 = [MEMORY[0x263F61E38] autoreleasingSerialQueueWithLabel:"HVQueues.notificationSerialQueue" qosClass:9];
    notificationSerialQueue = v2->_notificationSerialQueue;
    v2->_notificationSerialQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

+ (id)defaultQueues
{
  if (defaultQueues__pasOnceToken2 != -1) {
    dispatch_once(&defaultQueues__pasOnceToken2, &__block_literal_global_1199);
  }
  id v2 = (void *)defaultQueues__pasExprOnceResult;

  return v2;
}

void __25__HVQueues_defaultQueues__block_invoke()
{
  v0 = (void *)MEMORY[0x22A6667F0]();
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)defaultQueues__pasExprOnceResult;
  defaultQueues__pasExprOnceResult = v1;
}

- (unsigned)waitForObserversWithTimeout:(double)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v5 = [MEMORY[0x263EFF910] now];
  uint64_t v32 = 0;
  int v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  do
  {
    lock = self->_lock;
    v31[0] = v6;
    v31[1] = 3221225472;
    v31[2] = __53__HVQueues_TestHelpers__waitForObserversWithTimeout___block_invoke;
    v31[3] = &unk_2647D5800;
    v31[4] = &v32;
    [(_PASLock *)lock runWithLockAcquired:v31];
    if (!*((unsigned char *)v33 + 24)) {
      break;
    }
    usleep(0x1E84u);
    if (!*((unsigned char *)v33 + 24)) {
      break;
    }
    uint64_t v8 = [MEMORY[0x263EFF910] now];
    [v8 timeIntervalSinceDate:v5];
    BOOL v10 = v9 < a3;
  }
  while (v10);
  int v11 = objc_opt_new();
  id v12 = self->_lock;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __53__HVQueues_TestHelpers__waitForObserversWithTimeout___block_invoke_2;
  v29[3] = &unk_2647D5628;
  id v13 = v11;
  id v30 = v13;
  [(_PASLock *)v12 runWithLockAcquired:v29];
  id v14 = [MEMORY[0x263EFF910] now];
  [v14 timeIntervalSinceDate:v5];
  double v16 = v15;

  double v17 = fmax(v16, 0.0);
  if (v17 <= 0.0)
  {
    dispatch_time_t v18 = 0;
  }
  else if (v17 <= 9223372040.0)
  {
    dispatch_time_t v18 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
  }
  else
  {
    dispatch_time_t v18 = -1;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v19 = v13;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v19);
        }
        if (dispatch_block_wait(*(dispatch_block_t *)(*((void *)&v25 + 1) + 8 * i), v18))
        {
          unsigned __int8 v23 = 1;
          goto LABEL_20;
        }
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v36 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
  unsigned __int8 v23 = 0;
LABEL_20:

  _Block_object_dispose(&v32, 8);
  return v23;
}

uint64_t __53__HVQueues_TestHelpers__waitForObserversWithTimeout___block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(a2 + 24) != 0;
  return result;
}

void __53__HVQueues_TestHelpers__waitForObserversWithTimeout___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v3[1];
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * v7);
        double v9 = (void *)MEMORY[0x22A6667F0]();
        BOOL v10 = [v3[1] objectForKey:v8];
        dispatch_block_t v11 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_118);
        dispatch_barrier_async(v10, v11);
        id v12 = *(void **)(a1 + 32);
        id v13 = (void *)MEMORY[0x22A6669E0](v11);
        [v12 addObject:v13];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
}

- (void)setQueue:(id)a3 forDataSource:(unsigned int)a4
{
  id v4 = a3;
  __break(1u);
}

@end