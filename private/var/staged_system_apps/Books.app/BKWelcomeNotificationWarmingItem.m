@interface BKWelcomeNotificationWarmingItem
- (AMSPromise)notificationAuthorizationPromise;
- (BKWelcomeNotificationWarmingItem)init;
- (BOOL)featureEnabled;
- (BOOL)welcomeScreenShouldDisplayNavigationBar;
- (BOOL)welcomeScreenShouldShow;
- (NSDate)resolveNotificationAuthorizationPromiseNextRetry;
- (id)resolveNotificationAuthorizationPromise;
- (id)welcomeScreenViewControllerWithCompletion:(id)a3;
- (void)requestAuthorizationFromAMS;
- (void)setNotificationAuthorizationPromise:(id)a3;
- (void)setResolveNotificationAuthorizationPromiseNextRetry:(id)a3;
@end

@implementation BKWelcomeNotificationWarmingItem

- (void)requestAuthorizationFromAMS
{
  if ([(BKWelcomeNotificationWarmingItem *)self featureEnabled])
  {
    v3 = +[NSUserDefaults bu_groupUserDefaults];
    unsigned __int8 v4 = [v3 BOOLForKey:@"BKWelcomeNotificationWarmingItem.warmingSheetShown"];

    v5 = +[UIApplication sharedApplication];
    unsigned __int8 v6 = [v5 launchedToTest];

    if (v4 & 1) != 0 || (v6) {
      return;
    }
    v7 = +[AMSUserNotificationAuthorizationTask engagementRequestForFullSheet];
    [(BKWelcomeNotificationWarmingItem *)self setNotificationAuthorizationPromise:v7];

    id v9 = [(BKWelcomeNotificationWarmingItem *)self notificationAuthorizationPromise];
    v8 = [v9 continueWithBlock:&stru_100A475C8];
    [(BKWelcomeNotificationWarmingItem *)self setNotificationAuthorizationPromise:v8];
  }
  else
  {
    id v9 = +[BKNotificationManager sharedInstance];
    [v9 requestAuthorizationWithCompletion:0];
  }
}

- (BKWelcomeNotificationWarmingItem)init
{
  v5.receiver = self;
  v5.super_class = (Class)BKWelcomeNotificationWarmingItem;
  v2 = [(BKWelcomeNotificationWarmingItem *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BKWelcomeNotificationWarmingItem *)v2 requestAuthorizationFromAMS];
  }
  return v3;
}

- (BOOL)featureEnabled
{
  v2 = +[NSUserDefaults bu_groupUserDefaults];
  char v3 = [v2 BOOLForKey:@"BKDisableNotificationWarmingSheet"] ^ 1;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolveNotificationAuthorizationPromiseNextRetry, 0);

  objc_storeStrong((id *)&self->_notificationAuthorizationPromise, 0);
}

- (id)resolveNotificationAuthorizationPromise
{
  char v3 = [(BKWelcomeNotificationWarmingItem *)self resolveNotificationAuthorizationPromiseNextRetry];
  [v3 timeIntervalSinceNow];
  double v5 = v4;

  if (v5 <= 0.0)
  {
    unsigned __int8 v6 = [(BKWelcomeNotificationWarmingItem *)self notificationAuthorizationPromise];
    v8 = +[NSDate date];
    uint64_t v14 = 0;
    v7 = [v6 resultWithTimeout:&v14 error:5.0];
    uint64_t v9 = v14;
    [v8 timeIntervalSinceNow];
    if (!v7 && v9 && v10 <= -5.0)
    {
      v11 = BSUIWelcomeScreenLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1007EB448(v11);
      }

      v12 = +[NSDate dateWithTimeIntervalSinceNow:3.0];
      [(BKWelcomeNotificationWarmingItem *)self setResolveNotificationAuthorizationPromiseNextRetry:v12];
    }
  }
  else
  {
    unsigned __int8 v6 = BSUIWelcomeScreenLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "A recent attempt to resolve the authorization status promise timed out. Assuming we still can't resolve it.", buf, 2u);
    }
    v7 = 0;
  }

  return v7;
}

- (BOOL)welcomeScreenShouldShow
{
  char v3 = [(BKWelcomeNotificationWarmingItem *)self resolveNotificationAuthorizationPromise];
  BOOL v4 = 0;
  if ([(BKWelcomeNotificationWarmingItem *)self featureEnabled] && v3)
  {
    if ([v3 authorizationStatus])
    {
      BOOL v4 = 0;
    }
    else
    {
      double v5 = [v3 request];
      BOOL v4 = v5 != 0;
    }
  }
  unsigned __int8 v6 = +[NSUserDefaults bu_groupUserDefaults];
  unsigned int v7 = [v6 BOOLForKey:@"BKWelcomeNotificationWarmingItem.warmingSheetShown"];

  v8 = BSUIWelcomeScreenLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      CFStringRef v9 = @"Yes";
    }
    else {
      CFStringRef v9 = @"No";
    }
    if ([(BKWelcomeNotificationWarmingItem *)self featureEnabled]) {
      CFStringRef v10 = @"Yes";
    }
    else {
      CFStringRef v10 = @"No";
    }
    if ([v3 authorizationStatus]) {
      CFStringRef v11 = @"No";
    }
    else {
      CFStringRef v11 = @"Yes";
    }
    v12 = [v3 request];
    int v15 = 138544130;
    if (v12) {
      CFStringRef v13 = @"Yes";
    }
    else {
      CFStringRef v13 = @"No";
    }
    CFStringRef v16 = v9;
    __int16 v17 = 2114;
    CFStringRef v18 = v10;
    __int16 v19 = 2114;
    CFStringRef v20 = v11;
    __int16 v21 = 2114;
    CFStringRef v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "should display notification warming sheet: Already showed it in the past? %{public}@; Feature Enabled: %{public}@ "
      "; Authorization status is undertermined: %{public}@; Got a AMSEngagementRequest back: %{public}@; ",
      (uint8_t *)&v15,
      0x2Au);
  }
  return v4;
}

- (BOOL)welcomeScreenShouldDisplayNavigationBar
{
  return 1;
}

- (id)welcomeScreenViewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(BKWelcomeNotificationWarmingItem *)self featureEnabled])
  {
    double v5 = [(BKWelcomeNotificationWarmingItem *)self resolveNotificationAuthorizationPromise];
    unsigned __int8 v6 = [v5 request];
    [v6 setMetricsOverlay:&off_100A833D8];
    id v7 = objc_alloc((Class)AMSUIEngagementTaskViewController);
    v8 = +[BUBag defaultBag];
    id v9 = [v7 initWithRequest:v6 bag:v8];

    CFStringRef v10 = [v9 startEngagement];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100114DC4;
    v12[3] = &unk_100A475F0;
    id v13 = v4;
    [v10 addFinishBlock:v12];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (AMSPromise)notificationAuthorizationPromise
{
  return self->_notificationAuthorizationPromise;
}

- (void)setNotificationAuthorizationPromise:(id)a3
{
}

- (NSDate)resolveNotificationAuthorizationPromiseNextRetry
{
  return self->_resolveNotificationAuthorizationPromiseNextRetry;
}

- (void)setResolveNotificationAuthorizationPromiseNextRetry:(id)a3
{
}

@end