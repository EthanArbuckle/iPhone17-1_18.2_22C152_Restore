@interface RMAudioAccessoryManager
+ (BOOL)isTempestActive;
+ (id)internal;
+ (void)setTempestActive:(BOOL)a3;
- (BOOL)subscribedToStatus;
- (RMAudioAccessoryManager)init;
- (id)activityHandler;
- (id)deviceMotionHandler;
- (id)deviceMotionStatusHandler;
- (void)dealloc;
- (void)setActivityHandler:(id)a3;
- (void)setDeviceMotionHandler:(id)a3;
- (void)setDeviceMotionStatusHandler:(id)a3;
- (void)setSubscribedToStatus:(BOOL)a3;
- (void)startActivityUpdatesWithHandler:(id)a3;
- (void)startDeviceMotionUpdatesWithHandler:(id)a3;
- (void)startStatusUpdatesWithHandler:(id)a3;
- (void)stopActivityUpdates;
- (void)stopDeviceMotionUpdates;
- (void)stopStatusUpdates;
@end

@implementation RMAudioAccessoryManager

+ (id)internal
{
  return +[RMAudioAccessoryManagerSharedInternal sharedInternal];
}

- (RMAudioAccessoryManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)RMAudioAccessoryManager;
  v2 = [(RMAudioAccessoryManager *)&v10 init];
  if (v2)
  {
    v3 = [(id)objc_opt_class() internal];
    objc_sync_enter(v3);
    [(RMAudioAccessoryManager *)v2 setSubscribedToStatus:0];
    v4 = [(id)objc_opt_class() internal];
    v5 = [v4 managers];
    [v5 addObject:v2];

    if (qword_10002C538 != -1) {
      dispatch_once(&qword_10002C538, &stru_100024CF0);
    }
    v6 = (id)qword_10002C540;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(id)objc_opt_class() internal];
      v8 = [v7 managers];
      *(_DWORD *)buf = 134283779;
      v12 = v2;
      __int16 v13 = 2113;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[RMAudioAccessoryManager] %{private}p.init managers: %{private}@", buf, 0x16u);
    }
    objc_sync_exit(v3);
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(id)objc_opt_class() internal];
  objc_sync_enter(v3);
  [(RMAudioAccessoryManager *)self stopDeviceMotionUpdates];
  v4 = [(id)objc_opt_class() internal];
  v5 = [v4 managers];
  [v5 removeObject:self];

  if (qword_10002C538 != -1) {
    dispatch_once(&qword_10002C538, &stru_100024CF0);
  }
  v6 = (id)qword_10002C540;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(id)objc_opt_class() internal];
    v8 = [v7 managers];
    *(_DWORD *)buf = 134283779;
    v11 = self;
    __int16 v12 = 2113;
    __int16 v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[RMAudioAccessoryManager] %{private}p.dealloc managers: %{private}@", buf, 0x16u);
  }
  objc_sync_exit(v3);

  v9.receiver = self;
  v9.super_class = (Class)RMAudioAccessoryManager;
  [(RMAudioAccessoryManager *)&v9 dealloc];
}

- (void)startDeviceMotionUpdatesWithHandler:(id)a3
{
  id v6 = a3;
  v4 = [(id)objc_opt_class() internal];
  objc_sync_enter(v4);
  [(RMAudioAccessoryManager *)self setDeviceMotionHandler:v6];
  v5 = [(id)objc_opt_class() internal];
  [v5 startOrStopDeviceMotionUpdates];

  objc_sync_exit(v4);
}

- (void)stopDeviceMotionUpdates
{
  id obj = [(id)objc_opt_class() internal];
  objc_sync_enter(obj);
  if (![(RMAudioAccessoryManager *)self subscribedToStatus]) {
    [(RMAudioAccessoryManager *)self setDeviceMotionStatusHandler:0];
  }
  v3 = [(id)objc_opt_class() internal];
  [v3 startOrStopStatusUpdates];

  [(RMAudioAccessoryManager *)self setDeviceMotionHandler:0];
  v4 = [(id)objc_opt_class() internal];
  [v4 startOrStopDeviceMotionUpdates];

  objc_sync_exit(obj);
}

- (void)startStatusUpdatesWithHandler:(id)a3
{
  id v8 = a3;
  v4 = [(id)objc_opt_class() internal];
  objc_sync_enter(v4);
  [(RMAudioAccessoryManager *)self setSubscribedToStatus:1];
  [(RMAudioAccessoryManager *)self setDeviceMotionStatusHandler:v8];
  v5 = [(RMAudioAccessoryManager *)self deviceMotionStatusHandler];
  id v6 = [(id)objc_opt_class() internal];
  ((void (**)(void, id, void))v5)[2](v5, [v6 lastDeviceStatus], 0);

  v7 = [(id)objc_opt_class() internal];
  [v7 startOrStopStatusUpdates];

  objc_sync_exit(v4);
}

- (void)stopStatusUpdates
{
  id obj = [(id)objc_opt_class() internal];
  objc_sync_enter(obj);
  [(RMAudioAccessoryManager *)self setDeviceMotionStatusHandler:0];
  [(RMAudioAccessoryManager *)self setSubscribedToStatus:0];
  v3 = [(id)objc_opt_class() internal];
  [v3 startOrStopStatusUpdates];

  objc_sync_exit(obj);
}

- (void)startActivityUpdatesWithHandler:(id)a3
{
  id v6 = a3;
  v4 = [(id)objc_opt_class() internal];
  objc_sync_enter(v4);
  [(RMAudioAccessoryManager *)self setActivityHandler:v6];
  v5 = [(id)objc_opt_class() internal];
  [v5 startOrStopActivityUpdates];

  objc_sync_exit(v4);
}

- (void)stopActivityUpdates
{
  id obj = [(id)objc_opt_class() internal];
  objc_sync_enter(obj);
  [(RMAudioAccessoryManager *)self setActivityHandler:0];
  v3 = [(id)objc_opt_class() internal];
  [v3 startOrStopActivityUpdates];

  objc_sync_exit(obj);
}

+ (BOOL)isTempestActive
{
  v2 = [a1 internal];
  unsigned __int8 v3 = [v2 isTempestActive];

  return v3;
}

+ (void)setTempestActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [a1 internal];
  [v4 setTempestActive:v3];
}

- (BOOL)subscribedToStatus
{
  return self->_subscribedToStatus;
}

- (void)setSubscribedToStatus:(BOOL)a3
{
  self->_subscribedToStatus = a3;
}

- (id)deviceMotionHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setDeviceMotionHandler:(id)a3
{
}

- (id)deviceMotionStatusHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setDeviceMotionStatusHandler:(id)a3
{
}

- (id)activityHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setActivityHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activityHandler, 0);
  objc_storeStrong(&self->_deviceMotionStatusHandler, 0);

  objc_storeStrong(&self->_deviceMotionHandler, 0);
}

@end