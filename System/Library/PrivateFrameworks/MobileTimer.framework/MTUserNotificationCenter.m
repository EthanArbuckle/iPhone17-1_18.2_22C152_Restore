@interface MTUserNotificationCenter
+ (id)_allIdentifiersForAlarm:(id)a3;
+ (id)_allIdentifiersForAlarm:(id)a3 includeMainIdentifier:(BOOL)a4;
+ (id)_allIdentifiersForAlarm:(id)a3 includeMainIdentifier:(BOOL)a4 includeSnooze:(BOOL)a5;
+ (id)_durationComponentsFormatter;
+ (id)_goToBedIdentifier:(id)a3;
+ (id)_mutableContentForScheduledAlarmWithCommonSettings:(id)a3;
+ (id)_snoozeCountdownIdentifier:(id)a3;
+ (id)_timeFormatter;
+ (id)_wakeUpAlarmStringForAlarm:(id)a3;
+ (id)categoryForScheduledAlarm:(id)a3;
+ (id)categoryForScheduledTimer:(id)a3;
+ (id)contentForScheduledAlarm:(id)a3;
+ (id)contentForScheduledTimer:(id)a3;
+ (id)launchURLForScheme:(id)a3;
+ (id)notificationPrefixes;
+ (id)requestIdentifierForScheduledAlarm:(id)a3;
+ (id)userInfoForAlarm:(id)a3;
+ (id)userInfoForTimer:(id)a3;
+ (void)_setGoToBedTitleAndBody:(id)a3 forGoToBedNotification:(id)a4;
+ (void)_setSnoozeCountdownTitleAndBody:(id)a3 forSnoozeCountdownNotification:(id)a4;
+ (void)_setSpecificContent:(id)a3 forGoToBedNotification:(id)a4;
+ (void)_setSpecificContent:(id)a3 forNormalScheduledAlarm:(id)a4;
+ (void)_setSpecificContent:(id)a3 forScheduledAlarm:(id)a4;
+ (void)_setSpecificContent:(id)a3 forSnoozeCountdownNotification:(id)a4;
- (MTUserNotificationActionDispatcher)actionHandler;
- (MTUserNotificationCenter)init;
- (NSDictionary)notificationCenters;
- (id)_notificationCenterForScheduledAlarm:(id)a3;
- (id)_notificationCenterForScheduledTimer;
- (id)alarmCategories;
- (id)bedtimeCategories;
- (id)notificationCategories;
- (id)timerCategories;
- (unint64_t)conditionalAlertDestination;
- (unint64_t)conditionalListDestination;
- (unint64_t)conditionalLockScreenDestination;
- (void)dismissNotificationsForAlarm:(id)a3;
- (void)dismissNotificationsForAlarm:(id)a3 dismissAction:(unint64_t)a4;
- (void)dismissNotificationsForAlarm:(id)a3 includeMainIdentifier:(BOOL)a4;
- (void)dismissNotificationsForAlarm:(id)a3 includeMainIdentifier:(BOOL)a4 includeSnooze:(BOOL)a5;
- (void)dismissNotificationsForAlarm:(id)a3 includeSnooze:(BOOL)a4;
- (void)dismissNotificationsForTimer:(id)a3;
- (void)dismissNotificationsWithIdentifiers:(id)a3;
- (void)dismissRelatedNotificationsForScheduledAlarm:(id)a3;
- (void)interruptAudioAndLockDeviceWithCompletionBlock:(id)a3;
- (void)postBedtimeNotificationForAlarm:(id)a3 date:(id)a4;
- (void)postNotificationForScheduledAlarm:(id)a3 completionBlock:(id)a4;
- (void)postNotificationForScheduledAlarm:(id)a3 content:(id)a4 completionBlock:(id)a5;
- (void)postNotificationForScheduledTimer:(id)a3 completionBlock:(id)a4;
- (void)registerActionHandler:(id)a3;
- (void)removeAllDeliveredNotifications;
- (void)setActionHandler:(id)a3;
- (void)setNotificationCenters:(id)a3;
- (void)setupNotificationCenter;
- (void)tearDownNotificationsForEventIdentifiers:(id)a3;
@end

@implementation MTUserNotificationCenter

- (MTUserNotificationCenter)init
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)MTUserNotificationCenter;
  v2 = [(MTUserNotificationCenter *)&v5 init];
  if (v2)
  {
    v3 = MTLogForCategory(3);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v7 = v2;
      _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@...", buf, 0xCu);
    }
  }
  return v2;
}

- (void)setupNotificationCenter
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ setting up notification centers", buf, 0xCu);
  }

  v4 = (void *)[objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:@"com.apple.mobiletimer"];
  objc_super v5 = [(MTUserNotificationCenter *)self notificationCategories];
  v6 = MTLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 count];
    *(_DWORD *)buf = 138543874;
    v13 = self;
    __int16 v14 = 2048;
    uint64_t v15 = v7;
    __int16 v16 = 2114;
    v17 = @"com.apple.mobiletimer";
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ setting %lu categories for %{public}@", buf, 0x20u);
  }

  [v4 setNotificationCategories:v5];
  v10 = @"com.apple.mobiletimer";
  v11 = v4;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  notificationCenters = self->_notificationCenters;
  self->_notificationCenters = v8;
}

- (void)registerActionHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_actionHandler, a3);
  v6 = [(NSDictionary *)self->_notificationCenters allValues];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__MTUserNotificationCenter_registerActionHandler___block_invoke;
  v9[3] = &unk_1E5916ED8;
  v9[4] = self;
  objc_msgSend(v6, "na_each:", v9);

  uint64_t v7 = MTLogForCategory(3);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    actionHandler = self->_actionHandler;
    *(_DWORD *)buf = 138543618;
    v11 = self;
    __int16 v12 = 2114;
    v13 = actionHandler;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ handling responses with %{public}@", buf, 0x16u);
  }
}

void __50__MTUserNotificationCenter_registerActionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16);
  id v3 = a2;
  [v3 setDelegate:v2];
  [v3 setWantsNotificationResponsesDelivered];
}

- (id)alarmCategories
{
  v34[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v30 = [v2 localizedStringForKey:@"ALARM_STOP_ACTION" value:&stru_1EEDE16C8 table:@"Localizable"];

  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v29 = [v3 localizedStringForKey:@"ALARM_SNOOZE_ACTION" value:&stru_1EEDE16C8 table:@"Localizable"];

  v4 = (void *)MEMORY[0x1E4F445D8];
  id v5 = [MEMORY[0x1E4F445E8] iconWithSystemImageName:@"stop.circle"];
  v6 = [v4 actionWithIdentifier:@"MTAlarmDismissAction" title:v30 options:0 icon:v5];

  uint64_t v7 = (void *)MEMORY[0x1E4F445D8];
  uint64_t v8 = [MEMORY[0x1E4F445E8] iconWithSystemImageName:@"zzz"];
  v28 = [v7 actionWithIdentifier:@"MTAlarmSnoozeAction" title:v29 options:0 icon:v8];

  v9 = (void *)MEMORY[0x1E4F44600];
  v34[0] = v28;
  v34[1] = v6;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  uint64_t v11 = MEMORY[0x1E4F1CBF0];
  __int16 v12 = [v9 categoryWithIdentifier:@"MTAlarmCategory" actions:v10 intentIdentifiers:MEMORY[0x1E4F1CBF0] options:0x141F00003];

  v13 = (void *)MEMORY[0x1E4F44600];
  v33 = v6;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  uint64_t v15 = [v13 categoryWithIdentifier:@"MTAlarmNoSnoozeCategory" actions:v14 intentIdentifiers:v11 options:0x141F00003];

  __int16 v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v17 = [v16 localizedStringForKey:@"SNOOZE_STOP" value:&stru_1EEDE16C8 table:@"Localizable"];

  uint64_t v18 = (void *)MEMORY[0x1E4F445D8];
  v19 = [MEMORY[0x1E4F445E8] iconWithSystemImageName:@"stop.circle"];
  v20 = [v18 actionWithIdentifier:@"MTAlarmDismissAction" title:v17 options:0 icon:v19];

  v21 = (void *)MEMORY[0x1E4F445A0];
  v32 = v20;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  v23 = [v21 categoryWithIdentifier:@"AlarmSnoozeCountdown" actions:v22 intentIdentifiers:v11 options:131073];

  [v23 setListPriority:1];
  v24 = (void *)MEMORY[0x1E4F1CAD0];
  v31[0] = v12;
  v31[1] = v15;
  v31[2] = v23;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];
  v26 = [v24 setWithArray:v25];

  return v26;
}

- (id)timerCategories
{
  v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"TIMER_STOP_ACTION" value:&stru_1EEDE16C8 table:@"Localizable"];

  v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"TIMER_REPEAT_ACTION" value:&stru_1EEDE16C8 table:@"Localizable"];

  v6 = [MEMORY[0x1E4F445D8] actionWithIdentifier:@"MTTimerDismissAction" title:v3 options:0];
  uint64_t v7 = [MEMORY[0x1E4F445D8] actionWithIdentifier:@"MTTimerRepeatAction" title:v5 options:0];
  uint64_t v8 = (void *)MEMORY[0x1E4F44600];
  v16[0] = v6;
  v16[1] = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v10 = [v8 categoryWithIdentifier:@"MTTimerCategory" actions:v9 intentIdentifiers:MEMORY[0x1E4F1CBF0] options:0x141F00003];

  uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = v10;
  __int16 v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v13 = [v11 setWithArray:v12];

  return v13;
}

- (id)bedtimeCategories
{
  v35[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v31 = [v2 localizedStringForKey:@"BEDTIME_GO_TO_BED_ACTION" value:&stru_1EEDE16C8 table:@"Localizable"];

  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v30 = [v3 localizedStringForKey:@"BEDTIME_SNOOZE_ACTION" value:&stru_1EEDE16C8 table:@"Localizable"];

  v29 = [MEMORY[0x1E4F445D8] actionWithIdentifier:@"MTAlarmGoToBedAction" title:v31 options:0];
  v28 = [MEMORY[0x1E4F445D8] actionWithIdentifier:@"MTAlarmSnoozeAction" title:v30 options:0];
  v4 = (void *)MEMORY[0x1E4F44600];
  v35[0] = v28;
  v35[1] = v29;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  uint64_t v6 = MEMORY[0x1E4F1CBF0];
  v27 = objc_msgSend(v4, "categoryWithIdentifier:actions:intentIdentifiers:options:", @"MTBedtimeAlarmCategory", v5);

  uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"ALARM_STOP_ACTION" value:&stru_1EEDE16C8 table:@"Localizable"];

  v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"ALARM_SNOOZE_ACTION" value:&stru_1EEDE16C8 table:@"Localizable"];

  uint64_t v11 = (void *)MEMORY[0x1E4F445D8];
  __int16 v12 = [MEMORY[0x1E4F445E8] iconWithSystemImageName:@"stop.circle"];
  v13 = [v11 actionWithIdentifier:@"MTAlarmDismissAction" title:v8 options:0 icon:v12];

  uint64_t v14 = (void *)MEMORY[0x1E4F445D8];
  uint64_t v15 = [MEMORY[0x1E4F445E8] iconWithSystemImageName:@"zzz"];
  __int16 v16 = [v14 actionWithIdentifier:@"MTAlarmSnoozeAction" title:v10 options:0 icon:v15];

  v17 = (void *)MEMORY[0x1E4F44600];
  v34[0] = v16;
  v34[1] = v13;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  v19 = [v17 categoryWithIdentifier:@"MTWakeUpAlarmCategory" actions:v18 intentIdentifiers:v6 options:0x141F00003];

  v20 = (void *)MEMORY[0x1E4F44600];
  v33 = v13;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v22 = [v20 categoryWithIdentifier:@"MTWakeUpAlarmNoSnoozeCategory" actions:v21 intentIdentifiers:v6 options:0x141F00003];

  v23 = (void *)MEMORY[0x1E4F1CA80];
  v32[0] = v27;
  v32[1] = v19;
  v32[2] = v22;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
  v25 = [v23 setWithArray:v24];

  return v25;
}

- (id)notificationCategories
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  v4 = [(MTUserNotificationCenter *)self alarmCategories];
  [v3 unionSet:v4];

  id v5 = [(MTUserNotificationCenter *)self timerCategories];
  [v3 unionSet:v5];

  uint64_t v6 = [(MTUserNotificationCenter *)self bedtimeCategories];
  [v3 unionSet:v6];

  return v3;
}

- (id)_notificationCenterForScheduledAlarm:(id)a3
{
  return [(NSDictionary *)self->_notificationCenters objectForKeyedSubscript:@"com.apple.mobiletimer"];
}

- (void)postNotificationForScheduledAlarm:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() contentForScheduledAlarm:v7];
  [(MTUserNotificationCenter *)self postNotificationForScheduledAlarm:v7 content:v8 completionBlock:v6];
}

- (unint64_t)conditionalAlertDestination
{
  return +[MTUtilities mtSBUIIsSystemApertureEnabled] ^ 1;
}

- (unint64_t)conditionalListDestination
{
  if (+[MTUtilities mtSBUIIsSystemApertureEnabled]) {
    return 2;
  }
  else {
    return 6;
  }
}

- (unint64_t)conditionalLockScreenDestination
{
  if (+[MTUtilities mtSBUIIsSystemApertureEnabled]) {
    return 0;
  }
  else {
    return 2;
  }
}

- (void)postNotificationForScheduledAlarm:(id)a3 content:(id)a4 completionBlock:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = MTLogForCategory(3);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v32 = self;
    __int16 v33 = 2114;
    id v34 = v8;
    _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ firing %{public}@", buf, 0x16u);
  }

  __int16 v12 = [(id)objc_opt_class() requestIdentifierForScheduledAlarm:v8];
  v13 = [v8 trigger];
  BOOL v14 = [v13 triggerType] == 6;

  if (v14)
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F44628], "requestWithIdentifier:content:trigger:destinations:", v12, v9, 0, -[MTUserNotificationCenter conditionalLockScreenDestination](self, "conditionalLockScreenDestination"));
  }
  else
  {
    __int16 v16 = [v8 trigger];
    int v17 = [v16 isForNotification];

    uint64_t v18 = (void *)MEMORY[0x1E4F44628];
    unint64_t v19 = [(MTUserNotificationCenter *)self conditionalAlertDestination];
    unint64_t v20 = [(MTUserNotificationCenter *)self conditionalListDestination];
    if (v17) {
      [v18 requestWithIdentifier:v12 content:v9 trigger:0 destinations:v20 | v19];
    }
    else {
    uint64_t v15 = [v18 requestWithIdentifier:v12 content:v9 trigger:0 destinations:v19 | v20 | 8];
    }
  }
  v21 = (void *)v15;
  objc_initWeak(&location, self);
  kdebug_trace();
  v22 = MTLogForCategory(3);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v32 = self;
    __int16 v33 = 2114;
    id v34 = v21;
    _os_log_impl(&dword_19CC95000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ adding request %{public}@", buf, 0x16u);
  }

  v23 = [(MTUserNotificationCenter *)self _notificationCenterForScheduledAlarm:v8];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __86__MTUserNotificationCenter_postNotificationForScheduledAlarm_content_completionBlock___block_invoke;
  v26[3] = &unk_1E5916F00;
  objc_copyWeak(&v29, &location);
  id v24 = v8;
  id v27 = v24;
  id v25 = v10;
  id v28 = v25;
  [v23 addNotificationRequest:v21 withCompletionHandler:v26];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

void __86__MTUserNotificationCenter_postNotificationForScheduledAlarm_content_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = [*(id *)(a1 + 32) scheduleable];
  if (v3)
  {
    id v6 = MTLogForCategory(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v10 = [v5 alarmID];
      int v11 = 138543874;
      id v12 = WeakRetained;
      __int16 v13 = 2114;
      BOOL v14 = v10;
      __int16 v15 = 2114;
      id v16 = v3;
      _os_log_error_impl(&dword_19CC95000, v6, OS_LOG_TYPE_ERROR, "%{public}@ failed to fire %{public}@ with error %{public}@", (uint8_t *)&v11, 0x20u);
    }
    id v7 = [NSString stringWithFormat:@"Failed to post alarm user notifiation"];
    +[MTAnalytics sendCriticalEvent:v7];
  }
  else
  {
    kdebug_trace();
    id v7 = MTLogForCategory(3);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v5 alarmID];
      int v11 = 138543618;
      id v12 = WeakRetained;
      __int16 v13 = 2114;
      BOOL v14 = v8;
      _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ fired %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
}

- (void)dismissRelatedNotificationsForScheduledAlarm:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MTLogForCategory(3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543618;
    id v16 = self;
    __int16 v17 = 2114;
    id v18 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing related notifications for %{public}@", (uint8_t *)&v15, 0x16u);
  }

  id v6 = [v4 scheduleable];
  id v7 = [v4 trigger];
  int v8 = [v7 isForAlert];

  if (v8)
  {
    uint64_t v9 = [v4 scheduleable];
    [(MTUserNotificationCenter *)self dismissNotificationsForAlarm:v9 includeMainIdentifier:0];
  }
  else
  {
    uint64_t v9 = objc_opt_new();
    id v10 = [v4 trigger];
    int v11 = [v10 isWakeUpRelated];

    if (v11)
    {
      id v12 = objc_opt_class();
      __int16 v13 = [v6 alarmIDString];
      BOOL v14 = [v12 _goToBedIdentifier:v13];
      [v9 addObject:v14];
    }
    [(MTUserNotificationCenter *)self dismissNotificationsWithIdentifiers:v9];
  }
}

+ (id)_allIdentifiersForAlarm:(id)a3
{
  return (id)[a1 _allIdentifiersForAlarm:a3 includeMainIdentifier:1];
}

+ (id)_allIdentifiersForAlarm:(id)a3 includeMainIdentifier:(BOOL)a4
{
  return (id)[a1 _allIdentifiersForAlarm:a3 includeMainIdentifier:a4 includeSnooze:1];
}

+ (id)_allIdentifiersForAlarm:(id)a3 includeMainIdentifier:(BOOL)a4 includeSnooze:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int v8 = objc_opt_new();
  if (v5)
  {
    uint64_t v9 = objc_opt_class();
    id v10 = [v7 alarmIDString];
    int v11 = [v9 _snoozeCountdownIdentifier:v10];
    v20[0] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [v8 addObjectsFromArray:v12];
  }
  if (v6)
  {
    __int16 v13 = [v7 alarmIDString];
    [v8 addObject:v13];
  }
  if ([v7 isSleepAlarm])
  {
    BOOL v14 = objc_opt_class();
    int v15 = [v7 alarmIDString];
    id v16 = [v14 _goToBedIdentifier:v15];
    uint64_t v19 = v16;
    __int16 v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    [v8 addObjectsFromArray:v17];
  }
  return v8;
}

- (void)dismissNotificationsForAlarm:(id)a3
{
}

- (void)dismissNotificationsForAlarm:(id)a3 includeSnooze:(BOOL)a4
{
}

- (void)dismissNotificationsForAlarm:(id)a3 includeMainIdentifier:(BOOL)a4
{
}

- (void)dismissNotificationsForAlarm:(id)a3 includeMainIdentifier:(BOOL)a4 includeSnooze:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = MTLogForCategory(3);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543618;
    id v18 = self;
    __int16 v19 = 2114;
    id v20 = v8;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing any notifications for %{public}@", (uint8_t *)&v17, 0x16u);
  }

  if (v8)
  {
    id v10 = [(id)objc_opt_class() _allIdentifiersForAlarm:v8 includeMainIdentifier:v6 includeSnooze:v5];
    [(MTUserNotificationCenter *)self dismissNotificationsWithIdentifiers:v10];
  }
  else
  {
    id v10 = MTLogForCategory(3);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MTUserNotificationCenter dismissNotificationsForAlarm:includeMainIdentifier:includeSnooze:]((uint64_t)self, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (void)dismissNotificationsForAlarm:(id)a3 dismissAction:(unint64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = MTLogForCategory(3);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = MTDismissAlarmActionDescription(a4);
    *(_DWORD *)buf = 138543874;
    id v25 = self;
    __int16 v26 = 2114;
    id v27 = v6;
    __int16 v28 = 2114;
    id v29 = v8;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing notifications for %{public}@ (%{public}@)", buf, 0x20u);
  }
  if (v6)
  {
    if (a4 - 1 >= 2)
    {
      if (a4 != 6)
      {
        uint64_t v14 = [(id)objc_opt_class() _allIdentifiersForAlarm:v6];
        goto LABEL_12;
      }
      uint64_t v21 = objc_opt_class();
      id v10 = [v6 alarmIDString];
      uint64_t v11 = [v21 _snoozeCountdownIdentifier:v10];
      v22 = v11;
      uint64_t v12 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v13 = &v22;
    }
    else
    {
      uint64_t v9 = objc_opt_class();
      id v10 = [v6 alarmIDString];
      uint64_t v11 = [v9 _goToBedIdentifier:v10];
      v23 = v11;
      uint64_t v12 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v13 = &v23;
    }
    uint64_t v14 = objc_msgSend(v12, "arrayWithObjects:count:", v13, 1, v22, v23);

LABEL_12:
    [(MTUserNotificationCenter *)self dismissNotificationsWithIdentifiers:v14];
    goto LABEL_13;
  }
  uint64_t v14 = MTLogForCategory(3);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[MTUserNotificationCenter dismissNotificationsForAlarm:includeMainIdentifier:includeSnooze:]((uint64_t)self, v14, v15, v16, v17, v18, v19, v20);
  }
LABEL_13:
}

- (void)dismissNotificationsWithIdentifiers:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = MTLogForCategory(3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = self;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing notifications with identifiers %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [(MTUserNotificationCenter *)self tearDownNotificationsForEventIdentifiers:v4];
  +[MTCFUserNotificationPoster cancelNotificationsWithIdentifiers:v4];
}

- (void)tearDownNotificationsForEventIdentifiers:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = MTLogForCategory(3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = self;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ tearDownNotificationsForEventIdentifiers %{public}@", buf, 0x16u);
  }

  int v6 = [(NSDictionary *)self->_notificationCenters allValues];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__MTUserNotificationCenter_tearDownNotificationsForEventIdentifiers___block_invoke;
  v8[3] = &unk_1E5916F98;
  id v9 = v4;
  uint64_t v10 = self;
  id v7 = v4;
  objc_msgSend(v6, "na_each:", v8);
}

void __69__MTUserNotificationCenter_tearDownNotificationsForEventIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__MTUserNotificationCenter_tearDownNotificationsForEventIdentifiers___block_invoke_2;
  v7[3] = &unk_1E5916F70;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = v3;
  id v6 = v3;
  [v6 getDeliveredNotificationsWithCompletionHandler:v7];
}

void __69__MTUserNotificationCenter_tearDownNotificationsForEventIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__MTUserNotificationCenter_tearDownNotificationsForEventIdentifiers___block_invoke_3;
  v8[3] = &unk_1E5916F28;
  id v9 = *(id *)(a1 + 32);
  id v4 = objc_msgSend(a2, "na_filter:", v8);
  uint64_t v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_28);

  id v6 = MTLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    __int16 v13 = v5;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Tearing down %{public}@", buf, 0x16u);
  }

  [*(id *)(a1 + 48) removeDeliveredNotificationsWithIdentifiers:v5];
}

uint64_t __69__MTUserNotificationCenter_tearDownNotificationsForEventIdentifiers___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 request];
  id v4 = [v3 identifier];
  uint64_t v5 = [v4 mtStringByRemovingNotificationDate];

  id v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__MTUserNotificationCenter_tearDownNotificationsForEventIdentifiers___block_invoke_4;
  v10[3] = &unk_1E5914F20;
  id v11 = v5;
  id v7 = v5;
  uint64_t v8 = objc_msgSend(v6, "na_any:", v10);

  return v8;
}

uint64_t __69__MTUserNotificationCenter_tearDownNotificationsForEventIdentifiers___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 mtStringByRemovingNotificationDate];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

id __69__MTUserNotificationCenter_tearDownNotificationsForEventIdentifiers___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 request];
  id v3 = [v2 identifier];

  return v3;
}

- (void)postNotificationForScheduledTimer:(id)a3 completionBlock:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MTLogForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v24 = self;
    __int16 v25 = 2114;
    id v26 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ firing %{public}@", buf, 0x16u);
  }

  id v9 = [v6 scheduleable];
  id v10 = [v9 sound];
  int v11 = [v10 interruptAudio];

  if (v11)
  {
    [(MTUserNotificationCenter *)self interruptAudioAndLockDeviceWithCompletionBlock:v7];
  }
  else
  {
    __int16 v12 = [(id)objc_opt_class() contentForScheduledTimer:v6];
    __int16 v13 = (void *)MEMORY[0x1E4F44628];
    uint64_t v14 = [v9 timerIDString];
    uint64_t v15 = objc_msgSend(v13, "requestWithIdentifier:content:trigger:destinations:", v14, v12, 0, -[MTUserNotificationCenter conditionalAlertDestination](self, "conditionalAlertDestination") | 0xA);

    objc_initWeak(&location, self);
    kdebug_trace();
    uint64_t v16 = MTLogForCategory(4);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v24 = self;
      __int16 v25 = 2114;
      id v26 = v15;
      _os_log_impl(&dword_19CC95000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ adding request %{public}@", buf, 0x16u);
    }

    uint64_t v17 = [(MTUserNotificationCenter *)self _notificationCenterForScheduledTimer];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __78__MTUserNotificationCenter_postNotificationForScheduledTimer_completionBlock___block_invoke;
    v18[3] = &unk_1E5916F00;
    objc_copyWeak(&v21, &location);
    id v19 = v9;
    id v20 = v7;
    [v17 addNotificationRequest:v15 withCompletionHandler:v18];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

void __78__MTUserNotificationCenter_postNotificationForScheduledTimer_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v3)
  {
    uint64_t v5 = MTLogForCategory(4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v9 = [*(id *)(a1 + 32) timerID];
      int v10 = 138543874;
      id v11 = WeakRetained;
      __int16 v12 = 2114;
      __int16 v13 = v9;
      __int16 v14 = 2114;
      id v15 = v3;
      _os_log_error_impl(&dword_19CC95000, v5, OS_LOG_TYPE_ERROR, "%{public}@ failed to fire %{public}@ with error %{public}@", (uint8_t *)&v10, 0x20u);
    }
    id v6 = [NSString stringWithFormat:@"Failed to post timer user notifiation"];
    +[MTAnalytics sendCriticalEvent:v6];
  }
  else
  {
    kdebug_trace();
    id v6 = MTLogForCategory(4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 32) timerID];
      int v10 = 138543618;
      id v11 = WeakRetained;
      __int16 v12 = 2114;
      __int16 v13 = v7;
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ fired %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
}

- (id)_notificationCenterForScheduledTimer
{
  return [(NSDictionary *)self->_notificationCenters objectForKeyedSubscript:@"com.apple.mobiletimer"];
}

- (void)interruptAudioAndLockDeviceWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F7A0F0] mtMainThreadScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__MTUserNotificationCenter_interruptAudioAndLockDeviceWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E59150D0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __75__MTUserNotificationCenter_interruptAudioAndLockDeviceWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [getTUCallCenterClass() sharedInstance];
  uint64_t v3 = [v2 currentCallCount];

  if (!v3
    || v3 == 1
    && ([getTUCallCenterClass() sharedInstance],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 incomingCall],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = MTLogForCategory(4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ interrupting audio", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x2020000000;
    id v8 = (void (*)(uint64_t, void))getMRMediaRemoteSendCommandSymbolLoc_ptr;
    uint64_t v17 = getMRMediaRemoteSendCommandSymbolLoc_ptr;
    if (!getMRMediaRemoteSendCommandSymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      id v19 = __getMRMediaRemoteSendCommandSymbolLoc_block_invoke;
      id v20 = &unk_1E5914EC0;
      id v21 = &v14;
      __getMRMediaRemoteSendCommandSymbolLoc_block_invoke((uint64_t)&buf);
      id v8 = (void (*)(uint64_t, void))v15[3];
    }
    _Block_object_dispose(&v14, 8);
    if (!v8) {
      __75__MTUserNotificationCenter_interruptAudioAndLockDeviceWithCompletionBlock___block_invoke_cold_1();
    }
    v8(1, 0);
    id v9 = MTLogForCategory(4);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ locking device", (uint8_t *)&buf, 0xCu);
    }

    SBSLockDevice();
  }
  else
  {
    id v11 = MTLogForCategory(4);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ not interrupting audio or locking device because we're in a call", (uint8_t *)&buf, 0xCu);
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(result + 16))(result);
  }
  return result;
}

- (void)dismissNotificationsForTimer:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    uint64_t v17 = self;
    __int16 v18 = 2114;
    id v19 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing %{public}@", buf, 0x16u);
  }

  if (v4)
  {
    id v6 = [(MTUserNotificationCenter *)self _notificationCenterForScheduledTimer];
    uint64_t v7 = [v4 timerIDString];
    id v15 = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    [v6 removeDeliveredNotificationsWithIdentifiers:v8];
  }
  else
  {
    id v6 = MTLogForCategory(4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MTUserNotificationCenter dismissNotificationsForTimer:]((uint64_t)self, v6, v9, v10, v11, v12, v13, v14);
    }
  }
}

+ (id)requestIdentifierForScheduledAlarm:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 scheduleable];
  id v6 = [v5 alarmIDString];

  uint64_t v7 = [v4 trigger];
  int v8 = [v7 isForGoToBed];

  if (v8)
  {
    uint64_t v9 = [a1 _goToBedIdentifier:v6];
  }
  else
  {
    uint64_t v10 = [v4 trigger];
    uint64_t v11 = [v10 triggerType];

    if (v11 != 6) {
      goto LABEL_6;
    }
    uint64_t v9 = [a1 _snoozeCountdownIdentifier:v6];
  }
  uint64_t v12 = (void *)v9;

  id v6 = v12;
LABEL_6:
  uint64_t v13 = [v4 trigger];
  uint64_t v14 = [v13 triggerDate];
  id v15 = [v6 mtStringByAppendingNotificationDate:v14];

  return v15;
}

+ (id)_goToBedIdentifier:(id)a3
{
  return (id)[@"MTBedtimeAlarm" stringByAppendingString:a3];
}

+ (id)_snoozeCountdownIdentifier:(id)a3
{
  return (id)[@"MTSnoozeCountdown" stringByAppendingString:a3];
}

+ (id)notificationPrefixes
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"MTBedtimeAlarm";
  v4[1] = @"MTSnoozeCountdown";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

+ (id)contentForScheduledAlarm:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _mutableContentForScheduledAlarmWithCommonSettings:v4];
  [a1 _setSpecificContent:v5 forScheduledAlarm:v4];

  return v5;
}

+ (id)_mutableContentForScheduledAlarmWithCommonSettings:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = [(id)objc_opt_class() categoryForScheduledAlarm:v3];
  [v4 setCategoryIdentifier:v5];

  id v6 = objc_opt_class();
  uint64_t v7 = [v3 scheduleable];
  if ([v7 isSleepAlarm]) {
    int v8 = @"clock-sleep-alarm";
  }
  else {
    int v8 = @"clock-alarm";
  }
  uint64_t v9 = [v6 launchURLForScheme:v8];
  [v4 setDefaultActionURL:v9];

  uint64_t v10 = [(id)objc_opt_class() userInfoForAlarm:v3];

  [v4 setUserInfo:v10];
  return v4;
}

+ (void)_setSpecificContent:(id)a3 forScheduledAlarm:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 trigger];
  int v8 = [v7 isForGoToBed];

  if (v8)
  {
    [a1 _setSpecificContent:v11 forGoToBedNotification:v6];
  }
  else
  {
    uint64_t v9 = [v6 trigger];
    uint64_t v10 = [v9 triggerType];

    if (v10 == 6) {
      [a1 _setSpecificContent:v11 forSnoozeCountdownNotification:v6];
    }
    else {
      [a1 _setSpecificContent:v11 forNormalScheduledAlarm:v6];
    }
  }
}

+ (void)_setSpecificContent:(id)a3 forGoToBedNotification:(id)a4
{
  id v6 = a3;
  [a1 _setGoToBedTitleAndBody:v6 forGoToBedNotification:a4];
  uint64_t v7 = +[MTSound defaultSoundForCategory:2];
  int v8 = [v7 unSoundForCategory:2];
  [v6 setSound:v8];

  uint64_t v9 = +[MTUserDefaults sharedUserDefaults];
  uint64_t v10 = [v9 integerForKey:@"MTBedtimeExpirationDuration" defaultValue:90];

  id v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)(60 * v10)];
  [v6 setExpirationDate:v11];
}

+ (void)_setSpecificContent:(id)a3 forSnoozeCountdownNotification:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [a1 _setSnoozeCountdownTitleAndBody:v7 forSnoozeCountdownNotification:v6];
  [v7 setShouldSuppressScreenLightUp:1];
  [v7 setShouldPreventNotificationDismissalAfterDefaultAction:1];
  [v7 setShouldIgnoreDoNotDisturb:1];
  id v9 = [v6 trigger];

  int v8 = [v9 triggerDate];
  [v7 setExpirationDate:v8];
}

+ (void)_setSpecificContent:(id)a3 forNormalScheduledAlarm:(id)a4
{
  id v5 = a3;
  id v10 = [a4 scheduleable];
  id v6 = [v10 displayTitle];
  [v5 setBody:v6];

  id v7 = [v10 sound];
  if ([v10 isSleepAlarm]) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = [v7 unSoundForCategory:v8];
  [v5 setSound:v9];

  [v5 setShouldIgnoreDoNotDisturb:1];
  [v5 setShouldBackgroundDefaultAction:1];
  [v5 setShouldPreemptPresentedNotification:1];
}

+ (id)_durationComponentsFormatter
{
  if (_durationComponentsFormatter_onceToken != -1) {
    dispatch_once(&_durationComponentsFormatter_onceToken, &__block_literal_global_76);
  }
  uint64_t v2 = (void *)_durationComponentsFormatter_theDurationFormatter;
  return v2;
}

uint64_t __56__MTUserNotificationCenter__durationComponentsFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_durationComponentsFormatter_theDurationFormatter;
  _durationComponentsFormatter_theDurationFormatter = v0;

  [(id)_durationComponentsFormatter_theDurationFormatter setUnitsStyle:3];
  uint64_t v2 = (void *)_durationComponentsFormatter_theDurationFormatter;
  return [v2 setAllowedUnits:96];
}

+ (id)_timeFormatter
{
  if (_timeFormatter_onceToken != -1) {
    dispatch_once(&_timeFormatter_onceToken, &__block_literal_global_79);
  }
  uint64_t v2 = (void *)_timeFormatter__timeFormatter;
  return v2;
}

uint64_t __42__MTUserNotificationCenter__timeFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_timeFormatter__timeFormatter;
  _timeFormatter__timeFormatter = v0;

  uint64_t v2 = (void *)_timeFormatter__timeFormatter;
  return [v2 setTimeStyle:1];
}

+ (void)_setGoToBedTitleAndBody:(id)a3 forGoToBedNotification:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28B50];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"TIME_FOR_BED_TITLE" value:&stru_1EEDE16C8 table:@"Localizable"];
  [v8 setTitle:v10];

  id v11 = [v7 scheduleable];

  id v12 = [a1 _wakeUpAlarmStringForAlarm:v11];

  [v8 setBody:v12];
}

+ (id)_wakeUpAlarmStringForAlarm:(id)a3
{
  id v4 = a3;
  if ([v4 isEnabled])
  {
    id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v6 = [v4 dateComponents];
    id v7 = [v5 dateFromComponents:v6];

    id v8 = [a1 _timeFormatter];
    id v9 = [v8 stringFromDate:v7];

    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"TIME_FOR_BED_ALARM_ON_MESSAGE_FORMAT"];
    id v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    int v12 = [v11 mtDateRequiresSingularTimeString:v7];

    if (v12) {
      [v10 appendString:@"_SINGULAR"];
    }
    uint64_t v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v14 = [v13 localizedStringForKey:v10 value:&stru_1EEDE16C8 table:@"Localizable"];

    id v15 = objc_msgSend(NSString, "stringWithFormat:", v14, v9);
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v15 = [v7 localizedStringForKey:@"TIME_FOR_BED_ALARM_OFF_MESSAGE" value:&stru_1EEDE16C8 table:@"Localizable"];
  }

  return v15;
}

+ (void)_setSnoozeCountdownTitleAndBody:(id)a3 forSnoozeCountdownNotification:(id)a4
{
  id v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  id v7 = [v4 bundleForClass:objc_opt_class()];
  id v6 = [v7 localizedStringForKey:@"ALARM_SNOOZING_TITLE" value:&stru_1EEDE16C8 table:@"Localizable"];
  [v5 setTitle:v6];
}

+ (id)contentForScheduledTimer:(id)a3
{
  id v3 = a3;
  id v4 = [v3 scheduleable];
  id v5 = objc_opt_new();
  id v6 = [v4 displayTitle];
  [v5 setBody:v6];

  id v7 = [v4 sound];
  id v8 = [v7 unSoundForCategory:1];
  [v5 setSound:v8];

  id v9 = [(id)objc_opt_class() categoryForScheduledTimer:v3];
  [v5 setCategoryIdentifier:v9];

  [v5 setShouldIgnoreDoNotDisturb:1];
  id v10 = [(id)objc_opt_class() launchURLForScheme:@"clock-timer"];
  [v5 setDefaultActionURL:v10];

  id v11 = [(id)objc_opt_class() userInfoForTimer:v3];

  [v5 setUserInfo:v11];
  [v5 setShouldBackgroundDefaultAction:1];
  [v5 setShouldPreemptPresentedNotification:1];

  return v5;
}

+ (id)categoryForScheduledAlarm:(id)a3
{
  id v3 = a3;
  id v4 = [v3 trigger];
  uint64_t v5 = [v4 triggerType];

  switch(v5)
  {
    case 0:
    case 1:
      id v6 = [v3 scheduleable];
      int v7 = [v6 allowsSnooze];
      id v8 = MTAlarmCategory;
      id v9 = MTAlarmNoSnoozeCategory;
      goto LABEL_5;
    case 2:
    case 3:
      id v10 = MTBedtimeAlarmCategory;
      goto LABEL_11;
    case 4:
    case 5:
      id v6 = [v3 scheduleable];
      int v7 = [v6 allowsSnooze];
      id v8 = MTWakeUpAlarmCategory;
      id v9 = MTWakeUpAlarmNoSnoozeCategory;
LABEL_5:
      if (!v7) {
        id v8 = v9;
      }
      id v11 = *v8;

      goto LABEL_12;
    case 6:
      id v10 = MTSnoozeAlarmCountdownCategory;
LABEL_11:
      id v11 = *v10;
      goto LABEL_12;
    case 7:
    case 8:
      int v12 = [v3 trigger];
      NSLog(&cfstr_UnexpectedTrig.isa, [v12 triggerType], v3);

      goto LABEL_9;
    default:
LABEL_9:
      id v11 = 0;
LABEL_12:

      return v11;
  }
}

+ (id)categoryForScheduledTimer:(id)a3
{
  id v3 = a3;
  id v4 = [v3 trigger];
  uint64_t v5 = [v4 triggerType];

  if ((unint64_t)(v5 - 1) < 8)
  {
    id v6 = [v3 trigger];
    NSLog(&cfstr_UnexpectedTrig_0.isa, [v6 triggerType], v3);

LABEL_3:
    int v7 = 0;
    goto LABEL_4;
  }
  if (v5) {
    goto LABEL_3;
  }
  int v7 = @"MTTimerCategory";
LABEL_4:

  return v7;
}

+ (id)userInfoForAlarm:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = [v3 trigger];
  id v6 = [v5 triggerDate];

  if (v6) {
    [v4 setObject:v6 forKey:@"MTScheduledFireDate"];
  }
  int v7 = [v3 trigger];
  if ([v7 isScheduled])
  {
    id v8 = [v3 scheduleable];
    int v9 = [v8 allowsSnooze];

    if (v9) {
      [v4 setObject:MEMORY[0x1E4F1CC38] forKey:@"MTSnoozeable"];
    }
  }
  else
  {
  }
  uint64_t v20 = &unk_1EEE11DC0;
  id v10 = [v3 scheduleable];
  id v11 = [v10 alarmIDString];
  v21[0] = v11;
  int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];

  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v13 = (void *)getBLTBulletinContextKeyWatchLegacyMapKeySymbolLoc_ptr;
  uint64_t v19 = getBLTBulletinContextKeyWatchLegacyMapKeySymbolLoc_ptr;
  if (!getBLTBulletinContextKeyWatchLegacyMapKeySymbolLoc_ptr)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __getBLTBulletinContextKeyWatchLegacyMapKeySymbolLoc_block_invoke;
    v15[3] = &unk_1E5914EC0;
    v15[4] = &v16;
    __getBLTBulletinContextKeyWatchLegacyMapKeySymbolLoc_block_invoke((uint64_t)v15);
    uint64_t v13 = (void *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v13) {
    +[MTUserNotificationCenter userInfoForAlarm:]();
  }
  [v4 setObject:v12 forKeyedSubscript:*v13];

  return v4;
}

+ (id)userInfoForTimer:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = (void *)MEMORY[0x1E4F28ED0];
  id v6 = [v3 scheduleable];
  [v6 duration];
  int v7 = objc_msgSend(v5, "numberWithDouble:");
  [v4 setObject:v7 forKey:@"MTTimerDuration"];

  id v8 = [v3 scheduleable];
  int v9 = [v8 title];
  if ([v9 length])
  {
    id v10 = [v3 scheduleable];
    id v11 = [v10 title];
    char v12 = [v11 isEqualToString:@"CURRENT_TIMER"];

    if (v12) {
      goto LABEL_5;
    }
    id v8 = [v3 scheduleable];
    int v9 = [v8 title];
    [v4 setObject:v9 forKey:@"MTTimerUserTitle"];
  }

LABEL_5:
  return v4;
}

+ (id)launchURLForScheme:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = [NSString stringWithFormat:@"%@:%@", a3, @"default"];
  uint64_t v5 = [v3 URLWithString:v4];

  return v5;
}

- (void)removeAllDeliveredNotifications
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    int v7 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ removing all delivered notifications.", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [(MTUserNotificationCenter *)self notificationCenters];
  uint64_t v5 = [v4 allValues];
  objc_msgSend(v5, "na_each:", &__block_literal_global_117);
}

uint64_t __59__MTUserNotificationCenter_removeAllDeliveredNotifications__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeAllDeliveredNotifications];
}

- (void)postBedtimeNotificationForAlarm:(id)a3 date:(id)a4
{
  id v6 = a3;
  int v7 = +[MTTrigger triggerWithDate:a4 triggerType:2];
  id v8 = +[MTScheduledObject scheduledObjectForScheduleable:v6 trigger:v7];

  [(MTUserNotificationCenter *)self postNotificationForScheduledAlarm:v8 completionBlock:0];
}

- (NSDictionary)notificationCenters
{
  return self->_notificationCenters;
}

- (void)setNotificationCenters:(id)a3
{
}

- (MTUserNotificationActionDispatcher)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_notificationCenters, 0);
}

- (void)dismissNotificationsForAlarm:(uint64_t)a3 includeMainIdentifier:(uint64_t)a4 includeSnooze:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __75__MTUserNotificationCenter_interruptAudioAndLockDeviceWithCompletionBlock___block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = objc_msgSend(NSString, "stringWithUTF8String:", "Boolean MTMRMediaRemoteSendCommand(MRMediaRemoteCommand, CFDictionaryRef)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MTUserNotificationCenter.m", 58, @"%s", dlerror());

  __break(1u);
}

- (void)dismissNotificationsForTimer:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)userInfoForAlarm:.cold.1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getBLTBulletinContextKeyWatchLegacyMapKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MTUserNotificationCenter_Internal.h", 17, @"%s", dlerror());

  __break(1u);
}

@end