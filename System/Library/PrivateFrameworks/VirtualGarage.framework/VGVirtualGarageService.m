@interface VGVirtualGarageService
+ (BOOL)canUseVirtualGarageXPCService;
+ (id)sharedService;
- (NSString)activeVehicleIdentifier;
- (NSXPCConnection)connection;
- (VGVirtualGarageService)init;
- (id)messageTargetWithErrorReply:(id)a3;
- (void)_clearActiveVehicleIdentifierIfNeeded:(id)a3;
- (void)_closeConnection;
- (void)_openConnection;
- (void)closeForClient:(id)a3;
- (void)openForClient:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setActiveVehicleIdentifier:(id)a3;
- (void)setConnection:(id)a3;
- (void)unregisterObserver:(id)a3;
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

@implementation VGVirtualGarageService

void __40__VGVirtualGarageService_openForClient___block_invoke_17(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _openConnection];
}

- (void)_openConnection
{
  v3 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_INFO, "VGVirtualGarageService opening connection", (uint8_t *)buf, 2u);
  }

  v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.maps.virtualgarage.server" options:0];
  connection = self->_connection;
  self->_connection = v4;

  v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C59AF00];
  v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v6 setClasses:v9 forSelector:sel_virtualGarageGetListOfUnpairedVehiclesWithReply_ argumentIndex:0 ofReply:1];

  v10 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v6 setClasses:v10 forSelector:sel_virtualGarageGetListOfUnpairedVehiclesWithReply_ argumentIndex:1 ofReply:1];

  v11 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v6 setClasses:v11 forSelector:sel_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply_ argumentIndex:0 ofReply:0];

  v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v6 setClasses:v12 forSelector:sel_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply_ argumentIndex:0 ofReply:1];

  v13 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v6 setClasses:v13 forSelector:sel_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply_ argumentIndex:1 ofReply:1];

  [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v6];
  v14 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C59C600];
  v15 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v14 setClasses:v15 forSelector:sel_virtualGarageDidUpdate_ argumentIndex:0 ofReply:0];

  v16 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v14 setClasses:v16 forSelector:sel_virtualGarage_didUpdateUnpairedVehicles_ argumentIndex:0 ofReply:0];

  v17 = (void *)MEMORY[0x263EFFA08];
  uint64_t v18 = objc_opt_class();
  v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  [v14 setClasses:v19 forSelector:sel_virtualGarage_didUpdateUnpairedVehicles_ argumentIndex:1 ofReply:0];

  [(NSXPCConnection *)self->_connection setExportedInterface:v14];
  [(NSXPCConnection *)self->_connection setExportedObject:self];
  [(NSXPCConnection *)self->_connection _setQueue:self->_connectionQueue];
  [(NSXPCConnection *)self->_connection setInterruptionHandler:&__block_literal_global_9];
  objc_initWeak(buf, self);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __41__VGVirtualGarageService__openConnection__block_invoke_57;
  v20[3] = &unk_2642260C8;
  objc_copyWeak(&v21, buf);
  [(NSXPCConnection *)self->_connection setInvalidationHandler:v20];
  [(NSXPCConnection *)self->_connection resume];
  objc_destroyWeak(&v21);
  objc_destroyWeak(buf);
}

void __40__VGVirtualGarageService_openForClient___block_invoke(void *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1[4] + 8) containsObject:a1[5]];
  v3 = VGGetVirtualGarageLog();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      uint64_t v5 = a1[5];
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_214A2C000, v4, OS_LOG_TYPE_FAULT, "Tried to open connection twice for client: %@.", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = a1[5];
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_214A2C000, v4, OS_LOG_TYPE_INFO, "Will openForClient: %@", (uint8_t *)&v7, 0xCu);
    }

    *(void *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 8) count];
    [*(id *)(a1[4] + 8) addObject:a1[5]];
  }
}

- (void)virtualGarageGetListOfUnpairedVehiclesWithReply:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[VGVirtualGarageService virtualGarageGetListOfUnpairedVehiclesWithReply:]";
    _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__VGVirtualGarageService_virtualGarageGetListOfUnpairedVehiclesWithReply___block_invoke;
  v8[3] = &unk_264226428;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(connectionQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

+ (id)sharedService
{
  if (_MergedGlobals_6 != -1) {
    dispatch_once(&_MergedGlobals_6, &__block_literal_global_59_0);
  }
  int v2 = (void *)qword_26AB30FD8;

  return v2;
}

uint64_t __39__VGVirtualGarageService_sharedService__block_invoke()
{
  qword_26AB30FD8 = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (VGVirtualGarageService)init
{
  v23.receiver = self;
  v23.super_class = (Class)VGVirtualGarageService;
  int v2 = [(VGVirtualGarageService *)&v23 init];
  if (v2)
  {
    id v3 = (id) [[NSString alloc] initWithFormat:@"com.apple.maps.virtualgarage.callbacks.%@.%p", objc_opt_class(), v2];
    id v4 = (const char *)[v3 UTF8String];
    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:1];
    clients = v2->_clients;
    v2->_clients = (NSHashTable *)v8;

    uint64_t v10 = geo_isolater_create_with_format();
    clientsIsolater = v2->_clientsIsolater;
    v2->_clientsIsolater = (geo_isolater *)v10;

    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x263F41B50]), "initWithProtocol:queue:", &unk_26C59C600, v2->_callbackQueue, v2);
    observers = v2->_observers;
    v2->_observers = (GEOObserverHashTable *)v12;

    id v14 = (id) [[NSString alloc] initWithFormat:@"com.apple.maps.virtualgarage.service.%@.%p", objc_opt_class(), v2];
    v15 = (const char *)[v14 UTF8String];
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create(v15, v16);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v17;

    if (!+[VGVirtualGarageService canUseVirtualGarageXPCService])
    {
      v19 = +[VGVirtualGarageServer sharedServer];
      [v19 setObserver:v2];

      v20 = v2->_connectionQueue;
      id v21 = +[VGVirtualGarageServer sharedServer];
      [v21 setObserverQueue:v20];
    }
  }
  return v2;
}

- (void)openForClient:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    id v7 = VGGetAssertLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[VGVirtualGarageService openForClient:]";
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = "client == nil";
      *(_WORD *)&buf[22] = 2082;
      v15 = "Can't call openForClient: with a nil client";
      _os_log_impl(&dword_214A2C000, v7, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", buf, 0x20u);
    }
    goto LABEL_7;
  }
  if (+[VGVirtualGarageService canUseVirtualGarageXPCService])
  {
    char IsEnabled_EVRouting = MapsFeature_IsEnabled_EVRouting();
    char IsEnabled_Alberta = MapsFeature_IsEnabled_Alberta();
    if ((IsEnabled_EVRouting & 1) == 0 && (IsEnabled_Alberta & 1) == 0)
    {
      id v7 = VGGetVirtualGarageLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_214A2C000, v7, OS_LOG_TYPE_INFO, "Tried to openForClient:, but virtual garage isn't enabled", buf, 2u);
      }
LABEL_7:

      goto LABEL_14;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    v15 = 0;
    location[1] = (id)MEMORY[0x263EF8330];
    location[2] = (id)3221225472;
    location[3] = __40__VGVirtualGarageService_openForClient___block_invoke;
    location[4] = &unk_264226910;
    location[5] = self;
    id v12 = v4;
    uint64_t v13 = buf;
    geo_isolate_sync_data();
    if (!*(void *)(*(void *)&buf[8] + 24))
    {
      objc_initWeak(location, self);
      connectionQueue = self->_connectionQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __40__VGVirtualGarageService_openForClient___block_invoke_17;
      block[3] = &unk_2642260C8;
      objc_copyWeak(&v10, location);
      dispatch_sync(connectionQueue, block);
      objc_destroyWeak(&v10);
      objc_destroyWeak(location);
    }

    _Block_object_dispose(buf, 8);
  }
LABEL_14:
}

void __74__VGVirtualGarageService_virtualGarageGetListOfUnpairedVehiclesWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __74__VGVirtualGarageService_virtualGarageGetListOfUnpairedVehiclesWithReply___block_invoke_2;
  v4[3] = &unk_264226960;
  id v5 = *(id *)(a1 + 32);
  id v3 = [WeakRetained messageTargetWithErrorReply:v4];
  [v3 virtualGarageGetListOfUnpairedVehiclesWithReply:*(void *)(a1 + 32)];
}

void __58__VGVirtualGarageService_virtualGarageGetGarageWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__VGVirtualGarageService_virtualGarageGetGarageWithReply___block_invoke_2;
  v4[3] = &unk_264226960;
  id v5 = *(id *)(a1 + 32);
  id v3 = [WeakRetained messageTargetWithErrorReply:v4];
  [v3 virtualGarageGetGarageWithReply:*(void *)(a1 + 32)];
}

- (id)messageTargetWithErrorReply:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  char IsEnabled_EVRouting = MapsFeature_IsEnabled_EVRouting();
  char IsEnabled_Alberta = MapsFeature_IsEnabled_Alberta();
  if (IsEnabled_EVRouting & 1) != 0 || (IsEnabled_Alberta)
  {
    if (+[VGVirtualGarageService canUseVirtualGarageXPCService])
    {
      uint64_t v13 = [(VGVirtualGarageService *)self connection];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __54__VGVirtualGarageService_messageTargetWithErrorReply___block_invoke;
      v15[3] = &unk_264226960;
      id v16 = v4;
      id v12 = [v13 remoteObjectProxyWithErrorHandler:v15];
    }
    else
    {
      id v12 = +[VGVirtualGarageServer sharedServer];
    }
  }
  else
  {
    id v7 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214A2C000, v7, OS_LOG_TYPE_INFO, "VirtualGarage isn't enabled, service isn't able to call to server.", buf, 2u);
    }

    if (v4)
    {
      uint64_t v8 = (void *)MEMORY[0x263F087E8];
      id v9 = GEOErrorDomain();
      uint64_t v18 = *MEMORY[0x263F08320];
      v19[0] = @"VirtualGarage isn't enabled, service isn't able to call to server.";
      id v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
      v11 = [v8 errorWithDomain:v9 code:-8 userInfo:v10];

      (*((void (**)(id, void *))v4 + 2))(v4, v11);
    }
    id v12 = 0;
  }

  return v12;
}

+ (BOOL)canUseVirtualGarageXPCService
{
  return 1;
}

- (NSXPCConnection)connection
{
  connection = self->_connection;
  if (!connection)
  {
    [(VGVirtualGarageService *)self _openConnection];
    connection = self->_connection;
  }

  return connection;
}

- (void)virtualGarageDidUpdate:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    id v9 = "-[VGVirtualGarageService virtualGarageDidUpdate:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v8, 0x16u);
  }

  dispatch_queue_t v6 = [v4 selectedVehicle];
  id v7 = [v6 identifier];
  [(VGVirtualGarageService *)self _clearActiveVehicleIdentifierIfNeeded:v7];

  [(GEOObserverHashTable *)self->_observers virtualGarageDidUpdate:v4];
}

- (void)_clearActiveVehicleIdentifierIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  unint64_t v6 = [(VGVirtualGarageService *)v5 activeVehicleIdentifier];
  unint64_t v8 = (unint64_t)v4;
  if (v8 | v6)
  {
    char v7 = [(id)v6 isEqual:v8];

    if ((v7 & 1) == 0) {
      [(VGVirtualGarageService *)v5 setActiveVehicleIdentifier:0];
    }
  }

  objc_sync_exit(v5);
}

- (NSString)activeVehicleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)virtualGarageGetGarageWithReply:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v12 = "-[VGVirtualGarageService virtualGarageGetGarageWithReply:]";
    _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__VGVirtualGarageService_virtualGarageGetGarageWithReply___block_invoke;
  v8[3] = &unk_264226428;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(connectionQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)registerObserver:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "Registering observer: %@", (uint8_t *)&v6, 0xCu);
  }

  [(GEOObserverHashTable *)self->_observers registerObserver:v4];
}

- (void)closeForClient:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    if (+[VGVirtualGarageService canUseVirtualGarageXPCService])
    {
      *(void *)uint64_t v18 = 0;
      *(void *)&v18[8] = v18;
      *(void *)&v18[16] = 0x2020000000;
      v19 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      uint64_t v10 = MEMORY[0x263EF8330];
      id v5 = v4;
      id v11 = v5;
      geo_isolate_sync_data();
      uint64_t v6 = v13[3];
      if (*(void *)(*(void *)&v18[8] + 24) == v6)
      {
        int IsEnabled_EVRouting = MapsFeature_IsEnabled_EVRouting();
        if ((IsEnabled_EVRouting | MapsFeature_IsEnabled_Alberta()))
        {
          uint64_t v8 = VGGetVirtualGarageLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v17 = v5;
            _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_ERROR, "Tried to closeForClient: (%@) that wasn't in _clients and VG was enabled. Check if the feature flag changed during run time. If it hasn't, there is probably in issue in your open/close logic.", buf, 0xCu);
          }
        }
      }
      else if (!v6)
      {
        [(VGVirtualGarageService *)self _closeConnection];
      }

      _Block_object_dispose(&v12, 8);
      _Block_object_dispose(v18, 8);
    }
  }
  else
  {
    id v9 = VGGetAssertLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v18 = 136446722;
      *(void *)&v18[4] = "-[VGVirtualGarageService closeForClient:]";
      *(_WORD *)&v18[12] = 2082;
      *(void *)&v18[14] = "client == nil";
      *(_WORD *)&v18[22] = 2082;
      v19 = "Can't call closeForClient: with a nil client";
      _os_log_impl(&dword_214A2C000, v9, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", v18, 0x20u);
    }
  }
}

uint64_t __41__VGVirtualGarageService_closeForClient___block_invoke(void *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[4];
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_214A2C000, v2, OS_LOG_TYPE_INFO, "Will closeForClient: %@", (uint8_t *)&v5, 0xCu);
  }

  *(void *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[5] + 8) count];
  [*(id *)(a1[5] + 8) removeObject:a1[4]];
  uint64_t result = [*(id *)(a1[5] + 8) count];
  *(void *)(*(void *)(a1[7] + 8) + 24) = result;
  return result;
}

void __41__VGVirtualGarageService__openConnection__block_invoke()
{
  v0 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_214A2C000, v0, OS_LOG_TYPE_ERROR, "Server connection interrupted", v1, 2u);
  }
}

void __41__VGVirtualGarageService__openConnection__block_invoke_57(uint64_t a1)
{
  int v2 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_214A2C000, v2, OS_LOG_TYPE_ERROR, "Server connection invalidated", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _closeConnection];
}

- (void)_closeConnection
{
  objc_initWeak(&location, self);
  connectionQueue = self->_connectionQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__VGVirtualGarageService__closeConnection__block_invoke;
  v4[3] = &unk_2642260C8;
  objc_copyWeak(&v5, &location);
  dispatch_async(connectionQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __42__VGVirtualGarageService__closeConnection__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = WeakRetained;
  if (!WeakRetained)
  {
    id v4 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      uint64_t v6 = "-[VGVirtualGarageService _closeConnection]_block_invoke";
      __int16 v7 = 1024;
      int v8 = 192;
      _os_log_impl(&dword_214A2C000, v4, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v5, 0x12u);
    }
    goto LABEL_8;
  }
  if (WeakRetained[7])
  {
    uint64_t v3 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_INFO, "VGVirtualGarageService closing connection", (uint8_t *)&v5, 2u);
    }

    [v2[7] invalidate];
    id v4 = v2[7];
    v2[7] = 0;
LABEL_8:
  }
}

- (void)unregisterObserver:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "Unregistering observer: %@", (uint8_t *)&v6, 0xCu);
  }

  [(GEOObserverHashTable *)self->_observers unregisterObserver:v4];
}

void __54__VGVirtualGarageService_messageTargetWithErrorReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_214A2C000, v4, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)virtualGarageAddVehicle:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "-[VGVirtualGarageService virtualGarageAddVehicle:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__VGVirtualGarageService_virtualGarageAddVehicle___block_invoke;
  v8[3] = &unk_264226208;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(connectionQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __50__VGVirtualGarageService_virtualGarageAddVehicle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v2 = [WeakRetained messageTargetWithErrorReply:0];
  [v2 virtualGarageAddVehicle:*(void *)(a1 + 32)];
}

- (void)virtualGarageRemoveVehicle:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "-[VGVirtualGarageService virtualGarageRemoveVehicle:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__VGVirtualGarageService_virtualGarageRemoveVehicle___block_invoke;
  v8[3] = &unk_264226208;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(connectionQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __53__VGVirtualGarageService_virtualGarageRemoveVehicle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v2 = [WeakRetained messageTargetWithErrorReply:0];
  [v2 virtualGarageRemoveVehicle:*(void *)(a1 + 32)];
}

uint64_t __58__VGVirtualGarageService_virtualGarageGetGarageWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)virtualGarageSelectVehicle:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "-[VGVirtualGarageService virtualGarageSelectVehicle:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__VGVirtualGarageService_virtualGarageSelectVehicle___block_invoke;
  v8[3] = &unk_264226208;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(connectionQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __53__VGVirtualGarageService_virtualGarageSelectVehicle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v2 = [WeakRetained messageTargetWithErrorReply:0];
  [v2 virtualGarageSelectVehicle:*(void *)(a1 + 32)];
}

- (void)virtualGarageOnboardVehicle:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "-[VGVirtualGarageService virtualGarageOnboardVehicle:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__VGVirtualGarageService_virtualGarageOnboardVehicle___block_invoke;
  v8[3] = &unk_264226208;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(connectionQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __54__VGVirtualGarageService_virtualGarageOnboardVehicle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v2 = [WeakRetained messageTargetWithErrorReply:0];
  [v2 virtualGarageOnboardVehicle:*(void *)(a1 + 32)];
}

- (void)virtualGarageSaveVehicle:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "-[VGVirtualGarageService virtualGarageSaveVehicle:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_214A2C000, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__VGVirtualGarageService_virtualGarageSaveVehicle___block_invoke;
  v8[3] = &unk_264226208;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(connectionQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __51__VGVirtualGarageService_virtualGarageSaveVehicle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v2 = [WeakRetained messageTargetWithErrorReply:0];
  [v2 virtualGarageSaveVehicle:*(void *)(a1 + 32)];
}

- (void)virtualGarageSetShouldUsePreferredNetworks:(BOOL)a3 forVehicle:(id)a4
{
  BOOL v4 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = @"NO";
    if (v4) {
      uint64_t v8 = @"YES";
    }
    id v9 = v8;
    *(_DWORD *)buf = 136315650;
    id v17 = "-[VGVirtualGarageService virtualGarageSetShouldUsePreferredNetworks:forVehicle:]";
    __int16 v18 = 2112;
    v19 = v9;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_214A2C000, v7, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__VGVirtualGarageService_virtualGarageSetShouldUsePreferredNetworks_forVehicle___block_invoke;
  block[3] = &unk_264226988;
  objc_copyWeak(&v14, (id *)buf);
  BOOL v15 = v4;
  id v13 = v6;
  id v11 = v6;
  dispatch_async(connectionQueue, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __80__VGVirtualGarageService_virtualGarageSetShouldUsePreferredNetworks_forVehicle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v2 = [WeakRetained messageTargetWithErrorReply:0];
  [v2 virtualGarageSetShouldUsePreferredNetworks:*(unsigned __int8 *)(a1 + 48) forVehicle:*(void *)(a1 + 32)];
}

- (void)virtualGarageStartContinuousUpdatesIfNeeded
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = "-[VGVirtualGarageService virtualGarageStartContinuousUpdatesIfNeeded]";
    _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__VGVirtualGarageService_virtualGarageStartContinuousUpdatesIfNeeded__block_invoke;
  block[3] = &unk_2642260C8;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(connectionQueue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __69__VGVirtualGarageService_virtualGarageStartContinuousUpdatesIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained messageTargetWithErrorReply:0];
  [v1 virtualGarageStartContinuousUpdatesIfNeeded];
}

- (void)virtualGarageEndContinuousUpdates
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = "-[VGVirtualGarageService virtualGarageEndContinuousUpdates]";
    _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__VGVirtualGarageService_virtualGarageEndContinuousUpdates__block_invoke;
  block[3] = &unk_2642260C8;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(connectionQueue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __59__VGVirtualGarageService_virtualGarageEndContinuousUpdates__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained messageTargetWithErrorReply:0];
  [v1 virtualGarageEndContinuousUpdates];
}

- (void)virtualGarageSetAssumesFullCharge:(BOOL)a3
{
  id v3 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_ERROR, "virtualGarageSetAssumesFullCharge: is only supported on macOS", v4, 2u);
  }
}

- (void)virtualGarageForceFetchAllVehicles
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = "-[VGVirtualGarageService virtualGarageForceFetchAllVehicles]";
    _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__VGVirtualGarageService_virtualGarageForceFetchAllVehicles__block_invoke;
  block[3] = &unk_2642260C8;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(connectionQueue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __60__VGVirtualGarageService_virtualGarageForceFetchAllVehicles__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained messageTargetWithErrorReply:0];
  [v1 virtualGarageForceFetchAllVehicles];
}

uint64_t __74__VGVirtualGarageService_virtualGarageGetListOfUnpairedVehiclesWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)virtualGarageGetLatestStateOfVehicleWithIdentifier:(id)a3 syncAcrossDevices:(BOOL)a4 withReply:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v20 = "-[VGVirtualGarageService virtualGarageGetLatestStateOfVehicleWithIdentifier:syncAcrossDevices:withReply:]";
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_impl(&dword_214A2C000, v10, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __105__VGVirtualGarageService_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke;
  v14[3] = &unk_2642269B0;
  objc_copyWeak(&v17, (id *)buf);
  id v15 = v8;
  id v16 = v9;
  BOOL v18 = a4;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(connectionQueue, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __105__VGVirtualGarageService_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __105__VGVirtualGarageService_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke_2;
  v4[3] = &unk_264226960;
  id v5 = *(id *)(a1 + 40);
  id v3 = [WeakRetained messageTargetWithErrorReply:v4];
  [v3 virtualGarageGetLatestStateOfVehicleWithIdentifier:*(void *)(a1 + 32) syncAcrossDevices:*(unsigned __int8 *)(a1 + 56) withReply:*(void *)(a1 + 40)];
}

uint64_t __105__VGVirtualGarageService_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)virtualGarage:(id)a3 didUpdateUnpairedVehicles:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = VGGetVirtualGarageLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = v7;
    id v10 = v9;
    if (v9)
    {
      if ([v9 count])
      {
        v29 = v8;
        v30 = self;
        id v31 = v6;
        id v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v12 = v10;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:buf count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v33 != v15) {
                objc_enumerationMutation(v12);
              }
              id v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              if (v17)
              {
                BOOL v18 = NSString;
                id v19 = v17;
                __int16 v20 = [v18 stringWithFormat:@"%@<%p>", objc_opt_class(), v19];
              }
              else
              {
                __int16 v20 = @"<nil>";
              }
              [v11 addObject:v20];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:buf count:16];
          }
          while (v14);
        }

        __int16 v21 = [v12 componentsJoinedByString:@", "];
        id v22 = NSString;
        id v23 = v12;
        v24 = [v22 stringWithFormat:@"%@<%p>", objc_opt_class(), v23];

        v25 = [v22 stringWithFormat:@"%@ [%@]", v24, v21];

        self = v30;
        id v6 = v31;
        id v8 = v29;
      }
      else
      {
        v26 = NSString;
        id v27 = v10;
        v28 = [v26 stringWithFormat:@"%@<%p>", objc_opt_class(), v27];

        v25 = [v26 stringWithFormat:@"%@ (empty)", v28];
      }
    }
    else
    {
      v25 = @"<nil>";
    }

    *(_DWORD *)buf = 136315650;
    v37 = "-[VGVirtualGarageService virtualGarage:didUpdateUnpairedVehicles:]";
    __int16 v38 = 2112;
    id v39 = v6;
    __int16 v40 = 2112;
    v41 = v25;
    _os_log_impl(&dword_214A2C000, v8, OS_LOG_TYPE_INFO, "%s %@, %@", buf, 0x20u);
  }
  [(GEOObserverHashTable *)self->_observers virtualGarage:v6 didUpdateUnpairedVehicles:v7];
}

- (void)setActiveVehicleIdentifier:(id)a3
{
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_activeVehicleIdentifier, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_clientsIsolater, 0);

  objc_storeStrong((id *)&self->_clients, 0);
}

@end