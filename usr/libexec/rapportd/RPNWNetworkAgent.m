@interface RPNWNetworkAgent
+ (id)getCurrentPersona;
+ (id)getLogInfo;
+ (id)sharedNetworkAgent;
- (BOOL)_isTCPTransport:(id)a3;
- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5;
- (BOOL)createBrowseAgent;
- (BOOL)createConnectionFramer:(id)a3 assign:(id)a4 local:(id)a5 remote:(id)a6 incomingConnection:(id)a7;
- (BOOL)createListenerFramer:(id)a3;
- (BOOL)createNearbyInvitationConnectionFramer:(id)a3 assign:(id)a4 local:(id)a5 remote:(id)a6 incomingConnection:(id)a7;
- (BOOL)createNetworkAgent;
- (BOOL)createRapportServer;
- (BOOL)diagnosticCommand:(id)a3 params:(id)a4;
- (BOOL)discoverDevices:(id)a3 response:(id)a4 nearbyInvitation:(BOOL)a5;
- (BOOL)removeXPCMatchingToken:(unint64_t)a3;
- (BOOL)setupBrowseHandlers;
- (BOOL)setupFlowHandlers;
- (BOOL)setupListenHandlers;
- (BOOL)setupPolicyWithQueue:(id)a3 browseAgent:(BOOL)a4;
- (BOOL)setupResolveHandlers;
- (NSUUID)browseAgentID;
- (NSUUID)networkAgentID;
- (OS_dispatch_queue)dispatchQueue;
- (RPNWNetworkAgent)init;
- (id)_applicationServiceAdvertiseDescriptorForClient:(id)a3;
- (id)_localPublicKeyForAgentClient:(id)a3;
- (id)_quicProtocolOptionsFromParameters:(id)a3;
- (id)descriptionWithLevel:(int)a3;
- (id)getDiscoveryDeviceTypesDescription:(unsigned int)a3;
- (id)getPersonaFromParameters:(id)a3;
- (unint64_t)convertBrowseParamsToControlFlags:(id)a3;
- (unint64_t)convertBrowseScopeToControlFlags:(unsigned int)a3;
- (unint64_t)convertConnectionParametersToControlFlags:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_update;
- (void)activate;
- (void)createListener:(id)a3 nearbyInvitation:(BOOL)a4;
- (void)dealloc;
- (void)executeAgentLogicInPersona:(id)a3 pid:(int)a4 handlerDescription:(id)a5 handler:(id)a6;
- (void)invalidate;
- (void)resolveRequest:(id)a3 existingEndpoint:(id)a4 controlFlags:(unint64_t)a5 clientPublicKey:(id)a6 client:(id)a7;
- (void)setBrowseAgentID:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setNetworkAgentID:(id)a3;
- (void)setupAssertHandlers:(id)a3;
- (void)startFlow:(id)a3 listener:(id)a4 client:(id)a5 assign:(id)a6 parameters:(id)a7;
@end

@implementation RPNWNetworkAgent

- (BOOL)createListenerFramer:(id)a3
{
  id v4 = a3;
  if ([v4 type] != (id)1)
  {
    if (dword_100142248 > 30 || dword_100142248 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_22;
    }
LABEL_8:
    LogPrintF();
LABEL_22:
    BOOL v13 = 0;
    goto LABEL_23;
  }
  v5 = [v4 listen_framer];

  if (v5)
  {
    if (dword_100142248 > 30 || dword_100142248 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_22;
    }
    goto LABEL_8;
  }
  if (!v4
    || ([v4 flowAssignHandler], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v7 = (void *)v6,
        [v4 localEndpoint],
        v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    if (([v4 isUsingQUIC] & 1) == 0
      && dword_100142248 <= 40
      && (dword_100142248 != -1 || _LogCategory_Initialize()))
    {
      v11 = [v4 flowAssignHandler];
      id v12 = objc_retainBlock(v11);
      v23 = [v4 localEndpoint];
      LogPrintF();
    }
    goto LABEL_22;
  }
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
  {
    v9 = [v4 flowAssignHandler];
    id v10 = objc_retainBlock(v9);
    [v4 localEndpoint];
    v22 = id v21 = v10;
    LogPrintF();
  }
  if ((objc_msgSend(v4, "isUsingQUIC", v21, v22) & 1) == 0)
  {
    v26[0] = 0;
    v26[1] = 0;
    [(NSUUID *)self->_networkAgentID getUUIDBytes:v26];
    v15 = [v4 localEndpoint];
    nw_endpoint_set_agent_identifier();
  }
  start_handler[0] = _NSConcreteStackBlock;
  start_handler[1] = 3221225472;
  start_handler[2] = sub_100082CC0;
  start_handler[3] = &unk_100123BF0;
  id v16 = v4;
  id v25 = v16;
  definition = nw_framer_create_definition("listen-pipe", 0, start_handler);
  nw_protocol_options_t options = nw_framer_create_options(definition);

  v19 = [v16 flowAssignHandler];
  v20 = [v16 localEndpoint];
  ((void (**)(void, void *, void, nw_protocol_options_t))v19)[2](v19, v20, 0, options);

  [v16 setFlowAssignHandler:0];
  BOOL v13 = 1;
LABEL_23:

  return v13;
}

- (id)getPersonaFromParameters:(id)a3
{
  v3 = (void *)nw_parameters_copy_application_id();
  if (v3)
  {
    *(void *)uu = 0;
    uint64_t v9 = 0;
    nw_application_id_get_persona();
    id v4 = 0;
    if (!uuid_is_null(uu))
    {
      id v5 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:uu];
      uint64_t v6 = v5;
      if (v5)
      {
        id v4 = [v5 UUIDString];
      }
      else
      {
        id v4 = 0;
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)_isTCPTransport:(id)a3
{
  v3 = a3;
  nw_protocol_stack_t v4 = nw_parameters_copy_default_protocol_stack(v3);
  if (v4)
  {
    nw_protocol_definition_t v5 = nw_protocol_copy_tcp_definition();
    char v6 = nw_protocol_stack_includes_protocol();
  }
  else
  {
    if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    char v6 = 0;
  }

  return v6;
}

- (void)executeAgentLogicInPersona:(id)a3 pid:(int)a4 handlerDescription:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v8 = a5;
  uint64_t v9 = (void (**)(void))a6;
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v9[2](v9);
}

- (id)_quicProtocolOptionsFromParameters:(id)a3
{
  v3 = a3;
  nw_protocol_stack_t v4 = nw_parameters_copy_default_protocol_stack(v3);
  nw_protocol_definition_t v5 = v4;
  if (v4)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = sub_100088294;
    BOOL v13 = sub_1000882A4;
    id v14 = 0;
    iterate_block[0] = _NSConcreteStackBlock;
    iterate_block[1] = 3221225472;
    iterate_block[2] = sub_1000882AC;
    iterate_block[3] = &unk_100123EB8;
    iterate_block[4] = &v9;
    nw_protocol_stack_iterate_application_protocols(v4, iterate_block);
    id v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v6 = 0;
  }

  return v6;
}

- (void)startFlow:(id)a3 listener:(id)a4 client:(id)a5 assign:(id)a6 parameters:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = a7;
  id v16 = (void *)nw_agent_client_copy_endpoint();
  v17 = [v12 nearbyInvitationConnection];

  v18 = 0;
  if (v12 && !v17)
  {
    v19 = +[RPNWListener findListenerForAgentClient:v12 sender:0 browseRequest:0];
    v20 = v19;
    if (v19)
    {
      uint64_t v21 = [v19 removeTriggeredConnection];
      if (v21)
      {
        v18 = (void *)v21;
        v54 = v11;
        v22 = v16;
        v23 = [v20 incomingConnections];
        id v24 = [v23 count];

        if (v24)
        {
          if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          id v25 = [v20 incomingConnections];
          v26 = [v25 objectAtIndexedSubscript:0];

          v27 = [v12 listen_framer];
          +[RPNWFramer startConnection:v27];

          [v20 markConnectionAsTriggered:v26];
        }
        v28 = [v18 endpointUUID];
        id v48 = v14;
        v51 = v15;
        if ([v54 isUsingQUIC]) {
          networkAgentID = 0;
        }
        else {
          networkAgentID = self->_networkAgentID;
        }
        v30 = [v12 applicationService];
        uint64_t v49 = +[RPNWPeer createNWEndpointWithID:v28 agentID:networkAgentID applicationService:v30];

        v31 = [v18 peer];
        v32 = [v31 destinationDevice];
        v33 = [v18 endpointUUID];
        v34 = [v18 applicationService];
        +[RPNWEndpoint addEndpointMapping:v32 endpointID:v33 applicationService:v34 discoverySessionID:0 shouldAutomapListener:1];

        id v14 = v48;
        id v16 = (void *)v49;
        v15 = v51;
        goto LABEL_24;
      }
      if (dword_100142248 > 30 || dword_100142248 == -1 && !_LogCategory_Initialize())
      {
LABEL_48:

        goto LABEL_49;
      }
    }
    else if (dword_100142248 > 90 || dword_100142248 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_48;
    }
    LogPrintF();
    goto LABEL_48;
  }
  v54 = v11;
LABEL_24:
  v35 = nw_parameters_copy_local_endpoint(v15);
  if (!v35)
  {
    v36 = +[NSUUID UUID];
    if ([v54 isUsingQUIC]) {
      v37 = 0;
    }
    else {
      v37 = self->_networkAgentID;
    }
    v35 = +[RPNWPeer createNWEndpointWithID:v36 agentID:v37 applicationService:@"dummy"];
    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
    {
      v47 = v35;
      LogPrintF();
    }
  }
  v38 = (void *)nw_agent_client_copy_path();
  if (nw_path_is_listener())
  {
    id v11 = v54;
    [v54 setFlowAssignHandler:v14];
    [v54 setLocalEndpoint:v35];
    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    -[RPNWNetworkAgent createListenerFramer:](self, "createListenerFramer:", v54, v47);
  }
  else
  {
    id v50 = v13;
    v52 = v15;
    id v39 = v14;
    v55[0] = 0;
    v55[1] = 0;
    nw_endpoint_get_service_identifier();
    id v40 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v55];
    uint64_t v41 = +[RPNWNearbyInvitationEndpoint findEndpoint:v40];
    uint64_t v42 = [v12 nearbyInvitationConnection];
    uint64_t v43 = v41 | v42;

    if (v43)
    {
      v44 = v16;
      if (v41)
      {
        v45 = [(id)v41 applicationService];
        [v54 setApplicationService:v45];
      }
      id v14 = v39;
      if (_os_feature_enabled_impl())
      {
        v46 = [v12 nearbyInvitationConnection];
        [(RPNWNetworkAgent *)self createNearbyInvitationConnectionFramer:v54 assign:v39 local:v35 remote:v16 incomingConnection:v46];

        id v14 = v39;
      }
    }
    else
    {
      id v14 = v39;
      v44 = v16;
      [(RPNWNetworkAgent *)self createConnectionFramer:v54 assign:v39 local:v35 remote:v16 incomingConnection:v18];
    }

    id v16 = v44;
    id v11 = v54;
    id v13 = v50;
    v15 = v52;
  }

LABEL_49:
}

+ (id)sharedNetworkAgent
{
  if (qword_100142EF8 != -1) {
    dispatch_once(&qword_100142EF8, &stru_100123B10);
  }
  v2 = (void *)qword_100142EF0;

  return v2;
}

+ (id)getLogInfo
{
  return &stru_100125378;
}

+ (id)getCurrentPersona
{
  return 0;
}

- (RPNWNetworkAgent)init
{
  v7.receiver = self;
  v7.super_class = (Class)RPNWNetworkAgent;
  v2 = [(RPNWNetworkAgent *)&v7 init];
  if (v2)
  {
    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v3 = CUMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    [(RPNWNetworkAgent *)v2 createRapportServer];
    [(RPNWNetworkAgent *)v2 createBrowseAgent];
    [(RPNWNetworkAgent *)v2 createNetworkAgent];
    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    nw_protocol_definition_t v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)RPNWNetworkAgent;
  [(RPNWNetworkAgent *)&v2 dealloc];
}

- (id)descriptionWithLevel:(int)a3
{
  NSAppendPrintF();
  id v3 = 0;
  +[RPNWAgentClient listAgentClients:v3];
  +[RPNWEndpoint listEndpoints:v3];
  +[RPNWListener listAllowedApplicationServices:v3];
  +[RPNWConnection listConnections:v3];

  return v3;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100081634;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008172C;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPNWNetworkAgent *)self _invalidated];
  }
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_update
{
  if (self->_prefNetworkAgentEnabled) {
    [(RPNWNetworkAgent *)self _ensureStarted];
  }
  else {
    [(RPNWNetworkAgent *)self _ensureStopped];
  }
}

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  return 0;
}

- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5
{
  return 0;
}

- (BOOL)removeXPCMatchingToken:(unint64_t)a3
{
  return 0;
}

- (id)getDiscoveryDeviceTypesDescription:(unsigned int)a3
{
  id v4 = objc_alloc_init((Class)NSMutableString);
  [v4 appendString:@"<"];
  if (a3 == -1)
  {
    CFStringRef v5 = @" all devices";
LABEL_16:
    [v4 appendString:v5];
    goto LABEL_17;
  }
  if (a3)
  {
    [v4 appendString:@" iPhone"];
    if ((a3 & 2) == 0)
    {
LABEL_4:
      if ((a3 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_12;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_4;
  }
  [v4 appendString:@" iPad"];
  if ((a3 & 4) == 0)
  {
LABEL_5:
    if ((a3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v4 appendString:@" mac"];
  if ((a3 & 8) == 0)
  {
LABEL_6:
    if ((a3 & 0x10) == 0) {
      goto LABEL_7;
    }
LABEL_14:
    [v4 appendString:@" atv"];
    if ((a3 & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
LABEL_13:
  [v4 appendString:@" watch"];
  if ((a3 & 0x10) != 0) {
    goto LABEL_14;
  }
LABEL_7:
  if ((a3 & 0x20) != 0)
  {
LABEL_15:
    CFStringRef v5 = @" homepod";
    goto LABEL_16;
  }
LABEL_17:
  [v4 appendString:@" >"];

  return v4;
}

- (unint64_t)convertBrowseScopeToControlFlags:(unsigned int)a3
{
  uint64_t v3 = 12288;
  if (a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (a3 << 18) & 0x100000 | ((((unint64_t)(a3 & 8) >> 3) & 1) << 44) | v3 | (a3 << 11) & 0x1000 | (a3 << 9) & 0x2000 | ((unint64_t)(a3 & 0x40) << 37) & 0xFFFFDFFFFFFFFFFFLL | ((((unint64_t)(a3 & 0x20) >> 5) & 1) << 45);
  if ((a3 & 0x80) != 0) {
    return 0x380000103C00;
  }
  else {
    return v4;
  }
}

- (unint64_t)convertConnectionParametersToControlFlags:(id)a3
{
  id v3 = a3;
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  unint64_t v4 = 0x60000220000;
  int next_hop_required_interface_subtype = nw_parameters_get_next_hop_required_interface_subtype();
  if (next_hop_required_interface_subtype != 1002)
  {
    if (next_hop_required_interface_subtype == 1001)
    {
      unint64_t v4 = 0x60000400000;
    }
    else if (nw_parameters_get_include_ble())
    {
      unint64_t v4 = 0x40000600100;
    }
    else
    {
      unint64_t v4 = 0;
    }
  }
  id v6 = (void *)nw_parameters_copy_prohibited_interface_subtypes();
  if (xpc_array_get_count(v6))
  {
    size_t v7 = 0;
    do
    {
      int uint64 = xpc_array_get_uint64(v6, v7);
      uint64_t v9 = v4 | 0x400000;
      if (uint64 != 1002) {
        uint64_t v9 = v4;
      }
      if (uint64 == 1001) {
        v4 |= 0x200000uLL;
      }
      else {
        unint64_t v4 = v9;
      }
      ++v7;
    }
    while (v7 < xpc_array_get_count(v6));
  }
  id v10 = (void *)nw_parameters_copy_preferred_interface_subtypes();
  if (xpc_array_get_count(v10))
  {
    size_t v11 = 0;
    do
    {
      if (xpc_array_get_uint64(v10, v11) == 1002) {
        v4 |= 0x20000uLL;
      }
      ++v11;
    }
    while (v11 < xpc_array_get_count(v10));
  }
  if (dword_100142248 < 31 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  return v4;
}

- (unint64_t)convertBrowseParamsToControlFlags:(id)a3
{
  id v3 = a3;
  int include_ble = nw_parameters_get_include_ble();
  int include_screen_off_devices = nw_parameters_get_include_screen_off_devices();
  uint64_t v6 = 2;
  if (!include_ble) {
    uint64_t v6 = 0;
  }
  uint64_t v7 = 65538;
  if (!include_ble) {
    uint64_t v7 = 0;
  }
  if (include_screen_off_devices) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v6;
  }
  if (nw_parameters_get_next_hop_required_interface_type())
  {
    if (nw_parameters_get_next_hop_required_interface_type() == 1) {
      v8 |= 4uLL;
    }
    LOBYTE(include_ble) = 1;
  }
  if (nw_parameters_get_next_hop_required_interface_subtype())
  {
    int next_hop_required_interface_subtype = nw_parameters_get_next_hop_required_interface_subtype();
    if (next_hop_required_interface_subtype == 1002)
    {
      if (dword_100142248 <= 60 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else if (next_hop_required_interface_subtype == 1001)
    {
      v8 |= 4uLL;
    }
    id v10 = (void *)nw_parameters_copy_preferred_interface_subtypes();
    goto LABEL_18;
  }
  size_t v11 = (void *)nw_parameters_copy_preferred_interface_subtypes();
  id v10 = v11;
  if (include_ble)
  {
LABEL_18:
    BOOL v12 = 1;
    goto LABEL_19;
  }
  BOOL v12 = xpc_array_get_count(v11) != 0;
LABEL_19:
  if (xpc_array_get_count(v10))
  {
    size_t v13 = 0;
    do
    {
      int uint64 = xpc_array_get_uint64(v10, v13);
      if (uint64 == 1002)
      {
        if (dword_100142248 <= 60 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
      }
      else if (uint64 == 1001)
      {
        v8 |= 4uLL;
      }
      ++v13;
    }
    while (v13 < xpc_array_get_count(v10));
  }
  v15 = (void *)nw_parameters_copy_prohibited_interface_subtypes();
  if (xpc_array_get_count(v15))
  {
    size_t v16 = 0;
    do
    {
      int v17 = xpc_array_get_uint64(v15, v16);
      unint64_t v18 = v8 & 0xFFFFFFFFFFFFFFFBLL;
      if (v17 != 1001) {
        unint64_t v18 = v8;
      }
      if (v17 == 1002) {
        v8 &= ~8uLL;
      }
      else {
        unint64_t v8 = v18;
      }
      ++v16;
    }
    while (v16 < xpc_array_get_count(v15));
  }
  if (v15)
  {
    if (dword_100142248 <= 60 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    v19 = (void *)nw_parameters_copy_prohibited_interface_types();
    v20 = v19;
    if (v19) {
      int v21 = 1;
    }
    else {
      int v21 = v12;
    }
    if (xpc_array_get_count(v19))
    {
      size_t v22 = 0;
      do
      {
        int v23 = xpc_array_get_uint64(v20, v22);
        unint64_t v24 = v8 & 0xFFFFFFFFFFFFFFFBLL;
        if (v23 != 1001) {
          unint64_t v24 = v8;
        }
        if (v23 == 1002) {
          v8 &= ~8uLL;
        }
        else {
          unint64_t v8 = v24;
        }
        ++v22;
      }
      while (v22 < xpc_array_get_count(v20));
    }

    if (!v21) {
      unint64_t v8 = 32774;
    }
  }

  return v8;
}

- (BOOL)discoverDevices:(id)a3 response:(id)a4 nearbyInvitation:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 browseDescriptor];

  if (!v10)
  {
    if (dword_100142248 > 30 || dword_100142248 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_46;
    }
    goto LABEL_22;
  }
  if (!v5)
  {
    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
    {
      id v30 = [v8 browseDescriptor];
      LogPrintF();
    }
    size_t v11 = [v8 browseDescriptor:v30];
    uint64_t device_types = nw_browse_descriptor_get_device_types();

    if (device_types)
    {
      size_t v13 = [v8 browseDescriptor];
      uint64_t browse_scope = nw_browse_descriptor_get_browse_scope();

      if (dword_100142248 <= 10 && (dword_100142248 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v31 = browse_scope;
        LogPrintF();
      }
      unint64_t v15 = -[RPNWNetworkAgent convertBrowseScopeToControlFlags:](self, "convertBrowseScopeToControlFlags:", browse_scope, v31);
      size_t v16 = [v8 browseClient];
      int v17 = (void *)nw_agent_client_copy_parameters();

      if (dword_100142248 <= 10 && (dword_100142248 != -1 || _LogCategory_Initialize()))
      {
        v32 = v17;
        LogPrintF();
      }
      unint64_t v18 = -[RPNWNetworkAgent convertBrowseParamsToControlFlags:](self, "convertBrowseParamsToControlFlags:", v17, v32) | v15;
      id v19 = objc_alloc_init((Class)NSMutableArray);
      v20 = [v8 browseDescriptor];
      id v21 = v19;
      nw_browse_descriptor_enumerate_device_filters();

      if (dword_100142248 <= 10 && (dword_100142248 != -1 || _LogCategory_Initialize()))
      {
        unint64_t v33 = v18;
        v35 = &unk_10011AAC5;
        LogPrintF();
      }
      size_t v22 = [v8 applicationService:v33 withOptions:v35];

      if (v22)
      {
        if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
        {
          int v23 = [v8 applicationService];
          [(RPNWNetworkAgent *)self getDiscoveryDeviceTypesDescription:device_types];
          v36 = v34 = v23;
          LogPrintF();
        }
        networkAgentID = self->_networkAgentID;
        v27 = [v8 applicationService:v34 withOptions:v36];
        [v8 startDiscovery:v9 deviceTypes:device_types controlFlags:v18 deviceFilter:v21 agentUUID:networkAgentID applicationService:v27];
      }
      else if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

      if (v22) {
        goto LABEL_44;
      }
LABEL_46:
      BOOL v28 = 0;
      goto LABEL_47;
    }
    if (dword_100142248 > 30 || dword_100142248 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_46;
    }
LABEL_22:
    LogPrintF();
    goto LABEL_46;
  }
  if (_os_feature_enabled_impl())
  {
    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
    {
      id v30 = [v8 browseInvitationScope];
      LogPrintF();
    }
    unint64_t v24 = self->_networkAgentID;
    id v25 = [v8 applicationService:v30];
    [v8 startNearbyInvitationDiscovery:v9 agentUUID:v24 applicationService:v25];
  }
LABEL_44:
  BOOL v28 = 1;
LABEL_47:

  return v28;
}

- (BOOL)createRapportServer
{
  id v3 = objc_alloc_init(RPNWPeer);
  server = self->server;
  self->server = v3;

  [(RPNWPeer *)self->server receiveWithRequestID:@"com.apple.oneapi.browsing" receiveHandler:&stru_100123B78];
  BOOL v5 = self->server;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008278C;
  v9[3] = &unk_100123BA0;
  v9[4] = self;
  [(RPNWPeer *)v5 receiveWithRequestID:@"com.apple.oneapi.resolve" receiveHandler:v9];
  uint64_t v6 = self->server;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100082B30;
  v8[3] = &unk_100123BA0;
  v8[4] = self;
  [(RPNWPeer *)v6 receiveWithRequestID:@"com.apple.oneapi.connection" receiveHandler:v8];
  [(RPNWPeer *)self->server handleConnectionData:1];
  return 1;
}

- (BOOL)createConnectionFramer:(id)a3 assign:(id)a4 local:(id)a5 remote:(id)a6 incomingConnection:(id)a7
{
  size_t v11 = (RPNWConnection *)a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
  {
    id v46 = v13;
    id v48 = v14;
    LogPrintF();
  }
  if ([(RPNWConnection *)v11 type] != (id)4)
  {
    if ([(RPNWConnection *)v11 type] == (id)3)
    {
      if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
      {
        v47 = v11;
        LogPrintF();
      }
      if (v15)
      {
        id v53 = v15;
        v26 = (RPNWConnection *)v15;
        [(RPNWConnection *)v11 applicationService];
        id v55 = v14;
        id v56 = v12;
        v52 = id v54 = v13;
        if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
        {
          v47 = v26;
          LogPrintF();
        }
        unsigned int v51 = 0;
        goto LABEL_49;
      }
      if (dword_100142248 > 90 || dword_100142248 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_67;
      }
    }
    else if (dword_100142248 > 90 || dword_100142248 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_67;
    }
    LogPrintF();
    goto LABEL_67;
  }
  id v56 = v12;
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
  {
    v47 = v11;
    LogPrintF();
  }
  v65[0] = 0;
  v65[1] = 0;
  nw_endpoint_get_service_identifier();
  id v16 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v65];
  uint64_t v17 = +[RPNWEndpoint findEndpoint:v16];
  if (!v17)
  {
    uint64_t apple_service_apple_id = nw_endpoint_get_apple_service_apple_id();
    if (apple_service_apple_id)
    {
      id v55 = v14;
      BOOL v28 = v11;
      v29 = +[NSString stringWithUTF8String:apple_service_apple_id];
      id v19 = [objc_alloc((Class)NSUUID) initWithUUIDString:v29];

      uint64_t v30 = +[RPNWEndpoint findEndpoint:v19];
      if (v30)
      {
        unint64_t v18 = (RPNWConnection *)v30;
        id v53 = v15;
        id v54 = v13;

        size_t v11 = v28;
        goto LABEL_19;
      }
      if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }

      size_t v11 = v28;
      id v14 = v55;
    }
    else
    {
      if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v19 = v16;
    }

LABEL_67:
    id v31 = 0;
LABEL_68:
    BOOL v32 = 0;
    goto LABEL_69;
  }
  unint64_t v18 = (RPNWConnection *)v17;
  id v53 = v15;
  id v54 = v13;
  id v55 = v14;
  id v19 = v16;
LABEL_19:
  uint64_t v20 = [(RPNWConnection *)v18 applicationService];
  unsigned int v51 = [(RPNWConnection *)v18 shouldAutomapListener];
  id v21 = [RPNWConnection alloc];
  size_t v22 = [(RPNWConnection *)v18 device];
  id v23 = [(RPNWConnection *)v18 browseSession];
  unint64_t v24 = +[NSUUID UUID];
  id v25 = [(RPNWConnection *)v18 endpointUUID];
  v52 = (void *)v20;
  v26 = [(RPNWConnection *)v21 initWithPeer:v22 version:0 inbound:0 internal:v23 applicationService:v20 connectionID:v24 endpointID:v25];

  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
  {
    v47 = v18;
    uint64_t v49 = v26;
    LogPrintF();
  }

  if (v26)
  {
LABEL_49:
    unint64_t v33 = [(RPNWConnection *)v26 peer];
    v34 = [(RPNWConnection *)v26 peer];
    v35 = [v34 destinationDevice];
    unsigned int v50 = [(RPNWConnection *)v26 inbound];
    id v36 = [(RPNWConnection *)v11 controlFlags];
    v37 = [(RPNWConnection *)v26 endpointUUID];
    v38 = [(RPNWConnection *)v26 connectionUUID];
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_100083780;
    v62[3] = &unk_100123C18;
    v63 = v26;
    id v39 = v11;
    v64 = v39;
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_100083A30;
    v60[3] = &unk_100121158;
    id v40 = v63;
    v61 = v40;
    [v33 connectToPeer:v35 inboundConnection:v50 controlFlags:v36 applicationService:v52 listenerID:v37 automapListener:v51 connectionID:v38 connectHandler:v62 lostHandler:v60];

    [(RPNWConnection *)v39 setConnection:v40];
    start_handler[0] = _NSConcreteStackBlock;
    start_handler[1] = 3221225472;
    start_handler[2] = sub_100083AE4;
    start_handler[3] = &unk_100123C68;
    v58 = v40;
    id v31 = v52;
    id v59 = v31;
    uint64_t v41 = v40;
    definition = nw_framer_create_definition("client-pipe", 0, start_handler);
    nw_protocol_options_t options = nw_framer_create_options(definition);

    nw_protocol_definition_t v44 = nwrapport_copy_protocol_definition();
    if (dword_100142248 <= 40 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    nw_framer_options_set_peer_protocol_definition();
    id v14 = v55;
    id v12 = v56;
    id v13 = v54;
    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*((void (**)(id, id, id, nw_protocol_options_t))v56 + 2))(v56, v54, v55, options);

    BOOL v32 = 1;
    id v15 = v53;
    goto LABEL_69;
  }
  if (dword_100142248 <= 90)
  {
    id v14 = v55;
    id v15 = v53;
    id v13 = v54;
    id v31 = v52;
    if (dword_100142248 != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    goto LABEL_68;
  }
  BOOL v32 = 0;
  id v14 = v55;
  id v15 = v53;
  id v13 = v54;
  id v31 = v52;
LABEL_69:

  return v32;
}

- (BOOL)createNearbyInvitationConnectionFramer:(id)a3 assign:(id)a4 local:(id)a5 remote:(id)a6 incomingConnection:(id)a7
{
  size_t v11 = (RPNWNearbyInvitationConnection *)a3;
  id v12 = (void (**)(id, id, void, nw_protocol_options_t))a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
  {
    id v44 = v13;
    id v46 = v14;
    LogPrintF();
  }
  if ([(RPNWNearbyInvitationConnection *)v11 type] == (id)4)
  {
    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v61[0] = 0;
    v61[1] = 0;
    nw_endpoint_get_service_identifier();
    id v18 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v61];
    id v19 = +[RPNWNearbyInvitationEndpoint findEndpoint:v18];
    if (v19)
    {
      uint64_t v20 = v19;
      id v51 = v15;
      id v52 = v14;
      uint64_t v17 = [v19 applicationService];
      id v21 = [RPNWNearbyInvitationConnection alloc];
      size_t v22 = [v20 device];
      uint64_t v49 = v18;
      id v23 = v12;
      id v24 = [v20 browseSession];
      +[NSUUID UUID];
      id v25 = v11;
      v27 = id v26 = v13;
      BOOL v28 = [v20 endpointUUID];
      id v29 = v24;
      id v12 = v23;
      id v16 = [(RPNWNearbyInvitationConnection *)v21 initWithPeer:v22 session:0 inbound:0 internal:v29 applicationService:v17 connectionID:v27 endpointID:v28];

      id v13 = v26;
      size_t v11 = v25;

      goto LABEL_17;
    }
    if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }

LABEL_41:
    BOOL v42 = 0;
    goto LABEL_42;
  }
  if ([(RPNWNearbyInvitationConnection *)v11 type] == (id)3)
  {
    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
    {
      v45 = v11;
      LogPrintF();
    }
    if (v15)
    {
      id v51 = v15;
      id v16 = (RPNWNearbyInvitationConnection *)v15;
      uint64_t v17 = [(RPNWNearbyInvitationConnection *)v11 applicationService];
      id v52 = v14;
      if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
      {
        v45 = v16;
        LogPrintF();
      }
      goto LABEL_17;
    }
    if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_41;
  }
  id v51 = v15;
  id v52 = v14;
  id v16 = 0;
  uint64_t v17 = 0;
LABEL_17:
  uint64_t v30 = [(RPNWNearbyInvitationConnection *)v16 peer];
  id v31 = [v30 nearbyInvitationSession];

  if (!v31)
  {
    BOOL v32 = [(RPNWNearbyInvitationConnection *)v16 peer];
    unint64_t v33 = [(RPNWNearbyInvitationConnection *)v16 peer];
    [v33 destinationDevice];
    v34 = id v48 = v13;
    unsigned int v47 = [(RPNWNearbyInvitationConnection *)v16 inbound];
    [(RPNWNearbyInvitationConnection *)v16 endpointUUID];
    v35 = unsigned int v50 = v12;
    id v36 = [(RPNWNearbyInvitationConnection *)v16 connectionUUID];
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100084834;
    v58[3] = &unk_100123C18;
    id v59 = v16;
    v60 = v11;
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_100084AA8;
    v56[3] = &unk_100121158;
    v57 = v59;
    [v32 connectToPeer:v34 inboundConnection:v47 applicationService:v17 listenerID:v35 connectionID:v36 connectHandler:v58 disconnectHandler:v56];

    id v12 = v50;
    id v13 = v48;
  }
  [(RPNWNearbyInvitationConnection *)v11 setNearbyInvitationConnection:v16];
  start_handler[0] = _NSConcreteStackBlock;
  start_handler[1] = 3221225472;
  start_handler[2] = sub_100084B5C;
  start_handler[3] = &unk_100123C68;
  id v54 = v16;
  id v55 = v17;
  id v37 = v17;
  v38 = v16;
  definition = nw_framer_create_definition("client-pipe-nbinv", 0, start_handler);
  nw_protocol_options_t options = nw_framer_create_options(definition);

  nw_protocol_definition_t v41 = nwrapport_copy_protocol_definition();
  if (dword_100142248 <= 40 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  nw_framer_options_set_peer_protocol_definition();
  id v14 = v52;
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  ((void (**)(id, id, id, nw_protocol_options_t))v12)[2](v12, v13, v52, options);

  BOOL v42 = 1;
  id v15 = v51;
LABEL_42:

  return v42;
}

- (BOOL)setupPolicyWithQueue:(id)a3 browseAgent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v14 = (NEPolicySession *)objc_alloc_init((Class)NEPolicySession);
    policySession = self->_policySession;
    self->_policySession = v14;

    id v16 = self->_policySession;
    if (v16)
    {
      id v33 = v6;
      [(NEPolicySession *)v16 setPriority:300];
      [(NEPolicySession *)self->_policySession lockSessionToCurrentProcess];
      uint64_t v17 = +[NEPolicyResult netAgentUUID:self->_browseAgentID];
      id v18 = +[NEPolicyCondition allInterfaces];
      id v19 = +[NEPolicyCondition requiredAgentDomain:@"com.apple.rapport.browse" agentType:@"RapportBrowseAgent"];
      uint64_t v20 = +[NEPolicyCondition customEntitlement:@"com.apple.private.application-service-browse"];
      uint64_t v21 = geteuid();
      if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v30 = v21;
        LogPrintF();
      }
      id v24 = +[NEPolicyCondition uid:](NEPolicyCondition, "uid:", v21, v30);
      v37[0] = v18;
      v37[1] = v19;
      v37[2] = v20;
      v37[3] = v24;
      id v25 = +[NSArray arrayWithObjects:v37 count:4];
      id v26 = [objc_alloc((Class)NEPolicy) initWithOrder:10 result:v17 conditions:v25];
      id v27 = [(NEPolicySession *)self->_policySession addPolicy:v26];
      if (v27)
      {
        if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
        {
          browseAgentID = self->_browseAgentID;
          LogPrintF();
          [(NEPolicySession *)self->_policySession apply];
        }
        else
        {
          [(NEPolicySession *)self->_policySession apply];
        }
      }
      else if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

      id v6 = v33;
      if (v27) {
        goto LABEL_41;
      }
LABEL_48:
      BOOL v28 = 0;
      goto LABEL_49;
    }
    if (dword_100142248 > 90 || dword_100142248 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_48;
    }
LABEL_19:
    LogPrintF();
    goto LABEL_48;
  }
  uint64_t v7 = (NEVirtualInterface_s *)NEVirtualInterfaceCreate();
  self->_interface = v7;
  if (!v7)
  {
    if (dword_100142248 > 90 || dword_100142248 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_48;
    }
    goto LABEL_19;
  }
  id v8 = (void *)NEVirtualInterfaceCopyName();
  NEVirtualInterfaceSetRankNever();
  int v36 = 0;
  uint64_t v35 = 0;
  uint64_t v34 = 33022;
  id v9 = v8;
  arc4random_buf(&v35, 8uLL);
  inet_ntop(30, &v34, v38, 0x1Cu);
  id v10 = +[NSString stringWithUTF8String:v38];
  size_t v11 = [v10 stringByAppendingString:@"%"];
  id v12 = [v11 stringByAppendingString:v9];

  id v13 = v12;
  NEVirtualInterfaceAddAddress();
  NEVirtualInterfaceUpdateAdHocService();
  NEVirtualInterfaceSetReadAutomatically();
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v22 = v9;
  [v22 UTF8String];
  id v23 = (void *)nw_interface_create_with_name();
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if ((nw_agent_add_to_interface() & 1) == 0)
  {
    if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }

    goto LABEL_48;
  }

LABEL_41:
  BOOL v28 = 1;
LABEL_49:

  return v28;
}

- (BOOL)setupBrowseHandlers
{
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  nw_agent_set_browse_handlers();
  return 1;
}

- (void)resolveRequest:(id)a3 existingEndpoint:(id)a4 controlFlags:(unint64_t)a5 clientPublicKey:(id)a6 client:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  id v14 = a6;
  id v15 = a4;
  id v16 = objc_alloc_init(RPNWPeer);
  uint64_t v17 = [v15 device];
  id v18 = [v15 applicationService];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100085CB8;
  v21[3] = &unk_100123D48;
  v21[4] = self;
  id v22 = v13;
  id v23 = v12;
  id v19 = v12;
  id v20 = v13;
  [(RPNWPeer *)v16 resolvePeer:v17 controlFlags:a5 applicationService:v18 clientPublicKey:v14 resolveHandler:v21];
}

- (BOOL)setupResolveHandlers
{
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  nw_agent_add_resolve_handlers();
  return 1;
}

- (void)createListener:(id)a3 nearbyInvitation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = +[NSUUID UUID];
  if ([v6 isUsingQUIC]) {
    networkAgentID = 0;
  }
  else {
    networkAgentID = self->_networkAgentID;
  }
  id v9 = [v6 applicationService];
  id v10 = +[RPNWPeer createNWEndpointWithID:v7 agentID:networkAgentID applicationService:v9];

  size_t v11 = (void *)nw_array_create();
  nw_array_append();
  id v12 = [v6 browseResponse];
  ((void (**)(void, void *))v12)[2](v12, v11);

  if (v4)
  {
    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
    {
      id v16 = +[RPNWNetworkAgent getLogInfo];
      LogPrintF();
    }
    id v13 = objc_alloc_init(RPNWNearbyInvitationPeer);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100086E90;
    v20[3] = &unk_1001222C0;
    id v21 = v6;
    id v22 = v13;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100086F60;
    v17[3] = &unk_1001219D0;
    id v14 = v21;
    id v18 = v14;
    id v15 = v22;
    id v19 = v15;
    [(RPNWNearbyInvitationPeer *)v15 startServer:v14 withCompletion:v20 disconnectHandler:v17];
    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
    {
      id v16 = +[RPNWNetworkAgent getLogInfo];
      LogPrintF();
    }
    -[RPNWNetworkAgent createListenerFramer:](self, "createListenerFramer:", v14, v16);
  }
  else
  {
    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
    {
      id v16 = +[RPNWNetworkAgent getLogInfo];
      LogPrintF();
    }
    -[RPNWNetworkAgent createListenerFramer:](self, "createListenerFramer:", v6, v16);
  }
}

- (BOOL)setupListenHandlers
{
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  nw_agent_set_browse_handlers();
  return 1;
}

- (id)_applicationServiceAdvertiseDescriptorForClient:(id)a3
{
  id v3 = (void *)nw_agent_client_copy_advertise_descriptor();
  if (!v3)
  {
    if (dword_100142248 > 30 || dword_100142248 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_13;
    }
    goto LABEL_9;
  }
  if (nw_advertise_descriptor_get_type() == 2)
  {
    id v4 = v3;
    goto LABEL_14;
  }
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
LABEL_9:
  }
    LogPrintF();
LABEL_13:
  id v4 = 0;
LABEL_14:

  return v4;
}

- (BOOL)setupFlowHandlers
{
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  nw_agent_set_flow_handlers();
  return 1;
}

- (void)setupAssertHandlers:(id)a3
{
  id v3 = a3;
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  nw_agent_set_assert_handlers();
}

- (BOOL)createBrowseAgent
{
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = (OS_nw_agent *)nw_agent_create();
  browseAgent = self->_browseAgent;
  self->_browseAgent = v3;

  BOOL v5 = self->_browseAgent;
  if (v5)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    nw_agent_get_uuid();
    id v6 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDBytes:&v10];
    browseAgentID = self->_browseAgentID;
    self->_browseAgentID = v6;

    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
    {
      id v9 = self->_browseAgentID;
      LogPrintF();
    }
    -[RPNWNetworkAgent setupPolicyWithQueue:browseAgent:](self, "setupPolicyWithQueue:browseAgent:", self->_dispatchQueue, 1, v9, v10, v11);
    [(RPNWNetworkAgent *)self setupBrowseHandlers];
    [(RPNWNetworkAgent *)self setupResolveHandlers];
    [(RPNWNetworkAgent *)self setupAssertHandlers:self->_browseAgent];
    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    nw_agent_change_state();
    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      goto LABEL_19;
    }
  }
  else if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize()))
  {
LABEL_19:
    LogPrintF();
  }
  return v5 != 0;
}

- (BOOL)createNetworkAgent
{
  if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = (OS_nw_agent *)nw_agent_create();
  networkAgent = self->_networkAgent;
  self->_networkAgent = v3;

  BOOL v5 = self->_networkAgent;
  if (v5)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    nw_agent_get_uuid();
    id v6 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDBytes:&v10];
    networkAgentID = self->_networkAgentID;
    self->_networkAgentID = v6;

    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize()))
    {
      id v9 = self->_networkAgentID;
      LogPrintF();
    }
    -[RPNWNetworkAgent setupPolicyWithQueue:browseAgent:](self, "setupPolicyWithQueue:browseAgent:", self->_dispatchQueue, 0, v9, v10, v11);
    [(RPNWNetworkAgent *)self setupListenHandlers];
    [(RPNWNetworkAgent *)self setupFlowHandlers];
    [(RPNWNetworkAgent *)self setupAssertHandlers:self->_networkAgent];
    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    nw_agent_change_state();
    if (dword_100142248 <= 30 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      goto LABEL_19;
    }
  }
  else if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize()))
  {
LABEL_19:
    LogPrintF();
  }
  return v5 != 0;
}

- (id)_localPublicKeyForAgentClient:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)nw_agent_client_copy_parameters();
  if (v5)
  {
    id v6 = [(RPNWNetworkAgent *)self _quicProtocolOptionsFromParameters:v5];
    if (v6)
    {
      uint64_t v7 = (void *)nw_quic_options_copy_local_public_key();
      id v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }
      else if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v8 = 0;
    }
  }
  else
  {
    if (dword_100142248 <= 90 && (dword_100142248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v8 = 0;
  }

  return v8;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSUUID)networkAgentID
{
  return self->_networkAgentID;
}

- (void)setNetworkAgentID:(id)a3
{
}

- (NSUUID)browseAgentID
{
  return self->_browseAgentID;
}

- (void)setBrowseAgentID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browseAgentID, 0);
  objc_storeStrong((id *)&self->_networkAgentID, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->server, 0);
  objc_storeStrong((id *)&self->_currentPseudonym, 0);
  objc_storeStrong((id *)&self->_endpointIDsWithPendingResolveRequest, 0);
  objc_storeStrong((id *)&self->_pendingResolveResponsesByEndpointID, 0);
  objc_storeStrong((id *)&self->_policySession, 0);
  objc_storeStrong((id *)&self->_browseAgent, 0);

  objc_storeStrong((id *)&self->_networkAgent, 0);
}

@end