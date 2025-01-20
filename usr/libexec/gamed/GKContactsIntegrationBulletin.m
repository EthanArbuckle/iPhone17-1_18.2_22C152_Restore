@interface GKContactsIntegrationBulletin
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
@end

@implementation GKContactsIntegrationBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  v5 = (void (**)(id, void))a4;
  v6 = [a3 objectForKey:GKPushCommandKey];
  unsigned int v7 = [v6 integerValue];

  if (v7 << 16 != 19726336)
  {
    if (!os_log_GKGeneral) {
      id v11 = (id)GKOSLoggers();
    }
    v12 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
    {
      sub_10015FE6C((__int16)v7, v12);
      if (!v5) {
        goto LABEL_12;
      }
    }
    else if (!v5)
    {
      goto LABEL_12;
    }
    v5[2](v5, 0);
    goto LABEL_12;
  }
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  v9 = os_log_GKContacts;
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
    sub_10015FE28(v9);
  }
  v10 = +[GKContactsIntegrationController sharedController];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10015FD90;
  v13[3] = &unk_1002D45D8;
  v14 = v5;
  [v10 clearCachesWithCompletionHandler:v13];

LABEL_12:
}

@end