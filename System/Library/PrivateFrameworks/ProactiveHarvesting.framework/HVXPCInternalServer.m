@interface HVXPCInternalServer
- (void)contentAvailableFromSources:(unsigned int)a3 completion:(id)a4;
- (void)deleteContentWithRequest:(id)a3 completion:(id)a4;
- (void)disableConsumptionOfDataSources:(unsigned int)a3 completion:(id)a4;
- (void)donateSearchableItem:(id)a3 completion:(id)a4;
- (void)enableConsumptionOfDataSources:(unsigned int)a3 completion:(id)a4;
- (void)harvestWithCompletion:(id)a3;
- (void)overrideIsConnectedToPower:(id)a3 completion:(id)a4;
- (void)refillHarvestBudgetWithCompletion:(id)a3;
- (void)restoreConsumptionOfDataSources:(unsigned int)a3 completion:(id)a4;
- (void)statsWithCompletion:(id)a3;
@end

@implementation HVXPCInternalServer

- (void)harvestWithCompletion:(id)a3
{
  v3 = (void (**)(id, uint64_t, id))a3;
  v4 = +[HVConsumerCoordinator defaultCoordinator];
  id v7 = 0;
  uint64_t v5 = [v4 harvestContentWithMinimumLevelOfService:1 ignoringDiscretionaryPowerBudget:1 error:&v7 shouldContinueBlock:&__block_literal_global_2590];
  id v6 = v7;

  v3[2](v3, v5, v6);
}

uint64_t __45__HVXPCInternalServer_harvestWithCompletion___block_invoke()
{
  return 1;
}

- (void)statsWithCompletion:(id)a3
{
  v3 = (void (**)(id, void *, void))a3;
  v4 = hv_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226C41000, v4, OS_LOG_TYPE_DEFAULT, "HVXPCInternalServer: statsWithCompletion called.", buf, 2u);
  }

  uint64_t v5 = objc_opt_new();
  id v6 = +[HVConsumerCoordinator defaultCoordinator];
  id v15 = 0;
  id v7 = [v6 statsWithError:&v15];
  id v8 = v15;

  if (v7)
  {
    [v5 setObject:v7 forKeyedSubscript:@"Consumer Coordinator"];
  }
  else if (v8)
  {
    v9 = [v8 description];
    [v5 setObject:v9 forKeyedSubscript:@"Consumer Coordinator Error"];
  }
  v10 = +[HVQueues defaultQueues];
  id v14 = 0;
  v11 = [v10 statsWithError:&v14];
  id v12 = v14;

  if (v11)
  {
    [v5 setObject:v11 forKeyedSubscript:@"Queues"];
  }
  else if (v12)
  {
    v13 = [v12 description];
    [v5 setObject:v13 forKeyedSubscript:@"Queues Error"];
  }
  v3[2](v3, v5, 0);
}

- (void)deleteContentWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v5 = (void (**)(id, uint64_t, id))a4;
  id v6 = a3;
  id v7 = hv_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226C41000, v7, OS_LOG_TYPE_DEFAULT, "HVXPCInternalServer: deleteContentWithRequest called.", buf, 2u);
  }

  id v8 = +[HVDonationReceiver defaultReceiver];
  id v11 = 0;
  uint64_t v9 = [v8 deleteContentWithRequest:v6 error:&v11];

  id v10 = v11;
  v5[2](v5, v9, v10);
}

- (void)donateSearchableItem:(id)a3 completion:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = (void (**)(id, uint64_t, id))a4;
  id v6 = a3;
  id v7 = hv_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226C41000, v7, OS_LOG_TYPE_DEFAULT, "HVXPCInternalServer: donateSearchableItem called.", buf, 2u);
  }

  id v8 = +[HVDonationReceiver defaultReceiver];
  v15[0] = v6;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  id v10 = [v6 bundleID];
  id v13 = 0;
  uint64_t v11 = [v8 donateSearchableItems:v9 bundleIdentifier:v10 error:&v13];
  id v12 = v13;

  v5[2](v5, v11, v12);
}

- (void)refillHarvestBudgetWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  v3 = +[HVPowerBudget defaultBudget];
  [v3 refillThrottleBudget];

  v4[2](v4, 1, 0);
}

- (void)overrideIsConnectedToPower:(id)a3 completion:(id)a4
{
  uint64_t v5 = (void (**)(id, uint64_t, void))a4;
  objc_storeStrong((id *)&isConnectedToPowerOverrideForTesting, a3);
  v5[2](v5, 1, 0);
}

- (void)contentAvailableFromSources:(unsigned int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v5 = (void (**)(id, uint64_t, void))a4;
  id v6 = hv_default_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226C41000, v6, OS_LOG_TYPE_DEFAULT, "HVXPCInternalServer: contentAvailableFromSources called.", v8, 2u);
  }

  id v7 = +[HVConsumerCoordinator defaultCoordinator];
  [v7 contentAvailableFromSources:v4];

  v5[2](v5, 1, 0);
}

- (void)restoreConsumptionOfDataSources:(unsigned int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v5 = (void (**)(id, uint64_t, void))a4;
  id v6 = hv_default_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226C41000, v6, OS_LOG_TYPE_DEFAULT, "HVXPCInternalServer: restoreConsumptionOfDataSources called.", v8, 2u);
  }

  id v7 = +[HVConsumerCoordinator defaultCoordinator];
  [v7 restoreConsumptionOfDataSources:v4];

  v5[2](v5, 1, 0);
}

- (void)disableConsumptionOfDataSources:(unsigned int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v5 = (void (**)(id, uint64_t, void))a4;
  id v6 = hv_default_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226C41000, v6, OS_LOG_TYPE_DEFAULT, "HVXPCInternalServer: disableConsumptionOfDataSources called.", v8, 2u);
  }

  id v7 = +[HVConsumerCoordinator defaultCoordinator];
  [v7 disableConsumptionOfDataSources:v4];

  v5[2](v5, 1, 0);
}

- (void)enableConsumptionOfDataSources:(unsigned int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v5 = (void (**)(id, uint64_t, void))a4;
  id v6 = hv_default_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226C41000, v6, OS_LOG_TYPE_DEFAULT, "HVXPCInternalServer: enableConsumptionOfDataSources called.", v8, 2u);
  }

  id v7 = +[HVConsumerCoordinator defaultCoordinator];
  [v7 enableConsumptionOfDataSources:v4];

  v5[2](v5, 1, 0);
}

@end