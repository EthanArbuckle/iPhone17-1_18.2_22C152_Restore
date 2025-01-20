@interface MRDRemoteControlDiscoverySession
- (BOOL)_shouldCreateClusterOutputDevices;
- (BOOL)devicePresenceDetected;
- (BOOL)shouldUseDeviceInfoForLocalDevice;
- (MRAVConcreteRoutingDiscoverySession)avDiscoverySession;
- (MRAVOutputDevice)nativeOutputDevice;
- (MRAVRoutingDiscoverySession)companionDiscoverySession;
- (MRAVRoutingDiscoverySession)externalDiscoverySession;
- (MRAVRoutingDiscoverySessionConfiguration)configuration;
- (MRAirPlayTransportConnection)localEndpointConnection;
- (MRCompanionConnectionController)companionController;
- (MRDIDSDiscoverySession)idsDiscoverySession;
- (MRDRemoteControlDiscoverySession)init;
- (MRDeviceInfo)deviceInfo;
- (MRExternalDeviceTransportConnectionHandle)undiscoverableGroupLeaderHandle;
- (NSArray)allowList;
- (NSArray)availableOutputDevices;
- (NSArray)denyList;
- (NSArray)unclusteredOutputDevices;
- (NSSet)lastReportedClientIdentifiers;
- (NSString)debugDescription;
- (NSUserDefaults)userDefaults;
- (OS_dispatch_queue)workerQueue;
- (_TtC12mediaremoted31MRDGroupSessionDiscoverySession)groupSessionDiscoverySession;
- (id)_addUndiscoverableGroupLeaderFromDeviceInfo:(id)a3;
- (id)_addUndiscoveredOutputContextOutputDevices:(id)a3;
- (id)_applyDeviceInfoValuesToOutputDevices:(id)a3 withDeviceInfo:(id)a4;
- (id)_applyLocalReservedOutputContextValuesToOutputDevices:(id)a3;
- (id)_applyLocallySourcedValuesToOutputDevices:(id)a3;
- (id)_applyOutputContextValuesToOutputDevices:(id)a3;
- (id)_calculateUndiscoverableGroupLeaderFromDeviceInfo:(id)a3;
- (id)_clusterOutputDevicesFromUnclusteredDevices:(id)a3;
- (id)_fetchAvailableOutputDevicesFromDiscoverySessions;
- (id)availableEndpoints;
- (id)routingContextUID;
- (unsigned)discoveryMode;
- (unsigned)endpointFeatures;
- (void)_initializeDiscoverySessions;
- (void)_loadDefaults;
- (void)_loadLocalEndpointConnection;
- (void)_logChangesInModifyingOutputDevice:(id)a3 toOutputDevice:(id)a4 reason:(id)a5;
- (void)_mergeDeviceInfo:(id)a3 intoProtobuf:(id)a4;
- (void)_mergeOutputDevice:(id)a3 intoProtobuf:(id)a4;
- (void)_reloadOutputDevices;
- (void)_scheduleAvailableOutputDevicesReload;
- (void)_setupProxiedDiscoveryWithDestinationEndpoint:(id)a3;
- (void)_setupStandaloneDiscovery;
- (void)controller:(id)a3 didDiscoverCompanion:(id)a4;
- (void)controllerDidUndiscoverCompanion:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerConnectionFailureForWHAIdentifier:(id)a3;
- (void)setAvDiscoverySession:(id)a3;
- (void)setAvailableOutputDevices:(id)a3;
- (void)setCompanionController:(id)a3;
- (void)setCompanionDiscoverySession:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setDiscoveryMode:(unsigned int)a3;
- (void)setDiscoveryMode:(unsigned int)a3 forClientIdentifiers:(id)a4;
- (void)setExternalDiscoverySession:(id)a3;
- (void)setGroupSessionDiscoverySession:(id)a3;
- (void)setIdsDiscoverySession:(id)a3;
- (void)setLocalEndpointConnection:(id)a3;
- (void)setNativeOutputDevice:(id)a3;
- (void)setRoutingContextUID:(id)a3;
- (void)setUnclusteredOutputDevices:(id)a3;
- (void)setUndiscoverableGroupLeaderHandle:(id)a3;
- (void)setWorkerQueue:(id)a3;
- (void)transport:(id)a3 didReceiveData:(id)a4;
- (void)transportDidClose:(id)a3 error:(id)a4;
- (void)unregisterConnectionFailureForWHAIdentifier:(id)a3;
@end

@implementation MRDRemoteControlDiscoverySession

- (MRDRemoteControlDiscoverySession)init
{
  v3 = [(MRDRemoteControlDiscoverySession *)self configuration];
  v35.receiver = self;
  v35.super_class = (Class)MRDRemoteControlDiscoverySession;
  v4 = [(MRDRemoteControlDiscoverySession *)&v35 initWithConfiguration:v3];
  v5 = v4;
  if (v4)
  {
    [(MRDRemoteControlDiscoverySession *)v4 setAlwaysLogUpdates:1];
    id v6 = [objc_alloc((Class)NSString) initWithFormat:@"com.apple.mediaremote.%@", objc_opt_class()];
    v7 = (const char *)[v6 UTF8String];
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create(v7, v8);
    workerQueue = v5->_workerQueue;
    v5->_workerQueue = (OS_dispatch_queue *)v9;

    v11 = +[MRUserSettings currentSettings];
    LODWORD(v8) = [v11 shouldConnectToLocalEndpoint];

    if (v8)
    {
      v12 = v5->_workerQueue;
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1000694C0;
      v33[3] = &unk_100415CC8;
      v34 = v5;
      sub_10016A738(v12, v33);
    }
    objc_initWeak(&location, v5);
    v13 = +[NSNotificationCenter defaultCenter];
    uint64_t v14 = kMRDeviceInfoDidChangeNotification;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000694C8;
    v30[3] = &unk_100418620;
    objc_copyWeak(&v31, &location);
    id v15 = [v13 addObserverForName:v14 object:0 queue:0 usingBlock:v30];

    v16 = +[NSNotificationCenter defaultCenter];
    uint64_t v17 = kMRAVOutputContextDevicesDidChangeNotification;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100069544;
    v28[3] = &unk_100418620;
    objc_copyWeak(&v29, &location);
    id v18 = [v16 addObserverForName:v17 object:0 queue:0 usingBlock:v28];

    v19 = +[NSNotificationCenter defaultCenter];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100069584;
    v26[3] = &unk_100418620;
    objc_copyWeak(&v27, &location);
    id v20 = [v19 addObserverForName:@"MRDNowPlayingAirplaySessionStarted" object:0 queue:0 usingBlock:v26];

    v21 = +[MRDMRRelayConnectionManager sharedManager];
    [v21 addObserver:v5];

    v22 = v5->_workerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000695C4;
    block[3] = &unk_100415CC8;
    v25 = v5;
    dispatch_async(v22, block);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (NSString)debugDescription
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"<%@ %p {\n", objc_opt_class(), self];
  v4 = self;
  objc_sync_enter(v4);
  [v3 appendFormat:@"  localEndpointConnection=%@\n", v4->_localEndpointConnection];
  v5 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription();
  [v3 appendFormat:@"  discoveryMode=%@\n", v5];

  [v3 appendFormat:@"  lastReportedClientIdentifiers=%@\n", v4->_lastReportedClientIdentifiers];
  [v3 appendFormat:@"  routingContextID=%@\n", v4->_routingContextID];
  objc_sync_exit(v4);

  workerQueue = v4->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000698E0;
  block[3] = &unk_1004158D8;
  void block[4] = v4;
  id v7 = v3;
  id v16 = v7;
  dispatch_sync(workerQueue, block);
  v8 = v4;
  objc_sync_enter(v8);
  dispatch_queue_t v9 = objc_msgSend(v8[4], "mr_formattedDebugDescription");
  [v7 appendFormat:@"  nativeOutputDevice = %@\n", v9];

  v10 = objc_msgSend(v8[3], "mr_formattedDebugDescription");
  [v7 appendFormat:@"  unclusteredOutputDevices = %@\n", v10];

  v11 = objc_msgSend(v8[2], "mr_formattedDebugDescription");
  [v7 appendFormat:@"  availableOutputDevices = %@\n", v11];

  [v7 appendString:@"}>"];
  objc_sync_exit(v8);

  v12 = v16;
  id v13 = v7;

  return (NSString *)v13;
}

- (MRAVRoutingDiscoverySessionConfiguration)configuration
{
  v2 = +[MRAVRoutingDiscoverySessionConfiguration configurationWithEndpointFeatures:8];
  [v2 setAlwaysAllowUpdates:1];
  id v3 = +[MRAVOutputContext sharedAudioPresentationContext];
  v4 = [v3 uniqueIdentifier];
  [v2 setRoutingContextUID:v4];

  [v2 setPopulatesExternalDevice:0];

  return (MRAVRoutingDiscoverySessionConfiguration *)v2;
}

- (MRAirPlayTransportConnection)localEndpointConnection
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_localEndpointConnection;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLocalEndpointConnection:(id)a3
{
  id v5 = a3;
  if ([v5 isValid])
  {
    id v6 = self;
    objc_sync_enter(v6);
    p_localEndpointConnection = (id *)&v6->_localEndpointConnection;
    if (v6->_localEndpointConnection)
    {
      v8 = _MRLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = objc_opt_class();
        id v10 = *p_localEndpointConnection;
        *(_DWORD *)buf = 138544130;
        uint64_t v18 = v9;
        __int16 v19 = 2114;
        CFStringRef v20 = @"localEndpointConnection";
        __int16 v21 = 2112;
        id v22 = v10;
        __int16 v23 = 2112;
        id v24 = v5;
        v11 = "Set: %{public}@ setting %{public}@ from <%@> to <%@>";
        v12 = v8;
        uint32_t v13 = 42;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
    else
    {
      v8 = _MRLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v18 = objc_opt_class();
        __int16 v19 = 2114;
        CFStringRef v20 = @"localEndpointConnection";
        __int16 v21 = 2112;
        id v22 = v5;
        v11 = "Set: %{public}@ setting %{public}@ to <%@>";
        v12 = v8;
        uint32_t v13 = 32;
        goto LABEL_8;
      }
    }

    objc_storeStrong((id *)&v6->_localEndpointConnection, a3);
    [*p_localEndpointConnection addObserver:v6];
    objc_sync_exit(v6);

    [(MRDRemoteControlDiscoverySession *)v6 _scheduleAvailableOutputDevicesReload];
    goto LABEL_10;
  }
  dispatch_time_t v14 = dispatch_time(0, 5000000000);
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100069E30;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_after(v14, (dispatch_queue_t)workerQueue, block);
LABEL_10:
}

- (void)setUndiscoverableGroupLeaderHandle:(id)a3
{
  v4 = (MRExternalDeviceTransportConnectionHandle *)a3;
  undiscoverableGroupLeaderHandle = self->_undiscoverableGroupLeaderHandle;
  id v6 = _MRLogForCategory();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (undiscoverableGroupLeaderHandle)
  {
    if (v7)
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = self->_undiscoverableGroupLeaderHandle;
      int v14 = 138544130;
      uint64_t v15 = v8;
      __int16 v16 = 2114;
      CFStringRef v17 = @"undiscoverableGroupLeader";
      __int16 v18 = 2112;
      __int16 v19 = v9;
      __int16 v20 = 2112;
      __int16 v21 = v4;
      id v10 = "Set: %{public}@ setting %{public}@ from <%@> to <%@>";
      v11 = v6;
      uint32_t v12 = 42;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
    }
  }
  else if (v7)
  {
    int v14 = 138543874;
    uint64_t v15 = objc_opt_class();
    __int16 v16 = 2114;
    CFStringRef v17 = @"undiscoverableGroupLeader";
    __int16 v18 = 2112;
    __int16 v19 = v4;
    id v10 = "Set: %{public}@ setting %{public}@ to <%@>";
    v11 = v6;
    uint32_t v12 = 32;
    goto LABEL_6;
  }

  uint32_t v13 = self->_undiscoverableGroupLeaderHandle;
  self->_undiscoverableGroupLeaderHandle = v4;
}

- (void)setDiscoveryMode:(unsigned int)a3 forClientIdentifiers:(id)a4
{
  id v7 = a4;
  if (a3 == 3)
  {
    uint64_t v8 = +[MRSharedSettings currentSettings];
    unsigned int v9 = [v8 supportNanoStandalone];

    if (v9) {
      a3 = 3;
    }
    else {
      a3 = 2;
    }
  }
  id v10 = self;
  objc_sync_enter(v10);
  unsigned int discoveryMode = v10->_discoveryMode;
  unsigned int v12 = [v7 isEqualToSet:v10->_lastReportedClientIdentifiers];
  v10->_unsigned int discoveryMode = a3;
  objc_storeStrong((id *)&v10->_lastReportedClientIdentifiers, a4);
  objc_sync_exit(v10);

  if (discoveryMode != a3 || v12 != 1)
  {
    workerQueue = v10->_workerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006A12C;
    block[3] = &unk_100418648;
    BOOL v18 = discoveryMode != a3;
    void block[4] = v10;
    unsigned int v17 = a3;
    id v16 = v7;
    dispatch_async(workerQueue, block);
  }
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = +[NSSet set];
  [(MRDRemoteControlDiscoverySession *)self setDiscoveryMode:v3 forClientIdentifiers:v5];
}

- (unsigned)discoveryMode
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int discoveryMode = v2->_discoveryMode;
  objc_sync_exit(v2);

  return discoveryMode;
}

- (unsigned)endpointFeatures
{
  return 8;
}

- (BOOL)devicePresenceDetected
{
  v2 = [(MRDRemoteControlDiscoverySession *)self availableOutputDevices];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)availableEndpoints
{
  return &__NSArray0__struct;
}

- (void)setAvailableOutputDevices:(id)a3
{
  v4 = (NSArray *)a3;
  obj = self;
  objc_sync_enter(obj);
  availableOutputDevices = obj->_availableOutputDevices;
  obj->_availableOutputDevices = v4;

  objc_sync_exit(obj);
}

- (NSArray)availableOutputDevices
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSArray *)v2->_availableOutputDevices copy];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)setUnclusteredOutputDevices:(id)a3
{
  v4 = (NSArray *)a3;
  obj = self;
  objc_sync_enter(obj);
  unclusteredOutputDevices = obj->_unclusteredOutputDevices;
  obj->_unclusteredOutputDevices = v4;

  objc_sync_exit(obj);
}

- (NSArray)unclusteredOutputDevices
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSArray *)v2->_unclusteredOutputDevices copy];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)setNativeOutputDevice:(id)a3
{
  v4 = (MRAVOutputDevice *)a3;
  obj = self;
  objc_sync_enter(obj);
  nativeOutputDevice = obj->_nativeOutputDevice;
  obj->_nativeOutputDevice = v4;

  objc_sync_exit(obj);
}

- (MRAVOutputDevice)nativeOutputDevice
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_nativeOutputDevice;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRoutingContextUID:(id)a3
{
  v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  routingContextID = obj->_routingContextID;
  obj->_routingContextID = v4;

  objc_sync_exit(obj);
}

- (id)routingContextUID
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_routingContextID;
  objc_sync_exit(v2);

  return v3;
}

- (MRDeviceInfo)deviceInfo
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(MRDeviceInfo *)v2->_deviceInfo copy];
  objc_sync_exit(v2);

  return (MRDeviceInfo *)v3;
}

- (void)setDeviceInfo:(id)a3
{
  v4 = (MRDeviceInfo *)a3;
  obj = self;
  objc_sync_enter(obj);
  deviceInfo = obj->_deviceInfo;
  obj->_deviceInfo = v4;

  objc_sync_exit(obj);
}

- (NSSet)lastReportedClientIdentifiers
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_lastReportedClientIdentifiers;
  objc_sync_exit(v2);

  return v3;
}

- (void)registerConnectionFailureForWHAIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    workerQueue = self->_workerQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10006AAA4;
    v7[3] = &unk_1004158D8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)workerQueue, v7);
  }
}

- (void)unregisterConnectionFailureForWHAIdentifier:(id)a3
{
  id v4 = a3;
  workerQueue = self->_workerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006ABB8;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workerQueue, v7);
}

- (void)transport:(id)a3 didReceiveData:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  [(MRDRemoteControlDiscoverySession *)v7 localEndpointConnection];

  objc_sync_exit(v7);
}

- (void)transportDidClose:(id)a3 error:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = [(MRDRemoteControlDiscoverySession *)v7 localEndpointConnection];

  if (v8 == v14)
  {
    uint32_t v13 = [(MRDRemoteControlDiscoverySession *)v7 localEndpointConnection];
    [v13 removeObserver:v7];

    [(MRDRemoteControlDiscoverySession *)v7 setLocalEndpointConnection:0];
  }
  else
  {
    unsigned int v9 = [(MRDRemoteControlDiscoverySession *)v7 undiscoverableGroupLeaderHandle];
    id v10 = [v9 connection];

    if (v10 == v14)
    {
      v11 = [(MRDRemoteControlDiscoverySession *)v7 undiscoverableGroupLeaderHandle];
      unsigned int v12 = [v11 connection];
      [v12 removeObserver:v7];

      [(MRDRemoteControlDiscoverySession *)v7 _scheduleAvailableOutputDevicesReload];
    }
  }
  objc_sync_exit(v7);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_100476040 == a6 || off_100476048 == a6)
  {
    workerQueue = self->_workerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006AE84;
    block[3] = &unk_100415CC8;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)workerQueue, block);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MRDRemoteControlDiscoverySession;
    -[MRDRemoteControlDiscoverySession observeValueForKeyPath:ofObject:change:context:](&v8, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)controller:(id)a3 didDiscoverCompanion:(id)a4
{
  id v5 = a4;
  workerQueue = self->_workerQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006AF60;
  v8[3] = &unk_1004158D8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)workerQueue, v8);
}

- (void)controllerDidUndiscoverCompanion:(id)a3
{
  workerQueue = self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006AFE8;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)workerQueue, block);
}

- (void)_scheduleAvailableOutputDevicesReload
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_scheduledAvailableOutputDevicesReload)
  {
    v2->_scheduledAvailableOutputDevicesReload = 1;
    workerQueue = v2->_workerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006B0A0;
    block[3] = &unk_100415CC8;
    void block[4] = v2;
    dispatch_async(workerQueue, block);
  }
  objc_sync_exit(v2);
}

- (void)_reloadOutputDevices
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v3 = +[MRUserSettings currentSettings];
  if ([v3 shouldConnectToLocalEndpoint])
  {
    id v4 = [(MRDRemoteControlDiscoverySession *)self localEndpointConnection];

    if (!v4) {
      return;
    }
  }
  else
  {
  }
  id v5 = +[MRDMediaRemoteServer server];
  id v6 = [v5 nowPlayingServer];
  id v7 = [v6 localOriginClient];
  objc_super v8 = [v7 deviceInfoDataSource];
  id v9 = [v8 deviceInfo];
  [(MRDRemoteControlDiscoverySession *)self setDeviceInfo:v9];

  id v10 = [(MRDRemoteControlDiscoverySession *)self _fetchAvailableOutputDevicesFromDiscoverySessions];
  if ([(NSArray *)self->_allowList count])
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10006B3C8;
    v22[3] = &unk_100417940;
    v22[4] = self;
    uint64_t v11 = objc_msgSend(v10, "msv_filter:", v22);

    id v10 = (void *)v11;
  }
  if ([(NSArray *)self->_denyList count])
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10006B41C;
    v21[3] = &unk_100417940;
    v21[4] = self;
    uint64_t v12 = objc_msgSend(v10, "msv_filter:", v21);

    id v10 = (void *)v12;
  }
  [(MRDRemoteControlDiscoverySession *)self setUnclusteredOutputDevices:v10];
  uint32_t v13 = [(MRDRemoteControlDiscoverySession *)self deviceInfo];
  id v14 = [v13 deviceUID];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10006B470;
  v19[3] = &unk_100417940;
  id v20 = v14;
  id v15 = v14;
  id v16 = objc_msgSend(v10, "msv_firstWhere:", v19);
  [(MRDRemoteControlDiscoverySession *)self setNativeOutputDevice:v16];

  unsigned int v17 = [(MRDRemoteControlDiscoverySession *)self _clusterOutputDevicesFromUnclusteredDevices:v10];
  [(MRDRemoteControlDiscoverySession *)self setAvailableOutputDevices:v17];

  BOOL v18 = [(MRDRemoteControlDiscoverySession *)self availableOutputDevices];
  [(MRDRemoteControlDiscoverySession *)self notifyOutputDevicesChanged:v18];
}

- (id)_clusterOutputDevicesFromUnclusteredDevices:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint32_t v13 = [v12 clusterID];
        if (v13
          && [(MRDRemoteControlDiscoverySession *)self _shouldCreateClusterOutputDevices])
        {
          id v14 = [v6 objectForKeyedSubscript:v13];

          if (!v14)
          {
            id v15 = objc_alloc_init((Class)NSMutableArray);
            [v6 setObject:v15 forKeyedSubscript:v13];
          }
          id v16 = [v6 objectForKeyedSubscript:v13];
          [v16 addObject:v12];
        }
        else
        {
          [v5 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10006B6E8;
  v19[3] = &unk_100418670;
  id v17 = v5;
  id v20 = v17;
  [v6 enumerateKeysAndObjectsUsingBlock:v19];

  return v17;
}

- (id)_fetchAvailableOutputDevicesFromDiscoverySessions
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  if ([(MRDRemoteControlDiscoverySession *)self shouldUseDeviceInfoForLocalDevice])
  {
    id v4 = objc_alloc((Class)MRDeviceInfoOutputDevice);
    id v5 = [(MRDRemoteControlDiscoverySession *)self deviceInfo];
    id v6 = [v4 initWithDeviceInfo:v5];

    [v3 addObject:v6];
  }
  id v7 = objc_alloc_init((Class)NSMutableSet);
  id v8 = [(MRAVConcreteRoutingDiscoverySession *)self->_avDiscoverySession availableOutputDevices];
  id v9 = [v8 copy];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v9;
  id v10 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v41;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v41 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v15 = [v14 clusterID];
        id v16 = v15;
        if (v15)
        {
          id v17 = v15;
        }
        else
        {
          id v17 = [v14 uid];
        }
        BOOL v18 = v17;

        if (([(NSMutableSet *)self->_connectionFailedWHAIdentifiers containsObject:v18] & 1) == 0)
        {
          [v3 addObject:v14];
          if (v18) {
            [v7 addObject:v18];
          }
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v11);
  }

  __int16 v19 = [(MRDGroupSessionDiscoverySession *)self->_groupSessionDiscoverySession availableOutputDevices];
  id v20 = [v19 copy];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v21 = v20;
  id v22 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v37;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v37 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v36 + 1) + 8 * (void)j);
        id v27 = [v26 uid];
        unsigned __int8 v28 = [v7 containsObject:v27];

        if ((v28 & 1) == 0) {
          [v3 addObject:v26];
        }
      }
      id v23 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v23);
  }

  id v29 = [(MRDIDSDiscoverySession *)self->_idsDiscoverySession availableOutputDevices];
  [v3 addObjectsFromArray:v29];

  v30 = [(MRAVRoutingDiscoverySession *)self->_companionDiscoverySession availableOutputDevices];
  [v3 addObjectsFromArray:v30];

  id v31 = [(MRAVRoutingDiscoverySession *)self->_externalDiscoverySession availableOutputDevices];
  [v3 addObjectsFromArray:v31];

  v32 = [v3 allObjects];
  v33 = [(MRDRemoteControlDiscoverySession *)self _applyLocallySourcedValuesToOutputDevices:v32];

  return v33;
}

- (id)_applyLocallySourcedValuesToOutputDevices:(id)a3
{
  id v4 = [(MRDRemoteControlDiscoverySession *)self _applyOutputContextValuesToOutputDevices:a3];
  id v5 = [(MRDRemoteControlDiscoverySession *)self deviceInfo];
  id v6 = [(MRDRemoteControlDiscoverySession *)self _applyDeviceInfoValuesToOutputDevices:v4 withDeviceInfo:v5];

  id v7 = +[MRUserSettings currentSettings];
  LODWORD(v5) = [v7 supportMultiplayerHost];

  if (v5)
  {
    id v8 = [(MRDRemoteControlDiscoverySession *)self deviceInfo];
    unsigned __int8 v9 = [v8 parentGroupContainsDiscoverableGroupLeader];

    if (v9)
    {
      [(MRDRemoteControlDiscoverySession *)self setRoutingContextUID:0];
    }
    else
    {
      uint64_t v10 = [(MRDRemoteControlDiscoverySession *)self _applyLocalReservedOutputContextValuesToOutputDevices:v6];

      id v6 = (void *)v10;
    }
  }
  id v11 = [(MRDRemoteControlDiscoverySession *)self _addUndiscoveredOutputContextOutputDevices:v6];

  uint64_t v12 = +[MRUserSettings currentSettings];
  unsigned int v13 = [v12 supportMRRelay];

  if (v13)
  {
    uint64_t v14 = [(MRDRemoteControlDiscoverySession *)self _addUndiscoverableGroupLeaderFromDeviceInfo:v11];

    id v11 = (void *)v14;
  }

  return v11;
}

- (id)_applyOutputContextValuesToOutputDevices:(id)a3
{
  id v4 = a3;
  id v40 = [v4 mutableCopy];
  id v5 = +[MRDAVOutputContextManager sharedManager];
  id v31 = [v5 outputContexts];

  id v6 = self;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v58;
    long long v39 = v6;
    uint64_t v30 = *(void *)v58;
    do
    {
      uint64_t v10 = 0;
      id v32 = v8;
      do
      {
        if (*(void *)v58 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v57 + 1) + 8 * (void)v10);
        if (([v11 isLocalDevice] & 1) == 0)
        {
          v34 = v10;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          id v35 = v31;
          id v37 = [v35 countByEnumeratingWithState:&v53 objects:v63 count:16];
          if (!v37) {
            goto LABEL_37;
          }
          uint64_t v36 = *(void *)v54;
          while (1)
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v54 != v36) {
                objc_enumerationMutation(v35);
              }
              uint64_t v38 = v12;
              unsigned int v13 = *(void **)(*((void *)&v53 + 1) + 8 * v12);
              long long v49 = 0u;
              long long v50 = 0u;
              long long v51 = 0u;
              long long v52 = 0u;
              id v41 = [v13 outputDevices];
              id v44 = [v41 countByEnumeratingWithState:&v49 objects:v62 count:16];
              if (v44)
              {
                uint64_t v43 = *(void *)v50;
                do
                {
                  for (i = 0; i != v44; i = (char *)i + 1)
                  {
                    if (*(void *)v50 != v43) {
                      objc_enumerationMutation(v41);
                    }
                    id v15 = *(void **)(*((void *)&v49 + 1) + 8 * i);
                    id v16 = [v15 clusterCompositionMembers];
                    id v17 = v16;
                    if (v16)
                    {
                      long long v47 = 0u;
                      long long v48 = 0u;
                      long long v45 = 0u;
                      long long v46 = 0u;
                      id v18 = v16;
                      id v19 = [v18 countByEnumeratingWithState:&v45 objects:v61 count:16];
                      if (v19)
                      {
                        long long v42 = v17;
                        uint64_t v20 = *(void *)v46;
                        while (2)
                        {
                          for (j = 0; j != v19; j = (char *)j + 1)
                          {
                            if (*(void *)v46 != v20) {
                              objc_enumerationMutation(v18);
                            }
                            id v22 = [*(id *)(*((void *)&v45 + 1) + 8 * (void)j) uid];
                            id v23 = [v11 uid];
                            unsigned int v24 = [v22 isEqualToString:v23];

                            if (v24)
                            {
                              id v19 = [v11 descriptor];
                              id v6 = v39;
                              [(MRDRemoteControlDiscoverySession *)v39 _mergeOutputDevice:v15 intoProtobuf:v19];
                              goto LABEL_28;
                            }
                          }
                          id v19 = [v18 countByEnumeratingWithState:&v45 objects:v61 count:16];
                          if (v19) {
                            continue;
                          }
                          break;
                        }
                        id v6 = v39;
LABEL_28:
                        id v17 = v42;
                      }
                    }
                    else
                    {
                      v25 = [v15 uid];
                      v26 = [v11 uid];
                      unsigned int v27 = [v25 isEqualToString:v26];

                      if (!v27) {
                        goto LABEL_33;
                      }
                      id v19 = [v11 descriptor];
                      id v18 = [v15 descriptor];
                      [v19 mergeFrom:v18];
                    }

                    if (v19)
                    {
                      [v19 setIsRemoteControllable:1];
                      [v40 removeObject:v11];
                      id v28 = [objc_alloc((Class)MRAVDistantOutputDevice) initWithDescriptor:v19];
                      [v40 addObject:v28];

                      [(MRDRemoteControlDiscoverySession *)v6 _logChangesInModifyingOutputDevice:v11 toOutputDevice:v19 reason:@"updateFromOutputContext"];
                    }
LABEL_33:
                  }
                  id v44 = [v41 countByEnumeratingWithState:&v49 objects:v62 count:16];
                }
                while (v44);
              }

              uint64_t v12 = v38 + 1;
            }
            while ((id)(v38 + 1) != v37);
            id v37 = [v35 countByEnumeratingWithState:&v53 objects:v63 count:16];
            if (!v37)
            {
LABEL_37:

              uint64_t v9 = v30;
              id v8 = v32;
              uint64_t v10 = v34;
              break;
            }
          }
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v10 != v8);
      id v8 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
    }
    while (v8);
  }

  return v40;
}

- (id)_applyDeviceInfoValuesToOutputDevices:(id)a3 withDeviceInfo:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006C184;
  v8[3] = &unk_100418698;
  v8[4] = self;
  id v9 = a4;
  id v5 = v9;
  id v6 = objc_msgSend(a3, "msv_map:", v8);

  return v6;
}

- (id)_applyLocalReservedOutputContextValuesToOutputDevices:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006C2B8;
  v5[3] = &unk_1004186C0;
  v5[4] = self;
  id v3 = objc_msgSend(a3, "msv_map:", v5);

  return v3;
}

- (id)_addUndiscoveredOutputContextOutputDevices:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mutableCopy];
  id v6 = +[MRDAVOutputContextManager sharedManager];
  id v7 = [v6 populatedOutputContexts];

  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_10006C89C;
  v51[3] = &unk_100417940;
  id v26 = v4;
  id v52 = v26;
  id v8 = objc_retainBlock(v51);
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_10006C9AC;
  v48[3] = &unk_1004186E8;
  id v25 = v5;
  id v49 = v25;
  long long v50 = self;
  id v35 = self;
  id v9 = objc_retainBlock(v48);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v7;
  id v29 = [obj countByEnumeratingWithState:&v44 objects:v55 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v45;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v45 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = v10;
        id v11 = *(void **)(*((void *)&v44 + 1) + 8 * v10);
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v31 = [v11 outputDevices];
        id v33 = [v31 countByEnumeratingWithState:&v40 objects:v54 count:16];
        if (v33)
        {
          uint64_t v32 = *(void *)v41;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v41 != v32) {
                objc_enumerationMutation(v31);
              }
              uint64_t v34 = v12;
              unsigned int v13 = *(void **)(*((void *)&v40 + 1) + 8 * v12);
              uint64_t v14 = [v13 clusterCompositionMembers];
              id v15 = v14;
              if (v14)
              {
                long long v38 = 0u;
                long long v39 = 0u;
                long long v36 = 0u;
                long long v37 = 0u;
                id v16 = [v14 countByEnumeratingWithState:&v36 objects:v53 count:16];
                if (v16)
                {
                  id v17 = v16;
                  uint64_t v18 = *(void *)v37;
                  do
                  {
                    for (i = 0; i != v17; i = (char *)i + 1)
                    {
                      if (*(void *)v37 != v18) {
                        objc_enumerationMutation(v15);
                      }
                      uint64_t v20 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                      if ((((uint64_t (*)(void *, void *))v8[2])(v8, v20) & 1) == 0)
                      {
                        id v21 = [v20 descriptor];
                        [(MRDRemoteControlDiscoverySession *)v35 _mergeOutputDevice:v13 intoProtobuf:v21];
                        ((void (*)(void *, void *))v9[2])(v9, v21);
                      }
                    }
                    id v17 = [v15 countByEnumeratingWithState:&v36 objects:v53 count:16];
                  }
                  while (v17);
                }
              }
              else if ((((uint64_t (*)(void *, void *))v8[2])(v8, v13) & 1) == 0)
              {
                id v22 = [v13 descriptor];
                ((void (*)(void *, void *))v9[2])(v9, v22);
              }
              uint64_t v12 = v34 + 1;
            }
            while ((id)(v34 + 1) != v33);
            id v33 = [v31 countByEnumeratingWithState:&v40 objects:v54 count:16];
          }
          while (v33);
        }

        uint64_t v10 = v30 + 1;
      }
      while ((id)(v30 + 1) != v29);
      id v29 = [obj countByEnumeratingWithState:&v44 objects:v55 count:16];
    }
    while (v29);
  }

  id v23 = v25;
  return v23;
}

- (id)_addUndiscoverableGroupLeaderFromDeviceInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDRemoteControlDiscoverySession *)self deviceInfo];
  id v6 = [(MRDRemoteControlDiscoverySession *)self _calculateUndiscoverableGroupLeaderFromDeviceInfo:v5];
  if (v6)
  {
    id v7 = [(MRDRemoteControlDiscoverySession *)self undiscoverableGroupLeaderHandle];

    if (!v7)
    {
      [(MRDRemoteControlDiscoverySession *)self setUndiscoverableGroupLeaderHandle:v6];
      id v8 = [v6 connection];
      [v8 addObserver:self];
    }
    id v9 = [v5 leaderDeviceInfo];
    id v10 = [objc_alloc((Class)MRDeviceInfoOutputDevice) initWithDeviceInfo:v9];
    id v11 = [v10 descriptor];
    [(MRDRemoteControlDiscoverySession *)self _mergeDeviceInfo:v9 intoProtobuf:v11];
    [v11 setIsRemoteControllable:1];
    [v11 setParentGroupContainsDiscoverableLeader:1];
    [v11 setGroupContainsGroupLeader:1];
    [v11 setIsProxyGroupPlayer:1];
    uint64_t v12 = [v9 WHAIdentifier];
    [v11 setUniqueIdentifier:v12];

    [v11 setIsGroupLeader:1];
    [v11 setTransportType:7];
    [(MRDRemoteControlDiscoverySession *)self _logChangesInModifyingOutputDevice:0 toOutputDevice:v11 reason:@"addUndiscoveredGroupLeader"];
    id v13 = [objc_alloc((Class)MRAVDistantOutputDevice) initWithDescriptor:v11];
    id v14 = [v4 arrayByAddingObject:v13];
  }
  else
  {
    [(MRDRemoteControlDiscoverySession *)self setUndiscoverableGroupLeaderHandle:0];
    id v14 = v4;
  }

  return v14;
}

- (id)_calculateUndiscoverableGroupLeaderFromDeviceInfo:(id)a3
{
  id v3 = a3;
  id v4 = +[MRDMediaRemoteServer server];
  id v5 = [v4 routingServer];
  unsigned __int8 v6 = [v5 isStartingNowPlayingSession];

  if (v6 & 1) != 0 || ([v3 parentGroupContainsDiscoverableGroupLeader])
  {
    id v7 = 0;
  }
  else
  {
    id v8 = [v3 leaderDeviceInfo];
    id v9 = v8;
    if (v8)
    {
      id v10 = [v8 WHAIdentifier];
      if (v10)
      {
        id v11 = +[MRDMRRelayConnectionManager sharedManager];
        id v7 = [v11 connectionForOutputDeviceUID:v10];
      }
      else
      {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (void)_mergeOutputDevice:(id)a3 intoProtobuf:(id)a4
{
  id v11 = a4;
  id v5 = a3;
  objc_msgSend(v11, "setIsAirPlayReceiverSessionActive:", objc_msgSend(v5, "isAirPlayReceiverSessionActive"));
  unsigned __int8 v6 = [v5 groupID];
  [v11 setGroupID:v6];

  id v7 = [v5 airPlayGroupID];
  [v11 setAirPlayGroupID:v7];

  id v8 = [v5 parentGroupIdentifier];
  [v11 setParentGroupIdentifier:v8];

  objc_msgSend(v11, "setGroupContainsGroupLeader:", objc_msgSend(v5, "groupContainsGroupLeader"));
  objc_msgSend(v11, "setParentGroupContainsDiscoverableLeader:", objc_msgSend(v5, "parentGroupContainsDiscoverableLeader"));
  objc_msgSend(v11, "setIsGroupLeader:", objc_msgSend(v5, "isGroupLeader"));
  objc_msgSend(v11, "setIsProxyGroupPlayer:", objc_msgSend(v5, "isProxyGroupPlayer"));
  id v9 = [v5 uid];
  [v11 setClusterID:v9];

  [v11 setIsRemoteControllable:1];
  objc_msgSend(v11, "setConfiguredClusterSize:", objc_msgSend(v5, "configuredClusterSize"));
  id v10 = [v5 clusterType];

  [v11 setClusterType:v10];
}

- (void)_mergeDeviceInfo:(id)a3 intoProtobuf:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_msgSend(v5, "setIsAirPlayReceiverSessionActive:", objc_msgSend(v6, "isAirPlayActive"));
  id v7 = [v6 groupUID];
  [v5 setGroupID:v7];

  id v8 = [v6 airPlayGroupUID];
  [v5 setAirPlayGroupID:v8];

  id v9 = [v6 parentGroupID];
  [v5 setParentGroupIdentifier:v9];

  objc_msgSend(v5, "setGroupContainsGroupLeader:", objc_msgSend(v6, "groupContainsDiscoverableGroupLeader"));
  objc_msgSend(v5, "setParentGroupContainsDiscoverableLeader:", objc_msgSend(v6, "parentGroupContainsDiscoverableGroupLeader"));
  objc_msgSend(v5, "setIsGroupLeader:", objc_msgSend(v6, "isGroupLeader"));
  objc_msgSend(v5, "setIsProxyGroupPlayer:", objc_msgSend(v6, "isProxyGroupPlayer"));
  id v10 = [v6 clusterID];

  [v5 setClusterID:v10];
}

- (void)_logChangesInModifyingOutputDevice:(id)a3 toOutputDevice:(id)a4 reason:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[MRUserSettings currentSettings];
  unsigned int v11 = [v10 verboseRemoteControlDiscoveryLogging];

  if (v11)
  {
    uint64_t v12 = [v7 descriptor];
    id v13 = [v12 dictionaryRepresentation];
    id v14 = [v8 dictionaryRepresentation];
    MRDictionaryCalculateDeltas();
    id v15 = 0;
    id v16 = 0;
    id v17 = 0;

    uint64_t v18 = (char *)[v15 count];
    id v19 = &v18[(void)[v16 count]];
    if ((char *)[v17 count] + (void)v19)
    {
      uint64_t v20 = MRLogCategoryDiscoveryOversize();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = [v8 uniqueIdentifier];
        id v22 = [v8 name];
        *(_DWORD *)buf = 138412802;
        id v27 = v9;
        __int16 v28 = 2112;
        id v29 = v21;
        __int16 v30 = 2112;
        id v31 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[RemoteControlDiscoverySession] Applied %@ sourced values from outputDevice %@:%@", buf, 0x20u);
      }
      if (v7)
      {
        if ([v15 count])
        {
          id v23 = MRLogCategoryDiscoveryOversize();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v27 = v15;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[RemoteControlDiscoverySession] Added Fields: %{public}@", buf, 0xCu);
          }
        }
        if ([v16 count])
        {
          unsigned int v24 = MRLogCategoryDiscoveryOversize();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v27 = v16;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[RemoteControlDiscoverySession] Removed Fields: %{public}@", buf, 0xCu);
          }
        }
        if ([v17 count])
        {
          id v25 = MRLogCategoryDiscoveryOversize();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v27 = v17;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[RemoteControlDiscoverySession] Updated Values: %{public}@", buf, 0xCu);
          }
        }
      }
    }
  }
}

- (void)_loadLocalEndpointConnection
{
  id v3 = +[NSDate date];
  id v4 = +[NSUUID UUID];
  id v5 = [v4 UUIDString];

  id v6 = (__CFString *)[objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"loadLocalEndpointConnection", v5];
  if (objc_opt_class()) {
    [(__CFString *)v6 appendFormat:@" for %@", objc_opt_class()];
  }
  id v7 = _MRLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v43 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  id v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  [v8 setObject:v10 forKeyedSubscript:MRExternalDeviceConnectionReasonUserInfoKey];

  [v8 setObject:v5 forKeyedSubscript:MRExternalDeviceConnectionCorrelationIDUserInfoKey];
  unsigned int v11 = (void *)MRMediaRemoteCopyDeviceUID();
  uint64_t v12 = +[MRAVOutputDeviceTransport _createConnectionWith:v11 groupID:0 connectionType:2 shouldUseSystemAuthenticationPrompt:0 userInfo:v8];
  id v13 = [v12 first];
  id v14 = [v12 second];

  if (!v14 && v13)
  {
    uint64_t v15 = objc_opt_class();
    id v16 = _MRLogForCategory();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v17)
      {
        uint64_t v18 = objc_opt_class();
        id v19 = +[NSDate date];
        [v19 timeIntervalSinceDate:v3];
        *(_DWORD *)buf = 138544386;
        CFStringRef v43 = @"loadLocalEndpointConnection";
        __int16 v44 = 2114;
        long long v45 = v5;
        __int16 v46 = 2112;
        uint64_t v47 = (uint64_t)v13;
        __int16 v48 = 2114;
        uint64_t v49 = v18;
        __int16 v50 = 2048;
        uint64_t v51 = v20;
        id v21 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        id v22 = v16;
        uint32_t v23 = 52;
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
        goto LABEL_18;
      }
      goto LABEL_27;
    }
    if (!v17) {
      goto LABEL_27;
    }
    id v33 = +[NSDate date];
    [v33 timeIntervalSinceDate:v3];
    *(_DWORD *)buf = 138544130;
    CFStringRef v43 = @"loadLocalEndpointConnection";
    __int16 v44 = 2114;
    long long v45 = v5;
    __int16 v46 = 2112;
    uint64_t v47 = (uint64_t)v13;
    __int16 v48 = 2048;
    uint64_t v49 = v34;
    id v35 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    long long v36 = v16;
    uint32_t v37 = 42;
    goto LABEL_25;
  }
  unsigned int v24 = [v12 second];

  uint64_t v25 = objc_opt_class();
  id v26 = _MRLogForCategory();
  id v16 = v26;
  if (v24)
  {
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v25)
    {
      if (v27)
      {
        id v19 = [v12 second];
        uint64_t v41 = objc_opt_class();
        __int16 v28 = +[NSDate date];
        [v28 timeIntervalSinceDate:v3];
        *(_DWORD *)buf = 138544386;
        CFStringRef v43 = @"loadLocalEndpointConnection";
        __int16 v44 = 2114;
        long long v45 = v5;
        __int16 v46 = 2114;
        uint64_t v47 = (uint64_t)v19;
        __int16 v48 = 2114;
        uint64_t v49 = v41;
        __int16 v50 = 2048;
        uint64_t v51 = v29;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);

LABEL_18:
        goto LABEL_27;
      }
      goto LABEL_27;
    }
    if (!v27) {
      goto LABEL_27;
    }
    id v33 = [v12 second];
    long long v38 = +[NSDate date];
    [v38 timeIntervalSinceDate:v3];
    *(_DWORD *)buf = 138544130;
    CFStringRef v43 = @"loadLocalEndpointConnection";
    __int16 v44 = 2114;
    long long v45 = v5;
    __int16 v46 = 2114;
    uint64_t v47 = (uint64_t)v33;
    __int16 v48 = 2048;
    uint64_t v49 = v39;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", buf, 0x2Au);

LABEL_26:
    goto LABEL_27;
  }
  BOOL v30 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (!v25)
  {
    if (!v30) {
      goto LABEL_27;
    }
    id v33 = +[NSDate date];
    [v33 timeIntervalSinceDate:v3];
    *(_DWORD *)buf = 138543874;
    CFStringRef v43 = @"loadLocalEndpointConnection";
    __int16 v44 = 2114;
    long long v45 = v5;
    __int16 v46 = 2048;
    uint64_t v47 = v40;
    id v35 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    long long v36 = v16;
    uint32_t v37 = 32;
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, v35, buf, v37);
    goto LABEL_26;
  }
  if (v30)
  {
    uint64_t v31 = objc_opt_class();
    id v19 = +[NSDate date];
    [v19 timeIntervalSinceDate:v3];
    *(_DWORD *)buf = 138544130;
    CFStringRef v43 = @"loadLocalEndpointConnection";
    __int16 v44 = 2114;
    long long v45 = v5;
    __int16 v46 = 2114;
    uint64_t v47 = v31;
    __int16 v48 = 2048;
    uint64_t v49 = v32;
    id v21 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    id v22 = v16;
    uint32_t v23 = 42;
    goto LABEL_17;
  }
LABEL_27:

  [(MRDRemoteControlDiscoverySession *)self setLocalEndpointConnection:v13];
}

- (void)_loadDefaults
{
  id v3 = [(NSUserDefaults *)self->_userDefaults valueForKey:@"remotecontrol-denylist"];
  denyList = self->_denyList;
  id v5 = _MRLogForCategory();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (denyList)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = self->_denyList;
    *(_DWORD *)buf = 138544130;
    CFStringRef v28 = @"RemoteControlDiscoverySession";
    __int16 v29 = 2114;
    CFStringRef v30 = @"denyList";
    __int16 v31 = 2112;
    uint64_t v32 = v7;
    __int16 v33 = 2112;
    uint64_t v34 = v3;
    id v8 = "Set: %{public}@ setting %{public}@ from <%@> to <%@>";
    id v9 = v5;
    uint32_t v10 = 42;
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138543874;
    CFStringRef v28 = @"RemoteControlDiscoverySession";
    __int16 v29 = 2114;
    CFStringRef v30 = @"denyList";
    __int16 v31 = 2112;
    uint64_t v32 = v3;
    id v8 = "Set: %{public}@ setting %{public}@ to <%@>";
    id v9 = v5;
    uint32_t v10 = 32;
  }
  _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_7:

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v12 = v3;
  if ((isKindOfClass & 1) == 0)
  {
    if (v3)
    {
      id v26 = v3;
      id v13 = +[NSArray arrayWithObjects:&v26 count:1];
      goto LABEL_12;
    }
    uint64_t v12 = 0;
  }
  id v13 = v12;
LABEL_12:
  id v14 = self->_denyList;
  self->_denyList = v13;

  uint64_t v15 = [(NSUserDefaults *)self->_userDefaults valueForKey:@"remotecontrol-allowlist"];

  id v16 = self->_denyList;
  BOOL v17 = _MRLogForCategory();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (!v18) {
      goto LABEL_18;
    }
    id v19 = self->_denyList;
    *(_DWORD *)buf = 138544130;
    CFStringRef v28 = @"RemoteControlDiscoverySession";
    __int16 v29 = 2114;
    CFStringRef v30 = @"allowList";
    __int16 v31 = 2112;
    uint64_t v32 = v19;
    __int16 v33 = 2112;
    uint64_t v34 = v15;
    uint64_t v20 = "Set: %{public}@ setting %{public}@ from <%@> to <%@>";
    id v21 = v17;
    uint32_t v22 = 42;
  }
  else
  {
    if (!v18) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138543874;
    CFStringRef v28 = @"RemoteControlDiscoverySession";
    __int16 v29 = 2114;
    CFStringRef v30 = @"allowList";
    __int16 v31 = 2112;
    uint64_t v32 = v15;
    uint64_t v20 = "Set: %{public}@ setting %{public}@ to <%@>";
    id v21 = v17;
    uint32_t v22 = 32;
  }
  _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
LABEL_18:

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v23 = 0;
    unsigned int v24 = v15;
  }
  else if (v15)
  {
    uint64_t v25 = v15;
    int v23 = 1;
    unsigned int v24 = +[NSArray arrayWithObjects:&v25 count:1];
  }
  else
  {
    int v23 = 0;
    unsigned int v24 = 0;
  }
  objc_storeStrong((id *)&self->_allowList, v24);
  if (v23) {
}
  }

- (BOOL)shouldUseDeviceInfoForLocalDevice
{
  v2 = +[MRUserSettings currentSettings];
  if ([v2 forceDeviceInfoDiscovery])
  {
    unsigned __int8 v3 = 1;
  }
  else
  {
    id v4 = +[MRUserSettings currentSettings];
    unsigned __int8 v3 = [v4 homepodDemoMode];
  }
  return v3;
}

- (BOOL)_shouldCreateClusterOutputDevices
{
  v2 = +[MRUserSettings currentSettings];
  unsigned __int8 v3 = [v2 useClusterDevices];

  return v3;
}

- (void)_initializeDiscoverySessions
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  objc_initWeak(&location, self);
  unsigned __int8 v3 = +[MRUserSettings currentSettings];
  unsigned int v4 = [v3 supportIDSDiscovery];

  if (v4)
  {
    id v5 = objc_alloc_init(MRDIDSDiscoverySession);
    idsDiscoverySession = self->_idsDiscoverySession;
    self->_idsDiscoverySession = v5;

    [(MRDIDSDiscoverySession *)self->_idsDiscoverySession setAlwaysLogUpdates:1];
    [(MRDIDSDiscoverySession *)self->_idsDiscoverySession setAlwaysAllowUpdates:1];
    id v7 = self->_idsDiscoverySession;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10006DFDC;
    v30[3] = &unk_100418710;
    objc_copyWeak(&v31, &location);
    id v8 = [(MRDIDSDiscoverySession *)v7 addOutputDevicesChangedCallback:v30];
    objc_destroyWeak(&v31);
  }
  id v9 = +[MRSharedSettings currentSettings];
  unsigned int v10 = [v9 supportGroupSession];

  if (v10)
  {
    unsigned int v11 = objc_alloc_init(_TtC12mediaremoted31MRDGroupSessionDiscoverySession);
    groupSessionDiscoverySession = self->_groupSessionDiscoverySession;
    self->_groupSessionDiscoverySession = v11;

    id v13 = self->_groupSessionDiscoverySession;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10006E01C;
    v28[3] = &unk_100418710;
    objc_copyWeak(&v29, &location);
    id v14 = [(MRDGroupSessionDiscoverySession *)v13 addOutputDevicesChangedCallback:v28];
    objc_destroyWeak(&v29);
  }
  uint64_t v15 = +[MRUserSettings currentSettings];
  unsigned int v16 = [v15 discoverCompanionDevices];

  if (v16)
  {
    BOOL v17 = objc_alloc_init(MRIDSCompanionDiscoverySession);
    companionDiscoverySession = self->_companionDiscoverySession;
    self->_companionDiscoverySession = (MRAVRoutingDiscoverySession *)v17;

    [(MRAVRoutingDiscoverySession *)self->_companionDiscoverySession setAlwaysLogUpdates:1];
    [(MRAVRoutingDiscoverySession *)self->_companionDiscoverySession setAlwaysAllowUpdates:1];
    id v19 = self->_companionDiscoverySession;
    int v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    uint64_t v25 = sub_10006E05C;
    id v26 = &unk_100418710;
    objc_copyWeak(&v27, &location);
    id v20 = [(MRAVRoutingDiscoverySession *)v19 addOutputDevicesChangedCallback:&v23];
    id v21 = objc_alloc_init(MRCompanionConnectionController);
    companionController = self->_companionController;
    self->_companionController = v21;

    -[MRCompanionConnectionController setDelegate:](self->_companionController, "setDelegate:", self, v23, v24, v25, v26);
    [(MRAVRoutingDiscoverySession *)self->_companionDiscoverySession setDiscoveryMode:3];
    objc_destroyWeak(&v27);
  }
  [(MRDRemoteControlDiscoverySession *)self _setupStandaloneDiscovery];
  objc_destroyWeak(&location);
}

- (void)_setupStandaloneDiscovery
{
  unsigned __int8 v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[RemoteControlDiscoverySession] %@ setupStandaloneDiscovery", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v4 = objc_alloc((Class)MRAVConcreteRoutingDiscoverySession);
  id v5 = [(MRDRemoteControlDiscoverySession *)self configuration];
  BOOL v6 = (MRAVConcreteRoutingDiscoverySession *)[v4 initWithConfiguration:v5];
  avDiscoverySession = self->_avDiscoverySession;
  self->_avDiscoverySession = v6;

  [(MRAVConcreteRoutingDiscoverySession *)self->_avDiscoverySession setAlwaysLogUpdates:1];
  [(MRAVConcreteRoutingDiscoverySession *)self->_avDiscoverySession setAlwaysAllowUpdates:1];
  objc_initWeak((id *)buf, self);
  id v8 = self->_avDiscoverySession;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10006E2C8;
  v12[3] = &unk_100418710;
  objc_copyWeak(&v13, (id *)buf);
  id v9 = [(MRAVConcreteRoutingDiscoverySession *)v8 addOutputDevicesChangedCallback:v12];
  [(MRAVConcreteRoutingDiscoverySession *)self->_avDiscoverySession setDiscoveryMode:self->_discoveryMode];
  [(MRAVRoutingDiscoverySession *)self->_externalDiscoverySession removeOutputDevicesChangedCallback:self->_externalDiscoverySessionToken];
  [(MRAVRoutingDiscoverySession *)self->_externalDiscoverySession setDiscoveryMode:0];
  externalDiscoverySession = self->_externalDiscoverySession;
  self->_externalDiscoverySession = 0;

  id externalDiscoverySessionToken = self->_externalDiscoverySessionToken;
  self->_id externalDiscoverySessionToken = 0;

  [(MRDRemoteControlDiscoverySession *)self _scheduleAvailableOutputDevicesReload];
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (void)_setupProxiedDiscoveryWithDestinationEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    BOOL v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[RemoteControlDiscoverySession] %@ setupCompanionDiscovery", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v6 = objc_msgSend(objc_alloc((Class)MRAVRoutingDiscoverySessionConfiguration), "initWithEndpointFeatures:", -[MRDRemoteControlDiscoverySession endpointFeatures](self, "endpointFeatures"));
  id v7 = [(MRDRemoteControlDiscoverySession *)self routingContextUID];
  [v6 setRoutingContextUID:v7];

  id v8 = [v4 discoverySessionWithConfiguration:v6];
  externalDiscoverySession = self->_externalDiscoverySession;
  self->_externalDiscoverySession = v8;

  [(MRAVRoutingDiscoverySession *)self->_externalDiscoverySession setAlwaysLogUpdates:1];
  [(MRAVRoutingDiscoverySession *)self->_externalDiscoverySession setAlwaysAllowUpdates:1];
  objc_initWeak((id *)buf, self);
  unsigned int v10 = self->_externalDiscoverySession;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10006E564;
  v14[3] = &unk_100418710;
  objc_copyWeak(&v15, (id *)buf);
  unsigned int v11 = [(MRAVRoutingDiscoverySession *)v10 addOutputDevicesChangedCallback:v14];
  id externalDiscoverySessionToken = self->_externalDiscoverySessionToken;
  self->_id externalDiscoverySessionToken = v11;

  [(MRAVRoutingDiscoverySession *)self->_externalDiscoverySession setDiscoveryMode:[(MRDRemoteControlDiscoverySession *)self discoveryMode]];
  [(MRAVConcreteRoutingDiscoverySession *)self->_avDiscoverySession setDiscoveryMode:0];
  avDiscoverySession = self->_avDiscoverySession;
  self->_avDiscoverySession = 0;

  [(MRDRemoteControlDiscoverySession *)self _scheduleAvailableOutputDevicesReload];
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (MRAVConcreteRoutingDiscoverySession)avDiscoverySession
{
  return self->_avDiscoverySession;
}

- (void)setAvDiscoverySession:(id)a3
{
}

- (MRDIDSDiscoverySession)idsDiscoverySession
{
  return self->_idsDiscoverySession;
}

- (void)setIdsDiscoverySession:(id)a3
{
}

- (_TtC12mediaremoted31MRDGroupSessionDiscoverySession)groupSessionDiscoverySession
{
  return self->_groupSessionDiscoverySession;
}

- (void)setGroupSessionDiscoverySession:(id)a3
{
}

- (MRAVRoutingDiscoverySession)companionDiscoverySession
{
  return self->_companionDiscoverySession;
}

- (void)setCompanionDiscoverySession:(id)a3
{
}

- (MRAVRoutingDiscoverySession)externalDiscoverySession
{
  return self->_externalDiscoverySession;
}

- (void)setExternalDiscoverySession:(id)a3
{
}

- (MRCompanionConnectionController)companionController
{
  return self->_companionController;
}

- (void)setCompanionController:(id)a3
{
}

- (MRExternalDeviceTransportConnectionHandle)undiscoverableGroupLeaderHandle
{
  return self->_undiscoverableGroupLeaderHandle;
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (NSArray)allowList
{
  return self->_allowList;
}

- (NSArray)denyList
{
  return self->_denyList;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_denyList, 0);
  objc_storeStrong((id *)&self->_allowList, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_undiscoverableGroupLeaderHandle, 0);
  objc_storeStrong((id *)&self->_companionController, 0);
  objc_storeStrong((id *)&self->_externalDiscoverySession, 0);
  objc_storeStrong((id *)&self->_companionDiscoverySession, 0);
  objc_storeStrong((id *)&self->_groupSessionDiscoverySession, 0);
  objc_storeStrong((id *)&self->_idsDiscoverySession, 0);
  objc_storeStrong((id *)&self->_avDiscoverySession, 0);
  objc_storeStrong((id *)&self->_discoveryTimer, 0);
  objc_storeStrong((id *)&self->_connectionFailedWHAIdentifiers, 0);
  objc_storeStrong((id *)&self->_localEndpointConnection, 0);
  objc_storeStrong((id *)&self->_lastReportedClientIdentifiers, 0);
  objc_storeStrong(&self->_externalDiscoverySessionToken, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_routingContextID, 0);
  objc_storeStrong((id *)&self->_nativeOutputDevice, 0);
  objc_storeStrong((id *)&self->_unclusteredOutputDevices, 0);

  objc_storeStrong((id *)&self->_availableOutputDevices, 0);
}

@end