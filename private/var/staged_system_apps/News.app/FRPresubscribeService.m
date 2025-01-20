@interface FRPresubscribeService
- (BOOL)_hasUserBeenPresubscribed;
- (FCNewsAppConfigurationManager)appConfigurationManager;
- (FCPurchaseController)purchaseController;
- (FCSubscriptionController)subscriptionController;
- (FCTagController)tagController;
- (FRNotificationManager)notificationManager;
- (FRPresubscribeService)init;
- (FRPresubscribeService)initWithAppConfigurationManager:(id)a3 tagController:(id)a4 subscriptionController:(id)a5 purchaseController:(id)a6 notificationManager:(id)a7;
- (void)_setHasUserBeenPresubscribed:(BOOL)a3;
- (void)_subscribeToFeedIDs:(id)a3 preSubscribedNotificationsChannelIDs:(id)a4 withCompletion:(id)a5;
- (void)presubscribeToChannelsIfNeededWithCompletion:(id)a3;
- (void)subscriptionControllerDidResetToEmpty:(id)a3;
@end

@implementation FRPresubscribeService

- (FRPresubscribeService)initWithAppConfigurationManager:(id)a3 tagController:(id)a4 subscriptionController:(id)a5 purchaseController:(id)a6 notificationManager:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)FRPresubscribeService;
  v17 = [(FRPresubscribeService *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_appConfigurationManager, a3);
    objc_storeStrong((id *)&v18->_tagController, a4);
    objc_storeStrong((id *)&v18->_subscriptionController, a5);
    objc_storeStrong((id *)&v18->_purchaseController, a6);
    objc_storeStrong((id *)&v18->_notificationManager, a7);
    [(FCSubscriptionController *)v18->_subscriptionController addObserver:v18];
  }

  return v18;
}

- (FRPresubscribeService)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRPresubscribeService init]";
    __int16 v7 = 2080;
    v8 = "FRPresubscribeService.m";
    __int16 v9 = 1024;
    int v10 = 31;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FRPresubscribeService init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (void)presubscribeToChannelsIfNeededWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  v5 = FRPresubscribeServiceLog;
  if (os_log_type_enabled((os_log_t)FRPresubscribeServiceLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Presubscribing to channels, if needed", buf, 2u);
  }
  if ([(FRPresubscribeService *)self _hasUserBeenPresubscribed])
  {
    v6 = FRPresubscribeServiceLog;
    if (os_log_type_enabled((os_log_t)FRPresubscribeServiceLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not presubscribing because the user's already been presubscribed", buf, 2u);
    }
    if (v4) {
      v4[2](v4, 0);
    }
  }
  else
  {
    __int16 v7 = [(FRPresubscribeService *)self appConfigurationManager];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100052A3C;
    v8[3] = &unk_1000C63E0;
    v8[4] = self;
    __int16 v9 = v4;
    [v7 fetchAppConfigurationIfNeededWithCompletionQueue:&_dispatch_main_q completion:v8];
  }
}

- (void)subscriptionControllerDidResetToEmpty:(id)a3
{
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setBool:0 forKey:@"has_user_been_presubscribed"];

  [(FRPresubscribeService *)self presubscribeToChannelsIfNeededWithCompletion:0];
}

- (void)_subscribeToFeedIDs:(id)a3 preSubscribedNotificationsChannelIDs:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(FRPresubscribeService *)self tagController];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100052F18;
  v15[3] = &unk_1000C8EF8;
  id v16 = v8;
  id v17 = v9;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 fetchTagsForTagIDs:v14 qualityOfService:25 callbackQueue:&_dispatch_main_q completionHandler:v15];
}

- (BOOL)_hasUserBeenPresubscribed
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"has_user_been_presubscribed"];

  return v3;
}

- (void)_setHasUserBeenPresubscribed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setBool:v3 forKey:@"has_user_been_presubscribed"];
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (FCTagController)tagController
{
  return self->_tagController;
}

- (FCSubscriptionController)subscriptionController
{
  return self->_subscriptionController;
}

- (FCPurchaseController)purchaseController
{
  return self->_purchaseController;
}

- (FRNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_purchaseController, 0);
  objc_storeStrong((id *)&self->_subscriptionController, 0);
  objc_storeStrong((id *)&self->_tagController, 0);

  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
}

@end