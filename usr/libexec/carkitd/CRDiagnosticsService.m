@interface CRDiagnosticsService
+ (BOOL)_accessorySupportsLocationDeadReckoning;
+ (id)sharedInstance;
- (BOOL)initialDiagnosticsBannerPresented;
- (BOOL)shouldTriggerSysdiagnose;
- (CARConnectionSession)lastSession;
- (CARSessionConfiguration)lastConfiguration;
- (CARSessionStatus)sessionStatus;
- (CLLocationManager)locationManager;
- (CRDiagnosticsData)currentDiagnosticsData;
- (CRDiagnosticsService)init;
- (CRDiagnosticsService)initWithLocationManager:(id)a3 sleepInterval:(unsigned int)a4;
- (CRLoggingFileReceiver)loggingFileReceiver;
- (DNDStateService)dndStateService;
- (OS_dispatch_queue)diagnosticsSerialQueue;
- (OS_os_transaction)idleExitTransaction;
- (id)_INFOResponseURL;
- (id)_collectCarConfigurationForSession:(id)a3 supportingStartSession:(BOOL)a4;
- (id)_currentSiriAccount;
- (id)_extensionIdentifiersForDiagnosticsData:(id)a3;
- (id)_keywordsToAttachForDiagnosticsData:(id)a3;
- (id)_stringForScreens:(id)a3;
- (id)_stringForViewArea:(id)a3;
- (id)radarDescriptionForData:(id)a3;
- (id)radarDraftFromDiagnosticsData:(id)a3;
- (id)radarTitleTagsForData:(id)a3;
- (int64_t)pendingDrafts;
- (unsigned)sleepInterval;
- (void)_backgroundQueue_finishDiagnosticsOperationSemaphore:(id)a3 transaction:(id)a4;
- (void)_beginDictationWithCompletion:(id)a3;
- (void)_collectCAFToolTree:(id)a3;
- (void)_configureDiagnosticsData:(id)a3 withAttachmentURLs:(id)a4 withAdditionalDescription:(id)a5;
- (void)_mainQueue_displayDraftCountBanner;
- (void)_mainQueue_displayDraftErrorBanner;
- (void)_mainQueue_displayFetchingVehicleLogsBannerWithCompletion:(id)a3;
- (void)_mainQueue_gatherVehicleLogsThenPerformSysdiagnoseWithDiagnosticData:(id)a3 isInternal:(BOOL)a4 completion:(id)a5;
- (void)_mainQueue_gatherVehicleLogsWithCompletion:(id)a3;
- (void)_mainQueue_performSysdiagnoseIncludingData:(id)a3 isInternal:(BOOL)a4 completion:(id)a5;
- (void)_mainQueue_presentCarAlertWithTitle:(id)a3 dismissTime:(double)a4 completion:(id)a5;
- (void)_mainQueue_presentDictationBannerWithCompletion:(id)a3;
- (void)_mainQueue_promptForInternalSysdiagnoseForDiagnosticData:(id)a3 completion:(id)a4;
- (void)_mainQueue_startDiagnosticsOperation:(id)a3;
- (void)_performVibrate;
- (void)collectDiagnosticsWithDeviceScreenshotURL:(id)a3 carScreenshotURL:(id)a4 attachmentURLs:(id)a5 accessoryDetails:(id)a6 accessoryDescription:(id)a7 supportsStartSession:(BOOL)a8 activeBundleIdentifier:(id)a9 wallpaperDescription:(id)a10 assetDescription:(id)a11 loggingFileReceiver:(id)a12 completionHandler:(id)a13;
- (void)collectDiagnosticsWithSession:(id)a3 displayReason:(id)a4 additionalDescription:(id)a5 attachmentURLs:(id)a6 completionHandler:(id)a7;
- (void)dealloc;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)session:(id)a3 didUpdateConfiguration:(id)a4;
- (void)sessionDidDisconnect:(id)a3;
- (void)setCurrentDiagnosticsData:(id)a3;
- (void)setDiagnosticsSerialQueue:(id)a3;
- (void)setDndStateService:(id)a3;
- (void)setIdleExitTransaction:(id)a3;
- (void)setInitialDiagnosticsBannerPresented:(BOOL)a3;
- (void)setLastConfiguration:(id)a3;
- (void)setLastSession:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setLoggingFileReceiver:(id)a3;
- (void)setPendingDrafts:(int64_t)a3;
- (void)setSessionStatus:(id)a3;
- (void)setSleepInterval:(unsigned int)a3;
@end

@implementation CRDiagnosticsService

+ (id)sharedInstance
{
  if (qword_1000E38E0 != -1) {
    dispatch_once(&qword_1000E38E0, &stru_1000BEF30);
  }
  v2 = (void *)qword_1000E38D8;

  return v2;
}

- (CRDiagnosticsService)init
{
  id v3 = objc_alloc((Class)CLLocationManager);
  v4 = CRAutomaticDNDLocationBundle();
  id v5 = [v3 initWithEffectiveBundle:v4];
  v6 = [(CRDiagnosticsService *)self initWithLocationManager:v5 sleepInterval:0];

  return v6;
}

- (void)dealloc
{
  id v3 = [(CRDiagnosticsService *)self locationManager];
  [v3 stopUpdatingLocation];

  v4.receiver = self;
  v4.super_class = (Class)CRDiagnosticsService;
  [(CRDiagnosticsService *)&v4 dealloc];
}

- (void)setSessionStatus:(id)a3
{
  objc_super v4 = (CARSessionStatus *)a3;
  id v5 = v4;
  if (v4) {
    [(CARSessionStatus *)v4 addSessionObserver:self];
  }
  sessionStatus = self->_sessionStatus;
  self->_sessionStatus = v5;
}

- (CRDiagnosticsService)initWithLocationManager:(id)a3 sleepInterval:(unsigned int)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRDiagnosticsService;
  v8 = [(CRDiagnosticsService *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_locationManager, a3);
    [(CLLocationManager *)v9->_locationManager setDelegate:v9];
    [(CLLocationManager *)v9->_locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    [(CLLocationManager *)v9->_locationManager setActivityType:2];
    v9->_sleepInterval = a4;
    v9->_initialDiagnosticsBannerPresented = 0;
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.CarKit.DiagnosticsSerialQueue", 0);
    diagnosticsSerialQueue = v9->_diagnosticsSerialQueue;
    v9->_diagnosticsSerialQueue = (OS_dispatch_queue *)v10;

    v9->_pendingDrafts = 0;
    uint64_t v12 = +[DNDStateService serviceForClientIdentifier:@"com.apple.carkitd.assertion-service"];
    dndStateService = v9->_dndStateService;
    v9->_dndStateService = (DNDStateService *)v12;
  }
  return v9;
}

- (void)collectDiagnosticsWithDeviceScreenshotURL:(id)a3 carScreenshotURL:(id)a4 attachmentURLs:(id)a5 accessoryDetails:(id)a6 accessoryDescription:(id)a7 supportsStartSession:(BOOL)a8 activeBundleIdentifier:(id)a9 wallpaperDescription:(id)a10 assetDescription:(id)a11 loggingFileReceiver:(id)a12 completionHandler:(id)a13
{
  BOOL v13 = a8;
  id v70 = a3;
  id v18 = a4;
  id v19 = a5;
  id v73 = a7;
  id v72 = a9;
  id v71 = a10;
  id v69 = a11;
  id v20 = a12;
  v21 = (void (**)(void))a13;
  v22 = [(CRDiagnosticsService *)self sessionStatus];
  v23 = [v22 currentSession];

  if (v23)
  {
    id v68 = v19;
    v24 = [v23 configuration];
    [(CRDiagnosticsService *)self setLastConfiguration:v24];
    [(CRDiagnosticsService *)self setLoggingFileReceiver:v20];
    v25 = objc_alloc_init(CRDiagnosticsData);
    [(CRDiagnosticsService *)self setCurrentDiagnosticsData:v25];
    -[CRDiagnosticsData setTransportType:](v25, "setTransportType:", [v24 transportType]);
    if (CRIsInternalInstall())
    {
      v26 = v70;
      if (objc_opt_class())
      {
        [(CRDiagnosticsData *)v25 setActiveBundleIdentifier:v72];
        id v67 = v18;
        id v65 = v20;
        if ([v23 navigationOwner] == (id)1) {
          uint64_t v27 = 1;
        }
        else {
          uint64_t v27 = (uint64_t)[v72 isEqualToString:@"com.apple.Maps"];
        }
        [(CRDiagnosticsData *)v25 setMapsActive:v27];
        [(CRDiagnosticsData *)v25 setVehicleSupportsStartSession:v13];
        v30 = objc_opt_new();
        [v30 setDateFormat:@"MM-dd-yyyy-HH_mm_ss"];
        uint64_t v31 = [(CRDiagnosticsData *)v25 _getCreationDateForAttachmentURL:v70];
        v66 = v30;
        v64 = (void *)v31;
        if (v31)
        {
          v32 = [v30 stringFromDate:v31];
          uint64_t v33 = +[NSString stringWithFormat:@"%@-%@%@", @"DeviceScreenshot", v32, @".png"];
        }
        else
        {
          uint64_t v33 = +[NSString stringWithFormat:@"%@%@", @"DeviceScreenshot", @".png"];
        }
        v63 = (void *)v33;
        [(CRDiagnosticsData *)v25 addAttachment:v70 asFilename:v33];
        uint64_t v34 = [(CRDiagnosticsData *)v25 _getCreationDateForAttachmentURL:v18];
        v62 = (void *)v34;
        if (v34)
        {
          v35 = [v66 stringFromDate:v34];
          uint64_t v36 = +[NSString stringWithFormat:@"%@-%@%@", @"CarPlayScreenshot", v35, @".png"];
        }
        else
        {
          uint64_t v36 = +[NSString stringWithFormat:@"%@%@", @"CarPlayScreenshot", @".png"];
        }
        v61 = (void *)v36;
        [(CRDiagnosticsData *)v25 addAttachment:v67 asFilename:v36];
        v37 = [(CRDiagnosticsService *)self _INFOResponseURL];
        [(CRDiagnosticsData *)v25 addAttachment:v37 asFilename:@"INFOResponse.plist"];

        if ([v71 length]) {
          [(CRDiagnosticsData *)v25 addTextAttachment:v71 asFilename:@"WallpaperPreferences.txt"];
        }
        if ([v24 supportsVehicleData])
        {
          [(CRDiagnosticsData *)v25 setIsVehicleDataSession:1];
          if ([v69 length]) {
            [(CRDiagnosticsData *)v25 addTextAttachment:v69 asFilename:@"VehicleAsset.txt"];
          }
          v38 = CarDiagnosticsLogging();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Gathering CAFTool tree...", buf, 2u);
          }

          v82[0] = _NSConcreteStackBlock;
          v82[1] = 3221225472;
          v82[2] = sub_1000522D4;
          v82[3] = &unk_1000BEF58;
          v82[4] = self;
          v83 = v25;
          [(CRDiagnosticsService *)self _collectCAFToolTree:v82];
        }
        v39 = [(CRDiagnosticsService *)self _collectCarConfigurationForSession:v23 supportingStartSession:v13];
        [(CRDiagnosticsData *)v25 addTextAttachment:v39 asFilename:@"CarPlayConfiguration.txt"];

        v40 = +[NSMutableString string];
        v41 = v40;
        if (v73) {
          [v40 appendString:v73];
        }
        v42 = [v24 descriptionForTransportType];
        [v41 appendFormat:@"Transport Type: %@", v42];

        if ([v24 supportsVehicleData]) {
          CFStringRef v43 = @"YES";
        }
        else {
          CFStringRef v43 = @"NO";
        }
        if ([v24 supportsLogTransfer]) {
          CFStringRef v44 = @"YES";
        }
        else {
          CFStringRef v44 = @"NO";
        }
        [v41 appendFormat:@"\nSupports Vehicle Data: %@\nSupports Log Transfer: %@", v43, v44];
        v45 = [v23 sourceVersion];
        if (v45)
        {
          if (qword_1000E38F0 != -1) {
            dispatch_once(&qword_1000E38F0, &stru_1000BF2E8);
          }
          v46 = (void *)qword_1000E38E8;
          v47 = [v45 stringByReplacingOccurrencesOfString:@"." withString:&stru_1000C0798];
          uint64_t v48 = [v46 objectForKeyedSubscript:v47];
          v49 = (void *)v48;
          v50 = @"Unknown";
          if (v48) {
            v50 = (__CFString *)v48;
          }
          v51 = v50;

          v52 = +[NSString stringWithFormat:@"%@ (%@)", v51, v45];

          [v41 appendFormat:@"\nPlug-in Source Version: %@", v52];
          v26 = v70;
        }
        v53 = [v24 screens];
        v54 = [(CRDiagnosticsService *)self _stringForScreens:v53];
        [v41 appendFormat:@"\n%@", v54];

        [(CRDiagnosticsService *)self _configureDiagnosticsData:v25 withAttachmentURLs:v68 withAdditionalDescription:v41];
        if ([(CRDiagnosticsData *)v25 isMapsActive])
        {
          v55 = CarDiagnosticsLogging();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Maps is frontmost or guidance is active, retreiving last location", buf, 2u);
          }

          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.carkit.maps-diagnostics-starting", 0, 0, 1u);
          v57 = [(CRDiagnosticsService *)self locationManager];
          [v57 requestLocation];
        }
        if (![(CRDiagnosticsService *)self shouldTriggerSysdiagnose])
        {
          v60 = CarDiagnosticsLogging();
          id v18 = v67;
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "No need for sysdiagnose now", buf, 2u);
          }

          v21[2](v21);
          id v20 = v65;
          v59 = v66;
          goto LABEL_54;
        }

        int v29 = 1;
        id v18 = v67;
        id v20 = v65;
      }
      else
      {
        int v29 = 0;
      }
    }
    else
    {
      int v29 = 0;
      v26 = v70;
    }
    v58 = CarGeneralLogging();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT)) {
      sub_100075758();
    }

    if (v29)
    {
      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472;
      v76[2] = sub_100052478;
      v76[3] = &unk_1000BEFA8;
      id v77 = v24;
      v78 = self;
      v79 = v25;
      char v81 = v29;
      v80 = v21;
      [(CRDiagnosticsService *)self _mainQueue_promptForInternalSysdiagnoseForDiagnosticData:v79 completion:v76];

      v59 = v77;
    }
    else
    {
      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v74[2] = sub_10005266C;
      v74[3] = &unk_1000BD640;
      v75 = v21;
      [(CRDiagnosticsService *)self _mainQueue_gatherVehicleLogsThenPerformSysdiagnoseWithDiagnosticData:v25 isInternal:0 completion:v74];
      v59 = v75;
    }
LABEL_54:

    id v19 = v68;
    goto LABEL_55;
  }
  v28 = CarDiagnosticsLogging();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Trying to collect diagnostics but currentSession is nil", buf, 2u);
  }

  v21[2](v21);
  v26 = v70;
LABEL_55:
}

- (void)collectDiagnosticsWithSession:(id)a3 displayReason:(id)a4 additionalDescription:(id)a5 attachmentURLs:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(void))a7;
  [(CRDiagnosticsService *)self setLastSession:v12];
  v17 = objc_alloc_init(CRDiagnosticsData);
  [(CRDiagnosticsService *)self setCurrentDiagnosticsData:v17];
  id v18 = [v12 transportType];
  id v19 = v18;
  if (v18)
  {
    if (([v18 isEqualToString:kFigEndpointTransportType_AWDL] & 1) != 0
      || ([v19 isEqualToString:kFigEndpointTransportType_WiFi] & 1) != 0)
    {
      uint64_t v20 = 3;
    }
    else if ([v19 isEqualToString:kFigEndpointTransportType_Ethernet])
    {
      uint64_t v20 = 2;
    }
    else
    {
      uint64_t v20 = [v19 isEqualToString:kFigEndpointTransportType_USB];
    }
  }
  else
  {
    uint64_t v20 = 0;
  }
  [(CRDiagnosticsData *)v17 setTransportType:v20];
  if (CRIsInternalInstall() && objc_opt_class())
  {
    v21 = +[NSMutableString string];
    v22 = v21;
    if (v14) {
      [v21 appendFormat:@"%@\n", v14];
    }
    id v31 = v13;
    v23 = [v12 transportType];
    [v22 appendFormat:@"Transport Type: %@", v23];

    v24 = [v12 vehicleInformation];

    if (v24)
    {
      v25 = [v12 vehicleInformation];
      [v22 appendFormat:@"Vehicle Information: %@", v25];
    }
    [(CRDiagnosticsService *)self _configureDiagnosticsData:v17 withAttachmentURLs:v15 withAdditionalDescription:v22];
    unsigned __int8 v26 = [(CRDiagnosticsService *)self shouldTriggerSysdiagnose];
    uint64_t v27 = CarDiagnosticsLogging();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v28)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Starting to take a sysdiagnose", buf, 2u);
      }

      int v29 = [(CRDiagnosticsService *)self radarDraftFromDiagnosticsData:v17];
      v30 = +[TapToRadarService shared];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1000529E4;
      v32[3] = &unk_1000BEFD0;
      v32[4] = self;
      uint64_t v33 = v16;
      [v30 createDraft:v29 forProcessNamed:@"CarPlay" withDisplayReason:v31 completionHandler:v32];

      id v13 = v31;
    }
    else
    {
      id v13 = v31;
      if (v28)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "No need for sysdiagnose now", buf, 2u);
      }

      v16[2](v16);
    }
  }
}

- (void)_configureDiagnosticsData:(id)a3 withAttachmentURLs:(id)a4 withAdditionalDescription:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v9);
        }
        [v8 addAttachment:*(void *)(*((void *)&v20 + 1) + 8 * (void)v14)];
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }
  id v15 = [(CRDiagnosticsService *)self _currentSiriAccount];
  [v8 setSiriAccount:v15];

  [v8 setAdditionalDescription:v10];
  dndStateService = self->_dndStateService;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100052D60;
  v18[3] = &unk_1000BEFF8;
  id v19 = v8;
  id v17 = v8;
  [(DNDStateService *)dndStateService queryCurrentStateWithCompletionHandler:v18];
}

- (void)_mainQueue_promptForInternalSysdiagnoseForDiagnosticData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100053068;
  v10[3] = &unk_1000BF048;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(CRDiagnosticsService *)self _mainQueue_presentCarAlertWithTitle:@"Gathering CarPlay Diagnostics" dismissTime:v10 completion:3.0];
}

- (void)_mainQueue_gatherVehicleLogsThenPerformSysdiagnoseWithDiagnosticData:(id)a3 isInternal:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005335C;
  v12[3] = &unk_1000BF0C0;
  v12[4] = self;
  id v13 = v8;
  BOOL v15 = a4;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(CRDiagnosticsService *)self _mainQueue_startDiagnosticsOperation:v12];
}

- (void)_mainQueue_startDiagnosticsOperation:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = (void *)os_transaction_create();
  id v7 = CarDiagnosticsLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t description = os_transaction_get_description();
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "began idle-exit transaction for CarPlay diagnostics: %s", buf, 0xCu);
  }

  id v8 = CarDiagnosticsLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "waiting on previous diagnostics", buf, 2u);
  }

  id v9 = [(CRDiagnosticsService *)self diagnosticsSerialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100053844;
  block[3] = &unk_1000BF0E8;
  id v15 = v6;
  id v16 = v4;
  dispatch_semaphore_t v14 = v5;
  id v10 = v6;
  id v11 = v5;
  id v12 = v4;
  dispatch_async(v9, block);
}

- (void)_backgroundQueue_finishDiagnosticsOperationSemaphore:(id)a3 transaction:(id)a4
{
  id v5 = a4;
  dispatch_semaphore_signal((dispatch_semaphore_t)a3);
  id v6 = CarDiagnosticsLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t description = os_transaction_get_description();
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ended idle-exit transaction for CarPlay diagnostics: %s", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_mainQueue_gatherVehicleLogsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v5 = [(CRDiagnosticsService *)self loggingFileReceiver];

  id v6 = CarDiagnosticsLogging();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Requesting vehicle log archive", buf, 2u);
    }

    id v8 = [(CRDiagnosticsService *)self loggingFileReceiver];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100053BE4;
    v9[3] = &unk_1000BF110;
    id v10 = v4;
    [v8 requestLogsWithCompletion:v9];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "logging file receiver not supported", buf, 2u);
    }

    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)_mainQueue_performSysdiagnoseIncludingData:(id)a3 isInternal:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = CarDiagnosticsLogging();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Starting to take a sysdiagnose", buf, 2u);
  }

  id v11 = CarDiagnosticsLogging();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "internal version of sysdiagnose", buf, 2u);
    }

    id v13 = [(CRDiagnosticsService *)self radarDraftFromDiagnosticsData:v8];
    dispatch_semaphore_t v14 = +[TapToRadarService shared];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100053E84;
    v19[3] = &unk_1000BEFD0;
    v19[4] = self;
    id v20 = v9;
    id v15 = v9;
    [v14 createDraft:v13 forProcessNamed:@"CarPlay" withDisplayReason:0 completionHandler:v19];
  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "public version of sysdiagnose", buf, 2u);
    }

    [(CRDiagnosticsService *)self _performVibrate];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100054074;
    v16[3] = &unk_1000BF138;
    id v17 = 0;
    id v18 = v9;
    id v13 = v9;
    +[Libsysdiagnose sysdiagnoseWithMetadata:&__NSDictionary0__struct onCompletion:v16];

    id v15 = v17;
  }
}

- (id)_currentSiriAccount
{
  id v2 = objc_alloc_init((Class)AFSettingsConnection);
  id v3 = [v2 accounts];
  id v4 = [v3 sortedArrayUsingComparator:&stru_1000BF178];

  id v5 = [v4 firstObject];

  return v5;
}

- (void)_mainQueue_displayDraftCountBanner
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v3 = +[NSString stringWithFormat:@"Number of Drafts Scheduled: %ld", [(CRDiagnosticsService *)self pendingDrafts]];
  [(CRDiagnosticsService *)self _mainQueue_presentCarAlertWithTitle:v3 dismissTime:0 completion:3.0];
}

- (void)_mainQueue_displayDraftErrorBanner
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);

  [(CRDiagnosticsService *)self _mainQueue_presentCarAlertWithTitle:@"ERROR: Failed to create a draft!" dismissTime:0 completion:3.0];
}

- (void)_mainQueue_displayFetchingVehicleLogsBannerWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100054330;
  v6[3] = &unk_1000BE3D8;
  id v7 = v4;
  id v5 = v4;
  [(CRDiagnosticsService *)self _mainQueue_presentCarAlertWithTitle:@"Fetching vehicle logs, please wait..." dismissTime:v6 completion:3.0];
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = CarDiagnosticsLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed fetching diagnostics device location with %@", buf, 0xCu);
  }

  id v9 = [v7 location];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100054484;
  v11[3] = &unk_1000BD3A8;
  v11[4] = self;
  id v12 = v9;
  id v10 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = CarDiagnosticsLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received diagnostics location manager update response.", buf, 2u);
  }

  [v7 stopUpdatingLocation];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000546DC;
  v10[3] = &unk_1000BD3A8;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

- (BOOL)shouldTriggerSysdiagnose
{
  Class v2 = NSClassFromString(@"XCTestCase");
  if (v2)
  {
    id v3 = CarDiagnosticsLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Skipping sysdiagnose in testing context.", v5, 2u);
    }
  }
  return v2 == 0;
}

- (void)_mainQueue_presentDictationBannerWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v5 = +[CRDictationService sharedInstance];
  unsigned int v6 = [v5 dictationEnabled];

  if (v6)
  {
    id v7 = +[CRDictationService sharedInstance];
    unsigned int v8 = [v7 dictationEnabledInKeyboardSettings];

    if (v8)
    {
      id v9 = +[CRDictationService sharedInstance];
      unsigned int v10 = [v9 dictationAvailable];

      if (v10)
      {
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100054B9C;
        v20[3] = &unk_1000BF1A0;
        v20[4] = self;
        id v21 = v4;
        [(CRDiagnosticsService *)self _mainQueue_presentCarAlertWithTitle:@"Tap to Dictate Issue" dismissTime:v20 completion:5.0];
        id v11 = v21;
      }
      else
      {
        id v14 = CarDiagnosticsLogging();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Dictation is not available", buf, 2u);
        }

        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100054C48;
        v17[3] = &unk_1000BE3D8;
        id v18 = v4;
        [(CRDiagnosticsService *)self _mainQueue_presentCarAlertWithTitle:@"Dictation Not Available" dismissTime:v17 completion:3.0];
        id v11 = v18;
      }
    }
    else
    {
      id v13 = CarDiagnosticsLogging();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Dictation is not enabled in keyboard settings", buf, 2u);
      }

      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100054C5C;
      v15[3] = &unk_1000BE3D8;
      id v16 = v4;
      [(CRDiagnosticsService *)self _mainQueue_presentCarAlertWithTitle:@"Dictation Not Enabled In Settings" dismissTime:v15 completion:3.0];
      id v11 = v16;
    }
  }
  else
  {
    id v12 = CarDiagnosticsLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Dictation is not enabled via user preference", buf, 2u);
    }

    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)_beginDictationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[CRDictationService sharedInstance];
  [v5 reset];

  unsigned int v6 = +[CRDictationService sharedInstance];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100054D40;
  v8[3] = &unk_1000BF230;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 beginRecordingWithCompletion:v8];
}

- (void)_performVibrate
{
  Class v2 = dispatch_get_global_queue(25, 0);
  dispatch_async(v2, &stru_1000BF250);
}

- (void)_mainQueue_presentCarAlertWithTitle:(id)a3 dismissTime:(double)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v9 = CarDiagnosticsLogging();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Presenting diagnostics alert: %@", (uint8_t *)&v11, 0xCu);
  }

  unsigned int v10 = objc_alloc_init(CRDiagnosticsAlert);
  [(CRDiagnosticsAlert *)v10 setTimeoutInterval:a4];
  [(CRDiagnosticsAlert *)v10 setBannerMessage:v7];
  [(CRAlert *)v10 presentAlertWithCompletion:v8];
}

- (id)_keywordsToAttachForDiagnosticsData:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", &off_1000C6100, &off_1000C6118, 0);
  [&off_1000C72D0 allKeys];
  v32 = _NSConcreteStackBlock;
  uint64_t v33 = 3221225472;
  uint64_t v34 = sub_100055974;
  v35 = &unk_1000BF278;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v36 = v6;
  v37 = &off_1000C72D0;
  id v7 = objc_retainBlock(&v32);
  id v8 = [(CRDiagnosticsService *)self lastConfiguration];
  id v9 = [v8 vehicleManufacturer];

  if (v9)
  {
    unsigned int v10 = [v8 vehicleManufacturer];
    int v11 = ((void (*)(void ***, void *))v7[2])(v7, v10);

    if (v11) {
      goto LABEL_13;
    }
  }
  id v12 = [v8 manufacturerName];

  if (v12)
  {
    id v13 = [v8 manufacturerName];
    int v11 = ((void (*)(void ***, void *))v7[2])(v7, v13);

    if (v11) {
      goto LABEL_13;
    }
  }
  id v14 = [v8 vehicleName];

  if (v14)
  {
    id v15 = [v8 vehicleName];
    int v11 = ((void (*)(void ***, void *))v7[2])(v7, v15);

    if (v11) {
      goto LABEL_13;
    }
  }
  id v16 = [v8 name];

  if (v16)
  {
    id v17 = [v8 name];
    int v11 = ((void (*)(void ***, void *))v7[2])(v7, v17);

    if (v11) {
      goto LABEL_13;
    }
  }
  id v18 = [v8 vehicleModelName];

  if (v18)
  {
    id v19 = [v8 vehicleModelName];
    int v11 = ((void (*)(void ***, void *))v7[2])(v7, v19);

    if (v11) {
      goto LABEL_13;
    }
  }
  id v20 = [v8 modelName];

  if (!v20) {
    goto LABEL_30;
  }
  id v21 = [v8 modelName];
  int v11 = ((void (*)(void ***, void *))v7[2])(v7, v21);

  if (v11)
  {
LABEL_13:
    [v5 addObject:v11];
  }
  else
  {
LABEL_30:
    int v11 = CarGeneralLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Could not resolve a model keyword for %@", buf, 0xCu);
    }
  }

  id v22 = objc_alloc((Class)NSDictionary);
  id v23 = objc_msgSend(v22, "initWithObjectsAndKeys:", &off_1000C6520, @"com.apple.iBooks", &off_1000C6538, @"com.apple.MobileSMS", &off_1000C6550, @"com.apple.Music", &off_1000C6568, @"com.apple.mobilephone", &off_1000C6568, @"com.apple.InCallService", &off_1000C6580, @"com.apple.podcasts", &off_1000C6598, @"com.apple.mobilecal", &off_1000C65B0, @"com.apple.CarPlaySettings", &off_1000C65C8,
          @"com.apple.internal.Neatline",
          &off_1000C65E0,
          &off_1000C65F8,
          &off_1000C6610,
          &off_1000C6628,
          0,
          v32,
          v33,
          v34,
          v35);
  v24 = [v4 activeBundleIdentifier];

  if (v24)
  {
    v25 = [v4 activeBundleIdentifier];
    unsigned __int8 v26 = [v23 objectForKey:v25];

    if (v26) {
      [v5 addObject:v26];
    }
  }
  uint64_t v27 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 transportType]);
  BOOL v28 = [v23 objectForKey:v27];

  if (v28) {
    [v5 addObject:v28];
  }
  if ([v4 vehicleSupportsStartSession]) {
    int v29 = &off_1000C6640;
  }
  else {
    int v29 = &off_1000C6658;
  }
  [v5 addObject:v29];
  if ([v8 hasGaugeClusterScreen])
  {
    [v5 addObject:&off_1000C6670];
    [v5 addObject:&off_1000C6688];
  }
  v30 = [(CRDiagnosticsService *)self lastSession];
  if (v30)
  {
    [v5 addObject:&off_1000C66A0];
    [v5 addObject:&off_1000C66B8];
  }

  return v5;
}

- (id)_stringForViewArea:(id)a3
{
  id v3 = a3;
  [v3 visibleFrame];
  id v4 = NSStringFromRect(v11);
  [v3 safeFrame];
  id v5 = NSStringFromRect(v12);
  unsigned int v6 = [v3 displaysTransitionControl];

  CFStringRef v7 = @"NO";
  if (v6) {
    CFStringRef v7 = @"YES";
  }
  id v8 = +[NSString stringWithFormat:@"\t\t\tVisible Frame: %@\n\t\t\tSafe Frame: %@\n\t\t\tDisplays Transition Control: %@\n", v4, v5, v7];

  return v8;
}

- (id)_stringForScreens:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"Number of screens: %lu\n", [v4 count]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v4;
  id v30 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v38;
    uint64_t v6 = 1;
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v38 != v29) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        [v5 appendFormat:@"\t{\n\t\tScreen %d\n", v6];
        id v9 = [v8 identifier];
        [v5 appendFormat:@"\t\tIdentifier: %@\n", v9];
        id v10 = [v8 screenType];
        CFStringRef v11 = @"Secondary";
        if (!v10) {
          CFStringRef v11 = @"Primary";
        }
        [v5 appendFormat:@"\t\tType: %@\n", v11];
        NSRect v12 = [v8 descriptionForAvailableInteractionModels];
        [v5 appendFormat:@"\t\tAvailable Interaction Models: %@\n", v12];
        id v13 = [v8 descriptionForPrimaryInteractionModel];
        [v5 appendFormat:@"\t\tPrimary Interaction Model: %@\n", v13];
        [v8 physicalSize];
        id v14 = NSStringFromSize(v44);
        [v5 appendFormat:@"\t\tPhysical Size: %@\n", v14];

        [v8 pixelSize];
        id v15 = NSStringFromSize(v45);
        [v5 appendFormat:@"\t\tPixel Size: %@\n", v15];

        id v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 maxFramesPerSecond]);
        [v5 appendFormat:@"\t\tMax FPS: %@\n", v16];

        unsigned int v17 = [v8 supportsHighFidelityTouch];
        CFStringRef v18 = @"NO";
        if (v17) {
          CFStringRef v18 = @"YES";
        }
        [v5 appendFormat:@"\t\tSupports HiFi Touch: %@\n", v18];
        id v19 = [v8 viewAreas];
        id v20 = [v19 count];

        if (v20)
        {
          id v31 = v12;
          v32 = v9;
          [v5 appendFormat:@"\t\tView Areas:\n"];
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v21 = [v8 viewAreas];
          id v22 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
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
                unsigned __int8 v26 = [(CRDiagnosticsService *)self _stringForViewArea:*(void *)(*((void *)&v33 + 1) + 8 * (void)j)];
                [v5 appendString:v26];
              }
              id v23 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
            }
            while (v23);
          }

          NSRect v12 = v31;
          id v9 = v32;
        }
        [v5 appendFormat:@"\t}\n"];
        uint64_t v6 = (v6 + 1);
      }
      id v30 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v30);
  }

  return v5;
}

- (void)_collectCAFToolTree:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100056058;
  block[3] = &unk_1000BD640;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

+ (BOOL)_accessorySupportsLocationDeadReckoning
{
  uint64_t v2 = CLGetAccessoryTypeBitSet();
  id v3 = CarDiagnosticsLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = +[NSNumber numberWithUnsignedInt:v2];
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received location bitset %@", (uint8_t *)&v7, 0xCu);
  }
  return (v2 >> 3) & 1;
}

- (id)_INFOResponseURL
{
  uint64_t v2 = [(CRDiagnosticsService *)self lastConfiguration];
  id v3 = [v2 infoResponse];

  id v4 = +[NSFileManager defaultManager];
  id v5 = [v4 temporaryDirectory];
  uint64_t v6 = [v5 URLByAppendingPathComponent:@"INFOResponse.plist"];

  int v7 = [v6 path];
  if (v7) {
    [v3 writeToFile:v7 atomically:1];
  }

  return v6;
}

- (id)_collectCarConfigurationForSession:(id)a3 supportingStartSession:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = [v5 configuration];
  int v7 = [@"Connected CarPlay Session\n\n" stringByAppendingString:@"Session Configuration\n"];
  char v81 = [v6 vehicleName];
  id v8 = [v7 stringByAppendingFormat:@"Name: %@\n", v81];

  v80 = [v6 vehicleModelName];
  id v9 = [v8 stringByAppendingFormat:@"Model Name: %@\n", v80];

  id v10 = [v6 modelName];
  CFStringRef v11 = [v9 stringByAppendingFormat:@"Model Name (AirPlay): %@\n", v10];

  v79 = [v6 vehicleManufacturer];
  NSRect v12 = [v11 stringByAppendingFormat:@"Manufacturer: %@\n", v79];

  id v13 = [v6 manufacturerName];
  id v14 = [v12 stringByAppendingFormat:@"Manufacturer (AirPlay): %@\n", v13];

  id v15 = [v6 vehicleSerialNumber];
  id v16 = [v14 stringByAppendingFormat:@"Serial Number: %@\n", v15];

  unsigned int v17 = [v6 PPID];
  CFStringRef v18 = [v16 stringByAppendingFormat:@"PPID: %@\n", v17];

  id v19 = [v6 endpointIdentifier];
  id v20 = [v18 stringByAppendingFormat:@"Endpoint Identifier: %@\n", v19];

  uint64_t v21 = [v6 descriptionForTransportType];
  id v77 = (void *)v21;
  CFStringRef v22 = @"Bonjour";
  if (v4) {
    CFStringRef v22 = @"Start Session";
  }
  id v23 = [v20 stringByAppendingFormat:@"Transport types: %@\nSession Type: %@\n", v21, v22];

  if ([v6 nightModeSupported]) {
    CFStringRef v24 = @"YES";
  }
  else {
    CFStringRef v24 = @"NO";
  }
  v25 = [v23 stringByAppendingFormat:@"Night Mode Supported: %@\n", v24];

  unsigned __int8 v26 = [v6 descriptionForLimitableUserInterfaces];
  uint64_t v27 = [v25 stringByAppendingFormat:@"Limitable UI Types: %@\n", v26];

  BOOL v28 = [v5 limitUserInterfaces];
  unsigned int v29 = [v28 BOOLValue];

  if (v29) {
    CFStringRef v30 = @"YES";
  }
  else {
    CFStringRef v30 = @"NO";
  }
  id v31 = [v27 stringByAppendingFormat:@"Limited UI Enabled: %@\n", v30];

  if ([v6 supportsElectronicTollCollection]) {
    CFStringRef v32 = @"YES";
  }
  else {
    CFStringRef v32 = @"NO";
  }
  long long v33 = [v31 stringByAppendingFormat:@"ETC Supported: %@\n", v32];

  if ([v6 rightHandDrive]) {
    CFStringRef v34 = @"YES";
  }
  else {
    CFStringRef v34 = @"NO";
  }
  long long v35 = [v33 stringByAppendingFormat:@"Right Hand Drive: %@\n", v34];

  long long v36 = +[CARSessionConfiguration descriptionForCapability:](CARSessionConfiguration, "descriptionForCapability:", [v6 nowPlayingAlbumArtMode]);
  long long v37 = [v35 stringByAppendingFormat:@"Capability - Album Art : %@\n", v36];

  long long v38 = +[CARSessionConfiguration descriptionForUserInterfaceStyle:](CARSessionConfiguration, "descriptionForUserInterfaceStyle:", [v6 userInterfaceStyle]);
  long long v39 = [v37 stringByAppendingFormat:@"Capability - User Interface Style: %@\n", v38];

  [v6 viewAreaInsets];
  long long v40 = +[CARSessionConfiguration descriptionForEdgeInsets:](CARSessionConfiguration, "descriptionForEdgeInsets:");
  v41 = [v39 stringByAppendingFormat:@"Capability - Safe Area Insets: %@\n", v40];

  [v6 dashboardRoundedCorners];
  v42 = +[CARSessionConfiguration descriptionForEdgeInsets:](CARSessionConfiguration, "descriptionForEdgeInsets:");
  CFStringRef v43 = [v41 stringByAppendingFormat:@"Capability - Dashboard Rounded Corners: %@\n", v42];

  if ([v6 supportsACBack]) {
    CFStringRef v44 = @"YES";
  }
  else {
    CFStringRef v44 = @"NO";
  }
  NSSize v45 = [v43 stringByAppendingFormat:@"Supports AC_BACK: %@\n", v44];

  if ([v6 vehicleSupportsDestinationSharing]) {
    CFStringRef v46 = @"YES";
  }
  else {
    CFStringRef v46 = @"NO";
  }
  v47 = [v45 stringByAppendingFormat:@"Supports Destination Sharing: %@\n", v46];

  if ([v6 supportsSiriZLL]) {
    CFStringRef v48 = @"YES";
  }
  else {
    CFStringRef v48 = @"NO";
  }
  v49 = [v47 stringByAppendingFormat:@"Supports Siri ZLL: %@\n", v48];

  if ([v6 supportsSiriZLLButton]) {
    CFStringRef v50 = @"YES";
  }
  else {
    CFStringRef v50 = @"NO";
  }
  v51 = [v49 stringByAppendingFormat:@"Supports Siri ZLL Button: %@\n", v50];

  if ([v6 supportsSiriMixable]) {
    CFStringRef v52 = @"YES";
  }
  else {
    CFStringRef v52 = @"NO";
  }
  v53 = [v51 stringByAppendingFormat:@"Supports Siri Mixable: %@\n", v52];

  [v5 voiceTriggerMode];
  v54 = CARStringFromVoiceTriggerMode();
  v55 = [v53 stringByAppendingFormat:@"Voice Trigger Mode: %@\n", v54];

  v56 = [v55 stringByAppendingString:@"\nManufacturer Icons\n"];

  v57 = [v6 manufacturerIconLabel];
  v58 = [v56 stringByAppendingFormat:@"Icon Label: %@\n", v57];

  if ([v6 manufacturerIconVisible]) {
    CFStringRef v59 = @"YES";
  }
  else {
    CFStringRef v59 = @"NO";
  }
  v60 = [v58 stringByAppendingFormat:@"Icon Visible: %@\n", v59];

  v61 = [v6 screens];
  v62 = [(CRDiagnosticsService *)self _stringForScreens:v61];
  v63 = [v60 stringByAppendingString:v62];

  v64 = [v63 stringByAppendingString:@"\nCurrent session info\n"];

  id v65 = [v5 systemNightMode];
  LODWORD(v60) = [v65 BOOLValue];

  if (v60) {
    CFStringRef v66 = @"YES";
  }
  else {
    CFStringRef v66 = @"NO";
  }
  id v67 = [v64 stringByAppendingFormat:@"Night Mode Enabled (without fallbacks): %@\n", v66];

  id v68 = [v5 nightMode];
  unsigned int v69 = [v68 BOOLValue];

  if (v69) {
    CFStringRef v70 = @"YES";
  }
  else {
    CFStringRef v70 = @"NO";
  }
  id v71 = [v67 stringByAppendingFormat:@"Night Mode Enabled (with fallbacks): %@\n", v70];

  id v72 = [v5 electronicTollCollectionAvailable];

  unsigned int v73 = [v72 BOOLValue];
  if (v73) {
    CFStringRef v74 = @"YES";
  }
  else {
    CFStringRef v74 = @"NO";
  }
  v75 = [v71 stringByAppendingFormat:@"ETC Enabled: %@\n", v74];

  return v75;
}

- (id)_extensionIdentifiersForDiagnosticsData:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 activeBundleIdentifier];
  id v5 = +[NSMutableArray array];
  unsigned int v6 = [v3 isMapsActive];

  if (v6)
  {
    [v5 addObjectsFromArray:&off_1000C7238];
    if ([v4 isEqualToString:@"com.apple.Maps"]) {
      [v5 addObject:@"com.apple.CoreRoutine.RTDiagnosticExtension"];
    }
  }
  if ([v4 isEqualToString:@"com.apple.podcasts"])
  {
    CFStringRef v7 = @"com.apple.podcasts.DiagnosticExtension";
  }
  else
  {
    if (![v4 isEqualToString:@"com.apple.Music"]) {
      goto LABEL_9;
    }
    CFStringRef v7 = @"com.apple.MediaPlayer.DiagnosticExtension";
  }
  [v5 addObject:v7];
LABEL_9:
  [v5 addObject:@"com.apple.DiagnosticExtensions.Cellular"];
  [v5 addObject:@"com.apple.voiceservices.diagnosticextension"];

  return v5;
}

- (id)radarTitleTagsForData:(id)a3
{
  if ([a3 isVehicleDataSession]) {
    BOOL v4 = @"[Next-gen CarPlay]";
  }
  else {
    BOOL v4 = @"[CarPlay]";
  }
  id v5 = [(CRDiagnosticsService *)self lastSession];
  if (v5)
  {
    BOOL v4 = [(__CFString *)v4 stringByAppendingString:@" Connection Time Issue"];
  }

  return v4;
}

- (id)radarDescriptionForData:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSMutableString string];
  id v5 = [v3 transcription];
  id v6 = [v5 length];

  if (v6)
  {
    CFStringRef v7 = [v3 transcription];
    [v4 appendFormat:@"Dictated description: %@", v7];
  }
  else
  {
    [v4 appendString:@"Please provide a brief description of this radar.\n\n"];
  }
  if ([v3 isVehicleDataSession]) {
    [v4 appendString:@"SUMMARY:\nPlease provide a summary of the issue you encountered.\n\nSTEPS TO REPRODUCE:\nPlease provide the exact steps you took before you encountered the issue.\n\nWORKAROUND:\nIs there any workaround for the issue?\n\nREGRESSION:\nHave you seen this issue in the past and already have another radar?\nIs this the first time seeing the issue?\nDid you try older builds?\n\nTEST SETUP:\niOS build:\nAsset version on the iPhone:\nCarPlay Simulator version (if using simulator):\nPartner config (if using simulator):\nIf using vehicle please ensure to also include:\nVehicle Software version:\nVehicle name:\n\nATTACHMENT CHECKLIST:\nPlease ensure the following is included for an actionable radar:\n1. Exact timestamp\n2. iPhone sysdiagnose\n3. ATS trace\n4. DLT logs (https://confluence.sd.apple.com/pages/viewpage.action?pageId=6914861788)\n5. If using CarPlay Simulator, please provide CPS/iPad logs"];
  }
  id v8 = [v3 activeBundleIdentifier];
  [v4 appendFormat:@"\n\nActive App: %@", v8];

  id v9 = [v3 siriAccount];
  id v10 = [v9 hostname];
  id v11 = [v10 length];

  if (v11)
  {
    NSRect v12 = [v3 siriAccount];
    id v13 = [v12 hostname];
    [v4 appendFormat:@"\nSiri Server Hostname: %@", v13];
  }
  id v14 = [v3 focusModeDescription];
  id v15 = [v14 length];

  if (v15)
  {
    id v16 = [v3 focusModeDescription];
    [v4 appendFormat:@"\nActive Focus Mode: %@", v16];
  }
  unsigned int v17 = [v3 timestamp];
  [v4 appendFormat:@"\nTimestamp: %@", v17];

  CFStringRef v18 = [v3 locationDescription];
  id v19 = [v18 length];

  if (v19)
  {
    id v20 = [v3 locationDescription];
    [v4 appendFormat:@"\n\nLast known location (for Maps/location investigation):\n%@", v20];
  }
  unsigned int v21 = [v3 vehicleSupportsStartSession];
  CFStringRef v22 = @"Bonjour";
  if (v21) {
    CFStringRef v22 = @"Start Session";
  }
  [v4 appendFormat:@"\nSession Type: %@", v22];
  id v23 = [v3 additionalDescription];
  id v24 = [v23 length];

  if (v24)
  {
    v25 = [v3 additionalDescription];
    [v4 appendFormat:@"\n\n%@", v25];
  }
  id v26 = [v4 copy];

  return v26;
}

- (id)radarDraftFromDiagnosticsData:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)RadarDraft);
  id v6 = [(CRDiagnosticsService *)self radarTitleTagsForData:v4];
  [v5 setTitle:v6];

  CFStringRef v7 = [(CRDiagnosticsService *)self radarDescriptionForData:v4];
  [v5 setProblemDescription:v7];

  id v8 = [objc_alloc((Class)RadarComponent) initWithName:@"CarPlay" version:@"(New Bugs)" identifier:597444];
  [v5 setComponent:v8];

  id v9 = [v4 attachmentURLs];
  [v5 setAttachments:v9];

  id v10 = [(CRDiagnosticsService *)self _extensionIdentifiersForDiagnosticsData:v4];
  [v5 setDiagnosticExtensionIDs:v10];

  id v11 = [(CRDiagnosticsService *)self _keywordsToAttachForDiagnosticsData:v4];
  [v5 setKeywords:v11];

  [v5 setAutoDiagnostics:1];
  NSRect v12 = [v4 date];

  [v5 setTimeOfIssue:v12];
  [v5 setIsUserInitiated:1];

  return v5;
}

- (void)session:(id)a3 didUpdateConfiguration:(id)a4
{
  id v5 = a4;
  if (CRIsInternalInstall()) {
    [(CRDiagnosticsService *)self setLastConfiguration:v5];
  }
}

- (void)sessionDidDisconnect:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005763C;
  block[3] = &unk_1000BD1B0;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (BOOL)initialDiagnosticsBannerPresented
{
  return self->_initialDiagnosticsBannerPresented;
}

- (void)setInitialDiagnosticsBannerPresented:(BOOL)a3
{
  self->_initialDiagnosticsBannerPresented = a3;
}

- (CRDiagnosticsData)currentDiagnosticsData
{
  return self->_currentDiagnosticsData;
}

- (void)setCurrentDiagnosticsData:(id)a3
{
}

- (OS_dispatch_queue)diagnosticsSerialQueue
{
  return self->_diagnosticsSerialQueue;
}

- (void)setDiagnosticsSerialQueue:(id)a3
{
}

- (DNDStateService)dndStateService
{
  return self->_dndStateService;
}

- (void)setDndStateService:(id)a3
{
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (unsigned)sleepInterval
{
  return self->_sleepInterval;
}

- (void)setSleepInterval:(unsigned int)a3
{
  self->_sleepInterval = a3;
}

- (OS_os_transaction)idleExitTransaction
{
  return self->_idleExitTransaction;
}

- (void)setIdleExitTransaction:(id)a3
{
}

- (CRLoggingFileReceiver)loggingFileReceiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_loggingFileReceiver);

  return (CRLoggingFileReceiver *)WeakRetained;
}

- (void)setLoggingFileReceiver:(id)a3
{
}

- (CARSessionConfiguration)lastConfiguration
{
  return self->_lastConfiguration;
}

- (void)setLastConfiguration:(id)a3
{
}

- (CARConnectionSession)lastSession
{
  return self->_lastSession;
}

- (void)setLastSession:(id)a3
{
}

- (int64_t)pendingDrafts
{
  return self->_pendingDrafts;
}

- (void)setPendingDrafts:(int64_t)a3
{
  self->_pendingDrafts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSession, 0);
  objc_storeStrong((id *)&self->_lastConfiguration, 0);
  objc_destroyWeak((id *)&self->_loggingFileReceiver);
  objc_storeStrong((id *)&self->_idleExitTransaction, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_dndStateService, 0);
  objc_storeStrong((id *)&self->_diagnosticsSerialQueue, 0);
  objc_storeStrong((id *)&self->_currentDiagnosticsData, 0);

  objc_storeStrong((id *)&self->_sessionStatus, 0);
}

@end