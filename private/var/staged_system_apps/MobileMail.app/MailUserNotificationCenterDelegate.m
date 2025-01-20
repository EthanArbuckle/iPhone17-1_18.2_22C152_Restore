@interface MailUserNotificationCenterDelegate
- (MailAlertSuppressionContextProvider)alertSuppressionContextProvider;
- (MailUserNotificationCenterDelegate)initWithAlertSuppressionContextProvider:(id)a3;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation MailUserNotificationCenterDelegate

- (MailUserNotificationCenterDelegate)initWithAlertSuppressionContextProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MailUserNotificationCenterDelegate;
  v5 = [(MailUserNotificationCenterDelegate *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_alertSuppressionContextProvider, v4);
  }

  return v6;
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  objc_super v8 = (void (**)(id, uint64_t))a5;
  v9 = [v7 request];
  v10 = [v9 content];

  v24 = v10;
  v11 = [v10 userInfo];
  v12 = +[NSSet set];
  v13 = [v11 objectForKeyedSubscript:MSUserNotificationContentKeySuppressionContext];
  if ([v13 length])
  {
    v14 = [v13 componentsSeparatedByString:@","];
    uint64_t v15 = +[NSSet setWithArray:v14];

    v12 = (void *)v15;
  }
  v16 = [(MailUserNotificationCenterDelegate *)self alertSuppressionContextProvider];
  v17 = [v16 currentAlertSuppressionContexts];
  unsigned int v18 = [v12 intersectsSet:v17];

  if (v18) {
    uint64_t v19 = 9;
  }
  else {
    uint64_t v19 = 27;
  }
  v20 = MSUserNotificationsLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = +[NSNumber numberWithUnsignedInteger:v19];
    v22 = [v7 request];
    v23 = [v22 identifier];
    *(_DWORD *)buf = 138543874;
    v26 = v21;
    __int16 v27 = 2114;
    v28 = v23;
    __int16 v29 = 2112;
    id v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Will present notification with options = %{public}@, notification identifier = %{public}@, notification = %@", buf, 0x20u);
  }
  v8[2](v8, v19);
}

- (MailAlertSuppressionContextProvider)alertSuppressionContextProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertSuppressionContextProvider);

  return (MailAlertSuppressionContextProvider *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end