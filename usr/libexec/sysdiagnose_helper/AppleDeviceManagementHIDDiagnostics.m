@interface AppleDeviceManagementHIDDiagnostics
+ (OS_os_log)log;
+ (void)collectDiagnosticsAndWriteToDirectory:(id)a3;
- (AppleDeviceManagementHIDDiagnostics)initWithOutputDirectory:(id)a3;
- (BOOL)collectErrorStats;
- (BOOL)handleExtractedErrorStats:(id)a3;
- (NSString)directory;
- (OS_dispatch_group)dispatchGroup;
@end

@implementation AppleDeviceManagementHIDDiagnostics

+ (void)collectDiagnosticsAndWriteToDirectory:(id)a3
{
  v4 = (__CFString *)a3;
  v5 = [a1 log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    CFStringRef v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Collecting HID device diagnostics and saving it to directory %@", (uint8_t *)&v10, 0xCu);
  }

  v6 = [[AppleDeviceManagementHIDDiagnostics alloc] initWithOutputDirectory:v4];
  unsigned int v7 = [(AppleDeviceManagementHIDDiagnostics *)v6 collectErrorStats];
  v8 = [a1 log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"failure";
    if (v7) {
      CFStringRef v9 = @"success";
    }
    int v10 = 138412290;
    CFStringRef v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Collected HID device diagnostics - %@", (uint8_t *)&v10, 0xCu);
  }
}

+ (OS_os_log)log
{
  if (qword_100071378 != -1) {
    dispatch_once(&qword_100071378, &stru_10006CDF0);
  }
  v2 = (void *)qword_100071370;

  return (OS_os_log *)v2;
}

- (AppleDeviceManagementHIDDiagnostics)initWithOutputDirectory:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AppleDeviceManagementHIDDiagnostics;
  v6 = [(AppleDeviceManagementHIDDiagnostics *)&v11 init];
  if (v6)
  {
    dispatch_group_t v7 = dispatch_group_create();
    dispatchGroup = v6->_dispatchGroup;
    v6->_dispatchGroup = (OS_dispatch_group *)v7;

    objc_storeStrong((id *)&v6->_directory, a3);
    CFStringRef v9 = v6;
  }

  return v6;
}

- (BOOL)collectErrorStats
{
  v3 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(AppleDeviceManagementHIDDiagnostics *)self directory];
    *(_DWORD *)buf = 138412290;
    double v56 = *(double *)&v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Collecting error stats and writing to directory %@", buf, 0xCu);
  }
  v43 = +[NSDate date];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100037D3C, @"com.apple.hidswdebug.AppleDeviceManagementHIDFilter.CrashlogExtracted", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v60[0] = @"PrimaryUsagePage";
  v60[1] = @"PrimaryUsage";
  v61[0] = &off_10006EA98;
  v61[1] = &off_10006EAB0;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:2];
  id v7 = [objc_alloc((Class)HIDEventSystemClient) initWithType:2];
  v42 = (void *)v6;
  [v7 setMatching:v6];
  v8 = objc_opt_new();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v41 = v7;
  CFStringRef v9 = [v7 services];
  id v10 = [v9 countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v49;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v49 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        v15 = [(AppleDeviceManagementHIDDiagnostics *)self dispatchGroup];
        dispatch_group_enter(v15);

        v16 = [v14 propertyForKey:@"PalmspringCrashlogRequestErrorStats"];
        v17 = v16;
        if (v16)
        {
          if ([v16 intValue])
          {
            v18 = [(AppleDeviceManagementHIDDiagnostics *)self dispatchGroup];
            dispatch_group_leave(v18);
          }
          [v8 addObject:v14];
          mach_error_t v19 = [v17 intValue];
        }
        else
        {
          v20 = [(AppleDeviceManagementHIDDiagnostics *)self dispatchGroup];
          dispatch_group_leave(v20);

          [v8 addObject:v14];
          mach_error_t v19 = -536870201;
        }
        v21 = [(id)objc_opt_class() log];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = [v14 serviceID];
          v23 = mach_error_string(v19);
          *(_DWORD *)buf = 134218242;
          double v56 = *(double *)&v22;
          __int16 v57 = 2080;
          v58 = v23;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Get property on service 0x%llX performed to collect error stats, ret: %s", buf, 0x16u);
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v48 objects:v59 count:16];
    }
    while (v11);
  }

  v24 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Waiting to receive notifications from crashlog extraction...", buf, 2u);
  }

  v25 = [(AppleDeviceManagementHIDDiagnostics *)self dispatchGroup];
  dispatch_time_t v26 = dispatch_time(0, 3000000000);
  intptr_t v40 = dispatch_group_wait(v25, v26);

  v27 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    [v43 timeIntervalSinceNow];
    *(_DWORD *)buf = 134217984;
    double v56 = v28 * -1000.0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Done waiting for crashlog extraction notifications, total time elapsed: %f ms", buf, 0xCu);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v29 = v8;
  id v30 = [v29 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v45;
    do
    {
      for (j = 0; j != v31; j = (char *)j + 1)
      {
        if (*(void *)v45 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
        v35 = [v34 propertyForKey:@"PalmspringCrashlogFetchLastCrashlog"];
        if (v35
          && [(AppleDeviceManagementHIDDiagnostics *)self handleExtractedErrorStats:v35])
        {
          v36 = [(id)objc_opt_class() log];
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            id v37 = [v34 serviceID];
            *(_DWORD *)buf = 134217984;
            double v56 = *(double *)&v37;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Successful extraction of error stats from service 0x%llX", buf, 0xCu);
          }
        }
        else
        {
          v36 = [(id)objc_opt_class() log];
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            sub_100038000(v52, v34, &v53, v36);
          }
        }
      }
      id v31 = [v29 countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v31);
  }

  v38 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v38, self, @"com.apple.hidswdebug.AppleDeviceManagementHIDFilter.CrashlogExtracted", 0);

  return v40 == 0;
}

- (BOOL)handleExtractedErrorStats:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"crashlogData"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"crashlogName"];
  id v7 = [v4 objectForKeyedSubscript:@"crashlogType"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v12 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10003806C(v12);
    }

    id v11 = 0;
    goto LABEL_11;
  }
  v8 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v6;
    __int16 v17 = 2112;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Crashlog %@ with type %@ received via notification", buf, 0x16u);
  }

  CFStringRef v9 = [(AppleDeviceManagementHIDDiagnostics *)self directory];
  id v14 = 0;
  BOOL v10 = 1;
  +[PalmspringCrashlog writeToDirectory:v9 crashlogData:v5 name:v6 options:1 error:&v14];
  id v11 = v14;

  if (([v7 isEqualToNumber:&off_10006EAC8] & 1) == 0) {
LABEL_11:
  }
    BOOL v10 = 0;

  return v10;
}

- (OS_dispatch_group)dispatchGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)directory
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directory, 0);

  objc_storeStrong((id *)&self->_dispatchGroup, 0);
}

@end