@interface GKRelayBulletin
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
@end

@implementation GKRelayBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKRelayBulletin loadBulletinsForPushNotification: withHandler:", buf, 2u);
  }
  v10 = +[GKReporter reporter];
  [v10 reportEvent:GKReporterDomainPushCount type:GKReporterPushCountRelay];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10013CC28;
  v12[3] = &unk_1002D40E0;
  id v11 = v6;
  id v13 = v11;
  [a1 performAsync:v12];
  if (v7) {
    v7[2](v7, 0);
  }
}

@end