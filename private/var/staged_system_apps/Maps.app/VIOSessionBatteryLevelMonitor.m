@interface VIOSessionBatteryLevelMonitor
+ (BOOL)isAvailable;
- (BOOL)isBatteryLevelTooLow;
- (BatteryMonitorToken)batteryMonitorToken;
- (NSString)description;
- (VIOSessionBatteryLevelMonitor)initWithStateManager:(id)a3 platformController:(id)a4;
- (void)dealloc;
- (void)reportStateToStateManager;
- (void)setBatteryMonitorToken:(id)a3;
@end

@implementation VIOSessionBatteryLevelMonitor

- (VIOSessionBatteryLevelMonitor)initWithStateManager:(id)a3 platformController:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)VIOSessionBatteryLevelMonitor;
  v4 = [(VIOSessionMonitor *)&v12 initWithStateManager:a3 platformController:a4];
  if (v4)
  {
    v5 = sub_10077D3B0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 134349314;
      v14 = v4;
      __int16 v15 = 2112;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Enabling %@", buf, 0x16u);
    }
    v8 = +[BatteryMonitorController sharedInstance];
    uint64_t v9 = [v8 beginMonitoringBattery];
    batteryMonitorToken = v4->_batteryMonitorToken;
    v4->_batteryMonitorToken = (BatteryMonitorToken *)v9;

    [(BatteryMonitorToken *)v4->_batteryMonitorToken setDelegate:v4];
    [(VIOSessionBatteryLevelMonitor *)v4 reportStateToStateManager];
  }
  return v4;
}

- (void)dealloc
{
  v3 = sub_10077D3B0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 134349314;
    v8 = self;
    __int16 v9 = 2112;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Disabling %@", buf, 0x16u);
  }
  v6.receiver = self;
  v6.super_class = (Class)VIOSessionBatteryLevelMonitor;
  [(VIOSessionBatteryLevelMonitor *)&v6 dealloc];
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)VIOSessionBatteryLevelMonitor;
  v2 = [(VIOSessionBatteryLevelMonitor *)&v7 description];
  v3 = +[UIDevice currentDevice];
  [v3 batteryLevel];
  v5 = [v2 stringByAppendingFormat:@" current battery level: %f" v4];

  return (NSString *)v5;
}

+ (BOOL)isAvailable
{
  return GEOConfigGetBOOL();
}

- (BOOL)isBatteryLevelTooLow
{
  GEOConfigGetDouble();
  double v4 = v3;
  [(BatteryMonitorToken *)self->_batteryMonitorToken currentBatteryLevel];
  return v4 >= (float)(v5 * 100.0);
}

- (void)reportStateToStateManager
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10077D6B0;
  v2[3] = &unk_1012E6708;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (BatteryMonitorToken)batteryMonitorToken
{
  return self->_batteryMonitorToken;
}

- (void)setBatteryMonitorToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end