@interface RPCompanionLinkXPCConnection
- (BOOL)_checkRSSIThresholdForDevice:(id)a3;
- (BOOL)_connectionHasActiveSessions:(id)a3;
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)clientNeedsWiFiAssertion;
- (BOOL)entitled;
- (BOOL)isContextCollector;
- (BOOL)localDeviceUpdated;
- (BOOL)needsCLink;
- (BOOL)needsNearbyActionV2;
- (BOOL)reportFoundDevice:(id)a3 outReason:(id *)a4;
- (CUBonjourDevice)bonjourDevice;
- (NSMutableDictionary)devices;
- (NSMutableDictionary)registeredEvents;
- (NSMutableDictionary)registeredRequests;
- (NSMutableSet)registeredProfileIDs;
- (NSString)appID;
- (NSString)personaUUID;
- (NSUUID)launchInstanceID;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_source)discoveryTimer;
- (OS_os_transaction)osTransaction;
- (RBSProcessIdentifier)rbsPID;
- (RPCompanionLinkClient)client;
- (RPCompanionLinkDaemon)daemon;
- (RPCompanionLinkDevice)daemonDevice;
- (RPCompanionLinkXPCConnection)initWithDaemon:(id)a3 xpcCnx:(id)a4;
- (RPConnection)netCnx;
- (RPDiscovery)discoveryClient;
- (RPServer)server;
- (RPSession)session;
- (id)_devicesForClient:(id)a3;
- (id)_findMatchingDevice:(id)a3 inDeviceDictionary:(id)a4;
- (id)_updateOptionsWithProcessInfo:(id)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (unint64_t)startTicks;
- (unsigned)xpcID;
- (void)_invalidateConnectionInList:(id)a3 listDescription:(id)a4;
- (void)authCompletion:(id)a3;
- (void)companionLinkActivateAssertion:(id)a3 completion:(id)a4;
- (void)companionLinkActivateClient:(id)a3 completion:(id)a4;
- (void)companionLinkCreateDeviceToEndpointMappingForDeviceID:(id)a3 completion:(id)a4;
- (void)companionLinkDeregisterEventID:(id)a3 completion:(id)a4;
- (void)companionLinkDeregisterProfileID:(id)a3 completion:(id)a4;
- (void)companionLinkDeregisterRequestID:(id)a3 completion:(id)a4;
- (void)companionLinkRegisterEventID:(id)a3 options:(id)a4 completion:(id)a5;
- (void)companionLinkRegisterProfileID:(id)a3 completion:(id)a4;
- (void)companionLinkRegisterRequestID:(id)a3 options:(id)a4 completion:(id)a5;
- (void)companionLinkRemoveLocalDeviceAsContextCollector:(id)a3;
- (void)companionLinkSendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 nwActivityToken:(id)a7 completion:(id)a8;
- (void)companionLinkSendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 nwActivityToken:(id)a7 responseHandler:(id)a8;
- (void)companionLinkSetLocalDeviceAsContextCollector:(id)a3;
- (void)companionLinkTriggerEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4 completion:(id)a5;
- (void)companionLinkTryPassword:(id)a3;
- (void)companionLinkUpdateClient:(id)a3;
- (void)connectionInvalidated;
- (void)connectionInvalidatedCore;
- (void)handleDisconnect;
- (void)promptForPasswordType:(int)a3 flags:(unsigned int)a4 throttleSeconds:(int)a5;
- (void)receivedEventID:(id)a3 event:(id)a4 options:(id)a5;
- (void)receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)reportChangedDevice:(id)a3 changes:(unsigned int)a4;
- (void)reportLostDevice:(id)a3;
- (void)setAppID:(id)a3;
- (void)setBonjourDevice:(id)a3;
- (void)setClient:(id)a3;
- (void)setClientNeedsWiFiAssertion:(BOOL)a3;
- (void)setDiscoveryClient:(id)a3;
- (void)setDiscoveryTimer:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setIsContextCollector:(BOOL)a3;
- (void)setLaunchInstanceID:(id)a3;
- (void)setLocalDeviceUpdated:(BOOL)a3;
- (void)setNeedsCLink:(BOOL)a3;
- (void)setNeedsNearbyActionV2:(BOOL)a3;
- (void)setNetCnx:(id)a3;
- (void)setOsTransaction:(id)a3;
- (void)setPersonaUUID:(id)a3;
- (void)setRbsPID:(id)a3;
- (void)setServer:(id)a3;
- (void)setSession:(id)a3;
- (void)setStartTicks:(unint64_t)a3;
- (void)setXpcID:(unsigned int)a3;
- (void)updateErrorFlags:(unint64_t)a3;
- (void)xpcDiscoveryActivate:(id)a3 completion:(id)a4;
- (void)xpcDiscoveryUpdate:(id)a3;
- (void)xpcServerActivate:(id)a3 completion:(id)a4;
- (void)xpcServerUpdate:(id)a3;
- (void)xpcSessionActivate:(id)a3 completion:(id)a4;
@end

@implementation RPCompanionLinkXPCConnection

- (RPCompanionLinkXPCConnection)initWithDaemon:(id)a3 xpcCnx:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RPCompanionLinkXPCConnection;
  v9 = [(RPCompanionLinkXPCConnection *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daemon, a3);
    v10->_startTicks = mach_absolute_time();
    objc_storeStrong((id *)&v10->_xpcCnx, a4);
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  return [(RPCompanionLinkXPCConnection *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v38 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
  NSAppendPrintF();
  id v5 = 0;
  v6 = self->_client;
  id v7 = (RPServer *)[(RPCompanionLinkClient *)v6 clientID];
  if (v7)
  {
    v39 = v7;
    NSAppendPrintF();
    id v8 = v5;

    id v5 = v8;
  }
  server = self->_server;
  if (server)
  {
    v39 = server;
    NSAppendPrintF();
    id v10 = v5;

    id v5 = v10;
  }
  id v11 = [(NSMutableDictionary *)self->_registeredEvents count];
  if (v11)
  {
    id v40 = v11;
    NSAppendPrintF();
    id v12 = v5;

    id v5 = v12;
  }
  id v13 = [(NSMutableDictionary *)self->_registeredRequests count];
  if (v13)
  {
    id v41 = v13;
    NSAppendPrintF();
    id v14 = v5;

    id v5 = v14;
  }
  id v15 = [(NSMutableSet *)self->_registeredProfileIDs count];
  if (v15)
  {
    id v42 = v15;
    NSAppendPrintF();
    id v16 = v5;

    id v5 = v16;
  }
  id v17 = [(RPCompanionLinkClient *)v6 controlFlags];
  if (v17)
  {
    id v43 = v17;
    v45 = &unk_100119B1E;
    NSAppendPrintF();
    id v18 = v5;

    id v5 = v18;
  }
  if ([(RPCompanionLinkClient *)v6 flags])
  {
    NSAppendPrintF();
    id v19 = v5;

    id v5 = v19;
  }
  if (self->_needsCLink)
  {
    NSAppendPrintF();
    id v20 = v5;

    id v5 = v20;
  }
  if (self->_needsNearbyActionV2)
  {
    NSAppendPrintF();
    id v21 = v5;

    id v5 = v21;
  }
  uint64_t v22 = [(RPConnection *)self->_netCnx label];
  v23 = (void *)v22;
  if (v22)
  {
    uint64_t v44 = v22;
    NSAppendPrintF();
    id v24 = v5;

    id v5 = v24;
  }

  if (([(RPCompanionLinkClient *)v6 flags] & 0x2000) != 0)
  {
    NSAppendPrintF();
    id v25 = v5;

    id v5 = v25;
  }
  if (([(RPCompanionLinkClient *)v6 flags] & 0x4000) != 0)
  {
    NSAppendPrintF();
    id v26 = v5;

    id v5 = v26;
  }
  v27 = [(RPCompanionLinkClient *)v6 destinationDevice];
  v28 = v27;
  if (v27)
  {
    uint64_t v29 = [v27 idsDeviceIdentifier];
    v30 = (void *)v29;
    if (v29)
    {
      int v31 = 0;
      v32 = (void *)v29;
    }
    else
    {
      uint64_t v33 = [v28 identifier];
      v3 = (void *)v33;
      if (v33)
      {
        int v31 = 0;
        v32 = (void *)v33;
      }
      else
      {
        v32 = [v28 publicIdentifier];
        int v31 = 1;
      }
    }
    NSAppendPrintF();
    id v34 = v5;

    if (v31) {
    if (!v30)
    }

    id v5 = v34;
  }

  mach_absolute_time();
  UpTicksToSeconds();
  NSAppendPrintF();
  id v35 = v5;

  NSAppendPrintF();
  id v36 = v35;

  return v36;
}

- (void)connectionInvalidated
{
  v3 = self->_session;
  if (v3)
  {
    v4 = v3;
    daemon = self->_daemon;
    v6 = [(RPSession *)v3 cnx];
    uint64_t xpcID = self->_xpcID;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10003C19C;
    v8[3] = &unk_1001222C0;
    v8[4] = v4;
    v8[5] = self;
    [(RPCompanionLinkDaemon *)daemon sessionStopSend:v6 session:v4 xpcID:xpcID completion:v8];
  }
  else
  {
    [(RPCompanionLinkXPCConnection *)self connectionInvalidatedCore];
  }
}

- (BOOL)_connectionHasActiveSessions:(id)a3
{
  v4 = (RPConnection *)a3;
  uint64_t v5 = [(RPCompanionLinkDaemon *)self->_daemon _sessionsActiveOnConnection:v4 xpcConnection:self];
  if (v5 >= 1)
  {
    v6 = [(RPConnection *)v4 client];
    client = self->_client;

    if (v6 == client)
    {
      if (dword_100140E48 <= 40 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        v9 = [(RPConnection *)v4 label];
        uint64_t v10 = v5;
        LogPrintF();
      }
      -[RPConnection setClient:](v4, "setClient:", 0, v9, v10);
      if (self->_netCnx == v4)
      {
        self->_netCnx = 0;
      }
    }
  }

  return v5 > 0;
}

- (void)_invalidateConnectionInList:(id)a3 listDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RPCompanionLinkDaemon *)self->_daemon dispatchQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_10000F400;
  id v17 = sub_10000F410;
  id v18 = +[NSMutableArray array];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003C50C;
  v12[3] = &unk_1001222E8;
  v12[4] = self;
  v12[5] = &v13;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];
  if ([(id)v14[5] count])
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v11 = v14[5];
      LogPrintF();
      [v6 removeObjectsForKeys:v14[5], v7, v11];
    }
    else
    {
      [v6 removeObjectsForKeys:v14[5], v9, v10];
    }
  }
  _Block_object_dispose(&v13, 8);
}

- (void)connectionInvalidatedCore
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100140E48 <= 20 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v29 = (RPDiscovery *)[(NSXPCConnection *)self->_xpcCnx processIdentifier];
    LogPrintF();
  }
  if (self->_client)
  {
    [(RPCompanionLinkXPCConnection *)self _invalidateConnectionInList:self->_daemon->_tcpClientConnections listDescription:@"tcp client connections"];
    [(RPCompanionLinkXPCConnection *)self _invalidateConnectionInList:self->_daemon->_tcpOnDemandClientConnections listDescription:@"tcp on-demand client connections"];
    [(RPCompanionLinkXPCConnection *)self _invalidateConnectionInList:self->_daemon->_bleClientConnections listDescription:@"ble client connections"];
    netCnx = self->_netCnx;
    self->_netCnx = 0;

    [(RPCompanionLinkClient *)self->_client invalidate];
    client = self->_client;
    self->_client = 0;
  }
  discoveryClient = self->_discoveryClient;
  if (discoveryClient)
  {
    if (dword_100140E48 <= 30)
    {
      if (dword_100140E48 != -1 || (int v7 = _LogCategory_Initialize(), discoveryClient = self->_discoveryClient, v7))
      {
        uint64_t v6 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
        uint64_t v29 = discoveryClient;
        uint64_t v31 = v6;
        LogPrintF();
        discoveryClient = self->_discoveryClient;
      }
    }
    [(RPDiscovery *)discoveryClient invalidate];
    id v8 = self->_discoveryClient;
    self->_discoveryClient = 0;
  }
  server = self->_server;
  if (server)
  {
    uint64_t v10 = server;
    [(RPServer *)v10 invalidate];
    uint64_t v11 = [(RPCompanionLinkDaemon *)self->_daemon activeServers];
    [v11 removeObject:v10];

    id v12 = [(RPCompanionLinkDaemon *)self->_daemon localDeviceInfo];
    [v12 setServersChangedState:6];

    uint64_t v13 = self->_server;
    self->_server = 0;

    [(RPCompanionLinkDaemon *)self->_daemon _updateForXPCServerChange];
  }
  session = self->_session;
  if (session)
  {
    uint64_t v15 = session;
    [(RPSession *)v15 invalidate];
    id v16 = self->_session;
    self->_session = 0;
  }
  discoveryTimer = self->_discoveryTimer;
  if (discoveryTimer)
  {
    id v18 = discoveryTimer;
    dispatch_source_cancel(v18);
    id v19 = self->_discoveryTimer;
    self->_discoveryTimer = 0;
  }
  *(_WORD *)&self->_needsCLink = 0;
  if ([(RPConnection *)self->_netCnx clientMode]) {
    [(RPConnection *)self->_netCnx invalidate];
  }
  id v20 = self->_netCnx;
  self->_netCnx = 0;

  registeredEvents = self->_registeredEvents;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10003C9F0;
  v36[3] = &unk_100122310;
  v36[4] = self;
  [(NSMutableDictionary *)registeredEvents enumerateKeysAndObjectsUsingBlock:v36];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v22 = self->_registeredProfileIDs;
  id v23 = [(NSMutableSet *)v22 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v33;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v30 = v27;
          LogPrintF();
        }
        -[NSMutableSet removeObject:](self->_daemon->_registeredProfileIDs, "removeObject:", v27, v30);
      }
      id v24 = [(NSMutableSet *)v22 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v24);
  }

  [(NSMutableDictionary *)self->_devices removeAllObjects];
  [(NSMutableSet *)self->_registeredProfileIDs removeAllObjects];
  osTransaction = self->_osTransaction;
  self->_osTransaction = 0;

  if (self->_isContextCollector) {
    [(RPCompanionLinkXPCConnection *)self companionLinkRemoveLocalDeviceAsContextCollector:&stru_100122330];
  }
}

- (BOOL)_entitledAndReturnError:(id *)a3
{
  if (self->_entitled) {
    return 1;
  }
  uint64_t v6 = [(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:@"com.apple.CompanionLink"];
  unsigned int v7 = [v6 isEqual:&__kCFBooleanTrue];

  if (v7)
  {
    BOOL result = 1;
    self->_entitled = 1;
  }
  else
  {
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    if (a3)
    {
      RPErrorF();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      BOOL result = 0;
      *a3 = v8;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)_updateOptionsWithProcessInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_netCnx;
  uint64_t v6 = v5;
  if (v5
    && ([(RPConnection *)v5 controlFlags] & 0x200) != 0
    && ([(RPConnection *)v6 containsInUseProcess:[(NSXPCConnection *)self->_xpcCnx processIdentifier]] & 1) == 0)
  {
    [(RPConnection *)v6 addInUseProcess:[(NSXPCConnection *)self->_xpcCnx processIdentifier]];
    id v7 = [v4 mutableCopy];
    if (!v7) {
      id v7 = objc_alloc_init((Class)NSMutableDictionary);
    }
    id v8 = sub_10000E944([(NSXPCConnection *)self->_xpcCnx processIdentifier]);
    [v7 setObject:v8 forKeyedSubscript:@"inUseProcess"];

    id v4 = v7;
  }

  return v4;
}

- (void)authCompletion:(id)a3
{
  id v6 = a3;
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    id v5 = v6;
    LogPrintF();
  }
  id v4 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
  [v4 companionLinkAuthCompleted:v6];
}

- (void)handleDisconnect
{
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
  [v3 companionLinkHandleDisconnect];
}

- (id)_devicesForClient:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [v4 destinationDevice];

  if (v6)
  {
    id v7 = v5;
  }
  else
  {
    activeDevices = self->_daemon->_activeDevices;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10003D1C0;
    v38[3] = &unk_100122358;
    id v9 = v4;
    id v39 = v9;
    id v40 = self;
    id v41 = v5;
    [(NSMutableDictionary *)activeDevices enumerateKeysAndObjectsUsingBlock:v38];
    if ([v9 flags])
    {
      unauthDevices = self->_daemon->_unauthDevices;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10003D248;
      v34[3] = &unk_100122358;
      id v35 = v9;
      id v36 = self;
      id v37 = v5;
      [(NSMutableDictionary *)unauthDevices enumerateKeysAndObjectsUsingBlock:v34];
    }
    if (((unint64_t)[v9 controlFlags] & 0x2104000002) != 0)
    {
      bleDevices = self->_daemon->_bleDevices;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10003D2D0;
      v30[3] = &unk_100122358;
      id v12 = v9;
      id v31 = v12;
      long long v32 = self;
      id v33 = v5;
      [(NSMutableDictionary *)bleDevices enumerateKeysAndObjectsUsingBlock:v30];
      nearbyInfoV2Devices = self->_daemon->_nearbyInfoV2Devices;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10003D358;
      v26[3] = &unk_100122358;
      id v27 = v12;
      v28 = self;
      id v29 = v5;
      [(NSMutableDictionary *)nearbyInfoV2Devices enumerateKeysAndObjectsUsingBlock:v26];
    }
    if (((unint64_t)[v9 controlFlags] & 0x400000000) != 0
      && ([v9 flags] & 0x2000) != 0)
    {
      homeHubDevices = self->_daemon->_homeHubDevices;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10003D3E0;
      v22[3] = &unk_100122358;
      id v23 = v9;
      id v24 = self;
      id v25 = v5;
      [(NSMutableDictionary *)homeHubDevices enumerateKeysAndObjectsUsingBlock:v22];
    }
    if (((unint64_t)[v9 controlFlags] & 0x1000000000000) != 0)
    {
      authenticatedAWDLPairingModeDevices = self->_daemon->_authenticatedAWDLPairingModeDevices;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10003D468;
      v18[3] = &unk_100122358;
      id v19 = v9;
      id v20 = self;
      id v21 = v5;
      [(NSMutableDictionary *)authenticatedAWDLPairingModeDevices enumerateKeysAndObjectsUsingBlock:v18];
    }
    id v16 = v5;
  }

  return v5;
}

- (NSUUID)launchInstanceID
{
  return self->_launchInstanceID;
}

- (void)promptForPasswordType:(int)a3 flags:(unsigned int)a4 throttleSeconds:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    if (v7 > 0xB) {
      id v9 = "?";
    }
    else {
      id v9 = off_1001225D8[(int)v7];
    }
    id v12 = &unk_100119DA3;
    uint64_t v13 = v5;
    uint64_t v10 = v9;
    uint64_t v11 = v6;
    LogPrintF();
  }
  id v14 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
  [v14 companionLinkPromptForPasswordType:v7 flags:v6 throttleSeconds:v5];
}

- (void)receivedEventID:(id)a3 event:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = +[RPMetrics sharedMetrics];
  [v11 logReceivedMessageType:1 identifier:v10 options:v8 appID:self->_appID ctx:&self->_metricsCtx];

  id v12 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
  [v12 companionLinkReceivedEventID:v10 event:v9 options:v8];
}

- (void)receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[RPMetrics sharedMetrics];
  [v14 logReceivedMessageType:2 identifier:v13 options:v11 appID:self->_appID ctx:&self->_metricsCtx];

  id v15 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
  [v15 companionLinkReceivedRequestID:v13 request:v12 options:v11 responseHandler:v10];
}

- (BOOL)_checkRSSIThresholdForDevice:(id)a3
{
  id v4 = a3;
  if ([(RPCompanionLinkClient *)self->_client rssiThreshold]) {
    uint64_t v5 = (uint64_t)[(RPCompanionLinkClient *)self->_client rssiThreshold];
  }
  else {
    uint64_t v5 = -60;
  }
  uint64_t v6 = [v4 bleDevice];
  uint64_t v7 = [v6 bleDevice];
  id v8 = [v7 rssi];

  if (v8) {
    BOOL v9 = (uint64_t)v8 < v5;
  }
  else {
    BOOL v9 = 0;
  }
  BOOL v10 = !v9;

  return v10;
}

- (BOOL)reportFoundDevice:(id)a3 outReason:(id *)a4
{
  id v6 = a3;
  client = self->_client;
  id v8 = [(RPCompanionLinkXPCConnection *)self launchInstanceID];
  LOBYTE(client) = [(RPCompanionLinkClient *)client shouldReportDevice:v6 toXPCConnectionWithLaunchInstanceID:v8 outReason:a4];

  if ((client & 1) == 0)
  {
    BOOL v17 = 0;
    if (!a4 || self->_client) {
      goto LABEL_22;
    }
    BOOL v17 = 0;
    id v18 = @"nilClientCnx";
    goto LABEL_16;
  }
  if (![(RPCompanionLinkXPCConnection *)self _checkRSSIThresholdForDevice:v6])
  {
    if (!a4) {
      goto LABEL_21;
    }
    BOOL v17 = 0;
    id v18 = @"RSSI.tooLow";
LABEL_16:
    *a4 = v18;
    goto LABEL_22;
  }
  BOOL v9 = [v6 identifier];
  if (!v9)
  {
    BOOL v9 = [v6 publicIdentifier];
    if (!v9)
    {
      if (a4)
      {
        BOOL v17 = 0;
        id v18 = @"missingDeviceIdentifier";
        goto LABEL_16;
      }
LABEL_21:
      BOOL v17 = 0;
      goto LABEL_22;
    }
  }
  BOOL v10 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v9];

  devices = self->_devices;
  if (!devices)
  {
    id v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v13 = self->_devices;
    self->_devices = v12;

    devices = self->_devices;
  }
  [(NSMutableDictionary *)devices setObject:v6 forKeyedSubscript:v9];
  unsigned int v14 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
  if (v14 == getpid()) {
    [v6 setEncodeSensitiveProperties:-[RPCompanionLinkClient encodeSensitiveProperties](self->_client, "encodeSensitiveProperties")];
  }
  id v15 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
  id v16 = v15;
  if (v10) {
    [v15 companionLinkChangedDevice:v6 changes:2];
  }
  else {
    [v15 companionLinkFoundDevice:v6];
  }

  BOOL v17 = 1;
LABEL_22:

  return v17;
}

- (void)reportLostDevice:(id)a3
{
  id v10 = a3;
  id v4 = [v10 identifier];
  if (v4 || ([v10 publicIdentifier], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v4];

    if (v5)
    {
      client = self->_client;
      uint64_t v7 = [(RPCompanionLinkXPCConnection *)self launchInstanceID];
      LODWORD(client) = [(RPCompanionLinkClient *)client shouldReportDevice:v10 toXPCConnectionWithLaunchInstanceID:v7 outReason:0];

      devices = self->_devices;
      if (client)
      {
        [(NSMutableDictionary *)devices setObject:v10 forKeyedSubscript:v4];
        BOOL v9 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
        [v9 companionLinkChangedDevice:v10 changes:2];
      }
      else
      {
        [(NSMutableDictionary *)devices setObject:0 forKeyedSubscript:v4];
        BOOL v9 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
        [v9 companionLinkLostDevice:v10];
      }
    }
  }
}

- (void)reportChangedDevice:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v15 = a3;
  id v6 = [v15 identifier];
  if (v6 || ([v15 publicIdentifier], (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v6];
    client = self->_client;
    BOOL v9 = [(RPCompanionLinkXPCConnection *)self launchInstanceID];
    LODWORD(client) = [(RPCompanionLinkClient *)client shouldReportDevice:v15 toXPCConnectionWithLaunchInstanceID:v9 outReason:0];

    if (client)
    {
      unsigned int v10 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      if (v10 == getpid()) {
        [v15 setEncodeSensitiveProperties:-[RPCompanionLinkClient encodeSensitiveProperties](self->_client, "encodeSensitiveProperties")];
      }
      if (v7)
      {
        if (v4 != 32)
        {
          [(NSMutableDictionary *)self->_devices setObject:v15 forKeyedSubscript:v6];
          id v11 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
          [v11 companionLinkChangedDevice:v15 changes:v4];
LABEL_15:
        }
      }
      else if ([(RPCompanionLinkXPCConnection *)self _checkRSSIThresholdForDevice:v15])
      {
        devices = self->_devices;
        if (!devices)
        {
          id v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          unsigned int v14 = self->_devices;
          self->_devices = v13;

          devices = self->_devices;
        }
        [(NSMutableDictionary *)devices setObject:v15 forKeyedSubscript:v6];
        id v11 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
        [v11 companionLinkFoundDevice:v15];
        goto LABEL_15;
      }
    }
    else if (v7)
    {
      [(NSMutableDictionary *)self->_devices setObject:0 forKeyedSubscript:v6];
      id v11 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
      [v11 companionLinkLostDevice:v15];
      goto LABEL_15;
    }
  }
}

- (void)updateErrorFlags:(unint64_t)a3
{
  uint64_t v5 = self->_client;
  if (v5)
  {
    unsigned int v14 = v5;
    id v6 = +[RPDaemon sharedDaemon];
    unint64_t v7 = (unint64_t)[v6 errorFlags] | a3;

    id v8 = [(RPCompanionLinkClient *)v14 errorFlags];
    uint64_t v5 = v14;
    if (v8 != (id)v7)
    {
      if (dword_100140E48 <= 20)
      {
        if (dword_100140E48 != -1 || (v9 = _LogCategory_Initialize(), uint64_t v5 = v14, v9))
        {
          id v12 = &unk_100119F17;
          appID = self->_appID;
          unint64_t v11 = v7;
          LogPrintF();
          uint64_t v5 = v14;
        }
      }
      -[RPCompanionLinkClient setErrorFlags:](v5, "setErrorFlags:", v7, v11, v12, appID);
      unsigned int v10 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
      [v10 companionLinkUpdateErrorFlags:a3];

      uint64_t v5 = v14;
    }
  }
}

- (void)companionLinkActivateAssertion:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)companionLinkActivateClient:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v130 = 0;
  v131 = &v130;
  uint64_t v132 = 0x3032000000;
  v133 = sub_10000F400;
  v134 = sub_10000F410;
  id v135 = 0;
  v125[0] = _NSConcreteStackBlock;
  v125[1] = 3221225472;
  v125[2] = sub_10003EDF0;
  v125[3] = &unk_100122380;
  v129 = &v130;
  id v100 = v7;
  id v126 = v100;
  v127 = self;
  id v97 = v8;
  id v128 = v97;
  v96 = objc_retainBlock(v125);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v9 = (id *)(v131 + 5);
  id obj = (id)v131[5];
  [(RPCompanionLinkXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v9, obj);
  if (!v131[5])
  {
    if (self->_client)
    {
      uint64_t v83 = RPErrorF();
      v84 = (void *)v131[5];
      v131[5] = v83;

      goto LABEL_101;
    }
    if (!self->_appID)
    {
      unsigned int v10 = [(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:@"application-identifier"];
      appID = self->_appID;
      self->_appID = v10;
    }
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v89 = v100;
      uint64_t v92 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    [v100 setDispatchQueue:self->_dispatchQueue, v89, v92];
    objc_storeStrong((id *)&self->_client, a3);
    unint64_t v98 = (unint64_t)[v100 controlFlags];
    if (sub_10000DD3C())
    {
      unint64_t v98 = v98 & 0xFFFFFDFFFF9DFEFFLL | 0x20000400000;
      if (dword_100140E48 < 31 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        unint64_t v93 = v98;
        v95 = &unk_100119B1E;
        id v90 = [v100 clientID];
        LogPrintF();
      }
    }
    id location = 0;
    id v12 = [v100 destinationDevice:v90, v93, v95];
    id v99 = v12;
    if (!v12) {
      goto LABEL_48;
    }
    id v13 = [v12 identifier];
    if (v13)
    {
      v101 = v13;
    }
    else
    {
      v101 = [v99 publicIdentifier];

      if (!v101)
      {
        uint64_t v86 = RPErrorF();
        v51 = (void *)v131[5];
        v131[5] = v86;
        goto LABEL_100;
      }
    }
    if (([v99 statusFlags] & 0x10000000) != 0)
    {
      [v100 setControlFlags:((unint64_t)[v100 controlFlags] | 0x400000000)];
      [v100 setFlags:[v100 flags] | 0x2000];
      unint64_t v98 = (unint64_t)[v100 controlFlags];
    }
    unsigned int v14 = [(RPCompanionLinkDaemon *)self->_daemon findConnectedDeviceForIdentifier:v101 controlFlags:v98 cnx:&location];
    if (v14) {
      goto LABEL_30;
    }
    id v15 = [v99 idsDeviceIdentifier];
    BOOL v16 = v15 == 0;

    if (v16)
    {
      uint64_t v19 = 0;
    }
    else
    {
      daemon = self->_daemon;
      id v18 = [v99 idsDeviceIdentifier];
      uint64_t v19 = [(RPCompanionLinkDaemon *)daemon findConnectedDeviceForIdentifier:v18 controlFlags:v98 cnx:&location];
    }
    if ((v98 & 0x400000000) == 0 || v19)
    {
      unsigned int v14 = (void *)v19;
      if (v19)
      {
LABEL_30:
        id v26 = v14;
        id v27 = [v14 idsDeviceIdentifier:v91];
        BOOL v28 = v27 == 0;

        if (v28)
        {
          id v29 = +[RPCloudDaemon sharedCloudDaemon];
          uint64_t v30 = [v29 idsDeviceArray];

          long long v115 = 0u;
          long long v116 = 0u;
          long long v113 = 0u;
          long long v114 = 0u;
          id v31 = v30;
          id v32 = [v31 countByEnumeratingWithState:&v113 objects:v137 count:16];
          if (v32)
          {
            uint64_t v33 = *(void *)v114;
            do
            {
              for (i = 0; i != v32; i = (char *)i + 1)
              {
                if (*(void *)v114 != v33) {
                  objc_enumerationMutation(v31);
                }
                id v35 = *(void **)(*((void *)&v113 + 1) + 8 * i);
                id v36 = [v35 nsuuid:v91, v94];
                id v37 = [v36 UUIDString];
                unsigned int v38 = [v37 isEqualToString:v101];

                if (v38)
                {
                  id v39 = [v35 uniqueIDOverride];
                  [v26 setIdsDeviceIdentifier:v39];

                  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
                  {
                    uint64_t v91 = [v26 idsDeviceIdentifier];
                    v94 = v101;
                    LogPrintF();
                  }
                }
              }
              id v32 = [v31 countByEnumeratingWithState:&v113 objects:v137 count:16];
            }
            while (v32);
          }
        }
        objc_storeStrong((id *)&self->_daemonDevice, v26);
        if (!self->_netCnx && ([location controlFlags] & 0x200) != 0) {
          objc_storeStrong((id *)&self->_netCnx, location);
        }

LABEL_48:
        if ((v98 & 0x800000000) != 0) {
          [(RPCompanionLinkDaemon *)self->_daemon _clientOnDemandAWDLDiscoveryStartForXPC:self];
        }
        if (!self->_osTransaction)
        {
          v112 = 0;
          id v40 = [v99 identifier];
          id v41 = v40;
          if (v40)
          {
            id v42 = v40;
          }
          else
          {
            uint64_t v43 = [v99 publicIdentifier];
            uint64_t v44 = (void *)v43;
            v45 = @"Discovery";
            if (v43) {
              v45 = (__CFString *)v43;
            }
            id v42 = v45;
          }
          uint64_t v91 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
          v94 = v42;
          ASPrintF();
          v46 = (OS_os_transaction *)os_transaction_create();
          osTransaction = self->_osTransaction;
          self->_osTransaction = v46;

          if (!self->_osTransaction
            && dword_100140E48 <= 90
            && (dword_100140E48 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v91 = (uint64_t)v112;
            LogPrintF();
          }
          if (v112) {
            free(v112);
          }
        }
        if (!location) {
          objc_storeStrong(&location, self->_netCnx);
        }
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v91 = [(RPConnection *)self->_netCnx label];
          LogPrintF();
        }
        v51 = [v100 serviceType:v91];
        if (v51 && location)
        {
          id v52 = objc_alloc_init((Class)RPSession);
          [v52 setCnx:location];
          [v52 setServiceType:v51];
          [v52 setStartTicks:mach_absolute_time()];
          objc_storeStrong((id *)&self->_session, v52);
          v53 = [v99 identifier];
          v54 = v53;
          if (v53)
          {
            id v55 = v53;
          }
          else
          {
            v61 = [v99 publicIdentifier];
            v62 = v61;
            if (v61)
            {
              id v63 = v61;
            }
            else
            {
              id v63 = [v99 idsDeviceIdentifier];
            }
            id v55 = v63;
          }
          v64 = self->_daemon;
          id v65 = location;
          uint64_t xpcID = self->_xpcID;
          v108[0] = _NSConcreteStackBlock;
          v108[1] = 3221225472;
          v108[2] = sub_10003EED8;
          v108[3] = &unk_1001223A8;
          v108[4] = self;
          id v109 = v100;
          v110 = v51;
          id v111 = v97;
          [(RPCompanionLinkDaemon *)v64 sessionStartSend:v65 session:v52 xpcID:xpcID destinationID:v55 completion:v108];
        }
        else
        {
          v56 = [(RPCompanionLinkXPCConnection *)self _devicesForClient:v100];
          if (v97) {
            (*((void (**)(id, void *, uint64_t))v97 + 2))(v97, v56, v131[5]);
          }
          long long v106 = 0u;
          long long v107 = 0u;
          long long v104 = 0u;
          long long v105 = 0u;
          id v52 = v56;
          id v57 = [v52 countByEnumeratingWithState:&v104 objects:v136 count:16];
          if (v57)
          {
            uint64_t v58 = *(void *)v105;
            do
            {
              for (j = 0; j != v57; j = (char *)j + 1)
              {
                if (*(void *)v105 != v58) {
                  objc_enumerationMutation(v52);
                }
                uint64_t v60 = *(void *)(*((void *)&v104 + 1) + 8 * (void)j);
                v103 = @"success";
                [(RPCompanionLinkXPCConnection *)self reportFoundDevice:v60 outReason:&v103];
              }
              id v57 = [v52 countByEnumeratingWithState:&v104 objects:v136 count:16];
            }
            while (v57);
          }

          id v55 = +[RPDaemon sharedDaemon];
          -[RPCompanionLinkXPCConnection updateErrorFlags:](self, "updateErrorFlags:", [v55 errorFlags]);
        }

        v67 = [(RPCompanionLinkXPCConnection *)self xpcCnx];
        id v68 = [v67 processIdentifier];

        v69 = +[RBSProcessIdentifier identifierWithPid:v68];
        id v102 = 0;
        v70 = +[RBSProcessHandle handleForIdentifier:v69 error:&v102];
        id v71 = v102;
        if (!v71 && v69 && [v70 isApplication])
        {
          objc_storeStrong((id *)&self->_rbsPID, v69);
          [(RPCompanionLinkDaemon *)self->_daemon _addApplicationPID:self->_rbsPID];
        }
        [(RPCompanionLinkDaemon *)self->_daemon _updateForXPCClientChange];

        goto LABEL_100;
      }
      id v20 = [v99 ipAddress];
      BOOL v21 = v20 == 0;

      if (!v21)
      {
        id v22 = v99;
        id v23 = self->_daemon;
        id v24 = (id *)(v131 + 5);
        id v122 = (id)v131[5];
        id v25 = v22;
        -[RPCompanionLinkDaemon _clientConnectionStartOnDemand:xpcCnx:error:](v23, "_clientConnectionStartOnDemand:xpcCnx:error:");
        objc_storeStrong(v24, v122);
        goto LABEL_29;
      }
      unint64_t v48 = v98;
      if ((v98 & 0x10000000) == 0)
      {
        id v25 = [(RPCompanionLinkXPCConnection *)self _findMatchingDevice:v99 inDeviceDictionary:self->_daemon->_bleDevices];
        if (v25
          || ([(RPCompanionLinkXPCConnection *)self _findMatchingDevice:v99 inDeviceDictionary:self->_daemon->_nearbyInfoV2Devices], (id v25 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          if (![v100 reactivateCalled]
            || ((unint64_t)[v100 controlFlags] & 0x20100) != 0)
          {
            objc_storeStrong((id *)&self->_daemonDevice, v25);
            v49 = self->_daemon;
            v50 = (id *)(v131 + 5);
            id v121 = (id)v131[5];
            [(RPCompanionLinkDaemon *)v49 _clientConnectionStartOnDemand:v25 xpcCnx:self error:&v121];
            objc_storeStrong(v50, v121);
            goto LABEL_29;
          }
          if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          uint64_t v82 = RPErrorF();
          goto LABEL_127;
        }
        v72 = [(RPCompanionLinkDaemon *)self->_daemon findUnauthDeviceForIdentifier:v101];
        id v25 = v72;
        unint64_t v48 = v98;
        if (v72)
        {
          objc_storeStrong((id *)&self->_daemonDevice, v72);
          v73 = self->_daemon;
          v74 = (id *)(v131 + 5);
          id v120 = (id)v131[5];
          [(RPCompanionLinkDaemon *)v73 _clientConnectionStartUnauth:v25 client:v100 publicID:v101 xpcCnx:self error:&v120];
          objc_storeStrong(v74, v120);
          goto LABEL_29;
        }
      }
      if ((v48 & 0x1000010000000) == 0x1000000000000)
      {
        v75 = [(RPCompanionLinkDaemon *)self->_daemon findAuthAWDLPairingModeDeviceForIdentifier:v101];
        id v25 = v75;
        if (v75)
        {
          [v75 setIdentifier:v101];
          objc_storeStrong((id *)&self->_daemonDevice, v25);
          v76 = self->_daemon;
          v77 = (id *)(v131 + 5);
          id v119 = (id)v131[5];
          [(RPCompanionLinkDaemon *)v76 _clientConnectionStartOnDemand:v25 xpcCnx:self error:&v119];
          objc_storeStrong(v77, v119);
          goto LABEL_29;
        }
      }
      if ((v98 & 0x10800000) != 0)
      {
        v78 = [v100 cloudServiceID];
        if (v78) {
          goto LABEL_115;
        }
        if (([(NSString *)self->_appID isEqual:@"com.apple.coreduetd"] & 1) != 0
          || [(NSString *)self->_appID isEqual:@"com.apple.knowledge-agent"])
        {
          v78 = @"com.apple.private.alloy.coreduet.sync";
          [v100 setCloudServiceID:v78];
LABEL_115:
          id v79 = v99;
          [v79 setStatusFlags:((unint64_t)[v79 statusFlags] | 0x100000)];
          objc_storeStrong((id *)&self->_daemonDevice, v99);
          [v100 setControlFlags:((unint64_t)[v100 controlFlags] | 0x10000000)];
          v80 = self->_daemon;
          v81 = (id *)(v131 + 5);
          id v118 = (id)v131[5];
          [(RPCompanionLinkDaemon *)v80 _clientConnectionStartOnDemand:v79 xpcCnx:self error:&v118];
          objc_storeStrong(v81, v118);
          LOBYTE(v81) = v131[5] == 0;

          unsigned int v14 = v79;
          if (v81) {
            goto LABEL_30;
          }
          goto LABEL_128;
        }
      }
      else if ((~v98 & 0x220000) == 0)
      {
        id v25 = [(RPCompanionLinkDaemon *)self->_daemon findConnectedDeviceForIdentifier:v101 controlFlags:v98 & 0xFFFFFFFFFFDFFFFFLL cnx:0];
        if (v25)
        {
          if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v91 = (uint64_t)v99;
            LogPrintF();
          }
          objc_storeStrong((id *)&self->_daemonDevice, v99);
          v87 = self->_daemon;
          v88 = (id *)(v131 + 5);
          id v117 = (id)v131[5];
          [(RPCompanionLinkDaemon *)v87 _clientConnectionStartOnDemand:v99 xpcCnx:self error:&v117];
          objc_storeStrong(v88, v117);
LABEL_29:
          unsigned int v14 = v25;
          if (!v131[5]) {
            goto LABEL_30;
          }
          goto LABEL_128;
        }
      }
    }
    uint64_t v82 = RPErrorF();
    id v25 = 0;
LABEL_127:
    v85 = (void *)v131[5];
    v131[5] = v82;

    unsigned int v14 = v25;
LABEL_128:

    v51 = v101;
LABEL_100:
  }
LABEL_101:
  ((void (*)(void *))v96[2])(v96);

  _Block_object_dispose(&v130, 8);
}

- (void)companionLinkUpdateClient:(id)a3
{
  id v32 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  unsigned int v4 = [(RPCompanionLinkXPCConnection *)self _entitledAndReturnError:0];
  uint64_t v5 = v32;
  if (v4)
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v27 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    id v6 = [(RPCompanionLinkClient *)self->_client controlFlags];
    id v7 = [v32 controlFlags];
    if (v7 != v6) {
      [(RPCompanionLinkClient *)self->_client setControlFlags:v7];
    }
    id v8 = [(RPCompanionLinkClient *)self->_client serviceType];
    int v9 = [v32 serviceType];
    id v10 = v8;
    id v11 = v9;
    id v12 = v11;
    if (v10 == v11)
    {
    }
    else
    {
      if ((v10 == 0) != (v11 != 0))
      {
        unsigned __int8 v13 = [v10 isEqual:v11];

        if (v13) {
          goto LABEL_15;
        }
      }
      else
      {
      }
      [(RPCompanionLinkClient *)self->_client setServiceType:v12];
    }
LABEL_15:
    unsigned int v14 = [(RPCompanionLinkDaemon *)self->_daemon localDeviceInfo];
    id v15 = [(RPCompanionLinkXPCConnection *)self launchInstanceID];

    if (v15)
    {
      daemon = self->_daemon;
      BOOL v17 = [(RPCompanionLinkXPCConnection *)self launchInstanceID];
      uint64_t v18 = [(RPCompanionLinkDaemon *)daemon homeHubDeviceForLaunchInstanceID:v17];

      unsigned int v14 = (void *)v18;
      if (!v18)
      {
        if (dword_100140E48 > 90 || dword_100140E48 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_42;
        }
        unsigned int v14 = [(RPCompanionLinkXPCConnection *)self launchInstanceID];
        LogPrintF();
LABEL_41:

LABEL_42:
        uint64_t v5 = v32;
        goto LABEL_43;
      }
    }
    id v30 = v6;
    id v31 = [v14 siriInfo];
    uint64_t v19 = [v32 siriInfo];
    id v20 = v19;
    if (v19)
    {
      id v21 = v19;
      id v22 = v31;
      id v23 = v22;
      if (v21 == v22)
      {
      }
      else
      {
        if (v22)
        {
          unsigned __int8 v24 = [v21 isEqual:v22];

          if (v24) {
            goto LABEL_38;
          }
        }
        else
        {
        }
        if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
        {
          id v28 = [v23 count];
          id v29 = [v21 count];
          LogPrintF();
        }
        [v14 setSiriInfo:v21, v28, v29];
        id v23 = +[NSMutableDictionary dictionary];
        [v23 setObject:v21 forKeyedSubscript:@"_siriInfo"];
        if (v15)
        {
          id v25 = [v14 identifier];
          [v23 setObject:v25 forKeyedSubscript:@"_i"];

          CFStringRef v26 = @"_proxyUpdate";
        }
        else
        {
          CFStringRef v26 = @"_systemInfoUpdate";
        }
        [(RPCompanionLinkDaemon *)self->_daemon sendEventID:v26 event:v23 destinationID:@"rapport:rdid:SameHome" options:0 completion:0];
      }
    }
LABEL_38:
    if (v7 != v30) {
      [(RPCompanionLinkDaemon *)self->_daemon _updateForXPCClientChange];
    }

    goto LABEL_41;
  }
LABEL_43:
}

- (void)companionLinkTriggerEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  int v9 = (void (**)(id, id))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v15 = 0;
  unsigned __int8 v10 = [(RPCompanionLinkXPCConnection *)self _entitledAndReturnError:&v15];
  id v11 = v15;
  if (v10)
  {
    daemon = self->_daemon;
    id v14 = v11;
    [(RPCompanionLinkDaemon *)daemon triggerEnhancedDiscoveryForReason:v8 useCase:v6 error:&v14];
    id v13 = v14;

    id v11 = v13;
  }
  if (v9) {
    v9[2](v9, v11);
  }
}

- (void)companionLinkCreateDeviceToEndpointMappingForDeviceID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v15 = 0;
  unsigned __int8 v8 = [(RPCompanionLinkXPCConnection *)self _entitledAndReturnError:&v15];
  id v9 = v15;
  if (v8)
  {
    daemon = self->_daemon;
    id v13 = v9;
    id v14 = 0;
    [(RPCompanionLinkDaemon *)daemon createDeviceToEndpointMappingForDeviceID:v6 endpointUUID:&v14 error:&v13];
    id v11 = v14;
    id v12 = v13;

    if (v7) {
      v7[2](v7, v11, v12);
    }
  }
  else
  {
    if (v7) {
      v7[2](v7, 0, v9);
    }
    id v12 = v9;
  }
}

- (void)companionLinkRegisterEventID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void (**)(id, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v19 = 0;
  [(RPCompanionLinkXPCConnection *)self _entitledAndReturnError:&v19];
  id v11 = v19;
  if (v11)
  {
    id v12 = v11;
LABEL_3:
    if (v10) {
      v10[2](v10, v12);
    }
    goto LABEL_17;
  }
  if (CFDictionaryGetInt64())
  {
    id v13 = [(RPCompanionLinkDevice *)self->_daemonDevice identifier];
    if (!v13)
    {
      id v14 = [(RPCompanionLinkClient *)self->_client destinationDevice];
      id v13 = [v14 identifier];

      if (!v13)
      {
        id v12 = RPErrorF();
        if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        goto LABEL_3;
      }
    }
    [(RPCompanionLinkDaemon *)self->_daemon interestRegisterEventID:v8 peerIdentifier:v13 owner:self];
  }
  registeredEvents = self->_registeredEvents;
  if (!registeredEvents)
  {
    BOOL v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    BOOL v17 = self->_registeredEvents;
    self->_registeredEvents = v16;

    registeredEvents = self->_registeredEvents;
  }
  if (v9) {
    uint64_t v18 = v9;
  }
  else {
    uint64_t v18 = &__NSDictionary0__struct;
  }
  [(NSMutableDictionary *)registeredEvents setObject:v18 forKeyedSubscript:v8];
  if (v10) {
    v10[2](v10, 0);
  }
  id v12 = 0;
LABEL_17:
}

- (void)companionLinkDeregisterEventID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v11 = 0;
  [(RPCompanionLinkXPCConnection *)self _entitledAndReturnError:&v11];
  id v8 = v11;
  if (v8)
  {
    if (v7) {
      v7[2](v7, v8);
    }
  }
  else
  {
    id v9 = [(RPCompanionLinkDevice *)self->_daemonDevice identifier];
    if (v9
      || ([(RPCompanionLinkClient *)self->_client destinationDevice],
          unsigned __int8 v10 = objc_claimAutoreleasedReturnValue(),
          [v10 identifier],
          id v9 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9))
    {
      [(RPCompanionLinkDaemon *)self->_daemon interestDeregisterEventID:v6 peerIdentifier:v9 owner:self];
    }
    [(NSMutableDictionary *)self->_registeredEvents setObject:0 forKeyedSubscript:v6];
    if (v7) {
      v7[2](v7, 0);
    }
  }
}

- (void)companionLinkSendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 nwActivityToken:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = (void (**)(id, void *))a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v28 = 0;
  [(RPCompanionLinkXPCConnection *)self _entitledAndReturnError:&v28];
  id v20 = v28;
  if (v20)
  {
    uint64_t v27 = v20;
    id v21 = 0;
    if (!v19) {
      goto LABEL_10;
    }
  }
  else
  {
    id v21 = +[RPNWActivityMetrics metricsUsingToken:v18];
    [v21 setDestination:v16];
    id v22 = +[RPNWActivityUtils updateOptions:v17 withNWActivityMetrics:v21];

    if (![v16 isEqual:@"rapport:rdid:DirectPeer"])
    {
LABEL_8:
      id v17 = [(RPCompanionLinkXPCConnection *)self _updateOptionsWithProcessInfo:v22];

      [(RPCompanionLinkDaemon *)self->_daemon sendEventID:v14 event:v15 destinationID:v16 options:v17 completion:v19];
      goto LABEL_9;
    }
    id v23 = self->_netCnx;
    if (v23)
    {
      unsigned __int8 v24 = v23;
      id v17 = [(RPCompanionLinkXPCConnection *)self _updateOptionsWithProcessInfo:v22];

      [(RPConnection *)v24 sendEncryptedEventID:v14 event:v15 options:v17 completion:v19];
LABEL_9:
      uint64_t v27 = 0;
      goto LABEL_10;
    }
    uint64_t v25 = [(RPCompanionLinkDevice *)self->_daemonDevice identifier];
    if (v25
      || ([(RPCompanionLinkClient *)self->_client destinationDevice],
          CFStringRef v26 = objc_claimAutoreleasedReturnValue(),
          [v26 identifier],
          uint64_t v25 = objc_claimAutoreleasedReturnValue(),
          v26,
          v25))
    {

      id v16 = (id)v25;
      goto LABEL_8;
    }
    RPErrorF();
    v27 = id v17 = v22;
    if (!v19) {
      goto LABEL_10;
    }
  }
  if (v27) {
    v19[2](v19, v27);
  }
LABEL_10:
}

- (void)companionLinkRegisterProfileID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v18 = 0;
  [(RPCompanionLinkXPCConnection *)self _entitledAndReturnError:&v18];
  id v8 = v18;
  if (v8)
  {
    id v9 = v8;
LABEL_3:
    if (v7) {
      v7[2](v7, v9);
    }
    goto LABEL_5;
  }
  if (([(NSMutableSet *)self->_registeredProfileIDs containsObject:v6] & 1) != 0
    || [(NSMutableSet *)self->_daemon->_registeredProfileIDs containsObject:v6])
  {
    id v9 = RPErrorF();
    if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_3;
  }
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    id v17 = v6;
    LogPrintF();
  }
  registeredProfileIDs = self->_registeredProfileIDs;
  if (!registeredProfileIDs)
  {
    id v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v12 = self->_registeredProfileIDs;
    self->_registeredProfileIDs = v11;

    registeredProfileIDs = self->_registeredProfileIDs;
  }
  -[NSMutableSet addObject:](registeredProfileIDs, "addObject:", v6, v17);
  id v13 = self->_daemon->_registeredProfileIDs;
  if (!v13)
  {
    id v14 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    daemon = self->_daemon;
    id v16 = daemon->_registeredProfileIDs;
    daemon->_registeredProfileIDs = v14;

    id v13 = self->_daemon->_registeredProfileIDs;
  }
  [(NSMutableSet *)v13 addObject:v6];
  if (v7) {
    v7[2](v7, 0);
  }
  [(RPCompanionLinkDaemon *)self->_daemon _update];
  id v9 = 0;
LABEL_5:
}

- (void)companionLinkDeregisterProfileID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v10 = 0;
  [(RPCompanionLinkXPCConnection *)self _entitledAndReturnError:&v10];
  id v8 = v10;
  if (v8)
  {
    if (v7) {
      v7[2](v7, v8);
    }
  }
  else
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v9 = v6;
      LogPrintF();
    }
    -[NSMutableSet removeObject:](self->_registeredProfileIDs, "removeObject:", v6, v9);
    [(NSMutableSet *)self->_daemon->_registeredProfileIDs removeObject:v6];
    if (v7) {
      v7[2](v7, 0);
    }
    [(RPCompanionLinkDaemon *)self->_daemon _update];
  }
}

- (void)companionLinkRegisterRequestID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v16 = 0;
  [(RPCompanionLinkXPCConnection *)self _entitledAndReturnError:&v16];
  id v11 = v16;
  if (!v11)
  {
    registeredRequests = self->_registeredRequests;
    if (!registeredRequests)
    {
      id v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      id v14 = self->_registeredRequests;
      self->_registeredRequests = v13;

      registeredRequests = self->_registeredRequests;
    }
    if (v9) {
      id v15 = v9;
    }
    else {
      id v15 = &__NSDictionary0__struct;
    }
    [(NSMutableDictionary *)registeredRequests setObject:v15 forKeyedSubscript:v8];
  }
  if (v10) {
    v10[2](v10, v11);
  }
}

- (void)companionLinkDeregisterRequestID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v9 = 0;
  [(RPCompanionLinkXPCConnection *)self _entitledAndReturnError:&v9];
  id v8 = v9;
  if (!v8) {
    [(NSMutableDictionary *)self->_registeredRequests setObject:0 forKeyedSubscript:v6];
  }
  if (v7) {
    v7[2](v7, v8);
  }
}

- (void)companionLinkSendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 nwActivityToken:(id)a7 responseHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v28 = 0;
  [(RPCompanionLinkXPCConnection *)self _entitledAndReturnError:&v28];
  id v20 = v28;
  if (v20)
  {
    uint64_t v27 = v20;
    id v21 = 0;
    if (!v19) {
      goto LABEL_10;
    }
  }
  else
  {
    id v21 = +[RPNWActivityMetrics metricsUsingToken:v18];
    [v21 setDestination:v16];
    id v22 = +[RPNWActivityUtils updateOptions:v17 withNWActivityMetrics:v21];

    if (![v16 isEqual:@"rapport:rdid:DirectPeer"])
    {
LABEL_8:
      id v17 = [(RPCompanionLinkXPCConnection *)self _updateOptionsWithProcessInfo:v22];

      [(RPCompanionLinkDaemon *)self->_daemon sendRequestID:v14 request:v15 destinationID:v16 xpcID:self->_xpcID options:v17 responseHandler:v19];
      goto LABEL_9;
    }
    id v23 = self->_netCnx;
    if (v23)
    {
      unsigned __int8 v24 = v23;
      id v17 = [(RPCompanionLinkXPCConnection *)self _updateOptionsWithProcessInfo:v22];

      [(RPConnection *)v24 sendEncryptedRequestID:v14 request:v15 xpcID:self->_xpcID options:v17 responseHandler:v19];
LABEL_9:
      uint64_t v27 = 0;
      goto LABEL_10;
    }
    uint64_t v25 = [(RPCompanionLinkDevice *)self->_daemonDevice identifier];
    if (v25
      || ([(RPCompanionLinkClient *)self->_client destinationDevice],
          CFStringRef v26 = objc_claimAutoreleasedReturnValue(),
          [v26 identifier],
          uint64_t v25 = objc_claimAutoreleasedReturnValue(),
          v26,
          v25))
    {

      id v16 = (id)v25;
      goto LABEL_8;
    }
    RPErrorF();
    v27 = id v17 = v22;
    if (!v19) {
      goto LABEL_10;
    }
  }
  if (v27) {
    (*((void (**)(id, void, void, void *))v19 + 2))(v19, 0, 0, v27);
  }
LABEL_10:
}

- (void)companionLinkTryPassword:(id)a3
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  unsigned int v4 = [(RPCompanionLinkXPCConnection *)self _entitledAndReturnError:0];
  uint64_t v5 = v8;
  if (v4)
  {
    id v6 = self->_netCnx;
    id v7 = v6;
    if (v6)
    {
      [(RPConnection *)v6 tryPassword:v8];
    }
    else if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }

    uint64_t v5 = v8;
  }
}

- (void)companionLinkSetLocalDeviceAsContextCollector:(id)a3
{
  unsigned int v4 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v11 = 0;
  unsigned __int8 v5 = [(RPCompanionLinkXPCConnection *)self _entitledAndReturnError:&v11];
  id v6 = v11;
  id v7 = v6;
  if ((v5 & 1) == 0)
  {
    id v9 = v6;
    if (!v4) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  id v8 = [(RPCompanionLinkDaemon *)self->_daemon localDeviceInfo];
  [v8 setStatusFlags:[v8 statusFlags] | 0x400000000];

  self->_isContextCollector = 1;
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    id v10 = [(RPCompanionLinkDaemon *)self->_daemon localDeviceInfo];
    LogPrintF();
  }
  [(RPCompanionLinkDaemon *)self->_daemon _update];
  if (v4)
  {
    id v9 = 0;
LABEL_10:
    ((void (**)(id, id))v4)[2](v4, v9);
  }
LABEL_11:
}

- (void)companionLinkRemoveLocalDeviceAsContextCollector:(id)a3
{
  unsigned int v4 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v11 = 0;
  unsigned __int8 v5 = [(RPCompanionLinkXPCConnection *)self _entitledAndReturnError:&v11];
  id v6 = v11;
  id v7 = v6;
  if ((v5 & 1) == 0)
  {
    id v9 = v6;
    if (!v4) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  id v8 = [(RPCompanionLinkDaemon *)self->_daemon localDeviceInfo];
  [v8 setStatusFlags:((unint64_t)[v8 statusFlags] & 0xFFFFFFFBFFFFFFFFLL)];

  self->_isContextCollector = 0;
  if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    id v10 = [(RPCompanionLinkDaemon *)self->_daemon localDeviceInfo];
    LogPrintF();
  }
  [(RPCompanionLinkDaemon *)self->_daemon _update];
  if (v4)
  {
    id v9 = 0;
LABEL_10:
    ((void (**)(id, id))v4)[2](v4, v9);
  }
LABEL_11:
}

- (void)xpcDiscoveryActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v12 = 0;
  [(RPCompanionLinkXPCConnection *)self _entitledAndReturnError:&v12];
  id v9 = v12;
  if (v9)
  {
    if (v8) {
      v8[2](v8, 0, v9);
    }
  }
  else
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v10 = v7;
      uint64_t v11 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    [v7 setDispatchQueue:self->_dispatchQueue, v10, v11];
    objc_storeStrong((id *)&self->_discoveryClient, a3);
  }
}

- (void)xpcDiscoveryUpdate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([(RPCompanionLinkXPCConnection *)self _entitledAndReturnError:0]
    && dword_100140E48 <= 30
    && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    [(NSXPCConnection *)self->_xpcCnx processIdentifier];
    LogPrintF();
  }
}

- (void)xpcServerActivate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  unsigned int v38 = sub_10000F400;
  id v39 = sub_10000F410;
  id v40 = 0;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100040BB8;
  v32[3] = &unk_1001221D0;
  long long v34 = &v35;
  id v7 = a4;
  id v33 = v7;
  unsigned __int8 v24 = objc_retainBlock(v32);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v8 = (id *)(v36 + 5);
  id obj = (id)v36[5];
  [(RPCompanionLinkXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v8, obj);
  if (!v36[5])
  {
    id v9 = [v6 serviceType];
    if ([v9 length])
    {
      [(RPCompanionLinkDaemon *)self->_daemon activeServers];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      id v11 = [v10 countByEnumeratingWithState:&v27 objects:v41 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v28;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v28 != v12) {
              objc_enumerationMutation(v10);
            }
            id v14 = [*(id *)(*((void *)&v27 + 1) + 8 * i) serviceType];
            unsigned int v15 = [v14 isEqual:v9];

            if (v15)
            {
              uint64_t v17 = RPErrorF();
              id v18 = (void *)v36[5];
              void v36[5] = v17;

              goto LABEL_23;
            }
          }
          id v11 = [v10 countByEnumeratingWithState:&v27 objects:v41 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      unsigned __int8 v16 = [v6 internalAuthFlags];
      if (v16)
      {
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_100040C8C;
        v26[3] = &unk_100121CF0;
        void v26[4] = self;
        [v6 setShowPasswordHandler:v26];
      }
      if ((v16 & 2) != 0)
      {
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_100040D00;
        v25[3] = &unk_100121D18;
        v25[4] = self;
        [v6 setHidePasswordHandler:v25];
      }
      if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
      {
        id v21 = v6;
        uint64_t v22 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
        LogPrintF();
      }
      [v6 setDispatchQueue:self->_dispatchQueue v21, v22];
      objc_storeStrong((id *)&self->_server, a3);
      if (!v10)
      {
        id v10 = objc_alloc_init((Class)NSMutableSet);
        [(RPCompanionLinkDaemon *)self->_daemon setActiveServers:v10];
      }
      [v10 addObject:v6];
      id v19 = [(RPCompanionLinkDaemon *)self->_daemon localDeviceInfo];
      [v19 setServersChangedState:6];

      [(RPCompanionLinkDaemon *)self->_daemon _updateForXPCServerChange];
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
    else
    {
      uint64_t v20 = RPErrorF();
      id v10 = (id)v36[5];
      void v36[5] = v20;
    }
LABEL_23:
  }
  ((void (*)(void *))v24[2])(v24);

  _Block_object_dispose(&v35, 8);
}

- (void)xpcServerUpdate:(id)a3
{
  id v15 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (![(RPCompanionLinkXPCConnection *)self _entitledAndReturnError:0]) {
    goto LABEL_21;
  }
  server = self->_server;
  if (server)
  {
    id v5 = [(RPServer *)server controlFlags];
    id v6 = [v15 controlFlags];
    BOOL v7 = v6 != v5;
    if (v6 != v5) {
      [(RPServer *)self->_server setControlFlags:v6];
    }
    id v8 = [v15 password];
    id v9 = [(RPServer *)self->_server password];
    id v10 = v8;
    id v11 = v9;
    if (v10 == v11)
    {
    }
    else
    {
      uint64_t v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        unsigned __int8 v13 = [v10 isEqual:v11];

        if (v13) {
          goto LABEL_12;
        }
      }
      else
      {
      }
      [(RPServer *)self->_server setPassword:v10];
      BOOL v7 = 1;
    }
LABEL_12:
    id v14 = [v15 passwordType];
    if (v14 != [(RPServer *)self->_server passwordType])
    {
      [(RPServer *)self->_server setPasswordType:v14];
      BOOL v7 = 1;
    }
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    if (v7) {
      [(RPCompanionLinkDaemon *)self->_daemon _updateForXPCServerChange];
    }

    goto LABEL_21;
  }
  if (dword_100140E48 <= 90 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
  {
    [(NSXPCConnection *)self->_xpcCnx processIdentifier];
    LogPrintF();
  }
LABEL_21:
}

- (void)xpcSessionActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v12 = 0;
  [(RPCompanionLinkXPCConnection *)self _entitledAndReturnError:&v12];
  id v9 = v12;
  if (v9)
  {
    if (v8) {
      v8[2](v8, v9);
    }
  }
  else
  {
    if (dword_100140E48 <= 30 && (dword_100140E48 != -1 || _LogCategory_Initialize()))
    {
      id v10 = v7;
      uint64_t v11 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    [v7 setDispatchQueue:self->_dispatchQueue v10, v11];
    objc_storeStrong((id *)&self->_session, a3);
  }
}

- (id)_findMatchingDevice:(id)a3 inDeviceDictionary:(id)a4
{
  id v5 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [a4 allValues];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 isEqualToDevice:v5])
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (RPCompanionLinkClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (BOOL)clientNeedsWiFiAssertion
{
  return self->_clientNeedsWiFiAssertion;
}

- (void)setClientNeedsWiFiAssertion:(BOOL)a3
{
  self->_clientNeedsWiFiAssertion = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)isContextCollector
{
  return self->_isContextCollector;
}

- (void)setIsContextCollector:(BOOL)a3
{
  self->_isContextCollector = a3;
}

- (RBSProcessIdentifier)rbsPID
{
  return self->_rbsPID;
}

- (void)setRbsPID:(id)a3
{
}

- (RPConnection)netCnx
{
  return self->_netCnx;
}

- (void)setNetCnx:(id)a3
{
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (CUBonjourDevice)bonjourDevice
{
  return self->_bonjourDevice;
}

- (void)setBonjourDevice:(id)a3
{
}

- (RPCompanionLinkDaemon)daemon
{
  return self->_daemon;
}

- (RPCompanionLinkDevice)daemonDevice
{
  return self->_daemonDevice;
}

- (NSMutableDictionary)devices
{
  return self->_devices;
}

- (RPDiscovery)discoveryClient
{
  return self->_discoveryClient;
}

- (void)setDiscoveryClient:(id)a3
{
}

- (OS_dispatch_source)discoveryTimer
{
  return self->_discoveryTimer;
}

- (void)setDiscoveryTimer:(id)a3
{
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void)setLaunchInstanceID:(id)a3
{
}

- (BOOL)localDeviceUpdated
{
  return self->_localDeviceUpdated;
}

- (void)setLocalDeviceUpdated:(BOOL)a3
{
  self->_localDeviceUpdated = a3;
}

- (BOOL)needsCLink
{
  return self->_needsCLink;
}

- (void)setNeedsCLink:(BOOL)a3
{
  self->_needsCLink = a3;
}

- (BOOL)needsNearbyActionV2
{
  return self->_needsNearbyActionV2;
}

- (void)setNeedsNearbyActionV2:(BOOL)a3
{
  self->_needsNearbyActionV2 = a3;
}

- (NSString)personaUUID
{
  return self->_personaUUID;
}

- (void)setPersonaUUID:(id)a3
{
}

- (NSMutableDictionary)registeredEvents
{
  return self->_registeredEvents;
}

- (NSMutableSet)registeredProfileIDs
{
  return self->_registeredProfileIDs;
}

- (NSMutableDictionary)registeredRequests
{
  return self->_registeredRequests;
}

- (OS_os_transaction)osTransaction
{
  return self->_osTransaction;
}

- (void)setOsTransaction:(id)a3
{
}

- (RPServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (RPSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (unint64_t)startTicks
{
  return self->_startTicks;
}

- (void)setStartTicks:(unint64_t)a3
{
  self->_startTicks = a3;
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (unsigned)xpcID
{
  return self->_xpcID;
}

- (void)setXpcID:(unsigned int)a3
{
  self->_uint64_t xpcID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_osTransaction, 0);
  objc_storeStrong((id *)&self->_registeredRequests, 0);
  objc_storeStrong((id *)&self->_registeredProfileIDs, 0);
  objc_storeStrong((id *)&self->_registeredEvents, 0);
  objc_storeStrong((id *)&self->_personaUUID, 0);
  objc_storeStrong((id *)&self->_launchInstanceID, 0);
  objc_storeStrong((id *)&self->_discoveryTimer, 0);
  objc_storeStrong((id *)&self->_discoveryClient, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_daemonDevice, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_bonjourDevice, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_netCnx, 0);
  objc_storeStrong((id *)&self->_rbsPID, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

@end