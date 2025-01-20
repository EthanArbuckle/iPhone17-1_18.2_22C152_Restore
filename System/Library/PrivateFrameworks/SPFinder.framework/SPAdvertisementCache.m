@interface SPAdvertisementCache
- (FMXPCServiceDescription)serviceDescription;
- (FMXPCSession)session;
- (OS_dispatch_queue)queue;
- (SPAdvertisementCache)init;
- (SPAdvertisementCacheXPCProtocol)proxy;
- (id)remoteInterface;
- (void)advertisementsForSearchCriteria:(id)a3 completion:(id)a4;
- (void)beaconAdvertisementAtFileURL:(id)a3 beaconIdentifier:(id)a4 scanDate:(id)a5 completion:(id)a6;
- (void)beaconPayloadsForSearchCriteria:(id)a3 completion:(id)a4;
- (void)clearCacheWithCompletion:(id)a3;
- (void)dealloc;
- (void)markAdvertisementsProcessed:(id)a3 completion:(id)a4;
- (void)markBeaconPayloadsProcessed:(id)a3 completion:(id)a4;
- (void)markRecordsProcessed:(id)a3 completion:(id)a4;
- (void)mockingEnabled:(BOOL)a3;
- (void)saveAdvertisements:(id)a3 completion:(id)a4;
- (void)saveBeaconPayloads:(id)a3 completion:(id)a4;
- (void)setProxy:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServiceDescription:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation SPAdvertisementCache

- (SPAdvertisementCache)init
{
  v11.receiver = self;
  v11.super_class = (Class)SPAdvertisementCache;
  v2 = [(SPAdvertisementCache *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.icloud.searchpartyd.advertisementcache", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    id v6 = objc_alloc(MEMORY[0x263F3BA20]);
    v7 = [(SPAdvertisementCache *)v2 remoteInterface];
    uint64_t v8 = [v6 initWithMachServiceName:@"com.apple.icloud.searchpartyd.advertisementcache" options:0 remoteObjectInterface:v7 interruptionHandler:0 invalidationHandler:0];
    serviceDescription = v2->_serviceDescription;
    v2->_serviceDescription = (FMXPCServiceDescription *)v8;
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(SPAdvertisementCache *)self session];
  [v3 invalidate];

  [(SPAdvertisementCache *)self setSession:0];
  v4.receiver = self;
  v4.super_class = (Class)SPAdvertisementCache;
  [(SPAdvertisementCache *)&v4 dealloc];
}

- (SPAdvertisementCacheXPCProtocol)proxy
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [(SPAdvertisementCache *)self queue];
  dispatch_assert_queue_V2(v3);

  objc_super v4 = [(SPAdvertisementCache *)self session];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F3BA28]);
    id v6 = [(SPAdvertisementCache *)self serviceDescription];
    v7 = (void *)[v5 initWithServiceDescription:v6];
    [(SPAdvertisementCache *)self setSession:v7];

    uint64_t v8 = LogCategory_AdvertisementCache();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(SPAdvertisementCache *)self serviceDescription];
      v10 = [v9 machService];
      int v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_2211E2000, v8, OS_LOG_TYPE_DEFAULT, "SPAdvertisementCache: Establishing XPC connection to %@", (uint8_t *)&v15, 0xCu);
    }
    objc_super v11 = [(SPAdvertisementCache *)self session];
    [v11 resume];
  }
  v12 = [(SPAdvertisementCache *)self session];
  v13 = [v12 proxy];

  return (SPAdvertisementCacheXPCProtocol *)v13;
}

- (id)remoteInterface
{
  v7[6] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D312C58];
  v3 = (void *)MEMORY[0x263EFFA08];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v7[3] = objc_opt_class();
  v7[4] = objc_opt_class();
  v7[5] = objc_opt_class();
  objc_super v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:6];
  id v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_advertisementsForSearchCriteria_completion_ argumentIndex:0 ofReply:1];

  return v2;
}

- (void)mockingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = LogCategory_AdvertisementCache();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v13 = v3;
    _os_log_impl(&dword_2211E2000, v5, OS_LOG_TYPE_DEFAULT, "mockingEnabled: %i", buf, 8u);
  }

  id v6 = objc_alloc(MEMORY[0x263F3BA18]);
  v7 = (void *)[v6 initWithDescription:@"SPAdvertisementCacheMocking" andTimeout:*MEMORY[0x263F3BA30]];
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __39__SPAdvertisementCache_mockingEnabled___block_invoke;
  activity_block[3] = &unk_264597CE0;
  BOOL v11 = v3;
  activity_block[4] = self;
  id v10 = v7;
  id v8 = v7;
  _os_activity_initiate(&dword_2211E2000, "SPAdvertisementCache advertisementCacheSimulation:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  [v8 wait];
}

void __39__SPAdvertisementCache_mockingEnabled___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) queue];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __39__SPAdvertisementCache_mockingEnabled___block_invoke_2;
  v3[3] = &unk_264597CB8;
  objc_copyWeak(&v5, &location);
  char v6 = *(unsigned char *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __39__SPAdvertisementCache_mockingEnabled___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = [WeakRetained proxy];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__SPAdvertisementCache_mockingEnabled___block_invoke_3;
  v5[3] = &unk_264597C90;
  id v6 = *(id *)(a1 + 32);
  [v3 advertisementCacheSimulation:v4 completion:v5];
}

void __39__SPAdvertisementCache_mockingEnabled___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = LogCategory_AdvertisementCache();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __39__SPAdvertisementCache_mockingEnabled___block_invoke_3_cold_1((uint64_t)v3, v4);
    }
  }
  [*(id *)(a1 + 32) signal];
}

- (void)markRecordsProcessed:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __56__SPAdvertisementCache_markRecordsProcessed_completion___block_invoke;
  activity_block[3] = &unk_264597B20;
  activity_block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_2211E2000, "SPAdvertisementCache markAdvertisementsProcessed:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __56__SPAdvertisementCache_markRecordsProcessed_completion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  v2 = [a1[4] queue];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __56__SPAdvertisementCache_markRecordsProcessed_completion___block_invoke_2;
  v3[3] = &unk_264597AF8;
  objc_copyWeak(&v6, &location);
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__SPAdvertisementCache_markRecordsProcessed_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained proxy];
  [v2 markAdvertisementsProcessed:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)saveAdvertisements:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = LogCategory_AdvertisementCache();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v15 = [v6 count];
    _os_log_impl(&dword_2211E2000, v8, OS_LOG_TYPE_DEFAULT, "saveAdvertisements: %lu", buf, 0xCu);
  }

  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __54__SPAdvertisementCache_saveAdvertisements_completion___block_invoke;
  activity_block[3] = &unk_264597B20;
  activity_block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  _os_activity_initiate(&dword_2211E2000, "SPAdvertisementCache saveAdvertisements:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __54__SPAdvertisementCache_saveAdvertisements_completion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  v2 = [a1[4] queue];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __54__SPAdvertisementCache_saveAdvertisements_completion___block_invoke_2;
  v3[3] = &unk_264597AF8;
  objc_copyWeak(&v6, &location);
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __54__SPAdvertisementCache_saveAdvertisements_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained proxy];
  [v2 saveAdvertisements:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)advertisementsForSearchCriteria:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = LogCategory_AdvertisementCache();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_2211E2000, v8, OS_LOG_TYPE_DEFAULT, "advertisementsForSearchCriteria: %@", buf, 0xCu);
  }

  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __67__SPAdvertisementCache_advertisementsForSearchCriteria_completion___block_invoke;
  activity_block[3] = &unk_264597B20;
  activity_block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  _os_activity_initiate(&dword_2211E2000, "SPAdvertisementCache advertisementsForSearchCriteria:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __67__SPAdvertisementCache_advertisementsForSearchCriteria_completion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  v2 = [a1[4] queue];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __67__SPAdvertisementCache_advertisementsForSearchCriteria_completion___block_invoke_2;
  v3[3] = &unk_264597AF8;
  objc_copyWeak(&v6, &location);
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __67__SPAdvertisementCache_advertisementsForSearchCriteria_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained proxy];
  [v2 advertisementsForSearchCriteria:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)markAdvertisementsProcessed:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = LogCategory_AdvertisementCache();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = [v6 count];
    _os_log_impl(&dword_2211E2000, v8, OS_LOG_TYPE_DEFAULT, "markAdvertisementsProcessed: %lu", buf, 0xCu);
  }

  id v9 = objc_msgSend(v6, "fm_map:", &__block_literal_global_0);
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __63__SPAdvertisementCache_markAdvertisementsProcessed_completion___block_invoke_2;
  activity_block[3] = &unk_264597B20;
  activity_block[4] = self;
  id v13 = v9;
  id v14 = v7;
  id v10 = v7;
  id v11 = v9;
  _os_activity_initiate(&dword_2211E2000, "SPAdvertisementCache markRecordsProcessed:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __63__SPAdvertisementCache_markAdvertisementsProcessed_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 recordIdentifier];
}

uint64_t __63__SPAdvertisementCache_markAdvertisementsProcessed_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) markRecordsProcessed:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)saveBeaconPayloads:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = LogCategory_AdvertisementCache();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v15 = [v6 count];
    _os_log_impl(&dword_2211E2000, v8, OS_LOG_TYPE_DEFAULT, "saveBeaconPayload: %lu", buf, 0xCu);
  }

  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __54__SPAdvertisementCache_saveBeaconPayloads_completion___block_invoke;
  activity_block[3] = &unk_264597B20;
  activity_block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  _os_activity_initiate(&dword_2211E2000, "SPAdvertisementCache saveBeaconPayloads:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __54__SPAdvertisementCache_saveBeaconPayloads_completion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  v2 = [a1[4] queue];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __54__SPAdvertisementCache_saveBeaconPayloads_completion___block_invoke_2;
  v3[3] = &unk_264597AF8;
  objc_copyWeak(&v6, &location);
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __54__SPAdvertisementCache_saveBeaconPayloads_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained proxy];
  [v2 saveBeaconPayloads:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)beaconPayloadsForSearchCriteria:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = LogCategory_AdvertisementCache();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_2211E2000, v8, OS_LOG_TYPE_DEFAULT, "beaconPayloadsForSearchCriteria: %@", buf, 0xCu);
  }

  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __67__SPAdvertisementCache_beaconPayloadsForSearchCriteria_completion___block_invoke;
  activity_block[3] = &unk_264597B20;
  activity_block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  _os_activity_initiate(&dword_2211E2000, "SPAdvertisementCache beaconPayloadsForSearchCriteria:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __67__SPAdvertisementCache_beaconPayloadsForSearchCriteria_completion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  v2 = [a1[4] queue];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __67__SPAdvertisementCache_beaconPayloadsForSearchCriteria_completion___block_invoke_2;
  v3[3] = &unk_264597AF8;
  objc_copyWeak(&v6, &location);
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __67__SPAdvertisementCache_beaconPayloadsForSearchCriteria_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained proxy];
  [v2 beaconPayloadsForSearchCriteria:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)markBeaconPayloadsProcessed:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = LogCategory_AdvertisementCache();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v15 = [v6 count];
    _os_log_impl(&dword_2211E2000, v8, OS_LOG_TYPE_DEFAULT, "markBeaconPayloadsProcessed: %lu", buf, 0xCu);
  }

  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __63__SPAdvertisementCache_markBeaconPayloadsProcessed_completion___block_invoke;
  activity_block[3] = &unk_264597B20;
  activity_block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  _os_activity_initiate(&dword_2211E2000, "SPAdvertisementCache markFilesProcessed:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __63__SPAdvertisementCache_markBeaconPayloadsProcessed_completion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  v2 = [a1[4] queue];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __63__SPAdvertisementCache_markBeaconPayloadsProcessed_completion___block_invoke_2;
  v3[3] = &unk_264597AF8;
  objc_copyWeak(&v6, &location);
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __63__SPAdvertisementCache_markBeaconPayloadsProcessed_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained proxy];
  [v2 markFilesProcessed:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)beaconAdvertisementAtFileURL:(id)a3 beaconIdentifier:(id)a4 scanDate:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  id v14 = [(SPAdvertisementCache *)self queue];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __90__SPAdvertisementCache_beaconAdvertisementAtFileURL_beaconIdentifier_scanDate_completion___block_invoke;
  v19[3] = &unk_264597D28;
  objc_copyWeak(&v24, &location);
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __90__SPAdvertisementCache_beaconAdvertisementAtFileURL_beaconIdentifier_scanDate_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v2 = [WeakRetained proxy];
  [v2 beaconAdvertisementAtFileURL:*(void *)(a1 + 32) beaconIdentifier:*(void *)(a1 + 40) scanDate:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)clearCacheWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(SPAdvertisementCache *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SPAdvertisementCache_clearCacheWithCompletion___block_invoke;
  block[3] = &unk_264597B48;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __49__SPAdvertisementCache_clearCacheWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained proxy];
  [v2 clearCacheWithCompletion:*(void *)(a1 + 32)];
}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (void)setServiceDescription:(id)a3
{
}

- (FMXPCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void)setProxy:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
}

void __39__SPAdvertisementCache_mockingEnabled___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2211E2000, a2, OS_LOG_TYPE_ERROR, "Failed to change mocking state: %@", (uint8_t *)&v2, 0xCu);
}

@end