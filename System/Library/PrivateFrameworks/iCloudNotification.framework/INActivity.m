@interface INActivity
- (BOOL)isRepeating;
- (BOOL)setActivityState:(int64_t)a3;
- (INActivity)initWithTarget:(id)a3 action:(SEL)a4;
- (NSString)activityNextFireDateKey;
- (const)activityID;
- (void)_configureXPCActivityWithCriteria:(id)a3;
- (void)_scheduleNextFireForDate:(id)a3;
- (void)checkIn;
- (void)ensureNextActivityWillOccurBeforeDate:(id)a3;
- (void)setActivityID:(const char *)a3;
- (void)setActivityNextFireDateKey:(id)a3;
- (void)setIsRepeating:(BOOL)a3;
- (void)setNextActivityDate:(id)a3;
- (void)stop;
@end

@implementation INActivity

- (const)activityID
{
  return self->_activityID;
}

- (void)stop
{
  activityQueue = self->_activityQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004254;
  block[3] = &unk_100040EC8;
  block[4] = self;
  dispatch_async(activityQueue, block);
}

- (INActivity)initWithTarget:(id)a3 action:(SEL)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INActivity;
  v8 = [(INActivity *)&v15 init];
  v9 = v8;
  if (v8)
  {
    [(INActivity *)v8 setIsRepeating:1];
    objc_storeStrong(&v9->_target, a3);
    if (a4) {
      SEL v10 = a4;
    }
    else {
      SEL v10 = 0;
    }
    v9->_action = v10;
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.ind.activity", v11);
    activityQueue = v9->_activityQueue;
    v9->_activityQueue = (OS_dispatch_queue *)v12;
  }
  return v9;
}

- (void)checkIn
{
  activityQueue = self->_activityQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008324;
  block[3] = &unk_100040EC8;
  block[4] = self;
  dispatch_async(activityQueue, block);
}

- (BOOL)setActivityState:(int64_t)a3
{
  xpcActivity = self->_xpcActivity;
  if (xpcActivity) {
    LOBYTE(xpcActivity) = xpc_activity_set_state(xpcActivity, a3);
  }
  return (char)xpcActivity;
}

- (void)setNextActivityDate:(id)a3
{
  id v4 = a3;
  v5 = _INLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100027488((uint64_t)v4, self);
  }

  [(INActivity *)self _scheduleNextFireForDate:v4];
}

- (void)ensureNextActivityWillOccurBeforeDate:(id)a3
{
  id v4 = a3;
  activityQueue = self->_activityQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000844C;
  v7[3] = &unk_100040EF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(activityQueue, v7);
}

- (void)_configureXPCActivityWithCriteria:(id)a3
{
  id v4 = a3;
  v5 = _INLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100027858(self);
  }

  if (v4)
  {
    if (self->_xpcActivity)
    {
      unsigned int v6 = [(INActivity *)self isRepeating];
      id v7 = _INLogSystem();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
      if (v6)
      {
        if (v8) {
          sub_100027760((uint64_t)v4, self);
        }

        xpc_activity_set_criteria(self->_xpcActivity, v4);
        goto LABEL_17;
      }
      if (v8) {
        sub_1000277E0(self);
      }
    }
    else
    {
      id v7 = _INLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_1000276E8(self);
      }
    }
  }
  v9 = _INLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100027670(self);
  }

  SEL v10 = [(INActivity *)self activityID];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000885C;
  v11[3] = &unk_100040F40;
  v11[4] = self;
  id v12 = v4;
  xpc_activity_register(v10, XPC_ACTIVITY_CHECK_IN, v11);

LABEL_17:
}

- (void)_scheduleNextFireForDate:(id)a3
{
  id v4 = a3;
  v5 = _INLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    id v18 = v4;
    __int16 v19 = 2080;
    v20 = [(INActivity *)self activityID];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requested date %@ for %s", (uint8_t *)&v17, 0x16u);
  }

  [v4 timeIntervalSinceNow];
  double v7 = v6;
  BOOL v8 = _INLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100027BB8(self);
  }

  if (v7 <= 0.0)
  {
    v9 = _INLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100027B20(self, (uint64_t)v4, v9);
    }
  }
  else
  {
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v9, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_BOOL(v9, XPC_ACTIVITY_ALLOW_BATTERY, 1);
    if ([(INActivity *)self isRepeating])
    {
      double v10 = (double)XPC_ACTIVITY_INTERVAL_1_HOUR;
      if (v7 <= (double)XPC_ACTIVITY_INTERVAL_1_HOUR) {
        double v10 = 1.0;
      }
      if (v7 <= (double)XPC_ACTIVITY_INTERVAL_1_DAY) {
        double v11 = v10;
      }
      else {
        double v11 = (double)XPC_ACTIVITY_INTERVAL_1_DAY;
      }
      xpc_dictionary_set_BOOL(v9, XPC_ACTIVITY_REPEATING, 1);
      xpc_dictionary_set_int64(v9, XPC_ACTIVITY_INTERVAL, (uint64_t)v7);
      xpc_dictionary_set_int64(v9, XPC_ACTIVITY_GRACE_PERIOD, (uint64_t)v11);
      double v7 = v7 - v11;
    }
    else
    {
      xpc_dictionary_set_BOOL(v9, XPC_ACTIVITY_REPEATING, 0);
      xpc_dictionary_set_int64(v9, XPC_ACTIVITY_GRACE_PERIOD, 1);
    }
    xpc_dictionary_set_int64(v9, XPC_ACTIVITY_DELAY, (uint64_t)v7);
    [(INActivity *)self _configureXPCActivityWithCriteria:v9];
    [v4 timeIntervalSinceReferenceDate];
    double v13 = v12;
    v14 = +[INManagedDefaults sharedInstance];
    objc_super v15 = +[NSNumber numberWithDouble:v13];
    v16 = [(INActivity *)self activityNextFireDateKey];
    [v14 setValue:v15 forManagedDefault:v16];
  }
}

- (void)setActivityID:(const char *)a3
{
  self->_activityID = a3;
}

- (NSString)activityNextFireDateKey
{
  return self->_activityNextFireDateKey;
}

- (void)setActivityNextFireDateKey:(id)a3
{
}

- (BOOL)isRepeating
{
  return self->_isRepeating;
}

- (void)setIsRepeating:(BOOL)a3
{
  self->_isRepeating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityNextFireDateKey, 0);
  objc_storeStrong((id *)&self->_activityQueue, 0);
  objc_storeStrong((id *)&self->_xpcActivity, 0);
  objc_storeStrong(&self->_target, 0);
}

@end