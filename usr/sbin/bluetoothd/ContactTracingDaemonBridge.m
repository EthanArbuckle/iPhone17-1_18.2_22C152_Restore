@interface ContactTracingDaemonBridge
+ (id)sharedDaemonBridge;
- (BOOL)isBluetoothPoweredOn;
- (BOOL)isENLoggingProfileInstalled;
- (ContactTracingDaemonBridge)init;
- (ContactTracingPowerObserverCPP)_getPowerObserver;
- (id)bluetoothSystemContainerURL;
- (id)createAdvertisementQuerySessionWithThreshold:(unsigned __int8)a3 error:(id *)a4;
- (id)retrieveCurrentAdvertisingPayload;
- (id)retrieveTEKHistoryIncludingActive:(BOOL)a3 generateNewTEK:(BOOL)a4;
- (int)startTracingWithAppBundleIdentifier:(id)a3;
- (int)stopTracing;
- (unsigned)storedAdvertisementCount;
- (void)activate;
- (void)invalidate;
- (void)performPeriodicAdvertisementDatabasePurgeWithDate:(id)a3;
- (void)printBluetoothDebug;
- (void)purgeAdvertisementDatabase;
- (void)registerStateMetricPullCallback:(id)a3;
- (void)resetTEKHistory;
- (void)sendErrorMetricWithType:(unsigned int)a3;
- (void)sendOnBoardingMetricWithTrigger:(unsigned int)a3 completed:(BOOL)a4 firstTime:(BOOL)a5 countryCode:(id)a6 subdivisionCode:(id)a7 legalConsent:(BOOL)a8;
- (void)sendStateMetricWithVersion:(unsigned int)a3 subdivisionCode:(id)a4 availabilityAlertCount:(unsigned __int8)a5 legalConsentPageCount:(unsigned __int8)a6;
- (void)setAggressiveScanningEnabled:(BOOL)a3;
- (void)setENAppHasLoggingEntitlement:(BOOL)a3;
- (void)setLoggingParams:(BOOL)a3 loggingSensitive:(BOOL)a4;
- (void)setRegionServerConfiguration:(id)a3;
- (void)startPowerMonitoringWithStateChangeHandler:(id)a3;
- (void)stopPowerMonitoring;
- (void)switchToCentralAdvertisementStoreAsync;
@end

@implementation ContactTracingDaemonBridge

- (ContactTracingDaemonBridge)init
{
  v9.receiver = self;
  v9.super_class = (Class)ContactTracingDaemonBridge;
  v2 = [(ContactTracingDaemonBridge *)&v9 init];
  if (v2)
  {
    v3 = (ENDaemon *)objc_alloc_init((Class)ENDaemon);
    daemon = v2->_daemon;
    v2->_daemon = v3;

    [(ENDaemon *)v2->_daemon setDelegate:v2];
    uint64_t v5 = [(ENDaemon *)v2->_daemon dispatchQueue];
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = v2;
  }

  return v2;
}

+ (id)sharedDaemonBridge
{
  if (qword_100A145B0 != -1) {
    dispatch_once(&qword_100A145B0, &stru_1009BE518);
  }
  v2 = (void *)qword_100A145A8;

  return v2;
}

- (void)activate
{
}

- (void)invalidate
{
}

- (id)createAdvertisementQuerySessionWithThreshold:(unsigned __int8)a3 error:(id *)a4
{
  if (qword_1009FB7D8 != -1) {
    dispatch_once(&qword_1009FB7D8, &stru_1009BE550);
  }
  v6 = off_1009FB7D0;

  return sub_10054F0E4((uint64_t)v6, a3, (uint64_t)a4);
}

- (void)performPeriodicAdvertisementDatabasePurgeWithDate:(id)a3
{
  id v3 = a3;
  id v5 = v3;
  if (qword_1009FB7D8 == -1)
  {
    v4 = v3;
  }
  else
  {
    dispatch_once(&qword_1009FB7D8, &stru_1009BE550);
    v4 = v5;
  }
  sub_10054EF58((uint64_t)off_1009FB7D0, v4);
}

- (void)purgeAdvertisementDatabase
{
  if (qword_1009FB7D8 != -1) {
    dispatch_once(&qword_1009FB7D8, &stru_1009BE550);
  }
  v2 = off_1009FB7D0;

  sub_10054ECB0((uint64_t)v2);
}

- (id)retrieveTEKHistoryIncludingActive:(BOOL)a3 generateNewTEK:(BOOL)a4
{
  BOOL v4 = a4;
  if (qword_1009F7ED0 != -1) {
    dispatch_once(&qword_1009F7ED0, &stru_1009BE570);
  }
  uint64_t v6 = qword_1009F7EC8;

  return sub_100717080(v6, a3, v4);
}

- (void)resetTEKHistory
{
  if (qword_1009F7ED0 != -1) {
    dispatch_once(&qword_1009F7ED0, &stru_1009BE570);
  }
  uint64_t v2 = qword_1009F7EC8;

  sub_100716D24(v2);
}

- (id)retrieveCurrentAdvertisingPayload
{
  if (qword_1009FB798 != -1) {
    dispatch_once(&qword_1009FB798, &stru_1009BE590);
  }
  id v5 = 0;
  uint64_t v6 = 0;
  sub_10044C034((uint64_t)off_1009FB790, &v5);
  uint64_t v2 = sub_10004A6E4((uint64_t)&v5);
  id v3 = +[NSData dataWithBytes:v2 length:sub_100045F00((uint64_t)&v5)];
  id v5 = &off_100998428;
  if (v6) {
    sub_1000368F4(v6);
  }

  return v3;
}

- (unsigned)storedAdvertisementCount
{
  if (qword_1009FB7D8 != -1) {
    dispatch_once(&qword_1009FB7D8, &stru_1009BE550);
  }
  uint64_t v2 = off_1009FB7D0;

  return sub_10054F27C((uint64_t)v2);
}

- (void)switchToCentralAdvertisementStoreAsync
{
  if (qword_1009FB7D8 != -1) {
    dispatch_once(&qword_1009FB7D8, &stru_1009BE550);
  }
  uint64_t v2 = off_1009FB7D0;

  sub_10054EE50((uint64_t)v2);
}

- (void)registerStateMetricPullCallback:(id)a3
{
  id v4 = a3;
  uint64_t v3 = sub_100050530();
  (*(void (**)(uint64_t, id))(*(void *)v3 + 472))(v3, v4);
}

- (void)sendOnBoardingMetricWithTrigger:(unsigned int)a3 completed:(BOOL)a4 firstTime:(BOOL)a5 countryCode:(id)a6 subdivisionCode:(id)a7 legalConsent:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v10 = a5;
  BOOL v11 = a4;
  uint64_t v12 = *(void *)&a3;
  id v15 = a6;
  id v13 = a7;
  uint64_t v14 = sub_100050530();
  (*(void (**)(uint64_t, uint64_t, BOOL, BOOL, id, id, BOOL))(*(void *)v14 + 464))(v14, v12, v11, v10, v15, v13, v8);
}

- (void)sendStateMetricWithVersion:(unsigned int)a3 subdivisionCode:(id)a4 availabilityAlertCount:(unsigned __int8)a5 legalConsentPageCount:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  uint64_t v7 = a5;
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  uint64_t v9 = sub_100050530();
  (*(void (**)(uint64_t, uint64_t, id, uint64_t, uint64_t))(*(void *)v9 + 456))(v9, v8, v10, v6, v7);
}

- (void)sendErrorMetricWithType:(unsigned int)a3
{
  uint64_t v3 = *(void (**)(void))(*(void *)sub_100050530() + 480);

  v3();
}

- (BOOL)isBluetoothPoweredOn
{
  if (qword_1009F8748 != -1) {
    dispatch_once(&qword_1009F8748, &stru_1009BE5B0);
  }
  return sub_100028CB4((uint64_t)off_1009F8740) == 1;
}

- (id)bluetoothSystemContainerURL
{
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v7 = 0;
  uint64_t v2 = sub_10003FFD4();
  (*(void (**)(uint64_t, void **))(*(void *)v2 + 168))(v2, __p);
  if (v7 >= 0) {
    uint64_t v3 = __p;
  }
  else {
    uint64_t v3 = (void **)__p[0];
  }
  id v4 = +[NSURL fileURLWithFileSystemRepresentation:v3 isDirectory:1 relativeToURL:0];
  if (SHIBYTE(v7) < 0) {
    operator delete(__p[0]);
  }

  return v4;
}

- (void)printBluetoothDebug
{
  if (qword_1009FB798 != -1) {
    dispatch_once(&qword_1009FB798, &stru_1009BE590);
  }
  uint64_t v2 = off_1009FB790;

  sub_10044FACC((uint64_t)v2);
}

- (void)setAggressiveScanningEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_1009FB798 != -1) {
    dispatch_once(&qword_1009FB798, &stru_1009BE590);
  }
  if (v3) {
    int v4 = 5;
  }
  else {
    int v4 = 0;
  }
  id v5 = off_1009FB790;

  sub_10044EFFC((uint64_t)v5, v4);
}

- (void)setRegionServerConfiguration:(id)a3
{
  id v8 = a3;
  unsigned int v3 = [v8 dynamicAlgorithmEnabled];
  unsigned int v4 = [v8 dynamicThrottleDownAdvDensity];
  unsigned __int8 v5 = [v8 dynamicThrottleDownRSSI];
  [v8 dynamicThrottleDownDuration];
  uint64_t v7 = (int)v6;
  if (qword_1009FB798 != -1) {
    dispatch_once(&qword_1009FB798, &stru_1009BE590);
  }
  sub_10044F914((uint64_t)off_1009FB790, ((unint64_t)v5 << 32) | (v7 << 48) | (v4 << 16) | (unint64_t)v3);
}

- (void)startPowerMonitoringWithStateChangeHandler:(id)a3
{
  id v4 = a3;
  sub_1006B3F74((uint64_t)[(ContactTracingDaemonBridge *)self _getPowerObserver], v4);
}

- (void)stopPowerMonitoring
{
  uint64_t v2 = [(ContactTracingDaemonBridge *)self _getPowerObserver];

  sub_1006B405C((uint64_t)v2);
}

- (int)startTracingWithAppBundleIdentifier:(id)a3
{
  id v3 = a3;
  if (qword_1009FB798 != -1) {
    dispatch_once(&qword_1009FB798, &stru_1009BE590);
  }
  id v4 = off_1009FB790;
  double Current = CFAbsoluteTimeGetCurrent();
  LODWORD(v4) = sub_10044C9DC((uint64_t)v4, v3, Current);

  return (int)v4;
}

- (int)stopTracing
{
  if (qword_1009FB798 != -1) {
    dispatch_once(&qword_1009FB798, &stru_1009BE590);
  }
  uint64_t v2 = off_1009FB790;

  return sub_10044CE14((uint64_t)v2);
}

- (BOOL)isENLoggingProfileInstalled
{
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)sub_100017768() + 168);

  return v2();
}

- (void)setENAppHasLoggingEntitlement:(BOOL)a3
{
  id v3 = *(void (**)(void))(*(void *)sub_100017768() + 200);

  v3();
}

- (void)setLoggingParams:(BOOL)a3 loggingSensitive:(BOOL)a4
{
  id v4 = *(void (**)(void))(*(void *)sub_100017768() + 232);

  v4();
}

- (ContactTracingPowerObserverCPP)_getPowerObserver
{
  result = (ContactTracingPowerObserverCPP *)qword_100A145B8;
  if (!qword_100A145B8) {
    operator new();
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_daemon, 0);
}

@end