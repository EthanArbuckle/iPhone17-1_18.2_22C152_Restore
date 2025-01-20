@interface HDSPUserNotificationCenter
+ (id)_generateUniqueIdentifierForNotificationIdentifierPrefix:(id)a3 eventDate:(id)a4;
+ (id)_stringForEventDate:(id)a3;
- (BOOL)_shouldPostCustomizeFocusNotification;
- (HDSPEnvironment)environment;
- (HDSPUserNotificationCenter)initWithEnvironment:(id)a3;
- (HDSPUserNotificationCenter)initWithEnvironment:(id)a3 notificationCenter:(id)a4;
- (UNUserNotificationCenter)notificationCenter;
- (id)_bedtimeReminderContent;
- (id)_chargingReminderBodyForAlarmEnabled:(BOOL)a3 sleepTrackingEnabled:(BOOL)a4;
- (id)_chargingReminderContentWithUserInfo:(id)a3;
- (id)_contentByAddingCommonUserInfoTo:(id)a3;
- (id)_localizedBedtimeOrWindDownReminderBodyHelperWithKey:(id)a3 embeddingTimeForEvent:(id)a4;
- (id)_localizedBedtimeOrWindDownReminderBodyWithKey:(id)a3 embeddingTimeForEvent:(id)a4 shouldIntroduceFocus:(BOOL)a5;
- (id)_notificationContentForEventIdentifier:(id)a3 userInfo:(id)a4;
- (id)_notificationIdentifierPrefixForEventIdentifier:(id)a3;
- (id)_notificationRequestForEvent:(id)a3;
- (id)_notificationRequestIdentifierForEvent:(id)a3;
- (id)_wakeDetectionAlertBodyForAlarmEnabled:(BOOL)a3 sleepModeOn:(BOOL)a4;
- (id)_wakeDetectionAlertTitleForAlarmEnabled:(BOOL)a3 sleepModeOn:(BOOL)a4;
- (id)_wakeDetectionContentWithUserInfo:(id)a3;
- (id)_wakeUpResultsContentWithUserInfo:(id)a3;
- (id)_windDownReminderBodyContentShouldIntroduceFocus:(BOOL)a3;
- (id)_windDownReminderContent;
- (void)_publishNotificationRequest:(id)a3;
- (void)_submitAnalyticsForNotification:(id)a3;
- (void)environmentDidBecomeReady:(id)a3;
- (void)publishNotificationForEvent:(id)a3;
- (void)tearDownNotificationForEventIdentifier:(id)a3;
- (void)tearDownNotifications;
@end

@implementation HDSPUserNotificationCenter

- (HDSPUserNotificationCenter)initWithEnvironment:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F1DFB0];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = (void *)[v6 initWithBundleIdentifier:*MEMORY[0x263F0AD08]];
  v8 = [(HDSPUserNotificationCenter *)self initWithEnvironment:v5 notificationCenter:v7];

  return v8;
}

- (HDSPUserNotificationCenter)initWithEnvironment:(id)a3 notificationCenter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDSPUserNotificationCenter;
  v8 = [(HDSPUserNotificationCenter *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_environment, v6);
    objc_storeStrong((id *)&v9->_notificationCenter, a4);
    v10 = v9;
  }

  return v9;
}

- (void)environmentDidBecomeReady:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentDidBecomeReady", (uint8_t *)&v5, 0xCu);
  }
}

- (void)publishNotificationForEvent:(id)a3
{
  uint64_t v4 = [(HDSPUserNotificationCenter *)self _notificationRequestForEvent:a3];
  if (v4) {
    [(HDSPUserNotificationCenter *)self _publishNotificationRequest:v4];
  }

  MEMORY[0x270F9A758]();
}

- (id)_notificationRequestForEvent:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v6 = [WeakRetained behavior];
  if ([v6 isAppleWatch])
  {
  }
  else
  {
    uint64_t v7 = [v4 identifier];
    char v8 = [v7 isEqualToString:*MEMORY[0x263F75C38]];

    if (v8)
    {
      v9 = 0;
      goto LABEL_15;
    }
  }
  v10 = [(HDSPUserNotificationCenter *)self _notificationRequestIdentifierForEvent:v4];
  if (!v10)
  {
    v13 = HKSPLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_opt_class();
      id v15 = v14;
      v16 = [v4 identifier];
      int v22 = 138543618;
      v23 = v14;
      __int16 v24 = 2114;
      v25 = v16;
      _os_log_error_impl(&dword_221A52000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] unable to create notification identifier for event %{public}@", (uint8_t *)&v22, 0x16u);
    }
    goto LABEL_13;
  }
  v11 = [v4 identifier];
  objc_super v12 = [v4 context];
  v13 = [(HDSPUserNotificationCenter *)self _notificationContentForEventIdentifier:v11 userInfo:v12];

  if (!v13)
  {
    v17 = HKSPLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_opt_class();
      id v20 = v19;
      v21 = [v4 identifier];
      int v22 = 138543618;
      v23 = v19;
      __int16 v24 = 2114;
      v25 = v21;
      _os_log_error_impl(&dword_221A52000, v17, OS_LOG_TYPE_ERROR, "[%{public}@] unable to create notification content for event %{public}@", (uint8_t *)&v22, 0x16u);
    }
    v13 = 0;
LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  v9 = [MEMORY[0x263F1DF48] requestWithIdentifier:v10 content:v13 trigger:0 destinations:7];
LABEL_14:

LABEL_15:

  return v9;
}

- (void)_publishNotificationRequest:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  notificationCenter = self->_notificationCenter;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__HDSPUserNotificationCenter__publishNotificationRequest___block_invoke;
  v7[3] = &unk_2645DB260;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(UNUserNotificationCenter *)notificationCenter addNotificationRequest:v6 withCompletionHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__HDSPUserNotificationCenter__publishNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v5 = HKSPLogForCategory();
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      uint64_t v11 = *(void *)(a1 + 32);
      int v13 = 138543874;
      v14 = v10;
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      __int16 v17 = 2114;
      id v18 = v3;
      id v12 = v10;
      _os_log_error_impl(&dword_221A52000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] failed to publish %{public}@ with error %{public}@", (uint8_t *)&v13, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = *(void *)(a1 + 32);
      int v13 = 138543618;
      v14 = v7;
      __int16 v15 = 2114;
      uint64_t v16 = v8;
      id v9 = v7;
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] published %{public}@", (uint8_t *)&v13, 0x16u);
    }
    [WeakRetained _submitAnalyticsForNotification:*(void *)(a1 + 32)];
  }
}

- (void)_submitAnalyticsForNotification:(id)a3
{
  id v9 = a3;
  if (objc_msgSend(v9, "hksp_shouldSubmitAnalytics"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    int v5 = [WeakRetained analyticsManager];
    id v6 = [v5 analyticsManager];

    uint64_t v7 = objc_msgSend(v9, "hksp_analyticsSleepNotificationType");
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F75DA8]) initWithType:v7 action:0];
    [v6 trackEvent:v8];
  }
}

- (void)tearDownNotificationForEventIdentifier:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    id v6 = *(id *)&buf[4];
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] tearDownNotificationForEventIdentifier %{public}@", buf, 0x16u);
  }
  v25[0] = *MEMORY[0x263F75C20];
  uint64_t v7 = *MEMORY[0x263F75AA8];
  v24[0] = *MEMORY[0x263F75A48];
  v24[1] = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  *(void *)buf = v8;
  v25[1] = *MEMORY[0x263F75C58];
  v23[0] = *MEMORY[0x263F75D88];
  v23[1] = v7;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  *(void *)&buf[8] = v9;
  v25[2] = *MEMORY[0x263F75C28];
  uint64_t v22 = *MEMORY[0x263F75A78];
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
  *(void *)&buf[16] = v10;
  v25[3] = *MEMORY[0x263F75C48];
  uint64_t v11 = *MEMORY[0x263F75AF0];
  v21[0] = *MEMORY[0x263F75AE8];
  v21[1] = v11;
  v21[2] = *MEMORY[0x263F75D00];
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
  v27 = v12;
  v25[4] = *MEMORY[0x263F75C38];
  uint64_t v20 = *MEMORY[0x263F75D10];
  int v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
  v28 = v13;
  v14 = [NSDictionary dictionaryWithObjects:buf forKeys:v25 count:5];

  __int16 v15 = [v14 objectForKeyedSubscript:v4];

  if ([v15 count])
  {
    notificationCenter = self->_notificationCenter;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __69__HDSPUserNotificationCenter_tearDownNotificationForEventIdentifier___block_invoke;
    v17[3] = &unk_2645DB2D0;
    id v18 = v15;
    uint64_t v19 = self;
    [(UNUserNotificationCenter *)notificationCenter getDeliveredNotificationsWithCompletionHandler:v17];
  }
}

void __69__HDSPUserNotificationCenter_tearDownNotificationForEventIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__HDSPUserNotificationCenter_tearDownNotificationForEventIdentifier___block_invoke_2;
  v9[3] = &unk_2645DB288;
  id v10 = *(id *)(a1 + 32);
  id v4 = objc_msgSend(a2, "na_filter:", v9);
  int v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_32);

  id v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    id v12 = v7;
    __int16 v13 = 2114;
    v14 = v5;
    id v8 = v7;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Tearing down %{public}@", buf, 0x16u);
  }
  [*(id *)(*(void *)(a1 + 40) + 16) removeDeliveredNotificationsWithIdentifiers:v5];
}

uint64_t __69__HDSPUserNotificationCenter_tearDownNotificationForEventIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 request];
  id v4 = [v3 content];
  int v5 = [v4 categoryIdentifier];
  uint64_t v6 = [v2 containsObject:v5];

  return v6;
}

id __69__HDSPUserNotificationCenter_tearDownNotificationForEventIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 request];
  id v3 = [v2 identifier];

  return v3;
}

- (void)tearDownNotifications
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = objc_opt_class();
    id v4 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Tearing down all notifications", (uint8_t *)&buf, 0xCu);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = *MEMORY[0x263F75C28];
  *(void *)&long long buf = *MEMORY[0x263F75C20];
  *((void *)&buf + 1) = v5;
  uint64_t v6 = *MEMORY[0x263F75C58];
  uint64_t v18 = *MEMORY[0x263F75C48];
  uint64_t v19 = v6;
  uint64_t v20 = *MEMORY[0x263F75C38];
  uint64_t v7 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &buf, 5, 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(HDSPUserNotificationCenter *)self tearDownNotificationForEventIdentifier:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (id)_notificationRequestIdentifierForEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  uint64_t v6 = [(HDSPUserNotificationCenter *)self _notificationIdentifierPrefixForEventIdentifier:v5];

  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = [v4 dueDate];
    uint64_t v9 = [v7 _generateUniqueIdentifierForNotificationIdentifierPrefix:v6 eventDate:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_notificationIdentifierPrefixForEventIdentifier:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:*MEMORY[0x263F75C58]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263F75C20]] & 1) != 0)
  {
    id v4 = (id *)MEMORY[0x263F75A58];
LABEL_4:
    id v5 = *v4;
    goto LABEL_5;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F75C28]])
  {
    id v4 = (id *)MEMORY[0x263F75A80];
    goto LABEL_4;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F75C48]])
  {
    id v4 = (id *)MEMORY[0x263F75D30];
    goto LABEL_4;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F75C38]])
  {
    id v4 = (id *)MEMORY[0x263F75D18];
    goto LABEL_4;
  }
  id v5 = 0;
LABEL_5:

  return v5;
}

+ (id)_generateUniqueIdentifierForNotificationIdentifierPrefix:(id)a3 eventDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() _stringForEventDate:v5];

  uint64_t v8 = [v6 stringByAppendingFormat:@"_%@", v7];

  return v8;
}

+ (id)_stringForEventDate:(id)a3
{
  uint64_t v3 = qword_26AB79130;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_26AB79130, &__block_literal_global_291_1);
  }
  id v5 = [(id)_MergedGlobals_21 stringFromDate:v4];

  return v5;
}

uint64_t __50__HDSPUserNotificationCenter__stringForEventDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)_MergedGlobals_21;
  _MergedGlobals_21 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_21;
  uint64_t v3 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  id v4 = (void *)_MergedGlobals_21;
  id v5 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
  [v4 setTimeZone:v5];

  id v6 = (void *)_MergedGlobals_21;

  return [v6 setDateFormat:@"yyyy-MM-dd_HH:mm"];
}

- (id)_notificationContentForEventIdentifier:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:*MEMORY[0x263F75C58]])
  {
    uint64_t v8 = [(HDSPUserNotificationCenter *)self _windDownReminderContent];
LABEL_11:
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(HDSPUserNotificationCenter *)self _contentByAddingCommonUserInfoTo:v8];

    goto LABEL_12;
  }
  if ([v6 isEqualToString:*MEMORY[0x263F75C20]])
  {
    uint64_t v8 = [(HDSPUserNotificationCenter *)self _bedtimeReminderContent];
    goto LABEL_11;
  }
  if ([v6 isEqualToString:*MEMORY[0x263F75C28]])
  {
    uint64_t v8 = [(HDSPUserNotificationCenter *)self _chargingReminderContentWithUserInfo:v7];
    goto LABEL_11;
  }
  if ([v6 isEqualToString:*MEMORY[0x263F75C48]])
  {
    uint64_t v8 = [(HDSPUserNotificationCenter *)self _wakeUpResultsContentWithUserInfo:v7];
    goto LABEL_11;
  }
  if ([v6 isEqualToString:*MEMORY[0x263F75C38]])
  {
    uint64_t v8 = [(HDSPUserNotificationCenter *)self _wakeDetectionContentWithUserInfo:v7];
    goto LABEL_11;
  }
  uint64_t v10 = 0;
LABEL_12:

  return v10;
}

- (id)_contentByAddingCommonUserInfoTo:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[v3 mutableCopy];
  id v5 = [v3 userInfo];

  id v6 = (void *)[v5 mutableCopy];
  [v6 setObject:&unk_26D40F0F8 forKeyedSubscript:*MEMORY[0x263F0ADA8]];
  id v7 = (void *)[v6 copy];
  [v4 setUserInfo:v7];

  uint64_t v8 = (void *)[v4 copy];

  return v8;
}

- (id)_bedtimeReminderContent
{
  id v3 = (void *)MEMORY[0x263F1DEF0];
  p_environment = &self->_environment;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v6 = objc_msgSend(v3, "hdsp_notificationContentWithEnvironment:", WeakRetained);

  [v6 setCategoryIdentifier:*MEMORY[0x263F75A48]];
  id v7 = HDSPLocalizedString(@"BEDTIME_REMINDER_TITLE");
  [v6 setTitle:v7];

  BOOL v8 = [(HDSPUserNotificationCenter *)self _shouldPostCustomizeFocusNotification];
  if (v8)
  {
    [v6 setCategoryIdentifier:*MEMORY[0x263F75AA8]];
    uint64_t v9 = HDSPLocalizedString(@"SILENCE_NOTIFICATIONS_TITLE");
    [v6 setTitle:v9];

    uint64_t v10 = HKSPSleepFocusConfigurationURL();
    [v6 setDefaultActionURL:v10];

    id v11 = objc_loadWeakRetained((id *)p_environment);
    long long v12 = [v11 behavior];
    char v13 = [v12 isAppleWatch];

    if ((v13 & 1) == 0)
    {
      long long v14 = [MEMORY[0x263F1DF40] iconForApplicationIdentifier:@"com.apple.Preferences"];
      [v6 setIcon:v14];
    }
  }
  long long v15 = [(HDSPUserNotificationCenter *)self _localizedBedtimeOrWindDownReminderBodyWithKey:@"BEDTIME_REMINDER_MESSAGE" embeddingTimeForEvent:*MEMORY[0x263F75C18] shouldIntroduceFocus:v8];
  [v6 setBody:v15];

  uint64_t v16 = objc_msgSend(MEMORY[0x263F1DF68], "hdsp_bedtimeReminderSound");
  [v6 setSound:v16];

  id v17 = objc_loadWeakRetained((id *)p_environment);
  uint64_t v18 = [v17 currentDateProvider];
  uint64_t v19 = v18[2]();
  uint64_t v20 = [v19 dateByAddingTimeInterval:*MEMORY[0x263F75D78]];
  [v6 setExpirationDate:v20];

  return v6;
}

- (id)_windDownReminderContent
{
  id v3 = (void *)MEMORY[0x263F1DEF0];
  p_environment = &self->_environment;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v6 = objc_msgSend(v3, "hdsp_notificationContentWithEnvironment:", WeakRetained);

  [v6 setCategoryIdentifier:*MEMORY[0x263F75D88]];
  id v7 = HDSPLocalizedString(@"WIND_DOWN_REMINDER_TITLE");
  [v6 setTitle:v7];

  BOOL v8 = [(HDSPUserNotificationCenter *)self _shouldPostCustomizeFocusNotification];
  if (v8)
  {
    [v6 setCategoryIdentifier:*MEMORY[0x263F75AA8]];
    uint64_t v9 = HDSPLocalizedString(@"SILENCE_NOTIFICATIONS_TITLE");
    [v6 setTitle:v9];

    uint64_t v10 = HKSPSleepFocusConfigurationURL();
    [v6 setDefaultActionURL:v10];

    id v11 = objc_loadWeakRetained((id *)p_environment);
    long long v12 = [v11 behavior];
    char v13 = [v12 isAppleWatch];

    if ((v13 & 1) == 0)
    {
      long long v14 = [MEMORY[0x263F1DF40] iconForApplicationIdentifier:@"com.apple.Preferences"];
      [v6 setIcon:v14];
    }
  }
  long long v15 = [(HDSPUserNotificationCenter *)self _windDownReminderBodyContentShouldIntroduceFocus:v8];
  [v6 setBody:v15];

  uint64_t v16 = objc_msgSend(MEMORY[0x263F1DF68], "hdsp_bedtimeReminderSound");
  [v6 setSound:v16];

  id v17 = objc_loadWeakRetained((id *)p_environment);
  uint64_t v18 = [v17 currentDateProvider];
  uint64_t v19 = v18[2]();
  uint64_t v20 = [v19 dateByAddingTimeInterval:*MEMORY[0x263F75D78]];
  [v6 setExpirationDate:v20];

  return v6;
}

- (BOOL)_shouldPostCustomizeFocusNotification
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  p_environment = &self->_environment;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v4 = [WeakRetained sleepScheduleModelManager];
  id v5 = [v4 sleepScheduleModel];

  id v6 = [v5 sleepEventRecord];
  if ([v6 isConsolidatedSleepCoachingOnboardingCompleted])
  {
    id v7 = [v5 sleepSettings];
    if (![v7 scheduledSleepMode])
    {
      BOOL v13 = 0;
LABEL_13:

      goto LABEL_14;
    }
    id v8 = objc_loadWeakRetained((id *)p_environment);
    uint64_t v9 = [v8 sleepModeManager];
    uint64_t v10 = [v9 sleepFocusModeBridge];

    id v18 = 0;
    id v11 = [v10 sleepFocusConfiguration:&v18];
    id v12 = v18;
    if (v11)
    {
      if ([v11 hasSleepFocusMode])
      {
        BOOL v13 = [v11 state] == 1;
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      long long v14 = HKSPLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = objc_opt_class();
        *(_DWORD *)long long buf = 138543618;
        uint64_t v20 = v16;
        __int16 v21 = 2114;
        id v22 = v12;
        id v17 = v16;
        _os_log_error_impl(&dword_221A52000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to fetch sleep focus configuration with error: %{public}@", buf, 0x16u);
      }
    }
    BOOL v13 = 0;
    goto LABEL_12;
  }
  BOOL v13 = 0;
LABEL_14:

  return v13;
}

- (id)_windDownReminderBodyContentShouldIntroduceFocus:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v6 = [WeakRetained sleepScheduleModelManager];
  id v7 = [v6 sleepEventRecord];

  int v8 = [v7 isAnySleepCoachingOnboardingCompleted];
  if (v8) {
    uint64_t v9 = @"WIND_DOWN_REMINDER_MESSAGE";
  }
  else {
    uint64_t v9 = @"WIND_DOWN_REMINDER_MESSAGE_PRE_ONBOARDING";
  }
  uint64_t v10 = (void *)MEMORY[0x263F75C18];
  if (!v8) {
    uint64_t v10 = (void *)MEMORY[0x263F75C40];
  }
  id v11 = [(HDSPUserNotificationCenter *)self _localizedBedtimeOrWindDownReminderBodyWithKey:v9 embeddingTimeForEvent:*v10 shouldIntroduceFocus:v3];

  return v11;
}

- (id)_localizedBedtimeOrWindDownReminderBodyWithKey:(id)a3 embeddingTimeForEvent:(id)a4 shouldIntroduceFocus:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  if (([v10 isEqualToString:*MEMORY[0x263F75C18]] & 1) == 0
    && ([v10 isEqualToString:*MEMORY[0x263F75C40]] & 1) == 0)
  {
    long long v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"HDSPUserNotificationCenter.m" lineNumber:338 description:@"This method can only be used to format localized strings containing bedtime or wakeUp times."];

    if (v5) {
      goto LABEL_4;
    }
LABEL_8:
    uint64_t v13 = [(HDSPUserNotificationCenter *)self _localizedBedtimeOrWindDownReminderBodyHelperWithKey:v9 embeddingTimeForEvent:v10];
    goto LABEL_9;
  }
  if (!v5) {
    goto LABEL_8;
  }
LABEL_4:
  id v11 = HKSPLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543362;
    id v18 = (id)objc_opt_class();
    id v12 = v18;
    _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Preparing focus introduction notification", (uint8_t *)&v17, 0xCu);
  }
  uint64_t v13 = HDSPLocalizedString(@"SLEEP_FOCUS_INTRO");
LABEL_9:
  long long v15 = (void *)v13;

  return v15;
}

- (id)_localizedBedtimeOrWindDownReminderBodyHelperWithKey:(id)a3 embeddingTimeForEvent:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v9 = [WeakRetained sleepScheduleModelManager];
  id v10 = [v9 sleepScheduleModel];

  id v11 = objc_loadWeakRetained((id *)&self->_environment);
  id v12 = [v11 currentDateProvider];
  uint64_t v13 = v12[2]();

  long long v14 = [v10 nextEventWithIdentifier:v7 dueAfterDate:v13];
  if (v14)
  {
    long long v15 = [MEMORY[0x263F08790] localizedStringFromDate:v14 dateStyle:0 timeStyle:1];
    id v41 = v6;
    id v16 = v6;
    int v17 = [MEMORY[0x263EFF8F0] currentCalendar];
    int v18 = objc_msgSend(v17, "hksp_dateRequiresSingularTimeString:", v14);

    v39 = v10;
    id v40 = v7;
    if (v18)
    {
      uint64_t v19 = [v16 stringByAppendingString:@"_SINGULAR"];

      id v16 = (id)v19;
    }
    uint64_t v20 = HDSPLocalizedString(v16);
    id v42 = 0;
    __int16 v21 = [MEMORY[0x263F089D8] stringWithValidatedFormat:v20, @"%@", &v42, v15 validFormatSpecifiers error];
    id v22 = v42;
    uint64_t v23 = v22;
    if (v21)
    {
      v38 = v13;
      id v24 = v22;
      NSUInteger v25 = [v21 localizedStandardRangeOfString:v15];
      NSUInteger v27 = v26;
      uint64_t v28 = [v21 localizedStandardRangeOfString:@".."];
      if (v27)
      {
        NSUInteger v30 = v29;
        if (v29)
        {
          NSUInteger v31 = v28;
          v51.id location = v25;
          v51.length = v27;
          v52.id location = v31;
          v52.length = v30;
          if (NSIntersectionRange(v51, v52).length) {
            objc_msgSend(v21, "replaceCharactersInRange:withString:", v31, v30, @".");
          }
        }
      }
      v32 = (__CFString *)[v21 copy];
      uint64_t v23 = v24;
      uint64_t v13 = v38;
    }
    else
    {
      v33 = HKSPLogForCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v36 = objc_opt_class();
        *(_DWORD *)long long buf = 138543874;
        id v44 = v36;
        __int16 v45 = 2114;
        id v46 = v20;
        __int16 v47 = 2114;
        id v48 = v23;
        id v37 = v36;
        _os_log_error_impl(&dword_221A52000, v33, OS_LOG_TYPE_ERROR, "[%{public}@] Unexpected format specifier in \"%{public}@\": %{public}@", buf, 0x20u);
      }
      v32 = &stru_26D3FAEE0;
    }

    id v7 = v40;
    id v6 = v41;
    id v10 = v39;
  }
  else
  {
    long long v15 = HKSPLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543874;
      id v44 = (id)objc_opt_class();
      __int16 v45 = 2114;
      id v46 = v7;
      __int16 v47 = 2114;
      id v48 = v6;
      id v35 = v44;
      _os_log_error_impl(&dword_221A52000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to find next event with identifier %{public}@ for message %{public}@", buf, 0x20u);
    }
    v32 = &stru_26D3FAEE0;
  }

  return v32;
}

- (id)_chargingReminderContentWithUserInfo:(id)a3
{
  id v4 = (void *)MEMORY[0x263F1DEF0];
  p_environment = &self->_environment;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_environment);
  int v8 = objc_msgSend(v4, "hdsp_notificationContentWithEnvironment:", WeakRetained);

  [v8 setCategoryIdentifier:*MEMORY[0x263F75A78]];
  id v9 = HDSPLocalizedString(@"CHARGE_WATCH_TITLE");
  [v8 setTitle:v9];

  id v10 = [v6 objectForKeyedSubscript:*MEMORY[0x263F75A70]];
  uint64_t v11 = [v10 BOOLValue];
  id v12 = [v6 objectForKeyedSubscript:*MEMORY[0x263F75A88]];

  uint64_t v13 = -[HDSPUserNotificationCenter _chargingReminderBodyForAlarmEnabled:sleepTrackingEnabled:](self, "_chargingReminderBodyForAlarmEnabled:sleepTrackingEnabled:", v11, [v12 BOOLValue]);
  [v8 setBody:v13];

  long long v14 = objc_msgSend(MEMORY[0x263F1DF68], "hdsp_chargingReminderSound");
  [v8 setSound:v14];

  return v8;
}

- (id)_chargingReminderBodyForAlarmEnabled:(BOOL)a3 sleepTrackingEnabled:(BOOL)a4
{
  id v4 = @"CHARGE_WATCH_NO_ALARM_OR_SLEEP_TRACKING_MESSAGE";
  if (a4) {
    id v4 = @"CHARGE_WATCH_SLEEP_TRACKING_MESSAGE";
  }
  if (a3) {
    BOOL v5 = @"CHARGE_WATCH_ALARM_MESSAGE";
  }
  else {
    BOOL v5 = v4;
  }
  id v6 = HDSPLocalizedString(v5);

  return v6;
}

- (id)_wakeDetectionContentWithUserInfo:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F75D20];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:v4];
  uint64_t v7 = [v6 BOOLValue];

  int v8 = [v5 objectForKeyedSubscript:*MEMORY[0x263F75D28]];
  uint64_t v9 = [v8 BOOLValue];

  id v10 = (void *)MEMORY[0x263F1DEF0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v12 = objc_msgSend(v10, "hdsp_notificationContentWithEnvironment:", WeakRetained);

  [v12 setCategoryIdentifier:*MEMORY[0x263F75D10]];
  uint64_t v13 = [(HDSPUserNotificationCenter *)self _wakeDetectionAlertTitleForAlarmEnabled:v7 sleepModeOn:v9];
  [v12 setTitle:v13];

  long long v14 = [(HDSPUserNotificationCenter *)self _wakeDetectionAlertBodyForAlarmEnabled:v7 sleepModeOn:v9];
  [v12 setBody:v14];

  long long v15 = objc_msgSend(MEMORY[0x263F1DF68], "hdsp_wakeDetectionSound");
  [v12 setSound:v15];

  [v12 setShouldIgnoreDoNotDisturb:1];
  [v12 setUserInfo:v5];

  return v12;
}

- (id)_wakeDetectionAlertTitleForAlarmEnabled:(BOOL)a3 sleepModeOn:(BOOL)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = @"EARLY_WAKEUP_TITLE_SLEEP_FOCUS";
  if (a3 && a4) {
    uint64_t v4 = @"EARLY_WAKEUP_TITLE_ALARM_AND_SLEEP_FOCUS";
  }
  if (a4) {
    id v5 = v4;
  }
  else {
    id v5 = @"EARLY_WAKEUP_TITLE_ALARM";
  }
  if (!a4 && !a3)
  {
    id v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v9 = v11;
      _os_log_error_impl(&dword_221A52000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] posting wake detection notification with no user actions!", (uint8_t *)&v10, 0xCu);
    }
    id v5 = @"EARLY_WAKEUP_TITLE_NONE";
  }
  uint64_t v7 = HDSPLocalizedString(v5);

  return v7;
}

- (id)_wakeDetectionAlertBodyForAlarmEnabled:(BOOL)a3 sleepModeOn:(BOOL)a4
{
  uint64_t v4 = @"EARLY_WAKEUP_BODY_NONE";
  if (a3) {
    uint64_t v4 = @"EARLY_WAKEUP_BODY_ALARM";
  }
  id v5 = @"EARLY_WAKEUP_BODY_ALARM_AND_SLEEP_FOCUS";
  if (!a3) {
    id v5 = @"EARLY_WAKEUP_BODY_SLEEP_FOCUS";
  }
  if (a4) {
    id v6 = v5;
  }
  else {
    id v6 = v4;
  }
  uint64_t v7 = HDSPLocalizedString(v6);

  return v7;
}

- (id)_wakeUpResultsContentWithUserInfo:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[HDSPWakeUpResultsNotification wakeUpResultsNotificationFromUserInfo:v4];
  id v6 = HKSPLogForCategory();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = objc_opt_class();
      id v9 = v8;
      int v10 = [v5 categoryIdentifier];
      int v25 = 138543618;
      id v26 = v8;
      __int16 v27 = 2114;
      id v28 = v10;
      _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Creating content for %{public}@", (uint8_t *)&v25, 0x16u);
    }
    id v11 = [HDSPWakeUpResultsNotificationLocalizer alloc];
    p_environment = &self->_environment;
    id WeakRetained = objc_loadWeakRetained((id *)p_environment);
    long long v14 = [WeakRetained healthStoreProvider];
    long long v15 = [v14 healthStore];
    uint64_t v7 = [(HDSPWakeUpResultsNotificationLocalizer *)v11 initWithNotification:v5 healthStore:v15];

    id v16 = (void *)MEMORY[0x263F1DEF0];
    id v17 = objc_loadWeakRetained((id *)p_environment);
    int v18 = objc_msgSend(v16, "hdsp_notificationContentWithEnvironment:", v17);

    uint64_t v19 = [v5 categoryIdentifier];
    [v18 setCategoryIdentifier:v19];

    uint64_t v20 = [v7 localizedTitle];
    [v18 setTitle:v20];

    __int16 v21 = [v7 localizedBody];
    [v18 setBody:v21];

    id v22 = objc_msgSend(MEMORY[0x263F1DF68], "hdsp_wakeUpResultsSound");
    [v18 setSound:v22];

    [v18 setUserInfo:v4];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v25 = 138543618;
      id v26 = (id)objc_opt_class();
      __int16 v27 = 2112;
      id v28 = v4;
      id v24 = v26;
      _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Cannot create content for wake up results without valid data: %@", (uint8_t *)&v25, 0x16u);
    }
    int v18 = 0;
  }

  return v18;
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);

  objc_destroyWeak((id *)&self->_environment);
}

@end