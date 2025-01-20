@interface NRLaunchNotificationController
- (id)prefs;
- (void)_setLaunchEvent:(id)a3 enable:(BOOL)a4;
- (void)setLaunchEvent:(id)a3 enable:(BOOL)a4;
@end

@implementation NRLaunchNotificationController

- (id)prefs
{
  if (qword_1001A10B0 != -1) {
    dispatch_once(&qword_1001A10B0, &stru_100165FE0);
  }
  v2 = (void *)qword_1001A10A8;

  return v2;
}

- (void)setLaunchEvent:(id)a3 enable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 stringByAppendingString:@".enabled"];
  v8 = [(NRLaunchNotificationController *)self prefs];
  v9 = [v8 objectForKeyedSubscript:v7];

  unsigned int v10 = [v9 integerValue];
  v11 = nr_daemon_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    v13 = nr_daemon_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138543618;
      CFStringRef v25 = v7;
      __int16 v26 = 1024;
      LODWORD(v27) = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "NRLaunchNotificationController: notification %{public}@ prefs value: %d", (uint8_t *)&v24, 0x12u);
    }
  }
  if ((v10 == 0) == v10 < 3)
  {

    if (v10) {
      goto LABEL_20;
    }
  }
  else
  {

    if (v10 && v10 - 1 == v4) {
      goto LABEL_20;
    }
  }
  v14 = nr_daemon_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    v16 = nr_daemon_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v17 = @"disabling";
      if (v4) {
        CFStringRef v17 = @"enabling";
      }
      int v24 = 138412546;
      CFStringRef v25 = v17;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "NRLaunchNotificationController: %@ %@ launch notifications", (uint8_t *)&v24, 0x16u);
    }
  }
  v18 = [(NRLaunchNotificationController *)self prefs];
  [v18 setObject:&off_100176868 forKeyedSubscript:v7];

  v19 = [(NRLaunchNotificationController *)self prefs];
  [v19 synchronize];

  [(NRLaunchNotificationController *)self _setLaunchEvent:v6 enable:v4];
  if (v4) {
    uint64_t v20 = 2;
  }
  else {
    uint64_t v20 = 1;
  }
  v21 = +[NSNumber numberWithInt:v20];
  v22 = [(NRLaunchNotificationController *)self prefs];
  [v22 setObject:v21 forKeyedSubscript:v7];

  v23 = [(NRLaunchNotificationController *)self prefs];
  [v23 synchronize];

LABEL_20:
}

- (void)_setLaunchEvent:(id)a3 enable:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v4)
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v6, "Notification", (const char *)[v5 UTF8String]);
  }
  else
  {
    xpc_object_t v6 = 0;
  }
  v7 = nr_daemon_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    v9 = nr_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v10 = @"disabling";
      if (v4) {
        CFStringRef v10 = @"enabling";
      }
      int v12 = 138412546;
      CFStringRef v13 = v10;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "NRLaunchNotificationController: %@ launch notification %@", (uint8_t *)&v12, 0x16u);
    }
  }
  id v11 = v5;
  [v11 UTF8String];
  xpc_set_event();
}

@end