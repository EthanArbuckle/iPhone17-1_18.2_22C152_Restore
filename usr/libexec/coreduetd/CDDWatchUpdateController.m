@interface CDDWatchUpdateController
- (CDDWatchUpdateController)initWithCDDinstance:(id)a3;
- (NSArray)activeComplications;
- (id)formatDate:(id)a3;
- (id)nextResetTime;
- (id)watchUpdateLog;
- (int64_t)hoursBetween:(id)a3 and:(id)a4;
- (void)dailyResetTimer;
- (void)dealloc;
- (void)loadDefaults;
- (void)receiveWatchfaceInfo:(id)a3 device:(id)a4;
- (void)resetPushLimits;
- (void)setupNextResetTimer:(id)a3;
- (void)timeZoneOrTimeChanged:(id)a3;
@end

@implementation CDDWatchUpdateController

- (CDDWatchUpdateController)initWithCDDinstance:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CDDWatchUpdateController;
  v6 = [(CDDWatchUpdateController *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->cdd, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.watchUpdates", v8);
    watchupdateQueue = v7->watchupdateQueue;
    v7->watchupdateQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [(CDDWatchUpdateController *)v7 watchUpdateLog];
    log = v7->log;
    v7->log = (OS_os_log *)v11;

    timer = v7->timer;
    v7->timer = 0;

    [(CDDWatchUpdateController *)v7 loadDefaults];
    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v7 selector:"timeZoneOrTimeChanged:" name:NSSystemTimeZoneDidChangeNotification object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)sub_100002B20, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    if (!notify_register_dispatch("com.apple.coreduetd.watchischarging", &v7->watchchargetoken, (dispatch_queue_t)v7->watchupdateQueue, &stru_100038A30))
    {
      notify_set_state(v7->watchchargetoken, 0);
      notify_post("com.apple.coreduetd.watchischarging");
    }
  }

  return v7;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SignificantTimeChangeNotification", 0);
  notify_cancel(self->watchchargetoken);
  v5.receiver = self;
  v5.super_class = (Class)CDDWatchUpdateController;
  [(CDDWatchUpdateController *)&v5 dealloc];
}

- (id)watchUpdateLog
{
  if (qword_100040EA8 != -1) {
    dispatch_once(&qword_100040EA8, &stru_100038A50);
  }
  v2 = (void *)qword_100040EA0;

  return v2;
}

- (int64_t)hoursBetween:(id)a3 and:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[NSCalendar currentCalendar];
  v8 = [v7 components:32 fromDate:v6 toDate:v5 options:0];

  uint64_t v9 = (uint64_t)[v8 hour];
  if (v9 >= 0) {
    int64_t v10 = v9;
  }
  else {
    int64_t v10 = -v9;
  }

  return v10;
}

- (void)loadDefaults
{
  v3 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.coreduet.complications.pushLimits"];
  pushLimits = self->pushLimits;
  self->pushLimits = v3;

  id v5 = self->pushLimits;
  if (v5)
  {
    id v6 = [(NSUserDefaults *)v5 objectForKey:@"lastResetDate"];
    if (v6)
    {
      v7 = [(NSUserDefaults *)self->pushLimits dictionaryRepresentation];
      v8 = [(CDDWatchUpdateController *)self nextResetTime];
      log = self->log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v10 = log;
        uint64_t v11 = [(CDDWatchUpdateController *)self formatDate:v6];
        v12 = [(CDDWatchUpdateController *)self formatDate:v8];
        v13 = [v7 objectForKey:@"complicationPushLimits"];
        int v19 = 138412802;
        v20 = v11;
        __int16 v21 = 2112;
        v22 = v12;
        __int16 v23 = 2112;
        v24 = v13;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Last reset time: %@\n Next reset time: %@\n Push limits: %@\n", (uint8_t *)&v19, 0x20u);
      }
      v14 = +[NSDate date];
      uint64_t v15 = [(CDDWatchUpdateController *)self hoursBetween:v6 and:v14];

      if (v15 >= 25)
      {
        v16 = self->log;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v19) = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "More than 24 hours since last reset => forcing now.\n", (uint8_t *)&v19, 2u);
        }
        [(CDDWatchUpdateController *)self resetPushLimits];
      }
      [(CDDWatchUpdateController *)self setupNextResetTimer:v8];
    }
    else
    {
      v18 = self->log;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Initializing push limit defaults.\n", (uint8_t *)&v19, 2u);
      }
      [(CDDWatchUpdateController *)self resetPushLimits];
      v7 = [(CDDWatchUpdateController *)self nextResetTime];
      [(CDDWatchUpdateController *)self setupNextResetTimer:v7];
    }
  }
  else
  {
    objc_super v17 = self->log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100021EBC(v17);
    }
  }
}

- (id)nextResetTime
{
  v2 = +[NSDate date];
  v3 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
  v4 = +[NSTimeZone systemTimeZone];
  [v3 setTimeZone:v4];

  id v5 = [v3 startOfDayForDate:v2];
  id v6 = [v3 dateByAddingUnit:32 value:5 toDate:v5 options:0];
  if ([v2 compare:v6] == (id)-1)
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [v3 dateByAddingUnit:16 value:1 toDate:v6 options:0];
  }
  v8 = v7;

  return v8;
}

- (id)formatDate:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSDateFormatter);
  [v4 setDateFormat:@"yyyy-LLL-dd HH:mm:ss ZZZZ"];
  id v5 = +[NSTimeZone systemTimeZone];
  [v4 setTimeZone:v5];

  id v6 = [v4 stringFromDate:v3];

  return v6;
}

- (void)timeZoneOrTimeChanged:(id)a3
{
  watchupdateQueue = self->watchupdateQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000032C4;
  v8[3] = &unk_100038A78;
  v8[4] = self;
  id v4 = v8;
  id v5 = watchupdateQueue;
  id v6 = (void *)os_transaction_create();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003BD4;
  block[3] = &unk_100038AA0;
  id v10 = v6;
  id v11 = v4;
  id v7 = v6;
  dispatch_async(v5, block);
}

- (void)setupNextResetTimer:(id)a3
{
  id v4 = a3;
  [v4 timeIntervalSince1970];
  when.tv_sec = (uint64_t)v5;
  when.tv_nsec = 0;
  timer = self->timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    id v7 = self->timer;
    self->timer = 0;
  }
  v8 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->watchupdateQueue);
  uint64_t v9 = self->timer;
  self->timer = v8;

  id v10 = self->timer;
  dispatch_time_t v11 = dispatch_walltime(&when, 0);
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
  v12 = self->timer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100003688;
  handler[3] = &unk_100038A78;
  handler[4] = self;
  dispatch_source_set_event_handler(v12, handler);
  dispatch_resume((dispatch_object_t)self->timer);
  log = self->log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v14 = log;
    uint64_t v15 = [(CDDWatchUpdateController *)self formatDate:v4];
    *(_DWORD *)buf = 138412290;
    int v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Next reset time: %@\n", buf, 0xCu);
  }
}

- (void)dailyResetTimer
{
  watchupdateQueue = self->watchupdateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003790;
  v7[3] = &unk_100038A78;
  v7[4] = self;
  id v3 = v7;
  id v4 = watchupdateQueue;
  double v5 = (void *)os_transaction_create();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003BD4;
  block[3] = &unk_100038AA0;
  id v9 = v5;
  id v10 = v3;
  id v6 = v5;
  dispatch_async(v4, block);
}

- (void)resetPushLimits
{
  log = self->log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    pushLimits = self->pushLimits;
    double v5 = log;
    id v6 = [(NSUserDefaults *)pushLimits objectForKey:@"complicationPushLimits"];
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resetting complication push limits, currently: %@\n", (uint8_t *)&v9, 0xCu);
  }
  [(NSUserDefaults *)self->pushLimits removeObjectForKey:@"complicationPushLimits"];
  id v7 = self->pushLimits;
  v8 = +[NSDate date];
  [(NSUserDefaults *)v7 setObject:v8 forKey:@"lastResetDate"];

  [(NSUserDefaults *)self->pushLimits synchronize];
  notify_post(kComplicationPushLimitsResetNotification);
}

- (void)receiveWatchfaceInfo:(id)a3 device:(id)a4
{
  id v5 = a3;
  id v6 = [v5 objectForKey:&off_10003B0C0];
  id v7 = [v5 objectForKey:&off_10003B0D8];

  if ((uint64_t)[v6 integerValue] >= 90 && objc_msgSend(v7, "BOOLValue"))
  {
    watchupdateQueue = self->watchupdateQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100003AE4;
    v14[3] = &unk_100038A78;
    v14[4] = self;
    int v9 = v14;
    id v10 = watchupdateQueue;
    dispatch_time_t v11 = (void *)os_transaction_create();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100003BD4;
    block[3] = &unk_100038AA0;
    id v16 = v11;
    id v17 = v9;
    id v12 = v11;
    dispatch_async(v10, block);
  }
  int watchchargetoken = self->watchchargetoken;
  if (watchchargetoken)
  {
    notify_set_state(watchchargetoken, [v7 BOOLValue]);
    notify_post("com.apple.coreduetd.watchischarging");
  }
}

- (NSArray)activeComplications
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeComplications, 0);
  objc_storeStrong((id *)&self->timer, 0);
  objc_storeStrong((id *)&self->log, 0);
  objc_storeStrong((id *)&self->pushLimits, 0);
  objc_storeStrong((id *)&self->watchupdateQueue, 0);

  objc_storeStrong((id *)&self->cdd, 0);
}

@end