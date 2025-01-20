@interface FRApplicationUpdateNotifier
- (BOOL)isAlertPresentationIntervalPassed;
- (BOOL)isPresentingAlert;
- (BOOL)shouldPresentLastAlertForCurrentUpdate;
- (BOOL)shouldShowUpdateAlert;
- (FRApplicationUpdateNotifier)init;
- (FRApplicationUpdateNotifier)initWithVersionHelpers:(id)a3 appActivityMonitor:(id)a4;
- (FRVersionHelpers)versionHelpers;
- (NSDate)nextAlertPresentationDate;
- (UIViewController)viewController;
- (id)persistableProperties;
- (int64_t)alertPresentationCount;
- (void)activityObservingApplicationWindowDidBecomeForeground;
- (void)launchSettings;
- (void)persistStates;
- (void)restoreStates;
- (void)setAlertPresentationCount:(int64_t)a3;
- (void)setIsPresentingAlert:(BOOL)a3;
- (void)setNextAlertPresentationDate:(id)a3;
- (void)setVersionHelpers:(id)a3;
- (void)setViewController:(id)a3;
- (void)setup;
- (void)showAppUpdateAlert;
- (void)updateAlertDidDismiss:(BOOL)a3;
@end

@implementation FRApplicationUpdateNotifier

- (void)restoreStates
{
  v3 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v3 dictionaryForKey:@"FRAUNPersistedState"];

  v4 = [(FRApplicationUpdateNotifier *)self persistableProperties];
  v5 = [v6 dictionaryWithValuesForKeys:v4];

  if ([v5 count]) {
    [(FRApplicationUpdateNotifier *)self setValuesForKeysWithDictionary:v5];
  }
}

- (FRApplicationUpdateNotifier)initWithVersionHelpers:(id)a3 appActivityMonitor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100073F34();
    if (v8) {
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100073E54();
  }
LABEL_6:
  v12.receiver = self;
  v12.super_class = (Class)FRApplicationUpdateNotifier;
  v9 = [(FRApplicationUpdateNotifier *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_versionHelpers, a3);
    [v8 addObserver:v10];
  }

  return v10;
}

- (void)activityObservingApplicationWindowDidBecomeForeground
{
  if ([(FRApplicationUpdateNotifier *)self shouldShowUpdateAlert]) {
    [(FRApplicationUpdateNotifier *)self showAppUpdateAlert];
  }
  id v3 = [(FRApplicationUpdateNotifier *)self versionHelpers];
  [v3 updateAppObsolescenceState];
}

- (FRVersionHelpers)versionHelpers
{
  return self->_versionHelpers;
}

- (BOOL)shouldShowUpdateAlert
{
  id v3 = [(FRApplicationUpdateNotifier *)self versionHelpers];
  BOOL v4 = [v3 isUpdateRequired]
    && ![(FRApplicationUpdateNotifier *)self isPresentingAlert]
    && [(FRApplicationUpdateNotifier *)self isAlertPresentationIntervalPassed]
    && [(FRApplicationUpdateNotifier *)self alertPresentationCount] < 3;

  return v4;
}

- (void)setup
{
}

- (void)setViewController:(id)a3
{
}

- (id)persistableProperties
{
  return &off_1000CF9F0;
}

- (FRApplicationUpdateNotifier)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v6 = "-[FRApplicationUpdateNotifier init]";
    __int16 v7 = 2080;
    id v8 = "FRApplicationUpdateNotifier.m";
    __int16 v9 = 1024;
    int v10 = 41;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FRApplicationUpdateNotifier init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (void)persistStates
{
  id v3 = +[NSMutableDictionary dictionary];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(FRApplicationUpdateNotifier *)self persistableProperties];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        int v10 = [(FRApplicationUpdateNotifier *)self valueForKey:v9];
        if (v10) {
          [v3 setObject:v10 forKeyedSubscript:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  __int16 v11 = +[NSUserDefaults standardUserDefaults];
  [v11 setObject:v3 forKey:@"FRAUNPersistedState"];
}

- (void)showAppUpdateAlert
{
  id v3 = [(FRApplicationUpdateNotifier *)self viewController];

  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100074014();
  }
  id v4 = [(FRApplicationUpdateNotifier *)self viewController];

  if (v4)
  {
    id v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"FRTimeToUpdateAlertTitle" value:&stru_1000CABC0 table:0];

    uint64_t v7 = +[NSBundle mainBundle];
    id v8 = [v7 localizedStringForKey:@"FRInstallLatestVersionOS" value:&stru_1000CABC0 table:0];

    uint64_t v9 = +[NSBundle mainBundle];
    int v10 = [v9 localizedStringForKey:@"FRGoToSettings" value:&stru_1000CABC0 table:0];

    LODWORD(v9) = [(FRApplicationUpdateNotifier *)self shouldPresentLastAlertForCurrentUpdate];
    __int16 v11 = +[NSBundle mainBundle];
    long long v12 = v11;
    if (v9) {
      CFStringRef v13 = @"No Thanks";
    }
    else {
      CFStringRef v13 = @"Not Now";
    }
    long long v14 = [v11 localizedStringForKey:v13 value:&stru_1000CABC0 table:0];

    long long v15 = +[UIAlertController alertControllerWithTitle:v6 message:v8 preferredStyle:1];
    objc_initWeak(location, self);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100034D64;
    v25[3] = &unk_1000C7570;
    objc_copyWeak(&v26, location);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100034DC0;
    v23[3] = &unk_1000C5850;
    v16 = objc_retainBlock(v25);
    id v24 = v16;
    v17 = +[UIAlertAction actionWithTitle:v14 style:0 handler:v23];
    [v15 addAction:v17];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100034DD4;
    v21[3] = &unk_1000C5850;
    v18 = v16;
    id v22 = v18;
    v19 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v21];
    [v15 addAction:v19];
    self->_isPresentingAlert = 1;
    v20 = [(FRApplicationUpdateNotifier *)self viewController];
    [v20 presentViewController:v15 animated:1 completion:0];

    objc_destroyWeak(&v26);
    objc_destroyWeak(location);
  }
}

- (void)updateAlertDidDismiss:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSDate dateWithTimeIntervalSinceNow:86400.0];
  [(FRApplicationUpdateNotifier *)self setNextAlertPresentationDate:v5];

  ++self->_alertPresentationCount;
  [(FRApplicationUpdateNotifier *)self persistStates];
  if (v3)
  {
    [(FRApplicationUpdateNotifier *)self launchSettings];
  }
}

- (void)launchSettings
{
  id v2 = (id)objc_opt_new();
  [v2 openApplication:@"com.apple.Preferences" options:0 withResult:0];
}

- (BOOL)isAlertPresentationIntervalPassed
{
  BOOL v3 = NewsCoreUserDefaults();
  if ([v3 BOOLForKey:FCSimulateAppObsolescenceSharedPreferenceKey])
  {
    BOOL v4 = 1;
  }
  else
  {
    NewsCoreUserDefaults();
    id v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    if ([(NSDate *)v5 BOOLForKey:FCSimulateOSObsolescenceSharedPreferenceKey])
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = NewsCoreUserDefaults();
      unsigned __int8 v7 = [v6 BOOLForKey:FCSimulateHardwareObsolescenceSharedPreferenceKey];

      if (v7) {
        return 1;
      }
      nextAlertPresentationDate = self->_nextAlertPresentationDate;
      if (!nextAlertPresentationDate) {
        return 1;
      }
      BOOL v3 = +[NSDate date];
      id v5 = [(NSDate *)nextAlertPresentationDate earlierDate:v3];
      BOOL v4 = v5 == self->_nextAlertPresentationDate;
    }
  }
  return v4;
}

- (BOOL)shouldPresentLastAlertForCurrentUpdate
{
  return self->_alertPresentationCount > 1;
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (UIViewController *)WeakRetained;
}

- (NSDate)nextAlertPresentationDate
{
  return self->_nextAlertPresentationDate;
}

- (void)setNextAlertPresentationDate:(id)a3
{
}

- (int64_t)alertPresentationCount
{
  return self->_alertPresentationCount;
}

- (void)setAlertPresentationCount:(int64_t)a3
{
  self->_alertPresentationCount = a3;
}

- (BOOL)isPresentingAlert
{
  return self->_isPresentingAlert;
}

- (void)setIsPresentingAlert:(BOOL)a3
{
  self->_isPresentingAlert = a3;
}

- (void)setVersionHelpers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionHelpers, 0);
  objc_storeStrong((id *)&self->_nextAlertPresentationDate, 0);

  objc_destroyWeak((id *)&self->_viewController);
}

@end