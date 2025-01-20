@interface SUControllerManager
- (BOOL)communalUponDisconnect;
- (BOOL)disconnected;
- (BOOL)exclusiveControl;
- (BOOL)initializing;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)serverQueue;
- (OS_xpc_object)serverXPCConnection;
- (SUControllerManager)initWithDelegate:(id)a3;
- (SUControllerManager)initWithExclusiveControl:(BOOL)a3 communalUponDisconnect:(BOOL)a4 withDelegate:(id)a5;
- (SUControllerManagerDelegate)delegate;
- (id)_serverConnection;
- (id)_stateName;
- (int)notifyDaemonStartedToken;
- (int)notifyStateReportToken;
- (void)_addClient;
- (void)_connectToServer;
- (void)_daemonLaunched;
- (void)_forwardApplyProgress:(id)a3;
- (void)_forwardAutoScanPerformed:(id)a3;
- (void)_forwardConnectionError:(id)a3;
- (void)_forwardConnectionRegained;
- (void)_forwardDownloadProgress:(id)a3;
- (void)_forwardInstallResult:(id)a3;
- (void)_forwardScanPostponed:(id)a3;
- (void)_forwardScanResult:(id)a3;
- (void)_handleStateReport;
- (void)_handleXPCEvent:(id)a3;
- (void)_indicateConnectionError:(id)a3;
- (void)_indicateConnectionRegained;
- (void)_indicateMessageReceived:(id)a3 messageType:(const char *)a4;
- (void)cancelCurrentConnection;
- (void)dealloc;
- (void)installUpdate:(id)a3;
- (void)managerConfig:(id)a3;
- (void)managerState:(id)a3;
- (void)managerStatus:(id)a3;
- (void)modifyConfig:(id)a3 modifying:(int64_t)a4 completion:(id)a5;
- (void)performMigration;
- (void)purgeUpdate:(id)a3 completion:(id)a4;
- (void)scanForUpdates;
- (void)scanForUpdates:(id)a3;
- (void)setCommunalUponDisconnect:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setDisconnected:(BOOL)a3;
- (void)setExclusiveControl:(BOOL)a3;
- (void)setInitializing:(BOOL)a3;
- (void)setNotifyDaemonStartedToken:(int)a3;
- (void)setNotifyStateReportToken:(int)a3;
- (void)setServerQueue:(id)a3;
- (void)setServerXPCConnection:(id)a3;
- (void)startDownload:(id)a3;
- (void)updateAcceptingTermsAndConditions;
- (void)updateAcceptingTermsAndConditions:(id)a3;
- (void)updateAcceptingTermsAndConditions:(id)a3 usingPassword:(id)a4;
- (void)useCredentialsToPersonalize:(id)a3 withAccountName:(id)a4 andPassword:(id)a5;
- (void)useSSOTokenToPersonalize:(id)a3 withSSOToken:(id)a4;
- (void)userDidAcceptTermsAndConditionsForUpdate:(id)a3;
@end

@implementation SUControllerManager

- (SUControllerManager)initWithDelegate:(id)a3
{
  return [(SUControllerManager *)self initWithExclusiveControl:0 communalUponDisconnect:0 withDelegate:a3];
}

- (SUControllerManager)initWithExclusiveControl:(BOOL)a3 communalUponDisconnect:(BOOL)a4 withDelegate:(id)a5
{
  id v8 = a5;
  v31.receiver = self;
  v31.super_class = (Class)SUControllerManager;
  v9 = [(SUControllerManager *)&v31 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.SUControllerManager.server", 0);
    serverQueue = v10->_serverQueue;
    v10->_serverQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.SUControllerManager.delegate", 0);
    delegateQueue = v10->_delegateQueue;
    v10->_delegateQueue = (OS_dispatch_queue *)v13;

    v10->_exclusiveControl = a3;
    v10->_communalUponDisconnect = a4;
    *(_WORD *)&v10->_disconnected = 257;
    v15 = (const char *)[@"com.apple.SoftwareUpdateController.Daemon.Launched" UTF8String];
    v16 = v10->_serverQueue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __84__SUControllerManager_initWithExclusiveControl_communalUponDisconnect_withDelegate___block_invoke;
    handler[3] = &unk_26551C180;
    v17 = v10;
    v30 = v17;
    notify_register_dispatch(v15, &v10->_notifyDaemonStartedToken, v16, handler);
    v18 = (const char *)[@"com.apple.SoftwareUpdateController.State.change" UTF8String];
    v19 = v17 + 3;
    v20 = v10->_serverQueue;
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    v26 = __84__SUControllerManager_initWithExclusiveControl_communalUponDisconnect_withDelegate___block_invoke_2;
    v27 = &unk_26551C180;
    v21 = v17;
    v28 = v21;
    notify_register_dispatch(v18, v19, v20, &v24);
    id v22 = (id)objc_msgSend(v21, "_serverConnection", v24, v25, v26, v27);
  }
  return v10;
}

uint64_t __84__SUControllerManager_initWithExclusiveControl_communalUponDisconnect_withDelegate___block_invoke(uint64_t a1)
{
  v2 = +[SUControllerLogger sharedLogger];
  [v2 logAtLevel:1 label:"-[SUControllerManager initWithExclusiveControl:communalUponDisconnect:withDelegate:]_block_invoke" format:@"SUCManager - received notification that sucontrollerd is launched"];

  v3 = *(void **)(a1 + 32);

  return [v3 _daemonLaunched];
}

uint64_t __84__SUControllerManager_initWithExclusiveControl_communalUponDisconnect_withDelegate___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleStateReport];
}

- (void)dealloc
{
  v3 = [(SUControllerManager *)self serverQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__SUControllerManager_dealloc__block_invoke;
  block[3] = &unk_26551C1A8;
  block[4] = self;
  dispatch_sync(v3, block);

  objc_storeWeak((id *)&self->_delegate, 0);
  serverQueue = self->_serverQueue;
  self->_serverQueue = 0;

  delegateQueue = self->_delegateQueue;
  self->_delegateQueue = 0;

  notify_cancel(self->_notifyStateReportToken);
  notify_cancel(self->_notifyDaemonStartedToken);
  v6.receiver = self;
  v6.super_class = (Class)SUControllerManager;
  [(SUControllerManager *)&v6 dealloc];
}

void __30__SUControllerManager_dealloc__block_invoke(uint64_t a1)
{
  v1 = *(_xpc_connection_s **)(*(void *)(a1 + 32) + 32);
  if (v1) {
    xpc_connection_cancel(v1);
  }
}

- (void)cancelCurrentConnection
{
  v3 = [(SUControllerManager *)self serverQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SUControllerManager_cancelCurrentConnection__block_invoke;
  block[3] = &unk_26551C1A8;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __46__SUControllerManager_cancelCurrentConnection__block_invoke(uint64_t a1)
{
  v2 = *(_xpc_connection_s **)(*(void *)(a1 + 32) + 32);
  if (v2)
  {
    xpc_connection_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = 0;
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(SUControllerManager *)self serverQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__SUControllerManager_setDelegate___block_invoke;
  v7[3] = &unk_26551C1D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

id __35__SUControllerManager_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

- (SUControllerManagerDelegate)delegate
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  dispatch_queue_t v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  uint64_t v3 = [(SUControllerManager *)self serverQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__SUControllerManager_delegate__block_invoke;
  v6[3] = &unk_26551C1F8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SUControllerManagerDelegate *)v4;
}

uint64_t __31__SUControllerManager_delegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));

  return MEMORY[0x270F9A758]();
}

- (void)_connectToServer
{
  uint64_t v3 = [(SUControllerManager *)self serverQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SUControllerManager *)self serverXPCConnection];

  if (!v4)
  {
    mach_service = xpc_connection_create_mach_service(SUControllerMachServiceName, 0, 2uLL);
    serverXPCConnection = self->_serverXPCConnection;
    self->_serverXPCConnection = mach_service;

    objc_initWeak(&location, self);
    uint64_t v7 = [(SUControllerManager *)self serverXPCConnection];
    uint64_t handler = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __39__SUControllerManager__connectToServer__block_invoke;
    v15 = &unk_26551C220;
    objc_copyWeak(&v16, &location);
    xpc_connection_set_event_handler(v7, &handler);

    id v8 = [(SUControllerManager *)self serverXPCConnection];
    xpc_connection_resume(v8);

    uint64_t v9 = +[SUControllerLogger sharedLogger];
    v10 = getprogname();
    dispatch_queue_t v11 = [(SUControllerManager *)self serverXPCConnection];
    [v9 logAtLevel:1, "-[SUControllerManager _connectToServer]", @"SUCManager[CONNECTING] resumed server connection, sending add client message for client name %s, connection: %@", v10, v11, handler, v13, v14, v15 label format];

    [(SUControllerManager *)self _addClient];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __39__SUControllerManager__connectToServer__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _handleXPCEvent:v6];
  }
  else
  {
    v5 = +[SUControllerLogger sharedLogger];
    [v5 logAtLevel:0 label:"-[SUControllerManager _connectToServer]_block_invoke" format:@"SUCManager[GONE] XPC event when no strong self"];
  }
}

- (id)_serverConnection
{
  uint64_t v3 = [(SUControllerManager *)self serverQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__SUControllerManager__serverConnection__block_invoke;
  block[3] = &unk_26551C1A8;
  block[4] = self;
  dispatch_sync(v3, block);

  id v4 = [(SUControllerManager *)self serverXPCConnection];

  return v4;
}

uint64_t __40__SUControllerManager__serverConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectToServer];
}

- (void)_handleXPCEvent:(id)a3
{
  id v4 = a3;
  v5 = [(SUControllerManager *)self serverQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__SUControllerManager__handleXPCEvent___block_invoke;
  v7[3] = &unk_26551C1D0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __39__SUControllerManager__handleXPCEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x2611CD070](*(void *)(a1 + 32));
  if (v2 == MEMORY[0x263EF8720])
  {
    v10 = +[SUControllerLogger sharedLogger];
    dispatch_queue_t v11 = [*(id *)(a1 + 40) _stateName];
    [v10 logAtLevel:0, "-[SUControllerManager _handleXPCEvent:]_block_invoke", @"%@ XPC error on server connection: %s", v11, xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), (const char *)*MEMORY[0x263EF86B0]) label format];

    uint64_t v12 = *(void *)(a1 + 32);
    if (v12 == MEMORY[0x263EF86A0])
    {
      uint64_t v13 = +[SUControllerLogger sharedLogger];
      [v13 logAtLevel:0 label:"-[SUControllerManager _handleXPCEvent:]_block_invoke" format:@"sucontrollerd disconnected"];

      [*(id *)(a1 + 40) setDisconnected:1];
      [*(id *)(a1 + 40) setServerXPCConnection:0];
      uint64_t v12 = *(void *)(a1 + 32);
    }
    v14 = *(void **)(a1 + 40);
    [v14 _indicateConnectionError:v12];
  }
  else
  {
    uint64_t v3 = v2;
    id v4 = *(void **)(a1 + 32);
    if (v3 == MEMORY[0x263EF8708])
    {
      string = xpc_dictionary_get_string(v4, SUControllerMessageTypeKey);
      if (!strcmp(string, SUControllerMessageTypeClientHasBeenAdded))
      {
        id v19 = +[SUControllerLogger sharedLogger];
        v18 = [*(id *)(a1 + 40) _stateName];
        [v19 logAtLevel:1, "-[SUControllerManager _handleXPCEvent:]_block_invoke", @"%@ XPC connection has been added", v18 label format];
      }
      else
      {
        uint64_t v17 = *(void *)(a1 + 32);
        id v16 = *(void **)(a1 + 40);
        [v16 _indicateMessageReceived:v17 messageType:string];
      }
    }
    else
    {
      uint64_t v5 = MEMORY[0x2611CCF80](v4);
      if (v5)
      {
        id v6 = (void *)v5;
        uint64_t v7 = +[SUControllerLogger sharedLogger];
        id v8 = [*(id *)(a1 + 40) _stateName];
        uint64_t v9 = [*(id *)(a1 + 40) serverXPCConnection];
        [v7 logAtLevel:0, "-[SUControllerManager _handleXPCEvent:]_block_invoke", @"%@ unexpected message %s on connection %p", v8, v6, v9 label format];

        free(v6);
      }
    }
  }
}

- (void)_handleStateReport
{
  id v2 = +[SUControllerLogger sharedLogger];
  [v2 logAtLevel:1 label:"-[SUControllerManager _handleStateReport]" format:@"sucontrollerd state changed"];
}

- (void)_daemonLaunched
{
  uint64_t v3 = [(SUControllerManager *)self serverQueue];
  dispatch_assert_queue_V2(v3);

  if ([(SUControllerManager *)self disconnected])
  {
    if ([(SUControllerManager *)self initializing])
    {
      id v4 = +[SUControllerLogger sharedLogger];
      [v4 logAtLevel:1 label:"-[SUControllerManager _daemonLaunched]" format:@"sucontrollerd is launched - initial launch after boot"];

      [(SUControllerManager *)self setInitializing:0];
    }
    else
    {
      [(SUControllerManager *)self _indicateConnectionRegained];
      uint64_t v5 = +[SUControllerLogger sharedLogger];
      objc_msgSend(v5, "logAtLevel:label:format:", 1, "-[SUControllerManager _daemonLaunched]", @"sucontrollerd is relaunched.  Connecting %s to get deletegate callback again.", getprogname());

      [(SUControllerManager *)self _connectToServer];
    }
    [(SUControllerManager *)self setDisconnected:0];
  }
}

- (void)_addClient
{
  uint64_t v3 = [(SUControllerManager *)self serverQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", getprogname());
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, SUControllerMessageTypeKey, SUControllerMessageTypeAddClient);
  id v6 = SUControllerMessageClientNameKey;
  id v8 = v4;
  xpc_dictionary_set_string(v5, v6, (const char *)[v8 UTF8String]);
  xpc_dictionary_set_BOOL(v5, SUControllerMessageExclusiveControlKey, [(SUControllerManager *)self exclusiveControl]);
  xpc_dictionary_set_BOOL(v5, SUControllerMessageCommunalUponDisconnectKey, [(SUControllerManager *)self communalUponDisconnect]);
  uint64_t v7 = [(SUControllerManager *)self serverXPCConnection];
  xpc_connection_send_message(v7, v5);
}

- (id)_stateName
{
  uint64_t v3 = [(SUControllerManager *)self serverQueue];
  dispatch_assert_queue_V2(v3);

  if ([(SUControllerManager *)self disconnected]) {
    return @"SUCManager[DISCONNECTED]";
  }
  else {
    return @"SUCManager[CONNECTED]";
  }
}

- (void)_indicateConnectionError:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = [(SUControllerManager *)self delegateQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__SUControllerManager__indicateConnectionError___block_invoke;
  v7[3] = &unk_26551C1D0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __48__SUControllerManager__indicateConnectionError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _forwardConnectionError:*(void *)(a1 + 40)];
}

- (void)_indicateConnectionRegained
{
  uint64_t v3 = [(SUControllerManager *)self delegateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__SUControllerManager__indicateConnectionRegained__block_invoke;
  block[3] = &unk_26551C1A8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __50__SUControllerManager__indicateConnectionRegained__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _forwardConnectionRegained];
}

- (void)_indicateMessageReceived:(id)a3 messageType:(const char *)a4
{
  id v6 = a3;
  uint64_t v7 = [(SUControllerManager *)self delegateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__SUControllerManager__indicateMessageReceived_messageType___block_invoke;
  block[3] = &unk_26551C248;
  id v10 = v6;
  dispatch_queue_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __60__SUControllerManager__indicateMessageReceived_messageType___block_invoke(void *a1)
{
  id v2 = (const char *)a1[6];
  if (!strcmp(v2, SUControllerMessageTypeDownloadProgress))
  {
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    [v6 _forwardDownloadProgress:v7];
  }
  else if (!strcmp(v2, SUControllerMessageTypeScanResult))
  {
    id v8 = (void *)a1[4];
    uint64_t v9 = a1[5];
    [v8 _forwardScanResult:v9];
  }
  else if (!strcmp(v2, SUControllerMessageTypeScanPostponed))
  {
    id v10 = (void *)a1[4];
    uint64_t v11 = a1[5];
    [v10 _forwardScanPostponed:v11];
  }
  else if (!strcmp(v2, SUControllerMessageTypeApplyProgress))
  {
    uint64_t v12 = (void *)a1[4];
    uint64_t v13 = a1[5];
    [v12 _forwardApplyProgress:v13];
  }
  else if (!strcmp(v2, SUControllerMessageTypeInstallResult))
  {
    v14 = (void *)a1[4];
    uint64_t v15 = a1[5];
    [v14 _forwardInstallResult:v15];
  }
  else if (!strcmp(v2, SUControllerMessageTypeAutoScanPerformed))
  {
    id v16 = (void *)a1[4];
    uint64_t v17 = a1[5];
    [v16 _forwardAutoScanPerformed:v17];
  }
  else
  {
    if (!strcmp(v2, SUControllerMessageTypeInstallationCanProceed))
    {
      id v18 = +[SUControllerLogger sharedLogger];
      objc_msgSend(v18, "logAtLevel:label:format:", 0, "-[SUControllerManager _indicateMessageReceived:messageType:]_block_invoke", @"[DELEGATE] deprecated message type %s - not reporting whether installation can proceed", a1[6]);
    }
    else
    {
      int v3 = strcmp(v2, SUControllerMessageTypeInstallationWillProceed);
      id v4 = +[SUControllerLogger sharedLogger];
      uint64_t v5 = a1[6];
      id v18 = v4;
      if (v3) {
        objc_msgSend(v4, "logAtLevel:label:format:", 0, "-[SUControllerManager _indicateMessageReceived:messageType:]_block_invoke", @"unhandled message type %s - not reported to client", v5);
      }
      else {
        objc_msgSend(v4, "logAtLevel:label:format:", 0, "-[SUControllerManager _indicateMessageReceived:messageType:]_block_invoke", @"[DELEGATE] deprecated message type %s - not reporting whether installation will proceed", v5);
      }
    }
  }
}

- (void)_forwardConnectionError:(id)a3
{
  id v4 = a3;
  id v12 = [(SUControllerManager *)self delegate];
  if (v4 == (id)MEMORY[0x263EF86A0]) {
    uint64_t v9 = 34;
  }
  else {
    uint64_t v9 = 35;
  }
  id v10 = SUControllerError(@"SUControllerError", v9, 0, @"server connection error %@", v5, v6, v7, v8, (uint64_t)v4);

  if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v12 manager:self connectionError:v10];
  }
  else
  {
    uint64_t v11 = +[SUControllerLogger sharedLogger];
    [v11 logAtLevel:1, "-[SUControllerManager _forwardConnectionError:]", @"[DELEGATE] delegate does not respond to connectionError - not reporting connection error: %@", v10 label format];
  }
}

- (void)_forwardConnectionRegained
{
  id v4 = [(SUControllerManager *)self delegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v4 connectionRegained:self];
  }
  else
  {
    int v3 = +[SUControllerLogger sharedLogger];
    [v3 logAtLevel:1 label:"-[SUControllerManager _forwardConnectionRegained]" format:@"[DELEGATE] delegate does not respond to connectionRegained - not reporting connection regained"];
  }
}

- (void)_forwardScanResult:(id)a3
{
  id v4 = SUControllerMessageTypeScanForUpdates;
  uint64_t v5 = SUControllerMessageDescriptorKey;
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v4, v6, v5, v7);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = SUControllerMessageTypeScanForUpdates;
  uint64_t v9 = SUControllerMessageErrorKey;
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v8, v6, v9, v10);

  id v12 = [(SUControllerManager *)self delegate];
  if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v12 manager:self scanRequestDidLocateUpdate:v14 error:v11];
  }
  else
  {
    uint64_t v13 = +[SUControllerLogger sharedLogger];
    [v13 logAtLevel:1 label:"-[SUControllerManager _forwardScanResult:]" format:@"[DELEGATE] delegate does not respond to scanRequestDidLocateUpdate - not reporting scan result"];
  }
}

- (void)_forwardScanPostponed:(id)a3
{
  id v4 = SUControllerMessageTypeScanPostponed;
  uint64_t v5 = SUControllerMessageDescriptorKey;
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v4, v6, v5, v7);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = SUControllerMessageTypeScanPostponed;
  uint64_t v9 = SUControllerMessageErrorKey;
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v8, v6, v9, v10);

  id v12 = [(SUControllerManager *)self delegate];
  if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v12 manager:self scanRequestPostponed:v14 error:v11];
  }
  else
  {
    uint64_t v13 = +[SUControllerLogger sharedLogger];
    [v13 logAtLevel:1 label:"-[SUControllerManager _forwardScanPostponed:]" format:@"[DELEGATE] delegate does not respond to scanRequestPostponed - not reporting scan postponed"];
  }
}

- (void)_forwardDownloadProgress:(id)a3
{
  id v4 = SUControllerMessageTypeDownloadProgress;
  uint64_t v5 = SUControllerMessageDownloadKey;
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v4, v6, v5, v7);
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = SUControllerMessageTypeDownloadProgress;
  uint64_t v9 = SUControllerMessageErrorKey;
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v8, v6, v9, v10);

  uint64_t v12 = [(SUControllerManager *)self delegate];
  uint64_t v13 = (void *)v12;
  if (v11)
  {
    if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [v13 manager:self didFailDownload:v28 withError:v11];
      goto LABEL_15;
    }
    id v14 = +[SUControllerLogger sharedLogger];
    uint64_t v15 = v14;
    id v16 = @"[DELEGATE] delegate does not respond to didFailDownload - not reporting download-and-prepare failure";
    goto LABEL_14;
  }
  uint64_t v17 = [v28 progress];
  int v18 = [v17 isDone];

  if (!v18)
  {
    if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [v13 manager:self didChangeProgressOnDownload:v28];
      goto LABEL_15;
    }
    id v14 = +[SUControllerLogger sharedLogger];
    uint64_t v15 = v14;
    id v16 = @"[DELEGATE] delegate does not respond to didChangeProgressOnDownload - not reporting download-and-prepare progress";
    goto LABEL_14;
  }
  if (!v13) {
    goto LABEL_15;
  }
  if (objc_opt_respondsToSelector())
  {
    id v19 = [v28 descriptor];
    uint64_t v20 = [v19 willProceedWithInstallation];
    v21 = [v28 descriptor];
    uint64_t v22 = [v21 isAwaitingAdmissionControlForInstallation];
    v23 = NSNumber;
    uint64_t v24 = [v28 descriptor];
    uint64_t v25 = [v24 denialReasons];
    v26 = objc_msgSend(v23, "numberWithInteger:", objc_msgSend(v25, "code"));
    [v13 manager:self didFinishDownload:v28 willProceedWithInstallation:v20 waitingForAdmissionControl:v22 denialReasons:v26];

LABEL_20:
    goto LABEL_15;
  }
  if (objc_opt_respondsToSelector())
  {
    id v19 = [v28 descriptor];
    uint64_t v27 = [v19 willProceedWithInstallation];
    v21 = [v28 descriptor];
    objc_msgSend(v13, "manager:didFinishDownload:willProceedWithInstallation:waitingForAdmissionControl:", self, v28, v27, objc_msgSend(v21, "isAwaitingAdmissionControlForInstallation"));
    goto LABEL_20;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v14 = +[SUControllerLogger sharedLogger];
    uint64_t v15 = v14;
    id v16 = @"[DELEGATE] delegate does not respond to didFinishDownload - not reporting download-and-prepare done";
LABEL_14:
    [v14 logAtLevel:1 label:"-[SUControllerManager _forwardDownloadProgress:]" format:v16];

    goto LABEL_15;
  }
  [v13 manager:self didFinishDownload:v28];
LABEL_15:
}

- (void)_forwardApplyProgress:(id)a3
{
  id v4 = SUControllerMessageTypeApplyProgress;
  uint64_t v5 = SUControllerMessageApplyKey;
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v4, v6, v5, v7);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = [(SUControllerManager *)self delegate];
  uint64_t v9 = [v13 progress];
  char v10 = [v9 isDone];

  if ((v10 & 1) == 0)
  {
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v11 = [v13 descriptor];
      uint64_t v12 = [v13 progress];
      [v8 manager:self didChangeProgressOnApply:v11 progress:v12];
    }
    else
    {
      uint64_t v11 = +[SUControllerLogger sharedLogger];
      [v11 logAtLevel:1 label:"-[SUControllerManager _forwardApplyProgress:]" format:@"[DELEGATE] delegate does not respond to didChangeProgressOnApply - not reporting apply progress"];
    }
  }
}

- (void)_forwardInstallResult:(id)a3
{
  id v4 = SUControllerMessageTypeInstallResult;
  uint64_t v5 = SUControllerMessageDescriptorKey;
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v4, v6, v5, v7);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = SUControllerMessageTypeInstallResult;
  uint64_t v9 = SUControllerMessageErrorKey;
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v8, v6, v9, v10);

  uint64_t v12 = [(SUControllerManager *)self delegate];
  id v13 = (void *)v12;
  if (v11)
  {
    if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [v13 manager:self didFailInstallation:v17 withError:v11];
      goto LABEL_11;
    }
    id v14 = +[SUControllerLogger sharedLogger];
    uint64_t v15 = v14;
    id v16 = @"[DELEGATE] delegate does not respond to didFailInstallation - not reporting install failure";
  }
  else
  {
    if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [v13 manager:self didFinishInstallation:v17];
      goto LABEL_11;
    }
    id v14 = +[SUControllerLogger sharedLogger];
    uint64_t v15 = v14;
    id v16 = @"[DELEGATE] delegate does not respond to didFinishInstallation - not reporting install success";
  }
  [v14 logAtLevel:1 label:"-[SUControllerManager _forwardInstallResult:]" format:v16];

LABEL_11:
}

- (void)_forwardAutoScanPerformed:(id)a3
{
  id v5 = [(SUControllerManager *)self delegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v5 autoScanPerformed:self];
  }
  else
  {
    id v4 = +[SUControllerLogger sharedLogger];
    [v4 logAtLevel:1 label:"-[SUControllerManager _forwardAutoScanPerformed:]" format:@"[DELEGATE] delegate does not respond to autoScanPerformed - not reporting auto scan performed"];
  }
}

- (void)managerStatus:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, SUControllerMessageTypeKey, SUControllerMessageTypeQueryManagerStatus);
  id v6 = [(SUControllerManager *)self _serverConnection];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __37__SUControllerManager_managerStatus___block_invoke;
  handler[3] = &unk_26551C270;
  id v9 = v4;
  id v7 = v4;
  xpc_connection_send_message_with_reply(v6, v5, 0, handler);
}

void __37__SUControllerManager_managerStatus___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  uint64_t v3 = MEMORY[0x2611CD070]();
  if (v3 == MEMORY[0x263EF8720])
  {
    uint64_t v11 = +[SUControllerLogger sharedLogger];
    [v11 logAtLevel:0 label:"-[SUControllerManager managerStatus:]_block_invoke" format:@"Got XPC error querying manager status"];

    uint64_t v9 = *(void *)(a1 + 32);
    string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86B0]);
    uint64_t v10 = @"Error from XPC: %s";
    goto LABEL_5;
  }
  if (v3 != MEMORY[0x263EF8708])
  {
    id v4 = +[SUControllerLogger sharedLogger];
    [v4 logAtLevel:0 label:"-[SUControllerManager managerStatus:]_block_invoke" format:@"unexpected XPC type querying manager status"];

    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = @"Unexpected XPC type";
LABEL_5:
    uint64_t v12 = SUControllerError(@"SUControllerError", 2, 0, v10, v5, v6, v7, v8, (uint64_t)string);
    (*(void (**)(uint64_t, void, void, void *))(v9 + 16))(v9, 0, 0, v12);
    goto LABEL_7;
  }
  id v13 = SUControllerMessageTypeQueryManagerStatus;
  id v14 = SUControllerMessageDescriptorKey;
  uint64_t v15 = objc_opt_class();
  uint64_t v12 = SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v13, xdict, v14, v15);
  id v16 = SUControllerMessageTypeQueryManagerStatus;
  id v17 = SUControllerMessageStatusKey;
  uint64_t v18 = objc_opt_class();
  id v19 = SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v16, xdict, v17, v18);
  uint64_t v20 = SUControllerMessageTypeQueryManagerStatus;
  v21 = SUControllerMessageErrorKey;
  uint64_t v22 = objc_opt_class();
  v23 = SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v20, xdict, v21, v22);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_7:
}

- (void)managerState:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, SUControllerMessageTypeKey, SUControllerMessageTypeQueryManagerState);
  uint64_t v6 = [(SUControllerManager *)self _serverConnection];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __36__SUControllerManager_managerState___block_invoke;
  handler[3] = &unk_26551C270;
  id v9 = v4;
  id v7 = v4;
  xpc_connection_send_message_with_reply(v6, v5, 0, handler);
}

void __36__SUControllerManager_managerState___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  uint64_t v3 = MEMORY[0x2611CD070]();
  if (v3 == MEMORY[0x263EF8720])
  {
    uint64_t v11 = +[SUControllerLogger sharedLogger];
    [v11 logAtLevel:0 label:"-[SUControllerManager managerState:]_block_invoke" format:@"Got XPC error querying manager state"];

    uint64_t v9 = *(void *)(a1 + 32);
    string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86B0]);
    uint64_t v10 = @"Error from XPC: %s";
    goto LABEL_5;
  }
  if (v3 != MEMORY[0x263EF8708])
  {
    id v4 = +[SUControllerLogger sharedLogger];
    [v4 logAtLevel:0 label:"-[SUControllerManager managerState:]_block_invoke" format:@"unexpected XPC type querying manager state"];

    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = @"Unexpected XPC type";
LABEL_5:
    uint64_t v12 = SUControllerError(@"SUControllerError", 2, 0, v10, v5, v6, v7, v8, (uint64_t)string);
    (*(void (**)(uint64_t, void, void, void *))(v9 + 16))(v9, 0, 0, v12);
    goto LABEL_7;
  }
  id v13 = SUControllerMessageTypeQueryManagerState;
  id v14 = SUControllerMessageDescriptorKey;
  uint64_t v15 = objc_opt_class();
  uint64_t v12 = SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v13, xdict, v14, v15);
  xpc_dictionary_get_int64(xdict, SUControllerMessageManagerStateKey);
  id v16 = SUControllerMessageTypeQueryManagerState;
  id v17 = SUControllerMessageErrorKey;
  uint64_t v18 = objc_opt_class();
  id v19 = SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v16, xdict, v17, v18);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_7:
}

- (void)managerConfig:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, SUControllerMessageTypeKey, SUControllerMessageTypeQueryManagerConfig);
  uint64_t v6 = [(SUControllerManager *)self _serverConnection];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __37__SUControllerManager_managerConfig___block_invoke;
  handler[3] = &unk_26551C270;
  id v9 = v4;
  id v7 = v4;
  xpc_connection_send_message_with_reply(v6, v5, 0, handler);
}

void __37__SUControllerManager_managerConfig___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  uint64_t v3 = MEMORY[0x2611CD070]();
  if (v3 == MEMORY[0x263EF8720])
  {
    uint64_t v11 = +[SUControllerLogger sharedLogger];
    [v11 logAtLevel:0 label:"-[SUControllerManager managerConfig:]_block_invoke" format:@"Got XPC error querying manager config"];

    uint64_t v9 = *(void *)(a1 + 32);
    string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86B0]);
    uint64_t v10 = @"Error from XPC: %s";
    goto LABEL_5;
  }
  if (v3 != MEMORY[0x263EF8708])
  {
    id v4 = +[SUControllerLogger sharedLogger];
    [v4 logAtLevel:0 label:"-[SUControllerManager managerConfig:]_block_invoke" format:@"unexpected XPC type querying manager config"];

    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = @"Unexpected XPC type";
LABEL_5:
    uint64_t v12 = SUControllerError(@"SUControllerError", 2, 0, v10, v5, v6, v7, v8, (uint64_t)string);
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v12);
    goto LABEL_7;
  }
  id v13 = SUControllerMessageTypeQueryManagerConfig;
  id v14 = SUControllerMessageManagerConfigKey;
  uint64_t v15 = objc_opt_class();
  uint64_t v12 = SUControllerIPCDecodeObjectForKey((uint64_t)v13, xdict, v14, v15);
  id v16 = SUControllerMessageTypeQueryManagerConfig;
  id v17 = SUControllerMessageErrorKey;
  uint64_t v18 = objc_opt_class();
  id v19 = SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v16, xdict, v17, v18);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_7:
}

- (void)modifyConfig:(id)a3 modifying:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v10, SUControllerMessageTypeKey, SUControllerMessageTypeModifyManagerConfig);
  SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeModifyManagerConfig, v10, SUControllerMessageManagerConfigKey, v9);

  xpc_dictionary_set_int64(v10, SUControllerMessageManagerConfigChangeMaskKey, a4);
  uint64_t v11 = [(SUControllerManager *)self _serverConnection];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __57__SUControllerManager_modifyConfig_modifying_completion___block_invoke;
  handler[3] = &unk_26551C270;
  id v14 = v8;
  id v12 = v8;
  xpc_connection_send_message_with_reply(v11, v10, 0, handler);
}

void __57__SUControllerManager_modifyConfig_modifying_completion___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  uint64_t v3 = MEMORY[0x2611CD070]();
  if (v3 == MEMORY[0x263EF8720])
  {
    uint64_t v11 = +[SUControllerLogger sharedLogger];
    [v11 logAtLevel:0 label:"-[SUControllerManager modifyConfig:modifying:completion:]_block_invoke" format:@"Got XPC error modifying manager config"];

    uint64_t v9 = *(void *)(a1 + 32);
    string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86B0]);
    xpc_object_t v10 = @"Error from XPC: %s";
    goto LABEL_5;
  }
  if (v3 != MEMORY[0x263EF8708])
  {
    id v4 = +[SUControllerLogger sharedLogger];
    [v4 logAtLevel:0 label:"-[SUControllerManager modifyConfig:modifying:completion:]_block_invoke" format:@"unexpected XPC type modifying manager config"];

    uint64_t v9 = *(void *)(a1 + 32);
    xpc_object_t v10 = @"Unexpected XPC type";
LABEL_5:
    id v12 = SUControllerError(@"SUControllerError", 2, 0, v10, v5, v6, v7, v8, (uint64_t)string);
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v12);
    goto LABEL_7;
  }
  id v13 = SUControllerMessageTypeModifyManagerConfig;
  id v14 = SUControllerMessageManagerConfigKey;
  uint64_t v15 = objc_opt_class();
  id v12 = SUControllerIPCDecodeObjectForKey((uint64_t)v13, xdict, v14, v15);
  id v16 = SUControllerMessageTypeModifyManagerConfig;
  id v17 = SUControllerMessageErrorKey;
  uint64_t v18 = objc_opt_class();
  id v19 = SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v16, xdict, v17, v18);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_7:
}

- (void)scanForUpdates
{
  xpc_object_t message = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(message, SUControllerMessageTypeKey, SUControllerMessageTypeScanForUpdates);
  uint64_t v3 = [(SUControllerManager *)self _serverConnection];
  xpc_connection_send_message(v3, message);
}

- (void)scanForUpdates:(id)a3
{
  id v6 = a3;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, SUControllerMessageTypeKey, SUControllerMessageTypeScanForUpdates);
  if (v6) {
    SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeScanForUpdates, v4, SUControllerMessageScanOptionsKey, v6);
  }
  uint64_t v5 = [(SUControllerManager *)self _serverConnection];
  xpc_connection_send_message(v5, v4);
}

- (void)startDownload:(id)a3
{
  id v6 = a3;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, SUControllerMessageTypeKey, SUControllerMessageTypeStartDownload);
  if (v6) {
    SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeStartDownload, v4, SUControllerMessageDescriptorKey, v6);
  }
  uint64_t v5 = [(SUControllerManager *)self _serverConnection];
  xpc_connection_send_message(v5, v4);
}

- (void)installUpdate:(id)a3
{
  id v6 = a3;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, SUControllerMessageTypeKey, SUControllerMessageTypeInstallUpdate);
  if (v6) {
    SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeInstallUpdate, v4, SUControllerMessageDescriptorKey, v6);
  }
  uint64_t v5 = [(SUControllerManager *)self _serverConnection];
  xpc_connection_send_message(v5, v4);
}

- (void)userDidAcceptTermsAndConditionsForUpdate:(id)a3
{
  id v6 = a3;
  [v6 setUserDidAcceptTermsAndConditions:1];
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, SUControllerMessageTypeKey, SUControllerMessageTypeUserDidAcceptTermsAndConditions);
  if (v6) {
    SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeUserDidAcceptTermsAndConditions, v4, SUControllerMessageDescriptorKey, v6);
  }
  uint64_t v5 = [(SUControllerManager *)self _serverConnection];
  xpc_connection_send_message(v5, v4);
}

- (void)updateAcceptingTermsAndConditions
{
}

- (void)updateAcceptingTermsAndConditions:(id)a3
{
  id v4 = a3;
  xpc_object_t message = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(message, SUControllerMessageTypeKey, SUControllerMessageTypeUpdateAcceptingTermsAndConditions);
  SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeUpdateAcceptingTermsAndConditions, message, SUControllerMessageSSOTokenKey, v4);

  uint64_t v5 = [(SUControllerManager *)self _serverConnection];
  xpc_connection_send_message(v5, message);
}

- (void)updateAcceptingTermsAndConditions:(id)a3 usingPassword:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  xpc_object_t message = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(message, SUControllerMessageTypeKey, SUControllerMessageTypeUpdateAcceptingTermsAndConditions);
  SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeUpdateAcceptingTermsAndConditions, message, SUControllerMessageAccountNameKey, v7);

  SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeUpdateAcceptingTermsAndConditions, message, SUControllerMessagePasswordKey, v6);
  uint64_t v8 = [(SUControllerManager *)self _serverConnection];
  xpc_connection_send_message(v8, message);
}

- (void)purgeUpdate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, SUControllerMessageTypeKey, SUControllerMessageTypePurgeUpdate);
  if (v6) {
    SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypePurgeUpdate, v8, SUControllerMessageDescriptorKey, v6);
  }
  uint64_t v9 = [(SUControllerManager *)self _serverConnection];
  xpc_object_t v10 = dispatch_get_global_queue(0, 0);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __46__SUControllerManager_purgeUpdate_completion___block_invoke;
  handler[3] = &unk_26551C270;
  id v13 = v7;
  id v11 = v7;
  xpc_connection_send_message_with_reply(v9, v8, v10, handler);
}

void __46__SUControllerManager_purgeUpdate_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = SUControllerMessageTypePurgeUpdate;
  id v4 = SUControllerMessageErrorKey;
  id v5 = a2;
  uint64_t v6 = objc_opt_class();
  SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v3, v5, v4, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
}

- (void)performMigration
{
  xpc_object_t message = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(message, SUControllerMessageTypeKey, SUControllerMessageTypePerformMigration);
  uint64_t v3 = [(SUControllerManager *)self _serverConnection];
  xpc_connection_send_message(v3, message);
}

- (void)useSSOTokenToPersonalize:(id)a3 withSSOToken:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, SUControllerMessageTypeKey, SUControllerMessageTypeUseSSOTokenToPersonalize);
  if (v9) {
    SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeUseSSOTokenToPersonalize, v7, SUControllerMessageDescriptorKey, v9);
  }
  SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeUseSSOTokenToPersonalize, v7, SUControllerMessageSSOTokenKey, v6);
  id v8 = [(SUControllerManager *)self _serverConnection];
  xpc_connection_send_message(v8, v7);
}

- (void)useCredentialsToPersonalize:(id)a3 withAccountName:(id)a4 andPassword:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v10, SUControllerMessageTypeKey, SUControllerMessageTypeUseCredentialsToPersonalize);
  if (v12) {
    SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeUseCredentialsToPersonalize, v10, SUControllerMessageDescriptorKey, v12);
  }
  SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeUseCredentialsToPersonalize, v10, SUControllerMessageAccountNameKey, v8);
  SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeUseCredentialsToPersonalize, v10, SUControllerMessagePasswordKey, v9);

  id v11 = [(SUControllerManager *)self _serverConnection];
  xpc_connection_send_message(v11, v10);
}

- (OS_xpc_object)serverXPCConnection
{
  return self->_serverXPCConnection;
}

- (void)setServerXPCConnection:(id)a3
{
}

- (OS_dispatch_queue)serverQueue
{
  return self->_serverQueue;
}

- (void)setServerQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (int)notifyStateReportToken
{
  return self->_notifyStateReportToken;
}

- (void)setNotifyStateReportToken:(int)a3
{
  self->_notifyStateReportToken = a3;
}

- (int)notifyDaemonStartedToken
{
  return self->_notifyDaemonStartedToken;
}

- (void)setNotifyDaemonStartedToken:(int)a3
{
  self->_notifyDaemonStartedToken = a3;
}

- (BOOL)exclusiveControl
{
  return self->_exclusiveControl;
}

- (void)setExclusiveControl:(BOOL)a3
{
  self->_exclusiveControl = a3;
}

- (BOOL)communalUponDisconnect
{
  return self->_communalUponDisconnect;
}

- (void)setCommunalUponDisconnect:(BOOL)a3
{
  self->_communalUponDisconnect = a3;
}

- (BOOL)disconnected
{
  return self->_disconnected;
}

- (void)setDisconnected:(BOOL)a3
{
  self->_disconnected = a3;
}

- (BOOL)initializing
{
  return self->_initializing;
}

- (void)setInitializing:(BOOL)a3
{
  self->_initializing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_serverQueue, 0);
  objc_storeStrong((id *)&self->_serverXPCConnection, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end