@interface RPNWAgentClient
+ (id)addAgentClient;
+ (id)findAgentClient:(id)a3 tryPort:(BOOL)a4 isTCP:(BOOL)a5 isFlowHandler:(BOOL)a6;
+ (id)findAgentClientFromConnectionID:(id)a3;
+ (id)findListenerAgentClientFromApplicationServiceName:(id)a3;
+ (unsigned)findAgentClientPort:(id)a3;
+ (void)initialize;
+ (void)listAgentClients:(id)a3;
+ (void)removeAgentClient:(id)a3;
+ (void)removeAgentClient:(id)a3 isFlowHandler:(BOOL)a4;
- (BOOL)isTCP;
- (BOOL)isUsingQUIC;
- (NSString)applicationService;
- (NSString)persona;
- (NSUUID)agentClientID;
- (OS_nw_advertise_descriptor)advertiseDescriptor;
- (OS_nw_agent_client)browseClient;
- (OS_nw_agent_client)flowClient;
- (OS_nw_browse_descriptor)browseDescriptor;
- (OS_nw_endpoint)localEndpoint;
- (OS_nw_framer)listen_framer;
- (RPNWAgentClient)init;
- (RPNWConnection)connection;
- (RPNWDiscoverySession)discoverySession;
- (RPNWNearbyInvitationConnection)nearbyInvitationConnection;
- (RPNWNearbyInvitationDiscoverySession)nearbyInvitationDiscoverySession;
- (RPNWNearbyInvitationPeer)nearbyInvitationServer;
- (RPServer)applicationServiceServer;
- (const)getTypeDescription;
- (id)browseResponse;
- (id)description;
- (id)flowAssignHandler;
- (id)longDescription;
- (int)advertiseInvitationRoute;
- (int)advertiseInvitationScope;
- (int)browseInvitationScope;
- (int)pid;
- (int64_t)type;
- (unint64_t)controlFlags;
- (unsigned)port;
- (void)dealloc;
- (void)setAdvertiseDescriptor:(id)a3;
- (void)setAdvertiseInvitationRoute:(int)a3;
- (void)setAdvertiseInvitationScope:(int)a3;
- (void)setAgentClientID:(id)a3;
- (void)setApplicationService:(id)a3;
- (void)setApplicationServiceServer:(id)a3;
- (void)setBrowseClient:(id)a3;
- (void)setBrowseDescriptor:(id)a3;
- (void)setBrowseInvitationScope:(int)a3;
- (void)setBrowseResponse:(id)a3;
- (void)setConnection:(id)a3;
- (void)setControlFlags:(unint64_t)a3;
- (void)setDiscoverySession:(id)a3;
- (void)setFlowAssignHandler:(id)a3;
- (void)setFlowClient:(id)a3;
- (void)setIsTCP:(BOOL)a3;
- (void)setIsUsingQUIC:(BOOL)a3;
- (void)setListen_framer:(id)a3;
- (void)setLocalEndpoint:(id)a3;
- (void)setNearbyInvitationConnection:(id)a3;
- (void)setNearbyInvitationDiscoverySession:(id)a3;
- (void)setNearbyInvitationServer:(id)a3;
- (void)setPersona:(id)a3;
- (void)setPid:(int)a3;
- (void)setPort:(unsigned __int16)a3;
- (void)setType:(int64_t)a3;
- (void)startDiscovery:(id)a3 deviceTypes:(unsigned int)a4 controlFlags:(unint64_t)a5 deviceFilter:(id)a6 agentUUID:(id)a7 applicationService:(id)a8;
- (void)startNearbyInvitationDiscovery:(id)a3 agentUUID:(id)a4 applicationService:(id)a5;
- (void)stopAgentClient;
- (void)updateAgentClientInfo:(id)a3 browseResponse:(id)a4 listener:(id)a5 bundleID:(id)a6 advertiseDescriptor:(id)a7 browseDescriptor:(id)a8 isFlowHandler:(BOOL)a9 isUsingQUIC:(BOOL)a10 isTCP:(BOOL)a11 agentClientPID:(int)a12 persona:(id)a13;
@end

@implementation RPNWAgentClient

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"RPNWAgentClient[%p]", self];
  if (self->_type)
  {
    [v3 appendFormat:@" (%s): < ", -[RPNWAgentClient getTypeDescription](self, "getTypeDescription")];
    if (self->_applicationService) {
      [v3 appendFormat:@"appSvc=%@ ", self->_applicationService];
    }
    persona = self->_persona;
    if (persona)
    {
      v5 = [(NSString *)persona substringToIndex:8];
      [v3 appendFormat:@"persona:%@ ", v5];
    }
    if (self->_pid) {
      [v3 appendFormat:@"PID=%d ", self->_pid];
    }
    if (self->_browseClient) {
      [v3 appendFormat:@"browse_client=%p ", self->_browseClient];
    }
    if (self->_browseResponse) {
      [v3 appendFormat:@"browse_response=%p ", self->_browseResponse];
    }
    if (self->_flowClient) {
      [v3 appendFormat:@"flow_client=%p ", self->_flowClient];
    }
    if (self->_isUsingQUIC) {
      [v3 appendFormat:@"using_QUIC=YES "];
    }
    if (self->_port) {
      [v3 appendFormat:@"port=%d ", self->_port];
    }
    if (self->_isTCP) {
      [v3 appendFormat:@"(TCP) "];
    }
    if (self->_advertiseDescriptor) {
      [v3 appendFormat:@"adesc=%@ ", self->_advertiseDescriptor];
    }
    if (self->_advertiseInvitationRoute) {
      [v3 appendFormat:@"advertise_invitation_route=%d", self->_advertiseInvitationRoute];
    }
    if (self->_advertiseInvitationScope) {
      [v3 appendFormat:@"advertise_invitation_scope=%d", self->_advertiseInvitationScope];
    }
    if (self->_browseDescriptor) {
      [v3 appendFormat:@"bdesc=%@ ", self->_browseDescriptor];
    }
    if (self->_browseInvitationScope) {
      [v3 appendFormat:@"browse_invitation_scope=%d", self->_browseInvitationScope];
    }
    if (self->_listen_framer) {
      [v3 appendFormat:@"lframer=%@ ", self->_listen_framer];
    }
    [v3 appendString:@">"];
  }

  return v3;
}

- (RPNWAgentClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPNWAgentClient;
  v2 = [(RPNWAgentClient *)&v6 init];
  id v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

+ (id)addAgentClient
{
  v2 = objc_alloc_init(RPNWAgentClient);
  id v3 = +[NSUUID UUID];
  [(RPNWAgentClient *)v2 setAgentClientID:v3];

  [(id)qword_100142F00 addObject:v2];
  if (dword_1001422B8 <= 30 && (dword_1001422B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  return v2;
}

+ (id)findAgentClient:(id)a3 tryPort:(BOOL)a4 isTCP:(BOOL)a5 isFlowHandler:(BOOL)a6
{
  BOOL v6 = a6;
  int v7 = a5;
  id v9 = a3;
  if (a4)
  {
    uint64_t v10 = +[RPNWAgentClient findAgentClientPort:v9];
    if (!v10) {
      goto LABEL_39;
    }
    uint64_t v11 = v10;
    if (dword_1001422B8 <= 30 && (dword_1001422B8 != -1 || _LogCategory_Initialize()))
    {
      CFStringRef v12 = @"NO";
      if (v7) {
        CFStringRef v12 = @"YES";
      }
      uint64_t v31 = v11;
      CFStringRef v32 = v12;
      LogPrintF();
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v15 = (id)qword_100142F00;
    id v23 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v34;
      while (2)
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v15);
          }
          v27 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (objc_msgSend(v27, "port", v31, v32, (void)v33) == v11
            && [v27 isTCP] == v7)
          {
            if (dword_1001422B8 <= 30 && (dword_1001422B8 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            id v29 = v27;
            goto LABEL_51;
          }
        }
        id v24 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    if (dword_1001422B8 <= 30 && (dword_1001422B8 != -1 || _LogCategory_Initialize()))
    {
      id v13 = v9;
      id v14 = objc_alloc_init((Class)NSMutableString);
      [v14 appendFormat:@"%p", v13];

      LogPrintF();
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v15 = (id)qword_100142F00;
    id v16 = [v15 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v38;
      while (2)
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
          if (v6)
          {
            id v21 = [v20 flowClient];
            if (v21 == v9)
            {

LABEL_25:
              if (dword_1001422B8 <= 30 && (dword_1001422B8 != -1 || _LogCategory_Initialize())) {
                LogPrintF();
              }
              id v29 = v20;
LABEL_51:
              v28 = v29;

              goto LABEL_52;
            }
          }
          else
          {
            id v22 = [v20 browseClient];

            if (v22 == v9) {
              goto LABEL_25;
            }
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v37 objects:v42 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }
  }

LABEL_39:
  if (dword_1001422B8 <= 30 && (dword_1001422B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v28 = 0;
LABEL_52:

  return v28;
}

- (unsigned)port
{
  return self->_port;
}

+ (unsigned)findAgentClientPort:(id)a3
{
  id v3 = nw_agent_client_copy_path();
  v4 = nw_path_copy_effective_local_endpoint(v3);
  v5 = v4;
  if (v4) {
    uint16_t port = nw_endpoint_get_port(v4);
  }
  else {
    uint16_t port = 0;
  }

  return port;
}

- (void)updateAgentClientInfo:(id)a3 browseResponse:(id)a4 listener:(id)a5 bundleID:(id)a6 advertiseDescriptor:(id)a7 browseDescriptor:(id)a8 isFlowHandler:(BOOL)a9 isUsingQUIC:(BOOL)a10 isTCP:(BOOL)a11 agentClientPID:(int)a12 persona:(id)a13
{
  id v46 = a3;
  id v20 = a4;
  id v45 = a5;
  id v47 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a13;
  if (v23) {
    objc_storeStrong((id *)&self->_persona, a13);
  }
  uint64_t v24 = 96;
  if (a9) {
    uint64_t v24 = 112;
  }
  objc_storeStrong((id *)((char *)&self->super.isa + v24), a3);
  if (v20)
  {
    id v25 = objc_retainBlock(v20);
    id browseResponse = self->_browseResponse;
    self->_id browseResponse = v25;
  }
  self->_isUsingQUIC = a10;
  v27 = v46;
  if (!self->_port) {
    self->_uint16_t port = +[RPNWAgentClient findAgentClientPort:v46];
  }
  if (!self->_pid) {
    self->_pid = a12;
  }
  self->_isTCP = a11;
  if (v21)
  {
    objc_storeStrong((id *)&self->_advertiseDescriptor, a7);
    self->_advertiseInvitationRoute = nw_advertise_descriptor_get_invitation_route();
    self->_advertiseInvitationScope = nw_advertise_descriptor_get_invitation_scope();
  }
  if (v22)
  {
    objc_storeStrong((id *)&self->_browseDescriptor, a8);
    self->_browseInvitationScope = nw_browse_descriptor_get_invitation_scope();
    application_service_name = nw_browse_descriptor_get_application_service_name((nw_browse_descriptor_t)self->_browseDescriptor);
    if (application_service_name)
    {
      id v29 = +[NSString stringWithUTF8String:application_service_name];
      applicationService = self->_applicationService;
      self->_applicationService = v29;
    }
  }
  if (self->_advertiseDescriptor)
  {
    if (dword_1001422B8 <= 30 && (dword_1001422B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    long long v34 = nw_advertise_descriptor_get_application_service_name((nw_advertise_descriptor_t)self->_advertiseDescriptor);
    if (!v34) {
      goto LABEL_41;
    }
    long long v35 = +[NSString stringWithUTF8String:v34];
    if (v47)
    {
      long long v36 = +[NSString stringWithFormat:@"%@.%@", v47, v35];
      p_applicationService = &self->_applicationService;
      long long v37 = self->_applicationService;
      self->_applicationService = v36;

      if (dword_1001422B8 > 30 || dword_1001422B8 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_38;
      }
    }
    else
    {
      p_applicationService = &self->_applicationService;
      objc_storeStrong((id *)&self->_applicationService, v35);
      if (dword_1001422B8 > 30 || dword_1001422B8 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_38;
      }
    }
    v43 = *p_applicationService;
    LogPrintF();
LABEL_38:
    applicationServiceServer = self->_applicationServiceServer;
    if (!applicationServiceServer)
    {
      id v40 = objc_alloc_init((Class)RPServer);
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_100088E0C;
      v49[3] = &unk_100121908;
      v49[4] = self;
      [v40 setErrorHandler:v49];
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_100088EB4;
      v48[3] = &unk_100121158;
      v48[4] = self;
      [v40 setInterruptionHandler:v48];
      [v40 activate];
      v41 = self->_applicationServiceServer;
      self->_applicationServiceServer = (RPServer *)v40;
      id v42 = v40;

      v27 = v46;
      applicationServiceServer = self->_applicationServiceServer;
    }
    -[RPServer setServiceType:](applicationServiceServer, "setServiceType:", self->_applicationService, v43);

LABEL_41:
    self->_type = 1;
    +[RPNWListener addListenerAgentClient:self];
    goto LABEL_42;
  }
  if (self->_browseDescriptor)
  {
    int64_t v31 = 2;
  }
  else
  {
    if (v45)
    {
      self->_type = 3;
      CFStringRef v32 = [v45 advertiseDescriptor];
      advertiseDescriptor = self->_advertiseDescriptor;
      self->_advertiseDescriptor = v32;

      goto LABEL_42;
    }
    int64_t v31 = 4;
  }
  self->_type = v31;
LABEL_42:
  if (dword_1001422B8 <= 30 && (dword_1001422B8 != -1 || _LogCategory_Initialize()))
  {
    v44 = [(RPNWAgentClient *)self description];
    LogPrintF();
  }
}

- (int64_t)type
{
  return self->_type;
}

- (void)setLocalEndpoint:(id)a3
{
}

- (void)setFlowAssignHandler:(id)a3
{
}

- (void)setApplicationService:(id)a3
{
}

- (void)setAgentClientID:(id)a3
{
}

- (const)getTypeDescription
{
  unint64_t type = self->_type;
  if (type > 4) {
    return "LSTNR";
  }
  else {
    return off_100123F38[type];
  }
}

+ (void)initialize
{
  if (qword_100142F08 != -1) {
    dispatch_once(&qword_100142F08, &stru_100123ED8);
  }
}

- (void)dealloc
{
  [(RPNWAgentClient *)self stopAgentClient];
  v3.receiver = self;
  v3.super_class = (Class)RPNWAgentClient;
  [(RPNWAgentClient *)&v3 dealloc];
}

- (void)stopAgentClient
{
  if (dword_1001422B8 <= 30 && (dword_1001422B8 != -1 || _LogCategory_Initialize()))
  {
    objc_super v3 = self;
    id v4 = objc_alloc_init((Class)NSMutableString);
    [v4 appendFormat:@"%p", v3];

    id v44 = v4;
    LogPrintF();
  }
  discoverySession = self->_discoverySession;
  if (discoverySession)
  {
    if (dword_1001422B8 <= 30)
    {
      if (dword_1001422B8 != -1 || (int v8 = _LogCategory_Initialize(), discoverySession = self->_discoverySession, v8))
      {
        BOOL v6 = discoverySession;
        id v7 = objc_alloc_init((Class)NSMutableString);
        [v7 appendFormat:@"%p", v6];

        id v44 = v7;
        LogPrintF();

        discoverySession = self->_discoverySession;
      }
    }
    [(RPNWDiscoverySession *)discoverySession stopDiscovery];
    id v9 = self->_discoverySession;
    self->_discoverySession = 0;
  }
  nearbyInvitationDiscoverySession = self->_nearbyInvitationDiscoverySession;
  if (nearbyInvitationDiscoverySession)
  {
    if (dword_1001422B8 <= 30)
    {
      if (dword_1001422B8 != -1
        || (int v13 = _LogCategory_Initialize(),
            nearbyInvitationDiscoverySession = self->_nearbyInvitationDiscoverySession,
            v13))
      {
        uint64_t v11 = nearbyInvitationDiscoverySession;
        id v12 = objc_alloc_init((Class)NSMutableString);
        [v12 appendFormat:@"%p", v11];

        id v44 = v12;
        LogPrintF();

        nearbyInvitationDiscoverySession = self->_nearbyInvitationDiscoverySession;
      }
    }
    [(RPNWNearbyInvitationDiscoverySession *)nearbyInvitationDiscoverySession stopDiscovery];
    id v14 = self->_nearbyInvitationDiscoverySession;
    self->_nearbyInvitationDiscoverySession = 0;
  }
  connection = self->_connection;
  if (connection)
  {
    if (dword_1001422B8 <= 30)
    {
      if (dword_1001422B8 != -1 || (int v20 = _LogCategory_Initialize(), connection = self->_connection, v20))
      {
        id v16 = connection;
        id v17 = objc_alloc_init((Class)NSMutableString);
        [v17 appendFormat:@"%p", v16];

        unsigned int v18 = [(RPNWConnection *)self->_connection isConnected];
        v19 = "no";
        if (v18) {
          v19 = "yes";
        }
        id v44 = v17;
        id v45 = v19;
        LogPrintF();

        connection = self->_connection;
      }
    }
    unsigned int v21 = [(RPNWConnection *)connection isConnected];
    id v22 = [(RPNWConnection *)self->_connection peer];
    id v23 = v22;
    if (v21)
    {
      uint64_t v24 = [(RPNWConnection *)self->_connection applicationService];
      id v25 = [(RPNWConnection *)self->_connection connectionUUID];
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_100088A2C;
      v46[3] = &unk_100121630;
      id v47 = v23;
      id v23 = v23;
      [v23 sendStatusUpdateForConnection:v24 connectionID:v25 status:1 responseHandler:v46];
    }
    else
    {
      [v22 deregisterRequestID:@"com.apple.oneapi.data"];
      [v23 invalidate];
    }

    [(RPNWConnection *)self->_connection setFramer:0];
    v26 = self->_connection;
    self->_connection = 0;
  }
  nearbyInvitationConnection = self->_nearbyInvitationConnection;
  if (nearbyInvitationConnection)
  {
    if (dword_1001422B8 <= 30)
    {
      if (dword_1001422B8 != -1
        || (int v32 = _LogCategory_Initialize(), nearbyInvitationConnection = self->_nearbyInvitationConnection, v32))
      {
        v28 = nearbyInvitationConnection;
        id v29 = objc_alloc_init((Class)NSMutableString);
        [v29 appendFormat:@"%p", v28];

        unsigned int v30 = [(RPNWNearbyInvitationConnection *)self->_nearbyInvitationConnection isConnected];
        int64_t v31 = "no";
        if (v30) {
          int64_t v31 = "yes";
        }
        id v44 = v29;
        id v45 = v31;
        LogPrintF();

        nearbyInvitationConnection = self->_nearbyInvitationConnection;
      }
    }
    long long v33 = [(RPNWNearbyInvitationConnection *)nearbyInvitationConnection peer];
    long long v34 = v33;
    if (self->_type == 3)
    {
      long long v35 = [(RPNWNearbyInvitationConnection *)self->_nearbyInvitationConnection applicationService];
      long long v36 = [(RPNWNearbyInvitationConnection *)self->_nearbyInvitationConnection connectionUUID];
      [v34 sendStatusUpdateForConnection:v35 connectionID:v36 status:4 responseHandler:&stru_100123F18];
    }
    else
    {
      long long v37 = [v33 nearbyInvitationSession];
      [v37 deregisterRequestID:@"com.apple.oneapi.nearbyinvitation.data"];

      long long v35 = [v34 nearbyInvitationSession];
      [v35 invalidate];
    }

    if (self->_type == 1)
    {
      long long v38 = [v34 nearbyInvitationSession];
      [v38 deregisterRequestID:@"com.apple.oneapi.nearbyinvitation.connection"];
    }
    [(RPNWNearbyInvitationConnection *)self->_nearbyInvitationConnection setFramer:0];
    long long v39 = self->_nearbyInvitationConnection;
    self->_nearbyInvitationConnection = 0;
  }
  applicationServiceServer = self->_applicationServiceServer;
  if (applicationServiceServer)
  {
    [(RPServer *)applicationServiceServer invalidate];
    v41 = self->_applicationServiceServer;
    self->_applicationServiceServer = 0;
  }
  nearbyInvitationServer = self->_nearbyInvitationServer;
  if (nearbyInvitationServer)
  {
    [(RPNWNearbyInvitationPeer *)nearbyInvitationServer stopServer];
    v43 = self->_nearbyInvitationServer;
    self->_nearbyInvitationServer = 0;
  }
}

- (id)longDescription
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  id v4 = [(RPNWAgentClient *)self description];
  [v3 appendFormat:@"%@\n", v4];

  if (self->_connection) {
    [v3 appendFormat:@"   + %@\n", self->_connection];
  }
  discoverySession = self->_discoverySession;
  if (discoverySession)
  {
    BOOL v6 = [(RPNWDiscoverySession *)discoverySession description];
    [v3 appendString:v6];
  }

  return v3;
}

- (void)startDiscovery:(id)a3 deviceTypes:(unsigned int)a4 controlFlags:(unint64_t)a5 deviceFilter:(id)a6 agentUUID:(id)a7 applicationService:(id)a8
{
  uint64_t v12 = *(void *)&a4;
  id v23 = a3;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  if (dword_1001422B8 <= 30 && (dword_1001422B8 != -1 || _LogCategory_Initialize()))
  {
    id v17 = self;
    id v18 = objc_alloc_init((Class)NSMutableString);
    [v18 appendFormat:@"%p", v17];

    id v22 = v18;
    LogPrintF();
  }
  v19 = objc_alloc_init(RPNWDiscoverySession);
  discoverySession = self->_discoverySession;
  self->_discoverySession = v19;

  [(RPNWDiscoverySession *)self->_discoverySession setBrowseClient:self->_browseClient];
  [(RPNWDiscoverySession *)self->_discoverySession setBrowseResponse:v23];
  if (self->_isUsingQUIC) {
    id v21 = 0;
  }
  else {
    id v21 = v15;
  }
  -[RPNWDiscoverySession setAgentUUID:](self->_discoverySession, "setAgentUUID:", v21, v22);
  [(RPNWDiscoverySession *)self->_discoverySession setPid:self->_pid];
  [(RPNWDiscoverySession *)self->_discoverySession setApplicationService:v16];
  [(RPNWDiscoverySession *)self->_discoverySession startDiscovery:v12 controlFlags:a5 deviceFilter:v14];
}

- (void)startNearbyInvitationDiscovery:(id)a3 agentUUID:(id)a4 applicationService:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_alloc_init(RPNWNearbyInvitationDiscoverySession);
  nearbyInvitationDiscoverySession = self->_nearbyInvitationDiscoverySession;
  self->_nearbyInvitationDiscoverySession = v11;

  [(RPNWNearbyInvitationDiscoverySession *)self->_nearbyInvitationDiscoverySession setBrowseClient:self->_browseClient];
  [(RPNWNearbyInvitationDiscoverySession *)self->_nearbyInvitationDiscoverySession setBrowseResponse:v10];

  if (self->_isUsingQUIC) {
    id v13 = 0;
  }
  else {
    id v13 = v9;
  }
  [(RPNWNearbyInvitationDiscoverySession *)self->_nearbyInvitationDiscoverySession setAgentUUID:v13];

  [(RPNWNearbyInvitationDiscoverySession *)self->_nearbyInvitationDiscoverySession setApplicationService:v8];
  id v14 = self->_nearbyInvitationDiscoverySession;

  [(RPNWNearbyInvitationDiscoverySession *)v14 startDiscovery];
}

+ (id)findListenerAgentClientFromApplicationServiceName:(id)a3
{
  id v3 = a3;
  if (dword_1001422B8 <= 30 && (dword_1001422B8 != -1 || _LogCategory_Initialize()))
  {
    id v14 = v3;
    LogPrintF();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)qword_100142F00;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v9, "type", v14) == (id)1)
        {
          id v10 = [v9 applicationService];
          unsigned int v11 = [v10 isEqualToString:v3];

          if (v11)
          {
            if (dword_1001422B8 <= 30 && (dword_1001422B8 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            id v12 = v9;

            goto LABEL_24;
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (dword_1001422B8 <= 30 && (dword_1001422B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v12 = 0;
LABEL_24:

  return v12;
}

+ (id)findAgentClientFromConnectionID:(id)a3
{
  id v3 = a3;
  if (dword_1001422B8 <= 30 && (dword_1001422B8 != -1 || _LogCategory_Initialize()))
  {
    id v16 = v3;
    LogPrintF();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = (id)qword_100142F00;
  id v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v9 = [v8 connection:v16];
        id v10 = [v9 connectionUUID];
        if ([v10 isEqual:v3])
        {

LABEL_18:
          if (dword_1001422B8 <= 30 && (dword_1001422B8 != -1 || _LogCategory_Initialize()))
          {
            long long v17 = [v8 connection];
            LogPrintF();
          }
          id v14 = v8;

          goto LABEL_25;
        }
        unsigned int v11 = [v8 nearbyInvitationConnection];
        id v12 = [v11 connectionUUID];
        unsigned int v13 = [v12 isEqual:v3];

        if (v13) {
          goto LABEL_18;
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  if (dword_1001422B8 <= 30 && (dword_1001422B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v14 = 0;
LABEL_25:

  return v14;
}

+ (void)removeAgentClient:(id)a3 isFlowHandler:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [a1 findAgentClient:a3 tryPort:0 isTCP:0 isFlowHandler:a4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v12 = v5;
    if (v4) {
      [v5 setFlowClient:0];
    }
    else {
      [v5 setBrowseClient:0];
    }
    uint64_t v7 = [v12 flowClient];
    if (v7) {
      goto LABEL_6;
    }
    id v8 = [v12 browseClient];

    uint64_t v6 = v12;
    if (!v8)
    {
      if (dword_1001422B8 <= 30)
      {
        if (dword_1001422B8 != -1 || (v9 = _LogCategory_Initialize(), uint64_t v6 = v12, v9))
        {
          unsigned int v11 = v6;
          LogPrintF();
        }
      }
      [qword_100142F00 removeObject:v12];
      [v12 stopAgentClient];
      id v10 = [v12 type];
      uint64_t v6 = v12;
      if (v10 == (id)1)
      {
        uint64_t v7 = [v12 applicationService];
        +[RPNWListener startListenerMappingTimeout:v7];
LABEL_6:

        uint64_t v6 = v12;
      }
    }
  }
}

+ (void)removeAgentClient:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    id v7 = v3;
    if (dword_1001422B8 <= 30)
    {
      if (dword_1001422B8 != -1 || (v5 = _LogCategory_Initialize(), BOOL v4 = v7, v5))
      {
        uint64_t v6 = v4;
        LogPrintF();
      }
    }
    [qword_100142F00 removeObject:v7];
    BOOL v4 = v7;
  }
}

+ (void)listAgentClients:(id)a3
{
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)qword_100142F00;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) longDescription:v10];
        [v3 appendString:v9];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)setType:(int64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSUUID)agentClientID
{
  return self->_agentClientID;
}

- (NSString)applicationService
{
  return self->_applicationService;
}

- (OS_nw_advertise_descriptor)advertiseDescriptor
{
  return self->_advertiseDescriptor;
}

- (void)setAdvertiseDescriptor:(id)a3
{
}

- (int)advertiseInvitationRoute
{
  return self->_advertiseInvitationRoute;
}

- (void)setAdvertiseInvitationRoute:(int)a3
{
  self->_advertiseInvitationRoute = a3;
}

- (int)advertiseInvitationScope
{
  return self->_advertiseInvitationScope;
}

- (void)setAdvertiseInvitationScope:(int)a3
{
  self->_advertiseInvitationScope = a3;
}

- (RPServer)applicationServiceServer
{
  return self->_applicationServiceServer;
}

- (void)setApplicationServiceServer:(id)a3
{
}

- (OS_nw_framer)listen_framer
{
  return self->_listen_framer;
}

- (void)setListen_framer:(id)a3
{
}

- (OS_nw_browse_descriptor)browseDescriptor
{
  return self->_browseDescriptor;
}

- (void)setBrowseDescriptor:(id)a3
{
}

- (int)browseInvitationScope
{
  return self->_browseInvitationScope;
}

- (void)setBrowseInvitationScope:(int)a3
{
  self->_browseInvitationScope = a3;
}

- (RPNWDiscoverySession)discoverySession
{
  return self->_discoverySession;
}

- (void)setDiscoverySession:(id)a3
{
}

- (OS_nw_agent_client)browseClient
{
  return self->_browseClient;
}

- (void)setBrowseClient:(id)a3
{
}

- (id)browseResponse
{
  return self->_browseResponse;
}

- (void)setBrowseResponse:(id)a3
{
}

- (OS_nw_agent_client)flowClient
{
  return self->_flowClient;
}

- (void)setFlowClient:(id)a3
{
}

- (BOOL)isUsingQUIC
{
  return self->_isUsingQUIC;
}

- (void)setIsUsingQUIC:(BOOL)a3
{
  self->_isUsingQUIC = a3;
}

- (RPNWNearbyInvitationDiscoverySession)nearbyInvitationDiscoverySession
{
  return self->_nearbyInvitationDiscoverySession;
}

- (void)setNearbyInvitationDiscoverySession:(id)a3
{
}

- (void)setPort:(unsigned __int16)a3
{
  self->_uint16_t port = a3;
}

- (BOOL)isTCP
{
  return self->_isTCP;
}

- (void)setIsTCP:(BOOL)a3
{
  self->_isTCP = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (unint64_t)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unint64_t)a3
{
  self->_controlFlags = a3;
}

- (RPNWConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (RPNWNearbyInvitationConnection)nearbyInvitationConnection
{
  return self->_nearbyInvitationConnection;
}

- (void)setNearbyInvitationConnection:(id)a3
{
}

- (id)flowAssignHandler
{
  return self->_flowAssignHandler;
}

- (OS_nw_endpoint)localEndpoint
{
  return self->_localEndpoint;
}

- (RPNWNearbyInvitationPeer)nearbyInvitationServer
{
  return self->_nearbyInvitationServer;
}

- (void)setNearbyInvitationServer:(id)a3
{
}

- (NSString)persona
{
  return self->_persona;
}

- (void)setPersona:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persona, 0);
  objc_storeStrong((id *)&self->_nearbyInvitationServer, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);
  objc_storeStrong(&self->_flowAssignHandler, 0);
  objc_storeStrong((id *)&self->_nearbyInvitationConnection, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_nearbyInvitationDiscoverySession, 0);
  objc_storeStrong((id *)&self->_flowClient, 0);
  objc_storeStrong(&self->_browseResponse, 0);
  objc_storeStrong((id *)&self->_browseClient, 0);
  objc_storeStrong((id *)&self->_discoverySession, 0);
  objc_storeStrong((id *)&self->_browseDescriptor, 0);
  objc_storeStrong((id *)&self->_listen_framer, 0);
  objc_storeStrong((id *)&self->_applicationServiceServer, 0);
  objc_storeStrong((id *)&self->_advertiseDescriptor, 0);
  objc_storeStrong((id *)&self->_applicationService, 0);

  objc_storeStrong((id *)&self->_agentClientID, 0);
}

@end