@interface CLAvengerScanner
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)shouldStartSpecialScan;
- (BOOL)syncgetIsScanning;
- (CLAvengerScanner)init;
- (id).cxx_construct;
- (id)convertCLAvengerScannerScanParametersToWPObjectDiscoveryOptions:(CLAvengerScannerScanParameters *)a3;
- (id)nameForClient:(id)a3;
- (int64_t)getCLAvengerScannerPolicyPlatformType;
- (void)beginService;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)clearLongAggressiveTimeoutBlockForClient:(id)a3;
- (void)createLongAggressiveTimeoutBlockForClient:(id)a3 seconds:(int64_t)a4 withBlock:(id)a5;
- (void)endService;
- (void)handleFoundDevice:(id)a3;
- (void)initAnalyticsCache;
- (void)initAnalyticsTimer;
- (void)initializeClientRequestsViewsWithZeroValues:(id)a3;
- (void)initializeScanTypeChangeViewsWithZeroValues;
- (void)notifyClientsAggressiveScanEnded;
- (void)notifyClientsAggressiveScanStarted;
- (void)objectDiscovery:(id)a3 failedToStartScanningWithError:(id)a4;
- (void)objectDiscovery:(id)a3 foundDevice:(id)a4;
- (void)objectDiscovery:(id)a3 foundDevices:(id)a4;
- (void)objectDiscoveryStartedScanning:(id)a3;
- (void)objectDiscoveryStoppedScanning:(id)a3;
- (void)objectDiscoveryUpdatedState:(id)a3;
- (void)onAnalyticsTimerFired:(id)a3;
- (void)onObjectDiscoveryUpdatedState:(int64_t)a3;
- (void)performTemporaryAggressiveScan:(id)a3;
- (void)performTemporaryAggressiveScanForFindMyAccessoryManager:(id)a3;
- (void)performTemporaryHawkeyeLowEnergyScan:(id)a3;
- (void)performTemporaryLongAggressiveScan:(id)a3;
- (void)persistAnalyticsCache;
- (void)resetAnalyticsCache;
- (void)scanTypeUpdated:(int64_t)a3;
- (void)start;
- (void)startBTFindingScan:(id)a3;
- (void)startMonitoringAvengerAdvertisementsForClient:(id)a3 clientName:(id)a4;
- (void)startMonitoringAvengerAdvertisementsForClient:(id)a3 optedIn:(BOOL)a4 clientName:(id)a5;
- (void)startWatchAdvertisementBufferScan:(id)a3;
- (void)startedAggressiveDiscoveryScan;
- (void)stop;
- (void)stopBTFindingScan:(id)a3;
- (void)stopMonitoringAvengerAdvertisementsForClient:(id)a3;
- (void)stopWatchAdvertisementBufferScan:(id)a3;
- (void)stoppedAggressiveDiscoveryScan;
- (void)submitClientRequestsEvent:(id)a3 client:(id)a4 scanType:(id)a5;
- (void)submitScanTypeChangeEvent:(id)a3 type:(id)a4;
- (void)systemCoexImpact:(id)a3 toState:(int)a4;
- (void)terminateTemporaryLongAggressiveScan:(id)a3;
@end

@implementation CLAvengerScanner

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_102482558 != -1) {
    dispatch_once(&qword_102482558, &stru_102306218);
  }
  return (id)qword_102482550;
}

+ (BOOL)isSupported
{
  return os_variant_is_darwinos() ^ 1;
}

- (CLAvengerScanner)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLAvengerScanner;
  return [(CLAvengerScanner *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLAvengerScannerServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLAvengerScannerClientProtocol];
}

- (void)beginService
{
  self->_queue = (OS_dispatch_queue *)[objc_msgSend(-[CLAvengerScanner universe](self, "universe"), "silo") queue];
  self->_objectDiscoveryManager = (WPObjectDiscovery *)[objc_alloc((Class)WPObjectDiscovery) initWithDelegate:self queue:[objc_msgSend(-[CLAvengerScanner universe](self, "universe"), "silo") queue]];
  self->_clients = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  self->_clientToNameMap = +[NSMapTable weakToStrongObjectsMapTable];
  self->_clientToLongAggressiveScanTimeout = +[NSMapTable weakToStrongObjectsMapTable];
  self->_stateContext = objc_alloc_init(CLAvengerScannerStateContext);
  self->_policy = [[CLAvengerScannerPolicy alloc] initWithDelegate:self platformType:[(CLAvengerScanner *)self getCLAvengerScannerPolicyPlatformType] supportsPerTypeDuplicateFilter:sub_100740FE4()];
  self->_centralManager = (CBCentralManager *)[objc_alloc((Class)CBCentralManager) initWithDelegate:self queue:[objc_msgSend(-[CLAvengerScanner universe](self, "universe"), "silo") queue]];
  self->_hasQueriedNumberOfBuffers = 0;
  self->_systemMonitor = [[CLDurianSystemMonitor alloc] initWithUniverse:[(CLAvengerScanner *)self universe]];
  self->_avengerScannerSettings = [[CLAvengerScannerSettings alloc] initWithUniverse:[(CLAvengerScanner *)self universe]];
  [(CLDurianSystemMonitor *)self->_systemMonitor setDelegate:self];
  [(CLAvengerScanner *)self initializeScanTypeChangeViewsWithZeroValues];
  [(CLAvengerScanner *)self initAnalyticsCache];
  [(CLAvengerScanner *)self initAnalyticsTimer];
  self->_reconciler = [[CLAvengerReconciler alloc] initWithQueue:self->_queue];
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023062B0);
  }
  objc_super v3 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLAvengerScanner: begin service", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1023062B0);
    }
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAvengerScanner beginService]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023062B0);
  }
  v4 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(CLAvengerScannerSettings *)self->_avengerScannerSettings settingsDictionary];
    *(_DWORD *)buf = 68289283;
    int v8 = 0;
    __int16 v9 = 2082;
    v10 = "";
    __int16 v11 = 2113;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: settings\", \"settings\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
}

- (void)endService
{
  self->_objectDiscoveryManager = 0;
  self->_centralManager = 0;
  self->_hasQueriedNumberOfBuffers = 0;

  self->_policy = 0;
  self->_clients = 0;

  self->_clientToNameMap = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = [(NSMapTable *)self->_clientToLongAggressiveScanTimeout objectEnumerator];
  id v4 = [(NSEnumerator *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        dispatch_block_cancel(*(dispatch_block_t *)(*((void *)&v8 + 1) + 8 * (void)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSEnumerator *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  self->_clientToLongAggressiveScanTimeout = 0;
  self->_reconciler = 0;
}

- (id)nameForClient:(id)a3
{
  if (!-[NSMapTable objectForKey:](self->_clientToNameMap, "objectForKey:")) {
    return @"Unknown";
  }
  clientToNameMap = self->_clientToNameMap;

  return [(NSMapTable *)clientToNameMap objectForKey:a3];
}

- (void)startMonitoringAvengerAdvertisementsForClient:(id)a3 clientName:(id)a4
{
  BOOL v7 = [(CLAvengerScannerPolicy *)self->_policy optedIn];

  [(CLAvengerScanner *)self startMonitoringAvengerAdvertisementsForClient:a3 optedIn:v7 clientName:a4];
}

- (void)clearLongAggressiveTimeoutBlockForClient:(id)a3
{
  id v5 = -[NSMapTable objectForKey:](self->_clientToLongAggressiveScanTimeout, "objectForKey:");
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023062B0);
  }
  uint64_t v6 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289538;
    v7[1] = 0;
    __int16 v8 = 2082;
    long long v9 = "";
    __int16 v10 = 2114;
    id v11 = [(CLAvengerScanner *)self nameForClient:a3];
    __int16 v12 = 1026;
    BOOL v13 = v5 != 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner clearing LongAggressive timeout block\", \"client\":%{public, location:escape_only}@, \"block\":%{public}hhd}", (uint8_t *)v7, 0x22u);
  }
  if (v5)
  {
    dispatch_block_cancel(v5);
    [(NSMapTable *)self->_clientToLongAggressiveScanTimeout removeObjectForKey:a3];
  }
}

- (void)createLongAggressiveTimeoutBlockForClient:(id)a3 seconds:(int64_t)a4 withBlock:(id)a5
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023062B0);
  }
  long long v9 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 68289538;
    int v17 = 0;
    __int16 v18 = 2082;
    v19 = "";
    __int16 v20 = 2114;
    id v21 = [(CLAvengerScanner *)self nameForClient:a3];
    __int16 v22 = 2050;
    int64_t v23 = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner creating LongAggressive timeout block\", \"client\":%{public, location:escape_only}@, \"seconds\":%{public}lld}", (uint8_t *)&v16, 0x26u);
  }
  if ([(NSMapTable *)self->_clientToLongAggressiveScanTimeout objectForKey:a3])
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1023062B0);
    }
    __int16 v10 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_ERROR))
    {
      id v11 = [(CLAvengerScanner *)self nameForClient:a3];
      int v16 = 68289282;
      int v17 = 0;
      __int16 v18 = 2082;
      v19 = "";
      __int16 v20 = 2114;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScanner a LongAggressive timeout block already exists for client\", \"client\":%{public, location:escape_only}@}", (uint8_t *)&v16, 0x1Cu);
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_1023062B0);
      }
    }
    __int16 v12 = qword_102419568;
    if (os_signpost_enabled((os_log_t)qword_102419568))
    {
      id v13 = [(CLAvengerScanner *)self nameForClient:a3];
      int v16 = 68289282;
      int v17 = 0;
      __int16 v18 = 2082;
      v19 = "";
      __int16 v20 = 2114;
      id v21 = v13;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLAvengerScanner a LongAggressive timeout block already exists for client", "{\"msg%{public}.0s\":\"CLAvengerScanner a LongAggressive timeout block already exists for client\", \"client\":%{public, location:escape_only}@}", (uint8_t *)&v16, 0x1Cu);
    }
  }
  else
  {
    dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, a5);
    dispatch_time_t v15 = dispatch_time(0, 1000000000 * a4);
    dispatch_after(v15, (dispatch_queue_t)self->_queue, v14);
    [(NSMapTable *)self->_clientToLongAggressiveScanTimeout setObject:v14 forKey:a3];
    _Block_release(v14);
  }
}

- (void)startMonitoringAvengerAdvertisementsForClient:(id)a3 optedIn:(BOOL)a4 clientName:(id)a5
{
  if (a5)
  {
    clients = self->_clients;
    if (clients)
    {
      BOOL v8 = a4;
      -[NSMutableSet addObject:](clients, "addObject:");
      [(NSMapTable *)self->_clientToNameMap setObject:a5 forKey:a3];
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_1023062B0);
      }
      __int16 v10 = qword_102419568;
      if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [(CLAvengerScanner *)self nameForClient:a3];
        unsigned int v12 = [(CLAvengerScannerStateContext *)self->_stateContext currentWPState];
        int64_t state = self->_state;
        unsigned int v14 = [(CLAvengerScannerStateContext *)self->_stateContext startScanningAwaitingResponse];
        unsigned int v15 = [(CLAvengerScannerStateContext *)self->_stateContext stopScanningAwaitingResponse];
        v16[0] = 68290562;
        v16[1] = 0;
        __int16 v17 = 2082;
        __int16 v18 = "";
        __int16 v19 = 2114;
        id v20 = v11;
        __int16 v21 = 1026;
        BOOL v22 = v8;
        __int16 v23 = 1026;
        unsigned int v24 = v12;
        __int16 v25 = 1026;
        int v26 = state;
        __int16 v27 = 1026;
        unsigned int v28 = v14;
        __int16 v29 = 1026;
        unsigned int v30 = v15;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: startMonitoringAvengerAdvertisementsForClient\", \"client\":%{public, location:escape_only}@, \"optedIn\":%{public}hhd, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)v16, 0x3Au);
      }
      if ([(CLAvengerScannerPolicy *)self->_policy optedIn] != v8) {
        [(CLAvengerScannerPolicy *)self->_policy setOptedIn:v8];
      }
      if (self->_state <= 1uLL)
      {
        self->_int64_t state = 2;
        [(CLAvengerScanner *)self start];
      }
      [(CLAvengerScanner *)self initializeClientRequestsViewsWithZeroValues:a5];
      [(CLAvengerScanner *)self submitClientRequestsEvent:&off_102393788 client:a5 scanType:+[NSString stringWithUTF8String:"StartMonitor"]];
    }
  }
}

- (void)stopMonitoringAvengerAdvertisementsForClient:(id)a3
{
  if (-[NSMutableSet containsObject:](self->_clients, "containsObject:"))
  {
    [(CLAvengerScanner *)self submitClientRequestsEvent:&off_102393788 client:[(CLAvengerScanner *)self nameForClient:a3] scanType:+[NSString stringWithUTF8String:"StopMonitor"]];
    [(NSMutableSet *)self->_clients removeObject:a3];
    [(NSMapTable *)self->_clientToNameMap removeObjectForKey:a3];
    if (![(NSMutableSet *)self->_clients count] && (self->_state & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      self->_int64_t state = 1;
      [(CLAvengerScanner *)self stop];
    }
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1023062B0);
    }
    id v5 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_INFO))
    {
      id v6 = [(CLAvengerScanner *)self nameForClient:a3];
      id v7 = [(NSMutableSet *)self->_clients count];
      unsigned int v8 = [(CLAvengerScannerStateContext *)self->_stateContext currentWPState];
      int64_t state = self->_state;
      unsigned int v10 = [(CLAvengerScannerStateContext *)self->_stateContext startScanningAwaitingResponse];
      unsigned int v11 = [(CLAvengerScannerStateContext *)self->_stateContext stopScanningAwaitingResponse];
      v12[0] = 68290562;
      v12[1] = 0;
      __int16 v13 = 2082;
      unsigned int v14 = "";
      __int16 v15 = 2114;
      id v16 = v6;
      __int16 v17 = 2050;
      id v18 = v7;
      __int16 v19 = 1026;
      unsigned int v20 = v8;
      __int16 v21 = 1026;
      int v22 = state;
      __int16 v23 = 1026;
      unsigned int v24 = v10;
      __int16 v25 = 1026;
      unsigned int v26 = v11;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLAvengerScanner: stopMonitoringAvengerAdvertisementsForClient\", \"client\":%{public, location:escape_only}@, \"clientCount\":%{public}lu, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)v12, 0x3Eu);
    }
  }
}

- (id)convertCLAvengerScannerScanParametersToWPObjectDiscoveryOptions:(CLAvengerScannerScanParameters *)a3
{
  v5[0] = WPObjectDiscoveryScanKeyAdvBuffer;
  v6[0] = +[NSNumber numberWithInteger:a3->var5];
  v5[1] = WPObjectDiscoveryScanKeyAdvBufferRate;
  v6[1] = +[NSNumber numberWithInteger:a3->var4];
  v5[2] = WPObjectDiscoveryScanKeyAllowDuplicates;
  v6[2] = +[NSNumber numberWithBool:a3->var0];
  v5[3] = WPObjectDiscoveryScanKeyScanWhenLocked;
  v6[3] = +[NSNumber numberWithBool:a3->var1];
  v5[4] = WPObjectDiscoveryScanKeyScreenOffRate;
  v6[4] = +[NSNumber numberWithInteger:a3->var3];
  v5[5] = WPObjectDiscoveryScanKeyScreenOnRate;
  v6[5] = +[NSNumber numberWithInteger:a3->var2];
  return +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:6];
}

- (void)start
{
  if (self->_state != 3)
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1023062B0);
    }
    objc_super v3 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v4 = [(CLAvengerScannerStateContext *)self->_stateContext currentWPState];
      int64_t state = self->_state;
      unsigned int v6 = [(CLAvengerScannerStateContext *)self->_stateContext startScanningAwaitingResponse];
      unsigned int v7 = [(CLAvengerScannerStateContext *)self->_stateContext stopScanningAwaitingResponse];
      *(_DWORD *)buf = 68290050;
      int v16 = 0;
      __int16 v17 = 2082;
      id v18 = "";
      __int16 v19 = 1026;
      *(_DWORD *)unsigned int v20 = v4;
      *(_WORD *)&v20[4] = 1026;
      *(_DWORD *)&v20[6] = state;
      LOWORD(v21) = 1026;
      *(_DWORD *)((char *)&v21 + 2) = v6;
      HIWORD(v21) = 1026;
      unsigned int v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLAvengerScanner: attempting to start\", \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", buf, 0x2Au);
    }
    if (![(CLAvengerScannerStateContext *)self->_stateContext startScanningAwaitingResponse]&& (id)[(CLAvengerScannerStateContext *)self->_stateContext currentWPState] == (id)3)
    {
      [(CLAvengerScannerStateContext *)self->_stateContext setStartScanningAwaitingResponse:1];
      [(CLAvengerScannerStateContext *)self->_stateContext setStopScanningAwaitingResponse:0];
      [(CLAvengerScannerStateContext *)self->_stateContext setRequestedScanType:[(CLAvengerScannerPolicy *)self->_policy currentScanType]];
      policy = self->_policy;
      if (policy)
      {
        [(CLAvengerScannerPolicy *)policy currentScanParameters];
      }
      else
      {
        uint64_t v14 = 0;
        long long v12 = 0u;
        long long v13 = 0u;
      }
      id v9 = [(CLAvengerScanner *)self convertCLAvengerScannerScanParametersToWPObjectDiscoveryOptions:&v12];
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_1023062B0);
      }
      unsigned int v10 = qword_102419568;
      if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = +[CLAvengerScannerPolicy convertCLAvengerScannerPolicyScanTypeToString:[(CLAvengerScannerPolicy *)self->_policy currentScanType]];
        *(_DWORD *)buf = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        id v18 = "";
        __int16 v19 = 2114;
        *(void *)unsigned int v20 = v11;
        *(_WORD *)&v20[8] = 2113;
        id v21 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: startScanning requested\", \"ScanType\":%{public, location:escape_only}@, \"ScanParameters\":%{private, location:escape_only}@}", buf, 0x26u);
      }
      -[WPObjectDiscovery startScanningWithOptions:](self->_objectDiscoveryManager, "startScanningWithOptions:", v9, v12, v13, v14);
    }
  }
}

- (void)stop
{
  if (self->_state
    && ![(CLAvengerScannerStateContext *)self->_stateContext stopScanningAwaitingResponse])
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1023062B0);
    }
    objc_super v3 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v4 = [(CLAvengerScannerStateContext *)self->_stateContext currentWPState];
      int64_t state = self->_state;
      unsigned int v6 = [(CLAvengerScannerStateContext *)self->_stateContext startScanningAwaitingResponse];
      unsigned int v7 = [(CLAvengerScannerStateContext *)self->_stateContext stopScanningAwaitingResponse];
      int v9 = 68290050;
      int v10 = 0;
      __int16 v11 = 2082;
      long long v12 = "";
      __int16 v13 = 1026;
      unsigned int v14 = v4;
      __int16 v15 = 1026;
      int v16 = state;
      __int16 v17 = 1026;
      unsigned int v18 = v6;
      __int16 v19 = 1026;
      unsigned int v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLAvengerScanner: attempting to stop\", \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)&v9, 0x2Au);
    }
    if ((id)[(CLAvengerScannerStateContext *)self->_stateContext currentWPState] == (id)3)
    {
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_1023062B0);
      }
      unsigned int v8 = qword_102419568;
      if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_INFO))
      {
        int v9 = 68289026;
        int v10 = 0;
        __int16 v11 = 2082;
        long long v12 = "";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLAvengerScanner: stopScanning requested\"}", (uint8_t *)&v9, 0x12u);
      }
      [(CLAvengerScannerStateContext *)self->_stateContext setStopScanningAwaitingResponse:1];
      [(CLAvengerScannerStateContext *)self->_stateContext setStartScanningAwaitingResponse:0];
      [(WPObjectDiscovery *)self->_objectDiscoveryManager stopScanning];
    }
  }
}

- (void)onObjectDiscoveryUpdatedState:(int64_t)a3
{
  if ([(CLAvengerScannerStateContext *)self->_stateContext currentWPState] != a3)
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1023062B0);
    }
    id v5 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_INFO))
    {
      unsigned int v6 = [(CLAvengerScannerStateContext *)self->_stateContext currentWPState];
      int64_t state = self->_state;
      unsigned int v8 = [(CLAvengerScannerStateContext *)self->_stateContext startScanningAwaitingResponse];
      unsigned int v9 = [(CLAvengerScannerStateContext *)self->_stateContext stopScanningAwaitingResponse];
      v11[0] = 68290306;
      v11[1] = 0;
      __int16 v12 = 2082;
      __int16 v13 = "";
      __int16 v14 = 1026;
      int v15 = a3;
      __int16 v16 = 1026;
      unsigned int v17 = v6;
      __int16 v18 = 1026;
      int v19 = state;
      __int16 v20 = 1026;
      unsigned int v21 = v8;
      __int16 v22 = 1026;
      unsigned int v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLAvengerScanner: objectDiscovery state changed\", \"nextWPState\":%{public}d, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)v11, 0x30u);
    }
    [(CLAvengerScannerStateContext *)self->_stateContext setCurrentWPState:a3];
    if ((unint64_t)(a3 - 1) <= 1)
    {
      [(CLAvengerScannerStateContext *)self->_stateContext setStartScanningAwaitingResponse:0];
      [(CLAvengerScannerStateContext *)self->_stateContext setStopScanningAwaitingResponse:0];
      if ([(CLAvengerScannerPolicy *)self->_policy hasActiveAggressiveScan]) {
        [(CLAvengerScanner *)self notifyClientsAggressiveScanEnded];
      }
    }
    int64_t v10 = self->_state;
    if (v10 == 3)
    {
      self->_int64_t state = 2;
    }
    else if (v10 == 2)
    {
      if ((id)[(CLAvengerScannerStateContext *)self->_stateContext currentWPState] == (id)3) {
        [(CLAvengerScanner *)self start];
      }
    }
    else if (v10 == 1 {
           && (id)[(CLAvengerScannerStateContext *)self->_stateContext currentWPState] == (id)3)
    }
    {
      [(CLAvengerScanner *)self stop];
    }
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = [a3 state];
  if ((v4 == (id)10 || v4 == (id)5) && !self->_hasQueriedNumberOfBuffers)
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1023062B0);
    }
    id v5 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v9 = 0;
      __int16 v10 = 2082;
      __int16 v11 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: requesting num adv buffers\"}", buf, 0x12u);
    }
    centralManager = self->_centralManager;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    _DWORD v7[2] = sub_100F57578;
    v7[3] = &unk_102306240;
    v7[4] = self;
    [(CBCentralManager *)centralManager retrieveSupportedResources:CBManagerResourceADVBufferCount subKey:&stru_10234F018 completion:v7];
  }
}

- (void)objectDiscoveryUpdatedState:(id)a3
{
  id v4 = [a3 state];

  [(CLAvengerScanner *)self onObjectDiscoveryUpdatedState:v4];
}

- (void)objectDiscoveryStartedScanning:(id)a3
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023062B0);
  }
  id v5 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v6 = [(CLAvengerScannerStateContext *)self->_stateContext currentWPState];
    int64_t state = self->_state;
    unsigned int v8 = [(CLAvengerScannerStateContext *)self->_stateContext startScanningAwaitingResponse];
    unsigned int v9 = [(CLAvengerScannerStateContext *)self->_stateContext stopScanningAwaitingResponse];
    int v16 = 68290050;
    int v17 = 0;
    __int16 v18 = 2082;
    int v19 = "";
    __int16 v20 = 1026;
    unsigned int v21 = v6;
    __int16 v22 = 1026;
    int v23 = state;
    __int16 v24 = 1026;
    unsigned int v25 = v8;
    __int16 v26 = 1026;
    unsigned int v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLAvengerScanner: objectDiscoveryStartedScanning\", \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)&v16, 0x2Au);
  }
  [(CLAvengerScannerStateContext *)self->_stateContext setStartScanningAwaitingResponse:0];
  unint64_t v10 = self->_state;
  if (v10 < 2)
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1023062B0);
    }
    __int16 v12 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_ERROR))
    {
      int v16 = 68289026;
      int v17 = 0;
      __int16 v18 = 2082;
      int v19 = "";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScanner: received objectDiscoveryStartedScanning with scanner in CLAvengerScannerStopped - this is unexpected\"}", (uint8_t *)&v16, 0x12u);
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_1023062B0);
      }
    }
    __int16 v13 = qword_102419568;
    if (os_signpost_enabled((os_log_t)qword_102419568))
    {
      int v16 = 68289026;
      int v17 = 0;
      __int16 v18 = 2082;
      int v19 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLAvengerScanner: received objectDiscoveryStartedScanning with scanner in CLAvengerScannerStopped - this is unexpected", "{\"msg%{public}.0s\":\"CLAvengerScanner: received objectDiscoveryStartedScanning with scanner in CLAvengerScannerStopped - this is unexpected\"}", (uint8_t *)&v16, 0x12u);
    }
  }
  else if (v10 == 2)
  {
    self->_int64_t state = 3;
  }
  else if (v10 == 3)
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1023062B0);
    }
    __int16 v11 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_INFO))
    {
      int v16 = 68289026;
      int v17 = 0;
      __int16 v18 = 2082;
      int v19 = "";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLAvengerScanner: received objectDiscoveryStartedScanning with scanner in CLAvengerScannerScanning - overwrite parameters\"}", (uint8_t *)&v16, 0x12u);
    }
  }
  -[CLAvengerScanner onObjectDiscoveryUpdatedState:](self, "onObjectDiscoveryUpdatedState:", [a3 state]);
  [(CLAvengerScanner *)self submitScanTypeChangeEvent:&off_102393788 type:+[CLAvengerScannerPolicy convertCLAvengerScannerPolicyScanTypeToString:[(CLAvengerScannerStateContext *)self->_stateContext requestedScanType]]];
  __int16 v14 = [(CLAvengerScannerPolicy *)self->_policy currentScanType];
  if (v14 != (void *)[(CLAvengerScannerStateContext *)self->_stateContext requestedScanType])
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1023062B0);
    }
    int v15 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 68289026;
      int v17 = 0;
      __int16 v18 = 2082;
      int v19 = "";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: objectDiscoveryStartedScanning achieved scan and current desired scan dont match, restarting\"}", (uint8_t *)&v16, 0x12u);
    }
    self->_int64_t state = 2;
    [(CLAvengerScanner *)self start];
  }
}

- (void)objectDiscoveryStoppedScanning:(id)a3
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023062B0);
  }
  id v4 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v5 = [(CLAvengerScannerStateContext *)self->_stateContext currentWPState];
    int64_t state = self->_state;
    unsigned int v7 = [(CLAvengerScannerStateContext *)self->_stateContext startScanningAwaitingResponse];
    unsigned int v8 = [(CLAvengerScannerStateContext *)self->_stateContext stopScanningAwaitingResponse];
    int v12 = 68290050;
    int v13 = 0;
    __int16 v14 = 2082;
    int v15 = "";
    __int16 v16 = 1026;
    unsigned int v17 = v5;
    __int16 v18 = 1026;
    int v19 = state;
    __int16 v20 = 1026;
    unsigned int v21 = v7;
    __int16 v22 = 1026;
    unsigned int v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLAvengerScanner: objectDiscoveryStoppedScanning\", \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)&v12, 0x2Au);
  }
  [(CLAvengerScannerStateContext *)self->_stateContext setStopScanningAwaitingResponse:0];
  if ([(CLAvengerScannerPolicy *)self->_policy hasActiveAggressiveScan]) {
    [(CLAvengerScanner *)self notifyClientsAggressiveScanEnded];
  }
  int64_t v9 = self->_state;
  switch(v9)
  {
    case 3:
      self->_int64_t state = 2;
      [(CLAvengerScanner *)self start];
      break;
    case 1:
      self->_int64_t state = 0;
      break;
    case 0:
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_1023062B0);
      }
      unint64_t v10 = qword_102419568;
      if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_ERROR))
      {
        int v12 = 68289026;
        int v13 = 0;
        __int16 v14 = 2082;
        int v15 = "";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScanner: received objectDiscoveryStartedScanning with scanner in CLAvengerScannerStopped - this is unexpected\"}", (uint8_t *)&v12, 0x12u);
        if (qword_102419560 != -1) {
          dispatch_once(&qword_102419560, &stru_1023062B0);
        }
      }
      __int16 v11 = qword_102419568;
      if (os_signpost_enabled((os_log_t)qword_102419568))
      {
        int v12 = 68289026;
        int v13 = 0;
        __int16 v14 = 2082;
        int v15 = "";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLAvengerScanner: received objectDiscoveryStartedScanning with scanner in CLAvengerScannerStopped - this is unexpected", "{\"msg%{public}.0s\":\"CLAvengerScanner: received objectDiscoveryStartedScanning with scanner in CLAvengerScannerStopped - this is unexpected\"}", (uint8_t *)&v12, 0x12u);
      }
      break;
  }
}

- (void)objectDiscovery:(id)a3 failedToStartScanningWithError:(id)a4
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023062B0);
  }
  unsigned int v6 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_ERROR))
  {
    unsigned int v7 = [(CLAvengerScannerStateContext *)self->_stateContext currentWPState];
    int64_t state = self->_state;
    unsigned int v9 = [(CLAvengerScannerStateContext *)self->_stateContext startScanningAwaitingResponse];
    unsigned int v10 = [(CLAvengerScannerStateContext *)self->_stateContext stopScanningAwaitingResponse];
    *(_DWORD *)buf = 68290307;
    int v22 = 0;
    __int16 v23 = 2082;
    __int16 v24 = "";
    __int16 v25 = 2113;
    id v26 = a4;
    __int16 v27 = 1026;
    unsigned int v28 = v7;
    __int16 v29 = 1026;
    int v30 = state;
    __int16 v31 = 1026;
    unsigned int v32 = v9;
    __int16 v33 = 1026;
    unsigned int v34 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScanner: failedToStartScanning\", \"error\":%{private, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", buf, 0x34u);
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1023062B0);
    }
  }
  __int16 v11 = qword_102419568;
  if (os_signpost_enabled((os_log_t)qword_102419568))
  {
    unsigned int v12 = [(CLAvengerScannerStateContext *)self->_stateContext currentWPState];
    int64_t v20 = self->_state;
    unsigned int v13 = [(CLAvengerScannerStateContext *)self->_stateContext startScanningAwaitingResponse];
    unsigned int v14 = [(CLAvengerScannerStateContext *)self->_stateContext stopScanningAwaitingResponse];
    *(_DWORD *)buf = 68290307;
    int v22 = 0;
    __int16 v23 = 2082;
    __int16 v24 = "";
    __int16 v25 = 2113;
    id v26 = a4;
    __int16 v27 = 1026;
    unsigned int v28 = v12;
    __int16 v29 = 1026;
    int v30 = v20;
    __int16 v31 = 1026;
    unsigned int v32 = v13;
    __int16 v33 = 1026;
    unsigned int v34 = v14;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLAvengerScanner: failedToStartScanning", "{\"msg%{public}.0s\":\"CLAvengerScanner: failedToStartScanning\", \"error\":%{private, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", buf, 0x34u);
  }
  [(CLAvengerScannerStateContext *)self->_stateContext setStartScanningAwaitingResponse:0];
  [(CLAvengerScannerStateContext *)self->_stateContext setStopScanningAwaitingResponse:0];
  int64_t v15 = self->_state;
  switch(v15)
  {
    case 3:
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_1023062B0);
      }
      unsigned int v17 = qword_102419568;
      if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "CLAvengerScanner: failedToStartScanningWithError when in CLAvengerScannerScanning state", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419560 != -1) {
          dispatch_once(&qword_102419560, &stru_1023062B0);
        }
        goto LABEL_35;
      }
      break;
    case 1:
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_1023062B0);
      }
      __int16 v18 = qword_102419568;
      if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "CLAvengerScanner: failedToStartScanningWithError when in CLAvengerScannerStopPending state", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419560 != -1) {
          dispatch_once(&qword_102419560, &stru_1023062B0);
        }
        goto LABEL_35;
      }
      break;
    case 0:
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_1023062B0);
      }
      __int16 v16 = qword_102419568;
      if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "CLAvengerScanner: failedToStartScanningWithError when in CLAvengerScannerStopped state", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419560 != -1) {
          dispatch_once(&qword_102419560, &stru_1023062B0);
        }
LABEL_35:
        int v19 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLAvengerScanner objectDiscovery:failedToStartScanningWithError:]", "%s\n", v19);
        if (v19 != (char *)buf) {
          free(v19);
        }
      }
      break;
  }
}

- (void)objectDiscovery:(id)a3 foundDevice:(id)a4
{
  [(CLAvengerScanner *)self handleFoundDevice:a4];
  id v6 = [a3 state];

  [(CLAvengerScanner *)self onObjectDiscoveryUpdatedState:v6];
}

- (void)objectDiscovery:(id)a3 foundDevices:(id)a4
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = [a4 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(a4);
        }
        [(CLAvengerScanner *)self handleFoundDevice:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      id v8 = [a4 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v8);
  }
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023062B0);
  }
  __int16 v11 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 68289026;
    __int16 v27 = 2082;
    unsigned int v28 = "";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: buffer emptied\"}", (uint8_t *)&buf, 0x12u);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  clients = self->_clients;
  id v13 = [(NSMutableSet *)clients countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(clients);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)j) onAdvertisementBufferEmptied];
      }
      id v14 = [(NSMutableSet *)clients countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
  -[CLAvengerScanner onObjectDiscoveryUpdatedState:](self, "onObjectDiscoveryUpdatedState:", [a3 state]);
}

- (void)handleFoundDevice:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_1023062D0);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_FAULT))
  {
    uint64_t buf = 68289283;
    __int16 v31 = 2082;
    unsigned int v32 = "";
    __int16 v33 = 2113;
    id v34 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner Depricated function handleFoundDevice called with data\", \"device\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_1023062D0);
    }
  }
  unsigned int v5 = qword_102419398;
  if (os_signpost_enabled((os_log_t)qword_102419398))
  {
    uint64_t buf = 68289283;
    __int16 v31 = 2082;
    unsigned int v32 = "";
    __int16 v33 = 2113;
    id v34 = a3;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLAvengerScanner Depricated function handleFoundDevice called with data", "{\"msg%{public}.0s\":\"CLAvengerScanner Depricated function handleFoundDevice called with data\", \"device\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
  }
  id v6 = [CLAvengerScannerClientObjectDiscoveryData alloc];
  uint64_t v7 = WPObjectDiscoveryKeyAddress;
  id v8 = [a3 objectForKeyedSubscript:WPObjectDiscoveryKeyAddress];
  uint64_t v9 = WPObjectDiscoveryKeyData;
  id v10 = [a3 objectForKeyedSubscript:WPObjectDiscoveryKeyData];
  id v11 = [[a3 objectForKeyedSubscript:WPObjectDiscoveryKeyStatus] unsignedCharValue];
  id v12 = [a3 objectForKeyedSubscript:WPObjectDiscoveryKeyOptional];
  id v13 = [[objc_msgSend(a3, "objectForKeyedSubscript:", WPObjectDiscoveryKeyRSSI) integerValue];
  id v14 = [a3 objectForKeyedSubscript:WPObjectDiscoveryKeyTime];
  LOBYTE(v23) = 0;
  uint64_t v15 = -[CLAvengerScannerClientObjectDiscoveryData initWithAddress:advertisementData:status:reserved:rssi:scanDate:channel:didCauseWake:detailsBitmask:protocolID:](v6, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:channel:didCauseWake:detailsBitmask:protocolID:", v8, v10, v11, v12, v13, v14, [a3 objectForKeyedSubscript:WPObjectDiscoveryKeyChannel], v23, 0);
  reconciler = self->_reconciler;
  if (reconciler) {
    id v17 = [-[CLAvengerReconciler attemptReconciliationWithAddress:advertisementData:](reconciler, "attemptReconciliationWithAddress:advertisementData:", [a3 objectForKeyedSubscript:v7], [a3 objectForKeyedSubscript:v9]);
  }
  else {
    id v17 = 0;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  clients = self->_clients;
  id v19 = [(NSMutableSet *)clients countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(clients);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * i) onAvengerAdvertisement:v15 reconciledInformation:v17];
      }
      id v20 = [(NSMutableSet *)clients countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v20);
  }
}

- (void)notifyClientsAggressiveScanStarted
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023062B0);
  }
  objc_super v3 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v4 = [(CLAvengerScannerStateContext *)self->_stateContext currentWPState];
    int64_t state = self->_state;
    unsigned int v6 = [(CLAvengerScannerStateContext *)self->_stateContext startScanningAwaitingResponse];
    unsigned int v7 = [(CLAvengerScannerStateContext *)self->_stateContext stopScanningAwaitingResponse];
    uint64_t buf = 68290050;
    __int16 v19 = 2082;
    id v20 = "";
    __int16 v21 = 1026;
    unsigned int v22 = v4;
    __int16 v23 = 1026;
    int v24 = state;
    __int16 v25 = 1026;
    unsigned int v26 = v6;
    __int16 v27 = 1026;
    unsigned int v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLAvengerScanner: notifyClientsAggressiveScanStarted\", \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)&buf, 0x2Au);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  clients = self->_clients;
  id v9 = [(NSMutableSet *)clients countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(clients);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * i) onAggressiveScanStarted];
      }
      id v10 = [(NSMutableSet *)clients countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)notifyClientsAggressiveScanEnded
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023062B0);
  }
  objc_super v3 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v4 = [(CLAvengerScannerStateContext *)self->_stateContext currentWPState];
    int64_t state = self->_state;
    unsigned int v6 = [(CLAvengerScannerStateContext *)self->_stateContext startScanningAwaitingResponse];
    unsigned int v7 = [(CLAvengerScannerStateContext *)self->_stateContext stopScanningAwaitingResponse];
    uint64_t buf = 68290050;
    __int16 v19 = 2082;
    id v20 = "";
    __int16 v21 = 1026;
    unsigned int v22 = v4;
    __int16 v23 = 1026;
    int v24 = state;
    __int16 v25 = 1026;
    unsigned int v26 = v6;
    __int16 v27 = 1026;
    unsigned int v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLAvengerScanner: notifyClientsAggressiveScanEnded\", \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)&buf, 0x2Au);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  clients = self->_clients;
  id v9 = [(NSMutableSet *)clients countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(clients);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * i) onAggressiveScanEnded];
      }
      id v10 = [(NSMutableSet *)clients countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (BOOL)syncgetIsScanning
{
  return self->_state == 3;
}

- (BOOL)shouldStartSpecialScan
{
  id v2 = [(NSMutableSet *)self->_clients count];
  if (!v2)
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1023062B0);
    }
    objc_super v3 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_ERROR))
    {
      int v6 = 68289026;
      int v7 = 0;
      __int16 v8 = 2082;
      id v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScanner: special scan requested, but currently no clients, not starting\"}", (uint8_t *)&v6, 0x12u);
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_1023062B0);
      }
    }
    unsigned int v4 = qword_102419568;
    if (os_signpost_enabled((os_log_t)qword_102419568))
    {
      int v6 = 68289026;
      int v7 = 0;
      __int16 v8 = 2082;
      id v9 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLAvengerScanner: special scan requested, but currently no clients, not starting", "{\"msg%{public}.0s\":\"CLAvengerScanner: special scan requested, but currently no clients, not starting\"}", (uint8_t *)&v6, 0x12u);
    }
  }
  return v2 != 0;
}

- (void)performTemporaryAggressiveScan:(id)a3
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023062B0);
  }
  unsigned int v5 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(CLAvengerScanner *)self nameForClient:a3];
    unsigned int v7 = [(CLAvengerScannerStateContext *)self->_stateContext currentWPState];
    int64_t state = self->_state;
    unsigned int v9 = [(CLAvengerScannerStateContext *)self->_stateContext startScanningAwaitingResponse];
    unsigned int v10 = [(CLAvengerScannerStateContext *)self->_stateContext stopScanningAwaitingResponse];
    *(_DWORD *)uint64_t buf = 68290306;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)id v12 = 2082;
    *(void *)&_DWORD v12[2] = "";
    *(_WORD *)&v12[10] = 2114;
    *(void *)&v12[12] = v6;
    *(_WORD *)&v12[20] = 1026;
    *(_DWORD *)&v12[22] = v7;
    *(_WORD *)&v12[26] = 1026;
    *(_DWORD *)&v12[28] = state;
    LOWORD(v13) = 1026;
    *(_DWORD *)((char *)&v13 + 2) = v9;
    HIWORD(v13) = 1026;
    LODWORD(v14) = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: performTemporaryAggressiveScan requested\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", buf, 0x34u);
  }
  if ([(CLAvengerScanner *)self shouldStartSpecialScan])
  {
    *(void *)uint64_t buf = 0;
    *(void *)id v12 = buf;
    *(void *)&v12[8] = 0x3812000000;
    *(void *)&v12[16] = sub_100177E4C;
    *(void *)&v12[24] = sub_100177604;
    uint64_t v13 = 0;
    operator new();
  }
}

- (void)performTemporaryAggressiveScanForFindMyAccessoryManager:(id)a3
{
  if ([(CLAvengerScannerPolicy *)self->_policy hasActiveBTFindingScan])
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1023062B0);
    }
    unsigned int v5 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(CLAvengerScanner *)self nameForClient:a3];
      unsigned int v7 = [(CLAvengerScannerStateContext *)self->_stateContext currentWPState];
      int64_t state = self->_state;
      unsigned int v9 = [(CLAvengerScannerStateContext *)self->_stateContext startScanningAwaitingResponse];
      unsigned int v10 = [(CLAvengerScannerStateContext *)self->_stateContext stopScanningAwaitingResponse];
      v11[0] = 68290306;
      v11[1] = 0;
      __int16 v12 = 2082;
      uint64_t v13 = "";
      __int16 v14 = 2114;
      id v15 = v6;
      __int16 v16 = 1026;
      unsigned int v17 = v7;
      __int16 v18 = 1026;
      int v19 = state;
      __int16 v20 = 1026;
      unsigned int v21 = v9;
      __int16 v22 = 1026;
      unsigned int v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: requested AggressiveScan but RSSI Finding scan active\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)v11, 0x34u);
    }
  }
  else
  {
    [(CLAvengerScanner *)self performTemporaryAggressiveScan:a3];
  }
}

- (void)performTemporaryLongAggressiveScan:(id)a3
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023062B0);
  }
  unsigned int v5 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(CLAvengerScanner *)self nameForClient:a3];
    unsigned int v7 = [(CLAvengerScannerStateContext *)self->_stateContext currentWPState];
    id v8 = a3;
    int64_t state = self->_state;
    unsigned int v10 = [(CLAvengerScannerStateContext *)self->_stateContext startScanningAwaitingResponse];
    unsigned int v11 = [(CLAvengerScannerStateContext *)self->_stateContext stopScanningAwaitingResponse];
    *(_DWORD *)uint64_t buf = 68290306;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)id v34 = 2082;
    *(void *)&v34[2] = "";
    *(_WORD *)&v34[10] = 2114;
    *(void *)&v34[12] = v6;
    *(_WORD *)&v34[20] = 1026;
    *(_DWORD *)&v34[22] = v7;
    *(_WORD *)&v34[26] = 1026;
    *(_DWORD *)&v34[28] = state;
    a3 = v8;
    *(_WORD *)&v34[32] = 1026;
    *(_DWORD *)&v34[34] = v10;
    *(_WORD *)&v34[38] = 1026;
    LODWORD(v35) = v11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: performTemporaryLongAggressiveScan requested\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", buf, 0x34u);
  }
  if ([(CLAvengerScanner *)self shouldStartSpecialScan])
  {
    if (![(NSMapTable *)self->_clientToLongAggressiveScanTimeout objectForKey:a3])
    {
      if ([(CLAvengerScannerPolicy *)self->_policy associatedTo2GHzWiFi]
        && [(CLAvengerScannerPolicy *)self->_policy wifi2GHzCriticalState]
        || [(CLAvengerScannerPolicy *)self->_policy bluetoothAudioActive])
      {
        [(CLAvengerScannerSettings *)self->_avengerScannerSettings longAggressiveScanCoexImpactedDuration];
        double v25 = v24;
        int v26 = 1;
      }
      else
      {
        [(CLAvengerScannerSettings *)self->_avengerScannerSettings longAggressiveScanNonCoexImpactedDuration];
        double v25 = v27;
        int v26 = 0;
      }
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_1023062B0);
      }
      unsigned int v28 = qword_102419568;
      if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v29 = [(CLAvengerScannerPolicy *)self->_policy associatedTo2GHzWiFi];
        unsigned int v30 = [(CLAvengerScannerPolicy *)self->_policy wifi2GHzCriticalState];
        unsigned int v31 = [(CLAvengerScannerPolicy *)self->_policy bluetoothAudioActive];
        *(_DWORD *)uint64_t buf = 68290306;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)id v34 = 2082;
        *(void *)&v34[2] = "";
        *(_WORD *)&v34[10] = 1026;
        *(_DWORD *)&v34[12] = (int)v25;
        *(_WORD *)&v34[16] = 1026;
        *(_DWORD *)&v34[18] = v26;
        *(_WORD *)&v34[22] = 1026;
        *(_DWORD *)&v34[24] = v29;
        *(_WORD *)&v34[28] = 1026;
        *(_DWORD *)&v34[30] = v30;
        *(_WORD *)&v34[34] = 1026;
        *(_DWORD *)&v34[36] = v31;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: performTemporaryLongAggressiveScan scanning\", \"duration\":%{public}d, \"coexImpacted\":%{public}hhd, \"associatedTo2GHzWiFi\":%{public}hhd, \"wifi2GHzCriticalState\":%{public}hhd, \"bluetoothAudioActive\":%{public}hhd}", buf, 0x30u);
      }
      if (v26)
      {
        *(void *)uint64_t buf = 0;
        *(void *)id v34 = buf;
        *(void *)&v34[8] = 0x3812000000;
        *(void *)&v34[16] = sub_100177E4C;
        *(void *)&v34[24] = sub_100177604;
        *(void *)&v34[32] = 0;
        operator new();
      }
      *(void *)uint64_t buf = 0;
      *(void *)id v34 = buf;
      *(void *)&v34[8] = 0x3812000000;
      *(void *)&v34[16] = sub_100177E4C;
      *(void *)&v34[24] = sub_100177604;
      *(void *)&v34[32] = 0;
      operator new();
    }
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1023062B0);
    }
    __int16 v12 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_ERROR))
    {
      id v32 = [(CLAvengerScanner *)self nameForClient:a3];
      unsigned int v13 = [(CLAvengerScannerStateContext *)self->_stateContext currentWPState];
      int v14 = self->_state;
      unsigned int v15 = [(CLAvengerScannerStateContext *)self->_stateContext startScanningAwaitingResponse];
      unsigned int v16 = [(CLAvengerScannerStateContext *)self->_stateContext stopScanningAwaitingResponse];
      *(_DWORD *)uint64_t buf = 68290306;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)id v34 = 2082;
      *(void *)&v34[2] = "";
      *(_WORD *)&v34[10] = 2114;
      *(void *)&v34[12] = v32;
      *(_WORD *)&v34[20] = 1026;
      *(_DWORD *)&v34[22] = v13;
      *(_WORD *)&v34[26] = 1026;
      *(_DWORD *)&v34[28] = v14;
      *(_WORD *)&v34[32] = 1026;
      *(_DWORD *)&v34[34] = v15;
      *(_WORD *)&v34[38] = 1026;
      LODWORD(v35) = v16;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScanner: performTemporaryLongAggressiveScan requested but one is already active\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", buf, 0x34u);
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_1023062B0);
      }
    }
    unsigned int v17 = qword_102419568;
    if (os_signpost_enabled((os_log_t)qword_102419568))
    {
      id v18 = [(CLAvengerScanner *)self nameForClient:a3];
      p_stateContext = &self->_stateContext;
      unsigned int v20 = [(CLAvengerScannerStateContext *)self->_stateContext currentWPState];
      int v21 = self->_state;
      unsigned int v22 = [(CLAvengerScannerStateContext *)self->_stateContext startScanningAwaitingResponse];
      unsigned int v23 = [(CLAvengerScannerStateContext *)*p_stateContext stopScanningAwaitingResponse];
      *(_DWORD *)uint64_t buf = 68290306;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)id v34 = 2082;
      *(void *)&v34[2] = "";
      *(_WORD *)&v34[10] = 2114;
      *(void *)&v34[12] = v18;
      *(_WORD *)&v34[20] = 1026;
      *(_DWORD *)&v34[22] = v20;
      *(_WORD *)&v34[26] = 1026;
      *(_DWORD *)&v34[28] = v21;
      *(_WORD *)&v34[32] = 1026;
      *(_DWORD *)&v34[34] = v22;
      *(_WORD *)&v34[38] = 1026;
      LODWORD(v35) = v23;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLAvengerScanner: performTemporaryLongAggressiveScan requested but one is already active", "{\"msg%{public}.0s\":\"CLAvengerScanner: performTemporaryLongAggressiveScan requested but one is already active\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", buf, 0x34u);
    }
  }
}

- (void)terminateTemporaryLongAggressiveScan:(id)a3
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023062B0);
  }
  unsigned int v5 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(CLAvengerScanner *)self nameForClient:a3];
    unsigned int v7 = [(CLAvengerScannerStateContext *)self->_stateContext currentWPState];
    int64_t state = self->_state;
    unsigned int v9 = [(CLAvengerScannerStateContext *)self->_stateContext startScanningAwaitingResponse];
    unsigned int v10 = [(CLAvengerScannerStateContext *)self->_stateContext stopScanningAwaitingResponse];
    int v24 = 68290306;
    int v25 = 0;
    __int16 v26 = 2082;
    double v27 = "";
    __int16 v28 = 2114;
    id v29 = v6;
    __int16 v30 = 1026;
    unsigned int v31 = v7;
    __int16 v32 = 1026;
    int v33 = state;
    __int16 v34 = 1026;
    unsigned int v35 = v9;
    __int16 v36 = 1026;
    unsigned int v37 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: terminateTemporaryLongAggressiveScan requested\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)&v24, 0x34u);
  }
  id v11 = [(NSMapTable *)self->_clientToLongAggressiveScanTimeout objectForKey:a3];
  if (v11)
  {
    dispatch_async((dispatch_queue_t)self->_queue, v11);
  }
  else
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1023062B0);
    }
    __int16 v12 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_ERROR))
    {
      id v13 = [(CLAvengerScanner *)self nameForClient:a3];
      unsigned int v14 = [(CLAvengerScannerStateContext *)self->_stateContext currentWPState];
      int64_t v15 = self->_state;
      unsigned int v16 = [(CLAvengerScannerStateContext *)self->_stateContext startScanningAwaitingResponse];
      unsigned int v17 = [(CLAvengerScannerStateContext *)self->_stateContext stopScanningAwaitingResponse];
      int v24 = 68290306;
      int v25 = 0;
      __int16 v26 = 2082;
      double v27 = "";
      __int16 v28 = 2114;
      id v29 = v13;
      __int16 v30 = 1026;
      unsigned int v31 = v14;
      __int16 v32 = 1026;
      int v33 = v15;
      __int16 v34 = 1026;
      unsigned int v35 = v16;
      __int16 v36 = 1026;
      unsigned int v37 = v17;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScanner: terminateTemporaryLongAggressiveScan requested but none is active\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)&v24, 0x34u);
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_1023062B0);
      }
    }
    id v18 = qword_102419568;
    if (os_signpost_enabled((os_log_t)qword_102419568))
    {
      id v19 = [(CLAvengerScanner *)self nameForClient:a3];
      unsigned int v20 = [(CLAvengerScannerStateContext *)self->_stateContext currentWPState];
      int64_t v21 = self->_state;
      unsigned int v22 = [(CLAvengerScannerStateContext *)self->_stateContext startScanningAwaitingResponse];
      unsigned int v23 = [(CLAvengerScannerStateContext *)self->_stateContext stopScanningAwaitingResponse];
      int v24 = 68290306;
      int v25 = 0;
      __int16 v26 = 2082;
      double v27 = "";
      __int16 v28 = 2114;
      id v29 = v19;
      __int16 v30 = 1026;
      unsigned int v31 = v20;
      __int16 v32 = 1026;
      int v33 = v21;
      __int16 v34 = 1026;
      unsigned int v35 = v22;
      __int16 v36 = 1026;
      unsigned int v37 = v23;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLAvengerScanner: terminateTemporaryLongAggressiveScan requested but none is active", "{\"msg%{public}.0s\":\"CLAvengerScanner: terminateTemporaryLongAggressiveScan requested but none is active\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)&v24, 0x34u);
    }
  }
}

- (void)performTemporaryHawkeyeLowEnergyScan:(id)a3
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023062B0);
  }
  unsigned int v5 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(CLAvengerScanner *)self nameForClient:a3];
    unsigned int v7 = [(CLAvengerScannerStateContext *)self->_stateContext currentWPState];
    int64_t state = self->_state;
    unsigned int v9 = [(CLAvengerScannerStateContext *)self->_stateContext startScanningAwaitingResponse];
    unsigned int v10 = [(CLAvengerScannerStateContext *)self->_stateContext stopScanningAwaitingResponse];
    *(_DWORD *)uint64_t buf = 68290306;
    int v14 = 0;
    __int16 v15 = 2082;
    unsigned int v16 = "";
    __int16 v17 = 2114;
    id v18 = v6;
    __int16 v19 = 1026;
    unsigned int v20 = v7;
    __int16 v21 = 1026;
    int v22 = state;
    __int16 v23 = 1026;
    unsigned int v24 = v9;
    __int16 v25 = 1026;
    unsigned int v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: performTemporaryHawkeyeLowEnergyScan requested\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", buf, 0x34u);
  }
  if ([(CLAvengerScanner *)self shouldStartSpecialScan])
  {
    [(CLAvengerScannerPolicy *)self->_policy startHawkeyeLowEnergyScan];
    dispatch_time_t v11 = dispatch_time(0, 60000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100F5A7E8;
    block[3] = &unk_10229FED8;
    block[4] = self;
    dispatch_after(v11, (dispatch_queue_t)[objc_msgSend(-[CLAvengerScanner universe](self, "universe"), "silo") queue], block);
    [(CLAvengerScanner *)self submitClientRequestsEvent:&off_102393788 client:[(CLAvengerScanner *)self nameForClient:a3] scanType:+[NSString stringWithUTF8String:"HELE"]];
  }
}

- (void)startBTFindingScan:(id)a3
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023062B0);
  }
  unsigned int v5 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(CLAvengerScanner *)self nameForClient:a3];
    unsigned int v7 = [(CLAvengerScannerStateContext *)self->_stateContext currentWPState];
    int64_t state = self->_state;
    unsigned int v9 = [(CLAvengerScannerStateContext *)self->_stateContext startScanningAwaitingResponse];
    unsigned int v10 = [(CLAvengerScannerStateContext *)self->_stateContext stopScanningAwaitingResponse];
    v11[0] = 68290306;
    v11[1] = 0;
    __int16 v12 = 2082;
    id v13 = "";
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 1026;
    unsigned int v17 = v7;
    __int16 v18 = 1026;
    int v19 = state;
    __int16 v20 = 1026;
    unsigned int v21 = v9;
    __int16 v22 = 1026;
    unsigned int v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: startBTFindingScan requested\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)v11, 0x34u);
  }
  if ([(CLAvengerScanner *)self shouldStartSpecialScan])
  {
    [(CLAvengerScannerPolicy *)self->_policy startBTFindingScan];
    [(CLAvengerScanner *)self submitClientRequestsEvent:&off_102393788 client:[(CLAvengerScanner *)self nameForClient:a3] scanType:+[NSString stringWithUTF8String:"StartBTFinding"]];
  }
}

- (void)stopBTFindingScan:(id)a3
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023062B0);
  }
  unsigned int v5 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(CLAvengerScanner *)self nameForClient:a3];
    unsigned int v7 = [(CLAvengerScannerStateContext *)self->_stateContext currentWPState];
    int64_t state = self->_state;
    unsigned int v9 = [(CLAvengerScannerStateContext *)self->_stateContext startScanningAwaitingResponse];
    unsigned int v10 = [(CLAvengerScannerStateContext *)self->_stateContext stopScanningAwaitingResponse];
    v11[0] = 68290306;
    v11[1] = 0;
    __int16 v12 = 2082;
    id v13 = "";
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 1026;
    unsigned int v17 = v7;
    __int16 v18 = 1026;
    int v19 = state;
    __int16 v20 = 1026;
    unsigned int v21 = v9;
    __int16 v22 = 1026;
    unsigned int v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: stopBTFindingScan requested\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)v11, 0x34u);
  }
  [(CLAvengerScannerPolicy *)self->_policy stopBTFindingScan];
  [(CLAvengerScanner *)self submitClientRequestsEvent:&off_102393788 client:[(CLAvengerScanner *)self nameForClient:a3] scanType:+[NSString stringWithUTF8String:"StopBTFinding"]];
}

- (void)startWatchAdvertisementBufferScan:(id)a3
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023062B0);
  }
  unsigned int v5 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(CLAvengerScanner *)self nameForClient:a3];
    unsigned int v7 = [(CLAvengerScannerStateContext *)self->_stateContext currentWPState];
    int64_t state = self->_state;
    unsigned int v9 = [(CLAvengerScannerStateContext *)self->_stateContext startScanningAwaitingResponse];
    unsigned int v10 = [(CLAvengerScannerStateContext *)self->_stateContext stopScanningAwaitingResponse];
    v11[0] = 68290306;
    v11[1] = 0;
    __int16 v12 = 2082;
    id v13 = "";
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 1026;
    unsigned int v17 = v7;
    __int16 v18 = 1026;
    int v19 = state;
    __int16 v20 = 1026;
    unsigned int v21 = v9;
    __int16 v22 = 1026;
    unsigned int v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: startWatchAdvertisementBufferScan requested\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)v11, 0x34u);
  }
  if ([(CLAvengerScanner *)self shouldStartSpecialScan])
  {
    [(CLAvengerScannerPolicy *)self->_policy startWatchAdvertisementBufferScan];
    [(CLAvengerScanner *)self submitClientRequestsEvent:&off_102393788 client:[(CLAvengerScanner *)self nameForClient:a3] scanType:+[NSString stringWithUTF8String:"StartWatchADVBuffer"]];
  }
}

- (void)stopWatchAdvertisementBufferScan:(id)a3
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023062B0);
  }
  unsigned int v5 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(CLAvengerScanner *)self nameForClient:a3];
    unsigned int v7 = [(CLAvengerScannerStateContext *)self->_stateContext currentWPState];
    int64_t state = self->_state;
    unsigned int v9 = [(CLAvengerScannerStateContext *)self->_stateContext startScanningAwaitingResponse];
    unsigned int v10 = [(CLAvengerScannerStateContext *)self->_stateContext stopScanningAwaitingResponse];
    v11[0] = 68290306;
    v11[1] = 0;
    __int16 v12 = 2082;
    id v13 = "";
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 1026;
    unsigned int v17 = v7;
    __int16 v18 = 1026;
    int v19 = state;
    __int16 v20 = 1026;
    unsigned int v21 = v9;
    __int16 v22 = 1026;
    unsigned int v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: stopWatchAdvertisementBufferScan requested\", \"client\":%{public, location:escape_only}@, \"_currentWPState\":%{public}d, \"_state\":%{public}d, \"_stateContext.startScanningAwaitingResponse\":%{public}hhd, \"_stateContext.stopScanningAwaitingResponse\":%{public}hhd}", (uint8_t *)v11, 0x34u);
  }
  [(CLAvengerScannerPolicy *)self->_policy stopWatchAdvertisementBufferScan];
  [(CLAvengerScanner *)self submitClientRequestsEvent:&off_102393788 client:[(CLAvengerScanner *)self nameForClient:a3] scanType:+[NSString stringWithUTF8String:"StopWatchADVBuffer"]];
}

- (void)submitScanTypeChangeEvent:(id)a3 type:(id)a4
{
  v14[0] = +[NSString stringWithUTF8String:"scanCount"];
  v15[0] = a3;
  v14[1] = +[NSString stringWithUTF8String:"scanType"];
  v15[1] = a4;
  id v6 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2]);
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023062B0);
  }
  unsigned int v7 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t buf = 68289282;
    int v9 = 0;
    __int16 v10 = 2082;
    dispatch_time_t v11 = "";
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLAvengerScanner: submitScanTypeChangeEvent\", \"analyticsEvent\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  +[NSString stringWithUTF8String:"com.apple.locationd.avengerscanner.scantypechange"];
  AnalyticsSendEventLazy();
}

- (void)initializeScanTypeChangeViewsWithZeroValues
{
  for (uint64_t i = 0; i != 13; ++i)
    [(CLAvengerScanner *)self submitScanTypeChangeEvent:&off_1023937A0 type:+[CLAvengerScannerPolicy convertCLAvengerScannerPolicyScanTypeToString:i]];
}

- (void)submitClientRequestsEvent:(id)a3 client:(id)a4 scanType:(id)a5
{
  v16[0] = +[NSString stringWithUTF8String:"requestCount"];
  v17[0] = a3;
  v16[1] = +[NSString stringWithUTF8String:"client"];
  v17[1] = a4;
  _DWORD v16[2] = +[NSString stringWithUTF8String:"scanType"];
  v17[2] = a5;
  id v8 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3]);
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023062B0);
  }
  int v9 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t buf = 68289282;
    int v11 = 0;
    __int16 v12 = 2082;
    id v13 = "";
    __int16 v14 = 2114;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLAvengerScanner: submitClientRequestsEvent\", \"analyticsEvent\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  +[NSString stringWithUTF8String:"com.apple.locationd.avengerscanner.clientrequests"];
  AnalyticsSendEventLazy();
}

- (void)initializeClientRequestsViewsWithZeroValues:(id)a3
{
  v15[0] = +[NSString stringWithUTF8String:"Aggressive"];
  v15[1] = +[NSString stringWithUTF8String:"StartBTFinding"];
  void v15[2] = +[NSString stringWithUTF8String:"StopBTFinding"];
  v15[3] = +[NSString stringWithUTF8String:"AggressiveLong"];
  v15[4] = +[NSString stringWithUTF8String:"HELE"];
  v15[5] = +[NSString stringWithUTF8String:"StartWatchADVBuffer"];
  v15[6] = +[NSString stringWithUTF8String:"StopWatchADVBuffer"];
  v15[7] = +[NSString stringWithUTF8String:"StartMonitor"];
  v15[8] = +[NSString stringWithUTF8String:"StopMonitor"];
  unsigned int v5 = +[NSArray arrayWithObjects:v15 count:9];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      int v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(CLAvengerScanner *)self submitClientRequestsEvent:&off_1023937A0 client:a3 scanType:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9)];
        int v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)onAnalyticsTimerFired:(id)a3
{
  if (self->fAnalyticsTimer == a3)
  {
    p_fAnalytics = &self->fAnalytics;
    self->fAnalytics.count_submission = 1;
    v6[0] = +[NSString stringWithUTF8String:"numSwitchToAgressiveScan"];
    v7[0] = +[NSNumber numberWithUnsignedInt:p_fAnalytics->numSwitchToAggressiveScan];
    v6[1] = +[NSString stringWithUTF8String:"count_submission"];
    v7[1] = +[NSNumber numberWithUnsignedInt:p_fAnalytics->count_submission];
    unsigned int v5 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2]);
    +[NSString stringWithUTF8String:"com.apple.locationd.avengerscanner.aggressivescan"];
    AnalyticsSendEventLazy();
    [(CLAvengerScanner *)self resetAnalyticsCache];
  }
}

- (void)initAnalyticsCache
{
  sub_1000E9354(v5);
  uint64_t v3 = sub_1000A6958();
  if (sub_100012960(v3, "AvengerScannerAnalyticsTimer", v5))
  {
    p_fAnalytics = &self->fAnalytics;
    sub_1000A699C((uint64_t)v5, "lastRequestTime", &p_fAnalytics->lastRequestTime);
    sub_1004D0870((uint64_t)v5, "numSwitchToAgressiveScan", &p_fAnalytics->numSwitchToAggressiveScan);
    sub_1004D0870((uint64_t)v5, "count_submission", p_fAnalytics);
  }
  else
  {
    [(CLAvengerScanner *)self persistAnalyticsCache];
  }
  sub_10013F3C4(v5);
}

- (void)persistAnalyticsCache
{
  sub_1000E9354(v5);
  self = (CLAvengerScanner *)((char *)self + 96);
  sub_10016332C((uint64_t)v5, "lastRequestTime", &self->_objectDiscoveryManager);
  sub_1004D2BC4((uint64_t)v5, "count_submission", (unsigned int *)self->CLIntersiloService_opaque);
  sub_1004D2BC4((uint64_t)v5, "numSwitchToAgressiveScan", (unsigned int *)&self->CLIntersiloService_opaque[4]);
  uint64_t v3 = sub_1000A6958();
  sub_1004D3878(v3, "AvengerScannerAnalyticsTimer", (uint64_t)v5);
  uint64_t v4 = sub_1000A6958();
  (*(void (**)(uint64_t))(*(void *)v4 + 944))(v4);
  sub_10013F3C4(v5);
}

- (void)resetAnalyticsCache
{
  *(void *)&self->fAnalytics.count_submission = 0;
  self->fAnalytics.lastRequestTime = CFAbsoluteTimeGetCurrent();

  [(CLAvengerScanner *)self persistAnalyticsCache];
}

- (void)initAnalyticsTimer
{
  uint64_t v3 = (CLTimer *)[objc_msgSend(-[CLAvengerScanner universe](self, "universe"), "silo") newTimer];
  self->fAnalyticsTimer = v3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_100F5B8F4;
  v6[3] = &unk_10229FED8;
  v6[4] = self;
  [(CLTimer *)v3 setHandler:v6];
  double v4 = CFAbsoluteTimeGetCurrent() - self->fAnalytics.lastRequestTime;
  if (v4 >= 86400.0) {
    double v5 = 86400.0;
  }
  else {
    double v5 = 86400.0 - v4;
  }
  -[CLTimer setNextFireDelay:interval:](self->fAnalyticsTimer, "setNextFireDelay:interval:", v5);
}

- (void)scanTypeUpdated:(int64_t)a3
{
  if (self->_state == 3)
  {
    self->_int64_t state = 2;
    [(CLAvengerScanner *)self start];
  }
  else
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1023062B0);
    }
    uint64_t v3 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_ERROR))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#CLAvengerScanner: attempted to update scan but not yet scanning\"}", (uint8_t *)&v5, 0x12u);
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_1023062B0);
      }
    }
    double v4 = qword_102419568;
    if (os_signpost_enabled((os_log_t)qword_102419568))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      uint64_t v8 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#CLAvengerScanner: attempted to update scan but not yet scanning", "{\"msg%{public}.0s\":\"#CLAvengerScanner: attempted to update scan but not yet scanning\"}", (uint8_t *)&v5, 0x12u);
    }
  }
}

- (void)startedAggressiveDiscoveryScan
{
  if ((id)[(CLAvengerScannerStateContext *)self->_stateContext currentWPState] == (id)3)
  {
    ++self->fAnalytics.numSwitchToAggressiveScan;
    [(CLAvengerScanner *)self persistAnalyticsCache];
    [(CLAvengerScanner *)self notifyClientsAggressiveScanStarted];
  }
}

- (void)stoppedAggressiveDiscoveryScan
{
  if ((id)[(CLAvengerScannerStateContext *)self->_stateContext currentWPState] == (id)3)
  {
    [(CLAvengerScanner *)self notifyClientsAggressiveScanEnded];
  }
}

- (int64_t)getCLAvengerScannerPolicyPlatformType
{
  if (sub_10016CCBC() & 1) != 0 || (sub_1001B7C64()) {
    return 1;
  }
  if (sub_10010145C()) {
    return 2;
  }
  if (sub_1000F08D4()) {
    return 3;
  }
  return 0;
}

- (void)systemCoexImpact:(id)a3 toState:(int)a4
{
  uint64_t v5 = (a4 >> 1) & 1;
  uint64_t v6 = a4 & 1;
  [(CLAvengerScannerPolicy *)self->_policy setAssociatedTo2GHzWiFi:(a4 >> 2) & 1];
  [(CLAvengerScannerPolicy *)self->_policy setWifi2GHzCriticalState:v5];
  policy = self->_policy;

  [(CLAvengerScannerPolicy *)policy setBluetoothAudioActive:v6];
}

- (id).cxx_construct
{
  *(void *)&self->fAnalytics.count_submission = 0;
  self->fAnalytics.lastRequestTime = CFAbsoluteTimeGetCurrent();
  return self;
}

@end