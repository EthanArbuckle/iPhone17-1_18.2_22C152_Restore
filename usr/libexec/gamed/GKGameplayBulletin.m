@interface GKGameplayBulletin
+ (BOOL)areGameVersionsCompatibleForGame:(id)a3 shortVersion:(id)a4 version:(id)a5;
+ (BOOL)supportsSecureCoding;
- (BOOL)isCompatibleWithGameDescriptor:(id)a3;
- (BOOL)isPushForLocalPlayers;
- (BOOL)isPushFromLocalPlayers;
- (BOOL)setInstalledGameLocationFor:(id)a3 descriptor:(id)a4;
- (GKGameplayBulletin)initWithCoder:(id)a3;
- (GKPlayerInternal)originatorGuestPlayer;
- (GKPlayerInternal)originatorPlayer;
- (GKPlayerInternal)receiverGuestPlayer;
- (GKPlayerInternal)receiverPlayer;
- (NSArray)compatibleShortVersions;
- (NSArray)compatibleVersions;
- (NSString)URLContext;
- (NSString)originatorGuestPlayerID;
- (NSString)originatorPlayerID;
- (NSString)receiverGuestPlayerID;
- (NSString)receiverPlayerID;
- (unsigned)gameLocation;
- (void)checkCompatibleGameWithoutCompatibilityMatrix;
- (void)determineGameLocationOnDeviceOrInStoreWithCompletionHandler:(id)a3;
- (void)determineGameLocationViaCompatibilityMatrixWithCompletionHandler:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)loadOriginatorPlayerWithCompletionHandler:(id)a3;
- (void)setCompatibleShortVersions:(id)a3;
- (void)setCompatibleVersions:(id)a3;
- (void)setGameLocation:(unsigned __int8)a3;
- (void)setOriginatorGuestPlayer:(id)a3;
- (void)setOriginatorGuestPlayerID:(id)a3;
- (void)setOriginatorPlayer:(id)a3;
- (void)setOriginatorPlayerID:(id)a3;
- (void)setReceiverGuestPlayer:(id)a3;
- (void)setReceiverGuestPlayerID:(id)a3;
- (void)setReceiverPlayer:(id)a3;
- (void)setReceiverPlayerID:(id)a3;
@end

@implementation GKGameplayBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKGameplayBulletin)initWithCoder:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKGameplayBulletin initWithCoder:", buf, 2u);
  }
  v36.receiver = self;
  v36.super_class = (Class)GKGameplayBulletin;
  v7 = [(GKBulletin *)&v36 initWithCoder:v4];
  if (v7)
  {
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"receiverPlayerID"];
    receiverPlayerID = v7->_receiverPlayerID;
    v7->_receiverPlayerID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originatorPlayerID"];
    originatorPlayerID = v7->_originatorPlayerID;
    v7->_originatorPlayerID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"receiverPlayer"];
    receiverPlayer = v7->_receiverPlayer;
    v7->_receiverPlayer = (GKPlayerInternal *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originatorPlayer"];
    originatorPlayer = v7->_originatorPlayer;
    v7->_originatorPlayer = (GKPlayerInternal *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"receiverGuestPlayerID"];
    receiverGuestPlayerID = v7->_receiverGuestPlayerID;
    v7->_receiverGuestPlayerID = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originatorGuestPlayerID"];
    originatorGuestPlayerID = v7->_originatorGuestPlayerID;
    v7->_originatorGuestPlayerID = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"receiverGuestPlayer"];
    receiverGuestPlayer = v7->_receiverGuestPlayer;
    v7->_receiverGuestPlayer = (GKPlayerInternal *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originatorGuestPlayer"];
    originatorGuestPlayer = v7->_originatorGuestPlayer;
    v7->_originatorGuestPlayer = (GKPlayerInternal *)v22;

    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    v26 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v24, v25, objc_opt_class(), 0);
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"compatibleVersions"];
    compatibleVersions = v7->_compatibleVersions;
    v7->_compatibleVersions = (NSArray *)v27;

    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    v31 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v29, v30, objc_opt_class(), 0);
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"compatibleShortVersions"];
    compatibleShortVersions = v7->_compatibleShortVersions;
    v7->_compatibleShortVersions = (NSArray *)v32;

    v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gameLocation"];
    v7->_gameLocation = [v34 integerValue];
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKGameplayBulletin encodeWithCoder:", buf, 2u);
  }
  v18.receiver = self;
  v18.super_class = (Class)GKGameplayBulletin;
  [(GKBulletin *)&v18 encodeWithCoder:v4];
  v7 = [(GKGameplayBulletin *)self receiverPlayerID];
  [v4 encodeObject:v7 forKey:@"receiverPlayerID"];

  uint64_t v8 = [(GKGameplayBulletin *)self originatorPlayerID];
  [v4 encodeObject:v8 forKey:@"originatorPlayerID"];

  v9 = [(GKGameplayBulletin *)self receiverPlayer];
  [v4 encodeObject:v9 forKey:@"receiverPlayer"];

  uint64_t v10 = [(GKGameplayBulletin *)self originatorPlayer];
  [v4 encodeObject:v10 forKey:@"originatorPlayer"];

  v11 = [(GKGameplayBulletin *)self receiverGuestPlayerID];
  [v4 encodeObject:v11 forKey:@"receiverGuestPlayerID"];

  uint64_t v12 = [(GKGameplayBulletin *)self originatorGuestPlayerID];
  [v4 encodeObject:v12 forKey:@"originatorGuestPlayerID"];

  v13 = [(GKGameplayBulletin *)self receiverGuestPlayer];
  [v4 encodeObject:v13 forKey:@"receiverGuestPlayer"];

  uint64_t v14 = [(GKGameplayBulletin *)self originatorGuestPlayer];
  [v4 encodeObject:v14 forKey:@"originatorGuestPlayer"];

  v15 = [(GKGameplayBulletin *)self compatibleVersions];
  [v4 encodeObject:v15 forKey:@"compatibleVersions"];

  uint64_t v16 = [(GKGameplayBulletin *)self compatibleShortVersions];
  [v4 encodeObject:v16 forKey:@"compatibleShortVersions"];

  v17 = +[NSNumber numberWithInt:[(GKGameplayBulletin *)self gameLocation]];
  [v4 encodeObject:v17 forKey:@"gameLocation"];
}

- (NSString)URLContext
{
  return (NSString *)&stru_1002E4F58;
}

- (BOOL)isPushForLocalPlayers
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKGameplayBulletin isPushForLocalPlayers", v8, 2u);
  }
  id v5 = [(GKGameplayBulletin *)self receiverPlayerID];
  unsigned __int8 v6 = [(id)objc_opt_class() playerIsLocal:v5];

  return v6;
}

- (BOOL)isPushFromLocalPlayers
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKGameplayBulletin isPushFromLocalPlayers", v8, 2u);
  }
  id v5 = [(GKGameplayBulletin *)self originatorPlayerID];
  unsigned __int8 v6 = [(id)objc_opt_class() playerIsLocal:v5];

  return v6;
}

- (BOOL)isCompatibleWithGameDescriptor:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  unsigned __int8 v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKGameplayBulletin isCompatibleWithGameDescriptor:", v22, 2u);
  }
  v7 = [(GKBulletin *)self gameDescriptor];
  uint64_t v8 = [v7 bundleIdentifier];

  v9 = [(GKBulletin *)self gameDescriptor];
  uint64_t v10 = [v9 bundleVersion];

  v11 = [(GKBulletin *)self gameDescriptor];
  uint64_t v12 = [v11 shortBundleVersion];

  v13 = [v4 bundleIdentifier];
  unsigned int v14 = [v8 isEqualToString:v13];

  if (!v14) {
    goto LABEL_13;
  }
  v15 = [v4 shortBundleVersion];
  uint64_t v16 = [v4 bundleVersion];
  if (![v12 isEqualToString:v15])
  {
    v17 = [(GKGameplayBulletin *)self compatibleShortVersions];
    if (([v17 containsObject:v15] & 1) != 0
      || [v10 isEqualToString:v16])
    {

      goto LABEL_10;
    }
    v19 = [(GKGameplayBulletin *)self compatibleVersions];
    unsigned __int8 v20 = [v19 containsObject:v16];

    if (v20) {
      goto LABEL_11;
    }
LABEL_13:
    BOOL v18 = 0;
    goto LABEL_14;
  }
LABEL_10:

LABEL_11:
  BOOL v18 = 1;
LABEL_14:

  return v18;
}

- (void)checkCompatibleGameWithoutCompatibilityMatrix
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKGameplayBulletin checkCompatibleGameWithoutCompatibilityMatrix", buf, 2u);
  }
  id v5 = +[GKApplicationWorkspace defaultWorkspace];
  unsigned __int8 v6 = [(GKBulletin *)self gameDescriptor];
  v7 = [v6 bundleIdentifier];

  uint64_t v8 = [v5 applicationProxyForBundleID:v7];
  if ([v8 isInstalled] && (objc_msgSend(v8, "isRestricted") & 1) == 0)
  {
    v9 = [v8 bundleShortVersion];
    v31 = [v8 bundleVersion];
    uint64_t v10 = [(GKBulletin *)self gameDescriptor];
    v11 = [v10 shortBundleVersion];
    if (([v11 isEqualToString:v9] & 1) == 0)
    {
      uint64_t v12 = [(GKGameplayBulletin *)self compatibleShortVersions];
      if (([v12 containsObject:v9] & 1) == 0)
      {
        uint64_t v29 = v9;
        uint64_t v30 = v12;
        v13 = [(GKBulletin *)self gameDescriptor];
        unsigned int v14 = [v13 bundleVersion];
        if (([v14 isEqualToString:v31] & 1) == 0)
        {
          uint64_t v27 = v14;
          v28 = v13;
          v15 = [(GKGameplayBulletin *)self compatibleVersions];
          uint64_t v16 = v31;
          if ((objc_msgSend(v15, "containsObject:") & 1) == 0)
          {
            unsigned __int8 v26 = [v31 isEqualToString:@"-1"];

            v9 = v29;
            if ((v26 & 1) == 0)
            {
LABEL_25:

              goto LABEL_26;
            }
LABEL_15:
            id v17 = +[GKApplicationWorkspace getPlatformForBundleID:v7];
            BOOL v18 = [(GKBulletin *)self gameDescriptor];
            id v19 = [v18 platform];

            if (v19 == v17)
            {
              if (!os_log_GKGeneral) {
                id v20 = (id)GKOSLoggers();
              }
              v21 = os_log_GKDaemon;
              uint64_t v16 = v31;
              if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412802;
                v33 = v7;
                __int16 v34 = 2112;
                v35 = v9;
                __int16 v36 = 2112;
                v37 = v31;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Found perfect compatible game: bundleID = %@, short version = %@, version = %@", buf, 0x20u);
              }
              uint64_t v22 = [(GKBulletin *)self gameDescriptor];
              [v22 setShortBundleVersion:v9];

              v23 = [(GKBulletin *)self gameDescriptor];
              [v23 setBundleVersion:v31];

              [(GKGameplayBulletin *)self setGameLocation:1];
            }
            else
            {
              if (!os_log_GKGeneral) {
                id v24 = (id)GKOSLoggers();
              }
              uint64_t v25 = os_log_GKDaemon;
              uint64_t v16 = v31;
              if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412802;
                v33 = v7;
                __int16 v34 = 2112;
                v35 = v9;
                __int16 v36 = 2112;
                v37 = v31;
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Didn't find a perfect compatible game: bundleID = %@, short version = %@, version = %@", buf, 0x20u);
              }
            }
            goto LABEL_25;
          }

          unsigned int v14 = v27;
          v13 = v28;
        }

        v9 = v29;
        uint64_t v12 = v30;
      }
    }
    goto LABEL_15;
  }
LABEL_26:
}

- (BOOL)setInstalledGameLocationFor:(id)a3 descriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 platform]
    || (+[GKGameDescriptor supportsPlatform:](GKGameDescriptor, "supportsPlatform:", [v6 platform]) & 1) != 0)
  {
    uint64_t v8 = [v6 bundleID];
    v9 = +[GKApplicationWorkspace defaultWorkspace];
    uint64_t v10 = [v9 applicationProxyForBundleID:v8];

    if ([v10 isInstalled] && (objc_msgSend(v10, "isRestricted") & 1) == 0)
    {
      v13 = [v10 bundleShortVersion];
      unsigned int v14 = [v10 bundleVersion];
      if ([(id)objc_opt_class() areGameVersionsCompatibleForGame:v6 shortVersion:v13 version:v14])
      {
        if (!os_log_GKGeneral) {
          id v25 = (id)GKOSLoggers();
        }
        unsigned __int8 v26 = os_log_GKTrace;
        if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          LOWORD(v35) = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "GKGameplayBulletin - determineGameLocationViaCompatibilityMatrixWithCompletionHandler - Installed compatible app found", (uint8_t *)&v35, 2u);
        }
        if (!os_log_GKGeneral) {
          id v27 = (id)GKOSLoggers();
        }
        v28 = os_log_GKMatch;
        if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
        {
          int v35 = 138412802;
          id v36 = v8;
          __int16 v37 = 2112;
          id v38 = v13;
          __int16 v39 = 2112;
          v40 = v14;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "GKGameplayBulletin - found installed compatible app: bundleID = %@, short version = %@, version = %@", (uint8_t *)&v35, 0x20u);
        }
        BOOL v24 = 1;
        [(GKGameplayBulletin *)self setGameLocation:1];
        uint64_t v29 = [(GKBulletin *)self gameDescriptor];
        [v29 setBundleIdentifier:v8];

        uint64_t v30 = [(GKBulletin *)self gameDescriptor];
        [v30 setBundleVersion:v14];

        v31 = [(GKBulletin *)self gameDescriptor];
        [v31 setShortBundleVersion:v13];

        id v32 = +[GKGameDescriptor currentPlatform];
        v33 = [(GKBulletin *)self gameDescriptor];
        [v33 setPlatform:v32];

        goto LABEL_32;
      }
    }
    else
    {
      v11 = +[GKPreferences shared];
      unsigned __int8 v12 = [v11 isAppInstallationRestricted];

      if (v12)
      {
LABEL_31:
        BOOL v24 = 0;
LABEL_32:

        goto LABEL_33;
      }
      v13 = [v7 objectForKeyedSubscript:@"short-bundle-version"];
      unsigned int v14 = [v7 objectForKeyedSubscript:@"bundle-version"];
      if (!os_log_GKGeneral) {
        id v15 = (id)GKOSLoggers();
      }
      uint64_t v16 = os_log_GKTrace;
      if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        LOWORD(v35) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "GKGameplayBulletin - determineGameLocationViaCompatibilityMatrixWithCompletionHandler - Store Compatible app found", (uint8_t *)&v35, 2u);
      }
      if (!os_log_GKGeneral) {
        id v17 = (id)GKOSLoggers();
      }
      BOOL v18 = os_log_GKMatch;
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        int v35 = 138412802;
        id v36 = v8;
        __int16 v37 = 2112;
        id v38 = v13;
        __int16 v39 = 2112;
        v40 = v14;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "GKGameplayBulletin - found store compatible app: bundleID = %@, short version = %@, version = %@", (uint8_t *)&v35, 0x20u);
      }
      [(GKGameplayBulletin *)self setGameLocation:2];
    }

    goto LABEL_31;
  }
  if (!os_log_GKGeneral) {
    id v19 = (id)GKOSLoggers();
  }
  id v20 = (void *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    v21 = v20;
    id v22 = +[GKGameDescriptor currentPlatform];
    v23 = +[GKGameDescriptor supportedPlatforms];
    int v35 = 134218498;
    id v36 = v22;
    __int16 v37 = 2112;
    id v38 = v6;
    __int16 v39 = 2112;
    v40 = v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "GKGameplayBulletin - skipping mismatching platform between current = %ld and game = %@. Supported platforms: %@", (uint8_t *)&v35, 0x20u);
  }
  BOOL v24 = 0;
LABEL_33:

  return v24;
}

- (void)determineGameLocationViaCompatibilityMatrixWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKGameplayBulletin - determineGameLocationViaCompatibilityMatrixWithCompletionHandler:", buf, 2u);
  }
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameplayBulletin.m", 194, "-[GKGameplayBulletin determineGameLocationViaCompatibilityMatrixWithCompletionHandler:]");
  uint64_t v8 = +[GKDispatchGroup dispatchGroupWithName:v7];

  v9 = +[GKClientProxy gameCenterClient];
  uint64_t v10 = [(GKBulletin *)self gameDescriptor];
  uint64_t v11 = [v10 shortBundleVersion];
  if (v11)
  {
    unsigned __int8 v12 = (void *)v11;
  }
  else
  {
    v13 = [(GKGameplayBulletin *)self compatibleShortVersions];
    id v14 = [v13 count];

    if (!v14) {
      goto LABEL_10;
    }
    uint64_t v10 = [(GKGameplayBulletin *)self compatibleShortVersions];
    unsigned __int8 v12 = [v10 lastObject];
    id v15 = [(GKBulletin *)self gameDescriptor];
    [v15 setShortBundleVersion:v12];
  }
LABEL_10:
  uint64_t v16 = [(GKBulletin *)self gameDescriptor];
  uint64_t v17 = [v16 bundleVersion];
  if (v17)
  {
    BOOL v18 = (void *)v17;
LABEL_14:

    goto LABEL_15;
  }
  id v19 = [(GKGameplayBulletin *)self compatibleVersions];
  id v20 = [v19 count];

  if (v20)
  {
    uint64_t v16 = [(GKGameplayBulletin *)self compatibleVersions];
    BOOL v18 = [v16 lastObject];
    v21 = [(GKBulletin *)self gameDescriptor];
    [v21 setBundleVersion:v18];

    goto LABEL_14;
  }
LABEL_15:
  id v22 = [(GKBulletin *)self gameDescriptor];

  if (v22)
  {
    [(GKGameplayBulletin *)self checkCompatibleGameWithoutCompatibilityMatrix];
    if ([(GKGameplayBulletin *)self gameLocation] != 1)
    {
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100140010;
      v29[3] = &unk_1002D3980;
      v29[4] = self;
      id v30 = v9;
      id v31 = v8;
      [v31 perform:v29];
    }
  }
  v23 = [v9 replyQueue];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100140510;
  v26[3] = &unk_1002D3930;
  id v27 = v8;
  id v28 = v4;
  id v24 = v8;
  id v25 = v4;
  [v24 notifyOnQueue:v23 block:v26];
}

+ (BOOL)areGameVersionsCompatibleForGame:(id)a3 shortVersion:(id)a4 version:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [v7 shortVersions];
  unsigned __int8 v11 = [v10 containsObject:v9];

  if (v11)
  {
    unsigned __int8 v12 = 1;
  }
  else
  {
    v13 = [v7 shortVersions];
    if ([v13 containsObject:@"-1"])
    {
      unsigned __int8 v12 = 1;
    }
    else
    {
      id v14 = [v7 versions];
      if ([v14 containsObject:v8])
      {
        unsigned __int8 v12 = 1;
      }
      else
      {
        id v15 = [v7 versions];
        unsigned __int8 v12 = [v15 containsObject:@"-1"];
      }
    }
  }
  return v12;
}

- (void)determineGameLocationOnDeviceOrInStoreWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKGamePlayerBulletin determineGameLocationOnDeviceOrInStoreWithCompletionHandler:", buf, 2u);
  }
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameplayBulletin.m", 274, "-[GKGameplayBulletin determineGameLocationOnDeviceOrInStoreWithCompletionHandler:]");
  id v8 = +[GKDispatchGroup dispatchGroupWithName:v7];

  id v9 = +[GKClientProxy gameCenterClient];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100140890;
  v15[3] = &unk_1002D3A70;
  v15[4] = self;
  id v10 = v8;
  id v16 = v10;
  [v10 perform:v15];
  if (v4)
  {
    unsigned __int8 v11 = [v9 replyQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100140B64;
    v12[3] = &unk_1002D3930;
    id v14 = v4;
    id v13 = v10;
    [v13 notifyOnQueue:v11 block:v12];
  }
}

- (void)loadOriginatorPlayerWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKGameplayBulletin loadOriginatorPlayerWithCompletionHandler:", buf, 2u);
  }
  id v7 = +[GKClientProxy gameCenterClient];
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameplayBulletin.m", 311, "-[GKGameplayBulletin loadOriginatorPlayerWithCompletionHandler:]");
  id v9 = +[GKDispatchGroup dispatchGroupWithName:v8];

  id v10 = [(GKGameplayBulletin *)self originatorPlayer];

  if (!v10)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100140DDC;
    v15[3] = &unk_1002D3A70;
    v15[4] = self;
    id v16 = v9;
    [v16 perform:v15];

    if (!v4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v4)
  {
LABEL_7:
    unsigned __int8 v11 = [v7 replyQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100141010;
    v12[3] = &unk_1002D3930;
    id v14 = v4;
    id v13 = v9;
    [v13 notifyOnQueue:v11 block:v12];
  }
LABEL_8:
}

- (NSString)receiverPlayerID
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setReceiverPlayerID:(id)a3
{
}

- (NSString)originatorPlayerID
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setOriginatorPlayerID:(id)a3
{
}

- (GKPlayerInternal)receiverPlayer
{
  return (GKPlayerInternal *)objc_getProperty(self, a2, 184, 1);
}

- (void)setReceiverPlayer:(id)a3
{
}

- (GKPlayerInternal)originatorPlayer
{
  return (GKPlayerInternal *)objc_getProperty(self, a2, 192, 1);
}

- (void)setOriginatorPlayer:(id)a3
{
}

- (NSString)receiverGuestPlayerID
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setReceiverGuestPlayerID:(id)a3
{
}

- (NSString)originatorGuestPlayerID
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setOriginatorGuestPlayerID:(id)a3
{
}

- (GKPlayerInternal)receiverGuestPlayer
{
  return (GKPlayerInternal *)objc_getProperty(self, a2, 216, 1);
}

- (void)setReceiverGuestPlayer:(id)a3
{
}

- (GKPlayerInternal)originatorGuestPlayer
{
  return (GKPlayerInternal *)objc_getProperty(self, a2, 224, 1);
}

- (void)setOriginatorGuestPlayer:(id)a3
{
}

- (NSArray)compatibleVersions
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (void)setCompatibleVersions:(id)a3
{
}

- (NSArray)compatibleShortVersions
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setCompatibleShortVersions:(id)a3
{
}

- (unsigned)gameLocation
{
  return self->_gameLocation;
}

- (void)setGameLocation:(unsigned __int8)a3
{
  self->_gameLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compatibleShortVersions, 0);
  objc_storeStrong((id *)&self->_compatibleVersions, 0);
  objc_storeStrong((id *)&self->_originatorGuestPlayer, 0);
  objc_storeStrong((id *)&self->_receiverGuestPlayer, 0);
  objc_storeStrong((id *)&self->_originatorGuestPlayerID, 0);
  objc_storeStrong((id *)&self->_receiverGuestPlayerID, 0);
  objc_storeStrong((id *)&self->_originatorPlayer, 0);
  objc_storeStrong((id *)&self->_receiverPlayer, 0);
  objc_storeStrong((id *)&self->_originatorPlayerID, 0);

  objc_storeStrong((id *)&self->_receiverPlayerID, 0);
}

@end