@interface _OSInactivityNotificationManager
- (OS_os_log)log;
- (UNUserNotificationCenter)unCenter;
- (_OSInactivityNotificationManager)init;
- (id)currentlyInInactivityNotification:(id)a3;
- (id)engagedUntilDateRequest:(id)a3 inactivityOptions:(int64_t)a4;
- (id)iconForOptions:(int64_t)a3;
- (id)inactivityEngagedContentUntil:(id)a3 inactivityOptions:(int64_t)a4;
- (id)inactivityPreviouslyEngagedContentFrom:(id)a3 until:(id)a4 inactivityOptions:(int64_t)a5;
- (id)postEngagedUntilDate:(id)a3 inactivityOptions:(int64_t)a4;
- (id)previouslyEngagedFrom:(id)a3 until:(id)a4 inactivityOptions:(int64_t)a5;
- (id)titleForOptions:(int64_t)a3;
- (id)ttrURLforEnagedFrom:(id)a3 until:(id)a4 interrupted:(BOOL)a5 inactivityOptions:(int64_t)a6;
- (void)removeAllNotifications;
- (void)removeAllNotificationsForInactivityOptions:(int64_t)a3;
- (void)setLog:(id)a3;
- (void)setUnCenter:(id)a3;
@end

@implementation _OSInactivityNotificationManager

- (_OSInactivityNotificationManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)_OSInactivityNotificationManager;
  v2 = [(_OSInactivityNotificationManager *)&v12 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.osintelligence", "inactivity.notifications");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = (UNUserNotificationCenter *)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.osintelligence.inactivity.notifications"];
    unCenter = v2->_unCenter;
    v2->_unCenter = v5;

    [(UNUserNotificationCenter *)v2->_unCenter setDelegate:v2];
    [(UNUserNotificationCenter *)v2->_unCenter setWantsNotificationResponsesDelivered];
    int out_token = 0;
    v7 = dispatch_get_global_queue(-32768, 0);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000080A8;
    v9[3] = &unk_100064800;
    v10 = v2;
    notify_register_dispatch("com.apple.osintelligence.inactivity.notifications", &out_token, v7, v9);
  }
  return v2;
}

- (id)ttrURLforEnagedFrom:(id)a3 until:(id)a4 interrupted:(BOOL)a5 inactivityOptions:(int64_t)a6
{
  BOOL v6 = a5;
  if (a6) {
    CFStringRef v9 = @"[Sleep Suppression]";
  }
  else {
    CFStringRef v9 = @"[Core Smart Power Nap]";
  }
  id v10 = a4;
  id v11 = a3;
  if (v6) {
    CFStringRef v12 = @"Potential False Suppression";
  }
  else {
    CFStringRef v12 = @"Potential Insufficient Suppression";
  }
  if (v6) {
    v13 = @"* What were you doing immediately prior to suppression?\n\n* Do you typically leave your device inactive at this time?\n\n* Was your device in a dimly-lit environment prior to suppression? If so, please describe the environment.";
  }
  else {
    v13 = @"* How much sooner than the start of suppression do you think you stopped using your device?\n\n* How much later than when suppression ended did you start using your device?\n\n* Do you typically leave your device inactive around this time?";
  }
  v14 = +[NSString stringWithFormat:@"%@ %@", v9, v12];
  id v15 = objc_alloc_init((Class)NSDateFormatter);
  [v15 setDateStyle:0];
  [v15 setTimeStyle:1];
  v16 = [v15 stringFromDate:v11];

  v17 = [v15 stringFromDate:v10];

  v18 = [v14 stringByAppendingFormat:@" (%@ - %@)", v16, v17];

  id v19 = v18;
  v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"tap-to-radar://new?Title=%s&Classification=Serious Bug&ComponentID=1407046&ComponentName=OSIntelligence&ComponentVersion=Inactivity&Reproducible=Sometimes&Description=PLEASE ANSWER THESE QUESTIONS TO AID DEBUGGING:\n\n%s", [v19 UTF8String], -[__CFString UTF8String](v13, "UTF8String"));
  v21 = +[NSCharacterSet URLQueryAllowedCharacterSet];
  v22 = [v20 stringByAddingPercentEncodingWithAllowedCharacters:v21];

  v23 = +[NSURL URLWithString:v22];
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v23;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "TTR URL is %@", buf, 0xCu);
  }

  return v23;
}

- (id)iconForOptions:(int64_t)a3
{
  if (a3) {
    CFStringRef v3 = @"moon.circle.fill";
  }
  else {
    CFStringRef v3 = @"moon.circle";
  }
  v4 = +[UNNotificationIcon iconForSystemImageNamed:v3];

  return v4;
}

- (id)titleForOptions:(int64_t)a3
{
  if (a3) {
    return @"Sleep Suppression";
  }
  else {
    return @"Core Smart Power Nap";
  }
}

- (id)inactivityEngagedContentUntil:(id)a3 inactivityOptions:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)UNMutableNotificationContent);
  [v7 setCategoryIdentifier:@"engaged"];
  [v7 setShouldIgnoreDowntime:1];
  [v7 setShouldIgnoreDoNotDisturb:1];
  [v7 setShouldHideDate:0];
  [v7 setShouldSuppressScreenLightUp:1];
  v8 = [(_OSInactivityNotificationManager *)self titleForOptions:a4];
  [v7 setTitle:v8];

  CFStringRef v9 = [(_OSInactivityNotificationManager *)self iconForOptions:a4];
  [v7 setIcon:v9];

  id v10 = objc_alloc_init((Class)NSDateFormatter);
  [v10 setDateStyle:0];
  [v10 setTimeStyle:1];
  id v11 = +[NSLocale currentLocale];
  [v10 setLocale:v11];

  CFStringRef v12 = [v10 stringFromDate:v6];
  v13 = +[NSString stringWithFormat:@"Inactivity predicted until %@", v12];
  [v7 setBody:v13];

  [v7 setExpirationDate:v6];
  v14 = +[OSIntelligenceDefines inactivityUserDefaults];
  LODWORD(v12) = [v14 BOOLForKey:@"showNotifications.ttrURL"];

  if (v12)
  {
    id v15 = +[NSDate now];
    v16 = [(_OSInactivityNotificationManager *)self ttrURLforEnagedFrom:v15 until:v6 interrupted:1 inactivityOptions:a4];
    [v7 setDefaultActionURL:v16];
  }

  return v7;
}

- (id)inactivityPreviouslyEngagedContentFrom:(id)a3 until:(id)a4 inactivityOptions:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init((Class)UNMutableNotificationContent);
  [v10 setCategoryIdentifier:@"engaged"];
  [v10 setShouldIgnoreDowntime:1];
  [v10 setShouldIgnoreDoNotDisturb:1];
  [v10 setShouldHideDate:1];
  [v10 setShouldSuppressScreenLightUp:1];
  id v11 = [(_OSInactivityNotificationManager *)self titleForOptions:a5];
  [v10 setTitle:v11];

  CFStringRef v12 = [(_OSInactivityNotificationManager *)self iconForOptions:a5];
  [v10 setIcon:v12];

  id v13 = objc_alloc_init((Class)NSDateFormatter);
  [v13 setDateStyle:0];
  [v13 setTimeStyle:1];
  v14 = +[NSLocale currentLocale];
  [v13 setLocale:v14];

  id v15 = [v13 stringFromDate:v8];
  v16 = [v13 stringFromDate:v9];
  v17 = +[NSString stringWithFormat:@"Inactivity was predicted from %@ until %@.", v15, v16];
  [v10 setBody:v17];

  v18 = +[OSIntelligenceDefines inactivityUserDefaults];
  [v18 doubleForKey:@"showNowtifications.expirationDelay"];
  double v20 = v19;

  double v21 = 14400.0;
  if (v20 >= 1.0) {
    double v21 = v20;
  }
  v22 = [v9 dateByAddingTimeInterval:v21];
  [v10 setExpirationDate:v22];

  v23 = +[OSIntelligenceDefines inactivityUserDefaults];
  unsigned int v24 = [v23 BOOLForKey:@"showNotifications.ttrURL"];

  if (v24)
  {
    v25 = [(_OSInactivityNotificationManager *)self ttrURLforEnagedFrom:v8 until:v9 interrupted:0 inactivityOptions:a5];
    [v10 setDefaultActionURL:v25];
  }

  return v10;
}

- (id)engagedUntilDateRequest:(id)a3 inactivityOptions:(int64_t)a4
{
  v5 = -[_OSInactivityNotificationManager inactivityEngagedContentUntil:inactivityOptions:](self, "inactivityEngagedContentUntil:inactivityOptions:", a3);
  if (v5)
  {
    id v6 = +[NSNumber numberWithInteger:a4];
    id v7 = +[NSDate date];
    id v8 = +[NSString stringWithFormat:@"%@-inactivityEngaged-%@", v6, v7];

    id v9 = +[OSIntelligenceDefines inactivityUserDefaults];
    [v9 doubleForKey:@"showNowtifications.displayDelta"];
    double v11 = v10;

    double v12 = 300.0;
    if (v11 >= 1.0) {
      double v12 = v11;
    }
    id v13 = +[UNTimeIntervalNotificationTrigger triggerWithTimeInterval:0 repeats:v12];
    v14 = +[UNNotificationRequest requestWithIdentifier:v8 content:v5 trigger:v13];
    [v14 setDestinations:2];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)previouslyEngagedFrom:(id)a3 until:(id)a4 inactivityOptions:(int64_t)a5
{
  id v8 = a4;
  id v9 = [(_OSInactivityNotificationManager *)self inactivityPreviouslyEngagedContentFrom:a3 until:v8 inactivityOptions:a5];
  if (v9)
  {
    double v10 = +[NSNumber numberWithInteger:a5];
    double v11 = +[NSDate date];
    double v12 = +[NSString stringWithFormat:@"%@-inactivityPreviouslyEngaged-%@", v10, v11];

    [v8 timeIntervalSinceNow];
    if (v13 <= 0.0)
    {
      v14 = 0;
    }
    else
    {
      v14 = +[UNTimeIntervalNotificationTrigger triggerWithTimeInterval:repeats:](UNTimeIntervalNotificationTrigger, "triggerWithTimeInterval:repeats:", 0);
    }
    id v15 = +[UNNotificationRequest requestWithIdentifier:v12 content:v9 trigger:v14];
    [v15 setDestinations:2];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)postEngagedUntilDate:(id)a3 inactivityOptions:(int64_t)a4
{
  id v6 = a3;
  [(_OSInactivityNotificationManager *)self removeAllNotificationsForInactivityOptions:a4];
  id v7 = [(_OSInactivityNotificationManager *)self engagedUntilDateRequest:v6 inactivityOptions:a4];
  [(UNUserNotificationCenter *)self->_unCenter addNotificationRequest:v7 withCompletionHandler:0];
  unCenter = self->_unCenter;
  id v9 = +[NSDate now];
  double v10 = [(_OSInactivityNotificationManager *)self previouslyEngagedFrom:v9 until:v6 inactivityOptions:a4];

  [(UNUserNotificationCenter *)unCenter addNotificationRequest:v10 withCompletionHandler:0];
  double v11 = [v7 identifier];

  return v11;
}

- (void)removeAllNotifications
{
}

- (void)removeAllNotificationsForInactivityOptions:(int64_t)a3
{
  unCenter = self->_unCenter;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100008CE0;
  v8[3] = &unk_1000648A0;
  v8[4] = self;
  v8[5] = a3;
  [(UNUserNotificationCenter *)unCenter getDeliveredNotificationsWithCompletionHandler:v8];
  id v6 = self->_unCenter;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008F54;
  v7[3] = &unk_1000648A0;
  v7[4] = self;
  v7[5] = a3;
  [(UNUserNotificationCenter *)v6 getPendingNotificationRequestsWithCompletionHandler:v7];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(UNUserNotificationCenter *)self->_unCenter removeAllDeliveredNotifications];
    [(UNUserNotificationCenter *)self->_unCenter removeAllPendingNotificationRequests];
  }
}

- (id)currentlyInInactivityNotification:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x3032000000;
  double v12 = sub_10000929C;
  double v13 = sub_1000092AC;
  id v14 = 0;
  unCenter = self->_unCenter;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000092B4;
  v8[3] = &unk_1000648C8;
  v8[4] = &v9;
  [(UNUserNotificationCenter *)unCenter getDeliveredNotificationsWithCompletionHandler:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
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