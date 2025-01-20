@interface WiFiLocationManager
+ (id)getStringOfCallbackType:(int)a3;
+ (id)getStringOfState:(int)a3;
+ (id)sharedWiFiLocationManager;
+ (unsigned)isLocationValid:(id)a3 uptoSeconds:(double)a4 isHighAccuracy:(unsigned __int8)a5;
+ (unsigned)isLocationValid:(id)a3 uptoSeconds:(double)a4 requiredAccuracy:(double)a5;
+ (void)logLocation:(id)a3 addPrefixString:(id)a4;
- (CLLocation)latestLocation;
- (CLLocationManager)clLocationManager;
- (NSMutableArray)clientsDataArray;
- (NSMutableArray)visitClientsDataArray;
- (OS_dispatch_queue)queue;
- (WiFiLocationManager)init;
- (WiFiLocationManagerDelegate)delegate;
- (int)locationManagerState;
- (unsigned)isAuthorized;
- (unsigned)shouldMonitorVisits;
- (void)cancelLocationRequestTimeOut;
- (void)createCoreLocationObjects;
- (void)dealloc;
- (void)destroyCoreLocationObjects;
- (void)invokeClientsCallbackType:(int)a3 withLocation:(id)a4 withError:(id)a5;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManager:(id)a3 didVisit:(id)a4;
- (void)locationRequestDidTimeOut;
- (void)registerCallbackFunctionPtr:(void *)a3 withContext:(void *)a4;
- (void)registerVisitCallbackFunctionPtr:(void *)a3 withContext:(void *)a4;
- (void)requestHighAccuracyLocationUpdate;
- (void)requestLeechedAccuracyLocationUpdate;
- (void)requestLowAccuracyLocationUpdate;
- (void)setCLLocationUpdateParams:(id)a3;
- (void)setClLocationManager:(id)a3;
- (void)setClientsDataArray:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsAuthorized:(unsigned __int8)a3;
- (void)setLatestLocation:(id)a3;
- (void)setLocationManagerState:(int)a3;
- (void)setQueue:(id)a3;
- (void)setShouldMonitorVisits:(unsigned __int8)a3;
- (void)setVisitClientsDataArray:(id)a3;
- (void)stopQueryingLocation;
@end

@implementation WiFiLocationManager

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D9440170]();
  if (v7 && [v7 count])
  {
    v9 = [v7 lastObject];
  }
  else
  {
    v9 = 0;
  }
  if ([(WiFiLocationManager *)self locationManagerState] != 3
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v10 = "available";
    if (!v9) {
      v10 = "not available";
    }
    int v28 = 136315394;
    v29 = "-[WiFiLocationManager locationManager:didUpdateLocations:]";
    __int16 v30 = 2080;
    v31 = v10;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: updated location %s", (uint8_t *)&v28, 0x16u);
  }
  if (v9)
  {
    v11 = [v9 timestamp];
    v12 = [(WiFiLocationManager *)self latestLocation];
    v13 = [v12 timestamp];
    [v11 timeIntervalSinceDate:v13];
    double v15 = v14;

    v16 = [(WiFiLocationManager *)self latestLocation];
    [v16 horizontalAccuracy];
    double v18 = v17;
    [v9 horizontalAccuracy];
    double v20 = v19;

    if (v15 >= 30.0 || v18 - v20 > -100.0)
    {
      [(WiFiLocationManager *)self setLatestLocation:v9];
      v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v21 postNotificationName:@"com.apple.wifid.locationUpdateNotification" object:v9];

      v22 = self;
      objc_sync_enter(v22);
      if ([(WiFiLocationManager *)v22 locationManagerState] != 3)
      {
        v23 = [(WiFiLocationManager *)v22 latestLocation];
        [(WiFiLocationManager *)v22 invokeClientsCallbackType:1 withLocation:v23 withError:0];

        v24 = [(WiFiLocationManager *)v22 delegate];
        char v25 = objc_opt_respondsToSelector();

        if (v25)
        {
          v26 = [(WiFiLocationManager *)v22 delegate];
          v27 = [(WiFiLocationManager *)v22 latestLocation];
          [v26 didUpdateLocations:v27];
        }
        [(WiFiLocationManager *)v22 cancelLocationRequestTimeOut];
        [(WiFiLocationManager *)v22 requestLeechedAccuracyLocationUpdate];
      }
      objc_sync_exit(v22);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Ignoring new location, keeping existing one", (uint8_t *)&v28, 2u);
    }
  }
}

- (CLLocation)latestLocation
{
  return (CLLocation *)objc_getProperty(self, a2, 24, 1);
}

- (int)locationManagerState
{
  return self->_locationManagerState;
}

- (void)setLatestLocation:(id)a3
{
}

- (unsigned)isAuthorized
{
  return self->_isAuthorized;
}

+ (unsigned)isLocationValid:(id)a3 uptoSeconds:(double)a4 isHighAccuracy:(unsigned __int8)a5
{
  double v6 = dbl_1D3D95D40[a5 == 0];
  id v7 = a3;
  unsigned __int8 v8 = [(id)objc_opt_class() isLocationValid:v7 uptoSeconds:a4 requiredAccuracy:v6];

  return v8;
}

+ (unsigned)isLocationValid:(id)a3 uptoSeconds:(double)a4 requiredAccuracy:(double)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  unsigned __int8 v8 = (void *)MEMORY[0x1D9440170]();
  if (v7)
  {
    v9 = [v7 timestamp];
    v10 = v9;
    if (v9)
    {
      [v9 timeIntervalSinceNow];
      if (v11 > 0.0)
      {
        fprintf((FILE *)*MEMORY[0x1E4F143C8], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "(locationAge <=0)", ", "/Library/Caches/com.apple.xbs/Sources/WiFiPolicy/frameworks/Sources/WiFiLocationServices/WiFiLocationManager.m"", 657, 0);
        BOOL v35 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v35) {
          +[WiFiLocationManager isLocationValid:uptoSeconds:requiredAccuracy:](v35, v36, v37, v38, v39, v40, v41, v42);
        }
      }
      else
      {
        double v12 = -v11;
        [v7 clientLocation];
        if (v12 < a4 || (int)0.0 == -1 || v12 < 0.0)
        {
          [v7 horizontalAccuracy];
          if (v15 <= a5)
          {
            unsigned __int8 v16 = 1;
            double v17 = "YES";
            goto LABEL_17;
          }
        }
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "date", ", "/Library/Caches/com.apple.xbs/Sources/WiFiPolicy/frameworks/Sources/WiFiLocationServices/WiFiLocationManager.m"", 653, 0);
      BOOL v27 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v27) {
        +[WiFiLocationManager isLocationValid:uptoSeconds:requiredAccuracy:](v27, v28, v29, v30, v31, v32, v33, v34);
      }
    }
    unsigned __int8 v16 = 0;
    double v17 = "NO";
LABEL_17:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v44 = v17;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "isLocationValid: %s", buf, 0xCu);
    }

    goto LABEL_20;
  }
  BOOL v18 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v18) {
    +[WiFiLocationManager isLocationValid:uptoSeconds:requiredAccuracy:](v18, v19, v20, v21, v22, v23, v24, v25);
  }
  unsigned __int8 v16 = 0;
LABEL_20:

  return v16;
}

+ (id)sharedWiFiLocationManager
{
  if (sharedWiFiLocationManager_onceToken != -1) {
    dispatch_once(&sharedWiFiLocationManager_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)sharedWiFiLocationManager_sharedWiFiLocationManager;

  return v2;
}

uint64_t __48__WiFiLocationManager_sharedWiFiLocationManager__block_invoke()
{
  uint64_t result = objc_opt_class();
  if (result)
  {
    v1 = objc_alloc_init(WiFiLocationManager);
    uint64_t v3 = sharedWiFiLocationManager_sharedWiFiLocationManager;
    sharedWiFiLocationManager_sharedWiFiLocationManager = (uint64_t)v1;
    return MEMORY[0x1F41817F8](v1, v3, v2);
  }
  return result;
}

- (WiFiLocationManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)WiFiLocationManager;
  uint64_t v2 = [(WiFiLocationManager *)&v11 init];
  uint64_t v3 = v2;
  if (v2)
  {
    [(WiFiLocationManager *)v2 setIsAuthorized:0];
    [(WiFiLocationManager *)v3 setLocationManagerState:5];
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(WiFiLocationManager *)v3 setClientsDataArray:v4];

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(WiFiLocationManager *)v3 setVisitClientsDataArray:v5];

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.wifi.location-manager", 0);
    [(WiFiLocationManager *)v3 setQueue:v6];

    id v7 = [(WiFiLocationManager *)v3 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__WiFiLocationManager_init__block_invoke;
    block[3] = &unk_1E69BC8D8;
    v10 = v3;
    dispatch_async(v7, block);
  }
  return v3;
}

uint64_t __27__WiFiLocationManager_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) createCoreLocationObjects];
}

- (void)dealloc
{
  uint64_t v3 = [(WiFiLocationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__WiFiLocationManager_dealloc__block_invoke;
  block[3] = &unk_1E69BC8D8;
  void block[4] = self;
  dispatch_async(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)WiFiLocationManager;
  [(WiFiLocationManager *)&v4 dealloc];
}

uint64_t __30__WiFiLocationManager_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) destroyCoreLocationObjects];
}

- (void)registerCallbackFunctionPtr:(void *)a3 withContext:(void *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1D9440170](self, a2);
  v11[0] = a4;
  v11[1] = a3;
  unsigned __int8 v8 = [MEMORY[0x1E4F29238] valueWithBytes:v11 objCType:"{?=^v^?}"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[WiFiLocationManager registerCallbackFunctionPtr:withContext:]";
    __int16 v14 = 2048;
    double v15 = a3;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Adding client: %p", buf, 0x16u);
  }
  v9 = self;
  objc_sync_enter(v9);
  v10 = [(WiFiLocationManager *)v9 clientsDataArray];
  [v10 addObject:v8];

  objc_sync_exit(v9);
}

- (void)registerVisitCallbackFunctionPtr:(void *)a3 withContext:(void *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1D9440170](self, a2);
  v11[0] = a4;
  v11[1] = a3;
  unsigned __int8 v8 = [MEMORY[0x1E4F29238] valueWithBytes:v11 objCType:"{?=^v^?}"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[WiFiLocationManager registerVisitCallbackFunctionPtr:withContext:]";
    __int16 v14 = 2048;
    double v15 = a3;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Adding client: %p", buf, 0x16u);
  }
  v9 = self;
  objc_sync_enter(v9);
  v10 = [(WiFiLocationManager *)v9 visitClientsDataArray];
  [v10 addObject:v8];

  objc_sync_exit(v9);
}

- (void)invokeClientsCallbackType:(int)a3 withLocation:(id)a4 withError:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1D9440170]();
  objc_super v11 = self;
  objc_sync_enter(v11);
  double v12 = MEMORY[0x1E4F14500];
  id v13 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = +[WiFiLocationManager getStringOfCallbackType:v6];
    double v15 = [v9 userInfo];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[WiFiLocationManager invokeClientsCallbackType:withLocation:withError:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    __int16 v27 = 2112;
    uint64_t v28 = v15;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: callbackType: %@, error: %@", buf, 0x20u);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v16 = [(WiFiLocationManager *)v11 clientsDataArray];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        [v20 getValue:buf];
        if (*(void *)&buf[8]) {
          (*(void (**)(uint64_t, void, id, id))&buf[8])(v6, *(void *)buf, v8, v9);
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v17);
  }

  objc_sync_exit(v11);
}

- (void)requestLowAccuracyLocationUpdate
{
}

void __55__WiFiLocationManager_requestLowAccuracyLocationUpdate__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v1, "locationManagerState"));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setCLLocationUpdateParams:v2];
}

- (void)requestHighAccuracyLocationUpdate
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D9440170](self, a2);
  objc_super v4 = self;
  objc_sync_enter(v4);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[WiFiLocationManager requestHighAccuracyLocationUpdate]";
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  if ([(WiFiLocationManager *)v4 isAuthorized])
  {
    if ([(WiFiLocationManager *)v4 locationManagerState] == 2)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Already querying high accuracy location", buf, 2u);
      }
    }
    else
    {
      [(WiFiLocationManager *)v4 setLocationManagerState:2];
      long long v21 = [(WiFiLocationManager *)v4 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__WiFiLocationManager_requestHighAccuracyLocationUpdate__block_invoke;
      block[3] = &unk_1E69BC8D8;
      void block[4] = v4;
      dispatch_async(v21, block);
    }
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    uint64_t v6 = [MEMORY[0x1E4F28B50] mainBundle];
    id v7 = [v6 localizedStringForKey:@"Location services are not authorized." value:&stru_1F2B5AC50 table:0];
    long long v24 = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v9 = [v5 errorWithDomain:@"com.apple.ios.wifi" code:1 userInfo:v8];

    BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v10) {
      [(WiFiLocationManager *)v10 requestLowAccuracyLocationUpdate];
    }
    [(WiFiLocationManager *)v4 invokeClientsCallbackType:2 withLocation:0 withError:v9];
    uint64_t v18 = [(WiFiLocationManager *)v4 delegate];
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      uint64_t v20 = [(WiFiLocationManager *)v4 delegate];
      [v20 didFailWithError:v9];
    }
  }
  objc_sync_exit(v4);
}

void __56__WiFiLocationManager_requestHighAccuracyLocationUpdate__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v1, "locationManagerState"));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setCLLocationUpdateParams:v2];
}

- (void)requestLeechedAccuracyLocationUpdate
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D9440170](self, a2);
  objc_super v4 = self;
  objc_sync_enter(v4);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[WiFiLocationManager requestLeechedAccuracyLocationUpdate]";
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  if ([(WiFiLocationManager *)v4 isAuthorized])
  {
    [(WiFiLocationManager *)v4 setLocationManagerState:3];
    id v5 = [(WiFiLocationManager *)v4 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__WiFiLocationManager_requestLeechedAccuracyLocationUpdate__block_invoke;
    block[3] = &unk_1E69BC8D8;
    void block[4] = v4;
    dispatch_async(v5, block);
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    id v7 = [MEMORY[0x1E4F28B50] mainBundle];
    id v8 = [v7 localizedStringForKey:@"Location services are not authorized." value:&stru_1F2B5AC50 table:0];
    long long v24 = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    BOOL v10 = [v6 errorWithDomain:@"com.apple.ios.wifi" code:1 userInfo:v9];

    BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v11) {
      [(WiFiLocationManager *)v11 requestLowAccuracyLocationUpdate];
    }
    [(WiFiLocationManager *)v4 invokeClientsCallbackType:2 withLocation:0 withError:v10];
    char v19 = [(WiFiLocationManager *)v4 delegate];
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      long long v21 = [(WiFiLocationManager *)v4 delegate];
      [v21 didFailWithError:v10];
    }
  }
  objc_sync_exit(v4);
}

void __59__WiFiLocationManager_requestLeechedAccuracyLocationUpdate__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v1, "locationManagerState"));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setCLLocationUpdateParams:v2];
}

- (void)stopQueryingLocation
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D9440170](self, a2);
  objc_super v4 = self;
  objc_sync_enter(v4);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[WiFiLocationManager stopQueryingLocation]";
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  [(WiFiLocationManager *)v4 setLocationManagerState:0];
  id v5 = [(WiFiLocationManager *)v4 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__WiFiLocationManager_stopQueryingLocation__block_invoke;
  block[3] = &unk_1E69BC8D8;
  void block[4] = v4;
  dispatch_async(v5, block);

  objc_sync_exit(v4);
}

void __43__WiFiLocationManager_stopQueryingLocation__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v1, "locationManagerState"));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setCLLocationUpdateParams:v2];
}

- (void)setShouldMonitorVisits:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1D9440170](self, a2);
  uint64_t v6 = self;
  objc_sync_enter(v6);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v10 = "-[WiFiLocationManager setShouldMonitorVisits:]";
    __int16 v11 = 1024;
    int v12 = v3;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s shouldMonitorVisits: %d", buf, 0x12u);
  }
  v6->_shouldMonitorVisits = v3;
  id v7 = [(WiFiLocationManager *)v6 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__WiFiLocationManager_setShouldMonitorVisits___block_invoke;
  block[3] = &unk_1E69BC8D8;
  void block[4] = v6;
  dispatch_async(v7, block);

  objc_sync_exit(v6);
}

void __46__WiFiLocationManager_setShouldMonitorVisits___block_invoke(uint64_t a1)
{
  v1 = *(unsigned __int8 **)(a1 + 32);
  int v2 = v1[8];
  int v3 = [v1 clLocationManager];
  id v4 = v3;
  if (v2) {
    [v3 startMonitoringVisits];
  }
  else {
    [v3 stopMonitoringVisits];
  }
}

- (void)createCoreLocationObjects
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v3 = (void *)MEMORY[0x1D9440170](self, a2);
  id v4 = objc_alloc(MEMORY[0x1E4F1E608]);
  id v5 = [(WiFiLocationManager *)self queue];
  uint64_t v6 = (void *)[v4 initWithEffectiveBundlePath:@"/System/Library/PrivateFrameworks/MobileWiFi.framework" delegate:self onQueue:v5];
  [(WiFiLocationManager *)self setClLocationManager:v6];

  -[WiFiLocationManager setIsAuthorized:](self, "setIsAuthorized:", [MEMORY[0x1E4F1E608] authorizationStatusForBundlePath:@"/System/Library/PrivateFrameworks/MobileWiFi.framework"]- 3 < 2);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(WiFiLocationManager *)self isAuthorized];
    id v8 = "is";
    if (!v7) {
      id v8 = "is not";
    }
    int v9 = 136315394;
    BOOL v10 = "-[WiFiLocationManager createCoreLocationObjects]";
    __int16 v11 = 2080;
    int v12 = v8;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: WiFi %s authorized for location", (uint8_t *)&v9, 0x16u);
  }
  if ([(WiFiLocationManager *)self isAuthorized]) {
    [(WiFiLocationManager *)self requestLeechedAccuracyLocationUpdate];
  }
}

- (void)destroyCoreLocationObjects
{
  int v3 = (void *)MEMORY[0x1D9440170](self, a2);
  id v4 = [(WiFiLocationManager *)self clLocationManager];
  [v4 stopUpdatingLocation];

  [(WiFiLocationManager *)self setQueue:0];
  [(WiFiLocationManager *)self setClLocationManager:0];
}

- (void)setCLLocationUpdateParams:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9440170]();
  uint64_t v6 = [v4 intValue];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = +[WiFiLocationManager getStringOfState:v6];
    int v18 = 136315394;
    char v19 = "-[WiFiLocationManager setCLLocationUpdateParams:]";
    __int16 v20 = 2112;
    long long v21 = v7;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: state <%@>", (uint8_t *)&v18, 0x16u);
  }
  switch((int)v6)
  {
    case 0:
      id v8 = [(WiFiLocationManager *)self clLocationManager];
      [v8 stopUpdatingLocation];
      goto LABEL_9;
    case 1:
      int v9 = [(WiFiLocationManager *)self clLocationManager];
      [v9 stopUpdatingLocation];

      BOOL v10 = (double *)MEMORY[0x1E4F1E700];
      goto LABEL_7;
    case 2:
      __int16 v11 = [(WiFiLocationManager *)self clLocationManager];
      [v11 stopUpdatingLocation];

      BOOL v10 = (double *)MEMORY[0x1E4F1E6F0];
LABEL_7:
      double v12 = *v10;
      uint64_t v13 = [(WiFiLocationManager *)self clLocationManager];
      [v13 setDesiredAccuracy:v12];

      uint64_t v14 = [(WiFiLocationManager *)self clLocationManager];
      [v14 startUpdatingLocation];

      [(WiFiLocationManager *)self performSelector:sel_locationRequestDidTimeOut withObject:0 afterDelay:60.0];
      break;
    case 3:
      uint64_t v15 = [(WiFiLocationManager *)self clLocationManager];
      [v15 stopUpdatingLocation];

      double v16 = *MEMORY[0x1E4F1E708];
      uint64_t v17 = [(WiFiLocationManager *)self clLocationManager];
      [v17 setDesiredAccuracy:v16];

      id v8 = [(WiFiLocationManager *)self clLocationManager];
      [v8 startUpdatingLocation];
LABEL_9:

      break;
    default:
      break;
  }
}

- (void)locationRequestDidTimeOut
{
  v13[1] = *MEMORY[0x1E4F143B8];
  int v3 = (void *)MEMORY[0x1D9440170](self, a2);
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v12 = *MEMORY[0x1E4F28568];
  id v5 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v6 = [v5 localizedStringForKey:@"Location request timed out." value:&stru_1F2B5AC50 table:0];
  v13[0] = v6;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v8 = [v4 errorWithDomain:@"com.apple.ios.wifi" code:60 userInfo:v7];

  [(WiFiLocationManager *)self invokeClientsCallbackType:2 withLocation:0 withError:v8];
  int v9 = [(WiFiLocationManager *)self delegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    BOOL v10 = [(WiFiLocationManager *)self delegate];
    [v10 didFailWithError:v8];
  }
  [(WiFiLocationManager *)self setLocationManagerState:3];
  __int16 v11 = objc_msgSend(NSNumber, "numberWithInt:", -[WiFiLocationManager locationManagerState](self, "locationManagerState"));
  [(WiFiLocationManager *)self setCLLocationUpdateParams:v11];
}

- (void)cancelLocationRequestTimeOut
{
  int v3 = (void *)MEMORY[0x1D9440170](self, a2);
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_locationRequestDidTimeOut object:0];
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void *)MEMORY[0x1D9440170]();
  [(WiFiLocationManager *)self setIsAuthorized:(a4 - 3) < 2];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v19 = a4;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "didChangeAuthorizationStatus: Notify registered clients of authorization status change, new status: %d", buf, 8u);
  }
  if ([(WiFiLocationManager *)self isAuthorized])
  {
    [(WiFiLocationManager *)self requestLeechedAccuracyLocationUpdate];
    id v8 = 0;
  }
  else
  {
    int v9 = (void *)MEMORY[0x1E4F28C58];
    BOOL v10 = objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle", *MEMORY[0x1E4F28568]);
    __int16 v11 = [v10 localizedStringForKey:@"Location services are not authorized." value:&stru_1F2B5AC50 table:0];
    uint64_t v17 = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v8 = [v9 errorWithDomain:@"com.apple.wifi" code:1 userInfo:v12];
  }
  [(WiFiLocationManager *)self invokeClientsCallbackType:3 withLocation:0 withError:v8];
  uint64_t v13 = [(WiFiLocationManager *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    uint64_t v15 = [(WiFiLocationManager *)self delegate];
    [v15 didChangeAuthorizationStatus];
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9440170]();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[WiFiLocationManager locationManager:didFailWithError:](v7);
  }
  if ([(WiFiLocationManager *)self locationManagerState] != 3)
  {
    [(WiFiLocationManager *)self invokeClientsCallbackType:2 withLocation:0 withError:v7];
    int v9 = [(WiFiLocationManager *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      __int16 v11 = [(WiFiLocationManager *)self delegate];
      [v11 didFailWithError:v7];
    }
    [(WiFiLocationManager *)self cancelLocationRequestTimeOut];
    [(WiFiLocationManager *)self requestLeechedAccuracyLocationUpdate];
  }
}

- (void)locationManager:(id)a3 didVisit:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9440170]();
  int v9 = self;
  objc_sync_enter(v9);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[WiFiLocationManager locationManager:didVisit:]";
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  if ([(WiFiLocationManager *)v9 shouldMonitorVisits])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    char v10 = [(WiFiLocationManager *)v9 visitClientsDataArray];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v19;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v10);
          }
          char v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
          *(_OWORD *)buf = 0uLL;
          [v14 getValue:buf];
          if (*(void *)&buf[8]) {
            (*(void (**)(void, id))&buf[8])(*(void *)buf, v7);
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v11);
    }

    uint64_t v15 = [(WiFiLocationManager *)v9 delegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      uint64_t v17 = [(WiFiLocationManager *)v9 delegate];
      [v17 didUpdateVisits:v7];
    }
  }
  objc_sync_exit(v9);
}

+ (void)logLocation:(id)a3 addPrefixString:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1D9440170]();
  if (v5)
  {
    unsigned int v8 = [v5 type] - 1;
    if (v8 > 9) {
      int v9 = @"unknown";
    }
    else {
      int v9 = off_1E69BE118[v8];
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%@: source=%@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    +[WiFiLocationManager logLocation:addPrefixString:]((uint64_t)v6);
  }
}

+ (id)getStringOfCallbackType:(int)a3
{
  id v4 = (void *)MEMORY[0x1D9440170](a1, a2);
  if ((a3 - 1) > 2) {
    id v5 = @"Unknown";
  }
  else {
    id v5 = off_1E69BE168[a3 - 1];
  }
  return v5;
}

+ (id)getStringOfState:(int)a3
{
  id v4 = (void *)MEMORY[0x1D9440170](a1, a2);
  if (a3 > 4) {
    id v5 = @"Unknown";
  }
  else {
    id v5 = off_1E69BE180[a3];
  }
  return v5;
}

- (unsigned)shouldMonitorVisits
{
  return self->_shouldMonitorVisits;
}

- (WiFiLocationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WiFiLocationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setIsAuthorized:(unsigned __int8)a3
{
  self->_isAuthorized = a3;
}

- (CLLocationManager)clLocationManager
{
  return self->_clLocationManager;
}

- (void)setClLocationManager:(id)a3
{
}

- (NSMutableArray)clientsDataArray
{
  return self->_clientsDataArray;
}

- (void)setClientsDataArray:(id)a3
{
}

- (NSMutableArray)visitClientsDataArray
{
  return self->_visitClientsDataArray;
}

- (void)setVisitClientsDataArray:(id)a3
{
}

- (void)setLocationManagerState:(int)a3
{
  self->_locationManagerState = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_visitClientsDataArray, 0);
  objc_storeStrong((id *)&self->_clientsDataArray, 0);
  objc_storeStrong((id *)&self->_clLocationManager, 0);
  objc_storeStrong((id *)&self->_latestLocation, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)locationManager:(void *)a1 didFailWithError:.cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v1 = [a1 description];
  int v2 = 136315394;
  int v3 = "-[WiFiLocationManager locationManager:didFailWithError:]";
  __int16 v4 = 2112;
  id v5 = v1;
  _os_log_error_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s: error: %@", (uint8_t *)&v2, 0x16u);
}

+ (void)logLocation:(uint64_t)a1 addPrefixString:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@: Error: location is nil", (uint8_t *)&v1, 0xCu);
}

+ (void)isLocationValid:(uint64_t)a3 uptoSeconds:(uint64_t)a4 requiredAccuracy:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)isLocationValid:(uint64_t)a3 uptoSeconds:(uint64_t)a4 requiredAccuracy:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)isLocationValid:(uint64_t)a3 uptoSeconds:(uint64_t)a4 requiredAccuracy:(uint64_t)a5 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end