@interface GKTurnBasedMultiplayerBulletin
+ (BOOL)displayNotification;
+ (BOOL)shouldExpirePlayerList;
+ (BOOL)shouldLoadCacheData;
+ (BOOL)shouldLoadCacheDetails;
+ (BOOL)shouldLoadCacheList;
+ (BOOL)supportsSecureCoding;
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (BOOL)userTapped;
- (GKTurnBasedMultiplayerBulletin)initWithCoder:(id)a3;
- (GKTurnBasedMultiplayerBulletin)initWithPushNotification:(id)a3;
- (NSDictionary)localizableMessage;
- (NSNumber)turnCount;
- (NSString)aggregateDictionaryKey;
- (NSString)exchangeID;
- (NSString)guestID;
- (NSString)matchID;
- (id)bulletinMessage;
- (id)description;
- (void)acceptTurnBasedTurn;
- (void)assembleBulletin;
- (void)declineTurnBasedInviteWithReason:(int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)expireAndLoadCaches;
- (void)handleAcceptAction;
- (void)handleAction:(id)a3;
- (void)invalidateTurnCache;
- (void)loadDataWithHandler:(id)a3;
- (void)removePreviousTurnBulletins;
- (void)saveTurnBasedEvent;
- (void)setExchangeID:(id)a3;
- (void)setGuestID:(id)a3;
- (void)setLocalizableMessage:(id)a3;
- (void)setMatchID:(id)a3;
- (void)setTurnCount:(id)a3;
- (void)setUserTapped:(BOOL)a3;
- (void)update;
- (void)updateBadgeCount;
@end

@implementation GKTurnBasedMultiplayerBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedMultiplayerBulletin.m", 46, "+[GKTurnBasedMultiplayerBulletin loadBulletinsForPushNotification:withHandler:]");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100144070;
  v11[3] = &unk_1002DA788;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  +[GKActivity named:v8 execute:v11];
}

+ (BOOL)shouldLoadCacheData
{
  return 1;
}

+ (BOOL)shouldLoadCacheList
{
  return 0;
}

+ (BOOL)shouldLoadCacheDetails
{
  return 1;
}

+ (BOOL)shouldExpirePlayerList
{
  return 0;
}

+ (BOOL)displayNotification
{
  return 1;
}

- (void)update
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin update:", v5, 2u);
  }
  [(GKTurnBasedMultiplayerBulletin *)self updateBadgeCount];
  [(GKTurnBasedMultiplayerBulletin *)self expireAndLoadCaches];
}

- (GKTurnBasedMultiplayerBulletin)initWithPushNotification:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin initWithPushNotification:", buf, 2u);
  }
  v22.receiver = self;
  v22.super_class = (Class)GKTurnBasedMultiplayerBulletin;
  id v7 = [(GKMultiplayerBulletin *)&v22 initWithPushNotification:v4];
  if (v7)
  {
    v8 = +[GKPreferences shared];
    unsigned int v9 = [v8 shouldAllowCustomCommunication];

    if (v9)
    {
      id v10 = [v4 objectForKeyedSubscript:@"m"];
      [(GKBulletin *)v7 setMessage:v10];
    }
    uint64_t v11 = [v4 objectForKeyedSubscript:@"s"];
    matchID = v7->_matchID;
    v7->_matchID = (NSString *)v11;

    uint64_t v13 = [v4 objectForKeyedSubscript:@"lm"];
    localizableMessage = v7->_localizableMessage;
    v7->_localizableMessage = (NSDictionary *)v13;

    uint64_t v15 = [v4 objectForKeyedSubscript:@"x"];
    exchangeID = v7->_exchangeID;
    v7->_exchangeID = (NSString *)v15;

    uint64_t v17 = [v4 objectForKeyedSubscript:@"t"];
    turnCount = v7->_turnCount;
    v7->_turnCount = (NSNumber *)v17;

    uint64_t v19 = [v4 objectForKeyedSubscript:@"g"];
    guestID = v7->_guestID;
    v7->_guestID = (NSString *)v19;
  }
  return v7;
}

- (GKTurnBasedMultiplayerBulletin)initWithCoder:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin initWithCoder:", buf, 2u);
  }
  v20.receiver = self;
  v20.super_class = (Class)GKTurnBasedMultiplayerBulletin;
  id v7 = [(GKGameplayBulletin *)&v20 initWithCoder:v4];
  if (v7)
  {
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"matchID"];
    matchID = v7->_matchID;
    v7->_matchID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"turnCount"];
    turnCount = v7->_turnCount;
    v7->_turnCount = (NSNumber *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userTapped"];
    v7->_userTapped = [v12 BOOLValue];

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizableMessage"];
    localizableMessage = v7->_localizableMessage;
    v7->_localizableMessage = (NSDictionary *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"exchangeID"];
    exchangeID = v7->_exchangeID;
    v7->_exchangeID = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"guestID"];
    guestID = v7->_guestID;
    v7->_guestID = (NSString *)v17;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin encodeWithCoder:", buf, 2u);
  }
  v13.receiver = self;
  v13.super_class = (Class)GKTurnBasedMultiplayerBulletin;
  [(GKGameplayBulletin *)&v13 encodeWithCoder:v4];
  id v7 = [(GKTurnBasedMultiplayerBulletin *)self matchID];
  [v4 encodeObject:v7 forKey:@"matchID"];

  uint64_t v8 = [(GKTurnBasedMultiplayerBulletin *)self turnCount];
  [v4 encodeObject:v8 forKey:@"turnCount"];

  unsigned int v9 = +[NSNumber numberWithBool:[(GKTurnBasedMultiplayerBulletin *)self userTapped]];
  [v4 encodeObject:v9 forKey:@"userTapped"];

  uint64_t v10 = [(GKTurnBasedMultiplayerBulletin *)self localizableMessage];
  [v4 encodeObject:v10 forKey:@"localizableMessage"];

  uint64_t v11 = [(GKTurnBasedMultiplayerBulletin *)self exchangeID];
  [v4 encodeObject:v11 forKey:@"exchangeID"];

  id v12 = [(GKTurnBasedMultiplayerBulletin *)self guestID];
  [v4 encodeObject:v12 forKey:@"guestID"];
}

- (void)loadDataWithHandler:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin loadDataWithHandler:", buf, 2u);
  }
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedMultiplayerBulletin.m", 200, "-[GKTurnBasedMultiplayerBulletin loadDataWithHandler:]");
  uint64_t v8 = +[GKDispatchGroup dispatchGroupWithName:v7];

  unsigned int v9 = +[GKClientProxy gameCenterClient];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10014521C;
  v23[3] = &unk_1002D3A70;
  v23[4] = self;
  id v10 = v8;
  id v24 = v10;
  [v10 perform:v23];
  uint64_t v11 = [(GKGameplayBulletin *)self originatorPlayerID];

  if (v11)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10014539C;
    v21[3] = &unk_1002D3A70;
    v21[4] = self;
    id v22 = v10;
    [v22 perform:v21];
  }
  id v12 = [(GKTurnBasedMultiplayerBulletin *)self matchID];

  if (v12)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001454F4;
    v19[3] = &unk_1002D3A70;
    v19[4] = self;
    id v20 = v10;
    [v20 perform:v19];
  }
  objc_super v13 = [v9 replyQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100145818;
  v16[3] = &unk_1002D3930;
  id v17 = v10;
  id v18 = v4;
  id v14 = v10;
  id v15 = v4;
  [v14 notifyOnQueue:v13 block:v16];
}

- (void)updateBadgeCount
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin updateBadgeCount", v10, 2u);
  }
  id v5 = [(GKBulletin *)self gameDescriptor];
  id v6 = [v5 bundleIdentifier];

  uint64_t v7 = [(GKTurnBasedMultiplayerBulletin *)self turnCount];
  uint64_t v8 = (void *)v7;
  if (v6 && v7)
  {
    unsigned int v9 = +[GKBadgeController sharedController];
    [v9 setBadgeCount:[v8 unsignedIntegerValue] forBundleID:v6 badgeType:2];
  }
}

- (void)saveTurnBasedEvent
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin saveTurnBasedEvent", v7, 2u);
  }
  id v5 = +[GKBulletinController sharedController];
  id v6 = [v5 acceptedInviteManager];

  [v6 addTurnBasedEvent:self];
}

- (void)invalidateTurnCache
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin invalidateTurnCache", buf, 2u);
  }
  id v5 = [(GKBulletin *)self gameDescriptor];
  id v6 = [v5 bundleIdentifier];

  uint64_t v7 = +[GKClientProxy gameCenterClient];
  uint64_t v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedMultiplayerBulletin.m", 279, "-[GKTurnBasedMultiplayerBulletin invalidateTurnCache]");
  unsigned int v9 = +[GKPlayerCredentialController sharedController];
  id v10 = [v9 pushCredentialForEnvironment:[v7 environment]];
  uint64_t v11 = [v10 playerInternal];
  id v12 = [v11 playerID];
  objc_super v13 = [v7 transactionGroupWithName:v8 forPlayerID:v12];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100145C4C;
  v15[3] = &unk_1002D4078;
  id v16 = v6;
  id v17 = self;
  id v14 = v6;
  [v13 performOnManagedObjectContext:v15];
}

- (void)acceptTurnBasedTurn
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin acceptTurnBasedTurn", buf, 2u);
  }
  [(GKTurnBasedMultiplayerBulletin *)self invalidateTurnCache];
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Accept Turn Based Invite", v12, 2u);
  }
  uint64_t v7 = +[GKBulletinController sharedController];
  uint64_t v8 = [v7 acceptedInviteManager];

  [v8 addTurnBasedEvent:self];
  if ([(GKGameplayBulletin *)self gameLocation] == 1)
  {
    unsigned int v9 = [(GKBulletin *)self gameDescriptor];
    id v10 = [v9 bundleIdentifier];
    uint64_t v11 = +[GKClientProxy clientForBundleID:v10];

    [v11 fetchTurnBasedData];
  }
}

- (void)declineTurnBasedInviteWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin declineTurnBasedInviteWithReason:", v23, 2u);
  }
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  uint64_t v8 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Decline Turn Based Invite", v23, 2u);
  }
  unsigned int v9 = [(GKTurnBasedMultiplayerBulletin *)self guestID];
  if (v9)
  {
    v26[0] = @"session-id";
    id v10 = [(GKTurnBasedMultiplayerBulletin *)self matchID];
    v27[0] = v10;
    v26[1] = @"reason";
    uint64_t v11 = +[NSNumber numberWithUnsignedInt:v3];
    v26[2] = @"guest-id";
    v27[1] = v11;
    v27[2] = v9;
    id v12 = v27;
    objc_super v13 = v26;
    uint64_t v14 = 3;
  }
  else
  {
    v24[0] = @"session-id";
    id v10 = [(GKTurnBasedMultiplayerBulletin *)self matchID];
    v24[1] = @"reason";
    v25[0] = v10;
    uint64_t v11 = +[NSNumber numberWithUnsignedInt:v3];
    v25[1] = v11;
    id v12 = v25;
    objc_super v13 = v24;
    uint64_t v14 = 2;
  }
  id v15 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v13 count:v14];
  id v16 = +[NSPropertyListSerialization dataWithPropertyList:v15 format:100 options:0 error:0];

  id v17 = +[GKClientProxy gameCenterClient];
  id v18 = +[GKDataRequestManager sharedManager];
  uint64_t v19 = [v18 storeBag];
  id v20 = +[GKPlayerCredentialController sharedController];
  [v20 pushCredentialForEnvironment:[v17 environment]];
  [v19 writeDataForBagKey:@"gk-tb-decline" postData:v16 client:0 credential:v21 completion:0];

  id v22 = +[GKReporter reporter];
  [v22 reportEvent:GKReporterDomainTurnBased type:GKReporterTurnBasedDecline];
}

- (void)removePreviousTurnBulletins
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin removePreviousTurnBulletins", buf, 2u);
  }
  id v5 = +[GKBulletinController sharedController];
  id v6 = [v5 getBulletinsOfType:objc_opt_class()];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [v6 objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * (void)v10)];
        id v12 = [v11 matchID];
        objc_super v13 = [(GKTurnBasedMultiplayerBulletin *)self matchID];
        unsigned int v14 = [v12 isEqualToString:v13];

        if (v14) {
          [v5 withdrawBulletin:v11];
        }

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v8);
  }
}

- (id)bulletinMessage
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin bulletinMessage", buf, 2u);
  }
  id v5 = [(GKGameplayBulletin *)self receiverGuestPlayerID];
  id v6 = [v5 length];

  if (v6) {
    +[GCFLocalizedStrings KETTLE_TURN_BASED_YOUR_GUESTS_TURN_NOTIFICATION_MESSAGE_FORMAT];
  }
  else {
  id v7 = +[GCFLocalizedStrings KETTLE_TURN_BASED_YOUR_TURN_NOTIFICATION_MESSAGE_FORMAT];
  }
  id v8 = [(GKBulletin *)self message];
  uint64_t v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v8);

  return v9;
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin assembleBulletin", buf, 2u);
  }
  [(GKTurnBasedMultiplayerBulletin *)self removePreviousTurnBulletins];
  id v5 = objc_alloc_init(GKBulletinAction);
  [(GKBulletinAction *)v5 setType:1];
  id v6 = [(GKBulletin *)self gameDescriptor];
  id v7 = [v6 adamID];
  [(GKBulletinAction *)v5 setAdamID:v7];

  id v8 = [(GKBulletin *)self gameDescriptor];
  uint64_t v9 = [v8 bundleIdentifier];
  [(GKBulletinAction *)v5 setBundleID:v9];

  if ([(GKGameplayBulletin *)self gameLocation] == 2)
  {
    id v10 = +[GCFLocalizedStrings APP_STORE];
    uint64_t v11 = &GKNotificationCategoryActionsAppStoreClose;
  }
  else
  {
    if ([(GKGameplayBulletin *)self gameLocation] != 1) {
      goto LABEL_10;
    }
    id v10 = +[GCFLocalizedStrings PLAY_TURN_BASED_TURN_BUTTON_TITLE];
    uint64_t v11 = &GKNotificationCategoryActionsPlayClose;
  }
  [(GKBulletinAction *)v5 setTitle:v10];

  [(GKBulletin *)self setCategoryIdentifier:*v11];
LABEL_10:
  id v12 = objc_alloc_init(GKBulletinAction);
  [(GKBulletinAction *)v12 setType:0];
  objc_super v13 = +[GCFLocalizedStrings CLOSE_TURN_BASED_ALERT_BUTTON_TITLE];
  [(GKBulletinAction *)v12 setTitle:v13];

  [(GKBulletinAction *)v12 setInfo:&stru_1002E4F58];
  unsigned int v14 = [(GKTurnBasedMultiplayerBulletin *)self localizableMessage];
  long long v15 = [(GKBulletin *)self gameDescriptor];
  long long v16 = [v15 bundleIdentifier];
  long long v17 = +[NSBundle _gkLocalizedMessageFromPushDictionary:v14 forBundleID:v16];

  if ([v17 length])
  {
    long long v18 = +[GCFLocalizedStrings TURN_BASED_NOTIFICATION_CUSTOM_1_GAME_2_MESSAGE];
    uint64_t v19 = [(GKBulletin *)self gameName];
    id v20 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v19, v17);
LABEL_14:

    goto LABEL_15;
  }
  v21 = [(GKBulletin *)self message];
  id v22 = [v21 length];

  if (v22)
  {
    long long v18 = +[GCFLocalizedStrings TURN_BASED_NOTIFICATION_CUSTOM_1_GAME_2_MESSAGE];
    uint64_t v19 = [(GKBulletin *)self gameName];
    v23 = [(GKBulletin *)self message];
    id v20 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v19, v23);

    goto LABEL_14;
  }
  id v20 = [(GKTurnBasedMultiplayerBulletin *)self bulletinMessage];
LABEL_15:
  [(GKBulletin *)self setMessage:v20];
  [(GKBulletin *)self setHasSound:1];
  id v24 = [(GKBulletin *)self gameDescriptor];
  v25 = [v24 bundleIdentifier];
  v26 = [(GKMultiplayerBulletin *)self customInviteSoundPathForBundleID:v25];
  [(GKBulletin *)self setSoundPath:v26];

  v27 = +[NSDate date];
  [(GKBulletin *)self setDate:v27];

  v28 = [(GKBulletin *)self expirationDate];

  if (!v28)
  {
    v29 = +[NSDate dateWithTimeIntervalSinceNow:2592000.0];
    [(GKBulletin *)self setExpirationDate:v29];
  }
  [(GKBulletin *)self setDefaultAction:v5];
  [(GKBulletin *)self setDismissAction:v12];
  v30 = +[GCFLocalizedStrings KETTLE_GENERAL_NOTIFICATION_TITLE];
  v31 = [(GKBulletin *)self gameName];
  v32 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v30, v31);
  [(GKBulletin *)self setTitle:v32];
}

- (void)expireAndLoadCaches
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin expireAndLoadCaches", buf, 2u);
  }
  id v5 = [(GKBulletin *)self gameDescriptor];
  id v6 = [v5 bundleIdentifier];
  id v7 = +[GKClientProxy clientForBundleID:v6];

  id v8 = +[GKClientProxy gameCenterClient];
  uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedMultiplayerBulletin.m", 410, "-[GKTurnBasedMultiplayerBulletin expireAndLoadCaches]");
  id v10 = +[GKPlayerCredentialController sharedController];
  uint64_t v11 = [v10 pushCredentialForEnvironment:[v7 environment]];
  id v12 = [v11 playerInternal];
  objc_super v13 = [v12 playerID];
  unsigned int v14 = [v8 transactionGroupWithName:v9 forPlayerID:v13];

  long long v15 = +[GKService serviceWithTransport:0 forClient:v7 localPlayer:0];
  +[GKService serviceWithTransport:0 forClient:v8 localPlayer:0];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100146BF0;
  v19[3] = &unk_1002D4FB0;
  v19[4] = self;
  id v20 = v8;
  id v21 = v15;
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v22;
  id v17 = v15;
  id v18 = v8;
  [v14 performOnManagedObjectContext:v19];
  [v14 wait];
}

- (void)handleAcceptAction
{
  if (!os_log_GKGeneral) {
    id v2 = (id)GKOSLoggers();
  }
  id v3 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin handleAcceptAction", v4, 2u);
  }
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
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerBulletin handleAction:", buf, 2u);
  }
  v9.receiver = self;
  v9.super_class = (Class)GKTurnBasedMultiplayerBulletin;
  [(GKBulletin *)&v9 handleAction:v4];
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  id v8 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "bulletin handle turn based action: %@", buf, 0xCu);
  }
  if (([v4 isEqualToString:@"GKAccepted"] & 1) != 0
    || [v4 isEqualToString:@"GKDefault"])
  {
    [(GKTurnBasedMultiplayerBulletin *)self setUserTapped:1];
    [(GKTurnBasedMultiplayerBulletin *)self handleAcceptAction];
  }
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)GKTurnBasedMultiplayerBulletin;
  id v3 = [(GKBulletin *)&v7 description];
  id v4 = [(GKTurnBasedMultiplayerBulletin *)self matchID];
  id v5 = [v3 stringByAppendingFormat:@"\nmatchID:%@\n", v4];

  return v5;
}

- (NSString)matchID
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setMatchID:(id)a3
{
}

- (NSNumber)turnCount
{
  return (NSNumber *)objc_getProperty(self, a2, 264, 1);
}

- (void)setTurnCount:(id)a3
{
}

- (BOOL)userTapped
{
  return self->_userTapped;
}

- (void)setUserTapped:(BOOL)a3
{
  self->_userTapped = a3;
}

- (NSDictionary)localizableMessage
{
  return (NSDictionary *)objc_getProperty(self, a2, 272, 1);
}

- (void)setLocalizableMessage:(id)a3
{
}

- (NSString)exchangeID
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)setExchangeID:(id)a3
{
}

- (NSString)guestID
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (void)setGuestID:(id)a3
{
}

- (NSString)aggregateDictionaryKey
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateDictionaryKey, 0);
  objc_storeStrong((id *)&self->_guestID, 0);
  objc_storeStrong((id *)&self->_exchangeID, 0);
  objc_storeStrong((id *)&self->_localizableMessage, 0);
  objc_storeStrong((id *)&self->_turnCount, 0);

  objc_storeStrong((id *)&self->_matchID, 0);
}

@end