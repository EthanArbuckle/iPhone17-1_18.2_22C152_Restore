@interface SPBeaconManagerSimpleBeaconUpdateInterface
+ (id)exportedInterface;
+ (id)remoteInterface;
- (BOOL)reconnectionUpdate;
- (FMXPCSession)session;
- (NSArray)simpleBeacons;
- (OS_dispatch_queue)serialQueue;
- (SPBeaconManagerSimpleBeaconUpdateInterface)init;
- (SPBeaconManagerXPCProtocol)proxy;
- (SPSimpleBeaconContext)context;
- (id)collectionDifferenceBlock;
- (void)_processRemovals:(id)a3;
- (void)dealloc;
- (void)handleReconnection;
- (void)interruptionHandler:(id)a3;
- (void)invalidationHandler:(id)a3;
- (void)receivedSimpleBeaconRemovals:(id)a3;
- (void)receivedSimpleBeaconUpdates:(id)a3;
- (void)removeObservers;
- (void)setCollectionDifferenceBlock:(id)a3;
- (void)setContext:(id)a3;
- (void)setProxy:(id)a3;
- (void)setReconnectionUpdate:(BOOL)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSession:(id)a3;
- (void)setSimpleBeaconDifferenceBlock:(id)a3;
- (void)setSimpleBeacons:(id)a3;
- (void)startUpdatingSimpleBeaconsWithContext:(id)a3 completion:(id)a4;
- (void)stopUpdatingSimpleBeaconsWithCompletion:(id)a3;
@end

@implementation SPBeaconManagerSimpleBeaconUpdateInterface

- (SPBeaconManagerSimpleBeaconUpdateInterface)init
{
  v9.receiver = self;
  v9.super_class = (Class)SPBeaconManagerSimpleBeaconUpdateInterface;
  v2 = [(SPBeaconManagerSimpleBeaconUpdateInterface *)&v9 init];
  v3 = v2;
  if (v2)
  {
    simpleBeacons = v2->_simpleBeacons;
    v2->_simpleBeacons = (NSArray *)MEMORY[0x1E4F1CBF0];

    v3->_reconnectionUpdate = 0;
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.icloud.seachpartyd.simpleBeaconUpdate", v5);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v6;
  }
  return v3;
}

- (void)dealloc
{
  v3 = LogCategory_SimpleBeaconUpdateInterface();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "SPBeaconManagerSimpleBeaconUpdateInterface: dealloc.", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)SPBeaconManagerSimpleBeaconUpdateInterface;
  [(SPBeaconManagerSimpleBeaconUpdateInterface *)&v4 dealloc];
}

- (NSArray)simpleBeacons
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  v3 = [(SPBeaconManagerSimpleBeaconUpdateInterface *)self serialQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__SPBeaconManagerSimpleBeaconUpdateInterface_simpleBeacons__block_invoke;
  v6[3] = &unk_1E601BA08;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __59__SPBeaconManagerSimpleBeaconUpdateInterface_simpleBeacons__block_invoke(uint64_t a1)
{
}

- (void)setSimpleBeaconDifferenceBlock:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446210;
    uint64_t v9 = "-[SPBeaconManagerSimpleBeaconUpdateInterface setSimpleBeaconDifferenceBlock:]";
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPBeaconManagerSimpleBeaconUpdateInterface: SPI: %{public}s", (uint8_t *)&v8, 0xCu);
  }

  dispatch_queue_t v6 = _Block_copy(v4);
  id collectionDifferenceBlock = self->_collectionDifferenceBlock;
  self->_id collectionDifferenceBlock = v6;
}

- (void)startUpdatingSimpleBeaconsWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  int v8 = [(SPBeaconManagerSimpleBeaconUpdateInterface *)self serialQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __95__SPBeaconManagerSimpleBeaconUpdateInterface_startUpdatingSimpleBeaconsWithContext_completion___block_invoke;
  v11[3] = &unk_1E601B850;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __95__SPBeaconManagerSimpleBeaconUpdateInterface_startUpdatingSimpleBeaconsWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = LogCategory_BeaconManager();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136446210;
      id v6 = "-[SPBeaconManagerSimpleBeaconUpdateInterface startUpdatingSimpleBeaconsWithContext:completion:]_block_invoke";
      _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "SPBeaconManagerSimpleBeaconUpdateInterface: SPI: %{public}s", (uint8_t *)&v5, 0xCu);
    }

    objc_storeStrong(WeakRetained + 7, *(id *)(a1 + 32));
    id v4 = [WeakRetained proxy];
    [v4 startUpdatingSimpleBeaconsWithContext:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
  }
}

- (void)stopUpdatingSimpleBeaconsWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void))a3;
  int v5 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v11 = "-[SPBeaconManagerSimpleBeaconUpdateInterface stopUpdatingSimpleBeaconsWithCompletion:]";
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPBeaconManagerSimpleBeaconUpdateInterface: SPI: %{public}s", buf, 0xCu);
  }

  [(SPBeaconManagerSimpleBeaconUpdateInterface *)self removeObservers];
  [(SPBeaconManagerSimpleBeaconUpdateInterface *)self setCollectionDifferenceBlock:0];
  id v6 = [(SPBeaconManagerSimpleBeaconUpdateInterface *)self session];
  [v6 invalidate];

  [(SPBeaconManagerSimpleBeaconUpdateInterface *)self setSession:0];
  objc_initWeak((id *)buf, self);
  uint64_t v7 = [(SPBeaconManagerSimpleBeaconUpdateInterface *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__SPBeaconManagerSimpleBeaconUpdateInterface_stopUpdatingSimpleBeaconsWithCompletion___block_invoke;
  block[3] = &unk_1E601BA30;
  objc_copyWeak(&v9, (id *)buf);
  dispatch_async(v7, block);

  v4[2](v4, 1, 0);
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __86__SPBeaconManagerSimpleBeaconUpdateInterface_stopUpdatingSimpleBeaconsWithCompletion___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[2];
    WeakRetained[2] = MEMORY[0x1E4F1CBF0];
    v3 = WeakRetained;

    WeakRetained = v3;
  }
}

- (void)interruptionHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v13 = "-[SPBeaconManagerSimpleBeaconUpdateInterface interruptionHandler:]";
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPBeaconManagerSimpleBeaconUpdateInterface: SPI: %{public}s", buf, 0xCu);
  }

  id v6 = (void (**)(void *, void, void *))_Block_copy(self->_collectionDifferenceBlock);
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.icloud.searchpartyd.SPBeaconManager.ErrorDomain" code:2 userInfo:0];
    v6[2](v6, 0, v7);
  }
  int v8 = [(SPBeaconManagerSimpleBeaconUpdateInterface *)self session];

  if (v8)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__SPBeaconManagerSimpleBeaconUpdateInterface_interruptionHandler___block_invoke;
    block[3] = &unk_1E601B790;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v9 = (void *)MEMORY[0x1B3EB48A0]();
    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:self selector:sel_handleReconnection name:SPSimpleBeaconUpdateInterfaceReconnect object:0];
  }
}

void __66__SPBeaconManagerSimpleBeaconUpdateInterface_interruptionHandler___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1B3EB48A0]();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)interfaceReconnectTrampoline, @"SPSimpleBeaconUpdateInterfaceReconnectNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)invalidationHandler:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446210;
    int v8 = "-[SPBeaconManagerSimpleBeaconUpdateInterface invalidationHandler:]";
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "SPBeaconManagerSimpleBeaconUpdateInterface: SPI: %{public}s", (uint8_t *)&v7, 0xCu);
  }

  id collectionDifferenceBlock = (void (**)(id, void, void *))self->_collectionDifferenceBlock;
  if (collectionDifferenceBlock)
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.icloud.searchpartyd.SPBeaconManager.ErrorDomain" code:1 userInfo:0];
    collectionDifferenceBlock[2](collectionDifferenceBlock, 0, v6);
  }
}

- (SPBeaconManagerXPCProtocol)proxy
{
  v3 = [(SPBeaconManagerSimpleBeaconUpdateInterface *)self session];

  if (!v3)
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__SPBeaconManagerSimpleBeaconUpdateInterface_proxy__block_invoke;
    aBlock[3] = &unk_1E601B7B8;
    objc_copyWeak(&v21, &location);
    id v4 = _Block_copy(aBlock);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __51__SPBeaconManagerSimpleBeaconUpdateInterface_proxy__block_invoke_2;
    v18 = &unk_1E601B7B8;
    objc_copyWeak(&v19, &location);
    int v5 = _Block_copy(&v15);
    id v6 = objc_alloc(MEMORY[0x1E4F61588]);
    int v7 = +[SPBeaconManagerSimpleBeaconUpdateInterface exportedInterface];
    int v8 = +[SPBeaconManagerSimpleBeaconUpdateInterface remoteInterface];
    uint64_t v9 = objc_msgSend(v6, "initWithMachServiceName:options:exportedObject:exportedInterface:remoteObjectInterface:interruptionHandler:invalidationHandler:", @"com.apple.icloud.searchpartyd.beaconmanager.simplebeacon", 0, self, v7, v8, v4, v5, v15, v16, v17, v18);

    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F61590]) initWithServiceDescription:v9];
    [(SPBeaconManagerSimpleBeaconUpdateInterface *)self setSession:v10];

    v11 = [(SPBeaconManagerSimpleBeaconUpdateInterface *)self session];
    [v11 resume];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  uint64_t v12 = [(SPBeaconManagerSimpleBeaconUpdateInterface *)self session];
  id v13 = [v12 proxy];

  return (SPBeaconManagerXPCProtocol *)v13;
}

void __51__SPBeaconManagerSimpleBeaconUpdateInterface_proxy__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained interruptionHandler:v3];
}

void __51__SPBeaconManagerSimpleBeaconUpdateInterface_proxy__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained invalidationHandler:v3];
}

+ (id)exportedInterface
{
  if (exportedInterface_onceToken_2 != -1) {
    dispatch_once(&exportedInterface_onceToken_2, &__block_literal_global_3);
  }
  v2 = (void *)exportedInterface_interface_2;

  return v2;
}

void __63__SPBeaconManagerSimpleBeaconUpdateInterface_exportedInterface__block_invoke()
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B34B10];
  v1 = (void *)exportedInterface_interface_2;
  exportedInterface_interface_2 = v0;

  v2 = (void *)exportedInterface_interface_2;
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  int v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_receivedSimpleBeaconUpdates_ argumentIndex:0 ofReply:0];

  id v6 = (void *)exportedInterface_interface_2;
  int v7 = (void *)MEMORY[0x1E4F1CAD0];
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  uint64_t v9 = [v7 setWithArray:v8];
  [v6 setClasses:v9 forSelector:sel_receivedSimpleBeaconRemovals_ argumentIndex:0 ofReply:0];
}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken_2 != -1) {
    dispatch_once(&remoteInterface_onceToken_2, &__block_literal_global_71);
  }
  v2 = (void *)remoteInterface_interface_2;

  return v2;
}

uint64_t __61__SPBeaconManagerSimpleBeaconUpdateInterface_remoteInterface__block_invoke()
{
  remoteInterface_interface_2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B44050];

  return MEMORY[0x1F41817F8]();
}

- (void)receivedSimpleBeaconUpdates:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v11 = "-[SPBeaconManagerSimpleBeaconUpdateInterface receivedSimpleBeaconUpdates:]";
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPBeaconManagerSimpleBeaconUpdateInterface: SPI: %{public}s", buf, 0xCu);
  }

  id v6 = [(SPBeaconManagerSimpleBeaconUpdateInterface *)self serialQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__SPBeaconManagerSimpleBeaconUpdateInterface_receivedSimpleBeaconUpdates___block_invoke;
  v8[3] = &unk_1E601B920;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __74__SPBeaconManagerSimpleBeaconUpdateInterface_receivedSimpleBeaconUpdates___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v40 = a1;
  if ([*(id *)(a1 + 32) reconnectionUpdate])
  {
    [*(id *)(v1 + 32) setReconnectionUpdate:0];
    v2 = objc_msgSend(*(id *)(v1 + 40), "fm_map:", &__block_literal_global_186);
    id v3 = objc_opt_new();
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v4 = *(id *)(*(void *)(v1 + 32) + 16);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v49 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          id v10 = objc_msgSend(v9, "identifier", v40);
          char v11 = [v2 containsObject:v10];

          if ((v11 & 1) == 0)
          {
            uint64_t v12 = [v9 identifier];
            [v3 addObject:v12];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v48 objects:v57 count:16];
      }
      while (v6);
    }

    uint64_t v1 = v40;
    [*(id *)(v40 + 32) _processRemovals:v3];
  }
  id v13 = *(id *)(*(void *)(v1 + 32) + 16);
  uint64_t v14 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v15 = [v13 count];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = *(id *)(v1 + 40);
  uint64_t v16 = [obj countByEnumeratingWithState:&v44 objects:v56 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v45 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __74__SPBeaconManagerSimpleBeaconUpdateInterface_receivedSimpleBeaconUpdates___block_invoke_3;
        v43[3] = &unk_1E601BA78;
        v43[4] = v20;
        uint64_t v21 = objc_msgSend(v13, "indexOfObjectPassingTest:", v43, v40);
        id v22 = objc_alloc(MEMORY[0x1E4F28F18]);
        if (v21 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v23 = (void *)[v22 initWithObject:v20 type:0 index:v15];
          [v14 addObject:v23];

          v24 = LogCategory_BeaconManager();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = [v20 identifier];
            *(_DWORD *)buf = 134218242;
            uint64_t v53 = v15;
            __int16 v54 = 2112;
            v55 = v25;
            _os_log_impl(&dword_1B2FD8000, v24, OS_LOG_TYPE_DEFAULT, "SimpleBeaconUpdate receivedSimpleBeaconUpdates. Change: Insert, index: %lu, id: %@.", buf, 0x16u);
          }
          ++v15;
        }
        else
        {
          uint64_t v42 = v15;
          uint64_t v26 = v17;
          v27 = (void *)[v22 initWithObject:v20 type:1 index:v21];
          [v14 addObject:v27];

          v28 = (void *)[objc_alloc(MEMORY[0x1E4F28F18]) initWithObject:v20 type:0 index:v21];
          [v14 addObject:v28];

          v29 = LogCategory_BeaconManager();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            [v20 identifier];
            v31 = id v30 = v13;
            *(_DWORD *)buf = 134218242;
            uint64_t v53 = v21;
            __int16 v54 = 2112;
            v55 = v31;
            _os_log_impl(&dword_1B2FD8000, v29, OS_LOG_TYPE_DEFAULT, "SimpleBeaconUpdate receivedSimpleBeaconUpdates. Change: Remove, index: %lu, id: %@.", buf, 0x16u);

            id v13 = v30;
          }

          v32 = LogCategory_BeaconManager();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v33 = [v20 identifier];
            *(_DWORD *)buf = 134218242;
            uint64_t v53 = v21;
            __int16 v54 = 2112;
            v55 = v33;
            _os_log_impl(&dword_1B2FD8000, v32, OS_LOG_TYPE_DEFAULT, "SimpleBeaconUpdate receivedSimpleBeaconUpdates. Change: Insert, index: %lu, id: %@.", buf, 0x16u);
          }
          uint64_t v17 = v26;
          uint64_t v15 = v42;
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v44 objects:v56 count:16];
    }
    while (v17);
  }

  v34 = (void *)[objc_alloc(MEMORY[0x1E4F28F20]) initWithChanges:v14];
  uint64_t v35 = [v13 arrayByApplyingDifference:v34];
  uint64_t v36 = *(void *)(v40 + 32);
  v37 = *(void **)(v36 + 16);
  *(void *)(v36 + 16) = v35;

  v38 = [*(id *)(v40 + 32) collectionDifferenceBlock];

  if (v38)
  {
    v39 = [*(id *)(v40 + 32) collectionDifferenceBlock];
    ((void (**)(void, void *, void))v39)[2](v39, v34, 0);
  }
}

uint64_t __74__SPBeaconManagerSimpleBeaconUpdateInterface_receivedSimpleBeaconUpdates___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __74__SPBeaconManagerSimpleBeaconUpdateInterface_receivedSimpleBeaconUpdates___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 identifier];
  uint64_t v7 = [*(id *)(a1 + 32) identifier];
  uint64_t v8 = [v6 isEqual:v7];

  *a4 = v8;
  return v8;
}

- (void)receivedSimpleBeaconRemovals:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    char v11 = "-[SPBeaconManagerSimpleBeaconUpdateInterface receivedSimpleBeaconRemovals:]";
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPBeaconManagerSimpleBeaconUpdateInterface: SPI: %{public}s", buf, 0xCu);
  }

  uint64_t v6 = [(SPBeaconManagerSimpleBeaconUpdateInterface *)self serialQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__SPBeaconManagerSimpleBeaconUpdateInterface_receivedSimpleBeaconRemovals___block_invoke;
  v8[3] = &unk_1E601B920;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

uint64_t __75__SPBeaconManagerSimpleBeaconUpdateInterface_receivedSimpleBeaconRemovals___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processRemovals:*(void *)(a1 + 40)];
}

- (void)_processRemovals:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SPBeaconManagerSimpleBeaconUpdateInterface *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  if ([v4 count])
  {
    v23 = self;
    uint64_t v6 = self->_simpleBeacons;
    v25 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v24 = v4;
    obuint64_t j = v4;
    uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __63__SPBeaconManagerSimpleBeaconUpdateInterface__processRemovals___block_invoke;
          v27[3] = &unk_1E601BA78;
          v27[4] = v11;
          uint64_t v12 = -[NSArray indexOfObjectPassingTest:](v6, "indexOfObjectPassingTest:", v27, v23);
          if (v12 == 0x7FFFFFFFFFFFFFFFLL)
          {
            id v13 = LogCategory_BeaconManager();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v33 = v11;
              _os_log_impl(&dword_1B2FD8000, v13, OS_LOG_TYPE_DEFAULT, "SimpleBeaconUpdate receivedSimpleBeaconRemovals. Change: none, index: none, id: %@.", buf, 0xCu);
            }
          }
          else
          {
            uint64_t v14 = v12;
            id v15 = objc_alloc(MEMORY[0x1E4F28F18]);
            uint64_t v16 = [(NSArray *)v6 objectAtIndexedSubscript:v14];
            uint64_t v17 = (void *)[v15 initWithObject:v16 type:1 index:v14];
            [v25 addObject:v17];

            id v13 = LogCategory_BeaconManager();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              uint64_t v33 = v14;
              __int16 v34 = 2112;
              uint64_t v35 = v11;
              _os_log_impl(&dword_1B2FD8000, v13, OS_LOG_TYPE_DEFAULT, "SimpleBeaconUpdate receivedSimpleBeaconRemovals. Change: remove, index: %lu, id: %@.", buf, 0x16u);
            }
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v8);
    }

    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F28F20]) initWithChanges:v25];
    uint64_t v19 = [(NSArray *)v6 arrayByApplyingDifference:v18];
    simpleBeacons = v23->_simpleBeacons;
    v23->_simpleBeacons = (NSArray *)v19;

    uint64_t v21 = [(SPBeaconManagerSimpleBeaconUpdateInterface *)v23 collectionDifferenceBlock];

    if (v21)
    {
      id v22 = [(SPBeaconManagerSimpleBeaconUpdateInterface *)v23 collectionDifferenceBlock];
      ((void (**)(void, void *, void))v22)[2](v22, v18, 0);
    }
    id v4 = v24;
  }
}

uint64_t __63__SPBeaconManagerSimpleBeaconUpdateInterface__processRemovals___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 identifier];
  uint64_t v7 = [v6 isEqual:*(void *)(a1 + 32)];

  *a4 = v7;
  return v7;
}

- (void)removeObservers
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v8 = "-[SPBeaconManagerSimpleBeaconUpdateInterface removeObservers]";
    _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "SPBeaconManagerSimpleBeaconUpdateInterface: SPI: %{public}s", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__SPBeaconManagerSimpleBeaconUpdateInterface_removeObservers__block_invoke;
  block[3] = &unk_1E601B790;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  id v4 = (void *)MEMORY[0x1B3EB48A0]();
  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:SPSimpleBeaconUpdateInterfaceReconnect object:0];
}

void __61__SPBeaconManagerSimpleBeaconUpdateInterface_removeObservers__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1B3EB48A0]();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), @"SPSimpleBeaconUpdateInterfaceReconnectNotification", 0);
}

- (void)handleReconnection
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v7 = "-[SPBeaconManagerSimpleBeaconUpdateInterface handleReconnection]";
    _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "SPBeaconManagerSimpleBeaconUpdateInterface: SPI: %{public}s", buf, 0xCu);
  }

  [(SPBeaconManagerSimpleBeaconUpdateInterface *)self removeObservers];
  id v4 = [(SPBeaconManagerSimpleBeaconUpdateInterface *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SPBeaconManagerSimpleBeaconUpdateInterface_handleReconnection__block_invoke;
  block[3] = &unk_1E601B790;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __64__SPBeaconManagerSimpleBeaconUpdateInterface_handleReconnection__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  id v3 = (id)[v2 copy];

  [*(id *)(a1 + 32) setReconnectionUpdate:1];
  [*(id *)(a1 + 32) startUpdatingSimpleBeaconsWithContext:v3 completion:&__block_literal_global_193];
}

void __64__SPBeaconManagerSimpleBeaconUpdateInterface_handleReconnection__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = LogCategory_BeaconManager();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64__SPBeaconManagerSimpleBeaconUpdateInterface_handleReconnection__block_invoke_2_cold_1(v3, v4);
  }
}

- (void)setSimpleBeacons:(id)a3
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

- (id)collectionDifferenceBlock
{
  return self->_collectionDifferenceBlock;
}

- (void)setCollectionDifferenceBlock:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (SPSimpleBeaconContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (BOOL)reconnectionUpdate
{
  return self->_reconnectionUpdate;
}

- (void)setReconnectionUpdate:(BOOL)a3
{
  self->_reconnectionUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong(&self->_collectionDifferenceBlock, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_simpleBeacons, 0);
}

void __64__SPBeaconManagerSimpleBeaconUpdateInterface_handleReconnection__block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 localizedDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1B2FD8000, a2, OS_LOG_TYPE_ERROR, "Failed reconnecting to daemon after retry: %@.", (uint8_t *)&v4, 0xCu);
}

@end