@interface fskitdAgentManager
- (NSMutableDictionary)currentAgents;
- (fskitdAgentManager)init;
- (id)getCurrentAgentForToken:(id)a3;
- (id)getCurrentAgentForUID:(unsigned int)a3;
- (void)currentExtensionForShortName:(id)a3 auditToken:(id)a4 replyHandler:(id)a5;
- (void)currentExtensionsForToken:(id)a3 replyHandler:(id)a4;
- (void)getNSXPCListenerEndpoint:(id)a3 instanceID:(id)a4 uid:(unsigned int)a5 replyHandler:(id)a6;
- (void)setCurrentAgents:(id)a3;
- (void)setEnabledStateForToken:(id)a3 identifier:(id)a4 newState:(BOOL)a5 replyHandler:(id)a6;
- (void)startExtension:(id)a3 instanceID:(id)a4 uid:(unsigned int)a5 replyHandler:(id)a6;
- (void)stopExtension:(id)a3 instanceID:(id)a4 uid:(unsigned int)a5 replyHandler:(id)a6;
@end

@implementation fskitdAgentManager

- (fskitdAgentManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)fskitdAgentManager;
  v2 = [(fskitdAgentManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    currentAgents = v2->_currentAgents;
    v2->_currentAgents = v3;
  }
  return v2;
}

- (id)getCurrentAgentForUID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = fskit_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "About to get current agent for %{darwin.uid}d", (uint8_t *)&buf, 8u);
  }

  objc_super v6 = +[NSNumber numberWithUnsignedInt:v3];
  id v7 = [(NSMutableDictionary *)v4->_currentAgents objectForKeyedSubscript:v6];
  if (!v7)
  {
    id v7 = [objc_alloc((Class)FSAgentClient) initToUser:v3];
    if (v7)
    {
      [(NSMutableDictionary *)v4->_currentAgents setObject:v7 forKeyedSubscript:v6];
      objc_initWeak(&buf, v4);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100016710;
      v11[3] = &unk_100059288;
      v11[4] = v4;
      objc_copyWeak(&v13, &buf);
      id v12 = v6;
      [v7 setInterruptionHandler:v11];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100016794;
      v9[3] = &unk_1000592A8;
      int v10 = v3;
      [v7 setInstanceDeathHandler:v9];
      id v7 = v7;

      objc_destroyWeak(&v13);
      objc_destroyWeak(&buf);
    }
  }

  objc_sync_exit(v4);

  return v7;
}

- (id)getCurrentAgentForToken:(id)a3
{
  id v4 = [a3 ruid];

  return [(fskitdAgentManager *)self getCurrentAgentForUID:v4];
}

- (void)currentExtensionsForToken:(id)a3 replyHandler:(id)a4
{
  v5 = (void (**)(id, void *, void))a4;
  [a3 isOurUID];
  objc_super v6 = fskit_std_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Getting own modules", v9, 2u);
  }

  id v7 = [(id)qword_100060760 currentExtensions];
  v8 = [v7 fs_map:&stru_1000592E8];
  v5[2](v5, v8, 0);
}

- (void)setEnabledStateForToken:(id)a3 identifier:(id)a4 newState:(BOOL)a5 replyHandler:(id)a6
{
  BOOL v6 = a5;
  v9 = (void (**)(id, void))a6;
  id v10 = a4;
  [a3 isOurUID];
  id v11 = [(id)qword_100060760 moduleForBundleID:v10];

  if (v6) {
    [(id)qword_100060760 addBundleToEnableModules:v11];
  }
  else {
    [(id)qword_100060760 removeBundleFromEnabledModules:v11];
  }
  v9[2](v9, 0);
}

- (void)currentExtensionForShortName:(id)a3 auditToken:(id)a4 replyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = sub_100016C2C;
  v35 = sub_100016C3C;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_100016C2C;
  v29 = sub_100016C3C;
  id v30 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100016C44;
  v24[3] = &unk_100059338;
  v24[4] = &v25;
  v24[5] = &v31;
  [(fskitdAgentManager *)self currentExtensionsForToken:v9 replyHandler:v24];
  if (v26[5])
  {
    v10[2](v10, 0);
  }
  else
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = sub_100016C2C;
    v22 = sub_100016C3C;
    id v23 = 0;
    uint64_t v11 = fs_errorForPOSIXError();
    id v12 = (void *)v26[5];
    v26[5] = v11;

    id v13 = (void *)v32[5];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100016CC4;
    v14[3] = &unk_100059360;
    id v15 = v8;
    v16 = &v18;
    v17 = &v25;
    [v13 enumerateObjectsUsingBlock:v14];
    ((void (*)(void (**)(id, void), uint64_t, uint64_t))v10[2])(v10, v19[5], v26[5]);

    _Block_object_dispose(&v18, 8);
  }
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
}

- (void)startExtension:(id)a3 instanceID:(id)a4 uid:(unsigned int)a5 replyHandler:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = dispatch_group_create();
  v14 = [(fskitdAgentManager *)self getCurrentAgentForUID:v7];
  dispatch_group_enter(v13);
  id v15 = fskit_std_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138412546;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "About to call to fskit_agent, bundle ID %@, instanceUUID %@", buf, 0x16u);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100016F5C;
  v18[3] = &unk_100059388;
  v19 = v13;
  id v20 = v12;
  v16 = v13;
  id v17 = v12;
  [v14 startExtension:v10 instanceID:v11 replyHandler:v18];
  dispatch_group_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)getNSXPCListenerEndpoint:(id)a3 instanceID:(id)a4 uid:(unsigned int)a5 replyHandler:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = dispatch_group_create();
  v14 = [(fskitdAgentManager *)self getCurrentAgentForUID:v6];
  dispatch_group_enter(v13);
  id v15 = fskit_std_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "About to call to fskit_agent", buf, 2u);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100017170;
  v18[3] = &unk_1000593B0;
  v19 = v13;
  id v20 = v10;
  v16 = v13;
  id v17 = v10;
  [v14 getNSXPCListenerEndpoint:v12 instanceID:v11 replyHandler:v18];

  dispatch_group_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)stopExtension:(id)a3 instanceID:(id)a4 uid:(unsigned int)a5 replyHandler:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = dispatch_group_create();
  v14 = [(fskitdAgentManager *)self getCurrentAgentForUID:v6];
  dispatch_group_enter(v13);
  id v15 = fskit_std_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "About to call to fskit_agent", buf, 2u);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100017360;
  v18[3] = &unk_100059310;
  v19 = v13;
  id v20 = v10;
  v16 = v13;
  id v17 = v10;
  [v14 stopExtension:v12 instanceID:v11 replyHandler:v18];

  dispatch_group_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
}

- (NSMutableDictionary)currentAgents
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCurrentAgents:(id)a3
{
}

- (void).cxx_destruct
{
}

@end