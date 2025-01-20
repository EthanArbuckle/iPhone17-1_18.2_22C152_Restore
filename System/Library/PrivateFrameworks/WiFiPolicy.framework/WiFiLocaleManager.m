@interface WiFiLocaleManager
+ (id)getStringOfLocaleSource:(int)a3;
- (BOOL)isDefaultCountryCode:(id)a3;
- (BOOL)localeCheckSuspended;
- (BOOL)shouldDetermineNewLocale;
- (NSDateFormatter)dateFormatter;
- (NSString)localeCountryCode;
- (NSString)testHost11d;
- (NSString)testPeer;
- (NSString)testTimeZoneCC;
- (NSString)testUserDefaults;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)localeTimer;
- (OS_dispatch_source)retryTimer;
- (WiFiLocaleManager)init;
- (WiFiLocaleManagerDelegate)delegate;
- (WiFiLocationManager)locationManager;
- (double)localeLastUpdatedTime;
- (double)localeTimeout;
- (id)applySetCountryCodeExceptions:(id)a3;
- (id)getLocaleFromCompanion;
- (id)getLocaleFromLocation:(id)a3;
- (id)getLocaleFromMcc;
- (id)getLocaleFromMultiple80211d;
- (id)getLocaleFromPeer;
- (id)getLocaleFromTimezone;
- (id)getLocaleFromUserDefaults;
- (id)getLocaleUsingBoundingBoxes:(id)a3;
- (id)getLocaleUsingGeoLocationCache:(id)a3;
- (id)getLocaleUsingReverseGeocoder:(id)a3;
- (id)getRestrictedCountryCodeFromRegionInfo;
- (id)getRestrictedCountryCodeFromTimezone;
- (int)aggressiveRetryAttemptsRemaining;
- (int)localeSource;
- (int)testMcc;
- (unsigned)getNetworkReachability;
- (unsigned)isWaitingForLocationUpdate;
- (unsigned)testModeEnabled;
- (void)dealloc;
- (void)determineAndSetLocale:(unsigned __int8)a3;
- (void)determineLocale:(unsigned __int8)a3;
- (void)didChangeAuthorizationStatus;
- (void)didFailWithError:(id)a3;
- (void)didUpdateLocations:(id)a3;
- (void)getLocaleFromMcc;
- (void)setAggressiveRetryAttemptsRemaining:(int)a3;
- (void)setCountryCode:(id)a3 source:(int)a4;
- (void)setDateFormatter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsWaitingForLocationUpdate:(unsigned __int8)a3;
- (void)setLocaleCheckSuspended:(BOOL)a3;
- (void)setLocaleCountryCode:(id)a3;
- (void)setLocaleLastUpdatedTime:(double)a3;
- (void)setLocaleSource:(int)a3;
- (void)setLocaleTestParams:(id)a3;
- (void)setLocaleTimeout:(double)a3;
- (void)setLocaleTimer:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRetryTimer:(id)a3;
- (void)setTestHost11d:(id)a3;
- (void)setTestMcc:(int)a3;
- (void)setTestModeEnabled:(unsigned __int8)a3;
- (void)setTestPeer:(id)a3;
- (void)setTestTimeZoneCC:(id)a3;
- (void)setTestUserDefaults:(id)a3;
@end

@implementation WiFiLocaleManager

uint64_t __25__WiFiLocaleManager_init__block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Locale timer fired", v3, 2u);
  }
  return [*(id *)(a1 + 32) determineLocale:0];
}

- (void)determineLocale:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v6 = v5;
  v7 = [(WiFiLocaleManager *)self delegate];
  if ([v7 suspendLocaleCheck] == 1)
  {

LABEL_4:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[WiFiLocaleManager determineLocale:](v3, self);
    }
    v9 = 0;
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  BOOL v8 = [(WiFiLocaleManager *)self localeCheckSuspended];

  if (v8) {
    goto LABEL_4;
  }
  v11 = [(WiFiLocaleManager *)self delegate];
  v9 = [v11 getDeviceCountryCode];

  if ([(WiFiLocaleManager *)self isDefaultCountryCode:v9])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v37) = 0;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Default locale in use, determine fresh locale", (uint8_t *)&v37, 2u);
    }
    [(WiFiLocaleManager *)self setLocaleCountryCode:0];
    [(WiFiLocaleManager *)self setLocaleSource:0];
  }
  if (!v3 && ![(WiFiLocaleManager *)self shouldDetermineNewLocale])
  {
    [(WiFiLocaleManager *)self localeLastUpdatedTime];
    double v13 = v6 - v12;
    [(WiFiLocaleManager *)self localeTimeout];
    if (v13 < v14)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        v15 = [(WiFiLocaleManager *)self localeCountryCode];
        v16 = [(WiFiLocaleManager *)self dateFormatter];
        v17 = (void *)MEMORY[0x1E4F1C9C8];
        [(WiFiLocaleManager *)self localeLastUpdatedTime];
        v18 = objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:");
        v19 = [v16 stringFromDate:v18];
        [(WiFiLocaleManager *)self localeLastUpdatedTime];
        double v21 = (v6 - v20) / 60.0;
        [(WiFiLocaleManager *)self localeTimeout];
        int v37 = 138413058;
        v38 = v15;
        __int16 v39 = 2112;
        v40 = v19;
        __int16 v41 = 2048;
        double v42 = v21;
        __int16 v43 = 2048;
        double v44 = v22 / 60.0;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Locale <%@> was determined at %@, has been valid for %.2f mins [cache timeout %.2f mins]", (uint8_t *)&v37, 0x2Au);
      }
      goto LABEL_7;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v37 = 67109120;
    LODWORD(v38) = v3;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Trying to determine locale (forceCheck %d)...", (uint8_t *)&v37, 8u);
  }
  v10 = [(WiFiLocaleManager *)self getLocaleFromCompanion];
  if (![(WiFiLocaleManager *)self isDefaultCountryCode:v10])
  {
    uint64_t v26 = 1;
    goto LABEL_46;
  }
  v23 = [(WiFiLocaleManager *)self locationManager];
  int v24 = [v23 isAuthorized];

  if (v24)
  {
    v25 = [(WiFiLocaleManager *)self getLocaleFromMcc];

    if (![(WiFiLocaleManager *)self isDefaultCountryCode:v25])
    {
      uint64_t v26 = 2;
LABEL_45:
      v10 = v25;
      goto LABEL_46;
    }
  }
  else
  {
    v25 = v10;
  }
  v27 = [(WiFiLocaleManager *)self locationManager];
  int v28 = [v27 isAuthorized];

  if (v28)
  {
    v29 = [(WiFiLocaleManager *)self locationManager];
    v30 = [v29 latestLocation];

    [(WiFiLocaleManager *)self localeTimeout];
    int v31 = +[WiFiLocationManager isLocationValid:uptoSeconds:isHighAccuracy:](WiFiLocationManager, "isLocationValid:uptoSeconds:isHighAccuracy:", v30, 0);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v37 = 67109120;
      LODWORD(v38) = v31;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Trying to get cached/leeched location (isValid %d)", (uint8_t *)&v37, 8u);
    }
    if (v31)
    {
      v10 = [(WiFiLocaleManager *)self getLocaleFromLocation:v30];

      if (![(WiFiLocaleManager *)self isDefaultCountryCode:v10])
      {

        uint64_t v26 = 3;
        goto LABEL_46;
      }
    }
    else
    {
      v10 = v25;
    }
  }
  else
  {
    v10 = v25;
  }
  v32 = [(WiFiLocaleManager *)self locationManager];
  int v33 = [v32 isAuthorized];

  if (v33)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v37) = 0;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Trying to get low accuracy location", (uint8_t *)&v37, 2u);
    }
    v34 = [(WiFiLocaleManager *)self locationManager];
    [v34 requestLowAccuracyLocationUpdate];

    [(WiFiLocaleManager *)self setIsWaitingForLocationUpdate:1];
    uint64_t v26 = 0;
LABEL_46:
    if (!v10) {
      goto LABEL_8;
    }
    goto LABEL_47;
  }
  v25 = [(WiFiLocaleManager *)self getLocaleFromMultiple80211d];

  if (![(WiFiLocaleManager *)self isDefaultCountryCode:v25])
  {
    uint64_t v26 = 4;
    goto LABEL_45;
  }
  v10 = [(WiFiLocaleManager *)self getLocaleFromPeer];

  if (![(WiFiLocaleManager *)self isDefaultCountryCode:v10])
  {
    uint64_t v26 = 5;
    goto LABEL_46;
  }
  v25 = [(WiFiLocaleManager *)self getLocaleFromTimezone];

  if (![(WiFiLocaleManager *)self isDefaultCountryCode:v25])
  {
    uint64_t v26 = 6;
    goto LABEL_45;
  }
  v10 = [(WiFiLocaleManager *)self getLocaleFromUserDefaults];

  if (![(WiFiLocaleManager *)self isDefaultCountryCode:v10])
  {
    uint64_t v26 = 7;
    goto LABEL_46;
  }

  uint64_t v26 = 0;
  v10 = &stru_1F2B5AC50;
LABEL_47:
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  -[WiFiLocaleManager setLocaleLastUpdatedTime:](self, "setLocaleLastUpdatedTime:");
  [(WiFiLocaleManager *)self setAggressiveRetryAttemptsRemaining:5];
  v35 = [(WiFiLocaleManager *)self retryTimer];

  if (v35)
  {
    v36 = [(WiFiLocaleManager *)self retryTimer];
    dispatch_source_cancel(v36);

    [(WiFiLocaleManager *)self setRetryTimer:0];
  }
  [(WiFiLocaleManager *)self setCountryCode:v10 source:v26];
LABEL_8:
}

- (double)localeLastUpdatedTime
{
  return self->_localeLastUpdatedTime;
}

- (double)localeTimeout
{
  return self->_localeTimeout;
}

- (WiFiLocaleManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WiFiLocaleManagerDelegate *)WeakRetained;
}

- (NSString)localeCountryCode
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isDefaultCountryCode:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3 == 0;
  if (![v3 caseInsensitiveCompare:&stru_1F2B5AC50]
    || ![v3 caseInsensitiveCompare:@"X0"]
    || ![v3 caseInsensitiveCompare:@"X2"]
    || ![v3 caseInsensitiveCompare:@"X3"]
    || ![v3 caseInsensitiveCompare:@"XZ"])
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)shouldDetermineNewLocale
{
  v2 = self;
  id v3 = [(WiFiLocaleManager *)self localeCountryCode];
  LOBYTE(v2) = [(WiFiLocaleManager *)v2 isDefaultCountryCode:v3];

  return (char)v2;
}

- (BOOL)localeCheckSuspended
{
  return self->_localeCheckSuspended;
}

- (NSDateFormatter)dateFormatter
{
  return (NSDateFormatter *)objc_getProperty(self, a2, 88, 1);
}

- (WiFiLocaleManager)init
{
  v19.receiver = self;
  v19.super_class = (Class)WiFiLocaleManager;
  v2 = [(WiFiLocaleManager *)&v19 init];
  id v3 = v2;
  if (v2)
  {
    [(WiFiLocaleManager *)v2 setLocaleCheckSuspended:0];
    [(WiFiLocaleManager *)v3 setLocaleCountryCode:0];
    [(WiFiLocaleManager *)v3 setLocaleSource:0];
    [(WiFiLocaleManager *)v3 setLocaleLastUpdatedTime:0.0];
    [(WiFiLocaleManager *)v3 setLocaleTimeout:3600.0];
    [(WiFiLocaleManager *)v3 setAggressiveRetryAttemptsRemaining:5];
    [(WiFiLocaleManager *)v3 setTestMcc:0];
    [(WiFiLocaleManager *)v3 setTestHost11d:0];
    [(WiFiLocaleManager *)v3 setTestPeer:0];
    id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [(WiFiLocaleManager *)v3 setDateFormatter:v4];

    double v5 = [(WiFiLocaleManager *)v3 dateFormatter];
    [v5 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];

    dispatch_queue_t v6 = dispatch_queue_create("WiFiLocaleManager", 0);
    [(WiFiLocaleManager *)v3 setQueue:v6];

    v7 = [(WiFiLocaleManager *)v3 queue];
    dispatch_source_t v8 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v7);
    [(WiFiLocaleManager *)v3 setLocaleTimer:v8];

    v9 = [(WiFiLocaleManager *)v3 localeTimer];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __25__WiFiLocaleManager_init__block_invoke;
    handler[3] = &unk_1E69BC8D8;
    v10 = v3;
    v18 = v10;
    dispatch_source_set_event_handler(v9, handler);

    v11 = [(WiFiLocaleManager *)v10 localeTimer];
    dispatch_time_t v12 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v11, v12, 0x1BF08EB000uLL, 0);

    double v13 = [(WiFiLocaleManager *)v10 localeTimer];
    dispatch_activate(v13);

    double v14 = +[WiFiLocationManager sharedWiFiLocationManager];
    [(WiFiLocaleManager *)v10 setLocationManager:v14];

    v15 = [(WiFiLocaleManager *)v10 locationManager];
    [v15 setDelegate:v10];

    [(WiFiLocaleManager *)v10 setIsWaitingForLocationUpdate:0];
  }
  return v3;
}

- (void)dealloc
{
  [(WiFiLocaleManager *)self setTestHost11d:0];
  [(WiFiLocaleManager *)self setTestPeer:0];
  [(WiFiLocaleManager *)self setLocationManager:0];
  id v3 = [(WiFiLocaleManager *)self localeTimer];

  if (v3)
  {
    id v4 = [(WiFiLocaleManager *)self localeTimer];
    dispatch_source_cancel(v4);

    [(WiFiLocaleManager *)self setLocaleTimer:0];
  }
  double v5 = [(WiFiLocaleManager *)self queue];

  if (v5) {
    [(WiFiLocaleManager *)self setQueue:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)WiFiLocaleManager;
  [(WiFiLocaleManager *)&v6 dealloc];
}

- (void)determineAndSetLocale:(unsigned __int8)a3
{
  double v5 = [(WiFiLocaleManager *)self queue];

  if (v5)
  {
    objc_super v6 = [(WiFiLocaleManager *)self queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__WiFiLocaleManager_determineAndSetLocale___block_invoke;
    v7[3] = &unk_1E69BC930;
    v7[4] = self;
    unsigned __int8 v8 = a3;
    dispatch_async(v6, v7);
  }
}

uint64_t __43__WiFiLocaleManager_determineAndSetLocale___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) determineLocale:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setLocaleTestParams:(id)a3
{
  id v4 = a3;
  double v5 = [(WiFiLocaleManager *)self queue];

  if (v5)
  {
    objc_super v6 = [(WiFiLocaleManager *)self queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__WiFiLocaleManager_setLocaleTestParams___block_invoke;
    v7[3] = &unk_1E69BC8B0;
    id v8 = v4;
    v9 = self;
    dispatch_async(v6, v7);
  }
}

void __41__WiFiLocaleManager_setLocaleTestParams___block_invoke(uint64_t a1)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"enableTestMode"];
  int v3 = [v2 BOOLValue];

  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"localeCheckSuspended"];
  uint64_t v5 = [v4 BOOLValue];

  objc_super v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"mcc"];
  unsigned int v7 = [v6 intValue];

  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"cachedLocaleTimeout"];
  [v8 doubleValue];
  double v10 = v9;

  v11 = [*(id *)(a1 + 32) objectForKey:@"host11d"];
  dispatch_time_t v12 = [*(id *)(a1 + 32) objectForKey:@"peer"];
  double v13 = [*(id *)(a1 + 32) objectForKey:@"timeZoneCC"];
  double v14 = [*(id *)(a1 + 32) objectForKey:@"userDefaults"];
  v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"forceCheck"];
  int v59 = [v15 BOOLValue];

  v16 = *(void **)(a1 + 40);
  if (!v3)
  {
    if ([v16 testModeEnabled])
    {
      [*(id *)(a1 + 40) setTestModeEnabled:0];
      [*(id *)(a1 + 40) setLocaleCheckSuspended:0];
      [*(id *)(a1 + 40) setTestMcc:0];
      [*(id *)(a1 + 40) setLocaleTimeout:3600.0];
      [*(id *)(a1 + 40) setTestHost11d:0];
      [*(id *)(a1 + 40) setTestPeer:0];
      [*(id *)(a1 + 40) setLocaleCountryCode:0];
      [*(id *)(a1 + 40) setLocaleSource:0];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v27 = [*(id *)(a1 + 40) localeCheckSuspended];
        int v28 = [*(id *)(a1 + 40) testMcc];
        v29 = [*(id *)(a1 + 40) testHost11d];
        [*(id *)(a1 + 40) testPeer];
        int v31 = v30 = v13;
        [*(id *)(a1 + 40) localeTimeout];
        *(_DWORD *)buf = 136316674;
        v61 = "-[WiFiLocaleManager setLocaleTestParams:]_block_invoke";
        __int16 v62 = 1024;
        int v63 = v27;
        __int16 v64 = 1024;
        int v65 = v28;
        __int16 v66 = 2112;
        *(void *)v67 = v29;
        *(_WORD *)&v67[8] = 2112;
        *(void *)v68 = v31;
        *(_WORD *)&v68[8] = 2048;
        *(void *)v69 = v32;
        *(_WORD *)&v69[8] = 1024;
        *(_DWORD *)v70 = v59;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: resetting test params: localeCheckSuspended %d, MCC %d, host11d %@, peer %@, timeout %.2f seconds, forceCheck %d", buf, 0x3Cu);

        double v13 = v30;
      }
      int v33 = [*(id *)(a1 + 40) retryTimer];

      if (v33)
      {
        v34 = [*(id *)(a1 + 40) retryTimer];
        dispatch_source_set_timer(v34, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      }
      v35 = [*(id *)(a1 + 40) localeTimer];
      [*(id *)(a1 + 40) localeTimeout];
      dispatch_time_t v37 = dispatch_time(0, (uint64_t)(v36 * 1000000000.0));
      [*(id *)(a1 + 40) localeTimeout];
      dispatch_source_set_timer(v35, v37, (unint64_t)(v38 * 1000000000.0), 0);

      if (v59) {
        goto LABEL_27;
      }
    }
    goto LABEL_28;
  }
  [v16 setTestModeEnabled:1];
  [*(id *)(a1 + 40) setLocaleCheckSuspended:v5];
  if (HIWORD(v7)) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = v7;
  }
  [*(id *)(a1 + 40) setTestMcc:v17];
  objc_msgSend(*(id *)(a1 + 40), "setLocaleTimeout:", fmax(v10, 120.0));
  if (v11)
  {
    id v18 = [NSString alloc];
    objc_super v19 = [v11 uppercaseString];
    double v20 = (void *)[v18 initWithString:v19];
    [*(id *)(a1 + 40) setTestHost11d:v20];

    if (v12) {
      goto LABEL_7;
    }
LABEL_17:
    [*(id *)(a1 + 40) setTestPeer:0];
    if (v13) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
  [*(id *)(a1 + 40) setTestHost11d:0];
  if (!v12) {
    goto LABEL_17;
  }
LABEL_7:
  id v21 = [NSString alloc];
  double v22 = [v12 uppercaseString];
  v23 = (void *)[v21 initWithString:v22];
  [*(id *)(a1 + 40) setTestPeer:v23];

  if (v13)
  {
LABEL_8:
    id v24 = [NSString alloc];
    v25 = [v13 uppercaseString];
    uint64_t v26 = (void *)[v24 initWithString:v25];
    [*(id *)(a1 + 40) setTestTimeZoneCC:v26];

    goto LABEL_19;
  }
LABEL_18:
  [*(id *)(a1 + 40) setTestTimeZoneCC:0];
LABEL_19:
  v57 = v13;
  v58 = v12;
  if (v14)
  {
    id v39 = [NSString alloc];
    v40 = [v14 uppercaseString];
    __int16 v41 = (void *)[v39 initWithString:v40];
    [*(id *)(a1 + 40) setTestUserDefaults:v41];
  }
  else
  {
    [*(id *)(a1 + 40) setTestUserDefaults:0];
  }
  double v42 = v11;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v43 = v14;
    int v44 = v5;
    int v45 = [*(id *)(a1 + 40) localeCheckSuspended];
    int v46 = [*(id *)(a1 + 40) testMcc];
    v47 = [*(id *)(a1 + 40) testHost11d];
    v48 = [*(id *)(a1 + 40) testPeer];
    v49 = [*(id *)(a1 + 40) testUserDefaults];
    [*(id *)(a1 + 40) localeTimeout];
    *(_DWORD *)buf = 136318466;
    v61 = "-[WiFiLocaleManager setLocaleTestParams:]_block_invoke";
    __int16 v62 = 1024;
    int v63 = v45;
    __int16 v64 = 1024;
    int v65 = v44;
    double v14 = v43;
    __int16 v66 = 1024;
    *(_DWORD *)v67 = v46;
    *(_WORD *)&v67[4] = 1024;
    *(_DWORD *)&v67[6] = v7;
    *(_WORD *)v68 = 2112;
    *(void *)&v68[2] = v47;
    *(_WORD *)v69 = 2112;
    *(void *)&v69[2] = v42;
    *(_WORD *)v70 = 2112;
    *(void *)&v70[2] = v48;
    __int16 v71 = 2112;
    v72 = v58;
    __int16 v73 = 2112;
    v74 = v49;
    __int16 v75 = 2112;
    v76 = v43;
    __int16 v77 = 2048;
    uint64_t v78 = v50;
    __int16 v79 = 2048;
    double v80 = v10;
    __int16 v81 = 1024;
    int v82 = v59;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: setting test params: localeCheckSuspended %d (requested %d), MCC %d (requested %d), host11d %@ (requested %@), peer %@ (requested %@), userDefaults %@ (requested %@), timeout %.2f seconds (requested %.2f seconds), forceCheck %d", buf, 0x7Au);
  }
  v51 = [*(id *)(a1 + 40) retryTimer];

  if (v51)
  {
    v52 = [*(id *)(a1 + 40) retryTimer];
    dispatch_source_set_timer(v52, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  v53 = [*(id *)(a1 + 40) localeTimer];
  [*(id *)(a1 + 40) localeTimeout];
  dispatch_time_t v55 = dispatch_time(0, (uint64_t)(v54 * 1000000000.0));
  [*(id *)(a1 + 40) localeTimeout];
  dispatch_source_set_timer(v53, v55, (unint64_t)(v56 * 1000000000.0), 0);

  v11 = v42;
  double v13 = v57;
  dispatch_time_t v12 = v58;
  if (v59) {
LABEL_27:
  }
    [*(id *)(a1 + 40) determineLocale:1];
LABEL_28:
}

- (id)getLocaleFromCompanion
{
  return 0;
}

- (id)getLocaleFromMcc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  CFStringRef cf = 0;
  if ([(WiFiLocaleManager *)self testMcc] == 0xFFFF)
  {
    CFStringRef cf = 0;
    int v3 = 0;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Locale from MCC is disabled", buf, 2u);
  }
  else if ([(WiFiLocaleManager *)self testMcc])
  {
    CFStringRef v4 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%d", [(WiFiLocaleManager *)self testMcc]);
    CFStringRef cf = v4;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v4;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Using testMcc [%@]", buf, 0xCu);
    }
    if (v4)
    {
      if (!MEMORY[0x1E4F23A88] || !_CTServerConnectionCopyISOForMCC())
      {
        int v3 = [0 uppercaseString];
        goto LABEL_23;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[WiFiLocaleManager getLocaleFromMcc]();
      }
    }
  }
  else if (MEMORY[0x1E4F23A90])
  {
    if (self->_ctServerConnectionRef
      || (uint64_t v9 = 0,
          memset(buf, 0, sizeof(buf)),
          uint64_t v5 = (__CTServerConnection *)_CTServerConnectionCreateWithIdentifier(),
          (self->_ctServerConnectionRef = v5) != 0))
    {
      if (_CTServerConnectionCopyMobileCountryCode()
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        -[WiFiLocaleManager getLocaleFromMcc]();
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[WiFiLocaleManager getLocaleFromMcc]();
    }
  }
  int v3 = 0;
LABEL_23:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = cf;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v3;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Locale from MCC [%@]: <%@>", buf, 0x16u);
  }
  if (cf) {
    CFRelease(cf);
  }

  return v3;
}

- (id)getLocaleFromLocation:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = getenv("__OSINSTALL_ENVIRONMENT");
  if (v4)
  {
    objc_super v6 = v5;
    if (v5) {
      goto LABEL_3;
    }
    uint64_t v7 = [(WiFiLocaleManager *)self getLocaleUsingGeoLocationCache:v4];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Locale from location services using geolocation cache: <%@>", (uint8_t *)&v9, 0xCu);
    }
    if (!v7)
    {
LABEL_3:
      uint64_t v7 = [(WiFiLocaleManager *)self getLocaleUsingBoundingBoxes:v4];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        uint64_t v10 = v7;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Locale from location services using bounding boxes: <%@>", (uint8_t *)&v9, 0xCu);
      }
      if (!((unint64_t)v6 | v7))
      {
        uint64_t v7 = [(WiFiLocaleManager *)self getLocaleUsingReverseGeocoder:v4];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 138412290;
          uint64_t v10 = v7;
          _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Locale from location services using reverse geocoder: <%@>", (uint8_t *)&v9, 0xCu);
        }
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return (id)v7;
}

- (id)getLocaleFromMultiple80211d
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  unint64_t v28 = 0;
  int v3 = [(WiFiLocaleManager *)self testHost11d];

  if (!v3)
  {
    int v9 = [(WiFiLocaleManager *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = [(WiFiLocaleManager *)self testUserDefaults];
      if (!v10)
      {

        goto LABEL_23;
      }
      uint64_t v11 = (void *)v10;
      dispatch_time_t v12 = [(WiFiLocaleManager *)self testUserDefaults];
      uint64_t v13 = [v12 caseInsensitiveCompare:@"OFF"];

      if (!v13)
      {
LABEL_23:
        v16 = [(WiFiLocaleManager *)self delegate];
        id v8 = [v16 get80211dCountryCodes:&v28];

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = [v8 count];
          *(_DWORD *)buf = 134218240;
          uint64_t v30 = v17;
          __int16 v31 = 2048;
          unint64_t v32 = v28;
          _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%lu country code(s) currently advertised by %lu networks", buf, 0x16u);
        }
        if (v28 >= 3)
        {
          id v18 = [v8 objectEnumerator];
          uint64_t v7 = [v18 nextObject];
          double v20 = 0;
          if (v7)
          {
            unint64_t v21 = 0;
            unint64_t v22 = 0;
            v23 = MEMORY[0x1E4F14500];
            *(void *)&long long v19 = 138412290;
            long long v27 = v19;
            do
            {
              unint64_t v24 = v22;
              unint64_t v22 = objc_msgSend(v8, "countForObject:", v7, v27);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v30 = (uint64_t)v7;
                __int16 v31 = 2048;
                unint64_t v32 = v22;
                _os_log_impl(&dword_1D3CCD000, v23, OS_LOG_TYPE_DEFAULT, "Country <%@> IE count %lu", buf, 0x16u);
              }
              if (v22 < 2 || v22 < v24)
              {
                unint64_t v22 = v24;
              }
              else
              {
                id v25 = v7;

                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v27;
                  uint64_t v30 = (uint64_t)v25;
                  _os_log_impl(&dword_1D3CCD000, v23, OS_LOG_TYPE_DEFAULT, "Currently highest country <%@>", buf, 0xCu);
                }
                unint64_t v21 = v24;
                double v20 = v25;
              }
              uint64_t v26 = [v18 nextObject];

              uint64_t v7 = (void *)v26;
            }
            while (v26);
            if (v22 == v21) {
              uint64_t v7 = 0;
            }
            else {
              uint64_t v7 = (void *)[v20 copy];
            }
          }

          goto LABEL_14;
        }
        goto LABEL_13;
      }
    }
    else
    {
    }
    id v14 = 0;
    goto LABEL_19;
  }
  id v4 = [(WiFiLocaleManager *)self testHost11d];
  uint64_t v5 = [v4 caseInsensitiveCompare:@"OFF"];

  if (v5)
  {
    objc_super v6 = [(WiFiLocaleManager *)self testHost11d];
    uint64_t v7 = (void *)[v6 copy];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = (uint64_t)v7;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Using testHost11d [%@]", buf, 0xCu);
    }
    id v8 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Locale from 80211d info is disabled", buf, 2u);
  }
  id v8 = 0;
LABEL_13:
  uint64_t v7 = 0;
LABEL_14:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v30 = (uint64_t)v7;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Locale from multiple 80211d info: <%@>", buf, 0xCu);
  }
  id v14 = v7;

LABEL_19:

  return v14;
}

- (id)getLocaleFromPeer
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v3 = [(WiFiLocaleManager *)self testPeer];

  if (!v3)
  {
    id v8 = [(WiFiLocaleManager *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      uint64_t v10 = [(WiFiLocaleManager *)self delegate];
      uint64_t v7 = [v10 getPeerCountryCode];

      goto LABEL_10;
    }
    goto LABEL_9;
  }
  id v4 = [(WiFiLocaleManager *)self testPeer];
  uint64_t v5 = [v4 caseInsensitiveCompare:@"OFF"];

  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Locale from peer is disabled", (uint8_t *)&v12, 2u);
    }
LABEL_9:
    uint64_t v7 = 0;
    goto LABEL_10;
  }
  objc_super v6 = [(WiFiLocaleManager *)self testPeer];
  uint64_t v7 = (void *)[v6 copy];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    uint64_t v13 = v7;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Using testPeer [%@]", (uint8_t *)&v12, 0xCu);
  }
LABEL_10:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    uint64_t v13 = v7;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Locale from peer: <%@>", (uint8_t *)&v12, 0xCu);
  }

  return v7;
}

- (id)getLocaleFromTimezone
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v3 = [(WiFiLocaleManager *)self getRestrictedCountryCodeFromTimezone];
  id v4 = [(WiFiLocaleManager *)self getRestrictedCountryCodeFromRegionInfo];
  testTimeZoneCC = self->_testTimeZoneCC;
  if (testTimeZoneCC)
  {
    objc_super v6 = testTimeZoneCC;

    uint64_t v7 = self->_testTimeZoneCC;
    int v3 = v6;
    id v4 = v7;
  }
  id v8 = 0;
  if (v3 && v4)
  {
    if ([v3 compare:v4 options:1]) {
      id v8 = @"XZ";
    }
    else {
      id v8 = v3;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    int v12 = v8;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Locale from timezone: <%@>", (uint8_t *)&v11, 0xCu);
  }
  char v9 = v8;

  return v9;
}

- (id)getLocaleFromUserDefaults
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v3 = [(WiFiLocaleManager *)self testUserDefaults];

  if (!v3)
  {
    id v8 = [(WiFiLocaleManager *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = [(WiFiLocaleManager *)self testHost11d];
      if (!v9)
      {

LABEL_19:
        uint64_t v14 = [(WiFiLocaleManager *)self delegate];
        uint64_t v7 = [v14 getCountryCodeFromUserDefaults];

        goto LABEL_13;
      }
      uint64_t v10 = (void *)v9;
      int v11 = [(WiFiLocaleManager *)self testHost11d];
      uint64_t v12 = [v11 caseInsensitiveCompare:@"OFF"];

      if (!v12) {
        goto LABEL_19;
      }
    }
    else
    {
    }
LABEL_12:
    uint64_t v7 = 0;
    goto LABEL_13;
  }
  id v4 = [(WiFiLocaleManager *)self testUserDefaults];
  uint64_t v5 = [v4 caseInsensitiveCompare:@"OFF"];

  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Locale from user defaults is disabled", (uint8_t *)&v15, 2u);
    }
    goto LABEL_12;
  }
  objc_super v6 = [(WiFiLocaleManager *)self testUserDefaults];
  uint64_t v7 = (void *)[v6 copy];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    v16 = v7;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Using user defaults [%@]", (uint8_t *)&v15, 0xCu);
  }
LABEL_13:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    v16 = v7;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Locale from user defaults <%@>", (uint8_t *)&v15, 0xCu);
  }

  return v7;
}

- (id)applySetCountryCodeExceptions:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v3 = (__CFString *)a3;
  id v4 = v3;
  if (![(__CFString *)v3 caseInsensitiveCompare:@"EU"])
  {

    id v4 = @"DE";
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      uint64_t v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = @"DE";
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Switching locale %@ => %@", (uint8_t *)&v6, 0x16u);
    }
  }
  if (![(__CFString *)v3 caseInsensitiveCompare:@"IR"]
    || ![(__CFString *)v3 caseInsensitiveCompare:@"KP"])
  {

    id v4 = &stru_1F2B5AC50;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      uint64_t v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = &stru_1F2B5AC50;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Switching locale %@ => %@", (uint8_t *)&v6, 0x16u);
    }
  }

  return v4;
}

- (void)setCountryCode:(id)a3 source:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [(WiFiLocaleManager *)self aggressiveRetryAttemptsRemaining];
  if (!v6)
  {
    int v11 = 0;
    goto LABEL_46;
  }
  int v8 = v7;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(WiFiLocaleManager *)self localeCountryCode];
    uint64_t v10 = +[WiFiLocaleManager getStringOfLocaleSource:v4];
    *(_DWORD *)buf = 138412802;
    id v49 = v9;
    __int16 v50 = 2112;
    id v51 = v6;
    __int16 v52 = 2112;
    v53 = v10;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Current locale: <%@>, determined new locale: <%@> using locale source: <%@>", buf, 0x20u);
  }
  int v11 = [(WiFiLocaleManager *)self applySetCountryCodeExceptions:v6];
  uint64_t v12 = [(WiFiLocaleManager *)self delegate];
  uint64_t v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    uint64_t v14 = [(WiFiLocaleManager *)self delegate];
    uint64_t v13 = [v11 uppercaseString];
    [v14 setUserDefaultCountryCode:v13];
  }
  int v15 = [(WiFiLocaleManager *)self localeCountryCode];
  if (v15)
  {
    uint64_t v13 = [(WiFiLocaleManager *)self localeCountryCode];
    if (![v11 caseInsensitiveCompare:v13])
    {

      goto LABEL_31;
    }
  }
  v16 = [(WiFiLocaleManager *)self localeCountryCode];
  if (v16)
  {

    if (v15)
    {
    }
  }
  else
  {
    uint64_t v17 = [v11 caseInsensitiveCompare:&stru_1F2B5AC50];

    if (v15)
    {
    }
    if (!v17)
    {
LABEL_31:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        double v20 = MEMORY[0x1E4F14500];
        unint64_t v21 = "Locale has not changed, no need to set country code";
        goto LABEL_33;
      }
      goto LABEL_46;
    }
  }
  id v18 = [(WiFiLocaleManager *)self localeCountryCode];
  if ([(WiFiLocaleManager *)self isDefaultCountryCode:v18]
    || ![(WiFiLocaleManager *)self isDefaultCountryCode:v11])
  {

LABEL_21:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v11;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Attempting to set locale to <%@>", buf, 0xCu);
    }
    unint64_t v22 = [(WiFiLocaleManager *)self delegate];
    v23 = [v11 uppercaseString];
    int v24 = [v22 setDeviceCountryCode:v23];

    if (v24 == 1)
    {
      id v25 = [(WiFiLocaleManager *)self retryTimer];

      if (v25)
      {
        uint64_t v26 = [(WiFiLocaleManager *)self retryTimer];
        dispatch_source_cancel(v26);

        [(WiFiLocaleManager *)self setRetryTimer:0];
      }
      id v27 = [NSString alloc];
      unint64_t v28 = [v11 uppercaseString];
      v29 = (void *)[v27 initWithString:v28];
      [(WiFiLocaleManager *)self setLocaleCountryCode:v29];

      [(WiFiLocaleManager *)self setLocaleSource:v4];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = [(WiFiLocaleManager *)self localeCountryCode];
        *(_DWORD *)buf = 138412290;
        id v49 = v30;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Locale set to: <%@>", buf, 0xCu);
      }
      if ([(WiFiLocaleManager *)self testModeEnabled])
      {
        __int16 v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
        unint64_t v32 = [MEMORY[0x1E4F28EA0] notificationWithName:@"Country Code was set" object:0];
        [v31 postNotification:v32];
      }
      uint64_t v33 = self;
      uint64_t v34 = 5;
    }
    else
    {
      [(WiFiLocaleManager *)self setLocaleCountryCode:0];
      [(WiFiLocaleManager *)self setLocaleSource:0];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        if (v8 > 0) {
          int v35 = 1;
        }
        else {
          int v35 = 30;
        }
        *(_DWORD *)buf = 138412546;
        id v49 = v6;
        __int16 v50 = 1024;
        LODWORD(v51) = v35;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Error: Failed to set locale, retrying %@ every %u seconds", buf, 0x12u);
      }
      double v36 = [(WiFiLocaleManager *)self retryTimer];

      if (!v36)
      {
        dispatch_time_t v37 = [(WiFiLocaleManager *)self queue];
        dispatch_source_t v38 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v37);
        [(WiFiLocaleManager *)self setRetryTimer:v38];

        id v39 = [(WiFiLocaleManager *)self retryTimer];
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __43__WiFiLocaleManager_setCountryCode_source___block_invoke;
        handler[3] = &unk_1E69BC958;
        id v45 = v6;
        int v46 = self;
        int v47 = v4;
        dispatch_source_set_event_handler(v39, handler);

        v40 = [(WiFiLocaleManager *)self retryTimer];
        dispatch_activate(v40);
      }
      __int16 v41 = [(WiFiLocaleManager *)self retryTimer];
      if (v8 < 1)
      {
        dispatch_time_t v43 = dispatch_time(0, 30000000000);
        dispatch_source_set_timer(v41, v43, 0xFFFFFFFFFFFFFFFFLL, 0);

        goto LABEL_46;
      }
      dispatch_time_t v42 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v41, v42, 0xFFFFFFFFFFFFFFFFLL, 0);

      if ([(WiFiLocaleManager *)self aggressiveRetryAttemptsRemaining] < 1) {
        goto LABEL_46;
      }
      uint64_t v34 = [(WiFiLocaleManager *)self aggressiveRetryAttemptsRemaining]- 1;
      uint64_t v33 = self;
    }
    [(WiFiLocaleManager *)v33 setAggressiveRetryAttemptsRemaining:v34];
    goto LABEL_46;
  }
  int v19 = [(WiFiLocaleManager *)self testModeEnabled];

  if (v19) {
    goto LABEL_21;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    double v20 = MEMORY[0x1E4F14500];
    unint64_t v21 = "New locale could not be determined, continue using previously determined locale";
LABEL_33:
    _os_log_impl(&dword_1D3CCD000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
  }
LABEL_46:
}

uint64_t __43__WiFiLocaleManager_setCountryCode_source___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v2;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Set locale retry timer fired. Retrying for country code : %@", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 40) retrySetCountryCode:*(void *)(a1 + 32) source:*(unsigned int *)(a1 + 48)];
}

- (void)didChangeAuthorizationStatus
{
  int v3 = [(WiFiLocaleManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__WiFiLocaleManager_didChangeAuthorizationStatus__block_invoke;
  block[3] = &unk_1E69BC8D8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __49__WiFiLocaleManager_didChangeAuthorizationStatus__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) determineLocale:1];
}

- (void)didUpdateLocations:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WiFiLocaleManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__WiFiLocaleManager_didUpdateLocations___block_invoke;
  v7[3] = &unk_1E69BC8B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __40__WiFiLocaleManager_didUpdateLocations___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isWaitingForLocationUpdate])
  {
    [*(id *)(a1 + 32) setIsWaitingForLocationUpdate:0];
    uint64_t v2 = *(void *)(a1 + 40);
    [*(id *)(a1 + 32) localeTimeout];
    int v3 = +[WiFiLocationManager isLocationValid:uptoSeconds:isHighAccuracy:](WiFiLocationManager, "isLocationValid:uptoSeconds:isHighAccuracy:", v2, 0);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v17[0] = 67109120;
      v17[1] = v3;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Trying to get locale from updated location (isValid %d)", (uint8_t *)v17, 8u);
    }
    if (v3)
    {
      id v4 = [*(id *)(a1 + 32) getLocaleFromLocation:*(void *)(a1 + 40)];
      if (![*(id *)(a1 + 32) isDefaultCountryCode:v4])
      {
        uint64_t v5 = 3;
        if (!v4) {
          return;
        }
        goto LABEL_24;
      }
    }
    else
    {
      id v4 = 0;
    }
    if ([*(id *)(a1 + 32) shouldDetermineNewLocale])
    {
      id v6 = [*(id *)(a1 + 32) getLocaleFromMultiple80211d];

      if ([*(id *)(a1 + 32) isDefaultCountryCode:v6])
      {
        id v4 = [*(id *)(a1 + 32) getLocaleFromPeer];

        if (![*(id *)(a1 + 32) isDefaultCountryCode:v4])
        {
          uint64_t v5 = 5;
          if (!v4) {
            return;
          }
          goto LABEL_24;
        }
        id v6 = [*(id *)(a1 + 32) getLocaleFromTimezone];

        if ([*(id *)(a1 + 32) isDefaultCountryCode:v6])
        {
          id v4 = [*(id *)(a1 + 32) getLocaleFromUserDefaults];

          if ([*(id *)(a1 + 32) isDefaultCountryCode:v4])
          {

            uint64_t v5 = 0;
            id v4 = &stru_1F2B5AC50;
          }
          else
          {
            uint64_t v5 = 7;
            if (!v4) {
              return;
            }
          }
          goto LABEL_24;
        }
        uint64_t v5 = 6;
      }
      else
      {
        uint64_t v5 = 4;
      }
      id v4 = v6;
      if (!v6) {
        return;
      }
    }
    else
    {
      uint64_t v5 = 0;
      if (!v4) {
        return;
      }
    }
LABEL_24:
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    objc_msgSend(*(id *)(a1 + 32), "setLocaleLastUpdatedTime:");
    [*(id *)(a1 + 32) setAggressiveRetryAttemptsRemaining:5];
    int v7 = [*(id *)(a1 + 32) retryTimer];

    if (v7)
    {
      id v8 = [*(id *)(a1 + 32) retryTimer];
      dispatch_source_cancel(v8);

      [*(id *)(a1 + 32) setRetryTimer:0];
    }
    [*(id *)(a1 + 32) setCountryCode:v4 source:v5];

    return;
  }
  BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v9) {
    __40__WiFiLocaleManager_didUpdateLocations___block_invoke_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
  }
}

- (void)didFailWithError:(id)a3
{
  id v4 = [(WiFiLocaleManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__WiFiLocaleManager_didFailWithError___block_invoke;
  block[3] = &unk_1E69BC8D8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __38__WiFiLocaleManager_didFailWithError___block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) shouldDetermineNewLocale]) {
    return;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Trying to determine locale when location services failed", v7, 2u);
  }
  uint64_t v2 = [*(id *)(a1 + 32) getLocaleFromMultiple80211d];
  if (![*(id *)(a1 + 32) isDefaultCountryCode:v2])
  {
    uint64_t v4 = 4;
    goto LABEL_14;
  }
  int v3 = [*(id *)(a1 + 32) getLocaleFromPeer];

  if (![*(id *)(a1 + 32) isDefaultCountryCode:v3])
  {
    uint64_t v4 = 5;
LABEL_13:
    uint64_t v2 = v3;
LABEL_14:
    if (!v2) {
      return;
    }
    goto LABEL_15;
  }
  uint64_t v2 = [*(id *)(a1 + 32) getLocaleFromTimezone];

  if (![*(id *)(a1 + 32) isDefaultCountryCode:v2])
  {
    uint64_t v4 = 6;
    goto LABEL_14;
  }
  int v3 = [*(id *)(a1 + 32) getLocaleFromUserDefaults];

  if (![*(id *)(a1 + 32) isDefaultCountryCode:v3])
  {
    uint64_t v4 = 7;
    goto LABEL_13;
  }

  uint64_t v4 = 0;
  uint64_t v2 = &stru_1F2B5AC50;
LABEL_15:
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  objc_msgSend(*(id *)(a1 + 32), "setLocaleLastUpdatedTime:");
  [*(id *)(a1 + 32) setAggressiveRetryAttemptsRemaining:5];
  uint64_t v5 = [*(id *)(a1 + 32) retryTimer];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) retryTimer];
    dispatch_source_cancel(v6);

    [*(id *)(a1 + 32) setRetryTimer:0];
  }
  [*(id *)(a1 + 32) setCountryCode:v2 source:v4];
}

- (unsigned)getNetworkReachability
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  sockaddr address = (sockaddr)xmmword_1D3D958A0;
  uint64_t v2 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &address);
  SCNetworkReachabilityFlags flags = 0;
  if (v2)
  {
    int v3 = v2;
    SCNetworkReachabilityGetFlags(v2, &flags);
    CFRelease(v3);
    LOBYTE(v2) = (flags & 0x40002) == 2;
  }
  return v2;
}

- (id)getLocaleUsingGeoLocationCache:(id)a3
{
  id v3 = a3;
  uint64_t v21 = 0;
  unint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  int v24 = __Block_byref_object_copy_;
  id v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  if (v3)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    [v3 coordinate];
    double v6 = v5;
    [v3 coordinate];
    id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64658]), "initWithGEOCoordinate:", v6, v7);
    if (v8)
    {
      [v3 altitude];
      [v8 setAltitude:(int)v9];
      [v3 horizontalAccuracy];
      objc_msgSend(v8, "setHorizontalAccuracy:");
      [v3 verticalAccuracy];
      objc_msgSend(v8, "setVerticalAccuracy:");
      int v10 = [v3 referenceFrame];
      if (v10 == 1) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = 2 * (v10 == 2);
      }
      [v8 setReferenceFrame:v11];
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F645D0];
    uint64_t v13 = MEMORY[0x1E4F14428];
    id v14 = MEMORY[0x1E4F14428];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __52__WiFiLocaleManager_getLocaleUsingGeoLocationCache___block_invoke;
    v18[3] = &unk_1E69BC980;
    double v20 = &v21;
    uint64_t v15 = v4;
    int v19 = v15;
    [v12 fetchPossibleTerritoriesForLocation:v8 responseQueue:v13 responseBlock:v18];

    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    id v16 = (id)v22[5];
  }
  else
  {
    id v16 = 0;
  }
  _Block_object_dispose(&v21, 8);

  return v16;
}

void __52__WiFiLocaleManager_getLocaleUsingGeoLocationCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __52__WiFiLocaleManager_getLocaleUsingGeoLocationCache___block_invoke_cold_4((uint64_t)v5, (uint64_t)v6);
    if (v6)
    {
LABEL_3:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __52__WiFiLocaleManager_getLocaleUsingGeoLocationCache___block_invoke_cold_3((uint64_t)v6);
      }
      goto LABEL_44;
    }
  }
  else if (v6)
  {
    goto LABEL_3;
  }
  if (v5)
  {
    id v35 = v6;
    uint64_t v36 = a1;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v37 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      int v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v41;
      uint64_t v13 = MEMORY[0x1E4F14500];
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v41 != v12) {
            objc_enumerationMutation(v7);
          }
          uint64_t v15 = *(void **)(*((void *)&v40 + 1) + 8 * v14);
          if (v15)
          {
            if ([*(id *)(*((void *)&v40 + 1) + 8 * v14) isDisputed])
            {
              if (!v10)
              {
                int v10 = [v15 disputedTerritoryName];
                if (v10)
                {
                  id v16 = [v15 disputedTerritoryName];
                  uint64_t v17 = [v16 length];

                  if (v17)
                  {
                    int v10 = [v15 disputedTerritoryName];
                    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v45 = v10;
                      _os_log_impl(&dword_1D3CCD000, v13, OS_LOG_TYPE_DEFAULT, "disputed region appointed: %@", buf, 0xCu);
                    }
                  }
                  else
                  {
                    int v10 = 0;
                  }
                }
              }
            }
            else if (!v11)
            {
              uint64_t v11 = [v15 iso3166CountryCode2];
              if (v11)
              {
                uint64_t v18 = [v15 iso3166CountryCode2];
                uint64_t v19 = [v18 length];

                if (v19)
                {
                  uint64_t v11 = [v15 iso3166CountryCode2];
                  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
                  {
                    double v20 = [v15 iso3166CountryCode2];
                    *(_DWORD *)buf = 138412290;
                    id v45 = v20;
                    _os_log_impl(&dword_1D3CCD000, v13, OS_LOG_TYPE_DEFAULT, "iso appointed: %@", buf, 0xCu);
                  }
                }
                else
                {
                  uint64_t v11 = 0;
                }
              }
            }
          }
          else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            __52__WiFiLocaleManager_getLocaleUsingGeoLocationCache___block_invoke_cold_2(&v38, v39);
          }
          ++v14;
        }
        while (v9 != v14);
        uint64_t v21 = [v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
        uint64_t v9 = v21;
      }
      while (v21);
    }
    else
    {
      int v10 = 0;
      uint64_t v11 = 0;
    }

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      if (v10) {
        uint64_t v30 = v10;
      }
      else {
        uint64_t v30 = v11;
      }
      *(_DWORD *)buf = 138412290;
      id v45 = v30;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "iso returned: %@", buf, 0xCu);
    }
    if (v10) {
      __int16 v31 = v10;
    }
    else {
      __int16 v31 = v11;
    }
    a1 = v36;
    objc_storeStrong((id *)(*(void *)(*(void *)(v36 + 40) + 8) + 40), v31);
    uint64_t v32 = [*(id *)(*(void *)(*(void *)(v36 + 40) + 8) + 40) copy];
    uint64_t v33 = *(void *)(*(void *)(v36 + 40) + 8);
    uint64_t v34 = *(void **)(v33 + 40);
    *(void *)(v33 + 40) = v32;

    id v5 = v37;
    id v6 = v35;
  }
  else
  {
    BOOL v22 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v22) {
      __52__WiFiLocaleManager_getLocaleUsingGeoLocationCache___block_invoke_cold_1(v22, v23, v24, v25, v26, v27, v28, v29);
    }
  }
LABEL_44:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)getLocaleUsingBoundingBoxes:(id)a3
{
  id v3 = a3;
  dispatch_semaphore_t v4 = v3;
  if (v3)
  {
    [v3 coordinate];
    double v6 = v5;
    [v4 coordinate];
    uint64_t v8 = 0;
    while (v7 < *(double *)&boundingBoxes[v8]
         || v7 > *(double *)&boundingBoxes[v8 + 2]
         || v6 > *(double *)&boundingBoxes[v8 + 1]
         || v6 < *(double *)&boundingBoxes[v8 + 3])
    {
      v8 += 5;
      if (v8 == 500) {
        goto LABEL_8;
      }
    }
    id v9 = (id)boundingBoxes[v8 + 4];
  }
  else
  {
LABEL_8:
    id v9 = 0;
  }

  return v9;
}

- (id)getLocaleUsingReverseGeocoder:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  BOOL v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy_;
  uint64_t v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  if (v4)
  {
    if ([(WiFiLocaleManager *)self getNetworkReachability])
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1E5D0]);
      if (v5)
      {
        dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __51__WiFiLocaleManager_getLocaleUsingReverseGeocoder___block_invoke;
        v18[3] = &unk_1E69BC9A8;
        double v20 = &v21;
        double v7 = v6;
        uint64_t v19 = v7;
        [v5 reverseGeocodeLocation:v4 completionHandler:v18];
        dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
        id v8 = (id)v22[5];

        goto LABEL_9;
      }
    }
    else
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v9) {
        -[WiFiLocaleManager getLocaleUsingReverseGeocoder:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    id v8 = (id)v22[5];
  }
  else
  {
    id v8 = 0;
  }
LABEL_9:
  _Block_object_dispose(&v21, 8);

  return v8;
}

void __51__WiFiLocaleManager_getLocaleUsingReverseGeocoder___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  if (!a3)
  {
    if ([v11 count])
    {
      id v5 = [v11 objectAtIndex:0];
      if (v5)
      {
        dispatch_semaphore_t v6 = v5;
        double v7 = [v5 ISOcountryCode];
        uint64_t v8 = [v7 copy];
        uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)getRestrictedCountryCodeFromRegionInfo
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v12 = xmmword_1E69BC9E8;
  long long v13 = *(_OWORD *)&off_1E69BC9F8;
  long long v14 = xmmword_1E69BCA08;
  long long v10 = xmmword_1E69BC9C8;
  long long v11 = *(_OWORD *)&off_1E69BC9D8;
  uint64_t v2 = (void *)MGCopyAnswer();
  id v3 = 0;
  if (v2)
  {
    id v4 = (__CFString **)&v11;
    id v5 = @"PA";
    while (objc_msgSend(v2, "compare:options:", v5, 1, v10, v11, v12, v13, v14))
    {
      dispatch_semaphore_t v6 = *v4;
      v4 += 2;
      id v5 = v6;
      if (!v6)
      {
        id v3 = 0;
        goto LABEL_7;
      }
    }
    id v3 = (void *)[(__CFString *)*(v4 - 1) copy];
  }
LABEL_7:
  id v7 = v3;

  for (uint64_t i = 72; i != -8; i -= 8)

  return v7;
}

- (id)getRestrictedCountryCodeFromTimezone
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CAF0], "defaultTimeZone", 0x1F2B5C5D0, 0x1F2B5C170, @"Asia/Jayapura", @"ID", 0x1F2B5C610, 0x1F2B5C170, @"Asia/Pontianak", @"ID", 0, 0);
  id v3 = v2;
  if (v2)
  {
    id v4 = (uint64_t *)&v12;
    while (1)
    {
      id v5 = [v3 name];
      uint64_t v6 = [v5 compare:*(v4 - 2) options:1];

      if (!v6) {
        break;
      }
      uint64_t v7 = *v4;
      v4 += 2;
      if (!v7)
      {
        uint64_t v2 = 0;
        goto LABEL_7;
      }
    }
    uint64_t v2 = (void *)[(id)*(v4 - 1) copy];
  }
LABEL_7:
  id v8 = v2;

  for (uint64_t i = 72; i != -8; i -= 8)

  return v8;
}

+ (id)getStringOfLocaleSource:(int)a3
{
  if (a3 > 7) {
    return @"unknown";
  }
  else {
    return off_1E69BCA68[a3];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)setLocaleCheckSuspended:(BOOL)a3
{
  self->_localeCheckSuspended = a3;
}

- (void)setLocaleCountryCode:(id)a3
{
}

- (int)localeSource
{
  return self->_localeSource;
}

- (void)setLocaleSource:(int)a3
{
  self->_localeSource = a3;
}

- (void)setLocaleTimeout:(double)a3
{
  self->_localeTimeout = a3;
}

- (void)setLocaleLastUpdatedTime:(double)a3
{
  self->_localeLastUpdatedTime = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)localeTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLocaleTimer:(id)a3
{
}

- (OS_dispatch_source)retryTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRetryTimer:(id)a3
{
}

- (int)aggressiveRetryAttemptsRemaining
{
  return self->_aggressiveRetryAttemptsRemaining;
}

- (void)setAggressiveRetryAttemptsRemaining:(int)a3
{
  self->_aggressiveRetryAttemptsRemaining = a3;
}

- (void)setDateFormatter:(id)a3
{
}

- (WiFiLocationManager)locationManager
{
  return (WiFiLocationManager *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLocationManager:(id)a3
{
}

- (unsigned)isWaitingForLocationUpdate
{
  return self->_isWaitingForLocationUpdate;
}

- (void)setIsWaitingForLocationUpdate:(unsigned __int8)a3
{
  self->_isWaitingForLocationUpdate = a3;
}

- (unsigned)testModeEnabled
{
  return self->_testModeEnabled;
}

- (void)setTestModeEnabled:(unsigned __int8)a3
{
  self->_testModeEnabled = a3;
}

- (int)testMcc
{
  return self->_testMcc;
}

- (void)setTestMcc:(int)a3
{
  self->_testMcc = a3;
}

- (NSString)testHost11d
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTestHost11d:(id)a3
{
}

- (NSString)testPeer
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTestPeer:(id)a3
{
}

- (NSString)testTimeZoneCC
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTestTimeZoneCC:(id)a3
{
}

- (NSString)testUserDefaults
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setTestUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testUserDefaults, 0);
  objc_storeStrong((id *)&self->_testTimeZoneCC, 0);
  objc_storeStrong((id *)&self->_testPeer, 0);
  objc_storeStrong((id *)&self->_testHost11d, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_localeTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localeCountryCode, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)determineLocale:(unsigned __int8)a1 .cold.1(unsigned __int8 a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = [a2 localeCheckSuspended];
  _os_log_error_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error: Locale check was suspended (forceCheck %d, localeCheckSuspended %d), exit", (uint8_t *)v2, 0xEu);
}

- (void)getLocaleFromMcc
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  v0[0] = 136315650;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s: Error _CTServerConnectionCopyMobileCountryCode: %d %d", (uint8_t *)v0, 0x18u);
}

void __40__WiFiLocaleManager_didUpdateLocations___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __52__WiFiLocaleManager_getLocaleUsingGeoLocationCache___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __52__WiFiLocaleManager_getLocaleUsingGeoLocationCache___block_invoke_cold_2(uint8_t *buf, unsigned char *a2)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "empty territory element!", buf, 2u);
}

void __52__WiFiLocaleManager_getLocaleUsingGeoLocationCache___block_invoke_cold_3(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "fetchPossibleTerritoriesForLocation failed: %@", (uint8_t *)&v1, 0xCu);
}

void __52__WiFiLocaleManager_getLocaleUsingGeoLocationCache___block_invoke_cold_4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "fetchPossibleTerritoriesForLocation replied: %@, error: %@", (uint8_t *)&v2, 0x16u);
}

- (void)getLocaleUsingReverseGeocoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end