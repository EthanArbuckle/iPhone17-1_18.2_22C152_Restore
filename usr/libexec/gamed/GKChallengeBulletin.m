@interface GKChallengeBulletin
+ (BOOL)supportsSecureCoding;
+ (void)expireChallengeList;
- (BOOL)isAppRunning;
- (BOOL)supportsChallenges;
- (GKChallengeBulletin)init;
- (GKChallengeBulletin)initWithCoder:(id)a3;
- (GKChallengeInternal)challenge;
- (NSString)challengeID;
- (id)URLContext;
- (id)customChallengeSoundPathForBundleID:(id)a3;
- (id)gameDescriptor;
- (id)gameName;
- (id)originatorPlayer;
- (id)originatorPlayerID;
- (id)receiverPlayer;
- (id)receiverPlayerID;
- (unint64_t)launchEventType;
- (void)assembleBulletin;
- (void)determineGameLocationOnDeviceOrInStoreWithCompletionHandler:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleAcceptAction;
- (void)notifyApp;
- (void)notifyClient:(id)a3;
- (void)refreshData;
- (void)setChallenge:(id)a3;
- (void)setChallengeID:(id)a3;
- (void)setGameName:(id)a3;
- (void)setOriginatorPlayer:(id)a3;
- (void)setOriginatorPlayerID:(id)a3;
- (void)setReceiverPlayer:(id)a3;
- (void)setReceiverPlayerID:(id)a3;
@end

@implementation GKChallengeBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKChallengeBulletin)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKChallengeBulletin;
  return [(GKChallengeBulletin *)&v3 init];
}

- (GKChallengeBulletin)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKChallengeBulletin;
  v5 = [(GKGameplayBulletin *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"challenge"];
    challenge = v5->_challenge;
    v5->_challenge = (GKChallengeInternal *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKChallengeBulletin;
  id v4 = a3;
  [(GKGameplayBulletin *)&v6 encodeWithCoder:v4];
  v5 = [(GKChallengeBulletin *)self challenge];
  [v4 encodeObject:v5 forKey:@"challenge"];
}

- (id)URLContext
{
  return GKContextChallenge;
}

+ (void)expireChallengeList
{
  if (!os_log_GKGeneral) {
    id v2 = (id)GKOSLoggers();
  }
  objc_super v3 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "GKChallengeBulletin expireChallengeList", buf, 2u);
  }
  id v4 = +[GKClientProxy gameCenterClient];
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKChallengeBulletin.m", 91, "+[GKChallengeBulletin expireChallengeList]");
  objc_super v6 = +[GKPlayerCredentialController sharedController];
  v7 = [v6 pushCredentialForEnvironment:[v4 environment]];
  v8 = [v7 playerInternal];
  objc_super v9 = [v8 playerID];
  v10 = [v4 transactionGroupWithName:v5 forPlayerID:v9];

  [v10 performOnManagedObjectContext:&stru_1002DC6D0];
}

- (void)determineGameLocationOnDeviceOrInStoreWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  objc_super v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKChallengeBulletin - determineGameLocationOnDeviceOrInStoreWithCompletionHandler:", buf, 2u);
  }
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKChallengeBulletin.m", 104, "-[GKChallengeBulletin determineGameLocationOnDeviceOrInStoreWithCompletionHandler:]");
  v8 = +[GKDispatchGroup dispatchGroupWithName:v7];

  v24 = +[GKClientProxy gameCenterClient];
  objc_super v9 = +[GKApplicationWorkspace defaultWorkspace];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v10 = [(GKChallengeBulletin *)self challenge];
  v11 = [v10 compatibleBundleIDs];

  id v12 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v31;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        v17 = [v9 applicationProxyForBundleID:v16];
        if ([v17 isInstalled]
          && ([v17 isRestricted] & 1) == 0)
        {
          v18 = [(GKChallengeBulletin *)self gameDescriptor];
          [v18 setBundleIdentifier:v16];

          v19 = [v17 bundleVersion];
          v20 = [(GKChallengeBulletin *)self gameDescriptor];
          [v20 setBundleVersion:v19];

          v21 = [v17 bundleShortVersion];
          v22 = [(GKChallengeBulletin *)self gameDescriptor];
          [v22 setShortBundleVersion:v21];

          [(GKGameplayBulletin *)self setGameLocation:1];
          goto LABEL_16;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  if ([(GKGameplayBulletin *)self gameLocation] != 1)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100153A40;
    v28[3] = &unk_1002D3A70;
    v28[4] = self;
    id v29 = v8;
    [v29 perform:v28];
  }
  if (v4)
  {
    v23 = [v24 replyQueue];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100153B8C;
    v25[3] = &unk_1002D3930;
    id v27 = v4;
    id v26 = v8;
    [v26 notifyOnQueue:v23 block:v25];
  }
}

- (id)gameDescriptor
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKChallengeBulletin gameDescriptor", buf, 2u);
  }
  gameDescriptor = self->super.super._gameDescriptor;
  if (!gameDescriptor)
  {
    if (self->_challenge)
    {
      v19 = [(GKChallengeBulletin *)self challenge];
      objc_super v6 = [v19 bundleID];
      v18 = [(GKChallengeBulletin *)self challenge];
      v17 = [v18 game];
      v7 = [v17 bundleVersion];
      v8 = [(GKChallengeBulletin *)self challenge];
      objc_super v9 = [v8 game];
      v10 = [v9 shortBundleVersion];
      v11 = [(GKChallengeBulletin *)self challenge];
      id v12 = [v11 game];
      id v13 = [v12 adamID];
      uint64_t v14 = +[GKGameDescriptor gameDescriptorWithBundleID:v6 bundleVersion:v7 shortBundleVersion:v10 adamID:v13];
      v15 = self->super.super._gameDescriptor;
      self->super.super._gameDescriptor = v14;

      gameDescriptor = self->super.super._gameDescriptor;
    }
    else
    {
      gameDescriptor = 0;
    }
  }

  return gameDescriptor;
}

- (id)receiverPlayerID
{
  id v2 = [(GKChallengeBulletin *)self challenge];
  id v3 = [v2 receivingPlayer];
  id v4 = [v3 playerID];

  return v4;
}

- (void)setReceiverPlayerID:(id)a3
{
  id v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  +[NSException raise:NSObjectInaccessibleException, @"%@ does not set players manually, they are all derived from the set challenge", v4 format];
}

- (id)receiverPlayer
{
  id v2 = [(GKChallengeBulletin *)self challenge];
  id v3 = [v2 receivingPlayer];

  return v3;
}

- (void)setReceiverPlayer:(id)a3
{
  id v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  +[NSException raise:NSObjectInaccessibleException, @"%@ does not set players manually, they are all derived from the set challenge", v4 format];
}

- (id)originatorPlayerID
{
  id v2 = [(GKChallengeBulletin *)self challenge];
  id v3 = [v2 issuingPlayer];
  id v4 = [v3 playerID];

  return v4;
}

- (void)setOriginatorPlayerID:(id)a3
{
  id v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  +[NSException raise:NSObjectInaccessibleException, @"%@ does not set players manually, they are all derived from the set challenge", v4 format];
}

- (id)originatorPlayer
{
  id v2 = [(GKChallengeBulletin *)self challenge];
  id v3 = [v2 issuingPlayer];

  return v3;
}

- (void)setOriginatorPlayer:(id)a3
{
  id v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  +[NSException raise:NSObjectInaccessibleException, @"%@ does not set players manually, they are all derived from the set challenge", v4 format];
}

- (id)gameName
{
  id v2 = [(GKChallengeBulletin *)self challenge];
  id v3 = [v2 game];
  id v4 = [v3 name];

  return v4;
}

- (BOOL)supportsChallenges
{
  id v2 = [(GKChallengeBulletin *)self challenge];
  id v3 = [v2 game];
  unsigned __int8 v4 = [v3 supportsChallenges];

  return v4;
}

- (void)setGameName:(id)a3
{
  id v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  +[NSException raise:NSObjectInaccessibleException, @"%@ does not set gameName manually, they are all derived from the set challenge", v4 format];
}

- (void)refreshData
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKChallengeBulletin refreshData", v11, 2u);
  }
  id v5 = +[GKClientProxy gameCenterClient];
  CFStringRef v12 = @"scroll";
  objc_super v6 = +[NSNumber numberWithBool:1];
  id v13 = v6;
  v7 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  [v5 refreshContentsForDataType:1 userInfo:v7];

  v8 = [(GKChallengeBulletin *)self challenge];
  objc_super v9 = [v8 bundleID];
  v10 = +[GKClientProxy clientForBundleID:v9];

  [v10 refreshContentsForDataType:1 userInfo:0];
}

- (BOOL)isAppRunning
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    LOWORD(v16[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKChallengeBulletin isAppRunning", (uint8_t *)v16, 2u);
  }
  id v5 = [(GKChallengeBulletin *)self challenge];
  objc_super v6 = [v5 bundleID];

  if (!v6) {
    return 0;
  }
  v7 = [(GKChallengeBulletin *)self challenge];
  v8 = [v7 bundleID];
  int v9 = GKGetApplicationStateForBundleID(v8);

  if (!os_log_GKGeneral) {
    id v10 = (id)GKOSLoggers();
  }
  v11 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    CFStringRef v12 = v11;
    id v13 = [(GKChallengeBulletin *)self challenge];
    uint64_t v14 = [v13 bundleID];
    v16[0] = 67109378;
    v16[1] = v9;
    __int16 v17 = 2112;
    v18 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "presentChallengeReceived: got appState of %d for %@", (uint8_t *)v16, 0x12u);
  }
  return v9 == 8;
}

- (void)notifyApp
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKChallengeBulletin notifyApp", (uint8_t *)&v12, 2u);
  }
  id v5 = [(GKChallengeBulletin *)self challenge];
  objc_super v6 = [v5 bundleID];
  v7 = +[GKClientProxy clientForBundleID:v6];

  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  int v9 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    v11 = [(GKChallengeBulletin *)self challenge];
    int v12 = 138412546;
    id v13 = v7;
    __int16 v14 = 2112;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "telling the client %@ about challenge %@", (uint8_t *)&v12, 0x16u);
  }
  [(GKChallengeBulletin *)self notifyClient:v7];
  [v7 refreshContentsForDataType:1 userInfo:0];
}

- (void)notifyClient:(id)a3
{
  id v3 = a3;
  if (!os_log_GKGeneral) {
    id v4 = (id)GKOSLoggers();
  }
  id v5 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKChallengeBulletin notifyClient:", buf, 2u);
  }
  objc_super v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  +[NSException raise:NSObjectInaccessibleException, @"%@ Only to be used by derived classes", v7 format];
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKChallengeBulletin assembleBulletin", buf, 2u);
  }
  id v5 = +[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_TITLE];
  objc_super v6 = [(GKChallengeBulletin *)self gameName];
  v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v6);
  [(GKBulletin *)self setTitle:v7];

  [(GKBulletin *)self setHasSound:1];
  id v8 = [(GKChallengeBulletin *)self gameDescriptor];
  int v9 = [v8 bundleIdentifier];
  id v10 = [(GKChallengeBulletin *)self customChallengeSoundPathForBundleID:v9];
  [(GKBulletin *)self setSoundPath:v10];

  v11 = +[NSDate date];
  [(GKBulletin *)self setDate:v11];
}

- (id)customChallengeSoundPathForBundleID:(id)a3
{
  id v3 = a3;
  if (!os_log_GKGeneral) {
    id v4 = (id)GKOSLoggers();
  }
  id v5 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKChallengeBulletin customChallengeSoundPathForBundleID:", v13, 2u);
  }
  objc_super v6 = GKGetBundlePathForIdentifier();
  v7 = +[NSBundle bundleWithPath:v6];
  uint64_t v8 = [v7 _gkPathForChallengeSound];
  int v9 = (void *)v8;
  id v10 = &stru_1002E4F58;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  v11 = v10;

  return v11;
}

- (unint64_t)launchEventType
{
  if (!os_log_GKGeneral) {
    id v4 = (id)GKOSLoggers();
  }
  id v5 = (void *)os_log_GKError;
  if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
    sub_100157604(v5, (uint64_t)self, a2);
  }
  return -1;
}

- (void)handleAcceptAction
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKChallengeBulletin handleAcceptAction", (uint8_t *)&v17, 2u);
  }
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  objc_super v6 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412290;
    v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKChallenge Notification: challenge received handling accept action %@", (uint8_t *)&v17, 0xCu);
  }
  if ([(GKGameplayBulletin *)self gameLocation] == 1)
  {
    if (!os_log_GKGeneral) {
      id v7 = (id)GKOSLoggers();
    }
    uint64_t v8 = (void *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      int v9 = v8;
      id v10 = [(GKChallengeBulletin *)self gameDescriptor];
      v11 = [v10 bundleIdentifier];
      int v17 = 138412290;
      v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKChallenge Notification: set launch event for client %@", (uint8_t *)&v17, 0xCu);
    }
    int v12 = [(GKChallengeBulletin *)self gameDescriptor];
    id v13 = [v12 bundleIdentifier];
    __int16 v14 = +[GKClientProxy clientForBundleID:v13];

    unint64_t v15 = [(GKChallengeBulletin *)self launchEventType];
    uint64_t v16 = [(GKChallengeBulletin *)self challenge];
    [v14 setLaunchEvent:v15 withContext:v16];
  }
}

- (GKChallengeInternal)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
}

- (NSString)challengeID
{
  return self->_challengeID;
}

- (void)setChallengeID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_challengeID, 0);

  objc_storeStrong((id *)&self->_challenge, 0);
}

@end