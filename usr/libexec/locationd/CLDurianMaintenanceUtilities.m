@interface CLDurianMaintenanceUtilities
- (BOOL)isIphone;
- (BOOL)isPowerAssertionAsserted;
- (BOOL)isTimerOn;
- (BOOL)isTinkerWatch;
- (BOOL)isWatch;
- (CLDurianMaintenanceUtilities)init;
- (CLDurianMaintenanceUtilities)initWithQueue:(id)a3;
- (CLDurianMaintenanceUtilitiesDelegate)delegate;
- (double)getMaintenanceAssertionDuration;
- (double)interval;
- (double)intervalOverride;
- (void)clearTimer;
- (void)onTimer:(id)a3;
- (void)releaseMaintenancePowerAssertion:(id)a3;
- (void)releaseMaintenancePowerAssertionWithId:(int)a3;
- (void)restartTimer;
- (void)setDelegate:(id)a3;
- (void)setIntervalOverride:(double)a3;
- (void)startTimer:(BOOL)a3;
- (void)stopTimer;
- (void)takeMaintenancePowerAssertion;
@end

@implementation CLDurianMaintenanceUtilities

- (CLDurianMaintenanceUtilities)init
{
  return 0;
}

- (CLDurianMaintenanceUtilities)initWithQueue:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLDurianMaintenanceUtilities;
  v4 = [(CLDurianMaintenanceUtilities *)&v6 init];
  if (v4)
  {
    v4->_queue = (OS_dispatch_queue *)a3;
    v4->_powerAssertion = 0;
  }
  return v4;
}

- (void)startTimer:(BOOL)a3
{
  if (self->_timer) {
    [(CLDurianMaintenanceUtilities *)self clearTimer];
  }
  self->_isHeleOnly = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332000);
  }
  v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    __int16 v13 = 1026;
    int v14 = 5;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint timer setup\", \"holdoff\":%{public}d}", buf, 0x18u);
  }
  [(CLDurianMaintenanceUtilities *)self restartTimer];
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1015F49EC;
  block[3] = &unk_10229FED8;
  block[4] = self;
  dispatch_after(v6, queue, block);
}

- (void)stopTimer
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332000);
  }
  v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = self->_timer != 0;
    v5[0] = 68289282;
    v5[1] = 0;
    __int16 v6 = 2082;
    v7 = "";
    __int16 v8 = 1026;
    BOOL v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint timer stop\", \"valid\":%{public}hhd}", (uint8_t *)v5, 0x18u);
  }
  [(CLDurianMaintenanceUtilities *)self clearTimer];
}

- (void)restartTimer
{
  [(CLDurianMaintenanceUtilities *)self clearTimer];
  double intervalOverride = self->_intervalOverride;
  self->_int interval = intervalOverride;
  if (intervalOverride == 0.0) {
    *(void *)&self->_int interval = qword_101E31380[!self->_isHeleOnly];
  }
  BOOL v4 = (PCPersistentTimer *)[objc_alloc((Class)PCPersistentTimer) initWithTimeInterval:@"com.apple.locationd.durianPersistentConnectionMaintenance" serviceIdentifier:self target:"onTimer:" selector:0 userInfo:self->_interval];
  self->_timer = v4;
  [(PCPersistentTimer *)v4 setDisableSystemWaking:0];
  [(PCPersistentTimer *)self->_timer setMinimumEarlyFireProportion:0.9];
  [(PCPersistentTimer *)self->_timer setUserVisible:0];
  [(PCPersistentTimer *)self->_timer scheduleInQueue:self->_queue];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332000);
  }
  v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    int interval = (int)self->_interval;
    v7[0] = 68289794;
    v7[1] = 0;
    __int16 v8 = 2082;
    BOOL v9 = "";
    __int16 v10 = 1026;
    int v11 = interval;
    __int16 v12 = 1026;
    int v13 = 1;
    __int16 v14 = 1026;
    int v15 = 90;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint timer start\", \"interval\":%{public}d, \"waking\":%{public}hhd, \"earlyfire\":%{public}d}", (uint8_t *)v7, 0x24u);
  }
}

- (void)clearTimer
{
  timer = self->_timer;
  if (timer)
  {
    [(PCPersistentTimer *)timer invalidate];

    self->_timer = 0;
  }
}

- (void)onTimer:(id)a3
{
  delegate = self->_delegate;
  [a3 fireTime];
  double v7 = v6;
  [a3 startTime];
  [(CLDurianMaintenanceUtilitiesDelegate *)delegate maintenanceTimerFiredWithInterval:v7 - v8];

  [(CLDurianMaintenanceUtilities *)self restartTimer];
}

- (BOOL)isTimerOn
{
  return self->_timer != 0;
}

- (void)takeMaintenancePowerAssertion
{
  if (self->_isHeleOnly)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332000);
    }
    v2 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v12 = 0;
      __int16 v13 = 2082;
      __int16 v14 = "";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint assertion skip\"}", buf, 0x12u);
    }
  }
  else
  {
    if (self->_powerAssertion) {
      [(CLDurianMaintenanceUtilities *)self releaseMaintenancePowerAssertion:@"retake"];
    }
    int v4 = self->_assertId + 1;
    self->_int assertId = v4;
    dispatch_time_t v5 = dispatch_time(0, 28000000000);
    queue = self->_queue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1015F4FA0;
    v9[3] = &unk_1022B21E8;
    v9[4] = self;
    int v10 = v4;
    dispatch_after(v5, queue, v9);
    self->_assertTime = CFAbsoluteTimeGetCurrent();
    self->_assertDuration = -1.0;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332000);
    }
    double v7 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int assertId = self->_assertId;
      *(_DWORD *)buf = 68289538;
      int v12 = 0;
      __int16 v13 = 2082;
      __int16 v14 = "";
      __int16 v15 = 1026;
      int v16 = assertId;
      __int16 v17 = 1026;
      int v18 = 28;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint assertion take\", \"id\":%{public}d, \"duration\":%{public}d}", buf, 0x1Eu);
    }
    self->_powerAssertion = (void *)CPPowerAssertionCreate();
  }
}

- (void)releaseMaintenancePowerAssertion:(id)a3
{
  if (self->_powerAssertion)
  {
    self->_int assertDuration = CFAbsoluteTimeGetCurrent() - self->_assertTime;
    CFRelease(self->_powerAssertion);
    self->_powerAssertion = 0;
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332000);
    }
    uint64_t v5 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int assertDuration = (int)self->_assertDuration;
      int assertId = self->_assertId;
      int v13 = 68289795;
      int v14 = 0;
      __int16 v15 = 2082;
      int v16 = "";
      __int16 v17 = 1026;
      int v18 = assertId;
      __int16 v19 = 2113;
      id v20 = a3;
      __int16 v21 = 1026;
      int v22 = assertDuration;
      double v8 = "{\"msg%{public}.0s\":\"#durian #maint assertion release\", \"id\":%{public}d, \"reason\":%{private, location:"
           "escape_only}@, \"duration\":%{public}d}";
      BOOL v9 = v5;
      uint32_t v10 = 40;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
    }
  }
  else if (!self->_isHeleOnly)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332000);
    }
    uint64_t v11 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = self->_assertId;
      int v13 = 68289539;
      int v14 = 0;
      __int16 v15 = 2082;
      int v16 = "";
      __int16 v17 = 1026;
      int v18 = v12;
      __int16 v19 = 2113;
      id v20 = a3;
      double v8 = "{\"msg%{public}.0s\":\"#durian #maint assertion null\", \"id\":%{public}d, \"reason\":%{private, location:escape_only}@}";
      BOOL v9 = v11;
      uint32_t v10 = 34;
      goto LABEL_6;
    }
  }
}

- (void)releaseMaintenancePowerAssertionWithId:(int)a3
{
  if (self->_assertId == a3)
  {
    [(CLDurianMaintenanceUtilities *)self releaseMaintenancePowerAssertion:@"timeout"];
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332000);
    }
    uint64_t v5 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int assertId = self->_assertId;
      v7[0] = 68289538;
      v7[1] = 0;
      __int16 v8 = 2082;
      BOOL v9 = "";
      __int16 v10 = 1026;
      int v11 = assertId;
      __int16 v12 = 1026;
      int v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint assertion mismatch\", \"id\":%{public}d, \"input\":%{public}d}", (uint8_t *)v7, 0x1Eu);
    }
  }
}

- (BOOL)isPowerAssertionAsserted
{
  return self->_powerAssertion != 0;
}

- (double)getMaintenanceAssertionDuration
{
  return self->_assertDuration;
}

- (BOOL)isIphone
{
  return +[CLDurianPlatform isPhone];
}

- (BOOL)isWatch
{
  return +[CLDurianPlatform isWatch];
}

- (BOOL)isTinkerWatch
{
  return +[CLDurianPlatform isTinkerWatch];
}

- (CLDurianMaintenanceUtilitiesDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLDurianMaintenanceUtilitiesDelegate *)a3;
}

- (double)intervalOverride
{
  return self->_intervalOverride;
}

- (void)setIntervalOverride:(double)a3
{
  self->_double intervalOverride = a3;
}

- (double)interval
{
  return self->_interval;
}

@end