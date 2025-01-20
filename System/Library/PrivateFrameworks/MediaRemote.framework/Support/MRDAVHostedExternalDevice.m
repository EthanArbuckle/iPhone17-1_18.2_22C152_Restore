@interface MRDAVHostedExternalDevice
- (BOOL)_endpointIsSolo:(id)a3;
- (BOOL)_endpointShouldNotifyClientsOfTopologyChanges:(id)a3;
- (BOOL)_endpointShouldPostVolumeNotifications:(id)a3 outputDevice:(id)a4;
- (BOOL)_endpointSupportsVolumeControl:(id)a3;
- (BOOL)_onSerialQueue_isEndpointsDesignatedGroupLeader:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)tombstoned;
- (BOOL)useOutputDeviceCache;
- (MRAVDistantEndpoint)endpoint;
- (MRAVRoutingDiscoverySession)silentDiscoverySession;
- (MRDAVHostedExternalDevice)initWithExternalDevice:(id)a3;
- (MRDConnectionLifetimeController)lifetimeController;
- (MRExternalDevice)externalDevice;
- (MRExternalOutputContextDataSource)externalOutputContext;
- (MROrigin)origin;
- (NSArray)personalOutputDevices;
- (NSArray)subscribedPlayerPaths;
- (NSDate)canMigrateEvaluationTimestamp;
- (NSError)canMigrateToLocalEndpointError;
- (NSMutableSet)mutableExternalDeviceClients;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)outputDeviceUID;
- (NSXPCListener)xpcListener;
- (NSXPCListenerEndpoint)externalDeviceListenerEndpoint;
- (OS_dispatch_queue)externalDeviceCallbackQueue;
- (OS_dispatch_queue)serialQueue;
- (id)_allExternalDeviceClients;
- (id)_connectedExternalDeviceClients;
- (id)_connectingExternalDeviceClients;
- (id)_externalDeviceClientForConnection:(id)a3;
- (id)_mutableExternalDeviceClientsWithRegisteredCallbacks:(unint64_t)a3;
- (id)_mutableExternalDeviceClientsWithRegisteredNotification:(unint64_t)a3;
- (id)externalDeviceClients;
- (id)groupSessionToken;
- (unint64_t)notifications;
- (unint64_t)registeredCallbacks;
- (void)_externalDeviceClientDidInvalidate:(id)a3 withError:(id)a4;
- (void)_handleExternalDeviceConnectionDidChange:(id)a3;
- (void)_handleMaybeCanMigrateToLocalEndpointDidChange:(id)a3;
- (void)_initializeExternalDevice:(id)a3;
- (void)_maybePostEndpointDidAddOutputDevice:(id)a3;
- (void)_maybePostEndpointDidChangeOutputDevice:(id)a3;
- (void)_maybePostEndpointDidRemoveOutputDevice:(id)a3;
- (void)_maybePostVolumeControlCapabilitiesDidChange:(unsigned int)a3 outputDevice:(id)a4;
- (void)_maybePostVolumeDidChange:(float)a3 outputDevice:(id)a4;
- (void)_maybePostVolumeIsMutedDidChange:(BOOL)a3 outputDevice:(id)a4;
- (void)_onSerialQueue_reevaluateVolumeControlCapabilitiesForEndpoint:(id)a3;
- (void)_processCanMigrateToLocalEndpointEvent:(id)a3 timestamp:(id)a4 error:(id)a5;
- (void)_reloadEndpoint;
- (void)_reloadHostedExternalDeviceCallbacks;
- (void)_reloadHostedExternalDeviceNotifications;
- (void)_reloadHostedExternalDeviceSubscribedPlayerPaths;
- (void)adjustOutputDeviceVolume:(int64_t)a3 outputDeviceUID:(id)a4 details:(id)a5 completion:(id)a6;
- (void)connectWithOptions:(unsigned int)a3 userInfo:(id)a4 completion:(id)a5;
- (void)createHostedEndpointWithOutputDeviceUIDs:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)disconnect:(id)a3;
- (void)disconnectOrigin:(id)a3;
- (void)expanseManagerTelevisionDidJoinSession:(id)a3;
- (void)expanseManagerTelevisionDidLeaveSession:(id)a3;
- (void)getCustomOriginDataWithCompletion:(id)a3;
- (void)getDeviceInfoWithCompletion:(id)a3;
- (void)getExternalOutputContextWithCompletion:(id)a3;
- (void)getPersonalOutputDevices:(id)a3;
- (void)hostedExternalDeviceConnectionStateDidChange:(unsigned int)a3 withError:(id)a4;
- (void)hostedExternalDeviceDeviceInfoDidChange:(id)a3;
- (void)hostedExternalDeviceDidAddOutputDevice:(id)a3;
- (void)hostedExternalDeviceDidChangeOutputDevice:(id)a3;
- (void)hostedExternalDeviceDidReceiveCustomData:(id)a3 withName:(id)a4;
- (void)hostedExternalDeviceDidRemoveOutputDevice:(id)a3;
- (void)hostedExternalDeviceEndpointDidChange:(id)a3;
- (void)hostedExternalDeviceIsMutedDidChange:(BOOL)a3 forOutputDevice:(id)a4;
- (void)hostedExternalDeviceVolumeCapabilitiesDidChange:(unsigned int)a3 forOutputDevice:(id)a4;
- (void)hostedExternalDeviceVolumeDidChange:(float)a3 forOutputDevice:(id)a4;
- (void)modifyTopologyWithRequest:(id)a3 completion:(id)a4;
- (void)muteOutputDeviceVolume:(BOOL)a3 outputDeviceUID:(id)a4 details:(id)a5 completion:(id)a6;
- (void)outputContextDataSourceDidAddOutputDevice:(id)a3;
- (void)outputContextDataSourceDidChangeOutputDevice:(id)a3;
- (void)outputContextDataSourceDidRemoveOutputDevice:(id)a3;
- (void)outputContextDataSourceOutputDeviceDidChangeVolume:(id)a3;
- (void)outputContextDataSourceOutputDeviceDidChangeVolumeControlCapabilities:(id)a3;
- (void)outputContextDataSourceOutputDeviceDidChangeVolumeMuted:(id)a3;
- (void)outputDeviceVolume:(id)a3 withCompletion:(id)a4;
- (void)outputDeviceVolumeControlCapabilities:(id)a3 withCompletion:(id)a4;
- (void)pingWithTimeout:(double)a3 callback:(id)a4;
- (void)registerForOutputContextNotifications:(id)a3;
- (void)requestGroupSessionWithDetails:(id)a3 completion:(id)a4;
- (void)sendButtonEventWithUsagePage:(unsigned int)a3 usage:(unsigned int)a4 down:(BOOL)a5;
- (void)sendCustomData:(id)a3 withName:(id)a4;
- (void)setCanMigrateEvaluationTimestamp:(id)a3;
- (void)setCanMigrateToLocalEndpointError:(id)a3;
- (void)setConversationDetectionEnabled:(BOOL)a3 outputDeviceUID:(id)a4 completion:(id)a5;
- (void)setDiscoveryMode:(unsigned int)a3 forConfiguration:(id)a4;
- (void)setExternalDeviceCallbackQueue:(id)a3;
- (void)setLifetimeController:(id)a3;
- (void)setListeningMode:(id)a3 outputDeviceUID:(id)a4 completion:(id)a5;
- (void)setMutableExternalDeviceClients:(id)a3;
- (void)setNotifications:(unint64_t)a3;
- (void)setOutputDeviceVolume:(float)a3 outputDeviceUID:(id)a4 details:(id)a5 completion:(id)a6;
- (void)setRegisteredCallbacks:(unint64_t)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSilentDiscoverySession:(id)a3;
- (void)setSubscribedPlayerPaths:(id)a3;
- (void)setTombstoned:(BOOL)a3;
- (void)setUseOutputDeviceCache:(BOOL)a3;
- (void)setXpcListener:(id)a3;
- (void)tombstoneWithError:(id)a3;
@end

@implementation MRDAVHostedExternalDevice

- (MRDAVHostedExternalDevice)initWithExternalDevice:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MRDAVHostedExternalDevice;
  v6 = [(MRDAVHostedExternalDevice *)&v21 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_externalDevice, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.mediaremoted.hostedExternalDevice.serialQueue", v8);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.mediaremoted.hostedExternalDevice.callbackQueue", v11);
    externalDeviceCallbackQueue = v7->_externalDeviceCallbackQueue;
    v7->_externalDeviceCallbackQueue = (OS_dispatch_queue *)v12;

    v14 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    mutableExternalDeviceClients = v7->_mutableExternalDeviceClients;
    v7->_mutableExternalDeviceClients = v14;

    uint64_t v16 = +[NSDate distantPast];
    canMigrateEvaluationTimestamp = v7->_canMigrateEvaluationTimestamp;
    v7->_canMigrateEvaluationTimestamp = (NSDate *)v16;

    if (v5)
    {
      uint64_t v18 = +[NSXPCListener anonymousListener];
      xpcListener = v7->_xpcListener;
      v7->_xpcListener = (NSXPCListener *)v18;

      [(NSXPCListener *)v7->_xpcListener setDelegate:v7];
      [(NSXPCListener *)v7->_xpcListener resume];
      [(MRDAVHostedExternalDevice *)v7 _initializeExternalDevice:v5];
    }
  }

  return v7;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_xpcListener setDelegate:0];
  [(NSXPCListener *)self->_xpcListener invalidate];
  v3 = +[MRExpanseManager sharedManager];
  [v3 removeObserver:self];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)MRDAVHostedExternalDevice;
  [(MRDAVHostedExternalDevice *)&v5 dealloc];
}

- (NSString)description
{
  uint64_t v4 = 0;
  objc_super v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = sub_1000CF11C;
  v8 = sub_1000CF12C;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

- (NSString)debugDescription
{
  uint64_t v4 = 0;
  objc_super v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = sub_1000CF11C;
  v8 = sub_1000CF12C;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

- (MRExternalDevice)externalDevice
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000CF11C;
  v10 = sub_1000CF12C;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000CF65C;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRExternalDevice *)v3;
}

- (NSXPCListenerEndpoint)externalDeviceListenerEndpoint
{
  return [(NSXPCListener *)self->_xpcListener endpoint];
}

- (id)externalDeviceClients
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000CF11C;
  v10 = sub_1000CF12C;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000CF768;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)groupSessionToken
{
  id v2 = [(MRDAVHostedExternalDevice *)self externalDevice];
  id v3 = [v2 groupSessionToken];

  return v3;
}

- (NSString)outputDeviceUID
{
  uint64_t v4 = 0;
  objc_super v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = sub_1000CF11C;
  uint64_t v8 = sub_1000CF12C;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

- (void)tombstoneWithError:(id)a3
{
  id v4 = a3;
  objc_super v5 = MRLogCategoryConnections();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDAVHostedExternalDevice] Hosted endpoint %{public}@ did tombstone with error %@", buf, 0x16u);
  }

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CFA74;
  block[3] = &unk_100415CC8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (NSArray)personalOutputDevices
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  serialQueue = self->_serialQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000CFB74;
  v9[3] = &unk_1004158D8;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync((dispatch_queue_t)serialQueue, v9);
  uint64_t v6 = v10;
  v7 = (NSArray *)v5;

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D0244;
  block[3] = &unk_100415CF0;
  block[4] = self;
  void block[5] = &v41;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  int v8 = *((unsigned __int8 *)v42 + 24);
  if (*((unsigned char *)v42 + 24))
  {
    id v9 = MRLogCategoryConnections();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[MRDAVHostedExternalDevice] %{public}@ is tombstoned, rejecting new XPC connection %{public}@", buf, 0x16u);
    }
  }
  else
  {
    id v10 = [[MRDAVHostedExternalDeviceClient alloc] initWithConnection:v6];
    id v11 = MRLogCategoryConnections();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[MRDAVHostedExternalDevice] %{public}@ is accepting new XPC connection %{public}@", buf, 0x16u);
    }

    objc_initWeak(&location, self);
    objc_initWeak(&from, v10);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v46 = 0;
    dispatch_queue_t v12 = self->_serialQueue;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000D0258;
    v33[3] = &unk_10041B5F0;
    v24 = v12;
    v34 = v24;
    v35 = buf;
    objc_copyWeak(&v36, &location);
    objc_copyWeak(&v37, &from);
    v13 = objc_retainBlock(v33);
    v14 = +[MRDistantExternalDevice serviceInterface];
    [v6 setExportedInterface:v14];

    v15 = [v6 exportedInterface];
    uint64_t v16 = [v15 protocol];
    v17 = +[MRWeakProxy weakProxyWithObject:self protocol:v16];
    [v6 setExportedObject:v17];

    uint64_t v18 = +[MRDistantExternalDevice clientInterface];
    [v6 setRemoteObjectInterface:v18];

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000D0330;
    v31[3] = &unk_100416938;
    v19 = v13;
    id v32 = v19;
    [v6 setInterruptionHandler:v31];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000D03A0;
    v29[3] = &unk_100416938;
    v20 = v19;
    id v30 = v20;
    [v6 setInvalidationHandler:v29];
    [v6 resume];
    objc_super v21 = self->_serialQueue;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000D0410;
    v26[3] = &unk_100416730;
    v27 = v10;
    v28 = buf;
    v26[4] = self;
    v22 = v10;
    dispatch_sync((dispatch_queue_t)v21, v26);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&v36);

    _Block_object_dispose(buf, 8);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v41, 8);

  return v8 == 0;
}

- (void)getCustomOriginDataWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = [(MRDAVHostedExternalDevice *)self externalDevice];
  id v6 = [v5 customOrigin];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 data];
    Error = 0;
  }
  else
  {
    Error = (void *)MRMediaRemoteCreateError();
    uint64_t v8 = 0;
  }
  id v10 = (id)v8;
  v4[2](v4);
}

- (unint64_t)registeredCallbacks
{
  id v3 = +[NSXPCConnection currentConnection];
  id v4 = [(MRDAVHostedExternalDevice *)self _externalDeviceClientForConnection:v3];
  id v5 = [v4 registeredCallbacks];

  return (unint64_t)v5;
}

- (void)setRegisteredCallbacks:(unint64_t)a3
{
  id v5 = +[NSXPCConnection currentConnection];
  id v6 = [(MRDAVHostedExternalDevice *)self _externalDeviceClientForConnection:v5];
  [v6 setRegisteredCallbacks:a3];
  v7 = MRLogCategoryConnections();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = NSStringFromMRAVDistantExternalDeviceCallbackFlags();
    int v9 = 138543874;
    id v10 = v6;
    __int16 v11 = 2114;
    dispatch_queue_t v12 = self;
    __int16 v13 = 2114;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MRDAVHostedExternalDevice] Client %{public}@ is setting the following registered callbacks on %{public}@: %{public}@", (uint8_t *)&v9, 0x20u);
  }
  [(MRDAVHostedExternalDevice *)self _reloadHostedExternalDeviceCallbacks];
}

- (unint64_t)notifications
{
  id v3 = +[NSXPCConnection currentConnection];
  id v4 = [(MRDAVHostedExternalDevice *)self _externalDeviceClientForConnection:v3];
  id v5 = [v4 notifications];

  return (unint64_t)v5;
}

- (void)setNotifications:(unint64_t)a3
{
  id v5 = +[NSXPCConnection currentConnection];
  id v6 = [(MRDAVHostedExternalDevice *)self _externalDeviceClientForConnection:v5];
  [v6 setNotifications:a3];
  v7 = MRLogCategoryConnections();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = NSStringFromMRAVDistantExternalDeviceNotificationFlags();
    int v9 = 138543874;
    id v10 = v6;
    __int16 v11 = 2114;
    dispatch_queue_t v12 = self;
    __int16 v13 = 2114;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MRDAVHostedExternalDevice] Client %{public}@ is setting the following notifications on %{public}@: %{public}@", (uint8_t *)&v9, 0x20u);
  }
  [(MRDAVHostedExternalDevice *)self _reloadHostedExternalDeviceNotifications];
}

- (void)setSubscribedPlayerPaths:(id)a3
{
  id v4 = a3;
  id v5 = +[NSXPCConnection currentConnection];
  id v6 = [(MRDAVHostedExternalDevice *)self _externalDeviceClientForConnection:v5];
  [v6 setSubscribedPlayerPaths:v4];
  v7 = MRLogCategoryConnections();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138543874;
    int v9 = v6;
    __int16 v10 = 2114;
    __int16 v11 = self;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MRDAVHostedExternalDevice] Client %{public}@ is subscribing to the following player paths on %{public}@: %{public}@", (uint8_t *)&v8, 0x20u);
  }

  [(MRDAVHostedExternalDevice *)self _reloadHostedExternalDeviceSubscribedPlayerPaths];
}

- (void)connectWithOptions:(unsigned int)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  __int16 v10 = +[NSDate now];
  id v36 = +[NSXPCConnection currentConnection];
  __int16 v11 = -[MRDAVHostedExternalDevice _externalDeviceClientForConnection:](self, "_externalDeviceClientForConnection:");
  id v12 = [v9 mutableCopy];

  id v13 = [v12 objectForKeyedSubscript:MRExternalDeviceConnectionCorrelationIDUserInfoKey];
  v14 = [v11 bundleIdentifier];
  id v35 = v12;
  [v12 setObject:v14 forKeyedSubscript:MRExternalDeviceConnectionClientBundleIDUserInfoKey];

  id v15 = objc_alloc((Class)NSString);
  uint64_t v16 = objc_opt_class();
  unsigned int v33 = a3;
  v17 = (void *)MRExternalDeviceConnectOptionsCopyDescription();
  id v18 = [v15 initWithFormat:@"%@:%p (%@)", v16, self, v17];

  id v19 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"HostedExternalDevice.connectWithOptions", v13];
  v20 = v19;
  if (v18) {
    [v19 appendFormat:@" for %@", v18];
  }
  if (v11) {
    [v20 appendFormat:@" because %@", v11];
  }
  objc_super v21 = _MRLogForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v50 = v20;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1000D0D98;
  v43[3] = &unk_100418348;
  id v22 = v18;
  id v44 = v22;
  v45 = @"HostedExternalDevice.connectWithOptions";
  id v23 = v13;
  id v46 = v23;
  id v34 = v10;
  id v47 = v34;
  id v24 = v8;
  id v48 = v24;
  id v25 = objc_retainBlock(v43);
  [v11 setHasAttemptedToConnect:1];
  id v26 = objc_alloc((Class)MRBlockGuard);
  id v27 = [objc_alloc((Class)NSString) initWithFormat:@"%@<%@>", @"HostedExternalDevice.connectWithOptions", v23];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000D0FEC;
  v41[3] = &unk_100415FA8;
  v28 = v25;
  id v42 = v28;
  id v29 = [v26 initWithTimeout:v27 reason:v41 handler:30.0];

  id v30 = [(MRDAVHostedExternalDevice *)self externalDevice];
  if (v30)
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000D0FFC;
    v37[3] = &unk_100418408;
    id v38 = v11;
    id v39 = v29;
    v40 = v28;
    v31 = v35;
    [v30 connectWithOptions:v33 userInfo:v35 completion:v37];

    id v32 = v38;
LABEL_11:

    goto LABEL_12;
  }
  v31 = v35;
  if ([v29 disarm])
  {
    id v32 = [objc_alloc((Class)NSError) initWithMRError:123, @"No externalDevice available when attempting to %@", @"HostedExternalDevice.connectWithOptions" format];
    ((void (*)(void *, id))v28[2])(v28, v32);
    goto LABEL_11;
  }
LABEL_12:
}

- (void)disconnect:(id)a3
{
  id v4 = a3;
  id v5 = +[NSXPCConnection currentConnection];
  id v6 = [(MRDAVHostedExternalDevice *)self _externalDeviceClientForConnection:v5];
  v7 = [v6 connection];
  id v8 = [v7 valueForEntitlement:@"com.apple.mediaremote.externaldevice.disconnect"];
  unsigned int v9 = [v8 BOOLValue];

  if (v9)
  {
    __int16 v10 = MRLogCategoryConnections();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      id v13 = v6;
      __int16 v14 = 2114;
      id v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[MRDAVHostedExternalDevice] Client %{public}@ is requesting to disconnect from external device using hosted endpoint %{public}@", (uint8_t *)&v12, 0x16u);
    }

    __int16 v11 = [(MRDAVHostedExternalDevice *)self externalDevice];
    [v11 disconnect:v4];
  }
}

- (void)outputDeviceVolumeControlCapabilities:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MRDAVHostedExternalDevice *)self externalDevice];
  if (self->_useOutputDeviceCache
    && [(MRExternalDevice *)self->_externalDevice wantsVolumeNotifications])
  {
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D134C;
    block[3] = &unk_1004161E0;
    block[4] = self;
    id v15 = v6;
    id v16 = v7;
    dispatch_sync((dispatch_queue_t)serialQueue, block);

    __int16 v10 = v15;
LABEL_7:

    goto LABEL_8;
  }
  externalDeviceCallbackQueue = self->_externalDeviceCallbackQueue;
  if (!v8)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000D1458;
    v12[3] = &unk_100416938;
    id v13 = v7;
    dispatch_async((dispatch_queue_t)externalDeviceCallbackQueue, v12);
    __int16 v10 = v13;
    goto LABEL_7;
  }
  [v8 outputDeviceVolumeControlCapabilities:v6 queue:externalDeviceCallbackQueue completion:v7];
LABEL_8:
}

- (void)setOutputDeviceVolume:(float)a3 outputDeviceUID:(id)a4 details:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[NSDate now];
  id v36 = +[NSXPCConnection currentConnection];
  __int16 v14 = [(MRDAVHostedExternalDevice *)self _externalDeviceClientForConnection:v36];
  id v15 = [objc_alloc((Class)NSString) initWithFormat:@"%@:%p %@ -> %lf", objc_opt_class(), self, v10, a3];
  id v16 = objc_alloc((Class)NSMutableString);
  v17 = [v11 requestID];
  id v18 = [v16 initWithFormat:@"%@<%@>", @"HostedExternalDevice.setOutputDeviceVolume", v17];

  if (v15) {
    [v18 appendFormat:@" for %@", v15];
  }
  if (v14) {
    [v18 appendFormat:@" because %@", v14];
  }
  id v19 = _MRLogForCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1000D1A00;
  v47[3] = &unk_10041B618;
  id v20 = v15;
  id v48 = v20;
  v49 = @"HostedExternalDevice.setOutputDeviceVolume";
  id v21 = v11;
  id v50 = v21;
  id v22 = v13;
  id v51 = v22;
  id v23 = v12;
  v52 = self;
  id v53 = v23;
  id v24 = objc_retainBlock(v47);
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v55 = 0x3032000000;
  v56 = sub_1000CF11C;
  v57 = sub_1000CF12C;
  id v58 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D1CF8;
  block[3] = &unk_100418820;
  block[4] = self;
  void block[5] = &v43;
  void block[6] = &buf;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v26 = objc_alloc((Class)MRBlockGuard);
  id v27 = [v21 name];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000D1D54;
  v40[3] = &unk_100415FA8;
  v28 = v24;
  id v41 = v28;
  id v29 = [v26 initWithTimeout:v27 reason:v40 handler:7.0];

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000D1D64;
  v37[3] = &unk_1004187A8;
  id v30 = v29;
  id v38 = v30;
  v31 = v28;
  id v39 = v31;
  id v32 = objc_retainBlock(v37);
  if (!*((unsigned char *)v44 + 24))
  {
    id v35 = [objc_alloc((Class)NSError) initWithMRError:36];
    ((void (*)(void *, id))v32[2])(v32, v35);
LABEL_12:

    goto LABEL_13;
  }
  id v34 = *(void **)(*((void *)&buf + 1) + 40);
  if (!v34)
  {
    id v35 = [objc_alloc((Class)NSError) initWithMRError:123];
    ((void (*)(void *, id))v32[2])(v32, v35);
    goto LABEL_12;
  }
  *(float *)&double v33 = a3;
  [v34 setOutputDeviceVolume:v10 outputDeviceUID:v21 details:self->_externalDeviceCallbackQueue queue:v32 completion:v33];
LABEL_13:

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v43, 8);
}

- (void)outputDeviceVolume:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MRDAVHostedExternalDevice *)self externalDevice];
  unsigned int v9 = v8;
  if (self->_useOutputDeviceCache && [v8 wantsVolumeNotifications])
  {
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D1F3C;
    block[3] = &unk_1004161E0;
    block[4] = self;
    id v16 = v6;
    id v17 = v7;
    dispatch_sync((dispatch_queue_t)serialQueue, block);

    id v11 = v16;
LABEL_7:

    goto LABEL_8;
  }
  externalDeviceCallbackQueue = self->_externalDeviceCallbackQueue;
  if (!v9)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000D2058;
    v13[3] = &unk_100416938;
    id v14 = v7;
    dispatch_async((dispatch_queue_t)externalDeviceCallbackQueue, v13);
    id v11 = v14;
    goto LABEL_7;
  }
  [v9 outputDeviceVolume:v6 queue:externalDeviceCallbackQueue completion:v7];
LABEL_8:
}

- (void)adjustOutputDeviceVolume:(int64_t)a3 outputDeviceUID:(id)a4 details:(id)a5 completion:(id)a6
{
  id v38 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = +[NSDate now];
  id v37 = +[NSXPCConnection currentConnection];
  id v13 = [(MRDAVHostedExternalDevice *)self _externalDeviceClientForConnection:v37];
  id v14 = objc_alloc((Class)NSString);
  uint64_t v15 = objc_opt_class();
  id v16 = MRMediaRemoteVolumeControlAdjustmentDescription();
  id v17 = [v14 initWithFormat:@"%@:%p %@ -> %@", v15, self, v38, v16];

  id v18 = objc_alloc((Class)NSMutableString);
  id v19 = [v10 requestID];
  id v20 = [v18 initWithFormat:@"%@<%@>", @"HostedExternalDevice.adjustOutputDeviceVolume", v19];

  if (v17) {
    [v20 appendFormat:@" for %@", v17];
  }
  if (v13) {
    [v20 appendFormat:@" because %@", v13];
  }
  id v21 = _MRLogForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v20;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1000D2618;
  v49[3] = &unk_10041B618;
  id v22 = v17;
  id v50 = v22;
  id v51 = @"HostedExternalDevice.adjustOutputDeviceVolume";
  id v23 = v10;
  id v52 = v23;
  id v24 = v12;
  id v53 = v24;
  id v25 = v11;
  v54 = self;
  id v55 = v25;
  id v26 = objc_retainBlock(v49);
  uint64_t v45 = 0;
  char v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v57 = 0x3032000000;
  id v58 = sub_1000CF11C;
  v59 = sub_1000CF12C;
  id v60 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D2910;
  block[3] = &unk_100418820;
  block[4] = self;
  void block[5] = &v45;
  void block[6] = &buf;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v28 = objc_alloc((Class)MRBlockGuard);
  id v29 = [v23 name];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000D296C;
  v42[3] = &unk_100415FA8;
  id v30 = v26;
  id v43 = v30;
  id v31 = [v28 initWithTimeout:v29 reason:v42 handler:7.0];

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000D297C;
  v39[3] = &unk_1004187A8;
  id v32 = v31;
  id v40 = v32;
  double v33 = v30;
  id v41 = v33;
  id v34 = objc_retainBlock(v39);
  if (!*((unsigned char *)v46 + 24))
  {
    id v36 = [objc_alloc((Class)NSError) initWithMRError:36];
    ((void (*)(void *, id))v34[2])(v34, v36);
LABEL_12:

    goto LABEL_13;
  }
  id v35 = *(void **)(*((void *)&buf + 1) + 40);
  if (!v35)
  {
    id v36 = [objc_alloc((Class)NSError) initWithMRError:123];
    ((void (*)(void *, id))v34[2])(v34, v36);
    goto LABEL_12;
  }
  [v35 adjustOutputDeviceVolume:a3 outputDeviceUID:v38 details:v23 queue:self->_externalDeviceCallbackQueue completion:v34];
LABEL_13:

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v45, 8);
}

- (void)muteOutputDeviceVolume:(BOOL)a3 outputDeviceUID:(id)a4 details:(id)a5 completion:(id)a6
{
  BOOL v8 = a3;
  id v35 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = +[NSDate now];
  id v34 = +[NSXPCConnection currentConnection];
  id v13 = [(MRDAVHostedExternalDevice *)self _externalDeviceClientForConnection:v34];
  id v14 = [objc_alloc((Class)NSString) initWithFormat:@"%@:%p %@ -> %u", objc_opt_class(), self, v35, v8];
  id v15 = objc_alloc((Class)NSMutableString);
  id v16 = [v10 requestID];
  id v17 = [v15 initWithFormat:@"%@<%@>", @"HostedExternalDevice.adjustOutputDeviceVolume", v16];

  if (v14) {
    [v17 appendFormat:@" for %@", v14];
  }
  if (v13) {
    [v17 appendFormat:@" because %@", v13];
  }
  id v18 = _MRLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1000D2F20;
  v46[3] = &unk_10041B618;
  id v19 = v14;
  id v47 = v19;
  char v48 = @"HostedExternalDevice.adjustOutputDeviceVolume";
  id v20 = v10;
  id v49 = v20;
  id v21 = v12;
  id v50 = v21;
  id v22 = v11;
  id v51 = self;
  id v52 = v22;
  id v23 = objc_retainBlock(v46);
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v54 = 0x3032000000;
  id v55 = sub_1000CF11C;
  v56 = sub_1000CF12C;
  id v57 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D3218;
  block[3] = &unk_100418820;
  block[4] = self;
  void block[5] = &v42;
  void block[6] = &buf;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v25 = objc_alloc((Class)MRBlockGuard);
  id v26 = [v20 name];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000D3274;
  v39[3] = &unk_100415FA8;
  id v27 = v23;
  id v40 = v27;
  id v28 = [v25 initWithTimeout:v26 reason:v39 handler:7.0];

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000D3284;
  v36[3] = &unk_1004187A8;
  id v29 = v28;
  id v37 = v29;
  id v30 = v27;
  id v38 = v30;
  id v31 = objc_retainBlock(v36);
  if (!*((unsigned char *)v43 + 24))
  {
    id v33 = [objc_alloc((Class)NSError) initWithMRError:36];
    ((void (*)(void *, id))v31[2])(v31, v33);
LABEL_12:

    goto LABEL_13;
  }
  id v32 = *(void **)(*((void *)&buf + 1) + 40);
  if (!v32)
  {
    id v33 = [objc_alloc((Class)NSError) initWithMRError:123];
    ((void (*)(void *, id))v31[2])(v31, v33);
    goto LABEL_12;
  }
  [v32 muteOutputDeviceVolume:v8 outputDeviceUID:v35 details:v20 queue:self->_externalDeviceCallbackQueue completion:v31];
LABEL_13:

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v42, 8);
}

- (void)setListeningMode:(id)a3 outputDeviceUID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(MRDAVHostedExternalDevice *)self externalDevice];
  [v11 setListeningMode:v10 outputDeviceUID:v9 queue:self->_externalDeviceCallbackQueue completion:v8];
}

- (void)setConversationDetectionEnabled:(BOOL)a3 outputDeviceUID:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(MRDAVHostedExternalDevice *)self externalDevice];
  [v10 setConversationDetectionEnabled:v6 outputDeviceUID:v9 queue:self->_externalDeviceCallbackQueue completion:v8];
}

- (void)modifyTopologyWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MRDAVHostedExternalDevice *)self externalDevice];
  id v9 = +[NSXPCConnection currentConnection];
  id v10 = [(MRDAVHostedExternalDevice *)self _externalDeviceClientForConnection:v9];
  id v11 = MRLogCategoryConnections();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v6 outputDeviceUIDs];
    *(_DWORD *)long long buf = 138543874;
    id v20 = v10;
    __int16 v21 = 2114;
    id v22 = self;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[MRDAVHostedExternalDevice] Client %{public}@ is requesting to modify hosted endpoint %{public}@ - %@", buf, 0x20u);
  }
  id v13 = MRLogCategoryConnections();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    [v6 type];
    MRGroupTopologyModificationRequestTypeDescription();
    id v14 = (MRDAVHostedExternalDevice *)objc_claimAutoreleasedReturnValue();
    id v15 = [v6 outputDeviceUIDs];
    *(_DWORD *)long long buf = 138544130;
    id v20 = v10;
    __int16 v21 = 2114;
    id v22 = v14;
    __int16 v23 = 2114;
    id v24 = self;
    __int16 v25 = 2112;
    id v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[MRDAVHostedExternalDevice] Client %{public}@ is requesting to %{public}@ hosted endpoint %{public}@ - %@", buf, 0x2Au);
  }
  externalDeviceCallbackQueue = self->_externalDeviceCallbackQueue;
  if (v8)
  {
    [v8 modifyTopologyWithRequest:v6 withReplyQueue:externalDeviceCallbackQueue completion:v7];
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D3670;
    block[3] = &unk_100416938;
    id v18 = v7;
    dispatch_async((dispatch_queue_t)externalDeviceCallbackQueue, block);
  }
}

- (void)createHostedEndpointWithOutputDeviceUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MRDAVHostedExternalDevice *)self externalDevice];
  id v9 = +[NSXPCConnection currentConnection];
  id v10 = [(MRDAVHostedExternalDevice *)self _externalDeviceClientForConnection:v9];
  id v11 = MRLogCategoryConnections();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543874;
    id v16 = v10;
    __int16 v17 = 2114;
    id v18 = self;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[MRDAVHostedExternalDevice] Client %{public}@ is requesting to create hosted endpoint %{public}@ with output devices: %{public}@", buf, 0x20u);
  }

  externalDeviceCallbackQueue = self->_externalDeviceCallbackQueue;
  if (v8)
  {
    [v8 createHostedEndpointWithOutputDeviceUIDs:v6 queue:externalDeviceCallbackQueue completion:v7];
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D3888;
    block[3] = &unk_100416938;
    id v14 = v7;
    dispatch_async((dispatch_queue_t)externalDeviceCallbackQueue, block);
  }
}

- (void)sendCustomData:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_externalDevice;
  id v9 = +[NSXPCConnection currentConnection];
  id v10 = [(MRDAVHostedExternalDevice *)self _externalDeviceClientForConnection:v9];
  id v11 = MRLogCategoryConnections();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138544130;
    id v13 = v10;
    __int16 v14 = 2048;
    id v15 = [v6 length];
    __int16 v16 = 2114;
    id v17 = v7;
    __int16 v18 = 2114;
    __int16 v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[MRDAVHostedExternalDevice] Client %{public}@ is requesting to send %llu bytes of custom data with name %{public}@ using hosted endpoint %{public}@", (uint8_t *)&v12, 0x2Au);
  }

  [(MRExternalDevice *)v8 sendCustomData:v6 withName:v7];
}

- (void)pingWithTimeout:(double)a3 callback:(id)a4
{
  id v6 = a4;
  id v7 = [(MRDAVHostedExternalDevice *)self externalDevice];
  id v8 = +[NSXPCConnection currentConnection];
  id v9 = [(MRDAVHostedExternalDevice *)self _externalDeviceClientForConnection:v8];
  id v10 = MRLogCategoryConnections();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543874;
    __int16 v21 = v9;
    __int16 v22 = 2048;
    double v23 = a3;
    __int16 v24 = 2114;
    __int16 v25 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[MRDAVHostedExternalDevice] [Client %{public}@ is requesting to ping external device with timeout %f using hosted endpoint %{public}@", buf, 0x20u);
  }

  if (v7)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000D3C44;
    v18[3] = &unk_10041B640;
    id v11 = &v19;
    id v19 = v6;
    externalDeviceCallbackQueue = self->_externalDeviceCallbackQueue;
    id v13 = v6;
    [v7 ping:v18 callback:externalDeviceCallbackQueue withQueue:a3];
  }
  else
  {
    __int16 v14 = self->_externalDeviceCallbackQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000D3C5C;
    v16[3] = &unk_100416938;
    id v11 = &v17;
    id v17 = v6;
    id v15 = v6;
    dispatch_async((dispatch_queue_t)v14, v16);
  }
}

- (void)sendButtonEventWithUsagePage:(unsigned int)a3 usage:(unsigned int)a4 down:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = [(MRDAVHostedExternalDevice *)self externalDevice];
  objc_msgSend(v8, "sendButtonEvent:", a3 | (unint64_t)(v6 << 32), v5);
}

- (void)getPersonalOutputDevices:(id)a3
{
  id v5 = a3;
  id v7 = [(MRDAVHostedExternalDevice *)self personalOutputDevices];
  id v6 = [v7 copy];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)setDiscoveryMode:(unsigned int)a3 forConfiguration:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = +[NSXPCConnection currentConnection];
  id v8 = [(MRDAVHostedExternalDevice *)self _externalDeviceClientForConnection:v7];
  id v9 = [v8 discoveryTokenForConfiguration:v6];
  if (!v9)
  {
    id v10 = [(MRDAVHostedExternalDevice *)self externalDevice];
    id v9 = [v10 registerDiscoveryTokenForConfiguration:v6];

    id v11 = [(MRDAVHostedExternalDevice *)self externalDevice];
    id v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    id v17 = sub_1000D3F30;
    __int16 v18 = &unk_10041B668;
    id v12 = v8;
    id v19 = v12;
    id v13 = v6;
    id v20 = v13;
    [v11 setDiscoveryOutputDevicesChangedCallback:&v15 forToken:v9];

    objc_msgSend(v12, "setDiscoveryToken:forConfiguration:", v9, v13, v15, v16, v17, v18);
  }
  __int16 v14 = [(MRDAVHostedExternalDevice *)self externalDevice];
  [v14 setDiscoveryMode:v4 forToken:v9];
}

- (void)getExternalOutputContextWithCompletion:(id)a3
{
}

- (void)getDeviceInfoWithCompletion:(id)a3
{
  id v5 = a3;
  id v7 = [(MRDAVHostedExternalDevice *)self externalDevice];
  id v6 = [v7 deviceInfo];
  (*((void (**)(id, void *))a3 + 2))(v5, v6);
}

- (void)requestGroupSessionWithDetails:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MRDAVHostedExternalDevice *)self externalDevice];
  [v8 requestGroupSessionWithDetails:v7 queue:self->_externalDeviceCallbackQueue completion:v6];
}

- (void)expanseManagerTelevisionDidJoinSession:(id)a3
{
  uint64_t v4 = MRLogCategoryConnections();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MRDAVHostedExternalDevice] %{public}@ check for local route because TV join.", (uint8_t *)&v5, 0xCu);
  }

  [(MRDAVHostedExternalDevice *)self _handleMaybeCanMigrateToLocalEndpointDidChange:0];
}

- (void)expanseManagerTelevisionDidLeaveSession:(id)a3
{
  uint64_t v4 = MRLogCategoryConnections();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MRDAVHostedExternalDevice] %{public}@ check for local route because TV leave.", (uint8_t *)&v5, 0xCu);
  }

  [(MRDAVHostedExternalDevice *)self _handleMaybeCanMigrateToLocalEndpointDidChange:0];
}

- (MROrigin)origin
{
  id v2 = [(MRDAVHostedExternalDevice *)self externalDevice];
  id v3 = [v2 customOrigin];

  return (MROrigin *)v3;
}

- (void)disconnectOrigin:(id)a3
{
  id v4 = [(MRDAVHostedExternalDevice *)self externalDevice];
  id v3 = [objc_alloc((Class)NSError) initWithMRError:124];
  [v4 disconnect:v3];
}

- (void)_handleExternalDeviceConnectionDidChange:(id)a3
{
  id v4 = a3;
  int v5 = [v4 object];
  if ([v5 connectionState] != 2)
  {
    serialQueue = self->_serialQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000D4518;
    v12[3] = &unk_100415CC8;
    void v12[4] = self;
    dispatch_sync((dispatch_queue_t)serialQueue, v12);
    goto LABEL_9;
  }
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  __int16 v18 = sub_1000CF11C;
  id v19 = sub_1000CF12C;
  id v20 = 0;
  id v6 = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D44BC;
  block[3] = &unk_100415CF0;
  void block[4] = self;
  void block[5] = &v15;
  dispatch_sync((dispatch_queue_t)v6, block);
  id v7 = +[MRUserSettings currentSettings];
  if (![v7 remoteDeviceIdleDisconnection] || v16[5]) {
    goto LABEL_6;
  }
  unsigned int v8 = [v5 supportsIdleDisconnection];

  if (v8)
  {
    id v9 = [[MRDConnectionLifetimeController alloc] initWithDataSource:self delegate:self];
    id v10 = (void *)v16[5];
    v16[5] = (uint64_t)v9;

    id v7 = [(MRDAVHostedExternalDevice *)self serialQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000D4508;
    v13[3] = &unk_100415940;
    void v13[4] = self;
    v13[5] = &v15;
    dispatch_sync(v7, v13);
LABEL_6:
  }
  [(MRDAVHostedExternalDevice *)self _handleMaybeCanMigrateToLocalEndpointDidChange:v4];
  _Block_object_dispose(&v15, 8);

LABEL_9:
}

- (void)_handleMaybeCanMigrateToLocalEndpointDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v51 = 0;
  id v52 = &v51;
  uint64_t v53 = 0x3032000000;
  uint64_t v54 = sub_1000CF11C;
  id v55 = sub_1000CF12C;
  id v56 = 0;
  uint64_t v45 = 0;
  char v46 = &v45;
  uint64_t v47 = 0x3032000000;
  char v48 = sub_1000CF11C;
  id v49 = sub_1000CF12C;
  id v50 = 0;
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = sub_1000CF11C;
  id v43 = sub_1000CF12C;
  id v44 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D4B10;
  block[3] = &unk_10041B690;
  void block[4] = self;
  void block[5] = &v45;
  void block[6] = &v51;
  void block[7] = &v39;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v6 = +[NSDate date];
  id v7 = [v4 playerPath];
  unsigned int v8 = [v7 origin];

  if (!v8
    || ([v8 isLocal] & 1) != 0
    || ([v8 isEqual:v46[5]] & 1) != 0
    || !v40[5])
  {
    id v9 = (void *)MRMediaRemoteCopyDeviceUID();
    BOOL v10 = v9 == 0;

    if (v10)
    {
      if ([(id)v40[5] connectionState] == 2)
      {
        id v13 = +[MRUserSettings currentSettings];
        unsigned int v14 = [v13 supportExpanseMigration];

        if (v14)
        {
          uint64_t v15 = +[MRExpanseManager sharedManager];
          id v29 = [v15 activeTelevisionRouteID];

          if (v29)
          {
            uint64_t v16 = MRLogCategoryConnections();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v17 = v52[5];
              *(_DWORD *)long long buf = 138543874;
              v59 = self;
              __int16 v60 = 2114;
              uint64_t v61 = v17;
              __int16 v62 = 2114;
              v63 = v29;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[MRDAVHostedExternalDevice] %{public}@ Checking for match of endpoint: %{public}@ and active TV: %{public}@", buf, 0x20u);
            }

            long long v36 = 0u;
            long long v37 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            __int16 v18 = [(id)v52[5] outputDevices];
            id v19 = [v18 countByEnumeratingWithState:&v34 objects:v57 count:16];
            if (v19)
            {
              uint64_t v20 = *(void *)v35;
              while (2)
              {
                __int16 v21 = 0;
                do
                {
                  if (*(void *)v35 != v20) {
                    objc_enumerationMutation(v18);
                  }
                  uint64_t v22 = *(void *)(*((void *)&v34 + 1) + 8 * (void)v21);
                  double v23 = +[MRExpanseManager sharedManager];
                  LODWORD(v22) = [v23 deviceIsActiveTelevision:v22];

                  if (v22)
                  {
                    [(MRDAVHostedExternalDevice *)self _processCanMigrateToLocalEndpointEvent:@"TV joined Expanse session." timestamp:v6 error:0];

                    goto LABEL_24;
                  }
                  __int16 v21 = (char *)v21 + 1;
                }
                while (v19 != v21);
                id v19 = [v18 countByEnumeratingWithState:&v34 objects:v57 count:16];
                if (v19) {
                  continue;
                }
                break;
              }
            }
          }
        }
        objc_initWeak((id *)buf, self);
        __int16 v24 = (void *)v52[5];
        __int16 v25 = +[MRAVLocalEndpoint sharedLocalEndpointForRoutingContextWithUID:0];
        id v26 = &_dispatch_main_q;
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_1000D4B90;
        v30[3] = &unk_10041B6B8;
        objc_copyWeak(&v33, (id *)buf);
        id v31 = v4;
        id v32 = v6;
        [v24 canMigrateToEndpoint:v25 queue:&_dispatch_main_q completion:v30];

        objc_destroyWeak(&v33);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        id v27 = [v4 name];
        id v28 = [objc_alloc((Class)NSError) initWithMRError:3 format:@"Not already connected to endpoint"];
        [(MRDAVHostedExternalDevice *)self _processCanMigrateToLocalEndpointEvent:v27 timestamp:v6 error:v28];
      }
    }
    else
    {
      id v11 = [v4 name];
      id v12 = [objc_alloc((Class)NSError) initWithMRError:6 format:@"Local device is groupable"];
      [(MRDAVHostedExternalDevice *)self _processCanMigrateToLocalEndpointEvent:v11 timestamp:v6 error:v12];
    }
  }
LABEL_24:

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
}

- (void)_processCanMigrateToLocalEndpointEvent:(id)a3 timestamp:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D4D64;
  block[3] = &unk_10041B6E0;
  id v12 = v9;
  id v16 = v12;
  uint64_t v17 = self;
  id v13 = v10;
  id v18 = v13;
  id v14 = v8;
  id v19 = v14;
  uint64_t v20 = &v21;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  if (*((unsigned char *)v22 + 24)) {
    [(MRDAVHostedExternalDevice *)self _reloadEndpoint];
  }

  _Block_object_dispose(&v21, 8);
}

- (void)outputContextDataSourceOutputDeviceDidChangeVolumeControlCapabilities:(id)a3
{
  externalDeviceCallbackQueue = self->_externalDeviceCallbackQueue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)externalDeviceCallbackQueue);
  id v6 = [v5 userInfo];
  id v7 = [v6 objectForKeyedSubscript:MROutputContextDataSourceVolumeCapabilitiesUserInfoKey];
  id v8 = [v7 intValue];

  id v9 = [v5 userInfo];

  id v10 = [v9 objectForKeyedSubscript:MROutputContextDataSourceOutputDeviceUserInfoKey];

  [(MRDAVHostedExternalDevice *)self _maybePostVolumeControlCapabilitiesDidChange:v8 outputDevice:v10];
}

- (void)outputContextDataSourceOutputDeviceDidChangeVolume:(id)a3
{
  externalDeviceCallbackQueue = self->_externalDeviceCallbackQueue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)externalDeviceCallbackQueue);
  id v6 = [v5 userInfo];
  id v7 = [v6 objectForKeyedSubscript:MROutputContextDataSourceVolumeUserInfoKey];
  [v7 floatValue];
  int v9 = v8;

  id v10 = [v5 userInfo];

  id v12 = [v10 objectForKeyedSubscript:MROutputContextDataSourceOutputDeviceUserInfoKey];

  LODWORD(v11) = v9;
  [(MRDAVHostedExternalDevice *)self _maybePostVolumeDidChange:v12 outputDevice:v11];
}

- (void)outputContextDataSourceOutputDeviceDidChangeVolumeMuted:(id)a3
{
  externalDeviceCallbackQueue = self->_externalDeviceCallbackQueue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)externalDeviceCallbackQueue);
  id v6 = [v5 userInfo];
  id v7 = [v6 objectForKeyedSubscript:MROutputContextDataSourceVolumeMutedUserInfoKey];
  id v8 = [v7 BOOLValue];

  int v9 = [v5 userInfo];

  id v10 = [v9 objectForKeyedSubscript:MROutputContextDataSourceOutputDeviceUserInfoKey];

  [(MRDAVHostedExternalDevice *)self _maybePostVolumeIsMutedDidChange:v8 outputDevice:v10];
}

- (void)outputContextDataSourceDidAddOutputDevice:(id)a3
{
  externalDeviceCallbackQueue = self->_externalDeviceCallbackQueue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)externalDeviceCallbackQueue);
  id v6 = [v5 userInfo];

  id v7 = [v6 objectForKeyedSubscript:MROutputContextDataSourceOutputDeviceUserInfoKey];

  [(MRDAVHostedExternalDevice *)self _maybePostEndpointDidAddOutputDevice:v7];
}

- (void)outputContextDataSourceDidChangeOutputDevice:(id)a3
{
  externalDeviceCallbackQueue = self->_externalDeviceCallbackQueue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)externalDeviceCallbackQueue);
  id v6 = [v5 userInfo];

  id v7 = [v6 objectForKeyedSubscript:MROutputContextDataSourceOutputDeviceUserInfoKey];

  [(MRDAVHostedExternalDevice *)self _maybePostEndpointDidChangeOutputDevice:v7];
}

- (void)outputContextDataSourceDidRemoveOutputDevice:(id)a3
{
  externalDeviceCallbackQueue = self->_externalDeviceCallbackQueue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)externalDeviceCallbackQueue);
  id v6 = [v5 userInfo];

  id v7 = [v6 objectForKeyedSubscript:MROutputContextDataSourceOutputDeviceUserInfoKey];

  [(MRDAVHostedExternalDevice *)self _maybePostEndpointDidRemoveOutputDevice:v7];
}

- (void)hostedExternalDeviceConnectionStateDidChange:(unsigned int)a3 withError:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = MRLogCategoryConnections();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = (void *)MRExternalDeviceConnectionStateCopyDescription();
    *(_DWORD *)long long buf = 138543874;
    uint64_t v22 = self;
    __int16 v23 = 2114;
    char v24 = v8;
    __int16 v25 = 2114;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MRDAVHostedExternalDevice] Hosted endpoint %{public}@ connection state did change to %{public}@ with error %{public}@", buf, 0x20u);
  }
  if (v4 != 2)
  {
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D55DC;
    block[3] = &unk_100415CC8;
    void block[4] = self;
    dispatch_sync((dispatch_queue_t)serialQueue, block);
  }
  id v10 = [(MRDAVHostedExternalDevice *)self _connectingExternalDeviceClients];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) hostedExternalDeviceConnectionStateDidChange:v4 withError:v6];
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v12);
  }
  [(MRDAVHostedExternalDevice *)self _reloadEndpoint];
}

- (void)hostedExternalDeviceDeviceInfoDidChange:(id)a3
{
  id v4 = a3;
  id v5 = MRLogCategoryConnections();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543618;
    long long v17 = self;
    __int16 v18 = 2114;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MRDAVHostedExternalDevice] Hosted endpoint %{public}@ device deviceInfo did change to %{public}@", buf, 0x16u);
  }

  id v6 = [(MRDAVHostedExternalDevice *)self _mutableExternalDeviceClientsWithRegisteredNotification:32];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) hostedExternalDeviceDeviceInfoDidChange:v4];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)hostedExternalDeviceDidReceiveCustomData:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = MRLogCategoryConnections();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543874;
    uint64_t v20 = self;
    __int16 v21 = 2048;
    id v22 = [v6 length];
    __int16 v23 = 2114;
    id v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[MRDAVHostedExternalDevice] Hosted endpoint %{public}@ did receive %llu bytes of custom data with name %{public}@", buf, 0x20u);
  }

  uint64_t v9 = [(MRDAVHostedExternalDevice *)self _mutableExternalDeviceClientsWithRegisteredCallbacks:1];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      long long v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) hostedExternalDeviceDidReceiveCustomData:v6 withName:v7];
        long long v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)hostedExternalDeviceEndpointDidChange:(id)a3
{
  id v4 = a3;
  if ([v4 connectionType] == (id)1)
  {
    serialQueue = self->_serialQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000D5B74;
    v16[3] = &unk_1004158D8;
    void v16[4] = self;
    id v17 = v4;
    id v6 = v4;
    dispatch_sync((dispatch_queue_t)serialQueue, v16);
  }
  else
  {
    id v7 = [(MRDAVHostedExternalDevice *)self personalOutputDevices];
    [v4 setDistantPersonalOutputDevices:v7];

    id v6 = [(MRDAVHostedExternalDevice *)self _allExternalDeviceClients];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (([v12 notifications] & 8) != 0) {
            [v12 hostedExternalDeviceEndpointDidChange:v4];
          }
        }
        id v9 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }
    if ([(MRExternalDevice *)self->_externalDevice supportsDesignatedGroupLeaderUpdates])
    {
      long long v13 = [v4 designatedProxyGroupLeader];
      [(MRExternalDevice *)self->_externalDevice updateDesignatedGroupLeader:v13];
    }
    long long v14 = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D5B30;
    block[3] = &unk_1004158D8;
    void block[4] = self;
    id v19 = v4;
    id v15 = v4;
    dispatch_sync((dispatch_queue_t)v14, block);
  }
}

- (void)hostedExternalDeviceVolumeCapabilitiesDidChange:(unsigned int)a3 forOutputDevice:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription();
  id v8 = MRLogCategoryConnections();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543874;
    long long v20 = self;
    __int16 v21 = 2114;
    long long v22 = v7;
    __int16 v23 = 2114;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[MRDAVHostedExternalDevice] Hosted endpoint %{public}@ volumeCapabilities did change to %{public}@ for outputDevice %{public}@", buf, 0x20u);
  }

  id v9 = [(MRDAVHostedExternalDevice *)self _mutableExternalDeviceClientsWithRegisteredNotification:2];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      long long v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) hostedExternalDeviceVolumeCapabilitiesDidChange:v4 forOutputDevice:v6];
        long long v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)hostedExternalDeviceVolumeDidChange:(float)a3 forOutputDevice:(id)a4
{
  id v6 = a4;
  id v7 = MRLogCategoryConnections();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543874;
    long long v20 = self;
    __int16 v21 = 2048;
    double v22 = a3;
    __int16 v23 = 2114;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MRDAVHostedExternalDevice] Hosted endpoint %{public}@ volume did change to %f for outputDevice %{public}@", buf, 0x20u);
  }

  id v8 = [(MRDAVHostedExternalDevice *)self _mutableExternalDeviceClientsWithRegisteredNotification:2];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v15;
    do
    {
      long long v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v8);
        }
        *(float *)&double v10 = a3;
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) hostedExternalDeviceVolumeDidChange:v6 forOutputDevice:v10];
        long long v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)hostedExternalDeviceIsMutedDidChange:(BOOL)a3 forOutputDevice:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = MRLogCategoryConnections();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543874;
    id v19 = self;
    __int16 v20 = 1024;
    BOOL v21 = v4;
    __int16 v22 = 2114;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MRDAVHostedExternalDevice] Hosted endpoint %{public}@ volume did change to %{BOOL}u for outputDevice %{public}@", buf, 0x1Cu);
  }

  id v8 = [(MRDAVHostedExternalDevice *)self _mutableExternalDeviceClientsWithRegisteredNotification:2];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) hostedExternalDeviceIsMutedDidChange:v4 forOutputDevice:v6];
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)hostedExternalDeviceDidAddOutputDevice:(id)a3
{
  id v4 = a3;
  id v5 = MRLogCategoryConnections();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v4 uid];
    *(_DWORD *)long long buf = 138543618;
    __int16 v18 = self;
    __int16 v19 = 2114;
    __int16 v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MRDAVHostedExternalDevice] Hosted endpoint %{public}@ did add output device %{public}@", buf, 0x16u);
  }
  id v7 = [(MRDAVHostedExternalDevice *)self _mutableExternalDeviceClientsWithRegisteredNotification:4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) hostedExternalDeviceDidAddOutputDevice:v4];
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)hostedExternalDeviceDidChangeOutputDevice:(id)a3
{
  id v4 = a3;
  id v5 = MRLogCategoryConnections();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v4 uid];
    *(_DWORD *)long long buf = 138543618;
    __int16 v18 = self;
    __int16 v19 = 2114;
    __int16 v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MRDAVHostedExternalDevice] Hosted endpoint %{public}@ did change output device %{public}@", buf, 0x16u);
  }
  id v7 = [(MRDAVHostedExternalDevice *)self _mutableExternalDeviceClientsWithRegisteredNotification:4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) hostedExternalDeviceDidChangeOutputDevice:v4];
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)hostedExternalDeviceDidRemoveOutputDevice:(id)a3
{
  id v4 = a3;
  id v5 = MRLogCategoryConnections();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v4 uid];
    *(_DWORD *)long long buf = 138543618;
    __int16 v18 = self;
    __int16 v19 = 2114;
    __int16 v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[MRDAVHostedExternalDevice] Hosted endpoint %{public}@ did remove output device %{public}@", buf, 0x16u);
  }
  id v7 = [(MRDAVHostedExternalDevice *)self _mutableExternalDeviceClientsWithRegisteredNotification:4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) hostedExternalDeviceDidRemoveOutputDevice:v4];
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_externalDeviceClientDidInvalidate:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = MRLogCategoryConnections();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543874;
    id v26 = self;
    __int16 v27 = 2114;
    id v28 = v6;
    __int16 v29 = 2112;
    id v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[MRDAVHostedExternalDevice] Hosted endpoint %{public}@ client did invalidate: %{public}@ with error %@", buf, 0x20u);
  }

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D66C8;
  block[3] = &unk_1004158D8;
  void block[4] = self;
  id v10 = v6;
  id v23 = v10;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  [(MRDAVHostedExternalDevice *)self _reloadHostedExternalDeviceCallbacks];
  [(MRDAVHostedExternalDevice *)self _reloadHostedExternalDeviceNotifications];
  [(MRDAVHostedExternalDevice *)self _reloadHostedExternalDeviceSubscribedPlayerPaths];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v11 = objc_msgSend(v10, "discoveryTokens", 0);
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      long long v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v15);
        long long v17 = [(MRDAVHostedExternalDevice *)self externalDevice];
        [v17 unregisterDiscoveryToken:v16];

        long long v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v13);
  }

  [v10 invalidateWithError:v7];
}

- (id)_externalDeviceClientForConnection:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = sub_1000CF11C;
  uint64_t v16 = sub_1000CF12C;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D67E4;
  block[3] = &unk_100416870;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_allExternalDeviceClients
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000CF11C;
  id v10 = sub_1000CF12C;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000D6A10;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_mutableExternalDeviceClientsWithRegisteredCallbacks:(unint64_t)a3
{
  id v4 = [(MRDAVHostedExternalDevice *)self _connectedExternalDeviceClients];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D6B1C;
  v7[3] = &unk_10041B700;
  v7[4] = a3;
  id v5 = objc_msgSend(v4, "msv_filter:", v7);

  return v5;
}

- (id)_mutableExternalDeviceClientsWithRegisteredNotification:(unint64_t)a3
{
  id v4 = [(MRDAVHostedExternalDevice *)self _connectedExternalDeviceClients];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D6BF4;
  v7[3] = &unk_10041B700;
  v7[4] = a3;
  id v5 = objc_msgSend(v4, "msv_filter:", v7);

  return v5;
}

- (id)_connectedExternalDeviceClients
{
  id v2 = [(MRDAVHostedExternalDevice *)self _allExternalDeviceClients];
  id v3 = objc_msgSend(v2, "msv_filter:", &stru_10041B740);

  return v3;
}

- (id)_connectingExternalDeviceClients
{
  id v2 = [(MRDAVHostedExternalDevice *)self _allExternalDeviceClients];
  id v3 = objc_msgSend(v2, "msv_filter:", &stru_10041B760);

  return v3;
}

- (void)_initializeExternalDevice:(id)a3
{
  id v4 = a3;
  objc_initWeak(location, self);
  [v4 setConnectionRecoveryBehavior:1];
  id v5 = objc_alloc((Class)MRExternalOutputContextDataSource);
  id v6 = objc_alloc((Class)NSString);
  id v7 = [v4 uid];
  uint64_t v8 = [v4 name];
  id v9 = [v6 initWithFormat:@"%@-%@", v7, v8];
  id v10 = (MRExternalOutputContextDataSource *)[v5 initWithUniqueIdentifier:v9];
  externalOutputContext = self->_externalOutputContext;
  self->_externalOutputContext = v10;

  [(MRExternalOutputContextDataSource *)self->_externalOutputContext setNotificationQueue:self->_externalDeviceCallbackQueue];
  [(MRExternalOutputContextDataSource *)self->_externalOutputContext setShouldLog:1];
  [(MRDAVHostedExternalDevice *)self registerForOutputContextNotifications:self->_externalOutputContext];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000D7358;
  v37[3] = &unk_10041B788;
  objc_copyWeak(&v38, location);
  void v37[4] = self;
  [v4 setConnectionStateCallback:v37 withQueue:self->_externalDeviceCallbackQueue];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000D744C;
  v35[3] = &unk_100418710;
  objc_copyWeak(&v36, location);
  [v4 setOutputDevicesUpdatedCallback:v35 withQueue:self->_externalDeviceCallbackQueue];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000D74CC;
  v33[3] = &unk_100418710;
  objc_copyWeak(&v34, location);
  [v4 setOutputDevicesRemovedCallback:v33 withQueue:self->_externalDeviceCallbackQueue];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000D7538;
  v31[3] = &unk_10041B7B0;
  objc_copyWeak(&v32, location);
  [v4 setVolumeChangedCallback:v31 withQueue:self->_externalDeviceCallbackQueue];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000D7630;
  v29[3] = &unk_10041B7D8;
  objc_copyWeak(&v30, location);
  [v4 setVolumeControlCapabilitiesCallback:v29 withQueue:self->_externalDeviceCallbackQueue];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000D7720;
  v27[3] = &unk_10041B800;
  objc_copyWeak(&v28, location);
  [v4 setVolumeMutedChangedCallback:v27 withQueue:self->_externalDeviceCallbackQueue];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000D77BC;
  v25[3] = &unk_10041B828;
  objc_copyWeak(&v26, location);
  [v4 setDeviceInfoChangedCallback:v25 withQueue:self->_externalDeviceCallbackQueue];
  uint64_t v12 = +[NSDate date];
  ErrorWithDescription = (void *)MRMediaRemoteCreateErrorWithDescription();
  [(MRDAVHostedExternalDevice *)self _processCanMigrateToLocalEndpointEvent:@"init" timestamp:v12 error:ErrorWithDescription];

  if (!self->_silentDiscoverySession)
  {
    uint64_t v14 = +[MRAVRoutingDiscoverySessionConfiguration configurationWithEndpointFeatures:1];
    [v14 setPopulatesExternalDevice:0];
    [v14 setAlwaysAllowUpdates:1];
    long long v15 = +[MRAVRoutingDiscoverySession discoverySessionWithConfiguration:v14];
    silentDiscoverySession = self->_silentDiscoverySession;
    self->_silentDiscoverySession = v15;

    id v17 = self->_silentDiscoverySession;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000D7818;
    v23[3] = &unk_100418710;
    objc_copyWeak(&v24, location);
    id v18 = [(MRAVRoutingDiscoverySession *)v17 addOutputDevicesChangedCallback:v23];
    objc_destroyWeak(&v24);
  }
  long long v19 = +[MRExpanseManager sharedManager];
  [v19 addObserver:self];

  [v4 setWantsVolumeNotifications:1];
  [v4 setWantsNowPlayingNotifications:1];
  [v4 setWantsOutputDeviceNotifications:1];
  [v4 setWantsEndpointChangeNotifications:1];
  long long v20 = +[NSNotificationCenter defaultCenter];
  [v20 addObserver:self selector:"_handleMaybeCanMigrateToLocalEndpointDidChange:" name:kMRMediaRemoteOriginSupportedCommandsDidChangeNotification object:0];

  long long v21 = +[NSNotificationCenter defaultCenter];
  [v21 addObserver:self selector:"_handleExternalDeviceConnectionDidChange:" name:kMRExternalDeviceConnectionStateDidChangeNotification object:v4];

  __int16 v22 = +[NSNotificationCenter defaultCenter];
  [v22 addObserver:self selector:"_handleMaybeCanMigrateToLocalEndpointDidChange:" name:kMRDeviceInfoDidChangeNotification object:0];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);
  objc_destroyWeak(location);
}

- (void)registerForOutputContextNotifications:(id)a3
{
  id v4 = a3;
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"outputContextDataSourceOutputDeviceDidChangeVolume:" name:MROutputContextDataSourceOutputDeviceDidChangeVolumeNotification object:v4];
  [v5 addObserver:self selector:"outputContextDataSourceOutputDeviceDidChangeVolumeControlCapabilities:" name:MROutputContextDataSourceOutputDeviceDidChangeVolumeControlCapabilitiesNotification object:v4];
  [v5 addObserver:self selector:"outputContextDataSourceOutputDeviceDidChangeVolumeMuted:" name:MROutputContextDataSourceOutputDeviceDidChangeVolumeMutedNotification object:v4];
  [v5 addObserver:self selector:"outputContextDataSourceDidAddOutputDevice:" name:MROutputContextDataSourceDidAddOutputDeviceNotification object:v4];
  [v5 addObserver:self selector:"outputContextDataSourceDidChangeOutputDevice:" name:MROutputContextDataSourceDidChangeOutputDeviceNotification object:v4];
  [v5 addObserver:self selector:"outputContextDataSourceDidRemoveOutputDevice:" name:MROutputContextDataSourceDidRemoveOutputDeviceNotification object:v4];
}

- (void)_reloadEndpoint
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_1000CF11C;
  id v9 = sub_1000CF12C;
  id v10 = 0;
  serialQueue = self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D7C04;
  v4[3] = &unk_100415CF0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)serialQueue, v4);
  if (v6[5]) {
    -[MRDAVHostedExternalDevice hostedExternalDeviceEndpointDidChange:](self, "hostedExternalDeviceEndpointDidChange:");
  }
  _Block_object_dispose(&v5, 8);
}

- (void)_reloadHostedExternalDeviceCallbacks
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = sub_1000CF11C;
  id v13 = sub_1000CF12C;
  id v14 = 0;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D7DF8;
  block[3] = &unk_100418820;
  void block[4] = self;
  void block[5] = &v9;
  void block[6] = &v15;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v4 = (void *)v10[5];
  if (v16[3])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000D7F14;
    v5[3] = &unk_10041B850;
    objc_copyWeak(&v6, &location);
    [v4 setCustomDataCallback:v5 withQueue:self->_externalDeviceCallbackQueue];
    objc_destroyWeak(&v6);
  }
  else
  {
    [(id)v10[5] setCustomDataCallback:0 withQueue:0];
  }
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
}

- (void)_reloadHostedExternalDeviceNotifications
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = sub_1000CF11C;
  uint64_t v8 = sub_1000CF12C;
  id v9 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D809C;
  block[3] = &unk_100418820;
  void block[4] = self;
  void block[5] = &v4;
  void block[6] = &v10;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  [(id)v5[5] setWantsSystemEndpointNotifications:((unint64_t)v11[3] >> 4) & 1];
  _Block_object_dispose(&v4, 8);

  _Block_object_dispose(&v10, 8);
}

- (void)_reloadHostedExternalDeviceSubscribedPlayerPaths
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_1000CF11C;
  uint64_t v15 = sub_1000CF12C;
  id v16 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D82F8;
  block[3] = &unk_100416730;
  uint64_t v10 = &v11;
  void block[4] = self;
  id v5 = v3;
  id v9 = v5;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  uint64_t v6 = [v5 allObjects];
  subscribedPlayerPaths = self->_subscribedPlayerPaths;
  self->_subscribedPlayerPaths = v6;

  [(id)v12[5] setSubscribedPlayerPaths:self->_subscribedPlayerPaths];
  _Block_object_dispose(&v11, 8);
}

- (void)_maybePostVolumeControlCapabilitiesDidChange:(unsigned int)a3 outputDevice:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = sub_1000CF11C;
  uint64_t v13 = sub_1000CF12C;
  id v14 = 0;
  serialQueue = self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000D854C;
  v8[3] = &unk_100415CF0;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync((dispatch_queue_t)serialQueue, v8);
  if ([(MRDAVHostedExternalDevice *)self _endpointShouldPostVolumeNotifications:v10[5] outputDevice:v6])
  {
    [(MRDAVHostedExternalDevice *)self hostedExternalDeviceVolumeCapabilitiesDidChange:v4 forOutputDevice:v6];
  }
  _Block_object_dispose(&v9, 8);
}

- (void)_maybePostVolumeDidChange:(float)a3 outputDevice:(id)a4
{
  id v6 = a4;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_1000CF11C;
  id v14 = sub_1000CF12C;
  id v15 = 0;
  serialQueue = self->_serialQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000D8684;
  v9[3] = &unk_100415CF0;
  v9[4] = self;
  void v9[5] = &v10;
  dispatch_sync((dispatch_queue_t)serialQueue, v9);
  if ([(MRDAVHostedExternalDevice *)self _endpointShouldPostVolumeNotifications:v11[5] outputDevice:v6])
  {
    *(float *)&double v8 = a3;
    [(MRDAVHostedExternalDevice *)self hostedExternalDeviceVolumeDidChange:v6 forOutputDevice:v8];
  }
  _Block_object_dispose(&v10, 8);
}

- (void)_maybePostVolumeIsMutedDidChange:(BOOL)a3 outputDevice:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = sub_1000CF11C;
  uint64_t v13 = sub_1000CF12C;
  id v14 = 0;
  serialQueue = self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000D87BC;
  v8[3] = &unk_100415CF0;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync((dispatch_queue_t)serialQueue, v8);
  if ([(MRDAVHostedExternalDevice *)self _endpointShouldPostVolumeNotifications:v10[5] outputDevice:v6])
  {
    [(MRDAVHostedExternalDevice *)self hostedExternalDeviceIsMutedDidChange:v4 forOutputDevice:v6];
  }
  _Block_object_dispose(&v9, 8);
}

- (void)_maybePostEndpointDidAddOutputDevice:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_1000CF11C;
  uint64_t v11 = sub_1000CF12C;
  id v12 = 0;
  serialQueue = self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D88E0;
  v6[3] = &unk_100415CF0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync((dispatch_queue_t)serialQueue, v6);
  if ([(MRDAVHostedExternalDevice *)self _endpointShouldNotifyClientsOfTopologyChanges:v8[5]])
  {
    [(MRDAVHostedExternalDevice *)self hostedExternalDeviceDidAddOutputDevice:v4];
  }
  _Block_object_dispose(&v7, 8);
}

- (void)_maybePostEndpointDidChangeOutputDevice:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_1000CF11C;
  uint64_t v11 = sub_1000CF12C;
  id v12 = 0;
  serialQueue = self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D8A04;
  v6[3] = &unk_100415CF0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync((dispatch_queue_t)serialQueue, v6);
  if ([(MRDAVHostedExternalDevice *)self _endpointShouldNotifyClientsOfTopologyChanges:v8[5]])
  {
    [(MRDAVHostedExternalDevice *)self hostedExternalDeviceDidChangeOutputDevice:v4];
  }
  _Block_object_dispose(&v7, 8);
}

- (void)_maybePostEndpointDidRemoveOutputDevice:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_1000CF11C;
  uint64_t v11 = sub_1000CF12C;
  id v12 = 0;
  serialQueue = self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D8B28;
  v6[3] = &unk_100415CF0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync((dispatch_queue_t)serialQueue, v6);
  if ([(MRDAVHostedExternalDevice *)self _endpointShouldNotifyClientsOfTopologyChanges:v8[5]])
  {
    [(MRDAVHostedExternalDevice *)self hostedExternalDeviceDidRemoveOutputDevice:v4];
  }
  _Block_object_dispose(&v7, 8);
}

- (void)_onSerialQueue_reevaluateVolumeControlCapabilitiesForEndpoint:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([v4 connectionType] == (id)1
    || ![(MRDAVHostedExternalDevice *)self _onSerialQueue_isEndpointsDesignatedGroupLeader:v4])
  {
    goto LABEL_22;
  }
  id v5 = [(MRAVDistantEndpoint *)self->_endpoint designatedGroupLeader];
  unsigned int v6 = [v5 groupContainsGroupLeader];
  uint64_t v7 = [v4 designatedGroupLeader];
  unsigned int v8 = [v7 groupContainsGroupLeader];

  if (v6 == v8)
  {
    id v14 = [(MRAVDistantEndpoint *)self->_endpoint designatedGroupLeader];
    id v15 = [v14 uid];
    id v16 = [v4 designatedGroupLeader];
    uint64_t v17 = [v16 uid];
    unsigned __int8 v18 = [v15 isEqualToString:v17];

    if (v18)
    {
      id v19 = objc_alloc((Class)NSOrderedSet);
      long long v20 = [(MRAVDistantEndpoint *)self->_endpoint outputDeviceUIDs];
      id v21 = [v19 initWithArray:v20];
      id v22 = objc_alloc((Class)NSOrderedSet);
      id v23 = [v4 outputDeviceUIDs];
      id v24 = [v22 initWithArray:v23];
      unsigned __int8 v25 = [v21 isEqualToOrderedSet:v24];

      if (v25) {
        goto LABEL_22;
      }
      uint64_t v9 = MRLogCategoryConnections();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_19;
      }
      uint64_t v10 = [(MRAVDistantEndpoint *)self->_endpoint outputDeviceUIDs];
      id v12 = [v4 outputDeviceUIDs];
      *(_DWORD *)long long buf = 138544130;
      id v34 = self;
      __int16 v35 = 2114;
      CFStringRef v36 = @"topology";
      __int16 v37 = 2114;
      CFStringRef v38 = v10;
      __int16 v39 = 2114;
      CFStringRef v40 = v12;
      goto LABEL_18;
    }
    uint64_t v9 = MRLogCategoryConnections();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = [(MRAVDistantEndpoint *)self->_endpoint designatedGroupLeader];
      id v12 = [v4 designatedGroupLeader];
      *(_DWORD *)long long buf = 138544130;
      id v34 = self;
      __int16 v35 = 2114;
      CFStringRef v36 = @"groupLeader";
      __int16 v37 = 2114;
      CFStringRef v38 = v10;
      __int16 v39 = 2114;
      CFStringRef v40 = v12;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MRDAVHostedExternalDevice] Hosted endpoint <%{public}@> reevaluating volume control because %{public}@ changed from <%{public}@> to <%{public}@>", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v9 = MRLogCategoryConnections();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = [(MRAVDistantEndpoint *)self->_endpoint designatedGroupLeader];
      if ([(__CFString *)v10 groupContainsGroupLeader]) {
        CFStringRef v11 = @"YES";
      }
      else {
        CFStringRef v11 = @"NO";
      }
      id v12 = [v4 designatedGroupLeader];
      *(_DWORD *)long long buf = 138544130;
      if ([(__CFString *)v12 groupContainsGroupLeader]) {
        CFStringRef v13 = @"YES";
      }
      else {
        CFStringRef v13 = @"NO";
      }
      id v34 = self;
      __int16 v35 = 2114;
      CFStringRef v36 = @"groupContainsGroupLeader";
      __int16 v37 = 2114;
      CFStringRef v38 = v11;
      __int16 v39 = 2114;
      CFStringRef v40 = v13;
      goto LABEL_18;
    }
  }
LABEL_19:

  [(MRExternalOutputContextDataSource *)self->_externalOutputContext volume];
  int v27 = v26;
  unsigned int v28 = [(MRDAVHostedExternalDevice *)self _endpointSupportsVolumeControl:v4];
  if (v28) {
    unsigned int v28 = [(MRExternalOutputContextDataSource *)self->_externalOutputContext volumeControlCapabilities];
  }
  externalDeviceCallbackQueue = self->_externalDeviceCallbackQueue;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000D8F48;
  v30[3] = &unk_1004165E8;
  void v30[4] = self;
  unsigned int v31 = v28;
  int v32 = v27;
  dispatch_async((dispatch_queue_t)externalDeviceCallbackQueue, v30);
LABEL_22:
}

- (BOOL)_endpointShouldPostVolumeNotifications:(id)a3 outputDevice:(id)a4
{
  id v5 = a3;
  if ([v5 connectionType] == (id)1) {
    goto LABEL_2;
  }
  if ([v5 connectionType] == (id)6 || objc_msgSend(v5, "connectionType") == (id)5)
  {
LABEL_5:
    BOOL v6 = 1;
    goto LABEL_6;
  }
  unsigned int v8 = [v5 designatedGroupLeader];
  if ([v8 groupContainsGroupLeader])
  {
    unsigned __int8 v9 = [(MRDAVHostedExternalDevice *)self _onSerialQueue_isEndpointsDesignatedGroupLeader:v5];

    if (v9) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  if ([(MRDAVHostedExternalDevice *)self _endpointIsSolo:v5]
    && [(MRDAVHostedExternalDevice *)self _onSerialQueue_isEndpointsDesignatedGroupLeader:v5])
  {
    goto LABEL_5;
  }
LABEL_2:
  BOOL v6 = 0;
LABEL_6:

  return v6;
}

- (BOOL)_endpointShouldNotifyClientsOfTopologyChanges:(id)a3
{
  return [a3 connectionType] != (id)1;
}

- (BOOL)_endpointSupportsVolumeControl:(id)a3
{
  id v4 = a3;
  if ([v4 connectionType] == (id)3)
  {
    BOOL v5 = 1;
  }
  else
  {
    BOOL v6 = [v4 designatedGroupLeader];
    if ([v6 groupContainsGroupLeader])
    {
      BOOL v5 = 1;
    }
    else if ([(MRDAVHostedExternalDevice *)self _endpointIsSolo:v4])
    {
      BOOL v5 = [(MRDAVHostedExternalDevice *)self _onSerialQueue_isEndpointsDesignatedGroupLeader:v4];
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  return v5;
}

- (BOOL)_endpointIsSolo:(id)a3
{
  return [a3 logicalOutputDeviceCount] == (id)1;
}

- (BOOL)_onSerialQueue_isEndpointsDesignatedGroupLeader:(id)a3
{
  id v4 = [a3 designatedGroupLeader];
  BOOL v5 = [(MRExternalDevice *)self->_externalDevice uid];
  unsigned __int8 v6 = [v4 containsUID:v5];

  return v6;
}

- (NSArray)subscribedPlayerPaths
{
  return self->_subscribedPlayerPaths;
}

- (MRAVDistantEndpoint)endpoint
{
  return self->_endpoint;
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)externalDeviceCallbackQueue
{
  return self->_externalDeviceCallbackQueue;
}

- (void)setExternalDeviceCallbackQueue:(id)a3
{
}

- (NSMutableSet)mutableExternalDeviceClients
{
  return self->_mutableExternalDeviceClients;
}

- (void)setMutableExternalDeviceClients:(id)a3
{
}

- (MRExternalOutputContextDataSource)externalOutputContext
{
  return self->_externalOutputContext;
}

- (BOOL)useOutputDeviceCache
{
  return self->_useOutputDeviceCache;
}

- (void)setUseOutputDeviceCache:(BOOL)a3
{
  self->_useOutputDeviceCache = a3;
}

- (BOOL)tombstoned
{
  return self->_tombstoned;
}

- (void)setTombstoned:(BOOL)a3
{
  self->_tombstoned = a3;
}

- (MRAVRoutingDiscoverySession)silentDiscoverySession
{
  return self->_silentDiscoverySession;
}

- (void)setSilentDiscoverySession:(id)a3
{
}

- (NSError)canMigrateToLocalEndpointError
{
  return self->_canMigrateToLocalEndpointError;
}

- (void)setCanMigrateToLocalEndpointError:(id)a3
{
}

- (MRDConnectionLifetimeController)lifetimeController
{
  return self->_lifetimeController;
}

- (void)setLifetimeController:(id)a3
{
}

- (NSDate)canMigrateEvaluationTimestamp
{
  return self->_canMigrateEvaluationTimestamp;
}

- (void)setCanMigrateEvaluationTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canMigrateEvaluationTimestamp, 0);
  objc_storeStrong((id *)&self->_lifetimeController, 0);
  objc_storeStrong((id *)&self->_canMigrateToLocalEndpointError, 0);
  objc_storeStrong((id *)&self->_silentDiscoverySession, 0);
  objc_storeStrong((id *)&self->_externalOutputContext, 0);
  objc_storeStrong((id *)&self->_mutableExternalDeviceClients, 0);
  objc_storeStrong((id *)&self->_externalDeviceCallbackQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_externalDevice, 0);

  objc_storeStrong((id *)&self->_subscribedPlayerPaths, 0);
}

@end