@interface HVConsumerCoordinator
+ (id)defaultCoordinator;
- (BOOL)_consumeContentFromAllDataSources:(int)a3 minimumLevelOfService:(char)a4 inMemoryItemsOnly:(void *)a5 guardedData:(void *)a6 shouldContinueBlock:(void *)a7 error:;
- (BOOL)deleteContentWithRequest:(id)a3 error:(id *)a4;
- (BOOL)harvestContentWithMinimumLevelOfService:(unsigned __int8)a3 ignoringDiscretionaryPowerBudget:(BOOL)a4 error:(id *)a5 shouldContinueBlock:(id)a6;
- (BOOL)registerInteractionConsumer:(id)a3 levelOfService:(unsigned __int8)a4;
- (BOOL)registerMailConsumer:(id)a3 levelOfService:(unsigned __int8)a4;
- (BOOL)registerMessagesConsumer:(id)a3 levelOfService:(unsigned __int8)a4;
- (BOOL)registerNewsConsumer:(id)a3 levelOfService:(unsigned __int8)a4;
- (BOOL)registerNotesConsumer:(id)a3 levelOfService:(unsigned __int8)a4;
- (BOOL)registerNotificationsConsumer:(id)a3 levelOfService:(unsigned __int8)a4;
- (BOOL)registerParsecConsumer:(id)a3 levelOfService:(unsigned __int8)a4;
- (BOOL)registerPhotosConsumer:(id)a3 levelOfService:(unsigned __int8)a4;
- (BOOL)registerRemindersConsumer:(id)a3 levelOfService:(unsigned __int8)a4;
- (BOOL)registerSafariConsumer:(id)a3 levelOfService:(unsigned __int8)a4;
- (BOOL)registerSiriConsumer:(id)a3 levelOfService:(unsigned __int8)a4;
- (BOOL)registerThirdPartyAppConsumer:(id)a3 levelOfService:(unsigned __int8)a4;
- (BOOL)registerUserActivityConsumer:(id)a3 levelOfService:(unsigned __int8)a4;
- (HVConsumerCoordinator)init;
- (HVConsumerCoordinator)initWithQueues:(id)a3 path:(id)a4;
- (id)_consumersForOneDataSource:(void *)a3 guardedData:;
- (id)_statsForConsumers:(uint64_t)a1;
- (id)statsWithError:(id *)a3;
- (void)_registerConsumer:(uint64_t)a3 levelOfService:(id *)a4 consumerMapTableOut:;
- (void)contentAvailableFromSources:(unsigned int)a3;
- (void)disableConsumptionOfDataSources:(unsigned int)a3;
- (void)enableConsumptionOfDataSources:(unsigned int)a3;
- (void)restoreConsumptionOfDataSources:(unsigned int)a3;
@end

@implementation HVConsumerCoordinator

void __56__HVConsumerCoordinator_deleteContentWithRequest_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  v3 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  id v4 = [*(id *)(a1 + 40) bundleIdentifier];
  v5 = v4;
  if (!v3) {
    goto LABEL_21;
  }
  if (([v4 isEqualToString:@"com.apple.mobilemail"] & 1) == 0)
  {
    if ([v5 isEqualToString:@"com.apple.MobileSMS"])
    {
      uint64_t v6 = 3;
      goto LABEL_23;
    }
    if ([v5 isEqualToString:@"com.apple.news"])
    {
      uint64_t v6 = 4;
      goto LABEL_23;
    }
    if ([v5 isEqualToString:@"com.apple.mobilenotes"])
    {
      uint64_t v6 = 5;
      goto LABEL_23;
    }
    if ([v5 isEqualToString:@"com.apple.parsecd"])
    {
      uint64_t v6 = 6;
      goto LABEL_23;
    }
    if ([v5 isEqualToString:@"com.apple.mobileslideshow"])
    {
      uint64_t v6 = 7;
      goto LABEL_23;
    }
    if ([v5 isEqualToString:@"com.apple.reminders"])
    {
      uint64_t v6 = 8;
      goto LABEL_23;
    }
    if ([v5 isEqualToString:@"com.apple.mobilesafari"])
    {
      uint64_t v6 = 9;
      goto LABEL_23;
    }
    if ([v5 isEqualToString:@"com.apple.siri"])
    {
      uint64_t v6 = 10;
      goto LABEL_23;
    }
    if (([v5 hasPrefix:@"com.apple."] & 1) == 0)
    {
      uint64_t v6 = 11;
      goto LABEL_23;
    }
LABEL_21:
    id v7 = 0;
    goto LABEL_24;
  }
  uint64_t v6 = 2;
LABEL_23:
  id v7 = v3[v6];
LABEL_24:

  v8 = hv_default_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v7 count];
    uint64_t v10 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218243;
    uint64_t v59 = v9;
    __int16 v60 = 2113;
    uint64_t v61 = v10;
    _os_log_impl(&dword_226C41000, v8, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: deleteContentWithRequest: consumer count: %tu request: %{private}@", buf, 0x16u);
  }

  v41 = v7;
  if (v7)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v7, "count", v7));
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v52 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          v18 = (void *)MEMORY[0x22A6667F0]();
          id v19 = (id)[v17 deleteDataDerivedFromContentMatchingRequest:*(void *)(a1 + 40)];
          v20 = [v17 consumerName];
          [v11 addObject:v20];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v51 objects:v57 count:16];
      }
      while (v14);
    }
  }
  else
  {
    v11 = 0;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v42 = v3;
  id v21 = v3[12];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v48 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v47 + 1) + 8 * j);
        v27 = (void *)MEMORY[0x22A6667F0]();
        v28 = [v26 consumerName];
        char v29 = [v11 containsObject:v28];

        if ((v29 & 1) == 0) {
          id v30 = (id)[v26 deleteDataDerivedFromContentMatchingRequest:*(void *)(a1 + 40)];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v47 objects:v56 count:16];
    }
    while (v23);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v31 = v42[13];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v44;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v44 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = *(void **)(*((void *)&v43 + 1) + 8 * k);
        v37 = (void *)MEMORY[0x22A6667F0]();
        v38 = [v36 consumerName];
        char v39 = [v11 containsObject:v38];

        if ((v39 & 1) == 0) {
          id v40 = (id)[v36 deleteDataDerivedFromContentMatchingRequest:*(void *)(a1 + 40)];
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v43 objects:v55 count:16];
    }
    while (v33);
  }
}

- (BOOL)deleteContentWithRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  locuint64_t k = self->_lock;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__HVConsumerCoordinator_deleteContentWithRequest_error___block_invoke;
  v9[3] = &unk_2647D5040;
  v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  [(_PASLock *)lock runWithLockAcquired:v9];

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingForLock, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_queues, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

- (id)statsWithError:(id *)a3
{
  id v4 = objc_opt_new();
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  locuint64_t k = self->_lock;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __40__HVConsumerCoordinator_statsWithError___block_invoke;
  v14[3] = &unk_2647D5040;
  v14[4] = self;
  id v6 = v4;
  id v15 = v6;
  [(_PASLock *)lock runWithLockAcquired:v14];
  id v7 = objc_opt_new();
  [v6 setObject:v7 forKeyedSubscript:@"Deferrals"];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __40__HVConsumerCoordinator_statsWithError___block_invoke_2;
  v12[3] = &unk_2647D5090;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  HVDataSourceRunBlockPerSetBit(-1, v12);
  uint64_t v9 = v13;
  id v10 = v8;

  return v10;
}

void __40__HVConsumerCoordinator_statsWithError___block_invoke(uint64_t a1, void *a2)
{
  v35[8] = *MEMORY[0x263EF8340];
  id v3 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  id v4 = (_DWORD *)*((void *)v3 + 1);
  if (v4)
  {
    id v5 = objc_opt_new();
    id v6 = +[HVPowerBudget defaultBudget];
    id v7 = [v6 throttlingState];
    [v5 setObject:v7 forKeyedSubscript:@"PowerBudget"];

    v34[0] = @"Allowed & Registered";
    int v8 = -[HVBudget sourcesFilteredByBudgetAndRegistrationsFromAvailableSources:levelOfService:](v4, -1, 1);
    char v29 = HVDataSourceDescription(v8);
    v35[0] = v29;
    v34[1] = @"Always Allow Override";
    v27 = HVDataSourceDescription(v4[2]);
    v35[1] = v27;
    v34[2] = @"Always Deny Override";
    uint64_t v9 = HVDataSourceDescription(v4[3]);
    v35[2] = v9;
    v34[3] = @"Realtime";
    id v10 = HVDataSourceDescription(v4[8]);
    v35[3] = v10;
    v34[4] = @"Periodic Background";
    v11 = HVDataSourceDescription(v4[5]);
    v35[4] = v11;
    v34[5] = @"Budgeted";
    id v12 = HVDataSourceDescription(v4[7]);
    v35[5] = v12;
    v34[6] = @"Delayed Budgeted";
    id v13 = HVDataSourceDescription(v4[6]);
    v35[6] = v13;
    v34[7] = @"No Service";
    uint64_t v14 = HVDataSourceDescription(v4[4]);
    v35[7] = v14;
    id v15 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:8];
    id v31 = v5;
    [v5 setObject:v15 forKeyedSubscript:@"Sources"];
  }
  else
  {
    id v31 = 0;
  }
  if (v31) {
    [*(id *)(a1 + 40) setObject:v31 forKeyedSubscript:@"Budget"];
  }
  v32[0] = @"Mail";
  id v30 = -[HVConsumerCoordinator _statsForConsumers:](*(void *)(a1 + 32), *((void **)v3 + 2));
  v33[0] = v30;
  v32[1] = @"Messages";
  v28 = -[HVConsumerCoordinator _statsForConsumers:](*(void *)(a1 + 32), *((void **)v3 + 3));
  v33[1] = v28;
  v32[2] = @"News";
  v26 = -[HVConsumerCoordinator _statsForConsumers:](*(void *)(a1 + 32), *((void **)v3 + 4));
  v33[2] = v26;
  v32[3] = @"Notes";
  v25 = -[HVConsumerCoordinator _statsForConsumers:](*(void *)(a1 + 32), *((void **)v3 + 5));
  v33[3] = v25;
  v32[4] = @"Parsec";
  uint64_t v24 = -[HVConsumerCoordinator _statsForConsumers:](*(void *)(a1 + 32), *((void **)v3 + 6));
  v33[4] = v24;
  v32[5] = @"Photos";
  v16 = -[HVConsumerCoordinator _statsForConsumers:](*(void *)(a1 + 32), *((void **)v3 + 7));
  v33[5] = v16;
  v32[6] = @"Reminders";
  v17 = -[HVConsumerCoordinator _statsForConsumers:](*(void *)(a1 + 32), *((void **)v3 + 8));
  v33[6] = v17;
  v32[7] = @"Safari";
  v18 = -[HVConsumerCoordinator _statsForConsumers:](*(void *)(a1 + 32), *((void **)v3 + 9));
  v33[7] = v18;
  v32[8] = @"Siri";
  id v19 = -[HVConsumerCoordinator _statsForConsumers:](*(void *)(a1 + 32), *((void **)v3 + 10));
  v33[8] = v19;
  v32[9] = @"ThirdPartyApp";
  v20 = -[HVConsumerCoordinator _statsForConsumers:](*(void *)(a1 + 32), *((void **)v3 + 11));
  v33[9] = v20;
  v32[10] = @"Interactions";
  id v21 = -[HVConsumerCoordinator _statsForConsumers:](*(void *)(a1 + 32), *((void **)v3 + 12));
  v33[10] = v21;
  v32[11] = @"UserActivities";
  uint64_t v22 = -[HVConsumerCoordinator _statsForConsumers:](*(void *)(a1 + 32), *((void **)v3 + 13));
  v33[11] = v22;
  uint64_t v23 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:12];
  [*(id *)(a1 + 40) setObject:v23 forKeyedSubscript:@"Consumers"];
}

void __40__HVConsumerCoordinator_statsWithError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = objc_opt_new();
  id v5 = [[HVDataSourceContentState alloc] initWithDataSource:a2 basePath:*(void *)(*(void *)(a1 + 32) + 32)];
  id v6 = [(HVDataSourceContentState *)v5 deferredContentStates];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__HVConsumerCoordinator_statsWithError___block_invoke_3;
  v10[3] = &unk_2647D5C50;
  id v11 = v4;
  id v7 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];

  int v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Deferrals"];
  uint64_t v9 = HVDataSourceDescription(a2);
  [v8 setObject:v7 forKeyedSubscript:v9];
}

void __40__HVConsumerCoordinator_statsWithError___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v13[2] = *MEMORY[0x263EF8340];
  v12[0] = @"Level of Service";
  id v5 = NSNumber;
  id v6 = a3;
  id v7 = a2;
  int v8 = objc_msgSend(v5, "numberWithUnsignedChar:", objc_msgSend(v6, "levelOfService"));
  v12[1] = @"Consumers";
  v13[0] = v8;
  uint64_t v9 = [v6 consumers];

  id v10 = [v9 allObjects];
  v13[1] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v7];
}

- (id)_statsForConsumers:(uint64_t)a1
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v20 = v3;
  if (a1)
  {
    id v4 = v3;
    id v21 = (id)objc_opt_new();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v5 = v4;
    uint64_t v24 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v24)
    {
      uint64_t v6 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v26 != v6) {
            objc_enumerationMutation(v5);
          }
          int v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v9 = [v8 consumerName];
          uint64_t v10 = [v5 objectForKey:v8];
          id v11 = (unsigned int *)v10;
          if (v8) {
            BOOL v12 = v10 == 0;
          }
          else {
            BOOL v12 = 1;
          }
          if (v12)
          {
            v18 = hv_default_log_handle();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v8;
              _os_log_error_impl(&dword_226C41000, v18, OS_LOG_TYPE_ERROR, "HVConsumerCoordinator: _statsForConsumers failed for %@", (uint8_t *)&buf, 0xCu);
            }
          }
          else
          {
            v30[0] = @"Level of Service";
            uint64_t v22 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v10 + 8)];
            *(void *)&long long buf = v22;
            v30[1] = @"Documents Consumed";
            id v13 = [NSNumber numberWithUnsignedInt:v11[3]];
            *((void *)&buf + 1) = v13;
            v30[2] = @"Documents Ignored";
            uint64_t v14 = [NSNumber numberWithUnsignedInt:v11[4]];
            uint64_t v32 = v14;
            v30[3] = @"Number of Extractions";
            [NSNumber numberWithUnsignedInt:v11[5]];
            id v15 = v23 = v9;
            uint64_t v33 = v15;
            v30[4] = @"Number of Interruptions";
            v16 = [NSNumber numberWithUnsignedInt:v11[6]];
            uint64_t v34 = v16;
            v30[5] = @"Errors Reported";
            v17 = [NSNumber numberWithUnsignedInt:v11[7]];
            v35 = v17;
            v18 = [NSDictionary dictionaryWithObjects:&buf forKeys:v30 count:6];

            uint64_t v9 = v23;
            [v21 setObject:v18 forKeyedSubscript:v23];
          }
        }
        uint64_t v24 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v24);
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (BOOL)registerNotificationsConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  locuint64_t k = self->_lock;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__HVConsumerCoordinator_registerNotificationsConsumer_levelOfService___block_invoke;
  v10[3] = &unk_2647D5068;
  void v10[4] = self;
  id v11 = v6;
  unsigned __int8 v12 = a4;
  id v8 = v6;
  [(_PASLock *)lock runWithLockAcquired:v10];

  return 1;
}

void __70__HVConsumerCoordinator_registerNotificationsConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  id v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 14);
  -[HVBudget registerLevelOfService:oneDataSource:](*((int8x16_t **)v4 + 1), *(unsigned __int8 *)(a1 + 48), 0x4000);
  id v5 = (int8x16_t *)*((void *)v4 + 1);

  unsigned int v6 = *(unsigned __int8 *)(a1 + 48);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, v6, 0x8000);
}

- (void)_registerConsumer:(uint64_t)a3 levelOfService:(id *)a4 consumerMapTableOut:
{
  id v7 = a2;
  if (a1)
  {
    id v12 = v7;
    if (!a4)
    {
      id v11 = [MEMORY[0x263F08690] currentHandler];
      [v11 handleFailureInMethod:sel__registerConsumer_levelOfService_consumerMapTableOut_, a1, @"HVConsumerCoordinator.m", 881, @"Invalid parameter not satisfying: %@", @"consumerMapTableOut" object file lineNumber description];
    }
    if (!*a4)
    {
      uint64_t v8 = [MEMORY[0x263F08968] mapTableWithKeyOptions:5 valueOptions:0];
      id v9 = *a4;
      *a4 = (id)v8;
    }
    uint64_t v10 = objc_opt_new();
    [v10 setLevelOfService:a3];
    [*a4 setObject:v10 forKey:v12];

    id v7 = v12;
  }
}

- (BOOL)registerUserActivityConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  locuint64_t k = self->_lock;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__HVConsumerCoordinator_registerUserActivityConsumer_levelOfService___block_invoke;
  v10[3] = &unk_2647D5068;
  void v10[4] = self;
  id v11 = v6;
  unsigned __int8 v12 = a4;
  id v8 = v6;
  [(_PASLock *)lock runWithLockAcquired:v10];

  return 1;
}

void __69__HVConsumerCoordinator_registerUserActivityConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  id v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 13);
  -[HVBudget registerLevelOfService:oneDataSource:](*((int8x16_t **)v4 + 1), *(unsigned __int8 *)(a1 + 48), 4096);
  id v5 = (int8x16_t *)*((void *)v4 + 1);

  unsigned int v6 = *(unsigned __int8 *)(a1 + 48);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, v6, 0x2000);
}

- (BOOL)registerInteractionConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  locuint64_t k = self->_lock;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__HVConsumerCoordinator_registerInteractionConsumer_levelOfService___block_invoke;
  v10[3] = &unk_2647D5068;
  void v10[4] = self;
  id v11 = v6;
  unsigned __int8 v12 = a4;
  id v8 = v6;
  [(_PASLock *)lock runWithLockAcquired:v10];

  return 1;
}

void __68__HVConsumerCoordinator_registerInteractionConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  id v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 12);
  id v5 = (int8x16_t *)*((void *)v4 + 1);

  unsigned int v6 = *(unsigned __int8 *)(a1 + 48);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, v6, 2048);
}

- (BOOL)registerThirdPartyAppConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  locuint64_t k = self->_lock;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__HVConsumerCoordinator_registerThirdPartyAppConsumer_levelOfService___block_invoke;
  v10[3] = &unk_2647D5068;
  void v10[4] = self;
  id v11 = v6;
  unsigned __int8 v12 = a4;
  id v8 = v6;
  [(_PASLock *)lock runWithLockAcquired:v10];

  return 1;
}

void __70__HVConsumerCoordinator_registerThirdPartyAppConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  id v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 11);
  id v5 = (int8x16_t *)*((void *)v4 + 1);

  unsigned int v6 = *(unsigned __int8 *)(a1 + 48);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, v6, 1024);
}

- (BOOL)registerSiriConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  locuint64_t k = self->_lock;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__HVConsumerCoordinator_registerSiriConsumer_levelOfService___block_invoke;
  v10[3] = &unk_2647D5068;
  void v10[4] = self;
  id v11 = v6;
  unsigned __int8 v12 = a4;
  id v8 = v6;
  [(_PASLock *)lock runWithLockAcquired:v10];

  return 1;
}

void __61__HVConsumerCoordinator_registerSiriConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  id v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 10);
  id v5 = (int8x16_t *)*((void *)v4 + 1);

  unsigned int v6 = *(unsigned __int8 *)(a1 + 48);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, v6, 512);
}

- (BOOL)registerSafariConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  locuint64_t k = self->_lock;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__HVConsumerCoordinator_registerSafariConsumer_levelOfService___block_invoke;
  v10[3] = &unk_2647D5068;
  void v10[4] = self;
  id v11 = v6;
  unsigned __int8 v12 = a4;
  id v8 = v6;
  [(_PASLock *)lock runWithLockAcquired:v10];

  return 1;
}

void __63__HVConsumerCoordinator_registerSafariConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  id v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 9);
  id v5 = (int8x16_t *)*((void *)v4 + 1);

  unsigned int v6 = *(unsigned __int8 *)(a1 + 48);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, v6, 256);
}

- (BOOL)registerRemindersConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  locuint64_t k = self->_lock;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__HVConsumerCoordinator_registerRemindersConsumer_levelOfService___block_invoke;
  v10[3] = &unk_2647D5068;
  void v10[4] = self;
  id v11 = v6;
  unsigned __int8 v12 = a4;
  id v8 = v6;
  [(_PASLock *)lock runWithLockAcquired:v10];

  return 1;
}

void __66__HVConsumerCoordinator_registerRemindersConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  id v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 8);
  id v5 = (int8x16_t *)*((void *)v4 + 1);

  unsigned int v6 = *(unsigned __int8 *)(a1 + 48);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, v6, 128);
}

- (BOOL)registerPhotosConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  locuint64_t k = self->_lock;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__HVConsumerCoordinator_registerPhotosConsumer_levelOfService___block_invoke;
  v10[3] = &unk_2647D5068;
  void v10[4] = self;
  id v11 = v6;
  unsigned __int8 v12 = a4;
  id v8 = v6;
  [(_PASLock *)lock runWithLockAcquired:v10];

  return 1;
}

void __63__HVConsumerCoordinator_registerPhotosConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  id v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 7);
  -[HVBudget registerLevelOfService:oneDataSource:](*((int8x16_t **)v4 + 1), *(unsigned __int8 *)(a1 + 48), 32);
  id v5 = (int8x16_t *)*((void *)v4 + 1);

  unsigned int v6 = *(unsigned __int8 *)(a1 + 48);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, v6, 64);
}

- (BOOL)registerParsecConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  locuint64_t k = self->_lock;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__HVConsumerCoordinator_registerParsecConsumer_levelOfService___block_invoke;
  v10[3] = &unk_2647D5068;
  void v10[4] = self;
  id v11 = v6;
  unsigned __int8 v12 = a4;
  id v8 = v6;
  [(_PASLock *)lock runWithLockAcquired:v10];

  return 1;
}

void __63__HVConsumerCoordinator_registerParsecConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  id v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 6);
  id v5 = (int8x16_t *)*((void *)v4 + 1);

  unsigned int v6 = *(unsigned __int8 *)(a1 + 48);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, v6, 16);
}

- (BOOL)registerNotesConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  locuint64_t k = self->_lock;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__HVConsumerCoordinator_registerNotesConsumer_levelOfService___block_invoke;
  v10[3] = &unk_2647D5068;
  void v10[4] = self;
  id v11 = v6;
  unsigned __int8 v12 = a4;
  id v8 = v6;
  [(_PASLock *)lock runWithLockAcquired:v10];

  return 1;
}

void __62__HVConsumerCoordinator_registerNotesConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  id v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 5);
  id v5 = (int8x16_t *)*((void *)v4 + 1);

  unsigned int v6 = *(unsigned __int8 *)(a1 + 48);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, v6, 8);
}

- (BOOL)registerNewsConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  locuint64_t k = self->_lock;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__HVConsumerCoordinator_registerNewsConsumer_levelOfService___block_invoke;
  v10[3] = &unk_2647D5068;
  void v10[4] = self;
  id v11 = v6;
  unsigned __int8 v12 = a4;
  id v8 = v6;
  [(_PASLock *)lock runWithLockAcquired:v10];

  return 1;
}

void __61__HVConsumerCoordinator_registerNewsConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  id v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 4);
  id v5 = (int8x16_t *)*((void *)v4 + 1);

  unsigned int v6 = *(unsigned __int8 *)(a1 + 48);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, v6, 4);
}

- (BOOL)registerMessagesConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  locuint64_t k = self->_lock;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__HVConsumerCoordinator_registerMessagesConsumer_levelOfService___block_invoke;
  v10[3] = &unk_2647D5068;
  void v10[4] = self;
  id v11 = v6;
  unsigned __int8 v12 = a4;
  id v8 = v6;
  [(_PASLock *)lock runWithLockAcquired:v10];

  return 1;
}

void __65__HVConsumerCoordinator_registerMessagesConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  id v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 3);
  id v5 = (int8x16_t *)*((void *)v4 + 1);

  unsigned int v6 = *(unsigned __int8 *)(a1 + 48);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, v6, 2);
}

- (BOOL)registerMailConsumer:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6 = a3;
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  locuint64_t k = self->_lock;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__HVConsumerCoordinator_registerMailConsumer_levelOfService___block_invoke;
  v10[3] = &unk_2647D5068;
  void v10[4] = self;
  id v11 = v6;
  unsigned __int8 v12 = a4;
  id v8 = v6;
  [(_PASLock *)lock runWithLockAcquired:v10];

  return 1;
}

void __61__HVConsumerCoordinator_registerMailConsumer_levelOfService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  id v4 = a2;
  dispatch_group_leave(v3);
  -[HVConsumerCoordinator _registerConsumer:levelOfService:consumerMapTableOut:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (id *)v4 + 2);
  id v5 = (int8x16_t *)*((void *)v4 + 1);

  unsigned int v6 = *(unsigned __int8 *)(a1 + 48);

  -[HVBudget registerLevelOfService:oneDataSource:](v5, v6, 1);
}

- (void)restoreConsumptionOfDataSources:(unsigned int)a3
{
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  locuint64_t k = self->_lock;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__HVConsumerCoordinator_restoreConsumptionOfDataSources___block_invoke;
  v6[3] = &unk_2647D5018;
  v6[4] = self;
  unsigned int v7 = a3;
  [(_PASLock *)lock runWithLockAcquired:v6];
}

void __57__HVConsumerCoordinator_restoreConsumptionOfDataSources___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  id v4 = a2;
  dispatch_group_leave(v3);
  id v5 = hv_default_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = HVDataSourceDescription(*(_DWORD *)(a1 + 40));
    int v11 = 138543362;
    unsigned __int8 v12 = v6;
    _os_log_impl(&dword_226C41000, v5, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: restoreConsumptionOfDataSources: %{public}@", (uint8_t *)&v11, 0xCu);
  }
  unsigned int v7 = (int8x8_t *)v4[1];

  if (v7)
  {
    v7[1] = vand_s8(v7[1], (int8x8_t)vdup_n_s32(~*(_DWORD *)(a1 + 40)));
    id v8 = hv_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = -[HVBudget sourcesFilteredByBudgetAndRegistrationsFromAvailableSources:levelOfService:](v7, -1, 1);
      uint64_t v10 = HVDataSourceDescription(v9);
      int v11 = 138412290;
      unsigned __int8 v12 = v10;
      _os_log_impl(&dword_226C41000, v8, OS_LOG_TYPE_DEFAULT, "HVBudget: Sources With Budget And Consumers Available: %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)disableConsumptionOfDataSources:(unsigned int)a3
{
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  locuint64_t k = self->_lock;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__HVConsumerCoordinator_disableConsumptionOfDataSources___block_invoke;
  v6[3] = &unk_2647D5018;
  v6[4] = self;
  unsigned int v7 = a3;
  [(_PASLock *)lock runWithLockAcquired:v6];
}

void __57__HVConsumerCoordinator_disableConsumptionOfDataSources___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  id v4 = a2;
  dispatch_group_leave(v3);
  id v5 = hv_default_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = HVDataSourceDescription(*(_DWORD *)(a1 + 40));
    int v14 = 138543362;
    id v15 = v6;
    _os_log_impl(&dword_226C41000, v5, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: disableConsumptionOfDataSources: %{public}@", (uint8_t *)&v14, 0xCu);
  }
  unsigned int v7 = (_DWORD *)v4[1];

  if (v7)
  {
    int v8 = *(_DWORD *)(a1 + 40);
    int v9 = v7[2] & ~v8;
    int v10 = v7[3] | v8;
    v7[2] = v9;
    v7[3] = v10;
    int v11 = hv_default_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = -[HVBudget sourcesFilteredByBudgetAndRegistrationsFromAvailableSources:levelOfService:](v7, -1, 1);
      uint64_t v13 = HVDataSourceDescription(v12);
      int v14 = 138412290;
      id v15 = v13;
      _os_log_impl(&dword_226C41000, v11, OS_LOG_TYPE_DEFAULT, "HVBudget: Sources With Budget And Consumers Available: %@", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)enableConsumptionOfDataSources:(unsigned int)a3
{
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  locuint64_t k = self->_lock;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__HVConsumerCoordinator_enableConsumptionOfDataSources___block_invoke;
  v6[3] = &unk_2647D5018;
  v6[4] = self;
  unsigned int v7 = a3;
  [(_PASLock *)lock runWithLockAcquired:v6];
}

void __56__HVConsumerCoordinator_enableConsumptionOfDataSources___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  id v4 = a2;
  dispatch_group_leave(v3);
  id v5 = hv_default_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = HVDataSourceDescription(*(_DWORD *)(a1 + 40));
    int v13 = 138543362;
    int v14 = v6;
    _os_log_impl(&dword_226C41000, v5, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: enableConsumptionOfDataSources: %{public}@", (uint8_t *)&v13, 0xCu);
  }
  unsigned int v7 = (_DWORD *)v4[1];

  if (v7)
  {
    int v8 = *(_DWORD *)(a1 + 40);
    int v9 = v7[3] & ~v8;
    v7[2] |= v8;
    v7[3] = v9;
    int v10 = hv_default_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = -[HVBudget sourcesFilteredByBudgetAndRegistrationsFromAvailableSources:levelOfService:](v7, -1, 1);
      int v12 = HVDataSourceDescription(v11);
      int v13 = 138412290;
      int v14 = v12;
      _os_log_impl(&dword_226C41000, v10, OS_LOG_TYPE_DEFAULT, "HVBudget: Sources With Budget And Consumers Available: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (BOOL)harvestContentWithMinimumLevelOfService:(unsigned __int8)a3 ignoringDiscretionaryPowerBudget:(BOOL)a4 error:(id *)a5 shouldContinueBlock:(id)a6
{
  int v7 = a3;
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v21 = (uint64_t (**)(void))a6;
  int v9 = hv_default_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v7;
    _os_log_impl(&dword_226C41000, v9, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: harvestContentWithMinimumLevelOfService: %u", buf, 8u);
  }

  if (((unsigned int (*)(void))v21[2])())
  {
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    char v44 = 0;
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2020000000;
    char v40 = 0;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __124__HVConsumerCoordinator_harvestContentWithMinimumLevelOfService_ignoringDiscretionaryPowerBudget_error_shouldContinueBlock___block_invoke;
    v33[3] = &unk_2647D4F78;
    v35 = &v41;
    uint64_t v36 = &v37;
    int v10 = v21;
    v33[4] = self;
    id v34 = v10;
    int v11 = (void *)MEMORY[0x22A6669E0](v33);
    uint64_t v29 = 0;
    id v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 1;
    *(void *)long long buf = 0;
    long long v46 = buf;
    uint64_t v47 = 0x3032000000;
    long long v48 = __Block_byref_object_copy__730;
    long long v49 = __Block_byref_object_dispose__731;
    id v50 = 0;
    do
    {
      while (!*((unsigned char *)v38 + 24))
      {
        if (!*((unsigned char *)v42 + 24))
        {
          *((unsigned char *)v38 + 24) = 0;
          locuint64_t k = self->_lock;
          v22[0] = MEMORY[0x263EF8330];
          v22[1] = 3221225472;
          v22[2] = __124__HVConsumerCoordinator_harvestContentWithMinimumLevelOfService_ignoringDiscretionaryPowerBudget_error_shouldContinueBlock___block_invoke_111;
          v22[3] = &unk_2647D4FA0;
          BOOL v26 = a4;
          char v27 = v7;
          uint64_t v24 = &v29;
          v22[4] = self;
          id v23 = v11;
          long long v25 = buf;
          [(_PASLock *)lock runWithLockAcquired:v22 shouldContinueBlock:v23];

          if (!*((unsigned char *)v42 + 24))
          {
            if (*((unsigned char *)v38 + 24)) {
              continue;
            }
          }
        }
        goto LABEL_15;
      }
      int v12 = hv_default_log_handle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long v28 = 0;
        _os_log_debug_impl(&dword_226C41000, v12, OS_LOG_TYPE_DEBUG, "HVConsumerCoordinator: harvestContentWithMinimumLevelOfService waiting for lock contention to subside...", v28, 2u);
      }

      waitingForLocuint64_t k = self->_waitingForLock;
      dispatch_time_t v14 = dispatch_time(0, 1000000000);
      BOOL v15 = dispatch_group_wait(waitingForLock, v14) != 0;
      *((unsigned char *)v38 + 24) = v15;
    }
    while ((v21[2](v10) & 1) != 0);
    *((unsigned char *)v42 + 24) = 1;
LABEL_15:
    int v18 = *((unsigned __int8 *)v30 + 24);
    if (a5 && !*((unsigned char *)v30 + 24))
    {
      *a5 = *((id *)v46 + 5);
      int v18 = *((unsigned __int8 *)v30 + 24);
    }
    BOOL v17 = v18 != 0;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v41, 8);
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

uint64_t __124__HVConsumerCoordinator_harvestContentWithMinimumLevelOfService_ignoringDiscretionaryPowerBudget_error_shouldContinueBlock___block_invoke(void *a1)
{
  v1 = a1 + 6;
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    id v3 = a1 + 7;
    if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
    {
      if ((*(uint64_t (**)(void))(a1[5] + 16))())
      {
        if (!dispatch_group_wait(*(dispatch_group_t *)(a1[4] + 40), 0)) {
          return 1;
        }
        id v5 = hv_default_log_handle();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)unsigned int v6 = 0;
          _os_log_impl(&dword_226C41000, v5, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: harvestContentWithMinimumLevelOfService interruptedByLockContention, will unlock to let other threads use the lock for a bit", v6, 2u);
        }
        v1 = v3;
      }
      else
      {
        id v5 = hv_default_log_handle();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_226C41000, v5, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: harvestContentWithMinimumLevelOfService shouldContinueBlock returned NO", buf, 2u);
        }
      }

      uint64_t result = 0;
      *(unsigned char *)(*(void *)(*v1 + 8) + 24) = 1;
      return result;
    }
  }
  return 0;
}

void __124__HVConsumerCoordinator_harvestContentWithMinimumLevelOfService_ignoringDiscretionaryPowerBudget_error_shouldContinueBlock___block_invoke_111(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (!*(unsigned char *)(a1 + 64)) {
    goto LABEL_4;
  }
  id v5 = v3[1];
  if (v5)
  {
    if (*((unsigned char *)v5 + 40))
    {
LABEL_4:
      int v6 = 0;
      goto LABEL_6;
    }
    int v6 = 1;
    *((unsigned char *)v5 + 40) = 1;
  }
  else
  {
    int v6 = 1;
  }
LABEL_6:
  int v7 = hv_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl(&dword_226C41000, v7, OS_LOG_TYPE_DEBUG, "HVConsumerCoordinator: harvestContentWithMinimumLevelOfService acquired lock", buf, 2u);
  }

  unsigned int v8 = -[HVBudget sourcesFilteredByBudgetAndRegistrationsFromAvailableSources:levelOfService:](v4[1], -1, *(unsigned __int8 *)(a1 + 65));
  if (*(unsigned char *)(a1 + 65) == 1)
  {
    int v9 = v4[1];
    if (v9) {
      int v10 = ~v9[3];
    }
    else {
      int v10 = 0;
    }
  }
  else
  {
    int v10 = v8;
  }
  int v11 = hv_default_log_handle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = HVDataSourceDescription(v10);
    *(_DWORD *)long long buf = 138543362;
    uint64_t v24 = v12;
    _os_log_impl(&dword_226C41000, v11, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: harvestContentWithMinimumLevelOfService: sources after applying budget: %{public}@", buf, 0xCu);
  }
  int v13 = *(unsigned __int8 *)(a1 + 65);
  uint64_t v14 = *(void *)(a1 + 32);
  BOOL v15 = *(void **)(a1 + 40);
  uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
  id v19 = *(void **)(v16 + 40);
  int v18 = (id *)(v16 + 40);
  id v17 = v19;
  obuint64_t j = v19;
  if (v14)
  {
    BOOL v20 = -[HVConsumerCoordinator _consumeContentFromAllDataSources:minimumLevelOfService:inMemoryItemsOnly:guardedData:shouldContinueBlock:error:](v14, v10, v13, 0, v4, v15, &obj);
    id v17 = obj;
  }
  else
  {
    BOOL v20 = 0;
  }
  objc_storeStrong(v18, v17);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v20;
  if (v6)
  {
    id v21 = v4[1];
    if (v21) {
      *((unsigned char *)v21 + 40) = 0;
    }
  }
}

- (BOOL)_consumeContentFromAllDataSources:(int)a3 minimumLevelOfService:(char)a4 inMemoryItemsOnly:(void *)a5 guardedData:(void *)a6 shouldContinueBlock:(void *)a7 error:
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v13 = a5;
  id v14 = a6;
  BOOL v15 = hv_default_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = HVDataSourceDescription(a2);
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a3;
    _os_log_impl(&dword_226C41000, v15, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: consumeContentFromDataSources: %{public}@ with minimum LoS %hhu", buf, 0x12u);
  }
  BOOL v18 = a3 != 1 || v14 == 0;
  uint64_t v45 = 0;
  long long v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 1;
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  long long v52 = __Block_byref_object_copy__730;
  long long v53 = __Block_byref_object_dispose__731;
  id v54 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  int v44 = 0;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __137__HVConsumerCoordinator__consumeContentFromAllDataSources_minimumLevelOfService_inMemoryItemsOnly_guardedData_shouldContinueBlock_error___block_invoke;
  v30[3] = &unk_2647D4FF0;
  char v38 = a3;
  BOOL v39 = v18;
  id v19 = v13;
  int v37 = a2;
  id v31 = v19;
  uint64_t v32 = a1;
  char v40 = a4;
  id v20 = v14;
  id v33 = v20;
  id v34 = &v41;
  v35 = buf;
  uint64_t v36 = &v45;
  HVDataSourceRunBlockPerSetBit(a2, v30);
  if (a7)
  {
    id v21 = *(void **)(*(void *)&buf[8] + 40);
    if (v21) {
      *a7 = v21;
    }
  }
  uint64_t v22 = *(void **)(a1 + 24);
  uint64_t v23 = *((unsigned int *)v42 + 6);
  id v29 = 0;
  char v24 = [v22 dequeuedContentConsumedForDataSources:v23 withError:&v29];
  id v25 = v29;
  if (v24)
  {
    BOOL v26 = *((unsigned char *)v46 + 24) != 0;
  }
  else
  {
    char v27 = hv_default_log_handle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long v49 = 138412290;
      id v50 = v25;
      _os_log_fault_impl(&dword_226C41000, v27, OS_LOG_TYPE_FAULT, "HVConsumerCoordinator: _consumeContentWithGuardedData: consumptionCompletedWithError: %@", v49, 0xCu);
    }

    BOOL v26 = 0;
    if (a7) {
      *a7 = v25;
    }
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v45, 8);
  return v26;
}

void __137__HVConsumerCoordinator__consumeContentFromAllDataSources_minimumLevelOfService_inMemoryItemsOnly_guardedData_shouldContinueBlock_error___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v6 = *(unsigned __int8 *)(a1 + 84);
  int v7 = *(unsigned __int8 *)(a1 + 85);
  v19[0] = MEMORY[0x263EF8330];
  int v8 = *(_DWORD *)(a1 + 80);
  char v9 = *(unsigned char *)(a1 + 86);
  int8x16_t v18 = *(int8x16_t *)(a1 + 32);
  uint64_t v10 = *(void *)(v18.i64[0] + 8);
  v19[1] = 3221225472;
  id v20 = __137__HVConsumerCoordinator__consumeContentFromAllDataSources_minimumLevelOfService_inMemoryItemsOnly_guardedData_shouldContinueBlock_error___block_invoke_2;
  id v21 = &unk_2647D4FC8;
  char v30 = v6;
  char v24 = &v32;
  int v28 = v8;
  int v29 = a2;
  char v31 = v9;
  id v11 = (id)v18.i64[0];
  int8x16_t v22 = vextq_s8(v18, v18, 8uLL);
  id v23 = *(id *)(a1 + 48);
  long long v25 = *(_OWORD *)(a1 + 56);
  uint64_t v26 = *(void *)(a1 + 72);
  uint64_t v27 = a3;
  int v12 = v19;
  id v13 = v12;
  if (v10)
  {
    if ((*(_DWORD *)(v10 + 8) & a2) != 0)
    {
      v20((uint64_t)v12, v6);
    }
    else if (!v7 {
           || -[HVBudget sourcesFilteredByBudgetAndRegistrationsFromAvailableSources:levelOfService:]((_DWORD *)v10, a2, v6) == a2)
    }
    {
      int v14 = *(unsigned __int8 *)(v10 + 40);
      BOOL v15 = (void *)MEMORY[0x22A6667F0]();
      if (v14)
      {
        v20((uint64_t)v13, v6);
      }
      else
      {
        uint64_t v16 = +[HVPowerBudget defaultBudget];
        v44[0] = MEMORY[0x263EF8330];
        v44[1] = 3221225472;
        v44[2] = __82__HVBudget_performWorkForOneDataSource_levelOfService_requireRegistrations_block___block_invoke;
        v44[3] = &unk_2647D5B40;
        uint64_t v45 = v13;
        char v46 = v6;
        *(void *)long long buf = MEMORY[0x263EF8330];
        uint64_t v37 = 3221225472;
        char v38 = __82__HVBudget_performWorkForOneDataSource_levelOfService_requireRegistrations_block___block_invoke_2;
        BOOL v39 = &unk_2647D5B68;
        uint64_t v40 = v10;
        int v42 = a2;
        uint64_t v41 = v45;
        char v43 = v6;
        [v16 doDiscretionaryWork:v44 orElse:buf];
      }
    }
  }

  if (!*((unsigned char *)v33 + 24))
  {
    id v17 = hv_default_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_226C41000, v17, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: consumeAllContentFromAllDataSources: Did not perform work", buf, 2u);
    }
  }
  _Block_object_dispose(&v32, 8);
}

void __137__HVConsumerCoordinator__consumeContentFromAllDataSources_minimumLevelOfService_inMemoryItemsOnly_guardedData_shouldContinueBlock_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v171 = *MEMORY[0x263EF8340];
  id v4 = hv_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HVDataSourceDescription(*(_DWORD *)(a1 + 96));
    int v6 = *(unsigned __int8 *)(a1 + 104);
    *(_DWORD *)long long buf = 67109634;
    *(_DWORD *)v165 = a2;
    *(_WORD *)&v165[4] = 2114;
    *(void *)&v165[6] = v5;
    *(_WORD *)&v165[14] = 1024;
    *(_DWORD *)&v165[16] = v6;
    _os_log_impl(&dword_226C41000, v4, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: consumeContentFromDataSources: effective LoS %hhu for %{public}@ with minimum LoS %hhu", buf, 0x18u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  uint64_t v7 = *(unsigned int *)(a1 + 100);
  int v123 = *(unsigned __int8 *)(a1 + 105);
  int v8 = *(void **)(a1 + 32);
  char v9 = *(void **)(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  v132 = v9;
  if (!v8)
  {

    id v104 = 0;
LABEL_142:
    id v105 = v104;
LABEL_166:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v105);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
    goto LABEL_167;
  }
  v124 = -[HVConsumerCoordinator _consumersForOneDataSource:guardedData:](v8, v7, v10);
  if ((int)v7 > 255)
  {
    if ((int)v7 > 4095)
    {
      if ((int)v7 >= 0x4000)
      {
        if (v7 == 0x4000)
        {
          id v11 = &selRef_consumeNotificationsWithContext_;
        }
        else
        {
          if (v7 != 0x8000) {
            goto LABEL_139;
          }
          id v11 = &selRef_consumeNotificationStackWithContext_;
        }
      }
      else if (v7 == 4096)
      {
        id v11 = &selRef_consumeUserActivityMetadataWithContext_;
      }
      else
      {
        if (v7 != 0x2000) {
          goto LABEL_139;
        }
        id v11 = &selRef_consumeSearchableUserActivityWithContext_;
      }
    }
    else if ((int)v7 > 1023)
    {
      if (v7 == 1024)
      {
        id v11 = &selRef_consumeThirdPartyAppContentWithContext_;
      }
      else
      {
        if (v7 != 2048) {
          goto LABEL_139;
        }
        id v11 = &selRef_consumeInteractionWithContext_;
      }
    }
    else
    {
      if (v7 != 256)
      {
        if (v7 == 512)
        {
          id v11 = &selRef_consumeSiriQueriesWithContext_;
          goto LABEL_38;
        }
        goto LABEL_139;
      }
      id v11 = &selRef_consumeSafariContentWithContext_;
    }
  }
  else
  {
    if ((int)v7 <= 15)
    {
      id v11 = &selRef_consumeMailContentWithContext_;
      switch((int)v7)
      {
        case 1:
          goto LABEL_38;
        case 2:
          id v11 = &selRef_consumeMessagesContentWithContext_;
          goto LABEL_38;
        case 4:
          id v11 = &selRef_consumeNewsArticleViewsWithContext_;
          goto LABEL_38;
        case 8:
          id v11 = &selRef_consumeNotesContentWithContext_;
          goto LABEL_38;
        default:
          goto LABEL_139;
      }
    }
    if ((int)v7 > 63)
    {
      if (v7 == 64)
      {
        id v11 = &selRef_consumePhotosKnowledgeGraphWithContext_;
      }
      else
      {
        if (v7 != 128) {
          goto LABEL_139;
        }
        id v11 = &selRef_consumeRemindersContentWithContext_;
      }
    }
    else
    {
      if (v7 != 16)
      {
        if (v7 == 32)
        {
          id v11 = &selRef_consumePhotosPhotoViewsWithContext_;
          goto LABEL_38;
        }
LABEL_139:
        v103 = hv_default_log_handle();
        if (os_log_type_enabled(v103, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)long long buf = 67109120;
          *(_DWORD *)v165 = v7;
          _os_log_fault_impl(&dword_226C41000, v103, OS_LOG_TYPE_FAULT, "HVConsumerCoordinator: _consumeAllContentFromOneDataSource: unknown datasource value: %u", buf, 8u);
        }

        id v104 = [MEMORY[0x263F087E8] errorWithDomain:@"HVErrorDomain" code:11 userInfo:0];

        goto LABEL_142;
      }
      id v11 = &selRef_consumeParsecSearchesWithContext_;
    }
  }
LABEL_38:
  v125 = *v11;
  if (!*v11) {
    goto LABEL_139;
  }
  uint64_t v120 = a1;
  v121 = [[HVDataSourceContentState alloc] initWithDataSource:v7 basePath:v8[4]];
  id v12 = 0;
  char v128 = 1;
  unsigned int v137 = a2;
  unsigned int v138 = v7;
  v135 = v8;
  v129 = v10;
  do
  {
    v126 = v12;
    v127 = (void *)MEMORY[0x22A6667F0]();
    id v13 = v121;
    id v131 = v10;
    int v14 = v132;
    id v133 = v124;
    v134 = v13;
    id v160 = 0;
    v161 = 0;
    BOOL v15 = (void *)v8[3];
    id v159 = 0;
    char v16 = [v15 dequeueContent:&v161 contentProtection:&v160 dataSource:v7 dataSourceContentState:v13 minimumLevelOfService:a2 inMemoryItemsOnly:v123 != 0 error:&v159];
    id v17 = v159;
    v130 = v14;
    if ((v16 & 1) == 0)
    {
      long long v25 = hv_default_log_handle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)v165 = v17;
        _os_log_error_impl(&dword_226C41000, v25, OS_LOG_TYPE_ERROR, "HVConsumerCoordinator: _consumeOneContentFromOneDataSource: dequeueContent error: %@", buf, 0xCu);
      }

      id v26 = v17;
      int v27 = 0;
      v167[0] = 0;
      int v28 = 1;
      id v17 = v26;
      goto LABEL_113;
    }
    if (!v161)
    {
      int v29 = hv_default_log_handle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_226C41000, v29, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: _consumeOneContentFromOneDataSource: no content available", buf, 2u);
      }

      int v27 = 0;
      id v26 = 0;
      int v28 = 1;
      v167[0] = 1;
      goto LABEL_113;
    }
    int8x16_t v18 = [HVConsumptionContext alloc];
    v142 = [(HVConsumptionContext *)v18 initWithContent:v161 contentProtection:v160 scheduledTaskShouldContinueBlock:v14];
    uint64_t v19 = HVDataSourceContentStateKey(v7, v161);
    id v20 = [(HVDataSourceContentState *)v13 deferredContentStates];
    v122 = (void *)v19;
    id v21 = [v20 objectForKeyedSubscript:v19];
    int8x16_t v22 = (void *)[v21 mutableCopy];
    id v23 = v22;
    if (v22)
    {
      char v24 = v22;
    }
    else
    {
      id v30 = v17;
      char v31 = [HVMutableContentState alloc];
      uint64_t v32 = [MEMORY[0x263EFFA08] set];
      id v33 = v31;
      id v17 = v30;
      char v24 = [(HVMutableContentState *)v33 initWithConsumers:v32 levelOfService:a2];
    }
    unsigned int v34 = [(HVContentState *)v24 levelOfService];
    if (v34 >= a2) {
      uint64_t v35 = a2;
    }
    else {
      uint64_t v35 = v34;
    }
    [(HVMutableContentState *)v24 setLevelOfService:v35];
    uint64_t v36 = [(HVDataSourceContentState *)v134 deferredContentStates];
    [v36 setObject:0 forKeyedSubscript:v122];

    uint64_t v37 = hv_default_log_handle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)v165 = v142;
      *(_WORD *)&v165[8] = 2112;
      *(void *)&v165[10] = v124;
      _os_log_impl(&dword_226C41000, v37, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: _consumeOneContentFromOneDataSource: context: %@ consumers: %@", buf, 0x16u);
    }

    long long v157 = 0u;
    long long v158 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    id v38 = v133;
    uint64_t v144 = [v38 countByEnumeratingWithState:&v155 objects:buf count:16];
    if (!v144)
    {

      id v26 = 0;
      uint8_t v85 = 1;
      goto LABEL_112;
    }
    char v136 = 0;
    uint64_t v143 = *(void *)v156;
    char v141 = 1;
    v139 = v38;
    v140 = v24;
LABEL_58:
    uint64_t v39 = 0;
    while (1)
    {
      if (*(void *)v156 != v143) {
        objc_enumerationMutation(v38);
      }
      uint64_t v40 = *(void **)(*((void *)&v155 + 1) + 8 * v39);
      uint64_t v41 = (void *)MEMORY[0x22A6667F0]();
      int v42 = [v38 objectForKey:v40];
      if (!v42)
      {
        v81 = [MEMORY[0x263F08690] currentHandler];
        [v81 handleFailureInMethod:sel__consumeOneContentFromOneDataSource_minimumLevelOfService_inMemoryItemsOnly_dataSourceContentState_guardedData_shouldContinueBlock_contentWasAvailable_consumers_consumerSelector_error_, v135, @"HVConsumerCoordinator.m", 681, @"Consumer %@ is missing state", v40 object file lineNumber description];
      }
      if (![v42 levelOfService])
      {
        uint64_t v59 = hv_default_log_handle();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v167 = 138412290;
          id v168 = v40;
          _os_log_impl(&dword_226C41000, v59, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: _consumeOneContentFromOneDataSource: ignoring consumer %@ registered for No Service.", v167, 0xCu);
        }

        goto LABEL_90;
      }
      id v145 = v17;
      char v43 = v161;
      id v44 = v40;
      id v45 = v42;
      char v46 = v24;
      v149 = v142;
      id v47 = v43;
      char v48 = [v44 consumerName];
      long long v49 = [(HVContentState *)v46 consumers];
      int v50 = [v49 containsObject:v48];

      context = v41;
      v148 = v45;
      v146 = v47;
      if (v50)
      {
        uint64_t v51 = hv_default_log_handle();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          long long v52 = [v47 uniqueId];
          *(_DWORD *)v167 = 138412546;
          id v168 = v48;
          __int16 v169 = 2112;
          *(void *)v170 = v52;
          long long v53 = v51;
          id v54 = "HVConsumerCoordinator: _consumeOneContentFromOneDataSourceToOneConsumer: consumer %@ has already seen content %@";
          goto LABEL_67;
        }
        goto LABEL_69;
      }
      if ([v45 levelOfService] >= v137)
      {
        v70 = (void (*)(id, char *, HVConsumptionContext *))[v44 methodForSelector:v125];
        if (!v70)
        {
          uint64_t v51 = hv_default_log_handle();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v167 = 138412290;
            id v168 = v44;
            _os_log_fault_impl(&dword_226C41000, v51, OS_LOG_TYPE_FAULT, "HVConsumerCoordinator: _consumeOneContentFromOneDataSourceToOneConsumer: methodForSelector on %@ failed", v167, 0xCu);
          }
          goto LABEL_69;
        }
        uint64_t v51 = v70(v44, v125, v149);
        v71 = [v51 contentWasProcessed];
        int v72 = [v71 BOOLValue];

        if (v72)
        {
          objc_msgSend(v45, "setDocumentsConsumed:", objc_msgSend(v45, "documentsConsumed") + 1);
          v73 = [v51 numberOfExtractions];

          if (v73)
          {
            v74 = [v51 numberOfExtractions];
            objc_msgSend(v45, "setNumberOfExtractions:", objc_msgSend(v45, "numberOfExtractions") + objc_msgSend(v74, "intValue"));
          }
        }
        else
        {
          objc_msgSend(v45, "setDocumentsIgnored:", objc_msgSend(v45, "documentsIgnored") + 1);
        }
        if (([v51 success] & 1) != 0
          || (objc_msgSend(v45, "setErrorsReported:", objc_msgSend(v45, "errorsReported") + 1),
              [v51 error],
              v75 = objc_claimAutoreleasedReturnValue(),
              uint64_t v76 = [v75 code],
              v75,
              v76 != 1))
        {
          v78 = (void *)MEMORY[0x22A6667F0]();
          v79 = [(HVContentState *)v46 consumers];
          v80 = [v79 setByAddingObject:v48];

          [(HVMutableContentState *)v46 setConsumers:v80];

          long long v52 = hv_default_log_handle();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v167 = 138412546;
            id v168 = v44;
            __int16 v169 = 2112;
            *(void *)v170 = v45;
            long long v53 = v52;
            id v54 = "HVConsumerCoordinator: _consumeOneContentFromOneDataSourceToOneConsumer: %@ consumed content: new state = %@";
LABEL_67:
            _os_log_impl(&dword_226C41000, v53, OS_LOG_TYPE_DEFAULT, v54, v167, 0x16u);
          }

LABEL_69:
          int v55 = 0;
          char v56 = 1;
          v57 = v145;
          id v58 = v145;
          char v141 = 1;
          goto LABEL_77;
        }
        v77 = hv_default_log_handle();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v167 = 138412290;
          id v168 = v44;
          _os_log_impl(&dword_226C41000, v77, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: _consumeOneContentFromOneDataSourceToOneConsumer: %@ reported being interrupted so exiting early and leaving content in queue", v167, 0xCu);
        }

        objc_msgSend(v45, "setNumberOfInterruptions:", objc_msgSend(v45, "numberOfInterruptions") + 1);
        id v58 = [v51 error];
        char v56 = 0;
        char v141 = 0;
        int v55 = 1;
        v57 = v145;
      }
      else
      {
        uint64_t v51 = hv_default_log_handle();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          int v60 = [v45 levelOfService];
          *(_DWORD *)v167 = 138412802;
          id v168 = v48;
          __int16 v169 = 1024;
          *(_DWORD *)v170 = v60;
          *(_WORD *)&v170[4] = 1024;
          *(_DWORD *)&v170[6] = v137;
          _os_log_impl(&dword_226C41000, v51, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: _consumeOneContentFromOneDataSourceToOneConsumer: consumer %@ registered at LoS %hhu which is below minimum LoS %hhu.", v167, 0x18u);
        }
        int v55 = 0;
        char v56 = 0;
        char v141 = 1;
        v57 = v145;
        id v58 = v145;
      }
LABEL_77:

      id v61 = v58;
      id v38 = v139;
      if (v56) {
        goto LABEL_88;
      }
      uint64_t v62 = v161;
      v63 = [v62 uniqueId];
      v64 = (void *)v135[3];
      id v162 = 0;
      char v65 = [v64 dequeuedContentNotConsumed:v62 dataSource:v138 error:&v162];

      id v66 = v162;
      v67 = hv_default_log_handle();
      v68 = v67;
      if ((v65 & 1) == 0)
      {
        if (!os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
          goto LABEL_87;
        }
        v69 = HVDataSourceDescription(v138);
        *(_DWORD *)v167 = 138412546;
        id v168 = v63;
        __int16 v169 = 2114;
        *(void *)v170 = v69;
        _os_log_error_impl(&dword_226C41000, v68, OS_LOG_TYPE_ERROR, "HVConsumerCoordinator: _reportDeferralWithContent: failed to reenqueue %@ to %{public}@", v167, 0x16u);
        goto LABEL_81;
      }
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        v69 = HVDataSourceDescription(v138);
        *(_DWORD *)v167 = 138412546;
        id v168 = v63;
        __int16 v169 = 2114;
        *(void *)v170 = v69;
        _os_log_impl(&dword_226C41000, v68, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: _reportDeferralWithContent: reenqueued %@ to %{public}@", v167, 0x16u);
LABEL_81:
      }
LABEL_87:

      char v136 = 1;
LABEL_88:
      if (v55) {
        break;
      }
      id v17 = v61;
      char v24 = v140;
      uint64_t v41 = context;
LABEL_90:

      if (v144 == ++v39)
      {
        uint64_t v82 = [v38 countByEnumeratingWithState:&v155 objects:buf count:16];
        uint64_t v144 = v82;
        if (!v82)
        {

          id v61 = v17;
          goto LABEL_106;
        }
        goto LABEL_58;
      }
    }

    char v24 = v140;
LABEL_106:
    if (v136)
    {
      v83 = (void *)[(HVMutableContentState *)v24 copy];
      v84 = [(HVDataSourceContentState *)v134 deferredContentStates];
      [v84 setObject:v83 forKeyedSubscript:v122];
    }
    a2 = v137;
    uint64_t v7 = v138;
    int v8 = v135;
    if (v141)
    {
      id v26 = 0;
      uint8_t v85 = 1;
      id v17 = v61;
    }
    else
    {
      id v26 = v61;
      uint8_t v85 = 0;
      id v17 = v26;
    }
LABEL_112:
    v167[0] = v85;

    int v28 = 0;
    int v27 = 1;
LABEL_113:

    int v86 = v167[0];
    id v87 = v26;

    if (v132 == 0 || (v128 & 1) == 0)
    {
      if ((v128 & 1) == 0) {
        goto LABEL_117;
      }
LABEL_115:
      int v88 = 1;
    }
    else
    {
      if (((uint64_t (**)(void *))v132)[2](v130)) {
        goto LABEL_115;
      }
LABEL_117:
      v89 = hv_default_log_handle();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_226C41000, v89, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: _consumeAllContentFromOneDataSource: shouldContinueBlock returned NO.", buf, 2u);
      }

      int v88 = 0;
    }
    v90 = (_DWORD *)v129[1];
    if (v90
      && -[HVBudget sourcesFilteredByBudgetAndRegistrationsFromAvailableSources:levelOfService:](v90, v7, a2) == v7)
    {
      int v91 = 1;
    }
    else
    {
      v92 = hv_default_log_handle();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_226C41000, v92, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: _consumeAllContentFromOneDataSource: consumed budget while processing", buf, 2u);
      }

      int v91 = 0;
    }

    char v128 = v88;
    int v93 = v88 & v91;
    id v12 = v87;
    id v10 = v129;
  }
  while ((v28 | v86 & v93 ^ 1) != 1);
  if (v86)
  {
    unsigned int v94 = a2;
    long long v153 = 0u;
    long long v154 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    id v95 = v133;
    uint64_t v96 = [v95 countByEnumeratingWithState:&v151 objects:v163 count:16];
    if (v96)
    {
      uint64_t v97 = v96;
      uint64_t v98 = *(void *)v152;
      unsigned __int8 v99 = 4;
      do
      {
        for (uint64_t i = 0; i != v97; ++i)
        {
          if (*(void *)v152 != v98) {
            objc_enumerationMutation(v95);
          }
          v101 = [v95 objectForKey:*(void *)(*((void *)&v151 + 1) + 8 * i)];
          if ([v101 levelOfService])
          {
            unsigned int v102 = [v101 levelOfService];
            if (v102 < v99) {
              unsigned __int8 v99 = v102;
            }
          }
        }
        uint64_t v97 = [v95 countByEnumeratingWithState:&v151 objects:v163 count:16];
      }
      while (v97);
    }
    else
    {
      unsigned __int8 v99 = 4;
    }

    if ([v95 count])
    {
      int v109 = v94 > v99 ? 1 : v27;
      if ((v109 | v93 ^ 1))
      {
        [(HVDataSourceContentState *)v134 saveStateWithError:0];
        id v107 = 0;
        int v108 = 1;
        goto LABEL_153;
      }
    }
    if (![v95 count])
    {
      v110 = hv_default_log_handle();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
      {
        v111 = HVDataSourceDescription(v138);
        *(_DWORD *)long long buf = 138543362;
        *(void *)v165 = v111;
        _os_log_impl(&dword_226C41000, v110, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator<%{public}@>: no consumers found for data source!", buf, 0xCu);
      }
    }
    uint64_t v112 = v135[4];
    id v150 = 0;
    BOOL v113 = +[HVDataSourceContentState deleteStateForDataSource:v138 basePath:v112 error:&v150];
    id v114 = v150;
    a1 = v120;
    if (!v113)
    {
      v115 = hv_default_log_handle();
      if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v116 = v135[4];
        v117 = HVDataSourceDescription(v138);
        *(_DWORD *)long long buf = 138543874;
        *(void *)v165 = v116;
        *(_WORD *)&v165[8] = 2112;
        *(void *)&v165[10] = v117;
        *(_WORD *)&v165[18] = 2112;
        id v166 = v114;
        _os_log_impl(&dword_226C41000, v115, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: _consumeAllContentFromOneDataSource<%{public}@>: failed to delete state file at %@: %@", buf, 0x20u);
      }
    }

    id v107 = 0;
    int v108 = 2;
  }
  else
  {
    v106 = hv_default_log_handle();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)v165 = v87;
      _os_log_error_impl(&dword_226C41000, v106, OS_LOG_TYPE_ERROR, "HVConsumerCoordinator: _consumeAllContentFromOneDataSource: error: %@", buf, 0xCu);
    }

    id v107 = v87;
    int v108 = 0;
LABEL_153:
    a1 = v120;
  }

  id v105 = v107;
  if (!v108) {
    goto LABEL_166;
  }
  if (v108 == 2) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= *(_DWORD *)(a1 + 100);
  }
LABEL_167:
  uint64_t v118 = *(void *)(a1 + 48);
  if (v118 && ((*(uint64_t (**)(void))(v118 + 16))() & 1) == 0)
  {
    v119 = hv_default_log_handle();
    if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_226C41000, v119, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: consumeAllContentFromAllDataSources: shouldContinueBlock returned NO.", buf, 2u);
    }

    **(unsigned char **)(a1 + 88) = 1;
  }
}

- (id)_consumersForOneDataSource:(void *)a3 guardedData:
{
  id v5 = a3;
  int v6 = v5;
  if (!a1) {
    goto LABEL_35;
  }
  a1 = 0;
  if (a2 > 255)
  {
    if (a2 > 4095)
    {
      if (a2 >= 0x4000)
      {
        if (a2 != 0x4000 && a2 != 0x8000) {
          goto LABEL_35;
        }
        uint64_t v7 = 112;
      }
      else
      {
        if (a2 != 4096 && a2 != 0x2000) {
          goto LABEL_35;
        }
        uint64_t v7 = 104;
      }
    }
    else if (a2 > 1023)
    {
      if (a2 == 1024)
      {
        uint64_t v7 = 88;
      }
      else
      {
        if (a2 != 2048) {
          goto LABEL_35;
        }
        uint64_t v7 = 96;
      }
    }
    else if (a2 == 256)
    {
      uint64_t v7 = 72;
    }
    else
    {
      if (a2 != 512) {
        goto LABEL_35;
      }
      uint64_t v7 = 80;
    }
    goto LABEL_34;
  }
  if (a2 > 15)
  {
    if (a2 > 63)
    {
      if (a2 != 64)
      {
        if (a2 != 128) {
          goto LABEL_35;
        }
        uint64_t v7 = 64;
        goto LABEL_34;
      }
    }
    else
    {
      if (a2 == 16)
      {
        uint64_t v7 = 48;
        goto LABEL_34;
      }
      if (a2 != 32) {
        goto LABEL_35;
      }
    }
    uint64_t v7 = 56;
LABEL_34:
    a1 = *(id *)&v5[v7];
    goto LABEL_35;
  }
  uint64_t v7 = 16;
  switch(a2)
  {
    case 1:
      goto LABEL_34;
    case 2:
      uint64_t v7 = 24;
      goto LABEL_34;
    case 4:
      uint64_t v7 = 32;
      goto LABEL_34;
    case 8:
      uint64_t v7 = 40;
      goto LABEL_34;
    default:
      break;
  }
LABEL_35:

  return a1;
}

- (void)contentAvailableFromSources:(unsigned int)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v6 = (void *)os_transaction_create();
  uint64_t v7 = hv_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = HVDataSourceDescription(a3);
    *(_DWORD *)long long buf = 138543362;
    id v13 = v8;
    _os_log_impl(&dword_226C41000, v7, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: contentAvailableFromSources: %{public}@", buf, 0xCu);
  }
  dispatch_group_enter((dispatch_group_t)self->_waitingForLock);
  locuint64_t k = self->_lock;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__HVConsumerCoordinator_contentAvailableFromSources___block_invoke;
  v10[3] = &unk_2647D4F50;
  unsigned int v11 = a3;
  void v10[4] = self;
  void v10[5] = a2;
  [(_PASLock *)lock runWithLockAcquired:v10];
}

void __53__HVConsumerCoordinator_contentAvailableFromSources___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  int v4 = *(_DWORD *)(a1 + 48);
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  id v17 = __53__HVConsumerCoordinator_contentAvailableFromSources___block_invoke_2;
  int8x16_t v18 = &unk_2647D4F28;
  uint64_t v19 = *(void *)(a1 + 32);
  id v5 = (_DWORD **)v3;
  uint64_t v6 = *(void *)(a1 + 40);
  id v21 = &v23;
  uint64_t v22 = v6;
  id v20 = v5;
  HVDataSourceRunBlockPerSetBit(v4, &v15);
  if (*((unsigned char *)v24 + 24))
  {
    +[HVScheduledTasks delayedBudgetedContentAvailable];
    int v7 = -[HVBudget sourcesFilteredByBudgetAndRegistrationsFromAvailableSources:levelOfService:](v5[1], *(_DWORD *)(a1 + 48), 2);
    int v8 = hv_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      char v9 = HVDataSourceDescription(v7);
      *(_DWORD *)long long buf = 138543362;
      int v28 = v9;
      _os_log_impl(&dword_226C41000, v8, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: sources after applying budget: %{public}@", buf, 0xCu);
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      -[HVConsumerCoordinator _consumeContentFromAllDataSources:minimumLevelOfService:inMemoryItemsOnly:guardedData:shouldContinueBlock:error:](v10, v7, 2, 1, v5, 0, 0);
    }
  }
  int v11 = -[HVBudget sourcesFilteredByBudgetAndRegistrationsFromAvailableSources:levelOfService:](v5[1], *(_DWORD *)(a1 + 48), 3);
  id v12 = hv_default_log_handle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = HVDataSourceDescription(v11);
    *(_DWORD *)long long buf = 138543362;
    int v28 = v13;
    _os_log_impl(&dword_226C41000, v12, OS_LOG_TYPE_DEFAULT, "HVConsumerCoordinator: sources after applying budget: %{public}@", buf, 0xCu);
  }
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    -[HVConsumerCoordinator _consumeContentFromAllDataSources:minimumLevelOfService:inMemoryItemsOnly:guardedData:shouldContinueBlock:error:](v14, v11, 3, 0, v5, 0, 0);
  }

  _Block_object_dispose(&v23, 8);
}

void __53__HVConsumerCoordinator_contentAvailableFromSources___block_invoke_2(uint64_t a1, int a2, unsigned char *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  -[HVConsumerCoordinator _consumersForOneDataSource:guardedData:](*(id *)(a1 + 32), a2, *(void **)(a1 + 40));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        int v11 = (void *)MEMORY[0x22A6667F0]();
        id v12 = [v5 objectForKey:v10];
        if (!v12)
        {
          [MEMORY[0x263F08690] currentHandler];
          id v13 = v14 = v10;
          [v13 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"HVConsumerCoordinator.m", 221, @"Consumer %@ is missing state", v14 object file lineNumber description];
        }
        if ([v12 levelOfService] == 2)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          *a3 = 1;

          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (HVConsumerCoordinator)initWithQueues:(id)a3 path:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)HVConsumerCoordinator;
  char v9 = [(HVConsumerCoordinator *)&v28 init];
  if (v9)
  {
    dispatch_group_t v10 = dispatch_group_create();
    waitingForLocuint64_t k = v9->_waitingForLock;
    v9->_waitingForLocuint64_t k = (OS_dispatch_group *)v10;

    uint64_t v12 = [v8 stringByAppendingPathComponent:@"ConsumerCoordinator"];
    path = v9->_path;
    v9->_path = (NSString *)v12;

    id v14 = [MEMORY[0x263F08850] defaultManager];
    objc_sync_enter(v14);
    long long v15 = [MEMORY[0x263F08850] defaultManager];
    long long v16 = v9->_path;
    id v27 = 0;
    char v17 = [v15 createDirectoryAtPath:v16 withIntermediateDirectories:1 attributes:0 error:&v27];
    id v18 = v27;

    if ((v17 & 1) == 0)
    {
      uint64_t v19 = hv_default_log_handle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v30 = v18;
        _os_log_fault_impl(&dword_226C41000, v19, OS_LOG_TYPE_FAULT, "HVConsumerCoordinator: failed to create ConsumerCoordinator subdirectory: %@", buf, 0xCu);
      }
    }
    objc_sync_exit(v14);

    id v20 = objc_alloc(MEMORY[0x263F61E70]);
    id v21 = objc_opt_new();
    uint64_t v22 = [v20 initWithGuardedData:v21];
    locuint64_t k = v9->_lock;
    v9->_locuint64_t k = (_PASLock *)v22;

    uint64_t v24 = [MEMORY[0x263F61E38] autoreleasingSerialQueueWithLabel:"com.apple.proactive.ProactiveHarvesting.HVConsumerCoordinator.serialQueue" qosClass:9];
    serialQueue = v9->_serialQueue;
    v9->_serialQueue = (OS_dispatch_queue *)v24;

    objc_storeStrong((id *)&v9->_queues, a3);
    [(HVQueues *)v9->_queues registerQueueObserver:v9 dispatchQueue:v9->_serialQueue];
  }
  return v9;
}

- (HVConsumerCoordinator)init
{
  id v3 = +[HVQueues defaultQueues];
  int v4 = +[HVPaths topDirectoryCreateIfNeeded:1];
  id v5 = [(HVConsumerCoordinator *)self initWithQueues:v3 path:v4];

  return v5;
}

+ (id)defaultCoordinator
{
  if (defaultCoordinator__pasOnceToken2 != -1) {
    dispatch_once(&defaultCoordinator__pasOnceToken2, &__block_literal_global_767);
  }
  v2 = (void *)defaultCoordinator__pasExprOnceResult;

  return v2;
}

void __43__HVConsumerCoordinator_defaultCoordinator__block_invoke()
{
  v0 = (void *)MEMORY[0x22A6667F0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)defaultCoordinator__pasExprOnceResult;
  defaultCoordinator__pasExprOnceResult = v1;
}

@end