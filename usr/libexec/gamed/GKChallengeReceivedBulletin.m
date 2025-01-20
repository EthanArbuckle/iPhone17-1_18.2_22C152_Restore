@interface GKChallengeReceivedBulletin
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (GKChallengeReceivedBulletin)init;
- (unint64_t)launchEventType;
- (void)assembleBulletin;
- (void)handleAction:(id)a3;
- (void)handleDeclineAction;
- (void)notifyClient:(id)a3;
@end

@implementation GKChallengeReceivedBulletin

- (GKChallengeReceivedBulletin)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKChallengeReceivedBulletin;
  return [(GKChallengeBulletin *)&v3 init];
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
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
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKChallengeReceivedBulletin loadBulletinsForPushNotification: withHandler:", buf, 2u);
  }
  [a1 expireChallengeList];
  v10 = +[GKReporter reporter];
  [v10 reportEvent:GKReporterDomainPushCount type:GKReporterPushCountChallengeReceived];

  v11 = [v6 objectForKey:@"di"];
  v12 = [v11 _gkValuesForKeyPath:@"ci"];
  v13 = +[NSSet setWithArray:v12];

  id v14 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v11 count]];
  v15 = +[GKClientProxy gameCenterClient];
  v16 = +[GKService serviceWithTransport:0 forClient:v15 localPlayer:0];
  v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKChallengeBulletin.m", 504, "+[GKChallengeReceivedBulletin loadBulletinsForPushNotification:withHandler:]");
  v18 = +[GKDispatchGroup dispatchGroupWithName:v17];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100156850;
  v28[3] = &unk_1002D4518;
  id v19 = v16;
  id v29 = v19;
  id v20 = v13;
  id v30 = v20;
  id v21 = v6;
  id v31 = v21;
  id v22 = v18;
  id v32 = v22;
  id v23 = v14;
  id v33 = v23;
  [v22 perform:v28];
  if (v7)
  {
    v24 = [v15 replyQueue];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100156E24;
    v25[3] = &unk_1002D3930;
    id v27 = v7;
    id v26 = v23;
    [v22 notifyOnQueue:v24 block:v25];
  }
}

- (void)notifyClient:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKChallengeReceivedBulletin notifyClient:", v8, 2u);
  }
  id v7 = [(GKChallengeBulletin *)self challenge];
  [v4 challengeReceived:v7];
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKChallengeReceivedBulletin assembleBulletin", buf, 2u);
  }
  v23.receiver = self;
  v23.super_class = (Class)GKChallengeReceivedBulletin;
  [(GKChallengeBulletin *)&v23 assembleBulletin];
  id v5 = objc_alloc_init(GKBulletinAction);
  [(GKBulletinAction *)v5 setType:1];
  id v6 = [(GKChallengeBulletin *)self gameDescriptor];
  id v7 = [v6 adamID];
  [(GKBulletinAction *)v5 setAdamID:v7];

  id v8 = [(GKChallengeBulletin *)self gameDescriptor];
  v9 = [v8 bundleIdentifier];
  [(GKBulletinAction *)v5 setBundleID:v9];

  if ([(GKGameplayBulletin *)self gameLocation] == 2)
  {
    v10 = +[GCFLocalizedStrings CHALLENGE_RECEIVED_LAUNCH_STORE];
    v11 = &GKNotificationCategoryActionsAppStoreDecline;
  }
  else
  {
    v10 = +[GCFLocalizedStrings CHALLENGE_RECEIVED_LAUNCH_GAME];
    v11 = &GKNotificationCategoryActionsLaunchGameDecline;
  }
  [(GKBulletinAction *)v5 setTitle:v10];

  [(GKBulletin *)self setCategoryIdentifier:*v11];
  v12 = objc_alloc_init(GKBulletinAction);
  [(GKBulletinAction *)v12 setType:0];
  v13 = +[GCFLocalizedStrings CHALLENGE_RECEIVED_DECLINE];
  [(GKBulletinAction *)v12 setTitle:v13];

  [(GKBulletinAction *)v12 setIsDestructive:1];
  [(GKBulletinAction *)v12 setInfo:&stru_1002E4F58];
  id v14 = objc_alloc_init(GKBulletinAction);
  [(GKBulletinAction *)v14 setType:0];
  v15 = +[GCFLocalizedStrings CHALLENGE_RECEIVED_IGNORE];
  [(GKBulletinAction *)v14 setTitle:v15];

  [(GKBulletinAction *)v14 setInfo:&stru_1002E4F58];
  [(GKBulletin *)self setDefaultAction:v5];
  [(GKBulletin *)self setDeclineAction:v12];
  [(GKBulletin *)self setDismissAction:v14];
  v16 = [(GKChallengeBulletin *)self originatorPlayer];
  v17 = [v16 displayNameWithOptions:0];

  v18 = [(GKChallengeBulletin *)self challenge];
  id v19 = [v18 message];

  if ([v19 length])
  {
    id v20 = +[GCFLocalizedStrings KETTLE_CHALLENGE_RECEIVED_OUT_OF_GAME_BANNER_1_PLAYER_2_CUSTOM_MESSAGE_FORMAT];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v17, v19);
  }
  else
  {
    id v20 = +[GCFLocalizedStrings KETTLE_CHALLENGE_RECEIVED_OUT_OF_GAME_BANNER_FORMAT];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v17, v22);
  id v21 = };
  [(GKBulletin *)self setMessage:v21];

  [(GKBulletin *)self setBulletinType:801];
}

- (unint64_t)launchEventType
{
  return 0;
}

- (void)handleAction:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKChallengeReceivedBulletin handleAction:", buf, 2u);
  }
  v9.receiver = self;
  v9.super_class = (Class)GKChallengeReceivedBulletin;
  [(GKBulletin *)&v9 handleAction:v4];
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  id v8 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "bulletin handle challenge action: %@", buf, 0xCu);
  }
  if (([v4 isEqualToString:@"GKAccepted"] & 1) != 0
    || [v4 isEqualToString:@"GKDefault"])
  {
    [(GKChallengeBulletin *)self handleAcceptAction];
  }
  else if ([v4 isEqualToString:@"GKDeclined"])
  {
    [(GKChallengeReceivedBulletin *)self handleDeclineAction];
  }
}

- (void)handleDeclineAction
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKChallengeReceivedBulletin handleDeclineAction", buf, 2u);
  }
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "challenge received handling decline action %@", buf, 0xCu);
  }
  id v7 = [(GKChallengeBulletin *)self challenge];
  if (v7)
  {
    id v8 = [(GKChallengeBulletin *)self gameDescriptor];
    objc_super v9 = [v8 bundleIdentifier];
    v10 = +[GKClientProxy clientForBundleID:v9];

    id v11 = +[GKService serviceWithTransport:0 forClient:v10 localPlayer:0];
    v13 = v7;
    v12 = +[NSArray arrayWithObjects:&v13 count:1];
    [v11 abortChallenges:v12 handler:0];
  }
}

@end