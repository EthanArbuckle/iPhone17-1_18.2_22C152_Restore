@interface GKMultiplayerBulletin
+ (BOOL)shouldProcessNotification;
- (GKMultiplayerBulletin)initWithPushNotification:(id)a3;
- (id)URLContext;
- (id)customInviteSoundPathForBundleID:(id)a3;
- (void)loadLocalizedGameNameForBundleID:(id)a3 handler:(id)a4;
- (void)setGameInviteMessage;
@end

@implementation GKMultiplayerBulletin

+ (BOOL)shouldProcessNotification
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKMultiplayerBulletin shouldProcessNotification", buf, 2u);
  }
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___GKMultiplayerBulletin;
  if (!objc_msgSendSuper2(&v8, "shouldProcessNotification")) {
    return 0;
  }
  v5 = +[GKPreferences shared];
  BOOL v6 = [v5 multiplayerAllowedPlayerType] != 0;

  return v6;
}

- (id)URLContext
{
  return GKContextInvite;
}

- (GKMultiplayerBulletin)initWithPushNotification:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  BOOL v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKMultiplayerBulletin initWithPushNotification:", buf, 2u);
  }
  v18.receiver = self;
  v18.super_class = (Class)GKMultiplayerBulletin;
  v7 = [(GKBulletin *)&v18 initWithPushNotification:v4];
  if (v7)
  {
    objc_super v8 = [v4 objectForKeyedSubscript:@"g"];
    [(GKGameplayBulletin *)v7 setReceiverGuestPlayerID:v8];

    v9 = [v4 objectForKeyedSubscript:@"i"];
    [(GKGameplayBulletin *)v7 setReceiverPlayerID:v9];

    v10 = [v4 objectForKeyedSubscript:@"I"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [v10 firstObject];
      [(GKGameplayBulletin *)v7 setOriginatorPlayerID:v11];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(GKGameplayBulletin *)v7 setOriginatorPlayerID:v10];
      }
    }
    v12 = [v4 objectForKeyedSubscript:@"G"];
    [(GKGameplayBulletin *)v7 setOriginatorGuestPlayerID:v12];

    v13 = [v4 objectForKeyedSubscript:@"d"];
    id v14 = [objc_alloc((Class)GKGameDescriptor) initWithPushDictionary:v13];
    [(GKBulletin *)v7 setGameDescriptor:v14];

    v15 = [v13 objectForKeyedSubscript:GKInviteCompatibleVersionsKey];
    [(GKGameplayBulletin *)v7 setCompatibleVersions:v15];

    v16 = [v13 objectForKeyedSubscript:GKInviteCompatibleShortVersionsKey];
    [(GKGameplayBulletin *)v7 setCompatibleShortVersions:v16];
  }
  return v7;
}

- (void)loadLocalizedGameNameForBundleID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKMultiplayerBulletin loadLocalizedGameNameForBundleID: handler:", buf, 2u);
  }
  if (v7)
  {
    v10 = +[GKClientProxy gameCenterClient];
    v11 = +[GKService serviceWithTransport:0 forClient:v10 localPlayer:0];
    id v20 = v6;
    v12 = +[NSArray arrayWithObjects:&v20 count:1];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100141C38;
    v15[3] = &unk_1002D53D8;
    id v16 = v6;
    v17 = self;
    id v18 = v7;
    [v11 getGameMetadataForBundleIDs:v12 handler:v15];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v13 = (id)GKOSLoggers();
    }
    id v14 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_1001420CC((uint64_t)v6, v14);
    }
  }
}

- (void)setGameInviteMessage
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = (void *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    id v5 = v4;
    id v6 = [(GKBulletin *)self message];
    *(_DWORD *)buf = 138412290;
    v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKMultiplayerBulletin setGameInviteMessage original message:  %@", buf, 0xCu);
  }
  id v7 = [(GKBulletin *)self gameName];
  id v8 = [(GKGameplayBulletin *)self originatorPlayer];
  v9 = [v8 displayNameWithOptions:0];

  if (![v9 length] || !objc_msgSend(v7, "length")) {
    [(GKBulletin *)self setMessage:0];
  }
  unsigned int v10 = [(GKGameplayBulletin *)self gameLocation];
  v11 = [(GKBulletin *)self message];
  id v12 = [v11 length];
  if (v10 == 2)
  {
    if (v12) {
      +[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_1_INIVITER_2_MESSAGE_STORE_FORMAT];
    }
    else {
      +[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_1_INIVITER_STORE_FORMAT];
    }
  }
  else if (v12)
  {
    +[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_1_INIVITER_2_MESSAGE_FORMAT];
  }
  else
  {
    +[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_1_INIVITER_FORMAT];
  uint64_t v13 = };
  id v14 = (void *)v13;

  v15 = [(GKBulletin *)self message];
  id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v9, v15);
  [(GKBulletin *)self setMessage:v16];

  if (!os_log_GKGeneral) {
    id v17 = (id)GKOSLoggers();
  }
  id v18 = (void *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    v19 = v18;
    id v20 = [(GKBulletin *)self message];
    *(_DWORD *)buf = 138412290;
    v22 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "GKMultiplayerBulletin setGameInviteMessage: %@", buf, 0xCu);
  }
}

- (id)customInviteSoundPathForBundleID:(id)a3
{
  id v3 = a3;
  if (!os_log_GKGeneral) {
    id v4 = (id)GKOSLoggers();
  }
  id v5 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKMultiplayerBulletin customInviteSoundPathForBundleID:", v13, 2u);
  }
  id v6 = GKGetBundlePathForIdentifier();
  id v7 = +[NSBundle bundleWithPath:v6];
  uint64_t v8 = [v7 _gkPathForInviteSound];
  v9 = (void *)v8;
  unsigned int v10 = &stru_1002E4F58;
  if (v8) {
    unsigned int v10 = (__CFString *)v8;
  }
  v11 = v10;

  return v11;
}

@end