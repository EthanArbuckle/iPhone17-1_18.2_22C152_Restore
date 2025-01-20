@interface DebugCoreMotionCompassAvailabilityTask
+ (int64_t)creationPreference;
- (BOOL)gotDeviceMotionUpdate;
- (CMMotionManager)motionManager;
- (DebugCoreMotionCompassAvailabilityTask)initWithPlatformController:(id)a3;
- (PlatformController)platformController;
- (void)dealloc;
- (void)setGotDeviceMotionUpdate:(BOOL)a3;
- (void)setMotionManager:(id)a3;
- (void)setPlatformController:(id)a3;
@end

@implementation DebugCoreMotionCompassAvailabilityTask

+ (int64_t)creationPreference
{
  return 2;
}

- (DebugCoreMotionCompassAvailabilityTask)initWithPlatformController:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DebugCoreMotionCompassAvailabilityTask;
  v5 = [(DebugCoreMotionCompassAvailabilityTask *)&v23 init];
  if (v5)
  {
    v6 = sub_100BA922C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v25 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeWeak((id *)&v5->_platformController, v4);
    v7 = (CMMotionManager *)objc_alloc_init((Class)CMMotionManager);
    motionManager = v5->_motionManager;
    v5->_motionManager = v7;

    unsigned int v9 = [(CMMotionManager *)v5->_motionManager isDeviceMotionAvailable];
    v10 = sub_100BA922C();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v11)
      {
        *(_DWORD *)buf = 134349056;
        v25 = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Device motion is available; will start updates",
          buf,
          0xCu);
      }

      v12 = +[NSBundle mainBundle];
      v13 = [v12 bundleIdentifier];
      v14 = +[NSString stringWithFormat:@"%@.%@.deviceMotionUpdatesQueue.%p", v13, objc_opt_class(), v5];

      v10 = v14;
      v15 = (const char *)[v10 UTF8String];
      v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v17 = dispatch_queue_create(v15, v16);

      v18 = objc_opt_new();
      [v18 setUnderlyingQueue:v17];
      objc_initWeak((id *)buf, v5);
      v19 = v5->_motionManager;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100BA9280;
      v21[3] = &unk_101312490;
      objc_copyWeak(&v22, (id *)buf);
      [(CMMotionManager *)v19 startDeviceMotionUpdatesUsingReferenceFrame:8 toQueue:v18 withHandler:v21];
      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
    else if (v11)
    {
      *(_DWORD *)buf = 134349056;
      v25 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Device motion is not available", buf, 0xCu);
    }
  }
  return v5;
}

- (void)dealloc
{
  v3 = sub_100BA922C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)DebugCoreMotionCompassAvailabilityTask;
  [(DebugCoreMotionCompassAvailabilityTask *)&v4 dealloc];
}

- (CMMotionManager)motionManager
{
  return self->_motionManager;
}

- (void)setMotionManager:(id)a3
{
}

- (PlatformController)platformController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);

  return (PlatformController *)WeakRetained;
}

- (void)setPlatformController:(id)a3
{
}

- (BOOL)gotDeviceMotionUpdate
{
  return self->_gotDeviceMotionUpdate;
}

- (void)setGotDeviceMotionUpdate:(BOOL)a3
{
  self->_gotDeviceMotionUpdate = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_platformController);

  objc_storeStrong((id *)&self->_motionManager, 0);
}

@end