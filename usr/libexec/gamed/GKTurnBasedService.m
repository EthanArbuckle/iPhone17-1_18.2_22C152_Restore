@interface GKTurnBasedService
+ (Class)interfaceClass;
+ (unint64_t)requiredEntitlements;
- (id)_requestForTurnBasedSubmitValues:(id)a3 withServerLabel:(id)a4 sessionID:(id)a5;
- (id)privateDatabase;
- (id)turnsForParticipantIndexes:(id)a3 turnTimeout:(double)a4;
- (void)_determineCompatibleBundleIDForAppID:(id)a3 bundleVersion:(id)a4 shortBundleVersion:(id)a5 platform:(id)a6 withCompletionHandler:(id)a7;
- (void)_determineCompatibleGamesForMatches:(id)a3 dispatchGroup:(id)a4;
- (void)_determineTurnBasedBadgeCountFromList:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)_updateGamesForTurnBasedMatches:(id)a3 dispatchGroup:(id)a4;
- (void)_updatePlayersForMatches:(id)a3 group:(id)a4;
- (void)acceptInviteForTurnBasedMatch:(id)a3 handler:(id)a4;
- (void)cancelExchange:(id)a3 withMessage:(id)a4 match:(id)a5 handler:(id)a6;
- (void)completeTurnBasedMatch:(id)a3 scores:(id)a4 achievements:(id)a5 handler:(id)a6;
- (void)createTurnBasedGameForMatchRequest:(id)a3 individualMessages:(id)a4 handler:(id)a5;
- (void)declineInviteForTurnBasedMatch:(id)a3 handler:(id)a4;
- (void)fetchDetailsForTurnBasedMatchIDs:(id)a3 includeGameData:(BOOL)a4 responseKind:(int)a5 context:(id)a6 handler:(id)a7;
- (void)fetchTurnBasedMatchesForGame:(id)a3 context:(id)a4 handler:(id)a5;
- (void)getDetailsForTurnBasedMatchIDs:(id)a3 includeGameData:(BOOL)a4 handler:(id)a5;
- (void)getDetailsForTurnBasedMatchIDs:(id)a3 includeGameData:(BOOL)a4 prefetchOnly:(BOOL)a5 handler:(id)a6;
- (void)getNextTurnBasedEventWithHandler:(id)a3;
- (void)getTurnBasedMatchesAndCompatibleBundleID:(BOOL)a3 handler:(id)a4;
- (void)getTurnBasedMatchesWithHandler:(id)a3;
- (void)loadDetailsForTurnBasedMatchIDs:(id)a3 includeGameData:(BOOL)a4 context:(id)a5 handler:(id)a6;
- (void)loadTurnBasedMatchesForGame:(id)a3 loadDetails:(BOOL)a4 prefetchOnly:(BOOL)a5 context:(id)a6 handler:(id)a7;
- (void)loadURLWithTBGMatch:(id)a3 player:(id)a4 matchRequest:(id)a5 handler:(id)a6;
- (void)removeTurnBasedMatch:(id)a3 handler:(id)a4;
- (void)replyToExchange:(id)a3 withMessage:(id)a4 data:(id)a5 match:(id)a6 handler:(id)a7;
- (void)reserveShareParticipantSlots:(int64_t)a3 minPlayerCount:(int64_t)a4 maxPlayerCount:(int64_t)a5 andInvitePlayers:(id)a6 withMessage:(id)a7 forMatch:(id)a8 handler:(id)a9;
- (void)resignFromTurnBasedGame:(id)a3 outcome:(unint64_t)a4 handler:(id)a5;
- (void)saveDataForTurnBasedMatch:(id)a3 resolvedExchangeIDs:(id)a4 handler:(id)a5;
- (void)saveRecord:(id)a3 withHandler:(id)a4;
- (void)sendExchangeToParticipants:(id)a3 data:(id)a4 message:(id)a5 timeout:(double)a6 match:(id)a7 handler:(id)a8;
- (void)sendReminderToParticipants:(id)a3 message:(id)a4 match:(id)a5 handler:(id)a6;
- (void)sendRequest:(id)a3 forBagKey:(id)a4 exchange:(id)a5 matchID:(id)a6 responseHandler:(id)a7;
- (void)submitTurnForTurnBasedMatch:(id)a3 nextParticipantIndexes:(id)a4 turnTimeout:(double)a5 handler:(id)a6;
@end

@implementation GKTurnBasedService

+ (unint64_t)requiredEntitlements
{
  return 256;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class();
}

- (void)getTurnBasedMatchesWithHandler:(id)a3
{
}

- (id)turnsForParticipantIndexes:(id)a3 turnTimeout:(double)a4
{
  id v5 = a3;
  v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v20[1] = @"turn-timeout";
        v21[0] = v11;
        v20[0] = @"next-turn-on-slot";
        v12 = +[NSNumber _gkServerTimeInterval:a4];
        v21[1] = v12;
        v13 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
        [v6 addObject:v13];
      }
      id v8 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v8);
  }

  return v6;
}

- (void)createTurnBasedGameForMatchRequest:(id)a3 individualMessages:(id)a4 handler:(id)a5
{
  id v7 = a3;
  id v56 = a4;
  id v52 = a5;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  uint64_t v9 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v89 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "TBGame - createTurnBasedGameForMatchRequest, matchRequest = %@", buf, 0xCu);
  }
  v57 = +[NSMutableArray array];
  v10 = [v7 recipients];
  id v11 = [v10 count];

  v54 = v7;
  if (v11)
  {
    long long v72 = 0uLL;
    long long v73 = 0uLL;
    long long v70 = 0uLL;
    long long v71 = 0uLL;
    id obj = [v7 recipients];
    id v12 = [obj countByEnumeratingWithState:&v70 objects:v87 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v71;
      v15 = &GKInfoPlistKeyFriendsAPIUsageDescription_ptr;
      do
      {
        long long v16 = 0;
        do
        {
          if (*(void *)v71 != v14) {
            objc_enumerationMutation(obj);
          }
          long long v17 = *(void **)(*((void *)&v70 + 1) + 8 * (void)v16);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v85[0] = @"player-id";
            id v18 = v17;
            long long v19 = [v18 hostPlayerInternal];
            v20 = [v19 playerID];
            v86[0] = v20;
            v85[1] = @"guest-id";
            [v18 guestIdentifier];
            v22 = v21 = v15;
            v86[1] = v22;
            v23 = +[NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:2];

            v15 = v21;
LABEL_16:

            goto LABEL_17;
          }
          long long v19 = [v17 playerID];
          id v18 = [v56 objectForKeyedSubscript:v19];
          if (v18 || ([v54 inviteMessage], (id v18 = (id)objc_claimAutoreleasedReturnValue()) != 0))
          {
            v83[0] = @"player-id";
            v83[1] = @"invite-message";
            v84[0] = v19;
            v84[1] = v18;
            v23 = +[NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:2];
            goto LABEL_16;
          }
          CFStringRef v81 = @"player-id";
          v82 = v19;
          v23 = +[NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
LABEL_17:

          [v57 addObject:v23];
          long long v16 = (char *)v16 + 1;
        }
        while (v13 != v16);
        id v24 = [obj countByEnumeratingWithState:&v70 objects:v87 count:16];
        id v13 = v24;
      }
      while (v24);
    }
  }
  else
  {
    long long v68 = 0uLL;
    long long v69 = 0uLL;
    long long v66 = 0uLL;
    long long v67 = 0uLL;
    id obj = [v7 recipientPlayerIDs];
    id v25 = [obj countByEnumeratingWithState:&v66 objects:v80 count:16];
    if (v25)
    {
      id v26 = v25;
      v27 = v7;
      uint64_t v28 = *(void *)v67;
      do
      {
        v29 = 0;
        do
        {
          if (*(void *)v67 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v30 = *(void *)(*((void *)&v66 + 1) + 8 * (void)v29);
          v31 = [v56 objectForKeyedSubscript:v30];
          if (v31 || ([v27 inviteMessage], (v31 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v78[0] = @"player-id";
            v78[1] = @"invite-message";
            v79[0] = v30;
            v79[1] = v31;
            v32 = +[NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:2];
          }
          else
          {
            CFStringRef v76 = @"player-id";
            uint64_t v77 = v30;
            v32 = +[NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
          }
          [v57 addObject:v32];

          v29 = (char *)v29 + 1;
        }
        while (v26 != v29);
        id v33 = [obj countByEnumeratingWithState:&v66 objects:v80 count:16];
        id v26 = v33;
      }
      while (v33);
    }
  }

  v74[0] = @"bucket-id";
  v34 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v54 playerGroup]);
  v75[0] = v34;
  v74[1] = @"min-players";
  v35 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v54 maxPlayers]);
  v75[1] = v35;
  v74[2] = @"max-players";
  v36 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v54 maxPlayers]);
  v75[2] = v36;
  v74[3] = @"player-attributes";
  unsigned int v37 = [v54 playerAttributes];
  if (v37) {
    uint64_t v38 = v37;
  }
  else {
    uint64_t v38 = 0xFFFFFFFFLL;
  }
  v39 = +[NSString stringWithFormat:@"%#.8x", v38];
  v74[4] = @"invites";
  v75[3] = v39;
  v75[4] = v57;
  v40 = +[NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:5];
  v41 = +[NSMutableDictionary dictionaryWithDictionary:v40];

  if ([v54 isPreloadedMatch]) {
    [v41 setObject:&off_1002F2030 forKeyedSubscript:@"can-match-existing-session"];
  }
  v42 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedService.m", 151, "-[GKTurnBasedService createTurnBasedGameForMatchRequest:individualMessages:handler:]");
  v43 = [(GKService *)self transactionGroupWithName:v42];

  v44 = [(GKService *)self clientProxy];
  v45 = [v44 replyQueue];
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_10009D10C;
  v62[3] = &unk_1002D3980;
  id v46 = v43;
  id v63 = v46;
  v64 = self;
  id v65 = v41;
  id v47 = v41;
  [v46 performOnQueue:v45 block:v62];

  v48 = [(GKService *)self clientProxy];
  v49 = [v48 replyQueue];
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_10009D478;
  v58[3] = &unk_1002D3A48;
  id v59 = v46;
  v60 = self;
  id v61 = v52;
  id v50 = v52;
  id v51 = v46;
  [v51 notifyOnQueue:v49 block:v58];
}

- (void)_updateGamesForTurnBasedMatches:(id)a3 dispatchGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    [v6 _gkDistinctValuesForKeyPath:@"bundleID"];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10009DA84;
    v9[3] = &unk_1002D3980;
    v9[4] = self;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = v6;
    id v8 = v10;
    [v7 perform:v9];
  }
}

- (void)_determineCompatibleGamesForMatches:(id)a3 dispatchGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 count];
  if (v8)
  {
    id v9 = v8;
    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedService.m", 224, "-[GKTurnBasedService _determineCompatibleGamesForMatches:dispatchGroup:]");
    id v11 = +[GKDispatchGroup dispatchGroupWithName:v10];

    id v12 = +[NSMutableDictionary dictionaryWithCapacity:v9];
    id v13 = +[NSMutableDictionary dictionaryWithCapacity:v9];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10009E098;
    v45[3] = &unk_1002D8498;
    id v14 = v12;
    id v46 = v14;
    id v48 = v9;
    id v15 = v13;
    id v47 = v15;
    id v25 = v6;
    [v6 enumerateObjectsUsingBlock:v45];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v14;
    id v27 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v27)
    {
      uint64_t v26 = *(void *)v42;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v42 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = v16;
          uint64_t v17 = *(void *)(*((void *)&v41 + 1) + 8 * v16);
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v18 = [obj objectForKeyedSubscript:v17];
          id v19 = [v18 countByEnumeratingWithState:&v37 objects:v49 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v38;
            do
            {
              for (i = 0; i != v20; i = (char *)i + 1)
              {
                if (*(void *)v38 != v21) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v23 = *(void *)(*((void *)&v37 + 1) + 8 * i);
                v35[0] = _NSConcreteStackBlock;
                v35[1] = 3221225472;
                v35[2] = sub_10009E38C;
                v35[3] = &unk_1002D48B0;
                v35[4] = self;
                v35[5] = v17;
                v35[6] = v23;
                id v36 = v15;
                [v11 perform:v35];
              }
              id v20 = [v18 countByEnumeratingWithState:&v37 objects:v49 count:16];
            }
            while (v20);
          }

          uint64_t v16 = v29 + 1;
        }
        while ((id)(v29 + 1) != v27);
        id v27 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
      }
      while (v27);
    }

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10009E6BC;
    v30[3] = &unk_1002D48B0;
    id v31 = v11;
    v32 = self;
    id v6 = v25;
    id v33 = v25;
    id v34 = v7;
    id v24 = v11;
    [v34 perform:v30];
  }
}

- (void)_determineCompatibleBundleIDForAppID:(id)a3 bundleVersion:(id)a4 shortBundleVersion:(id)a5 platform:(id)a6 withCompletionHandler:(id)a7
{
  id v12 = a3;
  unint64_t v13 = (unint64_t)a4;
  unint64_t v14 = (unint64_t)a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedService.m", 296, "-[GKTurnBasedService _determineCompatibleBundleIDForAppID:bundleVersion:shortBundleVersion:platform:withCompletionHandler:]");
  id v18 = +[GKDispatchGroup dispatchGroupWithName:v17];

  [v18 setObject:v12 forKeyedSubscript:@"bundleID"];
  [v18 setObject:v13 forKeyedSubscript:@"bundleVersion"];
  [v18 setObject:v14 forKeyedSubscript:@"shortBundleVersion"];
  [v18 setObject:v15 forKeyedSubscript:@"platform"];
  if (v12 && v13 | v14)
  {
    v33[0] = @"bundle-id";
    v33[1] = @"bundle-version";
    v34[0] = v12;
    v34[1] = v13;
    id v19 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    id v20 = +[NSMutableDictionary dictionaryWithDictionary:v19];

    if (v14) {
      [v20 setObject:v14 forKeyedSubscript:@"short-bundle-version"];
    }
    id v21 = [v15 integerValue];
    if (v21)
    {
      v22 = +[GKGameDescriptor stringForPlatform:v21];
      [v20 setObject:v22 forKeyedSubscript:@"platform"];
    }
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10009EB44;
    v29[3] = &unk_1002D48B0;
    v29[4] = self;
    id v30 = v20;
    id v31 = v12;
    id v32 = v18;
    id v23 = v20;
    [v32 perform:v29];
  }
  if (v16)
  {
    id v24 = [(GKService *)self clientProxy];
    id v25 = [v24 replyQueue];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10009F018;
    v26[3] = &unk_1002D3930;
    id v28 = v16;
    id v27 = v18;
    [v27 notifyOnQueue:v25 block:v26];
  }
}

- (void)_determineTurnBasedBadgeCountFromList:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10009F1C4;
  v12[3] = &unk_1002D39F8;
  id v13 = a4;
  id v14 = v8;
  id v15 = self;
  id v16 = a5;
  id v9 = v16;
  id v10 = v8;
  id v11 = v13;
  [v11 performBlock:v12];
}

- (void)loadTurnBasedMatchesForGame:(id)a3 loadDetails:(BOOL)a4 prefetchOnly:(BOOL)a5 context:(id)a6 handler:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a7;
  id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedService.m", 416, "-[GKTurnBasedService loadTurnBasedMatchesForGame:loadDetails:prefetchOnly:context:handler:]");
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10009F680;
  v17[3] = &unk_1002D39F8;
  id v18 = v11;
  id v19 = self;
  id v20 = v10;
  id v21 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  +[GKActivity named:v13 execute:v17];
}

- (void)fetchTurnBasedMatchesForGame:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedService.m", 469, "-[GKTurnBasedService fetchTurnBasedMatchesForGame:context:handler:]");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10009FFB4;
  v15[3] = &unk_1002D39F8;
  id v16 = v9;
  uint64_t v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  +[GKActivity named:v11 execute:v15];
}

- (void)getTurnBasedMatchesAndCompatibleBundleID:(BOOL)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedService.m", 502, "-[GKTurnBasedService getTurnBasedMatchesAndCompatibleBundleID:handler:]");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000A05BC;
  v9[3] = &unk_1002D8650;
  v9[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  +[GKActivity named:v7 execute:v9];
}

- (void)_updatePlayersForMatches:(id)a3 group:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A154C;
  v7[3] = &unk_1002D3A70;
  id v8 = a3;
  id v9 = self;
  id v6 = v8;
  [a4 perform:v7];
}

- (void)fetchDetailsForTurnBasedMatchIDs:(id)a3 includeGameData:(BOOL)a4 responseKind:(int)a5 context:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedService.m", 640, "-[GKTurnBasedService fetchDetailsForTurnBasedMatchIDs:includeGameData:responseKind:context:handler:]");
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000A1E1C;
  v19[3] = &unk_1002D8768;
  id v20 = v13;
  id v21 = self;
  int v24 = a5;
  BOOL v25 = a4;
  id v22 = v12;
  id v23 = v14;
  id v16 = v14;
  id v17 = v12;
  id v18 = v13;
  +[GKActivity named:v15 execute:v19];
}

- (void)loadDetailsForTurnBasedMatchIDs:(id)a3 includeGameData:(BOOL)a4 context:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedService.m", 706, "-[GKTurnBasedService loadDetailsForTurnBasedMatchIDs:includeGameData:context:handler:]");
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000A26D8;
  v17[3] = &unk_1002D4560;
  id v18 = v11;
  id v19 = self;
  BOOL v22 = a4;
  id v20 = v10;
  id v21 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  +[GKActivity named:v13 execute:v17];
}

- (void)getDetailsForTurnBasedMatchIDs:(id)a3 includeGameData:(BOOL)a4 prefetchOnly:(BOOL)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedService.m", 772, "-[GKTurnBasedService getDetailsForTurnBasedMatchIDs:includeGameData:prefetchOnly:handler:]");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000A3134;
  v15[3] = &unk_1002D88A0;
  id v16 = v10;
  id v17 = v11;
  BOOL v18 = a5;
  void v15[4] = self;
  BOOL v19 = a4;
  id v13 = v10;
  id v14 = v11;
  +[GKActivity named:v12 execute:v15];
}

- (void)getDetailsForTurnBasedMatchIDs:(id)a3 includeGameData:(BOOL)a4 handler:(id)a5
{
}

- (void)acceptInviteForTurnBasedMatch:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[GKDataRequestManager sharedManager];
  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedService.m", 833, "-[GKTurnBasedService acceptInviteForTurnBasedMatch:handler:]");
  id v10 = [(GKService *)self transactionGroupWithName:v9];

  id v11 = [v6 matchID];
  id v12 = &off_10024F000;
  if (v11)
  {
    v35 = v10;
    id v38 = v7;
    long long v37 = v8;
    id v13 = +[GKBulletinController sharedController];
    [v13 clearTurnBasedBulletinsForMatchID:v11];

    id v36 = self;
    id v14 = [(GKService *)self transport];
    id v15 = [v14 credential];
    id v16 = [v15 playerInternal];
    id v17 = [v16 playerID];

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v18 = [v6 participants];
    id v19 = [v18 countByEnumeratingWithState:&v50 objects:v54 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v51;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v51 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          int v24 = [v23 playerID];
          if ([v24 isEqualToString:v17])
          {
            BOOL v25 = [v23 status];
            unsigned int v26 = [v25 isEqualToString:@"Invited"];

            if (!v26)
            {
              id v8 = v37;
              id v10 = v35;
              self = v36;
              goto LABEL_15;
            }
          }
          else
          {
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v50 objects:v54 count:16];
      }
      while (v20);
    }

    self = v36;
    id v27 = [(GKService *)v36 clientProxy];
    id v28 = [v27 replyQueue];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1000A3ED0;
    v44[3] = &unk_1002D4518;
    id v10 = v35;
    id v45 = v35;
    id v46 = v11;
    id v47 = v6;
    id v8 = v37;
    id v48 = v37;
    v49 = v36;
    [v45 performOnQueue:v28 block:v44];

    id v18 = v45;
LABEL_15:

    id v7 = v38;
    id v12 = &off_10024F000;
  }
  else
  {
    uint64_t v29 = +[NSError userErrorForCode:17 underlyingError:0];
    [v10 setError:v29];
  }
  id v30 = [(GKService *)self clientProxy];
  id v31 = [v30 replyQueue];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = *((void *)v12 + 46);
  v39[2] = sub_1000A42E8;
  v39[3] = &unk_1002D39F8;
  id v40 = v11;
  id v41 = v10;
  long long v42 = self;
  id v43 = v7;
  id v32 = v7;
  id v33 = v10;
  id v34 = v11;
  [v33 notifyOnQueue:v31 block:v39];
}

- (void)declineInviteForTurnBasedMatch:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[GKDataRequestManager sharedManager];
  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedService.m", 926, "-[GKTurnBasedService declineInviteForTurnBasedMatch:handler:]");
  id v10 = [(GKService *)self transactionGroupWithName:v9];

  id v11 = [v6 matchID];
  if (v11)
  {
    id v12 = +[GKBulletinController sharedController];
    [v12 clearTurnBasedBulletinsForMatchID:v11];

    id v13 = [(GKService *)self clientProxy];
    id v14 = [v13 replyQueue];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000A4C90;
    v26[3] = &unk_1002D4518;
    id v27 = v10;
    id v28 = v11;
    id v29 = v6;
    id v30 = v8;
    id v31 = self;
    [v27 performOnQueue:v14 block:v26];
  }
  else
  {
    id v15 = +[NSError userErrorForCode:17 underlyingError:0];
    [v10 setError:v15];
  }
  id v16 = [(GKService *)self clientProxy];
  id v17 = [v16 replyQueue];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  void v21[2] = sub_1000A50DC;
  v21[3] = &unk_1002D39F8;
  id v22 = v11;
  id v23 = v10;
  int v24 = self;
  id v25 = v7;
  id v18 = v7;
  id v19 = v10;
  id v20 = v11;
  [v19 notifyOnQueue:v17 block:v21];
}

- (void)removeTurnBasedMatch:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[GKDataRequestManager sharedManager];
  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedService.m", 989, "-[GKTurnBasedService removeTurnBasedMatch:handler:]");
  id v10 = [(GKService *)self transactionGroupWithName:v9];

  id v11 = [v7 matchID];

  if (v11)
  {
    id v12 = +[GKBulletinController sharedController];
    [v12 clearTurnBasedBulletinsForMatchID:v11];

    id v13 = [(GKService *)self clientProxy];
    id v14 = [v13 replyQueue];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000A5844;
    v26[3] = &unk_1002D48B0;
    id v27 = v10;
    id v28 = v11;
    id v29 = v8;
    id v30 = self;
    [v27 performOnQueue:v14 block:v26];
  }
  else
  {
    id v15 = +[NSError userErrorForCode:17 underlyingError:0];
    [v10 setError:v15];
  }
  id v16 = [(GKService *)self clientProxy];
  id v17 = [v16 replyQueue];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  void v21[2] = sub_1000A5BE8;
  v21[3] = &unk_1002D39F8;
  id v22 = v11;
  id v23 = v10;
  int v24 = self;
  id v25 = v6;
  id v18 = v6;
  id v19 = v10;
  id v20 = v11;
  [v19 notifyOnQueue:v17 block:v21];
}

- (void)submitTurnForTurnBasedMatch:(id)a3 nextParticipantIndexes:(id)a4 turnTimeout:(double)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = +[GKDataRequestManager sharedManager];
  id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedService.m", 1042, "-[GKTurnBasedService submitTurnForTurnBasedMatch:nextParticipantIndexes:turnTimeout:handler:]");
  id v15 = [(GKService *)self transactionGroupWithName:v14];

  id v16 = [v10 matchID];
  id v17 = &off_10024F000;
  if (v16)
  {
    id v18 = +[GKBulletinController sharedController];
    [v18 clearTurnBasedBulletinsForMatchID:v16];

    id v19 = [(GKService *)self clientProxy];
    id v20 = [v19 replyQueue];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000A612C;
    v32[3] = &unk_1002D7E58;
    id v33 = v15;
    id v34 = v16;
    id v35 = v10;
    id v36 = self;
    id v37 = v11;
    double v39 = a5;
    id v38 = v13;
    id v17 = &off_10024F000;
    [v33 performOnQueue:v20 block:v32];
  }
  else
  {
    uint64_t v21 = +[NSError userErrorForCode:17 underlyingError:0];
    [v15 setError:v21];
  }
  id v22 = [(GKService *)self clientProxy];
  id v23 = [v22 replyQueue];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = *((void *)v17 + 46);
  v27[2] = sub_1000A664C;
  v27[3] = &unk_1002D39F8;
  id v28 = v16;
  id v29 = v15;
  id v30 = self;
  id v31 = v12;
  id v24 = v12;
  id v25 = v15;
  id v26 = v16;
  [v25 notifyOnQueue:v23 block:v27];
}

- (void)saveDataForTurnBasedMatch:(id)a3 resolvedExchangeIDs:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[GKDataRequestManager sharedManager];
  id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedService.m", 1117, "-[GKTurnBasedService saveDataForTurnBasedMatch:resolvedExchangeIDs:handler:]");
  id v13 = [(GKService *)self transactionGroupWithName:v12];

  id v14 = [v8 matchID];
  id v15 = &off_10024F000;
  if (v14)
  {
    id v16 = +[GKBulletinController sharedController];
    [v16 clearTurnBasedBulletinsForMatchID:v14];

    id v17 = [(GKService *)self clientProxy];
    id v18 = [v17 replyQueue];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000A6DE4;
    v30[3] = &unk_1002D6E50;
    id v31 = v13;
    id v32 = v14;
    id v33 = v8;
    id v34 = v9;
    id v35 = v11;
    id v36 = self;
    id v15 = &off_10024F000;
    [v31 performOnQueue:v18 block:v30];
  }
  else
  {
    id v19 = +[NSError userErrorForCode:17 underlyingError:0];
    [v13 setError:v19];
  }
  id v20 = [(GKService *)self clientProxy];
  uint64_t v21 = [v20 replyQueue];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = *((void *)v15 + 46);
  v25[2] = sub_1000A72AC;
  v25[3] = &unk_1002D39F8;
  id v26 = v14;
  id v27 = v13;
  id v28 = self;
  id v29 = v10;
  id v22 = v10;
  id v23 = v13;
  id v24 = v14;
  [v23 notifyOnQueue:v21 block:v25];
}

- (void)resignFromTurnBasedGame:(id)a3 outcome:(unint64_t)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = +[GKDataRequestManager sharedManager];
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedService.m", 1177, "-[GKTurnBasedService resignFromTurnBasedGame:outcome:handler:]");
  id v12 = [(GKService *)self transactionGroupWithName:v11];

  id v13 = [v9 matchID];

  if (v13)
  {
    id v14 = [(GKService *)self clientProxy];
    id v15 = [v14 replyQueue];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000A78FC;
    v27[3] = &unk_1002D7580;
    id v28 = v12;
    id v29 = v13;
    id v31 = self;
    unint64_t v32 = a4;
    id v30 = v10;
    [v28 performOnQueue:v15 block:v27];
  }
  else
  {
    id v16 = +[NSError userErrorForCode:17 underlyingError:0];
    [v12 setError:v16];
  }
  id v17 = [(GKService *)self clientProxy];
  id v18 = [v17 replyQueue];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000A7CAC;
  v22[3] = &unk_1002D39F8;
  id v23 = v13;
  id v24 = v12;
  id v25 = self;
  id v26 = v8;
  id v19 = v8;
  id v20 = v12;
  id v21 = v13;
  [v20 notifyOnQueue:v18 block:v22];
}

- (id)_requestForTurnBasedSubmitValues:(id)a3 withServerLabel:(id)a4 sessionID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v25 = a5;
  id v9 = +[NSMutableDictionary dictionary];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v16 = [v15 playerID];
        if (v16)
        {
          id v17 = [v9 objectForKeyedSubscript:v16];
          if (!v17)
          {
            id v17 = +[NSMutableDictionary dictionary];
            [v17 setObject:v16 forKeyedSubscript:@"player-id"];
            id v18 = +[NSMutableArray array];
            [v17 setObject:v18 forKeyedSubscript:v8];

            [v9 setObject:v17 forKeyedSubscript:v16];
          }
          id v19 = [v17 objectForKeyedSubscript:v8];
          id v20 = [v15 serverRepresentation];
          [v19 addObject:v20];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v12);
  }

  if ([v9 count])
  {
    id v21 = v25;
    v30[0] = @"session-id";
    v30[1] = @"players";
    v31[0] = v25;
    id v22 = [v9 allValues];
    v31[1] = v22;
    id v23 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
  }
  else
  {
    id v23 = 0;
    id v21 = v25;
  }

  return v23;
}

- (void)completeTurnBasedMatch:(id)a3 scores:(id)a4 achievements:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[GKDataRequestManager sharedManager];
  id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedService.m", 1260, "-[GKTurnBasedService completeTurnBasedMatch:scores:achievements:handler:]");
  id v16 = [(GKService *)self transactionGroupWithName:v15];

  id v17 = [v10 matchID];
  if (v17)
  {
    id v18 = +[GKBulletinController sharedController];
    [v18 clearTurnBasedBulletinsForMatchID:v17];

    id v19 = [(GKService *)self clientProxy];
    [v19 replyQueue];
    id v33 = v13;
    id v20 = v12;
    id v21 = v11;
    id v22 = v10;
    id v24 = v23 = v14;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1000A870C;
    v41[3] = &unk_1002D4518;
    id v42 = v16;
    id v43 = v17;
    id v44 = v22;
    id v45 = v23;
    id v46 = self;
    [v42 performOnQueue:v24 block:v41];

    id v14 = v23;
    id v10 = v22;
    id v11 = v21;
    id v12 = v20;
    id v13 = v33;
  }
  else
  {
    id v25 = +[NSError userErrorForCode:17 underlyingError:0];
    [v16 setError:v25];
  }
  long long v26 = [(GKService *)self clientProxy];
  long long v27 = [v26 replyQueue];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  void v34[2] = sub_1000A8C10;
  v34[3] = &unk_1002D6CE8;
  id v35 = v17;
  id v36 = self;
  id v37 = v16;
  id v38 = v11;
  id v39 = v12;
  id v40 = v13;
  id v28 = v13;
  id v29 = v12;
  id v30 = v11;
  id v31 = v16;
  id v32 = v17;
  [v31 notifyOnQueue:v27 block:v34];
}

- (void)sendExchangeToParticipants:(id)a3 data:(id)a4 message:(id)a5 timeout:(double)a6 match:(id)a7 handler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v38 = a8;
  id v18 = [v17 matchID];
  id v19 = +[GKDataRequestManager sharedManager];
  id v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedService.m", 1361, "-[GKTurnBasedService sendExchangeToParticipants:data:message:timeout:match:handler:]");
  id v21 = [(GKService *)self transactionGroupWithName:v20];

  id v22 = [v21 context];
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_1000A994C;
  v53[3] = &unk_1002D3B38;
  id v23 = v18;
  id v54 = v23;
  id v24 = v21;
  id v55 = v24;
  [v22 performBlockAndWait:v53];

  id v25 = [(GKService *)self clientProxy];
  long long v26 = [v25 replyQueue];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1000A99F8;
  v44[3] = &unk_1002D6C20;
  id v45 = v17;
  id v46 = v14;
  double v52 = a6;
  id v47 = v16;
  id v48 = v15;
  id v49 = v19;
  long long v50 = self;
  id v27 = v24;
  id v51 = v27;
  id v37 = v19;
  id v28 = v15;
  id v29 = v16;
  id v30 = v14;
  id v31 = v17;
  [v27 performOnQueue:v26 block:v44];

  id v32 = [(GKService *)self clientProxy];
  id v33 = [v32 replyQueue];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000A9C98;
  v39[3] = &unk_1002D39F8;
  id v40 = v27;
  id v41 = v23;
  id v42 = self;
  id v43 = v38;
  id v34 = v38;
  id v35 = v23;
  id v36 = v27;
  [v36 notifyOnQueue:v33 block:v39];
}

- (void)sendRequest:(id)a3 forBagKey:(id)a4 exchange:(id)a5 matchID:(id)a6 responseHandler:(id)a7
{
  id v27 = a3;
  id v26 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = +[GKDataRequestManager sharedManager];
  id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedService.m", 1417, "-[GKTurnBasedService sendRequest:forBagKey:exchange:matchID:responseHandler:]");
  id v17 = [(GKService *)self transactionGroupWithName:v16];

  if (v13)
  {
    id v18 = [(GKService *)self clientProxy];
    id v19 = [v18 replyQueue];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    void v34[2] = sub_1000AA498;
    v34[3] = &unk_1002D6E50;
    id v35 = v17;
    id v36 = v13;
    id v37 = v15;
    id v38 = v27;
    id v39 = v26;
    id v40 = self;
    [v35 performOnQueue:v19 block:v34];
  }
  id v20 = [(GKService *)self clientProxy];
  id v21 = [v20 replyQueue];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000AA718;
  v28[3] = &unk_1002D39A8;
  id v29 = v13;
  id v30 = v17;
  id v31 = self;
  id v32 = v12;
  id v33 = v14;
  id v22 = v14;
  id v23 = v12;
  id v24 = v17;
  id v25 = v13;
  [v24 notifyOnQueue:v21 block:v28];
}

- (void)cancelExchange:(id)a3 withMessage:(id)a4 match:(id)a5 handler:(id)a6
{
  v17[0] = @"session-id";
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v11 matchID];
  v18[0] = v14;
  v18[1] = v13;
  v17[1] = @"request-id";
  v17[2] = @"notification-message";
  v18[2] = v12;
  id v15 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

  id v16 = [v11 matchID];

  [(GKTurnBasedService *)self sendRequest:v15 forBagKey:@"gk-tb-cancel-request" exchange:v13 matchID:v16 responseHandler:v10];
}

- (void)replyToExchange:(id)a3 withMessage:(id)a4 data:(id)a5 match:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v21[0] = @"session-id";
  id v15 = a7;
  id v16 = a6;
  id v17 = [v16 matchID];
  v22[0] = v17;
  v22[1] = v12;
  v21[1] = @"request-id";
  void v21[2] = @"notification-message";
  v22[2] = v13;
  v21[3] = @"data";
  id v18 = v14;
  if (!v14)
  {
    id v18 = +[NSData data];
  }
  v22[3] = v18;
  id v19 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
  if (!v14) {

  }
  id v20 = [v16 matchID];

  [(GKTurnBasedService *)self sendRequest:v19 forBagKey:@"gk-tb-send-reply" exchange:v12 matchID:v20 responseHandler:v15];
}

- (void)getNextTurnBasedEventWithHandler:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    LOWORD(v21) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "getNextTurnBasedEventWithHandler called", (uint8_t *)&v21, 2u);
  }
  id v7 = [(GKService *)self clientProxy];
  id v8 = [v7 gameDescriptor];

  id v9 = +[GKBulletinController sharedController];
  id v10 = [v9 acceptedInviteManager];

  id v11 = [v10 turnBasedInviteForGame:v8];
  id v12 = v11;
  if (v11)
  {
    id v13 = [v11 matchID];
    id v14 = [v12 exchangeID];
  }
  else
  {
    id v14 = 0;
    id v13 = 0;
  }
  signed int v15 = [v12 pushCommand];
  id v16 = [v12 userTapped];
  if (v4)
  {
    id v17 = v16;
    if (!os_log_GKGeneral) {
      id v18 = (id)GKOSLoggers();
    }
    id v19 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      CFStringRef v20 = @"NO";
      int v21 = 138413058;
      id v22 = v13;
      __int16 v23 = 2112;
      if (v17) {
        CFStringRef v20 = @"YES";
      }
      id v24 = v14;
      __int16 v25 = 2048;
      uint64_t v26 = v15;
      __int16 v27 = 2112;
      CFStringRef v28 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "getNextTurnBasedEventWithHandler matchID: %@ exchangeID:%@ command: %ld userTapped:%@", (uint8_t *)&v21, 0x2Au);
    }
    (*((void (**)(id, void *, void *, void, id, void))v4 + 2))(v4, v13, v14, v15, v17, 0);
  }
}

- (void)sendReminderToParticipants:(id)a3 message:(id)a4 match:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedService.m", 1519, "-[GKTurnBasedService sendReminderToParticipants:message:match:handler:]");
  signed int v15 = [(GKService *)self transactionGroupWithName:v14];

  id v16 = +[GKDataRequestManager sharedManager];
  v34[0] = @"session-id";
  id v17 = [v13 matchID];

  v35[0] = v17;
  v35[1] = v11;
  v34[1] = @"localized-message";
  void v34[2] = @"participants";
  v35[2] = v10;
  v34[3] = @"push-token";
  id v18 = [v16 pushToken];
  id v19 = v18;
  if (!v18)
  {
    id v19 = +[NSData data];
  }
  v35[3] = v19;
  CFStringRef v20 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];
  if (!v18) {

  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000AB420;
  v29[3] = &unk_1002D48B0;
  id v21 = v16;
  id v30 = v21;
  id v22 = v20;
  id v31 = v22;
  id v32 = self;
  id v23 = v15;
  id v33 = v23;
  [v23 perform:v29];
  if (v12)
  {
    id v24 = [(GKService *)self clientProxy];
    __int16 v25 = [v24 replyQueue];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000AB56C;
    v26[3] = &unk_1002D3930;
    id v28 = v12;
    id v27 = v23;
    [v27 notifyOnQueue:v25 block:v26];
  }
}

- (void)loadURLWithTBGMatch:(id)a3 player:(id)a4 matchRequest:(id)a5 handler:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a4;
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  id v13 = +[GKDispatchGroup dispatchGroupWithName:@"loadRecordURL"];
  id v14 = [(GKService *)self clientProxy];
  signed int v15 = [v14 bundleIdentifier];
  [v12 setObject:v15 forKey:@"bundle-id"];

  id v16 = [(GKService *)self clientProxy];
  id v17 = [v16 bundleVersion];
  [v12 setObject:v17 forKey:@"bundle-version"];

  id v18 = [v11 playerID];

  [v12 setObject:v18 forKey:@"playerID"];
  id v19 = [(GKService *)self clientProxy];
  CFStringRef v20 = [v19 bundleShortVersion];

  if (v20)
  {
    id v21 = [(GKService *)self clientProxy];
    id v22 = [v21 bundleShortVersion];
    [v12 setObject:v22 forKey:@"short-bundle-version"];
  }
  id v23 = [(GKService *)self clientProxy];
  id v24 = [v23 adamID];

  if (v24)
  {
    __int16 v25 = [(GKService *)self clientProxy];
    uint64_t v26 = [v25 adamID];
    [v12 setObject:v26 forKey:@"adam-id"];
  }
  id v27 = [v9 matchID];

  if (v27)
  {
    id v28 = [v9 matchID];
    [v12 setObject:v28 forKey:@"session-id"];
  }
  id v29 = +[NSNumber numberWithInt:1];
  [v12 setObject:v29 forKey:@"turn-count"];

  [v12 setObject:&off_1002F2060 forKey:@"invite-type"];
  id v30 = +[NSKeyedArchiver archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];
  id v31 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:@"com.apple.legacygaming.invites" ownerName:CKCurrentUserDefaultName];
  id v32 = [objc_alloc((Class)CKRecord) initWithRecordType:@"LegacyMultiplayerInvites" zoneID:v31];
  [v32 setObject:v30 forKeyedSubscript:@"connectionData"];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000AB9C4;
  v40[3] = &unk_1002D3980;
  id v41 = v32;
  id v42 = self;
  id v33 = v13;
  id v43 = v33;
  id v34 = v32;
  [v33 perform:v40];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000ABC10;
  v37[3] = &unk_1002D3930;
  id v38 = v33;
  id v39 = v10;
  id v35 = v33;
  id v36 = v10;
  [v35 notifyOnQueue:&_dispatch_main_q block:v37];
}

- (void)reserveShareParticipantSlots:(int64_t)a3 minPlayerCount:(int64_t)a4 maxPlayerCount:(int64_t)a5 andInvitePlayers:(id)a6 withMessage:(id)a7 forMatch:(id)a8 handler:(id)a9
{
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  id v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedService.m", 1606, "-[GKTurnBasedService reserveShareParticipantSlots:minPlayerCount:maxPlayerCount:andInvitePlayers:withMessage:forMatch:handler:]");
  id v19 = [(GKService *)self transactionGroupWithName:v18];

  CFStringRef v20 = [(GKService *)self clientProxy];
  id v21 = [v20 replyQueue];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  void v34[2] = sub_1000ABEF8;
  v34[3] = &unk_1002D8930;
  int64_t v40 = a3;
  int64_t v41 = a4;
  int64_t v42 = a5;
  id v35 = v16;
  id v36 = v14;
  id v37 = v15;
  id v38 = self;
  id v22 = v19;
  id v39 = v22;
  id v23 = v15;
  id v24 = v14;
  id v25 = v16;
  [v22 performOnQueue:v21 block:v34];

  uint64_t v26 = [(GKService *)self clientProxy];
  id v27 = [v26 replyQueue];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  void v31[2] = sub_1000AC2D0;
  v31[3] = &unk_1002D3930;
  id v32 = v22;
  id v33 = v17;
  id v28 = v22;
  id v29 = v17;
  [v28 notifyOnQueue:v27 block:v31];
}

- (id)privateDatabase
{
  v2 = +[CKContainer containerWithIdentifier:@"com.apple.socialgaming.sessions"];
  v3 = [v2 privateCloudDatabase];

  return v3;
}

- (void)saveRecord:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)CKModifyRecordsOperation);
  id v19 = v6;
  id v9 = +[NSArray arrayWithObjects:&v19 count:1];
  id v10 = [v8 initWithRecordsToSave:v9 recordIDsToDelete:0];

  id v11 = +[GKCloudKitMultiplayerUtils cloudKitOperationConfigurationForSocialGamingSessionsContainer];
  [v10 setConfiguration:v11];

  [v10 setSavePolicy:1];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000AC530;
  v15[3] = &unk_1002D8958;
  id v16 = v6;
  id v17 = self;
  id v18 = v7;
  id v12 = v7;
  id v13 = v6;
  [v10 setModifyRecordsCompletionBlock:v15];
  id v14 = [(GKTurnBasedService *)self privateDatabase];
  [v14 addOperation:v10];
}

@end