@interface NEKNotificationCenter
- (NEKNotificationCenter)init;
- (id)_tapToRadarUrl;
- (void)requestDiagnosticNotificationForDeviceID:(id)a3;
- (void)requestResetSync;
- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4;
- (void)userNotificationCenter:(id)a3 didOpenApplicationForResponse:(id)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation NEKNotificationCenter

- (NEKNotificationCenter)init
{
  v15.receiver = self;
  v15.super_class = (Class)NEKNotificationCenter;
  v2 = [(NEKNotificationCenter *)&v15 init];
  if (v2)
  {
    v3 = (UNUserNotificationCenter *)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.eventkitsync.notifications"];
    userNotificationCenter = v2->_userNotificationCenter;
    v2->_userNotificationCenter = v3;

    v5 = +[UNNotificationAction actionWithIdentifier:@"OPEN_TAP_TO_RADAR" title:@"Launch Tap-To-Radar" options:0];
    v6 = +[UNNotificationAction actionWithIdentifier:@"IGNORE_FOR_ONE_WEEK" title:@"Ignore for One Week" options:0];
    v17[0] = v5;
    v17[1] = v6;
    v7 = +[NSArray arrayWithObjects:v17 count:2];
    v8 = +[UNNotificationCategory categoryWithIdentifier:@"OPEN_TAP_TO_RADAR" actions:v7 intentIdentifiers:&__NSArray0__struct options:0];

    v9 = v2->_userNotificationCenter;
    v16 = v8;
    v10 = +[NSArray arrayWithObjects:&v16 count:1];
    v11 = +[NSSet setWithArray:v10];
    [(UNUserNotificationCenter *)v9 setNotificationCategories:v11];

    [(UNUserNotificationCenter *)v2->_userNotificationCenter setDelegate:v2];
    [(UNUserNotificationCenter *)v2->_userNotificationCenter setPrivateDelegate:v2];
    [(UNUserNotificationCenter *)v2->_userNotificationCenter setWantsNotificationResponsesDelivered];
    v12 = objc_alloc_init(NEKBGSystemTaskScheduler);
    bgSystemTaskScheduler = v2->_bgSystemTaskScheduler;
    v2->_bgSystemTaskScheduler = v12;
  }
  return v2;
}

- (void)requestDiagnosticNotificationForDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_pairedDeviceID, a3);
  id v5 = a3;
  id v9 = (id)objc_opt_new();
  [v9 setTitle:@"Slow Calendar Sync Detected"];
  [v9 setBody:@"Tap to file Radar"];
  v6 = +[UNNotificationIcon iconForApplicationIdentifier:@"com.apple.TapToRadar"];
  [v9 setIcon:v6];

  v7 = [(NEKNotificationCenter *)self _tapToRadarUrl];
  [v9 setDefaultActionURL:v7];

  [v9 setCategoryIdentifier:@"OPEN_TAP_TO_RADAR"];
  v8 = +[UNNotificationRequest requestWithIdentifier:@"com.apple.usernotifications.delegate.com.apple.eventkitsync.diagnostic" content:v9 trigger:0];
  [(UNUserNotificationCenter *)self->_userNotificationCenter addNotificationRequest:v8 withCompletionHandler:&stru_1000A9218];
}

- (id)_tapToRadarUrl
{
  id v23 = objc_alloc_init((Class)NSDateFormatter);
  [v23 setDateFormat:@"yyyy.MM.dd_HH-mm-ss"];
  v3 = +[NSDate now];
  v22 = [v23 stringFromDate:v3];

  id v4 = objc_alloc_init((Class)NSURLComponents);
  [v4 setScheme:@"tap-to-radar"];
  [v4 setHost:@"new"];
  id v21 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"TimeOfIssue" value:v22];
  v24[0] = v21;
  id v20 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"IncludeDevicePrefixInTitle" value:@"1"];
  v24[1] = v20;
  id v19 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Title" value:@"Calendar Sync Taking Longer than Expected"];
  v24[2] = v19;
  id v18 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Description" value:@"Summary:\nCalendar sync between iPhone and Apple Watch is taking longer than expected.\n\nPlease file this Tap-to-Radar bug to help the Apple Watch team improve the underlying sync functionality.\n\nNotes:\nPlease ensure that both an iPhone and Apple Watch sysdiagnose are attached to this bug report.\n\nImportant: No user sensitive or confidential calendar data will be attached to this bug report."];
  v24[3] = v18;
  id v17 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"BundleID" value:@"com.apple.eventkitsyncd"];
  v24[4] = v17;
  id v16 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ComponentName" value:@"EventKitSync"];
  v24[5] = v16;
  id v5 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ComponentVersion" value:@"watchOS"];
  v24[6] = v5;
  id v6 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ComponentID" value:@"560446"];
  v24[7] = v6;
  id v7 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Classification" value:@"Other Bug"];
  v24[8] = v7;
  id v8 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Reproducibility" value:@"Not Applicable"];
  v24[9] = v8;
  id v9 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"DeviceIDs" value:self->_pairedDeviceID];
  v24[10] = v9;
  id v10 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"DeviceClasses" value:@"Watch"];
  v24[11] = v10;
  id v11 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"RemoteDeviceSelections" value:@"Nearby"];
  v24[12] = v11;
  id v12 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ExtensionIdentifiers" value:@"com.apple.DiagnosticExtensions.EventKitSync,com.apple.eventkit.CalendarDiagnosticExtension"];
  v24[13] = v12;
  v13 = +[NSArray arrayWithObjects:v24 count:14];
  [v4 setQueryItems:v13];

  v14 = [v4 URL];

  return v14;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(void))a5;
  id v9 = [v7 actionIdentifier];
  unsigned int v10 = [v9 isEqualToString:@"OPEN_TAP_TO_RADAR"];

  if (v10)
  {
    id v11 = [(NEKNotificationCenter *)self _tapToRadarUrl];
    id v12 = +[LSApplicationWorkspace defaultWorkspace];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100024D48;
    v24[3] = &unk_1000A9240;
    id v25 = v11;
    v26 = self;
    id v13 = v11;
    [v12 openURL:v13 configuration:0 completionHandler:v24];

LABEL_7:
    goto LABEL_10;
  }
  v14 = [v7 actionIdentifier];
  unsigned int v15 = [v14 isEqualToString:@"IGNORE_FOR_ONE_WEEK"];

  if (v15)
  {
    id v16 = +[NSCalendar autoupdatingCurrentCalendar];
    id v17 = +[NSDate now];
    id v13 = [v16 dateByAddingUnit:16 value:7 toDate:v17 options:0];

    [v13 timeIntervalSinceReferenceDate];
    double v19 = v18;
    id v20 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Notification didReceiveNotificationResponse to ignore until: %@", buf, 0xCu);
    }
    id v21 = +[NEKEnvironment instance];
    v22 = [v21 tinyStore];
    [v22 setDoubleValue:@"diagnosticNotificationIgnoreUntil" forKey:v19];

    goto LABEL_7;
  }
  id v23 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_10006DD14(v23, v7);
  }
LABEL_10:
  v8[2](v8);
}

- (void)userNotificationCenter:(id)a3 didOpenApplicationForResponse:(id)a4
{
  id v6 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    id v8 = [a4 actionIdentifier];
    int v9 = 138412290;
    unsigned int v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Notification didOpenApplicationForResponse: %@", (uint8_t *)&v9, 0xCu);
  }
  [(NEKNotificationCenter *)self requestResetSync];
}

- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4
{
  id v5 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    id v7 = [a4 debugDescription];
    int v8 = 138412290;
    int v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Notification didChangeSettings: %@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)requestResetSync
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_bgSystemTaskScheduler, 0);

  objc_storeStrong((id *)&self->_pairedDeviceID, 0);
}

@end