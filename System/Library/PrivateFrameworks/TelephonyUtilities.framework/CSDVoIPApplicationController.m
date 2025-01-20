@interface CSDVoIPApplicationController
+ (id)bundleIdFromTopic:(id)a3;
+ (id)topicFromBundleId:(id)a3 forType:(int)a4;
- (APSConnection)developmentConnection;
- (APSConnection)productionConnection;
- (BOOL)_appHasOngoingCall:(id)a3;
- (BOOL)_isApplicationPreventedFromBeingLaunched:(id)a3;
- (BOOL)containsAnyOutstandingMessageForBundleIdentifier:(id)a3;
- (BOOL)containsOutstandingMessage:(id)a3 forBundleIdentifier:(id)a4;
- (BOOL)pttDeprecationAlertWaitingPeriodHasPassedForApplication:(id)a3;
- (BOOL)shouldAllowIncomingCall:(id)a3;
- (CSDCallStateController)callStateController;
- (CSDClientManager)channelClientManager;
- (CSDClientManager)networkExtensionClientManager;
- (CSDClientManager)pushKitClientManager;
- (CSDPTTServiceUpdatePushMonitor)pttServiceUpdatePushMonitor;
- (CSDPersistedChannelRegistry)persistedChannelRegistry;
- (CSDVoIPApplicationController)init;
- (CSDVoIPApplicationMonitor)applicationMonitor;
- (CSDVoIPDOSCache)voIPDOSCache;
- (CXNetworkExtensionMessageControllerHost)networkExtensionMessageHost;
- (CXNotificationServiceExtensionVoIPXPCHost)nseMessageHost;
- (NSMutableDictionary)bundleIdentifierToVoIPApplication;
- (NSMutableDictionary)outstandingMessages;
- (OS_dispatch_queue)queue;
- (id)_apsConnectionForEnvironment:(id)a3;
- (id)_createAPSConnectionForEnvironment:(id)a3 namedDelegatePort:(id)a4;
- (id)_findOrCreateApplicationWithBundleIdentifier:(id)a3;
- (id)createPTTApplicationMessageForChannel:(id)a3 withPayload:(id)a4 isWakingMessage:(BOOL)a5;
- (void)_incrementKillCountForApplication:(id)a3;
- (void)_moveOpportunisticTopicsToIgnoredListForConnection:(id)a3;
- (void)_pruneUninstalledAppPushTopics;
- (void)_pruneUninstalledAppPushTopicsForConnection:(id)a3;
- (void)_registerForPushTokenWithType:(int)a3 client:(id)a4;
- (void)_registerNetworkExtensionApplicationWithBundleIdentifier:(id)a3 client:(id)a4;
- (void)_registerPushApplicationWithBundleIdentifier:(id)a3 client:(id)a4 environment:(id)a5 pushType:(int)a6;
- (void)_removeAllApplicationsFromKillCountsDictionary;
- (void)_removeApplicationFromKillCountsDictionary:(id)a3;
- (void)_removeTopic:(id)a3 fromConnection:(id)a4;
- (void)_unregisterForPushTokenWithType:(int)a3 client:(id)a4;
- (void)_unregisterPushApplication:(id)a3 inEnvironment:(id)a4 pushType:(int)a5 destroyApp:(BOOL)a6;
- (void)activePersistedChannelIdentityChangedTo:(id)a3;
- (void)addOutstandingMessage:(id)a3 forBundleIdentifier:(id)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)dealloc;
- (void)displayPTTDeprecationAlert:(id)a3;
- (void)handleApplicationUninstalledNotification:(id)a3;
- (void)handlePTTAppReportedValidActiveRemoteParticipant:(id)a3;
- (void)networkExtensionMessageControllerHost:(id)a3 didReceiveIncomingMessage:(id)a4 forBundleIdentifier:(id)a5;
- (void)networkExtensionMessageControllerHost:(id)a3 didReceiveIncomingPushToTalkMessage:(id)a4 forBundleIdentifier:(id)a5;
- (void)notificationServiceExtensionHost:(id)a3 didReceiveIncomingMessage:(id)a4 forBundleIdentifier:(id)a5 reply:(id)a6;
- (void)openApplicationWithBundleIdentifier:(id)a3 message:(id)a4;
- (void)processOverBudgetPTTServiceUpdateMessage:(id)a3 forApplication:(id)a4;
- (void)pttCheckInWithReply:(id)a3;
- (void)pttRegister;
- (void)pttUnregister;
- (void)reconcileChannelTopicFilters;
- (void)registerVoIPNetworkExtension;
- (void)removeApplicationFromPTTDeprecationAlertDictionary:(id)a3;
- (void)removeOutstandingMessagesForBundleIdentifier:(id)a3;
- (void)setBundleIdentifierToVoIPApplication:(id)a3;
- (void)setCallStateController:(id)a3;
- (void)setChannelClientManager:(id)a3;
- (void)setDevelopmentConnection:(id)a3;
- (void)setNetworkExtensionClientManager:(id)a3;
- (void)setPersistedChannelRegistry:(id)a3;
- (void)setProductionConnection:(id)a3;
- (void)setPttServiceUpdatePushMonitor:(id)a3;
- (void)setPushKitClientManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)updatePTTDeprecationAlertLogForApplication:(id)a3;
- (void)voipRegister;
- (void)voipUnregister;
@end

@implementation CSDVoIPApplicationController

- (CSDVoIPApplicationController)init
{
  v17.receiver = self;
  v17.super_class = (Class)CSDVoIPApplicationController;
  v2 = [(CSDVoIPApplicationController *)&v17 init];
  if (v2)
  {
    v3 = objc_alloc_init(CSDVoIPApplicationMonitor);
    applicationMonitor = v2->_applicationMonitor;
    v2->_applicationMonitor = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    bundleIdentifierToVoIPApplication = v2->_bundleIdentifierToVoIPApplication;
    v2->_bundleIdentifierToVoIPApplication = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    outstandingMessages = v2->_outstandingMessages;
    v2->_outstandingMessages = v7;

    v9 = objc_alloc_init(CSDVoIPDOSCache);
    voIPDOSCache = v2->_voIPDOSCache;
    v2->_voIPDOSCache = v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.voipapplicationcontroller", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v11;

    v13 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10016BD08;
    block[3] = &unk_100504EC0;
    v16 = v2;
    dispatch_async(v13, block);
  }
  return v2;
}

- (BOOL)shouldAllowIncomingCall:(id)a3
{
  id v4 = a3;
  v5 = [(CSDVoIPApplicationController *)self voIPDOSCache];
  unsigned __int8 v6 = [v5 shouldAllowCallFor:v4];

  if ((v6 & 1) == 0)
  {
    v7 = +[CSDReportingController sharedInstance];
    [v7 voipDOSCallIgnored:v4];
  }
  return v6;
}

- (void)handleApplicationUninstalledNotification:(id)a3
{
  id v4 = a3;
  v5 = [(CSDVoIPApplicationController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016CD5C;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)dealloc
{
  v3 = [(CSDVoIPApplicationController *)self developmentConnection];
  [v3 setDelegate:0];

  id v4 = [(CSDVoIPApplicationController *)self productionConnection];
  [v4 setDelegate:0];

  v5 = [(CSDVoIPApplicationController *)self developmentConnection];
  [v5 removeFromRunLoop];

  id v6 = [(CSDVoIPApplicationController *)self productionConnection];
  [v6 removeFromRunLoop];

  v7.receiver = self;
  v7.super_class = (Class)CSDVoIPApplicationController;
  [(CSDVoIPApplicationController *)&v7 dealloc];
}

- (void)registerVoIPNetworkExtension
{
  v3 = [(CSDVoIPApplicationController *)self networkExtensionClientManager];
  id v4 = [v3 currentClient];

  if ([v4 hasVoIPNetworkExtensionEntitlement])
  {
    v5 = [v4 processBundleIdentifier];
    id v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      dispatch_queue_t v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received request to register VoIP Network Extension for client process with bundle identifier %@", (uint8_t *)&v10, 0xCu);
    }

    id v7 = [v5 length];
    id v8 = sub_100008DCC();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        int v10 = 138412290;
        dispatch_queue_t v11 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Registering VoIP Network Extension for application with bundle identifier %@", (uint8_t *)&v10, 0xCu);
      }

      [(CSDVoIPApplicationController *)self _registerNetworkExtensionApplicationWithBundleIdentifier:v5 client:v4];
    }
    else
    {
      if (v9)
      {
        int v10 = 138412290;
        dispatch_queue_t v11 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring request to register VoIP Network Extension; could not obtain a bundle identifier from client process %@",
          (uint8_t *)&v10,
          0xCu);
      }
    }
  }
  else
  {
    v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      dispatch_queue_t v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[WARN] Aborting register request for VoIP Network Extension; entitlement was not found on client %@",
        (uint8_t *)&v10,
        0xCu);
    }
  }
}

- (void)voipRegister
{
  id v4 = [(CSDVoIPApplicationController *)self pushKitClientManager];
  v3 = [v4 currentClient];
  [(CSDVoIPApplicationController *)self _registerForPushTokenWithType:2 client:v3];
}

- (void)voipUnregister
{
  id v4 = [(CSDVoIPApplicationController *)self pushKitClientManager];
  v3 = [v4 currentClient];
  [(CSDVoIPApplicationController *)self _unregisterForPushTokenWithType:2 client:v3];
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v38 = v6;
    __int16 v39 = 2112;
    id v40 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "for connection: %@ publicToken: %@", buf, 0x16u);
  }

  BOOL v9 = (void *)APSEnvironmentDevelopment;
  id v10 = [(CSDVoIPApplicationController *)self _apsConnectionForEnvironment:APSEnvironmentDevelopment];

  if ((v10 == v6
     || (BOOL v9 = (void *)APSEnvironmentProduction,
         [(CSDVoIPApplicationController *)self _apsConnectionForEnvironment:APSEnvironmentProduction], id v11 = (id)objc_claimAutoreleasedReturnValue(), v11, v11 == v6))&& (v12 = v9) != 0)
  {
    v13 = v12;
    id v29 = v7;
    v30 = v6;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = [(CSDVoIPApplicationController *)self bundleIdentifierToVoIPApplication];
    id v14 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v33;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v19 = [(CSDVoIPApplicationController *)self bundleIdentifierToVoIPApplication];
          v20 = [v19 objectForKeyedSubscript:v18];
          v21 = [v20 environment];
          unsigned int v22 = [v21 isEqualToIgnoringCase:v13];

          if (v22)
          {
            v23 = [(CSDVoIPApplicationController *)self bundleIdentifierToVoIPApplication];
            v24 = [v23 objectForKeyedSubscript:v18];

            [v24 unsetVoIPToken];
            [v24 unsetChannelPushToken];
            if ([v24 hasVoIPBackgroundMode])
            {
              v25 = [(id)objc_opt_class() topicFromBundleId:v18 forType:2];
              v26 = sub_100008DCC();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v38 = v25;
                __int16 v39 = 2112;
                id v40 = v18;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Requesting token for topic %@ for bundle ID %@", buf, 0x16u);
              }

              [v30 requestTokenForTopic:v25 identifier:&stru_100517F40];
            }
            if ([v24 meetsRequirementsForPTT])
            {
              v27 = [(id)objc_opt_class() topicFromBundleId:v18 forType:3];
              v28 = sub_100008DCC();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v38 = v27;
                __int16 v39 = 2112;
                id v40 = v18;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Requesting token for topic %@ for bundle ID %@", buf, 0x16u);
              }

              [v30 requestTokenForTopic:v27 identifier:&stru_100517F40];
            }
          }
        }
        id v15 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v15);
    }

    id v6 = v30;
    id v7 = v29;
  }
  else
  {
    v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] No environment found for connection %@", buf, 0xCu);
    }
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = sub_100008DCC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138413058;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v11;
    __int16 v21 = 2112;
    id v22 = v12;
    __int16 v23 = 2112;
    id v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "for connection: %@ token: %@ topic: %@ identifier: %@", (uint8_t *)&v17, 0x2Au);
  }

  id v15 = [(id)objc_opt_class() bundleIdFromTopic:v12];
  uint64_t v16 = [(CSDVoIPApplicationController *)self _findOrCreateApplicationWithBundleIdentifier:v15];
  if ([v12 hasSuffix:@"voip-ptt"]) {
    [v16 deliverChannelPushToken:v11];
  }
  else {
    [v16 deliverVoIPToken:v11];
  }
}

- (id)createPTTApplicationMessageForChannel:(id)a3 withPayload:(id)a4 isWakingMessage:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(CSDVoIPApplicationMessage *)[CSDPTTApplicationMessage alloc] initWithTransportType:3 payload:v9];
  id v11 = [v8 channelUUID];
  [(CSDPTTApplicationMessage *)v10 setChannelUUID:v11];
  id v12 = [(id)objc_opt_class() isPayloadPTTServiceUpdateMessage:v9];

  [(CSDPTTApplicationMessage *)v10 setIsServiceUpdateMessage:v12];
  [(CSDPTTApplicationMessage *)v10 setIsWakingMessage:v5];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10016DAA4;
  v16[3] = &unk_100508C90;
  v16[4] = self;
  id v17 = v11;
  id v18 = v8;
  id v13 = v8;
  id v14 = v11;
  [(CSDPTTApplicationMessage *)v10 setReply:v16];

  return v10;
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412546;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "for connection: %@ message: %@", (uint8_t *)&v19, 0x16u);
  }

  id v9 = [v7 topic];
  id v10 = [v7 userInfo];
  id v11 = [(id)objc_opt_class() bundleIdFromTopic:v9];
  if (![v9 hasSuffix:@"voip-ptt"])
  {
    id v13 = [[CSDVoIPApplicationMessage alloc] initWithTransportType:2 payload:v10];
    goto LABEL_7;
  }
  id v12 = [(CSDVoIPApplicationController *)self persistedChannelRegistry];
  id v13 = [v12 activePersistedChannelIdentity];

  id v14 = [(CSDVoIPApplicationMessage *)v13 bundleIdentifier];
  unsigned __int8 v15 = [v14 isEqualToString:v11];

  if (v15)
  {
    uint64_t v16 = -[CSDVoIPApplicationController createPTTApplicationMessageForChannel:withPayload:isWakingMessage:](self, "createPTTApplicationMessageForChannel:withPayload:isWakingMessage:", v13, v10, [v7 priority] == (id)10);

    id v13 = (CSDVoIPApplicationMessage *)v16;
LABEL_7:
    id v17 = sub_100008DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412546;
      id v20 = v11;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received incoming APS message from application with bundle identifier %@ and topic %@", (uint8_t *)&v19, 0x16u);
    }

    [(CSDVoIPApplicationController *)self openApplicationWithBundleIdentifier:v11 message:v13];
    goto LABEL_13;
  }
  id v18 = sub_100008DCC();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
    sub_1003ADF3C();
  }

LABEL_13:
}

- (void)_removeAllApplicationsFromKillCountsDictionary
{
  v2 = sub_100008DCC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Resetting all CSDVoIPApplicationController kill counts", v4, 2u);
  }

  v3 = +[NSUserDefaults tu_defaults];
  [v3 setObject:0 forKey:@"CSDVoIPApplicationKillCounts"];
}

- (void)_removeApplicationFromKillCountsDictionary:(id)a3
{
  id v10 = a3;
  v3 = +[NSUserDefaults tu_defaults];
  id v4 = [v3 objectForKey:@"CSDVoIPApplicationKillCounts"];

  BOOL v5 = [v10 bundleIdentifier];
  id v6 = [v4 objectForKey:v5];

  if (v6)
  {
    id v7 = [v4 mutableCopy];
    id v8 = [v10 bundleIdentifier];
    [v7 removeObjectForKey:v8];

    id v9 = +[NSUserDefaults tu_defaults];
    [v9 setObject:v7 forKey:@"CSDVoIPApplicationKillCounts"];
  }
}

- (void)_incrementKillCountForApplication:(id)a3
{
  id v17 = a3;
  v3 = +[NSUserDefaults tu_defaults];
  id v4 = [v3 objectForKey:@"CSDVoIPApplicationKillCounts"];

  if (v4)
  {
    id v5 = [v4 mutableCopy];
  }
  else
  {
    id v5 = +[NSMutableDictionary dictionaryWithCapacity:1];
  }
  id v6 = v5;
  id v7 = [v17 bundleIdentifier];
  id v8 = [v6 objectForKey:v7];
  unsigned int v9 = [v8 intValue];

  LODWORD(v7) = v9 + 1;
  id v10 = +[NSNumber numberWithInt:v9 + 1];
  id v11 = [v17 bundleIdentifier];
  [v6 setObject:v10 forKey:v11];

  id v12 = +[NSUserDefaults tu_defaults];
  [v12 setObject:v6 forKey:@"CSDVoIPApplicationKillCounts"];

  id v13 = +[CSDReportingController sharedInstance];
  id v14 = [v17 bundleIdentifier];
  [v13 voipAppFailedToPostIncomingCall:v14];

  if (v7 == 3)
  {
    unsigned __int8 v15 = +[CSDReportingController sharedInstance];
    uint64_t v16 = [v17 bundleIdentifier];
    [v15 voipAppBecameDisabledFromLaunching:v16];
  }
}

- (BOOL)_isApplicationPreventedFromBeingLaunched:(id)a3
{
  id v3 = a3;
  if ([v3 requiresStrictPolicyEnforcement])
  {
    id v4 = +[NSUserDefaults tu_defaults];
    id v5 = [v4 objectForKey:@"CSDVoIPApplicationKillCounts"];
    id v6 = [v3 bundleIdentifier];
    id v7 = [v5 objectForKey:v6];

    BOOL v8 = (int)[v7 intValue] > 2;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_appHasOngoingCall:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDVoIPApplicationController *)self callStateController];
  id v6 = [v4 bundleIdentifier];

  LOBYTE(v4) = [v5 isTrackingVoIPCallForBundleIdentifier:v6];
  return (char)v4;
}

+ (id)bundleIdFromTopic:(id)a3
{
  id v3 = a3;
  id v4 = @"voip-ptt";
  if (![v3 hasSuffix:@"voip-ptt"]) {
    id v4 = @"voip";
  }
  id v5 = objc_msgSend(v3, "substringWithRange:", 0, (char *)objc_msgSend(v3, "length") + ~(unint64_t)-[__CFString length](v4, "length"));

  return v5;
}

+ (id)topicFromBundleId:(id)a3 forType:(int)a4
{
  CFStringRef v4 = @"voip";
  if (a4 == 3) {
    CFStringRef v4 = @"voip-ptt";
  }
  return +[NSString stringWithFormat:@"%@.%@", a3, v4];
}

- (id)_findOrCreateApplicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDVoIPApplicationController *)self bundleIdentifierToVoIPApplication];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    id v6 = [[CSDVoIPApplication alloc] initWithBundleIdentifier:v4];
    id v7 = [(CSDVoIPApplicationController *)self bundleIdentifierToVoIPApplication];
    [v7 setObject:v6 forKeyedSubscript:v4];

    BOOL v8 = [(CSDVoIPApplicationController *)self applicationMonitor];
    [v8 addVoIPApplication:v6];
  }

  return v6;
}

- (void)_pruneUninstalledAppPushTopics
{
  id v3 = [(CSDVoIPApplicationController *)self developmentConnection];
  [(CSDVoIPApplicationController *)self _pruneUninstalledAppPushTopicsForConnection:v3];

  id v4 = [(CSDVoIPApplicationController *)self productionConnection];
  [(CSDVoIPApplicationController *)self _pruneUninstalledAppPushTopicsForConnection:v4];
}

- (void)_pruneUninstalledAppPushTopicsForConnection:(id)a3
{
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v24 = a3;
  id v4 = [v24 enabledTopics];
  id v5 = [v4 copy];

  id v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    id v7 = v6;
    int v26 = 0;
    uint64_t v8 = *(void *)v29;
    id obj = v5;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v11 = [(id)objc_opt_class() bundleIdFromTopic:v10];
        id v12 = objc_alloc((Class)LSApplicationRecord);
        id v27 = 0;
        id v13 = [v12 initWithBundleIdentifier:v11 allowPlaceholder:1 error:&v27];
        id v14 = v27;
        unsigned __int8 v15 = v14;
        if (v14)
        {
          if ([v14 code] != (id)-10814
            || ([v15 domain],
                uint64_t v16 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v17 = [v16 isEqualToString:NSOSStatusErrorDomain],
                v16,
                (v17 & 1) == 0))
          {
            __int16 v23 = sub_100008DCC();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
              sub_1003ADFA4();
            }

            int v19 = obj;
            goto LABEL_25;
          }
        }
        if (!v13)
        {
          id v18 = sub_100008DCC();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            long long v33 = v11;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "We found an enabled VOIP topic for %@ that is no longer installed. Invalidating its push token", buf, 0xCu);
          }
          ++v26;

          [(CSDVoIPApplicationController *)self _removeTopic:v10 fromConnection:v24];
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v7) {
        continue;
      }
      break;
    }

    if (v26 >= 1)
    {
      int v19 = sub_100008DCC();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v33) = v26;
      id v20 = "[WARN] Ran nightly VOIP reconciliation and found %d discrepencies";
      __int16 v21 = v19;
      uint32_t v22 = 8;
      goto LABEL_24;
    }
  }
  else
  {
  }
  int v19 = sub_100008DCC();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v20 = "Ran nightly VOIP reconciliation and didn't find any discrepencies.";
    __int16 v21 = v19;
    uint32_t v22 = 2;
LABEL_24:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
  }
LABEL_25:
}

- (id)_apsConnectionForEnvironment:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:APSEnvironmentProduction])
  {
    productionConnection = self->_productionConnection;
    if (!productionConnection)
    {
      id v6 = [(CSDVoIPApplicationController *)self _createAPSConnectionForEnvironment:v4 namedDelegatePort:@"com.apple.telephonyutilities.callservicesdaemon.voip.push"];
      id v7 = self->_productionConnection;
      self->_productionConnection = v6;

      productionConnection = self->_productionConnection;
    }
LABEL_7:
    uint64_t v10 = productionConnection;
    goto LABEL_11;
  }
  if ([v4 isEqualToString:APSEnvironmentDevelopment])
  {
    productionConnection = self->_developmentConnection;
    if (!productionConnection)
    {
      uint64_t v8 = [(CSDVoIPApplicationController *)self _createAPSConnectionForEnvironment:v4 namedDelegatePort:@"com.apple.telephonyutilities.callservicesdaemon.voip.push.development"];
      developmentConnection = self->_developmentConnection;
      self->_developmentConnection = v8;

      productionConnection = self->_developmentConnection;
    }
    goto LABEL_7;
  }
  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[WARN] No APS connection found for environment %@", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v10 = 0;
LABEL_11:

  return v10;
}

- (id)_createAPSConnectionForEnvironment:(id)a3 namedDelegatePort:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)APSConnection);
  unsigned int v9 = [(CSDVoIPApplicationController *)self queue];
  id v10 = [v8 initWithEnvironmentName:v7 namedDelegatePort:v6 queue:v9];

  [v10 setDelegate:self];

  return v10;
}

- (void)_registerNetworkExtensionApplicationWithBundleIdentifier:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Registering client process %@ with bundle identifier %@ for NetworkExtension VoIP", (uint8_t *)&v12, 0x16u);
  }

  unsigned int v9 = [(CSDVoIPApplicationController *)self _findOrCreateApplicationWithBundleIdentifier:v6];
  if ([v9 hasVoIPBackgroundMode]
    && [v9 hasVoIPNetworkExtensionEntitlement])
  {
    [v9 setNetworkExtensionClient:v7];
  }
  else
  {
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1003AE00C((uint64_t)v6, v9, v10);
    }

    id v11 = [(CSDVoIPApplicationController *)self bundleIdentifierToVoIPApplication];
    [v11 removeObjectForKey:v6];
  }
}

- (void)_registerForPushTokenWithType:(int)a3 client:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "", (uint8_t *)&v14, 2u);
  }

  id v8 = [v6 processBundleIdentifier];
  unsigned int v9 = [v6 valueForEntitlement:@"aps-environment"];
  id v10 = sub_100008DCC();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8 && v9)
  {
    if (v11)
    {
      int v12 = @"channel";
      if (v4 != 3) {
        int v12 = 0;
      }
      if (v4 == 2) {
        int v12 = @"voip";
      }
      id v13 = v12;
      int v14 = 138412802;
      *(void *)id v15 = v8;
      *(_WORD *)&v15[8] = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      id v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Asked to register bundle ID %@ with APS environment %@ for VoIP type %@", (uint8_t *)&v14, 0x20u);
    }
    [(CSDVoIPApplicationController *)self _registerPushApplicationWithBundleIdentifier:v8 client:v6 environment:v9 pushType:v4];
  }
  else
  {
    if (v11)
    {
      int v14 = 67109632;
      *(_DWORD *)id v15 = v8 == 0;
      *(_WORD *)&v15[4] = 1024;
      *(_DWORD *)&v15[6] = v9 == 0;
      LOWORD(v16) = 1024;
      *(_DWORD *)((char *)&v16 + 2) = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring voipRegister request because either no bundleIdentifier could be determined (%d) or no environment could be determined (%d) type %d", (uint8_t *)&v14, 0x14u);
    }
  }
}

- (void)_unregisterForPushTokenWithType:(int)a3 client:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "", (uint8_t *)&v13, 2u);
  }

  id v8 = [v6 processBundleIdentifier];
  unsigned int v9 = [v6 valueForEntitlement:@"aps-environment"];

  if (v8 && v9)
  {
    id v10 = [(CSDVoIPApplicationController *)self _findOrCreateApplicationWithBundleIdentifier:v8];
    [(CSDVoIPApplicationController *)self _unregisterPushApplication:v10 inEnvironment:v9 pushType:v4 destroyApp:0];
  }
  else
  {
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = @"channel";
      if (v4 != 3) {
        BOOL v11 = 0;
      }
      if (v4 == 2) {
        BOOL v11 = @"voip";
      }
      int v12 = v11;
      int v13 = 138543874;
      int v14 = v12;
      __int16 v15 = 1024;
      BOOL v16 = v8 == 0;
      __int16 v17 = 1024;
      BOOL v18 = v9 == 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring %{public}@ unregister request because either no bundleIdentifier could be determined (%d) or no environment could be determined (%d)", (uint8_t *)&v13, 0x18u);
    }
  }
}

- (void)_registerPushApplicationWithBundleIdentifier:(id)a3 client:(id)a4 environment:(id)a5 pushType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100008DCC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = @"channel";
    if (v6 != 3) {
      int v14 = 0;
    }
    if (v6 == 2) {
      int v14 = @"voip";
    }
    __int16 v15 = v14;
    *(_DWORD *)buf = 138413058;
    uint64_t v47 = (uint64_t)v11;
    __int16 v48 = 2112;
    *(void *)v49 = v10;
    *(_WORD *)&v49[8] = 2114;
    *(void *)&v49[10] = v15;
    __int16 v50 = 2112;
    id v51 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Registering client process %@ with bundle identifier %@ for PushKit %{public}@ in environment %@", buf, 0x2Au);
  }
  BOOL v16 = [(CSDVoIPApplicationController *)self _findOrCreateApplicationWithBundleIdentifier:v10];
  uint64_t v17 = [v16 environment];
  if (v17)
  {
    BOOL v18 = (void *)v17;
    int v19 = [v16 environment];
    unsigned __int8 v20 = [v19 isEqualToString:v12];

    if ((v20 & 1) == 0)
    {
      __int16 v21 = sub_100008DCC();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint32_t v22 = [v16 environment];
        *(_DWORD *)buf = 138412546;
        uint64_t v47 = (uint64_t)v22;
        __int16 v48 = 2112;
        *(void *)v49 = v12;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Environment was %@ but is now %@. Flushing out old registration with previous environment", buf, 0x16u);
      }
      [(CSDVoIPApplicationController *)self _unregisterPushApplication:v16 inEnvironment:0 pushType:v6 destroyApp:1];
      uint64_t v23 = [(CSDVoIPApplicationController *)self _findOrCreateApplicationWithBundleIdentifier:v10];

      BOOL v16 = (void *)v23;
    }
  }
  id v24 = [(CSDVoIPApplicationController *)self _apsConnectionForEnvironment:v12];
  if (!v24)
  {
    id v27 = sub_100008DCC();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v47 = (uint64_t)v10;
      __int16 v48 = 1024;
      *(_DWORD *)v49 = v6;
      *(_WORD *)&v49[4] = 2112;
      *(void *)&v49[6] = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Aborting PushKit registration for app %@ for type %d because no APS connection exists for the environment (%@)", buf, 0x1Cu);
    }

    goto LABEL_40;
  }
  if (v6 == 3)
  {
    if ([v16 meetsRequirementsForPTT])
    {
      v25 = [v16 channelPushToken];
      BOOL v26 = 0;
      goto LABEL_22;
    }
    long long v28 = sub_100008DCC();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_1003AE0CC();
    }
    goto LABEL_39;
  }
  BOOL v26 = v6 == 2;
  if (v6 == 2 && ([v16 hasVoIPBackgroundMode] & 1) == 0)
  {
    long long v28 = sub_100008DCC();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_1003AE134();
    }
LABEL_39:

LABEL_40:
    v25 = [(CSDVoIPApplicationController *)self bundleIdentifierToVoIPApplication];
    [v25 removeObjectForKey:v10];
    goto LABEL_41;
  }
  v25 = [v16 voipToken];
LABEL_22:
  [v16 setEnvironment:v12];
  if (v25)
  {
    if (!v26) {
      goto LABEL_25;
    }
  }
  else
  {
    id v43 = v11;
    uint64_t v29 = [(id)objc_opt_class() topicFromBundleId:v10 forType:v6];
    long long v30 = sub_100008DCC();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v47 = v29;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Requesting token for topic %@", buf, 0xCu);
    }

    [v24 requestTokenForTopic:v29 identifier:&stru_100517F40];
    v44 = (void *)v29;
    if (v6 == 3)
    {
      BOOL v42 = v26;
      uint64_t v31 = [v24 opportunisticTopics];
      long long v32 = (void *)v31;
      long long v33 = &__NSArray0__struct;
      if (v31) {
        long long v33 = (void *)v31;
      }
      id v34 = v33;

      v45 = v34;
      long long v35 = [v34 arrayByAddingObject:v29];
      [v24 _setOpportunisticTopics:v35];
      v36 = sub_100008DCC();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v47 = (uint64_t)v45;
        __int16 v48 = 2112;
        *(void *)v49 = v35;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Setting opportunistic topics from %@ to %@", buf, 0x16u);
      }

      [(CSDVoIPApplicationController *)self reconcileChannelTopicFilters];
      BOOL v26 = v42;
    }
    else
    {
      uint64_t v37 = [v24 enabledTopics];
      id v38 = (void *)v37;
      __int16 v39 = &__NSArray0__struct;
      if (v37) {
        __int16 v39 = (void *)v37;
      }
      id v40 = v39;

      v45 = v40;
      long long v35 = [v40 arrayByAddingObject:v29];
      v41 = sub_100008DCC();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v47 = (uint64_t)v45;
        __int16 v48 = 2112;
        *(void *)v49 = v35;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Setting enabled topics from %@ to %@", buf, 0x16u);
      }

      [v24 _setEnabledTopics:v35];
    }
    id v11 = v43;

    if (!v26) {
      goto LABEL_25;
    }
  }
  [v16 setPushKitClient:v11];
LABEL_25:
  if (v6 == 3) {
    [v16 setChannelPushClient:v11];
  }
LABEL_41:
}

- (void)_unregisterPushApplication:(id)a3 inEnvironment:(id)a4 pushType:(int)a5 destroyApp:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = @"channel";
    if (v7 != 3) {
      int v13 = 0;
    }
    if (v7 == 2) {
      int v13 = @"voip";
    }
    int v14 = v13;
    int v27 = 138412802;
    id v28 = v10;
    __int16 v29 = 2114;
    long long v30 = v14;
    __int16 v31 = 2112;
    id v32 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unregistering application %@ from PushKit %{public}@ in environment %@", (uint8_t *)&v27, 0x20u);
  }
  __int16 v15 = objc_opt_class();
  BOOL v16 = [v10 bundleIdentifier];
  uint64_t v17 = [v15 topicFromBundleId:v16 forType:v7];

  if (!v11)
  {
    id v11 = [v10 environment];

    if (v11)
    {
      BOOL v18 = sub_100008DCC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = [v10 environment];
        int v27 = 138412290;
        id v28 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Supplied environment was nil. Inferring it as %@", (uint8_t *)&v27, 0xCu);
      }
      id v11 = [v10 environment];
    }
  }
  unsigned __int8 v20 = [(CSDVoIPApplicationController *)self _apsConnectionForEnvironment:v11];
  __int16 v21 = sub_100008DCC();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v20)
  {
    if (v22)
    {
      int v27 = 138412546;
      id v28 = v17;
      __int16 v29 = 2112;
      long long v30 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Disabling topic %@ and invalidating its token for connection %@", (uint8_t *)&v27, 0x16u);
    }

    [(CSDVoIPApplicationController *)self _removeTopic:v17 fromConnection:v20];
    if (v6)
    {
LABEL_16:
      uint64_t v23 = [(CSDVoIPApplicationController *)self bundleIdentifierToVoIPApplication];
      id v24 = [v10 bundleIdentifier];
      [v23 removeObjectForKey:v24];

      goto LABEL_24;
    }
  }
  else
  {
    if (v22)
    {
      int v27 = 138412290;
      id v28 = v17;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Disabling topic %@ and invalidating its token for all connections", (uint8_t *)&v27, 0xCu);
    }

    v25 = [(CSDVoIPApplicationController *)self productionConnection];
    [(CSDVoIPApplicationController *)self _removeTopic:v17 fromConnection:v25];

    BOOL v26 = [(CSDVoIPApplicationController *)self developmentConnection];
    [(CSDVoIPApplicationController *)self _removeTopic:v17 fromConnection:v26];

    if (v6) {
      goto LABEL_16;
    }
  }
  if (v7 == 3)
  {
    [v10 unsetChannelPushToken];
  }
  else if (v7 == 2)
  {
    [v10 unsetVoIPToken];
  }
LABEL_24:
}

- (void)networkExtensionMessageControllerHost:(id)a3 didReceiveIncomingMessage:(id)a4 forBundleIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  unsigned int v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received incoming network extension message from application with bundle identifier %@", (uint8_t *)&v11, 0xCu);
  }

  id v10 = [[CSDVoIPApplicationMessage alloc] initWithTransportType:1 payload:v8];
  [(CSDVoIPApplicationController *)self openApplicationWithBundleIdentifier:v7 message:v10];
}

- (void)networkExtensionMessageControllerHost:(id)a3 didReceiveIncomingPushToTalkMessage:(id)a4 forBundleIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  unsigned int v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received incoming network extension PushToTalk message from application with bundle identifier %@", (uint8_t *)&v15, 0xCu);
  }

  id v10 = [(CSDVoIPApplicationController *)self persistedChannelRegistry];
  int v11 = [v10 activePersistedChannelIdentity];

  id v12 = [v11 bundleIdentifier];
  unsigned __int8 v13 = [v12 isEqualToString:v8];

  if (v13)
  {
    int v14 = [(CSDVoIPApplicationController *)self createPTTApplicationMessageForChannel:v11 withPayload:v7 isWakingMessage:1];
    [(CSDVoIPApplicationController *)self openApplicationWithBundleIdentifier:v8 message:v14];
  }
  else
  {
    int v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_1003AE19C();
    }
  }
}

- (void)_removeTopic:(id)a3 fromConnection:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 enabledTopics];
  id v12 = [v7 mutableCopy];

  [v12 removeObject:v6];
  [v5 _setEnabledTopics:v12];
  id v8 = [v5 opportunisticTopics];
  id v9 = [v8 mutableCopy];

  [v9 removeObject:v6];
  [v5 _setOpportunisticTopics:v9];
  id v10 = [v5 ignoredTopics];
  id v11 = [v10 mutableCopy];

  [v11 removeObject:v6];
  [v5 _setIgnoredTopics:v11];
  [v5 invalidateTokenForTopic:v6 identifier:&stru_100517F40];
}

- (void)addOutstandingMessage:(id)a3 forBundleIdentifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(CSDVoIPApplicationController *)self outstandingMessages];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8)
  {
    id v8 = objc_alloc_init((Class)NSMutableArray);
    id v9 = [(CSDVoIPApplicationController *)self outstandingMessages];
    [v9 setObject:v8 forKeyedSubscript:v6];
  }
  [v8 addObject:v10];
}

- (BOOL)containsAnyOutstandingMessageForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDVoIPApplicationController *)self outstandingMessages];
  id v6 = [v5 objectForKeyedSubscript:v4];

  LOBYTE(v5) = [v6 count] != 0;
  return (char)v5;
}

- (BOOL)containsOutstandingMessage:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDVoIPApplicationController *)self outstandingMessages];
  id v9 = [v8 objectForKeyedSubscript:v6];

  LOBYTE(v8) = [v9 containsObject:v7];
  return (char)v8;
}

- (void)removeOutstandingMessagesForBundleIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016FE58;
  v7[3] = &unk_100504F10;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)openApplicationWithBundleIdentifier:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDVoIPApplicationController *)self _findOrCreateApplicationWithBundleIdentifier:v6];
  id v9 = [v7 transportType];
  if (v9 == (id)3)
  {
    dispatch_time_t when = 3;
    BOOL v69 = 1;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v10 = [v7 isServiceUpdateMessage];
      unsigned int v11 = [v7 isWakingMessage];
      id v12 = [(CSDVoIPApplicationController *)self pttServiceUpdatePushMonitor];
      uint64_t v13 = (uint64_t)[v12 remainingPTTWakingServiceUpdateBudgetForApplication:v8];

      [v7 setRemainingHighPriorityServiceUpdateBudget:v13];
      if ((v10 & v11) == 1)
      {
        if (v13 < 1)
        {
          [(CSDVoIPApplicationController *)self processOverBudgetPTTServiceUpdateMessage:v7 forApplication:v8];
          goto LABEL_54;
        }
        int v14 = [(CSDVoIPApplicationController *)self pttServiceUpdatePushMonitor];
        [v14 incrementPTTWakingServiceUpdateCountForApplication:v8];

        [v7 setRemainingHighPriorityServiceUpdateBudget:v13 - 1];
      }
    }
    else
    {
      unsigned int v10 = 0;
    }
    [(CSDVoIPApplicationController *)self _isApplicationPreventedFromBeingLaunched:v8];
    unsigned int v19 = [v8 requiresStrictPolicyEnforcement];
    unsigned __int8 v20 = [(CSDVoIPApplicationController *)self containsAnyOutstandingMessageForBundleIdentifier:v6];
    int v21 = 0;
    unsigned int v72 = v19;
    if ((v10 & 1) == 0 && (v20 & 1) == 0)
    {
      [(CSDVoIPApplicationController *)self addOutstandingMessage:v7 forBundleIdentifier:v6];
      unsigned int v10 = 0;
      int v21 = 1;
    }
    goto LABEL_15;
  }
  if (![(CSDVoIPApplicationController *)self _isApplicationPreventedFromBeingLaunched:v8])
  {
    dispatch_time_t when = (dispatch_time_t)v9;
    BOOL v69 = v9 == (id)3;
    unsigned int v72 = [v8 requiresStrictPolicyEnforcement];
    BOOL v22 = [(CSDVoIPApplicationController *)self applicationMonitor];
    if (([v22 isRunningForegroundForVoIPApplication:v8] & 1) != 0
      || [(CSDVoIPApplicationController *)self _appHasOngoingCall:v8])
    {
    }
    else
    {
      unsigned __int8 v57 = [(CSDVoIPApplicationController *)self containsAnyOutstandingMessageForBundleIdentifier:v6];

      if ((v57 & 1) == 0)
      {
        [(CSDVoIPApplicationController *)self addOutstandingMessage:v7 forBundleIdentifier:v6];
        unsigned int v10 = 0;
        int v21 = v72;
LABEL_15:
        unsigned int v68 = v21;
LABEL_20:
        uint64_t v23 = sub_100008DCC();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v8;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Attempting to open application %@ and acquire a process assertion", (uint8_t *)&buf, 0xCu);
        }

        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v91 = 0x2020000000;
        char v92 = 0;
        dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
        id v25 = objc_alloc_init((Class)_LSOpenConfiguration);
        uint64_t v88 = FBSOpenApplicationOptionKeyActivateSuspended;
        v89 = &__kCFBooleanTrue;
        BOOL v26 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
        [v25 setFrontBoardOptions:v26];

        int v27 = +[LSApplicationWorkspace defaultWorkspace];
        v82[0] = _NSConcreteStackBlock;
        v82[1] = 3221225472;
        v82[2] = sub_1001706C4;
        v82[3] = &unk_100508CB8;
        id v28 = v6;
        id v83 = v28;
        p_long long buf = &buf;
        __int16 v29 = v24;
        v84 = v29;
        [v27 openApplicationWithBundleIdentifier:v28 configuration:v25 completionHandler:v82];

        dispatch_time_t v30 = dispatch_time(0, 20000000000);
        intptr_t v31 = dispatch_semaphore_wait(v29, v30);
        if (*(unsigned char *)(*((void *)&buf + 1) + 24))
        {
          id v32 = sub_100008DCC();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            sub_1003AE274(v32, v33, v34, v35, v36, v37, v38, v39);
          }
        }
        else if (v31)
        {
          id v32 = sub_100008DCC();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            sub_1003AE23C(v32, v40, v41, v42, v43, v44, v45, v46);
          }
        }
        else
        {
          v49 = sub_100008DCC();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v86 = 0;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Successfully opened application", v86, 2u);
          }

          id v32 = +[CSDVoIPProcessAssertion processAssertionWithBundleIdentifier:v28];
          if ([v32 acquire])
          {
            __int16 v50 = sub_100008DCC();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v86 = 0;
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Successfully took out process assertion", v86, 2u);
            }

            uint64_t v51 = 7000000000;
            if (!((when == 3) | v72)) {
              uint64_t v51 = 30000000000;
            }
            if (v10) {
              int64_t v52 = 30000000000;
            }
            else {
              int64_t v52 = v51;
            }
            dispatch_time_t whena = dispatch_time(0, v52);
            v53 = [(CSDVoIPApplicationController *)self queue];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1001707D8;
            block[3] = &unk_100508CE0;
            v67 = v28;
            v74 = v67;
            v54 = v32;
            BOOL v79 = v69;
            v75 = v54;
            v76 = self;
            id v55 = v7;
            id v77 = v55;
            id v56 = v8;
            id v78 = v56;
            char v80 = v72;
            char v81 = v68;
            dispatch_after(whena, v53, block);

            if (v56)
            {
              [v56 deliverMessage:v55 withAssertion:v54 applicationShouldPostIncomingCall:v68];
            }
            else
            {
              v66 = sub_100008DCC();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v86 = 138412290;
                v87 = v67;
                _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "[WARN] No existing VoIP application found for bundle ID %@", v86, 0xCu);
              }
            }
            v58 = v74;
          }
          else
          {
            v58 = sub_100008DCC();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
              sub_1003AE204(v58, v59, v60, v61, v62, v63, v64, v65);
            }
          }
        }
        _Block_object_dispose(&buf, 8);
        goto LABEL_54;
      }
    }
    unsigned int v10 = 0;
    unsigned int v68 = 0;
    goto LABEL_20;
  }
  int v15 = [(CSDVoIPApplicationController *)self applicationMonitor];
  unsigned int v16 = [v15 isRunningForegroundForVoIPApplication:v8];

  uint64_t v17 = sub_100008DCC();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Application %@ will not be launched because it failed to report an incoming call too many times or repeatedly crashed. However because the app is foreground, delivering VOIP payload anyway.", (uint8_t *)&buf, 0xCu);
    }

    [v8 deliverMessage:v7 withAssertion:0 applicationShouldPostIncomingCall:0];
  }
  else
  {
    if (v18)
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Application %@ will not be launched because it failed to report an incoming call too many times (or repeatedly crashed.)", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v47 = +[CSDReportingController sharedInstance];
    __int16 v48 = [v8 bundleIdentifier];
    [v47 voipPushDroppedOnTheFloor:v48];
  }
LABEL_54:
}

- (void)notificationServiceExtensionHost:(id)a3 didReceiveIncomingMessage:(id)a4 forBundleIdentifier:(id)a5 reply:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = (void (**)(id, void))a6;
  id v12 = [(CSDVoIPApplicationController *)self _findOrCreateApplicationWithBundleIdentifier:v10];
  if ([v12 hasVoIPBackgroundMode])
  {
    uint64_t v13 = [[CSDVoIPApplicationMessage alloc] initWithTransportType:2 payload:v9];
    [(CSDVoIPApplicationController *)self openApplicationWithBundleIdentifier:v10 message:v13];
    if (v11) {
      v11[2](v11, 0);
    }
  }
  else
  {
    int v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1003AE464((uint64_t)v10, v12, v14);
    }

    int v15 = [(CSDVoIPApplicationController *)self bundleIdentifierToVoIPApplication];
    [v15 removeObjectForKey:v10];

    if (v11)
    {
      unsigned int v16 = +[NSError cx_errorWithCode:3];
      ((void (**)(id, void *))v11)[2](v11, v16);
    }
  }
}

- (void)activePersistedChannelIdentityChangedTo:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100170D70;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)handlePTTAppReportedValidActiveRemoteParticipant:(id)a3
{
  id v4 = [a3 object];
  id v5 = [v4 provider];
  id v6 = [v5 bundleIdentifier];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Channel: app posted a valid remote participant %@", (uint8_t *)&v8, 0xCu);
    }

    [(CSDVoIPApplicationController *)self removeOutstandingMessagesForBundleIdentifier:v6];
  }
}

- (void)reconcileChannelTopicFilters
{
  id v3 = [(CSDVoIPApplicationController *)self persistedChannelRegistry];
  id v4 = [v3 activePersistedChannelIdentity];

  id v5 = [(CSDVoIPApplicationController *)self developmentConnection];
  [(CSDVoIPApplicationController *)self _moveOpportunisticTopicsToIgnoredListForConnection:v5];

  id v6 = [(CSDVoIPApplicationController *)self productionConnection];
  [(CSDVoIPApplicationController *)self _moveOpportunisticTopicsToIgnoredListForConnection:v6];

  if (v4)
  {
    id v7 = [v4 bundleIdentifier];
    int v8 = [(CSDVoIPApplicationController *)self _findOrCreateApplicationWithBundleIdentifier:v7];

    if (v8)
    {
      id v9 = [v8 environment];
      if (!v9)
      {
        id v10 = sub_100008DCC();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
          sub_1003AE60C(v4, v10);
        }

        id v9 = [v8 pushEnvironmentAccordingToLaunchServices];
      }
      unsigned int v11 = [(CSDVoIPApplicationController *)self _apsConnectionForEnvironment:v9];
      if (v11)
      {
        id v12 = objc_opt_class();
        uint64_t v13 = [v4 bundleIdentifier];
        int v14 = [v12 topicFromBundleId:v13 forType:3];

        unsigned int v16 = v14;
        int v15 = +[NSArray arrayWithObjects:&v16 count:1];
        [v11 _setOpportunisticTopics:v15];
      }
      else
      {
        int v14 = sub_100008DCC();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1003AE588(v4);
        }
      }
    }
    else
    {
      id v9 = sub_100008DCC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1003AE504(v4);
      }
    }
  }
}

- (void)_moveOpportunisticTopicsToIgnoredListForConnection:(id)a3
{
  id v13 = a3;
  uint64_t v3 = [v13 opportunisticTopics];
  id v4 = (void *)v3;
  id v5 = &__NSArray0__struct;
  if (v3) {
    id v5 = (void *)v3;
  }
  id v6 = v5;

  id v7 = [v13 ignoredTopics];
  id v8 = [v7 mutableCopy];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = +[NSMutableArray array];
  }
  unsigned int v11 = v10;

  [v11 addObjectsFromArray:v6];
  id v12 = [v11 copy];
  [v13 _setIgnoredTopics:v12];

  [v13 _setOpportunisticTopics:&__NSArray0__struct];
}

- (void)pttCheckInWithReply:(id)a3
{
  id v4 = (void (**)(id, uint64_t, id))a3;
  id v5 = [(CSDVoIPApplicationController *)self channelClientManager];
  id v6 = [v5 currentClient];

  id v7 = [v6 processBundleIdentifier];
  id v8 = [(CSDVoIPApplicationController *)self _findOrCreateApplicationWithBundleIdentifier:v7];
  if ([v8 meetsRequirementsForPTT])
  {
    id v9 = [(CSDVoIPApplicationController *)self persistedChannelRegistry];
    id v10 = [v9 persistedTornDownChannelUUIDForBundleIdentifier:v7];

    if (v10)
    {
      [v8 dropUndeliveredChannelPushesOnTheFloor];
      unsigned int v11 = [(CSDVoIPApplicationController *)self persistedChannelRegistry];
      [v11 clearPendingChannelTeardownAcknowledgementsForBundleIdentfier:v7];

      id v12 = [objc_alloc((Class)NSUUID) initWithUUIDString:v10];
      v4[2](v4, 2, v12);
    }
    else
    {
      id v13 = [(CSDVoIPApplicationController *)self persistedChannelRegistry];
      id v12 = [v13 activePersistedChannelIdentity];

      if (v12
        && ([v12 bundleIdentifier],
            int v14 = objc_claimAutoreleasedReturnValue(),
            unsigned int v15 = [v14 isEqualToString:v7],
            v14,
            v15))
      {
        unsigned int v16 = [v12 channelUUID];
        if ([v8 hasPendingChannelPushMessagesToDeliver]) {
          uint64_t v17 = 1;
        }
        else {
          uint64_t v17 = 3;
        }
        v4[2](v4, v17, v16);
      }
      else
      {
        v4[2](v4, 0, 0);
      }
    }

    [v8 setChannelPushClient:v6];
  }
  else
  {
    v4[2](v4, 4, 0);
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1003AE6A0();
    }
  }
}

- (void)pttRegister
{
  id v4 = [(CSDVoIPApplicationController *)self channelClientManager];
  uint64_t v3 = [v4 currentClient];
  [(CSDVoIPApplicationController *)self _registerForPushTokenWithType:3 client:v3];
}

- (void)pttUnregister
{
  id v4 = [(CSDVoIPApplicationController *)self channelClientManager];
  uint64_t v3 = [v4 currentClient];
  [(CSDVoIPApplicationController *)self _unregisterForPushTokenWithType:3 client:v3];
}

- (void)displayPTTDeprecationAlert:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  id v5 = TUBundle();
  id v6 = [v5 localizedStringForKey:@"PUSH_TO_TALK_APP_REQUIRES_UPDATES_TITLE" value:&stru_100517F40 table:@"TelephonyUtilities"];
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v3);

  [v4 setObject:v7 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];
  id v8 = TUBundle();
  id v9 = [v8 localizedStringForKey:@"PUSH_TO_TALK_APP_REQUIRES_UPDATES_MESSAGE" value:&stru_100517F40 table:@"TelephonyUtilities"];
  [v4 setObject:v9 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

  id v10 = TUBundle();
  unsigned int v11 = [v10 localizedStringForKey:@"OK" value:&stru_100517F40 table:@"TelephonyUtilities"];
  [v4 setObject:v11 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:kCFUserNotificationAlertTopMostKey];
  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationForcesModalAlertAppearance];
  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:SBUserNotificationDisplayActionButtonOnLockScreen];
  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationAllowMenuButtonDismissal];
  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationDismissOnLock];
  SInt32 error = 0;
  CFUserNotificationRef v12 = CFUserNotificationCreate(0, 0.0, 0, &error, (CFDictionaryRef)v4);
  if (v12) {
    CFRelease(v12);
  }
}

- (void)updatePTTDeprecationAlertLogForApplication:(id)a3
{
  id v3 = a3;
  id v4 = +[NSUserDefaults tu_defaults];
  id v10 = [v4 objectForKey:@"CSDPTTDeprecationAlertLog"];

  if (v10)
  {
    id v5 = [v10 mutableCopy];
  }
  else
  {
    id v5 = +[NSMutableDictionary dictionaryWithCapacity:1];
  }
  id v6 = v5;
  id v7 = +[NSDate date];
  id v8 = [v3 bundleIdentifier];

  [v6 setObject:v7 forKey:v8];
  id v9 = +[NSUserDefaults tu_defaults];
  [v9 setObject:v6 forKey:@"CSDPTTDeprecationAlertLog"];
}

- (BOOL)pttDeprecationAlertWaitingPeriodHasPassedForApplication:(id)a3
{
  id v3 = a3;
  id v4 = +[NSUserDefaults tu_defaults];
  id v5 = [v4 objectForKey:@"CSDPTTDeprecationAlertLog"];
  id v6 = [v3 bundleIdentifier];

  id v7 = [v5 objectForKey:v6];

  if (v7)
  {
    id v8 = +[NSDate date];
    [v8 timeIntervalSinceDate:v7];
    double v10 = v9;

    BOOL v11 = v10 > 86400.0;
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (void)removeApplicationFromPTTDeprecationAlertDictionary:(id)a3
{
  id v10 = a3;
  id v3 = +[NSUserDefaults tu_defaults];
  id v4 = [v3 objectForKey:@"CSDPTTDeprecationAlertLog"];

  id v5 = [v10 bundleIdentifier];
  id v6 = [v4 objectForKey:v5];

  if (v6)
  {
    id v7 = [v4 mutableCopy];
    id v8 = [v10 bundleIdentifier];
    [v7 removeObjectForKey:v8];

    double v9 = +[NSUserDefaults tu_defaults];
    [v9 setObject:v7 forKey:@"CSDPTTDeprecationAlertLog"];
  }
}

- (void)processOverBudgetPTTServiceUpdateMessage:(id)a3 forApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDVoIPApplicationController *)self applicationMonitor];
  unsigned int v9 = [v8 isRunningForegroundForVoIPApplication:v7];

  id v10 = sub_100008DCC();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      CFUserNotificationRef v12 = [v7 bundleIdentifier];
      int v16 = 138412290;
      uint64_t v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Application %@ will not be launched because the number of PushToTalk Service Update Messages have exceeded the allotted budget. However because the app is foreground, delivering Service Update Message anyway.", (uint8_t *)&v16, 0xCu);
    }
    [v7 deliverMessage:v6 withAssertion:0 applicationShouldPostIncomingCall:0];
  }
  else
  {
    if (v11)
    {
      id v13 = [v7 bundleIdentifier];
      int v16 = 138412290;
      uint64_t v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Application %@ will not be launched because the number of PushToTalk Service Update Messages have exceeded the allotted budget.", (uint8_t *)&v16, 0xCu);
    }
    if ([v7 isDevelopmentOrTestFlightApp]
      && MKBGetDeviceLockState() != 1
      && MKBGetDeviceLockState() != 2)
    {
      int v14 = [(CSDVoIPApplicationController *)self pttServiceUpdatePushMonitor];
      unsigned int v15 = [v7 localizedAppName];
      [v14 displayPTTServiceUpdateOverBugetAlert:v15];
    }
  }
}

- (CSDCallStateController)callStateController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_callStateController);

  return (CSDCallStateController *)WeakRetained;
}

- (void)setCallStateController:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CSDClientManager)networkExtensionClientManager
{
  return self->_networkExtensionClientManager;
}

- (void)setNetworkExtensionClientManager:(id)a3
{
}

- (CSDClientManager)pushKitClientManager
{
  return self->_pushKitClientManager;
}

- (void)setPushKitClientManager:(id)a3
{
}

- (CSDClientManager)channelClientManager
{
  return self->_channelClientManager;
}

- (void)setChannelClientManager:(id)a3
{
}

- (CSDPersistedChannelRegistry)persistedChannelRegistry
{
  return self->_persistedChannelRegistry;
}

- (void)setPersistedChannelRegistry:(id)a3
{
}

- (CSDPTTServiceUpdatePushMonitor)pttServiceUpdatePushMonitor
{
  return self->_pttServiceUpdatePushMonitor;
}

- (void)setPttServiceUpdatePushMonitor:(id)a3
{
}

- (APSConnection)productionConnection
{
  return self->_productionConnection;
}

- (void)setProductionConnection:(id)a3
{
}

- (APSConnection)developmentConnection
{
  return self->_developmentConnection;
}

- (void)setDevelopmentConnection:(id)a3
{
}

- (CXNetworkExtensionMessageControllerHost)networkExtensionMessageHost
{
  return self->_networkExtensionMessageHost;
}

- (CXNotificationServiceExtensionVoIPXPCHost)nseMessageHost
{
  return self->_nseMessageHost;
}

- (NSMutableDictionary)bundleIdentifierToVoIPApplication
{
  return self->_bundleIdentifierToVoIPApplication;
}

- (void)setBundleIdentifierToVoIPApplication:(id)a3
{
}

- (CSDVoIPApplicationMonitor)applicationMonitor
{
  return self->_applicationMonitor;
}

- (NSMutableDictionary)outstandingMessages
{
  return self->_outstandingMessages;
}

- (CSDVoIPDOSCache)voIPDOSCache
{
  return self->_voIPDOSCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voIPDOSCache, 0);
  objc_storeStrong((id *)&self->_outstandingMessages, 0);
  objc_storeStrong((id *)&self->_applicationMonitor, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierToVoIPApplication, 0);
  objc_storeStrong((id *)&self->_nseMessageHost, 0);
  objc_storeStrong((id *)&self->_networkExtensionMessageHost, 0);
  objc_storeStrong((id *)&self->_developmentConnection, 0);
  objc_storeStrong((id *)&self->_productionConnection, 0);
  objc_storeStrong((id *)&self->_pttServiceUpdatePushMonitor, 0);
  objc_storeStrong((id *)&self->_persistedChannelRegistry, 0);
  objc_storeStrong((id *)&self->_channelClientManager, 0);
  objc_storeStrong((id *)&self->_pushKitClientManager, 0);
  objc_storeStrong((id *)&self->_networkExtensionClientManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_callStateController);
}

@end