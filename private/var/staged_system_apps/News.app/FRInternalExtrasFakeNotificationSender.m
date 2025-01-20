@interface FRInternalExtrasFakeNotificationSender
- (void)_scheduleFakeChannelSupportNotification:(id)a3;
- (void)_scheduleFakeNewArticleNotification:(id)a3 whenAppEntersBackground:(id)a4;
- (void)scheduleAnyFakeNotificationsFromInternalExtras:(id)a3 whenAppEntersBackground:(id)a4;
@end

@implementation FRInternalExtrasFakeNotificationSender

- (void)scheduleAnyFakeNotificationsFromInternalExtras:(id)a3 whenAppEntersBackground:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = +[NSUserDefaults standardUserDefaults];
  unsigned int v8 = [v7 BOOLForKey:@"fake_notification_for_article_on_background"];

  if (v8) {
    [(FRInternalExtrasFakeNotificationSender *)self _scheduleFakeNewArticleNotification:v11 whenAppEntersBackground:v6];
  }
  v9 = +[NSUserDefaults standardUserDefaults];
  unsigned int v10 = [v9 BOOLForKey:@"fake_notification_for_channel_supports_notifications_on_background"];

  if (v10) {
    [(FRInternalExtrasFakeNotificationSender *)self _scheduleFakeChannelSupportNotification:v11];
  }
}

- (void)_scheduleFakeChannelSupportNotification:(id)a3
{
  id v3 = a3;
  v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setBool:0 forKey:@"fake_notification_for_channel_supports_notifications_on_background"];

  id v6 = [objc_alloc((Class)FCTag) initForTestingWithTagType:2 identifier:@"fakeID" name:@"Fake Channel"];
  v5 = +[NSSet setWithObject:v6];
  [v3 scheduleLocalNotificationforChannels:v5];
}

- (void)_scheduleFakeNewArticleNotification:(id)a3 whenAppEntersBackground:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[NSUserDefaults standardUserDefaults];
  [v7 setBool:0 forKey:@"fake_notification_for_article_on_background"];

  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100055C60;
  v17[3] = &unk_1000C9408;
  id v8 = v6;
  id v18 = v8;
  v19 = &v20;
  id v9 = [v8 beginBackgroundTaskWithName:@"AppDelegateEnterBackground" expirationHandler:v17];
  v21[3] = (uint64_t)v9;
  dispatch_time_t v10 = dispatch_time(0, 3000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055CAC;
  block[3] = &unk_1000C74D0;
  id v14 = v5;
  id v15 = v8;
  v16 = &v20;
  id v11 = v8;
  id v12 = v5;
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(&v20, 8);
}

@end