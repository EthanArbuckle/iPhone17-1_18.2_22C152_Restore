@interface DADiagnosticsLauncher
- (BOOL)_establishConnection;
- (BOOL)isDiagsRunning;
- (BSProcessHandle)diagsProcess;
- (DADiagnosticsLauncher)initWithDelegate:(id)a3;
- (DADiagnosticsLauncherDelegate)delegate;
- (DADiagnosticsLauncherServerProtocol)diagnosticsLauncherServer;
- (NSXPCConnection)xpcConnection;
- (RBSProcessMonitor)processMonitor;
- (int64_t)exitReason;
- (void)_deinitProcessMonitor;
- (void)_establishConnection;
- (void)_initProcessMonitor;
- (void)dealloc;
- (void)diagnosticsAppLaunchedWithResult:(int64_t)a3;
- (void)diagnosticsExitingForReason:(int64_t)a3;
- (void)launchDiagnostics;
- (void)setDelegate:(id)a3;
- (void)setDiagnosticsLauncherServer:(id)a3;
- (void)setDiagsProcess:(id)a3;
- (void)setExitReason:(int64_t)a3;
- (void)setIsDiagsRunning:(BOOL)a3;
- (void)setProcessMonitor:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation DADiagnosticsLauncher

- (DADiagnosticsLauncher)initWithDelegate:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DADiagnosticsLauncher;
  v6 = [(DADiagnosticsLauncher *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_isDiagsRunning = 0;
    xpcConnection = v6->_xpcConnection;
    v6->_xpcConnection = 0;

    diagsProcess = v7->_diagsProcess;
    v7->_diagsProcess = 0;

    processMonitor = v7->_processMonitor;
    v7->_processMonitor = 0;

    v7->_exitReason = -1;
    objc_storeStrong((id *)&v7->_delegate, a3);
  }

  return v7;
}

- (void)dealloc
{
  v3 = [(DADiagnosticsLauncher *)self xpcConnection];

  if (v3)
  {
    v4 = [(DADiagnosticsLauncher *)self xpcConnection];
    [v4 suspend];

    id v5 = [(DADiagnosticsLauncher *)self xpcConnection];
    [v5 invalidate];

    [(DADiagnosticsLauncher *)self setXpcConnection:0];
  }
  [(DADiagnosticsLauncher *)self _deinitProcessMonitor];
  v6.receiver = self;
  v6.super_class = (Class)DADiagnosticsLauncher;
  [(DADiagnosticsLauncher *)&v6 dealloc];
}

- (void)launchDiagnostics
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2399E3000, v0, v1, "Unable to launch Diagnostics - unable to create open application service!", v2, v3, v4, v5, v6);
}

void __42__DADiagnosticsLauncher_launchDiagnostics__block_invoke(uint64_t a1)
{
  v9[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263F3F778];
  v8[0] = *MEMORY[0x263F3F5E0];
  uint64_t v3 = [NSURL URLWithString:@"diags://"];
  v8[1] = *MEMORY[0x263F3F5E8];
  v9[0] = v3;
  v9[1] = MEMORY[0x263EFFA88];
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  uint64_t v5 = [v2 optionsWithDictionary:v4];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__DADiagnosticsLauncher_launchDiagnostics__block_invoke_2;
  v7[3] = &unk_264DB5BF0;
  uint8_t v6 = *(void **)(a1 + 32);
  v7[4] = *(void *)(a1 + 40);
  [v6 openApplication:@"com.apple.Diagnostics" withOptions:v5 completion:v7];
}

void __42__DADiagnosticsLauncher_launchDiagnostics__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__DADiagnosticsLauncher_launchDiagnostics__block_invoke_3;
  block[3] = &unk_264DB5BC8;
  id v11 = v6;
  id v12 = v5;
  uint64_t v13 = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);
}

uint64_t __42__DADiagnosticsLauncher_launchDiagnostics__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  if (*(void *)(a1 + 32) || !*(void *)(a1 + 40))
  {
    uint64_t v3 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __42__DADiagnosticsLauncher_launchDiagnostics__block_invoke_3_cold_1(v2, v3);
    }

    [*(id *)(a1 + 48) setDiagsProcess:0];
    uint64_t v4 = 2;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "setDiagsProcess:");
    [*(id *)(a1 + 48) setIsDiagsRunning:1];
    [*(id *)(a1 + 48) _initProcessMonitor];
    id v6 = [*(id *)(a1 + 48) xpcConnection];
    if (v6)
    {

LABEL_10:
      uint64_t v4 = 0;
      return [*(id *)(a1 + 48) diagnosticsAppLaunchedWithResult:v4];
    }
    if ([*(id *)(a1 + 48) _establishConnection]) {
      goto LABEL_10;
    }
    v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __42__DADiagnosticsLauncher_launchDiagnostics__block_invoke_3_cold_2();
    }

    uint64_t v4 = 1;
  }
  return [*(id *)(a1 + 48) diagnosticsAppLaunchedWithResult:v4];
}

- (void)diagnosticsExitingForReason:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    int64_t v9 = a3;
    _os_log_impl(&dword_2399E3000, v5, OS_LOG_TYPE_DEFAULT, "Diagnostics app is exiting for %ld", (uint8_t *)&v8, 0xCu);
  }

  [(DADiagnosticsLauncher *)self setIsDiagsRunning:0];
  [(DADiagnosticsLauncher *)self _deinitProcessMonitor];
  id v6 = [(DADiagnosticsLauncher *)self delegate];

  if (v6)
  {
    v7 = [(DADiagnosticsLauncher *)self delegate];
    [v7 diagnosticsAppDidExitWithReason:a3];
  }
}

- (BOOL)_establishConnection
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.diagnostics.launcher-service" options:4096];
  uint64_t v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26ED34A20];
  [v3 setRemoteObjectInterface:v4];
  id v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26ED34240];
  [v3 setExportedInterface:v5];
  [v3 setExportedObject:self];
  [v3 activate];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __45__DADiagnosticsLauncher__establishConnection__block_invoke;
  v16[3] = &unk_264DB5A70;
  v16[4] = &v19;
  objc_copyWeak(&v17, &location);
  id v6 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v16];
  if (v6)
  {
    *(void *)buf = 0;
    v26 = buf;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__0;
    v29 = __Block_byref_object_dispose__0;
    dispatch_semaphore_t v30 = dispatch_semaphore_create(0);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __45__DADiagnosticsLauncher__establishConnection__block_invoke_65;
    v15[3] = &unk_264DB5A98;
    v15[4] = buf;
    [v6 ping:v15];
    v7 = *((void *)v26 + 5);
    dispatch_time_t v8 = dispatch_time(0, 2000000000);
    intptr_t v9 = dispatch_semaphore_wait(v7, v8);
    BOOL v10 = v9 == 0;
    if (v9)
    {
      id v11 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[DADiagnosticsLauncher _establishConnection]();
      }
    }
    else
    {
      [(DADiagnosticsLauncher *)self setXpcConnection:v3];
      [(DADiagnosticsLauncher *)self setDiagnosticsLauncherServer:v6];
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v12 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [(id)v20[5] localizedDescription];
      [(DADiagnosticsLauncher *)v13 _establishConnection];
    }

    BOOL v10 = 0;
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v19, 8);

  return v10;
}

void __45__DADiagnosticsLauncher__establishConnection__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setXpcConnection:0];
}

intptr_t __45__DADiagnosticsLauncher__establishConnection__block_invoke_65(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
}

- (void)_initProcessMonitor
{
  uint64_t v3 = [(DADiagnosticsLauncher *)self processMonitor];

  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263F645D8] predicateMatchingBundleIdentifier:@"com.apple.Diagnostics"];
    id v5 = [MEMORY[0x263F645E8] descriptor];
    id v6 = (void *)MEMORY[0x263F645C0];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __44__DADiagnosticsLauncher__initProcessMonitor__block_invoke;
    v10[3] = &unk_264DB5C68;
    id v11 = v4;
    id v12 = v5;
    uint64_t v13 = self;
    id v7 = v5;
    id v8 = v4;
    intptr_t v9 = [v6 monitorWithConfiguration:v10];
    [(DADiagnosticsLauncher *)self setProcessMonitor:v9];
  }
}

void __44__DADiagnosticsLauncher__initProcessMonitor__block_invoke(void *a1, void *a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  v7[0] = a1[4];
  uint64_t v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:v7 count:1];
  [v4 setPredicates:v5];

  [v4 setStateDescriptor:a1[5]];
  [v4 setEvents:1];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__DADiagnosticsLauncher__initProcessMonitor__block_invoke_2;
  v6[3] = &unk_264DB5C40;
  v6[4] = a1[6];
  [v4 setUpdateHandler:v6];
}

void __44__DADiagnosticsLauncher__initProcessMonitor__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v18 = a3;
  id v6 = a4;
  uint64_t v7 = [*(id *)(a1 + 32) diagsProcess];
  if (v7)
  {
    id v8 = (void *)v7;
    intptr_t v9 = [*(id *)(a1 + 32) diagsProcess];
    int v10 = [v9 pid];
    if (v10 == [v18 pid])
    {
      id v11 = [v6 exitEvent];

      if (v11)
      {
        id v12 = [v6 exitEvent];
        uint64_t v13 = [v12 context];
        uint64_t v14 = [v13 type];

        v15 = *(void **)(a1 + 32);
        if (v14 == 1)
        {
          v16 = v15;
          uint64_t v17 = 0;
        }
        else
        {
          uint64_t v17 = [v15 exitReason];
          v16 = v15;
        }
        [v16 diagnosticsExitingForReason:v17];
      }
    }
    else
    {
    }
  }
}

- (void)_deinitProcessMonitor
{
  uint64_t v3 = [(DADiagnosticsLauncher *)self processMonitor];

  if (v3)
  {
    id v4 = [(DADiagnosticsLauncher *)self processMonitor];
    [v4 invalidate];

    [(DADiagnosticsLauncher *)self setProcessMonitor:0];
  }
}

- (void)diagnosticsAppLaunchedWithResult:(int64_t)a3
{
  id v5 = [(DADiagnosticsLauncher *)self delegate];

  if (v5)
  {
    id v6 = [(DADiagnosticsLauncher *)self delegate];
    [v6 diagnosticsAppLaunchedWithResult:a3];
  }
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (DADiagnosticsLauncherServerProtocol)diagnosticsLauncherServer
{
  return (DADiagnosticsLauncherServerProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDiagnosticsLauncherServer:(id)a3
{
}

- (BOOL)isDiagsRunning
{
  return self->_isDiagsRunning;
}

- (void)setIsDiagsRunning:(BOOL)a3
{
  self->_isDiagsRunning = a3;
}

- (DADiagnosticsLauncherDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)exitReason
{
  return self->_exitReason;
}

- (void)setExitReason:(int64_t)a3
{
  self->_exitReason = a3;
}

- (BSProcessHandle)diagsProcess
{
  return self->_diagsProcess;
}

- (void)setDiagsProcess:(id)a3
{
}

- (RBSProcessMonitor)processMonitor
{
  return self->_processMonitor;
}

- (void)setProcessMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_diagsProcess, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_diagnosticsLauncherServer, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __42__DADiagnosticsLauncher_launchDiagnostics__block_invoke_3_cold_1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*a1 localizedDescription];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_2399E3000, a2, OS_LOG_TYPE_ERROR, "Failed to launch Diagnostics with error: %@", (uint8_t *)&v4, 0xCu);
}

void __42__DADiagnosticsLauncher_launchDiagnostics__block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2399E3000, v0, v1, "Diagnostics launched, but unable to connect to Launcher service!", v2, v3, v4, v5, v6);
}

- (void)_establishConnection
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2399E3000, v0, v1, "Launcher service timed out pinging Diagnostics app", v2, v3, v4, v5, v6);
}

@end