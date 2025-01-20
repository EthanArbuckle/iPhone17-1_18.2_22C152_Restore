@interface GKActivityFeedBulletin
+ (BOOL)supportsSecureCoding;
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (BOOL)isMalformed;
- (GKActivityFeedBulletin)initWithCoder:(id)a3;
- (GKActivityFeedBulletin)initWithPushNotification:(id)a3;
- (NSDictionary)relationships;
- (NSNumber)getRelationshipGameAdamId;
- (NSString)bodyFromPush;
- (NSString)contactHandle;
- (NSString)getRelationshipGameBundleId;
- (NSString)getRelationshipGameImage;
- (NSString)getRelationshipGameName;
- (NSString)getRelationshipLeaderboardIdentifier;
- (NSString)getRelationshipLeaderboardName;
- (NSString)getRelationshipPlayerId;
- (NSString)getRelationshipPlayerImage;
- (NSString)getRelationshipPlayerName;
- (NSString)subtitleFromPush;
- (NSString)titleFromPush;
- (int64_t)activityFeedAction;
- (void)assembleBulletin;
- (void)encodeWithCoder:(id)a3;
- (void)handleAction:(id)a3;
- (void)reportMetricsForActionID:(id)a3 withAdditionalFields:(id)a4;
- (void)setActivityFeedAction:(int64_t)a3;
- (void)setBodyFromPush:(id)a3;
- (void)setContactHandle:(id)a3;
- (void)setIsMalformed:(BOOL)a3;
- (void)setRelationships:(id)a3;
- (void)setSubtitleFromPush:(id)a3;
- (void)setTitleFromPush:(id)a3;
@end

@implementation GKActivityFeedBulletin

- (GKActivityFeedBulletin)initWithPushNotification:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKActivityFeedBulletin initWithPushNotification:", buf, 2u);
  }
  v16.receiver = self;
  v16.super_class = (Class)GKActivityFeedBulletin;
  v7 = [(GKBulletin *)&v16 initWithPushNotification:v4];
  if (v7)
  {
    v8 = [v4 objectForKeyedSubscript:@"action"];
    v9 = [&off_1002F2DB8 objectForKeyedSubscript:v8];

    if (v9)
    {
      v10 = [&off_1002F2DB8 objectForKeyedSubscript:v8];
      -[GKActivityFeedBulletin setActivityFeedAction:](v7, "setActivityFeedAction:", [v10 integerValue]);
    }
    else
    {
      [(GKActivityFeedBulletin *)v7 setActivityFeedAction:-1];
    }
    v11 = [v4 objectForKeyedSubscript:@"title"];
    [(GKActivityFeedBulletin *)v7 setTitleFromPush:v11];

    v12 = [v4 objectForKeyedSubscript:@"body"];
    [(GKActivityFeedBulletin *)v7 setBodyFromPush:v12];

    v13 = [v4 objectForKeyedSubscript:@"subtitle"];
    [(GKActivityFeedBulletin *)v7 setSubtitleFromPush:v13];

    v14 = [v4 objectForKeyedSubscript:@"relationships"];
    [(GKActivityFeedBulletin *)v7 setRelationships:v14];
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKActivityFeedBulletin)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GKActivityFeedBulletin;
  id v5 = [(GKGameplayBulletin *)&v16 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
    -[GKActivityFeedBulletin setActivityFeedAction:](v5, "setActivityFeedAction:", [v6 integerValue]);

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"titleFromPush"];
    [(GKActivityFeedBulletin *)v5 setTitleFromPush:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bodyFromPush"];
    [(GKActivityFeedBulletin *)v5 setBodyFromPush:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitleFromPush"];
    [(GKActivityFeedBulletin *)v5 setSubtitleFromPush:v9];

    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    v13 = [v4 decodeObjectOfClasses:v12 forKey:@"relationships"];
    [(GKActivityFeedBulletin *)v5 setRelationships:v13];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isMalformed"];
    -[GKActivityFeedBulletin setIsMalformed:](v5, "setIsMalformed:", [v14 BOOLValue]);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)GKActivityFeedBulletin;
  id v4 = a3;
  [(GKGameplayBulletin *)&v11 encodeWithCoder:v4];
  id v5 = +[NSNumber numberWithInteger:[(GKActivityFeedBulletin *)self activityFeedAction]];
  [v4 encodeObject:v5 forKey:@"bulletinAction"];

  v6 = [(GKActivityFeedBulletin *)self titleFromPush];
  [v4 encodeObject:v6 forKey:@"titleFromPush"];

  v7 = [(GKActivityFeedBulletin *)self bodyFromPush];
  [v4 encodeObject:v7 forKey:@"bodyFromPush"];

  v8 = [(GKActivityFeedBulletin *)self subtitleFromPush];
  [v4 encodeObject:v8 forKey:@"subtitleFromPush"];

  v9 = [(GKActivityFeedBulletin *)self relationships];
  [v4 encodeObject:v9 forKey:@"relationships"];

  uint64_t v10 = +[NSNumber numberWithBool:[(GKActivityFeedBulletin *)self isMalformed]];
  [v4 encodeObject:v10 forKey:@"isMalformed"];
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  v8 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKActivityFeedBulletin loadBulletinsForPushNotification:", buf, 2u);
  }
  id v9 = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
  uint64_t v10 = +[GKClientProxy gameCenterClient];
  objc_super v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKActivityFeedBulletin.m", 133, "+[GKActivityFeedBulletin loadBulletinsForPushNotification:withHandler:]");
  v12 = +[GKDispatchGroup dispatchGroupWithName:v11];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10015867C;
  v20[3] = &unk_1002D3980;
  v13 = [[GKActivityFeedBulletin alloc] initWithPushNotification:v5];
  v21 = v13;
  id v14 = v9;
  id v22 = v14;
  id v15 = v10;
  id v23 = v15;
  [v12 perform:v20];
  if (v6)
  {
    objc_super v16 = [v15 replyQueue];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100158AF4;
    v17[3] = &unk_1002D3930;
    id v19 = v6;
    id v18 = v14;
    [v12 notifyOnQueue:v16 block:v17];
  }
}

- (NSString)getRelationshipGameBundleId
{
  v2 = [(GKActivityFeedBulletin *)self relationships];
  v3 = [v2 objectForKeyedSubscript:@"game"];
  id v4 = [v3 objectForKeyedSubscript:@"id"];

  return (NSString *)v4;
}

- (NSString)getRelationshipGameImage
{
  v2 = [(GKActivityFeedBulletin *)self relationships];
  v3 = [v2 objectForKeyedSubscript:@"game"];
  id v4 = [v3 objectForKeyedSubscript:@"image"];

  return (NSString *)v4;
}

- (NSNumber)getRelationshipGameAdamId
{
  v2 = [(GKActivityFeedBulletin *)self relationships];
  v3 = [v2 objectForKeyedSubscript:@"game"];
  id v4 = [v3 objectForKeyedSubscript:@"adamId"];

  return (NSNumber *)v4;
}

- (NSString)getRelationshipGameName
{
  v2 = [(GKActivityFeedBulletin *)self relationships];
  v3 = [v2 objectForKeyedSubscript:@"game"];
  id v4 = [v3 objectForKeyedSubscript:@"name"];

  return (NSString *)v4;
}

- (NSString)getRelationshipLeaderboardIdentifier
{
  v2 = [(GKActivityFeedBulletin *)self relationships];
  v3 = [v2 objectForKeyedSubscript:@"leaderboard"];
  id v4 = [v3 objectForKeyedSubscript:@"id"];

  return (NSString *)v4;
}

- (NSString)getRelationshipLeaderboardName
{
  v2 = [(GKActivityFeedBulletin *)self relationships];
  v3 = [v2 objectForKeyedSubscript:@"leaderboard"];
  id v4 = [v3 objectForKeyedSubscript:@"name"];

  return (NSString *)v4;
}

- (NSString)getRelationshipPlayerId
{
  v2 = [(GKActivityFeedBulletin *)self relationships];
  v3 = [v2 objectForKeyedSubscript:@"player"];
  id v4 = [v3 objectForKeyedSubscript:@"id"];

  return (NSString *)v4;
}

- (NSString)getRelationshipPlayerName
{
  v2 = [(GKActivityFeedBulletin *)self relationships];
  v3 = [v2 objectForKeyedSubscript:@"player"];
  id v4 = [v3 objectForKeyedSubscript:@"name"];

  return (NSString *)v4;
}

- (NSString)getRelationshipPlayerImage
{
  v2 = [(GKActivityFeedBulletin *)self relationships];
  v3 = [v2 objectForKeyedSubscript:@"player"];
  id v4 = [v3 objectForKeyedSubscript:@"avatarUrl"];

  return (NSString *)v4;
}

- (void)assembleBulletin
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKActivityFeedBulletin assembleBulletin", (uint8_t *)&v17, 2u);
  }
  if ([(GKActivityFeedBulletin *)self activityFeedAction])
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [(GKActivityFeedBulletin *)self getRelationshipGameBundleId];
    BOOL v5 = v6 == 0;
    if (v6)
    {
      id v7 = objc_alloc_init(GKBulletinAction);
      [(GKBulletinAction *)v7 setType:0];
      v8 = +[GCFLocalizedStrings BULLETIN_VIEW];
      [(GKBulletinAction *)v7 setTitle:v8];

      [(GKBulletinAction *)v7 setInfo:v6];
      [(GKBulletin *)self setDefaultAction:v7];
    }
  }
  [(GKActivityFeedBulletin *)self setIsMalformed:v5];
  if (![(GKActivityFeedBulletin *)self isMalformed])
  {
    objc_super v11 = objc_alloc_init(GKBulletinAction);
    [(GKBulletinAction *)v11 setType:0];
    v13 = +[GCFLocalizedStrings BULLETIN_IGNORE];
    [(GKBulletinAction *)v11 setTitle:v13];

    [(GKBulletinAction *)v11 setInfo:&stru_1002E4F58];
    [(GKBulletin *)self setDismissAction:v11];
    [(GKActivityFeedBulletin *)self setContactHandle:0];
    [(GKBulletin *)self setCategoryIdentifier:@"GKNotificationCategoryActionsViewIgnore"];
    [(GKBulletin *)self setHasSound:1];
    [(GKBulletin *)self setSoundPath:0];
    id v14 = [(GKActivityFeedBulletin *)self titleFromPush];
    [(GKBulletin *)self setTitle:v14];

    id v15 = [(GKActivityFeedBulletin *)self bodyFromPush];
    [(GKBulletin *)self setMessage:v15];

    objc_super v16 = +[NSDate date];
    [(GKBulletin *)self setDate:v16];

    [(GKBulletin *)self setBulletinType:1000];
    goto LABEL_16;
  }
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers();
  }
  uint64_t v10 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    objc_super v11 = v10;
    v12 = [(GKActivityFeedBulletin *)self relationships];
    int v17 = 138412290;
    id v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, &v11->super, OS_LOG_TYPE_INFO, "GKActivityFeedBulletin assembleBulletin, malformed bulletin with relationships: %@", (uint8_t *)&v17, 0xCu);

LABEL_16:
  }
}

- (void)handleAction:(id)a3
{
  id v4 = a3;
  CFStringRef v43 = @"pageDetails";
  CFStringRef v41 = @"activityFeedAction";
  BOOL v5 = +[NSNumber numberWithInteger:[(GKActivityFeedBulletin *)self activityFeedAction]];
  v42 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
  v44 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  id v8 = [v7 mutableCopy];

  if (([v4 isEqualToString:@"GKAccepted"] & 1) == 0
    && ![v4 isEqualToString:@"GKDefault"])
  {
    if (([v4 isEqualToString:@"GKDeclined"] & 1) != 0
      || ([v4 isEqualToString:@"GKDismissed"] & 1) != 0
      || ![v4 isEqualToString:@"GKExpired"])
    {
      goto LABEL_33;
    }
    id v9 = +[GKBulletinController sharedController];
    [v9 expireBulletin:self];
    goto LABEL_32;
  }
  if ([(GKActivityFeedBulletin *)self activityFeedAction])
  {
LABEL_33:
    [(GKActivityFeedBulletin *)self reportMetricsForActionID:v4 withAdditionalFields:v8];
    goto LABEL_34;
  }
  if (_os_feature_enabled_impl())
  {
    id v9 = [(GKActivityFeedBulletin *)self getRelationshipGameBundleId];
    uint64_t v10 = [(GKActivityFeedBulletin *)self getRelationshipLeaderboardIdentifier];
    uint64_t v11 = [(GKActivityFeedBulletin *)self getRelationshipPlayerId];
    v12 = (void *)v11;
    if (v9 && v10 && v11)
    {
      v13 = +[NSString stringWithFormat:@"game-overlay-ui:///game/%@/leaderboard/%@?challengeSuggestionPlayerID=%@", v9, v10, v11];
      id v14 = [objc_alloc((Class)NSURL) initWithString:v13];
      if (v14)
      {
        id v15 = +[GKApplicationWorkspace defaultWorkspace];
        [v15 openURL:v14];
      }
      else
      {
        if (!os_log_GKGeneral) {
          id v29 = (id)GKOSLoggers();
        }
        v30 = os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v13;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "GKActivityFeedBulletin handleAction, failed to construct deeplink url with string %@", buf, 0xCu);
        }
      }
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v24 = (id)GKOSLoggers();
      }
      v25 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v36 = v9;
        __int16 v37 = 2112;
        v38 = v10;
        __int16 v39 = 2112;
        v40 = v12;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "GKActivityFeedBulletin handleAction, missing ids to construct deeplink. bundleID: %@, leaderboardID: %@, playerID: %@", buf, 0x20u);
      }
    }

LABEL_32:
    goto LABEL_33;
  }
  objc_super v16 = +[GKClientProxy gameCenterClient];
  int v17 = +[GKService serviceWithTransport:0 forClient:v16 localPlayer:0];
  id v18 = [(GKActivityFeedBulletin *)self getRelationshipGameBundleId];
  id v19 = [(GKActivityFeedBulletin *)self getRelationshipGameAdamId];
  v20 = [v19 stringValue];

  if (+[GKGame isNewsApp:v18])
  {
    if (!os_log_GKGeneral) {
      id v21 = (id)GKOSLoggers();
    }
    id v22 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Launching News puzzles section in response to leaderboard notification action", buf, 2u);
    }
    id v23 = +[GKApplicationWorkspace defaultWorkspace];
    [v23 openNewsApp];

    [v8 setObject:v20 forKeyedSubscript:@"targetId"];
    [(GKActivityFeedBulletin *)self reportMetricsForActionID:v4 withAdditionalFields:v8];
  }
  else
  {
    v26 = +[NSBundle mainBundle];
    v27 = [v26 bundleIdentifier];
    v28 = +[ASCAppLaunchTrampolineURL URLWithAdamId:v20 bundleId:v18 localizedName:0 sourceApplication:v27 topic:0];

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100159790;
    v31[3] = &unk_1002DC7A0;
    id v32 = v8;
    v33 = self;
    id v34 = v4;
    [v17 invokeASCAppLaunchTrampolineWithURL:v28 handler:v31];
  }
LABEL_34:
}

- (void)reportMetricsForActionID:(id)a3 withAdditionalFields:(id)a4
{
  id v6 = a3;
  if (a4) {
    id v7 = [a4 mutableCopy];
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  id v8 = v7;
  id v9 = +[GKClientProxy gameCenterClient];
  uint64_t v10 = +[GKService serviceWithTransport:0 forClient:v9 localPlayer:0];
  uint64_t v11 = [(GKActivityFeedBulletin *)self getRelationshipGameBundleId];
  id v19 = v11;
  v12 = +[NSArray arrayWithObjects:&v19 count:1];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100159978;
  v15[3] = &unk_1002DC7C8;
  id v16 = v8;
  id v17 = v6;
  id v18 = self;
  id v13 = v6;
  id v14 = v8;
  [v10 getGameMetadataForBundleIDs:v12 handler:v15];
}

- (int64_t)activityFeedAction
{
  return self->_activityFeedAction;
}

- (void)setActivityFeedAction:(int64_t)a3
{
  self->_activityFeedAction = a3;
}

- (NSString)titleFromPush
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setTitleFromPush:(id)a3
{
}

- (NSString)bodyFromPush
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setBodyFromPush:(id)a3
{
}

- (NSString)subtitleFromPush
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)setSubtitleFromPush:(id)a3
{
}

- (NSDictionary)relationships
{
  return (NSDictionary *)objc_getProperty(self, a2, 288, 1);
}

- (void)setRelationships:(id)a3
{
}

- (NSString)contactHandle
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void)setContactHandle:(id)a3
{
}

- (BOOL)isMalformed
{
  return self->_isMalformed;
}

- (void)setIsMalformed:(BOOL)a3
{
  self->_isMalformed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactHandle, 0);
  objc_storeStrong((id *)&self->_relationships, 0);
  objc_storeStrong((id *)&self->_subtitleFromPush, 0);
  objc_storeStrong((id *)&self->_bodyFromPush, 0);

  objc_storeStrong((id *)&self->_titleFromPush, 0);
}

@end