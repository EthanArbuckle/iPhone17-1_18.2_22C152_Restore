@interface CLAvengerObservationReporterService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLAvengerObservationReporterService)init;
- (id).cxx_construct;
- (id)clientIdentifier;
- (id)onAppMonitorNotification:(int)a3 data:(uint64_t)a4;
- (int64_t)determineStateWithContext:(CLAvengerObservationReporterServiceStateContext)a3;
- (void)beginService;
- (void)endService;
- (void)onAvengerAdvertisement:(id)a3 reconciledInformation:(id)a4;
- (void)registerForAppMonitorNotification;
- (void)registerForAvengerScanner;
- (void)unregisterForAppMonitorNotification;
- (void)unregisterForAvengerScanner;
- (void)updateContext:(CLAvengerObservationReporterServiceStateContext)a3;
@end

@implementation CLAvengerObservationReporterService

- (void)onAvengerAdvertisement:(id)a3 reconciledInformation:(id)a4
{
  if (_os_feature_enabled_impl() && ([a3 isApple] & 1) == 0)
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1022FEF08);
    }
    v16 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      int v26 = 0;
      __int16 v27 = 2082;
      v28 = "";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLAvengerObservationReporterService onAvengerAdvertisementDetected: dropping non-Apple advertisement\"}", buf, 0x12u);
    }
  }
  else if (a4 && [a4 type])
  {
    v22 = self;
    unsigned int v7 = +[SPAdvertisement instancesRespondToSelector:NSSelectorFromString(@"initWithAddress:advertisementData:status:reserved:rssi:scanDate:isPosh:")];
    id v8 = objc_alloc((Class)SPAdvertisement);
    id v9 = [a3 address];
    id v10 = [a3 advertisementData];
    id v11 = [a3 status];
    id v12 = [a3 reserved];
    id v13 = [a3 rssi];
    id v14 = [a3 scanDate];
    if (v7)
    {
      LOBYTE(v21) = [a3 isPosh];
      id v15 = [v8 initWithAddress:v9 advertisementData:v10 status:v11 reserved:v12 rssi:v13 scanDate:v14 isPosh:v21];
    }
    else
    {
      id v15 = [v8 initWithAddress:v9 advertisementData:v10 status:v11 reserved:v12 rssi:v13 scanDate:v14];
    }
    id v17 = [objc_alloc((Class)SPBeaconPayload) initWithAdvertisement:v15 location:0];
    [v17 setObservationValue:0];
    unsigned int v18 = [(CLAvengerBeaconPayloadDedupingCache *)v22->_beaconPayloadCache isNewPayload:v17];
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1022FEF08);
    }
    v19 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68290051;
      __int16 v27 = 2082;
      int v26 = 0;
      v28 = "";
      __int16 v29 = 2113;
      id v30 = [a3 address];
      __int16 v31 = 2113;
      id v32 = [a3 advertisementData];
      __int16 v33 = 2113;
      id v34 = [a4 uuid];
      __int16 v35 = 1025;
      unsigned int v36 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLAvengerObservationReporterService onAvengerAdvertisementDetected: saveBeaconPayloads\", \"address\":%{private, location:escape_only}@, \"advertisementData\":%{private, location:escape_only}@, \"UUID\":%{private, location:escape_only}@, \"validity\":%{private}hhd}", buf, 0x36u);
    }
    if (v18)
    {
      id v20 = [(SPFinderInterface *)v22->_spFinderInterface beaconPayloadCache];
      id v24 = v17;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100E89290;
      v23[3] = &unk_1022B8750;
      v23[4] = v22;
      [v20 saveBeaconPayloads:[+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1) completion:v23];
    }
  }
}

- (id)onAppMonitorNotification:(int)a3 data:(uint64_t)a4
{
  unsigned int v4 = a3;
  unsigned int v20 = a3;
  uint64_t v5 = *(unsigned __int8 *)(a4 + 31);
  if ((v5 & 0x80u) == 0) {
    uint64_t v6 = *(unsigned __int8 *)(a4 + 31);
  }
  else {
    uint64_t v6 = *(void *)(a4 + 16);
  }
  uint64_t v7 = qword_102481FB8;
  if (byte_102481FC7 >= 0) {
    uint64_t v7 = byte_102481FC7;
  }
  if (v6 != v7) {
    return result;
  }
  id v9 = (unsigned __int8 *)result;
  id v10 = (const void **)(a4 + 8);
  if (byte_102481FC7 >= 0) {
    id v11 = &qword_102481FB0;
  }
  else {
    id v11 = (uint64_t *)qword_102481FB0;
  }
  if ((v5 & 0x80) != 0)
  {
    result = (id)memcmp(*v10, v11, *(void *)(a4 + 16));
    if (result) {
      return result;
    }
    goto LABEL_17;
  }
  if (!*(unsigned char *)(a4 + 31))
  {
LABEL_17:
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1022FEF08);
    }
    id v13 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
    {
      id v14 = sub_1000A7F94((int *)&v20);
      if (*(char *)(a4 + 31) < 0) {
        id v10 = (const void **)*v10;
      }
      *(_DWORD *)buf = 68289539;
      int v22 = 0;
      __int16 v23 = 2082;
      id v24 = "";
      __int16 v25 = 2081;
      int v26 = v14;
      __int16 v27 = 2081;
      v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLAvengerObservationReporterService onAppMonitorNotification\", \"notification\":%{private, location:escape_only}s, \"bundleId\":%{private, location:escape_only}s}", buf, 0x26u);
      unsigned int v4 = v20;
    }
    unsigned int v15 = v9[8];
    if (v4 <= 0xC)
    {
      if (((1 << v4) & 0x1DA1) != 0)
      {
        if (qword_102419560 != -1) {
          dispatch_once(&qword_102419560, &stru_1022FEF08);
        }
        v16 = qword_102419568;
        if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_ERROR))
        {
          id v17 = sub_1000A7F94((int *)&v20);
          *(_DWORD *)buf = 68289283;
          int v22 = 0;
          __int16 v23 = 2082;
          id v24 = "";
          __int16 v25 = 2081;
          int v26 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#CLAvengerObservationReporterService WARN, Received expected CLAppMonitor notification type for camera bundle ID\", \"notification\":%{private, location:escape_only}s}", buf, 0x1Cu);
          if (qword_102419560 != -1) {
            dispatch_once(&qword_102419560, &stru_1022FEF08);
          }
        }
        unsigned int v18 = qword_102419568;
        if (os_signpost_enabled((os_log_t)qword_102419568))
        {
          v19 = sub_1000A7F94((int *)&v20);
          *(_DWORD *)buf = 68289283;
          int v22 = 0;
          __int16 v23 = 2082;
          id v24 = "";
          __int16 v25 = 2081;
          int v26 = v19;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#CLAvengerObservationReporterService WARN, Received expected CLAppMonitor notification type for camera bundle ID", "{\"msg%{public}.0s\":\"#CLAvengerObservationReporterService WARN, Received expected CLAppMonitor notification type for camera bundle ID\", \"notification\":%{private, location:escape_only}s}", buf, 0x1Cu);
        }
      }
      else
      {
        unsigned int v15 = ((1 << v4) & 0x258) != 0;
      }
    }
    return [v9 updateContext:v15];
  }
  id v12 = (unsigned __int8 *)(a4 + 8);
  while (*v12 == *(unsigned __int8 *)v11)
  {
    ++v12;
    id v11 = (uint64_t *)((char *)v11 + 1);
    if (!--v5) {
      goto LABEL_17;
    }
  }
  return result;
}

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
  if (qword_102481FD0 != -1) {
    dispatch_once(&qword_102481FD0, &stru_1022FEEC8);
  }
  return (id)qword_102481FC8;
}

+ (BOOL)isSupported
{
  if (objc_opt_class())
  {
    if (_os_feature_enabled_impl()) {
      LOBYTE(v2) = 1;
    }
    else {
      LOBYTE(v2) = +[CLAvengerScanner isSupported];
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_1022FEEE8);
    }
    v3 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLAvengerObservationReporterService: not supported on this platform because SPFinder.framework is not present", buf, 2u);
    }
    BOOL v2 = sub_10013D1A0(115, 2);
    if (v2)
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_1022FEEE8);
      }
      unsigned int v4 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "+[CLAvengerObservationReporterService isSupported]", "%s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
      LOBYTE(v2) = 0;
    }
  }
  byte_102481FD8 = v2;
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1022FEF08);
  }
  unint64_t v5 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v8 = 0;
    __int16 v9 = 2082;
    id v10 = "";
    __int16 v11 = 1026;
    int v12 = byte_102481FD8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLAvengerObservationReporterService isSupported\", \"supported\":%{public}hhd}", buf, 0x18u);
  }
  return byte_102481FD8;
}

- (CLAvengerObservationReporterService)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLAvengerObservationReporterService;
  return [(CLAvengerObservationReporterService *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLAvengerObservationReporterServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLAvengerObservationReporterClientProtocol];
}

- (void)beginService
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1022FEF08);
  }
  objc_super v3 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    uint64_t v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLAvengerObservationReporterService beginService\"}", (uint8_t *)v4, 0x12u);
  }
  self->_spFinderInterface = (SPFinderInterface *)objc_alloc_init((Class)SPFinderInterface);
  self->_beaconPayloadCache = objc_alloc_init(CLAvengerBeaconPayloadDedupingCache);
  [(CLAvengerObservationReporterService *)self registerForAppMonitorNotification];
  self->_currentState = 0;
  [(CLAvengerObservationReporterService *)self updateContext:self->_currentContext.cameraForegrounded];
}

- (void)endService
{
  [(CLAvengerObservationReporterService *)self unregisterForAppMonitorNotification];
  [(CLAvengerObservationReporterService *)self unregisterForAvengerScanner];

  beaconPayloadCache = self->_beaconPayloadCache;
}

- (void)updateContext:(CLAvengerObservationReporterServiceStateContext)a3
{
  self->_currentContext = a3;
  int64_t v4 = [(CLAvengerObservationReporterService *)self determineStateWithContext:a3.cameraForegrounded];
  if (v4 != self->_currentState)
  {
    self->_int64_t currentState = v4;
    if (v4)
    {
      if (v4 == 1) {
        [(CLAvengerObservationReporterService *)self registerForAvengerScanner];
      }
    }
    else
    {
      [(CLAvengerObservationReporterService *)self unregisterForAvengerScanner];
    }
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1022FEF08);
    }
    __int16 v5 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
    {
      int64_t currentState = self->_currentState;
      BOOL cameraForegrounded = self->_currentContext.cameraForegrounded;
      v8[0] = 68289538;
      v8[1] = 0;
      __int16 v9 = 2082;
      id v10 = "";
      __int16 v11 = 1026;
      int v12 = currentState;
      __int16 v13 = 1026;
      BOOL v14 = cameraForegrounded;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLAvengerObservationReporterService changed state\", \"_currentState\":%{public}d, \"_currentContext.cameraForegrounded\":%{public}hhd}", (uint8_t *)v8, 0x1Eu);
    }
  }
}

- (int64_t)determineStateWithContext:(CLAvengerObservationReporterServiceStateContext)a3
{
  return ~*(_DWORD *)&a3.cameraForegrounded & 1;
}

- (id)clientIdentifier
{
  return @"CLAvengerObservationReporterService";
}

- (void)registerForAvengerScanner
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1022FEF08);
  }
  objc_super v3 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    uint64_t v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLAvengerObservationReporterService received avenger scanner registration\"}", (uint8_t *)v5, 0x12u);
  }
  if (_os_feature_enabled_impl())
  {
    if (!self->_scannerClient) {
      self->_scannerClient = [[CLAvengerScannerClient alloc] initWithDelegate:self queue:[objc_msgSend(-[CLAvengerObservationReporterService universe](self, "universe"), "silo") queue] optedIn:0];
    }
  }
  else if (!self->_avengerScannerProxy)
  {
    int64_t v4 = (CLAvengerScannerServiceProtocol *)[[-[CLAvengerObservationReporterService universe](self, "universe") vendor] proxyForService:@"CLAvengerScanner"];
    self->_avengerScannerProxy = v4;
    [(CLAvengerScannerServiceProtocol *)v4 registerDelegate:self inSilo:[(CLAvengerObservationReporterService *)self silo]];
    [(CLAvengerScannerServiceProtocol *)self->_avengerScannerProxy setDelegateEntityName:"CLAvengerObservationReporterService"];
    [(CLAvengerScannerServiceProtocol *)self->_avengerScannerProxy startMonitoringAvengerAdvertisementsForClient:CLISP_ME_TOKEN clientName:@"CLAvengerObservationReporterService"];
  }
}

- (void)unregisterForAvengerScanner
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1022FEF08);
  }
  objc_super v3 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    uint64_t v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLAvengerObservationReporterService received avenger scanner unregistration\"}", (uint8_t *)v5, 0x12u);
  }
  if (_os_feature_enabled_impl())
  {
    p_scannerClient = (id *)&self->_scannerClient;
  }
  else
  {
    p_scannerClient = (id *)&self->_avengerScannerProxy;
    if (!*p_scannerClient) {
      return;
    }
    [*p_scannerClient stopMonitoringAvengerAdvertisementsForClient:CLISP_ME_TOKEN];
  }

  id *p_scannerClient = 0;
}

- (void)registerForAppMonitorNotification
{
  value = self->_appMonitorClient.__ptr_.__value_;
  if (!value)
  {
    [(CLAvengerObservationReporterService *)self universe];
    sub_10120A518();
  }
  [*((id *)value + 2) register:*((void *)value + 1) forNotification:4 registrationInfo:0];
  [*((id *)self->_appMonitorClient.__ptr_.__value_ + 2) register:*((void *)self->_appMonitorClient.__ptr_.__value_ + 1) forNotification:3 registrationInfo:0];
  [*((id *)self->_appMonitorClient.__ptr_.__value_ + 2) register:*((void *)self->_appMonitorClient.__ptr_.__value_ + 1) forNotification:2 registrationInfo:0];
  [*((id *)self->_appMonitorClient.__ptr_.__value_ + 2) register:*((void *)self->_appMonitorClient.__ptr_.__value_ + 1) forNotification:1 registrationInfo:0];
}

- (void)unregisterForAppMonitorNotification
{
  value = self->_appMonitorClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:4];
    [*((id *)self->_appMonitorClient.__ptr_.__value_ + 2) unregister:*((void *)self->_appMonitorClient.__ptr_.__value_ + 1) forNotification:3];
    [*((id *)self->_appMonitorClient.__ptr_.__value_ + 2) unregister:*((void *)self->_appMonitorClient.__ptr_.__value_ + 1) forNotification:2];
    [*((id *)self->_appMonitorClient.__ptr_.__value_ + 2) unregister:*((void *)self->_appMonitorClient.__ptr_.__value_ + 1) forNotification:1];
    int64_t v4 = self->_appMonitorClient.__ptr_.__value_;
    self->_appMonitorClient.__ptr_.__value_ = 0;
    if (v4)
    {
      __int16 v5 = *(void (**)(void))(*(void *)v4 + 8);
      v5();
    }
  }
}

- (void).cxx_destruct
{
  value = self->_appMonitorClient.__ptr_.__value_;
  self->_appMonitorClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end