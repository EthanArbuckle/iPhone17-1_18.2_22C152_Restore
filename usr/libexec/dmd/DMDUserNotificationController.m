@interface DMDUserNotificationController
+ (DMDUserNotificationController)sharedController;
- (CATOperationQueue)queue;
- (NSMutableArray)notifications;
- (NSMutableDictionary)completionsByIdentifier;
- (id)_dictFromNotification:(id)a3;
- (id)initPrivate;
- (void)_completeNotification:(id)a3 response:(unint64_t)a4;
- (void)_notificationRef:(__CFUserNotification *)a3 wasDismissedWithFlags:(unint64_t)a4;
- (void)_showNextNotification;
- (void)showNotification:(id)a3 completion:(id)a4;
@end

@implementation DMDUserNotificationController

+ (DMDUserNotificationController)sharedController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100078E1C;
  block[3] = &unk_1000C9F80;
  block[4] = a1;
  if (qword_1000FBD28 != -1) {
    dispatch_once(&qword_1000FBD28, block);
  }
  v2 = (void *)qword_1000FBD20;

  return (DMDUserNotificationController *)v2;
}

- (id)initPrivate
{
  v10.receiver = self;
  v10.super_class = (Class)DMDUserNotificationController;
  v2 = [(DMDUserNotificationController *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    queue = v2->_queue;
    v2->_queue = (CATOperationQueue *)v3;

    [(CATOperationQueue *)v2->_queue setMaxConcurrentOperationCount:1];
    [(CATOperationQueue *)v2->_queue setSuspended:0];
    uint64_t v5 = objc_opt_new();
    notifications = v2->_notifications;
    v2->_notifications = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    completionsByIdentifier = v2->_completionsByIdentifier;
    v2->_completionsByIdentifier = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (void)showNotification:(id)a3 completion:(id)a4
{
  id v7 = a3;
  v8 = (void (**)(id, uint64_t))a4;
  if (!v7)
  {
    v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2, self, @"DMDUserNotificationController.m", 69, @"Invalid parameter not satisfying: %@", @"notification" object file lineNumber description];
  }
  v9 = +[DMDDeviceController shared];
  objc_super v10 = [v9 isInSingleAppMode];
  unsigned int v11 = [v10 BOOLValue];

  BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Not displaying notification in limited app mode", buf, 2u);
    }
    if (v8) {
      v8[2](v8, 4);
    }
  }
  else
  {
    if (v12)
    {
      v13 = [v7 identifier];
      *(_DWORD *)buf = 138543362;
      v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Start user notification: %{public}@", buf, 0xCu);
    }
    v14 = [(DMDUserNotificationController *)self queue];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100079158;
    v17[3] = &unk_1000CA878;
    id v18 = v7;
    v19 = self;
    v20 = v8;
    v15 = +[DMDBlockOperation blockOperationWithBlock:v17];
    [v14 addOperation:v15];
  }
}

- (id)_dictFromNotification:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  uint64_t v5 = [v3 header];
  [v4 setObject:v5 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

  v6 = [v3 message];
  [v4 setObject:v6 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

  id v7 = [v3 defaultButtonTitle];
  [v4 setObject:v7 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

  v8 = [v3 alternateButtonTitle];
  [v4 setObject:v8 forKeyedSubscript:kCFUserNotificationAlternateButtonTitleKey];

  v9 = [v3 otherButtonTitle];
  [v4 setObject:v9 forKeyedSubscript:kCFUserNotificationOtherButtonTitleKey];

  id v10 = [v3 displayWhenLocked];
  unsigned int v11 = +[NSNumber numberWithBool:v10];
  [v4 setObject:v11 forKeyedSubscript:kCFUserNotificationAlertTopMostKey];

  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationDontDismissOnUnlock];
  id v12 = [v4 copy];

  return v12;
}

- (void)_showNextNotification
{
  id v3 = [(DMDUserNotificationController *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000794F0;
  v5[3] = &unk_1000CA508;
  v5[4] = self;
  v4 = +[DMDBlockOperation blockOperationWithBlock:v5];
  [v3 addOperation:v4];
}

- (void)_completeNotification:(id)a3 response:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 identifier];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Removing user notification: %{public}@", (uint8_t *)&v12, 0xCu);
  }
  v8 = [(DMDUserNotificationController *)self completionsByIdentifier];
  v9 = [v8 objectForKeyedSubscript:v7];

  if (v9) {
    v9[2](v9, a4);
  }
  id v10 = [(DMDUserNotificationController *)self notifications];
  [v10 removeObject:v6];

  unsigned int v11 = [(DMDUserNotificationController *)self completionsByIdentifier];
  [v11 setObject:0 forKeyedSubscript:v7];

  [(DMDUserNotificationController *)self _showNextNotification];
}

- (void)_notificationRef:(__CFUserNotification *)a3 wasDismissedWithFlags:(unint64_t)a4
{
  id v7 = [(DMDUserNotificationController *)self queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000799B4;
  v9[3] = &unk_1000CBF28;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  v8 = +[DMDBlockOperation blockOperationWithBlock:v9];
  [v7 addOperation:v8];
}

- (CATOperationQueue)queue
{
  return self->_queue;
}

- (NSMutableArray)notifications
{
  return self->_notifications;
}

- (NSMutableDictionary)completionsByIdentifier
{
  return self->_completionsByIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_notifications, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end