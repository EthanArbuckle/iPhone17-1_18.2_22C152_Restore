@interface MRDHostedRoutingController
+ (void)initialize;
- (BOOL)devicePresenceDetected;
- (BOOL)isOutputContextInUse:(id)a3;
- (MRDHostedRoutingController)init;
- (MRDHostedRoutingController)initWithDiscoverySession:(id)a3;
- (MRDRemoteControlDiscoverySession)discoverySession;
- (MRDeviceInfo)deviceInfo;
- (NSArray)availableDistantEndpoints;
- (NSArray)availableDistantOutputDevices;
- (NSArray)availableEndpoints;
- (NSArray)availableOutputDevices;
- (NSArray)resolvedAvailableEndpoints;
- (NSArray)virtualOutputDevices;
- (NSDictionary)availableExternalDevices;
- (NSMutableDictionary)virtualOutputDeviceDictionary;
- (NSString)debugDescription;
- (OS_dispatch_queue)serialQueue;
- (id)_onQueue_determineGroupLeaderForOutputDevices:(id)a3 availableOutputDevices:(id)a4 options:(unint64_t)a5;
- (id)_onQueue_makeExternalDeviceForEndpoint:(id)a3;
- (id)_onQueue_makeExternalDeviceTransportForEndpoint:(id)a3 designatedGroupLeader:(id)a4;
- (id)_onQueue_makeHostedExternalDeviceForEndpoint:(id)a3 didCreate:(BOOL *)a4;
- (id)_onQueue_makeHostedExternalDeviceForEndpoint:(id)a3 didCreate:(BOOL *)a4 factory:(id)a5;
- (id)_onQueue_makeLocalHostedExternalDeviceForEndpoint:(id)a3 didCreate:(BOOL *)a4;
- (id)computeHostsByGroupIDForOutputDevices:(id)a3 unclusteredDevices:(id)a4;
- (id)createDiscoverySession;
- (id)determineGroupLeaderForOutputDevices:(id)a3 options:(unint64_t)a4;
- (id)externalDeviceForEndpoint:(id)a3;
- (id)filterOutputDevices:(id)a3 remoteControllableOnly:(BOOL)a4;
- (id)makeEndpointWithOutputDeviceUIDs:(id)a3 options:(unint64_t)a4;
- (id)makeEndpointWithOutputDevices:(id)a3 options:(unint64_t)a4;
- (id)makeTransientExternalDeviceToOutputDevice:(id)a3;
- (id)resolveOutputDevices:(id)a3;
- (unsigned)discoveryMode;
- (void)_handleEndpointOutputDevicesDidChangeNotification:(id)a3;
- (void)_handleExternalDeviceConnectionStateDidChangeNotification:(id)a3;
- (void)_handleOutputContextManagerDidReset:(id)a3;
- (void)_onQueue_reloadEndpoints;
- (void)_onQueue_reloadOutputDevices;
- (void)_onQueue_reloadWithOutputDevices:(id)a3;
- (void)_processDiscoveryObserverChanges;
- (void)addObserver:(id)a3;
- (void)addVirtualOutputDevice:(id)a3 forClient:(id)a4;
- (void)dealloc;
- (void)hostedExternalDeviceManagerDidUpdateExternalDeviceMapping:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeVirtualOutputDevicesForClient:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setDiscoverySession:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setVirtualOutputDeviceDictionary:(id)a3;
@end

@implementation MRDHostedRoutingController

+ (void)initialize
{
}

- (MRDHostedRoutingController)initWithDiscoverySession:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)MRDHostedRoutingController;
  v5 = [(MRDHostedRoutingController *)&v41 init];
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    Name = class_getName(v6);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create(Name, v8);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.mediaremoted.MRDHostedRoutingController/calloutQueue", v11);
    observerCalloutQueue = v5->_observerCalloutQueue;
    v5->_observerCalloutQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = +[NSHashTable weakObjectsHashTable];
    weakObservers = v5->_weakObservers;
    v5->_weakObservers = (NSHashTable *)v14;

    uint64_t v16 = +[MRAVLocalEndpoint sharedLocalEndpointForRoutingContextWithUID:0];
    localEndpoint = v5->_localEndpoint;
    v5->_localEndpoint = (MRAVEndpoint *)v16;

    v18 = objc_alloc_init(MRDHostedExternalDeviceManager);
    externalDeviceManager = v5->_externalDeviceManager;
    v5->_externalDeviceManager = v18;

    [(MRDHostedExternalDeviceManager *)v5->_externalDeviceManager setDelegate:v5];
    v20 = +[MRDAVOutputContextManager sharedManager];
    [v20 addDataSource:v5];

    uint64_t v21 = +[NSMutableDictionary dictionary];
    virtualOutputDeviceDictionary = v5->_virtualOutputDeviceDictionary;
    v5->_virtualOutputDeviceDictionary = (NSMutableDictionary *)v21;

    v23 = +[NSNotificationCenter defaultCenter];
    [v23 addObserver:v5 selector:"_handleExternalDeviceConnectionStateDidChangeNotification:" name:kMRExternalDeviceConnectionStateDidChangeNotification object:0];
    [v23 addObserver:v5 selector:"_handleObserverDiscoveryModeDidChangeNotification:" name:@"MRDAVHostedRoutingObserverDiscoveryModeDidChangeNotification" object:0];
    [v23 addObserver:v5 selector:"_handleEndpointOutputDevicesDidChangeNotification:" name:kMRAVEndpointOutputDevicesDidChangeNotification object:0];
    [v23 addObserver:v5 selector:"_handleOutputContextManagerDidReset:" name:@"MRDAVOutputContextManagerDidReset" object:0];
    if (v4) {
      v24 = (MRDRemoteControlDiscoverySession *)v4;
    }
    else {
      v24 = objc_alloc_init(MRDRemoteControlDiscoverySession);
    }
    discoverySession = v5->_discoverySession;
    v5->_discoverySession = v24;

    objc_initWeak(&location, v5);
    v26 = [(MRDHostedRoutingController *)v5 discoverySession];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000EC03C;
    v38[3] = &unk_100418710;
    objc_copyWeak(&v39, &location);
    uint64_t v27 = [v26 addOutputDevicesChangedCallback:v38];
    id discoverySessionOutputDevicesToken = v5->_discoverySessionOutputDevicesToken;
    v5->_id discoverySessionOutputDevicesToken = (id)v27;

    v29 = [(MRDHostedRoutingController *)v5 discoverySession];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000EC0E0;
    v36[3] = &unk_100418710;
    objc_copyWeak(&v37, &location);
    uint64_t v30 = [v29 addEndpointsChangedCallback:v36];
    id discoverySessionEndpointsToken = v5->_discoverySessionEndpointsToken;
    v5->_id discoverySessionEndpointsToken = (id)v30;

    v32 = v5->_serialQueue;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000EC184;
    v34[3] = &unk_100415CC8;
    v35 = v5;
    dispatch_async(v32, v34);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (MRDHostedRoutingController)init
{
  return [(MRDHostedRoutingController *)self initWithDiscoverySession:0];
}

- (void)dealloc
{
  v3 = [(MRDHostedRoutingController *)self discoverySession];
  [v3 removeOutputDevicesChangedCallback:self->_discoverySessionOutputDevicesToken];

  id v4 = [(MRDHostedRoutingController *)self discoverySession];
  [v4 removeEndpointsChangedCallback:self->_discoverySessionEndpointsToken];

  v5.receiver = self;
  v5.super_class = (Class)MRDHostedRoutingController;
  [(MRDHostedRoutingController *)&v5 dealloc];
}

- (NSString)debugDescription
{
  id v3 = objc_alloc((Class)NSString);
  id v4 = [(MRDRemoteControlDiscoverySession *)self->_discoverySession debugDescription];
  id v5 = [v3 initWithFormat:@"DiscoverySession=%@\n", v4];

  return (NSString *)v5;
}

- (id)createDiscoverySession
{
  v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s is abstract", "-[MRDHostedRoutingController createDiscoverySession]");
  id v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v2 userInfo:0];

  objc_exception_throw(v3);
}

- (void)_onQueue_reloadEndpoints
{
  v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s is abstract", "-[MRDHostedRoutingController _onQueue_reloadEndpoints]");
  id v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v2 userInfo:0];

  objc_exception_throw(v3);
}

- (id)_onQueue_makeExternalDeviceTransportForEndpoint:(id)a3 designatedGroupLeader:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s is abstract", "-[MRDHostedRoutingController _onQueue_makeExternalDeviceTransportForEndpoint:designatedGroupLeader:]");
  id v8 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (id)makeEndpointWithOutputDevices:(id)a3 options:(unint64_t)a4
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s is abstract", "-[MRDHostedRoutingController makeEndpointWithOutputDevices:options:]");
  id v6 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (id)makeEndpointWithOutputDeviceUIDs:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(MRDHostedRoutingController *)self availableOutputDevices];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000EC60C;
  v15[3] = &unk_10041B1A0;
  id v16 = v6;
  id v8 = v6;
  dispatch_queue_t v9 = [v7 indexesOfObjectsPassingTest:v15];
  v10 = [v7 objectsAtIndexes:v9];

  id v11 = [objc_alloc((Class)NSSet) initWithArray:v10];
  dispatch_queue_t v12 = [v11 allObjects];

  v13 = [(MRDHostedRoutingController *)self makeEndpointWithOutputDevices:v12 options:a4];

  return v13;
}

- (id)makeTransientExternalDeviceToOutputDevice:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && ([v4 primaryID], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    id v7 = objc_alloc_init((Class)_MRAVOutputDeviceDescriptorProtobuf);
    id v8 = [v5 primaryID];
    [v7 setUniqueIdentifier:v8];

    objc_msgSend(v7, "setTransportType:", objc_msgSend(v5, "transportType"));
    id v9 = [objc_alloc((Class)MRAVDistantOutputDevice) initWithDescriptor:v7];
    id v10 = [objc_alloc((Class)MRAVConcreteEndpoint) initWithDesignatedGroupLeader:v9 outputDevices:0 preferredSuffix:0 connectionType:2];
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = sub_1000EC888;
    v22 = sub_1000EC898;
    id v23 = 0;
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000EC8A0;
    block[3] = &unk_100416730;
    id v16 = v10;
    v17 = &v18;
    block[4] = self;
    id v12 = v10;
    dispatch_sync((dispatch_queue_t)serialQueue, block);
    id v13 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (BOOL)devicePresenceDetected
{
  return [(MRDRemoteControlDiscoverySession *)self->_discoverySession devicePresenceDetected];
}

- (unsigned)discoveryMode
{
  return [(MRDRemoteControlDiscoverySession *)self->_discoverySession discoveryMode];
}

- (NSArray)availableEndpoints
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000EC888;
  id v10 = sub_1000EC898;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000EC9F0;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)availableDistantEndpoints
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000EC888;
  id v10 = sub_1000EC898;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000ECAF4;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)resolvedAvailableEndpoints
{
  v2 = [(MRDHostedRoutingController *)self availableDistantEndpoints];
  id v3 = objc_msgSend(v2, "msv_map:", &stru_10041C260);

  return (NSArray *)v3;
}

- (NSDictionary)availableExternalDevices
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000EC888;
  id v10 = sub_1000EC898;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000ECCAC;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (NSArray)availableDistantOutputDevices
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000EC888;
  id v10 = sub_1000EC898;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000ECDEC;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)availableOutputDevices
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000EC888;
  id v10 = sub_1000EC898;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000ECEF0;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_1000ECFE8;
  id v10 = &unk_1004158D8;
  id v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, &v7);
  [(MRDHostedRoutingController *)self _processDiscoveryObserverChanges];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_1000ED09C;
  id v10 = &unk_1004158D8;
  id v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, &v7);
  [(MRDHostedRoutingController *)self _processDiscoveryObserverChanges];
}

- (id)externalDeviceForEndpoint:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_1000EC888;
  uint64_t v21 = sub_1000EC898;
  id v22 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ED23C;
  block[3] = &unk_100416730;
  id v16 = &v17;
  block[4] = self;
  id v6 = v4;
  id v15 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v7 = (void *)v18[5];
  if (!v7)
  {
    uint64_t v8 = self->_serialQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000ED28C;
    v11[3] = &unk_100419598;
    v11[4] = self;
    id v13 = &v17;
    id v12 = v6;
    dispatch_sync((dispatch_queue_t)v8, v11);

    id v7 = (void *)v18[5];
  }
  id v9 = v7;

  _Block_object_dispose(&v17, 8);

  return v9;
}

- (id)_onQueue_makeHostedExternalDeviceForEndpoint:(id)a3 didCreate:(BOOL *)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000ED3A8;
  v8[3] = &unk_10041C288;
  id v9 = self;
  id v10 = a3;
  id v5 = v10;
  id v6 = [(MRDHostedRoutingController *)v9 _onQueue_makeHostedExternalDeviceForEndpoint:v5 didCreate:a4 factory:v8];

  return v6;
}

- (id)_onQueue_makeLocalHostedExternalDeviceForEndpoint:(id)a3 didCreate:(BOOL *)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000ED478;
  v9[3] = &unk_10041C2B0;
  id v10 = a3;
  id v6 = v10;
  id v7 = [(MRDHostedRoutingController *)self _onQueue_makeHostedExternalDeviceForEndpoint:v6 didCreate:a4 factory:v9];

  return v7;
}

- (id)_onQueue_makeHostedExternalDeviceForEndpoint:(id)a3 didCreate:(BOOL *)a4 factory:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v10 = [v8 designatedGroupLeader];
  id v11 = 0;
  if ([v8 connectionType] != (id)1 && v10)
  {
    externalDeviceManager = self->_externalDeviceManager;
    id v13 = [v8 uniqueIdentifier];
    id v11 = [(MRDHostedExternalDeviceManager *)externalDeviceManager hostedExternalDeviceForEndpointIdentifier:v13];

    if (!v11)
    {
      uint64_t v14 = v9[2](v9);
      if (v14)
      {
        id v11 = [[MRDAVHostedExternalDevice alloc] initWithExternalDevice:v14];
        [(MRDHostedExternalDeviceManager *)self->_externalDeviceManager addHostedExternalDevice:v11 endpoint:v8];
        if (a4) {
          *a4 = 1;
        }
      }
      else
      {
        id v11 = 0;
      }
    }
    id v15 = [(MRDAVHostedExternalDevice *)v11 externalDevice];
    [v8 setExternalDevice:v15];
  }

  return v11;
}

- (id)_onQueue_makeExternalDeviceForEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = [v4 designatedGroupLeader];
  if ([v4 connectionType] == (id)6 && objc_msgSend(v5, "willBeLocallyHosted"))
  {
    id v6 = [v4 designatedProxyGroupLeader];
    id v7 = +[MRDAVOutputContextManager sharedManager];
    id v8 = [v7 outputContextForOutputDevice:v6];

    uint64_t v9 = [v6 groupContextID];
    if (!v9) {
      goto LABEL_5;
    }
    id v10 = (void *)v9;
    id v11 = [v6 groupContextID];
    id v12 = [v8 contextID];
    unsigned __int8 v13 = [v11 isEqualToString:v12];

    if ((v13 & 1) == 0)
    {
      uint64_t v18 = MRLogCategoryDiscovery();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = [v4 debugName];
        uint64_t v20 = [v6 groupContextID];
        uint64_t v21 = [v8 contextID];
        int v23 = 138543874;
        id v24 = v19;
        __int16 v25 = 2114;
        v26 = v20;
        __int16 v27 = 2114;
        v28 = v21;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Ignoring makeExternalDeviceForEndpoint=%{public}@ because groupContextID mismatch with contextID: %{public}@ != %{public}@", (uint8_t *)&v23, 0x20u);
      }
      uint64_t v14 = 0;
    }
    else
    {
LABEL_5:
      uint64_t v14 = [[MRDAVOutputContextExternalDevice alloc] initWithOutputContext:v8];
    }
  }
  else
  {
    id v6 = [(MRDHostedRoutingController *)self _onQueue_makeExternalDeviceTransportForEndpoint:v4 designatedGroupLeader:v5];
    if (v6)
    {
      if ([v5 isUsingJSONProtocol]) {
        id v15 = MRJSONTransportExternalDevice;
      }
      else {
        id v15 = MRDTransportExternalDevice;
      }
      uint64_t v14 = (MRDAVOutputContextExternalDevice *)[[v15 alloc] initWithTransport:v6];
    }
    else
    {
      id v16 = MRLogCategoryDiscovery();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [v5 uid];
        int v23 = 138543618;
        id v24 = v4;
        __int16 v25 = 2114;
        v26 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Failed to create external device transport for %{public}@, group leader: %{public}@", (uint8_t *)&v23, 0x16u);
      }
      uint64_t v14 = 0;
    }
  }

  return v14;
}

- (id)determineGroupLeaderForOutputDevices:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_1000EC888;
  uint64_t v19 = sub_1000EC898;
  id v20 = 0;
  serialQueue = self->_serialQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000EDA44;
  v11[3] = &unk_10041C2D8;
  v11[4] = self;
  id v12 = v6;
  unsigned __int8 v13 = &v15;
  unint64_t v14 = a4;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

- (NSArray)virtualOutputDevices
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000EC888;
  id v11 = sub_1000EC898;
  id v12 = +[NSMutableArray array];
  serialQueue = self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000EDBA0;
  v6[3] = &unk_100415940;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync((dispatch_queue_t)serialQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)addVirtualOutputDevice:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl())
  {
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000EDD80;
    block[3] = &unk_1004159B8;
    block[4] = self;
    id v10 = v7;
    id v11 = v6;
    dispatch_sync((dispatch_queue_t)serialQueue, block);
  }
}

- (void)removeVirtualOutputDevicesForClient:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    serialQueue = self->_serialQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000EDF1C;
    v6[3] = &unk_1004158D8;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync((dispatch_queue_t)serialQueue, v6);
  }
}

- (void)_onQueue_reloadOutputDevices
{
  id v3 = [(MRDHostedRoutingController *)self discoverySession];
  id v4 = [v3 deviceInfo];
  deviceInfo = self->_deviceInfo;
  self->_deviceInfo = v4;

  id v7 = [(MRDHostedRoutingController *)self discoverySession];
  id v6 = [v7 availableOutputDevices];
  [(MRDHostedRoutingController *)self _onQueue_reloadWithOutputDevices:v6];
}

- (id)_onQueue_determineGroupLeaderForOutputDevices:(id)a3 availableOutputDevices:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v72 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v9 = [v8 firstObject];
  id v10 = [v9 groupID];
  uint64_t v11 = MRComputeBaseGroupID();

  id v12 = self;
  v70 = [(MRDRemoteControlDiscoverySession *)self->_discoverySession nativeOutputDevice];
  unsigned __int8 v13 = [v8 sortedArrayUsingComparator:&stru_10041C318];

  v73 = self;
  if (!a5) {
    goto LABEL_17;
  }
  unint64_t v14 = MRLogCategoryDiscovery();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [v13 valueForKey:@"uid"];
    id v16 = [v15 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138543362;
    id v86 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "- Selecting devices (non-default selection options) from: %{public}@", buf, 0xCu);

    id v12 = v73;
  }

  uint64_t v17 = MRLogCategoryDiscovery();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = +[NSMutableArray array];
    uint64_t v19 = v18;
    if ((a5 & 2) != 0)
    {
      [v18 addObject:@"ignoreExistingLeader"];
      if ((a5 & 4) == 0)
      {
LABEL_7:
        if ((a5 & 8) == 0) {
          goto LABEL_8;
        }
        goto LABEL_139;
      }
    }
    else if ((a5 & 4) == 0)
    {
      goto LABEL_7;
    }
    [v19 addObject:@"preferExistingConnection"];
    if ((a5 & 8) == 0)
    {
LABEL_8:
      if ((a5 & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_140;
    }
LABEL_139:
    [v19 addObject:@"preferSubscription"];
    if ((a5 & 0x10) == 0)
    {
LABEL_9:
      if ((a5 & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_141;
    }
LABEL_140:
    [v19 addObject:@"preferCloudLibrary"];
    if ((a5 & 0x20) == 0)
    {
LABEL_10:
      if ((a5 & 0x40) == 0) {
        goto LABEL_11;
      }
      goto LABEL_142;
    }
LABEL_141:
    [v19 addObject:@"preferHomePod"];
    if ((a5 & 0x40) == 0)
    {
LABEL_11:
      if ((a5 & 0x80) == 0)
      {
LABEL_13:
        uint64_t v20 = v11;
        if (![v19 count]) {
          [v19 addObject:@"none"];
        }
        uint64_t v21 = [v19 componentsJoinedByString:@", "];
        id v22 = +[NSString stringWithFormat:@"{ %@ }", v21];

        id v23 = v22;
        *(_DWORD *)buf = 138543362;
        id v86 = v23;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "- Selection options: %{public}@", buf, 0xCu);

        uint64_t v11 = v20;
        id v12 = v73;
        goto LABEL_16;
      }
LABEL_12:
      [v19 addObject:@"ignoreExisitingHosts"];
      goto LABEL_13;
    }
LABEL_142:
    [v19 addObject:@"preferAppleTV"];
    if ((a5 & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_16:

LABEL_17:
  v71 = (void *)v11;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id obj = v13;
  id v24 = [obj countByEnumeratingWithState:&v81 objects:v89 count:16];
  if (!v24)
  {
    unint64_t v26 = 0;
    __int16 v27 = 0;
    goto LABEL_106;
  }
  id v25 = v24;
  unint64_t v26 = 0;
  __int16 v27 = 0;
  uint64_t v76 = *(void *)v82;
  do
  {
    v28 = 0;
    id v74 = v25;
    do
    {
      if (*(void *)v82 != v76) {
        objc_enumerationMutation(obj);
      }
      v29 = *(void **)(*((void *)&v81 + 1) + 8 * (void)v28);
      unint64_t v30 = [v29 isAuxiliary];
      if ([v29 supportsMultiplayer]) {
        v30 |= 0x40uLL;
      }
      if ([v29 isProxyGroupPlayer]) {
        v30 |= 0x10uLL;
      }
      if ([v29 canRelayCommunicationChannel]
        && [v29 isGroupable]
        && ![v29 isLocalDevice])
      {
        v30 |= 0x80uLL;
      }
      if ([v29 isRemoteControllable]) {
        unint64_t v31 = v30 | 0x100;
      }
      else {
        unint64_t v31 = v30;
      }
      if ((a5 & 4) != 0)
      {
        v32 = [v29 uid];
        if ([(MRDHostedExternalDeviceManager *)v12->_externalDeviceManager isDirectConnectedToOutputDeviceUID:v32])
        {
          v31 |= 0x200uLL;
        }

        if ((a5 & 8) == 0)
        {
LABEL_35:
          if ((a5 & 0x10) == 0) {
            goto LABEL_36;
          }
          goto LABEL_45;
        }
      }
      else if ((a5 & 8) == 0)
      {
        goto LABEL_35;
      }
      if ([v29 canAccessAppleMusic]) {
        v31 |= 0x10000uLL;
      }
      if ((a5 & 0x10) == 0)
      {
LABEL_36:
        if ((a5 & 2) != 0) {
          goto LABEL_37;
        }
        goto LABEL_48;
      }
LABEL_45:
      if ([v29 canAccessiCloudMusicLibrary]) {
        v31 |= 0x20000uLL;
      }
      if ((a5 & 2) != 0)
      {
LABEL_37:
        if ((a5 & 0x20) == 0) {
          goto LABEL_59;
        }
        goto LABEL_55;
      }
LABEL_48:
      unsigned int v33 = [v29 isGroupLeader];
      if ([v29 supportsMultiplayer])
      {
        v34 = [v29 airPlayGroupID];
        v35 = [v29 groupID];
        v36 = v27;
        unsigned int v37 = [v34 isEqual:v35];

        v33 &= v37;
        __int16 v27 = v36;
        id v12 = v73;
        id v25 = v74;
      }
      unsigned int v38 = [v29 isRemoteControllable];
      unint64_t v39 = v31 | 0xFFFFFFFF80000000;
      if (!v33) {
        unint64_t v39 = v31;
      }
      if (v38) {
        unint64_t v31 = v39;
      }
      if ((a5 & 0x20) == 0) {
        goto LABEL_59;
      }
LABEL_55:
      if ([v29 deviceType] != 1 || objc_msgSend(v29, "deviceSubtype") != 12) {
        goto LABEL_59;
      }
      if ([v29 isB238Device])
      {
        v31 |= 0x2400uLL;
LABEL_59:
        if ((a5 & 0x40) == 0) {
          goto LABEL_63;
        }
LABEL_60:
        if ([v29 deviceType] == 1
          && [v29 deviceSubtype] == 13)
        {
          v31 |= 0x1000uLL;
        }
        goto LABEL_63;
      }
      unsigned int v49 = [v29 isB620Device];
      uint64_t v50 = 0x2000;
      if (v49) {
        uint64_t v50 = 10240;
      }
      v31 |= v50;
      if ((a5 & 0x40) != 0) {
        goto LABEL_60;
      }
LABEL_63:
      if (v31 <= v26) {
        goto LABEL_86;
      }
      if (a5)
      {
        v40 = MRLogCategoryDiscovery();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v41 = [v29 uid];
          v42 = +[NSMutableArray array];
          v43 = v42;
          if ((v31 & 0x10) != 0)
          {
            [v42 addObject:@"proxyGroupPlayer"];
            if ((v31 & 0x80) != 0) {
              goto LABEL_89;
            }
LABEL_68:
            if ((v31 & 0x100) == 0) {
              goto LABEL_69;
            }
LABEL_90:
            [v43 addObject:@"remoteControllable"];
            if ((v31 & 0x200) != 0) {
              goto LABEL_91;
            }
LABEL_70:
            if ((v31 & 0x10000) == 0) {
              goto LABEL_71;
            }
LABEL_92:
            [v43 addObject:@"appleMusicSubscription"];
            if ((v31 & 0x20000) != 0) {
LABEL_72:
            }
              [v43 addObject:@"iCloudMusicLibrary"];
          }
          else
          {
            if ((v31 & 0x80) == 0) {
              goto LABEL_68;
            }
LABEL_89:
            [v43 addObject:@"relayable"];
            if ((v31 & 0x100) != 0) {
              goto LABEL_90;
            }
LABEL_69:
            if ((v31 & 0x200) == 0) {
              goto LABEL_70;
            }
LABEL_91:
            [v43 addObject:@"existingConnection"];
            if ((v31 & 0x10000) != 0) {
              goto LABEL_92;
            }
LABEL_71:
            if ((v31 & 0x20000) != 0) {
              goto LABEL_72;
            }
          }
          if (v31 < 0xFFFFFFFF80000000)
          {
            if ((v31 & 0x2000) == 0) {
              goto LABEL_75;
            }
LABEL_95:
            [v43 addObject:@"HomePod"];
            if ((v31 & 0x1000) != 0) {
              goto LABEL_96;
            }
LABEL_76:
            if ((v31 & 0x400) == 0) {
              goto LABEL_77;
            }
LABEL_97:
            [v43 addObject:@"PreferredWireless"];
            if ((v31 & 0x800) == 0) {
              goto LABEL_79;
            }
LABEL_78:
            [v43 addObject:@"PreferredCompute"];
            goto LABEL_79;
          }
          [v43 addObject:@"existingLeader"];
          if ((v31 & 0x2000) != 0) {
            goto LABEL_95;
          }
LABEL_75:
          if ((v31 & 0x1000) == 0) {
            goto LABEL_76;
          }
LABEL_96:
          [v43 addObject:@"AppleTV"];
          if ((v31 & 0x400) != 0) {
            goto LABEL_97;
          }
LABEL_77:
          if ((v31 & 0x800) != 0) {
            goto LABEL_78;
          }
LABEL_79:
          if (v31 >= 0xFFFFFFFF80000000) {
            [v43 addObject:@"existingDesignatedLeader"];
          }
          v44 = v27;
          if (![v43 count]) {
            [v43 addObject:@"none"];
          }
          v45 = [v43 componentsJoinedByString:@", "];
          v46 = +[NSString stringWithFormat:@"{ %@ }", v45];

          id v47 = v46;
          *(_DWORD *)buf = 138543618;
          id v86 = v41;
          __int16 v87 = 2114;
          id v88 = v47;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "- Updating preferred group leader %{public}@ based on better criteria: %{public}@", buf, 0x16u);

          __int16 v27 = v44;
          id v12 = v73;
          id v25 = v74;
        }
      }
      id v48 = v29;

      unint64_t v26 = v31;
      __int16 v27 = v48;
LABEL_86:
      v28 = (char *)v28 + 1;
    }
    while (v25 != v28);
    id v51 = [obj countByEnumeratingWithState:&v81 objects:v89 count:16];
    id v25 = v51;
  }
  while (v51);
LABEL_106:

  unsigned __int8 v52 = objc_msgSend(obj, "mr_any:", &stru_10041C338);
  v53 = v27;
  unsigned __int8 v54 = v52;
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_1000EECA4;
  v77[3] = &unk_10041C360;
  id v55 = v53;
  unsigned __int8 v80 = v54;
  id v78 = v55;
  unint64_t v79 = a5;
  if (((uint64_t (*)(void *))sub_1000EECA4)(v77))
  {
    v56 = v71;
    v57 = [(NSDictionary *)v73->_hostsByGroupID objectForKeyedSubscript:v71];

    v58 = v70;
    if (v57)
    {
      id v59 = [(NSDictionary *)v73->_hostsByGroupID objectForKeyedSubscript:v71];

      v60 = MRLogCategoryDiscovery();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        v61 = [v59 uid];
        *(_DWORD *)buf = 138543362;
        id v86 = v61;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, "- Updating preferred group leader because found a remote host: %{public}@", buf, 0xCu);
      }
      goto LABEL_114;
    }
    if ([v55 shouldBeLocallyHosted])
    {
      id v59 = v70;

      v60 = MRLogCategoryDiscovery();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, "- Updating preferred group leader because locally hosting the group", buf, 2u);
      }
LABEL_114:

      id v55 = v59;
    }
  }
  else
  {
    v58 = v70;
    v56 = v71;
  }
  if (a5)
  {
    v62 = MRLogCategoryDiscovery();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      v63 = +[NSMutableArray array];
      v64 = v63;
      if ((v26 & 0x10) != 0)
      {
        [v63 addObject:@"proxyGroupPlayer"];
        if ((v26 & 0x80) != 0) {
          goto LABEL_145;
        }
LABEL_119:
        if ((v26 & 0x100) == 0) {
          goto LABEL_120;
        }
LABEL_146:
        [v64 addObject:@"remoteControllable"];
        if ((v26 & 0x200) != 0) {
          goto LABEL_147;
        }
LABEL_121:
        if ((v26 & 0x10000) == 0) {
          goto LABEL_122;
        }
LABEL_148:
        [v64 addObject:@"appleMusicSubscription"];
        if ((v26 & 0x20000) != 0) {
LABEL_123:
        }
          [v64 addObject:@"iCloudMusicLibrary"];
      }
      else
      {
        if ((v26 & 0x80) == 0) {
          goto LABEL_119;
        }
LABEL_145:
        [v64 addObject:@"relayable"];
        if ((v26 & 0x100) != 0) {
          goto LABEL_146;
        }
LABEL_120:
        if ((v26 & 0x200) == 0) {
          goto LABEL_121;
        }
LABEL_147:
        [v64 addObject:@"existingConnection"];
        if ((v26 & 0x10000) != 0) {
          goto LABEL_148;
        }
LABEL_122:
        if ((v26 & 0x20000) != 0) {
          goto LABEL_123;
        }
      }
      if (v26 < 0xFFFFFFFF80000000)
      {
        if ((v26 & 0x2000) == 0) {
          goto LABEL_126;
        }
LABEL_151:
        [v64 addObject:@"HomePod"];
        if ((v26 & 0x1000) != 0) {
          goto LABEL_152;
        }
LABEL_127:
        if ((v26 & 0x400) == 0) {
          goto LABEL_128;
        }
LABEL_153:
        [v64 addObject:@"PreferredWireless"];
        if ((v26 & 0x800) == 0) {
          goto LABEL_130;
        }
LABEL_129:
        [v64 addObject:@"PreferredCompute"];
        goto LABEL_130;
      }
      [v64 addObject:@"existingLeader"];
      if ((v26 & 0x2000) != 0) {
        goto LABEL_151;
      }
LABEL_126:
      if ((v26 & 0x1000) == 0) {
        goto LABEL_127;
      }
LABEL_152:
      [v64 addObject:@"AppleTV"];
      if ((v26 & 0x400) != 0) {
        goto LABEL_153;
      }
LABEL_128:
      if ((v26 & 0x800) != 0) {
        goto LABEL_129;
      }
LABEL_130:
      if (v26 >= 0xFFFFFFFF80000000) {
        [v64 addObject:@"existingDesignatedLeader"];
      }
      if (![v64 count]) {
        [v64 addObject:@"none"];
      }
      v65 = [v64 componentsJoinedByString:@", "];
      v66 = +[NSString stringWithFormat:@"{ %@ }", v65];

      id v67 = v66;
      *(_DWORD *)buf = 138543618;
      id v86 = v55;
      __int16 v87 = 2114;
      id v88 = v67;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "-- Final preferred group leader: %{public}@ based on criteria: %{public}@", buf, 0x16u);
    }
  }
  id v68 = v55;

  return v68;
}

- (void)_onQueue_reloadWithOutputDevices:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v32 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  unint64_t v31 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v11 = objc_alloc((Class)MRAVDistantOutputDevice);
        id v12 = [v10 descriptor];
        id v13 = [v11 initWithDescriptor:v12];

        id v14 = v13;
        uint64_t v15 = [v14 uid];
        if ([v15 length])
        {
          id v16 = [v14 groupID];
          id v17 = [v16 length];

          if (v17)
          {
            [v32 addObject:v14];
            uint64_t v18 = [v14 uid];
            [v31 setObject:v10 forKeyedSubscript:v18];
            goto LABEL_12;
          }
        }
        else
        {
        }
        uint64_t v18 = MRLogCategoryDiscovery();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v42 = v10;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Skipping invalid output device: %{public}@", buf, 0xCu);
        }
LABEL_12:
      }
      id v7 = [v5 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v7);
  }

  uint64_t v19 = [(MRDRemoteControlDiscoverySession *)self->_discoverySession unclusteredOutputDevices];
  id v20 = [v19 copy];

  uint64_t v21 = objc_msgSend(v20, "mr_map:", &stru_10041C3A0);
  id v22 = [(MRDHostedRoutingController *)self computeHostsByGroupIDForOutputDevices:v32 unclusteredDevices:v21];
  hostsByGroupID = self->_hostsByGroupID;
  self->_hostsByGroupID = v22;

  id v24 = [(MRDHostedRoutingController *)self filterOutputDevices:v32 remoteControllableOnly:0];
  objc_storeStrong((id *)&self->_distantOutputDevices, v24);
  id v25 = (NSDictionary *)[v31 copy];
  availableOutputDevices = self->_availableOutputDevices;
  self->_availableOutputDevices = v25;

  __int16 v27 = [(NSHashTable *)self->_weakObservers allObjects];
  observerCalloutQueue = self->_observerCalloutQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EF108;
  block[3] = &unk_1004159B8;
  id v34 = v27;
  v35 = self;
  id v36 = v24;
  id v29 = v24;
  id v30 = v27;
  dispatch_async((dispatch_queue_t)observerCalloutQueue, block);
}

- (void)_handleExternalDeviceConnectionStateDidChangeNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:kMRExternalDeviceConnectionStateUserInfoKey];
  unsigned int v6 = [v5 unsignedIntValue];

  if (v6 == 3)
  {
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000EF2EC;
    block[3] = &unk_100415CC8;
    void block[4] = self;
    dispatch_sync((dispatch_queue_t)serialQueue, block);
  }
}

- (void)_handleEndpointOutputDevicesDidChangeNotification:(id)a3
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EF36C;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)_handleOutputContextManagerDidReset:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EF40C;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)serialQueue, v7);
}

- (void)_processDiscoveryObserverChanges
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EF674;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)hostedExternalDeviceManagerDidUpdateExternalDeviceMapping:(id)a3
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EFB40;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)serialQueue, block);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000EFB7C;
  v5[3] = &unk_100415CC8;
  v5[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (id)computeHostsByGroupIDForOutputDevices:(id)a3 unclusteredDevices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "msv_compactMap:", &stru_10041C488);
  uint64_t v9 = +[NSSet setWithArray:v8];

  v32 = v6;
  id v30 = objc_msgSend(v6, "msv_filter:", &stru_10041C4C8);
  unint64_t v31 = v7;
  id v29 = [v30 arrayByAddingObjectsFromArray:v7];
  id v10 = objc_msgSend(v29, "msv_filter:", &stru_10041C4E8);
  id v35 = (id)objc_opt_new();
  unsigned int v33 = [(MRDeviceInfo *)self->_deviceInfo groupUID];
  id v11 = objc_msgSend(v10, "msv_firstWhere:", &stru_10041C508);
  id v12 = +[MRAVClusterController sharedController];
  LODWORD(v8) = [v12 needsCommandRedirection];

  if (v8)
  {
    id v13 = +[MRAVClusterController sharedController];
    id v14 = [v13 clusterLeaderUID];

    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1000F0084;
    v48[3] = &unk_10041C530;
    id v49 = v14;
    id v15 = v14;
    uint64_t v16 = objc_msgSend(v10, "msv_firstWhere:", v48);

    id v11 = (void *)v16;
  }
  unsigned __int8 v38 = [(MRDeviceInfo *)self->_deviceInfo effectiveParentGroupContainsDiscoverableGroupLeader];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v9;
  id v39 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v39)
  {
    id v36 = v11;
    uint64_t v37 = *(void *)v45;
    do
    {
      for (i = 0; i != v39; i = (char *)i + 1)
      {
        if (*(void *)v45 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if ((v38 & 1) != 0
          || ![v33 isEqual:*(void *)(*((void *)&v44 + 1) + 8 * i)])
        {
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          uint64_t v19 = v10;
          id v20 = v10;
          id v21 = [v20 countByEnumeratingWithState:&v40 objects:v50 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v41;
            while (2)
            {
              for (j = 0; j != v22; j = (char *)j + 1)
              {
                if (*(void *)v41 != v23) {
                  objc_enumerationMutation(v20);
                }
                id v25 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
                unint64_t v26 = [v25 baseGroupID];
                __int16 v27 = [v25 baseParentGroupID];
                if (([v27 isEqualToString:v18] & 1) == 0
                  && [v18 isEqualToString:v26])
                {
                  [v35 setObject:v25 forKeyedSubscript:v18];

                  goto LABEL_22;
                }
              }
              id v22 = [v20 countByEnumeratingWithState:&v40 objects:v50 count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }
LABEL_22:

          id v10 = v19;
          id v11 = v36;
        }
        else
        {
          [v35 setObject:v11 forKeyedSubscript:v18];
        }
      }
      id v39 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v39);
  }

  return v35;
}

- (id)resolveOutputDevices:(id)a3
{
  discoverySession = self->_discoverySession;
  id v5 = a3;
  [(MRDRemoteControlDiscoverySession *)discoverySession nativeOutputDevice];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000F0274;
  v9[3] = &unk_10041C598;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = &stru_10041C570;
  void v9[4] = self;
  id v6 = v10;
  id v7 = objc_msgSend(v5, "mr_map:", v9);

  return v7;
}

- (id)filterOutputDevices:(id)a3 remoteControllableOnly:(BOOL)a4
{
  id v6 = [(MRDHostedRoutingController *)self resolveOutputDevices:a3];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000F06B4;
  v41[3] = &unk_10041C5B8;
  BOOL v42 = a4;
  id v7 = objc_msgSend(v6, "mr_filter:", v41);

  uint64_t v8 = [(MRDeviceInfo *)self->_deviceInfo senderDefaultGroupUID];
  uint64_t v9 = +[NSMutableSet set];
  +[NSMutableArray array];
  unint64_t v31 = (void *)v8;
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v30 = v7;
    id v10 = v7;
    id v11 = [v10 countByEnumeratingWithState:&v37 objects:v44 count:16];
    if (!v11) {
      goto LABEL_16;
    }
    id v12 = v11;
    uint64_t v13 = *(void *)v38;
    while (1)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v16 = [v15 groupID];
        id v17 = [v15 parentGroupIdentifier];
        if ([v16 isEqualToString:v17]) {
          goto LABEL_13;
        }
        uint64_t v18 = [v15 parentGroupIdentifier];
        if (![v18 isEqualToString:v31]
          || ([v15 isAirPlayReceiverSessionActive] & 1) == 0)
        {

LABEL_13:
          continue;
        }
        unsigned __int8 v19 = [v15 parentGroupContainsDiscoverableLeader];

        if ((v19 & 1) == 0)
        {
          id v20 = [v15 groupID];
          [v9 addObject:v20];

          [v32 addObject:v15];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v37 objects:v44 count:16];
      if (!v12)
      {
LABEL_16:

        id v7 = v30;
        break;
      }
    }
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v21 = v7;
  id v22 = [v21 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v34;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v21);
        }
        unint64_t v26 = *(void **)(*((void *)&v33 + 1) + 8 * (void)j);
        __int16 v27 = [v26 groupID];
        unsigned __int8 v28 = [v9 containsObject:v27];

        if ((v28 & 1) == 0) {
          [v32 addObject:v26];
        }
      }
      id v23 = [v21 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v23);
  }

  return v32;
}

- (BOOL)isOutputContextInUse:(id)a3
{
  id v4 = a3;
  id v5 = [v4 contextID];
  if (v5)
  {
    id v6 = [(MRDHostedExternalDeviceManager *)self->_externalDeviceManager availableExternalDevices];
    id v7 = [v6 allKeys];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000F092C;
    v11[3] = &unk_100417F00;
    id v12 = v4;
    uint64_t v8 = objc_msgSend(v7, "msv_firstWhere:", v11);
    BOOL v9 = v8 != 0;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (MRDRemoteControlDiscoverySession)discoverySession
{
  return self->_discoverySession;
}

- (void)setDiscoverySession:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NSMutableDictionary)virtualOutputDeviceDictionary
{
  return self->_virtualOutputDeviceDictionary;
}

- (void)setVirtualOutputDeviceDictionary:(id)a3
{
}

- (MRDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_virtualOutputDeviceDictionary, 0);
  objc_storeStrong((id *)&self->_discoverySession, 0);
  objc_storeStrong((id *)&self->_externalDeviceManager, 0);
  objc_storeStrong(&self->_discoverySessionEndpointsToken, 0);
  objc_storeStrong(&self->_discoverySessionOutputDevicesToken, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);
  objc_storeStrong((id *)&self->_distantOutputDevices, 0);
  objc_storeStrong((id *)&self->_distantEndpoints, 0);
  objc_storeStrong((id *)&self->_availableOutputDevices, 0);
  objc_storeStrong((id *)&self->_availableEndpoints, 0);
  objc_storeStrong((id *)&self->_hostsByGroupID, 0);
  objc_storeStrong((id *)&self->_weakObservers, 0);
  objc_storeStrong((id *)&self->_observerCalloutQueue, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end