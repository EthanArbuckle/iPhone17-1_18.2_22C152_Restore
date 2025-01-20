@interface NIServerHomeDeviceSession
- (BOOL)_biasCorrectionRequirementFromDiscoveryToken:(id)a3;
- (BOOL)_biasCorrectionRequirementFromModelString:(id)a3;
- (BOOL)_isWifiRangingAllowed;
- (BOOL)_shouldRespondToDevice:(id)a3;
- (BOOL)_validateDiscoveryTokenDict:(id)a3;
- (BOOL)isInterestedInSamplesForDevice:(id)a3;
- (BOOL)supportsDevicePresence;
- (BOOL)supportsSessionObservers;
- (BOOL)updateConfiguration:(id)a3;
- (NIHomeDeviceConfiguration)configuration;
- (NIServerHomeDeviceSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5;
- (duration<long)nominalCycleRate;
- (float)prewarmStateRegionThreshold;
- (id).cxx_construct;
- (id)_addPeers:(id)a3;
- (id)_disableAllServicesAndSendHangupSignal:(BOOL)a3;
- (id)_triggerInitiatorRanging;
- (id)_triggerResponderRangingForSession:(shared_ptr<rose:(id)a4 :objects::GRSession>)a3 initiatorDevice:;
- (id)addObject:(id)a3;
- (id)configure;
- (id)disableAllServices;
- (id)getQueueForInputingData;
- (id)lastConfiguration;
- (id)objectFromIdentifier:(unint64_t)a3;
- (id)pauseWithSource:(int64_t)a3;
- (id)printableState;
- (id)removeObject:(id)a3;
- (id)run;
- (int)_intentPredictorConfigFromDiscoveryToken:(id)a3;
- (int)_intentPredictorConfigFromModelString:(id)a3;
- (int)_magneticFieldStrengthCheckOptionFromDiscoveryToken:(id)a3;
- (int)_magneticFieldStrengthCheckOptionFromModelString:(id)a3;
- (int64_t)_regionCategoryFromBluetoothDevice:(id)a3;
- (int64_t)_regionCategoryFromDiscoveryToken:(id)a3;
- (int64_t)_regionCategoryFromModelString:(id)a3;
- (int64_t)_roseMotionStateToNIMotionActivityState:(int)a3;
- (optional<rose::RoseServiceRequest>)_prepareServiceRequestWithConfig:(SEL)a3;
- (shared_ptr<WiFiRanging::Session>)_buildWifiSession;
- (shared_ptr<rose::objects::GRSession>)_buildRoseSession:(const void *)a3;
- (unint64_t)requiresSpatialInteractionBluetoothResource;
- (unint64_t)requiresUWBToRun;
- (unsigned)_flagsFromDiscoveryToken:(id)a3;
- (unsigned)_homeAnchorVariantFromDiscoveryToken:(id)a3;
- (void)_calculateMagneticFieldBias;
- (void)_handleBackoffManagerRecommendation:(int)a3 machContinuousTimeSec:(double)a4 screenState:(int)a5;
- (void)_handleMotionStateChange:(int)a3;
- (void)_handleScreenStateChange:(int)a3;
- (void)_handleUWBSystemStateReadinessUpdate:(BOOL)a3;
- (void)_handleWifiRangingAvailableUpdate:(BOOL)a3;
- (void)_notifyPeerRemoval:(id)a3 withReason:(unint64_t)a4;
- (void)_pauseWifiRanging;
- (void)_peerHungUp:(unint64_t)a3;
- (void)_removePeerObject:(id)a3 uwbIdentifier:(unint64_t)a4 withReason:(unint64_t)a5;
- (void)_resumeWifiRanging;
- (void)_roseSession:(shared_ptr<rose:(int)a4 :(float)a5 objects:(float)a6 :(int)a7 RoseBaseSession>)a3 didChangeRangingUpdateRate:newThrottleRate:prevThrottleRate:effectiveSinceCycleInde:;
- (void)_roseSession:(shared_ptr<rose:(int)a4 :objects::RoseBaseSession>)a3 invalidatedWithReason:;
- (void)_sendHangupSignalForSession:(shared_ptr<rose::objects::GRSession>)a3;
- (void)_stopWiFiSessionsWithReason:(id)a3;
- (void)_updateAnalyticsAboutRangingRateForDevice:(id)a3 responseSkipRatio:(float)a4 cycleRate:(duration<long)long;
- (void)adjustResponderThrottleRateIfNeeded:(id)a3 object:(id)a4;
- (void)bluetoothAdvertisingAddressChanged:(unint64_t)a3;
- (void)consumeBluetoothSample:(id)a3;
- (void)dealloc;
- (void)device:(id)a3 rediscovered:(id)a4;
- (void)deviceDiscovered:(id)a3;
- (void)deviceLost:(id)a3;
- (void)didReceiveDeviceMotion:(const void *)a3;
- (void)didReceiveMagnetometerData:(NIServerHomeDeviceSession *)self at:(SEL)a2;
- (void)didReceiveNewSolution:(const void *)a3;
- (void)didReceiveRemoteData:(const void *)a3;
- (void)didUpdateMinimumPreferredUpdateRate:(int64_t)a3;
- (void)invalidate;
- (void)peerInactivityPeriodExceeded:(id)a3;
- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4;
- (void)setupBackoffResumeManager;
- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4;
- (void)updatesEngine:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6 regionTransitionSuppressed:(BOOL)a7;
@end

@implementation NIServerHomeDeviceSession

- (NIServerHomeDeviceSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = objc_opt_class();
  if (v11 != objc_opt_class())
  {
    v36 = +[NSAssertionHandler currentHandler];
    [v36 handleFailureInMethod:a2 object:self file:@"NIServerHomeDeviceSession.mm" lineNumber:479 description:@"NIServerHomeDeviceSession given invalid configuration."];
  }
  v12 = [v9 serverSessionIdentifier];

  if (!v12)
  {
    v37 = +[NSAssertionHandler currentHandler];
    [v37 handleFailureInMethod:a2, self, @"NIServerHomeDeviceSession.mm", 480, @"Invalid parameter not satisfying: %@", @"resourcesManager.serverSessionIdentifier" object file lineNumber description];
  }
  v39.receiver = self;
  v39.super_class = (Class)NIServerHomeDeviceSession;
  v13 = [(NIServerBaseSession *)&v39 initWithResourcesManager:v9 configuration:v10 error:a5];
  if (v13)
  {
    uint64_t v14 = [v9 uwbResource];
    v15 = (void *)*((void *)v13 + 29);
    *((void *)v13 + 29) = v14;

    if (v9)
    {
      [v9 protobufLogger];
      long long v16 = v38;
    }
    else
    {
      long long v16 = 0uLL;
    }
    v17 = (std::__shared_weak_count *)*((void *)v13 + 7);
    *((_OWORD *)v13 + 3) = v16;
    if (v17) {
      sub_10001A970(v17);
    }
    v13[200] = 100;
    uint64_t v18 = [v9 clientConnectionQueue];
    v19 = (void *)*((void *)v13 + 10);
    *((void *)v13 + 10) = v18;

    id v20 = [v10 copy];
    v21 = (void *)*((void *)v13 + 90);
    *((void *)v13 + 90) = v20;

    v22 = [v9 serverSessionIdentifier];
    uint64_t v23 = [v22 UUIDString];
    v24 = (void *)*((void *)v13 + 11);
    *((void *)v13 + 11) = v23;

    v13[96] = 0;
    *((void *)v13 + 26) = 3;
    v25 = operator new(0x88uLL);
    v25[1] = 0;
    v25[2] = 0;
    void *v25 = off_1008561C8;
    sub_1002D7118((unsigned char *)v25 + 24);
    v26 = (std::__shared_weak_count *)*((void *)v13 + 45);
    *((void *)v13 + 44) = v25 + 3;
    *((void *)v13 + 45) = v25;
    if (v26) {
      sub_10001A970(v26);
    }
    unsigned int v27 = [*((id *)v13 + 29) currentServiceState];
    BOOL v28 = 1;
    if (v27 != 1) {
      BOOL v28 = [*((id *)v13 + 29) currentServiceState] == 2;
    }
    v13[97] = v28;
    v13[98] = 1;
    atomic_store(1u, (unsigned __int8 *)v13 + 368);
    id v29 = objc_alloc_init((Class)NSOperationQueue);
    v30 = (void *)*((void *)v13 + 47);
    *((void *)v13 + 47) = v29;

    [*((id *)v13 + 47) setUnderlyingQueue:*((void *)v13 + 10)];
    id v31 = objc_alloc_init((Class)CMMotionManager);
    v32 = (void *)*((void *)v13 + 48);
    *((void *)v13 + 48) = v31;

    [*((id *)v13 + 48) setMagnetometerUpdateInterval:0.05];
    *((void *)v13 + 75) = 0;
    sub_1001A4EE8((uint64_t)(v13 + 608));
    *((void *)v13 + 83) = 1;
    *(_OWORD *)(v13 + 648) = xmmword_1004BAB60;
    v33 = +[NIServerHomeDeviceService sharedInstance];
    [v33 addServiceClient:v13 identifier:*((void *)v13 + 11) configuration:*((void *)v13 + 90)];

    v34 = v13;
  }

  return (NIServerHomeDeviceSession *)v13;
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (BOOL)supportsSessionObservers
{
  return 1;
}

- (id)configure
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!self->_configuration) {
    sub_10041E464();
  }
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    configuration = self->_configuration;
    *(_DWORD *)buf = 138412290;
    v60 = configuration;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-home,Configure. Configuration given: %@", buf, 0xCu);
  }
  v5 = +[NSUserDefaults standardUserDefaults];
  if ([v5 BOOLForKey:@"NIHomeDisable"])
  {
    v6 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "#ses-home,NIHomeDisable set in defaults. Skip configuring session";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (self->_isRunning)
  {
    v6 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "#ses-home,Session is running, skip re-configure";
      goto LABEL_10;
    }
LABEL_11:
    uint64_t v8 = 0;
    goto LABEL_12;
  }
  uint64_t v8 = 232;
  unsigned int v10 = [(PRUWBServiceProviding *)self->_uwbResource currentServiceState];
  BOOL v11 = 1;
  if (v10 != 1) {
    BOOL v11 = [(PRUWBServiceProviding *)self->_uwbResource currentServiceState] == 2;
  }
  self->_uwbSystemAvailable = v11;
  self->_shouldHandleUWBStateReadinessUpdates = 1;
  [(NIServerHomeDeviceSession *)self setupBackoffResumeManager];
  v55.receiver = self;
  v55.super_class = (Class)NIServerHomeDeviceSession;
  v12 = [(NIServerBaseSession *)&v55 resourcesManager];
  if (!self->_updatesEngine)
  {
    v13 = [NINearbyUpdatesEngine alloc];
    uint64_t v14 = self->_configuration;
    clientQueue = self->_clientQueue;
    long long v16 = [v12 analytics];
    cntrl = self->_pbLogger.__cntrl_;
    ptr = self->_pbLogger.__ptr_;
    v54 = (std::__shared_weak_count *)cntrl;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    id v52 = 0;
    uint64_t v18 = [(NINearbyUpdatesEngine *)v13 initWithConfiguration:v14 queue:clientQueue delegate:self dataSource:self analyticsManager:v16 protobufLogger:&ptr error:&v52];
    uint64_t v8 = (uint64_t)v52;
    updatesEngine = self->_updatesEngine;
    self->_updatesEngine = v18;

    if (v54) {
      sub_10001A970(v54);
    }

    if (!self->_updatesEngine) {
      goto LABEL_64;
    }
  }
  if (![(NIHomeDeviceConfiguration *)self->_configuration allowedDevices])
  {
    NSErrorUserInfoKey v66 = NSLocalizedDescriptionKey;
    CFStringRef v67 = @"NIRelationshipSpecifierNone is not a valid relationship specifier for this configuration.";
    v21 = +[NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
    uint64_t v8 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:v21];
    goto LABEL_63;
  }
  id v20 = [(NIHomeDeviceConfiguration *)self->_configuration sessionKey];
  v21 = v20;
  if (v20 && [v20 length] != (id)16)
  {
    BOOL v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"sessionKey has invalid length. Expected: %d bytes. Got: %lu", 16, [v21 length]);
    NSErrorUserInfoKey v64 = NSLocalizedDescriptionKey;
    v65 = v28;
    id v29 = +[NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
    uint64_t v8 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:v29];

    goto LABEL_63;
  }
  if ([(NIHomeDeviceConfiguration *)self->_configuration isAnchor]
    || ![(NIHomeDeviceConfiguration *)self->_configuration antennaDiversityOverride])
  {
    int v24 = *((_DWORD *)sub_100007D00() + 144);
    if ([(NIHomeDeviceConfiguration *)self->_configuration isAnchor])
    {
      self->_currentSessionRole = 0;
      if (!self->_initiatorSession.__ptr_ && self->_uwbSystemAvailable)
      {
        [(NIServerHomeDeviceSession *)self _prepareServiceRequestWithConfig:sub_10039D104(v24)];
        if (!v61)
        {
          v44 = +[NSString stringWithFormat:@"Unable to prepare service request."];
          NSErrorUserInfoKey v57 = NSLocalizedDescriptionKey;
          v58 = v44;
          v45 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
          uint64_t v8 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v45];

          goto LABEL_63;
        }
        [(NIServerHomeDeviceSession *)self _buildRoseSession:buf];
        if (v50 && *(unsigned char *)(v50 + 682))
        {
          v25 = v51;
          if (v51) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)v51 + 1, 1uLL, memory_order_relaxed);
          }
          v26 = (std::__shared_weak_count *)self->_initiatorSession.__cntrl_;
          self->_initiatorSession.__ptr_ = (GRSession *)v50;
          self->_initiatorSession.__cntrl_ = v25;
          if (v26) {
            sub_10001A970(v26);
          }
          char v27 = 1;
        }
        else
        {
          uint64_t v8 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:0];
          char v27 = 0;
        }
        if (v51) {
          sub_10001A970((std::__shared_weak_count *)v51);
        }
        if ((v27 & 1) == 0) {
          goto LABEL_63;
        }
      }
    }
    else
    {
      self->_currentSessionRole = 1;
    }
    int v30 = sub_10039D0B0(v24);
    int64_t v31 = 10;
    if (!v30) {
      int64_t v31 = 0;
    }
    self->_recommendedProcessingOptions.regionSizeCategory = v31;
    v32 = [v5 objectForKey:@"NIHomeLocalRegionSizeRecommendationOverride"];
    BOOL v33 = v32 == 0;

    if (v33)
    {
LABEL_53:
      id v36 = objc_alloc_init((Class)NSMutableArray);
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v37 = [(NIHomeDeviceConfiguration *)self->_configuration monitoredRegions];
      id v38 = [v37 countByEnumeratingWithState:&v46 objects:v56 count:16];
      if (v38)
      {
        uint64_t v39 = *(void *)v47;
        do
        {
          for (i = 0; i != v38; i = (char *)i + 1)
          {
            if (*(void *)v47 != v39) {
              objc_enumerationMutation(v37);
            }
            v41 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            if (![v41 regionSizeCategory]) {
              [v36 addObject:v41];
            }
          }
          id v38 = [v37 countByEnumeratingWithState:&v46 objects:v56 count:16];
        }
        while (v38);
      }

      int v42 = [(NIServerHomeDeviceSession *)self nominalCycleRate];
      id v43 = [v36 copy];
      sub_10023795C((uint64_t)&self->_handoffCAManager, v43, v42);

      uint64_t v8 = 0;
      goto LABEL_63;
    }
    v34 = [v5 stringForKey:@"NIHomeLocalRegionSizeRecommendationOverride"];
    if ([v34 isEqualToString:@"Default"])
    {
      int64_t v35 = 0;
    }
    else
    {
      if (![v34 isEqualToString:@"Large"])
      {
LABEL_52:

        goto LABEL_53;
      }
      int64_t v35 = 10;
    }
    self->_recommendedProcessingOptions.regionSizeCategory = v35;
    goto LABEL_52;
  }
  v22 = +[NSString stringWithFormat:@"antenna diversity option is invalid for responders"];
  NSErrorUserInfoKey v62 = NSLocalizedDescriptionKey;
  v63 = v22;
  uint64_t v23 = +[NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
  uint64_t v8 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:v23];

LABEL_63:
LABEL_64:

LABEL_12:

  return (id)v8;
}

- (id)run
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v3 = +[NSUserDefaults standardUserDefaults];
  if ([v3 BOOLForKey:@"NIHomeDisable"])
  {
    v4 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-home,NIHomeDisable set in defaults. Skip running session", buf, 2u);
    }
    v5 = 0;
  }
  else if (self->_currentSessionRole == 100)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10041E490();
    }
    v5 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
  }
  else
  {
    v6 = sub_10001D404();
    atomic_store(sub_1000220F4((uint64_t)v6), (unsigned __int8 *)&self->_wifiServiceAllowsRanging);
    v49.receiver = self;
    v49.super_class = (Class)NIServerHomeDeviceSession;
    v7 = [(NIServerBaseSession *)&v49 resourcesManager];
    uint64_t v8 = [v7 btResource];
    [v8 setDeviceRelationshipFlags:-[NIHomeDeviceConfiguration allowedDevices](self->_configuration, "allowedDevices")];

    if ([(NIServerHomeDeviceSession *)self _isWifiRangingAllowed])
    {
      id v9 = [v7 btResource];
      [v9 setWifiRangingActiveAdvertisement];
    }
    else
    {
      id v9 = [v7 btResource];
      [v9 clearWifiRangingActiveAdvertisement];
    }

    if (self->_isRunning)
    {
      unsigned int v10 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-home,Session is running, return", buf, 2u);
      }
      v5 = 0;
    }
    else
    {
      self->_firstWifiMeasurementsReceived = 0;
      BOOL v11 = [v7 btResource];
      [v11 startAdvertising];

      v12 = +[NSUserDefaults standardUserDefaults];
      unsigned int v13 = [v12 BOOLForKey:@"HomeDeviceSessionBTLeechingEnabled"];

      if (v13)
      {
        uint64_t v14 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ses-home,Disable UWB-aided handoff with HomeDeviceSessionBTLeechingEnabled", buf, 2u);
        }
        v15 = (CBAdvertiser *)objc_opt_new();
        leechingAidingAdvertiser = self->_leechingAidingAdvertiser;
        self->_leechingAidingAdvertiser = v15;

        [(CBAdvertiser *)self->_leechingAidingAdvertiser setDispatchQueue:self->_clientQueue];
        [(CBAdvertiser *)self->_leechingAidingAdvertiser setLabel:@"ProximityLeechingAidForHomeDeviceSession"];
        [(CBAdvertiser *)self->_leechingAidingAdvertiser setAdvertiseRate:50];
        [(CBAdvertiser *)self->_leechingAidingAdvertiser setNearbyActionType:17];
        [(CBAdvertiser *)self->_leechingAidingAdvertiser setNearbyActionFlags:64];
        [(CBAdvertiser *)self->_leechingAidingAdvertiser activateWithCompletion:&stru_100859BA8];
        v17 = [v7 devicePresenceResource];
        uint64_t v18 = [v17 internalObserver];
        [v18 startBTScanningWithMaxRateForPrototypeHomeSession:self];
      }
      if (([(NIConfiguration *)self->_configuration suspensionPolicy] & 1) == 0)
      {
        v19 = [v7 btResource];
        [v19 allowScreenOffOperation:1];
      }
      id v20 = self;
      sub_100004950(buf, (char *)[(NSString *)v20->_containerUniqueIdentifier UTF8String]);
      v21 = sub_10001D404();
      if (SHIBYTE(v48) < 0)
      {
        sub_100002DE4(__p, *(void **)buf, *(unint64_t *)&buf[8]);
      }
      else
      {
        *(_OWORD *)__p = *(_OWORD *)buf;
        uint64_t v46 = v48;
      }
      v22 = v20;
      v51[0] = off_100859C28;
      v51[1] = v22;
      v51[3] = v51;
      sub_10001DBF8((uint64_t)v21, (long long *)__p, (uint64_t)v51, self->_clientQueue);
      sub_10000AF74(v51);
      if (SHIBYTE(v46) < 0) {
        operator delete(__p[0]);
      }
      [v3 doubleForKey:@"HomeDeviceInitialScanBurstDurationSecondsOverride"];
      double v24 = v23;
      double v25 = 5.0;
      if (v23 > 0.0)
      {
        v26 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v50 = 134217984;
          *(double *)&v50[4] = v24;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#ses-home,* Initial scan burst duration set from defaults write: %0.2f seconds", v50, 0xCu);
        }
        double v25 = v24;
      }
      char v27 = [v7 btResource];
      [v27 startScanningWithBurstPeriod:v25];

      BOOL v28 = [v7 lifecycleSupervisor];
      [v28 runWithConfigurationCalled];

      double v29 = sub_100006C38();
      sub_100237994((uint64_t)&v22->_handoffCAManager, v29);
      sub_1002D79AC((uint64_t)v22->_wifiCAManager.__ptr_, v29);
      int v30 = [v7 btResource];
      id v31 = [v30 nonConnectableAdvertisingAddress];
      if (v32)
      {
        *(void *)uint64_t v50 = v31;
        id v33 = [objc_alloc((Class)NSData) initWithBytes:v50 length:6];
        v34 = sub_10001D404();
        sub_10001D4A4((uint64_t)v34, v33);
      }
      if (v22->_initiatorSession.__ptr_)
      {
        v5 = [(NIServerHomeDeviceSession *)v22 _triggerInitiatorRanging];
      }
      else
      {
        v5 = 0;
      }
      self->_isRunning = v5 == 0;
      v22->_shouldDeliverUpdates = v5 == 0;
      if (self->_isRunning)
      {
        clientQueue = self->_clientQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10020173C;
        block[3] = &unk_100846588;
        id v43 = v7;
        v44 = v22;
        dispatch_async((dispatch_queue_t)clientQueue, block);
      }
      objc_initWeak((id *)v50, v22);
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_1002017B0;
      v40[3] = &unk_100859BD0;
      objc_copyWeak(&v41, (id *)v50);
      id v36 = objc_retainBlock(v40);
      [(CMMotionManager *)v22->_motionManager startMagnetometerUpdatesToQueue:v22->_operationQueue withHandler:v36];
      v37 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v39 = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "#ses-home,streaming raw magnetometer data started", v39, 2u);
      }

      objc_destroyWeak(&v41);
      objc_destroyWeak((id *)v50);

      if (SHIBYTE(v48) < 0) {
        operator delete(*(void **)buf);
      }
    }
  }

  return v5;
}

- (id)pauseWithSource:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  self->_isRunning = 0;
  self->_shouldDeliverUpdates = 0;
  sub_1001A4EE8((uint64_t)&self->_cachedRegionUpdateEvent);
  v4 = [(NIServerHomeDeviceSession *)self _disableAllServicesAndSendHangupSignal:0];
  v9.receiver = self;
  v9.super_class = (Class)NIServerHomeDeviceSession;
  v5 = [(NIServerBaseSession *)&v9 resourcesManager];
  v6 = [v5 lifecycleSupervisor];
  [v6 pauseCalled];

  double v7 = sub_100006C38();
  sub_1002379F8((uint64_t)&self->_handoffCAManager, v7);
  sub_1002D7328(self->_wifiCAManager.__ptr_);
  self->_firstWifiMeasurementsReceived = 0;

  return v4;
}

- (void)setupBackoffResumeManager
{
  configuration = self->_configuration;
  if (!configuration) {
    sub_10041E538();
  }
  __int16 v19 = 1;
  uint64_t v20 = 0x3FF0000000000000;
  int v18 = [(NIConfiguration *)configuration suspensionPolicy] & 1;
  if ([(NIHomeDeviceConfiguration *)self->_configuration isAnchor])
  {
    LOBYTE(v4) = 0;
    *(_WORD *)((char *)&v18 + 1) = 0;
  }
  else
  {
    BYTE1(v18) = ([(NIConfiguration *)self->_configuration suspensionPolicy] & 2) != 0;
    unsigned int v5 = [(NIConfiguration *)self->_configuration suspensionPolicy];
    int v4 = (v5 >> 2) & 1;
    BYTE2(v18) = (v5 & 4) != 0;
    if (!self->_uwbSystemAvailable)
    {
      v6 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ses-home,Overriding lock screen only suspension policy: ENABLED.", buf, 2u);
      }
      LOBYTE(v4) = 1;
      BYTE2(v18) = 1;
    }
  }
  p_backoffResumeManager = &self->_backoffResumeManager;
  cntrl = self->_backoffResumeManager.__cntrl_;
  if (!cntrl || (*((void *)cntrl + 1) & 0x8000000000000000) != 0)
  {
    objc_super v9 = self;
    unsigned int v10 = operator new(0x118uLL);
    v10[1] = 0;
    v10[2] = 0;
    *unsigned int v10 = off_1008565F8;
    BOOL v11 = v9;
    *(void *)buf = off_100859CA8;
    v26 = v11;
    char v27 = buf;
    clientQueue = v9->_clientQueue;
    containerUniqueIdentifier = v9->_containerUniqueIdentifier;
    v22 = off_100859D28;
    double v23 = v11;
    double v24 = &v22;
    uint64_t v14 = v23;
    v21[0] = off_100859DA8;
    v21[1] = v14;
    v21[3] = v21;
    sub_10028CDFC(v10 + 3, &v18, buf, clientQueue, containerUniqueIdentifier, &v22, v21);
    sub_1001A6274(v21);
    sub_1001A62F8(&v22);
    sub_1001A637C(buf);
    *(void *)&long long v17 = v10 + 3;
    *((void *)&v17 + 1) = v10;
    sub_10001ABCC((uint64_t)&v17, (void *)v17, v17);
    shared_ptr<rose::backoff_resume_management::BackoffResumeManager> v15 = (shared_ptr<rose::backoff_resume_management::BackoffResumeManager>)v17;
    long long v17 = 0uLL;
    long long v16 = (std::__shared_weak_count *)p_backoffResumeManager->__cntrl_;
    shared_ptr<rose::backoff_resume_management::BackoffResumeManager> *p_backoffResumeManager = v15;
    if (v16)
    {
      sub_10001A970(v16);
      if (*((void *)&v17 + 1)) {
        sub_10001A970(*((std::__shared_weak_count **)&v17 + 1));
      }
    }
    sub_10028D19C((uint64_t *)p_backoffResumeManager->__ptr_);
  }
  else
  {
    buf[0] = v4;
    sub_10028D574((uint64_t)p_backoffResumeManager->__ptr_, buf);
  }
}

- (BOOL)updateConfiguration:(id)a3
{
  int v4 = (NIHomeDeviceConfiguration *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!self->_isRunning)
  {
    unsigned int v10 = qword_1008ABDE0;
    BOOL v9 = 0;
    if (!os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    configuration = self->_configuration;
    int v15 = 138412546;
    long long v16 = configuration;
    __int16 v17 = 2112;
    int v18 = v4;
    v12 = "#ses-home,Can't update configuration, not running\nOld: %@\nNew: %@";
    goto LABEL_12;
  }
  if (!v4 || !self->_configuration || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    unsigned int v10 = qword_1008ABDE0;
    BOOL v9 = 0;
    if (!os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    BOOL v11 = self->_configuration;
    int v15 = 138412546;
    long long v16 = v11;
    __int16 v17 = 2112;
    int v18 = v4;
    v12 = "#ses-home,Can't update configuration, one is nil or wrong type\nOld: %@\nNew: %@";
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, 0x16u);
    BOOL v9 = 0;
    goto LABEL_13;
  }
  unsigned int v5 = (NIHomeDeviceConfiguration *)[(NIHomeDeviceConfiguration *)v4 copy];
  v6 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    double v7 = self->_configuration;
    int v15 = 138412546;
    long long v16 = v7;
    __int16 v17 = 2112;
    int v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ses-home,Update configuration\nOld: %@\nNew: %@", (uint8_t *)&v15, 0x16u);
  }
  uint64_t v8 = self->_configuration;
  self->_configuration = v5;

  BOOL v9 = 1;
LABEL_13:

  return v9;
}

- (id)addObject:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v11.receiver = self;
  v11.super_class = (Class)NIServerHomeDeviceSession;
  unsigned int v5 = [(NIServerBaseSession *)&v11 resourcesManager];
  id v13 = v4;
  v6 = +[NSArray arrayWithObjects:&v13 count:1];
  double v7 = [(NIServerHomeDeviceSession *)self _addPeers:v6];

  if (v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041E564();
    }
    uint64_t v8 = [v5 lifecycleSupervisor];
    [v8 failedToAddPeer];
  }
  else
  {
    uint64_t v8 = [v5 lifecycleSupervisor];
    id v12 = v4;
    BOOL v9 = +[NSArray arrayWithObjects:&v12 count:1];
    [v8 startedDiscoveringPeersWithTokens:v9];
  }
  return 0;
}

- (id)removeObject:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v15.receiver = self;
  v15.super_class = (Class)NIServerHomeDeviceSession;
  unsigned int v5 = [(NIServerBaseSession *)&v15 resourcesManager];
  v14.receiver = self;
  v14.super_class = (Class)NIServerHomeDeviceSession;
  id v6 = [(NIServerBaseSession *)&v14 identifierFromDiscoveryToken:v4];
  if (v7)
  {
    uint64_t v8 = 0;
    [(NIServerHomeDeviceSession *)self _removePeerObject:v4 uwbIdentifier:v6 withReason:2];
  }
  else
  {
    BOOL v9 = +[NSString stringWithFormat:@"Token %@ has no associated identifier.", v4];
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041E5F4();
    }
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    int v18 = v9;
    unsigned int v10 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    uint64_t v8 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v10];
  }
  objc_super v11 = [v5 lifecycleSupervisor];
  id v16 = v4;
  id v12 = +[NSArray arrayWithObjects:&v16 count:1];
  [v11 stoppedDiscoveringPeersWithTokens:v12];

  return 0;
}

- (id)disableAllServices
{
  return [(NIServerHomeDeviceSession *)self _disableAllServicesAndSendHangupSignal:1];
}

- (BOOL)_isWifiRangingAllowed
{
  if (([(NIConfiguration *)self->_configuration enabledGestures] & 2) == 0) {
    return 0;
  }
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_wifiServiceAllowsRanging);
  if ((v3 & 1) == 0) {
    return 0;
  }
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_wifiRangingAllowedLockscreen);
  return v5 & 1;
}

- (void)_resumeWifiRanging
{
  if ([(NIServerHomeDeviceSession *)self _isWifiRangingAllowed])
  {
    v15.receiver = self;
    v15.super_class = (Class)NIServerHomeDeviceSession;
    unsigned __int8 v3 = [(NIServerBaseSession *)&v15 resourcesManager];
    id v4 = [v3 btResource];
    [v4 setWifiRangingActiveAdvertisement];

    if (self->_wifiSessions.__table_.__p2_.__value_)
    {
      next = self->_wifiSessions.__table_.__p1_.__value_.__next_;
      if (next)
      {
        sub_10020B078(&buf, next[3] + 120);
        if (v14)
        {

          uint64_t v6 = next[3];
          sub_10020B078(&buf, v6 + 120);
          if (v14) {
            sub_10002E458(v6, (uint64_t)&buf);
          }
          sub_10000AE44();
        }
        uint64_t v7 = next[2];
        uint64_t v8 = [(NIServerHomeDeviceSession *)self configuration];
        if ([v8 isAnchor]) {
          int v9 = 2;
        }
        else {
          int v9 = 1;
        }
        sub_10002DC88((uint64_t)&buf, v7, v9);

        sub_10002E458(next[3], (uint64_t)&buf);
      }
    }
  }
  else
  {
    unsigned int v10 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      buf.n128_u16[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-home,wifi ranging is not allowed at this time", (uint8_t *)&buf, 2u);
    }
  }
}

- (void)_pauseWifiRanging
{
  v6.receiver = self;
  v6.super_class = (Class)NIServerHomeDeviceSession;
  unsigned __int8 v3 = [(NIServerBaseSession *)&v6 resourcesManager];
  id v4 = [v3 btResource];
  [v4 clearWifiRangingActiveAdvertisement];

  if (self->_wifiSessions.__table_.__p2_.__value_)
  {
    for (i = &self->_wifiSessions.__table_.__p1_; ; sub_10002E19C((uint64_t)i[3].__value_.__next_))
    {
      i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<WiFiRanging::Session>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<WiFiRanging::Session>>, void *>>> *)i->__value_.__next_;
      if (!i) {
        break;
      }
    }
  }
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  self->_isRunning = 0;
  self->_shouldDeliverUpdates = 0;
  self->_shouldHandleUWBStateReadinessUpdates = 0;
  [(CBAdvertiser *)self->_leechingAidingAdvertiser invalidate];
  leechingAidingAdvertiser = self->_leechingAidingAdvertiser;
  self->_leechingAidingAdvertiser = 0;

  v19.receiver = self;
  v19.super_class = (Class)NIServerHomeDeviceSession;
  id v4 = [(NIServerBaseSession *)&v19 resourcesManager];
  unsigned __int8 v5 = [v4 devicePresenceResource];
  objc_super v6 = [v5 internalObserver];
  [v6 stopBTScanningWithMaxRateForPrototypeHomeSession];

  sub_1001A4EE8((uint64_t)&self->_cachedRegionUpdateEvent);
  ptr = self->_backoffResumeManager.__ptr_;
  if (ptr)
  {
    sub_10028CF34((uint64_t)ptr);
    cntrl = (std::__shared_weak_count *)self->_backoffResumeManager.__cntrl_;
    self->_backoffResumeManager.__ptr_ = 0;
    self->_backoffResumeManager.__cntrl_ = 0;
    if (cntrl) {
      sub_10001A970(cntrl);
    }
  }
  motionManager = self->_motionManager;
  self->_motionManager = 0;

  id v10 = [(NIServerHomeDeviceSession *)self disableAllServices];
  double v11 = sub_100006C38();
  sub_1002379F8((uint64_t)&self->_handoffCAManager, v11);
  sub_1002D7328(self->_wifiCAManager.__ptr_);
  sub_100004950(v17, (char *)[(NSString *)self->_containerUniqueIdentifier UTF8String]);
  id v12 = sub_10001D404();
  if (SHIBYTE(v18) < 0)
  {
    sub_100002DE4(__p, v17[0], (unint64_t)v17[1]);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)v17;
    uint64_t v16 = v18;
  }
  sub_10001DD88((uint64_t)v12, (const void **)__p);
  if (SHIBYTE(v16) < 0) {
    operator delete(__p[0]);
  }
  self->_firstWifiMeasurementsReceived = 0;
  v14.receiver = self;
  v14.super_class = (Class)NIServerHomeDeviceSession;
  [(NIServerBaseSession *)&v14 invalidate];
  id v13 = +[NIServerHomeDeviceService sharedInstance];
  [v13 removeServiceClientWithIdentifier:self->_containerUniqueIdentifier];

  if (SHIBYTE(v18) < 0) {
    operator delete(v17[0]);
  }
}

- (void)dealloc
{
  unsigned __int8 v3 = +[NIServerHomeDeviceService sharedInstance];
  [v3 removeServiceClientWithIdentifier:self->_containerUniqueIdentifier];

  v4.receiver = self;
  v4.super_class = (Class)NIServerHomeDeviceSession;
  [(NIServerHomeDeviceSession *)&v4 dealloc];
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)150;
}

- (unint64_t)requiresUWBToRun
{
  return 1;
}

- (unint64_t)requiresSpatialInteractionBluetoothResource
{
  return 2;
}

- (void)deviceDiscovered:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (self->_currentSessionRole == 100) {
    goto LABEL_125;
  }
  unsigned __int8 v5 = +[NSUserDefaults standardUserDefaults];
  unsigned int v6 = [v5 BOOLForKey:@"HomeDeviceSessionBTLeechingEnabled"];

  uint64_t v7 = qword_1008ABDE0;
  BOOL v8 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v8)
    {
      containerUniqueIdentifier = self->_containerUniqueIdentifier;
      *(_DWORD *)__n128 buf = 138412546;
      *(void *)&uint8_t buf[4] = containerUniqueIdentifier;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-home,Device discovered. Session Identifier: %@. Device: %@", buf, 0x16u);
    }
    v93.receiver = self;
    v93.super_class = (Class)NIServerHomeDeviceSession;
    v88 = [(NIServerBaseSession *)&v93 resourcesManager];
    id v10 = [v88 wifiResource];
    unsigned int v86 = [v10 deviceCapabilities];

    if ([v4 isUwbCapable]) {
      BOOL uwbSystemAvailable = self->_uwbSystemAvailable;
    }
    else {
      BOOL uwbSystemAvailable = 0;
    }
    unsigned int v85 = [v4 isWifiRangingCapable];
    long long v91 = xmmword_1004BAB78;
    uint64_t v92 = 1;
    v87 = +[NSUserDefaults standardUserDefaults];
    if ([v4 systemKeyRelationship])
    {
      id v12 = [v4 cbDevice];
      id v13 = [v12 model];

      if (!v13)
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10041E65C();
        }
        goto LABEL_124;
      }
      objc_super v14 = [v87 objectForKey:@"NIHomeDisableAllowListPolicy"];
      BOOL v15 = v14 == 0;

      if (v15) {
        unsigned int v16 = 0;
      }
      else {
        unsigned int v16 = [v87 BOOLForKey:@"NIHomeDisableAllowListPolicy"];
      }
      int v23 = sub_100203CA8(v13);
      int v24 = v23;
      if ((uwbSystemAvailable & (v16 ^ 1)) == 1 && (v23 & 0x3FD) == 0x3E5)
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10041E690();
        }
        goto LABEL_124;
      }
      LOBYTE(v91) = [(NIServerHomeDeviceSession *)self _biasCorrectionRequirementFromModelString:v13];
      DWORD1(v91) = [(NIServerHomeDeviceSession *)self _magneticFieldStrengthCheckOptionFromModelString:v13];
      unsigned int v84 = sub_10039D104(v24);
      LODWORD(v92) = [(NIServerHomeDeviceSession *)self _intentPredictorConfigFromModelString:v13];
      if ((id)[(NIServerHomeDeviceSession *)self _regionCategoryFromModelString:v13] == (id)10)
      {
        int64_t regionSizeCategory = 10;
      }
      else
      {
        int64_t regionSizeCategory = self->_recommendedProcessingOptions.regionSizeCategory;
        if (regionSizeCategory != 10) {
          int64_t regionSizeCategory = 0;
        }
      }
      *((void *)&v91 + 1) = regionSizeCategory;
      v26 = [v88 lifecycleSupervisor];
      char v27 = [v4 discoveryToken];
      v106 = v27;
      BOOL v28 = +[NSArray arrayWithObjects:&v106 count:1];
      [v26 startedDiscoveringPeersWithTokens:v28];
    }
    else
    {
      NSErrorUserInfoKey v17 = [v4 discoveryToken];
      LOBYTE(v91) = [(NIServerHomeDeviceSession *)self _biasCorrectionRequirementFromDiscoveryToken:v17];

      uint64_t v18 = [v4 discoveryToken];
      DWORD1(v91) = [(NIServerHomeDeviceSession *)self _magneticFieldStrengthCheckOptionFromDiscoveryToken:v18];

      objc_super v19 = [v4 discoveryToken];
      unsigned int v84 = [(NIServerHomeDeviceSession *)self _homeAnchorVariantFromDiscoveryToken:v19];

      uint64_t v20 = [v4 discoveryToken];
      LODWORD(v92) = [(NIServerHomeDeviceSession *)self _intentPredictorConfigFromDiscoveryToken:v20];

      v21 = [v4 discoveryToken];
      int64_t v22 = [(NIServerHomeDeviceSession *)self _regionCategoryFromDiscoveryToken:v21];

      if (v22 == 10 || self->_recommendedProcessingOptions.regionSizeCategory == 10) {
        *((void *)&v91 + 1) = 10;
      }
      else {
        *((void *)&v91 + 1) = 0;
      }
    }
    double v29 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      sub_100054E28((uint64_t)buf);
      int v30 = sub_100056628(&buf[16], (uint64_t)"require bias correction: ", 25);
      if ((_BYTE)v91) {
        id v31 = "yes";
      }
      else {
        id v31 = "no";
      }
      if ((_BYTE)v91) {
        uint64_t v32 = 3;
      }
      else {
        uint64_t v32 = 2;
      }
      id v33 = sub_100056628(v30, (uint64_t)v31, v32);
      std::ios_base::getloc((const std::ios_base *)((char *)v33 + *(void *)(*v33 - 24)));
      v34 = std::locale::use_facet(&v94, &std::ctype<char>::id);
      ((void (*)(const std::locale::facet *, uint64_t))v34->__vftable[2].~facet_0)(v34, 10);
      std::locale::~locale(&v94);
      std::ostream::put();
      std::ostream::flush();
      sub_100056628(&buf[16], (uint64_t)"magnetic field strength check options: ", 39);
      int64_t v35 = (void *)std::ostream::operator<<();
      std::ios_base::getloc((const std::ios_base *)((char *)v35 + *(void *)(*v35 - 24)));
      id v36 = std::locale::use_facet(&v94, &std::ctype<char>::id);
      ((void (*)(const std::locale::facet *, uint64_t))v36->__vftable[2].~facet_0)(v36, 10);
      std::locale::~locale(&v94);
      std::ostream::put();
      std::ostream::flush();
      sub_100056628(&buf[16], (uint64_t)"region size category: ", 22);
      v37 = (void *)std::ostream::operator<<();
      std::ios_base::getloc((const std::ios_base *)((char *)v37 + *(void *)(*v37 - 24)));
      id v38 = std::locale::use_facet(&v94, &std::ctype<char>::id);
      ((void (*)(const std::locale::facet *, uint64_t))v38->__vftable[2].~facet_0)(v38, 10);
      std::locale::~locale(&v94);
      std::ostream::put();
      std::ostream::flush();
      sub_100056628(&buf[16], (uint64_t)"intent predictor config: ", 25);
      uint64_t v39 = (void *)std::ostream::operator<<();
      std::ios_base::getloc((const std::ios_base *)((char *)v39 + *(void *)(*v39 - 24)));
      v40 = std::locale::use_facet(&v94, &std::ctype<char>::id);
      ((void (*)(const std::locale::facet *, uint64_t))v40->__vftable[2].~facet_0)(v40, 10);
      std::locale::~locale(&v94);
      std::ostream::put();
      std::ostream::flush();
      std::stringbuf::str();
      *(void *)&uint8_t buf[16] = v41;
      if (v104 < 0) {
        operator delete(__p);
      }
      std::streambuf::~streambuf();
      std::iostream::~basic_iostream();
      std::ios::~ios();
      int v42 = v95;
      if (v96 < 0) {
        int v42 = *(unsigned char **)v95;
      }
      LODWORD(v100) = 136315138;
      *(void *)((char *)&v100 + 4) = v42;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "#ses-home,processing options are %s", (uint8_t *)&v100, 0xCu);
      if (SHIBYTE(v96) < 0) {
        operator delete(*(void **)v95);
      }
    }

    id v13 = +[NINearbyObject objectFromBluetoothDevice:v4];
    if (!v13)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_10041E6F8();
      }
      goto LABEL_124;
    }
    id v43 = [v88 remote];
    [v43 didDiscoverNearbyObject:v13];

    if (self->_pbLogger.__ptr_)
    {
      double v44 = sub_100006C38();
      ptr = self->_pbLogger.__ptr_;
      id v46 = [v4 u64Identifier];
      sub_100290760(v13, (uint64_t)buf);
      sub_10029C56C((uint64_t)ptr, (uint64_t)v46, (uint64_t)buf, v44);
      if (*(void *)buf)
      {
        *(void *)&uint8_t buf[8] = *(void *)buf;
        operator delete(*(void **)buf);
      }
    }
    if (![(NIServerHomeDeviceSession *)self _shouldRespondToDevice:v4])
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10041E864();
      }
      goto LABEL_124;
    }
    if (uwbSystemAvailable)
    {
      if (!self->_currentSessionRole) {
        goto LABEL_124;
      }
      if (self->_currentSessionRole != 1) {
        __assert_rtn("-[NIServerHomeDeviceSession deviceDiscovered:]", "NIServerHomeDeviceSession.mm", 1314, "_currentSessionRole == Role::Responder");
      }
      if (([v87 BOOLForKey:@"NIHomeAllowMobileAsAnchor"] & 1) == 0
        && [v4 isMobilePhoneModel])
      {
        long long v47 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__n128 buf = 138412290;
          *(void *)&uint8_t buf[4] = v4;
          uint64_t v48 = "#ses-home,No uwb responding to another mobile: %@";
LABEL_111:
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, v48, buf, 0xCu);
          goto LABEL_124;
        }
        goto LABEL_124;
      }
      [(NIServerHomeDeviceSession *)self _prepareServiceRequestWithConfig:v84];
      if (!v105) {
        goto LABEL_124;
      }
      [(NIServerHomeDeviceSession *)self _buildRoseSession:buf];
      uint64_t v53 = v100;
      if ((void)v100)
      {
        id v90 = [v4 u64Identifier];
        v54 = sub_100056B3C(&self->_responderSessions.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v90);
        if (v54)
        {
          objc_super v55 = qword_1008ABDE0;
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v95 = 134217984;
            *(void *)&v95[4] = v90;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "#ses-home,Evicting previous UWB session with same identitifer: 0x%llx", v95, 0xCu);
          }
          uint64_t v56 = v54[3];
          NSErrorUserInfoKey v57 = (std::__shared_weak_count *)v54[4];
          if (v57) {
            atomic_fetch_add_explicit(&v57->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          if (v56) {
            sub_1002D8288(v56);
          }
          sub_10020BB70(&self->_responderSessions.__table_.__bucket_list_.__ptr_.__value_, v54);
          if (v57) {
            sub_10001A970(v57);
          }
        }
        v58 = [(NIServerHomeDeviceSession *)self objectFromIdentifier:v90];
        v59 = [v58 discoveryToken];

        if (v59)
        {
          double v60 = sub_100006C38();
          sub_100237508((uint64_t)&self->_handoffCAManager, (unint64_t)[v59 hash], (int)-[NIServerHomeDeviceSession nominalCycleRate](self, "nominalCycleRate"), v60);
        }
        v94.__locale_ = (std::locale::__imp *)&v90;
        *(void *)v95 = &v100;
        *(void *)&v95[8] = &v91;
        sub_10020BC18((uint64_t)&self->_responderSessions, (uint64_t *)&v90, (uint64_t)&unk_1004BC2F8, &v94, (uint64_t)v95);
        if (!v61 && os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10041E7C8();
        }
        NSErrorUserInfoKey v62 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          id v63 = [v4 u64Identifier];
          if ((_BYTE)v91) {
            NSErrorUserInfoKey v64 = "YES";
          }
          else {
            NSErrorUserInfoKey v64 = "NO";
          }
          sub_100290610(*((uint64_t *)&v91 + 1));
          id v65 = objc_claimAutoreleasedReturnValue();
          id v66 = [v65 UTF8String];
          *(_DWORD *)v95 = 134218754;
          *(void *)&v95[4] = v63;
          *(_WORD *)&v95[12] = 2080;
          *(void *)&v95[14] = v64;
          __int16 v96 = 2080;
          id v97 = v66;
          __int16 v98 = 1024;
          int v99 = DWORD1(v91);
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "#ses-home,recorded mac addr 0x%llx needs bias correction: %s, regionCategory: %s, magnetic field strength check option: %d", v95, 0x26u);
        }
        long long v89 = v100;
        if (*((void *)&v100 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v100 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        CFStringRef v67 = [(NIServerHomeDeviceSession *)self _triggerResponderRangingForSession:&v89 initiatorDevice:v4];
        if (*((void *)&v89 + 1)) {
          sub_10001A970(*((std::__shared_weak_count **)&v89 + 1));
        }
        if (v67)
        {
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
            sub_10041E760();
          }
          v68 = [v88 remote];
          [v68 uwbSessionDidFailWithError:v67];
        }
      }
      v69 = (std::__shared_weak_count *)*((void *)&v100 + 1);
      if (!*((void *)&v100 + 1)) {
        goto LABEL_121;
      }
    }
    else
    {
      if ((v85 & v86) == 0)
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10041E830();
        }
        goto LABEL_124;
      }
      objc_super v49 = [v4 cbDevice];
      uint64_t v50 = [v49 model];
      if ([v50 hasPrefix:@"AudioAccessory"])
      {
        v51 = [(NIServerHomeDeviceSession *)self configuration];
        unsigned int v52 = [v51 isAnchor];

        if (v52)
        {
          long long v47 = qword_1008ABDE0;
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__n128 buf = 138412290;
            *(void *)&uint8_t buf[4] = v4;
            uint64_t v48 = "#ses-home,No wifi responding to another anchor: %@";
            goto LABEL_111;
          }
LABEL_124:

          goto LABEL_125;
        }
      }
      else
      {
      }
      if ([v4 isMobilePhoneModel])
      {
        v70 = [(NIServerHomeDeviceSession *)self configuration];
        unsigned __int8 v71 = [v70 isAnchor];

        if ((v71 & 1) == 0)
        {
          long long v47 = qword_1008ABDE0;
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__n128 buf = 138412290;
            *(void *)&uint8_t buf[4] = v4;
            uint64_t v48 = "#ses-home,No wifi initiating to another mobile: %@";
            goto LABEL_111;
          }
          goto LABEL_124;
        }
      }
      v72 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        v73 = [v4 cbDevice];
        v74 = [v73 model];
        *(_DWORD *)__n128 buf = 138412290;
        *(void *)&uint8_t buf[4] = v74;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "#ses-home,Starting a wifi session with a peer model: %@", buf, 0xCu);
      }
      [(NIServerHomeDeviceSession *)self _buildWifiSession];
      uint64_t v53 = *(void *)v95;
      if (*(void *)v95)
      {
        id v75 = [v4 u64Identifier];
        v76 = [(NIServerHomeDeviceSession *)self configuration];
        if ([v76 isAnchor]) {
          int v77 = 2;
        }
        else {
          int v77 = 1;
        }
        sub_10002DC88((uint64_t)buf, (uint64_t)v75, v77);

        double v78 = sub_100006C38();
        sub_1002D7A9C((uint64_t)self->_wifiCAManager.__ptr_, v78);
        if ([(NIServerHomeDeviceSession *)self _isWifiRangingAllowed]) {
          sub_10002E458(*(uint64_t *)v95, (uint64_t)buf);
        }
        v79 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v100) = 0;
          _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "#ses-home,WiFi ranging is not allowed at this time.", (uint8_t *)&v100, 2u);
        }
        v94.__locale_ = (std::locale::__imp *)[v4 u64Identifier];
        *(void *)&long long v100 = &v94;
        v80 = sub_10020BF5C((uint64_t)&self->_wifiSessions, (unint64_t *)&v94, (uint64_t)&unk_1004BC2F8, (void **)&v100);
        uint64_t v82 = *(void *)v95;
        uint64_t v81 = *(void *)&v95[8];
        if (*(void *)&v95[8]) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&v95[8] + 8), 1uLL, memory_order_relaxed);
        }
        v83 = (std::__shared_weak_count *)v80[4];
        v80[3] = v82;
        v80[4] = v81;
        if (v83) {
          sub_10001A970(v83);
        }
      }
      v69 = *(std::__shared_weak_count **)&v95[8];
      if (!*(void *)&v95[8])
      {
LABEL_121:
        if (!v53 && os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10041E72C();
        }
        goto LABEL_124;
      }
    }
    sub_10001A970(v69);
    goto LABEL_121;
  }
  if (v8)
  {
    *(_WORD *)__n128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-home,Disable UWB-aided handoff with HomeDeviceSessionBTLeechingEnabled", buf, 2u);
  }
LABEL_125:
}

- (void)bluetoothAdvertisingAddressChanged:(unint64_t)a3
{
  unint64_t v5 = a3;
  id v3 = [objc_alloc((Class)NSData) initWithBytes:&v5 length:6];
  id v4 = sub_10001D404();
  sub_10001D4A4((uint64_t)v4, v3);
}

- (void)device:(id)a3 rediscovered:(id)a4
{
  id v72 = a3;
  id v73 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  id v78 = [v72 u64Identifier];
  unint64_t v6 = (unint64_t)sub_100056B3C(&self->_responderSessions.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v78);
  unint64_t v7 = (unint64_t)sub_100056B3C(&self->_wifiSessions.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v78);
  if (v6 | v7)
  {
    v77.receiver = self;
    v77.super_class = (Class)NIServerHomeDeviceSession;
    unsigned __int8 v71 = [(NIServerBaseSession *)&v77 resourcesManager];
    p_wifiSessions = &self->_wifiSessions;
    v70 = [v72 discoveryToken];
    if (!v70) {
      goto LABEL_12;
    }
    BOOL v8 = [v71 lifecycleSupervisor];
    if (([v8 isTrackingPeer:v70] & 1) == 0)
    {
      unsigned int v9 = [v73 systemKeyRelationship];

      if (!v9) {
        goto LABEL_12;
      }
      id v10 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__n128 buf = 138412290;
        *(void *)&uint8_t buf[4] = v70;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-home,Re-discovered peer has systemKeyRelationship but isn't being tracked, retracking peer with token: %@", buf, 0xCu);
      }
      BOOL v8 = [v71 lifecycleSupervisor];
      v83 = v70;
      double v11 = +[NSArray arrayWithObjects:&v83 count:1];
      [v8 startedDiscoveringPeersWithTokens:v11];
    }
LABEL_12:
    if (self->_pbLogger.__ptr_)
    {
      double v12 = sub_100006C38();
      id v13 = +[NINearbyObject objectFromBluetoothDevice:v73];
      if (v13)
      {
        ptr = self->_pbLogger.__ptr_;
        id v15 = [v73 u64Identifier];
        sub_100290760(v13, (uint64_t)buf);
        sub_10029C56C((uint64_t)ptr, (uint64_t)v15, (uint64_t)buf, v12);
        if (*(void *)buf)
        {
          *(void *)&uint8_t buf[8] = *(void *)buf;
          operator delete(*(void **)buf);
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT))
      {
        sub_10041E6F8();
      }
    }
    id v76 = [v73 u64Identifier];
    id v16 = [v73 u64Identifier];
    id v17 = [v72 u64Identifier];
    unsigned int v18 = [v73 isWifiRangingCapable];
    unsigned int v19 = [v72 isWifiRangingCapable];
    int currentSessionRole = self->_currentSessionRole;
    v21 = qword_1008ABDE0;
    if (v16 != v17 && currentSessionRole == 1 && v6)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__n128 buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#ses-home,Device rediscovered decision: restarting UWB session since address is change, role == responder and there's active UWB session.", buf, 2u);
      }
      uint64_t v22 = *(void *)(v6 + 32);
      *(void *)__n128 buf = *(void *)(v6 + 24);
      *(void *)&uint8_t buf[8] = v22;
      if (v22) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v22 + 8), 1uLL, memory_order_relaxed);
      }
      *(_OWORD *)&uint8_t buf[16] = *(_OWORD *)(v6 + 40);
      uint64_t v82 = *(void *)(v6 + 56);
      sub_10020C1AC(&self->_responderSessions.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)(v6 + 16));
      *(void *)v79 = &v76;
      *(void *)v80 = buf;
      *(void *)&v80[8] = &buf[16];
      sub_10020BC18((uint64_t)&self->_responderSessions, (uint64_t *)&v76, (uint64_t)&unk_1004BC2F8, (void **)v79, (uint64_t)v80);
      int v23 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v80 = 134218240;
        *(void *)&v80[4] = v78;
        *(_WORD *)&v80[12] = 2048;
        *(void *)&v80[14] = v76;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#ses-home,updated mac addr 0x%llx -> 0x%llx in processing info dictionary", v80, 0x16u);
      }
      uint64_t v74 = *(void *)buf;
      id v75 = *(std::__shared_weak_count **)&buf[8];
      if (*(void *)&buf[8]) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 1uLL, memory_order_relaxed);
      }
      int v24 = [(NIServerHomeDeviceSession *)self _triggerResponderRangingForSession:&v74 initiatorDevice:v73];
      if (v75) {
        sub_10001A970(v75);
      }
      if (v24)
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10041E9B4();
        }
        double v25 = [v71 remote];
        [v25 uwbSessionDidFailWithError:v24];
      }
LABEL_37:
      v26 = *(std::__shared_weak_count **)&buf[8];
      if (*(void *)&buf[8]) {
LABEL_38:
      }
        sub_10001A970(v26);
LABEL_39:

      goto LABEL_40;
    }
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__n128 buf = 67109632;
      *(_DWORD *)&uint8_t buf[4] = v16 != v17;
      *(_WORD *)&uint8_t buf[8] = 1024;
      *(_DWORD *)&buf[10] = currentSessionRole == 1;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&uint8_t buf[16] = v6 != 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "#ses-home,Device rediscovered decision: Not restarting UWB session since addressChange?: %d, role == responder?: %d and active UWB session?:%d", buf, 0x14u);
    }
    char v27 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      containerUniqueIdentifier = self->_containerUniqueIdentifier;
      *(_DWORD *)__n128 buf = 138412802;
      *(void *)&uint8_t buf[4] = containerUniqueIdentifier;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v73;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&unsigned char buf[24] = v72;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#ses-home,Device re-discovered. Session Identifier: %@. New Device: %@, cached device: %@", buf, 0x20u);
    }
    int v29 = v18 ^ v19;
    if (v16 == v17)
    {
      if (v29) {
        goto LABEL_53;
      }
    }
    else
    {
      if (v7) {
        char v30 = 1;
      }
      else {
        char v30 = v29;
      }
      if (v30) {
        goto LABEL_53;
      }
    }
    if (([v72 isWifiRangingCapable] & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
        sub_10041EA1C();
      }
      goto LABEL_39;
    }
LABEL_53:
    id v31 = [v71 wifiResource];
    unsigned int v32 = [v31 deviceCapabilities];

    if (v7)
    {
      unsigned int v33 = [v73 isWifiRangingCapable];
      unsigned __int8 v34 = [v73 isWifiRangingCapable];
      if (v16 == v17) {
        int v35 = v29;
      }
      else {
        int v35 = 1;
      }
      if ((v33 & v35) == 1)
      {
        id v36 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v37 = [v73 isWifiRangingCapable];
          *(_DWORD *)__n128 buf = 67109376;
          *(_DWORD *)&uint8_t buf[4] = v16 != v17;
          *(_WORD *)&uint8_t buf[8] = 1024;
          *(_DWORD *)&buf[10] = v37;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "#ses-home,Restart Wifi Session due to address roll or updated device's wifi ranging capable bit. advAddressChanged: %d, current device's wifiRanging: %d", buf, 0xEu);
        }

        unint64_t v38 = *(void *)(v7 + 32);
        *(void *)v80 = *(void *)(v7 + 24);
        *(void *)&v80[8] = v38;
        if (v38) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v38 + 8), 1uLL, memory_order_relaxed);
        }
        sub_10020C1AC(p_wifiSessions, (unint64_t *)(v7 + 16));
        sub_10020C1E4((uint64_t)p_wifiSessions, (unint64_t *)&v76, &v76, (uint64_t *)v80);
        uint64_t v39 = (uint64_t)v76;
        v40 = [(NIServerHomeDeviceSession *)self configuration];
        if ([v40 isAnchor]) {
          int v41 = 2;
        }
        else {
          int v41 = 1;
        }
        sub_10002DC88((uint64_t)buf, v39, v41);

        sub_10002E19C(*(uint64_t *)v80);
        if ([(NIServerHomeDeviceSession *)self _isWifiRangingAllowed]) {
          sub_10002E458(*(uint64_t *)v80, (uint64_t)buf);
        }
        v51 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v79 = 0;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "#ses-home,not ranging to rediscovered device because wifi ranging is not currently allowed", v79, 2u);
        }

        v26 = *(std::__shared_weak_count **)&v80[8];
        if (!*(void *)&v80[8]) {
          goto LABEL_39;
        }
        goto LABEL_38;
      }
      if (v34) {
        goto LABEL_39;
      }
      uint64_t v48 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v49 = [v73 isWifiRangingCapable];
        *(_DWORD *)__n128 buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = v16 != v17;
        *(_WORD *)&uint8_t buf[8] = 1024;
        *(_DWORD *)&buf[10] = v49;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "#ses-home,Stop Wifi Session due to updated device's wifi ranging capable bit off. advAddressChanged: %d, current device's wifiRanging: %d", buf, 0xEu);
      }

      unint64_t v50 = *(void *)(v7 + 32);
      *(void *)__n128 buf = *(void *)(v7 + 24);
      *(void *)&uint8_t buf[8] = v50;
      if (v50) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v50 + 8), 1uLL, memory_order_relaxed);
      }
      sub_10020C1AC(p_wifiSessions, (unint64_t *)(v7 + 16));
      sub_10020C1E4((uint64_t)p_wifiSessions, (unint64_t *)&v76, &v76, (uint64_t *)buf);
      sub_10002E19C(*(uint64_t *)buf);
      goto LABEL_37;
    }
    if (([v73 isWifiRangingCapable] & v32 & 1) == 0) {
      goto LABEL_39;
    }
    int v42 = [v72 cbDevice];
    id v43 = [v42 model];
    if ([v43 hasPrefix:@"AudioAccessory"])
    {
      double v44 = [(NIServerHomeDeviceSession *)self configuration];
      unsigned int v45 = [v44 isAnchor];

      if (v45)
      {
        id v46 = qword_1008ABDE0;
        if (!os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO)) {
          goto LABEL_39;
        }
        *(_DWORD *)__n128 buf = 138412290;
        *(void *)&uint8_t buf[4] = v72;
        long long v47 = "#ses-home,No wifi responding to another anchor: %@";
        goto LABEL_98;
      }
    }
    else
    {
    }
    if (![v72 isMobilePhoneModel]
      || ([(NIServerHomeDeviceSession *)self configuration],
          unsigned int v52 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v53 = [v52 isAnchor],
          v52,
          (v53 & 1) != 0))
    {
      v54 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v55 = [v72 cbDevice];
        uint64_t v56 = [v55 model];
        *(_DWORD *)__n128 buf = 138412290;
        *(void *)&uint8_t buf[4] = v56;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "#ses-home,Starting a wifi session with a peer model: %@", buf, 0xCu);
      }
      [(NIServerHomeDeviceSession *)self _buildWifiSession];
      NSErrorUserInfoKey v57 = v72;
      if (*(void *)v80)
      {
        id v58 = [v72 u64Identifier];
        v59 = [(NIServerHomeDeviceSession *)self configuration];
        if ([v59 isAnchor]) {
          int v60 = 2;
        }
        else {
          int v60 = 1;
        }
        sub_10002DC88((uint64_t)buf, (uint64_t)v58, v60);

        double v61 = sub_100006C38();
        sub_1002D7A9C((uint64_t)self->_wifiCAManager.__ptr_, v61);
        if ([(NIServerHomeDeviceSession *)self _isWifiRangingAllowed]) {
          sub_10002E458(*(uint64_t *)v80, (uint64_t)buf);
        }
        NSErrorUserInfoKey v64 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v79 = 0;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "#ses-home,WiFi ranging is not allowed at this time.", v79, 2u);
        }

        id v63 = 0;
        NSErrorUserInfoKey v57 = v72;
        NSErrorUserInfoKey v62 = &self->_wifiSessions;
      }
      else
      {
        +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:0];
        v63 = NSErrorUserInfoKey v62 = &self->_wifiSessions;
      }
      *(void *)v79 = [v57 u64Identifier];
      *(void *)__n128 buf = v79;
      id v65 = sub_10020BF5C((uint64_t)v62, (unint64_t *)v79, (uint64_t)&unk_1004BC2F8, (void **)buf);
      uint64_t v67 = *(void *)v80;
      uint64_t v66 = *(void *)&v80[8];
      if (*(void *)&v80[8]) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&v80[8] + 8), 1uLL, memory_order_relaxed);
      }
      v68 = (std::__shared_weak_count *)v65[4];
      v65[3] = v67;
      v65[4] = v66;
      if (v68) {
        sub_10001A970(v68);
      }
      if (*(void *)&v80[8]) {
        sub_10001A970(*(std::__shared_weak_count **)&v80[8]);
      }

      goto LABEL_39;
    }
    id v46 = qword_1008ABDE0;
    if (!os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO)) {
      goto LABEL_39;
    }
    *(_DWORD *)__n128 buf = 138412290;
    *(void *)&uint8_t buf[4] = v72;
    long long v47 = "#ses-home,No wifi initiating to another mobile: %@";
LABEL_98:
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, v47, buf, 0xCu);
    goto LABEL_39;
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_10041E980();
  }
  [(NIServerHomeDeviceSession *)self deviceDiscovered:v73];
LABEL_40:
}

- (void)deviceLost:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  id v13 = [v4 u64Identifier];
  p_wifiSessions = &self->_wifiSessions;
  unint64_t v6 = sub_100056B3C(p_wifiSessions, (unint64_t *)&v13);
  unint64_t v7 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = [v4 isWifiRangingCapable];
    *(_DWORD *)__n128 buf = 67109120;
    unsigned int v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-home,device lost, current wifi capabilities from cached device: %d", buf, 8u);
  }

  if (v6)
  {
    unsigned int v9 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__n128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ses-home,stopping wifi ranging session due to lost device", buf, 2u);
    }
    id v10 = v6 + 2;
    uint64_t v12 = v6[3];
    double v11 = (std::__shared_weak_count *)v6[4];
    if (v11) {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    sub_10020C1AC(p_wifiSessions, v10);
    sub_10002E19C(v12);
    if (v11) {
      sub_10001A970(v11);
    }
  }
}

- (void)didReceiveNewSolution:(const void *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if ((*((_DWORD *)a3 + 8) - 1) >= 3)
  {
    id v13 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10041EBC8((int *)a3 + 8, v13);
    }
  }
  else
  {
    if (*((unsigned char *)a3 + 24))
    {
      double v5 = *((double *)a3 + 2);
      unint64_t v6 = *((void *)a3 + 5);
      v18.receiver = self;
      v18.super_class = (Class)NIServerHomeDeviceSession;
      unint64_t v19 = v6;
      unint64_t v7 = [(NIServerBaseSession *)&v18 discoveryTokenFromIdentifier:v6];
      if (!v7)
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10041EA90();
        }
        goto LABEL_19;
      }
      v17.receiver = self;
      v17.super_class = (Class)NIServerHomeDeviceSession;
      unsigned int v8 = [(NIServerBaseSession *)&v17 resourcesManager];
      unsigned int v9 = [v8 lifecycleSupervisor];
      unsigned __int8 v10 = [v9 isTrackingPeer:v7];

      if ((v10 & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10041EB60();
        }
        goto LABEL_18;
      }
      if (self->_currentSessionRole == 1)
      {
        double v11 = sub_100056B3C(&self->_responderSessions.__table_.__bucket_list_.__ptr_.__value_, &v19);
        if (!v11)
        {
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
            sub_10041EAF8();
          }
          goto LABEL_18;
        }
        p_recommendedProcessingOptions = (AlgorithmProcessingOptions *)(v11 + 5);
      }
      else
      {
        p_recommendedProcessingOptions = &self->_recommendedProcessingOptions;
      }
      long long v15 = *(_OWORD *)&p_recommendedProcessingOptions->requiresBiasCorrection;
      uint64_t v16 = *(void *)&p_recommendedProcessingOptions->intentPredictorConfiguration;
      [(NINearbyUpdatesEngine *)self->_updatesEngine acceptRoseSolution:a3 withProcessingOptions:&v15];
      objc_super v14 = [v8 lifecycleSupervisor];
      [v14 measurementReceivedForToken:v7 contTimestamp:v5];

LABEL_18:
LABEL_19:

      return;
    }
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041EA5C();
    }
  }
}

- (void)didReceiveDeviceMotion:(const void *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  [(NINearbyUpdatesEngine *)self->_updatesEngine acceptDeviceMotion:a3];
  double v6 = *(double *)a3;
  uint64_t v7 = *(void *)&self->_anon_1c8[32];
  if (v7 != *(void *)&self->_anon_1c8[24])
  {
    double v8 = v6 - *(double *)(v7 - 8);
    if (v8 > 0.02 || v8 < 0.0) {
      return;
    }
  }
  float64x2_t v9 = *((float64x2_t *)a3 + 8);
  double v10 = *((double *)a3 + 18);
  BOOL v11 = v9.f64[0] == 0.0;
  double v12 = *((double *)a3 + 17);
  if (v9.f64[1] != 0.0) {
    BOOL v11 = 0;
  }
  BOOL v13 = v10 == 0.0 && v11;
  uint64_t v14 = *(void *)&self->_anon_1c8[8];
  if (v14 == *(void *)self->_anon_1c8 || !self->_anon_1a0[24] || *(double *)&self->_anon_1a0[8] < v6 + -60.0)
  {
    if (v13) {
      return;
    }
    goto LABEL_16;
  }
  if (!v13)
  {
LABEL_16:
    *(float32x2_t *)&long long v5 = vcvt_f32_f64(v9);
    float v22 = v10;
    *((float *)&v5 + 2) = v22;
    long long v24 = *((_OWORD *)a3 + 8);
    long long v25 = v5;
    sub_100205634((void **)self->_anon_1f8, &v25, v6);
    [(NIServerHomeDeviceSession *)self _calculateMagneticFieldBias];
    double v21 = sqrt(v12 * v12 + *(double *)&v24 * *(double *)&v24 + v10 * v10);
    goto LABEL_17;
  }
  _S2 = vsubq_f32(*(float32x4_t *)(v14 - 16), (float32x4_t)self[408]).i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  double v21 = sqrtf(_S1);
LABEL_17:
  p_filteredMFStrength = &self->_filteredMFStrength;
  if (self->_filteredMFStrength.__engaged_) {
    double v21 = v21 * 0.3 + p_filteredMFStrength->var0.__val_ * 0.7;
  }
  else {
    self->_filteredMFStrength.__engaged_ = 1;
  }
  p_filteredMFStrength->var0.__val_ = v21;
  [(NINearbyUpdatesEngine *)self->_updatesEngine acceptMagneticFieldStrength:v24];
}

- (void)didReceiveMagnetometerData:(NIServerHomeDeviceSession *)self at:(SEL)a2
{
  double v4 = v3;
  long long v5 = v2;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  long long v7 = *v5;
  sub_100205634((void **)self->_anon_1c8, &v7, v4);
  [(NIServerHomeDeviceSession *)self _calculateMagneticFieldBias];
}

- (void)didReceiveRemoteData:(const void *)a3
{
  double v4 = (char *)a3 + 8;
  double v3 = (unsigned char *)*((void *)a3 + 1);
  long long v5 = (char *)a3 + 16;
  if (*((void *)a3 + 2) - (void)v3 > 0xFuLL)
  {
    if (*v3 == 2)
    {
      if (v3[1])
      {
        float64x2_t v9 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = *((void *)a3 + 5);
          int v11 = 134283521;
          uint64_t v12 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ses-home,#hangup Received hangup from 0x%{private}llx.", (uint8_t *)&v11, 0xCu);
        }
        [(NIServerHomeDeviceSession *)self _peerHungUp:*((void *)a3 + 5)];
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
    {
      sub_10041ED08();
    }
  }
  else
  {
    double v6 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041EC70(v5, v4, v6);
    }
  }
}

- (void)_roseSession:(shared_ptr<rose:(int)a4 :(float)a5 objects:(float)a6 :(int)a7 RoseBaseSession>)a3 didChangeRangingUpdateRate:newThrottleRate:prevThrottleRate:effectiveSinceCycleInde:
{
  int var1 = (int)a3.var1;
  var0 = a3.var0;
  v29.receiver = self;
  v29.super_class = (Class)NIServerHomeDeviceSession;
  BOOL v13 = [(NIServerBaseSession *)&v29 resourcesManager];
  if (var1)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041ED70();
    }
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    CFStringRef v31 = @"Failed to adjust ranging rate.";
    uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    long long v15 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v14];

    uint64_t v16 = [v13 remote];
    [v16 uwbSessionDidFailWithError:v15];
  }
  else
  {
    next = self->_responderSessions.__table_.__p1_.__value_.__next_;
    if (!next) {
      goto LABEL_24;
    }
    int v18 = 0;
    uint64_t v19 = 0;
    do
    {
      uint64_t v21 = next[3];
      uint64_t v20 = (std::__shared_weak_count *)next[4];
      if (v20)
      {
        atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
        BOOL v22 = v21 == *(void *)var0;
        if (v22) {
          uint64_t v19 = next[2];
        }
        v18 |= v22;
        sub_10001A970(v20);
      }
      else
      {
        BOOL v23 = v21 == *(void *)var0;
        if (v23) {
          uint64_t v19 = next[2];
        }
        v18 |= v23;
      }
      next = (void *)*next;
    }
    while (next);
    if (v18)
    {
      long long v24 = [(NIServerHomeDeviceSession *)self objectFromIdentifier:v19];
      long long v25 = [v24 discoveryToken];
      v26.__rep_ = (int64_t)[(NIServerHomeDeviceSession *)self nominalCycleRate];
      *(float *)&double v27 = a5;
      [(NIServerHomeDeviceSession *)self _updateAnalyticsAboutRangingRateForDevice:v25 responseSkipRatio:v26.__rep_ cycleRate:v27];

      BOOL v28 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__n128 buf = 138413058;
        unsigned int v33 = v24;
        __int16 v34 = 2048;
        double v35 = a5;
        __int16 v36 = 2048;
        double v37 = a6;
        __int16 v38 = 1024;
        int v39 = a4;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#ses-home,#throttle Adjusting throttle rate succeeded for object %@. New rate %0.2f, old rate: %0.2f, cycle index: %d", buf, 0x26u);
      }
    }
    else
    {
LABEL_24:
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10041ED3C();
      }
    }
  }
}

- (BOOL)supportsDevicePresence
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned int v3 = [v2 BOOLForKey:@"HomeDeviceSessionBTLeechingEnabled"];

  double v4 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-home,#supportsDevicePresence homeDeviceSessionBTLeechingEnabled: %d", (uint8_t *)v6, 8u);
  }
  return v3;
}

- (id)getQueueForInputingData
{
  return self->_clientQueue;
}

- (BOOL)isInterestedInSamplesForDevice:(id)a3
{
  id v4 = a3;
  long long v5 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v6 = [v5 BOOLForKey:@"HomeDeviceSessionBTLeechingEnabled"];

  if ((v6 & 1) == 0) {
    goto LABEL_3;
  }
  if (([(NIHomeDeviceConfiguration *)self->_configuration allowedDevices] | 4) == 4) {
    goto LABEL_3;
  }
  if (![v4 rssi]) {
    goto LABEL_3;
  }
  float64x2_t v9 = [v4 idsDeviceID];

  if (!v9) {
    goto LABEL_3;
  }
  uint64_t v10 = [v4 idsDeviceID];
  if (v10)
  {
  }
  else if ((id)[(NIHomeDeviceConfiguration *)self->_configuration allowedDevices] == (id)2)
  {
    goto LABEL_3;
  }
  long long v7 = [v4 model];
  if (!v7) {
    goto LABEL_4;
  }
  int v11 = [v4 model];
  unsigned __int8 v12 = [v11 isEqualToString:@"NONE"];

  if ((v12 & 1) == 0)
  {
    LOBYTE(v7) = ((unint64_t)[v4 deviceFlags] & 0x380) != 0;
    goto LABEL_4;
  }
LABEL_3:
  LOBYTE(v7) = 0;
LABEL_4:

  return (char)v7;
}

- (void)consumeBluetoothSample:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  long long v5 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v6 = [v5 BOOLForKey:@"HomeDeviceSessionBTLeechingEnabled"];

  if (v6)
  {
    long long v7 = [v4 identifier];

    if (v7)
    {
      double v8 = [v4 model];

      if (!v8 && os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10041EE0C();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
    {
      sub_10041EDA4();
    }
  }
}

- (id)printableState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  unsigned int v3 = objc_opt_new();
  id v4 = +[NSMutableString stringWithFormat:@"["];
  long long v5 = +[NSMutableString stringWithFormat:@"["];
  ptr = self->_initiatorSession.__ptr_;
  if (ptr)
  {
    if (*((unsigned char *)ptr + 682)) {
      uint64_t v7 = *((unsigned __int16 *)ptr + 340);
    }
    else {
      uint64_t v7 = 0;
    }
    [v4 appendFormat:@"%d", v7];
  }
  next = self->_responderSessions.__table_.__p1_.__value_.__next_;
  if (next)
  {
    int v9 = 1;
    do
    {
      uint64_t v10 = next[3];
      int v11 = (std::__shared_weak_count *)next[4];
      if (v11) {
        atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (v10)
      {
        if (*(unsigned char *)(v10 + 682)) {
          uint64_t v12 = *(unsigned __int16 *)(v10 + 680);
        }
        else {
          uint64_t v12 = 0;
        }
        if (v9) {
          CFStringRef v13 = @"%d";
        }
        else {
          CFStringRef v13 = @", %d";
        }
        [v5 appendFormat:v13, v12];
        int v9 = 0;
      }
      if (v11) {
        sub_10001A970(v11);
      }
      next = (void *)*next;
    }
    while (next);
  }
  [v4 appendString:@"]"];
  [v5 appendString:@"]"];
  int currentSessionRole = self->_currentSessionRole;
  if (currentSessionRole == 100)
  {
    long long v15 = "Unspecified";
  }
  else if (currentSessionRole == 1)
  {
    long long v15 = "Responder";
  }
  else
  {
    long long v15 = "Initiator";
  }
  sub_100004950(__p, v15);
  int v16 = v26;
  objc_super v17 = (void **)__p[0];
  BOOL isRunning = self->_isRunning;
  BOOL uwbSystemAvailable = self->_uwbSystemAvailable;
  uint64_t v20 = +[NIInternalUtils NINearbyObjectUpdateRateToString:self->_minimumPreferredUpdateRate];
  uint64_t v21 = __p;
  if (v16 < 0) {
    uint64_t v21 = v17;
  }
  BOOL v22 = +[NSString stringWithFormat:@"Role: %s. Running: %d. UWB available: %d. Min upd rate: %s", v21, isRunning, uwbSystemAvailable, v20];
  [v3 addObject:v22];

  if (v26 < 0) {
    operator delete(__p[0]);
  }
  BOOL v23 = +[NSString stringWithFormat:@"UWB ranging: initiator tickets %@, responder tickets %@. WiFi ranging: %d sessions", v4, v5, self->_wifiSessions.__table_.__p2_.__value_];
  [v3 addObject:v23];

  return v3;
}

- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4
{
  if ((a3 - 1) < 2)
  {
    uint64_t v5 = 1;
    goto _objc_msgSend$_handleUWBSystemStateReadinessUpdate_;
  }
  if ((a3 - 3) < 2)
  {
    uint64_t v5 = 0;
_objc_msgSend$_handleUWBSystemStateReadinessUpdate_:
    -[NIServerHomeDeviceSession _handleUWBSystemStateReadinessUpdate:](self, "_handleUWBSystemStateReadinessUpdate:", v5, *(void *)&a4);
    return;
  }
  if (!a3) {
    sub_10041EE74();
  }
}

- (void)_handleUWBSystemStateReadinessUpdate:(BOOL)a3
{
  int v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (self->_shouldHandleUWBStateReadinessUpdates)
  {
    v18.receiver = self;
    v18.super_class = (Class)NIServerHomeDeviceSession;
    uint64_t v5 = [(NIServerBaseSession *)&v18 resourcesManager];
    int uwbSystemAvailable = self->_uwbSystemAvailable;
    uint64_t v7 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = "Y";
      if (uwbSystemAvailable) {
        int v9 = "Y";
      }
      else {
        int v9 = "N";
      }
      if (!v3) {
        double v8 = "N";
      }
      *(_DWORD *)__n128 buf = 136315394;
      uint64_t v20 = v9;
      __int16 v21 = 2080;
      BOOL v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-home,UWB system readiness update. Previously ready? %s. Now ready? %s", buf, 0x16u);
    }
    if (uwbSystemAvailable == v3) {
      goto LABEL_32;
    }
    self->_int uwbSystemAvailable = v3;
    uint64_t v10 = [v5 remote];
    [v10 didUpdateHomeDeviceUWBRangingAvailability:self->_uwbSystemAvailable];

    configuration = self->_configuration;
    if (!configuration) {
      __assert_rtn("-[NIServerHomeDeviceSession _handleUWBSystemStateReadinessUpdate:]", "NIServerHomeDeviceSession.mm", 2201, "_configuration");
    }
    if (self->_backoffResumeManager.__ptr_)
    {
      BOOL v17 = ([(NIConfiguration *)configuration suspensionPolicy] & 4) != 0;
      if (!self->_uwbSystemAvailable)
      {
        uint64_t v12 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__n128 buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#ses-home,Overriding lock screen only suspension policy: ENABLED.", buf, 2u);
        }
        BOOL v17 = 1;
      }
      sub_10028D574((uint64_t)self->_backoffResumeManager.__ptr_, (unsigned __int8 *)&v17);
    }
    if (!self->_isRunning) {
      goto LABEL_32;
    }
    CFStringRef v13 = [(NIServerHomeDeviceSession *)self pauseWithSource:2];
    if (v13)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10041EFA4();
      }
    }
    else
    {
      CFStringRef v13 = [(NIServerHomeDeviceSession *)self configure];
      if (v13)
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10041EF3C();
        }
      }
      else
      {
        uint64_t v14 = [(NIServerHomeDeviceSession *)self run];
        long long v15 = qword_1008ABDE0;
        if (!v14)
        {
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__n128 buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#ses-home,Successfully re-configured and re-ran session to handle UWB state change", buf, 2u);
          }
          goto LABEL_32;
        }
        CFStringRef v13 = (void *)v14;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10041EED4();
        }
      }
    }
    int v16 = [v5 remote];
    [v16 uwbSessionDidFailWithError:v13];

LABEL_32:
    return;
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_10041EEA0();
  }
}

- (optional<rose::RoseServiceRequest>)_prepareServiceRequestWithConfig:(SEL)a3
{
  if (!self->_configuration) {
    sub_10041F00C();
  }
  unsigned __int8 v6 = +[NSUserDefaults standardUserDefaults];
  if ([v6 BOOLForKey:@"HomeDeviceEnableSensorFusion"])
  {
    uint64_t v7 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__n128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-home,sensor fusion is turned on for handoff from defaults write", buf, 2u);
    }
    int v8 = 4;
  }
  else
  {
    int v8 = 2;
  }
  unsigned int v9 = [v6 BOOLForKey:@"HomeDeviceWantsChannelDiversity"];
  char v10 = v9;
  if (v9)
  {
    int v11 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__n128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-home,* Channel diversity turned ON from default writes.", buf, 2u);
    }
  }
  unsigned int v12 = [(NIHomeDeviceConfiguration *)self->_configuration isAnchor];
  CFStringRef v13 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v14 = @"No";
    if (v12) {
      CFStringRef v14 = @"Yes";
    }
    *(_DWORD *)__n128 buf = 138412290;
    *(void *)&uint8_t buf[4] = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#ses-home,Should initiate (is anchor): %@.", buf, 0xCu);
  }
  if (v12)
  {
    long long v15 = [v6 objectForKey:@"NIHomeAnchorForceAntennaDiversity"];

    if (v15) {
      unsigned int v16 = [v6 BOOLForKey:@"NIHomeAnchorForceAntennaDiversity"];
    }
    else {
      unsigned int v16 = 0;
    }
    int64_t v18 = [(NIHomeDeviceConfiguration *)self->_configuration antennaDiversityOverride];
    if (v18 == 1)
    {
      unsigned int v16 = 1;
    }
    else if (v18 == 2)
    {
      unsigned int v16 = 0;
    }
    else if (!v15)
    {
      __int16 v17 = 0;
      goto LABEL_29;
    }
    uint64_t v19 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = "enabled";
      if (!v16) {
        uint64_t v20 = "disabled";
      }
      *(_DWORD *)__n128 buf = 136315138;
      *(void *)&uint8_t buf[4] = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#ses-home,Override antenna diversity to %s", buf, 0xCu);
    }
    __int16 v17 = 1;
  }
  else
  {
    __int16 v17 = 0;
    LOWORD(v16) = 0;
  }
LABEL_29:
  unsigned int v21 = [v6 BOOLForKey:@"NIHomePreferAlternativeAntenna"];
  char v22 = v21;
  if (v21)
  {
    BOOL v23 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__n128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#ses-home,Using alternative antenna for NI Home ranging", buf, 2u);
    }
  }
  unsigned __int8 v24 = [v6 BOOLForKey:@"NIHomeDisableDeviceSpecificSTS"];
  __int16 v46 = 0;
  char v47 = 0;
  int v48 = 68354305;
  char v49 = 0;
  char v50 = 0;
  char v51 = 0;
  char v52 = 0;
  int v53 = 3;
  int v54 = v8;
  int v55 = 3;
  if (v24)
  {
    long long v56 = 0uLL;
  }
  else
  {
    if (a4.var0 == 999)
    {
      *(void *)&long long v25 = -1;
      *((void *)&v25 + 1) = -1;
    }
    else
    {
      long long v25 = 0uLL;
      if (a4.var0 == 2) {
        long long v25 = xmmword_1004BAA90;
      }
    }
    long long v56 = v25;
  }
  __int16 v57 = 0;
  int v58 = 6;
  char v59 = v10;
  char v60 = v22 ^ 1;
  __int16 v61 = v16 | (v17 << 8);
  __int16 v62 = 0;
  char v63 = 1;
  int v64 = 7;
  char v26 = sub_1002F6464();
  uint64_t v27 = *((void *)v26 + 406);
  BOOL v28 = (std::__shared_weak_count *)*((void *)v26 + 407);
  if (v28) {
    atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v27)
  {
    if (sub_1002CE2DC(v27, (char *)&v46, (unsigned __int8 *)&v46 + 1, 0))
    {
      if (v12) {
        sub_10017F920((char *)&v46, (uint64_t)buf);
      }
      else {
        sub_10017FE3C((char *)&v46, (uint64_t)buf);
      }
      NSErrorUserInfoKey v30 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v44 = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#ses-home,[WatchNearbyDevices] sleep will be turned off", v44, 2u);
      }
      CFStringRef v31 = [(NIHomeDeviceConfiguration *)self->_configuration sessionKey];
      BOOL v32 = v31 == 0;

      if (v32)
      {
        __int16 v36 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)double v44 = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "#ses-home,No session key provided. Use default cipher blob.", v44, 2u);
        }
      }
      else
      {
        int v33 = *((_DWORD *)sub_100007D00() + 187);
        if (v33)
        {
          if (v33 == 2)
          {
            double v37 = [(NIHomeDeviceConfiguration *)self->_configuration sessionKey];
            BOOL v38 = [v37 length] == (id)16;

            if (v38)
            {
LABEL_65:
              memset(v44, 0, sizeof(v44));
              int v39 = [(NIHomeDeviceConfiguration *)self->_configuration sessionKey];
              [v39 getBytes:v44 length:16];

              *(_OWORD *)&buf[218] = *(_OWORD *)v44;
              if (!buf[234]) {
                buf[234] = 1;
              }
              goto LABEL_75;
            }
            v40 = (id)qword_1008ABDE0;
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              int v41 = [(NIHomeDeviceConfiguration *)self->_configuration sessionKey];
              sub_10041F06C(v41, (uint64_t)v44);
            }
          }
          else
          {
            if (v33 != 1) {
              goto LABEL_75;
            }
            __int16 v34 = [(NIHomeDeviceConfiguration *)self->_configuration sessionKey];
            BOOL v35 = [v34 length] == (id)16;

            if (v35) {
              goto LABEL_65;
            }
            v40 = (id)qword_1008ABDE0;
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              int v42 = [(NIHomeDeviceConfiguration *)self->_configuration sessionKey];
              sub_10041F06C(v42, (uint64_t)v44);
            }
          }

          goto LABEL_75;
        }
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10041F0B8();
        }
      }
LABEL_75:
      memcpy(retstr, buf, 0x1F8uLL);
      retstr->var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 1;
      if (!v28) {
        goto LABEL_51;
      }
      goto LABEL_50;
    }
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10041F0EC();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_10041F038();
  }
  retstr->var0.__null_state_ = 0;
  retstr->var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
  if (v28) {
LABEL_50:
  }
    sub_10001A970(v28);
LABEL_51:

  return result;
}

- (shared_ptr<WiFiRanging::Session>)_buildWifiSession
{
  int v3 = v2;
  uint64_t v4 = self;
  v21.receiver = v4;
  v21.super_class = (Class)NIServerHomeDeviceSession;
  uint64_t v5 = [(NIServerBaseSession *)&v21 resourcesManager];
  unsigned __int8 v6 = [v5 serverSessionIdentifier];
  uint64_t v7 = [v6 UUIDString];

  id v8 = v7;
  sub_100004950(__p, (char *)[v8 UTF8String]);
  unsigned int v9 = operator new(0x1B0uLL);
  v9[1] = 0;
  v9[2] = 0;
  *unsigned int v9 = off_100859E28;
  uint64_t v10 = (uint64_t)(v9 + 3);
  int v11 = v4;
  v28[0] = off_100859E78;
  v28[1] = v11;
  v28[3] = v28;
  unsigned int v12 = v11;
  v27[0] = off_100859F30;
  v27[1] = v12;
  v27[3] = v27;
  CFStringRef v13 = v12;
  v26[0] = off_100859FB0;
  v26[1] = v13;
  v26[3] = v26;
  clientQueue = v4->_clientQueue;
  ptr = v4->_pbLogger.__ptr_;
  cntrl = (std::__shared_weak_count *)v4->_pbLogger.__cntrl_;
  long long v25 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit(&cntrl->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  char v22 = v4->_wifiCAManager.__ptr_;
  unsigned int v16 = (std::__shared_weak_count *)v4->_wifiCAManager.__cntrl_;
  BOOL v23 = v16;
  if (v16) {
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_10002DFAC(v10, (long long *)__p, (uint64_t)v28, (uint64_t)v27, (uint64_t)v26, clientQueue, (uint64_t *)&ptr, &v22);
  if (v23) {
    sub_10001A970(v23);
  }
  if (v25) {
    sub_10001A970(v25);
  }
  sub_100026B74(v26);
  sub_100026AF0(v27);
  sub_100026A6C(v28);
  uint64_t *v3 = v10;
  v3[1] = (uint64_t)v9;
  if (v20 < 0) {
    operator delete(__p[0]);
  }

  result.__cntrl_ = v18;
  result.__ptr_ = v17;
  return result;
}

- (shared_ptr<rose::objects::GRSession>)_buildRoseSession:(const void *)a3
{
  uint64_t v5 = v3;
  unsigned __int8 v6 = self;
  sub_100004950(__p, (char *)[(NSString *)v6->_containerUniqueIdentifier UTF8String]);
  uint64_t v7 = (std::__shared_weak_count *)operator new(0x5D8uLL);
  v7->__shared_owners_ = 0;
  v7->__shared_weak_owners_ = 0;
  v7->__vftable = (std::__shared_weak_count_vtbl *)off_1008587B0;
  uint64_t v8 = (uint64_t)&v7[1];
  unsigned int v9 = v6;
  *(void *)__n128 buf = off_10085A030;
  double v37 = v9;
  BOOL v38 = buf;
  uint64_t v10 = v9;
  v35[0] = off_10085A0B0;
  v35[1] = v10;
  v35[3] = v35;
  int v11 = v10;
  v34[0] = off_10085A130;
  v34[1] = v11;
  v34[3] = v34;
  unsigned int v12 = v11;
  v33[0] = off_10085A1B0;
  v33[1] = v12;
  v33[3] = v33;
  v32[3] = 0;
  CFStringRef v13 = v12;
  v31[0] = off_10085A268;
  v31[1] = v13;
  v31[3] = v31;
  v30[3] = 0;
  v29[3] = 0;
  CFStringRef v14 = v13;
  v28[0] = off_10085A320;
  v28[1] = v14;
  v28[3] = v28;
  ptr = v6->_pbLogger.__ptr_;
  cntrl = (std::__shared_weak_count *)v6->_pbLogger.__cntrl_;
  uint64_t v27 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit(&cntrl->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_1002D7C48(v8, (long long *)__p, (void *)a3, (uint64_t)buf, (uint64_t)v35, (uint64_t)v34, (uint64_t)v33, (uint64_t)v32, (uint64_t)v31, (uint64_t)v30, (uint64_t)v29, (uint64_t)v28, &ptr);
  v7[1].__vftable = (std::__shared_weak_count_vtbl *)off_100858B20;
  v7[1].__shared_owners_ = (uint64_t)off_100858BE8;
  if (v27) {
    sub_10001A970(v27);
  }
  sub_1001E1150(v28);
  sub_1001D2B78(v29);
  sub_1001D2BFC(v30);
  sub_1001E11D4(v31);
  sub_1001E1258(v32);
  sub_1001D2C80(v33);
  sub_1001E12DC(v34);
  sub_1001E1258(v35);
  sub_1001D2D04(buf);
  char v22 = v7 + 1;
  BOOL v23 = v7;
  sub_10001ABCC((uint64_t)&v22, &v7[1].__shared_weak_owners_, v8);
  unsigned int v16 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__n128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#ses-home,Registering for UWB service.", buf, 2u);
  }
  int v17 = sub_1002D85F4((uint64_t)v22);
  if (v17)
  {
    int64_t v18 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      sub_1002DE064(v17, buf);
      sub_10041F120();
    }

    void *v5 = 0;
    v5[1] = 0;
  }
  else
  {
    uint64_t v19 = v23;
    void *v5 = v22;
    v5[1] = v19;
    if (!v19) {
      goto LABEL_15;
    }
    atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v23) {
    sub_10001A970(v23);
  }
LABEL_15:
  if (v25 < 0) {
    operator delete(__p[0]);
  }

  result.__cntrl_ = v21;
  result.__ptr_ = v20;
  return result;
}

- (void)_stopWiFiSessionsWithReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-home,Stop WiFi sessions with reason: [%@]", (uint8_t *)&v8, 0xCu);
  }
  p_wifiSessions = &self->_wifiSessions;
  if (p_wifiSessions->__table_.__p2_.__value_)
  {
    for (i = &p_wifiSessions->__table_.__p1_; ; sub_10002E098((const std::string *)i[3].__value_.__next_))
    {
      i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<WiFiRanging::Session>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<WiFiRanging::Session>>, void *>>> *)i->__value_.__next_;
      if (!i) {
        break;
      }
    }
    sub_10020E4E4((uint64_t)p_wifiSessions);
  }
}

- (id)_disableAllServicesAndSendHangupSignal:(BOOL)a3
{
  BOOL v3 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NIServerHomeDeviceSession;
  uint64_t v5 = [(NIServerBaseSession *)&v21 disableAllServices];
  sub_1001A4EE8((uint64_t)&self->_cachedRegionUpdateEvent);
  [(CMMotionManager *)self->_motionManager stopMagnetometerUpdates];
  if (self->_filteredMFStrength.__engaged_) {
    self->_filteredMFStrength.__engaged_ = 0;
  }
  *(void *)&self->_anon_1c8[8] = *(void *)self->_anon_1c8;
  *(void *)&self->_anon_1c8[32] = *(void *)&self->_anon_1c8[24];
  *(void *)&self->_anon_1f8[8] = *(void *)self->_anon_1f8;
  *(void *)&self->_anon_1f8[32] = *(void *)&self->_anon_1f8[24];
  unsigned __int8 v6 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__n128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ses-home,streaming raw magnetometer data stopped", buf, 2u);
  }
  [(NINearbyUpdatesEngine *)self->_updatesEngine invalidate];
  updatesEngine = self->_updatesEngine;
  self->_updatesEngine = 0;

  p_initiatorSession = (uint64_t *)&self->_initiatorSession;
  if (self->_initiatorSession.__ptr_)
  {
    if (v3)
    {
      cntrl = self->_initiatorSession.__cntrl_;
      ptr = self->_initiatorSession.__ptr_;
      char v20 = (std::__shared_weak_count *)cntrl;
      if (cntrl) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
      }
      [(NIServerHomeDeviceSession *)self _sendHangupSignalForSession:&ptr];
      if (v20) {
        sub_10001A970(v20);
      }
    }
    sub_1002D8288(*p_initiatorSession);
    uint64_t v10 = (std::__shared_weak_count *)self->_initiatorSession.__cntrl_;
    uint64_t *p_initiatorSession = 0;
    self->_initiatorSession.__cntrl_ = 0;
    if (v10) {
      sub_10001A970(v10);
    }
  }
  if (self->_responderSessions.__table_.__p2_.__value_)
  {
    int v11 = qword_1008ABDE0;
    if (v3)
    {
      unsigned int v12 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v13 = self->_responderSessions.__table_.__p2_.__value_
            * (void)[(NIServerHomeDeviceSession *)self nominalCycleRate];
        *(_DWORD *)__n128 buf = 134217984;
        unint64_t v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#ses-home,Cleaning responder sessions. sendHangupSignal = YES. This will take (%llu ms).", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__n128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-home,Cleaning responder sessions.", buf, 2u);
    }
    for (i = &self->_responderSessions.__table_.__p1_; ; sub_1002D8288((uint64_t)i[3].__value_.__next_))
    {
      i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, UWBResponderInformation>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, UWBResponderInformation>, void *>>> *)i->__value_.__next_;
      if (!i) {
        break;
      }
      if (v3)
      {
        next = (std::__shared_weak_count *)i[4].__value_.__next_;
        int v17 = i[3].__value_.__next_;
        int64_t v18 = next;
        if (next) {
          atomic_fetch_add_explicit(&next->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        [(NIServerHomeDeviceSession *)self _sendHangupSignalForSession:&v17];
        if (v18) {
          sub_10001A970(v18);
        }
      }
    }
    sub_10020E4E4((uint64_t)&self->_responderSessions);
  }
  [(NIServerHomeDeviceSession *)self _stopWiFiSessionsWithReason:@"_disableAllServices", v17];

  return v5;
}

- (void)_peerHungUp:(unint64_t)a3
{
  uint64_t v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__n128 buf = 134283521;
    unint64_t v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-home,#hangup from address 0x%{private}llx.", buf, 0xCu);
  }
  v12.receiver = self;
  v12.super_class = (Class)NIServerHomeDeviceSession;
  unsigned __int8 v6 = [(NIServerBaseSession *)&v12 discoveryTokenFromIdentifier:a3];
  if (v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)NIServerHomeDeviceSession;
    uint64_t v7 = [(NIServerBaseSession *)&v11 resourcesManager];
    int v8 = [v7 lifecycleSupervisor];
    unsigned __int8 v9 = [v8 isTrackingPeer:v6];

    if (v9)
    {
      uint64_t v10 = [v7 lifecycleSupervisor];
      [v10 peerHangupReceived:v6];

      [(NIServerHomeDeviceSession *)self _removePeerObject:v6 uwbIdentifier:a3 withReason:1];
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_10041F17C();
  }
}

- (void)_sendHangupSignalForSession:(shared_ptr<rose::objects::GRSession>)a3
{
  if (*(void *)a3.__ptr_)
  {
    ptr = (uint64_t *)a3.__ptr_;
    uint64_t v5 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      if ((*(_DWORD *)(*ptr + 680) & 0xFF0000) != 0) {
        int v6 = (unsigned __int16)*(_DWORD *)(*ptr + 680);
      }
      else {
        int v6 = 0xFFFF;
      }
      *(_DWORD *)__n128 buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-home,#hangup Sending hangup signal for session with ticket ID: %d", buf, 8u);
    }
    LOBYTE(__ns.__rep_) = 0;
    sub_1001B0664(buf, 0x10uLL, &__ns);
    uint64_t v7 = *(void **)buf;
    **(_WORD **)__n128 buf = 258;
    *(void *)((char *)v7 + 2) = 0;
    v7[1] = 0;
    sub_1002DBB0C(*ptr, (uint64_t *)buf);
    v8.__rep_ = (int64_t)[(NIServerHomeDeviceSession *)self nominalCycleRate];
    if (v8.__rep_ >= 1)
    {
      std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v9 = 1000000 * v8.__rep_;
      if ((unint64_t)v8.__rep_ >= 0x8637BD057A0) {
        std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v9 = 0x7FFFFFFFFFFFFFFFLL;
      }
      __ns.__rep_ = v9;
      std::this_thread::sleep_for (&__ns);
    }
    if (*(void *)buf)
    {
      objc_super v12 = *(void **)buf;
      operator delete(*(void **)buf);
    }
  }
}

- (id)_addPeers:(id)a3
{
  id v26 = a3;
  v32.receiver = self;
  v32.super_class = (Class)NIServerHomeDeviceSession;
  id v4 = [(NIServerBaseSession *)&v32 resourcesManager];
  uint64_t v27 = [v4 btResource];

  if ([(NIHomeDeviceConfiguration *)self->_configuration isAnchor]) {
    goto LABEL_8;
  }
  uint64_t v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__n128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-home,Not an anchor session, verifying responder limit hasn't been reached.", buf, 2u);
  }
  if ((uint64_t)[v27 currentPeerCount] < 4)
  {
LABEL_8:
    char v25 = +[NSUserDefaults standardUserDefaults];
    duration<long long, std::ratio<1, 1000>> v8 = [v25 objectForKey:@"NIHomeDisableAllowListPolicy"];
    BOOL v9 = v8 == 0;

    if (v9) {
      unsigned __int8 v10 = 0;
    }
    else {
      unsigned __int8 v10 = [v25 BOOLForKey:@"NIHomeDisableAllowListPolicy"];
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = v26;
    id v12 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v12)
    {
      uint64_t v14 = *(void *)v29;
      *(void *)&long long v13 = 67109378;
      long long v24 = v13;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          unsigned int v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          unsigned int v17 = -[NIServerHomeDeviceSession _homeAnchorVariantFromDiscoveryToken:](self, "_homeAnchorVariantFromDiscoveryToken:", v16, v24);
          int64_t v18 = qword_1008ABDE0;
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__n128 buf = 67109120;
            unsigned int v34 = v17;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#ses-home,#allow-list anchor variant from discovery token: %u", buf, 8u);
          }
          if (v17 < 0x3E7) {
            char v19 = 1;
          }
          else {
            char v19 = v10;
          }
          if (v19)
          {
            char v20 = [v16 rawToken];
            uint64_t v7 = [v27 addPeerDiscoveryToken:v20];

            if (v7) {
              goto LABEL_30;
            }
          }
          else
          {
            objc_super v21 = (id)qword_1008ABDE0;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              char v22 = [v16 descriptionInternal];
              *(_DWORD *)__n128 buf = v24;
              unsigned int v34 = v17;
              __int16 v35 = 2112;
              __int16 v36 = v22;
              _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "#ses-home,#allow-list peer device anchor variant (%u) not supported. Will not attempt to range with %@", buf, 0x12u);
            }
          }
        }
        id v12 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v12);
    }
    uint64_t v7 = 0;
LABEL_30:
  }
  else
  {
    int v6 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041F1E4(v6);
    }
    uint64_t v7 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5885 userInfo:0];
  }

  return v7;
}

- (void)_roseSession:(shared_ptr<rose:(int)a4 :objects::RoseBaseSession>)a3 invalidatedWithReason:
{
  int var1 = (int)a3.var1;
  int v6 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_1002DE0A8(var1, v10);
    sub_10041F264();
  }

  [(NIServerHomeDeviceSession *)self invalidate];
  v9.receiver = self;
  v9.super_class = (Class)NIServerHomeDeviceSession;
  uint64_t v7 = [(NIServerBaseSession *)&v9 invalidationHandler];
  duration<long long, std::ratio<1, 1000>> v8 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:0];
  ((void (**)(void, void *))v7)[2](v7, v8);
}

- (BOOL)_shouldRespondToDevice:(id)a3
{
  return self->_responderSessions.__table_.__p2_.__value_ < 5;
}

- (id)_triggerInitiatorRanging
{
  ptr = self->_initiatorSession.__ptr_;
  if (!ptr) {
    sub_10041F2C0();
  }
  LOBYTE(v5) = 0;
  char v6 = 0;
  uint64_t v7 = 0;
  char v8 = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v12 = 0;
  if (sub_1002DB434((uint64_t)ptr, &v5))
  {
    BOOL v3 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:0];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)_triggerResponderRangingForSession:(shared_ptr<rose:(id)a4 :objects::GRSession>)a3 initiatorDevice:
{
  ptr = (uint64_t *)a3.__ptr_;
  char v6 = a3.__cntrl_;
  uint64_t v7 = v6;
  if (!*ptr)
  {
    long long v13 = "session";
    int v14 = 2704;
    goto LABEL_13;
  }
  if (self->_currentSessionRole != 1)
  {
    long long v13 = "_currentSessionRole == Role::Responder";
    int v14 = 2705;
LABEL_13:
    __assert_rtn("-[NIServerHomeDeviceSession _triggerResponderRangingForSession:initiatorDevice:]", "NIServerHomeDeviceSession.mm", v14, v13);
  }
  id v8 = [(__shared_weak_count *)v6 btAdvertisingAddress];
  int v19 = (int)v8;
  __int16 v20 = WORD2(v8);
  LODWORD(v16) = 2;
  BYTE4(v16) = 0;
  __int16 v17 = 0;
  char v18 = 0;
  char v21 = 1;
  char v22 = 1;
  uint64_t v23 = 0;
  char v24 = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  int v28 = 0;
  int v9 = sub_1002DB434(*ptr, &v16);
  if (v9)
  {
    long long v10 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      sub_1002DE064(v9, v15);
      sub_10041F2EC();
    }

    long long v11 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:0];
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

- (void)_notifyPeerRemoval:(id)a3 withReason:(unint64_t)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v15.receiver = self;
  v15.super_class = (Class)NIServerHomeDeviceSession;
  uint64_t v7 = [(NIServerBaseSession *)&v15 resourcesManager];
  id v8 = [v7 remote];
  id v22 = v6;
  int v9 = +[NSArray arrayWithObjects:&v22 count:1];
  [v8 didRemoveNearbyObjects:v9 withReason:a4];

  double v10 = sub_100006C38();
  long long v11 = [v6 discoveryToken];
  sub_100237818((uint64_t)&self->_handoffCAManager, (unint64_t)[v11 hash], v10);

  if (a4 >= 3) {
    CFStringRef v12 = &stru_100869B68;
  }
  else {
    CFStringRef v12 = *(&off_10085A4A8 + a4);
  }
  long long v13 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    *(_DWORD *)__n128 buf = 138412802;
    id v17 = v6;
    __int16 v18 = 2112;
    CFStringRef v19 = v12;
    __int16 v20 = 2112;
    char v21 = containerUniqueIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#ses-home,_notifyPeerRemoval: %@ with reason: %@ for session identifier: %@", buf, 0x20u);
  }
}

- (void)_removePeerObject:(id)a3 uwbIdentifier:(unint64_t)a4 withReason:(unint64_t)a5
{
  id v8 = a3;
  unint64_t v34 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v33.receiver = self;
  v33.super_class = (Class)NIServerHomeDeviceSession;
  int v9 = [(NIServerBaseSession *)&v33 resourcesManager];
  if (self->_currentSessionRole != 1)
  {
LABEL_18:
    char v17 = 1;
    goto LABEL_19;
  }
  double v10 = sub_100056B3C(&self->_responderSessions.__table_.__bucket_list_.__ptr_.__value_, &v34);
  long long v11 = v10;
  if (v10)
  {
    if (v10[3])
    {
      CFStringRef v12 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        if ((*(_DWORD *)(v11[3] + 680) & 0xFF0000) != 0) {
          int v13 = (unsigned __int16)*(_DWORD *)(v11[3] + 680);
        }
        else {
          int v13 = 0xFFFF;
        }
        *(_DWORD *)__n128 buf = 67109376;
        LODWORD(v36[0]) = v13;
        WORD2(v36[0]) = 1024;
        *(_DWORD *)((char *)v36 + 6) = a5 != 1;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#ses-home,Invalidating session with ticket ID: %d. Send hangup signal: %d", buf, 0xEu);
      }
      if (a5 != 1)
      {
        int v14 = (std::__shared_weak_count *)v11[4];
        uint64_t v31 = v11[3];
        objc_super v32 = v14;
        if (v14) {
          atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        [(NIServerHomeDeviceSession *)self _sendHangupSignalForSession:&v31];
        if (v32) {
          sub_10001A970(v32);
        }
      }
      sub_1002D8288(v11[3]);
      objc_super v15 = (std::__shared_weak_count *)v11[4];
      v11[3] = 0;
      v11[4] = 0;
      if (v15) {
        sub_10001A970(v15);
      }
    }
    sub_10020BB70(&self->_responderSessions.__table_.__bucket_list_.__ptr_.__value_, v11);
    long long v16 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__n128 buf = 134217984;
      v36[0] = v34;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#ses-home,removing 0x%llx from tracked devices", buf, 0xCu);
    }
    goto LABEL_18;
  }
  char v17 = 0;
LABEL_19:
  __int16 v18 = sub_100056B3C(&self->_wifiSessions.__table_.__bucket_list_.__ptr_.__value_, &v34);
  CFStringRef v19 = v18;
  if (v18)
  {
    __int16 v20 = (const std::string *)v18[3];
    if (v20) {
      sub_10002E098(v20);
    }
    sub_10020BB70(&self->_wifiSessions.__table_.__bucket_list_.__ptr_.__value_, v19);
  }
  else if ((v17 & 1) == 0)
  {
    char v21 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__n128 buf = 138412290;
      v36[0] = v8;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#ses-home,Did not find a UWB or WiFi ToF session for token: %@", buf, 0xCu);
    }
  }
  [(NINearbyUpdatesEngine *)self->_updatesEngine clearStateForToken:v8];
  id v22 = [(NIServerHomeDeviceSession *)self objectFromIdentifier:v34];
  if (v22)
  {
    [(NIServerHomeDeviceSession *)self _notifyPeerRemoval:v22 withReason:a5];
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_10041F3B0();
  }
  uint64_t v23 = [v9 btResource];
  char v24 = [v8 rawToken];
  long long v25 = [v23 removePeerDiscoveryToken:v24];

  if (v25)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041F348();
    }
  }
  else
  {
    long long v26 = [v9 btResource];
    long long v27 = [v26 deviceCache];
    int v28 = [v8 rawToken];
    unsigned __int8 v29 = [v27 uncacheDeviceByTokenData:v28];

    if ((v29 & 1) == 0)
    {
      long long v30 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__n128 buf = 138412290;
        v36[0] = v8;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#ses-home,Peer discovery token wasn't cached, so nothing to uncache. Peer likely hadn't been discovered yet. Token: %@", buf, 0xCu);
      }
    }
  }
}

- (int64_t)_roseMotionStateToNIMotionActivityState:(int)a3
{
  if (a3 == 1) {
    return 2;
  }
  else {
    return a3 == 2;
  }
}

- (void)_handleMotionStateChange:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  long long v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sub_1001F00B4(v3, __p);
    id v6 = v18 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)__n128 buf = 136315138;
    __int16 v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-home,received new motion state %s", buf, 0xCu);
    if (v18 < 0) {
      operator delete(__p[0]);
    }
  }

  int64_t v7 = [(NIServerHomeDeviceSession *)self _roseMotionStateToNIMotionActivityState:v3];
  if (self->_motionState != v7)
  {
    v16.receiver = self;
    v16.super_class = (Class)NIServerHomeDeviceSession;
    id v8 = [(NIServerBaseSession *)&v16 resourcesManager];
    self->_motionState = v7;
    int v9 = [v8 remote];
    [v9 didUpdateMotionState:v7];

    if (v7 == 2 && self->_shouldDeliverUpdates)
    {
      p_cachedRegionUpdateEvent = &self->_cachedRegionUpdateEvent;
      if (self->_cachedRegionUpdateEvent.__engaged_)
      {
        long long v11 = self->_cachedRegionUpdateEvent.var0.__val_._object;
        if (!p_cachedRegionUpdateEvent->__engaged_) {
          sub_10000AE44();
        }
        CFStringRef v12 = p_cachedRegionUpdateEvent->var0.__val_._currentRegion;
        if (!p_cachedRegionUpdateEvent->__engaged_) {
          sub_10000AE44();
        }
        int v13 = p_cachedRegionUpdateEvent->var0.__val_._previousRegion;
        int v14 = [v8 remote];
        [v14 object:v11 didUpdateRegion:v12 previousRegion:v13];

        objc_super v15 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(__p[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#ses-home,delivered cached region update event", (uint8_t *)__p, 2u);
        }
        sub_1001A4EE8((uint64_t)p_cachedRegionUpdateEvent);
      }
    }
  }
}

- (void)_handleScreenStateChange:(int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  double v5 = sub_100006C38();
  v8.receiver = self;
  v8.super_class = (Class)NIServerHomeDeviceSession;
  id v6 = [(NIServerBaseSession *)&v8 resourcesManager];
  if (a3 == 2)
  {
    atomic_store(0, (unsigned __int8 *)&self->_wifiRangingAllowedLockscreen);
    [(NIServerHomeDeviceSession *)self _stopWiFiSessionsWithReason:@"Not on lock screen."];
    int64_t v7 = [v6 btResource];
    [v7 clearWifiRangingActiveAdvertisement];
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    sub_1002D78C8((uint64_t)self->_wifiCAManager.__ptr_, v5);
    atomic_store(1u, (unsigned __int8 *)&self->_wifiRangingAllowedLockscreen);
    int64_t v7 = [v6 btResource];
    [v7 setWifiRangingActiveAdvertisement];
LABEL_5:
  }
}

- (void)_handleBackoffManagerRecommendation:(int)a3 machContinuousTimeSec:(double)a4 screenState:(int)a5
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  int v9 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    sub_10028EBD8(a3, __p);
    double v10 = v19 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)__n128 buf = 136315394;
    char v21 = v10;
    __int16 v22 = 2048;
    double v23 = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ses-home,#backoff received backoff-resume manager decision: %s, machContTimeSeconds %f", buf, 0x16u);
    if (v19 < 0) {
      operator delete(__p[0]);
    }
  }

  v17.receiver = self;
  v17.super_class = (Class)NIServerHomeDeviceSession;
  long long v11 = [(NIServerBaseSession *)&v17 resourcesManager];
  if (a3)
  {
    if (a3 == 1)
    {
      CFStringRef v12 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(__p[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#ses-home,#backoff notifying interruption ended.", (uint8_t *)__p, 2u);
      }
      [v11 interruptionReasonEnded:3 monotonicTimeSeconds:a4];
      unsigned int v13 = ![(NIServerHomeDeviceSession *)self _isWifiRangingAllowed];
      if (a5 != 1) {
        LOBYTE(v13) = 1;
      }
      if ((v13 & 1) == 0)
      {
        int v14 = [v11 btResource];
        [v14 setWifiRangingActiveAdvertisement];
      }
    }
  }
  else
  {
    objc_super v15 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#ses-home,#backoff notifying interruption started.", (uint8_t *)__p, 2u);
    }
    objc_super v16 = [v11 btResource];
    [v16 clearWifiRangingActiveAdvertisement];

    [v11 interruptSessionWithReason:3 monotonicTimeSeconds:a4];
  }
}

- (void)_handleWifiRangingAvailableUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__n128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-home,wifi ranging availability update", buf, 2u);
  }
  atomic_store(v3, (unsigned __int8 *)&self->_wifiServiceAllowsRanging);
  id v6 = qword_1008ABDE0;
  BOOL v7 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ses-home,wifi is now available, so wifi ranging is resuming", v9, 2u);
    }
    [(NIServerHomeDeviceSession *)self _resumeWifiRanging];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)objc_super v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ses-home,wifi is no longer available, so pausing wifi ranging", v8, 2u);
    }
    [(NIServerHomeDeviceSession *)self _pauseWifiRanging];
  }
}

- (BOOL)_biasCorrectionRequirementFromModelString:(id)a3
{
  return [a3 hasPrefix:@"AudioAccessory6,1"];
}

- (int64_t)_regionCategoryFromModelString:(id)a3
{
  if ([a3 hasPrefix:@"AudioAccessory6,1"]) {
    return 10;
  }
  else {
    return 0;
  }
}

- (int)_magneticFieldStrengthCheckOptionFromModelString:(id)a3
{
  if ([a3 hasPrefix:@"AudioAccessory6,1"]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)_calculateMagneticFieldBias
{
  anon_1c8 = self->_anon_1c8;
  if (sub_100209660(self->_anon_1c8))
  {
    anon_1f8 = self->_anon_1f8;
    if (sub_100209660(self->_anon_1f8))
    {
      uint64_t v5 = *((void *)anon_1c8 + 4);
      if (v5 == *((void *)anon_1c8 + 3)) {
        sub_10041F3E4();
      }
      uint64_t v6 = *(void *)&self->_anon_1f8[32];
      if (v6 == *(void *)&self->_anon_1f8[24]) {
        sub_10041F410();
      }
      double v7 = *(double *)(v5 - 8);
      double v8 = *(double *)(v6 - 8);
      if (vabdd_f64(v7, v8) < 0.025)
      {
        int v9 = *(float32x4_t **)anon_1c8;
        float32x4_t v10 = 0uLL;
        while (v9 != *((float32x4_t **)anon_1c8 + 1))
        {
          float32x4_t v11 = *v9++;
          float32x4_t v10 = vaddq_f32(v10, v11);
        }
        float32x4_t v22 = v10;
        *(float *)v12.i32 = (float)(unint64_t)sub_100209660(anon_1c8);
        float32x4_t v23 = vdivq_f32(v22, (float32x4_t)vdupq_lane_s32(v12, 0));
        unsigned int v13 = *(float32x4_t **)anon_1f8;
        int v14 = *(float32x4_t **)&self->_anon_1f8[8];
        float32x4_t v15 = 0uLL;
        if (*(float32x4_t **)anon_1f8 != v14)
        {
          do
          {
            float32x4_t v16 = *v13++;
            float32x4_t v15 = vaddq_f32(v15, v16);
          }
          while (v13 != v14);
        }
        float32x4_t v21 = v15;
        *(float *)v17.i32 = (float)(unint64_t)sub_100209660(self->_anon_1f8);
        float32x4_t v18 = vsubq_f32(v23, vdivq_f32(v21, (float32x4_t)vdupq_lane_s32(v17, 0)));
        int v19 = self->_anon_1a0[24];
        if (v8 >= v7) {
          double v20 = v8;
        }
        else {
          double v20 = v7;
        }
        *(float32x4_t *)&self->_estMagneticFieldBias.var0.__null_state_ = v18;
        *(double *)&self->_anon_1a0[8] = v20;
        if (!v19) {
          self->_anon_1a0[24] = 1;
        }
      }
    }
  }
}

- (int)_intentPredictorConfigFromModelString:(id)a3
{
  if (sub_100203CA8(a3) == 201) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)_validateDiscoveryTokenDict:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:&off_100878808];
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v6 = [v4 objectForKeyedSubscript:&off_100878820];
      if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        BOOL v7 = 1;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10041F4D0();
        }
        BOOL v7 = 0;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10041F49C();
      }
      BOOL v7 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041F468();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (unsigned)_flagsFromDiscoveryToken:(id)a3
{
  id v4 = sub_1002B7DA4(a3);
  if ([(NIServerHomeDeviceSession *)self _validateDiscoveryTokenDict:v4])
  {
    uint64_t v5 = [v4 objectForKeyedSubscript:&off_100878838];
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      unsigned int v6 = [v5 unsignedIntValue];
    }
    else {
      unsigned int v6 = 0;
    }
  }
  else
  {
    unsigned int v6 = 0;
  }

  return v6;
}

- (BOOL)_biasCorrectionRequirementFromDiscoveryToken:(id)a3
{
  return ([(NIServerHomeDeviceSession *)self _flagsFromDiscoveryToken:a3] >> 1) & 1;
}

- (int)_magneticFieldStrengthCheckOptionFromDiscoveryToken:(id)a3
{
  if ([(NIServerHomeDeviceSession *)self _homeAnchorVariantFromDiscoveryToken:a3] == 2)return 2; {
  else
  }
    return 1;
}

- (int64_t)_regionCategoryFromDiscoveryToken:(id)a3
{
  if (([(NIServerHomeDeviceSession *)self _flagsFromDiscoveryToken:a3] & 4) != 0) {
    return 10;
  }
  else {
    return 0;
  }
}

- (int64_t)_regionCategoryFromBluetoothDevice:(id)a3
{
  return 0;
}

- (unsigned)_homeAnchorVariantFromDiscoveryToken:(id)a3
{
  id v4 = sub_1002B7DA4(a3);
  if ([(NIServerHomeDeviceSession *)self _validateDiscoveryTokenDict:v4])
  {
    uint64_t v5 = [v4 objectForKeyedSubscript:&off_100878850];
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v6 = sub_10039D12C((uint64_t)[v5 unsignedIntValue]);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10041F504();
        }
        unsigned int v6 = 999;
      }
    }
    else
    {
      BOOL v7 = qword_1008ABDE0;
      unsigned int v6 = 0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-home,nil value for HomeAnchorVariant", v9, 2u);
        unsigned int v6 = 0;
      }
    }
  }
  else
  {
    unsigned int v6 = 999;
  }

  return v6;
}

- (int)_intentPredictorConfigFromDiscoveryToken:(id)a3
{
  if ([(NIServerHomeDeviceSession *)self _homeAnchorVariantFromDiscoveryToken:a3] == 2)return 2; {
  else
  }
    return 1;
}

- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4
{
  unsigned int v6 = (NINearbyUpdatesEngine *)a3;
  id v7 = a4;
  if (self->_updatesEngine != v6) {
    __assert_rtn("-[NIServerHomeDeviceSession updatesEngine:didUpdateNearbyObjects:]", "NIServerHomeDeviceSession.mm", 3187, "engine == _updatesEngine");
  }
  clientQueue = self->_clientQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100209BDC;
  void v10[3] = &unk_100846588;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async((dispatch_queue_t)clientQueue, v10);
}

- (void)updatesEngine:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6 regionTransitionSuppressed:(BOOL)a7
{
  BOOL v7 = a7;
  int32x2_t v12 = (NINearbyUpdatesEngine *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (self->_updatesEngine != v12) {
    __assert_rtn("-[NIServerHomeDeviceSession updatesEngine:object:didUpdateRegion:previousRegion:regionTransitionSuppressed:]", "NIServerHomeDeviceSession.mm", 3242, "engine == _updatesEngine");
  }
  float32x4_t v16 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__n128 buf = 138412802;
    id v27 = v14;
    __int16 v28 = 2112;
    id v29 = v15;
    __int16 v30 = 1024;
    BOOL v31 = v7;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#ses-home,#regions, updatesEngine didUpdateRegion: %@, previousRegion: %@, suppressed: %d", buf, 0x1Cu);
  }
  clientQueue = self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10020A050;
  block[3] = &unk_100859BF8;
  void block[4] = self;
  id v22 = v14;
  id v23 = v13;
  id v24 = v15;
  BOOL v25 = v7;
  id v18 = v15;
  id v19 = v13;
  id v20 = v14;
  dispatch_async((dispatch_queue_t)clientQueue, block);
}

- (id)objectFromIdentifier:(unint64_t)a3
{
  unint64_t v12 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v11.receiver = self;
  v11.super_class = (Class)NIServerHomeDeviceSession;
  uint64_t v5 = [(NIServerBaseSession *)&v11 objectFromIdentifier:a3];
  unsigned int v6 = v5;
  if (v5)
  {
    id v7 = v5;
LABEL_5:
    id v9 = v7;
    goto LABEL_6;
  }
  double v8 = sub_100056B3C(&self->_btIdentifierHashToObjectMap.__table_.__bucket_list_.__ptr_.__value_, &v12);
  if (v8)
  {
    id v7 = (id)v8[3];
    goto LABEL_5;
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_10041F538();
  }
  id v9 = 0;
LABEL_6:

  return v9;
}

- (float)prewarmStateRegionThreshold
{
  return 0.0;
}

- (void)peerInactivityPeriodExceeded:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v8.receiver = self;
  v8.super_class = (Class)NIServerHomeDeviceSession;
  id v5 = [(NIServerBaseSession *)&v8 identifierFromDiscoveryToken:v4];
  if (v6)
  {
    [(NIServerHomeDeviceSession *)self _removePeerObject:v4 uwbIdentifier:v5 withReason:0];
  }
  else
  {
    id v7 = [[NINearbyObject alloc] initWithToken:v4];
    [(NIServerHomeDeviceSession *)self _notifyPeerRemoval:v7 withReason:0];
  }
}

- (void)didUpdateMinimumPreferredUpdateRate:(int64_t)a3
{
  clientQueue = self->_clientQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10020A5B4;
  v4[3] = &unk_100855ED8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async((dispatch_queue_t)clientQueue, v4);
}

- (void)adjustResponderThrottleRateIfNeeded:(id)a3 object:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = v7;
  if (self->_currentSessionRole == 1)
  {
    id v9 = [v7 discoveryToken];
    v26.receiver = self;
    v26.super_class = (Class)NIServerHomeDeviceSession;
    id v27 = [(NIServerBaseSession *)&v26 identifierFromDiscoveryToken:v9];
    uint64_t v28 = v10;

    if ((_BYTE)v28)
    {
      objc_super v11 = sub_100056B3C(&self->_responderSessions.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v27);
      if (v11)
      {
        uint64_t v13 = v11[3];
        unint64_t v12 = (std::__shared_weak_count *)v11[4];
        if (v12) {
          atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        if (v13)
        {
          id v14 = +[NSUserDefaults standardUserDefaults];
          id v15 = [v14 objectForKey:@"NIHomeForceThrottleRate"];

          if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            [v15 doubleValue];
            float v17 = v16;
            id v18 = qword_1008ABDE0;
            if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__n128 buf = 134218242;
              double v31 = v17;
              __int16 v32 = 2112;
              *(void *)objc_super v33 = v8;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#ses-home,#throttle adjustResponderThrottleRateIfNeeded. Force throttle rate: %0.2f. Object: %@", buf, 0x16u);
            }
          }
          else
          {
            if (v6) {
              id minimumPreferredUpdateRate = [v6 preferredUpdateRate];
            }
            else {
              id minimumPreferredUpdateRate = 0;
            }
            if (+[NIInternalUtils nearbyObjectUpdateRate:self->_minimumPreferredUpdateRate isGreaterThan:minimumPreferredUpdateRate])
            {
              id minimumPreferredUpdateRate = self->_minimumPreferredUpdateRate;
            }
            if (minimumPreferredUpdateRate)
            {
              if (minimumPreferredUpdateRate == (id)1)
              {
                float v17 = 0.38;
              }
              else
              {
                float v17 = 0.0;
                if (minimumPreferredUpdateRate == (id)3)
                {
                  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
                    sub_10041F75C();
                  }
                  id v20 = qword_1008ABDE0;
                  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)__n128 buf = 136315650;
                    double v31 = COERCE_DOUBLE("/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerHomeDeviceSession.mm");
                    __int16 v32 = 1024;
                    *(_DWORD *)objc_super v33 = 3493;
                    *(_WORD *)&void v33[4] = 2080;
                    *(void *)&v33[6] = "-[NIServerHomeDeviceSession adjustResponderThrottleRateIfNeeded:object:]";
                    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "#ses-home,%s:%d: assertion failure in %s", buf, 0x1Cu);
                  }
                  abort();
                }
              }
            }
            else
            {
              float v17 = 0.75;
            }
            float32x4_t v21 = (id)qword_1008ABDE0;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              id v22 = +[NIInternalUtils NINearbyObjectUpdateRateToString:minimumPreferredUpdateRate];
              *(_DWORD *)__n128 buf = 136315906;
              double v31 = *(double *)&v22;
              __int16 v32 = 2048;
              *(double *)objc_super v33 = v17;
              *(_WORD *)&v33[8] = 2112;
              *(void *)&v33[10] = v6;
              __int16 v34 = 2112;
              __int16 v35 = v8;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#ses-home,#throttle adjustResponderThrottleRateIfNeeded. Update rate: %s. Throttle rate: %0.2f. Region: %@. Object: %@", buf, 0x2Au);
            }
          }
          int v23 = sub_1002DB5FC(v13, v17);
          id v24 = qword_1008ABDE0;
          if (v23)
          {
            BOOL v25 = (id)qword_1008ABDE0;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              sub_1002DE064(v23, buf);
              sub_10041F6D8((char *)buf, v29, v25, v17);
            }
          }
          else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__n128 buf = 134217984;
            double v31 = v17;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#ses-home,#throttle success scheduling throttling request for rate %0.2f", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
        {
          sub_10041F670();
        }
        if (v12) {
          sub_10001A970(v12);
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
      {
        sub_10041F608();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
    {
      sub_10041F5A0();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_10041F7D0();
  }
}

- (void)_updateAnalyticsAboutRangingRateForDevice:(id)a3 responseSkipRatio:(float)a4 cycleRate:(duration<long)long
{
  id v10 = a3;
  id v8 = [v10 hash];
  double v9 = sub_100006C38();
  sub_100237288((uint64_t)&self->_handoffCAManager, (unint64_t)v8, (int)((a4 * 19.0 + 1.0) * (double)a5.__rep_), v9);
}

- (NIHomeDeviceConfiguration)configuration
{
  return (NIHomeDeviceConfiguration *)objc_getProperty(self, a2, 720, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_leechingAidingAdvertiser, 0);
  sub_1001A6A10((uint64_t)&self->_btIdentifierHashToObjectMap);
  sub_1001A5C38((uint64_t)&self->_cachedRegionUpdateEvent);
  anon_1f8 = self->_anon_1f8;
  id v4 = *(void **)&self->_anon_1f8[24];
  if (v4)
  {
    *(void *)&self->_anon_1f8[32] = v4;
    operator delete(v4);
  }
  id v5 = *(void **)anon_1f8;
  if (*(void *)anon_1f8)
  {
    *(void *)&self->_anon_1f8[8] = v5;
    operator delete(v5);
  }
  anon_1c8 = self->_anon_1c8;
  id v7 = *(void **)&self->_anon_1c8[24];
  if (v7)
  {
    *(void *)&self->_anon_1c8[32] = v7;
    operator delete(v7);
  }
  id v8 = *(void **)anon_1c8;
  if (*(void *)anon_1c8)
  {
    *(void *)&self->_anon_1c8[8] = v8;
    operator delete(v8);
  }
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  cntrl = (std::__shared_weak_count *)self->_wifiCAManager.__cntrl_;
  if (cntrl) {
    sub_10001A970(cntrl);
  }

  sub_10020B320((uint64_t)&self->_handoffCAManager.fHandoffCADeviceManagerMap, (void *)self->_handoffCAManager.fHandoffCADeviceManagerMap.__tree_.__pair1_.__value_.__left_);
  sub_10003E96C((uint64_t)&self->_handoffCAManager, (void *)self->_handoffCAManager.fTimeSpentInSecondsRangingWithkDevices.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_uwbResource, 0);
  id v10 = (std::__shared_weak_count *)self->_backoffResumeManager.__cntrl_;
  if (v10) {
    sub_10001A970(v10);
  }
  sub_10020E584((uint64_t)&self->_wifiSessions);
  sub_10020E584((uint64_t)&self->_responderSessions);
  objc_super v11 = (std::__shared_weak_count *)self->_initiatorSession.__cntrl_;
  if (v11) {
    sub_10001A970(v11);
  }
  objc_storeStrong((id *)&self->_containerUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_updatesEngine, 0);
  unint64_t v12 = (std::__shared_weak_count *)self->_pbLogger.__cntrl_;
  if (v12)
  {
    sub_10001A970(v12);
  }
}

- (id).cxx_construct
{
  self->_pbLogger.__ptr_ = 0;
  self->_pbLogger.__cntrl_ = 0;
  self->_initiatorSession.__ptr_ = 0;
  self->_initiatorSession.__cntrl_ = 0;
  self->_responderSessions.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_responderSessions.__table_.__p1_.__value_.__next_ = 0u;
  self->_responderSessions.__table_.__p3_.__value_ = 1.0;
  self->_wifiSessions.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_wifiSessions.__table_.__p1_.__value_.__next_ = 0u;
  self->_wifiSessions.__table_.__p3_.__value_ = 1.0;
  self->_backoffResumeManager.__ptr_ = 0;
  self->_backoffResumeManager.__cntrl_ = 0;
  sub_100237284(&self->_handoffCAManager, a2);
  self->_wifiCAManager.__ptr_ = 0;
  self->_wifiCAManager.__cntrl_ = 0;
  self->_filteredMFStrength.var0.__null_state_ = 0;
  self->_filteredMFStrength.__engaged_ = 0;
  self->_estMagneticFieldBias.var0.__null_state_ = 0;
  self->_anon_1a0[24] = 0;
  *(_OWORD *)&self->_anon_1c8[16] = 0u;
  *(_OWORD *)&self->_anon_1c8[32] = 0u;
  *(_OWORD *)self->_anon_1c8 = 0u;
  *(_OWORD *)self->_anon_1f8 = 0u;
  *(_OWORD *)&self->_anon_1f8[16] = 0u;
  *(_OWORD *)&self->_anon_1f8[32] = 0u;
  sub_1002B5E80(&self->_machTimeConverter, v3);
  self->_cachedRegionUpdateEvent.var0.__null_state_ = 0;
  self->_cachedRegionUpdateEvent.__engaged_ = 0;
  self->_btIdentifierHashToObjectMap.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_btIdentifierHashToObjectMap.__table_.__p1_.__value_.__next_ = 0u;
  self->_btIdentifierHashToObjectMap.__table_.__p3_.__value_ = 1.0;
  return self;
}

@end