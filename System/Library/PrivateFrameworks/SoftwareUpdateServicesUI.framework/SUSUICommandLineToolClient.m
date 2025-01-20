@interface SUSUICommandLineToolClient
- (SUSUICommandLineToolClient)init;
- (SUSUICommandLineToolClient)initWithDelegate:(id)a3;
- (SUSUICommandLineToolClientDelegate)delegate;
- (id)URLForType:(unint64_t)a3;
- (id)_remoteInterface;
- (id)_remoteInterfaceWithErrorHandler:(id)a3;
- (void)_connectToServerIfNecessary;
- (void)_invalidateConnection;
- (void)_noteConnectionDropped;
- (void)_noteServerExiting;
- (void)ddmInstallNow;
- (void)dealloc;
- (void)destroyInstallationKeybag;
- (void)dismissAllAlerts;
- (void)downloadDidFinish;
- (void)getAlertStatus:(id)a3;
- (void)getDDMAlertStatus:(id)a3;
- (void)invalidate;
- (void)reboot:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setInstallOperation:(id)a3;
- (void)setPasscodePolicy:(unint64_t)a3;
- (void)setRestartCountdownOverrideIntervalSeconds:(id)a3;
- (void)setUpdateToInstall:(id)a3;
- (void)showAuthenticationUIWithOptions:(unint64_t)a3 result:(id)a4;
- (void)showDDMAlert:(int64_t)a3 install:(BOOL)a4;
- (void)showEmergencyCallUIWithOptions:(unint64_t)a3 result:(id)a4;
- (void)showFollowUp:(unint64_t)a3;
- (void)showLaggardsUi:(unint64_t)a3 usingFakeData:(BOOL)a4 result:(id)a5;
- (void)showMiniAlertWithDescriptors:(unint64_t)a3 errorCode:(id)a4 downloadDescriptor:(id)a5 scanResultsDescriptor:(id)a6 autoInstallForecast:(id)a7 andRollbackDescriptor:(id)a8 result:(id)a9;
- (void)showMiniAlertWithScan:(unint64_t)a3 errorCode:(id)a4 result:(id)a5;
- (void)simulateComingFromOTAUpdate;
- (void)toggleSettingsBadge:(BOOL)a3;
@end

@implementation SUSUICommandLineToolClient

- (SUSUICommandLineToolClient)init
{
  v4 = 0;
  v4 = -[SUSUICommandLineToolClient initWithDelegate:](self, "initWithDelegate:");
  v3 = v4;
  objc_storeStrong((id *)&v4, 0);
  return v3;
}

- (SUSUICommandLineToolClient)initWithDelegate:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)SUSUICommandLineToolClient;
  v6 = [(SUSUICommandLineToolClient *)&v7 init];
  v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6)
  {
    [(SUSUICommandLineToolClient *)v9 setDelegate:location[0]];
    [(SUSUICommandLineToolClient *)v9 _connectToServerIfNecessary];
  }
  v5 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (void)invalidate
{
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  objc_storeWeak((id *)&self->_delegate, 0);
  [(SUSUICommandLineToolClient *)v4 _invalidateConnection];
  v2.receiver = v4;
  v2.super_class = (Class)SUSUICommandLineToolClient;
  [(SUSUICommandLineToolClient *)&v2 dealloc];
}

- (void)showMiniAlertWithScan:(unint64_t)a3 errorCode:(id)a4 result:(id)a5
{
  v25 = self;
  SEL v24 = a2;
  unint64_t v23 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v21 = 0;
  objc_storeStrong(&v21, a5);
  v6 = v25;
  v15[1] = (id)MEMORY[0x263EF8330];
  int v16 = -1073741824;
  int v17 = 0;
  v18 = __69__SUSUICommandLineToolClient_showMiniAlertWithScan_errorCode_result___block_invoke;
  v19 = &unk_26470B898;
  id v20 = v21;
  id v9 = -[SUSUICommandLineToolClient _remoteInterfaceWithErrorHandler:](v6, "_remoteInterfaceWithErrorHandler:");
  unint64_t v7 = v23;
  id v8 = location;
  uint64_t v10 = MEMORY[0x263EF8330];
  int v11 = -1073741824;
  int v12 = 0;
  v13 = __69__SUSUICommandLineToolClient_showMiniAlertWithScan_errorCode_result___block_invoke_2;
  v14 = &unk_26470B8C0;
  v15[0] = v21;
  objc_msgSend(v9, "showMiniAlertWithScan:errorCode:result:", v7, v8);

  objc_storeStrong(v15, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&location, 0);
}

void __69__SUSUICommandLineToolClient_showMiniAlertWithScan_errorCode_result___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  BSDispatchQueueAssertMain();
  if (a1[4]) {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(location, 0);
}

void __69__SUSUICommandLineToolClient_showMiniAlertWithScan_errorCode_result___block_invoke_2(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v5 = 0;
  objc_storeStrong(&v5, a3);
  BSDispatchQueueAssertMain();
  if (a1[4]) {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)showMiniAlertWithDescriptors:(unint64_t)a3 errorCode:(id)a4 downloadDescriptor:(id)a5 scanResultsDescriptor:(id)a6 autoInstallForecast:(id)a7 andRollbackDescriptor:(id)a8 result:(id)a9
{
  v40 = self;
  SEL v39 = a2;
  unint64_t v38 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v36 = 0;
  objc_storeStrong(&v36, a5);
  id v35 = 0;
  objc_storeStrong(&v35, a6);
  id v34 = 0;
  objc_storeStrong(&v34, a7);
  id v33 = 0;
  objc_storeStrong(&v33, a8);
  id v32 = 0;
  objc_storeStrong(&v32, a9);
  v13 = v40;
  v26[1] = (id)MEMORY[0x263EF8330];
  int v27 = -1073741824;
  int v28 = 0;
  v29 = __159__SUSUICommandLineToolClient_showMiniAlertWithDescriptors_errorCode_downloadDescriptor_scanResultsDescriptor_autoInstallForecast_andRollbackDescriptor_result___block_invoke;
  v30 = &unk_26470B898;
  id v31 = v32;
  id v20 = -[SUSUICommandLineToolClient _remoteInterfaceWithErrorHandler:](v13, "_remoteInterfaceWithErrorHandler:");
  unint64_t v14 = v38;
  id v15 = location;
  id v16 = v36;
  id v17 = v35;
  id v18 = v34;
  id v19 = v33;
  uint64_t v21 = MEMORY[0x263EF8330];
  int v22 = -1073741824;
  int v23 = 0;
  SEL v24 = __159__SUSUICommandLineToolClient_showMiniAlertWithDescriptors_errorCode_downloadDescriptor_scanResultsDescriptor_autoInstallForecast_andRollbackDescriptor_result___block_invoke_2;
  v25 = &unk_26470B8C0;
  v26[0] = v32;
  [v20 showMiniAlertWithDescriptors:v14 errorCode:v15 downloadDescriptor:v16 scanResultsDescriptor:v17 autoInstallForecast:v18 andRollbackDescriptor:v19 result:&v21];

  objc_storeStrong(v26, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&location, 0);
}

void __159__SUSUICommandLineToolClient_showMiniAlertWithDescriptors_errorCode_downloadDescriptor_scanResultsDescriptor_autoInstallForecast_andRollbackDescriptor_result___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  BSDispatchQueueAssertMain();
  if (a1[4]) {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(location, 0);
}

void __159__SUSUICommandLineToolClient_showMiniAlertWithDescriptors_errorCode_downloadDescriptor_scanResultsDescriptor_autoInstallForecast_andRollbackDescriptor_result___block_invoke_2(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v5 = 0;
  objc_storeStrong(&v5, a3);
  BSDispatchQueueAssertMain();
  if (a1[4]) {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)dismissAllAlerts
{
  id v2 = [(SUSUICommandLineToolClient *)self _remoteInterface];
  [v2 dismissAllAlerts];
}

- (void)showFollowUp:(unint64_t)a3
{
  id v3 = [(SUSUICommandLineToolClient *)self _remoteInterface];
  [v3 showFollowUp:a3];
}

- (void)showLaggardsUi:(unint64_t)a3 usingFakeData:(BOOL)a4 result:(id)a5
{
  uint64_t v10 = self;
  SEL v9 = a2;
  unint64_t v8 = a3;
  BOOL v7 = a4;
  id location = 0;
  objc_storeStrong(&location, a5);
  id v5 = [(SUSUICommandLineToolClient *)v10 _remoteInterface];
  [v5 showLaggardsUi:v8 usingFakeData:v7 result:location];

  objc_storeStrong(&location, 0);
}

- (void)showAuthenticationUIWithOptions:(unint64_t)a3 result:(id)a4
{
  uint64_t v21 = self;
  SEL v20 = a2;
  unint64_t v19 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  v4 = v21;
  v12[1] = (id)MEMORY[0x263EF8330];
  int v13 = -1073741824;
  int v14 = 0;
  id v15 = __69__SUSUICommandLineToolClient_showAuthenticationUIWithOptions_result___block_invoke;
  id v16 = &unk_26470B898;
  id v17 = location;
  id v6 = -[SUSUICommandLineToolClient _remoteInterfaceWithErrorHandler:](v4, "_remoteInterfaceWithErrorHandler:");
  unint64_t v5 = v19;
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  uint64_t v10 = __69__SUSUICommandLineToolClient_showAuthenticationUIWithOptions_result___block_invoke_2;
  int v11 = &unk_26470B8E8;
  v12[0] = location;
  objc_msgSend(v6, "showAuthenticationUIWithOptions:result:", v5);

  objc_storeStrong(v12, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&location, 0);
}

void __69__SUSUICommandLineToolClient_showAuthenticationUIWithOptions_result___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  BSDispatchQueueAssertMain();
  if (a1[4]) {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(location, 0);
}

void __69__SUSUICommandLineToolClient_showAuthenticationUIWithOptions_result___block_invoke_2(uint64_t a1, char a2, id obj)
{
  uint64_t v6 = a1;
  char v5 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  BSDispatchQueueAssertMain();
  if (*(void *)(a1 + 32)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  objc_storeStrong(&location, 0);
}

- (void)showEmergencyCallUIWithOptions:(unint64_t)a3 result:(id)a4
{
  uint64_t v21 = self;
  SEL v20 = a2;
  unint64_t v19 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  v4 = v21;
  v12[1] = (id)MEMORY[0x263EF8330];
  int v13 = -1073741824;
  int v14 = 0;
  id v15 = __68__SUSUICommandLineToolClient_showEmergencyCallUIWithOptions_result___block_invoke;
  id v16 = &unk_26470B898;
  id v17 = location;
  id v6 = -[SUSUICommandLineToolClient _remoteInterfaceWithErrorHandler:](v4, "_remoteInterfaceWithErrorHandler:");
  unint64_t v5 = v19;
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  uint64_t v10 = __68__SUSUICommandLineToolClient_showEmergencyCallUIWithOptions_result___block_invoke_2;
  int v11 = &unk_26470B8E8;
  v12[0] = location;
  objc_msgSend(v6, "showEmergencyCallUIWithOptions:result:", v5);

  objc_storeStrong(v12, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&location, 0);
}

void __68__SUSUICommandLineToolClient_showEmergencyCallUIWithOptions_result___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  BSDispatchQueueAssertMain();
  if (a1[4]) {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(location, 0);
}

void __68__SUSUICommandLineToolClient_showEmergencyCallUIWithOptions_result___block_invoke_2(uint64_t a1, char a2, id obj)
{
  uint64_t v6 = a1;
  char v5 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  BSDispatchQueueAssertMain();
  if (*(void *)(a1 + 32)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  objc_storeStrong(&location, 0);
}

- (void)toggleSettingsBadge:(BOOL)a3
{
  BOOL v4 = a3;
  id v3 = [(SUSUICommandLineToolClient *)self _remoteInterface];
  [v3 toggleSettingsBadge:v4];
}

- (void)reboot:(BOOL)a3
{
  BOOL v4 = a3;
  id v3 = [(SUSUICommandLineToolClient *)self _remoteInterface];
  [v3 reboot:v4];
}

- (void)simulateComingFromOTAUpdate
{
  id v2 = [(SUSUICommandLineToolClient *)self _remoteInterface];
  [v2 simulateComingFromOTAUpdate];
}

- (void)downloadDidFinish
{
  id v2 = [(SUSUICommandLineToolClient *)self _remoteInterface];
  [v2 downloadDidFinish];
}

- (void)setPasscodePolicy:(unint64_t)a3
{
  id v3 = [(SUSUICommandLineToolClient *)self _remoteInterface];
  [v3 setPasscodePolicy:a3];
}

- (void)destroyInstallationKeybag
{
  id v2 = [(SUSUICommandLineToolClient *)self _remoteInterface];
  [v2 destroyInstallationKeybag];
}

- (id)URLForType:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v11 = self;
  SEL v10 = a2;
  unint64_t v9 = a3;
  id location = 0;
  if (a3)
  {
    unint64_t v4 = a3;
    char v3 = 1;
  }
  else
  {
    unint64_t v4 = 0;
    char v3 = 0;
  }
  if (v3)
  {
    os_log_t oslog = (os_log_t)SUSUILog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v13, v9);
      _os_log_impl(&dword_224ECB000, oslog, OS_LOG_TYPE_DEFAULT, "Unsupported Preference pane: %lu", v13, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v12 = 0;
  }
  else
  {
    switch(v4)
    {
      case 0uLL:
        objc_storeStrong(&location, @"prefs:root=General&path=SOFTWARE_UPDATE_LINK");
        break;
      case 1uLL:
        objc_storeStrong(&location, @"prefs:root=General&path=About/SW_VERSION_SPECIFIER");
        break;
      case 2uLL:
        objc_storeStrong(&location, @"prefs:root=General&path=SOFTWARE_UPDATE_LINK/SUAutomaticUpdateButton");
        break;
      case 3uLL:
        objc_storeStrong(&location, @"prefs:root=General&path=SOFTWARE_UPDATE_LINK/SUBetaUpdatesButton");
        break;
      default:
        JUMPOUT(0);
    }
    id v12 = (id)[NSURL URLWithString:location];
  }
  objc_storeStrong(&location, 0);
  char v5 = v12;

  return v5;
}

- (id)_remoteInterface
{
  return [(NSXPCConnection *)self->_serverConnection remoteObjectProxy];
}

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSUICommandLineToolClient *)v6 _connectToServerIfNecessary];
  id v4 = [(NSXPCConnection *)v6->_serverConnection remoteObjectProxyWithErrorHandler:location[0]];
  objc_storeStrong(location, 0);

  return v4;
}

- (void)_invalidateConnection
{
  if (self->_serverConnection)
  {
    -[NSXPCConnection setInvalidationHandler:](self->_serverConnection, "setInvalidationHandler:");
    [(NSXPCConnection *)self->_serverConnection setInterruptionHandler:0];
    [(NSXPCConnection *)self->_serverConnection invalidate];
    objc_storeStrong((id *)&self->_serverConnection, 0);
    self->_connected = 0;
  }
}

- (void)_connectToServerIfNecessary
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v29 = self;
  location[1] = (os_log_t)a2;
  if (!self->_connected)
  {
    location[0] = (os_log_t)SUSUILog();
    os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(location[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v31, (uint64_t)v29);
      _os_log_impl(&dword_224ECB000, location[0], v27, "Client <%p>: establishing connection to softwareupdateservicesui plugin.", v31, 0xCu);
    }
    objc_storeStrong((id *)location, 0);
    [(SUSUICommandLineToolClient *)v29 _invalidateConnection];
    uint64_t v10 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.softwareupdateservicesui.tool" options:4096];
    serverConnection = v29->_serverConnection;
    v29->_serverConnection = (NSXPCConnection *)v10;

    unint64_t v9 = v29->_serverConnection;
    id v8 = MEMORY[0x263EF83A0];
    -[NSXPCConnection _setQueue:](v9, "_setQueue:");

    uint64_t v7 = v29->_serverConnection;
    id v6 = (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D8576A8];
    -[NSXPCConnection setRemoteObjectInterface:](v7, "setRemoteObjectInterface:");

    char v5 = v29->_serverConnection;
    id v4 = (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D852C38];
    -[NSXPCConnection setExportedInterface:](v5, "setExportedInterface:");

    [(NSXPCConnection *)v29->_serverConnection setExportedObject:v29];
    objc_initWeak(&from, v29);
    uint64_t v19 = MEMORY[0x263EF8330];
    int v20 = -1073741824;
    int v21 = 0;
    int v22 = __57__SUSUICommandLineToolClient__connectToServerIfNecessary__block_invoke;
    int v23 = &unk_26470B910;
    objc_copyWeak(&v24, &from);
    id v25 = (id)MEMORY[0x22A6262D0](&v19);
    [(NSXPCConnection *)v29->_serverConnection setInvalidationHandler:v25];
    char v3 = v29->_serverConnection;
    uint64_t v12 = MEMORY[0x263EF8330];
    int v13 = -1073741824;
    int v14 = 0;
    id v15 = __57__SUSUICommandLineToolClient__connectToServerIfNecessary__block_invoke_2;
    id v16 = &unk_26470B938;
    objc_copyWeak(&v18, &from);
    id v17 = v25;
    [(NSXPCConnection *)v3 setInterruptionHandler:&v12];
    [(NSXPCConnection *)v29->_serverConnection resume];
    v29->_connected = 1;
    v29->_serverIsExiting = 0;
    id v11 = SUSUILog();
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v30, (uint64_t)v29);
      _os_log_impl(&dword_224ECB000, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "Client <%p>: connection established to softwareupdateservicesui plugin.", v30, 0xCu);
    }
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v17, 0);
    objc_destroyWeak(&v18);
    objc_storeStrong(&v25, 0);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&from);
  }
}

void __57__SUSUICommandLineToolClient__connectToServerIfNecessary__block_invoke(uint64_t a1)
{
  BSDispatchQueueAssertMain();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _noteConnectionDropped];
}

uint64_t __57__SUSUICommandLineToolClient__connectToServerIfNecessary__block_invoke_2(NSObject *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  oslog[2] = a1;
  oslog[1] = a1;
  oslog[0] = (os_log_t)SUSUILog();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&a1[5].isa);
    __os_log_helper_16_0_1_8_0((uint64_t)v5, (uint64_t)WeakRetained);
    _os_log_impl(&dword_224ECB000, oslog[0], OS_LOG_TYPE_DEFAULT, "Client <%p>: softwareupdateservicesui plugin exit detected.", v5, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  return (*((uint64_t (**)(void))a1[4].isa + 2))();
}

- (void)_noteConnectionDropped
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  char v3 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)SUSUILog();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v4, (uint64_t)v3);
    _os_log_impl(&dword_224ECB000, oslog[0], OS_LOG_TYPE_DEFAULT, "Client <%p>: disconnected from softwareupdateservicesui plugin.", v4, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  v3->_connected = 0;
}

- (void)_noteServerExiting
{
  self->_serverIsExiting = 1;
}

- (void)getDDMAlertStatus:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(SUSUICommandLineToolClient *)v11 _remoteInterface];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  uint64_t v7 = __48__SUSUICommandLineToolClient_getDDMAlertStatus___block_invoke;
  id v8 = &unk_26470B960;
  id v9 = location[0];
  objc_msgSend(v3, "getDDMAlertStatus:");

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __48__SUSUICommandLineToolClient_getDDMAlertStatus___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

- (void)showDDMAlert:(int64_t)a3 install:(BOOL)a4
{
  BOOL v5 = a4;
  id v4 = [(SUSUICommandLineToolClient *)self _remoteInterface];
  [v4 showDDMAlert:a3 install:v5];
}

- (void)ddmInstallNow
{
  id v2 = [(SUSUICommandLineToolClient *)self _remoteInterface];
  [v2 ddmInstallNow];
}

- (void)getAlertStatus:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(SUSUICommandLineToolClient *)v11 _remoteInterface];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  uint64_t v7 = __45__SUSUICommandLineToolClient_getAlertStatus___block_invoke;
  id v8 = &unk_26470B960;
  id v9 = location[0];
  objc_msgSend(v3, "getAlertStatus:");

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __45__SUSUICommandLineToolClient_getAlertStatus___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

- (void)setRestartCountdownOverrideIntervalSeconds:(id)a3
{
  int v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(SUSUICommandLineToolClient *)v5 _remoteInterface];
  [v3 setRestartCountdownOverrideIntervalSeconds:location[0]];

  objc_storeStrong(location, 0);
}

- (void)setInstallOperation:(id)a3
{
  int v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(SUSUICommandLineToolClient *)v5 _remoteInterface];
  [v3 setInstallOperation:location[0]];

  objc_storeStrong(location, 0);
}

- (void)setUpdateToInstall:(id)a3
{
  int v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(SUSUICommandLineToolClient *)v5 _remoteInterface];
  [v3 setUpdateToInstall:location[0]];

  objc_storeStrong(location, 0);
}

- (SUSUICommandLineToolClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SUSUICommandLineToolClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end