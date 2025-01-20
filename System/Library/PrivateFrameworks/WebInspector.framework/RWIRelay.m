@interface RWIRelay
- (NSMutableDictionary)applicationConnections;
- (NSMutableDictionary)clientConnections;
- (NSMutableDictionary)driverInterfaces;
- (RWIRelay)init;
- (RWIRelayDelegate)delegate;
- (id)_allApplicationDetails;
- (id)_allDriverDetails;
- (void)_addPendingClientConnection:(id)a3;
- (void)_applicationConnected:(id)a3;
- (void)_applicationDisconnected:(id)a3;
- (void)_applicationUpdated:(id)a3;
- (void)_disconnectApplicationConnect:(id)a3;
- (void)_driverConnected:(id)a3;
- (void)_driverDisconnected:(id)a3;
- (void)_driverUpdated:(id)a3;
- (void)_dumpApplication:(id)a3 withOrdinal:(unint64_t)a4;
- (void)_dumpClientConnection:(id)a3 withOrdinal:(unint64_t)a4;
- (void)_finalizePendingClientConnection:(id)a3 withIdentifier:(id)a4;
- (void)_handleApplicationListenConnectionEvent:(id)a3;
- (void)_handleDumpStateNotification;
- (void)_proxyApplicationConnected:(id)a3;
- (void)_proxyApplicationResponse:(id)a3 userInfo:(id)a4;
- (void)_receivedAutomaticInspectionCandidate:(id)a3 connection:(id)a4;
- (void)_receivedDataMessage:(id)a3 connection:(id)a4;
- (void)_receivedListingMessage:(id)a3 connection:(id)a4;
- (void)_receivedPingMessage:(id)a3 connection:(id)a4;
- (void)_receivedProxyApplicationSetupResponseMessage:(id)a3 connection:(id)a4;
- (void)_reportCurrentStateToAllClients;
- (void)_reportCurrentStateToClient:(id)a3;
- (void)_rpc_debuggerDidWake:(id)a3;
- (void)_rpc_debuggerWillSleep:(id)a3;
- (void)_rpc_forwardAutomaticInspectionConfiguration:(id)a3;
- (void)_rpc_forwardAutomaticInspectionRejection:(id)a3;
- (void)_rpc_forwardAutomationSessionRequest:(id)a3;
- (void)_rpc_forwardDidClose:(id)a3;
- (void)_rpc_forwardDriverStateChangeRequest:(id)a3;
- (void)_rpc_forwardGetListing:(id)a3;
- (void)_rpc_forwardIndicateWebView:(id)a3;
- (void)_rpc_forwardSocketData:(id)a3;
- (void)_rpc_forwardSocketSetup:(id)a3;
- (void)_rpc_forwardWakeUpDebuggables:(id)a3;
- (void)_rpc_getConnectedApplications:(id)a3;
- (void)_rpc_getConnectedDrivers:(id)a3;
- (void)_rpc_reportDriverConnected:(id)a3;
- (void)_rpc_reportDriverDisconnected:(id)a3;
- (void)_rpc_reportDriverUpdated:(id)a3;
- (void)_rpc_reportIdentifier:(id)a3;
- (void)_rpc_requestApplicationLaunch:(id)a3;
- (void)_setGlobalNotifyStateWithAutomaticInspectionEnabled:(BOOL)a3;
- (void)clientConnectionDidClose:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setup;
- (void)shutdownIfDisabled;
- (void)xpcConnection:(id)a3 receivedMessage:(id)a4 userInfo:(id)a5;
- (void)xpcConnection:(id)a3 unhandledMessage:(id)a4;
- (void)xpcConnectionFailed:(id)a3;
@end

@implementation RWIRelay

- (RWIRelay)init
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v38.receiver = self;
  v38.super_class = (Class)RWIRelay;
  v2 = [(RWIRelay *)&v38 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    applicationConnections = v2->_applicationConnections;
    v2->_applicationConnections = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    clientConnections = v2->_clientConnections;
    v2->_clientConnections = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    driverInterfaces = v2->_driverInterfaces;
    v2->_driverInterfaces = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingClientConnections = v2->_pendingClientConnections;
    v2->_pendingClientConnections = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pendingProxyApplicationConnections = v2->_pendingProxyApplicationConnections;
    v2->_pendingProxyApplicationConnections = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    automaticInspectionDebuggers = v2->_automaticInspectionDebuggers;
    v2->_automaticInspectionDebuggers = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    automaticInspectionSessions = v2->_automaticInspectionSessions;
    v2->_automaticInspectionSessions = v15;

    [(RWIRelay *)v2 _setGlobalNotifyStateWithAutomaticInspectionEnabled:0];
    v17 = MEMORY[0x263EF83A0];
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.webinspector", MEMORY[0x263EF83A0], 1uLL);
    xpcApplicationListenConnection = v2->_xpcApplicationListenConnection;
    v2->_xpcApplicationListenConnection = mach_service;

    v20 = v2->_xpcApplicationListenConnection;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __16__RWIRelay_init__block_invoke;
    handler[3] = &unk_2647F7480;
    v21 = v2;
    v37 = v21;
    xpc_connection_set_event_handler(v20, handler);
    xpc_connection_resume(v2->_xpcApplicationListenConnection);
    int out_token = 0;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __16__RWIRelay_init__block_invoke_2;
    v33[3] = &unk_2647F9028;
    v22 = v21;
    v34 = v22;
    notify_register_dispatch("com.apple.webinspectord.enabled", &out_token, v17, v33);

    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __16__RWIRelay_init__block_invoke_10;
    v31[3] = &unk_2647F9028;
    v23 = v22;
    v32 = v23;
    notify_register_dispatch("com.apple.webinspectord.disabled", &out_token, v17, v31);

    notify_register_dispatch("com.apple.webinspectord.availability_check", &out_token, v17, &__block_literal_global_0);
    notify_post("com.apple.webinspectord.available");
    v24 = RWIDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v40 = "com.apple.webinspectord.available";
      _os_log_impl(&dword_226FA0000, v24, OS_LOG_TYPE_INFO, "notify post for %s", buf, 0xCu);
    }

    v25 = [MEMORY[0x263F087C8] defaultCenter];
    [v25 addObserver:v23 selector:sel__developerPreferencesChanged name:@"_SFDeveloperPreferencesDidChangeNotification" object:0];

    if (isInternalInstall())
    {
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __16__RWIRelay_init__block_invoke_18;
      v29[3] = &unk_2647F9028;
      v30 = v23;
      v26 = (void *)MEMORY[0x263EF83A0];
      notify_register_dispatch("com.apple.webinspectord.debug_dump_state", &out_token, MEMORY[0x263EF83A0], v29);
    }
    v27 = v23;
  }
  return v2;
}

uint64_t __16__RWIRelay_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleApplicationListenConnectionEvent:a2];
}

uint64_t __16__RWIRelay_init__block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = RWIDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "com.apple.webinspectord.enabled";
    _os_log_impl(&dword_226FA0000, v2, OS_LOG_TYPE_INFO, "notify handler for %s", (uint8_t *)&v4, 0xCu);
  }

  return [*(id *)(*(void *)(a1 + 32) + 48) relay:*(void *)(a1 + 32) remoteInspectionEnablementDidChange:1];
}

void __16__RWIRelay_init__block_invoke_10(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = RWIDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    int v4 = "com.apple.webinspectord.disabled";
    _os_log_impl(&dword_226FA0000, v2, OS_LOG_TYPE_INFO, "notify handler for %s", (uint8_t *)&v3, 0xCu);
  }

  [*(id *)(a1 + 32) _setGlobalNotifyStateWithAutomaticInspectionEnabled:0];
  [*(id *)(*(void *)(a1 + 32) + 48) relay:*(void *)(a1 + 32) remoteInspectionEnablementDidChange:0];
  exit(0);
}

uint64_t __16__RWIRelay_init__block_invoke_12()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v0 = RWIDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v2 = 136315138;
    int v3 = "com.apple.webinspectord.availability_check";
    _os_log_impl(&dword_226FA0000, v0, OS_LOG_TYPE_INFO, "notify handler for %s", (uint8_t *)&v2, 0xCu);
  }

  return notify_post("com.apple.webinspectord.available");
}

uint64_t __16__RWIRelay_init__block_invoke_18(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = RWIDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    uint64_t v5 = "com.apple.webinspectord.debug_dump_state";
    _os_log_impl(&dword_226FA0000, v2, OS_LOG_TYPE_INFO, "notify handler for %s", (uint8_t *)&v4, 0xCu);
  }

  return [*(id *)(a1 + 32) _handleDumpStateNotification];
}

- (void)setup
{
  [(RWIRelayDelegate *)self->_delegate relayInitialize:self];
  delegate = self->_delegate;
  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  -[RWIRelayDelegate relay:remoteInspectionEnablementDidChange:](delegate, "relay:remoteInspectionEnablementDidChange:", self, [v4 BOOLForKey:@"RemoteInspectorEnabled"]);
}

- (void)shutdownIfDisabled
{
  if (MGGetSInt32Answer() != 7)
  {
    int v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    char v4 = [v3 BOOLForKey:@"RemoteInspectorEnabled"];

    if ((v4 & 1) == 0)
    {
      uint64_t v5 = RWIDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_226FA0000, v5, OS_LOG_TYPE_DEFAULT, "Shutting Down, Preference Disabled", v6, 2u);
      }

      [(RWIRelay *)self _setGlobalNotifyStateWithAutomaticInspectionEnabled:0];
      notify_post("com.apple.webinspectord.disabled");
      exit(0);
    }
  }
}

- (id)_allApplicationDetails
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  char v4 = self->_applicationConnections;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = -[NSMutableDictionary objectForKey:](self->_applicationConnections, "objectForKey:", v9, (void)v14);
        v11 = [v10 dictionaryRepresentation];
        [v3 setObject:v11 forKey:v9];
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }

  v18 = @"WIRApplicationDictionaryKey";
  v19 = v3;
  v12 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];

  return v12;
}

- (id)_allDriverDetails
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  char v4 = self->_driverInterfaces;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = -[NSMutableDictionary objectForKey:](self->_driverInterfaces, "objectForKey:", v9, (void)v14);
        v11 = [v10 dictionaryRepresentation];
        [v3 setObject:v11 forKey:v9];
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }

  v18 = @"WIRDriverDictionaryKey";
  v19 = v3;
  v12 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];

  return v12;
}

- (void)_setGlobalNotifyStateWithAutomaticInspectionEnabled:(BOOL)a3
{
  LODWORD(v3) = a3;
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (_setGlobalNotifyStateWithAutomaticInspectionEnabled__sToken
    || !notify_register_check("com.apple.webinspectord.automatic_inspection_enabled", &_setGlobalNotifyStateWithAutomaticInspectionEnabled__sToken))
  {
    char v4 = RWIDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl(&dword_226FA0000, v4, OS_LOG_TYPE_DEFAULT, "Automatic Inspection Configuration Changed : enabled(%d)", (uint8_t *)v5, 8u);
    }

    uint64_t v3 = v3;
    if (isInternalInstall())
    {
      if (isSimulatingCustomerInstall()) {
        uint64_t v3 = v3 | 0x8000000000000000;
      }
    }
    notify_set_state(_setGlobalNotifyStateWithAutomaticInspectionEnabled__sToken, v3);
  }
}

- (void)_dumpClientConnection:(id)a3 withOrdinal:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = RWIMessageDumpStateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = [v5 tag];
    if (isKindOfClass) {
      uint64_t v9 = @"TCP";
    }
    else {
      uint64_t v9 = @"XPC";
    }
    int v10 = [v5 sleeping];
    v11 = @"NO";
    int v12 = 134218754;
    unint64_t v13 = a4;
    __int16 v14 = 2114;
    if (v10) {
      v11 = @"YES";
    }
    long long v15 = v8;
    __int16 v16 = 2114;
    long long v17 = v9;
    __int16 v18 = 2114;
    v19 = v11;
    _os_log_debug_impl(&dword_226FA0000, v7, OS_LOG_TYPE_DEBUG, "  %zu: Client[%{public}@] type[%{public}@] sleeping[%{public}@]", (uint8_t *)&v12, 0x2Au);
  }
}

- (void)_dumpApplication:(id)a3 withOrdinal:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([v5 isProxy])
  {
    uint64_t v6 = [NSString stringWithFormat:@"isProxied[YES, via %d]", objc_msgSend(v5, "hostApplicationPID")];
  }
  else
  {
    uint64_t v6 = @"isProxied[NO]";
  }
  uint64_t v7 = RWIMessageDumpStateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = [v5 identifier];
    int v10 = [v5 hasRemoteDebugSession];
    v11 = @"NO";
    *(_DWORD *)buf = 134218754;
    unint64_t v13 = a4;
    __int16 v14 = 2114;
    if (v10) {
      v11 = @"YES";
    }
    long long v15 = v9;
    __int16 v16 = 2114;
    long long v17 = v6;
    __int16 v18 = 2114;
    v19 = v11;
    _os_log_debug_impl(&dword_226FA0000, v7, OS_LOG_TYPE_DEBUG, "  %zu: Application[%{public}@] %{public}@ hasRemoteDebugSession[%{public}@]", buf, 0x2Au);
  }
  v8 = RWIMessageDumpStateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[RWIRelay _dumpApplication:withOrdinal:](v5, v8);
  }
}

- (void)_handleDumpStateNotification
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = getpid();
  _os_log_debug_impl(&dword_226FA0000, a1, OS_LOG_TYPE_DEBUG, "Dumping state of webinspectord[%d]...", (uint8_t *)v2, 8u);
}

uint64_t __40__RWIRelay__handleDumpStateNotification__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _dumpClientConnection:a2 withOrdinal:a3];
}

uint64_t __40__RWIRelay__handleDumpStateNotification__block_invoke_55(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _dumpClientConnection:a2 withOrdinal:a3];
}

uint64_t __40__RWIRelay__handleDumpStateNotification__block_invoke_56(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _dumpApplication:a2 withOrdinal:a3];
}

uint64_t __40__RWIRelay__handleDumpStateNotification__block_invoke_58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _dumpApplication:a2 withOrdinal:a3];
}

- (void)_reportCurrentStateToAllClients
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_clientConnections allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(RWIRelay *)self _reportCurrentStateToClient:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_reportCurrentStateToClient:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263EFFA40];
  id v4 = a3;
  uint64_t v5 = [v3 standardUserDefaults];
  int v6 = [v5 BOOLForKey:@"RemoteAutomationEnabled"];

  uint64_t v7 = @"WIRAutomationAvailabilityNotAvailable";
  if (v6) {
    uint64_t v7 = @"WIRAutomationAvailabilityAvailable";
  }
  long long v11 = @"WIRAutomationAvailabilityKey";
  v12[0] = v7;
  long long v8 = NSDictionary;
  long long v9 = v7;
  long long v10 = [v8 dictionaryWithObjects:v12 forKeys:&v11 count:1];

  objc_msgSend(v4, "_rpc_reportCurrentState:", v10);
}

- (void)_rpc_reportIdentifier:(id)a3
{
  id v7 = a3;
  id v4 = [v7 objectForKeyedSubscript:@"WIRConnectionIdentifierKey"];
  uint64_t v5 = objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    uint64_t v5 = [v7 objectForKeyedSubscript:@"RWIServiceConnectionKey"];
    [(RWIRelay *)self _finalizePendingClientConnection:v5 withIdentifier:v4];
  }
  else
  {
    int v6 = objc_opt_class();
    logUnexpectedType(v6, v5);
  }
}

- (void)_rpc_getConnectedApplications:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"WIRConnectionIdentifierKey"];
  uint64_t v5 = objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    uint64_t v5 = [(NSMutableDictionary *)self->_clientConnections objectForKey:v4];
    if (v5)
    {
      int v6 = [(RWIRelay *)self _allApplicationDetails];
      objc_msgSend(v5, "_rpc_reportConnectedApplicationList:", v6);
    }
    else
    {
      int v6 = RWIDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[RWIRelay _rpc_getConnectedApplications:]();
      }
    }
  }
  else
  {
    id v7 = objc_opt_class();
    logUnexpectedType(v7, v5);
  }
}

- (void)_rpc_forwardGetListing:(id)a3
{
  id v9 = a3;
  id v4 = [v9 objectForKeyedSubscript:@"WIRApplicationIdentifierKey"];
  uint64_t v5 = objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    uint64_t v5 = [(NSMutableDictionary *)self->_applicationConnections objectForKey:v4];
    int v6 = [v5 connection];
    id v7 = [v9 dictionaryWithValuesForKeys:&unk_26DB340C0];
    [v6 sendMessage:@"WIRApplicationGetListingMessage" userInfo:v7];
  }
  else
  {
    long long v8 = objc_opt_class();
    logUnexpectedType(v8, v5);
  }
}

- (void)_rpc_forwardWakeUpDebuggables:(id)a3
{
  id v9 = a3;
  id v4 = [v9 objectForKeyedSubscript:@"WIRApplicationIdentifierKey"];
  uint64_t v5 = objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    uint64_t v5 = [(NSMutableDictionary *)self->_applicationConnections objectForKey:v4];
    int v6 = [v5 connection];
    id v7 = [v9 dictionaryWithValuesForKeys:&unk_26DB340D8];
    [v6 sendMessage:@"WIRApplicationWakeUpDebuggablesMessage" userInfo:v7];
  }
  else
  {
    long long v8 = objc_opt_class();
    logUnexpectedType(v8, v5);
  }
}

- (void)_rpc_forwardIndicateWebView:(id)a3
{
  id v9 = a3;
  id v4 = [v9 objectForKeyedSubscript:@"WIRApplicationIdentifierKey"];
  uint64_t v5 = objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    uint64_t v5 = [(NSMutableDictionary *)self->_applicationConnections objectForKey:v4];
    int v6 = [v5 connection];
    id v7 = [v9 dictionaryWithValuesForKeys:&unk_26DB340F0];
    [v6 sendMessage:@"WIRIndicateMessage" userInfo:v7];
  }
  else
  {
    long long v8 = objc_opt_class();
    logUnexpectedType(v8, v5);
  }
}

- (void)_rpc_forwardDidClose:(id)a3
{
  id v9 = a3;
  id v4 = [v9 objectForKeyedSubscript:@"WIRApplicationIdentifierKey"];
  uint64_t v5 = objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    uint64_t v5 = [(NSMutableDictionary *)self->_applicationConnections objectForKey:v4];
    int v6 = [v5 connection];
    id v7 = [v9 dictionaryWithValuesForKeys:&unk_26DB34108];
    [v6 sendMessage:@"WIRWebPageCloseMessage" userInfo:v7];
  }
  else
  {
    long long v8 = objc_opt_class();
    logUnexpectedType(v8, v5);
  }
}

- (void)_rpc_forwardSocketSetup:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"WIRApplicationIdentifierKey"];
  int v6 = objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    int v6 = [v4 objectForKeyedSubscript:@"WIRPageIdentifierKey"];
    id v7 = objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

      id v7 = [(NSMutableDictionary *)self->_applicationConnections objectForKey:v5];
      long long v8 = [v7 connection];
      id v9 = [v4 dictionaryWithValuesForKeys:&unk_26DB34120];
      [v8 sendMessage:@"WIRSocketSetupMessage" userInfo:v9];

      if ([(NSMutableDictionary *)self->_automaticInspectionSessions count])
      {
        [(NSMutableDictionary *)self->_automaticInspectionSessions allValues];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v23;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
              if (objc_msgSend(v15, "matchesPageId:applicationIdentifier:", v6, v5, (void)v22))
              {
                __int16 v18 = RWIDefaultLog();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  v19 = [v15 identifier];
                  *(_DWORD *)buf = 138543362;
                  v27 = v19;
                  _os_log_impl(&dword_226FA0000, v18, OS_LOG_TYPE_DEFAULT, "Automatic Inspection Candidate ACCEPT : Session (%{public}@)", buf, 0xCu);
                }
                automaticInspectionSessions = self->_automaticInspectionSessions;
                uint64_t v21 = [v15 identifier];
                [(NSMutableDictionary *)automaticInspectionSessions removeObjectForKey:v21];

                goto LABEL_18;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
LABEL_18:
      }
    }
    else
    {
      long long v17 = objc_opt_class();
      logUnexpectedType(v17, v7);
    }
  }
  else
  {
    __int16 v16 = objc_opt_class();
    logUnexpectedType(v16, v6);
  }
}

- (void)_rpc_forwardSocketData:(id)a3
{
  id v9 = a3;
  id v4 = [v9 objectForKeyedSubscript:@"WIRApplicationIdentifierKey"];
  uint64_t v5 = objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    uint64_t v5 = [(NSMutableDictionary *)self->_applicationConnections objectForKey:v4];
    int v6 = [v5 connection];
    id v7 = [v9 dictionaryWithValuesForKeys:&unk_26DB34138];
    [v6 sendMessage:@"WIRSocketDataMessage" userInfo:v7];
  }
  else
  {
    long long v8 = objc_opt_class();
    logUnexpectedType(v8, v5);
  }
}

- (void)_rpc_forwardAutomaticInspectionConfiguration:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"WIRAutomaticInspectionEnabledKey"];
  int v6 = objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = objc_opt_class();
    logUnexpectedType(v10, v6);
    goto LABEL_15;
  }

  int v6 = [v4 objectForKeyedSubscript:@"RWIServiceConnectionKey"];
  uint64_t v7 = [v5 BOOLValue];
  automaticInspectionDebuggers = self->_automaticInspectionDebuggers;
  if (v7)
  {
    uint64_t v9 = [(NSMutableArray *)automaticInspectionDebuggers count];
    [(NSMutableArray *)self->_automaticInspectionDebuggers addObject:v6];
    if (v9) {
      goto LABEL_15;
    }
  }
  else
  {
    removeObjectFromArray(automaticInspectionDebuggers, v6);
    if ([(NSMutableArray *)self->_automaticInspectionDebuggers count]) {
      goto LABEL_15;
    }
  }
  [(RWIRelay *)self _setGlobalNotifyStateWithAutomaticInspectionEnabled:v7];
  long long v24 = @"WIRAutomaticInspectionEnabledKey";
  uint64_t v11 = [NSNumber numberWithBool:v7];
  v25[0] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];

  uint64_t v13 = [(NSMutableDictionary *)self->_applicationConnections allValues];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        __int16 v18 = [*(id *)(*((void *)&v19 + 1) + 8 * v17) connection];
        [v18 sendMessage:@"WIRAutomaticInspectionConfigurationMessage" userInfo:v12];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }

LABEL_15:
}

- (void)_rpc_forwardAutomaticInspectionRejection:(id)a3
{
  id v12 = a3;
  id v4 = [v12 objectForKeyedSubscript:@"WIRApplicationIdentifierKey"];
  uint64_t v5 = objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    uint64_t v5 = [v12 objectForKeyedSubscript:@"WIRAutomaticInspectionSessionIdentifierKey"];
    int v6 = objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

      int v6 = [(NSMutableDictionary *)self->_automaticInspectionSessions objectForKey:v5];
      if ([v6 receivedRejectResponse])
      {
        uint64_t v7 = [(NSMutableDictionary *)self->_applicationConnections objectForKey:v4];
        long long v8 = [v7 connection];
        uint64_t v9 = [v12 dictionaryWithValuesForKeys:&unk_26DB34150];
        [v8 sendMessage:@"WIRAutomaticInspectionRejectMessage" userInfo:v9];

        [(NSMutableDictionary *)self->_automaticInspectionSessions removeObjectForKey:v6];
      }
    }
    else
    {
      uint64_t v11 = objc_opt_class();
      logUnexpectedType(v11, v6);
    }
  }
  else
  {
    id v10 = objc_opt_class();
    logUnexpectedType(v10, v5);
  }
}

- (void)_rpc_forwardDriverStateChangeRequest:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"WIRDriverIdentifierKey"];
  int v6 = objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    int v6 = [v4 objectForKeyedSubscript:@"WIRDriverIsActiveKey"];
    uint64_t v7 = objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

      long long v8 = [(NSMutableDictionary *)self->_driverInterfaces objectForKey:v5];
      uint64_t v9 = [v8 connection];
      v14[1] = @"WIRDriverIsActiveKey";
      v15[0] = v5;
      v14[0] = @"WIRDriverIdentifierKey";
      id v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "BOOLValue"));
      v15[1] = v10;
      uint64_t v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
      objc_msgSend(v9, "_rpc_requestDriverStateChange:", v11);
    }
    else
    {
      uint64_t v13 = objc_opt_class();
      logUnexpectedType(v13, v7);
    }
  }
  else
  {
    id v12 = objc_opt_class();
    logUnexpectedType(v12, v6);
  }
}

- (void)_rpc_reportDriverConnected:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"WIRConnectionIdentifierKey"];
  int v6 = objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    int v6 = +[RWIDriverConfiguration decodeFromPayload:v4];
    if (v6)
    {
      uint64_t v7 = +[RWIDriverState decodeFromPayload:v4];
      if (v7)
      {
        long long v8 = [(NSMutableDictionary *)self->_clientConnections objectForKey:v5];
        uint64_t v9 = [[_RWIDriverInterfaceInfo alloc] initWithConfiguration:v6 connection:v8];
        [(_RWIDriverInterfaceInfo *)v9 updateDriverState:v7];
        [(RWIRelay *)self _driverConnected:v9];
      }
      else
      {
        uint64_t v11 = RWIDefaultLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[RWIRelay _rpc_reportDriverConnected:]();
        }
      }
    }
    else
    {
      uint64_t v7 = RWIDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[RWIRelay _rpc_reportDriverConnected:]();
      }
    }
  }
  else
  {
    id v10 = objc_opt_class();
    logUnexpectedType(v10, v6);
  }
}

- (void)_rpc_reportDriverUpdated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"WIRDriverIdentifierKey"];
  int v6 = objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    int v6 = +[RWIDriverState decodeFromPayload:v4];
    if (v6)
    {
      uint64_t v7 = [(NSMutableDictionary *)self->_driverInterfaces objectForKey:v5];
      [v7 updateDriverState:v6];
      [(RWIRelay *)self _driverUpdated:v7];
    }
    else
    {
      uint64_t v9 = RWIDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[RWIRelay _rpc_reportDriverConnected:]();
      }
    }
  }
  else
  {
    long long v8 = objc_opt_class();
    logUnexpectedType(v8, v6);
  }
}

- (void)_rpc_reportDriverDisconnected:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"WIRDriverIdentifierKey"];
  uint64_t v5 = objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    uint64_t v5 = [(NSMutableDictionary *)self->_driverInterfaces objectForKey:v4];
    if (v5)
    {
      [(RWIRelay *)self _driverDisconnected:v5];
    }
    else
    {
      uint64_t v7 = RWIDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[RWIRelay _rpc_reportDriverDisconnected:]();
      }
    }
  }
  else
  {
    int v6 = objc_opt_class();
    logUnexpectedType(v6, v5);
  }
}

- (void)_rpc_getConnectedDrivers:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"WIRConnectionIdentifierKey"];
  uint64_t v5 = objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    uint64_t v5 = [(NSMutableDictionary *)self->_clientConnections objectForKey:v4];
    if (v5)
    {
      int v6 = [(RWIRelay *)self _allDriverDetails];
      objc_msgSend(v5, "_rpc_reportConnectedDriverList:", v6);
    }
    else
    {
      int v6 = RWIDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[RWIRelay _rpc_getConnectedApplications:]();
      }
    }
  }
  else
  {
    uint64_t v7 = objc_opt_class();
    logUnexpectedType(v7, v5);
  }
}

- (void)_rpc_forwardAutomationSessionRequest:(id)a3
{
  id v11 = a3;
  id v4 = [v11 objectForKeyedSubscript:@"WIRApplicationIdentifierKey"];
  uint64_t v5 = objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    uint64_t v5 = [(NSMutableDictionary *)self->_applicationConnections objectForKey:v4];
    delegate = self->_delegate;
    uint64_t v7 = [v5 bundleId];
    [(RWIRelayDelegate *)delegate relay:self activateApplicationWithBundleIdentifier:v7];

    long long v8 = [v5 connection];
    uint64_t v9 = [v11 dictionaryWithValuesForKeys:&unk_26DB34168];
    [v8 sendMessage:@"WIRAutomationSessionRequestMessage" userInfo:v9];
  }
  else
  {
    id v10 = objc_opt_class();
    logUnexpectedType(v10, v5);
  }
}

- (void)_rpc_requestApplicationLaunch:(id)a3
{
  id v6 = [a3 objectForKeyedSubscript:@"WIRApplicationBundleIdentifierKey"];
  id v4 = objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    [(RWIRelayDelegate *)self->_delegate relay:self activateApplicationWithBundleIdentifier:v6];
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    logUnexpectedType(v5, v4);
  }
}

- (void)_rpc_debuggerWillSleep:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = [a3 objectForKeyedSubscript:@"WIRConnectionIdentifierKey"];
  uint64_t v5 = objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    uint64_t v5 = [(NSMutableDictionary *)self->_clientConnections objectForKey:v4];
    id v6 = RWIDefaultLog();
    uint64_t v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543362;
        id v10 = v5;
        _os_log_impl(&dword_226FA0000, v7, OS_LOG_TYPE_DEFAULT, "Client Connection will sleep: %{public}@", (uint8_t *)&v9, 0xCu);
      }

      [v5 setSleeping:1];
      [(RWIRelayDelegate *)self->_delegate relayClientConnectionDidChange:self];
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[RWIRelay _rpc_getConnectedApplications:]();
      }
    }
  }
  else
  {
    long long v8 = objc_opt_class();
    logUnexpectedType(v8, v5);
  }
}

- (void)_rpc_debuggerDidWake:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = [a3 objectForKeyedSubscript:@"WIRConnectionIdentifierKey"];
  uint64_t v5 = objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    uint64_t v5 = [(NSMutableDictionary *)self->_clientConnections objectForKey:v4];
    id v6 = RWIDefaultLog();
    uint64_t v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543362;
        id v10 = v5;
        _os_log_impl(&dword_226FA0000, v7, OS_LOG_TYPE_DEFAULT, "Client Connection did wake: %{public}@", (uint8_t *)&v9, 0xCu);
      }

      [v5 setSleeping:0];
      [(RWIRelayDelegate *)self->_delegate relayClientConnectionDidChange:self];
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[RWIRelay _rpc_getConnectedApplications:]();
      }
    }
  }
  else
  {
    long long v8 = objc_opt_class();
    logUnexpectedType(v8, v5);
  }
}

- (void)_proxyApplicationConnected:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = RWIDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 pid];
    uint64_t v7 = [v4 identifier];
    long long v8 = [v4 bundleId];
    v12[0] = 67109635;
    v12[1] = v6;
    __int16 v13 = 2114;
    uint64_t v14 = v7;
    __int16 v15 = 2113;
    uint64_t v16 = v8;
    _os_log_impl(&dword_226FA0000, v5, OS_LOG_TYPE_DEFAULT, "Proxy Application Connected: %d - %{public}@ - %{private}@", (uint8_t *)v12, 0x1Cu);
  }
  pendingProxyApplicationConnections = self->_pendingProxyApplicationConnections;
  id v10 = [v4 identifier];
  [(NSMutableDictionary *)pendingProxyApplicationConnections setObject:v4 forKey:v10];

  uint64_t v11 = [v4 connection];
  [v11 sendMessage:@"WIRProxyApplicationSetupMessage" userInfo:0];
}

- (void)_proxyApplicationResponse:(id)a3 userInfo:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v8 = RWIDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v6 pid];
    id v10 = [v6 identifier];
    uint64_t v11 = [v6 bundleId];
    int v25 = 67109635;
    *(_DWORD *)v26 = v9;
    *(_WORD *)&v26[4] = 2114;
    *(void *)&v26[6] = v10;
    __int16 v27 = 2113;
    v28 = v11;
    _os_log_impl(&dword_226FA0000, v8, OS_LOG_TYPE_DEFAULT, "Proxy Application Response: %d - %{public}@ - %{private}@", (uint8_t *)&v25, 0x1Cu);
  }
  pendingProxyApplicationConnections = self->_pendingProxyApplicationConnections;
  __int16 v13 = [v6 identifier];
  uint64_t v14 = [(NSMutableDictionary *)pendingProxyApplicationConnections objectForKey:v13];

  if (v14)
  {
    __int16 v15 = self->_pendingProxyApplicationConnections;
    uint64_t v16 = [v6 identifier];
    [(NSMutableDictionary *)v15 removeObjectForKey:v16];

    uint64_t v17 = [v7 objectForKeyedSubscript:@"WIRProxyApplicationParentPID"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v21 = RWIDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_226FA0000, v21, OS_LOG_TYPE_DEFAULT, "Proxy setup response message missing data", (uint8_t *)&v25, 2u);
      }

      __int16 v18 = [v6 connection];
      [(RWIRelay *)self _disconnectApplicationConnect:v18];
      goto LABEL_19;
    }
    __int16 v18 = [v7 objectForKeyedSubscript:@"WIRProxyApplicationParentAuditData"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v18 length])
    {
      if ([v18 length] == 32)
      {
        objc_msgSend(v6, "setHostApplicationPID:", objc_msgSend(v17, "unsignedLongValue"));
        [(RWIRelay *)self _applicationConnected:v6];
LABEL_19:

        goto LABEL_20;
      }
      long long v22 = RWIDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        long long v23 = "Proxy setup response audit data does not appear to be valid.";
        goto LABEL_17;
      }
    }
    else
    {
      long long v22 = RWIDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        long long v23 = "Proxy setup response message missing data";
LABEL_17:
        _os_log_impl(&dword_226FA0000, v22, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v25, 2u);
      }
    }

    long long v24 = [v6 connection];
    [(RWIRelay *)self _disconnectApplicationConnect:v24];

    goto LABEL_19;
  }
  long long v19 = RWIDefaultLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    long long v20 = [v6 identifier];
    int v25 = 138543362;
    *(void *)v26 = v20;
    _os_log_impl(&dword_226FA0000, v19, OS_LOG_TYPE_DEFAULT, "Attempted to Complete Setup of a Proxy Connection not found in Pending Proxy Connections: %{public}@", (uint8_t *)&v25, 0xCu);
  }
  uint64_t v17 = [v6 connection];
  [(RWIRelay *)self _disconnectApplicationConnect:v17];
LABEL_20:
}

- (void)_applicationUpdated:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = RWIDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = [v4 pid];
    id v7 = [v4 identifier];
    long long v8 = [v4 bundleId];
    *(_DWORD *)buf = 67109635;
    int v21 = v6;
    __int16 v22 = 2114;
    long long v23 = v7;
    __int16 v24 = 2113;
    int v25 = v8;
    _os_log_impl(&dword_226FA0000, v5, OS_LOG_TYPE_INFO, "Application Updated: %d - %{public}@ - %{private}@", buf, 0x1Cu);
  }
  int v9 = [v4 dictionaryRepresentation];
  id v10 = [(NSMutableDictionary *)self->_clientConnections allValues];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "_rpc_applicationUpdated:", v9);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
  [(RWIRelayDelegate *)self->_delegate relay:self applicationUpdated:v4];
}

- (void)_applicationConnected:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = RWIDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 pid];
    id v7 = [v4 identifier];
    long long v8 = [v4 bundleId];
    *(_DWORD *)buf = 67109635;
    int v24 = v6;
    __int16 v25 = 2114;
    uint64_t v26 = v7;
    __int16 v27 = 2113;
    v28 = v8;
    _os_log_impl(&dword_226FA0000, v5, OS_LOG_TYPE_DEFAULT, "Application Connected: %d - %{public}@ - %{private}@", buf, 0x1Cu);
  }
  applicationConnections = self->_applicationConnections;
  id v10 = [v4 identifier];
  [(NSMutableDictionary *)applicationConnections setObject:v4 forKey:v10];

  if ([(NSMutableArray *)self->_automaticInspectionDebuggers count])
  {
    uint64_t v11 = [v4 connection];
    [v11 sendMessage:@"WIRAutomaticInspectionConfigurationMessage" userInfo:&unk_26DB34198];
  }
  uint64_t v12 = [v4 dictionaryRepresentation];
  uint64_t v13 = [(NSMutableDictionary *)self->_clientConnections allValues];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v17++), "_rpc_applicationConnected:", v12);
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }
  [(RWIRelayDelegate *)self->_delegate relay:self applicationConnected:v4];
}

- (void)_applicationDisconnected:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = RWIDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 pid];
    id v7 = [v4 identifier];
    long long v8 = [v4 bundleId];
    *(_DWORD *)buf = 67109635;
    int v23 = v6;
    __int16 v24 = 2114;
    __int16 v25 = v7;
    __int16 v26 = 2113;
    __int16 v27 = v8;
    _os_log_impl(&dword_226FA0000, v5, OS_LOG_TYPE_DEFAULT, "Application Disconnected: %d - %{public}@ - %{private}@", buf, 0x1Cu);
  }
  int v9 = [v4 dictionaryRepresentation];
  id v10 = [(NSMutableDictionary *)self->_clientConnections allValues];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14++), "_rpc_applicationDisconnected:", v9);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
  applicationConnections = self->_applicationConnections;
  uint64_t v16 = [v4 identifier];
  [(NSMutableDictionary *)applicationConnections removeObjectForKey:v16];

  [(RWIRelayDelegate *)self->_delegate relay:self applicationDisconnected:v4];
}

- (void)_disconnectApplicationConnect:(id)a3
{
  id v3 = a3;
  [v3 sendMessage:@"WIRPermissionDenied" userInfo:0];
  [v3 setDelegate:0];
}

- (void)_handleApplicationListenConnectionEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (MEMORY[0x22A670F20]() == MEMORY[0x263EF86F0])
  {
    uint64_t v5 = (_xpc_connection_s *)v4;
    xpc_connection_get_audit_token();
    uint64_t pid = xpc_connection_get_pid(v5);
    id v7 = [[_RWIRelayConnectionToApplication alloc] initWithConnection:v5];
    [(_RWIRelayConnectionToApplication *)v7 setDelegate:self];
    long long v8 = +[_RWIApplicationInfo identifierForPID:pid];
    int v9 = [(NSMutableDictionary *)self->_applicationConnections objectForKey:v8];

    if (!v9)
    {
      memset(buf, 0, 32);
      if (CPCopyBundleIdentifierAndTeamFromAuditToken())
      {
        id v10 = 0;
      }
      else
      {
        uint64_t v11 = NSString;
        uint64_t v12 = processNameForPID();
        id v10 = [v11 stringWithFormat:@"process-%@", v12];
      }
      uint64_t v13 = RWIDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109379;
        *(_DWORD *)&uint8_t buf[4] = pid;
        *(_WORD *)&buf[8] = 2113;
        *(void *)&buf[10] = v10;
        _os_log_impl(&dword_226FA0000, v13, OS_LOG_TYPE_DEFAULT, "XPC Application Connection Event: %d - %{private}@", buf, 0x12u);
      }

      uint64_t v14 = [(RWIRelayDelegate *)self->_delegate relay:self applicationInfoForIncomingConnection:v7 bundleIdentifier:v10];
      if (v14)
      {
        [(_RWIRelayConnectionToApplication *)v7 setTag:v8];
        if ([v14 isProxy]) {
          [(RWIRelay *)self _proxyApplicationConnected:v14];
        }
        else {
          [(RWIRelay *)self _applicationConnected:v14];
        }
      }
      else
      {
        [(RWIRelay *)self _disconnectApplicationConnect:v7];
      }
    }
  }
}

- (void)_addPendingClientConnection:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = RWIDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_226FA0000, v5, OS_LOG_TYPE_DEFAULT, "Received Pending Client Connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(NSMutableArray *)self->_pendingClientConnections addObject:v4];
}

- (void)_finalizePendingClientConnection:(id)a3 withIdentifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = RWIDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v6;
    _os_log_impl(&dword_226FA0000, v8, OS_LOG_TYPE_DEFAULT, "Finalized Client Connection: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  if (removeObjectFromArray(self->_pendingClientConnections, v6))
  {
    int v9 = [(NSMutableDictionary *)self->_clientConnections objectForKeyedSubscript:v7];

    if (v9)
    {
      id v10 = RWIDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[RWIRelay _finalizePendingClientConnection:withIdentifier:]();
      }
    }
    else
    {
      [v6 setTag:v7];
      MEMORY[0x22A670F30]([(NSMutableDictionary *)self->_clientConnections setObject:v6 forKey:v7]);
      [(RWIRelay *)self _reportCurrentStateToClient:v6];
      uint64_t v11 = [(RWIRelay *)self _allApplicationDetails];
      objc_msgSend(v6, "_rpc_reportConnectedApplicationList:", v11);

      id v10 = [(RWIRelay *)self _allDriverDetails];
      objc_msgSend(v6, "_rpc_reportConnectedDriverList:", v10);
    }
  }
  else
  {
    id v10 = RWIDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[RWIRelay _finalizePendingClientConnection:withIdentifier:]();
    }
  }
}

- (void)clientConnectionDidClose:(id)a3
{
  v37[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 tag];

  if (v5)
  {
    v36 = @"WIRConnectionIdentifierKey";
    id v6 = [v4 tag];
    v37[0] = v6;
    id v7 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];

    uint64_t v8 = [(NSMutableDictionary *)self->_applicationConnections allValues];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [*(id *)(*((void *)&v30 + 1) + 8 * i) connection];
          [v13 sendMessage:@"WIRConnectionDiedMessage" userInfo:v7];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v10);
    }
    clientConnections = self->_clientConnections;
    uint64_t v15 = [v4 tag];
    [(NSMutableDictionary *)clientConnections removeObjectForKey:v15];

    unint64_t v16 = removeObjectFromArray(self->_automaticInspectionDebuggers, v4);
    MEMORY[0x22A670F40](v16);
    long long v17 = [(NSMutableDictionary *)self->_driverInterfaces allValues];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          __int16 v22 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          id v23 = [v22 connection];

          if (v23 == v4) {
            [(RWIRelay *)self _driverDisconnected:v22];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v19);
    }
  }
  else
  {
    removeObjectFromArray(self->_pendingClientConnections, v4);
  }
  if (![(NSMutableDictionary *)self->_clientConnections count])
  {
    __int16 v24 = RWIDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v25 = 0;
      _os_log_impl(&dword_226FA0000, v24, OS_LOG_TYPE_DEFAULT, "Shutting Down, last client disconnected.", v25, 2u);
    }

    [(RWIRelay *)self _setGlobalNotifyStateWithAutomaticInspectionEnabled:0];
    exit(0);
  }
}

- (void)_driverConnected:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = RWIDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 identifier];
    id v7 = [v4 name];
    int v8 = [v4 isActive];
    uint64_t v9 = @"Inactive";
    *(_DWORD *)buf = 138543875;
    __int16 v25 = v6;
    if (v8) {
      uint64_t v9 = @"Active";
    }
    __int16 v26 = 2113;
    long long v27 = v7;
    __int16 v28 = 2114;
    long long v29 = v9;
    _os_log_impl(&dword_226FA0000, v5, OS_LOG_TYPE_DEFAULT, "Added Driver Interface: %{public}@ - %{private}@ (%{public}@)", buf, 0x20u);
  }
  driverInterfaces = self->_driverInterfaces;
  uint64_t v11 = [v4 identifier];
  [(NSMutableDictionary *)driverInterfaces setObject:v4 forKey:v11];

  int v12 = [(NSMutableDictionary *)self->_clientConnections allValues];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v19 + 1) + 8 * v16);
        uint64_t v18 = [v4 dictionaryRepresentation];
        objc_msgSend(v17, "_rpc_driverConnected:", v18);

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }
}

- (void)_driverUpdated:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = RWIDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 identifier];
    id v7 = [v4 name];
    int v8 = [v4 isActive];
    uint64_t v9 = @"Inactive";
    *(_DWORD *)buf = 138543875;
    id v23 = v6;
    if (v8) {
      uint64_t v9 = @"Active";
    }
    __int16 v24 = 2113;
    __int16 v25 = v7;
    __int16 v26 = 2114;
    long long v27 = v9;
    _os_log_impl(&dword_226FA0000, v5, OS_LOG_TYPE_DEFAULT, "Updated Driver Interface %{public}@ - %{private}@ (%{public}@)", buf, 0x20u);
  }
  uint64_t v10 = [(NSMutableDictionary *)self->_clientConnections allValues];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
        uint64_t v16 = [v4 dictionaryRepresentation];
        objc_msgSend(v15, "_rpc_driverUpdated:", v16);

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
}

- (void)_driverDisconnected:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = RWIDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 identifier];
    id v7 = [v4 name];
    int v8 = [v4 isActive];
    uint64_t v9 = @"Inactive";
    *(_DWORD *)buf = 138543875;
    __int16 v25 = v6;
    if (v8) {
      uint64_t v9 = @"Active";
    }
    __int16 v26 = 2113;
    long long v27 = v7;
    __int16 v28 = 2114;
    long long v29 = v9;
    _os_log_impl(&dword_226FA0000, v5, OS_LOG_TYPE_DEFAULT, "Removed Driver Interface %{public}@ - %{private}@ (%{public}@)", buf, 0x20u);
  }
  driverInterfaces = self->_driverInterfaces;
  uint64_t v11 = [v4 identifier];
  [(NSMutableDictionary *)driverInterfaces removeObjectForKey:v11];

  uint64_t v12 = [(NSMutableDictionary *)self->_clientConnections allValues];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v19 + 1) + 8 * v16);
        long long v18 = [v4 dictionaryRepresentation];
        objc_msgSend(v17, "_rpc_driverDisconnected:", v18);

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }
}

- (void)xpcConnectionFailed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 tag];

  if (v5)
  {
    applicationConnections = self->_applicationConnections;
    id v7 = [v4 tag];
    int v8 = [(NSMutableDictionary *)applicationConnections objectForKey:v7];

    uint64_t v9 = RWIDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[RWIRelay xpcConnectionFailed:](v8, v9);
    }

    if (v8) {
      [(RWIRelay *)self _applicationDisconnected:v8];
    }
    pendingProxyApplicationConnections = self->_pendingProxyApplicationConnections;
    uint64_t v11 = [v4 tag];
    [(NSMutableDictionary *)pendingProxyApplicationConnections removeObjectForKey:v11];
  }
}

- (void)xpcConnection:(id)a3 receivedMessage:(id)a4 userInfo:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v11 tag];

  if (v10)
  {
    if ([v8 isEqualToString:@"WIRRawDataMessage"])
    {
      [(RWIRelay *)self _receivedDataMessage:v9 connection:v11];
    }
    else if ([v8 isEqualToString:@"WIRListingMessage"])
    {
      [(RWIRelay *)self _receivedListingMessage:v9 connection:v11];
    }
    else if ([v8 isEqualToString:@"WIRProxyApplicationSetupResponseMessage"])
    {
      [(RWIRelay *)self _receivedProxyApplicationSetupResponseMessage:v9 connection:v11];
    }
    else if ([v8 isEqualToString:@"WIRAutomaticInspectionCandidateMessage"])
    {
      [(RWIRelay *)self _receivedAutomaticInspectionCandidate:v9 connection:v11];
    }
    else if ([v8 isEqualToString:@"WIRPingMessage"])
    {
      [(RWIRelay *)self _receivedPingMessage:v9 connection:v11];
    }
  }
}

- (void)xpcConnection:(id)a3 unhandledMessage:(id)a4
{
}

- (void)_receivedDataMessage:(id)a3 connection:(id)a4
{
  v26[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"WIRConnectionIdentifierKey"];
  id v9 = objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    id v9 = [v6 objectForKeyedSubscript:@"WIRRawDataKey"];
    objc_opt_class();
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (objc_opt_isKindOfClass())
    {

      uint64_t v11 = [v6 objectForKeyedSubscript:@"WIRMessageDataTypeKey"];
      uint64_t v12 = (void *)v11;
      uint64_t v13 = @"WIRMessageDataTypeFull";
      if (v11) {
        uint64_t v13 = (__CFString *)v11;
      }
      uint64_t v14 = v13;

      uint64_t v10 = v14;
      uint64_t v15 = objc_opt_class();
      if (objc_opt_isKindOfClass())
      {

        uint64_t v16 = [v6 objectForKeyedSubscript:@"WIRDestinationKey"];
        long long v17 = objc_opt_class();
        if (objc_opt_isKindOfClass())
        {

          long long v18 = [(NSMutableDictionary *)self->_clientConnections objectForKey:v8];
          v25[0] = @"WIRMessageDataKey";
          v25[1] = @"WIRMessageDataTypeKey";
          v26[0] = v9;
          v26[1] = v10;
          v26[2] = v16;
          v25[2] = @"WIRDestinationKey";
          void v25[3] = @"WIRApplicationIdentifierKey";
          long long v19 = [v7 tag];
          v26[3] = v19;
          long long v20 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
          objc_msgSend(v18, "_rpc_applicationSentData:", v20);
        }
        else
        {
          __int16 v24 = objc_opt_class();
          logUnexpectedType(v24, v17);
        }
      }
      else
      {
        id v23 = objc_opt_class();
        logUnexpectedType(v23, v15);
      }
    }
    else
    {
      long long v22 = objc_opt_class();
      logUnexpectedType(v22, v10);
    }
  }
  else
  {
    long long v21 = objc_opt_class();
    logUnexpectedType(v21, v9);
  }
}

- (void)_receivedListingMessage:(id)a3 connection:(id)a4
{
  v41[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"WIRConnectionIdentifierKey"];
  id v9 = objc_opt_class();
  if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v20 = objc_opt_class();
    logUnexpectedType(v20, v9);
  }
  else
  {

    id v10 = [v6 objectForKeyedSubscript:@"WIRListingKey"];
    uint64_t v11 = objc_opt_class();
    if (v10 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v21 = objc_opt_class();
      logUnexpectedType(v21, v11);
    }
    else
    {

      pendingProxyApplicationConnections = self->_pendingProxyApplicationConnections;
      uint64_t v13 = [v7 tag];
      uint64_t v14 = [(NSMutableDictionary *)pendingProxyApplicationConnections objectForKey:v13];

      if (v10)
      {
        if (v14)
        {
          uint64_t v15 = [v10 allValues];
          uint64_t v16 = [v15 indexOfObjectPassingTest:&__block_literal_global_232];

          if (v16 != 0x7FFFFFFFFFFFFFFFLL)
          {
            long long v17 = self->_pendingProxyApplicationConnections;
            long long v18 = [v14 identifier];
            [(NSMutableDictionary *)v17 removeObjectForKey:v18];

            [(RWIRelay *)self _applicationConnected:v14];
          }
        }
      }
      if (v8)
      {
        long long v19 = [(NSMutableDictionary *)self->_clientConnections objectForKey:v8];
      }
      else
      {
        long long v19 = 0;
      }
      if (v10) {
        id v22 = v10;
      }
      else {
        id v22 = (id)MEMORY[0x263EFFA78];
      }
      v40[0] = @"WIRListingKey";
      v40[1] = @"WIRApplicationIdentifierKey";
      v41[0] = v22;
      id v23 = [v7 tag];
      v41[1] = v23;
      __int16 v24 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];

      if (v19)
      {
        objc_msgSend(v19, "_rpc_applicationSentListing:", v24);
      }
      else
      {
        long long v33 = v14;
        v34 = self;
        __int16 v25 = [(NSMutableDictionary *)self->_clientConnections allValues];
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v36;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v36 != v28) {
                objc_enumerationMutation(v25);
              }
              objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "_rpc_applicationSentListing:", v24);
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v35 objects:v39 count:16];
          }
          while (v27);
        }

        uint64_t v14 = v33;
        self = v34;
      }
      applicationConnections = self->_applicationConnections;
      long long v31 = [v7 tag];
      long long v32 = [(NSMutableDictionary *)applicationConnections objectForKey:v31];

      if ([v32 updateFromListing:v6]) {
        [(RWIRelay *)self _applicationUpdated:v32];
      }
    }
  }
}

BOOL __47__RWIRelay__receivedListingMessage_connection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    id v3 = [v2 objectForKeyedSubscript:@"WIRHostApplicationIdentifierKey"];
    BOOL v4 = v3 != 0;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    logUnexpectedType(v5, v3);
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_receivedProxyApplicationSetupResponseMessage:(id)a3 connection:(id)a4
{
  id v9 = a3;
  pendingProxyApplicationConnections = self->_pendingProxyApplicationConnections;
  id v7 = [a4 tag];
  id v8 = [(NSMutableDictionary *)pendingProxyApplicationConnections objectForKey:v7];

  if (v8) {
    [(RWIRelay *)self _proxyApplicationResponse:v8 userInfo:v9];
  }
}

- (void)_receivedAutomaticInspectionCandidate:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"WIRPageIdentifierKey"];
  id v9 = objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    applicationConnections = self->_applicationConnections;
    uint64_t v11 = [v7 tag];
    id v9 = [(NSMutableDictionary *)applicationConnections objectForKey:v11];

    if (v9)
    {
      if ([(NSMutableArray *)self->_automaticInspectionDebuggers count])
      {
        uint64_t v12 = [_RWIAutomaticInspectionSession alloc];
        uint64_t v13 = [v7 tag];
        uint64_t v14 = -[_RWIAutomaticInspectionSession initWithPageId:applicationIdentifier:applicationPID:debuggers:](v12, "initWithPageId:applicationIdentifier:applicationPID:debuggers:", v8, v13, [v9 pid], self->_automaticInspectionDebuggers);

        automaticInspectionSessions = self->_automaticInspectionSessions;
        uint64_t v16 = [(_RWIAutomaticInspectionSession *)v14 identifier];
        [(NSMutableDictionary *)automaticInspectionSessions setObject:v14 forKey:v16];

        [(_RWIAutomaticInspectionSession *)v14 start];
      }
      else
      {
        long long v18 = RWIDefaultLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long v21 = 0;
          _os_log_impl(&dword_226FA0000, v18, OS_LOG_TYPE_DEFAULT, "Automatic Inspection Candidate REJECT : No Automatic Inspection Debuggers", v21, 2u);
        }

        long long v19 = [v9 connection];
        long long v20 = [v6 dictionaryWithValuesForKeys:&unk_26DB34180];
        [v19 sendMessage:@"WIRAutomaticInspectionRejectMessage" userInfo:v20];
      }
    }
  }
  else
  {
    long long v17 = objc_opt_class();
    logUnexpectedType(v17, v9);
  }
}

- (void)_receivedPingMessage:(id)a3 connection:(id)a4
{
}

- (RWIRelayDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (RWIRelayDelegate *)a3;
}

- (NSMutableDictionary)applicationConnections
{
  return self->_applicationConnections;
}

- (NSMutableDictionary)clientConnections
{
  return self->_clientConnections;
}

- (NSMutableDictionary)driverInterfaces
{
  return self->_driverInterfaces;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_driverInterfaces, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_applicationConnections, 0);
  objc_storeStrong((id *)&self->_automaticInspectionSessions, 0);
  objc_storeStrong((id *)&self->_automaticInspectionDebuggers, 0);
  objc_storeStrong((id *)&self->_pendingProxyApplicationConnections, 0);
  objc_storeStrong((id *)&self->_pendingClientConnections, 0);
  objc_storeStrong((id *)&self->_xpcApplicationListenConnection, 0);
}

- (void)_dumpApplication:(void *)a1 withOrdinal:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 name];
  uint64_t v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = @"(UNKNOWN)";
  }
  id v7 = [a1 bundleId];
  int v8 = 138478083;
  id v9 = v6;
  __int16 v10 = 2113;
  uint64_t v11 = v7;
  _os_log_debug_impl(&dword_226FA0000, a2, OS_LOG_TYPE_DEBUG, "    %{private}@ (%{private}@)", (uint8_t *)&v8, 0x16u);
}

- (void)_rpc_getConnectedApplications:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_6(&dword_226FA0000, v0, v1, "Message from unknown client connection: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_rpc_reportDriverConnected:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_6(&dword_226FA0000, v0, v1, "Could not parse RWIDriverConfiguration from payload: %@", v2, v3, v4, v5, v6);
}

- (void)_rpc_reportDriverConnected:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_6(&dword_226FA0000, v0, v1, "Could not parse RWIDriverState from payload: %@", v2, v3, v4, v5, v6);
}

- (void)_rpc_reportDriverDisconnected:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_6(&dword_226FA0000, v0, v1, "Could not find interface information for driver with identifier: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_finalizePendingClientConnection:withIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_6(&dword_226FA0000, v0, v1, "Attempted to open multiple connections from the same client: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_finalizePendingClientConnection:withIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_6(&dword_226FA0000, v0, v1, "Attempted to Complete Setup of a Remote Connection not found in Pending Connections: %{public}@", v2, v3, v4, v5, v6);
}

- (void)xpcConnectionFailed:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v4 = [a1 pid];
  uint64_t v5 = [a1 identifier];
  uint8_t v6 = [a1 bundleId];
  v7[0] = 67109635;
  v7[1] = v4;
  __int16 v8 = 2114;
  id v9 = v5;
  __int16 v10 = 2113;
  uint64_t v11 = v6;
  _os_log_error_impl(&dword_226FA0000, a2, OS_LOG_TYPE_ERROR, "XPC Connection Failed for Application: %d - %{public}@ - %{private}@", (uint8_t *)v7, 0x1Cu);
}

@end