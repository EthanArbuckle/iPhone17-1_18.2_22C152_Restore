@interface FMFHeartbeatManager
+ (id)sharedInstance;
- (NSDate)latestXPCActivityRegistrationTime;
- (id)_activityBlock;
- (void)checkin;
- (void)setLatestXPCActivityRegistrationTime:(id)a3;
- (void)updateHeartbeat;
@end

@implementation FMFHeartbeatManager

+ (id)sharedInstance
{
  if (qword_1000BB7F8 != -1) {
    dispatch_once(&qword_1000BB7F8, &stru_1000A2768);
  }
  v2 = (void *)qword_1000BB7F0;

  return v2;
}

- (id)_activityBlock
{
  return &stru_1000A27A8;
}

- (void)checkin
{
  v2 = [(FMFHeartbeatManager *)self _activityBlock];
  v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Heartbeat checkin", v4, 2u);
  }

  xpc_activity_register(off_1000BB158, XPC_ACTIVITY_CHECK_IN, v2);
}

- (void)updateHeartbeat
{
  v3 = +[NSDate date];
  v4 = [(FMFHeartbeatManager *)self latestXPCActivityRegistrationTime];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  if (v6 >= 600.0)
  {
    v11 = +[FMFDataManager sharedInstance];
    [v11 heartbeatIntervalInSec];
    double v13 = v12;

    if (v13 <= 0.0)
    {
      v7 = sub_100005560();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 134217984;
        uint64_t v18 = *(void *)&v13;
        v8 = "Not scheduling heartbeat as server value was: %f";
        v9 = v7;
        uint32_t v10 = 12;
        goto LABEL_10;
      }
    }
    else
    {
      v7 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v7, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
      xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_REPEATING, 0);
      xpc_dictionary_set_int64(v7, XPC_ACTIVITY_INTERVAL, (uint64_t)v13);
      xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_ALLOW_BATTERY, 1);
      xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_POWER_NAP, 1);
      xpc_dictionary_set_int64(v7, XPC_ACTIVITY_DELAY, (uint64_t)v13);
      xpc_dictionary_set_int64(v7, XPC_ACTIVITY_GRACE_PERIOD, 60);
      v14 = [(FMFHeartbeatManager *)self _activityBlock];
      v15 = sub_100005560();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 134218240;
        uint64_t v18 = *(void *)&v13;
        __int16 v19 = 2048;
        double v20 = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Registering heartbeat after: %f(intervalSinceLastXPCActivityRegistration: %f)", (uint8_t *)&v17, 0x16u);
      }

      xpc_activity_register(off_1000BB158, v7, v14);
      v16 = +[NSDate date];
      [(FMFHeartbeatManager *)self setLatestXPCActivityRegistrationTime:v16];
    }
  }
  else
  {
    v7 = sub_100005560();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134218240;
      uint64_t v18 = 0x4082C00000000000;
      __int16 v19 = 2048;
      double v20 = v6;
      v8 = "Not re-registering heartbeat, since we have already registered in last %f(intervalSinceLastXPCActivityRegistration: %f) secs";
      v9 = v7;
      uint32_t v10 = 22;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v17, v10);
    }
  }
}

- (NSDate)latestXPCActivityRegistrationTime
{
  return self->_latestXPCActivityRegistrationTime;
}

- (void)setLatestXPCActivityRegistrationTime:(id)a3
{
}

- (void).cxx_destruct
{
}

@end