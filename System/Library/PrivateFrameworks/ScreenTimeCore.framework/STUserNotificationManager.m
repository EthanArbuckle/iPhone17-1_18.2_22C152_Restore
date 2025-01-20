@interface STUserNotificationManager
- (NSDictionary)notificationCenterByBundleIdentifier;
- (STUserNotificationManager)init;
- (void)_postNotificationRequest:(id)a3 context:(id)a4 notificationCenter:(id)a5 withCompletionHandler:(id)a6;
- (void)_requestAuthorizationForNotificationRequest:(id)a3 context:(id)a4 notificationCenter:(id)a5 withCompletionHandler:(id)a6;
- (void)_shouldPostNotificationRequest:(id)a3 notificationCenter:(id)a4 withCompletionHandler:(id)a5;
- (void)postNotificationForContext:(id)a3 completionHandler:(id)a4;
- (void)postNotificationNotificationReceived:(id)a3;
- (void)removeNotificationForContext:(id)a3 completionHandler:(id)a4;
- (void)removeNotificationNotificationReceived:(id)a3;
- (void)resume;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation STUserNotificationManager

- (STUserNotificationManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)STUserNotificationManager;
  v2 = [(STUserNotificationManager *)&v18 init];
  if (v2)
  {
    v20[0] = STScreenTimeNotificationsBundleIdentifier;
    id v3 = [objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:STScreenTimeNotificationsBundleIdentifier];
    v21[0] = v3;
    v20[1] = STScreenTimeDowntimeNotificationBundleIdentifier;
    id v4 = [objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:STScreenTimeDowntimeNotificationBundleIdentifier];
    v21[1] = v4;
    v20[2] = STScreenTimeEnabledNotificationBundleIdentifier;
    id v5 = [objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:STScreenTimeEnabledNotificationBundleIdentifier];
    v21[2] = v5;
    uint64_t v6 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
    notificationCenterByBundleIdentifier = v2->_notificationCenterByBundleIdentifier;
    v2->_notificationCenterByBundleIdentifier = (NSDictionary *)v6;

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v8 = [(NSDictionary *)v2->_notificationCenterByBundleIdentifier allValues];
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * (void)v12) setDelegate:v2];
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v10);
    }
  }
  return v2;
}

- (void)resume
{
  id v3 = [(STUserNotificationManager *)self notificationCenterByBundleIdentifier];
  id v4 = [v3 allValues];
  [v4 makeObjectsPerformSelector:"setWantsNotificationResponsesDelivered"];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"postNotificationNotificationReceived:" name:@"STUserNotificationManagerShouldPostNotification" object:0];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"removeNotificationNotificationReceived:" name:@"STUserNotificationManagerShouldRemoveNotification" object:0];
}

- (void)postNotificationNotificationReceived:(id)a3
{
  id v5 = a3;
  if (+[NSThread isMainThread])
  {
    id v6 = [v5 object];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      goto LABEL_8;
    }
    v8 = [v5 object];
    objc_opt_class();
    char v9 = objc_opt_isKindOfClass();

    if (v9) {
      goto LABEL_8;
    }
    id v10 = [v5 object];
    objc_opt_class();
    char v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) != 0
      || ([v5 object],
          v12 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char v13 = objc_opt_isKindOfClass(),
          v12,
          (v13 & 1) != 0))
    {
LABEL_8:
      long long v14 = objc_opt_new();
      [(STUserNotificationManager *)self removeNotificationForContext:v14 completionHandler:0];
    }
    long long v15 = [v5 object];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100098CFC;
    v16[3] = &unk_1002FC888;
    id v17 = v5;
    [(STUserNotificationManager *)self postNotificationForContext:v15 completionHandler:v16];
  }
  else
  {
    [(STUserNotificationManager *)self performSelectorOnMainThread:a2 withObject:v5 waitUntilDone:0];
  }
}

- (void)postNotificationForContext:(id)a3 completionHandler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100098E28;
  v8[3] = &unk_1002FE980;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  [v7 notificationContentWithCompletionBlock:v8];
}

- (void)_requestAuthorizationForNotificationRequest:(id)a3 context:(id)a4 notificationCenter:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100099064;
  v16[3] = &unk_1002FE9A8;
  id v20 = a5;
  id v21 = a6;
  id v17 = v11;
  objc_super v18 = self;
  id v19 = v10;
  id v12 = v20;
  id v13 = v10;
  id v14 = v21;
  id v15 = v11;
  [v12 requestAuthorizationWithOptions:66 completionHandler:v16];
}

- (void)_postNotificationRequest:(id)a3 context:(id)a4 notificationCenter:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100099270;
  v15[3] = &unk_1002FE9D0;
  id v16 = a4;
  id v17 = a5;
  id v18 = v10;
  id v19 = a6;
  id v11 = v10;
  id v12 = v17;
  id v13 = v19;
  id v14 = v16;
  [(STUserNotificationManager *)self _shouldPostNotificationRequest:v11 notificationCenter:v12 withCompletionHandler:v15];
}

- (void)_shouldPostNotificationRequest:(id)a3 notificationCenter:(id)a4 withCompletionHandler:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10009957C;
  v9[3] = &unk_1002FE9F8;
  id v10 = a3;
  id v11 = a5;
  id v7 = v11;
  id v8 = v10;
  [a4 getDeliveredNotificationsWithCompletionHandler:v9];
}

- (void)removeNotificationNotificationReceived:(id)a3
{
  id v5 = a3;
  if (+[NSThread isMainThread])
  {
    id v6 = [v5 object];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100099794;
    v7[3] = &unk_1002FC888;
    id v8 = v5;
    [(STUserNotificationManager *)self removeNotificationForContext:v6 completionHandler:v7];
  }
  else
  {
    [(STUserNotificationManager *)self performSelectorOnMainThread:a2 withObject:v5 waitUntilDone:0];
  }
}

- (void)removeNotificationForContext:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  id v7 = a3;
  id v8 = [(STUserNotificationManager *)self notificationCenterByBundleIdentifier];
  id v9 = [v7 notificationBundleIdentifier];
  id v10 = [v8 objectForKeyedSubscript:v9];

  id v11 = [v7 identifier];

  id v13 = v11;
  id v12 = +[NSArray arrayWithObjects:&v13 count:1];
  [v10 removeDeliveredNotificationsWithIdentifiers:v12];

  if (v6) {
    v6[2](v6, 0);
  }
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = (void (**)(void))a5;
  id v8 = a4;
  id v9 = [v8 notification];
  id v10 = [v9 request];

  id v11 = [v10 content];
  id v12 = [v11 categoryIdentifier];

  id v13 = [v8 actionIdentifier];

  id v14 = +[STLog userNotifications];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v37 = v12;
    __int16 v38 = 2114;
    v39 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received notification response category: %{public}@ action: %{public}@", buf, 0x16u);
  }

  if ([v12 isEqualToString:STNotificationCategoryAskForTime])
  {
    id v15 = [v10 identifier];
    unsigned __int8 v16 = [v13 isEqualToString:STNotificationActionIdentifierApproveFifteen];
    uint64_t v17 = STNotificationActionIdentifierApproveHour;
    if ((v16 & 1) != 0
      || ([v13 isEqualToString:STNotificationActionIdentifierApproveHour] & 1) != 0
      || [v13 isEqualToString:STNotificationActionIdentifierApproveDay])
    {
      if ([v13 isEqualToString:v17])
      {
        id v18 = &off_10030FE38;
      }
      else
      {
        unsigned int v25 = [v13 isEqualToString:STNotificationActionIdentifierApproveDay];
        id v18 = &off_10030FE20;
        if (v25) {
          id v18 = &off_10030FE50;
        }
      }
      v34[0] = STUserNotificationAskForTimeKeyRequestIdentifier;
      v34[1] = STUserNotificationAskForTimeKeyTimeApproved;
      v35[0] = v15;
      v35[1] = v18;
      v24 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
      v26 = +[STLog userNotifications];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v37 = v15;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Received approval for ask for time identifier %{public}@", buf, 0xCu);
      }

      v27 = +[NSNotificationCenter defaultCenter];
      v28 = v27;
      v29 = &STUserNotificationAskForTimeResponseReceivedApprove;
    }
    else
    {
      if (![v13 isEqualToString:STNotificationActionIdentifierDontApprove])
      {
        v24 = +[STLog userNotifications];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_100268E74((uint64_t)v13, v24);
        }
        goto LABEL_26;
      }
      uint64_t v32 = STUserNotificationAskForTimeKeyRequestIdentifier;
      v33 = v15;
      v24 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      v31 = +[STLog userNotifications];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v37 = v15;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Received rejection of ask for time identifier %{public}@", buf, 0xCu);
      }

      v27 = +[NSNotificationCenter defaultCenter];
      v28 = v27;
      v29 = &STUserNotificationAskForTimeResponseReceivedDontApprove;
    }
    [v27 postNotificationName:*v29 object:self userInfo:v24];

LABEL_26:
LABEL_32:

    goto LABEL_33;
  }
  if ([v12 isEqualToString:STNotificationCategoryManageContacts])
  {
    if ([v13 isEqualToString:STNotificationActionIdentifierApproveManagement])
    {
      id v19 = +[STLog userNotifications];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Received approval for ask to manage contacts", buf, 2u);
      }

      id v20 = +[NSNotificationCenter defaultCenter];
      id v15 = v20;
      id v21 = &STUserNotificationAskToManageContactsResponseReceivedApprove;
    }
    else
    {
      if (![v13 isEqualToString:STNotificationActionIdentifierDontApproveManagement]) {
        goto LABEL_33;
      }
      v30 = +[STLog userNotifications];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Received rejection for ask to manage contacts", buf, 2u);
      }

      id v20 = +[NSNotificationCenter defaultCenter];
      id v15 = v20;
      id v21 = &STUserNotificationAskToManageContactsResponseReceivedDontApprove;
    }
    [v20 postNotificationName:*v21 object:self userInfo:0];
    goto LABEL_32;
  }
  if ([v12 isEqualToString:STUserNotificationWeeklyReportCategoryIdentifier]
    && (([v13 isEqualToString:STUserNotificationWeeklyReportPrimaryActionIdentifier] & 1) != 0
     || [v13 isEqualToString:@"RMUserNotificationWeeklyReportPrimaryActionIdentifier"]))
  {
    v22 = +[STLog userNotifications];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v37 = v13;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Received primary action for weekly notification %{public}@", buf, 0xCu);
    }

    id v15 = +[LSApplicationWorkspace defaultWorkspace];
    v23 = objc_opt_new();
    [v23 setScheme:STPrefsURLComponentScheme];
    [v23 setPath:STPrefsURLComponentPathScreenTimeSummary];
    [v23 setFragment:STPrefsURLComponentFragmentWeek];
    v24 = [v23 URL];

    [v15 openSensitiveURL:v24 withOptions:0];
    goto LABEL_26;
  }
LABEL_33:
  if (v7) {
    v7[2](v7);
  }
}

- (NSDictionary)notificationCenterByBundleIdentifier
{
  return self->_notificationCenterByBundleIdentifier;
}

- (void).cxx_destruct
{
}

@end