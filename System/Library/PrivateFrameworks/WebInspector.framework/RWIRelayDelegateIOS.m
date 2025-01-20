@interface RWIRelayDelegateIOS
- (id)_processMonitorPredicatesForConnectedApplications;
- (id)relay:(id)a3 applicationInfoForIncomingConnection:(id)a4 bundleIdentifier:(id)a5;
- (id)relaySetupResponseForClientConnection:(id)a3;
- (void)_createProcessMonitorIfNeeded;
- (void)_handleProcessMonitorStateUpdate:(id)a3 forProcess:(id)a4;
- (void)_startPreventingDeviceFromIdling;
- (void)_stopPreventingDeviceFromIdling;
- (void)_updateDeviceIdlePrevention;
- (void)_updateProcessMonitorPredicates;
- (void)relay:(id)a3 activateApplicationWithBundleIdentifier:(id)a4;
- (void)relay:(id)a3 unhandledApplicationXPCMessage:(id)a4;
- (void)relayInitialize:(id)a3;
@end

@implementation RWIRelayDelegateIOS

- (id)_processMonitorPredicatesForConnectedApplications
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF980];
  v4 = [(RWIRelay *)self->_relay applicationConnections];
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = [(RWIRelay *)self->_relay applicationConnections];
  v7 = [v6 allValues];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = (void *)MEMORY[0x263F645D8];
        v13 = objc_msgSend(MEMORY[0x263F64580], "identifierWithPid:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "pid"));
        v14 = [v12 predicateMatchingIdentifier:v13];
        [v5 addObject:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v5;
}

- (void)_handleProcessMonitorStateUpdate:(id)a3 forProcess:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[_RWIApplicationInfo identifierForPID:](_RWIApplicationInfo, "identifierForPID:", [v7 pid]);
  uint64_t v9 = [(RWIRelay *)self->_relay applicationConnections];
  uint64_t v10 = [v9 objectForKey:v8];

  if (v10)
  {
    v11 = [v6 state];
    uint64_t v12 = convertRBSProcessState(v11);

    if ([v10 debuggerAvailability] != v12)
    {
      [v10 setDebuggerAvailability:v12];
      v13 = RWIDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = [v7 pid];
        v15 = NSStringFromRWIDebuggerAvailability([v10 debuggerAvailability]);
        v17[0] = 67109378;
        v17[1] = v14;
        __int16 v18 = 2114;
        long long v19 = v15;
        _os_log_impl(&dword_226FA0000, v13, OS_LOG_TYPE_DEFAULT, "Process (pid: %d) changed debugger availability: %{public}@", (uint8_t *)v17, 0x12u);
      }
      [(RWIRelay *)self->_relay updateApplication:v10];
    }
  }
  else
  {
    long long v16 = RWIDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[RWIRelayDelegateIOS _handleProcessMonitorStateUpdate:forProcess:](v7);
    }
  }
}

- (void)_createProcessMonitorIfNeeded
{
  if (!self->_processMonitor)
  {
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x263F645C0];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __52__RWIRelayDelegateIOS__createProcessMonitorIfNeeded__block_invoke;
    v6[3] = &unk_2647F9130;
    objc_copyWeak(&v7, &location);
    v4 = [v3 monitorWithConfiguration:v6];
    processMonitor = self->_processMonitor;
    self->_processMonitor = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __52__RWIRelayDelegateIOS__createProcessMonitorIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = [MEMORY[0x263F645E8] descriptor];
    [v6 setValues:1];
    v11[0] = *MEMORY[0x263F3F620];
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    [v6 setEndowmentNamespaces:v7];

    [v3 setStateDescriptor:v6];
    uint64_t v8 = [WeakRetained _processMonitorPredicatesForConnectedApplications];
    [v3 setPredicates:v8];

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __52__RWIRelayDelegateIOS__createProcessMonitorIfNeeded__block_invoke_2;
    v9[3] = &unk_2647F9108;
    objc_copyWeak(&v10, v4);
    [v3 setUpdateHandler:v9];
    objc_destroyWeak(&v10);
  }
}

void __52__RWIRelayDelegateIOS__createProcessMonitorIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__RWIRelayDelegateIOS__createProcessMonitorIfNeeded__block_invoke_3;
  block[3] = &unk_2647F90E0;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v13);
}

void __52__RWIRelayDelegateIOS__createProcessMonitorIfNeeded__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _handleProcessMonitorStateUpdate:*(void *)(a1 + 32) forProcess:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)_updateProcessMonitorPredicates
{
  processMonitor = self->_processMonitor;
  if (processMonitor)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __54__RWIRelayDelegateIOS__updateProcessMonitorPredicates__block_invoke;
    v4[3] = &unk_2647F9158;
    v4[4] = self;
    [(RBSProcessMonitor *)processMonitor updateConfiguration:v4];
  }
}

void __54__RWIRelayDelegateIOS__updateProcessMonitorPredicates__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _processMonitorPredicatesForConnectedApplications];
  [v3 setPredicates:v4];
}

- (void)relayInitialize:(id)a3
{
  objc_storeStrong((id *)&self->_relay, a3);
  id v5 = a3;
  dispatch_time_t v6 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__RWIRelayDelegateIOS_relayInitialize___block_invoke;
  block[3] = &unk_2647F7560;
  void block[4] = self;
  dispatch_after(v6, MEMORY[0x263EF83A0], block);
}

void __39__RWIRelayDelegateIOS_relayInitialize___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(*(void *)(a1 + 32) + 8) clientConnections];
  uint64_t v2 = [v1 count];

  if (!v2)
  {
    id v3 = RWIDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 134349056;
      uint64_t v5 = 0x4000000000000000;
      _os_log_impl(&dword_226FA0000, v3, OS_LOG_TYPE_DEFAULT, "Device: shutting down automatically, no client connection after %{public}g seconds.", (uint8_t *)&v4, 0xCu);
    }

    exit(1);
  }
}

- (id)relay:(id)a3 applicationInfoForIncomingConnection:(id)a4 bundleIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  [(RWIRelayDelegateIOS *)self _createProcessMonitorIfNeeded];
  id v9 = [v7 connection];
  uint64_t pid = xpc_connection_get_pid(v9);

  id v11 = (void *)MEMORY[0x263F64570];
  id v12 = [MEMORY[0x263F64580] identifierWithPid:pid];
  id v34 = 0;
  id v13 = [v11 handleForIdentifier:v12 error:&v34];
  id v14 = v34;

  if (v13) {
    BOOL v15 = v14 == 0;
  }
  else {
    BOOL v15 = 0;
  }
  if (v15)
  {
    long long v16 = [v13 currentState];
    uint64_t v33 = convertRBSProcessState(v16);
  }
  else
  {
    long long v16 = RWIDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[RWIRelayDelegateIOS relay:applicationInfoForIncomingConnection:bundleIdentifier:](v14);
    }
    uint64_t v33 = 0;
  }

  long long v17 = [v7 connection];
  id v18 = v8;
  long long v36 = 0u;
  long long v37 = 0u;
  xpc_connection_get_audit_token();
  v35[0] = v36;
  v35[1] = v37;
  if (auditTokenHasEntitlement(v35, @"com.apple.private.webinspector.proxy-application")) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = [v18 hasPrefix:@"com.apple.WebKit.WebContent"];
  }

  uint64_t v20 = [v7 connection];
  id v21 = v18;
  *(void *)&long long v36 = 0;
  v22 = [MEMORY[0x263F01890] bundleRecordWithBundleIdentifier:v21 allowPlaceholder:0 error:&v36];
  id v23 = (id)v36;
  if (v23 || !v22)
  {
    v24 = RWIDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[RWIRelayDelegateIOS relay:applicationInfoForIncomingConnection:bundleIdentifier:]((uint64_t)v21, v23);
    }
  }
  v25 = [v22 localizedName];
  v26 = v25;
  v32 = v14;
  if (!v25 || ![(__CFString *)v25 length])
  {
    uint64_t v27 = processNameForPID();

    v26 = (__CFString *)v27;
  }

  v28 = &stru_26DB29208;
  if (v26) {
    v28 = v26;
  }
  v29 = v28;

  v30 = [[_RWIApplicationInfo alloc] initWithPID:pid bundleId:v21 name:v29 isProxy:v19 connection:v7 debuggerAvailability:v33];
  return v30;
}

- (void)relay:(id)a3 activateApplicationWithBundleIdentifier:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a4;
  char v5 = [v4 isEqualToString:@"com.apple.mobilesafari"];
  uint64_t v6 = RWIDefaultLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v4;
      _os_log_impl(&dword_226FA0000, v6, OS_LOG_TYPE_DEFAULT, "Device: activating application with bundle identifier: %@", buf, 0xCu);
    }

    id v8 = (void *)MEMORY[0x263F3F778];
    uint64_t v9 = *MEMORY[0x263F3F5B8];
    v14[0] = *MEMORY[0x263F3F608];
    v14[1] = v9;
    v15[0] = MEMORY[0x263EFFA88];
    v15[1] = &unk_26DB341C0;
    id v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    uint64_t v6 = [v8 optionsWithDictionary:v10];

    id v11 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __69__RWIRelayDelegateIOS_relay_activateApplicationWithBundleIdentifier___block_invoke;
    v12[3] = &unk_2647F9180;
    id v13 = v4;
    [v11 openApplication:v13 withOptions:v6 completion:v12];
  }
  else if (v7)
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_226FA0000, v6, OS_LOG_TYPE_DEFAULT, "Device: application activation request ignored, not allowed for bundle identifier: %@", buf, 0xCu);
  }
}

void __69__RWIRelayDelegateIOS_relay_activateApplicationWithBundleIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = v6;
  if (!v5 || v6)
  {
    if (v6)
    {
      id v8 = [v6 localizedFailureReason];
    }
    else
    {
      id v8 = @"(unknown error)";
    }
    id v10 = RWIDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __69__RWIRelayDelegateIOS_relay_activateApplicationWithBundleIdentifier___block_invoke_cold_1(a1, (uint64_t)v8, v10);
    }
  }
  else
  {
    id v8 = RWIDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 1024;
      int v14 = [v5 pid];
      _os_log_impl(&dword_226FA0000, v8, OS_LOG_TYPE_DEFAULT, "Device: activated application (%@) with PID %d", (uint8_t *)&v11, 0x12u);
    }
  }
}

- (void)relay:(id)a3 unhandledApplicationXPCMessage:(id)a4
{
  id v5 = a3;
  CFTypeRef cf = 0;
  if (!lockdown_copy_checkin_info())
  {
    id v6 = RWIDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226FA0000, v6, OS_LOG_TYPE_DEFAULT, "Device: Starting lockdown XPC checkin process", buf, 2u);
    }

    BOOL v7 = +[_RWIRelayClientTCPConnection connectionFromLockdownCheckinWithInfo:cf delegate:self->_relay];
    if (v7)
    {
      id v8 = RWIDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_226FA0000, v8, OS_LOG_TYPE_DEFAULT, "Device: Received Client Connection", v9, 2u);
      }

      [v5 addPendingClientConnection:v7];
    }
    if (cf) {
      CFRelease(cf);
    }
    [v5 shutdownIfDisabled];
  }
}

- (id)relaySetupResponseForClientConnection:(id)a3
{
  return (id)MEMORY[0x263EFFA78];
}

- (void)_startPreventingDeviceFromIdling
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226FA0000, a2, OS_LOG_TYPE_ERROR, "Unable to take assertion to prevent device from becoming idle: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_stopPreventingDeviceFromIdling
{
  if (self->_idleTimerAssertion)
  {
    uint64_t v3 = RWIDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_226FA0000, v3, OS_LOG_TYPE_DEFAULT, "Device: Stopped Idling Prevention", v5, 2u);
    }

    [(BSInvalidatable *)self->_idleTimerAssertion invalidate];
    idleTimerAssertion = self->_idleTimerAssertion;
    self->_idleTimerAssertion = 0;
  }
}

- (void)_updateDeviceIdlePrevention
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(RWIRelay *)self->_relay applicationConnections];
  uint64_t v4 = [v3 allKeys];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
        int v11 = [(RWIRelay *)self->_relay applicationConnections];
        uint64_t v12 = [v11 objectForKey:v10];

        if ([v12 debuggerAvailability] && objc_msgSend(v12, "hasRemoteDebugSession"))
        {
          __int16 v13 = [(RWIRelay *)self->_relay clientConnections];
          int v14 = [v12 debuggerConnectionIdentifier];
          uint64_t v15 = [v13 objectForKey:v14];

          if (![v15 sleeping])
          {
            [(RWIRelayDelegateIOS *)self _startPreventingDeviceFromIdling];

            goto LABEL_14;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  [(RWIRelayDelegateIOS *)self _stopPreventingDeviceFromIdling];
LABEL_14:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimerAssertion, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_relay, 0);
}

- (void)_handleProcessMonitorStateUpdate:(void *)a1 forProcess:.cold.1(void *a1)
{
  [a1 pid];
  OUTLINED_FUNCTION_0_7();
  _os_log_error_impl(v1, v2, v3, v4, v5, 8u);
}

- (void)relay:(uint64_t)a1 applicationInfoForIncomingConnection:(void *)a2 bundleIdentifier:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v7 = [a2 localizedFailureReason];
  OUTLINED_FUNCTION_0_7();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);
}

- (void)relay:(void *)a1 applicationInfoForIncomingConnection:bundleIdentifier:.cold.2(void *a1)
{
  uint64_t v6 = [a1 localizedFailureReason];
  OUTLINED_FUNCTION_0_7();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x12u);
}

void __69__RWIRelayDelegateIOS_relay_activateApplicationWithBundleIdentifier___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_226FA0000, log, OS_LOG_TYPE_ERROR, "Device: failed to activate application (%@): %@", (uint8_t *)&v4, 0x16u);
}

@end