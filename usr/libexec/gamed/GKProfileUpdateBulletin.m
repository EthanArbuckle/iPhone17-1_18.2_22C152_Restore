@interface GKProfileUpdateBulletin
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
@end

@implementation GKProfileUpdateBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void))a4;
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  v8 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKProfileUpdateBulletin loadBulletinsForPushNotification: withHandler:", buf, 2u);
  }
  v9 = +[GKReporter reporter];
  [v9 reportEvent:GKReporterDomainPushCount type:GKReporterPushCountProfileUpdate];

  v10 = [v5 objectForKeyedSubscript:@"i"];
  if (v10)
  {
    v11 = +[GKBulletin cacheTransactionGroup];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10013CF70;
    v14[3] = &unk_1002D4078;
    id v15 = v10;
    id v16 = v5;
    [v11 performOnManagedObjectContext:v14];
    if (v6) {
      v6[2](v6, 0);
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v12 = (id)GKOSLoggers();
    }
    v13 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_10013DC80(v13);
    }
  }
}

@end