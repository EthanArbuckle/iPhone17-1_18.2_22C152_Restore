@interface CDDPrivacyMonitor
- (BOOL)isManagedConfigurationSettingOn;
- (BOOL)loadCurrentPrivacySetting;
- (BOOL)updateAllowed;
- (CDD)cdd;
- (CDDPrivacyMonitor)initWithCDDinstance:(id)a3;
- (void)privacyCloak;
- (void)saveCurrentPrivacySetting:(BOOL)a3;
- (void)setCdd:(id)a3;
- (void)shadowRemotePrivacySetting:(BOOL)a3;
@end

@implementation CDDPrivacyMonitor

- (void)saveCurrentPrivacySetting:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.CoreDuet"];
  v5 = +[_CDLogging admissionCheckChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Privacy: Writing the current App refresh privacy setting to on-disk plist", v7, 2u);
  }

  [v4 setBool:v3 forKey:@"CDDBackgroundAppRefresh"];
  [v4 synchronize];
  v6 = +[_CDLogging instrumentationChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10002323C(v6);
  }
}

- (void)shadowRemotePrivacySetting:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[_CDLogging admissionCheckChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL updateAllowed = self->updateAllowed;
    v9[0] = 67109376;
    v9[1] = updateAllowed;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Privacy: Changing current App refresh privacy setting from %d to %d.", (uint8_t *)v9, 0xEu);
  }

  if (!self->updateAllowed && v3)
  {
    v7 = [(CDDPrivacyMonitor *)self cdd];
    v8 = +[NSDate date];
    [v7 setDatabaseAge:v8];
  }
  self->BOOL updateAllowed = v3;
  [(CDDPrivacyMonitor *)self saveCurrentPrivacySetting:v3];
  if (!v3) {
    [(CDDPrivacyMonitor *)self deletePrivacySensitiveDBEntries];
  }
}

- (BOOL)loadCurrentPrivacySetting
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.CoreDuet"];
  BOOL v3 = v2;
  if (v2
    && ([v2 objectForKey:@"CDDBackgroundAppRefresh"],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    unsigned int v5 = [v3 BOOLForKey:@"CDDBackgroundAppRefresh"];
    v6 = +[_CDLogging admissionCheckChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 67109120;
      int v10 = v5;
      v7 = "Privacy: Loaded App refresh privacy setting to %d.";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v9, 8u);
    }
  }
  else
  {
    v6 = +[_CDLogging admissionCheckChannel];
    LOBYTE(v5) = 1;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 67109120;
      int v10 = 1;
      v7 = "Privacy: Error: Cannot load App refresh Privacy Setting. Defaulting to %d.";
      goto LABEL_7;
    }
  }

  return v5;
}

- (CDDPrivacyMonitor)initWithCDDinstance:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CDDPrivacyMonitor;
  unsigned int v5 = [(CDDPrivacyMonitor *)&v13 init];
  v6 = v5;
  if (v5)
  {
    [(CDDPrivacyMonitor *)v5 setCdd:v4];
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.coreduetdPrivacyDispatchQueue", v7);
    privacyDispatchQ = v6->privacyDispatchQ;
    v6->privacyDispatchQ = (OS_dispatch_queue *)v8;

    if (!v6->privacyDispatchQ)
    {
      BOOL v11 = 0;
      goto LABEL_7;
    }
    v6->BOOL updateAllowed = [(CDDPrivacyMonitor *)v6 isManagedConfigurationSettingOn];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)sub_100021A68, @"kKeepAppsUpToDateEnabledChangedNotification", 0, CFNotificationSuspensionBehaviorDrop);
    if (!v6->updateAllowed) {
      [(CDDPrivacyMonitor *)v6 deletePrivacySensitiveDBEntries];
    }
  }
  BOOL v11 = v6;
LABEL_7:

  return v11;
}

- (void)privacyCloak
{
  privacyDispatchQ = self->privacyDispatchQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021B54;
  block[3] = &unk_100038A78;
  block[4] = self;
  dispatch_sync(privacyDispatchQ, block);
}

- (BOOL)isManagedConfigurationSettingOn
{
  id v2 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v3 = [v2 isAutomaticAppUpdatesAllowed];

  return v3;
}

- (CDD)cdd
{
  return self->cdd;
}

- (void)setCdd:(id)a3
{
}

- (BOOL)updateAllowed
{
  return self->updateAllowed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->privacyDispatchQ, 0);

  objc_storeStrong((id *)&self->cdd, 0);
}

@end