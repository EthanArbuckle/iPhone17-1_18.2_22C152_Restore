@interface CSCoordinator
+ (id)sharedInstance;
- (BOOL)getCollectAllTrustedForDiagnosticID:(id)a3;
- (BOOL)initProxiesForDiagnosticID:(id)a3;
- (BOOL)initiatedByRemoteHost;
- (BOOL)isAutomaticCoSysdiagnosePossible;
- (BOOL)isHost;
- (BOOL)isRemoteInitiated;
- (BOOL)setCollectAllTrusted:(BOOL)a3 forDiagnosticID:(id)a4;
- (BOOL)setHostOutputDir:(id)a3 forDiagnosticID:(id)a4;
- (BOOL)setProxies:(id)a3 forDiagnosticID:(id)a4;
- (BOOL)setRemoteUUIDs:(id)a3 forDiagnosticID:(id)a4;
- (BOOL)shouldGatherCoSysdiagnoses;
- (BOOL)triggerCoSysdiagnosesWithParams:(id)a3 forDiagnosticID:(id)a4;
- (BOOL)tryStartRemoteInitiatedFlowForMsg:(id)a3;
- (BOOL)waitForCoSysdiagnosesForDiagnosticID:(id)a3;
- (CSCoordinator)init;
- (NSDictionary)sessionConfigs;
- (OS_dispatch_group)hostWaitGroup;
- (OS_os_log)logSubsystem;
- (id)gatherLocalSysdiagnoseForMsg:(id)a3 withReply:(id)a4;
- (id)getHostOutputDirForDiagnosticID:(id)a3;
- (id)getProxiesForDiagnosticID:(id)a3;
- (id)getReceiveFileSemaForDiagnosticID:(id)a3;
- (id)getRemoteUUIDsForDiagnosticID:(id)a3;
- (id)waitForHostOutputDirForDiagnosticID:(id)a3;
- (void)addSessionConfig:(id)a3 forDiagnosticID:(id)a4;
- (void)endRemoteInitiatedFlow;
- (void)initRemoteServers;
- (void)readyToReceiveCoSysdiagnosesAtDir:(id)a3 forDiagnosticID:(id)a4;
- (void)removeSessionConfigForDiagnosticID:(id)a3;
- (void)safeLeaveHostWaitGroup;
- (void)setHostWaitGroup:(id)a3;
- (void)setInitiatedByRemoteHost:(BOOL)a3;
- (void)setIsRemoteInitiated:(BOOL)a3;
- (void)setLogSubsystem:(id)a3;
- (void)setSessionConfigs:(id)a3;
- (void)transferFileToHostIfNecessary:(id)a3 forDiagnosticID:(id)a4;
- (void)tryCreateSessionConfigForDiagnosticID:(id)a3;
@end

@implementation CSCoordinator

+ (id)sharedInstance
{
  if (qword_1000BD768 != -1) {
    dispatch_once(&qword_1000BD768, &stru_10009D220);
  }
  v2 = (void *)qword_1000BD760;

  return v2;
}

- (CSCoordinator)init
{
  v10.receiver = self;
  v10.super_class = (Class)CSCoordinator;
  v2 = [(CSCoordinator *)&v10 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_isRemoteInitiated = 0;
    hostWaitGroup = v2->_hostWaitGroup;
    v2->_hostWaitGroup = 0;

    v5 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
    sessionConfigs = v3->_sessionConfigs;
    v3->_sessionConfigs = v5;

    os_log_t v7 = os_log_create("com.apple.sysdiagnose", "co-sysdiagnose");
    logSubsystem = v3->_logSubsystem;
    v3->_logSubsystem = (OS_os_log *)v7;
  }
  return v3;
}

- (BOOL)isHost
{
  if ([(CSCoordinator *)self initiatedByRemoteHost])
  {
    v2 = +[CSCoordinator sharedInstance];
    v3 = [v2 logSubsystem];

    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CSCoordinator: forced to return no for isHost", v5, 2u);
    }

    return 0;
  }
  else
  {
    return +[CSRemoteXPCProxy isHost];
  }
}

- (id)getRemoteUUIDsForDiagnosticID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = [(CSCoordinator *)v5 sessionConfigs];
    os_log_t v7 = [v6 objectForKey:v4];

    if (v7)
    {
      v8 = [v7 remoteUUIDs];
    }
    else
    {
      v17 = +[CSCoordinator sharedInstance];
      v18 = [v17 logSubsystem];

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100061ACC();
      }

      v8 = 0;
    }
    objc_sync_exit(v5);
  }
  else
  {
    v9 = +[CSCoordinator sharedInstance];
    os_log_t v7 = [v9 logSubsystem];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100061A54(v7, v10, v11, v12, v13, v14, v15, v16);
    }
    v8 = 0;
  }

  return v8;
}

- (BOOL)setRemoteUUIDs:(id)a3 forDiagnosticID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CSCoordinator *)self tryCreateSessionConfigForDiagnosticID:v7];
  if (v7)
  {
    v8 = self;
    objc_sync_enter(v8);
    v9 = [(CSCoordinator *)v8 sessionConfigs];
    uint64_t v10 = [v9 objectForKey:v7];

    BOOL v11 = v10 != 0;
    if (v10)
    {
      uint64_t v12 = [v6 copy];
      [v10 setRemoteUUIDs:v12];
    }
    else
    {
      v21 = +[CSCoordinator sharedInstance];
      uint64_t v12 = [v21 logSubsystem];

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100061BB8();
      }
    }

    objc_sync_exit(v8);
  }
  else
  {
    uint64_t v13 = +[CSCoordinator sharedInstance];
    uint64_t v10 = [v13 logSubsystem];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100061B40(v10, v14, v15, v16, v17, v18, v19, v20);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)getCollectAllTrustedForDiagnosticID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    id v6 = [(CSCoordinator *)v5 sessionConfigs];
    id v7 = [v6 objectForKey:v4];

    if (v7)
    {
      unsigned __int8 v8 = [v7 shouldCollectAllTrusted];
    }
    else
    {
      uint64_t v17 = +[CSCoordinator sharedInstance];
      uint64_t v18 = [v17 logSubsystem];

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100061CA4();
      }

      unsigned __int8 v8 = 0;
    }
    objc_sync_exit(v5);
  }
  else
  {
    v9 = +[CSCoordinator sharedInstance];
    id v7 = [v9 logSubsystem];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100061C2C(v7, v10, v11, v12, v13, v14, v15, v16);
    }
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)setCollectAllTrusted:(BOOL)a3 forDiagnosticID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(CSCoordinator *)self tryCreateSessionConfigForDiagnosticID:v6];
  if (v6)
  {
    id v7 = self;
    objc_sync_enter(v7);
    unsigned __int8 v8 = [(CSCoordinator *)v7 sessionConfigs];
    v9 = [v8 objectForKey:v6];

    BOOL v10 = v9 != 0;
    if (v9)
    {
      [v9 setShouldCollectAllTrusted:v4];
    }
    else
    {
      uint64_t v19 = +[CSCoordinator sharedInstance];
      uint64_t v20 = [v19 logSubsystem];

      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100061D90();
      }
    }
    objc_sync_exit(v7);
  }
  else
  {
    uint64_t v11 = +[CSCoordinator sharedInstance];
    v9 = [v11 logSubsystem];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100061D18(v9, v12, v13, v14, v15, v16, v17, v18);
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (id)getProxiesForDiagnosticID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    id v6 = [(CSCoordinator *)v5 sessionConfigs];
    id v7 = [v6 objectForKey:v4];

    if (v7)
    {
      unsigned __int8 v8 = [v7 proxies];
    }
    else
    {
      uint64_t v17 = +[CSCoordinator sharedInstance];
      uint64_t v18 = [v17 logSubsystem];

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100061E7C();
      }

      unsigned __int8 v8 = 0;
    }
    objc_sync_exit(v5);
  }
  else
  {
    v9 = +[CSCoordinator sharedInstance];
    id v7 = [v9 logSubsystem];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100061E04(v7, v10, v11, v12, v13, v14, v15, v16);
    }
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)setProxies:(id)a3 forDiagnosticID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    unsigned __int8 v8 = self;
    objc_sync_enter(v8);
    v9 = [(CSCoordinator *)v8 sessionConfigs];
    uint64_t v10 = [v9 objectForKey:v7];

    BOOL v11 = v10 != 0;
    if (v10)
    {
      uint64_t v12 = [v6 copy];
      [v10 setProxies:v12];
    }
    else
    {
      v21 = +[CSCoordinator sharedInstance];
      uint64_t v12 = [v21 logSubsystem];

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100061F68();
      }
    }

    objc_sync_exit(v8);
  }
  else
  {
    uint64_t v13 = +[CSCoordinator sharedInstance];
    uint64_t v10 = [v13 logSubsystem];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100061EF0(v10, v14, v15, v16, v17, v18, v19, v20);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (id)getReceiveFileSemaForDiagnosticID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    id v6 = [(CSCoordinator *)v5 sessionConfigs];
    id v7 = [v6 objectForKey:v4];

    if (v7)
    {
      unsigned __int8 v8 = [v7 receiveFileSema];
    }
    else
    {
      uint64_t v17 = +[CSCoordinator sharedInstance];
      uint64_t v18 = [v17 logSubsystem];

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100062054();
      }

      unsigned __int8 v8 = 0;
    }
    objc_sync_exit(v5);
  }
  else
  {
    v9 = +[CSCoordinator sharedInstance];
    id v7 = [v9 logSubsystem];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100061FDC(v7, v10, v11, v12, v13, v14, v15, v16);
    }
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)setHostOutputDir:(id)a3 forDiagnosticID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    unsigned __int8 v8 = self;
    objc_sync_enter(v8);
    v9 = [(CSCoordinator *)v8 sessionConfigs];
    uint64_t v10 = [v9 objectForKey:v7];

    BOOL v11 = v10 != 0;
    if (v10)
    {
      [v10 setHostOutputDir:v6];
    }
    else
    {
      uint64_t v20 = +[CSCoordinator sharedInstance];
      v21 = [v20 logSubsystem];

      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_100062140();
      }
    }
    objc_sync_exit(v8);
  }
  else
  {
    uint64_t v12 = +[CSCoordinator sharedInstance];
    uint64_t v10 = [v12 logSubsystem];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000620C8(v10, v13, v14, v15, v16, v17, v18, v19);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (void)addSessionConfig:(id)a3 forDiagnosticID:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  unsigned __int8 v8 = [(CSCoordinator *)v7 sessionConfigs];
  id v9 = [v8 mutableCopy];

  [v9 setObject:v11 forKey:v6];
  id v10 = [v9 copy];
  [(CSCoordinator *)v7 setSessionConfigs:v10];

  objc_sync_exit(v7);
}

- (void)removeSessionConfigForDiagnosticID:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v5 = [(CSCoordinator *)v4 sessionConfigs];
  id v6 = [v5 mutableCopy];

  [v6 removeObjectForKey:v8];
  id v7 = [v6 copy];
  [(CSCoordinator *)v4 setSessionConfigs:v7];

  objc_sync_exit(v4);
}

- (void)tryCreateSessionConfigForDiagnosticID:(id)a3
{
  id v4 = a3;
  v5 = [(CSCoordinator *)self sessionConfigs];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v7 = objc_alloc_init(CSSessionConfig);
    if (v7)
    {
      [(CSCoordinator *)self addSessionConfig:v7 forDiagnosticID:v4];
    }
    else
    {
      id v8 = +[CSCoordinator sharedInstance];
      id v9 = [v8 logSubsystem];

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000621B4(v9);
      }
    }
  }
}

- (id)getHostOutputDirForDiagnosticID:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v34 = v4;
  if (!v4)
  {
    obj = v5;
    id v9 = [(CSCoordinator *)v5 sessionConfigs];
    id v10 = [v9 count];

    if (v10)
    {
      if (v10 == (id)1)
      {
        memset(v39, 0, sizeof(v39));
        id v11 = [(CSCoordinator *)v5 sessionConfigs];
        if ([v11 countByEnumeratingWithState:v39 objects:v43 count:16])
        {
          uint64_t v12 = **((void **)&v39[0] + 1);
          uint64_t v13 = [(CSCoordinator *)v5 sessionConfigs];
          uint64_t v14 = [v13 objectForKey:v12];
          id v8 = [v14 hostOutputDir];

LABEL_26:
          id v7 = obj;
          objc_sync_exit(obj);
          goto LABEL_27;
        }
      }
      uint64_t v17 = +[CSCoordinator sharedInstance];
      uint64_t v18 = [v17 logSubsystem];

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000621F8((uint64_t)v10, v18, v19, v20, v21, v22, v23, v24);
      }

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v25 = [(CSCoordinator *)v5 sessionConfigs];
      id v26 = [v25 countByEnumeratingWithState:&v35 objects:v42 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v36;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v36 != v27) {
              objc_enumerationMutation(v25);
            }
            uint64_t v29 = *(void *)(*((void *)&v35 + 1) + 8 * i);
            v30 = +[CSCoordinator sharedInstance];
            v31 = [v30 logSubsystem];

            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v41 = v29;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "CSCoordinator: %@", buf, 0xCu);
            }
          }
          id v26 = [v25 countByEnumeratingWithState:&v35 objects:v42 count:16];
        }
        while (v26);
      }

      id v8 = +[SDCacheEnumerator sysdiagnoseDirectory];
      goto LABEL_26;
    }
    id v8 = 0;
    goto LABEL_26;
  }
  id v6 = [(CSCoordinator *)v5 sessionConfigs];
  id v7 = [v6 objectForKey:v4];

  if (v7)
  {
    id v8 = [v7 hostOutputDir];
  }
  else
  {
    uint64_t v15 = +[CSCoordinator sharedInstance];
    uint64_t v16 = [v15 logSubsystem];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100062278();
    }

    id v8 = 0;
  }
  objc_sync_exit(v5);

LABEL_27:

  return v8;
}

- (BOOL)isAutomaticCoSysdiagnosePossible
{
  if ([(CSCoordinator *)self isRemoteInitiated]) {
    return 1;
  }

  return +[CSDisplayProxy isAutomaticCoSysdiagnosePossible];
}

- (void)initRemoteServers
{
  +[CSRemoteXPCProxy initRemoteServers];

  +[CSCoreDeviceProxy initRemoteServers];
}

- (BOOL)initProxiesForDiagnosticID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    id v6 = +[CSRemoteXPCProxy getProxiesForDiagnosticID:v4];
    [v5 addObjectsFromArray:v6];

    id v7 = +[CSCoreDeviceProxy getProxiesForDiagnosticID:v4];
    [v5 addObjectsFromArray:v7];

    id v8 = +[CSDisplayProxy getProxiesForDiagnosticID:v4];
    [v5 addObjectsFromArray:v8];

    BOOL v9 = [(CSCoordinator *)self setProxies:v5 forDiagnosticID:v4];
  }
  else
  {
    id v10 = +[CSCoordinator sharedInstance];
    id v11 = [v10 logSubsystem];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000622EC(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)tryStartRemoteInitiatedFlowForMsg:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (![(CSCoordinator *)v5 isRemoteInitiated])
  {
    [(CSCoordinator *)v5 setInitiatedByRemoteHost:xpc_dictionary_get_BOOL(v4, "initiatedByRemoteHost")];
    BOOL v9 = +[CSCoordinator sharedInstance];
    id v10 = [v9 logSubsystem];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16[0] = 67109120;
      v16[1] = [(CSCoordinator *)v5 initiatedByRemoteHost];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CSCoordinator: Starting remote initiated flow with initiatedByRemoteHost: %d", (uint8_t *)v16, 8u);
    }

    if ([(CSCoordinator *)v5 isHost])
    {
      dispatch_group_t v11 = dispatch_group_create();
      [(CSCoordinator *)v5 setHostWaitGroup:v11];

      uint64_t v12 = [(CSCoordinator *)v5 hostWaitGroup];
      LODWORD(v11) = v12 == 0;

      if (v11)
      {
        uint64_t v15 = +[CSCoordinator sharedInstance];
        id v7 = [v15 logSubsystem];

        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_100062364(v7);
        }
        goto LABEL_4;
      }
      uint64_t v13 = [(CSCoordinator *)v5 hostWaitGroup];
      dispatch_group_enter(v13);
    }
    BOOL v8 = 1;
    [(CSCoordinator *)v5 setIsRemoteInitiated:1];
    goto LABEL_11;
  }
  id v6 = +[CSCoordinator sharedInstance];
  id v7 = [v6 logSubsystem];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CSCoordinator: Already remote initiated. Failing to startRemoteInitiatedFlow", (uint8_t *)v16, 2u);
  }
LABEL_4:

  BOOL v8 = 0;
LABEL_11:
  objc_sync_exit(v5);

  return v8;
}

- (id)gatherLocalSysdiagnoseForMsg:(id)a3 withReply:(id)a4
{
  return sub_100034E04(0, a3, a4);
}

- (void)endRemoteInitiatedFlow
{
  obj = self;
  objc_sync_enter(obj);
  if ([(CSCoordinator *)obj isHost]) {
    [(CSCoordinator *)obj safeLeaveHostWaitGroup];
  }
  [(CSCoordinator *)obj setInitiatedByRemoteHost:0];
  [(CSCoordinator *)obj setIsRemoteInitiated:0];
  objc_sync_exit(obj);
}

- (BOOL)shouldGatherCoSysdiagnoses
{
  unsigned int v3 = [(CSCoordinator *)self isRemoteInitiated];
  if (v3) {
    [(CSCoordinator *)self initiatedByRemoteHost];
  }
  return v3 ^ 1;
}

- (BOOL)triggerCoSysdiagnosesWithParams:(id)a3 forDiagnosticID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CSCoordinator *)self tryCreateSessionConfigForDiagnosticID:v7];
  if (![(CSCoordinator *)self shouldGatherCoSysdiagnoses])
  {
    uint64_t v18 = +[CSCoordinator sharedInstance];
    BOOL v9 = [v18 logSubsystem];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSCoordinator: Not triggering co-sysdiagnoses", buf, 2u);
    }
    goto LABEL_21;
  }
  BOOL v8 = +[CSCoordinator sharedInstance];
  BOOL v9 = [v8 logSubsystem];

  if (!v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000623A8(v9, v19, v20, v21, v22, v23, v24, v25);
    }
LABEL_21:
    BOOL v17 = 0;
    goto LABEL_22;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSCoordinator: Triggering co-sysdiagnoses", buf, 2u);
  }

  [(CSCoordinator *)self initProxiesForDiagnosticID:v7];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  BOOL v9 = [(CSCoordinator *)self getProxiesForDiagnosticID:v7];
  id v10 = [v9 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v10)
  {
    id v11 = v10;
    id v27 = v7;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (([v14 triggerCoSysdiagnoseWithParams:v6] & 1) == 0)
        {
          uint64_t v15 = +[CSCoordinator sharedInstance];
          uint64_t v16 = [v15 logSubsystem];

          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v14;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "CSCoordinator: Failed to trigger co-sysdiagnose for %@", buf, 0xCu);
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v11);
    BOOL v17 = 1;
    id v7 = v27;
  }
  else
  {
    BOOL v17 = 1;
  }
LABEL_22:

  return v17;
}

- (BOOL)waitForCoSysdiagnosesForDiagnosticID:(id)a3
{
  id v4 = a3;
  id v5 = +[CSCoordinator sharedInstance];
  id v6 = [v5 logSubsystem];

  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CSCoordinator: Waiting for co-sysdiagnoses...", buf, 2u);
    }

    if ([(CSCoordinator *)self shouldGatherCoSysdiagnoses])
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v7 = [(CSCoordinator *)self getProxiesForDiagnosticID:v4];
      unint64_t v8 = 0;
      id v9 = [v7 countByEnumeratingWithState:&v48 objects:v55 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v49;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v49 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = [*(id *)(*((void *)&v48 + 1) + 8 * i) getTimeoutSec];
            if ((unint64_t)v12 > v8) {
              unint64_t v8 = (unint64_t)v12;
            }
          }
          id v9 = [v7 countByEnumeratingWithState:&v48 objects:v55 count:16];
        }
        while (v9);
      }

      *(void *)buf = 0;
      v45 = buf;
      uint64_t v46 = 0x2020000000;
      char v47 = 1;
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100019090;
      v41[3] = &unk_10009D248;
      v41[4] = self;
      id v13 = v4;
      id v42 = v13;
      v43 = buf;
      unsigned __int8 v14 = +[SystemDiagnostic _runBlock:v41 withTimeout:(double)v8];
      v45[24] = v14;
      if ((v14 & 1) == 0)
      {
        uint64_t v15 = +[CSCoordinator sharedInstance];
        uint64_t v16 = [v15 logSubsystem];

        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v53 = 134217984;
          unint64_t v54 = v8;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "CSCoordinator: Timed out waiting on proxies for %lus, canceling connections", v53, 0xCu);
        }
      }
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      BOOL v17 = -[CSCoordinator getProxiesForDiagnosticID:](self, "getProxiesForDiagnosticID:", v13, 0);
      id v18 = [v17 countByEnumeratingWithState:&v37 objects:v52 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v38;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(void *)v38 != v19) {
              objc_enumerationMutation(v17);
            }
            [*(id *)(*((void *)&v37 + 1) + 8 * (void)j) cancelConnection];
          }
          id v18 = [v17 countByEnumeratingWithState:&v37 objects:v52 count:16];
        }
        while (v18);
      }

      _Block_object_dispose(buf, 8);
      goto LABEL_37;
    }
    long long v28 = [(CSCoordinator *)self hostWaitGroup];
    BOOL v29 = v28 == 0;

    if (v29)
    {
      long long v35 = +[CSCoordinator sharedInstance];
      v34 = [v35 logSubsystem];

      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "CSCoordinator: Trying to wait on NULL hostWaitGroup. File transfer probably already finished", buf, 2u);
      }
    }
    else
    {
      long long v30 = [(CSCoordinator *)self hostWaitGroup];
      dispatch_time_t v31 = dispatch_time(0, 30000000000);
      intptr_t v32 = dispatch_group_wait(v30, v31);

      if (!v32)
      {
LABEL_37:
        [(CSCoordinator *)self removeSessionConfigForDiagnosticID:v4];
        goto LABEL_38;
      }
      v33 = +[CSCoordinator sharedInstance];
      v34 = [v33 logSubsystem];

      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "CSCoordinator: While remote-initiated, timed out waiting for remote co-sysdiagnose (hostWaitGroup)", buf, 2u);
      }
    }

    goto LABEL_37;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100062420(v6, v21, v22, v23, v24, v25, v26, v27);
  }

LABEL_38:
  return v4 != 0;
}

- (void)readyToReceiveCoSysdiagnosesAtDir:(id)a3 forDiagnosticID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CSCoordinator *)self tryCreateSessionConfigForDiagnosticID:v6];
  [(CSCoordinator *)self setHostOutputDir:v7 forDiagnosticID:v6];

  dsema = [(CSCoordinator *)self getReceiveFileSemaForDiagnosticID:v6];

  dispatch_semaphore_signal(dsema);
}

- (id)waitForHostOutputDirForDiagnosticID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSCoordinator *)self getHostOutputDirForDiagnosticID:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    unint64_t v8 = [(CSCoordinator *)self getReceiveFileSemaForDiagnosticID:v4];
    dispatch_time_t v9 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(v8, v9))
    {
      uint64_t v10 = +[CSCoordinator sharedInstance];
      id v11 = [v10 logSubsystem];

      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CSCoordinator: Timed out waiting for host to set output directory", v13, 2u);
      }

      id v7 = 0;
    }
    else
    {
      id v7 = [(CSCoordinator *)self getHostOutputDirForDiagnosticID:v4];
    }
  }

  return v7;
}

- (void)safeLeaveHostWaitGroup
{
  unsigned int v3 = [(CSCoordinator *)self hostWaitGroup];

  if (v3)
  {
    id v4 = [(CSCoordinator *)self hostWaitGroup];
    dispatch_group_leave(v4);

    [(CSCoordinator *)self setHostWaitGroup:0];
  }
}

- (void)transferFileToHostIfNecessary:(id)a3 forDiagnosticID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CSCoordinator *)self isHost])
  {
    unint64_t v8 = +[CSCoordinator sharedInstance];
    dispatch_time_t v9 = [v8 logSubsystem];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSCoordinator: On host, so file transfer not necessary. Skipping transfer", buf, 2u);
    }
  }
  else
  {
    if ([(CSCoordinator *)self isRemoteInitiated])
    {
      uint64_t v10 = +[CSCoordinator sharedInstance];
      id v11 = [v10 logSubsystem];

      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CSCoordinator: Not transferring file to host in transferFileToHostIfNecessary, because we are already remote initiated", buf, 2u);
      }
    }
    else
    {
      id v12 = [(CSCoordinator *)self getProxiesForDiagnosticID:v7];
      if ((unint64_t)[v12 count] >= 2) {
        sub_100062498(&v26, buf);
      }
      uint64_t v20 = self;
      id v21 = v7;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v11 = v12;
      id v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v23;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(v11);
            }
            BOOL v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            id v18 = +[CSCoordinator sharedInstance];
            uint64_t v19 = [v18 logSubsystem];

            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v6;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "CSCoordinator: Transferring file from remote to host: %@", buf, 0xCu);
            }

            [v17 transferFileToHost:v6];
          }
          id v14 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v14);
      }

      self = v20;
      id v7 = v21;
    }

    [(CSCoordinator *)self removeSessionConfigForDiagnosticID:v7];
  }
}

- (OS_os_log)logSubsystem
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLogSubsystem:(id)a3
{
}

- (BOOL)isRemoteInitiated
{
  return self->_isRemoteInitiated;
}

- (void)setIsRemoteInitiated:(BOOL)a3
{
  self->_isRemoteInitiated = a3;
}

- (BOOL)initiatedByRemoteHost
{
  return self->_initiatedByRemoteHost;
}

- (void)setInitiatedByRemoteHost:(BOOL)a3
{
  self->_initiatedByRemoteHost = a3;
}

- (NSDictionary)sessionConfigs
{
  return self->_sessionConfigs;
}

- (void)setSessionConfigs:(id)a3
{
}

- (OS_dispatch_group)hostWaitGroup
{
  return self->_hostWaitGroup;
}

- (void)setHostWaitGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostWaitGroup, 0);
  objc_storeStrong((id *)&self->_sessionConfigs, 0);

  objc_storeStrong((id *)&self->_logSubsystem, 0);
}

@end