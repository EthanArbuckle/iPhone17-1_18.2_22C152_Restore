@interface SMCMNoMovementMonitor
- (BOOL)isMonitoring;
- (SMCMNoMovementMonitor)init;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)requestLatestStateUpdate;
- (void)setIsMonitoring:(BOOL)a3;
@end

@implementation SMCMNoMovementMonitor

- (SMCMNoMovementMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)SMCMNoMovementMonitor;
  result = [(RTNotifier *)&v3 init];
  if (result) {
    *(&result->super._isShuttingDown + 1) = 0;
  }
  return result;
}

- (void)setIsMonitoring:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_super v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[SMCMNoMovementMonitor setIsMonitoring:]";
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s,unsupported platform", (uint8_t *)&v4, 0xCu);
  }
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    [(SMCMNoMovementMonitor *)self setIsMonitoring:[(RTNotifier *)self getNumberOfObservers:v5] != 0];
  }
  else
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315394;
      v10 = "-[SMCMNoMovementMonitor internalAddObserver:name:]";
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s,unsupported notification, %@", (uint8_t *)&v9, 0x16u);
    }
  }
  [(SMCMNoMovementMonitor *)self requestLatestStateUpdate];
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    [(SMCMNoMovementMonitor *)self setIsMonitoring:[(RTNotifier *)self getNumberOfObservers:v5] != 0];
  }
  else
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315394;
      v10 = "-[SMCMNoMovementMonitor internalRemoveObserver:name:]";
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s,unsupported notification, %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)requestLatestStateUpdate
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    int v4 = "-[SMCMNoMovementMonitor requestLatestStateUpdate]";
    _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "%s, unsupported platform", (uint8_t *)&v3, 0xCu);
  }
}

- (BOOL)isMonitoring
{
  return *(&self->super._isShuttingDown + 1);
}

@end