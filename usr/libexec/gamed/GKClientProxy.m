@interface GKClientProxy
+ (BOOL)isExtensionBundleID:(id)a3;
+ (BOOL)isFirstParty:(BOOL)a3 sourceApp:(id)a4 allowList:(id)a5;
+ (BOOL)isGameCenterDashboardForegroundRunning;
+ (id)_clientLookup;
+ (id)_existingManagedObjectContextForPlayerID:(id)a3;
+ (id)_newManagedObjectContextWithCacheURL:(id)a3 environment:(int64_t)a4 psc:(id)a5 storeOptions:(id)a6;
+ (id)cacheDirectoryForBundleID:(id)a3;
+ (id)cacheFileQueue;
+ (id)clientForBundleID:(id)a3;
+ (id)clientForBundleID:(id)a3 bundle:(id)a4 pid:(int)a5 createIfNecessary:(BOOL)a6;
+ (id)clientForBundleID:(id)a3 pid:(int)a4 createIfNecessary:(BOOL)a5;
+ (id)clientForInviteSessionToken:(id)a3;
+ (id)clientForMatchmakingRID:(id)a3;
+ (id)clientForProcessIdentifier:(int)a3;
+ (id)clientsToBeEnumerated;
+ (id)contextKeyForPlayerID:(id)a3;
+ (id)createPersistentStoreCoordinator;
+ (id)factoryQueue;
+ (id)foregroundClient;
+ (id)gameCenterCacheDatabaseURLForPlayerID:(id)a3 language:(id)a4 name:(id)a5 fileManager:(id)a6;
+ (id)gameCenterClient;
+ (id)getParentBundleIDPrefixWithChildBundleID:(id)a3 parentBundleID:(id)a4;
+ (id)insecureDatabaseDirectoryURLForBundleID:(id)a3 language:(id)a4 playerID:(id)a5;
+ (id)insecureDatabaseFileURLForBundleID:(id)a3 language:(id)a4 playerID:(id)a5 name:(id)a6;
+ (id)lastKnownAppInitStateForClientWithBundleID:(id)a3 pid:(int)a4;
+ (id)managedObjectModel;
+ (id)newManagedObjectContextForPlayerID:(id)a3 bundleID:(id)a4 language:(id)a5 environment:(int64_t)a6;
+ (id)nonGameCenterForegroundClient;
+ (id)storeAndForwardDirectoryPathForEnvironment:(int64_t)a3;
+ (id)syncQueue;
+ (void)authenticationDidChange;
+ (void)closeDatabaseFromManagedObjectContextForMOC:(id)a3;
+ (void)closeDatabaseFromManagedObjectContextForPlayerID:(id)a3;
+ (void)enumerateClientsUsingBlock:(id)a3;
+ (void)migrateInsecureDatabaseToSecureDatabaseURL:(id)a3 usingPersistantStoreCoordinator:(id)a4 fileManager:(id)a5 options:(id)a6 playerID:(id)a7 bundleID:(id)a8 language:(id)a9 name:(id)a10;
+ (void)performDelayedRequestsForEnvironment:(int64_t)a3;
+ (void)removeAllCaches;
+ (void)removeAllCachesWithHandler:(id)a3;
+ (void)removeCacheForPlayerID:(id)a3;
+ (void)removeClient:(id)a3;
+ (void)saveAppInitState:(id)a3 forBundleID:(id)a4 pid:(int)a5;
- (BOOL)clientHasAnyPrivateEntitlement;
- (BOOL)conformsToMultiUserRestrictions;
- (BOOL)distributorIsFirstPartyApple;
- (BOOL)initialized;
- (BOOL)installed;
- (BOOL)isAppUnlistedAndDisallowed;
- (BOOL)isDevSigned;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExtension;
- (BOOL)isGameCenter;
- (BOOL)isGameCenterEnabledClient;
- (BOOL)isOcelot;
- (BOOL)isUIService;
- (BOOL)processMatchResponse:(id)a3;
- (BOOL)setAppInitState:(id)a3;
- (BOOL)supportsMultipleActivePlayers;
- (BOOL)supportsNearbyAdvertising;
- (GKClientProxy)initWithBundleIdentifier:(id)a3 bundleOrNil:(id)a4 pid:(int)a5;
- (GKDatabaseConnection)delayedRequestsDBConnection;
- (GKEntitlements)entitlements;
- (GKEventTuple)launchEvent;
- (GKGameInternal)currentGame;
- (GKInviteSession)inviteSession;
- (GKMatchResponse)currentMatchResponse;
- (GKPeerDiscovery)peerDiscovery;
- (GKThreadsafeDictionary)appSessions;
- (GKUIViewService)viewService;
- (GKViceroyNearbyDiscovery)nearbyDiscovery;
- (LSApplicationRecord)applicationRecord;
- (NSDate)achievementsRateLimitingStartDate;
- (NSDate)scoresRateLimitingStartDate;
- (NSDictionary)gameDescriptor;
- (NSDictionary)preferencesFromBag;
- (NSLocale)locale;
- (NSMapTable)extensionProxies;
- (NSMutableArray)pendingDataTypesForRefresh;
- (NSMutableDictionary)alreadyCoalescingNetworkRequests;
- (NSNumber)adamID;
- (NSNumber)externalVersion;
- (NSNumber)sandboxExtensionToken;
- (NSString)bundleIdentifier;
- (NSString)bundleShortVersion;
- (NSString)bundleVersion;
- (NSString)description;
- (NSString)language;
- (NSString)originalBundleIdentifier;
- (NSString)parentBundleIdentifier;
- (NSString)persistentAnchorIdentifier;
- (NSString)protocolVersion;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)authQueue;
- (OS_dispatch_queue)cacheQueue;
- (OS_dispatch_queue)checkMatchStatusQueue;
- (OS_dispatch_queue)delayedRequestsQueue;
- (OS_dispatch_queue)replyQueue;
- (OS_dispatch_source)checkMatchStatusTimer;
- (_GKStateMachine)appInitStateMachine;
- (id)_delayedRequestWriterWithCacheWriterClass:(Class)a3 cacheReaderClass:(Class)a4 networkWriterClass:(Class)a5 bagKey:(id)a6 batchSubmissionInterval:(int64_t)a7 credential:(id)a8;
- (id)_managedObjectContextForPlayerID:(id)a3;
- (id)appInitState;
- (id)appSessionForPlayer:(id)a3;
- (id)appTerminateRequestWithBackgroundFlag:(BOOL)a3;
- (id)connectionProxyForUseCase:(id)a3;
- (id)credentialForPlayer:(id)a3;
- (id)deletePlayerPhotoWriterWithCredential:(id)a3;
- (id)fetchOrCreateInviteSession;
- (id)missingTransitionFromState:(id)a3 toState:(id)a4;
- (id)removeGameWriterWithCredential:(id)a3;
- (id)requestsCacheForEnvironment:(int64_t)a3;
- (id)serviceForClass:(Class)a3 transport:(id)a4 client:(id)a5 credential:(id)a6;
- (id)setPlayerPhotoWriterWithCredential:(id)a3;
- (id)setPlayerStatusWriterWithCredential:(id)a3;
- (id)storeAndForwardDirectoryPathForEnvironment:(int64_t)a3;
- (id)transactionGroupIfCacheExistsForPlayerID:(id)a3;
- (id)transactionGroupWithName:(id)a3 forPlayerID:(id)a4;
- (id)transportWithCredential:(id)a3;
- (id)verifyAuthorized;
- (int)pid;
- (int64_t)achievementsRateLimitingCurrentNumberOfRequests;
- (int64_t)appSignatureType;
- (int64_t)environment;
- (int64_t)scoresRateLimitingCurrentNumberOfRequests;
- (unint64_t)hash;
- (unsigned)achievementsRateLimitedCurrentState;
- (unsigned)applicationState;
- (unsigned)previousApplicationState;
- (unsigned)scoresRateLimitedCurrentState;
- (void)_removeDelayedRequestStore;
- (void)_setupDelayedRequestsWriters;
- (void)acceptInviteWithNotification:(id)a3;
- (void)acceptMultiplayerGameInvite;
- (void)achievementSelected:(id)a3;
- (void)addAppSession:(id)a3 forCredential:(id)a4;
- (void)authenticatedPlayersDidChange:(id)a3 authenticatingBundleID:(id)a4 reply:(id)a5;
- (void)backgroundWithCompletionHandler:(id)a3;
- (void)beginNetworkActivity;
- (void)bgInitializeWithCredential:(id)a3 completionHandler:(id)a4;
- (void)cancelGameInvite:(id)a3;
- (void)cancelInvitationForSession:(id)a3 playerID:(id)a4 pushTokens:(id)a5 handler:(id)a6;
- (void)cancelInviteWithNotification:(id)a3;
- (void)cancelOutstandingCheckMatchStatus;
- (void)challengeCompleted:(id)a3;
- (void)challengeReceived:(id)a3;
- (void)checkMatchStatus;
- (void)clearDiscoveryInfo;
- (void)completedChallengeSelected:(id)a3;
- (void)completedOptimisticAuthenticationWithResponse:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)declineInviteWithNotification:(id)a3;
- (void)deleteInviteSession;
- (void)didConnectToParticipantWithID:(id)a3;
- (void)didDisconnectFromParticipantWithID:(id)a3;
- (void)didEnterForeground;
- (void)didReceiveData:(id)a3 reliably:(BOOL)a4 forRecipients:(id)a5 fromSender:(id)a6;
- (void)endNetworkActivity;
- (void)fetchTurnBasedData;
- (void)friendRequestSelected:(id)a3;
- (void)getAccountNameWithHandler:(id)a3;
- (void)getAuthenticatedLocalPlayersWithStatus:(unint64_t)a3 handler:(id)a4;
- (void)getAuthenticatedPlayerCredential:(id)a3;
- (void)getAuthenticatedPlayerIDWithHandler:(id)a3;
- (void)getAuthenticatedPlayerInfo:(id)a3;
- (void)getGamedFiredUpWithHandler:(id)a3;
- (void)getPreferenceForKey:(id)a3 handler:(id)a4;
- (void)getPrivateServicesForPID:(int)a3 localPlayer:(id)a4 reply:(id)a5;
- (void)getPrivateServicesWithTransport:(id)a3 forClient:(id)a4 reply:(id)a5;
- (void)getServicesForPID:(int)a3 localPlayer:(id)a4 reply:(id)a5;
- (void)getServicesWithTransport:(id)a3 forClient:(id)a4 reply:(id)a5;
- (void)handleCloudKitShareMetadata:(id)a3 completionHandler:(id)a4;
- (void)initializeInitializationStateMachine;
- (void)initializeWithCredential:(id)a3 completionHandler:(id)a4;
- (void)loadRemoteImageDataForURL:(id)a3 reply:(id)a4;
- (void)localizedMessageFromDictionary:(id)a3 forBundleID:(id)a4 handler:(id)a5;
- (void)messagesDidReceiveGameCenterURL:(id)a3 senderHandle:(id)a4 contactID:(id)a5;
- (void)metricsValuesChanged;
- (void)nearbyDataReceivedForPlayerID:(id)a3 deviceID:(id)a4 data:(id)a5;
- (void)nearbyPlayerFoundForPlayerID:(id)a3 deviceID:(id)a4 discoveryInfo:(id)a5;
- (void)nearbyPlayerLostForPlayerID:(id)a3 deviceID:(id)a4;
- (void)performAsync:(id)a3;
- (void)performDelayedRequestsForCredential:(id)a3;
- (void)performDelayedRequestsForEnvironment:(int64_t)a3;
- (void)performSync:(id)a3;
- (void)playerFound:(id)a3 deviceID:(id)a4 discoveryInfo:(id)a5;
- (void)playerLost:(id)a3 deviceID:(id)a4;
- (void)presentBannerWithNotification:(id)a3;
- (void)receivedChallengeSelected:(id)a3;
- (void)receivedData:(id)a3 deviceID:(id)a4 data:(id)a5;
- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4;
- (void)refreshPendingDataTypes;
- (void)relayPushNotification:(id)a3;
- (void)removeAppSessionForPlayer:(id)a3;
- (void)requestSandboxExtension:(id)a3;
- (void)resetLoginCancelCount;
- (void)resetNetworkActivity;
- (void)respondedToNearbyInvite:(id)a3;
- (void)scoreSelected:(id)a3;
- (void)sendAuthenticationDidChangeNotificationWithAuthenticatingBundleID:(id)a3 completionHandler:(id)a4;
- (void)setAchievementsRateLimitedCurrentState:(unsigned __int8)a3;
- (void)setAchievementsRateLimitingCurrentNumberOfRequests:(int64_t)a3;
- (void)setAchievementsRateLimitingStartDate:(id)a3;
- (void)setAdamID:(id)a3;
- (void)setAlreadyCoalescingNetworkRequests:(id)a3;
- (void)setAppInitStateMachine:(id)a3;
- (void)setAppSessions:(id)a3;
- (void)setApplicationState:(unsigned int)a3;
- (void)setAuthQueue:(id)a3;
- (void)setBadgeCount:(unint64_t)a3 forType:(unint64_t)a4;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleShortVersion:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setCacheQueue:(id)a3;
- (void)setCheckMatchStatusQueue:(id)a3;
- (void)setCheckMatchStatusTimer:(id)a3;
- (void)setConnection:(id)a3;
- (void)setCurrentGame:(id)a3;
- (void)setCurrentGame:(id)a3 serverEnvironment:(int64_t)a4 reply:(id)a5;
- (void)setCurrentMatchResponse:(id)a3;
- (void)setDelayedRequestsDBConnection:(id)a3;
- (void)setDelayedRequestsQueue:(id)a3;
- (void)setEntitlements:(id)a3;
- (void)setEnvironment:(int64_t)a3;
- (void)setExtensionProxies:(id)a3;
- (void)setExtensionProxy:(id)a3 forBundleID:(id)a4;
- (void)setExternalVersion:(id)a3;
- (void)setHostPID:(int)a3 reply:(id)a4;
- (void)setInitialized:(BOOL)a3;
- (void)setInstalled:(BOOL)a3;
- (void)setInviteSession:(id)a3;
- (void)setIsAppUnlistedAndDisallowed:(BOOL)a3;
- (void)setIsGameCenterEnabledClient:(BOOL)a3;
- (void)setIsOcelot:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setLaunchEvent:(id)a3;
- (void)setLaunchEvent:(unint64_t)a3 withContext:(id)a4;
- (void)setNearbyDiscovery:(id)a3;
- (void)setOriginalBundleIdentifier:(id)a3;
- (void)setParentBundleIdentifier:(id)a3;
- (void)setPeerDiscovery:(id)a3;
- (void)setPendingDataTypesForRefresh:(id)a3;
- (void)setPersistentAnchorIdentifier:(id)a3;
- (void)setPid:(int)a3;
- (void)setPreferencesFromBag:(id)a3;
- (void)setPreferencesValues:(id)a3;
- (void)setPreviousApplicationState:(unsigned int)a3;
- (void)setSandboxExtensionToken:(id)a3;
- (void)setScoresRateLimitedCurrentState:(unsigned __int8)a3;
- (void)setScoresRateLimitingCurrentNumberOfRequests:(int64_t)a3;
- (void)setScoresRateLimitingStartDate:(id)a3;
- (void)setSupportsMultipleActivePlayers:(BOOL)a3;
- (void)setTestGame:(id)a3 protocolVersion:(id)a4 reply:(id)a5;
- (void)setViewService:(id)a3;
- (void)stateDidChange;
- (void)terminateWithCompletionHandler:(id)a3;
- (void)updateAppInitState;
- (void)updateIfRecentlyInstalled;
- (void)updateInviteWithNotification:(id)a3;
- (void)updatePreferencesFromBag:(id)a3;
@end

@implementation GKClientProxy

+ (BOOL)isExtensionBundleID:(id)a3
{
  uint64_t v3 = qword_1003297D8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1003297D8, &stru_1002DA838);
  }
  unsigned __int8 v5 = [(id)qword_1003297D0 containsObject:v4];

  return v5;
}

- (void)initializeInitializationStateMachine
{
  id v3 = objc_alloc_init((Class)_GKStateMachine);
  v8[0] = @"GKAppInitInProgress";
  v7[0] = @"GKAppInitUnknown";
  v7[1] = @"GKAppInitInProgress";
  v6[0] = @"GKAppInitialized";
  v6[1] = @"GKAppInitUnknown";
  id v4 = +[NSArray arrayWithObjects:v6 count:2];
  v7[2] = @"GKAppInitialized";
  v8[1] = v4;
  v8[2] = @"GKAppInitUnknown";
  unsigned __int8 v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
  [v3 setValidTransitions:v5];

  [v3 setCurrentState:@"GKAppInitUnknown"];
  [v3 setDelegate:self];
  [v3 setShouldLogStateTransitions:1];
  [(GKClientProxy *)self setAppInitStateMachine:v3];
}

- (NSString)description
{
  v11.receiver = self;
  v11.super_class = (Class)GKClientProxy;
  id v3 = [(GKClientProxy *)&v11 description];
  id v4 = [(GKClientProxy *)self bundleIdentifier];
  unsigned __int8 v5 = [(GKClientProxy *)self bundleShortVersion];
  v6 = [(GKClientProxy *)self bundleVersion];
  uint64_t pid = self->_pid;
  v8 = [(GKClientProxy *)self originalBundleIdentifier];
  v9 = +[NSString stringWithFormat:@"%@ (identifier:%@ bundleShortVersion:%@ bundleVersion:%@ pid:%d, originalBundleIdentifier:%@)", v3, v4, v5, v6, pid, v8];

  return (NSString *)v9;
}

- (void)getPrivateServicesForPID:(int)a3 localPlayer:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!os_log_GKGeneral) {
    id v10 = (id)GKOSLoggers();
  }
  objc_super v11 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v24) = a3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "GKClientProxy: client requests private services for pid %d", buf, 8u);
  }
  if (self->_pid != a3)
  {
    v12 = +[NSString stringWithFormat:@"Assertion failed"];
    v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m"];
    id v14 = [v13 lastPathComponent];
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (pid == _pid)\n[%s (%s:%d)]", v12, "-[GKClientProxy(GKDaemonProtocol) getPrivateServicesForPID:localPlayer:reply:]", [v14 UTF8String], 1405);

    +[NSException raise:@"GameKit Exception", @"%@", v15 format];
  }
  [(GKClientProxy *)self updateAppInitState];
  v16 = [(GKClientProxy *)self credentialForPlayer:v8];
  v17 = [(GKClientProxy *)self transportWithCredential:v16];
  if (!os_log_GKGeneral) {
    id v18 = (id)GKOSLoggers();
  }
  v19 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v20 = v19;
    v21 = [v8 alias];
    v22 = [v8 accountName];
    *(_DWORD *)buf = 138412546;
    v24 = v21;
    __int16 v25 = 2112;
    v26 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "alloc private services for %@:%@", buf, 0x16u);
  }
  [(GKClientProxy *)self getPrivateServicesWithTransport:v17 forClient:self reply:v9];
}

- (void)getServicesForPID:(int)a3 localPlayer:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!os_log_GKGeneral) {
    id v10 = (id)GKOSLoggers();
  }
  objc_super v11 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v26) = a3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "GKClientProxy: client requests services for pid %d", buf, 8u);
  }
  if (self->_pid != a3)
  {
    v12 = +[NSString stringWithFormat:@"Assertion failed"];
    v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m"];
    id v14 = [v13 lastPathComponent];
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (pid == _pid)\n[%s (%s:%d)]", v12, "-[GKClientProxy(GKDaemonProtocol) getServicesForPID:localPlayer:reply:]", [v14 UTF8String], 1389);

    +[NSException raise:@"GameKit Exception", @"%@", v15 format];
  }
  [(GKClientProxy *)self updateAppInitState];
  v16 = [(GKClientProxy *)self credentialForPlayer:v8];
  if (!os_log_GKGeneral) {
    id v17 = (id)GKOSLoggers();
  }
  id v18 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "credential: %@", buf, 0xCu);
  }
  v19 = [(GKClientProxy *)self transportWithCredential:v16];
  if (!os_log_GKGeneral) {
    id v20 = (id)GKOSLoggers();
  }
  v21 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v22 = v21;
    v23 = [v8 alias];
    v24 = [v8 accountName];
    *(_DWORD *)buf = 138412546;
    v26 = v23;
    __int16 v27 = 2112;
    v28 = v24;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "alloc services for %@:%@", buf, 0x16u);
  }
  [(GKClientProxy *)self getServicesWithTransport:v19 forClient:self reply:v9];
}

- (unsigned)applicationState
{
  return self->_applicationState;
}

- (void)updateAppInitState
{
  if (self->_pid)
  {
    if (self->_bundleIdentifier)
    {
      id v3 = [(_GKStateMachine *)self->_appInitStateMachine currentState];
      unsigned int v4 = [v3 isEqualToString:@"GKAppInitUnknown"];

      if (v4)
      {
        id v5 = [(id)objc_opt_class() lastKnownAppInitStateForClientWithBundleID:self->_bundleIdentifier pid:self->_pid];
        if ([v5 isEqualToString:@"GKAppInitialized"]) {
          [(_GKStateMachine *)self->_appInitStateMachine setCurrentState:@"GKAppInitialized"];
        }
      }
    }
  }
}

+ (id)lastKnownAppInitStateForClientWithBundleID:(id)a3 pid:(int)a4
{
  id v5 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_100101F84;
  id v18 = sub_100101F94;
  v19 = @"GKAppInitUnknown";
  v6 = GKSavedAuthentiactionStateQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FD00;
  block[3] = &unk_1002DAB38;
  int v13 = a4;
  id v11 = v5;
  v12 = &v14;
  id v7 = v5;
  dispatch_sync(v6, block);

  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

- (BOOL)clientHasAnyPrivateEntitlement
{
  id v3 = [(GKClientProxy *)self viewService];

  if (v3)
  {
    unsigned int v4 = [(GKClientProxy *)self viewService];
  }
  else
  {
    v6 = [(GKClientProxy *)self extensionProxies];
    id v7 = [v6 count];

    if (v7)
    {
      id v8 = [(GKClientProxy *)self extensionProxies];
      id v9 = [v8 objectEnumerator];
      id v5 = [v9 nextObject];

      goto LABEL_6;
    }
    unsigned int v4 = self;
  }
  id v5 = v4;
LABEL_6:
  id v10 = [v5 entitlements];
  unsigned __int8 v11 = [v10 hasAnyPrivateEntitlement];

  return v11;
}

- (GKUIViewService)viewService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewService);

  return (GKUIViewService *)WeakRetained;
}

- (NSMapTable)extensionProxies
{
  return self->_extensionProxies;
}

- (NSString)originalBundleIdentifier
{
  return self->_originalBundleIdentifier;
}

- (GKClientProxy)initWithBundleIdentifier:(id)a3 bundleOrNil:(id)a4 pid:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v9 = a3;
  id v10 = a4;
  unsigned __int8 v11 = [(GKClientProxy *)self init];
  if (!v11) {
    goto LABEL_34;
  }
  if (!v9)
  {
    v12 = +[NSString stringWithFormat:@"GKClientProxy MUST have a bundleIdentifier"];
    int v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m"];
    id v14 = [v13 lastPathComponent];
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (bundleIdentifier != nil)\n[%s (%s:%d)]", v12, "-[GKClientProxy initWithBundleIdentifier:bundleOrNil:pid:]", [v14 UTF8String], 177);

    +[NSException raise:@"GameKit Exception", @"%@", v15 format];
  }
  uint64_t v16 = +[GKApplicationWorkspace defaultWorkspace];
  id v17 = [v16 applicationProxyForBundleID:v9];
  id v18 = v17;
  v11->_installed = v17 != 0;
  if (!v10)
  {
    id v10 = [v17 bundle];
  }
  id v19 = [v18 bundleVersion];
  if ([v9 isEqualToString:GKGameCenterIdentifier])
  {
    id v20 = GKGameCenterBundleVersion;

    id v19 = v20;
  }
  if (!v19)
  {
    id v19 = [v10 _gkBundleVersion];
  }
  v21 = [v18 bundleShortVersion];
  if ((v21 || ([v10 _gkBundleShortVersion], (v21 = objc_claimAutoreleasedReturnValue()) != 0))
    && !v19)
  {
    id v19 = v21;
  }
  else if (!v19 || v21)
  {
    goto LABEL_17;
  }
  id v19 = v19;
  v21 = v19;
LABEL_17:
  v11->_uint64_t pid = v5;
  objc_storeStrong((id *)&v11->_bundleIdentifier, a3);
  v22 = (LSApplicationRecord *)[objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v9 allowPlaceholder:0 error:0];
  applicationRecord = v11->_applicationRecord;
  v11->_applicationRecord = v22;

  objc_storeStrong((id *)&v11->_bundleVersion, v19);
  objc_storeStrong((id *)&v11->_bundleShortVersion, v21);
  uint64_t v24 = [v18 adamID];
  adamID = v11->_adamID;
  v11->_adamID = (NSNumber *)v24;

  uint64_t v26 = [v18 externalVersion];
  externalVersion = v11->_externalVersion;
  v11->_externalVersion = (NSNumber *)v26;

  v11->_isAppUnlistedAndDisallowed = 0;
  uint64_t v28 = +[NSBundle _gkPreferredSystemLanguage];
  language = v11->_language;
  v11->_language = (NSString *)v28;

  if (!v11->_language)
  {
    v30 = GKGetPreferredLanguage();
    uint64_t v31 = +[NSLocale canonicalLanguageIdentifierFromString:v30];
    v32 = v11->_language;
    v11->_language = (NSString *)v31;
  }
  v11->_applicationState = GKGetApplicationStateForBundleID(v11->_bundleIdentifier);
  dispatch_queue_t v33 = dispatch_queue_create("com.apple.gamecenter.clientproxy.authQueue", 0);
  authQueue = v11->_authQueue;
  v11->_authQueue = (OS_dispatch_queue *)v33;

  dispatch_queue_t v35 = dispatch_queue_create("com.apple.gamecenter.clientproxy.checkMatchStatusQueue", 0);
  checkMatchStatusQueue = v11->_checkMatchStatusQueue;
  v11->_checkMatchStatusQueue = (OS_dispatch_queue *)v35;

  dispatch_queue_t v37 = dispatch_queue_create("com.apple.gamecenter.clientproxy.replyQueue", 0);
  replyQueue = v11->_replyQueue;
  v11->_replyQueue = (OS_dispatch_queue *)v37;

  [(GKClientProxy *)v11 initializeInitializationStateMachine];
  dispatch_queue_t v39 = dispatch_queue_create("com.apple.gamecenter.clientproxy.cacheQueue", 0);
  cacheQueue = v11->_cacheQueue;
  v11->_cacheQueue = (OS_dispatch_queue *)v39;

  dispatch_queue_t v41 = dispatch_queue_create("com.apple.gamecenter.clientproxy.delayedRequestsQueue", 0);
  delayedRequestsQueue = v11->_delayedRequestsQueue;
  v11->_delayedRequestsQueue = (OS_dispatch_queue *)v41;

  v43 = +[GKDataRequestManager sharedManager];
  v11->_environment = (int64_t)[v43 currentEnvironment];
  v44 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  pendingDataTypesForRefresh = v11->_pendingDataTypesForRefresh;
  v11->_pendingDataTypesForRefresh = v44;

  id v46 = objc_alloc((Class)GKThreadsafeDictionary);
  v47 = +[NSString stringWithFormat:@"com.apple.gamed.gk-app-sessions-%@-%d", v9, v5];
  v48 = (GKThreadsafeDictionary *)[v46 initWithName:v47];
  appSessions = v11->_appSessions;
  v11->_appSessions = v48;

  v11->_achievementsRateLimitingCurrentNumberOfRequests = 0;
  v11->_achievementsRateLimitedCurrentState = 0;
  uint64_t v50 = +[NSDate date];
  achievementsRateLimitingStartDate = v11->_achievementsRateLimitingStartDate;
  v11->_achievementsRateLimitingStartDate = (NSDate *)v50;

  v11->_scoresRateLimitingCurrentNumberOfRequests = 0;
  v11->_scoresRateLimitedCurrentState = 0;
  uint64_t v52 = +[NSDate date];
  scoresRateLimitingStartDate = v11->_scoresRateLimitingStartDate;
  v11->_scoresRateLimitingStartDate = (NSDate *)v52;

  v54 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:5 valueOptions:5 capacity:6];
  extensionProxies = v11->_extensionProxies;
  v11->_extensionProxies = v54;

  id v56 = objc_alloc_init((Class)NSMutableDictionary);
  [(GKClientProxy *)v11 setAlreadyCoalescingNetworkRequests:v56];

  if (v10)
  {
    if ([v10 _gkIsEligibleForNearbyAdvertising])
    {
      v11->_supportsNearbyAdvertising = 1;
      if (!os_log_GKGeneral) {
        id v57 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
        sub_10010C544();
      }
    }
    else
    {
      v11->_supportsNearbyAdvertising = 0;
      if (!os_log_GKGeneral) {
        id v60 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
        sub_10010C5AC();
      }
    }
  }
  else
  {
    v11->_supportsNearbyAdvertising = 0;
    if (!os_log_GKGeneral) {
      id v58 = (id)GKOSLoggers();
    }
    v59 = os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      sub_10010C4C0((uint64_t)v9, v59);
    }
  }

LABEL_34:

  return v11;
}

- (void)getServicesWithTransport:(id)a3 forClient:(id)a4 reply:(id)a5
{
  id v34 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(GKClientProxy *)self serviceForClass:objc_opt_class() transport:v9 client:v8 credential:0];
  unsigned __int8 v11 = [(GKClientProxy *)self serviceForClass:objc_opt_class() transport:v9 client:v8 credential:0];
  v12 = [(GKClientProxy *)self serviceForClass:objc_opt_class() transport:v9 client:v8 credential:0];
  dispatch_queue_t v33 = [(GKClientProxy *)self serviceForClass:objc_opt_class() transport:v9 client:v8 credential:0];
  __int16 v25 = [(GKClientProxy *)self serviceForClass:objc_opt_class() transport:v9 client:v8 credential:0];
  int v13 = [(GKClientProxy *)self serviceForClass:objc_opt_class() transport:v9 client:v8 credential:0];
  __int16 v27 = [(GKClientProxy *)self serviceForClass:objc_opt_class() transport:v9 client:v8 credential:0];
  v29 = [(GKClientProxy *)self serviceForClass:objc_opt_class() transport:v9 client:v8 credential:0];
  id v14 = [(GKClientProxy *)self serviceForClass:objc_opt_class() transport:v9 client:v8 credential:0];
  v15 = [(GKClientProxy *)self serviceForClass:objc_opt_class() transport:v9 client:v8 credential:0];

  queue = [(GKClientProxy *)self replyQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016CD8;
  block[3] = &unk_1002DA9E8;
  id v45 = v15;
  id v46 = v34;
  uint64_t v16 = v10;
  id v36 = v10;
  id v37 = v11;
  id v17 = v12;
  id v38 = v12;
  id v39 = v33;
  id v40 = v25;
  id v41 = v13;
  id v42 = v27;
  id v43 = v29;
  id v44 = v14;
  id v32 = v15;
  id v31 = v14;
  id v30 = v29;
  id v28 = v27;
  id v18 = v13;
  id v26 = v25;
  id v19 = v33;
  id v20 = v17;
  id v21 = v11;
  id v22 = v16;
  id v23 = v34;
  dispatch_async(queue, block);
}

+ (id)_clientLookup
{
  if (qword_1003297C8 != -1) {
    dispatch_once(&qword_1003297C8, &stru_1002DA818);
  }
  v2 = (void *)qword_1003297C0;

  return v2;
}

- (void)updateIfRecentlyInstalled
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  unsigned int v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKClientProxy: updateIfRecentlyInstalled", buf, 2u);
  }
  if (![(GKClientProxy *)self installed])
  {
    uint64_t v5 = +[GKApplicationWorkspace defaultWorkspace];
    v6 = [(GKClientProxy *)self bundleIdentifier];
    id v7 = [v5 applicationProxyForBundleID:v6];

    if (v7)
    {
      if (!os_log_GKGeneral) {
        id v8 = (id)GKOSLoggers();
      }
      id v9 = os_log_GKTrace;
      if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKClientProxy: updateIfRecentlyInstalled - workspace and appProxy exist, updating", v14, 2u);
      }
      id v10 = [v7 bundleVersion];
      [(GKClientProxy *)self setBundleVersion:v10];

      unsigned __int8 v11 = [v7 bundleShortVersion];
      [(GKClientProxy *)self setBundleShortVersion:v11];

      v12 = [v7 adamID];
      [(GKClientProxy *)self setAdamID:v12];

      int v13 = [v7 externalVersion];
      [(GKClientProxy *)self setExternalVersion:v13];

      [(GKClientProxy *)self setInstalled:1];
    }
  }
}

- (BOOL)installed
{
  return self->_installed;
}

- (void)didEnterForeground
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  unsigned int v4 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = v4;
    v6 = [(GKClientProxy *)self bundleIdentifier];
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "did enter foreground: %@", buf, 0xCu);
  }
  id v7 = +[GKPreferences shared];
  [v7 invalidate];

  if ([(GKClientProxy *)self isGameCenter])
  {
    [(GKClientProxy *)self refreshPendingDataTypes];
  }
  else
  {
    id v8 = +[GKDataRequestManager sharedManager];
    [v8 setAuthenticatingWithSettingsBundleID:0];
  }
  [(GKClientProxy *)self inviteSession];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100106C18;
  v10[3] = &unk_1002D3B38;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = self;
  id v9 = v11;
  [v9 performAsync:v10];
}

- (void)refreshPendingDataTypes
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  unsigned int v4 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = v4;
    v6 = [(GKClientProxy *)self bundleIdentifier];
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Refreshing pending data types for %@", buf, 0xCu);
  }
  id v7 = [(GKClientProxy *)self pendingDataTypesForRefresh];
  id v8 = [v7 count];

  if (v8)
  {
    id v9 = [(GKClientProxy *)self pendingDataTypesForRefresh];
    id v10 = [v9 copy];

    id v11 = [(GKClientProxy *)self pendingDataTypesForRefresh];
    [v11 removeAllObjects];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001023FC;
    v12[3] = &unk_1002DA7D8;
    v12[4] = self;
    [v10 enumerateObjectsUsingBlock:v12];
  }
}

- (NSMutableArray)pendingDataTypesForRefresh
{
  return self->_pendingDataTypesForRefresh;
}

- (BOOL)isGameCenter
{
  v2 = [(GKClientProxy *)self bundleIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:GKGameCenterIdentifier];

  return v3;
}

- (GKInviteSession)inviteSession
{
  return (GKInviteSession *)objc_getProperty(self, a2, 232, 1);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

+ (id)gameCenterClient
{
  return [a1 clientForBundleID:GKGameCenterIdentifier bundle:0 pid:0 createIfNecessary:1];
}

- (id)transportWithCredential:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[GKDataRequestManager sharedManager];
  v6 = [v5 storeBag];
  id v7 = +[GKDataTransport transportWithBag:v6 clientProxy:self credential:v4];

  return v7;
}

- (id)transactionGroupWithName:(id)a3 forPlayerID:(id)a4
{
  id v5 = a4;
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKClientProxy+Cache.m", 59, "-[GKClientProxy(Cache) transactionGroupWithName:forPlayerID:]");
  id v7 = [(GKClientProxy *)self _managedObjectContextForPlayerID:v5];

  id v8 = +[GKCacheTransactionGroup transactionGroupWithName:v6 context:v7 client:self];

  return v8;
}

- (id)_managedObjectContextForPlayerID:(id)a3
{
  id v4 = a3;
  if (qword_100329800 != -1) {
    dispatch_once(&qword_100329800, &stru_1002DAEB0);
  }
  id v5 = [(id)objc_opt_class() contextKeyForPlayerID:v4];
  v6 = (void *)qword_1003297F8;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10010D124;
  v10[3] = &unk_1002DAED8;
  void v10[4] = self;
  id v11 = v4;
  id v7 = v4;
  id v8 = [v6 objectForKey:v5 objectProducerBlock:v10];

  return v8;
}

+ (id)contextKeyForPlayerID:(id)a3
{
  if (a3) {
    return a3;
  }
  else {
    return @"<global>";
  }
}

- (OS_dispatch_queue)replyQueue
{
  return self->_replyQueue;
}

- (void)getPrivateServicesWithTransport:(id)a3 forClient:(id)a4 reply:(id)a5
{
  id v34 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(GKClientProxy *)self serviceForClass:objc_opt_class() transport:v9 client:v8 credential:0];
  id v11 = [(GKClientProxy *)self serviceForClass:objc_opt_class() transport:v9 client:v8 credential:0];
  v12 = [(GKClientProxy *)self serviceForClass:objc_opt_class() transport:v9 client:v8 credential:0];
  dispatch_queue_t v33 = [(GKClientProxy *)self serviceForClass:objc_opt_class() transport:v9 client:v8 credential:0];
  __int16 v25 = [(GKClientProxy *)self serviceForClass:objc_opt_class() transport:v9 client:v8 credential:0];
  int v13 = [(GKClientProxy *)self serviceForClass:objc_opt_class() transport:v9 client:v8 credential:0];
  __int16 v27 = [(GKClientProxy *)self serviceForClass:objc_opt_class() transport:v9 client:v8 credential:0];
  v29 = [(GKClientProxy *)self serviceForClass:objc_opt_class() transport:v9 client:v8 credential:0];
  id v14 = [(GKClientProxy *)self serviceForClass:objc_opt_class() transport:v9 client:v8 credential:0];
  v15 = [(GKClientProxy *)self serviceForClass:objc_opt_class() transport:v9 client:v8 credential:0];

  queue = [(GKClientProxy *)self replyQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016C88;
  block[3] = &unk_1002DA9E8;
  id v45 = v15;
  id v46 = v34;
  uint64_t v16 = v10;
  id v36 = v10;
  id v37 = v11;
  id v17 = v12;
  id v38 = v12;
  id v39 = v33;
  id v40 = v25;
  id v41 = v13;
  id v42 = v27;
  id v43 = v29;
  id v44 = v14;
  id v32 = v15;
  id v31 = v14;
  id v30 = v29;
  id v28 = v27;
  id v18 = v13;
  id v26 = v25;
  id v19 = v33;
  id v20 = v17;
  id v21 = v11;
  id v22 = v16;
  id v23 = v34;
  dispatch_async(queue, block);
}

- (id)serviceForClass:(Class)a3 transport:(id)a4 client:(id)a5 credential:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    int v13 = +[NSString stringWithFormat:@"Assertion failed"];
    id v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m"];
    id v15 = [v14 lastPathComponent];
    uint64_t v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([serviceClass isSubclassOfClass:[GKService class]])\n[%s (%s:%d)]", v13, "-[GKClientProxy(GKDaemonProtocol) serviceForClass:transport:client:credential:]", [v15 UTF8String], 1223);

    +[NSException raise:@"GameKit Exception", @"%@", v16 format];
  }
  id v17 = [(GKClientProxy *)self entitlements];
  if (objc_msgSend(v17, "hasEntitlements:", -[objc_class requiredEntitlements](a3, "requiredEntitlements")))
  {
    id v18 = [(objc_class *)a3 serviceWithTransport:v10 forClient:v11 credential:v12];
  }
  else
  {
    id v18 = 0;
  }
  if ([v18 requiresAuthentication]
    && ([v17 hasEntitlements:&_mh_execute_header] & 1) == 0
    && ![(GKClientProxy *)self isUIService]
    && ![(GKClientProxy *)self isExtension])
  {
    uint64_t v19 = +[GKAuthenticationWrapperService authenticationWrapperForService:v18];

    id v18 = (void *)v19;
  }

  return v18;
}

- (GKEntitlements)entitlements
{
  return (GKEntitlements *)objc_getProperty(self, a2, 56, 1);
}

+ (id)clientForBundleID:(id)a3 bundle:(id)a4 pid:(int)a5 createIfNecessary:(BOOL)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers();
  }
  int v13 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "GKClientProxy: clientForBundleID: %@, pid: %d", buf, 0x12u);
  }
  if (v10 || !v7)
  {
    if (v10)
    {
LABEL_13:
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v29 = sub_100101F84;
      id v30 = sub_100101F94;
      id v31 = 0;
      uint64_t v16 = [a1 factoryQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100013B90;
      block[3] = &unk_1002DA860;
      uint64_t v24 = buf;
      id v25 = a1;
      int v26 = v7;
      id v22 = v10;
      BOOL v27 = a6;
      id v23 = v11;
      id v17 = v10;
      dispatch_sync(v16, block);

      id v18 = *(id *)(*(void *)&buf[8] + 40);
      _Block_object_dispose(buf, 8);

      goto LABEL_19;
    }
  }
  else
  {
    id v10 = +[NSBundle _gkBundleIdentifierOrProcessNameForPID:v7];
    if (v10)
    {
      if (!os_log_GKGeneral) {
        id v14 = (id)GKOSLoggers();
      }
      id v15 = os_log_GKTrace;
      if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v10;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "GKClientProxy: clientForBundleID: - Obtained bundleID: %@", buf, 0xCu);
      }
      goto LABEL_13;
    }
  }
  if (!os_log_GKGeneral) {
    id v19 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
    sub_10010CA9C();
  }
  id v18 = 0;
LABEL_19:

  return v18;
}

- (int64_t)environment
{
  return self->_environment;
}

+ (id)factoryQueue
{
  if (qword_1003297B8 != -1) {
    dispatch_once(&qword_1003297B8, &stru_1002DA7F8);
  }
  v2 = (void *)qword_1003297B0;

  return v2;
}

- (id)credentialForPlayer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 accountName];

  if (v5)
  {
    v6 = +[GKPlayerCredentialController sharedController];
    uint64_t v7 = [v4 accountName];
    id v8 = [v6 credentialForUsername:v7 environment:[self environment]];
  }
  else
  {
    id v9 = [v4 playerID];

    v6 = +[GKPlayerCredentialController sharedController];
    int64_t v10 = [(GKClientProxy *)self environment];
    if (v9) {
      [v6 credentialForPlayer:v4 environment:v10];
    }
    else {
    id v8 = [v6 primaryCredentialForEnvironment:v10];
    }
  }

  return v8;
}

- (void)setPreviousApplicationState:(unsigned int)a3
{
  self->_previousApplicationState = a3;
}

- (void)setPid:(int)a3
{
  self->_uint64_t pid = a3;
}

- (void)setOriginalBundleIdentifier:(id)a3
{
}

- (void)setEntitlements:(id)a3
{
}

- (void)setConnection:(id)a3
{
  self->_connection = (NSXPCConnection *)a3;
}

- (void)setApplicationState:(unsigned int)a3
{
  self->_applicationState = a3;
}

- (void)setAppInitStateMachine:(id)a3
{
}

- (void)setAlreadyCoalescingNetworkRequests:(id)a3
{
}

- (BOOL)isUIService
{
  return 0;
}

- (BOOL)isExtension
{
  return 0;
}

- (BOOL)isAppUnlistedAndDisallowed
{
  return self->_isAppUnlistedAndDisallowed;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (NSString)bundleShortVersion
{
  return self->_bundleShortVersion;
}

+ (id)clientForBundleID:(id)a3 pid:(int)a4 createIfNecessary:(BOOL)a5
{
  return [a1 clientForBundleID:a3 bundle:0 pid:*(void *)&a4 createIfNecessary:a5];
}

- (GKViceroyNearbyDiscovery)nearbyDiscovery
{
  unsigned __int8 v3 = +[GKPreferences shared];
  unsigned __int8 v4 = [v3 disableViceroyNearby];

  if (v4)
  {
LABEL_14:
    int64_t v10 = 0;
    goto LABEL_15;
  }
  if (![(GKClientProxy *)self supportsNearbyAdvertising])
  {
    if (!os_log_GKGeneral) {
      id v11 = (id)GKOSLoggers();
    }
    id v12 = (void *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      sub_10010C6A4(v12);
    }
    goto LABEL_14;
  }
  nearbyDiscovery = self->_nearbyDiscovery;
  if (!nearbyDiscovery)
  {
    if (!os_log_GKGeneral) {
      id v6 = (id)GKOSLoggers();
    }
    uint64_t v7 = (void *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      sub_10010C614(v7);
    }
    id v8 = (GKViceroyNearbyDiscovery *)objc_alloc_init((Class)GKViceroyNearbyDiscovery);
    id v9 = self->_nearbyDiscovery;
    self->_nearbyDiscovery = v8;

    nearbyDiscovery = self->_nearbyDiscovery;
  }
  int64_t v10 = nearbyDiscovery;
LABEL_15:

  return v10;
}

- (GKPeerDiscovery)peerDiscovery
{
  if ([(GKClientProxy *)self supportsNearbyAdvertising])
  {
    peerDiscovery = self->_peerDiscovery;
    if (!peerDiscovery)
    {
      if (!os_log_GKGeneral) {
        id v4 = (id)GKOSLoggers();
      }
      id v5 = (void *)os_log_GKMatch;
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
        sub_10010C768(v5);
      }
      id v6 = +[GKPlayerCredentialController sharedController];
      uint64_t v7 = [v6 pushCredentialForEnvironment:-[GKClientProxy environment](self, "environment")];
      id v8 = [v7 playerInternal];

      id v9 = +[GKDataRequestManager sharedManager];
      int64_t v10 = [v9 pushToken];

      if (v10
        && ([v8 playerID], id v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
      {
        id v12 = +[GKPreferences shared];
        unsigned int v13 = [v12 fastSyncTransportEnabled];

        if (v13)
        {
          id v14 = [GKPeerDiscovery alloc];
          id v15 = [v8 playerID];
          uint64_t v16 = [(GKPeerDiscovery *)v14 initWithDelegate:self localPlayerID:v15 localPushToken:v10];
          id v17 = self->_peerDiscovery;
          self->_peerDiscovery = v16;
        }
      }
      else
      {
        if (!os_log_GKGeneral) {
          id v21 = (id)GKOSLoggers();
        }
        if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
          sub_10010C734();
        }
      }

      peerDiscovery = self->_peerDiscovery;
    }
    id v20 = peerDiscovery;
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v18 = (id)GKOSLoggers();
    }
    id v19 = (void *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      sub_10010C7F8(v19);
    }
    id v20 = 0;
  }

  return v20;
}

- (void)clearDiscoveryInfo
{
  if (self->_nearbyDiscovery)
  {
    if (!os_log_GKGeneral) {
      id v3 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      sub_10010C8BC();
    }
    [(GKViceroyNearbyDiscovery *)self->_nearbyDiscovery stopBrowsing];
    [(GKViceroyNearbyDiscovery *)self->_nearbyDiscovery stopAdvertising];
    nearbyDiscovery = self->_nearbyDiscovery;
    self->_nearbyDiscovery = 0;
  }
  if (self->_peerDiscovery)
  {
    if (!os_log_GKGeneral) {
      id v5 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      sub_10010C888();
    }
    id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKClientProxy.m", 327, "-[GKClientProxy clearDiscoveryInfo]");
    uint64_t v7 = +[GKDispatchGroup dispatchGroupWithName:v6];

    [v7 enter];
    peerDiscovery = self->_peerDiscovery;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000FFC94;
    v15[3] = &unk_1002D40E0;
    id v9 = v7;
    id v16 = v9;
    [(GKPeerDiscovery *)peerDiscovery stopListeningWithCompletionHandler:v15];
    [v9 enter];
    int64_t v10 = self->_peerDiscovery;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000FFD00;
    v13[3] = &unk_1002D40E0;
    id v14 = v9;
    id v11 = v9;
    [(GKPeerDiscovery *)v10 stopBrowsingWithCompletionHandler:v13];
    [v11 wait];
    id v12 = self->_peerDiscovery;
    self->_peerDiscovery = 0;
  }
}

- (NSString)parentBundleIdentifier
{
  id v3 = [(GKClientProxy *)self applicationRecord];
  if (v3)
  {
    id v4 = [(GKClientProxy *)self bundleIdentifier];
    id v5 = [(GKClientProxy *)self applicationRecord];
    id v6 = [v5 appClipMetadata];
    uint64_t v7 = [v6 parentApplicationIdentifiers];
    id v8 = [v7 firstObject];
    id v9 = +[GKClientProxy getParentBundleIDPrefixWithChildBundleID:v4 parentBundleID:v8];
  }
  else
  {
    id v9 = 0;
  }

  return (NSString *)v9;
}

- (BOOL)distributorIsFirstPartyApple
{
  id v3 = [(GKClientProxy *)self applicationRecord];
  id v4 = [v3 iTunesMetadata];
  id v5 = [v4 distributorInfo];
  id v6 = [v5 distributorIsFirstPartyApple];

  uint64_t v7 = [(GKClientProxy *)self applicationRecord];
  id v8 = [v7 iTunesMetadata];
  id v9 = [v8 sourceApp];

  if (qword_100329798 != -1) {
    dispatch_once(&qword_100329798, &stru_1002DA6F0);
  }
  BOOL v10 = +[GKClientProxy isFirstParty:v6 sourceApp:v9 allowList:qword_100329790];

  return v10;
}

+ (BOOL)isFirstParty:(BOOL)a3 sourceApp:(id)a4 allowList:(id)a5
{
  id v7 = a4;
  unsigned int v8 = [a5 containsObject:v7];
  if (v8)
  {
    id v9 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v10 = (id)GKOSLoggers();
      id v9 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10010C958();
    }
  }
  else if (!a3)
  {
    id v11 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v12 = (id)GKOSLoggers();
      id v11 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10010C9CC();
    }
  }

  return v8 | a3;
}

- (void)dealloc
{
  id v3 = [(GKClientProxy *)self viewService];
  [v3 setHostClient:0];

  [(GKClientProxy *)self setViewService:0];
  id v4 = [(GKClientProxy *)self sandboxExtensionToken];

  if (v4)
  {
    id v5 = [(GKClientProxy *)self sandboxExtensionToken];
    [v5 longLongValue];
    sandbox_extension_release();
  }
  [(NSMapTable *)self->_extensionProxies removeAllObjects];
  v6.receiver = self;
  v6.super_class = (Class)GKClientProxy;
  [(GKClientProxy *)&v6 dealloc];
}

- (unint64_t)hash
{
  v2 = [(GKClientProxy *)self bundleIdentifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    objc_super v6 = [v5 bundleIdentifier];
    id v7 = [(GKClientProxy *)self bundleIdentifier];
    unsigned int v8 = [v6 isEqual:v7];

    if (v8
      && ([v5 bundleVersion],
          id v9 = objc_claimAutoreleasedReturnValue(),
          [(GKClientProxy *)self bundleVersion],
          id v10 = objc_claimAutoreleasedReturnValue(),
          unsigned int v11 = [v9 isEqual:v10],
          v10,
          v9,
          v11))
    {
      id v12 = [v5 bundleShortVersion];
      unsigned int v13 = [(GKClientProxy *)self bundleShortVersion];
      unsigned __int8 v14 = [v12 isEqual:v13];
    }
    else
    {
      unsigned __int8 v14 = 0;
    }
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (NSDictionary)gameDescriptor
{
  id v3 = +[NSMutableDictionary dictionary];
  uint64_t v4 = [(GKClientProxy *)self adamID];
  if (v4)
  {
    id v5 = (void *)v4;
    objc_super v6 = [(GKClientProxy *)self adamID];
    uint64_t v7 = (uint64_t)[v6 integerValue];

    if (v7 >= 1)
    {
      unsigned int v8 = [(GKClientProxy *)self adamID];
      [v3 setObject:v8 forKey:@"adam-id"];
    }
  }
  id v9 = [(GKClientProxy *)self externalVersion];

  if (v9)
  {
    id v10 = [(GKClientProxy *)self externalVersion];
    [v3 setObject:v10 forKey:@"external-version"];
  }
  unsigned int v11 = [(GKClientProxy *)self bundleIdentifier];

  if (v11)
  {
    id v12 = [(GKClientProxy *)self bundleIdentifier];
    [v3 setObject:v12 forKey:@"bundle-id"];
  }
  unsigned int v13 = [(GKClientProxy *)self parentBundleIdentifier];

  if (v13)
  {
    unsigned __int8 v14 = [(GKClientProxy *)self parentBundleIdentifier];
    [v3 setObject:v14 forKey:@"parent-bundle-id"];
  }
  id v15 = [(GKClientProxy *)self bundleVersion];

  if (v15)
  {
    id v16 = [(GKClientProxy *)self bundleVersion];
    [v3 setObject:v16 forKey:@"bundle-version"];
  }
  id v17 = [(GKClientProxy *)self bundleShortVersion];

  if (v17)
  {
    id v18 = [(GKClientProxy *)self bundleShortVersion];
    [v3 setObject:v18 forKey:@"short-bundle-version"];
  }
  id v19 = [(GKClientProxy *)self bundleIdentifier];
  id v20 = +[GKGameDescriptor stringForPlatform:](GKGameDescriptor, "stringForPlatform:", +[GKApplicationWorkspace getPlatformForBundleID:v19]);
  [v3 setObject:v20 forKeyedSubscript:@"platform"];

  return (NSDictionary *)v3;
}

- (NSLocale)locale
{
  v2 = [(GKClientProxy *)self language];
  if (v2)
  {
    id v3 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:v2];
  }
  else
  {
    id v3 = +[NSLocale currentLocale];
  }
  uint64_t v4 = v3;

  return (NSLocale *)v4;
}

- (int64_t)appSignatureType
{
  uint64_t v3 = [(GKClientProxy *)self pid];
  uint64_t v4 = [(GKClientProxy *)self connection];
  id v5 = v4;
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v8, 0, sizeof(v8));
  }
  int64_t v6 = +[GKClientAppSigningStatus appSignatureType:v3 auditToken:v8];

  return v6;
}

- (BOOL)isDevSigned
{
  uint64_t v3 = [(GKClientProxy *)self pid];
  uint64_t v4 = [(GKClientProxy *)self connection];
  id v5 = v4;
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v8, 0, sizeof(v8));
  }
  BOOL v6 = +[GKClientAppSigningStatus appIsDevSigned:v3 auditToken:v8];

  return v6;
}

- (BOOL)conformsToMultiUserRestrictions
{
  return 1;
}

- (NSString)protocolVersion
{
  v2 = +[GKPreferences shared];
  [v2 useTestProtocols];
  uint64_t v3 = GKGetProtocolVersionString();

  return (NSString *)v3;
}

- (void)setExtensionProxy:(id)a3 forBundleID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v6)
  {
    if (v10)
    {
      uint64_t v7 = [(GKClientProxy *)self preferencesFromBag];

      if (v7)
      {
        unsigned int v8 = [(GKClientProxy *)self preferencesFromBag];
        [v10 setPreferencesValues:v8];
      }
      id v9 = [(GKClientProxy *)self extensionProxies];
      [v9 setObject:v10 forKey:v6];
    }
    else
    {
      id v9 = [(GKClientProxy *)self extensionProxies];
      [v9 removeObjectForKey:v6];
    }
  }
}

- (void)updatePreferencesFromBag:(id)a3
{
  id v4 = a3;
  [(GKClientProxy *)self setPreferencesFromBag:v4];
  [(GKClientProxy *)self setPreferencesValues:v4];
}

- (void)setLaunchEvent:(unint64_t)a3 withContext:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(GKClientProxy *)self launchEvent];
  if (!v7) {
    uint64_t v7 = objc_alloc_init(GKEventTuple);
  }
  [(GKEventTuple *)v7 setEventType:a3];
  [(GKEventTuple *)v7 setContext:v6];

  [(GKClientProxy *)self setLaunchEvent:v7];
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  id v9 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    unsigned int v11 = [(GKEventTuple *)v7 eventType];
    id v12 = [(GKEventTuple *)v7 context];
    v13[0] = 67109634;
    v13[1] = v11;
    __int16 v14 = 2112;
    id v15 = v12;
    __int16 v16 = 2112;
    id v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "New launch event(%d) context %@ for client %@", (uint8_t *)v13, 0x1Cu);
  }
}

+ (id)syncQueue
{
  if (qword_1003297A8 != -1) {
    dispatch_once(&qword_1003297A8, &stru_1002DA710);
  }
  v2 = (void *)qword_1003297A0;

  return v2;
}

- (void)performSync:(id)a3
{
  dispatch_block_t block = a3;
  uint64_t v3 = [(id)objc_opt_class() syncQueue];
  id v4 = dispatch_get_current_queue();

  if (v4 == v3)
  {
    label = dispatch_queue_get_label(v3);
    id v6 = +[NSThread callStackSymbols];
    uint64_t v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the same queue(\"%s\"), would deadlock at %@", "-[GKClientProxy performSync:]", label, v6);
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m"];
    id v9 = [v8 lastPathComponent];
    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (dispatch_get_current_queue() != queue)\n[%s (%s:%d)]", v7, "-[GKClientProxy performSync:]", [v9 UTF8String], 603);

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

- (void)checkMatchStatus
{
  id v3 = [(GKClientProxy *)self currentMatchResponse];
  if ([v3 transitionToState:3])
  {
    unsigned int v4 = [v3 sequence];
    id v5 = [v3 matchingGroup];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100100C6C;
    void v7[3] = &unk_1002DA760;
    id v8 = v3;
    id v9 = self;
    unsigned int v11 = v4;
    id v10 = v5;
    id v6 = v5;
    [v6 perform:v7];
  }
}

- (BOOL)processMatchResponse:(id)a3
{
  id v4 = a3;
  id v5 = [(GKClientProxy *)self currentMatchResponse];
  id v6 = v5;
  if (!v5)
  {
    if (!os_log_GKGeneral) {
      id v8 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      sub_10010CA00();
    }
    goto LABEL_28;
  }
  if ([v5 isFinished])
  {
    if (!os_log_GKGeneral) {
      id v7 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
      sub_10010CA34();
    }
    goto LABEL_28;
  }
  if (!v4)
  {
LABEL_28:
    BOOL v16 = 0;
    goto LABEL_29;
  }
  id v9 = [v4 objectForKey:@"rid"];
  id v10 = [v6 rid];

  if (!v10)
  {
    [v6 setRid:v9];
    unsigned int v11 = [v6 serverRequest];
    id v12 = [v11 mutableCopy];

    [v12 setObject:v9 forKey:@"rid"];
    [v6 setServerRequest:v12];
  }
  unsigned int v13 = [v4 objectForKey:@"match-id"];
  __int16 v14 = [v4 objectForKeyedSubscript:@"status"];
  id v15 = [v14 integerValue];

  BOOL v16 = v15 != (id)5067;
  if (v15 == (id)5067)
  {
    [v6 transitionToState:6];
  }
  else if (v13)
  {
    if ([v6 transitionToState:4])
    {
      id v45 = v9;
      [(GKClientProxy *)self cancelOutstandingCheckMatchStatus];
      id v17 = [v4 objectForKey:@"matches"];
      [v6 setMatches:v17];

      id v18 = [v4 objectForKeyedSubscript:@"match-id"];
      [v6 setMatchID:v18];

      id v19 = [v4 objectForKey:@"rid"];
      [v6 setRid:v19];

      id v20 = [v4 objectForKey:@"session-token"];
      [v6 setSessionToken:v20];

      id v21 = [v4 objectForKey:@"ticket"];
      [v6 setCdxTicket:v21];

      uint64_t v22 = GKSuggestedTransportVersionKey;
      id v23 = [v4 objectForKeyedSubscript:GKSuggestedTransportVersionKey];

      if (v23)
      {
        uint64_t v24 = [v4 objectForKeyedSubscript:v22];
        [v6 setTransportVersionToUse:v24];
      }
      id v44 = v13;
      if (!os_log_GKGeneral) {
        id v25 = (id)GKOSLoggers();
      }
      int v26 = (void *)os_log_GKMatch;
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        BOOL v27 = v26;
        id v28 = [v6 matches];
        *(_DWORD *)buf = 138412290;
        v51 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "SUCCESS matches: %@", buf, 0xCu);
      }
      if (!os_log_GKGeneral) {
        id v29 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
        sub_10010CA68();
      }
      id v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKClientProxy.m", 729, "-[GKClientProxy processMatchResponse:]");
      id v31 = +[GKPlayerCredentialController sharedController];
      id v32 = [v31 pushCredentialForEnvironment:-[GKClientProxy environment](self, "environment")];
      dispatch_queue_t v33 = [v32 playerInternal];
      id v34 = [v33 playerID];
      dispatch_queue_t v35 = [(GKClientProxy *)self transactionGroupWithName:v30 forPlayerID:v34];

      id v36 = [v35 context];
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_10010186C;
      v46[3] = &unk_1002D3B38;
      id v47 = v35;
      v48 = self;
      id v37 = v35;
      [v36 performBlockAndWait:v46];

      unsigned int v13 = v44;
      id v9 = v45;
    }
  }
  else
  {
    id v39 = [v4 objectForKey:@"poll-delay-ms"];
    [v39 doubleValue];
    double v41 = v40 / 1000.0;

    dispatch_time_t v42 = dispatch_time(0, (uint64_t)(v41 * 1000000000.0));
    if ([v6 transitionToState:2])
    {
      id v43 = [v6 matchingGroup];
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_10010163C;
      v49[3] = &unk_1002D4460;
      v49[4] = self;
      v49[5] = v42;
      [v43 perform:v49];
    }
  }

LABEL_29:
  return v16;
}

- (void)setCheckMatchStatusTimer:(id)a3
{
  id v4 = (OS_dispatch_source *)a3;
  id v5 = dispatch_get_current_queue();
  id v6 = [(GKClientProxy *)self checkMatchStatusQueue];

  if (v5 != v6)
  {
    label = dispatch_queue_get_label(v5);
    id v8 = [(GKClientProxy *)self checkMatchStatusQueue];
    id v9 = dispatch_queue_get_label(v8);
    id v10 = +[NSThread callStackSymbols];
    unsigned int v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKClientProxy setCheckMatchStatusTimer:]", label, v9, v10);
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m"];
    id v13 = [v12 lastPathComponent];
    __int16 v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_actualCurrentQueue == self.checkMatchStatusQueue)\n[%s (%s:%d)]", v11, "-[GKClientProxy setCheckMatchStatusTimer:]", [v13 UTF8String], 744);

    +[NSException raise:@"GameKit Exception", @"%@", v14 format];
  }

  checkMatchStatusTimer = self->_checkMatchStatusTimer;
  if (checkMatchStatusTimer) {
    dispatch_source_cancel(checkMatchStatusTimer);
  }
  BOOL v16 = self->_checkMatchStatusTimer;
  self->_checkMatchStatusTimer = v4;
}

- (void)cancelOutstandingCheckMatchStatus
{
  id v3 = [(GKClientProxy *)self checkMatchStatusQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100101B68;
  block[3] = &unk_1002D40E0;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)cancelInvitationForSession:(id)a3 playerID:(id)a4 pushTokens:(id)a5 handler:(id)a6
{
  id v30 = a3;
  id v9 = a4;
  id v10 = a5;
  id v28 = a6;
  unsigned int v11 = +[NSMutableArray array];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v41;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v41 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v40 + 1) + 8 * (void)v15);
        v46[0] = @"id";
        v46[1] = @"push-token";
        v47[0] = v9;
        v47[1] = v16;
        id v17 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];
        [v11 addObject:v17];

        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v13);
  }

  v44[0] = @"session-token";
  v44[1] = @"peers";
  v45[0] = v30;
  v45[1] = v11;
  v44[2] = @"reason";
  id v18 = +[NSNumber numberWithInteger:0];
  v45[2] = v18;
  id v29 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:3];

  id v19 = +[GKDataRequestManager sharedManager];
  id v20 = dispatch_group_create();
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = sub_100101F84;
  v38[4] = sub_100101F94;
  id v39 = 0;
  dispatch_group_enter(v20);
  id v21 = [v19 storeBag];
  uint64_t v22 = [v29 _gkPlistXMLDataForClient:self player:0];
  id v23 = +[GKPlayerCredentialController sharedController];
  uint64_t v24 = [v23 pushCredentialForEnvironment:-[GKClientProxy environment](self, "environment")];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100101F9C;
  v35[3] = &unk_1002DA7B0;
  id v37 = v38;
  id v25 = v20;
  id v36 = v25;
  [v21 writeDataForBagKey:@"gk-invitation-cancel" postData:v22 client:self credential:v24 completion:v35];

  int v26 = [(GKClientProxy *)self replyQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010203C;
  block[3] = &unk_1002DA510;
  id v33 = v28;
  id v34 = v38;
  id v27 = v28;
  dispatch_group_notify(v25, v26, block);

  _Block_object_dispose(v38, 8);
}

- (id)fetchOrCreateInviteSession
{
  id v3 = [(GKClientProxy *)self inviteSession];

  if (v3)
  {
    if (!os_log_GKGeneral) {
      id v4 = (id)GKOSLoggers();
    }
    id v5 = (void *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      id v6 = v5;
      id v7 = [(GKClientProxy *)self inviteSession];
      id v8 = [(GKClientProxy *)self inviteSession];
      id v9 = [v8 sessionToken];
      int v19 = 134218242;
      id v20 = v7;
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Already have GKInviteSession(%p), token: %@", (uint8_t *)&v19, 0x16u);

LABEL_10:
    }
  }
  else
  {
    id v10 = objc_alloc_init(GKInviteSession);
    [(GKClientProxy *)self setInviteSession:v10];

    if (!os_log_GKGeneral) {
      id v11 = (id)GKOSLoggers();
    }
    id v12 = (void *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      id v6 = v12;
      id v13 = [(GKClientProxy *)self inviteSession];
      uint64_t v14 = [(GKClientProxy *)self inviteSession];
      id v15 = [v14 sessionToken];
      uint64_t v16 = +[NSThread callStackSymbols];
      int v19 = 134218498;
      id v20 = v13;
      __int16 v21 = 2112;
      uint64_t v22 = v15;
      __int16 v23 = 2112;
      uint64_t v24 = v16;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Created a new GKInviteSession(%p), token: %@. Thread: %@", (uint8_t *)&v19, 0x20u);

      goto LABEL_10;
    }
  }
  id v17 = [(GKClientProxy *)self inviteSession];

  return v17;
}

- (void)deleteInviteSession
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = (void *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    id v5 = v4;
    id v6 = [(GKClientProxy *)self inviteSession];
    int v10 = 134217984;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKClientProxy - deleteInviteSession, self.inviteSession: %p", (uint8_t *)&v10, 0xCu);
  }
  id v7 = [(GKClientProxy *)self inviteSession];
  id v8 = [v7 shareRecordID];

  if (v8)
  {
    id v9 = +[GKCloudKitMultiplayerUtils privateDatabase];
    +[GKCloudKitMultiplayer deleteInviteRecordWithRecordID:v8 fromDatabase:v9];
  }
  [(GKClientProxy *)self setInviteSession:0];
}

- (void)playerFound:(id)a3 deviceID:(id)a4 discoveryInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!os_log_GKGeneral) {
    id v11 = (id)GKOSLoggers();
  }
  id v12 = os_log_GKFastSync;
  if (os_log_type_enabled(os_log_GKFastSync, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412802;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "PeerDiscovery player found: %@, deviceID: %@, discoveryInfo: %@", (uint8_t *)&v13, 0x20u);
  }
  [(GKClientProxy *)self nearbyPlayerFoundForPlayerID:v8 deviceID:v9 discoveryInfo:v10];
}

- (void)playerLost:(id)a3 deviceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  id v9 = os_log_GKFastSync;
  if (os_log_type_enabled(os_log_GKFastSync, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "PeerDiscovery player lost: %@, deviceID: %@", (uint8_t *)&v10, 0x16u);
  }
  [(GKClientProxy *)self nearbyPlayerLostForPlayerID:v6 deviceID:v7];
}

- (void)receivedData:(id)a3 deviceID:(id)a4 data:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!os_log_GKGeneral) {
    id v11 = (id)GKOSLoggers();
  }
  __int16 v12 = os_log_GKFastSync;
  if (os_log_type_enabled(os_log_GKFastSync, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412546;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "PeerDiscovery data received from player: %@, deviceID: %@", (uint8_t *)&v13, 0x16u);
  }
  [(GKClientProxy *)self nearbyDataReceivedForPlayerID:v8 deviceID:v9 data:v10];
}

- (OS_dispatch_queue)authQueue
{
  return self->_authQueue;
}

- (void)setAuthQueue:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
}

- (LSApplicationRecord)applicationRecord
{
  return self->_applicationRecord;
}

- (NSNumber)sandboxExtensionToken
{
  return self->_sandboxExtensionToken;
}

- (void)setSandboxExtensionToken:(id)a3
{
}

- (NSNumber)externalVersion
{
  return self->_externalVersion;
}

- (void)setExternalVersion:(id)a3
{
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void)setBundleVersion:(id)a3
{
}

- (void)setBundleShortVersion:(id)a3
{
}

- (void)setEnvironment:(int64_t)a3
{
  self->_environment = a3;
}

- (void)setInstalled:(BOOL)a3
{
  self->_installed = a3;
}

- (BOOL)supportsMultipleActivePlayers
{
  return self->_supportsMultipleActivePlayers;
}

- (void)setSupportsMultipleActivePlayers:(BOOL)a3
{
  self->_supportsMultipleActivePlayers = a3;
}

- (NSString)persistentAnchorIdentifier
{
  return self->_persistentAnchorIdentifier;
}

- (void)setPersistentAnchorIdentifier:(id)a3
{
}

- (BOOL)isOcelot
{
  return self->_isOcelot;
}

- (void)setIsOcelot:(BOOL)a3
{
  self->_isOcelot = a3;
}

- (BOOL)isGameCenterEnabledClient
{
  return self->_isGameCenterEnabledClient;
}

- (void)setIsGameCenterEnabledClient:(BOOL)a3
{
  self->_isGameCenterEnabledClient = a3;
}

- (void)setIsAppUnlistedAndDisallowed:(BOOL)a3
{
  self->_isAppUnlistedAndDisallowed = a3;
}

- (NSDate)achievementsRateLimitingStartDate
{
  return self->_achievementsRateLimitingStartDate;
}

- (void)setAchievementsRateLimitingStartDate:(id)a3
{
}

- (int64_t)achievementsRateLimitingCurrentNumberOfRequests
{
  return self->_achievementsRateLimitingCurrentNumberOfRequests;
}

- (void)setAchievementsRateLimitingCurrentNumberOfRequests:(int64_t)a3
{
  self->_achievementsRateLimitingCurrentNumberOfRequests = a3;
}

- (unsigned)achievementsRateLimitedCurrentState
{
  return self->_achievementsRateLimitedCurrentState;
}

- (void)setAchievementsRateLimitedCurrentState:(unsigned __int8)a3
{
  self->_achievementsRateLimitedCurrentState = a3;
}

- (NSDate)scoresRateLimitingStartDate
{
  return self->_scoresRateLimitingStartDate;
}

- (void)setScoresRateLimitingStartDate:(id)a3
{
}

- (int64_t)scoresRateLimitingCurrentNumberOfRequests
{
  return self->_scoresRateLimitingCurrentNumberOfRequests;
}

- (void)setScoresRateLimitingCurrentNumberOfRequests:(int64_t)a3
{
  self->_scoresRateLimitingCurrentNumberOfRequests = a3;
}

- (unsigned)scoresRateLimitedCurrentState
{
  return self->_scoresRateLimitedCurrentState;
}

- (void)setScoresRateLimitedCurrentState:(unsigned __int8)a3
{
  self->_scoresRateLimitedCurrentState = a3;
}

- (NSMutableDictionary)alreadyCoalescingNetworkRequests
{
  return self->_alreadyCoalescingNetworkRequests;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (void)setViewService:(id)a3
{
}

- (void)setCurrentGame:(id)a3
{
}

- (void)setNearbyDiscovery:(id)a3
{
}

- (void)setPeerDiscovery:(id)a3
{
}

- (unsigned)previousApplicationState
{
  return self->_previousApplicationState;
}

- (GKEventTuple)launchEvent
{
  return self->_launchEvent;
}

- (void)setLaunchEvent:(id)a3
{
}

- (void)setInviteSession:(id)a3
{
}

- (GKMatchResponse)currentMatchResponse
{
  return (GKMatchResponse *)objc_getProperty(self, a2, 240, 1);
}

- (void)setCurrentMatchResponse:(id)a3
{
}

- (void)setExtensionProxies:(id)a3
{
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (_GKStateMachine)appInitStateMachine
{
  return (_GKStateMachine *)objc_getProperty(self, a2, 256, 1);
}

- (GKThreadsafeDictionary)appSessions
{
  return self->_appSessions;
}

- (void)setAppSessions:(id)a3
{
}

- (OS_dispatch_queue)delayedRequestsQueue
{
  return self->_delayedRequestsQueue;
}

- (void)setDelayedRequestsQueue:(id)a3
{
}

- (GKDatabaseConnection)delayedRequestsDBConnection
{
  return self->_delayedRequestsDBConnection;
}

- (void)setDelayedRequestsDBConnection:(id)a3
{
}

- (OS_dispatch_queue)cacheQueue
{
  return self->_cacheQueue;
}

- (void)setCacheQueue:(id)a3
{
}

- (void)setPendingDataTypesForRefresh:(id)a3
{
}

- (NSDictionary)preferencesFromBag
{
  return self->_preferencesFromBag;
}

- (void)setPreferencesFromBag:(id)a3
{
}

- (OS_dispatch_source)checkMatchStatusTimer
{
  return self->_checkMatchStatusTimer;
}

- (OS_dispatch_queue)checkMatchStatusQueue
{
  return self->_checkMatchStatusQueue;
}

- (void)setCheckMatchStatusQueue:(id)a3
{
}

- (void)setParentBundleIdentifier:(id)a3
{
}

- (BOOL)supportsNearbyAdvertising
{
  return self->_supportsNearbyAdvertising;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_checkMatchStatusQueue, 0);
  objc_storeStrong((id *)&self->_checkMatchStatusTimer, 0);
  objc_storeStrong((id *)&self->_preferencesFromBag, 0);
  objc_storeStrong((id *)&self->_pendingDataTypesForRefresh, 0);
  objc_storeStrong((id *)&self->_cacheQueue, 0);
  objc_storeStrong((id *)&self->_delayedRequestsDBConnection, 0);
  objc_storeStrong((id *)&self->_delayedRequestsQueue, 0);
  objc_storeStrong((id *)&self->_appSessions, 0);
  objc_storeStrong((id *)&self->_appInitStateMachine, 0);
  objc_storeStrong((id *)&self->_extensionProxies, 0);
  objc_storeStrong((id *)&self->_currentMatchResponse, 0);
  objc_storeStrong((id *)&self->_inviteSession, 0);
  objc_storeStrong((id *)&self->_launchEvent, 0);
  objc_storeStrong((id *)&self->_peerDiscovery, 0);
  objc_storeStrong((id *)&self->_nearbyDiscovery, 0);
  objc_storeStrong((id *)&self->_currentGame, 0);
  objc_destroyWeak((id *)&self->_viewService);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_alreadyCoalescingNetworkRequests, 0);
  objc_storeStrong((id *)&self->_scoresRateLimitingStartDate, 0);
  objc_storeStrong((id *)&self->_achievementsRateLimitingStartDate, 0);
  objc_storeStrong((id *)&self->_persistentAnchorIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleShortVersion, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_originalBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_externalVersion, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionToken, 0);
  objc_storeStrong((id *)&self->_applicationRecord, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_authQueue, 0);

  objc_storeStrong((id *)&self->_replyQueue, 0);
}

+ (id)clientForBundleID:(id)a3
{
  return [a1 clientForBundleID:a3 bundle:0 pid:0 createIfNecessary:1];
}

+ (id)clientForProcessIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = +[NSBundle _gkBundleWithPID:](NSBundle, "_gkBundleWithPID:");
  id v6 = [v5 bundleIdentifier];
  id v7 = [a1 clientForBundleID:v6 bundle:v5 pid:v3 createIfNecessary:1];

  return v7;
}

+ (id)foregroundClient
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_100101F84;
  id v9 = sub_100101F94;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100102F2C;
  v4[3] = &unk_1002DA888;
  v4[4] = &v5;
  +[GKClientProxy enumerateClientsUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (id)nonGameCenterForegroundClient
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_100101F84;
  id v9 = sub_100101F94;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001030B0;
  v4[3] = &unk_1002DA888;
  v4[4] = &v5;
  +[GKClientProxy enumerateClientsUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (BOOL)isGameCenterDashboardForegroundRunning
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001032B8;
  void v7[3] = &unk_1002DA888;
  void v7[4] = &v8;
  +[GKClientProxy enumerateClientsUsingBlock:v7];
  if (!os_log_GKGeneral) {
    id v2 = (id)GKOSLoggers();
  }
  uint64_t v3 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    if (*((unsigned char *)v9 + 24)) {
      CFStringRef v4 = @"YES";
    }
    else {
      CFStringRef v4 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "isGameCenterDashboardForegroundRunning: %@", buf, 0xCu);
  }
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

+ (id)clientForInviteSessionToken:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "clientForInviteSessionToken: incoming session token %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = sub_100101F84;
  id v16 = sub_100101F94;
  id v17 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001036B4;
  v10[3] = &unk_1002D3BF0;
  id v7 = v4;
  id v11 = v7;
  p_long long buf = &buf;
  [a1 enumerateClientsUsingBlock:v10];
  id v8 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);

  return v8;
}

+ (id)clientForMatchmakingRID:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  CFStringRef v13 = sub_100101F84;
  uint64_t v14 = sub_100101F94;
  id v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010394C;
  void v7[3] = &unk_1002DA8B0;
  id v9 = &v10;
  id v4 = a3;
  id v8 = v4;
  [a1 enumerateClientsUsingBlock:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v5;
}

+ (id)clientsToBeEnumerated
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_100101F84;
  id v11 = sub_100101F94;
  id v12 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v3 = [a1 factoryQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_100103B30;
  v6[3] = &unk_1002DA928;
  v6[4] = &v7;
  v6[5] = a1;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (void)enumerateClientsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [a1 clientsToBeEnumerated];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100103CF4;
  void v7[3] = &unk_1002DA950;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

+ (void)removeClient:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bundleIdentifier];
  if (v5)
  {
    [v4 setConnection:0];
    id v6 = [a1 factoryQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100103DEC;
    block[3] = &unk_1002D3F20;
    id v10 = a1;
    id v8 = v5;
    id v9 = v4;
    dispatch_async(v6, block);
  }
}

- (void)setHostPID:(int)a3 reply:(id)a4
{
  if (a4) {
    dispatch_async((dispatch_queue_t)self->_replyQueue, a4);
  }
}

- (void)messagesDidReceiveGameCenterURL:(id)a3 senderHandle:(id)a4 contactID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = [v8 absoluteString];
    if (!os_log_GKGeneral) {
      id v12 = (id)GKOSLoggers();
    }
    CFStringRef v13 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412802;
      id v65 = v9;
      __int16 v66 = 2112;
      id v67 = v10;
      __int16 v68 = 2112;
      v69 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Received URL from %@ (%@) : %@", buf, 0x20u);
    }
    if (!v11) {
      goto LABEL_35;
    }
    v51 = self;
    v55 = v11;
    id v54 = [objc_alloc((Class)NSURLComponents) initWithURL:v8 resolvingAgainstBaseURL:0];
    uint64_t v14 = [v54 queryItems];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v15 = [v14 countByEnumeratingWithState:&v59 objects:v63 count:16];
    if (!v15) {
      goto LABEL_34;
    }
    id v16 = v15;
    id v52 = v9;
    id v53 = v10;
    id v17 = 0;
    uint64_t v18 = *(void *)v60;
    uint64_t v19 = GKFriendRequestURLZippedData;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v60 != v18) {
          objc_enumerationMutation(v14);
        }
        __int16 v21 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        uint64_t v22 = [v21 name];
        unsigned int v23 = [v22 isEqualToString:v19];

        if (v23)
        {
          id v24 = v21;

          id v17 = v24;
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v59 objects:v63 count:16];
    }
    while (v16);
    id v9 = v52;
    id v10 = v53;
    if (!v17)
    {
LABEL_34:

      id v11 = v55;
LABEL_35:

      goto LABEL_36;
    }
    id v25 = objc_alloc((Class)NSData);
    int v26 = [v17 value];
    id v27 = [v25 initWithBase64EncodedString:v26 options:0];

    id v28 = [v27 _gkZippedDictionaryValue];
    id v29 = [v28 mutableCopy];

    id v30 = [v29 objectForKeyedSubscript:GKFriendRequestURLFriendCode];
    id v47 = [v29 objectForKeyedSubscript:GKFriendRequestURLSenderAlias];
    v48 = [v29 objectForKeyedSubscript:GKFriendRequestURLSenderPlayerID];
    id v46 = [v55 dataUsingEncoding:4];
    v49 = [v46 base64EncodedStringWithOptions:0];
    id v31 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v32 = (id)GKOSLoggers();
      id v31 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412802;
      id v65 = v30;
      __int16 v66 = 2112;
      id v67 = v47;
      __int16 v68 = 2112;
      v69 = v49;
      _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "New friend request with code: %@, senderAlias: %@, decoded url to %@", buf, 0x20u);
      if (v30) {
        goto LABEL_21;
      }
    }
    else if (v30)
    {
LABEL_21:
      uint64_t v50 = v30;
      id v44 = v27;
      [v29 setObject:v49 forKeyedSubscript:GKFriendRequestURL];
      [v29 setObject:v52 forKeyedSubscript:GKFriendRequestURLSenderHandle];
      [v29 setObject:v53 forKeyedSubscript:GKFriendRequestURLContactID];
      id v33 = +[NSDate now];
      [v29 setObject:v33 forKeyedSubscript:GKFriendRequestTimestamp];

      os_unfair_lock_lock(+[GKFriendServicePrivate messageInboxEntriesLock]);
      uint64_t v34 = +[GKFriendServicePrivate messageInboxLocation];
      id v35 = +[NSDictionary dictionaryWithContentsOfFile:v34];
      if (!v35) {
        id v35 = objc_alloc_init((Class)NSDictionary);
      }
      id v36 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v35];
      [v36 setObject:v29 forKeyedSubscript:v50];
      id v45 = (void *)v34;
      id v10 = v53;
      unsigned int v43 = [v36 writeToFile:v34 atomically:1];
      if ((v43 & 1) == 0)
      {
        if (!os_log_GKGeneral) {
          id v37 = (id)GKOSLoggers();
        }
        id v38 = os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412546;
          id v65 = v45;
          __int16 v66 = 2112;
          id v67 = v29;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Failed to write message inbox: %@ value of: %@", buf, 0x16u);
        }
      }
      os_unfair_lock_unlock(+[GKFriendServicePrivate messageInboxEntriesLock]);
      id v39 = [v35 objectForKeyedSubscript:v50];

      if (!v39)
      {
        long long v40 = [v50 componentsSeparatedByString:@"|"];
        long long v41 = [v40 objectAtIndexedSubscript:0];

        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472;
        v56[2] = sub_1001044F8;
        v56[3] = &unk_1002DA9A0;
        id v57 = v48;
        id v58 = v41;
        id v42 = v41;
        [(GKClientProxy *)v51 getAuthenticatedLocalPlayersWithStatus:1 handler:v56];
      }
      if (v43) {
        +[GKClientProxy enumerateClientsUsingBlock:&stru_1002DA9C0];
      }

      id v27 = v44;
      id v30 = v50;
    }

    goto LABEL_34;
  }
LABEL_36:
}

- (void)setTestGame:(id)a3 protocolVersion:(id)a4 reply:(id)a5
{
  id v6 = a5;
  uint64_t v7 = v6;
  if (v6)
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100104760;
    block[3] = &unk_1002D3A20;
    id v10 = v6;
    dispatch_async(replyQueue, block);
  }
}

- (void)getAuthenticatedPlayerInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = sub_100101F84;
    v17[4] = sub_100101F94;
    id v18 = 0;
    id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKClientProxy.m", 1425, "-[GKClientProxy(GKDaemonProtocol) getAuthenticatedPlayerInfo:]");
    id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

    uint64_t v7 = [(GKClientProxy *)self entitlements];
    unsigned int v8 = [v7 hasEntitlements:0x10000];

    if (v8)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100104990;
      v14[3] = &unk_1002DAA10;
      v14[4] = self;
      id v16 = v17;
      id v15 = v6;
      [v15 perform:v14];
    }
    id v9 = [(GKClientProxy *)self replyQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100104A98;
    v11[3] = &unk_1002D3930;
    id v13 = v4;
    id v10 = v6;
    id v12 = v10;
    [v10 notifyOnQueue:v9 block:v11];

    _Block_object_dispose(v17, 8);
  }
}

- (void)getAuthenticatedPlayerCredential:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = sub_100101F84;
    v17[4] = sub_100101F94;
    id v18 = 0;
    id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKClientProxy.m", 1458, "-[GKClientProxy(GKDaemonProtocol) getAuthenticatedPlayerCredential:]");
    id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

    uint64_t v7 = [(GKClientProxy *)self entitlements];
    unsigned int v8 = [v7 hasEntitlements:0x200000000];

    if (v8)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100104D1C;
      v14[3] = &unk_1002DAA10;
      v14[4] = self;
      id v16 = v17;
      id v15 = v6;
      [v15 perform:v14];
    }
    id v9 = [(GKClientProxy *)self replyQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100104E74;
    v11[3] = &unk_1002D3930;
    id v13 = v4;
    id v10 = v6;
    id v12 = v10;
    [v10 notifyOnQueue:v9 block:v11];

    _Block_object_dispose(v17, 8);
  }
}

- (void)getGamedFiredUpWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKClientProxy.m", 1519, "-[GKClientProxy(GKDaemonProtocol) getGamedFiredUpWithHandler:]");
    id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

    if (!os_log_GKGeneral) {
      id v7 = (id)GKOSLoggers();
    }
    unsigned int v8 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "gamed is loaded and initialized.", buf, 2u);
    }
    id v9 = [(GKClientProxy *)self replyQueue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10010505C;
    v10[3] = &unk_1002D3930;
    id v11 = @"Gamed at your service";
    id v12 = v4;
    [v6 notifyOnQueue:v9 block:v10];
  }
}

- (void)getAuthenticatedLocalPlayersWithStatus:(unint64_t)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = +[GKPlayerCredentialController sharedController];
  int64_t v8 = [(GKClientProxy *)self environment];
  id v9 = [v7 allCredentialsForEnvironment:v8];
  id v10 = [v7 primaryCredentialForEnvironment:v8];
  if (v10)
  {
    id v11 = [(GKClientProxy *)self bundleIdentifier];
    unsigned __int8 v12 = [v11 isEqualToString:@"com.apple.gamecenter"];

    if ((v12 & 1) == 0)
    {
      id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKClientProxy.m", 1542, "-[GKClientProxy(GKDaemonProtocol) getAuthenticatedLocalPlayersWithStatus:handler:]");
      uint64_t v14 = [v10 playerInternal];
      id v15 = [v14 playerID];
      id v16 = [(GKClientProxy *)self transactionGroupWithName:v13 forPlayerID:v15];
    }
  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100105388;
  v29[3] = &unk_1002DAA60;
  id v17 = v10;
  id v31 = self;
  unint64_t v32 = a3;
  id v30 = v17;
  id v18 = [v9 _gkFilterWithBlock:v29];
  uint64_t v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKClientProxy.m", 1600, "-[GKClientProxy(GKDaemonProtocol) getAuthenticatedLocalPlayersWithStatus:handler:]");
  id v20 = +[GKDispatchGroup dispatchGroupWithName:v19];

  [v20 setObject:v18 forKeyedSubscript:@"players"];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100105588;
  v26[3] = &unk_1002DAAB0;
  id v21 = v20;
  id v27 = v21;
  id v28 = self;
  [v18 enumerateObjectsUsingBlock:v26];
  if (v6)
  {
    uint64_t v22 = [(GKClientProxy *)self replyQueue];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100105BE8;
    v23[3] = &unk_1002D3930;
    id v25 = v6;
    id v24 = v21;
    [v24 notifyOnQueue:v22 block:v23];
  }
}

- (void)getAccountNameWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKClientProxy.m", 1671, "-[GKClientProxy(GKDaemonProtocol) getAccountNameWithHandler:]");
    id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

    id v7 = [(GKClientProxy *)self entitlements];
    unsigned int v8 = [v7 hasEntitlements:0x10000];

    if (v8)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100105DF4;
      v14[3] = &unk_1002D4050;
      id v15 = v6;
      [v15 perform:v14];
    }
    id v9 = [(GKClientProxy *)self replyQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100105E90;
    v11[3] = &unk_1002D3930;
    id v12 = v6;
    id v13 = v4;
    id v10 = v6;
    [v10 notifyOnQueue:v9 block:v11];
  }
}

- (void)getAuthenticatedPlayerIDWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    void v6[2] = sub_100105F8C;
    v6[3] = &unk_1002D4588;
    id v7 = v4;
    [(GKClientProxy *)self getAuthenticatedPlayerInfo:v6];
  }
}

- (void)localizedMessageFromDictionary:(id)a3 forBundleID:(id)a4 handler:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    id v9 = +[NSBundle _gkLocalizedMessageFromDictionary:a3 forBundleID:a4];
    id v10 = [(GKClientProxy *)self replyQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001060D8;
    v12[3] = &unk_1002D3930;
    id v13 = v9;
    id v14 = v8;
    id v11 = v9;
    dispatch_async(v10, v12);
  }
}

- (void)loadRemoteImageDataForURL:(id)a3 reply:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void))a4;
  if (v6)
  {
    if ([v8 _gkIsValidServerURL])
    {
      id v7 = [(GKClientProxy *)self replyQueue];
      +[NSData _gkRequestClientsRemoteImageDataForURL:v8 queue:v7 reply:v6];
    }
    else
    {
      v6[2](v6, 0);
    }
  }
}

- (void)resetLoginCancelCount
{
  if (!os_log_GKGeneral) {
    id v2 = (id)GKOSLoggers();
  }
  uint64_t v3 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "resetCancelledLogins: user will be presented with fullscreen sheet if they are not signed in", v6, 2u);
  }
  id v4 = +[GKPlayerCredentialController sharedController];
  id v5 = [v4 signInVisibilityManager];
  [v5 reset];
}

- (void)handleCloudKitShareMetadata:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[GKActivity named:@"handleCloudKitShareMetadata"];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10010632C;
  v10[3] = &unk_1002D3C38;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 execute:v10];
}

+ (void)authenticationDidChange
{
}

- (void)sendAuthenticationDidChangeNotificationWithAuthenticatingBundleID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKClientProxy.m", 1750, "-[GKClientProxy(Authentication) sendAuthenticationDidChangeNotificationWithAuthenticatingBundleID:completionHandler:]");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001064FC;
  v11[3] = &unk_1002D3A48;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  +[GKActivity named:v8 execute:v11];
}

- (id)missingTransitionFromState:(id)a3 toState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v8 = (id)GKOSLoggers();
    id v7 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10010CBF0();
  }

  return v6;
}

- (void)stateDidChange
{
  if (self->_pid && self->_bundleIdentifier)
  {
    uint64_t v3 = objc_opt_class();
    id v4 = [(_GKStateMachine *)self->_appInitStateMachine currentState];
    [v3 saveAppInitState:v4 forBundleID:self->_bundleIdentifier pid:self->_pid];
  }
}

- (BOOL)setAppInitState:(id)a3
{
  return [(_GKStateMachine *)self->_appInitStateMachine applyState:a3];
}

- (id)appInitState
{
  return [(_GKStateMachine *)self->_appInitStateMachine currentState];
}

- (id)verifyAuthorized
{
  uint64_t v3 = +[GKPreferences shared];
  unsigned __int8 v4 = [v3 isGameCenterRestricted];

  if (v4)
  {
    uint64_t v5 = 10;
LABEL_7:
    id v9 = +[NSError userErrorForCode:v5 underlyingError:0];
    goto LABEL_8;
  }
  id v6 = +[GKPreferences shared];
  unsigned __int8 v7 = [v6 lockedDown];

  if (v7)
  {
    uint64_t v5 = 36;
    goto LABEL_7;
  }
  id v8 = [(GKClientProxy *)self appInitState];

  if (v8 != @"GKAppInitialized")
  {
    uint64_t v5 = 6;
    goto LABEL_7;
  }
  id v9 = 0;
LABEL_8:

  return v9;
}

+ (void)saveAppInitState:(id)a3 forBundleID:(id)a4 pid:(int)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = GKSavedAuthentiactionStateQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010695C;
  block[3] = &unk_1002DAB60;
  id v13 = v7;
  id v14 = v8;
  int v15 = a5;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

- (id)connectionProxyForUseCase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GKClientProxy *)self connection];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100106F0C;
  v9[3] = &unk_1002DAB88;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

- (void)metricsValuesChanged
{
  id v2 = [(GKClientProxy *)self connectionProxyForUseCase:@"metricsValuesChanged"];
  [v2 metricsValuesChanged];
}

- (void)presentBannerWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(GKClientProxy *)self connectionProxyForUseCase:@"presentBannerWithNotification"];
  [v5 presentBannerWithNotification:v4];
}

- (void)requestSandboxExtension:(id)a3
{
  id v4 = a3;
  id v5 = [(GKClientProxy *)self connectionProxyForUseCase:@"requestSandboxExtension"];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001070F4;
  void v7[3] = &unk_1002DABB0;
  id v8 = v4;
  id v6 = v4;
  [v5 requestSandboxExtension:v7];
}

- (void)beginNetworkActivity
{
  id v2 = [(GKClientProxy *)self connectionProxyForUseCase:@"beginNetworkActivity"];
  [v2 beginNetworkActivity];
}

- (void)endNetworkActivity
{
  id v2 = [(GKClientProxy *)self connectionProxyForUseCase:@"endNetworkActivity"];
  [v2 endNetworkActivity];
}

- (void)resetNetworkActivity
{
  id v2 = [(GKClientProxy *)self connectionProxyForUseCase:@"resetNetworkActivity"];
  [v2 resetNetworkActivity];
}

- (void)respondedToNearbyInvite:(id)a3
{
  id v4 = a3;
  id v5 = [(GKClientProxy *)self connectionProxyForUseCase:@"respondedToNearbyInvite"];
  [v5 respondedToNearbyInvite:v4];
}

- (void)friendRequestSelected:(id)a3
{
  id v7 = a3;
  id v4 = [(GKClientProxy *)self connectionProxyForUseCase:@"friendRequestSelected"];
  id v5 = [(GKClientProxy *)self bundleIdentifier];
  unsigned int v6 = [v5 isEqualToString:GKGameCenterIdentifier];

  if (v6) {
    [v4 friendRequestSelected:v7];
  }
}

- (void)receivedChallengeSelected:(id)a3
{
  id v4 = a3;
  id v5 = [(GKClientProxy *)self connectionProxyForUseCase:@"receivedChallengeSelected"];
  [v5 receivedChallengeSelected:v4];
}

- (void)completedChallengeSelected:(id)a3
{
  id v4 = a3;
  id v5 = [(GKClientProxy *)self connectionProxyForUseCase:@"completedChallengeSelected"];
  [v5 completedChallengeSelected:v4];
}

- (void)challengeReceived:(id)a3
{
  id v4 = a3;
  id v5 = [(GKClientProxy *)self connectionProxyForUseCase:@"challengeReceived"];
  [v5 challengeReceived:v4];
}

- (void)challengeCompleted:(id)a3
{
  id v4 = a3;
  id v5 = [(GKClientProxy *)self connectionProxyForUseCase:@"challengeCompleted"];
  [v5 challengeCompleted:v4];
}

- (void)scoreSelected:(id)a3
{
  id v4 = a3;
  id v5 = [(GKClientProxy *)self connectionProxyForUseCase:@"scoreSelected"];
  [v5 scoreSelected:v4];
}

- (void)achievementSelected:(id)a3
{
  id v4 = a3;
  id v5 = [(GKClientProxy *)self connectionProxyForUseCase:@"achievement"];
  [v5 achievementSelected:v4];
}

- (void)fetchTurnBasedData
{
  id v3 = [(GKClientProxy *)self connectionProxyForUseCase:@"fetchTurnBasedData"];
  [v3 fetchTurnBasedData];
  [(GKClientProxy *)self refreshContentsForDataType:14 userInfo:0];
}

- (void)acceptMultiplayerGameInvite
{
  id v5 = [(GKClientProxy *)self connectionProxyForUseCase:@"acceptMultiplayerGameInvite"];
  [v5 acceptMultiplayerGameInvite];
  id v3 = [(GKClientProxy *)self viewService];
  [v3 acceptMultiplayerGameInvite];

  id v4 = [(GKClientProxy *)self extensionProxies];
  [v4 _gkEnumerateKeysAndObjectsUsingBlock:&stru_1002DABF0];
}

- (void)acceptInviteWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(GKClientProxy *)self connectionProxyForUseCase:@"acceptInviteWithNotification"];
  [v5 acceptInviteWithNotification:v4];
  unsigned int v6 = [(GKClientProxy *)self viewService];
  [v6 acceptInviteWithNotification:v4];

  id v7 = [(GKClientProxy *)self extensionProxies];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100107740;
  v9[3] = &unk_1002DAC18;
  id v10 = v4;
  id v8 = v4;
  [v7 _gkEnumerateKeysAndObjectsUsingBlock:v9];
}

- (void)declineInviteWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(GKClientProxy *)self connectionProxyForUseCase:@"declineInviteWithNotification"];
  [v5 declineInviteWithNotification:v4];
  unsigned int v6 = [(GKClientProxy *)self viewService];
  [v6 declineInviteWithNotification:v4];

  id v7 = [(GKClientProxy *)self extensionProxies];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100107844;
  v9[3] = &unk_1002DAC18;
  id v10 = v4;
  id v8 = v4;
  [v7 _gkEnumerateKeysAndObjectsUsingBlock:v9];
}

- (void)updateInviteWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(GKClientProxy *)self connection];
  unsigned int v6 = [v5 remoteObjectProxyWithErrorHandler:&stru_1002DAC38];

  if (v6)
  {
    [v6 updateInviteWithNotification:v4];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v7 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_10010CCD4();
    }
  }
}

- (void)cancelInviteWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(GKClientProxy *)self connectionProxyForUseCase:@"cancelInviteWithNotification"];
  [v5 cancelInviteWithNotification:v4];
  unsigned int v6 = [(GKClientProxy *)self viewService];
  [v6 cancelInviteWithNotification:v4];

  id v7 = [(GKClientProxy *)self extensionProxies];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100107A78;
  v9[3] = &unk_1002DAC18;
  id v10 = v4;
  id v8 = v4;
  [v7 _gkEnumerateKeysAndObjectsUsingBlock:v9];
}

- (void)cancelGameInvite:(id)a3
{
  id v4 = a3;
  id v5 = [(GKClientProxy *)self connectionProxyForUseCase:@"cancelGameInvite"];
  [v5 cancelGameInvite:v4];
  unsigned int v6 = [(GKClientProxy *)self viewService];
  [v6 cancelGameInvite:v4];

  id v7 = [(GKClientProxy *)self extensionProxies];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100107B7C;
  v9[3] = &unk_1002DAC18;
  id v10 = v4;
  id v8 = v4;
  [v7 _gkEnumerateKeysAndObjectsUsingBlock:v9];
}

- (void)nearbyPlayerFoundForPlayerID:(id)a3 deviceID:(id)a4 discoveryInfo:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(GKClientProxy *)self connectionProxyForUseCase:@"nearbyPlayerFound"];
  [v11 nearbyPlayerFoundForPlayerID:v10 deviceID:v9 discoveryInfo:v8];
}

- (void)nearbyPlayerLostForPlayerID:(id)a3 deviceID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKClientProxy *)self connectionProxyForUseCase:@"nearbyPlayerLost"];
  [v8 nearbyPlayerLostForPlayerID:v7 deviceID:v6];
}

- (void)nearbyDataReceivedForPlayerID:(id)a3 deviceID:(id)a4 data:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(GKClientProxy *)self connectionProxyForUseCase:@"nearbyDataReceived"];
  [v11 nearbyDataReceivedForPlayerID:v10 deviceID:v9 data:v8];
}

- (void)relayPushNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(GKClientProxy *)self connectionProxyForUseCase:@"relayPushNotification"];
  [v5 relayPushNotification:v4];
  id v6 = [(GKClientProxy *)self viewService];
  [v6 relayPushNotification:v4];

  id v7 = [(GKClientProxy *)self extensionProxies];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100107E34;
  v9[3] = &unk_1002DAC18;
  id v10 = v4;
  id v8 = v4;
  [v7 _gkEnumerateKeysAndObjectsUsingBlock:v9];
}

- (void)didConnectToParticipantWithID:(id)a3
{
  id v4 = a3;
  id v5 = [(GKClientProxy *)self connectionProxyForUseCase:@"didConnectToParticipantWithID"];
  [v5 didConnectToParticipantWithID:v4];
}

- (void)didDisconnectFromParticipantWithID:(id)a3
{
  id v4 = a3;
  id v5 = [(GKClientProxy *)self connectionProxyForUseCase:@"didDisconnectFromParticipantWithID"];
  [v5 didDisconnectFromParticipantWithID:v4];
}

- (void)didReceiveData:(id)a3 reliably:(BOOL)a4 forRecipients:(id)a5 fromSender:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(GKClientProxy *)self connectionProxyForUseCase:@"didReceiveData"];
  [v13 didReceiveData:v12 reliably:v7 forRecipients:v11 fromSender:v10];
}

- (void)setBadgeCount:(unint64_t)a3 forType:(unint64_t)a4
{
  id v6 = [(GKClientProxy *)self connectionProxyForUseCase:@"setBadgeCount:forType:"];
  [v6 setBadgeCount:a3 forType:a4];
}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (([(GKClientProxy *)self applicationState] == 2
     || [(GKClientProxy *)self applicationState] == 4)
    && ![(GKClientProxy *)self isExtension]
    && ![(GKClientProxy *)self isUIService])
  {
    if (!os_log_GKGeneral) {
      id v15 = (id)GKOSLoggers();
    }
    id v16 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v21) = v4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "App is backgrounded, defering refresh until app is running in foreground for data type = %i", buf, 8u);
    }
    BOOL v7 = objc_alloc_init(GKRefreshData);
    [(GKRefreshData *)v7 setDataType:v4];
    [(GKRefreshData *)v7 setUserInfo:v6];
    id v14 = [(GKClientProxy *)self pendingDataTypesForRefresh];
    [v14 addObject:v7];
  }
  else
  {
    BOOL v7 = [(GKClientProxy *)self connectionProxyForUseCase:@"refreshContentsForDataType"];
    if (!os_log_GKGeneral) {
      id v8 = (id)GKOSLoggers();
    }
    id v9 = (void *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      id v10 = v9;
      id v11 = GKRefreshDataTypeAsString();
      *(_DWORD *)long long buf = 138412546;
      id v21 = v11;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKRefreshContents - refreshing contents for dataType: %@ userInfo: %@", buf, 0x16u);
    }
    [(GKRefreshData *)v7 refreshContentsForDataType:v4 userInfo:v6];
    id v12 = [(GKClientProxy *)self viewService];
    [v12 refreshContentsForDataType:v4 userInfo:v6];

    id v13 = [(GKClientProxy *)self extensionProxies];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001082D0;
    v17[3] = &unk_1002DAC60;
    int v19 = v4;
    id v18 = v6;
    [v13 _gkEnumerateKeysAndObjectsUsingBlock:v17];

    id v14 = v18;
  }
}

- (void)setPreferencesValues:(id)a3
{
  id v4 = a3;
  id v5 = [(GKClientProxy *)self connection];
  id v6 = [v5 remoteObjectProxy];

  [v6 setPreferencesValues:v4];
  BOOL v7 = [(GKClientProxy *)self viewService];
  [v7 setPreferencesValues:v4];

  id v8 = [(GKClientProxy *)self extensionProxies];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001083E4;
  v10[3] = &unk_1002DAC18;
  id v11 = v4;
  id v9 = v4;
  [v8 _gkEnumerateKeysAndObjectsUsingBlock:v10];
}

- (void)getPreferenceForKey:(id)a3 handler:(id)a4
{
  id v5 = (void (**)(id, id, BOOL))a4;
  if (v5)
  {
    id v9 = v5;
    id v6 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, GKGameCenterIdentifier);
    BOOL v7 = v9;
    if (v6)
    {
      id v8 = [v6 BOOLValue];
      BOOL v7 = v9;
    }
    else
    {
      id v8 = 0;
    }
    v7[2](v9, v8, v6 != 0);

    id v5 = v9;
  }
}

- (void)setCurrentGame:(id)a3 serverEnvironment:(int64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_group_t v10 = dispatch_group_create();
  id v11 = [(GKClientProxy *)self bundleVersion];
  if (v11) {
    [v8 setBundleVersion:v11];
  }
  id v12 = [(GKClientProxy *)self bundleShortVersion];
  if (v12) {
    [v8 setShortBundleVersion:v12];
  }
  [(GKClientProxy *)self setCurrentGame:v8];
  id v13 = [(GKClientProxy *)self connection];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100108754;
  v28[3] = &unk_1002DAB88;
  id v14 = v10;
  id v29 = v14;
  id v15 = [v13 remoteObjectProxyWithErrorHandler:v28];

  if (v15)
  {
    dispatch_group_enter(v14);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1001087E4;
    v26[3] = &unk_1002D40E0;
    id v27 = v14;
    [v15 setCurrentGame:v8 serverEnvironment:a4 reply:v26];
  }
  id v16 = [(GKClientProxy *)self viewService];
  id v17 = v16;
  if (v16) {
    [v16 setCurrentGame:v8 serverEnvironment:a4 reply:&stru_1002DAC80];
  }
  id v18 = [(GKClientProxy *)self extensionProxies];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001087F0;
  v23[3] = &unk_1002DACC8;
  id v19 = v8;
  id v24 = v19;
  int64_t v25 = a4;
  [v18 _gkEnumerateKeysAndObjectsUsingBlock:v23];

  if (v9)
  {
    replyQueue = self->_replyQueue;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10010880C;
    v21[3] = &unk_1002D3A20;
    id v22 = v9;
    dispatch_group_notify(v14, replyQueue, v21);
  }
}

- (GKGameInternal)currentGame
{
  currentGame = self->_currentGame;
  if (currentGame)
  {
    id v3 = currentGame;
  }
  else
  {
    id v3 = (GKGameInternal *)objc_opt_new();
    id v5 = [(GKClientProxy *)self bundleIdentifier];
    [(GKGameInternal *)v3 setBundleIdentifier:v5];

    id v6 = [(GKClientProxy *)self bundleVersion];
    [(GKGameInternal *)v3 setBundleVersion:v6];

    BOOL v7 = [(GKClientProxy *)self bundleShortVersion];
    [(GKGameInternal *)v3 setShortBundleVersion:v7];

    id v8 = [(GKClientProxy *)self bundleIdentifier];
    [(GKGameInternal *)v3 setName:v8];

    id v9 = [(GKClientProxy *)self bundleIdentifier];
    if (v9)
    {
      dispatch_group_t v10 = [(GKClientProxy *)self bundleIdentifier];
      [(GKGameInternal *)v3 setPlatform:+[GKApplicationWorkspace getPlatformForBundleID:v10]];
    }
    else
    {
      [(GKGameInternal *)v3 setPlatform:+[GKGameDescriptor currentPlatform]];
    }
  }

  return v3;
}

- (void)completedOptimisticAuthenticationWithResponse:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKClientProxy *)self connection];
  id v9 = [v8 remoteObjectProxy];

  [v9 completedOptimisticAuthenticationWithResponse:v7 error:v6];
}

- (void)authenticatedPlayersDidChange:(id)a3 authenticatingBundleID:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKClientProxy.m", 2300, "-[GKClientProxy(GKClientInterface) authenticatedPlayersDidChange:authenticatingBundleID:reply:]");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100108B28;
  v15[3] = &unk_1002D39F8;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  +[GKActivity named:v11 execute:v15];
}

- (id)appTerminateRequestWithBackgroundFlag:(BOOL)a3
{
  v9[0] = @"background";
  id v3 = +[NSNumber numberWithBool:a3];
  v10[0] = v3;
  v9[1] = @"timestamp";
  id v4 = +[NSDate _gkServerTimestamp];
  v10[1] = v4;
  v9[2] = @"udid";
  id v5 = +[GKDevice currentDevice];
  id v6 = [v5 udid];
  v10[2] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

- (void)terminateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKClientProxy.m", 2355, "-[GKClientProxy(GKClientInterface) terminateWithCompletionHandler:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  if ([(GKClientProxy *)self initialized])
  {
    id v7 = [(GKClientProxy *)self appTerminateRequestWithBackgroundFlag:0];
    id v8 = [(GKThreadsafeDictionary *)self->_appSessions dictionaryCopy];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100109204;
    v14[3] = &unk_1002DAD80;
    id v15 = v6;
    id v16 = self;
    id v17 = v7;
    id v9 = v7;
    [v8 enumerateKeysAndObjectsUsingBlock:v14];
  }
  if (v4)
  {
    id v10 = dispatch_get_global_queue(0, 0);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100109534;
    v11[3] = &unk_1002D3930;
    id v13 = v4;
    id v12 = v6;
    [v12 notifyOnQueue:v10 block:v11];
  }
}

- (void)backgroundWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKClientProxy.m", 2388, "-[GKClientProxy(GKClientInterface) backgroundWithCompletionHandler:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  if ([(GKClientProxy *)self initialized])
  {
    id v7 = [(GKClientProxy *)self appTerminateRequestWithBackgroundFlag:1];
    appSessions = self->_appSessions;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100109770;
    v14[3] = &unk_1002DADA8;
    id v15 = v6;
    id v16 = self;
    id v17 = v7;
    id v9 = v7;
    [(GKThreadsafeDictionary *)appSessions readFromDictionary:v14];
  }
  if (v4)
  {
    id v10 = dispatch_get_global_queue(0, 0);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100109B44;
    v11[3] = &unk_1002D3930;
    id v13 = v4;
    id v12 = v6;
    [v12 notifyOnQueue:v10 block:v11];
  }
}

- (void)addAppSession:(id)a3 forCredential:(id)a4
{
  if (a3)
  {
    appSessions = self->_appSessions;
    v11[0] = a3;
    v11[1] = a4;
    id v6 = a4;
    id v7 = a3;
    id v8 = +[NSArray arrayWithObjects:v11 count:2];
    id v9 = [v6 playerInternal];
    id v10 = [v9 playerID];
    [(GKThreadsafeDictionary *)appSessions setObject:v8 forKey:v10];
  }
}

- (id)appSessionForPlayer:(id)a3
{
  appSessions = self->_appSessions;
  id v4 = [a3 playerID];
  id v5 = [(GKThreadsafeDictionary *)appSessions objectForKey:v4];

  id v6 = [v5 firstObject];

  return v6;
}

- (void)removeAppSessionForPlayer:(id)a3
{
}

- (void)initializeWithCredential:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKClientProxy.m", 2442, "-[GKClientProxy(GKClientInterface) initializeWithCredential:completionHandler:]");
  id v9 = +[GKDispatchGroup dispatchGroupWithName:v8];

  v29[0] = @"background";
  BOOL v10 = [(GKClientProxy *)self previousApplicationState] == 2
     || [(GKClientProxy *)self previousApplicationState] == 4;
  id v11 = +[NSNumber numberWithInt:v10];
  v30[0] = v11;
  v29[1] = @"timestamp";
  id v12 = +[NSDate _gkServerTimestamp];
  v30[1] = v12;
  v29[2] = @"udid";
  id v13 = +[GKDevice currentDevice];
  id v14 = [v13 udid];
  v30[2] = v14;
  id v15 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100109FF8;
  v25[3] = &unk_1002D48B0;
  v25[4] = self;
  id v26 = v6;
  id v27 = v15;
  id v16 = v9;
  id v28 = v16;
  id v17 = v15;
  id v18 = v6;
  [v16 perform:v25];
  id v19 = dispatch_get_global_queue(0, 0);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10010A25C;
  v22[3] = &unk_1002D3AE8;
  id v23 = v16;
  id v24 = v7;
  v22[4] = self;
  id v20 = v16;
  id v21 = v7;
  [v20 notifyOnQueue:v19 block:v22];
}

- (void)bgInitializeWithCredential:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKClientProxy.m", 2485, "-[GKClientProxy(GKClientInterface) bgInitializeWithCredential:completionHandler:]");
  id v9 = +[GKDispatchGroup dispatchGroupWithName:v8];

  CFStringRef v23 = @"timestamp";
  BOOL v10 = +[NSDate _gkServerTimestamp];
  id v24 = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10010A534;
  v19[3] = &unk_1002D48B0;
  v19[4] = self;
  id v12 = v6;
  id v20 = v12;
  id v13 = v11;
  id v21 = v13;
  id v14 = v9;
  id v22 = v14;
  [v14 perform:v19];
  if (v7)
  {
    id v15 = dispatch_get_global_queue(0, 0);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10010A6DC;
    v16[3] = &unk_1002D3930;
    id v18 = v7;
    id v17 = v14;
    [v17 notifyOnQueue:v15 block:v16];
  }
}

+ (id)storeAndForwardDirectoryPathForEnvironment:(int64_t)a3
{
  id v4 = GKSupportDataRoot();
  id v5 = v4;
  if (a3 == 5)
  {
    id v6 = [v4 stringByAppendingPathComponent:@"DelayedRequests"];
  }
  else
  {
    uint64_t v7 = +[GKPreferences displayNameForEnvironment:a3];
    id v8 = +[NSString stringWithFormat:@"DelayedRequests-%@", v7];
    id v6 = [v5 stringByAppendingPathComponent:v8];

    id v5 = (void *)v7;
  }

  return v6;
}

- (id)storeAndForwardDirectoryPathForEnvironment:(int64_t)a3
{
  id v4 = [(id)objc_opt_class() storeAndForwardDirectoryPathForEnvironment:a3];
  id v5 = [v4 stringByAppendingPathComponent:self->_bundleIdentifier];

  return v5;
}

- (id)requestsCacheForEnvironment:(int64_t)a3
{
  id v5 = +[NSFileManager defaultManager];
  id v6 = [(GKClientProxy *)self storeAndForwardDirectoryPathForEnvironment:a3];
  [v5 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0];
  uint64_t v7 = +[GKPreferences displayNameForEnvironment:a3];
  uint64_t v8 = +[NSString stringWithFormat:@"%@.delayedRequests", v7];
  id v9 = [v6 stringByAppendingPathComponent:v8];

  LOBYTE(v8) = [v5 fileExistsAtPath:v9];
  BOOL v10 = +[GKDatabaseConnection connectionWithDatabasePath:v9];
  if ((v8 & 1) == 0)
  {
    id v11 = [@"delayed_requests.schema" stringByDeletingPathExtension];
    id v12 = [@"delayed_requests.schema" pathExtension];
    id v13 = GKGameCenterFoundationBundle();
    id v14 = [v13 pathForResource:v11 ofType:v12];

    id v15 = +[GKSQLRunner runnerWithConnection:v10];
    [v15 runSQLFromFileAtPath:v14];
  }

  return v10;
}

- (void)_setupDelayedRequestsWriters
{
  id v3 = dispatch_get_current_queue();
  id v4 = v3;
  delayedRequestsQueue = self->_delayedRequestsQueue;
  if (v3 != delayedRequestsQueue)
  {
    label = dispatch_queue_get_label(v3);
    uint64_t v7 = dispatch_queue_get_label(delayedRequestsQueue);
    uint64_t v8 = +[NSThread callStackSymbols];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKClientProxy(DelayedRequests) _setupDelayedRequestsWriters]", label, v7, v8);
    BOOL v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m"];
    id v11 = [v10 lastPathComponent];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_actualCurrentQueue == _delayedRequestsQueue)\n[%s (%s:%d)]", v9, "-[GKClientProxy(DelayedRequests) _setupDelayedRequestsWriters]", [v11 UTF8String], 2576);

    +[NSException raise:@"GameKit Exception", @"%@", v12 format];
  }

  if (!self->_delayedRequestsDBConnection)
  {
    id v13 = [(GKClientProxy *)self requestsCacheForEnvironment:[(GKClientProxy *)self environment]];
    [(GKClientProxy *)self setDelayedRequestsDBConnection:v13];
  }
  id v14 = [(GKClientProxy *)self delayedRequestsDBConnection];
  [v14 checkAndOpenDatabase];
}

- (void)_removeDelayedRequestStore
{
  id v3 = dispatch_get_current_queue();
  id v4 = v3;
  delayedRequestsQueue = self->_delayedRequestsQueue;
  if (v3 != delayedRequestsQueue)
  {
    label = dispatch_queue_get_label(v3);
    uint64_t v7 = dispatch_queue_get_label(delayedRequestsQueue);
    uint64_t v8 = +[NSThread callStackSymbols];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKClientProxy(DelayedRequests) _removeDelayedRequestStore]", label, v7, v8);
    BOOL v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m"];
    id v11 = [v10 lastPathComponent];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_actualCurrentQueue == _delayedRequestsQueue)\n[%s (%s:%d)]", v9, "-[GKClientProxy(DelayedRequests) _removeDelayedRequestStore]", [v11 UTF8String], 2589);

    +[NSException raise:@"GameKit Exception", @"%@", v12 format];
  }

  id v13 = +[NSFileManager defaultManager];
  id v14 = [(GKClientProxy *)self storeAndForwardDirectoryPathForEnvironment:[(GKClientProxy *)self environment]];
  id v15 = [v14 stringByAppendingString:@".doomed"];
  if (!os_log_GKGeneral) {
    id v16 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_10010CFC0();
  }
  id v27 = 0;
  unsigned int v17 = [v13 moveItemAtPath:v14 toPath:v15 error:&v27];
  id v18 = v27;
  if (v17)
  {
    [(GKClientProxy *)self setDelayedRequestsDBConnection:0];
    id v26 = v18;
    unsigned __int8 v19 = [v13 removeItemAtPath:v15 error:&v26];
    id v20 = v26;

    if (v19)
    {
      if (!os_log_GKGeneral) {
        id v21 = (id)GKOSLoggers();
      }
      id v22 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v29 = v15;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Deleted delayed request store file at path %@", buf, 0xCu);
      }
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v25 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_10010CF58();
      }
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v23 = (id)GKOSLoggers();
    }
    id v24 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412802;
      id v29 = v14;
      __int16 v30 = 2112;
      id v31 = v15;
      __int16 v32 = 2112;
      id v33 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to move delayed requests store \"%@\" to \"%@\". ERROR: %@", buf, 0x20u);
    }
    id v20 = v18;
  }
}

- (id)_delayedRequestWriterWithCacheWriterClass:(Class)a3 cacheReaderClass:(Class)a4 networkWriterClass:(Class)a5 bagKey:(id)a6 batchSubmissionInterval:(int64_t)a7 credential:(id)a8
{
  id v14 = a6;
  id v15 = a8;
  uint64_t v29 = 0;
  __int16 v30 = &v29;
  uint64_t v31 = 0x3032000000;
  __int16 v32 = sub_100101F84;
  id v33 = sub_100101F94;
  id v34 = 0;
  delayedRequestsQueue = self->_delayedRequestsQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10010B0BC;
  v21[3] = &unk_1002DADD0;
  Class v25 = a3;
  Class v26 = a4;
  void v21[4] = self;
  id v22 = v15;
  id v23 = v14;
  id v24 = &v29;
  Class v27 = a5;
  int64_t v28 = a7;
  id v17 = v14;
  id v18 = v15;
  dispatch_sync(delayedRequestsQueue, v21);
  id v19 = (id)v30[5];

  _Block_object_dispose(&v29, 8);

  return v19;
}

- (id)setPlayerStatusWriterWithCredential:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(GKClientProxy *)self _delayedRequestWriterWithCacheWriterClass:v5 cacheReaderClass:v6 networkWriterClass:objc_opt_class() bagKey:@"gk-set-player-status" batchSubmissionInterval:0 credential:v4];

  return v7;
}

- (id)setPlayerPhotoWriterWithCredential:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(GKClientProxy *)self _delayedRequestWriterWithCacheWriterClass:v5 cacheReaderClass:v6 networkWriterClass:objc_opt_class() bagKey:@"gk-get-image-upload-url" batchSubmissionInterval:0 credential:v4];

  return v7;
}

- (id)deletePlayerPhotoWriterWithCredential:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(GKClientProxy *)self _delayedRequestWriterWithCacheWriterClass:v5 cacheReaderClass:v6 networkWriterClass:objc_opt_class() bagKey:@"gk-delete-profile-image" batchSubmissionInterval:0 credential:v4];

  return v7;
}

- (id)removeGameWriterWithCredential:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(GKClientProxy *)self _delayedRequestWriterWithCacheWriterClass:v5 cacheReaderClass:v6 networkWriterClass:objc_opt_class() bagKey:@"gk-remove-game" batchSubmissionInterval:0 credential:v4];

  return v7;
}

+ (void)performDelayedRequestsForEnvironment:(int64_t)a3
{
  if (GKAtomicCompareAndSwap32Barrier())
  {
    uint64_t v5 = [a1 cacheFileQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10010B624;
    block[3] = &unk_1002DADF0;
    void block[4] = a3;
    dispatch_async(v5, block);
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v6 = (id)GKOSLoggers();
    }
    uint64_t v7 = os_log_GKTrace;
    if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Game Center not sending store and forward as achievements or scores are being sent on another thread", v8, 2u);
    }
  }
}

- (void)performDelayedRequestsForEnvironment:(int64_t)a3
{
  uint64_t v5 = +[GKPlayerCredentialController sharedController];
  id v6 = [v5 allCredentialsForEnvironment:a3];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010B8EC;
  void v7[3] = &unk_1002DAE18;
  void v7[4] = self;
  [v6 enumerateObjectsUsingBlock:v7];
}

- (void)performDelayedRequestsForCredential:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_get_global_queue(9, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010B9B0;
  void v7[3] = &unk_1002D3B38;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

+ (id)_existingManagedObjectContextForPlayerID:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() contextKeyForPlayerID:v3];

  uint64_t v5 = [(id)qword_1003297F8 objectForKey:v4];

  return v5;
}

- (id)transactionGroupIfCacheExistsForPlayerID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() _existingManagedObjectContextForPlayerID:v4];

  if (v5)
  {
    id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKClientProxy+Cache.m", 71, "-[GKClientProxy(Cache) transactionGroupIfCacheExistsForPlayerID:]");
    uint64_t v7 = +[GKCacheTransactionGroup transactionGroupWithName:v6 context:v5 client:self];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)cacheDirectoryForBundleID:(id)a3
{
  id v3 = a3;
  id v4 = GKInsecureCacheRoot();
  uint64_t v5 = [v4 stringByAppendingPathComponent:@"Data"];

  if (v3)
  {
    uint64_t v6 = [v5 stringByAppendingPathComponent:v3];

    uint64_t v5 = (void *)v6;
  }

  return v5;
}

+ (id)insecureDatabaseDirectoryURLForBundleID:(id)a3 language:(id)a4 playerID:(id)a5
{
  id v8 = (__CFString *)a5;
  id v9 = a4;
  BOOL v10 = [a1 cacheDirectoryForBundleID:a3];
  CFStringRef v11 = @"global";
  if (v8) {
    CFStringRef v11 = v8;
  }
  id v12 = +[NSString stringWithFormat:@"%@-%@.gcdata", v9, v11];

  id v13 = [v10 stringByAppendingPathComponent:v12];

  id v14 = +[NSURL fileURLWithPath:v13 isDirectory:1];

  return v14;
}

+ (id)insecureDatabaseFileURLForBundleID:(id)a3 language:(id)a4 playerID:(id)a5 name:(id)a6
{
  id v10 = a6;
  CFStringRef v11 = [a1 insecureDatabaseDirectoryURLForBundleID:a3 language:a4 playerID:a5];
  id v12 = [v11 URLByAppendingPathComponent:v10 isDirectory:0];

  return v12;
}

+ (void)removeCacheForPlayerID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 contextKeyForPlayerID:v4];
  uint64_t v6 = [a1 cacheFileQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010D710;
  block[3] = &unk_1002D3F20;
  id v7 = v4;
  id v28 = v5;
  id v29 = a1;
  id v27 = v7;
  id v8 = v5;
  dispatch_sync(v6, block);
  id v9 = [a1 gameCenterClient];
  id v10 = +[NSFileManager defaultManager];
  CFStringRef v11 = +[GKNetworkRequestManager commonNetworkRequestManager];
  id v12 = [v11 entityCacheProvider];
  id v13 = [v9 language];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10010D794;
  v21[3] = &unk_1002D4928;
  id v22 = v6;
  id v14 = v10;
  id v23 = v14;
  id v24 = v9;
  id v25 = v7;
  id v15 = v7;
  id v16 = v9;
  id v17 = v6;
  [v12 deleteCacheWithPlayerID:v15 language:v13 completionHandler:v21];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10010D8E0;
  v19[3] = &unk_1002D40E0;
  id v20 = v14;
  id v18 = v14;
  dispatch_async(v17, v19);
}

+ (void)removeAllCachesWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)qword_1003297F8 dictionaryCopy];
  uint64_t v6 = (void *)qword_1003297F8;
  id v7 = [v5 allKeys];
  [v6 removeObjectsForKeys:v7];

  id v8 = +[GKNetworkRequestManager commonNetworkRequestManager];
  id v9 = [v8 entityCacheProvider];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10010DAF4;
  v12[3] = &unk_1002DA788;
  id v14 = v4;
  id v15 = a1;
  id v13 = v5;
  id v10 = v4;
  id v11 = v5;
  [v9 deleteAllCachesWithCompletionHandler:v12];
}

+ (void)removeAllCaches
{
}

+ (id)managedObjectModel
{
  if (qword_100329808 != -1) {
    dispatch_once(&qword_100329808, &stru_1002DAF18);
  }
  id v2 = (void *)qword_100329810;

  return v2;
}

+ (id)cacheFileQueue
{
  if (qword_100329818 != -1) {
    dispatch_once(&qword_100329818, &stru_1002DAF38);
  }
  id v2 = (void *)qword_100329820;

  return v2;
}

+ (void)migrateInsecureDatabaseToSecureDatabaseURL:(id)a3 usingPersistantStoreCoordinator:(id)a4 fileManager:(id)a5 options:(id)a6 playerID:(id)a7 bundleID:(id)a8 language:(id)a9 name:(id)a10
{
  id v16 = a8;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v22 = [a1 insecureDatabaseFileURLForBundleID:v16 language:a9 playerID:a7 name:a10];
  id v21 = [[GKInsecureDatabaseMigrator alloc] initWithInsecureDatabaseURL:v22 secureDatabaseURL:v20 persistentStoreCoordinator:v19 options:v17 fileManager:v18 bundleID:v16];

  [(GKInsecureDatabaseMigrator *)v21 migrate];
}

+ (id)_newManagedObjectContextWithCacheURL:(id)a3 environment:(int64_t)a4 psc:(id)a5 storeOptions:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = dispatch_get_current_queue();
  id v14 = [a1 cacheFileQueue];

  if (v13 != v14)
  {
    label = dispatch_queue_get_label(v13);
    id v16 = [a1 cacheFileQueue];
    id v17 = dispatch_queue_get_label(v16);
    +[NSThread callStackSymbols];
    id v18 = v38 = a4;
    id v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the wrong queue (got:%s expected:%s) at %@", "+[GKClientProxy(Cache) _newManagedObjectContextWithCacheURL:environment:psc:storeOptions:]", label, v17, v18);
    id v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy+Cache.m"];
    id v21 = [v20 lastPathComponent];
    id v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_actualCurrentQueue == [self cacheFileQueue])\n[%s (%s:%d)]", v19, "+[GKClientProxy(Cache) _newManagedObjectContextWithCacheURL:environment:psc:storeOptions:]", [v21 UTF8String], 282);

    a4 = v38;
    +[NSException raise:@"GameKit Exception", @"%@", v22 format];
  }
  id v23 = +[NSFileManager defaultManager];
  id v24 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
  id v25 = +[GKPlayerCredentialController sharedController];
  Class v26 = [v25 primaryCredentialForEnvironment:a4];
  id v27 = [v26 playerInternal];
  id v28 = [v27 playerID];

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10010E490;
  v39[3] = &unk_1002D4860;
  id v40 = v10;
  id v41 = v11;
  id v42 = v12;
  id v43 = v23;
  id v29 = v24;
  id v44 = v29;
  id v45 = v28;
  id v30 = v28;
  id v31 = v23;
  id v32 = v12;
  id v33 = v11;
  id v34 = v10;
  [v29 performBlockAndWait:v39];
  id v35 = v45;
  id v36 = v29;

  return v36;
}

+ (id)newManagedObjectContextForPlayerID:(id)a3 bundleID:(id)a4 language:(id)a5 environment:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_10010E97C;
  id v30 = sub_10010E98C;
  id v31 = 0;
  id v13 = [a1 cacheFileQueue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10010E994;
  v19[3] = &unk_1002DAF60;
  id v20 = v10;
  id v21 = v12;
  id v22 = v11;
  id v23 = &v26;
  id v24 = a1;
  int64_t v25 = a6;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  dispatch_sync(v13, v19);

  id v17 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v17;
}

+ (id)gameCenterCacheDatabaseURLForPlayerID:(id)a3 language:(id)a4 name:(id)a5 fileManager:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [[GKSecureFileLocator alloc] initWithFileManager:v10];

  if ([v9 length]) {
    [(GKSecureFileLocator *)v13 databaseFileWithBundleID:GKGameCenterIdentifier language:v12 contextID:v9 name:v11];
  }
  else {
  id v14 = [(GKSecureFileLocator *)v13 globalDatabaseFileWithBundleID:GKGameCenterIdentifier language:v12 name:v11];
  }

  return v14;
}

+ (id)createPersistentStoreCoordinator
{
  CFAbsoluteTimeGetCurrent();
  id v2 = objc_alloc((Class)NSPersistentStoreCoordinator);
  id v3 = +[GKClientProxy managedObjectModel];
  id v4 = [v2 initWithManagedObjectModel:v3];

  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  uint64_t v6 = (void *)os_log_GKPerf;
  if (os_log_type_enabled(os_log_GKPerf, OS_LOG_TYPE_DEBUG)) {
    sub_10010F404(v6);
  }

  return v4;
}

+ (void)closeDatabaseFromManagedObjectContextForPlayerID:(id)a3
{
  id v4 = [a1 _existingManagedObjectContextForPlayerID:a3];
  [a1 closeDatabaseFromManagedObjectContextForMOC:v4];
}

+ (void)closeDatabaseFromManagedObjectContextForMOC:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10010EDA0;
  v4[3] = &unk_1002D40E0;
  id v5 = a3;
  id v3 = v5;
  [v3 performBlockAndWait:v4];
}

+ (id)getParentBundleIDPrefixWithChildBundleID:(id)a3 parentBundleID:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  if (a4)
  {
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v9;
  }
  else
  {
    uint64_t v8 = 0;
  }
  sub_1001667CC(v5, v7, v8, (uint64_t)a4);
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v11)
  {
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v12 = 0;
  }

  return v12;
}

@end