@interface GKSystemBulletin
+ (void)expireCachesForBagKey:(id)a3 payload:(id)a4 context:(id)a5 group:(id)a6;
+ (void)expireCachesForBagKey:(id)a3 payload:(id)a4 context:(id)a5 profile:(id)a6 client:(id)a7 localPlayerInternal:(id)a8;
+ (void)expireFriendCodeDetails:(id)a3 payload:(id)a4 context:(id)a5;
+ (void)expireGetPerGameFriendPlayerIDsCache:(id)a3 payload:(id)a4 context:(id)a5;
+ (void)expireGetPerGameSettingsCaches:(id)a3 payload:(id)a4 context:(id)a5;
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
+ (void)presentGameCenterInviteUpdate:(id)a3 playerAlias:(id)a4;
- (void)handleAction:(id)a3;
@end

@implementation GKSystemBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKSystemBulletin loadBulletinsForPushNotification: withHandler:", buf, 2u);
  }
  v10 = +[GKDataRequestManager sharedManager];
  v11 = +[GKBulletin cacheTransactionGroup];
  id v12 = [objc_alloc((Class)a1) initWithPushNotification:v6];
  int v13 = [v12 pushCommand];
  if ((unsigned __int16)v13 <= 0xEFu)
  {
    if ((unsigned __int16)v13 == 51)
    {
      v17 = [v6 objectForKey:GKFriendRequestURLFriendCode];
      [v6 objectForKey:GKFriendRequestPushAcceptorID];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10013B33C;
      v24[3] = &unk_1002D3D30;
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      id v26 = v17;
      id v27 = v6;
      id v18 = v17;
      id v19 = v25;
      [v11 performOnManagedObjectContext:v24];

      if (!v7) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
    if ((unsigned __int16)v13 != 68) {
      goto LABEL_25;
    }
    v14 = [v6 objectForKeyedSubscript:@"game"];
    v15 = [v14 objectForKeyedSubscript:@"bundle-id"];
    v16 = v15;
    if (v14 && v15)
    {
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10013B108;
      v31[3] = &unk_1002D4078;
      id v32 = v15;
      id v33 = v14;
      [v11 performOnManagedObjectContext:v31];
    }
LABEL_19:

    if (!v7) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  switch((unsigned __int16)v13)
  {
    case 0xF0u:
      v14 = [v6 objectForKeyedSubscript:GKPushReceiverID];
      if (!+[GKBulletin playerIsLocal:v14])
      {
        if (!os_log_GKGeneral) {
          id v22 = (id)GKOSLoggers();
        }
        v23 = os_log_GKTrace;
        if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "GKSystemBulletin bulletin is not meant for current local player. Skipping.", buf, 2u);
        }
        v7[2](v7, 0);

        goto LABEL_30;
      }
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10013B1CC;
      v28[3] = &unk_1002D4078;
      id v29 = v6;
      id v30 = v11;
      [v30 performOnManagedObjectContext:v28];

      goto LABEL_19;
    case 0xFEu:
      [v10 resetEnvironment];
      if (!v7) {
        goto LABEL_30;
      }
      goto LABEL_29;
    case 0xFDu:
      [v10 clearPushEnvironment];
      if (!v7) {
        goto LABEL_30;
      }
      goto LABEL_29;
  }
LABEL_25:
  if (!os_log_GKGeneral) {
    id v20 = (id)GKOSLoggers();
  }
  v21 = os_log_GKError;
  if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
  {
    sub_10013DB04(v13, v21);
    if (!v7) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  if (v7) {
LABEL_29:
  }
    v7[2](v7, 0);
LABEL_30:
}

+ (void)presentGameCenterInviteUpdate:(id)a3 playerAlias:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v16 = [objc_alloc((Class)a1) initWithPushNotification:v7];
  id v8 = +[NSDate date];
  [v16 setDate:v8];

  v9 = +[NSDate dateWithTimeIntervalSinceNow:600.0];
  [v16 setExpirationDate:v9];

  [v16 setBulletinType:1];
  v10 = +[GCFLocalizedStrings GAME_CENTER_FRIEND_REQUEST_ACCEPTED];
  [v16 setMessage:v10];

  [v16 setHasSound:1];
  [v16 setSoundPath:0];
  v11 = +[NSDate date];
  [v16 setDate:v11];

  [v16 setTitle:v6];
  id v12 = objc_alloc_init(GKBulletinAction);
  [(GKBulletinAction *)v12 setType:2];
  int v13 = +[GCFLocalizedStrings BULLETIN_VIEW];
  [(GKBulletinAction *)v12 setTitle:v13];

  v14 = [v7 objectForKeyedSubscript:GKFriendRequestPushAcceptorID];

  [(GKBulletinAction *)v12 setInfo:v14];
  [v16 setDefaultAction:v12];
  v15 = +[GKBulletinController sharedController];
  [v15 presentBulletin:v16];
}

+ (void)expireGetPerGameSettingsCaches:(id)a3 payload:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[GKCDGameSettings _gkFetchRequest];
  if ([v7 length])
  {
    v11 = +[NSPredicate predicateWithFormat:@"bundleID == %@", v7];
    [v10 setPredicate:v11];
  }
  id v42 = 0;
  id v12 = [v9 executeFetchRequest:v10 error:&v42];
  id v13 = v42;
  if (v13)
  {
    long long v40 = 0uLL;
    long long v41 = 0uLL;
    long long v38 = 0uLL;
    long long v39 = 0uLL;
    id v14 = v12;
    id v15 = [v14 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v39;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v39 != v17) {
            objc_enumerationMutation(v14);
          }
          [v9 deleteObject:*(void *)(*((void *)&v38 + 1) + 8 * i)];
        }
        id v16 = [v14 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v16);
    }

    if (!os_log_GKGeneral) {
      id v19 = (id)GKOSLoggers();
    }
    id v20 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v13;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "expireGetPerGameSettingsCaches: Could not fetch data from cache: %@", buf, 0xCu);
    }
  }
  else
  {
    long long v36 = 0uLL;
    long long v37 = 0uLL;
    long long v34 = 0uLL;
    long long v35 = 0uLL;
    id v21 = v12;
    id v22 = [v21 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v35;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v35 != v24) {
            objc_enumerationMutation(v21);
          }
          [*(id *)(*((void *)&v34 + 1) + 8 * (void)j) setExpirationDate:0];
        }
        id v23 = [v21 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v23);
    }
  }
  uint64_t v26 = GKPushFriendsAuthorizationStatus;
  uint64_t v27 = [v8 objectForKeyedSubscript:GKPushFriendsAuthorizationStatus];
  if (v27)
  {
    v28 = (void *)v27;
    id v29 = [v8 objectForKeyedSubscript:v26];
    id v30 = [v29 integerValue];
    id v31 = (id)GKPushFriendsAuthorizationStatusRemoved;

    if (v30 == v31)
    {
      id v32 = +[GKClientProxy gameCenterClient];
      id v33 = +[GKService serviceWithTransport:0 forClient:v32 credential:0];
      [v33 resetTCCAuthorization:&stru_1002DC300];
    }
  }
}

+ (void)expireGetPerGameFriendPlayerIDsCache:(id)a3 payload:(id)a4 context:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  id v8 = +[GKCDGameFriendList _gkFetchRequest];
  if ([v6 length])
  {
    id v9 = +[NSPredicate predicateWithFormat:@"bundleID == %@", v6];
    [v8 setPredicate:v9];
  }
  id v32 = 0;
  v10 = [v7 executeFetchRequest:v8 error:&v32];
  id v11 = v32;
  if (v11)
  {
    long long v30 = 0uLL;
    long long v31 = 0uLL;
    long long v28 = 0uLL;
    long long v29 = 0uLL;
    id v12 = v10;
    id v13 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          [v7 deleteObject:*(void *)(*((void *)&v28 + 1) + 8 * i)];
        }
        id v14 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v14);
    }

    if (!os_log_GKGeneral) {
      id v17 = (id)GKOSLoggers();
    }
    id v18 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v11;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "expireGetPerGameFriendPlayerIDsCache: Could not fetch data from cache: %@", buf, 0xCu);
    }
  }
  else
  {
    long long v26 = 0uLL;
    long long v27 = 0uLL;
    long long v24 = 0uLL;
    long long v25 = 0uLL;
    id v19 = v10;
    id v20 = [v19 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v25;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v25 != v22) {
            objc_enumerationMutation(v19);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * (void)j) setExpirationDate:0];
        }
        id v21 = [v19 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v21);
    }
  }
}

+ (void)expireFriendCodeDetails:(id)a3 payload:(id)a4 context:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  id v8 = +[GKCDFriendCodeDetail _gkFetchRequest];
  if ([v6 length])
  {
    id v9 = +[NSPredicate predicateWithFormat:@"friendCode == %@", v6];
    [v8 setPredicate:v9];
  }
  id v32 = 0;
  v10 = [v7 executeFetchRequest:v8 error:&v32];
  id v11 = v32;
  if (v11)
  {
    long long v30 = 0uLL;
    long long v31 = 0uLL;
    long long v28 = 0uLL;
    long long v29 = 0uLL;
    id v12 = v10;
    id v13 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          [v7 deleteObject:*(void *)(*((void *)&v28 + 1) + 8 * i)];
        }
        id v14 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v14);
    }

    if (!os_log_GKGeneral) {
      id v17 = (id)GKOSLoggers();
    }
    id v18 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v11;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "expireGetPerGameFriendPlayerIDsCache: Could not fetch data from cache: %@", buf, 0xCu);
    }
  }
  else
  {
    long long v26 = 0uLL;
    long long v27 = 0uLL;
    long long v24 = 0uLL;
    long long v25 = 0uLL;
    id v19 = v10;
    id v20 = [v19 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v25;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v25 != v22) {
            objc_enumerationMutation(v19);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * (void)j) setExpirationDate:0];
        }
        id v21 = [v19 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v21);
    }
  }
}

+ (void)expireCachesForBagKey:(id)a3 payload:(id)a4 context:(id)a5 group:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!os_log_GKGeneral) {
    id v13 = (id)GKOSLoggers();
  }
  id v14 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "GKSystemBulletin expireCachesForKey: context:", buf, 2u);
  }
  if (!os_log_GKGeneral) {
    id v15 = (id)GKOSLoggers();
  }
  id v16 = os_log_GKCache;
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_10013DB7C((uint64_t)v9, v16);
  }
  id v17 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v17, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v18 = +[NSThread callStackSymbols];
    id v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "+[GKSystemBulletin expireCachesForBagKey:payload:context:group:]", v18);
    id v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKSystemBulletin.m"];
    id v21 = [v20 lastPathComponent];
    uint64_t v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v19, "+[GKSystemBulletin expireCachesForBagKey:payload:context:group:]", [v21 UTF8String], 251);

    +[NSException raise:@"GameKit Exception", @"%@", v22 format];
  }

  id v23 = +[GKPlayerProfileCacheObject localPlayerInManagedObjectContext:v11];
  if (v23)
  {
    long long v24 = +[GKClientProxy gameCenterClient];
    long long v25 = [v23 internalRepresentation];
    long long v26 = +[GKService serviceWithTransport:0 forClient:v24 localPlayer:v25];
    +[GKSystemBulletin expireCachesForBagKey:v9 payload:v10 context:v11 profile:v23 client:v24 localPlayerInternal:v25];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10013C188;
    v28[3] = &unk_1002D3A70;
    id v29 = v26;
    id v30 = v9;
    id v27 = v26;
    [v12 perform:v28];
  }
}

+ (void)expireCachesForBagKey:(id)a3 payload:(id)a4 context:(id)a5 profile:(id)a6 client:(id)a7 localPlayerInternal:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = +[GKService serviceWithTransport:0 forClient:v18 localPlayer:v19];
  id v21 = +[GKService serviceWithTransport:0 forClient:v18 localPlayer:v19];
  uint64_t v22 = +[GKService serviceWithTransport:0 forClient:v18 localPlayer:v19];
  v58 = +[GKService serviceWithTransport:0 forClient:v18 localPlayer:v19];
  v59 = v14;
  if ([v14 isEqualToString:GKBagKeyGetFriendIDs])
  {
    v56 = v21;
    id v23 = v15;
    [v17 invalidate];
    long long v24 = [v17 friendList];
    [v24 invalidate];

    long long v25 = [v17 friendRequestList];
    [v25 invalidate];

    uint64_t v26 = [v17 playerID];
    id v27 = (void *)v26;
    long long v28 = v58;
    if (v26)
    {
      uint64_t v65 = v26;
      id v29 = +[NSArray arrayWithObjects:&v65 count:1];
      [v58 getProfilesForPlayerIDs:v29 handler:&stru_1002DC340];
    }
    id v30 = [v17 internalRepresentation];
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_10013C978;
    v60[3] = &unk_1002DA9A0;
    id v61 = v18;
    id v62 = v19;
    [v20 getFriendsForPlayer:v30 commonFriends:0 handler:v60];

    +[GKExpiringCacheObject invalidateObjectsMatchingPredicate:0 context:v16];
    id v15 = v23;
    +[GKSystemBulletin expireGetPerGameFriendPlayerIDsCache:0 payload:v23 context:v16];
    +[GKSystemBulletin expireFriendCodeDetails:0 payload:v23 context:v16];

    id v21 = v56;
    goto LABEL_8;
  }
  if (([v14 isEqualToString:GKBagKeyGetGamesPlayed] & 1) != 0
    || [v14 isEqualToString:@"gk-get-games-played"])
  {
    [v17 expire];
    [v17 gameList];
    long long v31 = v54 = v15;
    [v31 expire];

    id v32 = +[NSPredicate predicateWithFormat:@"player = %@", v17];
    +[GKExpiringCacheObject expireObjectsMatchingPredicate:v32 context:v16];
    id v33 = [v17 playerID];
    v64 = v33;
    +[NSArray arrayWithObjects:&v64 count:1];
    id v53 = v19;
    id v34 = v18;
    id v35 = v22;
    v37 = long long v36 = v20;
    long long v28 = v58;
    [v58 getProfilesForPlayerIDs:v37 handler:&stru_1002DC360];

    id v15 = v54;
    long long v38 = [v17 internalRepresentation];
    [v21 getGamesForPlayer:v38 includeInstalled:0 handler:0];

    id v20 = v36;
    uint64_t v22 = v35;
    id v18 = v34;
    id v19 = v53;

    goto LABEL_8;
  }
  if ([v14 isEqualToString:GKBagKeyGamesFriendsPlayed])
  {
    [v22 expireGamesFriendsPlayed];
LABEL_18:
    long long v28 = v58;
    goto LABEL_8;
  }
  if ([v14 isEqualToString:@"gk-get-player-achievements"])
  {
    [v17 expire];
    [v17 gameRecords];
    long long v39 = v57 = v20;
    [v39 makeObjectsPerformSelector:"expire"];

    v55 = +[NSPredicate predicateWithFormat:@"player == %@", a1];
    +[GKExpiringCacheObject expireObjectsMatchingPredicate:v55 context:v16];
    [v17 playerID];
    long long v40 = v22;
    v42 = id v41 = v15;
    v63 = v42;
    v43 = +[NSArray arrayWithObjects:&v63 count:1];
    [v58 getProfilesForPlayerIDs:v43 handler:&stru_1002DC380];

    id v15 = v41;
    uint64_t v22 = v40;
    long long v28 = v58;

    id v20 = v57;
    goto LABEL_8;
  }
  if ([v14 isEqualToString:GKBagKeyGetPerGameSettings])
  {
    [v15 objectForKeyedSubscript:GKInviteGameIDKey];
    v44 = v22;
    v46 = id v45 = v20;
    +[GKSystemBulletin expireGetPerGameSettingsCaches:v46 payload:v15 context:v16];
LABEL_17:

    id v20 = v45;
    uint64_t v22 = v44;
    goto LABEL_18;
  }
  if ([v14 isEqualToString:GKBagKeyGetPerGameFriendPlayerIDs])
  {
    [v15 objectForKeyedSubscript:GKInviteGameIDKey];
    v44 = v22;
    v46 = id v45 = v20;
    +[GKSystemBulletin expireGetPerGameFriendPlayerIDsCache:v46 payload:v15 context:v16];
    goto LABEL_17;
  }
  long long v28 = v58;
  if ([v59 isEqualToString:GKBagKeyGetFriendInvitationMailbox])
  {
    [v17 invalidate];
    [v17 friendList];
    v47 = v22;
    id v48 = v15;
    v50 = v49 = v20;
    [v50 invalidate];

    v51 = [v17 friendRequestList];
    [v51 invalidate];

    v52 = +[GKService serviceWithTransport:0 forClient:v18 localPlayer:v19];
    [v52 sendRefreshContentsForDataTypeToAllClientProxy:3];

    id v20 = v49;
    id v15 = v48;
    uint64_t v22 = v47;
  }
LABEL_8:
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
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKSystemBulletin handleAction: %@", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)GKSystemBulletin;
  [(GKBulletin *)&v7 handleAction:v4];
}

@end