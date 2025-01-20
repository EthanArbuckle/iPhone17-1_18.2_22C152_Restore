@interface ULRapportMonitor
- (NSArray)identities;
- (RPClient)client;
- (RPCompanionLinkClient)companionLinkClient;
- (ULDarwinNotificationHelper)notificationHelper;
- (ULRapportMonitor)init;
- (ULRapportMonitor)initWithNotificationHelper:(id)a3 identityTypeFlags:(unsigned int)a4 controlFlags:(unint64_t)a5;
- (unint64_t)controlFlags;
- (unsigned)identityTypeFlags;
- (void)_activateCompanionLinkClientAndSetHandlers;
- (void)_getIdentities;
- (void)_startMonitoringForDevices;
- (void)_startMonitoringForIdentities;
- (void)_stopMonitoringForDevices;
- (void)_stopMonitoringForIdentities;
- (void)setClient:(id)a3;
- (void)setCompanionLinkClient:(id)a3;
- (void)setControlFlags:(unint64_t)a3;
- (void)setIdentities:(id)a3;
- (void)setIdentityTypeFlags:(unsigned int)a3;
- (void)setNotificationHelper:(id)a3;
- (void)startMonitoring:(id)a3;
- (void)stopMonitoring:(id)a3;
@end

@implementation ULRapportMonitor

- (ULRapportMonitor)init
{
  uint64_t v2 = objc_opt_class();
  _ULRequireInitializer(v2, sel_initWithNotificationHelper_identityTypeFlags_controlFlags_);
}

- (ULRapportMonitor)initWithNotificationHelper:(id)a3 identityTypeFlags:(unsigned int)a4 controlFlags:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ULRapportMonitor;
  v9 = [(ULEventMonitor *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(ULRapportMonitor *)v9 setNotificationHelper:v8];
    [(ULRapportMonitor *)v10 setIdentityTypeFlags:v6];
    [(ULRapportMonitor *)v10 setControlFlags:a5];
  }

  return v10;
}

- (void)startMonitoring:(id)a3
{
  id v9 = a3;
  v4 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v4);

  v5 = +[ULEvent eventName];
  int v6 = [v9 isEqual:v5];

  if (v6)
  {
    [(ULRapportMonitor *)self _startMonitoringForIdentities];
  }
  else
  {
    v7 = +[ULEvent eventName];
    int v8 = [v9 isEqual:v7];

    if (v8) {
      [(ULRapportMonitor *)self _startMonitoringForDevices];
    }
  }
}

- (void)stopMonitoring:(id)a3
{
  id v9 = a3;
  v4 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v4);

  v5 = +[ULEvent eventName];
  int v6 = [v9 isEqual:v5];

  if (v6)
  {
    [(ULRapportMonitor *)self _stopMonitoringForIdentities];
  }
  else
  {
    v7 = +[ULEvent eventName];
    int v8 = [v9 isEqual:v7];

    if (v8) {
      [(ULRapportMonitor *)self _stopMonitoringForDevices];
    }
  }
}

- (void)_startMonitoringForIdentities
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F62B68]);
  [(ULRapportMonitor *)self setClient:v3];

  v4 = [(ULEventMonitor *)self queue];
  v5 = [(ULRapportMonitor *)self client];
  [v5 setDispatchQueue:v4];

  objc_initWeak(&location, self);
  int v6 = [(ULRapportMonitor *)self notificationHelper];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __49__ULRapportMonitor__startMonitoringForIdentities__block_invoke;
  objc_super v12 = &unk_2653F9200;
  objc_copyWeak(&v13, &location);
  [v6 addObserverForNotificationName:@"com.apple.rapport.identitiesChanged" handler:&v9];

  [(ULRapportMonitor *)self _getIdentities];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_60);
  }
  v7 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = +[ULEvent eventName];
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_DEFAULT, "Start monitoring: %@", buf, 0xCu);
  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __49__ULRapportMonitor__startMonitoringForIdentities__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _getIdentities];
    id WeakRetained = v2;
  }
}

- (void)_startMonitoringForDevices
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F62B70]);
  [(ULRapportMonitor *)self setCompanionLinkClient:v3];

  v4 = [(ULEventMonitor *)self queue];
  v5 = [(ULRapportMonitor *)self companionLinkClient];
  [v5 setDispatchQueue:v4];

  unint64_t v6 = [(ULRapportMonitor *)self controlFlags];
  v7 = [(ULRapportMonitor *)self companionLinkClient];
  [v7 setControlFlags:v6];

  [(ULRapportMonitor *)self _activateCompanionLinkClientAndSetHandlers];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_60);
  }
  int v8 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    uint64_t v10 = +[ULEvent eventName];
    int v11 = 138412290;
    objc_super v12 = v10;
    _os_log_impl(&dword_25631F000, v9, OS_LOG_TYPE_DEFAULT, "Start monitoring: %@", (uint8_t *)&v11, 0xCu);
  }
}

- (void)_stopMonitoringForIdentities
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_60);
  }
  id v3 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = +[ULEvent eventName];
    int v8 = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_25631F000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring: %@", (uint8_t *)&v8, 0xCu);
  }
  unint64_t v6 = [(ULRapportMonitor *)self notificationHelper];
  [v6 removeObserverForNotificationName:@"com.apple.rapport.identitiesChanged"];

  v7 = [(ULRapportMonitor *)self client];
  [v7 invalidate];

  [(ULRapportMonitor *)self setClient:0];
  [(ULRapportMonitor *)self setIdentities:0];
}

- (void)_stopMonitoringForDevices
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_60);
  }
  id v3 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = +[ULEvent eventName];
    int v8 = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_25631F000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring: %@", (uint8_t *)&v8, 0xCu);
  }
  unint64_t v6 = [(ULRapportMonitor *)self companionLinkClient];
  [v6 invalidate];

  v7 = [(ULRapportMonitor *)self companionLinkClient];
  [v7 setDeviceFoundHandler:0];

  [(ULRapportMonitor *)self setCompanionLinkClient:0];
}

- (void)_getIdentities
{
  objc_initWeak(&location, self);
  id v3 = [(ULRapportMonitor *)self client];
  uint64_t v4 = [(ULRapportMonitor *)self identityTypeFlags];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__ULRapportMonitor__getIdentities__block_invoke;
  v5[3] = &unk_2653F9C58;
  objc_copyWeak(&v6, &location);
  [v3 getIdentitiesWithFlags:v4 completion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __34__ULRapportMonitor__getIdentities__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = [WeakRetained queue];
    dispatch_assert_queue_V2(v9);

    if (v6)
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_60);
      }
      uint64_t v10 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412290;
        id v16 = v6;
        _os_log_impl(&dword_25631F000, v10, OS_LOG_TYPE_ERROR, "getIdentitiesWithFlags failed with error: %@", (uint8_t *)&v15, 0xCu);
      }
      [v8 _stopMonitoringForIdentities];
    }
    else
    {
      int v11 = (void *)[v5 copy];
      [v8 setIdentities:v11];

      objc_super v12 = objc_alloc_init(ULRapportMonitorEventIdentities);
      uint64_t v13 = [v8 identities];
      v14 = (void *)[v13 copy];
      [(ULRapportMonitorEventIdentities *)v12 setIdentities:v14];

      [v8 postEvent:v12];
    }
  }
}

- (void)_activateCompanionLinkClientAndSetHandlers
{
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__ULRapportMonitor__activateCompanionLinkClientAndSetHandlers__block_invoke;
  v7[3] = &unk_2653F9C80;
  objc_copyWeak(&v8, &location);
  id v3 = [(ULRapportMonitor *)self companionLinkClient];
  [v3 setDeviceFoundHandler:v7];

  uint64_t v4 = [(ULRapportMonitor *)self companionLinkClient];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__ULRapportMonitor__activateCompanionLinkClientAndSetHandlers__block_invoke_2;
  v5[3] = &unk_2653F9400;
  objc_copyWeak(&v6, &location);
  [v4 activateWithCompletion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __62__ULRapportMonitor__activateCompanionLinkClientAndSetHandlers__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained queue];
    dispatch_assert_queue_V2(v5);

    id v6 = objc_alloc_init(ULRapportMonitorEventDeviceFound);
    [(ULRapportMonitorEventDeviceFound *)v6 setDevice:v7];
    [v4 postEvent:v6];
  }
}

void __62__ULRapportMonitor__activateCompanionLinkClientAndSetHandlers__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained queue];
    dispatch_assert_queue_V2(v6);

    if (v3)
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_60);
      }
      id v7 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        int v9 = 138412290;
        id v10 = v3;
        _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_ERROR, "activateWithCompletion failed with error: %@", (uint8_t *)&v9, 0xCu);
      }
      [v5 _stopMonitoringForDevices];
    }
    else
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_60);
      }
      id v8 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_DEFAULT, "RPCompanionLinkClient activated", (uint8_t *)&v9, 2u);
      }
    }
  }
}

- (ULDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
}

- (unsigned)identityTypeFlags
{
  return self->_identityTypeFlags;
}

- (void)setIdentityTypeFlags:(unsigned int)a3
{
  self->_identityTypeFlags = a3;
}

- (RPClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSArray)identities
{
  return self->_identities;
}

- (void)setIdentities:(id)a3
{
}

- (unint64_t)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unint64_t)a3
{
  self->_controlFlags = a3;
}

- (RPCompanionLinkClient)companionLinkClient
{
  return self->_companionLinkClient;
}

- (void)setCompanionLinkClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
  objc_storeStrong((id *)&self->_identities, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_notificationHelper, 0);
}

@end