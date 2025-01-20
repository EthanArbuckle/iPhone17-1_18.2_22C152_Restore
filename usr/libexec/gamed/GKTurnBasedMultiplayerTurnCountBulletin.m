@interface GKTurnBasedMultiplayerTurnCountBulletin
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
@end

@implementation GKTurnBasedMultiplayerTurnCountBulletin

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
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerTurnCountBulletin loadBulletinsForPushNotification: withHandler:", buf, 2u);
  }
  v9 = +[GKReporter reporter];
  [v9 reportEvent:GKReporterDomainPushCount type:GKReporterPushCountTurnBasedTurnCount];

  v10 = [v5 objectForKey:@"i"];
  v11 = +[GKClientProxy gameCenterClient];
  if (v10)
  {
    v12 = +[GKPlayerCredentialController sharedController];
    [v12 pushCredentialForEnvironment:[v11 environment]];
    v14 = [v13 playerInternal];
    v15 = [v14 playerID];
    unsigned int v16 = [v15 isEqualToString:v10];

    if (v16)
    {
      v29 = v11;
      v30 = v10;
      v31 = v6;
      id v32 = v5;
      [v5 objectForKey:@"tc"];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      id v17 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v35;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v35 != v19) {
              objc_enumerationMutation(obj);
            }
            v21 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            v22 = [v21 objectForKey:@"t"];
            id v23 = [v22 unsignedIntegerValue];

            v24 = [v21 objectForKeyedSubscript:@"d"];
            id v25 = [objc_alloc((Class)GKGameDescriptor) initWithPushDictionary:v24];
            v26 = [v25 bundleIdentifier];

            if (v26)
            {
              v27 = +[GKBadgeController sharedController];
              v28 = [v25 bundleIdentifier];
              [v27 setBadgeCount:v23 forBundleID:v28 badgeType:2];
            }
          }
          id v18 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v18);
      }

      v6 = v31;
      id v5 = v32;
      v11 = v29;
      v10 = v30;
    }
  }
  if (v6) {
    v6[2](v6, 0);
  }
}

@end