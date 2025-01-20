@interface BKNotificationManager
+ (id)sharedInstance;
- (BKNotificationManager)init;
- (BKNotificationOptInStatusController)statusController;
- (NSMutableArray)reauthorizationCompletions;
- (UNUserNotificationCenter)center;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_emitNotificationEngagementEventForResponse:(id)a3;
- (void)getAuthorizationStatusWithCompletion:(id)a3;
- (void)getAuthorizationStatusWithCompletionValue:(id)a3;
- (void)handleNotificationResponse:(id)a3;
- (void)handlePriceTrackingNotificationResponse:(id)a3 content:(id)a4;
- (void)requestAuthorizationWithCompletion:(id)a3;
- (void)requestAuthorizationWithCompletionValue:(id)a3;
- (void)requestReauthorizationWithCompletion:(id)a3;
- (void)setCenter:(id)a3;
- (void)setReauthorizationCompletions:(id)a3;
- (void)setStatusController:(id)a3;
- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation BKNotificationManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100078D84;
  block[3] = &unk_100A43EF8;
  block[4] = a1;
  if (qword_100B4A578 != -1) {
    dispatch_once(&qword_100B4A578, block);
  }
  v2 = (void *)qword_100B4A580;

  return v2;
}

- (BKNotificationManager)init
{
  v19.receiver = self;
  v19.super_class = (Class)BKNotificationManager;
  v2 = [(BKNotificationManager *)&v19 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    reauthorizationCompletions = v2->_reauthorizationCompletions;
    v2->_reauthorizationCompletions = (NSMutableArray *)v3;

    uint64_t v5 = +[UNUserNotificationCenter currentNotificationCenter];
    center = v2->_center;
    v2->_center = (UNUserNotificationCenter *)v5;

    v7 = +[BKAchievementsNotificationController categoryIdentifier];
    v8 = +[UNNotificationCategory categoryWithIdentifier:v7 actions:&__NSArray0__struct intentIdentifiers:&__NSArray0__struct options:1];

    v9 = +[UNNotificationCategory YearInReviewNotificationCategoryIdentifier];
    v10 = +[UNNotificationCategory categoryWithIdentifier:v9 actions:&__NSArray0__struct intentIdentifiers:&__NSArray0__struct options:1];

    v11 = v2->_center;
    v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v10, 0);
    [(UNUserNotificationCenter *)v11 setNotificationCategories:v12];

    [(UNUserNotificationCenter *)v2->_center setDelegate:v2];
    v13 = v2->_center;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100009168;
    v17[3] = &unk_100A49AC8;
    v14 = v2;
    v18 = v14;
    [(UNUserNotificationCenter *)v13 getNotificationSettingsWithCompletionHandler:v17];
    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v14 selector:"_applicationWillEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];
  }
  return v2;
}

- (void)getAuthorizationStatusWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKNotificationManager *)self center];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10019E06C;
  v7[3] = &unk_100A49B18;
  id v8 = v4;
  id v6 = v4;
  [v5 getNotificationSettingsWithCompletionHandler:v7];
}

- (UNUserNotificationCenter)center
{
  return self->_center;
}

- (void)_applicationWillEnterForeground:(id)a3
{
  id v4 = [(BKNotificationManager *)self statusController];
  [v4 checkAndReportOptInStatus];

  uint64_t v5 = [(BKNotificationManager *)self reauthorizationCompletions];
  if ([v5 count])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[BKNotificationManager] [Reauthorization] Returned from Settings app", buf, 2u);
    }
    id v6 = +[NSMutableArray array];
    [(BKNotificationManager *)self setReauthorizationCompletions:v6];

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10019D5C4;
    v7[3] = &unk_100A46370;
    void v7[4] = v5;
    [(BKNotificationManager *)self getAuthorizationStatusWithCompletion:v7];
  }
}

- (void)getAuthorizationStatusWithCompletionValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKNotificationManager *)self center];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10019D7FC;
  v7[3] = &unk_100A49AC8;
  id v8 = v4;
  id v6 = v4;
  [v5 getNotificationSettingsWithCompletionHandler:v7];
}

- (void)requestAuthorizationWithCompletionValue:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10019D98C;
  v5[3] = &unk_100A44268;
  id v6 = a3;
  id v4 = v6;
  [(BKNotificationManager *)self requestAuthorizationWithCompletion:v5];
}

- (void)requestAuthorizationWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKNotificationManager *)self center];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10019DB18;
  v7[3] = &unk_100A46D88;
  id v8 = v4;
  id v6 = v4;
  [v5 requestAuthorizationWithOptions:38 completionHandler:v7];
}

- (void)requestReauthorizationWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10019DC30;
  v4[3] = &unk_100A49AF0;
  uint64_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(BKNotificationManager *)v5 getAuthorizationStatusWithCompletion:v4];
}

- (void)handleNotificationResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 notification];
  id v6 = [v5 request];
  v7 = [v6 content];

  id v8 = [v7 categoryIdentifier];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v7;
    __int16 v23 = 2112;
    v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Processing incoming notification: %@, category ID: %@", buf, 0x16u);
  }
  v9 = +[BKAchievementsNotificationController categoryIdentifier];
  unsigned int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    v11 = [v4 actionIdentifier];
    unsigned int v12 = [v11 isEqualToString:UNNotificationDefaultActionIdentifier];

    if (v12)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v7 userInfo];
        *(_DWORD *)buf = 138412290;
        v22 = v13;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Requested to open achievement sheet: %@", buf, 0xCu);
      }
      [(BKNotificationManager *)self _emitNotificationEngagementEventForResponse:v4];
      v14 = +[BKAppDelegate sceneManager];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10019E3A0;
      v19[3] = &unk_100A49B40;
      id v20 = v7;
      [v14 requestPrimaryOrBookScene:v19];
    }
  }
  else
  {
    v15 = +[UNNotificationCategory YearInReviewNotificationCategoryIdentifier];
    unsigned int v16 = [v8 isEqualToString:v15];

    if (v16)
    {
      v17 = [v4 actionIdentifier];
      unsigned int v18 = [v17 isEqualToString:UNNotificationDefaultActionIdentifier];

      if (v18) {
        +[JSAApplication openYearInReview];
      }
    }
    else if ([v8 isEqualToString:BDSPriceTrackerNotificationCategoryIdentifier])
    {
      [(BKNotificationManager *)self handlePriceTrackingNotificationResponse:v4 content:v7];
    }
  }
}

- (void)handlePriceTrackingNotificationResponse:(id)a3 content:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 actionIdentifier];
  unsigned __int8 v8 = [v7 isEqualToString:UNNotificationDefaultActionIdentifier];

  if (v8)
  {
    objc_opt_class();
    v9 = [v6 userInfo];
    unsigned int v10 = [v9 objectForKeyedSubscript:BDSPriceTrackerNotificationDeepLinkURLKey];
    v11 = BUDynamicCast();

    if (v11)
    {
      unsigned int v12 = +[NSURL URLWithString:v11];
      v13 = +[UIApplication sharedApplication];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        v15 = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[PriceTracking] opening notification deep link URL %@...", (uint8_t *)&v14, 0xCu);
      }
      [v13 openURL:v12 options:&__NSDictionary0__struct completionHandler:&stru_100A49B60];
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1007EE47C();
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1007EE4C4(v5);
  }
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  v7 = (void (**)(void))a5;
  [(BKNotificationManager *)self handleNotificationResponse:a4];
  v7[2]();
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
}

- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[NSNotificationCenter defaultCenter];
  CFStringRef v9 = @"settings";
  id v10 = v5;
  unsigned __int8 v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];

  [v7 postNotificationName:@"UNUserNotificationCenterDidChangeSettings" object:v6 userInfo:v8];
}

- (void)_emitNotificationEngagementEventForResponse:(id)a3
{
  id v3 = [a3 notification];
  id v17 = [v3 request];

  id v4 = [v17 content];
  id v5 = [v4 userInfo];
  v15 = [v17 identifier];
  unsigned int v16 = [v4 title];
  id v6 = +[BKAchievementsNotificationController titleKeyFromNotificationUserInfo:v5];
  v7 = [v4 body];
  unsigned __int8 v8 = +[BKAchievementsNotificationController messageKeyFromNotificationUserInfo:v5];
  id v9 = [objc_alloc((Class)BANotificationData) initWithNotificationContentID:0 notificationID:v15 notificationType:2 recoType:0 goalType:[BKAchievementsNotificationController goalTypeFromNotificationUserInfo:v5] titleCode:v6 title:v8 messageCode:v7];
  id v10 = [objc_alloc((Class)BANotificationEngagementData) initWithActionType:1 actionUrl:&stru_100A70340 targetID:&__NSArray0__struct targetType:0];
  v11 = +[BKAppDelegate delegate];
  unsigned int v12 = [v11 primaryAnalyticsController];

  v13 = +[BAEventReporter sharedReporter];
  int v14 = [v12 applicationTracker];
  [v13 emitNotificationEngagementEventWithTracker:v14 engagementData:v10 notificationData:v9];
}

- (NSMutableArray)reauthorizationCompletions
{
  return self->_reauthorizationCompletions;
}

- (void)setReauthorizationCompletions:(id)a3
{
}

- (void)setCenter:(id)a3
{
}

- (BKNotificationOptInStatusController)statusController
{
  return self->_statusController;
}

- (void)setStatusController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusController, 0);
  objc_storeStrong((id *)&self->_center, 0);

  objc_storeStrong((id *)&self->_reauthorizationCompletions, 0);
}

@end