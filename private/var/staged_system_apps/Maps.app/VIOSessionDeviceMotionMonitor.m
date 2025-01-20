@interface VIOSessionDeviceMotionMonitor
+ (BOOL)isAvailable;
- (CMMotionActivityManager)motionActivityManager;
- (VIOSessionDeviceMotionMonitor)initWithStateManager:(id)a3 platformController:(id)a4;
- (void)dealloc;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
- (void)setMotionActivityManager:(id)a3;
- (void)startMonitoringDeviceMotion;
@end

@implementation VIOSessionDeviceMotionMonitor

- (VIOSessionDeviceMotionMonitor)initWithStateManager:(id)a3 platformController:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)VIOSessionDeviceMotionMonitor;
  v4 = [(VIOSessionMonitor *)&v14 initWithStateManager:a3 platformController:a4];
  if (v4)
  {
    v5 = sub_100D3A02C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 134349314;
      v16 = v4;
      __int16 v17 = 2112;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Enabling %@", buf, 0x16u);
    }
    v8 = (CMMotionActivityManager *)objc_alloc_init((Class)CMMotionActivityManager);
    motionActivityManager = v4->_motionActivityManager;
    v4->_motionActivityManager = v8;

    v10 = [(VIOSessionMonitor *)v4 session];
    [v10 _addObserver:v4];

    v11 = [(VIOSessionMonitor *)v4 session];
    id v12 = [v11 state];

    if (v12 == (id)1) {
      [(VIOSessionDeviceMotionMonitor *)v4 startMonitoringDeviceMotion];
    }
  }
  return v4;
}

- (void)dealloc
{
  v3 = sub_100D3A02C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 134349314;
    v9 = self;
    __int16 v10 = 2112;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Disabling %@", buf, 0x16u);
  }
  [(CMMotionActivityManager *)self->_motionActivityManager stopActivityUpdates];
  v6 = [(VIOSessionMonitor *)self session];
  [v6 _removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)VIOSessionDeviceMotionMonitor;
  [(VIOSessionDeviceMotionMonitor *)&v7 dealloc];
}

+ (BOOL)isAvailable
{
  int BOOL = GEOConfigGetBOOL();
  if (BOOL)
  {
    LOBYTE(BOOL) = +[CMMotionActivityManager isActivityAvailable];
  }
  return BOOL;
}

- (void)startMonitoringDeviceMotion
{
  if (([(id)objc_opt_class() isAvailable] & 1) == 0)
  {
    v5 = sub_1005762E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315906;
      *(void *)&location[4] = "-[VIOSessionDeviceMotionMonitor startMonitoringDeviceMotion]";
      __int16 v11 = 2080;
      id v12 = "VIOSessionDeviceMotionMonitor.m";
      __int16 v13 = 1024;
      int v14 = 70;
      __int16 v15 = 2080;
      v16 = "[[self class] isAvailable]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", location, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v6 = sub_1005762E4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_super v7 = +[NSThread callStackSymbols];
        *(_DWORD *)location = 138412290;
        *(void *)&location[4] = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);
      }
    }
  }
  if ([(id)objc_opt_class() isAvailable])
  {
    objc_initWeak((id *)location, self);
    v3 = [(VIOSessionDeviceMotionMonitor *)self motionActivityManager];
    v4 = +[NSOperationQueue mainQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100D3A430;
    v8[3] = &unk_101322A08;
    objc_copyWeak(&v9, (id *)location);
    [v3 startActivityUpdatesToQueue:v4 withHandler:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)location);
  }
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  if (a4 == 1)
  {
    [(VIOSessionDeviceMotionMonitor *)self startMonitoringDeviceMotion];
  }
  else
  {
    id v5 = [(VIOSessionDeviceMotionMonitor *)self motionActivityManager];
    [v5 stopActivityUpdates];
  }
}

- (CMMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end