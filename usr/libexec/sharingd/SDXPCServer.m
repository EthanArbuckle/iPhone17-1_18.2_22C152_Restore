@interface SDXPCServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OS_dispatch_queue)dispatchQueue;
- (SDXPCServer)init;
- (id)_stateDumpString;
- (os_state_data_s)_stateDump;
- (void)_activate;
- (void)_connectionInvalidated:(id)a3;
- (void)_invalidate;
- (void)activate;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)stateAppendXPCConnections:(id *)a3;
@end

@implementation SDXPCServer

- (SDXPCServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)SDXPCServer;
  v2 = [(SDXPCServer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = SFMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v2->_prefNotifyToken = -1;
  }
  return v2;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014796C;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  LogSetAppID();
  LogControl();
  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (!self->_xpcListener)
  {
    uint64_t v3 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.SharingServices"];
    xpcListener = self->_xpcListener;
    self->_xpcListener = v3;

    [(NSXPCListener *)self->_xpcListener setDelegate:self];
    [(NSXPCListener *)self->_xpcListener _setQueue:self->_dispatchQueue];
    [(NSXPCListener *)self->_xpcListener resume];
  }
  SFAWDEnsureInitialized();
  if (!self->_appleIDAgent)
  {
    v5 = +[SDAppleIDAgent sharedAgent];
    appleIDAgent = self->_appleIDAgent;
    self->_appleIDAgent = v5;
  }
  if (!self->_subCredentialAgent)
  {
    v7 = +[SDSubCredentialAgent sharedAgent];
    subCredentialAgent = self->_subCredentialAgent;
    self->_subCredentialAgent = v7;
  }
  if (!self->_hotspotAgent)
  {
    v9 = +[SDHotspotAgent sharedAgent];
    hotspotAgent = self->_hotspotAgent;
    self->_hotspotAgent = v9;
  }
  if (!self->_nearbyAgent)
  {
    v11 = +[SDNearbyAgent sharedNearbyAgent];
    nearbyAgent = self->_nearbyAgent;
    self->_nearbyAgent = v11;

    [(SDNearbyAgent *)self->_nearbyAgent setDispatchQueue:self->_dispatchQueue];
    [(SDNearbyAgent *)self->_nearbyAgent activate];
  }
  if (!self->_riAgent)
  {
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2050000000;
    v13 = (void *)qword_1009800C8;
    uint64_t v38 = qword_1009800C8;
    if (!qword_1009800C8)
    {
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_1001572F4;
      v34[3] = &unk_1008CA038;
      v34[4] = &v35;
      sub_1001572F4((uint64_t)v34);
      v13 = (void *)v36[3];
    }
    id v14 = v13;
    _Block_object_dispose(&v35, 8);
    if ([v14 supportsContentExtensions])
    {
      v15 = +[SDRemoteInteractionAgent sharedAgent];
      riAgent = self->_riAgent;
      self->_riAgent = v15;

      [(SDRemoteInteractionAgent *)self->_riAgent setDispatchQueue:self->_dispatchQueue];
      [(SDRemoteInteractionAgent *)self->_riAgent activate];
    }
  }
  if (!self->_rtiClient)
  {
    v17 = +[SDSharedRemoteTextInputClient sharedClient];
    rtiClient = self->_rtiClient;
    self->_rtiClient = v17;

    [(SDSharedRemoteTextInputClient *)self->_rtiClient setDispatchQueue:self->_dispatchQueue];
    [(SDSharedRemoteTextInputClient *)self->_rtiClient activate];
  }
  if (!self->_ppAgent && (SFIsDeviceAudioAccessory() & 1) == 0)
  {
    v19 = +[SDProximityPairingAgent sharedProximityPairingAgent];
    ppAgent = self->_ppAgent;
    self->_ppAgent = v19;

    [(SDProximityPairingAgent *)self->_ppAgent setDispatchQueue:self->_dispatchQueue];
    [(SDProximityPairingAgent *)self->_ppAgent activate];
  }
  if (!self->_setupAgent)
  {
    v21 = +[SDSetupAgent sharedSetupAgent];
    setupAgent = self->_setupAgent;
    self->_setupAgent = v21;

    [(SDSetupAgent *)self->_setupAgent setDispatchQueue:self->_dispatchQueue];
    [(SDSetupAgent *)self->_setupAgent activate];
  }
  if (!self->_autoFillAgent)
  {
    v23 = objc_alloc_init(SDAutoFillAgent);
    autoFillAgent = self->_autoFillAgent;
    self->_autoFillAgent = v23;

    [(SDAutoFillAgent *)self->_autoFillAgent setDispatchQueue:self->_dispatchQueue];
    [(SDAutoFillAgent *)self->_autoFillAgent activate];
  }
  if (!self->_proxHandoffAgent)
  {
    v25 = +[SDProxHandoffAgent sharedAgent];
    proxHandoffAgent = self->_proxHandoffAgent;
    self->_proxHandoffAgent = v25;

    [(SDProxHandoffAgent *)self->_proxHandoffAgent setDispatchQueue:self->_dispatchQueue];
    [(SDProxHandoffAgent *)self->_proxHandoffAgent activate];
  }
  if (!self->_shareAudioService)
  {
    if ((LODWORD(v34[0]) = 0, uint64_t Int64 = CFPrefs_GetInt64(), LODWORD(v34[0]))
      && GestaltGetDeviceClass() - 1 < 3
      || Int64)
    {
      v28 = (SFShareAudioService *)objc_alloc_init((Class)SFShareAudioService);
      shareAudioService = self->_shareAudioService;
      self->_shareAudioService = v28;

      dispatch_queue_t v30 = dispatch_queue_create("ShareAudioService", 0);
      [(SFShareAudioService *)self->_shareAudioService setDispatchQueue:v30];

      v31 = +[SDStatusMonitor sharedMonitor];
      [(SFShareAudioService *)self->_shareAudioService setStatusMonitor:v31];

      [(SFShareAudioService *)self->_shareAudioService activate];
    }
  }
  if (self->_prefNotifyToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100147E8C;
    handler[3] = &unk_1008CACA8;
    handler[4] = self;
    notify_register_dispatch("com.apple.Sharing.prefsChanged", &self->_prefNotifyToken, dispatchQueue, handler);
  }
  if (!self->_stateHandle)
  {
    if (IsAppleInternalBuild()) {
      self->_stateHandle = os_state_add_handler();
    }
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100147FFC;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_stateHandle)
  {
    os_state_remove_handler();
    self->_stateHandle = 0;
  }
  int prefNotifyToken = self->_prefNotifyToken;
  if (prefNotifyToken != -1)
  {
    notify_cancel(prefNotifyToken);
    self->_int prefNotifyToken = -1;
  }
  [(NSXPCListener *)self->_xpcListener invalidate];
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = self->_xpcConnections;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*(void *)(*((void *)&v20 + 1) + 8 * i) + 136) invalidate:v20];
      }
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  [(NSMutableSet *)self->_xpcConnections removeAllObjects];
  xpcConnections = self->_xpcConnections;
  self->_xpcConnections = 0;

  appleIDAgent = self->_appleIDAgent;
  self->_appleIDAgent = 0;

  [(SDNearbyAgent *)self->_nearbyAgent invalidate];
  nearbyAgent = self->_nearbyAgent;
  self->_nearbyAgent = 0;

  [(SDRemoteInteractionAgent *)self->_riAgent invalidate];
  riAgent = self->_riAgent;
  self->_riAgent = 0;

  [(SDSharedRemoteTextInputClient *)self->_rtiClient invalidate];
  rtiClient = self->_rtiClient;
  self->_rtiClient = 0;

  [(SDProximityPairingAgent *)self->_ppAgent invalidate];
  ppAgent = self->_ppAgent;
  self->_ppAgent = 0;

  [(SDSetupAgent *)self->_setupAgent invalidate];
  setupAgent = self->_setupAgent;
  self->_setupAgent = 0;

  [(SDAutoFillAgent *)self->_autoFillAgent invalidate];
  autoFillAgent = self->_autoFillAgent;
  self->_autoFillAgent = 0;

  [(SDProxHandoffAgent *)self->_proxHandoffAgent invalidate];
  proxHandoffAgent = self->_proxHandoffAgent;
  self->_proxHandoffAgent = 0;

  [(SFShareAudioService *)self->_shareAudioService invalidate];
  shareAudioService = self->_shareAudioService;
  self->_shareAudioService = 0;

  if (dword_100967FA0 <= 30 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  uint64_t v8 = (NSXPCListener *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  v9 = [[SDXPCConnection alloc] initWithServer:self xpcConnection:v6];
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v12 = self->_xpcConnections;
    self->_xpcConnections = v11;

    xpcConnections = self->_xpcConnections;
  }
  [(NSMutableSet *)xpcConnections addObject:v9];
  xpcListener = self->_xpcListener;

  if (xpcListener == v8)
  {
    id v14 = self->_xpcInterfaceClient;
    if (!v14)
    {
      id v14 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SFXPCInterface];
      id v29 = objc_alloc((Class)NSSet);
      uint64_t v28 = objc_opt_class();
      uint64_t v27 = objc_opt_class();
      uint64_t v26 = objc_opt_class();
      uint64_t v25 = objc_opt_class();
      uint64_t v24 = objc_opt_class();
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = objc_opt_class();
      id v18 = [v29 initWithObjects:v28, v27, v26, v25, v24, v15, v16, v17, objc_opt_class(), 0];
      [(NSXPCInterface *)v14 setClasses:v18 forSelector:"shareAudioProgressEvent:info:" argumentIndex:1 ofReply:0];
      objc_storeStrong((id *)&self->_xpcInterfaceClient, v14);
    }
    v19 = self->_xpcInterfaceServer;
    if (!v19)
    {
      v19 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SDXPCInterface];
      id v20 = objc_alloc((Class)NSSet);
      uint64_t v21 = objc_opt_class();
      id v22 = [v20 initWithObjects:v21, objc_opt_class(), 0];
      [(NSXPCInterface *)v19 setClasses:v22 forSelector:"getPeopleSuggestions:completion:" argumentIndex:0 ofReply:1];

      objc_storeStrong((id *)&self->_xpcInterfaceServer, v19);
    }
    [v6 _setQueue:self->_dispatchQueue];
    [v6 setExportedInterface:v19];
    [v6 setExportedObject:v9];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100148644;
    v30[3] = &unk_1008CA640;
    v30[4] = self;
    v31 = v9;
    [v6 setInvalidationHandler:v30];
    [v6 setRemoteObjectInterface:v14];
    [v6 resume];
    if (dword_100967FA0 <= 20 && (dword_100967FA0 != -1 || _LogCategory_Initialize()))
    {
      [v6 processIdentifier];
      LogPrintF();
    }
  }
  else
  {
    if (dword_100967FA0 <= 60 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(NSMutableSet *)self->_xpcConnections removeObject:v9];
  }

  return xpcListener == v8;
}

- (void)_connectionInvalidated:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  [v5 connectionInvalidated];
  [(NSMutableSet *)self->_xpcConnections removeObject:v5];
}

- (void)stateAppendXPCConnections:(id *)a3
{
  NSAppendPrintF();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obj = self->_xpcConnections;
  id v21 = [(NSMutableSet *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v29;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v16 = [*(id *)(v5 + 136) processIdentifier:v15];
        NSAppendPrintF();
        if (objc_msgSend(*(id *)(v5 + 16), "count", v16))
        {
          long long v23 = i;
          NSAppendPrintF();
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          uint64_t v22 = v5;
          id v6 = *(id *)(v5 + 16);
          id v7 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v7)
          {
            id v8 = v7;
            int v9 = 0;
            uint64_t v10 = *(void *)v25;
            do
            {
              for (j = 0; j != v8; j = (char *)j + 1)
              {
                if (*(void *)v25 != v10) {
                  objc_enumerationMutation(v6);
                }
                uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * (void)j);
                if (v9 + j) {
                  v13 = ", ";
                }
                else {
                  v13 = "";
                }
                NSUInteger v14 = -[NSCountedSet countForObject:](self->_assertions, "countForObject:", *(void *)(*((void *)&v24 + 1) + 8 * (void)j), v15, v17, v18);
                uint64_t v17 = v12;
                NSUInteger v18 = v14;
                uint64_t v15 = v13;
                NSAppendPrintF();
              }
              id v8 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
              v9 += (int)j;
            }
            while (v8);
          }

          uint64_t v5 = v22;
          i = v23;
        }
        if (*(unsigned char *)(v5 + 25)) {
          NSAppendPrintF();
        }
        if (*(void *)(v5 + 32))
        {
          uint64_t v15 = *(const char **)(v5 + 32);
          NSAppendPrintF();
        }
        if (*(void *)(v5 + 40))
        {
          uint64_t v15 = *(const char **)(v5 + 40);
          NSAppendPrintF();
        }
        if (*(void *)(v5 + 64))
        {
          uint64_t v15 = *(const char **)(v5 + 64);
          NSAppendPrintF();
        }
        if (*(void *)(v5 + 72))
        {
          uint64_t v15 = *(const char **)(v5 + 72);
          NSAppendPrintF();
        }
        if (*(void *)(v5 + 88))
        {
          uint64_t v15 = *(const char **)(v5 + 88);
          NSAppendPrintF();
        }
        if (*(void *)(v5 + 96))
        {
          uint64_t v15 = *(const char **)(v5 + 96);
          NSAppendPrintF();
        }
        if (*(void *)(v5 + 104))
        {
          uint64_t v15 = *(const char **)(v5 + 104);
          NSAppendPrintF();
        }
        NSAppendPrintF();
      }
      id v21 = [(NSMutableSet *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v21);
  }
}

- (os_state_data_s)_stateDump
{
  if (dword_100967FA0 <= 50 && (dword_100967FA0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v3 = [(SDXPCServer *)self _stateDumpString];
  if (v3)
  {
    v4 = +[NSPropertyListSerialization dataWithPropertyList:v3 format:200 options:0 error:0];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 length];
      id v7 = (os_state_data_s *)malloc_type_calloc(1uLL, (size_t)v6 + 200, 0x73A242A3uLL);
      id v8 = v7;
      if (v7)
      {
        v7->var0 = 1;
        v7->var1.var1 = v6;
        __strlcpy_chk();
        id v5 = v5;
        memcpy(v8->var4, [v5 bytes], (size_t)v6);
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
    id v5 = 0;
  }

  return v8;
}

- (id)_stateDumpString
{
  v32[7] = 0;
  NSAppendPrintF();
  id v3 = 0;
  uint64_t v4 = [(SDNearbyAgent *)self->_nearbyAgent description];
  id v5 = (void *)v4;
  if (v4)
  {
    v32[6] = v3;
    uint64_t v26 = v4;
    NSAppendPrintF();
    id v6 = v3;

    id v3 = v6;
  }
  id v7 = [(SDRemoteInteractionAgent *)self->_riAgent description];

  if (v7)
  {
    v32[5] = v3;
    long long v27 = v7;
    NSAppendPrintF();
    id v8 = v3;

    id v3 = v8;
  }
  int v9 = [(SDProximityPairingAgent *)self->_ppAgent description];

  if (v9)
  {
    v32[4] = v3;
    long long v28 = v9;
    NSAppendPrintF();
    id v10 = v3;

    id v3 = v10;
  }
  v11 = CUDescriptionWithLevel();

  if (v11)
  {
    v32[3] = v3;
    long long v28 = v11;
    NSAppendPrintF();
    id v12 = v3;

    id v3 = v12;
  }
  v13 = [(SDAutoFillAgent *)self->_autoFillAgent description];

  if (v13)
  {
    v32[2] = v3;
    long long v29 = v13;
    NSAppendPrintF();
    id v14 = v3;

    id v3 = v14;
  }
  uint64_t v15 = [(SDProxHandoffAgent *)self->_proxHandoffAgent description];

  if (v15)
  {
    v32[1] = v3;
    long long v30 = v15;
    NSAppendPrintF();
    id v16 = v3;

    id v3 = v16;
  }
  v32[0] = v3;
  -[SDXPCServer stateAppendXPCConnections:](self, "stateAppendXPCConnections:", v32, v30);
  id v17 = v32[0];

  NSAppendPrintF();
  id v18 = v17;

  v19 = [(SDAppleIDAgent *)self->_appleIDAgent detailedDescription];

  if (v19)
  {
    long long v31 = v19;
    NSAppendPrintF();
    id v20 = v18;

    id v18 = v20;
  }
  id v21 = +[SDStatusMonitor sharedMonitor];
  uint64_t v22 = [v21 description];

  if (v22)
  {
    NSAppendPrintF();
    id v23 = v18;

    id v18 = v23;
  }
  NSAppendPrintF();
  id v24 = v18;

  return v24;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcInterfaceServer, 0);
  objc_storeStrong((id *)&self->_xpcInterfaceClient, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_shareAudioService, 0);
  objc_storeStrong((id *)&self->_setupAgent, 0);
  objc_storeStrong((id *)&self->_proxHandoffAgent, 0);
  objc_storeStrong((id *)&self->_ppAgent, 0);
  objc_storeStrong((id *)&self->_rtiClient, 0);
  objc_storeStrong((id *)&self->_riAgent, 0);
  objc_storeStrong((id *)&self->_nearbyAgent, 0);
  objc_storeStrong((id *)&self->_hotspotAgent, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_contactsQueue, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_subCredentialAgent, 0);
  objc_storeStrong((id *)&self->_autoFillAgent, 0);

  objc_storeStrong((id *)&self->_appleIDAgent, 0);
}

@end