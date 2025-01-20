@interface NIServerNearbyAccessorySession
- (BOOL)supportsBackgroundedClients;
- (BOOL)supportsCameraAssistance;
- (NINearbyAccessoryConfiguration)configuration;
- (NIServerNearbyAccessorySession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5;
- (duration<long)nominalCycleRate;
- (id).cxx_construct;
- (id)_finalizeRunning;
- (id)configure;
- (id)disableAllServices;
- (id)discoveryTokenFromIdentifier:(unint64_t)a3;
- (id)getQueueForInputingData;
- (id)lastConfiguration;
- (id)objectFromIdentifier:(unint64_t)a3;
- (id)pauseWithSource:(int64_t)a3;
- (id)printableState;
- (id)run;
- (optional<unsigned)identifierFromDiscoveryToken:(id)a3;
- (unint64_t)requiresUWBToRun;
- (void)_handleSessionBackgroundContinuationAuth:(BOOL)a3;
- (void)accessoryGATTServiceAuthorizedBackgroundOperation;
- (void)accessoryGATTServiceFailedWithError:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)peerInactivityPeriodExceeded:(id)a3;
- (void)processVisionInput:(id)a3;
- (void)serviceDidGenerateShareableConfigurationData:(id)a3;
- (void)serviceDidInvalidateWithReason:(int)a3;
- (void)serviceDidReceiveNewSolution:(const void *)a3;
- (void)serviceRequestDidUpdateStatus:(ServiceRequestStatusUpdate)a3;
- (void)updatesEngine:(id)a3 didUpdateAlgorithmConvergenceState:(id)a4 forObject:(id)a5;
- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4;
@end

@implementation NIServerNearbyAccessorySession

- (NIServerNearbyAccessorySession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v44 = a3;
  id v43 = a4;
  uint64_t v8 = objc_opt_class();
  if (v8 != objc_opt_class())
  {
    v40 = +[NSAssertionHandler currentHandler];
    [v40 handleFailureInMethod:a2 object:self file:@"NIServerNearbyAccessorySession.mm" lineNumber:134 description:@"NINearbyAccessoryConfiguration given invalid configuration."];
  }
  v9 = [v44 serverSessionIdentifier];

  if (!v9)
  {
    v41 = +[NSAssertionHandler currentHandler];
    [v41 handleFailureInMethod:a2, self, @"NIServerNearbyAccessorySession.mm", 135, @"Invalid parameter not satisfying: %@", @"resourcesManager.serverSessionIdentifier" object file lineNumber description];
  }
  v48.receiver = self;
  v48.super_class = (Class)NIServerNearbyAccessorySession;
  v10 = [(NIServerBaseSession *)&v48 initWithResourcesManager:v44 configuration:v43 error:a5];
  id v11 = v10;
  if (!v10) {
    goto LABEL_23;
  }
  if (v44)
  {
    [v44 protobufLogger];
    long long v12 = v47;
  }
  else
  {
    long long v12 = 0uLL;
  }
  v13 = (uint64_t *)(v10 + 48);
  long long v47 = 0uLL;
  v14 = (std::__shared_weak_count *)*((void *)v10 + 7);
  *((_OWORD *)v10 + 3) = v12;
  if (v14) {
    sub_10001A970(v14);
  }
  if (*((void *)&v47 + 1)) {
    sub_10001A970(*((std::__shared_weak_count **)&v47 + 1));
  }
  uint64_t v15 = [v44 clientConnectionQueue];
  v16 = (void *)*((void *)v10 + 9);
  *((void *)v10 + 9) = v15;

  id v17 = [v43 copy];
  v18 = (void *)*((void *)v10 + 13);
  *((void *)v10 + 13) = v17;

  v19 = [v44 serverSessionIdentifier];
  v20 = [v19 UUIDString];
  v21 = +[NSUUID UUID];
  v22 = [v21 UUIDString];
  uint64_t v23 = +[NSString stringWithFormat:@"%@---%@", v20, v22];
  v24 = (void *)*((void *)v11 + 10);
  *((void *)v11 + 10) = v23;

  [*((id *)v11 + 13) setSupportsCameraAssistance:+[NIPlatformInfo supportsSyntheticAperture](NIPlatformInfo, "supportsSyntheticAperture")];
  v25 = [NINearbyUpdatesEngine alloc];
  uint64_t v26 = *((void *)v11 + 13);
  uint64_t v27 = *((void *)v11 + 9);
  v28 = [v44 analytics];
  uint64_t v45 = *v13;
  v29 = (std::__shared_weak_count *)v13[1];
  v46 = v29;
  if (v29) {
    atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v30 = [(NINearbyUpdatesEngine *)v25 initWithConfiguration:v26 queue:v27 delegate:v11 dataSource:v11 analyticsManager:v28 protobufLogger:&v45 error:a5];
  v31 = (void *)*((void *)v11 + 8);
  *((void *)v11 + 8) = v30;

  if (v46) {
    sub_10001A970(v46);
  }

  if (*((void *)v11 + 8))
  {
    *((unsigned char *)v11 + 88) = 0;
    *((unsigned char *)v11 + 89) = 0;
    v32 = +[NIServerNearbyAccessoryRangingService sharedInstance];
    uint64_t v33 = *((void *)v11 + 10);
    v34 = v44;
    v35 = [v44 clientProcessSigningIdentity];
    v36 = [v32 addServiceClient:v11 identifier:v33 processName:v35 configuration:*((void *)v11 + 13)];

    if (v36)
    {
      v37 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100416EA4((uint64_t)v36, v37);
      }
      v38 = 0;
      if (a5) {
        *a5 = v36;
      }
    }
    else
    {
      v38 = (NIServerNearbyAccessorySession *)v11;
    }
  }
  else
  {
LABEL_23:
    v38 = 0;
    v34 = v44;
  }

  return v38;
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (BOOL)supportsBackgroundedClients
{
  return self->_backgroundAuthorization != 2;
}

- (BOOL)supportsCameraAssistance
{
  return +[NIPlatformInfo supportsSyntheticAperture];
}

- (unint64_t)requiresUWBToRun
{
  return 2;
}

- (id)getQueueForInputingData
{
  return self->_clientQueue;
}

- (id)configure
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  configuration = self->_configuration;
  if (!configuration) {
    sub_100416F1C();
  }
  v4 = [(NINearbyAccessoryConfiguration *)configuration accessoryDiscoveryToken];

  if (v4)
  {
    v5 = [(NINearbyAccessoryConfiguration *)self->_configuration bluetoothDeviceIdentifier];

    v6 = qword_1008ABDE0;
    if (v5)
    {
      v7 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [(NINearbyAccessoryConfiguration *)self->_configuration bluetoothDeviceIdentifier];
        v9 = [v8 UUIDString];
        int v12 = 138412290;
        v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-ecosystem,Configuration specifies BLE peripheral: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ses-ecosystem,Configuration does not specify a BLE peripheral", (uint8_t *)&v12, 2u);
    }
    v10 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_100416F48();
    }
    v10 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
  }

  return v10;
}

- (id)run
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  self->_sessionState = 1;
  unsigned int v4 = [(NINearbyAccessoryConfiguration *)self->_configuration dataExchangeDisabledAndUsingParameterOverrides];
  v5 = qword_1008ABDE0;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-ecosystem,Configuration disables data exchange and is using parameter overrides", buf, 2u);
    }
    self->_backgroundAuthorization = 2;
    v29.receiver = self;
    v29.super_class = (Class)NIServerNearbyAccessorySession;
    v6 = [(NIServerBaseSession *)&v29 backgroundSupportUpdateHandler];
    ((void (**)(void, BOOL))v6)[2](v6, [(NIServerNearbyAccessorySession *)self supportsBackgroundedClients]);

    uint64_t v7 = [(NIServerNearbyAccessorySession *)self _finalizeRunning];
    goto LABEL_5;
  }
  v9 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v2 = NIInternalUtils;
    v10 = +[NIInternalUtils NISessionBackgroundModeToString:[(NINearbyAccessoryConfiguration *)self->_configuration backgroundMode]];
    *(_DWORD *)buf = 136315138;
    v31 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ses-ecosystem,Configuration background mode: %s", buf, 0xCu);
  }

  int64_t v11 = [(NINearbyAccessoryConfiguration *)self->_configuration backgroundMode];
  switch(v11)
  {
    case 2:
      if (self->_backgroundAuthorization - 1 < 2)
      {
        uint64_t v7 = [(NIServerNearbyAccessorySession *)self _finalizeRunning];
        goto LABEL_5;
      }
      if (!self->_backgroundAuthorization)
      {
        v13 = +[NIServerAccessoryGATTServiceManager sharedInstance];
        sessionUniqueIdentifier = self->_sessionUniqueIdentifier;
        uint64_t v15 = [(NINearbyAccessoryConfiguration *)self->_configuration bluetoothDeviceIdentifier];
        [v13 addServiceListener:self withIdentifier:sessionUniqueIdentifier forBluetoothPeer:v15 withConfiguration:self->_configuration];

        v16 = +[NIServerAccessoryGATTServiceManager sharedInstance];
        [v16 probeAuthorizationForServiceListenerWithIdentifier:self->_sessionUniqueIdentifier];

        v2 = 0;
        break;
      }
      goto LABEL_19;
    case 1:
LABEL_19:
      v27.receiver = self;
      v27.super_class = (Class)NIServerNearbyAccessorySession;
      id v17 = [(NIServerBaseSession *)&v27 resourcesManager];
      objc_initWeak((id *)buf, self);
      v18 = [NIServerBackgroundContinuationManager alloc];
      v19 = self->_sessionUniqueIdentifier;
      v20 = [v17 appStateMonitor];
      clientQueue = self->_clientQueue;
      v22 = [v17 analytics];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1001A8868;
      v25[3] = &unk_100847538;
      objc_copyWeak(&v26, (id *)buf);
      uint64_t v23 = [(NIServerBackgroundContinuationManager *)v18 initWithSessionIdentifier:v19 appStateMonitor:v20 queue:clientQueue analyticsManager:v22 backgroundAuthHandler:v25];
      backgroundContinuationManager = self->_backgroundContinuationManager;
      self->_backgroundContinuationManager = v23;

      v2 = [(NIServerNearbyAccessorySession *)self _finalizeRunning];
      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);

      break;
    case 0:
      self->_backgroundAuthorization = 2;
      v28.receiver = self;
      v28.super_class = (Class)NIServerNearbyAccessorySession;
      int v12 = [(NIServerBaseSession *)&v28 backgroundSupportUpdateHandler];
      ((void (**)(void, BOOL))v12)[2](v12, [(NIServerNearbyAccessorySession *)self supportsBackgroundedClients]);

      uint64_t v7 = [(NIServerNearbyAccessorySession *)self _finalizeRunning];
LABEL_5:
      v2 = (__objc2_class *)v7;
      break;
  }

  return v2;
}

- (id)_finalizeRunning
{
  self->_sessionState = 2;
  v3 = +[NIServerNearbyAccessoryRangingService sharedInstance];
  [v3 notifyServiceClientWithIdentifier:self->_sessionUniqueIdentifier isRunning:1];

  v10.receiver = self;
  v10.super_class = (Class)NIServerNearbyAccessorySession;
  unsigned int v4 = [(NIServerBaseSession *)&v10 resourcesManager];
  v5 = [v4 lifecycleSupervisor];
  int64_t v6 = [(NINearbyAccessoryConfiguration *)self->_configuration backgroundMode];
  if ((unint64_t)(v6 - 1) >= 2)
  {
    if (!v6)
    {
      [v5 setTimeoutOnPeerInactivity:1];
      [v5 setMaxInactivityBeforeTrackingBeganSeconds:10.0];
      [v5 setMaxInactivityAfterTrackingBeganSeconds:30.0];
    }
  }
  else
  {
    [v5 setTimeoutOnPeerInactivity:0];
  }
  if ([(NINearbyAccessoryConfiguration *)self->_configuration dataExchangeDisabledAndUsingParameterOverrides])
  {
    [v5 setTimeoutOnPeerInactivity:0];
  }
  if ([v5 timeoutOnPeerInactivity])
  {
    [v5 runWithConfigurationCalled];
    uint64_t v7 = [(NINearbyAccessoryConfiguration *)self->_configuration accessoryDiscoveryToken];
    int64_t v11 = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:&v11 count:1];
    [v5 startedDiscoveringPeersWithTokens:v8];
  }
  return 0;
}

- (id)pauseWithSource:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (a3 == 2) {
    unsigned __int8 v5 = 4;
  }
  else {
    unsigned __int8 v5 = 3;
  }
  self->_sessionState = v5;
  int64_t v6 = +[NIServerNearbyAccessoryRangingService sharedInstance];
  [v6 notifyServiceClientWithIdentifier:self->_sessionUniqueIdentifier isRunning:0];

  v10.receiver = self;
  v10.super_class = (Class)NIServerNearbyAccessorySession;
  uint64_t v7 = [(NIServerBaseSession *)&v10 resourcesManager];
  uint64_t v8 = [v7 lifecycleSupervisor];
  if ([v8 timeoutOnPeerInactivity]) {
    [v8 pauseCalled];
  }

  return 0;
}

- (id)disableAllServices
{
  self->_sessionState = 6;
  v9.receiver = self;
  v9.super_class = (Class)NIServerNearbyAccessorySession;
  v3 = [(NIServerBaseSession *)&v9 disableAllServices];
  configuration = self->_configuration;
  self->_configuration = 0;

  unsigned __int8 v5 = +[NIServerNearbyAccessoryRangingService sharedInstance];
  [v5 removeServiceClientWithIdentifier:self->_sessionUniqueIdentifier];

  int64_t v6 = +[NIServerAccessoryGATTServiceManager sharedInstance];
  [v6 removeServiceListenerWithIdentifier:self->_sessionUniqueIdentifier];

  [(NIServerBackgroundContinuationManager *)self->_backgroundContinuationManager invalidate];
  backgroundContinuationManager = self->_backgroundContinuationManager;
  self->_backgroundContinuationManager = 0;

  return v3;
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v4.receiver = self;
  v4.super_class = (Class)NIServerNearbyAccessorySession;
  [(NIServerBaseSession *)&v4 invalidate];
  id v3 = [(NIServerNearbyAccessorySession *)self disableAllServices];
}

- (void)dealloc
{
  id v3 = +[NIServerNearbyAccessoryRangingService sharedInstance];
  [v3 removeServiceClientWithIdentifier:self->_sessionUniqueIdentifier];

  objc_super v4 = +[NIServerAccessoryGATTServiceManager sharedInstance];
  [v4 removeServiceListenerWithIdentifier:self->_sessionUniqueIdentifier];

  v5.receiver = self;
  v5.super_class = (Class)NIServerNearbyAccessorySession;
  [(NIServerNearbyAccessorySession *)&v5 dealloc];
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)150;
}

- (void)serviceDidGenerateShareableConfigurationData:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  clientQueue = self->_clientQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001A8EE0;
  v7[3] = &unk_100847070;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)clientQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)serviceDidReceiveNewSolution:(const void *)a3
{
  long long v5 = *((_OWORD *)a3 + 1);
  long long v22 = *(_OWORD *)a3;
  long long v23 = v5;
  long long v24 = *((_OWORD *)a3 + 2);
  sub_1001751A0(v25, (uint64_t)a3 + 48);
  sub_10016E330(v26, (uint64_t)a3 + 608);
  sub_1001751F8(v29, (__n128 *)((char *)a3 + 760));
  memcpy(v33, (char *)a3 + 880, sizeof(v33));
  objc_initWeak(&location, self);
  clientQueue = self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_1001A92D0;
  block[3] = &unk_100856A20;
  objc_copyWeak(&v9, &location);
  long long v10 = v22;
  long long v11 = v23;
  long long v12 = v24;
  sub_1001751A0(v13, (uint64_t)v25);
  sub_10016E330(v14, (uint64_t)v26);
  sub_1001751F8(v17, v29);
  memcpy(v21, v33, sizeof(v21));
  block[4] = self;
  dispatch_async((dispatch_queue_t)clientQueue, block);
  if (v20 && __p)
  {
    v19 = __p;
    operator delete(__p);
  }
  if (v16) {
    sub_10003E96C((uint64_t)v15, v15[1]);
  }
  sub_10015DC28((uint64_t)v13);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  if (v32 && v30)
  {
    v31 = v30;
    operator delete(v30);
  }
  if (v28) {
    sub_10003E96C((uint64_t)v27, v27[1]);
  }
  sub_10015DC28((uint64_t)v25);
}

- (void)serviceRequestDidUpdateStatus:(ServiceRequestStatusUpdate)a3
{
  int var2 = a3.var2;
  id v4 = *(void **)&a3.var0;
  objc_initWeak(&location, self);
  clientQueue = self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A96E4;
  block[3] = &unk_100856A58;
  objc_copyWeak(v8, &location);
  int v9 = var2;
  v8[1] = v4;
  block[4] = self;
  dispatch_async((dispatch_queue_t)clientQueue, block);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

- (void)serviceDidInvalidateWithReason:(int)a3
{
  objc_initWeak(&location, self);
  clientQueue = self->_clientQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001A9A34;
  v6[3] = &unk_100846958;
  objc_copyWeak(&v7, &location);
  int v8 = a3;
  v6[4] = self;
  dispatch_async((dispatch_queue_t)clientQueue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)processVisionInput:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  [(NINearbyUpdatesEngine *)self->_updatesEngine acceptVisionInput:v4];
}

- (id)printableState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  id v3 = objc_opt_new();
  unint64_t sessionState = (char)self->_sessionState;
  if (sessionState > 6) {
    id v6 = "Unknown";
  }
  else {
    id v6 = off_100856B58[sessionState];
  }
  unint64_t backgroundAuthorization = (char)self->_backgroundAuthorization;
  if (backgroundAuthorization > 2) {
    int v8 = "Unknown";
  }
  else {
    int v8 = off_100856B90[backgroundAuthorization];
  }
  int v9 = +[NSString stringWithFormat:@"State: %s. BG auth: %s", v6, v8];
  [v3 addObject:v9];

  long long v10 = [(NINearbyAccessoryConfiguration *)self->_configuration accessoryConfigData];
  long long v11 = sub_10002D648(v10, 0);
  long long v12 = +[NSString stringWithFormat:@"Blob: %@", v11];
  [v3 addObject:v12];

  return v3;
}

- (id)discoveryTokenFromIdentifier:(unint64_t)a3
{
  id v3 = [[NIDiscoveryToken alloc] initWithDeviceAddress:(unsigned __int16)a3];

  return v3;
}

- (optional<unsigned)identifierFromDiscoveryToken:(id)a3
{
  id v3 = [a3 shortDeviceAddress];
  id v4 = [v3 unsignedLongLongValue];

  v5.__val_ = (unint64_t)v4;
  BOOL v6 = 1;
  result.__engaged_ = v6;
  result.var0 = v5;
  return result;
}

- (id)objectFromIdentifier:(unint64_t)a3
{
  unsigned __int16 v3 = a3;
  id v4 = [NINearbyObject alloc];
  $BEC950A715106DE229A2E4BA1089E24D v5 = [[NIDiscoveryToken alloc] initWithDeviceAddress:v3];
  BOOL v6 = [(NINearbyObject *)v4 initWithToken:v5];

  return v6;
}

- (void)_handleSessionBackgroundContinuationAuth:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  $BEC950A715106DE229A2E4BA1089E24D v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = "NO";
    if (v3) {
      BOOL v6 = "YES";
    }
    *(_DWORD *)buf = 136315138;
    long long v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-ecosystem,Background continuation auth? %s", buf, 0xCu);
  }
  if (v3) {
    unsigned __int8 v7 = 1;
  }
  else {
    unsigned __int8 v7 = 2;
  }
  self->_unint64_t backgroundAuthorization = v7;
  v9.receiver = self;
  v9.super_class = (Class)NIServerNearbyAccessorySession;
  int v8 = [(NIServerBaseSession *)&v9 backgroundSupportUpdateHandler];
  ((void (**)(void, BOOL))v8)[2](v8, [(NIServerNearbyAccessorySession *)self supportsBackgroundedClients]);
}

- (void)accessoryGATTServiceFailedWithError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!v4) {
    __assert_rtn("-[NIServerNearbyAccessorySession accessoryGATTServiceFailedWithError:]", "NIServerNearbyAccessorySession.mm", 637, "error");
  }
  if (self->_sessionState == 6)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_1004171B0();
    }
  }
  else
  {
    $BEC950A715106DE229A2E4BA1089E24D v5 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      BOOL v6 = [(NINearbyAccessoryConfiguration *)self->_configuration bluetoothDeviceIdentifier];
      sub_1004171E4(v6, (uint64_t)v4, buf, v5);
    }

    unsigned __int8 v7 = +[NIServerNearbyAccessoryRangingService sharedInstance];
    [v7 notifyServiceClientWithIdentifier:self->_sessionUniqueIdentifier isRunning:0];

    self->_unint64_t backgroundAuthorization = 0;
    v16.receiver = self;
    v16.super_class = (Class)NIServerNearbyAccessorySession;
    int v8 = [(NIServerBaseSession *)&v16 backgroundSupportUpdateHandler];
    ((void (**)(void, BOOL))v8)[2](v8, [(NIServerNearbyAccessorySession *)self supportsBackgroundedClients]);

    self->_unint64_t sessionState = 5;
    objc_super v9 = [NINearbyObject alloc];
    long long v10 = [(NINearbyAccessoryConfiguration *)self->_configuration accessoryDiscoveryToken];
    long long v11 = [(NINearbyObject *)v9 initWithToken:v10];

    v15.receiver = self;
    v15.super_class = (Class)NIServerNearbyAccessorySession;
    long long v12 = [(NIServerBaseSession *)&v15 resourcesManager];
    v13 = [v12 remote];
    id v17 = v11;
    v14 = +[NSArray arrayWithObjects:&v17 count:1];
    [v13 didRemoveNearbyObjects:v14 withReason:0];
  }
}

- (void)accessoryGATTServiceAuthorizedBackgroundOperation
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (self->_sessionState == 6)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041724C();
    }
  }
  else
  {
    BOOL v3 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(NINearbyAccessoryConfiguration *)self->_configuration bluetoothDeviceIdentifier];
      *(_DWORD *)buf = 138412290;
      objc_super v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-ecosystem,Bluetooth device %@ is background authorized", buf, 0xCu);
    }
    self->_unint64_t backgroundAuthorization = 1;
    v7.receiver = self;
    v7.super_class = (Class)NIServerNearbyAccessorySession;
    $BEC950A715106DE229A2E4BA1089E24D v5 = [(NIServerBaseSession *)&v7 backgroundSupportUpdateHandler];
    ((void (**)(void, BOOL))v5)[2](v5, [(NIServerNearbyAccessorySession *)self supportsBackgroundedClients]);

    if (self->_sessionState == 1) {
      id v6 = [(NIServerNearbyAccessorySession *)self _finalizeRunning];
    }
  }
}

- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4
{
  id v6 = (NINearbyUpdatesEngine *)a3;
  id v7 = a4;
  if (self->_updatesEngine != v6) {
    __assert_rtn("-[NIServerNearbyAccessorySession updatesEngine:didUpdateNearbyObjects:]", "NIServerNearbyAccessorySession.mm", 694, "engine == _updatesEngine");
  }
  objc_initWeak(&location, self);
  clientQueue = self->_clientQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001AA600;
  v10[3] = &unk_100847070;
  objc_copyWeak(&v12, &location);
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async((dispatch_queue_t)clientQueue, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)updatesEngine:(id)a3 didUpdateAlgorithmConvergenceState:(id)a4 forObject:(id)a5
{
  int v8 = (NINearbyUpdatesEngine *)a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_updatesEngine != v8) {
    __assert_rtn("-[NIServerNearbyAccessorySession updatesEngine:didUpdateAlgorithmConvergenceState:forObject:]", "NIServerNearbyAccessorySession.mm", 763, "engine == _updatesEngine");
  }
  objc_initWeak(&location, self);
  clientQueue = self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001AA918;
  block[3] = &unk_1008470C0;
  objc_copyWeak(&v17, &location);
  block[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  dispatch_async((dispatch_queue_t)clientQueue, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)peerInactivityPeriodExceeded:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  [(NINearbyUpdatesEngine *)self->_updatesEngine clearStateForToken:v4];
  self->_unint64_t sessionState = 5;
  $BEC950A715106DE229A2E4BA1089E24D v5 = [[NINearbyObject alloc] initWithToken:v4];
  v12.receiver = self;
  v12.super_class = (Class)NIServerNearbyAccessorySession;
  id v6 = [(NIServerBaseSession *)&v12 resourcesManager];
  id v7 = [v6 remote];
  id v17 = v5;
  int v8 = +[NSArray arrayWithObjects:&v17 count:1];
  [v7 didRemoveNearbyObjects:v8 withReason:0];

  id v9 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    sessionUniqueIdentifier = self->_sessionUniqueIdentifier;
    *(_DWORD *)buf = 138412546;
    v14 = v5;
    __int16 v15 = 2112;
    id v16 = sessionUniqueIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ses-ecosystem,peerInactivityPeriodExceeded: %@ with reason: Timeout, for session identifier: %@", buf, 0x16u);
  }
  id v11 = +[NIServerNearbyAccessoryRangingService sharedInstance];
  [v11 notifyServiceClientWithIdentifier:self->_sessionUniqueIdentifier isRunning:0];
}

- (NINearbyAccessoryConfiguration)configuration
{
  return (NINearbyAccessoryConfiguration *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_backgroundContinuationManager, 0);
  objc_storeStrong((id *)&self->_sessionUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_updatesEngine, 0);
  cntrl = (std::__shared_weak_count *)self->_pbLogger.__cntrl_;
  if (cntrl)
  {
    sub_10001A970(cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  return self;
}

@end