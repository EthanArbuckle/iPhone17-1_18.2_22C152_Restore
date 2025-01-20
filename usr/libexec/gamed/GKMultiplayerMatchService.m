@interface GKMultiplayerMatchService
+ (Class)interfaceClass;
+ (id)makeBaseServerRequestForMatchRequest:(id)a3 playerCount:(int64_t)a4 rematchID:(id)a5 connInfo:(int64_t)a6;
+ (id)makePlayersDictionaryForMatchRequest:(id)a3 transportContext:(id)a4;
+ (unint64_t)requiredEntitlements;
- (BOOL)zoneNotFoundFromOperation:(id)a3 operationError:(id)a4;
- (GKPseudonymManager)pseudonymManager;
- (_TtC14GameDaemonCore13GameDaemonTTR)ttrHelper;
- (id)contactsIntegrationController;
- (id)ensureGroup:(id)a3 participants:(id)a4 playedAt:(int64_t)a5 numberOfAutomatched:(int64_t)a6 moc:(id)a7 list:(id)a8;
- (id)privateDatabase;
- (void)_performRelayAction:(id)a3 request:(id)a4 handler:(id)a5;
- (void)acceptGameInvite:(id)a3 transportContext:(id)a4 handler:(id)a5;
- (void)cancelGameInviteWithHandler:(id)a3;
- (void)cancelOutstandingMatchRequestWithHandler:(id)a3;
- (void)cancelRelayRequest:(id)a3 handler:(id)a4;
- (void)convertToInternalObjects:(id)a3 results:(id)a4;
- (void)declineGameInvite:(id)a3 reason:(int64_t)a4 handler:(id)a5;
- (void)fetchDevicePushToken:(id)a3;
- (void)fetchOnDeviceMultiplayerBundleIDsForNewBundleID:(id)a3 handler:(id)a4;
- (void)fetchOnDeviceMultiplayerBundleIDsWithHandler:(id)a3;
- (void)fetchPseudonymIfNeededWithTransportContext:(id)a3 withCompletionHandler:(id)a4;
- (void)fetchTransportOverrideWithHandler:(id)a3;
- (void)fileMultiplayerTTRWithCallBackIdentifier:(id)a3 descriptionAddition:(id)a4 handler:(id)a5;
- (void)forgetParticipant:(id)a3 deviceID:(id)a4 handler:(id)a5;
- (void)getAcceptedGameInviteWithHandler:(id)a3;
- (void)getCompatibilityMatrix:(id)a3 handler:(id)a4;
- (void)getFlowRateForPlayerGroup:(int64_t)a3 handler:(id)a4;
- (void)getFlowRateForQueue:(id)a3 handler:(id)a4;
- (void)getFlowRateWithPlayerGroup:(id)a3 queueName:(id)a4 handler:(id)a5;
- (void)getInviteSessionTokenWithHandler:(id)a3;
- (void)getMultiPlayerGroups:(id)a3;
- (void)getOverallFlowRateWithHandler:(id)a3;
- (void)getPlayersForMatchRequest:(id)a3 playerCount:(int64_t)a4 rematchID:(id)a5 transportContext:(id)a6 handler:(id)a7;
- (void)getPlayersToInviteWithHandlerV2:(id)a3;
- (void)hasCanceledMultiplayerInitiateBulletinForSessionToken:(id)a3 handler:(id)a4;
- (void)hasExistingInviteSessionWithHandler:(id)a3;
- (void)initiateInvitationForMatchRequest:(id)a3 recipients:(id)a4 devicePushTokenMap:(id)a5 isNearbyInvite:(BOOL)a6 availableForMessageV2:(BOOL)a7 transportContext:(id)a8 handler:(id)a9;
- (void)initiateRelayRequest:(id)a3 handler:(id)a4;
- (void)invitePlayersForMatchRequest:(id)a3 devicePushTokenMap:(id)a4 isNearbyInvite:(BOOL)a5 transportContext:(id)a6 handler:(id)a7;
- (void)isGameCenterMultiplayerGameForBundleID:(id)a3 handler:(id)a4;
- (void)loadCloudKitShareURLWithPlayer:(id)a3 matchRequest:(id)a4 transportContext:(id)a5 availableForMessageV2:(BOOL)a6 handler:(id)a7;
- (void)loadCloudKitShareURLWithPlayer:(id)a3 matchRequest:(id)a4 transportContext:(id)a5 handler:(id)a6;
- (void)nearbyInviteWasCancelled:(id)a3;
- (void)presentNearbyInvite:(id)a3;
- (void)putMultiPlayerGroup:(id)a3 participants:(id)a4 playedAt:(int64_t)a5 bundleID:(id)a6 numberOfAutomatched:(int64_t)a7 handler:(id)a8;
- (void)removeInviteSession;
- (void)removeInviteSessionIfNeeded;
- (void)removePlayersFromGameInviteV2:(id)a3 handler:(id)a4;
- (void)requestTTRLogsWith:(id)a3 handler:(id)a4;
- (void)revokePseudonym:(id)a3 withCompletionHandler:(id)a4;
- (void)saveRecord:(id)a3 shouldRetry:(BOOL)a4 withHandler:(id)a5;
- (void)saveRecord:(id)a3 withHandler:(id)a4;
- (void)sendDataToParticipant:(id)a3 deviceID:(id)a4 data:(id)a5 usePeerDiscovery:(BOOL)a6 handler:(id)a7;
- (void)sendInvitationUpdate:(id)a3 handler:(id)a4;
- (void)sendReconnectInvitation:(id)a3 toPlayer:(id)a4 connectionData:(id)a5 sessionToken:(id)a6 pushToken:(id)a7 handler:(id)a8;
- (void)setPseudonymManager:(id)a3;
- (void)setShareInvitees:(id)a3;
- (void)setShareRecordID:(id)a3;
- (void)setTtrHelper:(id)a3;
- (void)setupInviteShareWithRecordID:(id)a3 rootRecord:(id)a4 handler:(id)a5;
- (void)setupInviteShareWithRecordID:(id)a3 rootRecord:(id)a4 shouldRetry:(BOOL)a5 handler:(id)a6;
- (void)setupNearbyDiscovery;
- (void)startNearbyAdvertisingWithDiscoveryInfo:(id)a3 handler:(id)a4;
- (void)startNearbyBrowsingWithPlayerID:(id)a3 handler:(id)a4;
- (void)stopNearbyAdvertisingWithHandler:(id)a3;
- (void)stopNearbyBrowsingWithHandler:(id)a3;
- (void)updateCacheWithNearbyProfileDictionary:(id)a3 handler:(id)a4;
- (void)updateRelayRequest:(id)a3 handler:(id)a4;
- (void)uploadLogsForRadar:(id)a3 from:(id)a4 handler:(id)a5;
- (void)validateRequests:(id)a3 andFileMultiplayerTTRIfNeededWithContext:(id)a4;
@end

@implementation GKMultiplayerMatchService

+ (unint64_t)requiredEntitlements
{
  return 128;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class();
}

- (_TtC14GameDaemonCore13GameDaemonTTR)ttrHelper
{
  ttrHelper = self->_ttrHelper;
  if (!ttrHelper)
  {
    v4 = GKGetRuntimeStrategy();
    v5 = [v4 localPlayer];

    v6 = [_TtC14GameDaemonCore13GameDaemonTTR alloc];
    v7 = [(GKService *)self clientProxy];
    v8 = [v7 bundleIdentifier];
    v9 = [(GameDaemonTTR *)v6 initWithClientProxyBundleIdentifier:v8 localPlayer:v5];
    v10 = self->_ttrHelper;
    self->_ttrHelper = v9;

    ttrHelper = self->_ttrHelper;
  }

  return ttrHelper;
}

- (GKPseudonymManager)pseudonymManager
{
  pseudonymManager = self->_pseudonymManager;
  if (!pseudonymManager)
  {
    v4 = objc_alloc_init(GKPseudonymManager);
    v5 = self->_pseudonymManager;
    self->_pseudonymManager = v4;

    pseudonymManager = self->_pseudonymManager;
  }

  return pseudonymManager;
}

- (void)fetchPseudonymIfNeededWithTransportContext:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void))a4;
  v8 = [v6 pseudonym];

  if (v8)
  {
    v9 = [v6 pseudonym];
    v7[2](v7, v9, 0);
  }
  else
  {
    v9 = +[GKService serviceFromService:self];
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = sub_100089E90;
    v16[4] = sub_100089EA0;
    id v17 = 0;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3032000000;
    v14[3] = sub_100089E90;
    v14[4] = sub_100089EA0;
    id v15 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100089EA8;
    v10[3] = &unk_1002D7DE0;
    v12 = v16;
    v13 = v14;
    v10[4] = self;
    v11 = v7;
    [v9 isICloudAvailableWithHandler:v10];

    _Block_object_dispose(v14, 8);
    _Block_object_dispose(v16, 8);
  }
}

- (void)getPlayersForMatchRequest:(id)a3 playerCount:(int64_t)a4 rematchID:(id)a5 transportContext:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!os_log_GKGeneral) {
    id v16 = (id)GKOSLoggers();
  }
  id v17 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v47 = v12;
    __int16 v48 = 2112;
    id v49 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Get players for match request: %@, transportContext: %@", buf, 0x16u);
  }
  [(GKMultiplayerMatchService *)self cancelOutstandingMatchRequestWithHandler:0];
  v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKMultiplayerMatchService.m", 161, "-[GKMultiplayerMatchService getPlayersForMatchRequest:playerCount:rematchID:transportContext:handler:]");
  v19 = [(GKService *)self transactionGroupWithName:v18];

  id v20 = objc_alloc_init((Class)GKMatchResponse);
  [v20 transitionToState:1];
  [v20 setMatchingGroup:v19];
  [v20 setMatchRequest:v12];
  v21 = [(GKService *)self clientProxy];
  [v21 setCurrentMatchResponse:v20];

  v22 = [(GKService *)self clientProxy];
  v23 = [v22 replyQueue];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10008A610;
  v39[3] = &unk_1002D7E58;
  v39[4] = self;
  id v40 = v14;
  id v24 = v19;
  id v41 = v24;
  id v25 = v20;
  id v42 = v25;
  id v43 = v12;
  id v44 = v13;
  int64_t v45 = a4;
  id v26 = v13;
  id v27 = v12;
  id v28 = v14;
  [v24 performOnQueue:v23 block:v39];

  v29 = [(GKService *)self clientProxy];
  v30 = [v29 replyQueue];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10008ACF0;
  v34[3] = &unk_1002D7E80;
  id v35 = v25;
  id v36 = v24;
  v37 = self;
  id v38 = v15;
  id v31 = v15;
  id v32 = v24;
  id v33 = v25;
  [v32 notifyOnQueue:v30 block:v34];
}

+ (id)makeBaseServerRequestForMatchRequest:(id)a3 playerCount:(int64_t)a4 rematchID:(id)a5 connInfo:(int64_t)a6
{
  id v9 = a3;
  id v10 = a5;
  v28[0] = @"min-peers";
  v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 minPlayers]);
  v29[0] = v11;
  v28[1] = @"max-peers";
  id v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 maxPlayers]);
  v29[1] = v12;
  v28[2] = @"requires-guest-player-capability";
  id v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 hasGuestPlayers]);
  v29[2] = v13;
  id v14 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
  id v15 = +[NSMutableDictionary dictionaryWithDictionary:v14];

  if (a4)
  {
    id v16 = +[NSNumber numberWithInteger:a4];
    [v15 setObject:v16 forKey:@"num-players"];
  }
  id v17 = [v9 queueName];

  if (v17)
  {
    v18 = [v9 queueName];
    [v15 setObject:v18 forKey:@"queue-name"];

    v19 = [v9 properties];

    if (v19)
    {
      id v20 = [v9 properties];
      [v15 setObject:v20 forKey:@"properties"];
    }
  }
  else
  {
    v26[0] = @"bucket-id";
    v21 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 playerGroup]);
    v27[0] = v21;
    v26[1] = @"conn-info";
    v22 = +[NSNumber numberWithInteger:a6];
    v27[1] = v22;
    v26[2] = @"flags";
    v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%#.8x", [v9 playerAttributes]);
    v27[2] = v23;
    id v24 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
    [v15 addEntriesFromDictionary:v24];

    if (v10) {
      [v15 setObject:v10 forKey:@"match-id"];
    }
  }

  return v15;
}

+ (id)makePlayersDictionaryForMatchRequest:(id)a3 transportContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v42 = +[NSMutableArray array];
  v7 = [v6 localPlayerID];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v5 localPlayerID];
  }
  id v10 = v9;

  v11 = [v5 properties];
  CFStringRef v12 = @"player-id";
  if (v11)
  {
    v61[1] = @"properties";
    v62[0] = v10;
    v61[0] = @"player-id";
    id v13 = [v5 properties];
    v62[1] = v13;
    uint64_t v14 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:2];
  }
  else
  {
    CFStringRef v59 = @"player-id";
    v60 = v10;
    uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
  }

  v37 = (void *)v14;
  [v42 addObject:v14];
  id v15 = [v5 recipientPlayerIDs];
  id v16 = +[NSMutableSet setWithArray:v15];

  id v17 = [v6 representedPlayerIDs];

  if (v17)
  {
    v18 = [v6 representedPlayerIDs];
    [v16 addObjectsFromArray:v18];
  }
  id v38 = v6;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v16;
  id v19 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v50;
    id v40 = v5;
    id v41 = v10;
    uint64_t v39 = *(void *)v50;
    do
    {
      v22 = 0;
      id v43 = v20;
      do
      {
        if (*(void *)v50 != v21) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v49 + 1) + 8 * (void)v22);
        if (([v23 isEqualToString:v10] & 1) == 0)
        {
          CFStringRef v24 = v12;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          id v25 = [v5 recipientProperties];
          id v26 = [v25 countByEnumeratingWithState:&v45 objects:v57 count:16];
          if (v26)
          {
            id v27 = v26;
            uint64_t v28 = *(void *)v46;
            while (2)
            {
              for (i = 0; i != v27; i = (char *)i + 1)
              {
                if (*(void *)v46 != v28) {
                  objc_enumerationMutation(v25);
                }
                v30 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                id v31 = [v30 playerID];
                unsigned int v32 = [v31 isEqualToString:v23];

                if (v32)
                {
                  CFStringRef v12 = v24;
                  v55[0] = v24;
                  v55[1] = @"properties";
                  v56[0] = v23;
                  id v5 = v40;
                  id v33 = [v40 recipientProperties];
                  v34 = [v33 objectForKeyedSubscript:v30];
                  v56[1] = v34;
                  id v35 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
                  [v42 addObject:v35];

                  goto LABEL_25;
                }
              }
              id v27 = [v25 countByEnumeratingWithState:&v45 objects:v57 count:16];
              if (v27) {
                continue;
              }
              break;
            }
          }

          CFStringRef v12 = v24;
          CFStringRef v53 = v24;
          v54 = v23;
          id v25 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
          [v42 addObject:v25];
          id v5 = v40;
LABEL_25:

          id v10 = v41;
          uint64_t v21 = v39;
          id v20 = v43;
        }
        v22 = (char *)v22 + 1;
      }
      while (v22 != v20);
      id v20 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
    }
    while (v20);
  }

  return v42;
}

- (void)cancelOutstandingMatchRequestWithHandler:(id)a3
{
  v4 = (void (**)(void))a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKMultiplayerMatchService: cancelOutstandingMatchRequest", (uint8_t *)&buf, 2u);
  }
  v7 = [(GKService *)self clientProxy];
  [v7 cancelOutstandingCheckMatchStatus];

  v8 = [(GKService *)self clientProxy];
  id v9 = [v8 currentMatchResponse];

  if (v9 && [v9 transitionToState:5])
  {
    id v10 = [v9 rid];
    v11 = [v9 matchRequest];
    CFStringRef v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 playerGroup]);

    if (v10 && v12)
    {
      v20[0] = @"rid";
      v20[1] = @"bucket-id";
      v21[0] = v10;
      v21[1] = v12;
      id v13 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
      uint64_t v14 = [v9 matchingGroup];
      if (v14)
      {
        objc_initWeak(&buf, self);
        id v15 = [v9 matchingGroup];
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_10008B7EC;
        v16[3] = &unk_1002D7EA8;
        objc_copyWeak(&v18, &buf);
        id v17 = v13;
        [v15 perform:v16];

        objc_destroyWeak(&v18);
        objc_destroyWeak(&buf);
      }
    }
  }
  if (v4) {
    v4[2](v4);
  }
}

- (void)getFlowRateForPlayerGroup:(int64_t)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = +[NSNumber numberWithInteger:a3];
  [(GKMultiplayerMatchService *)self getFlowRateWithPlayerGroup:v7 queueName:0 handler:v6];
}

- (void)getOverallFlowRateWithHandler:(id)a3
{
}

- (void)getFlowRateForQueue:(id)a3 handler:(id)a4
{
}

- (void)getFlowRateWithPlayerGroup:(id)a3 queueName:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    v11 = +[NSString stringWithFormat:@"handler can't be nil"];
    CFStringRef v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplayerMatchService.m"];
    id v13 = [v12 lastPathComponent];
    uint64_t v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (handler)\n[%s (%s:%d)]", v11, "-[GKMultiplayerMatchService getFlowRateWithPlayerGroup:queueName:handler:]", [v13 UTF8String], 392);

    +[NSException raise:@"GameKit Exception", @"%@", v14 format];
  }
  if (v8 && v9)
  {
    id v15 = +[NSString stringWithFormat:@"playerGroup and queueName can't be both non-nil"];
    id v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplayerMatchService.m"];
    id v17 = [v16 lastPathComponent];
    id v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (!(playerGroup && queueName))\n[%s (%s:%d)]", v15, "-[GKMultiplayerMatchService getFlowRateWithPlayerGroup:queueName:handler:]", [v17 UTF8String], 393);

    +[NSException raise:@"GameKit Exception", @"%@", v18 format];
  }
  if (!os_log_GKGeneral) {
    id v19 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    sub_10009BB80();
  }
  id v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKMultiplayerMatchService.m", 396, "-[GKMultiplayerMatchService getFlowRateWithPlayerGroup:queueName:handler:]");
  uint64_t v21 = [(GKService *)self transactionGroupWithName:v20];

  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = 0;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10008BD70;
  v33[3] = &unk_1002D70C0;
  v33[4] = self;
  id v22 = v8;
  id v34 = v22;
  id v23 = v9;
  id v35 = v23;
  v37 = v38;
  id v24 = v21;
  id v36 = v24;
  [v24 performOnManagedObjectContext:v33];
  id v25 = [(GKService *)self clientProxy];
  id v26 = [v25 replyQueue];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10008C674;
  void v29[3] = &unk_1002D4248;
  id v27 = v10;
  id v31 = v27;
  unsigned int v32 = v38;
  id v28 = v24;
  id v30 = v28;
  [v28 notifyOnQueue:v26 block:v29];

  _Block_object_dispose(v38, 8);
}

- (void)getCompatibilityMatrix:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    sub_10009BC80();
  }
  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKMultiplayerMatchService.m", 467, "-[GKMultiplayerMatchService getCompatibilityMatrix:handler:]");
  id v10 = [(GKService *)self transactionGroupWithName:v9];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10008C8DC;
  v18[3] = &unk_1002D3D30;
  id v11 = v6;
  id v19 = v11;
  id v12 = v10;
  id v20 = v12;
  uint64_t v21 = self;
  [v12 performOnManagedObjectContext:v18];
  if (v7)
  {
    id v13 = [(GKService *)self clientProxy];
    uint64_t v14 = [v13 replyQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10008D24C;
    v15[3] = &unk_1002D3930;
    id v17 = v7;
    id v16 = v12;
    [v16 notifyOnQueue:v14 block:v15];
  }
}

- (void)setShareInvitees:(id)a3
{
  id v4 = a3;
  id v5 = [(GKService *)self clientProxy];
  id v6 = [v5 fetchOrCreateInviteSession];

  id v7 = +[NSMutableArray arrayWithArray:v4];
  [v6 setShareInvitees:v7];

  id v8 = [v6 shareRecordID];

  if (v8)
  {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = v4;
    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          [v9 setObject:&stru_1002E4F58 forKey:*(void *)(*((void *)&v22 + 1) + 8 * (void)v14)];
          uint64_t v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }

    id v15 = +[NSKeyedArchiver archivedDataWithRootObject:v9 requiringSecureCoding:1 error:0];
    id v16 = +[GKDispatchGroup dispatchGroupWithName:@"saveInvitedPlayers"];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10008D514;
    v18[3] = &unk_1002D3980;
    id v19 = v6;
    id v20 = v15;
    uint64_t v21 = self;
    id v17 = v15;
    [v16 perform:v18];
  }
}

- (void)hasExistingInviteSessionWithHandler:(id)a3
{
  id v6 = (void (**)(id, BOOL))a3;
  id v4 = [(GKService *)self clientProxy];
  id v5 = [v4 inviteSession];

  if (v6) {
    v6[2](v6, v5 != 0);
  }
}

- (void)setShareRecordID:(id)a3
{
  id v4 = a3;
  id v5 = [(GKService *)self clientProxy];
  id v6 = [v5 fetchOrCreateInviteSession];

  [v6 setShareRecordID:v4];
}

- (void)initiateInvitationForMatchRequest:(id)a3 recipients:(id)a4 devicePushTokenMap:(id)a5 isNearbyInvite:(BOOL)a6 availableForMessageV2:(BOOL)a7 transportContext:(id)a8 handler:(id)a9
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  id v17 = a9;
  if (!os_log_GKGeneral) {
    id v18 = (id)GKOSLoggers();
  }
  id v19 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id buf = 138412802;
    id v43 = v13;
    __int16 v44 = 2112;
    id v45 = v16;
    __int16 v46 = 2112;
    id v47 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Initiate invitation for match request: %@\ntransportContext: %@\nrecipients: %@", buf, 0x20u);
  }
  id v20 = objc_alloc_init((Class)GKInviteInitiateResponse);
  uint64_t v21 = +[GKDataRequestManager sharedManager];
  long long v22 = +[GKPreferences shared];
  id v23 = [v22 forceRelay];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10008DC38;
  v32[3] = &unk_1002D7FC0;
  id v33 = v13;
  id v34 = v14;
  BOOL v40 = a6;
  id v35 = v20;
  id v36 = v15;
  v37 = self;
  id v38 = v16;
  id v39 = v17;
  BOOL v41 = a7;
  id v24 = v17;
  id v25 = v16;
  id v26 = v15;
  id v27 = v20;
  id v28 = v14;
  id v29 = v13;
  [v21 getValidNATTypeWithForceRelay:v23 withHandler:v32];
}

- (id)contactsIntegrationController
{
  return +[GKContactsIntegrationController sharedController];
}

- (void)loadCloudKitShareURLWithPlayer:(id)a3 matchRequest:(id)a4 transportContext:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (([v12 validTransportSelected] & 1) != 0
    || ([v12 supportsTransportVersion:&off_1002F1FB8] & 1) == 0)
  {
    [(GKMultiplayerMatchService *)self loadCloudKitShareURLWithPlayer:v10 matchRequest:v11 transportContext:v12 availableForMessageV2:0 handler:v13];
  }
  else
  {
    id v14 = +[NSMutableArray array];
    uint64_t v35 = 0;
    id v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 0;
    id v15 = [v11 messagesBasedRecipients];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10008F050;
    v32[3] = &unk_1002D7FE8;
    id v34 = &v35;
    id v16 = v14;
    id v33 = v16;
    [v15 enumerateObjectsUsingBlock:v32];

    if (*((unsigned char *)v36 + 24) || ![v16 count])
    {
      if (!os_log_GKGeneral) {
        id v17 = (id)GKOSLoggers();
      }
      id v18 = os_log_GKMatch;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = +[NSNumber numberWithBool:*((unsigned __int8 *)v36 + 24)];
        id v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v16 count]);
        *(_DWORD *)id buf = 138412546;
        BOOL v40 = v19;
        __int16 v41 = 2112;
        id v42 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Skip overriding transport for msg invites. missing: %@, unprefixedHandles count: %@", buf, 0x16u);
      }
      [(GKMultiplayerMatchService *)self loadCloudKitShareURLWithPlayer:v10 matchRequest:v11 transportContext:v12 availableForMessageV2:0 handler:v13];
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v21 = (id)GKOSLoggers();
      }
      long long v22 = os_log_GKMatch;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        id v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v16 count]);
        *(_DWORD *)id buf = 138412290;
        BOOL v40 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Checking %@ handles' availability for msg invites.", buf, 0xCu);
      }
      objc_initWeak((id *)buf, self);
      id v24 = [(GKMultiplayerMatchService *)self contactsIntegrationController];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10008F0F0;
      v25[3] = &unk_1002D8010;
      objc_copyWeak(&v31, (id *)buf);
      id v26 = v10;
      id v27 = v11;
      id v28 = v12;
      id v29 = v16;
      id v30 = v13;
      [v24 fetchMessageTransportV2AvailabilityForUnprefixedHandles:v29 completion:v25];

      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)buf);
    }

    _Block_object_dispose(&v35, 8);
  }
}

- (void)loadCloudKitShareURLWithPlayer:(id)a3 matchRequest:(id)a4 transportContext:(id)a5 availableForMessageV2:(BOOL)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = +[GKDispatchGroup dispatchGroupWithName:@"loadRecordURL"];
  if (!os_log_GKGeneral) {
    id v17 = (id)GKOSLoggers();
  }
  id v18 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138412546;
    id v35 = v13;
    __int16 v36 = 2112;
    id v37 = v14;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Loading a CloudKit share URL for matchRequest: %@, transportContext: %@", buf, 0x16u);
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10008F534;
  void v28[3] = &unk_1002D4158;
  v28[4] = self;
  id v29 = v13;
  BOOL v33 = a6;
  id v30 = v14;
  id v19 = v16;
  id v31 = v19;
  id v32 = v12;
  id v20 = v12;
  id v21 = v14;
  id v22 = v13;
  [v19 perform:v28];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10009039C;
  v25[3] = &unk_1002D3930;
  id v26 = v19;
  id v27 = v15;
  id v23 = v19;
  id v24 = v15;
  [v23 notifyOnQueue:&_dispatch_main_q block:v25];
}

- (void)setupInviteShareWithRecordID:(id)a3 rootRecord:(id)a4 shouldRetry:(BOOL)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!v12)
  {
    id v13 = +[NSString stringWithFormat:@"Handler not set by callers of setupInviteShareWithRecordID:rootRecord:shouldRetry:handler:."];
    id v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplayerMatchService.m"];
    id v15 = [v14 lastPathComponent];
    id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (handler)\n[%s (%s:%d)]", v13, "-[GKMultiplayerMatchService setupInviteShareWithRecordID:rootRecord:shouldRetry:handler:]", [v15 UTF8String], 972);

    +[NSException raise:@"GameKit Exception", @"%@", v16 format];
  }
  id v17 = [objc_alloc((Class)CKShare) initWithRootRecord:v11 shareID:v10];
  [v17 setPublicPermission:3];
  id v18 = objc_alloc((Class)CKModifyRecordsOperation);
  v34[0] = v17;
  v34[1] = v11;
  id v19 = +[NSArray arrayWithObjects:v34 count:2];
  id v20 = [v18 initWithRecordsToSave:v19 recordIDsToDelete:0];

  id v21 = +[GKCloudKitMultiplayerUtils cloudKitOperationConfigurationForSocialGamingSessionsContainer];
  [v20 setConfiguration:v21];

  [v20 setSavePolicy:1];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000906E4;
  void v27[3] = &unk_1002D80D8;
  id v31 = v11;
  id v32 = v12;
  BOOL v33 = a5;
  id v28 = v17;
  id v29 = self;
  id v30 = v10;
  id v22 = v11;
  id v23 = v10;
  id v24 = v12;
  id v25 = v17;
  [v20 setModifyRecordsCompletionBlock:v27];
  id v26 = [(GKMultiplayerMatchService *)self privateDatabase];
  [v26 addOperation:v20];
}

- (void)setupInviteShareWithRecordID:(id)a3 rootRecord:(id)a4 handler:(id)a5
{
}

- (id)privateDatabase
{
  v2 = +[CKContainer containerWithIdentifier:@"com.apple.socialgaming.sessions"];
  v3 = [v2 privateCloudDatabase];

  return v3;
}

- (void)saveRecord:(id)a3 withHandler:(id)a4
{
}

- (BOOL)zoneNotFoundFromOperation:(id)a3 operationError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 code] == (id)2)
  {
    id v7 = [v6 userInfo];
    id v8 = [v7 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    [v8 allValues];
    id v10 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v9);
          }
          if ([*(id *)(*((void *)&v16 + 1) + 8 * i) code] == (id)26)
          {
            if (!os_log_GKGeneral) {
              id v13 = (id)GKOSLoggers();
            }
            id v14 = os_log_GKMatch;
            LOBYTE(v10) = 1;
            if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)id buf = 138412290;
              id v21 = v5;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Zone Not Found. Should retry %@ after creating zone.", buf, 0xCu);
            }
            goto LABEL_16;
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return (char)v10;
}

- (void)saveRecord:(id)a3 shouldRetry:(BOOL)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v9)
  {
    id v10 = +[NSString stringWithFormat:@"Handler not set by callers of saveRecord:shouldRetry:withHandler:."];
    uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplayerMatchService.m"];
    id v12 = [v11 lastPathComponent];
    id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (handler)\n[%s (%s:%d)]", v10, "-[GKMultiplayerMatchService saveRecord:shouldRetry:withHandler:]", [v12 UTF8String], 1053);

    +[NSException raise:@"GameKit Exception", @"%@", v13 format];
  }
  id v14 = objc_alloc((Class)CKModifyRecordsOperation);
  id v25 = v8;
  id v15 = +[NSArray arrayWithObjects:&v25 count:1];
  id v16 = [v14 initWithRecordsToSave:v15 recordIDsToDelete:0];

  long long v17 = +[GKCloudKitMultiplayerUtils cloudKitOperationConfigurationForSocialGamingSessionsContainer];
  [v16 setConfiguration:v17];

  [v16 setSavePolicy:1];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  void v21[2] = sub_100090EE0;
  v21[3] = &unk_1002D8100;
  BOOL v24 = a4;
  v21[4] = self;
  id v22 = v8;
  id v23 = v9;
  id v18 = v9;
  id v19 = v8;
  [v16 setModifyRecordsCompletionBlock:v21];
  id v20 = [(GKMultiplayerMatchService *)self privateDatabase];
  [v20 addOperation:v16];
}

- (void)invitePlayersForMatchRequest:(id)a3 devicePushTokenMap:(id)a4 isNearbyInvite:(BOOL)a5 transportContext:(id)a6 handler:(id)a7
{
  id v11 = a3;
  id v47 = a4;
  id v12 = a6;
  id v48 = a7;
  if (!os_log_GKGeneral) {
    id v13 = (id)GKOSLoggers();
  }
  id v14 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138412546;
    id v67 = v11;
    __int16 v68 = 2112;
    id v69 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Invite players for matchRequest: %@, transportContext: %@", buf, 0x16u);
  }
  id v43 = v12;
  id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKMultiplayerMatchService.m", 1091, "-[GKMultiplayerMatchService invitePlayersForMatchRequest:devicePushTokenMap:isNearbyInvite:transportContext:handler:]");
  id v16 = [(GKService *)self transactionGroupWithName:v15];

  long long v17 = +[NSMutableArray array];
  id v18 = [v11 recipients];
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_100091524;
  v64[3] = &unk_1002D4D30;
  id v19 = v17;
  id v65 = v19;
  [v18 enumerateObjectsUsingBlock:v64];

  if (![v19 count])
  {
    id v20 = [v11 recipientPlayerIDs];
    [v19 addObjectsFromArray:v20];
  }
  id v21 = [v19 count];
  id v22 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v21];
  id v23 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:v21];
  uint64_t v24 = objc_opt_class();
  id v25 = [v11 archivedSharePlayInviteeTokensFromProgrammaticInvite];
  id v63 = 0;
  id v26 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v24 fromData:v25 error:&v63];
  id v27 = v63;

  if (v27)
  {
    id v28 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v29 = (id)GKOSLoggers();
      id v28 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      sub_10009C080();
    }
  }
  id v30 = [(GKService *)self clientProxy];
  id v31 = [v30 replyQueue];
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_100091594;
  v52[3] = &unk_1002D8178;
  id v42 = v27;
  id v53 = v19;
  id v54 = v47;
  id v55 = v22;
  id v56 = v26;
  id v57 = v23;
  id v32 = v16;
  id v58 = v32;
  CFStringRef v59 = self;
  BOOL v62 = a5;
  id v60 = v11;
  id v61 = v43;
  id v46 = v43;
  id v44 = v11;
  id v33 = v23;
  id v34 = v26;
  id v35 = v22;
  id v36 = v47;
  id v37 = v19;
  [v32 performOnQueue:v31 block:v52];

  char v38 = [(GKService *)self clientProxy];
  id v39 = [v38 replyQueue];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10009261C;
  v49[3] = &unk_1002D3930;
  id v50 = v32;
  id v51 = v48;
  id v40 = v32;
  id v41 = v48;
  [v40 notifyOnQueue:v39 block:v49];
}

- (void)removePlayersFromGameInviteV2:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  id v9 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138412290;
    id v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Remove players from game inviteV2: %@", buf, 0xCu);
  }
  id v10 = [(GKService *)self clientProxy];
  id v11 = [v10 inviteSession];

  id v12 = [v11 sessionToken];
  id v13 = dispatch_group_create();
  id v14 = v13;
  if (v11 && v12)
  {
    dispatch_group_enter(v13);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    void v20[2] = sub_10009294C;
    v20[3] = &unk_1002D4328;
    id v21 = v6;
    id v22 = v11;
    id v23 = v12;
    uint64_t v24 = self;
    id v25 = v14;
    [v22 performAsync:v20];
  }
  id v15 = [(GKService *)self clientProxy];
  id v16 = [v15 replyQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100092CA4;
  v18[3] = &unk_1002D3A20;
  id v19 = v7;
  id v17 = v7;
  dispatch_group_notify(v14, v16, v18);
}

- (void)cancelGameInviteWithHandler:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Cancel game invite", buf, 2u);
  }
  id v7 = [(GKService *)self clientProxy];
  id v8 = [v7 inviteSession];

  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKMultiplayerMatchService.m", 1349, "-[GKMultiplayerMatchService cancelGameInviteWithHandler:]");
  id v10 = +[GKDispatchGroup dispatchGroupWithName:v9];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100092ED0;
  v17[3] = &unk_1002D3A70;
  id v18 = v8;
  id v19 = self;
  id v11 = v8;
  [v10 perform:v17];
  id v12 = [(GKService *)self clientProxy];
  id v13 = [v12 replyQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100093074;
  v15[3] = &unk_1002D3C38;
  void v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  [v10 notifyOnQueue:v13 block:v15];
}

- (id)ensureGroup:(id)a3 participants:(id)a4 playedAt:(int64_t)a5 numberOfAutomatched:(int64_t)a6 moc:(id)a7 list:(id)a8
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = (MultiplayerGroupList *)a8;
  if (!v14)
  {
    id v15 = [MultiplayerGroupList alloc];
    id v16 = +[MultiplayerGroupList entity];
    id v14 = [(MultiplayerGroupList *)v15 initWithEntity:v16 insertIntoManagedObjectContext:v13];
  }
  id v17 = +[MultiplayerGroup _gkFetchRequest];
  id v41 = v11;
  id v18 = +[NSPredicate predicateWithFormat:@"id == %@", v11];
  [v17 setPredicate:v18];

  id v37 = v17;
  id v19 = +[NSManagedObject _gkRetrieveCleanEntry:v13 request:v17];
  if (!v19)
  {
    id v20 = [MultiplayerGroup alloc];
    id v21 = +[MultiplayerGroup entity];
    id v19 = [(MultiplayerGroup *)v20 initWithEntity:v21 insertIntoManagedObjectContext:v13];

    [(MultiplayerGroupList *)v14 addEntriesObject:v19];
  }
  id v36 = v19;
  char v38 = v14;
  id v22 = objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v23 = v12;
  id v24 = [v23 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v43;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v43 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        id v29 = [MultiplayerGroupParticipant alloc];
        id v30 = +[MultiplayerGroupParticipant entity];
        id v31 = [(MultiplayerGroupParticipant *)v29 initWithEntity:v30 insertIntoManagedObjectContext:v13];

        [(MultiplayerGroupParticipant *)v31 setPlayerID:v28];
        [v22 addObject:v31];
      }
      id v25 = [v23 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v25);
  }

  id v32 = [(MultiplayerGroup *)v36 entries];
  [(MultiplayerGroup *)v36 removeEntries:v32];

  [(MultiplayerGroup *)v36 addEntries:v22];
  [(MultiplayerGroup *)v36 setId:v41];
  id v33 = +[NSNumber numberWithInteger:a6];
  [(MultiplayerGroup *)v36 setNumberOfAutomatched:v33];

  id v34 = +[NSNumber numberWithInteger:a5];
  [(MultiplayerGroup *)v36 setPlayedAt:v34];

  return v36;
}

- (void)convertToInternalObjects:(id)a3 results:(id)a4
{
  id v24 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [a3 entries];
  id v5 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v30;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v8);
        id v10 = objc_opt_new();
        id v11 = [v9 numberOfAutomatched];
        [v10 setNumberOfAutomached:[v11 longValue]];

        id v12 = [v9 id];
        [v10 setGroupID:v12];

        id v13 = objc_opt_new();
        [v10 setParticipants:v13];

        id v14 = [v9 playedAt];
        [v10 setPlayedAt:[v14 longValue]];

        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v15 = [v9 entries];
        id v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v26;
          do
          {
            id v19 = 0;
            do
            {
              if (*(void *)v26 != v18) {
                objc_enumerationMutation(v15);
              }
              id v20 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v19);
              id v21 = [v10 participants];
              id v22 = [v20 playerID];
              [v21 addObject:v22];

              id v19 = (char *)v19 + 1;
            }
            while (v17 != v19);
            id v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v17);
        }

        [v24 addObject:v10];
        id v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      id v6 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v6);
  }
}

- (void)getMultiPlayerGroups:(id)a3
{
  id v4 = a3;
  id v5 = [(GKService *)self transactionGroupBypassingMultiUser];
  id v6 = objc_opt_new();
  [v5 setResult:v6];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000937B8;
  v10[3] = &unk_1002D5E50;
  v10[4] = self;
  id v11 = v6;
  id v12 = v5;
  id v13 = v4;
  id v7 = v4;
  id v8 = v5;
  id v9 = v6;
  [v8 performOnManagedObjectContext:v10];
}

- (void)putMultiPlayerGroup:(id)a3 participants:(id)a4 playedAt:(int64_t)a5 bundleID:(id)a6 numberOfAutomatched:(int64_t)a7 handler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  uint64_t v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKMultiplayerMatchService.m", 1494, "-[GKMultiplayerMatchService putMultiPlayerGroup:participants:playedAt:bundleID:numberOfAutomatched:handler:]");
  id v19 = [(GKService *)self transactionGroupWithName:v18];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100094338;
  v24[3] = &unk_1002D8208;
  id v25 = v15;
  long long v26 = self;
  int64_t v30 = a5;
  int64_t v31 = a7;
  id v27 = v14;
  id v28 = v16;
  id v29 = v17;
  id v20 = v17;
  id v21 = v16;
  id v22 = v14;
  id v23 = v15;
  [v19 performOnManagedObjectContext:v24];
}

- (void)acceptGameInvite:(id)a3 transportContext:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!os_log_GKGeneral) {
    id v11 = (id)GKOSLoggers();
  }
  id v12 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138412546;
    id v35 = v8;
    __int16 v36 = 2112;
    id v37 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Accept game invite: %@, transportContext: %@", buf, 0x16u);
  }
  id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKMultiplayerMatchService.m", 1525, "-[GKMultiplayerMatchService acceptGameInvite:transportContext:handler:]");
  id v14 = [(GKService *)self transactionGroupWithName:v13];

  id v15 = objc_alloc_init((Class)GKInviteAcceptResponse);
  id v16 = [(GKService *)self clientProxy];
  id v17 = [v16 replyQueue];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100094930;
  void v29[3] = &unk_1002D4518;
  void v29[4] = self;
  id v30 = v8;
  id v31 = v9;
  id v18 = v14;
  id v32 = v18;
  id v33 = v15;
  id v19 = v15;
  id v20 = v9;
  id v21 = v8;
  [v18 performOnQueue:v17 block:v29];

  id v22 = [(GKService *)self clientProxy];
  id v23 = [v22 replyQueue];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100095220;
  void v26[3] = &unk_1002D3930;
  id v27 = v18;
  id v28 = v10;
  id v24 = v18;
  id v25 = v10;
  [v24 notifyOnQueue:v23 block:v26];
}

- (void)declineGameInvite:(id)a3 reason:(int64_t)a4 handler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = +[GKDataRequestManager sharedManager];
  id v10 = [(GKService *)self clientProxy];
  id v11 = [v10 bundleIdentifier];
  uint64_t v12 = [v11 dataUsingEncoding:4];

  id v25 = (void *)v12;
  id v13 = +[NSDictionary dictionaryWithObjectsAndKeys:v12, @"s", 0];
  long long v26 = v9;
  id v14 = [v9 pushToken];
  v29[0] = @"session-token";
  id v15 = [v8 sessionToken];
  v30[0] = v15;
  v29[1] = @"peer-id";
  id v16 = [v8 peerID];
  v30[1] = v16;
  v29[2] = @"peer-push-token";
  id v17 = [v8 peerPushToken];

  v30[2] = v17;
  void v29[3] = @"self-push-token";
  id v18 = v14;
  if (!v14)
  {
    id v18 = +[NSData data];
  }
  v30[3] = v18;
  void v29[4] = @"reason";
  id v19 = +[NSNumber numberWithInteger:a4];
  void v29[5] = @"client-data";
  v30[4] = v19;
  v30[5] = v13;
  id v20 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:6];

  if (!v14) {
  id v21 = +[GKNetworkRequestManager commonNetworkRequestManager];
  }
  id v22 = [(GKService *)self clientProxy];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000955B0;
  void v27[3] = &unk_1002D3F48;
  id v28 = v7;
  id v23 = v7;
  [v21 issueRequest:v20 bagKey:@"gk-invitation-reject" clientProxy:v22 handler:v27];
}

- (void)getAcceptedGameInviteWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKMultiplayerMatchService.m", 1624, "-[GKMultiplayerMatchService getAcceptedGameInviteWithHandler:]");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000956B0;
  v7[3] = &unk_1002D3C38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  +[GKActivity named:v5 execute:v7];
}

- (void)hasCanceledMultiplayerInitiateBulletinForSessionToken:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id))a4;
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  id v8 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKMultiplayerMatchService: hasCanceledMultiplayerInitiateBulletinForSessionToken", v12, 2u);
  }
  id v9 = +[GKBulletinController sharedController];
  id v10 = [v9 acceptedInviteManager];
  id v11 = [v10 removeAndReturnQueuedCancelledInviteWithSessionToken:v5];
  if (v6) {
    v6[2](v6, v11);
  }
}

- (void)getPlayersToInviteWithHandlerV2:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKMultiplayerMatchService.m", 1690, "-[GKMultiplayerMatchService getPlayersToInviteWithHandlerV2:]");
  id v6 = [(GKService *)self transactionGroupWithName:v5];

  id v7 = [v6 context];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100095E6C;
  v14[3] = &unk_1002D3B38;
  v14[4] = self;
  id v8 = v6;
  id v15 = v8;
  [v7 performBlockAndWait:v14];

  if (v4)
  {
    id v9 = [(GKService *)self clientProxy];
    id v10 = [v9 replyQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100095FCC;
    v11[3] = &unk_1002D3930;
    id v13 = v4;
    id v12 = v8;
    [v12 notifyOnQueue:v10 block:v11];
  }
}

- (void)getInviteSessionTokenWithHandler:(id)a3
{
  id v4 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_100089E90;
  v13[4] = sub_100089EA0;
  id v14 = 0;
  id v5 = [(GKService *)self clientProxy];
  id v6 = [v5 inviteSession];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10009617C;
  v9[3] = &unk_1002D82E8;
  id v12 = v13;
  id v7 = v6;
  id v10 = v7;
  id v8 = v4;
  id v11 = v8;
  [v7 performAsync:v9];

  _Block_object_dispose(v13, 8);
}

- (void)removeInviteSession
{
  id v2 = [(GKService *)self clientProxy];
  [v2 deleteInviteSession];
}

- (void)removeInviteSessionIfNeeded
{
  v3 = [(GKService *)self clientProxy];
  id v4 = [v3 fetchOrCreateInviteSession];
  unsigned int v5 = [v4 shouldBeCleared];

  if (v5)
  {
    if (!os_log_GKGeneral) {
      id v6 = (id)GKOSLoggers();
    }
    id v7 = (void *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      id v8 = v7;
      id v9 = [(GKService *)self clientProxy];
      id v10 = [v9 inviteSession];
      id v11 = [(GKService *)self clientProxy];
      id v12 = [v11 inviteSession];
      id v13 = [v12 sessionToken];
      int v15 = 138412546;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "ClientProxy should clear inviteSession: %@, token: %@", (uint8_t *)&v15, 0x16u);
    }
    id v14 = [(GKService *)self clientProxy];
    [v14 deleteInviteSession];
  }
}

- (void)sendReconnectInvitation:(id)a3 toPlayer:(id)a4 connectionData:(id)a5 sessionToken:(id)a6 pushToken:(id)a7 handler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = +[GKDataRequestManager sharedManager];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10009653C;
  void v27[3] = &unk_1002D8310;
  id v28 = v14;
  id v29 = v16;
  id v30 = self;
  id v31 = v17;
  id v32 = v15;
  id v33 = v18;
  id v34 = v19;
  id v21 = v19;
  id v22 = v18;
  id v23 = v15;
  id v24 = v17;
  id v25 = v16;
  id v26 = v14;
  [v20 getValidNATTypeWithForceRelay:0 withHandler:v27];
}

- (void)sendInvitationUpdate:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v45 = a4;
  id v6 = +[NSMutableArray array];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = [v5 playerTokenMap];
  long long v49 = v5;
  id v50 = [obj countByEnumeratingWithState:&v63 objects:v76 count:16];
  if (v50)
  {
    uint64_t v48 = *(void *)v64;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v64 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v51 = v7;
        uint64_t v8 = *(void *)(*((void *)&v63 + 1) + 8 * v7);
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v9 = [v5 playerTokenMap];
        id v10 = [v9 objectForKeyedSubscript:v8];

        id v11 = [v10 countByEnumeratingWithState:&v59 objects:v75 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v60;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v60 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v59 + 1) + 8 * i);
              v73[0] = @"id";
              v73[1] = @"push-token";
              v74[0] = v8;
              v74[1] = v15;
              id v16 = +[NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:2];
              [v6 addObject:v16];
            }
            id v12 = [v10 countByEnumeratingWithState:&v59 objects:v75 count:16];
          }
          while (v12);
        }

        uint64_t v7 = v51 + 1;
        id v5 = v49;
      }
      while ((id)(v51 + 1) != v50);
      id v50 = [obj countByEnumeratingWithState:&v63 objects:v76 count:16];
    }
    while (v50);
  }

  v71[0] = @"bundle-id";
  id v17 = [(GKService *)self clientProxy];
  id v18 = [v17 bundleIdentifier];
  v72[0] = v18;
  v71[1] = GKSuggestedTransportVersionPushShortKey;
  id v19 = [v5 transportVersionToUse];
  v72[1] = v19;
  v71[2] = GKInviteSessionIDKey;
  id v20 = [v5 sessionID];
  v72[2] = v20;
  +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:3];
  v22 = id v21 = v5;
  long long v52 = +[NSMutableDictionary dictionaryWithDictionary:v22];

  v69[0] = @"session-token";
  id v23 = [v21 sessionToken];
  v70[0] = v23;
  v69[1] = @"self-push-token";
  id v24 = +[GKDataRequestManager sharedManager];
  id v25 = [v24 pushToken];
  id v26 = v25;
  if (!v25)
  {
    id v26 = +[NSData data];
  }
  v70[1] = v26;
  v69[2] = @"reason";
  id v27 = +[NSNumber numberWithInt:3];
  v69[3] = @"peers";
  v70[2] = v27;
  v70[3] = v6;
  id v28 = +[NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:4];
  id v29 = +[NSMutableDictionary dictionaryWithDictionary:v28];

  if (!v25) {
  id v30 = [v49 matchID];
  }

  if (v30)
  {
    id v31 = [v49 matchID];
    [v52 setObject:v31 forKeyedSubscript:GKMatchmakerMatchID];
  }
  id v32 = [v49 playerTokenMap];

  if (v32)
  {
    id v33 = [v49 playerTokenMap];
    [v52 setObject:v33 forKeyedSubscript:GKTransportPlayerTokenMapKey];
  }
  id v34 = +[NSMutableArray array];
  id v35 = [v49 gameParticipants];
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_100097288;
  v57[3] = &unk_1002D8338;
  id v36 = v34;
  id v58 = v36;
  [v35 enumerateObjectsUsingBlock:v57];

  if ([v36 count]) {
    [v52 setObject:v36 forKey:GKInviteGameParticipantsKey];
  }
  id v37 = +[NSMutableArray array];
  char v38 = [v49 lobbyParticipants];
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  void v55[2] = sub_1000972E0;
  v55[3] = &unk_1002D8338;
  id v39 = v37;
  id v56 = v39;
  [v38 enumerateObjectsUsingBlock:v55];

  if ([v39 count]) {
    [v52 setObject:v39 forKey:GKInviteLobbyParticipantsKey];
  }
  [v29 setObject:v52 forKeyedSubscript:@"client-data"];
  if (!os_log_GKGeneral) {
    id v40 = (id)GKOSLoggers();
  }
  id v41 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138412290;
    __int16 v68 = v29;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Sending invitation update with request: %@", buf, 0xCu);
  }
  long long v42 = +[GKNetworkRequestManager commonNetworkRequestManager];
  long long v43 = [(GKService *)self clientProxy];
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100097338;
  v53[3] = &unk_1002D3F48;
  id v54 = v45;
  id v44 = v45;
  [v42 issueRequest:v29 bagKey:@"gk-invitation-send" clientProxy:v43 handler:v53];
}

- (void)requestTTRLogsWith:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v49 = a4;
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  uint64_t v8 = (void *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    id v10 = [(GKService *)self clientProxy];
    id v11 = [v10 bundleIdentifier];
    *(_DWORD *)id buf = 138412546;
    id v68 = v6;
    __int16 v69 = 2112;
    v70 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Request TTRLogsWith: %@, for client proxy: %@", buf, 0x16u);
  }
  uint64_t v48 = self;
  id v12 = +[NSMutableArray array];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v13 = [v6 playersAndPushTokens];
  id v14 = [v13 countByEnumeratingWithState:&v56 objects:v66 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v57;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v57 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = [*(id *)(*((void *)&v56 + 1) + 8 * i) serverRepresentation];
        [v12 addObject:v18];
      }
      id v15 = [v13 countByEnumeratingWithState:&v56 objects:v66 count:16];
    }
    while (v15);
  }
  uint64_t v51 = v6;

  v64[0] = @"session-token";
  id v19 = +[NSData data];
  v65[0] = v19;
  v64[1] = @"self-push-token";
  id v20 = +[GKDataRequestManager sharedManager];
  id v21 = [v20 pushToken];
  id v22 = v21;
  if (!v21)
  {
    id v22 = +[NSData data];
  }
  v65[1] = v22;
  v64[2] = @"reason";
  id v23 = +[NSNumber numberWithInt:100];
  v65[2] = v23;
  v65[3] = v12;
  v64[3] = @"peers";
  void v64[4] = GKTTRBulletinKeyRadarID;
  uint64_t v47 = GKTTRBulletinKeyRadarID;
  id v24 = [v6 radarID];
  v65[4] = v24;
  id v25 = +[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:5];
  id v50 = +[NSMutableDictionary dictionaryWithDictionary:v25];

  if (!v21) {
  v54[0] = _NSConcreteStackBlock;
  }
  v54[1] = 3221225472;
  v54[2] = sub_100097AA0;
  v54[3] = &unk_1002D45D8;
  id v26 = v49;
  id v55 = v26;
  id v27 = objc_retainBlock(v54);
  uint64_t v28 = [v51 radarID];
  id v29 = v51;
  if (v28
    && (id v30 = (void *)v28,
        [v51 requesterAlias],
        id v31 = objc_claimAutoreleasedReturnValue(),
        v31,
        v30,
        v31))
  {
    v60[0] = v47;
    id v32 = [v51 radarID];
    v61[0] = v32;
    v60[1] = GKTTRBulletinKeyRequesterPlayerAlias;
    id v33 = [v51 requesterAlias];
    v61[1] = v33;
    id v34 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:2];

    id v35 = v50;
    [v50 setObject:v34 forKeyedSubscript:@"client-data"];
    if (!os_log_GKGeneral) {
      id v36 = (id)GKOSLoggers();
    }
    id v37 = (void *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      char v38 = v37;
      id v39 = [(GKService *)v48 clientProxy];
      *(_DWORD *)id buf = 138412546;
      id v68 = v50;
      __int16 v69 = 2112;
      v70 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Sending TTRLogs with request: %@, self.clientProxy: %@", buf, 0x16u);
    }
    id v40 = +[GKNetworkRequestManager commonNetworkRequestManager];
    id v41 = [(GKService *)v48 clientProxy];
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_100097B30;
    v52[3] = &unk_1002D3F48;
    id v53 = v27;
    [v40 issueRequest:v50 bagKey:@"gk-invitation-send" clientProxy:v41 handler:v52];
  }
  else
  {
    uint64_t v42 = GKInternalErrorDomain;
    CFStringRef v62 = @"reason";
    long long v43 = [v51 radarID];
    id v44 = [v51 requesterAlias];
    id v45 = +[NSString stringWithFormat:@"Invalid GKTTRLogRequestInfo(radarID: %@, requesterAlias: %@)", v43, v44];
    long long v63 = v45;
    id v46 = +[NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    id v34 = +[NSError errorWithDomain:v42 code:900 userInfo:v46];

    id v29 = v51;
    ((void (*)(void *, void *))v27[2])(v27, v34);
    id v35 = v50;
  }
}

- (void)_performRelayAction:(id)a3 request:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKMultiplayerMatchService.m", 1905, "-[GKMultiplayerMatchService _performRelayAction:request:handler:]");
  id v12 = +[GKDispatchGroup dispatchGroupWithName:v11];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100097E1C;
  v23[3] = &unk_1002D48B0;
  id v24 = v9;
  id v25 = v8;
  id v26 = self;
  id v13 = v12;
  id v27 = v13;
  id v14 = v8;
  id v15 = v9;
  [v13 perform:v23];
  uint64_t v16 = [(GKService *)self clientProxy];
  id v17 = [v16 replyQueue];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  void v20[2] = sub_100097F88;
  v20[3] = &unk_1002D3930;
  id v21 = v13;
  id v22 = v10;
  id v18 = v13;
  id v19 = v10;
  [v18 notifyOnQueue:v17 block:v20];
}

- (void)initiateRelayRequest:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[GKDataRequestManager sharedManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100098100;
  v11[3] = &unk_1002D8360;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 getValidNATTypeWithForceRelay:0 withHandler:v11];
}

- (void)updateRelayRequest:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[GKDataRequestManager sharedManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10009837C;
  v11[3] = &unk_1002D8360;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 getValidNATTypeWithForceRelay:0 withHandler:v11];
}

- (void)cancelRelayRequest:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  id v9 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "relayCancel serverRequest:%@", (uint8_t *)&v11, 0xCu);
  }
  [(GKMultiplayerMatchService *)self _performRelayAction:@"gk-invitation-relay-cancel" request:v6 handler:v7];
  id v10 = +[GKReporter reporter];
  [v10 reportEvent:GKReporterDomainRelay type:GKReporterRelayCancel];
}

- (void)updateCacheWithNearbyProfileDictionary:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKMultiplayerMatchService.m", 1970, "-[GKMultiplayerMatchService updateCacheWithNearbyProfileDictionary:handler:]");
  id v9 = [(GKService *)self transactionGroupWithName:v8];

  id v10 = [v7 objectForKey:@"profile"];

  int v11 = [v10 objectForKey:@"playerID"];
  if (v11)
  {
    id v12 = [v9 context];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100098860;
    v18[3] = &unk_1002D4888;
    id v19 = v11;
    id v20 = v9;
    id v21 = v10;
    [v12 performBlockAndWait:v18];
  }
  if (v6)
  {
    id v13 = [(GKService *)self clientProxy];
    id v14 = [v13 replyQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100098C30;
    v15[3] = &unk_1002D3930;
    id v17 = v6;
    id v16 = v9;
    [v16 notifyOnQueue:v14 block:v15];
  }
}

- (void)startNearbyBrowsingWithPlayerID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  id v9 = (void *)os_log_GKFastSync;
  if (os_log_type_enabled(os_log_GKFastSync, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    int v11 = [(GKService *)self clientProxy];
    id v12 = [v11 peerDiscovery];
    *(_DWORD *)id buf = 138412290;
    uint64_t v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "peerDiscovery (%@) startBrowsing", buf, 0xCu);
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100098F18;
  v25[3] = &unk_1002D3A20;
  id v13 = v7;
  id v26 = v13;
  id v14 = objc_retainBlock(v25);
  id v15 = +[GKPreferences shared];
  unsigned __int8 v16 = [v15 disableViceroyNearby];

  if ((v16 & 1) == 0)
  {
    id v17 = [(GKService *)self clientProxy];
    id v18 = [v17 nearbyDiscovery];
    [v18 startBrowsingWithPlayerID:v6];
  }
  id v19 = +[GKPreferences shared];
  unsigned int v20 = [v19 fastSyncTransportEnabled];

  if (v20)
  {
    id v21 = [(GKService *)self clientProxy];
    id v22 = [v21 peerDiscovery];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100098FA4;
    v23[3] = &unk_1002D3A20;
    id v24 = v14;
    [v22 startBrowsingWithCompletionHandler:v23];
  }
  else
  {
    ((void (*)(void *))v14[2])(v14);
  }
}

- (void)stopNearbyBrowsingWithHandler:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = (void *)os_log_GKFastSync;
  if (os_log_type_enabled(os_log_GKFastSync, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    id v8 = [(GKService *)self clientProxy];
    id v9 = [v8 peerDiscovery];
    *(_DWORD *)id buf = 138412290;
    id v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "peerDiscovery (%@) stopBrowsing", buf, 0xCu);
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10009922C;
  v22[3] = &unk_1002D3A20;
  id v10 = v4;
  id v23 = v10;
  int v11 = objc_retainBlock(v22);
  id v12 = +[GKPreferences shared];
  unsigned __int8 v13 = [v12 disableViceroyNearby];

  if ((v13 & 1) == 0)
  {
    id v14 = [(GKService *)self clientProxy];
    id v15 = [v14 nearbyDiscovery];
    [v15 stopBrowsing];
  }
  unsigned __int8 v16 = +[GKPreferences shared];
  unsigned int v17 = [v16 fastSyncTransportEnabled];

  if (v17)
  {
    id v18 = [(GKService *)self clientProxy];
    id v19 = [v18 peerDiscovery];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    void v20[2] = sub_1000992B8;
    v20[3] = &unk_1002D3A20;
    id v21 = v11;
    [v19 stopBrowsingWithCompletionHandler:v20];
  }
  else
  {
    ((void (*)(void *))v11[2])(v11);
  }
}

- (void)startNearbyAdvertisingWithDiscoveryInfo:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  id v9 = (void *)os_log_GKFastSync;
  if (os_log_type_enabled(os_log_GKFastSync, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    int v11 = [(GKService *)self clientProxy];
    id v12 = [v11 peerDiscovery];
    *(_DWORD *)id buf = 138412290;
    id v30 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "peerDiscovery (%@) startListening", buf, 0xCu);
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100099588;
  void v27[3] = &unk_1002D45D8;
  id v13 = v7;
  id v28 = v13;
  id v14 = objc_retainBlock(v27);
  id v15 = +[GKPreferences shared];
  unsigned __int8 v16 = [v15 disableViceroyNearby];

  if (v16)
  {
    unsigned int v17 = 0;
  }
  else
  {
    id v18 = [(GKService *)self clientProxy];
    id v19 = [v18 nearbyDiscovery];
    unsigned int v17 = [v19 startAdvertisingWithDiscoveryInfo:v6];
  }
  unsigned int v20 = +[GKPreferences shared];
  unsigned int v21 = [v20 fastSyncTransportEnabled];

  if (v21)
  {
    id v22 = [(GKService *)self clientProxy];
    id v23 = [v22 peerDiscovery];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100099614;
    v24[3] = &unk_1002D3930;
    id v26 = v14;
    id v25 = v17;
    [v23 startListening:v6 completionHandler:v24];
  }
  else
  {
    ((void (*)(void *, void *))v14[2])(v14, v17);
  }
}

- (void)stopNearbyAdvertisingWithHandler:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = (void *)os_log_GKFastSync;
  if (os_log_type_enabled(os_log_GKFastSync, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    id v8 = [(GKService *)self clientProxy];
    id v9 = [v8 peerDiscovery];
    *(_DWORD *)id buf = 138412290;
    id v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "peerDiscovery (%@) stopListening", buf, 0xCu);
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000998A0;
  v22[3] = &unk_1002D3A20;
  id v10 = v4;
  id v23 = v10;
  int v11 = objc_retainBlock(v22);
  id v12 = +[GKPreferences shared];
  unsigned __int8 v13 = [v12 disableViceroyNearby];

  if ((v13 & 1) == 0)
  {
    id v14 = [(GKService *)self clientProxy];
    id v15 = [v14 nearbyDiscovery];
    [v15 stopAdvertising];
  }
  unsigned __int8 v16 = +[GKPreferences shared];
  unsigned int v17 = [v16 fastSyncTransportEnabled];

  if (v17)
  {
    id v18 = [(GKService *)self clientProxy];
    id v19 = [v18 peerDiscovery];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    void v20[2] = sub_10009992C;
    v20[3] = &unk_1002D3A20;
    unsigned int v21 = v11;
    [v19 stopListeningWithCompletionHandler:v20];
  }
  else
  {
    ((void (*)(void *))v11[2])(v11);
  }
}

- (void)presentNearbyInvite:(id)a3
{
  id v3 = a3;
  id v4 = +[GKDataRequestManager sharedManager];
  [v4 presentNearbyInvite:v3];
}

- (void)nearbyInviteWasCancelled:(id)a3
{
  id v3 = a3;
  id v4 = +[GKDataRequestManager sharedManager];
  [v4 nearbyInviteWasCancelled:v3];
}

- (void)fetchDevicePushToken:(id)a3
{
  id v3 = (void (**)(id, void *))a3;
  if (!os_log_GKGeneral) {
    id v4 = (id)GKOSLoggers();
  }
  id v5 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKMultiplayerMatchService fetchDevicePushToken", v8, 2u);
  }
  id v6 = +[GKDataRequestManager sharedManager];
  id v7 = [v6 pushToken];

  v3[2](v3, v7);
}

- (void)fetchOnDeviceMultiplayerBundleIDsForNewBundleID:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  id v8 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138412290;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "fetchOnDeviceMultiplayerBundleIDsForNewBundleID: %@", buf, 0xCu);
  }
  id v9 = +[GKClientProxy gameCenterClient];
  id v10 = +[GKService serviceWithTransport:0 forClient:v9 localPlayer:0];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100099C5C;
  v12[3] = &unk_1002D4F88;
  id v13 = v6;
  id v11 = v6;
  [v10 getOnDeviceMultiplayerGamesForBundleIDs:v5 handler:v12];
}

- (void)fetchOnDeviceMultiplayerBundleIDsWithHandler:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "fetchOnDeviceMultiplayerBundleIDsWithHandler", (uint8_t *)&v16, 2u);
  }
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  id v8 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412290;
    unsigned int v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ Scanning installed apps", (uint8_t *)&v16, 0xCu);
  }
  id v9 = +[GKApplicationWorkspace defaultWorkspace];
  id v10 = [v9 availableGameIdentifiers];
  id v11 = [v10 count];
  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers();
  }
  id v13 = (void *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    id v14 = v13;
    id v15 = +[NSNumber numberWithUnsignedInteger:v11];
    int v16 = 138412290;
    unsigned int v17 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "found %@ installed Game Center games.", (uint8_t *)&v16, 0xCu);
  }
  [(GKMultiplayerMatchService *)self fetchOnDeviceMultiplayerBundleIDsForNewBundleID:v10 handler:v4];
}

- (void)isGameCenterMultiplayerGameForBundleID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  id v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138412290;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "isGameCenterMultiplayerGameForBundleID, bundleID: %@", buf, 0xCu);
  }
  id v16 = v6;
  id v10 = +[NSArray arrayWithObjects:&v16 count:1];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10009A0FC;
  v13[3] = &unk_1002D4F38;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [(GKMultiplayerMatchService *)self fetchOnDeviceMultiplayerBundleIDsForNewBundleID:v10 handler:v13];
}

- (void)fetchTransportOverrideWithHandler:(id)a3
{
  id v3 = (void (**)(id, void *, void *, id))a3;
  if (!os_log_GKGeneral) {
    id v4 = (id)GKOSLoggers();
  }
  id v5 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "fetchTransportOverrideWithHandler", v11, 2u);
  }
  id v6 = +[GKPreferences shared];
  id v7 = [v6 forceEnabledTransportVersions];
  id v8 = +[GKPreferences shared];
  id v9 = [v8 forceDisabledTransportVersions];
  id v10 = +[GKPreferences shared];
  v3[2](v3, v7, v9, [v10 multiplayerHealthCheckEnabled]);
}

- (void)setupNearbyDiscovery
{
  id v3 = +[GKPreferences shared];
  unsigned int v4 = [v3 disableViceroyNearby];

  if (v4)
  {
    if (!os_log_GKGeneral) {
      id v5 = (id)GKOSLoggers();
    }
    id v6 = os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Viceroy nearby is disabled. Stop setting up nearby discovery.", buf, 2u);
    }
  }
  else
  {
    id v7 = [(GKService *)self clientProxy];
    id v8 = [v7 bundleIdentifier];

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    void v21[2] = sub_10009A4D4;
    v21[3] = &unk_1002D83B0;
    id v9 = v8;
    id v22 = v9;
    id v10 = objc_retainBlock(v21);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10009A7C8;
    v19[3] = &unk_1002D8400;
    id v11 = v9;
    id v20 = v11;
    id v12 = objc_retainBlock(v19);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10009A9DC;
    v17[3] = &unk_1002D8428;
    id v18 = v11;
    id v13 = v11;
    id v14 = objc_retainBlock(v17);
    id v15 = [(GKService *)self clientProxy];
    id v16 = [v15 nearbyDiscovery];
    [v16 setupWithPlayerFoundHandler:v10 playerLostHandler:v12 receiveDataHandler:v14];
  }
}

- (void)forgetParticipant:(id)a3 deviceID:(id)a4 handler:(id)a5
{
  id v8 = (void (**)(void))a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(GKService *)self clientProxy];
  id v12 = [v11 nearbyDiscovery];
  [v12 forgetParticipant:v10 deviceID:v9];

  if (v8)
  {
    v8[2](v8);
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v13 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      sub_10009C428();
    }
  }
}

- (void)sendDataToParticipant:(id)a3 deviceID:(id)a4 data:(id)a5 usePeerDiscovery:(BOOL)a6 handler:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (!os_log_GKGeneral) {
    id v16 = (id)GKOSLoggers();
  }
  unsigned int v17 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    CFStringRef v18 = @"bonjour in Viceoroy";
    if (v8) {
      CFStringRef v18 = @"bonjour in gamed";
    }
    *(_DWORD *)id buf = 138412290;
    CFStringRef v30 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Sending data to nearby participant with %@", buf, 0xCu);
  }
  id v19 = [(GKService *)self clientProxy];
  id v20 = v19;
  if (v8)
  {
    unsigned int v21 = [v19 peerDiscovery];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10009AF40;
    void v27[3] = &unk_1002D45D8;
    id v22 = &v28;
    id v28 = v15;
    id v23 = v15;
    [v21 sendDataToParticipant:v12 deviceID:v13 data:v14 completionHandler:v27];
  }
  else
  {
    unsigned int v21 = [v19 nearbyDiscovery];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10009AF5C;
    v25[3] = &unk_1002D45D8;
    id v22 = &v26;
    id v26 = v15;
    id v24 = v15;
    [v21 sendDataToParticipant:v12 deviceID:v13 data:v14 handler:v25];
  }
}

- (void)revokePseudonym:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKMultiplayerMatchService *)self pseudonymManager];
  [v8 revokePseudonym:v7 completionHandler:v6];
}

- (void)validateRequests:(id)a3 andFileMultiplayerTTRIfNeededWithContext:(id)a4
{
  id v8 = a4;
  id v6 = [a3 objectForKey:GKSupportedTransportVersionsKey];
  unsigned int v7 = [v6 containsObject:&off_1002F2000];

  if (v7) {
    [(GKMultiplayerMatchService *)self fileMultiplayerTTRWithCallBackIdentifier:&stru_1002E4F58 descriptionAddition:v8 handler:&stru_1002D8448];
  }
}

- (void)fileMultiplayerTTRWithCallBackIdentifier:(id)a3 descriptionAddition:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  id v11 = +[GKPreferences shared];
  unsigned int v12 = [v11 isInternalBuild];

  if (v12)
  {
    if (!os_log_GKGeneral) {
      id v13 = (id)GKOSLoggers();
    }
    id v14 = os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id buf = 138412290;
      id v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "GKMultiplayerService fileMultiplayerTTR with callbackIdentifier: %@", buf, 0xCu);
    }
    uint64_t v21 = GKTTRBulletinKeyType;
    id v22 = &off_1002F2018;
    id v15 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v16 = +[NSMutableDictionary dictionaryWithDictionary:v15];

    unsigned int v17 = [(GKMultiplayerMatchService *)self ttrHelper];
    CFStringRef v18 = [v17 getURLForNewMultiplayerRadarWithCallbackIdentifier:v8 descriptionAddition:v9];

    if (v18) {
      [v16 setObject:v18 forKeyedSubscript:GKTTRBulletinKeyURL];
    }
    if (v9) {
      [v16 setObject:v9 forKeyedSubscript:GKTTRBulletinKeySubtitle];
    }
    id v19 = +[GKTTRInitiationBulletin packFakeTTRBulletinWithInfo:v16];
    id v20 = +[GKDataRequestManager sharedManager];
    [v20 processIncomingTTR:v19];

    v10[2](v10);
  }
}

- (void)uploadLogsForRadar:(id)a3 from:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  id v11 = +[GKPreferences shared];
  unsigned int v12 = [v11 isInternalBuild];

  if (v12)
  {
    if (!os_log_GKGeneral) {
      id v13 = (id)GKOSLoggers();
    }
    id v14 = os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "GKMultiplayerServicePrivate uploadLogsForRadar:", v21, 2u);
    }
    v22[0] = GKTTRBulletinKeyType;
    v22[1] = GKTTRBulletinKeyRadarID;
    v23[0] = &off_1002F2018;
    v23[1] = v8;
    v22[2] = GKTTRBulletinKeyRequesterPlayerAlias;
    v23[2] = v9;
    id v15 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
    id v16 = +[NSMutableDictionary dictionaryWithDictionary:v15];

    unsigned int v17 = [(GKMultiplayerMatchService *)self ttrHelper];
    CFStringRef v18 = [v17 getURLForExistingMultiplayerRadarWithRadarID:v8];

    if (v18) {
      [v16 setObject:v18 forKeyedSubscript:GKTTRBulletinKeyURL];
    }
    id v19 = +[GKTTRUploadRequestBulletin packFakeTTRBulletinWithInfo:v16];
    id v20 = +[GKDataRequestManager sharedManager];
    [v20 processIncomingTTR:v19];

    v10[2](v10);
  }
}

- (void)setPseudonymManager:(id)a3
{
}

- (void)setTtrHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttrHelper, 0);

  objc_storeStrong((id *)&self->_pseudonymManager, 0);
}

@end