@interface HDSPDarwinNotificationCenter
- (HDSPDarwinNotificationCenter)initWithEnvironment:(id)a3;
- (HDSPEnvironment)environment;
- (void)publishNotificationForEvent:(id)a3;
- (void)tearDownNotificationForEventIdentifier:(id)a3;
- (void)tearDownNotifications;
@end

@implementation HDSPDarwinNotificationCenter

- (HDSPDarwinNotificationCenter)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSPDarwinNotificationCenter;
  v5 = [(HDSPDarwinNotificationCenter *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v7 = v6;
  }

  return v6;
}

- (void)publishNotificationForEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = [a3 identifier];
  uint64_t v5 = *MEMORY[0x263F75C30];
  int v6 = [v4 isEqualToString:*MEMORY[0x263F75C30]];

  if (v6)
  {
    v7 = [(HDSPDarwinNotificationCenter *)self environment];
    v8 = [v7 sensitiveUIMonitor];
    char v9 = [v8 shouldHideForSensitivity:1];

    v10 = HKSPLogForCategory();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        int v15 = 138543618;
        id v16 = (id)objc_opt_class();
        __int16 v17 = 2114;
        uint64_t v18 = v5;
        id v12 = v16;
        _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] not posting %{public}@ because sensitive UI is disabled", (uint8_t *)&v15, 0x16u);
      }
    }
    else
    {
      if (v11)
      {
        int v15 = 138543362;
        id v16 = (id)objc_opt_class();
        id v13 = v16;
        _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Posting HKSPNotificationPresentGoodMorningAlert", (uint8_t *)&v15, 0xCu);
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x263F75AD8], 0, 0, 1u);
    }
  }
}

- (void)tearDownNotifications
{
}

- (void)tearDownNotificationForEventIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ([a3 isEqualToString:*MEMORY[0x263F75C30]])
  {
    v3 = HKSPLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = (id)objc_opt_class();
      id v4 = v7;
      _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Posting HKSPNotificationDismissGoodMorningAlert", (uint8_t *)&v6, 0xCu);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x263F75AD0], 0, 0, 1u);
  }
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end