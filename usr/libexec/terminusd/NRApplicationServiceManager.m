@interface NRApplicationServiceManager
- (NRApplicationServiceManager)init;
- (id)description;
@end

@implementation NRApplicationServiceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerAgentUUID, 0);
  objc_storeStrong((id *)&self->_listenerAgent, 0);
  objc_storeStrong((id *)&self->_resolverAgentUUID, 0);
  objc_storeStrong((id *)&self->_resolverAgent, 0);
  objc_storeStrong((id *)&self->_asNamesToIncomingResolveRequestEndpoint, 0);
  objc_storeStrong((id *)&self->_asClients, 0);
  objc_storeStrong((id *)&self->_asNameToResolveRequests, 0);
  objc_storeStrong((id *)&self->_asNameToBrowseRequests, 0);
  objc_storeStrong((id *)&self->_asNameToListenRequest, 0);
  objc_storeStrong((id *)&self->_policyIdentifier, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"\nName: NRApplicationServiceManager"];
  [v3 appendFormat:@"\nlisten: %@", self->_asNameToListenRequest];
  [v3 appendFormat:@"\nbrowse: %@", self->_asNameToBrowseRequests];
  [v3 appendFormat:@"\nresolve: %@", self->_asNameToResolveRequests];
  [v3 appendFormat:@"\nincoming: %@", self->_asNamesToIncomingResolveRequestEndpoint];
  v14 = v3;
  [v3 appendFormat:@"\nclients: %@", self->_asClients];
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = self->_asNameToResolveRequests;
  id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = sub_1000FF4D0((uint64_t)self, v10);
        if ([v11 count])
        {
          v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 count]);
          [v4 setObject:v12 forKeyedSubscript:v10];
        }
      }
      id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  [v14 appendFormat:@"\nresolver keys: %@", v4];

  return v14;
}

- (NRApplicationServiceManager)init
{
  v67.receiver = self;
  v67.super_class = (Class)NRApplicationServiceManager;
  id v3 = [(NRApplicationServiceManager *)&v67 init];
  if (!v3)
  {
    id v62 = sub_1000FF6A4();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v64 = sub_1000FF6A4();
      _NRLogWithArgs();
    }
    uint64_t v65 = _os_log_pack_size();
    __chkstk_darwin(v65);
    __error();
    uint64_t v66 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v66 = 136446210;
    *(void *)(v66 + 4) = "-[NRApplicationServiceManager init]";
    sub_1000FF6A4();
    _NRLogAbortWithPack();
    goto LABEL_34;
  }
  id v4 = v3;
  v5 = (OS_dispatch_queue *)sub_10015BD9C();
  queue = v4->_queue;
  v4->_queue = v5;

  id v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  asNameToListenRequest = v4->_asNameToListenRequest;
  v4->_asNameToListenRequest = v7;

  v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  asNameToBrowseRequests = v4->_asNameToBrowseRequests;
  v4->_asNameToBrowseRequests = v9;

  id v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  asNameToResolveRequests = v4->_asNameToResolveRequests;
  v4->_asNameToResolveRequests = v11;

  v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  asNamesToIncomingResolveRequestEndpoint = v4->_asNamesToIncomingResolveRequestEndpoint;
  v4->_asNamesToIncomingResolveRequestEndpoint = v13;

  long long v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  asClients = v4->_asClients;
  v4->_asClients = v15;

  long long v17 = (objc_class *)objc_opt_class();
  uint64_t v18 = NSStringFromClass(v17);
  policyIdentifier = v4->_policyIdentifier;
  v4->_policyIdentifier = (NSString *)v18;

  v20 = (OS_nw_agent *)nw_agent_create();
  v83[0] = 0;
  v83[1] = 0;
  nw_agent_get_uuid();
  v21 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDBytes:v83];
  resolverAgentUUID = v4->_resolverAgentUUID;
  v4->_resolverAgentUUID = v21;

  v72 = _NSConcreteStackBlock;
  uint64_t v73 = 3221225472;
  v74 = sub_100100D90;
  v75 = &unk_1001C7820;
  v76 = v4;
  *(void *)&long long v68 = _NSConcreteStackBlock;
  *((void *)&v68 + 1) = 3221225472;
  v23 = v4;
  *(void *)&long long v69 = sub_10010112C;
  *((void *)&v69 + 1) = &unk_1001C7848;
  *(void *)&long long v70 = v4;
  nw_agent_set_browse_handlers();
  v78 = _NSConcreteStackBlock;
  uint64_t v79 = 3221225472;
  v80 = sub_10010168C;
  v81 = &unk_1001C7820;
  v82 = v4;
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_100101C10;
  v77[3] = &unk_1001C7848;
  v77[4] = v4;
  nw_agent_add_resolve_handlers();
  nw_agent_change_state();
  resolverAgent = v4->_resolverAgent;
  v23->_resolverAgent = v20;
  v25 = v20;

  v26 = (OS_nw_agent *)nw_agent_create();
  v78 = 0;
  uint64_t v79 = 0;
  nw_agent_get_uuid();
  v27 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDBytes:&v78];
  listenerAgentUUID = v23->_listenerAgentUUID;
  v23->_listenerAgentUUID = v27;

  v72 = _NSConcreteStackBlock;
  uint64_t v73 = 3221225472;
  v74 = sub_10010010C;
  v75 = &unk_1001C7820;
  v76 = v23;
  *(void *)&long long v68 = _NSConcreteStackBlock;
  *((void *)&v68 + 1) = 3221225472;
  v2 = v23;
  *(void *)&long long v69 = sub_1001003CC;
  *((void *)&v69 + 1) = &unk_1001C7848;
  *(void *)&long long v70 = v23;
  nw_agent_set_browse_handlers();
  nw_agent_change_state();
  listenerAgent = v23->_listenerAgent;
  v23->_listenerAgent = v26;
  v30 = v26;

  v31 = v23->_resolverAgentUUID;
  if (v31)
  {
  }
  else if (!v23->_listenerAgentUUID)
  {
    goto LABEL_20;
  }
  id v32 = objc_alloc_init((Class)NSMutableArray);
  if (v23->_resolverAgentUUID)
  {
    v33 = +[NEPolicyResult removeNetworkAgentUUID:](NEPolicyResult, "removeNetworkAgentUUID:");
    [v32 addObject:v33];
  }
  if (v23->_listenerAgentUUID)
  {
    v34 = +[NEPolicyResult removeNetworkAgentUUID:](NEPolicyResult, "removeNetworkAgentUUID:");
    [v32 addObject:v34];
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v35 = v32;
  id v36 = [v35 countByEnumeratingWithState:&v68 objects:&v72 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v69;
    do
    {
      for (i = 0; i != v37; i = (char *)i + 1)
      {
        if (*(void *)v69 != v38) {
          objc_enumerationMutation(v35);
        }
        uint64_t v40 = *(void *)(*((void *)&v68 + 1) + 8 * i);
        id v41 = objc_alloc((Class)NEPolicy);
        v42 = +[NEPolicyCondition allInterfaces];
        v77[0] = v42;
        v43 = +[NSArray arrayWithObjects:v77 count:1];
        id v44 = [v41 initWithOrder:20 result:v40 conditions:v43];

        self;
        if (qword_1001F4D28 != -1) {
          dispatch_once(&qword_1001F4D28, &stru_1001C8658);
        }
        v2 = v23;
        id v45 = (id)qword_1001F4D20;
        id v46 = sub_100134CFC((uint64_t)v45, v23->_policyIdentifier, v44);
      }
      id v37 = [v35 countByEnumeratingWithState:&v68 objects:&v72 count:16];
    }
    while (v37);
  }

LABEL_20:
  v47 = v2->_resolverAgentUUID;
  if (v47)
  {
  }
  else if (!v2->_listenerAgentUUID)
  {
    goto LABEL_26;
  }
  v48 = +[NEPolicyResult skipWithOrder:21];
  v49 = +[NEPolicyCondition customEntitlement:@"com.apple.private.application-service-browse"];
  id v50 = objc_alloc((Class)NEPolicy);
  v51 = +[NEPolicyCondition allInterfaces];
  v78 = v51;
  uint64_t v79 = (uint64_t)v49;
  v52 = +[NSArray arrayWithObjects:&v78 count:2];
  id v53 = [v50 initWithOrder:15 result:v48 conditions:v52];

  self;
  if (qword_1001F4D28 != -1) {
    dispatch_once(&qword_1001F4D28, &stru_1001C8658);
  }
  id v54 = (id)qword_1001F4D20;
  id v55 = sub_100134CFC((uint64_t)v54, v2->_policyIdentifier, v53);

LABEL_26:
  self;
  if (qword_1001F4D28 != -1) {
LABEL_34:
  }
    dispatch_once(&qword_1001F4D28, &stru_1001C8658);
  id v56 = (id)qword_1001F4D20;
  v57 = (id *)v56;
  if (v56)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)v56 + 1));
    if (([v57[2] apply] & 1) == 0) {
      sub_100115AB0(@"NRPolicySessionManager", @"ApplyPolicy Failed", 0, 1, @"Failed to apply policies", v58, v59, v60, (uint64_t)v67.receiver);
    }
  }

  return v2;
}

@end