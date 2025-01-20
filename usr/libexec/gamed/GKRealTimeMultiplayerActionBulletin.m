@interface GKRealTimeMultiplayerActionBulletin
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (BOOL)isAccept;
- (NSString)aggregateDictionaryKey;
- (NSString)debugLine;
- (NSString)notificationName;
- (id)getDebugLine;
- (id)getNotificationName;
- (void)assembleBulletin;
- (void)loadDataWithHandler:(id)a3;
- (void)setInvitedPlayerRespondedWithCompletionHandler:(id)a3;
@end

@implementation GKRealTimeMultiplayerActionBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKRealTimeMultiplayerBulletin.m", 625, "+[GKRealTimeMultiplayerActionBulletin loadBulletinsForPushNotification:withHandler:]");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10014E3E4;
  v11[3] = &unk_1002DA788;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  +[GKActivity named:v8 execute:v11];
}

- (void)loadDataWithHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerActionBulletin loadDataWithHandler", buf, 2u);
  }
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKRealTimeMultiplayerBulletin.m", 663, "-[GKRealTimeMultiplayerActionBulletin loadDataWithHandler:]");
  v8 = +[GKDispatchGroup dispatchGroupWithName:v7];

  id v9 = +[GKClientProxy gameCenterClient];
  id v10 = [(GKRealTimeMultiplayerBulletin *)self sessionToken];
  v11 = +[GKClientProxy clientForInviteSessionToken:v10];

  if (!v11)
  {
    if (!os_log_GKGeneral) {
      id v17 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
    {
      sub_100153058();
      if (!v4) {
        goto LABEL_12;
      }
    }
    else if (!v4)
    {
      goto LABEL_12;
    }
    v18 = +[NSError errorWithDomain:@"GKMultiplayerInvite" code:0 userInfo:0];
    v4[2](v4, v18);

    goto LABEL_12;
  }
  id v12 = [v11 bundleIdentifier];
  id v13 = [(GKBulletin *)self gameDescriptor];
  [v13 setBundleIdentifier:v12];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10014ED84;
  v24[3] = &unk_1002D3A70;
  v24[4] = self;
  id v14 = v8;
  id v25 = v14;
  [v14 perform:v24];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10014EF04;
  v22[3] = &unk_1002D3A70;
  v22[4] = self;
  id v15 = v14;
  id v23 = v15;
  [v15 perform:v22];
  v16 = [v9 replyQueue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10014F050;
  v19[3] = &unk_1002D3930;
  v21 = v4;
  id v20 = v15;
  [v20 notifyOnQueue:v16 block:v19];

LABEL_12:
}

- (void)setInvitedPlayerRespondedWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers();
  }
  id v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerActionBulletin: setInvitedPlayerRespondedWithCompletionHandler", buf, 2u);
  }
  v8 = [(GKRealTimeMultiplayerBulletin *)self sessionToken];
  id v9 = +[GKClientProxy clientForInviteSessionToken:v8];

  id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKRealTimeMultiplayerBulletin.m", 711, "-[GKRealTimeMultiplayerActionBulletin setInvitedPlayerRespondedWithCompletionHandler:]");
  v11 = +[GKDispatchGroup dispatchGroupWithName:v10];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10014F2E0;
  v17[3] = &unk_1002D5310;
  id v12 = v9;
  id v18 = v12;
  v19 = self;
  id v13 = v11;
  id v20 = v13;
  SEL v21 = a2;
  [v13 perform:v17];
  if (v5)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100150230;
    v14[3] = &unk_1002D3930;
    id v16 = v5;
    id v15 = v13;
    [v15 notifyOnMainQueueWithBlock:v14];
  }
}

- (void)assembleBulletin
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerActionBulletin: assembleBulletin", v10, 2u);
  }
  id v5 = [(GKRealTimeMultiplayerBulletin *)self sessionToken];
  id v6 = +[GKClientProxy clientForInviteSessionToken:v5];

  [(GKBulletin *)self setHasSound:1];
  id v7 = [v6 bundleIdentifier];
  v8 = [(GKRealTimeMultiplayerBulletin *)self customInviteSoundPathForBundleID:v7];
  [(GKBulletin *)self setSoundPath:v8];

  id v9 = +[NSDate date];
  [(GKBulletin *)self setDate:v9];

  [(GKBulletin *)self setBulletinType:401];
}

- (NSString)aggregateDictionaryKey
{
  return 0;
}

- (id)getDebugLine
{
  return 0;
}

- (id)getNotificationName
{
  return 0;
}

- (BOOL)isAccept
{
  return 0;
}

- (NSString)debugLine
{
  return (NSString *)objc_getProperty(self, a2, 368, 1);
}

- (NSString)notificationName
{
  return (NSString *)objc_getProperty(self, a2, 376, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationName, 0);

  objc_storeStrong((id *)&self->_debugLine, 0);
}

@end