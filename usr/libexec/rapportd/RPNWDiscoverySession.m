@interface RPNWDiscoverySession
- (NSString)applicationService;
- (NSUUID)agentUUID;
- (NSUUID)discoverySessionID;
- (OS_nw_agent_client)browseClient;
- (RPNWDiscoverySession)init;
- (RPNWPeer)discoveryClient;
- (id)browseResponse;
- (id)description;
- (int)pid;
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
- (void)setPid:(int)a3;
- (void)startDiscovery:(unsigned int)a3 controlFlags:(unint64_t)a4 deviceFilter:(id)a5;
- (void)stopDiscovery;
- (void)updateClientBrowseResult;
- (void)updateMappingForDevice:(id)a3;
@end

@implementation RPNWDiscoverySession

- (RPNWDiscoverySession)init
{
  v7.receiver = self;
  v7.super_class = (Class)RPNWDiscoverySession;
  v2 = [(RPNWDiscoverySession *)&v7 init];
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
  v2.super_class = (Class)RPNWDiscoverySession;
  [(RPNWDiscoverySession *)&v2 dealloc];
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"  RPNWDiscoverySession[%p] id=%@\n", self, self->_discoverySessionID];
  v4 = +[RPNWEndpoint listEndpointsForDiscoverySession:self->_discoverySessionID];
  [v3 appendString:v4];

  return v3;
}

- (void)updateClientBrowseResult
{
}

- (void)addMappingForDevice:(id)a3 endpointID:(id)a4
{
  if (+[RPNWEndpoint addEndpointMapping:a3 endpointID:a4 applicationService:self->_applicationService discoverySessionID:self->_discoverySessionID shouldAutomapListener:1])
  {
    [(RPNWDiscoverySession *)self updateClientBrowseResult];
  }
}

- (void)updateMappingForDevice:(id)a3
{
  if (+[RPNWEndpoint updateEndpointMapping:a3 discoverySessionID:self->_discoverySessionID])
  {
    [(RPNWDiscoverySession *)self updateClientBrowseResult];
  }
}

- (void)removeDevice:(id)a3
{
  if (+[RPNWEndpoint removeEndpointMapping:a3 discoverySessionID:self->_discoverySessionID immediate:0])
  {
    [(RPNWDiscoverySession *)self updateClientBrowseResult];
  }
}

- (void)removeAllDevices
{
  if (self->_discoverySessionID)
  {
    if (dword_1001421D8 <= 30 && (dword_1001421D8 != -1 || _LogCategory_Initialize()))
    {
      id v3 = +[RPNWNetworkAgent getLogInfo];
      v4 = self;
      id v5 = objc_alloc_init((Class)NSMutableString);
      [v5 appendFormat:@"%p", v4];

      objc_super v7 = v3;
      id v8 = v5;
      LogPrintF();
    }
    +[RPNWEndpoint removeDiscoverySessionFromAllEndpoints:](RPNWEndpoint, "removeDiscoverySessionFromAllEndpoints:", self->_discoverySessionID, v7, v8);
    discoverySessionID = self->_discoverySessionID;
    self->_discoverySessionID = 0;
  }
}

- (void)startDiscovery:(unsigned int)a3 controlFlags:(unint64_t)a4 deviceFilter:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  v9 = objc_alloc_init(RPNWPeer);
  discoveryClient = self->_discoveryClient;
  self->_discoveryClient = v9;

  if (dword_1001421D8 <= 30 && (dword_1001421D8 != -1 || _LogCategory_Initialize()))
  {
    v11 = +[RPNWNetworkAgent getLogInfo];
    v12 = self;
    id v13 = objc_alloc_init((Class)NSMutableString);
    [v13 appendFormat:@"%p", v12];

    v14 = self->_discoveryClient;
    id v15 = objc_alloc_init((Class)NSMutableString);
    [v15 appendFormat:@"%p", v14];

    unint64_t v19 = a4;
    v20 = &unk_10011A840;
    id v18 = v15;
    LogPrintF();
  }
  v16 = self->_discoveryClient;
  applicationService = self->_applicationService;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100080E08;
  v24[3] = &unk_100122ED8;
  v24[4] = self;
  v22[4] = self;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100080F28;
  v23[3] = &unk_100122ED8;
  v23[4] = self;
  v21[4] = self;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10008102C;
  v22[3] = &unk_100122ED8;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100081130;
  v21[3] = &unk_100121158;
  -[RPNWPeer startDiscovery:applicationService:controlFlags:deviceFilter:connectedHandler:updateHandler:lostHandler:invalidationHandler:](v16, "startDiscovery:applicationService:controlFlags:deviceFilter:connectedHandler:updateHandler:lostHandler:invalidationHandler:", v6, applicationService, a4, v8, v24, v23, v22, v21, v18, v19, v20);
}

- (void)stopDiscovery
{
  if (self->_discoveryClient)
  {
    if (dword_1001421D8 <= 30 && (dword_1001421D8 != -1 || _LogCategory_Initialize()))
    {
      id v3 = +[RPNWNetworkAgent getLogInfo];
      v4 = self;
      id v5 = objc_alloc_init((Class)NSMutableString);
      [v5 appendFormat:@"%p", v4];

      objc_super v7 = v3;
      id v8 = v5;
      LogPrintF();
    }
    [(RPNWPeer *)self->_discoveryClient stopDiscovery];
    discoveryClient = self->_discoveryClient;
    self->_discoveryClient = 0;
  }

  [(RPNWDiscoverySession *)self removeAllDevices];
}

- (RPNWPeer)discoveryClient
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

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
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