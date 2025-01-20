@interface SDAirDropAgent
- (NEPolicySession)policySession;
- (NEVirtualInterface_s)interface;
- (NSMutableSet)clientTokens;
- (NSUUID)identifier;
- (OS_dispatch_queue)dispatchQueue;
- (OS_nw_agent)browseAgent;
- (SDAirDropAgent)initWithEndpointService:(id)a3;
- (_TtC16DaemoniOSLibrary24SDAirDropEndpointService)endpointService;
- (id)_agentClientTokenForClient:(id)a3;
- (void)_createBrowseAgent;
- (void)_setupBrowseHandlers;
- (void)_setupPolicy;
- (void)handleEndpointsChanged:(id)a3;
- (void)setBrowseAgent:(id)a3;
- (void)setClientTokens:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEndpointService:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInterface:(NEVirtualInterface_s *)a3;
- (void)setPolicySession:(id)a3;
@end

@implementation SDAirDropAgent

- (SDAirDropAgent)initWithEndpointService:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SDAirDropAgent;
  v6 = [(SDAirDropAgent *)&v14 init];
  if (v6)
  {
    v7 = airdrop_nw_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Initializing Sharing network agent", buf, 2u);
    }

    objc_storeStrong((id *)&v6->_dispatchQueue, &_dispatch_main_q);
    uint64_t v8 = objc_opt_new();
    clientTokens = v6->_clientTokens;
    v6->_clientTokens = (NSMutableSet *)v8;

    objc_storeStrong((id *)&v6->_endpointService, a3);
    *(void *)buf = 0;
    objc_initWeak((id *)buf, v6);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001964F8;
    v11[3] = &unk_1008CF240;
    objc_copyWeak(&v12, (id *)buf);
    [(SDAirDropEndpointService *)v6->_endpointService setEndpointsChangedHandler:v11];
    if (+[SFAirDropUserDefaults_objc privateContactDiscoveryEnabled])[(SDAirDropAgent *)v6 _createBrowseAgent]; {
    objc_destroyWeak(&v12);
    }
    objc_destroyWeak((id *)buf);
  }

  return v6;
}

- (void)_setupPolicy
{
  v3 = airdrop_nw_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v24) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Configuring agent policies", (uint8_t *)&v24, 2u);
  }

  id v4 = objc_alloc_init((Class)NEPolicySession);
  [(SDAirDropAgent *)self setPolicySession:v4];

  id v5 = [(SDAirDropAgent *)self policySession];

  if (v5)
  {
    v6 = [(SDAirDropAgent *)self policySession];
    [v6 setPriority:300];

    v7 = [(SDAirDropAgent *)self policySession];
    [v7 lockSessionToCurrentProcess];

    uint64_t v8 = [(SDAirDropAgent *)self identifier];
    v9 = +[NEPolicyResult netAgentUUID:v8];

    v10 = +[NEPolicyCondition allInterfaces];
    v11 = +[NSString stringWithUTF8String:"com.apple.airdrop"];
    id v12 = +[NSString stringWithUTF8String:"AirDropNetworkAgent"];
    v13 = +[NEPolicyCondition requiredAgentDomain:v11 agentType:v12];

    objc_super v14 = +[NEPolicyCondition customEntitlement:@"com.apple.private.application-service-browse"];
    v26[0] = v10;
    v26[1] = v13;
    v26[2] = v14;
    v15 = +[NSArray arrayWithObjects:v26 count:3];
    id v16 = [objc_alloc((Class)NEPolicy) initWithOrder:10 result:v9 conditions:v15];
    v17 = [(SDAirDropAgent *)self policySession];
    id v18 = [v17 addPolicy:v16];

    if (!v18)
    {
      v19 = airdrop_nw_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [(SDAirDropAgent *)self identifier];
        int v24 = 138412290;
        v25 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Failed to add entitlement allow policy for agent %@", (uint8_t *)&v24, 0xCu);
      }
    }
    v21 = airdrop_nw_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [(SDAirDropAgent *)self identifier];
      int v24 = 138412290;
      v25 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Applying policies for agent %@", (uint8_t *)&v24, 0xCu);
    }
    v23 = [(SDAirDropAgent *)self policySession];
    [v23 apply];
  }
  else
  {
    v9 = airdrop_nw_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to create policy session", (uint8_t *)&v24, 2u);
    }
  }
}

- (void)_createBrowseAgent
{
  v3 = airdrop_nw_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating browse agent", buf, 2u);
  }

  id v4 = (void *)nw_agent_create();
  [(SDAirDropAgent *)self setBrowseAgent:v4];

  id v5 = [(SDAirDropAgent *)self browseAgent];

  if (v5)
  {
    *(void *)buf = 0;
    uint64_t v15 = 0;
    v6 = [(SDAirDropAgent *)self browseAgent];
    nw_agent_get_uuid();

    id v7 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:buf];
    [(SDAirDropAgent *)self setIdentifier:v7];

    uint64_t v8 = airdrop_nw_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(SDAirDropAgent *)self identifier];
      int v12 = 138412290;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Browse Agent UUID=%@", (uint8_t *)&v12, 0xCu);
    }
    [(SDAirDropAgent *)self _setupPolicy];
    [(SDAirDropAgent *)self _setupBrowseHandlers];
    [(SDAirDropAgent *)self _setupAssertHandlers];
    v10 = airdrop_nw_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Activating browse agent", (uint8_t *)&v12, 2u);
    }

    nw_agent_change_state();
    v11 = airdrop_nw_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Browse agent ready!", (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    v11 = airdrop_nw_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100197628(v11);
    }
  }
}

- (void)_setupBrowseHandlers
{
  v3 = airdrop_nw_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting Agent Browse handlers", buf, 2u);
  }

  id v4 = [(SDAirDropAgent *)self browseAgent];
  nw_agent_set_browse_handlers();
}

- (id)_agentClientTokenForClient:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(SDAirDropAgent *)self clientTokens];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 agentClient];
        id v11 = [v10 client];

        if (v11 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)handleEndpointsChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(SDAirDropAgent *)self dispatchQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10019720C;
  v7[3] = &unk_1008CA640;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_nw_agent)browseAgent
{
  return self->_browseAgent;
}

- (void)setBrowseAgent:(id)a3
{
}

- (NEVirtualInterface_s)interface
{
  return self->_interface;
}

- (void)setInterface:(NEVirtualInterface_s *)a3
{
  self->_interface = a3;
}

- (NEPolicySession)policySession
{
  return self->_policySession;
}

- (void)setPolicySession:(id)a3
{
}

- (_TtC16DaemoniOSLibrary24SDAirDropEndpointService)endpointService
{
  return self->_endpointService;
}

- (void)setEndpointService:(id)a3
{
}

- (NSMutableSet)clientTokens
{
  return self->_clientTokens;
}

- (void)setClientTokens:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientTokens, 0);
  objc_storeStrong((id *)&self->_endpointService, 0);
  objc_storeStrong((id *)&self->_policySession, 0);
  objc_storeStrong((id *)&self->_browseAgent, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end