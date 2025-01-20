@interface SAUnUserNotificationProxy
- (SAUnUserNotificationProxy)initWithQueue:(id)a3;
- (void)postNotification:(id)a3 withSilence:(BOOL)a4;
@end

@implementation SAUnUserNotificationProxy

- (SAUnUserNotificationProxy)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SAUnUserNotificationProxy;
  v6 = [(SAUnUserNotificationProxy *)&v11 init];
  if (*((unsigned char *)SAPlatformInfo::instance((SAPlatformInfo *)v6) + 9)) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (UNUserNotificationCenter *)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.safetyalerts" queue:v5];
    notificationCenter = v6->_notificationCenter;
    v6->_notificationCenter = v8;

    [(UNUserNotificationCenter *)v6->_notificationCenter setDelegate:v6];
    [(UNUserNotificationCenter *)v6->_notificationCenter setWantsNotificationResponsesDelivered];
  }

  return v6;
}

- (void)postNotification:(id)a3 withSilence:(BOOL)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = objc_alloc_init((Class)UNMutableNotificationContent);
    v8 = +[NSString localizedUserNotificationStringForKey:@"Safety Alerts Test" arguments:0];
    [v7 setTitle:v8];

    [v7 setBody:v6];
    if (!a4)
    {
      v9 = +[UNNotificationSound defaultSound];
      [v7 setSound:v9];
    }
    v10 = +[UNNotificationIcon iconNamed:@"emergency-20"];
    [v7 setIcon:v10];

    [v7 setThreadIdentifier:@"com.apple.safetyalerts"];
    [v7 setCategoryIdentifier:@"com.apple.safetyalerts"];
    objc_super v11 = +[UNNotificationRequest requestWithIdentifier:@"com.apple.safetyalerts" content:v7 trigger:0 destinations:7];
    notificationCenter = self->_notificationCenter;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100063C98;
    v13[3] = &unk_1000F84E8;
    v13[4] = v11;
    [(UNUserNotificationCenter *)notificationCenter addNotificationRequest:v11 withCompletionHandler:v13];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end