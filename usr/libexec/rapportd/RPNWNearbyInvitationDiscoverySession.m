@interface RPNWNearbyInvitationDiscoverySession
- (NSString)applicationService;
- (NSUUID)agentUUID;
- (NSUUID)discoverySessionID;
- (OS_nw_agent_client)browseClient;
- (RPNWNearbyInvitationDiscoverySession)init;
- (RPNWNearbyInvitationPeer)discoveryClient;
- (id)browseResponse;
- (id)description;
- (void)addMappingForDevice:(id)a3 endpointID:(id)a4;
- (void)dealloc;
- (void)removeAllDevices;
- (void)removeDevice:(id)a3;
- (void)setAgentUUID:(id)a3;
- (void)setApplicationService:(id)a3;
- (void)setBrowseClient:(id)a3;
- (void)setBrowseResponse:(id)a3;
- (void)setDiscoveryClient:(id)a3;
- (void)setDiscoverySessionID:(id)a3;
- (void)startDiscovery;
- (void)stopDiscovery;
- (void)updateClientBrowseResult;
- (void)updateMappingForDevice:(id)a3;
@end

@implementation RPNWNearbyInvitationDiscoverySession

- (RPNWNearbyInvitationDiscoverySession)init
{
  v7.receiver = self;
  v7.super_class = (Class)RPNWNearbyInvitationDiscoverySession;
  v2 = [(RPNWNearbyInvitationDiscoverySession *)&v7 init];
  if (v2)
  {
    uint64_t v3 = +[NSUUID UUID];
    discoverySessionID = v2->_discoverySessionID;
    v2->_discoverySessionID = (NSUUID *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)RPNWNearbyInvitationDiscoverySession;
  [(RPNWNearbyInvitationDiscoverySession *)&v2 dealloc];
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"  RPNWNearbyInvitationDiscoverySession[%p] id=%@\n", self, self->_discoverySessionID];
  v4 = +[RPNWNearbyInvitationEndpoint listEndpointsForDiscoverySession:self->_discoverySessionID];
  [v3 appendString:v4];

  return v3;
}

- (void)updateClientBrowseResult
{
}

- (void)addMappingForDevice:(id)a3 endpointID:(id)a4
{
  if (+[RPNWNearbyInvitationEndpoint addEndpointMapping:a3 endpointID:a4 applicationService:self->_applicationService discoverySessionID:self->_discoverySessionID])
  {
    [(RPNWNearbyInvitationDiscoverySession *)self updateClientBrowseResult];
  }
}

- (void)updateMappingForDevice:(id)a3
{
  if (+[RPNWNearbyInvitationEndpoint updateEndpointMapping:a3 discoverySessionID:self->_discoverySessionID])
  {
    [(RPNWNearbyInvitationDiscoverySession *)self updateClientBrowseResult];
  }
}

- (void)removeDevice:(id)a3
{
  if (+[RPNWNearbyInvitationEndpoint removeEndpointMapping:a3 discoverySessionID:self->_discoverySessionID])
  {
    [(RPNWNearbyInvitationDiscoverySession *)self updateClientBrowseResult];
  }
}

- (void)removeAllDevices
{
  if (self->_discoverySessionID)
  {
    if (dword_100141780 <= 30 && (dword_100141780 != -1 || _LogCategory_Initialize()))
    {
      id v3 = self;
      id v4 = objc_alloc_init((Class)NSMutableString);
      [v4 appendFormat:@"%p", v3];

      id v6 = v4;
      LogPrintF();
    }
    +[RPNWNearbyInvitationEndpoint removeDiscoverySessionFromAllEndpoints:](RPNWNearbyInvitationEndpoint, "removeDiscoverySessionFromAllEndpoints:", self->_discoverySessionID, v6);
    discoverySessionID = self->_discoverySessionID;
    self->_discoverySessionID = 0;
  }
}

- (void)startDiscovery
{
  if (self->_discoveryClient)
  {
    if (dword_100141780 <= 90 && (dword_100141780 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    id v3 = objc_alloc_init(RPNWNearbyInvitationPeer);
    discoveryClient = self->_discoveryClient;
    self->_discoveryClient = v3;

    v5 = self->_discoveryClient;
    applicationService = self->_applicationService;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100057EF8;
    v10[3] = &unk_100122D90;
    v10[4] = self;
    v8[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100057F6C;
    v9[3] = &unk_100122D90;
    v9[4] = self;
    v7[4] = self;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100057F78;
    v8[3] = &unk_100122D90;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100057F84;
    v7[3] = &unk_100121158;
    [(RPNWNearbyInvitationPeer *)v5 startDiscovery:applicationService foundHandler:v10 updateHandler:v9 lostHandler:v8 invalidationHandler:v7];
  }
}

- (void)stopDiscovery
{
  if (self->_discoveryClient)
  {
    if (dword_100141780 <= 30 && (dword_100141780 != -1 || _LogCategory_Initialize()))
    {
      id v3 = self;
      id v4 = objc_alloc_init((Class)NSMutableString);
      [v4 appendFormat:@"%p", v3];

      id v6 = v4;
      LogPrintF();
    }
    [(RPNWNearbyInvitationPeer *)self->_discoveryClient stopDiscovery];
    discoveryClient = self->_discoveryClient;
    self->_discoveryClient = 0;
  }

  [(RPNWNearbyInvitationDiscoverySession *)self removeAllDevices];
}

- (RPNWNearbyInvitationPeer)discoveryClient
{
  return self->_discoveryClient;
}

- (void)setDiscoveryClient:(id)a3
{
}

- (NSUUID)agentUUID
{
  return self->_agentUUID;
}

- (void)setAgentUUID:(id)a3
{
}

- (NSUUID)discoverySessionID
{
  return self->_discoverySessionID;
}

- (void)setDiscoverySessionID:(id)a3
{
}

- (NSString)applicationService
{
  return self->_applicationService;
}

- (void)setApplicationService:(id)a3
{
}

- (id)browseResponse
{
  return self->_browseResponse;
}

- (void)setBrowseResponse:(id)a3
{
}

- (OS_nw_agent_client)browseClient
{
  return self->_browseClient;
}

- (void)setBrowseClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browseClient, 0);
  objc_storeStrong(&self->_browseResponse, 0);
  objc_storeStrong((id *)&self->_applicationService, 0);
  objc_storeStrong((id *)&self->_discoverySessionID, 0);
  objc_storeStrong((id *)&self->_agentUUID, 0);

  objc_storeStrong((id *)&self->_discoveryClient, 0);
}

@end