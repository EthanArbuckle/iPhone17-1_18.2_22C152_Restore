@interface GKRealTimeMultiplayerCancelBulletin
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (id)removeAndReturnAssociatedInvite;
- (void)assembleBulletin;
- (void)copyDataFromAssociatedBulletin:(id)a3;
@end

@implementation GKRealTimeMultiplayerCancelBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKRealTimeMultiplayerBulletin.m", 1043, "+[GKRealTimeMultiplayerCancelBulletin loadBulletinsForPushNotification:withHandler:]");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100151570;
  v10[3] = &unk_1002D3C38;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  +[GKActivity named:v7 execute:v10];
}

- (void)copyDataFromAssociatedBulletin:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerCancelBulletin copyDataFromAssociatedBulletin", v11, 2u);
  }
  v7 = [v4 originatorPlayer];
  [(GKGameplayBulletin *)self setOriginatorPlayer:v7];

  id v8 = [v4 gameName];
  [(GKBulletin *)self setGameName:v8];

  id v9 = [v4 originatorPlayerID];
  [(GKGameplayBulletin *)self setOriginatorPlayerID:v9];

  v10 = [v4 gameDescriptor];
  [(GKBulletin *)self setGameDescriptor:v10];
}

- (void)assembleBulletin
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerCancelBulletin assembleBulletin", buf, 2u);
  }
  id v5 = +[NSDate date];
  [(GKBulletin *)self setDate:v5];

  [(GKBulletin *)self setBulletinType:404];
  id v6 = +[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_TITLE];
  v7 = [(GKBulletin *)self gameName];
  id v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v7);
  [(GKBulletin *)self setTitle:v8];

  id v9 = [(GKGameplayBulletin *)self originatorPlayer];
  v10 = [v9 displayNameWithOptions:0];

  if (v10)
  {
    id v11 = +[GCFLocalizedStrings KETTLE_GAME_INVITE_CANCELED_ALERT_MESSAGE_ALIAS_1_FORMAT];
    id v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v10);
    [(GKBulletin *)self setMessage:v12];
  }
  else
  {
    id v11 = +[GCFLocalizedStrings KETTLE_GAME_INVITE_CANCELED_ALERT_MESSAGE];
    [(GKBulletin *)self setMessage:v11];
  }
}

- (id)removeAndReturnAssociatedInvite
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerCancelBulletin removeAndReturnAssociatedInvite", buf, 2u);
  }
  id v5 = +[GKBulletinController sharedController];
  [v5 getBulletinsOfType:objc_opt_class()];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [v6 objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16];
        id v12 = [v11 sessionToken];
        v13 = [(GKRealTimeMultiplayerBulletin *)self sessionToken];
        unsigned __int8 v14 = [v12 isEqualToData:v13];

        if (v14)
        {
          [v5 withdrawBulletin:v11];
          goto LABEL_15;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_15:

  return v11;
}

@end