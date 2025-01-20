@interface GKDataRequestManager
+ (BOOL)allowSelfSignedCertForEnvironment:(int64_t)a3;
+ (id)clientQueue;
+ (id)pushQueue;
+ (id)ratingsQueue;
+ (id)sharedManager;
+ (id)statsQueue;
+ (id)syncQueue;
- (APSConnection)activePushConnection;
- (APSConnection)apsConnection;
- (APSConnection)pushConnectionDev;
- (APSConnection)pushConnectionProd;
- (BOOL)hasValidNATSettings;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)pushUpdatesBusy;
- (BOOL)receivesMemoryWarnings;
- (GKApplicationStateMonitor)applicationStateMonitor;
- (GKDataRequestManager)init;
- (GKReachability)reachability;
- (GKWidgetEventListener)widgetEventListner;
- (NSCountedSet)transactionCounts;
- (NSData)pushToken;
- (NSDate)lastNATTypeCheckDate;
- (NSDate)nearbyQueryLastCheckDate;
- (NSDictionary)commonNATSettings;
- (NSMutableDictionary)transactionBag;
- (NSMutableSet)removedApp;
- (NSString)authenticatingWithSettingsBundleID;
- (_TtC14GameDaemonCore18GKGameModeListener)gameModeListener;
- (double)nearbyQueryAllowance;
- (id)ampController;
- (id)pushConnectionForEnvironment:(int64_t)a3;
- (id)storeBag;
- (id)updateRequestWithPushToken:(id)a3;
- (int64_t)activePushEnvironment;
- (int64_t)currentEnvironment;
- (int64_t)preferredEnvironment;
- (unint64_t)natType;
- (void)_clearPushConnections;
- (void)_setActivePushEnvironment:(int64_t)a3;
- (void)_setPushToken:(id)a3;
- (void)_updateNotificationTopicsForcefully:(BOOL)a3;
- (void)_updatePushEnvironmentWithStoreBag:(id)a3;
- (void)appStateChanged:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)applicationsWillUninstall:(id)a3;
- (void)awaitNATSettingsAndUpdateIfNeededWithCompletionHandler:(id)a3;
- (void)beginTransaction:(id)a3;
- (void)beginTransaction:(id)a3 completion:(id)a4;
- (void)clearAllNearbyInvites;
- (void)clearPushEnvironment;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)credentialsDidChange:(id)a3;
- (void)dealloc;
- (void)endTransaction:(id)a3;
- (void)finishStartup;
- (void)gameCenterDidBecomeRestricted;
- (void)getValidNATTypeWithForceRelay:(BOOL)a3 withHandler:(id)a4;
- (void)handleNearbyInviteResponse:(id)a3;
- (void)iCloudAccountAvailabilityChanged:(id)a3;
- (void)loadLocalizedGameNameForBundleID:(id)a3 handler:(id)a4;
- (void)nearbyInviteWasCancelled:(id)a3;
- (void)performAsync:(id)a3;
- (void)performSync:(id)a3;
- (void)presentNearbyInvite:(id)a3;
- (void)processIncomingMessage:(id)a3;
- (void)processIncomingiMessageInvite:(id)a3;
- (void)reachabilityDidChange:(id)a3;
- (void)resetEnvironment;
- (void)resetEnvironmentWithHandler:(id)a3;
- (void)sendPushTokenWithReplyQueue:(id)a3;
- (void)sendPushTokenWithReplyQueue:(id)a3 completion:(id)a4;
- (void)setActivePushEnvironment:(int64_t)a3;
- (void)setApplicationStateMonitor:(id)a3;
- (void)setApsConnection:(id)a3;
- (void)setAuthenticatingWithSettingsBundleID:(id)a3;
- (void)setCommonNATSettings:(id)a3;
- (void)setGameModeListener:(id)a3;
- (void)setLastNATTypeCheckDate:(id)a3;
- (void)setNatType:(unint64_t)a3;
- (void)setNearbyQueryAllowance:(double)a3;
- (void)setNearbyQueryLastCheckDate:(id)a3;
- (void)setPushConnectionDev:(id)a3;
- (void)setPushConnectionProd:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setPushUpdatesBusy:(BOOL)a3;
- (void)setReachability:(id)a3;
- (void)setReceivesMemoryWarnings:(BOOL)a3;
- (void)setRemovedApp:(id)a3;
- (void)setTransactionBag:(id)a3;
- (void)setTransactionCounts:(id)a3;
- (void)setUpCloudKitNotificationTopics;
- (void)setWidgetEventListner:(id)a3;
- (void)storeBagChanged:(id)a3;
- (void)synchronizeBagWithPreferences;
- (void)terminate;
- (void)terminateClient:(id)a3;
- (void)updateActivePushEnvironment;
- (void)updateCachedNATSettingsIfNeededWithCompletionHandler:(id)a3;
- (void)updateNotificationTopicsForceFully:(BOOL)a3;
@end

@implementation GKDataRequestManager

- (void)appStateChanged:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:GKApplicationStateKey];
  id v6 = [v5 integerValue];
  v7 = [v4 objectForKeyedSubscript:GKApplicationStateDisplayIDKey];
  v8 = [v4 objectForKeyedSubscript:GKApplicationStatePIDKey];
  id v9 = [v8 integerValue];

  v10 = +[GKClientProxy clientForBundleID:v7 pid:v9 createIfNecessary:v6 == 8];
  v11 = v10;
  if (v10
    && ([v10 isUIService] & 1) == 0
    && ([v11 isExtension] & 1) == 0)
  {
    if (!os_log_GKGeneral) {
      id v12 = (id)GKOSLoggers();
    }
    v13 = (void *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      v14 = v13;
      *(_DWORD *)buf = 138413058;
      v32 = v11;
      __int16 v33 = 1024;
      unsigned int v34 = [v11 applicationState];
      __int16 v35 = 1024;
      int v36 = (int)v6;
      __int16 v37 = 2112;
      id v38 = v4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "appState for client %@ changed from %d to %d -- userinfo = %@", buf, 0x22u);
    }
    [v11 setPreviousApplicationState:[v11 applicationState]];
    [v11 setApplicationState:v6];
    switch((int)v6)
    {
      case 1:
        v18 = +[GKPlayerCredentialController sharedController];
        v19 = [v18 primaryCredentialForEnvironment:[v11 environment]];

        if (v19)
        {
          v25 = _NSConcreteStackBlock;
          uint64_t v26 = 3221225472;
          v27 = sub_1001163E8;
          v28 = &unk_1002D3B38;
          v29 = self;
          id v30 = v11;
          [(GKDataRequestManager *)self performSync:&v25];
        }
        else
        {
          +[GKClientProxy removeClient:v11];
        }
        v20 = [v11 originalBundleIdentifier:v25, v26, v27, v28, v29];
        v21 = v20;
        if (v20)
        {
          id v22 = v20;
        }
        else
        {
          id v22 = [v11 bundleIdentifier];
        }
        v23 = v22;

        v24 = [(GKDataRequestManager *)self applicationStateMonitor];
        [v24 stopObservingStateChangesForBundleID:v23];

        break;
      case 2:
      case 4:
        if ([v11 isGameCenter]) {
          [(GKDataRequestManager *)self setAuthenticatingWithSettingsBundleID:0];
        }
        v15 = +[GKPlayerCredentialController sharedController];
        v16 = [v15 primaryCredentialForEnvironment:[v11 environment]];

        if (v16) {
          [v11 backgroundWithCompletionHandler:0];
        }
        v17 = +[GKService serviceWithTransport:0 forClient:v11 localPlayer:0];
        [v17 cancelOutstandingMatchRequestWithHandler:&stru_1002DB360];

        [(GKDataRequestManager *)self clearAllNearbyInvites];
        break;
      case 8:
        [v11 didEnterForeground];
        break;
      default:
        break;
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double Current = CFAbsoluteTimeGetCurrent();
  id v9 = [[GKEntitlements alloc] initWithConnection:v7];
  id v10 = [v7 processIdentifier];
  if (v10)
  {
    v11 = +[NSBundle _gkBundleIdentifierFromConnection:v7];
    if (!v11) {
      goto LABEL_17;
    }
    id v12 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v13 = (id)GKOSLoggers();
      id v12 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100118454();
    }
    v14 = +[GKClientProxy clientForBundleID:v11 pid:v10 createIfNecessary:1];
    [v14 setOriginalBundleIdentifier:v11];
    if (v14)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass)
      {
        uint64_t v16 = [(GKEntitlements *)v9 grandfatheredEntitlementsForSpoofedApps];

        id v9 = (GKEntitlements *)v16;
      }
      if ([(GKEntitlements *)v9 hasAnyEntitlement])
      {
        if (!os_log_GKGeneral) {
          id v17 = (id)GKOSLoggers();
        }
        v18 = (void *)os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          log = v18;
          v19 = [v14 bundleIdentifier];
          v20 = [v14 originalBundleIdentifier];
          *(_DWORD *)buf = 67110146;
          int v50 = (int)v10;
          __int16 v51 = 2112;
          v52 = v19;
          __int16 v53 = 2112;
          v54 = v20;
          __int16 v55 = 1024;
          int v56 = isKindOfClass & 1;
          __int16 v57 = 2112;
          v58 = v9;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "accepted client connection (pid:%d, bundleID:%@, originalBundleIdentifier: %@, isSpoofing:%d, entitlements:%@)", buf, 0x2Cu);
        }
        [v14 setEntitlements:v9];
        [v7 setExportedObject:v14];
        v21 = +[GKDaemonInterface interface];
        [v7 setExportedInterface:v21];

        id v22 = +[GKClientInterface interface];
        [v7 setRemoteObjectInterface:v22];

        objc_initWeak(&location, v7);
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_1001134E8;
        v45[3] = &unk_1002DB120;
        objc_copyWeak(&v47, &location);
        id v23 = v14;
        id v46 = v23;
        [v7 setInterruptionHandler:v45];
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_1001135EC;
        v41[3] = &unk_1002DB148;
        objc_copyWeak(&v44, &location);
        id v24 = v23;
        id v42 = v24;
        v43 = self;
        [v7 setInvalidationHandler:v41];
        [v24 setPid:v10];
        [v24 setConnection:v7];
        v25 = [v24 originalBundleIdentifier];
        uint64_t v26 = v25;
        if (v25)
        {
          id v27 = v25;
        }
        else
        {
          id v27 = [v24 bundleIdentifier];
        }
        id v10 = v27;

        int v36 = [(GKDataRequestManager *)self applicationStateMonitor];
        if ([v36 startObservingStateChangesForBundleID:v10]
          && [v24 applicationState] == 8)
        {
          [v24 didEnterForeground];
        }
        [v7 resume];
        if (!os_log_GKGeneral) {
          id v37 = (id)GKOSLoggers();
        }
        id v38 = os_log_GKPerf;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          double v39 = CFAbsoluteTimeGetCurrent();
          sub_100118410(v39, Current);
        }

        objc_destroyWeak(&v44);
        objc_destroyWeak(&v47);
        objc_destroyWeak(&location);

        LOBYTE(v10) = 1;
        goto LABEL_28;
      }
      if (!os_log_GKGeneral) {
        id v30 = (id)GKOSLoggers();
      }
      v31 = (void *)os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        v32 = v31;
        __int16 v33 = [v14 bundleIdentifier];
        unsigned int v34 = [v14 originalBundleIdentifier];
        *(_DWORD *)buf = 67109634;
        int v50 = (int)v10;
        __int16 v51 = 2112;
        v52 = v33;
        __int16 v53 = 2112;
        v54 = v34;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "rejected connection from client lacking any entitlement (pid:%d, bundleID:%@, originalBundleIdentifier: %@)", buf, 0x1Cu);
      }
    }
    else
    {
LABEL_17:
      if (!os_log_GKGeneral) {
        id v28 = (id)GKOSLoggers();
      }
      v29 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v50 = (int)v10;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Could not get client for pid (%d)", buf, 8u);
      }
      NSLog(@"Could not get client for pid (%d)", v10);
    }
    LOBYTE(v10) = 0;
LABEL_28:
  }
  return (char)v10;
}

- (id)storeBag
{
  return +[GKStoreBag storeBagForEnvironment:dataRequestManager:](GKStoreBag, "storeBagForEnvironment:dataRequestManager:", self->_currentEnvironment);
}

+ (id)sharedManager
{
  return (id)qword_100329830;
}

- (int64_t)currentEnvironment
{
  return self->_currentEnvironment;
}

- (GKApplicationStateMonitor)applicationStateMonitor
{
  return self->_applicationStateMonitor;
}

- (id)updateRequestWithPushToken:(id)a3
{
  id v4 = a3;
  v5 = [(GKDataRequestManager *)self pushToken];
  if (v5)
  {
    id v6 = [v4 mutableCopy];
    [v6 setObject:v5 forKey:@"push-token"];
  }
  else
  {
    id v6 = v4;
  }

  return v6;
}

- (void)presentNearbyInvite:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKDataRequestManager+Nearby: presentNearbyInvite", buf, 2u);
  }
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  v8 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "presenting nearby invite:%@", buf, 0xCu);
  }
  [(GKDataRequestManager *)self beginTransaction:@"presentNearbyInvite"];
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers();
  }
  id v10 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "begun presentNearbyInvite:", buf, 2u);
  }
  [v4 objectForKey:@"bundleID"];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100110240;
  v13[3] = &unk_1002DAFB0;
  v13[4] = self;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v4;
  id v11 = v4;
  id v12 = v14;
  [(GKDataRequestManager *)self loadLocalizedGameNameForBundleID:v12 handler:v13];
}

- (void)nearbyInviteWasCancelled:(id)a3
{
  id v3 = a3;
  if (!os_log_GKGeneral) {
    id v4 = (id)GKOSLoggers();
  }
  id v5 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKDataRequestManager: nearbyInviteWasCancelled", buf, 2u);
  }
  id v6 = [v3 objectForKey:@"playerID"];
  id v7 = [v3 objectForKey:@"deviceID"];
  v8 = [v3 objectForKey:@"bundleID"];
  uint64_t v9 = +[GKInviteInternal nearbyInviteIDForPlayerID:v6 deviceID:v7 bundleID:v8];
  id v10 = (void *)v9;
  if (v8 && v9)
  {
    if (!os_log_GKGeneral) {
      id v11 = (id)GKOSLoggers();
    }
    id v12 = os_log_GKTrace;
    if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "GKDataRequestManager: nearbyInviteWasCancelled - Telling Client", v14, 2u);
    }
    id v13 = +[GKClientProxy clientForBundleID:v8];
    [v13 cancelGameInvite:v10];
  }
}

- (void)handleNearbyInviteResponse:(id)a3
{
  id v3 = a3;
  if (!os_log_GKGeneral) {
    id v4 = (id)GKOSLoggers();
  }
  id v5 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    LOWORD(v24) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKDataRequestManager+Nearby: handleNearbyInviteResponse", (uint8_t *)&v24, 2u);
  }
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers();
  }
  id v7 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    int v24 = 138412290;
    id v25 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "nearby invite NC response: %@", (uint8_t *)&v24, 0xCu);
  }
  v8 = [v3 objectForKey:@"inviteDictionary"];
  uint64_t v9 = [v8 objectForKey:@"bundleID"];

  id v10 = +[GKClientProxy clientForBundleID:v9];
  if (v10)
  {
    id v11 = [v3 objectForKey:@"buttonPressed"];
    id v12 = [v11 integerValue];
    id v13 = [v3 objectForKey:@"type"];
    id v14 = [v13 integerValue];

    if (v14 == (id)1)
    {
      id v15 = [v3 objectForKey:@"inviteDictionary"];
      uint64_t v16 = +[NSMutableDictionary dictionaryWithDictionary:v15];

      id v17 = +[NSNumber numberWithBool:v12 != 0];
      [v16 setObject:v17 forKey:@"accepted"];

      if (!v12)
      {
        if (v11) {
          uint64_t v18 = 1;
        }
        else {
          uint64_t v18 = 3;
        }
        v19 = +[NSNumber numberWithInteger:v18];
        [v16 setObject:v19 forKey:@"declineReason"];
      }
      [v10 respondedToNearbyInvite:v16];
    }
    else
    {
      id v22 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v23 = (id)GKOSLoggers();
        id v22 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        sub_100110CF0((uint64_t)v3, (uint64_t)v14, v22);
      }
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v20 = (id)GKOSLoggers();
    }
    v21 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_100110C78((uint64_t)v3, v21);
    }
  }
}

- (void)clearAllNearbyInvites
{
  if (!os_log_GKGeneral) {
    id v2 = (id)GKOSLoggers();
  }
  id v3 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "GKDataRequestManager+Nearby: clearAllNearbyInvites", buf, 2u);
  }
  id v4 = +[GKBulletinController sharedController];
  id v5 = [v4 getBulletinsOfType:objc_opt_class()];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [v5 objectForKey:*(void *)(*((void *)&v11 + 1) + 8 * (void)v9)];
        [v4 withdrawBulletin:v10];

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

+ (id)clientQueue
{
  return (id)qword_100329828;
}

+ (id)pushQueue
{
  if (qword_100329840 != -1) {
    dispatch_once(&qword_100329840, &stru_1002DAFD0);
  }
  id v2 = (void *)qword_100329838;

  return v2;
}

+ (id)syncQueue
{
  if (qword_100329850 != -1) {
    dispatch_once(&qword_100329850, &stru_1002DAFF0);
  }
  id v2 = (void *)qword_100329848;

  return v2;
}

- (void)performSync:(id)a3
{
  dispatch_block_t block = a3;
  id v3 = [(id)objc_opt_class() syncQueue];
  id v4 = dispatch_get_current_queue();

  if (v4 == v3)
  {
    label = dispatch_queue_get_label(v3);
    id v6 = +[NSThread callStackSymbols];
    id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the same queue(\"%s\"), would deadlock at %@", "-[GKDataRequestManager performSync:]", label, v6);
    uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKDataRequestManager.m"];
    id v9 = [v8 lastPathComponent];
    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (dispatch_get_current_queue() != queue)\n[%s (%s:%d)]", v7, "-[GKDataRequestManager performSync:]", [v9 UTF8String], 313);

    +[NSException raise:@"GameKit Exception", @"%@", v10 format];
  }
  dispatch_sync(v3, block);
}

- (void)performAsync:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() syncQueue];
  dispatch_async(v4, v3);
}

- (GKDataRequestManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)GKDataRequestManager;
  id v2 = [(GKDataRequestManager *)&v7 init];
  id v3 = v2;
  if (v2)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100111290;
    v5[3] = &unk_1002D40E0;
    id v6 = v2;
    +[GKActivity named:@"gamed - init" execute:v5];
  }
  return v3;
}

- (void)iCloudAccountAvailabilityChanged:(id)a3
{
  id v3 = a3;
  if (!os_log_GKGeneral) {
    id v4 = (id)GKOSLoggers();
  }
  id v5 = os_log_GKAccount;
  if (os_log_type_enabled(os_log_GKAccount, OS_LOG_TYPE_DEBUG)) {
    sub_100117E04(v5);
  }
  +[GKCloudKitMultiplayer updateUserWithHandler:0];
}

- (void)reachabilityDidChange:(id)a3
{
  if ([(GKReachability *)self->_reachability _gkCurrentReachabilityStatus])
  {
    int64_t currentEnvironment = self->_currentEnvironment;
    +[GKClientProxy performDelayedRequestsForEnvironment:currentEnvironment];
  }
}

- (void)finishStartup
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100111560;
  v2[3] = &unk_1002D40E0;
  v2[4] = self;
  +[GKActivity named:@"gamed - finishStartup" execute:v2];
}

- (void)storeBagChanged:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Received store bag did change notification", buf, 2u);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001124D4;
  v8[3] = &unk_1002D3B38;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  [(GKDataRequestManager *)self performAsync:v8];
}

- (id)pushConnectionForEnvironment:(int64_t)a3
{
  uint64_t v3 = 72;
  if (a3 == 3) {
    uint64_t v3 = 80;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (APSConnection)activePushConnection
{
  int64_t v3 = [(GKDataRequestManager *)self activePushEnvironment];

  return (APSConnection *)[(GKDataRequestManager *)self pushConnectionForEnvironment:v3];
}

- (void)_updateNotificationTopicsForcefully:(BOOL)a3
{
  id v5 = [(id)objc_opt_class() syncQueue];
  id v6 = dispatch_get_current_queue();
  id v7 = v6;
  if (v6 != v5)
  {
    label = dispatch_queue_get_label(v6);
    id v9 = dispatch_queue_get_label(v5);
    id v10 = +[NSThread callStackSymbols];
    long long v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKDataRequestManager _updateNotificationTopicsForcefully:]", label, v9, v10);
    long long v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKDataRequestManager.m"];
    id v13 = [v12 lastPathComponent];
    long long v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_actualCurrentQueue == syncQueue)\n[%s (%s:%d)]", v11, "-[GKDataRequestManager _updateNotificationTopicsForcefully:]", [v13 UTF8String], 576);

    +[NSException raise:@"GameKit Exception", @"%@", v14 format];
  }

  if (a3 || ![(GKDataRequestManager *)self pushUpdatesBusy])
  {
    [(GKDataRequestManager *)self setPushUpdatesBusy:1];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100112BBC;
    v40[3] = &unk_1002D3B38;
    v41 = v5;
    id v42 = self;
    id v15 = objc_retainBlock(v40);
    if (!self->_activePushEnvironment)
    {
      [(GKDataRequestManager *)self _clearPushConnections];
LABEL_38:
      ((void (*)(void *))v15[2])(v15);
      goto LABEL_39;
    }
    -[GKDataRequestManager pushConnectionForEnvironment:](self, "pushConnectionForEnvironment:");
    uint64_t v16 = (APSConnection *)objc_claimAutoreleasedReturnValue();
    pushConnectionProd = self->_pushConnectionProd;
    if (v16 == pushConnectionProd) {
      pushConnectionProd = self->_pushConnectionDev;
    }
    double v39 = pushConnectionProd;
    if (!os_log_GKGeneral) {
      id v18 = (id)GKOSLoggers();
    }
    v19 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      if (v39 == self->_pushConnectionProd) {
        CFStringRef v20 = @"prod";
      }
      else {
        CFStringRef v20 = @"dev";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v46 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Clearing gamed topic for %@", buf, 0xCu);
    }
    v21 = +[NSArray array];
    CFStringRef v50 = @"com.apple.gamed";
    id v22 = +[NSArray arrayWithObjects:&v50 count:1];
    [(APSConnection *)v39 setEnabledTopics:v21 ignoredTopics:v22];

    if (!os_log_GKGeneral) {
      id v23 = (id)GKOSLoggers();
    }
    int v24 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      CFStringRef v25 = @"dev";
      if (v16 == self->_pushConnectionProd) {
        CFStringRef v25 = @"prod";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v46 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Enabling gamed topic for %@", buf, 0xCu);
    }
    CFStringRef v49 = @"com.apple.gamed";
    uint64_t v26 = +[NSArray arrayWithObjects:&v49 count:1];
    id v27 = +[NSArray array];
    [(APSConnection *)v16 setEnabledTopics:v26 ignoredTopics:v27];

    if (!os_log_GKGeneral) {
      id v28 = (id)GKOSLoggers();
    }
    v29 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      id v30 = self->_pushConnectionProd;
      *(_DWORD *)buf = 138412546;
      CFStringRef v46 = @"com.apple.gamed";
      __int16 v47 = 2112;
      v48 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Enabling topic (%@) for %@", buf, 0x16u);
    }
    CFStringRef v44 = @"com.apple.gamed";
    v31 = +[NSArray arrayWithObjects:&v44 count:1];
    [(APSConnection *)self->_pushConnectionProd _setEnabledTopics:v31];

    if (!os_log_GKGeneral) {
      id v32 = (id)GKOSLoggers();
    }
    __int16 v33 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      pushConnectionDev = self->_pushConnectionDev;
      *(_DWORD *)buf = 138412546;
      CFStringRef v46 = @"com.apple.gamed";
      __int16 v47 = 2112;
      v48 = pushConnectionDev;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Enabling topic (%@) for %@", buf, 0x16u);
    }
    CFStringRef v43 = @"com.apple.gamed";
    __int16 v35 = +[NSArray arrayWithObjects:&v43 count:1];
    [(APSConnection *)self->_pushConnectionDev _setEnabledTopics:v35];

    int v36 = [(APSConnection *)v16 publicToken];
    id v37 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v38 = (id)GKOSLoggers();
      id v37 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      sub_1001182D4();
      if (v36)
      {
LABEL_33:
        [(GKDataRequestManager *)self _setPushToken:v36];
        if ([v36 length])
        {
          [(GKDataRequestManager *)self sendPushTokenWithReplyQueue:0 completion:v15];

LABEL_39:
          goto LABEL_40;
        }
      }
    }
    else if (v36)
    {
      goto LABEL_33;
    }

    goto LABEL_38;
  }
LABEL_40:
}

- (void)setUpCloudKitNotificationTopics
{
  int64_t v3 = [@"com.apple.icloud-container." stringByAppendingString:@"com.apple.gamed"];
  if (!self->_apsConnection)
  {
    id v4 = objc_alloc((Class)APSConnection);
    uint64_t v5 = APSEnvironmentProduction;
    id v6 = dispatch_get_global_queue(0, 0);
    id v7 = (APSConnection *)[v4 initWithEnvironmentName:v5 namedDelegatePort:@"com.apple.aps.gamed.CK" queue:v6];
    apsConnection = self->_apsConnection;
    self->_apsConnection = v7;

    [(APSConnection *)self->_apsConnection setDelegate:self];
  }
  id v10 = v3;
  id v9 = +[NSArray arrayWithObjects:&v10 count:1];
  [(APSConnection *)self->_apsConnection _setEnabledTopics:v9];
}

- (void)credentialsDidChange:(id)a3
{
}

- (void)updateNotificationTopicsForceFully:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100112EA8;
  v3[3] = &unk_1002D5000;
  v3[4] = self;
  BOOL v4 = a3;
  [(GKDataRequestManager *)self performAsync:v3];
}

- (void)_clearPushConnections
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  BOOL v4 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    pushConnectionProd = self->_pushConnectionProd;
    int v9 = 138412290;
    id v10 = pushConnectionProd;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Clearing topics for prod %@", (uint8_t *)&v9, 0xCu);
  }
  [(APSConnection *)self->_pushConnectionProd _setEnabledTopics:&__NSArray0__struct];
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers();
  }
  id v7 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    pushConnectionDev = self->_pushConnectionDev;
    int v9 = 138412290;
    id v10 = pushConnectionDev;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Clearing topics for dev %@", (uint8_t *)&v9, 0xCu);
  }
  [(APSConnection *)self->_pushConnectionDev _setEnabledTopics:&__NSArray0__struct];
}

- (void)clearPushEnvironment
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100113074;
  v2[3] = &unk_1002D40E0;
  v2[4] = self;
  [(GKDataRequestManager *)self performAsync:v2];
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(GKDataRequestManager *)self setReceivesMemoryWarnings:0];
  BOOL v4 = +[GKPreferences shared];
  [v4 setPreferencesDelegate:0];

  [(GKDataRequestManager *)self setGameModeListener:0];
  v5.receiver = self;
  v5.super_class = (Class)GKDataRequestManager;
  [(GKDataRequestManager *)&v5 dealloc];
}

- (int64_t)preferredEnvironment
{
  id v2 = +[GKPreferences shared];
  id v3 = [v2 environment];

  return (int64_t)v3;
}

+ (BOOL)allowSelfSignedCertForEnvironment:(int64_t)a3
{
  return ((unint64_t)a3 < 0xB) & (0x518u >> a3);
}

- (void)resetEnvironmentWithHandler:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Resetting environment", buf, 2u);
  }
  id v7 = +[GKPlayerCredentialController sharedController];
  int64_t v8 = [(GKDataRequestManager *)self currentEnvironment];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100113318;
  v10[3] = &unk_1002D3BC8;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v7 removeAllCredentialsForEnvironment:v8 completionHandler:v10];
}

- (void)resetEnvironment
{
}

- (void)awaitNATSettingsAndUpdateIfNeededWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = [(GKDataRequestManager *)self commonNATSettings];

  if (v5)
  {
    if (!os_log_GKGeneral) {
      id v6 = (id)GKOSLoggers();
    }
    id v7 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[NAT] Has cached NAT settings. Returning.", v8, 2u);
    }
    v4[2](v4);
  }
  else
  {
    [(GKDataRequestManager *)self updateCachedNATSettingsIfNeededWithCompletionHandler:v4];
  }
}

- (void)updateCachedNATSettingsIfNeededWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (dispatch_get_specific(&off_100325A20) == "com.apple.GameKit.GKDataRequestManager.sync")
  {
    if (!os_log_GKGeneral) {
      id v7 = (id)GKOSLoggers();
    }
    int64_t v8 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[NAT] Updating cached settings.", buf, 2u);
    }
    id v9 = [(GKDataRequestManager *)self storeBag];
    if (v9)
    {
      id v10 = +[GKViceroyNATConfiguration settingsKeys];
      id v11 = [(id)objc_opt_class() syncQueue];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100113AF0;
      v14[3] = &unk_1002D4978;
      v14[4] = self;
      id v15 = v9;
      uint64_t v16 = v4;
      [v15 getValuesForKeys:v10 queue:v11 completion:v14];
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v12 = (id)GKOSLoggers();
      }
      id v13 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[NAT] No store bag, not updating NAT settings", buf, 2u);
      }
      v4[2](v4);
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v5 = (id)GKOSLoggers();
    }
    id v6 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[NAT] Not on sync queue, switching to sync queue.", buf, 2u);
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100113AE4;
    v17[3] = &unk_1002D3C38;
    v17[4] = self;
    id v18 = v4;
    [(GKDataRequestManager *)self performAsync:v17];
  }
}

- (void)getValidNATTypeWithForceRelay:(BOOL)a3 withHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (void (**)(void, void))v6;
  if (v4)
  {
    if (!os_log_GKGeneral) {
      id v8 = (id)GKOSLoggers();
    }
    id v9 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[NAT] Returning forced relay NAT type.", buf, 2u);
    }
    ((void (**)(void, id))v7)[2](v7, +[GKViceroyNATTypeHelper forceRelayNATType]);
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100113EDC;
    v10[3] = &unk_1002D3C38;
    v10[4] = self;
    id v11 = v6;
    [(GKDataRequestManager *)self performAsync:v10];
  }
}

- (BOOL)hasValidNATSettings
{
  id v2 = [(GKDataRequestManager *)self commonNATSettings];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int64_t)activePushEnvironment
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100114A24;
  v4[3] = &unk_1002D6B58;
  v4[4] = self;
  v4[5] = &v5;
  [(GKDataRequestManager *)self performSync:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_setActivePushEnvironment:(int64_t)a3
{
  uint64_t v5 = dispatch_get_current_queue();
  id v6 = [(id)objc_opt_class() syncQueue];

  if (v5 != v6)
  {
    label = dispatch_queue_get_label(v5);
    uint64_t v8 = [(id)objc_opt_class() syncQueue];
    id v9 = dispatch_queue_get_label(v8);
    id v10 = +[NSThread callStackSymbols];
    id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKDataRequestManager _setActivePushEnvironment:]", label, v9, v10);
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKDataRequestManager.m"];
    id v13 = [v12 lastPathComponent];
    long long v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_actualCurrentQueue == [[self class] syncQueue])\n[%s (%s:%d)]", v11, "-[GKDataRequestManager _setActivePushEnvironment:]", [v13 UTF8String], 978);

    +[NSException raise:@"GameKit Exception", @"%@", v14 format];
  }

  if ((unint64_t)a3 <= 2) {
    int64_t v15 = 2;
  }
  else {
    int64_t v15 = a3;
  }
  if (v15 != self->_activePushEnvironment)
  {
    if (!os_log_GKGeneral) {
      id v16 = (id)GKOSLoggers();
    }
    id v17 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      int64_t activePushEnvironment = self->_activePushEnvironment;
      *(_DWORD *)buf = 67109376;
      LODWORD(v29[0]) = activePushEnvironment;
      WORD2(v29[0]) = 1024;
      *(_DWORD *)((char *)v29 + 6) = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Changing push environment from %d to %d", buf, 0xEu);
    }
    self->_int64_t activePushEnvironment = v15;
    v19 = +[NSUserDefaults standardUserDefaults];
    [v19 setInteger:self->_activePushEnvironment forKey:GKPushEnvironmentKey];
    [v19 synchronize];
    if (self->_activePushEnvironment == 3 && !self->_pushConnectionDev)
    {
      id v20 = objc_alloc((Class)APSConnection);
      uint64_t v21 = APSEnvironmentDevelopment;
      id v22 = +[GKDataRequestManager pushQueue];
      id v23 = (APSConnection *)[v20 initWithEnvironmentName:v21 namedDelegatePort:@"com.apple.gamed.apsdev" queue:v22];
      pushConnectionDev = self->_pushConnectionDev;
      self->_pushConnectionDev = v23;

      if (!os_log_GKGeneral) {
        id v25 = (id)GKOSLoggers();
      }
      uint64_t v26 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        id v27 = self->_pushConnectionDev;
        *(_DWORD *)buf = 138412290;
        v29[0] = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Created dev push connection: %@", buf, 0xCu);
      }
      [(APSConnection *)self->_pushConnectionDev setDelegate:self];
    }
    [(GKDataRequestManager *)self _updateNotificationTopicsForcefully:1];
  }
}

- (void)setActivePushEnvironment:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100114DF0;
  v3[3] = &unk_1002D9B20;
  v3[4] = self;
  void v3[5] = a3;
  [(GKDataRequestManager *)self performAsync:v3];
}

- (NSData)pushToken
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_100114EFC;
  id v9 = sub_100114F0C;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100114F14;
  v4[3] = &unk_1002D6B58;
  v4[4] = self;
  v4[5] = &v5;
  [(GKDataRequestManager *)self performSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSData *)v2;
}

- (void)_setPushToken:(id)a3
{
  id v5 = a3;
  id v6 = dispatch_get_current_queue();
  uint64_t v7 = [(id)objc_opt_class() syncQueue];

  if (v6 != v7)
  {
    id v24 = v5;
    label = dispatch_queue_get_label(v6);
    id v9 = [(id)objc_opt_class() syncQueue];
    id v10 = dispatch_queue_get_label(v9);
    id v11 = +[NSThread callStackSymbols];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKDataRequestManager _setPushToken:]", label, v10, v11);
    id v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKDataRequestManager.m"];
    id v14 = [v13 lastPathComponent];
    int64_t v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_actualCurrentQueue == [[self class] syncQueue])\n[%s (%s:%d)]", v12, "-[GKDataRequestManager _setPushToken:]", [v14 UTF8String], 1024);

    +[NSException raise:@"GameKit Exception", @"%@", v15 format];
    id v5 = v24;
  }

  p_pushToken = &self->_pushToken;
  objc_storeStrong((id *)&self->_pushToken, a3);
  if (!os_log_GKGeneral) {
    id v17 = (id)GKOSLoggers();
  }
  id v18 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    pushToken = self->_pushToken;
    int64_t activePushEnvironment = self->_activePushEnvironment;
    *(_DWORD *)buf = 138412546;
    uint64_t v26 = pushToken;
    __int16 v27 = 1024;
    int v28 = activePushEnvironment;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "pushToken: %@ activePushEnvironment: %d", buf, 0x12u);
  }
  uint64_t v21 = *p_pushToken;
  id v22 = +[NSUserDefaults standardUserDefaults];
  id v23 = v22;
  if (v21) {
    [v22 setObject:*p_pushToken forKey:GKPushTokenKey];
  }
  else {
    [v22 removeObjectForKey:GKPushTokenKey];
  }
}

- (void)setPushToken:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10011524C;
  v4[3] = &unk_1002D3B38;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(GKDataRequestManager *)v5 performAsync:v4];
}

- (void)_updatePushEnvironmentWithStoreBag:(id)a3
{
  id v4 = a3;
  id v5 = +[GKPreferences shared];
  unint64_t v6 = (unint64_t)[v5 pushEnvironment];

  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  uint64_t v8 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 67109120;
    LODWORD(v13) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "default pushEnvironment = %d", (uint8_t *)&v12, 8u);
  }
  if (v6 <= 1)
  {
    id v9 = [v4 objectForKey:@"gk-apns-env"];
    if ([v9 isEqual:@"dev"]) {
      unint64_t v6 = 3;
    }
    else {
      unint64_t v6 = 2;
    }
    if (!os_log_GKGeneral) {
      id v10 = (id)GKOSLoggers();
    }
    id v11 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412546;
      id v13 = v9;
      __int16 v14 = 1024;
      int v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "using bag pushEnvironment %@ (%d)", (uint8_t *)&v12, 0x12u);
    }
  }
  [(GKDataRequestManager *)self _setActivePushEnvironment:v6];
}

- (void)updateActivePushEnvironment
{
  id v3 = [(GKDataRequestManager *)self storeBag];
  id v4 = [(id)objc_opt_class() syncQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001154C8;
  v6[3] = &unk_1002DB1E8;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [v5 getValuesForKeys:&off_1002F2F00 queue:v4 completion:v6];
}

- (void)sendPushTokenWithReplyQueue:(id)a3
{
}

- (void)sendPushTokenWithReplyQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(id)objc_opt_class() syncQueue];
  id v9 = v8;
  if (!v6) {
    id v6 = v8;
  }
  int64_t currentEnvironment = self->_currentEnvironment;
  int64_t activePushEnvironment = self->_activePushEnvironment;
  int v12 = [(GKDataRequestManager *)self storeBag];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10011580C;
  v15[3] = &unk_1002DB280;
  int64_t v18 = currentEnvironment;
  int64_t v19 = activePushEnvironment;
  id v16 = v9;
  id v17 = v7;
  v15[4] = self;
  id v13 = v9;
  id v14 = v7;
  [v12 getValuesForKeys:&off_1002F2F18 queue:v6 completion:v15];
}

- (id)ampController
{
  return +[GKAMPController controller];
}

- (void)synchronizeBagWithPreferences
{
  id v2 = [(GKDataRequestManager *)self storeBag];
  v5[0] = GKMaxRecentPlayersCount;
  v5[1] = GKMaxRecentPlayersTime;
  id v3 = +[NSArray arrayWithObjects:v5 count:2];
  id v4 = [(id)objc_opt_class() syncQueue];
  [v2 getValuesForKeys:v3 queue:v4 completion:&stru_1002DB2C0];
}

- (void)terminateClient:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_current_queue();
  id v6 = [(id)objc_opt_class() syncQueue];

  if (v5 != v6)
  {
    label = dispatch_queue_get_label(v5);
    uint64_t v8 = [(id)objc_opt_class() syncQueue];
    id v9 = dispatch_queue_get_label(v8);
    id v10 = +[NSThread callStackSymbols];
    id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKDataRequestManager terminateClient:]", label, v9, v10);
    int v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKDataRequestManager.m"];
    id v13 = [v12 lastPathComponent];
    id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_actualCurrentQueue == [[self class] syncQueue])\n[%s (%s:%d)]", v11, "-[GKDataRequestManager terminateClient:]", [v13 UTF8String], 1209);

    +[NSException raise:@"GameKit Exception", @"%@", v14 format];
  }

  if (!os_log_GKGeneral) {
    id v15 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_DEBUG)) {
    sub_1001186AC();
  }
  id v16 = +[GKService serviceWithTransport:0 forClient:v4 localPlayer:0];
  [v16 cancelGameInviteWithHandler:&stru_1002DB2E0];

  id v17 = +[GKService serviceWithTransport:0 forClient:v4 localPlayer:0];
  [v17 cancelOutstandingMatchRequestWithHandler:&stru_1002DB300];

  [(GKDataRequestManager *)self clearAllNearbyInvites];
  [v4 clearDiscoveryInfo];
  +[GKClientProxy removeClient:v4];
  [v4 terminateWithCompletionHandler:&stru_1002DB340];
}

- (void)loadLocalizedGameNameForBundleID:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  uint64_t v8 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKDataRequestManager: loadLocalizedGameNameForBundleID", buf, 2u);
  }
  if (v6)
  {
    id v9 = +[GKClientProxy gameCenterClient];
    id v10 = +[GKService serviceWithTransport:0 forClient:v9 localPlayer:0];
    id v16 = v5;
    id v11 = +[NSArray arrayWithObjects:&v16 count:1];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001165B0;
    v12[3] = &unk_1002D4F38;
    id v13 = v5;
    id v14 = v6;
    [v10 getGameMetadataForBundleIDs:v11 handler:v12];
  }
}

- (void)gameCenterDidBecomeRestricted
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKDataRequestManager: gameCenterDidBecomeRestricted", v5, 2u);
  }
  [(GKDataRequestManager *)self resetEnvironment];
}

- (void)processIncomingiMessageInvite:(id)a3
{
  id v3 = a3;
  if (!os_log_GKGeneral) {
    id v4 = (id)GKOSLoggers();
  }
  id v5 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Processing incoming Messages invite data dictionary: %@", (uint8_t *)&v6, 0xCu);
  }
  +[GKBulletin bulletinsForPushNotification:v3 withHandler:&stru_1002DB3A0];
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  id v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKDataRequestManager: connection:didReceivePublicToken:", buf, 2u);
  }
  if (!os_log_GKGeneral) {
    id v10 = (id)GKOSLoggers();
  }
  id v11 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "connection: %@ publicToken: %@", buf, 0x16u);
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100116B44;
  v14[3] = &unk_1002D4888;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  [(GKDataRequestManager *)self performAsync:v14];
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  id v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    LOWORD(v25) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKDataRequestManager: connection:didReceiveIncomingMessage:", (uint8_t *)&v25, 2u);
  }
  id v10 = [v7 userInfo];
  id v11 = [v7 topic];
  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers();
  }
  id v13 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    int v25 = 138412290;
    uint64_t v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Received push: %@", (uint8_t *)&v25, 0xCu);
  }
  id v14 = +[GKReporter reporter];
  [v14 reportEvent:GKReporterDomainPushCount type:GKReporterPushCountAll];

  if (!os_log_GKGeneral) {
    id v15 = (id)GKOSLoggers();
  }
  id v16 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    int v25 = 138412546;
    uint64_t v26 = v11;
    __int16 v27 = 2112;
    int v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "received push for topic %@, userInfo = %@", (uint8_t *)&v25, 0x16u);
  }
  if ([v11 isEqualToString:@"com.apple.gamed"])
  {
    id v17 = +[GKPreferences shared];
    unsigned __int8 v18 = [v17 isGameCenterDisabled];

    if ((v18 & 1) == 0) {
      [(GKDataRequestManager *)self processIncomingMessage:v10];
    }
  }
  else
  {
    __int16 v19 = [@"com.apple.icloud-container." stringByAppendingString:@"com.apple.gamed"];
    unsigned __int8 v20 = [v11 isEqualToString:v19];

    if ((v20 & 1) == 0)
    {
      if (!os_log_GKGeneral) {
        id v21 = (id)GKOSLoggers();
      }
      id v22 = os_log_GKTrace;
      if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        LOWORD(v25) = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "GKDataRequestManager: PUSH FAILED: unknown topic", (uint8_t *)&v25, 2u);
      }
      if (!os_log_GKGeneral) {
        id v23 = (id)GKOSLoggers();
      }
      id v24 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        int v25 = 138412290;
        uint64_t v26 = v11;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "PUSH FAILED: Unknown topic (%@)", (uint8_t *)&v25, 0xCu);
      }
    }
  }
}

- (void)processIncomingMessage:(id)a3
{
  id v4 = a3;
  [(GKDataRequestManager *)self beginTransaction:@"processMessage"];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100117038;
  block[3] = &unk_1002D40E0;
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  [(GKDataRequestManager *)self endTransaction:@"processMessage"];
}

- (void)endTransaction:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKDataRequestManager: endTransaction:", buf, 2u);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100117264;
  v8[3] = &unk_1002D3B38;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(GKDataRequestManager *)self performAsync:v8];
}

- (void)beginTransaction:(id)a3
{
}

- (void)beginTransaction:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  id v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKDataRequestManager: beginTransaction:", buf, 2u);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100117440;
  v12[3] = &unk_1002D3A48;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(GKDataRequestManager *)self performAsync:v12];
}

- (void)terminate
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKDataRequestManager: Forced termination", buf, 2u);
  }
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Forced termination. Goodbye.", v7, 2u);
  }
  [(GKDataRequestManager *)self performSync:&stru_1002DB3E0];
}

+ (id)statsQueue
{
  if (qword_100329860 != -1) {
    dispatch_once(&qword_100329860, &stru_1002DB400);
  }
  id v2 = (void *)qword_100329858;

  return v2;
}

+ (id)ratingsQueue
{
  if (qword_100329870 != -1) {
    dispatch_once(&qword_100329870, &stru_1002DB420);
  }
  id v2 = (void *)qword_100329868;

  return v2;
}

- (BOOL)receivesMemoryWarnings
{
  return self->_receivesMemoryWarnings;
}

- (void)setReceivesMemoryWarnings:(BOOL)a3
{
  self->_receivesMemoryWarnings = a3;
}

- (NSDate)nearbyQueryLastCheckDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNearbyQueryLastCheckDate:(id)a3
{
}

- (double)nearbyQueryAllowance
{
  return self->_nearbyQueryAllowance;
}

- (void)setNearbyQueryAllowance:(double)a3
{
  self->_nearbyQueryAllowance = a3;
}

- (APSConnection)apsConnection
{
  return self->_apsConnection;
}

- (void)setApsConnection:(id)a3
{
}

- (APSConnection)pushConnectionProd
{
  return self->_pushConnectionProd;
}

- (void)setPushConnectionProd:(id)a3
{
}

- (APSConnection)pushConnectionDev
{
  return self->_pushConnectionDev;
}

- (void)setPushConnectionDev:(id)a3
{
}

- (NSMutableDictionary)transactionBag
{
  return self->_transactionBag;
}

- (void)setTransactionBag:(id)a3
{
}

- (NSCountedSet)transactionCounts
{
  return self->_transactionCounts;
}

- (void)setTransactionCounts:(id)a3
{
}

- (void)setApplicationStateMonitor:(id)a3
{
}

- (NSString)authenticatingWithSettingsBundleID
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAuthenticatingWithSettingsBundleID:(id)a3
{
}

- (GKReachability)reachability
{
  return self->_reachability;
}

- (void)setReachability:(id)a3
{
}

- (_TtC14GameDaemonCore18GKGameModeListener)gameModeListener
{
  return self->_gameModeListener;
}

- (void)setGameModeListener:(id)a3
{
}

- (BOOL)pushUpdatesBusy
{
  return self->_pushUpdatesBusy;
}

- (void)setPushUpdatesBusy:(BOOL)a3
{
  self->_pushUpdatesBusy = a3;
}

- (GKWidgetEventListener)widgetEventListner
{
  return self->_widgetEventListner;
}

- (void)setWidgetEventListner:(id)a3
{
}

- (unint64_t)natType
{
  return self->_natType;
}

- (void)setNatType:(unint64_t)a3
{
  self->_natType = a3;
}

- (NSDate)lastNATTypeCheckDate
{
  return self->_lastNATTypeCheckDate;
}

- (void)setLastNATTypeCheckDate:(id)a3
{
}

- (NSDictionary)commonNATSettings
{
  return self->_commonNATSettings;
}

- (void)setCommonNATSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commonNATSettings, 0);
  objc_storeStrong((id *)&self->_lastNATTypeCheckDate, 0);
  objc_storeStrong((id *)&self->_widgetEventListner, 0);
  objc_storeStrong((id *)&self->_gameModeListener, 0);
  objc_storeStrong((id *)&self->_reachability, 0);
  objc_storeStrong((id *)&self->_authenticatingWithSettingsBundleID, 0);
  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);
  objc_storeStrong((id *)&self->_transactionCounts, 0);
  objc_storeStrong((id *)&self->_transactionBag, 0);
  objc_storeStrong((id *)&self->_pushConnectionDev, 0);
  objc_storeStrong((id *)&self->_pushConnectionProd, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_nearbyQueryLastCheckDate, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);

  objc_storeStrong((id *)&self->_publicListener, 0);
}

- (NSMutableSet)removedApp
{
  return (NSMutableSet *)objc_getAssociatedObject(self, @"GK_REMOVED_APP_SET_KEY");
}

- (void)setRemovedApp:(id)a3
{
}

- (void)applicationsWillUninstall:(id)a3
{
  id v4 = a3;
  id v21 = self;
  id v5 = [(GKDataRequestManager *)self removedApp];

  if (!v5)
  {
    id v6 = +[NSMutableSet set];
    [(GKDataRequestManager *)self setRemovedApp:v6];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    uint64_t v11 = GKInfoPlistKeyFriendsAPIUsageDescription;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v14 = [v13 bundleURL];

        if (v14)
        {
          id v15 = [v13 bundleURL];
          id v16 = +[NSBundle bundleWithURL:v15];
          id v17 = [v16 infoDictionary];

          unsigned __int8 v18 = [v17 objectForKeyedSubscript:v11];

          if (v18)
          {
            __int16 v19 = [(GKDataRequestManager *)v21 removedApp];
            unsigned __int8 v20 = [v13 bundleIdentifier];
            [v19 addObject:v20];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(GKDataRequestManager *)self removedApp];
  id v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v6);
        id v8 = objc_opt_new();
        [v8 setBundleID:v7];
        [v8 setAllowFriendListAccess:3];
        id v9 = +[GKClientProxy gameCenterClient];
        uint64_t v10 = +[GKService serviceWithTransport:0 forClient:v9 localPlayer:0];
        uint64_t v11 = [v8 bundleID];
        id v12 = [v8 serverAllowFriendListAccessValue];
        [v10 submitFriendListAccess:v11 value:v12 handler:&stru_1002DB440];

        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  id v13 = [(GKDataRequestManager *)self removedApp];
  [v13 removeAllObjects];
}

@end