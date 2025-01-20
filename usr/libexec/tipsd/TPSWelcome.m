@interface TPSWelcome
+ (void)resetWelcomeNotifications;
- (BOOL)isReminderCompleted;
- (BOOL)setupCompleted;
- (BOOL)shouldShowWelcomeNotification;
- (BOOL)stopWelcomeNotification;
- (BOOL)welcomeXPCActivityScheduleInProgress;
- (TPSNotificationController)notificationController;
- (TPSTipsManager)tipsManager;
- (TPSWelcome)initWithDelegate:(id)a3 tipsManager:(id)a4 notificationController:(id)a5;
- (TPSWelcomeDelegate)delegate;
- (id)getCurrentWelcomeActivityCriteria;
- (unint64_t)reminderState;
- (void)createWelcomeXPCActivity;
- (void)reconnectWelcomeIfNeeded:(BOOL)a3;
- (void)registerToNotifyWelcome;
- (void)scheduleWelcomeNotificationActivity;
- (void)setDelegate:(id)a3;
- (void)setNotificationController:(id)a3;
- (void)setTipsManager:(id)a3;
- (void)setWelcomeXPCActivityScheduleInProgress:(BOOL)a3;
- (void)welcomeNotificationDisplayed;
@end

@implementation TPSWelcome

- (BOOL)stopWelcomeNotification
{
  v3 = +[NSUserDefaults standardUserDefaults];
  v4 = [v3 objectForKey:@"TPSCurrentWelcomeXPCActivityIdentifier"];
  v5 = v4;
  if (v4) {
    xpc_activity_unregister((const char *)[v4 UTF8String]);
  }
  BOOL v6 = [(TPSWelcome *)self shouldShowWelcomeNotification];
  if (v6)
  {
    v7 = +[TPSLogger welcome];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Stop any welcome reminder flow.", v11, 2u);
    }
  }
  [v3 setObject:&off_100021B98 forKey:@"TPSWelcomeNotificationReminderState"];
  v8 = +[TPSCommonDefines sharedInstance];
  v9 = [v8 majorVersion];
  [v3 setObject:v9 forKey:@"TPSWelcomeNotificationViewedVersion"];

  [v3 removeObjectForKey:@"TPSWaitingToShowWelcomeNotification"];
  [v3 removeObjectForKey:@"TPSCurrentWelcomeXPCActivityIdentifier"];
  [v3 synchronize];

  return v6;
}

- (BOOL)shouldShowWelcomeNotification
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = +[NSUserDefaults standardUserDefaults];
  v4 = [v3 objectForKey:@"TPSWelcomeNotificationViewedVersion"];
  unsigned int v5 = [v4 intValue];

  if ((v5 & 0x80000000) != 0)
  {
LABEL_7:
    int v9 = 0;
    goto LABEL_8;
  }
  BOOL v6 = +[TPSCommonDefines sharedInstance];
  v7 = [v6 majorVersion];
  unsigned int v8 = [v7 intValue];

  if (v5 != v8)
  {
    v10 = +[TPSLogger welcome];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Major version changed", v15, 2u);
    }

    [v2 setObject:&off_100021B68 forKey:@"TPSWelcomeNotificationViewedVersion"];
    [v2 setObject:&off_100021B80 forKey:@"TPSWelcomeNotificationReminderState"];
    [v2 removeObjectForKey:@"TPSNoMoreTipsContent"];
    [v2 removeObjectForKey:@"TPSWaitingToShowWelcomeNotification"];
    [v2 removeObjectForKey:@"TPSCurrentWelcomeXPCActivityIdentifier"];
    [v2 removeObjectForKey:@"TPSWelcomeNotificationStartDate"];
    [v2 synchronize];
    goto LABEL_7;
  }
  int v9 = 1;
LABEL_8:
  v11 = +[TPSDefaultsManager notificationDocument];

  if (v11
    || ((v9 | +[TPSNotificationController supportsWelcomeNotification] ^ 1) & 1) != 0)
  {
    BOOL v12 = 0;
  }
  else
  {
    v14 = [v2 objectForKey:@"TPSWelcomeNotificationReminderState"];
    BOOL v12 = [v14 unsignedIntegerValue] == 0;
  }
  return v12;
}

+ (void)resetWelcomeNotifications
{
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setObject:&off_100021B50 forKey:@"TPSWelcomeNotificationViewedVersion"];
  [v4 synchronize];
  v2 = +[TPSCommonDefines sharedInstance];
  v3 = [v2 appGroupDefaults];

  [v3 removeObjectForKey:@"collectionStatusMap"];
  [v3 synchronize];
}

- (TPSWelcome)initWithDelegate:(id)a3 tipsManager:(id)a4 notificationController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TPSWelcome;
  v11 = [(TPSWelcome *)&v17 init];
  BOOL v12 = v11;
  if (v11)
  {
    [(TPSWelcome *)v11 setDelegate:v8];
    objc_storeStrong((id *)&v12->_tipsManager, a4);
    objc_storeStrong((id *)&v12->_notificationController, a5);
    v13 = +[NSUserDefaults standardUserDefaults];
    if (+[TPSDefaultsManager resetDaemonData])
    {
      [v13 setObject:&off_100021B50 forKey:@"TPSWelcomeNotificationViewedVersion"];
      [v13 removeObjectForKey:@"TPSWelcomeNotificationReminderState"];
      v14 = +[TPSCommonDefines sharedInstance];
      v15 = [v14 appGroupDefaults];

      [v15 removeObjectForKey:@"collectionStatusMap"];
    }
  }
  return v12;
}

- (unint64_t)reminderState
{
  if (!+[TPSNotificationController supportsWelcomeNotification])return 1; {
  v2 = +[NSUserDefaults standardUserDefaults];
  }
  v3 = [v2 objectForKey:@"TPSWelcomeNotificationReminderState"];
  id v4 = [v3 unsignedIntegerValue];

  return (unint64_t)v4;
}

- (void)reconnectWelcomeIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(TPSWelcome *)self shouldShowWelcomeNotification]
    && [(TPSWelcome *)self setupCompleted])
  {
    unsigned int v5 = +[NSUserDefaults standardUserDefaults];
    if ([v5 BOOLForKey:@"TPSWaitingToShowWelcomeNotification"])
    {
      [(TPSWelcome *)self registerToNotifyWelcome];
    }
    else
    {
      BOOL v6 = [v5 objectForKey:@"TPSCurrentWelcomeXPCActivityIdentifier"];
      if (v6 && ![(TPSWelcome *)self welcomeXPCActivityScheduleInProgress])
      {
        v7 = +[TPSLogger welcome];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Re-register for xpc_activity to show welcome notification", buf, 2u);
        }

        [(TPSWelcome *)self setWelcomeXPCActivityScheduleInProgress:1];
        id v8 = v6;
        id v9 = (const char *)[v8 UTF8String];
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_100005B8C;
        v10[3] = &unk_1000209F8;
        v10[4] = self;
        id v11 = v8;
        xpc_activity_register(v9, XPC_ACTIVITY_CHECK_IN, v10);
      }
      else if (v3)
      {
        [(TPSWelcome *)self scheduleWelcomeNotificationActivity];
      }
    }
  }
}

- (BOOL)isReminderCompleted
{
  return (id)[(TPSWelcome *)self reminderState] == (id)1;
}

- (id)getCurrentWelcomeActivityCriteria
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  +[TPSDefaultsManager welcomeNotificationDelay];
  if ((uint64_t)v3 >= 1) {
    int64_t v4 = (uint64_t)v3;
  }
  else {
    int64_t v4 = 3 * XPC_ACTIVITY_INTERVAL_1_HOUR;
  }
  +[TPSDefaultsManager welcomeNotificationGracePeriod];
  double v6 = v5;
  v7 = +[NSUserDefaults standardUserDefaults];
  id v8 = [v7 objectForKey:@"TPSWelcomeNotificationStartDate"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = +[NSDate date];
    [v9 timeIntervalSinceDate:v8];
    double v11 = v10;

    int64_t v4 = (uint64_t)((double)v4 - v11);
  }
  if ((uint64_t)v6 >= 1) {
    int64_t v12 = (uint64_t)v6;
  }
  else {
    int64_t v12 = 2 * XPC_ACTIVITY_INTERVAL_1_HOUR;
  }
  if (v4 >= 1) {
    int64_t v13 = v4;
  }
  else {
    int64_t v13 = XPC_ACTIVITY_INTERVAL_30_MIN;
  }
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_DELAY, v13);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_GRACE_PERIOD, v12);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);

  return v2;
}

- (void)scheduleWelcomeNotificationActivity
{
  if (![(TPSWelcome *)self reminderState]
    && ![(TPSWelcome *)self welcomeXPCActivityScheduleInProgress]
    && [(TPSWelcome *)self shouldShowWelcomeNotification])
  {
    double v3 = +[NSUserDefaults standardUserDefaults];
    unsigned int v4 = [v3 BOOLForKey:@"TPSWaitingToShowWelcomeNotification"];

    if (v4)
    {
      [(TPSWelcome *)self registerToNotifyWelcome];
    }
    else
    {
      unsigned int v5 = [(TPSWelcome *)self setupCompleted];
      double v6 = +[TPSLogger welcome];
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v7)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User is not in setup, proceed to schedule welcome notification", buf, 2u);
        }

        [(TPSWelcome *)self createWelcomeXPCActivity];
      }
      else
      {
        if (v7)
        {
          *(_WORD *)id v8 = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User currently in Setup, wait before registering for welcome notification", v8, 2u);
        }
      }
    }
  }
}

- (void)createWelcomeXPCActivity
{
  if (![(TPSWelcome *)self welcomeXPCActivityScheduleInProgress]
    && [(TPSWelcome *)self shouldShowWelcomeNotification])
  {
    double v3 = +[NSUserDefaults standardUserDefaults];
    unsigned int v4 = [v3 objectForKey:@"TPSCurrentWelcomeXPCActivityIdentifier"];
    unsigned int v5 = [v3 objectForKey:@"TPSWelcomeNotificationReminderState"];
    uint64_t v6 = (int)[v5 intValue];

    BOOL v7 = +[NSString stringWithFormat:@"com.apple.tipsd.showWelcomeNotification.reminderCount-%zd", v6];
    if ([v7 isEqualToString:v4])
    {
      [(TPSWelcome *)self reconnectWelcomeIfNeeded:0];
    }
    else
    {
      [(TPSWelcome *)self setWelcomeXPCActivityScheduleInProgress:1];
      id v8 = [(TPSWelcome *)self delegate];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100006228;
      v9[3] = &unk_100020A48;
      id v10 = v3;
      id v11 = v7;
      int64_t v12 = self;
      [v8 welcome:self contentAvailableRemotelyWithCompletionHandler:v9];
    }
  }
}

- (BOOL)setupCompleted
{
  int HasCompletedInitialRun = BYSetupAssistantHasCompletedInitialRun();
  if (HasCompletedInitialRun) {
    LOBYTE(HasCompletedInitialRun) = BYSetupAssistantNeedsToRun() ^ 1;
  }
  return HasCompletedInitialRun;
}

- (void)registerToNotifyWelcome
{
  if ([(TPSWelcome *)self setupCompleted])
  {
    double v3 = +[NSUserDefaults standardUserDefaults];
    if ([(TPSWelcome *)self shouldShowWelcomeNotification])
    {
      unsigned int v4 = [(TPSWelcome *)self tipsManager];
      unsigned int v5 = [v4 welcomeDocumentFromContentPackage:0];

      if (v5)
      {
        if (([v3 BOOLForKey:@"TPSWaitingToShowWelcomeNotification"] & 1) == 0)
        {
          [v3 setBool:1 forKey:@"TPSWaitingToShowWelcomeNotification"];
          [v3 synchronize];
        }
        uint64_t v6 = +[TPSLogger welcome];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v8 = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Register for empty lock screen for welcome notification", v8, 2u);
        }

        BOOL v7 = [(TPSWelcome *)self delegate];
        [v7 welcome:self notifyWelcomeDocument:v5];
      }
    }
    else
    {
      [v3 setBool:0 forKey:@"TPSWaitingToShowWelcomeNotification"];
      [v3 synchronize];
    }
  }
}

- (void)welcomeNotificationDisplayed
{
  unint64_t v3 = [(TPSWelcome *)self reminderState];
  unsigned int v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setBool:0 forKey:@"TPSWaitingToShowWelcomeNotification"];

  unsigned int v5 = +[NSUserDefaults standardUserDefaults];
  uint64_t v6 = +[NSNumber numberWithUnsignedInteger:v3 + 1];
  [v5 setObject:v6 forKey:@"TPSWelcomeNotificationReminderState"];

  BOOL v7 = +[TPSLogger welcome];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v3 == -1)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Schedule welcome notification", buf, 2u);
    }

    [(TPSWelcome *)self scheduleWelcomeNotificationActivity];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notification reminder ended", v15, 2u);
    }

    id v9 = +[NSUserDefaults standardUserDefaults];
    [v9 removeObjectForKey:@"TPSCurrentWelcomeXPCActivityIdentifier"];

    id v10 = +[NSUserDefaults standardUserDefaults];
    id v11 = +[TPSCommonDefines sharedInstance];
    int64_t v12 = [v11 majorVersion];
    [v10 setObject:v12 forKey:@"TPSWelcomeNotificationViewedVersion"];

    int64_t v13 = +[NSUserDefaults standardUserDefaults];
    [v13 synchronize];
  }
  v14 = +[NSUserDefaults standardUserDefaults];
  [v14 synchronize];
}

- (TPSWelcomeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TPSWelcomeDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)welcomeXPCActivityScheduleInProgress
{
  return self->_welcomeXPCActivityScheduleInProgress;
}

- (void)setWelcomeXPCActivityScheduleInProgress:(BOOL)a3
{
  self->_welcomeXPCActivityScheduleInProgress = a3;
}

- (TPSTipsManager)tipsManager
{
  return self->_tipsManager;
}

- (void)setTipsManager:(id)a3
{
}

- (TPSNotificationController)notificationController
{
  return self->_notificationController;
}

- (void)setNotificationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationController, 0);
  objc_storeStrong((id *)&self->_tipsManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end