@interface RPNearbyInvitationXPCConnection
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)entitled;
- (BOOL)reportFoundDevice:(id)a3 outReason:(id *)a4;
- (NSMutableDictionary)devices;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (RPConnection)netCnx;
- (RPNearbyInvitationDaemon)daemon;
- (RPNearbyInvitationDiscovery)activatedDiscovery;
- (RPNearbyInvitationServer)activatedServer;
- (RPNearbyInvitationSession)activatedSession;
- (RPNearbyInvitationXPCConnection)initWithDaemon:(id)a3 xpcCnx:(id)a4;
- (id)activateCompletionHandler;
- (unsigned)xpcID;
- (void)connectionInvalidated;
- (void)nearbyInvitationActivateDiscovery:(id)a3 completion:(id)a4;
- (void)nearbyInvitationActivateServer:(id)a3 completion:(id)a4;
- (void)nearbyInvitationActivateSession:(id)a3 completion:(id)a4;
- (void)nearbyInvitationInvalidateClientSession;
- (void)nearbyInvitationInvalidateSessionID:(id)a3;
- (void)nearbyInvitationSendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6;
- (void)nearbyInvitationSendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)reportChangedDevice:(id)a3 changes:(unsigned int)a4;
- (void)reportLostDevice:(id)a3;
- (void)sessionActivatedWithError:(id)a3;
- (void)sessionEndedWithID:(id)a3 netCnx:(id)a4;
- (void)sessionStartWithID:(id)a3 netCnx:(id)a4 completion:(id)a5;
- (void)setDispatchQueue:(id)a3;
- (void)setNetCnx:(id)a3;
- (void)setXpcID:(unsigned int)a3;
@end

@implementation RPNearbyInvitationXPCConnection

- (RPNearbyInvitationXPCConnection)initWithDaemon:(id)a3 xpcCnx:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RPNearbyInvitationXPCConnection;
  v9 = [(RPNearbyInvitationXPCConnection *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daemon, a3);
    objc_storeStrong((id *)&v10->_xpcCnx, a4);
  }

  return v10;
}

- (void)connectionInvalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1001419A0 <= 20 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
  {
    [(NSXPCConnection *)self->_xpcCnx processIdentifier];
    LogPrintF();
  }
  objc_super v12 = self->_activatedDiscovery;
  activatedDiscovery = self->_activatedDiscovery;
  self->_activatedDiscovery = 0;

  if (v12)
  {
    [(NSMutableSet *)self->_daemon->_activatedDiscoverySet removeObject:v12];
    [(RPNearbyInvitationDiscovery *)v12 invalidate];
  }
  v4 = self->_activatedServer;
  activatedServer = self->_activatedServer;
  self->_activatedServer = 0;

  if (v4)
  {
    activatedServerXPCCnxMap = self->_daemon->_activatedServerXPCCnxMap;
    id v7 = [(RPNearbyInvitationServer *)v4 serviceType];
    [(NSMutableDictionary *)activatedServerXPCCnxMap removeObjectForKey:v7];

    [(RPNearbyInvitationServer *)v4 invalidate];
  }
  activatedSession = self->_activatedSession;
  if (activatedSession)
  {
    activatedSessionSet = self->_daemon->_activatedSessionSet;
    v10 = activatedSession;
    [(NSMutableSet *)activatedSessionSet removeObject:v10];
    [(RPNearbyInvitationSession *)v10 invalidate];
    v11 = self->_activatedSession;
    self->_activatedSession = 0;
  }
}

- (BOOL)_entitledAndReturnError:(id *)a3
{
  if (self->_entitled) {
    return 1;
  }
  v6 = [(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:@"com.apple.rapport.NearbyInvitation"];
  unsigned __int8 v7 = [v6 isEqual:&__kCFBooleanTrue];

  if (v7)
  {
    id v8 = 0;
    self->_entitled = 1;
  }
  else
  {
    if (dword_1001419A0 <= 90 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
    {
      [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    id v8 = RPErrorF();
  }
  id v9 = v8;
  *a3 = v9;

  return self->_entitled;
}

- (void)sessionStartWithID:(id)a3 netCnx:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)RPNearbyInvitationDevice);
  objc_super v12 = [v9 peerDeviceInfo];
  if (v12) {
    [v11 updateWithEndpoint:v12];
  }
  netCnx = self->_netCnx;
  self->_netCnx = (RPConnection *)v9;
  id v14 = v9;

  if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  xpcCnx = self->_xpcCnx;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000619B4;
  v18[3] = &unk_100122D28;
  id v19 = v10;
  id v16 = v10;
  v17 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v18];
  [v17 nearbyInvitationStartServerSessionID:v8 device:v11 completion:v16];
}

- (void)sessionEndedWithID:(id)a3 netCnx:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (self->_activatedServer)
  {
    if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
    {
      id v8 = v9;
      LogPrintF();
    }
    unsigned __int8 v7 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
    [v7 nearbyInvitationSessionEndedWithID:v9];
  }
}

- (void)sessionActivatedWithError:(id)a3
{
  id v6 = a3;
  [(RPNearbyInvitationSession *)self->_activatedSession setWaitingToConnect:0];
  [(RPNearbyInvitationSession *)self->_activatedSession setFailedToConnect:v6 != 0];
  activateCompletionHandler = (void (**)(id, id))self->_activateCompletionHandler;
  if (activateCompletionHandler)
  {
    activateCompletionHandler[2](activateCompletionHandler, v6);
    id v5 = self->_activateCompletionHandler;
    self->_activateCompletionHandler = 0;
  }
}

- (void)nearbyInvitationActivateDiscovery:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v20 = 0;
  BOOL v9 = [(RPNearbyInvitationXPCConnection *)self _entitledAndReturnError:&v20];
  id v10 = v20;
  self->_entitled = v9;
  if (v9)
  {
    if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v16 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    [v7 setDispatchQueue:self->_dispatchQueue v16];
    objc_storeStrong((id *)&self->_activatedDiscovery, a3);
    activatedDiscoverySet = self->_daemon->_activatedDiscoverySet;
    if (!activatedDiscoverySet)
    {
      objc_super v12 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      daemon = self->_daemon;
      id v14 = daemon->_activatedDiscoverySet;
      daemon->_activatedDiscoverySet = v12;

      activatedDiscoverySet = self->_daemon->_activatedDiscoverySet;
    }
    [(NSMutableSet *)activatedDiscoverySet addObject:v7];
    if (v8) {
      v8[2](v8, v10);
    }
    [(RPNearbyInvitationDaemon *)self->_daemon _update];
    discoveredDevices = self->_daemon->_discoveredDevices;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100061DA4;
    v17[3] = &unk_100123090;
    id v18 = v7;
    id v19 = self;
    [(NSMutableDictionary *)discoveredDevices enumerateKeysAndObjectsUsingBlock:v17];
  }
  else if (v8)
  {
    v8[2](v8, v10);
  }
}

- (void)nearbyInvitationActivateServer:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v20 = 0;
  unsigned __int8 v9 = [(RPNearbyInvitationXPCConnection *)self _entitledAndReturnError:&v20];
  id v10 = v20;
  if (v9)
  {
    id v11 = [v7 serviceType];

    if (v11)
    {
      activatedServerXPCCnxMap = self->_daemon->_activatedServerXPCCnxMap;
      v13 = [v7 serviceType];
      id v14 = [(NSMutableDictionary *)activatedServerXPCCnxMap objectForKey:v13];

      if (v14)
      {
        if (v8)
        {
          id v18 = [v7 serviceType];
          v15 = RPErrorF();
          v8[2](v8, v15);
        }
      }
      else
      {
        if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
        {
          id v17 = v7;
          uint64_t v19 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
          LogPrintF();
        }
        [v7 setDispatchQueue:self->_dispatchQueue, v17, v19];
        objc_storeStrong((id *)&self->_activatedServer, a3);
        [(RPNearbyInvitationDaemon *)self->_daemon _handleServerActivation:self];
        if (v8) {
          v8[2](v8, v10);
        }
        [(RPNearbyInvitationDaemon *)self->_daemon _update];
      }
    }
    else
    {
      uint64_t v16 = RPErrorF();

      if (v8) {
        v8[2](v8, (void *)v16);
      }
      id v10 = (id)v16;
    }
  }
  else if (v8)
  {
    v8[2](v8, v10);
  }
}

- (void)nearbyInvitationActivateSession:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = sub_1000623E4;
  v41 = sub_1000623F4;
  id v42 = 0;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000623FC;
  v34[3] = &unk_1001221D0;
  v36 = &v37;
  id v9 = v8;
  id v35 = v9;
  id v10 = objc_retainBlock(v34);
  id v11 = (id *)(v38 + 5);
  id obj = (id)v38[5];
  unsigned __int8 v12 = [(RPNearbyInvitationXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v11, obj);
  if (v12)
  {
    if (self->_activatedSession)
    {
      uint64_t v13 = RPErrorF();
      id v14 = (void *)v38[5];
      v38[5] = v13;
    }
    else
    {
      v15 = [v7 destinationDevice];
      id v14 = [v15 identifier];

      if (v14)
      {
        uint64_t v16 = [(RPNearbyInvitationDaemon *)self->_daemon _findMatchingDeviceWithIdentifier:v14];
        id v17 = v16;
        if (v16
          && ([v16 identifier],
              id v18 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v19 = [v14 isEqualToString:v18],
              v18,
              (v19 & 1) != 0))
        {
          [v7 setDaemonDevice:v17];
          if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v20 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
            v31 = [v7 serviceType];
            v32 = v17;
            uint64_t v30 = v20;
            LogPrintF();
          }
          [v7 setWaitingToConnect:1 v30 v31 v32];
          [v7 setDispatchQueue:self->_dispatchQueue];
          objc_storeStrong((id *)&self->_activatedSession, a3);
          id v24 = objc_retainBlock(v9);
          id activateCompletionHandler = self->_activateCompletionHandler;
          self->_id activateCompletionHandler = v24;

          activatedSessionSet = self->_daemon->_activatedSessionSet;
          if (!activatedSessionSet)
          {
            v27 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
            daemon = self->_daemon;
            v29 = daemon->_activatedSessionSet;
            daemon->_activatedSessionSet = v27;

            activatedSessionSet = self->_daemon->_activatedSessionSet;
          }
          [(NSMutableSet *)activatedSessionSet addObject:v7];
          [(RPNearbyInvitationDaemon *)self->_daemon _update];
        }
        else
        {
          uint64_t v22 = RPErrorF();
          v23 = (void *)v38[5];
          v38[5] = v22;
        }
      }
      else
      {
        uint64_t v21 = RPErrorF();
        id v17 = (void *)v38[5];
        v38[5] = v21;
      }
    }
  }
  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v37, 8);
}

- (void)nearbyInvitationInvalidateClientSession
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
  {
    [(NSXPCConnection *)self->_xpcCnx processIdentifier];
    LogPrintF();
  }
  if (self->_activatedSession)
  {
    -[NSMutableSet removeObject:](self->_daemon->_activatedSessionSet, "removeObject:");
    v3 = self->_netCnx;
    [(RPConnection *)v3 invalidate];
    netCnx = self->_netCnx;
    self->_netCnx = 0;
  }
  daemon = self->_daemon;

  [(RPNearbyInvitationDaemon *)daemon _update];
}

- (void)nearbyInvitationInvalidateSessionID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1001419A0 <= 30 && (dword_1001419A0 != -1 || _LogCategory_Initialize()))
  {
    [(NSXPCConnection *)self->_xpcCnx processIdentifier];
    LogPrintF();
  }
}

- (void)nearbyInvitationSendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void *))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v19 = 0;
  unsigned __int8 v14 = [(RPNearbyInvitationXPCConnection *)self _entitledAndReturnError:&v19];
  id v15 = v19;
  if (v14)
  {
    uint64_t v16 = self->_netCnx;
    id v17 = v16;
    if (v16)
    {
      [(RPConnection *)v16 sendEncryptedEventID:v10 event:v11 options:v12 completion:v13];
    }
    else if (v13)
    {
      id v18 = RPErrorF();
      v13[2](v13, v18);
    }
  }
  else if (v13)
  {
    v13[2](v13, v15);
  }
}

- (void)nearbyInvitationSendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v18 = 0;
  unsigned __int8 v14 = [(RPNearbyInvitationXPCConnection *)self _entitledAndReturnError:&v18];
  id v15 = v18;
  if (v14)
  {
    netCnx = self->_netCnx;
    if (netCnx)
    {
      [(RPConnection *)netCnx sendEncryptedRequestID:v10 request:v11 xpcID:self->_xpcID options:v12 responseHandler:v13];
    }
    else
    {
      id v17 = RPErrorF();
      (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0, 0, v17);
    }
  }
  else
  {
    (*((void (**)(id, void, void, id))v13 + 2))(v13, 0, 0, v15);
  }
}

- (BOOL)reportFoundDevice:(id)a3 outReason:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 identifier];
  if (!v7)
  {
    if (a4)
    {
      BOOL v14 = 0;
      id v15 = @"missingDeviceIdentifier";
LABEL_11:
      *a4 = v15;
      goto LABEL_15;
    }
LABEL_12:
    BOOL v14 = 0;
    goto LABEL_15;
  }
  if (([(RPNearbyInvitationDiscovery *)self->_activatedDiscovery shouldReportDevice:v6] & 1) == 0)
  {
    if (a4)
    {
      BOOL v14 = 0;
      id v15 = @"activateDiscoveryIgnore";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  id v8 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v7];

  devices = self->_devices;
  if (!devices)
  {
    id v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v11 = self->_devices;
    self->_devices = v10;

    devices = self->_devices;
  }
  [(NSMutableDictionary *)devices setObject:v6 forKeyedSubscript:v7];
  id v12 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
  id v13 = v12;
  if (v8) {
    [v12 nearbyInvitationChangedDevice:v6 changes:2];
  }
  else {
    [v12 nearbyInvitationFoundDevice:v6];
  }

  BOOL v14 = 1;
LABEL_15:

  return v14;
}

- (void)reportLostDevice:(id)a3
{
  id v7 = a3;
  id v4 = [v7 identifier];
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v4];

    if (v5)
    {
      [(NSMutableDictionary *)self->_devices setObject:0 forKeyedSubscript:v4];
      id v6 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
      [v6 nearbyInvitationLostDevice:v7];
    }
  }
}

- (void)reportChangedDevice:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v13 = a3;
  id v6 = [v13 identifier];
  if (v6)
  {
    id v7 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v6];
    if ([(RPNearbyInvitationDiscovery *)self->_activatedDiscovery shouldReportDevice:v13])
    {
      devices = self->_devices;
      if (v7)
      {
        [(NSMutableDictionary *)devices setObject:v13 forKeyedSubscript:v6];
        id v9 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
        [v9 nearbyInvitationChangedDevice:v13 changes:v4];
      }
      else
      {
        id v10 = v13;
        if (!devices)
        {
          id v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          id v12 = self->_devices;
          self->_devices = v11;

          id v10 = v13;
          devices = self->_devices;
        }
        [(NSMutableDictionary *)devices setObject:v10 forKeyedSubscript:v6];
        id v9 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
        [v9 nearbyInvitationFoundDevice:v13];
      }
    }
    else
    {
      if (!v7)
      {
LABEL_11:

        goto LABEL_12;
      }
      [(NSMutableDictionary *)self->_devices setObject:0 forKeyedSubscript:v6];
      id v9 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
      [v9 nearbyInvitationLostDevice:v13];
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (id)activateCompletionHandler
{
  return self->_activateCompletionHandler;
}

- (RPNearbyInvitationDiscovery)activatedDiscovery
{
  return self->_activatedDiscovery;
}

- (RPNearbyInvitationServer)activatedServer
{
  return self->_activatedServer;
}

- (RPNearbyInvitationSession)activatedSession
{
  return self->_activatedSession;
}

- (RPNearbyInvitationDaemon)daemon
{
  return self->_daemon;
}

- (NSMutableDictionary)devices
{
  return self->_devices;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (RPConnection)netCnx
{
  return self->_netCnx;
}

- (void)setNetCnx:(id)a3
{
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
  self->_xpcID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_netCnx, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_activatedSession, 0);
  objc_storeStrong((id *)&self->_activatedServer, 0);
  objc_storeStrong((id *)&self->_activatedDiscovery, 0);

  objc_storeStrong(&self->_activateCompletionHandler, 0);
}

@end