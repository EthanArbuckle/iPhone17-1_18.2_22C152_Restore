@interface MRDAVHostedDiscoverySession
+ (OS_dispatch_queue)calloutQueue;
- (BOOL)devicesDelayed;
- (BOOL)endpointsDelayed;
- (BOOL)processSuspended;
- (MRAVRoutingDiscoverySessionConfiguration)configuration;
- (MRDAVHostedDiscoverySession)initWithConnection:(id)a3 hostedRoutingController:(id)a4;
- (MRDAVHostedDiscoverySessionDelegate)delegate;
- (MRDHostedRoutingController)hostedRoutingController;
- (MRDMediaRemoteClient)xpcClient;
- (MROSTransaction)transaction;
- (MRXPCConnectionMonitor)connectionMonitor;
- (NSArray)pendingEndpoints;
- (NSArray)pendingOutputDevices;
- (NSArray)updatedEndpoints;
- (NSArray)updatedOutputDevices;
- (NSDate)lastDesiredDiscoveryModeDisableDate;
- (NSDate)lastDesiredDiscoveryModeEnableDate;
- (NSDate)lastEffectiveDiscoveryModeDisableDate;
- (NSDate)lastEffectiveDiscoveryModeEnableDate;
- (NSString)bundleIdentifier;
- (NSString)clientIdentifier;
- (NSString)debugDescription;
- (NSString)description;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)serialQueue;
- (RBSProcessMonitor)stateMonitor;
- (unsigned)_calculateEffectiveDiscoveryMode;
- (unsigned)desiredDiscoveryMode;
- (unsigned)discoveryMode;
- (unsigned)effectiveDiscoveryMode;
- (void)_invalidate;
- (void)_maybeWakeClient;
- (void)_notifyAvailableEndpointsDidChange:(id)a3;
- (void)_notifyAvailableOutputDevicesDidChange:(id)a3;
- (void)_reevaluateEffectiveDiscoveryMode;
- (void)_resumeConnection;
- (void)configurationWithCompletion:(id)a3;
- (void)connectionDidResume:(id)a3;
- (void)dealloc;
- (void)getAvailableEndpointsWithCompletion:(id)a3;
- (void)getAvailableOutputDevicesWithCompletion:(id)a3;
- (void)getDevicePresenceDetectedWithCompletion:(id)a3;
- (void)getDiscoveryModeWithCompletion:(id)a3;
- (void)hostedRoutingController:(id)a3 endpointsDidChange:(id)a4;
- (void)hostedRoutingController:(id)a3 outputDevicesDidChange:(id)a4 forFeature:(unsigned int)a5;
- (void)setBundleIdentifier:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setConnectionMonitor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDesiredDiscoveryMode:(unsigned int)a3;
- (void)setDevicesDelayed:(BOOL)a3;
- (void)setDiscoveryMode:(unsigned int)a3;
- (void)setDiscoveryMode:(unsigned int)a3 withCompletion:(id)a4;
- (void)setEffectiveDiscoveryMode:(unsigned int)a3;
- (void)setEndpointsDelayed:(BOOL)a3;
- (void)setLastDesiredDiscoveryModeDisableDate:(id)a3;
- (void)setLastDesiredDiscoveryModeEnableDate:(id)a3;
- (void)setLastEffectiveDiscoveryModeDisableDate:(id)a3;
- (void)setLastEffectiveDiscoveryModeEnableDate:(id)a3;
- (void)setPendingEndpoints:(id)a3;
- (void)setPendingOutputDevices:(id)a3;
- (void)setProcessSuspended:(BOOL)a3;
- (void)setSerialQueue:(id)a3;
- (void)setStateMonitor:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setUpdatedEndpoints:(id)a3;
- (void)setUpdatedOutputDevices:(id)a3;
- (void)setXpcClient:(id)a3;
@end

@implementation MRDAVHostedDiscoverySession

- (MRDAVHostedDiscoverySession)initWithConnection:(id)a3 hostedRoutingController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v43.receiver = self;
  v43.super_class = (Class)MRDAVHostedDiscoverySession;
  v9 = [(MRDAVHostedDiscoverySession *)&v43 init];
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.mediaremote.hostedDiscoverySession/serialQueue", v10);
    serialQueue = v9->_serialQueue;
    v9->_serialQueue = (OS_dispatch_queue *)v11;

    p_connection = (id *)&v9->_connection;
    objc_storeStrong((id *)&v9->_connection, a3);
    connection = v9->_connection;
    if (connection) {
      [(NSXPCConnection *)connection auditToken];
    }
    else {
      memset(v42, 0, sizeof(v42));
    }
    uint64_t v15 = sub_100008ACC(v42);
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)v15;

    objc_storeStrong((id *)&v9->_hostedRoutingController, a4);
    v17 = +[MRDMediaRemoteServer server];
    uint64_t v18 = objc_msgSend(v17, "clientForPID:", -[NSXPCConnection processIdentifier](v9->_connection, "processIdentifier"));
    xpcClient = v9->_xpcClient;
    v9->_xpcClient = (MRDMediaRemoteClient *)v18;

    v20 = v9->_bundleIdentifier;
    if (v20)
    {
      v21 = v20;
    }
    else
    {
      v21 = [(MRDMediaRemoteClient *)v9->_xpcClient processName];
    }
    clientIdentifier = v9->_clientIdentifier;
    v9->_clientIdentifier = v21;

    v23 = [MRXPCConnectionMonitor alloc];
    v24 = v9->_connection;
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    v27 = [(MRXPCConnectionMonitor *)v23 initWithConnection:v24 label:v26];
    connectionMonitor = v9->_connectionMonitor;
    v9->_connectionMonitor = v27;

    [(MRXPCConnectionMonitor *)v9->_connectionMonitor setDelegate:v9];
    objc_initWeak(&location, v9);
    v36 = _NSConcreteStackBlock;
    uint64_t v37 = 3221225472;
    v38 = sub_10006EBDC;
    v39 = &unk_1004171D0;
    objc_copyWeak(&v40, &location);
    v29 = objc_retainBlock(&v36);
    v30 = +[MRAVDistantRoutingDiscoverySession clientInterface];
    [*p_connection setRemoteObjectInterface:v30];

    v31 = +[MRAVDistantRoutingDiscoverySession serviceInterface];
    [*p_connection setExportedInterface:v31];

    v32 = [*p_connection exportedInterface];
    v33 = [v32 protocol];
    v34 = +[MRWeakProxy weakProxyWithObject:v9 protocol:v33];
    [*p_connection setExportedObject:v34];

    [*p_connection setInterruptionHandler:v29];
    [*p_connection setInvalidationHandler:v29];
    [*p_connection resume];
    [(MRDHostedRoutingController *)v9->_hostedRoutingController addObserver:v9];

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)dealloc
{
  [(RBSProcessMonitor *)self->_stateMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MRDAVHostedDiscoverySession;
  [(MRDAVHostedDiscoverySession *)&v3 dealloc];
}

- (NSString)description
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"<%@:%p %@>", objc_opt_class(), self, self->_bundleIdentifier];

  return (NSString *)v2;
}

- (NSString)debugDescription
{
  if (self->_lastDesiredDiscoveryModeEnableDate)
  {
    -[NSDate timeIntervalSinceDate:](self->_lastDesiredDiscoveryModeDisableDate, "timeIntervalSinceDate:");
    double v4 = v3;
    lastDesiredDiscoveryModeEnableDate = self->_lastDesiredDiscoveryModeEnableDate;
    [(NSDate *)lastDesiredDiscoveryModeEnableDate timeIntervalSinceNow];
    double v7 = -v6;
    if (v4 > 0.0)
    {
      lastDesiredDiscoveryModeDisableDate = self->_lastDesiredDiscoveryModeDisableDate;
      id v8 = lastDesiredDiscoveryModeDisableDate;
    }
    else
    {
      id v8 = +[NSDate now];
      lastDesiredDiscoveryModeDisableDate = (NSDate *)@"NOW";
    }
    [v8 timeIntervalSinceDate:self->_lastDesiredDiscoveryModeEnableDate];
    v32 = +[NSString stringWithFormat:@"desired discovery enabled at: %@ (%.0f s ago) until: %@ (duration %.0f s)", lastDesiredDiscoveryModeEnableDate, *(void *)&v7, lastDesiredDiscoveryModeDisableDate, v10];
    if (v4 <= 0.0) {
  }
    }
  else
  {
    v32 = @"desired discovery never enabled";
  }
  if (self->_lastEffectiveDiscoveryModeEnableDate)
  {
    -[NSDate timeIntervalSinceDate:](self->_lastEffectiveDiscoveryModeDisableDate, "timeIntervalSinceDate:");
    double v12 = v11;
    lastEffectiveDiscoveryModeEnableDate = self->_lastEffectiveDiscoveryModeEnableDate;
    [(NSDate *)lastEffectiveDiscoveryModeEnableDate timeIntervalSinceNow];
    double v15 = -v14;
    if (v12 > 0.0)
    {
      lastEffectiveDiscoveryModeDisableDate = self->_lastEffectiveDiscoveryModeDisableDate;
      v16 = lastEffectiveDiscoveryModeDisableDate;
    }
    else
    {
      v16 = +[NSDate now];
      lastEffectiveDiscoveryModeDisableDate = (NSDate *)@"NOW";
    }
    [v16 timeIntervalSinceDate:self->_lastEffectiveDiscoveryModeEnableDate];
    uint64_t v20 = +[NSString stringWithFormat:@"effective discovery enabled at: %@ (%.0f s ago) until: %@ (duration %.0f s)", lastEffectiveDiscoveryModeEnableDate, *(void *)&v15, lastEffectiveDiscoveryModeDisableDate, v19];
    if (v12 <= 0.0) {

    }
    uint64_t v18 = (__CFString *)v20;
  }
  else
  {
    uint64_t v18 = @"effective discovery never enabled";
  }
  v21 = (objc_class *)objc_opt_class();
  v22 = NSStringFromClass(v21);
  v23 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription();
  v24 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription();
  connection = self->_connection;
  id v26 = (id)[(NSXPCConnection *)connection processIdentifier];
  BOOL processSuspended = self->_processSuspended;
  bundleIdentifier = self->_bundleIdentifier;
  v29 = MRCreateIndentedDebugDescriptionFromObject();
  v30 = +[NSString stringWithFormat:@"%@ %p {\n    effective discovery mode = %@, %@\n    desired discovery mode = %@, %@\n    xpc connection = %@\n    pid = %d\n    bundle id = %@\n    isProcessSuspended = %u\n    connection monitor = %@\n}", v22, self, v23, v18, v24, v32, connection, v26, bundleIdentifier, processSuspended, v29];

  return (NSString *)v30;
}

+ (OS_dispatch_queue)calloutQueue
{
  if (qword_10047DFD0 != -1) {
    dispatch_once(&qword_10047DFD0, &stru_100418730);
  }
  id v2 = (void *)qword_10047DFC8;

  return (OS_dispatch_queue *)v2;
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_desiredDiscoveryMode != a3)
  {
    v5 = MRLogCategoryDiscovery();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription();
      double v7 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription();
      *(_DWORD *)buf = 138412802;
      double v14 = self;
      __int16 v15 = 2114;
      v16 = v6;
      __int16 v17 = 2114;
      uint64_t v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[HostedDiscoverySession] %@ setting desired discoveryMode from %{public}@ to %{public}@", buf, 0x20u);
    }
    self->_desiredDiscoveryMode = a3;
    id v8 = +[NSDate now];
    uint64_t v9 = 136;
    if (!a3) {
      uint64_t v9 = 144;
    }
    uint64_t v10 = *(Class *)((char *)&self->super.isa + v9);
    *(Class *)((char *)&self->super.isa + v9) = v8;

    [(MRDAVHostedDiscoverySession *)self _reevaluateEffectiveDiscoveryMode];
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006F150;
    block[3] = &unk_100415CC8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)serialQueue, block);
  }
}

- (unsigned)discoveryMode
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006F5EC;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)configurationWithCompletion:(id)a3
{
  double v4 = (void (**)(id, void *))a3;
  v5 = [(MRDAVHostedDiscoverySession *)self configuration];
  if (v5)
  {
    v4[2](v4, v5);
  }
  else
  {
    uint64_t v6 = [(MRDAVHostedDiscoverySession *)self connection];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10006F760;
    v11[3] = &unk_1004187A8;
    v11[4] = self;
    double v7 = v4;
    double v12 = v7;
    uint64_t v8 = [v6 remoteObjectProxyWithErrorHandler:v11];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10006F83C;
    v9[3] = &unk_1004187D0;
    v9[4] = self;
    uint64_t v10 = v7;
    [v8 configurationWithCompletion:v9];
  }
}

- (MRAVRoutingDiscoverySessionConfiguration)configuration
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = sub_10006F994;
  uint64_t v10 = sub_10006F9A4;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006F9AC;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRAVRoutingDiscoverySessionConfiguration *)v3;
}

- (void)setConfiguration:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006FA58;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v7);
}

- (void)setEffectiveDiscoveryMode:(unsigned int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_effectiveDiscoveryMode != a3)
  {
    v5 = MRLogCategoryDiscovery();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription();
      double v7 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription();
      *(_DWORD *)buf = 138412802;
      double v14 = self;
      __int16 v15 = 2114;
      v16 = v6;
      __int16 v17 = 2114;
      uint64_t v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[HostedDiscoverySession] %@ setting effective discoveryMode from %{public}@ to %{public}@", buf, 0x20u);
    }
    id v8 = +[NSDate now];
    uint64_t v9 = 152;
    if (!a3) {
      uint64_t v9 = 160;
    }
    uint64_t v10 = *(Class *)((char *)&self->super.isa + v9);
    *(Class *)((char *)&self->super.isa + v9) = v8;

    self->_effectiveDiscoveryMode = a3;
    id v11 = [(id)objc_opt_class() calloutQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006FBFC;
    block[3] = &unk_100415CC8;
    block[4] = self;
    dispatch_async(v11, block);
  }
}

- (void)setProcessSuspended:(BOOL)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10006FCD8;
  v4[3] = &unk_100417720;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)serialQueue, v4);
}

- (void)hostedRoutingController:(id)a3 endpointsDidChange:(id)a4
{
}

- (void)hostedRoutingController:(id)a3 outputDevicesDidChange:(id)a4 forFeature:(unsigned int)a5
{
}

- (void)getDevicePresenceDetectedWithCompletion:(id)a3
{
  hostedRoutingController = self->_hostedRoutingController;
  id v5 = a3;
  (*((void (**)(id, BOOL, void))a3 + 2))(v5, [(MRDHostedRoutingController *)hostedRoutingController devicePresenceDetected], 0);
}

- (void)getDiscoveryModeWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  serialQueue = self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006FF04;
  v6[3] = &unk_100415CF0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync((dispatch_queue_t)serialQueue, v6);
  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned int *)v8 + 6), 0);
  _Block_object_dispose(&v7, 8);
}

- (void)setDiscoveryMode:(unsigned int)a3 withCompletion:(id)a4
{
  serialQueue = self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006FFB8;
  v6[3] = &unk_1004176D0;
  v6[4] = self;
  unsigned int v7 = a3;
  id v5 = (void (**)(id, void))a4;
  dispatch_async((dispatch_queue_t)serialQueue, v6);
  v5[2](v5, 0);
}

- (void)getAvailableEndpointsWithCompletion:(id)a3
{
  hostedRoutingController = self->_hostedRoutingController;
  id v4 = (void (**)(id, id, void))a3;
  id v5 = [(MRDHostedRoutingController *)hostedRoutingController availableDistantEndpoints];
  v4[2](v4, v5, 0);
}

- (void)getAvailableOutputDevicesWithCompletion:(id)a3
{
  hostedRoutingController = self->_hostedRoutingController;
  id v4 = (void (**)(id, id, void))a3;
  id v5 = [(MRDHostedRoutingController *)hostedRoutingController availableDistantOutputDevices];
  v4[2](v4, v5, 0);
}

- (void)connectionDidResume:(id)a3
{
}

- (void)_invalidate
{
  [(MRDHostedRoutingController *)self->_hostedRoutingController removeObserver:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained hostedDiscoverySessionDidInvalidate:self];

  [(NSXPCConnection *)self->_connection invalidate];
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100070150;
  block[3] = &unk_100415CC8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)_notifyAvailableOutputDevicesDidChange:(id)a3
{
  id v4 = a3;
  [(MRDAVHostedDiscoverySession *)self _maybeWakeClient];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100070240;
  v6[3] = &unk_1004187F8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(MRDAVHostedDiscoverySession *)self configurationWithCompletion:v6];
}

- (void)_notifyAvailableEndpointsDidChange:(id)a3
{
  id v4 = a3;
  [(MRDAVHostedDiscoverySession *)self _maybeWakeClient];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100070544;
  v6[3] = &unk_1004187F8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(MRDAVHostedDiscoverySession *)self configurationWithCompletion:v6];
}

- (void)_resumeConnection
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_10006F994;
  v25 = sub_10006F9A4;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_10006F994;
  uint64_t v19 = sub_10006F9A4;
  id v20 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100070A80;
  block[3] = &unk_100418820;
  block[4] = self;
  void block[5] = &v21;
  block[6] = &v15;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v4 = +[MRUserSettings currentSettings];
  unsigned int v5 = [v4 verboseHostedDiscoverySessionLogging];

  if (v5)
  {
    id v6 = MRLogCategoryDiscovery();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v22[5];
      *(_DWORD *)buf = 138412546;
      uint64_t v28 = v7;
      __int16 v29 = 2112;
      v30 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[HostedDiscoverySession] Restoring outputDevices %@ for %@", buf, 0x16u);
    }
  }
  id v8 = +[MRUserSettings currentSettings];
  unsigned int v9 = [v8 verboseHostedDiscoverySessionLogging];

  if (v9)
  {
    int v10 = MRLogCategoryDiscovery();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = v16[5];
      *(_DWORD *)buf = 138412546;
      uint64_t v28 = v11;
      __int16 v29 = 2112;
      v30 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[HostedDiscoverySession] Restoring endpoints %@ for %@", buf, 0x16u);
    }
  }
  double v12 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  [v12 availableOutputDevicesDidChange:v22[5]];

  v13 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  [v13 availableEndpointsDidChange:v16[5]];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
}

- (void)_maybeWakeClient
{
  xpcClient = self->_xpcClient;
  if (!xpcClient)
  {
    id v4 = +[MRDMediaRemoteServer server];
    objc_msgSend(v4, "clientForPID:", -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"));
    unsigned int v5 = (MRDMediaRemoteClient *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_xpcClient;
    self->_xpcClient = v5;

    xpcClient = self->_xpcClient;
  }
  uint64_t v7 = +[MRPlayerPath anyPlayerPath];
  unsigned int v8 = [(MRDMediaRemoteClient *)xpcClient notificationRequiresTaskAssertionForPlayerPath:v7];

  if (v8)
  {
    unsigned int v9 = self->_xpcClient;
    id v10 = +[MRUserSettings currentSettings];
    [v10 wakingPlayerPathAssertionDuration];
    -[MRDMediaRemoteClient takeAssertion:forReason:duration:](v9, "takeAssertion:forReason:duration:", 4, @"WakingPlayerPathNotification");
  }
}

- (unsigned)_calculateEffectiveDiscoveryMode
{
  if (self->_processSuspended) {
    return 0;
  }
  else {
    return self->_desiredDiscoveryMode;
  }
}

- (void)_reevaluateEffectiveDiscoveryMode
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v3 = [(MRDAVHostedDiscoverySession *)self _calculateEffectiveDiscoveryMode];

  [(MRDAVHostedDiscoverySession *)self setEffectiveDiscoveryMode:v3];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (MRDHostedRoutingController)hostedRoutingController
{
  return self->_hostedRoutingController;
}

- (MRDAVHostedDiscoverySessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDAVHostedDiscoverySessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MROSTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NSArray)updatedEndpoints
{
  return self->_updatedEndpoints;
}

- (void)setUpdatedEndpoints:(id)a3
{
}

- (NSArray)updatedOutputDevices
{
  return self->_updatedOutputDevices;
}

- (void)setUpdatedOutputDevices:(id)a3
{
}

- (NSArray)pendingEndpoints
{
  return self->_pendingEndpoints;
}

- (void)setPendingEndpoints:(id)a3
{
}

- (NSArray)pendingOutputDevices
{
  return self->_pendingOutputDevices;
}

- (void)setPendingOutputDevices:(id)a3
{
}

- (BOOL)endpointsDelayed
{
  return self->_endpointsDelayed;
}

- (void)setEndpointsDelayed:(BOOL)a3
{
  self->_endpointsDelayed = a3;
}

- (BOOL)devicesDelayed
{
  return self->_devicesDelayed;
}

- (void)setDevicesDelayed:(BOOL)a3
{
  self->_devicesDelayed = a3;
}

- (MRXPCConnectionMonitor)connectionMonitor
{
  return self->_connectionMonitor;
}

- (void)setConnectionMonitor:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (MRDMediaRemoteClient)xpcClient
{
  return self->_xpcClient;
}

- (void)setXpcClient:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (unsigned)desiredDiscoveryMode
{
  return self->_desiredDiscoveryMode;
}

- (void)setDesiredDiscoveryMode:(unsigned int)a3
{
  self->_desiredDiscoveryMode = a3;
}

- (NSDate)lastDesiredDiscoveryModeEnableDate
{
  return self->_lastDesiredDiscoveryModeEnableDate;
}

- (void)setLastDesiredDiscoveryModeEnableDate:(id)a3
{
}

- (NSDate)lastDesiredDiscoveryModeDisableDate
{
  return self->_lastDesiredDiscoveryModeDisableDate;
}

- (void)setLastDesiredDiscoveryModeDisableDate:(id)a3
{
}

- (unsigned)effectiveDiscoveryMode
{
  return self->_effectiveDiscoveryMode;
}

- (NSDate)lastEffectiveDiscoveryModeEnableDate
{
  return self->_lastEffectiveDiscoveryModeEnableDate;
}

- (void)setLastEffectiveDiscoveryModeEnableDate:(id)a3
{
}

- (NSDate)lastEffectiveDiscoveryModeDisableDate
{
  return self->_lastEffectiveDiscoveryModeDisableDate;
}

- (void)setLastEffectiveDiscoveryModeDisableDate:(id)a3
{
}

- (BOOL)processSuspended
{
  return self->_processSuspended;
}

- (RBSProcessMonitor)stateMonitor
{
  return self->_stateMonitor;
}

- (void)setStateMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMonitor, 0);
  objc_storeStrong((id *)&self->_lastEffectiveDiscoveryModeDisableDate, 0);
  objc_storeStrong((id *)&self->_lastEffectiveDiscoveryModeEnableDate, 0);
  objc_storeStrong((id *)&self->_lastDesiredDiscoveryModeDisableDate, 0);
  objc_storeStrong((id *)&self->_lastDesiredDiscoveryModeEnableDate, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_connectionMonitor, 0);
  objc_storeStrong((id *)&self->_pendingOutputDevices, 0);
  objc_storeStrong((id *)&self->_pendingEndpoints, 0);
  objc_storeStrong((id *)&self->_updatedOutputDevices, 0);
  objc_storeStrong((id *)&self->_updatedEndpoints, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hostedRoutingController, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end