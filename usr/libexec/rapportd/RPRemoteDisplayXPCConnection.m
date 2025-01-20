@interface RPRemoteDisplayXPCConnection
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)entitled;
- (BOOL)netConnectionStartWithDevice:(id)a3 session:(id)a4 error:(id *)a5;
- (BOOL)usingNearbyActionV2;
- (NSMutableSet)serverNetCnxs;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (RPConnection)activeNetCnx;
- (RPConnection)clientNetCnx;
- (RPRemoteDisplayDaemon)daemon;
- (RPRemoteDisplayDiscovery)activatedDiscovery;
- (RPRemoteDisplayServer)activatedServer;
- (RPRemoteDisplaySession)activatedSession;
- (RPRemoteDisplayXPCConnection)initWithDaemon:(id)a3 xpcCnx:(id)a4;
- (unsigned)xpcID;
- (void)_authCompletion:(id)a3;
- (void)_handleContinuityCameraDisabledAlertResponse;
- (void)_promptForPasswordWithFlags:(unsigned int)a3 throttleSeconds:(int)a4;
- (void)_receivedEventID:(id)a3 event:(id)a4 options:(id)a5 sessionID:(id)a6;
- (void)_receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6 sessionID:(id)a7;
- (void)_showContinuityCameraDisabledAlert;
- (void)connectionInvalidated;
- (void)hidePasswordWithFlags:(unsigned int)a3;
- (void)remoteDisplayActivateDiscovery:(id)a3 completion:(id)a4;
- (void)remoteDisplayActivateServer:(id)a3 completion:(id)a4;
- (void)remoteDisplayActivateSession:(id)a3 completion:(id)a4;
- (void)remoteDisplayChangeDedicatedDevice:(id)a3;
- (void)remoteDisplayChangeDiscoverySessionStateForDevice:(id)a3 reason:(id)a4;
- (void)remoteDisplayDedicatedDeviceConfirmationWithCompletion:(id)a3;
- (void)remoteDisplayInvalidateClientSession;
- (void)remoteDisplayInvalidateSessionID:(id)a3;
- (void)remoteDisplayPersonCanceled:(id)a3;
- (void)remoteDisplayPersonSelected:(id)a3 forDedicatedPairing:(BOOL)a4;
- (void)remoteDisplaySendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6;
- (void)remoteDisplaySendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)remoteDisplayStartPairingServerWithCompletion:(id)a3;
- (void)remoteDisplayStopPairingServer;
- (void)remoteDisplayTryPassword:(id)a3;
- (void)sessionEndedWithID:(id)a3 netCnx:(id)a4;
- (void)sessionStartWithID:(id)a3 netCnx:(id)a4 completion:(id)a5;
- (void)setActiveNetCnx:(id)a3;
- (void)setClientNetCnx:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setServerNetCnxs:(id)a3;
- (void)setUsingNearbyActionV2:(BOOL)a3;
- (void)setXpcID:(unsigned int)a3;
- (void)showPassword:(id)a3 flags:(unsigned int)a4;
- (void)updateErrorFlags:(unint64_t)a3;
@end

@implementation RPRemoteDisplayXPCConnection

- (RPRemoteDisplayXPCConnection)initWithDaemon:(id)a3 xpcCnx:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RPRemoteDisplayXPCConnection;
  v9 = [(RPRemoteDisplayXPCConnection *)&v12 init];
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
  if (dword_1001426A0 <= 20 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v18 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
    LogPrintF();
  }
  tcpServerConnections = self->_daemon->_tcpServerConnections;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000B7170;
  v23[3] = &unk_100124BE8;
  v23[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](tcpServerConnections, "enumerateKeysAndObjectsUsingBlock:", v23, v18);
  v4 = self->_activatedDiscovery;
  activatedDiscovery = self->_activatedDiscovery;
  self->_activatedDiscovery = 0;

  if (v4)
  {
    [(NSMutableSet *)self->_daemon->_activatedDiscoverySet removeObject:v4];
    [(RPRemoteDisplayDiscovery *)v4 invalidate];
  }
  [(RPRemoteDisplayServer *)self->_activatedServer invalidate];
  activatedServer = self->_activatedServer;
  self->_activatedServer = 0;

  id v7 = self->_activatedSession;
  activatedSession = self->_activatedSession;
  self->_activatedSession = 0;

  if (v7)
  {
    [(NSMutableSet *)self->_daemon->_activatedSessionSet removeObject:v7];
    [(RPRemoteDisplaySession *)v7 invalidate];
  }
  activeNetCnx = self->_activeNetCnx;
  self->_activeNetCnx = 0;

  [(RPConnection *)self->_clientNetCnx invalidate];
  clientNetCnx = self->_clientNetCnx;
  self->_clientNetCnx = 0;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v11 = self->_serverNetCnxs;
  id v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * i) invalidate];
      }
      id v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v13);
  }

  [(NSMutableSet *)self->_serverNetCnxs removeAllObjects];
  serverNetCnxs = self->_serverNetCnxs;
  self->_serverNetCnxs = 0;

  xpcCnx = self->_xpcCnx;
  self->_xpcCnx = 0;
}

- (BOOL)_entitledAndReturnError:(id *)a3
{
  if (self->_entitled) {
    return 1;
  }
  v6 = [(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:@"com.apple.RemoteDisplay"];
  unsigned int v7 = [v6 isEqual:&__kCFBooleanTrue];

  if (v7)
  {
    BOOL result = 1;
    self->_entitled = 1;
  }
  else
  {
    if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
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

- (BOOL)netConnectionStartWithDevice:(id)a3 session:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 bonjourDevice];
  if (!v10)
  {
    v10 = [v8 bonjourDevice];
    if (!v10)
    {
      v11 = [v8 ipAddress];

      if (!v11)
      {
        if (a5)
        {
          RPErrorF();
          BOOL v29 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v29 = 0;
        }
        goto LABEL_19;
      }
      v10 = 0;
    }
  }
  ++self->_daemon->_sessionIDLast;
  id v12 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
  id v13 = self->_clientNetCnx;
  if (!v13)
  {
    id v13 = (RPConnection *)objc_alloc_init((Class)RPConnection);
    objc_storeStrong((id *)&self->_clientNetCnx, v13);
    objc_storeStrong((id *)&self->_activeNetCnx, v13);
  }
  uint64_t v14 = [v8 ipAddress];

  if (v14)
  {
    v15 = [v8 ipAddress];
    [(RPConnection *)v13 setDestinationString:v15];
  }
  else
  {
    [(RPConnection *)v13 setBonjourPeerDevice:v10];
  }
  [(RPConnection *)v13 setControlFlags:576];
  if (((unint64_t)[v8 statusFlags] & 0x1000080000) == 0) {
    [(RPConnection *)v13 setControlFlags:(unint64_t)[(RPConnection *)v13 controlFlags] | 0x400000000000];
  }
  v16 = [v9 pairingInfo];

  if (v16) {
    [(RPConnection *)v13 setControlFlags:(unint64_t)[(RPConnection *)v13 controlFlags] | 0x8000000000];
  }
  [(RPConnection *)v13 setDispatchQueue:self->_dispatchQueue];
  v17 = +[RPIdentityDaemon sharedIdentityDaemon];
  [(RPConnection *)v13 setIdentityDaemon:v17];

  [(RPConnection *)v13 setKeepAliveSeconds:10];
  id v18 = objc_alloc((Class)NSString);
  daemon = self->_daemon;
  uint64_t v20 = daemon->_cnxIDLast + 1;
  daemon->_cnxIDLast = v20;
  id v21 = [v18 initWithFormat:@"%@Cnx-%u", @"RDLink", v20];
  [(RPConnection *)v13 setLabel:v21];

  [(RPConnection *)v13 setLocalDeviceInfo:self->_daemon->_localDeviceInfo];
  -[RPConnection setPasswordType:](v13, "setPasswordType:", [v9 passwordType]);
  long long v22 = [v8 identifier];
  [(RPConnection *)v13 setPeerIdentifier:v22];

  [(RPConnection *)v13 setPresent:1];
  v23 = [v9 serviceType];
  [(RPConnection *)v13 setServiceType:v23];

  if (([v9 internalAuthFlags] & 8) != 0)
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000B7844;
    v43[3] = &unk_100121908;
    v43[4] = self;
    [(RPConnection *)v13 setAuthCompletionHandler:v43];
  }
  if (([v9 internalAuthFlags] & 4) != 0)
  {
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1000B7850;
    v42[3] = &unk_100124E40;
    v42[4] = self;
    [(RPConnection *)v13 setPromptForPasswordHandler:v42];
  }
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000B7860;
  v39[3] = &unk_100121770;
  v39[4] = self;
  id v24 = v12;
  id v40 = v24;
  v25 = v13;
  v41 = v25;
  [(RPConnection *)v25 setInvalidationHandler:v39];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000B7870;
  v37[3] = &unk_1001219F8;
  v37[4] = self;
  id v26 = v24;
  id v38 = v26;
  [(RPConnection *)v25 setReceivedEventHandler:v37];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000B7888;
  v35[3] = &unk_100121A20;
  v35[4] = self;
  id v36 = v26;
  id v27 = v26;
  [(RPConnection *)v25 setReceivedRequestHandler:v35];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000B78A4;
  v31[3] = &unk_100121A98;
  id v32 = v9;
  v33 = self;
  v34 = v25;
  v28 = v25;
  [(RPConnection *)v28 setStateChangedHandler:v31];
  [(RPConnection *)v28 activate];

  BOOL v29 = 1;
LABEL_19:

  return v29;
}

- (void)sessionStartWithID:(id)a3 netCnx:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)RPRemoteDisplayDevice);
  id v12 = [v9 peerDeviceInfo];
  if (v12) {
    [v11 updateWithEndpoint:v12];
  }

  id v13 = [v9 linkType];
  id v14 = v13;
  if (v13 == 4)
  {
    uint64_t v15 = 8;
LABEL_7:
    [v11 setStatusFlags:[v11 statusFlags] | v15];
    goto LABEL_8;
  }
  if ((v13 & 0xFFFFFFFE) == 8)
  {
    uint64_t v15 = 0x1000000;
    goto LABEL_7;
  }
LABEL_8:
  v16 = self->_activeNetCnx;
  if (v16 && dword_1001426A0 < 31 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    v43 = v16;
    id v44 = v9;
    LogPrintF();
  }

  objc_storeStrong((id *)&self->_activeNetCnx, a4);
  xpcCnx = self->_xpcCnx;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_1000B8080;
  v58[3] = &unk_1001236F8;
  id v18 = v8;
  id v59 = v18;
  id v19 = v10;
  id v60 = v19;
  uint64_t v20 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v58];
  id v21 = +[NSNumber numberWithInt:v14];
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_1000B8140;
  v53[3] = &unk_1001223A8;
  id v54 = v18;
  id v55 = v11;
  v56 = self;
  id v45 = v19;
  id v46 = v54;
  id v57 = v45;
  v47 = v11;
  [v20 remoteDisplayStartServerSessionID:v54 device:v11 linkType:v21 completion:v53];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v48 = v9;
  long long v22 = [v9 receivedMessages];
  id v23 = [v22 countByEnumeratingWithState:&v49 objects:v61 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v50;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v50 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v28 = [v27 requestID:v43, v44];
        if (v28)
        {
          BOOL v29 = (void *)v28;
          uint64_t v30 = [v27 request];
          if (v30)
          {
            v31 = (void *)v30;
            id v32 = [v27 sessionID];

            if (v32)
            {
              if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
              {
                v43 = [v27 requestID];
                LogPrintF();
              }
              v34 = [v27 requestID:v43];
              id v38 = [v27 request];
              v39 = [v27 options];
              id v40 = [v27 responseHandler];
              v41 = [v27 sessionID];
              [(RPRemoteDisplayXPCConnection *)self _receivedRequestID:v34 request:v38 options:v39 responseHandler:v40 sessionID:v41];

              goto LABEL_35;
            }
          }
          else
          {
          }
        }
        uint64_t v33 = [v27 eventID];
        if (!v33) {
          continue;
        }
        v34 = (void *)v33;
        uint64_t v35 = [v27 event];
        if (!v35) {
          goto LABEL_36;
        }
        id v36 = (void *)v35;
        v37 = [v27 sessionID];

        if (!v37) {
          continue;
        }
        if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
        {
          v43 = [v27 eventID];
          LogPrintF();
        }
        v34 = [v27 eventID:v43];
        id v38 = [v27 event];
        v39 = [v27 options];
        id v40 = [v27 sessionID];
        [(RPRemoteDisplayXPCConnection *)self _receivedEventID:v34 event:v38 options:v39 sessionID:v40];
LABEL_35:

LABEL_36:
      }
      id v24 = [v22 countByEnumeratingWithState:&v49 objects:v61 count:16];
    }
    while (v24);
  }

  v42 = [v48 receivedMessages];
  [v42 removeAllObjects];
}

- (void)sessionEndedWithID:(id)a3 netCnx:(id)a4
{
  id v11 = a3;
  v6 = (RPConnection *)a4;
  if (self->_activatedServer)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      id v10 = v11;
      LogPrintF();
    }
    if (GestaltGetDeviceClass() == 1 || GestaltGetDeviceClass() == 3) {
      -[RPRemoteDisplayDaemon _postNotificationForWombatActivity:](self->_daemon, "_postNotificationForWombatActivity:", 2, v10);
    }
    unsigned int v7 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
    [v7 remoteDisplaySessionEndedWithID:v11];

    [(NSMutableSet *)self->_serverNetCnxs removeObject:v6];
    if (self->_activeNetCnx == v6)
    {
      self->_activeNetCnx = 0;
    }
  }
  else if (self->_activatedSession)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      id v10 = v11;
      LogPrintF();
    }
    id v8 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
    id v9 = RPErrorF();
    [v8 remoteDisplaySessionError:v9];
  }
  else if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_receivedEventID:(id)a3 event:(id)a4 options:(id)a5 sessionID:(id)a6
{
  id v17 = a6;
  activatedServer = self->_activatedServer;
  xpcCnx = self->_xpcCnx;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [(NSXPCConnection *)xpcCnx remoteObjectProxy];
  v16 = v15;
  if (activatedServer) {
    [v15 remoteDisplayReceivedEventID:v14 event:v13 options:v12 sessionID:v17];
  }
  else {
    [v15 remoteDisplayReceivedEventID:v14 event:v13 options:v12];
  }
}

- (void)_receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6 sessionID:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  activatedServer = self->_activatedServer;
  xpcCnx = self->_xpcCnx;
  if (activatedServer)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000B8724;
    v28[3] = &unk_100122D28;
    uint64_t v25 = &v29;
    id v16 = v12;
    id v29 = v16;
    id v17 = a5;
    id v18 = a4;
    id v19 = a3;
    uint64_t v20 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v28];
    [v20 remoteDisplayReceivedRequestID:v19 request:v18 options:v17 responseHandler:v16 sessionID:v13];
  }
  else
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000B87E0;
    v26[3] = &unk_100122D28;
    uint64_t v25 = &v27;
    id v21 = v12;
    id v27 = v21;
    id v22 = a5;
    id v23 = a4;
    id v24 = a3;
    uint64_t v20 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v26];
    [v20 remoteDisplayReceivedRequestID:v24 request:v23 options:v22 responseHandler:v21];
  }
}

- (void)_authCompletion:(id)a3
{
  id v6 = a3;
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    id v5 = v6;
    LogPrintF();
  }
  v4 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
  [v4 remoteDisplayAuthCompleted:v6];
}

- (void)showPassword:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v9 = a3;
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = v4;
    id v8 = &unk_10011B293;
    LogPrintF();
  }
  id v6 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
  [v6 remoteDisplayShowPassword:v9 flags:v4];
}

- (void)hidePasswordWithFlags:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v5 = v3;
    id v6 = &unk_10011B293;
    LogPrintF();
  }
  id v7 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
  [v7 remoteDisplayHidePasswordWithFlags:v3];
}

- (void)_promptForPasswordWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    id v8 = &unk_10011B293;
    uint64_t v9 = v4;
    uint64_t v7 = v5;
    LogPrintF();
  }
  id v10 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
  [v10 remoteDisplayPromptForPasswordWithFlags:v5 throttleSeconds:v4];
}

- (void)updateErrorFlags:(unint64_t)a3
{
  uint64_t v5 = self->_activatedDiscovery;
  if (v5)
  {
    id v11 = v5;
    BOOL v6 = [(RPRemoteDisplayDiscovery *)v5 errorFlags] == (id)a3;
    uint64_t v5 = v11;
    if (!v6)
    {
      [(RPRemoteDisplayDiscovery *)v11 setErrorFlags:a3];
      if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
      {
        unint64_t v9 = a3;
        id v10 = &unk_10011B407;
        uint64_t v8 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
        LogPrintF();
      }
      uint64_t v7 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
      [v7 remoteDisplayUpdateErrorFlags:a3];

      uint64_t v5 = v11;
    }
  }
}

- (void)_handleContinuityCameraDisabledAlertResponse
{
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v2 = +[NSURL URLWithString:@"prefs:root=General&path=CONTINUITY_SPEC"];
  uint64_t v3 = dispatch_queue_create("RPOpenURL", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B8D90;
  block[3] = &unk_100121158;
  id v6 = v2;
  id v4 = v2;
  dispatch_async(v3, block);
}

- (void)_showContinuityCameraDisabledAlert
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B8ED4;
  block[3] = &unk_100121158;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)remoteDisplayActivateDiscovery:(id)a3 completion:(id)a4
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v32 = 0;
  unsigned __int8 v9 = [(RPRemoteDisplayXPCConnection *)self _entitledAndReturnError:&v32];
  id v10 = v32;
  if (v9)
  {
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      id v27 = v7;
      uint64_t v28 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    [v7 setDispatchQueue:self->_dispatchQueue v27, v28];
    id v11 = +[RPDaemon sharedDaemon];
    id v12 = [v11 errorFlags];

    [v7 setErrorFlags:v12];
    objc_storeStrong((id *)&self->_activatedDiscovery, a3);
    activatedDiscoverySet = self->_daemon->_activatedDiscoverySet;
    if (!activatedDiscoverySet)
    {
      id v14 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      daemon = self->_daemon;
      id v16 = daemon->_activatedDiscoverySet;
      daemon->_activatedDiscoverySet = v14;

      activatedDiscoverySet = self->_daemon->_activatedDiscoverySet;
    }
    [(NSMutableSet *)activatedDiscoverySet addObject:v7];
    if (v8) {
      v8[2](v8, v12, v10);
    }
    [(RPRemoteDisplayDaemon *)self->_daemon _updateForXPCClientChange];
    discoveredDevices = self->_daemon->_discoveredDevices;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000B93A0;
    v29[3] = &unk_100124E68;
    id v30 = v7;
    v31 = self;
    [(NSMutableDictionary *)discoveredDevices enumerateKeysAndObjectsUsingBlock:v29];
    id v18 = [(RPRemoteDisplayDaemon *)self->_daemon deviceConfirmedIdentifier];
    BOOL v19 = v18 != 0;

    uint64_t v20 = [(RPRemoteDisplayDaemon *)self->_daemon deviceConfirmedIdentifier];

    id v21 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
    id v22 = [(RPRemoteDisplayDaemon *)self->_daemon deviceConfirmedIdentifier];
    if (v20) {
      uint64_t v23 = 1;
    }
    else {
      uint64_t v23 = 2;
    }
    [v21 remoteDisplayNotifyDiscoverySessionState:v19 forDevice:v22 startReason:v23];

    id v24 = [(NSXPCConnection *)self->_xpcCnx valueForEntitlement:@"com.apple.RemoteDisplay.Dedicated"];
    if (v24)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v24 BOOLValue])
        {
          uint64_t v25 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
          id v26 = [(RPRemoteDisplayDaemon *)self->_daemon dedicatedDevice];
          [v25 remoteDisplayDedicatedDeviceChanged:v26];
        }
      }
    }
  }
  else if (v8)
  {
    v8[2](v8, 0, v10);
  }
}

- (void)remoteDisplayActivateServer:(id)a3 completion:(id)a4
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v20 = 0;
  unsigned __int8 v9 = [(RPRemoteDisplayXPCConnection *)self _entitledAndReturnError:&v20];
  id v10 = v20;
  if (v9)
  {
    id v11 = [v7 serviceType];

    if (!v11) {
      [v7 setServiceType:@"_rdlink._tcp"];
    }
    activatedServerXPCCnxMap = self->_daemon->_activatedServerXPCCnxMap;
    id v13 = [v7 serviceType];
    id v14 = [(NSMutableDictionary *)activatedServerXPCCnxMap objectForKey:v13];

    if (v14)
    {
      if (v8)
      {
        uint64_t v15 = RPErrorF();
        v8[2](v8, v15);
      }
    }
    else
    {
      if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
      {
        id v17 = v7;
        uint64_t v18 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
        LogPrintF();
      }
      [v7 setDispatchQueue:self->_dispatchQueue v17, v18];
      objc_storeStrong((id *)&self->_activatedServer, a3);
      [(RPRemoteDisplayDaemon *)self->_daemon _handleServerActivation:self];
      if (v8) {
        v8[2](v8, v10);
      }
      dispatchQueue = self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000B964C;
      block[3] = &unk_100121158;
      void block[4] = self;
      dispatch_async(dispatchQueue, block);
      [(RPRemoteDisplayDaemon *)self->_daemon _update];
    }
  }
  else if (v8)
  {
    v8[2](v8, v10);
  }
}

- (void)remoteDisplayActivateSession:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_1000B9F98;
  v63[3] = &unk_100121F48;
  id v64 = 0;
  id v9 = v8;
  id v65 = v9;
  id v10 = objc_retainBlock(v63);
  id v62 = 0;
  unsigned __int8 v11 = [(RPRemoteDisplayXPCConnection *)self _entitledAndReturnError:&v62];
  id v12 = v62;
  if (v11)
  {
    id v13 = [v7 pairingInfo];

    if (v13)
    {
      id v14 = [(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:@"com.apple.rapport.SessionPaired"];
      unsigned __int8 v15 = [v14 isEqual:&__kCFBooleanTrue];

      if ((v15 & 1) == 0)
      {
        self->_entitled = 0;
        if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
        {
          [(NSXPCConnection *)self->_xpcCnx processIdentifier];
          LogPrintF();
        }
        goto LABEL_22;
      }
    }
    if (self->_activatedSession)
    {
LABEL_22:
      RPErrorF();
      BOOL v19 = v12;
      id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

      goto LABEL_24;
    }
    id v16 = [v7 serviceType];
    if ([@"com.apple.ddui.guestpairing" isEqualToString:v16])
    {
      int v17 = off_100142800[0]();

      if (v17)
      {
        [(RPRemoteDisplayXPCConnection *)self _showContinuityCameraDisabledAlert];
        goto LABEL_22;
      }
    }
    else
    {
    }
    uint64_t v18 = [v7 destinationDevice];
    BOOL v19 = [v18 identifier];

    if (!v19
      || (-[RPRemoteDisplayDaemon _findMatchingDeviceWithIdentifier:](self->_daemon, "_findMatchingDeviceWithIdentifier:", v19), (uint64_t v20 = objc_claimAutoreleasedReturnValue()) == 0)&& (([v7 pairingInfo], v23 = objc_claimAutoreleasedReturnValue(), v23, !v23)|| (objc_msgSend(v7, "destinationDevice"), (uint64_t v20 = objc_claimAutoreleasedReturnValue()) == 0)))
    {
      uint64_t v24 = RPErrorF();
      uint64_t v25 = v12;
      id v12 = (id)v24;
LABEL_77:

      goto LABEL_23;
    }
    id v59 = (void *)v20;
    [v7 setDaemonDevice:];
    id v21 = [v7 serviceType];

    if (!v21) {
      [v7 setServiceType:@"_rdlink._tcp"];
    }
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v22 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      long long v52 = [v7 serviceType];
      id v54 = v59;
      uint64_t v49 = v22;
      LogPrintF();
    }
    if ((objc_msgSend(v7, "controlFlags", v49, v52, v54) & 0x40000) != 0)
    {
      v58 = [v59 bonjourDevice];
      id v30 = [v58 deviceInfo];
      char Int64Ranged = CFDictionaryGetInt64Ranged();

      if (!v58 || (Int64Ranged & 0x18) == 0)
      {
        uint64_t v32 = RPErrorF();

        id v12 = (id)v32;
LABEL_76:

        uint64_t v25 = v59;
        goto LABEL_77;
      }
      id v29 = "Infra";
      goto LABEL_47;
    }
    if (([v7 controlFlags] & 0x20000) == 0)
    {
      id v26 = [v59 bonjourDevice];
      id v27 = [v26 deviceInfo];
      char v57 = CFDictionaryGetInt64Ranged();

      if (([v7 controlFlags] & 0x200000) != 0
        || (daemon = self->_daemon, daemon->_prefNoInfra))
      {
        if ((v57 & 0x18) != 0 && !self->_daemon->_prefNoUSB)
        {
          v58 = [v59 bonjourDevice];
          id v29 = "USB";
          goto LABEL_44;
        }
      }
      else if (!daemon->_prefNoUSB)
      {
        v58 = [v59 bonjourDevice];
        if ((v57 & 0x18) != 0) {
          id v29 = "USB";
        }
        else {
          id v29 = "Infra";
        }
LABEL_44:
        if (v58) {
          goto LABEL_47;
        }
      }
    }
    v58 = [(NSMutableDictionary *)self->_daemon->_bonjourAWDLDevices objectForKeyedSubscript:v19];
    if (!v58)
    {
      if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
      {
        long long v50 = (const char *)v59;
        LogPrintF();
      }
      -[RPRemoteDisplayDaemon addNeedsAWDLPeer:](self->_daemon, "addNeedsAWDLPeer:", v59, v50);
      if (!self->_clientNetCnx)
      {
        uint64_t v35 = (RPConnection *)objc_alloc_init((Class)RPConnection);
        clientNetCnx = self->_clientNetCnx;
        self->_clientNetCnx = v35;

        [(RPConnection *)self->_clientNetCnx setDispatchQueue:self->_dispatchQueue];
        v37 = +[RPIdentityDaemon sharedIdentityDaemon];
        [(RPConnection *)self->_clientNetCnx setIdentityDaemon:v37];

        objc_storeStrong((id *)&self->_activeNetCnx, self->_clientNetCnx);
      }
      [v7 setNeedsAWDL:1];
      v58 = 0;
      goto LABEL_60;
    }
    [v7 setBonjourDevice:];
    [v7 setNeedsAWDL:1];
    id v29 = "AWDL";
LABEL_47:
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      id v55 = [v7 serviceType];
      v56 = v58;
      long long v50 = v29;
      v53 = v59;
      LogPrintF();
    }
    id v61 = v12;
    unsigned __int8 v33 = -[RPRemoteDisplayXPCConnection netConnectionStartWithDevice:session:error:](self, "netConnectionStartWithDevice:session:error:", v59, v7, &v61, v50, v53, v55, v56);
    id v34 = v61;

    id v12 = v34;
    if ((v33 & 1) == 0) {
      goto LABEL_76;
    }
LABEL_60:
    [v7 setDispatchQueue:self->_dispatchQueue];
    [v7 setXpcCnx:self->_xpcCnx];
    objc_storeStrong((id *)&self->_activatedSession, a3);
    activatedSessionSet = self->_daemon->_activatedSessionSet;
    if (!activatedSessionSet)
    {
      v39 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      id v40 = self->_daemon;
      v41 = v40->_activatedSessionSet;
      v40->_activatedSessionSet = v39;

      activatedSessionSet = self->_daemon->_activatedSessionSet;
    }
    [(NSMutableSet *)activatedSessionSet addObject:v7];
    if (v9) {
      (*((void (**)(id, id))v9 + 2))(v9, v12);
    }
    v42 = [v7 pairingInfo];

    if (!v42) {
      goto LABEL_75;
    }
    v43 = [v7 pairingInfo];
    id v60 = 0;
    id v44 = +[NSJSONSerialization JSONObjectWithData:v43 options:16 error:&v60];
    id v45 = v60;

    if (v45)
    {
      if (dword_1001426A0 > 30)
      {
LABEL_74:
        id v46 = objc_alloc_init((Class)RPRemoteDisplayDevice);
        v47 = [v44 objectForKeyedSubscript:@"_pubID"];
        [v46 setIdentifier:v47];

        v48 = [v44 objectForKeyedSubscript:@"_pinC"];
        [(RPConnection *)self->_clientNetCnx setPassword:v48];

        [(RPConnection *)self->_clientNetCnx setPasswordType:10];
        [(RPConnection *)self->_clientNetCnx setPreferredIdentityType:13];
        [v7 setNeedsAWDL:1];

LABEL_75:
        [(RPRemoteDisplayDaemon *)self->_daemon _update];
        goto LABEL_76;
      }
      if (dword_1001426A0 != -1 || _LogCategory_Initialize())
      {
        id v51 = v45;
        LogPrintF();
      }
    }
    if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      id v51 = v44;
      LogPrintF();
    }
    goto LABEL_74;
  }
LABEL_24:
  ((void (*)(void *))v10[2])(v10);
}

- (void)remoteDisplayInvalidateSessionID:(id)a3
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
    id v6 = v8;
    LogPrintF();
  }
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_daemon->_tcpServerConnections, "objectForKeyedSubscript:", v8, v6, v7);
  uint64_t v5 = v4;
  if (v4) {
    [v4 invalidate];
  }
}

- (void)remoteDisplayInvalidateClientSession
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
  {
    [(NSXPCConnection *)self->_xpcCnx processIdentifier];
    LogPrintF();
  }
  if (self->_activatedSession) {
    -[NSMutableSet removeObject:](self->_daemon->_activatedSessionSet, "removeObject:");
  }
  clientNetCnx = self->_clientNetCnx;
  if (clientNetCnx)
  {
    [(RPConnection *)clientNetCnx invalidate];
    id v4 = self->_clientNetCnx;
  }
  else
  {
    id v4 = 0;
  }
  self->_clientNetCnx = 0;

  activatedSession = self->_activatedSession;
  self->_activatedSession = 0;
}

- (void)remoteDisplaySendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v19 = 0;
  unsigned __int8 v14 = [(RPRemoteDisplayXPCConnection *)self _entitledAndReturnError:&v19];
  id v15 = v19;
  if (v14)
  {
    id v16 = self->_activeNetCnx;
    int v17 = v16;
    if (v16)
    {
      [(RPConnection *)v16 sendEncryptedEventID:v10 event:v11 options:v12 completion:v13];
    }
    else if (v13)
    {
      uint64_t v18 = RPErrorF();
      v13[2](v13, v18);
    }
  }
  else if (v13)
  {
    v13[2](v13, v15);
  }
}

- (void)remoteDisplayStartPairingServerWithCompletion:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  uint64_t v5 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2(dispatchQueue);
  if (self->_activatedServer)
  {
    id v6 = +[NSUUID UUID];
    id v7 = [v6 UUIDString];

    [(RPRemoteDisplayServer *)self->_activatedServer setPasswordType:10];
    [(RPRemoteDisplayServer *)self->_activatedServer setPassword:v7];
    [(RPRemoteDisplayDaemon *)self->_daemon _startPairingServerWithPassword:v7 completion:v5];
  }
  else
  {
    RPErrorF();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0);
  }
}

- (void)remoteDisplayStopPairingServer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  daemon = self->_daemon;

  [(RPRemoteDisplayDaemon *)daemon _stopPairingServer];
}

- (void)remoteDisplaySendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v18 = 0;
  unsigned __int8 v14 = [(RPRemoteDisplayXPCConnection *)self _entitledAndReturnError:&v18];
  id v15 = v18;
  if (v14)
  {
    activeNetCnx = self->_activeNetCnx;
    if (activeNetCnx)
    {
      [(RPConnection *)activeNetCnx sendEncryptedRequestID:v10 request:v11 xpcID:self->_xpcID options:v12 responseHandler:v13];
    }
    else
    {
      int v17 = RPErrorF();
      (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0, 0, v17);
    }
  }
  else
  {
    (*((void (**)(id, void, void, id))v13 + 2))(v13, 0, 0, v15);
  }
}

- (void)remoteDisplayTryPassword:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v9 = 0;
  unsigned int v5 = [(RPRemoteDisplayXPCConnection *)self _entitledAndReturnError:&v9];
  id v6 = v9;
  if (v5)
  {
    id v7 = self->_activeNetCnx;
    id v8 = v7;
    if (v7)
    {
      [(RPConnection *)v7 tryPassword:v4];
    }
    else if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
  }
}

- (void)remoteDisplayPersonCanceled:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v8 = 0;
  unsigned int v4 = [(RPRemoteDisplayXPCConnection *)self _entitledAndReturnError:&v8];
  id v5 = v8;
  if (v4)
  {
    id v6 = [(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:@"com.apple.RemoteDisplay.SessionState"];
    unsigned __int8 v7 = [v6 isEqual:&__kCFBooleanTrue];

    if (v7)
    {
      [(RPRemoteDisplayDaemon *)self->_daemon _sendConfirmationCancelToAllDevices];
    }
    else if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
    {
      [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
  }
}

- (void)remoteDisplayPersonSelected:(id)a3 forDedicatedPairing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v12 = 0;
  unsigned int v7 = [(RPRemoteDisplayXPCConnection *)self _entitledAndReturnError:&v12];
  id v8 = v12;
  if (!v7) {
    goto LABEL_14;
  }
  id v9 = [(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:@"com.apple.RemoteDisplay.SessionState"];
  unsigned __int8 v10 = [v9 isEqual:&__kCFBooleanTrue];

  if ((v10 & 1) == 0)
  {
    if (dword_1001426A0 > 90 || dword_1001426A0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_14;
    }
    [(NSXPCConnection *)self->_xpcCnx processIdentifier];
LABEL_10:
    LogPrintF();
    goto LABEL_14;
  }
  id v11 = [v6 accountID];

  if (v11)
  {
    [(RPRemoteDisplayDaemon *)self->_daemon _requestConfirmationFromPerson:v6 forDedicated:v4];
    goto LABEL_14;
  }
  if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize())) {
    goto LABEL_10;
  }
LABEL_14:
}

- (void)remoteDisplayChangeDiscoverySessionStateForDevice:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v30 = 0;
  unsigned int v8 = [(RPRemoteDisplayXPCConnection *)self _entitledAndReturnError:&v30];
  id v9 = v30;
  if (v8)
  {
    unsigned __int8 v10 = [(NSXPCConnection *)self->_xpcCnx valueForEntitlement:@"com.apple.RemoteDisplay.SessionState"];
    if (!v10
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || ([v10 BOOLValue] & 1) == 0)
    {
      if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
      {
        [(NSXPCConnection *)self->_xpcCnx processIdentifier];
        LogPrintF();
      }
      goto LABEL_32;
    }
    p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___NFConnectionHandoverReceiverDelegate + 56);
    if (v6)
    {
      if ([v7 isEqualToString:@"EnterOnPersonal"]) {
        uint64_t v12 = 2;
      }
      else {
        uint64_t v12 = 0;
      }
      uint64_t v13 = [(RPRemoteDisplayDaemon *)self->_daemon deviceConfirmedIdentifier];
      if (!v13
        || (unsigned __int8 v14 = (void *)v13,
            [(RPRemoteDisplayDaemon *)self->_daemon deviceConfirmedIdentifier],
            id v15 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v16 = [v6 isEqualToString:v15],
            v15,
            v14,
            (v16 & 1) != 0))
      {
LABEL_27:
        int v21 = *((_DWORD *)p_inst_props + 424);
        if (v21 <= 30 && (v21 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v22 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
          id v29 = (&off_100124FB8)[v12];
          uint64_t v24 = v22;
          LogPrintF();
          -[RPRemoteDisplayDaemon _changeDiscoverySessionStateForDevice:startReason:](self->_daemon, "_changeDiscoverySessionStateForDevice:startReason:", v6, v12, v24, v6, v7, v29);
        }
        else
        {
          -[RPRemoteDisplayDaemon _changeDiscoverySessionStateForDevice:startReason:](self->_daemon, "_changeDiscoverySessionStateForDevice:startReason:", v6, v12, v23, v25, v27, v28);
        }
LABEL_32:

        goto LABEL_33;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
    if ([v7 isEqualToString:@"User disconnect"])
    {
      int v17 = [(RPRemoteDisplayDaemon *)self->_daemon dedicatedDevice];
      id v18 = [(RPRemoteDisplayDaemon *)self->_daemon deviceConfirmedIdentifier];
      id v19 = [v17 idsDeviceIdentifier];
      unsigned int v20 = [v18 isEqualToString:v19];

      if (v20)
      {
        if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
        {
          id v26 = [(RPRemoteDisplayDaemon *)self->_daemon deviceConfirmedIdentifier];
          LogPrintF();

          -[RPRemoteDisplayDaemon saveDedicatedDevice:](self->_daemon, "saveDedicatedDevice:", 0, v7, v26);
        }
        else
        {
          -[RPRemoteDisplayDaemon saveDedicatedDevice:](self->_daemon, "saveDedicatedDevice:", 0, v23, v25);
        }
      }

      p_inst_props = &OBJC_PROTOCOL___NFConnectionHandoverReceiverDelegate.inst_props;
    }
    [(RPRemoteDisplayDaemon *)self->_daemon _sendDiscoverySessionExitWithReason:v7];
    goto LABEL_27;
  }
LABEL_33:
}

- (void)remoteDisplayChangeDedicatedDevice:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (_os_feature_enabled_impl())
  {
    id v11 = 0;
    unsigned int v5 = [(RPRemoteDisplayXPCConnection *)self _entitledAndReturnError:&v11];
    id v6 = v11;
    if (v5)
    {
      id v7 = [(NSXPCConnection *)self->_xpcCnx valueForEntitlement:@"com.apple.RemoteDisplay.Dedicated"];
      if (v7
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && ([v7 BOOLValue] & 1) != 0)
      {
        if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v9 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
          LogPrintF();
          -[RPRemoteDisplayDaemon saveDedicatedDevice:](self->_daemon, "saveDedicatedDevice:", v4, v9, v4);
        }
        else
        {
          -[RPRemoteDisplayDaemon saveDedicatedDevice:](self->_daemon, "saveDedicatedDevice:", v4, v8, v10);
        }
      }
      else if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
      {
        [(NSXPCConnection *)self->_xpcCnx processIdentifier];
        LogPrintF();
      }
    }
  }
}

- (void)remoteDisplayDedicatedDeviceConfirmationWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (_os_feature_enabled_impl())
  {
    id v12 = 0;
    unsigned __int8 v5 = [(RPRemoteDisplayXPCConnection *)self _entitledAndReturnError:&v12];
    id v6 = v12;
    if (v5)
    {
      id v7 = [(NSXPCConnection *)self->_xpcCnx valueForEntitlement:@"com.apple.RemoteDisplay.Dedicated"];
      if (v7
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && ([v7 BOOLValue] & 1) != 0)
      {
        uint64_t v8 = [(RPRemoteDisplayDaemon *)self->_daemon dedicatedDevice];
        if (v8)
        {
          if (dword_1001426A0 <= 30 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v10 = v8;
            uint64_t v11 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
            LogPrintF();
          }
          -[RPRemoteDisplayDaemon _requestConfirmationFromDevice:forDedicated:](self->_daemon, "_requestConfirmationFromDevice:forDedicated:", v8, 1, v10, v11);
          if (v4) {
            v4[2](v4, v6);
          }
        }
        else if (v4)
        {
          uint64_t v9 = RPErrorF();
          v4[2](v4, v9);
        }
      }
      else if (dword_1001426A0 <= 90 && (dword_1001426A0 != -1 || _LogCategory_Initialize()))
      {
        [(NSXPCConnection *)self->_xpcCnx processIdentifier];
        LogPrintF();
      }

      goto LABEL_26;
    }
    if (!v4)
    {
LABEL_26:

      goto LABEL_27;
    }
LABEL_13:
    v4[2](v4, v6);
    goto LABEL_26;
  }
  if (v4)
  {
    RPErrorF();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
LABEL_27:
}

- (RPRemoteDisplayDiscovery)activatedDiscovery
{
  return self->_activatedDiscovery;
}

- (RPConnection)activeNetCnx
{
  return self->_activeNetCnx;
}

- (void)setActiveNetCnx:(id)a3
{
}

- (RPRemoteDisplayServer)activatedServer
{
  return self->_activatedServer;
}

- (RPRemoteDisplaySession)activatedSession
{
  return self->_activatedSession;
}

- (RPConnection)clientNetCnx
{
  return self->_clientNetCnx;
}

- (void)setClientNetCnx:(id)a3
{
}

- (RPRemoteDisplayDaemon)daemon
{
  return self->_daemon;
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

- (NSMutableSet)serverNetCnxs
{
  return self->_serverNetCnxs;
}

- (void)setServerNetCnxs:(id)a3
{
}

- (BOOL)usingNearbyActionV2
{
  return self->_usingNearbyActionV2;
}

- (void)setUsingNearbyActionV2:(BOOL)a3
{
  self->_usingNearbyActionV2 = a3;
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
  objc_storeStrong((id *)&self->_serverNetCnxs, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_clientNetCnx, 0);
  objc_storeStrong((id *)&self->_activatedSession, 0);
  objc_storeStrong((id *)&self->_activatedServer, 0);
  objc_storeStrong((id *)&self->_activeNetCnx, 0);

  objc_storeStrong((id *)&self->_activatedDiscovery, 0);
}

@end