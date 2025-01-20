@interface CLTrackingAvoidanceBOMScanManager
- (BOOL)checkDailyResetEligible:(id)a3;
- (CLAvengerScannerClient)controller;
- (CLTrackingAvoidanceBOMScanManager)initWithQueue:(id)a3 andController:(id)a4;
- (OS_dispatch_queue)queue;
- (double)computeBOMScanBackoffOfDate:(id)a3;
- (double)coolDownScan;
- (id)initAndStartWithQueue:(id)a3 andController:(id)a4;
- (id)timestampOfLastBOMDailyLimitResetDate;
- (id)timestampOfLastBeepOnMoveScanDate;
- (unsigned)dailyStartingValue;
- (unsigned)remainingBOMScans;
- (void)dispatchEnableBomScanAfterBackoff;
- (void)enableBOMScan;
- (void)handleRegisterWithController:(id)a3;
- (void)handleUnRegisterController;
- (void)resetBOMScanIfNeeded;
- (void)scanCompleted;
- (void)scheduleDailyResetBOMScan;
- (void)setController:(id)a3;
- (void)setRemainingBOMScansTo:(unsigned int)a3;
- (void)setTimeStampLastBeepOnMoveScan:(double)a3;
- (void)setTimestampLastBOMDailyLimitResetDate:(double)a3;
- (void)submitBOMMetricsBoot;
- (void)submitBOMMetricsScansCompleted:(unint64_t)a3 andTimeSinceLastDisable:(double)a4;
@end

@implementation CLTrackingAvoidanceBOMScanManager

- (CLTrackingAvoidanceBOMScanManager)initWithQueue:(id)a3 andController:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)CLTrackingAvoidanceBOMScanManager;
  v6 = [(CLTrackingAvoidanceBOMScanManager *)&v15 init];
  v7 = v6;
  if (v6)
  {
    v6->_queue = (OS_dispatch_queue *)a3;
    v6->_controller = (CLAvengerScannerClient *)a4;
    sub_1000C7F88(buf);
    double v16 = 0.0;
    int v8 = sub_1000A699C(*(uint64_t *)buf, "TrackingAvoidanceCooldownTimeForBOMScan", &v16);
    double v9 = v16;
    if (!v8) {
      double v9 = 960.0;
    }
    v7->_double coolDownScan = v9;
    if (*(void *)v18) {
      sub_1000DB0A0(*(std::__shared_weak_count **)v18);
    }
    v7->_dailyStartingValue = 5;
    sub_1000C7F88(buf);
    int v10 = sub_1004D0870(*(uint64_t *)buf, "TrackingAvoidanceRemainingBOMScansStartingValue", &v7->_dailyStartingValue);
    if (*(void *)v18) {
      sub_1000DB0A0(*(std::__shared_weak_count **)v18);
    }
    if (v10) {
      [(CLTrackingAvoidanceBOMScanManager *)v7 setRemainingBOMScansTo:v7->_dailyStartingValue];
    }
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_1022B2158);
    }
    v11 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_INFO))
    {
      double coolDownScan = v7->_coolDownScan;
      unsigned int v13 = [(CLTrackingAvoidanceBOMScanManager *)v7 remainingBOMScans];
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v18 = 2082;
      *(void *)&v18[2] = "";
      __int16 v19 = 2050;
      unint64_t v20 = (unint64_t)coolDownScan;
      __int16 v21 = 2050;
      uint64_t v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM scan manager init \", \"coolDownScan\":%{public}lu, \"remainingBOMScans\":%{public}lu}", buf, 0x26u);
    }
    [(CLTrackingAvoidanceBOMScanManager *)v7 submitBOMMetricsBoot];
  }
  return v7;
}

- (id)initAndStartWithQueue:(id)a3 andController:(id)a4
{
  v4 = [(CLTrackingAvoidanceBOMScanManager *)self initWithQueue:a3 andController:a4];
  v5 = v4;
  if (v4)
  {
    [(CLTrackingAvoidanceBOMScanManager *)v4 resetBOMScanIfNeeded];
    [(CLTrackingAvoidanceBOMScanManager *)v5 scheduleDailyResetBOMScan];
    [(CLTrackingAvoidanceBOMScanManager *)v5 dispatchEnableBomScanAfterBackoff];
  }
  return v5;
}

- (void)setTimeStampLastBeepOnMoveScan:(double)a3
{
  double v6 = a3;
  uint64_t v3 = sub_1000A6958();
  sub_10016332C(v3, "TrackingAvoidanceLastBeepOnMoveScanDate", &v6);
  uint64_t v4 = *(void *)sub_1000A6958();
  (*(void (**)(void))(v4 + 944))();
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_1022B2158);
  }
  v5 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289283;
    int v8 = 0;
    __int16 v9 = 2082;
    int v10 = "";
    __int16 v11 = 2049;
    unint64_t v12 = (unint64_t)v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM setting last BOM timestamp\", \"time\":%{private}lu}", buf, 0x1Cu);
  }
}

- (id)timestampOfLastBeepOnMoveScanDate
{
  double v6 = 0.0;
  uint64_t v3 = sub_1000A6958();
  if ((sub_1000A699C(v3, "TrackingAvoidanceLastBeepOnMoveScanDate", &v6) & 1) == 0)
  {
    double v6 = 0.0;
    [(CLTrackingAvoidanceBOMScanManager *)self setTimeStampLastBeepOnMoveScan:0.0];
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_1022B2158);
    }
    uint64_t v4 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289283;
      int v8 = 0;
      __int16 v9 = 2082;
      int v10 = "";
      __int16 v11 = 2049;
      unint64_t v12 = (unint64_t)v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM setting default value\", \"timestampOfLastBeepOnMoveScanDate\":%{private}lu}", buf, 0x1Cu);
    }
  }
  return +[NSDate dateWithTimeIntervalSince1970:v6];
}

- (void)setTimestampLastBOMDailyLimitResetDate:(double)a3
{
  double v6 = a3;
  uint64_t v3 = sub_1000A6958();
  sub_10016332C(v3, "TrackingAvoidanceLastBOMDailyLimitReset", &v6);
  uint64_t v4 = *(void *)sub_1000A6958();
  (*(void (**)(void))(v4 + 944))();
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_1022B2158);
  }
  v5 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289283;
    int v8 = 0;
    __int16 v9 = 2082;
    int v10 = "";
    __int16 v11 = 2049;
    unint64_t v12 = (unint64_t)v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM setting last BOM daily limit reset timestamp\", \"time\":%{private}lu}", buf, 0x1Cu);
  }
}

- (id)timestampOfLastBOMDailyLimitResetDate
{
  double v6 = 0.0;
  uint64_t v3 = sub_1000A6958();
  if ((sub_1000A699C(v3, "TrackingAvoidanceLastBOMDailyLimitReset", &v6) & 1) == 0)
  {
    double v6 = 0.0;
    [(CLTrackingAvoidanceBOMScanManager *)self setTimestampLastBOMDailyLimitResetDate:0.0];
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_1022B2158);
    }
    uint64_t v4 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289283;
      int v8 = 0;
      __int16 v9 = 2082;
      int v10 = "";
      __int16 v11 = 2049;
      unint64_t v12 = (unint64_t)v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM setting default value\", \"lastBOMDailyLimitResetKey\":%{private}lu}", buf, 0x1Cu);
    }
  }
  return +[NSDate dateWithTimeIntervalSince1970:v6];
}

- (void)setRemainingBOMScansTo:(unsigned int)a3
{
  unsigned int v6 = a3;
  uint64_t v3 = sub_1000A6958();
  sub_1004D2BC4(v3, "TrackingAvoidanceRemainingBOMScans", &v6);
  uint64_t v4 = *(void *)sub_1000A6958();
  (*(void (**)(void))(v4 + 944))();
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_1022B2158);
  }
  v5 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289283;
    int v8 = 0;
    __int16 v9 = 2082;
    int v10 = "";
    __int16 v11 = 2049;
    uint64_t v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM setting scans reaming\", \"remainingBOMScans\":%{private}lu}", buf, 0x1Cu);
  }
}

- (unsigned)remainingBOMScans
{
  unsigned int v6 = 0;
  uint64_t v3 = sub_1000A6958();
  if ((sub_1004D0870(v3, "TrackingAvoidanceRemainingBOMScans", &v6) & 1) == 0)
  {
    [(CLTrackingAvoidanceBOMScanManager *)self setRemainingBOMScansTo:5];
    unsigned int v6 = 5;
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_1022B2158);
    }
    uint64_t v4 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289283;
      int v8 = 0;
      __int16 v9 = 2082;
      int v10 = "";
      __int16 v11 = 2049;
      uint64_t v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM setting default value\", \"remainingBOMScans\":%{private}lu}", buf, 0x1Cu);
    }
  }
  return v6;
}

- (void)handleRegisterWithController:(id)a3
{
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_1022B2158);
  }
  v5 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_INFO))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    int v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM register\"}", (uint8_t *)v6, 0x12u);
  }
  [(CLTrackingAvoidanceBOMScanManager *)self setController:a3];
  [(CLTrackingAvoidanceBOMScanManager *)self dispatchEnableBomScanAfterBackoff];
}

- (void)handleUnRegisterController
{
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_1022B2158);
  }
  uint64_t v3 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_INFO))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    unsigned int v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM unregister\"}", (uint8_t *)v4, 0x12u);
  }
  [(CLTrackingAvoidanceBOMScanManager *)self setController:0];
}

- (void)enableBOMScan
{
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_1022B2158);
  }
  uint64_t v3 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_INFO))
  {
    int v6 = 68289539;
    int v7 = 0;
    __int16 v8 = 2082;
    __int16 v9 = "";
    __int16 v10 = 2049;
    uint64_t v11 = [(CLTrackingAvoidanceBOMScanManager *)self remainingBOMScans];
    __int16 v12 = 2113;
    id v13 = [(CLTrackingAvoidanceBOMScanManager *)self timestampOfLastBeepOnMoveScanDate];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM scans\", \"count\":%{private}lu, \"LastBOMScan\":%{private, location:escape_only}@}", (uint8_t *)&v6, 0x26u);
  }
  if ([(CLTrackingAvoidanceBOMScanManager *)self remainingBOMScans]
    && [(CLTrackingAvoidanceBOMScanManager *)self controller])
  {
    unsigned int v4 = [(CLAvengerScannerClient *)self->_controller performNotOptedInBOMScan];
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_1022B2158);
    }
    __int16 v5 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_INFO))
    {
      int v6 = 68289283;
      int v7 = 0;
      __int16 v8 = 2082;
      __int16 v9 = "";
      __int16 v10 = 2049;
      uint64_t v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM scan completed\", \"completed\":%{private}lu}", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (double)computeBOMScanBackoffOfDate:(id)a3
{
  [a3 timeIntervalSinceDate:-[CLTrackingAvoidanceBOMScanManager timestampOfLastBeepOnMoveScanDate](self, "timestampOfLastBeepOnMoveScanDate")];
  double coolDownScan = self->_coolDownScan;
  BOOL v6 = v4 >= coolDownScan || v4 < 0.0;
  double result = coolDownScan - v4;
  if (v6) {
    return 0.0;
  }
  return result;
}

- (void)dispatchEnableBomScanAfterBackoff
{
  objc_initWeak(&location, self);
  [(CLTrackingAvoidanceBOMScanManager *)self computeBOMScanBackoffOfDate:+[NSDate now]];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_100421870;
  v6[3] = &unk_1022B20F8;
  objc_copyWeak(&v7, &location);
  dispatch_after(v4, queue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)scanCompleted
{
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_1022B2158);
  }
  double v3 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_INFO))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    BOOL v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM scan completed \"}", (uint8_t *)v4, 0x12u);
  }
  [(CLTrackingAvoidanceBOMScanManager *)self setRemainingBOMScansTo:[(CLTrackingAvoidanceBOMScanManager *)self remainingBOMScans] - 1];
  [+[NSDate now] timeIntervalSinceDate:[(CLTrackingAvoidanceBOMScanManager *)self timestampOfLastBeepOnMoveScanDate]];
  -[CLTrackingAvoidanceBOMScanManager submitBOMMetricsScansCompleted:andTimeSinceLastDisable:](self, "submitBOMMetricsScansCompleted:andTimeSinceLastDisable:", 1);
  [+[NSDate now] timeIntervalSince1970];
  -[CLTrackingAvoidanceBOMScanManager setTimeStampLastBeepOnMoveScan:](self, "setTimeStampLastBeepOnMoveScan:");
  [(CLTrackingAvoidanceBOMScanManager *)self dispatchEnableBomScanAfterBackoff];
}

- (void)submitBOMMetricsBoot
{
}

- (void)submitBOMMetricsScansCompleted:(unint64_t)a3 andTimeSinceLastDisable:(double)a4
{
  if (a4 > 86400.0 || a4 < 0.0) {
    double v6 = -1.0;
  }
  else {
    double v6 = a4;
  }
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_1022B2158);
  }
  id v7 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289538;
    int v9 = 0;
    __int16 v10 = 2082;
    uint64_t v11 = "";
    __int16 v12 = 2050;
    unint64_t v13 = (unint64_t)v6;
    __int16 v14 = 2050;
    unint64_t v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM metrics \", \"timeSinceLastDisable\":%{public}lu, \"scanCount\":%{public}lu}", buf, 0x26u);
  }
  AnalyticsSendEventLazy();
}

- (void)resetBOMScanIfNeeded
{
  if ([(CLTrackingAvoidanceBOMScanManager *)self checkDailyResetEligible:+[NSDate now]])
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_1022B2158);
    }
    double v3 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_INFO))
    {
      v4[0] = 68289026;
      v4[1] = 0;
      __int16 v5 = 2082;
      double v6 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM reset \"}", (uint8_t *)v4, 0x12u);
    }
    [(CLTrackingAvoidanceBOMScanManager *)self setRemainingBOMScansTo:self->_dailyStartingValue];
    [+[NSDate now] timeIntervalSince1970];
    -[CLTrackingAvoidanceBOMScanManager setTimestampLastBOMDailyLimitResetDate:](self, "setTimestampLastBOMDailyLimitResetDate:");
    [(CLTrackingAvoidanceBOMScanManager *)self dispatchEnableBomScanAfterBackoff];
  }
}

- (BOOL)checkDailyResetEligible:(id)a3
{
  [a3 timeIntervalSinceDate:-[CLTrackingAvoidanceBOMScanManager timestampOfLastBOMDailyLimitResetDate](self, "timestampOfLastBOMDailyLimitResetDate")];
  double v4 = v3;
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_1022B2158);
  }
  __int16 v5 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_INFO))
  {
    v7[0] = 68289282;
    v7[1] = 0;
    __int16 v8 = 2082;
    int v9 = "";
    __int16 v10 = 2050;
    unint64_t v11 = (unint64_t)v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM checking daily reset \", \"timeSinceLastDailyReset\":%{public}lu}", (uint8_t *)v7, 0x1Cu);
  }
  return v4 < -86400.0 || v4 > 86400.0;
}

- (void)scheduleDailyResetBOMScan
{
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_1022B2158);
  }
  double v3 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_INFO))
  {
    id buf = (id)68289282;
    __int16 v9 = 2082;
    __int16 v10 = "";
    __int16 v11 = 2050;
    uint64_t v12 = 3600;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#ut BOM schedule daily reset check\", \"timeUntilNextReset\":%{public}lu}", (uint8_t *)&buf, 0x1Cu);
  }
  objc_initWeak(&buf, self);
  dispatch_time_t v4 = dispatch_time(0, 3600000000000);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100421FF8;
  block[3] = &unk_1022B20F8;
  objc_copyWeak(&v7, &buf);
  dispatch_after(v4, queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&buf);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (CLAvengerScannerClient)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  self->_controller = (CLAvengerScannerClient *)a3;
}

- (double)coolDownScan
{
  return self->_coolDownScan;
}

- (unsigned)dailyStartingValue
{
  return self->_dailyStartingValue;
}

@end