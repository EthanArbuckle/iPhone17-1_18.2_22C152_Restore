@interface NSSUserNotificationManager
+ (id)sharedInstance;
- (NSSUserNotificationManager)init;
- (UNUserNotificationCenter)notificationCenter;
- (void)postBatteryNotificationForWatch:(id)a3 withValue:(id)a4;
- (void)postLowPowerModeAutoDisabledNotification:(unint64_t)a3;
- (void)removeLastPostedBatteryNotification;
- (void)setNotificationCenter:(id)a3;
@end

@implementation NSSUserNotificationManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016B00;
  block[3] = &unk_100034DF8;
  block[4] = a1;
  if (qword_10003E780 != -1) {
    dispatch_once(&qword_10003E780, block);
  }
  v2 = (void *)qword_10003E778;
  return v2;
}

- (NSSUserNotificationManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)NSSUserNotificationManager;
  v2 = [(NSSUserNotificationManager *)&v7 init];
  v3 = v2;
  if (v2 && !v2->_notificationCenter)
  {
    v4 = (UNUserNotificationCenter *)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.Bridge"];
    notificationCenter = v3->_notificationCenter;
    v3->_notificationCenter = v4;

    [(UNUserNotificationCenter *)v3->_notificationCenter setWantsNotificationResponsesDelivered];
    [(UNUserNotificationCenter *)v3->_notificationCenter setDelegate:v3];
  }
  return v3;
}

- (void)postBatteryNotificationForWatch:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)UNMutableNotificationContent);
  [v8 setCategoryIdentifier:@"BatteryCharge"];
  v9 = +[NSString localizedUserNotificationStringForKey:@"BATTERY" arguments:0];
  [v8 setHeader:v9];

  [v8 setShouldHideDate:1];
  [v8 setShouldIgnoreDoNotDisturb:1];
  [v8 setShouldSuppressDefaultAction:1];
  [v8 setShouldSuppressScreenLightUp:1];
  v10 = +[UNNotificationIcon iconForSystemImageNamed:@"applewatch"];
  [v8 setIcon:v10];

  notificationCenter = self->_notificationCenter;
  CFStringRef v28 = @"BatterNotifictionID";
  v12 = +[NSArray arrayWithObjects:&v28 count:1];
  [(UNUserNotificationCenter *)notificationCenter removeDeliveredNotificationsWithIdentifiers:v12];

  v13 = NSSLogForType();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v27 = [v7 unsignedLongValue];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Posting Battery Notification for level: %lu ", buf, 0xCu);
  }

  if (v7)
  {
    v14 = [v7 stringValue];
    v15 = +[NSString stringWithFormat:@"%@%%", v14];
  }
  else
  {
    v15 = +[NSString stringWithFormat:@"%@%%", @"100"];
  }
  v16 = +[NSNumber numberWithInt:100];
  unsigned int v17 = [v7 isEqualToNumber:v16];

  if (v17)
  {
    id v25 = v6;
    v18 = +[NSArray arrayWithObjects:&v25 count:1];
    CFStringRef v19 = @"BATTERY_LEVEL_BODY_FULL_%@";
  }
  else
  {
    v24[0] = v6;
    v24[1] = v15;
    v18 = +[NSArray arrayWithObjects:v24 count:2];
    CFStringRef v19 = @"BATTERY_LEVEL_BODY_%@_%@";
  }
  v20 = +[NSString localizedUserNotificationStringForKey:v19 arguments:v18];
  [v8 setBody:v20];

  [v8 setCategoryIdentifier:@"NSSUserNotifications"];
  v21 = +[UNNotificationCategory categoryWithIdentifier:@"DefaultNSSCategory" actions:&__NSArray0__struct intentIdentifiers:&__NSArray0__struct options:0];
  [v8 setCategoryIdentifier:@"DefaultNSSCategory"];
  v22 = +[NSSet setWithObject:v21];
  [(UNUserNotificationCenter *)self->_notificationCenter setNotificationCategories:v22];

  v23 = +[UNNotificationRequest requestWithIdentifier:@"BatterNotifictionID" content:v8 trigger:0];
  [(UNUserNotificationCenter *)self->_notificationCenter addNotificationRequest:v23 withCompletionHandler:&stru_100034F70];
}

- (void)removeLastPostedBatteryNotification
{
  v3 = NSSLogForType();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v8 = "-[NSSUserNotificationManager removeLastPostedBatteryNotification]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  notificationCenter = self->_notificationCenter;
  CFStringRef v6 = @"BatterNotifictionID";
  v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [(UNUserNotificationCenter *)notificationCenter removeDeliveredNotificationsWithIdentifiers:v5];
}

- (void)postLowPowerModeAutoDisabledNotification:(unint64_t)a3
{
  v5 = NSSLogForType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Posting auto disabled LPM notification.", v15, 2u);
  }

  id v6 = objc_alloc_init((Class)UNMutableNotificationContent);
  [v6 setCategoryIdentifier:@"LowPowerModeAutoDisabledNotificationID"];
  id v7 = +[NSString localizedUserNotificationStringForKey:@"LOW_POWER_AUTO_DISABLED_MODE_NOTIFICATION_HEADER" arguments:0];
  [v6 setTitle:v7];

  [v6 setShouldHideDate:1];
  [v6 setShouldIgnoreDoNotDisturb:1];
  [v6 setShouldSuppressDefaultAction:1];
  [v6 setShouldSuppressScreenLightUp:1];
  id v8 = +[UNNotificationIcon iconForSystemImageNamed:@"applewatch"];
  [v6 setIcon:v8];

  notificationCenter = self->_notificationCenter;
  CFStringRef v16 = @"LowPowerModeAutoDisabledNotificationID";
  v10 = +[NSArray arrayWithObjects:&v16 count:1];
  [(UNUserNotificationCenter *)notificationCenter removeDeliveredNotificationsWithIdentifiers:v10];

  if (a3 <= 3)
  {
    v11 = +[NSString localizedUserNotificationStringForKey:off_100034FB0[a3] arguments:0];
    [v6 setBody:v11];
  }
  [v6 setCategoryIdentifier:@"NSSUserNotifications"];
  v12 = +[UNNotificationCategory categoryWithIdentifier:@"DefaultNSSCategory" actions:&__NSArray0__struct intentIdentifiers:&__NSArray0__struct options:0];
  [v6 setCategoryIdentifier:@"DefaultNSSCategory"];
  v13 = +[NSSet setWithObject:v12];
  [(UNUserNotificationCenter *)self->_notificationCenter setNotificationCategories:v13];

  v14 = +[UNNotificationRequest requestWithIdentifier:@"LowPowerModeAutoDisabledNotificationID" content:v6 trigger:0];
  [(UNUserNotificationCenter *)self->_notificationCenter addNotificationRequest:v14 withCompletionHandler:&stru_100034F90];
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