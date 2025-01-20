@interface GKBulletinNearbyInvite
- (GKBulletinNearbyInvite)initWithPlayer:(id)a3 localizedGameName:(id)a4 inviteDictionary:(id)a5;
- (NSDictionary)inviteDictionary;
- (void)handleAction:(id)a3;
- (void)setInviteDictionary:(id)a3;
@end

@implementation GKBulletinNearbyInvite

- (GKBulletinNearbyInvite)initWithPlayer:(id)a3 localizedGameName:(id)a4 inviteDictionary:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[GKReporter reporter];
  [v11 reportEvent:GKReporterDomainInviteInitiateType type:GKNearbyInviteInitiate];

  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers();
  }
  v13 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "GKBulletinNearbyInvite: initWithPlayer: localizedGameName: inviteDictionary", buf, 2u);
  }
  v36.receiver = self;
  v36.super_class = (Class)GKBulletinNearbyInvite;
  v14 = [(GKMultiplayerBulletin *)&v36 initWithPushNotification:&__NSDictionary0__struct];
  if (v14)
  {
    v15 = [v10 objectForKey:@"adamID"];
    v16 = [v10 objectForKey:@"bundleID"];
    v17 = [v10 objectForKey:@"inviteMessage"];
    uint64_t v35 = [v8 displayNameWithOptions:0];
    [(GKBulletin *)v14 setMessage:v17];
    [(GKBulletin *)v14 setGameName:v9];
    [(GKGameplayBulletin *)v14 setOriginatorPlayer:v8];
    [(GKMultiplayerBulletin *)v14 setGameInviteMessage];
    v18 = [(GKBulletin *)v14 message];

    if (v18)
    {
      v33 = +[GCFLocalizedStrings GAME_INVITE_NOTIFICATION_TITLE];
      v34 = v17;
      v19 = v15;
      v20 = +[NSDate date];
      [(GKBulletin *)v14 setDate:v20];

      v21 = +[NSDate dateWithTimeIntervalSinceNow:600.0];
      [(GKBulletin *)v14 setExpirationDate:v21];

      [(GKBulletin *)v14 setHasSound:1];
      v22 = [(GKMultiplayerBulletin *)v14 customInviteSoundPathForBundleID:v16];
      [(GKBulletin *)v14 setSoundPath:v22];

      [(GKBulletin *)v14 setTitle:v33];
      objc_storeStrong((id *)&v14->_inviteDictionary, a5);
      v23 = objc_alloc_init(GKBulletinAction);
      [(GKBulletinAction *)v23 setType:1];
      v24 = +[GCFLocalizedStrings ACCEPT_INVITE_BUTTON_TITLE];
      [(GKBulletinAction *)v23 setTitle:v24];

      [(GKBulletinAction *)v23 setAdamID:v15];
      [(GKBulletinAction *)v23 setBundleID:v16];
      v25 = objc_alloc_init(GKBulletinAction);
      [(GKBulletinAction *)v25 setType:0];
      v26 = +[GCFLocalizedStrings DECLINE_INVITE_BUTTON_TITLE];
      [(GKBulletinAction *)v25 setTitle:v26];

      v15 = v19;
      v17 = v34;
      [(GKBulletinAction *)v25 setInfo:&stru_1002E4F58];
      [(GKBulletin *)v14 setCategoryIdentifier:@"GKNotificationCategoryActionsAcceptDecline"];
      [(GKBulletin *)v14 setDefaultAction:v23];
      [(GKBulletin *)v14 setDeclineAction:v25];
      [(GKBulletin *)v14 setBulletinType:600];

      v27 = (void *)v35;
    }
    else
    {
      v28 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v29 = (id)GKOSLoggers();
        v28 = os_log_GKGeneral;
      }
      v27 = (void *)v35;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        sub_10015B8EC(v28);
      }
      v30 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v31 = (id)GKOSLoggers();
        v30 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        uint64_t v38 = v35;
        __int16 v39 = 2112;
        id v40 = v9;
        __int16 v41 = 2112;
        v42 = v17;
        __int16 v43 = 2112;
        id v44 = v10;
        _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "no message in nearby invite -- displayName:%@ gameName:%@ message:%@ from dict:%@", buf, 0x2Au);
      }
    }
  }
  return v14;
}

- (void)handleAction:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKBulletinNearbyInvite: handleAction:", buf, 2u);
  }
  v16.receiver = self;
  v16.super_class = (Class)GKBulletinNearbyInvite;
  [(GKBulletin *)&v16 handleAction:v4];
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  id v8 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "bulletin handle nearby invite action: %@", buf, 0xCu);
  }
  id v9 = [(GKBulletinNearbyInvite *)self inviteDictionary];
  id v10 = [v9 objectForKey:@"bundleID"];
  v11 = +[GKClientProxy clientForBundleID:v10];
  if (v11)
  {
    if ([v4 isEqualToString:@"GKAccepted"]) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = (uint64_t)[v4 isEqualToString:@"GKDefault"];
    }
    id v13 = [v9 mutableCopy];
    v14 = +[NSNumber numberWithBool:v12];
    [v13 setObject:v14 forKey:@"accepted"];

    if ((v12 & 1) == 0)
    {
      v15 = +[NSNumber numberWithInteger:1];
      [v13 setObject:v15 forKey:@"declineReason"];
    }
    [v11 respondedToNearbyInvite:v13];
  }
}

- (NSDictionary)inviteDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 248, 1);
}

- (void)setInviteDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end