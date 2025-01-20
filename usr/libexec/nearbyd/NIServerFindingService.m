@interface NIServerFindingService
- (BOOL)_isAnyClientRunning;
- (BOOL)_sessionConfiguredToRange;
- (NIServerFindingService)initWithLabel:(id)a3;
- (basic_string<char,)uniqueIdentifierForEngine:(std::allocator<char>> *__return_ptr)retstr;
- (id).cxx_construct;
- (id)_getCommonConfiguration;
- (id)_startService;
- (id)addClient:(id)a3 identifier:(id)a4 configuration:(id)a5;
- (id)discoveryTokenFromIdentifier:(unint64_t)a3;
- (id)objectFromIdentifier:(unint64_t)a3;
- (int)_useCase;
- (optional<unsigned)identifierFromDiscoveryToken:(id)a3;
- (void)DataCallback:(id)a3;
- (void)_addAlgorithmOutputFlagsToPeerTrackingState:(unsigned __int8)a3;
- (void)_handleRangingTerminatedCallbackForPeer:(id)a3;
- (void)_logSessionSummary;
- (void)_logSuccessfulRange:(double)a3;
- (void)_logUnsuccessfulRange;
- (void)_pauseServiceDueToClientTimeout:(BOOL)a3;
- (void)_processUpdatedCommonConfigurationIfNecessary;
- (void)_removeAlgorithmOutputFlagsFromPeerTrackingState:(unsigned __int8)a3;
- (void)_resetServiceStateForOperation:(int)a3;
- (void)_resetUpdatesEngine;
- (void)_startAltitudeUpdates;
- (void)_startDeviceMotionUpdates;
- (void)_startDevicePDRUpdates;
- (void)_startOrUpdateAdvertising;
- (void)_tryToStartRangingWithPeerAdvertisement:(id)a3;
- (void)_updatePeerTrackingAdvertisingState:(int)a3;
- (void)_updatePeerTrackingClientWantsUpdates:(BOOL)a3;
- (void)_updatePeerTrackingDiscoveryState:(int)a3;
- (void)_updatePeerTrackingOverallState:(id)a3;
- (void)_updatePeerTrackingRangingState:(int)a3;
- (void)bluetoothDiscoveryBecameAvailable;
- (void)bluetoothDiscoveryBecameUnavailable;
- (void)bluetoothDiscoveryFinishedActivating;
- (void)clientWithIdentifier:(id)a3 updatedStateToRunning:(BOOL)a4 dueToTimeout:(BOOL)a5;
- (void)dealloc;
- (void)didAttemptRangingWithPeer:(id)a3 unsuccessfulSolution:(const void *)a4;
- (void)didDiscoverPeer:(id)a3 advertisement:(id)a4 overBluetooth:(BOOL)a5;
- (void)didGenerateAdvertisement:(id)a3 toSendOOBToPeer:(id)a4;
- (void)didLosePeer:(id)a3;
- (void)didRangeWithPeer:(id)a3 newSolution:(const void *)a4;
- (void)didRangingAuthorizationFailForPeer:(id)a3;
- (void)didReceiveRangingDataForPeer:(id)a3 algorithmAidingData:(const void *)a4 signallingData:(const void *)a5;
- (void)didStopAdvertisingToPeer:(id)a3;
- (void)didStopRangingWithPeer:(id)a3;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateHeading:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)processClientDiscoveryEventWithSharedConfigurationData:(id)a3;
- (void)processClientRemovePeerEvent;
- (void)processPeerLocation:(id)a3 forPeer:(id)a4;
- (void)processSelfHeading:(id)a3;
- (void)processSelfLocation:(id)a3;
- (void)processUpdatedConfiguration:(id)a3 forClientIdentifier:(id)a4;
- (void)processVisionInput:(id)a3;
- (void)relayInfoToNewObserver:(id)a3;
- (void)removeClientWithIdentifier:(id)a3 dueToTimeout:(BOOL)a4;
- (void)updatesEngine:(id)a3 didUpdateAlgorithmConvergenceState:(id)a4 forObject:(id)a5;
- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4;
@end

@implementation NIServerFindingService

- (NIServerFindingService)initWithLabel:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NIServerFindingService;
  v5 = [(NIServerFindingService *)&v29 init];
  if (v5)
  {
    v6 = (const char *)[v4 cStringUsingEncoding:4];
    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -2);
    dispatch_queue_t v8 = dispatch_queue_create(v6, v7);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = objc_opt_new();
    serviceIdentifier = v5->_serviceIdentifier;
    v5->_serviceIdentifier = (NSUUID *)v10;

    uint64_t v12 = objc_opt_new();
    algorithmsIdentifier = v5->_algorithmsIdentifier;
    v5->_algorithmsIdentifier = (NSUUID *)v12;

    uint64_t v14 = +[NSMapTable strongToWeakObjectsMapTable];
    findingClients = v5->_findingClients;
    v5->_findingClients = (NSMapTable *)v14;

    uint64_t v16 = objc_opt_new();
    findingConfigurations = v5->_findingConfigurations;
    v5->_findingConfigurations = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_opt_new();
    clientRunStates = v5->_clientRunStates;
    v5->_clientRunStates = (NSMutableDictionary *)v18;

    v5->_serviceState = 0;
    uint64_t v20 = objc_opt_new();
    sessionSummary = v5->_sessionSummary;
    v5->_sessionSummary = (NSMutableDictionary *)v20;

    findingToken = v5->_findingToken;
    v5->_findingToken = 0;

    configuration = v5->_configuration;
    v5->_configuration = 0;

    v24 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v5->_serviceIdentifier;
      *(_DWORD *)buf = 138543362;
      v31 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#find-ses,Service initialized (%{public}@)", buf, 0xCu);
    }
    v26 = [[DetailsViewAnalytics alloc] initWithCurrentTime:sub_100006C38()];
    detailsViewAnalytics = v5->_detailsViewAnalytics;
    v5->_detailsViewAnalytics = v26;
  }
  return v5;
}

- (void)dealloc
{
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    serviceIdentifier = self->_serviceIdentifier;
    *(_DWORD *)buf = 138543362;
    v7 = serviceIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-ses,Service deallocated (%{public}@)", buf, 0xCu);
  }
  v5.receiver = self;
  v5.super_class = (Class)NIServerFindingService;
  [(NIServerFindingService *)&v5 dealloc];
}

- (id)addClient:(id)a3 identifier:(id)a4 configuration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = sub_1002108C4;
    v24 = sub_1002108D4;
    id v25 = 0;
    queue = self->_queue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1002108DC;
    v15[3] = &unk_10085A4E8;
    v15[4] = self;
    id v16 = v9;
    id v17 = v8;
    id v18 = v10;
    v19 = &v20;
    dispatch_sync((dispatch_queue_t)queue, v15);
    id v12 = (id)v21[5];

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    NSErrorUserInfoKey v26 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v27 = @"Finding Service Client can't be nil";
    v13 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    id v12 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v13];
  }

  return v12;
}

- (void)clientWithIdentifier:(id)a3 updatedStateToRunning:(BOOL)a4 dueToTimeout:(BOOL)a5
{
  id v8 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100210C9C;
  block[3] = &unk_10085A510;
  id v12 = v8;
  v13 = self;
  BOOL v14 = a4;
  BOOL v15 = a5;
  id v10 = v8;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)removeClientWithIdentifier:(id)a3 dueToTimeout:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100210F88;
  block[3] = &unk_100856158;
  id v10 = v6;
  v11 = self;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)relayInfoToNewObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002112A4;
  v7[3] = &unk_100846588;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (void)processUpdatedConfiguration:(id)a3 forClientIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100211464;
  block[3] = &unk_100855EB0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)processVisionInput:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100211540;
  v7[3] = &unk_100846588;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (void)processClientDiscoveryEventWithSharedConfigurationData:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NIServerFindingAdvertisement advertisementFromByteRepresentation:v4];
  id v6 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(NIDiscoveryToken *)self->_findingToken descriptionInternal];
    *(_DWORD *)buf = 138478083;
    id v12 = v7;
    __int16 v13 = 2113;
    BOOL v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#find-ses,Service processClientDiscoveryEvent [%{private}@]. Adv: %{private}@", buf, 0x16u);
  }
  if (v5)
  {
    queue = self->_queue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10021175C;
    v9[3] = &unk_100846588;
    v9[4] = self;
    id v10 = v5;
    dispatch_sync((dispatch_queue_t)queue, v9);
  }
}

- (void)processClientRemovePeerEvent
{
  v3 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(NIDiscoveryToken *)self->_findingToken descriptionInternal];
    *(_DWORD *)buf = 138477827;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-ses,Service processClientRemovePeerEvent [%{private}@]", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002118C8;
  block[3] = &unk_1008473B0;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)processSelfLocation:(id)a3
{
  id v4 = a3;
  objc_super v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [(NIDiscoveryToken *)self->_findingToken descriptionInternal];
    sub_10041F9BC(v6, (uint64_t)v4, (uint64_t)v11);
  }

  if (!self->_enableLocalLocationManager)
  {
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100211A28;
    v8[3] = &unk_100846588;
    id v9 = v4;
    id v10 = self;
    dispatch_sync((dispatch_queue_t)queue, v8);
  }
}

- (void)processSelfHeading:(id)a3
{
  id v4 = a3;
  objc_super v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [(NIDiscoveryToken *)self->_findingToken descriptionInternal];
    sub_10041FA14(v6, (uint64_t)v4, (uint64_t)v11);
  }

  if (!self->_enableLocalLocationManager)
  {
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100211CA8;
    v8[3] = &unk_100846588;
    id v9 = v4;
    id v10 = self;
    dispatch_sync((dispatch_queue_t)queue, v8);
  }
}

- (void)processPeerLocation:(id)a3 forPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v12 = [(NIDiscoveryToken *)self->_findingToken descriptionInternal];
    *(_DWORD *)buf = 138478339;
    id v18 = v12;
    __int16 v19 = 2113;
    id v20 = v7;
    __int16 v21 = 2113;
    id v22 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "#find-ses,Service processPeerLocationForPeer [%{private}@]: %{private}@. Location: %{private}@", buf, 0x20u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100211EE8;
  block[3] = &unk_100855EB0;
  id v14 = v6;
  BOOL v15 = self;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (id)_startService
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_pauseDelayTimer)
  {
    v3 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(NIDiscoveryToken *)self->_findingToken descriptionInternal];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-ses,Service [%{public}@] canceled pending pause", buf, 0xCu);
    }
    dispatch_source_cancel((dispatch_source_t)self->_pauseDelayTimer);
    pauseDelayTimer = self->_pauseDelayTimer;
    self->_pauseDelayTimer = 0;
  }
  if (self->_serviceState)
  {
    id v6 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = sub_1002E0FD8((uint64_t)"SessionResumed", 1, self->_findingToken, 0);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);
    }
    id v8 = +[NIServerFindingServicePool sharedInstance];
    id v9 = [(NIDiscoveryToken *)self->_findingToken descriptionInternal];
    id v10 = +[NSString stringWithFormat:@"%@: SessionResumed", v9];
    [v8 logSessionEvent:v10];

    id v11 = +[NSDate now];
    [(NSMutableDictionary *)self->_sessionSummary setObject:v11 forKeyedSubscript:@"[A2|SES] Resum"];
  }
  else
  {
    id v12 = [(NIServerFindingService *)self _getCommonConfiguration];
    configuration = self->_configuration;
    self->_configuration = v12;

    id v14 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      findingToken = self->_findingToken;
      id v16 = +[NSString stringWithFormat:@"Cfg: %@", self->_configuration];
      id v17 = sub_1002E0FD8((uint64_t)"SessionStarted", 1, findingToken, v16);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);
    }
    id v18 = +[NIServerFindingServicePool sharedInstance];
    __int16 v19 = [(NIDiscoveryToken *)self->_findingToken descriptionInternal];
    id v20 = +[NSString stringWithFormat:@"%@: SessionStarted", v19];
    [v18 logSessionEvent:v20];

    id v11 = +[NSDate now];
    [(NSMutableDictionary *)self->_sessionSummary setObject:v11 forKeyedSubscript:@"[A1|SES] Start"];
  }

  [(DetailsViewAnalytics *)self->_detailsViewAnalytics setEnteredFromActiveFindingUI:(id)[(NIFindingConfiguration *)self->_configuration preferredUpdateRate] == (id)2];
  __int16 v21 = [(NIFindingConfiguration *)self->_configuration debugParameters];
  id v22 = [v21 objectForKey:@"DisableBTDiscovery"];
  unsigned int v23 = [v22 BOOLValue];

  if (v23)
  {
    v24 = qword_1008ABDE0;
    uint64_t v25 = 0;
    if (!os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    NSErrorUserInfoKey v26 = "#find-ses,Debug configuration enabled to disable BT discovery";
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v26, buf, 2u);
    uint64_t v25 = 0;
    goto LABEL_20;
  }
  CFStringRef v27 = +[NSUserDefaults standardUserDefaults];
  unsigned int v28 = [v27 BOOLForKey:@"FindingSessionDisableBTDiscovery"];

  if (v28)
  {
    v24 = qword_1008ABDE0;
    uint64_t v25 = 0;
    if (!os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    NSErrorUserInfoKey v26 = "#find-ses,Defaults write to disable BT discovery";
    goto LABEL_18;
  }
  uint64_t v25 = 1;
LABEL_20:
  double v29 = sub_1002E0CF8(@"FindingBTDiscoveryTimeoutSecondsOverride", 120.0);
  v30 = [NIServerFindingDiscoveryProvider alloc];
  id v31 = [(NSUUID *)self->_serviceIdentifier UUIDString];
  sub_100004950(buf, (char *)[v31 UTF8String]);
  v32 = [(NIServerFindingDiscoveryProvider *)v30 initWithIdentifier:buf isFinder:1 enableBluetooth:v25 launchOnDemand:0 scanRate:50 discoveryTimeout:self oobRefreshPeriod:v29 consumer:sub_1002E0CA4([(NIServerFindingService *)self _useCase]) queue:self->_queue];
  discoveryProvider = self->_discoveryProvider;
  self->_discoveryProvider = v32;

  if ((char)buf[23] < 0) {
    operator delete(*(void **)buf);
  }

  v34 = [NIServerFindingRangingProvider alloc];
  id v35 = [(NSUUID *)self->_serviceIdentifier UUIDString];
  sub_100004950(buf, (char *)[v35 UTF8String]);
  queue = self->_queue;
  uint64_t v95 = 0;
  v96 = 0;
  v37 = [(NIServerFindingRangingProvider *)v34 initWithIdentifier:buf isFinder:1 consumer:self queue:queue pbLogger:&v95];
  rangingProvider = self->_rangingProvider;
  self->_rangingProvider = v37;

  if (v96) {
    sub_10001A970(v96);
  }
  if ((char)buf[23] < 0) {
    operator delete(*(void **)buf);
  }

  v39 = self->_discoveryProvider;
  if (v39 && self->_rangingProvider)
  {
    [(NIServerFindingDiscoveryProvider *)v39 activate];
    [(NIServerFindingRangingProvider *)self->_rangingProvider activate];
    v40 = self->_rangingProvider;
    v41 = [(NIFindingConfiguration *)self->_configuration debugParameters];
    [(NIServerFindingRangingProvider *)v40 setDebugParameters:v41];

    v42 = +[NIServerFindingPeerTracking peerTrackingInitialState];
    peerTracking = self->_peerTracking;
    self->_peerTracking = v42;

    [(NIServerFindingService *)self _updatePeerTrackingClientWantsUpdates:(id)[(NIFindingConfiguration *)self->_configuration preferredUpdateRate] != (id)3];
    v44 = +[NSUserDefaults standardUserDefaults];
    self->_BOOL enableDeviceFinding = [v44 BOOLForKey:@"EnableDeviceFindingOnPhone"];

    v45 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      BOOL enableDeviceFinding = self->_enableDeviceFinding;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = enableDeviceFinding;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "#find-ses,For rdar://102527413 (Test hook to use Wenda arrow interface on phone), enabling device finding on phone, %d", buf, 8u);
    }

    [(NIServerFindingService *)self _resetUpdatesEngine];
    self->_cachedSolutionMacAddr = 0;
    self->_lastLogMachContTime = 0.0;
    v47 = self->_discoveryProvider;
    v48 = +[NSSet setWithObject:self->_findingToken];
    id v49 = [(NIServerFindingDiscoveryProvider *)v47 setPeersEligibleForDiscovery:v48 requestScan:1];

    unsigned int v50 = [(NIServerFindingRangingProvider *)self->_rangingProvider rangingTriggerType];
    v51 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = v50 ? "TriggerRequired" : "NoTriggerRequired";
      sub_100004950(buf, v52);
      v53 = (buf[23] & 0x80u) == 0 ? buf : *(uint8_t **)buf;
      *(_DWORD *)v97 = 136315138;
      v98 = v53;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "#find-ses,ranging trigger type = %s", v97, 0xCu);
      if ((char)buf[23] < 0) {
        operator delete(*(void **)buf);
      }
    }

    if (!v50)
    {
      v54 = [NIServerFindingAdvertisement alloc];
      *(_WORD *)&uint8_t buf[4] = 0;
      *(_DWORD *)buf = 0;
      id v55 = [(NIServerFindingAdvertisement *)v54 initForFinder:0 address:buf];
      [v55 setCanRange:1];
      v56 = self->_rangingProvider;
      if (v56) {
        [(NIServerFindingRangingProvider *)v56 supportedTechnologies];
      }
      else {
        memset(buf, 0, sizeof(buf));
      }
      BOOL v60 = sub_1002E1AE8(buf, 1);
      __p = 0;
      v93 = 0;
      v94 = 0;
      v61 = operator new(4uLL);
      if (v60) {
        int v62 = 1;
      }
      else {
        int v62 = 2;
      }
      __p = v61;
      _DWORD *v61 = v62;
      v93 = v61 + 1;
      v94 = v61 + 1;
      [v55 setSupportedTechnologies:&__p];
      if (__p)
      {
        v93 = __p;
        operator delete(__p);
      }
      if (*(void *)buf)
      {
        *(void *)&buf[8] = *(void *)buf;
        operator delete(*(void **)buf);
      }
      [v55 setProtocolVersion:1];
      v63 = sub_1002F6464();
      uint64_t v64 = *((void *)v63 + 406);
      v65 = (std::__shared_weak_count *)*((void *)v63 + 407);
      if (v65) {
        atomic_fetch_add_explicit(&v65->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      sub_1002CE8FC(v64);
      [v55 setNarrowBandMask:sub_1003A8B68((unsigned __int8 **)v91)];
      if (v91[0])
      {
        v91[1] = v91[0];
        operator delete(v91[0]);
      }
      if (v65) {
        sub_10001A970(v65);
      }
      [(NIServerFindingService *)self _updatePeerTrackingDiscoveryState:2];
      [(NIServerFindingService *)self _tryToStartRangingWithPeerAdvertisement:v55];
    }
    [(NIServerFindingService *)self _startOrUpdateAdvertising];
    v66 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    motionUpdateOpQueue = self->_motionUpdateOpQueue;
    self->_motionUpdateOpQueue = v66;

    [(NSOperationQueue *)self->_motionUpdateOpQueue setUnderlyingQueue:self->_queue];
    v68 = sub_100007D00();
    if (sub_10039CF54(v68[144]) || (v69 = sub_100007D00(), sub_100005424(v69[144])) || self->_enableDeviceFinding)
    {
      v70 = (CMMotionManager *)objc_alloc_init((Class)CMMotionManager);
      motionManager = self->_motionManager;
      self->_motionManager = v70;

      v72 = self->_motionManager;
      if (v72)
      {
        [(CMMotionManager *)v72 setDeviceMotionUpdateInterval:0.01];
        [(NIServerFindingService *)self _startDeviceMotionUpdates];
      }
    }
    v73 = (CMAltimeter *)objc_alloc_init((Class)CMAltimeter);
    altimeterManager = self->_altimeterManager;
    self->_altimeterManager = v73;

    if (self->_altimeterManager)
    {
      [(NIServerFindingService *)self _startAltitudeUpdates];
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT))
    {
      sub_10041FB30();
    }
    v75 = (CMOdometryManager *)objc_alloc_init((Class)CMOdometryManager);
    pdrManager = self->_pdrManager;
    self->_pdrManager = v75;

    if (self->_pdrManager)
    {
      [(NIServerFindingService *)self _startDevicePDRUpdates];
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
    {
      sub_10041FAFC();
    }
    id v90 = 0;
    unsigned int v77 = +[CLLocationManager _checkAndExerciseAuthorizationForBundleID:@"com.apple.findmy" error:&v90];
    id v58 = v90;
    if (v58)
    {
      v78 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = @"com.apple.findmy";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v58;
        _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "#find-ses,Authorization error for %{public}@,error,%{public}@", buf, 0x16u);
      }
    }
    v79 = +[NSUserDefaults standardUserDefaults];
    unsigned int v80 = [v79 BOOLForKey:@"FindingSessionDisableLocationManagerWorkaround_r108262579"];

    self->_BOOL enableLocalLocationManager = v77 & (v80 ^ 1);
    v81 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      BOOL enableLocalLocationManager = self->_enableLocalLocationManager;
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)&uint8_t buf[4] = v77;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v80;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = enableLocalLocationManager;
      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "#find-ses,findMyAppIsAuthorizedForLocations,%d,FindingSessionDisableLocationManagerWorkaround_r108262579,%d,enableLocalLocationManager,%d", buf, 0x14u);
    }

    if (self->_enableLocalLocationManager)
    {
      v83 = sub_100007D00();
      if (sub_100005424(v83[144]))
      {
        v84 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "#find-ses,Using a temporary location manager until rdar://107853227 lands", buf, 2u);
        }
        v85 = (CLLocationManager *)[objc_alloc((Class)CLLocationManager) initWithEffectiveBundleIdentifier:@"com.apple.findmy" delegate:self onQueue:self->_queue];
        locationManager = self->_locationManager;
        self->_locationManager = v85;

        [(CLLocationManager *)self->_locationManager setActivityType:3];
        [(CLLocationManager *)self->_locationManager setDistanceFilter:kCLDistanceFilterNone];
        [(CLLocationManager *)self->_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        [(CLLocationManager *)self->_locationManager setHeadingFilter:kCLHeadingFilterNone];
        [(CLLocationManager *)self->_locationManager setDelegate:self];
        [(CLLocationManager *)self->_locationManager startUpdatingLocation];
        [(CLLocationManager *)self->_locationManager startUpdatingHeading];
      }
    }
    if (!self->_gnssExtensionsManager)
    {
      v87 = [[NIGnssExtensionsManager alloc] initWithQueue:self->_queue bundleId:@"com.apple.findmy" reason:@"NIServerFindingService"];
      gnssExtensionsManager = self->_gnssExtensionsManager;
      self->_gnssExtensionsManager = v87;

      [(NIGnssExtensionsManager *)self->_gnssExtensionsManager setDelegate:self];
    }
    [(NIServerAnalyticsManager *)self->_analyticsManager sessionSuccessfullyRanWithConfig:self->_configuration withTimestamp:sub_100006C38()];
    self->_serviceState = 1;
    v59 = 0;
    self->_serviceStartTimeSeconds = sub_100006C38();
  }
  else
  {
    v57 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041FA6C((uint64_t)self, (uint64_t *)&self->_configuration, v57);
    }
    NSErrorUserInfoKey v99 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v100 = @"Providers could not be initialized ";
    id v58 = +[NSDictionary dictionaryWithObjects:&v100 forKeys:&v99 count:1];
    v59 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v58];
  }

  return v59;
}

- (void)_pauseServiceDueToClientTimeout:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v3)
  {
    objc_super v5 = self;
    uint64_t v6 = 1;
LABEL_5:
    [(NIServerFindingService *)v5 _resetServiceStateForOperation:v6];
    return;
  }
  id v7 = +[NSUserDefaults standardUserDefaults];
  unsigned int v8 = [v7 BOOLForKey:@"FindingDisableServicePauseDelay"];

  if (v8)
  {
    objc_super v5 = self;
    uint64_t v6 = 0;
    goto LABEL_5;
  }
  if (!self->_pauseDelayTimer)
  {
    id v9 = +[NSUserDefaults standardUserDefaults];
    id v10 = [v9 objectForKey:@"FindingServicePauseDelayOverrideSeconds"];
    int64_t v11 = 1000000000;

    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v10 doubleValue];
        double v13 = v12;
        id v14 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          double v24 = v13;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#find-ses,Pause delay override: %0.1f s", buf, 0xCu);
        }
        int64_t v11 = (unint64_t)(v13 * 1000000000.0);
      }
    }
    BOOL v15 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    p_pauseDelayTimer = &self->_pauseDelayTimer;
    pauseDelayTimer = self->_pauseDelayTimer;
    self->_pauseDelayTimer = v15;

    id v18 = self->_pauseDelayTimer;
    dispatch_time_t v19 = dispatch_time(0, v11);
    dispatch_source_set_timer((dispatch_source_t)v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    objc_initWeak((id *)buf, self);
    id v20 = self->_pauseDelayTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1002131B8;
    handler[3] = &unk_1008460E8;
    objc_copyWeak(&v22, (id *)buf);
    dispatch_source_set_event_handler((dispatch_source_t)v20, handler);
    dispatch_resume((dispatch_object_t)*p_pauseDelayTimer);
    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_processUpdatedCommonConfigurationIfNecessary
{
  if (self->_serviceState == 1)
  {
    BOOL v3 = [(NIServerFindingService *)self _getCommonConfiguration];
    p_configuration = &self->_configuration;
    if (![(NIFindingConfiguration *)self->_configuration isEqual:v3])
    {
      objc_super v5 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        findingToken = self->_findingToken;
        id v7 = +[NSString stringWithFormat:@"Old: %@. New: %@", self->_configuration, v3];
        unsigned int v8 = sub_1002E0FD8((uint64_t)"UpdateConfig", 1, findingToken, v7);
        *(_DWORD *)buf = 138543362;
        double v12 = v8;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);
      }
      objc_storeStrong((id *)&self->_configuration, v3);
      [(NIServerFindingService *)self _updatePeerTrackingClientWantsUpdates:(id)[(NIFindingConfiguration *)*p_configuration preferredUpdateRate] != (id)3];
      if ((id)[(NIFindingConfiguration *)*p_configuration preferredUpdateRate] == (id)3) {
        [(NIServerFindingService *)self _resetUpdatesEngine];
      }
      [(NIServerFindingService *)self _startOrUpdateAdvertising];
      id v9 = [(NIServerFindingDiscoveryProvider *)self->_discoveryProvider discoveredPeers];
      id v10 = [v9 objectForKey:self->_findingToken];

      if (v10) {
        [(NIServerFindingService *)self _tryToStartRangingWithPeerAdvertisement:v10];
      }
    }
  }
}

- (id)_getCommonConfiguration
{
  BOOL v3 = [[NIFindingConfiguration alloc] initWithRole:0 discoveryToken:self->_findingToken preferredUpdateRate:3];
  id v4 = [(NSMutableDictionary *)self->_findingConfigurations objectEnumerator];
  objc_super v5 = 0;
  while (1)
  {
    uint64_t v6 = [v4 nextObject];

    if (!v6) {
      break;
    }
    if ([v6 preferredUpdateRate] != (id)3) {
      [(NIFindingConfiguration *)v3 setPreferredUpdateRate:2];
    }
    id v7 = [v6 debugParameters];

    objc_super v5 = v6;
    if (v7)
    {
      unsigned int v8 = [v6 debugParameters];
      [(NIFindingConfiguration *)v3 setDebugParameters:v8];

      objc_super v5 = v6;
    }
  }
  [(NIFindingConfiguration *)v3 setCameraAssistanceEnabled:+[NIPlatformInfo supportsSyntheticAperture]];

  return v3;
}

- (int)_useCase
{
  v2 = sub_100007D00();
  return !sub_100005424(v2[144]);
}

- (BOOL)_isAnyClientRunning
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  clientRunStates = self->_clientRunStates;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100213688;
  v5[3] = &unk_100859310;
  v5[4] = &v6;
  [(NSMutableDictionary *)clientRunStates enumerateKeysAndObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_resetServiceStateForOperation:(int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  pauseDelayTimer = self->_pauseDelayTimer;
  if (pauseDelayTimer)
  {
    dispatch_source_cancel((dispatch_source_t)pauseDelayTimer);
    uint64_t v6 = self->_pauseDelayTimer;
    self->_pauseDelayTimer = 0;
  }
  if ((a3 - 2) >= 2)
  {
    if (a3 == 1)
    {
      [(NIServerFindingService *)self _removeAlgorithmOutputFlagsFromPeerTrackingState:255];
      dispatch_time_t v19 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = sub_1002E0FD8((uint64_t)"SessionTimeout", 1, self->_findingToken, 0);
        *(_DWORD *)buf = 138543362;
        v51 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);
      }
      __int16 v21 = +[NIServerFindingServicePool sharedInstance];
      id v22 = [(NIDiscoveryToken *)self->_findingToken descriptionInternal];
      unsigned int v23 = +[NSString stringWithFormat:@"%@: SessionTimeout", v22];
      [v21 logSessionEvent:v23];

      double v24 = +[NSDate now];
      [(NSMutableDictionary *)self->_sessionSummary setObject:v24 forKeyedSubscript:@"[A4|SES] T/out"];
    }
    else
    {
      [(NIServerFindingService *)self _removeAlgorithmOutputFlagsFromPeerTrackingState:255];
      uint64_t v25 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        NSErrorUserInfoKey v26 = sub_1002E0FD8((uint64_t)"SessionPaused", 1, self->_findingToken, 0);
        *(_DWORD *)buf = 138543362;
        v51 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);
      }
      CFStringRef v27 = +[NIServerFindingServicePool sharedInstance];
      unsigned int v28 = [(NIDiscoveryToken *)self->_findingToken descriptionInternal];
      double v29 = +[NSString stringWithFormat:@"%@: SessionPaused", v28];
      [v27 logSessionEvent:v29];

      double v24 = +[NSDate now];
      [(NSMutableDictionary *)self->_sessionSummary setObject:v24 forKeyedSubscript:@"[A3|SES] Pause"];
    }

    [(NIServerFindingService *)self _logSessionSummary];
    [(DetailsViewAnalytics *)self->_detailsViewAnalytics submitAnalytics];
    self->_serviceState = 2;
  }
  else
  {
    [(NIServerFindingService *)self _removeAlgorithmOutputFlagsFromPeerTrackingState:255];
    if (self->_findingToken)
    {
      id v7 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = sub_1002E0FD8((uint64_t)"SessionStopped", 1, self->_findingToken, 0);
        *(_DWORD *)buf = 138543362;
        v51 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);
      }
      char v9 = +[NIServerFindingServicePool sharedInstance];
      id v10 = [(NIDiscoveryToken *)self->_findingToken descriptionInternal];
      int64_t v11 = +[NSString stringWithFormat:@"%@: SessionStopped", v10];
      [v9 logSessionEvent:v11];

      double v12 = +[NSDate now];
      [(NSMutableDictionary *)self->_sessionSummary setObject:v12 forKeyedSubscript:@"[A5|SES] Stop "];

      double v13 = [[NINearbyObject alloc] initWithToken:self->_findingToken];
      id v14 = +[NIServerFindingServiceObserverRelay sharedInstance];
      findingToken = self->_findingToken;
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_100213D78;
      v48[3] = &unk_10085A538;
      id v16 = v13;
      id v49 = v16;
      [v14 relayToObserversForToken:findingToken blockToRelay:v48];
    }
    [(NIServerFindingService *)self _logSessionSummary];
    [(DetailsViewAnalytics *)self->_detailsViewAnalytics submitAnalytics];
    configuration = self->_configuration;
    self->_configuration = 0;

    id v18 = self->_findingToken;
    self->_findingToken = 0;

    self->_serviceState = 0;
    [(NSMapTable *)self->_findingClients removeAllObjects];
    [(NSMutableDictionary *)self->_findingConfigurations removeAllObjects];
    [(NSMutableDictionary *)self->_clientRunStates removeAllObjects];
  }
  v30 = (NSMutableDictionary *)objc_opt_new();
  sessionSummary = self->_sessionSummary;
  self->_sessionSummary = v30;

  [(NIServerFindingDiscoveryProvider *)self->_discoveryProvider invalidate];
  discoveryProvider = self->_discoveryProvider;
  self->_discoveryProvider = 0;

  [(NIServerFindingRangingProvider *)self->_rangingProvider invalidate];
  rangingProvider = self->_rangingProvider;
  self->_rangingProvider = 0;

  [(NINearbyUpdatesEngine *)self->_updatesEngine invalidate];
  updatesEngine = self->_updatesEngine;
  self->_updatesEngine = 0;

  analyticsManager = self->_analyticsManager;
  self->_analyticsManager = 0;

  peerTracking = self->_peerTracking;
  self->_peerTracking = 0;

  self->_cachedSolutionMacAddr = 0;
  self->_lastLogMachContTime = 0.0;
  cachedVisionInput = self->_cachedVisionInput;
  self->_cachedVisionInput = 0;

  motionManager = self->_motionManager;
  if (motionManager)
  {
    [(CMMotionManager *)motionManager stopDeviceMotionUpdates];
    v39 = self->_motionManager;
    self->_motionManager = 0;
  }
  altimeterManager = self->_altimeterManager;
  if (altimeterManager)
  {
    [(CMAltimeter *)altimeterManager stopRelativeAltitudeUpdates];
    v41 = self->_altimeterManager;
    self->_altimeterManager = 0;
  }
  pdrManager = self->_pdrManager;
  if (pdrManager)
  {
    [(CMOdometryManager *)pdrManager stopOdometryUpdates];
    v43 = self->_pdrManager;
    self->_pdrManager = 0;
  }
  locationManager = self->_locationManager;
  if (locationManager)
  {
    [(CLLocationManager *)locationManager stopUpdatingLocation];
    [(CLLocationManager *)self->_locationManager stopUpdatingHeading];
    v45 = self->_locationManager;
    self->_locationManager = 0;
  }
  gnssExtensionsManager = self->_gnssExtensionsManager;
  if (gnssExtensionsManager)
  {
    [(NIGnssExtensionsManager *)gnssExtensionsManager invalidate];
    v47 = self->_gnssExtensionsManager;
    self->_gnssExtensionsManager = 0;
  }
}

- (void)_logSessionSummary
{
  p_sessionSummary = &self->_sessionSummary;
  id v4 = [(NSMutableDictionary *)self->_sessionSummary objectForKeyedSubscript:@"[A1|SES] Start"];

  if (v4) {
    CFStringRef v5 = @"[A1|SES] Start";
  }
  else {
    CFStringRef v5 = @"[A2|SES] Resum";
  }
  uint64_t v6 = [(NSMutableDictionary *)*p_sessionSummary objectForKeyedSubscript:v5];
  id v7 = v6;
  if (v6)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100214108;
    v18[3] = &unk_10085A560;
    v18[4] = self;
    id v19 = v6;
    [&off_100878B50 enumerateKeysAndObjectsUsingBlock:v18];
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100214208;
  v17[3] = &unk_100857048;
  v17[4] = self;
  [&off_100878520 enumerateObjectsUsingBlock:v17];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1002142E0;
  v16[3] = &unk_100857048;
  v16[4] = self;
  [&off_100878538 enumerateObjectsUsingBlock:v16];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002143D4;
  v15[3] = &unk_100857048;
  v15[4] = self;
  [&off_100878550 enumerateObjectsUsingBlock:v15];
  uint64_t v8 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    findingToken = self->_findingToken;
    id v10 = +[NSString stringWithFormat:@"Summary: %@", self->_sessionSummary];
    int64_t v11 = sub_1002E0FD8((uint64_t)"SessionSummary", 1, findingToken, v10);
    *(_DWORD *)buf = 138543362;
    __int16 v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);
  }
  double v12 = +[NIServerFindingServicePool sharedInstance];
  double v13 = [(NIDiscoveryToken *)self->_findingToken descriptionInternal];
  id v14 = +[NSString stringWithFormat:@"%@\n%@", v13, self->_sessionSummary];
  [v12 logSessionSummary:v14];
}

- (void)_resetUpdatesEngine
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  updatesEngine = self->_updatesEngine;
  if (updatesEngine)
  {
    [(NINearbyUpdatesEngine *)updatesEngine invalidate];
    id v4 = self->_updatesEngine;
  }
  else
  {
    id v4 = 0;
  }
  self->_updatesEngine = 0;

  analyticsManager = self->_analyticsManager;
  self->_analyticsManager = 0;

  [(NIServerFindingService *)self _removeAlgorithmOutputFlagsFromPeerTrackingState:255];
  uint64_t v6 = sub_100007D00();
  BOOL v7 = sub_100005424(v6[144]);
  uint64_t v8 = [NIServerAnalyticsManager alloc];
  if (v7) {
    CFStringRef v9 = @"com.apple.findmy";
  }
  else {
    CFStringRef v9 = @"com.apple.NanoSettingsViewService";
  }
  id v10 = [(NIServerAnalyticsManager *)v8 initWithBundleIdentifier:v9];
  int64_t v11 = self->_analyticsManager;
  self->_analyticsManager = v10;

  double v12 = (NSUUID *)objc_opt_new();
  algorithmsIdentifier = self->_algorithmsIdentifier;
  self->_algorithmsIdentifier = v12;

  id v14 = [NINearbyUpdatesEngine alloc];
  configuration = self->_configuration;
  queue = self->_queue;
  id v17 = self->_analyticsManager;
  id v18 = sub_1002F6464();
  id v19 = (std::__shared_weak_count *)*((void *)v18 + 21);
  uint64_t v24 = *((void *)v18 + 20);
  uint64_t v25 = v19;
  if (v19) {
    atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v23 = 0;
  id v20 = [(NINearbyUpdatesEngine *)v14 initWithConfiguration:configuration queue:queue delegate:self dataSource:self analyticsManager:v17 protobufLogger:&v24 error:&v23];
  id v21 = v23;
  id v22 = self->_updatesEngine;
  self->_updatesEngine = v20;

  if (v25) {
    sub_10001A970(v25);
  }
  if (v21 && os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
    sub_10041FB70();
  }
}

- (void)_startDeviceMotionUpdates
{
  objc_initWeak(&location, self);
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  uint64_t v6 = sub_10021474C;
  BOOL v7 = &unk_100859198;
  objc_copyWeak(&v8, &location);
  char v3 = objc_retainBlock(&v4);
  -[CMMotionManager startDeviceMotionUpdatesToQueue:withHandler:](self->_motionManager, "startDeviceMotionUpdatesToQueue:withHandler:", self->_motionUpdateOpQueue, v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_startAltitudeUpdates
{
  objc_initWeak(&location, self);
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  uint64_t v6 = sub_100214B90;
  BOOL v7 = &unk_100859030;
  objc_copyWeak(&v8, &location);
  char v3 = objc_retainBlock(&v4);
  -[CMAltimeter startRelativeAltitudeUpdatesToQueue:withHandler:](self->_altimeterManager, "startRelativeAltitudeUpdatesToQueue:withHandler:", self->_motionUpdateOpQueue, v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_startDevicePDRUpdates
{
  objc_initWeak(&location, self);
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  uint64_t v6 = sub_100214DD0;
  BOOL v7 = &unk_100859150;
  objc_copyWeak(&v8, &location);
  char v3 = objc_retainBlock(&v4);
  -[CMOdometryManager setOdometryUpdateInterval:](self->_pdrManager, "setOdometryUpdateInterval:", 0.1, v4, v5, v6, v7);
  [(CMOdometryManager *)self->_pdrManager startOdometryUpdatesToQueue:self->_motionUpdateOpQueue withHandler:v3];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)didDiscoverPeer:(id)a3 advertisement:(id)a4 overBluetooth:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NIDiscoveryToken *)self->_findingToken isEqual:v8])
  {
    id v10 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      findingToken = self->_findingToken;
      double v12 = +[NSString stringWithFormat:@"BT: %d. PeerAdv: %@", v5, v9];
      double v13 = sub_1002E0FD8((uint64_t)"DiscoveredPeer", 1, findingToken, v12);
      *(_DWORD *)buf = 138543362;
      id v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);
    }
    if (v5) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 1;
    }
    [(NIServerFindingService *)self _updatePeerTrackingDiscoveryState:v14];
    [(NIServerFindingService *)self _tryToStartRangingWithPeerAdvertisement:v9];
  }
}

- (void)didLosePeer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NIDiscoveryToken *)self->_findingToken isEqual:v4])
  {
    BOOL v5 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = sub_1002E0FD8((uint64_t)"LostPeer", 1, self->_findingToken, 0);
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", (uint8_t *)&v7, 0xCu);
    }
    [(NIServerFindingService *)self _updatePeerTrackingDiscoveryState:4];
  }
}

- (void)didStopAdvertisingToPeer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NIDiscoveryToken *)self->_findingToken isEqual:v4])
  {
    BOOL v5 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = sub_1002E0FD8((uint64_t)"NotifyStopAdv", 1, v4, 0);
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", (uint8_t *)&v7, 0xCu);
    }
    [(NIServerFindingService *)self _updatePeerTrackingAdvertisingState:2];
  }
}

- (void)didGenerateAdvertisement:(id)a3 toSendOOBToPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NIDiscoveryToken *)self->_findingToken isEqual:v7])
  {
    id v8 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      findingToken = self->_findingToken;
      id v10 = +[NSString stringWithFormat:@"SelfAdv: %@", v6];
      int64_t v11 = sub_1002E0FD8((uint64_t)"GeneratedAdv", 1, findingToken, v10);
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);
    }
    double v12 = [v6 byteRepresentation];
    double v13 = [[NINearbyObject alloc] initWithToken:self->_findingToken];
    uint64_t v14 = [(NSMapTable *)self->_findingClients objectEnumerator];
    BOOL v15 = 0;
    while (1)
    {
      id v16 = [v14 nextObject];

      if (!v16) {
        break;
      }
      BOOL v15 = v16;
      [v16 serviceDidGenerateShareableConfigurationData:v12 forObject:v13];
    }
    id v17 = +[NIServerFindingServiceObserverRelay sharedInstance];
    id v18 = self->_findingToken;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1002159A4;
    v21[3] = &unk_10085A588;
    id v19 = v12;
    id v22 = v19;
    id v20 = v13;
    id v23 = v20;
    [v17 relayToObserversForToken:v18 blockToRelay:v21];
  }
}

- (void)bluetoothDiscoveryFinishedActivating
{
  char v3 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = sub_1002E0FD8((uint64_t)"DiscActivated", 1, 0, 0);
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", (uint8_t *)&v5, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (void)bluetoothDiscoveryBecameUnavailable
{
  char v3 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = sub_1002E0FD8((uint64_t)"DiscUnavailable", 1, 0, 0);
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", (uint8_t *)&v5, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (void)bluetoothDiscoveryBecameAvailable
{
  char v3 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = sub_1002E0FD8((uint64_t)"DiscAvailable", 1, 0, 0);
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", (uint8_t *)&v5, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (void)didRangeWithPeer:(id)a3 newSolution:(const void *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NIDiscoveryToken *)self->_findingToken isEqual:v6])
  {
    id v8 = (int *)((char *)a4 + 32);
    int v7 = *((_DWORD *)a4 + 8);
    if ((v7 - 2) < 4 || v7 == 0)
    {
      id v10 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_10041FE84(v8, (uint64_t)v6, v10);
      }
    }
    else
    {
      double v11 = 0.0;
      if (v7 == 1)
      {
        if (!*((unsigned char *)a4 + 600)) {
          __assert_rtn("-[NIServerFindingService didRangeWithPeer:newSolution:]", "NIServerFindingSession.mm", 1623, "solution.raw_rose_measurement.has_value()");
        }
        double v11 = *((double *)a4 + 44);
      }
      if (*((unsigned char *)a4 + 24))
      {
        [(DetailsViewAnalytics *)self->_detailsViewAnalytics updateWithMostRecentRawDistance:v11];
        [(NIServerFindingService *)self _logSuccessfulRange:v11];
        [(NIServerFindingService *)self _updatePeerTrackingRangingState:3];
        self->_cachedSolutionMacAddr = *((void *)a4 + 5);
        sub_1001F2E48();
        [(NINearbyUpdatesEngine *)self->_updatesEngine acceptRoseSolution:a4];
      }
      else
      {
        sub_1001F2E48();
        double v12 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10041FE14(v12, v13, v14, v15, v16, v17, v18, v19);
        }
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_10041FF10();
  }
}

- (void)didAttemptRangingWithPeer:(id)a3 unsuccessfulSolution:(const void *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NIDiscoveryToken *)self->_findingToken isEqual:v6])
  {
    if (!*((unsigned char *)a4 + 600)) {
      __assert_rtn("-[NIServerFindingService didAttemptRangingWithPeer:unsuccessfulSolution:]", "NIServerFindingSession.mm", 1661, "solution.raw_rose_measurement.has_value()");
    }
    [(NIServerFindingService *)self _logUnsuccessfulRange];
    if (*((unsigned char *)a4 + 600) && *((_WORD *)a4 + 72) == 96) {
      [(NIServerFindingService *)self _updatePeerTrackingRangingState:2];
    }
    sub_1001F2E48();
    [(NINearbyUpdatesEngine *)self->_updatesEngine acceptUnsuccessfulRoseSolution:a4];
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_10041FF44();
  }
}

- (void)_logSuccessfulRange:(double)a3
{
  double v5 = sub_100006C38();
  findingToken = self->_findingToken;
  int v7 = +[NSString stringWithFormat:@"Range: %0.2f m", *(void *)&a3];
  id v8 = sub_1002E0FD8((uint64_t)"RangeSuccess", 1, findingToken, v7);

  id v9 = qword_1008ABDE0;
  if (v5 - self->_lastLogMachContTime <= 5.0)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
      sub_10041FF78();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      NSErrorUserInfoKey v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);
    }
    self->_lastLogMachContTime = v5;
  }
  id v10 = [(NSMutableDictionary *)self->_sessionSummary objectForKeyedSubscript:@"[E1|RNG] Good "];
  double v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v10 unsignedIntegerValue] + 1);
  [(NSMutableDictionary *)self->_sessionSummary setObject:v11 forKeyedSubscript:@"[E1|RNG] Good "];

  double v12 = [(NSMutableDictionary *)self->_sessionSummary objectForKeyedSubscript:@"[E3|RNG] First"];
  LODWORD(v10) = v12 == 0;

  if (v10)
  {
    uint64_t v13 = +[NSNumber numberWithDouble:a3];
    [(NSMutableDictionary *)self->_sessionSummary setObject:v13 forKeyedSubscript:@"[E3|RNG] First"];

    uint64_t v14 = +[NSNumber numberWithDouble:a3];
    [(NSMutableDictionary *)self->_sessionSummary setObject:v14 forKeyedSubscript:@"[E5|RNG] Max  "];

    uint64_t v15 = +[NSNumber numberWithDouble:a3];
    [(NSMutableDictionary *)self->_sessionSummary setObject:v15 forKeyedSubscript:@"[E6|RNG] Min  "];
  }
  uint64_t v16 = +[NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)self->_sessionSummary setObject:v16 forKeyedSubscript:@"[E4|RNG] Last "];

  uint64_t v17 = [(NSMutableDictionary *)self->_sessionSummary objectForKeyedSubscript:@"[E5|RNG] Max  "];
  [v17 doubleValue];
  BOOL v19 = v18 < a3;

  if (v19)
  {
    id v20 = +[NSNumber numberWithDouble:a3];
    [(NSMutableDictionary *)self->_sessionSummary setObject:v20 forKeyedSubscript:@"[E5|RNG] Max  "];
  }
  id v21 = [(NSMutableDictionary *)self->_sessionSummary objectForKeyedSubscript:@"[E6|RNG] Min  "];
  [v21 doubleValue];
  BOOL v23 = v22 > a3;

  if (v23)
  {
    uint64_t v24 = +[NSNumber numberWithDouble:a3];
    [(NSMutableDictionary *)self->_sessionSummary setObject:v24 forKeyedSubscript:@"[E6|RNG] Min  "];
  }
}

- (void)_logUnsuccessfulRange
{
  char v3 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = sub_1002E0FD8((uint64_t)"RangeFailure", 1, self->_findingToken, 0);
    sub_10041FFE0(v4, v7, v3);
  }

  double v5 = [(NSMutableDictionary *)self->_sessionSummary objectForKeyedSubscript:@"[E2|RNG] Miss "];
  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v5 unsignedIntegerValue] + 1);
  [(NSMutableDictionary *)self->_sessionSummary setObject:v6 forKeyedSubscript:@"[E2|RNG] Miss "];
}

- (void)didStopRangingWithPeer:(id)a3
{
  id v4 = a3;
  double v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = sub_1002E0FD8((uint64_t)"NotifyStopRange", 1, v4, 0);
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", (uint8_t *)&v7, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NIServerFindingService *)self _handleRangingTerminatedCallbackForPeer:v4];
}

- (void)didRangingAuthorizationFailForPeer:(id)a3
{
  id v4 = a3;
  double v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = sub_1002E0FD8((uint64_t)"NotifyAuthFail", 1, v4, 0);
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", (uint8_t *)&v7, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NIServerFindingService *)self _handleRangingTerminatedCallbackForPeer:v4];
}

- (void)_handleRangingTerminatedCallbackForPeer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NIDiscoveryToken *)self->_findingToken isEqual:v4])
  {
    double v5 = +[NSUserDefaults standardUserDefaults];
    [v5 doubleForKey:@"FindingServiceRangingTriggerTimeLimitOverrideSeconds"];
    double v7 = v6;

    if (v7 <= 0.0) {
      double v7 = 1200.0;
    }
    double v8 = sub_100006C38() - self->_serviceStartTimeSeconds;
    if (v8 > v7)
    {
      id v9 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 134218240;
        double v14 = v8;
        __int16 v15 = 2048;
        double v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#find-ses,Ranging terminated and too much time elapsed (%0.1f s > %0.1f s), stop ranging triggers", (uint8_t *)&v13, 0x16u);
      }
      id v10 = [(NIServerFindingDiscoveryProvider *)self->_discoveryProvider setPeersEligibleForDiscovery:0 requestScan:0];
      if (v10 && os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_100420108();
      }
      [(NIServerFindingService *)self _updatePeerTrackingDiscoveryState:4];
      double v11 = [(NIServerFindingDiscoveryProvider *)self->_discoveryProvider stopAdvertisingToPeer:v4];
      if (v11 && os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_1004200A0();
      }
      [(NIServerFindingService *)self _updatePeerTrackingAdvertisingState:2];
    }
    double v12 = [(NIServerFindingRangingProvider *)self->_rangingProvider stopRangingWithPeer:v4];
    if (v12 && os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_100420038();
    }
    [(NIServerFindingService *)self _updatePeerTrackingRangingState:4];
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_100420170();
  }
}

- (void)didReceiveRangingDataForPeer:(id)a3 algorithmAidingData:(const void *)a4 signallingData:(const void *)a5
{
  [(NINearbyUpdatesEngine *)self->_updatesEngine acceptPeerData:a4 fromPeer:a3];
  updatesEngine = self->_updatesEngine;
  if (updatesEngine)
  {
    uint64_t v8 = *((unsigned __int8 *)a5 + 8);
    [(NINearbyUpdatesEngine *)updatesEngine acceptPeerDeviceType:v8];
  }
}

- (void)_updatePeerTrackingDiscoveryState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(NIServerFindingPeerTracking *)self->_peerTracking copy];
  [v5 setDiscoveryState:v3];
  [(NIServerFindingService *)self _updatePeerTrackingOverallState:v5];
}

- (void)_updatePeerTrackingAdvertisingState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(NIServerFindingPeerTracking *)self->_peerTracking copy];
  [v5 setAdvertisingState:v3];
  [(NIServerFindingService *)self _updatePeerTrackingOverallState:v5];
}

- (void)_updatePeerTrackingRangingState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(NIServerFindingPeerTracking *)self->_peerTracking copy];
  [v5 setRangingState:v3];
  [(NIServerFindingService *)self _updatePeerTrackingOverallState:v5];
}

- (void)_updatePeerTrackingClientWantsUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(NIServerFindingPeerTracking *)self->_peerTracking copy];
  [v5 setClientWantsUpdates:v3];
  [(NIServerFindingService *)self _updatePeerTrackingOverallState:v5];
}

- (void)_addAlgorithmOutputFlagsToPeerTrackingState:(unsigned __int8)a3
{
  int v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(NIServerFindingPeerTracking *)self->_peerTracking copy];
  [v5 setAlgorithmOutputFlags:[v5 algorithmOutputFlags] | v3];
  [(NIServerFindingService *)self _updatePeerTrackingOverallState:v5];
}

- (void)_removeAlgorithmOutputFlagsFromPeerTrackingState:(unsigned __int8)a3
{
  int v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(NIServerFindingPeerTracking *)self->_peerTracking copy];
  [v5 setAlgorithmOutputFlags:[v5 algorithmOutputFlags] & ~v3];
  [(NIServerFindingService *)self _updatePeerTrackingOverallState:v5];
}

- (void)_updatePeerTrackingOverallState:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [v4 copy];
  id v6 = [(NIServerFindingPeerTracking *)self->_peerTracking copy];
  double v7 = v6;
  if (!v6 || !v5) {
    goto LABEL_89;
  }
  if ([v6 rangingState] == 3
    && ([v5 rangingState] == 1 || objc_msgSend(v5, "rangingState") == 2))
  {
    [v5 setRangingState:[v7 rangingState]];
  }
  if ([v7 rangingState] == 2 && objc_msgSend(v5, "rangingState") == 1) {
    [v5 setRangingState:[v7 rangingState]];
  }
  if (![v7 discoveryState] && objc_msgSend(v5, "discoveryState"))
  {
    if ([v5 discoveryState] == 2)
    {
      uint64_t v8 = 1;
    }
    else
    {
      if ([v5 discoveryState] != 1) {
        goto LABEL_17;
      }
      uint64_t v8 = 3;
    }
    [(NIServerAnalyticsManager *)self->_analyticsManager updateWithAcquisitionReason:v8];
  }
LABEL_17:
  if ([v7 discoveryState] == 3
    && ([v5 discoveryState] == 1 || objc_msgSend(v5, "discoveryState") == 2))
  {
    [v5 setDiscoveryState:[v7 discoveryState]];
  }
  if ([v7 discoveryState] == 1 && objc_msgSend(v5, "discoveryState") == 2
    || [v7 discoveryState] == 2 && objc_msgSend(v5, "discoveryState") == 1)
  {
    [v5 setDiscoveryState:3];
  }
  BOOL v9 = [v5 hasReceivedRangingData]
    && ([v5 algorithmOutputFlags] & 1) != 0;
  [v5 setTellClientAboutPeer:v9];
  if (([v7 isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_peerTracking, v5);
    id v10 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      findingToken = self->_findingToken;
      double v12 = +[NSString stringWithFormat:@"Change: %@ -> %@", v7, v5];
      sub_1002E0FD8((uint64_t)"StateChange", 1, findingToken, v12);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v51 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);
    }
    double v14 = +[NIServerFindingServicePool sharedInstance];
    __int16 v15 = [(NIDiscoveryToken *)self->_findingToken descriptionInternal];
    double v16 = +[NSString stringWithFormat:@"%@: %@", v15, v5];
    [v14 logSessionEvent:v16];

    if (self->_findingToken)
    {
      if (([v7 hasReceivedRangingData] & 1) == 0
        && [v5 hasReceivedRangingData])
      {
        [(NINearbyUpdatesEngine *)self->_updatesEngine acceptDiscoveryEventForPeer:self->_findingToken];
      }
      if (self->_findingToken)
      {
        if (([v7 tellClientAboutPeer] & 1) == 0
          && [v5 tellClientAboutPeer])
        {
          uint64_t v17 = (id)qword_1008ABDE0;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            sub_1002E0FD8((uint64_t)"NotifiedClient", 1, self->_findingToken, @"Sent: didDiscoverNearbyObject");
            id v18 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            id v51 = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);
          }
          BOOL v19 = [(NSMutableDictionary *)self->_sessionSummary objectForKeyedSubscript:@"[D1|FND] Show "];
          BOOL v20 = v19 == 0;

          if (v20)
          {
            id v21 = +[NSDate now];
            [(NSMutableDictionary *)self->_sessionSummary setObject:v21 forKeyedSubscript:@"[D1|FND] Show "];
          }
          double v22 = [[NINearbyObject alloc] initWithToken:self->_findingToken];
          BOOL v23 = [(NSMapTable *)self->_findingClients objectEnumerator];
          uint64_t v24 = 0;
          while (1)
          {
            uint64_t v25 = [v23 nextObject];

            if (!v25) {
              break;
            }
            uint64_t v24 = v25;
            [v25 serviceDidDiscoverNearbyObject:v22];
          }
          [(DetailsViewAnalytics *)self->_detailsViewAnalytics updateDistanceAnalytics:1];
          [(DetailsViewAnalytics *)self->_detailsViewAnalytics updateTimeAnalytics:1 currentTime:sub_100006C38()];
        }
        if (self->_findingToken)
        {
          if ([v7 rangingState] != 3
            && [v5 rangingState] == 3)
          {
            [(DetailsViewAnalytics *)self->_detailsViewAnalytics updateTimeAnalytics:0 currentTime:sub_100006C38()];
          }
          if (self->_findingToken)
          {
            if (([v7 clientWantsUpdates] & 1) == 0
              && [v5 clientWantsUpdates])
            {
              [(DetailsViewAnalytics *)self->_detailsViewAnalytics updateDistanceAnalytics:2];
              [(DetailsViewAnalytics *)self->_detailsViewAnalytics updateTimeAnalytics:2 currentTime:sub_100006C38()];
            }
            if (self->_findingToken)
            {
              if ([v7 clientWantsUpdates]
                && ([v5 clientWantsUpdates] & 1) == 0)
              {
                [(DetailsViewAnalytics *)self->_detailsViewAnalytics updateDistanceAnalytics:3];
                [(DetailsViewAnalytics *)self->_detailsViewAnalytics updateTimeAnalytics:3 currentTime:sub_100006C38()];
              }
              if (self->_findingToken
                && [v7 tellClientAboutPeer]
                && ([v5 tellClientAboutPeer] & 1) == 0)
              {
                NSErrorUserInfoKey v26 = (id)qword_1008ABDE0;
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  sub_1002E0FD8((uint64_t)"NotifiedClient", 1, self->_findingToken, @"Sent: didRemoveNearbyObject");
                  id v27 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  id v51 = v27;
                  _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#find-ses,%{public}@", buf, 0xCu);
                }
                unsigned int v28 = [(NSMutableDictionary *)self->_sessionSummary objectForKeyedSubscript:@"[D5|FND] Revok"];
                BOOL v29 = v28 == 0;

                if (v29)
                {
                  v30 = +[NSDate now];
                  [(NSMutableDictionary *)self->_sessionSummary setObject:v30 forKeyedSubscript:@"[D5|FND] Revok"];
                }
                id v31 = [[NINearbyObject alloc] initWithToken:self->_findingToken];
                v32 = [(NSMapTable *)self->_findingClients objectEnumerator];
                v33 = 0;
                while (1)
                {
                  v34 = [v32 nextObject];

                  if (!v34) {
                    break;
                  }
                  v33 = v34;
                  [v34 serviceDidRemoveNearbyObject:v31];
                }
              }
            }
          }
        }
      }
    }
    if ([v5 clientWantsUpdates])
    {
      id v35 = [(NSMutableDictionary *)self->_sessionSummary objectForKeyedSubscript:@"[D3|FND] Press"];
      BOOL v36 = v35 == 0;

      if (v36)
      {
        v37 = +[NSDate now];
        [(NSMutableDictionary *)self->_sessionSummary setObject:v37 forKeyedSubscript:@"[D3|FND] Press"];
      }
    }
    if ([v5 discoveryState] == 2 || objc_msgSend(v5, "discoveryState") == 3)
    {
      v38 = [(NSMutableDictionary *)self->_sessionSummary objectForKeyedSubscript:@"[B1|TRG] BT   "];
      BOOL v39 = v38 == 0;

      if (v39)
      {
        v40 = +[NSDate now];
        [(NSMutableDictionary *)self->_sessionSummary setObject:v40 forKeyedSubscript:@"[B1|TRG] BT   "];
      }
    }
    if ([v5 discoveryState] == 1 || objc_msgSend(v5, "discoveryState") == 3)
    {
      v41 = [(NSMutableDictionary *)self->_sessionSummary objectForKeyedSubscript:@"[B3|TRG] OOB  "];
      BOOL v42 = v41 == 0;

      if (v42)
      {
        v43 = +[NSDate now];
        [(NSMutableDictionary *)self->_sessionSummary setObject:v43 forKeyedSubscript:@"[B3|TRG] OOB  "];
      }
    }
    if ([v5 rangingState] == 3)
    {
      v44 = [(NSMutableDictionary *)self->_sessionSummary objectForKeyedSubscript:@"[C3|RNG] Meas "];
      BOOL v45 = v44 == 0;

      if (v45)
      {
        v46 = +[NSDate now];
        [(NSMutableDictionary *)self->_sessionSummary setObject:v46 forKeyedSubscript:@"[C3|RNG] Meas "];
      }
    }
    if ([v7 rangingState] == 1 && objc_msgSend(v5, "rangingState") == 2)
    {
      v47 = [(NSMutableDictionary *)self->_sessionSummary objectForKeyedSubscript:@"[C1|RNG] Poll "];
      BOOL v48 = v47 == 0;

      if (v48)
      {
        id v49 = +[NSDate now];
        [(NSMutableDictionary *)self->_sessionSummary setObject:v49 forKeyedSubscript:@"[C1|RNG] Poll "];
      }
    }
  }
LABEL_89:
}

- (BOOL)_sessionConfiguredToRange
{
  return 1;
}

- (void)_startOrUpdateAdvertising
{
  int v3 = [NIServerFindingAdvertisement alloc];
  uint64_t v4 = (uint64_t)[(NIServerFindingDiscoveryProvider *)self->_discoveryProvider advertisingAddress];
  int v15 = v4;
  __int16 v16 = WORD2(v4);
  id v5 = [(NIServerFindingAdvertisement *)v3 initForFinder:1 address:&v15];
  [v5 setCanRange:-[NIServerFindingService _sessionConfiguredToRange](self, "_sessionConfiguredToRange")];
  [v5 setUseCase:-[NIServerFindingService _useCase](self, "_useCase")];
  rangingProvider = self->_rangingProvider;
  if (rangingProvider)
  {
    [(NIServerFindingRangingProvider *)rangingProvider supportedTechnologies];
  }
  else
  {
    __p = 0;
    id v13 = 0;
    uint64_t v14 = 0;
  }
  [v5 setSupportedTechnologies:&__p];
  if (__p)
  {
    id v13 = __p;
    operator delete(__p);
  }
  [v5 setProtocolVersion:1];
  double v7 = sub_1002F6464();
  uint64_t v8 = *((void *)v7 + 406);
  BOOL v9 = (std::__shared_weak_count *)*((void *)v7 + 407);
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_1002CE8FC(v8);
  [v5 setNarrowBandMask:sub_1003A8B68((unsigned __int8 **)v11)];
  if (v11[0])
  {
    v11[1] = v11[0];
    operator delete(v11[0]);
  }
  if (v9) {
    sub_10001A970(v9);
  }
  [(NIServerFindingService *)self _updatePeerTrackingAdvertisingState:1];
  id v10 = [(NIServerFindingDiscoveryProvider *)self->_discoveryProvider startAdvertisingToPeer:self->_findingToken advertisement:v5 timeout:0.0];
}

- (void)_tryToStartRangingWithPeerAdvertisement:(id)a3
{
  id v4 = a3;
  id v5 = [v4 selectedTechnology];
  unsigned int v6 = [v4 canRange];
  unsigned int v7 = [(NIServerFindingService *)self _sessionConfiguredToRange];
  unsigned int v8 = [(NIServerFindingRangingProvider *)self->_rangingProvider canRangeWithPeer:self->_findingToken technology:v5];
  rangingProvider = self->_rangingProvider;
  if (rangingProvider) {
    [(NIServerFindingRangingProvider *)rangingProvider supportedTechnologies];
  }
  else {
    memset(__p, 0, sizeof(__p));
  }
  BOOL v10 = sub_1002E1AE8(__p, (int)v5);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v6 & v7 & v10 & v8)
  {
    [(NIServerFindingService *)self _updatePeerTrackingRangingState:1];
    if ([v4 narrowBandMask])
    {
      unsigned int v11 = [v4 narrowBandMask];
    }
    else
    {
      uint64_t v14 = operator new(1uLL);
      BOOL v23 = v14;
      *uint64_t v14 = 1;
      uint64_t v24 = v14 + 1;
      uint64_t v25 = v14 + 1;
      unsigned int v11 = sub_1003A8B68((unsigned __int8 **)&v23);
      if (v23)
      {
        uint64_t v24 = v23;
        operator delete(v23);
      }
    }
    int v15 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(__p[0]) = 67109120;
      HIDWORD(__p[0]) = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#find-ses,Negotiated nb_mask %hu", (uint8_t *)__p, 8u);
    }
    __int16 v16 = [v4 nbUwbAcquisitionChannelIdx];
    v22[0] = [v16 intValue];
    v22[1] = v11;

    uint64_t v17 = [(NIServerFindingRangingProvider *)self->_rangingProvider startRangingWithPeer:self->_findingToken technology:v5 peerAdvertisement:v4 OOBRangingParameters:v22];
    if (v17)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_1004201A4();
      }
      [(NIServerFindingService *)self _updatePeerTrackingRangingState:4];
    }
    else
    {
      if ((id)[(NIFindingConfiguration *)self->_configuration preferredUpdateRate] == (id)3)
      {
        id v18 = sub_100007D00();
        BOOL v19 = sub_100005424(v18[144]);
        BOOL v20 = self->_rangingProvider;
        __p[0] = (void *)0x100000000000000;
      }
      else
      {
        id v21 = sub_100007D00();
        BOOL v19 = sub_100005424(v21[144]);
        BOOL v20 = self->_rangingProvider;
        __p[0] = (void *)0x101000000000000;
      }
      LOBYTE(__p[1]) = v19;
      [(NIServerFindingRangingProvider *)v20 setSignallingData:__p forPeer:self->_findingToken];
    }
  }
  else
  {
    double v12 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = sub_1002E1ABC((int)v5);
      LODWORD(__p[0]) = 136316162;
      *(void **)((char *)__p + 4) = (void *)v13;
      WORD2(__p[1]) = 1024;
      *(_DWORD *)((char *)&__p[1] + 6) = v6;
      WORD1(__p[2]) = 1024;
      HIDWORD(__p[2]) = v7;
      __int16 v27 = 1024;
      unsigned int v28 = v8;
      __int16 v29 = 1024;
      BOOL v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#find-ses,Not attempting to range (selectedTech: %s). peerDeviceCanRange: %d. sessionConfiguredToRange: %d. localDeviceCanRange: %d. localDeviceSupportsTech: %d.", (uint8_t *)__p, 0x24u);
    }
  }
}

- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4
{
  unsigned int v6 = (NINearbyUpdatesEngine *)a3;
  id v7 = a4;
  if (self->_updatesEngine != v6) {
    __assert_rtn("-[NIServerFindingService updatesEngine:didUpdateNearbyObjects:]", "NIServerFindingSession.mm", 2085, "engine == _updatesEngine");
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100217DE4;
  v13[3] = &unk_10085A5B0;
  v13[4] = self;
  [v7 enumerateObjectsUsingBlock:v13];
  unsigned int v8 = +[NSUserDefaults standardUserDefaults];
  unsigned int v9 = [v8 BOOLForKey:@"FindingGateObjectUpdatesOnDiscovery"];

  if (!v9
    || [(NIServerFindingPeerTracking *)self->_peerTracking discoveryState] == 2
    || [(NIServerFindingPeerTracking *)self->_peerTracking discoveryState] == 3)
  {
    BOOL v10 = [(NSMapTable *)self->_findingClients objectEnumerator];
    unsigned int v11 = 0;
    while (1)
    {
      double v12 = [v10 nextObject];

      if (!v12) {
        break;
      }
      unsigned int v11 = v12;
      [v12 serviceDidUpdateNearbyObjects:v7];
    }
  }
}

- (void)updatesEngine:(id)a3 didUpdateAlgorithmConvergenceState:(id)a4 forObject:(id)a5
{
  id v13 = (NINearbyUpdatesEngine *)a3;
  id v8 = a4;
  id v9 = a5;
  if (self->_updatesEngine != v13) {
    __assert_rtn("-[NIServerFindingService updatesEngine:didUpdateAlgorithmConvergenceState:forObject:]", "NIServerFindingSession.mm", 2116, "engine == _updatesEngine");
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v10 = [(NSMapTable *)self->_findingClients objectEnumerator];
  unsigned int v11 = 0;
  while (1)
  {
    double v12 = [v10 nextObject];

    if (!v12) {
      break;
    }
    unsigned int v11 = v12;
    [v12 serviceDidUpdateAlgorithmConvergenceState:v8 forObject:v9];
  }
}

- (id)discoveryTokenFromIdentifier:(unint64_t)a3
{
  return self->_findingToken;
}

- (optional<unsigned)identifierFromDiscoveryToken:(id)a3
{
  unint64_t cachedSolutionMacAddr = self->_cachedSolutionMacAddr;
  BOOL v4 = 1;
  result.__engaged_ = v4;
  result.var0 = ($BEC950A715106DE229A2E4BA1089E24D)cachedSolutionMacAddr;
  return result;
}

- (id)objectFromIdentifier:(unint64_t)a3
{
  if (self->_findingToken) {
    int v3 = [[NINearbyObject alloc] initWithToken:self->_findingToken];
  }
  else {
    int v3 = 0;
  }

  return v3;
}

- (basic_string<char,)uniqueIdentifierForEngine:(std::allocator<char>> *__return_ptr)retstr
{
  uint64_t v3 = v1;
  id v8 = v2;
  id v5 = *(void **)(v3 + 24);
  if (!v5) {
    __assert_rtn("-[NIServerFindingService uniqueIdentifierForEngine:]", "NIServerFindingSession.mm", 2145, "_algorithmsIdentifier != nil");
  }
  id v6 = [v5 UUIDString];
  sub_100004950(retstr, (char *)[v6 UTF8String]);

  return result;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v5)
  {
    id v6 = [v5 lastObject];
    id v7 = qword_1008ABDE0;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
        sub_10042024C();
      }
      [v6 coordinate];
      uint64_t v31 = v8;
      [v6 coordinate];
      uint64_t v30 = v9;
      BOOL v10 = [v6 timestamp];
      [v10 timeIntervalSinceReferenceDate];
      uint64_t v29 = v11;
      [v6 course];
      uint64_t v13 = v12;
      [v6 courseAccuracy];
      uint64_t v15 = v14;
      [v6 speed];
      uint64_t v17 = v16;
      [v6 speedAccuracy];
      uint64_t v19 = v18;
      [v6 horizontalAccuracy];
      uint64_t v21 = v20;
      [v6 verticalAccuracy];
      uint64_t v23 = v22;
      [v6 altitude];
      uint64_t v25 = v24;
      [v6 ellipsoidalAltitude];
      uint64_t v27 = v26;
      unsigned int v28 = [v6 floor];
      *(void *)buf = v31;
      uint64_t v33 = v30;
      uint64_t v34 = v29;
      uint64_t v35 = v13;
      uint64_t v36 = v15;
      uint64_t v37 = v17;
      uint64_t v38 = v19;
      uint64_t v39 = v21;
      uint64_t v40 = v23;
      uint64_t v41 = v25;
      uint64_t v42 = v27;
      unsigned int v43 = [v28 level];
      unsigned int v44 = [v6 type];
      unsigned int v45 = [v6 signalEnvironmentType];

      [(NINearbyUpdatesEngine *)self->_updatesEngine acceptSelfLocationData:buf];
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#find-ses,current location not updated", buf, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT))
  {
    sub_10042020C();
  }
}

- (void)locationManager:(id)a3 didUpdateHeading:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG))
  {
    sub_1004202F4();
    if (v5) {
      goto LABEL_3;
    }
  }
  else if (v5)
  {
LABEL_3:
    [v5 magneticHeading];
    uint64_t v7 = v6;
    [v5 trueHeading];
    uint64_t v9 = v8;
    [v5 headingAccuracy];
    uint64_t v11 = v10;
    uint64_t v12 = [v5 timestamp];
    [v12 timeIntervalSinceReferenceDate];
    v14[0] = v7;
    v14[1] = v9;
    v14[2] = v11;
    v14[3] = v13;

    [(NINearbyUpdatesEngine *)self->_updatesEngine acceptHeadingData:v14];
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_1004202B4();
  }
LABEL_7:
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = [v5 code];
  if (v6)
  {
    if (v6 == (id)1)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
        sub_1004203F8();
      }
    }
    else if (v6 == (id)3)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_1004203C4();
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_10042035C();
      }
      [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
      [(CLLocationManager *)self->_locationManager startUpdatingLocation];
      [(CLLocationManager *)self->_locationManager stopUpdatingHeading];
      [(CLLocationManager *)self->_locationManager startUpdatingHeading];
    }
  }
  else
  {
    uint64_t v7 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#find-ses,location is unknown", v8, 2u);
    }
  }
}

- (void)DataCallback:(id)a3
{
  updatesEngine = self->_updatesEngine;
  +[NIGnssExtensionsManager getGnssSatelliteDataVecFromDict:a3];
  [(NINearbyUpdatesEngine *)updatesEngine acceptGnssSatelliteData:__p];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailsViewAnalytics, 0);
  objc_storeStrong((id *)&self->_altimeterManager, 0);
  objc_storeStrong((id *)&self->_pdrManager, 0);
  objc_storeStrong((id *)&self->_gnssExtensionsManager, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_motionUpdateOpQueue, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_cachedVisionInput, 0);
  objc_storeStrong((id *)&self->_peerTracking, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_updatesEngine, 0);
  objc_storeStrong((id *)&self->_rangingProvider, 0);
  objc_storeStrong((id *)&self->_discoveryProvider, 0);
  objc_storeStrong((id *)&self->_pauseDelayTimer, 0);
  objc_storeStrong((id *)&self->_findingToken, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_sessionSummary, 0);
  objc_storeStrong((id *)&self->_clientRunStates, 0);
  objc_storeStrong((id *)&self->_findingConfigurations, 0);
  objc_storeStrong((id *)&self->_findingClients, 0);
  objc_storeStrong((id *)&self->_algorithmsIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  return self;
}

@end