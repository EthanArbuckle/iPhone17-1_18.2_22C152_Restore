@interface VGVirtualGarageServer
+ (BOOL)canUseVirtualGarageXPCService;
+ (id)sharedServer;
- (BOOL)hostsVirtualGarage;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)activeConnections;
- (NSXPCListener)listener;
- (OS_dispatch_queue)observerQueue;
- (VGVirtualGarage)garage;
- (VGVirtualGarageObserver)observer;
- (VGVirtualGarageServer)init;
- (void)_cleanUp;
- (void)_setupVirtualGarageHostingIfNeeded;
- (void)dealloc;
- (void)setActiveConnections:(id)a3;
- (void)setGarage:(id)a3;
- (void)setHostsVirtualGarage:(BOOL)a3;
- (void)setListener:(id)a3;
- (void)setObserver:(id)a3;
- (void)setObserverQueue:(id)a3;
- (void)startWithPersister:(id)a3;
- (void)stop;
- (void)valueChangedForGEOConfigKey:(id)a3;
- (void)virtualGarage:(id)a3 didUpdateUnpairedVehicles:(id)a4;
- (void)virtualGarageAddVehicle:(id)a3;
- (void)virtualGarageDidUpdate:(id)a3;
- (void)virtualGarageEndContinuousUpdates;
- (void)virtualGarageForceFetchAllVehicles;
- (void)virtualGarageGetGarageWithReply:(id)a3;
- (void)virtualGarageGetLatestStateOfVehicleWithIdentifier:(id)a3 syncAcrossDevices:(BOOL)a4 withReply:(id)a5;
- (void)virtualGarageGetListOfUnpairedVehiclesWithReply:(id)a3;
- (void)virtualGarageOnboardVehicle:(id)a3;
- (void)virtualGarageRemoveVehicle:(id)a3;
- (void)virtualGarageSaveVehicle:(id)a3;
- (void)virtualGarageSelectVehicle:(id)a3;
- (void)virtualGarageSetAssumesFullCharge:(BOOL)a3;
- (void)virtualGarageSetShouldUsePreferredNetworks:(BOOL)a3 forVehicle:(id)a4;
- (void)virtualGarageStartContinuousUpdatesIfNeeded;
@end

@implementation VGVirtualGarageServer

void __60__VGVirtualGarageServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C59C600];
    [*(id *)(a1 + 32) setRemoteObjectInterface:v4];

    v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C59AF00];
    [*(id *)(a1 + 32) setExportedInterface:v5];

    v6 = [WeakRetained garage];
    [*(id *)(a1 + 32) setExportedObject:v6];

    [*(id *)(a1 + 32) setInterruptionHandler:&__block_literal_global_45];
    objc_initWeak(&location, *(id *)(a1 + 32));
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__VGVirtualGarageServer_listener_shouldAcceptNewConnection___block_invoke_46;
    v7[3] = &unk_264226820;
    objc_copyWeak(&v8, v2);
    objc_copyWeak(&v9, &location);
    [*(id *)(a1 + 32) setInvalidationHandler:v7];
    [WeakRetained[8] addObject:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) resume];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    [*(id *)(a1 + 32) invalidate];
  }
}

- (VGVirtualGarage)garage
{
  garage = self->_garage;
  if (!garage)
  {
    v4 = [[VGVirtualGarage alloc] initWithGaragePersister:self->_persister];
    v5 = self->_garage;
    self->_garage = v4;

    [(VGVirtualGarage *)self->_garage setDelegate:self];
    garage = self->_garage;
  }

  return garage;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [v5 valueForEntitlement:@"com.apple.maps.virtualgarage.vehicles"];
  char v7 = [v6 BOOLValue];

  if ((v7 & 1) == 0)
  {
    v12 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      v13 = VGProcessNameForPID([v5 processIdentifier]);
      *(_DWORD *)id location = 138412546;
      *(void *)&location[4] = v13;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_214A2C000, v12, OS_LOG_TYPE_FAULT, "Unauthorized access from: %@ to VG XPC service from connection: %@", location, 0x16u);
    }
    goto LABEL_8;
  }
  char IsEnabled_EVRouting = MapsFeature_IsEnabled_EVRouting();
  int IsEnabled_Alberta = MapsFeature_IsEnabled_Alberta();
  if ((IsEnabled_EVRouting & 1) == 0 && !IsEnabled_Alberta)
  {
LABEL_8:
    BOOL v11 = 0;
    goto LABEL_9;
  }
  objc_initWeak((id *)location, self);
  isolationQueue = self->_isolationQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __60__VGVirtualGarageServer_listener_shouldAcceptNewConnection___block_invoke;
  v15[3] = &unk_264226208;
  objc_copyWeak(&v17, (id *)location);
  id v16 = v5;
  dispatch_async(isolationQueue, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)location);
  BOOL v11 = 1;
LABEL_9:

  return v11;
}

void __48__VGVirtualGarageServer_virtualGarageDidUpdate___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = WeakRetained[8];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
          v11[0] = MEMORY[0x263EF8330];
          v11[1] = 3221225472;
          v11[2] = __48__VGVirtualGarageServer_virtualGarageDidUpdate___block_invoke_3;
          v11[3] = &unk_264226848;
          id v12 = *(id *)(a1 + 32);
          v10 = [v9 remoteObjectProxyWithErrorHandler:v11];
          [v10 virtualGarageDidUpdate:*(void *)(a1 + 32)];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
}

- (void)virtualGarageDidUpdate:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v20 = "-[VGVirtualGarageServer virtualGarageDidUpdate:]";
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v6 = [(VGVirtualGarageServer *)self observer];

  if (v6)
  {
    uint64_t v7 = [(VGVirtualGarageServer *)self observerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__VGVirtualGarageServer_virtualGarageDidUpdate___block_invoke;
    block[3] = &unk_264226208;
    uint64_t v8 = &v18;
    objc_copyWeak(&v18, (id *)buf);
    id v17 = v4;
    id v9 = v4;
    dispatch_async(v7, block);

    v10 = &v17;
  }
  else
  {
    isolationQueue = self->_isolationQueue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __48__VGVirtualGarageServer_virtualGarageDidUpdate___block_invoke_2;
    v13[3] = &unk_264226208;
    uint64_t v8 = &v15;
    objc_copyWeak(&v15, (id *)buf);
    v10 = &v14;
    id v14 = v4;
    id v12 = v4;
    dispatch_async(isolationQueue, v13);
  }

  objc_destroyWeak(v8);
  objc_destroyWeak((id *)buf);
}

- (VGVirtualGarageObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (VGVirtualGarageObserver *)WeakRetained;
}

- (VGVirtualGarageServer)init
{
  v11.receiver = self;
  v11.super_class = (Class)VGVirtualGarageServer;
  v2 = [(VGVirtualGarageServer *)&v11 init];
  if (v2)
  {
    id v3 = [NSString stringWithFormat:@"com.apple.maps.virtualgarage.server.%@.%p", objc_opt_class(), v2];
    id v4 = (const char *)[v3 UTF8String];
    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_opt_new();
    activeConnections = v2->_activeConnections;
    v2->_activeConnections = (NSMutableArray *)v8;

    [(VGVirtualGarageServer *)v2 _setupVirtualGarageHostingIfNeeded];
  }
  return v2;
}

- (NSXPCListener)listener
{
  listener = self->_listener;
  if (!listener)
  {
    id v4 = (NSXPCListener *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.maps.virtualgarage.server"];
    uint64_t v5 = self->_listener;
    self->_listener = v4;

    [(NSXPCListener *)self->_listener setDelegate:self];
    listener = self->_listener;
  }

  return listener;
}

+ (id)sharedServer
{
  if (_MergedGlobals_5 != -1) {
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_8);
  }
  v2 = (void *)qword_26AB30FC8;

  return v2;
}

uint64_t __37__VGVirtualGarageServer_sharedServer__block_invoke()
{
  qword_26AB30FC8 = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  GEOConfigRemoveDelegateListenerForAllKeys();
  v3.receiver = self;
  v3.super_class = (Class)VGVirtualGarageServer;
  [(VGVirtualGarageServer *)&v3 dealloc];
}

+ (BOOL)canUseVirtualGarageXPCService
{
  return 1;
}

- (void)startWithPersister:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_persister, a3);
  if (+[VGVirtualGarageServer canUseVirtualGarageXPCService])
  {
    objc_initWeak(&location, self);
    isolationQueue = self->_isolationQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__VGVirtualGarageServer_startWithPersister___block_invoke;
    v7[3] = &unk_2642260C8;
    objc_copyWeak(&v8, &location);
    dispatch_async(isolationQueue, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __44__VGVirtualGarageServer_startWithPersister___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = VGGetVirtualGarageLog();
  objc_super v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v4 = [WeakRetained listener];
      int v5 = 138412290;
      dispatch_queue_t v6 = v4;
      _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_INFO, "Started listening for connections: %@", (uint8_t *)&v5, 0xCu);
    }
    objc_super v3 = [WeakRetained listener];
    [v3 resume];
  }
  else if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    dispatch_queue_t v6 = "-[VGVirtualGarageServer startWithPersister:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 102;
    _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v5, 0x12u);
  }
}

- (void)stop
{
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__VGVirtualGarageServer_stop__block_invoke;
  v4[3] = &unk_2642260C8;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __29__VGVirtualGarageServer_stop__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = VGGetVirtualGarageLog();
  objc_super v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_INFO, "Stopped virtualGarageServer", (uint8_t *)&v5, 2u);
    }

    [WeakRetained _cleanUp];
    id v4 = [WeakRetained listener];
    [v4 invalidate];

    [WeakRetained setListener:0];
  }
  else
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      dispatch_queue_t v6 = "-[VGVirtualGarageServer stop]_block_invoke";
      __int16 v7 = 1024;
      int v8 = 113;
      _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v5, 0x12u);
    }
  }
}

- (void)_cleanUp
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v3 = self->_activeConnections;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "invalidate", (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_activeConnections removeAllObjects];
  garage = self->_garage;
  self->_garage = 0;
}

- (void)setHostsVirtualGarage:(BOOL)a3
{
  if (self->_hostsVirtualGarage != a3)
  {
    self->_hostsVirtualGarage = a3;
    if (!a3) {
      [(VGVirtualGarageServer *)self _cleanUp];
    }
  }
}

- (void)_setupVirtualGarageHostingIfNeeded
{
  _GEOConfigAddDelegateListenerForKey();
  _GEOConfigAddDelegateListenerForKey();
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__VGVirtualGarageServer__setupVirtualGarageHostingIfNeeded__block_invoke;
  v4[3] = &unk_2642260C8;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __59__VGVirtualGarageServer__setupVirtualGarageHostingIfNeeded__block_invoke(uint64_t a1)
{
  int IsEnabled_EVRouting = MapsFeature_IsEnabled_EVRouting();
  uint64_t v3 = IsEnabled_EVRouting | MapsFeature_IsEnabled_Alberta();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setHostsVirtualGarage:v3];
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v4 = a3.var0 == *MEMORY[0x263F41700] && a3.var1 == *(void **)(MEMORY[0x263F41700] + 8);
  if (v4 || (a3.var0 == *MEMORY[0x263F416F8] ? (BOOL v5 = a3.var1 == *(void **)(MEMORY[0x263F416F8] + 8)) : (BOOL v5 = 0), v5))
  {
    int IsEnabled_EVRouting = MapsFeature_IsEnabled_EVRouting();
    uint64_t v7 = IsEnabled_EVRouting | MapsFeature_IsEnabled_Alberta();
    int v8 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      long long v9 = @"NO";
      if (v7) {
        long long v9 = @"YES";
      }
      long long v10 = v9;
      int v11 = 138412290;
      long long v12 = v10;
      _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_INFO, "VGServer: GEOConfigs changed. VirtualGarageIsEnabled: %@", (uint8_t *)&v11, 0xCu);
    }
    [(VGVirtualGarageServer *)self setHostsVirtualGarage:v7];
  }
}

void __60__VGVirtualGarageServer_listener_shouldAcceptNewConnection___block_invoke_2()
{
  v0 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_214A2C000, v0, OS_LOG_TYPE_ERROR, "Service connection interrupted", v1, 2u);
  }
}

void __60__VGVirtualGarageServer_listener_shouldAcceptNewConnection___block_invoke_46(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214A2C000, v2, OS_LOG_TYPE_INFO, "Service connection invalidated", buf, 2u);
  }

  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v5 = WeakRetained[1];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__VGVirtualGarageServer_listener_shouldAcceptNewConnection___block_invoke_47;
    v7[3] = &unk_264226820;
    objc_copyWeak(&v8, (id *)(a1 + 32));
    objc_copyWeak(&v9, (id *)(a1 + 40));
    dispatch_async(v5, v7);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v8);
  }
  else
  {
    uint64_t v6 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v11 = "-[VGVirtualGarageServer listener:shouldAcceptNewConnection:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 203;
      _os_log_impl(&dword_214A2C000, v6, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", buf, 0x12u);
    }
  }
}

void __60__VGVirtualGarageServer_listener_shouldAcceptNewConnection___block_invoke_47(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v3)
    {
      BOOL v4 = v3;
      BOOL v5 = [WeakRetained activeConnections];
      [v5 removeObject:v4];

      uint64_t v6 = [WeakRetained activeConnections];
      uint64_t v7 = [v6 count];

      if (!v7) {
        [WeakRetained _cleanUp];
      }
    }
    else
    {
      id v8 = VGGetVirtualGarageLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315394;
        long long v10 = "-[VGVirtualGarageServer listener:shouldAcceptNewConnection:]_block_invoke";
        __int16 v11 = 1024;
        int v12 = 206;
        _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_ERROR, "strongConnection went away in %s line %d", (uint8_t *)&v9, 0x12u);
      }

      BOOL v4 = 0;
    }
  }
  else
  {
    BOOL v4 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      long long v10 = "-[VGVirtualGarageServer listener:shouldAcceptNewConnection:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 205;
      _os_log_impl(&dword_214A2C000, v4, OS_LOG_TYPE_ERROR, "strongSelf3 went away in %s line %d", (uint8_t *)&v9, 0x12u);
    }
  }
}

void __48__VGVirtualGarageServer_virtualGarageDidUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained observer];
  [v2 virtualGarageDidUpdate:*(void *)(a1 + 32)];
}

void __48__VGVirtualGarageServer_virtualGarageDidUpdate___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    uint64_t v7 = "-[VGVirtualGarageServer virtualGarageDidUpdate:]_block_invoke_3";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_214A2C000, v4, OS_LOG_TYPE_ERROR, "%s %@ %@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)virtualGarage:(id)a3 didUpdateUnpairedVehicles:(id)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v36 = a3;
  id v37 = a4;
  uint64_t v5 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = v37;
    uint64_t v7 = v6;
    if (v6)
    {
      if ([v6 count])
      {
        v35 = v7;
        __int16 v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v9 = v7;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v47 objects:buf count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v48 != v11) {
                objc_enumerationMutation(v9);
              }
              uint64_t v13 = *(void **)(*((void *)&v47 + 1) + 8 * i);
              if (v13)
              {
                uint64_t v14 = NSString;
                id v15 = v13;
                long long v16 = [v14 stringWithFormat:@"%@<%p>", objc_opt_class(), v15];
              }
              else
              {
                long long v16 = @"<nil>";
              }
              [v8 addObject:v16];
            }
            uint64_t v10 = [v9 countByEnumeratingWithState:&v47 objects:buf count:16];
          }
          while (v10);
        }

        id v17 = [v9 componentsJoinedByString:@", "];
        id v18 = NSString;
        id v19 = v9;
        id v20 = [v18 stringWithFormat:@"%@<%p>", objc_opt_class(), v19];

        __int16 v21 = [v18 stringWithFormat:@"%@ [%@]", v20, v17];

        uint64_t v7 = v35;
      }
      else
      {
        id v22 = NSString;
        id v23 = v7;
        v24 = [v22 stringWithFormat:@"%@<%p>", objc_opt_class(), v23];

        __int16 v21 = [v22 stringWithFormat:@"%@ (empty)", v24];
      }
    }
    else
    {
      __int16 v21 = @"<nil>";
    }

    *(_DWORD *)buf = 136315650;
    v52 = "-[VGVirtualGarageServer virtualGarage:didUpdateUnpairedVehicles:]";
    __int16 v53 = 2112;
    id v54 = v36;
    __int16 v55 = 2112;
    v56 = v21;
    _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "%s %@, %@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  v25 = [(VGVirtualGarageServer *)self observer];

  if (v25)
  {
    v26 = [(VGVirtualGarageServer *)self observerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__VGVirtualGarageServer_virtualGarage_didUpdateUnpairedVehicles___block_invoke;
    block[3] = &unk_2642261B8;
    v27 = &v46;
    objc_copyWeak(&v46, (id *)buf);
    id v44 = v36;
    id v45 = v37;
    id v28 = v37;
    id v29 = v36;
    dispatch_async(v26, block);

    v30 = &v44;
    v31 = &v45;
  }
  else
  {
    isolationQueue = self->_isolationQueue;
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __65__VGVirtualGarageServer_virtualGarage_didUpdateUnpairedVehicles___block_invoke_2;
    v39[3] = &unk_2642261B8;
    v27 = &v42;
    objc_copyWeak(&v42, (id *)buf);
    v30 = &v40;
    v31 = &v41;
    id v40 = v36;
    id v41 = v37;
    id v33 = v37;
    id v34 = v36;
    dispatch_async(isolationQueue, v39);
  }

  objc_destroyWeak(v27);
  objc_destroyWeak((id *)buf);
}

void __65__VGVirtualGarageServer_virtualGarage_didUpdateUnpairedVehicles___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained observer];
  [v2 virtualGarage:*(void *)(a1 + 32) didUpdateUnpairedVehicles:*(void *)(a1 + 40)];
}

void __65__VGVirtualGarageServer_virtualGarage_didUpdateUnpairedVehicles___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = WeakRetained[8];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
          v11[0] = MEMORY[0x263EF8330];
          v11[1] = 3221225472;
          v11[2] = __65__VGVirtualGarageServer_virtualGarage_didUpdateUnpairedVehicles___block_invoke_3;
          v11[3] = &unk_264226848;
          id v12 = *(id *)(a1 + 32);
          uint64_t v10 = [v9 remoteObjectProxyWithErrorHandler:v11];
          [v10 virtualGarage:*(void *)(a1 + 32) didUpdateUnpairedVehicles:*(void *)(a1 + 40)];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
}

void __65__VGVirtualGarageServer_virtualGarage_didUpdateUnpairedVehicles___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    uint64_t v7 = "-[VGVirtualGarageServer virtualGarage:didUpdateUnpairedVehicles:]_block_invoke_3";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_214A2C000, v4, OS_LOG_TYPE_ERROR, "%s %@ %@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)virtualGarageAddVehicle:(id)a3
{
  id v4 = a3;
  id v5 = [(VGVirtualGarageServer *)self garage];
  [v5 virtualGarageAddVehicle:v4];
}

- (void)virtualGarageRemoveVehicle:(id)a3
{
  id v4 = a3;
  id v5 = [(VGVirtualGarageServer *)self garage];
  [v5 virtualGarageRemoveVehicle:v4];
}

- (void)virtualGarageSaveVehicle:(id)a3
{
  id v4 = a3;
  id v5 = [(VGVirtualGarageServer *)self garage];
  [v5 virtualGarageSaveVehicle:v4];
}

- (void)virtualGarageSelectVehicle:(id)a3
{
  id v4 = a3;
  id v5 = [(VGVirtualGarageServer *)self garage];
  [v5 virtualGarageSelectVehicle:v4];
}

- (void)virtualGarageOnboardVehicle:(id)a3
{
  id v4 = a3;
  id v5 = [(VGVirtualGarageServer *)self garage];
  [v5 virtualGarageOnboardVehicle:v4];
}

- (void)virtualGarageSetShouldUsePreferredNetworks:(BOOL)a3 forVehicle:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(VGVirtualGarageServer *)self garage];
  [v7 virtualGarageSetShouldUsePreferredNetworks:v4 forVehicle:v6];
}

- (void)virtualGarageStartContinuousUpdatesIfNeeded
{
  id v2 = [(VGVirtualGarageServer *)self garage];
  [v2 virtualGarageStartContinuousUpdatesIfNeeded];
}

- (void)virtualGarageEndContinuousUpdates
{
  id v2 = [(VGVirtualGarageServer *)self garage];
  [v2 virtualGarageEndContinuousUpdates];
}

- (void)virtualGarageSetAssumesFullCharge:(BOOL)a3
{
}

- (void)virtualGarageForceFetchAllVehicles
{
  id v2 = [(VGVirtualGarageServer *)self garage];
  [v2 virtualGarageForceFetchAllVehicles];
}

- (void)virtualGarageGetGarageWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(VGVirtualGarageServer *)self garage];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__VGVirtualGarageServer_virtualGarageGetGarageWithReply___block_invoke;
  v7[3] = &unk_264226898;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 virtualGarageGetGarageWithReply:v7];
}

void __57__VGVirtualGarageServer_virtualGarageGetGarageWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) observerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__VGVirtualGarageServer_virtualGarageGetGarageWithReply___block_invoke_2;
  block[3] = &unk_264226870;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __57__VGVirtualGarageServer_virtualGarageGetGarageWithReply___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)virtualGarageGetListOfUnpairedVehiclesWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(VGVirtualGarageServer *)self garage];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__VGVirtualGarageServer_virtualGarageGetListOfUnpairedVehiclesWithReply___block_invoke;
  v7[3] = &unk_2642268C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 virtualGarageGetListOfUnpairedVehiclesWithReply:v7];
}

void __73__VGVirtualGarageServer_virtualGarageGetListOfUnpairedVehiclesWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) observerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__VGVirtualGarageServer_virtualGarageGetListOfUnpairedVehiclesWithReply___block_invoke_2;
  block[3] = &unk_264226870;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __73__VGVirtualGarageServer_virtualGarageGetListOfUnpairedVehiclesWithReply___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)virtualGarageGetLatestStateOfVehicleWithIdentifier:(id)a3 syncAcrossDevices:(BOOL)a4 withReply:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(VGVirtualGarageServer *)self garage];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __104__VGVirtualGarageServer_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke;
  v12[3] = &unk_2642268E8;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 virtualGarageGetLatestStateOfVehicleWithIdentifier:v9 syncAcrossDevices:v5 withReply:v12];
}

void __104__VGVirtualGarageServer_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) observerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __104__VGVirtualGarageServer_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke_2;
  block[3] = &unk_264226870;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __104__VGVirtualGarageServer_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setObserver:(id)a3
{
}

- (OS_dispatch_queue)observerQueue
{
  return self->_observerQueue;
}

- (void)setObserverQueue:(id)a3
{
}

- (BOOL)hostsVirtualGarage
{
  return self->_hostsVirtualGarage;
}

- (void)setGarage:(id)a3
{
}

- (void)setListener:(id)a3
{
}

- (NSMutableArray)activeConnections
{
  return self->_activeConnections;
}

- (void)setActiveConnections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConnections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_garage, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_persister, 0);

  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end