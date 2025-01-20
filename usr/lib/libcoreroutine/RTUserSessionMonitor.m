@interface RTUserSessionMonitor
+ (BOOL)supportsNotificationName:(id)a3;
+ (RTUserSessionMonitor)allocWithZone:(_NSZone *)a3;
- (BOOL)activeUser;
- (BOOL)previouslyActiveUser;
- (RTUserSessionMonitor)init;
- (unsigned)uid;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)setPreviouslyActiveUser:(BOOL)a3;
@end

@implementation RTUserSessionMonitor

- (RTUserSessionMonitor)init
{
  v5.receiver = self;
  v5.super_class = (Class)RTUserSessionMonitor;
  v2 = [(RTNotifier *)&v5 init];
  v3 = v2;
  if (v2) {
    v2->_previouslyActiveUser = [(RTUserSessionMonitor *)v2 activeUser];
  }
  return v3;
}

+ (RTUserSessionMonitor)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (RTUserSessionMonitor *)+[RTUserSessionMonitor allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___RTUserSessionMonitor;
    return (RTUserSessionMonitor *)[super allocWithZone:a3];
  }
}

- (unsigned)uid
{
  return -101;
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([(id)objc_opt_class() supportsNotificationName:v7] & 1) == 0)
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v7;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v12, 0xCu);
    }
  }
  v9 = +[RTNotification notificationName];
  int v10 = [v7 isEqualToString:v9];

  if (v10)
  {
    v11 = [[RTUserSessionMonitorNotificationConsoleUserDidChange alloc] initWithactiveUser:self->_previouslyActiveUser];
    if (v11) {
      [(RTNotifier *)self postNotification:v11 toObserver:v6];
    }
  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  if (([(id)objc_opt_class() supportsNotificationName:v4] & 1) == 0)
  {
    objc_super v5 = _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

+ (BOOL)supportsNotificationName:(id)a3
{
  id v3 = a3;
  id v4 = +[RTNotification notificationName];
  char v5 = [v3 isEqualToString:v4];

  return v5;
}

- (BOOL)activeUser
{
  return 0;
}

- (BOOL)previouslyActiveUser
{
  return self->_previouslyActiveUser;
}

- (void)setPreviouslyActiveUser:(BOOL)a3
{
  self->_previouslyActiveUser = a3;
}

@end