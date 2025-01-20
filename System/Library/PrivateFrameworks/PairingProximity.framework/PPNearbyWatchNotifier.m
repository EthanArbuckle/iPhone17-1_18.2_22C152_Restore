@interface PPNearbyWatchNotifier
+ (BOOL)isWatchAppRemoved;
+ (BOOL)shouldScanForNearbyDevices;
+ (id)sharedNotifier;
- (NSXPCConnection)notificationService;
- (OS_dispatch_source)timerSource;
- (PPDiscoveryManager)discoveryManager;
- (id)discoverForNearbyWatchesWithCompletion:(id)a3;
- (id)discoverForTimeInterval:(double)a3 signalLimit:(int64_t)a4 completion:(id)a5;
- (id)discoveryCompletion;
- (void)_cleanupDiscoveryDidFindDevice:(BOOL)a3 error:(id)a4;
- (void)cancelDiscovery;
- (void)didDiscoverDeviceWithAdvertisingID:(id)a3 signalStrength:(int64_t)a4;
- (void)didStopDiscovering;
- (void)prepareServiceConnectionIfNeeded;
- (void)setDiscoveryCompletion:(id)a3;
- (void)setDiscoveryManager:(id)a3;
- (void)setNotificationService:(id)a3;
- (void)setTimerSource:(id)a3;
@end

@implementation PPNearbyWatchNotifier

+ (BOOL)isWatchAppRemoved
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v8 = 0;
  v2 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:@"com.apple.Bridge" allowPlaceholder:0 error:&v8];
  id v3 = v8;
  if (v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v10 = @"com.apple.Bridge";
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_23C80A000, &_os_log_internal, OS_LOG_TYPE_INFO, "Error while retrieving application record %@ with error %@", buf, 0x16u);
  }
  v4 = [v2 applicationState];
  if ([v4 isInstalled])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v6 = [v2 applicationState];
    int v5 = [v6 isPlaceholder] ^ 1;
  }
  return v5;
}

+ (BOOL)shouldScanForNearbyDevices
{
  return 0;
}

+ (id)sharedNotifier
{
  if (sharedNotifier_onceToken != -1) {
    dispatch_once(&sharedNotifier_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedNotifier_shareNotifier;

  return v2;
}

uint64_t __39__PPNearbyWatchNotifier_sharedNotifier__block_invoke()
{
  sharedNotifier_shareNotifier = objc_alloc_init(PPNearbyWatchNotifier);

  return MEMORY[0x270F9A758]();
}

- (id)discoverForNearbyWatchesWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__PPNearbyWatchNotifier_discoverForNearbyWatchesWithCompletion___block_invoke;
  v9[3] = &unk_264E716C8;
  id v10 = v4;
  id v5 = v4;
  v6 = [(PPNearbyWatchNotifier *)self discoverForTimeInterval:-55 signalLimit:v9 completion:30.0];
  if (v6)
  {
    v7 = pbb_shared_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_23C80A000, v7, OS_LOG_TYPE_DEFAULT, "Failed to begin discovering: %@", buf, 0xCu);
    }
  }

  return v6;
}

void __64__PPNearbyWatchNotifier_discoverForNearbyWatchesWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = pbb_shared_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = @"No Watch Found";
    if (a3) {
      v7 = @"Found Watch";
    }
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl(&dword_23C80A000, v6, OS_LOG_TYPE_DEFAULT, "Finished discoverForNearbyWatches: %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, uint64_t))(v8 + 16))(v8, v5, a3);
  }
}

- (id)discoverForTimeInterval:(double)a3 signalLimit:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  if (+[PPNearbyWatchNotifier shouldScanForNearbyDevices])
  {
    if (self->_timerSource)
    {
      int v9 = pbb_shared_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_23C80A000, v9, OS_LOG_TYPE_DEFAULT, "Can't Discover While Already Discovering!", (uint8_t *)buf, 2u);
      }
    }
    else
    {
      id v10 = +[PPDiscoveryManager sharedDiscoveryManager];
      [v10 setSignalLimitOverride:a4];

      uint64_t v11 = +[PPDiscoveryManager sharedDiscoveryManager];
      [v11 setDiscoveryDelegate:self];

      id v12 = +[PPDiscoveryManager sharedDiscoveryManager];
      [v12 begin];

      if (v8)
      {
        uint64_t v13 = (void *)[v8 copy];
        id discoveryCompletion = self->_discoveryCompletion;
        self->_id discoveryCompletion = v13;
      }
      v15 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
      timerSource = self->_timerSource;
      self->_timerSource = v15;

      objc_initWeak(buf, self);
      v17 = self->_timerSource;
      dispatch_time_t v18 = dispatch_time(0, 1000000000 * (uint64_t)a3);
      dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, 100000000 * (uint64_t)a3);
      v19 = self->_timerSource;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __72__PPNearbyWatchNotifier_discoverForTimeInterval_signalLimit_completion___block_invoke;
      handler[3] = &unk_264E716F0;
      objc_copyWeak(&v22, buf);
      dispatch_source_set_event_handler(v19, handler);
      dispatch_resume((dispatch_object_t)self->_timerSource);
      objc_destroyWeak(&v22);
      objc_destroyWeak(buf);
    }
  }

  return 0;
}

void __72__PPNearbyWatchNotifier_discoverForTimeInterval_signalLimit_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didStopDiscovering];
}

- (void)cancelDiscovery
{
  id v3 = +[PPDiscoveryManager sharedDiscoveryManager];
  [v3 end];

  timerSource = self->_timerSource;
  if (timerSource)
  {
    dispatch_source_cancel(timerSource);
    id v5 = self->_timerSource;
    self->_timerSource = 0;
  }
  id discoveryCompletion = self->_discoveryCompletion;
  self->_id discoveryCompletion = 0;
}

- (void)_cleanupDiscoveryDidFindDevice:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v11 = a4;
  v6 = +[PPDiscoveryManager sharedDiscoveryManager];
  [v6 end];

  timerSource = self->_timerSource;
  if (timerSource)
  {
    dispatch_source_cancel(timerSource);
    id v8 = self->_timerSource;
    self->_timerSource = 0;
  }
  id discoveryCompletion = (void (**)(id, id, BOOL))self->_discoveryCompletion;
  if (discoveryCompletion)
  {
    discoveryCompletion[2](discoveryCompletion, v11, v4);
    id v10 = self->_discoveryCompletion;
    self->_id discoveryCompletion = 0;
  }

  MEMORY[0x270F9A758]();
}

- (void)didStopDiscovering
{
}

- (void)didDiscoverDeviceWithAdvertisingID:(id)a3 signalStrength:(int64_t)a4
{
  id v5 = a3;
  [(PPNearbyWatchNotifier *)self _cleanupDiscoveryDidFindDevice:1 error:0];
  if (+[PPNearbyWatchNotifier shouldScanForNearbyDevices])
  {
    v6 = pbb_shared_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl(&dword_23C80A000, v6, OS_LOG_TYPE_DEFAULT, " ", v9, 2u);
    }

    [(PPNearbyWatchNotifier *)self prepareServiceConnectionIfNeeded];
    v7 = [(PPNearbyWatchNotifier *)self notificationService];
    id v8 = [v7 remoteObjectProxyWithErrorHandler:&__block_literal_global_13_0];
    [v8 notifyOfNearbyDevice:v5 withReply:&__block_literal_global_17];
  }
}

void __75__PPNearbyWatchNotifier_didDiscoverDeviceWithAdvertisingID_signalStrength___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    id v3 = pbb_shared_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_23C80A000, v3, OS_LOG_TYPE_DEFAULT, "Error %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __75__PPNearbyWatchNotifier_didDiscoverDeviceWithAdvertisingID_signalStrength___block_invoke_14(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = pbb_shared_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [NSNumber numberWithBool:a2];
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_23C80A000, v3, OS_LOG_TYPE_DEFAULT, "PPNotifierService Success %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)prepareServiceConnectionIfNeeded
{
  id v3 = pbb_shared_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_23C80A000, v3, OS_LOG_TYPE_DEFAULT, " ", v6, 2u);
  }

  int v4 = [(PPNearbyWatchNotifier *)self notificationService];
  if (!v4)
  {
    int v4 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.Bridge.ppNotifierService"];
    int v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F079308];
    [v4 setRemoteObjectInterface:v5];
    [(PPNearbyWatchNotifier *)self setNotificationService:v4];
    [v4 resume];
  }
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
}

- (PPDiscoveryManager)discoveryManager
{
  return self->_discoveryManager;
}

- (void)setDiscoveryManager:(id)a3
{
}

- (id)discoveryCompletion
{
  return self->_discoveryCompletion;
}

- (void)setDiscoveryCompletion:(id)a3
{
}

- (NSXPCConnection)notificationService
{
  return self->_notificationService;
}

- (void)setNotificationService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationService, 0);
  objc_storeStrong(&self->_discoveryCompletion, 0);
  objc_storeStrong((id *)&self->_discoveryManager, 0);

  objc_storeStrong((id *)&self->_timerSource, 0);
}

@end