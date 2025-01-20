@interface NIServerNearbyPeerSession
- (BOOL)_longRangeEnabled;
- (BOOL)_peerSupportsLongRange;
- (BOOL)_shouldBypassBluetoothDiscovery;
- (BOOL)isExtendedDistanceMeasurementEnabled;
- (BOOL)isLegacyDiscoveryToken:(id)a3;
- (BOOL)shouldInitiate:(id)a3 peerDiscoveryToken:(id)a4 error:(id *)a5;
- (BOOL)supportsBackgroundedClients;
- (BOOL)supportsCameraAssistance;
- (NINearbyPeerConfiguration)configuration;
- (NIServerNearbyPeerSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5;
- (duration<long)nominalCycleRate;
- (id).cxx_construct;
- (id)_addPeers:(id)a3;
- (id)_disableAllServicesAndSendHangupSignal:(BOOL)a3;
- (id)configure;
- (id)disableAllServices;
- (id)discoveryTokenFromIdentifier:(unint64_t)a3;
- (id)getContainerUniqueIdentifier;
- (id)getNIConfiguration;
- (id)getQueueForInputingData;
- (id)getResourcesManager;
- (id)lastConfiguration;
- (id)objectFromIdentifier:(unint64_t)a3;
- (id)pauseWithSource:(int64_t)a3;
- (id)run;
- (id)setDataFrame:(const void *)a3 forPeer:(id)a4;
- (optional<unsigned)identifierFromDiscoveryToken:(id)a3;
- (unint64_t)requiresNarrowbandToRun;
- (unint64_t)requiresSpatialInteractionBluetoothResource;
- (unint64_t)requiresUWBToRun;
- (void)_activateSensors;
- (void)_deactivateSensors;
- (void)_handleSessionBackgroundContinuationAuth:(BOOL)a3;
- (void)_peerHungUp:(id)a3;
- (void)_removePeerObject:(id)a3 withReason:(unint64_t)a4;
- (void)_startAltitudeUpdates;
- (void)_startDeviceMotionUpdates;
- (void)_startDevicePDRUpdates;
- (void)_startMotionActivityUpdates;
- (void)_startPedometerDataUpdates;
- (void)_startPedometerEventUpdates;
- (void)device:(id)a3 rediscovered:(id)a4;
- (void)deviceDiscovered:(id)a3;
- (void)deviceLost:(id)a3;
- (void)didInvalidateUWBSession;
- (void)didReceiveNewSolution:(const void *)a3;
- (void)didReceiveRemoteData:(const void *)a3;
- (void)didReceiveUnsuccessfulSolution:(const void *)a3;
- (void)didServiceRequestUpdateStatus:(ServiceRequestStatusUpdate)a3;
- (void)invalidate;
- (void)peerInactivityPeriodExceeded:(id)a3;
- (void)processVisionInput:(id)a3;
- (void)updatesEngine:(id)a3 didUpdateAlgorithmConvergenceState:(id)a4 forObject:(id)a5;
- (void)updatesEngine:(id)a3 didUpdateFindeeData:(const void *)a4 forToken:(id)a5;
- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4;
@end

@implementation NIServerNearbyPeerSession

- (NIServerNearbyPeerSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v44 = a4;
  uint64_t v10 = objc_opt_class();
  if (v10 != objc_opt_class())
  {
    v42 = +[NSAssertionHandler currentHandler];
    [v42 handleFailureInMethod:a2 object:self file:@"NIServerNearbyPeerSession.mm" lineNumber:109 description:@"NIServerNearbyPeerSession given invalid configuration."];
  }
  v11 = [v9 serverSessionIdentifier];

  if (!v11)
  {
    v43 = +[NSAssertionHandler currentHandler];
    [v43 handleFailureInMethod:a2, self, @"NIServerNearbyPeerSession.mm", 110, @"Invalid parameter not satisfying: %@", @"resourcesManager.serverSessionIdentifier" object file lineNumber description];
  }
  v47.receiver = self;
  v47.super_class = (Class)NIServerNearbyPeerSession;
  v12 = [(NIServerBaseSession *)&v47 initWithResourcesManager:v9 configuration:v44 error:a5];
  v13 = (id *)v12;
  if (!v12) {
    goto LABEL_16;
  }
  uint64_t v14 = [v9 clientConnectionQueue];
  v15 = (void *)*((void *)v12 + 8);
  *((void *)v12 + 8) = v14;

  id v16 = [v44 copy];
  v17 = (void *)*((void *)v12 + 55);
  *((void *)v12 + 55) = v16;

  v18 = [v9 serverSessionIdentifier];
  uint64_t v19 = [v18 UUIDString];
  v20 = (void *)*((void *)v12 + 9);
  *((void *)v12 + 9) = v19;

  [*((id *)v12 + 55) setSupportsCameraAssistance:+[NIPlatformInfo supportsSyntheticAperture](NIPlatformInfo, "supportsSyntheticAperture")];
  v21 = [NINearbyUpdatesEngine alloc];
  uint64_t v22 = *((void *)v12 + 55);
  uint64_t v23 = *((void *)v12 + 8);
  v24 = [v9 analytics];
  if (v9)
  {
    [v9 protobufLogger];
  }
  else
  {
    uint64_t v45 = 0;
    v46 = 0;
  }
  v25 = [(NINearbyUpdatesEngine *)v21 initWithConfiguration:v22 queue:v23 delegate:v12 dataSource:v12 analyticsManager:v24 protobufLogger:&v45 error:a5];
  v26 = (void *)*((void *)v12 + 6);
  *((void *)v12 + 6) = v25;

  if (v46) {
    sub_10001A970(v46);
  }

  if (!*((void *)v12 + 6))
  {
    v30 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,Failed to create updates engine, cannot create session.", buf, 2u);
    }
LABEL_16:
    v31 = 0;
    goto LABEL_33;
  }
  id v27 = objc_alloc_init((Class)NSOperationQueue);
  v28 = (void *)*((void *)v12 + 17);
  *((void *)v12 + 17) = v27;

  [*((id *)v12 + 17) setUnderlyingQueue:*((void *)v12 + 8)];
  v12[232] = 0;
  v12[112] = 1;
  if (v9)
  {
    [v9 powerBudgetProvider];
    long long v29 = *(_OWORD *)buf;
  }
  else
  {
    long long v29 = 0uLL;
  }
  memset(buf, 0, sizeof(buf));
  v32 = (std::__shared_weak_count *)*((void *)v12 + 12);
  *(_OWORD *)(v12 + 88) = v29;
  if (v32)
  {
    sub_10001A970(v32);
    if (*(void *)&buf[8]) {
      sub_10001A970(*(std::__shared_weak_count **)&buf[8]);
    }
  }
  v33 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = sub_10018ADD0();
    CFStringRef v35 = @"No";
    if (v34) {
      CFStringRef v35 = @"Yes";
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v35;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,Power budget reporting to CPMS is supported: %@", buf, 0xCu);
  }

  unsigned int v36 = [v13[55] isExtendedDistanceMeasurementEnabled];
  v37 = qword_1008ABDE0;
  BOOL v38 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
  if (v36)
  {
    if (v38)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,extended distance measurement is enabled. Using NMI session", buf, 2u);
    }
    v39 = [[NIServerNearbyPeerNbammsSession alloc] initWithDataSource:v13 delegate:v13 clientQueue:v13[8]];
  }
  else
  {
    if (v38)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,extended distance measurement not enabled. Using GR session", buf, 2u);
    }
    v39 = [[NIServerNearbyPeerGrSession alloc] initWithDataSource:v13 delegate:v13 clientQueue:v13[8]];
  }
  id v40 = v13[10];
  v13[10] = v39;

  v13[15] = 0;
  v31 = v13;
LABEL_33:

  return v31;
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (BOOL)supportsCameraAssistance
{
  return +[NIPlatformInfo supportsSyntheticAperture];
}

- (BOOL)supportsBackgroundedClients
{
  return self->_backgroundedClientsSupported;
}

- (unint64_t)requiresUWBToRun
{
  return 2;
}

- (unint64_t)requiresNarrowbandToRun
{
  if (!self->_subspecializedPeerSession) {
    sub_100425FE8();
  }
  if ([(NIServerNearbyPeerSession *)self isExtendedDistanceMeasurementEnabled]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (unint64_t)requiresSpatialInteractionBluetoothResource
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
    sub_100426014();
  }
  v4 = [(NINearbyPeerConfiguration *)configuration peerDiscoveryToken];
  if (!v4) {
    goto LABEL_4;
  }
  v5 = [(NINearbyPeerConfiguration *)self->_configuration peerDiscoveryToken];
  v6 = [v5 rawToken];
  id v7 = [v6 length];

  if ((unint64_t)v7 <= 0xF)
  {
LABEL_4:
    NSErrorUserInfoKey v45 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v46 = @"Peer discovery token nil or invalid.";
    id v8 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    id v9 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:v8];
LABEL_26:
    uint64_t v19 = v9;
    goto LABEL_27;
  }
  uint64_t v10 = [(NINearbyPeerConfiguration *)self->_configuration peerDiscoveryToken];
  v11 = sub_1002B7DA4(v10);
  v12 = v11;
  if (v11)
  {
    v13 = [v11 objectForKeyedSubscript:&off_1008788C8];
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v14 = [v12 objectForKeyedSubscript:&off_1008788E0];
      if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v15 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,Discovery token is valid.", buf, 2u);
        }
        id v16 = v12;
        id v17 = 0;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10042613C();
        }
        id v17 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
        id v16 = 0;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100426108();
      }
      id v17 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
      id v16 = 0;
    }
  }
  else
  {
    id v17 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
    id v16 = 0;
  }

  id v8 = v17;
  peerTokenDict = self->_peerTokenDict;
  self->_peerTokenDict = v16;

  if (v8)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_1004260A0();
    }
    id v9 = v8;
    id v8 = v9;
    goto LABEL_26;
  }
  if (!self->_peerTokenDict) {
    sub_100426040();
  }
  if ([(NIServerNearbyPeerSession *)self _peerSupportsLongRange])
  {
    v21 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,Peer supports long range.", buf, 2u);
    }
  }
  uint64_t v22 = [(NIServerNearbyPeerSubspecializationProtocol *)self->_subspecializedPeerSession configure];
  uint64_t v23 = v22;
  if (v22)
  {
    id v24 = v22;
  }
  else
  {
    v25 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = +[NIInternalUtils NISessionBackgroundModeToString:[(NINearbyPeerConfiguration *)self->_configuration backgroundMode]];
      *(_DWORD *)buf = 136315138;
      id v44 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,Configuration background mode: %s", buf, 0xCu);
    }

    int64_t v27 = [(NINearbyPeerConfiguration *)self->_configuration backgroundMode];
    if (v27 != 2)
    {
      if (v27 == 1)
      {
        long long v29 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,Configured for background continuation", buf, 2u);
        }
        v41.receiver = self;
        v41.super_class = (Class)NIServerNearbyPeerSession;
        v30 = [(NIServerBaseSession *)&v41 resourcesManager];
        objc_initWeak((id *)buf, self);
        v31 = [NIServerBackgroundContinuationManager alloc];
        containerUniqueIdentifier = self->_containerUniqueIdentifier;
        v33 = [v30 appStateMonitor];
        clientQueue = self->_clientQueue;
        CFStringRef v35 = [v30 analytics];
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_1002729D0;
        v39[3] = &unk_100847538;
        objc_copyWeak(&v40, (id *)buf);
        unsigned int v36 = [(NIServerBackgroundContinuationManager *)v31 initWithSessionIdentifier:containerUniqueIdentifier appStateMonitor:v33 queue:clientQueue analyticsManager:v35 backgroundAuthHandler:v39];
        backgroundContinuationManager = self->_backgroundContinuationManager;
        self->_backgroundContinuationManager = v36;

        BOOL v38 = [v30 lifecycleSupervisor];
        [v38 setTimeoutOnPeerInactivity:0];

        objc_destroyWeak(&v40);
        objc_destroyWeak((id *)buf);
      }
      else if (!v27)
      {
        self->_backgroundedClientsSupported = 0;
        v42.receiver = self;
        v42.super_class = (Class)NIServerNearbyPeerSession;
        v28 = [(NIServerBaseSession *)&v42 backgroundSupportUpdateHandler];
        ((void (**)(void, BOOL))v28)[2](v28, self->_backgroundedClientsSupported);
      }
      uint64_t v19 = 0;
      goto LABEL_47;
    }
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10042606C();
    }
    id v24 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
  }
  uint64_t v19 = v24;
LABEL_47:

LABEL_27:

  return v19;
}

- (id)run
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v3 = [(NINearbyPeerConfiguration *)self->_configuration peerDiscoveryToken];
  v12 = v3;
  v4 = +[NSArray arrayWithObjects:&v12 count:1];
  v5 = [(NIServerNearbyPeerSession *)self _addPeers:v4];

  if (!v5)
  {
    v6 = [(NIServerNearbyPeerSession *)self getResourcesManager];
    id v7 = [v6 lifecycleSupervisor];
    id v8 = [(NINearbyPeerConfiguration *)self->_configuration peerDiscoveryToken];
    v11 = v8;
    id v9 = +[NSArray arrayWithObjects:&v11 count:1];
    [v7 startedDiscoveringPeersWithTokens:v9];

    v5 = [(NIServerNearbyPeerSubspecializationProtocol *)self->_subspecializedPeerSession run];
    if (!v5) {
      self->_shouldDeliverUpdates = 1;
    }
  }

  return v5;
}

- (id)pauseWithSource:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  self->_shouldDeliverUpdates = 0;
  v4 = [(NIServerNearbyPeerSession *)self _disableAllServicesAndSendHangupSignal:0];
  v8.receiver = self;
  v8.super_class = (Class)NIServerNearbyPeerSession;
  v5 = [(NIServerBaseSession *)&v8 resourcesManager];
  v6 = [v5 lifecycleSupervisor];
  [v6 pauseCalled];

  return v4;
}

- (id)disableAllServices
{
  return [(NIServerNearbyPeerSession *)self _disableAllServicesAndSendHangupSignal:1];
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  id v3 = [(NIServerNearbyPeerSession *)self disableAllServices];
  v4.receiver = self;
  v4.super_class = (Class)NIServerNearbyPeerSession;
  [(NIServerBaseSession *)&v4 invalidate];
  self->_shouldDeliverUpdates = 0;
}

- (void)deviceDiscovered:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (![(NIServerNearbyPeerSession *)self _shouldBypassBluetoothDiscovery]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [(NIServerNearbyPeerSubspecializationProtocol *)self->_subspecializedPeerSession deviceDiscovered:v4];
  }
}

- (void)device:(id)a3 rediscovered:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  objc_super v8 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138478083;
    id v10 = v7;
    __int16 v11 = 2113;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,discoveredDevice:didUpdate: new: %{private}@, cached: %{private}@", (uint8_t *)&v9, 0x16u);
  }
  if (![(NIServerNearbyPeerSession *)self _shouldBypassBluetoothDiscovery]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [(NIServerNearbyPeerSubspecializationProtocol *)self->_subspecializedPeerSession device:v6 rediscovered:v7];
  }
}

- (void)deviceLost:(id)a3
{
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)150;
}

- (BOOL)isExtendedDistanceMeasurementEnabled
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)getContainerUniqueIdentifier
{
  return self->_containerUniqueIdentifier;
}

- (id)getNIConfiguration
{
  return self->_configuration;
}

- (id)getResourcesManager
{
  v4.receiver = self;
  v4.super_class = (Class)NIServerNearbyPeerSession;
  v2 = [(NIServerBaseSession *)&v4 resourcesManager];

  return v2;
}

- (BOOL)isLegacyDiscoveryToken:(id)a3
{
  id v3 = [a3 objectInRawTokenOPACKDictForKey:&off_100878898];
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)shouldInitiate:(id)a3 peerDiscoveryToken:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  id v10 = [(NINearbyPeerConfiguration *)self->_configuration debugParameters];
  if (!v10) {
    goto LABEL_6;
  }
  __int16 v11 = [(NINearbyPeerConfiguration *)self->_configuration debugParameters];
  id v12 = [v11 objectForKey:@"role"];

  if (!v12) {
    goto LABEL_6;
  }
  v13 = [(NINearbyPeerConfiguration *)self->_configuration debugParameters];
  uint64_t v14 = [v13 objectForKey:@"role"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v16 = [(NINearbyPeerConfiguration *)self->_configuration debugParameters];
    id v17 = [v16 objectForKey:@"role"];
    unsigned int v18 = [v17 intValue];

    BOOL v19 = v18 == 0;
    if (v18 >= 2)
    {
      NSErrorUserInfoKey v59 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v60 = @"Invalid debugParameters role";
      v20 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
      *a5 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:v20];

      goto LABEL_26;
    }
  }
  else
  {
LABEL_6:
    v21 = [v8 rawToken];
    uint64_t v22 = [v9 rawToken];
    unsigned int v23 = [v21 isEqualToData:v22];

    if (v23)
    {
      NSErrorUserInfoKey v57 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v58 = @"Peer and local discovery token are identical";
      id v24 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
      *a5 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10012 userInfo:v24];

      goto LABEL_26;
    }
    v25 = [v8 objectInRawTokenOPACKDictForKey:&off_100878898];
    if (!v25
      || ([v9 objectInRawTokenOPACKDictForKey:&off_100878898],
          v26 = objc_claimAutoreleasedReturnValue(),
          v26,
          v25,
          !v26))
    {
      v30 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,shouldInitiate using legacy initiator selection logic", buf, 2u);
      }
      v31 = [v8 rawToken];
      if ((unint64_t)[v31 length] <= 7)
      {
      }
      else
      {
        v32 = [v9 rawToken];
        BOOL v33 = (unint64_t)[v32 length] < 8;

        if (!v33)
        {
          id v34 = [v8 rawToken];
          unint64_t v35 = *(void *)[v34 bytes];

          id v36 = [v9 rawToken];
          unint64_t v37 = *(void *)[v36 bytes];

          if (v35 == v37)
          {
            BOOL v38 = [v8 rawToken];
            v39 = [v38 _reverse];

            id v40 = [v9 rawToken];
            objc_super v41 = [v40 _reverse];

            id v42 = v39;
            unint64_t v35 = *(void *)[v42 bytes];
            id v43 = v41;
            unint64_t v37 = *(void *)[v43 bytes];
            if (v35 == v37)
            {
              NSErrorUserInfoKey v53 = NSLocalizedFailureReasonErrorKey;
              CFStringRef v54 = @"Relevant parts of discovery token are identical to local token";
              id v44 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
              *a5 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10012 userInfo:v44];

              if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
                sub_100426170();
              }

              goto LABEL_26;
            }
          }
          BOOL v19 = v35 > v37;
          goto LABEL_27;
        }
      }
      NSErrorUserInfoKey v55 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v56 = @"Discovery token are too short";
      NSErrorUserInfoKey v45 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
      *a5 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10012 userInfo:v45];

LABEL_26:
      BOOL v19 = 0;
      goto LABEL_27;
    }
    int64_t v27 = [v8 getIRK];
    v28 = [v9 getIRK];
    if ([v27 length] == (id)16
      && [v28 length] == (id)16
      && ![v27 isEqualToData:v28])
    {
      unint64_t v49 = 0;
      *(void *)buf = 0;
      unint64_t v47 = 0;
      unint64_t v48 = 0;
      [v27 getBytes:&v49 range:0, 8];
      [v27 getBytes:buf range:8];
      [v28 getBytes:&v47 range:0];
      [v28 getBytes:&v48 range:8];
      if (*(void *)buf == v48) {
        BOOL v19 = v49 > v47;
      }
      else {
        BOOL v19 = *(void *)buf > v48;
      }
    }
    else
    {
      NSErrorUserInfoKey v51 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v52 = @"Peer and local discovery token IRKs are identical or invalid";
      long long v29 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      *a5 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:v29];

      BOOL v19 = 0;
    }
  }
LABEL_27:

  return v19;
}

- (void)didReceiveNewSolution:(const void *)a3
{
  if (*((unsigned char *)a3 + 24))
  {
    double v5 = *((double *)a3 + 2);
    p_cachedSolutionMacAddr = &self->_cachedSolutionMacAddr;
    self->_cachedSolutionMacAddr = *((void *)a3 + 5);
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
      sub_1004261D8();
    }
    id v7 = [(NIServerNearbyPeerSession *)self discoveryTokenFromIdentifier:*p_cachedSolutionMacAddr];
    if (v7)
    {
      v20.receiver = self;
      v20.super_class = (Class)NIServerNearbyPeerSession;
      id v8 = [(NIServerBaseSession *)&v20 resourcesManager];
      id v9 = [v8 lifecycleSupervisor];
      unsigned __int8 v10 = [v9 isTrackingPeer:v7];

      if (v10)
      {
        __int16 v11 = [(NINearbyPeerConfiguration *)self->_configuration debugParameters];
        if (!v11) {
          goto LABEL_13;
        }
        id v12 = [(NINearbyPeerConfiguration *)self->_configuration debugParameters];
        v13 = [v12 objectForKey:@"enableAdditionalUWBSignalFeatures"];

        if (!v13) {
          goto LABEL_13;
        }
        uint64_t v14 = [(NINearbyPeerConfiguration *)self->_configuration debugParameters];
        v15 = [v14 objectForKey:@"enableAdditionalUWBSignalFeatures"];

        if (v15 && (unsigned __int8 v16 = [v15 BOOLValue], v15, (v16 & 1) != 0))
        {
          long long v18 = xmmword_1004BCA18;
          uint64_t v19 = 1;
          [(NINearbyUpdatesEngine *)self->_updatesEngine acceptRoseSolution:a3 withProcessingOptions:&v18];
        }
        else
        {
LABEL_13:
          [(NINearbyUpdatesEngine *)self->_updatesEngine acceptRoseSolution:a3];
        }
        id v17 = [v8 lifecycleSupervisor];
        [v17 measurementReceivedForToken:v7 contTimestamp:v5];

        [(NIServerBackgroundContinuationManager *)self->_backgroundContinuationManager measurementReceived];
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_1004261A4();
  }
}

- (void)didReceiveUnsuccessfulSolution:(const void *)a3
{
  if (*((unsigned char *)a3 + 24))
  {
    double v5 = [(NIServerNearbyPeerSession *)self discoveryTokenFromIdentifier:*((void *)a3 + 5)];
    if (v5)
    {
      v9.receiver = self;
      v9.super_class = (Class)NIServerNearbyPeerSession;
      id v6 = [(NIServerBaseSession *)&v9 resourcesManager];
      id v7 = [v6 lifecycleSupervisor];
      unsigned __int8 v8 = [v7 isTrackingPeer:v5];

      if (v8) {
        [(NINearbyUpdatesEngine *)self->_updatesEngine acceptUnsuccessfulRoseSolution:a3];
      }
    }
  }
}

- (void)didReceiveRemoteData:(const void *)a3
{
  if (self->_configuration)
  {
    if ([(NIServerNearbyPeerSession *)self isExtendedDistanceMeasurementEnabled])
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
        sub_1004262E8();
      }
      double v5 = [(NIServerNearbyPeerSession *)self discoveryTokenFromIdentifier:*((void *)a3 + 5)];
      if (v5)
      {
        id v6 = [(NINearbyPeerConfiguration *)self->_configuration peerDiscoveryToken];
        unsigned __int8 v7 = [v5 isEqual:v6];

        if (v7)
        {
          sub_100004950(__p, "Receive");
          sub_100239FBC((uint64_t **)__p, (uint64_t *)a3 + 1);
          if (v25 < 0) {
            operator delete(*(void **)__p);
          }
          __p[0] = 0;
          BYTE2(v24) = 0;
          char v26 = 0;
          char v27 = 0;
          char v28 = 0;
          char v29 = 0;
          char v33 = 0;
          __int16 v34 = 0;
          uint64_t v30 = 0;
          uint64_t v31 = 0;
          char v32 = 0;
          unsigned __int8 v8 = sub_100007D00();
          BOOL v9 = sub_100005424(v8[144]);
          uint64_t v20 = 0;
          BOOL v21 = v9;
          if (sub_1002397F4((uint64_t)a3 + 8, (uint64_t)__p, (uint64_t)&v20))
          {
            uint64_t v30 = *((void *)a3 + 4);
            LOBYTE(v31) = 1;
            [(NINearbyUpdatesEngine *)self->_updatesEngine acceptPeerData:__p fromPeer:v5];
            if (BYTE1(v20) && (_BYTE)v20)
            {
              unsigned __int8 v10 = qword_1008ABDE0;
              if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)uint64_t v19 = 0;
                _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,Received hangup signal", v19, 2u);
              }
              [(NIServerNearbyPeerSession *)self _peerHungUp:v5];
            }
          }
          else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
          {
            sub_1004262B4();
          }
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
      {
        sub_10042624C();
      }
    }
    else
    {
      __int16 v11 = (unsigned char *)*((void *)a3 + 1);
      if (*((void *)a3 + 2) - (void)v11 > 0xFuLL)
      {
        if (*v11 == 2)
        {
          int v13 = v11[1];
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
            sub_1004262E8();
          }
          uint64_t v15 = *((void *)a3 + 5);
          uint64_t v14 = (uint64_t *)((char *)a3 + 40);
          unsigned __int8 v16 = [(NIServerNearbyPeerSession *)self discoveryTokenFromIdentifier:v15];
          if (v16)
          {
            if (v13)
            {
              id v17 = qword_1008ABDE0;
              if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v18 = *v14;
                *(_DWORD *)__p = 134283779;
                *(void *)&__p[4] = v18;
                __int16 v23 = 2113;
                id v24 = v16;
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,#hangup Received hangup from 0x%{private}llx. Token: %{private}@", __p, 0x16u);
              }
              [(NIServerNearbyPeerSession *)self _peerHungUp:v16];
            }
          }
          else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
          {
            sub_10042624C();
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
        {
          sub_1004263B4();
        }
      }
      else
      {
        id v12 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10042631C((_DWORD *)a3 + 4, (_DWORD *)a3 + 2, v12);
        }
      }
    }
  }
}

- (void)didServiceRequestUpdateStatus:(ServiceRequestStatusUpdate)a3
{
  int var2 = a3.var2;
  uint64_t v4 = *(void *)&a3.var0;
  v21.receiver = self;
  v21.super_class = (Class)NIServerNearbyPeerSession;
  id v6 = [(NIServerBaseSession *)&v21 resourcesManager];
  unsigned __int8 v7 = [v6 lifecycleSupervisor];

  unsigned __int8 v8 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    sub_100004950(v19, off_10085C210[v4 >> 32]);
    int v9 = v20;
    unsigned __int8 v10 = (void **)v19[0];
    sub_100004950(__p, off_10085C288[var2]);
    __int16 v11 = v19;
    if (v9 < 0) {
      __int16 v11 = v10;
    }
    if (v18 >= 0) {
      id v12 = __p;
    }
    else {
      id v12 = (void **)__p[0];
    }
    *(_DWORD *)buf = 136315394;
    id v24 = v11;
    __int16 v25 = 2080;
    char v26 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,serviceRequestDidUpdateStatus - update: %s, reason: %s", buf, 0x16u);
    if (v18 < 0) {
      operator delete(__p[0]);
    }
    if (v20 < 0) {
      operator delete(v19[0]);
    }
  }

  if (HIDWORD(v4) == 3)
  {
    [v7 positioningSensorSessionStopped];
  }
  else if (HIDWORD(v4) == 1)
  {
    [v7 positioningSensorSessionStarted];
    if ([(NIServerNearbyPeerSession *)self isExtendedDistanceMeasurementEnabled]) {
      [(NIServerNearbyPeerSession *)self _activateSensors];
    }
  }
  if (var2 == 8)
  {
    configuration = self->_configuration;
    if (configuration)
    {
      uint64_t v14 = [(NINearbyPeerConfiguration *)configuration peerDiscoveryToken];
      uint64_t v22 = v14;
      uint64_t v15 = +[NSArray arrayWithObjects:&v22 count:1];
      [v7 stoppedDiscoveringPeersWithTokens:v15];

      unsigned __int8 v16 = [(NINearbyPeerConfiguration *)self->_configuration peerDiscoveryToken];
      [(NIServerNearbyPeerSession *)self peerInactivityPeriodExceeded:v16];
    }
  }
}

- (void)didInvalidateUWBSession
{
  id v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,Invalidating ni peer session", buf, 2u);
  }
  [(NIServerNearbyPeerSession *)self invalidate];
  v6.receiver = self;
  v6.super_class = (Class)NIServerNearbyPeerSession;
  uint64_t v4 = [(NIServerBaseSession *)&v6 invalidationHandler];
  double v5 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:0];
  ((void (**)(void, void *))v4)[2](v4, v5);
}

- (BOOL)_longRangeEnabled
{
  id v3 = [(NIServerBaseSession *)self resourcesManager];
  unsigned int v4 = [v3 longRangeEnabled];

  unsigned int v5 = [(NINearbyPeerConfiguration *)self->_configuration isLongRangeEnabled];
  unsigned int v6 = [(NIServerNearbyPeerSession *)self _peerSupportsLongRange];
  unsigned int v7 = v6;
  if ((v4 & v5 & 1) == 0)
  {
    if (v6)
    {
      unsigned __int8 v8 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,WARNING: longRange is disabled locally, but the peer supports it.", buf, 2u);
      }
    }
  }
  if (((v4 & v5 ^ 1 | v7) & 1) == 0)
  {
    int v9 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,longRange is supported locally, but the peer does NOT support it.", v11, 2u);
    }
  }
  return v4 & v7 & v5;
}

- (BOOL)_peerSupportsLongRange
{
  if (self->_configuration)
  {
    v2 = [(NSDictionary *)self->_peerTokenDict objectForKeyedSubscript:&off_1008788B0];
    if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      unint64_t v3 = (unint64_t)[v2 unsignedIntValue] & 1;
    }
    else {
      LOBYTE(v3) = 0;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)_disableAllServicesAndSendHangupSignal:(BOOL)a3
{
  if (self->_configuration)
  {
    BOOL v3 = a3;
    v25.receiver = self;
    v25.super_class = (Class)NIServerNearbyPeerSession;
    unsigned int v5 = [(NIServerBaseSession *)&v25 disableAllServices];
    if ([(NIServerNearbyPeerSession *)self isExtendedDistanceMeasurementEnabled])
    {
      if (v3)
      {
        if (!self->_currentFindeeData.__engaged_)
        {
          memset(&buf[7], 0, 17);
          self->_currentFindeeData.var0.__null_state_ = 0;
          self->_currentFindeeData.var0.__val_.bounded_displacement.__engaged_ = 0;
          self->_currentFindeeData.var0.__val_.measured_displacement.var0.__null_state_ = 0;
          self->_currentFindeeData.var0.__val_.measured_displacement.__engaged_ = 0;
          self->_currentFindeeData.var0.__val_.measured_velocity_change.var0.__null_state_ = 0;
          self->_currentFindeeData.var0.__val_.measured_velocity_change.__engaged_ = 0;
          *(_OWORD *)(&self->_currentFindeeData.var0.__val_.measured_velocity_change.__engaged_ + 1) = *(_OWORD *)buf;
          *(void *)(&self->_currentFindeeData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_ + 1) = *(void *)&buf[16];
          self->_currentFindeeData.var0.__val_.location_data.__engaged_ = 0;
          self->_currentFindeeData.var0.__val_.good_gnss_conditions_detected = 0;
          self->_currentFindeeData.__engaged_ = 1;
        }
        p_currentSignallingData = &self->_currentSignallingData;
        if (!self->_currentSignallingData.__engaged_)
        {
          unsigned int v7 = sub_100007D00();
          BOOL v8 = sub_100005424(v7[144]);
          BOOL engaged = self->_currentSignallingData.__engaged_;
          *(void *)&p_currentSignallingData->var0.__null_state_ = 0;
          self->_currentSignallingData.var0.__val_.isPhone = v8;
          if (!engaged) {
            self->_currentSignallingData.__engaged_ = 1;
          }
        }
        *(_WORD *)&p_currentSignallingData->var0.__null_state_ = 257;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
          sub_1004263E8();
        }
        unsigned __int8 v10 = +[NSUserDefaults standardUserDefaults];
        unsigned int v11 = [v10 BOOLForKey:@"FindingDisableHangup"];

        if (v11)
        {
          id v12 = qword_1008ABDE0;
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,Would set hangup bit, but it's disabled in defaults writes", buf, 2u);
          }
          if (!self->_currentSignallingData.__engaged_) {
            sub_10000AE44();
          }
          *(_WORD *)&p_currentSignallingData->var0.__null_state_ = 256;
        }
        if (!self->_currentFindeeData.__engaged_) {
          sub_10000AE44();
        }
        int v13 = [(NINearbyPeerConfiguration *)self->_configuration peerDiscoveryToken];
        id v14 = [(NIServerNearbyPeerSession *)self setDataFrame:&self->_currentFindeeData forPeer:v13];

        v15.__rep_ = (int64_t)[(NIServerNearbyPeerSession *)self nominalCycleRate];
        if (v15.__rep_ >= 1)
        {
          uint64_t v16 = 1000000 * v15.__rep_;
          if ((unint64_t)v15.__rep_ >= 0x8637BD057A0) {
            uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
          }
          *(void *)buf = v16;
          std::this_thread::sleep_for ((const std::chrono::nanoseconds *)buf);
        }
      }
      if (self->_currentFindeeData.__engaged_) {
        self->_currentFindeeData.__engaged_ = 0;
      }
      if (self->_currentSignallingData.__engaged_) {
        self->_currentSignallingData.__engaged_ = 0;
      }
      [(NIServerNearbyPeerSession *)self _deactivateSensors];
    }
    else if (![(NIServerNearbyPeerSession *)self _longRangeEnabled] && v3)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
        sub_1004263E8();
      }
      LOBYTE(__ns.__rep_) = 0;
      sub_1001B0664(buf, 0x10uLL, &__ns);
      uint64_t v17 = *(void *)buf;
      **(_WORD **)buf = 258;
      *(void *)(v17 + 2) = 0;
      *(void *)(v17 + 8) = 0;
      subspecializedPeerSession = self->_subspecializedPeerSession;
      if (subspecializedPeerSession)
      {
        [(NIServerNearbyPeerSubspecializationProtocol *)subspecializedPeerSession updatePeerData:buf];
        v19.__rep_ = (int64_t)[(NIServerNearbyPeerSession *)self nominalCycleRate];
        if (v19.__rep_ >= 1)
        {
          std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v20 = 1000000 * v19.__rep_;
          if ((unint64_t)v19.__rep_ >= 0x8637BD057A0) {
            std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v20 = 0x7FFFFFFFFFFFFFFFLL;
          }
          __ns.__rep_ = v20;
          std::this_thread::sleep_for (&__ns);
        }
      }
      if (*(void *)buf)
      {
        *(void *)&uint8_t buf[8] = *(void *)buf;
        operator delete(*(void **)buf);
      }
    }
    objc_super v21 = self->_subspecializedPeerSession;
    if (v21) {
      [(NIServerNearbyPeerSubspecializationProtocol *)v21 invalidate];
    }
    configuration = self->_configuration;
    self->_configuration = 0;

    self->_cachedSolutionMacAddr = 0;
    [(NIServerBackgroundContinuationManager *)self->_backgroundContinuationManager invalidate];
    backgroundContinuationManager = self->_backgroundContinuationManager;
    self->_backgroundContinuationManager = 0;
  }
  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (id)_addPeers:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NIServerNearbyPeerSession;
  unsigned int v5 = [(NIServerBaseSession *)&v19 resourcesManager];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v6);
      }
      unsigned __int8 v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
      unsigned int v11 = [v5 btResource:v15];
      id v12 = [v10 rawToken];
      int v13 = [v11 addPeerDiscoveryToken:v12];

      if (v13) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    int v13 = 0;
  }

  return v13;
}

- (void)_peerHungUp:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NIServerNearbyPeerSession;
  unsigned int v5 = [(NIServerBaseSession *)&v11 resourcesManager];
  id v6 = [v5 btResource];
  id v7 = [v6 deviceCache];
  uint64_t v8 = [v4 rawToken];
  unsigned __int8 v9 = [v7 isCachedByTokenData:v8];

  if (v9)
  {
    unsigned __int8 v10 = [v5 lifecycleSupervisor];
    [v10 peerHangupReceived:v4];

    [(NIServerNearbyPeerSession *)self _removePeerObject:v4 withReason:1];
  }
}

- (void)_removePeerObject:(id)a3 withReason:(unint64_t)a4
{
  id v6 = a3;
  [(NINearbyUpdatesEngine *)self->_updatesEngine clearStateForToken:v6];
  v22.receiver = self;
  v22.super_class = (Class)NIServerNearbyPeerSession;
  id v7 = [(NIServerBaseSession *)&v22 resourcesManager];
  uint64_t v8 = [v7 btResource];
  unsigned __int8 v9 = [v8 deviceCache];
  unsigned __int8 v10 = [v6 rawToken];
  unsigned __int8 v11 = [v9 uncacheDeviceByTokenData:v10];

  if ((v11 & 1) == 0)
  {
    id v12 = [v7 lifecycleSupervisor];
    unsigned int v13 = [v12 isTracking];

    if (v13)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_1004264B8();
      }
    }
  }
  id v14 = [[NINearbyObject alloc] initWithToken:v6];
  long long v15 = [v7 remote];
  char v27 = v14;
  long long v16 = +[NSArray arrayWithObjects:&v27 count:1];
  [v15 didRemoveNearbyObjects:v16 withReason:a4];

  if (a4)
  {
    if (a4 == 1)
    {
      CFStringRef v17 = @"Hangup";
    }
    else
    {
      if (a4 == 2)
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
          sub_100426484();
        }
        objc_super v21 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          id v24 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerNearbyPeerSession.mm";
          __int16 v25 = 1024;
          *(_DWORD *)char v26 = 837;
          *(_WORD *)&v26[4] = 2080;
          *(void *)&v26[6] = "-[NIServerNearbyPeerSession _removePeerObject:withReason:]";
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "#ses-nrby-peer,%s:%d: assertion failure in %s", buf, 0x1Cu);
        }
        abort();
      }
      CFStringRef v17 = &stru_100869B68;
    }
  }
  else
  {
    CFStringRef v17 = @"Timeout";
  }
  long long v18 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    *(_DWORD *)buf = 138412802;
    id v24 = (const char *)v14;
    __int16 v25 = 2112;
    *(void *)char v26 = v17;
    *(_WORD *)&v26[8] = 2112;
    *(void *)&v26[10] = containerUniqueIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,_removePeerObject: %@ with reason: %@ for session identifier: %@", buf, 0x20u);
  }
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v20 = [(NIServerNearbyPeerSession *)self _disableAllServicesAndSendHangupSignal:a4 != 1];
  if (v20 && os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_10042641C();
  }
}

- (BOOL)_shouldBypassBluetoothDiscovery
{
  unsigned int v2 = [(NIServerNearbyPeerSubspecializationProtocol *)self->_subspecializedPeerSession shouldBypassBleDiscovery];
  BOOL v3 = +[NSUserDefaults standardUserDefaults];
  unsigned int v4 = v2 | [v3 BOOLForKey:@"FindingBypassDiscovery"];

  unsigned int v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,Should bypass Ble discovery %d", (uint8_t *)v7, 8u);
  }
  return v4;
}

- (id)setDataFrame:(const void *)a3 forPeer:(id)a4
{
  id v6 = a4;
  id v7 = [(NINearbyPeerConfiguration *)self->_configuration peerDiscoveryToken];
  unsigned __int8 v8 = [v6 isEqual:v7];

  if (v8)
  {
    p_currentFindeeData = &self->_currentFindeeData;
    long long v10 = *(_OWORD *)a3;
    long long v11 = *((_OWORD *)a3 + 2);
    if (self->_currentFindeeData.__engaged_)
    {
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.bounded_displacement.__engaged_ = *((_OWORD *)a3 + 1);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.applicabilityTimestamp = v11;
      *(_OWORD *)&p_currentFindeeData->var0.__null_state_ = v10;
      long long v12 = *((_OWORD *)a3 + 3);
      long long v13 = *((_OWORD *)a3 + 4);
      long long v14 = *((_OWORD *)a3 + 6);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.var0.__null_state_ = *((_OWORD *)a3 + 5);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1 = v14;
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.displacementH1 = v12;
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.displacementV = v13;
      long long v15 = *((_OWORD *)a3 + 7);
      long long v16 = *((_OWORD *)a3 + 8);
      long long v17 = *((_OWORD *)a3 + 9);
      *(_OWORD *)((char *)&self->_currentFindeeData.var0.__val_.location_data.var0.__val_.uncertainty + 2) = *(_OWORD *)((char *)a3 + 154);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_ = v16;
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.location_data.var0.__val_.easterlyOffsetM = v17;
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.__engaged_ = v15;
    }
    else
    {
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.bounded_displacement.__engaged_ = *((_OWORD *)a3 + 1);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.applicabilityTimestamp = v11;
      *(_OWORD *)&p_currentFindeeData->var0.__null_state_ = v10;
      long long v20 = *((_OWORD *)a3 + 3);
      long long v21 = *((_OWORD *)a3 + 4);
      long long v22 = *((_OWORD *)a3 + 6);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.var0.__null_state_ = *((_OWORD *)a3 + 5);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1 = v22;
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.displacementH1 = v20;
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.displacementV = v21;
      long long v23 = *((_OWORD *)a3 + 7);
      long long v24 = *((_OWORD *)a3 + 8);
      long long v25 = *((_OWORD *)a3 + 10);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.location_data.var0.__val_.easterlyOffsetM = *((_OWORD *)a3 + 9);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.location_data.__engaged_ = v25;
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.__engaged_ = v23;
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_ = v24;
      self->_currentFindeeData.__engaged_ = 1;
    }
    unint64_t v48 = 0;
    unint64_t v49 = 0;
    uint64_t v50 = 0;
    long long v26 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.location_data.var0.__val_.easterlyOffsetM;
    long long v46 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_;
    v47[0] = v26;
    *(_OWORD *)((char *)v47 + 10) = *(_OWORD *)((char *)&self->_currentFindeeData.var0.__val_.location_data.var0.__val_.uncertainty
                                              + 2);
    long long v27 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.var0.__null_state_;
    long long v42 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.displacementV;
    long long v43 = v27;
    long long v28 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.__engaged_;
    long long v44 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1;
    long long v45 = v28;
    long long v29 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.bounded_displacement.__engaged_;
    *(_OWORD *)__p = *(_OWORD *)&p_currentFindeeData->var0.__null_state_;
    long long v39 = v29;
    long long v30 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.displacementH1;
    long long v40 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.applicabilityTimestamp;
    long long v41 = v30;
    if (self->_currentSignallingData.__engaged_)
    {
      uint64_t v36 = *(void *)&self->_currentSignallingData.var0.__null_state_;
      LOBYTE(v37) = self->_currentSignallingData.var0.__val_.isPhone;
    }
    else
    {
      uint64_t v31 = sub_100007D00();
      BOOL v32 = sub_100005424(v31[144]);
      uint64_t v36 = 0;
      LOBYTE(v37) = v32;
    }
    if (sub_100238DD4((uint64_t)&v48, (uint64_t)__p, (unsigned __int8 *)&v36))
    {
      sub_100004950(__p, "Send");
      sub_100239FBC((uint64_t **)__p, (uint64_t *)&v48);
      if (SBYTE7(v39) < 0) {
        operator delete(__p[0]);
      }
      subspecializedPeerSession = self->_subspecializedPeerSession;
      if (subspecializedPeerSession) {
        -[NIServerNearbyPeerSubspecializationProtocol updatePeerData:](subspecializedPeerSession, "updatePeerData:", &v48, v36, v37);
      }
      objc_super v19 = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100426520();
      }
      NSErrorUserInfoKey v51 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v52 = @"FindingDataFrameFormat::encode failed";
      __int16 v34 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1, v36, v37, __p[0], __p[1], v39, v40, v41, v42, v43, v44, v45, v46, v47[0], v47[1]);
      objc_super v19 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v34];
    }
    if (v48)
    {
      unint64_t v49 = v48;
      operator delete(v48);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100426554();
    }
    NSErrorUserInfoKey v53 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v54 = @"Not Ranging with specified peer";
    long long v18 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    objc_super v19 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v18];
  }

  return v19;
}

- (void)_startAltitudeUpdates
{
  objc_initWeak(&location, self);
  unsigned int v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = sub_1002754FC;
  id v7 = &unk_100859030;
  objc_copyWeak(&v8, &location);
  BOOL v3 = objc_retainBlock(&v4);
  -[CMAltimeter startRelativeAltitudeUpdatesToQueue:withHandler:](self->_altimeterManager, "startRelativeAltitudeUpdatesToQueue:withHandler:", self->_deviceOperationQueue, v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_startPedometerDataUpdates
{
  objc_initWeak(&location, self);
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  id v8 = sub_100275768;
  unsigned __int8 v9 = &unk_100859078;
  objc_copyWeak(&v10, &location);
  BOOL v3 = objc_retainBlock(&v6);
  pedometerManager = self->_pedometerManager;
  uint64_t v5 = +[NSDate now];
  [(CMPedometer *)pedometerManager startPedometerUpdatesFromDate:v5 withHandler:v3];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_startPedometerEventUpdates
{
  objc_initWeak(&location, self);
  unsigned int v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = sub_100275BB8;
  uint64_t v7 = &unk_1008590C0;
  objc_copyWeak(&v8, &location);
  BOOL v3 = objc_retainBlock(&v4);
  -[CMPedometer startPedometerEventUpdatesWithHandler:](self->_pedometerManager, "startPedometerEventUpdatesWithHandler:", v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_startMotionActivityUpdates
{
  objc_initWeak(&location, self);
  unsigned int v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = sub_100275EDC;
  uint64_t v7 = &unk_100859108;
  objc_copyWeak(&v8, &location);
  BOOL v3 = objc_retainBlock(&v4);
  -[CMMotionActivityManager startActivityUpdatesToQueue:withHandler:](self->_motionActivityManager, "startActivityUpdatesToQueue:withHandler:", self->_deviceOperationQueue, v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_startDevicePDRUpdates
{
  objc_initWeak(&location, self);
  unsigned int v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = sub_100276188;
  uint64_t v7 = &unk_100859150;
  objc_copyWeak(&v8, &location);
  BOOL v3 = objc_retainBlock(&v4);
  -[CMOdometryManager setOdometryUpdateInterval:](self->_pdrManager, "setOdometryUpdateInterval:", 0.1, v4, v5, v6, v7);
  [(CMOdometryManager *)self->_pdrManager startOdometryUpdatesToQueue:self->_deviceOperationQueue withHandler:v3];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_startDeviceMotionUpdates
{
  objc_initWeak(&location, self);
  unsigned int v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = sub_1002767EC;
  uint64_t v7 = &unk_100859198;
  objc_copyWeak(&v8, &location);
  BOOL v3 = objc_retainBlock(&v4);
  -[CMMotionManager setDeviceMotionUpdateInterval:](self->_motionManager, "setDeviceMotionUpdateInterval:", 0.01, v4, v5, v6, v7);
  [(CMMotionManager *)self->_motionManager startDeviceMotionUpdatesToQueue:self->_deviceOperationQueue withHandler:v3];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_activateSensors
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  BOOL v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,turning on sensors for peer algorithms.", buf, 2u);
  }
  BOOL sensorsOn = self->_sensorsOn;
  uint64_t v5 = qword_1008ABDE0;
  BOOL v6 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
  if (sensorsOn)
  {
    if (!v6) {
      return;
    }
    __int16 v25 = 0;
    uint64_t v7 = "#ses-nrby-peer,sensors already ON";
    id v8 = (uint8_t *)&v25;
    unsigned __int8 v9 = v5;
    goto LABEL_32;
  }
  if (v6)
  {
    *(_WORD *)long long v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,turning on motion sensors for peer algorithms.", v24, 2u);
  }
  id v10 = (CMMotionManager *)objc_alloc_init((Class)CMMotionManager);
  motionManager = self->_motionManager;
  self->_motionManager = v10;

  if (self->_motionManager)
  {
    [(NIServerNearbyPeerSession *)self _startDeviceMotionUpdates];
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT))
  {
    sub_100426B44();
  }
  long long v12 = (CMAltimeter *)objc_alloc_init((Class)CMAltimeter);
  altimeterManager = self->_altimeterManager;
  self->_altimeterManager = v12;

  if (self->_altimeterManager)
  {
    [(NIServerNearbyPeerSession *)self _startAltitudeUpdates];
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT))
  {
    sub_100426B10();
  }
  long long v14 = (CMPedometer *)objc_alloc_init((Class)CMPedometer);
  pedometerManager = self->_pedometerManager;
  self->_pedometerManager = v14;

  if (self->_pedometerManager)
  {
    [(NIServerNearbyPeerSession *)self _startPedometerDataUpdates];
    [(NIServerNearbyPeerSession *)self _startPedometerEventUpdates];
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT))
  {
    sub_100426ADC();
  }
  long long v16 = (CMMotionActivityManager *)objc_alloc_init((Class)CMMotionActivityManager);
  motionActivityManager = self->_motionActivityManager;
  self->_motionActivityManager = v16;

  if (self->_motionActivityManager)
  {
    [(NIServerNearbyPeerSession *)self _startMotionActivityUpdates];
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT))
  {
    sub_100426AA8();
  }
  long long v18 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,turning on PDR for peer algorithms.", v23, 2u);
  }
  objc_super v19 = (CMOdometryManager *)objc_alloc_init((Class)CMOdometryManager);
  pdrManager = self->_pdrManager;
  self->_pdrManager = v19;

  if (self->_pdrManager)
  {
    [(NIServerNearbyPeerSession *)self _startDevicePDRUpdates];
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_100426A74();
  }
  self->_BOOL sensorsOn = 1;
  uint64_t v21 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v22 = 0;
    uint64_t v7 = "#ses-nrby-peer,turned on sensors for peer algorithms.";
    id v8 = (uint8_t *)&v22;
    unsigned __int8 v9 = v21;
LABEL_32:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
  }
}

- (void)_deactivateSensors
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  BOOL v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,turning off sensors for findee algorithms.  ", v9, 2u);
  }
  if (self->_sensorsOn)
  {
    [(CMAltimeter *)self->_altimeterManager stopRelativeAltitudeUpdates];
    altimeterManager = self->_altimeterManager;
    self->_altimeterManager = 0;

    [(CMPedometer *)self->_pedometerManager stopPedometerUpdates];
    [(CMPedometer *)self->_pedometerManager stopPedometerEventUpdates];
    pedometerManager = self->_pedometerManager;
    self->_pedometerManager = 0;

    [(CMMotionActivityManager *)self->_motionActivityManager stopActivityUpdates];
    motionActivityManager = self->_motionActivityManager;
    self->_motionActivityManager = 0;

    [(CMMotionManager *)self->_motionManager stopDeviceMotionUpdates];
    motionManager = self->_motionManager;
    self->_motionManager = 0;

    [(CMOdometryManager *)self->_pdrManager stopOdometryUpdates];
    pdrManager = self->_pdrManager;
    self->_pdrManager = 0;

    self->_BOOL sensorsOn = 0;
  }
}

- (void)_handleSessionBackgroundContinuationAuth:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  uint64_t v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = "NO";
    if (v3) {
      BOOL v6 = "YES";
    }
    *(_DWORD *)buf = 136315138;
    long long v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,Background continuation auth? %s", buf, 0xCu);
  }
  p_backgroundedClientsSupported = &self->_backgroundedClientsSupported;
  self->_backgroundedClientsSupported = v3;
  v9.receiver = self;
  v9.super_class = (Class)NIServerNearbyPeerSession;
  id v8 = [(NIServerBaseSession *)&v9 backgroundSupportUpdateHandler];
  ((void (**)(void, BOOL))v8)[2](v8, *p_backgroundedClientsSupported);
}

- (void)processVisionInput:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  [(NINearbyUpdatesEngine *)self->_updatesEngine acceptVisionInput:v4];
}

- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4
{
  BOOL v6 = (NINearbyUpdatesEngine *)a3;
  id v7 = a4;
  if (self->_updatesEngine != v6) {
    __assert_rtn("-[NIServerNearbyPeerSession updatesEngine:didUpdateNearbyObjects:]", "NIServerNearbyPeerSession.mm", 1275, "engine == _updatesEngine");
  }
  clientQueue = self->_clientQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100277270;
  v10[3] = &unk_100846588;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async((dispatch_queue_t)clientQueue, v10);
}

- (void)updatesEngine:(id)a3 didUpdateAlgorithmConvergenceState:(id)a4 forObject:(id)a5
{
  id v8 = (NINearbyUpdatesEngine *)a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_updatesEngine != v8) {
    __assert_rtn("-[NIServerNearbyPeerSession updatesEngine:didUpdateAlgorithmConvergenceState:forObject:]", "NIServerNearbyPeerSession.mm", 1319, "engine == _updatesEngine");
  }
  clientQueue = self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100277448;
  block[3] = &unk_100855EB0;
  block[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  dispatch_async((dispatch_queue_t)clientQueue, block);
}

- (void)updatesEngine:(id)a3 didUpdateFindeeData:(const void *)a4 forToken:(id)a5
{
  id v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_100426B78();
  }
  id v8 = [(NIServerNearbyPeerSession *)self setDataFrame:a4 forPeer:v7];
  if (v8)
  {
    id v9 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v8 description];
      int v11 = 136315138;
      id v12 = [v10 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ses-nrby-peer,sent peer data to ranging provider with error: %s", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (id)objectFromIdentifier:(unint64_t)a3
{
  BOOL v3 = [(NINearbyPeerConfiguration *)self->_configuration peerDiscoveryToken];
  if (v3) {
    id v4 = [[NINearbyObject alloc] initWithToken:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)discoveryTokenFromIdentifier:(unint64_t)a3
{
  return [(NINearbyPeerConfiguration *)self->_configuration peerDiscoveryToken];
}

- (optional<unsigned)identifierFromDiscoveryToken:(id)a3
{
  unint64_t cachedSolutionMacAddr = self->_cachedSolutionMacAddr;
  BOOL v4 = 1;
  result.__engaged_ = v4;
  result.var0 = ($BEC950A715106DE229A2E4BA1089E24D)cachedSolutionMacAddr;
  return result;
}

- (void)peerInactivityPeriodExceeded:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  [(NIServerNearbyPeerSession *)self _removePeerObject:v4 withReason:0];
}

- (NINearbyPeerConfiguration)configuration
{
  return (NINearbyPeerConfiguration *)objc_getProperty(self, a2, 440, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_pdrManager, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_pedometerManager, 0);
  objc_storeStrong((id *)&self->_altimeterManager, 0);
  objc_storeStrong((id *)&self->_deviceOperationQueue, 0);
  objc_storeStrong((id *)&self->_backgroundContinuationManager, 0);
  objc_storeStrong((id *)&self->_peerTokenDict, 0);
  cntrl = (std::__shared_weak_count *)self->_powerBudgetProvider.__cntrl_;
  if (cntrl) {
    sub_10001A970(cntrl);
  }
  objc_storeStrong((id *)&self->_subspecializedPeerSession, 0);
  objc_storeStrong((id *)&self->_containerUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);

  objc_storeStrong((id *)&self->_updatesEngine, 0);
}

- (id).cxx_construct
{
  self->_powerBudgetProvider.__ptr_ = 0;
  self->_powerBudgetProvider.__cntrl_ = 0;
  sub_1002B5E80(&self->_machTimeConverter, a2);
  self->_currentFindeeData.var0.__null_state_ = 0;
  self->_currentFindeeData.__engaged_ = 0;
  self->_currentSignallingData.var0.__null_state_ = 0;
  self->_currentSignallingData.__engaged_ = 0;
  return self;
}

@end