@interface CloudUserNotificationController
- (CloudBadgeControllerProtocol)badgeControllerProtocol;
- (CloudUserNotificationController)init;
- (OS_dispatch_queue)centerQueue;
- (UNUserNotificationCenter)center;
- (id)_createBag;
- (void)badgeAppWithRequest:(id)a3;
- (void)setBadgeControllerProtocol:(id)a3;
- (void)setCenter:(id)a3;
- (void)setCenterQueue:(id)a3;
- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation CloudUserNotificationController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerQueue, 0);
  objc_storeStrong((id *)&self->_center, 0);

  objc_destroyWeak((id *)&self->_badgeControllerProtocol);
}

- (void)setCenterQueue:(id)a3
{
}

- (OS_dispatch_queue)centerQueue
{
  return self->_centerQueue;
}

- (void)setCenter:(id)a3
{
}

- (UNUserNotificationCenter)center
{
  return self->_center;
}

- (void)setBadgeControllerProtocol:(id)a3
{
}

- (CloudBadgeControllerProtocol)badgeControllerProtocol
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_badgeControllerProtocol);

  return (CloudBadgeControllerProtocol *)WeakRetained;
}

- (void)badgeAppWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 enabled];
  v6 = [(CloudUserNotificationController *)self badgeControllerProtocol];
  v7 = [v4 actionMetricsEvent];
  v8 = [(CloudUserNotificationController *)self _createBag];
  v9 = [(CloudUserNotificationController *)self center];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10005AD24;
  v14[3] = &unk_1001BF238;
  id v15 = v4;
  id v16 = v8;
  id v17 = v7;
  id v18 = v6;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  id v13 = v4;
  [v9 setBadgeCount:v5 withCompletionHandler:v14];
}

- (id)_createBag
{
  return +[AMSBag bagForProfile:@"Music" profileVersion:@"1"];
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  v8 = (void (**)(void))a5;
  if (+[AMSUserNotification shouldHandleNotificationResponse:v7])
  {
    v9 = [(CloudUserNotificationController *)self _createBag];
    id v10 = +[AMSUserNotification handleNotificationResponse:v7 bag:v9];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10005B100;
    v11[3] = &unk_1001BD898;
    id v12 = v8;
    [v10 addFinishBlock:v11];
  }
  else
  {
    v8[2](v8);
  }
}

- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "User notification did change settings", v14, 2u);
  }

  uint64_t v15 = ICUserNotificationSettingsAreAuthorizedUserInfoKey;
  v9 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 authorizationStatus] == (id)2);
  id v16 = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];

  id v11 = +[NSDistributedNotificationCenter defaultCenter];
  [v11 postNotificationName:ICUserNotificationSettingsDidChangeNotification object:0 userInfo:v10];

  id v12 = [(CloudUserNotificationController *)self _createBag];
  id v13 = +[AMSUserNotification notificationCenter:v6 didChangeSettings:v7 bag:v12];
}

- (CloudUserNotificationController)init
{
  v11.receiver = self;
  v11.super_class = (Class)CloudUserNotificationController;
  v2 = [(CloudUserNotificationController *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunescloudd.usernotifications", 0);
    centerQueue = v2->_centerQueue;
    v2->_centerQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = (UNUserNotificationCenter *)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.Music" queue:v2->_centerQueue];
    center = v2->_center;
    v2->_center = v5;

    [(UNUserNotificationCenter *)v2->_center setDelegate:v2];
    [(UNUserNotificationCenter *)v2->_center setPrivateDelegate:v2];
    [(UNUserNotificationCenter *)v2->_center setWantsNotificationResponsesDelivered];
    id v7 = +[UNNotificationCategory categoryWithIdentifier:@"music-notification-default" actions:&__NSArray0__struct intentIdentifiers:&__NSArray0__struct options:1];
    v8 = v2->_center;
    v9 = +[NSSet setWithObject:v7];
    [(UNUserNotificationCenter *)v8 setNotificationCategories:v9];
  }
  return v2;
}

@end