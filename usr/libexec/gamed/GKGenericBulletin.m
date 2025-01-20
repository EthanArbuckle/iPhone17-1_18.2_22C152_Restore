@interface GKGenericBulletin
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (void)assembleBulletinFromPushNotification:(id)a3;
@end

@implementation GKGenericBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKGenericBulletin loadBulletinsForPushNotification: withHandler:", buf, 2u);
  }
  v10 = +[GKReporter reporter];
  [v10 reportEvent:GKReporterDomainPushCount type:GKReporterPushCountTurnBased];

  id v11 = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
  id v12 = [objc_alloc((Class)a1) initWithPushNotification:v6];
  v13 = [v6 objectForKeyedSubscript:@"i"];
  v14 = +[GKClientProxy gameCenterClient];
  if (v13)
  {
    +[GKPlayerCredentialController sharedController];
    v21 = v7;
    v16 = id v15 = v6;
    v17 = [v16 pushCredentialForEnvironment:[v14 environment]];
    v18 = [v17 playerInternal];
    v19 = [v18 playerID];
    unsigned int v20 = [v19 isEqualToString:v13];

    id v6 = v15;
    v7 = v21;
    if (v20)
    {
      [v12 assembleBulletinFromPushNotification:v6];
      [v11 addObject:v12];
    }
  }
  if (v7) {
    v7[2](v7, v11);
  }
}

- (void)assembleBulletinFromPushNotification:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKGenericBulletin assembleBulletinFromPushNotification:", buf, 2u);
  }
  v7 = [v4 objectForKeyedSubscript:@"b"];
  id v8 = [v4 objectForKeyedSubscript:@"u"];
  v17 = [v4 objectForKeyedSubscript:@"t"];
  v9 = [v4 objectForKeyedSubscript:@"m"];
  v10 = [v4 objectForKeyedSubscript:@"n"];
  id v11 = [v4 objectForKeyedSubscript:@"y"];
  id v12 = [v4 objectForKeyedSubscript:@"o"];
  v13 = objc_alloc_init(GKBulletinAction);
  [(GKBulletinAction *)v13 setType:1];
  [(GKBulletinAction *)v13 setTitle:v11];
  if (v8) {
    v14 = v8;
  }
  else {
    v14 = v7;
  }
  [(GKBulletinAction *)v13 setInfo:v14];
  if ([v12 integerValue] == (id)2)
  {
    id v15 = objc_alloc_init(GKBulletinAction);
    [(GKBulletinAction *)v15 setType:0];
    [(GKBulletinAction *)v15 setTitle:v10];
    [(GKBulletinAction *)v15 setInfo:&stru_1002E4F58];
    [(GKBulletin *)self setDismissAction:v15];
  }
  [(GKBulletin *)self setMessage:v9];
  [(GKBulletin *)self setHasSound:1];
  [(GKBulletin *)self setSoundPath:0];
  v16 = +[NSDate date];
  [(GKBulletin *)self setDate:v16];

  [(GKBulletin *)self setTitle:v17];
  [(GKBulletin *)self setDefaultAction:v13];
  [(GKBulletin *)self setBulletinType:1];
}

@end