@interface GKMatchmakerBulletin
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (NSString)matchID;
- (void)executeBulletinWithBulletinController:(id)a3;
- (void)setMatchID:(id)a3;
@end

@implementation GKMatchmakerBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, id))a4;
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  v8 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKMatchmakerBulletin loadBulletinsForPushNotification: withHandler:", (uint8_t *)&v17, 2u);
  }
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers();
  }
  v10 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412290;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "didReceiveMatchmakingPush: %@", (uint8_t *)&v17, 0xCu);
  }
  v11 = +[GKReporter reporter];
  [v11 reportEvent:GKReporterDomainPushCount type:GKReporterPushCountMatchmaking];

  id v12 = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
  v13 = [v5 objectForKey:GKMatchmakerMatchRID];
  if (v13)
  {
    v14 = objc_alloc_init(GKMatchmakerBulletin);
    [(GKMatchmakerBulletin *)v14 setMatchID:v13];
    [(GKBulletin *)v14 setBulletinType:1200];
    [v12 addObject:v14];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v15 = (id)GKOSLoggers();
    }
    v16 = os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "GKMatchmakerBulletin - matchmaking push missing match-rid, did not create bulletin.", (uint8_t *)&v17, 2u);
    }
  }
  if (v6) {
    v6[2](v6, v12);
  }
}

- (void)executeBulletinWithBulletinController:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKMatchmakerBulletin executeBulletinWithBulletinController:", buf, 2u);
  }
  *(void *)buf = 0;
  id v12 = buf;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10013D584;
  v10[3] = &unk_1002D3BF0;
  v10[4] = self;
  v10[5] = buf;
  +[GKClientProxy enumerateClientsUsingBlock:v10];
  if (!v12[24])
  {
    if (!os_log_GKGeneral) {
      id v7 = (id)GKOSLoggers();
    }
    v8 = os_log_GKMatch;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [(GKMatchmakerBulletin *)self matchID];
      *(_DWORD *)id v15 = 138412290;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "matchmaking push:%@ for unknown rid", v15, 0xCu);
    }
  }
  _Block_object_dispose(buf, 8);
}

- (NSString)matchID
{
  return self->_matchID;
}

- (void)setMatchID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end