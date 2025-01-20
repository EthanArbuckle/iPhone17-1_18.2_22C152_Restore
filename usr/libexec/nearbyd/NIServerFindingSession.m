@interface NIServerFindingSession
+ (id)sharedServicePrintableState;
- (BOOL)_doesClientWantFinderObserverSession;
- (BOOL)supportsCameraAssistance;
- (BOOL)updateConfiguration:(id)a3;
- (NIFindingConfiguration)configuration;
- (NIServerFindingSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5;
- (duration<long)nominalCycleRate;
- (id)_processFindingEvent:(id)a3;
- (id)configure;
- (id)getQueueForInputingData;
- (id)lastConfiguration;
- (id)pauseWithSource:(int64_t)a3;
- (id)run;
- (unint64_t)requiresNarrowbandToRun;
- (unint64_t)requiresUWBToRun;
- (void)_resetSessionStateForOperation:(int)a3;
- (void)_startRunawayFindingBackstopTimer;
- (void)dealloc;
- (void)didGenerateShareableConfigurationData:(id)a3 forToken:(id)a4;
- (void)invalidate;
- (void)processVisionInput:(id)a3;
- (void)serviceDidDiscoverNearbyObject:(id)a3;
- (void)serviceDidGenerateShareableConfigurationData:(id)a3 forObject:(id)a4;
- (void)serviceDidRemoveNearbyObject:(id)a3;
- (void)serviceDidUpdateAlgorithmConvergenceState:(id)a3 forObject:(id)a4;
- (void)serviceDidUpdateNearbyObjects:(id)a3;
@end

@implementation NIServerFindingSession

- (NIServerFindingSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = objc_opt_class();
  if (v11 != objc_opt_class())
  {
    v29 = +[NSAssertionHandler currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"NIServerFindingSession.mm" lineNumber:2397 description:@"Invalid configuration type."];
  }
  v12 = [v9 serverSessionIdentifier];

  if (!v12)
  {
    v30 = +[NSAssertionHandler currentHandler];
    [v30 handleFailureInMethod:a2, self, @"NIServerFindingSession.mm", 2398, @"Invalid parameter not satisfying: %@", @"resourcesManager.serverSessionIdentifier" object file lineNumber description];
  }
  v32.receiver = self;
  v32.super_class = (Class)NIServerFindingSession;
  v13 = [(NIServerBaseSession *)&v32 initWithResourcesManager:v9 configuration:v10 error:a5];
  if (v13)
  {
    v14 = (NIFindingConfiguration *)[v10 copy];
    configuration = v13->_configuration;
    v13->_configuration = v14;

    v13->_isRunning = 0;
    v13->_shouldDeliverUpdates = 0;
    v13->_deliveredFirstUpdate = 0;
    uint64_t v16 = [v9 clientConnectionQueue];
    clientQueue = v13->_clientQueue;
    v13->_clientQueue = (OS_dispatch_queue *)v16;

    v18 = [v9 serverSessionIdentifier];
    uint64_t v19 = [v18 UUIDString];
    sessionIdentifier = v13->_sessionIdentifier;
    v13->_sessionIdentifier = (NSString *)v19;

    findingToken = v13->_findingToken;
    v13->_findingToken = 0;

    v22 = +[NSUserDefaults standardUserDefaults];
    unsigned int v23 = [v22 BOOLForKey:@"FindingPublishSystemStatus"];

    v24 = qword_1008ABDE0;
    BOOL v25 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v25)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#find-ses,System status publishing enabled", buf, 2u);
      }
      v26 = [[NIServerSystemStatusPublisher alloc] initWithSystemStatus:2];
      systemStatusPublisher = v13->_systemStatusPublisher;
      v13->_systemStatusPublisher = v26;
    }
    else if (v25)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#find-ses,System status publishing disabled", buf, 2u);
    }
  }

  return v13;
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)100;
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (unint64_t)requiresUWBToRun
{
  configuration = self->_configuration;
  if (!configuration) {
    return 2;
  }
  if (![(NIFindingConfiguration *)configuration isFinder]) {
    return 0;
  }
  if ([(NIServerFindingSession *)self _doesClientWantFinderObserverSession]) {
    return 0;
  }
  return 2;
}

- (unint64_t)requiresNarrowbandToRun
{
  v3 = sub_100007D00();
  if (!sub_1003D2ECC((uint64_t)v3)) {
    return 0;
  }

  return [(NIServerFindingSession *)self requiresUWBToRun];
}

- (id)getQueueForInputingData
{
  return self->_clientQueue;
}

- (id)configure
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!self->_configuration) {
    sub_100420438();
  }
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    configuration = self->_configuration;
    *(_DWORD *)buf = 138543618;
    v18 = sessionIdentifier;
    __int16 v19 = 2114;
    v20 = configuration;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-ses,Configure [%{public}@]: %{public}@", buf, 0x16u);
  }
  if ((id)[(NIFindingConfiguration *)self->_configuration configType] == (id)1)
  {
    uint64_t v6 = [(NIFindingConfiguration *)self->_configuration specifiedToken];
    p_findingToken = &self->_findingToken;
    v8 = *p_findingToken;
    *p_findingToken = (NIDiscoveryToken *)v6;

    if (*p_findingToken)
    {
      id v9 = 0;
      goto LABEL_10;
    }
    NSErrorUserInfoKey v13 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v14 = @"No discovery token for this configuration type";
    id v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    uint64_t v11 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:v10];
  }
  else
  {
    NSErrorUserInfoKey v15 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v16 = @"Configuration type not supported";
    id v10 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    uint64_t v11 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:v10];
  }
  id v9 = (void *)v11;

LABEL_10:

  return v9;
}

- (id)run
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v23.receiver = self;
  v23.super_class = (Class)NIServerFindingSession;
  v3 = [(NIServerBaseSession *)&v23 resourcesManager];
  v4 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    uint64_t v6 = [v3 clientProcessNameBestGuess];
    *(_DWORD *)buf = 138543619;
    BOOL v25 = sessionIdentifier;
    __int16 v26 = 2113;
    v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#find-ses,Run [%{public}@]. Process: %{private}@", buf, 0x16u);
  }
  BOOL isRunning = self->_isRunning;
  self->_BOOL isRunning = 1;
  self->_shouldDeliverUpdates = 1;
  self->_deliveredFirstUpdate = 0;
  if ([(NIFindingConfiguration *)self->_configuration isFinder])
  {
    if ([(NIServerFindingSession *)self _doesClientWantFinderObserverSession])
    {
      v8 = +[NIServerFindingServiceObserverRelay sharedInstance];
      [v8 addObserver:self identifier:self->_sessionIdentifier token:self->_findingToken];
    }
    else
    {
      uint64_t v11 = +[NSUserDefaults standardUserDefaults];
      unsigned int v12 = [v11 BOOLForKey:@"FindingDisableService"];

      if (v12)
      {
        NSErrorUserInfoKey v13 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#find-ses,Finding session requested, but disabled via defaults write", buf, 2u);
        }
      }
      else
      {
        findingService = self->_findingService;
        if (findingService)
        {
          if (!isRunning)
          {
            [(NIServerFindingService *)findingService clientWithIdentifier:self->_sessionIdentifier updatedStateToRunning:1 dueToTimeout:0];
            findingService = self->_findingService;
          }
          [(NIServerFindingService *)findingService processUpdatedConfiguration:self->_configuration forClientIdentifier:self->_sessionIdentifier];
        }
        else
        {
          NSErrorUserInfoKey v15 = +[NIServerFindingServicePool sharedInstance];
          CFStringRef v16 = [v15 serviceForToken:self->_findingToken createIfNotExists:1];
          v17 = self->_findingService;
          self->_findingService = v16;

          id v18 = [(NIServerFindingService *)self->_findingService addClient:self identifier:self->_sessionIdentifier configuration:self->_configuration];
        }
        [(NIServerFindingSession *)self _startRunawayFindingBackstopTimer];
        if (v3)
        {
          __int16 v19 = [v3 appStateMonitor];
          unsigned int v20 = [v19 isRunningBoardApp];

          if (v20)
          {
            systemStatusPublisher = self->_systemStatusPublisher;
            [v3 clientAuditToken];
            [(NIServerSystemStatusPublisher *)systemStatusPublisher publishWithAuditToken:&v22];
          }
        }
      }
    }
  }
  else
  {
    id v9 = +[NIServerFindableDeviceProxySessionManager sharedInstance];
    [v9 addObserver:self];
  }
  return 0;
}

- (id)pauseWithSource:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v4 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    int v7 = 138543362;
    v8 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#find-ses,Pause [%{public}@]", (uint8_t *)&v7, 0xCu);
  }
  [(NIServerFindingSession *)self _resetSessionStateForOperation:0];
  return 0;
}

- (BOOL)updateConfiguration:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  p_configuration = &self->_configuration;
  if (v4 && *p_configuration && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = [v4 copy];
    unsigned __int8 v7 = [(NIFindingConfiguration *)*p_configuration canUpdateToConfiguration:v6];
    v8 = qword_1008ABDE0;
    BOOL v9 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        sessionIdentifier = self->_sessionIdentifier;
        uint64_t v11 = *p_configuration;
        int v18 = 138543874;
        __int16 v19 = sessionIdentifier;
        __int16 v20 = 2114;
        v21 = v11;
        __int16 v22 = 2114;
        id v23 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-ses,Update configuration [%{public}@]\nOld: %{public}@\nNew: %{public}@", (uint8_t *)&v18, 0x20u);
      }
      objc_storeStrong((id *)&self->_configuration, v6);
    }
    else if (v9)
    {
      NSErrorUserInfoKey v15 = self->_sessionIdentifier;
      CFStringRef v16 = *p_configuration;
      int v18 = 138412802;
      __int16 v19 = v15;
      __int16 v20 = 2112;
      v21 = v16;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-ses,Can't update configuration, parameters are too different [%@]\nOld: %@\nNew: %@", (uint8_t *)&v18, 0x20u);
    }
  }
  else
  {
    unsigned int v12 = qword_1008ABDE0;
    unsigned __int8 v7 = 0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      NSErrorUserInfoKey v13 = self->_sessionIdentifier;
      CFStringRef v14 = *p_configuration;
      int v18 = 138412802;
      __int16 v19 = v13;
      __int16 v20 = 2112;
      v21 = v14;
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#find-ses,Can't update configuration, one is nil or wrong type [%@]\nOld: %@\nNew: %@", (uint8_t *)&v18, 0x20u);
      unsigned __int8 v7 = 0;
    }
  }

  return v7;
}

- (void)dealloc
{
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138543362;
    unsigned __int8 v7 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-ses,Dealloc [%{public}@]", buf, 0xCu);
  }
  [(NIServerFindingSession *)self _resetSessionStateForOperation:3];
  v5.receiver = self;
  v5.super_class = (Class)NIServerFindingSession;
  [(NIServerFindingSession *)&v5 dealloc];
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (self->_findingToken)
  {
    v3 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      sessionIdentifier = self->_sessionIdentifier;
      *(_DWORD *)buf = 138543362;
      unsigned __int8 v7 = sessionIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-ses,Invalidate [%{public}@]", buf, 0xCu);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)NIServerFindingSession;
  [(NIServerBaseSession *)&v5 invalidate];
  [(NIServerFindingSession *)self _resetSessionStateForOperation:2];
}

- (void)_resetSessionStateForOperation:(int)a3
{
  if (a3 > 1) {
    goto LABEL_4;
  }
  objc_super v5 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v6 = [v5 BOOLForKey:@"FindingDisableClientPausingService"];

  if (v6) {
    goto LABEL_4;
  }
  v17.receiver = self;
  v17.super_class = (Class)NIServerFindingSession;
  unsigned __int8 v7 = [(NIServerBaseSession *)&v17 resourcesManager];
  v8 = [v7 clientProcessNameBestGuess];
  unsigned __int8 v9 = [v8 isEqualToString:@"com.apple.NanoSettingsViewService"];

  if (v9)
  {
LABEL_4:
    [(NIServerFindingService *)self->_findingService removeClientWithIdentifier:self->_sessionIdentifier dueToTimeout:a3 == 1];
    findingService = self->_findingService;
    self->_findingService = 0;

    findingToken = self->_findingToken;
    self->_findingToken = 0;

    configuration = self->_configuration;
    self->_configuration = 0;

    if (a3 == 3) {
      goto LABEL_8;
    }
    NSErrorUserInfoKey v13 = +[NIServerFindingServiceObserverRelay sharedInstance];
    [v13 removeObserverWithIdentifier:self->_sessionIdentifier];

    CFStringRef v14 = +[NIServerFindableDeviceProxySessionManager sharedInstance];
    [v14 removeObserver:self];
  }
  else
  {
    [(NIServerFindingService *)self->_findingService clientWithIdentifier:self->_sessionIdentifier updatedStateToRunning:0 dueToTimeout:a3 == 1];
  }
  [(NIServerSystemStatusPublisher *)self->_systemStatusPublisher unpublish];
LABEL_8:
  runawayFindingBackstopTimer = self->_runawayFindingBackstopTimer;
  if (runawayFindingBackstopTimer)
  {
    dispatch_source_cancel((dispatch_source_t)runawayFindingBackstopTimer);
    CFStringRef v16 = self->_runawayFindingBackstopTimer;
    self->_runawayFindingBackstopTimer = 0;
  }
  self->_BOOL isRunning = 0;
  self->_shouldDeliverUpdates = 0;
  self->_deliveredFirstUpdate = 0;
}

- (void)_startRunawayFindingBackstopTimer
{
  runawayFindingBackstopTimer = self->_runawayFindingBackstopTimer;
  if (runawayFindingBackstopTimer)
  {
    dispatch_source_cancel((dispatch_source_t)runawayFindingBackstopTimer);
    id v4 = self->_runawayFindingBackstopTimer;
    self->_runawayFindingBackstopTimer = 0;
  }
  objc_super v5 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v6 = [v5 objectForKey:@"RunawayFindingBackstopTimeoutOverrideSeconds"];
  int64_t v7 = 1200000000000;

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      double v9 = v8;
      id v10 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v20 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#find-ses,Runaway finding backstop timeout override: %0.1f s", buf, 0xCu);
      }
      int64_t v7 = (unint64_t)(v9 * 1000000000.0);
    }
  }
  uint64_t v11 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_clientQueue);
  p_runawayFindingBackstopTimer = &self->_runawayFindingBackstopTimer;
  NSErrorUserInfoKey v13 = self->_runawayFindingBackstopTimer;
  self->_runawayFindingBackstopTimer = v11;

  CFStringRef v14 = self->_runawayFindingBackstopTimer;
  dispatch_time_t v15 = dispatch_time(0, v7);
  dispatch_source_set_timer((dispatch_source_t)v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  objc_initWeak((id *)buf, self);
  CFStringRef v16 = self->_runawayFindingBackstopTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10021A3F8;
  handler[3] = &unk_1008460E8;
  objc_copyWeak(&v18, (id *)buf);
  dispatch_source_set_event_handler((dispatch_source_t)v16, handler);
  dispatch_resume((dispatch_object_t)*p_runawayFindingBackstopTimer);
  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

- (BOOL)_doesClientWantFinderObserverSession
{
  configuration = self->_configuration;
  if (!configuration || ![(NIFindingConfiguration *)configuration isFinder]) {
    return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)NIServerFindingSession;
  id v4 = [(NIServerBaseSession *)&v8 resourcesManager];
  if ([(NIFindingConfiguration *)self->_configuration isObserver])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    unsigned __int8 v6 = [v4 clientProcessNameBestGuess];
    unsigned __int8 v5 = [v6 isEqualToString:@"com.apple.nanofindlocallyd"];
  }
  return v5;
}

- (BOOL)supportsCameraAssistance
{
  return +[NIPlatformInfo supportsSyntheticAperture];
}

- (id)_processFindingEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!v4) {
    __assert_rtn("-[NIServerFindingSession _processFindingEvent:]", "NIServerFindingSession.mm", 2718, "event");
  }
  if (self->_configuration)
  {
    unsigned __int8 v5 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_super v17 = sub_1002E0FBC([(NIFindingConfiguration *)self->_configuration isFinder]);
      sessionIdentifier = self->_sessionIdentifier;
      int v19 = 136315651;
      double v20 = v17;
      __int16 v21 = 2112;
      __int16 v22 = sessionIdentifier;
      __int16 v23 = 2113;
      id v24 = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#find-ses,[%s] Process event [%@]: %{private}@", (uint8_t *)&v19, 0x20u);
    }

    unsigned __int8 v6 = [v4 objectForKeyedSubscript:@"FindingEventDictKey_EventType"];
    id v7 = [v6 integerValue];

    if ((unint64_t)v7 >= 7) {
      id v8 = 0;
    }
    else {
      id v8 = v7;
    }
    double v9 = [v4 objectForKeyedSubscript:@"FindingEventDictKey_ObjectDiscoveryToken"];
    id v10 = [v4 objectForKeyedSubscript:@"FindingEventDictKey_SharedConfigurationData"];
    uint64_t v11 = [v4 objectForKeyedSubscript:@"FindingEventDictKey_Location"];
    unsigned int v12 = [v4 objectForKeyedSubscript:@"FindingEventDictKey_Heading"];
    if ([(NIFindingConfiguration *)self->_configuration isFinder])
    {
      findingService = self->_findingService;
      if (findingService)
      {
        CFStringRef v14 = findingService;
      }
      else
      {
        dispatch_time_t v15 = +[NIServerFindingServicePool sharedInstance];
        CFStringRef v14 = [v15 serviceForToken:self->_findingToken createIfNotExists:0];
      }
      switch((unint64_t)v8)
      {
        case 2uLL:
          if (v11) {
            [(NIServerFindingService *)v14 processSelfLocation:v11];
          }
          break;
        case 3uLL:
          if (v12) {
            [(NIServerFindingService *)v14 processSelfHeading:v12];
          }
          break;
        case 4uLL:
          if (v11 && [(NIDiscoveryToken *)self->_findingToken isEqual:v9]) {
            [(NIServerFindingService *)v14 processPeerLocation:v11 forPeer:v9];
          }
          break;
        case 5uLL:
          if (v9 && v10 && [(NIDiscoveryToken *)self->_findingToken isEqual:v9]) {
            [(NIServerFindingService *)v14 processClientDiscoveryEventWithSharedConfigurationData:v10];
          }
          break;
        case 6uLL:
          if (v9 && [(NIDiscoveryToken *)self->_findingToken isEqual:v9]) {
            [(NIServerFindingService *)v14 processClientRemovePeerEvent];
          }
          break;
        default:
          break;
      }
    }
    else if (v8 == (id)6)
    {
      if (!v9 || ![(NIDiscoveryToken *)self->_findingToken isEqual:v9]) {
        goto LABEL_39;
      }
      CFStringRef v14 = +[NIServerFindableDeviceProxySessionManager sharedInstance];
      [(NIServerFindingService *)v14 processClientRemovePeerEventForToken:self->_findingToken];
    }
    else
    {
      if (v8 != (id)5 || !v9 || !v10 || ![(NIDiscoveryToken *)self->_findingToken isEqual:v9]) {
        goto LABEL_39;
      }
      CFStringRef v14 = +[NIServerFindableDeviceProxySessionManager sharedInstance];
      [(NIServerFindingService *)v14 processClientDiscoveryEventForToken:self->_findingToken sharedConfigurationData:v10];
    }

LABEL_39:
    goto LABEL_40;
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_100420464();
  }
LABEL_40:

  return 0;
}

- (void)serviceDidGenerateShareableConfigurationData:(id)a3 forObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  clientQueue = self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021AABC;
  block[3] = &unk_100855EB0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)clientQueue, block);
}

- (void)serviceDidDiscoverNearbyObject:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10021ABEC;
  v7[3] = &unk_100846588;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)clientQueue, v7);
}

- (void)serviceDidRemoveNearbyObject:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10021AD1C;
  v7[3] = &unk_100846588;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)clientQueue, v7);
}

- (void)serviceDidUpdateNearbyObjects:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10021AEC0;
  v7[3] = &unk_100846588;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)clientQueue, v7);
}

- (void)serviceDidUpdateAlgorithmConvergenceState:(id)a3 forObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  clientQueue = self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021B13C;
  block[3] = &unk_100855EB0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)clientQueue, block);
}

- (void)didGenerateShareableConfigurationData:(id)a3 forToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if ([(NIDiscoveryToken *)self->_findingToken isEqual:v7])
  {
    id v8 = [[NINearbyObject alloc] initWithToken:self->_findingToken];
    v11.receiver = self;
    v11.super_class = (Class)NIServerFindingSession;
    id v9 = [(NIServerBaseSession *)&v11 resourcesManager];
    id v10 = [v9 remote];
    [v10 didGenerateShareableConfigurationData:v6 forObject:v8];
  }
}

- (void)processVisionInput:(id)a3
{
}

+ (id)sharedServicePrintableState
{
  v2 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#find-ses,sharedServicePrintableState", v6, 2u);
  }
  v3 = +[NIServerFindingServicePool sharedInstance];
  id v4 = [v3 printableState];

  return v4;
}

- (NIFindingConfiguration)configuration
{
  return (NIFindingConfiguration *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_systemStatusPublisher, 0);
  objc_storeStrong((id *)&self->_runawayFindingBackstopTimer, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_findingService, 0);
  objc_storeStrong((id *)&self->_findingToken, 0);

  objc_storeStrong((id *)&self->_clientQueue, 0);
}

@end