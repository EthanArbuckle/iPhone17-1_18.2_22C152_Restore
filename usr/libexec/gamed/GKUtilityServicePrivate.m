@interface GKUtilityServicePrivate
+ (Class)interfaceClass;
+ (id)serializeFriendSuggestions:(id)a3 contactIDsSupportingPushFriending:(id)a4;
+ (id)sharedFriendSuggestionDenier;
+ (unint64_t)requiredEntitlements;
+ (void)removeCacheDirectory:(id)a3;
- (id)contactIDsFromSuggestions:(id)a3;
- (void)callBlockWithFriendSuggester:(id)a3;
- (void)cancelNetworkManagerTasks;
- (void)checkAndUpdateArcadeSubscriberStatusWithHandler:(id)a3;
- (void)clearCachesWithHandler:(id)a3;
- (void)clearEntityCacheForBagKey:(id)a3 completionHandler:(id)a4;
- (void)clearFriendSuggestionsDenyList;
- (void)currentNonGameCenterForegroundGameHandler:(id)a3;
- (void)denyContact:(id)a3 handler:(id)a4;
- (void)denyPlayer:(id)a3 handler:(id)a4;
- (void)fetchFriendSuggestionsWithHandler:(id)a3;
- (void)getArcadeSubscription:(id)a3;
- (void)getCacheLocationsForPlayerID:(id)a3 completionHandler:(id)a4;
- (void)getCentralCacheLocationForPlayerID:(id)a3 completionHandler:(id)a4;
- (void)getCredentialInfoAndStoreBagValuesForKeys:(id)a3 handler:(id)a4;
- (void)getFriendSuggestionDenyListWithHandler:(id)a3;
- (void)getFriendSuggestionsWithHandler:(id)a3;
- (void)getGameInviteFriendSuggestionsWithHandler:(id)a3;
- (void)getHostGameWithHandler:(id)a3;
- (void)getWidgetStoreBagValueWithHandler:(id)a3;
- (void)handleFriendSuggestionDenialWithNotificationPayload:(id)a3 error:(id)a4 handler:(id)a5;
- (void)invokeASCAppLaunchTrampolineWithURL:(id)a3 handler:(id)a4;
- (void)loadDataForURL:(id)a3 postBody:(id)a4 completionHandler:(id)a5;
- (void)notifyRemoteAlertCompletedPresentingDashboard;
- (void)openGameCenterSettings;
- (void)openSettings;
- (void)pingWithHandler:(id)a3;
- (void)refreshPreferences;
- (void)refreshPreferencesWithDataType:(unsigned int)a3;
- (void)rerankedFriendSuggestionsHandlesWithHandler:(id)a3;
- (void)resetEnvironmentWithHandler:(id)a3;
- (void)resetSignInPromptsWithCompletionHandler:(id)a3;
- (void)suggestedContactsListWithLimit:(id)a3 handler:(id)a4;
- (void)suggestedFriendsWithHandler:(id)a3;
- (void)terminate;
- (void)updateNotificationTopicsForcefully:(BOOL)a3;
@end

@implementation GKUtilityServicePrivate

+ (unint64_t)requiredEntitlements
{
  return 0x10000;
}

+ (id)sharedFriendSuggestionDenier
{
  if (qword_100329658 != -1) {
    dispatch_once(&qword_100329658, &stru_1002D3B78);
  }
  v2 = (void *)qword_100329650;

  return v2;
}

- (void)currentNonGameCenterForegroundGameHandler:(id)a3
{
  id v4 = a3;
  id v6 = +[GKClientProxy nonGameCenterForegroundClient];
  v5 = [v6 currentGame];
  (*((void (**)(id, void *))a3 + 2))(v4, v5);
}

- (void)notifyRemoteAlertCompletedPresentingDashboard
{
  id v2 = +[GKRemoteAlertLauncher shared];
  [v2 notifyDashboardDidLaunch];
}

- (void)invokeASCAppLaunchTrampolineWithURL:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v33 = a4;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v34 = v5;
  id v6 = [objc_alloc((Class)NSURLComponents) initWithURL:v5 resolvingAgainstBaseURL:0];
  v7 = [v6 queryItems];

  id v8 = [v7 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (!v8)
  {
    v10 = 0;
    v11 = 0;
    goto LABEL_15;
  }
  id v9 = v8;
  v10 = 0;
  v11 = 0;
  uint64_t v12 = *(void *)v46;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v46 != v12) {
        objc_enumerationMutation(v7);
      }
      v14 = *(void **)(*((void *)&v45 + 1) + 8 * i);
      v15 = [v14 name];
      unsigned int v16 = [v15 isEqualToString:@"appId"];

      if (v16)
      {
        uint64_t v17 = [v14 value];
        v18 = v11;
        v11 = (void *)v17;
      }
      else
      {
        v19 = [v14 name];
        unsigned int v20 = [v19 isEqualToString:@"bundleId"];

        if (!v20) {
          continue;
        }
        uint64_t v21 = [v14 value];
        v18 = v10;
        v10 = (void *)v21;
      }
    }
    id v9 = [v7 countByEnumeratingWithState:&v45 objects:v49 count:16];
  }
  while (v9);
LABEL_15:

  if (+[GKGame isNewsApp:v10])
  {
    v22 = +[GKApplicationWorkspace defaultWorkspace];
    [v22 openNewsApp];

    v23 = [(GKService *)self clientProxy];
    v24 = [v23 replyQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001DFD0;
    block[3] = &unk_1002D3930;
    v25 = v33;
    id v44 = v33;
    id v43 = v11;
    dispatch_async(v24, block);

    id v26 = v44;
    v27 = v34;
  }
  else
  {
    v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKUtilityService.m", 630, "-[GKUtilityServicePrivate invokeASCAppLaunchTrampolineWithURL:handler:]");
    v29 = +[GKDispatchGroup dispatchGroupWithName:v28];

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10001E00C;
    v38[3] = &unk_1002D3980;
    v27 = v34;
    id v39 = v34;
    id v40 = v11;
    id v26 = v29;
    id v41 = v26;
    [v26 perform:v38];
    v25 = v33;
    if (v33)
    {
      v30 = [(GKService *)self clientProxy];
      v31 = [v30 replyQueue];
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10001E4A0;
      v35[3] = &unk_1002D3930;
      id v37 = v33;
      id v36 = v26;
      [v36 notifyOnQueue:v31 block:v35];
    }
  }
}

- (void)getHostGameWithHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v15 = 0;
  unsigned int v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_10001E6D4;
  v19 = sub_10001E6E4;
  id v20 = 0;
  id v5 = [(GKService *)self clientProxy];
  id v6 = [v5 originalBundleIdentifier];

  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_10001E6EC;
  uint64_t v12 = &unk_1002D3BF0;
  id v7 = v6;
  id v13 = v7;
  v14 = &v15;
  +[GKClientProxy enumerateClientsUsingBlock:&v9];
  id v8 = [v16[5] currentGame:v9, v10, v11, v12];
  v4[2](v4, v8);

  _Block_object_dispose(&v15, 8);
}

- (void)getCredentialInfoAndStoreBagValuesForKeys:(id)a3 handler:(id)a4
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
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKUtilityService: getCredentialInfoAndStoreBagValuesForKeys:", buf, 2u);
  }
  uint64_t v10 = [(GKUtilityService *)self _bagValuesForKeys:v6];
  v11 = [v10 error];

  if (!v11)
  {
    v14 = +[GKDataRequestManager sharedManager];
    uint64_t v15 = [v14 pushToken];
    [v10 setObject:v15 forKeyedSubscript:@"pushToken"];

    unsigned int v16 = [(GKService *)self credential];
    uint64_t v17 = [v16 playerInternal];
    v18 = [v17 playerID];
    [v10 setObject:v18 forKeyedSubscript:@"playerID"];

    v19 = [v16 authenticationToken];
    [v10 setObject:v19 forKeyedSubscript:@"authToken"];

    id v20 = [v16 accountName];
    [v10 setObject:v20 forKeyedSubscript:@"accountName"];

    if (!v7) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v7)
  {
LABEL_7:
    uint64_t v12 = [(GKService *)self clientProxy];
    id v13 = [v12 replyQueue];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10001E9DC;
    v21[3] = &unk_1002D3930;
    id v23 = v7;
    id v22 = v10;
    [v22 notifyOnQueue:v13 block:v21];
  }
LABEL_8:
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class();
}

- (void)openSettings
{
  id v2 = +[GKApplicationWorkspace defaultWorkspace];
  [v2 openSettings];
}

- (void)openGameCenterSettings
{
  id v2 = +[GKApplicationWorkspace defaultWorkspace];
  [v2 openGameCenterSettings];
}

- (void)terminate
{
  if (!os_log_GKGeneral) {
    id v2 = (id)GKOSLoggers();
  }
  v3 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Exiting in response to termination request", v4, 2u);
  }
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1002D3C10);
}

+ (void)removeCacheDirectory:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  id v10 = 0;
  unsigned __int8 v5 = [v4 removeItemAtPath:v3 error:&v10];
  id v6 = v10;

  if (v5)
  {
    if (!os_log_GKGeneral) {
      id v7 = (id)GKOSLoggers();
    }
    id v8 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Successfully cleared GameKit cache directory: %@", buf, 0xCu);
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v9 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_ERROR)) {
      sub_100022A70();
    }
  }
}

- (void)clearCachesWithHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001EE4C;
  v4[3] = &unk_1002D3C38;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)resetEnvironmentWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[GKDataRequestManager sharedManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001F0A4;
  v7[3] = &unk_1002D3C38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 resetEnvironmentWithHandler:v7];
}

- (void)pingWithHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)updateNotificationTopicsForcefully:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[GKDataRequestManager sharedManager];
  [v4 updateNotificationTopicsForceFully:v3];
}

- (void)refreshPreferences
{
}

- (void)refreshPreferencesWithDataType:(unsigned int)a3
{
  id v4 = +[GKPreferences shared];
  [v4 synchronize];

  id v5 = +[NSUserDefaults standardUserDefaults];
  [v5 synchronize];

  CFPreferencesSynchronize(@"com.apple.VideoConference", kCFPreferencesAnyUser, kCFPreferencesAnyHost);
  CFPreferencesSynchronize(@"com.apple.persistentconnection", kCFPreferencesAnyUser, kCFPreferencesAnyHost);
  CFPreferencesAppSynchronize(@"com.apple.logging");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001F2F0;
  v6[3] = &unk_1002D3C58;
  unsigned int v7 = a3;
  +[GKClientProxy enumerateClientsUsingBlock:v6];
}

- (void)loadDataForURL:(id)a3 postBody:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    id v9 = a4;
    id v10 = a3;
    v11 = [(GKService *)self transport];
    id v12 = [v11 storeBag];

    id v13 = [(GKService *)self clientProxy];
    v14 = [(GKService *)self credential];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001F434;
    v15[3] = &unk_1002D3C80;
    id v16 = v8;
    [v12 readDataForURL:v10 postData:v9 client:v13 credential:v14 includeUDID:1 includeAPNS:1 completion:v15];
  }
}

- (void)cancelNetworkManagerTasks
{
  id v2 = +[GKNetworkRequestManager commonNetworkRequestManager];
  [v2 cancelCurrentTasks];
}

- (void)checkAndUpdateArcadeSubscriberStatusWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKUtilityService.m", 830, "-[GKUtilityServicePrivate checkAndUpdateArcadeSubscriberStatusWithHandler:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001F62C;
  v16[3] = &unk_1002D3A70;
  v16[4] = self;
  id v7 = v6;
  id v17 = v7;
  [v7 perform:v16];
  id v8 = [(GKService *)self clientProxy];
  id v9 = [v8 replyQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001F738;
  v12[3] = &unk_1002D3AE8;
  v14 = self;
  id v15 = v4;
  id v13 = v7;
  id v10 = v4;
  id v11 = v7;
  [v11 notifyOnQueue:v9 block:v12];
}

- (void)getArcadeSubscription:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = +[GKPreferences shared];
    (*((void (**)(id, id))a3 + 2))(v4, [v5 arcadeSubscriptionState]);
  }
}

- (void)callBlockWithFriendSuggester:(id)a3
{
  id v4 = a3;
  id v5 = +[GKUtilityServicePrivate sharedFriendSuggestionDenier];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100020184;
  v7[3] = &unk_1002D3D80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 denyListWithCompletionHandler:v7];
}

- (void)rerankedFriendSuggestionsHandlesWithHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020308;
  v4[3] = &unk_1002D3DA8;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(GKUtilityServicePrivate *)v5 callBlockWithFriendSuggester:v4];
}

- (void)getFriendSuggestionDenyListWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[GKUtilityServicePrivate sharedFriendSuggestionDenier];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100020684;
  v7[3] = &unk_1002D3D80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 denyListWithCompletionHandler:v7];
}

- (void)denyPlayer:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  id v9 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "denyPlayer: Adding %@ to the deny list.", buf, 0xCu);
  }
  if (v6)
  {
    id v10 = +[GKUtilityServicePrivate sharedFriendSuggestionDenier];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100020A40;
    v16[3] = &unk_1002D3DD0;
    v16[4] = self;
    id v17 = v6;
    id v18 = v7;
    id v11 = v7;
    [v10 denyPlayerID:v17 completionHandler:v16];

    id v12 = v17;
  }
  else
  {
    id v13 = [(GKService *)self clientProxy];
    v14 = [v13 replyQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100020A2C;
    block[3] = &unk_1002D3A20;
    id v20 = v7;
    id v15 = v7;
    dispatch_async(v14, block);

    id v12 = v20;
  }
}

- (void)denyContact:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  id v9 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "denyContact: Adding %@ to the deny list.", buf, 0xCu);
  }
  if (v6)
  {
    id v10 = +[GKUtilityServicePrivate sharedFriendSuggestionDenier];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100020D08;
    v16[3] = &unk_1002D3DD0;
    v16[4] = self;
    id v17 = v6;
    id v18 = v7;
    id v11 = v7;
    [v10 denyContactID:v17 completionHandler:v16];

    id v12 = v17;
  }
  else
  {
    id v13 = [(GKService *)self clientProxy];
    v14 = [v13 replyQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100020CF4;
    block[3] = &unk_1002D3A20;
    id v20 = v7;
    id v15 = v7;
    dispatch_async(v14, block);

    id v12 = v20;
  }
}

- (void)handleFriendSuggestionDenialWithNotificationPayload:(id)a3 error:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(GKService *)self clientProxy];
  id v12 = [v11 replyQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020ED0;
  block[3] = &unk_1002D3A48;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  dispatch_async(v12, block);
}

- (void)clearFriendSuggestionsDenyList
{
  id v2 = +[GKUtilityServicePrivate sharedFriendSuggestionDenier];
  [v2 clearDenyList];
}

- (void)suggestedFriendsWithHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100021070;
  v4[3] = &unk_1002D3E88;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(GKUtilityServicePrivate *)v5 fetchFriendSuggestionsWithHandler:v4];
}

+ (id)serializeFriendSuggestions:(id)a3 contactIDsSupportingPushFriending:(id)a4
{
  id v5 = a3;
  id v22 = a4;
  id v6 = +[NSMutableDictionary dictionary];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v13 = [v12 contactID];
        id v14 = [v6 objectForKeyedSubscript:v13];

        if (!v14)
        {
          v27[0] = @"contactID";
          v27[1] = @"supportsFriendingViaPush";
          v28[0] = v13;
          id v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v22 containsObject:v13]);
          v28[1] = v15;
          id v16 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
          id v17 = +[NSMutableDictionary dictionaryWithDictionary:v16];

          id v18 = [v12 handle];
          [v17 _gkSetIfNonNilObject:v18 forKey:@"handle"];

          id v19 = [v12 contactAssociationID];
          [v17 _gkSetIfNonNilObject:v19 forKey:@"caid"];

          [v6 setObject:v17 forKeyedSubscript:v13];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v9);
  }

  id v20 = [v6 allValues];

  return v20;
}

- (id)contactIDsFromSuggestions:(id)a3
{
  return [a3 _gkMapWithBlock:&stru_1002D3EA8];
}

- (void)getFriendSuggestionsWithHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002153C;
  v4[3] = &unk_1002D3E88;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(GKUtilityServicePrivate *)v5 fetchFriendSuggestionsWithHandler:v4];
}

- (void)fetchFriendSuggestionsWithHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100021668;
  v4[3] = &unk_1002D3DA8;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(GKUtilityServicePrivate *)v5 callBlockWithFriendSuggester:v4];
}

- (void)getGameInviteFriendSuggestionsWithHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100021BD4;
  v4[3] = &unk_1002D3DA8;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(GKUtilityServicePrivate *)v5 callBlockWithFriendSuggester:v4];
}

- (void)suggestedContactsListWithLimit:(id)a3 handler:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100021F74;
  v6[3] = &unk_1002D3EF8;
  id v7 = a4;
  id v5 = v7;
  [(GKUtilityServicePrivate *)self getFriendSuggestionsWithHandler:v6];
}

- (void)getWidgetStoreBagValueWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKUtilityService.m", 1169, "-[GKUtilityServicePrivate getWidgetStoreBagValueWithHandler:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002211C;
  v15[3] = &unk_1002D3A70;
  void v15[4] = self;
  id v7 = v6;
  id v16 = v7;
  [v7 perform:v15];
  id v8 = [(GKService *)self clientProxy];
  id v9 = [v8 replyQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000222F0;
  v12[3] = &unk_1002D3C38;
  id v13 = v7;
  id v14 = v4;
  id v10 = v4;
  id v11 = v7;
  [v11 notifyOnQueue:v9 block:v12];
}

- (void)clearEntityCacheForBagKey:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = +[GKNetworkRequestManager commonNetworkRequestManager];
  id v8 = [(GKService *)self clientProxy];
  [v9 deleteEntitiesWithBagKey:v7 clientProxy:v8 completionHandler:v6];
}

- (void)getCacheLocationsForPlayerID:(id)a3 completionHandler:(id)a4
{
  v26[0] = @"Insecure Cache";
  id v6 = (void (**)(id, id))a4;
  id v25 = a3;
  id v7 = GKInsecureCacheRoot();
  v26[1] = @"Support Data";
  v27[0] = v7;
  id v8 = GKSupportDataRoot();
  v27[1] = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  id v10 = +[NSMutableDictionary dictionaryWithDictionary:v9];

  id v11 = [GKSecureFileLocator alloc];
  id v12 = +[NSFileManager defaultManager];
  id v13 = [(GKSecureFileLocator *)v11 initWithFileManager:v12];

  uint64_t v14 = GKGameCenterIdentifier;
  id v15 = [(GKService *)self clientProxy];
  id v16 = [v15 language];
  id v17 = +[GKSecureFileLocator globalContextID];
  id v18 = [(GKSecureFileLocator *)v13 databaseDirectoryWithBundleID:v14 language:v16 contextID:v17];
  id v19 = [v18 gkFileSystemRepresentation];
  [v10 setObject:v19 forKeyedSubscript:@"Global Cache"];

  id v20 = [(GKService *)self clientProxy];
  uint64_t v21 = [v20 language];
  id v22 = [(GKSecureFileLocator *)v13 databaseDirectoryWithBundleID:v14 language:v21 contextID:v25];

  long long v23 = [v22 gkFileSystemRepresentation];
  [v10 setObject:v23 forKeyedSubscript:@"Player Cache"];

  id v24 = [v10 copy];
  v6[2](v6, v24);
}

- (void)getCentralCacheLocationForPlayerID:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v13 = [(GKService *)self clientProxy];
  id v9 = [v13 language];
  id v10 = +[NSFileManager defaultManager];
  id v11 = +[GKClientProxy gameCenterCacheDatabaseURLForPlayerID:v8 language:v9 name:@"database.sqlite3" fileManager:v10];

  id v12 = [v11 gkFileSystemRepresentation];
  (*((void (**)(id, void *))a4 + 2))(v7, v12);
}

- (void)resetSignInPromptsWithCompletionHandler:(id)a3
{
  id v3 = (void (**)(void))a3;
  id v4 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v5 = (id)GKOSLoggers();
    id v4 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKUtilityServicePrivate: Resetting sign in prompt limits", v7, 2u);
  }
  id v6 = +[NSUserDefaults standardUserDefaults];
  [v6 removeObjectForKey:@"GKFullscreenSignInPresentationDataKey"];
  [v6 removeObjectForKey:@"GKSignInBannerPresentationDataKey"];
  v3[2](v3);
}

@end