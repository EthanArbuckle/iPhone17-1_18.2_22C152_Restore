@interface BatteryMonitorController
+ (id)sharedInstance;
- (BOOL)isMonitoring;
- (id)beginMonitoringBattery;
- (void)_updateBatteryMonitoring;
- (void)batteryMonitorConcreteTokenWillInvalidate:(id)a3;
- (void)setIsMonitoring:(BOOL)a3;
@end

@implementation BatteryMonitorController

- (void)_updateBatteryMonitoring
{
  v3 = [(NSHashTable *)self->_tokens allObjects];
  BOOL v4 = [v3 count] != 0;

  [(BatteryMonitorController *)self setIsMonitoring:v4];
}

- (id)beginMonitoringBattery
{
  if (!self->_tokens)
  {
    v3 = +[NSHashTable weakObjectsHashTable];
    tokens = self->_tokens;
    self->_tokens = v3;
  }
  v5 = objc_alloc_init(_BatteryMonitorConcreteToken);
  [(_BatteryMonitorConcreteToken *)v5 setConcreteTokenDelegate:self];
  [(NSHashTable *)self->_tokens addObject:v5];
  [(BatteryMonitorController *)self _updateBatteryMonitoring];

  return v5;
}

- (void)setIsMonitoring:(BOOL)a3
{
  if (self->_isMonitoring != a3)
  {
    BOOL v3 = a3;
    self->_isMonitoring = a3;
    BOOL v4 = +[UIDevice currentDevice];
    [v4 setBatteryMonitoringEnabled:v3];

    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = NSStringFromBOOL();
      int v7 = 138412290;
      v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Monitoring Battery: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

+ (id)sharedInstance
{
  if (qword_101610920 != -1) {
    dispatch_once(&qword_101610920, &stru_10131A048);
  }
  v2 = (void *)qword_101610918;

  return v2;
}

- (void)batteryMonitorConcreteTokenWillInvalidate:(id)a3
{
  [(NSHashTable *)self->_tokens removeObject:a3];

  [(BatteryMonitorController *)self _updateBatteryMonitoring];
}

- (BOOL)isMonitoring
{
  return self->_isMonitoring;
}

- (void).cxx_destruct
{
}

@end