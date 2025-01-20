@interface NRRepeatingAlertEngineItem
+ (id)launchURL;
- (BOOL)enabled;
- (BOOL)presentAlertWithString:(id)a3;
- (BOOL)shouldTriggerAlertNow;
- (NRMutableDevice)device;
- (NRRepeatingAlertEngineItem)initWithName:(id)a3 strings:(id)a4 maxAcknowledgementCount:(int64_t)a5 reoccurrenceInterval:(double)a6 localizedStrings:(BOOL)a7 userNotificationCenter:(id)a8;
- (NSArray)strings;
- (NSDate)lastAcknowledgedDate;
- (NSString)name;
- (double)reoccurrenceInterval;
- (id)_localizedString:(unint64_t)a3;
- (id)string:(unint64_t)a3 localized:(BOOL)a4;
- (int64_t)acknowledgementCount;
- (int64_t)maxAcknowledgementCount;
- (void)_dismissAlert;
- (void)alertResponseWithResponseFlags:(unint64_t)a3;
- (void)clearNotifications;
- (void)defaultButtonWasPressed;
- (void)dismissAlert;
- (void)dismissAlertAsync;
- (void)loadFromDefaults;
- (void)logAcknowledgement;
- (void)notificationDismissed;
- (void)presentAlertIfEnabledWithString:(id)a3;
- (void)presentUINotifictaionWithString:(id)a3;
- (void)recordButtonPress:(unint64_t)a3;
- (void)resetState;
- (void)saveToDefaults;
- (void)setAcknowledgementCount:(int64_t)a3;
- (void)setDevice:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setLastAcknowledgedDate:(id)a3;
- (void)setMaxAcknowledgementCount:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setReoccurrenceInterval:(double)a3;
- (void)setStrings:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation NRRepeatingAlertEngineItem

- (NRRepeatingAlertEngineItem)initWithName:(id)a3 strings:(id)a4 maxAcknowledgementCount:(int64_t)a5 reoccurrenceInterval:(double)a6 localizedStrings:(BOOL)a7 userNotificationCenter:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  v23.receiver = self;
  v23.super_class = (Class)NRRepeatingAlertEngineItem;
  v17 = [(NRRepeatingAlertEngineItem *)&v23 init];
  v18 = nr_daemon_log();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

  if (v19)
  {
    v20 = nr_daemon_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v14;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "initWithName: %@", buf, 0xCu);
    }
  }
  if (v17)
  {
    if (qword_1001A1408 != -1) {
      dispatch_once(&qword_1001A1408, &stru_100169808);
    }
    objc_storeStrong((id *)&v17->_name, a3);
    objc_storeStrong((id *)&v17->_strings, a4);
    v17->_maxAcknowledgementCount = a5;
    v17->_reoccurrenceInterval = a6;
    v17->_localizedStrings = a7;
    objc_storeStrong((id *)&v17->_notificationCenter, a8);
    [(NRRepeatingAlertEngineItem *)v17 loadFromDefaults];
    [v16 setDelegate:v17];
  }

  return v17;
}

- (void)saveToDefaults
{
  v3 = (void *)CFPreferencesCopyAppValue(@"alertStatus", @"com.apple.NanoRegistry");
  id v4 = [v3 mutableCopy];

  if (self->_enabled)
  {
    if (!v4)
    {
      id v4 = +[NSMutableDictionary dictionary];
    }
    v9[0] = @"acknowledgementCount";
    v5 = +[NSNumber numberWithInteger:self->_acknowledgementCount];
    v9[1] = @"lastAcknowledgedDate";
    v10[0] = v5;
    [(NSDate *)self->_lastAcknowledgedDate timeIntervalSinceReferenceDate];
    v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v10[1] = v6;
    v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
    [v4 setObject:v7 forKeyedSubscript:self->_name];

LABEL_5:
    CFPreferencesSetAppValue(@"alertStatus", v4, @"com.apple.NanoRegistry");
    CFPreferencesAppSynchronize(@"com.apple.NanoRegistry");
    goto LABEL_6;
  }
  if (v4)
  {
    v8 = [v4 objectForKeyedSubscript:self->_name];

    if (v8)
    {
      [v4 removeObjectForKey:self->_name];
      if (![v4 count])
      {

        id v4 = 0;
      }
      goto LABEL_5;
    }
  }
LABEL_6:
}

- (void)loadFromDefaults
{
  id v10 = (id)CFPreferencesCopyAppValue(@"alertStatus", @"com.apple.NanoRegistry");
  v3 = [v10 objectForKeyedSubscript:self->_name];
  id v4 = v3;
  if (v3)
  {
    self->_enabled = 1;
    v5 = [v3 objectForKeyedSubscript:@"acknowledgementCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = [v5 integerValue];
    }
    else {
      id v6 = 0;
    }
    self->_acknowledgementCount = (int64_t)v6;
    v7 = [v4 objectForKeyedSubscript:@"lastAcknowledgedDate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lastAcknowledgedDate = self->_lastAcknowledgedDate;
      self->_lastAcknowledgedDate = v8;
    }
    else
    {
      lastAcknowledgedDate = self->_lastAcknowledgedDate;
      self->_lastAcknowledgedDate = 0;
    }
  }
  else
  {
    self->_enabled = 0;
    v5 = self->_lastAcknowledgedDate;
    self->_acknowledgementCount = 0;
    self->_lastAcknowledgedDate = 0;
  }
}

- (BOOL)shouldTriggerAlertNow
{
  if (!self->_enabled || self->_alert) {
    return 0;
  }
  if (self->_acknowledgementCount < self->_maxAcknowledgementCount)
  {
    if (!self->_lastAcknowledgedDate) {
      return 1;
    }
    id v4 = +[NSDate date];
    [v4 timeIntervalSinceDate:self->_lastAcknowledgedDate];
    double v6 = fabs(v5);
    double reoccurrenceInterval = self->_reoccurrenceInterval;

    if (v6 > reoccurrenceInterval) {
      return 1;
    }
  }
  v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  BOOL result = 0;
  if (v9)
  {
    id v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = +[NSDate date];
      [v11 timeIntervalSinceDate:self->_lastAcknowledgedDate];
      double v14 = self->_reoccurrenceInterval;
      int64_t acknowledgementCount = self->_acknowledgementCount;
      int64_t maxAcknowledgementCount = self->_maxAcknowledgementCount;
      int v16 = 134218752;
      double v17 = fabs(v12);
      __int16 v18 = 2048;
      double v19 = v14;
      __int16 v20 = 2048;
      int64_t v21 = acknowledgementCount;
      __int16 v22 = 2048;
      int64_t v23 = maxAcknowledgementCount;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Skipping enabled alert. Time since last ack: %f; reoccurrenceInterval: %f; ack count: %ld; - maxAckCount - %ld",
        (uint8_t *)&v16,
        0x2Au);
    }
    return 0;
  }
  return result;
}

- (void)presentAlertIfEnabledWithString:(id)a3
{
  if (self->_enabled) {
    [(NRRepeatingAlertEngineItem *)self presentAlertWithString:a3];
  }
}

- (void)resetState
{
  [(NRRepeatingAlertEngineItem *)self dismissAlert];
  self->_enabled = 0;
  lastAcknowledgedDate = self->_lastAcknowledgedDate;
  self->_int64_t acknowledgementCount = 0;
  self->_lastAcknowledgedDate = 0;

  [(NRRepeatingAlertEngineItem *)self saveToDefaults];
}

- (id)_localizedString:(unint64_t)a3
{
  v3 = [(NSArray *)self->_strings objectAtIndexedSubscript:a3];
  id v4 = +[NSBundle bundleWithIdentifier:@"com.apple.private.NanoRegistry"];
  double v5 = +[NSLocale _deviceLanguage];
  double v6 = [v4 localizations];
  double v17 = v5;
  v7 = +[NSArray arrayWithObjects:&v17 count:1];
  v8 = +[NSBundle preferredLocalizationsFromArray:v6 forPreferences:v7];

  BOOL v9 = [v8 firstObject];
  id v10 = nr_daemon_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    double v12 = nr_daemon_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      int v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Language to load: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  v13 = [v4 localizedStringForKey:v3 value:0 table:@"Localizable-tinker" localization:v9];

  return v13;
}

- (id)string:(unint64_t)a3 localized:(BOOL)a4
{
  if (a4) {
    [(NRRepeatingAlertEngineItem *)self _localizedString:a3];
  }
  else {
  id v4 = [(NSArray *)self->_strings objectAtIndexedSubscript:a3];
  }

  return v4;
}

- (void)presentUINotifictaionWithString:(id)a3
{
  self->_alertBeingShown = 1;
  id v4 = objc_alloc_init((Class)UNMutableNotificationContent);
  double v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      *(_DWORD *)buf = 138412290;
      v27 = name;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Posting UINotification from Repeating Engine with name %@", buf, 0xCu);
    }
  }
  BOOL v9 = [(NRRepeatingAlertEngineItem *)self string:4 localized:self->_localizedStrings];
  [v4 setTitle:v9];

  id v10 = [(NRRepeatingAlertEngineItem *)self string:5 localized:self->_localizedStrings];
  [v4 setSubtitle:v10];

  BOOL v11 = [(NRRepeatingAlertEngineItem *)self string:1 localized:self->_localizedStrings];
  [v4 setBody:v11];

  [v4 setCategoryIdentifier:@"NRUserNotifications"];
  double v12 = [(id)objc_opt_class() launchURL];
  v13 = +[NSURL URLWithString:v12];
  double v14 = nr_daemon_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    int v16 = nr_daemon_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "LaunchURL: %@", buf, 0xCu);
    }
  }
  if (v13) {
    [v4 setDefaultActionURL:v13];
  }
  [v4 setShouldBackgroundDefaultAction:1];
  double v17 = +[UNNotificationCategory categoryWithIdentifier:@"DefaultNRCategory" actions:&__NSArray0__struct intentIdentifiers:&__NSArray0__struct options:1];
  [v4 setCategoryIdentifier:@"DefaultNRCategory"];
  __int16 v18 = +[NSSet setWithObject:v17];
  [(UNUserNotificationCenter *)self->_notificationCenter setNotificationCategories:v18];

  double v19 = nr_daemon_log();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

  if (v20)
  {
    int64_t v21 = nr_daemon_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v22 = [(UNUserNotificationCenter *)self->_notificationCenter notificationCategories];
      *(_DWORD *)buf = 138412290;
      v27 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Categories %@", buf, 0xCu);
    }
  }
  int64_t v23 = +[UNNotificationRequest requestWithIdentifier:self->_name content:v4 trigger:0];
  notificationCenter = self->_notificationCenter;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000CDB04;
  v25[3] = &unk_100165980;
  v25[4] = self;
  [(UNUserNotificationCenter *)notificationCenter addNotificationRequest:v23 withCompletionHandler:v25];
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  v7 = (NRRepeatingAlertEngineItem *)a4;
  v8 = (void (**)(void))a5;
  BOOL v9 = nr_daemon_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    BOOL v11 = nr_daemon_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412290;
      v29 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "userNotificationCenter delegate called with response: %@", (uint8_t *)&v28, 0xCu);
    }
  }
  double v12 = [(NRRepeatingAlertEngineItem *)v7 actionIdentifier];
  unsigned int v13 = [v12 isEqualToString:UNNotificationDefaultActionIdentifier];

  if (v13)
  {
    double v14 = nr_daemon_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      int v16 = nr_daemon_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = 138412290;
        v29 = self;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Got UNNotificationDefaultActionIdentifier action : %@", (uint8_t *)&v28, 0xCu);
      }
    }
    [(NRRepeatingAlertEngineItem *)self defaultButtonWasPressed];
  }
  else
  {
    double v17 = [(NRRepeatingAlertEngineItem *)v7 actionIdentifier];
    unsigned int v18 = [v17 isEqualToString:UNNotificationDismissActionIdentifier];

    if (v18)
    {
      double v19 = nr_daemon_log();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

      if (v20)
      {
        int64_t v21 = nr_daemon_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v28 = 138412290;
          v29 = self;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Got UNNotificationDismissActionIdentifier action: %@", (uint8_t *)&v28, 0xCu);
        }
      }
      [(NRRepeatingAlertEngineItem *)self notificationDismissed];
    }
    else
    {
      __int16 v22 = [(NRRepeatingAlertEngineItem *)v7 actionIdentifier];
      int v23 = [v22 isEqualToString:@"MigrationAlertNext"];

      if ((v23 & 1) == 0)
      {
        v24 = nr_daemon_log();
        BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

        if (v25)
        {
          v26 = nr_daemon_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = [(NRRepeatingAlertEngineItem *)v7 actionIdentifier];
            int v28 = 138412290;
            v29 = v27;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Got unhandled action: %@", (uint8_t *)&v28, 0xCu);
          }
        }
      }
    }
  }
  [(NRRepeatingAlertEngineItem *)self logAcknowledgement];
  self->_alertBeingShown = 0;
  v8[2](v8);
}

+ (id)launchURL
{
  return 0;
}

- (BOOL)presentAlertWithString:(id)a3
{
  id v4 = a3;
  double v5 = (void *)CFPreferencesCopyAppValue(@"alertStatus", @"com.apple.NanoRegistry");
  id v6 = [v5 mutableCopy];

  if (v4)
  {
    if (!v6)
    {
      id v6 = +[NSMutableDictionary dictionary];
    }
    v7 = [(NSString *)self->_name stringByAppendingString:@".string"];
    [v6 setObject:v4 forKeyedSubscript:v7];

    CFPreferencesSetAppValue(@"alertStatus", v6, @"com.apple.NanoRegistry");
    CFPreferencesAppSynchronize(@"com.apple.NanoRegistry");
  }
  else
  {
    v8 = [(NSString *)self->_name stringByAppendingString:@".string"];
    id v4 = [v6 objectForKeyedSubscript:v8];
  }
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CE0A4;
  block[3] = &unk_100169700;
  id v13 = v4;
  double v14 = &v15;
  block[4] = self;
  id v9 = v4;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  char v10 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (void)dismissAlert
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CE8A4;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)dismissAlertAsync
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CE920;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_dismissAlert
{
  if (self->_alertRunLoopSource)
  {
    v3 = +[NSRunLoop mainRunLoop];
    CFRunLoopRemoveSource((CFRunLoopRef)[v3 getCFRunLoop], self->_alertRunLoopSource, kCFRunLoopCommonModes);

    CFRelease(self->_alertRunLoopSource);
    self->_alertRunLoopSource = 0;
  }
  if (self->_alert)
  {
    id v4 = +[NSValue valueWithPointer:](NSValue, "valueWithPointer:");
    [(id)qword_1001A13E0 removeObjectForKey:v4];
    CFUserNotificationCancel(self->_alert);
    CFRelease(self->_alert);
    self->_alert = 0;
  }
  transaction = self->_transaction;
  self->_transaction = 0;
}

- (void)alertResponseWithResponseFlags:(unint64_t)a3
{
  char v3 = a3;
  [(NRRepeatingAlertEngineItem *)self _dismissAlert];

  [(NRRepeatingAlertEngineItem *)self recordButtonPress:v3 & 3];
}

- (void)recordButtonPress:(unint64_t)a3
{
  if (a3 == 2)
  {
    id v9 = nr_daemon_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      BOOL v11 = nr_daemon_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        int v21 = 138412290;
        __int16 v22 = name;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Alert %@ response- Other button", (uint8_t *)&v21, 0xCu);
      }
    }
    [(NRRepeatingAlertEngineItem *)self logAcknowledgement];
    [(NRRepeatingAlertEngineItem *)self otherButtonWasPressed];
  }
  else if (a3 == 1)
  {
    id v13 = nr_daemon_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      uint64_t v15 = nr_daemon_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = self->_name;
        int v21 = 138412290;
        __int16 v22 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Alert %@ response- Alternate button", (uint8_t *)&v21, 0xCu);
      }
    }
    [(NRRepeatingAlertEngineItem *)self logAcknowledgement];
    [(NRRepeatingAlertEngineItem *)self alternateButtonWasPressed];
  }
  else if (a3)
  {
    uint64_t v17 = nr_daemon_log();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      double v19 = nr_daemon_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v20 = self->_name;
        int v21 = 138412546;
        __int16 v22 = v20;
        __int16 v23 = 2048;
        unint64_t v24 = a3;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Alert %@ response- unknown response type (%lu)", (uint8_t *)&v21, 0x16u);
      }
    }
    [(NRRepeatingAlertEngineItem *)self logAcknowledgement];
  }
  else
  {
    double v5 = nr_daemon_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      v7 = nr_daemon_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = self->_name;
        int v21 = 138412290;
        __int16 v22 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Alert %@ response- Default button", (uint8_t *)&v21, 0xCu);
      }
    }
    [(NRRepeatingAlertEngineItem *)self logAcknowledgement];
    [(NRRepeatingAlertEngineItem *)self defaultButtonWasPressed];
  }
}

- (void)logAcknowledgement
{
  ++self->_acknowledgementCount;
  char v3 = +[NSDate date];
  lastAcknowledgedDate = self->_lastAcknowledgedDate;
  self->_lastAcknowledgedDate = v3;

  if (self->_acknowledgementCount >= self->_maxAcknowledgementCount)
  {
    double v5 = nr_daemon_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      v7 = nr_daemon_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        int64_t acknowledgementCount = self->_acknowledgementCount;
        int64_t maxAcknowledgementCount = self->_maxAcknowledgementCount;
        int v11 = 138412802;
        double v12 = name;
        __int16 v13 = 2048;
        int64_t v14 = acknowledgementCount;
        __int16 v15 = 2048;
        int64_t v16 = maxAcknowledgementCount;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Alert %@- clearing enable flag as the max acknowledgement count has been reached _acknowledgementCount: %ld _maxAcknowledgementCount: %ld", (uint8_t *)&v11, 0x20u);
      }
    }
    self->_enabled = 0;
  }
  [(NRRepeatingAlertEngineItem *)self saveToDefaults];
}

- (void)defaultButtonWasPressed
{
  v2 = nr_daemon_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = nr_daemon_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "default defaultButtonWasPressed", v5, 2u);
    }
  }
}

- (void)notificationDismissed
{
  v2 = nr_daemon_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = nr_daemon_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "default notificationDismissed ", v5, 2u);
    }
  }
}

- (void)clearNotifications
{
  BOOL v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    double v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      *(_DWORD *)buf = 138412290;
      int v11 = name;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Clear notification for: %@", buf, 0xCu);
    }
  }
  notificationCenter = self->_notificationCenter;
  if (notificationCenter)
  {
    if (self->_name)
    {
      id v9 = self->_name;
      v8 = +[NSArray arrayWithObjects:&v9 count:1];
      [(UNUserNotificationCenter *)notificationCenter removeDeliveredNotificationsWithIdentifiers:v8];
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    if (a3)
    {
      lastAcknowledgedDate = self->_lastAcknowledgedDate;
      self->_int64_t acknowledgementCount = 0;
      self->_lastAcknowledgedDate = 0;
    }
    else
    {
      [(NRRepeatingAlertEngineItem *)self dismissAlert];
    }
    [(NRRepeatingAlertEngineItem *)self saveToDefaults];
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSArray)strings
{
  return self->_strings;
}

- (void)setStrings:(id)a3
{
}

- (int64_t)maxAcknowledgementCount
{
  return self->_maxAcknowledgementCount;
}

- (void)setMaxAcknowledgementCount:(int64_t)a3
{
  self->_int64_t maxAcknowledgementCount = a3;
}

- (double)reoccurrenceInterval
{
  return self->_reoccurrenceInterval;
}

- (void)setReoccurrenceInterval:(double)a3
{
  self->_double reoccurrenceInterval = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (int64_t)acknowledgementCount
{
  return self->_acknowledgementCount;
}

- (void)setAcknowledgementCount:(int64_t)a3
{
  self->_int64_t acknowledgementCount = a3;
}

- (NSDate)lastAcknowledgedDate
{
  return self->_lastAcknowledgedDate;
}

- (void)setLastAcknowledgedDate:(id)a3
{
}

- (NRMutableDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_lastAcknowledgedDate, 0);
  objc_storeStrong((id *)&self->_strings, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end