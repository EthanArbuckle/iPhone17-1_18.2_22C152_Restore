@interface MSDFindMyHub
+ (id)sharedInstance;
- (BOOL)askFindMyHubForHubInfo:(id *)a3;
- (BOOL)compareSavedHubHostNameWithNewHostName;
- (BOOL)compareSavedHubHostsWithNewHosts;
- (BOOL)discoverAndEnrollWithHub:(id *)a3;
- (BOOL)enrollAndSetup:(id *)a3;
- (BOOL)isLogicSync;
- (BOOL)verifyDeviceEligibility:(BOOL *)a3 error:(id *)a4;
- (MSDTargetDevice)device;
- (NSArray)serverList;
- (NSMutableString)storesSearched;
- (NSSet)helpMenuUserTapped;
- (NSString)autoEnrollmentStoreId;
- (NSString)hubHostName;
- (NSString)hubPort;
- (NSTimer)retryTimer;
- (double)autoEnrollmentTimeStamp;
- (id)prepareBundleInfoDictionary;
- (id)prepareHubOfflineDurationString;
- (int64_t)getDefaultRetryDelay;
- (unint64_t)queryFindMyHubAndDetermineLogicSyncResult;
- (void)cancelOfflineModeEnrollmentRetry;
- (void)cellularPlanDidChange:(id)a3;
- (void)checkInWithCompletion:(id)a3;
- (void)handleEnrollmentRetryUponFirstLaunch;
- (void)handleRetryTimerFireForEnrollment:(id)a3;
- (void)markAsNotDemoWithCompletion:(id)a3;
- (void)retryEnrollmentWithHub:(BOOL)a3;
- (void)scheduleRetryTimerForEnrollmentAtDate:(id)a3 isFirstLaunch:(BOOL)a4;
- (void)searchStoreWithOptions:(id)a3 completion:(id)a4;
- (void)setAutoEnrollmentInfo:(double)a3 withStoreId:(id)a4 withHelpMenuRowSelection:(id)a5;
- (void)setAutoEnrollmentStoreId:(id)a3;
- (void)setAutoEnrollmentTimeStamp:(double)a3;
- (void)setDevice:(id)a3;
- (void)setHelpMenuUserTapped:(id)a3;
- (void)setHubHostName:(id)a3;
- (void)setHubPort:(id)a3;
- (void)setIsLogicSync:(BOOL)a3;
- (void)setRetryTimer:(id)a3;
- (void)setServerList:(id)a3;
- (void)setStoresSearched:(id)a3;
- (void)setupOfflineModeEnrollmentRetry;
- (void)tryScheduleDefaultEnrollmentRetry;
@end

@implementation MSDFindMyHub

+ (id)sharedInstance
{
  if (qword_100189A48 != -1) {
    dispatch_once(&qword_100189A48, &stru_100152D60);
  }
  v2 = (void *)qword_100189A40;

  return v2;
}

- (void)handleEnrollmentRetryUponFirstLaunch
{
  v3 = [(MSDFindMyHub *)self device];
  id v4 = [v3 typeOfDemoDevice];

  __int16 v24 = 0;
  v5 = [(MSDFindMyHub *)self device];
  unsigned __int8 v6 = [v5 isDemoEligible];

  v7 = [(MSDFindMyHub *)self device];
  v8 = [v7 getDemoEnrollmentFlag];
  unsigned int v9 = [v8 isEqualToString:@"enrollmentSuccess"];

  v10 = +[MSDDemoUpdateController sharedInstance];
  [v10 getDemoUpdateInProgress:(char *)&v24 + 1 operationAllowed:&v24];

  if ((v6 & 1) == 0)
  {
    v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      v12 = "Device is not demo eligible, skipping enrollment retry";
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  if (v4 == (id)3)
  {
    v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      v12 = "Device is factory demo SKU device; skipping enrollment retry";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, v23, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v9)
  {
    v11 = sub_100068600();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    *(_WORD *)v23 = 0;
    v12 = "Device is already enrolled; skipping enrollment retry";
    goto LABEL_7;
  }
  if (HIBYTE(v24))
  {
    v11 = sub_100068600();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    *(_WORD *)v23 = 0;
    v12 = "Content update is in progress, skipping enrollment retry";
    goto LABEL_7;
  }
  if (v4 != (id)5)
  {
    v21 = sub_100068600();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      v22 = "Unconditionally retry enrollment upon first launch!";
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, v23, 2u);
    }
LABEL_26:

    [(MSDFindMyHub *)self retryEnrollmentWithHub:1];
    return;
  }
  v13 = [(MSDFindMyHub *)self device];
  id v14 = [v13 findMyHubRetryAtTime];

  if ((uint64_t)v14 <= 0)
  {
    v21 = sub_100068600();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      v22 = "No FMH retry time set? Retry enrollment anyways.";
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  v15 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)(uint64_t)v14];
  v16 = +[NSDate date];
  [v15 timeIntervalSinceDate:v16];
  double v18 = v17;

  v19 = sub_100068600();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v18 <= 300.0)
  {
    if (v20)
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "FMH retry timer is already expired or is about to expire. Retry now!", v23, 2u);
    }

    [(MSDFindMyHub *)self retryEnrollmentWithHub:1];
  }
  else
  {
    if (v20)
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "FMH retry timer will be scheduled.", v23, 2u);
    }

    [(MSDFindMyHub *)self scheduleRetryTimerForEnrollmentAtDate:v15 isFirstLaunch:1];
  }
}

- (void)setAutoEnrollmentInfo:(double)a3 withStoreId:(id)a4 withHelpMenuRowSelection:(id)a5
{
  v8 = (NSString *)a4;
  unsigned int v9 = (NSSet *)a5;
  self->_autoEnrollmentTimeStamp = a3;
  autoEnrollmentStoreId = self->_autoEnrollmentStoreId;
  self->_autoEnrollmentStoreId = v8;
  v12 = v8;

  helpMenuUserTapped = self->_helpMenuUserTapped;
  self->_helpMenuUserTapped = v9;
}

- (BOOL)discoverAndEnrollWithHub:(id *)a3
{
  v5 = [(MSDFindMyHub *)self device];
  id v6 = [v5 typeOfDemoDevice];

  v7 = +[NSMutableDictionary dictionary];
  [(MSDFindMyHub *)self setIsLogicSync:0];
  if (v6 == (id)5)
  {
    v8 = +[NSDate dateWithTimeIntervalSince1970:self->_autoEnrollmentTimeStamp];
    [v7 setObject:v8 forKey:@"AutoEnrollmentTimeStamp"];

    autoEnrollmentStoreId = self->_autoEnrollmentStoreId;
    if (autoEnrollmentStoreId) {
      [v7 setObject:autoEnrollmentStoreId forKey:@"AutoEnrollmentSelectedStoreID"];
    }
    helpMenuUserTapped = self->_helpMenuUserTapped;
    if (helpMenuUserTapped) {
      [v7 setObject:helpMenuUserTapped forKey:@"AutoEnrollmentHelpMenuUserTapped"];
    }
    v11 = +[MSDLanguageAndRegionManager sharedInstance];
    v12 = [v11 getCurrentDeviceLanguage];
    [v7 setObject:v12 forKey:@"AutoEnrollmentLanguageCodeInfo"];

    v13 = +[MSDLanguageAndRegionManager sharedInstance];
    id v14 = [v13 getCurrentDeviceRegion];
    [v7 setObject:v14 forKey:@"AutoEnrollmentCountryCodeInfo"];

    storesSearched = self->_storesSearched;
    if (storesSearched) {
      [v7 setObject:storesSearched forKey:@"AutoEnrollmentStoresSearchedInfo"];
    }
    v16 = +[MSDCellularHelper sharedInstance];
    double v17 = [v16 getCellularSimInfo];

    if (!v17) {
      double v17 = objc_opt_new();
    }
    [v7 setObject:v17 forKey:@"AutoEnrollmentNetworkInfo"];
    double v18 = +[MSDWiFiHelper sharedInstance];
    uint64_t v19 = [v18 getCurrentWiFiSsid];

    if (v19) {
      BOOL v20 = (__CFString *)v19;
    }
    else {
      BOOL v20 = &stru_100155450;
    }
    [v7 setObject:v20 forKey:@"AutoEnrollmentWiFiSSID"];
  }
  char v50 = 0;
  id v49 = 0;
  unsigned int v21 = [(MSDFindMyHub *)self verifyDeviceEligibility:&v50 error:&v49];
  id v22 = v49;
  id v23 = v22;
  if (!v21) {
    goto LABEL_28;
  }
  if (!v50)
  {
    v34 = sub_100068600();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_1000D0404();
    }

    id v48 = v23;
    sub_1000C3140(&v48, 3727740941, @"Device is not eligible for demo program.");
    id v25 = v48;

    goto LABEL_27;
  }
  id v47 = v22;
  unsigned int v24 = [(MSDFindMyHub *)self askFindMyHubForHubInfo:&v47];
  id v25 = v47;

  if (!v24)
  {
LABEL_27:
    id v23 = v25;
    goto LABEL_28;
  }
  id v46 = v25;
  unsigned int v26 = [(MSDFindMyHub *)self enrollAndSetup:&v46];
  id v23 = v46;

  if (!v26)
  {
LABEL_28:
    if (a3) {
      *a3 = v23;
    }
    v35 = [(MSDFindMyHub *)self device];
    unsigned int v36 = [v35 isOfflineMode];

    if (v36)
    {
      v37 = [(MSDFindMyHub *)self device];
      unsigned __int8 v38 = [v37 cachedBundleInstallAttempted];

      if (v38)
      {
        v39 = [(MSDFindMyHub *)self device];
        unsigned int v40 = [v39 dcotaOfflineModeDevice];

        if (v40) {
          [(MSDFindMyHub *)self setupOfflineModeEnrollmentRetry];
        }
      }
      else
      {
        v41 = sub_100068600();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v45 = 0;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Installing cached bundle from enrollment failure", v45, 2u);
        }

        v42 = [(MSDFindMyHub *)self device];
        [v42 kickOffCachedBundleInstall];
      }
    }
    if (v6 != (id)5)
    {
      BOOL v27 = 0;
      goto LABEL_23;
    }
    v43 = +[NSNumber numberWithBool:0];
    [v7 setObject:v43 forKey:@"AutoEnrollmentStatus"];

    v44 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v23 code]);
    [v7 setObject:v44 forKey:@"ErrorCode"];

    BOOL v27 = 0;
LABEL_20:
    v31 = [v23 localizedDescription];
    [v7 setObject:v31 forKey:@"ErrorMessage"];

    goto LABEL_21;
  }
  if (v6 != (id)5)
  {
    BOOL v27 = 1;
    goto LABEL_23;
  }
  BOOL v27 = 1;
  v28 = +[NSNumber numberWithBool:1];
  [v7 setObject:v28 forKey:@"AutoEnrollmentStatus"];

  v29 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v23 code]);
  [v7 setObject:v29 forKey:@"ErrorCode"];

  v30 = [v23 localizedDescription];

  if (v30) {
    goto LABEL_20;
  }
LABEL_21:
  v32 = +[MSDAnalyticsEventHandler sharedInstance];
  [v32 sendAutoEnrollmentResults:v7];

LABEL_23:
  return v27;
}

- (unint64_t)queryFindMyHubAndDetermineLogicSyncResult
{
  [(MSDFindMyHub *)self setIsLogicSync:1];
  if ([(MSDFindMyHub *)self askFindMyHubForHubInfo:0])
  {
    if ([(MSDFindMyHub *)self compareSavedHubHostNameWithNewHostName]) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = 2;
    }
    if ([(MSDFindMyHub *)self compareSavedHubHostsWithNewHosts]) {
      unint64_t v4 = v3;
    }
    else {
      unint64_t v4 = v3 | 4;
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    unint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Logic sync completed with result - %lu", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (void)checkInWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Checking in device with DU...", buf, 2u);
  }

  id v6 = objc_alloc_init(MSDCheckInRequest);
  int v7 = [(MSDFindMyHub *)self device];
  unint64_t v8 = [v7 OSVersion];
  [(MSDCheckInRequest *)v6 setOsVersion:v8];

  unsigned int v9 = [(MSDFindMyHub *)self device];
  v10 = [v9 serialNumber];
  [(MSDCheckInRequest *)v6 setSerialNumber:v10];

  v11 = +[MSDLanguageAndRegionManager sharedInstance];
  v12 = [v11 getCurrentDeviceLanguage];
  [(MSDCheckInRequest *)v6 setLanguage:v12];

  v13 = +[MSDLanguageAndRegionManager sharedInstance];
  id v14 = [v13 getCurrentDeviceRegion];
  [(MSDCheckInRequest *)v6 setCountryCode:v14];

  v15 = [(MSDFindMyHub *)self device];
  -[MSDCheckInRequest setHasFactoryContent:](v6, "setHasFactoryContent:", [v15 typeOfDemoDevice] == (id)5);

  if (os_variant_has_internal_content())
  {
    v16 = +[MSDTestPreferences sharedInstance];
    double v17 = [v16 demoUnitServerURL];

    if (v17)
    {
      double v18 = [v17 host];
      [(MSDCommandServerRequest *)v6 setServer:v18];

      uint64_t v19 = [v17 port];
      BOOL v20 = [v19 stringValue];
      [(MSDCommandServerRequest *)v6 setPort:v20];

      [(MSDDemoUnitServerRequest *)v6 setUrlOverride:v17];
    }
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10005B568;
  v23[3] = &unk_100152D88;
  id v24 = v4;
  id v21 = v4;
  [(MSDServerRequest *)v6 setCompletion:v23];
  id v22 = +[MSDServerRequestHandler sharedInstance];
  [v22 handleRequestAsync:v6];
}

- (void)markAsNotDemoWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(MSDNotDemoRequest);
  id v6 = [(MSDFindMyHub *)self device];
  int v7 = [v6 serialNumber];
  [(MSDNotDemoRequest *)v5 setSerialNumber:v7];

  if (os_variant_has_internal_content())
  {
    unint64_t v8 = +[MSDTestPreferences sharedInstance];
    unsigned int v9 = [v8 demoUnitServerURL];

    if (v9)
    {
      v10 = [v9 host];
      [(MSDCommandServerRequest *)v5 setServer:v10];

      v11 = [v9 port];
      v12 = [v11 stringValue];
      [(MSDCommandServerRequest *)v5 setPort:v12];

      [(MSDDemoUnitServerRequest *)v5 setUrlOverride:v9];
    }
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005B860;
  v15[3] = &unk_100152D88;
  id v16 = v4;
  id v13 = v4;
  [(MSDServerRequest *)v5 setCompletion:v15];
  id v14 = +[MSDServerRequestHandler sharedInstance];
  [v14 handleRequestAsync:v5];
}

- (void)searchStoreWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = objc_alloc_init(MSDStoreSearchRequest);
  unsigned int v9 = [v7 objectForKey:@"Longitude"];
  [(MSDStoreSearchRequest *)v8 setLongitude:v9];

  v10 = [v7 objectForKey:@"Latitude"];
  [(MSDStoreSearchRequest *)v8 setLatitude:v10];

  v11 = [v7 objectForKey:@"Text"];
  [(MSDStoreSearchRequest *)v8 setText:v11];

  v12 = [v7 objectForKey:@"MaxResults"];

  [(MSDStoreSearchRequest *)v8 setMaxStoreResults:v12];
  id v13 = [(MSDStoreSearchRequest *)v8 text];
  id v14 = [v13 length];

  if (v14)
  {
    v15 = [(MSDFindMyHub *)self storesSearched];
    id v16 = [(MSDStoreSearchRequest *)v8 text];
    [v15 appendString:v16];

    double v17 = [(MSDFindMyHub *)self storesSearched];
    [v17 appendString:@","];
  }
  if (os_variant_has_internal_content())
  {
    double v18 = +[MSDTestPreferences sharedInstance];
    uint64_t v19 = [v18 demoUnitServerURL];

    if (v19)
    {
      BOOL v20 = [v19 host];
      [(MSDCommandServerRequest *)v8 setServer:v20];

      id v21 = [v19 port];
      id v22 = [v21 stringValue];
      [(MSDCommandServerRequest *)v8 setPort:v22];

      [(MSDDemoUnitServerRequest *)v8 setUrlOverride:v19];
    }
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10005BB70;
  v25[3] = &unk_100152D88;
  id v26 = v6;
  id v23 = v6;
  [(MSDServerRequest *)v8 setCompletion:v25];
  id v24 = +[MSDServerRequestHandler sharedInstance];
  [v24 handleRequestAsync:v8];
}

- (void)setupOfflineModeEnrollmentRetry
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = +[MSDCellularHelper sharedInstance];
  unsigned __int8 v4 = [v3 hasObserver:v2];

  if ((v4 & 1) == 0)
  {
    v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting cellular plan monitor for enrollment retry", v7, 2u);
    }

    id v6 = +[MSDCellularHelper sharedInstance];
    [v6 addObserver:v2];
  }
  objc_sync_exit(v2);
}

- (void)cellularPlanDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(MSDFindMyHub *)self device];
  unsigned int v6 = [v5 dcotaOfflineModeDevice];

  if (v6)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) objectForKey:@"SimType"];
          if ([v12 isEqualToNumber:&off_100162150])
          {
            id v13 = dispatch_get_global_queue(21, 0);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10005BEB8;
            block[3] = &unk_100151AF0;
            block[4] = self;
            dispatch_async(v13, block);

            goto LABEL_12;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (int64_t)getDefaultRetryDelay
{
  if (!os_variant_has_internal_content()) {
    return 3600;
  }
  v2 = +[MSDTestPreferences sharedInstance];
  int64_t v3 = (int64_t)[v2 findMyHubRetryDelay];

  if (v3 < 1) {
    return 3600;
  }
  id v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    int64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Overriding FMH retry delay to: %ld", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (BOOL)verifyDeviceEligibility:(BOOL *)a3 error:(id *)a4
{
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_10005C3F0;
  v31 = sub_10005C400;
  id v32 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_10005C3F0;
  id v25 = sub_10005C400;
  dispatch_semaphore_t v26 = dispatch_semaphore_create(0);
  int64_t v7 = +[MSDPreferencesFile sharedInstance];
  id v8 = [v7 objectForKey:@"DemoEligible"];

  id v9 = sub_100068600();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Verifying device eligibility...", buf, 2u);
  }

  if (v8)
  {
    *a3 = [v8 BOOLValue];
    uint64_t v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = *a3;
      *(_DWORD *)buf = 67109120;
      LODWORD(v34) = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "DU CheckIn completed, eligibility is %d", buf, 8u);
    }
  }
  else
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10005C408;
    v20[3] = &unk_100152DB0;
    v20[4] = &v27;
    v20[5] = &v21;
    v20[6] = a3;
    [(MSDFindMyHub *)self checkInWithCompletion:v20];
    v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Waiting for CheckIn to complete...", buf, 2u);
    }

    dispatch_semaphore_wait((dispatch_semaphore_t)v22[5], 0xFFFFFFFFFFFFFFFFLL);
    id v13 = sub_100068600();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v14 = *a3;
      *(_DWORD *)buf = 67109120;
      LODWORD(v34) = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CheckIn to completed; eligibility is %{BOOL}d",
        buf,
        8u);
    }

    if (v28[5])
    {
      long long v15 = sub_100068600();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = v28[5];
        *(_DWORD *)buf = 136315394;
        v34 = "-[MSDFindMyHub verifyDeviceEligibility:error:]";
        __int16 v35 = 2114;
        uint64_t v36 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: checkIn failed with error: %{public}@", buf, 0x16u);
      }

      [(MSDFindMyHub *)self tryScheduleDefaultEnrollmentRetry];
    }
  }
  long long v17 = v28;
  if (a4)
  {
    *a4 = (id) v28[5];
    long long v17 = v28;
  }
  BOOL v18 = v17[5] == 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v18;
}

- (BOOL)askFindMyHubForHubInfo:(id *)a3
{
  v5 = objc_alloc_init(MSDFMHRequest);
  [(MSDFMHRequest *)v5 setLogicSync:[(MSDFindMyHub *)self isLogicSync]];
  int v6 = [(MSDFindMyHub *)self prepareBundleInfoDictionary];
  [(MSDFMHRequest *)v5 setBundleInfo:v6];

  int64_t v7 = [(MSDFindMyHub *)self prepareHubOfflineDurationString];
  [(MSDFMHRequest *)v5 setOfflineDuration:v7];

  id v8 = +[MSDLanguageAndRegionManager sharedInstance];
  id v9 = [v8 getCurrentDeviceLanguage];
  [(MSDFMHRequest *)v5 setLanguage:v9];

  uint64_t v10 = +[MSDLanguageAndRegionManager sharedInstance];
  BOOL v11 = [v10 getCurrentDeviceRegion];
  [(MSDFMHRequest *)v5 setCountryCode:v11];

  if (![(MSDFindMyHub *)self isLogicSync])
  {
    v12 = [(MSDFindMyHub *)self device];
    id v13 = [v12 preferredStoreID];
    [(MSDFMHRequest *)v5 setStoreId:v13];
  }
  if (os_variant_has_internal_content())
  {
    BOOL v14 = +[MSDTestPreferences sharedInstance];
    long long v15 = [v14 demoUnitServerURL];

    if (v15)
    {
      uint64_t v16 = [v15 host];
      [(MSDCommandServerRequest *)v5 setServer:v16];

      long long v17 = [v15 port];
      BOOL v18 = [v17 stringValue];
      [(MSDCommandServerRequest *)v5 setPort:v18];

      [(MSDDemoUnitServerRequest *)v5 setUrlOverride:v15];
    }
  }
  uint64_t v19 = +[MSDServerRequestHandler sharedInstance];
  BOOL v20 = [v19 handleRequestSync:v5];

  id v21 = [v20 error];
  if (v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v39 = sub_100068600();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_1000D05B0((uint64_t)v21, v39);
    }

    id v22 = 0;
    goto LABEL_25;
  }
  id v22 = [v20 retryAfter];
  uint64_t v23 = [v20 fmhDict];
  id v24 = sub_100068600();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v53 = (uint64_t)v23;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "FindMyHub returned: %{public}@", buf, 0xCu);
  }

  if (!v23)
  {
    if (v22 && (uint64_t)[v22 integerValue] >= 1)
    {
      v44 = sub_100068600();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v53 = (uint64_t)v22;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "FindMyHub asked for retry in %{public}@ seconds.", buf, 0xCu);
      }

      v45 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)(uint64_t)[v22 integerValue]);
      if (![(MSDFindMyHub *)self isLogicSync]) {
        [(MSDFindMyHub *)self scheduleRetryTimerForEnrollmentAtDate:v45 isFirstLaunch:0];
      }
      id v46 = [(MSDFindMyHub *)self device];
      [v45 timeIntervalSinceReferenceDate];
      [v46 saveFindMyHubRetryAtTime:(uint64_t)v47];

      if ((uint64_t)[v22 integerValue] >= 31536000)
      {
        id v48 = sub_100068600();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          id v49 = [v22 integerValue];
          *(_DWORD *)buf = 134218240;
          uint64_t v53 = 31536000;
          __int16 v54 = 2048;
          id v55 = v49;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "FindMyHub retry value %lu is greater than or equal to threshold %lu, returning unrecoverable error", buf, 0x16u);
        }

        id v21 = 0;
      }
      else
      {
        id v51 = 0;
        sub_1000C3140(&v51, 3727740936, @"Server requested retry at a later time.");
        id v21 = v51;
      }
      goto LABEL_26;
    }
LABEL_25:
    [(MSDFindMyHub *)self tryScheduleDefaultEnrollmentRetry];
LABEL_26:
    unsigned int v40 = sub_100068600();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_1000D0438();
    }
    uint64_t v23 = 0;
    __int16 v35 = 0;
    dispatch_semaphore_t v26 = 0;
    v28 = 0;
    goto LABEL_29;
  }
  id v25 = [(MSDFindMyHub *)self device];
  [v25 saveFindMyHubRetryAtTime:0];

  dispatch_semaphore_t v26 = [v23 objectForKeyedSubscript:@"URL"];
  if (!v26 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    unsigned int v40 = sub_100068600();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_1000D046C(v40);
    }
    __int16 v35 = 0;
    v28 = 0;
    goto LABEL_45;
  }
  uint64_t v27 = +[NSURL URLWithString:v26];
  v28 = v27;
  if (!v27 || ([v27 host], uint64_t v29 = objc_claimAutoreleasedReturnValue(), v29, !v29))
  {
    unsigned int v40 = sub_100068600();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_1000D04F0((uint64_t)v26, v40);
    }
    __int16 v35 = 0;
    goto LABEL_45;
  }
  v30 = [v28 host];
  [(MSDFindMyHub *)self setHubHostName:v30];

  v31 = [(MSDFindMyHub *)self hubHostName];
  id v32 = +[NSArray arrayWithObject:v31];
  [(MSDFindMyHub *)self setServerList:v32];

  v33 = [v28 port];
  v34 = [v33 stringValue];
  [(MSDFindMyHub *)self setHubPort:v34];

  __int16 v35 = [v23 objectForKeyedSubscript:@"device_info"];
  uint64_t v36 = [(MSDFindMyHub *)self hubHostName];

  if (!v36)
  {
    unsigned int v40 = sub_100068600();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_1000D057C();
    }
LABEL_45:
    id v21 = 0;
LABEL_29:

    if (a3)
    {
      id v50 = v21;
      sub_1000C31D4(&v50, 3727744512, @"Cannot enroll the device with DemoUnit.");
      id v41 = v50;

      id v21 = v41;
      *a3 = v21;
    }
    v42 = +[MSDAnalyticsEventHandler sharedInstance];
    [v42 sendFMHFailureEvent:v21];
    BOOL v38 = 0;
    goto LABEL_32;
  }
  v37 = [(MSDFindMyHub *)self hubPort];

  if (!v37) {
    [(MSDFindMyHub *)self setHubPort:@"443"];
  }
  if (v35)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v42 = +[MSDNPIMaskValues sharedInstance];
      [v42 saveDeviceInfo:v35];
      id v21 = 0;
      BOOL v38 = 1;
LABEL_32:

      goto LABEL_33;
    }
  }
  id v21 = 0;
  BOOL v38 = 1;
LABEL_33:

  return v38;
}

- (id)prepareBundleInfoDictionary
{
  id v3 = objc_alloc_init((Class)NSDictionary);
  if (![(MSDFindMyHub *)self isLogicSync])
  {
    id v4 = [(MSDFindMyHub *)self device];
    id v5 = [v4 typeOfDemoDevice];

    if (v5 == (id)5)
    {
      int v6 = +[MSDHelperAgent sharedInstance];
      uint64_t v7 = [v6 readPlistFile:@"/private/var/demo_backup/Metadata/Content.plist"];

      id v3 = (id)v7;
      if (!v7)
      {
        id v8 = sub_100068600();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_1000D065C();
        }

        id v3 = objc_alloc_init((Class)NSDictionary);
      }
      if (!+[NSJSONSerialization isValidJSONObject:v3])
      {
        id v9 = sub_100068600();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1000D0628();
        }

        id v10 = objc_alloc_init((Class)NSDictionary);
        id v3 = v10;
      }
    }
  }
  BOOL v11 = sub_100068600();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    id v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Bundle Info for FindMyHub: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  return v3;
}

- (id)prepareHubOfflineDurationString
{
  if ([(MSDFindMyHub *)self isLogicSync])
  {
    id v3 = [(MSDFindMyHub *)self device];
    uint64_t v4 = (uint64_t)[v3 hubLastOnlineTime];

    id v5 = +[NSDate date];
    [v5 timeIntervalSinceReferenceDate];
    double v7 = v6;

    if (v4 < 1 || (uint64_t v8 = (uint64_t)v7 - v4, (uint64_t)v7 <= v4))
    {
      id v9 = sub_100068600();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unable to calculate hub last online time. Use system-up time instead.", buf, 2u);
      }

      id v10 = +[NSProcessInfo processInfo];
      [v10 systemUptime];
      uint64_t v8 = (uint64_t)v11;
    }
    v12 = +[NSString stringWithFormat:@"%ld", v8];
    int v13 = sub_100068600();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Hub has been offline for %{public}@ seconds.", buf, 0xCu);
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)scheduleRetryTimerForEnrollmentAtDate:(id)a3 isFirstLaunch:(BOOL)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005D034;
  block[3] = &unk_100152DD8;
  BOOL v9 = a4;
  id v7 = a3;
  uint64_t v8 = self;
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)handleRetryTimerFireForEnrollment:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"isFirstLaunch"];
  unsigned __int8 v6 = [v5 BOOLValue];

  id v7 = +[MSDWorkQueueSet sharedInstance];
  uint64_t v8 = [v7 demoUpdateQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005D328;
  v9[3] = &unk_100152E00;
  v9[4] = self;
  unsigned __int8 v10 = v6;
  dispatch_async(v8, v9);
}

- (void)retryEnrollmentWithHub:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  id v5 = [(MSDFindMyHub *)v4 device];
  unsigned __int8 v6 = [v5 isOfflineMode];

  id v7 = [(MSDFindMyHub *)v4 device];
  uint64_t v8 = [v7 getDemoEnrollmentFlag];

  if ([v8 isEqualToString:@"enrollmentSuccess"])
  {
    BOOL v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Enrollment successful, ignoring enrollment retry", buf, 2u);
    }
  }
  else
  {
    if ((v6 & 1) == 0)
    {
      unsigned __int8 v10 = +[MSDUIHelper sharedInstance];
      [v10 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:0];
    }
    if (v3)
    {
      double v11 = [(MSDFindMyHub *)v4 device];
      [v11 configureNetworkInterface];

      v12 = [(MSDFindMyHub *)v4 device];
      [v12 waitForNetworkReachability];
    }
    int v13 = sub_100068600();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(MSDFindMyHub *)v4 device];
      long long v15 = [v14 getDemoEnrollmentFlag];
      *(_DWORD *)buf = 136315394;
      uint64_t v23 = "-[MSDFindMyHub retryEnrollmentWithHub:]";
      __int16 v24 = 2114;
      id v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: requesting discoverAndEnrollWithHub, currentEnrollFlag:%{public}@", buf, 0x16u);
    }
    id v21 = 0;
    unsigned int v16 = [(MSDFindMyHub *)v4 discoverAndEnrollWithHub:&v21];
    BOOL v9 = v21;
    if (v16)
    {
      [(MSDFindMyHub *)v4 cancelOfflineModeEnrollmentRetry];
      long long v17 = [(MSDFindMyHub *)v4 device];
      [v17 setDemoEnrollmentFlag:@"enrollmentSuccess"];
    }
    else
    {
      BOOL v18 = [(MSDFindMyHub *)v4 device];
      [v18 setDemoEnrollmentFlag:@"enrollmentFailed"];

      if ((v6 & 1) == 0)
      {
        uint64_t v19 = +[MSDUIHelper sharedInstance];
        [v19 stopFullScreenUI:v9];
      }
      BOOL v20 = sub_100068600();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v23 = (const char *)v9;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Enrollment retry failed with error: %{public}@", buf, 0xCu);
      }
    }
  }

  objc_sync_exit(v4);
}

- (BOOL)enrollAndSetup:(id *)a3
{
  uint64_t v5 = [(MSDFindMyHub *)self hubHostName];
  if (v5
    && (unsigned __int8 v6 = (void *)v5,
        [(MSDFindMyHub *)self hubPort],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    uint64_t v8 = +[MSDDemoUpdateController sharedInstance];
    BOOL v9 = [(MSDFindMyHub *)self device];
    [v9 configureNetworkInterface];

    unsigned __int8 v10 = [(MSDFindMyHub *)self device];
    [v10 waitForNetworkReachability];

    double v11 = [(MSDFindMyHub *)self hubHostName];
    v12 = [(MSDFindMyHub *)self hubPort];
    id v23 = 0;
    unsigned __int8 v13 = [v8 enrollForDeviceName:0 pairingCredential:0 hubHostName:v11 hubPort:v12 error:&v23];
    id v14 = v23;

    if (v13)
    {
      long long v15 = [(MSDFindMyHub *)self device];
      unsigned int v16 = [(MSDFindMyHub *)self serverList];
      [v15 saveHubHostNameList:v16];

      BOOL v17 = 1;
      goto LABEL_14;
    }
    uint64_t v19 = sub_100068600();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v25 = "-[MSDFindMyHub enrollAndSetup:]";
      __int16 v26 = 2114;
      uint64_t v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s: enrollment failed with error: %{public}@", buf, 0x16u);
    }

    [(MSDFindMyHub *)self tryScheduleDefaultEnrollmentRetry];
    BOOL v18 = +[NSError errorDomainMSDWithCode:3727741088 message:@"Cannot enroll the device with vHub."];
  }
  else
  {
    id v14 = sub_100068600();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000D0690(self, v14);
    }
    BOOL v18 = 0;
    uint64_t v8 = 0;
  }

  id v22 = v18;
  sub_1000C31D4(&v22, 3727744512, @"Cannot enroll the device with vHub.");
  id v14 = v22;

  BOOL v20 = +[MSDAnalyticsEventHandler sharedInstance];
  [v20 sendEnrollmentFailureEvent:v14];

  if (a3)
  {
    id v14 = v14;
    BOOL v17 = 0;
    *a3 = v14;
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_14:

  return v17;
}

- (BOOL)compareSavedHubHostNameWithNewHostName
{
  BOOL v3 = [(MSDFindMyHub *)self device];
  uint64_t v4 = [v3 hubHostNameList];

  uint64_t v5 = [(MSDFindMyHub *)self device];
  unsigned __int8 v6 = [v5 hubHostName];
  id v7 = [v6 lowercaseString];

  if ([v7 hasSuffix:@"."])
  {
    uint64_t v8 = [v7 substringToIndex:([v7 length] - 1)];

    id v7 = (void *)v8;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [[*(id *)(*((void *)&v19 + 1) + 8 * i) lowercaseString:v19];
        if ([v14 hasSuffix:@"."])
        {
          uint64_t v15 = [v14 substringToIndex:([v14 length] - 1)];

          id v14 = (void *)v15;
        }
        unsigned __int8 v16 = [v14 isEqualToString:v7];

        if (v16)
        {
          BOOL v17 = 1;
          goto LABEL_15;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v17 = 0;
LABEL_15:

  return v17;
}

- (BOOL)compareSavedHubHostsWithNewHosts
{
  BOOL v3 = +[NSMutableSet set];
  uint64_t v4 = +[NSMutableSet set];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v5 = [(MSDFindMyHub *)self device];
  unsigned __int8 v6 = [v5 hubHostNameList];

  id v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([v11 hasSuffix:@"."])
        {
          [v11 substringToIndex:[v11 length] - 1];
          id v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v12 = v11;
        }
        unsigned __int8 v13 = v12;
        id v14 = [v12 lowercaseString];
        [v3 addObject:v14];
      }
      id v8 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v8);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v15 = [(MSDFindMyHub *)self serverList];
  id v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v26 + 1) + 8 * (void)j);
        if ([v20 hasSuffix:@"."])
        {
          [v20 substringToIndex:[v20 length] - 1];
          id v21 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v21 = v20;
        }
        long long v22 = v21;
        id v23 = [v21 lowercaseString];
        [v4 addObject:v23];
      }
      id v17 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v17);
  }

  unsigned __int8 v24 = [v3 isEqualToSet:v4];
  return v24;
}

- (void)tryScheduleDefaultEnrollmentRetry
{
  BOOL v3 = [(MSDFindMyHub *)self device];
  unsigned int v4 = [v3 dcotaOfflineModeDevice];

  if (v4)
  {
    [(MSDFindMyHub *)self setupOfflineModeEnrollmentRetry];
  }
  else if ([(MSDFindMyHub *)self isLogicSync])
  {
    uint64_t v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      unsigned __int8 v13 = "-[MSDFindMyHub tryScheduleDefaultEnrollmentRetry]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: not scheduling default enrollment retry for logic sync", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    uint64_t v6 = [(MSDFindMyHub *)self getDefaultRetryDelay];
    id v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      unsigned __int8 v13 = "-[MSDFindMyHub tryScheduleDefaultEnrollmentRetry]";
      __int16 v14 = 2048;
      uint64_t v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: retrying enrollment in %ld seconds", (uint8_t *)&v12, 0x16u);
    }

    id v8 = +[NSDate dateWithTimeIntervalSinceNow:(double)v6];
    [(MSDFindMyHub *)self scheduleRetryTimerForEnrollmentAtDate:v8 isFirstLaunch:0];
    uint64_t v9 = [(MSDFindMyHub *)self device];
    id v10 = +[NSDate date];
    [v10 timeIntervalSinceReferenceDate];
    [v9 saveFindMyHubRetryAtTime:(uint64_t)v11];
  }
}

- (void)cancelOfflineModeEnrollmentRetry
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = +[MSDCellularHelper sharedInstance];
  unsigned int v4 = [v3 hasObserver:v2];

  if (v4)
  {
    uint64_t v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Terminating cellular plan monitor for enrollment retry", v7, 2u);
    }

    uint64_t v6 = +[MSDCellularHelper sharedInstance];
    [v6 removeObserver:v2];
  }
  objc_sync_exit(v2);
}

- (MSDTargetDevice)device
{
  return (MSDTargetDevice *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDevice:(id)a3
{
}

- (NSArray)serverList
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setServerList:(id)a3
{
}

- (NSTimer)retryTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRetryTimer:(id)a3
{
}

- (NSString)hubHostName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHubHostName:(id)a3
{
}

- (NSString)hubPort
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setHubPort:(id)a3
{
}

- (BOOL)isLogicSync
{
  return self->_isLogicSync;
}

- (void)setIsLogicSync:(BOOL)a3
{
  self->_isLogicSync = a3;
}

- (double)autoEnrollmentTimeStamp
{
  return self->_autoEnrollmentTimeStamp;
}

- (void)setAutoEnrollmentTimeStamp:(double)a3
{
  self->_autoEnrollmentTimeStamp = a3;
}

- (NSString)autoEnrollmentStoreId
{
  return self->_autoEnrollmentStoreId;
}

- (void)setAutoEnrollmentStoreId:(id)a3
{
}

- (NSSet)helpMenuUserTapped
{
  return self->_helpMenuUserTapped;
}

- (void)setHelpMenuUserTapped:(id)a3
{
}

- (NSMutableString)storesSearched
{
  return self->_storesSearched;
}

- (void)setStoresSearched:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storesSearched, 0);
  objc_storeStrong((id *)&self->_helpMenuUserTapped, 0);
  objc_storeStrong((id *)&self->_autoEnrollmentStoreId, 0);
  objc_storeStrong((id *)&self->_hubPort, 0);
  objc_storeStrong((id *)&self->_hubHostName, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_serverList, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end