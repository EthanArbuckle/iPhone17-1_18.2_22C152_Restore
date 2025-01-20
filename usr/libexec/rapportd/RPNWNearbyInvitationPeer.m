@interface RPNWNearbyInvitationPeer
+ (const)responseCodeToString:(int)a3;
+ (const)statusCodeToString:(int)a3;
+ (id)createNWEndpointForEndpoint:(id)a3 agentID:(id)a4 applicationService:(id)a5;
+ (id)createNWEndpointWithID:(id)a3 agentID:(id)a4 applicationService:(id)a5;
- (BOOL)findNearbyInvitationListenerAndCreateConnection:(id)a3 applicationService:(id)a4 listenerID:(id)a5 connectionID:(id)a6 agentClient:(id)a7;
- (RPNWNearbyInvitationPeer)init;
- (RPNearbyInvitationDevice)destinationDevice;
- (RPNearbyInvitationDiscovery)nearbyInvitationDiscovery;
- (RPNearbyInvitationServer)nearbyInvitationServer;
- (RPNearbyInvitationSession)nearbyInvitationSession;
- (void)connectToPeer:(id)a3 inboundConnection:(BOOL)a4 applicationService:(id)a5 listenerID:(id)a6 connectionID:(id)a7 connectHandler:(id)a8 disconnectHandler:(id)a9;
- (void)dealloc;
- (void)handleConnectionData:(BOOL)a3;
- (void)handleConnectionRequest:(id)a3 agentClient:(id)a4;
- (void)receiveDataForConnection:(id)a3 statusHandler:(id)a4;
- (void)receiveWithRequestID:(id)a3 receiveHandler:(id)a4;
- (void)sendDataForConnection:(id)a3 applicationService:(id)a4 connectionID:(id)a5 responseHandler:(id)a6;
- (void)sendStatusUpdateForConnection:(id)a3 connectionID:(id)a4 status:(int)a5 responseHandler:(id)a6;
- (void)sendWithRequestID:(id)a3 data:(id)a4 status:(int)a5 applicationService:(id)a6 listenerID:(id)a7 connectionID:(id)a8 responseHandler:(id)a9;
- (void)setDestinationDevice:(id)a3;
- (void)setNearbyInvitationDiscovery:(id)a3;
- (void)setNearbyInvitationServer:(id)a3;
- (void)setNearbyInvitationSession:(id)a3;
- (void)startDiscovery:(id)a3 foundHandler:(id)a4 updateHandler:(id)a5 lostHandler:(id)a6 invalidationHandler:(id)a7;
- (void)startServer:(id)a3 withCompletion:(id)a4 disconnectHandler:(id)a5;
- (void)stopDiscovery;
- (void)stopServer;
@end

@implementation RPNWNearbyInvitationPeer

- (RPNWNearbyInvitationPeer)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPNWNearbyInvitationPeer;
  v2 = [(RPNWNearbyInvitationPeer *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)RPNWNearbyInvitationPeer;
  [(RPNWNearbyInvitationPeer *)&v2 dealloc];
}

- (void)startDiscovery:(id)a3 foundHandler:(id)a4 updateHandler:(id)a5 lostHandler:(id)a6 invalidationHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (self->_nearbyInvitationDiscovery)
  {
    if (dword_100141CF8 <= 90 && (dword_100141CF8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    if (dword_100141CF8 <= 30 && (dword_100141CF8 != -1 || _LogCategory_Initialize()))
    {
      v17 = self;
      id v18 = objc_alloc_init((Class)NSMutableString);
      [v18 appendFormat:@"%p", v17];

      LogPrintF();
    }
    v19 = (RPNearbyInvitationDiscovery *)objc_alloc_init((Class)RPNearbyInvitationDiscovery);
    nearbyInvitationDiscovery = self->_nearbyInvitationDiscovery;
    self->_nearbyInvitationDiscovery = v19;

    v21 = +[RPNWNetworkAgent sharedNetworkAgent];
    v22 = [v21 dispatchQueue];
    [(RPNearbyInvitationDiscovery *)self->_nearbyInvitationDiscovery setDispatchQueue:v22];

    [(RPNearbyInvitationDiscovery *)self->_nearbyInvitationDiscovery setDiscoveryFlags:1];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10007573C;
    v31[3] = &unk_1001235E8;
    id v32 = v13;
    [(RPNearbyInvitationDiscovery *)self->_nearbyInvitationDiscovery setDeviceFoundHandler:v31];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10007574C;
    v29[3] = &unk_100123610;
    id v30 = v14;
    [(RPNearbyInvitationDiscovery *)self->_nearbyInvitationDiscovery setDeviceChangedHandler:v29];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100075764;
    v27[3] = &unk_1001235E8;
    id v28 = v15;
    [(RPNearbyInvitationDiscovery *)self->_nearbyInvitationDiscovery setDeviceLostHandler:v27];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100075774;
    v25[3] = &unk_100123638;
    id v26 = v16;
    [(RPNearbyInvitationDiscovery *)self->_nearbyInvitationDiscovery setInvalidationHandler:v25];
    v23 = self->_nearbyInvitationDiscovery;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100075784;
    v24[3] = &unk_100121908;
    v24[4] = self;
    [(RPNearbyInvitationDiscovery *)v23 activateWithCompletion:v24];
  }
}

- (void)stopDiscovery
{
  if (!self->_nearbyInvitationDiscovery)
  {
    if (dword_100141CF8 <= 30 && (dword_100141CF8 != -1 || _LogCategory_Initialize()))
    {
      v3 = self;
      id v4 = objc_alloc_init((Class)NSMutableString);
      [v4 appendFormat:@"%p", v3];

      LogPrintF();
    }
    nearbyInvitationDiscovery = self->_nearbyInvitationDiscovery;
    [(RPNearbyInvitationDiscovery *)nearbyInvitationDiscovery invalidate];
  }
}

- (void)startServer:(id)a3 withCompletion:(id)a4 disconnectHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_nearbyInvitationServer)
  {
    if (dword_100141CF8 <= 90 && (dword_100141CF8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    v11 = (RPNearbyInvitationServer *)objc_alloc_init((Class)RPNearbyInvitationServer);
    nearbyInvitationServer = self->_nearbyInvitationServer;
    self->_nearbyInvitationServer = v11;

    id v13 = [v8 applicationService];
    [(RPNearbyInvitationServer *)self->_nearbyInvitationServer setServiceType:v13];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100075BA4;
    v19[3] = &unk_100123688;
    v19[4] = self;
    id v21 = v10;
    id v20 = v8;
    [(RPNearbyInvitationServer *)self->_nearbyInvitationServer setSessionStartHandler:v19];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100075F70;
    v18[3] = &unk_1001236B0;
    v18[4] = self;
    [(RPNearbyInvitationServer *)self->_nearbyInvitationServer setSessionEndedHandler:v18];
    [(RPNearbyInvitationServer *)self->_nearbyInvitationServer setInvalidationHandler:&stru_1001236D0];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000760B0;
    v17[3] = &unk_100121158;
    v17[4] = self;
    [(RPNearbyInvitationServer *)self->_nearbyInvitationServer setInterruptionHandler:v17];
    id v14 = self->_nearbyInvitationServer;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10007615C;
    v15[3] = &unk_1001236F8;
    v15[4] = self;
    id v16 = v9;
    [(RPNearbyInvitationServer *)v14 activateWithCompletion:v15];
  }
}

- (void)stopServer
{
  nearbyInvitationServer = self->_nearbyInvitationServer;
  if (nearbyInvitationServer)
  {
    [(RPNearbyInvitationServer *)nearbyInvitationServer invalidate];
    id v4 = self->_nearbyInvitationServer;
    self->_nearbyInvitationServer = 0;
  }
}

- (void)connectToPeer:(id)a3 inboundConnection:(BOOL)a4 applicationService:(id)a5 listenerID:(id)a6 connectionID:(id)a7 connectHandler:(id)a8 disconnectHandler:(id)a9
{
  BOOL v13 = a4;
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (v13 && !self->_nearbyInvitationSession)
  {
    if (dword_100141CF8 <= 90 && (dword_100141CF8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*((void (**)(id, void, void))v19 + 2))(v19, 0, 0);
  }
  else
  {
    if (dword_100141CF8 <= 30 && (dword_100141CF8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v21 = (RPNearbyInvitationSession *)objc_alloc_init((Class)RPNearbyInvitationSession);
    nearbyInvitationSession = self->_nearbyInvitationSession;
    self->_nearbyInvitationSession = v21;

    v23 = +[RPNWNetworkAgent sharedNetworkAgent];
    v24 = [v23 dispatchQueue];
    [(RPNearbyInvitationSession *)self->_nearbyInvitationSession setDispatchQueue:v24];

    [(RPNearbyInvitationSession *)self->_nearbyInvitationSession setDestinationDevice:v15];
    v25 = self->_nearbyInvitationSession;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10007657C;
    v26[3] = &unk_100123748;
    id v27 = v15;
    id v32 = v19;
    id v28 = self;
    id v33 = v20;
    id v29 = v16;
    id v30 = v17;
    id v31 = v18;
    [(RPNearbyInvitationSession *)v25 activateWithCompletion:v26];
  }
}

- (BOOL)findNearbyInvitationListenerAndCreateConnection:(id)a3 applicationService:(id)a4 listenerID:(id)a5 connectionID:(id)a6 agentClient:(id)a7
{
  id v10 = a7;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = [RPNWNearbyInvitationConnection alloc];
  id v15 = [v13 destinationDevice];
  id v16 = +[NSUUID UUID];
  id v17 = [(RPNWNearbyInvitationConnection *)v14 initWithPeer:v15 session:v13 inbound:1 internal:1 applicationService:v12 connectionID:v11 endpointID:v16];

  [v10 setNearbyInvitationConnection:v17];
  id v18 = [v10 nearbyInvitationConnection];

  if (v18)
  {
    id v19 = [v10 listen_framer];
    +[RPNWFramer startConnection:v19];

    id v20 = [v10 nearbyInvitationConnection];
    [v20 setIsConnected:1];
  }
  return v18 != 0;
}

- (void)handleConnectionData:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100076C30;
  v3[3] = &unk_100123768;
  BOOL v4 = a3;
  [(RPNWNearbyInvitationPeer *)self receiveDataForConnection:v3 statusHandler:&stru_1001237A8];
}

- (void)handleConnectionRequest:(id)a3 agentClient:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007700C;
  v7[3] = &unk_1001237D0;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(RPNWNearbyInvitationPeer *)v8 receiveWithRequestID:@"com.apple.oneapi.nearbyinvitation.connection" receiveHandler:v7];
}

+ (id)createNWEndpointWithID:(id)a3 agentID:(id)a4 applicationService:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(RPNWNearbyInvitationEndpoint);
  [(RPNWNearbyInvitationEndpoint *)v11 setEndpointUUID:v10];

  id v12 = [a1 createNWEndpointForEndpoint:v11 agentID:v9 applicationService:v8];

  return v12;
}

+ (id)createNWEndpointForEndpoint:(id)a3 agentID:(id)a4 applicationService:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  [a5 UTF8String];
  v25[0] = 0;
  v25[1] = 0;
  id v9 = [v7 endpointUUID];
  [v9 getUUIDBytes:v25];

  application_service = (void *)nw_endpoint_create_application_service();
  if (v8)
  {
    v24[0] = 0;
    v24[1] = 0;
    [v8 getUUIDBytes:v24];
    nw_endpoint_set_agent_identifier();
  }
  id v11 = [v7 device];

  if (v11)
  {
    id v12 = [v7 device];
    id v13 = [v12 model];

    if (v13)
    {
      id v14 = [v7 device];
      id v15 = [v14 model];
      [v15 UTF8String];
      nw_endpoint_set_device_model();
    }
    id v16 = [v7 device];
    id v17 = [v16 identifier];

    if (v17)
    {
      id v18 = [v7 device];
      id v19 = [v18 identifier];
      [v19 UTF8String];
      nw_endpoint_set_device_id();
    }
    id v20 = [v7 device];
    unsigned int v21 = [v20 deviceColor];

    if (v21)
    {
      v22 = [v7 device];
      [v22 deviceColor];
      nw_endpoint_set_device_color();
    }
  }

  return application_service;
}

+ (const)responseCodeToString:(int)a3
{
  if (a3 > 3) {
    return "N/A";
  }
  else {
    return (&off_100123890)[a3];
  }
}

+ (const)statusCodeToString:(int)a3
{
  if ((a3 - 1) > 4) {
    return "N/A";
  }
  else {
    return (&off_1001238B0)[a3 - 1];
  }
}

- (void)receiveWithRequestID:(id)a3 receiveHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_nearbyInvitationSession)
  {
    if (dword_100141CF8 <= 30 && (dword_100141CF8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    nearbyInvitationSession = self->_nearbyInvitationSession;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100077584;
    v9[3] = &unk_1001237F8;
    id v10 = v6;
    id v11 = v7;
    [(RPNearbyInvitationSession *)nearbyInvitationSession registerRequestID:v10 options:0 handler:v9];
  }
  else if (dword_100141CF8 <= 90 && (dword_100141CF8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)sendWithRequestID:(id)a3 data:(id)a4 status:(int)a5 applicationService:(id)a6 listenerID:(id)a7 connectionID:(id)a8 responseHandler:(id)a9
{
  uint64_t v12 = *(void *)&a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = v20;
  v40 = v16;
  if (self->_nearbyInvitationSession)
  {
    v39 = v15;
    id v22 = objc_alloc_init((Class)NSMutableDictionary);
    id v23 = objc_alloc_init((Class)NSMutableString);
    [v22 setObject:&off_10012B438 forKeyedSubscript:@"version"];
    if (v16)
    {
      [v22 setObject:v16 forKeyedSubscript:@"request"];
      [v23 appendFormat:@" data=%zu bytes", [v16 length]];
    }
    else if (v12)
    {
      id v27 = +[NSNumber numberWithInt:v12];
      [v22 setObject:v27 forKeyedSubscript:@"status"];
      [v23 appendFormat:@" status=%s", +[RPNWNearbyInvitationPeer statusCodeToString:](RPNWNearbyInvitationPeer, "statusCodeToString:", v12)];
    }
    id v28 = v17;
    [v22 setObject:v17 forKeyedSubscript:@"applicationService"];
    if (v18)
    {
      id v29 = [v18 UUIDString];
      [v22 setObject:v29 forKeyedSubscript:@"listenerID"];

      [v23 appendFormat:@" listenerID=%@", v18];
    }
    v25 = v19;
    if (v19)
    {
      id v30 = [v19 UUIDString];
      [v22 setObject:v30 forKeyedSubscript:@"connectionID"];

      [v23 appendFormat:@" connectionID=%@", v19];
    }
    id v26 = v21;
    if (dword_100141CF8 <= 30 && (dword_100141CF8 != -1 || _LogCategory_Initialize()))
    {
      id v31 = [(RPNWNearbyInvitationPeer *)self destinationDevice];
      [v31 name];
      id v37 = v28;
      v35 = id v38 = v23;
      v36 = v39;
      LogPrintF();
    }
    nearbyInvitationSession = self->_nearbyInvitationSession;
    CFStringRef v45 = @"timeoutSeconds";
    v46 = &off_10012B2B8;
    id v33 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1, v35, v36, v37, v38);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100077E1C;
    v41[3] = &unk_100123820;
    v41[4] = self;
    v24 = v28;
    v34 = v23;
    id v15 = v39;
    id v42 = v39;
    id v43 = v24;
    id v44 = v26;
    [(RPNearbyInvitationSession *)nearbyInvitationSession sendRequestID:v42 request:v22 destinationID:@"rapport:rdid:DirectPeer" options:v33 responseHandler:v41];
  }
  else
  {
    v24 = v17;
    v25 = v19;
    id v26 = v20;
    if (dword_100141CF8 <= 90 && (dword_100141CF8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)receiveDataForConnection:(id)a3 statusHandler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100078168;
  v8[3] = &unk_100123848;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(RPNWNearbyInvitationPeer *)self receiveWithRequestID:@"com.apple.oneapi.nearbyinvitation.data" receiveHandler:v8];
}

- (void)sendDataForConnection:(id)a3 applicationService:(id)a4 connectionID:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (dword_100141CF8 <= 30 && (dword_100141CF8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000784A8;
  v15[3] = &unk_100123870;
  id v16 = v13;
  id v14 = v13;
  [(RPNWNearbyInvitationPeer *)self sendWithRequestID:@"com.apple.oneapi.nearbyinvitation.data" data:v10 status:0 applicationService:v11 listenerID:0 connectionID:v12 responseHandler:v15];
}

- (void)sendStatusUpdateForConnection:(id)a3 connectionID:(id)a4 status:(int)a5 responseHandler:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (dword_100141CF8 <= 30 && (dword_100141CF8 != -1 || _LogCategory_Initialize()))
  {
    +[RPNWNearbyInvitationPeer statusCodeToString:v7];
    LogPrintF();
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100078604;
  v14[3] = &unk_100123870;
  id v15 = v12;
  id v13 = v12;
  [(RPNWNearbyInvitationPeer *)self sendWithRequestID:@"com.apple.oneapi.nearbyinvitation.data" data:0 status:v7 applicationService:v10 listenerID:0 connectionID:v11 responseHandler:v14];
}

- (RPNearbyInvitationDevice)destinationDevice
{
  return self->_destinationDevice;
}

- (void)setDestinationDevice:(id)a3
{
}

- (RPNearbyInvitationDiscovery)nearbyInvitationDiscovery
{
  return self->_nearbyInvitationDiscovery;
}

- (void)setNearbyInvitationDiscovery:(id)a3
{
}

- (RPNearbyInvitationServer)nearbyInvitationServer
{
  return self->_nearbyInvitationServer;
}

- (void)setNearbyInvitationServer:(id)a3
{
}

- (RPNearbyInvitationSession)nearbyInvitationSession
{
  return self->_nearbyInvitationSession;
}

- (void)setNearbyInvitationSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyInvitationSession, 0);
  objc_storeStrong((id *)&self->_nearbyInvitationServer, 0);
  objc_storeStrong((id *)&self->_nearbyInvitationDiscovery, 0);

  objc_storeStrong((id *)&self->_destinationDevice, 0);
}

@end