@interface CARUserAlerts
- (CARUserAlerts)init;
- (CARUserAlerts)initWithNotificationCenter:(id)a3;
- (NSMutableArray)presentedBulletins;
- (UNUserNotificationCenter)notificationCenter;
- (id)_alertsOfClass:(Class)a3;
- (void)_injectAlert:(id)a3;
- (void)_showBulletin:(id)a3;
- (void)dealloc;
- (void)dismissAlert:(id)a3;
- (void)dismissAlertsOfClass:(Class)a3;
- (void)postBannerWithTitle:(id)a3 message:(id)a4 destinations:(unint64_t)a5;
- (void)setPresentedBulletins:(id)a3;
- (void)showDNDEndNotificationWithText:(id)a3 completion:(id)a4;
- (void)showDNDEnterGeofenceWithCompletion:(id)a3;
- (void)showDNDExitGeofenceWithCompletion:(id)a3;
- (void)showDNDNotDrivingAlertWithCompletion:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation CARUserAlerts

- (CARUserAlerts)initWithNotificationCenter:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CARUserAlerts;
  v6 = [(CARUserAlerts *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_notificationCenter, a3);
    v8 = [(CARUserAlerts *)v7 notificationCenter];
    [v8 setDelegate:v7];

    v9 = [(CARUserAlerts *)v7 notificationCenter];
    [v9 setWantsNotificationResponsesDelivered];

    uint64_t v10 = +[NSMutableArray array];
    presentedBulletins = v7->_presentedBulletins;
    v7->_presentedBulletins = (NSMutableArray *)v10;

    v12 = +[NSMutableSet set];
    if (CRIsInternalInstall())
    {
      v13 = +[CRBulletin notificationCategory];
      v21[0] = v13;
      v14 = +[CRBulletin notificationCategory];
      v21[1] = v14;
      v15 = +[CRBulletin notificationCategory];
      v21[2] = v15;
      v16 = +[CRBulletin notificationCategory];
      v21[3] = v16;
      v17 = +[NSArray arrayWithObjects:v21 count:4];
      [v12 addObjectsFromArray:v17];
    }
    v18 = [(CARUserAlerts *)v7 notificationCenter];
    [v18 setNotificationCategories:v12];
  }
  return v7;
}

- (CARUserAlerts)init
{
  id v3 = [objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.CarKit.notifications"];
  v4 = [(CARUserAlerts *)self initWithNotificationCenter:v3];

  return v4;
}

- (void)dealloc
{
  [(UNUserNotificationCenter *)self->_notificationCenter removeAllDeliveredNotifications];
  v3.receiver = self;
  v3.super_class = (Class)CARUserAlerts;
  [(CARUserAlerts *)&v3 dealloc];
}

- (void)_showBulletin:(id)a3
{
  id v4 = a3;
  id v5 = [(CARUserAlerts *)self presentedBulletins];
  objc_sync_enter(v5);
  v6 = [(CARUserAlerts *)self presentedBulletins];
  [v6 addObject:v4];

  objc_sync_exit(v5);
  v7 = CarDNDWDLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v4 title];
    v9 = [v4 recordID];
    *(_DWORD *)buf = 138412802;
    id v16 = v4;
    __int16 v17 = 2114;
    v18 = v8;
    __int16 v19 = 2112;
    objc_super v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Requesting bulletin %@ %{public}@ %@", buf, 0x20u);
  }
  uint64_t v10 = [(CARUserAlerts *)self notificationCenter];
  v11 = [v4 notificationRequest];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000034C4;
  v13[3] = &unk_1000BD078;
  id v14 = v4;
  id v12 = v4;
  [v10 addNotificationRequest:v11 withCompletionHandler:v13];
}

- (void)dismissAlert:(id)a3
{
  id v4 = a3;
  id v5 = CarDNDWDLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 recordID];
    *(_DWORD *)buf = 138412546;
    id v18 = v4;
    __int16 v19 = 2112;
    objc_super v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dismissing banner %@ %@", buf, 0x16u);
  }
  v7 = [(CARUserAlerts *)self notificationCenter];
  v8 = [v4 recordID];
  id v16 = v8;
  v9 = +[NSArray arrayWithObjects:&v16 count:1];
  [v7 removeDeliveredNotificationsWithIdentifiers:v9];

  uint64_t v10 = [(CARUserAlerts *)self notificationCenter];
  v11 = [v4 recordID];
  v15 = v11;
  id v12 = +[NSArray arrayWithObjects:&v15 count:1];
  [v10 removePendingNotificationRequestsWithIdentifiers:v12];

  v13 = [(CARUserAlerts *)self presentedBulletins];
  objc_sync_enter(v13);
  id v14 = [(CARUserAlerts *)self presentedBulletins];
  [v14 removeObject:v4];

  objc_sync_exit(v13);
}

- (void)dismissAlertsOfClass:(Class)a3
{
  id v5 = [(CARUserAlerts *)self presentedBulletins];
  objc_sync_enter(v5);
  v6 = [(CARUserAlerts *)self presentedBulletins];
  id v7 = [v6 copy];

  objc_sync_exit(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000380C;
  v8[3] = &unk_1000BD0A0;
  v8[4] = self;
  v8[5] = a3;
  [v7 enumerateObjectsUsingBlock:v8];
}

- (void)postBannerWithTitle:(id)a3 message:(id)a4 destinations:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = CarGeneralLogging();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Internal: Presenting banner with title: %@, message: %@", (uint8_t *)&v12, 0x16u);
  }

  v11 = [[CRBulletin alloc] initWithTitle:v8 message:v9 destinations:a5];
  [(CARUserAlerts *)self _showBulletin:v11];
}

- (void)showDNDEnterGeofenceWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = CarDNDWDLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Internal: Presenting enter geofence notification", v7, 2u);
  }

  v6 = +[CRDNDGeofenceAlert alertForEnteringGeofence:1];
  [v6 setActionHandler:v4];

  [(CARUserAlerts *)self _showBulletin:v6];
}

- (void)showDNDExitGeofenceWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = CarDNDWDLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Internal: Presenting exit geofence notification", v7, 2u);
  }

  v6 = +[CRDNDGeofenceAlert alertForEnteringGeofence:0];
  [v6 setActionHandler:v4];

  [(CARUserAlerts *)self _showBulletin:v6];
}

- (void)showDNDEndNotificationWithText:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = CarDNDWDLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Internal: Presenting Driving end notification", v10, 2u);
  }

  [(CARUserAlerts *)self dismissAlertsOfClass:objc_opt_class()];
  id v9 = [[CRDNDEndAlert alloc] initWithText:v7];

  [(CRBulletin *)v9 setActionHandler:v6];
  [(CARUserAlerts *)self _showBulletin:v9];
}

- (void)showDNDNotDrivingAlertWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = CarDNDWDLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Internal: Presenting Not Driving Feedback Alert", v7, 2u);
  }

  [(CARUserAlerts *)self dismissAlertsOfClass:objc_opt_class()];
  id v6 = objc_alloc_init(CRDNDNotDrivingAlert);
  [(CRBulletin *)v6 setActionHandler:v4];

  [(CARUserAlerts *)self _showBulletin:v6];
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  id v4 = a4;
  id v5 = CarDNDWDLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 request];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "User opened settings for %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  id v6 = a4;
  int v7 = (void (**)(id, void))a5;
  id v8 = CarDNDWDLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Will present notification %@", (uint8_t *)&v9, 0xCu);
  }

  v7[2](v7, 0);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  v11 = [v9 actionIdentifier];
  int v12 = [v9 notification];
  id v13 = [v12 request];
  __int16 v14 = [v13 identifier];

  id v15 = CarDNDWDLogging();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v40 = v14;
    __int16 v41 = 2114;
    v42 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Notification %@ response %{public}@", buf, 0x16u);
  }

  id v16 = [(CARUserAlerts *)self presentedBulletins];
  objc_sync_enter(v16);
  __int16 v17 = [(CARUserAlerts *)self presentedBulletins];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100004358;
  v37[3] = &unk_1000BD0C8;
  id v18 = v14;
  id v38 = v18;
  id v19 = [v17 indexOfObjectPassingTest:v37];

  objc_sync_exit(v16);
  if (v19 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v21 = [(CARUserAlerts *)self presentedBulletins];
    v22 = [v21 objectAtIndexedSubscript:v19];

    v23 = [v22 actionHandler];
    LODWORD(v21) = v23 == 0;

    if (v21)
    {
      v29 = CarDNDWDLogging();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Bulletin has no action handler. Assuming this is a custom action.", buf, 2u);
      }

      v10[2](v10);
      goto LABEL_20;
    }
    if ([v11 isEqualToString:UNNotificationDismissActionIdentifier])
    {
      v24 = CarDNDWDLogging();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "User dismissed bulletin.", buf, 2u);
      }

      uint64_t v25 = 1;
    }
    else
    {
      unsigned int v30 = [v11 isEqualToString:UNNotificationDefaultActionIdentifier];
      uint64_t v28 = CarDNDWDLogging();
      BOOL v31 = os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEFAULT);
      if (v30)
      {
        if (v31)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v28, OS_LOG_TYPE_DEFAULT, "User selected default bulletin action.", buf, 2u);
        }
        goto LABEL_15;
      }
      if (v31)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v28, OS_LOG_TYPE_DEFAULT, "User selected custom action.", buf, 2u);
      }

      v32 = [v22 actions];
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10000439C;
      v35[3] = &unk_1000BD0F0;
      id v33 = v11;
      id v36 = v33;
      uint64_t v25 = (uint64_t)[v32 indexOfObjectPassingTest:v35];

      if (v25 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v34 = CarDNDWDLogging();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
          sub_10006EE10((uint64_t)v33, (uint64_t)v22, v34);
        }

        v10[2](v10);
        goto LABEL_20;
      }

      if (v25 == 5)
      {
LABEL_16:
        v10[2](v10);
LABEL_20:

        goto LABEL_21;
      }
    }
    v26 = CarDNDWDLogging();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = +[NSNumber numberWithInteger:v25];
      *(_DWORD *)buf = 138412290;
      v40 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Sending additional action at index %@", buf, 0xCu);
    }
    uint64_t v28 = [v22 actionHandler];
    (*(void (**)(uint64_t, uint64_t))(v28 + 16))(v28, v25);
LABEL_15:

    goto LABEL_16;
  }
  objc_super v20 = CarDNDWDLogging();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
    sub_10006ED98((uint64_t)v18, v20);
  }

  v10[2](v10);
LABEL_21:
}

- (id)_alertsOfClass:(Class)a3
{
  id v5 = [(CARUserAlerts *)self presentedBulletins];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000044D4;
  v10[3] = &unk_1000BD110;
  v10[4] = a3;
  id v6 = [v5 indexesOfObjectsPassingTest:v10];

  if ([v6 count])
  {
    int v7 = [(CARUserAlerts *)self presentedBulletins];
    id v8 = [v7 objectsAtIndexes:v6];
  }
  else
  {
    id v8 = &__NSArray0__struct;
  }

  return v8;
}

- (void)_injectAlert:(id)a3
{
  id v4 = a3;
  id v5 = [(CARUserAlerts *)self presentedBulletins];
  [v5 addObject:v4];
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (NSMutableArray)presentedBulletins
{
  return self->_presentedBulletins;
}

- (void)setPresentedBulletins:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedBulletins, 0);

  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end