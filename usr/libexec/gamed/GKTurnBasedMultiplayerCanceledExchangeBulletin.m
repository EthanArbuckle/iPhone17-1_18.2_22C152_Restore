@interface GKTurnBasedMultiplayerCanceledExchangeBulletin
+ (BOOL)shouldLoadCacheData;
- (id)aggregateDictionaryKey;
- (void)loadBulletinMessageWithHandler:(id)a3;
- (void)loadDataWithHandler:(id)a3;
@end

@implementation GKTurnBasedMultiplayerCanceledExchangeBulletin

+ (BOOL)shouldLoadCacheData
{
  return 0;
}

- (id)aggregateDictionaryKey
{
  return GKReporterPushCountTurnBasedExchangeCanceled;
}

- (void)loadDataWithHandler:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerCanceledExchangeBulletin loadDataWithHandler:", buf, 2u);
  }
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedMultiplayerBulletin.m", 944, "-[GKTurnBasedMultiplayerCanceledExchangeBulletin loadDataWithHandler:]");
  v8 = +[GKDispatchGroup dispatchGroupWithName:v7];

  v9 = +[GKClientProxy gameCenterClient];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10014961C;
  v20[3] = &unk_1002D3A70;
  v20[4] = self;
  id v10 = v8;
  id v21 = v10;
  [v10 perform:v20];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10014979C;
  v18[3] = &unk_1002D3A70;
  v18[4] = self;
  id v11 = v10;
  id v19 = v11;
  [v11 perform:v18];
  v12 = [v9 replyQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001498E8;
  v15[3] = &unk_1002D3930;
  id v16 = v11;
  id v17 = v4;
  id v13 = v11;
  id v14 = v4;
  [v13 notifyOnQueue:v12 block:v15];
}

- (void)loadBulletinMessageWithHandler:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerCanceledExchangeBulletin loadBulletinMessageWithHandler:", buf, 2u);
  }
  +[GKDispatchGroup dispatchGroupWithName:@"loadBulletinMessageWithHandler"];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100149AE8;
  v11[3] = &unk_1002D3A70;
  v11[4] = self;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v7;
  [v7 perform:v11];
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100149FB0;
    v8[3] = &unk_1002D3930;
    id v10 = v4;
    id v9 = v7;
    [v9 notifyOnMainQueueWithBlock:v8];
  }
}

@end