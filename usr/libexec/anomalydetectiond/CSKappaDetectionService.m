@interface CSKappaDetectionService
- (BOOL)coinflip:(double)a3;
- (BOOL)curationSampling;
- (BOOL)isIdle;
- (BOOL)performanceSampling;
- (BOOL)shouldKeepEarlyCrashTTR;
- (BOOL)shouldUploadRecording;
- (BOOL)simulated;
- (BOOL)simulatedAuthorized;
- (BOOL)valid;
- (CSCompanionServiceProtocol)companionProxy;
- (CSConnectionServer)kappaConnectionServer;
- (CSKappaDetectionService)initWithSilo:(id)a3 vendor:(id)a4 aopService:(void *)a5 sosStateMachine:(id)a6;
- (CSMSLDataRecording)mslRecording;
- (float)querySamplingBin:(id)a3 atIndex:(int)a4 withDefault:(float)a5;
- (float)querySamplingRate:(id)a3 withDefault:(float)a4;
- (id).cxx_construct;
- (id)userInfoUploader;
- (int)delayBufferSize;
- (int64_t)daysSinceTimestamp:(double)a3;
- (int64_t)getMaxTriggerSessionInSecondsDefault;
- (shared_ptr<CLKappaEstimatesAlgCrash>)getCrashBlock;
- (shared_ptr<CLKappaFeaturesAlgDataIntegrity>)getDataIntegrityBlock;
- (void)companionConnectedAck:(int)a3;
- (void)companionConnectedAckHandler:(int)a3 data:(id)a4 receivedTimestamp:(double)a5;
- (void)companionConnectedAckHandler_Deprecated:(int)a3 data:(id)a4 receivedTimestamp:(double)a5;
- (void)companionDecidedToUploadHandler:(int)a3 data:(id)a4 receivedTimestamp:(double)a5;
- (void)companionTriggerHandler:(int)a3 data:(id)a4 receivedTimestamp:(double)a5;
- (void)connectionCreated:(id)a3 withMessage:(id)a4;
- (void)consumeSampleArray:(id)a3;
- (void)decideToShowTTR;
- (void)didReceiveSOSAck:(int64_t)a3 forMode:(unsigned __int8)a4;
- (void)didReceiveSOSStatusUpdate:(id)a3 forMode:(unsigned __int8)a4;
- (void)dumpSample:(id)a3;
- (void)escalateCrashDecision;
- (void)evaluateCrashWithPOI;
- (void)evaluatePossibleCrashDetectorDecision;
- (void)evaluateSamplingAlgFeatures;
- (void)feedAccel800:(id)a3;
- (void)feedAccel:(id)a3;
- (void)feedCompanionStatus:(id)a3;
- (void)feedDeviceMotion:(id)a3;
- (void)feedGPS:(id)a3;
- (void)feedHertzSample:(id)a3;
- (void)feedHgAccel:(id)a3;
- (void)feedKappaTrigger:(id)a3;
- (void)feedLocationManagerResults:(id)a3;
- (void)feedMag:(id)a3;
- (void)feedPressure:(id)a3;
- (void)feedRemoteSample:(id)a3;
- (void)feedRoads:(id)a3;
- (void)feedSignificantUserInteraction:(id)a3;
- (void)feedSortedSamples:(id)a3;
- (void)feedSoundPressureLevel:(id)a3;
- (void)feedSteps:(id)a3;
- (void)feedTrustedAudioResult:(id)a3;
- (void)finishAnomalyEvent;
- (void)forceBehavior:(int)a3 withValue:(int)a4;
- (void)forceCompanionTrigger:(id)a3;
- (void)forceCrashDetector:(int)a3 withValue:(int)a4;
- (void)forceHighSpeedCrashDetector:(int)a3 withValue:(int)a4;
- (void)forceParticipatingInEscalation:(int)a3 withValue:(int)a4;
- (void)forceRolloverCrashDetector:(int)a3 withValue:(int)a4;
- (void)forceSamplingBits:(int)a3 withValue:(int)a4;
- (void)forceSevereCrashDetector:(int)a3 withValue:(int)a4;
- (void)initFlowController;
- (void)initSession;
- (void)kappaSessionCompanionHandler:(int)a3 data:(id)a4 receivedTimestamp:(double)a5;
- (void)logAudioStats;
- (void)messageReceived:(id)a3 fromConnection:(id)a4;
- (void)notifyCompanionOfUploadedCompanionUUID;
- (void)onCloseEpoch:(unint64_t)a3 epochNumber:(int)a4;
- (void)onCompanionMessage:(int)a3 data:(id)a4 receivedTimestamp:(double)a5;
- (void)onCompanionStatusUpdate:(BOOL)a3 pairedDevice:(id)a4 updatedTimestamp:(double)a5;
- (void)onCompanionTestTrigger:(double)a3;
- (void)populateSessionDetails;
- (void)printSamplingDefaults;
- (void)queryIfNearAmusementPark;
- (void)receiveCompanionUUID:(id)a3;
- (void)receiveDeviceInfoProtobuf:(id)a3;
- (void)receiveForceTriggerProtobuf:(id)a3;
- (void)resetSession;
- (void)saveForceState:(int)a3 withValue:(int)a4;
- (void)sendCompanionUUID:(id)a3;
- (void)sendDeviceInfoProtobuf;
- (void)sendForceTriggerProtobuf:(id)a3;
- (void)sendLocalAudioToWatch;
- (void)sendRemoteSampleToCompanion:(unint64_t)a3 epochTs:(unint64_t)a4 epochNumber:(int)a5;
- (void)setDelayBufferSize:(int)a3;
- (void)setMslRecording:(id)a3;
- (void)setRecording:(id)a3 withUUID:(id)a4;
- (void)setSimulated:(BOOL)a3;
- (void)setSimulatedAuthorized:(BOOL)a3;
- (void)setUploader:(id)a3;
- (void)setValid:(BOOL)a3;
- (void)sosActivated;
- (void)start;
- (void)stop:(unint64_t)a3;
- (void)stopSession;
- (void)triggered:(id)a3;
- (void)updateCompanion;
- (void)updateKappaSessionClients:(int)a3 data:(id)a4;
- (void)updateTrustedAudioMetadata;
@end

@implementation CSKappaDetectionService

- (void)start
{
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  v3 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "start", (uint8_t *)&v22, 2u);
  }
  id v4 = [(CSPower *)self->_powerAssertion createPowerAssertion:@"AOP Trigger"];
  if (self->_uuid)
  {
    [(CSKappaDetectionService *)self updateCompanion];
    [(CSKappaDetectionService *)self sendCompanionUUID:self->_uuid];
    self->_triggerTime = 0.0;
    v5 = +[CSPermissions sharedInstance];
    self->_BOOL canCollectData = [v5 isAuthorizedToCollectData];

    if (qword_1003DB6C0 == -1) {
      goto LABEL_7;
    }
  }
  else
  {
    sub_1002D49B0(v4);
    __break(1u);
  }
  dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
LABEL_7:
  v6 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
  {
    BOOL canCollectData = self->_canCollectData;
    int v22 = 67109120;
    LODWORD(v23) = canCollectData;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "can collect data %d", (uint8_t *)&v22, 8u);
  }
  if (!self->_canCollectData)
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    v8 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "device cannot collect data", (uint8_t *)&v22, 2u);
    }
    mslRecording = self->_mslRecording;
    self->_mslRecording = 0;
  }
  int detectionEvent = self->_detectionEvent;
  self->_int detectionEvent = detectionEvent + 1;
  if (detectionEvent >= 1)
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    v11 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "multiple detection events cannot be recorded", (uint8_t *)&v22, 2u);
    }
    v12 = self->_mslRecording;
    self->_mslRecording = 0;
  }
  v13 = +[CSPlatformInfo sharedInstance];
  id v14 = [v13 getSystemHardware];
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  v15 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 134349056;
    id v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "start hw = %{public}lu", (uint8_t *)&v22, 0xCu);
  }
  [(CSMSLDataRecording *)self->_mslRecording updateMetadata:&off_1003C35E0];
  [(CSKappaDetectionService *)self initSession];
  v16 = +[CSPersistentConfiguration sharedConfiguration];
  unsigned __int16 v17 = (unsigned __int16)[v16 getBooleanDefault:@"KappaShouldFeedAccessoryGPS"];
  if ((v17 & 0xFF00) != 0) {
    BOOL v18 = v17;
  }
  else {
    BOOL v18 = 1;
  }
  self->_BOOL shouldFeedAccessoryGPS = v18;
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  v19 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
  {
    BOOL shouldFeedAccessoryGPS = self->_shouldFeedAccessoryGPS;
    int v22 = 67109120;
    LODWORD(v23) = shouldFeedAccessoryGPS;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "should feed accessory gps %d", (uint8_t *)&v22, 8u);
  }
  companionUUIDPreSession = self->_companionUUIDPreSession;
  if (companionUUIDPreSession) {
    objc_storeStrong((id *)&self->_companionUUID, companionUUIDPreSession);
  }
  self->_inSession = 1;
  [(CSKappaDetectionService *)self updateKappaSessionClients:0 data:0];
}

- (void)updateKappaSessionClients:(int)a3 data:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  v7 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 67109120;
    v8[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "updateKappaSessionClients type: %d", (uint8_t *)v8, 8u);
  }
  [(CSPower *)self->_powerAssertion onKappaSessionUpdate:v4 data:v6];
  [(CSKappaCoreAnalytics *)self->_coreAnalytics onKappaSessionUpdate:v4 data:v6];
}

- (CSKappaDetectionService)initWithSilo:(id)a3 vendor:(id)a4 aopService:(void *)a5 sosStateMachine:(id)a6
{
  id v65 = a3;
  id v11 = a4;
  id v66 = a6;
  id v12 = objc_initWeak(&location, self);
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  v13 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "beginService", buf, 2u);
  }
  objc_storeStrong((id *)&self->_silo, a3);
  objc_storeStrong((id *)&self->_vendor, a4);
  objc_storeStrong((id *)&self->_silo, a3);
  mslRecording = self->_mslRecording;
  self->_mslRecording = 0;

  self->_int detectionEvent = 0;
  objc_storeStrong((id *)&self->_sosSM, a6);
  v15 = [v11 proxyForService:@"CSInjectionService"];
  v16 = (CSConnectionServer *)[objc_alloc((Class)objc_msgSend(v15, "syncgetClassForName:", @"CSKappaConnectionServer")) initWithDispatchSilo:self->_silo andDelegate:self];
  kappaConnectionServer = self->_kappaConnectionServer;
  self->_kappaConnectionServer = v16;

  BOOL v18 = [v11 proxyForService:@"CSCompanionService"];
  companionProxy = self->_companionProxy;
  self->_companionProxy = v18;

  [(CSCompanionServiceProtocol *)self->_companionProxy registerDelegate:self inSilo:self->_silo];
  [(CSCompanionServiceProtocol *)self->_companionProxy registerClient:self];
  v20 = +[CSPower sharedInstance];
  powerAssertion = self->_powerAssertion;
  self->_powerAssertion = v20;

  int v22 = [[CSKappaCoreAnalytics alloc] initWithSilo:self->_silo vendor:v11 aopService:a5];
  coreAnalytics = self->_coreAnalytics;
  self->_coreAnalytics = v22;

  v24 = +[CSPlatformInfo sharedInstance];
  unsigned int v25 = [v24 isInternalInstall];

  if (v25)
  {
    v26 = NSTemporaryDirectory();
    v27 = [v26 stringByAppendingPathComponent:@"kappaTTRSpooler"];

    v28 = +[NSFileManager defaultManager];
    [v28 createDirectoryAtPath:v27 withIntermediateDirectories:1 attributes:0 error:0];

    v29 = [CSKappaTap2Radar alloc];
    v30 = +[CSKappaTap2RadarConfiguration tap2RadarUserConfiguration];
    v31 = [(CSKappaTap2Radar *)v29 initWithSpoolerFolder:v27 andConfiguration:v30];
    ttr = self->_ttr;
    self->_ttr = v31;

    v33 = self->_ttr;
    id v77 = 0;
    [(CSKappaTap2Radar *)v33 startMonitoringWithError:&v77];
    id v34 = v77;
    if (v34)
    {
      if (qword_1003DB6C0 != -1) {
        dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
      }
      v35 = qword_1003DB6C8;
      if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v34;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "[TTR] Error starting TTR monitoring: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v27 = self->_ttr;
    self->_ttr = 0;
  }

  v36 = +[CSPlatformInfo sharedInstance];
  self->_isLoggingDevice = [v36 isKappaLoggingDevice];
  unsigned int v37 = [v36 isKappaDetectionDevice];
  self->_isDetectionDevice = v37;
  if (self->_isLoggingDevice) {
    unsigned int v38 = v37;
  }
  else {
    unsigned int v38 = 0;
  }
  if (v38 == 1)
  {
    sub_1002D4AE0(buf);

    abort_report_np();
    __break(1u);
  }
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_1002C658C;
  v75[3] = &unk_1003B67A8;
  v39 = self;
  v76 = v39;
  v40 = objc_retainBlock(v75);
  id idleState = v39->_idleState;
  v39->_id idleState = v40;

  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_1002C6604;
  v73[3] = &unk_1003B67A8;
  v42 = v39;
  v74 = v42;
  v43 = objc_retainBlock(v73);
  id readingState = v42->_readingState;
  v42->_id readingState = v43;

  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_1002C67A0;
  v71[3] = &unk_1003B67A8;
  v45 = v42;
  v72 = v45;
  v46 = objc_retainBlock(v71);
  id waitForPOIState = v45->_waitForPOIState;
  v45->_id waitForPOIState = v46;

  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_1002C6A20;
  v69[3] = &unk_1003B67A8;
  v48 = v45;
  v70 = v48;
  v49 = objc_retainBlock(v69);
  id waitForSOSState = v48->_waitForSOSState;
  v48->_id waitForSOSState = v49;

  v51 = [CSHSMObjc alloc];
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  id v52 = (id)qword_1003DB6C8;
  v53 = [(CSHSMObjc *)v51 initWithCategory:v52 state:v39->_idleState];
  hsm = v48->_hsm;
  v48->_hsm = v53;

  v55 = (CLTimer *)[(CLSilo *)self->_silo newTimer];
  triggerTimer = v48->_triggerTimer;
  v48->_triggerTimer = v55;

  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_1002C6CC0;
  v67[3] = &unk_10039F568;
  v57 = v48;
  v68 = v57;
  [(CLTimer *)v48->_triggerTimer setHandler:v67];
  companionUUIDPreSession = v57->_companionUUIDPreSession;
  v57->_companionUUIDPreSession = 0;

  v57->_inSession = 0;
  v57->_forceFeatureBitmap = 0;
  v57->_savedForceState[5] = -1;
  v57->_savedForceState[9] = -1;
  uint64_t v59 = +[GEOMapService sharedService];
  geoMapSvc = v57->_geoMapSvc;
  v57->_geoMapSvc = (GEOMapService *)v59;

  if (!v57->_geoMapSvc)
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    v61 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_FAULT, "unable to get geo map service", buf, 2u);
    }
  }
  v57->_aop = a5;
  v62 = v68;
  v63 = v57;

  objc_destroyWeak(&location);
  return v63;
}

- (void)queryIfNearAmusementPark
{
  if (self->_poiGpsSample)
  {
    v3 = +[CSPersistentConfiguration sharedConfiguration];
    [v3 doubleForKey:@"CSRollerCoasterProxyPOIRadius"];
    double v5 = v4;

    if (v5 == 0.0) {
      double v5 = 100.0;
    }
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    id v6 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      double v24 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "querying for radius %{public}f", buf, 0xCu);
    }
    float v7 = *((float *)[(CSSPUGps *)self->_poiGpsSample c_struct] + 4);
    float v8 = *((float *)[(CSSPUGps *)self->_poiGpsSample c_struct] + 5);
    v9 = +[NSMutableArray arrayWithCapacity:1];
    uint64_t v22 = GEOSpatialPlaceLookupCategoryAmusementParkRide;
    v10 = +[NSArray arrayWithObjects:&v22 count:1];
    double v11 = v7;
    double v12 = v8;
    id v13 = [objc_alloc((Class)GEOSpatialPlaceLookupParameters) initWithCoordinate:v10 radius:10 categories:v11 maxResultCount:v12];
    [v9 addObject:v13];
    id v14 = [(GEOMapService *)self->_geoMapSvc ticketForSpatialPlaceLookupParameters:v9 traits:0];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1002C70B8;
    v18[3] = &unk_1003B9168;
    v18[4] = self;
    id v15 = v9;
    id v19 = v15;
    double v20 = v11;
    double v21 = v12;
    v16 = [(CLSilo *)self->_silo queue];
    [v14 submitWithHandler:v18 queue:v16];
  }
  else
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    unsigned __int16 v17 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "no gps sample to resolve LOI", buf, 2u);
    }
    self->_POIResolutionComplete = 0;
    [(CSHSMObjc *)self->_hsm signal:6 data:0];
  }
}

- (void)escalateCrashDecision
{
  value = self->fFlowControl.__ptr_.__value_;
  uint64_t v5 = *((void *)value + 50);
  double v4 = (std::__shared_weak_count *)*((void *)value + 51);
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v54 = v5;
  v55 = v4;
  sub_100044E78((uint64_t)&v54, &v56);
  if (v55) {
    sub_10000BB9C(v55);
  }
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v56 + 160))(&v50);
  sub_100038EC8((uint64_t)&v50, &v52);
  if (v51) {
    sub_10000BB9C(v51);
  }
  char v6 = *(unsigned char *)(v52 + 48);
  mslRecording = self->_mslRecording;
  CFStringRef v122 = @"highSensitivityBitmap";
  float v8 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v52 + 144)];
  v123 = v8;
  v9 = +[NSDictionary dictionaryWithObjects:&v123 forKeys:&v122 count:1];
  [(CSMSLDataRecording *)mslRecording updateMetadata:v9];

  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  v10 = (id)qword_1003DB6C8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    char v49 = v6;
    double v11 = [(NSUUID *)self->_uuid UUIDString];
    BOOL canCollectData = self->_canCollectData;
    BOOL companionConnected = self->_companionConnected;
    double fractionalAudio = self->_trustedAudioStats.fractionalAudio;
    int triggerPathBitmap = self->_triggerPathBitmap;
    BOOL isCrashDetected = self->_isCrashDetected;
    BOOL isRolloverCrashDetected = self->_isRolloverCrashDetected;
    BOOL isHighSpeedCrashDetected = self->_isHighSpeedCrashDetected;
    int v19 = *(_DWORD *)(v52 + 152);
    int v20 = *(_DWORD *)(v52 + 156);
    int v22 = *(_DWORD *)(v52 + 160);
    int v21 = *(_DWORD *)(v52 + 164);
    int v24 = *(_DWORD *)(v52 + 168);
    int v23 = *(_DWORD *)(v52 + 172);
    int v25 = *(_DWORD *)(v52 + 216);
    double v26 = *(float *)(v52 + 220);
    double v27 = *(float *)(v52 + 224);
    int v28 = *(unsigned __int8 *)(v52 + 233);
    int v29 = *(_DWORD *)(v52 + 236);
    double v30 = *(float *)(v52 + 240);
    int v31 = *(unsigned __int8 *)(v52 + 244);
    uint64_t v32 = *(void *)(v52 + 248);
    int v33 = *(_DWORD *)(v52 + 256);
    int v34 = *(_DWORD *)(v52 + 260);
    double v35 = *(float *)(v52 + 264);
    double v36 = *(float *)(v52 + 268);
    double v37 = *(float *)(v52 + 272);
    double v38 = *(float *)(v52 + 276);
    int v39 = *(_DWORD *)(v52 + 280);
    BOOL isAirbagDetectedOverWindow = self->_isAirbagDetectedOverWindow;
    BOOL possibleRollerCoaster = self->_possibleRollerCoaster;
    int v42 = *(_DWORD *)(v52 + 228);
    *(_DWORD *)buf = 138551298;
    uint64_t v59 = v11;
    __int16 v60 = 1026;
    BOOL v61 = canCollectData;
    __int16 v62 = 1026;
    BOOL v63 = companionConnected;
    __int16 v64 = 2050;
    double v65 = fractionalAudio;
    __int16 v66 = 1026;
    int v67 = triggerPathBitmap;
    __int16 v68 = 1026;
    BOOL v69 = isCrashDetected;
    __int16 v70 = 1026;
    BOOL v71 = isRolloverCrashDetected;
    __int16 v72 = 1026;
    BOOL v73 = isHighSpeedCrashDetected;
    __int16 v74 = 1026;
    int v75 = v19;
    __int16 v76 = 1026;
    int v77 = v20;
    __int16 v78 = 1026;
    int v79 = v22;
    __int16 v80 = 1026;
    int v81 = v21;
    __int16 v82 = 1026;
    int v83 = v24;
    __int16 v84 = 1026;
    int v85 = v23;
    __int16 v86 = 1026;
    int v87 = v25;
    __int16 v88 = 2050;
    double v89 = v26;
    __int16 v90 = 2050;
    double v91 = v27;
    __int16 v92 = 1026;
    int v93 = v28;
    __int16 v94 = 1026;
    int v95 = v29;
    __int16 v96 = 2050;
    double v97 = v30;
    __int16 v98 = 1026;
    int v99 = v31;
    __int16 v100 = 2050;
    uint64_t v101 = v32;
    __int16 v102 = 1026;
    int v103 = v33;
    __int16 v104 = 1026;
    int v105 = v34;
    __int16 v106 = 2050;
    double v107 = v35;
    __int16 v108 = 2050;
    double v109 = v36;
    __int16 v110 = 2050;
    double v111 = v37;
    __int16 v112 = 2050;
    double v113 = v38;
    __int16 v114 = 1026;
    int v115 = v39;
    __int16 v116 = 1026;
    BOOL v117 = isAirbagDetectedOverWindow;
    __int16 v118 = 1026;
    BOOL v119 = possibleRollerCoaster;
    __int16 v120 = 1026;
    int v121 = v42;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "Crash context: %{public}@ %{public}d %{public}d %{public}0.3f %{public}d %{public}d %{public}d %{public}d %{public}d %{public}d %{public}d %{public}d %{public}d %{public}d %{public}d %{public}0.3f %{public}0.3f %{public}d %{public}d %{public}0.3f %{public}d %{public}llu %{public}d %{public}d %{public}0.3f %{public}0.3f %{public}0.3f %{public}0.3f %{public}d %{public}d %{public}d %{public}d ", buf, 0xEAu);

    char v6 = v49;
  }

  self->_SOSInProgress = 1;
  v43 = [(NSUUID *)self->_uuid UUIDString];
  +[CSFeedbackAssistant showFeedbackAssistantSurveyWithUUID:v43];

  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  v44 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "[TTR] Setting severe crash", buf, 2u);
  }
  self->_sessionDetails.ttrType = 4;
  v45 = +[CSPersistentConfiguration sharedConfiguration];
  unsigned __int16 v46 = (unsigned __int16)[v45 getBooleanDefault:@"KappaShouldEscalateUI"];
  if (v46 < 0x100u || (_BYTE)v46)
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    v48 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "escalating UI", buf, 2u);
    }
    [(CSSafetySOSStateMachine *)self->_sosSM feedDetectionDecision:v6 & 1 uuid:self->_uuid forMode:1];
  }
  else
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    v47 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "refusing to escalate UI", buf, 2u);
    }
  }
  [(CSKappaDetectionService *)self updateKappaSessionClients:1 data:0];

  if (v53) {
    sub_10000BB9C(v53);
  }
  if (v57) {
    sub_10000BB9C(v57);
  }
}

- (void)evaluateCrashWithPOI
{
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  v3 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
  {
    BOOL POIResolutionComplete = self->_POIResolutionComplete;
    BOOL isNearAmusementParkPOI = self->_isNearAmusementParkPOI;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)uint64_t v52 = POIResolutionComplete;
    *(_WORD *)&v52[4] = 1024;
    *(_DWORD *)&v52[6] = isNearAmusementParkPOI;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "evaluate crash with POI resolved %d poi %d", buf, 0xEu);
  }
  if (self->_POIResolutionComplete && self->_isNearAmusementParkPOI)
  {
    value = self->fFlowControl.__ptr_.__value_;
    uint64_t v8 = *((void *)value + 50);
    float v7 = (std::__shared_weak_count *)*((void *)value + 51);
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v47 = v8;
    v48 = v7;
    sub_100044E78((uint64_t)&v47, &v49);
    if (v48) {
      sub_10000BB9C(v48);
    }
    (*(void (**)(uint64_t *__return_ptr))(*(void *)v49 + 160))(&v43);
    sub_100038EC8((uint64_t)&v43, &v45);
    if (v44) {
      sub_10000BB9C(v44);
    }
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    v9 = (id)qword_1003DB6C8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = [(NSUUID *)self->_uuid UUIDString];
      BOOL canCollectData = self->_canCollectData;
      BOOL companionConnected = self->_companionConnected;
      double fractionalAudio = self->_trustedAudioStats.fractionalAudio;
      int triggerPathBitmap = self->_triggerPathBitmap;
      BOOL isCrashDetected = self->_isCrashDetected;
      BOOL isRolloverCrashDetected = self->_isRolloverCrashDetected;
      BOOL isHighSpeedCrashDetected = self->_isHighSpeedCrashDetected;
      int v18 = *(_DWORD *)(v45 + 152);
      int v19 = *(_DWORD *)(v45 + 156);
      int v20 = *(_DWORD *)(v45 + 160);
      int v21 = *(_DWORD *)(v45 + 164);
      int v23 = *(_DWORD *)(v45 + 168);
      int v22 = *(_DWORD *)(v45 + 172);
      int v24 = *(_DWORD *)(v45 + 216);
      double v25 = *(float *)(v45 + 220);
      double v26 = *(float *)(v45 + 224);
      int v27 = *(unsigned __int8 *)(v45 + 233);
      int v28 = *(_DWORD *)(v45 + 236);
      double v29 = *(float *)(v45 + 240);
      int v30 = *(unsigned __int8 *)(v45 + 244);
      uint64_t v31 = *(void *)(v45 + 248);
      int v32 = *(_DWORD *)(v45 + 256);
      int v33 = *(_DWORD *)(v45 + 260);
      double v34 = *(float *)(v45 + 264);
      double v35 = *(float *)(v45 + 268);
      double v36 = *(float *)(v45 + 272);
      double v37 = *(float *)(v45 + 276);
      int v38 = *(_DWORD *)(v45 + 280);
      BOOL isAirbagDetectedOverWindow = self->_isAirbagDetectedOverWindow;
      BOOL possibleRollerCoaster = self->_possibleRollerCoaster;
      int v41 = *(_DWORD *)(v45 + 228);
      *(_DWORD *)buf = 138551298;
      *(void *)uint64_t v52 = v10;
      *(_WORD *)&v52[8] = 1026;
      BOOL v53 = canCollectData;
      __int16 v54 = 1026;
      BOOL v55 = companionConnected;
      __int16 v56 = 2050;
      double v57 = fractionalAudio;
      __int16 v58 = 1026;
      int v59 = triggerPathBitmap;
      __int16 v60 = 1026;
      BOOL v61 = isCrashDetected;
      __int16 v62 = 1026;
      BOOL v63 = isRolloverCrashDetected;
      __int16 v64 = 1026;
      BOOL v65 = isHighSpeedCrashDetected;
      __int16 v66 = 1026;
      int v67 = v18;
      __int16 v68 = 1026;
      int v69 = v19;
      __int16 v70 = 1026;
      int v71 = v20;
      __int16 v72 = 1026;
      int v73 = v21;
      __int16 v74 = 1026;
      int v75 = v23;
      __int16 v76 = 1026;
      int v77 = v22;
      __int16 v78 = 1026;
      int v79 = v24;
      __int16 v80 = 2050;
      double v81 = v25;
      __int16 v82 = 2050;
      double v83 = v26;
      __int16 v84 = 1026;
      int v85 = v27;
      __int16 v86 = 1026;
      int v87 = v28;
      __int16 v88 = 2050;
      double v89 = v29;
      __int16 v90 = 1026;
      int v91 = v30;
      __int16 v92 = 2050;
      uint64_t v93 = v31;
      __int16 v94 = 1026;
      int v95 = v32;
      __int16 v96 = 1026;
      int v97 = v33;
      __int16 v98 = 2050;
      double v99 = v34;
      __int16 v100 = 2050;
      double v101 = v35;
      __int16 v102 = 2050;
      double v103 = v36;
      __int16 v104 = 2050;
      double v105 = v37;
      __int16 v106 = 1026;
      int v107 = v38;
      __int16 v108 = 1026;
      BOOL v109 = isAirbagDetectedOverWindow;
      __int16 v110 = 1026;
      BOOL v111 = possibleRollerCoaster;
      __int16 v112 = 1026;
      int v113 = v41;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Non escalated crash context: %{public}@ %{public}d %{public}d %{public}0.3f %{public}d %{public}d %{public}d %{public}d %{public}d %{public}d %{public}d %{public}d %{public}d %{public}d %{public}d %{public}0.3f %{public}0.3f %{public}d %{public}d %{public}0.3f %{public}d %{public}llu %{public}d %{public}d %{public}0.3f %{public}0.3f %{public}0.3f %{public}0.3f %{public}d %{public}d %{public}d %{public}d ", buf, 0xEAu);
    }
    [(CSHSMObjc *)self->_hsm signal:3 data:0];
    if (v46) {
      sub_10000BB9C(v46);
    }
    if (v50) {
      sub_10000BB9C(v50);
    }
  }
  else
  {
    [(CSKappaDetectionService *)self escalateCrashDecision];
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    int v42 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "sos active", buf, 2u);
    }
    [(CSHSMObjc *)self->_hsm signal:4 data:0];
  }
}

- (void)updateCompanion
{
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  v3 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT))
  {
    uuid = self->_uuid;
    LODWORD(v7) = 138543362;
    *(void *)((char *)&v7 + 4) = uuid;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Forward trigger UUID %{public}@ to companion", (uint8_t *)&v7, 0xCu);
  }
  long long v7 = 0uLL;
  [(NSUUID *)self->_uuid getUUIDBytes:&v7];
  companionProxy = self->_companionProxy;
  char v6 = +[NSData dataWithBytes:&v7 length:16];
  [(CSCompanionServiceProtocol *)companionProxy sendData:v6 type:1];
}

- (void)sendCompanionUUID:(id)a3
{
  id v4 = [a3 UUIDString];
  sub_100007BC0(&__p, (char *)[v4 UTF8String]);

  char v6 = KappaCompanion::serializeCompanionUUID(&__p, v5);
  [(CSCompanionServiceProtocol *)self->_companionProxy sendData:v6 type:203];

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

- (void)receiveCompanionUUID:(id)a3
{
}

- (void)forceCompanionTrigger:(id)a3
{
  id v4 = a3;
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  uint64_t v5 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
  {
    LOWORD(triggerTime) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "forcing companion to trigger", (uint8_t *)&triggerTime, 2u);
  }
  double triggerTime = self->_triggerTime;
  char v6 = (long long *)[v4 c_struct:*(void *)&triggerTime];
  long long v7 = *v6;
  long long v12 = v6[1];
  long long v11 = v7;
  companionProxy = self->_companionProxy;
  v9 = +[NSData dataWithBytes:&triggerTime length:40];
  [(CSCompanionServiceProtocol *)companionProxy sendData:v9 type:3];
}

- (void)companionConnectedAck:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  uint64_t v5 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    signed int v24 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "request response from companion %d", buf, 8u);
  }
  if ((v3 - 4) < 2 || (v3 - 101) < 2)
  {
    *(_DWORD *)buf = 1;
    char v6 = +[CSPlatformInfo sharedInstance];
    signed int v24 = [v6 getSystemHardware];
    id v7 = [v6 getSystemModel];
    strncpy(v25, (const char *)[v7 UTF8String], 0x14uLL);

    if ([v6 isKappaLoggingDevice])
    {
      int v26 = 0;
    }
    else if ([v6 isKappaDetectionDevice])
    {
      int v26 = 1;
    }
    else
    {
      if (qword_1003DB6C0 != -1) {
        dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
      }
      v9 = qword_1003DB6C8;
      if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "invalid kappa device detected", v16, 2u);
      }
    }
    int KappaToken = getKappaToken(0);
    v10 = objc_alloc_init(CSArmedSeconds);
    if (self->_isLoggingDevice)
    {
      if (qword_1003DB6C0 != -1) {
        dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
      }
      long long v11 = qword_1003DB6C8;
      if (!os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO)) {
        goto LABEL_34;
      }
      *(_WORD *)v16 = 0;
      long long v12 = "query armed state not supported";
    }
    else
    {
      if (CSAOPSvc::getArmedState((id *)self->_aop, v10))
      {
        unsigned int v28 = [(CSArmedSeconds *)v10 isArmed];
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        id v13 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v16 = 67109120;
          *(_DWORD *)&v16[4] = v28;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "queried isArmed:%d", v16, 8u);
        }
        goto LABEL_35;
      }
      if (qword_1003DB6C0 != -1) {
        dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
      }
      long long v11 = qword_1003DB6C8;
      if (!os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
      {
LABEL_34:
        unsigned int v28 = -1;
LABEL_35:
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        id v14 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v16 = 134218754;
          *(void *)&v16[4] = v24;
          __int16 v17 = 2080;
          int v18 = v25;
          __int16 v19 = 1024;
          int v20 = v26;
          __int16 v21 = 1024;
          int v22 = KappaToken;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "sending device info %lu %s %d %d", v16, 0x22u);
        }
        id v15 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, 40, *(void *)v16);
        [(CSCompanionServiceProtocol *)self->_companionProxy sendData:v15 type:v3];

        return;
      }
      *(_WORD *)v16 = 0;
      long long v12 = "query get armed state failed";
    }
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v12, v16, 2u);
    goto LABEL_34;
  }
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  uint64_t v8 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "invalid opcode", buf, 2u);
  }
}

- (void)companionConnectedAckHandler:(int)a3 data:(id)a4 receivedTimestamp:(double)a5
{
  id v10 = a4;
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  long long v11 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "companionConnectedAckHandler", buf, 2u);
  }
  *(_DWORD *)buf = 1;
  [v10 getBytes:buf length:40];
  if (self->_inSession)
  {
    if (*(int *)buf >= 1)
    {
      long long v38 = v44;
      int v8 = v43;
      int v7 = v46;
      int v37 = v43;
      int v39 = v45;
      uint64_t v40 = v46;
      int v6 = HIDWORD(v46);
      unsigned int v5 = v47;
      unsigned int v41 = v47;
    }
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    id v13 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v27 = 134350082;
      uint64_t v28 = v8;
      __int16 v29 = 2082;
      int v30 = &v38;
      __int16 v31 = 1026;
      int v32 = v7;
      __int16 v33 = 1026;
      int v34 = v6;
      __int16 v35 = 1026;
      unsigned int v36 = v5;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "received companion device info %{public}lu %{public}s %{public}d %{public}d %{public}d", v27, 0x28u);
    }
    mslRecording = self->_mslRecording;
    v26[0] = &__kCFBooleanTrue;
    id v15 = +[NSString stringWithUTF8String:&v38, @"companionConnected", @"companionDeviceModel"];
    v26[1] = v15;
    v25[2] = @"companionDeviceType";
    v16 = +[NSNumber numberWithInt:v40];
    v26[2] = v16;
    v25[3] = @"companionTokenCount";
    __int16 v17 = +[NSNumber numberWithInt:HIDWORD(v40)];
    v26[3] = v17;
    v25[4] = @"companionArmedStatus";
    int v18 = +[NSNumber numberWithInt:v41];
    v26[4] = v18;
    __int16 v19 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:5];
    [(CSMSLDataRecording *)mslRecording updateMetadata:v19];

    self->_companionDeviceType = v40;
    [(CSKappaDetectionService *)self updateKappaSessionClients:10 data:0];
    value = self->fFlowControl.__ptr_.__value_;
    uint64_t v21 = *((void *)value + 38);
    int v22 = (std::__shared_weak_count *)*((void *)value + 39);
    if (v22)
    {
      atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
      value = self->fFlowControl.__ptr_.__value_;
    }
    *(unsigned char *)(v21 + 82) = 1;
    uint64_t v24 = *((void *)value + 40);
    int v23 = (std::__shared_weak_count *)*((void *)value + 41);
    if (!v23)
    {
      *(unsigned char *)(v24 + 81) = 1;
      self->_BOOL companionConnected = 1;
      if (!v22) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
    atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
    *(unsigned char *)(v24 + 81) = 1;
    self->_BOOL companionConnected = 1;
    sub_10000BB9C(v23);
    if (v22) {
LABEL_20:
    }
      sub_10000BB9C(v22);
  }
  else
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    long long v12 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "companion out of sync, session not in progress", v27, 2u);
    }
  }
LABEL_21:
}

- (void)companionDecidedToUploadHandler:(int)a3 data:(id)a4 receivedTimestamp:(double)a5
{
  id v6 = a4;
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  int v7 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Companion decided to upload", buf, 2u);
  }
  if ([v6 length] == (id)16)
  {
    mslRecording = self->_mslRecording;
    if (mslRecording)
    {
      [(CSMSLDataRecording *)mslRecording updateMetadata:&off_1003C3608];
    }
    else
    {
      *(void *)buf = 0;
      uint64_t v19 = 0;
      id v10 = v6;
      memcpy(buf, [v10 bytes], (size_t)[v10 length]);
      id v11 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:buf];
      long long v12 = [v11 UUIDString];

      id v13 = [CSStudiesServerUploadOutOfBandMetadata alloc];
      v16 = v12;
      CFStringRef v17 = @"companionUploaded";
      id v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      id v15 = [(CSStudiesServerUploadOutOfBandMetadata *)v13 initWithLookingBack:v14 keyValuePairs:300.0];

      [(CSStudiesServerUploader *)self->_uploader addOutOfBandMetadata:v15 error:0];
    }
  }
  else
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    v9 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "incorrect number of bytes for uuid", buf, 2u);
    }
  }
}

- (void)triggered:(id)a3
{
  id v4 = a3;
  [(CSHSMObjc *)self->_hsm signal:1 data:0];
  unsigned int v5 = [v4 c_struct];
  self->_triggerPathBitmap |= *((unsigned char *)[v4 c_struct] + 1);
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  id v6 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
  {
    int triggerPathBitmap = self->_triggerPathBitmap;
    *(_DWORD *)buf = 67109120;
    LODWORD(v24) = triggerPathBitmap;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "_triggerPathBitmap %x", buf, 8u);
  }
  if (self->_triggerTime == 0.0)
  {
    self->_double triggerTime = CFAbsoluteTimeGetCurrent();
    self->_unint64_t triggerAOPTime = *(v4->c_struct + 1);
    self->_int triggerAOPArmedSec = *((_WORD *)[v4 c_struct] + 1);
    self->_BOOL triggerAOPHasBTCarplay = *((unsigned char *)[v4 c_struct] + 28) == 1;
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    int v8 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
    {
      unint64_t triggerAOPTime = self->_triggerAOPTime;
      int triggerAOPArmedSec = self->_triggerAOPArmedSec;
      BOOL triggerAOPHasBTCarplay = self->_triggerAOPHasBTCarplay;
      *(_DWORD *)buf = 134218496;
      double v24 = *(double *)&triggerAOPTime;
      __int16 v25 = 1024;
      int v26 = triggerAOPArmedSec;
      __int16 v27 = 1024;
      BOOL v28 = triggerAOPHasBTCarplay;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "logging trigger %llu %d %d", buf, 0x18u);
    }
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    long long v12 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
    {
      double companionTriggerTime = self->_companionTriggerTime;
      *(_DWORD *)buf = 134217984;
      double v24 = companionTriggerTime;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "_companionTriggerTime %f", buf, 0xCu);
    }
    double v14 = self->_companionTriggerTime;
    if (v14 != 0.0)
    {
      id v15 = +[NSNumber numberWithDouble:self->_triggerTime - v14];
      v16 = [v15 stringValue];

      mslRecording = self->_mslRecording;
      CFStringRef v21 = @"deltaTrigger";
      int v22 = v16;
      int v18 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      [(CSMSLDataRecording *)mslRecording updateMetadata:v18];
    }
    [(CSKappaDetectionService *)self companionConnectedAck:101];
    [(CSKappaDetectionService *)self sendDeviceInfoProtobuf];
  }
  if ((*((unsigned char *)objc_msgSend(v4, "c_struct") + 1) & 0xB) != 0)
  {
    [(CSKappaDetectionService *)self forceCompanionTrigger:v4];
    [(CSKappaDetectionService *)self sendForceTriggerProtobuf:v4];
  }
  [(CSSafetySOSStateMachine *)self->_sosSM feedPotentialEventWithTimestamp:v5[1] forMode:1];
  uint64_t v19 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", [v4 c_struct], 112);
  [(CSKappaDetectionService *)self updateKappaSessionClients:2 data:v19];

  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  int v20 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "(re)start the flow controller", buf, 2u);
  }
  [self->fFlowControl.__ptr_.__value_ start:*(objc_msgSend(v4, "c_struct") + 1)];
}

- (void)sendDeviceInfoProtobuf
{
  uint64_t v3 = +[CSPlatformInfo sharedInstance];
  unsigned int v4 = [v3 getSystemHardware];
  id v5 = [v3 getSystemModel];
  id v6 = (char *)[v5 UTF8String];

  if ([v3 isKappaLoggingDevice])
  {
    int v7 = 0;
  }
  else if ([v3 isKappaDetectionDevice])
  {
    int v7 = 1;
  }
  else
  {
    if (qword_1003DB680 != -1) {
      dispatch_once(&qword_1003DB680, &stru_1003B91C8);
    }
    int v8 = qword_1003DB688;
    if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "invalid kappa device type detected", (uint8_t *)&v13, 2u);
    }
    int v7 = -1;
  }
  v9 = objc_alloc_init(CSArmedClients);
  if ((CSAOPSvc::getArmedClients((id *)self->_aop, v9) & 1) == 0)
  {
    if (qword_1003DB680 != -1) {
      dispatch_once(&qword_1003DB680, &stru_1003B91C8);
    }
    id v10 = qword_1003DB688;
    if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "failed to get armed clients state", (uint8_t *)&v13, 2u);
    }
  }
  unsigned int v13 = v4;
  sub_100007BC0(&__p, v6);
  int v16 = v7;
  int v17 = 0;
  int KappaToken = getKappaToken(0);
  int MartyToken = getMartyToken(0);
  unsigned int v20 = [(CSArmedClients *)v9 kappaArmedSeconds];
  unsigned int v21 = [(CSArmedClients *)v9 martyArmedSecondsLocal];
  unsigned int v22 = [(CSArmedClients *)v9 enableMode];
  long long v12 = KappaCompanion::serializeDeviceInfo((KappaCompanion *)&v13, v11);
  [(CSCompanionServiceProtocol *)self->_companionProxy sendData:v12 type:201];

  if (v15 < 0) {
    operator delete(__p);
  }
}

- (void)sendForceTriggerProtobuf:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    sub_1002D4BFC(&Current);

    abort_report_np();
    __break(1u);
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  id v5 = (long long *)[v4 c_struct];
  long long v6 = *v5;
  long long v7 = v5[1];
  long long v16 = v5[2];
  long long v15 = v7;
  long long v14 = v6;
  long long v8 = v5[3];
  long long v9 = v5[4];
  long long v10 = v5[5];
  long long v20 = v5[6];
  long long v19 = v10;
  long long v18 = v9;
  long long v17 = v8;
  long long v12 = KappaCompanion::serializeTrigger((float16x4_t *)&Current, v11);
  [(CSCompanionServiceProtocol *)self->_companionProxy sendData:v12 type:202];
}

- (void)receiveForceTriggerProtobuf:(id)a3
{
  KappaCompanion::deserializeTrigger((KappaCompanion *)a3, (const NSData *)a2);
  id v4 = (CompanionTrigger *)v7[0];
  v7[0] = 0;
  value = self->_kappaCompanionTrigger.__ptr_.__value_;
  self->_kappaCompanionTrigger.__ptr_.__value_ = v4;
  if (value) {
    operator delete();
  }
  long long v6 = self->_kappaCompanionTrigger.__ptr_.__value_;
  if ((*((unsigned char *)v6 + 9) & 4) == 0)
  {
    LOWORD(v7[0]) = 1027;
    BYTE2(v7[0]) = 0;
    v7[1] = *((void *)v6 + 2);
    CSAOPSvc::sendCommand((CSAOPSvc *)self->_aop, (const unsigned __int8 *)v7, 0x10u);
  }
}

- (void)receiveDeviceInfoProtobuf:(id)a3
{
}

- (int64_t)getMaxTriggerSessionInSecondsDefault
{
  v2 = +[CSPersistentConfiguration sharedConfiguration];
  uint64_t v3 = [v2 objectForKey:@"MaxSessionTimeInSeconds"];
  if (v3)
  {
    uint64_t v4 = (uint64_t)[v2 integerForKey:@"MaxSessionTimeInSeconds"];
    if (v4 >= 600) {
      int64_t v5 = 600;
    }
    else {
      int64_t v5 = v4;
    }
  }
  else
  {
    int64_t v5 = 120;
  }

  return v5;
}

- (void)initFlowController
{
  uint64_t v2 = [(CSKappaDetectionService *)self getMaxTriggerSessionInSecondsDefault];
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  uint64_t v3 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 134217984;
    uint64_t v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "configuring flow controller to have a max session of %llu seconds", (uint8_t *)&v4, 0xCu);
  }
  operator new();
}

- (void)initSession
{
  uint64_t v2 = self;
  [(CSKappaDetectionService *)self initFlowController];
  v2->_SOSInProgress = 0;
  v2->_gpsCount = 0;
  v2->_epochTimestamp = 0;
  v2->_epochNumber = 0;
  v2->_companionDeviceType = -1;
  companionUUID = v2->_companionUUID;
  v2->_companionUUID = 0;

  *(_WORD *)&v2->_samplingBitmap = 0;
  v2->_lastEpochTime = 0.0;
  *(void *)&v2->_trustedAudioStats.double fractionalAudio = 3212836864;
  *(void *)&v2->_trustedAudioStats.numEpochsMissingAudioAfterStart = 0xFF7FFFFF00000000;
  v2->_tellCompanionToUpload = 0;
  v2->_BOOL companionConnected = 0;
  [(CLTimer *)v2->_triggerTimer setNextFireDelay:600.0 interval:1.79769313e308];
  *(void *)&v2->_sessionDetails.trigger_bitmap = 0;
  uint64_t v2 = (CSKappaDetectionService *)((char *)v2 + 252);
  HIDWORD(v2[-1]._kappaConnectionServer) = -1082130432;
  v2->_uuid = 0;
  v2->_companionUUIDPreSession = 0;
  LODWORD(v2->_companionUUID) = 0;
  *(int32x2_t *)((char *)&v2->_companionUUID + 4) = vdup_n_s32(0x447A0000u);
  *(CompanionUUID **)((char *)&v2->_kappaCompanionUUID.__ptr_.__value_ + 4) = (CompanionUUID *)0x3E8447A0000;
  *(_OWORD *)((char *)&v2->_sosSM + 4) = 0u;
  *(_OWORD *)((char *)&v2->_idleState + 4) = 0u;
  *(_OWORD *)((char *)&v2->_waitForSOSState + 4) = 0u;
  *(_OWORD *)((char *)&v2->fFlowControl.__ptr_.__value_ + 4) = 0u;
  *(_OWORD *)((char *)&v2->_sosTimer + 4) = 0u;
  *(_OWORD *)(&v2->_epochNumber + 1) = 0u;
  *(_OWORD *)((char *)&v2->_triggerTime + 4) = 0u;
  *(int *)((char *)&v2->_sessionDetails.numDeescalationStatic + 1) = 0;
  v2[-1]._int detectionEvent = 256;
  int v4 = *(CSKappaTap2Radar **)((char *)&v2[-1]._ttr + 4);
  *(CSKappaTap2Radar **)((char *)&v2[-1]._ttr + 4) = 0;

  BYTE2(v2[-1]._trustedAudioStats.preTriggerAudioSec) = 0;
}

- (void)evaluatePossibleCrashDetectorDecision
{
  value = self->fFlowControl.__ptr_.__value_;
  if (!value)
  {
    sub_1002D4D18(0, a2);
LABEL_49:
    __break(1u);
LABEL_50:
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    goto LABEL_10;
  }
  if ((CLKappaAlgFlowController::isKappaInferencesAlgSevereCrashEnabled(value) & 1) == 0)
  {
    sub_1002D4E48();
    goto LABEL_49;
  }
  long long v7 = self->fFlowControl.__ptr_.__value_;
  uint64_t v9 = *((void *)v7 + 50);
  long long v8 = (std::__shared_weak_count *)*((void *)v7 + 51);
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v29 = v9;
  int v30 = v8;
  sub_100044E78((uint64_t)&v29, &v31);
  if (v30) {
    sub_10000BB9C(v30);
  }
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v31 + 160))(&v25);
  sub_100038EC8((uint64_t)&v25, &v27);
  if (v26) {
    sub_10000BB9C(v26);
  }
  uint64_t v2 = *(void *)(v27 + 32);
  char v3 = *(unsigned char *)(v27 + 48);
  p_info = GPBUInt32Array.info;
  if (qword_1003DB6C0 != -1) {
    goto LABEL_50;
  }
LABEL_10:
  long long v10 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240448;
    int v34 = v3 & 1;
    __int16 v35 = 2050;
    *(void *)unsigned int v36 = v2;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[SC] de %{public}d, timestamp %{public}llu", buf, 0x12u);
  }
  id v11 = (unsigned char *)v27;
  self->_isCrashDetected |= *(unsigned char *)(v27 + 56);
  self->_isRolloverCrashDetected |= v11[57];
  self->_isHighSpeedCrashDetected |= v11[58];
  self->_isAirbagDetectedOverWindow |= v11[284];
  long long v12 = +[CSPersistentConfiguration sharedConfiguration];
  if ([v12 BOOLForKey:@"CSRollerCoasterProxyForceBT"])
  {
    if (p_info[216] != (__objc2_class_ro *)-1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    unsigned int v13 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "forcing bt/carplay", buf, 2u);
    }
    self->_BOOL triggerAOPHasBTCarplay = 1;
  }
  unsigned int v14 = [v12 BOOLForKey:@"CSRollerCoasterProxyForceAirbag"];
  BOOL v15 = v14;
  if (v14)
  {
    if (p_info[216] != (__objc2_class_ro *)-1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    long long v16 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "forcing airbag", buf, 2u);
    }
    self->_BOOL isAirbagDetectedOverWindow = v15;
  }
  if (!*(unsigned char *)(v27 + 48)
    || ([v12 BOOLForKey:@"CSRollerCoasterProxyDeescalationDisabled"] & 1) != 0
    || self->_checkForPOI)
  {
    goto LABEL_53;
  }
  unsigned int v17 = [v12 integerForKey:@"CSRollerCoasterProxyArmedSecThreshold"];
  if (v17) {
    int v18 = v17;
  }
  else {
    int v18 = 60;
  }
  BOOL v19 = self->_possibleRollerCoaster & ~self->_triggerAOPHasBTCarplay & (v18 > self->_triggerAOPArmedSec);
  if (self->_isAirbagDetectedOverWindow) {
    BOOL v19 = 0;
  }
  self->_BOOL possibleRollerCoaster = v19;
  if (p_info[216] != (__objc2_class_ro *)-1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  long long v20 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL triggerAOPHasBTCarplay = self->_triggerAOPHasBTCarplay;
    int triggerAOPArmedSec = self->_triggerAOPArmedSec;
    BOOL isAirbagDetectedOverWindow = self->_isAirbagDetectedOverWindow;
    BOOL possibleRollerCoaster = self->_possibleRollerCoaster;
    *(_DWORD *)buf = 67241216;
    int v34 = triggerAOPHasBTCarplay;
    __int16 v35 = 1026;
    *(_DWORD *)unsigned int v36 = triggerAOPArmedSec;
    *(_WORD *)&v36[4] = 1026;
    *(_DWORD *)&v36[6] = v18;
    __int16 v37 = 1026;
    BOOL v38 = isAirbagDetectedOverWindow;
    __int16 v39 = 1026;
    BOOL v40 = possibleRollerCoaster;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "bt/carplay %{public}d armed %{public}d %{public}d airbag %{public}d proxy %{public}d", buf, 0x20u);
  }
  if (!self->_possibleRollerCoaster)
  {
LABEL_53:
    if (*(unsigned char *)(v27 + 48) && !self->_SOSInProgress && !self->_checkForPOI) {
      [(CSKappaDetectionService *)self escalateCrashDecision];
    }
  }
  else
  {
    self->_checkForPOI = 1;
    [(CSKappaDetectionService *)self queryIfNearAmusementPark];
    [(CSHSMObjc *)self->_hsm signal:5 data:0];
  }

  if (v28) {
    sub_10000BB9C(v28);
  }
  if (v32) {
    sub_10000BB9C(v32);
  }
}

- (shared_ptr<CLKappaEstimatesAlgCrash>)getCrashBlock
{
  value = self->fFlowControl.__ptr_.__value_;
  if (!value)
  {
    uint64_t isKappaEstimatesAlgCrashEnabled = sub_1002D4F78(0, a2);
    goto LABEL_7;
  }
  uint64_t v5 = v2;
  uint64_t isKappaEstimatesAlgCrashEnabled = CLKappaAlgFlowController::isKappaEstimatesAlgCrashEnabled(value);
  if ((isKappaEstimatesAlgCrashEnabled & 1) == 0)
  {
LABEL_7:
    id v11 = (CSKappaDetectionService *)sub_1002D50A0(isKappaEstimatesAlgCrashEnabled);
    shared_ptr<CLKappaFeaturesAlgDataIntegrity> v13 = [(CSKappaDetectionService *)v11 getDataIntegrityBlock];
    var1 = v13.var1;
    uint64_t isKappaEstimatesAlgCrashEnabled = (uint64_t)v13.var0;
    goto LABEL_8;
  }
  long long v8 = self->fFlowControl.__ptr_.__value_;
  uint64_t v10 = *((void *)v8 + 38);
  uint64_t v9 = *((void *)v8 + 39);
  void *v5 = v10;
  v5[1] = v9;
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
LABEL_8:
  result.var1 = var1;
  result.var0 = (CLKappaEstimatesAlgCrash *)isKappaEstimatesAlgCrashEnabled;
  return result;
}

- (shared_ptr<CLKappaFeaturesAlgDataIntegrity>)getDataIntegrityBlock
{
  value = self->fFlowControl.__ptr_.__value_;
  if (!value)
  {
    uint64_t isKappaFeaturesAlgDataIntegrityEnabled = sub_1002D51C8(0, a2);
    goto LABEL_7;
  }
  uint64_t v5 = v2;
  uint64_t isKappaFeaturesAlgDataIntegrityEnabled = CLKappaAlgFlowController::isKappaFeaturesAlgDataIntegrityEnabled(value);
  if ((isKappaFeaturesAlgDataIntegrityEnabled & 1) == 0)
  {
LABEL_7:
    id v11 = (CSKappaDetectionService *)sub_1002D52F0(isKappaFeaturesAlgDataIntegrityEnabled);
    [(CSKappaDetectionService *)v11 updateTrustedAudioMetadata];
    goto LABEL_8;
  }
  long long v8 = self->fFlowControl.__ptr_.__value_;
  uint64_t v10 = *((void *)v8 + 54);
  uint64_t v9 = *((void *)v8 + 55);
  void *v5 = v10;
  v5[1] = v9;
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
LABEL_8:
  result.var1 = v7;
  result.var0 = (CLKappaFeaturesAlgDataIntegrity *)isKappaFeaturesAlgDataIntegrityEnabled;
  return result;
}

- (void)updateTrustedAudioMetadata
{
  [(CSKappaDetectionService *)self getDataIntegrityBlock];
  unint64_t Stats = TrustedAudioHelper::getStats((TrustedAudioHelper *)(v15 + 128), self->_triggerAOPTime);
  *(void *)&self->_trustedAudioStats.double fractionalAudio = Stats;
  *(void *)&self->_trustedAudioStats.numEpochsMissingAudioAfterStart = v4;
  mslRecording = self->_mslRecording;
  v17[0] = @"fractionalAudioAvailability";
  long long v6 = +[NSNumber numberWithDouble:*(float *)&Stats];
  long long v7 = [v6 stringValue];
  v18[0] = v7;
  v17[1] = @"numEpochsMissingAudioAtStart";
  long long v8 = +[NSNumber numberWithInt:self->_trustedAudioStats.numEpochsMissingAudioAtStart];
  uint64_t v9 = [v8 stringValue];
  v18[1] = v9;
  v17[2] = @"numEpochsMissingAudioAfterStart";
  uint64_t v10 = +[NSNumber numberWithInt:self->_trustedAudioStats.numEpochsMissingAudioAfterStart];
  id v11 = [v10 stringValue];
  v18[2] = v11;
  v17[3] = @"preTriggerAudioSec";
  SEL v12 = +[NSNumber numberWithDouble:self->_trustedAudioStats.preTriggerAudioSec];
  shared_ptr<CLKappaFeaturesAlgDataIntegrity> v13 = [v12 stringValue];
  v18[3] = v13;
  unsigned int v14 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
  [(CSMSLDataRecording *)mslRecording updateMetadata:v14];

  if (v16) {
    sub_10000BB9C(v16);
  }
}

- (void)logAudioStats
{
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  char v3 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT))
  {
    double fractionalAudio = self->_trustedAudioStats.fractionalAudio;
    unsigned int numEpochsMissingAudioAtStart = self->_trustedAudioStats.numEpochsMissingAudioAtStart;
    unsigned int numEpochsMissingAudioAfterStart = self->_trustedAudioStats.numEpochsMissingAudioAfterStart;
    double preTriggerAudioSec = self->_trustedAudioStats.preTriggerAudioSec;
    int v8 = 134218752;
    double v9 = fractionalAudio;
    __int16 v10 = 1024;
    unsigned int v11 = numEpochsMissingAudioAtStart;
    __int16 v12 = 1024;
    unsigned int v13 = numEpochsMissingAudioAfterStart;
    __int16 v14 = 2048;
    double v15 = preTriggerAudioSec;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "fractionalAudio %f %d %d %f", (uint8_t *)&v8, 0x22u);
  }
}

- (void)sendLocalAudioToWatch
{
  value = self->fFlowControl.__ptr_.__value_;
  if (!value)
  {
    sub_1002D5418(0, a2);
LABEL_25:
    __break(1u);
LABEL_26:
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    goto LABEL_8;
  }
  if ((CLKappaAlgFlowController::isKappaFeaturesAlgLocalAudioEnabled(value) & 1) == 0)
  {
    sub_1002D5548();
    goto LABEL_25;
  }
  long long v7 = self->fFlowControl.__ptr_.__value_;
  uint64_t v8 = *((void *)v7 + 16);
  uint64_t v2 = (std::__shared_weak_count *)*((void *)v7 + 17);
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v8 + 160))(&v24);
  sub_10027C5CC((uint64_t)&v24, &v26);
  if (v25) {
    sub_10000BB9C(v25);
  }
  long long v9 = *(_OWORD *)(v26 + 120);
  long long v19 = *(_OWORD *)(v26 + 104);
  long long v20 = v9;
  long long v21 = *(_OWORD *)(v26 + 136);
  double v22 = *(double *)(v26 + 152);
  long long v10 = *(_OWORD *)(v26 + 88);
  long long v17 = *(_OWORD *)(v26 + 72);
  long long v18 = v10;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  *(void *)&long long v17 = self->_epochTimestamp;
  *((CFAbsoluteTime *)&v20 + 1) = Current;
  long long v21 = *(_OWORD *)&self->_lastEpochTime;
  double v4 = *(double *)&self->_triggerAOPTime;
  double v23 = v4;
  p_info = GPBUInt32Array.info;
  if (qword_1003DB6C0 != -1) {
    goto LABEL_26;
  }
LABEL_8:
  __int16 v12 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349312;
    double v29 = v22;
    __int16 v30 = 2050;
    double v31 = v4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "sending local audio results to companion %{public}llu %{public}llu", buf, 0x16u);
  }
  if (p_info[216] != (__objc2_class_ro *)-1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  unsigned int v13 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134351104;
    double v29 = *((float *)&v17 + 2);
    __int16 v30 = 2050;
    double v31 = *((float *)&v17 + 3);
    __int16 v32 = 2050;
    double v33 = *(float *)&v18;
    __int16 v34 = 2050;
    double v35 = *((float *)&v18 + 1);
    __int16 v36 = 1026;
    int v37 = BYTE8(v18);
    __int16 v38 = 1026;
    int v39 = BYTE9(v18);
    __int16 v40 = 1026;
    int v41 = BYTE10(v18);
    __int16 v42 = 1026;
    int v43 = BYTE11(v18);
    __int16 v44 = 1026;
    int v45 = BYTE13(v18);
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "sent local audio results (all): %{public}f %{public}f %{public}f %{public}f %{public}d %{public}d %{public}d %{public}d %{public}d", buf, 0x48u);
  }
  if (p_info[216] != (__objc2_class_ro *)-1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  __int16 v14 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134351104;
    double v29 = *((float *)&v17 + 2);
    __int16 v30 = 2050;
    double v31 = *(float *)&v19;
    __int16 v32 = 2050;
    double v33 = *((float *)&v19 + 1);
    __int16 v34 = 2050;
    double v35 = *((float *)&v19 + 2);
    __int16 v36 = 1026;
    int v37 = BYTE12(v19);
    __int16 v38 = 1026;
    int v39 = BYTE13(v19);
    __int16 v40 = 1026;
    int v41 = BYTE14(v19);
    __int16 v42 = 1026;
    int v43 = HIBYTE(v19);
    __int16 v44 = 1026;
    int v45 = BYTE1(v20);
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "sent [LA] results (roll): %{public}f %{public}f %{public}f %{public}f %{public}d %{public}d %{public}d %{public}d %{public}d", buf, 0x48u);
  }
  companionProxy = self->_companionProxy;
  long long v16 = +[NSData dataWithBytes:&v17 length:96];
  [(CSCompanionServiceProtocol *)companionProxy sendData:v16 type:2];

  if (v27) {
    sub_10000BB9C(v27);
  }
  if (v2) {
    sub_10000BB9C(v2);
  }
}

- (void)evaluateSamplingAlgFeatures
{
  value = self->fFlowControl.__ptr_.__value_;
  uint64_t v4 = *((void *)value + 18);
  uint64_t v5 = (std::__shared_weak_count *)*((void *)value + 19);
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v4 + 160))(&v24);
  sub_100021104((uint64_t)&v24, &v26);
  if (v25) {
    sub_10000BB9C(v25);
  }
  if (*(unsigned char *)(v26 + 80) || (self->_forceFeatureBitmap & 1) != 0) {
    self->_algFeatureBitmap |= 1u;
  }
  long long v6 = self->fFlowControl.__ptr_.__value_;
  uint64_t v7 = *((void *)v6 + 10);
  uint64_t v8 = (std::__shared_weak_count *)*((void *)v6 + 11);
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v7 + 160))(&v20);
  sub_1002C1170((uint64_t)&v20, &v22);
  if (v21) {
    sub_10000BB9C(v21);
  }
  if (*(unsigned char *)(v22 + 40) || (self->_forceFeatureBitmap & 2) != 0) {
    self->_algFeatureBitmap |= 2u;
  }
  long long v9 = self->fFlowControl.__ptr_.__value_;
  uint64_t v10 = *((void *)v9 + 6);
  unsigned int v11 = (std::__shared_weak_count *)*((void *)v9 + 7);
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(unsigned __int8 **__return_ptr))(*(void *)v10 + 320))(&v18);
  int v12 = v18[8];
  if (v19) {
    sub_10000BB9C(v19);
  }
  if (v12 || (self->_forceFeatureBitmap & 4) != 0) {
    self->_algFeatureBitmap |= 4u;
  }
  unsigned int v13 = self->fFlowControl.__ptr_.__value_;
  uint64_t v14 = *((void *)v13 + 40);
  double v15 = (std::__shared_weak_count *)*((void *)v13 + 41);
  if (v15) {
    atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v14 + 160))(&v16);
  sub_100292DB8((uint64_t)&v16, &v18);
  if (v17) {
    sub_10000BB9C(v17);
  }
  if (v18[316] && v18[296] || (self->_forceFeatureBitmap & 8) != 0) {
    self->_algFeatureBitmap |= 8u;
  }
  if (v19) {
    sub_10000BB9C(v19);
  }
  if (v15) {
    sub_10000BB9C(v15);
  }
  if (v11) {
    sub_10000BB9C(v11);
  }
  if (v23) {
    sub_10000BB9C(v23);
  }
  if (v8) {
    sub_10000BB9C(v8);
  }
  if (v27) {
    sub_10000BB9C(v27);
  }
  if (v5) {
    sub_10000BB9C(v5);
  }
}

- (void)populateSessionDetails
{
  value = self->fFlowControl.__ptr_.__value_;
  if (!value)
  {
    sub_1002D5678();
    __break(1u);
LABEL_94:
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    goto LABEL_45;
  }
  uint64_t v5 = self;
  uint64_t v11 = *((void *)value + 40);
  uint64_t v2 = (std::__shared_weak_count *)*((void *)value + 41);
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v11 + 160))(&v60);
  sub_100292DB8((uint64_t)&v60, &v62);
  if (v61) {
    sub_10000BB9C(v61);
  }
  if (*(unsigned char *)(v62 + 272)) {
    ++v5->_sessionDetails.numRolloverCrashes;
  }
  int v12 = v5->fFlowControl.__ptr_.__value_;
  uint64_t v13 = *((void *)v12 + 16);
  char v3 = (std::__shared_weak_count *)*((void *)v12 + 17);
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v13 + 160))(&v56);
  sub_10027C5CC((uint64_t)&v56, &v58);
  if (v57) {
    sub_10000BB9C(v57);
  }
  if (*(unsigned char *)(v58 + 101) || (v5->_forceFeatureBitmap & 0x10) != 0) {
    v5->_algFeatureBitmap |= 0x10u;
  }
  uint64_t v14 = v5->fFlowControl.__ptr_.__value_;
  uint64_t v15 = *((void *)v14 + 38);
  uint64_t v4 = (std::__shared_weak_count *)*((void *)v14 + 39);
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v15 + 160))(&v52);
  sub_1002B9338((uint64_t)&v52, &v54);
  if (v53) {
    sub_10000BB9C(v53);
  }
  if (*(unsigned char *)(v54 + 176)) {
    ++v5->_sessionDetails.numPlanarCrashes;
  }
  uint64_t v16 = v5->fFlowControl.__ptr_.__value_;
  uint64_t v17 = *((void *)v16 + 42);
  long long v6 = (std::__shared_weak_count *)*((void *)v16 + 43);
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v17 + 160))(&v48);
  sub_10027A988((uint64_t)&v48, &v50);
  if (v49) {
    sub_10000BB9C(v49);
  }
  char v18 = *(unsigned char *)(v50 + 32);
  if (v18)
  {
    if (v5->_sessionDetails.latchedHighSpeedCrash) {
      goto LABEL_29;
    }
    ++v5->_sessionDetails.numHighSpeedCrashes;
    char v18 = 1;
  }
  v5->_sessionDetails.latchedHighSpeedCrash = v18;
LABEL_29:
  long long v19 = v5->fFlowControl.__ptr_.__value_;
  uint64_t v20 = *((void *)v19 + 50);
  uint64_t v7 = (std::__shared_weak_count *)*((void *)v19 + 51);
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v20 + 160))(&v44);
  sub_100038EC8((uint64_t)&v44, &v46);
  if (v45) {
    sub_10000BB9C(v45);
  }
  uint64_t v21 = v46;
  unint64_t v22 = *(void *)(v46 + 40);
  if (v22) {
    v5->_sessionDetails.crashTimestamp = v22;
  }
  if (*(unsigned char *)(v21 + 48))
  {
    ++v5->_sessionDetails.numSevereCrashes;
    v5->_sessionDetails.severeCrashAOPTimestamp = *(void *)(v21 + 32);
  }
  p_info = GPBUInt32Array.info;
  uint64_t v8 = GPBUInt32Array.info;
  if (*(unsigned char *)(v21 + 49) && !v5->_sessionDetails.lendCompanionPunchThru)
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    double v23 = (id)qword_1003DB6C8;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "lending companion punch thru", buf, 2u);
    }

    v5->_sessionDetails.BOOL lendCompanionPunchThru = 1;
    uint64_t v24 = sub_10001B0A8();
    [(CSCompanionServiceProtocol *)v5->_companionProxy sendData:v24 type:402];
  }
  if (qword_1003DB6C0 != -1) {
    goto LABEL_94;
  }
LABEL_45:
  uint64_t v25 = v8[217];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    int v26 = *(unsigned __int8 *)(v46 + 49);
    BOOL lendCompanionPunchThru = v5->_sessionDetails.lendCompanionPunchThru;
    int v28 = *(unsigned __int8 *)(v46 + 51);
    int v29 = *(unsigned __int8 *)(v46 + 48);
    int v30 = *(unsigned __int8 *)(v46 + 53);
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)&uint8_t buf[4] = v26;
    LOWORD(v65) = 1024;
    *(_DWORD *)((char *)&v65 + 2) = lendCompanionPunchThru;
    HIWORD(v65) = 1024;
    int v66 = v28;
    __int16 v67 = 1024;
    int v68 = v29;
    __int16 v69 = 1024;
    int v70 = v30;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "punch thru early %d lend %d decided %d severe %d cand %d", buf, 0x20u);
  }

  uint64_t v31 = v46;
  char v32 = *(unsigned char *)(v46 + 51);
  if (v32)
  {
    if (*(unsigned char *)(v46 + 48)) {
      char v32 = 0;
    }
    else {
      char v32 = *(unsigned char *)(v46 + 53) == 0;
    }
  }
  if (v5->_sessionDetails.lendCompanionPunchThru)
  {
    char v33 = v32 ^ 1;
    if (v5->_sessionDetails.retractCompanionPunchThru) {
      char v33 = 1;
    }
    if ((v33 & 1) == 0)
    {
      if (p_info[216] != (__objc2_class_ro *)-1) {
        dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
      }
      __int16 v34 = v8[217];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "retracting companion punch thru", buf, 2u);
      }

      v5->_sessionDetails.retractCompanionPunchThru = 1;
      double v35 = sub_10001B37C();
      [(CSCompanionServiceProtocol *)v5->_companionProxy sendData:v35 type:403];

      uint64_t v31 = v46;
    }
  }
  v5->_sessionDetails.numDeescalationStatic = *(_DWORD *)(v31 + 104);
  v5->_sessionDetails.numDeescalationMoving = *(_DWORD *)(v31 + 88);
  v5->_sessionDetails.numDeescalationSteps = *(_DWORD *)(v31 + 108);
  v5->_sessionDetails.numDeescalationQuiescence = *(_DWORD *)(v31 + 92);
  v5->_sessionDetails.numDeescalationAutocorrelation = *(_DWORD *)(v31 + 84);
  v5->_sessionDetails.numDeescalationTriggerCluster = *(_DWORD *)(v31 + 112);
  *(void *)&v5->_sessionDetails.numDeescalationSkiingBaroAndAudio = *(void *)(v31 + 96);
  v5->_sessionDetails.numDeescalationUsha = *(_DWORD *)(v31 + 120);
  v5->_sessionDetails.numDeescalationAOI = *(_DWORD *)(v31 + 80);
  v5->_sessionDetails.numDeescalationTwoLevel = *(_DWORD *)(v31 + 116);
  v5->_sessionDetails.numDeescalationDistToRoad = *(_DWORD *)(v31 + 136);
  *(void *)&v5->_sessionDetails.numDeescalationMAP = *(void *)(v31 + 128);
  __int16 v36 = v5->fFlowControl.__ptr_.__value_;
  uint64_t v37 = *((void *)v36 + 18);
  __int16 v38 = (std::__shared_weak_count *)*((void *)v36 + 19);
  if (v38) {
    atomic_fetch_add_explicit(&v38->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v37 + 160))(&v42);
  sub_100021104((uint64_t)&v42, buf);
  if (v43) {
    sub_10000BB9C(v43);
  }
  uint64_t v39 = *(void *)buf;
  float v40 = *(float *)(*(void *)buf + 176);
  if (v40 > (float)v5->_sessionDetails.maxDeltaVXYBiggestImpact) {
    v5->_sessionDetails.maxDeltaVXYBiggestImpact = (int)v40;
  }
  float v41 = *(float *)(v39 + 168);
  if (v41 > (float)v5->_sessionDetails.maxDeltaVXYOverEpoch) {
    v5->_sessionDetails.maxDeltaVXYOverEpoch = (int)v41;
  }
  if (v65) {
    sub_10000BB9C(v65);
  }
  if (v38) {
    sub_10000BB9C(v38);
  }
  if (v47) {
    sub_10000BB9C(v47);
  }
  if (v7) {
    sub_10000BB9C(v7);
  }
  if (v51) {
    sub_10000BB9C(v51);
  }
  if (v6) {
    sub_10000BB9C(v6);
  }
  if (v55) {
    sub_10000BB9C(v55);
  }
  if (v4) {
    sub_10000BB9C(v4);
  }
  if (v59) {
    sub_10000BB9C(v59);
  }
  if (v3) {
    sub_10000BB9C(v3);
  }
  if (v63) {
    sub_10000BB9C(v63);
  }
  if (v2) {
    sub_10000BB9C(v2);
  }
}

- (void)onCloseEpoch:(unint64_t)a3 epochNumber:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  unint64_t v7 = +[CSTimeManager SPU_estimate_current_timestamp];
  self->_unint64_t epochTimestamp = a3;
  self->_int epochNumber = v4;
  self->_lastEpochTime = CFAbsoluteTimeGetCurrent();
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  uint64_t v8 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT))
  {
    int epochNumber = self->_epochNumber;
    unint64_t epochTimestamp = self->_epochTimestamp;
    v11[0] = 67240704;
    v11[1] = epochNumber;
    __int16 v12 = 2050;
    unint64_t v13 = epochTimestamp;
    __int16 v14 = 2050;
    unint64_t v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "close epoch %{public}d aop timestamp %{public}llu, %{public}llu", (uint8_t *)v11, 0x1Cu);
  }
  if (self->_isDetectionDevice)
  {
    [(CSKappaDetectionService *)self evaluatePossibleCrashDetectorDecision];
    [(CSKappaDetectionService *)self evaluateSamplingAlgFeatures];
    [(CSKappaDetectionService *)self populateSessionDetails];
    [(CSKappaDetectionService *)self updateTrustedAudioMetadata];
  }
  [(CSKappaDetectionService *)self sendLocalAudioToWatch];
  [(CSKappaDetectionService *)self sendRemoteSampleToCompanion:v7 epochTs:a3 epochNumber:v4];
}

- (void)sendRemoteSampleToCompanion:(unint64_t)a3 epochTs:(unint64_t)a4 epochNumber:(int)a5
{
  value = self->fFlowControl.__ptr_.__value_;
  if (value)
  {
    CLKappaAlgFlowController::createRemoteSample(value, (uint64_t)&v11);
    if (v14)
    {
      v11.i32[2] = a5;
      unint64_t v12 = a3;
      unint64_t v13 = a4;
      uint64_t v10 = sub_10001AC6C(&v11);
      [(CSCompanionServiceProtocol *)self->_companionProxy sendData:v10 type:401];
    }
  }
}

- (int64_t)daysSinceTimestamp:(double)a3
{
  char v3 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a3];
  uint64_t v4 = +[NSCalendar currentCalendar];
  uint64_t v5 = +[NSDate now];
  long long v6 = [v4 components:16 fromDate:v3 toDate:v5 options:0];

  id v7 = [v6 day];
  return (int64_t)v7;
}

- (BOOL)shouldKeepEarlyCrashTTR
{
  char v3 = +[CSPersistentConfiguration sharedConfiguration];
  unint64_t v4 = (unint64_t)[v3 getFloatDefault:@"KappaTTREarlyCrashPopupRate"];
  [v3 doubleForKey:@"KappaLastTTREarlyCrashTimestamp"];
  uint64_t v5 = -[CSKappaDetectionService daysSinceTimestamp:](self, "daysSinceTimestamp:");
  int v6 = v5;
  if ((v4 & 0xFF00000000) != 0) {
    float v7 = *(float *)&v4;
  }
  else {
    float v7 = 1.0;
  }
  if (v5 >= 1 && [(CSKappaDetectionService *)self coinflip:v7])
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    uint64_t v8 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 67109376;
      int v13 = v6;
      __int16 v14 = 2048;
      double v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[TTR] EarlyCrash alert cooldown expired daysSinceLast,%d,rate,%4.2f", (uint8_t *)&v12, 0x12u);
    }
    BOOL v9 = 1;
  }
  else
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    uint64_t v10 = qword_1003DB6C8;
    BOOL v9 = 0;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 67109376;
      int v13 = v6;
      __int16 v14 = 2048;
      double v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[TTR] EarlyCrash alert still cooling down daysSinceLast,%d,rate,%4.2f", (uint8_t *)&v12, 0x12u);
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (void)stop:(unint64_t)a3
{
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  float v7 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "stop the aop service", (uint8_t *)&buf, 2u);
  }
  CSAOPSvc::suppressTriggers((CSAOPSvc *)self->_aop, 1);
  CSAOPSvc::stopDetection((uint64_t)self->_aop);
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  uint64_t v8 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEBUG, "finalizing the session", (uint8_t *)&buf, 2u);
  }
  [(CSKappaDetectionService *)self stopSession];
  id v9 = [(CSKappaDetectionService *)self logAudioStats];
  uint64_t v10 = (__objc2_class_ro **)(GPBUInt32Array + 32);
  if (self->_detectionEvent >= 2)
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    int8x16_t v11 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "subsequent detection events cannot take tokens or update metadata", (uint8_t *)&buf, 2u);
    }
    goto LABEL_59;
  }
  value = self->fFlowControl.__ptr_.__value_;
  if (!value)
  {
    sub_1002D57A8(v9);
    __break(1u);
LABEL_65:
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    goto LABEL_20;
  }
  uint64_t v13 = *((void *)value + 50);
  uint64_t v8 = *((void *)value + 51);
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v13 + 160))(&v35);
  sub_100038EC8((uint64_t)&v35, v44);
  if (v36) {
    sub_10000BB9C(v36);
  }
  int v4 = *(unsigned __int8 *)(*(void *)v44 + 53);
  self->_deescalationBitmap = *(_DWORD *)(*(void *)v44 + 336);
  int KappaToken = getKappaToken(0);
  if (qword_1003DB6C0 != -1) {
    goto LABEL_65;
  }
LABEL_20:
  __int16 v14 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = KappaToken;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "tokenCnt = %d", (uint8_t *)&buf, 8u);
  }
  if (self->_SOSInProgress | v4)
  {
    p_info = (__objc2_class_ro **)(GPBUInt32Array + 32);
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    uint64_t v16 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
    {
      BOOL SOSInProgress = self->_SOSInProgress;
      LODWORD(buf) = 67109376;
      HIDWORD(buf) = SOSInProgress;
      __int16 v38 = 1024;
      int v39 = v4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "crash detected %d suppressed %d", (uint8_t *)&buf, 0xEu);
    }
  }
  else
  {
    p_info = GPBUInt32Array.info;
    if (KappaToken < 1)
    {
      if (!KappaToken)
      {
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        long long v19 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "forcefully stopping aop collection", (uint8_t *)&buf, 2u);
        }
        CSAOPSvc::forceStopCollection((CSAOPSvc *)self->_aop);
      }
    }
    else
    {
      if (qword_1003DB6C0 != -1) {
        dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
      }
      char v18 = qword_1003DB6C8;
      if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "acquiring kappa token", (uint8_t *)&buf, 2u);
      }
      getKappaToken(1);
    }
  }
  unsigned int v20 = *(unsigned __int8 *)(*(void *)v44 + 50);
  int v21 = *(unsigned __int8 *)(*(void *)v44 + 49);
  int v22 = *(unsigned __int8 *)(*(void *)v44 + 48);
  double v23 = [p_info + 166 sharedConfiguration];
  unint64_t v24 = (unint64_t)[v23 getFloatDefault:@"KappaTTREnableHighSens"];
  if ((v24 & 0xFF00000000) != 0) {
    float v25 = *(float *)&v24;
  }
  else {
    float v25 = 0.0;
  }
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  int v26 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT))
  {
    id buf = (id)__PAIR64__(v20, 67109888);
    __int16 v38 = 1024;
    int v39 = v21;
    __int16 v40 = 1024;
    BOOL v41 = v25 != 0.0;
    __int16 v42 = 1024;
    int v43 = v22;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[TTR] lowSens,%d,highSens,%d,highSensEnabled,%d,severe,%d", (uint8_t *)&buf, 0x1Au);
  }
  uint64_t v10 = GPBUInt32Array.info;
  if (![(CSKappaDetectionService *)self shouldKeepEarlyCrashTTR]) {
    goto LABEL_55;
  }
  if (!v20 || v22)
  {
    if (v22 || !v21 || v25 == 0.0) {
      goto LABEL_55;
    }
    int64_t v27 = 2;
  }
  else
  {
    int64_t v27 = 3;
  }
  self->_sessionDetails.ttrType = v27;
LABEL_55:

  if (v45) {
    sub_10000BB9C(v45);
  }
  if (v8) {
    sub_10000BB9C((std::__shared_weak_count *)v8);
  }
LABEL_59:
  id v28 = objc_initWeak(&buf, self);
  int v29 = (CLTimer *)[(CLSilo *)self->_silo newTimer];
  sosTimer = self->_sosTimer;
  self->_sosTimer = v29;

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1002CC260;
  v34[3] = &unk_1003AA5E8;
  v34[4] = self;
  v34[5] = a3;
  [(CLTimer *)self->_sosTimer setHandler:v34];
  uint64_t v31 = [v10 + 166 sharedConfiguration];
  id v32 = [v31 integerForKey:@"SOSTimeoutExpiration"];

  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  char v33 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v44 = 67109120;
    *(_DWORD *)&v44[4] = v32;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "setting sos timer expiration %d", v44, 8u);
  }
  [(CLTimer *)self->_sosTimer setNextFireDelay:(double)(uint64_t)v32 interval:1.79769313e308];

  objc_destroyWeak(&buf);
}

- (void)saveForceState:(int)a3 withValue:(int)a4
{
  if (a3 < 0x18)
  {
    self->_savedForceState[a3] = a4;
  }
  else
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    int v4 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "value not in range", v5, 2u);
    }
  }
}

- (void)forceCrashDetector:(int)a3 withValue:(int)a4
{
  value = self->fFlowControl.__ptr_.__value_;
  if (!value)
  {
    sub_1002D58D8();
    goto LABEL_51;
  }
  uint64_t v6 = *((void *)value + 38);
  int v4 = (std::__shared_weak_count *)*((void *)value + 39);
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (!v6)
  {
LABEL_51:
    sub_1002D5A08(buf, a2, *(void *)&a3, *(void *)&a4);

    abort_report_np();
    __break(1u);
LABEL_52:
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
LABEL_13:
    float v7 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id buf = 0;
      uint64_t v8 = "value must be 0/1";
LABEL_35:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, v8, buf, 2u);
      if (!v4) {
        return;
      }
    }
    else
    {
LABEL_45:
      if (!v4) {
        return;
      }
    }
LABEL_46:
    sub_10000BB9C(v4);
    return;
  }
  switch(a3)
  {
    case 0:
      if (a4 < 2)
      {
        sub_1002CC764(v6, a4 != 0);
      }
      else
      {
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        float v7 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id buf = 0;
          uint64_t v8 = "value must be 0/1";
          goto LABEL_35;
        }
      }
      goto LABEL_45;
    case 1:
      if (a4 < 2)
      {
        sub_1002CC83C(v6, a4 != 0);
      }
      else
      {
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        float v7 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id buf = 0;
          uint64_t v8 = "value must be 0/1";
          goto LABEL_35;
        }
      }
      goto LABEL_45;
    case 2:
      if (a4 >= 2)
      {
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        float v7 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id buf = 0;
          uint64_t v8 = "value must be 0/1";
          goto LABEL_35;
        }
        goto LABEL_45;
      }
      sub_1002CC914(v6, a4 != 0);
      if (v4) {
        goto LABEL_46;
      }
      return;
    case 3:
      if (a4 >= 2)
      {
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        float v7 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id buf = 0;
          uint64_t v8 = "value must be 0/1";
          goto LABEL_35;
        }
        goto LABEL_45;
      }
      sub_1002CC9EC(v6, a4 != 0);
      if (v4) {
        goto LABEL_46;
      }
      return;
    case 4:
      if (a4 >= 2)
      {
        if (qword_1003DB6C0 != -1) {
          goto LABEL_52;
        }
        goto LABEL_13;
      }
      sub_1002CCAC4(v6, a4 != 0);
      if (v4) {
        goto LABEL_46;
      }
      return;
    case 5:
      if ((a4 - 4) <= 0xFFFFFFFA)
      {
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        float v7 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id buf = 0;
          uint64_t v8 = "value not in range";
          goto LABEL_35;
        }
        goto LABEL_45;
      }
      sub_1002CCB9C(v6, a4);
      if (v4) {
        goto LABEL_46;
      }
      break;
    default:
      goto LABEL_45;
  }
}

- (void)forceHighSpeedCrashDetector:(int)a3 withValue:(int)a4
{
  value = self->fFlowControl.__ptr_.__value_;
  if (!value)
  {
    sub_1002D5B24();
    goto LABEL_52;
  }
  uint64_t v6 = *((void *)value + 42);
  int v4 = (std::__shared_weak_count *)*((void *)value + 43);
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (!v6)
  {
LABEL_52:
    sub_1002D5C54(buf, a2, *(void *)&a3, *(void *)&a4);

    abort_report_np();
    __break(1u);
LABEL_53:
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
LABEL_13:
    float v7 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id buf = 0;
LABEL_35:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "value must be 0/1", buf, 2u);
      if (!v4) {
        return;
      }
    }
    else
    {
LABEL_46:
      if (!v4) {
        return;
      }
    }
LABEL_47:
    sub_10000BB9C(v4);
    return;
  }
  switch(a3)
  {
    case 10:
      if (a4 >= 2)
      {
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        float v7 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id buf = 0;
          goto LABEL_35;
        }
        goto LABEL_46;
      }
      sub_1002CD028(v6, a4 != 0);
      if (v4) {
        goto LABEL_47;
      }
      return;
    case 11:
      if (a4 < 2)
      {
        sub_1002CD100(v6, a4 != 0);
      }
      else
      {
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        float v7 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id buf = 0;
          goto LABEL_35;
        }
      }
      goto LABEL_46;
    case 12:
      if (a4 >= 2)
      {
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        float v7 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id buf = 0;
          goto LABEL_35;
        }
        goto LABEL_46;
      }
      sub_1002CD1D8(v6, a4 != 0);
      if (v4) {
        goto LABEL_47;
      }
      return;
    case 13:
      if (a4 >= 2)
      {
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        float v7 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id buf = 0;
          goto LABEL_35;
        }
        goto LABEL_46;
      }
      sub_1002CD2B0(v6, a4 != 0);
      if (v4) {
        goto LABEL_47;
      }
      return;
    case 14:
      if (a4 >= 2)
      {
        if (qword_1003DB6C0 != -1) {
          goto LABEL_53;
        }
        goto LABEL_13;
      }
      sub_1002CD388(v6, a4 != 0);
      if (v4) {
        goto LABEL_47;
      }
      return;
    case 15:
      if (a4 >= 2)
      {
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        float v7 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id buf = 0;
          goto LABEL_35;
        }
        goto LABEL_46;
      }
      sub_1002CD460(v6, a4 != 0);
      if (v4) {
        goto LABEL_47;
      }
      break;
    default:
      goto LABEL_46;
  }
}

- (void)forceRolloverCrashDetector:(int)a3 withValue:(int)a4
{
  value = self->fFlowControl.__ptr_.__value_;
  if (!value)
  {
    sub_1002D5D70();
    goto LABEL_38;
  }
  uint64_t v6 = *((void *)value + 40);
  int v4 = (std::__shared_weak_count *)*((void *)value + 41);
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (!v6)
  {
LABEL_38:
    sub_1002D5EA0(buf, a2, *(void *)&a3, *(void *)&a4);

    abort_report_np();
    __break(1u);
LABEL_39:
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
LABEL_13:
    float v7 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id buf = 0;
      uint64_t v8 = "value must be 0/1";
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, v8, buf, 2u);
      if (!v4) {
        return;
      }
    }
    else
    {
LABEL_32:
      if (!v4) {
        return;
      }
    }
LABEL_33:
    sub_10000BB9C(v4);
    return;
  }
  switch(a3)
  {
    case 6:
      if (a4 < 2)
      {
        sub_1002CD7FC(v6, a4 != 0);
      }
      else
      {
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        float v7 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id buf = 0;
          uint64_t v8 = "value must be 0/1";
          goto LABEL_25;
        }
      }
      goto LABEL_32;
    case 7:
      if (a4 >= 2)
      {
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        float v7 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id buf = 0;
          uint64_t v8 = "value must be 0/1";
          goto LABEL_25;
        }
        goto LABEL_32;
      }
      sub_1002CD8D4(v6, a4 != 0);
      if (v4) {
        goto LABEL_33;
      }
      return;
    case 8:
      if (a4 >= 2)
      {
        if (qword_1003DB6C0 != -1) {
          goto LABEL_39;
        }
        goto LABEL_13;
      }
      sub_1002CD9AC(v6, a4 != 0);
      if (v4) {
        goto LABEL_33;
      }
      return;
    case 9:
      if ((a4 - 3) <= 0xFFFFFFFB)
      {
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        float v7 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id buf = 0;
          uint64_t v8 = "value not in range";
          goto LABEL_25;
        }
        goto LABEL_32;
      }
      sub_1002CDA84(v6, a4);
      if (v4) {
        goto LABEL_33;
      }
      break;
    default:
      goto LABEL_32;
  }
}

- (void)forceSevereCrashDetector:(int)a3 withValue:(int)a4
{
  value = self->fFlowControl.__ptr_.__value_;
  if (!value)
  {
    sub_1002D5FBC();
    goto LABEL_52;
  }
  uint64_t v6 = *((void *)value + 50);
  int v4 = (std::__shared_weak_count *)*((void *)value + 51);
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (!v6)
  {
LABEL_52:
    sub_1002D60EC(buf, a2, *(void *)&a3, *(void *)&a4);

    abort_report_np();
    __break(1u);
LABEL_53:
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
LABEL_13:
    float v7 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id buf = 0;
LABEL_35:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "value must be 0/1", buf, 2u);
      if (!v4) {
        return;
      }
    }
    else
    {
LABEL_46:
      if (!v4) {
        return;
      }
    }
LABEL_47:
    sub_10000BB9C(v4);
    return;
  }
  switch(a3)
  {
    case 16:
      if (a4 >= 2)
      {
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        float v7 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id buf = 0;
          goto LABEL_35;
        }
        goto LABEL_46;
      }
      sub_1002CDF18(v6, a4 != 0);
      if (v4) {
        goto LABEL_47;
      }
      return;
    case 17:
      if (a4 >= 2)
      {
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        float v7 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id buf = 0;
          goto LABEL_35;
        }
        goto LABEL_46;
      }
      sub_1002CDFF0(v6, a4 != 0);
      if (v4) {
        goto LABEL_47;
      }
      return;
    case 18:
      if (a4 >= 2)
      {
        if (qword_1003DB6C0 != -1) {
          goto LABEL_53;
        }
        goto LABEL_13;
      }
      sub_1002CE0C8(v6, a4 != 0);
      if (v4) {
        goto LABEL_47;
      }
      return;
    case 19:
      if (a4 < 2)
      {
        sub_1002CE1A0(v6, a4 != 0);
      }
      else
      {
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        float v7 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id buf = 0;
          goto LABEL_35;
        }
      }
      goto LABEL_46;
    case 20:
      if (a4 >= 2)
      {
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        float v7 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id buf = 0;
          goto LABEL_35;
        }
        goto LABEL_46;
      }
      sub_1002CE278(v6, a4 != 0);
      if (v4) {
        goto LABEL_47;
      }
      return;
    case 23:
      if (a4 >= 2)
      {
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        float v7 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id buf = 0;
          goto LABEL_35;
        }
        goto LABEL_46;
      }
      sub_1002CE350(v6, a4 != 0);
      if (v4) {
        goto LABEL_47;
      }
      break;
    default:
      goto LABEL_46;
  }
}

- (void)forceParticipatingInEscalation:(int)a3 withValue:(int)a4
{
  value = self->fFlowControl.__ptr_.__value_;
  if (!value)
  {
    sub_1002D6208(0, a2, *(void *)&a3, *(void *)&a4);
LABEL_12:
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
LABEL_5:
    uint64_t v5 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "value must be 0/1", v6, 2u);
    }
    return;
  }
  if (a3 != 22) {
    return;
  }
  if (a4 >= 2)
  {
    if (qword_1003DB6C0 == -1) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }

  sub_1002CE4F8((uint64_t)value, a4 != 0);
}

- (void)forceSamplingBits:(int)a3 withValue:(int)a4
{
  self->_forceFeatureBitmap = a4;
}

- (void)forceBehavior:(int)a3 withValue:(int)a4
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      -[CSKappaDetectionService forceCrashDetector:withValue:](self, "forceCrashDetector:withValue:");
      break;
    case 6:
    case 7:
    case 8:
    case 9:
      -[CSKappaDetectionService forceRolloverCrashDetector:withValue:](self, "forceRolloverCrashDetector:withValue:");
      break;
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
      -[CSKappaDetectionService forceHighSpeedCrashDetector:withValue:](self, "forceHighSpeedCrashDetector:withValue:");
      break;
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 23:
      -[CSKappaDetectionService forceSevereCrashDetector:withValue:](self, "forceSevereCrashDetector:withValue:");
      break;
    case 21:
      -[CSKappaDetectionService forceSamplingBits:withValue:](self, "forceSamplingBits:withValue:");
      break;
    case 22:
      -[CSKappaDetectionService forceParticipatingInEscalation:withValue:](self, "forceParticipatingInEscalation:withValue:");
      break;
    default:
      return;
  }
}

- (BOOL)coinflip:(double)a3
{
  if (a3 >= 0.0 && a3 <= 1.0)
  {
    double v7 = drand48();
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    double v8 = v7 * 100.0;
    double v9 = a3 * 100.0;
    uint64_t v10 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
    {
      int v12 = 134218240;
      double v13 = v8;
      __int16 v14 = 2048;
      double v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "coin flip = %f, rbound = %f", (uint8_t *)&v12, 0x16u);
    }
    LOBYTE(v6) = v8 <= v9 && v8 >= 0.0;
  }
  else
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    uint64_t v5 = qword_1003DB6C8;
    BOOL v6 = os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO);
    if (v6)
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "invalid rate specified", (uint8_t *)&v12, 2u);
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (float)querySamplingRate:(id)a3 withDefault:(float)a4
{
  id v5 = a3;
  BOOL v6 = +[CSPersistentConfiguration sharedConfiguration];
  double v7 = [v6 objectForKey:v5];
  if (v7)
  {
    [v6 floatForKey:v5];
    a4 = v8;
  }

  return a4;
}

- (float)querySamplingBin:(id)a3 atIndex:(int)a4 withDefault:(float)a5
{
  id v7 = a3;
  float v8 = +[CSPersistentConfiguration sharedConfiguration];
  uint64_t v9 = a4;
  uint64_t v10 = [v7 stringByAppendingFormat:@"%lu", a4];
  int8x16_t v11 = [v8 objectForKey:v10];
  if (v11)
  {
    LODWORD(v12) = 1120403456;
    *(float *)&double v13 = a5;
    [v8 algorithmThresholdNumber:v9 inArrayForKey:@"CurDetectionPhoneDetectionWatchAcceptanceRateBitmap" withMinValue:0.0 maxValue:v12 defaultValue:v13];
    a5 = v14;
  }

  return a5;
}

- (void)printSamplingDefaults
{
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  char v3 = (id)qword_1003DB6C8;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LODWORD(v4) = -1.0;
    [(CSKappaDetectionService *)self querySamplingRate:@"CurPairedLoggingAndDetectionAcceptanceRate" withDefault:v4];
    *(_DWORD *)id buf = 134217984;
    v20[0] = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "curation rate 2: %f", buf, 0xCu);
  }

  uint64_t v6 = 0;
  do
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    id v7 = (id)qword_1003DB6C8;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LODWORD(v8) = -1.0;
      [(CSKappaDetectionService *)self querySamplingBin:@"CurDetectionPhoneDetectionWatchAcceptanceRateBitmap" atIndex:v6 withDefault:v8];
      *(_DWORD *)id buf = 67109376;
      LODWORD(v20[0]) = v6;
      WORD2(v20[0]) = 2048;
      *(double *)((char *)v20 + 6) = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "curation bitmap %d: %f", buf, 0x12u);
    }

    uint64_t v6 = (v6 + 1);
  }
  while (v6 != 32);
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  uint64_t v10 = (id)qword_1003DB6C8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LODWORD(v11) = -1.0;
    [(CSKappaDetectionService *)self querySamplingRate:@"PerfDetectionPhoneDetectionWatchAcceptanceRate" withDefault:v11];
    *(_DWORD *)id buf = 134217984;
    v20[0] = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "performance sampling rate 1 %f", buf, 0xCu);
  }

  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  double v13 = (id)qword_1003DB6C8;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LODWORD(v14) = -1.0;
    [(CSKappaDetectionService *)self querySamplingRate:@"PerfLoggingPhoneDetectionWatchAcceptanceRate" withDefault:v14];
    *(_DWORD *)id buf = 134217984;
    v20[0] = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "performance sampling rate 2 %f", buf, 0xCu);
  }

  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  uint64_t v16 = (id)qword_1003DB6C8;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    LODWORD(v17) = -1.0;
    [(CSKappaDetectionService *)self querySamplingRate:@"PerfDetectionPhoneAcceptanceRate" withDefault:v17];
    *(_DWORD *)id buf = 134217984;
    v20[0] = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "performance sampling rate 3 %f", buf, 0xCu);
  }
}

- (BOOL)curationSampling
{
  if (self->_SOSInProgress)
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    double v4 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "curation sampling coinflip 1 1.0", buf, 2u);
    }
    self->_samplingBitmap |= 1u;
    return 1;
  }
  value = self->fFlowControl.__ptr_.__value_;
  if (value)
  {
    uint64_t v7 = *((void *)value + 50);
    uint64_t v2 = (std::__shared_weak_count *)*((void *)value + 51);
    if (v2) {
      atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    (*(void (**)(uint64_t *__return_ptr))(*(void *)v7 + 160))(&v20);
    sub_100038EC8((uint64_t)&v20, &v22);
    if (v21) {
      sub_10000BB9C(v21);
    }
    if (*(unsigned char *)(v22 + 53))
    {
      if (qword_1003DB6C0 == -1) {
        goto LABEL_14;
      }
      goto LABEL_41;
    }
    LODWORD(v8) = 1041865114;
    [(CSKappaDetectionService *)self querySamplingRate:@"CurPairedLoggingAndDetectionAcceptanceRate" withDefault:v8];
    float v11 = *(float *)&v10;
    if (!self->_isLoggingDevice || self->_companionDeviceType != 1)
    {
      if (!self->_isDetectionDevice) {
        goto LABEL_34;
      }
      if (self->_companionDeviceType) {
        goto LABEL_32;
      }
    }
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    float v12 = qword_1003DB6C8;
    double v13 = v11;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id buf = 134217984;
      *(double *)float v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "curation sampling coinflip 2 %f", buf, 0xCu);
    }
    if ([(CSKappaDetectionService *)self coinflip:v13]) {
      goto LABEL_33;
    }
    if (self->_isDetectionDevice)
    {
LABEL_32:
      if (self->_companionDeviceType == 1)
      {
        LODWORD(v10) = dword_10033F3F8[self->_algFeatureBitmap];
        -[CSKappaDetectionService querySamplingBin:atIndex:withDefault:](self, "querySamplingBin:atIndex:withDefault:", @"CurDetectionPhoneDetectionWatchAcceptanceRateBitmap", v10);
        float v15 = v14;
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        uint64_t v16 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
        {
          int algFeatureBitmap = self->_algFeatureBitmap;
          double v18 = v15;
          *(_DWORD *)id buf = 67109376;
          LODWORD(v25[0]) = algFeatureBitmap;
          WORD2(v25[0]) = 2048;
          *(double *)((char *)v25 + 6) = v18;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "curation sampling coinflip 3 alg rate for %d is %f", buf, 0x12u);
        }
        else
        {
          double v18 = v15;
        }
        if ([(CSKappaDetectionService *)self coinflip:v18]) {
          goto LABEL_33;
        }
      }
    }
LABEL_34:
    BOOL v5 = 0;
    goto LABEL_35;
  }
  sub_1002D6330();
  __break(1u);
LABEL_41:
  dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
LABEL_14:
  float v9 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "false positive (previous escalations) 1.0", buf, 2u);
  }
LABEL_33:
  self->_samplingBitmap |= 1u;
  BOOL v5 = 1;
LABEL_35:
  if (v23) {
    sub_10000BB9C(v23);
  }
  if (v2) {
    sub_10000BB9C(v2);
  }
  return v5;
}

- (BOOL)performanceSampling
{
  LODWORD(v2) = 1041865114;
  [(CSKappaDetectionService *)self querySamplingRate:@"PerfDetectionPhoneDetectionWatchAcceptanceRate" withDefault:v2];
  if (self->_isDetectionDevice && self->_companionDeviceType == 1)
  {
    float v5 = *(float *)&v4;
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    uint64_t v6 = qword_1003DB6C8;
    double v7 = v5;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
    {
      int v18 = 134217984;
      double v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "performance sampling coinflip 1 %f", (uint8_t *)&v18, 0xCu);
    }
    if ([(CSKappaDetectionService *)self coinflip:v7]) {
      goto LABEL_23;
    }
  }
  LODWORD(v4) = 1041865114;
  [(CSKappaDetectionService *)self querySamplingRate:@"PerfLoggingPhoneDetectionWatchAcceptanceRate" withDefault:v4];
  if (self->_isLoggingDevice && self->_companionDeviceType == 1)
  {
    float v9 = *(float *)&v8;
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    double v10 = qword_1003DB6C8;
    double v11 = v9;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
    {
      int v18 = 134217984;
      double v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "performance sampling coinflip 2 %f", (uint8_t *)&v18, 0xCu);
    }
    if ([(CSKappaDetectionService *)self coinflip:v11]) {
      goto LABEL_23;
    }
  }
  LODWORD(v8) = 1041865114;
  [(CSKappaDetectionService *)self querySamplingRate:@"PerfDetectionPhoneAcceptanceRate" withDefault:v8];
  if (self->_isDetectionDevice && (self->_companionDeviceType + 1) <= 1)
  {
    float v13 = v12;
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    float v14 = qword_1003DB6C8;
    double v15 = v13;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
    {
      int v18 = 134217984;
      double v19 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "performance sampling coinflip 3 %f", (uint8_t *)&v18, 0xCu);
    }
    BOOL v16 = [(CSKappaDetectionService *)self coinflip:v15];
    if (v16)
    {
LABEL_23:
      self->_samplingBitmap |= 2u;
      LOBYTE(v16) = 1;
    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }
  return v16;
}

- (BOOL)shouldUploadRecording
{
  unsigned __int8 v3 = [(CSKappaDetectionService *)self curationSampling];
  return v3 | [(CSKappaDetectionService *)self performanceSampling];
}

- (void)notifyCompanionOfUploadedCompanionUUID
{
  v5[0] = 0;
  v5[1] = 0;
  [(NSUUID *)self->_companionUUID getUUIDBytes:v5];
  companionProxy = self->_companionProxy;
  double v4 = +[NSData dataWithBytes:v5 length:16];
  [(CSCompanionServiceProtocol *)companionProxy sendData:v4 type:7];
}

- (void)resetSession
{
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  unsigned __int8 v3 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "resetSession", buf, 2u);
  }
  double v4 = +[CSPersistentConfiguration sharedConfiguration];
  id v43 = [v4 integerForKey:@"ServerConfigVersion"];

  float v5 = +[CSPersistentConfiguration sharedConfiguration];
  unsigned int v42 = [v5 BOOLForKey:@"UploadSerialNumberInMetadata"];

  value = self->fFlowControl.__ptr_.__value_;
  uint64_t v7 = *((void *)value + 50);
  double v8 = (std::__shared_weak_count *)*((void *)value + 51);
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  __int16 v40 = v8;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v7 + 160))(&v44);
  sub_100038EC8((uint64_t)&v44, buf);
  if (v45) {
    sub_10000BB9C(v45);
  }
  mslRecording = self->_mslRecording;
  v56[0] = @"configServerVersionNumber";
  BOOL v41 = +[NSNumber numberWithInteger:v43];
  v57[0] = v41;
  v56[1] = @"curationAlgBitmap";
  double v10 = +[NSNumber numberWithUnsignedChar:self->_algFeatureBitmap];
  v57[1] = v10;
  v56[2] = @"severeCrashDetectorDecision";
  double v11 = +[NSNumber numberWithBool:self->_sessionDetails.numSevereCrashes > 0];
  v57[2] = v11;
  v56[3] = @"severeCrashTimestamp";
  float v12 = +[NSNumber numberWithUnsignedLongLong:self->_sessionDetails.severeCrashAOPTimestamp];
  v57[3] = v12;
  v56[4] = @"algsEndTimestamp";
  float v13 = +[NSNumber numberWithUnsignedLongLong:self->_sessionDetails.algsEndTimestamp];
  v57[4] = v13;
  v56[5] = @"deescalationPath";
  float v14 = +[NSNumber numberWithUnsignedShort:self->_deescalationBitmap];
  v57[5] = v14;
  v56[6] = @"escalationCandidateSuppressed";
  double v15 = +[NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)buf + 53)];
  v57[6] = v15;
  v56[7] = @"crashTimestamp";
  BOOL v16 = +[NSNumber numberWithUnsignedLongLong:self->_sessionDetails.crashTimestamp];
  v57[7] = v16;
  double v17 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:8];
  [(CSMSLDataRecording *)mslRecording updateMetadata:v17];

  if (v42)
  {
    int v18 = +[CSPlatformInfo sharedInstance];
    double v19 = [v18 getSerialNumber];

    uint64_t v20 = self->_mslRecording;
    CFStringRef v54 = @"serialNumber";
    BOOL v55 = v19;
    int v21 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    [(CSMSLDataRecording *)v20 updateMetadata:v21];
  }
  if (self->_checkForPOI)
  {
    uint64_t v22 = self->_mslRecording;
    CFStringRef v52 = @"LOIHint";
    double v23 = +[NSNumber numberWithBool:self->_isNearAmusementParkPOI];
    BOOL v53 = v23;
    unint64_t v24 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    [(CSMSLDataRecording *)v22 updateMetadata:v24];
  }
  self->_deescalationBitmap = 0;
  self->_sessionDetails.serverConfigVersion = (float)(uint64_t)v43;
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  float v25 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT))
  {
    int samplingBitmap = self->_samplingBitmap;
    *(_DWORD *)uint64_t v50 = 67240192;
    int v51 = samplingBitmap;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "sampling bitmap %{public}d", v50, 8u);
  }
  if (self->_canCollectData)
  {
    unsigned int v27 = [(CSKappaDetectionService *)self shouldUploadRecording];
    id v28 = [(CSMSLDataRecording *)self->_mslRecording metadata];
    int v29 = [v28 objectForKey:@"shouldUploadIndependentlyOfSOS"];

    if (v29) {
      unsigned int v27 = [v29 isEqual:&off_1003C1B90];
    }
    if (self->_companionUUID && ((v27 & 1) != 0 || self->_tellCompanionToUpload))
    {
      if (qword_1003DB6C0 != -1) {
        dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
      }
      int v30 = qword_1003DB6C8;
      if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v50 = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Notifying companion of UUID for upload", v50, 2u);
      }
      [(CSKappaDetectionService *)self notifyCompanionOfUploadedCompanionUUID];
      companionUUID = self->_companionUUID;
      self->_companionUUID = 0;
    }
    id v32 = self->_mslRecording;
    v48[0] = @"samplingBitmap";
    char v33 = +[NSNumber numberWithUnsignedChar:self->_samplingBitmap];
    __int16 v34 = &off_1003C1B90;
    v48[1] = @"shouldUploadIndependentlyOfSOS";
    v49[0] = v33;
    if (!v27) {
      __int16 v34 = &off_1003C1BA8;
    }
    v49[1] = v34;
    uint64_t v35 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];
    [(CSMSLDataRecording *)v32 updateMetadata:v35];
  }
  __int16 v36 = +[NSData dataWithBytes:&self->_sessionDetails length:160];
  [(CSKappaDetectionService *)self updateKappaSessionClients:9 data:v36];

  self->_double companionTriggerTime = 0.0;
  self->_inSession = 0;
  companionUUIDPreSession = self->_companionUUIDPreSession;
  self->_companionUUIDPreSession = 0;

  __int16 v38 = self->_kappaCompanionUUID.__ptr_.__value_;
  self->_kappaCompanionUUID.__ptr_.__value_ = 0;
  if (v38) {
    sub_100012E84((uint64_t)&self->_kappaCompanionUUID, (uint64_t)v38);
  }
  [(CLTimer *)self->_triggerTimer setNextFireDelay:1.79769313e308 interval:1.79769313e308];
  int v39 = self->fFlowControl.__ptr_.__value_;
  self->fFlowControl.__ptr_.__value_ = 0;
  if (v39) {
    (*(void (**)(CLKappaAlgFlowController *))(*(void *)v39 + 8))(v39);
  }
  CSAOPSvc::suppressTriggers((CSAOPSvc *)self->_aop, 0);
  if (v47) {
    sub_10000BB9C(v47);
  }
  if (v40) {
    sub_10000BB9C(v40);
  }
}

- (void)stopSession
{
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  unsigned __int8 v3 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "stop session", v15, 2u);
  }
  companionUUID = self->_companionUUID;
  if (companionUUID
    && (float v5 = self->_mslRecording,
        CFStringRef v20 = @"companionUUID",
        int v21 = companionUUID,
        +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1], uint64_t v6 = objc_claimAutoreleasedReturnValue(), [(CSMSLDataRecording *)v5 updateMetadata:v6], v6, self->_companionUUID))
  {
    mslRecording = self->_mslRecording;
    CFStringRef v16 = @"collectionUUID";
    double v8 = [(NSUUID *)self->_uuid UUIDString];
    double v17 = v8;
    float v9 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    [(CSMSLDataRecording *)mslRecording updateMetadata:v9];
  }
  else
  {
    double v10 = self->_mslRecording;
    CFStringRef v18 = @"collectionUUID";
    double v8 = [(NSUUID *)self->_uuid UUIDString];
    double v19 = v8;
    float v9 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    [(CSMSLDataRecording *)v10 updateMetadata:v9];
  }

  self->_sessionDetails.trigger_bitmap = self->_triggerPathBitmap;
  double v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  value = self->fFlowControl.__ptr_.__value_;
  if (value)
  {
    CLKappaAlgFlowController::finalizeAlgBlocks(value);
    CLKappaAlgFlowController::fetchAlgBlocksMeta(self->fFlowControl.__ptr_.__value_, v11);
  }
  [(CSMSLDataRecording *)self->_mslRecording updateMetadata:v11];
  if (self->_canCollectData)
  {
    float v13 = +[CSPermissions sharedInstance];
    unsigned __int8 v14 = [v13 isAuthorizedToCollectData];

    if ((v14 & 1) == 0) {
      self->_BOOL canCollectData = 0;
    }
  }
  [(CSKappaDetectionService *)self updateKappaSessionClients:3 data:0];
}

- (BOOL)isIdle
{
  return [(CSHSMObjc *)self->_hsm isIn:self->_idleState];
}

- (void)finishAnomalyEvent
{
  self->_int detectionEvent = 0;
  [(CSKappaDetectionService *)self decideToShowTTR];
}

- (void)decideToShowTTR
{
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  unsigned __int8 v3 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT))
  {
    int64_t ttrType = self->_sessionDetails.ttrType;
    v12[0] = 67109120;
    v12[1] = ttrType;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[TTR] Deciding if to show TTR: type,%d", (uint8_t *)v12, 8u);
  }
  float v5 = +[CSPlatformInfo sharedInstance];
  unsigned int v6 = [v5 isInternalInstall];

  if (v6)
  {
    uint64_t v7 = +[CSPersistentConfiguration sharedConfiguration];
    int64_t v8 = self->_sessionDetails.ttrType;
    if ((unint64_t)(v8 - 2) >= 2)
    {
      if (v8 != 4)
      {
LABEL_11:

        return;
      }
      ttr = self->_ttr;
      double v10 = [(NSUUID *)self->_uuid UUIDString];
      [(CSKappaTap2Radar *)ttr enqueueTTRWithTriggerUUID:v10 error:0];
    }
    else
    {
      [v7 setDouble:@"KappaLastTTREarlyCrashTimestamp" forKey:CFAbsoluteTimeGetCurrent()];
      float v9 = self->_ttr;
      double v10 = [(NSUUID *)self->_uuid UUIDString];
      [(CSKappaTap2Radar *)v9 showTTRWithTriggerUUID:v10 andEventType:self->_sessionDetails.ttrType];
    }

    goto LABEL_11;
  }
}

- (void)setRecording:(id)a3 withUUID:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (self->_hsm)
  {
    p_info = GPBUInt32Array.info;
    if (qword_1003DB6C0 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    sub_1002D6460(buf);

    abort_report_np();
    __break(1u);
  }
  dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
LABEL_3:
  double v10 = (id)qword_1003DB6C8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v8;
    unsigned int v12 = [(CSHSMObjc *)self->_hsm isIn:self->_idleState];
    unsigned int v13 = [(CSHSMObjc *)self->_hsm isIn:self->_readingState];
    unsigned int v14 = [(CSHSMObjc *)self->_hsm isIn:self->_waitForSOSState];
    unsigned int v15 = [(CSHSMObjc *)self->_hsm isIn:self->_waitForPOIState];
    *(_DWORD *)id buf = 67109888;
    *(_DWORD *)&uint8_t buf[4] = v12;
    __int16 v18 = 1024;
    unsigned int v19 = v13;
    __int16 v20 = 1024;
    unsigned int v21 = v14;
    __int16 v22 = 1024;
    unsigned int v23 = v15;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "set recording state %d %d %d %d", buf, 0x1Au);
    id v8 = v11;
    p_info = GPBUInt32Array.info;
  }

  if ([(CSHSMObjc *)self->_hsm isIn:self->_idleState])
  {
    objc_storeStrong((id *)&self->_mslRecording, a3);
    objc_storeStrong((id *)&self->_uuid, a4);
  }
  else
  {
    if (p_info[216] != (__objc2_class_ro *)-1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    CFStringRef v16 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "recording details may only be set in idle", buf, 2u);
    }
  }
}

- (void)setUploader:(id)a3
{
}

- (void)dumpSample:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    float v5 = (id)qword_1003DB6C8;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    unsigned int v6 = (*(void **)[v4 c_struct]);
    float v7 = *((float *)[v4 c_struct] + 2);
    float v8 = *((float *)[v4 c_struct] + 3);
    double v9 = *((float *)[v4 c_struct] + 4);
    int v57 = 134218752;
    id v58 = v6;
    __int16 v59 = 2048;
    *(double *)uint64_t v60 = v7;
    *(_WORD *)&v60[8] = 2048;
    *(double *)BOOL v61 = v8;
    *(_WORD *)&v61[8] = 2048;
    double v62 = v9;
    double v10 = "accel800 %llu x %.7f y %.7f z %.7f\n";
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v3;
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    float v5 = (id)qword_1003DB6C8;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    unsigned int v12 = *(void **)[v11 c_struct];
    float v13 = *((float *)[v11 c_struct] + 2);
    float v14 = *((float *)[v11 c_struct] + 3);
    double v15 = *((float *)[v11 c_struct] + 4);
    int v57 = 134218752;
    id v58 = v12;
    __int16 v59 = 2048;
    *(double *)uint64_t v60 = v13;
    *(_WORD *)&v60[8] = 2048;
    *(double *)BOOL v61 = v14;
    *(_WORD *)&v61[8] = 2048;
    double v62 = v15;
    double v10 = "hgaccel %llu x %.7f y %.7f z %.7f\n";
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v3;
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    float v5 = (id)qword_1003DB6C8;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    double v17 = *(void **)[v16 c_struct];
    float v18 = *((float *)[v16 c_struct] + 2);
    float v19 = *((float *)[v16 c_struct] + 3);
    double v20 = *((float *)[v16 c_struct] + 4);
    int v57 = 134218752;
    id v58 = v17;
    __int16 v59 = 2048;
    *(double *)uint64_t v60 = v18;
    *(_WORD *)&v60[8] = 2048;
    *(double *)BOOL v61 = v19;
    *(_WORD *)&v61[8] = 2048;
    double v62 = v20;
    double v10 = "accel %llu x %.7f y %.7f z %.7f\n";
LABEL_16:
    unsigned int v21 = v5;
    uint32_t v22 = 42;
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v57, v22);
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = v3;
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    float v5 = (id)qword_1003DB6C8;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    unint64_t v24 = (void *)*((*v23).c_struct + 1);
    int v57 = 134217984;
    id v58 = v24;
    double v10 = "trigger %llu\n";
    unsigned int v21 = v5;
    uint32_t v22 = 12;
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v25 = v3;
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    float v5 = (id)qword_1003DB6C8;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    int v26 = *(void **)((char *)[v25 c_struct] + 42);
    float v27 = [v25 c_struct];
    float v28 = [v25 c_struct][1];
    float v29 = *((float *)[v25 c_struct] + 2);
    float v30 = *((float *)[v25 c_struct] + 3);
    float v31 = [v25 c_struct][4];
    float v32 = *((float *)[v25 c_struct] + 5);
    float v33 = *((float *)[v25 c_struct] + 6);
    int v57 = 134219776;
    id v58 = v26;
    __int16 v59 = 2048;
    *(double *)uint64_t v60 = v27;
    *(_WORD *)&v60[8] = 2048;
    *(double *)BOOL v61 = v28;
    *(_WORD *)&v61[8] = 2048;
    double v62 = v29;
    __int16 v63 = 2048;
    double v64 = v30;
    __int16 v65 = 2048;
    double v66 = v31;
    __int16 v67 = 2048;
    double v68 = v32;
    __int16 v69 = 2048;
    double v70 = v33;
    double v10 = "dm6 %llu %.7f %.7f %.7f %.7f %.7f %.7f %.7f\n";
    unsigned int v21 = v5;
    uint32_t v22 = 82;
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v34 = v3;
    float v5 = sub_1002C5BE4();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    uint64_t v35 = (void *)*((*(v34->c_struct) + 5));
    uint64_t v36 = (*(v34->c_struct) + 8);
    float v37 = [v34 c_struct];
    float v38 = *((float *)[v34 c_struct] + 1);
    float v39 = *((float *)[v34 c_struct] + 2);
    double v40 = *((float *)[v34 c_struct] + 3);
    int v57 = 134219264;
    id v58 = v35;
    __int16 v59 = 2048;
    *(void *)uint64_t v60 = v36;
    *(_WORD *)&v60[8] = 2048;
    *(double *)BOOL v61 = v37;
    *(_WORD *)&v61[8] = 2048;
    double v62 = v38;
    __int16 v63 = 2048;
    double v64 = v39;
    __int16 v65 = 2048;
    double v66 = v40;
    double v10 = "gps %llu %f %.7f %.7f %.7f %.7f\n";
    unsigned int v21 = v5;
    uint32_t v22 = 62;
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v41 = v3;
    float v5 = sub_1002C5BE4();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    unsigned int v42 = *(void **)[v41 c_struct];
    int v43 = *((_DWORD *)[v41 c_struct] + 2);
    int v44 = *((_DWORD *)[v41 c_struct] + 3);
    float v45 = *((float *)[v41 c_struct] + 4);
    int v46 = *((unsigned __int8 *)[v41 c_struct] + 20);
    int v57 = 134219008;
    id v58 = v42;
    __int16 v59 = 1024;
    *(_DWORD *)uint64_t v60 = v43;
    *(_WORD *)&v60[4] = 1024;
    *(_DWORD *)&v60[6] = v44;
    *(_WORD *)BOOL v61 = 2048;
    *(double *)&v61[2] = v45;
    LOWORD(v62) = 1024;
    *(_DWORD *)((char *)&v62 + 2) = v46;
    double v10 = "steps %llu %d %d %.7f %d\n";
    unsigned int v21 = v5;
    uint32_t v22 = 40;
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v47 = v3;
    float v5 = sub_1002C5BE4();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    uint64_t v48 = *(void **)[v47 c_struct];
    double v49 = *((float *)[v47 c_struct] + 2);
    int v57 = 134218240;
    id v58 = v48;
    __int16 v59 = 2048;
    *(double *)uint64_t v60 = v49;
    double v10 = "SPL %llu %f\n";
    goto LABEL_42;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v50 = v3;
    float v5 = sub_1002C5BE4();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    int v51 = *(void **)[v50 c_struct];
    double v52 = *((float *)[v50 c_struct] + 2);
    int v57 = 134218240;
    id v58 = v51;
    __int16 v59 = 2048;
    *(double *)uint64_t v60 = v52;
    double v10 = "pressure %llu %f\n";
    goto LABEL_42;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v53 = v3;
    float v5 = sub_1002C5BE4();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    int v57 = 134218240;
    id v58 = [v53 timestamp];
    __int16 v59 = 1024;
    *(_DWORD *)uint64_t v60 = [v53 type];
    double v10 = "SUI %llu %u\n";
    unsigned int v21 = v5;
    uint32_t v22 = 18;
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_19;
  }
  id v54 = v3;
  float v5 = sub_1002C5BE4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    BOOL v55 = *(void **)[v54 c_struct];
    uint64_t v56 = *([v54 c_struct] + 1);
    int v57 = 134218240;
    id v58 = v55;
    __int16 v59 = 2048;
    *(void *)uint64_t v60 = v56;
    double v10 = "roads %llu %f\n";
LABEL_42:
    unsigned int v21 = v5;
    uint32_t v22 = 22;
    goto LABEL_17;
  }
LABEL_18:

LABEL_19:
}

- (void)sosActivated
{
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  id v3 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
  {
    BOOL inSession = self->_inSession;
    mslRecording = self->_mslRecording;
    v8[0] = 67109376;
    v8[1] = inSession;
    __int16 v9 = 2048;
    double v10 = mslRecording;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "sosActivated _inSession %d _mslRecording %p", (uint8_t *)v8, 0x12u);
  }
  if (self->_inSession && (unsigned int v6 = self->_mslRecording) != 0)
  {
    [(CSMSLDataRecording *)v6 updateMetadata:&off_1003C3630];
  }
  else
  {
    float v7 = [[CSStudiesServerUploadOutOfBandMetadata alloc] initWithLookingBack:&off_1003C3658 keyValuePairs:900.0];
    [(CSStudiesServerUploader *)self->_uploader addOutOfBandMetadata:v7 error:0];
  }
  self->_tellCompanionToUpload = 1;
}

- (void)feedAccel800:(id)a3
{
  id v4 = (CSSPUAccel800 *)a3;
  float v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedFastAccel(self->fFlowControl.__ptr_.__value_, v4);
  }
  else
  {
    sub_1002D657C(&v6);

    abort_report_np();
    __break(1u);
  }
}

- (void)feedHgAccel:(id)a3
{
  id v4 = (CSSPUHgAccel *)a3;
  float v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedHgAccel(self->fFlowControl.__ptr_.__value_, v4);
  }
  else
  {
    sub_1002D6698(&v6);

    abort_report_np();
    __break(1u);
  }
}

- (void)feedAccel:(id)a3
{
  id v3 = a3;
  if (v3)
  {
  }
  else
  {
    id v4 = (CSKappaDetectionService *)sub_1002D67B4();
    [(CSKappaDetectionService *)v4 feedDeviceMotion:v6];
  }
}

- (void)feedDeviceMotion:(id)a3
{
  id v4 = (CSSPUDM *)a3;
  SEL v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedDM(self->fFlowControl.__ptr_.__value_, v4);
  }
  else
  {
    sub_1002D68E4(&v6);

    abort_report_np();
    __break(1u);
  }
}

- (void)feedGPS:(id)a3
{
  SEL v5 = (CSSPUGps *)a3;
  id v6 = v5;
  if (!v5)
  {
    sub_1002D6A00(&v15);

    abort_report_np();
    __break(1u);
    goto LABEL_20;
  }
  if (*((_DWORD *)[(CSSPUGps *)v5 c_struct] + 15) != 3)
  {
LABEL_5:
    if (!self->_gpsCount)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      LODWORD(Current) = sunElevationDeg(Current, *((float *)[(CSSPUGps *)v6 c_struct] + 4), *((float *)[(CSSPUGps *)v6 c_struct] + 5));
      int v8 = *((unsigned __int8 *)[(CSSPUGps *)v6 c_struct] + 32);
      self->_sessionDetails.sunElevation = *(float *)&Current;
      self->_sessionDetails.signalEnvironment = v8;
      ++self->_gpsCount;
    }
    if (CSAOPSvc::isRecording((CSAOPSvc *)self->_aop))
    {
      int v9 = self->_gpsCount + 1;
      self->_gpsCount = v9;
      self->_sessionDetails.gpsCount = v9;
    }
    objc_storeStrong((id *)&self->_poiGpsSample, a3);
    CLKappaAlgFlowController::feedGPS(self->fFlowControl.__ptr_.__value_, v6);
    goto LABEL_10;
  }
  if (!self->_shouldFeedAccessoryGPS)
  {
    if (qword_1003DB6C0 == -1)
    {
LABEL_12:
      double v10 = qword_1003DB6C8;
      if (!os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_10;
      }
      __int16 v14 = 0;
      id v11 = "ignoring gps accessory";
      unsigned int v12 = (uint8_t *)&v14;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, v11, v12, 2u);
      goto LABEL_10;
    }
LABEL_20:
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    goto LABEL_12;
  }
  if (self->_triggerAOPHasBTCarplay) {
    goto LABEL_5;
  }
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  double v10 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id buf = 0;
    id v11 = "ignoring gps accessory when btHint=0";
    unsigned int v12 = buf;
    goto LABEL_18;
  }
LABEL_10:
}

- (void)feedSteps:(id)a3
{
  id v4 = (CSSPUSteps *)a3;
  SEL v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedSteps(self->fFlowControl.__ptr_.__value_, v4);
  }
  else
  {
    sub_1002D6B1C(&v6);

    abort_report_np();
    __break(1u);
  }
}

- (void)feedKappaTrigger:(id)a3
{
  id v4 = (CSSPUKappaTrigger *)a3;
  SEL v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedTrigger(self->fFlowControl.__ptr_.__value_, v4);
  }
  else
  {
    sub_1002D6C38(&v6);

    abort_report_np();
    __break(1u);
  }
}

- (void)feedMag:(id)a3
{
  id v3 = a3;
  if (v3)
  {
  }
  else
  {
    id v4 = (CSKappaDetectionService *)sub_1002D6D54();
    [(CSKappaDetectionService *)v4 feedPressure:v6];
  }
}

- (void)feedPressure:(id)a3
{
  id v4 = (CSSPUPressure *)a3;
  SEL v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedPressure(self->fFlowControl.__ptr_.__value_, v4);
  }
  else
  {
    sub_1002D6E84(&v6);

    abort_report_np();
    __break(1u);
  }
}

- (void)feedSoundPressureLevel:(id)a3
{
  id v4 = (CSSPUSpl *)a3;
  SEL v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedAudioRms(self->fFlowControl.__ptr_.__value_, v4);
  }
  else
  {
    sub_1002D6FA0(&v6);

    abort_report_np();
    __break(1u);
  }
}

- (void)feedTrustedAudioResult:(id)a3
{
  id v4 = (CSSPUTrustedAudioResult *)a3;
  SEL v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedTrustedAudioResult(self->fFlowControl.__ptr_.__value_, v4);
  }
  else
  {
    sub_1002D70BC(&v6);

    abort_report_np();
    __break(1u);
  }
}

- (void)feedSignificantUserInteraction:(id)a3
{
  id v3 = a3;
  if (v3)
  {
  }
  else
  {
    id v4 = (CSKappaDetectionService *)sub_1002D71D8();
    [(CSKappaDetectionService *)v4 feedRoads:v6];
  }
}

- (void)feedRoads:(id)a3
{
  id v4 = (CSSPURoadInfo *)a3;
  SEL v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedRoads(self->fFlowControl.__ptr_.__value_, v4);
  }
  else
  {
    sub_1002D7308(&v6);

    abort_report_np();
    __break(1u);
  }
}

- (void)feedHertzSample:(id)a3
{
  id v4 = (CSSPUHertzSample *)a3;
  SEL v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedHertzSample(self->fFlowControl.__ptr_.__value_, v4);
  }
  else
  {
    sub_1002D7424(&v6);

    abort_report_np();
    __break(1u);
  }
}

- (void)feedCompanionStatus:(id)a3
{
  id v4 = (CSCompanionStatus *)a3;
  SEL v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedCompanionStatus(self->fFlowControl.__ptr_.__value_, v4);
  }
  else
  {
    sub_1002D7540(&v6);

    abort_report_np();
    __break(1u);
  }
}

- (void)feedRemoteSample:(id)a3
{
  id v4 = (CSRemoteSample *)a3;
  SEL v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedRemoteSample(self->fFlowControl.__ptr_.__value_, v4);
  }
  else
  {
    sub_1002D765C(&v6);

    abort_report_np();
    __break(1u);
  }
}

- (void)consumeSampleArray:(id)a3
{
  id v4 = a3;
  for (unint64_t i = 0; (unint64_t)[v4 count] > i; ++i)
  {
    value = self->fFlowControl.__ptr_.__value_;
    if (!value)
    {
      sub_1002D7778(buf);

      abort_report_np();
      __break(1u);
LABEL_51:
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
LABEL_47:
      id v11 = qword_1003DB6C8;
      if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "stop consuming samples", buf, 2u);
      }
      break;
    }
    if (!*((unsigned char *)value + 8))
    {
      if (qword_1003DB6C0 == -1) {
        goto LABEL_47;
      }
      goto LABEL_51;
    }
    float v7 = [v4 objectAtIndexedSubscript:i];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = v7;
      [(CSKappaDetectionService *)self feedAccel800:v8];
LABEL_31:

      goto LABEL_32;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = v7;
      [(CSKappaDetectionService *)self feedAccel:v8];
      goto LABEL_31;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = v7;
      [(CSKappaDetectionService *)self feedHgAccel:v8];
      goto LABEL_31;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = v7;
      if ((char)[v8 meta] < 0)
      {
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        int v9 = (id)qword_1003DB6C8;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          id v10 = [v8 timestamp];
          *(_DWORD *)id buf = 134217984;
          *(void *)&uint8_t buf[4] = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "ignoring stop trigger from aop %llu", buf, 0xCu);
        }
      }
      else
      {
        [(CSKappaDetectionService *)self feedKappaTrigger:v8];
      }
      goto LABEL_31;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = v7;
      [(CSKappaDetectionService *)self feedDeviceMotion:v8];
      goto LABEL_31;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = v7;
      [(CSKappaDetectionService *)self feedGPS:v8];
      goto LABEL_31;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = v7;
      [(CSKappaDetectionService *)self feedSteps:v8];
      goto LABEL_31;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = v7;
      [(CSKappaDetectionService *)self feedSoundPressureLevel:v8];
      goto LABEL_31;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = v7;
      [(CSKappaDetectionService *)self feedTrustedAudioResult:v8];
      goto LABEL_31;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = v7;
      [(CSKappaDetectionService *)self feedPressure:v8];
      goto LABEL_31;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(CSKappaDetectionService *)self feedSignificantUserInteraction:v7];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v8 = v7;
        [(CSKappaDetectionService *)self feedRoads:v8];
        goto LABEL_31;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v8 = v7;
        [(CSKappaDetectionService *)self feedHertzSample:v8];
        goto LABEL_31;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v8 = v7;
        [(CSKappaDetectionService *)self feedCompanionStatus:v8];
        goto LABEL_31;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v8 = v7;
        [(CSKappaDetectionService *)self feedRemoteSample:v8];
        goto LABEL_31;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v8 = sub_1002C5BE4();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)id buf = 138412290;
          *(void *)&uint8_t buf[4] = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CSKappaDetectionService ignoring %@", buf, 0xCu);
        }
        goto LABEL_31;
      }
    }
LABEL_32:
  }
}

- (void)feedSortedSamples:(id)a3
{
}

- (void)feedLocationManagerResults:(id)a3
{
  id v4 = a3;
  SEL v5 = v4;
  if (self->_mslRecording)
  {
    id v6 = [v4 firstObject];
    [v6 coordinate];
    double v8 = v7;

    int v9 = [v5 firstObject];
    [v9 coordinate];
    float v11 = v10;

    *(float *)&double v8 = v8;
    self->_sessionDetails.coarseLat = *(float *)&v8;
    self->_sessionDetails.coarseLong = v11;
  }
  else
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    unsigned int v12 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)float v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "coarse location cannot be stored: IS=0 or IS=1 and not the first session in the recording", v13, 2u);
    }
  }
}

- (void)companionConnectedAckHandler_Deprecated:(int)a3 data:(id)a4 receivedTimestamp:(double)a5
{
  id v6 = a4;
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  double v7 = (id)qword_1003DB6C8;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id buf = 67109376;
    *(_DWORD *)float v39 = [v6 length];
    *(_WORD *)&v39[4] = 1024;
    *(_DWORD *)&v39[6] = 36;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "companionConnectedAckHandler %d %d", buf, 0xEu);
  }

  if ((unint64_t)[v6 length] < 0x25)
  {
    if (self->_inSession)
    {
      id v15 = v6;
      memcpy(&__dst, [v15 bytes], (size_t)[v15 length]);
      if (qword_1003DB6C0 != -1) {
        dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
      }
      id v16 = qword_1003DB6C8;
      if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 134349570;
        *(void *)float v39 = __dst;
        *(_WORD *)&v39[8] = 2082;
        double v40 = v44;
        __int16 v41 = 1026;
        unsigned int v42 = v45;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "received companion device info %{public}lu %{public}s %{public}d", buf, 0x1Cu);
      }
      if (v47 < 1) {
        unsigned int v17 = -1;
      }
      else {
        unsigned int v17 = 1;
      }
      if (v47) {
        uint64_t v18 = v17;
      }
      else {
        uint64_t v18 = 0;
      }
      mslRecording = self->_mslRecording;
      v37[0] = &__kCFBooleanTrue;
      v36[0] = @"companionConnected";
      v36[1] = @"companionDeviceModel";
      double v20 = +[NSString stringWithUTF8String:v44];
      v37[1] = v20;
      v36[2] = @"companionDeviceType";
      unsigned int v21 = +[NSNumber numberWithInt:v45];
      v37[2] = v21;
      uint32_t v22 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3];
      [(CSMSLDataRecording *)mslRecording updateMetadata:v22];

      if ((_companionCompatibility & 0xFFFFFFFD) == 1)
      {
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        id v23 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id buf = 67240448;
          *(_DWORD *)float v39 = v46;
          *(_WORD *)&v39[4] = 1026;
          *(_DWORD *)&v39[6] = v47;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "received companion device info %{public}d %{public}d", buf, 0xEu);
        }
        unint64_t v24 = self->_mslRecording;
        id v25 = +[NSNumber numberWithInt:v46, @"companionTokenCount"];
        v34[1] = @"companionArmedStatus";
        v35[0] = v25;
        int v26 = +[NSNumber numberWithInt:v18];
        v35[1] = v26;
        float v27 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
        [(CSMSLDataRecording *)v24 updateMetadata:v27];
      }
      self->_companionDeviceType = v45;
      [(CSKappaDetectionService *)self updateKappaSessionClients:10 data:0];
      value = self->fFlowControl.__ptr_.__value_;
      uint64_t v29 = *((void *)value + 38);
      float v30 = (std::__shared_weak_count *)*((void *)value + 39);
      if (v30)
      {
        atomic_fetch_add_explicit(&v30->__shared_owners_, 1uLL, memory_order_relaxed);
        value = self->fFlowControl.__ptr_.__value_;
      }
      *(unsigned char *)(v29 + 82) = 1;
      uint64_t v32 = *((void *)value + 40);
      float v31 = (std::__shared_weak_count *)*((void *)value + 41);
      if (v31)
      {
        atomic_fetch_add_explicit(&v31->__shared_owners_, 1uLL, memory_order_relaxed);
        *(unsigned char *)(v32 + 81) = 1;
        self->_BOOL companionConnected = 1;
        sub_10000BB9C(v31);
        if (!v30) {
          goto LABEL_47;
        }
      }
      else
      {
        *(unsigned char *)(v32 + 81) = 1;
        self->_BOOL companionConnected = 1;
        if (!v30) {
          goto LABEL_47;
        }
      }
      sub_10000BB9C(v30);
      goto LABEL_47;
    }
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    uint64_t v33 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id buf = 0;
      unsigned int v12 = "companion out of sync, session not in progress";
      float v13 = v33;
      uint32_t v14 = 2;
      goto LABEL_44;
    }
  }
  else
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    double v8 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "incorrect number of bytes for device info", buf, 2u);
    }
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    int v9 = (id)qword_1003DB6C8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = [v6 length];
      *(_DWORD *)id buf = 134217984;
      *(void *)float v39 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "data length %lu", buf, 0xCu);
    }

    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    uint64_t v11 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id buf = 134217984;
      *(void *)float v39 = 36;
      unsigned int v12 = "result length %lu";
      float v13 = v11;
      uint32_t v14 = 12;
LABEL_44:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, v12, buf, v14);
    }
  }
LABEL_47:
}

- (void)connectionCreated:(id)a3 withMessage:(id)a4
{
}

- (void)messageReceived:(id)a3 fromConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  double v8 = (id)qword_1003DB6C8;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = [v6 name];
    *(_DWORD *)id buf = 68289538;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    __int16 v43 = 2114;
    id v44 = v7;
    __int16 v45 = 2114;
    unsigned int v46 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"messageReceived\", \"connection\":%{public, location:escape_only}@, \"name\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  id v10 = [v6 name];
  unsigned int v11 = [v10 isEqualToString:@"com.apple.anomalydetectiond.kappa.message.test"];

  if (v11)
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    unsigned int v12 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "testMessageReceived", buf, 2u);
    }
  }
  else
  {
    float v13 = [v6 name];
    unsigned int v14 = [v13 isEqualToString:@"com.apple.anomalydetectiond.kappa.ttr.test"];

    if (!v14)
    {
      double v20 = [v6 name];
      unsigned int v21 = [v20 isEqualToString:@"com.apple.anomalydetectiond.kappa.command"];

      if (v21)
      {
        if (v6)
        {
          [v6 message];
          uint32_t v22 = *(CLConnectionMessage **)buf;
        }
        else
        {
          uint32_t v22 = 0;
          *(void *)id buf = 0;
          *(void *)&uint8_t buf[8] = 0;
        }
        float v27 = CLConnectionMessage::getDictionary(v22);
        if (*(void *)&buf[8]) {
          sub_10000BB9C(*(std::__shared_weak_count **)&buf[8]);
        }
        float v28 = [v27 objectForKeyedSubscript:@"CSKappaCommandKey"];
        if (!v28
          || ([v27 objectForKeyedSubscript:@"CSKappaValueKey"],
              uint64_t v29 = objc_claimAutoreleasedReturnValue(),
              BOOL v30 = v29 == 0,
              v29,
              v28,
              v30))
        {
          if (qword_1003DB6C0 != -1) {
            dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
          }
          uint64_t v36 = qword_1003DB6C8;
          if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)id buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "invalid command", buf, 2u);
          }
        }
        else
        {
          float v31 = [v27 objectForKeyedSubscript:@"CSKappaCommandKey"];
          id v32 = [v31 intValue];

          uint64_t v33 = [v27 objectForKeyedSubscript:@"CSKappaValueKey"];
          id v34 = [v33 intValue];

          if (qword_1003DB6C0 != -1) {
            dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
          }
          uint64_t v35 = qword_1003DB6C8;
          if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)id buf = 67109376;
            *(_DWORD *)&uint8_t buf[4] = v32;
            *(_WORD *)&uint8_t buf[8] = 1024;
            *(_DWORD *)&buf[10] = v34;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "cmd = %d val = %d", buf, 0xEu);
          }
          [(CSKappaDetectionService *)self saveForceState:v32 withValue:v34];
          if (v6)
          {
            [v6 message];
          }
          else
          {
            *(void *)id buf = 0;
            *(void *)&uint8_t buf[8] = 0;
          }
          CLConnectionMessage::sendReply();
          if (*(void *)&buf[8]) {
            sub_10000BB9C(*(std::__shared_weak_count **)&buf[8]);
          }
        }
      }
      else
      {
        id v23 = [v6 name];
        unsigned int v24 = [v23 isEqualToString:@"com.apple.anomalydetectiond.kappa.powerassertion.test"];

        if (!v24) {
          goto LABEL_59;
        }
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        id v25 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "testPowerAssertionReceived", buf, 2u);
        }
        if (v6)
        {
          [v6 message];
          int v26 = *(CLConnectionMessage **)buf;
        }
        else
        {
          int v26 = 0;
          *(void *)id buf = 0;
          *(void *)&uint8_t buf[8] = 0;
        }
        float v27 = CLConnectionMessage::getDictionary(v26);
        if (*(void *)&buf[8]) {
          sub_10000BB9C(*(std::__shared_weak_count **)&buf[8]);
        }
        float v37 = [v27 objectForKeyedSubscript:@"testPowerAssertionCmd"];
        [v37 doubleValue];
        double v39 = v38;

        powerAssertion = self->_powerAssertion;
        if (v39 <= 0.0) {
          [(CSPower *)powerAssertion releasePowerAssertion];
        }
        else {
          [(CSPower *)powerAssertion createPowerAssertion:@"anomalyctl"];
        }
      }

      goto LABEL_59;
    }
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    id v15 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "testTTRReceived", buf, 2u);
    }
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1003DD728, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1003DD728))
    {
      qword_1003DD720 = [[CSKappaTap2RadarConfiguration alloc] initWithAllowOnBattery:1 checkIntervalInSeconds:XPC_ACTIVITY_INTERVAL_1_MIN coolDownPeriodInSeconds:0];
      __cxa_guard_release(&qword_1003DD728);
    }
    if (qword_1003DD738 != -1) {
      dispatch_once(&qword_1003DD738, &stru_1003B9188);
    }
    id v16 = +[NSUUID UUID];
    unsigned int v17 = [v16 UUIDString];

    id v41 = 0;
    [(id)qword_1003DD730 enqueueTTRWithTriggerUUID:v17 error:&v41];
    id v18 = v41;
    if (v18)
    {
      if (qword_1003DB6C0 != -1) {
        dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
      }
      float v19 = qword_1003DB6C8;
      if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id buf = 138412290;
        *(void *)&uint8_t buf[4] = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "[TTR] Error enqueuing for TTR test: %@", buf, 0xCu);
      }
    }
  }
LABEL_59:
}

- (void)onCompanionTestTrigger:(double)a3
{
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  SEL v5 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id buf = 134217984;
    double v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "onCompanionTestTrigger: timestamp: %f", buf, 0xCu);
  }
  id v6 = +[NSString stringWithFormat:@"test message data %f", *(void *)&a3];
  companionProxy = self->_companionProxy;
  double v8 = [v6 dataUsingEncoding:4];
  [(CSCompanionServiceProtocol *)companionProxy sendData:v8 type:0];
}

- (void)kappaSessionCompanionHandler:(int)a3 data:(id)a4 receivedTimestamp:(double)a5
{
  id v6 = a4;
  if (self->_inSession)
  {
    if (self->_canCollectData) {
      goto LABEL_3;
    }
LABEL_11:
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    uint64_t v14 = qword_1003DB6C8;
    if (!os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_22;
    }
    *(_WORD *)id buf = 0;
    unsigned int v11 = "ignoring companion UUID since collection is not allowed";
    id v15 = v14;
    os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
    uint32_t v17 = 2;
    goto LABEL_21;
  }
  unsigned int v12 = +[CSPermissions sharedInstance];
  unsigned __int8 v13 = [v12 isAuthorizedToCollectData];

  if ((v13 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_3:
  if ((unint64_t)[v6 length] > 0xF)
  {
    if (self->_inSession)
    {
      if (self->_companionUUID) {
        goto LABEL_22;
      }
      id v7 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDBytes:[v6 bytes]];
      companionUUID = self->_companionUUID;
      self->_companionUUID = v7;

      if (qword_1003DB6C0 != -1) {
        dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
      }
      uint64_t v9 = qword_1003DB6C8;
      if (!os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      double v10 = self->_companionUUID;
      *(_DWORD *)id buf = 138543362;
      *(void *)&uint8_t buf[4] = v10;
      unsigned int v11 = "Companion trigger session UUID %{public}@";
    }
    else
    {
      if (self->_companionUUIDPreSession) {
        goto LABEL_22;
      }
      id v18 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDBytes:[v6 bytes]];
      companionUUIDPreSession = self->_companionUUIDPreSession;
      self->_companionUUIDPreSession = v18;

      if (qword_1003DB6C0 != -1) {
        dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
      }
      uint64_t v9 = qword_1003DB6C8;
      if (!os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      double v20 = self->_companionUUIDPreSession;
      *(_DWORD *)id buf = 138543362;
      *(void *)&uint8_t buf[4] = v20;
      unsigned int v11 = "Companion trigger session UUID %{public}@";
    }
    id v15 = v9;
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    uint32_t v17 = 12;
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v15, v16, v11, buf, v17);
LABEL_22:

    return;
  }
  sub_1002D7894(buf);

  abort_report_np();
  __break(1u);
}

- (void)companionTriggerHandler:(int)a3 data:(id)a4 receivedTimestamp:(double)a5
{
  id v6 = a4;
  if ((unint64_t)[v6 length] <= 0x27)
  {
    sub_1002D79B0(&__dst);

    abort_report_np();
    __break(1u);
  }
  id v7 = v6;
  memcpy(&__dst, [v7 bytes], (size_t)[v7 length]);
  int v8 = v14;
  if ((v14 & 4) != 0)
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    unsigned int v11 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v15 = 67109120;
      int v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "not setting companion trigger time path %d", v15, 8u);
    }
  }
  else
  {
    *(_WORD *)id v15 = 1027;
    v15[2] = 0;
    uint64_t v17 = 0;
    CSAOPSvc::sendCommand((CSAOPSvc *)self->_aop, v15, 0x10u);
    double v9 = *(double *)&__dst;
    if (*(double *)&__dst == 0.0)
    {
      if (qword_1003DB6C0 != -1) {
        dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
      }
      double v10 = qword_1003DB6C8;
      if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "companion message trigger time of zero will leak wall-clock time", buf, 2u);
      }
    }
    self->_double companionTriggerTime = v9;
  }
}

- (void)onCompanionMessage:(int)a3 data:(id)a4 receivedTimestamp:(double)a5
{
  id v8 = a4;
  id v9 = [objc_alloc((Class)NSString) initWithData:v8 encoding:4];
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  double v10 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
  {
    v13[0] = 67109890;
    v13[1] = a3;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2048;
    double v19 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "onCompanionMessage: type: %d, msg: %@ data: %@, receivedTimestamp: %f", (uint8_t *)v13, 0x26u);
  }
  if (self->_isLoggingDevice || self->_isDetectionDevice)
  {
    if (a3 > 100)
    {
      if (a3 <= 200)
      {
        if (a3 == 101)
        {
          uint64_t v12 = 102;
LABEL_29:
          [(CSKappaDetectionService *)self companionConnectedAck:v12];
        }
        else if (a3 == 102)
        {
          [(CSKappaDetectionService *)self companionConnectedAckHandler:102 data:v8 receivedTimestamp:a5];
        }
      }
      else
      {
        switch(a3)
        {
          case 201:
            [(CSKappaDetectionService *)self receiveDeviceInfoProtobuf:v8];
            break;
          case 202:
            [(CSKappaDetectionService *)self receiveForceTriggerProtobuf:v8];
            break;
          case 203:
            [(CSKappaDetectionService *)self receiveCompanionUUID:v8];
            break;
        }
      }
    }
    else
    {
      switch(a3)
      {
        case 1:
          [(CSKappaDetectionService *)self kappaSessionCompanionHandler:1 data:v8 receivedTimestamp:a5];
          break;
        case 3:
          [(CSKappaDetectionService *)self companionTriggerHandler:3 data:v8 receivedTimestamp:a5];
          break;
        case 4:
          uint64_t v12 = 5;
          goto LABEL_29;
        case 5:
          [(CSKappaDetectionService *)self companionConnectedAckHandler_Deprecated:5 data:v8 receivedTimestamp:a5];
          break;
        case 7:
          [(CSKappaDetectionService *)self companionDecidedToUploadHandler:7 data:v8 receivedTimestamp:a5];
          break;
        default:
          break;
      }
    }
  }
  else
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    unsigned int v11 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "ignore companion messages", (uint8_t *)v13, 2u);
    }
  }
}

- (void)onCompanionStatusUpdate:(BOOL)a3 pairedDevice:(id)a4 updatedTimestamp:(double)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  id v8 = qword_1003DB6C8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 67109376;
    *(_DWORD *)__int16 v16 = v6;
    *(_WORD *)&v16[4] = 2048;
    *(double *)&v16[6] = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "onCompanionStatusUpdate: isConnected: %d, updatedTimestamp: %f", (uint8_t *)&v15, 0x12u);
  }
  if (qword_1003DB6C0 != -1) {
    dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
  }
  id v9 = (id)qword_1003DB6C8;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = [v7 name];
    id v11 = [v10 UTF8String];
    unsigned int v12 = [v7 isNearby];
    unsigned int v13 = [v7 isDefaultPairedDevice];
    unsigned int v14 = [v7 isConnected];
    int v15 = 136315906;
    *(void *)__int16 v16 = v11;
    *(_WORD *)&v16[8] = 1024;
    *(_DWORD *)&v16[10] = v12;
    __int16 v17 = 1024;
    unsigned int v18 = v13;
    __int16 v19 = 1024;
    unsigned int v20 = v14;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Paired device info: name %s, isNearby %d, isDefaultPairedDevice %d, isConnected %d", (uint8_t *)&v15, 0x1Eu);
  }
}

- (void)didReceiveSOSAck:(int64_t)a3 forMode:(unsigned __int8)a4
{
  int64_t v11 = a3;
  if (a4 == 1)
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    BOOL v6 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id buf = 134217984;
      int64_t v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "didReceiveSOSAck response:%ld", buf, 0xCu);
    }
    if ((unint64_t)a3 <= 6)
    {
      if (((1 << a3) & 0x65) != 0)
      {
        self->_BOOL SOSInProgress = 1;
        if (qword_1003DB6C0 != -1) {
          dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
        }
        id v7 = qword_1003DB6C8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_INFO))
        {
          BOOL SOSInProgress = self->_SOSInProgress;
          *(_DWORD *)id buf = 67109120;
          LODWORD(v13) = SOSInProgress;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "didReceiveSOSAck setting _SOSInProgress to %d", buf, 8u);
        }
        [(CSPower *)self->_powerAssertion releasePowerAssertion];
      }
      else
      {
        [(CSMSLDataRecording *)self->_mslRecording updateMetadata:&off_1003C3680];
        [(CSHSMObjc *)self->_hsm signal:7 data:0];
      }
    }
    id v10 = +[NSData dataWithBytes:&v11 length:8];
    [(CSKappaDetectionService *)self updateKappaSessionClients:4 data:v10];
  }
  else
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    id v9 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "sos status ack invalid mode", buf, 2u);
    }
  }
}

- (void)didReceiveSOSStatusUpdate:(id)a3 forMode:(unsigned __int8)a4
{
  int v4 = a4;
  id v6 = a3;
  if (v4 == 1)
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    id v7 = (id)qword_1003DB6C8;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [v6 sosStatus];
      id v9 = [v8 flowState];
      unsigned int v10 = [v6 isKappaFlow];
      unsigned int v11 = [v6 isKappaFlowActive];
      unsigned int v12 = [v6 sosStatus];
      *(_DWORD *)id buf = 134218752;
      *(void *)double v40 = v9;
      *(_WORD *)&v40[8] = 1024;
      unsigned int v41 = v10;
      __int16 v42 = 1024;
      unsigned int v43 = v11;
      __int16 v44 = 1024;
      unsigned int v45 = [v12 isPairedDeviceStatus];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "didReceiveSOSStatusUpdate state:%ld, isKappaFlow:%d, isKappaFlowActive:%d isFromPaired:%d", buf, 0x1Eu);
    }
    if (([v6 isKappaFlow] & 1) == 0)
    {
      if (qword_1003DB6C0 != -1) {
        dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
      }
      int64_t v13 = qword_1003DB6C8;
      if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Received non-Kappa flow state from SOS SM (should never happen)", buf, 2u);
      }
    }
    unsigned int v14 = [v6 sosStatus];
    unsigned __int8 v15 = [v14 isPairedDeviceStatus];

    char v32 = v15 ^ 1;
    switch((unint64_t)[v6 sosKappaState])
    {
      case 1uLL:
        if (v32) {
          __int16 v16 = &off_1003C36A8;
        }
        else {
          __int16 v16 = &off_1003C36D0;
        }
        [(CSMSLDataRecording *)self->_mslRecording updateMetadata:v16];
        __int16 v17 = +[NSData dataWithBytes:&v32 length:1];
        [(CSKappaDetectionService *)self updateKappaSessionClients:5 data:v17];
        goto LABEL_23;
      case 3uLL:
        mslRecording = self->_mslRecording;
        CFStringRef v37 = @"userResponse";
        unsigned int v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 sosKappaState]);
        double v38 = v20;
        unsigned int v21 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        [(CSMSLDataRecording *)mslRecording updateMetadata:v21];

        __int16 v17 = +[NSData dataWithBytes:&v32 length:1];
        [(CSKappaDetectionService *)self updateKappaSessionClients:7 data:v17];
        goto LABEL_23;
      case 4uLL:
        uint32_t v22 = self->_mslRecording;
        CFStringRef v35 = @"userResponse";
        id v23 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 sosKappaState]);
        uint64_t v36 = v23;
        unsigned int v24 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        [(CSMSLDataRecording *)v22 updateMetadata:v24];

        __int16 v17 = +[NSData dataWithBytes:&v32 length:1];
        [(CSKappaDetectionService *)self updateKappaSessionClients:8 data:v17];
        goto LABEL_23;
      case 6uLL:
        id v25 = self->_mslRecording;
        CFStringRef v33 = @"userResponse";
        int v26 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 sosKappaState]);
        id v34 = v26;
        float v27 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        [(CSMSLDataRecording *)v25 updateMetadata:v27];

        __int16 v17 = +[NSData dataWithBytes:&v32 length:1];
        [(CSKappaDetectionService *)self updateKappaSessionClients:6 data:v17];
LABEL_23:

        break;
      default:
        break;
    }
    BOOL SOSInProgress = self->_SOSInProgress;
    unsigned int v29 = [v6 isKappaFlowActive];
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    BOOL v30 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id buf = 67109376;
      *(_DWORD *)double v40 = SOSInProgress;
      *(_WORD *)&v40[4] = 1024;
      *(_DWORD *)&v40[6] = v29;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "_SOSInProgress prev %d, current %d", buf, 0xEu);
    }
    if (SOSInProgress) {
      char v31 = v29;
    }
    else {
      char v31 = 1;
    }
    if ((v31 & 1) == 0) {
      [(CSHSMObjc *)self->_hsm signal:7 data:0];
    }
  }
  else
  {
    if (qword_1003DB6C0 != -1) {
      dispatch_once(&qword_1003DB6C0, &stru_1003B91A8);
    }
    unsigned int v18 = qword_1003DB6C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6C8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "sos status update for invalid mode", buf, 2u);
    }
  }
}

- (id)userInfoUploader
{
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  void v5[2] = sub_1002D453C;
  v5[3] = &unk_1003B67D0;
  objc_copyWeak(&v6, &location);
  double v2 = objc_retainBlock(v5);
  id v3 = objc_retainBlock(v2);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

- (CSMSLDataRecording)mslRecording
{
  return self->_mslRecording;
}

- (void)setMslRecording:(id)a3
{
}

- (BOOL)valid
{
  return self->valid;
}

- (void)setValid:(BOOL)a3
{
  self->valid = a3;
}

- (CSCompanionServiceProtocol)companionProxy
{
  return self->_companionProxy;
}

- (CSConnectionServer)kappaConnectionServer
{
  return self->_kappaConnectionServer;
}

- (int)delayBufferSize
{
  return self->_delayBufferSize;
}

- (void)setDelayBufferSize:(int)a3
{
  self->_delayBufferSize = a3;
}

- (BOOL)simulated
{
  return self->_simulated;
}

- (void)setSimulated:(BOOL)a3
{
  self->_simulated = a3;
}

- (BOOL)simulatedAuthorized
{
  return self->_simulatedAuthorized;
}

- (void)setSimulatedAuthorized:(BOOL)a3
{
  self->_simulatedAuthorized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kappaConnectionServer, 0);
  objc_storeStrong((id *)&self->_companionProxy, 0);
  objc_storeStrong((id *)&self->_ttr, 0);
  value = self->_kappaCompanionTrigger.__ptr_.__value_;
  self->_kappaCompanionTrigger.__ptr_.__value_ = 0;
  if (value) {
    operator delete();
  }
  int v4 = self->_kappaCompanion.__ptr_.__value_;
  self->_kappaCompanion.__ptr_.__value_ = 0;
  if (v4) {
    sub_1002B4B84((uint64_t)&self->_kappaCompanion, (uint64_t)v4);
  }
  objc_storeStrong((id *)&self->_vendor, 0);
  objc_storeStrong((id *)&self->_silo, 0);
  objc_storeStrong((id *)&self->_coreAnalytics, 0);
  objc_storeStrong((id *)&self->_uploader, 0);
  objc_storeStrong((id *)&self->_mslRecording, 0);
  objc_storeStrong((id *)&self->_poiGpsSample, 0);
  objc_storeStrong((id *)&self->_geoMapSvc, 0);
  objc_storeStrong((id *)&self->_biomeUnlockSink, 0);
  objc_storeStrong((id *)&self->_biomeAppLaunchSink, 0);
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_sosTimer, 0);
  objc_storeStrong((id *)&self->_triggerTimer, 0);
  SEL v5 = self->fFlowControl.__ptr_.__value_;
  self->fFlowControl.__ptr_.__value_ = 0;
  if (v5) {
    (*(void (**)(CLKappaAlgFlowController *))(*(void *)v5 + 8))(v5);
  }
  objc_storeStrong(&self->_waitForPOIState, 0);
  objc_storeStrong(&self->_waitForSOSState, 0);
  objc_storeStrong(&self->_readingState, 0);
  objc_storeStrong(&self->_idleState, 0);
  objc_storeStrong((id *)&self->_hsm, 0);
  objc_storeStrong((id *)&self->_sosSM, 0);
  id v6 = self->_kappaCompanionUUID.__ptr_.__value_;
  self->_kappaCompanionUUID.__ptr_.__value_ = 0;
  if (v6) {
    sub_100012E84((uint64_t)&self->_kappaCompanionUUID, (uint64_t)v6);
  }
  objc_storeStrong((id *)&self->_companionUUID, 0);
  objc_storeStrong((id *)&self->_companionUUIDPreSession, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 11) = 0;
  *((_DWORD *)self + 62) = -1082130432;
  *((unsigned char *)self + 252) = 0;
  *((void *)self + 32) = 0;
  *(_OWORD *)((char *)self + 264) = 0u;
  *((int32x2_t *)self + 35) = vdup_n_s32(0x447A0000u);
  *((void *)self + 36) = 0x3E8447A0000;
  *((_DWORD *)self + 90) = 0;
  *((void *)self + 50) = 0;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 341) = 0u;
  *((void *)self + 46) = 0;
  *((_WORD *)self + 196) = 0;
  *(_OWORD *)((char *)self + 376) = 0u;
  *((void *)self + 67) = 3212836864;
  *((void *)self + 68) = 0xFF7FFFFF00000000;
  *((_OWORD *)self + 36) = 0u;
  return self;
}

@end