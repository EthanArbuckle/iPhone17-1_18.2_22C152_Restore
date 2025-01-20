@interface HDMHMostPrevalentDomainsQueryServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)queryClass;
+ (id)requiredEntitlements;
- (BOOL)_queue_surfaceMostPrevalentDomainsWithError:(id *)a3;
- (HDMHMostPrevalentDomainsQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)objectTypes;
- (void)_queue_start;
@end

@implementation HDMHMostPrevalentDomainsQueryServer

- (HDMHMostPrevalentDomainsQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDMHMostPrevalentDomainsQueryServer;
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
  v31.super_class = (Class)HDMHMostPrevalentDomainsQueryServer;
  [(HDQueryServer *)&v31 _queue_start];
  v3 = [(HDQueryServer *)self clientProxy];
  v4 = [v3 remoteObjectProxy];

  v5 = [(HDQueryServer *)self client];
  id v6 = [v5 authorizationOracle];
  v7 = [(HDMHMostPrevalentDomainsQueryServer *)self objectTypes];
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
    v24[2] = __51__HDMHMostPrevalentDomainsQueryServer__queue_start__block_invoke;
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
  objc_msgSend(v4, "client_deliverMostPrevalentDomains:queryUUID:", 0, v20);
LABEL_19:
}

uint64_t __51__HDMHMostPrevalentDomainsQueryServer__queue_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_surfaceMostPrevalentDomainsWithError:");
}

- (BOOL)_queue_surfaceMostPrevalentDomainsWithError:(id *)a3
{
  v4 = [(HDQueryServer *)self clientProxy];
  v5 = [v4 remoteObjectProxy];

  id v6 = [HDMHDaySummaryEnumerator alloc];
  v7 = [(HDQueryServer *)self profile];
  uint64_t v8 = [(HKMHCountBasedQueryConfiguration *)self->_configuration dayIndexRange];
  uint64_t v10 = v9;
  uint64_t v11 = [(HKMHCountBasedQueryConfiguration *)self->_configuration gregorianCalendar];
  uint64_t v12 = [(HDQueryServer *)self predicateForQueryClient];
  LOBYTE(v29) = 1;
  uint64_t v13 = -[HDMHDaySummaryEnumerator initWithProfile:dayIndexRange:gregorianCalendar:predicate:pendingDailyStateOfMind:ascending:](v6, "initWithProfile:dayIndexRange:gregorianCalendar:predicate:pendingDailyStateOfMind:ascending:", v7, v8, v10, v11, v12, 0, v29);

  char v14 = objc_alloc_init(HDMHMostPrevalentDomainsBuilder);
  id v33 = 0;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __83__HDMHMostPrevalentDomainsQueryServer__queue_surfaceMostPrevalentDomainsWithError___block_invoke;
  v31[3] = &unk_2653F0618;
  v31[4] = self;
  objc_super v15 = v14;
  v32 = v15;
  BOOL v16 = [(HDMHDaySummaryEnumerator *)v13 enumerateWithError:&v33 handler:v31];
  id v17 = v33;
  id v18 = objc_alloc(MEMORY[0x263F55020]);
  id v19 = [(HDMHMostPrevalentDomainsBuilder *)v15 mostPrevalentUnpleasantDomains];
  v20 = [(HDMHMostPrevalentDomainsBuilder *)v15 mostPrevalentPleasantDomains];
  uint64_t v21 = [(HKMHCountBasedQueryConfiguration *)self->_configuration dayIndexRange];
  id v23 = objc_msgSend(v18, "initWithMostUnpleasantDomains:mostPleasantDomains:dayIndexRange:", v19, v20, v21, v22);

  v24 = [(HDQueryServer *)self queryUUID];
  if (v16) {
    id v25 = v23;
  }
  else {
    id v25 = 0;
  }
  objc_msgSend(v5, "client_deliverMostPrevalentDomains:queryUUID:", v25, v24);

  id v26 = v17;
  long long v27 = v26;
  if (v26)
  {
    if (a3) {
      *a3 = v26;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v16;
}

void __83__HDMHMostPrevalentDomainsQueryServer__queue_surfaceMostPrevalentDomainsWithError___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (([*(id *)(a1 + 32) _shouldStopProcessingQuery] & 1) != 0
    || [*(id *)(a1 + 32) _shouldSuspendQuery])
  {
    if (a3) {
      *a3 = 1;
    }
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = objc_msgSend(v5, "momentaryStatesOfMind", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(a1 + 40) addStateOfMind:*(void *)(*((void *)&v12 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    uint64_t v11 = [v5 dailyStateOfMind];
    if (v11) {
      [*(id *)(a1 + 40) addStateOfMind:v11];
    }
  }
}

- (void).cxx_destruct
{
}

@end