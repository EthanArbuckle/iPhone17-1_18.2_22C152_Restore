@interface HDMHDaySummaryQueryServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)queryClass;
+ (id)requiredEntitlements;
- (BOOL)_queue_surfaceDaySummariesWithError:(id *)a3;
- (HDMHDaySummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)objectTypes;
- (void)_queue_start;
@end

@implementation HDMHDaySummaryQueryServer

- (HDMHDaySummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDMHDaySummaryQueryServer;
  v12 = [(HDQueryServer *)&v15 initWithUUID:a3 configuration:v11 client:a5 delegate:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_configuration, a4);
  }

  return v13;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x263EFFA68];
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v6 = a4;
  v7 = [v6 entitlements];
  uint64_t v8 = *MEMORY[0x263F09BA8];
  char v9 = [v7 hasEntitlement:*MEMORY[0x263F09BA8]];

  if ((v9 & 1) != 0
    || ([v6 entitlements],
        v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = *MEMORY[0x263F09BA0],
        char v12 = [v10 hasPrivateAccessEntitlementWithIdentifier:*MEMORY[0x263F09BA0]],
        v10,
        (v12 & 1) != 0))
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a5, 4, @"Missing required entitlement: %@ for core apps or %@ for second-party access.", v8, v11);
    BOOL v13 = 0;
  }

  return v13;
}

- (id)objectTypes
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [MEMORY[0x263F0A6E8] stateOfMindType];
  v4 = [v2 setWithObject:v3];

  return v4;
}

- (void)_queue_start
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v31.receiver = self;
  v31.super_class = (Class)HDMHDaySummaryQueryServer;
  [(HDQueryServer *)&v31 _queue_start];
  v3 = [(HDQueryServer *)self clientProxy];
  v4 = [v3 remoteObjectProxy];

  v5 = [(HDQueryServer *)self client];
  id v6 = [v5 authorizationOracle];
  v7 = [(HDMHDaySummaryQueryServer *)self objectTypes];
  id v30 = 0;
  uint64_t v8 = [v6 readAuthorizationStatusesForTypes:v7 error:&v30];
  id v9 = v30;

  if (!v8)
  {
    v20 = [(HDQueryServer *)self queryUUID];
    objc_msgSend(v4, "client_deliverError:forQuery:", v9, v20);
    goto LABEL_19;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v10 = [v8 allValues];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (!v11)
  {

LABEL_18:
    v20 = [MEMORY[0x263F431E0] contextForReadingProtectedData];
    v21 = [(HDQueryServer *)self profile];
    v22 = [v21 database];
    v24[4] = self;
    id v25 = v9;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __41__HDMHDaySummaryQueryServer__queue_start__block_invoke;
    v24[3] = &unk_2653F0440;
    [v22 performTransactionWithContext:v20 error:&v25 block:v24 inaccessibilityHandler:0];
    id v23 = v25;

    id v9 = v23;
    goto LABEL_19;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v27;
  char v14 = 1;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v27 != v13) {
        objc_enumerationMutation(v10);
      }
      if (v14) {
        char v14 = [*(id *)(*((void *)&v26 + 1) + 8 * i) canRead];
      }
      else {
        char v14 = 0;
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v36 count:16];
  }
  while (v12);

  if (v14) {
    goto LABEL_18;
  }
  _HKInitializeLogging();
  v16 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    v18 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v33 = v18;
    __int16 v34 = 2114;
    v35 = v8;
    id v19 = v18;
    _os_log_impl(&dword_255F2E000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Avoiding exposing health data due to missing authorization: %{public}@", buf, 0x16u);
  }
  v20 = [(HDQueryServer *)self queryUUID];
  objc_msgSend(v4, "client_deliverDaySummaries:clearPending:isFinalBatch:queryUUID:", MEMORY[0x263EFFA68], 0, 1, v20);
LABEL_19:
}

uint64_t __41__HDMHDaySummaryQueryServer__queue_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_surfaceDaySummariesWithError:");
}

- (BOOL)_queue_surfaceDaySummariesWithError:(id *)a3
{
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__1;
  v46 = __Block_byref_object_dispose__1;
  id v47 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 1;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  uint64_t v5 = [(HKMHDaySummaryQueryConfiguration *)self->_configuration limit];
  id v6 = [(HDQueryServer *)self clientProxy];
  v7 = [v6 remoteObjectProxy];

  uint64_t v8 = [HDMHDaySummaryEnumerator alloc];
  id v9 = [(HDQueryServer *)self profile];
  uint64_t v10 = [(HKMHDaySummaryQueryConfiguration *)self->_configuration dayIndexRange];
  uint64_t v12 = v11;
  uint64_t v13 = [(HKMHDaySummaryQueryConfiguration *)self->_configuration gregorianCalendar];
  LOBYTE(v24) = [(HKMHDaySummaryQueryConfiguration *)self->_configuration ascending];
  char v14 = -[HDMHDaySummaryEnumerator initWithProfile:dayIndexRange:gregorianCalendar:predicate:pendingDailyStateOfMind:ascending:](v8, "initWithProfile:dayIndexRange:gregorianCalendar:predicate:pendingDailyStateOfMind:ascending:", v9, v10, v12, v13, 0, 0, v24);

  id v32 = 0;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __65__HDMHDaySummaryQueryServer__queue_surfaceDaySummariesWithError___block_invoke;
  v25[3] = &unk_2653F04E0;
  v25[4] = self;
  long long v27 = &v34;
  long long v28 = &v42;
  id v15 = v7;
  id v26 = v15;
  long long v29 = &v38;
  id v30 = v33;
  uint64_t v31 = v5;
  BOOL v16 = [(HDMHDaySummaryEnumerator *)v14 enumerateWithError:&v32 handler:v25];
  id v17 = v32;
  if (!*((unsigned char *)v35 + 24))
  {
    if (v16)
    {
      uint64_t v18 = v43[5];
      int v19 = *((unsigned __int8 *)v39 + 24);
      v20 = [(HDQueryServer *)self queryUUID];
      objc_msgSend(v15, "client_deliverDaySummaries:clearPending:isFinalBatch:queryUUID:", v18, v19 != 0, 1, v20);
    }
    else
    {
      v20 = [(HDQueryServer *)self queryUUID];
      objc_msgSend(v15, "client_deliverError:forQuery:", v17, v20);
    }
  }
  id v21 = v17;
  v22 = v21;
  if (v21)
  {
    if (a3) {
      *a3 = v21;
    }
    else {
      _HKLogDroppedError();
    }
  }

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  return v16;
}

void __65__HDMHDaySummaryQueryServer__queue_surfaceDaySummariesWithError___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v13 = a2;
  if (([*(id *)(a1 + 32) _shouldStopProcessingQuery] & 1) != 0
    || [*(id *)(a1 + 32) _shouldSuspendQuery])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    if (!a3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count] >= 0xC8)
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v6 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    v7 = *(void **)(a1 + 40);
    uint64_t v8 = [*(id *)(a1 + 32) queryUUID];
    objc_msgSend(v7, "client_deliverDaySummaries:clearPending:isFinalBatch:queryUUID:", v5, v6, 0, v8);

    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v13];
  ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  uint64_t v12 = *(void *)(a1 + 80);
  if (v12 && a3 && *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) >= v12) {
LABEL_4:
  }
    *a3 = 1;
LABEL_5:
}

- (void).cxx_destruct
{
}

@end