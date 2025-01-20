@interface HDMHValenceDistributionSummaryQueryServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)queryClass;
+ (id)requiredEntitlements;
- ($0AC6E346AE4835514AAA8AC86D8F4844)_dayIndexRangeWithAnchorIndex:(int64_t)a3;
- (BOOL)_queue_surfaceValenceDistributionSummariesWithError:(id *)a3;
- (HDMHValenceDistributionSummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)objectTypes;
- (void)_queue_start;
@end

@implementation HDMHValenceDistributionSummaryQueryServer

- (HDMHValenceDistributionSummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDMHValenceDistributionSummaryQueryServer;
  v12 = [(HDQueryServer *)&v17 initWithUUID:a3 configuration:v11 client:a5 delegate:a6];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configuration, a4);
    uint64_t v14 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    gregorianCalendar = v13->_gregorianCalendar;
    v13->_gregorianCalendar = (NSCalendar *)v14;
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
  v31.super_class = (Class)HDMHValenceDistributionSummaryQueryServer;
  [(HDQueryServer *)&v31 _queue_start];
  v3 = [(HDQueryServer *)self clientProxy];
  v4 = [v3 remoteObjectProxy];

  v5 = [(HDQueryServer *)self client];
  id v6 = [v5 authorizationOracle];
  v7 = [(HDMHValenceDistributionSummaryQueryServer *)self objectTypes];
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
    v24[2] = __57__HDMHValenceDistributionSummaryQueryServer__queue_start__block_invoke;
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
    objc_super v17 = v16;
    v18 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v33 = v18;
    __int16 v34 = 2114;
    v35 = v8;
    id v19 = v18;
    _os_log_impl(&dword_255F2E000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Avoiding exposing health data due to missing authorization: %{public}@", buf, 0x16u);
  }
  v20 = [(HDQueryServer *)self queryUUID];
  objc_msgSend(v4, "client_deliverValenceDistributionSummaries:clearPending:isFinalBatch:queryUUID:", MEMORY[0x263EFFA68], 0, 1, v20);
LABEL_19:
}

uint64_t __57__HDMHValenceDistributionSummaryQueryServer__queue_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_surfaceValenceDistributionSummariesWithError:");
}

- (BOOL)_queue_surfaceValenceDistributionSummariesWithError:(id *)a3
{
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy_;
  v57 = __Block_byref_object_dispose_;
  id v58 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 1;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v44[3] = 0;
  uint64_t v4 = [(HKMHValenceDistributionSummaryQueryConfiguration *)self->_configuration limit];
  v5 = [(HDQueryServer *)self clientProxy];
  id v6 = [v5 remoteObjectProxy];

  v7 = [HDMHDaySummaryEnumerator alloc];
  uint64_t v8 = [(HDQueryServer *)self profile];
  uint64_t v9 = [(HKMHValenceDistributionSummaryQueryConfiguration *)self->_configuration dayIndexRange];
  uint64_t v11 = v10;
  uint64_t v12 = [(HKMHValenceDistributionSummaryQueryConfiguration *)self->_configuration gregorianCalendar];
  uint64_t v13 = [(HDQueryServer *)self predicateForQueryClient];
  LOBYTE(v27) = [(HKMHValenceDistributionSummaryQueryConfiguration *)self->_configuration ascending];
  char v14 = -[HDMHDaySummaryEnumerator initWithProfile:dayIndexRange:gregorianCalendar:predicate:pendingDailyStateOfMind:ascending:](v7, "initWithProfile:dayIndexRange:gregorianCalendar:predicate:pendingDailyStateOfMind:ascending:", v8, v9, v11, v12, v13, 0, v27);

  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  id v43 = 0;
  id v37 = 0;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __97__HDMHValenceDistributionSummaryQueryServer__queue_surfaceValenceDistributionSummariesWithError___block_invoke;
  v29[3] = &unk_2653F0468;
  v29[4] = self;
  objc_super v31 = &v45;
  v32 = &v53;
  id v15 = v6;
  id v30 = v15;
  v33 = &v49;
  __int16 v34 = &v38;
  v35 = v44;
  uint64_t v36 = v4;
  BOOL v16 = [(HDMHDaySummaryEnumerator *)v14 enumerateWithError:&v37 handler:v29];
  id v17 = v37;
  v18 = (void *)v39[5];
  if (v18)
  {
    id v19 = (void *)v54[5];
    v20 = [v18 valenceDistributionSummary];
    [v19 addObject:v20];
  }
  if (!*((unsigned char *)v46 + 24))
  {
    if (v16)
    {
      uint64_t v21 = v54[5];
      int v22 = *((unsigned __int8 *)v50 + 24);
      id v23 = [(HDQueryServer *)self queryUUID];
      objc_msgSend(v15, "client_deliverValenceDistributionSummaries:clearPending:isFinalBatch:queryUUID:", v21, v22 != 0, 1, v23);
    }
    else
    {
      id v23 = [(HDQueryServer *)self queryUUID];
      objc_msgSend(v15, "client_deliverError:forQuery:", v17, v23);
    }
  }
  id v24 = v17;
  id v25 = v24;
  if (v24)
  {
    if (a3) {
      *a3 = v24;
    }
    else {
      _HKLogDroppedError();
    }
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

  return v16;
}

void __97__HDMHValenceDistributionSummaryQueryServer__queue_surfaceValenceDistributionSummariesWithError___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v26 = a2;
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
    objc_msgSend(v7, "client_deliverValenceDistributionSummaries:clearPending:isFinalBatch:queryUUID:", v5, v6, 0, v8);

    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
  uint64_t v12 = [v26 dayIndex];
  uint64_t v13 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (!v13) {
    goto LABEL_16;
  }
  uint64_t v14 = [v13 dayIndexRange];
  if (v12 < v14 || v12 - v14 >= v15)
  {
    id v17 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v18 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) valenceDistributionSummary];
    [v17 addObject:v18];

LABEL_16:
    id v19 = [HDMHValenceDistributionSummaryBuilder alloc];
    uint64_t v20 = [*(id *)(a1 + 32) _dayIndexRangeWithAnchorIndex:v12];
    uint64_t v22 = -[HDMHValenceDistributionSummaryBuilder initWithDayIndexRange:gregorianCalendar:](v19, "initWithDayIndexRange:gregorianCalendar:", v20, v21, *(void *)(*(void *)(a1 + 32) + 208));
    uint64_t v23 = *(void *)(*(void *)(a1 + 72) + 8);
    id v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addDaySummary:v26];
  ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  uint64_t v25 = *(void *)(a1 + 88);
  if (v25 && a3 && *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) >= v25) {
LABEL_4:
  }
    *a3 = 1;
LABEL_5:
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_dayIndexRangeWithAnchorIndex:(int64_t)a3
{
  if (([(HKMHValenceDistributionSummaryQueryConfiguration *)self->_configuration options] & 2) != 0)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFF910], "hk_noonWithDayIndex:calendar:", a3, self->_gregorianCalendar);
    v7 = [(NSCalendar *)self->_gregorianCalendar hk_startOfMonthForDate:v6];
    a3 = objc_msgSend(v7, "hk_dayIndexWithCalendar:", self->_gregorianCalendar);
    [(NSCalendar *)self->_gregorianCalendar rangeOfUnit:16 inUnit:8 forDate:v7];
    uint64_t v5 = v8;
LABEL_6:

    goto LABEL_7;
  }
  if ([(HKMHValenceDistributionSummaryQueryConfiguration *)self->_configuration options])
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFF910], "hk_noonWithDayIndex:calendar:", a3, self->_gregorianCalendar);
    v7 = [(NSCalendar *)self->_gregorianCalendar hk_startOfWeekWithFirstWeekday:[(NSCalendar *)self->_gregorianCalendar firstWeekday] beforeDate:v6 addingWeeks:0];
    a3 = objc_msgSend(v7, "hk_dayIndexWithCalendar:", self->_gregorianCalendar);
    uint64_t v5 = 7;
    goto LABEL_6;
  }
  uint64_t v5 = 1;
LABEL_7:
  int64_t v9 = a3;
  int64_t v10 = v5;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end