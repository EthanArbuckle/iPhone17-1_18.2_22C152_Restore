@interface GameControllerDaemon
+ (id)sharedInstance;
+ (void)run;
- (BOOL)acceptNewConnection:(id)a3 fromGCEnabledApp:(id)a4;
- (BOOL)acceptNewConnection:(id)a3 fromHIDServer:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (GameControllerDaemon)init;
- (id)_init;
- (id)clientForConnection:(id)a3;
- (id)serviceFor:(id)a3 client:(id)a4;
- (void)_start;
- (void)client:(id)a3 connectionsDidChange:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)refreshClientTransaction;
- (void)registerAgentConnection:(id)a3;
- (void)unregisterAgentConnection:(id)a3;
@end

@implementation GameControllerDaemon

+ (void)run
{
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  v2 = _os_activity_create((void *)&_mh_execute_header, "Daemon Start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &v4);
  v3 = +[GameControllerDaemon sharedInstance];
  [v3 _start];

  os_activity_scope_leave(&v4);
}

+ (id)sharedInstance
{
  if (qword_100011FE8 != -1) {
    dispatch_once(&qword_100011FE8, &stru_10000C5E0);
  }
  v2 = (void *)qword_100011FE0;

  return v2;
}

- (id)_init
{
  v23.receiver = self;
  v23.super_class = (Class)GameControllerDaemon;
  v2 = [(GameControllerDaemon *)&v23 init];
  if (v2)
  {
    GCLookupSetFallbackProvider();
    v3 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.GameController.gamecontrollerd.app"];
    appServiceListener = v2->_appServiceListener;
    v2->_appServiceListener = v3;

    [(NSXPCListener *)v2->_appServiceListener setDelegate:v2];
    v5 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.GameController.gamecontrollerd.driver"];
    driverServiceListener = v2->_driverServiceListener;
    v2->_driverServiceListener = v5;

    [(NSXPCListener *)v2->_driverServiceListener setDelegate:v2];
    v7 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.GameController.gamecontrollerd.haptics"];
    hapticServiceListener = v2->_hapticServiceListener;
    v2->_hapticServiceListener = v7;

    [(NSXPCListener *)v2->_hapticServiceListener setDelegate:v2];
    v9 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.GameController.gamecontrollerd.agent"];
    agentServiceListener = v2->_agentServiceListener;
    v2->_agentServiceListener = v9;

    [(NSXPCListener *)v2->_agentServiceListener setDelegate:v2];
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    agentRegistrations = v2->_agentRegistrations;
    v2->_agentRegistrations = v11;

    v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    clients = v2->_clients;
    v2->_clients = v13;

    uint64_t v15 = objc_opt_new();
    analytics = v2->_analytics;
    v2->_analytics = (GameControllerDaemonAnalytics *)v15;

    id v17 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.GameController"];
    v18 = v17;
    if (!v17)
    {
      v18 = +[NSUserDefaults standardUserDefaults];
    }
    objc_storeStrong((id *)&v2->_defaults, v18);
    if (!v17) {

    }
    v19 = (GCSSettingsStore *)[objc_alloc((Class)GCSSettingsStore) initWithUserDefaults:v2->_defaults];
    settingsStore = v2->_settingsStore;
    v2->_settingsStore = v19;

    v21 = +[_GCControllerManagerServer sharedInstance];
    [v21 addObserver:v2 forKeyPath:@"activeControllerDevices" options:5 context:off_100011E50];

    xpc_set_event_stream_handler("com.apple.iokit.match.gamecontroller", 0, &stru_10000C620);
  }
  return v2;
}

- (GameControllerDaemon)init
{
  return 0;
}

- (void)_start
{
  [(NSXPCListener *)self->_appServiceListener resume];
  [(NSXPCListener *)self->_driverServiceListener resume];
  hapticServiceListener = self->_hapticServiceListener;

  [(NSXPCListener *)hapticServiceListener resume];
}

- (void)dealloc
{
  v3 = +[_GCControllerManagerServer sharedInstance];
  [v3 removeObserver:self forKeyPath:@"activeControllerDevices"];

  v4.receiver = self;
  v4.super_class = (Class)GameControllerDaemon;
  [(GameControllerDaemon *)&v4 dealloc];
}

- (id)serviceFor:(id)a3 client:(id)a4
{
  v6 = (__objc2_prot *)a3;
  id v7 = a4;
  if (&OBJC_PROTOCOL___GCAnalytics == v6)
  {
    uint64_t v9 = 64;
  }
  else if (&OBJC_PROTOCOL___GCUserDefaults == v6)
  {
    uint64_t v9 = 72;
  }
  else
  {
    if (&OBJC_PROTOCOL___GCSSettingsStoreService != v6)
    {
      v12.receiver = self;
      v12.super_class = (Class)GameControllerDaemon;
      id v8 = [(GameControllerDaemon *)&v12 serviceFor:v6 client:v7];
      goto LABEL_9;
    }
    uint64_t v9 = 80;
  }
  id v8 = *(id *)&self->GCDaemon_opaque[v9];
LABEL_9:
  v10 = v8;

  return v10;
}

- (id)clientForConnection:(id)a3
{
  id v4 = a3;
  v5 = self->_clients;
  objc_sync_enter(v5);
  id v6 = [objc_alloc((Class)_GCIPCRemoteProcess) initWithConnection:v4];
  id v7 = [(NSMutableSet *)self->_clients member:v6];

  if (!v7)
  {
    id v7 = [objc_alloc((Class)_GCIPCRemoteProcess) initWithConnection:v4];
    [(NSMutableSet *)self->_clients addObject:v7];
    [v7 addObserver:self forKeyPath:@"connections" options:1 context:0];
    [(GameControllerDaemon *)self refreshClientTransaction];
    if (sub_100006238())
    {
      uint64_t v9 = sub_100006504();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        id v11 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Added client: %@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  objc_sync_exit(v5);

  return v7;
}

- (void)refreshClientTransaction
{
  v3 = self->_clients;
  objc_sync_enter(v3);
  if (sub_100006238())
  {
    id v6 = sub_100006504();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = (OS_os_transaction *)[(NSMutableSet *)self->_clients count];
      unint64_t activeDevicesCount = self->_activeDevicesCount;
      int v11 = 134218240;
      objc_super v12 = v7;
      __int16 v13 = 2048;
      unint64_t v14 = activeDevicesCount;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "refreshClientTransaction - %lu clients and %lu active devices", (uint8_t *)&v11, 0x16u);
    }
  }
  if ([(NSMutableSet *)self->_clients count] && self->_activeDevicesCount)
  {
    if (self->_clientTransaction) {
      goto LABEL_8;
    }
    id v4 = (OS_os_transaction *)os_transaction_create();
    clientTransaction = self->_clientTransaction;
    self->_clientTransaction = v4;
  }
  else
  {
    clientTransaction = self->_clientTransaction;
    self->_clientTransaction = 0;
  }

LABEL_8:
  if (sub_100006238())
  {
    uint64_t v9 = sub_100006504();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = self->_clientTransaction;
      int v11 = 138412290;
      objc_super v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "client transaction = %@", (uint8_t *)&v11, 0xCu);
    }
  }
  objc_sync_exit(v3);
}

- (void)client:(id)a3 connectionsDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_clients;
  objc_sync_enter(v8);
  if (![v7 count])
  {
    [v6 removeObserver:self forKeyPath:@"connections" context:0];
    [(NSMutableSet *)self->_clients removeObject:v6];
    if (sub_100006238())
    {
      uint64_t v9 = sub_100006504();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        id v11 = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Removed client: %@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  [(GameControllerDaemon *)self refreshClientTransaction];
  objc_sync_exit(v8);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v20.opaque[0] = 0;
  v20.opaque[1] = 0;
  id v6 = _os_activity_create((void *)&_mh_execute_header, "Incoming Connection", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v6, &v20);
  id v7 = -[GameControllerDaemon clientForConnection:](self, "clientForConnection:", v5, v20.opaque[0], v20.opaque[1]);
  id v8 = [v5 serviceName];
  unsigned int v9 = [v8 isEqualToString:@"com.apple.GameController.gamecontrollerd.app"];

  if (v9)
  {
    unsigned __int8 v10 = [(GameControllerDaemon *)self acceptNewConnection:v5 fromGCEnabledApp:v7];
LABEL_5:
    unsigned __int8 v13 = v10;
    goto LABEL_6;
  }
  id v11 = [v5 serviceName];
  unsigned int v12 = [v11 isEqualToString:@"com.apple.GameController.gamecontrollerd.driver"];

  if (v12)
  {
    unsigned __int8 v10 = [(GameControllerDaemon *)self acceptNewConnection:v5 fromHIDServer:v7];
    goto LABEL_5;
  }
  uint64_t v15 = [v5 serviceName];
  unsigned int v16 = [v15 isEqualToString:@"com.apple.GameController.gamecontrollerd.haptics"];

  if (v16)
  {
    id v17 = +[_GCHapticServerManager sharedInstance];
    unsigned __int8 v13 = [v17 acceptNewConnection:v5 fromHapticsEnabledApp:v7];
  }
  else
  {
    if (sub_100006238())
    {
      v18 = sub_100006504();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = [v5 serviceName];
        *(_DWORD *)buf = 138412546;
        id v22 = v5;
        __int16 v23 = 2112;
        v24 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Rejecting connection '%@' for unknown mach service '%@'", buf, 0x16u);
      }
    }
    unsigned __int8 v13 = 0;
  }
LABEL_6:
  os_activity_scope_leave(&v20);

  return v13;
}

- (BOOL)acceptNewConnection:(id)a3 fromHIDServer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (sub_100006238())
  {
    id v11 = sub_100006504();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      unsigned int v12 = [v5 serviceName];
      int v13 = 138412546;
      id v14 = v5;
      __int16 v15 = 2112;
      unsigned int v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Accepting driver connection '%@' to mach service '%@'", (uint8_t *)&v13, 0x16u);
    }
  }
  id v7 = [objc_alloc((Class)_GCDriverClientConnection) initWithConnection:v5 fromProcess:v6];

  id v8 = +[_GCControllerManagerServer sharedInstance];
  unsigned __int8 v9 = [v8 acceptIncomingDriverConnection:v7];

  return v9;
}

- (BOOL)acceptNewConnection:(id)a3 fromGCEnabledApp:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (sub_100006238())
  {
    id v11 = sub_100006504();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      unsigned int v12 = [v5 serviceName];
      int v13 = 138412546;
      id v14 = v5;
      __int16 v15 = 2112;
      unsigned int v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Accepting app connection '%@' to mach service '%@'", (uint8_t *)&v13, 0x16u);
    }
  }
  id v7 = [objc_alloc((Class)_GCAppClientConnection) initWithConnection:v5 fromProcess:v6];
  [v6 addConnection:v7];

  id v8 = +[_GCControllerManagerServer sharedInstance];
  unsigned __int8 v9 = +[_GCAppClientProxy clientProxyWithConnection:v7 server:v8];

  [v7 setServer:v9];
  [v7 resume];

  return 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_100011E50 == a6)
  {
    if ([v10 isEqualToString:@"activeControllerDevices"])
    {
      int v13 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
      self->_unint64_t activeDevicesCount = (unint64_t)[v13 count];
      [(GameControllerDaemon *)self refreshClientTransaction];
      goto LABEL_7;
    }
LABEL_8:
    v14.receiver = self;
    v14.super_class = (Class)GameControllerDaemon;
    [(GameControllerDaemon *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![v10 isEqualToString:@"connections"]) {
    goto LABEL_8;
  }
  int v13 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
  [(GameControllerDaemon *)self client:v11 connectionsDidChange:v13];
LABEL_7:

LABEL_9:
}

- (void)registerAgentConnection:(id)a3
{
  id v7 = a3;
  id v4 = self->_agentRegistrations;
  objc_sync_enter(v4);
  agentRegistrations = self->_agentRegistrations;
  id v6 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v7 userIdentifier]);
  [(NSMutableDictionary *)agentRegistrations setObject:v7 forKey:v6];

  objc_sync_exit(v4);
}

- (void)unregisterAgentConnection:(id)a3
{
  id v7 = a3;
  id v4 = self->_agentRegistrations;
  objc_sync_enter(v4);
  agentRegistrations = self->_agentRegistrations;
  id v6 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v7 userIdentifier]);
  [(NSMutableDictionary *)agentRegistrations removeObjectForKey:v6];

  [v7 invalidate];
  objc_sync_exit(v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsStore, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_clientTransaction, 0);
  objc_storeStrong((id *)&self->_agentRegistrations, 0);
  objc_storeStrong((id *)&self->_agentServiceListener, 0);
  objc_storeStrong((id *)&self->_hapticServiceListener, 0);
  objc_storeStrong((id *)&self->_driverServiceListener, 0);

  objc_storeStrong((id *)&self->_appServiceListener, 0);
}

@end