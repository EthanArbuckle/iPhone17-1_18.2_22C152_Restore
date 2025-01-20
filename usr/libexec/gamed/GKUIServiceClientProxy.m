@interface GKUIServiceClientProxy
- (BOOL)isUIService;
- (GKClientProxy)hostClient;
- (void)dealloc;
- (void)getPrivateServicesForPID:(int)a3 localPlayer:(id)a4 reply:(id)a5;
- (void)getServicesForPID:(int)a3 localPlayer:(id)a4 reply:(id)a5;
- (void)handleNewHostClient:(id)a3;
- (void)setExtensionProxy:(id)a3 forBundleID:(id)a4;
- (void)setHostClient:(id)a3;
- (void)setHostPID:(int)a3 reply:(id)a4;
- (void)terminateWithCompletionHandler:(id)a3;
@end

@implementation GKUIServiceClientProxy

- (void)dealloc
{
  v3 = [(GKUIServiceClientProxy *)self hostClient];
  [v3 setViewService:0];

  [(GKUIServiceClientProxy *)self setHostClient:0];
  v4.receiver = self;
  v4.super_class = (Class)GKUIServiceClientProxy;
  [(GKClientProxy *)&v4 dealloc];
}

- (BOOL)isUIService
{
  return 1;
}

- (void)setExtensionProxy:(id)a3 forBundleID:(id)a4
{
  objc_super v4 = +[NSString stringWithFormat:@"Invalid attempt to set extension proxy(%@) on viewService(%@)", a4, a3, self];
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKUIServiceClientProxy.m"];
  id v6 = [v5 lastPathComponent];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (NO)\n[%s (%s:%d)]", v4, "-[GKUIServiceClientProxy setExtensionProxy:forBundleID:]", [v6 UTF8String], 35);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  +[NSException raise:@"GameKit Exception", @"%@", v7 format];
}

- (void)terminateWithCompletionHandler:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_super v4 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100124E48;
    block[3] = &unk_1002D3A20;
    id v6 = v3;
    dispatch_barrier_async(v4, block);
  }
}

- (void)handleNewHostClient:(id)a3
{
}

- (void)setHostPID:(int)a3 reply:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = +[GKClientProxy clientForProcessIdentifier:v4];
  if (!v7)
  {
    if (!os_log_GKGeneral) {
      id v17 = (id)GKOSLoggers();
    }
    v18 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
    {
      sub_1001256F0(v4, v18);
      if (v6) {
        goto LABEL_13;
      }
    }
    else if (v6)
    {
      goto LABEL_13;
    }
    v14 = 0;
    goto LABEL_15;
  }
  [(GKUIServiceClientProxy *)self setHostClient:v7];
  [(GKUIServiceClientProxy *)self handleNewHostClient:v7];
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  v9 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v26 = self;
    __int16 v27 = 2112;
    v28 = v7;
    __int16 v29 = 1024;
    int v30 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Associating view service %@ with client %@ : pid(%d)", buf, 0x1Cu);
  }
  v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v11 = [v7 currentGame];
  id v12 = [v7 environment];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001251A8;
  v23[3] = &unk_1002D40E0;
  v13 = v10;
  v24 = v13;
  [(GKClientProxy *)self setCurrentGame:v11 serverEnvironment:v12 reply:v23];

  dispatch_group_enter(v13);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001251B0;
  v21[3] = &unk_1002DA9A0;
  v21[4] = self;
  v14 = v13;
  v22 = v14;
  [v7 getAuthenticatedLocalPlayersWithStatus:1 handler:v21];

  if (v6)
  {
    if (v14)
    {
      v15 = [(GKClientProxy *)self replyQueue];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10012524C;
      v19[3] = &unk_1002D3A20;
      v20 = v6;
      dispatch_group_notify(v14, v15, v19);

      v16 = v20;
LABEL_14:

      goto LABEL_15;
    }
LABEL_13:
    v16 = [(GKClientProxy *)self replyQueue];
    dispatch_async(v16, v6);
    v14 = 0;
    goto LABEL_14;
  }
LABEL_15:
}

- (void)getServicesForPID:(int)a3 localPlayer:(id)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v17 = a4;
  id v8 = a5;
  v9 = +[GKClientProxy clientForProcessIdentifier:v6];
  [(GKUIServiceClientProxy *)self setHostClient:v9];
  v10 = [(GKUIServiceClientProxy *)self hostClient];
  unsigned int v11 = [v10 isExtension];

  if (v11)
  {
    id v12 = [(GKUIServiceClientProxy *)self hostClient];
    uint64_t v13 = [v12 hostClient];

    v9 = (void *)v13;
  }
  v14 = [v9 credentialForPlayer:v17];
  v15 = [v9 transportWithCredential:v14];
  v16 = [(GKUIServiceClientProxy *)self hostClient];
  [(GKClientProxy *)self getServicesWithTransport:v15 forClient:v16 reply:v8];
}

- (void)getPrivateServicesForPID:(int)a3 localPlayer:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [(GKUIServiceClientProxy *)self hostClient];
  if (v10)
  {
    unsigned int v11 = v10;
    if ([v10 pid] != a3)
    {
      id v12 = +[NSString stringWithFormat:@"Assertion failed"];
      uint64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKUIServiceClientProxy.m"];
      id v14 = [v13 lastPathComponent];
      v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (hostClient.pid == pid)\n[%s (%s:%d)]", v12, "-[GKUIServiceClientProxy getPrivateServicesForPID:localPlayer:reply:]", [v14 UTF8String], 129);

      +[NSException raise:@"GameKit Exception", @"%@", v15 format];
    }
    v16 = [(GKUIServiceClientProxy *)self hostClient];
    unsigned int v17 = [v16 isExtension];

    if (v17)
    {
      v18 = [(GKUIServiceClientProxy *)self hostClient];
      uint64_t v19 = [v18 hostClient];

      unsigned int v11 = (void *)v19;
    }
    v20 = [v11 credentialForPlayer:v8];
    v21 = [v11 transportWithCredential:v20];
    [(GKClientProxy *)self getPrivateServicesWithTransport:v21 forClient:v11 reply:v9];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v22 = (id)GKOSLoggers();
    }
    v23 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_100125768(v23);
    }
    v24 = [(GKClientProxy *)self replyQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100125600;
    block[3] = &unk_1002D3A20;
    id v26 = v9;
    dispatch_async(v24, block);

    unsigned int v11 = v26;
  }
}

- (GKClientProxy)hostClient
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostClient);

  return (GKClientProxy *)WeakRetained;
}

- (void)setHostClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end