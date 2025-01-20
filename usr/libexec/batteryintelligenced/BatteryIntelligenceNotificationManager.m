@interface BatteryIntelligenceNotificationManager
+ (id)sharedInstance;
- (BatteryIntelligenceNotificationManager)init;
- (OS_os_log)log;
- (UNUserNotificationCenter)unCenter;
- (id)timeStringFromDuration:(double)a3;
- (id)tt80NotificationContentWithDuration:(double)a3;
- (id)tt80NotificationRequestWithDuration:(double)a3;
- (void)postTT80NotificationWithDuration:(double)a3;
- (void)setLog:(id)a3;
- (void)setUnCenter:(id)a3;
@end

@implementation BatteryIntelligenceNotificationManager

- (BatteryIntelligenceNotificationManager)init
{
  if (os_variant_has_internal_ui())
  {
    v10.receiver = self;
    v10.super_class = (Class)BatteryIntelligenceNotificationManager;
    v3 = [(BatteryIntelligenceNotificationManager *)&v10 init];
    if (v3)
    {
      os_log_t v4 = os_log_create("com.apple.batteryintelligence", "notifications");
      log = v3->_log;
      v3->_log = (OS_os_log *)v4;

      v6 = (UNUserNotificationCenter *)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.batteryintelligence-notifications"];
      unCenter = v3->_unCenter;
      v3->_unCenter = v6;

      [(UNUserNotificationCenter *)v3->_unCenter setDelegate:v3];
      [(UNUserNotificationCenter *)v3->_unCenter setWantsNotificationResponsesDelivered];
    }
    self = v3;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C080;
  block[3] = &unk_100030628;
  block[4] = a1;
  if (qword_100039630 != -1) {
    dispatch_once(&qword_100039630, block);
  }
  v2 = (void *)qword_100039638;

  return v2;
}

- (id)timeStringFromDuration:(double)a3
{
  if (a3 >= 60.0)
  {
    if (a3 >= 3600.0)
    {
      if (a3 >= 7200.0)
      {
        signed int v3 = vcvtmd_s64_f64(a3);
        unsigned int v4 = v3 % 3600 + ((-30583 * (v3 % 3600)) >> 16);
        +[NSString stringWithFormat:@"%.0f hours, %.0d minutes", a3 / 3600.0, ((__int16)v4 >> 5) + ((unsigned __int16)(v4 & 0x8000) >> 15)];
      }
      else
      {
        +[NSString stringWithFormat:@"1 hour, %.0f minutes", (a3 + -3600.0) / 60.0, v7];
      }
    }
    else
    {
      +[NSString stringWithFormat:@"%.0f minutes", a3 / 60.0, v7];
    }
  }
  else
  {
    +[NSString stringWithFormat:@"%.0f seconds", *(void *)&a3, v7];
  v5 = };

  return v5;
}

- (id)tt80NotificationContentWithDuration:(double)a3
{
  id v5 = objc_alloc_init((Class)UNMutableNotificationContent);
  [v5 setTitle:@"Charge Time"];
  v6 = [(BatteryIntelligenceNotificationManager *)self timeStringFromDuration:a3];
  uint64_t v7 = +[NSString stringWithFormat:@"It will take %@ to charge to 80%%.", v6];
  [v5 setBody:v7];

  [v5 setCategoryIdentifier:@"tt80Category"];
  [v5 setShouldIgnoreDowntime:1];
  [v5 setShouldIgnoreDoNotDisturb:1];
  [v5 setShouldHideDate:0];
  [v5 setShouldSuppressScreenLightUp:0];
  v8 = +[UNNotificationIcon iconForSystemImageNamed:@"bolt.fill"];
  [v5 setIcon:v8];

  v9 = +[NSDate dateWithTimeIntervalSinceNow:57600.0];
  [v5 setExpirationDate:v9];

  return v5;
}

- (id)tt80NotificationRequestWithDuration:(double)a3
{
  signed int v3 = [(BatteryIntelligenceNotificationManager *)self tt80NotificationContentWithDuration:a3];
  if (v3)
  {
    unsigned int v4 = +[NSDate date];
    id v5 = +[NSString stringWithFormat:@"tt80-%@", v4];

    v6 = +[UNNotificationRequest requestWithIdentifier:v5 content:v3 trigger:0];
    [v6 setDestinations:15];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)postTT80NotificationWithDuration:(double)a3
{
  if (sub_100016D78())
  {
    id v5 = [(BatteryIntelligenceNotificationManager *)self tt80NotificationRequestWithDuration:a3];
    objc_initWeak(location, self);
    unCenter = self->_unCenter;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000C53C;
    v7[3] = &unk_1000306B8;
    objc_copyWeak(&v8, location);
    [(UNUserNotificationCenter *)unCenter addNotificationRequest:v5 withCompletionHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(location);
  }
  else
  {
    id v5 = [(BatteryIntelligenceNotificationManager *)self log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "TT80 notification is not enabled!", (uint8_t *)location, 2u);
    }
  }
}

- (UNUserNotificationCenter)unCenter
{
  return self->_unCenter;
}

- (void)setUnCenter:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_unCenter, 0);
}

@end