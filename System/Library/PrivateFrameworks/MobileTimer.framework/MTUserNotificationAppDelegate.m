@interface MTUserNotificationAppDelegate
- (MTUserNotificationAppDelegate)init;
- (UNUserNotificationCenter)notificationCenter;
- (void)setNotificationCenter:(id)a3;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation MTUserNotificationAppDelegate

- (MTUserNotificationAppDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTUserNotificationAppDelegate;
  v2 = [(MTUserNotificationAppDelegate *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F44680] currentNotificationCenter];
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (UNUserNotificationCenter *)v3;

    [(UNUserNotificationCenter *)v2->_notificationCenter setDelegate:v2];
  }
  return v2;
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v7 = (void (**)(id, uint64_t))a5;
  id v8 = a4;
  v9 = MTLogForCategory(3);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    v16 = self;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ received willPresentNotification", (uint8_t *)&v15, 0xCu);
  }

  v10 = [v8 request];

  v11 = [v10 content];
  v12 = [v11 categoryIdentifier];

  if ([v12 isEqualToString:@"AlarmSnoozeCountdown"])
  {
    if (v7)
    {
      v13 = MTLogForCategory(3);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543618;
        v16 = self;
        __int16 v17 = 2114;
        v18 = v12;
        _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ completing with UNNotificationPresentationOptionAlert for %{public}@", (uint8_t *)&v15, 0x16u);
      }
      uint64_t v14 = 4;
LABEL_12:

      v7[2](v7, v14);
    }
  }
  else if (v7)
  {
    v13 = MTLogForCategory(3);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543618;
      v16 = self;
      __int16 v17 = 2114;
      v18 = v12;
      _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ completing with UNNotificationPresentationOptionAlert|UNNotificationPresentationOptionSound for %{public}@", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v14 = 6;
    goto LABEL_12;
  }
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end